00000 e8fbc93618                     call       0x7f6aaff4bc80
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
0000f 90                             nop        
00010 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85fc2b0000                   jne        0x7f6a97be1eaa
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
00128 49bab0e310b06a7f0000           movabs     r10, 0x7f6ab010e3b0
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f841d1a0000                   je         0x7f6a97be0de8
0014b 458b1a                         mov        r11d, dword ptr [r10]
0014e 41c1eb0d                       shr        r11d, 0xd
00152 4181fb15040000                 cmp        r11d, 0x415
00159 0f8575230000                   jne        0x7f6a97be1754
0015f 4c891424                       mov        qword ptr [rsp], r10
00163 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00168 4d85d2                         test       r10, r10
0016b 0f84031a0000                   je         0x7f6a97be0df4
00171 458b12                         mov        r10d, dword ptr [r10]
00174 41c1ea0d                       shr        r10d, 0xd
00178 4181fa05010000                 cmp        r10d, 0x105
0017f 0f854f230000                   jne        0x7f6a97be1754
00185 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0018a 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00192 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00197 4d85d2                         test       r10, r10
0019a 0f84e4190000                   je         0x7f6a97be0e04
001a0 458b1a                         mov        r11d, dword ptr [r10]
001a3 41c1eb0d                       shr        r11d, 0xd
001a7 4181fb08010000                 cmp        r11d, 0x108
001ae 0f8520230000                   jne        0x7f6a97be1754
001b4 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001bc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c1 4d85d2                         test       r10, r10
001c4 0f84ca190000                   je         0x7f6a97be0e14
001ca 458b12                         mov        r10d, dword ptr [r10]
001cd 41c1ea0d                       shr        r10d, 0xd
001d1 4181fa07010000                 cmp        r10d, 0x107
001d8 0f85f6220000                   jne        0x7f6a97be1754
001de 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001e8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001ed 4d85d2                         test       r10, r10
001f0 0f84ab190000                   je         0x7f6a97be0e21
001f6 458b1a                         mov        r11d, dword ptr [r10]
001f9 41c1eb0d                       shr        r11d, 0xd
001fd 4181fb07010000                 cmp        r11d, 0x107
00204 0f85ca220000                   jne        0x7f6a97be1754
0020a 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00212 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00217 458b12                         mov        r10d, dword ptr [r10]
0021a 41c1ea0d                       shr        r10d, 0xd
0021e 4181fa05010000                 cmp        r10d, 0x105
00225 0f85a9220000                   jne        0x7f6a97be1754
0022b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00230 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00238 458b5204                       mov        r10d, dword ptr [r10 + 4]
0023c 4489542408                     mov        dword ptr [rsp + 8], r10d
00241 458d5af9                       lea        r11d, [r10 - 7]
00245 4585db                         test       r11d, r11d
00248 0f8ce4220000                   jl         0x7f6a97be17b2
0024e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00253 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00258 4183c3f1                       add        r11d, -0xf
0025c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00261 4183c2f9                       add        r10d, -7
00265 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0026d e91c020000                     jmp        0x7f6a97bdf70e
00272 458bdd                         mov        r11d, r13d
00275 4d63d3                         movsxd     r10, r11d
00278 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0027f c442a8f5db                     bzhi       r11, r11, r10
00284 c4c1fb92fb                     kmovq      k7, r11
00289 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0028f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00295 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0029d 4503d5                         add        r10d, r13d
002a0 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
002a8 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002ac 418502                         test       dword ptr [r10], eax
002af 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002b7 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
002bf 0f8db3090000                   jge        0x7f6a97bdfef8
002c5 8bdd                           mov        ebx, ebp
002c7 448bcb                         mov        r9d, ebx
002ca 442b8c24cc000000               sub        r9d, dword ptr [rsp + 0xcc]
002d2 448bac2494000000               mov        r13d, dword ptr [rsp + 0x94]
002da 442bac24cc000000               sub        r13d, dword ptr [rsp + 0xcc]
002e2 443bac24cc000000               cmp        r13d, dword ptr [rsp + 0xcc]
002ea 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002f2 450f4feb                       cmovg      r13d, r11d
002f6 4585c9                         test       r9d, r9d
002f9 0f8cb2180000                   jl         0x7f6a97be0e31
002ff 85db                           test       ebx, ebx
00301 0f8caa180000                   jl         0x7f6a97be0e31
00307 478d1c29                       lea        r11d, [r9 + r13]
0030b 448b542408                     mov        r10d, dword ptr [rsp + 8]
00310 453bd3                         cmp        r10d, r11d
00313 0f8298180000                   jb         0x7f6a97be0e31
00319 428d2c2b                       lea        ebp, [rbx + r13]
0031d 443bd5                         cmp        r10d, ebp
00320 0f828b180000                   jb         0x7f6a97be0e31
00326 4585ed                         test       r13d, r13d
00329 0f8c82180000                   jl         0x7f6a97be0e31
0032f 4585ed                         test       r13d, r13d
00332 0f845dffffff                   je         0x7f6a97bdf515
00338 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00340 498d741a08                     lea        rsi, [r10 + rbx + 8]
00345 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
0034a 4963d5                         movsxd     rdx, r13d
0034d 4883fa20                       cmp        rdx, 0x20
00351 0f861bffffff                   jbe        0x7f6a97bdf4f2
00357 c5f877                         vzeroupper 
0035a 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00364 41ffd2                         call       r10
00367 0f1f840000000000               nop        dword ptr [rax + rax]
0036f e921ffffff                     jmp        0x7f6a97bdf515
00374 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0037c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00384 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0038b 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00392 4103db                         add        ebx, r11d
00395 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
0039a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0039f 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003a7 e979020000                     jmp        0x7f6a97bdf8a5
003ac 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
003b4 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003b9 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003c1 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
003c6 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003ce 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
003d6 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003de 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003e6 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
003ee 0f8c0b060000                   jl         0x7f6a97bdfc7f
003f4 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
003fc 4183fb30                       cmp        r11d, 0x30
00400 7e7c                           jle        0x7f6a97bdf6fe
00402 4585f6                         test       r14d, r14d
00405 0f8c75180000                   jl         0x7f6a97be0f00
0040b 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00413 4585db                         test       r11d, r11d
00416 0f8c64180000                   jl         0x7f6a97be0f00
0041c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00424 4503d6                         add        r10d, r14d
00427 448b442408                     mov        r8d, dword ptr [rsp + 8]
0042c 453bc2                         cmp        r8d, r10d
0042f 0f824b180000                   jb         0x7f6a97be0f00
00435 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
0043d 0f823d180000                   jb         0x7f6a97be0f00
00443 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0044b 4585db                         test       r11d, r11d
0044e 0f8427010000                   je         0x7f6a97bdf7fb
00454 4963d3                         movsxd     rdx, r11d
00457 4883fa20                       cmp        rdx, 0x20
0045b 0f86f7000000                   jbe        0x7f6a97bdf7d8
00461 c5f877                         vzeroupper 
00464 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
0046e 41ffd2                         call       r10
00471 0f1f840000000000               nop        dword ptr [rax + rax]
00479 e9fd000000                     jmp        0x7f6a97bdf7fb
0047e 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00483 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0048a 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
0048e 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
00496 0f8374150000                   jae        0x7f6a97be0c90
0049c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004a4 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
004a9 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
004b1 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004b9 0f83dd150000                   jae        0x7f6a97be0d1c
004bf 4183c608                       add        r14d, 8
004c3 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
004c7 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004cf 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
004d4 4183c208                       add        r10d, 8
004d8 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
004e0 418503                         test       dword ptr [r11], eax
004e3 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
004eb 7d62                           jge        0x7f6a97bdf7cf
004ed 90                             nop        
004ee 90                             nop        
004ef 90                             nop        
004f0 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
004f8 0f8312150000                   jae        0x7f6a97be0c90
004fe 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00506 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
0050b 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00513 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0051b 0f837b150000                   jae        0x7f6a97be0d1c
00521 4183c608                       add        r14d, 8
00525 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00529 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00531 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
00536 4183c308                       add        r11d, 8
0053a 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00542 418502                         test       dword ptr [r10], eax
00545 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0054d 7ca1                           jl         0x7f6a97bdf770
0054f 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
00556 eb33                           jmp        0x7f6a97bdf80b
00558 458bd3                         mov        r10d, r11d
0055b 4d63d2                         movsxd     r10, r10d
0055e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00565 c442a8f5db                     bzhi       r11, r11, r10
0056a c4c1fb92fb                     kmovq      k7, r11
0056f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00575 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0057b 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00580 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00587 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
0058b 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00593 458b5204                       mov        r10d, dword ptr [r10 + 4]
00597 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0059c 4585c0                         test       r8d, r8d
0059f 0f8c7b150000                   jl         0x7f6a97be0da0
005a5 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
005ad 458b4b04                       mov        r9d, dword ptr [r11 + 4]
005b1 4183f901                       cmp        r9d, 1
005b5 0f8665150000                   jbe        0x7f6a97be0da0
005bb 4183f902                       cmp        r9d, 2
005bf 0f865b150000                   jbe        0x7f6a97be0da0
005c5 4585c9                         test       r9d, r9d
005c8 0f8652150000                   jbe        0x7f6a97be0da0
005ce 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
005d6 458b4304                       mov        r8d, dword ptr [r11 + 4]
005da 458d58f1                       lea        r11d, [r8 - 0xf]
005de 4585db                         test       r11d, r11d
005e1 0f8c39150000                   jl         0x7f6a97be0da0
005e7 8b7c2408                       mov        edi, dword ptr [rsp + 8]
005eb 458bd8                         mov        r11d, r8d
005ee 448d77f1                       lea        r14d, [rdi - 0xf]
005f2 4489b424e0000000               mov        dword ptr [rsp + 0xe0], r14d
005fa 458d73f1                       lea        r14d, [r11 - 0xf]
005fe 89ac2498000000                 mov        dword ptr [rsp + 0x98], ebp
00605 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0060a 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0060f 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00614 897c243c                       mov        dword ptr [rsp + 0x3c], edi
00618 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0061d 4489b424d0000000               mov        dword ptr [rsp + 0xd0], r14d
00625 4d8b4f30                       mov        r9, qword ptr [r15 + 0x30]
00629 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0062e 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
00636 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0063e 498d741b08                     lea        rsi, [r11 + rbx + 8]
00643 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
0064b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00653 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
00658 458d4501                       lea        r8d, [r13 + 1]
0065c 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00661 418501                         test       dword ptr [r9], eax
00664 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00669 0f8dc8070000                   jge        0x7f6a97be00b7
0066f 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
00674 0f83a60f0000                   jae        0x7f6a97be08a0
0067a 4d63dd                         movsxd     r11, r13d
0067d 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
00685 4f8b44d810                     mov        r8, qword ptr [r8 + r11*8 + 0x10]
0068a 458bd8                         mov        r11d, r8d
0068d 4181e3ffff0100                 and        r11d, 0x1ffff
00694 418bc3                         mov        eax, r11d
00697 4d8bd8                         mov        r11, r8
0069a 49c1eb12                       shr        r11, 0x12
0069e 49c1f824                       sar        r8, 0x24
006a2 458bdb                         mov        r11d, r11d
006a5 458bc0                         mov        r8d, r8d
006a8 418bc8                         mov        ecx, r8d
006ab 4181e3ffff0300                 and        r11d, 0x3ffff
006b2 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
006ba 4585c0                         test       r8d, r8d
006bd 0f8c89110000                   jl         0x7f6a97be0acc
006c3 448bd8                         mov        r11d, eax
006c6 4585db                         test       r11d, r11d
006c9 0f8529020000                   jne        0x7f6a97bdfb78
006cf 4533d2                         xor        r10d, r10d
006d2 418bc2                         mov        eax, r10d
006d5 4183f803                       cmp        r8d, 3
006d9 0f8e81020000                   jle        0x7f6a97bdfbe0
006df 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006e7 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
006eb 45895a10                       mov        dword ptr [r10 + 0x10], r11d
006ef 458b5208                       mov        r10d, dword ptr [r10 + 8]
006f3 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
006fb 4589530c                       mov        dword ptr [r11 + 0xc], r10d
006ff 458d50fd                       lea        r10d, [r8 - 3]
00703 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
0070b 45895308                       mov        dword ptr [r11 + 8], r10d
0070f 4863ac24cc000000               movsxd     rbp, dword ptr [rsp + 0xcc]
00717 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
0071c 4c63d3                         movsxd     r10, ebx
0071f 4c03542478                     add        r10, qword ptr [rsp + 0x78]
00724 4863d0                         movsxd     rdx, eax
00727 4c03d2                         add        r10, rdx
0072a 493bea                         cmp        rbp, r10
0072d 0f8f81110000                   jg         0x7f6a97be0b34
00733 448d2c03                       lea        r13d, [rbx + rax]
00737 458bf5                         mov        r14d, r13d
0073a 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00742 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0074a 4585db                         test       r11d, r11d
0074d 0f84e1010000                   je         0x7f6a97bdfbb4
00753 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00758 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00760 4585c0                         test       r8d, r8d
00763 0f8eaf100000                   jle        0x7f6a97be0a98
00769 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00771 4503d5                         add        r10d, r13d
00774 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
0077c 0f8f9a110000                   jg         0x7f6a97be0b9c
00782 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0078a 4403d8                         add        r11d, eax
0078d 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00792 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0079a 0f8ff4110000                   jg         0x7f6a97be0c14
007a0 83f810                         cmp        eax, 0x10
007a3 0f8fe4040000                   jg         0x7f6a97bdff0d
007a9 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
007b1 443b9424d0000000               cmp        r10d, dword ptr [rsp + 0xd0]
007b9 0f83c10e0000                   jae        0x7f6a97be0900
007bf 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
007c7 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
007ce 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
007d5 0f83210f0000                   jae        0x7f6a97be097c
007db 468d1c10                       lea        r11d, [rax + r10]
007df 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
007e4 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
007ec c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
007f3 448d1418                       lea        r10d, [rax + rbx]
007f7 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
007ff 458bf2                         mov        r14d, r10d
00802 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
0080a 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00812 4183fb10                       cmp        r11d, 0x10
00816 0f8f90fbffff                   jg         0x7f6a97bdf62c
0081c 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00824 4183fa10                       cmp        r10d, 0x10
00828 0f8c7efbffff                   jl         0x7f6a97bdf62c
0082e 443bb424e0000000               cmp        r14d, dword ptr [rsp + 0xe0]
00836 0f83640f0000                   jae        0x7f6a97be0a20
0083c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00844 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0084b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00853 443b9424e0000000               cmp        r10d, dword ptr [rsp + 0xe0]
0085b 0f8213fbffff                   jb         0x7f6a97bdf5f4
00861 bee4ffffff                     mov        esi, 0xffffffe4
00866 488b2c24                       mov        rbp, qword ptr [rsp]
0086a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0086f 44895c2408                     mov        dword ptr [rsp + 8], r11d
00874 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00879 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0087e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00883 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00888 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0088d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00892 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00897 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0089c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
008a1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
008a6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
008ae 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008b3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008bb 4489542458                     mov        dword ptr [rsp + 0x58], r10d
008c0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
008c5 4489542460                     mov        dword ptr [rsp + 0x60], r10d
008ca c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
008d3 90                             nop        
008d4 c5f877                         vzeroupper 
008d7 e804dfaeff                     call       0x7f6a976cda60
008dc 0f1f8400d4090004               nop        dword ptr [rax + rax + 0x40009d4]
008e4 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
008ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
008f2 e8e9e91318                     call       0x7f6aafd1e560
008f7 f4                             hlt        
008f8 453bda                         cmp        r11d, r10d
008fb 0f8ed4fdffff                   jle        0x7f6a97bdf955
00901 be45ffffff                     mov        esi, 0xffffff45
00906 418beb                         mov        ebp, r11d
00909 44891424                       mov        dword ptr [rsp], r10d
0090d 90                             nop        
0090e 90                             nop        
0090f 90                             nop        
00910 c5f877                         vzeroupper 
00913 e8c8deaeff                     call       0x7f6a976cda60
00918 0f1f8400100a0005               nop        dword ptr [rax + rax + 0x5000a10]
00920 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0092a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0092e e8ade91318                     call       0x7f6aafd1e560
00933 f4                             hlt        
00934 4d63de                         movsxd     r11, r14d
00937 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
0093f 0f8ccb130000                   jl         0x7f6a97be0f90
00945 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
0094d 0f8f2d140000                   jg         0x7f6a97be1000
00953 4533db                         xor        r11d, r11d
00956 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0095b e9f8fdffff                     jmp        0x7f6a97bdf9d8
00960 85c0                           test       eax, eax
00962 7407                           je         0x7f6a97bdfbeb
00964 458d50ff                       lea        r10d, [r8 - 1]
00968 418bca                         mov        ecx, r10d
0096b 85c9                           test       ecx, ecx
0096d 750e                           jne        0x7f6a97bdfbfd
0096f 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00977 458b5208                       mov        r10d, dword ptr [r10 + 8]
0097b eb75                           jmp        0x7f6a97bdfc72
0097d 83f903                         cmp        ecx, 3
00980 0f84ce160000                   je         0x7f6a97be12d4
00986 83f902                         cmp        ecx, 2
00989 0f873d170000                   ja         0x7f6a97be134c
0098f 3b4c2430                       cmp        ecx, dword ptr [rsp + 0x30]
00993 0f83b9150000                   jae        0x7f6a97be11d2
00999 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009a1 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
009a6 85c9                           test       ecx, ecx
009a8 7e3c                           jle        0x7f6a97bdfc66
009aa 448d41ff                       lea        r8d, [rcx - 1]
009ae 443b442430                     cmp        r8d, dword ptr [rsp + 0x30]
009b3 0f831f160000                   jae        0x7f6a97be1258
009b9 90                             nop        
009ba 90                             nop        
009bb 90                             nop        
009bc 90                             nop        
009bd 90                             nop        
009be 90                             nop        
009bf 90                             nop        
009c0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
009c8 458b448804                     mov        r8d, dword ptr [r8 + rcx*4 + 4]
009cd 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
009d5 4589448908                     mov        dword ptr [r9 + rcx*4 + 8], r8d
009da 448d59ff                       lea        r11d, [rcx - 1]
009de 418bcb                         mov        ecx, r11d
009e1 4585db                         test       r11d, r11d
009e4 7fda                           jg         0x7f6a97bdfc40
009e6 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009ee 45895308                       mov        dword ptr [r11 + 8], r10d
009f2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009fa e910fdffff                     jmp        0x7f6a97bdf98f
009ff 4183fa10                       cmp        r10d, 0x10
00a03 0f8d671a0000                   jge        0x7f6a97be16f0
00a09 4183fa08                       cmp        r10d, 8
00a0d 0f8d90070000                   jge        0x7f6a97be0423
00a13 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00a1b 4183fb10                       cmp        r11d, 0x10
00a1f 0f8eb6000000                   jle        0x7f6a97bdfd5b
00a25 4585f6                         test       r14d, r14d
00a28 0f8ca6190000                   jl         0x7f6a97be1654
00a2e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a36 4585db                         test       r11d, r11d
00a39 0f8c95190000                   jl         0x7f6a97be1654
00a3f 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a44 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00a4c 0f8282190000                   jb         0x7f6a97be1654
00a52 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
00a59 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00a60 443bd3                         cmp        r10d, ebx
00a63 0f826b190000                   jb         0x7f6a97be1654
00a69 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00a71 4585d2                         test       r10d, r10d
00a74 0f8c5a190000                   jl         0x7f6a97be1654
00a7a 4585d2                         test       r10d, r10d
00a7d 0f8444f8ffff                   je         0x7f6a97bdf547
00a83 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a88 4983fa20                       cmp        r10, 0x20
00a8c 772d                           ja         0x7f6a97bdfd3b
00a8e 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00a96 4d63d2                         movsxd     r10, r10d
00a99 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00aa0 c442a8f5db                     bzhi       r11, r11, r10
00aa5 c4c1fb92fb                     kmovq      k7, r11
00aaa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ab0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ab6 e90cf8ffff                     jmp        0x7f6a97bdf547
00abb 498bd2                         mov        rdx, r10
00abe c5f877                         vzeroupper 
00ac1 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00acb 41ffd2                         call       r10
00ace 0f1f840000000000               nop        dword ptr [rax + rax]
00ad6 e9ecf7ffff                     jmp        0x7f6a97bdf547
00adb 443b742408                     cmp        r14d, dword ptr [rsp + 8]
00ae0 0f835e160000                   jae        0x7f6a97be13c4
00ae6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00aee 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
00af4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00afc 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b01 0f83dd160000                   jae        0x7f6a97be1464
00b07 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b0f 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b17 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00b1c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b24 41ffc2                         inc        r10d
00b27 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00b2f 458d5603                       lea        r10d, [r14 + 3]
00b33 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b38 0f8322170000                   jae        0x7f6a97be14e0
00b3e 4d63c6                         movsxd     r8, r14d
00b41 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b49 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00b4f 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00b57 4183c303                       add        r11d, 3
00b5b 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00b60 0f837a170000                   jae        0x7f6a97be1560
00b66 4c639c249c000000               movsxd     r11, dword ptr [rsp + 0x9c]
00b6e 43886c1a09                     mov        byte ptr [r10 + r11 + 9], bpl
00b73 470fbe54020a                   movsx      r10d, byte ptr [r10 + r8 + 0xa]
00b79 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00b81 478854190a                     mov        byte ptr [r9 + r11 + 0xa], r10b
00b86 470fbe54010b                   movsx      r10d, byte ptr [r9 + r8 + 0xb]
00b8c 478854190b                     mov        byte ptr [r9 + r11 + 0xb], r10b
00b91 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00b99 4183fb08                       cmp        r11d, 8
00b9d 0f83ad170000                   jae        0x7f6a97be15d0
00ba3 49ba20ae28e300000000           movabs     r10, 0xe328ae20
00bad 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00bb2 4489742418                     mov        dword ptr [rsp + 0x18], r14d
00bb7 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00bbf 4183fb04                       cmp        r11d, 4
00bc3 7e43                           jle        0x7f6a97bdfe88
00bc5 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bcc 83c504                         add        ebp, 4
00bcf 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bd7 418bd6                         mov        edx, r14d
00bda 90                             nop        
00bdb 90                             nop        
00bdc c5f877                         vzeroupper 
00bdf e8fcfdb4ff                     call       0x7f6a9772fc60
00be4 0f1f8400dc0c0006               nop        dword ptr [rax + rax + 0x6000cdc]
00bec 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bf4 8bd5                           mov        edx, ebp
00bf6 8bc8                           mov        ecx, eax
00bf8 c5f877                         vzeroupper 
00bfb e8e0fdb4ff                     call       0x7f6a9772fc60
00c00 0f1f8400f80c0007               nop        dword ptr [rax + rax + 0x7000cf8]
00c08 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00c10 4183fb08                       cmp        r11d, 8
00c14 7e62                           jle        0x7f6a97bdfef8
00c16 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00c1a 49ba48ae28e300000000           movabs     r10, 0xe328ae48
00c24 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00c2c 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00c31 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00c38 83c508                         add        ebp, 8
00c3b 83c208                         add        edx, 8
00c3e 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c46 90                             nop        
00c47 90                             nop        
00c48 c5f877                         vzeroupper 
00c4b e890fdb4ff                     call       0x7f6a9772fc60
00c50 0f1f8400480d0008               nop        dword ptr [rax + rax + 0x8000d48]
00c58 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c60 8bd5                           mov        edx, ebp
00c62 488bc8                         mov        rcx, rax
00c65 90                             nop        
00c66 90                             nop        
00c67 90                             nop        
00c68 c5f877                         vzeroupper 
00c6b e870fdb4ff                     call       0x7f6a9772fc60
00c70 0f1f8400680d0009               nop        dword ptr [rax + rax + 0x9000d68]
00c78 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00c7d 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00c84 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00c88 e9fef8ffff                     jmp        0x7f6a97bdf80b
00c8d 83f830                         cmp        eax, 0x30
00c90 0f8e89000000                   jle        0x7f6a97bdff9f
00c96 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00c9e 4585d2                         test       r10d, r10d
00ca1 0f8c4d1a0000                   jl         0x7f6a97be1974
00ca7 85db                           test       ebx, ebx
00ca9 0f8c451a0000                   jl         0x7f6a97be1974
00caf 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00cb3 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00cb7 0f82371a0000                   jb         0x7f6a97be1974
00cbd 448b542408                     mov        r10d, dword ptr [rsp + 8]
00cc2 453bd5                         cmp        r10d, r13d
00cc5 0f82291a0000                   jb         0x7f6a97be1974
00ccb 85c0                           test       eax, eax
00ccd 7429                           je         0x7f6a97bdff78
00ccf 4883fa20                       cmp        rdx, 0x20
00cd3 7730                           ja         0x7f6a97bdff85
00cd5 448bd0                         mov        r10d, eax
00cd8 4d63d2                         movsxd     r10, r10d
00cdb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ce2 c442a8f5db                     bzhi       r11, r11, r10
00ce7 c4c1fb92fb                     kmovq      k7, r11
00cec 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cf2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cf8 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00d00 e905fbffff                     jmp        0x7f6a97bdfa8a
00d05 c5f877                         vzeroupper 
00d08 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00d12 41ffd2                         call       r10
00d15 0f1f840000000000               nop        dword ptr [rax + rax]
00d1d ebd9                           jmp        0x7f6a97bdff78
00d1f 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d27 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
00d2f 0f838f180000                   jae        0x7f6a97be1844
00d35 4d63c8                         movsxd     r9, r8d
00d38 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00d40 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00d47 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
00d4e 0f8300190000                   jae        0x7f6a97be18d4
00d54 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00d59 448d5b10                       lea        r11d, [rbx + 0x10]
00d5d 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d65 4c63db                         movsxd     r11, ebx
00d68 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00d70 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00d77 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00d7f 453bd5                         cmp        r10d, r13d
00d82 0f8d06040000                   jge        0x7f6a97be040e
00d88 4d2bcb                         sub        r9, r11
00d8b 4d63d2                         movsxd     r10, r10d
00d8e 48634c2444                     movsxd     rcx, dword ptr [rsp + 0x44]
00d93 4883c1f1                       add        rcx, -0xf
00d97 4f8d1c0a                       lea        r11, [r10 + r9]
00d9b 4c3bd9                         cmp        r11, rcx
00d9e 0f83e8190000                   jae        0x7f6a97be1a0c
00da4 4963fd                         movsxd     rdi, r13d
00da7 4c8bdf                         mov        r11, rdi
00daa 4d2bda                         sub        r11, r10
00dad 4983c30f                       add        r11, 0xf
00db1 4983e3f0                       and        r11, 0xfffffffffffffff0
00db5 458bdb                         mov        r11d, r11d
00db8 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00dbd 4d63d2                         movsxd     r10, r10d
00dc0 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
00dc5 4c3bd9                         cmp        r11, rcx
00dc8 0f83be190000                   jae        0x7f6a97be1a0c
00dce 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00dd6 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
00dde 0f83a8190000                   jae        0x7f6a97be1a0c
00de4 4983c2f0                       add        r10, -0x10
00de8 4c635c243c                     movsxd     r11, dword ptr [rsp + 0x3c]
00ded 4983c3f1                       add        r11, -0xf
00df1 4d3bd3                         cmp        r10, r11
00df4 0f8392190000                   jae        0x7f6a97be1a0c
00dfa 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00e01 0f8fe5190000                   jg         0x7f6a97be1a6c
00e07 458bd0                         mov        r10d, r8d
00e0a 442bd3                         sub        r10d, ebx
00e0d 83c320                         add        ebx, 0x20
00e10 e9c3000000                     jmp        0x7f6a97be0158
00e15 4d63d2                         movsxd     r10, r10d
00e18 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e1f c442a8f5db                     bzhi       r11, r11, r10
00e24 c4c1fb92fb                     kmovq      k7, r11
00e29 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e2f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e35 eb78                           jmp        0x7f6a97be012f
00e37 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00e3f 4585db                         test       r11d, r11d
00e42 0f8c44170000                   jl         0x7f6a97be180c
00e48 85db                           test       ebx, ebx
00e4a 0f8c3c170000                   jl         0x7f6a97be180c
00e50 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00e55 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00e5a 0f822c170000                   jb         0x7f6a97be180c
00e60 428d2c13                       lea        ebp, [rbx + r10]
00e64 448b442408                     mov        r8d, dword ptr [rsp + 8]
00e69 443bc5                         cmp        r8d, ebp
00e6c 0f821a170000                   jb         0x7f6a97be180c
00e72 4585d2                         test       r10d, r10d
00e75 0f8c11170000                   jl         0x7f6a97be180c
00e7b 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00e80 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
00e88 7425                           je         0x7f6a97be012f
00e8a 4963d2                         movsxd     rdx, r10d
00e8d 4883fa20                       cmp        rdx, 0x20
00e91 0f867effffff                   jbe        0x7f6a97be0095
00e97 c5f877                         vzeroupper 
00e9a 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00ea4 41ffd2                         call       r10
00ea7 0f1f840000000000               nop        dword ptr [rax + rax]
00eaf 4c8b1424                       mov        r10, qword ptr [rsp]
00eb3 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00eb7 c5f877                         vzeroupper 
00eba 4881c400010000                 add        rsp, 0x100
00ec1 5d                             pop        rbp
00ec2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ec6 0f87481d0000                   ja         0x7f6a97be1e94
00ecc c3                             ret        
00ecd 90                             nop        
00ece 90                             nop        
00ecf 90                             nop        
00ed0 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00ed8 458bc2                         mov        r8d, r10d
00edb 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00ee3 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00eeb c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00ef2 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00efa 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00f02 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00f09 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00f11 4183c310                       add        r11d, 0x10
00f15 443bdb                         cmp        r11d, ebx
00f18 7cb6                           jl         0x7f6a97be0150
00f1a 4881c710ffffff                 add        rdi, -0xf0
00f21 4881ff00000080                 cmp        rdi, -0x80000000
00f28 49c7c000000080                 mov        r8, 0xffffffff80000000
00f2f 490f4cf8                       cmovl      rdi, r8
00f33 8bff                           mov        edi, edi
00f35 443bdf                         cmp        r11d, edi
00f38 0f8dfd010000                   jge        0x7f6a97be03bb
00f3e 4d63c3                         movsxd     r8, r11d
00f41 4d03c1                         add        r8, r9
00f44 4c3bc1                         cmp        r8, rcx
00f47 0f83ff180000                   jae        0x7f6a97be1acc
00f4d 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00f55 4181c000010000                 add        r8d, 0x100
00f5c 4963d8                         movsxd     rbx, r8d
00f5f 4903d9                         add        rbx, r9
00f62 483bd9                         cmp        rbx, rcx
00f65 0f83f5180000                   jae        0x7f6a97be1ae0
00f6b 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
00f73 0f83fb180000                   jae        0x7f6a97be1af4
00f79 443b8424e0000000               cmp        r8d, dword ptr [rsp + 0xe0]
00f81 0f8301190000                   jae        0x7f6a97be1b08
00f87 90                             nop        
00f88 90                             nop        
00f89 90                             nop        
00f8a 90                             nop        
00f8b 90                             nop        
00f8c 90                             nop        
00f8d 90                             nop        
00f8e 90                             nop        
00f8f 90                             nop        
00f90 438d1c1a                       lea        ebx, [r10 + r11]
00f94 458bc3                         mov        r8d, r11d
00f97 4963f0                         movsxd     rsi, r8d
00f9a 8bd3                           mov        edx, ebx
00f9c 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fa4 c4c17a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + rdx + 8]
00fab 4863db                         movsxd     rbx, ebx
00fae 458bc3                         mov        r8d, r11d
00fb1 488b9424c0000000               mov        rdx, qword ptr [rsp + 0xc0]
00fb9 c4a17a7f440208                 vmovdqu    xmmword ptr [rdx + r8 + 8], xmm0
00fc0 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fc8 c4c17a6f441818                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x18]
00fcf c5fa7f443218                   vmovdqu    xmmword ptr [rdx + rsi + 0x18], xmm0
00fd5 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fdd c4c17a6f441828                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x28]
00fe4 c5fa7f443228                   vmovdqu    xmmword ptr [rdx + rsi + 0x28], xmm0
00fea 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00ff2 c4c17a6f441838                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x38]
00ff9 c5fa7f443238                   vmovdqu    xmmword ptr [rdx + rsi + 0x38], xmm0
00fff 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01007 c4c17a6f441848                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x48]
0100e c5fa7f443248                   vmovdqu    xmmword ptr [rdx + rsi + 0x48], xmm0
01014 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
0101c c4c17a6f441858                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x58]
01023 c5fa7f443258                   vmovdqu    xmmword ptr [rdx + rsi + 0x58], xmm0
01029 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01031 c4c17a6f441868                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x68]
01038 c5fa7f443268                   vmovdqu    xmmword ptr [rdx + rsi + 0x68], xmm0
0103e 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01046 c4c17a6f441878                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x78]
0104d c5fa7f443278                   vmovdqu    xmmword ptr [rdx + rsi + 0x78], xmm0
01053 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
0105b c4c17a6f841888000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x88]
01065 c5fa7f843288000000             vmovdqu    xmmword ptr [rdx + rsi + 0x88], xmm0
0106e 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01076 c4c17a6f841898000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x98]
01080 c5fa7f843298000000             vmovdqu    xmmword ptr [rdx + rsi + 0x98], xmm0
01089 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01091 c4c17a6f8418a8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xa8]
0109b c5fa7f8432a8000000             vmovdqu    xmmword ptr [rdx + rsi + 0xa8], xmm0
010a4 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
010ac c4c17a6f8418b8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xb8]
010b6 c5fa7f8432b8000000             vmovdqu    xmmword ptr [rdx + rsi + 0xb8], xmm0
010bf 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
010c7 c4c17a6f8418c8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xc8]
010d1 c5fa7f8432c8000000             vmovdqu    xmmword ptr [rdx + rsi + 0xc8], xmm0
010da 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
010e2 c4c17a6f8418d8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xd8]
010ec c5fa7f8432d8000000             vmovdqu    xmmword ptr [rdx + rsi + 0xd8], xmm0
010f5 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
010fd c4c17a6f8418e8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xe8]
01107 c5fa7f8432e8000000             vmovdqu    xmmword ptr [rdx + rsi + 0xe8], xmm0
01110 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01118 c4c17a6f8418f8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xf8]
01122 c5fa7f8432f8000000             vmovdqu    xmmword ptr [rdx + rsi + 0xf8], xmm0
0112b 4181c300010000                 add        r11d, 0x100
01132 443bdf                         cmp        r11d, edi
01135 0f8c55feffff                   jl         0x7f6a97be0210
0113b 453bdd                         cmp        r11d, r13d
0113e 7d4e                           jge        0x7f6a97be040e
01140 4d63c3                         movsxd     r8, r11d
01143 4d03c1                         add        r8, r9
01146 4c3bc1                         cmp        r8, rcx
01149 0f8389190000                   jae        0x7f6a97be1d58
0114f 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
01157 0f838f190000                   jae        0x7f6a97be1d6c
0115d 90                             nop        
0115e 90                             nop        
0115f 90                             nop        
01160 478d041a                       lea        r8d, [r10 + r11]
01164 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
0116c c4817a6f440108                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 8]
01173 458bcb                         mov        r9d, r11d
01176 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0117e c4817a7f440808                 vmovdqu    xmmword ptr [r8 + r9 + 8], xmm0
01185 4183c310                       add        r11d, 0x10
01189 453bdd                         cmp        r11d, r13d
0118c 7cd2                           jl         0x7f6a97be03e0
0118e 03442438                       add        eax, dword ptr [rsp + 0x38]
01192 89442474                       mov        dword ptr [rsp + 0x74], eax
01196 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
0119e e967f6ffff                     jmp        0x7f6a97bdfa8a
011a3 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
011ab 0f83eb160000                   jae        0x7f6a97be1b1c
011b1 458bd6                         mov        r10d, r14d
011b4 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
011bc 4963ca                         movsxd     rcx, r10d
011bf 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
011c7 4d8b540a08                     mov        r10, qword ptr [r10 + rcx + 8]
011cc 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
011d4 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
011dc 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
011e4 0f8346170000                   jae        0x7f6a97be1bb0
011ea 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
011f2 4183c208                       add        r10d, 8
011f6 4489542468                     mov        dword ptr [rsp + 0x68], r10d
011fb 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
011ff 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
01207 4d63d9                         movsxd     r11, r9d
0120a 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01212 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
0121a 4b895c1808                     mov        qword ptr [r8 + r11 + 8], rbx
0121f 418d5908                       lea        ebx, [r9 + 8]
01223 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01227 418502                         test       dword ptr [r10], eax
0122a 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
01231 0f8d41faffff                   jge        0x7f6a97bdfef8
01237 492bcb                         sub        rcx, r11
0123a 48635c240c                     movsxd     rbx, dword ptr [rsp + 0xc]
0123f 4883c3f9                       add        rbx, -7
01243 4c6344246c                     movsxd     r8, dword ptr [rsp + 0x6c]
01248 4d8d1408                       lea        r10, [r8 + rcx]
0124c 4c3bd3                         cmp        r10, rbx
0124f 0f834f170000                   jae        0x7f6a97be1c24
01255 4863942498000000               movsxd     rdx, dword ptr [rsp + 0x98]
0125d 4c8bd2                         mov        r10, rdx
01260 4d2bd0                         sub        r10, r8
01263 4983c207                       add        r10, 7
01267 4983e2f8                       and        r10, 0xfffffffffffffff8
0126b 458bd2                         mov        r10d, r10d
0126e 478d540a08                     lea        r10d, [r10 + r9 + 8]
01273 4d63d2                         movsxd     r10, r10d
01276 4d8d5c0af8                     lea        r11, [r10 + rcx - 8]
0127b 4c3bdb                         cmp        r11, rbx
0127e 0f8320170000                   jae        0x7f6a97be1c24
01284 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01289 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
01291 0f830d170000                   jae        0x7f6a97be1c24
01297 4983c2f8                       add        r10, -8
0129b 4c3bd3                         cmp        r10, rbx
0129e 0f8300170000                   jae        0x7f6a97be1c24
012a4 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
012ac 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
012b3 0f8f57170000                   jg         0x7f6a97be1c90
012b9 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
012c1 452bd9                         sub        r11d, r9d
012c4 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
012c9 41bbf8ffffff                   mov        r11d, 0xfffffff8
012cf 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
012d7 418bfa                         mov        edi, r10d
012da 442bdf                         sub        r11d, edi
012dd 452bd9                         sub        r11d, r9d
012e0 4183c110                       add        r9d, 0x10
012e4 4183c3f0                       add        r11d, -0x10
012e8 4c8d52c8                       lea        r10, [rdx - 0x38]
012ec 4981fa00000080                 cmp        r10, -0x80000000
012f3 48c7c700000080                 mov        rdi, 0xffffffff80000000
012fa 4c0f4cd7                       cmovl      r10, rdi
012fe 418bfa                         mov        edi, r10d
01301 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
01309 4963f1                         movsxd     rsi, r9d
0130c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01314 498bc2                         mov        rax, r10
01317 41ba06000000                   mov        r10d, 6
0131d c442a8f5d3                     bzhi       r10, r11, r10
01322 4903f2                         add        rsi, r10
01325 483bf2                         cmp        rsi, rdx
01328 4c8bda                         mov        r11, rdx
0132b 4c0f4cde                       cmovl      r11, rsi
0132f 4d8bd3                         mov        r10, r11
01332 4d2bd0                         sub        r10, r8
01335 498d72ff                       lea        rsi, [r10 - 1]
01339 48c1fe3f                       sar        rsi, 0x3f
0133d 48c1ee3d                       shr        rsi, 0x3d
01341 4e8d5416ff                     lea        r10, [rsi + r10 - 1]
01346 4983e2f8                       and        r10, 0xfffffffffffffff8
0134a 4d03d0                         add        r10, r8
0134d 4d3bc2                         cmp        r8, r10
01350 4d0f4cc2                       cmovl      r8, r10
01354 458bd0                         mov        r10d, r8d
01357 478d441608                     lea        r8d, [r14 + r10 + 8]
0135c 4183c208                       add        r10d, 8
01360 4963f0                         movsxd     rsi, r8d
01363 4803f0                         add        rsi, rax
01366 4963ea                         movsxd     rbp, r10d
01369 4803e8                         add        rbp, rax
0136c 4c8d4608                       lea        r8, [rsi + 8]
01370 4883c648                       add        rsi, 0x48
01374 488d4548                       lea        rax, [rbp + 0x48]
01378 4533d2                         xor        r10d, r10d
0137b 493bc0                         cmp        rax, r8
0137e 410f96c2                       setbe      r10b
01382 4883c508                       add        rbp, 8
01386 488bc6                         mov        rax, rsi
01389 33f6                           xor        esi, esi
0138b 483bc5                         cmp        rax, rbp
0138e 400f96c6                       setbe      sil
01392 440bd6                         or         r10d, esi
01395 0f84590a0000                   je         0x7f6a97be1074
0139b 458bcb                         mov        r9d, r11d
0139e eb04                           jmp        0x7f6a97be0624
013a0 8974246c                       mov        dword ptr [rsp + 0x6c], esi
013a4 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
013a9 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
013ae 440344246c                     add        r8d, dword ptr [rsp + 0x6c]
013b3 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
013bb 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
013c0 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
013c8 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
013cd 8b74246c                       mov        esi, dword ptr [rsp + 0x6c]
013d1 83c608                         add        esi, 8
013d4 413bf1                         cmp        esi, r9d
013d7 7cc7                           jl         0x7f6a97be0620
013d9 4881c208feffff                 add        rdx, -0x1f8
013e0 4881fa00000080                 cmp        rdx, -0x80000000
013e7 49c7c200000080                 mov        r10, 0xffffffff80000000
013ee 490f4cd2                       cmovl      rdx, r10
013f2 8bc2                           mov        eax, edx
013f4 3bf0                           cmp        esi, eax
013f6 0f8d84160000                   jge        0x7f6a97be1d00
013fc 4c63d6                         movsxd     r10, esi
013ff 4c03d1                         add        r10, rcx
01402 4c3bd3                         cmp        r10, rbx
01405 0f837d160000                   jae        0x7f6a97be1d08
0140b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01410 4181c300020000                 add        r11d, 0x200
01417 4d63d3                         movsxd     r10, r11d
0141a 4c03d1                         add        r10, rcx
0141d 4c3bd3                         cmp        r10, rbx
01420 0f8376160000                   jae        0x7f6a97be1d1c
01426 3bb424c8000000                 cmp        esi, dword ptr [rsp + 0xc8]
0142d 0f837d160000                   jae        0x7f6a97be1d30
01433 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0143b 0f8383160000                   jae        0x7f6a97be1d44
01441 eb10                           jmp        0x7f6a97be06d3
01443 90                             nop        
01444 90                             nop        
01445 90                             nop        
01446 90                             nop        
01447 90                             nop        
01448 90                             nop        
01449 90                             nop        
0144a 90                             nop        
0144b 90                             nop        
0144c 90                             nop        
0144d 90                             nop        
0144e 90                             nop        
0144f 90                             nop        
01450 418bf1                         mov        esi, r9d
01453 448d9600010000                 lea        r10d, [rsi + 0x100]
0145a 4403542418                     add        r10d, dword ptr [rsp + 0x18]
0145f 448d8e80000000                 lea        r9d, [rsi + 0x80]
01466 44034c2418                     add        r9d, dword ptr [rsp + 0x18]
0146b 418bd2                         mov        edx, r10d
0146e 4963ea                         movsxd     rbp, r10d
01471 448bc6                         mov        r8d, esi
01474 448b6c2418                     mov        r13d, dword ptr [rsp + 0x18]
01479 4403ee                         add        r13d, esi
0147c 448bd6                         mov        r10d, esi
0147f 4d63f2                         movsxd     r14, r10d
01482 458bdd                         mov        r11d, r13d
01485 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0148d 62917e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 8]
01498 62917e487f840208000000         vmovdqu32  zmmword ptr [r10 + r8 + 8], zmm0
014a3 4d63c5                         movsxd     r8, r13d
014a6 448d5640                       lea        r10d, [rsi + 0x40]
014aa 4403542418                     add        r10d, dword ptr [rsp + 0x18]
014af 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
014b7 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
014c2 62917e487f843348000000         vmovdqu32  zmmword ptr [r11 + r14 + 0x48], zmm0
014cd 62917e486f840b08000000         vmovdqu32  zmm0, zmmword ptr [r11 + r9 + 8]
014d8 62917e487f843388000000         vmovdqu32  zmmword ptr [r11 + r14 + 0x88], zmm0
014e3 62917e486f8403c8000000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 0xc8]
014ee 62917e487f8433c8000000         vmovdqu32  zmmword ptr [r11 + r14 + 0xc8], zmm0
014f9 62d17e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + rdx + 8]
01504 62917e487f843308010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x108], zmm0
0150f 62917e486f840348010000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 0x148]
0151a 62917e487f843348010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x148], zmm0
01525 62917e486f840388010000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 0x188]
01530 62917e487f843388010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x188], zmm0
0153b 62d17e486f842bc8000000         vmovdqu32  zmm0, zmmword ptr [r11 + rbp + 0xc8]
01546 62917e487f8433c8010000         vmovdqu32  zmmword ptr [r11 + r14 + 0x1c8], zmm0
01551 448d8e00020000                 lea        r9d, [rsi + 0x200]
01558 443bc8                         cmp        r9d, eax
0155b 0f8ceffeffff                   jl         0x7f6a97be06d0
01561 443bcf                         cmp        r9d, edi
01564 7d54                           jge        0x7f6a97be083a
01566 81c638020000                   add        esi, 0x238
0156c 4c63d6                         movsxd     r10, esi
0156f 4c03d1                         add        r10, rcx
01572 4c3bd3                         cmp        r10, rbx
01575 0f8385150000                   jae        0x7f6a97be1d80
0157b 3bb424c8000000                 cmp        esi, dword ptr [rsp + 0xc8]
01582 0f83a0150000                   jae        0x7f6a97be1da8
01588 458bd9                         mov        r11d, r9d
0158b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01590 4503d1                         add        r10d, r9d
01593 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0159b 62917e486f841008000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 8]
015a6 62917e487f841808000000         vmovdqu32  zmmword ptr [r8 + r11 + 8], zmm0
015b1 4183c140                       add        r9d, 0x40
015b5 443bcf                         cmp        r9d, edi
015b8 7cce                           jl         0x7f6a97be0808
015ba 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
015c2 0f8db0f6ffff                   jge        0x7f6a97bdfef8
015c8 4d63d1                         movsxd     r10, r9d
015cb 4c03d1                         add        r10, rcx
015ce 4c3bd3                         cmp        r10, rbx
015d1 0f833d150000                   jae        0x7f6a97be1d94
015d7 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
015df 0f8357150000                   jae        0x7f6a97be1dbc
015e5 90                             nop        
015e6 90                             nop        
015e7 90                             nop        
015e8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
015ed 4503d9                         add        r11d, r9d
015f0 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
015f8 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
015fd 458bc1                         mov        r8d, r9d
01600 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01608 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
0160d 4183c108                       add        r9d, 8
01611 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
01619 7ccd                           jl         0x7f6a97be0868
0161b e958f6ffff                     jmp        0x7f6a97bdfef8
01620 bee4ffffff                     mov        esi, 0xffffffe4
01625 488b2c24                       mov        rbp, qword ptr [rsp]
01629 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0162e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01633 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01638 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0163d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01642 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01647 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0164b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01650 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01655 4489442464                     mov        dword ptr [rsp + 0x64], r8d
0165a 90                             nop        
0165b 90                             nop        
0165c c5f877                         vzeroupper 
0165f e87cd1aeff                     call       0x7f6a976cda60
01664 0f1f84005c17000b               nop        dword ptr [rax + rax + 0xb00175c]
0166c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01676 4883e4f0                       and        rsp, 0xfffffffffffffff0
0167a e861dc1318                     call       0x7f6aafd1e560
0167f f4                             hlt        
01680 bee4ffffff                     mov        esi, 0xffffffe4
01685 488b2c24                       mov        rbp, qword ptr [rsp]
01689 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0168e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01693 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01698 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0169d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016a2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016a7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016ab 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
016b0 4489442438                     mov        dword ptr [rsp + 0x38], r8d
016b5 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
016ba 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
016bf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016c4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016c9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
016ce 4489442460                     mov        dword ptr [rsp + 0x60], r8d
016d3 89442464                       mov        dword ptr [rsp + 0x64], eax
016d7 90                             nop        
016d8 c5f877                         vzeroupper 
016db e800d1aeff                     call       0x7f6a976cda60
016e0 0f1f8400d817000c               nop        dword ptr [rax + rax + 0xc0017d8]
016e8 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
016f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016f6 e8e5db1318                     call       0x7f6aafd1e560
016fb f4                             hlt        
016fc bee4ffffff                     mov        esi, 0xffffffe4
01701 488b2c24                       mov        rbp, qword ptr [rsp]
01705 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0170a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0170f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01714 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01719 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0171e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01723 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01728 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0172d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01732 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01737 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0173c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01741 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01746 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0174e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01753 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0175b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01760 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01765 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0176a 89442464                       mov        dword ptr [rsp + 0x64], eax
0176e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01772 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0177b 90                             nop        
0177c c5f877                         vzeroupper 
0177f e85cd0aeff                     call       0x7f6a976cda60
01784 0f1f84007c18000d               nop        dword ptr [rax + rax + 0xd00187c]
0178c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01796 4883e4f0                       and        rsp, 0xfffffffffffffff0
0179a e841db1318                     call       0x7f6aafd1e560
0179f f4                             hlt        
017a0 bee4ffffff                     mov        esi, 0xffffffe4
017a5 488b2c24                       mov        rbp, qword ptr [rsp]
017a9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017ae 4489542408                     mov        dword ptr [rsp + 8], r10d
017b3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017b8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017bd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017c2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017c7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
017cc 4489542434                     mov        dword ptr [rsp + 0x34], r10d
017d1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
017d6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
017db 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
017e0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
017e5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017ea 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017ef 4489742470                     mov        dword ptr [rsp + 0x70], r14d
017f4 c5f877                         vzeroupper 
017f7 e8e4cfaeff                     call       0x7f6a976cda60
017fc 0f1f8400f418000e               nop        dword ptr [rax + rax + 0xe0018f4]
01804 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0180e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01812 e8c9da1318                     call       0x7f6aafd1e560
01817 f4                             hlt        
01818 be45ffffff                     mov        esi, 0xffffff45
0181d 488b2c24                       mov        rbp, qword ptr [rsp]
01821 4c89542408                     mov        qword ptr [rsp + 8], r10
01826 90                             nop        
01827 90                             nop        
01828 c5f877                         vzeroupper 
0182b e8b0cfaeff                     call       0x7f6a976cda60
01830 0f1f84002819000f               nop        dword ptr [rax + rax + 0xf001928]
01838 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01842 4883e4f0                       and        rsp, 0xfffffffffffffff0
01846 e895da1318                     call       0x7f6aafd1e560
0184b f4                             hlt        
0184c be45ffffff                     mov        esi, 0xffffff45
01851 488b2c24                       mov        rbp, qword ptr [rsp]
01855 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0185a 4489542408                     mov        dword ptr [rsp + 8], r10d
0185f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01864 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01869 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0186e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01873 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01877 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0187c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01881 448bd8                         mov        r11d, eax
01884 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01889 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0188e 90                             nop        
0188f 90                             nop        
01890 c5f877                         vzeroupper 
01893 e848cfaeff                     call       0x7f6a976cda60
01898 0f1f840090190010               nop        dword ptr [rax + rax + 0x10001990]
018a0 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
018aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
018ae e82dda1318                     call       0x7f6aafd1e560
018b3 f4                             hlt        
018b4 493bea                         cmp        rbp, r10
018b7 bdffffffff                     mov        ebp, 0xffffffff
018bc 7c08                           jl         0x7f6a97be0b46
018be 400f95c5                       setne      bpl
018c2 400fb6ed                       movzx      ebp, bpl
018c6 be45ffffff                     mov        esi, 0xffffff45
018cb 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
018d0 4489442414                     mov        dword ptr [rsp + 0x14], r8d
018d5 895c2438                       mov        dword ptr [rsp + 0x38], ebx
018d9 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
018de 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
018e3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018e8 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
018ed 8944246c                       mov        dword ptr [rsp + 0x6c], eax
018f1 4c89542478                     mov        qword ptr [rsp + 0x78], r10
018f6 90                             nop        
018f7 90                             nop        
018f8 c5f877                         vzeroupper 
018fb e8e0ceaeff                     call       0x7f6a976cda60
01900 0f1f8400f8190011               nop        dword ptr [rax + rax + 0x110019f8]
01908 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01912 4883e4f0                       and        rsp, 0xfffffffffffffff0
01916 e8c5d91318                     call       0x7f6aafd1e560
0191b f4                             hlt        
0191c be45ffffff                     mov        esi, 0xffffff45
01921 488b2c24                       mov        rbp, qword ptr [rsp]
01925 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0192a 4489442408                     mov        dword ptr [rsp + 8], r8d
0192f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01934 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01939 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0193e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01943 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01947 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
0194c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01951 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01956 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0195b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01960 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01965 89442464                       mov        dword ptr [rsp + 0x64], eax
01969 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0196e 90                             nop        
0196f 90                             nop        
01970 c5f877                         vzeroupper 
01973 e868ceaeff                     call       0x7f6a976cda60
01978 0f1f8400701a0012               nop        dword ptr [rax + rax + 0x12001a70]
01980 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0198a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0198e e84dd91318                     call       0x7f6aafd1e560
01993 f4                             hlt        
01994 be45ffffff                     mov        esi, 0xffffff45
01999 488b2c24                       mov        rbp, qword ptr [rsp]
0199d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019a2 4489542408                     mov        dword ptr [rsp + 8], r10d
019a7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019b1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019b6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019bb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019bf 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019c4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019c9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019ce 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
019d3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019d8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
019dd 89442464                       mov        dword ptr [rsp + 0x64], eax
019e1 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
019e6 4489542470                     mov        dword ptr [rsp + 0x70], r10d
019eb 90                             nop        
019ec c5f877                         vzeroupper 
019ef e8eccdaeff                     call       0x7f6a976cda60
019f4 0f1f8400ec1a0013               nop        dword ptr [rax + rax + 0x13001aec]
019fc 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a0a e8d1d81318                     call       0x7f6aafd1e560
01a0f f4                             hlt        
01a10 bee4ffffff                     mov        esi, 0xffffffe4
01a15 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a1a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a1f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a23 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a28 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01a2d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a32 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a37 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01a3f 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01a44 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01a4c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01a51 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01a59 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01a5e 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01a66 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01a6b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01a70 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01a78 c5f877                         vzeroupper 
01a7b e860cdaeff                     call       0x7f6a976cda60
01a80 0f1f8400781b0014               nop        dword ptr [rax + rax + 0x14001b78]
01a88 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01a92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a96 e845d81318                     call       0x7f6aafd1e560
01a9b f4                             hlt        
01a9c bee4ffffff                     mov        esi, 0xffffffe4
01aa1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01aa6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01aab 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01aaf 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ab4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ab9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01abe 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ac3 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01acb 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01ad0 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ad8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01add 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01ae5 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01aea 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01aef 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01af4 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01af9 90                             nop        
01afa 90                             nop        
01afb 90                             nop        
01afc c5f877                         vzeroupper 
01aff e8dcccaeff                     call       0x7f6a976cda60
01b04 0f1f8400fc1b0015               nop        dword ptr [rax + rax + 0x15001bfc]
01b0c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01b16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b1a e8c1d71318                     call       0x7f6aafd1e560
01b1f f4                             hlt        
01b20 bebeffffff                     mov        esi, 0xffffffbe
01b25 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b2a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b2f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01b33 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01b38 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01b3d 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01b42 90                             nop        
01b43 90                             nop        
01b44 c5f877                         vzeroupper 
01b47 e894ccaeff                     call       0x7f6a976cda60
01b4c 0f1f8400441c0016               nop        dword ptr [rax + rax + 0x16001c44]
01b54 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b62 e879d71318                     call       0x7f6aafd1e560
01b67 f4                             hlt        
01b68 4533d2                         xor        r10d, r10d
01b6b 4c891424                       mov        qword ptr [rsp], r10
01b6f e9efe5ffff                     jmp        0x7f6a97bdf3e3
01b74 4533d2                         xor        r10d, r10d
01b77 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01b7f e90ee6ffff                     jmp        0x7f6a97bdf412
01b84 4533d2                         xor        r10d, r10d
01b87 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
01b8f e928e6ffff                     jmp        0x7f6a97bdf43c
01b94 4533d2                         xor        r10d, r10d
01b97 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b9c e947e6ffff                     jmp        0x7f6a97bdf468
01ba1 4533d2                         xor        r10d, r10d
01ba4 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
01bac e961e6ffff                     jmp        0x7f6a97bdf492
01bb1 beccffffff                     mov        esi, 0xffffffcc
01bb6 488b2c24                       mov        rbp, qword ptr [rsp]
01bba 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bc3 89442408                       mov        dword ptr [rsp + 8], eax
01bc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bcc 48ff742420                     push       qword ptr [rsp + 0x20]
01bd1 488f442418                     pop        qword ptr [rsp + 0x18]
01bd6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bdb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01be0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01be5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bea 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01bef 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01bf4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01bf9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01bfe 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c03 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01c08 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01c10 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01c15 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01c1d 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01c22 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01c2a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01c2f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c34 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01c39 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01c41 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01c46 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
01c4b 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01c52 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01c5a 90                             nop        
01c5b 90                             nop        
01c5c c5f877                         vzeroupper 
01c5f e87ccbaeff                     call       0x7f6a976cda60
01c64 0f1f84005c1d0017               nop        dword ptr [rax + rax + 0x17001d5c]
01c6c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01c76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c7a e861d61318                     call       0x7f6aafd1e560
01c7f f4                             hlt        
01c80 beccffffff                     mov        esi, 0xffffffcc
01c85 488b2c24                       mov        rbp, qword ptr [rsp]
01c89 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c8e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c93 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c98 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c9d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ca2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ca7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01cac 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01cb1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01cb6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cbb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cc0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cc5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01cca 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ccf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01cd4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01cd9 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01ce1 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01ce6 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01ceb 90                             nop        
01cec c5f877                         vzeroupper 
01cef e8eccaaeff                     call       0x7f6a976cda60
01cf4 0f1f8400ec1d0018               nop        dword ptr [rax + rax + 0x18001dec]
01cfc 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01d06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d0a e8d1d51318                     call       0x7f6aafd1e560
01d0f f4                             hlt        
01d10 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01d18 4d3bd8                         cmp        r11, r8
01d1b bdffffffff                     mov        ebp, 0xffffffff
01d20 7c08                           jl         0x7f6a97be0faa
01d22 400f95c5                       setne      bpl
01d26 400fb6ed                       movzx      ebp, bpl
01d2a be45ffffff                     mov        esi, 0xffffff45
01d2f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01d34 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01d39 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01d3d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01d42 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01d47 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01d4c 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01d51 89442468                       mov        dword ptr [rsp + 0x68], eax
01d55 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01d5a 90                             nop        
01d5b 90                             nop        
01d5c c5f877                         vzeroupper 
01d5f e87ccaaeff                     call       0x7f6a976cda60
01d64 0f1f84005c1e0019               nop        dword ptr [rax + rax + 0x19001e5c]
01d6c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01d76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d7a e861d51318                     call       0x7f6aafd1e560
01d7f f4                             hlt        
01d80 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01d88 493be8                         cmp        rbp, r8
01d8b bdffffffff                     mov        ebp, 0xffffffff
01d90 7c08                           jl         0x7f6a97be101a
01d92 400f95c5                       setne      bpl
01d96 400fb6ed                       movzx      ebp, bpl
01d9a be45ffffff                     mov        esi, 0xffffff45
01d9f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01da4 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01da9 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01dad 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01db2 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01db7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01dbc 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01dc1 89442468                       mov        dword ptr [rsp + 0x68], eax
01dc5 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01dca 90                             nop        
01dcb 90                             nop        
01dcc c5f877                         vzeroupper 
01dcf e80ccaaeff                     call       0x7f6a976cda60
01dd4 0f1f8400cc1e001a               nop        dword ptr [rax + rax + 0x1a001ecc]
01ddc 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01de6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dea e8f1d41318                     call       0x7f6aafd1e560
01def f4                             hlt        
01df0 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01df4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01df9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01dfe 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
01e03 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01e0b 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01e10 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01e15 8b54246c                       mov        edx, dword ptr [rsp + 0x6c]
01e19 83c208                         add        edx, 8
01e1c 413bd1                         cmp        edx, r9d
01e1f 7ccf                           jl         0x7f6a97be1070
01e21 3bd7                           cmp        edx, edi
01e23 0f8dc9000000                   jge        0x7f6a97be1172
01e29 4c63d2                         movsxd     r10, edx
01e2c 4c03d1                         add        r10, rcx
01e2f 4c3bd3                         cmp        r10, rbx
01e32 0f83180d0000                   jae        0x7f6a97be1dd0
01e38 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01e3d 4183c340                       add        r11d, 0x40
01e41 4d63d3                         movsxd     r10, r11d
01e44 4c03d1                         add        r10, rcx
01e47 4c3bd3                         cmp        r10, rbx
01e4a 0f83140d0000                   jae        0x7f6a97be1de4
01e50 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
01e57 0f831b0d0000                   jae        0x7f6a97be1df8
01e5d 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
01e65 0f83210d0000                   jae        0x7f6a97be1e0c
01e6b 90                             nop        
01e6c 90                             nop        
01e6d 90                             nop        
01e6e 90                             nop        
01e6f 90                             nop        
01e70 448bda                         mov        r11d, edx
01e73 4963f3                         movsxd     rsi, r11d
01e76 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01e7b 4403d2                         add        r10d, edx
01e7e 448bda                         mov        r11d, edx
01e81 458bca                         mov        r9d, r10d
01e84 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01e8c 4f8b440808                     mov        r8, qword ptr [r8 + r9 + 8]
01e91 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01e99 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
01e9e 4d63da                         movsxd     r11, r10d
01ea1 4f8b541910                     mov        r10, qword ptr [r9 + r11 + 0x10]
01ea6 4d89543110                     mov        qword ptr [r9 + rsi + 0x10], r10
01eab 4f8b541918                     mov        r10, qword ptr [r9 + r11 + 0x18]
01eb0 4d89543118                     mov        qword ptr [r9 + rsi + 0x18], r10
01eb5 4f8b541920                     mov        r10, qword ptr [r9 + r11 + 0x20]
01eba 4d89543120                     mov        qword ptr [r9 + rsi + 0x20], r10
01ebf 4f8b541928                     mov        r10, qword ptr [r9 + r11 + 0x28]
01ec4 4d89543128                     mov        qword ptr [r9 + rsi + 0x28], r10
01ec9 4f8b541930                     mov        r10, qword ptr [r9 + r11 + 0x30]
01ece 4d89543130                     mov        qword ptr [r9 + rsi + 0x30], r10
01ed3 4f8b541938                     mov        r10, qword ptr [r9 + r11 + 0x38]
01ed8 4d89543138                     mov        qword ptr [r9 + rsi + 0x38], r10
01edd 4f8b541940                     mov        r10, qword ptr [r9 + r11 + 0x40]
01ee2 4d89543140                     mov        qword ptr [r9 + rsi + 0x40], r10
01ee7 83c240                         add        edx, 0x40
01eea 3bd7                           cmp        edx, edi
01eec 0f8c7effffff                   jl         0x7f6a97be10f0
01ef2 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01ef9 0f8d79edffff                   jge        0x7f6a97bdfef8
01eff 4c63d2                         movsxd     r10, edx
01f02 4c03d1                         add        r10, rcx
01f05 4c3bd3                         cmp        r10, rbx
01f08 0f83920c0000                   jae        0x7f6a97be1e20
01f0e 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
01f15 0f83990c0000                   jae        0x7f6a97be1e34
01f1b 90                             nop        
01f1c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f21 4403da                         add        r11d, edx
01f24 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01f2c 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01f31 448bc2                         mov        r8d, edx
01f34 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01f3c 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01f41 83c208                         add        edx, 8
01f44 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01f4b 7ccf                           jl         0x7f6a97be119c
01f4d e926edffff                     jmp        0x7f6a97bdfef8
01f52 bee4ffffff                     mov        esi, 0xffffffe4
01f57 488b2c24                       mov        rbp, qword ptr [rsp]
01f5b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f60 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f65 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f6a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f6f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f74 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f79 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f7d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01f82 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f87 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f8c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f91 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01f99 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01f9e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01fa3 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01fa8 89442464                       mov        dword ptr [rsp + 0x64], eax
01fac 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01fb3 90                             nop        
01fb4 c5f877                         vzeroupper 
01fb7 e824c8aeff                     call       0x7f6a976cda60
01fbc 0f1f8400b420001b               nop        dword ptr [rax + rax + 0x1b0020b4]
01fc4 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
01fce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fd2 e809d31318                     call       0x7f6aafd1e560
01fd7 f4                             hlt        
01fd8 be6effffff                     mov        esi, 0xffffff6e
01fdd 488b2c24                       mov        rbp, qword ptr [rsp]
01fe1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01fe6 44895c2408                     mov        dword ptr [rsp + 8], r11d
01feb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01ff0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ff5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ffa 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fff 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02003 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02008 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0200d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
02012 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
02017 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0201c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02021 89442464                       mov        dword ptr [rsp + 0x64], eax
02025 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0202a 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
0202e 90                             nop        
0202f 90                             nop        
02030 c5f877                         vzeroupper 
02033 e8a8c7aeff                     call       0x7f6a976cda60
02038 0f1f84003021001c               nop        dword ptr [rax + rax + 0x1c002130]
02040 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0204a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0204e e88dd21318                     call       0x7f6aafd1e560
02053 f4                             hlt        
02054 be45ffffff                     mov        esi, 0xffffff45
02059 488b2c24                       mov        rbp, qword ptr [rsp]
0205d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02062 44895c2408                     mov        dword ptr [rsp + 8], r11d
02067 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0206c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02071 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02076 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0207b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0207f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02084 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02089 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0208e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02093 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02098 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0209d 89442464                       mov        dword ptr [rsp + 0x64], eax
020a1 894c2478                       mov        dword ptr [rsp + 0x78], ecx
020a5 90                             nop        
020a6 90                             nop        
020a7 90                             nop        
020a8 c5f877                         vzeroupper 
020ab e830c7aeff                     call       0x7f6a976cda60
020b0 0f1f8400a821001d               nop        dword ptr [rax + rax + 0x1d0021a8]
020b8 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
020c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
020c6 e815d21318                     call       0x7f6aafd1e560
020cb f4                             hlt        
020cc be3dffffff                     mov        esi, 0xffffff3d
020d1 488b2c24                       mov        rbp, qword ptr [rsp]
020d5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
020da 44895c2408                     mov        dword ptr [rsp + 8], r11d
020df 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020e4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020e9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
020ee 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020f3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020f7 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
020fc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02101 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02106 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0210b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02110 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02115 89442464                       mov        dword ptr [rsp + 0x64], eax
02119 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0211d 90                             nop        
0211e 90                             nop        
0211f 90                             nop        
02120 c5f877                         vzeroupper 
02123 e8b8c6aeff                     call       0x7f6a976cda60
02128 0f1f84002022001e               nop        dword ptr [rax + rax + 0x1e002220]
02130 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0213a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0213e e89dd11318                     call       0x7f6aafd1e560
02143 f4                             hlt        
02144 bee4ffffff                     mov        esi, 0xffffffe4
02149 488b2c24                       mov        rbp, qword ptr [rsp]
0214d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02152 4489542408                     mov        dword ptr [rsp + 8], r10d
02157 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0215c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02161 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02166 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0216b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02170 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02175 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0217a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0217f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02184 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02189 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0218e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02193 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0219b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
021a0 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
021a8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
021ad 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
021b2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
021b7 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
021bf 90                             nop        
021c0 c5f877                         vzeroupper 
021c3 e818c6aeff                     call       0x7f6a976cda60
021c8 0f1f8400c022001f               nop        dword ptr [rax + rax + 0x1f0022c0]
021d0 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
021da 4883e4f0                       and        rsp, 0xfffffffffffffff0
021de e8fdd01318                     call       0x7f6aafd1e560
021e3 f4                             hlt        
021e4 bee4ffffff                     mov        esi, 0xffffffe4
021e9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021ee 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
021f3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
021f8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
021fd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02202 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02207 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0220c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02211 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02219 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0221e 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02226 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0222b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02230 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02235 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0223a 90                             nop        
0223b 90                             nop        
0223c c5f877                         vzeroupper 
0223f e89cc5aeff                     call       0x7f6a976cda60
02244 0f1f84003c230020               nop        dword ptr [rax + rax + 0x2000233c]
0224c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02256 4883e4f0                       and        rsp, 0xfffffffffffffff0
0225a e881d01318                     call       0x7f6aafd1e560
0225f f4                             hlt        
02260 418d6e01                       lea        ebp, [r14 + 1]
02264 bee4ffffff                     mov        esi, 0xffffffe4
02269 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0226e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02273 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02278 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0227d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02282 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02287 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0228c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02291 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02299 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0229e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
022a6 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
022ab 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
022b0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
022b5 4489742474                     mov        dword ptr [rsp + 0x74], r14d
022ba 90                             nop        
022bb 90                             nop        
022bc c5f877                         vzeroupper 
022bf e81cc5aeff                     call       0x7f6a976cda60
022c4 0f1f8400bc230021               nop        dword ptr [rax + rax + 0x210023bc]
022cc 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
022d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022da e801d01318                     call       0x7f6aafd1e560
022df f4                             hlt        
022e0 bee4ffffff                     mov        esi, 0xffffffe4
022e5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
022ea 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
022ef 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
022f4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
022f9 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
022fe 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02303 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02308 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0230d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02315 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0231a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0231f 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02324 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02329 90                             nop        
0232a 90                             nop        
0232b 90                             nop        
0232c c5f877                         vzeroupper 
0232f e8acc4aeff                     call       0x7f6a976cda60
02334 0f1f84002c240022               nop        dword ptr [rax + rax + 0x2200242c]
0233c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02346 4883e4f0                       and        rsp, 0xfffffffffffffff0
0234a e891cf1318                     call       0x7f6aafd1e560
0234f f4                             hlt        
02350 bee4ffffff                     mov        esi, 0xffffffe4
02355 488b2c24                       mov        rbp, qword ptr [rsp]
02359 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0235e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02363 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02368 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0236d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02372 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02377 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0237c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02381 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02386 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0238b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02390 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02395 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0239a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0239f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
023a4 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
023a9 4489742474                     mov        dword ptr [rsp + 0x74], r14d
023ae 90                             nop        
023af 90                             nop        
023b0 c5f877                         vzeroupper 
023b3 e828c4aeff                     call       0x7f6a976cda60
023b8 0f1f8400b0240023               nop        dword ptr [rax + rax + 0x230024b0]
023c0 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
023ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
023ce e80dcf1318                     call       0x7f6aafd1e560
023d3 f4                             hlt        
023d4 beccffffff                     mov        esi, 0xffffffcc
023d9 488b2c24                       mov        rbp, qword ptr [rsp]
023dd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
023e2 4489542408                     mov        dword ptr [rsp + 8], r10d
023e7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023ec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023f1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023f6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023fb 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02400 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02405 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0240a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0240f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02414 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02419 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0241e 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02423 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0242b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02430 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02438 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0243d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02442 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02447 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0244c c5f877                         vzeroupper 
0244f e88cc3aeff                     call       0x7f6a976cda60
02454 0f1f84004c250024               nop        dword ptr [rax + rax + 0x2400254c]
0245c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02466 4883e4f0                       and        rsp, 0xfffffffffffffff0
0246a e871ce1318                     call       0x7f6aafd1e560
0246f f4                             hlt        
02470 be45ffffff                     mov        esi, 0xffffff45
02475 488b2c24                       mov        rbp, qword ptr [rsp]
02479 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0247e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02483 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02488 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0248d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02492 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02497 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0249c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
024a1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
024a6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
024ab 4489742468                     mov        dword ptr [rsp + 0x68], r14d
024b0 c5f877                         vzeroupper 
024b3 e828c3aeff                     call       0x7f6a976cda60
024b8 0f1f8400b0250025               nop        dword ptr [rax + rax + 0x250025b0]
024c0 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
024ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
024ce e80dce1318                     call       0x7f6aafd1e560
024d3 f4                             hlt        
024d4 be85ffffff                     mov        esi, 0xffffff85
024d9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
024de 44891424                       mov        dword ptr [rsp], r10d
024e2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024e7 4489542404                     mov        dword ptr [rsp + 4], r10d
024ec 895c2408                       mov        dword ptr [rsp + 8], ebx
024f0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
024f5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
024fa 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
024ff 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02504 c5f877                         vzeroupper 
02507 e8d4c2aeff                     call       0x7f6a976cda60
0250c 0f1f840004260026               nop        dword ptr [rax + rax + 0x26002604]
02514 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0251e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02522 e8b9cd1318                     call       0x7f6aafd1e560
02527 f4                             hlt        
02528 4533d2                         xor        r10d, r10d
0252b 4c89542470                     mov        qword ptr [rsp + 0x70], r10
02530 eb0d                           jmp        0x7f6a97be17bf
02532 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0253a 4c89542470                     mov        qword ptr [rsp + 0x70], r10
0253f be6effffff                     mov        esi, 0xffffff6e
02544 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02549 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0254e 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02552 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02557 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0255c 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02561 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02566 90                             nop        
02567 90                             nop        
02568 c5f877                         vzeroupper 
0256b e870c2aeff                     call       0x7f6a976cda60
02570 0f1f840068260027               nop        dword ptr [rax + rax + 0x27002668]
02578 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02582 4883e4f0                       and        rsp, 0xfffffffffffffff0
02586 e855cd1318                     call       0x7f6aafd1e560
0258b f4                             hlt        
0258c beccffffff                     mov        esi, 0xffffffcc
02591 488b2c24                       mov        rbp, qword ptr [rsp]
02595 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02599 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0259e 90                             nop        
0259f 90                             nop        
025a0 c5f877                         vzeroupper 
025a3 e838c2aeff                     call       0x7f6a976cda60
025a8 0f1f8400a0260028               nop        dword ptr [rax + rax + 0x280026a0]
025b0 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
025ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
025be e81dcd1318                     call       0x7f6aafd1e560
025c3 f4                             hlt        
025c4 bee4ffffff                     mov        esi, 0xffffffe4
025c9 488b2c24                       mov        rbp, qword ptr [rsp]
025cd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
025d2 44895c2408                     mov        dword ptr [rsp + 8], r11d
025d7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025e1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025e6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025eb 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
025f0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025f5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
025fa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025ff 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02604 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02609 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02611 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02616 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0261b 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02620 89442460                       mov        dword ptr [rsp + 0x60], eax
02624 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02629 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0262d 90                             nop        
0262e 90                             nop        
0262f 90                             nop        
02630 c5f877                         vzeroupper 
02633 e8a8c1aeff                     call       0x7f6a976cda60
02638 0f1f840030270029               nop        dword ptr [rax + rax + 0x29002730]
02640 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0264a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0264e e88dcc1318                     call       0x7f6aafd1e560
02653 f4                             hlt        
02654 c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
0265d bee4ffffff                     mov        esi, 0xffffffe4
02662 488b2c24                       mov        rbp, qword ptr [rsp]
02666 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0266b 44895c2408                     mov        dword ptr [rsp + 8], r11d
02670 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02675 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0267a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0267f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02684 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02689 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0268e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02693 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02698 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0269d 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
026a2 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
026aa 4489542444                     mov        dword ptr [rsp + 0x44], r10d
026af 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
026b4 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
026b9 89442460                       mov        dword ptr [rsp + 0x60], eax
026bd 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
026c2 4489442474                     mov        dword ptr [rsp + 0x74], r8d
026c7 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
026ce 90                             nop        
026cf 90                             nop        
026d0 c5f877                         vzeroupper 
026d3 e808c1aeff                     call       0x7f6a976cda60
026d8 0f1f8400d027002a               nop        dword ptr [rax + rax + 0x2a0027d0]
026e0 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
026ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ee e8edcb1318                     call       0x7f6aafd1e560
026f3 f4                             hlt        
026f4 beccffffff                     mov        esi, 0xffffffcc
026f9 488b2c24                       mov        rbp, qword ptr [rsp]
026fd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02702 44895c2408                     mov        dword ptr [rsp + 8], r11d
02707 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0270c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02711 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02716 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0271b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02720 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02725 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0272a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0272f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02734 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02739 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02741 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02746 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0274e 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02753 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02758 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0275d 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02761 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02768 c5f877                         vzeroupper 
0276b e870c0aeff                     call       0x7f6a976cda60
02770 0f1f84006828002b               nop        dword ptr [rax + rax + 0x2b002868]
02778 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02782 4883e4f0                       and        rsp, 0xfffffffffffffff0
02786 e855cb1318                     call       0x7f6aafd1e560
0278b f4                             hlt        
0278c 418be8                         mov        ebp, r8d
0278f 83c510                         add        ebp, 0x10
02792 be6effffff                     mov        esi, 0xffffff6e
02797 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0279c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
027a1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
027a6 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
027ab 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
027b0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
027b5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
027ba 4489542464                     mov        dword ptr [rsp + 0x64], r10d
027bf 89442468                       mov        dword ptr [rsp + 0x68], eax
027c3 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
027c8 c5f877                         vzeroupper 
027cb e810c0aeff                     call       0x7f6a976cda60
027d0 0f1f8400c828002c               nop        dword ptr [rax + rax + 0x2c0028c8]
027d8 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
027e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
027e6 e8f5ca1318                     call       0x7f6aafd1e560
027eb f4                             hlt        
027ec 418be8                         mov        ebp, r8d
027ef 83c510                         add        ebp, 0x10
027f2 be66ffffff                     mov        esi, 0xffffff66
027f7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
027fc 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02801 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02806 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0280b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02810 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02815 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0281a 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0281f 89442468                       mov        dword ptr [rsp + 0x68], eax
02823 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02828 c5f877                         vzeroupper 
0282b e8b0bfaeff                     call       0x7f6a976cda60
02830 0f1f84002829002d               nop        dword ptr [rax + rax + 0x2d002928]
02838 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02842 4883e4f0                       and        rsp, 0xfffffffffffffff0
02846 e895ca1318                     call       0x7f6aafd1e560
0284b f4                             hlt        
0284c 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02856 4883e4f0                       and        rsp, 0xfffffffffffffff0
0285a e881ca1318                     call       0x7f6aafd1e560
0285f f4                             hlt        
02860 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
0286a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0286e e86dca1318                     call       0x7f6aafd1e560
02873 f4                             hlt        
02874 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
0287e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02882 e859ca1318                     call       0x7f6aafd1e560
02887 f4                             hlt        
02888 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02892 4883e4f0                       and        rsp, 0xfffffffffffffff0
02896 e845ca1318                     call       0x7f6aafd1e560
0289b f4                             hlt        
0289c bee4ffffff                     mov        esi, 0xffffffe4
028a1 488b2c24                       mov        rbp, qword ptr [rsp]
028a5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
028aa 44895c2408                     mov        dword ptr [rsp + 8], r11d
028af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028b9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
028be 448954240c                     mov        dword ptr [rsp + 0xc], r10d
028c3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
028c8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
028cd 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
028d2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
028d7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
028dc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028e1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
028e6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
028eb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
028f3 4489542444                     mov        dword ptr [rsp + 0x44], r10d
028f8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
028fd 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02902 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
0290a 90                             nop        
0290b 90                             nop        
0290c c5f877                         vzeroupper 
0290f e8ccbeaeff                     call       0x7f6a976cda60
02914 0f1f84000c2a002e               nop        dword ptr [rax + rax + 0x2e002a0c]
0291c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0292a e8b1c91318                     call       0x7f6aafd1e560
0292f f4                             hlt        
02930 bee4ffffff                     mov        esi, 0xffffffe4
02935 488b2c24                       mov        rbp, qword ptr [rsp]
02939 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0293e 4489542408                     mov        dword ptr [rsp + 8], r10d
02943 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02948 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0294d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02952 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02957 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0295c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02961 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02966 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0296b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02970 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02975 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0297a 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0297f 90                             nop        
02980 c5f877                         vzeroupper 
02983 e858beaeff                     call       0x7f6a976cda60
02988 0f1f8400802a002f               nop        dword ptr [rax + rax + 0x2f002a80]
02990 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
0299a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0299e e83dc91318                     call       0x7f6aafd1e560
029a3 f4                             hlt        
029a4 be6effffff                     mov        esi, 0xffffff6e
029a9 488b2c24                       mov        rbp, qword ptr [rsp]
029ad 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
029b2 4489542408                     mov        dword ptr [rsp + 8], r10d
029b7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
029bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
029c1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
029c6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
029cb 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
029d0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
029d5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
029da 4489542440                     mov        dword ptr [rsp + 0x40], r10d
029df 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
029e7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
029ec c5f877                         vzeroupper 
029ef e8ecbdaeff                     call       0x7f6a976cda60
029f4 0f1f8400ec2a0030               nop        dword ptr [rax + rax + 0x30002aec]
029fc 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02a06 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a0a e8d1c81318                     call       0x7f6aafd1e560
02a0f f4                             hlt        
02a10 be66ffffff                     mov        esi, 0xffffff66
02a15 488b2c24                       mov        rbp, qword ptr [rsp]
02a19 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02a1e 4489542408                     mov        dword ptr [rsp + 8], r10d
02a23 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a28 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a2d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02a32 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02a37 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02a3c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02a41 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02a46 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02a4b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
02a53 458bd3                         mov        r10d, r11d
02a56 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02a5b 90                             nop        
02a5c c5f877                         vzeroupper 
02a5f e87cbdaeff                     call       0x7f6a976cda60
02a64 0f1f84005c2b0031               nop        dword ptr [rax + rax + 0x31002b5c]
02a6c 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02a76 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a7a e861c81318                     call       0x7f6aafd1e560
02a7f f4                             hlt        
02a80 448bce                         mov        r9d, esi
02a83 e932ebffff                     jmp        0x7f6a97be083a
02a88 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02a92 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a96 e845c81318                     call       0x7f6aafd1e560
02a9b f4                             hlt        
02a9c 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02aa6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aaa e831c81318                     call       0x7f6aafd1e560
02aaf f4                             hlt        
02ab0 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02aba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02abe e81dc81318                     call       0x7f6aafd1e560
02ac3 f4                             hlt        
02ac4 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02ace 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ad2 e809c81318                     call       0x7f6aafd1e560
02ad7 f4                             hlt        
02ad8 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02ae2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae6 e8f5c71318                     call       0x7f6aafd1e560
02aeb f4                             hlt        
02aec 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02af6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02afa e8e1c71318                     call       0x7f6aafd1e560
02aff f4                             hlt        
02b00 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b0e e8cdc71318                     call       0x7f6aafd1e560
02b13 f4                             hlt        
02b14 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b22 e8b9c71318                     call       0x7f6aafd1e560
02b27 f4                             hlt        
02b28 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b32 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b36 e8a5c71318                     call       0x7f6aafd1e560
02b3b f4                             hlt        
02b3c 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b46 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b4a e891c71318                     call       0x7f6aafd1e560
02b4f f4                             hlt        
02b50 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b5e e87dc71318                     call       0x7f6aafd1e560
02b63 f4                             hlt        
02b64 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b72 e869c71318                     call       0x7f6aafd1e560
02b77 f4                             hlt        
02b78 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b82 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b86 e855c71318                     call       0x7f6aafd1e560
02b8b f4                             hlt        
02b8c 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02b96 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b9a e841c71318                     call       0x7f6aafd1e560
02b9f f4                             hlt        
02ba0 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bae e82dc71318                     call       0x7f6aafd1e560
02bb3 f4                             hlt        
02bb4 48bf602a6b706a7f0000           movabs     rdi, 0x7f6a706b2a60
02bbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bc2 e819c71318                     call       0x7f6aafd1e560
02bc7 f4                             hlt        
02bc8 488bf0                         mov        rsi, rax
02bcb eb0d                           jmp        0x7f6a97be1e5a
02bcd 488bf0                         mov        rsi, rax
02bd0 eb08                           jmp        0x7f6a97be1e5a
02bd2 488bf0                         mov        rsi, rax
02bd5 eb03                           jmp        0x7f6a97be1e5a
02bd7 488bf0                         mov        rsi, rax
02bda c5f877                         vzeroupper 
02bdd 4881c400010000                 add        rsp, 0x100
02be4 5d                             pop        rbp
02be5 e97645aeff                     jmp        0x7f6a976c63e0
02bea bef6ffffff                     mov        esi, 0xfffffff6
02bef 90                             nop        
02bf0 c5f877                         vzeroupper 
02bf3 e8e8bbaeff                     call       0x7f6a976cda60
02bf8 0f1f8400f02c0032               nop        dword ptr [rax + rax + 0x32002cf0]
02c00 48bfa03133706a7f0000           movabs     rdi, 0x7f6a703331a0
02c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c0e e8cdc61318                     call       0x7f6aafd1e560
02c13 f4                             hlt        
02c14 49ba4201be976a7f0000           movabs     r10, 0x7f6a97be0142
02c1e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02c25 e9b604b5ff                     jmp        0x7f6a97732360
02c2a e831d3b3ff                     call       0x7f6a9771f1e0
02c2f e9fad3ffff                     jmp        0x7f6a97bdf2ae
02c34 f4                             hlt        
02c35 f4                             hlt        
02c36 f4                             hlt        
02c37 f4                             hlt        
