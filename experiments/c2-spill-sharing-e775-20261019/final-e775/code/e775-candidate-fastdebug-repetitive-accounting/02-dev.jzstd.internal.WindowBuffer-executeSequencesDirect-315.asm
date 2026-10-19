00000 e8fbf64017                     call       0x7f0ce2fda300
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
00018 4881ecd0000000                 sub        rsp, 0xd0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8524260000                   jne        0x7f0ccbbcd252
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0003d 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00044 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0004c 8b2e                           mov        ebp, dword ptr [rsi]
0004e 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00055 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0005d 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00064 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0006c 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00073 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
0007b 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00082 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0008a 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00091 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00096 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0009d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
000a2 448b96f0000000                 mov        r10d, dword ptr [rsi + 0xf0]
000a9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
000ae 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000b5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
000ba 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000c1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000c6 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000cd 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000d2 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000d9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000de 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000e2 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
000ea 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000ee 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
000f6 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
000fa 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
000ff 448b5610                       mov        r10d, dword ptr [rsi + 0x10]
00103 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00108 448b6e08                       mov        r13d, dword ptr [rsi + 8]
0010c 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
00113 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00118 488bfe                         mov        rdi, rsi
0011b c5f877                         vzeroupper 
0011e 49ba70ca19e30c7f0000           movabs     r10, 0x7f0ce319ca70
00128 41ffd2                         call       r10
0012b 0f1f840000000000               nop        dword ptr [rax + rax]
00133 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0013b 4d85d2                         test       r10, r10
0013e 0f8470110000                   je         0x7f0ccbbcbeb4
00144 458b12                         mov        r10d, dword ptr [r10]
00147 41c1ea0d                       shr        r10d, 0xd
0014b 4181fa15410000                 cmp        r10d, 0x4115
00152 0f8537140000                   jne        0x7f0ccbbcc18f
00158 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00160 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00165 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0016d 4d85d2                         test       r10, r10
00170 0f844b110000                   je         0x7f0ccbbcbec1
00176 458b1a                         mov        r11d, dword ptr [r10]
00179 41c1eb0d                       shr        r11d, 0xd
0017d 4181fbf9060000                 cmp        r11d, 0x6f9
00184 0f8505140000                   jne        0x7f0ccbbcc18f
0018a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0018f 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00197 4d85d2                         test       r10, r10
0019a 0f842e110000                   je         0x7f0ccbbcbece
001a0 458b12                         mov        r10d, dword ptr [r10]
001a3 41c1ea0d                       shr        r10d, 0xd
001a7 4181fafc060000                 cmp        r10d, 0x6fc
001ae 0f85db130000                   jne        0x7f0ccbbcc18f
001b4 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
001bc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
001c1 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
001c9 4d85d2                         test       r10, r10
001cc 0f8409110000                   je         0x7f0ccbbcbedb
001d2 458b1a                         mov        r11d, dword ptr [r10]
001d5 41c1eb0d                       shr        r11d, 0xd
001d9 4181fbfb060000                 cmp        r11d, 0x6fb
001e0 0f85a9130000                   jne        0x7f0ccbbcc18f
001e6 4c89542478                     mov        qword ptr [rsp + 0x78], r10
001eb 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
001f3 4d85d2                         test       r10, r10
001f6 0f84ec100000                   je         0x7f0ccbbcbee8
001fc 458b12                         mov        r10d, dword ptr [r10]
001ff 41c1ea0d                       shr        r10d, 0xd
00203 4181fafb060000                 cmp        r10d, 0x6fb
0020a 0f857f130000                   jne        0x7f0ccbbcc18f
00210 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00218 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00220 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00228 458b1a                         mov        r11d, dword ptr [r10]
0022b 41c1eb0d                       shr        r11d, 0xd
0022f 4181fbf9060000                 cmp        r11d, 0x6f9
00236 0f8553130000                   jne        0x7f0ccbbcc18f
0023c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00241 458b5204                       mov        r10d, dword ptr [r10 + 4]
00245 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0024a 458d5af1                       lea        r11d, [r10 - 0xf]
0024e 4585db                         test       r11d, r11d
00251 0f8caa130000                   jl         0x7f0ccbbcc201
00257 4183c2f1                       add        r10d, -0xf
0025b 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00263 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
0026a 0f83e40e0000                   jae        0x7f0ccbbcbd54
00270 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00275 c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
0027c 443bac249c000000               cmp        r13d, dword ptr [rsp + 0x9c]
00284 0f83fa120000                   jae        0x7f0ccbbcc184
0028a 83c510                         add        ebp, 0x10
0028d 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00291 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00296 c4817a7f442b08                 vmovdqu    xmmword ptr [r11 + r13 + 8], xmm0
0029d 4183c510                       add        r13d, 0x10
002a1 418502                         test       dword ptr [r10], eax
002a4 443b6c240c                     cmp        r13d, dword ptr [rsp + 0xc]
002a9 7d4d                           jge        0x7f0ccbbcaef8
002ab 90                             nop        
002ac 90                             nop        
002ad 90                             nop        
002ae 90                             nop        
002af 90                             nop        
002b0 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
002b7 0f83970e0000                   jae        0x7f0ccbbcbd54
002bd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
002c2 c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
002c9 443bac249c000000               cmp        r13d, dword ptr [rsp + 0x9c]
002d1 0f83550f0000                   jae        0x7f0ccbbcbe2c
002d7 83c510                         add        ebp, 0x10
002da 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002de 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
002e3 c4817a7f442b08                 vmovdqu    xmmword ptr [r11 + r13 + 8], xmm0
002ea 4183c510                       add        r13d, 0x10
002ee 418502                         test       dword ptr [r10], eax
002f1 443b6c240c                     cmp        r13d, dword ptr [rsp + 0xc]
002f6 7cb8                           jl         0x7f0ccbbcaeb0
002f8 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
002fd 41ffc3                         inc        r11d
00300 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00305 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00309 418502                         test       dword ptr [r10], eax
0030c 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00311 e9a5050000                     jmp        0x7f0ccbbcb4bb
00316 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0031e 458b5b04                       mov        r11d, dword ptr [r11 + 4]
00322 4183c2fd                       add        r10d, -3
00326 4183fb02                       cmp        r11d, 2
0032a 0f8664110000                   jbe        0x7f0ccbbcc094
00330 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00338 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
0033c 45894310                       mov        dword ptr [r11 + 0x10], r8d
00340 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00344 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0034c 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00350 45895008                       mov        dword ptr [r8 + 8], r10d
00354 458bf2                         mov        r14d, r10d
00357 e997000000                     jmp        0x7f0ccbbcaff3
0035c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00364 418b5304                       mov        edx, dword ptr [r11 + 4]
00368 443bd2                         cmp        r10d, edx
0036b 0f834f130000                   jae        0x7f0ccbbcc2c0
00371 438b6c9308                     mov        ebp, dword ptr [r11 + r10*4 + 8]
00376 4585d2                         test       r10d, r10d
00379 7e61                           jle        0x7f0ccbbcafdc
0037b 85d2                           test       edx, edx
0037d 0f8679150000                   jbe        0x7f0ccbbcc4fc
00383 4863c2                         movsxd     rax, edx
00386 4d63da                         movsxd     r11, r10d
00389 49ffcb                         dec        r11
0038c 4c3bd8                         cmp        r11, rax
0038f 0f8367150000                   jae        0x7f0ccbbcc4fc
00395 83fa01                         cmp        edx, 1
00398 0f865e150000                   jbe        0x7f0ccbbcc4fc
0039e 458d42ff                       lea        r8d, [r10 - 1]
003a2 4963d8                         movsxd     rbx, r8d
003a5 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
003ad 458bdb                         mov        r11d, r11d
003b0 4183c3cc                       add        r11d, -0x34
003b4 41c1eb02                       shr        r11d, 2
003b8 478d4413ff                     lea        r8d, [r11 + r10 - 1]
003bd 33c9                           xor        ecx, ecx
003bf 41bb04000000                   mov        r11d, 4
003c5 c442a0f5d8                     bzhi       r11, r8, r11
003ca 492bdb                         sub        rbx, r11
003cd 4885db                         test       rbx, rbx
003d0 480f4cd9                       cmovl      rbx, rcx
003d4 448bc3                         mov        r8d, ebx
003d7 e9cb060000                     jmp        0x7f0ccbbcb6a7
003dc 85d2                           test       edx, edx
003de 0f86fc130000                   jbe        0x7f0ccbbcc3e0
003e4 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
003ec 41896a08                       mov        dword ptr [r10 + 8], ebp
003f0 448bf5                         mov        r14d, ebp
003f3 4963c6                         movsxd     rax, r14d
003f6 4c635c240c                     movsxd     r11, dword ptr [rsp + 0xc]
003fb 4c035c2458                     add        r11, qword ptr [rsp + 0x58]
00400 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00404 039c2490000000                 add        ebx, dword ptr [rsp + 0x90]
0040b 4863942490000000               movsxd     rdx, dword ptr [rsp + 0x90]
00413 4c03da                         add        r11, rdx
00416 8beb                           mov        ebp, ebx
00418 412bee                         sub        ebp, r14d
0041b 493bc3                         cmp        rax, r11
0041e 7f28                           jg         0x7f0ccbbcb048
00420 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00425 4585d2                         test       r10d, r10d
00428 0f84ba090000                   je         0x7f0ccbbcb9e8
0042e 48894424f8                     mov        qword ptr [rsp - 8], rax
00433 8b442460                       mov        eax, dword ptr [rsp + 0x60]
00437 89842498000000                 mov        dword ptr [rsp + 0x98], eax
0043e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00443 4533d2                         xor        r10d, r10d
00446 eb1b                           jmp        0x7f0ccbbcb063
00448 48894424f8                     mov        qword ptr [rsp - 8], rax
0044d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
00451 89842498000000                 mov        dword ptr [rsp + 0x98], eax
00458 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0045d 41ba01000000                   mov        r10d, 1
00463 4585f6                         test       r14d, r14d
00466 0f8e4c0f0000                   jle        0x7f0ccbbcbfb8
0046c 4585d2                         test       r10d, r10d
0046f 0f85cc070000                   jne        0x7f0ccbbcb841
00475 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0047d 4403d3                         add        r10d, ebx
00480 458bc1                         mov        r8d, r9d
00483 4403842490000000               add        r8d, dword ptr [rsp + 0x90]
0048b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00490 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00495 41ffc3                         inc        r11d
00498 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0049d 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
004a5 0f8fad030000                   jg         0x7f0ccbbcb458
004ab 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
004b3 0f8f9f030000                   jg         0x7f0ccbbcb458
004b9 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
004c1 4183fa10                       cmp        r10d, 0x10
004c5 0f8fbc010000                   jg         0x7f0ccbbcb287
004cb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
004d0 458b5a04                       mov        r11d, dword ptr [r10 + 4]
004d4 418d6bf1                       lea        ebp, [r11 - 0xf]
004d8 85ed                           test       ebp, ebp
004da 0f8ce4160000                   jl         0x7f0ccbbcc7c4
004e0 4183c3f1                       add        r11d, -0xf
004e4 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
004ec 453bcb                         cmp        r9d, r11d
004ef 0f8342150000                   jae        0x7f0ccbbcc637
004f5 458bd1                         mov        r10d, r9d
004f8 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00500 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00505 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0050d c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00514 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00519 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00521 0f83c5150000                   jae        0x7f0ccbbcc6ec
00527 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0052f 4503d8                         add        r11d, r8d
00532 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00537 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0053c c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00543 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
0054b 4503c2                         add        r8d, r10d
0054e 458bd8                         mov        r11d, r8d
00551 452bde                         sub        r11d, r14d
00554 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0055c 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00564 eb36                           jmp        0x7f0ccbbcb19c
00566 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0056e 4d63d3                         movsxd     r10, r11d
00571 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00578 c442a8f5db                     bzhi       r11, r11, r10
0057d c4c1fb92fb                     kmovq      k7, r11
00582 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00588 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0058e 89ac24a0000000                 mov        dword ptr [rsp + 0xa0], ebp
00595 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0059c 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
005a4 4183fb10                       cmp        r11d, 0x10
005a8 7f79                           jg         0x7f0ccbbcb223
005aa 4183fe10                       cmp        r14d, 0x10
005ae 7c73                           jl         0x7f0ccbbcb223
005b0 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
005b8 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
005c0 0f833a1c0000                   jae        0x7f0ccbbcce00
005c6 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
005cb c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
005d2 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
005da 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
005e2 0f83b41c0000                   jae        0x7f0ccbbcce9c
005e8 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
005f0 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
005f5 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
005fc 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00604 4503da                         add        r11d, r10d
00607 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0060c 48894424f8                     mov        qword ptr [rsp - 8], rax
00611 8b442414                       mov        eax, dword ptr [rsp + 0x14]
00615 89442424                       mov        dword ptr [rsp + 0x24], eax
00619 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0061e e9e2fcffff                     jmp        0x7f0ccbbcaf05
00623 453bf3                         cmp        r14d, r11d
00626 0f8dfd070000                   jge        0x7f0ccbbcba29
0062c 4183fe10                       cmp        r14d, 0x10
00630 0f8df2090000                   jge        0x7f0ccbbcbc28
00636 4183fe08                       cmp        r14d, 8
0063a 0f8d0c0a0000                   jge        0x7f0ccbbcbc4c
00640 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00645 8b9424b0000000                 mov        edx, dword ptr [rsp + 0xb0]
0064c 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
00653 458bc6                         mov        r8d, r14d
00656 458bcb                         mov        r9d, r11d
00659 90                             nop        
0065a 90                             nop        
0065b 90                             nop        
0065c c5f877                         vzeroupper 
0065f e8fc49b6ff                     call       0x7f0ccb72fc60
00664 0f1f84005c070003               nop        dword ptr [rax + rax + 0x300075c]
0066c 48894424f8                     mov        qword ptr [rsp - 8], rax
00671 8b442414                       mov        eax, dword ptr [rsp + 0x14]
00675 89442424                       mov        dword ptr [rsp + 0x24], eax
00679 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0067e 8944240c                       mov        dword ptr [rsp + 0xc], eax
00682 e97efcffff                     jmp        0x7f0ccbbcaf05
00687 4183fa30                       cmp        r10d, 0x30
0068b 7e7b                           jle        0x7f0ccbbcb308
0068d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00692 458b5204                       mov        r10d, dword ptr [r10 + 4]
00696 4585c9                         test       r9d, r9d
00699 0f8c95190000                   jl         0x7f0ccbbccc34
0069f 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
006a4 4585c0                         test       r8d, r8d
006a7 0f8c87190000                   jl         0x7f0ccbbccc34
006ad 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
006b2 0f827c190000                   jb         0x7f0ccbbccc34
006b8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
006bd 443bdb                         cmp        r11d, ebx
006c0 0f826e190000                   jb         0x7f0ccbbccc34
006c6 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
006ce 4585d2                         test       r10d, r10d
006d1 0f84b7feffff                   je         0x7f0ccbbcb18e
006d7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006dc 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
006e1 4883fa20                       cmp        rdx, 0x20
006e5 0f867bfeffff                   jbe        0x7f0ccbbcb166
006eb c5f877                         vzeroupper 
006ee 49ba409171cb0c7f0000           movabs     r10, 0x7f0ccb719140
006f8 41ffd2                         call       r10
006fb 0f1f840000000000               nop        dword ptr [rax + rax]
00703 e986feffff                     jmp        0x7f0ccbbcb18e
00708 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0070d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00711 418d6bf1                       lea        ebp, [r11 - 0xf]
00715 85ed                           test       ebp, ebp
00717 0f8cef190000                   jl         0x7f0ccbbccd0c
0071d 458bd3                         mov        r10d, r11d
00720 458d5af1                       lea        r11d, [r10 - 0xf]
00724 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0072c 453bcb                         cmp        r9d, r11d
0072f 0f8343170000                   jae        0x7f0ccbbcca78
00735 458bd1                         mov        r10d, r9d
00738 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00740 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00745 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0074d c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00754 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00759 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00761 0f83e1170000                   jae        0x7f0ccbbccb48
00767 458d5810                       lea        r11d, [r8 + 0x10]
0076b 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00773 be95ffffff                     mov        esi, 0xffffff95
00778 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0077c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00781 c4c17a7f442a08                 vmovdqu    xmmword ptr [r10 + rbp + 8], xmm0
00788 83c510                         add        ebp, 0x10
0078b 48ff742428                     push       qword ptr [rsp + 0x28]
00790 488f442410                     pop        qword ptr [rsp + 0x10]
00795 48ff742430                     push       qword ptr [rsp + 0x30]
0079a 488f442418                     pop        qword ptr [rsp + 0x18]
0079f 48894424f8                     mov        qword ptr [rsp - 8], rax
007a4 8b442438                       mov        eax, dword ptr [rsp + 0x38]
007a8 8944240c                       mov        dword ptr [rsp + 0xc], eax
007ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007b1 48ff742440                     push       qword ptr [rsp + 0x40]
007b6 488f442428                     pop        qword ptr [rsp + 0x28]
007bb 48ff742478                     push       qword ptr [rsp + 0x78]
007c0 488f442430                     pop        qword ptr [rsp + 0x30]
007c5 48894424f8                     mov        qword ptr [rsp - 8], rax
007ca 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
007ce 89442420                       mov        dword ptr [rsp + 0x20], eax
007d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007d7 48ff742448                     push       qword ptr [rsp + 0x48]
007dc 488f442440                     pop        qword ptr [rsp + 0x40]
007e1 48894424f8                     mov        qword ptr [rsp - 8], rax
007e6 8b442450                       mov        eax, dword ptr [rsp + 0x50]
007ea 89442448                       mov        dword ptr [rsp + 0x48], eax
007ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
007f3 48ff742458                     push       qword ptr [rsp + 0x58]
007f8 488f442450                     pop        qword ptr [rsp + 0x50]
007fd 48ff742468                     push       qword ptr [rsp + 0x68]
00802 488f442458                     pop        qword ptr [rsp + 0x58]
00807 48ff742470                     push       qword ptr [rsp + 0x70]
0080c 488f442460                     pop        qword ptr [rsp + 0x60]
00811 48894424f8                     mov        qword ptr [rsp - 8], rax
00816 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0081d 89442468                       mov        dword ptr [rsp + 0x68], eax
00821 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00826 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0082b 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
00832 90                             nop        
00833 90                             nop        
00834 c5f877                         vzeroupper 
00837 e82426b0ff                     call       0x7f0ccb6cda60
0083c 0f1f840034090004               nop        dword ptr [rax + rax + 0x4000934]
00844 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0084e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00852 e889171e17                     call       0x7f0ce2dacbe0
00857 f4                             hlt        
00858 418be9                         mov        ebp, r9d
0085b 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00860 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00864 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00868 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0086d 8bbc2490000000                 mov        edi, dword ptr [rsp + 0x90]
00874 44893424                       mov        dword ptr [rsp], r14d
00878 48894424f8                     mov        qword ptr [rsp - 8], rax
0087d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00884 89442408                       mov        dword ptr [rsp + 8], eax
00888 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088d 90                             nop        
0088e 90                             nop        
0088f 90                             nop        
00890 c5f877                         vzeroupper 
00893 e8c847b6ff                     call       0x7f0ccb72fc60
00898 0f1f840090090005               nop        dword ptr [rax + rax + 0x5000990]
008a0 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
008a5 48894424f8                     mov        qword ptr [rsp - 8], rax
008aa 8b442414                       mov        eax, dword ptr [rsp + 0x14]
008ae 89442424                       mov        dword ptr [rsp + 0x24], eax
008b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008b7 8944240c                       mov        dword ptr [rsp + 0xc], eax
008bb 4d63e9                         movsxd     r13, r9d
008be 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
008c3 452bc1                         sub        r8d, r9d
008c6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
008cb 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008d0 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
008d5 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
008da 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
008df 0f8d25010000                   jge        0x7f0ccbbcb60a
008e5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
008ea 458b5a04                       mov        r11d, dword ptr [r10 + 4]
008ee 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
008f3 453bd3                         cmp        r10d, r11d
008f6 0f83fc090000                   jae        0x7f0ccbbcbef8
008fc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00901 8b4c2424                       mov        ecx, dword ptr [rsp + 0x24]
00905 4d8b54ca08                     mov        r10, qword ptr [r10 + rcx*8 + 8]
0090a 4d8bda                         mov        r11, r10
0090d 49c1eb12                       shr        r11, 0x12
00911 458bdb                         mov        r11d, r11d
00914 4181e3ffff0300                 and        r11d, 0x3ffff
0091b 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00923 4d8bda                         mov        r11, r10
00926 49c1fb24                       sar        r11, 0x24
0092a 418bca                         mov        ecx, r10d
0092d 458bd3                         mov        r10d, r11d
00930 81e1ffff0100                   and        ecx, 0x1ffff
00936 4585d2                         test       r10d, r10d
00939 7d25                           jge        0x7f0ccbbcb560
0093b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00940 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00944 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
00949 453bd3                         cmp        r10d, r11d
0094c 0f83700a0000                   jae        0x7f0ccbbcbfc2
00952 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00957 8b5c2424                       mov        ebx, dword ptr [rsp + 0x24]
0095b 458b549a08                     mov        r10d, dword ptr [r10 + rbx*4 + 8]
00960 85c9                           test       ecx, ecx
00962 0f84c9020000                   je         0x7f0ccbbcb831
00968 413bc8                         cmp        ecx, r8d
0096b 0f8f1b0a0000                   jg         0x7f0ccbbcbf8c
00971 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
00978 4183fa03                       cmp        r10d, 3
0097c 0f8f94f9ffff                   jg         0x7f0ccbbcaf16
00982 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0098a 4585db                         test       r11d, r11d
0098d 7403                           je         0x7f0ccbbcb592
0098f 41ffca                         dec        r10d
00992 4585d2                         test       r10d, r10d
00995 0f84f9020000                   je         0x7f0ccbbcb894
0099b 4183fa03                       cmp        r10d, 3
0099f 0f8415030000                   je         0x7f0ccbbcb8ba
009a5 4183fa02                       cmp        r10d, 2
009a9 0f86adf9ffff                   jbe        0x7f0ccbbcaf5c
009af 48be7000a5e200000000           movabs     rsi, 0xe2a50070
009b9 418be9                         mov        ebp, r9d
009bc c5f877                         vzeroupper 
009bf e89c46b6ff                     call       0x7f0ccb72fc60
009c4 0f1f8400bc0a0006               nop        dword ptr [rax + rax + 0x6000abc]
009cc 4885c0                         test       rax, rax
009cf 0f84df0d0000                   je         0x7f0ccbbcc3b4
009d5 488bf0                         mov        rsi, rax
009d8 c5f877                         vzeroupper 
009db 4881c4d0000000                 add        rsp, 0xd0
009e2 5d                             pop        rbp
009e3 e978a5afff                     jmp        0x7f0ccb6c5b60
009e8 4d63d0                         movsxd     r10, r8d
009eb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009f2 c442a8f5db                     bzhi       r11, r11, r10
009f7 c4c1fb92fb                     kmovq      k7, r11
009fc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a02 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a08 eb7a                           jmp        0x7f0ccbbcb684
00a0a 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00a0f 458b5304                       mov        r10d, dword ptr [r11 + 4]
00a13 4585c9                         test       r9d, r9d
00a16 0f8ca00e0000                   jl         0x7f0ccbbcc4bc
00a1c 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00a20 85db                           test       ebx, ebx
00a22 0f8c980e0000                   jl         0x7f0ccbbcc4c0
00a28 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00a2d 0f828d0e0000                   jb         0x7f0ccbbcc4c0
00a33 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00a37 4103e8                         add        ebp, r8d
00a3a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a3f 443bd5                         cmp        r10d, ebp
00a42 0f82780e0000                   jb         0x7f0ccbbcc4c0
00a48 4585c0                         test       r8d, r8d
00a4b 0f8c6f0e0000                   jl         0x7f0ccbbcc4c0
00a51 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00a55 413bc9                         cmp        ecx, r9d
00a58 742a                           je         0x7f0ccbbcb684
00a5a 4b8d7c2b08                     lea        rdi, [r11 + r13 + 8]
00a5f 4963d0                         movsxd     rdx, r8d
00a62 4883fa20                       cmp        rdx, 0x20
00a66 0f867cffffff                   jbe        0x7f0ccbbcb5e8
00a6c c5f877                         vzeroupper 
00a6f 49ba409171cb0c7f0000           movabs     r10, 0x7f0ccb719140
00a79 41ffd2                         call       r10
00a7c 0f1f840000000000               nop        dword ptr [rax + rax]
00a84 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00a89 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00a8d c5f877                         vzeroupper 
00a90 4881c4d0000000                 add        rsp, 0xd0
00a97 5d                             pop        rbp
00a98 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a9c 0f879a1b0000                   ja         0x7f0ccbbcd23c
00aa2 c3                             ret        
00aa3 90                             nop        
00aa4 448bd7                         mov        r10d, edi
00aa7 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00aaf 478b5c9304                     mov        r11d, dword ptr [r11 + r10*4 + 4]
00ab4 488b8c2488000000               mov        rcx, qword ptr [rsp + 0x88]
00abc 46895c9108                     mov        dword ptr [rcx + r10*4 + 8], r11d
00ac1 418d7aff                       lea        edi, [r10 - 1]
00ac5 413bf8                         cmp        edi, r8d
00ac8 7fda                           jg         0x7f0ccbbcb6a4
00aca 83ff3f                         cmp        edi, 0x3f
00acd 0f8e0d0f0000                   jle        0x7f0ccbbcc5e0
00ad3 4c63df                         movsxd     r11, edi
00ad6 49ffcb                         dec        r11
00ad9 4c3bd8                         cmp        r11, rax
00adc 0f83050f0000                   jae        0x7f0ccbbcc5e7
00ae2 4183c2c0                       add        r10d, -0x40
00ae6 4d63da                         movsxd     r11, r10d
00ae9 49ffcb                         dec        r11
00aec 4c3bd8                         cmp        r11, rax
00aef 0f83060f0000                   jae        0x7f0ccbbcc5fb
00af5 3bfa                           cmp        edi, edx
00af7 0f83120f0000                   jae        0x7f0ccbbcc60f
00afd 443bd2                         cmp        r10d, edx
00b00 0f831d0f0000                   jae        0x7f0ccbbcc623
00b06 eb0a                           jmp        0x7f0ccbbcb712
00b08 90                             nop        
00b09 90                             nop        
00b0a 90                             nop        
00b0b 90                             nop        
00b0c 90                             nop        
00b0d 90                             nop        
00b0e 90                             nop        
00b0f 90                             nop        
00b10 8bf9                           mov        edi, ecx
00b12 448d57c1                       lea        r10d, [rdi - 0x3f]
00b16 448d47d0                       lea        r8d, [rdi - 0x30]
00b1a 448d5ff1                       lea        r11d, [rdi - 0xf]
00b1e 8d5ff0                         lea        ebx, [rdi - 0x10]
00b21 488b8c2488000000               mov        rcx, qword ptr [rsp + 0x88]
00b29 62f17e486f849908000000         vmovdqu32  zmm0, zmmword ptr [rcx + rbx*4 + 8]
00b34 62b17e487f849908000000         vmovdqu32  zmmword ptr [rcx + r11*4 + 8], zmm0
00b3f 8d4fe1                         lea        ecx, [rdi - 0x1f]
00b42 448d5fe0                       lea        r11d, [rdi - 0x20]
00b46 488b9c2488000000               mov        rbx, qword ptr [rsp + 0x88]
00b4e 62b17e486f849b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11*4 + 8]
00b59 62f17e487f848b08000000         vmovdqu32  zmmword ptr [rbx + rcx*4 + 8], zmm0
00b64 62b17e486f848308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r8*4 + 8]
00b6f 448d47d1                       lea        r8d, [rdi - 0x2f]
00b73 62b17e487f848308000000         vmovdqu32  zmmword ptr [rbx + r8*4 + 8], zmm0
00b7e 8d4fc0                         lea        ecx, [rdi - 0x40]
00b81 62f17e486f848b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + rcx*4 + 8]
00b8c 62b17e487f849308000000         vmovdqu32  zmmword ptr [rbx + r10*4 + 8], zmm0
00b97 83f93f                         cmp        ecx, 0x3f
00b9a 0f8f70ffffff                   jg         0x7f0ccbbcb710
00ba0 83f90f                         cmp        ecx, 0xf
00ba3 7e45                           jle        0x7f0ccbbcb7ea
00ba5 83c7b1                         add        edi, -0x4f
00ba8 4c63d7                         movsxd     r10, edi
00bab 49ffca                         dec        r10
00bae 4c3bd0                         cmp        r10, rax
00bb1 0f83c1100000                   jae        0x7f0ccbbcc878
00bb7 3bfa                           cmp        edi, edx
00bb9 0f83e1100000                   jae        0x7f0ccbbcc8a0
00bbf 90                             nop        
00bc0 448d59f1                       lea        r11d, [rcx - 0xf]
00bc4 83c1f0                         add        ecx, -0x10
00bc7 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bcf 62d17e486f848a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + rcx*4 + 8]
00bda 62917e487f849a08000000         vmovdqu32  zmmword ptr [r10 + r11*4 + 8], zmm0
00be5 83f90f                         cmp        ecx, 0xf
00be8 7fd6                           jg         0x7f0ccbbcb7c0
00bea 85c9                           test       ecx, ecx
00bec 0f8eeaf7ffff                   jle        0x7f0ccbbcafdc
00bf2 4c63d1                         movsxd     r10, ecx
00bf5 49ffca                         dec        r10
00bf8 4c3bd0                         cmp        r10, rax
00bfb 0f838b100000                   jae        0x7f0ccbbcc88c
00c01 3bca                           cmp        ecx, edx
00c03 0f83ab100000                   jae        0x7f0ccbbcc8b4
00c09 90                             nop        
00c0a 90                             nop        
00c0b 90                             nop        
00c0c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00c14 458b548a04                     mov        r10d, dword ptr [r10 + rcx*4 + 4]
00c19 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00c21 4589548b08                     mov        dword ptr [r11 + rcx*4 + 8], r10d
00c26 ffc9                           dec        ecx
00c28 85c9                           test       ecx, ecx
00c2a 7fe0                           jg         0x7f0ccbbcb80c
00c2c e9abf7ffff                     jmp        0x7f0ccbbcafdc
00c31 4533c0                         xor        r8d, r8d
00c34 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00c3c e937fdffff                     jmp        0x7f0ccbbcb578
00c41 4c2bd8                         sub        r11, rax
00c44 4d85db                         test       r11, r11
00c47 0f8d6b070000                   jge        0x7f0ccbbcbfb8
00c4d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00c52 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
00c56 4d85d2                         test       r10, r10
00c59 0f8559070000                   jne        0x7f0ccbbcbfb8
00c5f bd08000000                     mov        ebp, 8
00c64 be17000000                     mov        esi, 0x17
00c69 448974240c                     mov        dword ptr [rsp + 0xc], r14d
00c6e 90                             nop        
00c6f 90                             nop        
00c70 c5f877                         vzeroupper 
00c73 e8e821b0ff                     call       0x7f0ccb6cda60
00c78 0f1f8400700d0007               nop        dword ptr [rax + rax + 0x7000d70]
00c80 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
00c8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c8e e84d131e17                     call       0x7f0ce2dacbe0
00c93 f4                             hlt        
00c94 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00c9c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00ca0 4585d2                         test       r10d, r10d
00ca3 0f861f100000                   jbe        0x7f0ccbbcc8c8
00ca9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00cb1 418b6a08                       mov        ebp, dword ptr [r10 + 8]
00cb5 e936f7ffff                     jmp        0x7f0ccbbcaff0
00cba 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00cc2 458b5204                       mov        r10d, dword ptr [r10 + 4]
00cc6 4183fa02                       cmp        r10d, 2
00cca 0f86bc100000                   jbe        0x7f0ccbbcc98c
00cd0 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00cd8 418b6a08                       mov        ebp, dword ptr [r10 + 8]
00cdc ffcd                           dec        ebp
00cde 85ed                           test       ebp, ebp
00ce0 7e29                           jle        0x7f0ccbbcb90b
00ce2 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00ce6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00cee 45895310                       mov        dword ptr [r11 + 0x10], r10d
00cf2 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00cf6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00cfe 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00d02 41896a08                       mov        dword ptr [r10 + 8], ebp
00d06 e9e5f6ffff                     jmp        0x7f0ccbbcaff0
00d0b 48be9800a5e200000000           movabs     rsi, 0xe2a50098
00d15 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00d1a 48ff742430                     push       qword ptr [rsp + 0x30]
00d1f 488f442410                     pop        qword ptr [rsp + 0x10]
00d24 48894424f8                     mov        qword ptr [rsp - 8], rax
00d29 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00d2d 89442418                       mov        dword ptr [rsp + 0x18], eax
00d31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d36 48ff742440                     push       qword ptr [rsp + 0x40]
00d3b 488f442428                     pop        qword ptr [rsp + 0x28]
00d40 48894424f8                     mov        qword ptr [rsp - 8], rax
00d45 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00d49 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00d4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d52 48ff742448                     push       qword ptr [rsp + 0x48]
00d57 488f442440                     pop        qword ptr [rsp + 0x40]
00d5c 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00d61 48894424f8                     mov        qword ptr [rsp - 8], rax
00d66 8b442450                       mov        eax, dword ptr [rsp + 0x50]
00d6a 89442448                       mov        dword ptr [rsp + 0x48], eax
00d6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d73 48ff742458                     push       qword ptr [rsp + 0x58]
00d78 488f442450                     pop        qword ptr [rsp + 0x50]
00d7d 48894424f8                     mov        qword ptr [rsp - 8], rax
00d82 8b442460                       mov        eax, dword ptr [rsp + 0x60]
00d86 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00d8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00d8f 48ff742468                     push       qword ptr [rsp + 0x68]
00d94 488f442458                     pop        qword ptr [rsp + 0x58]
00d99 48ff742470                     push       qword ptr [rsp + 0x70]
00d9e 488f442460                     pop        qword ptr [rsp + 0x60]
00da3 90                             nop        
00da4 c5f877                         vzeroupper 
00da7 e8b442b6ff                     call       0x7f0ccb72fc60
00dac 0f1f8400a40e0008               nop        dword ptr [rax + rax + 0x8000ea4]
00db4 4885c0                         test       rax, rax
00db7 0f8518fcffff                   jne        0x7f0ccbbcb5d5
00dbd bef6ffffff                     mov        esi, 0xfffffff6
00dc2 90                             nop        
00dc3 90                             nop        
00dc4 c5f877                         vzeroupper 
00dc7 e89420b0ff                     call       0x7f0ccb6cda60
00dcc 0f1f8400c40e0009               nop        dword ptr [rax + rax + 0x9000ec4]
00dd4 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
00dde 4883e4f0                       and        rsp, 0xfffffffffffffff0
00de2 e8f9111e17                     call       0x7f0ce2dacbe0
00de7 f4                             hlt        
00de8 4c63d5                         movsxd     r10, ebp
00deb 4c3b542468                     cmp        r10, qword ptr [rsp + 0x68]
00df0 7c27                           jl         0x7f0ccbbcba19
00df2 483b442470                     cmp        rax, qword ptr [rsp + 0x70]
00df7 7e10                           jle        0x7f0ccbbcba09
00df9 4533d2                         xor        r10d, r10d
00dfc 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00e04 e954f6ffff                     jmp        0x7f0ccbbcb05d
00e09 4533d2                         xor        r10d, r10d
00e0c 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00e14 e92af6ffff                     jmp        0x7f0ccbbcb043
00e19 4533d2                         xor        r10d, r10d
00e1c 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00e24 e934f6ffff                     jmp        0x7f0ccbbcb05d
00e29 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00e2e 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00e36 4503d3                         add        r10d, r11d
00e39 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e3e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00e46 4183fb30                       cmp        r11d, 0x30
00e4a 0f8ed3000000                   jle        0x7f0ccbbcbb23
00e50 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00e58 4585d2                         test       r10d, r10d
00e5b 0f8cdf140000                   jl         0x7f0ccbbccf40
00e61 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00e69 4585db                         test       r11d, r11d
00e6c 0f8cce140000                   jl         0x7f0ccbbccf40
00e72 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00e7a 44039c24a0000000               add        r11d, dword ptr [rsp + 0xa0]
00e82 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e87 453bd3                         cmp        r10d, r11d
00e8a 0f82b0140000                   jb         0x7f0ccbbccf40
00e90 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00e95 0f82a5140000                   jb         0x7f0ccbbccf40
00e9b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00ea3 4585d2                         test       r10d, r10d
00ea6 0f8460f7ffff                   je         0x7f0ccbbcb20c
00eac 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00eb1 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00eb9 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00ebe 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00ec6 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00ecb 4863942494000000               movsxd     rdx, dword ptr [rsp + 0x94]
00ed3 4883fa20                       cmp        rdx, 0x20
00ed7 772d                           ja         0x7f0ccbbcbb06
00ed9 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00ee1 4d63d3                         movsxd     r10, r11d
00ee4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00eeb c442a8f5db                     bzhi       r11, r11, r10
00ef0 c4c1fb92fb                     kmovq      k7, r11
00ef5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00efb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f01 e906f7ffff                     jmp        0x7f0ccbbcb20c
00f06 c5f877                         vzeroupper 
00f09 49ba409171cb0c7f0000           movabs     r10, 0x7f0ccb719140
00f13 41ffd2                         call       r10
00f16 0f1f840000000000               nop        dword ptr [rax + rax]
00f1e e9e9f6ffff                     jmp        0x7f0ccbbcb20c
00f23 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00f28 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00f2f 90                             nop        
00f30 c5f877                         vzeroupper 
00f33 e82841b6ff                     call       0x7f0ccb72fc60
00f38 0f1f84003010000a               nop        dword ptr [rax + rax + 0xa001030]
00f40 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00f44 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00f49 8b9424b0000000                 mov        edx, dword ptr [rsp + 0xb0]
00f50 488bc8                         mov        rcx, rax
00f53 90                             nop        
00f54 c5f877                         vzeroupper 
00f57 e80441b6ff                     call       0x7f0ccb72fc60
00f5c 0f1f84005410000b               nop        dword ptr [rax + rax + 0xb001054]
00f64 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00f69 458bd3                         mov        r10d, r11d
00f6c 44039424b0000000               add        r10d, dword ptr [rsp + 0xb0]
00f74 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00f7c be95ffffff                     mov        esi, 0xffffff95
00f81 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00f89 458bd3                         mov        r10d, r11d
00f8c 458d5a08                       lea        r11d, [r10 + 8]
00f90 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00f98 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
00f9f 83c508                         add        ebp, 8
00fa2 48ff742428                     push       qword ptr [rsp + 0x28]
00fa7 488f442410                     pop        qword ptr [rsp + 0x10]
00fac 48ff742430                     push       qword ptr [rsp + 0x30]
00fb1 488f442418                     pop        qword ptr [rsp + 0x18]
00fb6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fbb 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00fbf 8944240c                       mov        dword ptr [rsp + 0xc], eax
00fc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc8 48ff742440                     push       qword ptr [rsp + 0x40]
00fcd 488f442428                     pop        qword ptr [rsp + 0x28]
00fd2 48ff742478                     push       qword ptr [rsp + 0x78]
00fd7 488f442430                     pop        qword ptr [rsp + 0x30]
00fdc 48894424f8                     mov        qword ptr [rsp - 8], rax
00fe1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00fe5 89442438                       mov        dword ptr [rsp + 0x38], eax
00fe9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fee 48ff742468                     push       qword ptr [rsp + 0x68]
00ff3 488f442460                     pop        qword ptr [rsp + 0x60]
00ff8 48ff742470                     push       qword ptr [rsp + 0x70]
00ffd 488f442468                     pop        qword ptr [rsp + 0x68]
01002 90                             nop        
01003 90                             nop        
01004 c5f877                         vzeroupper 
01007 e8541eb0ff                     call       0x7f0ccb6cda60
0100c 0f1f84000411000c               nop        dword ptr [rax + rax + 0xc001104]
01014 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0101e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01022 e8b90f1e17                     call       0x7f0ce2dacbe0
01027 f4                             hlt        
01028 458bd3                         mov        r10d, r11d
0102b 44039424b0000000               add        r10d, dword ptr [rsp + 0xb0]
01033 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01038 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
0103f 448bac24b0000000               mov        r13d, dword ptr [rsp + 0xb0]
01047 e917f2ffff                     jmp        0x7f0ccbbcae63
0104c 44039c24b0000000               add        r11d, dword ptr [rsp + 0xb0]
01054 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0105c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
01061 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
01068 c5f877                         vzeroupper 
0106b e8f03fb6ff                     call       0x7f0ccb72fc60
01070 0f1f84006811000d               nop        dword ptr [rax + rax + 0xd001168]
01078 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
0107d 8b9424b0000000                 mov        edx, dword ptr [rsp + 0xb0]
01084 488bc8                         mov        rcx, rax
01087 90                             nop        
01088 c5f877                         vzeroupper 
0108b e8d03fb6ff                     call       0x7f0ccb72fc60
01090 0f1f84008811000e               nop        dword ptr [rax + rax + 0xe001188]
01098 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
010a0 458d5a08                       lea        r11d, [r10 + 8]
010a4 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
010ac be95ffffff                     mov        esi, 0xffffff95
010b1 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
010b8 83c508                         add        ebp, 8
010bb 48ff742428                     push       qword ptr [rsp + 0x28]
010c0 488f442410                     pop        qword ptr [rsp + 0x10]
010c5 48ff742430                     push       qword ptr [rsp + 0x30]
010ca 488f442418                     pop        qword ptr [rsp + 0x18]
010cf 48894424f8                     mov        qword ptr [rsp - 8], rax
010d4 8b442438                       mov        eax, dword ptr [rsp + 0x38]
010d8 8944240c                       mov        dword ptr [rsp + 0xc], eax
010dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010e1 48ff742440                     push       qword ptr [rsp + 0x40]
010e6 488f442428                     pop        qword ptr [rsp + 0x28]
010eb 48894424f8                     mov        qword ptr [rsp - 8], rax
010f0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
010f4 89442438                       mov        dword ptr [rsp + 0x38], eax
010f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01102 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01106 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0110a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110f 48ff742458                     push       qword ptr [rsp + 0x58]
01114 488f442450                     pop        qword ptr [rsp + 0x50]
01119 48ff742468                     push       qword ptr [rsp + 0x68]
0111e 488f442460                     pop        qword ptr [rsp + 0x60]
01123 48ff742470                     push       qword ptr [rsp + 0x70]
01128 488f442468                     pop        qword ptr [rsp + 0x68]
0112d 90                             nop        
0112e 90                             nop        
0112f 90                             nop        
01130 c5f877                         vzeroupper 
01133 e8281db0ff                     call       0x7f0ccb6cda60
01138 0f1f84003012000f               nop        dword ptr [rax + rax + 0xf001230]
01140 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0114a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0114e e88d0e1e17                     call       0x7f0ce2dacbe0
01153 f4                             hlt        
01154 bee4ffffff                     mov        esi, 0xffffffe4
01159 48ff742428                     push       qword ptr [rsp + 0x28]
0115e 488f442410                     pop        qword ptr [rsp + 0x10]
01163 48ff742430                     push       qword ptr [rsp + 0x30]
01168 488f442418                     pop        qword ptr [rsp + 0x18]
0116d 48894424f8                     mov        qword ptr [rsp - 8], rax
01172 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01176 89442428                       mov        dword ptr [rsp + 0x28], eax
0117a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0117f 48ff742440                     push       qword ptr [rsp + 0x40]
01184 488f442430                     pop        qword ptr [rsp + 0x30]
01189 48ff742478                     push       qword ptr [rsp + 0x78]
0118e 488f442440                     pop        qword ptr [rsp + 0x40]
01193 48894424f8                     mov        qword ptr [rsp - 8], rax
01198 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0119c 8944242c                       mov        dword ptr [rsp + 0x2c], eax
011a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011a5 48ffb42488000000               push       qword ptr [rsp + 0x88]
011ad 488f442438                     pop        qword ptr [rsp + 0x38]
011b2 48894424f8                     mov        qword ptr [rsp - 8], rax
011b7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
011bb 89442454                       mov        dword ptr [rsp + 0x54], eax
011bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c4 48ff742468                     push       qword ptr [rsp + 0x68]
011c9 488f442460                     pop        qword ptr [rsp + 0x60]
011ce 48ff742470                     push       qword ptr [rsp + 0x70]
011d3 488f442468                     pop        qword ptr [rsp + 0x68]
011d8 48894424f8                     mov        qword ptr [rsp - 8], rax
011dd 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
011e4 89442470                       mov        dword ptr [rsp + 0x70], eax
011e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ed 48894424f8                     mov        qword ptr [rsp - 8], rax
011f2 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
011f9 89442474                       mov        dword ptr [rsp + 0x74], eax
011fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01202 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01207 90                             nop        
01208 c5f877                         vzeroupper 
0120b e8501cb0ff                     call       0x7f0ccb6cda60
01210 0f1f840008130010               nop        dword ptr [rax + rax + 0x10001308]
01218 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01222 4883e4f0                       and        rsp, 0xfffffffffffffff0
01226 e8b50d1e17                     call       0x7f0ce2dacbe0
0122b f4                             hlt        
0122c c5fa7f442410                   vmovdqu    xmmword ptr [rsp + 0x10], xmm0
01232 bee4ffffff                     mov        esi, 0xffffffe4
01237 48894424f8                     mov        qword ptr [rsp - 8], rax
0123c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01240 89442454                       mov        dword ptr [rsp + 0x54], eax
01244 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01249 48ff742468                     push       qword ptr [rsp + 0x68]
0124e 488f442460                     pop        qword ptr [rsp + 0x60]
01253 48ff742470                     push       qword ptr [rsp + 0x70]
01258 488f442468                     pop        qword ptr [rsp + 0x68]
0125d 48894424f8                     mov        qword ptr [rsp - 8], rax
01262 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01269 89442470                       mov        dword ptr [rsp + 0x70], eax
0126d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01272 48894424f8                     mov        qword ptr [rsp - 8], rax
01277 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0127e 89442474                       mov        dword ptr [rsp + 0x74], eax
01282 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01287 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
0128f 90                             nop        
01290 c5f877                         vzeroupper 
01293 e8c81bb0ff                     call       0x7f0ccb6cda60
01298 0f1f840090130011               nop        dword ptr [rax + rax + 0x11001390]
012a0 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
012aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
012ae e82d0d1e17                     call       0x7f0ce2dacbe0
012b3 f4                             hlt        
012b4 4533d2                         xor        r10d, r10d
012b7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
012bc e9a4eeffff                     jmp        0x7f0ccbbcad65
012c1 4533d2                         xor        r10d, r10d
012c4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
012c9 e9c1eeffff                     jmp        0x7f0ccbbcad8f
012ce 4533d2                         xor        r10d, r10d
012d1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
012d6 e9e6eeffff                     jmp        0x7f0ccbbcadc1
012db 4533d2                         xor        r10d, r10d
012de 4c89542478                     mov        qword ptr [rsp + 0x78], r10
012e3 e903efffff                     jmp        0x7f0ccbbcadeb
012e8 4533d2                         xor        r10d, r10d
012eb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
012f3 e928efffff                     jmp        0x7f0ccbbcae20
012f8 bee4ffffff                     mov        esi, 0xffffffe4
012fd 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01302 48ff742430                     push       qword ptr [rsp + 0x30]
01307 488f442410                     pop        qword ptr [rsp + 0x10]
0130c 48894424f8                     mov        qword ptr [rsp - 8], rax
01311 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01315 89442418                       mov        dword ptr [rsp + 0x18], eax
01319 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131e 48ff742478                     push       qword ptr [rsp + 0x78]
01323 488f442430                     pop        qword ptr [rsp + 0x30]
01328 48894424f8                     mov        qword ptr [rsp - 8], rax
0132d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01331 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01335 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0133a 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0133f 48894424f8                     mov        qword ptr [rsp - 8], rax
01344 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01348 89442454                       mov        dword ptr [rsp + 0x54], eax
0134c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01351 48ff742468                     push       qword ptr [rsp + 0x68]
01356 488f442460                     pop        qword ptr [rsp + 0x60]
0135b 48ff742470                     push       qword ptr [rsp + 0x70]
01360 488f442468                     pop        qword ptr [rsp + 0x68]
01365 90                             nop        
01366 90                             nop        
01367 90                             nop        
01368 c5f877                         vzeroupper 
0136b e8f01ab0ff                     call       0x7f0ccb6cda60
01370 0f1f840068140012               nop        dword ptr [rax + rax + 0x12001468]
01378 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01382 4883e4f0                       and        rsp, 0xfffffffffffffff0
01386 e8550c1e17                     call       0x7f0ce2dacbe0
0138b f4                             hlt        
0138c be17000000                     mov        esi, 0x17
01391 90                             nop        
01392 90                             nop        
01393 90                             nop        
01394 c5f877                         vzeroupper 
01397 e8c41ab0ff                     call       0x7f0ccb6cda60
0139c 0f1f840094140013               nop        dword ptr [rax + rax + 0x13001494]
013a4 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
013ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
013b2 e8290c1e17                     call       0x7f0ce2dacbe0
013b7 f4                             hlt        
013b8 bd02000000                     mov        ebp, 2
013bd e9a2f8ffff                     jmp        0x7f0ccbbcb864
013c2 bee4ffffff                     mov        esi, 0xffffffe4
013c7 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
013cc 48ff742430                     push       qword ptr [rsp + 0x30]
013d1 488f442410                     pop        qword ptr [rsp + 0x10]
013d6 48894424f8                     mov        qword ptr [rsp - 8], rax
013db 8b442438                       mov        eax, dword ptr [rsp + 0x38]
013df 89442418                       mov        dword ptr [rsp + 0x18], eax
013e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e8 48ff742440                     push       qword ptr [rsp + 0x40]
013ed 488f442428                     pop        qword ptr [rsp + 0x28]
013f2 48894424f8                     mov        qword ptr [rsp - 8], rax
013f7 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013fb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
013ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01404 48ff742448                     push       qword ptr [rsp + 0x48]
01409 488f442440                     pop        qword ptr [rsp + 0x40]
0140e 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01413 48894424f8                     mov        qword ptr [rsp - 8], rax
01418 8b442450                       mov        eax, dword ptr [rsp + 0x50]
0141c 89442448                       mov        dword ptr [rsp + 0x48], eax
01420 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01425 48ff742458                     push       qword ptr [rsp + 0x58]
0142a 488f442450                     pop        qword ptr [rsp + 0x50]
0142f 48894424f8                     mov        qword ptr [rsp - 8], rax
01434 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01438 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0143c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01441 48ff742468                     push       qword ptr [rsp + 0x68]
01446 488f442458                     pop        qword ptr [rsp + 0x58]
0144b 48ff742470                     push       qword ptr [rsp + 0x70]
01450 488f442460                     pop        qword ptr [rsp + 0x60]
01455 48894424f8                     mov        qword ptr [rsp - 8], rax
0145a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01461 89442468                       mov        dword ptr [rsp + 0x68], eax
01465 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146a 894c2470                       mov        dword ptr [rsp + 0x70], ecx
0146e 90                             nop        
0146f 90                             nop        
01470 c5f877                         vzeroupper 
01473 e8e819b0ff                     call       0x7f0ccb6cda60
01478 0f1f840070150014               nop        dword ptr [rax + rax + 0x14001570]
01480 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0148a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0148e e84d0b1e17                     call       0x7f0ce2dacbe0
01493 f4                             hlt        
01494 bee4ffffff                     mov        esi, 0xffffffe4
01499 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0149e 48ff742430                     push       qword ptr [rsp + 0x30]
014a3 488f442410                     pop        qword ptr [rsp + 0x10]
014a8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ad 8b442438                       mov        eax, dword ptr [rsp + 0x38]
014b1 89442418                       mov        dword ptr [rsp + 0x18], eax
014b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ba 48ff742440                     push       qword ptr [rsp + 0x40]
014bf 488f442428                     pop        qword ptr [rsp + 0x28]
014c4 48ff742478                     push       qword ptr [rsp + 0x78]
014c9 488f442430                     pop        qword ptr [rsp + 0x30]
014ce 48894424f8                     mov        qword ptr [rsp - 8], rax
014d3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
014d7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
014db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e0 48ff742448                     push       qword ptr [rsp + 0x48]
014e5 488f442440                     pop        qword ptr [rsp + 0x40]
014ea 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014ef 48894424f8                     mov        qword ptr [rsp - 8], rax
014f4 8b442450                       mov        eax, dword ptr [rsp + 0x50]
014f8 89442448                       mov        dword ptr [rsp + 0x48], eax
014fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01501 48ff742458                     push       qword ptr [rsp + 0x58]
01506 488f442450                     pop        qword ptr [rsp + 0x50]
0150b 48894424f8                     mov        qword ptr [rsp - 8], rax
01510 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01514 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01518 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0151d 48ff742468                     push       qword ptr [rsp + 0x68]
01522 488f442458                     pop        qword ptr [rsp + 0x58]
01527 48ff742470                     push       qword ptr [rsp + 0x70]
0152c 488f442460                     pop        qword ptr [rsp + 0x60]
01531 48894424f8                     mov        qword ptr [rsp - 8], rax
01536 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0153d 89442468                       mov        dword ptr [rsp + 0x68], eax
01541 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01546 48894424f8                     mov        qword ptr [rsp - 8], rax
0154b 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01552 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01556 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155b 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01560 c5f877                         vzeroupper 
01563 e8f818b0ff                     call       0x7f0ccb6cda60
01568 0f1f840060160015               nop        dword ptr [rax + rax + 0x15001660]
01570 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0157a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0157e e85d0a1e17                     call       0x7f0ce2dacbe0
01583 f4                             hlt        
01584 c5fa7f442410                   vmovdqu    xmmword ptr [rsp + 0x10], xmm0
0158a e9a3fcffff                     jmp        0x7f0ccbbcbe32
0158f be85ffffff                     mov        esi, 0xffffff85
01594 48894424f8                     mov        qword ptr [rsp - 8], rax
01599 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0159d 89442410                       mov        dword ptr [rsp + 0x10], eax
015a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a6 48894424f8                     mov        qword ptr [rsp - 8], rax
015ab 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015af 89442414                       mov        dword ptr [rsp + 0x14], eax
015b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b8 48894424f8                     mov        qword ptr [rsp - 8], rax
015bd 8b442420                       mov        eax, dword ptr [rsp + 0x20]
015c1 89442418                       mov        dword ptr [rsp + 0x18], eax
015c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ca 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
015cf 90                             nop        
015d0 c5f877                         vzeroupper 
015d3 e88818b0ff                     call       0x7f0ccb6cda60
015d8 0f1f8400d0160016               nop        dword ptr [rax + rax + 0x160016d0]
015e0 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
015ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ee e8ed091e17                     call       0x7f0ce2dacbe0
015f3 f4                             hlt        
015f4 4533d2                         xor        r10d, r10d
015f7 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
015ff eb0d                           jmp        0x7f0ccbbcc20e
01601 48ff742448                     push       qword ptr [rsp + 0x48]
01606 488f842490000000               pop        qword ptr [rsp + 0x90]
0160e be6effffff                     mov        esi, 0xffffff6e
01613 48ff742428                     push       qword ptr [rsp + 0x28]
01618 488f442410                     pop        qword ptr [rsp + 0x10]
0161d 48ff742430                     push       qword ptr [rsp + 0x30]
01622 488f442418                     pop        qword ptr [rsp + 0x18]
01627 48894424f8                     mov        qword ptr [rsp - 8], rax
0162c 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01630 89442428                       mov        dword ptr [rsp + 0x28], eax
01634 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01639 48ff742440                     push       qword ptr [rsp + 0x40]
0163e 488f442430                     pop        qword ptr [rsp + 0x30]
01643 48894424f8                     mov        qword ptr [rsp - 8], rax
01648 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0164c 8944242c                       mov        dword ptr [rsp + 0x2c], eax
01650 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01655 48894424f8                     mov        qword ptr [rsp - 8], rax
0165a 8b442450                       mov        eax, dword ptr [rsp + 0x50]
0165e 89442448                       mov        dword ptr [rsp + 0x48], eax
01662 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01667 48ff742458                     push       qword ptr [rsp + 0x58]
0166c 488f442450                     pop        qword ptr [rsp + 0x50]
01671 48894424f8                     mov        qword ptr [rsp - 8], rax
01676 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0167a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0167e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01683 48ff742468                     push       qword ptr [rsp + 0x68]
01688 488f442458                     pop        qword ptr [rsp + 0x58]
0168d 48ff742470                     push       qword ptr [rsp + 0x70]
01692 488f442460                     pop        qword ptr [rsp + 0x60]
01697 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
0169c c5f877                         vzeroupper 
0169f e8bc17b0ff                     call       0x7f0ccb6cda60
016a4 0f1f84009c170017               nop        dword ptr [rax + rax + 0x1700179c]
016ac 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
016b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016ba e821091e17                     call       0x7f0ce2dacbe0
016bf f4                             hlt        
016c0 bee4ffffff                     mov        esi, 0xffffffe4
016c5 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
016ca 48ff742430                     push       qword ptr [rsp + 0x30]
016cf 488f442410                     pop        qword ptr [rsp + 0x10]
016d4 48894424f8                     mov        qword ptr [rsp - 8], rax
016d9 8b442438                       mov        eax, dword ptr [rsp + 0x38]
016dd 89442418                       mov        dword ptr [rsp + 0x18], eax
016e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e6 48ff742440                     push       qword ptr [rsp + 0x40]
016eb 488f442428                     pop        qword ptr [rsp + 0x28]
016f0 48ff742478                     push       qword ptr [rsp + 0x78]
016f5 488f442430                     pop        qword ptr [rsp + 0x30]
016fa 48894424f8                     mov        qword ptr [rsp - 8], rax
016ff 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01703 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01707 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170c 48ff742448                     push       qword ptr [rsp + 0x48]
01711 488f442440                     pop        qword ptr [rsp + 0x40]
01716 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0171b 48894424f8                     mov        qword ptr [rsp - 8], rax
01720 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01724 89442448                       mov        dword ptr [rsp + 0x48], eax
01728 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0172d 48ff742458                     push       qword ptr [rsp + 0x58]
01732 488f442450                     pop        qword ptr [rsp + 0x50]
01737 48894424f8                     mov        qword ptr [rsp - 8], rax
0173c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01740 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01744 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01749 48ff742468                     push       qword ptr [rsp + 0x68]
0174e 488f442458                     pop        qword ptr [rsp + 0x58]
01753 48ff742470                     push       qword ptr [rsp + 0x70]
01758 488f442460                     pop        qword ptr [rsp + 0x60]
0175d 48894424f8                     mov        qword ptr [rsp - 8], rax
01762 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01769 89442468                       mov        dword ptr [rsp + 0x68], eax
0176d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01772 48894424f8                     mov        qword ptr [rsp - 8], rax
01777 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0177e 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01782 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01787 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0178f 90                             nop        
01790 c5f877                         vzeroupper 
01793 e8c816b0ff                     call       0x7f0ccb6cda60
01798 0f1f840090180018               nop        dword ptr [rax + rax + 0x18001890]
017a0 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
017aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ae e82d081e17                     call       0x7f0ce2dacbe0
017b3 f4                             hlt        
017b4 bef6ffffff                     mov        esi, 0xfffffff6
017b9 90                             nop        
017ba 90                             nop        
017bb 90                             nop        
017bc c5f877                         vzeroupper 
017bf e89c16b0ff                     call       0x7f0ccb6cda60
017c4 0f1f8400bc180019               nop        dword ptr [rax + rax + 0x190018bc]
017cc 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
017d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017da e801081e17                     call       0x7f0ce2dacbe0
017df f4                             hlt        
017e0 bee4ffffff                     mov        esi, 0xffffffe4
017e5 48ff742428                     push       qword ptr [rsp + 0x28]
017ea 488f442410                     pop        qword ptr [rsp + 0x10]
017ef 48ff742430                     push       qword ptr [rsp + 0x30]
017f4 488f442418                     pop        qword ptr [rsp + 0x18]
017f9 48894424f8                     mov        qword ptr [rsp - 8], rax
017fe 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01802 89442420                       mov        dword ptr [rsp + 0x20], eax
01806 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0180b 48ff742440                     push       qword ptr [rsp + 0x40]
01810 488f442428                     pop        qword ptr [rsp + 0x28]
01815 48ff742478                     push       qword ptr [rsp + 0x78]
0181a 488f442430                     pop        qword ptr [rsp + 0x30]
0181f 48894424f8                     mov        qword ptr [rsp - 8], rax
01824 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01828 89442438                       mov        dword ptr [rsp + 0x38], eax
0182c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01831 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01836 48894424f8                     mov        qword ptr [rsp - 8], rax
0183b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0183f 89442454                       mov        dword ptr [rsp + 0x54], eax
01843 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01848 48ff742468                     push       qword ptr [rsp + 0x68]
0184d 488f442460                     pop        qword ptr [rsp + 0x60]
01852 48ff742470                     push       qword ptr [rsp + 0x70]
01857 488f442468                     pop        qword ptr [rsp + 0x68]
0185c 48894424f8                     mov        qword ptr [rsp - 8], rax
01861 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01868 89442470                       mov        dword ptr [rsp + 0x70], eax
0186c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01871 48894424f8                     mov        qword ptr [rsp - 8], rax
01876 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0187d 89442474                       mov        dword ptr [rsp + 0x74], eax
01881 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01886 48ffb42488000000               push       qword ptr [rsp + 0x88]
0188e 488f842480000000               pop        qword ptr [rsp + 0x80]
01896 90                             nop        
01897 90                             nop        
01898 c5f877                         vzeroupper 
0189b e8c015b0ff                     call       0x7f0ccb6cda60
018a0 0f1f84009819001a               nop        dword ptr [rax + rax + 0x1a001998]
018a8 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
018b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018b6 e825071e17                     call       0x7f0ce2dacbe0
018bb f4                             hlt        
018bc 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
018c0 beccffffff                     mov        esi, 0xffffffcc
018c5 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
018ca 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
018cf 895c2428                       mov        dword ptr [rsp + 0x28], ebx
018d3 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
018d8 c5f877                         vzeroupper 
018db e88015b0ff                     call       0x7f0ccb6cda60
018e0 0f1f8400d819001b               nop        dword ptr [rax + rax + 0x1b0019d8]
018e8 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
018f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018f6 e8e5061e17                     call       0x7f0ce2dacbe0
018fb f4                             hlt        
018fc be6effffff                     mov        esi, 0xffffff6e
01901 48ff742428                     push       qword ptr [rsp + 0x28]
01906 488f442410                     pop        qword ptr [rsp + 0x10]
0190b 48ff742430                     push       qword ptr [rsp + 0x30]
01910 488f442418                     pop        qword ptr [rsp + 0x18]
01915 48894424f8                     mov        qword ptr [rsp - 8], rax
0191a 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0191e 89442420                       mov        dword ptr [rsp + 0x20], eax
01922 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01927 48ff742440                     push       qword ptr [rsp + 0x40]
0192c 488f442428                     pop        qword ptr [rsp + 0x28]
01931 48ff742478                     push       qword ptr [rsp + 0x78]
01936 488f442430                     pop        qword ptr [rsp + 0x30]
0193b 48894424f8                     mov        qword ptr [rsp - 8], rax
01940 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01944 89442438                       mov        dword ptr [rsp + 0x38], eax
01948 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194d 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01952 48894424f8                     mov        qword ptr [rsp - 8], rax
01957 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0195b 89442454                       mov        dword ptr [rsp + 0x54], eax
0195f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01964 48ff742468                     push       qword ptr [rsp + 0x68]
01969 488f442460                     pop        qword ptr [rsp + 0x60]
0196e 48ff742470                     push       qword ptr [rsp + 0x70]
01973 488f442468                     pop        qword ptr [rsp + 0x68]
01978 48894424f8                     mov        qword ptr [rsp - 8], rax
0197d 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01984 89442470                       mov        dword ptr [rsp + 0x70], eax
01988 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198d 48894424f8                     mov        qword ptr [rsp - 8], rax
01992 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01999 89442474                       mov        dword ptr [rsp + 0x74], eax
0199d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a2 48ffb42488000000               push       qword ptr [rsp + 0x88]
019aa 488f842480000000               pop        qword ptr [rsp + 0x80]
019b2 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
019ba 90                             nop        
019bb 90                             nop        
019bc c5f877                         vzeroupper 
019bf e89c14b0ff                     call       0x7f0ccb6cda60
019c4 0f1f8400bc1a001c               nop        dword ptr [rax + rax + 0x1c001abc]
019cc 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
019d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019da e801061e17                     call       0x7f0ce2dacbe0
019df f4                             hlt        
019e0 8bcf                           mov        ecx, edi
019e2 e903f2ffff                     jmp        0x7f0ccbbcb7ea
019e7 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
019f1 4883e4f0                       and        rsp, 0xfffffffffffffff0
019f5 e8e6051e17                     call       0x7f0ce2dacbe0
019fa f4                             hlt        
019fb 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
01a05 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a09 e8d2051e17                     call       0x7f0ce2dacbe0
01a0e f4                             hlt        
01a0f 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
01a19 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a1d e8be051e17                     call       0x7f0ce2dacbe0
01a22 f4                             hlt        
01a23 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
01a2d 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a31 e8aa051e17                     call       0x7f0ce2dacbe0
01a36 f4                             hlt        
01a37 bee4ffffff                     mov        esi, 0xffffffe4
01a3c 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01a41 48894424f8                     mov        qword ptr [rsp - 8], rax
01a46 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01a4a 89442418                       mov        dword ptr [rsp + 0x18], eax
01a4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a53 48ff742440                     push       qword ptr [rsp + 0x40]
01a58 488f442428                     pop        qword ptr [rsp + 0x28]
01a5d 48ff742478                     push       qword ptr [rsp + 0x78]
01a62 488f442440                     pop        qword ptr [rsp + 0x40]
01a67 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01a70 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a79 48ff742468                     push       qword ptr [rsp + 0x68]
01a7e 488f442460                     pop        qword ptr [rsp + 0x60]
01a83 48ff742470                     push       qword ptr [rsp + 0x70]
01a88 488f442468                     pop        qword ptr [rsp + 0x68]
01a8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a92 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01a99 89442470                       mov        dword ptr [rsp + 0x70], eax
01a9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa2 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa7 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01aae 89442474                       mov        dword ptr [rsp + 0x74], eax
01ab2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab7 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
01abf 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
01ac7 90                             nop        
01ac8 c5f877                         vzeroupper 
01acb e89013b0ff                     call       0x7f0ccb6cda60
01ad0 0f1f8400c81b001d               nop        dword ptr [rax + rax + 0x1d001bc8]
01ad8 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01ae2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ae6 e8f5041e17                     call       0x7f0ce2dacbe0
01aeb f4                             hlt        
01aec c5fa7f8424b0000000             vmovdqu    xmmword ptr [rsp + 0xb0], xmm0
01af5 bee4ffffff                     mov        esi, 0xffffffe4
01afa 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01aff 48ff742430                     push       qword ptr [rsp + 0x30]
01b04 488f442410                     pop        qword ptr [rsp + 0x10]
01b09 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0e 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01b12 89442418                       mov        dword ptr [rsp + 0x18], eax
01b16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1b 48ff742440                     push       qword ptr [rsp + 0x40]
01b20 488f442428                     pop        qword ptr [rsp + 0x28]
01b25 48ff742478                     push       qword ptr [rsp + 0x78]
01b2a 488f442430                     pop        qword ptr [rsp + 0x30]
01b2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b34 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b38 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01b3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b41 48894424f8                     mov        qword ptr [rsp - 8], rax
01b46 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01b4a 89442420                       mov        dword ptr [rsp + 0x20], eax
01b4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b53 48ff742458                     push       qword ptr [rsp + 0x58]
01b58 488f442450                     pop        qword ptr [rsp + 0x50]
01b5d 48ff742468                     push       qword ptr [rsp + 0x68]
01b62 488f442460                     pop        qword ptr [rsp + 0x60]
01b67 48ff742470                     push       qword ptr [rsp + 0x70]
01b6c 488f442468                     pop        qword ptr [rsp + 0x68]
01b71 48894424f8                     mov        qword ptr [rsp - 8], rax
01b76 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01b7d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b86 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8b 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01b92 89442470                       mov        dword ptr [rsp + 0x70], eax
01b96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9b 448974247c                     mov        dword ptr [rsp + 0x7c], r14d
01ba0 c5f877                         vzeroupper 
01ba3 e8b812b0ff                     call       0x7f0ccb6cda60
01ba8 0f1f8400a01c001e               nop        dword ptr [rax + rax + 0x1e001ca0]
01bb0 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bbe e81d041e17                     call       0x7f0ce2dacbe0
01bc3 f4                             hlt        
01bc4 beccffffff                     mov        esi, 0xffffffcc
01bc9 48ff742428                     push       qword ptr [rsp + 0x28]
01bce 488f442410                     pop        qword ptr [rsp + 0x10]
01bd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd8 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01bdc 89442420                       mov        dword ptr [rsp + 0x20], eax
01be0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be5 48ff742440                     push       qword ptr [rsp + 0x40]
01bea 488f442428                     pop        qword ptr [rsp + 0x28]
01bef 48ff742478                     push       qword ptr [rsp + 0x78]
01bf4 488f442440                     pop        qword ptr [rsp + 0x40]
01bf9 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfe 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c02 89442438                       mov        dword ptr [rsp + 0x38], eax
01c06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0b 48ffb42488000000               push       qword ptr [rsp + 0x88]
01c13 488f442460                     pop        qword ptr [rsp + 0x60]
01c18 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1d 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01c24 89442478                       mov        dword ptr [rsp + 0x78], eax
01c28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c32 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01c39 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01c3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c42 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
01c4a 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01c52 90                             nop        
01c53 90                             nop        
01c54 c5f877                         vzeroupper 
01c57 e80412b0ff                     call       0x7f0ccb6cda60
01c5c 0f1f8400541d001f               nop        dword ptr [rax + rax + 0x1f001d54]
01c64 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01c6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c72 e869031e17                     call       0x7f0ce2dacbe0
01c77 f4                             hlt        
01c78 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
01c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c86 e855031e17                     call       0x7f0ce2dacbe0
01c8b f4                             hlt        
01c8c 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
01c96 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c9a e841031e17                     call       0x7f0ce2dacbe0
01c9f f4                             hlt        
01ca0 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
01caa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cae e82d031e17                     call       0x7f0ce2dacbe0
01cb3 f4                             hlt        
01cb4 48bfe0472fa40c7f0000           movabs     rdi, 0x7f0ca42f47e0
01cbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cc2 e819031e17                     call       0x7f0ce2dacbe0
01cc7 f4                             hlt        
01cc8 bee4ffffff                     mov        esi, 0xffffffe4
01ccd 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01cd2 48ff742430                     push       qword ptr [rsp + 0x30]
01cd7 488f442410                     pop        qword ptr [rsp + 0x10]
01cdc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01ce5 89442418                       mov        dword ptr [rsp + 0x18], eax
01ce9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cee 48ff742440                     push       qword ptr [rsp + 0x40]
01cf3 488f442428                     pop        qword ptr [rsp + 0x28]
01cf8 48ff742478                     push       qword ptr [rsp + 0x78]
01cfd 488f442430                     pop        qword ptr [rsp + 0x30]
01d02 48894424f8                     mov        qword ptr [rsp - 8], rax
01d07 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01d0b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d14 48ff742448                     push       qword ptr [rsp + 0x48]
01d19 488f442440                     pop        qword ptr [rsp + 0x40]
01d1e 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01d23 48894424f8                     mov        qword ptr [rsp - 8], rax
01d28 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01d2c 89442448                       mov        dword ptr [rsp + 0x48], eax
01d30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d35 48ff742458                     push       qword ptr [rsp + 0x58]
01d3a 488f442450                     pop        qword ptr [rsp + 0x50]
01d3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d44 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d48 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d51 48ff742468                     push       qword ptr [rsp + 0x68]
01d56 488f442458                     pop        qword ptr [rsp + 0x58]
01d5b 48ff742470                     push       qword ptr [rsp + 0x70]
01d60 488f442460                     pop        qword ptr [rsp + 0x60]
01d65 90                             nop        
01d66 90                             nop        
01d67 90                             nop        
01d68 c5f877                         vzeroupper 
01d6b e8f010b0ff                     call       0x7f0ccb6cda60
01d70 0f1f8400681e0020               nop        dword ptr [rax + rax + 0x20001e68]
01d78 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01d82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d86 e855021e17                     call       0x7f0ce2dacbe0
01d8b f4                             hlt        
01d8c bee4ffffff                     mov        esi, 0xffffffe4
01d91 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01d96 48ff742430                     push       qword ptr [rsp + 0x30]
01d9b 488f442410                     pop        qword ptr [rsp + 0x10]
01da0 48894424f8                     mov        qword ptr [rsp - 8], rax
01da5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01da9 89442418                       mov        dword ptr [rsp + 0x18], eax
01dad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db2 48ff742440                     push       qword ptr [rsp + 0x40]
01db7 488f442428                     pop        qword ptr [rsp + 0x28]
01dbc 48ff742478                     push       qword ptr [rsp + 0x78]
01dc1 488f442430                     pop        qword ptr [rsp + 0x30]
01dc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dcb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01dcf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01dd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd8 48ff742448                     push       qword ptr [rsp + 0x48]
01ddd 488f442440                     pop        qword ptr [rsp + 0x40]
01de2 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01de7 48894424f8                     mov        qword ptr [rsp - 8], rax
01dec 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01df0 89442448                       mov        dword ptr [rsp + 0x48], eax
01df4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df9 48ff742458                     push       qword ptr [rsp + 0x58]
01dfe 488f442450                     pop        qword ptr [rsp + 0x50]
01e03 48894424f8                     mov        qword ptr [rsp - 8], rax
01e08 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e0c 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e15 48ff742468                     push       qword ptr [rsp + 0x68]
01e1a 488f442458                     pop        qword ptr [rsp + 0x58]
01e1f 48ff742470                     push       qword ptr [rsp + 0x70]
01e24 488f442460                     pop        qword ptr [rsp + 0x60]
01e29 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01e35 89442468                       mov        dword ptr [rsp + 0x68], eax
01e39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e43 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01e4a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01e4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e53 90                             nop        
01e54 c5f877                         vzeroupper 
01e57 e80410b0ff                     call       0x7f0ccb6cda60
01e5c 0f1f8400541f0021               nop        dword ptr [rax + rax + 0x21001f54]
01e64 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01e6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e72 e869011e17                     call       0x7f0ce2dacbe0
01e77 f4                             hlt        
01e78 bee4ffffff                     mov        esi, 0xffffffe4
01e7d 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01e82 48894424f8                     mov        qword ptr [rsp - 8], rax
01e87 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01e8b 89442418                       mov        dword ptr [rsp + 0x18], eax
01e8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e94 48ff742440                     push       qword ptr [rsp + 0x40]
01e99 488f442428                     pop        qword ptr [rsp + 0x28]
01e9e 48ff742478                     push       qword ptr [rsp + 0x78]
01ea3 488f442440                     pop        qword ptr [rsp + 0x40]
01ea8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ead 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01eb1 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01eb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eba 48ffb42488000000               push       qword ptr [rsp + 0x88]
01ec2 488f442438                     pop        qword ptr [rsp + 0x38]
01ec7 48ff742468                     push       qword ptr [rsp + 0x68]
01ecc 488f442460                     pop        qword ptr [rsp + 0x60]
01ed1 48ff742470                     push       qword ptr [rsp + 0x70]
01ed6 488f442468                     pop        qword ptr [rsp + 0x68]
01edb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee0 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01ee7 89442470                       mov        dword ptr [rsp + 0x70], eax
01eeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef5 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01efc 89442474                       mov        dword ptr [rsp + 0x74], eax
01f00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f05 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
01f0d 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
01f14 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01f1c 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01f24 c5f877                         vzeroupper 
01f27 e8340fb0ff                     call       0x7f0ccb6cda60
01f2c 0f1f840024200022               nop        dword ptr [rax + rax + 0x22002024]
01f34 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
01f3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f42 e899001e17                     call       0x7f0ce2dacbe0
01f47 f4                             hlt        
01f48 c5fa7f8424b0000000             vmovdqu    xmmword ptr [rsp + 0xb0], xmm0
01f51 bee4ffffff                     mov        esi, 0xffffffe4
01f56 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01f5b 48ff742430                     push       qword ptr [rsp + 0x30]
01f60 488f442410                     pop        qword ptr [rsp + 0x10]
01f65 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6a 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01f6e 89442418                       mov        dword ptr [rsp + 0x18], eax
01f72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f77 48ff742440                     push       qword ptr [rsp + 0x40]
01f7c 488f442428                     pop        qword ptr [rsp + 0x28]
01f81 48ff742478                     push       qword ptr [rsp + 0x78]
01f86 488f442430                     pop        qword ptr [rsp + 0x30]
01f8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f90 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f94 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9d 48ffb42488000000               push       qword ptr [rsp + 0x88]
01fa5 488f442438                     pop        qword ptr [rsp + 0x38]
01faa 48894424f8                     mov        qword ptr [rsp - 8], rax
01faf 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01fb3 89442420                       mov        dword ptr [rsp + 0x20], eax
01fb7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbc 48ff742458                     push       qword ptr [rsp + 0x58]
01fc1 488f442450                     pop        qword ptr [rsp + 0x50]
01fc6 48ff742468                     push       qword ptr [rsp + 0x68]
01fcb 488f442460                     pop        qword ptr [rsp + 0x60]
01fd0 48ff742470                     push       qword ptr [rsp + 0x70]
01fd5 488f442468                     pop        qword ptr [rsp + 0x68]
01fda 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdf 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01fe6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fef 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff4 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01ffb 89442470                       mov        dword ptr [rsp + 0x70], eax
01fff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02004 448974247c                     mov        dword ptr [rsp + 0x7c], r14d
02009 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02010 c5f877                         vzeroupper 
02013 e8480eb0ff                     call       0x7f0ccb6cda60
02018 0f1f840010210023               nop        dword ptr [rax + rax + 0x23002110]
02020 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0202a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0202e e8adff1d17                     call       0x7f0ce2dacbe0
02033 f4                             hlt        
02034 beccffffff                     mov        esi, 0xffffffcc
02039 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0203e 48894424f8                     mov        qword ptr [rsp - 8], rax
02043 8b442438                       mov        eax, dword ptr [rsp + 0x38]
02047 89442418                       mov        dword ptr [rsp + 0x18], eax
0204b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02050 48ff742440                     push       qword ptr [rsp + 0x40]
02055 488f442428                     pop        qword ptr [rsp + 0x28]
0205a 48ff742478                     push       qword ptr [rsp + 0x78]
0205f 488f442440                     pop        qword ptr [rsp + 0x40]
02064 48894424f8                     mov        qword ptr [rsp - 8], rax
02069 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0206d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02071 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02076 48ffb42488000000               push       qword ptr [rsp + 0x88]
0207e 488f442438                     pop        qword ptr [rsp + 0x38]
02083 48ff742468                     push       qword ptr [rsp + 0x68]
02088 488f442460                     pop        qword ptr [rsp + 0x60]
0208d 48ff742470                     push       qword ptr [rsp + 0x70]
02092 488f442468                     pop        qword ptr [rsp + 0x68]
02097 48894424f8                     mov        qword ptr [rsp - 8], rax
0209c 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
020a3 89442470                       mov        dword ptr [rsp + 0x70], eax
020a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ac 48894424f8                     mov        qword ptr [rsp - 8], rax
020b1 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
020b8 89442474                       mov        dword ptr [rsp + 0x74], eax
020bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c1 48894424f8                     mov        qword ptr [rsp - 8], rax
020c6 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
020cd 8944247c                       mov        dword ptr [rsp + 0x7c], eax
020d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d6 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
020de 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
020e6 90                             nop        
020e7 90                             nop        
020e8 c5f877                         vzeroupper 
020eb e8700db0ff                     call       0x7f0ccb6cda60
020f0 0f1f8400e8210024               nop        dword ptr [rax + rax + 0x240021e8]
020f8 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02102 4883e4f0                       and        rsp, 0xfffffffffffffff0
02106 e8d5fe1d17                     call       0x7f0ce2dacbe0
0210b f4                             hlt        
0210c beccffffff                     mov        esi, 0xffffffcc
02111 48ff742428                     push       qword ptr [rsp + 0x28]
02116 488f442410                     pop        qword ptr [rsp + 0x10]
0211b 48894424f8                     mov        qword ptr [rsp - 8], rax
02120 8b442438                       mov        eax, dword ptr [rsp + 0x38]
02124 89442420                       mov        dword ptr [rsp + 0x20], eax
02128 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212d 48ff742440                     push       qword ptr [rsp + 0x40]
02132 488f442428                     pop        qword ptr [rsp + 0x28]
02137 48ff742478                     push       qword ptr [rsp + 0x78]
0213c 488f442440                     pop        qword ptr [rsp + 0x40]
02141 48894424f8                     mov        qword ptr [rsp - 8], rax
02146 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0214a 89442438                       mov        dword ptr [rsp + 0x38], eax
0214e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02153 48ffb42488000000               push       qword ptr [rsp + 0x88]
0215b 488f442460                     pop        qword ptr [rsp + 0x60]
02160 48894424f8                     mov        qword ptr [rsp - 8], rax
02165 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0216c 89442478                       mov        dword ptr [rsp + 0x78], eax
02170 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02175 48894424f8                     mov        qword ptr [rsp - 8], rax
0217a 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
02181 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02185 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218a 48894424f8                     mov        qword ptr [rsp - 8], rax
0218f 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
02196 89842480000000                 mov        dword ptr [rsp + 0x80], eax
0219d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a2 48894424f8                     mov        qword ptr [rsp - 8], rax
021a7 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
021ae 89842484000000                 mov        dword ptr [rsp + 0x84], eax
021b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ba 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
021c2 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
021c9 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
021d1 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
021d9 90                             nop        
021da 90                             nop        
021db 90                             nop        
021dc c5f877                         vzeroupper 
021df e87c0cb0ff                     call       0x7f0ccb6cda60
021e4 0f1f8400dc220025               nop        dword ptr [rax + rax + 0x250022dc]
021ec 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
021f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
021fa e8e1fd1d17                     call       0x7f0ce2dacbe0
021ff f4                             hlt        
02200 bee4ffffff                     mov        esi, 0xffffffe4
02205 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0220a 48ff742430                     push       qword ptr [rsp + 0x30]
0220f 488f442410                     pop        qword ptr [rsp + 0x10]
02214 48894424f8                     mov        qword ptr [rsp - 8], rax
02219 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0221d 8944240c                       mov        dword ptr [rsp + 0xc], eax
02221 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02226 48ff742440                     push       qword ptr [rsp + 0x40]
0222b 488f442418                     pop        qword ptr [rsp + 0x18]
02230 48ff742478                     push       qword ptr [rsp + 0x78]
02235 488f442428                     pop        qword ptr [rsp + 0x28]
0223a 48894424f8                     mov        qword ptr [rsp - 8], rax
0223f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02243 89442430                       mov        dword ptr [rsp + 0x30], eax
02247 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0224c 48ff742468                     push       qword ptr [rsp + 0x68]
02251 488f442460                     pop        qword ptr [rsp + 0x60]
02256 48ff742470                     push       qword ptr [rsp + 0x70]
0225b 488f442468                     pop        qword ptr [rsp + 0x68]
02260 48894424f8                     mov        qword ptr [rsp - 8], rax
02265 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0226c 89442470                       mov        dword ptr [rsp + 0x70], eax
02270 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02275 90                             nop        
02276 90                             nop        
02277 90                             nop        
02278 c5f877                         vzeroupper 
0227b e8e00bb0ff                     call       0x7f0ccb6cda60
02280 0f1f840078230026               nop        dword ptr [rax + rax + 0x26002378]
02288 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02292 4883e4f0                       and        rsp, 0xfffffffffffffff0
02296 e845fd1d17                     call       0x7f0ce2dacbe0
0229b f4                             hlt        
0229c c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
022a5 bee4ffffff                     mov        esi, 0xffffffe4
022aa 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
022af 48ff742430                     push       qword ptr [rsp + 0x30]
022b4 488f442410                     pop        qword ptr [rsp + 0x10]
022b9 48894424f8                     mov        qword ptr [rsp - 8], rax
022be 8b442438                       mov        eax, dword ptr [rsp + 0x38]
022c2 8944240c                       mov        dword ptr [rsp + 0xc], eax
022c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022cb 48ff742440                     push       qword ptr [rsp + 0x40]
022d0 488f442418                     pop        qword ptr [rsp + 0x18]
022d5 48ff742478                     push       qword ptr [rsp + 0x78]
022da 488f442428                     pop        qword ptr [rsp + 0x28]
022df 48894424f8                     mov        qword ptr [rsp - 8], rax
022e4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
022e8 89442430                       mov        dword ptr [rsp + 0x30], eax
022ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f1 48ff742468                     push       qword ptr [rsp + 0x68]
022f6 488f442460                     pop        qword ptr [rsp + 0x60]
022fb 48ff742470                     push       qword ptr [rsp + 0x70]
02300 488f442468                     pop        qword ptr [rsp + 0x68]
02305 48894424f8                     mov        qword ptr [rsp - 8], rax
0230a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02311 89442470                       mov        dword ptr [rsp + 0x70], eax
02315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231a 90                             nop        
0231b 90                             nop        
0231c c5f877                         vzeroupper 
0231f e83c0bb0ff                     call       0x7f0ccb6cda60
02324 0f1f84001c240027               nop        dword ptr [rax + rax + 0x2700241c]
0232c 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02336 4883e4f0                       and        rsp, 0xfffffffffffffff0
0233a e8a1fc1d17                     call       0x7f0ce2dacbe0
0233f f4                             hlt        
02340 beccffffff                     mov        esi, 0xffffffcc
02345 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0234a 48ff742430                     push       qword ptr [rsp + 0x30]
0234f 488f442410                     pop        qword ptr [rsp + 0x10]
02354 48894424f8                     mov        qword ptr [rsp - 8], rax
02359 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0235d 8944240c                       mov        dword ptr [rsp + 0xc], eax
02361 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02366 48ff742440                     push       qword ptr [rsp + 0x40]
0236b 488f442418                     pop        qword ptr [rsp + 0x18]
02370 48ff742478                     push       qword ptr [rsp + 0x78]
02375 488f442428                     pop        qword ptr [rsp + 0x28]
0237a 48894424f8                     mov        qword ptr [rsp - 8], rax
0237f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02383 89442430                       mov        dword ptr [rsp + 0x30], eax
02387 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0238c 48ffb42488000000               push       qword ptr [rsp + 0x88]
02394 488f442438                     pop        qword ptr [rsp + 0x38]
02399 48ff742468                     push       qword ptr [rsp + 0x68]
0239e 488f442460                     pop        qword ptr [rsp + 0x60]
023a3 48ff742470                     push       qword ptr [rsp + 0x70]
023a8 488f442468                     pop        qword ptr [rsp + 0x68]
023ad 48894424f8                     mov        qword ptr [rsp - 8], rax
023b2 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
023b9 89442470                       mov        dword ptr [rsp + 0x70], eax
023bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c2 48894424f8                     mov        qword ptr [rsp - 8], rax
023c7 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
023ce 89442474                       mov        dword ptr [rsp + 0x74], eax
023d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d7 48894424f8                     mov        qword ptr [rsp - 8], rax
023dc 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
023e3 89442478                       mov        dword ptr [rsp + 0x78], eax
023e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ec c5f877                         vzeroupper 
023ef e86c0ab0ff                     call       0x7f0ccb6cda60
023f4 0f1f8400ec240028               nop        dword ptr [rax + rax + 0x280024ec]
023fc 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02406 4883e4f0                       and        rsp, 0xfffffffffffffff0
0240a e8d1fb1d17                     call       0x7f0ce2dacbe0
0240f f4                             hlt        
02410 bef6ffffff                     mov        esi, 0xfffffff6
02415 90                             nop        
02416 90                             nop        
02417 90                             nop        
02418 c5f877                         vzeroupper 
0241b e8400ab0ff                     call       0x7f0ccb6cda60
02420 0f1f840018250029               nop        dword ptr [rax + rax + 0x29002518]
02428 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02432 4883e4f0                       and        rsp, 0xfffffffffffffff0
02436 e8a5fb1d17                     call       0x7f0ce2dacbe0
0243b f4                             hlt        
0243c bef6ffffff                     mov        esi, 0xfffffff6
02441 90                             nop        
02442 90                             nop        
02443 90                             nop        
02444 c5f877                         vzeroupper 
02447 e8140ab0ff                     call       0x7f0ccb6cda60
0244c 0f1f84004425002a               nop        dword ptr [rax + rax + 0x2a002544]
02454 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0245e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02462 e879fb1d17                     call       0x7f0ce2dacbe0
02467 f4                             hlt        
02468 bef6ffffff                     mov        esi, 0xfffffff6
0246d 90                             nop        
0246e 90                             nop        
0246f 90                             nop        
02470 c5f877                         vzeroupper 
02473 e8e809b0ff                     call       0x7f0ccb6cda60
02478 0f1f84007025002b               nop        dword ptr [rax + rax + 0x2b002570]
02480 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0248a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0248e e84dfb1d17                     call       0x7f0ce2dacbe0
02493 f4                             hlt        
02494 bef6ffffff                     mov        esi, 0xfffffff6
02499 418bea                         mov        ebp, r10d
0249c c5f877                         vzeroupper 
0249f e8bc09b0ff                     call       0x7f0ccb6cda60
024a4 0f1f84009c25002c               nop        dword ptr [rax + rax + 0x2c00259c]
024ac 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
024b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
024ba e821fb1d17                     call       0x7f0ce2dacbe0
024bf f4                             hlt        
024c0 bef6ffffff                     mov        esi, 0xfffffff6
024c5 418be9                         mov        ebp, r9d
024c8 4489442418                     mov        dword ptr [rsp + 0x18], r8d
024cd 90                             nop        
024ce 90                             nop        
024cf 90                             nop        
024d0 c5f877                         vzeroupper 
024d3 e88809b0ff                     call       0x7f0ccb6cda60
024d8 0f1f8400d025002d               nop        dword ptr [rax + rax + 0x2d0025d0]
024e0 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
024ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
024ee e8edfa1d17                     call       0x7f0ce2dacbe0
024f3 f4                             hlt        
024f4 bef6ffffff                     mov        esi, 0xfffffff6
024f9 90                             nop        
024fa 90                             nop        
024fb 90                             nop        
024fc c5f877                         vzeroupper 
024ff e85c09b0ff                     call       0x7f0ccb6cda60
02504 0f1f8400fc25002e               nop        dword ptr [rax + rax + 0x2e0025fc]
0250c 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02516 4883e4f0                       and        rsp, 0xfffffffffffffff0
0251a e8c1fa1d17                     call       0x7f0ce2dacbe0
0251f f4                             hlt        
02520 bef6ffffff                     mov        esi, 0xfffffff6
02525 90                             nop        
02526 90                             nop        
02527 90                             nop        
02528 c5f877                         vzeroupper 
0252b e83009b0ff                     call       0x7f0ccb6cda60
02530 0f1f84002826002f               nop        dword ptr [rax + rax + 0x2f002628]
02538 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02542 4883e4f0                       and        rsp, 0xfffffffffffffff0
02546 e895fa1d17                     call       0x7f0ce2dacbe0
0254b f4                             hlt        
0254c bef6ffffff                     mov        esi, 0xfffffff6
02551 90                             nop        
02552 90                             nop        
02553 90                             nop        
02554 c5f877                         vzeroupper 
02557 e80409b0ff                     call       0x7f0ccb6cda60
0255c 0f1f840054260030               nop        dword ptr [rax + rax + 0x30002654]
02564 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0256e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02572 e869fa1d17                     call       0x7f0ce2dacbe0
02577 f4                             hlt        
02578 bef6ffffff                     mov        esi, 0xfffffff6
0257d 90                             nop        
0257e 90                             nop        
0257f 90                             nop        
02580 c5f877                         vzeroupper 
02583 e8d808b0ff                     call       0x7f0ccb6cda60
02588 0f1f840080260031               nop        dword ptr [rax + rax + 0x31002680]
02590 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
0259a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0259e e83dfa1d17                     call       0x7f0ce2dacbe0
025a3 f4                             hlt        
025a4 eb0c                           jmp        0x7f0ccbbcd1b2
025a6 eb0a                           jmp        0x7f0ccbbcd1b2
025a8 eb08                           jmp        0x7f0ccbbcd1b2
025aa eb06                           jmp        0x7f0ccbbcd1b2
025ac eb04                           jmp        0x7f0ccbbcd1b2
025ae eb02                           jmp        0x7f0ccbbcd1b2
025b0 eb00                           jmp        0x7f0ccbbcd1b2
025b2 488bf0                         mov        rsi, rax
025b5 e91ee4ffff                     jmp        0x7f0ccbbcb5d8
025ba bef6ffffff                     mov        esi, 0xfffffff6
025bf 90                             nop        
025c0 c5f877                         vzeroupper 
025c3 e89808b0ff                     call       0x7f0ccb6cda60
025c8 0f1f8400c0260032               nop        dword ptr [rax + rax + 0x320026c0]
025d0 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
025da 4883e4f0                       and        rsp, 0xfffffffffffffff0
025de e8fdf91d17                     call       0x7f0ce2dacbe0
025e3 f4                             hlt        
025e4 bef6ffffff                     mov        esi, 0xfffffff6
025e9 418be9                         mov        ebp, r9d
025ec c5f877                         vzeroupper 
025ef e86c08b0ff                     call       0x7f0ccb6cda60
025f4 0f1f8400ec260033               nop        dword ptr [rax + rax + 0x330026ec]
025fc 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02606 4883e4f0                       and        rsp, 0xfffffffffffffff0
0260a e8d1f91d17                     call       0x7f0ce2dacbe0
0260f f4                             hlt        
02610 bef6ffffff                     mov        esi, 0xfffffff6
02615 90                             nop        
02616 90                             nop        
02617 90                             nop        
02618 c5f877                         vzeroupper 
0261b e84008b0ff                     call       0x7f0ccb6cda60
02620 0f1f840018270034               nop        dword ptr [rax + rax + 0x34002718]
02628 48bf90bd27a40c7f0000           movabs     rdi, 0x7f0ca427bd90
02632 4883e4f0                       and        rsp, 0xfffffffffffffff0
02636 e8a5f91d17                     call       0x7f0ce2dacbe0
0263b f4                             hlt        
0263c 49ba98b6bccb0c7f0000           movabs     r10, 0x7f0ccbbcb698
02646 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0264d e90e51b6ff                     jmp        0x7f0ccb732360
02652 e8891fb5ff                     call       0x7f0ccb71f1e0
02657 e9d2d9ffff                     jmp        0x7f0ccbbcac2e
0265c f4                             hlt        
0265d f4                             hlt        
0265e f4                             hlt        
0265f f4                             hlt        
