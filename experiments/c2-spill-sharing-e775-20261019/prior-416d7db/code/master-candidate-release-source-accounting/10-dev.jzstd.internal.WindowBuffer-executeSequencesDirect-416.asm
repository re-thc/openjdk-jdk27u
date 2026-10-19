00000 e83bbb8615                     call       0x7f4ec56d5340
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85d0250000                   jne        0x7f4eafe6bdfe
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
00079 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00080 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00085 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0008c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00091 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00097 448baef0000000                 mov        r13d, dword ptr [rsi + 0xf0]
0009e 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000a5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
000aa 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b1 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000b6 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000bd 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000c5 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cc 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000d4 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d8 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
000e0 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000e4 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
000ec 8b6e68                         mov        ebp, dword ptr [rsi + 0x68]
000ef 448b5648                       mov        r10d, dword ptr [rsi + 0x48]
000f3 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
000fb 448b5e10                       mov        r11d, dword ptr [rsi + 0x10]
000ff 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00107 448b5608                       mov        r10d, dword ptr [rsi + 8]
0010b 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00113 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
0011a 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00122 488bfe                         mov        rdi, rsi
00125 c5f877                         vzeroupper 
00128 49ba80ba7bc54e7f0000           movabs     r10, 0x7f4ec57bba80
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f8411180000                   je         0x7f4eafe6b15c
0014b 458b12                         mov        r10d, dword ptr [r10]
0014e 41c1ea0d                       shr        r10d, 0xd
00152 4181fa15040000                 cmp        r10d, 0x415
00159 0f85dd1f0000                   jne        0x7f4eafe6b93c
0015f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00164 4c891424                       mov        qword ptr [rsp], r10
00168 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0016d 4d85d2                         test       r10, r10
00170 0f84f2170000                   je         0x7f4eafe6b168
00176 458b1a                         mov        r11d, dword ptr [r10]
00179 41c1eb0d                       shr        r11d, 0xd
0017d 4181fb05010000                 cmp        r11d, 0x105
00184 0f85b21f0000                   jne        0x7f4eafe6b93c
0018a 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00192 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00197 4d85d2                         test       r10, r10
0019a 0f84d8170000                   je         0x7f4eafe6b178
001a0 458b12                         mov        r10d, dword ptr [r10]
001a3 41c1ea0d                       shr        r10d, 0xd
001a7 4181fa08010000                 cmp        r10d, 0x108
001ae 0f85881f0000                   jne        0x7f4eafe6b93c
001b4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001b9 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001c1 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c6 4d85d2                         test       r10, r10
001c9 0f84b9170000                   je         0x7f4eafe6b188
001cf 458b1a                         mov        r11d, dword ptr [r10]
001d2 41c1eb0d                       shr        r11d, 0xd
001d6 4181fb07010000                 cmp        r11d, 0x107
001dd 0f85591f0000                   jne        0x7f4eafe6b93c
001e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001e8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001ed 4d85d2                         test       r10, r10
001f0 0f849f170000                   je         0x7f4eafe6b195
001f6 458b12                         mov        r10d, dword ptr [r10]
001f9 41c1ea0d                       shr        r10d, 0xd
001fd 4181fa07010000                 cmp        r10d, 0x107
00204 0f85321f0000                   jne        0x7f4eafe6b93c
0020a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0020f 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
00217 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0021c 458b1a                         mov        r11d, dword ptr [r10]
0021f 41c1eb0d                       shr        r11d, 0xd
00223 4181fb05010000                 cmp        r11d, 0x105
0022a 0f850c1f0000                   jne        0x7f4eafe6b93c
00230 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
00238 458b5204                       mov        r10d, dword ptr [r10 + 4]
0023c 4489542408                     mov        dword ptr [rsp + 8], r10d
00241 458d5af9                       lea        r11d, [r10 - 7]
00245 4585db                         test       r11d, r11d
00248 0f8c381f0000                   jl         0x7f4eafe6b986
0024e 458bda                         mov        r11d, r10d
00251 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00256 4183c2f1                       add        r10d, -0xf
0025a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0025f 4183c3f9                       add        r11d, -7
00263 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0026b e917020000                     jmp        0x7f4eafe69c87
00270 448bd5                         mov        r10d, ebp
00273 4d63d2                         movsxd     r10, r10d
00276 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0027d c442a8f5db                     bzhi       r11, r11, r10
00282 c4c1fb92fb                     kmovq      k7, r11
00287 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0028d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00293 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
0029b 4403dd                         add        r11d, ebp
0029e 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
002a6 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002aa 418502                         test       dword ptr [r10], eax
002ad 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
002b5 0f8d7d090000                   jge        0x7f4eafe6a438
002bb 418bdd                         mov        ebx, r13d
002be 448bc3                         mov        r8d, ebx
002c1 442b8424cc000000               sub        r8d, dword ptr [rsp + 0xcc]
002c9 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
002d0 2bac24cc000000                 sub        ebp, dword ptr [rsp + 0xcc]
002d7 3bac24cc000000                 cmp        ebp, dword ptr [rsp + 0xcc]
002de 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
002e6 410f4fea                       cmovg      ebp, r10d
002ea 4585c0                         test       r8d, r8d
002ed 0f8cb2160000                   jl         0x7f4eafe6b1a5
002f3 85db                           test       ebx, ebx
002f5 0f8caa160000                   jl         0x7f4eafe6b1a5
002fb 458d1428                       lea        r10d, [r8 + rbp]
002ff 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00304 453bca                         cmp        r9d, r10d
00307 0f8298160000                   jb         0x7f4eafe6b1a5
0030d 448d2c2b                       lea        r13d, [rbx + rbp]
00311 453bcd                         cmp        r9d, r13d
00314 0f828b160000                   jb         0x7f4eafe6b1a5
0031a 85ed                           test       ebp, ebp
0031c 0f8c83160000                   jl         0x7f4eafe6b1a5
00322 85ed                           test       ebp, ebp
00324 0f8469ffffff                   je         0x7f4eafe69a93
0032a 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00332 498d741a08                     lea        rsi, [r10 + rbx + 8]
00337 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
0033c 4863d5                         movsxd     rdx, ebp
0033f 4883fa20                       cmp        rdx, 0x20
00343 0f8627ffffff                   jbe        0x7f4eafe69a70
00349 c5f877                         vzeroupper 
0034c 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00356 41ffd2                         call       r10
00359 0f1f840000000000               nop        dword ptr [rax + rax]
00361 e92dffffff                     jmp        0x7f4eafe69a93
00366 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0036e 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00376 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0037d 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00384 4103da                         add        ebx, r10d
00387 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
0038b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00390 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00398 e98a020000                     jmp        0x7f4eafe69e27
0039d 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
003a5 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003aa 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
003b2 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
003ba 4b8d741308                     lea        rsi, [r11 + r10 + 8]
003bf 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
003c7 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
003cf 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
003d7 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003df 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
003e7 0f8cf2050000                   jl         0x7f4eafe6a1df
003ed 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
003f5 4183fa30                       cmp        r10d, 0x30
003f9 7e7c                           jle        0x7f4eafe69c77
003fb 4585f6                         test       r14d, r14d
003fe 0f8c2c160000                   jl         0x7f4eafe6b230
00404 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0040c 4585d2                         test       r10d, r10d
0040f 0f8c1b160000                   jl         0x7f4eafe6b230
00415 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0041d 4503de                         add        r11d, r14d
00420 448b542408                     mov        r10d, dword ptr [rsp + 8]
00425 453bd3                         cmp        r10d, r11d
00428 0f8202160000                   jb         0x7f4eafe6b230
0042e 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00436 0f82f4150000                   jb         0x7f4eafe6b230
0043c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00444 4585d2                         test       r10d, r10d
00447 0f842e010000                   je         0x7f4eafe69d7b
0044d 4963d2                         movsxd     rdx, r10d
00450 4883fa20                       cmp        rdx, 0x20
00454 0f86fe000000                   jbe        0x7f4eafe69d58
0045a c5f877                         vzeroupper 
0045d 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00467 41ffd2                         call       r10
0046a 0f1f840000000000               nop        dword ptr [rax + rax]
00472 e904010000                     jmp        0x7f4eafe69d7b
00477 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
0047b 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
00482 448b6c2474                     mov        r13d, dword ptr [rsp + 0x74]
00487 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
0048f 0f83cb130000                   jae        0x7f4eafe6b060
00495 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0049d 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
004a2 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
004aa 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
004b2 0f8318140000                   jae        0x7f4eafe6b0d0
004b8 4183c608                       add        r14d, 8
004bc 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004c0 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004c8 4f89441908                     mov        qword ptr [r9 + r11 + 8], r8
004cd 4183c308                       add        r11d, 8
004d1 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
004d9 418502                         test       dword ptr [r10], eax
004dc 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
004e4 7d69                           jge        0x7f4eafe69d4f
004e6 66660f1f840000000000           nop        word ptr [rax + rax]
004f0 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
004f8 0f8362130000                   jae        0x7f4eafe6b060
004fe 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00506 4f8b443208                     mov        r8, qword ptr [r10 + r14 + 8]
0050b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00513 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
0051b 0f83af130000                   jae        0x7f4eafe6b0d0
00521 4183c608                       add        r14d, 8
00525 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
00529 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00531 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
00536 4183c208                       add        r10d, 8
0053a 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00542 418503                         test       dword ptr [r11], eax
00545 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
0054d 7ca1                           jl         0x7f4eafe69cf0
0054f 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
00556 eb33                           jmp        0x7f4eafe69d8b
00558 458bda                         mov        r11d, r10d
0055b 4d63d3                         movsxd     r10, r11d
0055e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00565 c442a8f5db                     bzhi       r11, r11, r10
0056a c4c1fb92fb                     kmovq      k7, r11
0056f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00575 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0057b 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
0057f 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00586 448b6c2474                     mov        r13d, dword ptr [rsp + 0x74]
0058b 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00593 458b4204                       mov        r8d, dword ptr [r10 + 4]
00597 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0059c 4585d2                         test       r10d, r10d
0059f 0f8c8f130000                   jl         0x7f4eafe6b134
005a5 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
005ad 458b5a04                       mov        r11d, dword ptr [r10 + 4]
005b1 4183fb01                       cmp        r11d, 1
005b5 0f8679130000                   jbe        0x7f4eafe6b134
005bb 4183fb02                       cmp        r11d, 2
005bf 0f866f130000                   jbe        0x7f4eafe6b134
005c5 4585db                         test       r11d, r11d
005c8 0f8666130000                   jbe        0x7f4eafe6b134
005ce 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
005d6 418b4a04                       mov        ecx, dword ptr [r10 + 4]
005da 448d49f1                       lea        r9d, [rcx - 0xf]
005de 4585c9                         test       r9d, r9d
005e1 0f8c4d130000                   jl         0x7f4eafe6b134
005e7 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
005ec 448bd1                         mov        r10d, ecx
005ef 458d71f1                       lea        r14d, [r9 - 0xf]
005f3 4489b424e0000000               mov        dword ptr [rsp + 0xe0], r14d
005fb 458d72f1                       lea        r14d, [r10 - 0xf]
005ff 4489ac2498000000               mov        dword ptr [rsp + 0x98], r13d
00607 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0060c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00611 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00615 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0061a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0061f 4489b424d0000000               mov        dword ptr [rsp + 0xd0], r14d
00627 4d8b4f30                       mov        r9, qword ptr [r15 + 0x30]
0062b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00630 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
00638 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00640 498d741b08                     lea        rsi, [r11 + rbx + 8]
00645 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
0064d 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00655 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
0065a 448d4501                       lea        r8d, [rbp + 1]
0065e 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00663 418501                         test       dword ptr [r9], eax
00666 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0066b 0f8d220a0000                   jge        0x7f4eafe6a893
00671 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
00676 0f83ac0e0000                   jae        0x7f4eafe6ad28
0067c 4c63dd                         movsxd     r11, ebp
0067f 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
00687 4f8b4cd810                     mov        r9, qword ptr [r8 + r11*8 + 0x10]
0068c 458bd9                         mov        r11d, r9d
0068f 4181e3ffff0100                 and        r11d, 0x1ffff
00696 418bc3                         mov        eax, r11d
00699 4d8bd9                         mov        r11, r9
0069c 49c1eb12                       shr        r11, 0x12
006a0 49c1f924                       sar        r9, 0x24
006a4 458bc3                         mov        r8d, r11d
006a7 458bd9                         mov        r11d, r9d
006aa 418bd3                         mov        edx, r11d
006ad 4181e0ffff0300                 and        r8d, 0x3ffff
006b4 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
006bc 4585db                         test       r11d, r11d
006bf 0f8c2b100000                   jl         0x7f4eafe6aef0
006c5 448bd8                         mov        r11d, eax
006c8 4585db                         test       r11d, r11d
006cb 0f8513020000                   jne        0x7f4eafe6a0e4
006d1 4533d2                         xor        r10d, r10d
006d4 418bc2                         mov        eax, r10d
006d7 83fa03                         cmp        edx, 3
006da 0f8e58020000                   jle        0x7f4eafe6a138
006e0 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006e8 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
006ec 45895a10                       mov        dword ptr [r10 + 0x10], r11d
006f0 458b5208                       mov        r10d, dword ptr [r10 + 8]
006f4 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
006fc 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00700 448d52fd                       lea        r10d, [rdx - 3]
00704 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
0070c 45895308                       mov        dword ptr [r11 + 8], r10d
00710 4863ac24cc000000               movsxd     rbp, dword ptr [rsp + 0xcc]
00718 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
0071d 4c63d3                         movsxd     r10, ebx
00720 4c03542478                     add        r10, qword ptr [rsp + 0x78]
00725 4863d0                         movsxd     rdx, eax
00728 4c03d2                         add        r10, rdx
0072b 493bea                         cmp        rbp, r10
0072e 0f8f0c100000                   jg         0x7f4eafe6af40
00734 448d2c03                       lea        r13d, [rbx + rax]
00738 458bf5                         mov        r14d, r13d
0073b 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00743 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
0074b 4585c0                         test       r8d, r8d
0074e 0f84b8010000                   je         0x7f4eafe6a10c
00754 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00759 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00761 4585db                         test       r11d, r11d
00764 0f8e660f0000                   jle        0x7f4eafe6aed0
0076a 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00772 4503d5                         add        r10d, r13d
00775 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
0077d 0f8f11100000                   jg         0x7f4eafe6af94
00783 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0078b 4403d8                         add        r11d, eax
0078e 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00793 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0079b 0f8f57100000                   jg         0x7f4eafe6aff8
007a1 83f810                         cmp        eax, 0x10
007a4 0f8fa3040000                   jg         0x7f4eafe6a44d
007aa 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
007b2 443b9c24d0000000               cmp        r11d, dword ptr [rsp + 0xd0]
007ba 0f83b40d0000                   jae        0x7f4eafe6ad74
007c0 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007c8 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
007cf 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
007d6 0f83000e0000                   jae        0x7f4eafe6addc
007dc 468d0418                       lea        r8d, [rax + r11]
007e0 4489442474                     mov        dword ptr [rsp + 0x74], r8d
007e5 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
007ed c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
007f4 448d1418                       lea        r10d, [rax + rbx]
007f8 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00800 458bf2                         mov        r14d, r10d
00803 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
0080b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00813 4183fa10                       cmp        r10d, 0x10
00817 0f8f80fbffff                   jg         0x7f4eafe69b9d
0081d 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00825 4183fb10                       cmp        r11d, 0x10
00829 0f8c6efbffff                   jl         0x7f4eafe69b9d
0082f 443bb424e0000000               cmp        r14d, dword ptr [rsp + 0xe0]
00837 0f832f0e0000                   jae        0x7f4eafe6ae6c
0083d 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00845 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0084c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00854 443b9c24e0000000               cmp        r11d, dword ptr [rsp + 0xe0]
0085c 0f8204fbffff                   jb         0x7f4eafe69b66
00862 bee4ffffff                     mov        esi, 0xffffffe4
00867 488b2c24                       mov        rbp, qword ptr [rsp]
0086b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00870 44895c2408                     mov        dword ptr [rsp + 8], r11d
00875 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0087a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0087f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00884 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00889 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0088e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00893 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00898 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0089d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008a2 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
008a7 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
008af 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008b4 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008bc 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
008c1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008c6 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
008cb c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
008d4 c5f877                         vzeroupper 
008d7 e88495b5ff                     call       0x7f4eaf9c3660
008dc 0f1f8400d4090004               nop        dword ptr [rax + rax + 0x40009d4]
008e4 453bda                         cmp        r11d, r10d
008e7 0f8eeafdffff                   jle        0x7f4eafe69ed7
008ed be45ffffff                     mov        esi, 0xffffff45
008f2 418beb                         mov        ebp, r11d
008f5 44891424                       mov        dword ptr [rsp], r10d
008f9 666690                         nop        
008fc c5f877                         vzeroupper 
008ff e85c95b5ff                     call       0x7f4eaf9c3660
00904 0f1f8400fc090005               nop        dword ptr [rax + rax + 0x50009fc]
0090c 4d63de                         movsxd     r11, r14d
0090f 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00917 0f8c8f110000                   jl         0x7f4eafe6b2ac
0091d 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
00925 0f8fdd110000                   jg         0x7f4eafe6b308
0092b 4533c0                         xor        r8d, r8d
0092e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00933 e921feffff                     jmp        0x7f4eafe69f59
00938 85c0                           test       eax, eax
0093a 7407                           je         0x7f4eafe6a143
0093c 448d52ff                       lea        r10d, [rdx - 1]
00940 418bd2                         mov        edx, r10d
00943 85d2                           test       edx, edx
00945 750e                           jne        0x7f4eafe6a155
00947 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0094f 458b5208                       mov        r10d, dword ptr [r10 + 8]
00953 eb7d                           jmp        0x7f4eafe6a1d2
00955 83fa03                         cmp        edx, 3
00958 0f8412140000                   je         0x7f4eafe6b570
0095e 83fa02                         cmp        edx, 2
00961 0f876d140000                   ja         0x7f4eafe6b5d4
00967 3b542430                       cmp        edx, dword ptr [rsp + 0x30]
0096b 0f8323130000                   jae        0x7f4eafe6b494
00971 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00979 458b549308                     mov        r10d, dword ptr [r11 + rdx*4 + 8]
0097e 85d2                           test       edx, edx
00980 7e44                           jle        0x7f4eafe6a1c6
00982 448d5aff                       lea        r11d, [rdx - 1]
00986 443b5c2430                     cmp        r11d, dword ptr [rsp + 0x30]
0098b 0f8377130000                   jae        0x7f4eafe6b508
00991 0f1f840000000000               nop        dword ptr [rax + rax]
00999 0f1f8000000000                 nop        dword ptr [rax]
009a0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
009a8 458b449004                     mov        r8d, dword ptr [r8 + rdx*4 + 4]
009ad 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
009b5 4589449108                     mov        dword ptr [r9 + rdx*4 + 8], r8d
009ba 448d5aff                       lea        r11d, [rdx - 1]
009be 418bd3                         mov        edx, r11d
009c1 4585db                         test       r11d, r11d
009c4 7fda                           jg         0x7f4eafe6a1a0
009c6 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009ce 45895308                       mov        dword ptr [r11 + 8], r10d
009d2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009da e931fdffff                     jmp        0x7f4eafe69f10
009df 4183fb10                       cmp        r11d, 0x10
009e3 0f8d03170000                   jge        0x7f4eafe6b8ec
009e9 4183fb08                       cmp        r11d, 8
009ed 0f8d36070000                   jge        0x7f4eafe6a929
009f3 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
009fb 4183fa10                       cmp        r10d, 0x10
009ff 0f8eae000000                   jle        0x7f4eafe6a2b3
00a05 4585f6                         test       r14d, r14d
00a08 0f8c56160000                   jl         0x7f4eafe6b864
00a0e 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a16 4585d2                         test       r10d, r10d
00a19 0f8c45160000                   jl         0x7f4eafe6b864
00a1f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a24 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00a2c 0f8232160000                   jb         0x7f4eafe6b864
00a32 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
00a39 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00a40 443bdb                         cmp        r11d, ebx
00a43 0f821b160000                   jb         0x7f4eafe6b864
00a49 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00a51 4585db                         test       r11d, r11d
00a54 0f8c0a160000                   jl         0x7f4eafe6b864
00a5a 4585db                         test       r11d, r11d
00a5d 0f845bf8ffff                   je         0x7f4eafe69abe
00a63 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00a68 4983fa20                       cmp        r10, 0x20
00a6c 7725                           ja         0x7f4eafe6a293
00a6e 4d63d3                         movsxd     r10, r11d
00a71 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a78 c442a8f5db                     bzhi       r11, r11, r10
00a7d c4c1fb92fb                     kmovq      k7, r11
00a82 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a88 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a8e e92bf8ffff                     jmp        0x7f4eafe69abe
00a93 498bd2                         mov        rdx, r10
00a96 c5f877                         vzeroupper 
00a99 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00aa3 41ffd2                         call       r10
00aa6 0f1f840000000000               nop        dword ptr [rax + rax]
00aae e90bf8ffff                     jmp        0x7f4eafe69abe
00ab3 443b742408                     cmp        r14d, dword ptr [rsp + 8]
00ab8 0f837a130000                   jae        0x7f4eafe6b638
00abe 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00ac6 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
00acc 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00ad4 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00ad9 0f83e5130000                   jae        0x7f4eafe6b6c4
00adf 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00ae4 41ffc3                         inc        r11d
00ae7 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00aef 458d5e03                       lea        r11d, [r14 + 3]
00af3 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00af8 0f832e140000                   jae        0x7f4eafe6b72c
00afe 4d63c6                         movsxd     r8, r14d
00b01 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00b07 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b0f 4183c203                       add        r10d, 3
00b13 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b18 0f837a140000                   jae        0x7f4eafe6b798
00b1e 4c638c249c000000               movsxd     r9, dword ptr [rsp + 0x9c]
00b26 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00b2e 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
00b33 470fbe5c020a                   movsx      r11d, byte ptr [r10 + r8 + 0xa]
00b39 47885c0a0a                     mov        byte ptr [r10 + r9 + 0xa], r11b
00b3e 470fbe5c020b                   movsx      r11d, byte ptr [r10 + r8 + 0xb]
00b44 47885c0a0b                     mov        byte ptr [r10 + r9 + 0xb], r11b
00b49 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00b51 4183fa08                       cmp        r10d, 8
00b55 0f8399140000                   jae        0x7f4eafe6b7f4
00b5b 49ba60ac28e300000000           movabs     r10, 0xe328ac60
00b65 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00b6d 4703748208                     add        r14d, dword ptr [r10 + r8*4 + 8]
00b72 4489742418                     mov        dword ptr [rsp + 0x18], r14d
00b77 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00b7f 4183fa04                       cmp        r10d, 4
00b83 7e43                           jle        0x7f4eafe6a3c8
00b85 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b8c 83c504                         add        ebp, 4
00b8f 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00b97 418bd6                         mov        edx, r14d
00b9a 6690                           nop        
00b9c c5f877                         vzeroupper 
00b9f e8bc14a9ff                     call       0x7f4eaf8fb860
00ba4 0f1f84009c0c0006               nop        dword ptr [rax + rax + 0x6000c9c]
00bac 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bb4 8bd5                           mov        edx, ebp
00bb6 8bc8                           mov        ecx, eax
00bb8 c5f877                         vzeroupper 
00bbb e8a014a9ff                     call       0x7f4eaf8fb860
00bc0 0f1f8400b80c0007               nop        dword ptr [rax + rax + 0x7000cb8]
00bc8 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00bd0 4183fa08                       cmp        r10d, 8
00bd4 7e62                           jle        0x7f4eafe6a438
00bd6 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00bda 49ba88ac28e300000000           movabs     r10, 0xe328ac88
00be4 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00bec 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00bf1 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bf8 83c508                         add        ebp, 8
00bfb 83c208                         add        edx, 8
00bfe 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c06 6690                           nop        
00c08 c5f877                         vzeroupper 
00c0b e85014a9ff                     call       0x7f4eaf8fb860
00c10 0f1f8400080d0008               nop        dword ptr [rax + rax + 0x8000d08]
00c18 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c20 8bd5                           mov        edx, ebp
00c22 488bc8                         mov        rcx, rax
00c25 666690                         nop        
00c28 c5f877                         vzeroupper 
00c2b e83014a9ff                     call       0x7f4eaf8fb860
00c30 0f1f8400280d0009               nop        dword ptr [rax + rax + 0x9000d28]
00c38 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
00c3c 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00c43 448b6c2474                     mov        r13d, dword ptr [rsp + 0x74]
00c48 e93ef9ffff                     jmp        0x7f4eafe69d8b
00c4d 83f830                         cmp        eax, 0x30
00c50 0f8e89000000                   jle        0x7f4eafe6a4df
00c56 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00c5e 4585d2                         test       r10d, r10d
00c61 0f8c91160000                   jl         0x7f4eafe6baf8
00c67 85db                           test       ebx, ebx
00c69 0f8c89160000                   jl         0x7f4eafe6baf8
00c6f 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00c73 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00c77 0f827b160000                   jb         0x7f4eafe6baf8
00c7d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00c82 453bd5                         cmp        r10d, r13d
00c85 0f826d160000                   jb         0x7f4eafe6baf8
00c8b 85c0                           test       eax, eax
00c8d 7429                           je         0x7f4eafe6a4b8
00c8f 4883fa20                       cmp        rdx, 0x20
00c93 7730                           ja         0x7f4eafe6a4c5
00c95 448bd0                         mov        r10d, eax
00c98 4d63d2                         movsxd     r10, r10d
00c9b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ca2 c442a8f5db                     bzhi       r11, r11, r10
00ca7 c4c1fb92fb                     kmovq      k7, r11
00cac 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cb2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cb8 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00cc0 e946fbffff                     jmp        0x7f4eafe6a00b
00cc5 c5f877                         vzeroupper 
00cc8 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00cd2 41ffd2                         call       r10
00cd5 0f1f840000000000               nop        dword ptr [rax + rax]
00cdd ebd9                           jmp        0x7f4eafe6a4b8
00cdf 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00ce7 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
00cef 0f83fb140000                   jae        0x7f4eafe6b9f0
00cf5 4d63c8                         movsxd     r9, r8d
00cf8 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00d00 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00d07 3b9c24e0000000                 cmp        ebx, dword ptr [rsp + 0xe0]
00d0e 0f8358150000                   jae        0x7f4eafe6ba6c
00d14 418bd0                         mov        edx, r8d
00d17 448d5b10                       lea        r11d, [rbx + 0x10]
00d1b 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d23 4c63d3                         movsxd     r10, ebx
00d26 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00d2e c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00d35 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d3d 453bc5                         cmp        r8d, r13d
00d40 0f8d18030000                   jge        0x7f4eafe6a85e
00d46 4d2bca                         sub        r9, r10
00d49 4d63d0                         movsxd     r10, r8d
00d4c 48634c243c                     movsxd     rcx, dword ptr [rsp + 0x3c]
00d51 4883c1f1                       add        rcx, -0xf
00d55 4f8d1c0a                       lea        r11, [r10 + r9]
00d59 4c3bd9                         cmp        r11, rcx
00d5c 0f831a160000                   jae        0x7f4eafe6bb7c
00d62 4963fd                         movsxd     rdi, r13d
00d65 4c8bdf                         mov        r11, rdi
00d68 4d2bda                         sub        r11, r10
00d6b 4983c30f                       add        r11, 0xf
00d6f 4983e3f0                       and        r11, 0xfffffffffffffff0
00d73 458bdb                         mov        r11d, r11d
00d76 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00d7b 4d63d2                         movsxd     r10, r10d
00d7e 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
00d83 4c3bd9                         cmp        r11, rcx
00d86 0f83f0150000                   jae        0x7f4eafe6bb7c
00d8c 443b8424e0000000               cmp        r8d, dword ptr [rsp + 0xe0]
00d94 0f83e2150000                   jae        0x7f4eafe6bb7c
00d9a 4983c2f0                       add        r10, -0x10
00d9e 4c635c2438                     movsxd     r11, dword ptr [rsp + 0x38]
00da3 4983c3f1                       add        r11, -0xf
00da7 4d3bd3                         cmp        r10, r11
00daa 0f83cc150000                   jae        0x7f4eafe6bb7c
00db0 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00db7 0f8f0f160000                   jg         0x7f4eafe6bbcc
00dbd 448bca                         mov        r9d, edx
00dc0 442bcb                         sub        r9d, ebx
00dc3 83c320                         add        ebx, 0x20
00dc6 6690                           nop        
00dc8 458bd9                         mov        r11d, r9d
00dcb 44039c2498000000               add        r11d, dword ptr [rsp + 0x98]
00dd3 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00ddb c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00de2 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00dea 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00df2 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00df9 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00e01 4183c310                       add        r11d, 0x10
00e05 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00e0d 443bdb                         cmp        r11d, ebx
00e10 7cb6                           jl         0x7f4eafe6a5c8
00e12 4881c710ffffff                 add        rdi, -0xf0
00e19 4881ff00000080                 cmp        rdi, -0x80000000
00e20 49c7c200000080                 mov        r10, 0xffffffff80000000
00e27 490f4cfa                       cmovl      rdi, r10
00e2b 448bc7                         mov        r8d, edi
00e2e 453bd8                         cmp        r11d, r8d
00e31 0f8de4010000                   jge        0x7f4eafe6a81b
00e37 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00e3f 90                             nop        
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
01015 0f8c25feffff                   jl         0x7f4eafe6a640
0101b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01023 453bdd                         cmp        r11d, r13d
01026 7d36                           jge        0x7f4eafe6a85e
01028 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01030 478d1401                       lea        r10d, [r9 + r8]
01034 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
0103c c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
01043 458bd0                         mov        r10d, r8d
01046 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0104e c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
01055 4183c010                       add        r8d, 0x10
01059 453bc5                         cmp        r8d, r13d
0105c 7cd2                           jl         0x7f4eafe6a830
0105e 03c2                           add        eax, edx
01060 89442474                       mov        dword ptr [rsp + 0x74], eax
01064 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
0106c e99af7ffff                     jmp        0x7f4eafe6a00b
01071 4d63d2                         movsxd     r10, r10d
01074 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0107b c442a8f5db                     bzhi       r11, r11, r10
01080 c4c1fb92fb                     kmovq      k7, r11
01085 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0108b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01091 eb78                           jmp        0x7f4eafe6a90b
01093 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
0109b 4585c0                         test       r8d, r8d
0109e 0f8c28110000                   jl         0x7f4eafe6b9cc
010a4 85db                           test       ebx, ebx
010a6 0f8c20110000                   jl         0x7f4eafe6b9cc
010ac 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
010b1 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
010b6 0f8210110000                   jb         0x7f4eafe6b9cc
010bc 428d2c13                       lea        ebp, [rbx + r10]
010c0 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
010c5 443bdd                         cmp        r11d, ebp
010c8 0f82fe100000                   jb         0x7f4eafe6b9cc
010ce 4585d2                         test       r10d, r10d
010d1 0f8cf5100000                   jl         0x7f4eafe6b9cc
010d7 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
010dc 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
010e4 7425                           je         0x7f4eafe6a90b
010e6 4963d2                         movsxd     rdx, r10d
010e9 4883fa20                       cmp        rdx, 0x20
010ed 0f867effffff                   jbe        0x7f4eafe6a871
010f3 c5f877                         vzeroupper 
010f6 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
01100 41ffd2                         call       r10
01103 0f1f840000000000               nop        dword ptr [rax + rax]
0110b 4c8b1424                       mov        r10, qword ptr [rsp]
0110f 41896a38                       mov        dword ptr [r10 + 0x38], ebp
01113 c5f877                         vzeroupper 
01116 4881c400010000                 add        rsp, 0x100
0111d 5d                             pop        rbp
0111e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
01122 0f87c0140000                   ja         0x7f4eafe6bde8
01128 c3                             ret        
01129 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
01131 0f83e5120000                   jae        0x7f4eafe6bc1c
01137 458bde                         mov        r11d, r14d
0113a 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01142 4d63cb                         movsxd     r9, r11d
01145 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0114d 4f8b540a08                     mov        r10, qword ptr [r10 + r9 + 8]
01152 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0115a 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01162 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
0116a 0f832c130000                   jae        0x7f4eafe6bc9c
01170 4183c308                       add        r11d, 8
01174 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01179 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0117d 8bbc249c000000                 mov        edi, dword ptr [rsp + 0x9c]
01184 4c63df                         movsxd     r11, edi
01187 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
0118f 488b8c24d0000000               mov        rcx, qword ptr [rsp + 0xd0]
01197 4b894c1808                     mov        qword ptr [r8 + r11 + 8], rcx
0119c 448d4708                       lea        r8d, [rdi + 8]
011a0 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
011a5 418502                         test       dword ptr [r10], eax
011a8 418bd8                         mov        ebx, r8d
011ab 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
011b3 0f8d7ffaffff                   jge        0x7f4eafe6a438
011b9 4d2bcb                         sub        r9, r11
011bc 486354240c                     movsxd     rdx, dword ptr [rsp + 0xc]
011c1 4883c2f9                       add        rdx, -7
011c5 4d63c0                         movsxd     r8, r8d
011c8 4f8d1408                       lea        r10, [r8 + r9]
011cc 4c3bd2                         cmp        r10, rdx
011cf 0f8327130000                   jae        0x7f4eafe6bcfc
011d5 48638c2498000000               movsxd     rcx, dword ptr [rsp + 0x98]
011dd 4c8bd1                         mov        r10, rcx
011e0 4d2bd0                         sub        r10, r8
011e3 4983c207                       add        r10, 7
011e7 4983e2f8                       and        r10, 0xfffffffffffffff8
011eb 458bd2                         mov        r10d, r10d
011ee 458d5c3a08                     lea        r11d, [r10 + rdi + 8]
011f3 4d63d3                         movsxd     r10, r11d
011f6 4f8d5c0af8                     lea        r11, [r10 + r9 - 8]
011fb 4c3bda                         cmp        r11, rdx
011fe 0f83f8120000                   jae        0x7f4eafe6bcfc
01204 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
0120b 0f83eb120000                   jae        0x7f4eafe6bcfc
01211 4983c2f8                       add        r10, -8
01215 4c3bd2                         cmp        r10, rdx
01218 0f83de120000                   jae        0x7f4eafe6bcfc
0121e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01226 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
0122d 0f8f21130000                   jg         0x7f4eafe6bd54
01233 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0123b 442bd7                         sub        r10d, edi
0123e 418bd2                         mov        edx, r10d
01241 41baf8ffffff                   mov        r10d, 0xfffffff8
01247 4c8d59c8                       lea        r11, [rcx - 0x38]
0124b 4981fb00000080                 cmp        r11, -0x80000000
01252 49c7c100000080                 mov        r9, 0xffffffff80000000
01259 4d0f4cd9                       cmovl      r11, r9
0125d 418bdb                         mov        ebx, r11d
01260 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
01268 448d5f10                       lea        r11d, [rdi + 0x10]
0126c 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01274 498bf1                         mov        rsi, r9
01277 4963c3                         movsxd     rax, r11d
0127a 458bc9                         mov        r9d, r9d
0127d 452bd1                         sub        r10d, r9d
01280 442bd7                         sub        r10d, edi
01283 4183c2f0                       add        r10d, -0x10
01287 41b906000000                   mov        r9d, 6
0128d c442b0f5d2                     bzhi       r10, r10, r9
01292 4903c2                         add        rax, r10
01295 483bc1                         cmp        rax, rcx
01298 4c8bc9                         mov        r9, rcx
0129b 4c0f4cc8                       cmovl      r9, rax
0129f 4d8bd1                         mov        r10, r9
012a2 4d2bd0                         sub        r10, r8
012a5 498d7aff                       lea        rdi, [r10 - 1]
012a9 48c1ff3f                       sar        rdi, 0x3f
012ad 48c1ef3d                       shr        rdi, 0x3d
012b1 4e8d5417ff                     lea        r10, [rdi + r10 - 1]
012b6 4983e2f8                       and        r10, 0xfffffffffffffff8
012ba 4d03d0                         add        r10, r8
012bd 4d3bc2                         cmp        r8, r10
012c0 4d0f4cc2                       cmovl      r8, r10
012c4 418bf8                         mov        edi, r8d
012c7 458d443e08                     lea        r8d, [r14 + rdi + 8]
012cc 83c708                         add        edi, 8
012cf 4963c0                         movsxd     rax, r8d
012d2 4803c6                         add        rax, rsi
012d5 4863ff                         movsxd     rdi, edi
012d8 4803fe                         add        rdi, rsi
012db 4c8d4008                       lea        r8, [rax + 8]
012df 4883c048                       add        rax, 0x48
012e3 488d7748                       lea        rsi, [rdi + 0x48]
012e7 4533d2                         xor        r10d, r10d
012ea 493bf0                         cmp        rsi, r8
012ed 410f96c2                       setbe      r10b
012f1 4883c708                       add        rdi, 8
012f5 4533c0                         xor        r8d, r8d
012f8 483bc7                         cmp        rax, rdi
012fb 410f96c0                       setbe      r8b
012ff 450bd0                         or         r10d, r8d
01302 0f845c080000                   je         0x7f4eafe6b364
01308 458bd1                         mov        r10d, r9d
0130b 90                             nop        
0130c 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01311 448bda                         mov        r11d, edx
01314 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
01319 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01321 4f8b5c1908                     mov        r11, qword ptr [r9 + r11 + 8]
01326 4f895c0108                     mov        qword ptr [r9 + r8 + 8], r11
0132b 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01330 4183c008                       add        r8d, 8
01334 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01339 453bc2                         cmp        r8d, r10d
0133c 7cce                           jl         0x7f4eafe6ab0c
0133e 4881c108feffff                 add        rcx, -0x1f8
01345 4881f900000080                 cmp        rcx, -0x80000000
0134c 49c7c200000080                 mov        r10, 0xffffffff80000000
01353 490f4cca                       cmovl      rcx, r10
01357 448bd1                         mov        r10d, ecx
0135a 453bc2                         cmp        r8d, r10d
0135d 0f8d77010000                   jge        0x7f4eafe6acda
01363 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01368 0f1f840000000000               nop        dword ptr [rax + rax]
01370 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01375 4963c8                         movsxd     rcx, r8d
01378 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0137d 448bca                         mov        r9d, edx
01380 44034c246c                     add        r9d, dword ptr [rsp + 0x6c]
01385 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0138a 4183c040                       add        r8d, 0x40
0138e 4403c2                         add        r8d, edx
01391 418bf9                         mov        edi, r9d
01394 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
0139c 62f17e486f843e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rdi + 8]
013a7 62b17e487f841e08000000         vmovdqu32  zmmword ptr [rsi + r11 + 8], zmm0
013b2 62b17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r8 + 8]
013bd 62f17e487f840e48000000         vmovdqu32  zmmword ptr [rsi + rcx + 0x48], zmm0
013c8 4963f9                         movsxd     rdi, r9d
013cb 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
013d0 4181c380000000                 add        r11d, 0x80
013d7 4403da                         add        r11d, edx
013da 62b17e486f841e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 8]
013e5 62f17e487f840e88000000         vmovdqu32  zmmword ptr [rsi + rcx + 0x88], zmm0
013f0 62f17e486f843ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + rdi + 0xc8]
013fb 62f17e487f840ec8000000         vmovdqu32  zmmword ptr [rsi + rcx + 0xc8], zmm0
01406 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
0140b 4181c100010000                 add        r9d, 0x100
01412 4403ca                         add        r9d, edx
01415 458bd9                         mov        r11d, r9d
01418 62b17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 8]
01423 62f17e487f840e08010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x108], zmm0
0142e 62f17e486f843e48010000         vmovdqu32  zmm0, zmmword ptr [rsi + rdi + 0x148]
01439 62f17e487f840e48010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x148], zmm0
01444 62f17e486f843e88010000         vmovdqu32  zmm0, zmmword ptr [rsi + rdi + 0x188]
0144f 62f17e487f840e88010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x188], zmm0
0145a 4d63db                         movsxd     r11, r11d
0145d 62b17e486f841ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xc8]
01468 62f17e487f840ec8010000         vmovdqu32  zmmword ptr [rsi + rcx + 0x1c8], zmm0
01473 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01478 4181c300020000                 add        r11d, 0x200
0147f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01484 453bda                         cmp        r11d, r10d
01487 0f8ce3feffff                   jl         0x7f4eafe6ab70
0148d 443bdb                         cmp        r11d, ebx
01490 7d48                           jge        0x7f4eafe6acda
01492 458bd3                         mov        r10d, r11d
01495 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0149a 6690                           nop        
0149c 448bda                         mov        r11d, edx
0149f 44035c246c                     add        r11d, dword ptr [rsp + 0x6c]
014a4 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
014ac 62917e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 8]
014b7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
014bc 62917e487f841a08000000         vmovdqu32  zmmword ptr [r10 + r11 + 8], zmm0
014c7 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
014cc 4183c340                       add        r11d, 0x40
014d0 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
014d5 443bdb                         cmp        r11d, ebx
014d8 7cc2                           jl         0x7f4eafe6ac9c
014da 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
014df 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
014e7 0f8d4bf7ffff                   jge        0x7f4eafe6a438
014ed 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
014f2 6690                           nop        
014f4 468d1c0a                       lea        r11d, [rdx + r9]
014f8 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01500 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01505 458bc1                         mov        r8d, r9d
01508 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01510 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01515 4183c108                       add        r9d, 8
01519 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
01521 7cd1                           jl         0x7f4eafe6acf4
01523 e910f7ffff                     jmp        0x7f4eafe6a438
01528 bee4ffffff                     mov        esi, 0xffffffe4
0152d 488b2c24                       mov        rbp, qword ptr [rsp]
01531 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01536 4489542408                     mov        dword ptr [rsp + 8], r10d
0153b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01540 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01545 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0154a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0154f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01553 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01558 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0155d 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01562 6690                           nop        
01564 c5f877                         vzeroupper 
01567 e8f488b5ff                     call       0x7f4eaf9c3660
0156c 0f1f84006416000b               nop        dword ptr [rax + rax + 0xb001664]
01574 bee4ffffff                     mov        esi, 0xffffffe4
01579 488b2c24                       mov        rbp, qword ptr [rsp]
0157d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01582 4489542408                     mov        dword ptr [rsp + 8], r10d
01587 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0158c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01591 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01596 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0159b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0159f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
015a4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
015a9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
015ae 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015b3 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
015b8 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
015bd 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
015c2 4489542460                     mov        dword ptr [rsp + 0x60], r10d
015c7 89442464                       mov        dword ptr [rsp + 0x64], eax
015cb 90                             nop        
015cc c5f877                         vzeroupper 
015cf e88c88b5ff                     call       0x7f4eaf9c3660
015d4 0f1f8400cc16000c               nop        dword ptr [rax + rax + 0xc0016cc]
015dc bee4ffffff                     mov        esi, 0xffffffe4
015e1 488b2c24                       mov        rbp, qword ptr [rsp]
015e5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015ea 4489542408                     mov        dword ptr [rsp + 8], r10d
015ef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015f4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015f9 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
015fe 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01603 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01608 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0160d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01612 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01617 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0161c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01621 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01626 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0162e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01633 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0163b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01640 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01645 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0164a 89442464                       mov        dword ptr [rsp + 0x64], eax
0164e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01652 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0165b 90                             nop        
0165c c5f877                         vzeroupper 
0165f e8fc87b5ff                     call       0x7f4eaf9c3660
01664 0f1f84005c17000d               nop        dword ptr [rax + rax + 0xd00175c]
0166c bee4ffffff                     mov        esi, 0xffffffe4
01671 488b2c24                       mov        rbp, qword ptr [rsp]
01675 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0167a 4489542408                     mov        dword ptr [rsp + 8], r10d
0167f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01684 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01689 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0168e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01693 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01698 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0169d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
016a2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
016a7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016ac 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016b1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
016b6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
016bb 4489742470                     mov        dword ptr [rsp + 0x70], r14d
016c0 c5f877                         vzeroupper 
016c3 e89887b5ff                     call       0x7f4eaf9c3660
016c8 0f1f8400c017000e               nop        dword ptr [rax + rax + 0xe0017c0]
016d0 be45ffffff                     mov        esi, 0xffffff45
016d5 488b2c24                       mov        rbp, qword ptr [rsp]
016d9 4c89542408                     mov        qword ptr [rsp + 8], r10
016de 6690                           nop        
016e0 c5f877                         vzeroupper 
016e3 e87887b5ff                     call       0x7f4eaf9c3660
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
0171b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01720 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01725 89442464                       mov        dword ptr [rsp + 0x64], eax
01729 8954246c                       mov        dword ptr [rsp + 0x6c], edx
0172d 666690                         nop        
01730 c5f877                         vzeroupper 
01733 e82887b5ff                     call       0x7f4eaf9c3660
01738 0f1f840030180010               nop        dword ptr [rax + rax + 0x10001830]
01740 493bea                         cmp        rbp, r10
01743 bdffffffff                     mov        ebp, 0xffffffff
01748 7c08                           jl         0x7f4eafe6af52
0174a 400f95c5                       setne      bpl
0174e 400fb6ed                       movzx      ebp, bpl
01752 be45ffffff                     mov        esi, 0xffffff45
01757 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0175c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01761 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01765 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0176a 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
0176f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01774 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01779 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0177d 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01782 6690                           nop        
01784 c5f877                         vzeroupper 
01787 e8d486b5ff                     call       0x7f4eaf9c3660
0178c 0f1f840084180011               nop        dword ptr [rax + rax + 0x11001884]
01794 be45ffffff                     mov        esi, 0xffffff45
01799 488b2c24                       mov        rbp, qword ptr [rsp]
0179d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
017a2 44895c2408                     mov        dword ptr [rsp + 8], r11d
017a7 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017ac 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
017b1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017b6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
017bb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017bf 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
017c4 4489442438                     mov        dword ptr [rsp + 0x38], r8d
017c9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
017ce 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
017d3 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
017d8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
017dd 89442464                       mov        dword ptr [rsp + 0x64], eax
017e1 4489542470                     mov        dword ptr [rsp + 0x70], r10d
017e6 6690                           nop        
017e8 c5f877                         vzeroupper 
017eb e87086b5ff                     call       0x7f4eaf9c3660
017f0 0f1f8400e8180012               nop        dword ptr [rax + rax + 0x120018e8]
017f8 be45ffffff                     mov        esi, 0xffffff45
017fd 488b2c24                       mov        rbp, qword ptr [rsp]
01801 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01806 44895c2408                     mov        dword ptr [rsp + 8], r11d
0180b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01810 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01815 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0181a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0181f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01823 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01828 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0182d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01832 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01837 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0183c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01841 89442464                       mov        dword ptr [rsp + 0x64], eax
01845 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0184a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0184f 90                             nop        
01850 c5f877                         vzeroupper 
01853 e80886b5ff                     call       0x7f4eaf9c3660
01858 0f1f840050190013               nop        dword ptr [rax + rax + 0x13001950]
01860 bee4ffffff                     mov        esi, 0xffffffe4
01865 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0186a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0186f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01873 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01878 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0187d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01882 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0188a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0188f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01897 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0189c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
018a4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
018a9 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
018b1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
018b6 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
018be 6690                           nop        
018c0 c5f877                         vzeroupper 
018c3 e89885b5ff                     call       0x7f4eaf9c3660
018c8 0f1f8400c0190014               nop        dword ptr [rax + rax + 0x140019c0]
018d0 bee4ffffff                     mov        esi, 0xffffffe4
018d5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018da 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018df 895c2438                       mov        dword ptr [rsp + 0x38], ebx
018e3 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
018e8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018ed 4c89542448                     mov        qword ptr [rsp + 0x48], r10
018f2 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
018fa 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
018ff 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01907 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0190c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01914 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01919 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0191e 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01923 90                             nop        
01924 c5f877                         vzeroupper 
01927 e83485b5ff                     call       0x7f4eaf9c3660
0192c 0f1f8400241a0015               nop        dword ptr [rax + rax + 0x15001a24]
01934 bebeffffff                     mov        esi, 0xffffffbe
01939 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0193e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01943 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01947 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0194c c5f877                         vzeroupper 
0194f e80c85b5ff                     call       0x7f4eaf9c3660
01954 0f1f84004c1a0016               nop        dword ptr [rax + rax + 0x16001a4c]
0195c 4533d2                         xor        r10d, r10d
0195f 4c891424                       mov        qword ptr [rsp], r10
01963 e900e8ffff                     jmp        0x7f4eafe69968
01968 4533d2                         xor        r10d, r10d
0196b 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01973 e91ae8ffff                     jmp        0x7f4eafe69992
01978 4533d2                         xor        r10d, r10d
0197b 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
01983 e939e8ffff                     jmp        0x7f4eafe699c1
01988 4533d2                         xor        r10d, r10d
0198b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01990 e953e8ffff                     jmp        0x7f4eafe699e8
01995 4533d2                         xor        r10d, r10d
01998 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
019a0 e972e8ffff                     jmp        0x7f4eafe69a17
019a5 beccffffff                     mov        esi, 0xffffffcc
019aa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019af 4489542414                     mov        dword ptr [rsp + 0x14], r10d
019b4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
019b9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019be 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019c3 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
019c8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019cd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019d2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
019da 4c89542458                     mov        qword ptr [rsp + 0x58], r10
019df 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
019e7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
019ec 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
019f4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
019f9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019fe 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01a03 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01a0b 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01a10 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01a18 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
01a1f 90                             nop        
01a20 c5f877                         vzeroupper 
01a23 e83884b5ff                     call       0x7f4eaf9c3660
01a28 0f1f8400201b0017               nop        dword ptr [rax + rax + 0x17001b20]
01a30 beccffffff                     mov        esi, 0xffffffcc
01a35 488b2c24                       mov        rbp, qword ptr [rsp]
01a39 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a3e 4489542408                     mov        dword ptr [rsp + 8], r10d
01a43 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a48 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a4d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a52 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a57 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01a5c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a61 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01a66 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a6b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a70 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a75 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a7a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01a7f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a84 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01a89 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01a91 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01a96 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01a9b 90                             nop        
01a9c c5f877                         vzeroupper 
01a9f e8bc83b5ff                     call       0x7f4eaf9c3660
01aa4 0f1f84009c1b0018               nop        dword ptr [rax + rax + 0x18001b9c]
01aac 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01ab4 4d3bd8                         cmp        r11, r8
01ab7 bdffffffff                     mov        ebp, 0xffffffff
01abc 7c08                           jl         0x7f4eafe6b2c6
01abe 400f95c5                       setne      bpl
01ac2 400fb6ed                       movzx      ebp, bpl
01ac6 be45ffffff                     mov        esi, 0xffffff45
01acb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ad0 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ad5 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01ad9 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01ade 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01ae3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ae8 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01aed 89442468                       mov        dword ptr [rsp + 0x68], eax
01af1 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01af6 6690                           nop        
01af8 c5f877                         vzeroupper 
01afb e86083b5ff                     call       0x7f4eaf9c3660
01b00 0f1f8400f81b0019               nop        dword ptr [rax + rax + 0x19001bf8]
01b08 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01b10 493beb                         cmp        rbp, r11
01b13 bdffffffff                     mov        ebp, 0xffffffff
01b18 7c08                           jl         0x7f4eafe6b322
01b1a 400f95c5                       setne      bpl
01b1e 400fb6ed                       movzx      ebp, bpl
01b22 be45ffffff                     mov        esi, 0xffffff45
01b27 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b2c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b31 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01b35 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01b3a 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01b3f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b44 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01b49 89442468                       mov        dword ptr [rsp + 0x68], eax
01b4d 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01b52 6690                           nop        
01b54 c5f877                         vzeroupper 
01b57 e80483b5ff                     call       0x7f4eaf9c3660
01b5c 0f1f8400541c001a               nop        dword ptr [rax + rax + 0x1a001c54]
01b64 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01b69 448bca                         mov        r9d, edx
01b6c 44034c246c                     add        r9d, dword ptr [rsp + 0x6c]
01b71 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01b79 4f8b440808                     mov        r8, qword ptr [r8 + r9 + 8]
01b7e 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01b86 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
01b8b 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01b90 4183c008                       add        r8d, 8
01b94 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01b99 453bc3                         cmp        r8d, r11d
01b9c 7cc6                           jl         0x7f4eafe6b364
01b9e 443bc3                         cmp        r8d, ebx
01ba1 0f8d9b000000                   jge        0x7f4eafe6b442
01ba7 458bd8                         mov        r11d, r8d
01baa 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01baf 90                             nop        
01bb0 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01bb5 4963ca                         movsxd     rcx, r10d
01bb8 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01bbd 448bca                         mov        r9d, edx
01bc0 44034c246c                     add        r9d, dword ptr [rsp + 0x6c]
01bc5 458bc1                         mov        r8d, r9d
01bc8 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01bd0 4f8b5c0b08                     mov        r11, qword ptr [r11 + r9 + 8]
01bd5 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01bdd 4f895c1108                     mov        qword ptr [r9 + r10 + 8], r11
01be2 4d63c0                         movsxd     r8, r8d
01be5 4f8b540110                     mov        r10, qword ptr [r9 + r8 + 0x10]
01bea 4d89540910                     mov        qword ptr [r9 + rcx + 0x10], r10
01bef 4f8b540118                     mov        r10, qword ptr [r9 + r8 + 0x18]
01bf4 4d89540918                     mov        qword ptr [r9 + rcx + 0x18], r10
01bf9 4f8b540120                     mov        r10, qword ptr [r9 + r8 + 0x20]
01bfe 4d89540920                     mov        qword ptr [r9 + rcx + 0x20], r10
01c03 4f8b540128                     mov        r10, qword ptr [r9 + r8 + 0x28]
01c08 4d89540928                     mov        qword ptr [r9 + rcx + 0x28], r10
01c0d 4f8b540130                     mov        r10, qword ptr [r9 + r8 + 0x30]
01c12 4d89540930                     mov        qword ptr [r9 + rcx + 0x30], r10
01c17 4f8b540138                     mov        r10, qword ptr [r9 + r8 + 0x38]
01c1c 4d89540938                     mov        qword ptr [r9 + rcx + 0x38], r10
01c21 4f8b540140                     mov        r10, qword ptr [r9 + r8 + 0x40]
01c26 4d89540940                     mov        qword ptr [r9 + rcx + 0x40], r10
01c2b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01c30 4183c240                       add        r10d, 0x40
01c34 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01c39 443bd3                         cmp        r10d, ebx
01c3c 0f8c6effffff                   jl         0x7f4eafe6b3b0
01c42 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01c47 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01c4f 0f8de3efffff                   jge        0x7f4eafe6a438
01c55 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01c5a 458bd3                         mov        r10d, r11d
01c5d 666690                         nop        
01c60 468d1c12                       lea        r11d, [rdx + r10]
01c64 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01c6c 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
01c71 458bc2                         mov        r8d, r10d
01c74 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
01c7c 4f895c0108                     mov        qword ptr [r9 + r8 + 8], r11
01c81 4183c208                       add        r10d, 8
01c85 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01c8d 7cd1                           jl         0x7f4eafe6b460
01c8f e9a4efffff                     jmp        0x7f4eafe6a438
01c94 bee4ffffff                     mov        esi, 0xffffffe4
01c99 488b2c24                       mov        rbp, qword ptr [rsp]
01c9d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ca2 4489542408                     mov        dword ptr [rsp + 8], r10d
01ca7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cb1 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cb6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cbb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01cbf 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01cc4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cc9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cce 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cd3 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01cdb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ce0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ce5 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01cea 89442464                       mov        dword ptr [rsp + 0x64], eax
01cee 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01cf5 666690                         nop        
01cf8 c5f877                         vzeroupper 
01cfb e86081b5ff                     call       0x7f4eaf9c3660
01d00 0f1f8400f81d001b               nop        dword ptr [rax + rax + 0x1b001df8]
01d08 be6effffff                     mov        esi, 0xffffff6e
01d0d 488b2c24                       mov        rbp, qword ptr [rsp]
01d11 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d16 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d1b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01d20 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d25 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d2a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d2f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d33 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01d38 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01d3d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01d42 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01d47 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01d4c 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01d51 89442464                       mov        dword ptr [rsp + 0x64], eax
01d55 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01d5a 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01d5e 6690                           nop        
01d60 c5f877                         vzeroupper 
01d63 e8f880b5ff                     call       0x7f4eaf9c3660
01d68 0f1f8400601e001c               nop        dword ptr [rax + rax + 0x1c001e60]
01d70 be45ffffff                     mov        esi, 0xffffff45
01d75 488b2c24                       mov        rbp, qword ptr [rsp]
01d79 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d7e 4489542408                     mov        dword ptr [rsp + 8], r10d
01d83 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d88 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d8d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d92 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d97 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d9b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01da0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01da5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01daa 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01daf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01db4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01db9 89442464                       mov        dword ptr [rsp + 0x64], eax
01dbd 89542478                       mov        dword ptr [rsp + 0x78], edx
01dc1 666690                         nop        
01dc4 c5f877                         vzeroupper 
01dc7 e89480b5ff                     call       0x7f4eaf9c3660
01dcc 0f1f8400c41e001d               nop        dword ptr [rax + rax + 0x1d001ec4]
01dd4 be3dffffff                     mov        esi, 0xffffff3d
01dd9 488b2c24                       mov        rbp, qword ptr [rsp]
01ddd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01de2 4489542408                     mov        dword ptr [rsp + 8], r10d
01de7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dec 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01df1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01df6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01dfb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01dff 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01e04 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e09 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e0e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e13 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e18 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e1d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e21 89542478                       mov        dword ptr [rsp + 0x78], edx
01e25 666690                         nop        
01e28 c5f877                         vzeroupper 
01e2b e83080b5ff                     call       0x7f4eaf9c3660
01e30 0f1f8400281f001e               nop        dword ptr [rax + rax + 0x1e001f28]
01e38 bee4ffffff                     mov        esi, 0xffffffe4
01e3d 488b2c24                       mov        rbp, qword ptr [rsp]
01e41 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e46 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e4b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e50 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e55 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e5a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e5f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01e64 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01e69 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e6e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e73 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e78 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e7d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e82 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01e87 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01e8f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e94 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01e9c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01ea1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ea6 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01eab 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01eb3 90                             nop        
01eb4 c5f877                         vzeroupper 
01eb7 e8a47fb5ff                     call       0x7f4eaf9c3660
01ebc 0f1f8400b41f001f               nop        dword ptr [rax + rax + 0x1f001fb4]
01ec4 bee4ffffff                     mov        esi, 0xffffffe4
01ec9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ece 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ed3 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ed8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01edd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01ee2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ee7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01eec 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ef1 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ef9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01efe 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01f06 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01f0b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f10 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01f15 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f1a 6690                           nop        
01f1c c5f877                         vzeroupper 
01f1f e83c7fb5ff                     call       0x7f4eaf9c3660
01f24 0f1f84001c200020               nop        dword ptr [rax + rax + 0x2000201c]
01f2c 418d6e01                       lea        ebp, [r14 + 1]
01f30 bee4ffffff                     mov        esi, 0xffffffe4
01f35 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f3a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f3f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01f44 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f49 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01f4e 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f53 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f58 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f5d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01f65 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01f6a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01f72 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01f77 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f7c 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01f81 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f86 6690                           nop        
01f88 c5f877                         vzeroupper 
01f8b e8d07eb5ff                     call       0x7f4eaf9c3660
01f90 0f1f840088200021               nop        dword ptr [rax + rax + 0x21002088]
01f98 bee4ffffff                     mov        esi, 0xffffffe4
01f9d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fa2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01fa7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01fac 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01fb1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01fb6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01fbb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01fc0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fc5 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01fcd 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01fd2 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01fd7 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01fdc 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01fe1 666690                         nop        
01fe4 c5f877                         vzeroupper 
01fe7 e8747eb5ff                     call       0x7f4eaf9c3660
01fec 0f1f8400e4200022               nop        dword ptr [rax + rax + 0x220020e4]
01ff4 bee4ffffff                     mov        esi, 0xffffffe4
01ff9 488b2c24                       mov        rbp, qword ptr [rsp]
01ffd 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02002 4489542408                     mov        dword ptr [rsp + 8], r10d
02007 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0200c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02011 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02016 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0201b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02020 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02025 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0202a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0202f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02034 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02039 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0203e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02043 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02048 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0204d 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02052 6690                           nop        
02054 c5f877                         vzeroupper 
02057 e8047eb5ff                     call       0x7f4eaf9c3660
0205c 0f1f840054210023               nop        dword ptr [rax + rax + 0x23002154]
02064 beccffffff                     mov        esi, 0xffffffcc
02069 488b2c24                       mov        rbp, qword ptr [rsp]
0206d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02072 44895c2408                     mov        dword ptr [rsp + 8], r11d
02077 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0207c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02081 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02086 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0208b 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02090 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02095 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0209a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0209f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
020a4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020a9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
020ae 4489542440                     mov        dword ptr [rsp + 0x40], r10d
020b3 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
020bb 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020c0 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
020c8 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
020cd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020d2 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
020d7 4489742474                     mov        dword ptr [rsp + 0x74], r14d
020dc c5f877                         vzeroupper 
020df e87c7db5ff                     call       0x7f4eaf9c3660
020e4 0f1f8400dc210024               nop        dword ptr [rax + rax + 0x240021dc]
020ec be45ffffff                     mov        esi, 0xffffff45
020f1 488b2c24                       mov        rbp, qword ptr [rsp]
020f5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020fa 4489542408                     mov        dword ptr [rsp + 8], r10d
020ff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02104 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02109 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0210e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02113 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02118 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0211d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02122 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02127 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0212c c5f877                         vzeroupper 
0212f e82c7db5ff                     call       0x7f4eaf9c3660
02134 0f1f84002c220025               nop        dword ptr [rax + rax + 0x2500222c]
0213c be85ffffff                     mov        esi, 0xffffff85
02141 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02146 44891424                       mov        dword ptr [rsp], r10d
0214a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0214f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02154 895c2408                       mov        dword ptr [rsp + 8], ebx
02158 44896c240c                     mov        dword ptr [rsp + 0xc], r13d
0215d 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02162 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02167 4489742444                     mov        dword ptr [rsp + 0x44], r14d
0216c c5f877                         vzeroupper 
0216f e8ec7cb5ff                     call       0x7f4eaf9c3660
02174 0f1f84006c220026               nop        dword ptr [rax + rax + 0x2600226c]
0217c 4533d2                         xor        r10d, r10d
0217f 4c89542470                     mov        qword ptr [rsp + 0x70], r10
02184 eb0d                           jmp        0x7f4eafe6b993
02186 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
0218e 4c89542470                     mov        qword ptr [rsp + 0x70], r10
02193 be6effffff                     mov        esi, 0xffffff6e
02198 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0219d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
021a2 895c2430                       mov        dword ptr [rsp + 0x30], ebx
021a6 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
021ab 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
021b0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
021b5 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
021ba 6690                           nop        
021bc c5f877                         vzeroupper 
021bf e89c7cb5ff                     call       0x7f4eaf9c3660
021c4 0f1f8400bc220027               nop        dword ptr [rax + rax + 0x270022bc]
021cc beccffffff                     mov        esi, 0xffffffcc
021d1 488b2c24                       mov        rbp, qword ptr [rsp]
021d5 895c2414                       mov        dword ptr [rsp + 0x14], ebx
021d9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
021de 6690                           nop        
021e0 c5f877                         vzeroupper 
021e3 e8787cb5ff                     call       0x7f4eaf9c3660
021e8 0f1f8400e0220028               nop        dword ptr [rax + rax + 0x280022e0]
021f0 bee4ffffff                     mov        esi, 0xffffffe4
021f5 488b2c24                       mov        rbp, qword ptr [rsp]
021f9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021fe 4489542408                     mov        dword ptr [rsp + 8], r10d
02203 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02208 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0220d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02212 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02217 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0221c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02221 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02226 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0222b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02230 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02235 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0223d 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02242 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02247 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0224c 89442460                       mov        dword ptr [rsp + 0x60], eax
02250 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02255 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02259 666690                         nop        
0225c c5f877                         vzeroupper 
0225f e8fc7bb5ff                     call       0x7f4eaf9c3660
02264 0f1f84005c230029               nop        dword ptr [rax + rax + 0x2900235c]
0226c c5fa7f8424d0000000             vmovdqu    xmmword ptr [rsp + 0xd0], xmm0
02275 bee4ffffff                     mov        esi, 0xffffffe4
0227a 488b2c24                       mov        rbp, qword ptr [rsp]
0227e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02283 44895c2408                     mov        dword ptr [rsp + 8], r11d
02288 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0228d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02292 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02297 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0229c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
022a1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
022a6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022ab 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022b0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022b5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
022ba 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
022c2 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
022c7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022cc 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
022d1 89442460                       mov        dword ptr [rsp + 0x60], eax
022d5 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
022da 4489442474                     mov        dword ptr [rsp + 0x74], r8d
022df 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
022e6 6690                           nop        
022e8 c5f877                         vzeroupper 
022eb e8707bb5ff                     call       0x7f4eaf9c3660
022f0 0f1f8400e823002a               nop        dword ptr [rax + rax + 0x2a0023e8]
022f8 beccffffff                     mov        esi, 0xffffffcc
022fd 488b2c24                       mov        rbp, qword ptr [rsp]
02301 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02306 44895c2408                     mov        dword ptr [rsp + 8], r11d
0230b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02310 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02315 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0231a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0231f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02324 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02329 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0232e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02333 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02338 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0233d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02345 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0234a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02352 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02357 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0235c 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02361 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02365 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0236c c5f877                         vzeroupper 
0236f e8ec7ab5ff                     call       0x7f4eaf9c3660
02374 0f1f84006c24002b               nop        dword ptr [rax + rax + 0x2b00246c]
0237c 8bea                           mov        ebp, edx
0237e 83c510                         add        ebp, 0x10
02381 be6effffff                     mov        esi, 0xffffff6e
02386 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0238b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02390 89542438                       mov        dword ptr [rsp + 0x38], edx
02394 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02399 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0239e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023a3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023a8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023ad 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
023b2 89442468                       mov        dword ptr [rsp + 0x68], eax
023b6 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
023bb 90                             nop        
023bc c5f877                         vzeroupper 
023bf e89c7ab5ff                     call       0x7f4eaf9c3660
023c4 0f1f8400bc24002c               nop        dword ptr [rax + rax + 0x2c0024bc]
023cc 8bea                           mov        ebp, edx
023ce 83c510                         add        ebp, 0x10
023d1 be66ffffff                     mov        esi, 0xffffff66
023d6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
023db 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
023e0 89542438                       mov        dword ptr [rsp + 0x38], edx
023e4 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
023e9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
023ee 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
023f3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023f8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023fd 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02402 89442468                       mov        dword ptr [rsp + 0x68], eax
02406 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0240b 90                             nop        
0240c c5f877                         vzeroupper 
0240f e84c7ab5ff                     call       0x7f4eaf9c3660
02414 0f1f84000c25002d               nop        dword ptr [rax + rax + 0x2d00250c]
0241c bee4ffffff                     mov        esi, 0xffffffe4
02421 488b2c24                       mov        rbp, qword ptr [rsp]
02425 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0242a 4489542408                     mov        dword ptr [rsp + 8], r10d
0242f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02434 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02439 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0243e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02443 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02448 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0244d 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02452 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02457 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0245c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02461 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02466 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0246b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02473 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02478 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0247d 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02482 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
0248a 6690                           nop        
0248c c5f877                         vzeroupper 
0248f e8cc79b5ff                     call       0x7f4eaf9c3660
02494 0f1f84008c25002e               nop        dword ptr [rax + rax + 0x2e00258c]
0249c bee4ffffff                     mov        esi, 0xffffffe4
024a1 488b2c24                       mov        rbp, qword ptr [rsp]
024a5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
024aa 44895c2408                     mov        dword ptr [rsp + 8], r11d
024af 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024b4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024b9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024be 448954240c                     mov        dword ptr [rsp + 0xc], r10d
024c3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
024c8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
024cd 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
024d2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
024d7 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
024dc 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
024e1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
024e6 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
024eb 90                             nop        
024ec c5f877                         vzeroupper 
024ef e86c79b5ff                     call       0x7f4eaf9c3660
024f4 0f1f8400ec25002f               nop        dword ptr [rax + rax + 0x2f0025ec]
024fc be6effffff                     mov        esi, 0xffffff6e
02501 488b2c24                       mov        rbp, qword ptr [rsp]
02505 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0250a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0250f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02514 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02519 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0251e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02523 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02528 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0252d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02532 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02537 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0253f 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02544 c5f877                         vzeroupper 
02547 e81479b5ff                     call       0x7f4eaf9c3660
0254c 0f1f840044260030               nop        dword ptr [rax + rax + 0x30002644]
02554 be66ffffff                     mov        esi, 0xffffff66
02559 488b2c24                       mov        rbp, qword ptr [rsp]
0255d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02562 44895c2408                     mov        dword ptr [rsp + 8], r11d
02567 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0256c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02571 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02576 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0257b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02580 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02585 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0258a 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0258f 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
02597 458bda                         mov        r11d, r10d
0259a 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0259f 90                             nop        
025a0 c5f877                         vzeroupper 
025a3 e8b878b5ff                     call       0x7f4eaf9c3660
025a8 0f1f8400a0260031               nop        dword ptr [rax + rax + 0x310026a0]
025b0 488bf0                         mov        rsi, rax
025b3 eb0d                           jmp        0x7f4eafe6bdc2
025b5 488bf0                         mov        rsi, rax
025b8 eb08                           jmp        0x7f4eafe6bdc2
025ba 488bf0                         mov        rsi, rax
025bd eb03                           jmp        0x7f4eafe6bdc2
025bf 488bf0                         mov        rsi, rax
025c2 c5f877                         vzeroupper 
025c5 4881c400010000                 add        rsp, 0x100
025cc 5d                             pop        rbp
025cd e98ea4b5ff                     jmp        0x7f4eaf9c6260
025d2 bef6ffffff                     mov        esi, 0xfffffff6
025d7 90                             nop        
025d8 c5f877                         vzeroupper 
025db e88078b5ff                     call       0x7f4eaf9c3660
025e0 0f1f8400d8260032               nop        dword ptr [rax + rax + 0x320026d8]
025e8 49ba1ea9e6af4e7f0000           movabs     r10, 0x7f4eafe6a91e
025f2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
025f9 e9e220a9ff                     jmp        0x7f4eaf8fdee0
025fe e89deca7ff                     call       0x7f4eaf8eaaa0
02603 e926daffff                     jmp        0x7f4eafe6982e
