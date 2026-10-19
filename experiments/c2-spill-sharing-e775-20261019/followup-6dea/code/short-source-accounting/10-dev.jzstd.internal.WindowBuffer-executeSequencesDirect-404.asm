00000 e83b9c7717                     call       0x7fefdf5e2640
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8570260000                   jne        0x7fefc7e6b09e
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
00128 49ba808d6cdfef7f0000           movabs     r10, 0x7fefdf6c8d80
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f849d180000                   je         0x7fefc7e6a3e8
0014b 458b1a                         mov        r11d, dword ptr [r10]
0014e 41c1eb0d                       shr        r11d, 0xd
00152 4181fb15410000                 cmp        r11d, 0x4115
00159 0f8585200000                   jne        0x7fefc7e6abe4
0015f 4c891424                       mov        qword ptr [rsp], r10
00163 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00168 4d85d2                         test       r10, r10
0016b 0f8483180000                   je         0x7fefc7e6a3f4
00171 458b12                         mov        r10d, dword ptr [r10]
00174 41c1ea0d                       shr        r10d, 0xd
00178 4181fadd050000                 cmp        r10d, 0x5dd
0017f 0f855f200000                   jne        0x7fefc7e6abe4
00185 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0018a 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00192 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00197 4d85d2                         test       r10, r10
0019a 0f8464180000                   je         0x7fefc7e6a404
001a0 458b1a                         mov        r11d, dword ptr [r10]
001a3 41c1eb0d                       shr        r11d, 0xd
001a7 4181fbe0050000                 cmp        r11d, 0x5e0
001ae 0f8530200000                   jne        0x7fefc7e6abe4
001b4 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001bc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c1 4d85d2                         test       r10, r10
001c4 0f844a180000                   je         0x7fefc7e6a414
001ca 458b12                         mov        r10d, dword ptr [r10]
001cd 41c1ea0d                       shr        r10d, 0xd
001d1 4181fadf050000                 cmp        r10d, 0x5df
001d8 0f8506200000                   jne        0x7fefc7e6abe4
001de 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001e8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001ed 4d85d2                         test       r10, r10
001f0 0f842b180000                   je         0x7fefc7e6a421
001f6 458b1a                         mov        r11d, dword ptr [r10]
001f9 41c1eb0d                       shr        r11d, 0xd
001fd 4181fbdf050000                 cmp        r11d, 0x5df
00204 0f85da1f0000                   jne        0x7fefc7e6abe4
0020a 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00212 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00217 458b12                         mov        r10d, dword ptr [r10]
0021a 41c1ea0d                       shr        r10d, 0xd
0021e 4181fadd050000                 cmp        r10d, 0x5dd
00225 0f85b91f0000                   jne        0x7fefc7e6abe4
0022b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00230 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00238 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0023c 44895c2408                     mov        dword ptr [rsp + 8], r11d
00241 4183c3f9                       add        r11d, -7
00245 4585db                         test       r11d, r11d
00248 0f8ce01f0000                   jl         0x7fefc7e6ac2e
0024e 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00253 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00258 448b542408                     mov        r10d, dword ptr [rsp + 8]
0025d 4183c2f1                       add        r10d, -0xf
00261 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00266 4183c3f9                       add        r11d, -7
0026a 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00272 e91c020000                     jmp        0x7fefc7e68e93
00277 458bdd                         mov        r11d, r13d
0027a 4d63d3                         movsxd     r10, r11d
0027d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00284 c442a8f5db                     bzhi       r11, r11, r10
00289 c4c1fb92fb                     kmovq      k7, r11
0028e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00294 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0029a 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
002a2 4503d5                         add        r10d, r13d
002a5 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
002ad 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002b1 418502                         test       dword ptr [r10], eax
002b4 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002bc 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
002c4 0f8dae090000                   jge        0x7fefc7e69678
002ca 8bdd                           mov        ebx, ebp
002cc 448bcb                         mov        r9d, ebx
002cf 442b8c24cc000000               sub        r9d, dword ptr [rsp + 0xcc]
002d7 448bac2494000000               mov        r13d, dword ptr [rsp + 0x94]
002df 442bac24cc000000               sub        r13d, dword ptr [rsp + 0xcc]
002e7 443bac24cc000000               cmp        r13d, dword ptr [rsp + 0xcc]
002ef 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002f7 450f4feb                       cmovg      r13d, r11d
002fb 4585c9                         test       r9d, r9d
002fe 0f8c2d170000                   jl         0x7fefc7e6a431
00304 85db                           test       ebx, ebx
00306 0f8c25170000                   jl         0x7fefc7e6a431
0030c 478d1429                       lea        r10d, [r9 + r13]
00310 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00315 453bda                         cmp        r11d, r10d
00318 0f8213170000                   jb         0x7fefc7e6a431
0031e 428d2c2b                       lea        ebp, [rbx + r13]
00322 443bdd                         cmp        r11d, ebp
00325 0f8206170000                   jb         0x7fefc7e6a431
0032b 4585ed                         test       r13d, r13d
0032e 0f8cfd160000                   jl         0x7fefc7e6a431
00334 4585ed                         test       r13d, r13d
00337 0f845dffffff                   je         0x7fefc7e68c9a
0033d 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00345 498d741a08                     lea        rsi, [r10 + rbx + 8]
0034a 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
0034f 4963d5                         movsxd     rdx, r13d
00352 4883fa20                       cmp        rdx, 0x20
00356 0f861bffffff                   jbe        0x7fefc7e68c77
0035c c5f877                         vzeroupper 
0035f 49ba204f8ec7ef7f0000           movabs     r10, 0x7fefc78e4f20
00369 41ffd2                         call       r10
0036c 0f1f840000000000               nop        dword ptr [rax + rax]
00374 e921ffffff                     jmp        0x7fefc7e68c9a
00379 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00381 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00389 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00390 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00397 4103da                         add        ebx, r10d
0039a 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
0039f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
003a4 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
003ac e98d020000                     jmp        0x7fefc7e6903e
003b1 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
003b9 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003be 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003c6 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
003cb 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003d3 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
003db 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003e3 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003eb 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
003f3 0f8c06060000                   jl         0x7fefc7e693ff
003f9 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00401 4183fb30                       cmp        r11d, 0x30
00405 7e7c                           jle        0x7fefc7e68e83
00407 4585f6                         test       r14d, r14d
0040a 0f8cd4160000                   jl         0x7fefc7e6a4e4
00410 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00418 4585db                         test       r11d, r11d
0041b 0f8cc3160000                   jl         0x7fefc7e6a4e4
00421 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00429 4503d6                         add        r10d, r14d
0042c 448b442408                     mov        r8d, dword ptr [rsp + 8]
00431 453bc2                         cmp        r8d, r10d
00434 0f82aa160000                   jb         0x7fefc7e6a4e4
0043a 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
00442 0f829c160000                   jb         0x7fefc7e6a4e4
00448 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00450 4585db                         test       r11d, r11d
00453 0f843a010000                   je         0x7fefc7e68f93
00459 4963d3                         movsxd     rdx, r11d
0045c 4883fa20                       cmp        rdx, 0x20
00460 0f860a010000                   jbe        0x7fefc7e68f70
00466 c5f877                         vzeroupper 
00469 49ba204f8ec7ef7f0000           movabs     r10, 0x7fefc78e4f20
00473 41ffd2                         call       r10
00476 0f1f840000000000               nop        dword ptr [rax + rax]
0047e e910010000                     jmp        0x7fefc7e68f93
00483 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00488 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0048f 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00493 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
0049b 0f832b140000                   jae        0x7fefc7e6a2cc
004a1 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004a9 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
004ae 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
004b6 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004be 0f8380140000                   jae        0x7fefc7e6a344
004c4 4183c608                       add        r14d, 8
004c8 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004cc 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
004d4 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004dc 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
004e1 4183c308                       add        r11d, 8
004e5 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
004ed 418502                         test       dword ptr [r10], eax
004f0 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
004f8 7d6d                           jge        0x7fefc7e68f67
004fa 660f1f440000                   nop        word ptr [rax + rax]
00500 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
00508 0f83be130000                   jae        0x7fefc7e6a2cc
0050e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00516 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
0051b 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00523 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0052b 0f8313140000                   jae        0x7fefc7e6a344
00531 4183c608                       add        r14d, 8
00535 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
00539 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00541 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00549 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
0054e 4183c208                       add        r10d, 8
00552 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0055a 418503                         test       dword ptr [r11], eax
0055d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00565 7c99                           jl         0x7fefc7e68f00
00567 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0056e eb33                           jmp        0x7fefc7e68fa3
00570 458bd3                         mov        r10d, r11d
00573 4d63d2                         movsxd     r10, r10d
00576 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0057d c442a8f5db                     bzhi       r11, r11, r10
00582 c4c1fb92fb                     kmovq      k7, r11
00587 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0058d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00593 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00598 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0059f 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
005a3 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
005ab 458b4204                       mov        r8d, dword ptr [r10 + 4]
005af 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
005b4 4585d2                         test       r10d, r10d
005b7 0f8cf7130000                   jl         0x7fefc7e6a3b4
005bd 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
005c5 458b5a04                       mov        r11d, dword ptr [r10 + 4]
005c9 4183fb01                       cmp        r11d, 1
005cd 0f86e1130000                   jbe        0x7fefc7e6a3b4
005d3 4183fb02                       cmp        r11d, 2
005d7 0f86d7130000                   jbe        0x7fefc7e6a3b4
005dd 4585db                         test       r11d, r11d
005e0 0f86ce130000                   jbe        0x7fefc7e6a3b4
005e6 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
005ee 418b4a04                       mov        ecx, dword ptr [r10 + 4]
005f2 448d49f1                       lea        r9d, [rcx - 0xf]
005f6 4585c9                         test       r9d, r9d
005f9 0f8cb5130000                   jl         0x7fefc7e6a3b4
005ff 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00604 448bd1                         mov        r10d, ecx
00607 458d71f1                       lea        r14d, [r9 - 0xf]
0060b 4489b424e0000000               mov        dword ptr [rsp + 0xe0], r14d
00613 458d72f1                       lea        r14d, [r10 - 0xf]
00617 89ac2498000000                 mov        dword ptr [rsp + 0x98], ebp
0061e 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00623 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00628 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0062c 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00631 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00636 4489b424d0000000               mov        dword ptr [rsp + 0xd0], r14d
0063e 4d8b4f30                       mov        r9, qword ptr [r15 + 0x30]
00642 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00647 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
0064f 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00657 498d741b08                     lea        rsi, [r11 + rbx + 8]
0065c 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00664 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0066c 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
00671 458d4501                       lea        r8d, [r13 + 1]
00675 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0067a 418501                         test       dword ptr [r9], eax
0067d 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00682 0f8d6f0a0000                   jge        0x7fefc7e69af7
00688 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
0068d 0f83010f0000                   jae        0x7fefc7e69f94
00693 4d63dd                         movsxd     r11, r13d
00696 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
0069e 4f8b4cd810                     mov        r9, qword ptr [r8 + r11*8 + 0x10]
006a3 458bd9                         mov        r11d, r9d
006a6 4181e3ffff0100                 and        r11d, 0x1ffff
006ad 418bc3                         mov        eax, r11d
006b0 4d8bd9                         mov        r11, r9
006b3 49c1eb12                       shr        r11, 0x12
006b7 49c1f924                       sar        r9, 0x24
006bb 458bc3                         mov        r8d, r11d
006be 458bd9                         mov        r11d, r9d
006c1 418bcb                         mov        ecx, r11d
006c4 4181e0ffff0300                 and        r8d, 0x3ffff
006cb 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
006d3 4585db                         test       r11d, r11d
006d6 0f8c80100000                   jl         0x7fefc7e6a15c
006dc 448bd8                         mov        r11d, eax
006df 4585db                         test       r11d, r11d
006e2 0f8524020000                   jne        0x7fefc7e6930c
006e8 4533d2                         xor        r10d, r10d
006eb 418bc2                         mov        eax, r10d
006ee 83f903                         cmp        ecx, 3
006f1 0f8e69020000                   jle        0x7fefc7e69360
006f7 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006ff 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
00703 45895a10                       mov        dword ptr [r10 + 0x10], r11d
00707 458b5208                       mov        r10d, dword ptr [r10 + 8]
0070b 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00713 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00717 448d51fd                       lea        r10d, [rcx - 3]
0071b 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00723 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0072b 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00733 45895a08                       mov        dword ptr [r10 + 8], r11d
00737 4863ac24cc000000               movsxd     rbp, dword ptr [rsp + 0xcc]
0073f 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
00744 4c63d3                         movsxd     r10, ebx
00747 4c03542478                     add        r10, qword ptr [rsp + 0x78]
0074c 4863d0                         movsxd     rdx, eax
0074f 4c03d2                         add        r10, rdx
00752 493bea                         cmp        rbp, r10
00755 0f8f51100000                   jg         0x7fefc7e6a1ac
0075b 448d2c03                       lea        r13d, [rbx + rax]
0075f 458bf5                         mov        r14d, r13d
00762 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
0076a 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00772 4585db                         test       r11d, r11d
00775 0f84b9010000                   je         0x7fefc7e69334
0077b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00780 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00788 4585c0                         test       r8d, r8d
0078b 0f8eab0f0000                   jle        0x7fefc7e6a13c
00791 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00799 4503dd                         add        r11d, r13d
0079c 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
007a4 0f8f56100000                   jg         0x7fefc7e6a200
007aa 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
007b2 4403d0                         add        r10d, eax
007b5 4489542474                     mov        dword ptr [rsp + 0x74], r10d
007ba 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
007c2 0f8f9c100000                   jg         0x7fefc7e6a264
007c8 83f810                         cmp        eax, 0x10
007cb 0f8fbc040000                   jg         0x7fefc7e6968d
007d1 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
007d9 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
007e1 0f83f90d0000                   jae        0x7fefc7e69fe0
007e7 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007ef c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
007f6 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
007fd 0f83450e0000                   jae        0x7fefc7e6a048
00803 468d1400                       lea        r10d, [rax + r8]
00807 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0080c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00814 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
0081b 448d1418                       lea        r10d, [rax + rbx]
0081f 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00827 458bf2                         mov        r14d, r10d
0082a 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00832 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0083a 4183fa10                       cmp        r10d, 0x10
0083e 0f8f6dfbffff                   jg         0x7fefc7e68db1
00844 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
0084c 4183fb10                       cmp        r11d, 0x10
00850 0f8c5bfbffff                   jl         0x7fefc7e68db1
00856 443bb424e0000000               cmp        r14d, dword ptr [rsp + 0xe0]
0085e 0f83740e0000                   jae        0x7fefc7e6a0d8
00864 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0086c c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00873 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0087b 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
00883 0f82f0faffff                   jb         0x7fefc7e68d79
00889 bee4ffffff                     mov        esi, 0xffffffe4
0088e 488b2c24                       mov        rbp, qword ptr [rsp]
00892 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00897 44895c2408                     mov        dword ptr [rsp + 8], r11d
0089c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008a1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
008a6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008ab 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008b0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
008b5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
008ba 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
008bf 4489542438                     mov        dword ptr [rsp + 0x38], r10d
008c4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
008c9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
008ce 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
008d6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008db 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008e3 4489542458                     mov        dword ptr [rsp + 0x58], r10d
008e8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
008ed 4489542460                     mov        dword ptr [rsp + 0x60], r10d
008f2 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
008fb 90                             nop        
008fc c5f877                         vzeroupper 
008ff e85cacb5ff                     call       0x7fefc79c3f60
00904 0f1f8400fc090004               nop        dword ptr [rax + rax + 0x40009fc]
0090c 453bda                         cmp        r11d, r10d
0090f 0f8ed9fdffff                   jle        0x7fefc7e690ee
00915 be45ffffff                     mov        esi, 0xffffff45
0091a 418beb                         mov        ebp, r11d
0091d 44891424                       mov        dword ptr [rsp], r10d
00921 666690                         nop        
00924 c5f877                         vzeroupper 
00927 e834acb5ff                     call       0x7fefc79c3f60
0092c 0f1f8400240a0005               nop        dword ptr [rax + rax + 0x5000a24]
00934 4d63de                         movsxd     r11, r14d
00937 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
0093f 0f8c1f120000                   jl         0x7fefc7e6a564
00945 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
0094d 0f8f6d120000                   jg         0x7fefc7e6a5c0
00953 4533db                         xor        r11d, r11d
00956 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0095b e920feffff                     jmp        0x7fefc7e69180
00960 85c0                           test       eax, eax
00962 7407                           je         0x7fefc7e6936b
00964 448d51ff                       lea        r10d, [rcx - 1]
00968 418bca                         mov        ecx, r10d
0096b 85c9                           test       ecx, ecx
0096d 750e                           jne        0x7fefc7e6937d
0096f 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00977 458b5208                       mov        r10d, dword ptr [r10 + 8]
0097b eb75                           jmp        0x7fefc7e693f2
0097d 83f903                         cmp        ecx, 3
00980 0f8492140000                   je         0x7fefc7e6a818
00986 83f902                         cmp        ecx, 2
00989 0f87ed140000                   ja         0x7fefc7e6a87c
0098f 3b4c2430                       cmp        ecx, dword ptr [rsp + 0x30]
00993 0f83a3130000                   jae        0x7fefc7e6a73c
00999 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009a1 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
009a6 85c9                           test       ecx, ecx
009a8 7e3c                           jle        0x7fefc7e693e6
009aa 448d59ff                       lea        r11d, [rcx - 1]
009ae 443b5c2430                     cmp        r11d, dword ptr [rsp + 0x30]
009b3 0f83f7130000                   jae        0x7fefc7e6a7b0
009b9 0f1f8000000000                 nop        dword ptr [rax]
009c0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
009c8 458b5c8804                     mov        r11d, dword ptr [r8 + rcx*4 + 4]
009cd 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
009d5 45895c8908                     mov        dword ptr [r9 + rcx*4 + 8], r11d
009da 448d59ff                       lea        r11d, [rcx - 1]
009de 418bcb                         mov        ecx, r11d
009e1 4585db                         test       r11d, r11d
009e4 7fda                           jg         0x7fefc7e693c0
009e6 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009ee 45895308                       mov        dword ptr [r11 + 8], r10d
009f2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009fa e938fdffff                     jmp        0x7fefc7e69137
009ff 4183fa10                       cmp        r10d, 0x10
00a03 0f8d8b170000                   jge        0x7fefc7e6ab94
00a09 4183fa08                       cmp        r10d, 8
00a0d 0f8d7a070000                   jge        0x7fefc7e69b8d
00a13 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00a1b 4183fb10                       cmp        r11d, 0x10
00a1f 0f8eb6000000                   jle        0x7fefc7e694db
00a25 4585f6                         test       r14d, r14d
00a28 0f8cde160000                   jl         0x7fefc7e6ab0c
00a2e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a36 4585db                         test       r11d, r11d
00a39 0f8ccd160000                   jl         0x7fefc7e6ab0c
00a3f 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a44 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00a4c 0f82ba160000                   jb         0x7fefc7e6ab0c
00a52 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
00a59 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00a60 443bd3                         cmp        r10d, ebx
00a63 0f82a3160000                   jb         0x7fefc7e6ab0c
00a69 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00a71 4585d2                         test       r10d, r10d
00a74 0f8c92160000                   jl         0x7fefc7e6ab0c
00a7a 4585d2                         test       r10d, r10d
00a7d 0f8449f8ffff                   je         0x7fefc7e68ccc
00a83 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a88 4983fa20                       cmp        r10, 0x20
00a8c 772d                           ja         0x7fefc7e694bb
00a8e 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00a96 4d63d2                         movsxd     r10, r10d
00a99 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00aa0 c442a8f5db                     bzhi       r11, r11, r10
00aa5 c4c1fb92fb                     kmovq      k7, r11
00aaa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ab0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ab6 e911f8ffff                     jmp        0x7fefc7e68ccc
00abb 498bd2                         mov        rdx, r10
00abe c5f877                         vzeroupper 
00ac1 49ba204f8ec7ef7f0000           movabs     r10, 0x7fefc78e4f20
00acb 41ffd2                         call       r10
00ace 0f1f840000000000               nop        dword ptr [rax + rax]
00ad6 e9f1f7ffff                     jmp        0x7fefc7e68ccc
00adb 443b742408                     cmp        r14d, dword ptr [rsp + 8]
00ae0 0f83fa130000                   jae        0x7fefc7e6a8e0
00ae6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00aee 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
00af4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00afc 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b01 0f8365140000                   jae        0x7fefc7e6a96c
00b07 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b0f 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b17 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00b1c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b24 41ffc2                         inc        r10d
00b27 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00b2f 458d5e03                       lea        r11d, [r14 + 3]
00b33 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00b38 0f8396140000                   jae        0x7fefc7e6a9d4
00b3e 4d63c6                         movsxd     r8, r14d
00b41 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b49 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00b4f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b57 4183c203                       add        r10d, 3
00b5b 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b60 0f83da140000                   jae        0x7fefc7e6aa40
00b66 4c638c249c000000               movsxd     r9, dword ptr [rsp + 0x9c]
00b6e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b76 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
00b7b 470fbe5c020a                   movsx      r11d, byte ptr [r10 + r8 + 0xa]
00b81 47885c0a0a                     mov        byte ptr [r10 + r9 + 0xa], r11b
00b86 470fbe5c020b                   movsx      r11d, byte ptr [r10 + r8 + 0xb]
00b8c 47885c0a0b                     mov        byte ptr [r10 + r9 + 0xb], r11b
00b91 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00b99 4183fb08                       cmp        r11d, 8
00b9d 0f83f9140000                   jae        0x7fefc7e6aa9c
00ba3 49ba283827e300000000           movabs     r10, 0xe3273828
00bad 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00bb2 4489742418                     mov        dword ptr [rsp + 0x18], r14d
00bb7 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00bbf 4183fb04                       cmp        r11d, 4
00bc3 7e43                           jle        0x7fefc7e69608
00bc5 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bcc 83c504                         add        ebp, 4
00bcf 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bd7 418bd6                         mov        edx, r14d
00bda 6690                           nop        
00bdc c5f877                         vzeroupper 
00bdf e87c22a9ff                     call       0x7fefc78fb860
00be4 0f1f8400dc0c0006               nop        dword ptr [rax + rax + 0x6000cdc]
00bec 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bf4 8bd5                           mov        edx, ebp
00bf6 8bc8                           mov        ecx, eax
00bf8 c5f877                         vzeroupper 
00bfb e86022a9ff                     call       0x7fefc78fb860
00c00 0f1f8400f80c0007               nop        dword ptr [rax + rax + 0x7000cf8]
00c08 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00c10 4183fb08                       cmp        r11d, 8
00c14 7e62                           jle        0x7fefc7e69678
00c16 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00c1a 49ba503827e300000000           movabs     r10, 0xe3273850
00c24 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00c2c 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00c31 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00c38 83c508                         add        ebp, 8
00c3b 83c208                         add        edx, 8
00c3e 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c46 6690                           nop        
00c48 c5f877                         vzeroupper 
00c4b e81022a9ff                     call       0x7fefc78fb860
00c50 0f1f8400480d0008               nop        dword ptr [rax + rax + 0x8000d48]
00c58 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c60 8bd5                           mov        edx, ebp
00c62 488bc8                         mov        rcx, rax
00c65 666690                         nop        
00c68 c5f877                         vzeroupper 
00c6b e8f021a9ff                     call       0x7fefc78fb860
00c70 0f1f8400680d0009               nop        dword ptr [rax + rax + 0x9000d68]
00c78 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00c7d 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00c84 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00c88 e916f9ffff                     jmp        0x7fefc7e68fa3
00c8d 83f830                         cmp        eax, 0x30
00c90 0f8e89000000                   jle        0x7fefc7e6971f
00c96 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00c9e 4585d2                         test       r10d, r10d
00ca1 0f8cf1160000                   jl         0x7fefc7e6ad98
00ca7 85db                           test       ebx, ebx
00ca9 0f8ce9160000                   jl         0x7fefc7e6ad98
00caf 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00cb3 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00cb7 0f82db160000                   jb         0x7fefc7e6ad98
00cbd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00cc2 453bdd                         cmp        r11d, r13d
00cc5 0f82cd160000                   jb         0x7fefc7e6ad98
00ccb 85c0                           test       eax, eax
00ccd 7429                           je         0x7fefc7e696f8
00ccf 4883fa20                       cmp        rdx, 0x20
00cd3 7730                           ja         0x7fefc7e69705
00cd5 448bd0                         mov        r10d, eax
00cd8 4d63d2                         movsxd     r10, r10d
00cdb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ce2 c442a8f5db                     bzhi       r11, r11, r10
00ce7 c4c1fb92fb                     kmovq      k7, r11
00cec 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cf2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cf8 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00d00 e92dfbffff                     jmp        0x7fefc7e69232
00d05 c5f877                         vzeroupper 
00d08 49ba204f8ec7ef7f0000           movabs     r10, 0x7fefc78e4f20
00d12 41ffd2                         call       r10
00d15 0f1f840000000000               nop        dword ptr [rax + rax]
00d1d ebd9                           jmp        0x7fefc7e696f8
00d1f 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d27 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
00d2f 0f835b150000                   jae        0x7fefc7e6ac90
00d35 4d63c8                         movsxd     r9, r8d
00d38 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00d40 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00d47 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
00d4e 0f83b8150000                   jae        0x7fefc7e6ad0c
00d54 418bf8                         mov        edi, r8d
00d57 448d5310                       lea        r10d, [rbx + 0x10]
00d5b 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00d63 4c63d3                         movsxd     r10, ebx
00d66 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00d6e c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00d75 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d7d 453bdd                         cmp        r11d, r13d
00d80 0f8d3c030000                   jge        0x7fefc7e69ac2
00d86 4d2bca                         sub        r9, r10
00d89 4d63d3                         movsxd     r10, r11d
00d8c 48634c243c                     movsxd     rcx, dword ptr [rsp + 0x3c]
00d91 4883c1f1                       add        rcx, -0xf
00d95 4f8d1c0a                       lea        r11, [r10 + r9]
00d99 4c3bd9                         cmp        r11, rcx
00d9c 0f837a160000                   jae        0x7fefc7e6ae1c
00da2 4d63dd                         movsxd     r11, r13d
00da5 4d8bc3                         mov        r8, r11
00da8 4d2bc2                         sub        r8, r10
00dab 4983c00f                       add        r8, 0xf
00daf 4983e0f0                       and        r8, 0xfffffffffffffff0
00db3 458bc0                         mov        r8d, r8d
00db6 458d541810                     lea        r10d, [r8 + rbx + 0x10]
00dbb 4d63c2                         movsxd     r8, r10d
00dbe 4f8d5408f0                     lea        r10, [r8 + r9 - 0x10]
00dc3 4c3bd1                         cmp        r10, rcx
00dc6 0f8350160000                   jae        0x7fefc7e6ae1c
00dcc 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00dd4 443b9424e0000000               cmp        r10d, dword ptr [rsp + 0xe0]
00ddc 0f833a160000                   jae        0x7fefc7e6ae1c
00de2 4983c0f0                       add        r8, -0x10
00de6 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00deb 4983c2f1                       add        r10, -0xf
00def 4d3bc2                         cmp        r8, r10
00df2 0f8324160000                   jae        0x7fefc7e6ae1c
00df8 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00dff 0f8f67160000                   jg         0x7fefc7e6ae6c
00e05 448bcf                         mov        r9d, edi
00e08 442bcb                         sub        r9d, ebx
00e0b 83c320                         add        ebx, 0x20
00e0e 6690                           nop        
00e10 458bc1                         mov        r8d, r9d
00e13 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00e1b 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00e23 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00e2a 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00e32 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00e3a c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00e41 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00e49 4183c210                       add        r10d, 0x10
00e4d 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00e55 443bd3                         cmp        r10d, ebx
00e58 7cb6                           jl         0x7fefc7e69810
00e5a 4981c310ffffff                 add        r11, -0xf0
00e61 4981fb00000080                 cmp        r11, -0x80000000
00e68 49c7c200000080                 mov        r10, 0xffffffff80000000
00e6f 4d0f4cda                       cmovl      r11, r10
00e73 418bcb                         mov        ecx, r11d
00e76 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00e7e 443bd9                         cmp        r11d, ecx
00e81 0f8df5010000                   jge        0x7fefc7e69a7c
00e87 458bd3                         mov        r10d, r11d
00e8a 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00e92 0f1f8000000000                 nop        dword ptr [rax]
00e99 0f1f8000000000                 nop        dword ptr [rax]
00ea0 458bc1                         mov        r8d, r9d
00ea3 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00eab 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00eb3 4d63db                         movsxd     r11, r11d
00eb6 458bd0                         mov        r10d, r8d
00eb9 488b9c24a8000000               mov        rbx, qword ptr [rsp + 0xa8]
00ec1 c4a17a6f441308                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 8]
00ec8 4d63d0                         movsxd     r10, r8d
00ecb 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00ed3 488b9c24c0000000               mov        rbx, qword ptr [rsp + 0xc0]
00edb c4a17a7f440308                 vmovdqu    xmmword ptr [rbx + r8 + 8], xmm0
00ee2 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00eea c4817a6f441018                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x18]
00ef1 c4a17a7f441b18                 vmovdqu    xmmword ptr [rbx + r11 + 0x18], xmm0
00ef8 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f00 c4817a6f441028                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x28]
00f07 c4a17a7f441b28                 vmovdqu    xmmword ptr [rbx + r11 + 0x28], xmm0
00f0e 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f16 c4817a6f441038                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x38]
00f1d c4a17a7f441b38                 vmovdqu    xmmword ptr [rbx + r11 + 0x38], xmm0
00f24 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f2c c4817a6f441048                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x48]
00f33 c4a17a7f441b48                 vmovdqu    xmmword ptr [rbx + r11 + 0x48], xmm0
00f3a 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f42 c4817a6f441058                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x58]
00f49 c4a17a7f441b58                 vmovdqu    xmmword ptr [rbx + r11 + 0x58], xmm0
00f50 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f58 c4817a6f441068                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x68]
00f5f c4a17a7f441b68                 vmovdqu    xmmword ptr [rbx + r11 + 0x68], xmm0
00f66 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f6e c4817a6f441078                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x78]
00f75 c4a17a7f441b78                 vmovdqu    xmmword ptr [rbx + r11 + 0x78], xmm0
00f7c 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f84 c4817a6f841088000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x88]
00f8e c4a17a7f841b88000000           vmovdqu    xmmword ptr [rbx + r11 + 0x88], xmm0
00f98 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fa0 c4817a6f841098000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x98]
00faa c4a17a7f841b98000000           vmovdqu    xmmword ptr [rbx + r11 + 0x98], xmm0
00fb4 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fbc c4817a6f8410a8000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xa8]
00fc6 c4a17a7f841ba8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xa8], xmm0
00fd0 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fd8 c4817a6f8410b8000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xb8]
00fe2 c4a17a7f841bb8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xb8], xmm0
00fec 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00ff4 c4817a6f8410c8000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc8]
00ffe c4a17a7f841bc8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xc8], xmm0
01008 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01010 c4817a6f8410d8000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xd8]
0101a c4a17a7f841bd8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xd8], xmm0
01024 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
0102c c4817a6f8410e8000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xe8]
01036 c4a17a7f841be8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xe8], xmm0
01040 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01048 c4817a6f8410f8000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xf8]
01052 c4a17a7f841bf8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xf8], xmm0
0105c 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01064 4181c300010000                 add        r11d, 0x100
0106b 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
01073 443bd9                         cmp        r11d, ecx
01076 0f8c24feffff                   jl         0x7fefc7e698a0
0107c 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01084 453bd5                         cmp        r10d, r13d
01087 7d39                           jge        0x7fefc7e69ac2
01089 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01091 666690                         nop        
01094 478d1401                       lea        r10d, [r9 + r8]
01098 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
010a0 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
010a7 458bd0                         mov        r10d, r8d
010aa 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
010b2 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
010b9 4183c010                       add        r8d, 0x10
010bd 453bc5                         cmp        r8d, r13d
010c0 7cd2                           jl         0x7fefc7e69a94
010c2 03c7                           add        eax, edi
010c4 89442474                       mov        dword ptr [rsp + 0x74], eax
010c8 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
010d0 e95df7ffff                     jmp        0x7fefc7e69232
010d5 4d63d2                         movsxd     r10, r10d
010d8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010df c442a8f5db                     bzhi       r11, r11, r10
010e4 c4c1fb92fb                     kmovq      k7, r11
010e9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010ef 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010f5 eb78                           jmp        0x7fefc7e69b6f
010f7 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
010ff 4585c0                         test       r8d, r8d
01102 0f8c64110000                   jl         0x7fefc7e6ac6c
01108 85db                           test       ebx, ebx
0110a 0f8c5c110000                   jl         0x7fefc7e6ac6c
01110 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01115 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
0111a 0f824c110000                   jb         0x7fefc7e6ac6c
01120 428d2c13                       lea        ebp, [rbx + r10]
01124 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01129 443bdd                         cmp        r11d, ebp
0112c 0f823a110000                   jb         0x7fefc7e6ac6c
01132 4585d2                         test       r10d, r10d
01135 0f8c31110000                   jl         0x7fefc7e6ac6c
0113b 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01140 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
01148 7425                           je         0x7fefc7e69b6f
0114a 4963d2                         movsxd     rdx, r10d
0114d 4883fa20                       cmp        rdx, 0x20
01151 0f867effffff                   jbe        0x7fefc7e69ad5
01157 c5f877                         vzeroupper 
0115a 49ba204f8ec7ef7f0000           movabs     r10, 0x7fefc78e4f20
01164 41ffd2                         call       r10
01167 0f1f840000000000               nop        dword ptr [rax + rax]
0116f 4c8b1424                       mov        r10, qword ptr [rsp]
01173 41896a38                       mov        dword ptr [r10 + 0x38], ebp
01177 c5f877                         vzeroupper 
0117a 4881c400010000                 add        rsp, 0x100
01181 5d                             pop        rbp
01182 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01186 0f87fc140000                   ja         0x7fefc7e6b088
0118c c3                             ret        
0118d 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
01195 0f8321130000                   jae        0x7fefc7e6aebc
0119b 458bd6                         mov        r10d, r14d
0119e 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
011a6 4963da                         movsxd     rbx, r10d
011a9 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
011b1 4d8b541a08                     mov        r10, qword ptr [r10 + rbx + 8]
011b6 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
011be 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
011c6 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
011ce 0f8368130000                   jae        0x7fefc7e6af3c
011d4 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
011dc 4183c208                       add        r10d, 8
011e0 4489542468                     mov        dword ptr [rsp + 0x68], r10d
011e5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
011e9 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
011f0 4c63d9                         movsxd     r11, ecx
011f3 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
011fb 4c8b8c24d0000000               mov        r9, qword ptr [rsp + 0xd0]
01203 4f894c1808                     mov        qword ptr [r8 + r11 + 8], r9
01208 448d4908                       lea        r9d, [rcx + 8]
0120c 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01211 418502                         test       dword ptr [r10], eax
01214 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
0121c 0f8d56faffff                   jge        0x7fefc7e69678
01222 492bdb                         sub        rbx, r11
01225 48637c240c                     movsxd     rdi, dword ptr [rsp + 0xc]
0122a 4883c7f9                       add        rdi, -7
0122e 4d63c1                         movsxd     r8, r9d
01231 4d8d1418                       lea        r10, [r8 + rbx]
01235 4c3bd7                         cmp        r10, rdi
01238 0f835e130000                   jae        0x7fefc7e6af9c
0123e 4c638c2498000000               movsxd     r9, dword ptr [rsp + 0x98]
01246 4d8bd1                         mov        r10, r9
01249 4d2bd0                         sub        r10, r8
0124c 4983c207                       add        r10, 7
01250 4983e2f8                       and        r10, 0xfffffffffffffff8
01254 458bd2                         mov        r10d, r10d
01257 458d5c0a08                     lea        r11d, [r10 + rcx + 8]
0125c 4d63d3                         movsxd     r10, r11d
0125f 4d8d5c1af8                     lea        r11, [r10 + rbx - 8]
01264 4c3bdf                         cmp        r11, rdi
01267 0f832f130000                   jae        0x7fefc7e6af9c
0126d 8b5c246c                       mov        ebx, dword ptr [rsp + 0x6c]
01271 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
01278 0f831e130000                   jae        0x7fefc7e6af9c
0127e 4983c2f8                       add        r10, -8
01282 4c3bd7                         cmp        r10, rdi
01285 0f8311130000                   jae        0x7fefc7e6af9c
0128b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01293 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
0129a 0f8f54130000                   jg         0x7fefc7e6aff4
012a0 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
012a8 442bd9                         sub        r11d, ecx
012ab 418bfb                         mov        edi, r11d
012ae 41baf8ffffff                   mov        r10d, 0xfffffff8
012b4 4d8d59c8                       lea        r11, [r9 - 0x38]
012b8 4981fb00000080                 cmp        r11, -0x80000000
012bf 48c7c300000080                 mov        rbx, 0xffffffff80000000
012c6 4c0f4cdb                       cmovl      r11, rbx
012ca 418bdb                         mov        ebx, r11d
012cd 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
012d5 8d5110                         lea        edx, [rcx + 0x10]
012d8 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
012e0 498bf3                         mov        rsi, r11
012e3 4863c2                         movsxd     rax, edx
012e6 458bdb                         mov        r11d, r11d
012e9 452bd3                         sub        r10d, r11d
012ec 442bd1                         sub        r10d, ecx
012ef 4183c2f0                       add        r10d, -0x10
012f3 b906000000                     mov        ecx, 6
012f8 c442f0f5d2                     bzhi       r10, r10, rcx
012fd 4903c2                         add        rax, r10
01300 493bc1                         cmp        rax, r9
01303 4d8bd9                         mov        r11, r9
01306 4c0f4cd8                       cmovl      r11, rax
0130a 4d8bd3                         mov        r10, r11
0130d 4d2bd0                         sub        r10, r8
01310 498d4aff                       lea        rcx, [r10 - 1]
01314 48c1f93f                       sar        rcx, 0x3f
01318 48c1e93d                       shr        rcx, 0x3d
0131c 4e8d5411ff                     lea        r10, [rcx + r10 - 1]
01321 4983e2f8                       and        r10, 0xfffffffffffffff8
01325 4d03d0                         add        r10, r8
01328 4d3bc2                         cmp        r8, r10
0132b 4d0f4cc2                       cmovl      r8, r10
0132f 458bc0                         mov        r8d, r8d
01332 478d540608                     lea        r10d, [r14 + r8 + 8]
01337 4183c008                       add        r8d, 8
0133b 4963c2                         movsxd     rax, r10d
0133e 4803c6                         add        rax, rsi
01341 4963c8                         movsxd     rcx, r8d
01344 4803ce                         add        rcx, rsi
01347 4c8d4008                       lea        r8, [rax + 8]
0134b 4883c048                       add        rax, 0x48
0134f 488d7148                       lea        rsi, [rcx + 0x48]
01353 4533d2                         xor        r10d, r10d
01356 493bf0                         cmp        rsi, r8
01359 410f96c2                       setbe      r10b
0135d 4883c108                       add        rcx, 8
01361 4533c0                         xor        r8d, r8d
01364 483bc1                         cmp        rax, rcx
01367 410f96c0                       setbe      r8b
0136b 450bd0                         or         r10d, r8d
0136e 0f84a8080000                   je         0x7fefc7e6a61c
01374 458bd3                         mov        r10d, r11d
01377 90                             nop        
01378 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0137d 8bcf                           mov        ecx, edi
0137f 034c246c                       add        ecx, dword ptr [rsp + 0x6c]
01383 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0138b 4d8b440808                     mov        r8, qword ptr [r8 + rcx + 8]
01390 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01398 4e89441908                     mov        qword ptr [rcx + r11 + 8], r8
0139d 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
013a2 4183c308                       add        r11d, 8
013a6 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
013ab 453bda                         cmp        r11d, r10d
013ae 7cc8                           jl         0x7fefc7e69d78
013b0 4981c108feffff                 add        r9, -0x1f8
013b7 4981f900000080                 cmp        r9, -0x80000000
013be 49c7c200000080                 mov        r10, 0xffffffff80000000
013c5 4d0f4cca                       cmovl      r9, r10
013c9 458bd1                         mov        r10d, r9d
013cc 453bda                         cmp        r11d, r10d
013cf 0f8d71010000                   jge        0x7fefc7e69f46
013d5 458bc3                         mov        r8d, r11d
013d8 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
013dd 666690                         nop        
013e0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
013e5 4963d3                         movsxd     rdx, r11d
013e8 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
013ed 448bdf                         mov        r11d, edi
013f0 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
013f5 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
013f9 83c140                         add        ecx, 0x40
013fc 03cf                           add        ecx, edi
013fe 458bcb                         mov        r9d, r11d
01401 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
01409 62b17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 8]
01414 62b17e487f840608000000         vmovdqu32  zmmword ptr [rsi + r8 + 8], zmm0
0141f 62f17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 8]
0142a 62f17e487f841648000000         vmovdqu32  zmmword ptr [rsi + rdx + 0x48], zmm0
01435 4d63cb                         movsxd     r9, r11d
01438 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0143d 4181c080000000                 add        r8d, 0x80
01444 4403c7                         add        r8d, edi
01447 62b17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r8 + 8]
01452 62f17e487f841688000000         vmovdqu32  zmmword ptr [rsi + rdx + 0x88], zmm0
0145d 62b17e486f840ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0xc8]
01468 62f17e487f8416c8000000         vmovdqu32  zmmword ptr [rsi + rdx + 0xc8], zmm0
01473 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01478 4181c000010000                 add        r8d, 0x100
0147f 4403c7                         add        r8d, edi
01482 458bd8                         mov        r11d, r8d
01485 62b17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r8 + 8]
01490 62f17e487f841608010000         vmovdqu32  zmmword ptr [rsi + rdx + 0x108], zmm0
0149b 62b17e486f840e48010000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0x148]
014a6 62f17e487f841648010000         vmovdqu32  zmmword ptr [rsi + rdx + 0x148], zmm0
014b1 62b17e486f840e88010000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0x188]
014bc 62f17e487f841688010000         vmovdqu32  zmmword ptr [rsi + rdx + 0x188], zmm0
014c7 4d63db                         movsxd     r11, r11d
014ca 62b17e486f841ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xc8]
014d5 62f17e487f8416c8010000         vmovdqu32  zmmword ptr [rsi + rdx + 0x1c8], zmm0
014e0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
014e5 4181c300020000                 add        r11d, 0x200
014ec 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
014f1 453bda                         cmp        r11d, r10d
014f4 0f8ce6feffff                   jl         0x7fefc7e69de0
014fa 443bdb                         cmp        r11d, ebx
014fd 7d47                           jge        0x7fefc7e69f46
014ff 458bd3                         mov        r10d, r11d
01502 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01507 90                             nop        
01508 448bd7                         mov        r10d, edi
0150b 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
01510 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01518 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
01523 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01528 62917e487f841308000000         vmovdqu32  zmmword ptr [r11 + r10 + 8], zmm0
01533 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01538 4183c340                       add        r11d, 0x40
0153c 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01541 443bdb                         cmp        r11d, ebx
01544 7cc2                           jl         0x7fefc7e69f08
01546 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0154b 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
01553 0f8d1ff7ffff                   jge        0x7fefc7e69678
01559 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0155e 6690                           nop        
01560 468d1407                       lea        r10d, [rdi + r8]
01564 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0156c 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01571 458bd8                         mov        r11d, r8d
01574 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
0157c 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
01581 4183c008                       add        r8d, 8
01585 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
0158d 7cd1                           jl         0x7fefc7e69f60
0158f e9e4f6ffff                     jmp        0x7fefc7e69678
01594 bee4ffffff                     mov        esi, 0xffffffe4
01599 488b2c24                       mov        rbp, qword ptr [rsp]
0159d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015a2 4489542408                     mov        dword ptr [rsp + 8], r10d
015a7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015b6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015bb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
015bf 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
015c4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
015c9 4489442464                     mov        dword ptr [rsp + 0x64], r8d
015ce 6690                           nop        
015d0 c5f877                         vzeroupper 
015d3 e8889fb5ff                     call       0x7fefc79c3f60
015d8 0f1f8400d016000b               nop        dword ptr [rax + rax + 0xb0016d0]
015e0 bee4ffffff                     mov        esi, 0xffffffe4
015e5 488b2c24                       mov        rbp, qword ptr [rsp]
015e9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015ee 44895c2408                     mov        dword ptr [rsp + 8], r11d
015f3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015f8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015fd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01602 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01607 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0160b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01610 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01615 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0161a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0161f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01624 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01629 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0162e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01633 89442464                       mov        dword ptr [rsp + 0x64], eax
01637 90                             nop        
01638 c5f877                         vzeroupper 
0163b e8209fb5ff                     call       0x7fefc79c3f60
01640 0f1f84003817000c               nop        dword ptr [rax + rax + 0xc001738]
01648 bee4ffffff                     mov        esi, 0xffffffe4
0164d 488b2c24                       mov        rbp, qword ptr [rsp]
01651 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01656 4489542408                     mov        dword ptr [rsp + 8], r10d
0165b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01660 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01665 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0166a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0166f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01674 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01679 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0167e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01683 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01688 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0168d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01692 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0169a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0169f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
016a7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
016ac 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
016b1 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
016b6 89442464                       mov        dword ptr [rsp + 0x64], eax
016ba 895c2478                       mov        dword ptr [rsp + 0x78], ebx
016be c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016c7 90                             nop        
016c8 c5f877                         vzeroupper 
016cb e8909eb5ff                     call       0x7fefc79c3f60
016d0 0f1f8400c817000d               nop        dword ptr [rax + rax + 0xd0017c8]
016d8 bee4ffffff                     mov        esi, 0xffffffe4
016dd 488b2c24                       mov        rbp, qword ptr [rsp]
016e1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016e6 4489542408                     mov        dword ptr [rsp + 8], r10d
016eb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016f0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016f5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016fa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016ff 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01704 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01709 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0170e 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01713 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01718 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0171d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01722 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01727 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0172c c5f877                         vzeroupper 
0172f e82c9eb5ff                     call       0x7fefc79c3f60
01734 0f1f84002c18000e               nop        dword ptr [rax + rax + 0xe00182c]
0173c be45ffffff                     mov        esi, 0xffffff45
01741 488b2c24                       mov        rbp, qword ptr [rsp]
01745 4c89542408                     mov        qword ptr [rsp + 8], r10
0174a 6690                           nop        
0174c c5f877                         vzeroupper 
0174f e80c9eb5ff                     call       0x7fefc79c3f60
01754 0f1f84004c18000f               nop        dword ptr [rax + rax + 0xf00184c]
0175c be45ffffff                     mov        esi, 0xffffff45
01761 488b2c24                       mov        rbp, qword ptr [rsp]
01765 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0176a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0176f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01774 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01779 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0177e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01783 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01787 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0178c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01791 89442464                       mov        dword ptr [rsp + 0x64], eax
01795 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
01799 666690                         nop        
0179c c5f877                         vzeroupper 
0179f e8bc9db5ff                     call       0x7fefc79c3f60
017a4 0f1f84009c180010               nop        dword ptr [rax + rax + 0x1000189c]
017ac 493bea                         cmp        rbp, r10
017af bdffffffff                     mov        ebp, 0xffffffff
017b4 7c08                           jl         0x7fefc7e6a1be
017b6 400f95c5                       setne      bpl
017ba 400fb6ed                       movzx      ebp, bpl
017be be45ffffff                     mov        esi, 0xffffff45
017c3 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
017c8 4489442414                     mov        dword ptr [rsp + 0x14], r8d
017cd 895c2438                       mov        dword ptr [rsp + 0x38], ebx
017d1 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
017d6 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
017db 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
017e0 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
017e5 8944246c                       mov        dword ptr [rsp + 0x6c], eax
017e9 4c89542478                     mov        qword ptr [rsp + 0x78], r10
017ee 6690                           nop        
017f0 c5f877                         vzeroupper 
017f3 e8689db5ff                     call       0x7fefc79c3f60
017f8 0f1f8400f0180011               nop        dword ptr [rax + rax + 0x110018f0]
01800 be45ffffff                     mov        esi, 0xffffff45
01805 488b2c24                       mov        rbp, qword ptr [rsp]
01809 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0180e 4489542408                     mov        dword ptr [rsp + 8], r10d
01813 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01818 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0181d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01822 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01827 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0182b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01830 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01835 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0183a 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0183f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01844 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01849 89442464                       mov        dword ptr [rsp + 0x64], eax
0184d 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01852 6690                           nop        
01854 c5f877                         vzeroupper 
01857 e8049db5ff                     call       0x7fefc79c3f60
0185c 0f1f840054190012               nop        dword ptr [rax + rax + 0x12001954]
01864 be45ffffff                     mov        esi, 0xffffff45
01869 488b2c24                       mov        rbp, qword ptr [rsp]
0186d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01872 44895c2408                     mov        dword ptr [rsp + 8], r11d
01877 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0187c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01881 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01886 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0188b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0188f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01894 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01899 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0189e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
018a3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018a8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
018ad 89442464                       mov        dword ptr [rsp + 0x64], eax
018b1 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
018b6 4489542470                     mov        dword ptr [rsp + 0x70], r10d
018bb 90                             nop        
018bc c5f877                         vzeroupper 
018bf e89c9cb5ff                     call       0x7fefc79c3f60
018c4 0f1f8400bc190013               nop        dword ptr [rax + rax + 0x130019bc]
018cc bee4ffffff                     mov        esi, 0xffffffe4
018d1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018d6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018db 895c2438                       mov        dword ptr [rsp + 0x38], ebx
018df 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
018e4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018e9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018ee 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018f3 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
018fb 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01900 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01908 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0190d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01915 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0191a 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01922 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01927 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0192c 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01934 c5f877                         vzeroupper 
01937 e8249cb5ff                     call       0x7fefc79c3f60
0193c 0f1f8400341a0014               nop        dword ptr [rax + rax + 0x14001a34]
01944 bee4ffffff                     mov        esi, 0xffffffe4
01949 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0194e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01953 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01957 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0195c 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01961 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01966 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0196b 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01973 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01978 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01980 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01985 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0198d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01992 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01997 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0199c 4c89442478                     mov        qword ptr [rsp + 0x78], r8
019a1 666690                         nop        
019a4 c5f877                         vzeroupper 
019a7 e8b49bb5ff                     call       0x7fefc79c3f60
019ac 0f1f8400a41a0015               nop        dword ptr [rax + rax + 0x15001aa4]
019b4 bebeffffff                     mov        esi, 0xffffffbe
019b9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019be 4489542414                     mov        dword ptr [rsp + 0x14], r10d
019c3 895c2438                       mov        dword ptr [rsp + 0x38], ebx
019c7 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
019cc 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
019d1 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
019d6 6690                           nop        
019d8 c5f877                         vzeroupper 
019db e8809bb5ff                     call       0x7fefc79c3f60
019e0 0f1f8400d81a0016               nop        dword ptr [rax + rax + 0x16001ad8]
019e8 4533d2                         xor        r10d, r10d
019eb 4c891424                       mov        qword ptr [rsp], r10
019ef e96fe7ffff                     jmp        0x7fefc7e68b63
019f4 4533d2                         xor        r10d, r10d
019f7 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
019ff e98ee7ffff                     jmp        0x7fefc7e68b92
01a04 4533d2                         xor        r10d, r10d
01a07 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
01a0f e9a8e7ffff                     jmp        0x7fefc7e68bbc
01a14 4533d2                         xor        r10d, r10d
01a17 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a1c e9c7e7ffff                     jmp        0x7fefc7e68be8
01a21 4533d2                         xor        r10d, r10d
01a24 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
01a2c e9e1e7ffff                     jmp        0x7fefc7e68c12
01a31 beccffffff                     mov        esi, 0xffffffcc
01a36 488b2c24                       mov        rbp, qword ptr [rsp]
01a3a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a3f 4489542408                     mov        dword ptr [rsp + 8], r10d
01a44 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a49 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a4e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a53 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a58 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a5d 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a62 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a67 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a6c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a71 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a76 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a7b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a80 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01a88 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a8d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01a95 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a9a 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01aa2 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01aa7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01aac 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01ab1 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01ab9 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01abe 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
01ac3 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01aca 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01ad2 6690                           nop        
01ad4 c5f877                         vzeroupper 
01ad7 e8849ab5ff                     call       0x7fefc79c3f60
01adc 0f1f8400d41b0017               nop        dword ptr [rax + rax + 0x17001bd4]
01ae4 beccffffff                     mov        esi, 0xffffffcc
01ae9 488b2c24                       mov        rbp, qword ptr [rsp]
01aed 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01af2 4489542408                     mov        dword ptr [rsp + 8], r10d
01af7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01afc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b01 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b06 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b0b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01b10 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01b15 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01b1a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b1f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01b24 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b29 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b2e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01b33 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b38 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01b3d 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01b45 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01b4a 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01b52 6690                           nop        
01b54 c5f877                         vzeroupper 
01b57 e8049ab5ff                     call       0x7fefc79c3f60
01b5c 0f1f8400541c0018               nop        dword ptr [rax + rax + 0x18001c54]
01b64 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01b6c 4d3bd8                         cmp        r11, r8
01b6f bdffffffff                     mov        ebp, 0xffffffff
01b74 7c08                           jl         0x7fefc7e6a57e
01b76 400f95c5                       setne      bpl
01b7a 400fb6ed                       movzx      ebp, bpl
01b7e be45ffffff                     mov        esi, 0xffffff45
01b83 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01b88 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01b8d 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01b91 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01b96 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01b9b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01ba0 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01ba5 89442468                       mov        dword ptr [rsp + 0x68], eax
01ba9 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01bae 6690                           nop        
01bb0 c5f877                         vzeroupper 
01bb3 e8a899b5ff                     call       0x7fefc79c3f60
01bb8 0f1f8400b01c0019               nop        dword ptr [rax + rax + 0x19001cb0]
01bc0 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01bc8 493beb                         cmp        rbp, r11
01bcb bdffffffff                     mov        ebp, 0xffffffff
01bd0 7c08                           jl         0x7fefc7e6a5da
01bd2 400f95c5                       setne      bpl
01bd6 400fb6ed                       movzx      ebp, bpl
01bda be45ffffff                     mov        esi, 0xffffff45
01bdf 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01be4 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01be9 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01bed 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01bf2 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01bf7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01bfc 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01c01 89442468                       mov        dword ptr [rsp + 0x68], eax
01c05 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01c0a 6690                           nop        
01c0c c5f877                         vzeroupper 
01c0f e84c99b5ff                     call       0x7fefc79c3f60
01c14 0f1f84000c1d001a               nop        dword ptr [rax + rax + 0x1a001d0c]
01c1c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c21 448bd7                         mov        r10d, edi
01c24 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
01c29 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01c31 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01c36 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01c3b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c40 4183c308                       add        r11d, 8
01c44 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01c49 443bda                         cmp        r11d, edx
01c4c 7cce                           jl         0x7fefc7e6a61c
01c4e 443bdb                         cmp        r11d, ebx
01c51 0f8d93000000                   jge        0x7fefc7e6a6ea
01c57 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01c5c 0f1f4000                       nop        dword ptr [rax]
01c60 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c65 4d63cb                         movsxd     r9, r11d
01c68 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01c6d 448bc7                         mov        r8d, edi
01c70 440344246c                     add        r8d, dword ptr [rsp + 0x6c]
01c75 458bd8                         mov        r11d, r8d
01c78 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01c80 4e8b440108                     mov        r8, qword ptr [rcx + r8 + 8]
01c85 4e89441108                     mov        qword ptr [rcx + r10 + 8], r8
01c8a 4d63c3                         movsxd     r8, r11d
01c8d 4e8b540110                     mov        r10, qword ptr [rcx + r8 + 0x10]
01c92 4e89540910                     mov        qword ptr [rcx + r9 + 0x10], r10
01c97 4e8b540118                     mov        r10, qword ptr [rcx + r8 + 0x18]
01c9c 4e89540918                     mov        qword ptr [rcx + r9 + 0x18], r10
01ca1 4e8b540120                     mov        r10, qword ptr [rcx + r8 + 0x20]
01ca6 4e89540920                     mov        qword ptr [rcx + r9 + 0x20], r10
01cab 4e8b540128                     mov        r10, qword ptr [rcx + r8 + 0x28]
01cb0 4e89540928                     mov        qword ptr [rcx + r9 + 0x28], r10
01cb5 4e8b540130                     mov        r10, qword ptr [rcx + r8 + 0x30]
01cba 4e89540930                     mov        qword ptr [rcx + r9 + 0x30], r10
01cbf 4e8b540138                     mov        r10, qword ptr [rcx + r8 + 0x38]
01cc4 4e89540938                     mov        qword ptr [rcx + r9 + 0x38], r10
01cc9 4e8b540140                     mov        r10, qword ptr [rcx + r8 + 0x40]
01cce 4e89540940                     mov        qword ptr [rcx + r9 + 0x40], r10
01cd3 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01cd8 4183c240                       add        r10d, 0x40
01cdc 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01ce1 443bd3                         cmp        r10d, ebx
01ce4 0f8c76ffffff                   jl         0x7fefc7e6a660
01cea 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01cef 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01cf7 0f8d7befffff                   jge        0x7fefc7e69678
01cfd 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01d02 458bd3                         mov        r10d, r11d
01d05 666690                         nop        
01d08 468d0417                       lea        r8d, [rdi + r10]
01d0c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01d14 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
01d19 458bca                         mov        r9d, r10d
01d1c 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01d24 4f895c0808                     mov        qword ptr [r8 + r9 + 8], r11
01d29 4183c208                       add        r10d, 8
01d2d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01d35 7cd1                           jl         0x7fefc7e6a708
01d37 e93cefffff                     jmp        0x7fefc7e69678
01d3c bee4ffffff                     mov        esi, 0xffffffe4
01d41 488b2c24                       mov        rbp, qword ptr [rsp]
01d45 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d4a 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d4f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d54 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d59 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d5e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d63 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d67 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01d6c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d71 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d76 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d7b 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01d83 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01d88 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d8d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d92 89442464                       mov        dword ptr [rsp + 0x64], eax
01d96 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01d9d 666690                         nop        
01da0 c5f877                         vzeroupper 
01da3 e8b897b5ff                     call       0x7fefc79c3f60
01da8 0f1f8400a01e001b               nop        dword ptr [rax + rax + 0x1b001ea0]
01db0 be6effffff                     mov        esi, 0xffffff6e
01db5 488b2c24                       mov        rbp, qword ptr [rsp]
01db9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01dbe 44895c2408                     mov        dword ptr [rsp + 8], r11d
01dc3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01dc8 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01dcd 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01dd2 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01dd7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ddb 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01de0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01de5 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01dea 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01def 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01df4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01df9 89442464                       mov        dword ptr [rsp + 0x64], eax
01dfd 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01e02 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01e06 6690                           nop        
01e08 c5f877                         vzeroupper 
01e0b e85097b5ff                     call       0x7fefc79c3f60
01e10 0f1f8400081f001c               nop        dword ptr [rax + rax + 0x1c001f08]
01e18 be45ffffff                     mov        esi, 0xffffff45
01e1d 488b2c24                       mov        rbp, qword ptr [rsp]
01e21 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e26 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e2b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e30 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e35 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e3a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e3f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01e43 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e48 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e4d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e52 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e57 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e5c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e61 89442464                       mov        dword ptr [rsp + 0x64], eax
01e65 894c2478                       mov        dword ptr [rsp + 0x78], ecx
01e69 666690                         nop        
01e6c c5f877                         vzeroupper 
01e6f e8ec96b5ff                     call       0x7fefc79c3f60
01e74 0f1f84006c1f001d               nop        dword ptr [rax + rax + 0x1d001f6c]
01e7c be3dffffff                     mov        esi, 0xffffff3d
01e81 488b2c24                       mov        rbp, qword ptr [rsp]
01e85 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e8a 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e8f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e99 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e9e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ea3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ea7 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01eac 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01eb1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01eb6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ebb 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ec0 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ec5 89442464                       mov        dword ptr [rsp + 0x64], eax
01ec9 894c2478                       mov        dword ptr [rsp + 0x78], ecx
01ecd 666690                         nop        
01ed0 c5f877                         vzeroupper 
01ed3 e88896b5ff                     call       0x7fefc79c3f60
01ed8 0f1f8400d01f001e               nop        dword ptr [rax + rax + 0x1e001fd0]
01ee0 bee4ffffff                     mov        esi, 0xffffffe4
01ee5 488b2c24                       mov        rbp, qword ptr [rsp]
01ee9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01eee 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ef3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ef8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01efd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f02 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f07 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01f0c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01f11 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01f16 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01f1b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f20 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f25 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01f2a 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01f2f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01f37 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f3c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01f44 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01f49 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f4e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01f53 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01f5b 90                             nop        
01f5c c5f877                         vzeroupper 
01f5f e8fc95b5ff                     call       0x7fefc79c3f60
01f64 0f1f84005c20001f               nop        dword ptr [rax + rax + 0x1f00205c]
01f6c bee4ffffff                     mov        esi, 0xffffffe4
01f71 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f76 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01f7b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01f80 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f85 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01f8a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f8f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f94 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f99 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01fa1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01fa6 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01fae 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01fb3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01fb8 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01fbd 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01fc2 6690                           nop        
01fc4 c5f877                         vzeroupper 
01fc7 e89495b5ff                     call       0x7fefc79c3f60
01fcc 0f1f8400c4200020               nop        dword ptr [rax + rax + 0x200020c4]
01fd4 418d6e01                       lea        ebp, [r14 + 1]
01fd8 bee4ffffff                     mov        esi, 0xffffffe4
01fdd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fe2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01fe7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01fec 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01ff1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ff6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ffb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02000 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02005 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0200d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02012 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0201a 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0201f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02024 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02029 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0202e 6690                           nop        
02030 c5f877                         vzeroupper 
02033 e82895b5ff                     call       0x7fefc79c3f60
02038 0f1f840030210021               nop        dword ptr [rax + rax + 0x21002130]
02040 bee4ffffff                     mov        esi, 0xffffffe4
02045 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0204a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0204f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02054 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02059 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0205e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02063 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02068 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0206d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02075 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0207a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0207f 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02084 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02089 666690                         nop        
0208c c5f877                         vzeroupper 
0208f e8cc94b5ff                     call       0x7fefc79c3f60
02094 0f1f84008c210022               nop        dword ptr [rax + rax + 0x2200218c]
0209c bee4ffffff                     mov        esi, 0xffffffe4
020a1 488b2c24                       mov        rbp, qword ptr [rsp]
020a5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020aa 4489542408                     mov        dword ptr [rsp + 8], r10d
020af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020b9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020be 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020c3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
020c8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
020cd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
020d2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
020d7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020dc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020e1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
020e6 4489542440                     mov        dword ptr [rsp + 0x40], r10d
020eb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020f0 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
020f5 4489742474                     mov        dword ptr [rsp + 0x74], r14d
020fa 6690                           nop        
020fc c5f877                         vzeroupper 
020ff e85c94b5ff                     call       0x7fefc79c3f60
02104 0f1f8400fc210023               nop        dword ptr [rax + rax + 0x230021fc]
0210c beccffffff                     mov        esi, 0xffffffcc
02111 488b2c24                       mov        rbp, qword ptr [rsp]
02115 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0211a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0211f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02124 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02129 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0212e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02133 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02138 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0213d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02142 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02147 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0214c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02151 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02156 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0215b 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02163 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02168 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02170 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02175 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0217a 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0217f 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02184 c5f877                         vzeroupper 
02187 e8d493b5ff                     call       0x7fefc79c3f60
0218c 0f1f840084220024               nop        dword ptr [rax + rax + 0x24002284]
02194 be45ffffff                     mov        esi, 0xffffff45
02199 488b2c24                       mov        rbp, qword ptr [rsp]
0219d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021a2 4489542408                     mov        dword ptr [rsp + 8], r10d
021a7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021b1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021b6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
021bb 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
021c0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
021c5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
021ca 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
021cf 4489742468                     mov        dword ptr [rsp + 0x68], r14d
021d4 c5f877                         vzeroupper 
021d7 e88493b5ff                     call       0x7fefc79c3f60
021dc 0f1f8400d4220025               nop        dword ptr [rax + rax + 0x250022d4]
021e4 be85ffffff                     mov        esi, 0xffffff85
021e9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021ee 44891424                       mov        dword ptr [rsp], r10d
021f2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021f7 4489542404                     mov        dword ptr [rsp + 4], r10d
021fc 895c2408                       mov        dword ptr [rsp + 8], ebx
02200 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02205 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0220a 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0220f 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02214 c5f877                         vzeroupper 
02217 e84493b5ff                     call       0x7fefc79c3f60
0221c 0f1f840014230026               nop        dword ptr [rax + rax + 0x26002314]
02224 4533d2                         xor        r10d, r10d
02227 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0222c eb05                           jmp        0x7fefc7e6ac33
0222e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
02233 be6effffff                     mov        esi, 0xffffff6e
02238 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0223d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02242 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02246 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0224b 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02250 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02255 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0225a 6690                           nop        
0225c c5f877                         vzeroupper 
0225f e8fc92b5ff                     call       0x7fefc79c3f60
02264 0f1f84005c230027               nop        dword ptr [rax + rax + 0x2700235c]
0226c beccffffff                     mov        esi, 0xffffffcc
02271 488b2c24                       mov        rbp, qword ptr [rsp]
02275 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02279 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0227e 6690                           nop        
02280 c5f877                         vzeroupper 
02283 e8d892b5ff                     call       0x7fefc79c3f60
02288 0f1f840080230028               nop        dword ptr [rax + rax + 0x28002380]
02290 bee4ffffff                     mov        esi, 0xffffffe4
02295 488b2c24                       mov        rbp, qword ptr [rsp]
02299 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0229e 4489542408                     mov        dword ptr [rsp + 8], r10d
022a3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022a8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
022ad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
022b2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
022b7 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
022bc 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
022c1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022c6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022cb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022d0 4489542440                     mov        dword ptr [rsp + 0x40], r10d
022d5 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
022dd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
022e2 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022e7 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
022ec 89442460                       mov        dword ptr [rsp + 0x60], eax
022f0 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
022f5 895c2470                       mov        dword ptr [rsp + 0x70], ebx
022f9 666690                         nop        
022fc c5f877                         vzeroupper 
022ff e85c92b5ff                     call       0x7fefc79c3f60
02304 0f1f8400fc230029               nop        dword ptr [rax + rax + 0x290023fc]
0230c c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
02315 bee4ffffff                     mov        esi, 0xffffffe4
0231a 488b2c24                       mov        rbp, qword ptr [rsp]
0231e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02323 44895c2408                     mov        dword ptr [rsp + 8], r11d
02328 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0232d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02332 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02337 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0233c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02341 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02346 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0234b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02350 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02355 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0235a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02362 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02367 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0236c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02371 89442460                       mov        dword ptr [rsp + 0x60], eax
02375 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0237a 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0237f 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02386 6690                           nop        
02388 c5f877                         vzeroupper 
0238b e8d091b5ff                     call       0x7fefc79c3f60
02390 0f1f84008824002a               nop        dword ptr [rax + rax + 0x2a002488]
02398 beccffffff                     mov        esi, 0xffffffcc
0239d 488b2c24                       mov        rbp, qword ptr [rsp]
023a1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
023a6 4489542408                     mov        dword ptr [rsp + 8], r10d
023ab 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023b0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023b5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
023ba 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
023bf 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
023c4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
023c9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023ce 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023d3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
023d8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
023dd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
023e5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
023ea 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
023f2 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
023f7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023fc 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02401 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02405 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0240c c5f877                         vzeroupper 
0240f e84c91b5ff                     call       0x7fefc79c3f60
02414 0f1f84000c25002b               nop        dword ptr [rax + rax + 0x2b00250c]
0241c 8bef                           mov        ebp, edi
0241e 83c510                         add        ebp, 0x10
02421 be6effffff                     mov        esi, 0xffffff6e
02426 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0242b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02430 897c2438                       mov        dword ptr [rsp + 0x38], edi
02434 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02439 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0243e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02443 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02448 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0244d 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02452 89442468                       mov        dword ptr [rsp + 0x68], eax
02456 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0245b 90                             nop        
0245c c5f877                         vzeroupper 
0245f e8fc90b5ff                     call       0x7fefc79c3f60
02464 0f1f84005c25002c               nop        dword ptr [rax + rax + 0x2c00255c]
0246c 8bef                           mov        ebp, edi
0246e 83c510                         add        ebp, 0x10
02471 be66ffffff                     mov        esi, 0xffffff66
02476 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0247b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02480 897c2438                       mov        dword ptr [rsp + 0x38], edi
02484 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02489 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0248e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02493 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02498 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0249d 4489542464                     mov        dword ptr [rsp + 0x64], r10d
024a2 89442468                       mov        dword ptr [rsp + 0x68], eax
024a6 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
024ab 90                             nop        
024ac c5f877                         vzeroupper 
024af e8ac90b5ff                     call       0x7fefc79c3f60
024b4 0f1f8400ac25002d               nop        dword ptr [rax + rax + 0x2d0025ac]
024bc bee4ffffff                     mov        esi, 0xffffffe4
024c1 488b2c24                       mov        rbp, qword ptr [rsp]
024c5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
024ca 4489542408                     mov        dword ptr [rsp + 8], r10d
024cf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024d4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024d9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
024de 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024e3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
024e8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
024ed 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
024f2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
024f7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
024fc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02501 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02506 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0250b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02513 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02518 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0251d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02522 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
0252a 6690                           nop        
0252c c5f877                         vzeroupper 
0252f e82c90b5ff                     call       0x7fefc79c3f60
02534 0f1f84002c26002e               nop        dword ptr [rax + rax + 0x2e00262c]
0253c bee4ffffff                     mov        esi, 0xffffffe4
02541 488b2c24                       mov        rbp, qword ptr [rsp]
02545 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0254a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0254f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02554 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02559 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0255e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02563 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02568 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0256d 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02572 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02577 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0257c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02581 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02586 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0258b 90                             nop        
0258c c5f877                         vzeroupper 
0258f e8cc8fb5ff                     call       0x7fefc79c3f60
02594 0f1f84008c26002f               nop        dword ptr [rax + rax + 0x2f00268c]
0259c be6effffff                     mov        esi, 0xffffff6e
025a1 488b2c24                       mov        rbp, qword ptr [rsp]
025a5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
025aa 44895c2408                     mov        dword ptr [rsp + 8], r11d
025af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025b9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025be 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025c3 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
025c8 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025cd 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
025d2 4489542440                     mov        dword ptr [rsp + 0x40], r10d
025d7 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
025df 4489542464                     mov        dword ptr [rsp + 0x64], r10d
025e4 c5f877                         vzeroupper 
025e7 e8748fb5ff                     call       0x7fefc79c3f60
025ec 0f1f8400e4260030               nop        dword ptr [rax + rax + 0x300026e4]
025f4 be66ffffff                     mov        esi, 0xffffff66
025f9 488b2c24                       mov        rbp, qword ptr [rsp]
025fd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02602 44895c2408                     mov        dword ptr [rsp + 8], r11d
02607 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0260c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02611 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02616 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0261b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02620 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02625 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0262a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0262f 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
02637 458bd3                         mov        r10d, r11d
0263a 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0263f 90                             nop        
02640 c5f877                         vzeroupper 
02643 e8188fb5ff                     call       0x7fefc79c3f60
02648 0f1f840040270031               nop        dword ptr [rax + rax + 0x31002740]
02650 488bf0                         mov        rsi, rax
02653 eb0d                           jmp        0x7fefc7e6b062
02655 488bf0                         mov        rsi, rax
02658 eb08                           jmp        0x7fefc7e6b062
0265a 488bf0                         mov        rsi, rax
0265d eb03                           jmp        0x7fefc7e6b062
0265f 488bf0                         mov        rsi, rax
02662 c5f877                         vzeroupper 
02665 4881c400010000                 add        rsp, 0x100
0266c 5d                             pop        rbp
0266d e96e00b6ff                     jmp        0x7fefc79cb0e0
02672 bef6ffffff                     mov        esi, 0xfffffff6
02677 90                             nop        
02678 c5f877                         vzeroupper 
0267b e8e08eb5ff                     call       0x7fefc79c3f60
02680 0f1f840078270032               nop        dword ptr [rax + rax + 0x32002778]
02688 49ba829be6c7ef7f0000           movabs     r10, 0x7fefc7e69b82
02692 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02699 e9422ea9ff                     jmp        0x7fefc78fdee0
0269e e8fdf9a7ff                     call       0x7fefc78eaaa0
026a3 e986d9ffff                     jmp        0x7fefc7e68a2e
