00000 e8fbd05219                     call       0x7f540539d780
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8530370000                   jne        0x7f53ebe73dde
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
00103 49bac03e4805547f0000           movabs     r10, 0x7f5405483ec0
0010d 41ffd2                         call       r10
00110 0f1f840000000000               nop        dword ptr [rax + rax]
00118 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0011d 4d85d2                         test       r10, r10
00120 0f84621f0000                   je         0x7f53ebe72708
00126 458b1a                         mov        r11d, dword ptr [r10]
00129 41c1eb0d                       shr        r11d, 0xd
0012d 4181fb15410000                 cmp        r11d, 0x4115
00134 0f85262b0000                   jne        0x7f53ebe732e0
0013a 498bda                         mov        rbx, r10
0013d 48895c2408                     mov        qword ptr [rsp + 8], rbx
00142 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00147 4d85d2                         test       r10, r10
0014a 0f84451f0000                   je         0x7f53ebe72715
00150 458b12                         mov        r10d, dword ptr [r10]
00153 41c1ea0d                       shr        r10d, 0xd
00157 4181fadd050000                 cmp        r10d, 0x5dd
0015e 0f85fc2a0000                   jne        0x7f53ebe732e0
00164 488b5c2450                     mov        rbx, qword ptr [rsp + 0x50]
00169 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
00171 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00176 4d85d2                         test       r10, r10
00179 0f84261f0000                   je         0x7f53ebe72725
0017f 458b1a                         mov        r11d, dword ptr [r10]
00182 41c1eb0d                       shr        r11d, 0xd
00186 4181fbe0050000                 cmp        r11d, 0x5e0
0018d 0f85cd2a0000                   jne        0x7f53ebe732e0
00193 498bda                         mov        rbx, r10
00196 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0019e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a3 4d85d2                         test       r10, r10
001a6 0f84091f0000                   je         0x7f53ebe72735
001ac 458b12                         mov        r10d, dword ptr [r10]
001af 41c1ea0d                       shr        r10d, 0xd
001b3 4181fadf050000                 cmp        r10d, 0x5df
001ba 0f85a02a0000                   jne        0x7f53ebe732e0
001c0 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
001c5 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
001ca 4885ed                         test       rbp, rbp
001cd 0f84ef1e0000                   je         0x7f53ebe72742
001d3 448b5d00                       mov        r11d, dword ptr [rbp]
001d7 41c1eb0d                       shr        r11d, 0xd
001db 4181fbdf050000                 cmp        r11d, 0x5df
001e2 0f85782a0000                   jne        0x7f53ebe732e0
001e8 488bdd                         mov        rbx, rbp
001eb 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
001f3 4d85ed                         test       r13, r13
001f6 0f84d61e0000                   je         0x7f53ebe72752
001fc 458b5500                       mov        r10d, dword ptr [r13]
00200 41c1ea0d                       shr        r10d, 0xd
00204 4181fadd050000                 cmp        r10d, 0x5dd
0020b 0f854f2a0000                   jne        0x7f53ebe732e0
00211 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00219 e908050000                     jmp        0x7f53ebe70da6
0021e 448bd5                         mov        r10d, ebp
00221 4d63d2                         movsxd     r10, r10d
00224 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0022b c442a8f5db                     bzhi       r11, r11, r10
00230 c4c1fb92fb                     kmovq      k7, r11
00235 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0023b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00241 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00249 4403d5                         add        r10d, ebp
0024c 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00254 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00258 418502                         test       dword ptr [r10], eax
0025b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00263 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
0026b 0f8d90080000                   jge        0x7f53ebe71181
00271 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
00276 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0027b 442b9424a0000000               sub        r10d, dword ptr [rsp + 0xa0]
00283 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0028b 8bac2480000000                 mov        ebp, dword ptr [rsp + 0x80]
00292 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
00299 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
002a0 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
002a8 410f4fed                       cmovg      ebp, r13d
002ac 4585d2                         test       r10d, r10d
002af 0f8c9b250000                   jl         0x7f53ebe72ed0
002b5 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002ba 4585d2                         test       r10d, r10d
002bd 0f8c8d250000                   jl         0x7f53ebe72ed0
002c3 448bd5                         mov        r10d, ebp
002c6 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
002ce 413bda                         cmp        ebx, r10d
002d1 0f8279250000                   jb         0x7f53ebe72ed0
002d7 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
002dc 4403ed                         add        r13d, ebp
002df 413bdd                         cmp        ebx, r13d
002e2 0f8268250000                   jb         0x7f53ebe72ed0
002e8 85ed                           test       ebp, ebp
002ea 0f8c60250000                   jl         0x7f53ebe72ed0
002f0 85ed                           test       ebp, ebp
002f2 0f8449ffffff                   je         0x7f53ebe708c1
002f8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002fd 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00305 4b8d741308                     lea        rsi, [r11 + r10 + 8]
0030a 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00312 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0031a 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0031f 4863d5                         movsxd     rdx, ebp
00322 4883fa20                       cmp        rdx, 0x20
00326 0f86f2feffff                   jbe        0x7f53ebe7089e
0032c c5f877                         vzeroupper 
0032f 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00339 41ffd2                         call       r10
0033c 0f1f840000000000               nop        dword ptr [rax + rax]
00344 e9f8feffff                     jmp        0x7f53ebe708c1
00349 48894424f8                     mov        qword ptr [rsp - 8], rax
0034e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
00352 89442448                       mov        dword ptr [rsp + 0x48], eax
00356 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0035b 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
00362 85c9                           test       ecx, ecx
00364 0f8ee6160000                   jle        0x7f53ebe720d0
0036a 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00372 4403db                         add        r11d, ebx
00375 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
0037d 0f8fe9170000                   jg         0x7f53ebe721ec
00383 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00388 4503d6                         add        r10d, r14d
0038b 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00393 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
0039b 0f8f53180000                   jg         0x7f53ebe72274
003a1 4183fe10                       cmp        r14d, 0x10
003a5 0f8ffd070000                   jg         0x7f53ebe71228
003ab 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
003b3 448b5b04                       mov        r11d, dword ptr [rbx + 4]
003b7 458d43f1                       lea        r8d, [r11 - 0xf]
003bb 4585c0                         test       r8d, r8d
003be 0f8cd4120000                   jl         0x7f53ebe71d18
003c4 4183c3f1                       add        r11d, -0xf
003c8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
003cd 453bd3                         cmp        r10d, r11d
003d0 0f8366110000                   jae        0x7f53ebe71bbc
003d6 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
003de 448b5304                       mov        r10d, dword ptr [rbx + 4]
003e2 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
003e6 4c8bac24c8000000               mov        r13, qword ptr [rsp + 0xc8]
003ee c4c17a6f441d08                 vmovdqu    xmm0, xmmword ptr [r13 + rbx + 8]
003f5 458d42f1                       lea        r8d, [r10 - 0xf]
003f9 4585c0                         test       r8d, r8d
003fc 0f8c32130000                   jl         0x7f53ebe71db4
00402 4183c2f1                       add        r10d, -0xf
00406 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0040e 453bc2                         cmp        r8d, r10d
00411 0f83c1110000                   jae        0x7f53ebe71c58
00417 458d2c1e                       lea        r13d, [r14 + rbx]
0041b 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
00423 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0042b 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
00433 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
0043a 4503f3                         add        r14d, r11d
0043d 458bee                         mov        r13d, r14d
00440 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
00448 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00450 418b5804                       mov        ebx, dword ptr [r8 + 4]
00454 448d53f1                       lea        r10d, [rbx - 0xf]
00458 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00460 4183f910                       cmp        r9d, 0x10
00464 7f49                           jg         0x7f53ebe70b2f
00466 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
0046e 4183f910                       cmp        r9d, 0x10
00472 7c3b                           jl         0x7f53ebe70b2f
00474 4585d2                         test       r10d, r10d
00477 0f8c43150000                   jl         0x7f53ebe72040
0047d 83c3f1                         add        ebx, -0xf
00480 443beb                         cmp        r13d, ebx
00483 0f8303140000                   jae        0x7f53ebe71f0c
00489 c4817a6f442808                 vmovdqu    xmm0, xmmword ptr [r8 + r13 + 8]
00490 443bf3                         cmp        r14d, ebx
00493 0f837f140000                   jae        0x7f53ebe71f98
00499 c4817a7f443008                 vmovdqu    xmmword ptr [r8 + r14 + 8], xmm0
004a0 8b9c2480000000                 mov        ebx, dword ptr [rsp + 0x80]
004a7 4103de                         add        ebx, r14d
004aa e947020000                     jmp        0x7f53ebe70d76
004af 448d5bf9                       lea        r11d, [rbx - 7]
004b3 4b8d7c2808                     lea        rdi, [r8 + r13 + 8]
004b8 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
004c0 4503ce                         add        r9d, r14d
004c3 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
004cb 4b8d743008                     lea        rsi, [r8 + r14 + 8]
004d0 4963d1                         movsxd     rdx, r9d
004d3 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
004da 3b8c2480000000                 cmp        ecx, dword ptr [rsp + 0x80]
004e1 0f8c84040000                   jl         0x7f53ebe70feb
004e7 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
004ef 4183f930                       cmp        r9d, 0x30
004f3 0f8e85000000                   jle        0x7f53ebe70bfe
004f9 4585ed                         test       r13d, r13d
004fc 0f8ce01b0000                   jl         0x7f53ebe72762
00502 4585f6                         test       r14d, r14d
00505 0f8cd71b0000                   jl         0x7f53ebe72762
0050b 478d1429                       lea        r10d, [r9 + r13]
0050f 413bda                         cmp        ebx, r10d
00512 0f82ca1b0000                   jb         0x7f53ebe72762
00518 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
0051f 0f82bd1b0000                   jb         0x7f53ebe72762
00525 418bd9                         mov        ebx, r9d
00528 85db                           test       ebx, ebx
0052a 0f84bb010000                   je         0x7f53ebe70d6b
00530 4863d3                         movsxd     rdx, ebx
00533 4883fa20                       cmp        rdx, 0x20
00537 7728                           ja         0x7f53ebe70be1
00539 448bd3                         mov        r10d, ebx
0053c 4d63d2                         movsxd     r10, r10d
0053f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00546 c442a8f5db                     bzhi       r11, r11, r10
0054b c4c1fb92fb                     kmovq      k7, r11
00550 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00556 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0055c e98a010000                     jmp        0x7f53ebe70d6b
00561 c5f877                         vzeroupper 
00564 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
0056e 41ffd2                         call       r10
00571 0f1f840000000000               nop        dword ptr [rax + rax]
00579 e96d010000                     jmp        0x7f53ebe70d6b
0057e 4585db                         test       r11d, r11d
00581 0f8c21190000                   jl         0x7f53ebe72528
00587 448d53f9                       lea        r10d, [rbx - 7]
0058b 453bea                         cmp        r13d, r10d
0058e 0f83d4170000                   jae        0x7f53ebe723e8
00594 4963fd                         movsxd     rdi, r13d
00597 498b4c3808                     mov        rcx, qword ptr [r8 + rdi + 8]
0059c 453bf2                         cmp        r14d, r10d
0059f 0f8363180000                   jae        0x7f53ebe72488
005a5 458bce                         mov        r9d, r14d
005a8 458d5908                       lea        r11d, [r9 + 8]
005ac 4963f1                         movsxd     rsi, r9d
005af 49894c3008                     mov        qword ptr [r8 + rsi + 8], rcx
005b4 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
005bc 0f8d29010000                   jge        0x7f53ebe70d6b
005c2 482bfe                         sub        rdi, rsi
005c5 4863f3                         movsxd     rsi, ebx
005c8 4883c6f9                       add        rsi, -7
005cc 4963db                         movsxd     rbx, r11d
005cf 488d0c3b                       lea        rcx, [rbx + rdi]
005d3 483bce                         cmp        rcx, rsi
005d6 0f836c190000                   jae        0x7f53ebe725c8
005dc 488bca                         mov        rcx, rdx
005df 482bcb                         sub        rcx, rbx
005e2 4883c107                       add        rcx, 7
005e6 4883e1f8                       and        rcx, 0xfffffffffffffff8
005ea 8bc9                           mov        ecx, ecx
005ec 428d5c0908                     lea        ebx, [rcx + r9 + 8]
005f1 4863cb                         movsxd     rcx, ebx
005f4 488d5c39f8                     lea        rbx, [rcx + rdi - 8]
005f9 483bde                         cmp        rbx, rsi
005fc 0f8346190000                   jae        0x7f53ebe725c8
00602 453bda                         cmp        r11d, r10d
00605 0f833d190000                   jae        0x7f53ebe725c8
0060b 4883c1f8                       add        rcx, -8
0060f 483bce                         cmp        rcx, rsi
00612 0f8330190000                   jae        0x7f53ebe725c8
00618 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0061f 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00625 0f8fc5190000                   jg         0x7f53ebe72670
0062b 452be9                         sub        r13d, r9d
0062e 4183c110                       add        r9d, 0x10
00632 458bd3                         mov        r10d, r11d
00635 438d0c2b                       lea        ecx, [r11 + r13]
00639 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
00641 4c8b440b08                     mov        r8, qword ptr [rbx + rcx + 8]
00646 4e89441308                     mov        qword ptr [rbx + r10 + 8], r8
0064b 4183c308                       add        r11d, 8
0064f 453bd9                         cmp        r11d, r9d
00652 7cde                           jl         0x7f53ebe70cb2
00654 4883c2f8                       add        rdx, -8
00658 4881fa00000080                 cmp        rdx, -0x80000000
0065f 49c7c200000080                 mov        r10, 0xffffffff80000000
00666 490f4cd2                       cmovl      rdx, r10
0066a 448bd2                         mov        r10d, edx
0066d 453bda                         cmp        r11d, r10d
00670 7d46                           jge        0x7f53ebe70d38
00672 0f1f8000000000                 nop        dword ptr [rax]
00679 0f1f8000000000                 nop        dword ptr [rax]
00680 458bcb                         mov        r9d, r11d
00683 4963d9                         movsxd     rbx, r9d
00686 458bc3                         mov        r8d, r11d
00689 478d0c2b                       lea        r9d, [r11 + r13]
0068d 418bc9                         mov        ecx, r9d
00690 488bbc24e0000000               mov        rdi, qword ptr [rsp + 0xe0]
00698 4e8b4c0f08                     mov        r9, qword ptr [rdi + r9 + 8]
0069d 4e894c0708                     mov        qword ptr [rdi + r8 + 8], r9
006a2 4c63c1                         movsxd     r8, ecx
006a5 4e8b440710                     mov        r8, qword ptr [rdi + r8 + 0x10]
006aa 4c89441f10                     mov        qword ptr [rdi + rbx + 0x10], r8
006af 4183c310                       add        r11d, 0x10
006b3 453bda                         cmp        r11d, r10d
006b6 7cc8                           jl         0x7f53ebe70d00
006b8 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
006c0 7d29                           jge        0x7f53ebe70d6b
006c2 6690                           nop        
006c4 478d142b                       lea        r10d, [r11 + r13]
006c8 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
006d0 4e8b541308                     mov        r10, qword ptr [rbx + r10 + 8]
006d5 458bc3                         mov        r8d, r11d
006d8 4e89540308                     mov        qword ptr [rbx + r8 + 8], r10
006dd 4183c308                       add        r11d, 8
006e1 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
006e9 7cd9                           jl         0x7f53ebe70d44
006eb 4403b42480000000               add        r14d, dword ptr [rsp + 0x80]
006f3 418bde                         mov        ebx, r14d
006f6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006fb 41ffc3                         inc        r11d
006fe 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00703 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00707 418502                         test       dword ptr [r10], eax
0070a 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00711 48894424f8                     mov        qword ptr [rsp - 8], rax
00716 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0071d 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00721 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00726 4c6344247c                     movsxd     r8, dword ptr [rsp + 0x7c]
0072b 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
00733 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00738 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
0073d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00742 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00747 0f8db9060000                   jge        0x7f53ebe71486
0074d 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00755 8b4b04                         mov        ecx, dword ptr [rbx + 4]
00758 443bd9                         cmp        r11d, ecx
0075b 0f836e0d0000                   jae        0x7f53ebe71b4f
00761 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00769 4a8b4cdb08                     mov        rcx, qword ptr [rbx + r11*8 + 8]
0076e 448bf1                         mov        r14d, ecx
00771 4181e6ffff0100                 and        r14d, 0x1ffff
00778 4c8bd9                         mov        r11, rcx
0077b 49c1fb24                       sar        r11, 0x24
0077f 48c1e912                       shr        rcx, 0x12
00783 458bdb                         mov        r11d, r11d
00786 8bd9                           mov        ebx, ecx
00788 81e3ffff0300                   and        ebx, 0x3ffff
0078e 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
00795 4585db                         test       r11d, r11d
00798 0f8cd2120000                   jl         0x7f53ebe720f0
0079e 4585f6                         test       r14d, r14d
007a1 0f85d4000000                   jne        0x7f53ebe70efb
007a7 4533f6                         xor        r14d, r14d
007aa 4183fb03                       cmp        r11d, 3
007ae 0f8eec000000                   jle        0x7f53ebe70f20
007b4 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
007bc 448b5304                       mov        r10d, dword ptr [rbx + 4]
007c0 4183c3fd                       add        r11d, -3
007c4 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
007cc 4183fa02                       cmp        r10d, 2
007d0 0f861e100000                   jbe        0x7f53ebe71e74
007d6 448b530c                       mov        r10d, dword ptr [rbx + 0xc]
007da 44895310                       mov        dword ptr [rbx + 0x10], r10d
007de 448b5b08                       mov        r11d, dword ptr [rbx + 8]
007e2 44895b0c                       mov        dword ptr [rbx + 0xc], r11d
007e6 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
007ee 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
007f5 41895d08                       mov        dword ptr [r13 + 8], ebx
007f9 4c639424a0000000               movsxd     r10, dword ptr [rsp + 0xa0]
00801 4c891424                       mov        qword ptr [rsp], r10
00805 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
0080d 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00815 4963d6                         movsxd     rdx, r14d
00818 4c03d2                         add        r10, rdx
0081b 4c8b1c24                       mov        r11, qword ptr [rsp]
0081f 4d3bda                         cmp        r11, r10
00822 0f8fc0120000                   jg         0x7f53ebe72168
00828 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
0082f 4103de                         add        ebx, r14d
00832 448beb                         mov        r13d, ebx
00835 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
0083d 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00842 4585db                         test       r11d, r11d
00845 0f85fefaffff                   jne        0x7f53ebe709c9
0084b 4d63dd                         movsxd     r11, r13d
0084e 4c3b9c24b0000000               cmp        r11, qword ptr [rsp + 0xb0]
00856 0f8c1c140000                   jl         0x7f53ebe722f8
0085c 4c8b1c24                       mov        r11, qword ptr [rsp]
00860 4c3b9c24b8000000               cmp        r11, qword ptr [rsp + 0xb8]
00868 0f8f82140000                   jg         0x7f53ebe72370
0086e 4533db                         xor        r11d, r11d
00871 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00876 e9e0faffff                     jmp        0x7f53ebe709db
0087b 453bf2                         cmp        r14d, r10d
0087e 0f8e26ffffff                   jle        0x7f53ebe70e2a
00884 be45ffffff                     mov        esi, 0xffffff45
00889 418bee                         mov        ebp, r14d
0088c 44891424                       mov        dword ptr [rsp], r10d
00890 c5f877                         vzeroupper 
00893 e84827b5ff                     call       0x7f53eb9c3660
00898 0f1f840090090002               nop        dword ptr [rax + rax + 0x2000990]
008a0 4585f6                         test       r14d, r14d
008a3 7407                           je         0x7f53ebe70f2c
008a5 458d53ff                       lea        r10d, [r11 - 1]
008a9 458bda                         mov        r11d, r10d
008ac 4585db                         test       r11d, r11d
008af 751d                           jne        0x7f53ebe70f4e
008b1 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
008b9 448b5304                       mov        r10d, dword ptr [rbx + 4]
008bd 4585d2                         test       r10d, r10d
008c0 0f86f61a0000                   jbe        0x7f53ebe72a3c
008c6 8b5b08                         mov        ebx, dword ptr [rbx + 8]
008c9 e991000000                     jmp        0x7f53ebe70fdf
008ce 4183fb03                       cmp        r11d, 3
008d2 0f8488200000                   je         0x7f53ebe72fe0
008d8 4183fb02                       cmp        r11d, 2
008dc 0f8706210000                   ja         0x7f53ebe73068
008e2 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
008ea 448b5304                       mov        r10d, dword ptr [rbx + 4]
008ee 453bda                         cmp        r11d, r10d
008f1 0f8389190000                   jae        0x7f53ebe72900
008f7 428b5c9b08                     mov        ebx, dword ptr [rbx + r11*4 + 8]
008fc 4585db                         test       r11d, r11d
008ff 7e49                           jle        0x7f53ebe70fca
00901 4585d2                         test       r10d, r10d
00904 0f86b61f0000                   jbe        0x7f53ebe72f40
0090a 418d4bff                       lea        ecx, [r11 - 1]
0090e 413bca                         cmp        ecx, r10d
00911 0f83a91f0000                   jae        0x7f53ebe72f40
00917 4183fa01                       cmp        r10d, 1
0091b 0f869f1f0000                   jbe        0x7f53ebe72f40
00921 0f1f840000000000               nop        dword ptr [rax + rax]
00929 0f1f8000000000                 nop        dword ptr [rax]
00930 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
00938 438b4c9d04                     mov        ecx, dword ptr [r13 + r11*4 + 4]
0093d 43894c9d08                     mov        dword ptr [r13 + r11*4 + 8], ecx
00942 41ffcb                         dec        r11d
00945 4585db                         test       r11d, r11d
00948 7fe6                           jg         0x7f53ebe70fb0
0094a 4585d2                         test       r10d, r10d
0094d 0f86e1190000                   jbe        0x7f53ebe729b4
00953 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
0095b 41895d08                       mov        dword ptr [r13 + 8], ebx
0095f 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
00966 e98efeffff                     jmp        0x7f53ebe70e79
0096b 83f910                         cmp        ecx, 0x10
0096e 0f8ddf080000                   jge        0x7f53ebe718d3
00974 83f908                         cmp        ecx, 8
00977 0f8d8a050000                   jge        0x7f53ebe71587
0097d 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00985 4183fa10                       cmp        r10d, 0x10
00989 0f8f7e010000                   jg         0x7f53ebe7118d
0098f 443beb                         cmp        r13d, ebx
00992 0f83981a0000                   jae        0x7f53ebe72ab0
00998 430fbe6c2808                   movsx      ebp, byte ptr [r8 + r13 + 8]
0099e 443bf3                         cmp        r14d, ebx
009a1 0f831d1b0000                   jae        0x7f53ebe72b44
009a7 43886c3008                     mov        byte ptr [r8 + r14 + 8], bpl
009ac 458d5601                       lea        r10d, [r14 + 1]
009b0 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
009b8 458d5503                       lea        r10d, [r13 + 3]
009bc 443bd3                         cmp        r10d, ebx
009bf 0f83671b0000                   jae        0x7f53ebe72bac
009c5 4d63d5                         movsxd     r10, r13d
009c8 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
009ce 458d4e03                       lea        r9d, [r14 + 3]
009d2 443bcb                         cmp        r9d, ebx
009d5 0f83c91b0000                   jae        0x7f53ebe72c24
009db 4963ce                         movsxd     rcx, r14d
009de 41886c0809                     mov        byte ptr [r8 + rcx + 9], bpl
009e3 470fbe4c100a                   movsx      r9d, byte ptr [r8 + r10 + 0xa]
009e9 45884c080a                     mov        byte ptr [r8 + rcx + 0xa], r9b
009ee 470fbe4c100b                   movsx      r9d, byte ptr [r8 + r10 + 0xb]
009f4 45884c080b                     mov        byte ptr [r8 + rcx + 0xb], r9b
009f9 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00a01 4183fa08                       cmp        r10d, 8
00a05 0f830d1c0000                   jae        0x7f53ebe72c98
00a0b 49ba283827e300000000           movabs     r10, 0xe3273828
00a15 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00a1d 47036c8a08                     add        r13d, dword ptr [r10 + r9*4 + 8]
00a22 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00a2a 4183fa04                       cmp        r10d, 4
00a2e 7e64                           jle        0x7f53ebe71114
00a30 8d6bfd                         lea        ebp, [rbx - 3]
00a33 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
00a3a 458d5604                       lea        r10d, [r14 + 4]
00a3e 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00a46 85ed                           test       ebp, ebp
00a48 0f8c621d0000                   jl         0x7f53ebe72e30
00a4e 448bcb                         mov        r9d, ebx
00a51 4183c1fd                       add        r9d, -3
00a55 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
00a5d 453be9                         cmp        r13d, r9d
00a60 0f833a1c0000                   jae        0x7f53ebe72d20
00a66 458bd5                         mov        r10d, r13d
00a69 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00a6e 438b6c1008                     mov        ebp, dword ptr [r8 + r10 + 8]
00a73 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00a7b 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00a83 0f83b71c0000                   jae        0x7f53ebe72dc0
00a89 458bce                         mov        r9d, r14d
00a8c 4d63d1                         movsxd     r10, r9d
00a8f 43896c100c                     mov        dword ptr [r8 + r10 + 0xc], ebp
00a94 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00a9c 4183f908                       cmp        r9d, 8
00aa0 7e5f                           jle        0x7f53ebe71181
00aa2 49b9503827e300000000           movabs     r9, 0xe3273850
00aac 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00ab4 478b4c9108                     mov        r9d, dword ptr [r9 + r10*4 + 8]
00ab9 452be9                         sub        r13d, r9d
00abc 458d5608                       lea        r10d, [r14 + 8]
00ac0 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00ac8 418d6d08                       lea        ebp, [r13 + 8]
00acc 4585db                         test       r11d, r11d
00acf 0f8c73200000                   jl         0x7f53ebe731c8
00ad5 83c3f9                         add        ebx, -7
00ad8 3beb                           cmp        ebp, ebx
00ada 0f83901f0000                   jae        0x7f53ebe730f0
00ae0 4d63d5                         movsxd     r10, r13d
00ae3 4b8b6c1010                     mov        rbp, qword ptr [r8 + r10 + 0x10]
00ae8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00af0 443bdb                         cmp        r11d, ebx
00af3 0f83ef1f0000                   jae        0x7f53ebe73168
00af9 4d63d6                         movsxd     r10, r14d
00afc 4b896c1010                     mov        qword ptr [r8 + r10 + 0x10], rbp
00b01 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00b08 e9e9fbffff                     jmp        0x7f53ebe70d76
00b0d 4585ed                         test       r13d, r13d
00b10 0f8caa200000                   jl         0x7f53ebe73240
00b16 4585f6                         test       r14d, r14d
00b19 0f8ca1200000                   jl         0x7f53ebe73240
00b1f 413bde                         cmp        ebx, r14d
00b22 0f8298200000                   jb         0x7f53ebe73240
00b28 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00b30 4503de                         add        r11d, r14d
00b33 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00b38 413bdb                         cmp        ebx, r11d
00b3b 0f827f200000                   jb         0x7f53ebe73240
00b41 85c9                           test       ecx, ecx
00b43 0f8c77200000                   jl         0x7f53ebe73240
00b49 85c9                           test       ecx, ecx
00b4b 0f8425f7ffff                   je         0x7f53ebe708f6
00b51 4c8b1424                       mov        r10, qword ptr [rsp]
00b55 4983fa20                       cmp        r10, 0x20
00b59 772d                           ja         0x7f53ebe71208
00b5b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b63 4d63d2                         movsxd     r10, r10d
00b66 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b6d c442a8f5db                     bzhi       r11, r11, r10
00b72 c4c1fb92fb                     kmovq      k7, r11
00b77 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b7d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b83 e9eef6ffff                     jmp        0x7f53ebe708f6
00b88 498bd2                         mov        rdx, r10
00b8b c5f877                         vzeroupper 
00b8e 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00b98 41ffd2                         call       r10
00b9b 0f1f840000000000               nop        dword ptr [rax + rax]
00ba3 e9cef6ffff                     jmp        0x7f53ebe708f6
00ba8 4183fe30                       cmp        r14d, 0x30
00bac 0f8eb3000000                   jle        0x7f53ebe712e5
00bb2 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bba 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00bbe 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00bc6 418b7204                       mov        esi, dword ptr [r10 + 4]
00bca 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00bcf 4585d2                         test       r10d, r10d
00bd2 0f8cc0220000                   jl         0x7f53ebe73518
00bd8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00be0 4585db                         test       r11d, r11d
00be3 0f8caf220000                   jl         0x7f53ebe73518
00be9 3b8c2494000000                 cmp        ecx, dword ptr [rsp + 0x94]
00bf0 0f82a2220000                   jb         0x7f53ebe73518
00bf6 3bf3                           cmp        esi, ebx
00bf8 0f829a220000                   jb         0x7f53ebe73518
00bfe 4585f6                         test       r14d, r14d
00c01 7440                           je         0x7f53ebe712c3
00c03 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c0b 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
00c10 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c18 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00c1d 4883fa20                       cmp        rdx, 0x20
00c21 7728                           ja         0x7f53ebe712cb
00c23 4d63d6                         movsxd     r10, r14d
00c26 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c2d c442a8f5db                     bzhi       r11, r11, r10
00c32 c4c1fb92fb                     kmovq      k7, r11
00c37 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c3d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c43 448bf3                         mov        r14d, ebx
00c46 e9fdf7ffff                     jmp        0x7f53ebe70ac8
00c4b c5f877                         vzeroupper 
00c4e 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00c58 41ffd2                         call       r10
00c5b 0f1f840000000000               nop        dword ptr [rax + rax]
00c63 ebde                           jmp        0x7f53ebe712c3
00c65 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c6d 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00c71 8d69f1                         lea        ebp, [rcx - 0xf]
00c74 85ed                           test       ebp, ebp
00c76 0f8c94210000                   jl         0x7f53ebe73490
00c7c 8d69f1                         lea        ebp, [rcx - 0xf]
00c7f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c84 443bdd                         cmp        r11d, ebp
00c87 0f834f200000                   jae        0x7f53ebe7335c
00c8d 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c95 458b4204                       mov        r8d, dword ptr [r10 + 4]
00c99 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c9e 418bc2                         mov        eax, r10d
00ca1 418d68f1                       lea        ebp, [r8 - 0xf]
00ca5 4d63ca                         movsxd     r9, r10d
00ca8 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00cb0 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00cb7 85ed                           test       ebp, ebp
00cb9 0f8c9d220000                   jl         0x7f53ebe735dc
00cbf 458d58f1                       lea        r11d, [r8 - 0xf]
00cc3 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00ccb 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00cd3 453bd3                         cmp        r10d, r11d
00cd6 0f8388200000                   jae        0x7f53ebe733e4
00cdc 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00ce4 418bfb                         mov        edi, r11d
00ce7 4963d3                         movsxd     rdx, r11d
00cea 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00cf2 c4c17a7f441208                 vmovdqu    xmmword ptr [r10 + rdx + 8], xmm0
00cf9 458d5310                       lea        r10d, [r11 + 0x10]
00cfd 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00d02 443bd3                         cmp        r10d, ebx
00d05 0f8dc3000000                   jge        0x7f53ebe7144e
00d0b 4c2bca                         sub        r9, rdx
00d0e 4c63d9                         movsxd     r11, ecx
00d11 4983c3f1                       add        r11, -0xf
00d15 4963ca                         movsxd     rcx, r10d
00d18 4e8d1409                       lea        r10, [rcx + r9]
00d1c 4d3bd3                         cmp        r10, r11
00d1f 0f83b7220000                   jae        0x7f53ebe7365c
00d25 4c63d3                         movsxd     r10, ebx
00d28 4c2bd1                         sub        r10, rcx
00d2b 4983c20f                       add        r10, 0xf
00d2f 4983e2f0                       and        r10, 0xfffffffffffffff0
00d33 418bca                         mov        ecx, r10d
00d36 448d543910                     lea        r10d, [rcx + rdi + 0x10]
00d3b 4d63d2                         movsxd     r10, r10d
00d3e 4f8d4c0af0                     lea        r9, [r10 + r9 - 0x10]
00d43 4d3bcb                         cmp        r9, r11
00d46 0f8390220000                   jae        0x7f53ebe7365c
00d4c 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00d51 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00d59 0f837d220000                   jae        0x7f53ebe7365c
00d5f 4d63d8                         movsxd     r11, r8d
00d62 4983c2f0                       add        r10, -0x10
00d66 4983c3f1                       add        r11, -0xf
00d6a 4d3bd3                         cmp        r10, r11
00d6d 0f8369220000                   jae        0x7f53ebe7365c
00d73 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00d79 0f8fc5220000                   jg         0x7f53ebe736c4
00d7f 448bc0                         mov        r8d, eax
00d82 442bc7                         sub        r8d, edi
00d85 6666660f1f840000000000         nop        word ptr [rax + rax]
00d90 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00d95 458bd8                         mov        r11d, r8d
00d98 44035c247c                     add        r11d, dword ptr [rsp + 0x7c]
00d9d 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00da5 c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
00dac 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00db4 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00dbb 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00dc0 4183c310                       add        r11d, 0x10
00dc4 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00dc9 443bdb                         cmp        r11d, ebx
00dcc 7cc2                           jl         0x7f53ebe71410
00dce 4403f0                         add        r14d, eax
00dd1 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00dd9 448bf3                         mov        r14d, ebx
00ddc e967f6ffff                     jmp        0x7f53ebe70ac8
00de1 4d63d2                         movsxd     r10, r10d
00de4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00deb c442a8f5db                     bzhi       r11, r11, r10
00df0 c4c1fb92fb                     kmovq      k7, r11
00df5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dfb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e01 e994000000                     jmp        0x7f53ebe7151a
00e06 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00e0e 448b5904                       mov        r11d, dword ptr [rcx + 4]
00e12 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
00e1a 418b7e04                       mov        edi, dword ptr [r14 + 4]
00e1e 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00e23 4585ed                         test       r13d, r13d
00e26 0f8c841e0000                   jl         0x7f53ebe73330
00e2c 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00e33 85db                           test       ebx, ebx
00e35 0f8c7c1e0000                   jl         0x7f53ebe73337
00e3b 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00e40 0f82711e0000                   jb         0x7f53ebe73337
00e46 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00e4d 4103ea                         add        ebp, r10d
00e50 3bfd                           cmp        edi, ebp
00e52 0f825f1e0000                   jb         0x7f53ebe73337
00e58 4585d2                         test       r10d, r10d
00e5b 0f8c561e0000                   jl         0x7f53ebe73337
00e61 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00e65 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00e69 742f                           je         0x7f53ebe7151a
00e6b 4b8d740e08                     lea        rsi, [r14 + r9 + 8]
00e70 4a8d7c0108                     lea        rdi, [rcx + r8 + 8]
00e75 4963d2                         movsxd     rdx, r10d
00e78 4883fa20                       cmp        rdx, 0x20
00e7c 0f865fffffff                   jbe        0x7f53ebe71461
00e82 c5f877                         vzeroupper 
00e85 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00e8f 41ffd2                         call       r10
00e92 0f1f840000000000               nop        dword ptr [rax + rax]
00e9a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00e9f 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00ea3 c5f877                         vzeroupper 
00ea6 4881c400010000                 add        rsp, 0x100
00ead 5d                             pop        rbp
00eae 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00eb2 0f8790280000                   ja         0x7f53ebe73dc8
00eb8 c3                             ret        
00eb9 448bdd                         mov        r11d, ebp
00ebc 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00ec1 4c8be9                         mov        r13, rcx
00ec4 448bd0                         mov        r10d, eax
00ec7 4403542468                     add        r10d, dword ptr [rsp + 0x68]
00ecc 62917e486f841508000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 8]
00ed7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00edc 62917e487f841d08000000         vmovdqu32  zmmword ptr [r13 + r11 + 8], zmm0
00ee7 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00eec 4183c240                       add        r10d, 0x40
00ef0 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00ef5 443bd3                         cmp        r10d, ebx
00ef8 7cca                           jl         0x7f53ebe71544
00efa 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00f02 e902030000                     jmp        0x7f53ebe71889
00f07 4585db                         test       r11d, r11d
00f0a 0f8cac220000                   jl         0x7f53ebe7383c
00f10 8d6bf9                         lea        ebp, [rbx - 7]
00f13 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
00f1a 443bed                         cmp        r13d, ebp
00f1d 0f8389210000                   jae        0x7f53ebe7372c
00f23 458bd5                         mov        r10d, r13d
00f26 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00f2b 4d63ca                         movsxd     r9, r10d
00f2e 4f8b540808                     mov        r10, qword ptr [r8 + r9 + 8]
00f33 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00f38 443bf5                         cmp        r14d, ebp
00f3b 0f83f7210000                   jae        0x7f53ebe737b8
00f41 418bce                         mov        ecx, r14d
00f44 8d6908                         lea        ebp, [rcx + 8]
00f47 896c2468                       mov        dword ptr [rsp + 0x68], ebp
00f4b 4c63d1                         movsxd     r10, ecx
00f4e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00f53 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
00f58 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00f5f 0f8de2020000                   jge        0x7f53ebe718c7
00f65 4d2bca                         sub        r9, r10
00f68 4863db                         movsxd     rbx, ebx
00f6b 4883c3f9                       add        rbx, -7
00f6f 4863f5                         movsxd     rsi, ebp
00f72 4e8d140e                       lea        r10, [rsi + r9]
00f76 4c3bd3                         cmp        r10, rbx
00f79 0f83d1220000                   jae        0x7f53ebe738d0
00f7f 4c8bd2                         mov        r10, rdx
00f82 4c2bd6                         sub        r10, rsi
00f85 4983c207                       add        r10, 7
00f89 4983e2f8                       and        r10, 0xfffffffffffffff8
00f8d 458bda                         mov        r11d, r10d
00f90 458d540b08                     lea        r10d, [r11 + rcx + 8]
00f95 4d63d2                         movsxd     r10, r10d
00f98 4f8d5c0af8                     lea        r11, [r10 + r9 - 8]
00f9d 4c3bdb                         cmp        r11, rbx
00fa0 0f83aa220000                   jae        0x7f53ebe738d0
00fa6 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
00fad 0f839d220000                   jae        0x7f53ebe738d0
00fb3 4983c2f8                       add        r10, -8
00fb7 4c3bd3                         cmp        r10, rbx
00fba 0f8390220000                   jae        0x7f53ebe738d0
00fc0 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00fc7 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00fcd 0f8f0d230000                   jg         0x7f53ebe73960
00fd3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00fd8 442bd9                         sub        r11d, ecx
00fdb 418bc3                         mov        eax, r11d
00fde 4d8bd8                         mov        r11, r8
00fe1 4c8d52c8                       lea        r10, [rdx - 0x38]
00fe5 4981fa00000080                 cmp        r10, -0x80000000
00fec 49c7c100000080                 mov        r9, 0xffffffff80000000
00ff3 4d0f4cd1                       cmovl      r10, r9
00ff7 418bda                         mov        ebx, r10d
00ffa 452bee                         sub        r13d, r14d
00ffd 41baf8ffffff                   mov        r10d, 0xfffffff8
01003 8d7910                         lea        edi, [rcx + 0x10]
01006 458bc8                         mov        r9d, r8d
01009 452bd1                         sub        r10d, r9d
0100c 442bd1                         sub        r10d, ecx
0100f 4183c2f0                       add        r10d, -0x10
01013 4c63cf                         movsxd     r9, edi
01016 b906000000                     mov        ecx, 6
0101b c442f0f5d2                     bzhi       r10, r10, rcx
01020 4d03ca                         add        r9, r10
01023 4c3bca                         cmp        r9, rdx
01026 488bca                         mov        rcx, rdx
01029 490f4cc9                       cmovl      rcx, r9
0102d 4c8bd1                         mov        r10, rcx
01030 4c2bd6                         sub        r10, rsi
01033 4d8d4aff                       lea        r9, [r10 - 1]
01037 49c1f93f                       sar        r9, 0x3f
0103b 49c1e93d                       shr        r9, 0x3d
0103f 4f8d5411ff                     lea        r10, [r9 + r10 - 1]
01044 4983e2f8                       and        r10, 0xfffffffffffffff8
01048 4c03d6                         add        r10, rsi
0104b 493bf2                         cmp        rsi, r10
0104e 490f4cf2                       cmovl      rsi, r10
01052 448bce                         mov        r9d, esi
01055 478d540d08                     lea        r10d, [r13 + r9 + 8]
0105a 4183c108                       add        r9d, 8
0105e 4963f2                         movsxd     rsi, r10d
01061 4903f3                         add        rsi, r11
01064 4963e9                         movsxd     rbp, r9d
01067 4903eb                         add        rbp, r11
0106a 4c8d5e08                       lea        r11, [rsi + 8]
0106e 4883c648                       add        rsi, 0x48
01072 4c8d4d48                       lea        r9, [rbp + 0x48]
01076 4533d2                         xor        r10d, r10d
01079 4d3bcb                         cmp        r9, r11
0107c 410f96c2                       setbe      r10b
01080 4883c508                       add        rbp, 8
01084 4533c9                         xor        r9d, r9d
01087 483bf5                         cmp        rsi, rbp
0108a 410f96c1                       setbe      r9b
0108e 450bd1                         or         r10d, r9d
01091 0f84d5100000                   je         0x7f53ebe727ec
01097 448bd1                         mov        r10d, ecx
0109a 6690                           nop        
0109c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
010a1 8bc8                           mov        ecx, eax
010a3 034c2468                       add        ecx, dword ptr [rsp + 0x68]
010a7 4d8b4c0808                     mov        r9, qword ptr [r8 + rcx + 8]
010ac 4f894c1808                     mov        qword ptr [r8 + r11 + 8], r9
010b1 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
010b5 83c508                         add        ebp, 8
010b8 896c2468                       mov        dword ptr [rsp + 0x68], ebp
010bc 413bea                         cmp        ebp, r10d
010bf 7cdb                           jl         0x7f53ebe7171c
010c1 4881c208feffff                 add        rdx, -0x1f8
010c8 4881fa00000080                 cmp        rdx, -0x80000000
010cf 49c7c200000080                 mov        r10, 0xffffffff80000000
010d6 490f4cd2                       cmovl      rdx, r10
010da 448bca                         mov        r9d, edx
010dd 413be9                         cmp        ebp, r9d
010e0 0f8d7a220000                   jge        0x7f53ebe739e0
010e6 896c2468                       mov        dword ptr [rsp + 0x68], ebp
010ea 498bc8                         mov        rcx, r8
010ed 666690                         nop        
010f0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
010f5 4963fb                         movsxd     rdi, r11d
010f8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
010fd 448bc0                         mov        r8d, eax
01100 4403442468                     add        r8d, dword ptr [rsp + 0x68]
01105 8b742468                       mov        esi, dword ptr [rsp + 0x68]
01109 81c680000000                   add        esi, 0x80
0110f 03f0                           add        esi, eax
01111 458bd8                         mov        r11d, r8d
01114 62b17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 8]
0111f 62b17e487f841108000000         vmovdqu32  zmmword ptr [rcx + r10 + 8], zmm0
0112a 4d63c0                         movsxd     r8, r8d
0112d 62b17e486f840148000000         vmovdqu32  zmm0, zmmword ptr [rcx + r8 + 0x48]
01138 62f17e487f843948000000         vmovdqu32  zmmword ptr [rcx + rdi + 0x48], zmm0
01143 448bde                         mov        r11d, esi
01146 62b17e486f841908000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 8]
01151 62f17e487f843988000000         vmovdqu32  zmmword ptr [rcx + rdi + 0x88], zmm0
0115c 4c63d6                         movsxd     r10, esi
0115f 62b17e486f841148000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0x48]
0116a 62f17e487f8439c8000000         vmovdqu32  zmmword ptr [rcx + rdi + 0xc8], zmm0
01175 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0117a 4181c200010000                 add        r10d, 0x100
01181 4403d0                         add        r10d, eax
01184 458bda                         mov        r11d, r10d
01187 62b17e486f841108000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 8]
01192 62f17e487f843908010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x108], zmm0
0119d 4d63d3                         movsxd     r10, r11d
011a0 62b17e486f841148000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 0x48]
011ab 62f17e487f843948010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x148], zmm0
011b6 62b17e486f840188010000         vmovdqu32  zmm0, zmmword ptr [rcx + r8 + 0x188]
011c1 62f17e487f843988010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x188], zmm0
011cc 62b17e486f8401c8010000         vmovdqu32  zmm0, zmmword ptr [rcx + r8 + 0x1c8]
011d7 62f17e487f8439c8010000         vmovdqu32  zmmword ptr [rcx + rdi + 0x1c8], zmm0
011e2 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
011e6 81c500020000                   add        ebp, 0x200
011ec 896c2468                       mov        dword ptr [rsp + 0x68], ebp
011f0 413be9                         cmp        ebp, r9d
011f3 0f8cf7feffff                   jl         0x7f53ebe71770
011f9 3beb                           cmp        ebp, ebx
011fb 0f8cb8fcffff                   jl         0x7f53ebe71539
01201 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
01209 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0120e 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
01216 7d2f                           jge        0x7f53ebe718c7
01218 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0121d 666690                         nop        
01220 468d1c10                       lea        r11d, [rax + r10]
01224 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0122c 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
01231 458bc2                         mov        r8d, r10d
01234 4e895c0308                     mov        qword ptr [rbx + r8 + 8], r11
01239 4183c208                       add        r10d, 8
0123d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01245 7cd9                           jl         0x7f53ebe718a0
01247 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0124e e9a3f4ffff                     jmp        0x7f53ebe70d76
01253 4585d2                         test       r10d, r10d
01256 0f8c30220000                   jl         0x7f53ebe73b0c
0125c 448d5bf1                       lea        r11d, [rbx - 0xf]
01260 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01265 453beb                         cmp        r13d, r11d
01268 0f83ff200000                   jae        0x7f53ebe739ed
0126e 4d63d5                         movsxd     r10, r13d
01271 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
01278 453bf3                         cmp        r14d, r11d
0127b 0f8377210000                   jae        0x7f53ebe73a78
01281 418d6e10                       lea        ebp, [r14 + 0x10]
01285 4d63de                         movsxd     r11, r14d
01288 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0128f 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01296 0f8d27020000                   jge        0x7f53ebe71b43
0129c 4d2bd3                         sub        r10, r11
0129f 4863cb                         movsxd     rcx, ebx
012a2 4883c1f1                       add        rcx, -0xf
012a6 4c63cd                         movsxd     r9, ebp
012a9 4f8d1c11                       lea        r11, [r9 + r10]
012ad 4c3bd9                         cmp        r11, rcx
012b0 0f8366220000                   jae        0x7f53ebe73b9c
012b6 4c8bda                         mov        r11, rdx
012b9 4d2bd9                         sub        r11, r9
012bc 4983c30f                       add        r11, 0xf
012c0 4983e3f0                       and        r11, 0xfffffffffffffff0
012c4 458bdb                         mov        r11d, r11d
012c7 478d4c3310                     lea        r9d, [r11 + r14 + 0x10]
012cc 4d63d9                         movsxd     r11, r9d
012cf 4f8d5413f0                     lea        r10, [r11 + r10 - 0x10]
012d4 4c3bd1                         cmp        r10, rcx
012d7 0f833f220000                   jae        0x7f53ebe73b9c
012dd 3b6c2478                       cmp        ebp, dword ptr [rsp + 0x78]
012e1 0f8335220000                   jae        0x7f53ebe73b9c
012e7 4983c3f0                       add        r11, -0x10
012eb 4c3bd9                         cmp        r11, rcx
012ee 0f8328220000                   jae        0x7f53ebe73b9c
012f4 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
012fc 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
01303 0f8f87220000                   jg         0x7f53ebe73c10
01309 452bee                         sub        r13d, r14d
0130c 4183c620                       add        r14d, 0x20
01310 448bd5                         mov        r10d, ebp
01313 458bc5                         mov        r8d, r13d
01316 4403c5                         add        r8d, ebp
01319 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
01321 c4a17a6f440308                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 8]
01328 c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
0132f 83c510                         add        ebp, 0x10
01332 413bee                         cmp        ebp, r14d
01335 7cd9                           jl         0x7f53ebe71990
01337 4881c210ffffff                 add        rdx, -0xf0
0133e 4881fa00000080                 cmp        rdx, -0x80000000
01345 49c7c200000080                 mov        r10, 0xffffffff80000000
0134c 490f4cd2                       cmovl      rdx, r10
01350 448bd2                         mov        r10d, edx
01353 413bea                         cmp        ebp, r10d
01356 0f8d31010000                   jge        0x7f53ebe71b0d
0135c 0f1f4000                       nop        dword ptr [rax]
01360 448bc5                         mov        r8d, ebp
01363 4963c8                         movsxd     rcx, r8d
01366 448bdd                         mov        r11d, ebp
01369 458bcd                         mov        r9d, r13d
0136c 4403cd                         add        r9d, ebp
0136f 458bc1                         mov        r8d, r9d
01372 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0137a c4a17a6f440b08                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 8]
01381 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
01388 4d63d8                         movsxd     r11, r8d
0138b c4a17a6f441b18                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x18]
01392 c5fa7f440b18                   vmovdqu    xmmword ptr [rbx + rcx + 0x18], xmm0
01398 c4a17a6f441b28                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x28]
0139f c5fa7f440b28                   vmovdqu    xmmword ptr [rbx + rcx + 0x28], xmm0
013a5 c4a17a6f441b38                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x38]
013ac c5fa7f440b38                   vmovdqu    xmmword ptr [rbx + rcx + 0x38], xmm0
013b2 c4a17a6f441b48                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x48]
013b9 c5fa7f440b48                   vmovdqu    xmmword ptr [rbx + rcx + 0x48], xmm0
013bf c4a17a6f441b58                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x58]
013c6 c5fa7f440b58                   vmovdqu    xmmword ptr [rbx + rcx + 0x58], xmm0
013cc c4a17a6f441b68                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x68]
013d3 c5fa7f440b68                   vmovdqu    xmmword ptr [rbx + rcx + 0x68], xmm0
013d9 c4a17a6f441b78                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x78]
013e0 c5fa7f440b78                   vmovdqu    xmmword ptr [rbx + rcx + 0x78], xmm0
013e6 c4a17a6f841b88000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x88]
013f0 c5fa7f840b88000000             vmovdqu    xmmword ptr [rbx + rcx + 0x88], xmm0
013f9 c4a17a6f841b98000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x98]
01403 c5fa7f840b98000000             vmovdqu    xmmword ptr [rbx + rcx + 0x98], xmm0
0140c c4a17a6f841ba8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xa8]
01416 c5fa7f840ba8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xa8], xmm0
0141f c4a17a6f841bb8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xb8]
01429 c5fa7f840bb8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xb8], xmm0
01432 c4a17a6f841bc8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc8]
0143c c5fa7f840bc8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xc8], xmm0
01445 c4a17a6f841bd8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xd8]
0144f c5fa7f840bd8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xd8], xmm0
01458 c4a17a6f841be8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xe8]
01462 c5fa7f840be8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xe8], xmm0
0146b c4a17a6f841bf8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xf8]
01475 c5fa7f840bf8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xf8], xmm0
0147e 81c500010000                   add        ebp, 0x100
01484 413bea                         cmp        ebp, r10d
01487 0f8cd3feffff                   jl         0x7f53ebe719e0
0148d 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01494 7d2d                           jge        0x7f53ebe71b43
01496 6690                           nop        
01498 458bd5                         mov        r10d, r13d
0149b 4403d5                         add        r10d, ebp
0149e 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
014a6 c4a17a6f441308                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 8]
014ad 448bdd                         mov        r11d, ebp
014b0 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
014b7 83c510                         add        ebp, 0x10
014ba 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
014c1 7cd5                           jl         0x7f53ebe71b18
014c3 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
014ca e927f2ffff                     jmp        0x7f53ebe70d76
014cf bee4ffffff                     mov        esi, 0xffffffe4
014d4 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014d9 48894424f8                     mov        qword ptr [rsp - 8], rax
014de 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014e2 89442408                       mov        dword ptr [rsp + 8], eax
014e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014eb 48ff742420                     push       qword ptr [rsp + 0x20]
014f0 488f442418                     pop        qword ptr [rsp + 0x18]
014f5 48894424f8                     mov        qword ptr [rsp - 8], rax
014fa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014fe 8944240c                       mov        dword ptr [rsp + 0xc], eax
01502 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01507 48894424f8                     mov        qword ptr [rsp - 8], rax
0150c 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01510 89442438                       mov        dword ptr [rsp + 0x38], eax
01514 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01519 48894424f8                     mov        qword ptr [rsp - 8], rax
0151e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01522 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01526 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0152b 90                             nop        
0152c c5f877                         vzeroupper 
0152f e8ac1ab5ff                     call       0x7f53eb9c3660
01534 0f1f84002c160003               nop        dword ptr [rax + rax + 0x300162c]
0153c bee4ffffff                     mov        esi, 0xffffffe4
01541 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01546 48894424f8                     mov        qword ptr [rsp - 8], rax
0154b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0154f 89442408                       mov        dword ptr [rsp + 8], eax
01553 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01558 48ff742420                     push       qword ptr [rsp + 0x20]
0155d 488f442418                     pop        qword ptr [rsp + 0x18]
01562 48894424f8                     mov        qword ptr [rsp - 8], rax
01567 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0156b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0156f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01574 48894424f8                     mov        qword ptr [rsp - 8], rax
01579 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0157d 89442438                       mov        dword ptr [rsp + 0x38], eax
01581 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01586 48894424f8                     mov        qword ptr [rsp - 8], rax
0158b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0158f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01598 48894424f8                     mov        qword ptr [rsp - 8], rax
0159d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
015a1 89442460                       mov        dword ptr [rsp + 0x60], eax
015a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015aa 4489742464                     mov        dword ptr [rsp + 0x64], r14d
015af 48894424f8                     mov        qword ptr [rsp - 8], rax
015b4 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
015b8 89442478                       mov        dword ptr [rsp + 0x78], eax
015bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
015c6 6690                           nop        
015c8 c5f877                         vzeroupper 
015cb e8101ab5ff                     call       0x7f53eb9c3660
015d0 0f1f8400c8160004               nop        dword ptr [rax + rax + 0x40016c8]
015d8 bee4ffffff                     mov        esi, 0xffffffe4
015dd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015e2 48894424f8                     mov        qword ptr [rsp - 8], rax
015e7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015eb 89442408                       mov        dword ptr [rsp + 8], eax
015ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f4 48ff742420                     push       qword ptr [rsp + 0x20]
015f9 488f442418                     pop        qword ptr [rsp + 0x18]
015fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01603 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01607 8944240c                       mov        dword ptr [rsp + 0xc], eax
0160b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01610 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01614 48894424f8                     mov        qword ptr [rsp - 8], rax
01619 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0161d 89442438                       mov        dword ptr [rsp + 0x38], eax
01621 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01626 48894424f8                     mov        qword ptr [rsp - 8], rax
0162b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0162f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01633 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01638 48894424f8                     mov        qword ptr [rsp - 8], rax
0163d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01641 89442460                       mov        dword ptr [rsp + 0x60], eax
01645 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0164f 48894424f8                     mov        qword ptr [rsp - 8], rax
01654 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0165b 89442468                       mov        dword ptr [rsp + 0x68], eax
0165f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01664 48894424f8                     mov        qword ptr [rsp - 8], rax
01669 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01670 89442478                       mov        dword ptr [rsp + 0x78], eax
01674 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01679 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0167e c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01687 90                             nop        
01688 c5f877                         vzeroupper 
0168b e85019b5ff                     call       0x7f53eb9c3660
01690 0f1f840088170005               nop        dword ptr [rax + rax + 0x5001788]
01698 beccffffff                     mov        esi, 0xffffffcc
0169d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016a2 48894424f8                     mov        qword ptr [rsp - 8], rax
016a7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016ab 89442408                       mov        dword ptr [rsp + 8], eax
016af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b4 48ff742420                     push       qword ptr [rsp + 0x20]
016b9 488f442418                     pop        qword ptr [rsp + 0x18]
016be 48894424f8                     mov        qword ptr [rsp - 8], rax
016c3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016c7 8944240c                       mov        dword ptr [rsp + 0xc], eax
016cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d0 48894424f8                     mov        qword ptr [rsp - 8], rax
016d5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
016d9 89442438                       mov        dword ptr [rsp + 0x38], eax
016dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e2 48894424f8                     mov        qword ptr [rsp - 8], rax
016e7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016eb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f4 48894424f8                     mov        qword ptr [rsp - 8], rax
016f9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
016fd 89442460                       mov        dword ptr [rsp + 0x60], eax
01701 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01706 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0170b 48894424f8                     mov        qword ptr [rsp - 8], rax
01710 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01714 89442478                       mov        dword ptr [rsp + 0x78], eax
01718 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01722 6690                           nop        
01724 c5f877                         vzeroupper 
01727 e8b418b5ff                     call       0x7f53eb9c3660
0172c 0f1f840024180006               nop        dword ptr [rax + rax + 0x6001824]
01734 beccffffff                     mov        esi, 0xffffffcc
01739 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0173e 48894424f8                     mov        qword ptr [rsp - 8], rax
01743 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01747 89442408                       mov        dword ptr [rsp + 8], eax
0174b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01750 48ff742420                     push       qword ptr [rsp + 0x20]
01755 488f442418                     pop        qword ptr [rsp + 0x18]
0175a 48894424f8                     mov        qword ptr [rsp - 8], rax
0175f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01763 8944240c                       mov        dword ptr [rsp + 0xc], eax
01767 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176c 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01770 48894424f8                     mov        qword ptr [rsp - 8], rax
01775 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01779 89442438                       mov        dword ptr [rsp + 0x38], eax
0177d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01782 48894424f8                     mov        qword ptr [rsp - 8], rax
01787 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0178b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0178f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01794 48894424f8                     mov        qword ptr [rsp - 8], rax
01799 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0179d 89442460                       mov        dword ptr [rsp + 0x60], eax
017a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a6 4489742464                     mov        dword ptr [rsp + 0x64], r14d
017ab 48894424f8                     mov        qword ptr [rsp - 8], rax
017b0 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
017b7 89442468                       mov        dword ptr [rsp + 0x68], eax
017bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c0 48894424f8                     mov        qword ptr [rsp - 8], rax
017c5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
017cc 89442478                       mov        dword ptr [rsp + 0x78], eax
017d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
017da c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017e3 90                             nop        
017e4 c5f877                         vzeroupper 
017e7 e8f417b5ff                     call       0x7f53eb9c3660
017ec 0f1f8400e4180007               nop        dword ptr [rax + rax + 0x70018e4]
017f4 bee4ffffff                     mov        esi, 0xffffffe4
017f9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01803 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01807 89442408                       mov        dword ptr [rsp + 8], eax
0180b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01810 48ff742420                     push       qword ptr [rsp + 0x20]
01815 488f442418                     pop        qword ptr [rsp + 0x18]
0181a 48894424f8                     mov        qword ptr [rsp - 8], rax
0181f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01823 8944240c                       mov        dword ptr [rsp + 0xc], eax
01827 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182c 48894424f8                     mov        qword ptr [rsp - 8], rax
01831 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01835 89442434                       mov        dword ptr [rsp + 0x34], eax
01839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183e 48894424f8                     mov        qword ptr [rsp - 8], rax
01843 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01847 89442438                       mov        dword ptr [rsp + 0x38], eax
0184b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01850 48894424f8                     mov        qword ptr [rsp - 8], rax
01855 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01859 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0185d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01862 48894424f8                     mov        qword ptr [rsp - 8], rax
01867 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0186b 89442460                       mov        dword ptr [rsp + 0x60], eax
0186f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01874 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01879 666690                         nop        
0187c c5f877                         vzeroupper 
0187f e85c17b5ff                     call       0x7f53eb9c3660
01884 0f1f84007c190008               nop        dword ptr [rax + rax + 0x800197c]
0188c bee4ffffff                     mov        esi, 0xffffffe4
01891 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01896 48894424f8                     mov        qword ptr [rsp - 8], rax
0189b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0189f 89442408                       mov        dword ptr [rsp + 8], eax
018a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a8 48ff742420                     push       qword ptr [rsp + 0x20]
018ad 488f442418                     pop        qword ptr [rsp + 0x18]
018b2 48894424f8                     mov        qword ptr [rsp - 8], rax
018b7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018bb 8944240c                       mov        dword ptr [rsp + 0xc], eax
018bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c4 4489742430                     mov        dword ptr [rsp + 0x30], r14d
018c9 48894424f8                     mov        qword ptr [rsp - 8], rax
018ce 8b442440                       mov        eax, dword ptr [rsp + 0x40]
018d2 89442438                       mov        dword ptr [rsp + 0x38], eax
018d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018db 48894424f8                     mov        qword ptr [rsp - 8], rax
018e0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018e4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ed 48894424f8                     mov        qword ptr [rsp - 8], rax
018f2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018f6 89442460                       mov        dword ptr [rsp + 0x60], eax
018fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ff 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01904 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01908 c5f877                         vzeroupper 
0190b e8d016b5ff                     call       0x7f53eb9c3660
01910 0f1f8400081a0009               nop        dword ptr [rax + rax + 0x9001a08]
01918 bee4ffffff                     mov        esi, 0xffffffe4
0191d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01922 48894424f8                     mov        qword ptr [rsp - 8], rax
01927 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0192b 89442408                       mov        dword ptr [rsp + 8], eax
0192f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01934 48ff742420                     push       qword ptr [rsp + 0x20]
01939 488f442418                     pop        qword ptr [rsp + 0x18]
0193e 48894424f8                     mov        qword ptr [rsp - 8], rax
01943 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01947 8944240c                       mov        dword ptr [rsp + 0xc], eax
0194b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01950 48894424f8                     mov        qword ptr [rsp - 8], rax
01955 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01959 89442438                       mov        dword ptr [rsp + 0x38], eax
0195d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01962 48894424f8                     mov        qword ptr [rsp - 8], rax
01967 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0196b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0196f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01974 48894424f8                     mov        qword ptr [rsp - 8], rax
01979 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0197d 89442460                       mov        dword ptr [rsp + 0x60], eax
01981 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01986 48894424f8                     mov        qword ptr [rsp - 8], rax
0198b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01992 89442464                       mov        dword ptr [rsp + 0x64], eax
01996 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199b 4489742470                     mov        dword ptr [rsp + 0x70], r14d
019a0 895c2474                       mov        dword ptr [rsp + 0x74], ebx
019a4 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
019ad 666690                         nop        
019b0 c5f877                         vzeroupper 
019b3 e82816b5ff                     call       0x7f53eb9c3660
019b8 0f1f8400b01a000a               nop        dword ptr [rax + rax + 0xa001ab0]
019c0 beccffffff                     mov        esi, 0xffffffcc
019c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019ca 48894424f8                     mov        qword ptr [rsp - 8], rax
019cf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019d3 89442408                       mov        dword ptr [rsp + 8], eax
019d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dc 48ff742420                     push       qword ptr [rsp + 0x20]
019e1 488f442418                     pop        qword ptr [rsp + 0x18]
019e6 48894424f8                     mov        qword ptr [rsp - 8], rax
019eb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019ef 8944240c                       mov        dword ptr [rsp + 0xc], eax
019f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f8 4489742430                     mov        dword ptr [rsp + 0x30], r14d
019fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01a02 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a06 89442438                       mov        dword ptr [rsp + 0x38], eax
01a0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a0f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a14 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01a18 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a21 48894424f8                     mov        qword ptr [rsp - 8], rax
01a26 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a2a 89442460                       mov        dword ptr [rsp + 0x60], eax
01a2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a33 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01a38 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01a3d 666690                         nop        
01a40 c5f877                         vzeroupper 
01a43 e89815b5ff                     call       0x7f53eb9c3660
01a48 0f1f8400401b000b               nop        dword ptr [rax + rax + 0xb001b40]
01a50 be45ffffff                     mov        esi, 0xffffff45
01a55 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a5a 4c89542408                     mov        qword ptr [rsp + 8], r10
01a5f 90                             nop        
01a60 c5f877                         vzeroupper 
01a63 e87815b5ff                     call       0x7f53eb9c3660
01a68 0f1f8400601b000c               nop        dword ptr [rax + rax + 0xc001b60]
01a70 be45ffffff                     mov        esi, 0xffffff45
01a75 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a83 89442408                       mov        dword ptr [rsp + 8], eax
01a87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8c 48ff742420                     push       qword ptr [rsp + 0x20]
01a91 488f442418                     pop        qword ptr [rsp + 0x18]
01a96 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a9f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01aa3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa8 48894424f8                     mov        qword ptr [rsp - 8], rax
01aad 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ab1 89442438                       mov        dword ptr [rsp + 0x38], eax
01ab5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aba 48894424f8                     mov        qword ptr [rsp - 8], rax
01abf 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ac3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ac7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01acc 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01ad1 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01ad6 6690                           nop        
01ad8 c5f877                         vzeroupper 
01adb e80015b5ff                     call       0x7f53eb9c3660
01ae0 0f1f8400d81b000d               nop        dword ptr [rax + rax + 0xd001bd8]
01ae8 4d3bda                         cmp        r11, r10
01aeb bdffffffff                     mov        ebp, 0xffffffff
01af0 7c08                           jl         0x7f53ebe7217a
01af2 400f95c5                       setne      bpl
01af6 400fb6ed                       movzx      ebp, bpl
01afa be45ffffff                     mov        esi, 0xffffff45
01aff 48ff742408                     push       qword ptr [rsp + 8]
01b04 488f0424                       pop        qword ptr [rsp]
01b08 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b11 89442414                       mov        dword ptr [rsp + 0x14], eax
01b15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01b23 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b31 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b35 89442444                       mov        dword ptr [rsp + 0x44], eax
01b39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b43 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b47 89442468                       mov        dword ptr [rsp + 0x68], eax
01b4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b50 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01b55 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01b5a 6690                           nop        
01b5c c5f877                         vzeroupper 
01b5f e87c14b5ff                     call       0x7f53eb9c3660
01b64 0f1f84005c1c000e               nop        dword ptr [rax + rax + 0xe001c5c]
01b6c be45ffffff                     mov        esi, 0xffffff45
01b71 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b76 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b7f 89442408                       mov        dword ptr [rsp + 8], eax
01b83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b88 48ff742420                     push       qword ptr [rsp + 0x20]
01b8d 488f442418                     pop        qword ptr [rsp + 0x18]
01b92 48894424f8                     mov        qword ptr [rsp - 8], rax
01b97 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b9b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01bad 89442438                       mov        dword ptr [rsp + 0x38], eax
01bb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb6 48894424f8                     mov        qword ptr [rsp - 8], rax
01bbb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01bbf 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01bc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bcd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01bd1 89442460                       mov        dword ptr [rsp + 0x60], eax
01bd5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bda 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01bdf 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01be4 c5f877                         vzeroupper 
01be7 e8f413b5ff                     call       0x7f53eb9c3660
01bec 0f1f8400e41c000f               nop        dword ptr [rax + rax + 0xf001ce4]
01bf4 be45ffffff                     mov        esi, 0xffffff45
01bf9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01bfe 48894424f8                     mov        qword ptr [rsp - 8], rax
01c03 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c07 89442408                       mov        dword ptr [rsp + 8], eax
01c0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c10 48ff742420                     push       qword ptr [rsp + 0x20]
01c15 488f442418                     pop        qword ptr [rsp + 0x18]
01c1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c23 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c31 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01c35 89442438                       mov        dword ptr [rsp + 0x38], eax
01c39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c43 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c47 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c50 48894424f8                     mov        qword ptr [rsp - 8], rax
01c55 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c59 89442460                       mov        dword ptr [rsp + 0x60], eax
01c5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c62 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01c67 90                             nop        
01c68 c5f877                         vzeroupper 
01c6b e87013b5ff                     call       0x7f53eb9c3660
01c70 0f1f8400681d0010               nop        dword ptr [rax + rax + 0x10001d68]
01c78 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
01c80 4d3bd8                         cmp        r11, r8
01c83 bdffffffff                     mov        ebp, 0xffffffff
01c88 7c08                           jl         0x7f53ebe72312
01c8a 400f95c5                       setne      bpl
01c8e 400fb6ed                       movzx      ebp, bpl
01c92 be45ffffff                     mov        esi, 0xffffff45
01c97 48ff742408                     push       qword ptr [rsp + 8]
01c9c 488f0424                       pop        qword ptr [rsp]
01ca0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ca9 89442414                       mov        dword ptr [rsp + 0x14], eax
01cad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb7 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01cbb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ccd 89442464                       mov        dword ptr [rsp + 0x64], eax
01cd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd6 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01cdb 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01ce0 c5f877                         vzeroupper 
01ce3 e8f812b5ff                     call       0x7f53eb9c3660
01ce8 0f1f8400e01d0011               nop        dword ptr [rax + rax + 0x11001de0]
01cf0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
01cf8 4d3bd8                         cmp        r11, r8
01cfb bdffffffff                     mov        ebp, 0xffffffff
01d00 7c08                           jl         0x7f53ebe7238a
01d02 400f95c5                       setne      bpl
01d06 400fb6ed                       movzx      ebp, bpl
01d0a be45ffffff                     mov        esi, 0xffffff45
01d0f 48ff742408                     push       qword ptr [rsp + 8]
01d14 488f0424                       pop        qword ptr [rsp]
01d18 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d21 89442414                       mov        dword ptr [rsp + 0x14], eax
01d25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01d33 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d41 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d45 89442464                       mov        dword ptr [rsp + 0x64], eax
01d49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4e 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01d53 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01d58 c5f877                         vzeroupper 
01d5b e88012b5ff                     call       0x7f53eb9c3660
01d60 0f1f8400581e0012               nop        dword ptr [rax + rax + 0x12001e58]
01d68 bee4ffffff                     mov        esi, 0xffffffe4
01d6d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d72 48894424f8                     mov        qword ptr [rsp - 8], rax
01d77 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d7b 89442408                       mov        dword ptr [rsp + 8], eax
01d7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d84 48ff742420                     push       qword ptr [rsp + 0x20]
01d89 488f442418                     pop        qword ptr [rsp + 0x18]
01d8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d93 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d97 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da0 48894424f8                     mov        qword ptr [rsp - 8], rax
01da5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01da9 89442438                       mov        dword ptr [rsp + 0x38], eax
01dad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db2 48894424f8                     mov        qword ptr [rsp - 8], rax
01db7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01dbb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01dcd 89442460                       mov        dword ptr [rsp + 0x60], eax
01dd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd6 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01ddb 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01de0 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01de5 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01ded 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01df5 666690                         nop        
01df8 c5f877                         vzeroupper 
01dfb e8e011b5ff                     call       0x7f53eb9c3660
01e00 0f1f8400f81e0013               nop        dword ptr [rax + rax + 0x13001ef8]
01e08 bee4ffffff                     mov        esi, 0xffffffe4
01e0d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e12 48894424f8                     mov        qword ptr [rsp - 8], rax
01e17 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e1b 89442408                       mov        dword ptr [rsp + 8], eax
01e1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e24 48ff742420                     push       qword ptr [rsp + 0x20]
01e29 488f442418                     pop        qword ptr [rsp + 0x18]
01e2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e33 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e37 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e40 48894424f8                     mov        qword ptr [rsp - 8], rax
01e45 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e49 89442438                       mov        dword ptr [rsp + 0x38], eax
01e4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e52 48894424f8                     mov        qword ptr [rsp - 8], rax
01e57 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e5b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e64 48894424f8                     mov        qword ptr [rsp - 8], rax
01e69 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e6d 89442460                       mov        dword ptr [rsp + 0x60], eax
01e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e76 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01e7b 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01e80 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01e85 48894c2478                     mov        qword ptr [rsp + 0x78], rcx
01e8a 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01e8f 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01e97 90                             nop        
01e98 c5f877                         vzeroupper 
01e9b e84011b5ff                     call       0x7f53eb9c3660
01ea0 0f1f8400981f0014               nop        dword ptr [rax + rax + 0x14001f98]
01ea8 beccffffff                     mov        esi, 0xffffffcc
01ead 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01eb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01ebb 89442408                       mov        dword ptr [rsp + 8], eax
01ebf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec4 48ff742420                     push       qword ptr [rsp + 0x20]
01ec9 488f442418                     pop        qword ptr [rsp + 0x18]
01ece 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ed7 8944240c                       mov        dword ptr [rsp + 0xc], eax
01edb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ee9 89442438                       mov        dword ptr [rsp + 0x38], eax
01eed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01efb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01eff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f04 48894424f8                     mov        qword ptr [rsp - 8], rax
01f09 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f0d 89442460                       mov        dword ptr [rsp + 0x60], eax
01f11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f16 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01f1b 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01f20 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f25 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01f2d 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
01f35 666690                         nop        
01f38 c5f877                         vzeroupper 
01f3b e8a010b5ff                     call       0x7f53eb9c3660
01f40 0f1f840038200015               nop        dword ptr [rax + rax + 0x15002038]
01f48 4183c508                       add        r13d, 8
01f4c be6effffff                     mov        esi, 0xffffff6e
01f51 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f56 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01f5f 89442408                       mov        dword ptr [rsp + 8], eax
01f63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f68 48ff742420                     push       qword ptr [rsp + 0x20]
01f6d 488f442418                     pop        qword ptr [rsp + 0x18]
01f72 48894424f8                     mov        qword ptr [rsp - 8], rax
01f77 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f7b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f84 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01f89 48894424f8                     mov        qword ptr [rsp - 8], rax
01f8e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f92 89442438                       mov        dword ptr [rsp + 0x38], eax
01f96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9b 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01fa4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fa8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fad 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01fb6 89442460                       mov        dword ptr [rsp + 0x60], eax
01fba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbf 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc4 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fcb 89442468                       mov        dword ptr [rsp + 0x68], eax
01fcf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd4 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01fd9 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01fde 6690                           nop        
01fe0 c5f877                         vzeroupper 
01fe3 e8f80fb5ff                     call       0x7f53eb9c3660
01fe8 0f1f8400e0200016               nop        dword ptr [rax + rax + 0x160020e0]
01ff0 4183c508                       add        r13d, 8
01ff4 be66ffffff                     mov        esi, 0xffffff66
01ff9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01ffe 48894424f8                     mov        qword ptr [rsp - 8], rax
02003 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02007 89442408                       mov        dword ptr [rsp + 8], eax
0200b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02010 48ff742420                     push       qword ptr [rsp + 0x20]
02015 488f442418                     pop        qword ptr [rsp + 0x18]
0201a 48894424f8                     mov        qword ptr [rsp - 8], rax
0201f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02023 8944240c                       mov        dword ptr [rsp + 0xc], eax
02027 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
02031 48894424f8                     mov        qword ptr [rsp - 8], rax
02036 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0203a 89442438                       mov        dword ptr [rsp + 0x38], eax
0203e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02043 48894424f8                     mov        qword ptr [rsp - 8], rax
02048 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0204c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02050 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02055 48894424f8                     mov        qword ptr [rsp - 8], rax
0205a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0205e 89442460                       mov        dword ptr [rsp + 0x60], eax
02062 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02067 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
0206c 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
02071 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02075 666690                         nop        
02078 c5f877                         vzeroupper 
0207b e8600fb5ff                     call       0x7f53eb9c3660
02080 0f1f840078210017               nop        dword ptr [rax + rax + 0x17002178]
02088 4533d2                         xor        r10d, r10d
0208b 4c89542408                     mov        qword ptr [rsp + 8], r10
02090 e9ade0ffff                     jmp        0x7f53ebe707c2
02095 4533d2                         xor        r10d, r10d
02098 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
020a0 e9cce0ffff                     jmp        0x7f53ebe707f1
020a5 4533d2                         xor        r10d, r10d
020a8 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
020b0 e9e9e0ffff                     jmp        0x7f53ebe7081e
020b5 4533d2                         xor        r10d, r10d
020b8 4c89542420                     mov        qword ptr [rsp + 0x20], r10
020bd e908e1ffff                     jmp        0x7f53ebe7084a
020c2 4533d2                         xor        r10d, r10d
020c5 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
020cd e921e1ffff                     jmp        0x7f53ebe70873
020d2 4533d2                         xor        r10d, r10d
020d5 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
020dd e937e1ffff                     jmp        0x7f53ebe70899
020e2 beccffffff                     mov        esi, 0xffffffcc
020e7 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020ec 48894424f8                     mov        qword ptr [rsp - 8], rax
020f1 8b442410                       mov        eax, dword ptr [rsp + 0x10]
020f5 89442408                       mov        dword ptr [rsp + 8], eax
020f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fe 48ff742420                     push       qword ptr [rsp + 0x20]
02103 488f442418                     pop        qword ptr [rsp + 0x18]
02108 48894424f8                     mov        qword ptr [rsp - 8], rax
0210d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02111 8944240c                       mov        dword ptr [rsp + 0xc], eax
02115 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211a 48894424f8                     mov        qword ptr [rsp - 8], rax
0211f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02123 89442438                       mov        dword ptr [rsp + 0x38], eax
02127 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212c 48894424f8                     mov        qword ptr [rsp - 8], rax
02131 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02135 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02139 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213e 48894424f8                     mov        qword ptr [rsp - 8], rax
02143 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02147 89442460                       mov        dword ptr [rsp + 0x60], eax
0214b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02150 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02155 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0215a 6690                           nop        
0215c c5f877                         vzeroupper 
0215f e87c0eb5ff                     call       0x7f53eb9c3660
02164 0f1f84005c220018               nop        dword ptr [rax + rax + 0x1800225c]
0216c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02171 448bd8                         mov        r11d, eax
02174 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
02179 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0217e 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
02183 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02188 4183c308                       add        r11d, 8
0218c 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02191 443bdf                         cmp        r11d, edi
02194 7cd6                           jl         0x7f53ebe727ec
02196 443bdb                         cmp        r11d, ebx
02199 0f8d55140000                   jge        0x7f53ebe73c74
0219f 458bd3                         mov        r10d, r11d
021a2 4489542468                     mov        dword ptr [rsp + 0x68], r10d
021a7 498bc8                         mov        rcx, r8
021aa 660f1f440000                   nop        word ptr [rax + rax]
021b0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
021b5 4d63c3                         movsxd     r8, r11d
021b8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
021bd 448bd8                         mov        r11d, eax
021c0 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
021c5 458bcb                         mov        r9d, r11d
021c8 4e8b5c1908                     mov        r11, qword ptr [rcx + r11 + 8]
021cd 4e895c1108                     mov        qword ptr [rcx + r10 + 8], r11
021d2 4d63d9                         movsxd     r11, r9d
021d5 4e8b541910                     mov        r10, qword ptr [rcx + r11 + 0x10]
021da 4e89540110                     mov        qword ptr [rcx + r8 + 0x10], r10
021df 4e8b541918                     mov        r10, qword ptr [rcx + r11 + 0x18]
021e4 4e89540118                     mov        qword ptr [rcx + r8 + 0x18], r10
021e9 4e8b541920                     mov        r10, qword ptr [rcx + r11 + 0x20]
021ee 4e89540120                     mov        qword ptr [rcx + r8 + 0x20], r10
021f3 4e8b541928                     mov        r10, qword ptr [rcx + r11 + 0x28]
021f8 4e89540128                     mov        qword ptr [rcx + r8 + 0x28], r10
021fd 4e8b541930                     mov        r10, qword ptr [rcx + r11 + 0x30]
02202 4e89540130                     mov        qword ptr [rcx + r8 + 0x30], r10
02207 4e8b541938                     mov        r10, qword ptr [rcx + r11 + 0x38]
0220c 4e89540138                     mov        qword ptr [rcx + r8 + 0x38], r10
02211 4e8b541940                     mov        r10, qword ptr [rcx + r11 + 0x40]
02216 4e89540140                     mov        qword ptr [rcx + r8 + 0x40], r10
0221b 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02220 4183c340                       add        r11d, 0x40
02224 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02229 443bdb                         cmp        r11d, ebx
0222c 0f8c7effffff                   jl         0x7f53ebe72830
02232 48898c24e0000000               mov        qword ptr [rsp + 0xe0], rcx
0223a 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0223f 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
02247 0f8dfaefffff                   jge        0x7f53ebe718c7
0224d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02252 6690                           nop        
02254 468d1418                       lea        r10d, [rax + r11]
02258 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
02260 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
02265 458bc3                         mov        r8d, r11d
02268 4f89540108                     mov        qword ptr [r9 + r8 + 8], r10
0226d 4183c308                       add        r11d, 8
02271 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
02279 7cd9                           jl         0x7f53ebe728d4
0227b e9c7efffff                     jmp        0x7f53ebe718c7
02280 bee4ffffff                     mov        esi, 0xffffffe4
02285 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0228a 48894424f8                     mov        qword ptr [rsp - 8], rax
0228f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02293 89442408                       mov        dword ptr [rsp + 8], eax
02297 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0229c 48ff742420                     push       qword ptr [rsp + 0x20]
022a1 488f442418                     pop        qword ptr [rsp + 0x18]
022a6 48894424f8                     mov        qword ptr [rsp - 8], rax
022ab 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022af 8944240c                       mov        dword ptr [rsp + 0xc], eax
022b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b8 48894424f8                     mov        qword ptr [rsp - 8], rax
022bd 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
022c1 89442434                       mov        dword ptr [rsp + 0x34], eax
022c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ca 48894424f8                     mov        qword ptr [rsp - 8], rax
022cf 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022d3 89442438                       mov        dword ptr [rsp + 0x38], eax
022d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022dc 48894424f8                     mov        qword ptr [rsp - 8], rax
022e1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
022e5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ee 48894424f8                     mov        qword ptr [rsp - 8], rax
022f3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
022f7 89442460                       mov        dword ptr [rsp + 0x60], eax
022fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02300 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02305 48894424f8                     mov        qword ptr [rsp - 8], rax
0230a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02311 89442468                       mov        dword ptr [rsp + 0x68], eax
02315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231a 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
02322 6690                           nop        
02324 c5f877                         vzeroupper 
02327 e8b40cb5ff                     call       0x7f53eb9c3660
0232c 0f1f840024240019               nop        dword ptr [rax + rax + 0x19002424]
02334 bee4ffffff                     mov        esi, 0xffffffe4
02339 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0233e 48894424f8                     mov        qword ptr [rsp - 8], rax
02343 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02347 89442408                       mov        dword ptr [rsp + 8], eax
0234b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02350 48ff742420                     push       qword ptr [rsp + 0x20]
02355 488f442418                     pop        qword ptr [rsp + 0x18]
0235a 48894424f8                     mov        qword ptr [rsp - 8], rax
0235f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02363 8944240c                       mov        dword ptr [rsp + 0xc], eax
02367 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236c 48894424f8                     mov        qword ptr [rsp - 8], rax
02371 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02375 89442438                       mov        dword ptr [rsp + 0x38], eax
02379 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0237e 48894424f8                     mov        qword ptr [rsp - 8], rax
02383 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02387 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0238b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02390 48894424f8                     mov        qword ptr [rsp - 8], rax
02395 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02399 89442460                       mov        dword ptr [rsp + 0x60], eax
0239d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a2 4489742464                     mov        dword ptr [rsp + 0x64], r14d
023a7 895c2478                       mov        dword ptr [rsp + 0x78], ebx
023ab 90                             nop        
023ac c5f877                         vzeroupper 
023af e82c0cb5ff                     call       0x7f53eb9c3660
023b4 0f1f8400ac24001a               nop        dword ptr [rax + rax + 0x1a0024ac]
023bc bee4ffffff                     mov        esi, 0xffffffe4
023c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
023c6 48894424f8                     mov        qword ptr [rsp - 8], rax
023cb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
023cf 89442408                       mov        dword ptr [rsp + 8], eax
023d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d8 48ff742420                     push       qword ptr [rsp + 0x20]
023dd 488f442418                     pop        qword ptr [rsp + 0x18]
023e2 48894424f8                     mov        qword ptr [rsp - 8], rax
023e7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023eb 8944240c                       mov        dword ptr [rsp + 0xc], eax
023ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f4 48894424f8                     mov        qword ptr [rsp - 8], rax
023f9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023fd 89442438                       mov        dword ptr [rsp + 0x38], eax
02401 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02406 48894424f8                     mov        qword ptr [rsp - 8], rax
0240b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0240f 89442460                       mov        dword ptr [rsp + 0x60], eax
02413 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02418 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0241d 666690                         nop        
02420 c5f877                         vzeroupper 
02423 e8b80bb5ff                     call       0x7f53eb9c3660
02428 0f1f84002025001b               nop        dword ptr [rax + rax + 0x1b002520]
02430 bee4ffffff                     mov        esi, 0xffffffe4
02435 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0243a 48894424f8                     mov        qword ptr [rsp - 8], rax
0243f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02443 89442408                       mov        dword ptr [rsp + 8], eax
02447 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0244c 48ff742420                     push       qword ptr [rsp + 0x20]
02451 488f442418                     pop        qword ptr [rsp + 0x18]
02456 48894424f8                     mov        qword ptr [rsp - 8], rax
0245b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0245f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02463 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02468 48894424f8                     mov        qword ptr [rsp - 8], rax
0246d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02471 89442434                       mov        dword ptr [rsp + 0x34], eax
02475 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0247a 48894424f8                     mov        qword ptr [rsp - 8], rax
0247f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02483 89442440                       mov        dword ptr [rsp + 0x40], eax
02487 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248c 48894424f8                     mov        qword ptr [rsp - 8], rax
02491 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02495 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02499 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249e 4489542474                     mov        dword ptr [rsp + 0x74], r10d
024a3 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
024ab 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
024b3 90                             nop        
024b4 c5f877                         vzeroupper 
024b7 e8240bb5ff                     call       0x7f53eb9c3660
024bc 0f1f8400b425001c               nop        dword ptr [rax + rax + 0x1c0025b4]
024c4 bee4ffffff                     mov        esi, 0xffffffe4
024c9 48ff742408                     push       qword ptr [rsp + 8]
024ce 488f0424                       pop        qword ptr [rsp]
024d2 48894424f8                     mov        qword ptr [rsp - 8], rax
024d7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
024db 89442414                       mov        dword ptr [rsp + 0x14], eax
024df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e4 48894424f8                     mov        qword ptr [rsp - 8], rax
024e9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
024ed 8944243c                       mov        dword ptr [rsp + 0x3c], eax
024f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f6 48894424f8                     mov        qword ptr [rsp - 8], rax
024fb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024ff 89442464                       mov        dword ptr [rsp + 0x64], eax
02503 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02508 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0250d 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
02512 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
0251a 6690                           nop        
0251c c5f877                         vzeroupper 
0251f e8bc0ab5ff                     call       0x7f53eb9c3660
02524 0f1f84001c26001d               nop        dword ptr [rax + rax + 0x1d00261c]
0252c 418d6d01                       lea        ebp, [r13 + 1]
02530 bee4ffffff                     mov        esi, 0xffffffe4
02535 48ff742408                     push       qword ptr [rsp + 8]
0253a 488f0424                       pop        qword ptr [rsp]
0253e 48894424f8                     mov        qword ptr [rsp - 8], rax
02543 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02547 89442414                       mov        dword ptr [rsp + 0x14], eax
0254b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02550 48894424f8                     mov        qword ptr [rsp - 8], rax
02555 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02559 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0255d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02562 48894424f8                     mov        qword ptr [rsp - 8], rax
02567 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0256b 89442464                       mov        dword ptr [rsp + 0x64], eax
0256f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02574 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02579 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0257e 48894424f8                     mov        qword ptr [rsp - 8], rax
02583 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0258a 8944247c                       mov        dword ptr [rsp + 0x7c], eax
0258e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02593 90                             nop        
02594 c5f877                         vzeroupper 
02597 e8440ab5ff                     call       0x7f53eb9c3660
0259c 0f1f84009426001e               nop        dword ptr [rax + rax + 0x1e002694]
025a4 bee4ffffff                     mov        esi, 0xffffffe4
025a9 48ff742408                     push       qword ptr [rsp + 8]
025ae 488f0424                       pop        qword ptr [rsp]
025b2 48894424f8                     mov        qword ptr [rsp - 8], rax
025b7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025bb 89442414                       mov        dword ptr [rsp + 0x14], eax
025bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c4 48894424f8                     mov        qword ptr [rsp - 8], rax
025c9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
025cd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d6 48894424f8                     mov        qword ptr [rsp - 8], rax
025db 8b442470                       mov        eax, dword ptr [rsp + 0x70]
025df 89442464                       mov        dword ptr [rsp + 0x64], eax
025e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e8 4489742470                     mov        dword ptr [rsp + 0x70], r14d
025ed 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
025f2 48894424f8                     mov        qword ptr [rsp - 8], rax
025f7 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
025fe 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02602 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02607 90                             nop        
02608 c5f877                         vzeroupper 
0260b e8d009b5ff                     call       0x7f53eb9c3660
02610 0f1f84000827001f               nop        dword ptr [rax + rax + 0x1f002708]
02618 bee4ffffff                     mov        esi, 0xffffffe4
0261d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02622 48894424f8                     mov        qword ptr [rsp - 8], rax
02627 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0262b 89442408                       mov        dword ptr [rsp + 8], eax
0262f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02634 48ff742420                     push       qword ptr [rsp + 0x20]
02639 488f442418                     pop        qword ptr [rsp + 0x18]
0263e 48894424f8                     mov        qword ptr [rsp - 8], rax
02643 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02647 8944240c                       mov        dword ptr [rsp + 0xc], eax
0264b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02650 48894424f8                     mov        qword ptr [rsp - 8], rax
02655 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02659 89442434                       mov        dword ptr [rsp + 0x34], eax
0265d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02662 48894424f8                     mov        qword ptr [rsp - 8], rax
02667 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0266b 89442440                       mov        dword ptr [rsp + 0x40], eax
0266f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02674 48894424f8                     mov        qword ptr [rsp - 8], rax
02679 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0267d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02681 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02686 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0268b 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02690 c5f877                         vzeroupper 
02693 e84809b5ff                     call       0x7f53eb9c3660
02698 0f1f840090270020               nop        dword ptr [rax + rax + 0x20002790]
026a0 bee4ffffff                     mov        esi, 0xffffffe4
026a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
026aa 48894424f8                     mov        qword ptr [rsp - 8], rax
026af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
026b3 89442408                       mov        dword ptr [rsp + 8], eax
026b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026bc 48ff742420                     push       qword ptr [rsp + 0x20]
026c1 488f442418                     pop        qword ptr [rsp + 0x18]
026c6 48894424f8                     mov        qword ptr [rsp - 8], rax
026cb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026cf 8944240c                       mov        dword ptr [rsp + 0xc], eax
026d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d8 48894424f8                     mov        qword ptr [rsp - 8], rax
026dd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
026e1 89442434                       mov        dword ptr [rsp + 0x34], eax
026e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ea 48894424f8                     mov        qword ptr [rsp - 8], rax
026ef 8b442448                       mov        eax, dword ptr [rsp + 0x48]
026f3 89442440                       mov        dword ptr [rsp + 0x40], eax
026f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02701 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02705 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02709 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270e 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02713 48894424f8                     mov        qword ptr [rsp - 8], rax
02718 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0271f 89442470                       mov        dword ptr [rsp + 0x70], eax
02723 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02728 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02730 c5f877                         vzeroupper 
02733 e8a808b5ff                     call       0x7f53eb9c3660
02738 0f1f840030280021               nop        dword ptr [rax + rax + 0x21002830]
02740 bee4ffffff                     mov        esi, 0xffffffe4
02745 48ff742408                     push       qword ptr [rsp + 8]
0274a 488f0424                       pop        qword ptr [rsp]
0274e 48894424f8                     mov        qword ptr [rsp - 8], rax
02753 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02757 89442414                       mov        dword ptr [rsp + 0x14], eax
0275b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02760 48894424f8                     mov        qword ptr [rsp - 8], rax
02765 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02769 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0276d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02772 48894424f8                     mov        qword ptr [rsp - 8], rax
02777 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0277b 89442464                       mov        dword ptr [rsp + 0x64], eax
0277f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02784 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02789 48894424f8                     mov        qword ptr [rsp - 8], rax
0278e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02795 89442478                       mov        dword ptr [rsp + 0x78], eax
02799 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279e 6690                           nop        
027a0 c5f877                         vzeroupper 
027a3 e83808b5ff                     call       0x7f53eb9c3660
027a8 0f1f8400a0280022               nop        dword ptr [rax + rax + 0x220028a0]
027b0 beccffffff                     mov        esi, 0xffffffcc
027b5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027ba 48894424f8                     mov        qword ptr [rsp - 8], rax
027bf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027c3 89442408                       mov        dword ptr [rsp + 8], eax
027c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027cc 48ff742420                     push       qword ptr [rsp + 0x20]
027d1 488f442418                     pop        qword ptr [rsp + 0x18]
027d6 48894424f8                     mov        qword ptr [rsp - 8], rax
027db 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027df 8944240c                       mov        dword ptr [rsp + 0xc], eax
027e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e8 48894424f8                     mov        qword ptr [rsp - 8], rax
027ed 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027f1 89442434                       mov        dword ptr [rsp + 0x34], eax
027f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027fa 48894424f8                     mov        qword ptr [rsp - 8], rax
027ff 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02803 89442440                       mov        dword ptr [rsp + 0x40], eax
02807 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0280c 48894424f8                     mov        qword ptr [rsp - 8], rax
02811 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02815 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02819 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281e 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02823 48894424f8                     mov        qword ptr [rsp - 8], rax
02828 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0282f 89442470                       mov        dword ptr [rsp + 0x70], eax
02833 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02838 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02840 c5f877                         vzeroupper 
02843 e89807b5ff                     call       0x7f53eb9c3660
02848 0f1f840040290023               nop        dword ptr [rax + rax + 0x23002940]
02850 beccffffff                     mov        esi, 0xffffffcc
02855 48ff742408                     push       qword ptr [rsp + 8]
0285a 488f0424                       pop        qword ptr [rsp]
0285e 48894424f8                     mov        qword ptr [rsp - 8], rax
02863 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02867 89442414                       mov        dword ptr [rsp + 0x14], eax
0286b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02870 48894424f8                     mov        qword ptr [rsp - 8], rax
02875 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02879 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0287d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02882 48894424f8                     mov        qword ptr [rsp - 8], rax
02887 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0288b 89442464                       mov        dword ptr [rsp + 0x64], eax
0288f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02894 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02899 48894424f8                     mov        qword ptr [rsp - 8], rax
0289e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
028a5 89442474                       mov        dword ptr [rsp + 0x74], eax
028a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ae 6690                           nop        
028b0 c5f877                         vzeroupper 
028b3 e82807b5ff                     call       0x7f53eb9c3660
028b8 0f1f8400b0290024               nop        dword ptr [rax + rax + 0x240029b0]
028c0 be6effffff                     mov        esi, 0xffffff6e
028c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028ca 48894424f8                     mov        qword ptr [rsp - 8], rax
028cf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
028d3 89442408                       mov        dword ptr [rsp + 8], eax
028d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028dc 48ff742420                     push       qword ptr [rsp + 0x20]
028e1 488f442418                     pop        qword ptr [rsp + 0x18]
028e6 48894424f8                     mov        qword ptr [rsp - 8], rax
028eb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028ef 8944240c                       mov        dword ptr [rsp + 0xc], eax
028f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f8 48894424f8                     mov        qword ptr [rsp - 8], rax
028fd 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02901 89442434                       mov        dword ptr [rsp + 0x34], eax
02905 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0290a 48894424f8                     mov        qword ptr [rsp - 8], rax
0290f 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02913 89442438                       mov        dword ptr [rsp + 0x38], eax
02917 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0291c 48894424f8                     mov        qword ptr [rsp - 8], rax
02921 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02925 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02929 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0292e 48894424f8                     mov        qword ptr [rsp - 8], rax
02933 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02937 89442460                       mov        dword ptr [rsp + 0x60], eax
0293b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02940 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02945 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02949 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0294e 6690                           nop        
02950 c5f877                         vzeroupper 
02953 e88806b5ff                     call       0x7f53eb9c3660
02958 0f1f8400502a0025               nop        dword ptr [rax + rax + 0x25002a50]
02960 be45ffffff                     mov        esi, 0xffffff45
02965 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0296a 48894424f8                     mov        qword ptr [rsp - 8], rax
0296f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02973 89442408                       mov        dword ptr [rsp + 8], eax
02977 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297c 48ff742420                     push       qword ptr [rsp + 0x20]
02981 488f442418                     pop        qword ptr [rsp + 0x18]
02986 48894424f8                     mov        qword ptr [rsp - 8], rax
0298b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0298f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02993 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02998 48894424f8                     mov        qword ptr [rsp - 8], rax
0299d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
029a1 89442438                       mov        dword ptr [rsp + 0x38], eax
029a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029aa 48894424f8                     mov        qword ptr [rsp - 8], rax
029af 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
029b3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029bc 48894424f8                     mov        qword ptr [rsp - 8], rax
029c1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029c5 89442460                       mov        dword ptr [rsp + 0x60], eax
029c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ce 4489742464                     mov        dword ptr [rsp + 0x64], r14d
029d3 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
029d8 c5f877                         vzeroupper 
029db e80006b5ff                     call       0x7f53eb9c3660
029e0 0f1f8400d82a0026               nop        dword ptr [rax + rax + 0x26002ad8]
029e8 be3dffffff                     mov        esi, 0xffffff3d
029ed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
029f2 48894424f8                     mov        qword ptr [rsp - 8], rax
029f7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
029fb 89442408                       mov        dword ptr [rsp + 8], eax
029ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a04 48ff742420                     push       qword ptr [rsp + 0x20]
02a09 488f442418                     pop        qword ptr [rsp + 0x18]
02a0e 48894424f8                     mov        qword ptr [rsp - 8], rax
02a13 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a17 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a20 48894424f8                     mov        qword ptr [rsp - 8], rax
02a25 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a29 89442438                       mov        dword ptr [rsp + 0x38], eax
02a2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a32 48894424f8                     mov        qword ptr [rsp - 8], rax
02a37 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02a3b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a44 48894424f8                     mov        qword ptr [rsp - 8], rax
02a49 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a4d 89442460                       mov        dword ptr [rsp + 0x60], eax
02a51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a56 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02a5b 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
02a60 c5f877                         vzeroupper 
02a63 e87805b5ff                     call       0x7f53eb9c3660
02a68 0f1f8400602b0027               nop        dword ptr [rax + rax + 0x27002b60]
02a70 bee4ffffff                     mov        esi, 0xffffffe4
02a75 48ff742408                     push       qword ptr [rsp + 8]
02a7a 488f0424                       pop        qword ptr [rsp]
02a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
02a83 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a87 89442414                       mov        dword ptr [rsp + 0x14], eax
02a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a90 48894424f8                     mov        qword ptr [rsp - 8], rax
02a95 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a99 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aa2 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02aab 89442464                       mov        dword ptr [rsp + 0x64], eax
02aaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab4 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02ab9 48894424f8                     mov        qword ptr [rsp - 8], rax
02abe 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02ac5 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02ac9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ace 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02ad5 666690                         nop        
02ad8 c5f877                         vzeroupper 
02adb e80005b5ff                     call       0x7f53eb9c3660
02ae0 0f1f8400d82b0028               nop        dword ptr [rax + rax + 0x28002bd8]
02ae8 bee4ffffff                     mov        esi, 0xffffffe4
02aed 48ff742408                     push       qword ptr [rsp + 8]
02af2 488f0424                       pop        qword ptr [rsp]
02af6 48894424f8                     mov        qword ptr [rsp - 8], rax
02afb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02aff 89442414                       mov        dword ptr [rsp + 0x14], eax
02b03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b08 48894424f8                     mov        qword ptr [rsp - 8], rax
02b0d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02b11 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b1a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b1f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b23 89442464                       mov        dword ptr [rsp + 0x64], eax
02b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b2c 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02b31 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02b35 666690                         nop        
02b38 c5f877                         vzeroupper 
02b3b e8a004b5ff                     call       0x7f53eb9c3660
02b40 0f1f8400382c0029               nop        dword ptr [rax + rax + 0x29002c38]
02b48 beccffffff                     mov        esi, 0xffffffcc
02b4d 48ff742408                     push       qword ptr [rsp + 8]
02b52 488f0424                       pop        qword ptr [rsp]
02b56 48894424f8                     mov        qword ptr [rsp - 8], rax
02b5b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b5f 89442414                       mov        dword ptr [rsp + 0x14], eax
02b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b68 48894424f8                     mov        qword ptr [rsp - 8], rax
02b6d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02b71 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b7a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b7f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b83 89442464                       mov        dword ptr [rsp + 0x64], eax
02b87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b8c 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02b91 48894424f8                     mov        qword ptr [rsp - 8], rax
02b96 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02b9d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02ba1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ba6 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
02bae 6690                           nop        
02bb0 c5f877                         vzeroupper 
02bb3 e82804b5ff                     call       0x7f53eb9c3660
02bb8 0f1f8400b02c002a               nop        dword ptr [rax + rax + 0x2a002cb0]
02bc0 beccffffff                     mov        esi, 0xffffffcc
02bc5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02bca 48894424f8                     mov        qword ptr [rsp - 8], rax
02bcf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02bd3 89442408                       mov        dword ptr [rsp + 8], eax
02bd7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bdc 48ff742420                     push       qword ptr [rsp + 0x20]
02be1 488f442418                     pop        qword ptr [rsp + 0x18]
02be6 48894424f8                     mov        qword ptr [rsp - 8], rax
02beb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02bef 8944240c                       mov        dword ptr [rsp + 0xc], eax
02bf3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bf8 48894424f8                     mov        qword ptr [rsp - 8], rax
02bfd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02c01 89442434                       mov        dword ptr [rsp + 0x34], eax
02c05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c0a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c0f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02c13 89442440                       mov        dword ptr [rsp + 0x40], eax
02c17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c1c 48894424f8                     mov        qword ptr [rsp - 8], rax
02c21 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c25 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02c29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c2e 48894424f8                     mov        qword ptr [rsp - 8], rax
02c33 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02c3a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02c3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c43 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02c48 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02c50 c5f877                         vzeroupper 
02c53 e88803b5ff                     call       0x7f53eb9c3660
02c58 0f1f8400502d002b               nop        dword ptr [rax + rax + 0x2b002d50]
02c60 be85ffffff                     mov        esi, 0xffffff85
02c65 48894424f8                     mov        qword ptr [rsp - 8], rax
02c6a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c6e 890424                         mov        dword ptr [rsp], eax
02c71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c76 48894424f8                     mov        qword ptr [rsp - 8], rax
02c7b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c7f 89442404                       mov        dword ptr [rsp + 4], eax
02c83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c88 4c896c2408                     mov        qword ptr [rsp + 8], r13
02c8d 48894424f8                     mov        qword ptr [rsp - 8], rax
02c92 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02c96 89442418                       mov        dword ptr [rsp + 0x18], eax
02c9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c9f 90                             nop        
02ca0 c5f877                         vzeroupper 
02ca3 e83803b5ff                     call       0x7f53eb9c3660
02ca8 0f1f8400a02d002c               nop        dword ptr [rax + rax + 0x2c002da0]
02cb0 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
02cb7 beccffffff                     mov        esi, 0xffffffcc
02cbc 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02cc1 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02cc5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02cca 6690                           nop        
02ccc c5f877                         vzeroupper 
02ccf e80c03b5ff                     call       0x7f53eb9c3660
02cd4 0f1f8400cc2d002d               nop        dword ptr [rax + rax + 0x2d002dcc]
02cdc bee4ffffff                     mov        esi, 0xffffffe4
02ce1 48ff742408                     push       qword ptr [rsp + 8]
02ce6 488f0424                       pop        qword ptr [rsp]
02cea 48894424f8                     mov        qword ptr [rsp - 8], rax
02cef 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02cf3 89442414                       mov        dword ptr [rsp + 0x14], eax
02cf7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cfc 48894424f8                     mov        qword ptr [rsp - 8], rax
02d01 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02d05 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02d09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d0e 48894424f8                     mov        qword ptr [rsp - 8], rax
02d13 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02d17 89442464                       mov        dword ptr [rsp + 0x64], eax
02d1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d20 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02d25 48894424f8                     mov        qword ptr [rsp - 8], rax
02d2a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02d31 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02d35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d3a 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02d3e 48894424f8                     mov        qword ptr [rsp - 8], rax
02d43 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02d4a 89442478                       mov        dword ptr [rsp + 0x78], eax
02d4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d53 90                             nop        
02d54 c5f877                         vzeroupper 
02d57 e88402b5ff                     call       0x7f53eb9c3660
02d5c 0f1f8400542e002e               nop        dword ptr [rax + rax + 0x2e002e54]
02d64 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02d6d bee4ffffff                     mov        esi, 0xffffffe4
02d72 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d77 48894424f8                     mov        qword ptr [rsp - 8], rax
02d7c 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02d80 89442408                       mov        dword ptr [rsp + 8], eax
02d84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d89 48ff742420                     push       qword ptr [rsp + 0x20]
02d8e 488f442418                     pop        qword ptr [rsp + 0x18]
02d93 48894424f8                     mov        qword ptr [rsp - 8], rax
02d98 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d9c 8944240c                       mov        dword ptr [rsp + 0xc], eax
02da0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02da5 48894424f8                     mov        qword ptr [rsp - 8], rax
02daa 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02dae 89442434                       mov        dword ptr [rsp + 0x34], eax
02db2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02db7 48894424f8                     mov        qword ptr [rsp - 8], rax
02dbc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02dc0 89442440                       mov        dword ptr [rsp + 0x40], eax
02dc4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dc9 48894424f8                     mov        qword ptr [rsp - 8], rax
02dce 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02dd2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02dd6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ddb 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02de0 48894424f8                     mov        qword ptr [rsp - 8], rax
02de5 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02dec 89442464                       mov        dword ptr [rsp + 0x64], eax
02df0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02df5 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02df9 89442474                       mov        dword ptr [rsp + 0x74], eax
02dfd 666690                         nop        
02e00 c5f877                         vzeroupper 
02e03 e8d801b5ff                     call       0x7f53eb9c3660
02e08 0f1f8400002f002f               nop        dword ptr [rax + rax + 0x2f002f00]
02e10 beccffffff                     mov        esi, 0xffffffcc
02e15 48ff742408                     push       qword ptr [rsp + 8]
02e1a 488f0424                       pop        qword ptr [rsp]
02e1e 48894424f8                     mov        qword ptr [rsp - 8], rax
02e23 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e27 89442414                       mov        dword ptr [rsp + 0x14], eax
02e2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e30 48894424f8                     mov        qword ptr [rsp - 8], rax
02e35 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02e39 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02e3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e42 48894424f8                     mov        qword ptr [rsp - 8], rax
02e47 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e4b 89442464                       mov        dword ptr [rsp + 0x64], eax
02e4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e54 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02e59 48894424f8                     mov        qword ptr [rsp - 8], rax
02e5e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02e65 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02e69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e6e 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02e72 48894424f8                     mov        qword ptr [rsp - 8], rax
02e77 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02e7e 89442478                       mov        dword ptr [rsp + 0x78], eax
02e82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e87 90                             nop        
02e88 c5f877                         vzeroupper 
02e8b e85001b5ff                     call       0x7f53eb9c3660
02e90 0f1f8400882f0030               nop        dword ptr [rax + rax + 0x30002f88]
02e98 beccffffff                     mov        esi, 0xffffffcc
02e9d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02ea2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ea7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02eab 89442408                       mov        dword ptr [rsp + 8], eax
02eaf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eb4 48ff742420                     push       qword ptr [rsp + 0x20]
02eb9 488f442418                     pop        qword ptr [rsp + 0x18]
02ebe 48894424f8                     mov        qword ptr [rsp - 8], rax
02ec3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02ec7 8944240c                       mov        dword ptr [rsp + 0xc], eax
02ecb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ed0 48894424f8                     mov        qword ptr [rsp - 8], rax
02ed5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02ed9 89442438                       mov        dword ptr [rsp + 0x38], eax
02edd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ee2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ee7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02eeb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02eef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ef4 48894424f8                     mov        qword ptr [rsp - 8], rax
02ef9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02efd 89442460                       mov        dword ptr [rsp + 0x60], eax
02f01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f06 48894424f8                     mov        qword ptr [rsp - 8], rax
02f0b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02f12 89442468                       mov        dword ptr [rsp + 0x68], eax
02f16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f1b 48894424f8                     mov        qword ptr [rsp - 8], rax
02f20 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02f24 89442478                       mov        dword ptr [rsp + 0x78], eax
02f28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f2d 48894424f8                     mov        qword ptr [rsp - 8], rax
02f32 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02f39 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02f3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f42 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02f4a 6690                           nop        
02f4c c5f877                         vzeroupper 
02f4f e88c00b5ff                     call       0x7f53eb9c3660
02f54 0f1f84004c300031               nop        dword ptr [rax + rax + 0x3100304c]
02f5c c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02f65 beccffffff                     mov        esi, 0xffffffcc
02f6a 48ff742408                     push       qword ptr [rsp + 8]
02f6f 488f0424                       pop        qword ptr [rsp]
02f73 48894424f8                     mov        qword ptr [rsp - 8], rax
02f78 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02f7c 89442414                       mov        dword ptr [rsp + 0x14], eax
02f80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f85 48894424f8                     mov        qword ptr [rsp - 8], rax
02f8a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02f8e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02f92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f97 48894424f8                     mov        qword ptr [rsp - 8], rax
02f9c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02fa0 89442464                       mov        dword ptr [rsp + 0x64], eax
02fa4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fa9 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02fae 48894424f8                     mov        qword ptr [rsp - 8], rax
02fb3 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02fba 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02fbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fc3 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02fc7 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02fcb 90                             nop        
02fcc c5f877                         vzeroupper 
02fcf e80c00b5ff                     call       0x7f53eb9c3660
02fd4 0f1f8400cc300032               nop        dword ptr [rax + rax + 0x320030cc]
02fdc 8be8                           mov        ebp, eax
02fde 83c510                         add        ebp, 0x10
02fe1 be6effffff                     mov        esi, 0xffffff6e
02fe6 48ff742408                     push       qword ptr [rsp + 8]
02feb 488f0424                       pop        qword ptr [rsp]
02fef 48894424f8                     mov        qword ptr [rsp - 8], rax
02ff4 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02ff8 89442414                       mov        dword ptr [rsp + 0x14], eax
02ffc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03001 89442438                       mov        dword ptr [rsp + 0x38], eax
03005 48894424f8                     mov        qword ptr [rsp - 8], rax
0300a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0300e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
03012 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03017 48894424f8                     mov        qword ptr [rsp - 8], rax
0301c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03020 89442464                       mov        dword ptr [rsp + 0x64], eax
03024 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03029 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0302e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
03032 6690                           nop        
03034 c5f877                         vzeroupper 
03037 e8a4ffb4ff                     call       0x7f53eb9c3660
0303c 0f1f840034310033               nop        dword ptr [rax + rax + 0x33003134]
03044 8be8                           mov        ebp, eax
03046 83c510                         add        ebp, 0x10
03049 be66ffffff                     mov        esi, 0xffffff66
0304e 48ff742408                     push       qword ptr [rsp + 8]
03053 488f0424                       pop        qword ptr [rsp]
03057 48894424f8                     mov        qword ptr [rsp - 8], rax
0305c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03060 89442414                       mov        dword ptr [rsp + 0x14], eax
03064 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03069 89442438                       mov        dword ptr [rsp + 0x38], eax
0306d 48894424f8                     mov        qword ptr [rsp - 8], rax
03072 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03076 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0307a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0307f 48894424f8                     mov        qword ptr [rsp - 8], rax
03084 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03088 89442464                       mov        dword ptr [rsp + 0x64], eax
0308c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03091 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03096 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0309a 6690                           nop        
0309c c5f877                         vzeroupper 
0309f e83cffb4ff                     call       0x7f53eb9c3660
030a4 0f1f84009c310034               nop        dword ptr [rax + rax + 0x3400319c]
030ac bee4ffffff                     mov        esi, 0xffffffe4
030b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
030b6 48894424f8                     mov        qword ptr [rsp - 8], rax
030bb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
030bf 89442408                       mov        dword ptr [rsp + 8], eax
030c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030c8 48ff742420                     push       qword ptr [rsp + 0x20]
030cd 488f442418                     pop        qword ptr [rsp + 0x18]
030d2 48894424f8                     mov        qword ptr [rsp - 8], rax
030d7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
030db 8944240c                       mov        dword ptr [rsp + 0xc], eax
030df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030e4 48894424f8                     mov        qword ptr [rsp - 8], rax
030e9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
030ed 89442434                       mov        dword ptr [rsp + 0x34], eax
030f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030f6 48894424f8                     mov        qword ptr [rsp - 8], rax
030fb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
030ff 89442440                       mov        dword ptr [rsp + 0x40], eax
03103 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03108 48894424f8                     mov        qword ptr [rsp - 8], rax
0310d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03111 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03115 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0311a 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0311f 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03127 90                             nop        
03128 c5f877                         vzeroupper 
0312b e8b0feb4ff                     call       0x7f53eb9c3660
03130 0f1f840028320035               nop        dword ptr [rax + rax + 0x35003228]
03138 bee4ffffff                     mov        esi, 0xffffffe4
0313d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03142 48894424f8                     mov        qword ptr [rsp - 8], rax
03147 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0314b 89442408                       mov        dword ptr [rsp + 8], eax
0314f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03154 48ff742420                     push       qword ptr [rsp + 0x20]
03159 488f442418                     pop        qword ptr [rsp + 0x18]
0315e 48894424f8                     mov        qword ptr [rsp - 8], rax
03163 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03167 8944240c                       mov        dword ptr [rsp + 0xc], eax
0316b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03170 48894424f8                     mov        qword ptr [rsp - 8], rax
03175 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03179 89442434                       mov        dword ptr [rsp + 0x34], eax
0317d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03182 48894424f8                     mov        qword ptr [rsp - 8], rax
03187 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0318b 89442440                       mov        dword ptr [rsp + 0x40], eax
0318f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03194 48894424f8                     mov        qword ptr [rsp - 8], rax
03199 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0319d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
031a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031a6 4489742470                     mov        dword ptr [rsp + 0x70], r14d
031ab 90                             nop        
031ac c5f877                         vzeroupper 
031af e82cfeb4ff                     call       0x7f53eb9c3660
031b4 0f1f8400ac320036               nop        dword ptr [rax + rax + 0x360032ac]
031bc beccffffff                     mov        esi, 0xffffffcc
031c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
031c6 48894424f8                     mov        qword ptr [rsp - 8], rax
031cb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
031cf 89442408                       mov        dword ptr [rsp + 8], eax
031d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031d8 48ff742420                     push       qword ptr [rsp + 0x20]
031dd 488f442418                     pop        qword ptr [rsp + 0x18]
031e2 48894424f8                     mov        qword ptr [rsp - 8], rax
031e7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
031eb 8944240c                       mov        dword ptr [rsp + 0xc], eax
031ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031f4 48894424f8                     mov        qword ptr [rsp - 8], rax
031f9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
031fd 89442434                       mov        dword ptr [rsp + 0x34], eax
03201 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03206 48894424f8                     mov        qword ptr [rsp - 8], rax
0320b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0320f 89442440                       mov        dword ptr [rsp + 0x40], eax
03213 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03218 48894424f8                     mov        qword ptr [rsp - 8], rax
0321d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03221 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03225 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0322a 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0322f 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03237 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0323f 90                             nop        
03240 c5f877                         vzeroupper 
03243 e898fdb4ff                     call       0x7f53eb9c3660
03248 0f1f840040330037               nop        dword ptr [rax + rax + 0x37003340]
03250 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
03255 458d5308                       lea        r10d, [r11 + 8]
03259 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0325e be6effffff                     mov        esi, 0xffffff6e
03263 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03268 48894424f8                     mov        qword ptr [rsp - 8], rax
0326d 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03271 89442408                       mov        dword ptr [rsp + 8], eax
03275 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0327a 48ff742420                     push       qword ptr [rsp + 0x20]
0327f 488f442418                     pop        qword ptr [rsp + 0x18]
03284 48894424f8                     mov        qword ptr [rsp - 8], rax
03289 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0328d 8944240c                       mov        dword ptr [rsp + 0xc], eax
03291 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03296 48894424f8                     mov        qword ptr [rsp - 8], rax
0329b 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0329f 89442434                       mov        dword ptr [rsp + 0x34], eax
032a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032a8 48894424f8                     mov        qword ptr [rsp - 8], rax
032ad 8b442448                       mov        eax, dword ptr [rsp + 0x48]
032b1 89442440                       mov        dword ptr [rsp + 0x40], eax
032b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032ba 48894424f8                     mov        qword ptr [rsp - 8], rax
032bf 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
032c6 89442460                       mov        dword ptr [rsp + 0x60], eax
032ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032cf 90                             nop        
032d0 c5f877                         vzeroupper 
032d3 e808fdb4ff                     call       0x7f53eb9c3660
032d8 0f1f8400d0330038               nop        dword ptr [rax + rax + 0x380033d0]
032e0 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
032e5 458d5308                       lea        r10d, [r11 + 8]
032e9 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
032ee be66ffffff                     mov        esi, 0xffffff66
032f3 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
032f8 48894424f8                     mov        qword ptr [rsp - 8], rax
032fd 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03301 89442408                       mov        dword ptr [rsp + 8], eax
03305 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0330a 48ff742420                     push       qword ptr [rsp + 0x20]
0330f 488f442418                     pop        qword ptr [rsp + 0x18]
03314 48894424f8                     mov        qword ptr [rsp - 8], rax
03319 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0331d 8944240c                       mov        dword ptr [rsp + 0xc], eax
03321 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03326 48894424f8                     mov        qword ptr [rsp - 8], rax
0332b 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0332f 89442434                       mov        dword ptr [rsp + 0x34], eax
03333 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03338 48894424f8                     mov        qword ptr [rsp - 8], rax
0333d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03341 89442440                       mov        dword ptr [rsp + 0x40], eax
03345 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0334a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0334e 6690                           nop        
03350 c5f877                         vzeroupper 
03353 e888fcb4ff                     call       0x7f53eb9c3660
03358 0f1f840050340039               nop        dword ptr [rax + rax + 0x39003450]
03360 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
03368 e99cdeffff                     jmp        0x7f53ebe71889
0336d bee4ffffff                     mov        esi, 0xffffffe4
03372 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03377 48894424f8                     mov        qword ptr [rsp - 8], rax
0337c 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03380 89442408                       mov        dword ptr [rsp + 8], eax
03384 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03389 48ff742420                     push       qword ptr [rsp + 0x20]
0338e 488f442418                     pop        qword ptr [rsp + 0x18]
03393 48894424f8                     mov        qword ptr [rsp - 8], rax
03398 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0339c 8944240c                       mov        dword ptr [rsp + 0xc], eax
033a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033a5 48894424f8                     mov        qword ptr [rsp - 8], rax
033aa 8b442440                       mov        eax, dword ptr [rsp + 0x40]
033ae 89442434                       mov        dword ptr [rsp + 0x34], eax
033b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033b7 48894424f8                     mov        qword ptr [rsp - 8], rax
033bc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
033c0 89442440                       mov        dword ptr [rsp + 0x40], eax
033c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033c9 48894424f8                     mov        qword ptr [rsp - 8], rax
033ce 8b442470                       mov        eax, dword ptr [rsp + 0x70]
033d2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
033d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033db 4489742464                     mov        dword ptr [rsp + 0x64], r14d
033e0 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
033e5 666690                         nop        
033e8 c5f877                         vzeroupper 
033eb e8f0fbb4ff                     call       0x7f53eb9c3660
033f0 0f1f8400e834003a               nop        dword ptr [rax + rax + 0x3a0034e8]
033f8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
03401 bee4ffffff                     mov        esi, 0xffffffe4
03406 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0340b 48894424f8                     mov        qword ptr [rsp - 8], rax
03410 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03414 89442408                       mov        dword ptr [rsp + 8], eax
03418 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0341d 48ff742420                     push       qword ptr [rsp + 0x20]
03422 488f442418                     pop        qword ptr [rsp + 0x18]
03427 48894424f8                     mov        qword ptr [rsp - 8], rax
0342c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03430 8944240c                       mov        dword ptr [rsp + 0xc], eax
03434 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03439 48894424f8                     mov        qword ptr [rsp - 8], rax
0343e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03442 89442434                       mov        dword ptr [rsp + 0x34], eax
03446 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0344b 48894424f8                     mov        qword ptr [rsp - 8], rax
03450 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03454 89442440                       mov        dword ptr [rsp + 0x40], eax
03458 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0345d 48894424f8                     mov        qword ptr [rsp - 8], rax
03462 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03466 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0346a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0346f 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
03474 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03479 666690                         nop        
0347c c5f877                         vzeroupper 
0347f e85cfbb4ff                     call       0x7f53eb9c3660
03484 0f1f84007c35003b               nop        dword ptr [rax + rax + 0x3b00357c]
0348c beccffffff                     mov        esi, 0xffffffcc
03491 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03496 48894424f8                     mov        qword ptr [rsp - 8], rax
0349b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0349f 89442408                       mov        dword ptr [rsp + 8], eax
034a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034a8 48ff742420                     push       qword ptr [rsp + 0x20]
034ad 488f442418                     pop        qword ptr [rsp + 0x18]
034b2 48894424f8                     mov        qword ptr [rsp - 8], rax
034b7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
034bb 8944240c                       mov        dword ptr [rsp + 0xc], eax
034bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034c4 48894424f8                     mov        qword ptr [rsp - 8], rax
034c9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
034cd 89442434                       mov        dword ptr [rsp + 0x34], eax
034d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034d6 48894424f8                     mov        qword ptr [rsp - 8], rax
034db 8b442448                       mov        eax, dword ptr [rsp + 0x48]
034df 89442440                       mov        dword ptr [rsp + 0x40], eax
034e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034e8 48894424f8                     mov        qword ptr [rsp - 8], rax
034ed 8b442470                       mov        eax, dword ptr [rsp + 0x70]
034f1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
034f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034fa 4489742464                     mov        dword ptr [rsp + 0x64], r14d
034ff 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
03504 4489542478                     mov        dword ptr [rsp + 0x78], r10d
03509 666690                         nop        
0350c c5f877                         vzeroupper 
0350f e8ccfab4ff                     call       0x7f53eb9c3660
03514 0f1f84000c36003c               nop        dword ptr [rax + rax + 0x3c00360c]
0351c 4183c510                       add        r13d, 0x10
03520 be6effffff                     mov        esi, 0xffffff6e
03525 48ff742408                     push       qword ptr [rsp + 8]
0352a 488f0424                       pop        qword ptr [rsp]
0352e 48894424f8                     mov        qword ptr [rsp - 8], rax
03533 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03537 89442414                       mov        dword ptr [rsp + 0x14], eax
0353b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03540 48894424f8                     mov        qword ptr [rsp - 8], rax
03545 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03549 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0354d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03552 48894424f8                     mov        qword ptr [rsp - 8], rax
03557 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0355b 89442464                       mov        dword ptr [rsp + 0x64], eax
0355f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03564 48894424f8                     mov        qword ptr [rsp - 8], rax
03569 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
03570 89442468                       mov        dword ptr [rsp + 0x68], eax
03574 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03579 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0357e 6690                           nop        
03580 c5f877                         vzeroupper 
03583 e858fab4ff                     call       0x7f53eb9c3660
03588 0f1f84008036003d               nop        dword ptr [rax + rax + 0x3d003680]
03590 4183c510                       add        r13d, 0x10
03594 be66ffffff                     mov        esi, 0xffffff66
03599 48ff742408                     push       qword ptr [rsp + 8]
0359e 488f0424                       pop        qword ptr [rsp]
035a2 48894424f8                     mov        qword ptr [rsp - 8], rax
035a7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
035ab 89442414                       mov        dword ptr [rsp + 0x14], eax
035af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035b4 48894424f8                     mov        qword ptr [rsp - 8], rax
035b9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
035bd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
035c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035c6 48894424f8                     mov        qword ptr [rsp - 8], rax
035cb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
035cf 89442464                       mov        dword ptr [rsp + 0x64], eax
035d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035d8 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
035dd 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
035e2 6690                           nop        
035e4 c5f877                         vzeroupper 
035e7 e8f4f9b4ff                     call       0x7f53eb9c3660
035ec 0f1f8400e436003e               nop        dword ptr [rax + rax + 0x3e0036e4]
035f4 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
035fc e939ecffff                     jmp        0x7f53ebe728ba
03601 bef6ffffff                     mov        esi, 0xfffffff6
03606 6690                           nop        
03608 c5f877                         vzeroupper 
0360b e8d0f9b4ff                     call       0x7f53eb9c3660
03610 0f1f84000837003f               nop        dword ptr [rax + rax + 0x3f003708]
03618 bef6ffffff                     mov        esi, 0xfffffff6
0361d 666690                         nop        
03620 c5f877                         vzeroupper 
03623 e8b8f9b4ff                     call       0x7f53eb9c3660
03628 0f1f840020370040               nop        dword ptr [rax + rax + 0x40003720]
03630 bef6ffffff                     mov        esi, 0xfffffff6
03635 666690                         nop        
03638 c5f877                         vzeroupper 
0363b e8a0f9b4ff                     call       0x7f53eb9c3660
03640 0f1f840038370041               nop        dword ptr [rax + rax + 0x41003738]
03648 bef6ffffff                     mov        esi, 0xfffffff6
0364d 666690                         nop        
03650 c5f877                         vzeroupper 
03653 e888f9b4ff                     call       0x7f53eb9c3660
03658 0f1f840050370042               nop        dword ptr [rax + rax + 0x42003750]
03660 bef6ffffff                     mov        esi, 0xfffffff6
03665 418beb                         mov        ebp, r11d
03668 c5f877                         vzeroupper 
0366b e870f9b4ff                     call       0x7f53eb9c3660
03670 0f1f840068370043               nop        dword ptr [rax + rax + 0x43003768]
03678 bef6ffffff                     mov        esi, 0xfffffff6
0367d 666690                         nop        
03680 c5f877                         vzeroupper 
03683 e858f9b4ff                     call       0x7f53eb9c3660
03688 0f1f840080370044               nop        dword ptr [rax + rax + 0x44003780]
03690 bef6ffffff                     mov        esi, 0xfffffff6
03695 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0369a 6690                           nop        
0369c c5f877                         vzeroupper 
0369f e83cf9b4ff                     call       0x7f53eb9c3660
036a4 0f1f84009c370045               nop        dword ptr [rax + rax + 0x4500379c]
036ac bef6ffffff                     mov        esi, 0xfffffff6
036b1 4489542408                     mov        dword ptr [rsp + 8], r10d
036b6 6690                           nop        
036b8 c5f877                         vzeroupper 
036bb e820f9b4ff                     call       0x7f53eb9c3660
036c0 0f1f8400b8370046               nop        dword ptr [rax + rax + 0x460037b8]
036c8 bef6ffffff                     mov        esi, 0xfffffff6
036cd 666690                         nop        
036d0 c5f877                         vzeroupper 
036d3 e808f9b4ff                     call       0x7f53eb9c3660
036d8 0f1f8400d0370047               nop        dword ptr [rax + rax + 0x470037d0]
036e0 bef6ffffff                     mov        esi, 0xfffffff6
036e5 448974240c                     mov        dword ptr [rsp + 0xc], r14d
036ea 6690                           nop        
036ec c5f877                         vzeroupper 
036ef e8ecf8b4ff                     call       0x7f53eb9c3660
036f4 0f1f8400ec370048               nop        dword ptr [rax + rax + 0x480037ec]
036fc bef6ffffff                     mov        esi, 0xfffffff6
03701 666690                         nop        
03704 c5f877                         vzeroupper 
03707 e8d4f8b4ff                     call       0x7f53eb9c3660
0370c 0f1f840004380049               nop        dword ptr [rax + rax + 0x49003804]
03714 bef6ffffff                     mov        esi, 0xfffffff6
03719 4489742408                     mov        dword ptr [rsp + 8], r14d
0371e 6690                           nop        
03720 c5f877                         vzeroupper 
03723 e8b8f8b4ff                     call       0x7f53eb9c3660
03728 0f1f84002038004a               nop        dword ptr [rax + rax + 0x4a003820]
03730 bef6ffffff                     mov        esi, 0xfffffff6
03735 666690                         nop        
03738 c5f877                         vzeroupper 
0373b e8a0f8b4ff                     call       0x7f53eb9c3660
03740 0f1f84003838004b               nop        dword ptr [rax + rax + 0x4b003838]
03748 49ba2e15e7eb537f0000           movabs     r10, 0x7f53ebe7152e
03752 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
03759 e902a1a8ff                     jmp        0x7f53eb8fdee0
0375e e8bd6ca7ff                     call       0x7f53eb8eaaa0
03763 e9c6c8ffff                     jmp        0x7f53ebe706ae
