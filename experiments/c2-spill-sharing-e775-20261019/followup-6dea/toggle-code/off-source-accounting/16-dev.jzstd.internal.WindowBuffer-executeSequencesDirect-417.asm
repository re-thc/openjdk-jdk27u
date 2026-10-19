00000 e8bb0f5519                     call       0x7f98493c16c0
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8510370000                   jne        0x7f982fe73e3e
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
00103 49ba007e4a49987f0000           movabs     r10, 0x7f98494a7e00
0010d 41ffd2                         call       r10
00110 0f1f840000000000               nop        dword ptr [rax + rax]
00118 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0011d 4d85d2                         test       r10, r10
00120 0f84421f0000                   je         0x7f982fe72768
00126 458b1a                         mov        r11d, dword ptr [r10]
00129 41c1eb0d                       shr        r11d, 0xd
0012d 4181fb15410000                 cmp        r11d, 0x4115
00134 0f85062b0000                   jne        0x7f982fe73340
0013a 498bda                         mov        rbx, r10
0013d 48895c2408                     mov        qword ptr [rsp + 8], rbx
00142 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00147 4d85d2                         test       r10, r10
0014a 0f84251f0000                   je         0x7f982fe72775
00150 458b12                         mov        r10d, dword ptr [r10]
00153 41c1ea0d                       shr        r10d, 0xd
00157 4181fadd050000                 cmp        r10d, 0x5dd
0015e 0f85dc2a0000                   jne        0x7f982fe73340
00164 488b5c2450                     mov        rbx, qword ptr [rsp + 0x50]
00169 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
00171 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00176 4d85d2                         test       r10, r10
00179 0f84061f0000                   je         0x7f982fe72785
0017f 458b1a                         mov        r11d, dword ptr [r10]
00182 41c1eb0d                       shr        r11d, 0xd
00186 4181fbe0050000                 cmp        r11d, 0x5e0
0018d 0f85ad2a0000                   jne        0x7f982fe73340
00193 498bda                         mov        rbx, r10
00196 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
0019e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001a3 4d85d2                         test       r10, r10
001a6 0f84e91e0000                   je         0x7f982fe72795
001ac 458b12                         mov        r10d, dword ptr [r10]
001af 41c1ea0d                       shr        r10d, 0xd
001b3 4181fadf050000                 cmp        r10d, 0x5df
001ba 0f85802a0000                   jne        0x7f982fe73340
001c0 488b5c2460                     mov        rbx, qword ptr [rsp + 0x60]
001c5 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
001ca 4885ed                         test       rbp, rbp
001cd 0f84cf1e0000                   je         0x7f982fe727a2
001d3 448b5d00                       mov        r11d, dword ptr [rbp]
001d7 41c1eb0d                       shr        r11d, 0xd
001db 4181fbdf050000                 cmp        r11d, 0x5df
001e2 0f85582a0000                   jne        0x7f982fe73340
001e8 488bdd                         mov        rbx, rbp
001eb 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
001f3 4d85ed                         test       r13, r13
001f6 0f84b61e0000                   je         0x7f982fe727b2
001fc 458b5500                       mov        r10d, dword ptr [r13]
00200 41c1ea0d                       shr        r10d, 0xd
00204 4181fadd050000                 cmp        r10d, 0x5dd
0020b 0f852f2a0000                   jne        0x7f982fe73340
00211 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00219 e9f8040000                     jmp        0x7f982fe70e16
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
0026b 0f8d80080000                   jge        0x7f982fe711f1
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
002af 0f8c7b250000                   jl         0x7f982fe72f30
002b5 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002ba 4585d2                         test       r10d, r10d
002bd 0f8c6d250000                   jl         0x7f982fe72f30
002c3 448bd5                         mov        r10d, ebp
002c6 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
002ce 413bda                         cmp        ebx, r10d
002d1 0f8259250000                   jb         0x7f982fe72f30
002d7 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
002dc 4403ed                         add        r13d, ebp
002df 413bdd                         cmp        ebx, r13d
002e2 0f8248250000                   jb         0x7f982fe72f30
002e8 85ed                           test       ebp, ebp
002ea 0f8c40250000                   jl         0x7f982fe72f30
002f0 85ed                           test       ebp, ebp
002f2 0f8449ffffff                   je         0x7f982fe70941
002f8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002fd 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
00305 4b8d741308                     lea        rsi, [r11 + r10 + 8]
0030a 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00312 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0031a 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
0031f 4863d5                         movsxd     rdx, ebp
00322 4883fa20                       cmp        rdx, 0x20
00326 0f86f2feffff                   jbe        0x7f982fe7091e
0032c c5f877                         vzeroupper 
0032f 49ba204f8e2f987f0000           movabs     r10, 0x7f982f8e4f20
00339 41ffd2                         call       r10
0033c 0f1f840000000000               nop        dword ptr [rax + rax]
00344 e9f8feffff                     jmp        0x7f982fe70941
00349 48894424f8                     mov        qword ptr [rsp - 8], rax
0034e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
00352 89442448                       mov        dword ptr [rsp + 0x48], eax
00356 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0035b 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
00362 85c9                           test       ecx, ecx
00364 0f8ec6160000                   jle        0x7f982fe72130
0036a 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00372 4403db                         add        r11d, ebx
00375 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
0037d 0f8fc9170000                   jg         0x7f982fe7224c
00383 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00388 4503d6                         add        r10d, r14d
0038b 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00393 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
0039b 0f8f33180000                   jg         0x7f982fe722d4
003a1 4183fe10                       cmp        r14d, 0x10
003a5 0f8fed070000                   jg         0x7f982fe71298
003ab 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
003b3 448b5b04                       mov        r11d, dword ptr [rbx + 4]
003b7 458d43f1                       lea        r8d, [r11 - 0xf]
003bb 4585c0                         test       r8d, r8d
003be 0f8cc4120000                   jl         0x7f982fe71d88
003c4 4183c3f1                       add        r11d, -0xf
003c8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
003cd 453bd3                         cmp        r10d, r11d
003d0 0f8356110000                   jae        0x7f982fe71c2c
003d6 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
003de 448b5304                       mov        r10d, dword ptr [rbx + 4]
003e2 8b5c247c                       mov        ebx, dword ptr [rsp + 0x7c]
003e6 4c8bac24c8000000               mov        r13, qword ptr [rsp + 0xc8]
003ee c4c17a6f441d08                 vmovdqu    xmm0, xmmword ptr [r13 + rbx + 8]
003f5 458d42f1                       lea        r8d, [r10 - 0xf]
003f9 4585c0                         test       r8d, r8d
003fc 0f8c22130000                   jl         0x7f982fe71e24
00402 4183c2f1                       add        r10d, -0xf
00406 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
0040e 453bc2                         cmp        r8d, r10d
00411 0f83b1110000                   jae        0x7f982fe71cc8
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
00458 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00460 4183fb10                       cmp        r11d, 0x10
00464 7f43                           jg         0x7f982fe70ba9
00466 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
0046e 4183f910                       cmp        r9d, 0x10
00472 7c35                           jl         0x7f982fe70ba9
00474 4585d2                         test       r10d, r10d
00477 0f8c23150000                   jl         0x7f982fe720a0
0047d 83c3f1                         add        ebx, -0xf
00480 443beb                         cmp        r13d, ebx
00483 0f83f3130000                   jae        0x7f982fe71f7c
00489 c4817a6f442808                 vmovdqu    xmm0, xmmword ptr [r8 + r13 + 8]
00490 443bf3                         cmp        r14d, ebx
00493 0f836f140000                   jae        0x7f982fe72008
00499 c4817a7f443008                 vmovdqu    xmmword ptr [r8 + r14 + 8], xmm0
004a0 438d1c33                       lea        ebx, [r11 + r14]
004a4 e93d020000                     jmp        0x7f982fe70de6
004a9 448d5bf9                       lea        r11d, [rbx - 7]
004ad 4b8d7c2808                     lea        rdi, [r8 + r13 + 8]
004b2 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
004ba 4503ce                         add        r9d, r14d
004bd 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
004c5 4b8d743008                     lea        rsi, [r8 + r14 + 8]
004ca 4963d1                         movsxd     rdx, r9d
004cd 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
004d4 3b8c2480000000                 cmp        ecx, dword ptr [rsp + 0x80]
004db 0f8c7a040000                   jl         0x7f982fe7105b
004e1 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
004e9 4183f930                       cmp        r9d, 0x30
004ed 0f8e85000000                   jle        0x7f982fe70c78
004f3 4585ed                         test       r13d, r13d
004f6 0f8cc61b0000                   jl         0x7f982fe727c2
004fc 4585f6                         test       r14d, r14d
004ff 0f8cbd1b0000                   jl         0x7f982fe727c2
00505 478d1429                       lea        r10d, [r9 + r13]
00509 413bda                         cmp        ebx, r10d
0050c 0f82b01b0000                   jb         0x7f982fe727c2
00512 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
00519 0f82a31b0000                   jb         0x7f982fe727c2
0051f 418bd9                         mov        ebx, r9d
00522 85db                           test       ebx, ebx
00524 0f84b1010000                   je         0x7f982fe70ddb
0052a 4863d3                         movsxd     rdx, ebx
0052d 4883fa20                       cmp        rdx, 0x20
00531 7728                           ja         0x7f982fe70c5b
00533 448bd3                         mov        r10d, ebx
00536 4d63d2                         movsxd     r10, r10d
00539 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00540 c442a8f5db                     bzhi       r11, r11, r10
00545 c4c1fb92fb                     kmovq      k7, r11
0054a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00550 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00556 e980010000                     jmp        0x7f982fe70ddb
0055b c5f877                         vzeroupper 
0055e 49ba204f8e2f987f0000           movabs     r10, 0x7f982f8e4f20
00568 41ffd2                         call       r10
0056b 0f1f840000000000               nop        dword ptr [rax + rax]
00573 e963010000                     jmp        0x7f982fe70ddb
00578 4585db                         test       r11d, r11d
0057b 0f8c07190000                   jl         0x7f982fe72588
00581 448d53f9                       lea        r10d, [rbx - 7]
00585 453bea                         cmp        r13d, r10d
00588 0f83ba170000                   jae        0x7f982fe72448
0058e 4963fd                         movsxd     rdi, r13d
00591 498b4c3808                     mov        rcx, qword ptr [r8 + rdi + 8]
00596 453bf2                         cmp        r14d, r10d
00599 0f8349180000                   jae        0x7f982fe724e8
0059f 458bce                         mov        r9d, r14d
005a2 458d5908                       lea        r11d, [r9 + 8]
005a6 4963f1                         movsxd     rsi, r9d
005a9 49894c3008                     mov        qword ptr [r8 + rsi + 8], rcx
005ae 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
005b6 0f8d1f010000                   jge        0x7f982fe70ddb
005bc 482bfe                         sub        rdi, rsi
005bf 4863f3                         movsxd     rsi, ebx
005c2 4883c6f9                       add        rsi, -7
005c6 4963db                         movsxd     rbx, r11d
005c9 488d0c3b                       lea        rcx, [rbx + rdi]
005cd 483bce                         cmp        rcx, rsi
005d0 0f8352190000                   jae        0x7f982fe72628
005d6 488bca                         mov        rcx, rdx
005d9 482bcb                         sub        rcx, rbx
005dc 4883c107                       add        rcx, 7
005e0 4883e1f8                       and        rcx, 0xfffffffffffffff8
005e4 8bc9                           mov        ecx, ecx
005e6 428d5c0908                     lea        ebx, [rcx + r9 + 8]
005eb 4863cb                         movsxd     rcx, ebx
005ee 488d5c39f8                     lea        rbx, [rcx + rdi - 8]
005f3 483bde                         cmp        rbx, rsi
005f6 0f832c190000                   jae        0x7f982fe72628
005fc 453bda                         cmp        r11d, r10d
005ff 0f8323190000                   jae        0x7f982fe72628
00605 4883c1f8                       add        rcx, -8
00609 483bce                         cmp        rcx, rsi
0060c 0f8316190000                   jae        0x7f982fe72628
00612 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00619 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
0061f 0f8fab190000                   jg         0x7f982fe726d0
00625 452be9                         sub        r13d, r9d
00628 4183c110                       add        r9d, 0x10
0062c 458bd3                         mov        r10d, r11d
0062f 438d0c2b                       lea        ecx, [r11 + r13]
00633 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0063b 4c8b440b08                     mov        r8, qword ptr [rbx + rcx + 8]
00640 4e89441308                     mov        qword ptr [rbx + r10 + 8], r8
00645 4183c308                       add        r11d, 8
00649 453bd9                         cmp        r11d, r9d
0064c 7cde                           jl         0x7f982fe70d2c
0064e 4883c2f8                       add        rdx, -8
00652 4881fa00000080                 cmp        rdx, -0x80000000
00659 49c7c200000080                 mov        r10, 0xffffffff80000000
00660 490f4cd2                       cmovl      rdx, r10
00664 448bd2                         mov        r10d, edx
00667 453bda                         cmp        r11d, r10d
0066a 7d3c                           jge        0x7f982fe70da8
0066c 0f1f4000                       nop        dword ptr [rax]
00670 458bcb                         mov        r9d, r11d
00673 4963d9                         movsxd     rbx, r9d
00676 458bc3                         mov        r8d, r11d
00679 478d0c2b                       lea        r9d, [r11 + r13]
0067d 418bc9                         mov        ecx, r9d
00680 488bbc24e0000000               mov        rdi, qword ptr [rsp + 0xe0]
00688 4e8b4c0f08                     mov        r9, qword ptr [rdi + r9 + 8]
0068d 4e894c0708                     mov        qword ptr [rdi + r8 + 8], r9
00692 4c63c1                         movsxd     r8, ecx
00695 4e8b440710                     mov        r8, qword ptr [rdi + r8 + 0x10]
0069a 4c89441f10                     mov        qword ptr [rdi + rbx + 0x10], r8
0069f 4183c310                       add        r11d, 0x10
006a3 453bda                         cmp        r11d, r10d
006a6 7cc8                           jl         0x7f982fe70d70
006a8 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
006b0 7d29                           jge        0x7f982fe70ddb
006b2 6690                           nop        
006b4 478d142b                       lea        r10d, [r11 + r13]
006b8 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
006c0 4e8b541308                     mov        r10, qword ptr [rbx + r10 + 8]
006c5 458bc3                         mov        r8d, r11d
006c8 4e89540308                     mov        qword ptr [rbx + r8 + 8], r10
006cd 4183c308                       add        r11d, 8
006d1 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
006d9 7cd9                           jl         0x7f982fe70db4
006db 4403b42480000000               add        r14d, dword ptr [rsp + 0x80]
006e3 418bde                         mov        ebx, r14d
006e6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006eb 41ffc3                         inc        r11d
006ee 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
006f3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006f7 418502                         test       dword ptr [r10], eax
006fa 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00701 48894424f8                     mov        qword ptr [rsp - 8], rax
00706 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
0070d 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00711 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00716 4c6344247c                     movsxd     r8, dword ptr [rsp + 0x7c]
0071b 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
00723 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00728 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
0072d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00732 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00737 0f8db9060000                   jge        0x7f982fe714f6
0073d 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00745 448b5b04                       mov        r11d, dword ptr [rbx + 4]
00749 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0074d 413bdb                         cmp        ebx, r11d
00750 0f83690d0000                   jae        0x7f982fe71bbf
00756 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
0075e 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00762 488b4ccb08                     mov        rcx, qword ptr [rbx + rcx*8 + 8]
00767 448bf1                         mov        r14d, ecx
0076a 4181e6ffff0100                 and        r14d, 0x1ffff
00771 4c8bd9                         mov        r11, rcx
00774 49c1fb24                       sar        r11, 0x24
00778 48c1e912                       shr        rcx, 0x12
0077c 458bdb                         mov        r11d, r11d
0077f 8bd9                           mov        ebx, ecx
00781 81e3ffff0300                   and        ebx, 0x3ffff
00787 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
0078e 4585db                         test       r11d, r11d
00791 0f8cb9120000                   jl         0x7f982fe72150
00797 4585f6                         test       r14d, r14d
0079a 0f85d4000000                   jne        0x7f982fe70f74
007a0 4533f6                         xor        r14d, r14d
007a3 4183fb03                       cmp        r11d, 3
007a7 0f8eef000000                   jle        0x7f982fe70f9c
007ad 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
007b5 448b5304                       mov        r10d, dword ptr [rbx + 4]
007b9 4183c3fd                       add        r11d, -3
007bd 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
007c5 4183fa02                       cmp        r10d, 2
007c9 0f8615100000                   jbe        0x7f982fe71ee4
007cf 448b5b0c                       mov        r11d, dword ptr [rbx + 0xc]
007d3 44895b10                       mov        dword ptr [rbx + 0x10], r11d
007d7 448b5308                       mov        r10d, dword ptr [rbx + 8]
007db 4489530c                       mov        dword ptr [rbx + 0xc], r10d
007df 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
007e7 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
007ee 41895d08                       mov        dword ptr [r13 + 8], ebx
007f2 4c639424a0000000               movsxd     r10, dword ptr [rsp + 0xa0]
007fa 4c891424                       mov        qword ptr [rsp], r10
007fe 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
00806 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
0080e 4963d6                         movsxd     rdx, r14d
00811 4c03d2                         add        r10, rdx
00814 4c8b1c24                       mov        r11, qword ptr [rsp]
00818 4d3bda                         cmp        r11, r10
0081b 0f8fa7120000                   jg         0x7f982fe721c8
00821 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00828 4103de                         add        ebx, r14d
0082b 448beb                         mov        r13d, ebx
0082e 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
00836 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0083b 4585db                         test       r11d, r11d
0083e 0f8505fbffff                   jne        0x7f982fe70a49
00844 4d63dd                         movsxd     r11, r13d
00847 4c3b9c24b0000000               cmp        r11, qword ptr [rsp + 0xb0]
0084f 0f8c03140000                   jl         0x7f982fe72358
00855 4c8b1c24                       mov        r11, qword ptr [rsp]
00859 4c3b9c24b8000000               cmp        r11, qword ptr [rsp + 0xb8]
00861 0f8f69140000                   jg         0x7f982fe723d0
00867 4533db                         xor        r11d, r11d
0086a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0086f e9e7faffff                     jmp        0x7f982fe70a5b
00874 453bf2                         cmp        r14d, r10d
00877 0f8e26ffffff                   jle        0x7f982fe70ea3
0087d be45ffffff                     mov        esi, 0xffffff45
00882 418bee                         mov        ebp, r14d
00885 44891424                       mov        dword ptr [rsp], r10d
00889 666690                         nop        
0088c c5f877                         vzeroupper 
0088f e84cb1b4ff                     call       0x7f982f9bc0e0
00894 0f1f84008c090002               nop        dword ptr [rax + rax + 0x200098c]
0089c 4585f6                         test       r14d, r14d
0089f 7407                           je         0x7f982fe70fa8
008a1 458d53ff                       lea        r10d, [r11 - 1]
008a5 458bda                         mov        r11d, r10d
008a8 4585db                         test       r11d, r11d
008ab 751d                           jne        0x7f982fe70fca
008ad 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
008b5 448b5304                       mov        r10d, dword ptr [rbx + 4]
008b9 4585d2                         test       r10d, r10d
008bc 0f86da1a0000                   jbe        0x7f982fe72a9c
008c2 8b5b08                         mov        ebx, dword ptr [rbx + 8]
008c5 e985000000                     jmp        0x7f982fe7104f
008ca 4183fb03                       cmp        r11d, 3
008ce 0f846c200000                   je         0x7f982fe73040
008d4 4183fb02                       cmp        r11d, 2
008d8 0f87ea200000                   ja         0x7f982fe730c8
008de 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
008e6 448b5304                       mov        r10d, dword ptr [rbx + 4]
008ea 453bda                         cmp        r11d, r10d
008ed 0f836d190000                   jae        0x7f982fe72960
008f3 428b5c9b08                     mov        ebx, dword ptr [rbx + r11*4 + 8]
008f8 4585db                         test       r11d, r11d
008fb 7e3d                           jle        0x7f982fe7103a
008fd 4585d2                         test       r10d, r10d
00900 0f869a1f0000                   jbe        0x7f982fe72fa0
00906 418d4bff                       lea        ecx, [r11 - 1]
0090a 413bca                         cmp        ecx, r10d
0090d 0f838d1f0000                   jae        0x7f982fe72fa0
00913 4183fa01                       cmp        r10d, 1
00917 0f86831f0000                   jbe        0x7f982fe72fa0
0091d 666690                         nop        
00920 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
00928 438b4c9d04                     mov        ecx, dword ptr [r13 + r11*4 + 4]
0092d 43894c9d08                     mov        dword ptr [r13 + r11*4 + 8], ecx
00932 41ffcb                         dec        r11d
00935 4585db                         test       r11d, r11d
00938 7fe6                           jg         0x7f982fe71020
0093a 4585d2                         test       r10d, r10d
0093d 0f86d1190000                   jbe        0x7f982fe72a14
00943 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
0094b 41895d08                       mov        dword ptr [r13 + 8], ebx
0094f 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
00956 e997feffff                     jmp        0x7f982fe70ef2
0095b 83f910                         cmp        ecx, 0x10
0095e 0f8ddb080000                   jge        0x7f982fe7193f
00964 83f908                         cmp        ecx, 8
00967 0f8d8a050000                   jge        0x7f982fe715f7
0096d 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00975 4183fa10                       cmp        r10d, 0x10
00979 0f8f7e010000                   jg         0x7f982fe711fd
0097f 443beb                         cmp        r13d, ebx
00982 0f83881a0000                   jae        0x7f982fe72b10
00988 430fbe6c2808                   movsx      ebp, byte ptr [r8 + r13 + 8]
0098e 443bf3                         cmp        r14d, ebx
00991 0f830d1b0000                   jae        0x7f982fe72ba4
00997 43886c3008                     mov        byte ptr [r8 + r14 + 8], bpl
0099c 458d5601                       lea        r10d, [r14 + 1]
009a0 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
009a8 458d4d03                       lea        r9d, [r13 + 3]
009ac 443bcb                         cmp        r9d, ebx
009af 0f83571b0000                   jae        0x7f982fe72c0c
009b5 4d63d5                         movsxd     r10, r13d
009b8 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
009be 458d4e03                       lea        r9d, [r14 + 3]
009c2 443bcb                         cmp        r9d, ebx
009c5 0f83b91b0000                   jae        0x7f982fe72c84
009cb 4963ce                         movsxd     rcx, r14d
009ce 41886c0809                     mov        byte ptr [r8 + rcx + 9], bpl
009d3 470fbe4c100a                   movsx      r9d, byte ptr [r8 + r10 + 0xa]
009d9 45884c080a                     mov        byte ptr [r8 + rcx + 0xa], r9b
009de 470fbe4c100b                   movsx      r9d, byte ptr [r8 + r10 + 0xb]
009e4 45884c080b                     mov        byte ptr [r8 + rcx + 0xb], r9b
009e9 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
009f1 4183fa08                       cmp        r10d, 8
009f5 0f83fd1b0000                   jae        0x7f982fe72cf8
009fb 49ba283827e300000000           movabs     r10, 0xe3273828
00a05 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00a0d 47036c8a08                     add        r13d, dword ptr [r10 + r9*4 + 8]
00a12 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00a1a 4183fa04                       cmp        r10d, 4
00a1e 7e64                           jle        0x7f982fe71184
00a20 8d6bfd                         lea        ebp, [rbx - 3]
00a23 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
00a2a 458d4e04                       lea        r9d, [r14 + 4]
00a2e 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00a36 85ed                           test       ebp, ebp
00a38 0f8c521d0000                   jl         0x7f982fe72e90
00a3e 448bcb                         mov        r9d, ebx
00a41 4183c1fd                       add        r9d, -3
00a45 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
00a4d 453be9                         cmp        r13d, r9d
00a50 0f832a1c0000                   jae        0x7f982fe72d80
00a56 458bd5                         mov        r10d, r13d
00a59 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00a5e 438b6c1008                     mov        ebp, dword ptr [r8 + r10 + 8]
00a63 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00a6b 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00a73 0f83a71c0000                   jae        0x7f982fe72e20
00a79 458bd6                         mov        r10d, r14d
00a7c 4d63d2                         movsxd     r10, r10d
00a7f 43896c100c                     mov        dword ptr [r8 + r10 + 0xc], ebp
00a84 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00a8c 4183f908                       cmp        r9d, 8
00a90 7e5f                           jle        0x7f982fe711f1
00a92 49b9503827e300000000           movabs     r9, 0xe3273850
00a9c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00aa4 478b4c9108                     mov        r9d, dword ptr [r9 + r10*4 + 8]
00aa9 452be9                         sub        r13d, r9d
00aac 458d5608                       lea        r10d, [r14 + 8]
00ab0 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00ab8 418d6d08                       lea        ebp, [r13 + 8]
00abc 4585db                         test       r11d, r11d
00abf 0f8c63200000                   jl         0x7f982fe73228
00ac5 83c3f9                         add        ebx, -7
00ac8 3beb                           cmp        ebp, ebx
00aca 0f83801f0000                   jae        0x7f982fe73150
00ad0 4d63d5                         movsxd     r10, r13d
00ad3 4b8b6c1010                     mov        rbp, qword ptr [r8 + r10 + 0x10]
00ad8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00ae0 443bdb                         cmp        r11d, ebx
00ae3 0f83df1f0000                   jae        0x7f982fe731c8
00ae9 4d63d6                         movsxd     r10, r14d
00aec 4b896c1010                     mov        qword ptr [r8 + r10 + 0x10], rbp
00af1 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00af8 e9e9fbffff                     jmp        0x7f982fe70de6
00afd 4585ed                         test       r13d, r13d
00b00 0f8c9a200000                   jl         0x7f982fe732a0
00b06 4585f6                         test       r14d, r14d
00b09 0f8c91200000                   jl         0x7f982fe732a0
00b0f 413bde                         cmp        ebx, r14d
00b12 0f8288200000                   jb         0x7f982fe732a0
00b18 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00b20 4503de                         add        r11d, r14d
00b23 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00b28 413bdb                         cmp        ebx, r11d
00b2b 0f826f200000                   jb         0x7f982fe732a0
00b31 85c9                           test       ecx, ecx
00b33 0f8c67200000                   jl         0x7f982fe732a0
00b39 85c9                           test       ecx, ecx
00b3b 0f8435f7ffff                   je         0x7f982fe70976
00b41 4c8b1424                       mov        r10, qword ptr [rsp]
00b45 4983fa20                       cmp        r10, 0x20
00b49 772d                           ja         0x7f982fe71278
00b4b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b53 4d63d2                         movsxd     r10, r10d
00b56 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b5d c442a8f5db                     bzhi       r11, r11, r10
00b62 c4c1fb92fb                     kmovq      k7, r11
00b67 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b6d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b73 e9fef6ffff                     jmp        0x7f982fe70976
00b78 498bd2                         mov        rdx, r10
00b7b c5f877                         vzeroupper 
00b7e 49ba204f8e2f987f0000           movabs     r10, 0x7f982f8e4f20
00b88 41ffd2                         call       r10
00b8b 0f1f840000000000               nop        dword ptr [rax + rax]
00b93 e9def6ffff                     jmp        0x7f982fe70976
00b98 4183fe30                       cmp        r14d, 0x30
00b9c 0f8eb3000000                   jle        0x7f982fe71355
00ba2 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00baa 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00bae 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00bb6 418b7204                       mov        esi, dword ptr [r10 + 4]
00bba 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00bbf 4585d2                         test       r10d, r10d
00bc2 0f8cb0220000                   jl         0x7f982fe73578
00bc8 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00bd0 4585db                         test       r11d, r11d
00bd3 0f8c9f220000                   jl         0x7f982fe73578
00bd9 3b8c2494000000                 cmp        ecx, dword ptr [rsp + 0x94]
00be0 0f8292220000                   jb         0x7f982fe73578
00be6 3bf3                           cmp        esi, ebx
00be8 0f828a220000                   jb         0x7f982fe73578
00bee 4585f6                         test       r14d, r14d
00bf1 7440                           je         0x7f982fe71333
00bf3 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00bfb 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
00c00 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c08 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00c0d 4883fa20                       cmp        rdx, 0x20
00c11 7728                           ja         0x7f982fe7133b
00c13 4d63d6                         movsxd     r10, r14d
00c16 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c1d c442a8f5db                     bzhi       r11, r11, r10
00c22 c4c1fb92fb                     kmovq      k7, r11
00c27 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c2d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c33 448bf3                         mov        r14d, ebx
00c36 e90df8ffff                     jmp        0x7f982fe70b48
00c3b c5f877                         vzeroupper 
00c3e 49ba204f8e2f987f0000           movabs     r10, 0x7f982f8e4f20
00c48 41ffd2                         call       r10
00c4b 0f1f840000000000               nop        dword ptr [rax + rax]
00c53 ebde                           jmp        0x7f982fe71333
00c55 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c5d 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00c61 8d69f1                         lea        ebp, [rcx - 0xf]
00c64 85ed                           test       ebp, ebp
00c66 0f8c84210000                   jl         0x7f982fe734f0
00c6c 8d69f1                         lea        ebp, [rcx - 0xf]
00c6f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c74 443bd5                         cmp        r10d, ebp
00c77 0f833f200000                   jae        0x7f982fe733bc
00c7d 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c85 458b4204                       mov        r8d, dword ptr [r10 + 4]
00c89 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c8e 418bc3                         mov        eax, r11d
00c91 418d68f1                       lea        ebp, [r8 - 0xf]
00c95 4d63cb                         movsxd     r9, r11d
00c98 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00ca0 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00ca7 85ed                           test       ebp, ebp
00ca9 0f8c8d220000                   jl         0x7f982fe7363c
00caf 458d58f1                       lea        r11d, [r8 - 0xf]
00cb3 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00cbb 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00cc3 453bd3                         cmp        r10d, r11d
00cc6 0f8378200000                   jae        0x7f982fe73444
00ccc 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00cd4 418bfb                         mov        edi, r11d
00cd7 4963d3                         movsxd     rdx, r11d
00cda 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00ce2 c4c17a7f441208                 vmovdqu    xmmword ptr [r10 + rdx + 8], xmm0
00ce9 458d5310                       lea        r10d, [r11 + 0x10]
00ced 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00cf2 443bd3                         cmp        r10d, ebx
00cf5 0f8dc3000000                   jge        0x7f982fe714be
00cfb 4c2bca                         sub        r9, rdx
00cfe 4c63d9                         movsxd     r11, ecx
00d01 4983c3f1                       add        r11, -0xf
00d05 4963ca                         movsxd     rcx, r10d
00d08 4e8d1409                       lea        r10, [rcx + r9]
00d0c 4d3bd3                         cmp        r10, r11
00d0f 0f83a7220000                   jae        0x7f982fe736bc
00d15 4c63d3                         movsxd     r10, ebx
00d18 4c2bd1                         sub        r10, rcx
00d1b 4983c20f                       add        r10, 0xf
00d1f 4983e2f0                       and        r10, 0xfffffffffffffff0
00d23 418bca                         mov        ecx, r10d
00d26 448d543910                     lea        r10d, [rcx + rdi + 0x10]
00d2b 4d63d2                         movsxd     r10, r10d
00d2e 4f8d4c0af0                     lea        r9, [r10 + r9 - 0x10]
00d33 4d3bcb                         cmp        r9, r11
00d36 0f8380220000                   jae        0x7f982fe736bc
00d3c 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00d41 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00d49 0f836d220000                   jae        0x7f982fe736bc
00d4f 4d63d8                         movsxd     r11, r8d
00d52 4983c2f0                       add        r10, -0x10
00d56 4983c3f1                       add        r11, -0xf
00d5a 4d3bd3                         cmp        r10, r11
00d5d 0f8359220000                   jae        0x7f982fe736bc
00d63 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00d69 0f8fb5220000                   jg         0x7f982fe73724
00d6f 448bd0                         mov        r10d, eax
00d72 442bd7                         sub        r10d, edi
00d75 6666660f1f840000000000         nop        word ptr [rax + rax]
00d80 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d85 458bca                         mov        r9d, r10d
00d88 44034c247c                     add        r9d, dword ptr [rsp + 0x7c]
00d8d 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00d95 c4817a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 8]
00d9c 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
00da4 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00dab 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00db0 4183c310                       add        r11d, 0x10
00db4 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00db9 443bdb                         cmp        r11d, ebx
00dbc 7cc2                           jl         0x7f982fe71480
00dbe 4403f0                         add        r14d, eax
00dc1 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00dc9 448bf3                         mov        r14d, ebx
00dcc e977f6ffff                     jmp        0x7f982fe70b48
00dd1 4d63d2                         movsxd     r10, r10d
00dd4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ddb c442a8f5db                     bzhi       r11, r11, r10
00de0 c4c1fb92fb                     kmovq      k7, r11
00de5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00deb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00df1 e994000000                     jmp        0x7f982fe7158a
00df6 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00dfe 448b5904                       mov        r11d, dword ptr [rcx + 4]
00e02 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
00e0a 418b7e04                       mov        edi, dword ptr [r14 + 4]
00e0e 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00e13 4585ed                         test       r13d, r13d
00e16 0f8c741e0000                   jl         0x7f982fe73390
00e1c 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00e23 85db                           test       ebx, ebx
00e25 0f8c6c1e0000                   jl         0x7f982fe73397
00e2b 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00e30 0f82611e0000                   jb         0x7f982fe73397
00e36 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00e3d 4103ea                         add        ebp, r10d
00e40 3bfd                           cmp        edi, ebp
00e42 0f824f1e0000                   jb         0x7f982fe73397
00e48 4585d2                         test       r10d, r10d
00e4b 0f8c461e0000                   jl         0x7f982fe73397
00e51 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00e55 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00e59 742f                           je         0x7f982fe7158a
00e5b 4b8d740e08                     lea        rsi, [r14 + r9 + 8]
00e60 4a8d7c0108                     lea        rdi, [rcx + r8 + 8]
00e65 4963d2                         movsxd     rdx, r10d
00e68 4883fa20                       cmp        rdx, 0x20
00e6c 0f865fffffff                   jbe        0x7f982fe714d1
00e72 c5f877                         vzeroupper 
00e75 49ba204f8e2f987f0000           movabs     r10, 0x7f982f8e4f20
00e7f 41ffd2                         call       r10
00e82 0f1f840000000000               nop        dword ptr [rax + rax]
00e8a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00e8f 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00e93 c5f877                         vzeroupper 
00e96 4881c400010000                 add        rsp, 0x100
00e9d 5d                             pop        rbp
00e9e 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ea2 0f8780280000                   ja         0x7f982fe73e28
00ea8 c3                             ret        
00ea9 448bd5                         mov        r10d, ebp
00eac 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00eb1 498bd9                         mov        rbx, r9
00eb4 448bd0                         mov        r10d, eax
00eb7 4403542468                     add        r10d, dword ptr [rsp + 0x68]
00ebc 62b17e486f841308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 8]
00ec7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00ecc 62b17e487f841b08000000         vmovdqu32  zmmword ptr [rbx + r11 + 8], zmm0
00ed7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00edc 4183c340                       add        r11d, 0x40
00ee0 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00ee5 443bd9                         cmp        r11d, ecx
00ee8 7cca                           jl         0x7f982fe715b4
00eea 48899c24e0000000               mov        qword ptr [rsp + 0xe0], rbx
00ef2 e901030000                     jmp        0x7f982fe718f8
00ef7 4585db                         test       r11d, r11d
00efa 0f8c9c220000                   jl         0x7f982fe7389c
00f00 8d6bf9                         lea        ebp, [rbx - 7]
00f03 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
00f0a 443bed                         cmp        r13d, ebp
00f0d 0f8379210000                   jae        0x7f982fe7378c
00f13 458bdd                         mov        r11d, r13d
00f16 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00f1b 4d63cb                         movsxd     r9, r11d
00f1e 4f8b540808                     mov        r10, qword ptr [r8 + r9 + 8]
00f23 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00f28 443bf5                         cmp        r14d, ebp
00f2b 0f83e7210000                   jae        0x7f982fe73818
00f31 418bfe                         mov        edi, r14d
00f34 8d6f08                         lea        ebp, [rdi + 8]
00f37 896c2468                       mov        dword ptr [rsp + 0x68], ebp
00f3b 4c63d7                         movsxd     r10, edi
00f3e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00f43 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
00f48 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00f4f 0f8dde020000                   jge        0x7f982fe71933
00f55 4d2bca                         sub        r9, r10
00f58 4863cb                         movsxd     rcx, ebx
00f5b 4883c1f9                       add        rcx, -7
00f5f 4863f5                         movsxd     rsi, ebp
00f62 4e8d140e                       lea        r10, [rsi + r9]
00f66 4c3bd1                         cmp        r10, rcx
00f69 0f83c1220000                   jae        0x7f982fe73930
00f6f 4c8bd2                         mov        r10, rdx
00f72 4c2bd6                         sub        r10, rsi
00f75 4983c207                       add        r10, 7
00f79 4983e2f8                       and        r10, 0xfffffffffffffff8
00f7d 458bda                         mov        r11d, r10d
00f80 458d543b08                     lea        r10d, [r11 + rdi + 8]
00f85 4d63d2                         movsxd     r10, r10d
00f88 4f8d5c0af8                     lea        r11, [r10 + r9 - 8]
00f8d 4c3bd9                         cmp        r11, rcx
00f90 0f839a220000                   jae        0x7f982fe73930
00f96 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
00f9d 0f838d220000                   jae        0x7f982fe73930
00fa3 4983c2f8                       add        r10, -8
00fa7 4c3bd1                         cmp        r10, rcx
00faa 0f8380220000                   jae        0x7f982fe73930
00fb0 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00fb7 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00fbd 0f8ffd220000                   jg         0x7f982fe739c0
00fc3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00fc8 442bdf                         sub        r11d, edi
00fcb 418bc3                         mov        eax, r11d
00fce 4d8bd8                         mov        r11, r8
00fd1 4c8d52c8                       lea        r10, [rdx - 0x38]
00fd5 4981fa00000080                 cmp        r10, -0x80000000
00fdc 49c7c100000080                 mov        r9, 0xffffffff80000000
00fe3 4d0f4cd1                       cmovl      r10, r9
00fe7 418bca                         mov        ecx, r10d
00fea 452bee                         sub        r13d, r14d
00fed 41baf8ffffff                   mov        r10d, 0xfffffff8
00ff3 8d5f10                         lea        ebx, [rdi + 0x10]
00ff6 458bc8                         mov        r9d, r8d
00ff9 452bd1                         sub        r10d, r9d
00ffc 442bd7                         sub        r10d, edi
00fff 4183c2f0                       add        r10d, -0x10
01003 4c63cb                         movsxd     r9, ebx
01006 bf06000000                     mov        edi, 6
0100b c442c0f5d2                     bzhi       r10, r10, rdi
01010 4d03ca                         add        r9, r10
01013 4c3bca                         cmp        r9, rdx
01016 488bfa                         mov        rdi, rdx
01019 490f4cf9                       cmovl      rdi, r9
0101d 4c8bd7                         mov        r10, rdi
01020 4c2bd6                         sub        r10, rsi
01023 4d8d4aff                       lea        r9, [r10 - 1]
01027 49c1f93f                       sar        r9, 0x3f
0102b 49c1e93d                       shr        r9, 0x3d
0102f 4f8d5411ff                     lea        r10, [r9 + r10 - 1]
01034 4983e2f8                       and        r10, 0xfffffffffffffff8
01038 4c03d6                         add        r10, rsi
0103b 493bf2                         cmp        rsi, r10
0103e 490f4cf2                       cmovl      rsi, r10
01042 448bce                         mov        r9d, esi
01045 478d540d08                     lea        r10d, [r13 + r9 + 8]
0104a 4183c108                       add        r9d, 8
0104e 4963f2                         movsxd     rsi, r10d
01051 4903f3                         add        rsi, r11
01054 4963e9                         movsxd     rbp, r9d
01057 4903eb                         add        rbp, r11
0105a 4c8d5e08                       lea        r11, [rsi + 8]
0105e 4883c648                       add        rsi, 0x48
01062 4c8d4d48                       lea        r9, [rbp + 0x48]
01066 4533d2                         xor        r10d, r10d
01069 4d3bcb                         cmp        r9, r11
0106c 410f96c2                       setbe      r10b
01070 4883c508                       add        rbp, 8
01074 4533c9                         xor        r9d, r9d
01077 483bf5                         cmp        rsi, rbp
0107a 410f96c1                       setbe      r9b
0107e 450bd1                         or         r10d, r9d
01081 0f84c5100000                   je         0x7f982fe7284c
01087 448bd7                         mov        r10d, edi
0108a 6690                           nop        
0108c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01091 448bd8                         mov        r11d, eax
01094 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
01099 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0109e 4f895c0808                     mov        qword ptr [r8 + r9 + 8], r11
010a3 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
010a7 83c508                         add        ebp, 8
010aa 896c2468                       mov        dword ptr [rsp + 0x68], ebp
010ae 413bea                         cmp        ebp, r10d
010b1 7cd9                           jl         0x7f982fe7178c
010b3 4881c208feffff                 add        rdx, -0x1f8
010ba 4881fa00000080                 cmp        rdx, -0x80000000
010c1 49c7c200000080                 mov        r10, 0xffffffff80000000
010c8 490f4cd2                       cmovl      rdx, r10
010cc 8bda                           mov        ebx, edx
010ce 3beb                           cmp        ebp, ebx
010d0 0f8d6a220000                   jge        0x7f982fe73a40
010d6 896c2468                       mov        dword ptr [rsp + 0x68], ebp
010da 4d8bc8                         mov        r9, r8
010dd 666690                         nop        
010e0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
010e5 4963fb                         movsxd     rdi, r11d
010e8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
010ed 448bd8                         mov        r11d, eax
010f0 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
010f5 8b542468                       mov        edx, dword ptr [rsp + 0x68]
010f9 81c280000000                   add        edx, 0x80
010ff 03d0                           add        edx, eax
01101 458bc3                         mov        r8d, r11d
01104 62917e486f840108000000         vmovdqu32  zmm0, zmmword ptr [r9 + r8 + 8]
0110f 62917e487f841108000000         vmovdqu32  zmmword ptr [r9 + r10 + 8], zmm0
0111a 4963f3                         movsxd     rsi, r11d
0111d 62d17e486f843148000000         vmovdqu32  zmm0, zmmword ptr [r9 + rsi + 0x48]
01128 62d17e487f843948000000         vmovdqu32  zmmword ptr [r9 + rdi + 0x48], zmm0
01133 448bda                         mov        r11d, edx
01136 62917e486f841908000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 8]
01141 62d17e487f843988000000         vmovdqu32  zmmword ptr [r9 + rdi + 0x88], zmm0
0114c 4c63d2                         movsxd     r10, edx
0114f 62917e486f841148000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0x48]
0115a 62d17e487f8439c8000000         vmovdqu32  zmmword ptr [r9 + rdi + 0xc8], zmm0
01165 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0116a 4181c200010000                 add        r10d, 0x100
01171 4403d0                         add        r10d, eax
01174 458bc2                         mov        r8d, r10d
01177 62917e486f841108000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 8]
01182 62d17e487f843908010000         vmovdqu32  zmmword ptr [r9 + rdi + 0x108], zmm0
0118d 4d63d0                         movsxd     r10, r8d
01190 62917e486f841148000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0x48]
0119b 62d17e487f843948010000         vmovdqu32  zmmword ptr [r9 + rdi + 0x148], zmm0
011a6 62d17e486f843188010000         vmovdqu32  zmm0, zmmword ptr [r9 + rsi + 0x188]
011b1 62d17e487f843988010000         vmovdqu32  zmmword ptr [r9 + rdi + 0x188], zmm0
011bc 62d17e486f8431c8010000         vmovdqu32  zmm0, zmmword ptr [r9 + rsi + 0x1c8]
011c7 62d17e487f8439c8010000         vmovdqu32  zmmword ptr [r9 + rdi + 0x1c8], zmm0
011d2 8b6c2468                       mov        ebp, dword ptr [rsp + 0x68]
011d6 81c500020000                   add        ebp, 0x200
011dc 896c2468                       mov        dword ptr [rsp + 0x68], ebp
011e0 3beb                           cmp        ebp, ebx
011e2 0f8cf8feffff                   jl         0x7f982fe717e0
011e8 3be9                           cmp        ebp, ecx
011ea 0f8cb9fcffff                   jl         0x7f982fe715a9
011f0 4c898c24e0000000               mov        qword ptr [rsp + 0xe0], r9
011f8 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
011fd 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
01205 7d2c                           jge        0x7f982fe71933
01207 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0120c 468d1c10                       lea        r11d, [rax + r10]
01210 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
01218 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
0121d 458bc2                         mov        r8d, r10d
01220 4e895c0308                     mov        qword ptr [rbx + r8 + 8], r11
01225 4183c208                       add        r10d, 8
01229 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01231 7cd9                           jl         0x7f982fe7190c
01233 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0123a e9a7f4ffff                     jmp        0x7f982fe70de6
0123f 4585d2                         test       r10d, r10d
01242 0f8c24220000                   jl         0x7f982fe73b6c
01248 448d5bf1                       lea        r11d, [rbx - 0xf]
0124c 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01251 453beb                         cmp        r13d, r11d
01254 0f83f3200000                   jae        0x7f982fe73a4d
0125a 4d63d5                         movsxd     r10, r13d
0125d c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
01264 453bf3                         cmp        r14d, r11d
01267 0f836b210000                   jae        0x7f982fe73ad8
0126d 418d6e10                       lea        ebp, [r14 + 0x10]
01271 4d63de                         movsxd     r11, r14d
01274 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
0127b 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01282 0f8d2b020000                   jge        0x7f982fe71bb3
01288 4d2bd3                         sub        r10, r11
0128b 4863cb                         movsxd     rcx, ebx
0128e 4883c1f1                       add        rcx, -0xf
01292 4c63cd                         movsxd     r9, ebp
01295 4f8d1c11                       lea        r11, [r9 + r10]
01299 4c3bd9                         cmp        r11, rcx
0129c 0f835a220000                   jae        0x7f982fe73bfc
012a2 4c8bda                         mov        r11, rdx
012a5 4d2bd9                         sub        r11, r9
012a8 4983c30f                       add        r11, 0xf
012ac 4983e3f0                       and        r11, 0xfffffffffffffff0
012b0 458bcb                         mov        r9d, r11d
012b3 478d5c3110                     lea        r11d, [r9 + r14 + 0x10]
012b8 4d63db                         movsxd     r11, r11d
012bb 4f8d5413f0                     lea        r10, [r11 + r10 - 0x10]
012c0 4c3bd1                         cmp        r10, rcx
012c3 0f8333220000                   jae        0x7f982fe73bfc
012c9 3b6c2478                       cmp        ebp, dword ptr [rsp + 0x78]
012cd 0f8329220000                   jae        0x7f982fe73bfc
012d3 4983c3f0                       add        r11, -0x10
012d7 4c3bd9                         cmp        r11, rcx
012da 0f831c220000                   jae        0x7f982fe73bfc
012e0 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
012e8 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
012ef 0f8f7b220000                   jg         0x7f982fe73c70
012f5 452bee                         sub        r13d, r14d
012f8 4183c620                       add        r14d, 0x20
012fc 448bd5                         mov        r10d, ebp
012ff 458bc5                         mov        r8d, r13d
01302 4403c5                         add        r8d, ebp
01305 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0130d c4a17a6f440308                 vmovdqu    xmm0, xmmword ptr [rbx + r8 + 8]
01314 c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
0131b 83c510                         add        ebp, 0x10
0131e 413bee                         cmp        ebp, r14d
01321 7cd9                           jl         0x7f982fe719fc
01323 4881c210ffffff                 add        rdx, -0xf0
0132a 4881fa00000080                 cmp        rdx, -0x80000000
01331 49c7c200000080                 mov        r10, 0xffffffff80000000
01338 490f4cd2                       cmovl      rdx, r10
0133c 448bd2                         mov        r10d, edx
0133f 413bea                         cmp        ebp, r10d
01342 0f8d35010000                   jge        0x7f982fe71b7d
01348 0f1f840000000000               nop        dword ptr [rax + rax]
01350 448bc5                         mov        r8d, ebp
01353 4963c8                         movsxd     rcx, r8d
01356 448bdd                         mov        r11d, ebp
01359 458bcd                         mov        r9d, r13d
0135c 4403cd                         add        r9d, ebp
0135f 458bc1                         mov        r8d, r9d
01362 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0136a c4a17a6f440b08                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 8]
01371 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
01378 4d63d8                         movsxd     r11, r8d
0137b c4a17a6f441b18                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x18]
01382 c5fa7f440b18                   vmovdqu    xmmword ptr [rbx + rcx + 0x18], xmm0
01388 c4a17a6f441b28                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x28]
0138f c5fa7f440b28                   vmovdqu    xmmword ptr [rbx + rcx + 0x28], xmm0
01395 c4a17a6f441b38                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x38]
0139c c5fa7f440b38                   vmovdqu    xmmword ptr [rbx + rcx + 0x38], xmm0
013a2 c4a17a6f441b48                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x48]
013a9 c5fa7f440b48                   vmovdqu    xmmword ptr [rbx + rcx + 0x48], xmm0
013af c4a17a6f441b58                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x58]
013b6 c5fa7f440b58                   vmovdqu    xmmword ptr [rbx + rcx + 0x58], xmm0
013bc c4a17a6f441b68                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x68]
013c3 c5fa7f440b68                   vmovdqu    xmmword ptr [rbx + rcx + 0x68], xmm0
013c9 c4a17a6f441b78                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x78]
013d0 c5fa7f440b78                   vmovdqu    xmmword ptr [rbx + rcx + 0x78], xmm0
013d6 c4a17a6f841b88000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x88]
013e0 c5fa7f840b88000000             vmovdqu    xmmword ptr [rbx + rcx + 0x88], xmm0
013e9 c4a17a6f841b98000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x98]
013f3 c5fa7f840b98000000             vmovdqu    xmmword ptr [rbx + rcx + 0x98], xmm0
013fc c4a17a6f841ba8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xa8]
01406 c5fa7f840ba8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xa8], xmm0
0140f c4a17a6f841bb8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xb8]
01419 c5fa7f840bb8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xb8], xmm0
01422 c4a17a6f841bc8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc8]
0142c c5fa7f840bc8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xc8], xmm0
01435 c4a17a6f841bd8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xd8]
0143f c5fa7f840bd8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xd8], xmm0
01448 c4a17a6f841be8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xe8]
01452 c5fa7f840be8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xe8], xmm0
0145b c4a17a6f841bf8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xf8]
01465 c5fa7f840bf8000000             vmovdqu    xmmword ptr [rbx + rcx + 0xf8], xmm0
0146e 81c500010000                   add        ebp, 0x100
01474 413bea                         cmp        ebp, r10d
01477 0f8cd3feffff                   jl         0x7f982fe71a50
0147d 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01484 7d2d                           jge        0x7f982fe71bb3
01486 6690                           nop        
01488 458bd5                         mov        r10d, r13d
0148b 4403d5                         add        r10d, ebp
0148e 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
01496 c4a17a6f441308                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 8]
0149d 448bdd                         mov        r11d, ebp
014a0 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
014a7 83c510                         add        ebp, 0x10
014aa 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
014b1 7cd5                           jl         0x7f982fe71b88
014b3 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
014ba e927f2ffff                     jmp        0x7f982fe70de6
014bf bee4ffffff                     mov        esi, 0xffffffe4
014c4 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014c9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ce 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014d2 89442408                       mov        dword ptr [rsp + 8], eax
014d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014db 48ff742420                     push       qword ptr [rsp + 0x20]
014e0 488f442418                     pop        qword ptr [rsp + 0x18]
014e5 48894424f8                     mov        qword ptr [rsp - 8], rax
014ea 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014ee 8944240c                       mov        dword ptr [rsp + 0xc], eax
014f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f7 48894424f8                     mov        qword ptr [rsp - 8], rax
014fc 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01500 89442438                       mov        dword ptr [rsp + 0x38], eax
01504 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01509 48894424f8                     mov        qword ptr [rsp - 8], rax
0150e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01512 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01516 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151b 90                             nop        
0151c c5f877                         vzeroupper 
0151f e8bca4b4ff                     call       0x7f982f9bc0e0
01524 0f1f84001c160003               nop        dword ptr [rax + rax + 0x300161c]
0152c bee4ffffff                     mov        esi, 0xffffffe4
01531 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01536 48894424f8                     mov        qword ptr [rsp - 8], rax
0153b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0153f 89442408                       mov        dword ptr [rsp + 8], eax
01543 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01548 48ff742420                     push       qword ptr [rsp + 0x20]
0154d 488f442418                     pop        qword ptr [rsp + 0x18]
01552 48894424f8                     mov        qword ptr [rsp - 8], rax
01557 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0155b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0155f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01564 48894424f8                     mov        qword ptr [rsp - 8], rax
01569 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0156d 89442438                       mov        dword ptr [rsp + 0x38], eax
01571 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01576 48894424f8                     mov        qword ptr [rsp - 8], rax
0157b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0157f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01583 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01588 48894424f8                     mov        qword ptr [rsp - 8], rax
0158d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01591 89442460                       mov        dword ptr [rsp + 0x60], eax
01595 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0159f 48894424f8                     mov        qword ptr [rsp - 8], rax
015a4 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
015a8 89442478                       mov        dword ptr [rsp + 0x78], eax
015ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
015b6 6690                           nop        
015b8 c5f877                         vzeroupper 
015bb e820a4b4ff                     call       0x7f982f9bc0e0
015c0 0f1f8400b8160004               nop        dword ptr [rax + rax + 0x40016b8]
015c8 bee4ffffff                     mov        esi, 0xffffffe4
015cd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015d2 48894424f8                     mov        qword ptr [rsp - 8], rax
015d7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015db 89442408                       mov        dword ptr [rsp + 8], eax
015df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e4 48ff742420                     push       qword ptr [rsp + 0x20]
015e9 488f442418                     pop        qword ptr [rsp + 0x18]
015ee 48894424f8                     mov        qword ptr [rsp - 8], rax
015f3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015f7 8944240c                       mov        dword ptr [rsp + 0xc], eax
015fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01600 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01604 48894424f8                     mov        qword ptr [rsp - 8], rax
01609 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0160d 89442438                       mov        dword ptr [rsp + 0x38], eax
01611 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01616 48894424f8                     mov        qword ptr [rsp - 8], rax
0161b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0161f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01623 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01628 48894424f8                     mov        qword ptr [rsp - 8], rax
0162d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01631 89442460                       mov        dword ptr [rsp + 0x60], eax
01635 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163a 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0163f 48894424f8                     mov        qword ptr [rsp - 8], rax
01644 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0164b 89442468                       mov        dword ptr [rsp + 0x68], eax
0164f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01654 48894424f8                     mov        qword ptr [rsp - 8], rax
01659 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01660 89442478                       mov        dword ptr [rsp + 0x78], eax
01664 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01669 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0166e c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01677 90                             nop        
01678 c5f877                         vzeroupper 
0167b e860a3b4ff                     call       0x7f982f9bc0e0
01680 0f1f840078170005               nop        dword ptr [rax + rax + 0x5001778]
01688 beccffffff                     mov        esi, 0xffffffcc
0168d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
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
016d2 48894424f8                     mov        qword ptr [rsp - 8], rax
016d7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
016db 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e4 48894424f8                     mov        qword ptr [rsp - 8], rax
016e9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
016ed 89442460                       mov        dword ptr [rsp + 0x60], eax
016f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f6 4489742464                     mov        dword ptr [rsp + 0x64], r14d
016fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01700 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01704 89442478                       mov        dword ptr [rsp + 0x78], eax
01708 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170d 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01712 6690                           nop        
01714 c5f877                         vzeroupper 
01717 e8c4a2b4ff                     call       0x7f982f9bc0e0
0171c 0f1f840014180006               nop        dword ptr [rax + rax + 0x6001814]
01724 beccffffff                     mov        esi, 0xffffffcc
01729 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0172e 48894424f8                     mov        qword ptr [rsp - 8], rax
01733 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01737 89442408                       mov        dword ptr [rsp + 8], eax
0173b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01740 48ff742420                     push       qword ptr [rsp + 0x20]
01745 488f442418                     pop        qword ptr [rsp + 0x18]
0174a 48894424f8                     mov        qword ptr [rsp - 8], rax
0174f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01753 8944240c                       mov        dword ptr [rsp + 0xc], eax
01757 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175c 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01760 48894424f8                     mov        qword ptr [rsp - 8], rax
01765 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01769 89442438                       mov        dword ptr [rsp + 0x38], eax
0176d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01772 48894424f8                     mov        qword ptr [rsp - 8], rax
01777 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0177b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0177f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01784 48894424f8                     mov        qword ptr [rsp - 8], rax
01789 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0178d 89442460                       mov        dword ptr [rsp + 0x60], eax
01791 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01796 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0179b 48894424f8                     mov        qword ptr [rsp - 8], rax
017a0 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
017a7 89442468                       mov        dword ptr [rsp + 0x68], eax
017ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b0 48894424f8                     mov        qword ptr [rsp - 8], rax
017b5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
017bc 89442478                       mov        dword ptr [rsp + 0x78], eax
017c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
017ca c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
017d3 90                             nop        
017d4 c5f877                         vzeroupper 
017d7 e804a2b4ff                     call       0x7f982f9bc0e0
017dc 0f1f8400d4180007               nop        dword ptr [rax + rax + 0x70018d4]
017e4 bee4ffffff                     mov        esi, 0xffffffe4
017e9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ee 48894424f8                     mov        qword ptr [rsp - 8], rax
017f3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017f7 89442408                       mov        dword ptr [rsp + 8], eax
017fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01800 48ff742420                     push       qword ptr [rsp + 0x20]
01805 488f442418                     pop        qword ptr [rsp + 0x18]
0180a 48894424f8                     mov        qword ptr [rsp - 8], rax
0180f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01813 8944240c                       mov        dword ptr [rsp + 0xc], eax
01817 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181c 48894424f8                     mov        qword ptr [rsp - 8], rax
01821 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01825 89442434                       mov        dword ptr [rsp + 0x34], eax
01829 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182e 48894424f8                     mov        qword ptr [rsp - 8], rax
01833 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01837 89442438                       mov        dword ptr [rsp + 0x38], eax
0183b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01840 48894424f8                     mov        qword ptr [rsp - 8], rax
01845 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01849 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0184d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01852 48894424f8                     mov        qword ptr [rsp - 8], rax
01857 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0185b 89442460                       mov        dword ptr [rsp + 0x60], eax
0185f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01864 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01869 666690                         nop        
0186c c5f877                         vzeroupper 
0186f e86ca1b4ff                     call       0x7f982f9bc0e0
01874 0f1f84006c190008               nop        dword ptr [rax + rax + 0x800196c]
0187c bee4ffffff                     mov        esi, 0xffffffe4
01881 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01886 48894424f8                     mov        qword ptr [rsp - 8], rax
0188b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0188f 89442408                       mov        dword ptr [rsp + 8], eax
01893 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01898 48ff742420                     push       qword ptr [rsp + 0x20]
0189d 488f442418                     pop        qword ptr [rsp + 0x18]
018a2 48894424f8                     mov        qword ptr [rsp - 8], rax
018a7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018ab 8944240c                       mov        dword ptr [rsp + 0xc], eax
018af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b4 4489742430                     mov        dword ptr [rsp + 0x30], r14d
018b9 48894424f8                     mov        qword ptr [rsp - 8], rax
018be 8b442440                       mov        eax, dword ptr [rsp + 0x40]
018c2 89442438                       mov        dword ptr [rsp + 0x38], eax
018c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018cb 48894424f8                     mov        qword ptr [rsp - 8], rax
018d0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018d4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018dd 48894424f8                     mov        qword ptr [rsp - 8], rax
018e2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018e6 89442460                       mov        dword ptr [rsp + 0x60], eax
018ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ef 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
018f4 895c2474                       mov        dword ptr [rsp + 0x74], ebx
018f8 c5f877                         vzeroupper 
018fb e8e0a0b4ff                     call       0x7f982f9bc0e0
01900 0f1f8400f8190009               nop        dword ptr [rax + rax + 0x90019f8]
01908 bee4ffffff                     mov        esi, 0xffffffe4
0190d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01912 48894424f8                     mov        qword ptr [rsp - 8], rax
01917 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0191b 89442408                       mov        dword ptr [rsp + 8], eax
0191f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01924 48ff742420                     push       qword ptr [rsp + 0x20]
01929 488f442418                     pop        qword ptr [rsp + 0x18]
0192e 48894424f8                     mov        qword ptr [rsp - 8], rax
01933 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01937 8944240c                       mov        dword ptr [rsp + 0xc], eax
0193b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01940 48894424f8                     mov        qword ptr [rsp - 8], rax
01945 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01949 89442438                       mov        dword ptr [rsp + 0x38], eax
0194d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01952 48894424f8                     mov        qword ptr [rsp - 8], rax
01957 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0195b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0195f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01964 48894424f8                     mov        qword ptr [rsp - 8], rax
01969 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0196d 89442460                       mov        dword ptr [rsp + 0x60], eax
01971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01976 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0197b 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01980 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01984 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0198d 666690                         nop        
01990 c5f877                         vzeroupper 
01993 e848a0b4ff                     call       0x7f982f9bc0e0
01998 0f1f8400901a000a               nop        dword ptr [rax + rax + 0xa001a90]
019a0 beccffffff                     mov        esi, 0xffffffcc
019a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019aa 48894424f8                     mov        qword ptr [rsp - 8], rax
019af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019b3 89442408                       mov        dword ptr [rsp + 8], eax
019b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019bc 48ff742420                     push       qword ptr [rsp + 0x20]
019c1 488f442418                     pop        qword ptr [rsp + 0x18]
019c6 48894424f8                     mov        qword ptr [rsp - 8], rax
019cb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019cf 8944240c                       mov        dword ptr [rsp + 0xc], eax
019d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d8 4489742430                     mov        dword ptr [rsp + 0x30], r14d
019dd 48894424f8                     mov        qword ptr [rsp - 8], rax
019e2 8b442440                       mov        eax, dword ptr [rsp + 0x40]
019e6 89442438                       mov        dword ptr [rsp + 0x38], eax
019ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ef 48894424f8                     mov        qword ptr [rsp - 8], rax
019f4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019f8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a01 48894424f8                     mov        qword ptr [rsp - 8], rax
01a06 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a0a 89442460                       mov        dword ptr [rsp + 0x60], eax
01a0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a13 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01a18 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01a1d 666690                         nop        
01a20 c5f877                         vzeroupper 
01a23 e8b89fb4ff                     call       0x7f982f9bc0e0
01a28 0f1f8400201b000b               nop        dword ptr [rax + rax + 0xb001b20]
01a30 be45ffffff                     mov        esi, 0xffffff45
01a35 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a3a 4c89542408                     mov        qword ptr [rsp + 8], r10
01a3f 90                             nop        
01a40 c5f877                         vzeroupper 
01a43 e8989fb4ff                     call       0x7f982f9bc0e0
01a48 0f1f8400401b000c               nop        dword ptr [rax + rax + 0xc001b40]
01a50 be45ffffff                     mov        esi, 0xffffff45
01a55 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a63 89442408                       mov        dword ptr [rsp + 8], eax
01a67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6c 48ff742420                     push       qword ptr [rsp + 0x20]
01a71 488f442418                     pop        qword ptr [rsp + 0x18]
01a76 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a7f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a88 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01a91 89442438                       mov        dword ptr [rsp + 0x38], eax
01a95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01aa3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01aa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aac 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01ab1 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01ab6 6690                           nop        
01ab8 c5f877                         vzeroupper 
01abb e8209fb4ff                     call       0x7f982f9bc0e0
01ac0 0f1f8400b81b000d               nop        dword ptr [rax + rax + 0xd001bb8]
01ac8 4d3bda                         cmp        r11, r10
01acb bdffffffff                     mov        ebp, 0xffffffff
01ad0 7c08                           jl         0x7f982fe721da
01ad2 400f95c5                       setne      bpl
01ad6 400fb6ed                       movzx      ebp, bpl
01ada be45ffffff                     mov        esi, 0xffffff45
01adf 48ff742408                     push       qword ptr [rsp + 8]
01ae4 488f0424                       pop        qword ptr [rsp]
01ae8 48894424f8                     mov        qword ptr [rsp - 8], rax
01aed 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01af1 89442414                       mov        dword ptr [rsp + 0x14], eax
01af5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afa 48894424f8                     mov        qword ptr [rsp - 8], rax
01aff 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01b03 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b11 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b15 89442444                       mov        dword ptr [rsp + 0x44], eax
01b19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b23 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b27 89442468                       mov        dword ptr [rsp + 0x68], eax
01b2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b30 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01b35 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01b3a 6690                           nop        
01b3c c5f877                         vzeroupper 
01b3f e89c9eb4ff                     call       0x7f982f9bc0e0
01b44 0f1f84003c1c000e               nop        dword ptr [rax + rax + 0xe001c3c]
01b4c be45ffffff                     mov        esi, 0xffffff45
01b51 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b56 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b5f 89442408                       mov        dword ptr [rsp + 8], eax
01b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b68 48ff742420                     push       qword ptr [rsp + 0x20]
01b6d 488f442418                     pop        qword ptr [rsp + 0x18]
01b72 48894424f8                     mov        qword ptr [rsp - 8], rax
01b77 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b7b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b84 48894424f8                     mov        qword ptr [rsp - 8], rax
01b89 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01b8d 89442438                       mov        dword ptr [rsp + 0x38], eax
01b91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b96 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01b9f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ba3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bad 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01bb1 89442460                       mov        dword ptr [rsp + 0x60], eax
01bb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bba 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01bbf 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01bc4 c5f877                         vzeroupper 
01bc7 e8149eb4ff                     call       0x7f982f9bc0e0
01bcc 0f1f8400c41c000f               nop        dword ptr [rax + rax + 0xf001cc4]
01bd4 be45ffffff                     mov        esi, 0xffffff45
01bd9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01bde 48894424f8                     mov        qword ptr [rsp - 8], rax
01be3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01be7 89442408                       mov        dword ptr [rsp + 8], eax
01beb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf0 48ff742420                     push       qword ptr [rsp + 0x20]
01bf5 488f442418                     pop        qword ptr [rsp + 0x18]
01bfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01bff 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c03 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c11 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01c15 89442438                       mov        dword ptr [rsp + 0x38], eax
01c19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c23 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01c27 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c30 48894424f8                     mov        qword ptr [rsp - 8], rax
01c35 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c39 89442460                       mov        dword ptr [rsp + 0x60], eax
01c3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c42 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01c47 90                             nop        
01c48 c5f877                         vzeroupper 
01c4b e8909db4ff                     call       0x7f982f9bc0e0
01c50 0f1f8400481d0010               nop        dword ptr [rax + rax + 0x10001d48]
01c58 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
01c60 4d3bd8                         cmp        r11, r8
01c63 bdffffffff                     mov        ebp, 0xffffffff
01c68 7c08                           jl         0x7f982fe72372
01c6a 400f95c5                       setne      bpl
01c6e 400fb6ed                       movzx      ebp, bpl
01c72 be45ffffff                     mov        esi, 0xffffff45
01c77 48ff742408                     push       qword ptr [rsp + 8]
01c7c 488f0424                       pop        qword ptr [rsp]
01c80 48894424f8                     mov        qword ptr [rsp - 8], rax
01c85 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c89 89442414                       mov        dword ptr [rsp + 0x14], eax
01c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c92 48894424f8                     mov        qword ptr [rsp - 8], rax
01c97 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01c9b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01cad 89442464                       mov        dword ptr [rsp + 0x64], eax
01cb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb6 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01cbb 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01cc0 c5f877                         vzeroupper 
01cc3 e8189db4ff                     call       0x7f982f9bc0e0
01cc8 0f1f8400c01d0011               nop        dword ptr [rax + rax + 0x11001dc0]
01cd0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
01cd8 4d3bd8                         cmp        r11, r8
01cdb bdffffffff                     mov        ebp, 0xffffffff
01ce0 7c08                           jl         0x7f982fe723ea
01ce2 400f95c5                       setne      bpl
01ce6 400fb6ed                       movzx      ebp, bpl
01cea be45ffffff                     mov        esi, 0xffffff45
01cef 48ff742408                     push       qword ptr [rsp + 8]
01cf4 488f0424                       pop        qword ptr [rsp]
01cf8 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d01 89442414                       mov        dword ptr [rsp + 0x14], eax
01d05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01d13 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d21 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d25 89442464                       mov        dword ptr [rsp + 0x64], eax
01d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2e 4489742468                     mov        dword ptr [rsp + 0x68], r14d
01d33 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01d38 c5f877                         vzeroupper 
01d3b e8a09cb4ff                     call       0x7f982f9bc0e0
01d40 0f1f8400381e0012               nop        dword ptr [rax + rax + 0x12001e38]
01d48 bee4ffffff                     mov        esi, 0xffffffe4
01d4d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d52 48894424f8                     mov        qword ptr [rsp - 8], rax
01d57 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d5b 89442408                       mov        dword ptr [rsp + 8], eax
01d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d64 48ff742420                     push       qword ptr [rsp + 0x20]
01d69 488f442418                     pop        qword ptr [rsp + 0x18]
01d6e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d73 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d77 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d80 48894424f8                     mov        qword ptr [rsp - 8], rax
01d85 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01d89 89442438                       mov        dword ptr [rsp + 0x38], eax
01d8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d92 48894424f8                     mov        qword ptr [rsp - 8], rax
01d97 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01d9b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da4 48894424f8                     mov        qword ptr [rsp - 8], rax
01da9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01dad 89442460                       mov        dword ptr [rsp + 0x60], eax
01db1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db6 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01dbb 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01dc0 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01dc5 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01dcd 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01dd5 666690                         nop        
01dd8 c5f877                         vzeroupper 
01ddb e8009cb4ff                     call       0x7f982f9bc0e0
01de0 0f1f8400d81e0013               nop        dword ptr [rax + rax + 0x13001ed8]
01de8 bee4ffffff                     mov        esi, 0xffffffe4
01ded 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01df2 48894424f8                     mov        qword ptr [rsp - 8], rax
01df7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01dfb 89442408                       mov        dword ptr [rsp + 8], eax
01dff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e04 48ff742420                     push       qword ptr [rsp + 0x20]
01e09 488f442418                     pop        qword ptr [rsp + 0x18]
01e0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e13 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e17 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e20 48894424f8                     mov        qword ptr [rsp - 8], rax
01e25 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01e29 89442438                       mov        dword ptr [rsp + 0x38], eax
01e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e32 48894424f8                     mov        qword ptr [rsp - 8], rax
01e37 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01e3b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e44 48894424f8                     mov        qword ptr [rsp - 8], rax
01e49 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e4d 89442460                       mov        dword ptr [rsp + 0x60], eax
01e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e56 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01e5b 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01e60 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01e65 48894c2478                     mov        qword ptr [rsp + 0x78], rcx
01e6a 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01e6f 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01e77 90                             nop        
01e78 c5f877                         vzeroupper 
01e7b e8609bb4ff                     call       0x7f982f9bc0e0
01e80 0f1f8400781f0014               nop        dword ptr [rax + rax + 0x14001f78]
01e88 beccffffff                     mov        esi, 0xffffffcc
01e8d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e92 48894424f8                     mov        qword ptr [rsp - 8], rax
01e97 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e9b 89442408                       mov        dword ptr [rsp + 8], eax
01e9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea4 48ff742420                     push       qword ptr [rsp + 0x20]
01ea9 488f442418                     pop        qword ptr [rsp + 0x18]
01eae 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01eb7 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ebb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01ec9 89442438                       mov        dword ptr [rsp + 0x38], eax
01ecd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01edb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01edf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01eed 89442460                       mov        dword ptr [rsp + 0x60], eax
01ef1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef6 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01efb 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01f00 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f05 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01f0d 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
01f15 666690                         nop        
01f18 c5f877                         vzeroupper 
01f1b e8c09ab4ff                     call       0x7f982f9bc0e0
01f20 0f1f840018200015               nop        dword ptr [rax + rax + 0x15002018]
01f28 4183c508                       add        r13d, 8
01f2c be6effffff                     mov        esi, 0xffffff6e
01f31 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f36 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01f3f 89442408                       mov        dword ptr [rsp + 8], eax
01f43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f48 48ff742420                     push       qword ptr [rsp + 0x20]
01f4d 488f442418                     pop        qword ptr [rsp + 0x18]
01f52 48894424f8                     mov        qword ptr [rsp - 8], rax
01f57 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f5b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f64 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01f69 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
01f72 89442438                       mov        dword ptr [rsp + 0x38], eax
01f76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f80 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01f84 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f92 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f96 89442460                       mov        dword ptr [rsp + 0x60], eax
01f9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa4 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01fab 89442468                       mov        dword ptr [rsp + 0x68], eax
01faf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb4 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01fb9 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01fbe 6690                           nop        
01fc0 c5f877                         vzeroupper 
01fc3 e8189ab4ff                     call       0x7f982f9bc0e0
01fc8 0f1f8400c0200016               nop        dword ptr [rax + rax + 0x160020c0]
01fd0 4183c508                       add        r13d, 8
01fd4 be66ffffff                     mov        esi, 0xffffff66
01fd9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01fde 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fe7 89442408                       mov        dword ptr [rsp + 8], eax
01feb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ff0 48ff742420                     push       qword ptr [rsp + 0x20]
01ff5 488f442418                     pop        qword ptr [rsp + 0x18]
01ffa 48894424f8                     mov        qword ptr [rsp - 8], rax
01fff 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02003 8944240c                       mov        dword ptr [rsp + 0xc], eax
02007 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
02011 48894424f8                     mov        qword ptr [rsp - 8], rax
02016 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0201a 89442438                       mov        dword ptr [rsp + 0x38], eax
0201e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02023 48894424f8                     mov        qword ptr [rsp - 8], rax
02028 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0202c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02030 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02035 48894424f8                     mov        qword ptr [rsp - 8], rax
0203a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0203e 89442460                       mov        dword ptr [rsp + 0x60], eax
02042 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02047 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
0204c 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
02051 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02055 666690                         nop        
02058 c5f877                         vzeroupper 
0205b e88099b4ff                     call       0x7f982f9bc0e0
02060 0f1f840058210017               nop        dword ptr [rax + rax + 0x17002158]
02068 4533d2                         xor        r10d, r10d
0206b 4c89542408                     mov        qword ptr [rsp + 8], r10
02070 e9cde0ffff                     jmp        0x7f982fe70842
02075 4533d2                         xor        r10d, r10d
02078 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02080 e9ece0ffff                     jmp        0x7f982fe70871
02085 4533d2                         xor        r10d, r10d
02088 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02090 e909e1ffff                     jmp        0x7f982fe7089e
02095 4533d2                         xor        r10d, r10d
02098 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0209d e928e1ffff                     jmp        0x7f982fe708ca
020a2 4533d2                         xor        r10d, r10d
020a5 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
020ad e941e1ffff                     jmp        0x7f982fe708f3
020b2 4533d2                         xor        r10d, r10d
020b5 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
020bd e957e1ffff                     jmp        0x7f982fe70919
020c2 beccffffff                     mov        esi, 0xffffffcc
020c7 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020cc 48894424f8                     mov        qword ptr [rsp - 8], rax
020d1 8b442410                       mov        eax, dword ptr [rsp + 0x10]
020d5 89442408                       mov        dword ptr [rsp + 8], eax
020d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020de 48ff742420                     push       qword ptr [rsp + 0x20]
020e3 488f442418                     pop        qword ptr [rsp + 0x18]
020e8 48894424f8                     mov        qword ptr [rsp - 8], rax
020ed 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020f1 8944240c                       mov        dword ptr [rsp + 0xc], eax
020f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fa 48894424f8                     mov        qword ptr [rsp - 8], rax
020ff 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02103 89442438                       mov        dword ptr [rsp + 0x38], eax
02107 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210c 48894424f8                     mov        qword ptr [rsp - 8], rax
02111 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02115 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02119 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0211e 48894424f8                     mov        qword ptr [rsp - 8], rax
02123 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02127 89442460                       mov        dword ptr [rsp + 0x60], eax
0212b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02130 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
02135 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0213a 6690                           nop        
0213c c5f877                         vzeroupper 
0213f e89c98b4ff                     call       0x7f982f9bc0e0
02144 0f1f84003c220018               nop        dword ptr [rax + rax + 0x1800223c]
0214c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02151 448bd8                         mov        r11d, eax
02154 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
02159 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0215e 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
02163 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02168 4183c308                       add        r11d, 8
0216c 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02171 443bdb                         cmp        r11d, ebx
02174 7cd6                           jl         0x7f982fe7284c
02176 443bd9                         cmp        r11d, ecx
02179 0f8d55140000                   jge        0x7f982fe73cd4
0217f 458bd3                         mov        r10d, r11d
02182 4489542468                     mov        dword ptr [rsp + 0x68], r10d
02187 498bd8                         mov        rbx, r8
0218a 660f1f440000                   nop        word ptr [rax + rax]
02190 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02195 4d63c3                         movsxd     r8, r11d
02198 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0219d 448bd8                         mov        r11d, eax
021a0 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
021a5 458bcb                         mov        r9d, r11d
021a8 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
021ad 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
021b2 4d63d9                         movsxd     r11, r9d
021b5 4e8b541b10                     mov        r10, qword ptr [rbx + r11 + 0x10]
021ba 4e89540310                     mov        qword ptr [rbx + r8 + 0x10], r10
021bf 4e8b541b18                     mov        r10, qword ptr [rbx + r11 + 0x18]
021c4 4e89540318                     mov        qword ptr [rbx + r8 + 0x18], r10
021c9 4e8b541b20                     mov        r10, qword ptr [rbx + r11 + 0x20]
021ce 4e89540320                     mov        qword ptr [rbx + r8 + 0x20], r10
021d3 4e8b541b28                     mov        r10, qword ptr [rbx + r11 + 0x28]
021d8 4e89540328                     mov        qword ptr [rbx + r8 + 0x28], r10
021dd 4e8b541b30                     mov        r10, qword ptr [rbx + r11 + 0x30]
021e2 4e89540330                     mov        qword ptr [rbx + r8 + 0x30], r10
021e7 4e8b541b38                     mov        r10, qword ptr [rbx + r11 + 0x38]
021ec 4e89540338                     mov        qword ptr [rbx + r8 + 0x38], r10
021f1 4e8b541b40                     mov        r10, qword ptr [rbx + r11 + 0x40]
021f6 4e89540340                     mov        qword ptr [rbx + r8 + 0x40], r10
021fb 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02200 4183c340                       add        r11d, 0x40
02204 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02209 443bd9                         cmp        r11d, ecx
0220c 0f8c7effffff                   jl         0x7f982fe72890
02212 48899c24e0000000               mov        qword ptr [rsp + 0xe0], rbx
0221a 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0221f 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
02227 0f8d06f0ffff                   jge        0x7f982fe71933
0222d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02232 6690                           nop        
02234 468d1418                       lea        r10d, [rax + r11]
02238 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
02240 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
02245 458bc3                         mov        r8d, r11d
02248 4f89540108                     mov        qword ptr [r9 + r8 + 8], r10
0224d 4183c308                       add        r11d, 8
02251 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
02259 7cd9                           jl         0x7f982fe72934
0225b e9d3efffff                     jmp        0x7f982fe71933
02260 bee4ffffff                     mov        esi, 0xffffffe4
02265 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0226a 48894424f8                     mov        qword ptr [rsp - 8], rax
0226f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02273 89442408                       mov        dword ptr [rsp + 8], eax
02277 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227c 48ff742420                     push       qword ptr [rsp + 0x20]
02281 488f442418                     pop        qword ptr [rsp + 0x18]
02286 48894424f8                     mov        qword ptr [rsp - 8], rax
0228b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0228f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02293 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02298 48894424f8                     mov        qword ptr [rsp - 8], rax
0229d 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
022a1 89442434                       mov        dword ptr [rsp + 0x34], eax
022a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022aa 48894424f8                     mov        qword ptr [rsp - 8], rax
022af 8b442440                       mov        eax, dword ptr [rsp + 0x40]
022b3 89442438                       mov        dword ptr [rsp + 0x38], eax
022b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022bc 48894424f8                     mov        qword ptr [rsp - 8], rax
022c1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
022c5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ce 48894424f8                     mov        qword ptr [rsp - 8], rax
022d3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
022d7 89442460                       mov        dword ptr [rsp + 0x60], eax
022db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e0 4489742464                     mov        dword ptr [rsp + 0x64], r14d
022e5 48894424f8                     mov        qword ptr [rsp - 8], rax
022ea 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
022f1 89442468                       mov        dword ptr [rsp + 0x68], eax
022f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022fa 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
02302 6690                           nop        
02304 c5f877                         vzeroupper 
02307 e8d496b4ff                     call       0x7f982f9bc0e0
0230c 0f1f840004240019               nop        dword ptr [rax + rax + 0x19002404]
02314 bee4ffffff                     mov        esi, 0xffffffe4
02319 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0231e 48894424f8                     mov        qword ptr [rsp - 8], rax
02323 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02327 89442408                       mov        dword ptr [rsp + 8], eax
0232b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02330 48ff742420                     push       qword ptr [rsp + 0x20]
02335 488f442418                     pop        qword ptr [rsp + 0x18]
0233a 48894424f8                     mov        qword ptr [rsp - 8], rax
0233f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02343 8944240c                       mov        dword ptr [rsp + 0xc], eax
02347 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0234c 48894424f8                     mov        qword ptr [rsp - 8], rax
02351 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02355 89442438                       mov        dword ptr [rsp + 0x38], eax
02359 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235e 48894424f8                     mov        qword ptr [rsp - 8], rax
02363 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02367 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0236b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02370 48894424f8                     mov        qword ptr [rsp - 8], rax
02375 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02379 89442460                       mov        dword ptr [rsp + 0x60], eax
0237d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02382 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02387 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0238b 90                             nop        
0238c c5f877                         vzeroupper 
0238f e84c96b4ff                     call       0x7f982f9bc0e0
02394 0f1f84008c24001a               nop        dword ptr [rax + rax + 0x1a00248c]
0239c bee4ffffff                     mov        esi, 0xffffffe4
023a1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
023a6 48894424f8                     mov        qword ptr [rsp - 8], rax
023ab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
023af 89442408                       mov        dword ptr [rsp + 8], eax
023b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023b8 48ff742420                     push       qword ptr [rsp + 0x20]
023bd 488f442418                     pop        qword ptr [rsp + 0x18]
023c2 48894424f8                     mov        qword ptr [rsp - 8], rax
023c7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023cb 8944240c                       mov        dword ptr [rsp + 0xc], eax
023cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d4 48894424f8                     mov        qword ptr [rsp - 8], rax
023d9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
023dd 89442438                       mov        dword ptr [rsp + 0x38], eax
023e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e6 48894424f8                     mov        qword ptr [rsp - 8], rax
023eb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
023ef 89442460                       mov        dword ptr [rsp + 0x60], eax
023f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f8 4489742464                     mov        dword ptr [rsp + 0x64], r14d
023fd 666690                         nop        
02400 c5f877                         vzeroupper 
02403 e8d895b4ff                     call       0x7f982f9bc0e0
02408 0f1f84000025001b               nop        dword ptr [rax + rax + 0x1b002500]
02410 bee4ffffff                     mov        esi, 0xffffffe4
02415 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0241a 48894424f8                     mov        qword ptr [rsp - 8], rax
0241f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02423 89442408                       mov        dword ptr [rsp + 8], eax
02427 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242c 48ff742420                     push       qword ptr [rsp + 0x20]
02431 488f442418                     pop        qword ptr [rsp + 0x18]
02436 48894424f8                     mov        qword ptr [rsp - 8], rax
0243b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0243f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02443 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02448 48894424f8                     mov        qword ptr [rsp - 8], rax
0244d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02451 89442434                       mov        dword ptr [rsp + 0x34], eax
02455 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245a 48894424f8                     mov        qword ptr [rsp - 8], rax
0245f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02463 89442440                       mov        dword ptr [rsp + 0x40], eax
02467 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0246c 48894424f8                     mov        qword ptr [rsp - 8], rax
02471 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02475 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02479 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0247e 4489542474                     mov        dword ptr [rsp + 0x74], r10d
02483 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
0248b 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
02493 90                             nop        
02494 c5f877                         vzeroupper 
02497 e84495b4ff                     call       0x7f982f9bc0e0
0249c 0f1f84009425001c               nop        dword ptr [rax + rax + 0x1c002594]
024a4 bee4ffffff                     mov        esi, 0xffffffe4
024a9 48ff742408                     push       qword ptr [rsp + 8]
024ae 488f0424                       pop        qword ptr [rsp]
024b2 48894424f8                     mov        qword ptr [rsp - 8], rax
024b7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
024bb 89442414                       mov        dword ptr [rsp + 0x14], eax
024bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c4 48894424f8                     mov        qword ptr [rsp - 8], rax
024c9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
024cd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
024d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d6 48894424f8                     mov        qword ptr [rsp - 8], rax
024db 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024df 89442464                       mov        dword ptr [rsp + 0x64], eax
024e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e8 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
024ed 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
024f2 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
024fa 6690                           nop        
024fc c5f877                         vzeroupper 
024ff e8dc94b4ff                     call       0x7f982f9bc0e0
02504 0f1f8400fc25001d               nop        dword ptr [rax + rax + 0x1d0025fc]
0250c 418d6d01                       lea        ebp, [r13 + 1]
02510 bee4ffffff                     mov        esi, 0xffffffe4
02515 48ff742408                     push       qword ptr [rsp + 8]
0251a 488f0424                       pop        qword ptr [rsp]
0251e 48894424f8                     mov        qword ptr [rsp - 8], rax
02523 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02527 89442414                       mov        dword ptr [rsp + 0x14], eax
0252b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02530 48894424f8                     mov        qword ptr [rsp - 8], rax
02535 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02539 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0253d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02542 48894424f8                     mov        qword ptr [rsp - 8], rax
02547 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0254b 89442464                       mov        dword ptr [rsp + 0x64], eax
0254f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02554 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02559 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
0255e 48894424f8                     mov        qword ptr [rsp - 8], rax
02563 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0256a 8944247c                       mov        dword ptr [rsp + 0x7c], eax
0256e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02573 90                             nop        
02574 c5f877                         vzeroupper 
02577 e86494b4ff                     call       0x7f982f9bc0e0
0257c 0f1f84007426001e               nop        dword ptr [rax + rax + 0x1e002674]
02584 bee4ffffff                     mov        esi, 0xffffffe4
02589 48ff742408                     push       qword ptr [rsp + 8]
0258e 488f0424                       pop        qword ptr [rsp]
02592 48894424f8                     mov        qword ptr [rsp - 8], rax
02597 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0259b 89442414                       mov        dword ptr [rsp + 0x14], eax
0259f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a4 48894424f8                     mov        qword ptr [rsp - 8], rax
025a9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
025ad 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b6 48894424f8                     mov        qword ptr [rsp - 8], rax
025bb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
025bf 89442464                       mov        dword ptr [rsp + 0x64], eax
025c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c8 4489742470                     mov        dword ptr [rsp + 0x70], r14d
025cd 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
025d2 48894424f8                     mov        qword ptr [rsp - 8], rax
025d7 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
025de 8944247c                       mov        dword ptr [rsp + 0x7c], eax
025e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e7 90                             nop        
025e8 c5f877                         vzeroupper 
025eb e8f093b4ff                     call       0x7f982f9bc0e0
025f0 0f1f8400e826001f               nop        dword ptr [rax + rax + 0x1f0026e8]
025f8 bee4ffffff                     mov        esi, 0xffffffe4
025fd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02602 48894424f8                     mov        qword ptr [rsp - 8], rax
02607 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0260b 89442408                       mov        dword ptr [rsp + 8], eax
0260f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02614 48ff742420                     push       qword ptr [rsp + 0x20]
02619 488f442418                     pop        qword ptr [rsp + 0x18]
0261e 48894424f8                     mov        qword ptr [rsp - 8], rax
02623 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02627 8944240c                       mov        dword ptr [rsp + 0xc], eax
0262b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02630 48894424f8                     mov        qword ptr [rsp - 8], rax
02635 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02639 89442434                       mov        dword ptr [rsp + 0x34], eax
0263d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02642 48894424f8                     mov        qword ptr [rsp - 8], rax
02647 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0264b 89442440                       mov        dword ptr [rsp + 0x40], eax
0264f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02654 48894424f8                     mov        qword ptr [rsp - 8], rax
02659 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0265d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02661 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02666 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0266b 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02670 c5f877                         vzeroupper 
02673 e86893b4ff                     call       0x7f982f9bc0e0
02678 0f1f840070270020               nop        dword ptr [rax + rax + 0x20002770]
02680 bee4ffffff                     mov        esi, 0xffffffe4
02685 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0268a 48894424f8                     mov        qword ptr [rsp - 8], rax
0268f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02693 89442408                       mov        dword ptr [rsp + 8], eax
02697 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269c 48ff742420                     push       qword ptr [rsp + 0x20]
026a1 488f442418                     pop        qword ptr [rsp + 0x18]
026a6 48894424f8                     mov        qword ptr [rsp - 8], rax
026ab 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026af 8944240c                       mov        dword ptr [rsp + 0xc], eax
026b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b8 48894424f8                     mov        qword ptr [rsp - 8], rax
026bd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
026c1 89442434                       mov        dword ptr [rsp + 0x34], eax
026c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ca 48894424f8                     mov        qword ptr [rsp - 8], rax
026cf 8b442448                       mov        eax, dword ptr [rsp + 0x48]
026d3 89442440                       mov        dword ptr [rsp + 0x40], eax
026d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026dc 48894424f8                     mov        qword ptr [rsp - 8], rax
026e1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
026e5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
026e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ee 4489742468                     mov        dword ptr [rsp + 0x68], r14d
026f3 48894424f8                     mov        qword ptr [rsp - 8], rax
026f8 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
026ff 89442470                       mov        dword ptr [rsp + 0x70], eax
02703 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02708 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02710 c5f877                         vzeroupper 
02713 e8c892b4ff                     call       0x7f982f9bc0e0
02718 0f1f840010280021               nop        dword ptr [rax + rax + 0x21002810]
02720 bee4ffffff                     mov        esi, 0xffffffe4
02725 48ff742408                     push       qword ptr [rsp + 8]
0272a 488f0424                       pop        qword ptr [rsp]
0272e 48894424f8                     mov        qword ptr [rsp - 8], rax
02733 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02737 89442414                       mov        dword ptr [rsp + 0x14], eax
0273b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02740 48894424f8                     mov        qword ptr [rsp - 8], rax
02745 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02749 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0274d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02752 48894424f8                     mov        qword ptr [rsp - 8], rax
02757 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0275b 89442464                       mov        dword ptr [rsp + 0x64], eax
0275f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02764 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02769 48894424f8                     mov        qword ptr [rsp - 8], rax
0276e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02775 89442478                       mov        dword ptr [rsp + 0x78], eax
02779 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277e 6690                           nop        
02780 c5f877                         vzeroupper 
02783 e85892b4ff                     call       0x7f982f9bc0e0
02788 0f1f840080280022               nop        dword ptr [rax + rax + 0x22002880]
02790 beccffffff                     mov        esi, 0xffffffcc
02795 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0279a 48894424f8                     mov        qword ptr [rsp - 8], rax
0279f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027a3 89442408                       mov        dword ptr [rsp + 8], eax
027a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ac 48ff742420                     push       qword ptr [rsp + 0x20]
027b1 488f442418                     pop        qword ptr [rsp + 0x18]
027b6 48894424f8                     mov        qword ptr [rsp - 8], rax
027bb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027bf 8944240c                       mov        dword ptr [rsp + 0xc], eax
027c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c8 48894424f8                     mov        qword ptr [rsp - 8], rax
027cd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
027d1 89442434                       mov        dword ptr [rsp + 0x34], eax
027d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027da 48894424f8                     mov        qword ptr [rsp - 8], rax
027df 8b442448                       mov        eax, dword ptr [rsp + 0x48]
027e3 89442440                       mov        dword ptr [rsp + 0x40], eax
027e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ec 48894424f8                     mov        qword ptr [rsp - 8], rax
027f1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
027f5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027fe 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02803 48894424f8                     mov        qword ptr [rsp - 8], rax
02808 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0280f 89442470                       mov        dword ptr [rsp + 0x70], eax
02813 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02818 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02820 c5f877                         vzeroupper 
02823 e8b891b4ff                     call       0x7f982f9bc0e0
02828 0f1f840020290023               nop        dword ptr [rax + rax + 0x23002920]
02830 beccffffff                     mov        esi, 0xffffffcc
02835 48ff742408                     push       qword ptr [rsp + 8]
0283a 488f0424                       pop        qword ptr [rsp]
0283e 48894424f8                     mov        qword ptr [rsp - 8], rax
02843 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02847 89442414                       mov        dword ptr [rsp + 0x14], eax
0284b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02850 48894424f8                     mov        qword ptr [rsp - 8], rax
02855 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02859 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0285d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02862 48894424f8                     mov        qword ptr [rsp - 8], rax
02867 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0286b 89442464                       mov        dword ptr [rsp + 0x64], eax
0286f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02874 4489742470                     mov        dword ptr [rsp + 0x70], r14d
02879 48894424f8                     mov        qword ptr [rsp - 8], rax
0287e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02885 89442474                       mov        dword ptr [rsp + 0x74], eax
02889 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0288e 6690                           nop        
02890 c5f877                         vzeroupper 
02893 e84891b4ff                     call       0x7f982f9bc0e0
02898 0f1f840090290024               nop        dword ptr [rax + rax + 0x24002990]
028a0 be6effffff                     mov        esi, 0xffffff6e
028a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028aa 48894424f8                     mov        qword ptr [rsp - 8], rax
028af 8b442410                       mov        eax, dword ptr [rsp + 0x10]
028b3 89442408                       mov        dword ptr [rsp + 8], eax
028b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028bc 48ff742420                     push       qword ptr [rsp + 0x20]
028c1 488f442418                     pop        qword ptr [rsp + 0x18]
028c6 48894424f8                     mov        qword ptr [rsp - 8], rax
028cb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028cf 8944240c                       mov        dword ptr [rsp + 0xc], eax
028d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d8 48894424f8                     mov        qword ptr [rsp - 8], rax
028dd 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
028e1 89442434                       mov        dword ptr [rsp + 0x34], eax
028e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ea 48894424f8                     mov        qword ptr [rsp - 8], rax
028ef 8b442440                       mov        eax, dword ptr [rsp + 0x40]
028f3 89442438                       mov        dword ptr [rsp + 0x38], eax
028f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02901 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02905 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02909 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0290e 48894424f8                     mov        qword ptr [rsp - 8], rax
02913 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02917 89442460                       mov        dword ptr [rsp + 0x60], eax
0291b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02920 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02925 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02929 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0292e 6690                           nop        
02930 c5f877                         vzeroupper 
02933 e8a890b4ff                     call       0x7f982f9bc0e0
02938 0f1f8400302a0025               nop        dword ptr [rax + rax + 0x25002a30]
02940 be45ffffff                     mov        esi, 0xffffff45
02945 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0294a 48894424f8                     mov        qword ptr [rsp - 8], rax
0294f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02953 89442408                       mov        dword ptr [rsp + 8], eax
02957 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0295c 48ff742420                     push       qword ptr [rsp + 0x20]
02961 488f442418                     pop        qword ptr [rsp + 0x18]
02966 48894424f8                     mov        qword ptr [rsp - 8], rax
0296b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0296f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02973 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02978 48894424f8                     mov        qword ptr [rsp - 8], rax
0297d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02981 89442438                       mov        dword ptr [rsp + 0x38], eax
02985 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0298a 48894424f8                     mov        qword ptr [rsp - 8], rax
0298f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02993 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02997 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0299c 48894424f8                     mov        qword ptr [rsp - 8], rax
029a1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029a5 89442460                       mov        dword ptr [rsp + 0x60], eax
029a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ae 4489742464                     mov        dword ptr [rsp + 0x64], r14d
029b3 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
029b8 c5f877                         vzeroupper 
029bb e82090b4ff                     call       0x7f982f9bc0e0
029c0 0f1f8400b82a0026               nop        dword ptr [rax + rax + 0x26002ab8]
029c8 be3dffffff                     mov        esi, 0xffffff3d
029cd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
029d2 48894424f8                     mov        qword ptr [rsp - 8], rax
029d7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
029db 89442408                       mov        dword ptr [rsp + 8], eax
029df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e4 48ff742420                     push       qword ptr [rsp + 0x20]
029e9 488f442418                     pop        qword ptr [rsp + 0x18]
029ee 48894424f8                     mov        qword ptr [rsp - 8], rax
029f3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029f7 8944240c                       mov        dword ptr [rsp + 0xc], eax
029fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a00 48894424f8                     mov        qword ptr [rsp - 8], rax
02a05 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a09 89442438                       mov        dword ptr [rsp + 0x38], eax
02a0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a12 48894424f8                     mov        qword ptr [rsp - 8], rax
02a17 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02a1b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a24 48894424f8                     mov        qword ptr [rsp - 8], rax
02a29 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a2d 89442460                       mov        dword ptr [rsp + 0x60], eax
02a31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a36 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02a3b 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
02a40 c5f877                         vzeroupper 
02a43 e8988fb4ff                     call       0x7f982f9bc0e0
02a48 0f1f8400402b0027               nop        dword ptr [rax + rax + 0x27002b40]
02a50 bee4ffffff                     mov        esi, 0xffffffe4
02a55 48ff742408                     push       qword ptr [rsp + 8]
02a5a 488f0424                       pop        qword ptr [rsp]
02a5e 48894424f8                     mov        qword ptr [rsp - 8], rax
02a63 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a67 89442414                       mov        dword ptr [rsp + 0x14], eax
02a6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a70 48894424f8                     mov        qword ptr [rsp - 8], rax
02a75 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02a79 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02a7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a82 48894424f8                     mov        qword ptr [rsp - 8], rax
02a87 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a8b 89442464                       mov        dword ptr [rsp + 0x64], eax
02a8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a94 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02a99 48894424f8                     mov        qword ptr [rsp - 8], rax
02a9e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02aa5 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02aa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aae 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02ab5 666690                         nop        
02ab8 c5f877                         vzeroupper 
02abb e8208fb4ff                     call       0x7f982f9bc0e0
02ac0 0f1f8400b82b0028               nop        dword ptr [rax + rax + 0x28002bb8]
02ac8 bee4ffffff                     mov        esi, 0xffffffe4
02acd 48ff742408                     push       qword ptr [rsp + 8]
02ad2 488f0424                       pop        qword ptr [rsp]
02ad6 48894424f8                     mov        qword ptr [rsp - 8], rax
02adb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02adf 89442414                       mov        dword ptr [rsp + 0x14], eax
02ae3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ae8 48894424f8                     mov        qword ptr [rsp - 8], rax
02aed 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02af1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02af5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02afa 48894424f8                     mov        qword ptr [rsp - 8], rax
02aff 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b03 89442464                       mov        dword ptr [rsp + 0x64], eax
02b07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b0c 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02b11 895c2478                       mov        dword ptr [rsp + 0x78], ebx
02b15 666690                         nop        
02b18 c5f877                         vzeroupper 
02b1b e8c08eb4ff                     call       0x7f982f9bc0e0
02b20 0f1f8400182c0029               nop        dword ptr [rax + rax + 0x29002c18]
02b28 beccffffff                     mov        esi, 0xffffffcc
02b2d 48ff742408                     push       qword ptr [rsp + 8]
02b32 488f0424                       pop        qword ptr [rsp]
02b36 48894424f8                     mov        qword ptr [rsp - 8], rax
02b3b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b3f 89442414                       mov        dword ptr [rsp + 0x14], eax
02b43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b48 48894424f8                     mov        qword ptr [rsp - 8], rax
02b4d 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02b51 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b5a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b5f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b63 89442464                       mov        dword ptr [rsp + 0x64], eax
02b67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b6c 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02b71 48894424f8                     mov        qword ptr [rsp - 8], rax
02b76 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02b7d 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02b81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b86 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
02b8e 6690                           nop        
02b90 c5f877                         vzeroupper 
02b93 e8488eb4ff                     call       0x7f982f9bc0e0
02b98 0f1f8400902c002a               nop        dword ptr [rax + rax + 0x2a002c90]
02ba0 beccffffff                     mov        esi, 0xffffffcc
02ba5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02baa 48894424f8                     mov        qword ptr [rsp - 8], rax
02baf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02bb3 89442408                       mov        dword ptr [rsp + 8], eax
02bb7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bbc 48ff742420                     push       qword ptr [rsp + 0x20]
02bc1 488f442418                     pop        qword ptr [rsp + 0x18]
02bc6 48894424f8                     mov        qword ptr [rsp - 8], rax
02bcb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02bcf 8944240c                       mov        dword ptr [rsp + 0xc], eax
02bd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd8 48894424f8                     mov        qword ptr [rsp - 8], rax
02bdd 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02be1 89442434                       mov        dword ptr [rsp + 0x34], eax
02be5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bea 48894424f8                     mov        qword ptr [rsp - 8], rax
02bef 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02bf3 89442440                       mov        dword ptr [rsp + 0x40], eax
02bf7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bfc 48894424f8                     mov        qword ptr [rsp - 8], rax
02c01 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c05 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02c09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c0e 48894424f8                     mov        qword ptr [rsp - 8], rax
02c13 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02c1a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02c1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c23 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02c28 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02c30 c5f877                         vzeroupper 
02c33 e8a88db4ff                     call       0x7f982f9bc0e0
02c38 0f1f8400302d002b               nop        dword ptr [rax + rax + 0x2b002d30]
02c40 be85ffffff                     mov        esi, 0xffffff85
02c45 48894424f8                     mov        qword ptr [rsp - 8], rax
02c4a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c4e 890424                         mov        dword ptr [rsp], eax
02c51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c56 48894424f8                     mov        qword ptr [rsp - 8], rax
02c5b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c5f 89442404                       mov        dword ptr [rsp + 4], eax
02c63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c68 4c896c2408                     mov        qword ptr [rsp + 8], r13
02c6d 48894424f8                     mov        qword ptr [rsp - 8], rax
02c72 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02c76 89442418                       mov        dword ptr [rsp + 0x18], eax
02c7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c7f 90                             nop        
02c80 c5f877                         vzeroupper 
02c83 e8588db4ff                     call       0x7f982f9bc0e0
02c88 0f1f8400802d002c               nop        dword ptr [rax + rax + 0x2c002d80]
02c90 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
02c97 beccffffff                     mov        esi, 0xffffffcc
02c9c 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02ca1 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02ca5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02caa 6690                           nop        
02cac c5f877                         vzeroupper 
02caf e82c8db4ff                     call       0x7f982f9bc0e0
02cb4 0f1f8400ac2d002d               nop        dword ptr [rax + rax + 0x2d002dac]
02cbc bee4ffffff                     mov        esi, 0xffffffe4
02cc1 48ff742408                     push       qword ptr [rsp + 8]
02cc6 488f0424                       pop        qword ptr [rsp]
02cca 48894424f8                     mov        qword ptr [rsp - 8], rax
02ccf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02cd3 89442414                       mov        dword ptr [rsp + 0x14], eax
02cd7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cdc 48894424f8                     mov        qword ptr [rsp - 8], rax
02ce1 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02ce5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ce9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cee 48894424f8                     mov        qword ptr [rsp - 8], rax
02cf3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02cf7 89442464                       mov        dword ptr [rsp + 0x64], eax
02cfb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d00 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02d05 48894424f8                     mov        qword ptr [rsp - 8], rax
02d0a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02d11 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02d15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d1a 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02d1e 48894424f8                     mov        qword ptr [rsp - 8], rax
02d23 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02d2a 89442478                       mov        dword ptr [rsp + 0x78], eax
02d2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d33 90                             nop        
02d34 c5f877                         vzeroupper 
02d37 e8a48cb4ff                     call       0x7f982f9bc0e0
02d3c 0f1f8400342e002e               nop        dword ptr [rax + rax + 0x2e002e34]
02d44 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02d4d bee4ffffff                     mov        esi, 0xffffffe4
02d52 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d57 48894424f8                     mov        qword ptr [rsp - 8], rax
02d5c 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02d60 89442408                       mov        dword ptr [rsp + 8], eax
02d64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d69 48ff742420                     push       qword ptr [rsp + 0x20]
02d6e 488f442418                     pop        qword ptr [rsp + 0x18]
02d73 48894424f8                     mov        qword ptr [rsp - 8], rax
02d78 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d7c 8944240c                       mov        dword ptr [rsp + 0xc], eax
02d80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d85 48894424f8                     mov        qword ptr [rsp - 8], rax
02d8a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02d8e 89442434                       mov        dword ptr [rsp + 0x34], eax
02d92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d97 48894424f8                     mov        qword ptr [rsp - 8], rax
02d9c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02da0 89442440                       mov        dword ptr [rsp + 0x40], eax
02da4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02da9 48894424f8                     mov        qword ptr [rsp - 8], rax
02dae 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02db2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02db6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dbb 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02dc0 48894424f8                     mov        qword ptr [rsp - 8], rax
02dc5 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02dcc 89442464                       mov        dword ptr [rsp + 0x64], eax
02dd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dd5 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02dd9 89442474                       mov        dword ptr [rsp + 0x74], eax
02ddd 666690                         nop        
02de0 c5f877                         vzeroupper 
02de3 e8f88bb4ff                     call       0x7f982f9bc0e0
02de8 0f1f8400e02e002f               nop        dword ptr [rax + rax + 0x2f002ee0]
02df0 beccffffff                     mov        esi, 0xffffffcc
02df5 48ff742408                     push       qword ptr [rsp + 8]
02dfa 488f0424                       pop        qword ptr [rsp]
02dfe 48894424f8                     mov        qword ptr [rsp - 8], rax
02e03 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e07 89442414                       mov        dword ptr [rsp + 0x14], eax
02e0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e10 48894424f8                     mov        qword ptr [rsp - 8], rax
02e15 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02e19 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02e1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e22 48894424f8                     mov        qword ptr [rsp - 8], rax
02e27 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e2b 89442464                       mov        dword ptr [rsp + 0x64], eax
02e2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e34 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02e39 48894424f8                     mov        qword ptr [rsp - 8], rax
02e3e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02e45 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02e49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e4e 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02e52 48894424f8                     mov        qword ptr [rsp - 8], rax
02e57 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02e5e 89442478                       mov        dword ptr [rsp + 0x78], eax
02e62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e67 90                             nop        
02e68 c5f877                         vzeroupper 
02e6b e8708bb4ff                     call       0x7f982f9bc0e0
02e70 0f1f8400682f0030               nop        dword ptr [rax + rax + 0x30002f68]
02e78 beccffffff                     mov        esi, 0xffffffcc
02e7d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02e82 48894424f8                     mov        qword ptr [rsp - 8], rax
02e87 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02e8b 89442408                       mov        dword ptr [rsp + 8], eax
02e8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e94 48ff742420                     push       qword ptr [rsp + 0x20]
02e99 488f442418                     pop        qword ptr [rsp + 0x18]
02e9e 48894424f8                     mov        qword ptr [rsp - 8], rax
02ea3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02ea7 8944240c                       mov        dword ptr [rsp + 0xc], eax
02eab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eb0 48894424f8                     mov        qword ptr [rsp - 8], rax
02eb5 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02eb9 89442438                       mov        dword ptr [rsp + 0x38], eax
02ebd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ec7 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02ecb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ecf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ed4 48894424f8                     mov        qword ptr [rsp - 8], rax
02ed9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02edd 89442460                       mov        dword ptr [rsp + 0x60], eax
02ee1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ee6 48894424f8                     mov        qword ptr [rsp - 8], rax
02eeb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02ef2 89442468                       mov        dword ptr [rsp + 0x68], eax
02ef6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02efb 48894424f8                     mov        qword ptr [rsp - 8], rax
02f00 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02f04 89442478                       mov        dword ptr [rsp + 0x78], eax
02f08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f0d 48894424f8                     mov        qword ptr [rsp - 8], rax
02f12 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02f19 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02f1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f22 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
02f2a 6690                           nop        
02f2c c5f877                         vzeroupper 
02f2f e8ac8ab4ff                     call       0x7f982f9bc0e0
02f34 0f1f84002c300031               nop        dword ptr [rax + rax + 0x3100302c]
02f3c c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02f45 beccffffff                     mov        esi, 0xffffffcc
02f4a 48ff742408                     push       qword ptr [rsp + 8]
02f4f 488f0424                       pop        qword ptr [rsp]
02f53 48894424f8                     mov        qword ptr [rsp - 8], rax
02f58 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02f5c 89442414                       mov        dword ptr [rsp + 0x14], eax
02f60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f65 48894424f8                     mov        qword ptr [rsp - 8], rax
02f6a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02f6e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02f72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f77 48894424f8                     mov        qword ptr [rsp - 8], rax
02f7c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02f80 89442464                       mov        dword ptr [rsp + 0x64], eax
02f84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f89 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02f8e 48894424f8                     mov        qword ptr [rsp - 8], rax
02f93 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02f9a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02f9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fa3 895c2474                       mov        dword ptr [rsp + 0x74], ebx
02fa7 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
02fac c5f877                         vzeroupper 
02faf e82c8ab4ff                     call       0x7f982f9bc0e0
02fb4 0f1f8400ac300032               nop        dword ptr [rax + rax + 0x320030ac]
02fbc 8be8                           mov        ebp, eax
02fbe 83c510                         add        ebp, 0x10
02fc1 be6effffff                     mov        esi, 0xffffff6e
02fc6 48ff742408                     push       qword ptr [rsp + 8]
02fcb 488f0424                       pop        qword ptr [rsp]
02fcf 48894424f8                     mov        qword ptr [rsp - 8], rax
02fd4 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02fd8 89442414                       mov        dword ptr [rsp + 0x14], eax
02fdc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02fe1 89442438                       mov        dword ptr [rsp + 0x38], eax
02fe5 48894424f8                     mov        qword ptr [rsp - 8], rax
02fea 8b442440                       mov        eax, dword ptr [rsp + 0x40]
02fee 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ff2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ff7 48894424f8                     mov        qword ptr [rsp - 8], rax
02ffc 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03000 89442464                       mov        dword ptr [rsp + 0x64], eax
03004 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03009 4489742468                     mov        dword ptr [rsp + 0x68], r14d
0300e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
03012 6690                           nop        
03014 c5f877                         vzeroupper 
03017 e8c489b4ff                     call       0x7f982f9bc0e0
0301c 0f1f840014310033               nop        dword ptr [rax + rax + 0x33003114]
03024 8be8                           mov        ebp, eax
03026 83c510                         add        ebp, 0x10
03029 be66ffffff                     mov        esi, 0xffffff66
0302e 48ff742408                     push       qword ptr [rsp + 8]
03033 488f0424                       pop        qword ptr [rsp]
03037 48894424f8                     mov        qword ptr [rsp - 8], rax
0303c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03040 89442414                       mov        dword ptr [rsp + 0x14], eax
03044 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03049 89442438                       mov        dword ptr [rsp + 0x38], eax
0304d 48894424f8                     mov        qword ptr [rsp - 8], rax
03052 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03056 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0305a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0305f 48894424f8                     mov        qword ptr [rsp - 8], rax
03064 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03068 89442464                       mov        dword ptr [rsp + 0x64], eax
0306c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03071 4489742468                     mov        dword ptr [rsp + 0x68], r14d
03076 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0307a 6690                           nop        
0307c c5f877                         vzeroupper 
0307f e85c89b4ff                     call       0x7f982f9bc0e0
03084 0f1f84007c310034               nop        dword ptr [rax + rax + 0x3400317c]
0308c bee4ffffff                     mov        esi, 0xffffffe4
03091 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03096 48894424f8                     mov        qword ptr [rsp - 8], rax
0309b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0309f 89442408                       mov        dword ptr [rsp + 8], eax
030a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030a8 48ff742420                     push       qword ptr [rsp + 0x20]
030ad 488f442418                     pop        qword ptr [rsp + 0x18]
030b2 48894424f8                     mov        qword ptr [rsp - 8], rax
030b7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
030bb 8944240c                       mov        dword ptr [rsp + 0xc], eax
030bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030c4 48894424f8                     mov        qword ptr [rsp - 8], rax
030c9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
030cd 89442434                       mov        dword ptr [rsp + 0x34], eax
030d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030d6 48894424f8                     mov        qword ptr [rsp - 8], rax
030db 8b442448                       mov        eax, dword ptr [rsp + 0x48]
030df 89442440                       mov        dword ptr [rsp + 0x40], eax
030e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030e8 48894424f8                     mov        qword ptr [rsp - 8], rax
030ed 8b442470                       mov        eax, dword ptr [rsp + 0x70]
030f1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
030f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030fa 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
030ff 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03107 90                             nop        
03108 c5f877                         vzeroupper 
0310b e8d088b4ff                     call       0x7f982f9bc0e0
03110 0f1f840008320035               nop        dword ptr [rax + rax + 0x35003208]
03118 bee4ffffff                     mov        esi, 0xffffffe4
0311d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03122 48894424f8                     mov        qword ptr [rsp - 8], rax
03127 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0312b 89442408                       mov        dword ptr [rsp + 8], eax
0312f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03134 48ff742420                     push       qword ptr [rsp + 0x20]
03139 488f442418                     pop        qword ptr [rsp + 0x18]
0313e 48894424f8                     mov        qword ptr [rsp - 8], rax
03143 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03147 8944240c                       mov        dword ptr [rsp + 0xc], eax
0314b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03150 48894424f8                     mov        qword ptr [rsp - 8], rax
03155 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03159 89442434                       mov        dword ptr [rsp + 0x34], eax
0315d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03162 48894424f8                     mov        qword ptr [rsp - 8], rax
03167 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0316b 89442440                       mov        dword ptr [rsp + 0x40], eax
0316f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03174 48894424f8                     mov        qword ptr [rsp - 8], rax
03179 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0317d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03181 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03186 4489742470                     mov        dword ptr [rsp + 0x70], r14d
0318b 90                             nop        
0318c c5f877                         vzeroupper 
0318f e84c88b4ff                     call       0x7f982f9bc0e0
03194 0f1f84008c320036               nop        dword ptr [rax + rax + 0x3600328c]
0319c beccffffff                     mov        esi, 0xffffffcc
031a1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
031a6 48894424f8                     mov        qword ptr [rsp - 8], rax
031ab 8b442410                       mov        eax, dword ptr [rsp + 0x10]
031af 89442408                       mov        dword ptr [rsp + 8], eax
031b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031b8 48ff742420                     push       qword ptr [rsp + 0x20]
031bd 488f442418                     pop        qword ptr [rsp + 0x18]
031c2 48894424f8                     mov        qword ptr [rsp - 8], rax
031c7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
031cb 8944240c                       mov        dword ptr [rsp + 0xc], eax
031cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031d4 48894424f8                     mov        qword ptr [rsp - 8], rax
031d9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
031dd 89442434                       mov        dword ptr [rsp + 0x34], eax
031e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031e6 48894424f8                     mov        qword ptr [rsp - 8], rax
031eb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
031ef 89442440                       mov        dword ptr [rsp + 0x40], eax
031f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031f8 48894424f8                     mov        qword ptr [rsp - 8], rax
031fd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03201 8944245c                       mov        dword ptr [rsp + 0x5c], eax
03205 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0320a 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0320f 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03217 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0321f 90                             nop        
03220 c5f877                         vzeroupper 
03223 e8b887b4ff                     call       0x7f982f9bc0e0
03228 0f1f840020330037               nop        dword ptr [rax + rax + 0x37003320]
03230 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
03235 458d5308                       lea        r10d, [r11 + 8]
03239 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0323e be6effffff                     mov        esi, 0xffffff6e
03243 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03248 48894424f8                     mov        qword ptr [rsp - 8], rax
0324d 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03251 89442408                       mov        dword ptr [rsp + 8], eax
03255 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0325a 48ff742420                     push       qword ptr [rsp + 0x20]
0325f 488f442418                     pop        qword ptr [rsp + 0x18]
03264 48894424f8                     mov        qword ptr [rsp - 8], rax
03269 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0326d 8944240c                       mov        dword ptr [rsp + 0xc], eax
03271 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03276 48894424f8                     mov        qword ptr [rsp - 8], rax
0327b 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0327f 89442434                       mov        dword ptr [rsp + 0x34], eax
03283 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03288 48894424f8                     mov        qword ptr [rsp - 8], rax
0328d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03291 89442440                       mov        dword ptr [rsp + 0x40], eax
03295 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0329a 48894424f8                     mov        qword ptr [rsp - 8], rax
0329f 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
032a6 89442460                       mov        dword ptr [rsp + 0x60], eax
032aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032af 90                             nop        
032b0 c5f877                         vzeroupper 
032b3 e82887b4ff                     call       0x7f982f9bc0e0
032b8 0f1f8400b0330038               nop        dword ptr [rax + rax + 0x380033b0]
032c0 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
032c5 458d5308                       lea        r10d, [r11 + 8]
032c9 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
032ce be66ffffff                     mov        esi, 0xffffff66
032d3 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
032d8 48894424f8                     mov        qword ptr [rsp - 8], rax
032dd 8b442410                       mov        eax, dword ptr [rsp + 0x10]
032e1 89442408                       mov        dword ptr [rsp + 8], eax
032e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032ea 48ff742420                     push       qword ptr [rsp + 0x20]
032ef 488f442418                     pop        qword ptr [rsp + 0x18]
032f4 48894424f8                     mov        qword ptr [rsp - 8], rax
032f9 8b442428                       mov        eax, dword ptr [rsp + 0x28]
032fd 8944240c                       mov        dword ptr [rsp + 0xc], eax
03301 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03306 48894424f8                     mov        qword ptr [rsp - 8], rax
0330b 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0330f 89442434                       mov        dword ptr [rsp + 0x34], eax
03313 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03318 48894424f8                     mov        qword ptr [rsp - 8], rax
0331d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03321 89442440                       mov        dword ptr [rsp + 0x40], eax
03325 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0332a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0332e 6690                           nop        
03330 c5f877                         vzeroupper 
03333 e8a886b4ff                     call       0x7f982f9bc0e0
03338 0f1f840030340039               nop        dword ptr [rax + rax + 0x39003430]
03340 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
03348 e9abdeffff                     jmp        0x7f982fe718f8
0334d bee4ffffff                     mov        esi, 0xffffffe4
03352 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03357 48894424f8                     mov        qword ptr [rsp - 8], rax
0335c 8b442410                       mov        eax, dword ptr [rsp + 0x10]
03360 89442408                       mov        dword ptr [rsp + 8], eax
03364 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03369 48ff742420                     push       qword ptr [rsp + 0x20]
0336e 488f442418                     pop        qword ptr [rsp + 0x18]
03373 48894424f8                     mov        qword ptr [rsp - 8], rax
03378 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0337c 8944240c                       mov        dword ptr [rsp + 0xc], eax
03380 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03385 48894424f8                     mov        qword ptr [rsp - 8], rax
0338a 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0338e 89442434                       mov        dword ptr [rsp + 0x34], eax
03392 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03397 48894424f8                     mov        qword ptr [rsp - 8], rax
0339c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
033a0 89442440                       mov        dword ptr [rsp + 0x40], eax
033a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033a9 48894424f8                     mov        qword ptr [rsp - 8], rax
033ae 8b442470                       mov        eax, dword ptr [rsp + 0x70]
033b2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
033b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033bb 4489742464                     mov        dword ptr [rsp + 0x64], r14d
033c0 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
033c5 666690                         nop        
033c8 c5f877                         vzeroupper 
033cb e81086b4ff                     call       0x7f982f9bc0e0
033d0 0f1f8400c834003a               nop        dword ptr [rax + rax + 0x3a0034c8]
033d8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
033e1 bee4ffffff                     mov        esi, 0xffffffe4
033e6 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
033eb 48894424f8                     mov        qword ptr [rsp - 8], rax
033f0 8b442410                       mov        eax, dword ptr [rsp + 0x10]
033f4 89442408                       mov        dword ptr [rsp + 8], eax
033f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
033fd 48ff742420                     push       qword ptr [rsp + 0x20]
03402 488f442418                     pop        qword ptr [rsp + 0x18]
03407 48894424f8                     mov        qword ptr [rsp - 8], rax
0340c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03410 8944240c                       mov        dword ptr [rsp + 0xc], eax
03414 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03419 48894424f8                     mov        qword ptr [rsp - 8], rax
0341e 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03422 89442434                       mov        dword ptr [rsp + 0x34], eax
03426 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0342b 48894424f8                     mov        qword ptr [rsp - 8], rax
03430 8b442448                       mov        eax, dword ptr [rsp + 0x48]
03434 89442440                       mov        dword ptr [rsp + 0x40], eax
03438 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0343d 48894424f8                     mov        qword ptr [rsp - 8], rax
03442 8b442470                       mov        eax, dword ptr [rsp + 0x70]
03446 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0344a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0344f 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
03454 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
03459 666690                         nop        
0345c c5f877                         vzeroupper 
0345f e87c85b4ff                     call       0x7f982f9bc0e0
03464 0f1f84005c35003b               nop        dword ptr [rax + rax + 0x3b00355c]
0346c beccffffff                     mov        esi, 0xffffffcc
03471 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03476 48894424f8                     mov        qword ptr [rsp - 8], rax
0347b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0347f 89442408                       mov        dword ptr [rsp + 8], eax
03483 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03488 48ff742420                     push       qword ptr [rsp + 0x20]
0348d 488f442418                     pop        qword ptr [rsp + 0x18]
03492 48894424f8                     mov        qword ptr [rsp - 8], rax
03497 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0349b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0349f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034a4 48894424f8                     mov        qword ptr [rsp - 8], rax
034a9 8b442440                       mov        eax, dword ptr [rsp + 0x40]
034ad 89442434                       mov        dword ptr [rsp + 0x34], eax
034b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034b6 48894424f8                     mov        qword ptr [rsp - 8], rax
034bb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
034bf 89442440                       mov        dword ptr [rsp + 0x40], eax
034c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034c8 48894424f8                     mov        qword ptr [rsp - 8], rax
034cd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
034d1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
034d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
034da 4489742464                     mov        dword ptr [rsp + 0x64], r14d
034df 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
034e4 4489542478                     mov        dword ptr [rsp + 0x78], r10d
034e9 666690                         nop        
034ec c5f877                         vzeroupper 
034ef e8ec84b4ff                     call       0x7f982f9bc0e0
034f4 0f1f8400ec35003c               nop        dword ptr [rax + rax + 0x3c0035ec]
034fc 4183c510                       add        r13d, 0x10
03500 be6effffff                     mov        esi, 0xffffff6e
03505 48ff742408                     push       qword ptr [rsp + 8]
0350a 488f0424                       pop        qword ptr [rsp]
0350e 48894424f8                     mov        qword ptr [rsp - 8], rax
03513 8b442428                       mov        eax, dword ptr [rsp + 0x28]
03517 89442414                       mov        dword ptr [rsp + 0x14], eax
0351b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03520 48894424f8                     mov        qword ptr [rsp - 8], rax
03525 8b442440                       mov        eax, dword ptr [rsp + 0x40]
03529 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0352d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03532 48894424f8                     mov        qword ptr [rsp - 8], rax
03537 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0353b 89442464                       mov        dword ptr [rsp + 0x64], eax
0353f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03544 48894424f8                     mov        qword ptr [rsp - 8], rax
03549 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
03550 89442468                       mov        dword ptr [rsp + 0x68], eax
03554 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03559 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0355e 6690                           nop        
03560 c5f877                         vzeroupper 
03563 e87884b4ff                     call       0x7f982f9bc0e0
03568 0f1f84006036003d               nop        dword ptr [rax + rax + 0x3d003660]
03570 4183c510                       add        r13d, 0x10
03574 be66ffffff                     mov        esi, 0xffffff66
03579 48ff742408                     push       qword ptr [rsp + 8]
0357e 488f0424                       pop        qword ptr [rsp]
03582 48894424f8                     mov        qword ptr [rsp - 8], rax
03587 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0358b 89442414                       mov        dword ptr [rsp + 0x14], eax
0358f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03594 48894424f8                     mov        qword ptr [rsp - 8], rax
03599 8b442440                       mov        eax, dword ptr [rsp + 0x40]
0359d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
035a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035a6 48894424f8                     mov        qword ptr [rsp - 8], rax
035ab 8b442470                       mov        eax, dword ptr [rsp + 0x70]
035af 89442464                       mov        dword ptr [rsp + 0x64], eax
035b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
035b8 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
035bd 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
035c2 6690                           nop        
035c4 c5f877                         vzeroupper 
035c7 e81484b4ff                     call       0x7f982f9bc0e0
035cc 0f1f8400c436003e               nop        dword ptr [rax + rax + 0x3e0036c4]
035d4 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
035dc e939ecffff                     jmp        0x7f982fe7291a
035e1 bef6ffffff                     mov        esi, 0xfffffff6
035e6 6690                           nop        
035e8 c5f877                         vzeroupper 
035eb e8f083b4ff                     call       0x7f982f9bc0e0
035f0 0f1f8400e836003f               nop        dword ptr [rax + rax + 0x3f0036e8]
035f8 bef6ffffff                     mov        esi, 0xfffffff6
035fd 666690                         nop        
03600 c5f877                         vzeroupper 
03603 e8d883b4ff                     call       0x7f982f9bc0e0
03608 0f1f840000370040               nop        dword ptr [rax + rax + 0x40003700]
03610 bef6ffffff                     mov        esi, 0xfffffff6
03615 666690                         nop        
03618 c5f877                         vzeroupper 
0361b e8c083b4ff                     call       0x7f982f9bc0e0
03620 0f1f840018370041               nop        dword ptr [rax + rax + 0x41003718]
03628 bef6ffffff                     mov        esi, 0xfffffff6
0362d 666690                         nop        
03630 c5f877                         vzeroupper 
03633 e8a883b4ff                     call       0x7f982f9bc0e0
03638 0f1f840030370042               nop        dword ptr [rax + rax + 0x42003730]
03640 bef6ffffff                     mov        esi, 0xfffffff6
03645 418beb                         mov        ebp, r11d
03648 c5f877                         vzeroupper 
0364b e89083b4ff                     call       0x7f982f9bc0e0
03650 0f1f840048370043               nop        dword ptr [rax + rax + 0x43003748]
03658 bef6ffffff                     mov        esi, 0xfffffff6
0365d 666690                         nop        
03660 c5f877                         vzeroupper 
03663 e87883b4ff                     call       0x7f982f9bc0e0
03668 0f1f840060370044               nop        dword ptr [rax + rax + 0x44003760]
03670 bef6ffffff                     mov        esi, 0xfffffff6
03675 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0367a 6690                           nop        
0367c c5f877                         vzeroupper 
0367f e85c83b4ff                     call       0x7f982f9bc0e0
03684 0f1f84007c370045               nop        dword ptr [rax + rax + 0x4500377c]
0368c bef6ffffff                     mov        esi, 0xfffffff6
03691 4489542408                     mov        dword ptr [rsp + 8], r10d
03696 6690                           nop        
03698 c5f877                         vzeroupper 
0369b e84083b4ff                     call       0x7f982f9bc0e0
036a0 0f1f840098370046               nop        dword ptr [rax + rax + 0x46003798]
036a8 bef6ffffff                     mov        esi, 0xfffffff6
036ad 666690                         nop        
036b0 c5f877                         vzeroupper 
036b3 e82883b4ff                     call       0x7f982f9bc0e0
036b8 0f1f8400b0370047               nop        dword ptr [rax + rax + 0x470037b0]
036c0 bef6ffffff                     mov        esi, 0xfffffff6
036c5 448974240c                     mov        dword ptr [rsp + 0xc], r14d
036ca 6690                           nop        
036cc c5f877                         vzeroupper 
036cf e80c83b4ff                     call       0x7f982f9bc0e0
036d4 0f1f8400cc370048               nop        dword ptr [rax + rax + 0x480037cc]
036dc bef6ffffff                     mov        esi, 0xfffffff6
036e1 666690                         nop        
036e4 c5f877                         vzeroupper 
036e7 e8f482b4ff                     call       0x7f982f9bc0e0
036ec 0f1f8400e4370049               nop        dword ptr [rax + rax + 0x490037e4]
036f4 bef6ffffff                     mov        esi, 0xfffffff6
036f9 4489742408                     mov        dword ptr [rsp + 8], r14d
036fe 6690                           nop        
03700 c5f877                         vzeroupper 
03703 e8d882b4ff                     call       0x7f982f9bc0e0
03708 0f1f84000038004a               nop        dword ptr [rax + rax + 0x4a003800]
03710 bef6ffffff                     mov        esi, 0xfffffff6
03715 666690                         nop        
03718 c5f877                         vzeroupper 
0371b e8c082b4ff                     call       0x7f982f9bc0e0
03720 0f1f84001838004b               nop        dword ptr [rax + rax + 0x4b003818]
03728 49ba9e15e72f987f0000           movabs     r10, 0x7f982fe7159e
03732 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
03739 e9a2a0a8ff                     jmp        0x7f982f8fdee0
0373e e85d6ca7ff                     call       0x7f982f8eaaa0
03743 e9e6c8ffff                     jmp        0x7f982fe7072e
