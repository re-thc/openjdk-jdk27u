00000 e8bbd59416                     call       0x7f1e967d5740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85b0450000                   jne        0x7f1e7fe8c75e
0002e 488b9e40010000                 mov        rbx, qword ptr [rsi + 0x140]
00035 4c8bae38010000                 mov        r13, qword ptr [rsi + 0x138]
0003c 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
00040 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00045 4c8bb628010000                 mov        r14, qword ptr [rsi + 0x128]
0004c 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00053 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00058 488bae08010000                 mov        rbp, qword ptr [rsi + 0x108]
0005f 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00066 4c89542408                     mov        qword ptr [rsp + 8], r10
0006b 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00072 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00077 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0007e 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00083 448b96f8000000                 mov        r10d, dword ptr [rsi + 0xf8]
0008a 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00092 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
00099 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0009e 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
000aa 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b1 4c89542450                     mov        qword ptr [rsp + 0x50], r10
000b6 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000bd 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000c2 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000c9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
000ce 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d2 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000d7 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000db 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000e0 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000e7 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
000ec 488bfe                         mov        rdi, rsi
000ef c5f877                         vzeroupper 
000f2 49ba00478b961e7f0000           movabs     r10, 0x7f1e968b4700
000fc 41ffd2                         call       r10
000ff 0f1f840000000000               nop        dword ptr [rax + rax]
00107 4885db                         test       rbx, rbx
0010a 0f844c230000                   je         0x7f1e7fe8a5dc
00110 448b5304                       mov        r10d, dword ptr [rbx + 4]
00114 41c1ea0a                       shr        r10d, 0xa
00118 4181fa0c080000                 cmp        r10d, 0x80c
0011f 0f85fb340000                   jne        0x7f1e7fe8b7a0
00125 4c8bd3                         mov        r10, rbx
00128 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0012d 4d85ed                         test       r13, r13
00130 0f8433230000                   je         0x7f1e7fe8a5e9
00136 458b5d04                       mov        r11d, dword ptr [r13 + 4]
0013a 41c1eb0a                       shr        r11d, 0xa
0013e 4181fb05020000                 cmp        r11d, 0x205
00145 0f85d5340000                   jne        0x7f1e7fe8b7a0
0014b 4d8bd5                         mov        r10, r13
0014e 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00156 4d85f6                         test       r14, r14
00159 0f841a230000                   je         0x7f1e7fe8a5f9
0015f 458b5604                       mov        r10d, dword ptr [r14 + 4]
00163 41c1ea0a                       shr        r10d, 0xa
00167 4181fa08020000                 cmp        r10d, 0x208
0016e 0f85ac340000                   jne        0x7f1e7fe8b7a0
00174 4d8bd6                         mov        r10, r14
00177 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0017f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00184 4d85d2                         test       r10, r10
00187 0f84fc220000                   je         0x7f1e7fe8a609
0018d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00191 41c1eb0a                       shr        r11d, 0xa
00195 4181fb07020000                 cmp        r11d, 0x207
0019c 0f857e340000                   jne        0x7f1e7fe8b7a0
001a2 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001a7 4885ed                         test       rbp, rbp
001aa 0f84e6220000                   je         0x7f1e7fe8a616
001b0 448b5504                       mov        r10d, dword ptr [rbp + 4]
001b4 41c1ea0a                       shr        r10d, 0xa
001b8 4181fa07020000                 cmp        r10d, 0x207
001bf 0f855b340000                   jne        0x7f1e7fe8b7a0
001c5 4c8bd5                         mov        r10, rbp
001c8 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
001d0 4c8b542408                     mov        r10, qword ptr [rsp + 8]
001d5 4d85d2                         test       r10, r10
001d8 0f84c8220000                   je         0x7f1e7fe8a626
001de 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001e2 41c1eb0a                       shr        r11d, 0xa
001e6 4181fb05020000                 cmp        r11d, 0x205
001ed 0f852d340000                   jne        0x7f1e7fe8b7a0
001f3 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001fb e9c8040000                     jmp        0x7f1e7fe88848
00200 448bdd                         mov        r11d, ebp
00203 4d63d3                         movsxd     r10, r11d
00206 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0020d c442a8f5db                     bzhi       r11, r11, r10
00212 c4c1fb92fb                     kmovq      k7, r11
00217 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0021d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00223 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0022b 4403dd                         add        r11d, ebp
0022e 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00236 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0023a 418502                         test       dword ptr [r10], eax
0023d 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00245 0f8d09080000                   jge        0x7f1e7fe88bd4
0024b 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
00250 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00255 442b9c24a8000000               sub        r11d, dword ptr [rsp + 0xa8]
0025d 8bac248c000000                 mov        ebp, dword ptr [rsp + 0x8c]
00264 2bac24a8000000                 sub        ebp, dword ptr [rsp + 0xa8]
0026b 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00272 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
0027a 410f4fed                       cmovg      ebp, r13d
0027e 4585db                         test       r11d, r11d
00281 0f8c492d0000                   jl         0x7f1e7fe8b150
00287 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0028c 4585d2                         test       r10d, r10d
0028f 0f8c3b2d0000                   jl         0x7f1e7fe8b150
00295 458d142b                       lea        r10d, [r11 + rbp]
00299 413bda                         cmp        ebx, r10d
0029c 0f822e2d0000                   jb         0x7f1e7fe8b150
002a2 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
002a7 4403ed                         add        r13d, ebp
002aa 413bdd                         cmp        ebx, r13d
002ad 0f821d2d0000                   jb         0x7f1e7fe8b150
002b3 85ed                           test       ebp, ebp
002b5 0f8c152d0000                   jl         0x7f1e7fe8b150
002bb 85ed                           test       ebp, ebp
002bd 0f8460ffffff                   je         0x7f1e7fe883a3
002c3 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002c8 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
002d0 4b8d74100c                     lea        rsi, [r8 + r10 + 0xc]
002d5 4b8d7c180c                     lea        rdi, [r8 + r11 + 0xc]
002da 4863d5                         movsxd     rdx, ebp
002dd 4883fa20                       cmp        rdx, 0x20
002e1 0f8619ffffff                   jbe        0x7f1e7fe88380
002e7 c5f877                         vzeroupper 
002ea 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
002f4 41ffd2                         call       r10
002f7 0f1f840000000000               nop        dword ptr [rax + rax]
002ff e91fffffff                     jmp        0x7f1e7fe883a3
00304 48894424f8                     mov        qword ptr [rsp - 8], rax
00309 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0030d 89442448                       mov        dword ptr [rsp + 0x48], eax
00311 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00316 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
0031d 85c9                           test       ecx, ecx
0031f 0f8e77180000                   jle        0x7f1e7fe89d1c
00325 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0032d 4403db                         add        r11d, ebx
00330 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
00335 0f8fd5190000                   jg         0x7f1e7fe89e90
0033b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00340 4503de                         add        r11d, r14d
00343 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
0034b 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00350 0f8f621a0000                   jg         0x7f1e7fe89f38
00356 4183fe10                       cmp        r14d, 0x10
0035a 0f8f9d070000                   jg         0x7f1e7fe88c7d
00360 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
00368 448b5308                       mov        r10d, dword ptr [rbx + 8]
0036c 458d42f1                       lea        r8d, [r10 - 0xf]
00370 4585c0                         test       r8d, r8d
00373 0f8c0f130000                   jl         0x7f1e7fe89808
00379 4183c2f1                       add        r10d, -0xf
0037d 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
00381 413bda                         cmp        ebx, r10d
00384 0f8312110000                   jae        0x7f1e7fe8961c
0038a 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
00392 448b4308                       mov        r8d, dword ptr [rbx + 8]
00396 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
0039a 4c8bac2480000000               mov        r13, qword ptr [rsp + 0x80]
003a2 c4c17a6f441d0c                 vmovdqu    xmm0, xmmword ptr [r13 + rbx + 0xc]
003a9 458d50f1                       lea        r10d, [r8 - 0xf]
003ad 4585d2                         test       r10d, r10d
003b0 0f8cae130000                   jl         0x7f1e7fe898e4
003b6 4183c0f1                       add        r8d, -0xf
003ba 448bac2488000000               mov        r13d, dword ptr [rsp + 0x88]
003c2 453be8                         cmp        r13d, r8d
003c5 0f83ad110000                   jae        0x7f1e7fe896f8
003cb 458d2c1e                       lea        r13d, [r14 + rbx]
003cf 4489ac24ac000000               mov        dword ptr [rsp + 0xac], r13d
003d7 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
003de 4c8bac24a0000000               mov        r13, qword ptr [rsp + 0xa0]
003e6 c4c17a7f441d0c                 vmovdqu    xmmword ptr [r13 + rbx + 0xc], xmm0
003ed 4403f3                         add        r14d, ebx
003f0 458bee                         mov        r13d, r14d
003f3 442bac24a8000000               sub        r13d, dword ptr [rsp + 0xa8]
003fb 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00403 418b5b08                       mov        ebx, dword ptr [r11 + 8]
00407 448d53f1                       lea        r10d, [rbx - 0xf]
0040b 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
00413 4183f910                       cmp        r9d, 0x10
00417 7f43                           jg         0x7f1e7fe885dc
00419 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00421 4183f810                       cmp        r8d, 0x10
00425 7c35                           jl         0x7f1e7fe885dc
00427 4585d2                         test       r10d, r10d
0042a 0f8cac160000                   jl         0x7f1e7fe89c5c
00430 83c3f1                         add        ebx, -0xf
00433 443beb                         cmp        r13d, ebx
00436 0f8310150000                   jae        0x7f1e7fe89acc
0043c c4817a6f442b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r13 + 0xc]
00443 443bf3                         cmp        r14d, ebx
00446 0f83bc150000                   jae        0x7f1e7fe89b88
0044c c4817a7f44330c                 vmovdqu    xmmword ptr [r11 + r14 + 0xc], xmm0
00453 438d1c31                       lea        ebx, [r9 + r14]
00457 e93c020000                     jmp        0x7f1e7fe88818
0045c 448d43f9                       lea        r8d, [rbx - 7]
00460 4b8d7c2b0c                     lea        rdi, [r11 + r13 + 0xc]
00465 438d0c31                       lea        ecx, [r9 + r14]
00469 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00470 4b8d74330c                     lea        rsi, [r11 + r14 + 0xc]
00475 4863d1                         movsxd     rdx, ecx
00478 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00480 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00488 0f8c71040000                   jl         0x7f1e7fe88a7f
0048e 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
00496 4183f930                       cmp        r9d, 0x30
0049a 0f8e80000000                   jle        0x7f1e7fe886a0
004a0 4585ed                         test       r13d, r13d
004a3 0f8c0d200000                   jl         0x7f1e7fe8a636
004a9 4585f6                         test       r14d, r14d
004ac 0f8c04200000                   jl         0x7f1e7fe8a636
004b2 478d0429                       lea        r8d, [r9 + r13]
004b6 413bd8                         cmp        ebx, r8d
004b9 0f82f71f0000                   jb         0x7f1e7fe8a636
004bf 3bd9                           cmp        ebx, ecx
004c1 0f82ef1f0000                   jb         0x7f1e7fe8a636
004c7 418bd9                         mov        ebx, r9d
004ca 85db                           test       ebx, ebx
004cc 0f84bb010000                   je         0x7f1e7fe8880d
004d2 4863d3                         movsxd     rdx, ebx
004d5 4883fa20                       cmp        rdx, 0x20
004d9 7728                           ja         0x7f1e7fe88683
004db 448bc3                         mov        r8d, ebx
004de 4d63d0                         movsxd     r10, r8d
004e1 49c7c0ffffffff                 mov        r8, 0xffffffffffffffff
004e8 c442a8f5c0                     bzhi       r8, r8, r10
004ed c4c1fb92f8                     kmovq      k7, r8
004f2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004f8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004fe e98a010000                     jmp        0x7f1e7fe8880d
00503 c5f877                         vzeroupper 
00506 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00510 41ffd2                         call       r10
00513 0f1f840000000000               nop        dword ptr [rax + rax]
0051b e96d010000                     jmp        0x7f1e7fe8880d
00520 4585c0                         test       r8d, r8d
00523 0f8c831c0000                   jl         0x7f1e7fe8a32c
00529 448d43f9                       lea        r8d, [rbx - 7]
0052d 453be8                         cmp        r13d, r8d
00530 0f83861a0000                   jae        0x7f1e7fe8a13c
00536 4963cd                         movsxd     rcx, r13d
00539 4d8b540b0c                     mov        r10, qword ptr [r11 + rcx + 0xc]
0053e 453bf0                         cmp        r14d, r8d
00541 0f83651b0000                   jae        0x7f1e7fe8a22c
00547 458bce                         mov        r9d, r14d
0054a 418d7908                       lea        edi, [r9 + 8]
0054e 4963f1                         movsxd     rsi, r9d
00551 4d8954330c                     mov        qword ptr [r11 + rsi + 0xc], r10
00556 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
0055d 0f8d2a010000                   jge        0x7f1e7fe8880d
00563 482bce                         sub        rcx, rsi
00566 4863f3                         movsxd     rsi, ebx
00569 4883c6f9                       add        rsi, -7
0056d 4863df                         movsxd     rbx, edi
00570 4c8d140b                       lea        r10, [rbx + rcx]
00574 4c3bd6                         cmp        r10, rsi
00577 0f831f1d0000                   jae        0x7f1e7fe8a41c
0057d 4c8bd2                         mov        r10, rdx
00580 4c2bd3                         sub        r10, rbx
00583 4983c207                       add        r10, 7
00587 4983e2f8                       and        r10, 0xfffffffffffffff8
0058b 418bda                         mov        ebx, r10d
0058e 468d540b08                     lea        r10d, [rbx + r9 + 8]
00593 4d63d2                         movsxd     r10, r10d
00596 498d4c0af8                     lea        rcx, [r10 + rcx - 8]
0059b 483bce                         cmp        rcx, rsi
0059e 0f83f81c0000                   jae        0x7f1e7fe8a41c
005a4 413bf8                         cmp        edi, r8d
005a7 0f83ef1c0000                   jae        0x7f1e7fe8a41c
005ad 4983c2f8                       add        r10, -8
005b1 4c3bd6                         cmp        r10, rsi
005b4 0f83e21c0000                   jae        0x7f1e7fe8a41c
005ba 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
005c1 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005c7 0f8fb71d0000                   jg         0x7f1e7fe8a504
005cd 452be9                         sub        r13d, r9d
005d0 4183c110                       add        r9d, 0x10
005d4 448bd7                         mov        r10d, edi
005d7 468d1c2f                       lea        r11d, [rdi + r13]
005db 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
005e3 4e8b5c1b0c                     mov        r11, qword ptr [rbx + r11 + 0xc]
005e8 4e895c130c                     mov        qword ptr [rbx + r10 + 0xc], r11
005ed 83c708                         add        edi, 8
005f0 413bf9                         cmp        edi, r9d
005f3 7cdf                           jl         0x7f1e7fe88754
005f5 4883c2f8                       add        rdx, -8
005f9 4881fa00000080                 cmp        rdx, -0x80000000
00600 49c7c200000080                 mov        r10, 0xffffffff80000000
00607 490f4cd2                       cmovl      rdx, r10
0060b 448bd2                         mov        r10d, edx
0060e 413bfa                         cmp        edi, r10d
00611 7d4c                           jge        0x7f1e7fe887df
00613 0f1f8000000000                 nop        dword ptr [rax]
0061a 660f1f440000                   nop        word ptr [rax + rax]
00620 448bdf                         mov        r11d, edi
00623 4963cb                         movsxd     rcx, r11d
00626 448bc7                         mov        r8d, edi
00629 428d1c2f                       lea        ebx, [rdi + r13]
0062d 448bdb                         mov        r11d, ebx
00630 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
00638 4d8b4c190c                     mov        r9, qword ptr [r9 + rbx + 0xc]
0063d 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
00645 4e894c030c                     mov        qword ptr [rbx + r8 + 0xc], r9
0064a 4d63db                         movsxd     r11, r11d
0064d 4e8b5c1b14                     mov        r11, qword ptr [rbx + r11 + 0x14]
00652 4c895c0b14                     mov        qword ptr [rbx + rcx + 0x14], r11
00657 83c710                         add        edi, 0x10
0065a 413bfa                         cmp        edi, r10d
0065d 7cc1                           jl         0x7f1e7fe887a0
0065f 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
00666 7d25                           jge        0x7f1e7fe8880d
00668 468d1c2f                       lea        r11d, [rdi + r13]
0066c 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
00674 4e8b5c1b0c                     mov        r11, qword ptr [rbx + r11 + 0xc]
00679 448bd7                         mov        r10d, edi
0067c 4e895c130c                     mov        qword ptr [rbx + r10 + 0xc], r11
00681 83c708                         add        edi, 8
00684 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
0068b 7cdb                           jl         0x7f1e7fe887e8
0068d 4403b4248c000000               add        r14d, dword ptr [rsp + 0x8c]
00695 418bde                         mov        ebx, r14d
00698 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0069d 41ffc2                         inc        r10d
006a0 4489542470                     mov        dword ptr [rsp + 0x70], r10d
006a5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006a9 418502                         test       dword ptr [r10], eax
006ac 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
006b3 48894424f8                     mov        qword ptr [rsp - 8], rax
006b8 8b8424ac000000                 mov        eax, dword ptr [rsp + 0xac]
006bf 8944247c                       mov        dword ptr [rsp + 0x7c], eax
006c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
006c8 4c6344247c                     movsxd     r8, dword ptr [rsp + 0x7c]
006cd 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
006d5 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
006d9 2b4c247c                       sub        ecx, dword ptr [rsp + 0x7c]
006dd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006e2 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
006e7 0f8d49060000                   jge        0x7f1e7fe88eb6
006ed 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
006f5 448b5308                       mov        r10d, dword ptr [rbx + 8]
006f9 453bda                         cmp        r11d, r10d
006fc 0f830d0d0000                   jae        0x7f1e7fe8958f
00702 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
0070a 4e8b5cdb10                     mov        r11, qword ptr [rbx + r11*8 + 0x10]
0070f 458bf3                         mov        r14d, r11d
00712 4181e6ffff0100                 and        r14d, 0x1ffff
00719 4d8bd3                         mov        r10, r11
0071c 49c1fa24                       sar        r10, 0x24
00720 49c1eb12                       shr        r11, 0x12
00724 458bd2                         mov        r10d, r10d
00727 418bfa                         mov        edi, r10d
0072a 418bdb                         mov        ebx, r11d
0072d 81e3ffff0300                   and        ebx, 0x3ffff
00733 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
0073a 4585d2                         test       r10d, r10d
0073d 0f8c75140000                   jl         0x7f1e7fe89d38
00743 4585f6                         test       r14d, r14d
00746 0f85c9000000                   jne        0x7f1e7fe88995
0074c 4533f6                         xor        r14d, r14d
0074f 4183fa03                       cmp        r10d, 3
00753 0f8ee3000000                   jle        0x7f1e7fe889bc
00759 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00761 448b5b08                       mov        r11d, dword ptr [rbx + 8]
00765 4183c2fd                       add        r10d, -3
00769 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00771 4183fb02                       cmp        r11d, 2
00775 0f86f9100000                   jbe        0x7f1e7fe899f4
0077b 448b5310                       mov        r10d, dword ptr [rbx + 0x10]
0077f 44895314                       mov        dword ptr [rbx + 0x14], r10d
00783 448b5b0c                       mov        r11d, dword ptr [rbx + 0xc]
00787 44895b10                       mov        dword ptr [rbx + 0x10], r11d
0078b 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
00793 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
0079a 41895d0c                       mov        dword ptr [r13 + 0xc], ebx
0079e 4c639424a8000000               movsxd     r10, dword ptr [rsp + 0xa8]
007a6 4c891424                       mov        qword ptr [rsp], r10
007aa 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
007b2 4c03542450                     add        r10, qword ptr [rsp + 0x50]
007b7 4963d6                         movsxd     rdx, r14d
007ba 4c03d2                         add        r10, rdx
007bd 4c8b1c24                       mov        r11, qword ptr [rsp]
007c1 4d3bda                         cmp        r11, r10
007c4 0f8f82140000                   jg         0x7f1e7fe89dcc
007ca 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
007d1 4103de                         add        ebx, r14d
007d4 448beb                         mov        r13d, ebx
007d7 442bac24a8000000               sub        r13d, dword ptr [rsp + 0xa8]
007df 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
007e4 4585db                         test       r11d, r11d
007e7 0f8517fbffff                   jne        0x7f1e7fe88484
007ed 4d63dd                         movsxd     r11, r13d
007f0 4c3b5c2458                     cmp        r11, qword ptr [rsp + 0x58]
007f5 0f8c71160000                   jl         0x7f1e7fe89fec
007fb 4c8b1c24                       mov        r11, qword ptr [rsp]
007ff 4c3b5c2460                     cmp        r11, qword ptr [rsp + 0x60]
00804 0f8f0a170000                   jg         0x7f1e7fe8a094
0080a 33c9                           xor        ecx, ecx
0080c 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00810 e901fbffff                     jmp        0x7f1e7fe88496
00815 443bf1                         cmp        r14d, ecx
00818 0f8e31ffffff                   jle        0x7f1e7fe888cf
0081e be45ffffff                     mov        esi, 0xffffff45
00823 418bee                         mov        ebp, r14d
00826 890c24                         mov        dword ptr [rsp], ecx
00829 666690                         nop        
0082c c5f877                         vzeroupper 
0082f e8acf3b4ff                     call       0x7f1e7f9d7d60
00834 0f1f84002c090002               nop        dword ptr [rax + rax + 0x200092c]
0083c 4585f6                         test       r14d, r14d
0083f 7406                           je         0x7f1e7fe889c7
00841 41ffca                         dec        r10d
00844 418bfa                         mov        edi, r10d
00847 85ff                           test       edi, edi
00849 751d                           jne        0x7f1e7fe889e8
0084b 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00853 448b5308                       mov        r10d, dword ptr [rbx + 8]
00857 4585d2                         test       r10d, r10d
0085a 0f860c200000                   jbe        0x7f1e7fe8a9ec
00860 8b5b0c                         mov        ebx, dword ptr [rbx + 0xc]
00863 e98b000000                     jmp        0x7f1e7fe88a73
00868 83ff03                         cmp        edi, 3
0086b 0f8413290000                   je         0x7f1e7fe8b304
00871 83ff02                         cmp        edi, 2
00874 0f87d6290000                   ja         0x7f1e7fe8b3d0
0087a 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00882 448b5b08                       mov        r11d, dword ptr [rbx + 8]
00886 413bfb                         cmp        edi, r11d
00889 0f83251e0000                   jae        0x7f1e7fe8a834
0088f 8b5cbb0c                       mov        ebx, dword ptr [rbx + rdi*4 + 0xc]
00893 85ff                           test       edi, edi
00895 7e47                           jle        0x7f1e7fe88a5e
00897 4585db                         test       r11d, r11d
0089a 0f8604280000                   jbe        0x7f1e7fe8b224
008a0 448d57ff                       lea        r10d, [rdi - 1]
008a4 453bd3                         cmp        r10d, r11d
008a7 0f83f7270000                   jae        0x7f1e7fe8b224
008ad 4183fb01                       cmp        r11d, 1
008b1 0f86ed270000                   jbe        0x7f1e7fe8b224
008b7 660f1f840000000000             nop        word ptr [rax + rax]
008c0 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
008c8 458b54bd08                     mov        r10d, dword ptr [r13 + rdi*4 + 8]
008cd 458954bd0c                     mov        dword ptr [r13 + rdi*4 + 0xc], r10d
008d2 448d57ff                       lea        r10d, [rdi - 1]
008d6 418bfa                         mov        edi, r10d
008d9 4585d2                         test       r10d, r10d
008dc 7fe2                           jg         0x7f1e7fe88a40
008de 4585db                         test       r11d, r11d
008e1 0f86b91e0000                   jbe        0x7f1e7fe8a920
008e7 4c8bac2498000000               mov        r13, qword ptr [rsp + 0x98]
008ef 41895d0c                       mov        dword ptr [r13 + 0xc], ebx
008f3 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
008fa e99ffeffff                     jmp        0x7f1e7fe8891e
008ff 4183f910                       cmp        r9d, 0x10
00903 0f8d7e080000                   jge        0x7f1e7fe89307
00909 4183f908                       cmp        r9d, 8
0090d 0f8d1c050000                   jge        0x7f1e7fe88faf
00913 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0091b 4183fa10                       cmp        r10d, 0x10
0091f 0f8f3b010000                   jg         0x7f1e7fe88be0
00925 443beb                         cmp        r13d, ebx
00928 0f83e21f0000                   jae        0x7f1e7fe8aa90
0092e 430fbe6c2b0c                   movsx      ebp, byte ptr [r11 + r13 + 0xc]
00934 443bf3                         cmp        r14d, ebx
00937 0f83b7200000                   jae        0x7f1e7fe8ab74
0093d 43886c330c                     mov        byte ptr [r11 + r14 + 0xc], bpl
00942 458d4e01                       lea        r9d, [r14 + 1]
00946 458d5503                       lea        r10d, [r13 + 3]
0094a 443bd3                         cmp        r10d, ebx
0094d 0f8351210000                   jae        0x7f1e7fe8ac24
00953 4963cd                         movsxd     rcx, r13d
00956 410fbe6c0b0d                   movsx      ebp, byte ptr [r11 + rcx + 0xd]
0095c 458d5603                       lea        r10d, [r14 + 3]
00960 443bd3                         cmp        r10d, ebx
00963 0f8317220000                   jae        0x7f1e7fe8ad00
00969 4d63d6                         movsxd     r10, r14d
0096c 43886c130d                     mov        byte ptr [r11 + r10 + 0xd], bpl
00971 450fbe4c0b0e                   movsx      r9d, byte ptr [r11 + rcx + 0xe]
00977 47884c130e                     mov        byte ptr [r11 + r10 + 0xe], r9b
0097c 450fbe4c0b0f                   movsx      r9d, byte ptr [r11 + rcx + 0xf]
00982 47884c130f                     mov        byte ptr [r11 + r10 + 0xf], r9b
00987 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
0098f 4183f908                       cmp        r9d, 8
00993 0f839f220000                   jae        0x7f1e7fe8adb8
00999 49b9c8df2fe300000000           movabs     r9, 0xe32fdfc8
009a3 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
009ab 47036c910c                     add        r13d, dword ptr [r9 + r10*4 + 0xc]
009b0 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
009b8 4183f904                       cmp        r9d, 4
009bc 7e39                           jle        0x7f1e7fe88b77
009be 8d4bfd                         lea        ecx, [rbx - 3]
009c1 458d5604                       lea        r10d, [r14 + 4]
009c5 85c9                           test       ecx, ecx
009c7 0f8c07250000                   jl         0x7f1e7fe8b054
009cd 8bcb                           mov        ecx, ebx
009cf 83c1fd                         add        ecx, -3
009d2 443be9                         cmp        r13d, ecx
009d5 0f8329230000                   jae        0x7f1e7fe8ae84
009db 458bcd                         mov        r9d, r13d
009de 438b6c0b0c                     mov        ebp, dword ptr [r11 + r9 + 0xc]
009e3 443bd1                         cmp        r10d, ecx
009e6 0f8314240000                   jae        0x7f1e7fe8af80
009ec 458bd6                         mov        r10d, r14d
009ef 4d63d2                         movsxd     r10, r10d
009f2 43896c1310                     mov        dword ptr [r11 + r10 + 0x10], ebp
009f7 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
009ff 4183fa08                       cmp        r10d, 8
00a03 7e4f                           jle        0x7f1e7fe88bd4
00a05 49baf8df2fe300000000           movabs     r10, 0xe32fdff8
00a0f 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00a17 478b548a0c                     mov        r10d, dword ptr [r10 + r9*4 + 0xc]
00a1c 452bea                         sub        r13d, r10d
00a1f 458d5608                       lea        r10d, [r14 + 8]
00a23 418d6d08                       lea        ebp, [r13 + 8]
00a27 4585c0                         test       r8d, r8d
00a2a 0f8c482a0000                   jl         0x7f1e7fe8b5f8
00a30 83c3f9                         add        ebx, -7
00a33 3beb                           cmp        ebp, ebx
00a35 0f83e1280000                   jae        0x7f1e7fe8b49c
00a3b 4d63c5                         movsxd     r8, r13d
00a3e 4b8b6c0314                     mov        rbp, qword ptr [r11 + r8 + 0x14]
00a43 443bd3                         cmp        r10d, ebx
00a46 0f8388290000                   jae        0x7f1e7fe8b554
00a4c 4d63d6                         movsxd     r10, r14d
00a4f 4b896c1314                     mov        qword ptr [r11 + r10 + 0x14], rbp
00a54 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00a5b e938fcffff                     jmp        0x7f1e7fe88818
00a60 4585ed                         test       r13d, r13d
00a63 0f8cc72a0000                   jl         0x7f1e7fe8b6b0
00a69 4585f6                         test       r14d, r14d
00a6c 0f8cbe2a0000                   jl         0x7f1e7fe8b6b0
00a72 413bde                         cmp        ebx, r14d
00a75 0f82b52a0000                   jb         0x7f1e7fe8b6b0
00a7b 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00a83 4503d6                         add        r10d, r14d
00a86 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00a8b 413bda                         cmp        ebx, r10d
00a8e 0f829c2a0000                   jb         0x7f1e7fe8b6b0
00a94 4585c9                         test       r9d, r9d
00a97 0f8c932a0000                   jl         0x7f1e7fe8b6b0
00a9d 4585c9                         test       r9d, r9d
00aa0 0f84aaf7ffff                   je         0x7f1e7fe883d0
00aa6 4c8b1424                       mov        r10, qword ptr [rsp]
00aaa 4983fa20                       cmp        r10, 0x20
00aae 772d                           ja         0x7f1e7fe88c5d
00ab0 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00ab8 4d63d2                         movsxd     r10, r10d
00abb 49c7c0ffffffff                 mov        r8, 0xffffffffffffffff
00ac2 c442a8f5c0                     bzhi       r8, r8, r10
00ac7 c4c1fb92f8                     kmovq      k7, r8
00acc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ad2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ad8 e973f7ffff                     jmp        0x7f1e7fe883d0
00add 498bd2                         mov        rdx, r10
00ae0 c5f877                         vzeroupper 
00ae3 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00aed 41ffd2                         call       r10
00af0 0f1f840000000000               nop        dword ptr [rax + rax]
00af8 e953f7ffff                     jmp        0x7f1e7fe883d0
00afd 4183fe30                       cmp        r14d, 0x30
00b01 0f8eb3000000                   jle        0x7f1e7fe88d3a
00b07 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00b0f 418b4a08                       mov        ecx, dword ptr [r10 + 8]
00b13 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00b1b 418b7208                       mov        esi, dword ptr [r10 + 8]
00b1f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b24 4585d2                         test       r10d, r10d
00b27 0f8c132e0000                   jl         0x7f1e7fe8bac0
00b2d 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b35 4585db                         test       r11d, r11d
00b38 0f8c022e0000                   jl         0x7f1e7fe8bac0
00b3e 3b8c24ac000000                 cmp        ecx, dword ptr [rsp + 0xac]
00b45 0f82f52d0000                   jb         0x7f1e7fe8bac0
00b4b 3bf3                           cmp        esi, ebx
00b4d 0f82ed2d0000                   jb         0x7f1e7fe8bac0
00b53 4585f6                         test       r14d, r14d
00b56 7440                           je         0x7f1e7fe88d18
00b58 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00b60 4b8d740a0c                     lea        rsi, [r10 + r9 + 0xc]
00b65 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00b6d 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00b72 4883fa20                       cmp        rdx, 0x20
00b76 7728                           ja         0x7f1e7fe88d20
00b78 4d63d6                         movsxd     r10, r14d
00b7b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b82 c442a8f5db                     bzhi       r11, r11, r10
00b87 c4c1fb92fb                     kmovq      k7, r11
00b8c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b92 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b98 448bf3                         mov        r14d, ebx
00b9b e95bf8ffff                     jmp        0x7f1e7fe8857b
00ba0 c5f877                         vzeroupper 
00ba3 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00bad 41ffd2                         call       r10
00bb0 0f1f840000000000               nop        dword ptr [rax + rax]
00bb8 ebde                           jmp        0x7f1e7fe88d18
00bba 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00bc2 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00bc6 418d6bf1                       lea        ebp, [r11 - 0xf]
00bca 85ed                           test       ebp, ebp
00bcc 0f8cba2c0000                   jl         0x7f1e7fe8ba0c
00bd2 418d6bf1                       lea        ebp, [r11 - 0xf]
00bd6 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00bdb 443bc5                         cmp        r8d, ebp
00bde 0f83e02a0000                   jae        0x7f1e7fe8b844
00be4 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00bec 458b4a08                       mov        r9d, dword ptr [r10 + 8]
00bf0 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00bf5 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00bfa 418d69f1                       lea        ebp, [r9 - 0xf]
00bfe 4963ca                         movsxd     rcx, r10d
00c01 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00c09 c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
00c10 85ed                           test       ebp, ebp
00c12 0f8c242e0000                   jl         0x7f1e7fe8bbbc
00c18 458d41f1                       lea        r8d, [r9 - 0xf]
00c1c 8bbc2488000000                 mov        edi, dword ptr [rsp + 0x88]
00c23 413bf8                         cmp        edi, r8d
00c26 0f834c2b0000                   jae        0x7f1e7fe8b8f8
00c2c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00c34 418bf2                         mov        esi, r10d
00c37 4963fa                         movsxd     rdi, r10d
00c3a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00c42 c4c17a7f443a0c                 vmovdqu    xmmword ptr [r10 + rdi + 0xc], xmm0
00c49 448d5610                       lea        r10d, [rsi + 0x10]
00c4d 418bd2                         mov        edx, r10d
00c50 443bd3                         cmp        r10d, ebx
00c53 0f8da3000000                   jge        0x7f1e7fe88e7c
00c59 482bcf                         sub        rcx, rdi
00c5c 4963c3                         movsxd     rax, r11d
00c5f 4883c0f1                       add        rax, -0xf
00c63 4d63da                         movsxd     r11, r10d
00c66 4d8d140b                       lea        r10, [r11 + rcx]
00c6a 4c3bd0                         cmp        r10, rax
00c6d 0f83992e0000                   jae        0x7f1e7fe8bc8c
00c73 4c63d3                         movsxd     r10, ebx
00c76 4d2bd3                         sub        r10, r11
00c79 4983c20f                       add        r10, 0xf
00c7d 4983e2f0                       and        r10, 0xfffffffffffffff0
00c81 418bfa                         mov        edi, r10d
00c84 448bd6                         mov        r10d, esi
00c87 468d5c1710                     lea        r11d, [rdi + r10 + 0x10]
00c8c 4d63d3                         movsxd     r10, r11d
00c8f 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
00c94 4c3bd8                         cmp        r11, rax
00c97 0f836f2e0000                   jae        0x7f1e7fe8bc8c
00c9d 413bd0                         cmp        edx, r8d
00ca0 0f83662e0000                   jae        0x7f1e7fe8bc8c
00ca6 4d63d9                         movsxd     r11, r9d
00ca9 4983c2f0                       add        r10, -0x10
00cad 4983c3f1                       add        r11, -0xf
00cb1 4d3bd3                         cmp        r10, r11
00cb4 0f83522e0000                   jae        0x7f1e7fe8bc8c
00cba 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00cc0 0f8f122f0000                   jg         0x7f1e7fe8bd58
00cc6 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00ccb 442bc6                         sub        r8d, esi
00cce 6690                           nop        
00cd0 448bd2                         mov        r10d, edx
00cd3 458d1c10                       lea        r11d, [r8 + rdx]
00cd7 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00cdf c4817a6f44190c                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 0xc]
00ce6 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00cee c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00cf5 83c210                         add        edx, 0x10
00cf8 3bd3                           cmp        edx, ebx
00cfa 7cd4                           jl         0x7f1e7fe88e50
00cfc 440374247c                     add        r14d, dword ptr [rsp + 0x7c]
00d01 4489b424ac000000               mov        dword ptr [rsp + 0xac], r14d
00d09 448bf3                         mov        r14d, ebx
00d0c e9eaf6ffff                     jmp        0x7f1e7fe8857b
00d11 4c63d1                         movsxd     r10, ecx
00d14 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d1b c442a8f5db                     bzhi       r11, r11, r10
00d20 c4c1fb92fb                     kmovq      k7, r11
00d25 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d2b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d31 e992000000                     jmp        0x7f1e7fe88f48
00d36 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d3e 458b5308                       mov        r10d, dword ptr [r11 + 8]
00d42 4c8bb424a0000000               mov        r14, qword ptr [rsp + 0xa0]
00d4a 418b5608                       mov        edx, dword ptr [r14 + 8]
00d4e 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00d53 4585ed                         test       r13d, r13d
00d56 0f8c3c290000                   jl         0x7f1e7fe8b818
00d5c 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00d63 85db                           test       ebx, ebx
00d65 0f8c34290000                   jl         0x7f1e7fe8b81f
00d6b 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00d70 0f8229290000                   jb         0x7f1e7fe8b81f
00d76 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00d7d 03e9                           add        ebp, ecx
00d7f 3bd5                           cmp        edx, ebp
00d81 0f8218290000                   jb         0x7f1e7fe8b81f
00d87 85c9                           test       ecx, ecx
00d89 0f8c10290000                   jl         0x7f1e7fe8b81f
00d8f 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00d93 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00d97 742f                           je         0x7f1e7fe88f48
00d99 4b8d740e0c                     lea        rsi, [r14 + r9 + 0xc]
00d9e 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
00da3 4863d1                         movsxd     rdx, ecx
00da6 4883fa20                       cmp        rdx, 0x20
00daa 0f8661ffffff                   jbe        0x7f1e7fe88e91
00db0 c5f877                         vzeroupper 
00db3 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00dbd 41ffd2                         call       r10
00dc0 0f1f840000000000               nop        dword ptr [rax + rax]
00dc8 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00dcd 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00dd1 c5f877                         vzeroupper 
00dd4 4881c4c0000000                 add        rsp, 0xc0
00ddb 5d                             pop        rbp
00ddc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00de0 0f87e2370000                   ja         0x7f1e7fe8c748
00de6 c3                             ret        
00de7 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00dec 448bd6                         mov        r10d, esi
00def 4403542468                     add        r10d, dword ptr [rsp + 0x68]
00df4 62b17e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0xc]
00dff 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e04 62b17e487f84130c000000         vmovdqu32  zmmword ptr [rbx + r10 + 0xc], zmm0
00e0f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e14 4183c340                       add        r11d, 0x40
00e18 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00e1d 443bd9                         cmp        r11d, ecx
00e20 7cca                           jl         0x7f1e7fe88f6c
00e22 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
00e2a e90e030000                     jmp        0x7f1e7fe892bd
00e2f 4585c0                         test       r8d, r8d
00e32 0f8c34300000                   jl         0x7f1e7fe8bfec
00e38 448d53f9                       lea        r10d, [rbx - 7]
00e3c 418bca                         mov        ecx, r10d
00e3f 453bea                         cmp        r13d, r10d
00e42 0f835c2e0000                   jae        0x7f1e7fe8be24
00e48 418bc5                         mov        eax, r13d
00e4b 4863f8                         movsxd     rdi, eax
00e4e 4d8b443b0c                     mov        r8, qword ptr [r11 + rdi + 0xc]
00e53 453bf2                         cmp        r14d, r10d
00e56 0f832c2f0000                   jae        0x7f1e7fe8bf08
00e5c 458bce                         mov        r9d, r14d
00e5f 458d5108                       lea        r10d, [r9 + 8]
00e63 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00e68 4963f1                         movsxd     rsi, r9d
00e6b 4d8944330c                     mov        qword ptr [r11 + rsi + 0xc], r8
00e70 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00e78 0f8dfd020000                   jge        0x7f1e7fe892fb
00e7e 482bfe                         sub        rdi, rsi
00e81 4863f3                         movsxd     rsi, ebx
00e84 4883c6f9                       add        rsi, -7
00e88 4d63c2                         movsxd     r8, r10d
00e8b 4d8d1438                       lea        r10, [r8 + rdi]
00e8f 4c3bd6                         cmp        r10, rsi
00e92 0f83b8300000                   jae        0x7f1e7fe8c0d0
00e98 4c8bd2                         mov        r10, rdx
00e9b 4d2bd0                         sub        r10, r8
00e9e 4983c207                       add        r10, 7
00ea2 4983e2f8                       and        r10, 0xfffffffffffffff8
00ea6 458bd2                         mov        r10d, r10d
00ea9 438d5c0a08                     lea        ebx, [r10 + r9 + 8]
00eae 4863db                         movsxd     rbx, ebx
00eb1 4c8d543bf8                     lea        r10, [rbx + rdi - 8]
00eb6 4c3bd6                         cmp        r10, rsi
00eb9 0f8391300000                   jae        0x7f1e7fe8c0d0
00ebf 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00ec4 443bd1                         cmp        r10d, ecx
00ec7 0f8383300000                   jae        0x7f1e7fe8c0d0
00ecd 4883c3f8                       add        rbx, -8
00ed1 483bde                         cmp        rbx, rsi
00ed4 0f8376300000                   jae        0x7f1e7fe8c0d0
00eda 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00ee1 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00ee7 0f8f23310000                   jg         0x7f1e7fe8c190
00eed 412bc1                         sub        eax, r9d
00ef0 8bf0                           mov        esi, eax
00ef2 bbf4ffffff                     mov        ebx, 0xfffffff4
00ef7 4c8d52c8                       lea        r10, [rdx - 0x38]
00efb 4981fa00000080                 cmp        r10, -0x80000000
00f02 48c7c100000080                 mov        rcx, 0xffffffff80000000
00f09 4c0f4cd1                       cmovl      r10, rcx
00f0d 418bca                         mov        ecx, r10d
00f10 452bee                         sub        r13d, r14d
00f13 418d7910                       lea        edi, [r9 + 0x10]
00f17 458bd3                         mov        r10d, r11d
00f1a 412bda                         sub        ebx, r10d
00f1d 412bd9                         sub        ebx, r9d
00f20 83c3f0                         add        ebx, -0x10
00f23 4c63d7                         movsxd     r10, edi
00f26 498bc3                         mov        rax, r11
00f29 41b906000000                   mov        r9d, 6
00f2f c462b0f5cb                     bzhi       r9, rbx, r9
00f34 4d03d1                         add        r10, r9
00f37 4c3bd2                         cmp        r10, rdx
00f3a 4c8bca                         mov        r9, rdx
00f3d 4d0f4cca                       cmovl      r9, r10
00f41 4d8bd1                         mov        r10, r9
00f44 4d2bd0                         sub        r10, r8
00f47 498d5aff                       lea        rbx, [r10 - 1]
00f4b 48c1fb3f                       sar        rbx, 0x3f
00f4f 48c1eb3d                       shr        rbx, 0x3d
00f53 4e8d5413ff                     lea        r10, [rbx + r10 - 1]
00f58 4983e2f8                       and        r10, 0xfffffffffffffff8
00f5c 4d03d0                         add        r10, r8
00f5f 4d3bc2                         cmp        r8, r10
00f62 4d0f4cc2                       cmovl      r8, r10
00f66 458bd0                         mov        r10d, r8d
00f69 478d441508                     lea        r8d, [r13 + r10 + 8]
00f6e 4183c208                       add        r10d, 8
00f72 4963d8                         movsxd     rbx, r8d
00f75 4803d8                         add        rbx, rax
00f78 4963ea                         movsxd     rbp, r10d
00f7b 4803e8                         add        rbp, rax
00f7e 4c8d530c                       lea        r10, [rbx + 0xc]
00f82 4883c34c                       add        rbx, 0x4c
00f86 488d454c                       lea        rax, [rbp + 0x4c]
00f8a 4533c0                         xor        r8d, r8d
00f8d 493bc2                         cmp        rax, r10
00f90 410f96c0                       setbe      r8b
00f94 4883c50c                       add        rbp, 0xc
00f98 4533d2                         xor        r10d, r10d
00f9b 483bdd                         cmp        rbx, rbp
00f9e 410f96c2                       setbe      r10b
00fa2 450bc2                         or         r8d, r10d
00fa5 0f84ec150000                   je         0x7f1e7fe8a717
00fab 458bd1                         mov        r10d, r9d
00fae 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
00fb6 6690                           nop        
00fb8 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00fbd 448bde                         mov        r11d, esi
00fc0 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
00fc5 4f8b5c180c                     mov        r11, qword ptr [r8 + r11 + 0xc]
00fca 4f895c080c                     mov        qword ptr [r8 + r9 + 0xc], r11
00fcf 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fd4 4183c308                       add        r11d, 8
00fd8 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00fdd 453bda                         cmp        r11d, r10d
00fe0 7cd6                           jl         0x7f1e7fe89138
00fe2 4881c208feffff                 add        rdx, -0x1f8
00fe9 4881fa00000080                 cmp        rdx, -0x80000000
00ff0 49c7c200000080                 mov        r10, 0xffffffff80000000
00ff7 490f4cd2                       cmovl      rdx, r10
00ffb 448bca                         mov        r9d, edx
00ffe 453bd9                         cmp        r11d, r9d
01001 0f8db5300000                   jge        0x7f1e7fe8c23c
01007 458bd3                         mov        r10d, r11d
0100a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0100f 498bd8                         mov        rbx, r8
01012 0f1f8000000000                 nop        dword ptr [rax]
01019 0f1f8000000000                 nop        dword ptr [rax]
01020 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01025 4963fb                         movsxd     rdi, r11d
01028 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0102d 448bc6                         mov        r8d, esi
01030 4403442468                     add        r8d, dword ptr [rsp + 0x68]
01035 8b542468                       mov        edx, dword ptr [rsp + 0x68]
01039 81c280000000                   add        edx, 0x80
0103f 03d6                           add        edx, esi
01041 418bc0                         mov        eax, r8d
01044 62f17e486f84030c000000         vmovdqu32  zmm0, zmmword ptr [rbx + rax + 0xc]
0104f 62b17e487f841b0c000000         vmovdqu32  zmmword ptr [rbx + r11 + 0xc], zmm0
0105a 4d63d8                         movsxd     r11, r8d
0105d 62b17e486f841b4c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 0x4c]
01068 62f17e487f843b4c000000         vmovdqu32  zmmword ptr [rbx + rdi + 0x4c], zmm0
01073 448bd2                         mov        r10d, edx
01076 62b17e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0xc]
01081 62f17e487f843b8c000000         vmovdqu32  zmmword ptr [rbx + rdi + 0x8c], zmm0
0108c 4c63d2                         movsxd     r10, edx
0108f 62b17e486f84134c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0x4c]
0109a 62f17e487f843bcc000000         vmovdqu32  zmmword ptr [rbx + rdi + 0xcc], zmm0
010a5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
010aa 4181c200010000                 add        r10d, 0x100
010b1 4403d6                         add        r10d, esi
010b4 458bc2                         mov        r8d, r10d
010b7 62b17e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0xc]
010c2 62f17e487f843b0c010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x10c], zmm0
010cd 4d63d0                         movsxd     r10, r8d
010d0 62b17e486f84134c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0x4c]
010db 62f17e487f843b4c010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x14c], zmm0
010e6 62b17e486f841b8c010000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 0x18c]
010f1 62f17e487f843b8c010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x18c], zmm0
010fc 62b17e486f841bcc010000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 0x1cc]
01107 62f17e487f843bcc010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x1cc], zmm0
01112 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01117 4181c200020000                 add        r10d, 0x200
0111e 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01123 453bd1                         cmp        r10d, r9d
01126 0f8cf4feffff                   jl         0x7f1e7fe891a0
0112c 443bd1                         cmp        r10d, ecx
0112f 0f8cb2fcffff                   jl         0x7f1e7fe88f67
01135 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
0113d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01142 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0114a 7d2f                           jge        0x7f1e7fe892fb
0114c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01151 666690                         nop        
01154 468d1406                       lea        r10d, [rsi + r8]
01158 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
01160 4e8b5c130c                     mov        r11, qword ptr [rbx + r10 + 0xc]
01165 458bd0                         mov        r10d, r8d
01168 4e895c130c                     mov        qword ptr [rbx + r10 + 0xc], r11
0116d 4183c008                       add        r8d, 8
01171 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
01179 7cd9                           jl         0x7f1e7fe892d4
0117b 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
01182 e911f5ffff                     jmp        0x7f1e7fe88818
01187 4585d2                         test       r10d, r10d
0118a 0f8c04310000                   jl         0x7f1e7fe8c414
01190 448d43f1                       lea        r8d, [rbx - 0xf]
01194 418bc8                         mov        ecx, r8d
01197 453be8                         cmp        r13d, r8d
0119a 0f83292f0000                   jae        0x7f1e7fe8c249
011a0 4d63cd                         movsxd     r9, r13d
011a3 c4817a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xc]
011aa 453bf0                         cmp        r14d, r8d
011ad 0f83e52f0000                   jae        0x7f1e7fe8c318
011b3 418d6e10                       lea        ebp, [r14 + 0x10]
011b7 4d63d6                         movsxd     r10, r14d
011ba c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
011c1 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
011c8 0f8d35020000                   jge        0x7f1e7fe89583
011ce 4d2bca                         sub        r9, r10
011d1 4863db                         movsxd     rbx, ebx
011d4 4883c3f1                       add        rbx, -0xf
011d8 4c63c5                         movsxd     r8, ebp
011db 4f8d1408                       lea        r10, [r8 + r9]
011df 4c3bd3                         cmp        r10, rbx
011e2 0f837c310000                   jae        0x7f1e7fe8c4e4
011e8 4c8bd2                         mov        r10, rdx
011eb 4d2bd0                         sub        r10, r8
011ee 4983c20f                       add        r10, 0xf
011f2 4983e2f0                       and        r10, 0xfffffffffffffff0
011f6 458bd2                         mov        r10d, r10d
011f9 478d443210                     lea        r8d, [r10 + r14 + 0x10]
011fe 4d63d0                         movsxd     r10, r8d
01201 4f8d440af0                     lea        r8, [r10 + r9 - 0x10]
01206 4c3bc3                         cmp        r8, rbx
01209 0f8355310000                   jae        0x7f1e7fe8c4e4
0120f 3be9                           cmp        ebp, ecx
01211 0f834d310000                   jae        0x7f1e7fe8c4e4
01217 4983c2f0                       add        r10, -0x10
0121b 4c3bd3                         cmp        r10, rbx
0121e 0f8340310000                   jae        0x7f1e7fe8c4e4
01224 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0122c 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
01233 0f8fbb310000                   jg         0x7f1e7fe8c574
01239 452bee                         sub        r13d, r14d
0123c 4183c620                       add        r14d, 0x20
01240 448bdd                         mov        r11d, ebp
01243 458bd5                         mov        r10d, r13d
01246 4403d5                         add        r10d, ebp
01249 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
01251 c4a17a6f44130c                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xc]
01258 c4a17a7f441b0c                 vmovdqu    xmmword ptr [rbx + r11 + 0xc], xmm0
0125f 83c510                         add        ebp, 0x10
01262 413bee                         cmp        ebp, r14d
01265 7cd9                           jl         0x7f1e7fe893c0
01267 4881c210ffffff                 add        rdx, -0xf0
0126e 4881fa00000080                 cmp        rdx, -0x80000000
01275 49c7c200000080                 mov        r10, 0xffffffff80000000
0127c 490f4cd2                       cmovl      rdx, r10
01280 448bd2                         mov        r10d, edx
01283 413bea                         cmp        ebp, r10d
01286 0f8d40010000                   jge        0x7f1e7fe8954c
0128c 0f1f4000                       nop        dword ptr [rax]
01290 448bdd                         mov        r11d, ebp
01293 4d63cb                         movsxd     r9, r11d
01296 448bc5                         mov        r8d, ebp
01299 458bdd                         mov        r11d, r13d
0129c 4403dd                         add        r11d, ebp
0129f 418bcb                         mov        ecx, r11d
012a2 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
012aa c4a17a6f441b0c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc]
012b1 c4a17a7f44030c                 vmovdqu    xmmword ptr [rbx + r8 + 0xc], xmm0
012b8 4c63d9                         movsxd     r11, ecx
012bb c4a17a6f441b1c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x1c]
012c2 c4a17a7f440b1c                 vmovdqu    xmmword ptr [rbx + r9 + 0x1c], xmm0
012c9 c4a17a6f441b2c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x2c]
012d0 c4a17a7f440b2c                 vmovdqu    xmmword ptr [rbx + r9 + 0x2c], xmm0
012d7 c4a17a6f441b3c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x3c]
012de c4a17a7f440b3c                 vmovdqu    xmmword ptr [rbx + r9 + 0x3c], xmm0
012e5 c4a17a6f441b4c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x4c]
012ec c4a17a7f440b4c                 vmovdqu    xmmword ptr [rbx + r9 + 0x4c], xmm0
012f3 c4a17a6f441b5c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x5c]
012fa c4a17a7f440b5c                 vmovdqu    xmmword ptr [rbx + r9 + 0x5c], xmm0
01301 c4a17a6f441b6c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x6c]
01308 c4a17a7f440b6c                 vmovdqu    xmmword ptr [rbx + r9 + 0x6c], xmm0
0130f c4a17a6f441b7c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x7c]
01316 c4a17a7f440b7c                 vmovdqu    xmmword ptr [rbx + r9 + 0x7c], xmm0
0131d c4a17a6f841b8c000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x8c]
01327 c4a17a7f840b8c000000           vmovdqu    xmmword ptr [rbx + r9 + 0x8c], xmm0
01331 c4a17a6f841b9c000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x9c]
0133b c4a17a7f840b9c000000           vmovdqu    xmmword ptr [rbx + r9 + 0x9c], xmm0
01345 c4a17a6f841bac000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xac]
0134f c4a17a7f840bac000000           vmovdqu    xmmword ptr [rbx + r9 + 0xac], xmm0
01359 c4a17a6f841bbc000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xbc]
01363 c4a17a7f840bbc000000           vmovdqu    xmmword ptr [rbx + r9 + 0xbc], xmm0
0136d c4a17a6f841bcc000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xcc]
01377 c4a17a7f840bcc000000           vmovdqu    xmmword ptr [rbx + r9 + 0xcc], xmm0
01381 c4a17a6f841bdc000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xdc]
0138b c4a17a7f840bdc000000           vmovdqu    xmmword ptr [rbx + r9 + 0xdc], xmm0
01395 c4a17a6f841bec000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xec]
0139f c4a17a7f840bec000000           vmovdqu    xmmword ptr [rbx + r9 + 0xec], xmm0
013a9 c4a17a6f841bfc000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xfc]
013b3 c4a17a7f840bfc000000           vmovdqu    xmmword ptr [rbx + r9 + 0xfc], xmm0
013bd 81c500010000                   add        ebp, 0x100
013c3 413bea                         cmp        ebp, r10d
013c6 0f8cc4feffff                   jl         0x7f1e7fe89410
013cc 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
013d3 7d2e                           jge        0x7f1e7fe89583
013d5 666690                         nop        
013d8 458bdd                         mov        r11d, r13d
013db 4403dd                         add        r11d, ebp
013de 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
013e6 c4a17a6f441b0c                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc]
013ed 448bd5                         mov        r10d, ebp
013f0 c4a17a7f44130c                 vmovdqu    xmmword ptr [rbx + r10 + 0xc], xmm0
013f7 83c510                         add        ebp, 0x10
013fa 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
01401 7cd5                           jl         0x7f1e7fe89558
01403 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
0140a e989f2ffff                     jmp        0x7f1e7fe88818
0140f bee4ffffff                     mov        esi, 0xffffffe4
01414 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01419 48894424f8                     mov        qword ptr [rsp - 8], rax
0141e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01422 89442408                       mov        dword ptr [rsp + 8], eax
01426 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0142b 48ff742420                     push       qword ptr [rsp + 0x20]
01430 488f442418                     pop        qword ptr [rsp + 0x18]
01435 48894424f8                     mov        qword ptr [rsp - 8], rax
0143a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0143e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01442 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01447 48894424f8                     mov        qword ptr [rsp - 8], rax
0144c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01450 89442438                       mov        dword ptr [rsp + 0x38], eax
01454 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01459 48ff742450                     push       qword ptr [rsp + 0x50]
0145e 488f442440                     pop        qword ptr [rsp + 0x40]
01463 48894424f8                     mov        qword ptr [rsp - 8], rax
01468 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0146c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01470 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01475 48ff742458                     push       qword ptr [rsp + 0x58]
0147a 488f442448                     pop        qword ptr [rsp + 0x48]
0147f 48ff742460                     push       qword ptr [rsp + 0x60]
01484 488f442450                     pop        qword ptr [rsp + 0x50]
01489 666690                         nop        
0148c c5f877                         vzeroupper 
0148f e84ce7b4ff                     call       0x7f1e7f9d7d60
01494 0f1f84008c150003               nop        dword ptr [rax + rax + 0x300158c]
0149c bee4ffffff                     mov        esi, 0xffffffe4
014a1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
014a6 48894424f8                     mov        qword ptr [rsp - 8], rax
014ab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014af 89442408                       mov        dword ptr [rsp + 8], eax
014b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b8 48ff742420                     push       qword ptr [rsp + 0x20]
014bd 488f442418                     pop        qword ptr [rsp + 0x18]
014c2 48894424f8                     mov        qword ptr [rsp - 8], rax
014c7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014cb 8944240c                       mov        dword ptr [rsp + 0xc], eax
014cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d4 48894424f8                     mov        qword ptr [rsp - 8], rax
014d9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
014dd 89442438                       mov        dword ptr [rsp + 0x38], eax
014e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e6 48ff742450                     push       qword ptr [rsp + 0x50]
014eb 488f442440                     pop        qword ptr [rsp + 0x40]
014f0 48894424f8                     mov        qword ptr [rsp - 8], rax
014f5 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014f9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01502 48ff742458                     push       qword ptr [rsp + 0x58]
01507 488f442448                     pop        qword ptr [rsp + 0x48]
0150c 48ff742460                     push       qword ptr [rsp + 0x60]
01511 488f442450                     pop        qword ptr [rsp + 0x50]
01516 48894424f8                     mov        qword ptr [rsp - 8], rax
0151b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0151f 89442458                       mov        dword ptr [rsp + 0x58], eax
01523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01528 48894424f8                     mov        qword ptr [rsp - 8], rax
0152d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01531 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01535 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153a 48894424f8                     mov        qword ptr [rsp - 8], rax
0153f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01543 89442460                       mov        dword ptr [rsp + 0x60], eax
01547 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0154c 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01551 48894424f8                     mov        qword ptr [rsp - 8], rax
01556 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
0155a 89442478                       mov        dword ptr [rsp + 0x78], eax
0155e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01563 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01568 c5f877                         vzeroupper 
0156b e870e6b4ff                     call       0x7f1e7f9d7d60
01570 0f1f840068160004               nop        dword ptr [rax + rax + 0x4001668]
01578 bee4ffffff                     mov        esi, 0xffffffe4
0157d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01582 48ffb42480000000               push       qword ptr [rsp + 0x80]
0158a 488f0424                       pop        qword ptr [rsp]
0158e 48894424f8                     mov        qword ptr [rsp - 8], rax
01593 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01597 89442408                       mov        dword ptr [rsp + 8], eax
0159b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a0 48ff742420                     push       qword ptr [rsp + 0x20]
015a5 488f442418                     pop        qword ptr [rsp + 0x18]
015aa 48894424f8                     mov        qword ptr [rsp - 8], rax
015af 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015b3 8944240c                       mov        dword ptr [rsp + 0xc], eax
015b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015bc 895c2434                       mov        dword ptr [rsp + 0x34], ebx
015c0 48894424f8                     mov        qword ptr [rsp - 8], rax
015c5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
015c9 89442438                       mov        dword ptr [rsp + 0x38], eax
015cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d2 48ff742450                     push       qword ptr [rsp + 0x50]
015d7 488f442440                     pop        qword ptr [rsp + 0x40]
015dc 48894424f8                     mov        qword ptr [rsp - 8], rax
015e1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
015e5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ee 48ff742458                     push       qword ptr [rsp + 0x58]
015f3 488f442448                     pop        qword ptr [rsp + 0x48]
015f8 48ff742460                     push       qword ptr [rsp + 0x60]
015fd 488f442450                     pop        qword ptr [rsp + 0x50]
01602 48894424f8                     mov        qword ptr [rsp - 8], rax
01607 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0160b 89442458                       mov        dword ptr [rsp + 0x58], eax
0160f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01614 48894424f8                     mov        qword ptr [rsp - 8], rax
01619 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0161d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01621 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01626 48894424f8                     mov        qword ptr [rsp - 8], rax
0162b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0162f 89442460                       mov        dword ptr [rsp + 0x60], eax
01633 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01638 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0163d 48894424f8                     mov        qword ptr [rsp - 8], rax
01642 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01649 89442468                       mov        dword ptr [rsp + 0x68], eax
0164d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01652 48894424f8                     mov        qword ptr [rsp - 8], rax
01657 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0165e 89442478                       mov        dword ptr [rsp + 0x78], eax
01662 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01667 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0166c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01675 666690                         nop        
01678 c5f877                         vzeroupper 
0167b e860e5b4ff                     call       0x7f1e7f9d7d60
01680 0f1f840078170005               nop        dword ptr [rax + rax + 0x5001778]
01688 beccffffff                     mov        esi, 0xffffffcc
0168d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01692 48894424f8                     mov        qword ptr [rsp - 8], rax
01697 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0169b 89442408                       mov        dword ptr [rsp + 8], eax
0169f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a4 48ff742420                     push       qword ptr [rsp + 0x20]
016a9 488f442418                     pop        qword ptr [rsp + 0x18]
016ae 48894424f8                     mov        qword ptr [rsp - 8], rax
016b3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016b7 8944240c                       mov        dword ptr [rsp + 0xc], eax
016bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c0 48894424f8                     mov        qword ptr [rsp - 8], rax
016c5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
016c9 89442438                       mov        dword ptr [rsp + 0x38], eax
016cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d2 48ff742450                     push       qword ptr [rsp + 0x50]
016d7 488f442440                     pop        qword ptr [rsp + 0x40]
016dc 48894424f8                     mov        qword ptr [rsp - 8], rax
016e1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016e5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ee 48ff742458                     push       qword ptr [rsp + 0x58]
016f3 488f442448                     pop        qword ptr [rsp + 0x48]
016f8 48ff742460                     push       qword ptr [rsp + 0x60]
016fd 488f442450                     pop        qword ptr [rsp + 0x50]
01702 48894424f8                     mov        qword ptr [rsp - 8], rax
01707 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0170b 89442458                       mov        dword ptr [rsp + 0x58], eax
0170f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01714 48894424f8                     mov        qword ptr [rsp - 8], rax
01719 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0171d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01721 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01726 48894424f8                     mov        qword ptr [rsp - 8], rax
0172b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0172f 89442460                       mov        dword ptr [rsp + 0x60], eax
01733 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01738 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0173d 48894424f8                     mov        qword ptr [rsp - 8], rax
01742 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01746 89442478                       mov        dword ptr [rsp + 0x78], eax
0174a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174f 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01754 c5f877                         vzeroupper 
01757 e884e4b4ff                     call       0x7f1e7f9d7d60
0175c 0f1f840054180006               nop        dword ptr [rax + rax + 0x6001854]
01764 beccffffff                     mov        esi, 0xffffffcc
01769 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0176e 48ffb42480000000               push       qword ptr [rsp + 0x80]
01776 488f0424                       pop        qword ptr [rsp]
0177a 48894424f8                     mov        qword ptr [rsp - 8], rax
0177f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01783 89442408                       mov        dword ptr [rsp + 8], eax
01787 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178c 48ff742420                     push       qword ptr [rsp + 0x20]
01791 488f442418                     pop        qword ptr [rsp + 0x18]
01796 48894424f8                     mov        qword ptr [rsp - 8], rax
0179b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0179f 8944240c                       mov        dword ptr [rsp + 0xc], eax
017a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a8 895c2434                       mov        dword ptr [rsp + 0x34], ebx
017ac 48894424f8                     mov        qword ptr [rsp - 8], rax
017b1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
017b5 89442438                       mov        dword ptr [rsp + 0x38], eax
017b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017be 48ff742450                     push       qword ptr [rsp + 0x50]
017c3 488f442440                     pop        qword ptr [rsp + 0x40]
017c8 48894424f8                     mov        qword ptr [rsp - 8], rax
017cd 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017d1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017da 48ff742458                     push       qword ptr [rsp + 0x58]
017df 488f442448                     pop        qword ptr [rsp + 0x48]
017e4 48ff742460                     push       qword ptr [rsp + 0x60]
017e9 488f442450                     pop        qword ptr [rsp + 0x50]
017ee 48894424f8                     mov        qword ptr [rsp - 8], rax
017f3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017f7 89442458                       mov        dword ptr [rsp + 0x58], eax
017fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01800 48894424f8                     mov        qword ptr [rsp - 8], rax
01805 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01809 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0180d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01812 48894424f8                     mov        qword ptr [rsp - 8], rax
01817 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0181b 89442460                       mov        dword ptr [rsp + 0x60], eax
0181f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01824 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01829 48894424f8                     mov        qword ptr [rsp - 8], rax
0182e 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
01835 89442468                       mov        dword ptr [rsp + 0x68], eax
01839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183e 48894424f8                     mov        qword ptr [rsp - 8], rax
01843 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0184a 89442478                       mov        dword ptr [rsp + 0x78], eax
0184e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01853 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01858 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01861 666690                         nop        
01864 c5f877                         vzeroupper 
01867 e874e3b4ff                     call       0x7f1e7f9d7d60
0186c 0f1f840064190007               nop        dword ptr [rax + rax + 0x7001964]
01874 bee4ffffff                     mov        esi, 0xffffffe4
01879 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0187e 48894424f8                     mov        qword ptr [rsp - 8], rax
01883 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01887 89442408                       mov        dword ptr [rsp + 8], eax
0188b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01890 48ff742420                     push       qword ptr [rsp + 0x20]
01895 488f442418                     pop        qword ptr [rsp + 0x18]
0189a 48894424f8                     mov        qword ptr [rsp - 8], rax
0189f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018a3 8944240c                       mov        dword ptr [rsp + 0xc], eax
018a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ac 48894424f8                     mov        qword ptr [rsp - 8], rax
018b1 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
018b5 89442434                       mov        dword ptr [rsp + 0x34], eax
018b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018be 48894424f8                     mov        qword ptr [rsp - 8], rax
018c3 8b442440                       mov        eax, dword ptr [rsp + 0x40]
018c7 89442438                       mov        dword ptr [rsp + 0x38], eax
018cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d0 48ff742450                     push       qword ptr [rsp + 0x50]
018d5 488f442440                     pop        qword ptr [rsp + 0x40]
018da 48894424f8                     mov        qword ptr [rsp - 8], rax
018df 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
018e3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ec 48ff742458                     push       qword ptr [rsp + 0x58]
018f1 488f442448                     pop        qword ptr [rsp + 0x48]
018f6 48ff742460                     push       qword ptr [rsp + 0x60]
018fb 488f442450                     pop        qword ptr [rsp + 0x50]
01900 48894424f8                     mov        qword ptr [rsp - 8], rax
01905 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01909 89442458                       mov        dword ptr [rsp + 0x58], eax
0190d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01912 48894424f8                     mov        qword ptr [rsp - 8], rax
01917 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0191b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0191f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01924 48894424f8                     mov        qword ptr [rsp - 8], rax
01929 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0192d 89442460                       mov        dword ptr [rsp + 0x60], eax
01931 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01936 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0193b 90                             nop        
0193c c5f877                         vzeroupper 
0193f e89ce2b4ff                     call       0x7f1e7f9d7d60
01944 0f1f84003c1a0008               nop        dword ptr [rax + rax + 0x8001a3c]
0194c bee4ffffff                     mov        esi, 0xffffffe4
01951 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01956 48894424f8                     mov        qword ptr [rsp - 8], rax
0195b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0195f 89442408                       mov        dword ptr [rsp + 8], eax
01963 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01968 48ff742420                     push       qword ptr [rsp + 0x20]
0196d 488f442418                     pop        qword ptr [rsp + 0x18]
01972 48894424f8                     mov        qword ptr [rsp - 8], rax
01977 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0197b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0197f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01984 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01989 48894424f8                     mov        qword ptr [rsp - 8], rax
0198e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01992 89442438                       mov        dword ptr [rsp + 0x38], eax
01996 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199b 48ff742450                     push       qword ptr [rsp + 0x50]
019a0 488f442440                     pop        qword ptr [rsp + 0x40]
019a5 48894424f8                     mov        qword ptr [rsp - 8], rax
019aa 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019ae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b7 48ff742458                     push       qword ptr [rsp + 0x58]
019bc 488f442448                     pop        qword ptr [rsp + 0x48]
019c1 48ff742460                     push       qword ptr [rsp + 0x60]
019c6 488f442450                     pop        qword ptr [rsp + 0x50]
019cb 48894424f8                     mov        qword ptr [rsp - 8], rax
019d0 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019d4 89442458                       mov        dword ptr [rsp + 0x58], eax
019d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dd 48894424f8                     mov        qword ptr [rsp - 8], rax
019e2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019e6 89442460                       mov        dword ptr [rsp + 0x60], eax
019ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ef 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
019f4 895c2474                       mov        dword ptr [rsp + 0x74], ebx
019f8 c5f877                         vzeroupper 
019fb e8e0e1b4ff                     call       0x7f1e7f9d7d60
01a00 0f1f8400f81a0009               nop        dword ptr [rax + rax + 0x9001af8]
01a08 bee4ffffff                     mov        esi, 0xffffffe4
01a0d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01a12 48ffb42480000000               push       qword ptr [rsp + 0x80]
01a1a 488f0424                       pop        qword ptr [rsp]
01a1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a23 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a27 89442408                       mov        dword ptr [rsp + 8], eax
01a2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a30 48ff742420                     push       qword ptr [rsp + 0x20]
01a35 488f442418                     pop        qword ptr [rsp + 0x18]
01a3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a43 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a51 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a55 89442438                       mov        dword ptr [rsp + 0x38], eax
01a59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5e 48ff742450                     push       qword ptr [rsp + 0x50]
01a63 488f442440                     pop        qword ptr [rsp + 0x40]
01a68 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01a71 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7a 48ff742458                     push       qword ptr [rsp + 0x58]
01a7f 488f442448                     pop        qword ptr [rsp + 0x48]
01a84 48ff742460                     push       qword ptr [rsp + 0x60]
01a89 488f442450                     pop        qword ptr [rsp + 0x50]
01a8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a93 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a97 89442458                       mov        dword ptr [rsp + 0x58], eax
01a9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa0 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01aa9 89442460                       mov        dword ptr [rsp + 0x60], eax
01aad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab2 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01ab7 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01abc 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01ac0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01ac9 666690                         nop        
01acc c5f877                         vzeroupper 
01acf e80ce1b4ff                     call       0x7f1e7f9d7d60
01ad4 0f1f8400cc1b000a               nop        dword ptr [rax + rax + 0xa001bcc]
01adc beccffffff                     mov        esi, 0xffffffcc
01ae1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01ae6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aeb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01aef 89442408                       mov        dword ptr [rsp + 8], eax
01af3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af8 48ff742420                     push       qword ptr [rsp + 0x20]
01afd 488f442418                     pop        qword ptr [rsp + 0x18]
01b02 48894424f8                     mov        qword ptr [rsp - 8], rax
01b07 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b0b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b14 4489742430                     mov        dword ptr [rsp + 0x30], r14d
01b19 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01b22 89442438                       mov        dword ptr [rsp + 0x38], eax
01b26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2b 48ff742450                     push       qword ptr [rsp + 0x50]
01b30 488f442440                     pop        qword ptr [rsp + 0x40]
01b35 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b3e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b47 48ff742458                     push       qword ptr [rsp + 0x58]
01b4c 488f442448                     pop        qword ptr [rsp + 0x48]
01b51 48ff742460                     push       qword ptr [rsp + 0x60]
01b56 488f442450                     pop        qword ptr [rsp + 0x50]
01b5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b60 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01b64 89442458                       mov        dword ptr [rsp + 0x58], eax
01b68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b72 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b76 89442460                       mov        dword ptr [rsp + 0x60], eax
01b7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7f 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01b84 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01b89 666690                         nop        
01b8c c5f877                         vzeroupper 
01b8f e84ce0b4ff                     call       0x7f1e7f9d7d60
01b94 0f1f84008c1c000b               nop        dword ptr [rax + rax + 0xb001c8c]
01b9c be45ffffff                     mov        esi, 0xffffff45
01ba1 4c89542408                     mov        qword ptr [rsp + 8], r10
01ba6 6690                           nop        
01ba8 c5f877                         vzeroupper 
01bab e830e0b4ff                     call       0x7f1e7f9d7d60
01bb0 0f1f8400a81c000c               nop        dword ptr [rax + rax + 0xc001ca8]
01bb8 be45ffffff                     mov        esi, 0xffffff45
01bbd 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01bc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bc7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bcb 89442408                       mov        dword ptr [rsp + 8], eax
01bcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bd4 48ff742420                     push       qword ptr [rsp + 0x20]
01bd9 488f442418                     pop        qword ptr [rsp + 0x18]
01bde 48894424f8                     mov        qword ptr [rsp - 8], rax
01be3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01be7 8944240c                       mov        dword ptr [rsp + 0xc], eax
01beb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf0 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01bf9 89442438                       mov        dword ptr [rsp + 0x38], eax
01bfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c02 48ff742450                     push       qword ptr [rsp + 0x50]
01c07 488f442440                     pop        qword ptr [rsp + 0x40]
01c0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c11 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c15 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1e 48ff742458                     push       qword ptr [rsp + 0x58]
01c23 488f442448                     pop        qword ptr [rsp + 0x48]
01c28 48ff742460                     push       qword ptr [rsp + 0x60]
01c2d 488f442450                     pop        qword ptr [rsp + 0x50]
01c32 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01c37 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01c3c c5f877                         vzeroupper 
01c3f e89cdfb4ff                     call       0x7f1e7f9d7d60
01c44 0f1f84003c1d000d               nop        dword ptr [rax + rax + 0xd001d3c]
01c4c 4d3bda                         cmp        r11, r10
01c4f bdffffffff                     mov        ebp, 0xffffffff
01c54 7c08                           jl         0x7f1e7fe89dde
01c56 400f95c5                       setne      bpl
01c5a 400fb6ed                       movzx      ebp, bpl
01c5e be45ffffff                     mov        esi, 0xffffff45
01c63 48ff742418                     push       qword ptr [rsp + 0x18]
01c68 488f0424                       pop        qword ptr [rsp]
01c6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c71 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c75 89442414                       mov        dword ptr [rsp + 0x14], eax
01c79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c83 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01c87 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c90 48ff742450                     push       qword ptr [rsp + 0x50]
01c95 488f442448                     pop        qword ptr [rsp + 0x48]
01c9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ca3 89442444                       mov        dword ptr [rsp + 0x44], eax
01ca7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cac 48ff742458                     push       qword ptr [rsp + 0x58]
01cb1 488f442450                     pop        qword ptr [rsp + 0x50]
01cb6 48ff742460                     push       qword ptr [rsp + 0x60]
01cbb 488f442458                     pop        qword ptr [rsp + 0x58]
01cc0 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01cc9 89442460                       mov        dword ptr [rsp + 0x60], eax
01ccd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd7 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01cdb 89442464                       mov        dword ptr [rsp + 0x64], eax
01cdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ced 89442468                       mov        dword ptr [rsp + 0x68], eax
01cf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf6 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01cfb 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01d00 c5f877                         vzeroupper 
01d03 e8d8deb4ff                     call       0x7f1e7f9d7d60
01d08 0f1f8400001e000e               nop        dword ptr [rax + rax + 0xe001e00]
01d10 be45ffffff                     mov        esi, 0xffffff45
01d15 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01d1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d23 89442408                       mov        dword ptr [rsp + 8], eax
01d27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2c 48ff742420                     push       qword ptr [rsp + 0x20]
01d31 488f442418                     pop        qword ptr [rsp + 0x18]
01d36 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d3f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d48 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01d51 89442438                       mov        dword ptr [rsp + 0x38], eax
01d55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5a 48ff742450                     push       qword ptr [rsp + 0x50]
01d5f 488f442440                     pop        qword ptr [rsp + 0x40]
01d64 48894424f8                     mov        qword ptr [rsp - 8], rax
01d69 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01d6d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d76 48ff742458                     push       qword ptr [rsp + 0x58]
01d7b 488f442448                     pop        qword ptr [rsp + 0x48]
01d80 48ff742460                     push       qword ptr [rsp + 0x60]
01d85 488f442450                     pop        qword ptr [rsp + 0x50]
01d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d93 89442460                       mov        dword ptr [rsp + 0x60], eax
01d97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9c 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01da1 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01da6 6690                           nop        
01da8 c5f877                         vzeroupper 
01dab e830deb4ff                     call       0x7f1e7f9d7d60
01db0 0f1f8400a81e000f               nop        dword ptr [rax + rax + 0xf001ea8]
01db8 be45ffffff                     mov        esi, 0xffffff45
01dbd 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01dc2 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01dcb 89442408                       mov        dword ptr [rsp + 8], eax
01dcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd4 48ff742420                     push       qword ptr [rsp + 0x20]
01dd9 488f442418                     pop        qword ptr [rsp + 0x18]
01dde 48894424f8                     mov        qword ptr [rsp - 8], rax
01de3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01de7 8944240c                       mov        dword ptr [rsp + 0xc], eax
01deb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df0 48894424f8                     mov        qword ptr [rsp - 8], rax
01df5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01df9 89442438                       mov        dword ptr [rsp + 0x38], eax
01dfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e02 48ff742450                     push       qword ptr [rsp + 0x50]
01e07 488f442440                     pop        qword ptr [rsp + 0x40]
01e0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e11 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e15 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1e 48ff742458                     push       qword ptr [rsp + 0x58]
01e23 488f442448                     pop        qword ptr [rsp + 0x48]
01e28 48ff742460                     push       qword ptr [rsp + 0x60]
01e2d 488f442450                     pop        qword ptr [rsp + 0x50]
01e32 48894424f8                     mov        qword ptr [rsp - 8], rax
01e37 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e3b 89442458                       mov        dword ptr [rsp + 0x58], eax
01e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e44 48894424f8                     mov        qword ptr [rsp - 8], rax
01e49 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e4d 89442460                       mov        dword ptr [rsp + 0x60], eax
01e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e56 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01e5b 90                             nop        
01e5c c5f877                         vzeroupper 
01e5f e87cddb4ff                     call       0x7f1e7f9d7d60
01e64 0f1f84005c1f0010               nop        dword ptr [rax + rax + 0x10001f5c]
01e6c 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01e71 4d3bd8                         cmp        r11, r8
01e74 bdffffffff                     mov        ebp, 0xffffffff
01e79 7c08                           jl         0x7f1e7fe8a003
01e7b 400f95c5                       setne      bpl
01e7f 400fb6ed                       movzx      ebp, bpl
01e83 be45ffffff                     mov        esi, 0xffffff45
01e88 48ff742418                     push       qword ptr [rsp + 0x18]
01e8d 488f0424                       pop        qword ptr [rsp]
01e91 48894424f8                     mov        qword ptr [rsp - 8], rax
01e96 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e9a 89442414                       mov        dword ptr [rsp + 0x14], eax
01e9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea8 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01eac 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01eb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb5 48ff742450                     push       qword ptr [rsp + 0x50]
01eba 488f442448                     pop        qword ptr [rsp + 0x48]
01ebf 48ff742458                     push       qword ptr [rsp + 0x58]
01ec4 488f442450                     pop        qword ptr [rsp + 0x50]
01ec9 48ff742460                     push       qword ptr [rsp + 0x60]
01ece 488f442458                     pop        qword ptr [rsp + 0x58]
01ed3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed8 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01edc 89442460                       mov        dword ptr [rsp + 0x60], eax
01ee0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee5 48894424f8                     mov        qword ptr [rsp - 8], rax
01eea 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01eee 89442464                       mov        dword ptr [rsp + 0x64], eax
01ef2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef7 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01efc 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01f01 666690                         nop        
01f04 c5f877                         vzeroupper 
01f07 e8d4dcb4ff                     call       0x7f1e7f9d7d60
01f0c 0f1f840004200011               nop        dword ptr [rax + rax + 0x11002004]
01f14 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
01f19 4d3bd8                         cmp        r11, r8
01f1c bdffffffff                     mov        ebp, 0xffffffff
01f21 7c08                           jl         0x7f1e7fe8a0ab
01f23 400f95c5                       setne      bpl
01f27 400fb6ed                       movzx      ebp, bpl
01f2b be45ffffff                     mov        esi, 0xffffff45
01f30 48ff742418                     push       qword ptr [rsp + 0x18]
01f35 488f0424                       pop        qword ptr [rsp]
01f39 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f42 89442414                       mov        dword ptr [rsp + 0x14], eax
01f46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f50 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01f54 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5d 48ff742450                     push       qword ptr [rsp + 0x50]
01f62 488f442448                     pop        qword ptr [rsp + 0x48]
01f67 48ff742458                     push       qword ptr [rsp + 0x58]
01f6c 488f442450                     pop        qword ptr [rsp + 0x50]
01f71 48ff742460                     push       qword ptr [rsp + 0x60]
01f76 488f442458                     pop        qword ptr [rsp + 0x58]
01f7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f80 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f84 89442460                       mov        dword ptr [rsp + 0x60], eax
01f88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f92 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f96 89442464                       mov        dword ptr [rsp + 0x64], eax
01f9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9f 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01fa4 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01fa9 666690                         nop        
01fac c5f877                         vzeroupper 
01faf e82cdcb4ff                     call       0x7f1e7f9d7d60
01fb4 0f1f8400ac200012               nop        dword ptr [rax + rax + 0x120020ac]
01fbc bee4ffffff                     mov        esi, 0xffffffe4
01fc1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
01fc6 48ffb42480000000               push       qword ptr [rsp + 0x80]
01fce 488f0424                       pop        qword ptr [rsp]
01fd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fdb 89442408                       mov        dword ptr [rsp + 8], eax
01fdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe4 48ff742420                     push       qword ptr [rsp + 0x20]
01fe9 488f442418                     pop        qword ptr [rsp + 0x18]
01fee 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ff7 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ffb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02000 48894424f8                     mov        qword ptr [rsp - 8], rax
02005 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02009 89442438                       mov        dword ptr [rsp + 0x38], eax
0200d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02012 48ff742450                     push       qword ptr [rsp + 0x50]
02017 488f442440                     pop        qword ptr [rsp + 0x40]
0201c 48894424f8                     mov        qword ptr [rsp - 8], rax
02021 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02025 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02029 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202e 48ff742458                     push       qword ptr [rsp + 0x58]
02033 488f442448                     pop        qword ptr [rsp + 0x48]
02038 48ff742460                     push       qword ptr [rsp + 0x60]
0203d 488f442450                     pop        qword ptr [rsp + 0x50]
02042 48894424f8                     mov        qword ptr [rsp - 8], rax
02047 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0204b 89442458                       mov        dword ptr [rsp + 0x58], eax
0204f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02054 48894424f8                     mov        qword ptr [rsp - 8], rax
02059 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0205d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02061 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02066 48894424f8                     mov        qword ptr [rsp - 8], rax
0206b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0206f 89442460                       mov        dword ptr [rsp + 0x60], eax
02073 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02078 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0207d 894c2468                       mov        dword ptr [rsp + 0x68], ecx
02081 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02086 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0208b 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02093 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0209b 90                             nop        
0209c c5f877                         vzeroupper 
0209f e83cdbb4ff                     call       0x7f1e7f9d7d60
020a4 0f1f84009c210013               nop        dword ptr [rax + rax + 0x1300219c]
020ac bee4ffffff                     mov        esi, 0xffffffe4
020b1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
020b6 48ffb42480000000               push       qword ptr [rsp + 0x80]
020be 488f0424                       pop        qword ptr [rsp]
020c2 48894424f8                     mov        qword ptr [rsp - 8], rax
020c7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
020cb 89442408                       mov        dword ptr [rsp + 8], eax
020cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d4 48ff742420                     push       qword ptr [rsp + 0x20]
020d9 488f442418                     pop        qword ptr [rsp + 0x18]
020de 48894424f8                     mov        qword ptr [rsp - 8], rax
020e3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020e7 8944240c                       mov        dword ptr [rsp + 0xc], eax
020eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f0 48894424f8                     mov        qword ptr [rsp - 8], rax
020f5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
020f9 89442438                       mov        dword ptr [rsp + 0x38], eax
020fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02102 48ff742450                     push       qword ptr [rsp + 0x50]
02107 488f442440                     pop        qword ptr [rsp + 0x40]
0210c 48894424f8                     mov        qword ptr [rsp - 8], rax
02111 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02115 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02119 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211e 48ff742458                     push       qword ptr [rsp + 0x58]
02123 488f442448                     pop        qword ptr [rsp + 0x48]
02128 48ff742460                     push       qword ptr [rsp + 0x60]
0212d 488f442450                     pop        qword ptr [rsp + 0x50]
02132 48894424f8                     mov        qword ptr [rsp - 8], rax
02137 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0213b 89442458                       mov        dword ptr [rsp + 0x58], eax
0213f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02144 48894424f8                     mov        qword ptr [rsp - 8], rax
02149 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0214d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02151 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02156 48894424f8                     mov        qword ptr [rsp - 8], rax
0215b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0215f 89442460                       mov        dword ptr [rsp + 0x60], eax
02163 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02168 48894424f8                     mov        qword ptr [rsp - 8], rax
0216d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02174 89442468                       mov        dword ptr [rsp + 0x68], eax
02178 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217d 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02182 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02187 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0218c 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02191 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
02199 666690                         nop        
0219c c5f877                         vzeroupper 
0219f e83cdab4ff                     call       0x7f1e7f9d7d60
021a4 0f1f84009c220014               nop        dword ptr [rax + rax + 0x1400229c]
021ac beccffffff                     mov        esi, 0xffffffcc
021b1 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
021b6 48ffb42480000000               push       qword ptr [rsp + 0x80]
021be 488f0424                       pop        qword ptr [rsp]
021c2 48894424f8                     mov        qword ptr [rsp - 8], rax
021c7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
021cb 89442408                       mov        dword ptr [rsp + 8], eax
021cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d4 48ff742420                     push       qword ptr [rsp + 0x20]
021d9 488f442418                     pop        qword ptr [rsp + 0x18]
021de 48894424f8                     mov        qword ptr [rsp - 8], rax
021e3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021e7 8944240c                       mov        dword ptr [rsp + 0xc], eax
021eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f0 48894424f8                     mov        qword ptr [rsp - 8], rax
021f5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
021f9 89442438                       mov        dword ptr [rsp + 0x38], eax
021fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02202 48ff742450                     push       qword ptr [rsp + 0x50]
02207 488f442440                     pop        qword ptr [rsp + 0x40]
0220c 48894424f8                     mov        qword ptr [rsp - 8], rax
02211 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02215 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02219 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221e 48ff742458                     push       qword ptr [rsp + 0x58]
02223 488f442448                     pop        qword ptr [rsp + 0x48]
02228 48ff742460                     push       qword ptr [rsp + 0x60]
0222d 488f442450                     pop        qword ptr [rsp + 0x50]
02232 48894424f8                     mov        qword ptr [rsp - 8], rax
02237 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0223b 89442458                       mov        dword ptr [rsp + 0x58], eax
0223f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02244 48894424f8                     mov        qword ptr [rsp - 8], rax
02249 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0224d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02251 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02256 48894424f8                     mov        qword ptr [rsp - 8], rax
0225b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0225f 89442460                       mov        dword ptr [rsp + 0x60], eax
02263 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02268 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0226d 894c2468                       mov        dword ptr [rsp + 0x68], ecx
02271 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02276 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0227b 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02283 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
0228b 90                             nop        
0228c c5f877                         vzeroupper 
0228f e84cd9b4ff                     call       0x7f1e7f9d7d60
02294 0f1f84008c230015               nop        dword ptr [rax + rax + 0x1500238c]
0229c 4183c508                       add        r13d, 8
022a0 be6effffff                     mov        esi, 0xffffff6e
022a5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
022aa 48894424f8                     mov        qword ptr [rsp - 8], rax
022af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
022b3 89442408                       mov        dword ptr [rsp + 8], eax
022b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022bc 48ff742420                     push       qword ptr [rsp + 0x20]
022c1 488f442418                     pop        qword ptr [rsp + 0x18]
022c6 48894424f8                     mov        qword ptr [rsp - 8], rax
022cb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022cf 8944240c                       mov        dword ptr [rsp + 0xc], eax
022d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d8 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
022dd 48894424f8                     mov        qword ptr [rsp - 8], rax
022e2 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022e6 89442438                       mov        dword ptr [rsp + 0x38], eax
022ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ef 48ff742450                     push       qword ptr [rsp + 0x50]
022f4 488f442440                     pop        qword ptr [rsp + 0x40]
022f9 48894424f8                     mov        qword ptr [rsp - 8], rax
022fe 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02302 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02306 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230b 48ff742458                     push       qword ptr [rsp + 0x58]
02310 488f442448                     pop        qword ptr [rsp + 0x48]
02315 48ff742460                     push       qword ptr [rsp + 0x60]
0231a 488f442450                     pop        qword ptr [rsp + 0x50]
0231f 48894424f8                     mov        qword ptr [rsp - 8], rax
02324 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02328 89442458                       mov        dword ptr [rsp + 0x58], eax
0232c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02331 48894424f8                     mov        qword ptr [rsp - 8], rax
02336 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0233a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0233e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02343 48894424f8                     mov        qword ptr [rsp - 8], rax
02348 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0234c 89442460                       mov        dword ptr [rsp + 0x60], eax
02350 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02355 48894424f8                     mov        qword ptr [rsp - 8], rax
0235a 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02361 89442468                       mov        dword ptr [rsp + 0x68], eax
02365 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236a 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
0236f 897c2474                       mov        dword ptr [rsp + 0x74], edi
02373 90                             nop        
02374 c5f877                         vzeroupper 
02377 e864d8b4ff                     call       0x7f1e7f9d7d60
0237c 0f1f840074240016               nop        dword ptr [rax + rax + 0x16002474]
02384 4183c508                       add        r13d, 8
02388 be66ffffff                     mov        esi, 0xffffff66
0238d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02392 48894424f8                     mov        qword ptr [rsp - 8], rax
02397 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0239b 89442408                       mov        dword ptr [rsp + 8], eax
0239f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a4 48ff742420                     push       qword ptr [rsp + 0x20]
023a9 488f442418                     pop        qword ptr [rsp + 0x18]
023ae 48894424f8                     mov        qword ptr [rsp - 8], rax
023b3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023b7 8944240c                       mov        dword ptr [rsp + 0xc], eax
023bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c0 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
023c5 48894424f8                     mov        qword ptr [rsp - 8], rax
023ca 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023ce 89442438                       mov        dword ptr [rsp + 0x38], eax
023d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d7 48ff742450                     push       qword ptr [rsp + 0x50]
023dc 488f442440                     pop        qword ptr [rsp + 0x40]
023e1 48894424f8                     mov        qword ptr [rsp - 8], rax
023e6 8b442448                       mov        eax, dword ptr [rsp + 0x48]
023ea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f3 48ff742458                     push       qword ptr [rsp + 0x58]
023f8 488f442448                     pop        qword ptr [rsp + 0x48]
023fd 48ff742460                     push       qword ptr [rsp + 0x60]
02402 488f442450                     pop        qword ptr [rsp + 0x50]
02407 48894424f8                     mov        qword ptr [rsp - 8], rax
0240c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02410 89442458                       mov        dword ptr [rsp + 0x58], eax
02414 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02419 48894424f8                     mov        qword ptr [rsp - 8], rax
0241e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02422 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02426 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242b 48894424f8                     mov        qword ptr [rsp - 8], rax
02430 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02434 89442460                       mov        dword ptr [rsp + 0x60], eax
02438 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0243d 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02442 897c2474                       mov        dword ptr [rsp + 0x74], edi
02446 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0244a 6690                           nop        
0244c c5f877                         vzeroupper 
0244f e88cd7b4ff                     call       0x7f1e7f9d7d60
02454 0f1f84004c250017               nop        dword ptr [rax + rax + 0x1700254c]
0245c 4533d2                         xor        r10d, r10d
0245f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02464 e9c4dcffff                     jmp        0x7f1e7fe882ad
02469 4533d2                         xor        r10d, r10d
0246c 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
02474 e9dddcffff                     jmp        0x7f1e7fe882d6
02479 4533d2                         xor        r10d, r10d
0247c 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
02484 e9f6dcffff                     jmp        0x7f1e7fe882ff
02489 4533d2                         xor        r10d, r10d
0248c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02491 e911ddffff                     jmp        0x7f1e7fe88327
02496 4533d2                         xor        r10d, r10d
02499 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
024a1 e92addffff                     jmp        0x7f1e7fe88350
024a6 4533d2                         xor        r10d, r10d
024a9 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
024b1 e945ddffff                     jmp        0x7f1e7fe8837b
024b6 beccffffff                     mov        esi, 0xffffffcc
024bb 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
024c0 48ffb42480000000               push       qword ptr [rsp + 0x80]
024c8 488f0424                       pop        qword ptr [rsp]
024cc 48894424f8                     mov        qword ptr [rsp - 8], rax
024d1 8b442410                       mov        eax, dword ptr [rsp + 0x10]
024d5 89442408                       mov        dword ptr [rsp + 8], eax
024d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024de 48ff742420                     push       qword ptr [rsp + 0x20]
024e3 488f442418                     pop        qword ptr [rsp + 0x18]
024e8 48894424f8                     mov        qword ptr [rsp - 8], rax
024ed 8b442428                       mov        eax, dword ptr [rsp + 0x28]
024f1 8944240c                       mov        dword ptr [rsp + 0xc], eax
024f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024fa 48894424f8                     mov        qword ptr [rsp - 8], rax
024ff 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02503 89442438                       mov        dword ptr [rsp + 0x38], eax
02507 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250c 48ff742450                     push       qword ptr [rsp + 0x50]
02511 488f442440                     pop        qword ptr [rsp + 0x40]
02516 48894424f8                     mov        qword ptr [rsp - 8], rax
0251b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0251f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02523 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02528 48ff742458                     push       qword ptr [rsp + 0x58]
0252d 488f442448                     pop        qword ptr [rsp + 0x48]
02532 48ff742460                     push       qword ptr [rsp + 0x60]
02537 488f442450                     pop        qword ptr [rsp + 0x50]
0253c 48894424f8                     mov        qword ptr [rsp - 8], rax
02541 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02545 89442458                       mov        dword ptr [rsp + 0x58], eax
02549 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254e 48894424f8                     mov        qword ptr [rsp - 8], rax
02553 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02557 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0255b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02560 48894424f8                     mov        qword ptr [rsp - 8], rax
02565 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02569 89442460                       mov        dword ptr [rsp + 0x60], eax
0256d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02572 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02577 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0257c 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
02584 c5f877                         vzeroupper 
02587 e854d6b4ff                     call       0x7f1e7f9d7d60
0258c 0f1f840084260018               nop        dword ptr [rax + rax + 0x18002684]
02594 4d8bd9                         mov        r11, r9
02597 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0259c 448bc6                         mov        r8d, esi
0259f 4403442468                     add        r8d, dword ptr [rsp + 0x68]
025a4 4d8bcb                         mov        r9, r11
025a7 4f8b5c030c                     mov        r11, qword ptr [r11 + r8 + 0xc]
025ac 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
025b1 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
025b6 4183c308                       add        r11d, 8
025ba 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
025bf 443bdf                         cmp        r11d, edi
025c2 7cd0                           jl         0x7f1e7fe8a714
025c4 443bd9                         cmp        r11d, ecx
025c7 0f8da71e0000                   jge        0x7f1e7fe8c5f4
025cd 458bd3                         mov        r10d, r11d
025d0 4489542468                     mov        dword ptr [rsp + 0x68], r10d
025d5 498bd9                         mov        rbx, r9
025d8 0f1f840000000000               nop        dword ptr [rax + rax]
025e0 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
025e5 4d63ca                         movsxd     r9, r10d
025e8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
025ed 448bc6                         mov        r8d, esi
025f0 4403442468                     add        r8d, dword ptr [rsp + 0x68]
025f5 458bd8                         mov        r11d, r8d
025f8 4e8b44030c                     mov        r8, qword ptr [rbx + r8 + 0xc]
025fd 4e8944130c                     mov        qword ptr [rbx + r10 + 0xc], r8
02602 4d63db                         movsxd     r11, r11d
02605 4e8b541b14                     mov        r10, qword ptr [rbx + r11 + 0x14]
0260a 4e89540b14                     mov        qword ptr [rbx + r9 + 0x14], r10
0260f 4e8b541b1c                     mov        r10, qword ptr [rbx + r11 + 0x1c]
02614 4e89540b1c                     mov        qword ptr [rbx + r9 + 0x1c], r10
02619 4e8b541b24                     mov        r10, qword ptr [rbx + r11 + 0x24]
0261e 4e89540b24                     mov        qword ptr [rbx + r9 + 0x24], r10
02623 4e8b541b2c                     mov        r10, qword ptr [rbx + r11 + 0x2c]
02628 4e89540b2c                     mov        qword ptr [rbx + r9 + 0x2c], r10
0262d 4e8b541b34                     mov        r10, qword ptr [rbx + r11 + 0x34]
02632 4e89540b34                     mov        qword ptr [rbx + r9 + 0x34], r10
02637 4e8b541b3c                     mov        r10, qword ptr [rbx + r11 + 0x3c]
0263c 4e89540b3c                     mov        qword ptr [rbx + r9 + 0x3c], r10
02641 4e8b541b44                     mov        r10, qword ptr [rbx + r11 + 0x44]
02646 4e89540b44                     mov        qword ptr [rbx + r9 + 0x44], r10
0264b 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02650 4183c340                       add        r11d, 0x40
02654 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02659 443bd9                         cmp        r11d, ecx
0265c 0f8c7effffff                   jl         0x7f1e7fe8a760
02662 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
0266a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0266f 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
02677 0f8dfeeaffff                   jge        0x7f1e7fe892fb
0267d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02682 458bda                         mov        r11d, r10d
02685 666690                         nop        
02688 468d141e                       lea        r10d, [rsi + r11]
0268c 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
02694 4f8b54110c                     mov        r10, qword ptr [r9 + r10 + 0xc]
02699 458bc3                         mov        r8d, r11d
0269c 4f8954010c                     mov        qword ptr [r9 + r8 + 0xc], r10
026a1 4183c308                       add        r11d, 8
026a5 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
026ad 7cd9                           jl         0x7f1e7fe8a808
026af e9c7eaffff                     jmp        0x7f1e7fe892fb
026b4 bee4ffffff                     mov        esi, 0xffffffe4
026b9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
026be 48ffb42480000000               push       qword ptr [rsp + 0x80]
026c6 488f0424                       pop        qword ptr [rsp]
026ca 48894424f8                     mov        qword ptr [rsp - 8], rax
026cf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
026d3 89442408                       mov        dword ptr [rsp + 8], eax
026d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026dc 48ff742420                     push       qword ptr [rsp + 0x20]
026e1 488f442418                     pop        qword ptr [rsp + 0x18]
026e6 48894424f8                     mov        qword ptr [rsp - 8], rax
026eb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026ef 8944240c                       mov        dword ptr [rsp + 0xc], eax
026f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f8 48894424f8                     mov        qword ptr [rsp - 8], rax
026fd 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02701 89442434                       mov        dword ptr [rsp + 0x34], eax
02705 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270a 48894424f8                     mov        qword ptr [rsp - 8], rax
0270f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02713 89442438                       mov        dword ptr [rsp + 0x38], eax
02717 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271c 48ff742450                     push       qword ptr [rsp + 0x50]
02721 488f442440                     pop        qword ptr [rsp + 0x40]
02726 48894424f8                     mov        qword ptr [rsp - 8], rax
0272b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0272f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02733 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02738 48ff742458                     push       qword ptr [rsp + 0x58]
0273d 488f442448                     pop        qword ptr [rsp + 0x48]
02742 48ff742460                     push       qword ptr [rsp + 0x60]
02747 488f442450                     pop        qword ptr [rsp + 0x50]
0274c 48894424f8                     mov        qword ptr [rsp - 8], rax
02751 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02755 89442458                       mov        dword ptr [rsp + 0x58], eax
02759 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0275e 48894424f8                     mov        qword ptr [rsp - 8], rax
02763 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02767 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0276b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02770 48894424f8                     mov        qword ptr [rsp - 8], rax
02775 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02779 89442460                       mov        dword ptr [rsp + 0x60], eax
0277d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02782 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02787 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
0278e 6690                           nop        
02790 c5f877                         vzeroupper 
02793 e848d4b4ff                     call       0x7f1e7f9d7d60
02798 0f1f840090280019               nop        dword ptr [rax + rax + 0x19002890]
027a0 bee4ffffff                     mov        esi, 0xffffffe4
027a5 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
027aa 48894424f8                     mov        qword ptr [rsp - 8], rax
027af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027b3 89442408                       mov        dword ptr [rsp + 8], eax
027b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027bc 48ff742420                     push       qword ptr [rsp + 0x20]
027c1 488f442418                     pop        qword ptr [rsp + 0x18]
027c6 48894424f8                     mov        qword ptr [rsp - 8], rax
027cb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027cf 8944240c                       mov        dword ptr [rsp + 0xc], eax
027d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d8 48894424f8                     mov        qword ptr [rsp - 8], rax
027dd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027e1 89442438                       mov        dword ptr [rsp + 0x38], eax
027e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ea 48ff742450                     push       qword ptr [rsp + 0x50]
027ef 488f442440                     pop        qword ptr [rsp + 0x40]
027f4 48894424f8                     mov        qword ptr [rsp - 8], rax
027f9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
027fd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02801 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02806 48ff742458                     push       qword ptr [rsp + 0x58]
0280b 488f442448                     pop        qword ptr [rsp + 0x48]
02810 48ff742460                     push       qword ptr [rsp + 0x60]
02815 488f442450                     pop        qword ptr [rsp + 0x50]
0281a 48894424f8                     mov        qword ptr [rsp - 8], rax
0281f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02823 89442458                       mov        dword ptr [rsp + 0x58], eax
02827 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282c 48894424f8                     mov        qword ptr [rsp - 8], rax
02831 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02835 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283e 48894424f8                     mov        qword ptr [rsp - 8], rax
02843 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02847 89442460                       mov        dword ptr [rsp + 0x60], eax
0284b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02850 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02855 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02859 666690                         nop        
0285c c5f877                         vzeroupper 
0285f e87cd3b4ff                     call       0x7f1e7f9d7d60
02864 0f1f84005c29001a               nop        dword ptr [rax + rax + 0x1a00295c]
0286c bee4ffffff                     mov        esi, 0xffffffe4
02871 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02876 48894424f8                     mov        qword ptr [rsp - 8], rax
0287b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0287f 89442408                       mov        dword ptr [rsp + 8], eax
02883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02888 48ff742420                     push       qword ptr [rsp + 0x20]
0288d 488f442418                     pop        qword ptr [rsp + 0x18]
02892 48894424f8                     mov        qword ptr [rsp - 8], rax
02897 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0289b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0289f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a4 48894424f8                     mov        qword ptr [rsp - 8], rax
028a9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028ad 89442438                       mov        dword ptr [rsp + 0x38], eax
028b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b6 48ff742450                     push       qword ptr [rsp + 0x50]
028bb 488f442440                     pop        qword ptr [rsp + 0x40]
028c0 48ff742458                     push       qword ptr [rsp + 0x58]
028c5 488f442448                     pop        qword ptr [rsp + 0x48]
028ca 48ff742460                     push       qword ptr [rsp + 0x60]
028cf 488f442450                     pop        qword ptr [rsp + 0x50]
028d4 48894424f8                     mov        qword ptr [rsp - 8], rax
028d9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
028dd 89442458                       mov        dword ptr [rsp + 0x58], eax
028e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e6 48894424f8                     mov        qword ptr [rsp - 8], rax
028eb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
028ef 89442460                       mov        dword ptr [rsp + 0x60], eax
028f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f8 4489742464                     mov        dword ptr [rsp + 0x64], r14d
028fd 666690                         nop        
02900 c5f877                         vzeroupper 
02903 e8d8d2b4ff                     call       0x7f1e7f9d7d60
02908 0f1f8400002a001b               nop        dword ptr [rax + rax + 0x1b002a00]
02910 bee4ffffff                     mov        esi, 0xffffffe4
02915 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0291a 48ffb42480000000               push       qword ptr [rsp + 0x80]
02922 488f0424                       pop        qword ptr [rsp]
02926 48894424f8                     mov        qword ptr [rsp - 8], rax
0292b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0292f 89442408                       mov        dword ptr [rsp + 8], eax
02933 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02938 48ff742420                     push       qword ptr [rsp + 0x20]
0293d 488f442418                     pop        qword ptr [rsp + 0x18]
02942 48894424f8                     mov        qword ptr [rsp - 8], rax
02947 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0294b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0294f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02954 48894424f8                     mov        qword ptr [rsp - 8], rax
02959 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0295d 89442434                       mov        dword ptr [rsp + 0x34], eax
02961 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02966 48ff742450                     push       qword ptr [rsp + 0x50]
0296b 488f442438                     pop        qword ptr [rsp + 0x38]
02970 48894424f8                     mov        qword ptr [rsp - 8], rax
02975 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02979 89442440                       mov        dword ptr [rsp + 0x40], eax
0297d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02982 48ff742458                     push       qword ptr [rsp + 0x58]
02987 488f442448                     pop        qword ptr [rsp + 0x48]
0298c 48ff742460                     push       qword ptr [rsp + 0x60]
02991 488f442450                     pop        qword ptr [rsp + 0x50]
02996 48894424f8                     mov        qword ptr [rsp - 8], rax
0299b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0299f 89442444                       mov        dword ptr [rsp + 0x44], eax
029a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029a8 48894424f8                     mov        qword ptr [rsp - 8], rax
029ad 8b442478                       mov        eax, dword ptr [rsp + 0x78]
029b1 89442458                       mov        dword ptr [rsp + 0x58], eax
029b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ba 48894424f8                     mov        qword ptr [rsp - 8], rax
029bf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029c3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
029c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029cc 4489542474                     mov        dword ptr [rsp + 0x74], r10d
029d1 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
029d9 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
029e1 666690                         nop        
029e4 c5f877                         vzeroupper 
029e7 e8f4d1b4ff                     call       0x7f1e7f9d7d60
029ec 0f1f8400e42a001c               nop        dword ptr [rax + rax + 0x1c002ae4]
029f4 bee4ffffff                     mov        esi, 0xffffffe4
029f9 48ff742418                     push       qword ptr [rsp + 0x18]
029fe 488f0424                       pop        qword ptr [rsp]
02a02 48ffb42480000000               push       qword ptr [rsp + 0x80]
02a0a 488f442408                     pop        qword ptr [rsp + 8]
02a0f 48894424f8                     mov        qword ptr [rsp - 8], rax
02a14 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a18 89442414                       mov        dword ptr [rsp + 0x14], eax
02a1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a21 48894424f8                     mov        qword ptr [rsp - 8], rax
02a26 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a2a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a33 48ff742450                     push       qword ptr [rsp + 0x50]
02a38 488f442440                     pop        qword ptr [rsp + 0x40]
02a3d 48ff742458                     push       qword ptr [rsp + 0x58]
02a42 488f442450                     pop        qword ptr [rsp + 0x50]
02a47 48ff742460                     push       qword ptr [rsp + 0x60]
02a4c 488f442458                     pop        qword ptr [rsp + 0x58]
02a51 48894424f8                     mov        qword ptr [rsp - 8], rax
02a56 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02a5a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02a5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a63 48894424f8                     mov        qword ptr [rsp - 8], rax
02a68 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02a6c 89442460                       mov        dword ptr [rsp + 0x60], eax
02a70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a75 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a7e 89442464                       mov        dword ptr [rsp + 0x64], eax
02a82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a87 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02a8c 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02a94 c5f877                         vzeroupper 
02a97 e844d1b4ff                     call       0x7f1e7f9d7d60
02a9c 0f1f8400942b001d               nop        dword ptr [rax + rax + 0x1d002b94]
02aa4 418d6d01                       lea        ebp, [r13 + 1]
02aa8 bee4ffffff                     mov        esi, 0xffffffe4
02aad 48ff742418                     push       qword ptr [rsp + 0x18]
02ab2 488f0424                       pop        qword ptr [rsp]
02ab6 48ffb42480000000               push       qword ptr [rsp + 0x80]
02abe 488f442408                     pop        qword ptr [rsp + 8]
02ac3 48ffb42490000000               push       qword ptr [rsp + 0x90]
02acb 488f442418                     pop        qword ptr [rsp + 0x18]
02ad0 48894424f8                     mov        qword ptr [rsp - 8], rax
02ad5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02ad9 89442414                       mov        dword ptr [rsp + 0x14], eax
02add 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ae2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae7 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02aeb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02aef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af4 48ff742450                     push       qword ptr [rsp + 0x50]
02af9 488f442440                     pop        qword ptr [rsp + 0x40]
02afe 48ff742458                     push       qword ptr [rsp + 0x58]
02b03 488f442450                     pop        qword ptr [rsp + 0x50]
02b08 48ff742460                     push       qword ptr [rsp + 0x60]
02b0d 488f442458                     pop        qword ptr [rsp + 0x58]
02b12 48894424f8                     mov        qword ptr [rsp - 8], rax
02b17 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02b1b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02b1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b24 48894424f8                     mov        qword ptr [rsp - 8], rax
02b29 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02b2d 89442460                       mov        dword ptr [rsp + 0x60], eax
02b31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b36 48894424f8                     mov        qword ptr [rsp - 8], rax
02b3b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b3f 89442464                       mov        dword ptr [rsp + 0x64], eax
02b43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b48 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02b4d 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02b52 48894424f8                     mov        qword ptr [rsp - 8], rax
02b57 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02b5e 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02b62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b67 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
02b6f 90                             nop        
02b70 c5f877                         vzeroupper 
02b73 e868d0b4ff                     call       0x7f1e7f9d7d60
02b78 0f1f8400702c001e               nop        dword ptr [rax + rax + 0x1e002c70]
02b80 bee4ffffff                     mov        esi, 0xffffffe4
02b85 48ff742418                     push       qword ptr [rsp + 0x18]
02b8a 488f0424                       pop        qword ptr [rsp]
02b8e 48ffb42480000000               push       qword ptr [rsp + 0x80]
02b96 488f442408                     pop        qword ptr [rsp + 8]
02b9b 48894424f8                     mov        qword ptr [rsp - 8], rax
02ba0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02ba4 89442414                       mov        dword ptr [rsp + 0x14], eax
02ba8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bad 48894424f8                     mov        qword ptr [rsp - 8], rax
02bb2 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02bb6 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02bba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bbf 48ff742450                     push       qword ptr [rsp + 0x50]
02bc4 488f442440                     pop        qword ptr [rsp + 0x40]
02bc9 48ff742458                     push       qword ptr [rsp + 0x58]
02bce 488f442450                     pop        qword ptr [rsp + 0x50]
02bd3 48ff742460                     push       qword ptr [rsp + 0x60]
02bd8 488f442458                     pop        qword ptr [rsp + 0x58]
02bdd 48894424f8                     mov        qword ptr [rsp - 8], rax
02be2 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02be6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02bea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bef 48894424f8                     mov        qword ptr [rsp - 8], rax
02bf4 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02bf8 89442460                       mov        dword ptr [rsp + 0x60], eax
02bfc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c01 48894424f8                     mov        qword ptr [rsp - 8], rax
02c06 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c0a 89442464                       mov        dword ptr [rsp + 0x64], eax
02c0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c13 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02c18 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02c1d 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
02c25 666690                         nop        
02c28 c5f877                         vzeroupper 
02c2b e8b0cfb4ff                     call       0x7f1e7f9d7d60
02c30 0f1f8400282d001f               nop        dword ptr [rax + rax + 0x1f002d28]
02c38 bee4ffffff                     mov        esi, 0xffffffe4
02c3d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02c42 48894424f8                     mov        qword ptr [rsp - 8], rax
02c47 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c4b 89442408                       mov        dword ptr [rsp + 8], eax
02c4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c54 48ff742420                     push       qword ptr [rsp + 0x20]
02c59 488f442418                     pop        qword ptr [rsp + 0x18]
02c5e 48894424f8                     mov        qword ptr [rsp - 8], rax
02c63 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c67 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c70 48894424f8                     mov        qword ptr [rsp - 8], rax
02c75 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02c79 89442434                       mov        dword ptr [rsp + 0x34], eax
02c7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c82 48ff742450                     push       qword ptr [rsp + 0x50]
02c87 488f442438                     pop        qword ptr [rsp + 0x38]
02c8c 48894424f8                     mov        qword ptr [rsp - 8], rax
02c91 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02c95 89442440                       mov        dword ptr [rsp + 0x40], eax
02c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c9e 48ff742458                     push       qword ptr [rsp + 0x58]
02ca3 488f442448                     pop        qword ptr [rsp + 0x48]
02ca8 48ff742460                     push       qword ptr [rsp + 0x60]
02cad 488f442450                     pop        qword ptr [rsp + 0x50]
02cb2 48894424f8                     mov        qword ptr [rsp - 8], rax
02cb7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02cbb 89442444                       mov        dword ptr [rsp + 0x44], eax
02cbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cc4 48894424f8                     mov        qword ptr [rsp - 8], rax
02cc9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02ccd 89442458                       mov        dword ptr [rsp + 0x58], eax
02cd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cd6 48894424f8                     mov        qword ptr [rsp - 8], rax
02cdb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02cdf 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ce3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ce8 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02ced 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02cf2 6690                           nop        
02cf4 c5f877                         vzeroupper 
02cf7 e8e4ceb4ff                     call       0x7f1e7f9d7d60
02cfc 0f1f8400f42d0020               nop        dword ptr [rax + rax + 0x20002df4]
02d04 bee4ffffff                     mov        esi, 0xffffffe4
02d09 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02d0e 48ffb42480000000               push       qword ptr [rsp + 0x80]
02d16 488f0424                       pop        qword ptr [rsp]
02d1a 48894424f8                     mov        qword ptr [rsp - 8], rax
02d1f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02d23 89442408                       mov        dword ptr [rsp + 8], eax
02d27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d2c 48ffb42490000000               push       qword ptr [rsp + 0x90]
02d34 488f442410                     pop        qword ptr [rsp + 0x10]
02d39 48ff742420                     push       qword ptr [rsp + 0x20]
02d3e 488f442418                     pop        qword ptr [rsp + 0x18]
02d43 48894424f8                     mov        qword ptr [rsp - 8], rax
02d48 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d4c 8944240c                       mov        dword ptr [rsp + 0xc], eax
02d50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d55 48894424f8                     mov        qword ptr [rsp - 8], rax
02d5a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02d5e 89442434                       mov        dword ptr [rsp + 0x34], eax
02d62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d67 48ff742450                     push       qword ptr [rsp + 0x50]
02d6c 488f442438                     pop        qword ptr [rsp + 0x38]
02d71 48894424f8                     mov        qword ptr [rsp - 8], rax
02d76 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02d7a 89442440                       mov        dword ptr [rsp + 0x40], eax
02d7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d83 48ff742458                     push       qword ptr [rsp + 0x58]
02d88 488f442448                     pop        qword ptr [rsp + 0x48]
02d8d 48ff742460                     push       qword ptr [rsp + 0x60]
02d92 488f442450                     pop        qword ptr [rsp + 0x50]
02d97 48894424f8                     mov        qword ptr [rsp - 8], rax
02d9c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02da0 89442444                       mov        dword ptr [rsp + 0x44], eax
02da4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02da9 48894424f8                     mov        qword ptr [rsp - 8], rax
02dae 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02db2 89442458                       mov        dword ptr [rsp + 0x58], eax
02db6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dbb 48894424f8                     mov        qword ptr [rsp - 8], rax
02dc0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02dc4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02dc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dcd 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02dd2 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
02dd7 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02ddf 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
02de7 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
02dee 6690                           nop        
02df0 c5f877                         vzeroupper 
02df3 e8e8cdb4ff                     call       0x7f1e7f9d7d60
02df8 0f1f8400f02e0021               nop        dword ptr [rax + rax + 0x21002ef0]
02e00 bee4ffffff                     mov        esi, 0xffffffe4
02e05 48ff742418                     push       qword ptr [rsp + 0x18]
02e0a 488f0424                       pop        qword ptr [rsp]
02e0e 48ffb42480000000               push       qword ptr [rsp + 0x80]
02e16 488f442408                     pop        qword ptr [rsp + 8]
02e1b 48894424f8                     mov        qword ptr [rsp - 8], rax
02e20 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e24 89442414                       mov        dword ptr [rsp + 0x14], eax
02e28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e2d 48894424f8                     mov        qword ptr [rsp - 8], rax
02e32 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02e36 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02e3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e3f 48ff742450                     push       qword ptr [rsp + 0x50]
02e44 488f442440                     pop        qword ptr [rsp + 0x40]
02e49 48ff742458                     push       qword ptr [rsp + 0x58]
02e4e 488f442450                     pop        qword ptr [rsp + 0x50]
02e53 48ff742460                     push       qword ptr [rsp + 0x60]
02e58 488f442458                     pop        qword ptr [rsp + 0x58]
02e5d 48894424f8                     mov        qword ptr [rsp - 8], rax
02e62 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02e66 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e6f 48894424f8                     mov        qword ptr [rsp - 8], rax
02e74 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02e78 89442460                       mov        dword ptr [rsp + 0x60], eax
02e7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e81 48894424f8                     mov        qword ptr [rsp - 8], rax
02e86 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e8a 89442464                       mov        dword ptr [rsp + 0x64], eax
02e8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e93 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02e98 48894424f8                     mov        qword ptr [rsp - 8], rax
02e9d 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
02ea4 89442478                       mov        dword ptr [rsp + 0x78], eax
02ea8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ead 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
02eb2 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
02eba 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
02ec1 666690                         nop        
02ec4 c5f877                         vzeroupper 
02ec7 e814cdb4ff                     call       0x7f1e7f9d7d60
02ecc 0f1f8400c42f0022               nop        dword ptr [rax + rax + 0x22002fc4]
02ed4 beccffffff                     mov        esi, 0xffffffcc
02ed9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
02ede 48ffb42480000000               push       qword ptr [rsp + 0x80]
02ee6 488f0424                       pop        qword ptr [rsp]
02eea 48894424f8                     mov        qword ptr [rsp - 8], rax
02eef 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02ef3 89442408                       mov        dword ptr [rsp + 8], eax
02ef7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02efc 48ffb42490000000               push       qword ptr [rsp + 0x90]
02f04 488f442410                     pop        qword ptr [rsp + 0x10]
02f09 48ff742420                     push       qword ptr [rsp + 0x20]
02f0e 488f442418                     pop        qword ptr [rsp + 0x18]
02f13 48894424f8                     mov        qword ptr [rsp - 8], rax
02f18 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02f1c 8944240c                       mov        dword ptr [rsp + 0xc], eax
02f20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f25 48894424f8                     mov        qword ptr [rsp - 8], rax
02f2a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02f2e 89442434                       mov        dword ptr [rsp + 0x34], eax
02f32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f37 48ff742450                     push       qword ptr [rsp + 0x50]
02f3c 488f442438                     pop        qword ptr [rsp + 0x38]
02f41 48894424f8                     mov        qword ptr [rsp - 8], rax
02f46 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02f4a 89442440                       mov        dword ptr [rsp + 0x40], eax
02f4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f53 48ff742458                     push       qword ptr [rsp + 0x58]
02f58 488f442448                     pop        qword ptr [rsp + 0x48]
02f5d 48ff742460                     push       qword ptr [rsp + 0x60]
02f62 488f442450                     pop        qword ptr [rsp + 0x50]
02f67 48894424f8                     mov        qword ptr [rsp - 8], rax
02f6c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02f70 89442444                       mov        dword ptr [rsp + 0x44], eax
02f74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f79 48894424f8                     mov        qword ptr [rsp - 8], rax
02f7e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02f82 89442458                       mov        dword ptr [rsp + 0x58], eax
02f86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f8b 48894424f8                     mov        qword ptr [rsp - 8], rax
02f90 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02f94 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02f98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f9d 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02fa2 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
02fa7 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02faf 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
02fb7 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
02fbe 6690                           nop        
02fc0 c5f877                         vzeroupper 
02fc3 e818ccb4ff                     call       0x7f1e7f9d7d60
02fc8 0f1f8400c0300023               nop        dword ptr [rax + rax + 0x230030c0]
02fd0 beccffffff                     mov        esi, 0xffffffcc
02fd5 48ff742418                     push       qword ptr [rsp + 0x18]
02fda 488f0424                       pop        qword ptr [rsp]
02fde 48ffb42480000000               push       qword ptr [rsp + 0x80]
02fe6 488f442408                     pop        qword ptr [rsp + 8]
02feb 48ffb42490000000               push       qword ptr [rsp + 0x90]
02ff3 488f442418                     pop        qword ptr [rsp + 0x18]
02ff8 48894424f8                     mov        qword ptr [rsp - 8], rax
02ffd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03001 89442414                       mov        dword ptr [rsp + 0x14], eax
03005 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0300a 48894424f8                     mov        qword ptr [rsp - 8], rax
0300f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03013 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03017 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0301c 48ff742450                     push       qword ptr [rsp + 0x50]
03021 488f442440                     pop        qword ptr [rsp + 0x40]
03026 48ff742458                     push       qword ptr [rsp + 0x58]
0302b 488f442450                     pop        qword ptr [rsp + 0x50]
03030 48ff742460                     push       qword ptr [rsp + 0x60]
03035 488f442458                     pop        qword ptr [rsp + 0x58]
0303a 48894424f8                     mov        qword ptr [rsp - 8], rax
0303f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03043 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03047 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0304c 48894424f8                     mov        qword ptr [rsp - 8], rax
03051 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03055 89442460                       mov        dword ptr [rsp + 0x60], eax
03059 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0305e 48894424f8                     mov        qword ptr [rsp - 8], rax
03063 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03067 89442464                       mov        dword ptr [rsp + 0x64], eax
0306b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03070 4489742470                     mov        dword ptr [rsp + 0x70], r14d
03075 48894424f8                     mov        qword ptr [rsp - 8], rax
0307a 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
03081 89442474                       mov        dword ptr [rsp + 0x74], eax
03085 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0308a 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
03092 6690                           nop        
03094 c5f877                         vzeroupper 
03097 e844cbb4ff                     call       0x7f1e7f9d7d60
0309c 0f1f840094310024               nop        dword ptr [rax + rax + 0x24003194]
030a4 be6effffff                     mov        esi, 0xffffff6e
030a9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
030ae 48894424f8                     mov        qword ptr [rsp - 8], rax
030b3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
030b7 89442408                       mov        dword ptr [rsp + 8], eax
030bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030c0 48ff742420                     push       qword ptr [rsp + 0x20]
030c5 488f442418                     pop        qword ptr [rsp + 0x18]
030ca 48894424f8                     mov        qword ptr [rsp - 8], rax
030cf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
030d3 8944240c                       mov        dword ptr [rsp + 0xc], eax
030d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030dc 48894424f8                     mov        qword ptr [rsp - 8], rax
030e1 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
030e5 89442434                       mov        dword ptr [rsp + 0x34], eax
030e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030ee 48894424f8                     mov        qword ptr [rsp - 8], rax
030f3 8b442440                       mov        eax, dword ptr [rsp + 0x40]
030f7 89442438                       mov        dword ptr [rsp + 0x38], eax
030fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03100 48ff742450                     push       qword ptr [rsp + 0x50]
03105 488f442440                     pop        qword ptr [rsp + 0x40]
0310a 48894424f8                     mov        qword ptr [rsp - 8], rax
0310f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
03113 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03117 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0311c 48ff742458                     push       qword ptr [rsp + 0x58]
03121 488f442448                     pop        qword ptr [rsp + 0x48]
03126 48ff742460                     push       qword ptr [rsp + 0x60]
0312b 488f442450                     pop        qword ptr [rsp + 0x50]
03130 48894424f8                     mov        qword ptr [rsp - 8], rax
03135 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03139 89442458                       mov        dword ptr [rsp + 0x58], eax
0313d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03142 48894424f8                     mov        qword ptr [rsp - 8], rax
03147 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0314b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0314f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03154 48894424f8                     mov        qword ptr [rsp - 8], rax
03159 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0315d 89442460                       mov        dword ptr [rsp + 0x60], eax
03161 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03166 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0316b 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
0316f 897c247c                       mov        dword ptr [rsp + 0x7c], edi
03173 90                             nop        
03174 c5f877                         vzeroupper 
03177 e864cab4ff                     call       0x7f1e7f9d7d60
0317c 0f1f840074320025               nop        dword ptr [rax + rax + 0x25003274]
03184 be45ffffff                     mov        esi, 0xffffff45
03189 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0318e 48894424f8                     mov        qword ptr [rsp - 8], rax
03193 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03197 89442408                       mov        dword ptr [rsp + 8], eax
0319b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031a0 48ff742420                     push       qword ptr [rsp + 0x20]
031a5 488f442418                     pop        qword ptr [rsp + 0x18]
031aa 48894424f8                     mov        qword ptr [rsp - 8], rax
031af 8b442428                       mov        eax, dword ptr [rsp + 0x28]
031b3 8944240c                       mov        dword ptr [rsp + 0xc], eax
031b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031bc 48894424f8                     mov        qword ptr [rsp - 8], rax
031c1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
031c5 89442438                       mov        dword ptr [rsp + 0x38], eax
031c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031ce 48ff742450                     push       qword ptr [rsp + 0x50]
031d3 488f442440                     pop        qword ptr [rsp + 0x40]
031d8 48894424f8                     mov        qword ptr [rsp - 8], rax
031dd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
031e1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
031e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031ea 48ff742458                     push       qword ptr [rsp + 0x58]
031ef 488f442448                     pop        qword ptr [rsp + 0x48]
031f4 48ff742460                     push       qword ptr [rsp + 0x60]
031f9 488f442450                     pop        qword ptr [rsp + 0x50]
031fe 48894424f8                     mov        qword ptr [rsp - 8], rax
03203 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03207 89442458                       mov        dword ptr [rsp + 0x58], eax
0320b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03210 48894424f8                     mov        qword ptr [rsp - 8], rax
03215 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03219 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0321d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03222 48894424f8                     mov        qword ptr [rsp - 8], rax
03227 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0322b 89442460                       mov        dword ptr [rsp + 0x60], eax
0322f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03234 4489742464                     mov        dword ptr [rsp + 0x64], r14d
03239 897c2478                       mov        dword ptr [rsp + 0x78], edi
0323d 666690                         nop        
03240 c5f877                         vzeroupper 
03243 e898c9b4ff                     call       0x7f1e7f9d7d60
03248 0f1f840040330026               nop        dword ptr [rax + rax + 0x26003340]
03250 be3dffffff                     mov        esi, 0xffffff3d
03255 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0325a 48894424f8                     mov        qword ptr [rsp - 8], rax
0325f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03263 89442408                       mov        dword ptr [rsp + 8], eax
03267 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0326c 48ff742420                     push       qword ptr [rsp + 0x20]
03271 488f442418                     pop        qword ptr [rsp + 0x18]
03276 48894424f8                     mov        qword ptr [rsp - 8], rax
0327b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0327f 8944240c                       mov        dword ptr [rsp + 0xc], eax
03283 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03288 48894424f8                     mov        qword ptr [rsp - 8], rax
0328d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03291 89442438                       mov        dword ptr [rsp + 0x38], eax
03295 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0329a 48ff742450                     push       qword ptr [rsp + 0x50]
0329f 488f442440                     pop        qword ptr [rsp + 0x40]
032a4 48894424f8                     mov        qword ptr [rsp - 8], rax
032a9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
032ad 8944243c                       mov        dword ptr [rsp + 0x3c], eax
032b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032b6 48ff742458                     push       qword ptr [rsp + 0x58]
032bb 488f442448                     pop        qword ptr [rsp + 0x48]
032c0 48ff742460                     push       qword ptr [rsp + 0x60]
032c5 488f442450                     pop        qword ptr [rsp + 0x50]
032ca 48894424f8                     mov        qword ptr [rsp - 8], rax
032cf 8b442474                       mov        eax, dword ptr [rsp + 0x74]
032d3 89442458                       mov        dword ptr [rsp + 0x58], eax
032d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032dc 48894424f8                     mov        qword ptr [rsp - 8], rax
032e1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
032e5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
032e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032ee 48894424f8                     mov        qword ptr [rsp - 8], rax
032f3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
032f7 89442460                       mov        dword ptr [rsp + 0x60], eax
032fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03300 4489742464                     mov        dword ptr [rsp + 0x64], r14d
03305 897c2478                       mov        dword ptr [rsp + 0x78], edi
03309 666690                         nop        
0330c c5f877                         vzeroupper 
0330f e8ccc8b4ff                     call       0x7f1e7f9d7d60
03314 0f1f84000c340027               nop        dword ptr [rax + rax + 0x2700340c]
0331c bee4ffffff                     mov        esi, 0xffffffe4
03321 48ff742418                     push       qword ptr [rsp + 0x18]
03326 488f0424                       pop        qword ptr [rsp]
0332a 48ffb42480000000               push       qword ptr [rsp + 0x80]
03332 488f442408                     pop        qword ptr [rsp + 8]
03337 48894424f8                     mov        qword ptr [rsp - 8], rax
0333c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03340 89442414                       mov        dword ptr [rsp + 0x14], eax
03344 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03349 48894424f8                     mov        qword ptr [rsp - 8], rax
0334e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03352 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03356 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0335b 48ff742450                     push       qword ptr [rsp + 0x50]
03360 488f442440                     pop        qword ptr [rsp + 0x40]
03365 48ff742458                     push       qword ptr [rsp + 0x58]
0336a 488f442450                     pop        qword ptr [rsp + 0x50]
0336f 48ff742460                     push       qword ptr [rsp + 0x60]
03374 488f442458                     pop        qword ptr [rsp + 0x58]
03379 48894424f8                     mov        qword ptr [rsp - 8], rax
0337e 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03382 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03386 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0338b 48894424f8                     mov        qword ptr [rsp - 8], rax
03390 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03394 89442460                       mov        dword ptr [rsp + 0x60], eax
03398 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0339d 48894424f8                     mov        qword ptr [rsp - 8], rax
033a2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
033a6 89442464                       mov        dword ptr [rsp + 0x64], eax
033aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033af 4489742468                     mov        dword ptr [rsp + 0x68], r14d
033b4 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
033bb 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
033c3 90                             nop        
033c4 c5f877                         vzeroupper 
033c7 e814c8b4ff                     call       0x7f1e7f9d7d60
033cc 0f1f8400c4340028               nop        dword ptr [rax + rax + 0x280034c4]
033d4 bee4ffffff                     mov        esi, 0xffffffe4
033d9 48ff742418                     push       qword ptr [rsp + 0x18]
033de 488f0424                       pop        qword ptr [rsp]
033e2 48894424f8                     mov        qword ptr [rsp - 8], rax
033e7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
033eb 89442414                       mov        dword ptr [rsp + 0x14], eax
033ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033f4 48894424f8                     mov        qword ptr [rsp - 8], rax
033f9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
033fd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03401 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03406 48ff742450                     push       qword ptr [rsp + 0x50]
0340b 488f442440                     pop        qword ptr [rsp + 0x40]
03410 48ff742458                     push       qword ptr [rsp + 0x58]
03415 488f442450                     pop        qword ptr [rsp + 0x50]
0341a 48ff742460                     push       qword ptr [rsp + 0x60]
0341f 488f442458                     pop        qword ptr [rsp + 0x58]
03424 48894424f8                     mov        qword ptr [rsp - 8], rax
03429 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0342d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03431 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03436 48894424f8                     mov        qword ptr [rsp - 8], rax
0343b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0343f 89442460                       mov        dword ptr [rsp + 0x60], eax
03443 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03448 48894424f8                     mov        qword ptr [rsp - 8], rax
0344d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03451 89442464                       mov        dword ptr [rsp + 0x64], eax
03455 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0345a 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0345f 895c2478                       mov        dword ptr [rsp + 0x78], ebx
03463 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
03468 c5f877                         vzeroupper 
0346b e870c7b4ff                     call       0x7f1e7f9d7d60
03470 0f1f840068350029               nop        dword ptr [rax + rax + 0x29003568]
03478 beccffffff                     mov        esi, 0xffffffcc
0347d 48ff742418                     push       qword ptr [rsp + 0x18]
03482 488f0424                       pop        qword ptr [rsp]
03486 48ffb42480000000               push       qword ptr [rsp + 0x80]
0348e 488f442408                     pop        qword ptr [rsp + 8]
03493 48894424f8                     mov        qword ptr [rsp - 8], rax
03498 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0349c 89442414                       mov        dword ptr [rsp + 0x14], eax
034a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034a5 48894424f8                     mov        qword ptr [rsp - 8], rax
034aa 8b442440                       mov        eax, dword ptr [rsp + 0x40]
034ae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
034b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034b7 48ff742450                     push       qword ptr [rsp + 0x50]
034bc 488f442440                     pop        qword ptr [rsp + 0x40]
034c1 48ff742458                     push       qword ptr [rsp + 0x58]
034c6 488f442450                     pop        qword ptr [rsp + 0x50]
034cb 48ff742460                     push       qword ptr [rsp + 0x60]
034d0 488f442458                     pop        qword ptr [rsp + 0x58]
034d5 48894424f8                     mov        qword ptr [rsp - 8], rax
034da 8b442474                       mov        eax, dword ptr [rsp + 0x74]
034de 8944244c                       mov        dword ptr [rsp + 0x4c], eax
034e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034e7 48894424f8                     mov        qword ptr [rsp - 8], rax
034ec 8b442478                       mov        eax, dword ptr [rsp + 0x78]
034f0 89442460                       mov        dword ptr [rsp + 0x60], eax
034f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034f9 48894424f8                     mov        qword ptr [rsp - 8], rax
034fe 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03502 89442464                       mov        dword ptr [rsp + 0x64], eax
03506 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0350b 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03510 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
03518 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
03520 c5f877                         vzeroupper 
03523 e8b8c6b4ff                     call       0x7f1e7f9d7d60
03528 0f1f84002036002a               nop        dword ptr [rax + rax + 0x2a003620]
03530 beccffffff                     mov        esi, 0xffffffcc
03535 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0353a 48ffb42480000000               push       qword ptr [rsp + 0x80]
03542 488f0424                       pop        qword ptr [rsp]
03546 48894424f8                     mov        qword ptr [rsp - 8], rax
0354b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0354f 89442408                       mov        dword ptr [rsp + 8], eax
03553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03558 48ff742420                     push       qword ptr [rsp + 0x20]
0355d 488f442418                     pop        qword ptr [rsp + 0x18]
03562 48894424f8                     mov        qword ptr [rsp - 8], rax
03567 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0356b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0356f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03574 48894424f8                     mov        qword ptr [rsp - 8], rax
03579 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0357d 89442434                       mov        dword ptr [rsp + 0x34], eax
03581 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03586 48ff742450                     push       qword ptr [rsp + 0x50]
0358b 488f442438                     pop        qword ptr [rsp + 0x38]
03590 48894424f8                     mov        qword ptr [rsp - 8], rax
03595 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03599 89442440                       mov        dword ptr [rsp + 0x40], eax
0359d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035a2 48ff742458                     push       qword ptr [rsp + 0x58]
035a7 488f442448                     pop        qword ptr [rsp + 0x48]
035ac 48ff742460                     push       qword ptr [rsp + 0x60]
035b1 488f442450                     pop        qword ptr [rsp + 0x50]
035b6 48894424f8                     mov        qword ptr [rsp - 8], rax
035bb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
035bf 89442444                       mov        dword ptr [rsp + 0x44], eax
035c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035c8 48894424f8                     mov        qword ptr [rsp - 8], rax
035cd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
035d1 89442458                       mov        dword ptr [rsp + 0x58], eax
035d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035da 48894424f8                     mov        qword ptr [rsp - 8], rax
035df 8b442470                       mov        eax, dword ptr [rsp + 0x70]
035e3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
035e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035ec 48894424f8                     mov        qword ptr [rsp - 8], rax
035f1 8b84248c000000                 mov        eax, dword ptr [rsp + 0x8c]
035f8 8944246c                       mov        dword ptr [rsp + 0x6c], eax
035fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03601 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
03606 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
0360e 6690                           nop        
03610 c5f877                         vzeroupper 
03613 e8c8c5b4ff                     call       0x7f1e7f9d7d60
03618 0f1f84001037002b               nop        dword ptr [rax + rax + 0x2b003710]
03620 be85ffffff                     mov        esi, 0xffffff85
03625 48894424f8                     mov        qword ptr [rsp - 8], rax
0362a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0362e 890424                         mov        dword ptr [rsp], eax
03631 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03636 48894424f8                     mov        qword ptr [rsp - 8], rax
0363b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0363f 89442404                       mov        dword ptr [rsp + 4], eax
03643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03648 48894424f8                     mov        qword ptr [rsp - 8], rax
0364d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03651 89442418                       mov        dword ptr [rsp + 0x18], eax
03655 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0365a 48ff742450                     push       qword ptr [rsp + 0x50]
0365f 488f442420                     pop        qword ptr [rsp + 0x20]
03664 48ff742458                     push       qword ptr [rsp + 0x58]
03669 488f442428                     pop        qword ptr [rsp + 0x28]
0366e 48ff742460                     push       qword ptr [rsp + 0x60]
03673 488f442430                     pop        qword ptr [rsp + 0x30]
03678 48895c2450                     mov        qword ptr [rsp + 0x50], rbx
0367d 4c896c2458                     mov        qword ptr [rsp + 0x58], r13
03682 4c89742460                     mov        qword ptr [rsp + 0x60], r14
03687 90                             nop        
03688 c5f877                         vzeroupper 
0368b e850c5b4ff                     call       0x7f1e7f9d7d60
03690 0f1f84008837002c               nop        dword ptr [rax + rax + 0x2c003788]
03698 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
0369f beccffffff                     mov        esi, 0xffffffcc
036a4 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
036a9 895c2414                       mov        dword ptr [rsp + 0x14], ebx
036ad 894c2420                       mov        dword ptr [rsp + 0x20], ecx
036b1 666690                         nop        
036b4 c5f877                         vzeroupper 
036b7 e824c5b4ff                     call       0x7f1e7f9d7d60
036bc 0f1f8400b437002d               nop        dword ptr [rax + rax + 0x2d0037b4]
036c4 bee4ffffff                     mov        esi, 0xffffffe4
036c9 48ff742418                     push       qword ptr [rsp + 0x18]
036ce 488f0424                       pop        qword ptr [rsp]
036d2 48894424f8                     mov        qword ptr [rsp - 8], rax
036d7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
036db 89442414                       mov        dword ptr [rsp + 0x14], eax
036df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
036e4 48894424f8                     mov        qword ptr [rsp - 8], rax
036e9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
036ed 8944243c                       mov        dword ptr [rsp + 0x3c], eax
036f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
036f6 48ff742450                     push       qword ptr [rsp + 0x50]
036fb 488f442440                     pop        qword ptr [rsp + 0x40]
03700 48ff742458                     push       qword ptr [rsp + 0x58]
03705 488f442450                     pop        qword ptr [rsp + 0x50]
0370a 48ff742460                     push       qword ptr [rsp + 0x60]
0370f 488f442458                     pop        qword ptr [rsp + 0x58]
03714 48894424f8                     mov        qword ptr [rsp - 8], rax
03719 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0371d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03721 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03726 48894424f8                     mov        qword ptr [rsp - 8], rax
0372b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0372f 89442460                       mov        dword ptr [rsp + 0x60], eax
03733 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03738 48894424f8                     mov        qword ptr [rsp - 8], rax
0373d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03741 89442464                       mov        dword ptr [rsp + 0x64], eax
03745 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0374a 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0374f 895c2474                       mov        dword ptr [rsp + 0x74], ebx
03753 48894424f8                     mov        qword ptr [rsp - 8], rax
03758 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0375f 89442478                       mov        dword ptr [rsp + 0x78], eax
03763 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03768 c5f877                         vzeroupper 
0376b e870c4b4ff                     call       0x7f1e7f9d7d60
03770 0f1f84006838002e               nop        dword ptr [rax + rax + 0x2e003868]
03778 bee4ffffff                     mov        esi, 0xffffffe4
0377d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03782 48ffb42480000000               push       qword ptr [rsp + 0x80]
0378a 488f0424                       pop        qword ptr [rsp]
0378e 48894424f8                     mov        qword ptr [rsp - 8], rax
03793 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03797 89442408                       mov        dword ptr [rsp + 8], eax
0379b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037a0 48ffb42490000000               push       qword ptr [rsp + 0x90]
037a8 488f442410                     pop        qword ptr [rsp + 0x10]
037ad 48ff742420                     push       qword ptr [rsp + 0x20]
037b2 488f442418                     pop        qword ptr [rsp + 0x18]
037b7 48894424f8                     mov        qword ptr [rsp - 8], rax
037bc 8b442428                       mov        eax, dword ptr [rsp + 0x28]
037c0 8944240c                       mov        dword ptr [rsp + 0xc], eax
037c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037c9 48ffb42498000000               push       qword ptr [rsp + 0x98]
037d1 488f442420                     pop        qword ptr [rsp + 0x20]
037d6 48894424f8                     mov        qword ptr [rsp - 8], rax
037db 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
037df 89442430                       mov        dword ptr [rsp + 0x30], eax
037e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037e8 48894424f8                     mov        qword ptr [rsp - 8], rax
037ed 8b442440                       mov        eax, dword ptr [rsp + 0x40]
037f1 89442434                       mov        dword ptr [rsp + 0x34], eax
037f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
037fa 48ff742450                     push       qword ptr [rsp + 0x50]
037ff 488f442438                     pop        qword ptr [rsp + 0x38]
03804 48894424f8                     mov        qword ptr [rsp - 8], rax
03809 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0380d 89442440                       mov        dword ptr [rsp + 0x40], eax
03811 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03816 48ff742458                     push       qword ptr [rsp + 0x58]
0381b 488f442448                     pop        qword ptr [rsp + 0x48]
03820 48ff742460                     push       qword ptr [rsp + 0x60]
03825 488f442450                     pop        qword ptr [rsp + 0x50]
0382a 48894424f8                     mov        qword ptr [rsp - 8], rax
0382f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03833 89442444                       mov        dword ptr [rsp + 0x44], eax
03837 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0383c 48894424f8                     mov        qword ptr [rsp - 8], rax
03841 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03845 89442458                       mov        dword ptr [rsp + 0x58], eax
03849 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0384e 48894424f8                     mov        qword ptr [rsp - 8], rax
03853 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03857 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0385b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03860 4489742460                     mov        dword ptr [rsp + 0x60], r14d
03865 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
03869 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
03871 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
0387a 6690                           nop        
0387c c5f877                         vzeroupper 
0387f e85cc3b4ff                     call       0x7f1e7f9d7d60
03884 0f1f84007c39002f               nop        dword ptr [rax + rax + 0x2f00397c]
0388c beccffffff                     mov        esi, 0xffffffcc
03891 48ff742418                     push       qword ptr [rsp + 0x18]
03896 488f0424                       pop        qword ptr [rsp]
0389a 48894424f8                     mov        qword ptr [rsp - 8], rax
0389f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
038a3 89442414                       mov        dword ptr [rsp + 0x14], eax
038a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
038ac 48894424f8                     mov        qword ptr [rsp - 8], rax
038b1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
038b5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
038b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
038be 48ff742450                     push       qword ptr [rsp + 0x50]
038c3 488f442440                     pop        qword ptr [rsp + 0x40]
038c8 48ff742458                     push       qword ptr [rsp + 0x58]
038cd 488f442450                     pop        qword ptr [rsp + 0x50]
038d2 48ff742460                     push       qword ptr [rsp + 0x60]
038d7 488f442458                     pop        qword ptr [rsp + 0x58]
038dc 48894424f8                     mov        qword ptr [rsp - 8], rax
038e1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
038e5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
038e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
038ee 48894424f8                     mov        qword ptr [rsp - 8], rax
038f3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
038f7 89442460                       mov        dword ptr [rsp + 0x60], eax
038fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03900 48894424f8                     mov        qword ptr [rsp - 8], rax
03905 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03909 89442464                       mov        dword ptr [rsp + 0x64], eax
0390d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03912 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03917 895c2474                       mov        dword ptr [rsp + 0x74], ebx
0391b 48894424f8                     mov        qword ptr [rsp - 8], rax
03920 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
03927 89442478                       mov        dword ptr [rsp + 0x78], eax
0392b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03930 c5f877                         vzeroupper 
03933 e8a8c2b4ff                     call       0x7f1e7f9d7d60
03938 0f1f8400303a0030               nop        dword ptr [rax + rax + 0x30003a30]
03940 beccffffff                     mov        esi, 0xffffffcc
03945 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0394a 48894424f8                     mov        qword ptr [rsp - 8], rax
0394f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03953 89442408                       mov        dword ptr [rsp + 8], eax
03957 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0395c 48ff742420                     push       qword ptr [rsp + 0x20]
03961 488f442418                     pop        qword ptr [rsp + 0x18]
03966 48894424f8                     mov        qword ptr [rsp - 8], rax
0396b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0396f 8944240c                       mov        dword ptr [rsp + 0xc], eax
03973 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03978 48894424f8                     mov        qword ptr [rsp - 8], rax
0397d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03981 89442438                       mov        dword ptr [rsp + 0x38], eax
03985 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0398a 48ff742450                     push       qword ptr [rsp + 0x50]
0398f 488f442440                     pop        qword ptr [rsp + 0x40]
03994 48894424f8                     mov        qword ptr [rsp - 8], rax
03999 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0399d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
039a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039a6 48ff742458                     push       qword ptr [rsp + 0x58]
039ab 488f442448                     pop        qword ptr [rsp + 0x48]
039b0 48ff742460                     push       qword ptr [rsp + 0x60]
039b5 488f442450                     pop        qword ptr [rsp + 0x50]
039ba 48894424f8                     mov        qword ptr [rsp - 8], rax
039bf 8b442474                       mov        eax, dword ptr [rsp + 0x74]
039c3 89442458                       mov        dword ptr [rsp + 0x58], eax
039c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039cc 48894424f8                     mov        qword ptr [rsp - 8], rax
039d1 8b442478                       mov        eax, dword ptr [rsp + 0x78]
039d5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
039d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039de 48894424f8                     mov        qword ptr [rsp - 8], rax
039e3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
039e7 89442460                       mov        dword ptr [rsp + 0x60], eax
039eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
039f0 48ffb42480000000               push       qword ptr [rsp + 0x80]
039f8 488f442470                     pop        qword ptr [rsp + 0x70]
039fd 48894424f8                     mov        qword ptr [rsp - 8], rax
03a02 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
03a06 89442478                       mov        dword ptr [rsp + 0x78], eax
03a0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a0f 48894424f8                     mov        qword ptr [rsp - 8], rax
03a14 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
03a1b 8944247c                       mov        dword ptr [rsp + 0x7c], eax
03a1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a24 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
03a2c c5f877                         vzeroupper 
03a2f e8acc1b4ff                     call       0x7f1e7f9d7d60
03a34 0f1f84002c3b0031               nop        dword ptr [rax + rax + 0x31003b2c]
03a3c beccffffff                     mov        esi, 0xffffffcc
03a41 48ff742418                     push       qword ptr [rsp + 0x18]
03a46 488f0424                       pop        qword ptr [rsp]
03a4a 48ffb42480000000               push       qword ptr [rsp + 0x80]
03a52 488f442408                     pop        qword ptr [rsp + 8]
03a57 48ffb42490000000               push       qword ptr [rsp + 0x90]
03a5f 488f442418                     pop        qword ptr [rsp + 0x18]
03a64 48894424f8                     mov        qword ptr [rsp - 8], rax
03a69 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03a6d 89442414                       mov        dword ptr [rsp + 0x14], eax
03a71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a76 48ffb42498000000               push       qword ptr [rsp + 0x98]
03a7e 488f442428                     pop        qword ptr [rsp + 0x28]
03a83 48894424f8                     mov        qword ptr [rsp - 8], rax
03a88 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03a8c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03a90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03a95 48ff742450                     push       qword ptr [rsp + 0x50]
03a9a 488f442440                     pop        qword ptr [rsp + 0x40]
03a9f 48ff742458                     push       qword ptr [rsp + 0x58]
03aa4 488f442450                     pop        qword ptr [rsp + 0x50]
03aa9 48ff742460                     push       qword ptr [rsp + 0x60]
03aae 488f442458                     pop        qword ptr [rsp + 0x58]
03ab3 48894424f8                     mov        qword ptr [rsp - 8], rax
03ab8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03abc 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03ac0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ac5 48894424f8                     mov        qword ptr [rsp - 8], rax
03aca 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03ace 89442460                       mov        dword ptr [rsp + 0x60], eax
03ad2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ad7 48894424f8                     mov        qword ptr [rsp - 8], rax
03adc 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03ae0 89442464                       mov        dword ptr [rsp + 0x64], eax
03ae4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ae9 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03aee 895c2474                       mov        dword ptr [rsp + 0x74], ebx
03af2 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
03afb 90                             nop        
03afc c5f877                         vzeroupper 
03aff e8dcc0b4ff                     call       0x7f1e7f9d7d60
03b04 0f1f8400fc3b0032               nop        dword ptr [rax + rax + 0x32003bfc]
03b0c 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
03b10 83c510                         add        ebp, 0x10
03b13 be6effffff                     mov        esi, 0xffffff6e
03b18 48ff742418                     push       qword ptr [rsp + 0x18]
03b1d 488f0424                       pop        qword ptr [rsp]
03b21 48ffb42480000000               push       qword ptr [rsp + 0x80]
03b29 488f442408                     pop        qword ptr [rsp + 8]
03b2e 48894424f8                     mov        qword ptr [rsp - 8], rax
03b33 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03b37 89442414                       mov        dword ptr [rsp + 0x14], eax
03b3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b40 48894424f8                     mov        qword ptr [rsp - 8], rax
03b45 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
03b49 89442438                       mov        dword ptr [rsp + 0x38], eax
03b4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b52 48894424f8                     mov        qword ptr [rsp - 8], rax
03b57 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03b5b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03b5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b64 48ff742450                     push       qword ptr [rsp + 0x50]
03b69 488f442440                     pop        qword ptr [rsp + 0x40]
03b6e 48ff742458                     push       qword ptr [rsp + 0x58]
03b73 488f442450                     pop        qword ptr [rsp + 0x50]
03b78 48ff742460                     push       qword ptr [rsp + 0x60]
03b7d 488f442458                     pop        qword ptr [rsp + 0x58]
03b82 48894424f8                     mov        qword ptr [rsp - 8], rax
03b87 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03b8b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03b8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03b94 48894424f8                     mov        qword ptr [rsp - 8], rax
03b99 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03b9d 89442460                       mov        dword ptr [rsp + 0x60], eax
03ba1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ba6 48894424f8                     mov        qword ptr [rsp - 8], rax
03bab 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03baf 89442464                       mov        dword ptr [rsp + 0x64], eax
03bb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03bb8 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03bbd 895c2478                       mov        dword ptr [rsp + 0x78], ebx
03bc1 89942480000000                 mov        dword ptr [rsp + 0x80], edx
03bc8 c5f877                         vzeroupper 
03bcb e810c0b4ff                     call       0x7f1e7f9d7d60
03bd0 0f1f8400c83c0033               nop        dword ptr [rax + rax + 0x33003cc8]
03bd8 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
03bdc 83c510                         add        ebp, 0x10
03bdf be66ffffff                     mov        esi, 0xffffff66
03be4 48ff742418                     push       qword ptr [rsp + 0x18]
03be9 488f0424                       pop        qword ptr [rsp]
03bed 48ffb42480000000               push       qword ptr [rsp + 0x80]
03bf5 488f442408                     pop        qword ptr [rsp + 8]
03bfa 48894424f8                     mov        qword ptr [rsp - 8], rax
03bff 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03c03 89442414                       mov        dword ptr [rsp + 0x14], eax
03c07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c0c 48894424f8                     mov        qword ptr [rsp - 8], rax
03c11 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
03c15 89442438                       mov        dword ptr [rsp + 0x38], eax
03c19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c1e 48894424f8                     mov        qword ptr [rsp - 8], rax
03c23 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03c27 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03c2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c30 48ff742450                     push       qword ptr [rsp + 0x50]
03c35 488f442440                     pop        qword ptr [rsp + 0x40]
03c3a 48ff742458                     push       qword ptr [rsp + 0x58]
03c3f 488f442450                     pop        qword ptr [rsp + 0x50]
03c44 48ff742460                     push       qword ptr [rsp + 0x60]
03c49 488f442458                     pop        qword ptr [rsp + 0x58]
03c4e 48894424f8                     mov        qword ptr [rsp - 8], rax
03c53 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03c57 8944244c                       mov        dword ptr [rsp + 0x4c], eax
03c5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c60 48894424f8                     mov        qword ptr [rsp - 8], rax
03c65 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03c69 89442460                       mov        dword ptr [rsp + 0x60], eax
03c6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c72 48894424f8                     mov        qword ptr [rsp - 8], rax
03c77 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03c7b 89442464                       mov        dword ptr [rsp + 0x64], eax
03c7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03c84 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03c89 895c2478                       mov        dword ptr [rsp + 0x78], ebx
03c8d 89942480000000                 mov        dword ptr [rsp + 0x80], edx
03c94 c5f877                         vzeroupper 
03c97 e844bfb4ff                     call       0x7f1e7f9d7d60
03c9c 0f1f8400943d0034               nop        dword ptr [rax + rax + 0x34003d94]
03ca4 bee4ffffff                     mov        esi, 0xffffffe4
03ca9 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03cae 48ffb42480000000               push       qword ptr [rsp + 0x80]
03cb6 488f0424                       pop        qword ptr [rsp]
03cba 48894424f8                     mov        qword ptr [rsp - 8], rax
03cbf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03cc3 89442408                       mov        dword ptr [rsp + 8], eax
03cc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ccc 48ff742420                     push       qword ptr [rsp + 0x20]
03cd1 488f442418                     pop        qword ptr [rsp + 0x18]
03cd6 48894424f8                     mov        qword ptr [rsp - 8], rax
03cdb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03cdf 8944240c                       mov        dword ptr [rsp + 0xc], eax
03ce3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ce8 48894424f8                     mov        qword ptr [rsp - 8], rax
03ced 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03cf1 89442434                       mov        dword ptr [rsp + 0x34], eax
03cf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03cfa 48ff742450                     push       qword ptr [rsp + 0x50]
03cff 488f442438                     pop        qword ptr [rsp + 0x38]
03d04 48894424f8                     mov        qword ptr [rsp - 8], rax
03d09 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03d0d 89442440                       mov        dword ptr [rsp + 0x40], eax
03d11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d16 48ff742458                     push       qword ptr [rsp + 0x58]
03d1b 488f442448                     pop        qword ptr [rsp + 0x48]
03d20 48ff742460                     push       qword ptr [rsp + 0x60]
03d25 488f442450                     pop        qword ptr [rsp + 0x50]
03d2a 48894424f8                     mov        qword ptr [rsp - 8], rax
03d2f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03d33 89442444                       mov        dword ptr [rsp + 0x44], eax
03d37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d3c 48894424f8                     mov        qword ptr [rsp - 8], rax
03d41 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03d45 89442458                       mov        dword ptr [rsp + 0x58], eax
03d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d4e 48894424f8                     mov        qword ptr [rsp - 8], rax
03d53 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03d57 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03d5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03d60 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03d65 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03d6d 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
03d75 666690                         nop        
03d78 c5f877                         vzeroupper 
03d7b e860beb4ff                     call       0x7f1e7f9d7d60
03d80 0f1f8400783e0035               nop        dword ptr [rax + rax + 0x35003e78]
03d88 bee4ffffff                     mov        esi, 0xffffffe4
03d8d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03d92 48ffb42480000000               push       qword ptr [rsp + 0x80]
03d9a 488f0424                       pop        qword ptr [rsp]
03d9e 48894424f8                     mov        qword ptr [rsp - 8], rax
03da3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03da7 89442408                       mov        dword ptr [rsp + 8], eax
03dab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03db0 48ff742420                     push       qword ptr [rsp + 0x20]
03db5 488f442418                     pop        qword ptr [rsp + 0x18]
03dba 48894424f8                     mov        qword ptr [rsp - 8], rax
03dbf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03dc3 8944240c                       mov        dword ptr [rsp + 0xc], eax
03dc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03dcc 48894424f8                     mov        qword ptr [rsp - 8], rax
03dd1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03dd5 89442434                       mov        dword ptr [rsp + 0x34], eax
03dd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03dde 48ff742450                     push       qword ptr [rsp + 0x50]
03de3 488f442438                     pop        qword ptr [rsp + 0x38]
03de8 48894424f8                     mov        qword ptr [rsp - 8], rax
03ded 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03df1 89442440                       mov        dword ptr [rsp + 0x40], eax
03df5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03dfa 48ff742458                     push       qword ptr [rsp + 0x58]
03dff 488f442448                     pop        qword ptr [rsp + 0x48]
03e04 48ff742460                     push       qword ptr [rsp + 0x60]
03e09 488f442450                     pop        qword ptr [rsp + 0x50]
03e0e 48894424f8                     mov        qword ptr [rsp - 8], rax
03e13 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03e17 89442444                       mov        dword ptr [rsp + 0x44], eax
03e1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e20 48894424f8                     mov        qword ptr [rsp - 8], rax
03e25 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03e29 89442458                       mov        dword ptr [rsp + 0x58], eax
03e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e32 48894424f8                     mov        qword ptr [rsp - 8], rax
03e37 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03e3b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e44 4489742470                     mov        dword ptr [rsp + 0x70], r14d
03e49 89442474                       mov        dword ptr [rsp + 0x74], eax
03e4d 4c89442478                     mov        qword ptr [rsp + 0x78], r8
03e52 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
03e5a 6690                           nop        
03e5c c5f877                         vzeroupper 
03e5f e87cbdb4ff                     call       0x7f1e7f9d7d60
03e64 0f1f84005c3f0036               nop        dword ptr [rax + rax + 0x36003f5c]
03e6c beccffffff                     mov        esi, 0xffffffcc
03e71 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03e76 48ffb42480000000               push       qword ptr [rsp + 0x80]
03e7e 488f0424                       pop        qword ptr [rsp]
03e82 48894424f8                     mov        qword ptr [rsp - 8], rax
03e87 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03e8b 89442408                       mov        dword ptr [rsp + 8], eax
03e8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03e94 48ff742420                     push       qword ptr [rsp + 0x20]
03e99 488f442418                     pop        qword ptr [rsp + 0x18]
03e9e 48894424f8                     mov        qword ptr [rsp - 8], rax
03ea3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03ea7 8944240c                       mov        dword ptr [rsp + 0xc], eax
03eab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03eb0 48894424f8                     mov        qword ptr [rsp - 8], rax
03eb5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03eb9 89442434                       mov        dword ptr [rsp + 0x34], eax
03ebd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ec2 48ff742450                     push       qword ptr [rsp + 0x50]
03ec7 488f442438                     pop        qword ptr [rsp + 0x38]
03ecc 48894424f8                     mov        qword ptr [rsp - 8], rax
03ed1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03ed5 89442440                       mov        dword ptr [rsp + 0x40], eax
03ed9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ede 48ff742458                     push       qword ptr [rsp + 0x58]
03ee3 488f442448                     pop        qword ptr [rsp + 0x48]
03ee8 48ff742460                     push       qword ptr [rsp + 0x60]
03eed 488f442450                     pop        qword ptr [rsp + 0x50]
03ef2 48894424f8                     mov        qword ptr [rsp - 8], rax
03ef7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
03efb 89442444                       mov        dword ptr [rsp + 0x44], eax
03eff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f04 48894424f8                     mov        qword ptr [rsp - 8], rax
03f09 8b442478                       mov        eax, dword ptr [rsp + 0x78]
03f0d 89442458                       mov        dword ptr [rsp + 0x58], eax
03f11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f16 48894424f8                     mov        qword ptr [rsp - 8], rax
03f1b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03f1f 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03f23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f28 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03f2d 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03f35 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
03f3d 666690                         nop        
03f40 c5f877                         vzeroupper 
03f43 e898bcb4ff                     call       0x7f1e7f9d7d60
03f48 0f1f840040400037               nop        dword ptr [rax + rax + 0x37004040]
03f50 448bc0                         mov        r8d, eax
03f53 458d5008                       lea        r10d, [r8 + 8]
03f57 be6effffff                     mov        esi, 0xffffff6e
03f5c 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
03f61 48894424f8                     mov        qword ptr [rsp - 8], rax
03f66 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03f6a 89442408                       mov        dword ptr [rsp + 8], eax
03f6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f73 48ff742420                     push       qword ptr [rsp + 0x20]
03f78 488f442418                     pop        qword ptr [rsp + 0x18]
03f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
03f82 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03f86 8944240c                       mov        dword ptr [rsp + 0xc], eax
03f8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03f8f 48894424f8                     mov        qword ptr [rsp - 8], rax
03f94 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03f98 89442434                       mov        dword ptr [rsp + 0x34], eax
03f9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03fa1 48ff742450                     push       qword ptr [rsp + 0x50]
03fa6 488f442438                     pop        qword ptr [rsp + 0x38]
03fab 48894424f8                     mov        qword ptr [rsp - 8], rax
03fb0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03fb4 89442440                       mov        dword ptr [rsp + 0x40], eax
03fb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03fbd 48ff742458                     push       qword ptr [rsp + 0x58]
03fc2 488f442448                     pop        qword ptr [rsp + 0x48]
03fc7 48ff742460                     push       qword ptr [rsp + 0x60]
03fcc 488f442450                     pop        qword ptr [rsp + 0x50]
03fd1 48894424f8                     mov        qword ptr [rsp - 8], rax
03fd6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03fda 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03fde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03fe3 48894424f8                     mov        qword ptr [rsp - 8], rax
03fe8 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
03fef 89442460                       mov        dword ptr [rsp + 0x60], eax
03ff3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03ff8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
03ffd 666690                         nop        
04000 c5f877                         vzeroupper 
04003 e8d8bbb4ff                     call       0x7f1e7f9d7d60
04008 0f1f840000410038               nop        dword ptr [rax + rax + 0x38004100]
04010 448bc0                         mov        r8d, eax
04013 458d5008                       lea        r10d, [r8 + 8]
04017 be66ffffff                     mov        esi, 0xffffff66
0401c 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
04021 48894424f8                     mov        qword ptr [rsp - 8], rax
04026 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0402a 89442408                       mov        dword ptr [rsp + 8], eax
0402e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04033 48ff742420                     push       qword ptr [rsp + 0x20]
04038 488f442418                     pop        qword ptr [rsp + 0x18]
0403d 48894424f8                     mov        qword ptr [rsp - 8], rax
04042 8b442428                       mov        eax, dword ptr [rsp + 0x28]
04046 8944240c                       mov        dword ptr [rsp + 0xc], eax
0404a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0404f 48894424f8                     mov        qword ptr [rsp - 8], rax
04054 8b442440                       mov        eax, dword ptr [rsp + 0x40]
04058 89442434                       mov        dword ptr [rsp + 0x34], eax
0405c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04061 48ff742450                     push       qword ptr [rsp + 0x50]
04066 488f442438                     pop        qword ptr [rsp + 0x38]
0406b 48894424f8                     mov        qword ptr [rsp - 8], rax
04070 8b442448                       mov        eax, dword ptr [rsp + 0x48]
04074 89442440                       mov        dword ptr [rsp + 0x40], eax
04078 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0407d 48ff742458                     push       qword ptr [rsp + 0x58]
04082 488f442448                     pop        qword ptr [rsp + 0x48]
04087 48ff742460                     push       qword ptr [rsp + 0x60]
0408c 488f442450                     pop        qword ptr [rsp + 0x50]
04091 48894424f8                     mov        qword ptr [rsp - 8], rax
04096 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0409a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0409e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
040a3 895c2464                       mov        dword ptr [rsp + 0x64], ebx
040a7 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
040ac c5f877                         vzeroupper 
040af e82cbbb4ff                     call       0x7f1e7f9d7d60
040b4 0f1f8400ac410039               nop        dword ptr [rax + rax + 0x390041ac]
040bc 4c898424a0000000               mov        qword ptr [rsp + 0xa0], r8
040c4 e974d0ffff                     jmp        0x7f1e7fe892bd
040c9 bee4ffffff                     mov        esi, 0xffffffe4
040ce 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
040d3 48894424f8                     mov        qword ptr [rsp - 8], rax
040d8 8b442410                       mov        eax, dword ptr [rsp + 0x10]
040dc 89442408                       mov        dword ptr [rsp + 8], eax
040e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
040e5 48ff742420                     push       qword ptr [rsp + 0x20]
040ea 488f442418                     pop        qword ptr [rsp + 0x18]
040ef 48894424f8                     mov        qword ptr [rsp - 8], rax
040f4 8b442428                       mov        eax, dword ptr [rsp + 0x28]
040f8 8944240c                       mov        dword ptr [rsp + 0xc], eax
040fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04101 48894424f8                     mov        qword ptr [rsp - 8], rax
04106 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0410a 89442434                       mov        dword ptr [rsp + 0x34], eax
0410e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04113 48ff742450                     push       qword ptr [rsp + 0x50]
04118 488f442438                     pop        qword ptr [rsp + 0x38]
0411d 48894424f8                     mov        qword ptr [rsp - 8], rax
04122 8b442448                       mov        eax, dword ptr [rsp + 0x48]
04126 89442440                       mov        dword ptr [rsp + 0x40], eax
0412a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0412f 48ff742458                     push       qword ptr [rsp + 0x58]
04134 488f442448                     pop        qword ptr [rsp + 0x48]
04139 48ff742460                     push       qword ptr [rsp + 0x60]
0413e 488f442450                     pop        qword ptr [rsp + 0x50]
04143 48894424f8                     mov        qword ptr [rsp - 8], rax
04148 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0414c 89442444                       mov        dword ptr [rsp + 0x44], eax
04150 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04155 48894424f8                     mov        qword ptr [rsp - 8], rax
0415a 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0415e 89442458                       mov        dword ptr [rsp + 0x58], eax
04162 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04167 48894424f8                     mov        qword ptr [rsp - 8], rax
0416c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
04170 8944245c                       mov        dword ptr [rsp + 0x5c], eax
04174 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04179 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0417e 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
04183 4489442478                     mov        dword ptr [rsp + 0x78], r8d
04188 c5f877                         vzeroupper 
0418b e850bab4ff                     call       0x7f1e7f9d7d60
04190 0f1f84008842003a               nop        dword ptr [rax + rax + 0x3a004288]
04198 bee4ffffff                     mov        esi, 0xffffffe4
0419d 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
041a2 48ffb42480000000               push       qword ptr [rsp + 0x80]
041aa 488f0424                       pop        qword ptr [rsp]
041ae 48894424f8                     mov        qword ptr [rsp - 8], rax
041b3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
041b7 89442408                       mov        dword ptr [rsp + 8], eax
041bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
041c0 48ff742420                     push       qword ptr [rsp + 0x20]
041c5 488f442418                     pop        qword ptr [rsp + 0x18]
041ca 48894424f8                     mov        qword ptr [rsp - 8], rax
041cf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
041d3 8944240c                       mov        dword ptr [rsp + 0xc], eax
041d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
041dc 48894424f8                     mov        qword ptr [rsp - 8], rax
041e1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
041e5 89442434                       mov        dword ptr [rsp + 0x34], eax
041e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
041ee 48ff742450                     push       qword ptr [rsp + 0x50]
041f3 488f442438                     pop        qword ptr [rsp + 0x38]
041f8 48894424f8                     mov        qword ptr [rsp - 8], rax
041fd 8b442448                       mov        eax, dword ptr [rsp + 0x48]
04201 89442440                       mov        dword ptr [rsp + 0x40], eax
04205 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0420a 48ff742458                     push       qword ptr [rsp + 0x58]
0420f 488f442448                     pop        qword ptr [rsp + 0x48]
04214 48ff742460                     push       qword ptr [rsp + 0x60]
04219 488f442450                     pop        qword ptr [rsp + 0x50]
0421e 48894424f8                     mov        qword ptr [rsp - 8], rax
04223 8b442474                       mov        eax, dword ptr [rsp + 0x74]
04227 89442444                       mov        dword ptr [rsp + 0x44], eax
0422b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04230 48894424f8                     mov        qword ptr [rsp - 8], rax
04235 8b442478                       mov        eax, dword ptr [rsp + 0x78]
04239 89442458                       mov        dword ptr [rsp + 0x58], eax
0423d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04242 48894424f8                     mov        qword ptr [rsp - 8], rax
04247 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0424b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0424f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04254 48894424f8                     mov        qword ptr [rsp - 8], rax
04259 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
04260 89442460                       mov        dword ptr [rsp + 0x60], eax
04264 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04269 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
0426e 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
04273 4489442478                     mov        dword ptr [rsp + 0x78], r8d
04278 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
04281 666690                         nop        
04284 c5f877                         vzeroupper 
04287 e854b9b4ff                     call       0x7f1e7f9d7d60
0428c 0f1f84008443003b               nop        dword ptr [rax + rax + 0x3b004384]
04294 beccffffff                     mov        esi, 0xffffffcc
04299 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
0429e 48894424f8                     mov        qword ptr [rsp - 8], rax
042a3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
042a7 89442408                       mov        dword ptr [rsp + 8], eax
042ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
042b0 48ff742420                     push       qword ptr [rsp + 0x20]
042b5 488f442418                     pop        qword ptr [rsp + 0x18]
042ba 48894424f8                     mov        qword ptr [rsp - 8], rax
042bf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
042c3 8944240c                       mov        dword ptr [rsp + 0xc], eax
042c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
042cc 48894424f8                     mov        qword ptr [rsp - 8], rax
042d1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
042d5 89442434                       mov        dword ptr [rsp + 0x34], eax
042d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
042de 48ff742450                     push       qword ptr [rsp + 0x50]
042e3 488f442438                     pop        qword ptr [rsp + 0x38]
042e8 48894424f8                     mov        qword ptr [rsp - 8], rax
042ed 8b442448                       mov        eax, dword ptr [rsp + 0x48]
042f1 89442440                       mov        dword ptr [rsp + 0x40], eax
042f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
042fa 48ff742458                     push       qword ptr [rsp + 0x58]
042ff 488f442448                     pop        qword ptr [rsp + 0x48]
04304 48ff742460                     push       qword ptr [rsp + 0x60]
04309 488f442450                     pop        qword ptr [rsp + 0x50]
0430e 48894424f8                     mov        qword ptr [rsp - 8], rax
04313 8b442474                       mov        eax, dword ptr [rsp + 0x74]
04317 89442444                       mov        dword ptr [rsp + 0x44], eax
0431b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04320 48894424f8                     mov        qword ptr [rsp - 8], rax
04325 8b442478                       mov        eax, dword ptr [rsp + 0x78]
04329 89442458                       mov        dword ptr [rsp + 0x58], eax
0432d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04332 48894424f8                     mov        qword ptr [rsp - 8], rax
04337 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0433b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0433f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04344 4489742464                     mov        dword ptr [rsp + 0x64], r14d
04349 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0434e 4489542478                     mov        dword ptr [rsp + 0x78], r10d
04353 90                             nop        
04354 c5f877                         vzeroupper 
04357 e884b8b4ff                     call       0x7f1e7f9d7d60
0435c 0f1f84005444003c               nop        dword ptr [rax + rax + 0x3c004454]
04364 4183c510                       add        r13d, 0x10
04368 be6effffff                     mov        esi, 0xffffff6e
0436d 48ff742418                     push       qword ptr [rsp + 0x18]
04372 488f0424                       pop        qword ptr [rsp]
04376 48894424f8                     mov        qword ptr [rsp - 8], rax
0437b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0437f 89442414                       mov        dword ptr [rsp + 0x14], eax
04383 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04388 48894424f8                     mov        qword ptr [rsp - 8], rax
0438d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
04391 8944243c                       mov        dword ptr [rsp + 0x3c], eax
04395 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0439a 48ff742450                     push       qword ptr [rsp + 0x50]
0439f 488f442440                     pop        qword ptr [rsp + 0x40]
043a4 48ff742458                     push       qword ptr [rsp + 0x58]
043a9 488f442450                     pop        qword ptr [rsp + 0x50]
043ae 48ff742460                     push       qword ptr [rsp + 0x60]
043b3 488f442458                     pop        qword ptr [rsp + 0x58]
043b8 48894424f8                     mov        qword ptr [rsp - 8], rax
043bd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
043c1 89442464                       mov        dword ptr [rsp + 0x64], eax
043c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
043ca 48894424f8                     mov        qword ptr [rsp - 8], rax
043cf 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
043d6 89442468                       mov        dword ptr [rsp + 0x68], eax
043da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
043df 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
043e4 c5f877                         vzeroupper 
043e7 e8f4b7b4ff                     call       0x7f1e7f9d7d60
043ec 0f1f8400e444003d               nop        dword ptr [rax + rax + 0x3d0044e4]
043f4 4183c510                       add        r13d, 0x10
043f8 be66ffffff                     mov        esi, 0xffffff66
043fd 48ff742418                     push       qword ptr [rsp + 0x18]
04402 488f0424                       pop        qword ptr [rsp]
04406 48894424f8                     mov        qword ptr [rsp - 8], rax
0440b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0440f 89442414                       mov        dword ptr [rsp + 0x14], eax
04413 488b4424f8                     mov        rax, qword ptr [rsp - 8]
04418 48894424f8                     mov        qword ptr [rsp - 8], rax
0441d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
04421 8944243c                       mov        dword ptr [rsp + 0x3c], eax
04425 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0442a 48ff742450                     push       qword ptr [rsp + 0x50]
0442f 488f442440                     pop        qword ptr [rsp + 0x40]
04434 48ff742458                     push       qword ptr [rsp + 0x58]
04439 488f442450                     pop        qword ptr [rsp + 0x50]
0443e 48ff742460                     push       qword ptr [rsp + 0x60]
04443 488f442458                     pop        qword ptr [rsp + 0x58]
04448 48894424f8                     mov        qword ptr [rsp - 8], rax
0444d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
04451 89442464                       mov        dword ptr [rsp + 0x64], eax
04455 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0445a 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0445f 4489442470                     mov        dword ptr [rsp + 0x70], r8d
04464 c5f877                         vzeroupper 
04467 e874b7b4ff                     call       0x7f1e7f9d7d60
0446c 0f1f84006445003e               nop        dword ptr [rax + rax + 0x3e004564]
04474 4c898c24a0000000               mov        qword ptr [rsp + 0xa0], r9
0447c e9e9e1ffff                     jmp        0x7f1e7fe8a7ea
04481 bef6ffffff                     mov        esi, 0xfffffff6
04486 6690                           nop        
04488 c5f877                         vzeroupper 
0448b e850b7b4ff                     call       0x7f1e7f9d7d60
04490 0f1f84008845003f               nop        dword ptr [rax + rax + 0x3f004588]
04498 bef6ffffff                     mov        esi, 0xfffffff6
0449d 666690                         nop        
044a0 c5f877                         vzeroupper 
044a3 e838b7b4ff                     call       0x7f1e7f9d7d60
044a8 0f1f8400a0450040               nop        dword ptr [rax + rax + 0x400045a0]
044b0 bef6ffffff                     mov        esi, 0xfffffff6
044b5 666690                         nop        
044b8 c5f877                         vzeroupper 
044bb e820b7b4ff                     call       0x7f1e7f9d7d60
044c0 0f1f8400b8450041               nop        dword ptr [rax + rax + 0x410045b8]
044c8 bef6ffffff                     mov        esi, 0xfffffff6
044cd 666690                         nop        
044d0 c5f877                         vzeroupper 
044d3 e808b7b4ff                     call       0x7f1e7f9d7d60
044d8 0f1f8400d0450042               nop        dword ptr [rax + rax + 0x420045d0]
044e0 bef6ffffff                     mov        esi, 0xfffffff6
044e5 8bef                           mov        ebp, edi
044e7 90                             nop        
044e8 c5f877                         vzeroupper 
044eb e8f0b6b4ff                     call       0x7f1e7f9d7d60
044f0 0f1f8400e8450043               nop        dword ptr [rax + rax + 0x430045e8]
044f8 bef6ffffff                     mov        esi, 0xfffffff6
044fd 666690                         nop        
04500 c5f877                         vzeroupper 
04503 e8d8b6b4ff                     call       0x7f1e7f9d7d60
04508 0f1f840000460044               nop        dword ptr [rax + rax + 0x44004600]
04510 bef6ffffff                     mov        esi, 0xfffffff6
04515 894c240c                       mov        dword ptr [rsp + 0xc], ecx
04519 666690                         nop        
0451c c5f877                         vzeroupper 
0451f e8bcb6b4ff                     call       0x7f1e7f9d7d60
04524 0f1f84001c460045               nop        dword ptr [rax + rax + 0x4500461c]
0452c bef6ffffff                     mov        esi, 0xfffffff6
04531 894c2408                       mov        dword ptr [rsp + 8], ecx
04535 666690                         nop        
04538 c5f877                         vzeroupper 
0453b e8a0b6b4ff                     call       0x7f1e7f9d7d60
04540 0f1f840038460046               nop        dword ptr [rax + rax + 0x46004638]
04548 bef6ffffff                     mov        esi, 0xfffffff6
0454d 666690                         nop        
04550 c5f877                         vzeroupper 
04553 e888b6b4ff                     call       0x7f1e7f9d7d60
04558 0f1f840050460047               nop        dword ptr [rax + rax + 0x47004650]
04560 bef6ffffff                     mov        esi, 0xfffffff6
04565 448974240c                     mov        dword ptr [rsp + 0xc], r14d
0456a 6690                           nop        
0456c c5f877                         vzeroupper 
0456f e86cb6b4ff                     call       0x7f1e7f9d7d60
04574 0f1f84006c460048               nop        dword ptr [rax + rax + 0x4800466c]
0457c bef6ffffff                     mov        esi, 0xfffffff6
04581 666690                         nop        
04584 c5f877                         vzeroupper 
04587 e854b6b4ff                     call       0x7f1e7f9d7d60
0458c 0f1f840084460049               nop        dword ptr [rax + rax + 0x49004684]
04594 bef6ffffff                     mov        esi, 0xfffffff6
04599 4489742408                     mov        dword ptr [rsp + 8], r14d
0459e 6690                           nop        
045a0 c5f877                         vzeroupper 
045a3 e838b6b4ff                     call       0x7f1e7f9d7d60
045a8 0f1f8400a046004a               nop        dword ptr [rax + rax + 0x4a0046a0]
045b0 bef6ffffff                     mov        esi, 0xfffffff6
045b5 666690                         nop        
045b8 c5f877                         vzeroupper 
045bb e820b6b4ff                     call       0x7f1e7f9d7d60
045c0 0f1f8400b846004b               nop        dword ptr [rax + rax + 0x4b0046b8]
045c8 49ba5c8fe87f1e7f0000           movabs     r10, 0x7f1e7fe88f5c
045d2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
045d9 e98267a8ff                     jmp        0x7f1e7f912ee0
045de e83d33a7ff                     call       0x7f1e7f8ffaa0
045e3 e946baffff                     jmp        0x7f1e7fe881ae
