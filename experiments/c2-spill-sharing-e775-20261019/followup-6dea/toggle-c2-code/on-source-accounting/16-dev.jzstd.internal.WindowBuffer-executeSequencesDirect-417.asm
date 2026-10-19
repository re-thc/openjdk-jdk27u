00000 e83b817e18                     call       0x7f17b86586c0
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85f4360000                   jne        0x7f179fe73ca2
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00046 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0004f 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00056 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0005b 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00062 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00067 488bae08010000                 mov        rbp, qword ptr [rsi + 0x108]
0006e 4c8bae00010000                 mov        r13, qword ptr [rsi + 0x100]
00075 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
0007c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00081 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
00088 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0008d 448b96f8000000                 mov        r10d, dword ptr [rsi + 0xf8]
00094 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0009c 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000a3 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
000a8 8b9ee8000000                   mov        ebx, dword ptr [rsi + 0xe8]
000ae 895c2440                       mov        dword ptr [rsp + 0x40], ebx
000b2 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b9 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
000c1 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000c8 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
000d0 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000d7 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
000df 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
000e2 899c24a4000000                 mov        dword ptr [rsp + 0xa4], ebx
000e9 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
000ec 899c24c0000000                 mov        dword ptr [rsp + 0xc0], ebx
000f3 8b9ea0000000                   mov        ebx, dword ptr [rsi + 0xa0]
000f9 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
000fd 488bfe                         mov        rdi, rsi
00100 c5f877                         vzeroupper 
00103 49ba00ee73b8177f0000           movabs     r10, 0x7f17b873ee00
0010d 41ffd2                         call       r10
00110 0f1f840000000000               nop        dword ptr [rax + rax]
00118 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0011d 4d85d2                         test       r10, r10
00120 0f84321f0000                   je         0x7f179fe725d8
00126 458b1a                         mov        r11d, dword ptr [r10]
00129 41c1eb0d                       shr        r11d, 0xd
0012d 4181fb15410000                 cmp        r11d, 0x4115
00134 0f85ea2a0000                   jne        0x7f179fe731a4
0013a 498bda                         mov        rbx, r10
0013d 48895c2408                     mov        qword ptr [rsp + 8], rbx
00142 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00147 4d85d2                         test       r10, r10
0014a 0f84151f0000                   je         0x7f179fe725e5
00150 458b12                         mov        r10d, dword ptr [r10]
00153 41c1ea0d                       shr        r10d, 0xd
00157 4181fadd050000                 cmp        r10d, 0x5dd
0015e 0f85c02a0000                   jne        0x7f179fe731a4
00164 488b5c2450                     mov        rbx, qword ptr [rsp + 0x50]
00169 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
00171 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00176 4d85d2                         test       r10, r10
00179 0f84f61e0000                   je         0x7f179fe725f5
0017f 458b1a                         mov        r11d, dword ptr [r10]
00182 41c1eb0d                       shr        r11d, 0xd
00186 4181fbe0050000                 cmp        r11d, 0x5e0
0018d 0f85912a0000                   jne        0x7f179fe731a4
00193 498bda                         mov        rbx, r10
00196 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0019e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a3 4d85d2                         test       r10, r10
001a6 0f84d91e0000                   je         0x7f179fe72605
001ac 458b12                         mov        r10d, dword ptr [r10]
001af 41c1ea0d                       shr        r10d, 0xd
001b3 4181fadf050000                 cmp        r10d, 0x5df
001ba 0f85642a0000                   jne        0x7f179fe731a4
001c0 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
001c5 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
001ca 4885ed                         test       rbp, rbp
001cd 0f84bf1e0000                   je         0x7f179fe72612
001d3 448b5d00                       mov        r11d, dword ptr [rbp]
001d7 41c1eb0d                       shr        r11d, 0xd
001db 4181fbdf050000                 cmp        r11d, 0x5df
001e2 0f853c2a0000                   jne        0x7f179fe731a4
001e8 488bdd                         mov        rbx, rbp
001eb 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
001f3 4d85ed                         test       r13, r13
001f6 0f84a61e0000                   je         0x7f179fe72622
001fc 458b5500                       mov        r10d, dword ptr [r13]
00200 41c1ea0d                       shr        r10d, 0xd
00204 4181fadd050000                 cmp        r10d, 0x5dd
0020b 0f85132a0000                   jne        0x7f179fe731a4
00211 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00219 e9e8040000                     jmp        0x7f179fe70c86
0021e 448bdd                         mov        r11d, ebp
00221 4d63d3                         movsxd     r10, r11d
00224 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0022b c442a8f5db                     bzhi       r11, r11, r10
00230 c4c1fb92fb                     kmovq      k7, r11
00235 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0023b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00241 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00249 4403dd                         add        r11d, ebp
0024c 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00254 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00258 418502                         test       dword ptr [r10], eax
0025b 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00263 0f8d6c080000                   jge        0x7f179fe71055
00269 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
0026e 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00273 442b9c24a0000000               sub        r11d, dword ptr [rsp + 0xa0]
0027b 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00283 8bac2480000000                 mov        ebp, dword ptr [rsp + 0x80]
0028a 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
00291 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
00298 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
002a0 410f4fed                       cmovg      ebp, r13d
002a4 4585db                         test       r11d, r11d
002a7 0f8c77250000                   jl         0x7f179fe72da4
002ad 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002b2 4585d2                         test       r10d, r10d
002b5 0f8c69250000                   jl         0x7f179fe72da4
002bb 458d142b                       lea        r10d, [r11 + rbp]
002bf 413bda                         cmp        ebx, r10d
002c2 0f825c250000                   jb         0x7f179fe72da4
002c8 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
002cd 4403ed                         add        r13d, ebp
002d0 413bdd                         cmp        ebx, r13d
002d3 0f824b250000                   jb         0x7f179fe72da4
002d9 85ed                           test       ebp, ebp
002db 0f8c43250000                   jl         0x7f179fe72da4
002e1 85ed                           test       ebp, ebp
002e3 0f8458ffffff                   je         0x7f179fe707c1
002e9 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
002ee 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
002f6 4b8d740208                     lea        rsi, [r10 + r8 + 8]
002fb 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00300 4863d5                         movsxd     rdx, ebp
00303 4883fa20                       cmp        rdx, 0x20
00307 0f8611ffffff                   jbe        0x7f179fe7079e
0030d c5f877                         vzeroupper 
00310 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
0031a 41ffd2                         call       r10
0031d 0f1f840000000000               nop        dword ptr [rax + rax]
00325 e917ffffff                     jmp        0x7f179fe707c1
0032a 48894424f8                     mov        qword ptr [rsp - 8], rax
0032f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
00333 89442448                       mov        dword ptr [rsp + 0x48], eax
00337 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0033c 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00344 4585db                         test       r11d, r11d
00347 0f8ed3160000                   jle        0x7f179fe71fa0
0034d 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00355 4403db                         add        r11d, ebx
00358 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00360 0f8fd6170000                   jg         0x7f179fe720bc
00366 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0036b 4503d6                         add        r10d, r14d
0036e 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00376 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
0037e 0f8f40180000                   jg         0x7f179fe72144
00384 4183fe10                       cmp        r14d, 0x10
00388 0f8fee070000                   jg         0x7f179fe710fc
0038e 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00396 448b5b04                       mov        r11d, dword ptr [rbx + 4]
0039a 458d43f1                       lea        r8d, [r11 - 0xf]
0039e 4585c0                         test       r8d, r8d
003a1 0f8cc1120000                   jl         0x7f179fe71be8
003a7 4183c3f1                       add        r11d, -0xf
003ab 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
003b0 453bd3                         cmp        r10d, r11d
003b3 0f8353110000                   jae        0x7f179fe71a8c
003b9 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
003c1 448b5304                       mov        r10d, dword ptr [rbx + 4]
003c5 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
003c9 4c8bac24c8000000               mov        r13, qword ptr [rsp + 0xc8]
003d1 c4c17a6f441d08                 vmovdqu    xmm0, xmmword ptr [r13 + rbx + 8]
003d8 458d42f1                       lea        r8d, [r10 - 0xf]
003dc 4585c0                         test       r8d, r8d
003df 0f8c1f130000                   jl         0x7f179fe71c84
003e5 4183c2f1                       add        r10d, -0xf
003e9 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
003f1 453bc2                         cmp        r8d, r10d
003f4 0f83ae110000                   jae        0x7f179fe71b28
003fa 458d2c1e                       lea        r13d, [r14 + rbx]
003fe 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
00406 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0040e 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
00416 c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
0041d 4503f2                         add        r14d, r10d
00420 458bee                         mov        r13d, r14d
00423 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
0042b 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00433 418b5804                       mov        ebx, dword ptr [r8 + 4]
00437 448d53f1                       lea        r10d, [rbx - 0xf]
0043b 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00443 4183f910                       cmp        r9d, 0x10
00447 7f49                           jg         0x7f179fe70a12
00449 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00451 4183f910                       cmp        r9d, 0x10
00455 7c3b                           jl         0x7f179fe70a12
00457 4585d2                         test       r10d, r10d
0045a 0f8c30150000                   jl         0x7f179fe71f10
00460 83c3f1                         add        ebx, -0xf
00463 443beb                         cmp        r13d, ebx
00466 0f83f0130000                   jae        0x7f179fe71ddc
0046c c4817a6f442808                 vmovdqu    xmm0, xmmword ptr [r8 + r13 + 8]
00473 443bf3                         cmp        r14d, ebx
00476 0f836c140000                   jae        0x7f179fe71e68
0047c c4817a7f443008                 vmovdqu    xmmword ptr [r8 + r14 + 8], xmm0
00483 8b9c2480000000                 mov        ebx, dword ptr [rsp + 0x80]
0048a 4103de                         add        ebx, r14d
0048d e944020000                     jmp        0x7f179fe70c56
00492 448d5bf9                       lea        r11d, [rbx - 7]
00496 4b8d7c2808                     lea        rdi, [r8 + r13 + 8]
0049b 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
004a3 4503ce                         add        r9d, r14d
004a6 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
004ae 4b8d743008                     lea        rsi, [r8 + r14 + 8]
004b3 4963d1                         movsxd     rdx, r9d
004b6 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
004bd 3b8c2480000000                 cmp        ecx, dword ptr [rsp + 0x80]
004c4 0f8c75040000                   jl         0x7f179fe70ebf
004ca 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
004d2 4183f930                       cmp        r9d, 0x30
004d6 0f8e85000000                   jle        0x7f179fe70ae1
004dc 4585ed                         test       r13d, r13d
004df 0f8ccd1b0000                   jl         0x7f179fe72632
004e5 4585f6                         test       r14d, r14d
004e8 0f8cc41b0000                   jl         0x7f179fe72632
004ee 478d1c29                       lea        r11d, [r9 + r13]
004f2 413bdb                         cmp        ebx, r11d
004f5 0f82b71b0000                   jb         0x7f179fe72632
004fb 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
00502 0f82aa1b0000                   jb         0x7f179fe72632
00508 418bd9                         mov        ebx, r9d
0050b 85db                           test       ebx, ebx
0050d 0f84b8010000                   je         0x7f179fe70c4b
00513 4863d3                         movsxd     rdx, ebx
00516 4883fa20                       cmp        rdx, 0x20
0051a 7728                           ja         0x7f179fe70ac4
0051c 448bd3                         mov        r10d, ebx
0051f 4d63d2                         movsxd     r10, r10d
00522 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00529 c442a8f5db                     bzhi       r11, r11, r10
0052e c4c1fb92fb                     kmovq      k7, r11
00533 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00539 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0053f e987010000                     jmp        0x7f179fe70c4b
00544 c5f877                         vzeroupper 
00547 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
00551 41ffd2                         call       r10
00554 0f1f840000000000               nop        dword ptr [rax + rax]
0055c e96a010000                     jmp        0x7f179fe70c4b
00561 4585db                         test       r11d, r11d
00564 0f8c0e190000                   jl         0x7f179fe723f8
0056a 448d53f9                       lea        r10d, [rbx - 7]
0056e 453bea                         cmp        r13d, r10d
00571 0f83c1170000                   jae        0x7f179fe722b8
00577 4963fd                         movsxd     rdi, r13d
0057a 498b4c3808                     mov        rcx, qword ptr [r8 + rdi + 8]
0057f 453bf2                         cmp        r14d, r10d
00582 0f8350180000                   jae        0x7f179fe72358
00588 458bce                         mov        r9d, r14d
0058b 458d5908                       lea        r11d, [r9 + 8]
0058f 4963f1                         movsxd     rsi, r9d
00592 49894c3008                     mov        qword ptr [r8 + rsi + 8], rcx
00597 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0059f 0f8d26010000                   jge        0x7f179fe70c4b
005a5 482bfe                         sub        rdi, rsi
005a8 4863f3                         movsxd     rsi, ebx
005ab 4883c6f9                       add        rsi, -7
005af 4963db                         movsxd     rbx, r11d
005b2 488d0c3b                       lea        rcx, [rbx + rdi]
005b6 483bce                         cmp        rcx, rsi
005b9 0f8359190000                   jae        0x7f179fe72498
005bf 488bca                         mov        rcx, rdx
005c2 482bcb                         sub        rcx, rbx
005c5 4883c107                       add        rcx, 7
005c9 4883e1f8                       and        rcx, 0xfffffffffffffff8
005cd 8bc9                           mov        ecx, ecx
005cf 428d5c0908                     lea        ebx, [rcx + r9 + 8]
005d4 4863cb                         movsxd     rcx, ebx
005d7 488d5c39f8                     lea        rbx, [rcx + rdi - 8]
005dc 483bde                         cmp        rbx, rsi
005df 0f8333190000                   jae        0x7f179fe72498
005e5 453bda                         cmp        r11d, r10d
005e8 0f832a190000                   jae        0x7f179fe72498
005ee 4883c1f8                       add        rcx, -8
005f2 483bce                         cmp        rcx, rsi
005f5 0f831d190000                   jae        0x7f179fe72498
005fb 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00602 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00608 0f8fb2190000                   jg         0x7f179fe72540
0060e 452be9                         sub        r13d, r9d
00611 4183c110                       add        r9d, 0x10
00615 458bd3                         mov        r10d, r11d
00618 438d0c2b                       lea        ecx, [r11 + r13]
0061c 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
00624 4c8b440b08                     mov        r8, qword ptr [rbx + rcx + 8]
00629 4e89441308                     mov        qword ptr [rbx + r10 + 8], r8
0062e 4183c308                       add        r11d, 8
00632 453bd9                         cmp        r11d, r9d
00635 7cde                           jl         0x7f179fe70b95
00637 4883c2f8                       add        rdx, -8
0063b 4881fa00000080                 cmp        rdx, -0x80000000
00642 49c7c200000080                 mov        r10, 0xffffffff80000000
00649 490f4cd2                       cmovl      rdx, r10
0064d 448bd2                         mov        r10d, edx
00650 453bda                         cmp        r11d, r10d
00653 7d43                           jge        0x7f179fe70c18
00655 6666660f1f840000000000         nop        word ptr [rax + rax]
00660 458bc3                         mov        r8d, r11d
00663 4963d8                         movsxd     rbx, r8d
00666 458bc3                         mov        r8d, r11d
00669 478d0c2b                       lea        r9d, [r11 + r13]
0066d 418bc9                         mov        ecx, r9d
00670 488bbc24e0000000               mov        rdi, qword ptr [rsp + 0xe0]
00678 4e8b4c0f08                     mov        r9, qword ptr [rdi + r9 + 8]
0067d 4e894c0708                     mov        qword ptr [rdi + r8 + 8], r9
00682 4c63c1                         movsxd     r8, ecx
00685 4e8b440710                     mov        r8, qword ptr [rdi + r8 + 0x10]
0068a 4c89441f10                     mov        qword ptr [rdi + rbx + 0x10], r8
0068f 4183c310                       add        r11d, 0x10
00693 453bda                         cmp        r11d, r10d
00696 7cc8                           jl         0x7f179fe70be0
00698 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
006a0 7d29                           jge        0x7f179fe70c4b
006a2 6690                           nop        
006a4 478d142b                       lea        r10d, [r11 + r13]
006a8 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
006b0 4e8b541308                     mov        r10, qword ptr [rbx + r10 + 8]
006b5 458bc3                         mov        r8d, r11d
006b8 4e89540308                     mov        qword ptr [rbx + r8 + 8], r10
006bd 4183c308                       add        r11d, 8
006c1 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
006c9 7cd9                           jl         0x7f179fe70c24
006cb 4403b42480000000               add        r14d, dword ptr [rsp + 0x80]
006d3 418bde                         mov        ebx, r14d
006d6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
006db 41ffc2                         inc        r10d
006de 4489542470                     mov        dword ptr [rsp + 0x70], r10d
006e3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006e7 418502                         test       dword ptr [r10], eax
006ea 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
006f1 48894424f8                     mov        qword ptr [rsp - 8], rax
006f6 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
006fd 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00701 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00706 4c6344247c                     movsxd     r8, dword ptr [rsp + 0x7c]
0070b 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
00713 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00718 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
0071d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00722 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00727 0f8da9060000                   jge        0x7f179fe71356
0072d 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00735 8b4b04                         mov        ecx, dword ptr [rbx + 4]
00738 443bd9                         cmp        r11d, ecx
0073b 0f835e0d0000                   jae        0x7f179fe71a1f
00741 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00749 4a8b4cdb08                     mov        rcx, qword ptr [rbx + r11*8 + 8]
0074e 448bf1                         mov        r14d, ecx
00751 4181e6ffff0100                 and        r14d, 0x1ffff
00758 4c8bd9                         mov        r11, rcx
0075b 49c1fb24                       sar        r11, 0x24
0075f 48c1e912                       shr        rcx, 0x12
00763 458bdb                         mov        r11d, r11d
00766 418bfb                         mov        edi, r11d
00769 8bd9                           mov        ebx, ecx
0076b 81e3ffff0300                   and        ebx, 0x3ffff
00771 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
00778 4585db                         test       r11d, r11d
0077b 0f8cbf120000                   jl         0x7f179fe71fc0
00781 4585f6                         test       r14d, r14d
00784 0f85ce000000                   jne        0x7f179fe70dd8
0078a 4533f6                         xor        r14d, r14d
0078d 4183fb03                       cmp        r11d, 3
00791 0f8ee9000000                   jle        0x7f179fe70e00
00797 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
0079f 448b5304                       mov        r10d, dword ptr [rbx + 4]
007a3 4183c3fd                       add        r11d, -3
007a7 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
007af 4183fa02                       cmp        r10d, 2
007b3 0f860b100000                   jbe        0x7f179fe71d44
007b9 448b530c                       mov        r10d, dword ptr [rbx + 0xc]
007bd 44895310                       mov        dword ptr [rbx + 0x10], r10d
007c1 448b5b08                       mov        r11d, dword ptr [rbx + 8]
007c5 44895b0c                       mov        dword ptr [rbx + 0xc], r11d
007c9 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
007d1 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
007d8 41895d08                       mov        dword ptr [r13 + 8], ebx
007dc 4c639424a0000000               movsxd     r10, dword ptr [rsp + 0xa0]
007e4 4c891424                       mov        qword ptr [rsp], r10
007e8 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
007f0 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
007f8 4963d6                         movsxd     rdx, r14d
007fb 4c03d2                         add        r10, rdx
007fe 488b3c24                       mov        rdi, qword ptr [rsp]
00802 493bfa                         cmp        rdi, r10
00805 0f8fad120000                   jg         0x7f179fe72038
0080b 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00812 4103de                         add        ebx, r14d
00815 448beb                         mov        r13d, ebx
00818 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
00820 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
00824 85c9                           test       ecx, ecx
00826 0f85fefaffff                   jne        0x7f179fe708aa
0082c 4d63dd                         movsxd     r11, r13d
0082f 4c3b9c24b0000000               cmp        r11, qword ptr [rsp + 0xb0]
00837 0f8c0b140000                   jl         0x7f179fe721c8
0083d 483bbc24b8000000               cmp        rdi, qword ptr [rsp + 0xb8]
00845 0f8f75140000                   jg         0x7f179fe72240
0084b 4533db                         xor        r11d, r11d
0084e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00853 e9e4faffff                     jmp        0x7f179fe708bc
00858 453bf2                         cmp        r14d, r10d
0085b 0f8e2cffffff                   jle        0x7f179fe70d0d
00861 be45ffffff                     mov        esi, 0xffffff45
00866 418bee                         mov        ebp, r14d
00869 44891424                       mov        dword ptr [rsp], r10d
0086d 666690                         nop        
00870 c5f877                         vzeroupper 
00873 e86828b5ff                     call       0x7f179f9c3660
00878 0f1f840070090002               nop        dword ptr [rax + rax + 0x2000970]
00880 4585f6                         test       r14d, r14d
00883 7407                           je         0x7f179fe70e0c
00885 458d53ff                       lea        r10d, [r11 - 1]
00889 418bfa                         mov        edi, r10d
0088c 85ff                           test       edi, edi
0088e 751d                           jne        0x7f179fe70e2d
00890 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
00898 448b5304                       mov        r10d, dword ptr [rbx + 4]
0089c 4585d2                         test       r10d, r10d
0089f 0f86eb1a0000                   jbe        0x7f179fe72910
008a5 8b5b08                         mov        ebx, dword ptr [rbx + 8]
008a8 e986000000                     jmp        0x7f179fe70eb3
008ad 83ff03                         cmp        edi, 3
008b0 0f847e200000                   je         0x7f179fe72eb4
008b6 83ff02                         cmp        edi, 2
008b9 0f87fd200000                   ja         0x7f179fe72f3c
008bf 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
008c7 448b5b04                       mov        r11d, dword ptr [rbx + 4]
008cb 413bfb                         cmp        edi, r11d
008ce 0f8383190000                   jae        0x7f179fe727d7
008d4 8b5cbb08                       mov        ebx, dword ptr [rbx + rdi*4 + 8]
008d8 85ff                           test       edi, edi
008da 7e42                           jle        0x7f179fe70e9e
008dc 4585db                         test       r11d, r11d
008df 0f86af1f0000                   jbe        0x7f179fe72e14
008e5 448d57ff                       lea        r10d, [rdi - 1]
008e9 453bd3                         cmp        r10d, r11d
008ec 0f83a21f0000                   jae        0x7f179fe72e14
008f2 4183fb01                       cmp        r11d, 1
008f6 0f86981f0000                   jbe        0x7f179fe72e14
008fc 0f1f4000                       nop        dword ptr [rax]
00900 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
00908 458b54bd04                     mov        r10d, dword ptr [r13 + rdi*4 + 4]
0090d 458954bd08                     mov        dword ptr [r13 + rdi*4 + 8], r10d
00912 448d57ff                       lea        r10d, [rdi - 1]
00916 418bfa                         mov        edi, r10d
00919 4585d2                         test       r10d, r10d
0091c 7fe2                           jg         0x7f179fe70e80
0091e 4585db                         test       r11d, r11d
00921 0f86e1190000                   jbe        0x7f179fe72888
00927 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
0092f 41895d08                       mov        dword ptr [r13 + 8], ebx
00933 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
0093a e99dfeffff                     jmp        0x7f179fe70d5c
0093f 83f910                         cmp        ecx, 0x10
00942 0f8ddb080000                   jge        0x7f179fe717a3
00948 83f908                         cmp        ecx, 8
0094b 0f8d86050000                   jge        0x7f179fe71457
00951 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00959 4183f910                       cmp        r9d, 0x10
0095d 0f8f7e010000                   jg         0x7f179fe71061
00963 443beb                         cmp        r13d, ebx
00966 0f83981a0000                   jae        0x7f179fe72984
0096c 430fbe6c2808                   movsx      ebp, byte ptr [r8 + r13 + 8]
00972 443bf3                         cmp        r14d, ebx
00975 0f831d1b0000                   jae        0x7f179fe72a18
0097b 43886c3008                     mov        byte ptr [r8 + r14 + 8], bpl
00980 458d4e01                       lea        r9d, [r14 + 1]
00984 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
0098c 458d5503                       lea        r10d, [r13 + 3]
00990 443bd3                         cmp        r10d, ebx
00993 0f83671b0000                   jae        0x7f179fe72a80
00999 4d63cd                         movsxd     r9, r13d
0099c 430fbe6c0809                   movsx      ebp, byte ptr [r8 + r9 + 9]
009a2 458d5603                       lea        r10d, [r14 + 3]
009a6 443bd3                         cmp        r10d, ebx
009a9 0f83c91b0000                   jae        0x7f179fe72af8
009af 4d63d6                         movsxd     r10, r14d
009b2 43886c1009                     mov        byte ptr [r8 + r10 + 9], bpl
009b7 430fbe4c080a                   movsx      ecx, byte ptr [r8 + r9 + 0xa]
009bd 43884c100a                     mov        byte ptr [r8 + r10 + 0xa], cl
009c2 470fbe4c080b                   movsx      r9d, byte ptr [r8 + r9 + 0xb]
009c8 47884c100b                     mov        byte ptr [r8 + r10 + 0xb], r9b
009cd 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
009d5 4183fa08                       cmp        r10d, 8
009d9 0f830d1c0000                   jae        0x7f179fe72b6c
009df 49ba283827e300000000           movabs     r10, 0xe3273828
009e9 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
009f1 47036c8a08                     add        r13d, dword ptr [r10 + r9*4 + 8]
009f6 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
009fe 4183f904                       cmp        r9d, 4
00a02 7e64                           jle        0x7f179fe70fe8
00a04 8d6bfd                         lea        ebp, [rbx - 3]
00a07 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
00a0e 458d5604                       lea        r10d, [r14 + 4]
00a12 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00a1a 85ed                           test       ebp, ebp
00a1c 0f8c621d0000                   jl         0x7f179fe72d04
00a22 448bd3                         mov        r10d, ebx
00a25 4183c2fd                       add        r10d, -3
00a29 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00a31 453bea                         cmp        r13d, r10d
00a34 0f833a1c0000                   jae        0x7f179fe72bf4
00a3a 458bcd                         mov        r9d, r13d
00a3d 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
00a42 438b6c0808                     mov        ebp, dword ptr [r8 + r9 + 8]
00a47 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00a4f 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00a57 0f83b71c0000                   jae        0x7f179fe72c94
00a5d 458bce                         mov        r9d, r14d
00a60 4d63d1                         movsxd     r10, r9d
00a63 43896c100c                     mov        dword ptr [r8 + r10 + 0xc], ebp
00a68 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00a70 4183fa08                       cmp        r10d, 8
00a74 7e5f                           jle        0x7f179fe71055
00a76 49b9503827e300000000           movabs     r9, 0xe3273850
00a80 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00a88 478b4c9108                     mov        r9d, dword ptr [r9 + r10*4 + 8]
00a8d 452be9                         sub        r13d, r9d
00a90 458d5608                       lea        r10d, [r14 + 8]
00a94 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00a9c 418d6d08                       lea        ebp, [r13 + 8]
00aa0 4585db                         test       r11d, r11d
00aa3 0f8c73200000                   jl         0x7f179fe7309c
00aa9 83c3f9                         add        ebx, -7
00aac 3beb                           cmp        ebp, ebx
00aae 0f83901f0000                   jae        0x7f179fe72fc4
00ab4 4d63d5                         movsxd     r10, r13d
00ab7 4b8b6c1010                     mov        rbp, qword ptr [r8 + r10 + 0x10]
00abc 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00ac4 443bdb                         cmp        r11d, ebx
00ac7 0f83ef1f0000                   jae        0x7f179fe7303c
00acd 4d63d6                         movsxd     r10, r14d
00ad0 4b896c1010                     mov        qword ptr [r8 + r10 + 0x10], rbp
00ad5 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00adc e9f5fbffff                     jmp        0x7f179fe70c56
00ae1 4585ed                         test       r13d, r13d
00ae4 0f8caa200000                   jl         0x7f179fe73114
00aea 4585f6                         test       r14d, r14d
00aed 0f8ca1200000                   jl         0x7f179fe73114
00af3 413bde                         cmp        ebx, r14d
00af6 0f8298200000                   jb         0x7f179fe73114
00afc 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00b04 4503de                         add        r11d, r14d
00b07 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00b0c 413bdb                         cmp        ebx, r11d
00b0f 0f827f200000                   jb         0x7f179fe73114
00b15 85c9                           test       ecx, ecx
00b17 0f8c77200000                   jl         0x7f179fe73114
00b1d 85c9                           test       ecx, ecx
00b1f 0f8449f7ffff                   je         0x7f179fe707ee
00b25 4c8b1424                       mov        r10, qword ptr [rsp]
00b29 4983fa20                       cmp        r10, 0x20
00b2d 772d                           ja         0x7f179fe710dc
00b2f 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00b37 4d63d3                         movsxd     r10, r11d
00b3a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b41 c442a8f5db                     bzhi       r11, r11, r10
00b46 c4c1fb92fb                     kmovq      k7, r11
00b4b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b51 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b57 e912f7ffff                     jmp        0x7f179fe707ee
00b5c 498bd2                         mov        rdx, r10
00b5f c5f877                         vzeroupper 
00b62 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
00b6c 41ffd2                         call       r10
00b6f 0f1f840000000000               nop        dword ptr [rax + rax]
00b77 e9f2f6ffff                     jmp        0x7f179fe707ee
00b7c 4183fe30                       cmp        r14d, 0x30
00b80 0f8eb3000000                   jle        0x7f179fe711b9
00b86 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b8e 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00b92 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00b9a 418b7204                       mov        esi, dword ptr [r10 + 4]
00b9e 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00ba3 4585db                         test       r11d, r11d
00ba6 0f8cb0220000                   jl         0x7f179fe733dc
00bac 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00bb4 4585d2                         test       r10d, r10d
00bb7 0f8c9f220000                   jl         0x7f179fe733dc
00bbd 3b8c2494000000                 cmp        ecx, dword ptr [rsp + 0x94]
00bc4 0f8292220000                   jb         0x7f179fe733dc
00bca 3bf3                           cmp        esi, ebx
00bcc 0f828a220000                   jb         0x7f179fe733dc
00bd2 4585f6                         test       r14d, r14d
00bd5 7440                           je         0x7f179fe71197
00bd7 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00bdf 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
00be4 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bec 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00bf1 4883fa20                       cmp        rdx, 0x20
00bf5 7728                           ja         0x7f179fe7119f
00bf7 4d63d6                         movsxd     r10, r14d
00bfa 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c01 c442a8f5db                     bzhi       r11, r11, r10
00c06 c4c1fb92fb                     kmovq      k7, r11
00c0b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c11 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c17 448bf3                         mov        r14d, ebx
00c1a e90cf8ffff                     jmp        0x7f179fe709ab
00c1f c5f877                         vzeroupper 
00c22 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
00c2c 41ffd2                         call       r10
00c2f 0f1f840000000000               nop        dword ptr [rax + rax]
00c37 ebde                           jmp        0x7f179fe71197
00c39 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c41 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00c45 418d6bf1                       lea        ebp, [r11 - 0xf]
00c49 85ed                           test       ebp, ebp
00c4b 0f8c83210000                   jl         0x7f179fe73354
00c51 418d6bf1                       lea        ebp, [r11 - 0xf]
00c55 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00c5a 443bc5                         cmp        r8d, ebp
00c5d 0f833d200000                   jae        0x7f179fe73220
00c63 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c6b 458b4a04                       mov        r9d, dword ptr [r10 + 4]
00c6f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c74 418bc2                         mov        eax, r10d
00c77 418d69f1                       lea        ebp, [r9 - 0xf]
00c7b 4963ca                         movsxd     rcx, r10d
00c7e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c86 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
00c8d 85ed                           test       ebp, ebp
00c8f 0f8c8b220000                   jl         0x7f179fe734a0
00c95 458d51f1                       lea        r10d, [r9 - 0xf]
00c99 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00ca1 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00ca9 453bc2                         cmp        r8d, r10d
00cac 0f8376200000                   jae        0x7f179fe732a8
00cb2 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00cba 418bf2                         mov        esi, r10d
00cbd 4963fa                         movsxd     rdi, r10d
00cc0 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00cc8 c4c17a7f443a08                 vmovdqu    xmmword ptr [r10 + rdi + 8], xmm0
00ccf 448d5610                       lea        r10d, [rsi + 0x10]
00cd3 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00cd8 458bc2                         mov        r8d, r10d
00cdb 443bd3                         cmp        r10d, ebx
00cde 0f8dba000000                   jge        0x7f179fe7131e
00ce4 482bcf                         sub        rcx, rdi
00ce7 4963fb                         movsxd     rdi, r11d
00cea 4883c7f1                       add        rdi, -0xf
00cee 4d63da                         movsxd     r11, r10d
00cf1 4d8d140b                       lea        r10, [r11 + rcx]
00cf5 4c3bd7                         cmp        r10, rdi
00cf8 0f83a2220000                   jae        0x7f179fe73520
00cfe 4c63d3                         movsxd     r10, ebx
00d01 4d2bd3                         sub        r10, r11
00d04 4983c20f                       add        r10, 0xf
00d08 4983e2f0                       and        r10, 0xfffffffffffffff0
00d0c 458bda                         mov        r11d, r10d
00d0f 448bd6                         mov        r10d, esi
00d12 478d541310                     lea        r10d, [r11 + r10 + 0x10]
00d17 4d63d2                         movsxd     r10, r10d
00d1a 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
00d1f 4c3bdf                         cmp        r11, rdi
00d22 0f8378220000                   jae        0x7f179fe73520
00d28 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
00d30 0f836a220000                   jae        0x7f179fe73520
00d36 4d63d9                         movsxd     r11, r9d
00d39 4983c2f0                       add        r10, -0x10
00d3d 4983c3f1                       add        r11, -0xf
00d41 4d3bd3                         cmp        r10, r11
00d44 0f8356220000                   jae        0x7f179fe73520
00d4a 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00d50 0f8fb2220000                   jg         0x7f179fe73588
00d56 448bd0                         mov        r10d, eax
00d59 442bd6                         sub        r10d, esi
00d5c 0f1f4000                       nop        dword ptr [rax]
00d60 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d65 458bca                         mov        r9d, r10d
00d68 44034c247c                     add        r9d, dword ptr [rsp + 0x7c]
00d6d 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00d75 c4817a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 8]
00d7c 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
00d84 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00d8b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d90 4183c310                       add        r11d, 0x10
00d94 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00d99 443bdb                         cmp        r11d, ebx
00d9c 7cc2                           jl         0x7f179fe712e0
00d9e 4403f0                         add        r14d, eax
00da1 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00da9 448bf3                         mov        r14d, ebx
00dac e97af6ffff                     jmp        0x7f179fe709ab
00db1 4d63d2                         movsxd     r10, r10d
00db4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dbb c442a8f5db                     bzhi       r11, r11, r10
00dc0 c4c1fb92fb                     kmovq      k7, r11
00dc5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dcb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00dd1 e994000000                     jmp        0x7f179fe713ea
00dd6 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00dde 448b5904                       mov        r11d, dword ptr [rcx + 4]
00de2 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
00dea 418b5604                       mov        edx, dword ptr [r14 + 4]
00dee 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00df3 4585ed                         test       r13d, r13d
00df6 0f8c781e0000                   jl         0x7f179fe731f4
00dfc 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00e03 85db                           test       ebx, ebx
00e05 0f8c701e0000                   jl         0x7f179fe731fb
00e0b 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00e10 0f82651e0000                   jb         0x7f179fe731fb
00e16 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00e1d 4103ea                         add        ebp, r10d
00e20 3bd5                           cmp        edx, ebp
00e22 0f82531e0000                   jb         0x7f179fe731fb
00e28 4585d2                         test       r10d, r10d
00e2b 0f8c4a1e0000                   jl         0x7f179fe731fb
00e31 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00e35 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00e39 742f                           je         0x7f179fe713ea
00e3b 4b8d740e08                     lea        rsi, [r14 + r9 + 8]
00e40 4a8d7c0108                     lea        rdi, [rcx + r8 + 8]
00e45 4963d2                         movsxd     rdx, r10d
00e48 4883fa20                       cmp        rdx, 0x20
00e4c 0f865fffffff                   jbe        0x7f179fe71331
00e52 c5f877                         vzeroupper 
00e55 49ba204f8e9f177f0000           movabs     r10, 0x7f179f8e4f20
00e5f 41ffd2                         call       r10
00e62 0f1f840000000000               nop        dword ptr [rax + rax]
00e6a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00e6f 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e73 c5f877                         vzeroupper 
00e76 4881c400010000                 add        rsp, 0x100
00e7d 5d                             pop        rbp
00e7e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e82 0f8784280000                   ja         0x7f179fe73c8c
00e88 c3                             ret        
00e89 448bd5                         mov        r10d, ebp
00e8c 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00e91 4c8be9                         mov        r13, rcx
00e94 448bd0                         mov        r10d, eax
00e97 4403542468                     add        r10d, dword ptr [rsp + 0x68]
00e9c 62917e486f841508000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 8]
00ea7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00eac 62917e487f841d08000000         vmovdqu32  zmmword ptr [r13 + r11 + 8], zmm0
00eb7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00ebc 4183c340                       add        r11d, 0x40
00ec0 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00ec5 443bdb                         cmp        r11d, ebx
00ec8 7cca                           jl         0x7f179fe71414
00eca 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00ed2 e902030000                     jmp        0x7f179fe71759
00ed7 4585db                         test       r11d, r11d
00eda 0f8ca0220000                   jl         0x7f179fe73700
00ee0 8d6bf9                         lea        ebp, [rbx - 7]
00ee3 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
00eea 443bed                         cmp        r13d, ebp
00eed 0f837d210000                   jae        0x7f179fe735f0
00ef3 458bd5                         mov        r10d, r13d
00ef6 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00efb 4963ca                         movsxd     rcx, r10d
00efe 4d8b540808                     mov        r10, qword ptr [r8 + rcx + 8]
00f03 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00f08 443bf5                         cmp        r14d, ebp
00f0b 0f83eb210000                   jae        0x7f179fe7367c
00f11 458bde                         mov        r11d, r14d
00f14 418d6b08                       lea        ebp, [r11 + 8]
00f18 896c2468                       mov        dword ptr [rsp + 0x68], ebp
00f1c 4d63d3                         movsxd     r10, r11d
00f1f 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00f24 4f894c1008                     mov        qword ptr [r8 + r10 + 8], r9
00f29 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00f30 0f8de1020000                   jge        0x7f179fe71797
00f36 492bca                         sub        rcx, r10
00f39 4863db                         movsxd     rbx, ebx
00f3c 4883c3f9                       add        rbx, -7
00f40 4863fd                         movsxd     rdi, ebp
00f43 4c8d140f                       lea        r10, [rdi + rcx]
00f47 4c3bd3                         cmp        r10, rbx
00f4a 0f83c4220000                   jae        0x7f179fe73794
00f50 4c8bd2                         mov        r10, rdx
00f53 4c2bd7                         sub        r10, rdi
00f56 4983c207                       add        r10, 7
00f5a 4983e2f8                       and        r10, 0xfffffffffffffff8
00f5e 458bca                         mov        r9d, r10d
00f61 478d541908                     lea        r10d, [r9 + r11 + 8]
00f66 4d63d2                         movsxd     r10, r10d
00f69 4d8d4c0af8                     lea        r9, [r10 + rcx - 8]
00f6e 4c3bcb                         cmp        r9, rbx
00f71 0f839d220000                   jae        0x7f179fe73794
00f77 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
00f7e 0f8390220000                   jae        0x7f179fe73794
00f84 4983c2f8                       add        r10, -8
00f88 4c3bd3                         cmp        r10, rbx
00f8b 0f8383220000                   jae        0x7f179fe73794
00f91 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00f98 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00f9e 0f8f00230000                   jg         0x7f179fe73824
00fa4 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00fa9 452bd3                         sub        r10d, r11d
00fac 418bc2                         mov        eax, r10d
00faf 498bf0                         mov        rsi, r8
00fb2 4c8d52c8                       lea        r10, [rdx - 0x38]
00fb6 4981fa00000080                 cmp        r10, -0x80000000
00fbd 49c7c100000080                 mov        r9, 0xffffffff80000000
00fc4 4d0f4cd1                       cmovl      r10, r9
00fc8 418bda                         mov        ebx, r10d
00fcb 452bee                         sub        r13d, r14d
00fce 41baf8ffffff                   mov        r10d, 0xfffffff8
00fd4 418d4b10                       lea        ecx, [r11 + 0x10]
00fd8 458bc8                         mov        r9d, r8d
00fdb 452bd1                         sub        r10d, r9d
00fde 452bd3                         sub        r10d, r11d
00fe1 4183c2f0                       add        r10d, -0x10
00fe5 4c63d9                         movsxd     r11, ecx
00fe8 41b906000000                   mov        r9d, 6
00fee c442b0f5d2                     bzhi       r10, r10, r9
00ff3 4d03da                         add        r11, r10
00ff6 4c3bda                         cmp        r11, rdx
00ff9 4c8bca                         mov        r9, rdx
00ffc 4d0f4ccb                       cmovl      r9, r11
01000 4d8bd1                         mov        r10, r9
01003 4c2bd7                         sub        r10, rdi
01006 4d8d5aff                       lea        r11, [r10 - 1]
0100a 49c1fb3f                       sar        r11, 0x3f
0100e 49c1eb3d                       shr        r11, 0x3d
01012 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
01017 4983e2f8                       and        r10, 0xfffffffffffffff8
0101b 4c03d7                         add        r10, rdi
0101e 493bfa                         cmp        rdi, r10
01021 490f4cfa                       cmovl      rdi, r10
01025 448bdf                         mov        r11d, edi
01028 478d541d08                     lea        r10d, [r13 + r11 + 8]
0102d 4183c308                       add        r11d, 8
01031 4963ea                         movsxd     rbp, r10d
01034 4803ee                         add        rbp, rsi
01037 4d63db                         movsxd     r11, r11d
0103a 4c03de                         add        r11, rsi
0103d 488d7d08                       lea        rdi, [rbp + 8]
01041 4883c548                       add        rbp, 0x48
01045 498d7348                       lea        rsi, [r11 + 0x48]
01049 4533d2                         xor        r10d, r10d
0104c 483bf7                         cmp        rsi, rdi
0104f 410f96c2                       setbe      r10b
01053 4983c308                       add        r11, 8
01057 33ff                           xor        edi, edi
01059 493beb                         cmp        rbp, r11
0105c 400f96c7                       setbe      dil
01060 440bd7                         or         r10d, edi
01063 0f84d3100000                   je         0x7f179fe726bc
01069 458bc9                         mov        r9d, r9d
0106c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01071 448bd8                         mov        r11d, eax
01074 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
01079 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0107e 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
01083 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
01087 83c508                         add        ebp, 8
0108a 896c2468                       mov        dword ptr [rsp + 0x68], ebp
0108e 413be9                         cmp        ebp, r9d
01091 7cd9                           jl         0x7f179fe715ec
01093 4881c208feffff                 add        rdx, -0x1f8
0109a 4881fa00000080                 cmp        rdx, -0x80000000
010a1 49c7c200000080                 mov        r10, 0xffffffff80000000
010a8 490f4cd2                       cmovl      rdx, r10
010ac 448bca                         mov        r9d, edx
010af 413be9                         cmp        ebp, r9d
010b2 0f8d6c220000                   jge        0x7f179fe738a4
010b8 896c2468                       mov        dword ptr [rsp + 0x68], ebp
010bc 498bc8                         mov        rcx, r8
010bf 90                             nop        
010c0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
010c5 4963fb                         movsxd     rdi, r11d
010c8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
010cd 448bc0                         mov        r8d, eax
010d0 4403442468                     add        r8d, dword ptr [rsp + 0x68]
010d5 8b742468                       mov        esi, dword ptr [rsp + 0x68]
010d9 81c680000000                   add        esi, 0x80
010df 03f0                           add        esi, eax
010e1 458bd8                         mov        r11d, r8d
010e4 62b17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 8]
010ef 62b17e487f841108000000         vmovdqu32  zmmword ptr [rcx + r10 + 8], zmm0
010fa 4d63c0                         movsxd     r8, r8d
010fd 62b17e486f840148000000         vmovdqu32  zmm0, zmmword ptr [rcx + r8 + 0x48]
01108 62f17e487f843948000000         vmovdqu32  zmmword ptr [rcx + rdi + 0x48], zmm0
01113 448bde                         mov        r11d, esi
01116 62b17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 8]
01121 62f17e487f843988000000         vmovdqu32  zmmword ptr [rcx + rdi + 0x88], zmm0
0112c 4c63d6                         movsxd     r10, esi
0112f 62b17e486f841148000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0x48]
0113a 62f17e487f8439c8000000         vmovdqu32  zmmword ptr [rcx + rdi + 0xc8], zmm0
01145 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0114a 4181c200010000                 add        r10d, 0x100
01151 4403d0                         add        r10d, eax
01154 458bda                         mov        r11d, r10d
01157 62b17e486f841108000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 8]
01162 62f17e487f843908010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x108], zmm0
0116d 4d63d3                         movsxd     r10, r11d
01170 62b17e486f841148000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0x48]
0117b 62f17e487f843948010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x148], zmm0
01186 62b17e486f840188010000         vmovdqu32  zmm0, zmmword ptr [rcx + r8 + 0x188]
01191 62f17e487f843988010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x188], zmm0
0119c 62b17e486f8401c8010000         vmovdqu32  zmm0, zmmword ptr [rcx + r8 + 0x1c8]
011a7 62f17e487f8439c8010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x1c8], zmm0
011b2 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
011b6 81c500020000                   add        ebp, 0x200
011bc 896c2468                       mov        dword ptr [rsp + 0x68], ebp
011c0 413be9                         cmp        ebp, r9d
011c3 0f8cf7feffff                   jl         0x7f179fe71640
011c9 3beb                           cmp        ebp, ebx
011cb 0f8cb8fcffff                   jl         0x7f179fe71409
011d1 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
011d9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
011de 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
011e6 7d2f                           jge        0x7f179fe71797
011e8 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
011ed 666690                         nop        
011f0 468d1400                       lea        r10d, [rax + r8]
011f4 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
011fc 4e8b5c1308                     mov        r11, qword ptr [rbx + r10 + 8]
01201 458bd0                         mov        r10d, r8d
01204 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
01209 4183c008                       add        r8d, 8
0120d 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
01215 7cd9                           jl         0x7f179fe71770
01217 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0121e e9b3f4ffff                     jmp        0x7f179fe70c56
01223 4585d2                         test       r10d, r10d
01226 0f8c24220000                   jl         0x7f179fe739d0
0122c 448d53f1                       lea        r10d, [rbx - 0xf]
01230 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01235 453bea                         cmp        r13d, r10d
01238 0f83f3200000                   jae        0x7f179fe738b1
0123e 4d63d5                         movsxd     r10, r13d
01241 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
01248 443b742478                     cmp        r14d, dword ptr [rsp + 0x78]
0124d 0f8369210000                   jae        0x7f179fe7393c
01253 418d6e10                       lea        ebp, [r14 + 0x10]
01257 4d63de                         movsxd     r11, r14d
0125a c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
01261 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01268 0f8d25020000                   jge        0x7f179fe71a13
0126e 4d2bd3                         sub        r10, r11
01271 4863cb                         movsxd     rcx, ebx
01274 4883c1f1                       add        rcx, -0xf
01278 4c63cd                         movsxd     r9, ebp
0127b 4f8d1c11                       lea        r11, [r9 + r10]
0127f 4c3bd9                         cmp        r11, rcx
01282 0f8358220000                   jae        0x7f179fe73a60
01288 4c8bda                         mov        r11, rdx
0128b 4d2bd9                         sub        r11, r9
0128e 4983c30f                       add        r11, 0xf
01292 4983e3f0                       and        r11, 0xfffffffffffffff0
01296 458bcb                         mov        r9d, r11d
01299 478d5c3110                     lea        r11d, [r9 + r14 + 0x10]
0129e 4d63db                         movsxd     r11, r11d
012a1 4f8d5413f0                     lea        r10, [r11 + r10 - 0x10]
012a6 4c3bd1                         cmp        r10, rcx
012a9 0f8331220000                   jae        0x7f179fe73a60
012af 3b6c2478                       cmp        ebp, dword ptr [rsp + 0x78]
012b3 0f8327220000                   jae        0x7f179fe73a60
012b9 4983c3f0                       add        r11, -0x10
012bd 4c3bd9                         cmp        r11, rcx
012c0 0f831a220000                   jae        0x7f179fe73a60
012c6 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
012ce 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
012d5 0f8f79220000                   jg         0x7f179fe73ad4
012db 452bee                         sub        r13d, r14d
012de 4183c620                       add        r14d, 0x20
012e2 6690                           nop        
012e4 448bd5                         mov        r10d, ebp
012e7 458bc5                         mov        r8d, r13d
012ea 4403c5                         add        r8d, ebp
012ed 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
012f5 c4a17a6f440308                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 8]
012fc c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
01303 83c510                         add        ebp, 0x10
01306 413bee                         cmp        ebp, r14d
01309 7cd9                           jl         0x7f179fe71864
0130b 4881c210ffffff                 add        rdx, -0xf0
01312 4881fa00000080                 cmp        rdx, -0x80000000
01319 49c7c200000080                 mov        r10, 0xffffffff80000000
01320 490f4cd2                       cmovl      rdx, r10
01324 448bd2                         mov        r10d, edx
01327 413bea                         cmp        ebp, r10d
0132a 0f8d2d010000                   jge        0x7f179fe719dd
01330 448bc5                         mov        r8d, ebp
01333 4963c8                         movsxd     rcx, r8d
01336 448bdd                         mov        r11d, ebp
01339 458bcd                         mov        r9d, r13d
0133c 4403cd                         add        r9d, ebp
0133f 458bc1                         mov        r8d, r9d
01342 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0134a c4a17a6f440b08                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 8]
01351 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
01358 4d63d8                         movsxd     r11, r8d
0135b c4a17a6f441b18                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x18]
01362 c5fa7f440b18                   vmovdqu    xmmword ptr [rbx + rcx + 0x18], xmm0
01368 c4a17a6f441b28                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x28]
0136f c5fa7f440b28                   vmovdqu    xmmword ptr [rbx + rcx + 0x28], xmm0
01375 c4a17a6f441b38                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x38]
0137c c5fa7f440b38                   vmovdqu    xmmword ptr [rbx + rcx + 0x38], xmm0
01382 c4a17a6f441b48                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x48]
01389 c5fa7f440b48                   vmovdqu    xmmword ptr [rbx + rcx + 0x48], xmm0
0138f c4a17a6f441b58                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x58]
01396 c5fa7f440b58                   vmovdqu    xmmword ptr [rbx + rcx + 0x58], xmm0
0139c c4a17a6f441b68                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x68]
013a3 c5fa7f440b68                   vmovdqu    xmmword ptr [rbx + rcx + 0x68], xmm0
013a9 c4a17a6f441b78                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x78]
013b0 c5fa7f440b78                   vmovdqu    xmmword ptr [rbx + rcx + 0x78], xmm0
013b6 c4a17a6f841b88000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x88]
013c0 c5fa7f840b88000000             vmovdqu    xmmword ptr [rbx + rcx + 0x88], xmm0
013c9 c4a17a6f841b98000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x98]
013d3 c5fa7f840b98000000             vmovdqu    xmmword ptr [rbx + rcx + 0x98], xmm0
013dc c4a17a6f841ba8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xa8]
013e6 c5fa7f840ba8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xa8], xmm0
013ef c4a17a6f841bb8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xb8]
013f9 c5fa7f840bb8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xb8], xmm0
01402 c4a17a6f841bc8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc8]
0140c c5fa7f840bc8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xc8], xmm0
01415 c4a17a6f841bd8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xd8]
0141f c5fa7f840bd8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xd8], xmm0
01428 c4a17a6f841be8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xe8]
01432 c5fa7f840be8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xe8], xmm0
0143b c4a17a6f841bf8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xf8]
01445 c5fa7f840bf8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xf8], xmm0
0144e 81c500010000                   add        ebp, 0x100
01454 413bea                         cmp        ebp, r10d
01457 0f8cd3feffff                   jl         0x7f179fe718b0
0145d 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01464 7d2d                           jge        0x7f179fe71a13
01466 6690                           nop        
01468 458bdd                         mov        r11d, r13d
0146b 4403dd                         add        r11d, ebp
0146e 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
01476 c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
0147d 448bd5                         mov        r10d, ebp
01480 c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
01487 83c510                         add        ebp, 0x10
0148a 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01491 7cd5                           jl         0x7f179fe719e8
01493 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0149a e937f2ffff                     jmp        0x7f179fe70c56
0149f bee4ffffff                     mov        esi, 0xffffffe4
014a4 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014a9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ae 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014b2 89442408                       mov        dword ptr [rsp + 8], eax
014b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bb 48ff742420                     push       qword ptr [rsp + 0x20]
014c0 488f442418                     pop        qword ptr [rsp + 0x18]
014c5 48894424f8                     mov        qword ptr [rsp - 8], rax
014ca 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014ce 8944240c                       mov        dword ptr [rsp + 0xc], eax
014d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d7 48894424f8                     mov        qword ptr [rsp - 8], rax
014dc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014e0 89442438                       mov        dword ptr [rsp + 0x38], eax
014e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ee 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
014f2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fb 90                             nop        
014fc c5f877                         vzeroupper 
014ff e8dc1bb5ff                     call       0x7f179f9c3660
01504 0f1f8400fc150003               nop        dword ptr [rax + rax + 0x30015fc]
0150c bee4ffffff                     mov        esi, 0xffffffe4
01511 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01516 48894424f8                     mov        qword ptr [rsp - 8], rax
0151b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0151f 89442408                       mov        dword ptr [rsp + 8], eax
01523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01528 48ff742420                     push       qword ptr [rsp + 0x20]
0152d 488f442418                     pop        qword ptr [rsp + 0x18]
01532 48894424f8                     mov        qword ptr [rsp - 8], rax
01537 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0153b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0153f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01544 48894424f8                     mov        qword ptr [rsp - 8], rax
01549 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0154d 89442438                       mov        dword ptr [rsp + 0x38], eax
01551 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01556 48894424f8                     mov        qword ptr [rsp - 8], rax
0155b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0155f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01563 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01568 48894424f8                     mov        qword ptr [rsp - 8], rax
0156d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01571 89442460                       mov        dword ptr [rsp + 0x60], eax
01575 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0157a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0157f 48894424f8                     mov        qword ptr [rsp - 8], rax
01584 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01588 89442478                       mov        dword ptr [rsp + 0x78], eax
0158c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01591 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01596 6690                           nop        
01598 c5f877                         vzeroupper 
0159b e8401bb5ff                     call       0x7f179f9c3660
015a0 0f1f840098160004               nop        dword ptr [rax + rax + 0x4001698]
015a8 bee4ffffff                     mov        esi, 0xffffffe4
015ad 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015b2 48894424f8                     mov        qword ptr [rsp - 8], rax
015b7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015bb 89442408                       mov        dword ptr [rsp + 8], eax
015bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c4 48ff742420                     push       qword ptr [rsp + 0x20]
015c9 488f442418                     pop        qword ptr [rsp + 0x18]
015ce 48894424f8                     mov        qword ptr [rsp - 8], rax
015d3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015d7 8944240c                       mov        dword ptr [rsp + 0xc], eax
015db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e0 895c2434                       mov        dword ptr [rsp + 0x34], ebx
015e4 48894424f8                     mov        qword ptr [rsp - 8], rax
015e9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015ed 89442438                       mov        dword ptr [rsp + 0x38], eax
015f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f6 48894424f8                     mov        qword ptr [rsp - 8], rax
015fb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
015ff 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01603 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01608 48894424f8                     mov        qword ptr [rsp - 8], rax
0160d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01611 89442460                       mov        dword ptr [rsp + 0x60], eax
01615 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0161f 48894424f8                     mov        qword ptr [rsp - 8], rax
01624 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0162b 89442468                       mov        dword ptr [rsp + 0x68], eax
0162f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01634 48894424f8                     mov        qword ptr [rsp - 8], rax
01639 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01640 89442478                       mov        dword ptr [rsp + 0x78], eax
01644 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01649 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0164e c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01657 90                             nop        
01658 c5f877                         vzeroupper 
0165b e8801ab5ff                     call       0x7f179f9c3660
01660 0f1f840058170005               nop        dword ptr [rax + rax + 0x5001758]
01668 beccffffff                     mov        esi, 0xffffffcc
0166d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01672 48894424f8                     mov        qword ptr [rsp - 8], rax
01677 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0167b 89442408                       mov        dword ptr [rsp + 8], eax
0167f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01684 48ff742420                     push       qword ptr [rsp + 0x20]
01689 488f442418                     pop        qword ptr [rsp + 0x18]
0168e 48894424f8                     mov        qword ptr [rsp - 8], rax
01693 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01697 8944240c                       mov        dword ptr [rsp + 0xc], eax
0169b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a0 48894424f8                     mov        qword ptr [rsp - 8], rax
016a5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
016a9 89442438                       mov        dword ptr [rsp + 0x38], eax
016ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b2 48894424f8                     mov        qword ptr [rsp - 8], rax
016b7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016bb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c4 48894424f8                     mov        qword ptr [rsp - 8], rax
016c9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
016cd 89442460                       mov        dword ptr [rsp + 0x60], eax
016d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d6 4489742464                     mov        dword ptr [rsp + 0x64], r14d
016db 48894424f8                     mov        qword ptr [rsp - 8], rax
016e0 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
016e4 89442478                       mov        dword ptr [rsp + 0x78], eax
016e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ed 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
016f2 6690                           nop        
016f4 c5f877                         vzeroupper 
016f7 e8e419b5ff                     call       0x7f179f9c3660
016fc 0f1f8400f4170006               nop        dword ptr [rax + rax + 0x60017f4]
01704 beccffffff                     mov        esi, 0xffffffcc
01709 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0170e 48894424f8                     mov        qword ptr [rsp - 8], rax
01713 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01717 89442408                       mov        dword ptr [rsp + 8], eax
0171b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01720 48ff742420                     push       qword ptr [rsp + 0x20]
01725 488f442418                     pop        qword ptr [rsp + 0x18]
0172a 48894424f8                     mov        qword ptr [rsp - 8], rax
0172f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01733 8944240c                       mov        dword ptr [rsp + 0xc], eax
01737 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173c 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01740 48894424f8                     mov        qword ptr [rsp - 8], rax
01745 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01749 89442438                       mov        dword ptr [rsp + 0x38], eax
0174d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01752 48894424f8                     mov        qword ptr [rsp - 8], rax
01757 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0175b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0175f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01764 48894424f8                     mov        qword ptr [rsp - 8], rax
01769 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0176d 89442460                       mov        dword ptr [rsp + 0x60], eax
01771 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01776 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0177b 48894424f8                     mov        qword ptr [rsp - 8], rax
01780 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01787 89442468                       mov        dword ptr [rsp + 0x68], eax
0178b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01790 48894424f8                     mov        qword ptr [rsp - 8], rax
01795 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0179c 89442478                       mov        dword ptr [rsp + 0x78], eax
017a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
017aa c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017b3 90                             nop        
017b4 c5f877                         vzeroupper 
017b7 e82419b5ff                     call       0x7f179f9c3660
017bc 0f1f8400b4180007               nop        dword ptr [rax + rax + 0x70018b4]
017c4 bee4ffffff                     mov        esi, 0xffffffe4
017c9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ce 48894424f8                     mov        qword ptr [rsp - 8], rax
017d3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017d7 89442408                       mov        dword ptr [rsp + 8], eax
017db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e0 48ff742420                     push       qword ptr [rsp + 0x20]
017e5 488f442418                     pop        qword ptr [rsp + 0x18]
017ea 48894424f8                     mov        qword ptr [rsp - 8], rax
017ef 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017f3 8944240c                       mov        dword ptr [rsp + 0xc], eax
017f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01801 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01805 89442434                       mov        dword ptr [rsp + 0x34], eax
01809 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180e 48894424f8                     mov        qword ptr [rsp - 8], rax
01813 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01817 89442438                       mov        dword ptr [rsp + 0x38], eax
0181b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01820 48894424f8                     mov        qword ptr [rsp - 8], rax
01825 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01829 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0182d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01832 48894424f8                     mov        qword ptr [rsp - 8], rax
01837 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0183b 89442460                       mov        dword ptr [rsp + 0x60], eax
0183f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01844 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01849 666690                         nop        
0184c c5f877                         vzeroupper 
0184f e88c18b5ff                     call       0x7f179f9c3660
01854 0f1f84004c190008               nop        dword ptr [rax + rax + 0x800194c]
0185c bee4ffffff                     mov        esi, 0xffffffe4
01861 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01866 48894424f8                     mov        qword ptr [rsp - 8], rax
0186b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0186f 89442408                       mov        dword ptr [rsp + 8], eax
01873 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01878 48ff742420                     push       qword ptr [rsp + 0x20]
0187d 488f442418                     pop        qword ptr [rsp + 0x18]
01882 48894424f8                     mov        qword ptr [rsp - 8], rax
01887 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0188b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0188f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01894 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01899 48894424f8                     mov        qword ptr [rsp - 8], rax
0189e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
018a2 89442438                       mov        dword ptr [rsp + 0x38], eax
018a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ab 48894424f8                     mov        qword ptr [rsp - 8], rax
018b0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018b4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bd 48894424f8                     mov        qword ptr [rsp - 8], rax
018c2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018c6 89442460                       mov        dword ptr [rsp + 0x60], eax
018ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018cf 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
018d4 895c2474                       mov        dword ptr [rsp + 0x74], ebx
018d8 c5f877                         vzeroupper 
018db e80018b5ff                     call       0x7f179f9c3660
018e0 0f1f8400d8190009               nop        dword ptr [rax + rax + 0x90019d8]
018e8 bee4ffffff                     mov        esi, 0xffffffe4
018ed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018f2 48894424f8                     mov        qword ptr [rsp - 8], rax
018f7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018fb 89442408                       mov        dword ptr [rsp + 8], eax
018ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01904 48ff742420                     push       qword ptr [rsp + 0x20]
01909 488f442418                     pop        qword ptr [rsp + 0x18]
0190e 48894424f8                     mov        qword ptr [rsp - 8], rax
01913 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01917 8944240c                       mov        dword ptr [rsp + 0xc], eax
0191b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01920 48894424f8                     mov        qword ptr [rsp - 8], rax
01925 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01929 89442438                       mov        dword ptr [rsp + 0x38], eax
0192d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01932 48894424f8                     mov        qword ptr [rsp - 8], rax
01937 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0193b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0193f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01944 48894424f8                     mov        qword ptr [rsp - 8], rax
01949 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0194d 89442460                       mov        dword ptr [rsp + 0x60], eax
01951 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01956 48894424f8                     mov        qword ptr [rsp - 8], rax
0195b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01962 89442464                       mov        dword ptr [rsp + 0x64], eax
01966 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196b 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01970 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01974 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0197d 666690                         nop        
01980 c5f877                         vzeroupper 
01983 e85817b5ff                     call       0x7f179f9c3660
01988 0f1f8400801a000a               nop        dword ptr [rax + rax + 0xa001a80]
01990 beccffffff                     mov        esi, 0xffffffcc
01995 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0199a 48894424f8                     mov        qword ptr [rsp - 8], rax
0199f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019a3 89442408                       mov        dword ptr [rsp + 8], eax
019a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ac 48ff742420                     push       qword ptr [rsp + 0x20]
019b1 488f442418                     pop        qword ptr [rsp + 0x18]
019b6 48894424f8                     mov        qword ptr [rsp - 8], rax
019bb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019bf 8944240c                       mov        dword ptr [rsp + 0xc], eax
019c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c8 4489742430                     mov        dword ptr [rsp + 0x30], r14d
019cd 48894424f8                     mov        qword ptr [rsp - 8], rax
019d2 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019d6 89442438                       mov        dword ptr [rsp + 0x38], eax
019da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019df 48894424f8                     mov        qword ptr [rsp - 8], rax
019e4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019e8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f1 48894424f8                     mov        qword ptr [rsp - 8], rax
019f6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019fa 89442460                       mov        dword ptr [rsp + 0x60], eax
019fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a03 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01a08 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01a0d 666690                         nop        
01a10 c5f877                         vzeroupper 
01a13 e8c816b5ff                     call       0x7f179f9c3660
01a18 0f1f8400101b000b               nop        dword ptr [rax + rax + 0xb001b10]
01a20 be45ffffff                     mov        esi, 0xffffff45
01a25 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a2a 4c89542408                     mov        qword ptr [rsp + 8], r10
01a2f 90                             nop        
01a30 c5f877                         vzeroupper 
01a33 e8a816b5ff                     call       0x7f179f9c3660
01a38 0f1f8400301b000c               nop        dword ptr [rax + rax + 0xc001b30]
01a40 be45ffffff                     mov        esi, 0xffffff45
01a45 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a53 89442408                       mov        dword ptr [rsp + 8], eax
01a57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5c 48ff742420                     push       qword ptr [rsp + 0x20]
01a61 488f442418                     pop        qword ptr [rsp + 0x18]
01a66 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a6f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a78 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a81 89442438                       mov        dword ptr [rsp + 0x38], eax
01a85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a93 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9c 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01aa1 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01aa6 6690                           nop        
01aa8 c5f877                         vzeroupper 
01aab e83016b5ff                     call       0x7f179f9c3660
01ab0 0f1f8400a81b000d               nop        dword ptr [rax + rax + 0xd001ba8]
01ab8 493bfa                         cmp        rdi, r10
01abb bdffffffff                     mov        ebp, 0xffffffff
01ac0 7c08                           jl         0x7f179fe7204a
01ac2 400f95c5                       setne      bpl
01ac6 400fb6ed                       movzx      ebp, bpl
01aca be45ffffff                     mov        esi, 0xffffff45
01acf 48ff742408                     push       qword ptr [rsp + 8]
01ad4 488f0424                       pop        qword ptr [rsp]
01ad8 48894424f8                     mov        qword ptr [rsp - 8], rax
01add 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ae1 89442414                       mov        dword ptr [rsp + 0x14], eax
01ae5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aea 48894424f8                     mov        qword ptr [rsp - 8], rax
01aef 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01af3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01af7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afc 48894424f8                     mov        qword ptr [rsp - 8], rax
01b01 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b05 89442444                       mov        dword ptr [rsp + 0x44], eax
01b09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b13 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b17 89442468                       mov        dword ptr [rsp + 0x68], eax
01b1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b20 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01b25 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01b2a 6690                           nop        
01b2c c5f877                         vzeroupper 
01b2f e8ac15b5ff                     call       0x7f179f9c3660
01b34 0f1f84002c1c000e               nop        dword ptr [rax + rax + 0xe001c2c]
01b3c be45ffffff                     mov        esi, 0xffffff45
01b41 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b46 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b4f 89442408                       mov        dword ptr [rsp + 8], eax
01b53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b58 48ff742420                     push       qword ptr [rsp + 0x20]
01b5d 488f442418                     pop        qword ptr [rsp + 0x18]
01b62 48894424f8                     mov        qword ptr [rsp - 8], rax
01b67 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b6b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b74 48894424f8                     mov        qword ptr [rsp - 8], rax
01b79 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01b7d 89442438                       mov        dword ptr [rsp + 0x38], eax
01b81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b86 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b8f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b98 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ba1 89442460                       mov        dword ptr [rsp + 0x60], eax
01ba5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01baa 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01baf 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01bb4 c5f877                         vzeroupper 
01bb7 e82415b5ff                     call       0x7f179f9c3660
01bbc 0f1f8400b41c000f               nop        dword ptr [rax + rax + 0xf001cb4]
01bc4 be45ffffff                     mov        esi, 0xffffff45
01bc9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01bce 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bd7 89442408                       mov        dword ptr [rsp + 8], eax
01bdb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be0 48ff742420                     push       qword ptr [rsp + 0x20]
01be5 488f442418                     pop        qword ptr [rsp + 0x18]
01bea 48894424f8                     mov        qword ptr [rsp - 8], rax
01bef 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01bf3 8944240c                       mov        dword ptr [rsp + 0xc], eax
01bf7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bfc 48894424f8                     mov        qword ptr [rsp - 8], rax
01c01 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01c05 89442438                       mov        dword ptr [rsp + 0x38], eax
01c09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c13 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c17 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c20 48894424f8                     mov        qword ptr [rsp - 8], rax
01c25 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c29 89442460                       mov        dword ptr [rsp + 0x60], eax
01c2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c32 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01c37 90                             nop        
01c38 c5f877                         vzeroupper 
01c3b e8a014b5ff                     call       0x7f179f9c3660
01c40 0f1f8400381d0010               nop        dword ptr [rax + rax + 0x10001d38]
01c48 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
01c50 4d3bd8                         cmp        r11, r8
01c53 bdffffffff                     mov        ebp, 0xffffffff
01c58 7c08                           jl         0x7f179fe721e2
01c5a 400f95c5                       setne      bpl
01c5e 400fb6ed                       movzx      ebp, bpl
01c62 be45ffffff                     mov        esi, 0xffffff45
01c67 48ff742408                     push       qword ptr [rsp + 8]
01c6c 488f0424                       pop        qword ptr [rsp]
01c70 48894424f8                     mov        qword ptr [rsp - 8], rax
01c75 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c79 89442414                       mov        dword ptr [rsp + 0x14], eax
01c7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c82 48894424f8                     mov        qword ptr [rsp - 8], rax
01c87 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01c8b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c94 48894424f8                     mov        qword ptr [rsp - 8], rax
01c99 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c9d 89442464                       mov        dword ptr [rsp + 0x64], eax
01ca1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca6 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01cab 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01cb0 c5f877                         vzeroupper 
01cb3 e82814b5ff                     call       0x7f179f9c3660
01cb8 0f1f8400b01d0011               nop        dword ptr [rax + rax + 0x11001db0]
01cc0 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
01cc8 493bfb                         cmp        rdi, r11
01ccb bdffffffff                     mov        ebp, 0xffffffff
01cd0 7c08                           jl         0x7f179fe7225a
01cd2 400f95c5                       setne      bpl
01cd6 400fb6ed                       movzx      ebp, bpl
01cda be45ffffff                     mov        esi, 0xffffff45
01cdf 48ff742408                     push       qword ptr [rsp + 8]
01ce4 488f0424                       pop        qword ptr [rsp]
01ce8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ced 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cf1 89442414                       mov        dword ptr [rsp + 0x14], eax
01cf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01cff 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01d03 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d11 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d15 89442464                       mov        dword ptr [rsp + 0x64], eax
01d19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1e 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01d23 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01d28 c5f877                         vzeroupper 
01d2b e8b013b5ff                     call       0x7f179f9c3660
01d30 0f1f8400281e0012               nop        dword ptr [rax + rax + 0x12001e28]
01d38 bee4ffffff                     mov        esi, 0xffffffe4
01d3d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d42 48894424f8                     mov        qword ptr [rsp - 8], rax
01d47 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d4b 89442408                       mov        dword ptr [rsp + 8], eax
01d4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d54 48ff742420                     push       qword ptr [rsp + 0x20]
01d59 488f442418                     pop        qword ptr [rsp + 0x18]
01d5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d63 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d67 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d70 48894424f8                     mov        qword ptr [rsp - 8], rax
01d75 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01d79 89442438                       mov        dword ptr [rsp + 0x38], eax
01d7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d82 48894424f8                     mov        qword ptr [rsp - 8], rax
01d87 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01d8b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d94 48894424f8                     mov        qword ptr [rsp - 8], rax
01d99 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d9d 89442460                       mov        dword ptr [rsp + 0x60], eax
01da1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da6 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01dab 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01db0 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01db5 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01dbd 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01dc5 666690                         nop        
01dc8 c5f877                         vzeroupper 
01dcb e81013b5ff                     call       0x7f179f9c3660
01dd0 0f1f8400c81e0013               nop        dword ptr [rax + rax + 0x13001ec8]
01dd8 bee4ffffff                     mov        esi, 0xffffffe4
01ddd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01de2 48894424f8                     mov        qword ptr [rsp - 8], rax
01de7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01deb 89442408                       mov        dword ptr [rsp + 8], eax
01def 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df4 48ff742420                     push       qword ptr [rsp + 0x20]
01df9 488f442418                     pop        qword ptr [rsp + 0x18]
01dfe 48894424f8                     mov        qword ptr [rsp - 8], rax
01e03 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e07 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e10 48894424f8                     mov        qword ptr [rsp - 8], rax
01e15 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e19 89442438                       mov        dword ptr [rsp + 0x38], eax
01e1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e22 48894424f8                     mov        qword ptr [rsp - 8], rax
01e27 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e2b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e34 48894424f8                     mov        qword ptr [rsp - 8], rax
01e39 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e3d 89442460                       mov        dword ptr [rsp + 0x60], eax
01e41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e46 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01e4b 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01e50 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01e55 48894c2478                     mov        qword ptr [rsp + 0x78], rcx
01e5a 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01e5f 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01e67 90                             nop        
01e68 c5f877                         vzeroupper 
01e6b e87012b5ff                     call       0x7f179f9c3660
01e70 0f1f8400681f0014               nop        dword ptr [rax + rax + 0x14001f68]
01e78 beccffffff                     mov        esi, 0xffffffcc
01e7d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e82 48894424f8                     mov        qword ptr [rsp - 8], rax
01e87 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e8b 89442408                       mov        dword ptr [rsp + 8], eax
01e8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e94 48ff742420                     push       qword ptr [rsp + 0x20]
01e99 488f442418                     pop        qword ptr [rsp + 0x18]
01e9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ea7 8944240c                       mov        dword ptr [rsp + 0xc], eax
01eab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01eb9 89442438                       mov        dword ptr [rsp + 0x38], eax
01ebd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01ecb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ecf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01edd 89442460                       mov        dword ptr [rsp + 0x60], eax
01ee1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee6 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01eeb 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01ef0 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01ef5 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01efd 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
01f05 666690                         nop        
01f08 c5f877                         vzeroupper 
01f0b e8d011b5ff                     call       0x7f179f9c3660
01f10 0f1f840008200015               nop        dword ptr [rax + rax + 0x15002008]
01f18 4183c508                       add        r13d, 8
01f1c be6effffff                     mov        esi, 0xffffff6e
01f21 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f26 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01f2f 89442408                       mov        dword ptr [rsp + 8], eax
01f33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f38 48ff742420                     push       qword ptr [rsp + 0x20]
01f3d 488f442418                     pop        qword ptr [rsp + 0x18]
01f42 48894424f8                     mov        qword ptr [rsp - 8], rax
01f47 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f4b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f54 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01f59 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f62 89442438                       mov        dword ptr [rsp + 0x38], eax
01f66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f70 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f74 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f82 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f86 89442460                       mov        dword ptr [rsp + 0x60], eax
01f8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f94 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01f9b 89442468                       mov        dword ptr [rsp + 0x68], eax
01f9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa4 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01fa9 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01fae 6690                           nop        
01fb0 c5f877                         vzeroupper 
01fb3 e82811b5ff                     call       0x7f179f9c3660
01fb8 0f1f8400b0200016               nop        dword ptr [rax + rax + 0x160020b0]
01fc0 4183c508                       add        r13d, 8
01fc4 be66ffffff                     mov        esi, 0xffffff66
01fc9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01fce 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fd7 89442408                       mov        dword ptr [rsp + 8], eax
01fdb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe0 48ff742420                     push       qword ptr [rsp + 0x20]
01fe5 488f442418                     pop        qword ptr [rsp + 0x18]
01fea 48894424f8                     mov        qword ptr [rsp - 8], rax
01fef 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ff3 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ff7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ffc 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
02001 48894424f8                     mov        qword ptr [rsp - 8], rax
02006 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0200a 89442438                       mov        dword ptr [rsp + 0x38], eax
0200e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02013 48894424f8                     mov        qword ptr [rsp - 8], rax
02018 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0201c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02020 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02025 48894424f8                     mov        qword ptr [rsp - 8], rax
0202a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0202e 89442460                       mov        dword ptr [rsp + 0x60], eax
02032 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02037 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
0203c 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
02041 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02045 666690                         nop        
02048 c5f877                         vzeroupper 
0204b e89010b5ff                     call       0x7f179f9c3660
02050 0f1f840048210017               nop        dword ptr [rax + rax + 0x17002148]
02058 4533d2                         xor        r10d, r10d
0205b 4c89542408                     mov        qword ptr [rsp + 8], r10
02060 e9dde0ffff                     jmp        0x7f179fe706c2
02065 4533d2                         xor        r10d, r10d
02068 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02070 e9fce0ffff                     jmp        0x7f179fe706f1
02075 4533d2                         xor        r10d, r10d
02078 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02080 e919e1ffff                     jmp        0x7f179fe7071e
02085 4533d2                         xor        r10d, r10d
02088 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0208d e938e1ffff                     jmp        0x7f179fe7074a
02092 4533d2                         xor        r10d, r10d
02095 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0209d e951e1ffff                     jmp        0x7f179fe70773
020a2 4533d2                         xor        r10d, r10d
020a5 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
020ad e967e1ffff                     jmp        0x7f179fe70799
020b2 beccffffff                     mov        esi, 0xffffffcc
020b7 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020bc 48894424f8                     mov        qword ptr [rsp - 8], rax
020c1 8b442410                       mov        eax, dword ptr [rsp + 0x10]
020c5 89442408                       mov        dword ptr [rsp + 8], eax
020c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ce 48ff742420                     push       qword ptr [rsp + 0x20]
020d3 488f442418                     pop        qword ptr [rsp + 0x18]
020d8 48894424f8                     mov        qword ptr [rsp - 8], rax
020dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020e1 8944240c                       mov        dword ptr [rsp + 0xc], eax
020e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ea 48894424f8                     mov        qword ptr [rsp - 8], rax
020ef 8b442440                       mov        eax, dword ptr [rsp + 0x40]
020f3 89442438                       mov        dword ptr [rsp + 0x38], eax
020f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02101 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02105 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02109 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210e 48894424f8                     mov        qword ptr [rsp - 8], rax
02113 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02117 89442460                       mov        dword ptr [rsp + 0x60], eax
0211b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02120 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02125 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0212a 6690                           nop        
0212c c5f877                         vzeroupper 
0212f e8ac0fb5ff                     call       0x7f179f9c3660
02134 0f1f84002c220018               nop        dword ptr [rax + rax + 0x1800222c]
0213c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02141 448bd8                         mov        r11d, eax
02144 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
02149 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0214e 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
02153 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02158 4183c308                       add        r11d, 8
0215c 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02161 443bd9                         cmp        r11d, ecx
02164 7cd6                           jl         0x7f179fe726bc
02166 443bdb                         cmp        r11d, ebx
02169 0f8d49140000                   jge        0x7f179fe73b38
0216f 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02174 498bc8                         mov        rcx, r8
02177 660f1f840000000000             nop        word ptr [rax + rax]
02180 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02185 4d63c3                         movsxd     r8, r11d
02188 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0218d 448bd8                         mov        r11d, eax
02190 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
02195 458bcb                         mov        r9d, r11d
02198 4e8b5c1908                     mov        r11, qword ptr [rcx + r11 + 8]
0219d 4e895c1108                     mov        qword ptr [rcx + r10 + 8], r11
021a2 4d63d9                         movsxd     r11, r9d
021a5 4e8b541910                     mov        r10, qword ptr [rcx + r11 + 0x10]
021aa 4e89540110                     mov        qword ptr [rcx + r8 + 0x10], r10
021af 4e8b541918                     mov        r10, qword ptr [rcx + r11 + 0x18]
021b4 4e89540118                     mov        qword ptr [rcx + r8 + 0x18], r10
021b9 4e8b541920                     mov        r10, qword ptr [rcx + r11 + 0x20]
021be 4e89540120                     mov        qword ptr [rcx + r8 + 0x20], r10
021c3 4e8b541928                     mov        r10, qword ptr [rcx + r11 + 0x28]
021c8 4e89540128                     mov        qword ptr [rcx + r8 + 0x28], r10
021cd 4e8b541930                     mov        r10, qword ptr [rcx + r11 + 0x30]
021d2 4e89540130                     mov        qword ptr [rcx + r8 + 0x30], r10
021d7 4e8b541938                     mov        r10, qword ptr [rcx + r11 + 0x38]
021dc 4e89540138                     mov        qword ptr [rcx + r8 + 0x38], r10
021e1 4e8b541940                     mov        r10, qword ptr [rcx + r11 + 0x40]
021e6 4e89540140                     mov        qword ptr [rcx + r8 + 0x40], r10
021eb 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
021f0 4183c240                       add        r10d, 0x40
021f4 4489542468                     mov        dword ptr [rsp + 0x68], r10d
021f9 443bd3                         cmp        r10d, ebx
021fc 0f8c7effffff                   jl         0x7f179fe72700
02202 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
0220a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0220f 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
02217 0f8dfaefffff                   jge        0x7f179fe71797
0221d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02222 458bda                         mov        r11d, r10d
02225 666690                         nop        
02228 468d1418                       lea        r10d, [rax + r11]
0222c 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
02234 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
02239 458bc3                         mov        r8d, r11d
0223c 4f89540108                     mov        qword ptr [r9 + r8 + 8], r10
02241 458d5308                       lea        r10d, [r11 + 8]
02245 458bda                         mov        r11d, r10d
02248 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
02250 7cd6                           jl         0x7f179fe727a8
02252 e9c0efffff                     jmp        0x7f179fe71797
02257 bee4ffffff                     mov        esi, 0xffffffe4
0225c 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02261 48894424f8                     mov        qword ptr [rsp - 8], rax
02266 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0226a 89442408                       mov        dword ptr [rsp + 8], eax
0226e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02273 48ff742420                     push       qword ptr [rsp + 0x20]
02278 488f442418                     pop        qword ptr [rsp + 0x18]
0227d 48894424f8                     mov        qword ptr [rsp - 8], rax
02282 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02286 8944240c                       mov        dword ptr [rsp + 0xc], eax
0228a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228f 48894424f8                     mov        qword ptr [rsp - 8], rax
02294 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02298 89442434                       mov        dword ptr [rsp + 0x34], eax
0229c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a1 48894424f8                     mov        qword ptr [rsp - 8], rax
022a6 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022aa 89442438                       mov        dword ptr [rsp + 0x38], eax
022ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b3 48894424f8                     mov        qword ptr [rsp - 8], rax
022b8 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
022bc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c5 48894424f8                     mov        qword ptr [rsp - 8], rax
022ca 8b442470                       mov        eax, dword ptr [rsp + 0x70]
022ce 89442460                       mov        dword ptr [rsp + 0x60], eax
022d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d7 4489742464                     mov        dword ptr [rsp + 0x64], r14d
022dc 48894424f8                     mov        qword ptr [rsp - 8], rax
022e1 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
022e8 89442468                       mov        dword ptr [rsp + 0x68], eax
022ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f1 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
022f8 c5f877                         vzeroupper 
022fb e8e00db5ff                     call       0x7f179f9c3660
02300 0f1f8400f8230019               nop        dword ptr [rax + rax + 0x190023f8]
02308 bee4ffffff                     mov        esi, 0xffffffe4
0230d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02312 48894424f8                     mov        qword ptr [rsp - 8], rax
02317 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0231b 89442408                       mov        dword ptr [rsp + 8], eax
0231f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02324 48ff742420                     push       qword ptr [rsp + 0x20]
02329 488f442418                     pop        qword ptr [rsp + 0x18]
0232e 48894424f8                     mov        qword ptr [rsp - 8], rax
02333 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02337 8944240c                       mov        dword ptr [rsp + 0xc], eax
0233b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02340 48894424f8                     mov        qword ptr [rsp - 8], rax
02345 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02349 89442438                       mov        dword ptr [rsp + 0x38], eax
0234d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02352 48894424f8                     mov        qword ptr [rsp - 8], rax
02357 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0235b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0235f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02364 48894424f8                     mov        qword ptr [rsp - 8], rax
02369 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0236d 89442460                       mov        dword ptr [rsp + 0x60], eax
02371 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02376 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0237b 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0237f 90                             nop        
02380 c5f877                         vzeroupper 
02383 e8580db5ff                     call       0x7f179f9c3660
02388 0f1f84008024001a               nop        dword ptr [rax + rax + 0x1a002480]
02390 bee4ffffff                     mov        esi, 0xffffffe4
02395 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0239a 48894424f8                     mov        qword ptr [rsp - 8], rax
0239f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
023a3 89442408                       mov        dword ptr [rsp + 8], eax
023a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ac 48ff742420                     push       qword ptr [rsp + 0x20]
023b1 488f442418                     pop        qword ptr [rsp + 0x18]
023b6 48894424f8                     mov        qword ptr [rsp - 8], rax
023bb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023bf 8944240c                       mov        dword ptr [rsp + 0xc], eax
023c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c8 48894424f8                     mov        qword ptr [rsp - 8], rax
023cd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023d1 89442438                       mov        dword ptr [rsp + 0x38], eax
023d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023da 48894424f8                     mov        qword ptr [rsp - 8], rax
023df 8b442470                       mov        eax, dword ptr [rsp + 0x70]
023e3 89442460                       mov        dword ptr [rsp + 0x60], eax
023e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ec 4489742464                     mov        dword ptr [rsp + 0x64], r14d
023f1 666690                         nop        
023f4 c5f877                         vzeroupper 
023f7 e8e40cb5ff                     call       0x7f179f9c3660
023fc 0f1f8400f424001b               nop        dword ptr [rax + rax + 0x1b0024f4]
02404 bee4ffffff                     mov        esi, 0xffffffe4
02409 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0240e 48894424f8                     mov        qword ptr [rsp - 8], rax
02413 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02417 89442408                       mov        dword ptr [rsp + 8], eax
0241b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02420 48ff742420                     push       qword ptr [rsp + 0x20]
02425 488f442418                     pop        qword ptr [rsp + 0x18]
0242a 48894424f8                     mov        qword ptr [rsp - 8], rax
0242f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02433 8944240c                       mov        dword ptr [rsp + 0xc], eax
02437 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0243c 48894424f8                     mov        qword ptr [rsp - 8], rax
02441 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02445 89442434                       mov        dword ptr [rsp + 0x34], eax
02449 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0244e 48894424f8                     mov        qword ptr [rsp - 8], rax
02453 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02457 89442440                       mov        dword ptr [rsp + 0x40], eax
0245b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02460 48894424f8                     mov        qword ptr [rsp - 8], rax
02465 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02469 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0246d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02472 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02477 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
0247f 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
02487 90                             nop        
02488 c5f877                         vzeroupper 
0248b e8500cb5ff                     call       0x7f179f9c3660
02490 0f1f84008825001c               nop        dword ptr [rax + rax + 0x1c002588]
02498 bee4ffffff                     mov        esi, 0xffffffe4
0249d 48ff742408                     push       qword ptr [rsp + 8]
024a2 488f0424                       pop        qword ptr [rsp]
024a6 48894424f8                     mov        qword ptr [rsp - 8], rax
024ab 8b442428                       mov        eax, dword ptr [rsp + 0x28]
024af 89442414                       mov        dword ptr [rsp + 0x14], eax
024b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b8 48894424f8                     mov        qword ptr [rsp - 8], rax
024bd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
024c1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
024c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ca 48894424f8                     mov        qword ptr [rsp - 8], rax
024cf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024d3 89442464                       mov        dword ptr [rsp + 0x64], eax
024d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024dc 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
024e1 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
024e6 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
024ee 6690                           nop        
024f0 c5f877                         vzeroupper 
024f3 e8e80bb5ff                     call       0x7f179f9c3660
024f8 0f1f8400f025001d               nop        dword ptr [rax + rax + 0x1d0025f0]
02500 418d6d01                       lea        ebp, [r13 + 1]
02504 bee4ffffff                     mov        esi, 0xffffffe4
02509 48ff742408                     push       qword ptr [rsp + 8]
0250e 488f0424                       pop        qword ptr [rsp]
02512 48894424f8                     mov        qword ptr [rsp - 8], rax
02517 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0251b 89442414                       mov        dword ptr [rsp + 0x14], eax
0251f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02524 48894424f8                     mov        qword ptr [rsp - 8], rax
02529 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0252d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02531 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02536 48894424f8                     mov        qword ptr [rsp - 8], rax
0253b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0253f 89442464                       mov        dword ptr [rsp + 0x64], eax
02543 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02548 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0254d 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02552 48894424f8                     mov        qword ptr [rsp - 8], rax
02557 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0255e 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02562 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02567 90                             nop        
02568 c5f877                         vzeroupper 
0256b e8700bb5ff                     call       0x7f179f9c3660
02570 0f1f84006826001e               nop        dword ptr [rax + rax + 0x1e002668]
02578 bee4ffffff                     mov        esi, 0xffffffe4
0257d 48ff742408                     push       qword ptr [rsp + 8]
02582 488f0424                       pop        qword ptr [rsp]
02586 48894424f8                     mov        qword ptr [rsp - 8], rax
0258b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0258f 89442414                       mov        dword ptr [rsp + 0x14], eax
02593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02598 48894424f8                     mov        qword ptr [rsp - 8], rax
0259d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
025a1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025aa 48894424f8                     mov        qword ptr [rsp - 8], rax
025af 8b442470                       mov        eax, dword ptr [rsp + 0x70]
025b3 89442464                       mov        dword ptr [rsp + 0x64], eax
025b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025bc 4489742470                     mov        dword ptr [rsp + 0x70], r14d
025c1 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
025c6 48894424f8                     mov        qword ptr [rsp - 8], rax
025cb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
025d2 8944247c                       mov        dword ptr [rsp + 0x7c], eax
025d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025db 90                             nop        
025dc c5f877                         vzeroupper 
025df e8fc0ab5ff                     call       0x7f179f9c3660
025e4 0f1f8400dc26001f               nop        dword ptr [rax + rax + 0x1f0026dc]
025ec bee4ffffff                     mov        esi, 0xffffffe4
025f1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025f6 48894424f8                     mov        qword ptr [rsp - 8], rax
025fb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
025ff 89442408                       mov        dword ptr [rsp + 8], eax
02603 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02608 48ff742420                     push       qword ptr [rsp + 0x20]
0260d 488f442418                     pop        qword ptr [rsp + 0x18]
02612 48894424f8                     mov        qword ptr [rsp - 8], rax
02617 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0261b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0261f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02624 48894424f8                     mov        qword ptr [rsp - 8], rax
02629 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0262d 89442434                       mov        dword ptr [rsp + 0x34], eax
02631 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02636 48894424f8                     mov        qword ptr [rsp - 8], rax
0263b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0263f 89442440                       mov        dword ptr [rsp + 0x40], eax
02643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02648 48894424f8                     mov        qword ptr [rsp - 8], rax
0264d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02651 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02655 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0265a 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0265f 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02664 c5f877                         vzeroupper 
02667 e8740ab5ff                     call       0x7f179f9c3660
0266c 0f1f840064270020               nop        dword ptr [rax + rax + 0x20002764]
02674 bee4ffffff                     mov        esi, 0xffffffe4
02679 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0267e 48894424f8                     mov        qword ptr [rsp - 8], rax
02683 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02687 89442408                       mov        dword ptr [rsp + 8], eax
0268b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02690 48ff742420                     push       qword ptr [rsp + 0x20]
02695 488f442418                     pop        qword ptr [rsp + 0x18]
0269a 48894424f8                     mov        qword ptr [rsp - 8], rax
0269f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026a3 8944240c                       mov        dword ptr [rsp + 0xc], eax
026a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ac 48894424f8                     mov        qword ptr [rsp - 8], rax
026b1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
026b5 89442434                       mov        dword ptr [rsp + 0x34], eax
026b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026be 48894424f8                     mov        qword ptr [rsp - 8], rax
026c3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
026c7 89442440                       mov        dword ptr [rsp + 0x40], eax
026cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d0 48894424f8                     mov        qword ptr [rsp - 8], rax
026d5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
026d9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
026dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e2 4489742468                     mov        dword ptr [rsp + 0x68], r14d
026e7 48894424f8                     mov        qword ptr [rsp - 8], rax
026ec 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
026f3 89442470                       mov        dword ptr [rsp + 0x70], eax
026f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026fc 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02704 c5f877                         vzeroupper 
02707 e8d409b5ff                     call       0x7f179f9c3660
0270c 0f1f840004280021               nop        dword ptr [rax + rax + 0x21002804]
02714 bee4ffffff                     mov        esi, 0xffffffe4
02719 48ff742408                     push       qword ptr [rsp + 8]
0271e 488f0424                       pop        qword ptr [rsp]
02722 48894424f8                     mov        qword ptr [rsp - 8], rax
02727 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0272b 89442414                       mov        dword ptr [rsp + 0x14], eax
0272f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02734 48894424f8                     mov        qword ptr [rsp - 8], rax
02739 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0273d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02741 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02746 48894424f8                     mov        qword ptr [rsp - 8], rax
0274b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0274f 89442464                       mov        dword ptr [rsp + 0x64], eax
02753 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02758 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0275d 48894424f8                     mov        qword ptr [rsp - 8], rax
02762 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02769 89442478                       mov        dword ptr [rsp + 0x78], eax
0276d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02772 6690                           nop        
02774 c5f877                         vzeroupper 
02777 e86409b5ff                     call       0x7f179f9c3660
0277c 0f1f840074280022               nop        dword ptr [rax + rax + 0x22002874]
02784 beccffffff                     mov        esi, 0xffffffcc
02789 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0278e 48894424f8                     mov        qword ptr [rsp - 8], rax
02793 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02797 89442408                       mov        dword ptr [rsp + 8], eax
0279b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a0 48ff742420                     push       qword ptr [rsp + 0x20]
027a5 488f442418                     pop        qword ptr [rsp + 0x18]
027aa 48894424f8                     mov        qword ptr [rsp - 8], rax
027af 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027b3 8944240c                       mov        dword ptr [rsp + 0xc], eax
027b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027bc 48894424f8                     mov        qword ptr [rsp - 8], rax
027c1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027c5 89442434                       mov        dword ptr [rsp + 0x34], eax
027c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ce 48894424f8                     mov        qword ptr [rsp - 8], rax
027d3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
027d7 89442440                       mov        dword ptr [rsp + 0x40], eax
027db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e0 48894424f8                     mov        qword ptr [rsp - 8], rax
027e5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
027e9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f2 4489742468                     mov        dword ptr [rsp + 0x68], r14d
027f7 48894424f8                     mov        qword ptr [rsp - 8], rax
027fc 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02803 89442470                       mov        dword ptr [rsp + 0x70], eax
02807 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0280c 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02814 c5f877                         vzeroupper 
02817 e8c408b5ff                     call       0x7f179f9c3660
0281c 0f1f840014290023               nop        dword ptr [rax + rax + 0x23002914]
02824 beccffffff                     mov        esi, 0xffffffcc
02829 48ff742408                     push       qword ptr [rsp + 8]
0282e 488f0424                       pop        qword ptr [rsp]
02832 48894424f8                     mov        qword ptr [rsp - 8], rax
02837 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0283b 89442414                       mov        dword ptr [rsp + 0x14], eax
0283f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02844 48894424f8                     mov        qword ptr [rsp - 8], rax
02849 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0284d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02851 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02856 48894424f8                     mov        qword ptr [rsp - 8], rax
0285b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0285f 89442464                       mov        dword ptr [rsp + 0x64], eax
02863 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02868 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0286d 48894424f8                     mov        qword ptr [rsp - 8], rax
02872 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02879 89442474                       mov        dword ptr [rsp + 0x74], eax
0287d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02882 6690                           nop        
02884 c5f877                         vzeroupper 
02887 e85408b5ff                     call       0x7f179f9c3660
0288c 0f1f840084290024               nop        dword ptr [rax + rax + 0x24002984]
02894 be6effffff                     mov        esi, 0xffffff6e
02899 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0289e 48894424f8                     mov        qword ptr [rsp - 8], rax
028a3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
028a7 89442408                       mov        dword ptr [rsp + 8], eax
028ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b0 48ff742420                     push       qword ptr [rsp + 0x20]
028b5 488f442418                     pop        qword ptr [rsp + 0x18]
028ba 48894424f8                     mov        qword ptr [rsp - 8], rax
028bf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028c3 8944240c                       mov        dword ptr [rsp + 0xc], eax
028c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028cc 48894424f8                     mov        qword ptr [rsp - 8], rax
028d1 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
028d5 89442434                       mov        dword ptr [rsp + 0x34], eax
028d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028de 48894424f8                     mov        qword ptr [rsp - 8], rax
028e3 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028e7 89442438                       mov        dword ptr [rsp + 0x38], eax
028eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f0 48894424f8                     mov        qword ptr [rsp - 8], rax
028f5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
028f9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
028fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02902 48894424f8                     mov        qword ptr [rsp - 8], rax
02907 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0290b 89442460                       mov        dword ptr [rsp + 0x60], eax
0290f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02914 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02919 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0291d 897c247c                       mov        dword ptr [rsp + 0x7c], edi
02921 666690                         nop        
02924 c5f877                         vzeroupper 
02927 e8b407b5ff                     call       0x7f179f9c3660
0292c 0f1f8400242a0025               nop        dword ptr [rax + rax + 0x25002a24]
02934 be45ffffff                     mov        esi, 0xffffff45
02939 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0293e 48894424f8                     mov        qword ptr [rsp - 8], rax
02943 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02947 89442408                       mov        dword ptr [rsp + 8], eax
0294b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02950 48ff742420                     push       qword ptr [rsp + 0x20]
02955 488f442418                     pop        qword ptr [rsp + 0x18]
0295a 48894424f8                     mov        qword ptr [rsp - 8], rax
0295f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02963 8944240c                       mov        dword ptr [rsp + 0xc], eax
02967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0296c 48894424f8                     mov        qword ptr [rsp - 8], rax
02971 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02975 89442438                       mov        dword ptr [rsp + 0x38], eax
02979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297e 48894424f8                     mov        qword ptr [rsp - 8], rax
02983 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02987 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0298b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02990 48894424f8                     mov        qword ptr [rsp - 8], rax
02995 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02999 89442460                       mov        dword ptr [rsp + 0x60], eax
0299d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a2 4489742464                     mov        dword ptr [rsp + 0x64], r14d
029a7 897c2478                       mov        dword ptr [rsp + 0x78], edi
029ab 90                             nop        
029ac c5f877                         vzeroupper 
029af e82c07b5ff                     call       0x7f179f9c3660
029b4 0f1f8400ac2a0026               nop        dword ptr [rax + rax + 0x26002aac]
029bc be3dffffff                     mov        esi, 0xffffff3d
029c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
029c6 48894424f8                     mov        qword ptr [rsp - 8], rax
029cb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
029cf 89442408                       mov        dword ptr [rsp + 8], eax
029d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029d8 48ff742420                     push       qword ptr [rsp + 0x20]
029dd 488f442418                     pop        qword ptr [rsp + 0x18]
029e2 48894424f8                     mov        qword ptr [rsp - 8], rax
029e7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029eb 8944240c                       mov        dword ptr [rsp + 0xc], eax
029ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f4 48894424f8                     mov        qword ptr [rsp - 8], rax
029f9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
029fd 89442438                       mov        dword ptr [rsp + 0x38], eax
02a01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a06 48894424f8                     mov        qword ptr [rsp - 8], rax
02a0b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02a0f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a18 48894424f8                     mov        qword ptr [rsp - 8], rax
02a1d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a21 89442460                       mov        dword ptr [rsp + 0x60], eax
02a25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a2a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02a2f 897c2478                       mov        dword ptr [rsp + 0x78], edi
02a33 90                             nop        
02a34 c5f877                         vzeroupper 
02a37 e8a406b5ff                     call       0x7f179f9c3660
02a3c 0f1f8400342b0027               nop        dword ptr [rax + rax + 0x27002b34]
02a44 bee4ffffff                     mov        esi, 0xffffffe4
02a49 48ff742408                     push       qword ptr [rsp + 8]
02a4e 488f0424                       pop        qword ptr [rsp]
02a52 48894424f8                     mov        qword ptr [rsp - 8], rax
02a57 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a5b 89442414                       mov        dword ptr [rsp + 0x14], eax
02a5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a64 48894424f8                     mov        qword ptr [rsp - 8], rax
02a69 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a6d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a76 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a7f 89442464                       mov        dword ptr [rsp + 0x64], eax
02a83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a88 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02a8d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a92 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02a99 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02a9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aa2 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02aa9 666690                         nop        
02aac c5f877                         vzeroupper 
02aaf e82c06b5ff                     call       0x7f179f9c3660
02ab4 0f1f8400ac2b0028               nop        dword ptr [rax + rax + 0x28002bac]
02abc bee4ffffff                     mov        esi, 0xffffffe4
02ac1 48ff742408                     push       qword ptr [rsp + 8]
02ac6 488f0424                       pop        qword ptr [rsp]
02aca 48894424f8                     mov        qword ptr [rsp - 8], rax
02acf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02ad3 89442414                       mov        dword ptr [rsp + 0x14], eax
02ad7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02adc 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02ae5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ae9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aee 48894424f8                     mov        qword ptr [rsp - 8], rax
02af3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02af7 89442464                       mov        dword ptr [rsp + 0x64], eax
02afb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b00 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02b05 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02b09 666690                         nop        
02b0c c5f877                         vzeroupper 
02b0f e8cc05b5ff                     call       0x7f179f9c3660
02b14 0f1f84000c2c0029               nop        dword ptr [rax + rax + 0x29002c0c]
02b1c beccffffff                     mov        esi, 0xffffffcc
02b21 48ff742408                     push       qword ptr [rsp + 8]
02b26 488f0424                       pop        qword ptr [rsp]
02b2a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b2f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b33 89442414                       mov        dword ptr [rsp + 0x14], eax
02b37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b3c 48894424f8                     mov        qword ptr [rsp - 8], rax
02b41 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02b45 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b4e 48894424f8                     mov        qword ptr [rsp - 8], rax
02b53 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b57 89442464                       mov        dword ptr [rsp + 0x64], eax
02b5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b60 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02b65 48894424f8                     mov        qword ptr [rsp - 8], rax
02b6a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02b71 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02b75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b7a 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
02b82 6690                           nop        
02b84 c5f877                         vzeroupper 
02b87 e85405b5ff                     call       0x7f179f9c3660
02b8c 0f1f8400842c002a               nop        dword ptr [rax + rax + 0x2a002c84]
02b94 beccffffff                     mov        esi, 0xffffffcc
02b99 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b9e 48894424f8                     mov        qword ptr [rsp - 8], rax
02ba3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02ba7 89442408                       mov        dword ptr [rsp + 8], eax
02bab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bb0 48ff742420                     push       qword ptr [rsp + 0x20]
02bb5 488f442418                     pop        qword ptr [rsp + 0x18]
02bba 48894424f8                     mov        qword ptr [rsp - 8], rax
02bbf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02bc3 8944240c                       mov        dword ptr [rsp + 0xc], eax
02bc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bcc 48894424f8                     mov        qword ptr [rsp - 8], rax
02bd1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02bd5 89442434                       mov        dword ptr [rsp + 0x34], eax
02bd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bde 48894424f8                     mov        qword ptr [rsp - 8], rax
02be3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02be7 89442440                       mov        dword ptr [rsp + 0x40], eax
02beb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bf0 48894424f8                     mov        qword ptr [rsp - 8], rax
02bf5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02bf9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02bfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c02 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02c07 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02c0c 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02c14 c5f877                         vzeroupper 
02c17 e8c404b5ff                     call       0x7f179f9c3660
02c1c 0f1f8400142d002b               nop        dword ptr [rax + rax + 0x2b002d14]
02c24 be85ffffff                     mov        esi, 0xffffff85
02c29 48894424f8                     mov        qword ptr [rsp - 8], rax
02c2e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c32 890424                         mov        dword ptr [rsp], eax
02c35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c3a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c3f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c43 89442404                       mov        dword ptr [rsp + 4], eax
02c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c4c 4c896c2408                     mov        qword ptr [rsp + 8], r13
02c51 48894424f8                     mov        qword ptr [rsp - 8], rax
02c56 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02c5a 89442418                       mov        dword ptr [rsp + 0x18], eax
02c5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c63 90                             nop        
02c64 c5f877                         vzeroupper 
02c67 e87404b5ff                     call       0x7f179f9c3660
02c6c 0f1f8400642d002c               nop        dword ptr [rax + rax + 0x2c002d64]
02c74 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
02c7b beccffffff                     mov        esi, 0xffffffcc
02c80 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c85 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02c89 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02c8e 6690                           nop        
02c90 c5f877                         vzeroupper 
02c93 e84804b5ff                     call       0x7f179f9c3660
02c98 0f1f8400902d002d               nop        dword ptr [rax + rax + 0x2d002d90]
02ca0 bee4ffffff                     mov        esi, 0xffffffe4
02ca5 48ff742408                     push       qword ptr [rsp + 8]
02caa 488f0424                       pop        qword ptr [rsp]
02cae 48894424f8                     mov        qword ptr [rsp - 8], rax
02cb3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02cb7 89442414                       mov        dword ptr [rsp + 0x14], eax
02cbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cc0 48894424f8                     mov        qword ptr [rsp - 8], rax
02cc5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02cc9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ccd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cd2 48894424f8                     mov        qword ptr [rsp - 8], rax
02cd7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02cdb 89442464                       mov        dword ptr [rsp + 0x64], eax
02cdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ce4 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02ce9 48894424f8                     mov        qword ptr [rsp - 8], rax
02cee 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02cf5 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02cf9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cfe 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02d02 48894424f8                     mov        qword ptr [rsp - 8], rax
02d07 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02d0e 89442478                       mov        dword ptr [rsp + 0x78], eax
02d12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d17 90                             nop        
02d18 c5f877                         vzeroupper 
02d1b e8c003b5ff                     call       0x7f179f9c3660
02d20 0f1f8400182e002e               nop        dword ptr [rax + rax + 0x2e002e18]
02d28 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02d31 bee4ffffff                     mov        esi, 0xffffffe4
02d36 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d3b 48894424f8                     mov        qword ptr [rsp - 8], rax
02d40 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02d44 89442408                       mov        dword ptr [rsp + 8], eax
02d48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d4d 48ff742420                     push       qword ptr [rsp + 0x20]
02d52 488f442418                     pop        qword ptr [rsp + 0x18]
02d57 48894424f8                     mov        qword ptr [rsp - 8], rax
02d5c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d60 8944240c                       mov        dword ptr [rsp + 0xc], eax
02d64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d69 48894424f8                     mov        qword ptr [rsp - 8], rax
02d6e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02d72 89442434                       mov        dword ptr [rsp + 0x34], eax
02d76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d7b 48894424f8                     mov        qword ptr [rsp - 8], rax
02d80 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02d84 89442440                       mov        dword ptr [rsp + 0x40], eax
02d88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d8d 48894424f8                     mov        qword ptr [rsp - 8], rax
02d92 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02d96 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02d9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d9f 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02da4 48894424f8                     mov        qword ptr [rsp - 8], rax
02da9 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02db0 89442464                       mov        dword ptr [rsp + 0x64], eax
02db4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02db9 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02dbd 89442474                       mov        dword ptr [rsp + 0x74], eax
02dc1 666690                         nop        
02dc4 c5f877                         vzeroupper 
02dc7 e81403b5ff                     call       0x7f179f9c3660
02dcc 0f1f8400c42e002f               nop        dword ptr [rax + rax + 0x2f002ec4]
02dd4 beccffffff                     mov        esi, 0xffffffcc
02dd9 48ff742408                     push       qword ptr [rsp + 8]
02dde 488f0424                       pop        qword ptr [rsp]
02de2 48894424f8                     mov        qword ptr [rsp - 8], rax
02de7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02deb 89442414                       mov        dword ptr [rsp + 0x14], eax
02def 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02df4 48894424f8                     mov        qword ptr [rsp - 8], rax
02df9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02dfd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02e01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e06 48894424f8                     mov        qword ptr [rsp - 8], rax
02e0b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e0f 89442464                       mov        dword ptr [rsp + 0x64], eax
02e13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e18 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02e1d 48894424f8                     mov        qword ptr [rsp - 8], rax
02e22 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02e29 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e32 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02e36 48894424f8                     mov        qword ptr [rsp - 8], rax
02e3b 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02e42 89442478                       mov        dword ptr [rsp + 0x78], eax
02e46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e4b 90                             nop        
02e4c c5f877                         vzeroupper 
02e4f e88c02b5ff                     call       0x7f179f9c3660
02e54 0f1f84004c2f0030               nop        dword ptr [rax + rax + 0x30002f4c]
02e5c beccffffff                     mov        esi, 0xffffffcc
02e61 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02e66 48894424f8                     mov        qword ptr [rsp - 8], rax
02e6b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02e6f 89442408                       mov        dword ptr [rsp + 8], eax
02e73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e78 48ff742420                     push       qword ptr [rsp + 0x20]
02e7d 488f442418                     pop        qword ptr [rsp + 0x18]
02e82 48894424f8                     mov        qword ptr [rsp - 8], rax
02e87 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e8b 8944240c                       mov        dword ptr [rsp + 0xc], eax
02e8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e94 48894424f8                     mov        qword ptr [rsp - 8], rax
02e99 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02e9d 89442438                       mov        dword ptr [rsp + 0x38], eax
02ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ea6 48894424f8                     mov        qword ptr [rsp - 8], rax
02eab 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02eaf 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02eb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eb8 48894424f8                     mov        qword ptr [rsp - 8], rax
02ebd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02ec1 89442460                       mov        dword ptr [rsp + 0x60], eax
02ec5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eca 48894424f8                     mov        qword ptr [rsp - 8], rax
02ecf 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02ed6 89442468                       mov        dword ptr [rsp + 0x68], eax
02eda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02edf 48894424f8                     mov        qword ptr [rsp - 8], rax
02ee4 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02ee8 89442478                       mov        dword ptr [rsp + 0x78], eax
02eec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
02ef6 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02efd 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f06 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02f0e 6690                           nop        
02f10 c5f877                         vzeroupper 
02f13 e8c801b5ff                     call       0x7f179f9c3660
02f18 0f1f840010300031               nop        dword ptr [rax + rax + 0x31003010]
02f20 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02f29 beccffffff                     mov        esi, 0xffffffcc
02f2e 48ff742408                     push       qword ptr [rsp + 8]
02f33 488f0424                       pop        qword ptr [rsp]
02f37 48894424f8                     mov        qword ptr [rsp - 8], rax
02f3c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02f40 89442414                       mov        dword ptr [rsp + 0x14], eax
02f44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f49 48894424f8                     mov        qword ptr [rsp - 8], rax
02f4e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02f52 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02f56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f5b 48894424f8                     mov        qword ptr [rsp - 8], rax
02f60 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02f64 89442464                       mov        dword ptr [rsp + 0x64], eax
02f68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f6d 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02f72 48894424f8                     mov        qword ptr [rsp - 8], rax
02f77 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02f7e 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02f82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f87 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02f8b 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02f8f 90                             nop        
02f90 c5f877                         vzeroupper 
02f93 e84801b5ff                     call       0x7f179f9c3660
02f98 0f1f840090300032               nop        dword ptr [rax + rax + 0x32003090]
02fa0 8be8                           mov        ebp, eax
02fa2 83c510                         add        ebp, 0x10
02fa5 be6effffff                     mov        esi, 0xffffff6e
02faa 48ff742408                     push       qword ptr [rsp + 8]
02faf 488f0424                       pop        qword ptr [rsp]
02fb3 48894424f8                     mov        qword ptr [rsp - 8], rax
02fb8 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02fbc 89442414                       mov        dword ptr [rsp + 0x14], eax
02fc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fc5 89442438                       mov        dword ptr [rsp + 0x38], eax
02fc9 48894424f8                     mov        qword ptr [rsp - 8], rax
02fce 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02fd2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02fd6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fdb 48894424f8                     mov        qword ptr [rsp - 8], rax
02fe0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02fe4 89442464                       mov        dword ptr [rsp + 0x64], eax
02fe8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fed 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02ff2 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02ff6 6690                           nop        
02ff8 c5f877                         vzeroupper 
02ffb e8e000b5ff                     call       0x7f179f9c3660
03000 0f1f8400f8300033               nop        dword ptr [rax + rax + 0x330030f8]
03008 8be8                           mov        ebp, eax
0300a 83c510                         add        ebp, 0x10
0300d be66ffffff                     mov        esi, 0xffffff66
03012 48ff742408                     push       qword ptr [rsp + 8]
03017 488f0424                       pop        qword ptr [rsp]
0301b 48894424f8                     mov        qword ptr [rsp - 8], rax
03020 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03024 89442414                       mov        dword ptr [rsp + 0x14], eax
03028 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0302d 89442438                       mov        dword ptr [rsp + 0x38], eax
03031 48894424f8                     mov        qword ptr [rsp - 8], rax
03036 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0303a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0303e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03043 48894424f8                     mov        qword ptr [rsp - 8], rax
03048 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0304c 89442464                       mov        dword ptr [rsp + 0x64], eax
03050 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03055 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0305a 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0305e 6690                           nop        
03060 c5f877                         vzeroupper 
03063 e87800b5ff                     call       0x7f179f9c3660
03068 0f1f840060310034               nop        dword ptr [rax + rax + 0x34003160]
03070 bee4ffffff                     mov        esi, 0xffffffe4
03075 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0307a 48894424f8                     mov        qword ptr [rsp - 8], rax
0307f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03083 89442408                       mov        dword ptr [rsp + 8], eax
03087 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0308c 48ff742420                     push       qword ptr [rsp + 0x20]
03091 488f442418                     pop        qword ptr [rsp + 0x18]
03096 48894424f8                     mov        qword ptr [rsp - 8], rax
0309b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0309f 8944240c                       mov        dword ptr [rsp + 0xc], eax
030a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030a8 48894424f8                     mov        qword ptr [rsp - 8], rax
030ad 8b442440                       mov        eax, dword ptr [rsp + 0x40]
030b1 89442434                       mov        dword ptr [rsp + 0x34], eax
030b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030ba 48894424f8                     mov        qword ptr [rsp - 8], rax
030bf 8b442448                       mov        eax, dword ptr [rsp + 0x48]
030c3 89442440                       mov        dword ptr [rsp + 0x40], eax
030c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030cc 48894424f8                     mov        qword ptr [rsp - 8], rax
030d1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
030d5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
030d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030de 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
030e3 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
030eb 90                             nop        
030ec c5f877                         vzeroupper 
030ef e8ecffb4ff                     call       0x7f179f9c3660
030f4 0f1f8400ec310035               nop        dword ptr [rax + rax + 0x350031ec]
030fc bee4ffffff                     mov        esi, 0xffffffe4
03101 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03106 48894424f8                     mov        qword ptr [rsp - 8], rax
0310b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0310f 89442408                       mov        dword ptr [rsp + 8], eax
03113 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03118 48ff742420                     push       qword ptr [rsp + 0x20]
0311d 488f442418                     pop        qword ptr [rsp + 0x18]
03122 48894424f8                     mov        qword ptr [rsp - 8], rax
03127 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0312b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0312f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03134 48894424f8                     mov        qword ptr [rsp - 8], rax
03139 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0313d 89442434                       mov        dword ptr [rsp + 0x34], eax
03141 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03146 48894424f8                     mov        qword ptr [rsp - 8], rax
0314b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0314f 89442440                       mov        dword ptr [rsp + 0x40], eax
03153 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03158 48894424f8                     mov        qword ptr [rsp - 8], rax
0315d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03161 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03165 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0316a 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0316f 90                             nop        
03170 c5f877                         vzeroupper 
03173 e868ffb4ff                     call       0x7f179f9c3660
03178 0f1f840070320036               nop        dword ptr [rax + rax + 0x36003270]
03180 beccffffff                     mov        esi, 0xffffffcc
03185 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0318a 48894424f8                     mov        qword ptr [rsp - 8], rax
0318f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03193 89442408                       mov        dword ptr [rsp + 8], eax
03197 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0319c 48ff742420                     push       qword ptr [rsp + 0x20]
031a1 488f442418                     pop        qword ptr [rsp + 0x18]
031a6 48894424f8                     mov        qword ptr [rsp - 8], rax
031ab 8b442428                       mov        eax, dword ptr [rsp + 0x28]
031af 8944240c                       mov        dword ptr [rsp + 0xc], eax
031b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031b8 48894424f8                     mov        qword ptr [rsp - 8], rax
031bd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
031c1 89442434                       mov        dword ptr [rsp + 0x34], eax
031c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031ca 48894424f8                     mov        qword ptr [rsp - 8], rax
031cf 8b442448                       mov        eax, dword ptr [rsp + 0x48]
031d3 89442440                       mov        dword ptr [rsp + 0x40], eax
031d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031dc 48894424f8                     mov        qword ptr [rsp - 8], rax
031e1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
031e5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
031e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031ee 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
031f3 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
031fb 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
03203 90                             nop        
03204 c5f877                         vzeroupper 
03207 e8d4feb4ff                     call       0x7f179f9c3660
0320c 0f1f840004330037               nop        dword ptr [rax + rax + 0x37003304]
03214 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
03219 458d5a08                       lea        r11d, [r10 + 8]
0321d 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
03222 be6effffff                     mov        esi, 0xffffff6e
03227 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0322c 48894424f8                     mov        qword ptr [rsp - 8], rax
03231 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03235 89442408                       mov        dword ptr [rsp + 8], eax
03239 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0323e 48ff742420                     push       qword ptr [rsp + 0x20]
03243 488f442418                     pop        qword ptr [rsp + 0x18]
03248 48894424f8                     mov        qword ptr [rsp - 8], rax
0324d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03251 8944240c                       mov        dword ptr [rsp + 0xc], eax
03255 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0325a 48894424f8                     mov        qword ptr [rsp - 8], rax
0325f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03263 89442434                       mov        dword ptr [rsp + 0x34], eax
03267 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0326c 48894424f8                     mov        qword ptr [rsp - 8], rax
03271 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03275 89442440                       mov        dword ptr [rsp + 0x40], eax
03279 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0327e 48894424f8                     mov        qword ptr [rsp - 8], rax
03283 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
0328a 89442460                       mov        dword ptr [rsp + 0x60], eax
0328e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03293 90                             nop        
03294 c5f877                         vzeroupper 
03297 e844feb4ff                     call       0x7f179f9c3660
0329c 0f1f840094330038               nop        dword ptr [rax + rax + 0x38003394]
032a4 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
032a9 458d5a08                       lea        r11d, [r10 + 8]
032ad 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
032b2 be66ffffff                     mov        esi, 0xffffff66
032b7 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
032bc 48894424f8                     mov        qword ptr [rsp - 8], rax
032c1 8b442410                       mov        eax, dword ptr [rsp + 0x10]
032c5 89442408                       mov        dword ptr [rsp + 8], eax
032c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032ce 48ff742420                     push       qword ptr [rsp + 0x20]
032d3 488f442418                     pop        qword ptr [rsp + 0x18]
032d8 48894424f8                     mov        qword ptr [rsp - 8], rax
032dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
032e1 8944240c                       mov        dword ptr [rsp + 0xc], eax
032e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032ea 48894424f8                     mov        qword ptr [rsp - 8], rax
032ef 8b442440                       mov        eax, dword ptr [rsp + 0x40]
032f3 89442434                       mov        dword ptr [rsp + 0x34], eax
032f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032fc 48894424f8                     mov        qword ptr [rsp - 8], rax
03301 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03305 89442440                       mov        dword ptr [rsp + 0x40], eax
03309 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0330e 895c2464                       mov        dword ptr [rsp + 0x64], ebx
03312 6690                           nop        
03314 c5f877                         vzeroupper 
03317 e8c4fdb4ff                     call       0x7f179f9c3660
0331c 0f1f840014340039               nop        dword ptr [rax + rax + 0x39003414]
03324 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
0332c e9a8deffff                     jmp        0x7f179fe71759
03331 bee4ffffff                     mov        esi, 0xffffffe4
03336 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0333b 48894424f8                     mov        qword ptr [rsp - 8], rax
03340 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03344 89442408                       mov        dword ptr [rsp + 8], eax
03348 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0334d 48ff742420                     push       qword ptr [rsp + 0x20]
03352 488f442418                     pop        qword ptr [rsp + 0x18]
03357 48894424f8                     mov        qword ptr [rsp - 8], rax
0335c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03360 8944240c                       mov        dword ptr [rsp + 0xc], eax
03364 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03369 48894424f8                     mov        qword ptr [rsp - 8], rax
0336e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03372 89442434                       mov        dword ptr [rsp + 0x34], eax
03376 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0337b 48894424f8                     mov        qword ptr [rsp - 8], rax
03380 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03384 89442440                       mov        dword ptr [rsp + 0x40], eax
03388 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0338d 48894424f8                     mov        qword ptr [rsp - 8], rax
03392 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03396 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0339a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0339f 4489742464                     mov        dword ptr [rsp + 0x64], r14d
033a4 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
033a9 666690                         nop        
033ac c5f877                         vzeroupper 
033af e82cfdb4ff                     call       0x7f179f9c3660
033b4 0f1f8400ac34003a               nop        dword ptr [rax + rax + 0x3a0034ac]
033bc c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
033c5 bee4ffffff                     mov        esi, 0xffffffe4
033ca 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
033cf 48894424f8                     mov        qword ptr [rsp - 8], rax
033d4 8b442410                       mov        eax, dword ptr [rsp + 0x10]
033d8 89442408                       mov        dword ptr [rsp + 8], eax
033dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033e1 48ff742420                     push       qword ptr [rsp + 0x20]
033e6 488f442418                     pop        qword ptr [rsp + 0x18]
033eb 48894424f8                     mov        qword ptr [rsp - 8], rax
033f0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
033f4 8944240c                       mov        dword ptr [rsp + 0xc], eax
033f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033fd 48894424f8                     mov        qword ptr [rsp - 8], rax
03402 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03406 89442434                       mov        dword ptr [rsp + 0x34], eax
0340a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0340f 48894424f8                     mov        qword ptr [rsp - 8], rax
03414 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03418 89442440                       mov        dword ptr [rsp + 0x40], eax
0341c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03421 48894424f8                     mov        qword ptr [rsp - 8], rax
03426 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0342a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0342e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03433 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
03438 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0343d 666690                         nop        
03440 c5f877                         vzeroupper 
03443 e898fcb4ff                     call       0x7f179f9c3660
03448 0f1f84004035003b               nop        dword ptr [rax + rax + 0x3b003540]
03450 beccffffff                     mov        esi, 0xffffffcc
03455 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0345a 48894424f8                     mov        qword ptr [rsp - 8], rax
0345f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03463 89442408                       mov        dword ptr [rsp + 8], eax
03467 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0346c 48ff742420                     push       qword ptr [rsp + 0x20]
03471 488f442418                     pop        qword ptr [rsp + 0x18]
03476 48894424f8                     mov        qword ptr [rsp - 8], rax
0347b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0347f 8944240c                       mov        dword ptr [rsp + 0xc], eax
03483 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03488 48894424f8                     mov        qword ptr [rsp - 8], rax
0348d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03491 89442434                       mov        dword ptr [rsp + 0x34], eax
03495 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0349a 48894424f8                     mov        qword ptr [rsp - 8], rax
0349f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
034a3 89442440                       mov        dword ptr [rsp + 0x40], eax
034a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034ac 48894424f8                     mov        qword ptr [rsp - 8], rax
034b1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
034b5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
034b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034be 4489742464                     mov        dword ptr [rsp + 0x64], r14d
034c3 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
034c8 4489542478                     mov        dword ptr [rsp + 0x78], r10d
034cd 666690                         nop        
034d0 c5f877                         vzeroupper 
034d3 e808fcb4ff                     call       0x7f179f9c3660
034d8 0f1f8400d035003c               nop        dword ptr [rax + rax + 0x3c0035d0]
034e0 4183c510                       add        r13d, 0x10
034e4 be6effffff                     mov        esi, 0xffffff6e
034e9 48ff742408                     push       qword ptr [rsp + 8]
034ee 488f0424                       pop        qword ptr [rsp]
034f2 48894424f8                     mov        qword ptr [rsp - 8], rax
034f7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
034fb 89442414                       mov        dword ptr [rsp + 0x14], eax
034ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03504 48894424f8                     mov        qword ptr [rsp - 8], rax
03509 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0350d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03511 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03516 48894424f8                     mov        qword ptr [rsp - 8], rax
0351b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0351f 89442464                       mov        dword ptr [rsp + 0x64], eax
03523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03528 48894424f8                     mov        qword ptr [rsp - 8], rax
0352d 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
03534 89442468                       mov        dword ptr [rsp + 0x68], eax
03538 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0353d 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
03542 6690                           nop        
03544 c5f877                         vzeroupper 
03547 e894fbb4ff                     call       0x7f179f9c3660
0354c 0f1f84004436003d               nop        dword ptr [rax + rax + 0x3d003644]
03554 4183c510                       add        r13d, 0x10
03558 be66ffffff                     mov        esi, 0xffffff66
0355d 48ff742408                     push       qword ptr [rsp + 8]
03562 488f0424                       pop        qword ptr [rsp]
03566 48894424f8                     mov        qword ptr [rsp - 8], rax
0356b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0356f 89442414                       mov        dword ptr [rsp + 0x14], eax
03573 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03578 48894424f8                     mov        qword ptr [rsp - 8], rax
0357d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03581 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03585 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0358a 48894424f8                     mov        qword ptr [rsp - 8], rax
0358f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03593 89442464                       mov        dword ptr [rsp + 0x64], eax
03597 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0359c 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
035a1 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
035a6 6690                           nop        
035a8 c5f877                         vzeroupper 
035ab e830fbb4ff                     call       0x7f179f9c3660
035b0 0f1f8400a836003e               nop        dword ptr [rax + rax + 0x3e0036a8]
035b8 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
035c0 e945ecffff                     jmp        0x7f179fe7278a
035c5 bef6ffffff                     mov        esi, 0xfffffff6
035ca 6690                           nop        
035cc c5f877                         vzeroupper 
035cf e80cfbb4ff                     call       0x7f179f9c3660
035d4 0f1f8400cc36003f               nop        dword ptr [rax + rax + 0x3f0036cc]
035dc bef6ffffff                     mov        esi, 0xfffffff6
035e1 666690                         nop        
035e4 c5f877                         vzeroupper 
035e7 e8f4fab4ff                     call       0x7f179f9c3660
035ec 0f1f8400e4360040               nop        dword ptr [rax + rax + 0x400036e4]
035f4 bef6ffffff                     mov        esi, 0xfffffff6
035f9 666690                         nop        
035fc c5f877                         vzeroupper 
035ff e8dcfab4ff                     call       0x7f179f9c3660
03604 0f1f8400fc360041               nop        dword ptr [rax + rax + 0x410036fc]
0360c bef6ffffff                     mov        esi, 0xfffffff6
03611 666690                         nop        
03614 c5f877                         vzeroupper 
03617 e8c4fab4ff                     call       0x7f179f9c3660
0361c 0f1f840014370042               nop        dword ptr [rax + rax + 0x42003714]
03624 bef6ffffff                     mov        esi, 0xfffffff6
03629 8bef                           mov        ebp, edi
0362b 90                             nop        
0362c c5f877                         vzeroupper 
0362f e8acfab4ff                     call       0x7f179f9c3660
03634 0f1f84002c370043               nop        dword ptr [rax + rax + 0x4300372c]
0363c bef6ffffff                     mov        esi, 0xfffffff6
03641 666690                         nop        
03644 c5f877                         vzeroupper 
03647 e894fab4ff                     call       0x7f179f9c3660
0364c 0f1f840044370044               nop        dword ptr [rax + rax + 0x44003744]
03654 bef6ffffff                     mov        esi, 0xfffffff6
03659 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0365e 6690                           nop        
03660 c5f877                         vzeroupper 
03663 e878fab4ff                     call       0x7f179f9c3660
03668 0f1f840060370045               nop        dword ptr [rax + rax + 0x45003760]
03670 bef6ffffff                     mov        esi, 0xfffffff6
03675 4489542408                     mov        dword ptr [rsp + 8], r10d
0367a 6690                           nop        
0367c c5f877                         vzeroupper 
0367f e85cfab4ff                     call       0x7f179f9c3660
03684 0f1f84007c370046               nop        dword ptr [rax + rax + 0x4600377c]
0368c bef6ffffff                     mov        esi, 0xfffffff6
03691 666690                         nop        
03694 c5f877                         vzeroupper 
03697 e844fab4ff                     call       0x7f179f9c3660
0369c 0f1f840094370047               nop        dword ptr [rax + rax + 0x47003794]
036a4 bef6ffffff                     mov        esi, 0xfffffff6
036a9 448974240c                     mov        dword ptr [rsp + 0xc], r14d
036ae 6690                           nop        
036b0 c5f877                         vzeroupper 
036b3 e828fab4ff                     call       0x7f179f9c3660
036b8 0f1f8400b0370048               nop        dword ptr [rax + rax + 0x480037b0]
036c0 bef6ffffff                     mov        esi, 0xfffffff6
036c5 666690                         nop        
036c8 c5f877                         vzeroupper 
036cb e810fab4ff                     call       0x7f179f9c3660
036d0 0f1f8400c8370049               nop        dword ptr [rax + rax + 0x490037c8]
036d8 bef6ffffff                     mov        esi, 0xfffffff6
036dd 4489742408                     mov        dword ptr [rsp + 8], r14d
036e2 6690                           nop        
036e4 c5f877                         vzeroupper 
036e7 e8f4f9b4ff                     call       0x7f179f9c3660
036ec 0f1f8400e437004a               nop        dword ptr [rax + rax + 0x4a0037e4]
036f4 bef6ffffff                     mov        esi, 0xfffffff6
036f9 666690                         nop        
036fc c5f877                         vzeroupper 
036ff e8dcf9b4ff                     call       0x7f179f9c3660
03704 0f1f8400fc37004b               nop        dword ptr [rax + rax + 0x4b0037fc]
0370c 49bafe13e79f177f0000           movabs     r10, 0x7f179fe713fe
03716 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0371d e93ea2a8ff                     jmp        0x7f179f8fdee0
03722 e8f96da7ff                     call       0x7f179f8eaaa0
03727 e902c9ffff                     jmp        0x7f179fe705ae
0372c f4                             hlt        
0372d f4                             hlt        
0372e f4                             hlt        
0372f f4                             hlt        
