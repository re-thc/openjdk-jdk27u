00000 e87bd9a117                     call       0x7ffb03887280
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8554260000                   jne        0x7ffaebe6bf82
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
00128 49bac0d99603fb7f0000           movabs     r10, 0x7ffb0396d9c0
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f8441180000                   je         0x7ffaebe6b28c
0014b 458b1a                         mov        r11d, dword ptr [r10]
0014e 41c1eb0d                       shr        r11d, 0xd
00152 4181fb15040000                 cmp        r11d, 0x415
00159 0f8551200000                   jne        0x7ffaebe6bab0
0015f 4c891424                       mov        qword ptr [rsp], r10
00163 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00168 4d85d2                         test       r10, r10
0016b 0f8427180000                   je         0x7ffaebe6b298
00171 458b12                         mov        r10d, dword ptr [r10]
00174 41c1ea0d                       shr        r10d, 0xd
00178 4181fa05010000                 cmp        r10d, 0x105
0017f 0f852b200000                   jne        0x7ffaebe6bab0
00185 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0018a 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00192 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00197 4d85d2                         test       r10, r10
0019a 0f8408180000                   je         0x7ffaebe6b2a8
001a0 458b1a                         mov        r11d, dword ptr [r10]
001a3 41c1eb0d                       shr        r11d, 0xd
001a7 4181fb08010000                 cmp        r11d, 0x108
001ae 0f85fc1f0000                   jne        0x7ffaebe6bab0
001b4 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001bc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c1 4d85d2                         test       r10, r10
001c4 0f84ee170000                   je         0x7ffaebe6b2b8
001ca 458b12                         mov        r10d, dword ptr [r10]
001cd 41c1ea0d                       shr        r10d, 0xd
001d1 4181fa07010000                 cmp        r10d, 0x107
001d8 0f85d21f0000                   jne        0x7ffaebe6bab0
001de 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001e8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001ed 4d85d2                         test       r10, r10
001f0 0f84cf170000                   je         0x7ffaebe6b2c5
001f6 458b1a                         mov        r11d, dword ptr [r10]
001f9 41c1eb0d                       shr        r11d, 0xd
001fd 4181fb07010000                 cmp        r11d, 0x107
00204 0f85a61f0000                   jne        0x7ffaebe6bab0
0020a 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00212 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00217 458b12                         mov        r10d, dword ptr [r10]
0021a 41c1ea0d                       shr        r10d, 0xd
0021e 4181fa05010000                 cmp        r10d, 0x105
00225 0f85851f0000                   jne        0x7ffaebe6bab0
0022b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00230 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00238 458b5204                       mov        r10d, dword ptr [r10 + 4]
0023c 4489542408                     mov        dword ptr [rsp + 8], r10d
00241 4183c2f9                       add        r10d, -7
00245 4585d2                         test       r10d, r10d
00248 0f8cac1f0000                   jl         0x7ffaebe6bafa
0024e 448b542408                     mov        r10d, dword ptr [rsp + 8]
00253 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00258 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0025d 4183c3f1                       add        r11d, -0xf
00261 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00266 4183c2f9                       add        r10d, -7
0026a 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00272 e9fc010000                     jmp        0x7ffaebe69d73
00277 458bd5                         mov        r10d, r13d
0027a 4d63d2                         movsxd     r10, r10d
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
002c4 0f8d66090000                   jge        0x7ffaebe6a530
002ca 8bdd                           mov        ebx, ebp
002cc 448bcb                         mov        r9d, ebx
002cf 442b8c24cc000000               sub        r9d, dword ptr [rsp + 0xcc]
002d7 448bac2494000000               mov        r13d, dword ptr [rsp + 0x94]
002df 442bac24cc000000               sub        r13d, dword ptr [rsp + 0xcc]
002e7 443bac24cc000000               cmp        r13d, dword ptr [rsp + 0xcc]
002ef 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002f7 450f4feb                       cmovg      r13d, r11d
002fb 4585c9                         test       r9d, r9d
002fe 0f8cd1160000                   jl         0x7ffaebe6b2d5
00304 85db                           test       ebx, ebx
00306 0f8cc9160000                   jl         0x7ffaebe6b2d5
0030c 478d1429                       lea        r10d, [r9 + r13]
00310 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00315 453bda                         cmp        r11d, r10d
00318 0f82b7160000                   jb         0x7ffaebe6b2d5
0031e 428d2c2b                       lea        ebp, [rbx + r13]
00322 443bdd                         cmp        r11d, ebp
00325 0f82aa160000                   jb         0x7ffaebe6b2d5
0032b 4585ed                         test       r13d, r13d
0032e 0f8ca1160000                   jl         0x7ffaebe6b2d5
00334 4585ed                         test       r13d, r13d
00337 0f845dffffff                   je         0x7ffaebe69b9a
0033d 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00345 498d741a08                     lea        rsi, [r10 + rbx + 8]
0034a 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
0034f 4963d5                         movsxd     rdx, r13d
00352 4883fa20                       cmp        rdx, 0x20
00356 0f861bffffff                   jbe        0x7ffaebe69b77
0035c c5f877                         vzeroupper 
0035f 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00369 41ffd2                         call       r10
0036c 0f1f840000000000               nop        dword ptr [rax + rax]
00374 e921ffffff                     jmp        0x7ffaebe69b9a
00379 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00380 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00387 4103db                         add        ebx, r11d
0038a 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
0038f 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00393 e980020000                     jmp        0x7ffaebe69f18
00398 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
003a0 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003a5 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003ad 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
003b2 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003ba 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
003c2 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003ca 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003d2 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
003da 0f8cdf050000                   jl         0x7ffaebe6a2bf
003e0 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003e8 4183fa30                       cmp        r10d, 0x30
003ec 7e75                           jle        0x7ffaebe69d63
003ee 4585f6                         test       r14d, r14d
003f1 0f8c99160000                   jl         0x7ffaebe6b390
003f7 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003ff 4585db                         test       r11d, r11d
00402 0f8c88160000                   jl         0x7ffaebe6b390
00408 478d1c32                       lea        r11d, [r10 + r14]
0040c 448b542408                     mov        r10d, dword ptr [rsp + 8]
00411 453bd3                         cmp        r10d, r11d
00414 0f8276160000                   jb         0x7ffaebe6b390
0041a 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00422 0f8268160000                   jb         0x7ffaebe6b390
00428 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00430 4585db                         test       r11d, r11d
00433 0f843a010000                   je         0x7ffaebe69e73
00439 4963d3                         movsxd     rdx, r11d
0043c 4883fa20                       cmp        rdx, 0x20
00440 0f860a010000                   jbe        0x7ffaebe69e50
00446 c5f877                         vzeroupper 
00449 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00453 41ffd2                         call       r10
00456 0f1f840000000000               nop        dword ptr [rax + rax]
0045e e910010000                     jmp        0x7ffaebe69e73
00463 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00468 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0046f 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00473 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
0047b 0f83ef130000                   jae        0x7ffaebe6b170
00481 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00489 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
0048e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00496 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0049e 0f8344140000                   jae        0x7ffaebe6b1e8
004a4 4183c608                       add        r14d, 8
004a8 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
004ac 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
004b4 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004bc 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
004c1 4183c208                       add        r10d, 8
004c5 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
004cd 418503                         test       dword ptr [r11], eax
004d0 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
004d8 7d6d                           jge        0x7ffaebe69e47
004da 660f1f440000                   nop        word ptr [rax + rax]
004e0 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
004e8 0f8382130000                   jae        0x7ffaebe6b170
004ee 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
004f6 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
004fb 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00503 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
0050b 0f83d7130000                   jae        0x7ffaebe6b1e8
00511 4183c608                       add        r14d, 8
00515 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00519 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00521 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00529 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
0052e 4183c308                       add        r11d, 8
00532 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0053a 418502                         test       dword ptr [r10], eax
0053d 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00545 7c99                           jl         0x7ffaebe69de0
00547 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0054e eb33                           jmp        0x7ffaebe69e83
00550 458bd3                         mov        r10d, r11d
00553 4d63d2                         movsxd     r10, r10d
00556 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0055d c442a8f5db                     bzhi       r11, r11, r10
00562 c4c1fb92fb                     kmovq      k7, r11
00567 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0056d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00573 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00578 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0057f 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00583 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0058b 458b5204                       mov        r10d, dword ptr [r10 + 4]
0058f 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00594 4585c0                         test       r8d, r8d
00597 0f8cbb130000                   jl         0x7ffaebe6b258
0059d 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
005a5 458b4b04                       mov        r9d, dword ptr [r11 + 4]
005a9 4183f901                       cmp        r9d, 1
005ad 0f86a5130000                   jbe        0x7ffaebe6b258
005b3 4183f902                       cmp        r9d, 2
005b7 0f869b130000                   jbe        0x7ffaebe6b258
005bd 4585c9                         test       r9d, r9d
005c0 0f8692130000                   jbe        0x7ffaebe6b258
005c6 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
005ce 458b4304                       mov        r8d, dword ptr [r11 + 4]
005d2 458d58f1                       lea        r11d, [r8 - 0xf]
005d6 4585db                         test       r11d, r11d
005d9 0f8c79130000                   jl         0x7ffaebe6b258
005df 8b542408                       mov        edx, dword ptr [rsp + 8]
005e3 458bd8                         mov        r11d, r8d
005e6 448d72f1                       lea        r14d, [rdx - 0xf]
005ea 4489b424e0000000               mov        dword ptr [rsp + 0xe0], r14d
005f2 458d73f1                       lea        r14d, [r11 - 0xf]
005f6 8bcd                           mov        ecx, ebp
005f8 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
005fd 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00602 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00607 89542438                       mov        dword ptr [rsp + 0x38], edx
0060b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00610 4489b424d0000000               mov        dword ptr [rsp + 0xd0], r14d
00618 4d8b4f30                       mov        r9, qword ptr [r15 + 0x30]
0061c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00621 442bd1                         sub        r10d, ecx
00624 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0062c 498d741b08                     lea        rsi, [r11 + rbx + 8]
00631 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00639 498d7c0808                     lea        rdi, [r8 + rcx + 8]
0063e 458d4501                       lea        r8d, [r13 + 1]
00642 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00647 418501                         test       dword ptr [r9], eax
0064a 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0064f 0f8d3e0a0000                   jge        0x7ffaebe6a993
00655 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
0065a 0f83c00e0000                   jae        0x7ffaebe6ae20
00660 4d63dd                         movsxd     r11, r13d
00663 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
0066b 4f8b44d810                     mov        r8, qword ptr [r8 + r11*8 + 0x10]
00670 458bd8                         mov        r11d, r8d
00673 4181e3ffff0100                 and        r11d, 0x1ffff
0067a 418bc3                         mov        eax, r11d
0067d 4d8bd8                         mov        r11, r8
00680 49c1eb12                       shr        r11, 0x12
00684 49c1f824                       sar        r8, 0x24
00688 458bdb                         mov        r11d, r11d
0068b 458bc0                         mov        r8d, r8d
0068e 418bd0                         mov        edx, r8d
00691 4181e3ffff0300                 and        r11d, 0x3ffff
00698 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
006a0 4585c0                         test       r8d, r8d
006a3 0f8c47100000                   jl         0x7ffaebe6aff0
006a9 448bd8                         mov        r11d, eax
006ac 4585db                         test       r11d, r11d
006af 0f8517020000                   jne        0x7ffaebe6a1cc
006b5 4533d2                         xor        r10d, r10d
006b8 418bc2                         mov        eax, r10d
006bb 4183f803                       cmp        r8d, 3
006bf 0f8e5b020000                   jle        0x7ffaebe6a220
006c5 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006cd 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
006d1 45895a10                       mov        dword ptr [r10 + 0x10], r11d
006d5 458b5208                       mov        r10d, dword ptr [r10 + 8]
006d9 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
006e1 4589530c                       mov        dword ptr [r11 + 0xc], r10d
006e5 458d50fd                       lea        r10d, [r8 - 3]
006e9 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
006f1 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006f9 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00701 45895a08                       mov        dword ptr [r10 + 8], r11d
00705 4863ac24cc000000               movsxd     rbp, dword ptr [rsp + 0xcc]
0070d 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
00712 4c63d3                         movsxd     r10, ebx
00715 4c03542478                     add        r10, qword ptr [rsp + 0x78]
0071a 4863d0                         movsxd     rdx, eax
0071d 4c03d2                         add        r10, rdx
00720 493bea                         cmp        rbp, r10
00723 0f8f1b100000                   jg         0x7ffaebe6b044
00729 448d2c03                       lea        r13d, [rbx + rax]
0072d 458bf5                         mov        r14d, r13d
00730 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00738 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00740 4585db                         test       r11d, r11d
00743 0f84ab010000                   je         0x7ffaebe6a1f4
00749 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0074e 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00756 4585c0                         test       r8d, r8d
00759 0f8e710f0000                   jle        0x7ffaebe6afd0
0075f 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00767 4503dd                         add        r11d, r13d
0076a 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
00772 0f8f24100000                   jg         0x7ffaebe6b09c
00778 448d1401                       lea        r10d, [rcx + rax]
0077c 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00781 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00789 0f8f75100000                   jg         0x7ffaebe6b104
0078f 83f810                         cmp        eax, 0x10
00792 0f8fad040000                   jg         0x7ffaebe6a545
00798 448bd1                         mov        r10d, ecx
0079b 3b8c24d0000000                 cmp        ecx, dword ptr [rsp + 0xd0]
007a2 0f83c80d0000                   jae        0x7ffaebe6ae70
007a8 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
007b0 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
007b7 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
007be 0f83180e0000                   jae        0x7ffaebe6aedc
007c4 468d0410                       lea        r8d, [rax + r10]
007c8 4489442474                     mov        dword ptr [rsp + 0x74], r8d
007cd 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
007d5 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
007dc 448d1418                       lea        r10d, [rax + rbx]
007e0 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
007e8 458bf2                         mov        r14d, r10d
007eb 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
007f3 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007fb 4183fb10                       cmp        r11d, 0x10
007ff 0f8f93fbffff                   jg         0x7ffaebe69c98
00805 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0080d 4183fa10                       cmp        r10d, 0x10
00811 0f8c81fbffff                   jl         0x7ffaebe69c98
00817 443bb424e0000000               cmp        r14d, dword ptr [rsp + 0xe0]
0081f 0f83470e0000                   jae        0x7ffaebe6af6c
00825 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0082d c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00834 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0083c 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
00844 0f822ffbffff                   jb         0x7ffaebe69c79
0084a bee4ffffff                     mov        esi, 0xffffffe4
0084f 488b2c24                       mov        rbp, qword ptr [rsp]
00853 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00858 44895c2408                     mov        dword ptr [rsp + 8], r11d
0085d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00862 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00867 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0086c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00871 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00876 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0087b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00880 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00885 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0088a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0088f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00897 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0089c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008a4 4489542458                     mov        dword ptr [rsp + 0x58], r10d
008a9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
008ae 4489542460                     mov        dword ptr [rsp + 0x60], r10d
008b3 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
008bc c5f877                         vzeroupper 
008bf e89c94b5ff                     call       0x7ffaeb9c3660
008c4 0f1f8400bc090004               nop        dword ptr [rax + rax + 0x40009bc]
008cc 453bda                         cmp        r11d, r10d
008cf 0f8ee6fdffff                   jle        0x7ffaebe69fbb
008d5 be45ffffff                     mov        esi, 0xffffff45
008da 418beb                         mov        ebp, r11d
008dd 44891424                       mov        dword ptr [rsp], r10d
008e1 666690                         nop        
008e4 c5f877                         vzeroupper 
008e7 e87494b5ff                     call       0x7ffaeb9c3660
008ec 0f1f8400e4090005               nop        dword ptr [rax + rax + 0x50009e4]
008f4 4d63de                         movsxd     r11, r14d
008f7 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
008ff 0f8c0b120000                   jl         0x7ffaebe6b410
00905 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
0090d 0f8f5d120000                   jg         0x7ffaebe6b470
00913 4533db                         xor        r11d, r11d
00916 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0091b e92efeffff                     jmp        0x7ffaebe6a04e
00920 85c0                           test       eax, eax
00922 7407                           je         0x7ffaebe6a22b
00924 458d50ff                       lea        r10d, [r8 - 1]
00928 418bd2                         mov        edx, r10d
0092b 85d2                           test       edx, edx
0092d 750e                           jne        0x7ffaebe6a23d
0092f 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00937 458b5208                       mov        r10d, dword ptr [r10 + 8]
0093b eb75                           jmp        0x7ffaebe6a2b2
0093d 83fa03                         cmp        edx, 3
00940 0f8496140000                   je         0x7ffaebe6b6dc
00946 83fa02                         cmp        edx, 2
00949 0f87f5140000                   ja         0x7ffaebe6b744
0094f 3b542430                       cmp        edx, dword ptr [rsp + 0x30]
00953 0f83a2130000                   jae        0x7ffaebe6b5fb
00959 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00961 458b549308                     mov        r10d, dword ptr [r11 + rdx*4 + 8]
00966 85d2                           test       edx, edx
00968 7e3c                           jle        0x7ffaebe6a2a6
0096a 448d42ff                       lea        r8d, [rdx - 1]
0096e 443b442430                     cmp        r8d, dword ptr [rsp + 0x30]
00973 0f83f7130000                   jae        0x7ffaebe6b670
00979 0f1f8000000000                 nop        dword ptr [rax]
00980 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00988 458b5c9004                     mov        r11d, dword ptr [r8 + rdx*4 + 4]
0098d 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
00995 45895c9108                     mov        dword ptr [r9 + rdx*4 + 8], r11d
0099a 448d5aff                       lea        r11d, [rdx - 1]
0099e 418bd3                         mov        edx, r11d
009a1 4585db                         test       r11d, r11d
009a4 7fda                           jg         0x7ffaebe6a280
009a6 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009ae 45895308                       mov        dword ptr [r11 + 8], r10d
009b2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009ba e946fdffff                     jmp        0x7ffaebe6a005
009bf 4183fb10                       cmp        r11d, 0x10
009c3 0f8d97170000                   jge        0x7ffaebe6ba60
009c9 4183fb08                       cmp        r11d, 8
009cd 0f8d44070000                   jge        0x7ffaebe6aa17
009d3 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
009db 4183fa10                       cmp        r10d, 0x10
009df 0f8eae000000                   jle        0x7ffaebe6a393
009e5 4585f6                         test       r14d, r14d
009e8 0f8cea160000                   jl         0x7ffaebe6b9d8
009ee 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
009f6 4585db                         test       r11d, r11d
009f9 0f8cd9160000                   jl         0x7ffaebe6b9d8
009ff 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a04 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00a0c 0f82c6160000                   jb         0x7ffaebe6b9d8
00a12 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
00a19 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00a20 443bd3                         cmp        r10d, ebx
00a23 0f82af160000                   jb         0x7ffaebe6b9d8
00a29 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00a31 4585db                         test       r11d, r11d
00a34 0f8c9e160000                   jl         0x7ffaebe6b9d8
00a3a 4585db                         test       r11d, r11d
00a3d 0f8489f8ffff                   je         0x7ffaebe69bcc
00a43 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a48 4983fa20                       cmp        r10, 0x20
00a4c 7725                           ja         0x7ffaebe6a373
00a4e 4d63d3                         movsxd     r10, r11d
00a51 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a58 c442a8f5db                     bzhi       r11, r11, r10
00a5d c4c1fb92fb                     kmovq      k7, r11
00a62 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a68 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a6e e959f8ffff                     jmp        0x7ffaebe69bcc
00a73 498bd2                         mov        rdx, r10
00a76 c5f877                         vzeroupper 
00a79 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00a83 41ffd2                         call       r10
00a86 0f1f840000000000               nop        dword ptr [rax + rax]
00a8e e939f8ffff                     jmp        0x7ffaebe69bcc
00a93 443b742408                     cmp        r14d, dword ptr [rsp + 8]
00a98 0f830e140000                   jae        0x7ffaebe6b7ac
00a9e 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00aa6 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
00aac 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00ab4 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00ab9 0f8379140000                   jae        0x7ffaebe6b838
00abf 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00ac7 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00acf 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00ad4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00adc 41ffc2                         inc        r10d
00adf 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00ae7 458d5e03                       lea        r11d, [r14 + 3]
00aeb 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00af0 0f83aa140000                   jae        0x7ffaebe6b8a0
00af6 4d63c6                         movsxd     r8, r14d
00af9 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b01 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00b07 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b0f 4183c203                       add        r10d, 3
00b13 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b18 0f83ee140000                   jae        0x7ffaebe6b90c
00b1e 4c638c249c000000               movsxd     r9, dword ptr [rsp + 0x9c]
00b26 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b2e 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
00b33 470fbe5c020a                   movsx      r11d, byte ptr [r10 + r8 + 0xa]
00b39 47885c0a0a                     mov        byte ptr [r10 + r9 + 0xa], r11b
00b3e 470fbe5c020b                   movsx      r11d, byte ptr [r10 + r8 + 0xb]
00b44 47885c0a0b                     mov        byte ptr [r10 + r9 + 0xb], r11b
00b49 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00b51 4183fb08                       cmp        r11d, 8
00b55 0f830d150000                   jae        0x7ffaebe6b968
00b5b 49ba60ac28e300000000           movabs     r10, 0xe328ac60
00b65 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00b6a 4489742418                     mov        dword ptr [rsp + 0x18], r14d
00b6f 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b77 4183fb04                       cmp        r11d, 4
00b7b 7e43                           jle        0x7ffaebe6a4c0
00b7d 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b84 83c504                         add        ebp, 4
00b87 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00b8f 418bd6                         mov        edx, r14d
00b92 6690                           nop        
00b94 c5f877                         vzeroupper 
00b97 e8c413a9ff                     call       0x7ffaeb8fb860
00b9c 0f1f8400940c0006               nop        dword ptr [rax + rax + 0x6000c94]
00ba4 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bac 8bd5                           mov        edx, ebp
00bae 8bc8                           mov        ecx, eax
00bb0 c5f877                         vzeroupper 
00bb3 e8a813a9ff                     call       0x7ffaeb8fb860
00bb8 0f1f8400b00c0007               nop        dword ptr [rax + rax + 0x7000cb0]
00bc0 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00bc8 4183fb08                       cmp        r11d, 8
00bcc 7e62                           jle        0x7ffaebe6a530
00bce 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00bd2 49ba88ac28e300000000           movabs     r10, 0xe328ac88
00bdc 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00be4 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00be9 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bf0 83c508                         add        ebp, 8
00bf3 83c208                         add        edx, 8
00bf6 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bfe 6690                           nop        
00c00 c5f877                         vzeroupper 
00c03 e85813a9ff                     call       0x7ffaeb8fb860
00c08 0f1f8400000d0008               nop        dword ptr [rax + rax + 0x8000d00]
00c10 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c18 8bd5                           mov        edx, ebp
00c1a 488bc8                         mov        rcx, rax
00c1d 666690                         nop        
00c20 c5f877                         vzeroupper 
00c23 e83813a9ff                     call       0x7ffaeb8fb860
00c28 0f1f8400200d0009               nop        dword ptr [rax + rax + 0x9000d20]
00c30 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
00c35 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00c3c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00c40 e93ef9ffff                     jmp        0x7ffaebe69e83
00c45 83f830                         cmp        eax, 0x30
00c48 0f8e80000000                   jle        0x7ffaebe6a5ce
00c4e 85c9                           test       ecx, ecx
00c50 0f8c22170000                   jl         0x7ffaebe6bc78
00c56 85db                           test       ebx, ebx
00c58 0f8c1a170000                   jl         0x7ffaebe6bc78
00c5e 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00c62 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00c66 0f820c170000                   jb         0x7ffaebe6bc78
00c6c 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00c71 453bdd                         cmp        r11d, r13d
00c74 0f82fe160000                   jb         0x7ffaebe6bc78
00c7a 85c0                           test       eax, eax
00c7c 7429                           je         0x7ffaebe6a5a7
00c7e 4883fa20                       cmp        rdx, 0x20
00c82 7730                           ja         0x7ffaebe6a5b4
00c84 448bd0                         mov        r10d, eax
00c87 4d63d2                         movsxd     r10, r10d
00c8a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c91 c442a8f5db                     bzhi       r11, r11, r10
00c96 c4c1fb92fb                     kmovq      k7, r11
00c9b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ca1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ca7 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00caf e93ffbffff                     jmp        0x7ffaebe6a0f3
00cb4 c5f877                         vzeroupper 
00cb7 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00cc1 41ffd2                         call       r10
00cc4 0f1f840000000000               nop        dword ptr [rax + rax]
00ccc ebd9                           jmp        0x7ffaebe6a5a7
00cce 448bc1                         mov        r8d, ecx
00cd1 3b8c24d0000000                 cmp        ecx, dword ptr [rsp + 0xd0]
00cd8 0f838a150000                   jae        0x7ffaebe6bb68
00cde 4d63c8                         movsxd     r9, r8d
00ce1 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00ce9 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00cf0 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
00cf7 0f83ef150000                   jae        0x7ffaebe6bbec
00cfd 418bd0                         mov        edx, r8d
00d00 448d5310                       lea        r10d, [rbx + 0x10]
00d04 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00d0c 4c63d3                         movsxd     r10, ebx
00d0f 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00d17 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00d1e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d26 453bdd                         cmp        r11d, r13d
00d29 0f8d2f030000                   jge        0x7ffaebe6a95e
00d2f 4d2bca                         sub        r9, r10
00d32 4d63d3                         movsxd     r10, r11d
00d35 48634c243c                     movsxd     rcx, dword ptr [rsp + 0x3c]
00d3a 4883c1f1                       add        rcx, -0xf
00d3e 4f8d1c0a                       lea        r11, [r10 + r9]
00d42 4c3bd9                         cmp        r11, rcx
00d45 0f83b5160000                   jae        0x7ffaebe6bd00
00d4b 4d63dd                         movsxd     r11, r13d
00d4e 4d8bc3                         mov        r8, r11
00d51 4d2bc2                         sub        r8, r10
00d54 4983c00f                       add        r8, 0xf
00d58 4983e0f0                       and        r8, 0xfffffffffffffff0
00d5c 458bc0                         mov        r8d, r8d
00d5f 458d541810                     lea        r10d, [r8 + rbx + 0x10]
00d64 4d63c2                         movsxd     r8, r10d
00d67 4f8d5408f0                     lea        r10, [r8 + r9 - 0x10]
00d6c 4c3bd1                         cmp        r10, rcx
00d6f 0f838b160000                   jae        0x7ffaebe6bd00
00d75 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00d7d 443b9424e0000000               cmp        r10d, dword ptr [rsp + 0xe0]
00d85 0f8375160000                   jae        0x7ffaebe6bd00
00d8b 4983c0f0                       add        r8, -0x10
00d8f 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00d94 4983c2f1                       add        r10, -0xf
00d98 4d3bc2                         cmp        r8, r10
00d9b 0f835f160000                   jae        0x7ffaebe6bd00
00da1 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00da8 0f8fa2160000                   jg         0x7ffaebe6bd50
00dae 448bca                         mov        r9d, edx
00db1 442bcb                         sub        r9d, ebx
00db4 83c320                         add        ebx, 0x20
00db7 90                             nop        
00db8 458bd1                         mov        r10d, r9d
00dbb 4403942498000000               add        r10d, dword ptr [rsp + 0x98]
00dc3 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00dcb c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
00dd2 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00dda 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00de2 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
00de9 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00df1 4183c010                       add        r8d, 0x10
00df5 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00dfd 443bc3                         cmp        r8d, ebx
00e00 7cb6                           jl         0x7ffaebe6a6b8
00e02 4981c310ffffff                 add        r11, -0xf0
00e09 4981fb00000080                 cmp        r11, -0x80000000
00e10 49c7c200000080                 mov        r10, 0xffffffff80000000
00e17 4d0f4cda                       cmovl      r11, r10
00e1b 458bc3                         mov        r8d, r11d
00e1e 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00e26 453bd0                         cmp        r10d, r8d
00e29 0f8dec010000                   jge        0x7ffaebe6a91b
00e2f 458bda                         mov        r11d, r10d
00e32 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00e3a 660f1f440000                   nop        word ptr [rax + rax]
00e40 418bd9                         mov        ebx, r9d
00e43 039c2498000000                 add        ebx, dword ptr [rsp + 0x98]
00e4a 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00e52 4d63db                         movsxd     r11, r11d
00e55 448bd3                         mov        r10d, ebx
00e58 488b8c24a8000000               mov        rcx, qword ptr [rsp + 0xa8]
00e60 c4a17a6f441108                 vmovdqu    xmm0, xmmword ptr [rcx + r10 + 8]
00e67 4863cb                         movsxd     rcx, ebx
00e6a 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00e72 488b9c24c0000000               mov        rbx, qword ptr [rsp + 0xc0]
00e7a c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
00e81 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00e89 c4c17a6f440a18                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x18]
00e90 c4a17a7f441b18                 vmovdqu    xmmword ptr [rbx + r11 + 0x18], xmm0
00e97 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00e9f c4c17a6f440a28                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x28]
00ea6 c4a17a7f441b28                 vmovdqu    xmmword ptr [rbx + r11 + 0x28], xmm0
00ead 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00eb5 c4c17a6f440a38                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x38]
00ebc c4a17a7f441b38                 vmovdqu    xmmword ptr [rbx + r11 + 0x38], xmm0
00ec3 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00ecb c4c17a6f440a48                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x48]
00ed2 c4a17a7f441b48                 vmovdqu    xmmword ptr [rbx + r11 + 0x48], xmm0
00ed9 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00ee1 c4c17a6f440a58                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x58]
00ee8 c4a17a7f441b58                 vmovdqu    xmmword ptr [rbx + r11 + 0x58], xmm0
00eef 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00ef7 c4c17a6f440a68                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x68]
00efe c4a17a7f441b68                 vmovdqu    xmmword ptr [rbx + r11 + 0x68], xmm0
00f05 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00f0d c4c17a6f440a78                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x78]
00f14 c4a17a7f441b78                 vmovdqu    xmmword ptr [rbx + r11 + 0x78], xmm0
00f1b 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00f23 c4c17a6f840a88000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x88]
00f2d c4a17a7f841b88000000           vmovdqu    xmmword ptr [rbx + r11 + 0x88], xmm0
00f37 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00f3f c4c17a6f840a98000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x98]
00f49 c4a17a7f841b98000000           vmovdqu    xmmword ptr [rbx + r11 + 0x98], xmm0
00f53 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00f5b c4c17a6f840aa8000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xa8]
00f65 c4a17a7f841ba8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xa8], xmm0
00f6f 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00f77 c4c17a6f840ab8000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xb8]
00f81 c4a17a7f841bb8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xb8], xmm0
00f8b 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00f93 c4c17a6f840ac8000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc8]
00f9d c4a17a7f841bc8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xc8], xmm0
00fa7 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00faf c4c17a6f840ad8000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xd8]
00fb9 c4a17a7f841bd8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xd8], xmm0
00fc3 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00fcb c4c17a6f840ae8000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xe8]
00fd5 c4a17a7f841be8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xe8], xmm0
00fdf 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00fe7 c4c17a6f840af8000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xf8]
00ff1 c4a17a7f841bf8000000           vmovdqu    xmmword ptr [rbx + r11 + 0xf8], xmm0
00ffb 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01003 4181c200010000                 add        r10d, 0x100
0100a 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
01012 453bd0                         cmp        r10d, r8d
01015 0f8c25feffff                   jl         0x7ffaebe6a740
0101b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01023 453bdd                         cmp        r11d, r13d
01026 7d36                           jge        0x7ffaebe6a95e
01028 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01030 478d1c11                       lea        r11d, [r9 + r10]
01034 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
0103c c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
01043 458bc2                         mov        r8d, r10d
01046 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0104e c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
01055 4183c210                       add        r10d, 0x10
01059 453bd5                         cmp        r10d, r13d
0105c 7cd2                           jl         0x7ffaebe6a930
0105e 03c2                           add        eax, edx
01060 89442474                       mov        dword ptr [rsp + 0x74], eax
01064 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
0106c e982f7ffff                     jmp        0x7ffaebe6a0f3
01071 4d63d2                         movsxd     r10, r10d
01074 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0107b c442a8f5db                     bzhi       r11, r11, r10
01080 c4c1fb92fb                     kmovq      k7, r11
01085 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0108b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01091 eb66                           jmp        0x7ffaebe6a9f9
01093 85c9                           test       ecx, ecx
01095 0f8ca5110000                   jl         0x7ffaebe6bb40
0109b 85db                           test       ebx, ebx
0109d 0f8c9d110000                   jl         0x7ffaebe6bb40
010a3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
010a8 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
010ad 0f828d110000                   jb         0x7ffaebe6bb40
010b3 428d2c13                       lea        ebp, [rbx + r10]
010b7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
010bc 443bdd                         cmp        r11d, ebp
010bf 0f827b110000                   jb         0x7ffaebe6bb40
010c5 4585d2                         test       r10d, r10d
010c8 0f8c72110000                   jl         0x7ffaebe6bb40
010ce 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
010d3 443bc9                         cmp        r9d, ecx
010d6 7421                           je         0x7ffaebe6a9f9
010d8 4963d2                         movsxd     rdx, r10d
010db 4883fa20                       cmp        rdx, 0x20
010df 7690                           jbe        0x7ffaebe6a971
010e1 c5f877                         vzeroupper 
010e4 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
010ee 41ffd2                         call       r10
010f1 0f1f840000000000               nop        dword ptr [rax + rax]
010f9 4c8b1424                       mov        r10, qword ptr [rsp]
010fd 41896a38                       mov        dword ptr [r10 + 0x38], ebp
01101 c5f877                         vzeroupper 
01104 4881c400010000                 add        rsp, 0x100
0110b 5d                             pop        rbp
0110c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01110 0f8756150000                   ja         0x7ffaebe6bf6c
01116 c3                             ret        
01117 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
0111f 0f837b130000                   jae        0x7ffaebe6bda0
01125 458bd6                         mov        r10d, r14d
01128 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01130 4963da                         movsxd     rbx, r10d
01133 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0113b 4d8b541a08                     mov        r10, qword ptr [r10 + rbx + 8]
01140 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01148 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01150 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
01158 0f83c2130000                   jae        0x7ffaebe6be20
0115e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01166 4183c208                       add        r10d, 8
0116a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0116f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01173 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
0117b 4d63d8                         movsxd     r11, r8d
0117e 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01186 488b8c24d0000000               mov        rcx, qword ptr [rsp + 0xd0]
0118e 4b894c1908                     mov        qword ptr [r9 + r11 + 8], rcx
01193 418d4808                       lea        ecx, [r8 + 8]
01197 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
0119b 418502                         test       dword ptr [r10], eax
0119e 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
011a5 0f8d85faffff                   jge        0x7ffaebe6a530
011ab 492bdb                         sub        rbx, r11
011ae 48637c240c                     movsxd     rdi, dword ptr [rsp + 0xc]
011b3 4883c7f9                       add        rdi, -7
011b7 4863c9                         movsxd     rcx, ecx
011ba 4c8d1419                       lea        r10, [rcx + rbx]
011be 4c3bd7                         cmp        r10, rdi
011c1 0f83b9130000                   jae        0x7ffaebe6be80
011c7 4c638c2498000000               movsxd     r9, dword ptr [rsp + 0x98]
011cf 4d8bd1                         mov        r10, r9
011d2 4c2bd1                         sub        r10, rcx
011d5 4983c207                       add        r10, 7
011d9 4983e2f8                       and        r10, 0xfffffffffffffff8
011dd 458bd2                         mov        r10d, r10d
011e0 478d5c0208                     lea        r11d, [r10 + r8 + 8]
011e5 4d63d3                         movsxd     r10, r11d
011e8 4d8d5c1af8                     lea        r11, [r10 + rbx - 8]
011ed 4c3bdf                         cmp        r11, rdi
011f0 0f838a130000                   jae        0x7ffaebe6be80
011f6 8b5c246c                       mov        ebx, dword ptr [rsp + 0x6c]
011fa 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
01201 0f8379130000                   jae        0x7ffaebe6be80
01207 4983c2f8                       add        r10, -8
0120b 4c3bd7                         cmp        r10, rdi
0120e 0f836c130000                   jae        0x7ffaebe6be80
01214 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0121c 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01223 0f8faf130000                   jg         0x7ffaebe6bed8
01229 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01231 452bd8                         sub        r11d, r8d
01234 418bd3                         mov        edx, r11d
01237 41baf8ffffff                   mov        r10d, 0xfffffff8
0123d 4d8d59c8                       lea        r11, [r9 - 0x38]
01241 4981fb00000080                 cmp        r11, -0x80000000
01248 48c7c300000080                 mov        rbx, 0xffffffff80000000
0124f 4c0f4cdb                       cmovl      r11, rbx
01253 418bdb                         mov        ebx, r11d
01256 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
0125e 418d7810                       lea        edi, [r8 + 0x10]
01262 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0126a 498bf3                         mov        rsi, r11
0126d 4863c7                         movsxd     rax, edi
01270 458bdb                         mov        r11d, r11d
01273 452bd3                         sub        r10d, r11d
01276 452bd0                         sub        r10d, r8d
01279 4183c2f0                       add        r10d, -0x10
0127d 41b806000000                   mov        r8d, 6
01283 c442b8f5d2                     bzhi       r10, r10, r8
01288 4903c2                         add        rax, r10
0128b 493bc1                         cmp        rax, r9
0128e 4d8bd9                         mov        r11, r9
01291 4c0f4cd8                       cmovl      r11, rax
01295 4d8bd3                         mov        r10, r11
01298 4c2bd1                         sub        r10, rcx
0129b 4d8d42ff                       lea        r8, [r10 - 1]
0129f 49c1f83f                       sar        r8, 0x3f
012a3 49c1e83d                       shr        r8, 0x3d
012a7 4f8d5410ff                     lea        r10, [r8 + r10 - 1]
012ac 4983e2f8                       and        r10, 0xfffffffffffffff8
012b0 4c03d1                         add        r10, rcx
012b3 493bca                         cmp        rcx, r10
012b6 490f4cca                       cmovl      rcx, r10
012ba 448bc1                         mov        r8d, ecx
012bd 478d540608                     lea        r10d, [r14 + r8 + 8]
012c2 4183c008                       add        r8d, 8
012c6 4963c2                         movsxd     rax, r10d
012c9 4803c6                         add        rax, rsi
012cc 4963c8                         movsxd     rcx, r8d
012cf 4803ce                         add        rcx, rsi
012d2 4c8d4008                       lea        r8, [rax + 8]
012d6 4883c048                       add        rax, 0x48
012da 488d7148                       lea        rsi, [rcx + 0x48]
012de 4533d2                         xor        r10d, r10d
012e1 493bf0                         cmp        rsi, r8
012e4 410f96c2                       setbe      r10b
012e8 4883c108                       add        rcx, 8
012ec 4533c0                         xor        r8d, r8d
012ef 483bc1                         cmp        rax, rcx
012f2 410f96c0                       setbe      r8b
012f6 450bd0                         or         r10d, r8d
012f9 0f84d1080000                   je         0x7ffaebe6b4d0
012ff 458bd3                         mov        r10d, r11d
01302 6690                           nop        
01304 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01309 8bca                           mov        ecx, edx
0130b 034c246c                       add        ecx, dword ptr [rsp + 0x6c]
0130f 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01317 4d8b440808                     mov        r8, qword ptr [r8 + rcx + 8]
0131c 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01324 4e89441908                     mov        qword ptr [rcx + r11 + 8], r8
01329 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0132e 4183c308                       add        r11d, 8
01332 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01337 453bda                         cmp        r11d, r10d
0133a 7cc8                           jl         0x7ffaebe6ac04
0133c 4981c108feffff                 add        r9, -0x1f8
01343 4981f900000080                 cmp        r9, -0x80000000
0134a 49c7c200000080                 mov        r10, 0xffffffff80000000
01351 4d0f4cca                       cmovl      r9, r10
01355 458bd1                         mov        r10d, r9d
01358 453bda                         cmp        r11d, r10d
0135b 0f8d71010000                   jge        0x7ffaebe6add2
01361 458bc3                         mov        r8d, r11d
01364 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01369 0f1f8000000000                 nop        dword ptr [rax]
01370 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01375 4963fb                         movsxd     rdi, r11d
01378 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0137d 448bda                         mov        r11d, edx
01380 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
01385 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
01389 83c140                         add        ecx, 0x40
0138c 03ca                           add        ecx, edx
0138e 458bcb                         mov        r9d, r11d
01391 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
01399 62b17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 8]
013a4 62b17e487f840608000000         vmovdqu32  zmmword ptr [rsi + r8 + 8], zmm0
013af 62f17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 8]
013ba 62f17e487f843e48000000         vmovdqu32  zmmword ptr [rsi + rdi + 0x48], zmm0
013c5 4d63cb                         movsxd     r9, r11d
013c8 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
013cd 4181c080000000                 add        r8d, 0x80
013d4 4403c2                         add        r8d, edx
013d7 62b17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r8 + 8]
013e2 62f17e487f843e88000000         vmovdqu32  zmmword ptr [rsi + rdi + 0x88], zmm0
013ed 62b17e486f840ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0xc8]
013f8 62f17e487f843ec8000000         vmovdqu32  zmmword ptr [rsi + rdi + 0xc8], zmm0
01403 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01408 4181c000010000                 add        r8d, 0x100
0140f 4403c2                         add        r8d, edx
01412 458bd8                         mov        r11d, r8d
01415 62b17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r8 + 8]
01420 62f17e487f843e08010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x108], zmm0
0142b 62b17e486f840e48010000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0x148]
01436 62f17e487f843e48010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x148], zmm0
01441 62b17e486f840e88010000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0x188]
0144c 62f17e487f843e88010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x188], zmm0
01457 4d63db                         movsxd     r11, r11d
0145a 62b17e486f841ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xc8]
01465 62f17e487f843ec8010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x1c8], zmm0
01470 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01475 4181c300020000                 add        r11d, 0x200
0147c 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01481 453bda                         cmp        r11d, r10d
01484 0f8ce6feffff                   jl         0x7ffaebe6ac70
0148a 443bdb                         cmp        r11d, ebx
0148d 7d43                           jge        0x7ffaebe6add2
0148f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01494 448bd2                         mov        r10d, edx
01497 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
0149c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
014a4 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
014af 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
014b4 62917e487f841308000000         vmovdqu32  zmmword ptr [r11 + r10 + 8], zmm0
014bf 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
014c4 4183c240                       add        r10d, 0x40
014c8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
014cd 443bd3                         cmp        r10d, ebx
014d0 7cc2                           jl         0x7ffaebe6ad94
014d2 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
014d7 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
014df 0f8d4bf7ffff                   jge        0x7ffaebe6a530
014e5 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
014ea 6690                           nop        
014ec 468d140a                       lea        r10d, [rdx + r9]
014f0 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
014f8 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
014fd 458bd9                         mov        r11d, r9d
01500 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01508 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
0150d 4183c108                       add        r9d, 8
01511 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
01519 7cd1                           jl         0x7ffaebe6adec
0151b e910f7ffff                     jmp        0x7ffaebe6a530
01520 bee4ffffff                     mov        esi, 0xffffffe4
01525 488b2c24                       mov        rbp, qword ptr [rsp]
01529 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0152e 4489542408                     mov        dword ptr [rsp + 8], r10d
01533 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01538 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0153d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01542 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01547 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0154b 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0154f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01554 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01559 4489442464                     mov        dword ptr [rsp + 0x64], r8d
0155e 6690                           nop        
01560 c5f877                         vzeroupper 
01563 e8f887b5ff                     call       0x7ffaeb9c3660
01568 0f1f84006016000b               nop        dword ptr [rax + rax + 0xb001660]
01570 bee4ffffff                     mov        esi, 0xffffffe4
01575 488b2c24                       mov        rbp, qword ptr [rsp]
01579 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0157e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01583 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01588 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0158d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01592 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01597 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0159b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
015a0 4489442438                     mov        dword ptr [rsp + 0x38], r8d
015a5 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
015aa 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
015af 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
015b4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
015b9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
015be 4489442460                     mov        dword ptr [rsp + 0x60], r8d
015c3 89442464                       mov        dword ptr [rsp + 0x64], eax
015c7 894c2478                       mov        dword ptr [rsp + 0x78], ecx
015cb 90                             nop        
015cc c5f877                         vzeroupper 
015cf e88c87b5ff                     call       0x7ffaeb9c3660
015d4 0f1f8400cc16000c               nop        dword ptr [rax + rax + 0xc0016cc]
015dc bee4ffffff                     mov        esi, 0xffffffe4
015e1 488b2c24                       mov        rbp, qword ptr [rsp]
015e5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
015ea 44895c2408                     mov        dword ptr [rsp + 8], r11d
015ef 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015f4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015f9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015fe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01603 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01608 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0160d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01612 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01617 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0161c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01621 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01626 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0162e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01633 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0163b 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01640 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01645 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0164a 89442464                       mov        dword ptr [rsp + 0x64], eax
0164e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01652 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0165b 90                             nop        
0165c c5f877                         vzeroupper 
0165f e8fc86b5ff                     call       0x7ffaeb9c3660
01664 0f1f84005c17000d               nop        dword ptr [rax + rax + 0xd00175c]
0166c bee4ffffff                     mov        esi, 0xffffffe4
01671 488b2c24                       mov        rbp, qword ptr [rsp]
01675 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0167a 4489542408                     mov        dword ptr [rsp + 8], r10d
0167f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01684 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01689 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0168e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01693 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01698 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0169d 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
016a2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
016a7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
016ac 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
016b1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
016b6 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
016bb 4489742470                     mov        dword ptr [rsp + 0x70], r14d
016c0 c5f877                         vzeroupper 
016c3 e89886b5ff                     call       0x7ffaeb9c3660
016c8 0f1f8400c017000e               nop        dword ptr [rax + rax + 0xe0017c0]
016d0 be45ffffff                     mov        esi, 0xffffff45
016d5 488b2c24                       mov        rbp, qword ptr [rsp]
016d9 4c89542408                     mov        qword ptr [rsp + 8], r10
016de 6690                           nop        
016e0 c5f877                         vzeroupper 
016e3 e87886b5ff                     call       0x7ffaeb9c3660
016e8 0f1f8400e017000f               nop        dword ptr [rax + rax + 0xf0017e0]
016f0 be45ffffff                     mov        esi, 0xffffff45
016f5 488b2c24                       mov        rbp, qword ptr [rsp]
016f9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016fe 44895c2408                     mov        dword ptr [rsp + 8], r11d
01703 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01708 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0170d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01712 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01717 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0171b 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0171f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01724 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01729 89442464                       mov        dword ptr [rsp + 0x64], eax
0172d 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01732 6690                           nop        
01734 c5f877                         vzeroupper 
01737 e82486b5ff                     call       0x7ffaeb9c3660
0173c 0f1f840034180010               nop        dword ptr [rax + rax + 0x10001834]
01744 493bea                         cmp        rbp, r10
01747 bdffffffff                     mov        ebp, 0xffffffff
0174c 7c08                           jl         0x7ffaebe6b056
0174e 400f95c5                       setne      bpl
01752 400fb6ed                       movzx      ebp, bpl
01756 be45ffffff                     mov        esi, 0xffffff45
0175b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01760 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01765 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01769 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0176d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01772 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01777 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0177c 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01781 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01785 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0178a 6690                           nop        
0178c c5f877                         vzeroupper 
0178f e8cc85b5ff                     call       0x7ffaeb9c3660
01794 0f1f84008c180011               nop        dword ptr [rax + rax + 0x1100188c]
0179c be45ffffff                     mov        esi, 0xffffff45
017a1 488b2c24                       mov        rbp, qword ptr [rsp]
017a5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017aa 4489542408                     mov        dword ptr [rsp + 8], r10d
017af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017b9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017be 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017c3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017c7 894c2434                       mov        dword ptr [rsp + 0x34], ecx
017cb 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
017d0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
017d5 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
017da 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
017df 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017e4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017e9 89442464                       mov        dword ptr [rsp + 0x64], eax
017ed 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
017f2 6690                           nop        
017f4 c5f877                         vzeroupper 
017f7 e86485b5ff                     call       0x7ffaeb9c3660
017fc 0f1f8400f4180012               nop        dword ptr [rax + rax + 0x120018f4]
01804 be45ffffff                     mov        esi, 0xffffff45
01809 488b2c24                       mov        rbp, qword ptr [rsp]
0180d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01812 44895c2408                     mov        dword ptr [rsp + 8], r11d
01817 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0181c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01821 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01826 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0182b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0182f 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01833 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01838 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0183d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01842 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01847 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0184c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01851 89442464                       mov        dword ptr [rsp + 0x64], eax
01855 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0185a 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0185f 90                             nop        
01860 c5f877                         vzeroupper 
01863 e8f884b5ff                     call       0x7ffaeb9c3660
01868 0f1f840060190013               nop        dword ptr [rax + rax + 0x13001960]
01870 bee4ffffff                     mov        esi, 0xffffffe4
01875 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0187a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0187f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01883 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01888 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0188d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01892 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01897 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0189f 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018a4 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018ac 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018b1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
018b9 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018be 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
018c6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
018cb 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
018d0 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
018d8 c5f877                         vzeroupper 
018db e88084b5ff                     call       0x7ffaeb9c3660
018e0 0f1f8400d8190014               nop        dword ptr [rax + rax + 0x140019d8]
018e8 bee4ffffff                     mov        esi, 0xffffffe4
018ed 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018f2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018f7 895c2438                       mov        dword ptr [rsp + 0x38], ebx
018fb 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01900 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01905 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0190a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0190f 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01917 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0191c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01924 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01929 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01931 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01936 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0193b 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01940 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01945 666690                         nop        
01948 c5f877                         vzeroupper 
0194b e81084b5ff                     call       0x7ffaeb9c3660
01950 0f1f8400481a0015               nop        dword ptr [rax + rax + 0x15001a48]
01958 bebeffffff                     mov        esi, 0xffffffbe
0195d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01962 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01967 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0196b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01970 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01975 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
0197a 6690                           nop        
0197c c5f877                         vzeroupper 
0197f e8dc83b5ff                     call       0x7ffaeb9c3660
01984 0f1f84007c1a0016               nop        dword ptr [rax + rax + 0x16001a7c]
0198c 4533d2                         xor        r10d, r10d
0198f 4c891424                       mov        qword ptr [rsp], r10
01993 e9cbe7ffff                     jmp        0x7ffaebe69a63
01998 4533d2                         xor        r10d, r10d
0199b 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
019a3 e9eae7ffff                     jmp        0x7ffaebe69a92
019a8 4533d2                         xor        r10d, r10d
019ab 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
019b3 e904e8ffff                     jmp        0x7ffaebe69abc
019b8 4533d2                         xor        r10d, r10d
019bb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019c0 e923e8ffff                     jmp        0x7ffaebe69ae8
019c5 4533d2                         xor        r10d, r10d
019c8 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
019d0 e93de8ffff                     jmp        0x7ffaebe69b12
019d5 beccffffff                     mov        esi, 0xffffffcc
019da 488b2c24                       mov        rbp, qword ptr [rsp]
019de 48894424f8                     mov        qword ptr [rsp - 8], rax
019e3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019e7 89442408                       mov        dword ptr [rsp + 8], eax
019eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f0 48ff742420                     push       qword ptr [rsp + 0x20]
019f5 488f442418                     pop        qword ptr [rsp + 0x18]
019fa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019ff 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a04 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a09 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a0e 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a13 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a18 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a1d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a22 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a27 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a2c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01a34 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a39 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01a41 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a46 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01a4e 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01a53 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a58 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01a5d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01a65 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01a6a 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
01a6f 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01a76 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01a7e 6690                           nop        
01a80 c5f877                         vzeroupper 
01a83 e8d882b5ff                     call       0x7ffaeb9c3660
01a88 0f1f8400801b0017               nop        dword ptr [rax + rax + 0x17001b80]
01a90 beccffffff                     mov        esi, 0xffffffcc
01a95 488b2c24                       mov        rbp, qword ptr [rsp]
01a99 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a9e 4489542408                     mov        dword ptr [rsp + 8], r10d
01aa3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01aa8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01aad 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ab2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ab7 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01abc 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01ac1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01ac6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01acb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ad0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ad5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ada 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01adf 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ae4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ae9 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01af1 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01af6 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01afe 6690                           nop        
01b00 c5f877                         vzeroupper 
01b03 e85882b5ff                     call       0x7ffaeb9c3660
01b08 0f1f8400001c0018               nop        dword ptr [rax + rax + 0x18001c00]
01b10 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01b18 4d3bd8                         cmp        r11, r8
01b1b bdffffffff                     mov        ebp, 0xffffffff
01b20 7c08                           jl         0x7ffaebe6b42a
01b22 400f95c5                       setne      bpl
01b26 400fb6ed                       movzx      ebp, bpl
01b2a be45ffffff                     mov        esi, 0xffffff45
01b2f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01b34 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01b39 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01b3d 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01b41 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01b46 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01b4b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01b50 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01b55 89442468                       mov        dword ptr [rsp + 0x68], eax
01b59 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01b5e 6690                           nop        
01b60 c5f877                         vzeroupper 
01b63 e8f881b5ff                     call       0x7ffaeb9c3660
01b68 0f1f8400601c0019               nop        dword ptr [rax + rax + 0x19001c60]
01b70 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01b78 493be8                         cmp        rbp, r8
01b7b bdffffffff                     mov        ebp, 0xffffffff
01b80 7c08                           jl         0x7ffaebe6b48a
01b82 400f95c5                       setne      bpl
01b86 400fb6ed                       movzx      ebp, bpl
01b8a be45ffffff                     mov        esi, 0xffffff45
01b8f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01b94 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01b99 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01b9d 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01ba1 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01ba6 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01bab 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01bb0 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01bb5 89442468                       mov        dword ptr [rsp + 0x68], eax
01bb9 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01bbe 6690                           nop        
01bc0 c5f877                         vzeroupper 
01bc3 e89881b5ff                     call       0x7ffaeb9c3660
01bc8 0f1f8400c01c001a               nop        dword ptr [rax + rax + 0x1a001cc0]
01bd0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01bd5 448bd2                         mov        r10d, edx
01bd8 440354246c                     add        r10d, dword ptr [rsp + 0x6c]
01bdd 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01be5 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01bea 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01bef 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01bf4 4183c208                       add        r10d, 8
01bf8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01bfd 443bd7                         cmp        r10d, edi
01c00 7cce                           jl         0x7ffaebe6b4d0
01c02 443bd3                         cmp        r10d, ebx
01c05 0f8d9f000000                   jge        0x7ffaebe6b5aa
01c0b 458bda                         mov        r11d, r10d
01c0e 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01c13 0f1f8000000000                 nop        dword ptr [rax]
01c1a 660f1f440000                   nop        word ptr [rax + rax]
01c20 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c25 4d63cb                         movsxd     r9, r11d
01c28 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01c2d 448bc2                         mov        r8d, edx
01c30 440344246c                     add        r8d, dword ptr [rsp + 0x6c]
01c35 458bd8                         mov        r11d, r8d
01c38 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01c40 4e8b440108                     mov        r8, qword ptr [rcx + r8 + 8]
01c45 4e89441108                     mov        qword ptr [rcx + r10 + 8], r8
01c4a 4d63c3                         movsxd     r8, r11d
01c4d 4e8b540110                     mov        r10, qword ptr [rcx + r8 + 0x10]
01c52 4e89540910                     mov        qword ptr [rcx + r9 + 0x10], r10
01c57 4e8b540118                     mov        r10, qword ptr [rcx + r8 + 0x18]
01c5c 4e89540918                     mov        qword ptr [rcx + r9 + 0x18], r10
01c61 4e8b540120                     mov        r10, qword ptr [rcx + r8 + 0x20]
01c66 4e89540920                     mov        qword ptr [rcx + r9 + 0x20], r10
01c6b 4e8b540128                     mov        r10, qword ptr [rcx + r8 + 0x28]
01c70 4e89540928                     mov        qword ptr [rcx + r9 + 0x28], r10
01c75 4e8b540130                     mov        r10, qword ptr [rcx + r8 + 0x30]
01c7a 4e89540930                     mov        qword ptr [rcx + r9 + 0x30], r10
01c7f 4e8b540138                     mov        r10, qword ptr [rcx + r8 + 0x38]
01c84 4e89540938                     mov        qword ptr [rcx + r9 + 0x38], r10
01c89 4e8b540140                     mov        r10, qword ptr [rcx + r8 + 0x40]
01c8e 4e89540940                     mov        qword ptr [rcx + r9 + 0x40], r10
01c93 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01c98 4183c240                       add        r10d, 0x40
01c9c 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01ca1 443bd3                         cmp        r10d, ebx
01ca4 0f8c76ffffff                   jl         0x7ffaebe6b520
01caa 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01caf 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01cb7 0f8d73efffff                   jge        0x7ffaebe6a530
01cbd 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01cc2 6690                           nop        
01cc4 468d041a                       lea        r8d, [rdx + r11]
01cc8 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01cd0 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
01cd5 458bcb                         mov        r9d, r11d
01cd8 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01ce0 4f89540808                     mov        qword ptr [r8 + r9 + 8], r10
01ce5 458d5308                       lea        r10d, [r11 + 8]
01ce9 458bda                         mov        r11d, r10d
01cec 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01cf4 7cce                           jl         0x7ffaebe6b5c4
01cf6 e935efffff                     jmp        0x7ffaebe6a530
01cfb bee4ffffff                     mov        esi, 0xffffffe4
01d00 488b2c24                       mov        rbp, qword ptr [rsp]
01d04 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d09 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d0e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d13 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d18 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d1d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d22 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d26 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01d2a 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01d2f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d34 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d39 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d3e 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01d46 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01d4b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d50 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d55 89442464                       mov        dword ptr [rsp + 0x64], eax
01d59 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01d60 c5f877                         vzeroupper 
01d63 e8f87fb5ff                     call       0x7ffaeb9c3660
01d68 0f1f8400601e001b               nop        dword ptr [rax + rax + 0x1b001e60]
01d70 be6effffff                     mov        esi, 0xffffff6e
01d75 488b2c24                       mov        rbp, qword ptr [rsp]
01d79 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01d7e 4489442408                     mov        dword ptr [rsp + 8], r8d
01d83 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01d88 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d8d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01d92 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01d97 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d9b 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01d9f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01da4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01da9 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01dae 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01db3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01db8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01dbd 89442464                       mov        dword ptr [rsp + 0x64], eax
01dc1 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01dc6 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01dca 6690                           nop        
01dcc c5f877                         vzeroupper 
01dcf e88c7fb5ff                     call       0x7ffaeb9c3660
01dd4 0f1f8400cc1e001c               nop        dword ptr [rax + rax + 0x1c001ecc]
01ddc be45ffffff                     mov        esi, 0xffffff45
01de1 488b2c24                       mov        rbp, qword ptr [rsp]
01de5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01dea 44895c2408                     mov        dword ptr [rsp + 8], r11d
01def 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01df4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01df9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dfe 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e03 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01e07 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01e0b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e10 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e15 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e1a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e1f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e24 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e29 89442464                       mov        dword ptr [rsp + 0x64], eax
01e2d 89542478                       mov        dword ptr [rsp + 0x78], edx
01e31 666690                         nop        
01e34 c5f877                         vzeroupper 
01e37 e8247fb5ff                     call       0x7ffaeb9c3660
01e3c 0f1f8400341f001d               nop        dword ptr [rax + rax + 0x1d001f34]
01e44 be3dffffff                     mov        esi, 0xffffff3d
01e49 488b2c24                       mov        rbp, qword ptr [rsp]
01e4d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e52 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e57 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e5c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e61 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e66 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e6b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01e6f 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01e73 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e78 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e7d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e82 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e87 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e8c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e91 89442464                       mov        dword ptr [rsp + 0x64], eax
01e95 89542478                       mov        dword ptr [rsp + 0x78], edx
01e99 666690                         nop        
01e9c c5f877                         vzeroupper 
01e9f e8bc7eb5ff                     call       0x7ffaeb9c3660
01ea4 0f1f84009c1f001e               nop        dword ptr [rax + rax + 0x1e001f9c]
01eac bee4ffffff                     mov        esi, 0xffffffe4
01eb1 488b2c24                       mov        rbp, qword ptr [rsp]
01eb5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01eba 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ebf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ec4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ec9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ece 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ed3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ed8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01edd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ee2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01ee7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01eec 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ef1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ef6 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01efb 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01f03 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f08 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01f10 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01f15 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f1a 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01f1f 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01f27 90                             nop        
01f28 c5f877                         vzeroupper 
01f2b e8307eb5ff                     call       0x7ffaeb9c3660
01f30 0f1f84002820001f               nop        dword ptr [rax + rax + 0x1f002028]
01f38 bee4ffffff                     mov        esi, 0xffffffe4
01f3d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f42 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01f47 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01f4c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f51 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01f56 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f5b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f60 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f65 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01f6d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01f72 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01f7a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01f7f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f84 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01f89 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f8e 6690                           nop        
01f90 c5f877                         vzeroupper 
01f93 e8c87db5ff                     call       0x7ffaeb9c3660
01f98 0f1f840090200020               nop        dword ptr [rax + rax + 0x20002090]
01fa0 418d6e01                       lea        ebp, [r14 + 1]
01fa4 bee4ffffff                     mov        esi, 0xffffffe4
01fa9 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fae 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01fb3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01fb8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01fbd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01fc2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01fc7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01fcc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fd1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01fd9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01fde 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01fe6 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01feb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ff0 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01ff5 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01ffa 6690                           nop        
01ffc c5f877                         vzeroupper 
01fff e85c7db5ff                     call       0x7ffaeb9c3660
02004 0f1f8400fc200021               nop        dword ptr [rax + rax + 0x210020fc]
0200c bee4ffffff                     mov        esi, 0xffffffe4
02011 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02016 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0201b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02020 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02025 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0202a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0202f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02034 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02039 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02041 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02046 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0204b 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02050 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02055 666690                         nop        
02058 c5f877                         vzeroupper 
0205b e8007db5ff                     call       0x7ffaeb9c3660
02060 0f1f840058210022               nop        dword ptr [rax + rax + 0x22002158]
02068 bee4ffffff                     mov        esi, 0xffffffe4
0206d 488b2c24                       mov        rbp, qword ptr [rsp]
02071 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02076 4489542408                     mov        dword ptr [rsp + 8], r10d
0207b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02080 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02085 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0208a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0208f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02094 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02099 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0209e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
020a3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020a8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020ad 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
020b2 4489542440                     mov        dword ptr [rsp + 0x40], r10d
020b7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020bc 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
020c1 4489742474                     mov        dword ptr [rsp + 0x74], r14d
020c6 6690                           nop        
020c8 c5f877                         vzeroupper 
020cb e8907cb5ff                     call       0x7ffaeb9c3660
020d0 0f1f8400c8210023               nop        dword ptr [rax + rax + 0x230021c8]
020d8 beccffffff                     mov        esi, 0xffffffcc
020dd 488b2c24                       mov        rbp, qword ptr [rsp]
020e1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
020e6 44895c2408                     mov        dword ptr [rsp + 8], r11d
020eb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020f0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020f5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020fa 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020ff 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02104 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02109 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0210e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02113 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02118 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0211d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02122 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02127 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0212f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02134 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0213c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02141 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02146 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0214b 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02150 c5f877                         vzeroupper 
02153 e8087cb5ff                     call       0x7ffaeb9c3660
02158 0f1f840050220024               nop        dword ptr [rax + rax + 0x24002250]
02160 be45ffffff                     mov        esi, 0xffffff45
02165 488b2c24                       mov        rbp, qword ptr [rsp]
02169 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0216e 4489542408                     mov        dword ptr [rsp + 8], r10d
02173 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02178 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0217d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02182 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02187 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0218c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02191 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02196 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0219b 4489742468                     mov        dword ptr [rsp + 0x68], r14d
021a0 c5f877                         vzeroupper 
021a3 e8b87bb5ff                     call       0x7ffaeb9c3660
021a8 0f1f8400a0220025               nop        dword ptr [rax + rax + 0x250022a0]
021b0 be85ffffff                     mov        esi, 0xffffff85
021b5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
021ba 44891c24                       mov        dword ptr [rsp], r11d
021be 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021c3 4489542404                     mov        dword ptr [rsp + 4], r10d
021c8 895c2408                       mov        dword ptr [rsp + 8], ebx
021cc 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
021d1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021d6 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
021db 4489742444                     mov        dword ptr [rsp + 0x44], r14d
021e0 c5f877                         vzeroupper 
021e3 e8787bb5ff                     call       0x7ffaeb9c3660
021e8 0f1f8400e0220026               nop        dword ptr [rax + rax + 0x260022e0]
021f0 4533d2                         xor        r10d, r10d
021f3 4c89542470                     mov        qword ptr [rsp + 0x70], r10
021f8 eb0d                           jmp        0x7ffaebe6bb07
021fa 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
02202 4c89542470                     mov        qword ptr [rsp + 0x70], r10
02207 be6effffff                     mov        esi, 0xffffff6e
0220c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02211 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02216 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0221a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0221f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02224 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02229 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0222e 6690                           nop        
02230 c5f877                         vzeroupper 
02233 e8287bb5ff                     call       0x7ffaeb9c3660
02238 0f1f840030230027               nop        dword ptr [rax + rax + 0x27002330]
02240 beccffffff                     mov        esi, 0xffffffcc
02245 488b2c24                       mov        rbp, qword ptr [rsp]
02249 894c2410                       mov        dword ptr [rsp + 0x10], ecx
0224d 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02251 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02256 6690                           nop        
02258 c5f877                         vzeroupper 
0225b e8007bb5ff                     call       0x7ffaeb9c3660
02260 0f1f840058230028               nop        dword ptr [rax + rax + 0x28002358]
02268 bee4ffffff                     mov        esi, 0xffffffe4
0226d 488b2c24                       mov        rbp, qword ptr [rsp]
02271 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02276 4489542408                     mov        dword ptr [rsp + 8], r10d
0227b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02280 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02285 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0228a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0228f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02294 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02299 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0229e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022a3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022a8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
022ad 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
022b5 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
022ba 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022bf 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
022c4 89442460                       mov        dword ptr [rsp + 0x60], eax
022c8 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
022cd 895c2470                       mov        dword ptr [rsp + 0x70], ebx
022d1 894c2474                       mov        dword ptr [rsp + 0x74], ecx
022d5 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
022dc c5f877                         vzeroupper 
022df e87c7ab5ff                     call       0x7ffaeb9c3660
022e4 0f1f8400dc230029               nop        dword ptr [rax + rax + 0x290023dc]
022ec c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
022f5 bee4ffffff                     mov        esi, 0xffffffe4
022fa 488b2c24                       mov        rbp, qword ptr [rsp]
022fe 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02303 44895c2408                     mov        dword ptr [rsp + 8], r11d
02308 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0230d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02312 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02317 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0231c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02321 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02326 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0232b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02330 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02335 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0233a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02342 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02347 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0234c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02351 89442460                       mov        dword ptr [rsp + 0x60], eax
02355 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0235a 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0235f 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02366 6690                           nop        
02368 c5f877                         vzeroupper 
0236b e8f079b5ff                     call       0x7ffaeb9c3660
02370 0f1f84006824002a               nop        dword ptr [rax + rax + 0x2a002468]
02378 beccffffff                     mov        esi, 0xffffffcc
0237d 488b2c24                       mov        rbp, qword ptr [rsp]
02381 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02386 44895c2408                     mov        dword ptr [rsp + 8], r11d
0238b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02390 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02395 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0239a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0239f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
023a4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
023a9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023ae 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023b3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
023b8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
023bd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
023c5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
023ca 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
023d2 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
023d7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023dc 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
023e1 894c2478                       mov        dword ptr [rsp + 0x78], ecx
023e5 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
023e9 89842488000000                 mov        dword ptr [rsp + 0x88], eax
023f0 c5f877                         vzeroupper 
023f3 e86879b5ff                     call       0x7ffaeb9c3660
023f8 0f1f8400f024002b               nop        dword ptr [rax + rax + 0x2b0024f0]
02400 8bea                           mov        ebp, edx
02402 83c510                         add        ebp, 0x10
02405 be6effffff                     mov        esi, 0xffffff6e
0240a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0240f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02414 89542438                       mov        dword ptr [rsp + 0x38], edx
02418 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0241d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02422 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02427 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0242c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02431 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02436 89442468                       mov        dword ptr [rsp + 0x68], eax
0243a 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0243f 90                             nop        
02440 c5f877                         vzeroupper 
02443 e81879b5ff                     call       0x7ffaeb9c3660
02448 0f1f84004025002c               nop        dword ptr [rax + rax + 0x2c002540]
02450 8bea                           mov        ebp, edx
02452 83c510                         add        ebp, 0x10
02455 be66ffffff                     mov        esi, 0xffffff66
0245a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0245f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02464 89542438                       mov        dword ptr [rsp + 0x38], edx
02468 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0246d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02472 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02477 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0247c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02481 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02486 89442468                       mov        dword ptr [rsp + 0x68], eax
0248a 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0248f 90                             nop        
02490 c5f877                         vzeroupper 
02493 e8c878b5ff                     call       0x7ffaeb9c3660
02498 0f1f84009025002d               nop        dword ptr [rax + rax + 0x2d002590]
024a0 bee4ffffff                     mov        esi, 0xffffffe4
024a5 488b2c24                       mov        rbp, qword ptr [rsp]
024a9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
024ae 4489542408                     mov        dword ptr [rsp + 8], r10d
024b3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024b8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024bd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
024c2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024c7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
024cc 4489542430                     mov        dword ptr [rsp + 0x30], r10d
024d1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
024d6 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
024db 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
024e0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024e5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
024ea 4489542440                     mov        dword ptr [rsp + 0x40], r10d
024ef 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
024f7 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
024fc 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02501 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02506 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
0250e 6690                           nop        
02510 c5f877                         vzeroupper 
02513 e84878b5ff                     call       0x7ffaeb9c3660
02518 0f1f84001026002e               nop        dword ptr [rax + rax + 0x2e002610]
02520 bee4ffffff                     mov        esi, 0xffffffe4
02525 488b2c24                       mov        rbp, qword ptr [rsp]
02529 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0252e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02533 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02538 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0253d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02542 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02547 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0254c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02551 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02556 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0255b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02560 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02565 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0256a 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0256f 90                             nop        
02570 c5f877                         vzeroupper 
02573 e8e877b5ff                     call       0x7ffaeb9c3660
02578 0f1f84007026002f               nop        dword ptr [rax + rax + 0x2f002670]
02580 be6effffff                     mov        esi, 0xffffff6e
02585 488b2c24                       mov        rbp, qword ptr [rsp]
02589 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0258e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02593 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02598 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0259d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025a2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025a7 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
025ac 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
025b1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
025b6 4489542440                     mov        dword ptr [rsp + 0x40], r10d
025bb 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
025c3 4489542464                     mov        dword ptr [rsp + 0x64], r10d
025c8 c5f877                         vzeroupper 
025cb e89077b5ff                     call       0x7ffaeb9c3660
025d0 0f1f8400c8260030               nop        dword ptr [rax + rax + 0x300026c8]
025d8 be66ffffff                     mov        esi, 0xffffff66
025dd 488b2c24                       mov        rbp, qword ptr [rsp]
025e1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
025e6 44895c2408                     mov        dword ptr [rsp + 8], r11d
025eb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025f0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025f5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025fa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025ff 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02604 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02609 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0260e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02613 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0261b 458bd3                         mov        r10d, r11d
0261e 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02623 90                             nop        
02624 c5f877                         vzeroupper 
02627 e83477b5ff                     call       0x7ffaeb9c3660
0262c 0f1f840024270031               nop        dword ptr [rax + rax + 0x31002724]
02634 488bf0                         mov        rsi, rax
02637 eb0d                           jmp        0x7ffaebe6bf46
02639 488bf0                         mov        rsi, rax
0263c eb08                           jmp        0x7ffaebe6bf46
0263e 488bf0                         mov        rsi, rax
02641 eb03                           jmp        0x7ffaebe6bf46
02643 488bf0                         mov        rsi, rax
02646 c5f877                         vzeroupper 
02649 4881c400010000                 add        rsp, 0x100
02650 5d                             pop        rbp
02651 e98ad8b5ff                     jmp        0x7ffaeb9c97e0
02656 bef6ffffff                     mov        esi, 0xfffffff6
0265b 90                             nop        
0265c c5f877                         vzeroupper 
0265f e8fc76b5ff                     call       0x7ffaeb9c3660
02664 0f1f84005c270032               nop        dword ptr [rax + rax + 0x3200275c]
0266c 49ba0caae6ebfa7f0000           movabs     r10, 0x7ffaebe6aa0c
02676 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0267d e95e1fa9ff                     jmp        0x7ffaeb8fdee0
02682 e819eba7ff                     call       0x7ffaeb8eaaa0
02687 e9a2d9ffff                     jmp        0x7ffaebe6992e
0268c f4                             hlt        
0268d f4                             hlt        
0268e f4                             hlt        
0268f f4                             hlt        
