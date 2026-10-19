00000 e87b83d217                     call       0x7fa893ba2880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85d8270000                   jne        0x7fa87be7cd06
0002e 4c8bae40010000                 mov        r13, qword ptr [rsi + 0x140]
00035 4c8bb638010000                 mov        r14, qword ptr [rsi + 0x138]
0003c 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
00040 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00045 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
0004c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00051 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00058 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0005d 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00064 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00069 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00070 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00075 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
0007c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00081 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
00088 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0008d 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00093 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
0009a 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
000a2 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a9 4489542458                     mov        dword ptr [rsp + 0x58], r10d
000ae 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
000ba 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000c1 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
000c6 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cd 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000d2 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d6 4489542474                     mov        dword ptr [rsp + 0x74], r10d
000db 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000df 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
000e4 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000eb 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
000f3 488bfe                         mov        rdi, rsi
000f6 c5f877                         vzeroupper 
000f9 49ba4018c893a87f0000           movabs     r10, 0x7fa893c81840
00103 41ffd2                         call       r10
00106 0f1f840000000000               nop        dword ptr [rax + rax]
0010e 4d85ed                         test       r13, r13
00111 0f84c1170000                   je         0x7fa87be7bdd8
00117 458b5504                       mov        r10d, dword ptr [r13 + 4]
0011b 41c1ea0a                       shr        r10d, 0xa
0011f 4181fa0c080000                 cmp        r10d, 0x80c
00126 0f850c1b0000                   jne        0x7fa87be7c138
0012c 4d8bd5                         mov        r10, r13
0012f 4c89542408                     mov        qword ptr [rsp + 8], r10
00134 4d85f6                         test       r14, r14
00137 0f84a8170000                   je         0x7fa87be7bde5
0013d 458b5e04                       mov        r11d, dword ptr [r14 + 4]
00141 41c1eb0a                       shr        r11d, 0xa
00145 4181fb05020000                 cmp        r11d, 0x205
0014c 0f85e61a0000                   jne        0x7fa87be7c138
00152 4d8bd6                         mov        r10, r14
00155 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0015d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00162 4d85d2                         test       r10, r10
00165 0f848a170000                   je         0x7fa87be7bdf5
0016b 458b5204                       mov        r10d, dword ptr [r10 + 4]
0016f 41c1ea0a                       shr        r10d, 0xa
00173 4181fa08020000                 cmp        r10d, 0x208
0017a 0f85b81a0000                   jne        0x7fa87be7c138
00180 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00185 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0018d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00192 4d85d2                         test       r10, r10
00195 0f846a170000                   je         0x7fa87be7be05
0019b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0019f 41c1eb0a                       shr        r11d, 0xa
001a3 4181fb07020000                 cmp        r11d, 0x207
001aa 0f85881a0000                   jne        0x7fa87be7c138
001b0 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001ba 4d85d2                         test       r10, r10
001bd 0f844f170000                   je         0x7fa87be7be12
001c3 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c7 41c1ea0a                       shr        r10d, 0xa
001cb 4181fa07020000                 cmp        r10d, 0x207
001d2 0f85601a0000                   jne        0x7fa87be7c138
001d8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001dd 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
001e5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001ea 4d85d2                         test       r10, r10
001ed 0f842f170000                   je         0x7fa87be7be22
001f3 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f7 41c1eb0a                       shr        r11d, 0xa
001fb 4181fb05020000                 cmp        r11d, 0x205
00202 0f85301a0000                   jne        0x7fa87be7c138
00208 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
00210 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00218 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021c 44895c2404                     mov        dword ptr [rsp + 4], r11d
00221 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00226 4585d2                         test       r10d, r10d
00229 0f84ad190000                   je         0x7fa87be7c0dc
0022f 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00237 458b5208                       mov        r10d, dword ptr [r10 + 8]
0023b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00240 4585d2                         test       r10d, r10d
00243 0f8693190000                   jbe        0x7fa87be7c0dc
00249 4183fa01                       cmp        r10d, 1
0024d 0f8689190000                   jbe        0x7fa87be7c0dc
00253 4183fa02                       cmp        r10d, 2
00257 0f867f190000                   jbe        0x7fa87be7c0dc
0025d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00265 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00269 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0026e 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00276 458b5208                       mov        r10d, dword ptr [r10 + 8]
0027a 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0027f 4183c3f1                       add        r11d, -0xf
00283 4585db                         test       r11d, r11d
00286 0f8c50190000                   jl         0x7fa87be7c0dc
0028c 4183c2f1                       add        r10d, -0xf
00290 4585d2                         test       r10d, r10d
00293 0f8c43190000                   jl         0x7fa87be7c0dc
00299 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0029e 4183c3f9                       add        r11d, -7
002a2 4585db                         test       r11d, r11d
002a5 0f8c31190000                   jl         0x7fa87be7c0dc
002ab 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
002b0 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
002b5 4d63d2                         movsxd     r10, r10d
002b8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002bd 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
002c2 4183c3f1                       add        r11d, -0xf
002c6 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
002ce 4983c2f1                       add        r10, -0xf
002d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002d7 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002dc 458d43f1                       lea        r8d, [r11 - 0xf]
002e0 44898424a4000000               mov        dword ptr [rsp + 0xa4], r8d
002e8 4d63d3                         movsxd     r10, r11d
002eb 4983c2f1                       add        r10, -0xf
002ef 4c89542440                     mov        qword ptr [rsp + 0x40], r10
002f4 e902020000                     jmp        0x7fa87be7a9fb
002f9 4533ed                         xor        r13d, r13d
002fc 4489ac24ac000000               mov        dword ptr [rsp + 0xac], r13d
00304 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0030c 458b4210                       mov        r8d, dword ptr [r10 + 0x10]
00310 448bd0                         mov        r10d, eax
00313 4183fa03                       cmp        r10d, 3
00317 0f8ed1030000                   jle        0x7fa87be7abee
0031d 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00325 45894214                       mov        dword ptr [r10 + 0x14], r8d
00329 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
0032d 45895a10                       mov        dword ptr [r10 + 0x10], r11d
00331 448d50fd                       lea        r10d, [rax - 3]
00335 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0033a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00342 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00347 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0034b 4c6354247c                     movsxd     r10, dword ptr [rsp + 0x7c]
00350 4c63c3                         movsxd     r8, ebx
00353 4c03442460                     add        r8, qword ptr [rsp + 0x60]
00358 4c639c24ac000000               movsxd     r11, dword ptr [rsp + 0xac]
00360 4d8bcb                         mov        r9, r11
00363 4d03c3                         add        r8, r11
00366 4d3bd0                         cmp        r10, r8
00369 0f8fd9130000                   jg         0x7fa87be7bc48
0036f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00374 4585db                         test       r11d, r11d
00377 0f8e43130000                   jle        0x7fa87be7bbc0
0037d 448beb                         mov        r13d, ebx
00380 4403ac24ac000000               add        r13d, dword ptr [rsp + 0xac]
00388 4863ac24a8000000               movsxd     rbp, dword ptr [rsp + 0xa8]
00390 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00398 4503dd                         add        r11d, r13d
0039b 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
003a3 44039424ac000000               add        r10d, dword ptr [rsp + 0xac]
003ab 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
003b3 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
003b8 0f8f580c0000                   jg         0x7fa87be7b516
003be 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
003c3 0f8f13140000                   jg         0x7fa87be7bcdc
003c9 448bb424ac000000               mov        r14d, dword ptr [rsp + 0xac]
003d1 4183fe10                       cmp        r14d, 0x10
003d5 0f8fe5010000                   jg         0x7fa87be7aac0
003db 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
003e3 443bac24a4000000               cmp        r13d, dword ptr [rsp + 0xa4]
003eb 0f8397110000                   jae        0x7fa87be7ba88
003f1 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
003f9 c4817a6f442b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r13 + 0xc]
00400 3b9c24a0000000                 cmp        ebx, dword ptr [rsp + 0xa0]
00407 0f8307120000                   jae        0x7fa87be7bb14
0040d 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00415 4503dd                         add        r11d, r13d
00418 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00420 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00428 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
0042f 448bac24ac000000               mov        r13d, dword ptr [rsp + 0xac]
00437 4403eb                         add        r13d, ebx
0043a 4489ac24ac000000               mov        dword ptr [rsp + 0xac], r13d
00442 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
0044a 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
0044f 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00457 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0045f 4183fb10                       cmp        r11d, 0x10
00463 0f8ff7130000                   jg         0x7fa87be7bd60
00469 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0046e 4183fa10                       cmp        r10d, 0x10
00472 0f8ca8030000                   jl         0x7fa87be7ad20
00478 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00480 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
00488 0f83ee0f0000                   jae        0x7fa87be7b97c
0048e 458bd3                         mov        r10d, r11d
00491 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00499 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
004a0 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
004a8 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
004b0 0f833a100000                   jae        0x7fa87be7b9f0
004b6 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
004be c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
004c5 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
004cc 4103db                         add        ebx, r11d
004cf 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004d3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
004d8 41ffc3                         inc        r11d
004db 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
004e0 418502                         test       dword ptr [r10], eax
004e3 48894424f8                     mov        qword ptr [rsp - 8], rax
004e8 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
004ef 898424b8000000                 mov        dword ptr [rsp + 0xb8], eax
004f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
004fb 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00503 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
00508 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0050d 442b9c24b8000000               sub        r11d, dword ptr [rsp + 0xb8]
00515 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0051d 448bac24b8000000               mov        r13d, dword ptr [rsp + 0xb8]
00525 4b8d7c2a0c                     lea        rdi, [r10 + r13 + 0xc]
0052a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0052f 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00534 0f8d2f0a0000                   jge        0x7fa87be7b469
0053a 443b542404                     cmp        r10d, dword ptr [rsp + 4]
0053f 0f83d30e0000                   jae        0x7fa87be7b918
00545 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
0054d 4f8b44d010                     mov        r8, qword ptr [r8 + r10*8 + 0x10]
00552 4d8bd0                         mov        r10, r8
00555 49c1ea12                       shr        r10, 0x12
00559 458bd2                         mov        r10d, r10d
0055c 4181e2ffff0300                 and        r10d, 0x3ffff
00563 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0056b 458be8                         mov        r13d, r8d
0056e 49c1f824                       sar        r8, 0x24
00572 4181e5ffff0100                 and        r13d, 0x1ffff
00579 4489ac24ac000000               mov        dword ptr [rsp + 0xac], r13d
00581 458bd0                         mov        r10d, r8d
00584 418bc2                         mov        eax, r10d
00587 4585d2                         test       r10d, r10d
0058a 0f8c50110000                   jl         0x7fa87be7bbe0
00590 4585ed                         test       r13d, r13d
00593 0f8460fdffff                   je         0x7fa87be7a7f9
00599 453beb                         cmp        r13d, r11d
0059c 0f8e62fdffff                   jle        0x7fa87be7a804
005a2 be45ffffff                     mov        esi, 0xffffff45
005a7 418bed                         mov        ebp, r13d
005aa 44891c24                       mov        dword ptr [rsp], r11d
005ae 6690                           nop        
005b0 c5f877                         vzeroupper 
005b3 e8a8d2b5ff                     call       0x7fa87b9d7d60
005b8 0f1f8400b0060001               nop        dword ptr [rax + rax + 0x10006b0]
005c0 4183fe30                       cmp        r14d, 0x30
005c4 0f8ff1070000                   jg         0x7fa87be7b2bb
005ca 448bb424b8000000               mov        r14d, dword ptr [rsp + 0xb8]
005d2 443bb424a4000000               cmp        r14d, dword ptr [rsp + 0xa4]
005da 0f8352130000                   jae        0x7fa87be7be32
005e0 418bfe                         mov        edi, r14d
005e3 4d63ce                         movsxd     r9, r14d
005e6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005ee c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
005f5 3b9c24a0000000                 cmp        ebx, dword ptr [rsp + 0xa0]
005fc 0f83ce130000                   jae        0x7fa87be7bed0
00602 448d5310                       lea        r10d, [rbx + 0x10]
00606 418bca                         mov        ecx, r10d
00609 4c63d3                         movsxd     r10, ebx
0060c 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
00614 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0061b 448bc1                         mov        r8d, ecx
0061e 453bc5                         cmp        r8d, r13d
00621 0f8daa000000                   jge        0x7fa87be7abd1
00627 4d2bca                         sub        r9, r10
0062a 4d63d8                         movsxd     r11, r8d
0062d 4f8d140b                       lea        r10, [r11 + r9]
00631 4c3b542440                     cmp        r10, qword ptr [rsp + 0x40]
00636 0f8360140000                   jae        0x7fa87be7bf9c
0063c 4d63d5                         movsxd     r10, r13d
0063f 4d2bd3                         sub        r10, r11
00642 4983c20f                       add        r10, 0xf
00646 4983e2f0                       and        r10, 0xfffffffffffffff0
0064a 458bda                         mov        r11d, r10d
0064d 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00652 4d63d2                         movsxd     r10, r10d
00655 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
0065a 4c3b5c2440                     cmp        r11, qword ptr [rsp + 0x40]
0065f 0f8337140000                   jae        0x7fa87be7bf9c
00665 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
0066d 0f8329140000                   jae        0x7fa87be7bf9c
00673 4983c2f0                       add        r10, -0x10
00677 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0067c 0f831a140000                   jae        0x7fa87be7bf9c
00682 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00689 0f8fad140000                   jg         0x7fa87be7c03c
0068f 458bd6                         mov        r10d, r14d
00692 442bd3                         sub        r10d, ebx
00695 6666660f1f840000000000         nop        word ptr [rax + rax]
006a0 458d040a                       lea        r8d, [r10 + rcx]
006a4 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
006ac c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
006b3 448bd9                         mov        r11d, ecx
006b6 4c8b8424d0000000               mov        r8, qword ptr [rsp + 0xd0]
006be c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
006c5 448d5910                       lea        r11d, [rcx + 0x10]
006c9 418bcb                         mov        ecx, r11d
006cc 453bdd                         cmp        r11d, r13d
006cf 7ccf                           jl         0x7fa87be7aba0
006d1 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
006d8 03df                           add        ebx, edi
006da 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
006e1 4489ac24ac000000               mov        dword ptr [rsp + 0xac], r13d
006e9 e954fdffff                     jmp        0x7fa87be7a942
006ee 448bac24ac000000               mov        r13d, dword ptr [rsp + 0xac]
006f6 4585ed                         test       r13d, r13d
006f9 7406                           je         0x7fa87be7ac01
006fb 41ffca                         dec        r10d
006fe 418bc2                         mov        eax, r10d
00701 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00709 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0070d 85c0                           test       eax, eax
0070f 0f8482000000                   je         0x7fa87be7ac97
00715 83f803                         cmp        eax, 3
00718 0f84370b0000                   je         0x7fa87be7b755
0071e 83f802                         cmp        eax, 2
00721 777e                           ja         0x7fa87be7aca1
00723 3b442414                       cmp        eax, dword ptr [rsp + 0x14]
00727 0f835b150000                   jae        0x7fa87be7c188
0072d 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00735 458b54830c                     mov        r10d, dword ptr [r11 + rax*4 + 0xc]
0073a 85c0                           test       eax, eax
0073c 7e4d                           jle        0x7fa87be7ac8b
0073e 448d58ff                       lea        r11d, [rax - 1]
00742 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
00747 0f837b180000                   jae        0x7fa87be7c4c8
0074d 4533c9                         xor        r9d, r9d
00750 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00758 458bdb                         mov        r11d, r11d
0075b 4183c3d0                       add        r11d, -0x30
0075f 41c1eb02                       shr        r11d, 2
00763 458d4403ff                     lea        r8d, [r11 + rax - 1]
00768 4863c8                         movsxd     rcx, eax
0076b 41bb04000000                   mov        r11d, 4
00771 c442a0f5d8                     bzhi       r11, r8, r11
00776 492bcb                         sub        rcx, r11
00779 48ffc9                         dec        rcx
0077c 4885c9                         test       rcx, rcx
0077f 490f4cc9                       cmovl      rcx, r9
00783 448bc1                         mov        r8d, ecx
00786 e9a8060000                     jmp        0x7fa87be7b333
0078b 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00793 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00797 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0079c e9aafbffff                     jmp        0x7fa87be7a84b
007a1 48be68387ce200000000           movabs     rsi, 0xe27c3868
007ab 4c8b542408                     mov        r10, qword ptr [rsp + 8]
007b0 4c891424                       mov        qword ptr [rsp], r10
007b4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
007b9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
007be 895c2438                       mov        dword ptr [rsp + 0x38], ebx
007c2 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
007c7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
007cc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
007d1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
007d6 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
007db 4489542444                     mov        dword ptr [rsp + 0x44], r10d
007e0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007e5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
007ea 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
007f1 666690                         nop        
007f4 c5f877                         vzeroupper 
007f7 e8645ba9ff                     call       0x7fa87b910860
007fc 0f1f8400f4080002               nop        dword ptr [rax + rax + 0x20008f4]
00804 4885c0                         test       rax, rax
00807 0f8413150000                   je         0x7fa87be7c220
0080d 488bf0                         mov        rsi, rax
00810 c5f877                         vzeroupper 
00813 4881c4f0000000                 add        rsp, 0xf0
0081a 5d                             pop        rbp
0081b e940f9b5ff                     jmp        0x7fa87b9da660
00820 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
00828 4503d3                         add        r10d, r11d
0082b 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
00833 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00838 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00840 0f8daa020000                   jge        0x7fa87be7aff0
00846 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
0084e 4183c208                       add        r10d, 8
00852 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
0085a 4183fb08                       cmp        r11d, 8
0085e 0f8db0010000                   jge        0x7fa87be7af14
00864 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0086c 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00871 0f83ed190000                   jae        0x7fa87be7c764
00877 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
0087f 430fbe6c130c                   movsx      ebp, byte ptr [r11 + r10 + 0xc]
00885 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
0088d 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00892 0f837c1a0000                   jae        0x7fa87be7c814
00898 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
008a0 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
008a5 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
008ad 4183c303                       add        r11d, 3
008b1 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
008b9 41ffc0                         inc        r8d
008bc 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008c1 0f83e11a0000                   jae        0x7fa87be7c8a8
008c7 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
008cf 4183c303                       add        r11d, 3
008d3 4c639424b4000000               movsxd     r10, dword ptr [rsp + 0xb4]
008db 4c8b8c24d0000000               mov        r9, qword ptr [rsp + 0xd0]
008e3 430fbe6c110d                   movsx      ebp, byte ptr [r9 + r10 + 0xd]
008e9 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008ee 0f83641b0000                   jae        0x7fa87be7c958
008f4 4c639c24ac000000               movsxd     r11, dword ptr [rsp + 0xac]
008fc 43886c190d                     mov        byte ptr [r9 + r11 + 0xd], bpl
00901 470fbe44110e                   movsx      r8d, byte ptr [r9 + r10 + 0xe]
00907 478844190e                     mov        byte ptr [r9 + r11 + 0xe], r8b
0090c 470fbe44110f                   movsx      r8d, byte ptr [r9 + r10 + 0xf]
00912 478844190f                     mov        byte ptr [r9 + r11 + 0xf], r8b
00917 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0091c 4183fb08                       cmp        r11d, 8
00920 0f83ce1b0000                   jae        0x7fa87be7c9f4
00926 49bad08c79e200000000           movabs     r10, 0xe2798cd0
00930 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
00938 47034c9a0c                     add        r9d, dword ptr [r10 + r11*4 + 0xc]
0093d 44890c24                       mov        dword ptr [rsp], r9d
00941 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00949 4183fa04                       cmp        r10d, 4
0094d 7e41                           jle        0x7fa87be7ae90
0094f 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
00956 83c504                         add        ebp, 4
00959 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00961 418bd1                         mov        edx, r9d
00964 c5f877                         vzeroupper 
00967 e8f459a9ff                     call       0x7fa87b910860
0096c 0f1f8400640a0003               nop        dword ptr [rax + rax + 0x3000a64]
00974 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
0097c 8bd5                           mov        edx, ebp
0097e 8bc8                           mov        ecx, eax
00980 c5f877                         vzeroupper 
00983 e8d859a9ff                     call       0x7fa87b910860
00988 0f1f8400800a0004               nop        dword ptr [rax + rax + 0x4000a80]
00990 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00998 4183fb08                       cmp        r11d, 8
0099c 7e6a                           jle        0x7fa87be7af08
0099e 49ba008d79e200000000           movabs     r10, 0xe2798d00
009a8 8b1424                         mov        edx, dword ptr [rsp]
009ab 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
009b0 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
009b5 83c208                         add        edx, 8
009b8 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
009c0 c5f877                         vzeroupper 
009c3 e89859a9ff                     call       0x7fa87b910860
009c8 0f1f8400c00a0005               nop        dword ptr [rax + rax + 0x5000ac0]
009d0 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
009d7 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
009df 44890424                       mov        dword ptr [rsp], r8d
009e3 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
009eb 8b9424bc000000                 mov        edx, dword ptr [rsp + 0xbc]
009f2 488bc8                         mov        rcx, rax
009f5 666690                         nop        
009f8 c5f877                         vzeroupper 
009fb e86059a9ff                     call       0x7fa87b910860
00a00 0f1f8400f80a0006               nop        dword ptr [rax + rax + 0x6000af8]
00a08 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00a0f e9bbfaffff                     jmp        0x7fa87be7a9cf
00a14 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00a1c 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
00a23 90                             nop        
00a24 c5f877                         vzeroupper 
00a27 e83459a9ff                     call       0x7fa87b910860
00a2c 0f1f8400240b0007               nop        dword ptr [rax + rax + 0x7000b24]
00a34 488bb424d0000000               mov        rsi, qword ptr [rsp + 0xd0]
00a3c 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
00a43 488bc8                         mov        rcx, rax
00a46 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
00a4d 666690                         nop        
00a50 c5f877                         vzeroupper 
00a53 e80859a9ff                     call       0x7fa87b910860
00a58 0f1f8400500b0008               nop        dword ptr [rax + rax + 0x8000b50]
00a60 448d5508                       lea        r10d, [rbp + 8]
00a64 458bc2                         mov        r8d, r10d
00a67 be95ffffff                     mov        esi, 0xffffff95
00a6c 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00a71 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a76 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a7b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00a80 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00a85 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a8a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00a8f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
00a94 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00a99 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00a9e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00aa3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00aa8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00aad 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00ab2 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00ab7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00abc 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00ac1 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00ac9 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00ace 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00ad3 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00adb 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00ae0 c5f877                         vzeroupper 
00ae3 e878cdb5ff                     call       0x7fa87b9d7d60
00ae8 0f1f8400e00b0009               nop        dword ptr [rax + rax + 0x9000be0]
00af0 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00af8 4183fa30                       cmp        r10d, 0x30
00afc 0f8f05020000                   jg         0x7fa87be7b207
00b02 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b07 4183c3f9                       add        r11d, -7
00b0b 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00b13 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00b1b 453bd3                         cmp        r10d, r11d
00b1e 0f83bc120000                   jae        0x7fa87be7c2e0
00b24 458bda                         mov        r11d, r10d
00b27 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00b2c 4d63d3                         movsxd     r10, r11d
00b2f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00b34 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00b3c 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00b41 4f8b441a0c                     mov        r8, qword ptr [r10 + r11 + 0xc]
00b46 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
00b4e 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
00b56 0f8328130000                   jae        0x7fa87be7c384
00b5c 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00b64 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00b6c 4d63d3                         movsxd     r10, r11d
00b6f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00b74 498d4a0c                       lea        rcx, [r10 + 0xc]
00b78 48be00b722e200000000           movabs     rsi, 0xe222b700
00b82 488b9424d0000000               mov        rdx, qword ptr [rsp + 0xd0]
00b8a 4533c9                         xor        r9d, r9d
00b8d 666690                         nop        
00b90 c5f877                         vzeroupper 
00b93 e8c84da9ff                     call       0x7fa87b90fe60
00b98 0f1f8400900c000a               nop        dword ptr [rax + rax + 0xa000c90]
00ba0 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00ba8 4183c208                       add        r10d, 8
00bac 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00bb4 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00bbc 0f8d32010000                   jge        0x7fa87be7b1f4
00bc2 488b4c2448                     mov        rcx, qword ptr [rsp + 0x48]
00bc7 482b4c2450                     sub        rcx, qword ptr [rsp + 0x50]
00bcc 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00bd1 4983c3f9                       add        r11, -7
00bd5 4d63c2                         movsxd     r8, r10d
00bd8 4d8d0c08                       lea        r9, [r8 + rcx]
00bdc 4d3bcb                         cmp        r9, r11
00bdf 0f8377140000                   jae        0x7fa87be7c55c
00be5 4c638c24b8000000               movsxd     r9, dword ptr [rsp + 0xb8]
00bed 4d2bc8                         sub        r9, r8
00bf0 4983c107                       add        r9, 7
00bf4 4983e1f8                       and        r9, 0xfffffffffffffff8
00bf8 458bc9                         mov        r9d, r9d
00bfb 8b9c24b4000000                 mov        ebx, dword ptr [rsp + 0xb4]
00c02 458d441908                     lea        r8d, [r9 + rbx + 8]
00c07 4d63c0                         movsxd     r8, r8d
00c0a 4d8d4c08f8                     lea        r9, [r8 + rcx - 8]
00c0f 4d3bcb                         cmp        r9, r11
00c12 0f8344140000                   jae        0x7fa87be7c55c
00c18 443b9424bc000000               cmp        r10d, dword ptr [rsp + 0xbc]
00c20 0f8336140000                   jae        0x7fa87be7c55c
00c26 4983c0f8                       add        r8, -8
00c2a 4d3bc3                         cmp        r8, r11
00c2d 0f8329140000                   jae        0x7fa87be7c55c
00c33 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c3b 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c42 0f8fc0140000                   jg         0x7fa87be7c608
00c48 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c4d 442bdb                         sub        r11d, ebx
00c50 44891c24                       mov        dword ptr [rsp], r11d
00c54 660f1f440000                   nop        word ptr [rax + rax]
00c5a 660f1f440000                   nop        word ptr [rax + rax]
00c60 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00c68 4963cb                         movsxd     rcx, r11d
00c6b 4883c10c                       add        rcx, 0xc
00c6f 8b2c24                         mov        ebp, dword ptr [rsp]
00c72 03ac24c0000000                 add        ebp, dword ptr [rsp + 0xc0]
00c79 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00c81 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
00c86 48be00b722e200000000           movabs     rsi, 0xe222b700
00c90 488b9424d0000000               mov        rdx, qword ptr [rsp + 0xd0]
00c98 4533c9                         xor        r9d, r9d
00c9b 90                             nop        
00c9c c5f877                         vzeroupper 
00c9f e8bc4ca9ff                     call       0x7fa87b90fe60
00ca4 0f1f84009c0d000b               nop        dword ptr [rax + rax + 0xb000d9c]
00cac 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00cb4 4183c308                       add        r11d, 8
00cb8 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00cc0 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00cc8 7c96                           jl         0x7fa87be7b160
00cca eb28                           jmp        0x7fa87be7b1f4
00ccc 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00cd4 4d63d2                         movsxd     r10, r10d
00cd7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cde c442a8f5db                     bzhi       r11, r11, r10
00ce3 c4c1fb92fb                     kmovq      k7, r11
00ce8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cee 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cf4 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
00cfb 039c24a8000000                 add        ebx, dword ptr [rsp + 0xa8]
00d02 e9c8f7ffff                     jmp        0x7fa87be7a9cf
00d07 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00d0f 4585db                         test       r11d, r11d
00d12 0f8c18120000                   jl         0x7fa87be7c430
00d18 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
00d20 4585c0                         test       r8d, r8d
00d23 0f8c07120000                   jl         0x7fa87be7c430
00d29 4503d3                         add        r10d, r11d
00d2c 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
00d31 453bc2                         cmp        r8d, r10d
00d34 0f82f6110000                   jb         0x7fa87be7c430
00d3a 443b8424b8000000               cmp        r8d, dword ptr [rsp + 0xb8]
00d42 0f82e8110000                   jb         0x7fa87be7c430
00d48 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00d50 4585d2                         test       r10d, r10d
00d53 749f                           je         0x7fa87be7b1f4
00d55 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
00d5d 448b8c24ac000000               mov        r9d, dword ptr [rsp + 0xac]
00d65 4b8d740a0c                     lea        rsi, [r10 + r9 + 0xc]
00d6a 4b8d7c1a0c                     lea        rdi, [r10 + r11 + 0xc]
00d6f 4883fd20                       cmp        rbp, 0x20
00d73 0f8653ffffff                   jbe        0x7fa87be7b1cc
00d79 488bd5                         mov        rdx, rbp
00d7c c5f877                         vzeroupper 
00d7f 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00d89 41ffd2                         call       r10
00d8c 0f1f840000000000               nop        dword ptr [rax + rax]
00d94 e95bffffff                     jmp        0x7fa87be7b1f4
00d99 4c63d3                         movsxd     r10, ebx
00d9c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00da3 c442a8f5db                     bzhi       r11, r11, r10
00da8 c4c1fb92fb                     kmovq      k7, r11
00dad 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00db3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00db9 eb66                           jmp        0x7fa87be7b321
00dbb 448bb424b8000000               mov        r14d, dword ptr [rsp + 0xb8]
00dc3 4585f6                         test       r14d, r14d
00dc6 0f8c6c0f0000                   jl         0x7fa87be7c238
00dcc 85db                           test       ebx, ebx
00dce 0f8c640f0000                   jl         0x7fa87be7c238
00dd4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00dd9 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00de1 0f82510f0000                   jb         0x7fa87be7c238
00de7 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00dec 453bdd                         cmp        r11d, r13d
00def 0f82430f0000                   jb         0x7fa87be7c238
00df5 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
00dfc 85db                           test       ebx, ebx
00dfe 7421                           je         0x7fa87be7b321
00e00 4983f920                       cmp        r9, 0x20
00e04 7693                           jbe        0x7fa87be7b299
00e06 498bd1                         mov        rdx, r9
00e09 c5f877                         vzeroupper 
00e0c 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00e16 41ffd2                         call       r10
00e19 0f1f840000000000               nop        dword ptr [rax + rax]
00e21 4489ac24ac000000               mov        dword ptr [rsp + 0xac], r13d
00e29 e914f6ffff                     jmp        0x7fa87be7a942
00e2e 6690                           nop        
00e30 418bc1                         mov        eax, r9d
00e33 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00e3b 458b5c8108                     mov        r11d, dword ptr [r9 + rax*4 + 8]
00e40 488b8c2498000000               mov        rcx, qword ptr [rsp + 0x98]
00e48 44895c810c                     mov        dword ptr [rcx + rax*4 + 0xc], r11d
00e4d 448d48ff                       lea        r9d, [rax - 1]
00e51 453bc8                         cmp        r9d, r8d
00e54 7fda                           jg         0x7fa87be7b330
00e56 4183f93f                       cmp        r9d, 0x3f
00e5a 0f8ef4110000                   jle        0x7fa87be7c554
00e60 448bd8                         mov        r11d, eax
00e63 41ffcb                         dec        r11d
00e66 eb0b                           jmp        0x7fa87be7b373
00e68 0f1f840000000000               nop        dword ptr [rax + rax]
00e70 458bd8                         mov        r11d, r8d
00e73 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
00e7b 62917e486f8498ccffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0x34]
00e86 62917e487f8498d0ffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0x30], zmm0
00e91 62917e486f84988cffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0x74]
00e9c 62917e487f849890ffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0x70], zmm0
00ea7 62917e486f84984cffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0xb4]
00eb2 62917e487f849850ffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0xb0], zmm0
00ebd 62917e486f84980cffffff         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 - 0xf4]
00ec8 62917e487f849810ffffff         vmovdqu32  zmmword ptr [r8 + r11*4 - 0xf0], zmm0
00ed3 458d43c0                       lea        r8d, [r11 - 0x40]
00ed7 4183f83f                       cmp        r8d, 0x3f
00edb 7f93                           jg         0x7fa87be7b370
00edd 4183f80f                       cmp        r8d, 0xf
00ee1 7e31                           jle        0x7fa87be7b414
00ee3 458bc3                         mov        r8d, r11d
00ee6 4183c0c0                       add        r8d, -0x40
00eea 6690                           nop        
00eec 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00ef4 62917e486f8483ccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0x34]
00eff 62917e487f8483d0ffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0x30], zmm0
00f0a 4183c0f0                       add        r8d, -0x10
00f0e 4183f80f                       cmp        r8d, 0xf
00f12 7fd8                           jg         0x7fa87be7b3ec
00f14 4585c0                         test       r8d, r8d
00f17 0f8e6ef8ffff                   jle        0x7fa87be7ac8b
00f1d 666690                         nop        
00f20 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00f28 478b5c8308                     mov        r11d, dword ptr [r11 + r8*4 + 8]
00f2d 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00f35 47895c810c                     mov        dword ptr [r9 + r8*4 + 0xc], r11d
00f3a 41ffc8                         dec        r8d
00f3d 4585c0                         test       r8d, r8d
00f40 7fde                           jg         0x7fa87be7b420
00f42 e944f8ffff                     jmp        0x7fa87be7ac8b
00f47 4d63d3                         movsxd     r10, r11d
00f4a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f51 c442a8f5db                     bzhi       r11, r11, r10
00f56 c4c1fb92fb                     kmovq      k7, r11
00f5b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f61 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f67 eb6c                           jmp        0x7fa87be7b4d5
00f69 4585ed                         test       r13d, r13d
00f6c 0f8c02160000                   jl         0x7fa87be7ca74
00f72 85db                           test       ebx, ebx
00f74 0f8cfa150000                   jl         0x7fa87be7ca74
00f7a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00f7f 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00f84 0f82ea150000                   jb         0x7fa87be7ca74
00f8a 428d2c1b                       lea        ebp, [rbx + r11]
00f8e 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00f93 443bd5                         cmp        r10d, ebp
00f96 0f82d8150000                   jb         0x7fa87be7ca74
00f9c 4585db                         test       r11d, r11d
00f9f 0f8ccf150000                   jl         0x7fa87be7ca74
00fa5 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00faa 443b8c24b8000000               cmp        r9d, dword ptr [rsp + 0xb8]
00fb2 7421                           je         0x7fa87be7b4d5
00fb4 4963d3                         movsxd     rdx, r11d
00fb7 4883fa20                       cmp        rdx, 0x20
00fbb 768a                           jbe        0x7fa87be7b447
00fbd c5f877                         vzeroupper 
00fc0 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00fca 41ffd2                         call       r10
00fcd 0f1f840000000000               nop        dword ptr [rax + rax]
00fd5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00fda 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00fde c5f877                         vzeroupper 
00fe1 4881c4f0000000                 add        rsp, 0xf0
00fe8 5d                             pop        rbp
00fe9 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00fed 0f87fd170000                   ja         0x7fa87be7ccf0
00ff3 c3                             ret        
00ff4 4d63d2                         movsxd     r10, r10d
00ff7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ffe c442a8f5db                     bzhi       r11, r11, r10
01003 c4c1fb92fb                     kmovq      k7, r11
01008 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0100e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01014 eb7d                           jmp        0x7fa87be7b593
01016 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
0101e 4585db                         test       r11d, r11d
01021 0f84e9030000                   je         0x7fa87be7b910
01027 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0102f 4585db                         test       r11d, r11d
01032 0f8c60150000                   jl         0x7fa87be7ca98
01038 85db                           test       ebx, ebx
0103a 0f8c58150000                   jl         0x7fa87be7ca98
01040 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01045 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0104d 0f8245150000                   jb         0x7fa87be7ca98
01053 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01058 453bdd                         cmp        r11d, r13d
0105b 0f8237150000                   jb         0x7fa87be7ca98
01061 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
01069 4585d2                         test       r10d, r10d
0106c 7425                           je         0x7fa87be7b593
0106e 4983f920                       cmp        r9, 0x20
01072 0f867cffffff                   jbe        0x7fa87be7b4f4
01078 498bd1                         mov        rdx, r9
0107b c5f877                         vzeroupper 
0107e 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
01088 41ffd2                         call       r10
0108b 0f1f840000000000               nop        dword ptr [rax + rax]
01093 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0109b 4585db                         test       r11d, r11d
0109e 0f8ea9010000                   jle        0x7fa87be7b74d
010a4 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
010ac 4b8d742a0c                     lea        rsi, [r10 + r13 + 0xc]
010b1 438d1c2b                       lea        ebx, [r11 + r13]
010b5 458bc5                         mov        r8d, r13d
010b8 442b44247c                     sub        r8d, dword ptr [rsp + 0x7c]
010bd 4c8b9c24d0000000               mov        r11, qword ptr [rsp + 0xd0]
010c5 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
010ca 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
010cf 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
010d7 0f8dd8000000                   jge        0x7fa87be7b6b5
010dd 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
010e5 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
010ea 458bd9                         mov        r11d, r9d
010ed 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
010f1 440f4fd9                       cmovg      r11d, ecx
010f5 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
010fd 4585c0                         test       r8d, r8d
01100 0f8c4e150000                   jl         0x7fa87be7cb54
01106 4585ed                         test       r13d, r13d
01109 0f8c45150000                   jl         0x7fa87be7cb54
0110f 458bd8                         mov        r11d, r8d
01112 44039c24b4000000               add        r11d, dword ptr [rsp + 0xb4]
0111a 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0111f 453bd3                         cmp        r10d, r11d
01122 0f822c150000                   jb         0x7fa87be7cb54
01128 458bdd                         mov        r11d, r13d
0112b 44039c24b4000000               add        r11d, dword ptr [rsp + 0xb4]
01133 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01138 453bd3                         cmp        r10d, r11d
0113b 0f8213150000                   jb         0x7fa87be7cb54
01141 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01149 4585db                         test       r11d, r11d
0114c 0f8c02150000                   jl         0x7fa87be7cb54
01152 4585db                         test       r11d, r11d
01155 7429                           je         0x7fa87be7b680
01157 4963d3                         movsxd     rdx, r11d
0115a 4883fa20                       cmp        rdx, 0x20
0115e 773b                           ja         0x7fa87be7b69b
01160 4d63d3                         movsxd     r10, r11d
01163 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0116a c442a8f5db                     bzhi       r11, r11, r10
0116f c4c1fb92fb                     kmovq      k7, r11
01174 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0117a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01180 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01188 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
01190 0f8cbe010000                   jl         0x7fa87be7b854
01196 e934f3ffff                     jmp        0x7fa87be7a9cf
0119b c5f877                         vzeroupper 
0119e 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
011a8 41ffd2                         call       r10
011ab 0f1f840000000000               nop        dword ptr [rax + rax]
011b3 ebcb                           jmp        0x7fa87be7b680
011b5 4585c0                         test       r8d, r8d
011b8 0f8c5a150000                   jl         0x7fa87be7cc18
011be 4585ed                         test       r13d, r13d
011c1 0f8c51150000                   jl         0x7fa87be7cc18
011c7 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
011cf 4503d0                         add        r10d, r8d
011d2 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
011d7 453bda                         cmp        r11d, r10d
011da 0f8238150000                   jb         0x7fa87be7cc18
011e0 443bdb                         cmp        r11d, ebx
011e3 0f822f150000                   jb         0x7fa87be7cc18
011e9 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
011f1 4585d2                         test       r10d, r10d
011f4 0f84d5f2ffff                   je         0x7fa87be7a9cf
011fa 4883fd20                       cmp        rbp, 0x20
011fe 772d                           ja         0x7fa87be7b72d
01200 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01208 4d63d3                         movsxd     r10, r11d
0120b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01212 c442a8f5db                     bzhi       r11, r11, r10
01217 c4c1fb92fb                     kmovq      k7, r11
0121c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01222 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01228 e9a2f2ffff                     jmp        0x7fa87be7a9cf
0122d 488bd5                         mov        rdx, rbp
01230 c5f877                         vzeroupper 
01233 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
0123d 41ffd2                         call       r10
01240 0f1f840000000000               nop        dword ptr [rax + rax]
01248 e982f2ffff                     jmp        0x7fa87be7a9cf
0124d 418bdd                         mov        ebx, r13d
01250 e97af2ffff                     jmp        0x7fa87be7a9cf
01255 41ffca                         dec        r10d
01258 4585d2                         test       r10d, r10d
0125b 7e1d                           jle        0x7fa87be7b77a
0125d 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01265 45894314                       mov        dword ptr [r11 + 0x14], r8d
01269 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
0126d 45894310                       mov        dword ptr [r11 + 0x10], r8d
01271 4589530c                       mov        dword ptr [r11 + 0xc], r10d
01275 e91df5ffff                     jmp        0x7fa87be7ac97
0127a 48be28387ce200000000           movabs     rsi, 0xe27c3828
01284 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01289 4c891424                       mov        qword ptr [rsp], r10
0128d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01292 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01297 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0129b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
012a0 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
012a5 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
012aa 4c89542448                     mov        qword ptr [rsp + 0x48], r10
012af 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
012b4 4489542444                     mov        dword ptr [rsp + 0x44], r10d
012b9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
012be 4c89542458                     mov        qword ptr [rsp + 0x58], r10
012c3 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
012ca 6690                           nop        
012cc c5f877                         vzeroupper 
012cf e88c50a9ff                     call       0x7fa87b910860
012d4 0f1f8400cc13000c               nop        dword ptr [rax + rax + 0xc0013cc]
012dc 4885c0                         test       rax, rax
012df 0f8528f5ffff                   jne        0x7fa87be7ad0d
012e5 bef6ffffff                     mov        esi, 0xfffffff6
012ea 6690                           nop        
012ec c5f877                         vzeroupper 
012ef e86cc5b5ff                     call       0x7fa87b9d7d60
012f4 0f1f8400ec13000d               nop        dword ptr [rax + rax + 0xd0013ec]
012fc 448bdd                         mov        r11d, ebp
012ff 4d63d3                         movsxd     r10, r11d
01302 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01309 c442a8f5db                     bzhi       r11, r11, r10
0130e c4c1fb92fb                     kmovq      k7, r11
01313 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01319 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0131f 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01327 4403d5                         add        r10d, ebp
0132a 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
01332 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01336 418502                         test       dword ptr [r10], eax
01339 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01341 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
01349 0f8d80f1ffff                   jge        0x7fa87be7a9cf
0134f 448974247c                     mov        dword ptr [rsp + 0x7c], r14d
01354 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01359 442b8424b4000000               sub        r8d, dword ptr [rsp + 0xb4]
01361 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
01368 2bac24b4000000                 sub        ebp, dword ptr [rsp + 0xb4]
0136f 3bac24b4000000                 cmp        ebp, dword ptr [rsp + 0xb4]
01376 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0137e 410f4feb                       cmovg      ebp, r11d
01382 4585c0                         test       r8d, r8d
01385 0f8c290e0000                   jl         0x7fa87be7c6b4
0138b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01390 4585d2                         test       r10d, r10d
01393 0f8c1b0e0000                   jl         0x7fa87be7c6b4
01399 458d1c28                       lea        r11d, [r8 + rbp]
0139d 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
013a2 453bcb                         cmp        r9d, r11d
013a5 0f82090e0000                   jb         0x7fa87be7c6b4
013ab 448b74247c                     mov        r14d, dword ptr [rsp + 0x7c]
013b0 4403f5                         add        r14d, ebp
013b3 458bd1                         mov        r10d, r9d
013b6 453bd6                         cmp        r10d, r14d
013b9 0f82f50d0000                   jb         0x7fa87be7c6b4
013bf 85ed                           test       ebp, ebp
013c1 0f8ced0d0000                   jl         0x7fa87be7c6b4
013c7 85ed                           test       ebp, ebp
013c9 0f8450ffffff                   je         0x7fa87be7b81f
013cf 4c8b9424d0000000               mov        r10, qword ptr [rsp + 0xd0]
013d7 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
013dc 4b8d740a0c                     lea        rsi, [r10 + r9 + 0xc]
013e1 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
013e6 4863d5                         movsxd     rdx, ebp
013e9 4883fa20                       cmp        rdx, 0x20
013ed 0f8609ffffff                   jbe        0x7fa87be7b7fc
013f3 c5f877                         vzeroupper 
013f6 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
01400 41ffd2                         call       r10
01403 0f1f840000000000               nop        dword ptr [rax + rax]
0140b e90fffffff                     jmp        0x7fa87be7b81f
01410 448beb                         mov        r13d, ebx
01413 e97bfcffff                     jmp        0x7fa87be7b593
01418 bee4ffffff                     mov        esi, 0xffffffe4
0141d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01422 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01427 44895c2408                     mov        dword ptr [rsp + 8], r11d
0142c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01431 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01436 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0143b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01440 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01444 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01449 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0144e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01453 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01458 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0145d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01462 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01467 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0146c c5f877                         vzeroupper 
0146f e8ecc3b5ff                     call       0x7fa87b9d7d60
01474 0f1f84006c15000f               nop        dword ptr [rax + rax + 0xf00156c]
0147c bee4ffffff                     mov        esi, 0xffffffe4
01481 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01486 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0148b 4489542408                     mov        dword ptr [rsp + 8], r10d
01490 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01495 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0149a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0149f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
014a4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
014a9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
014ae 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
014b3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014b8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
014bd 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
014c2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
014c7 4c89542450                     mov        qword ptr [rsp + 0x50], r10
014cc 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
014d1 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
014d6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
014db 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
014e0 c5f877                         vzeroupper 
014e3 e878c3b5ff                     call       0x7fa87b9d7d60
014e8 0f1f8400e0150010               nop        dword ptr [rax + rax + 0x100015e0]
014f0 bee4ffffff                     mov        esi, 0xffffffe4
014f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014fa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01502 4c891424                       mov        qword ptr [rsp], r10
01506 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0150b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01510 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01515 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0151a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0151f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01524 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01529 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0152e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01533 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01538 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0153d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01542 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0154a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0154f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01554 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01559 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0155e 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01563 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01568 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0156d c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01576 6690                           nop        
01578 c5f877                         vzeroupper 
0157b e8e0c2b5ff                     call       0x7fa87b9d7d60
01580 0f1f840078160011               nop        dword ptr [rax + rax + 0x11001678]
01588 bee4ffffff                     mov        esi, 0xffffffe4
0158d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01592 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01597 4489542408                     mov        dword ptr [rsp + 8], r10d
0159c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015a1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015a6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015ab 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015b0 895c2430                       mov        dword ptr [rsp + 0x30], ebx
015b4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
015b9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
015be 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
015c3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015c8 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
015cd 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
015d2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
015d7 4c89542450                     mov        qword ptr [rsp + 0x50], r10
015dc 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
015e1 4489542458                     mov        dword ptr [rsp + 0x58], r10d
015e6 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
015eb 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
015f0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
015f5 4489542460                     mov        dword ptr [rsp + 0x60], r10d
015fa 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
015ff 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01604 c5f877                         vzeroupper 
01607 e854c2b5ff                     call       0x7fa87b9d7d60
0160c 0f1f840004170012               nop        dword ptr [rax + rax + 0x12001704]
01614 bee4ffffff                     mov        esi, 0xffffffe4
01619 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0161e 4c891c24                       mov        qword ptr [rsp], r11
01622 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01627 44895c2408                     mov        dword ptr [rsp + 8], r11d
0162c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01631 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01636 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0163b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01640 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01645 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0164a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0164f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01654 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01659 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0165e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01663 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0166b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01670 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01675 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0167a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0167f 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01684 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01689 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0168e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01693 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01698 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0169d 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
016a2 895c2478                       mov        dword ptr [rsp + 0x78], ebx
016a6 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016af 90                             nop        
016b0 c5f877                         vzeroupper 
016b3 e8a8c1b5ff                     call       0x7fa87b9d7d60
016b8 0f1f8400b0170013               nop        dword ptr [rax + rax + 0x130017b0]
016c0 be45ffffff                     mov        esi, 0xffffff45
016c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016ca 4c89442408                     mov        qword ptr [rsp + 8], r8
016cf 90                             nop        
016d0 c5f877                         vzeroupper 
016d3 e888c1b5ff                     call       0x7fa87b9d7d60
016d8 0f1f8400d0170014               nop        dword ptr [rax + rax + 0x140017d0]
016e0 be45ffffff                     mov        esi, 0xffffff45
016e5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016ea 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016ef 4489542408                     mov        dword ptr [rsp + 8], r10d
016f4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016f9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016fe 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01703 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01708 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0170c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01711 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01716 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0171b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01720 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01725 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0172a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0172f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01734 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01738 c5f877                         vzeroupper 
0173b e820c1b5ff                     call       0x7fa87b9d7d60
01740 0f1f840038180015               nop        dword ptr [rax + rax + 0x15001838]
01748 4d3bd0                         cmp        r10, r8
0174b bdffffffff                     mov        ebp, 0xffffffff
01750 7c08                           jl         0x7fa87be7bc5a
01752 400f95c5                       setne      bpl
01756 400fb6ed                       movzx      ebp, bpl
0175a be45ffffff                     mov        esi, 0xffffff45
0175f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01764 4c891424                       mov        qword ptr [rsp], r10
01768 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0176d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01772 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01776 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0177b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01780 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01785 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0178a 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0178f 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01794 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01799 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0179e 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
017a3 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017a8 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
017ad 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
017b2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017b7 4489542468                     mov        dword ptr [rsp + 0x68], r10d
017bc 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
017c1 4489542474                     mov        dword ptr [rsp + 0x74], r10d
017c6 4c89442478                     mov        qword ptr [rsp + 0x78], r8
017cb 90                             nop        
017cc c5f877                         vzeroupper 
017cf e88cc0b5ff                     call       0x7fa87b9d7d60
017d4 0f1f8400cc180016               nop        dword ptr [rax + rax + 0x160018cc]
017dc be45ffffff                     mov        esi, 0xffffff45
017e1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017e6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017eb 4489542408                     mov        dword ptr [rsp + 8], r10d
017f0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017f5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017fa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017ff 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01804 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01808 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0180d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01812 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01817 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0181c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01821 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01826 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0182b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01830 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01835 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0183a 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0183f 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01844 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01849 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0184e 6690                           nop        
01850 c5f877                         vzeroupper 
01853 e808c0b5ff                     call       0x7fa87b9d7d60
01858 0f1f840050190017               nop        dword ptr [rax + rax + 0x17001950]
01860 be45ffffff                     mov        esi, 0xffffff45
01865 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0186a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0186f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01874 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01879 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0187e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01883 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01888 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0188d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01892 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01897 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0189c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
018a1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
018a6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018ab 4c89542450                     mov        qword ptr [rsp + 0x50], r10
018b0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018b5 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
018ba 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
018c2 4489542464                     mov        dword ptr [rsp + 0x64], r10d
018c7 90                             nop        
018c8 c5f877                         vzeroupper 
018cb e890bfb5ff                     call       0x7fa87b9d7d60
018d0 0f1f8400c8190018               nop        dword ptr [rax + rax + 0x180019c8]
018d8 4533d2                         xor        r10d, r10d
018db 4c89542408                     mov        qword ptr [rsp + 8], r10
018e0 e94fe8ffff                     jmp        0x7fa87be7a634
018e5 4533d2                         xor        r10d, r10d
018e8 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
018f0 e968e8ffff                     jmp        0x7fa87be7a65d
018f5 4533d2                         xor        r10d, r10d
018f8 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01900 e988e8ffff                     jmp        0x7fa87be7a68d
01905 4533d2                         xor        r10d, r10d
01908 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0190d e9a3e8ffff                     jmp        0x7fa87be7a6b5
01912 4533d2                         xor        r10d, r10d
01915 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0191d e9c3e8ffff                     jmp        0x7fa87be7a6e5
01922 4533d2                         xor        r10d, r10d
01925 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0192d e9dee8ffff                     jmp        0x7fa87be7a710
01932 bee4ffffff                     mov        esi, 0xffffffe4
01937 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0193c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01941 4489542408                     mov        dword ptr [rsp + 8], r10d
01946 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0194b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01950 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01955 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0195a 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0195f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01964 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01969 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0196e 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01973 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01978 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01980 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01985 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0198a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0198f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01994 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01999 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0199e 4489542458                     mov        dword ptr [rsp + 0x58], r10d
019a3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019a8 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
019ad 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
019b2 4489542468                     mov        dword ptr [rsp + 0x68], r10d
019b7 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
019bc 895c2470                       mov        dword ptr [rsp + 0x70], ebx
019c0 c5f877                         vzeroupper 
019c3 e898beb5ff                     call       0x7fa87b9d7d60
019c8 0f1f8400c01a0019               nop        dword ptr [rax + rax + 0x19001ac0]
019d0 bee4ffffff                     mov        esi, 0xffffffe4
019d5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019da 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019df 44895c2408                     mov        dword ptr [rsp + 8], r11d
019e4 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
019ec 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019f1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019f6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019fb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a00 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a05 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01a0d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a12 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01a17 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01a1c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a21 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a26 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01a2b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01a30 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01a38 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a3d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a42 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a47 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01a4c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01a51 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01a56 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01a5b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a60 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01a65 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01a6a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01a6f 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
01a74 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01a79 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01a80 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
01a89 666690                         nop        
01a8c c5f877                         vzeroupper 
01a8f e8ccbdb5ff                     call       0x7fa87b9d7d60
01a94 0f1f84008c1b001a               nop        dword ptr [rax + rax + 0x1a001b8c]
01a9c 418bee                         mov        ebp, r14d
01a9f 83c510                         add        ebp, 0x10
01aa2 be6effffff                     mov        esi, 0xffffff6e
01aa7 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01aac 4c891424                       mov        qword ptr [rsp], r10
01ab0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ab5 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01aba 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01abf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01ac4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ac9 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01ace 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ad3 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01ad8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01add 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ae5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01aea 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01aef 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01af4 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01af9 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01afe 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01b03 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01b08 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b0d 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01b12 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01b17 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01b1c 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01b21 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
01b29 666690                         nop        
01b2c c5f877                         vzeroupper 
01b2f e82cbdb5ff                     call       0x7fa87b9d7d60
01b34 0f1f84002c1c001b               nop        dword ptr [rax + rax + 0x1b001c2c]
01b3c 418bee                         mov        ebp, r14d
01b3f 83c510                         add        ebp, 0x10
01b42 be66ffffff                     mov        esi, 0xffffff66
01b47 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b4c 4c891424                       mov        qword ptr [rsp], r10
01b50 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b55 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b5a 4489742438                     mov        dword ptr [rsp + 0x38], r14d
01b5f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01b64 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01b69 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01b6e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b73 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01b78 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01b7d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01b85 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b8a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b8f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01b94 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01b99 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01b9e 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01ba3 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ba8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01bad 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01bb2 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01bb7 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01bbc 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01bc1 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
01bc9 666690                         nop        
01bcc c5f877                         vzeroupper 
01bcf e88cbcb5ff                     call       0x7fa87b9d7d60
01bd4 0f1f8400cc1c001c               nop        dword ptr [rax + rax + 0x1c001ccc]
01bdc bebeffffff                     mov        esi, 0xffffffbe
01be1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01be6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01beb 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bf0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bf5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bfa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bff 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c04 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c08 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01c0d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01c12 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01c17 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c1c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01c21 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01c26 6690                           nop        
01c28 c5f877                         vzeroupper 
01c2b e830bcb5ff                     call       0x7fa87b9d7d60
01c30 0f1f8400281d001d               nop        dword ptr [rax + rax + 0x1d001d28]
01c38 be85ffffff                     mov        esi, 0xffffff85
01c3d 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01c41 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c46 44891424                       mov        dword ptr [rsp], r10d
01c4a 895c2404                       mov        dword ptr [rsp + 4], ebx
01c4e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01c53 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01c58 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01c5d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c62 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01c67 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01c6c 4c896c2458                     mov        qword ptr [rsp + 0x58], r13
01c71 4c89742460                     mov        qword ptr [rsp + 0x60], r14
01c76 6690                           nop        
01c78 c5f877                         vzeroupper 
01c7b e8e0bbb5ff                     call       0x7fa87b9d7d60
01c80 0f1f8400781d001e               nop        dword ptr [rax + rax + 0x1e001d78]
01c88 bee4ffffff                     mov        esi, 0xffffffe4
01c8d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01c92 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c97 4489542408                     mov        dword ptr [rsp + 8], r10d
01c9c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ca1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ca6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01cab 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01cb0 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01cb4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01cb9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cbe 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01cc3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cc8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01ccd 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01cd2 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01cda 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01cdf 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01ce4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01ce9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01cee 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01cf3 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01cf8 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01cfd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d02 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d07 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01d0e 6690                           nop        
01d10 c5f877                         vzeroupper 
01d13 e848bbb5ff                     call       0x7fa87b9d7d60
01d18 0f1f8400101e001f               nop        dword ptr [rax + rax + 0x1f001e10]
01d20 bef6ffffff                     mov        esi, 0xfffffff6
01d25 666690                         nop        
01d28 c5f877                         vzeroupper 
01d2b e830bbb5ff                     call       0x7fa87b9d7d60
01d30 0f1f8400281e0020               nop        dword ptr [rax + rax + 0x20001e28]
01d38 beccffffff                     mov        esi, 0xffffffcc
01d3d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d42 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d47 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d4c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d51 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d56 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d5b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01d60 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01d65 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01d6a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d6f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d74 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01d79 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01d7e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01d86 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d8b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01d90 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01d95 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01d9a 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01d9f 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01da4 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01da9 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01dae 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01db3 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01db8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01dbd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01dc5 4c89542470                     mov        qword ptr [rsp + 0x70], r10
01dca 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
01dce 6690                           nop        
01dd0 c5f877                         vzeroupper 
01dd3 e888bab5ff                     call       0x7fa87b9d7d60
01dd8 0f1f8400d01e0021               nop        dword ptr [rax + rax + 0x21001ed0]
01de0 bee4ffffff                     mov        esi, 0xffffffe4
01de5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01dea 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01df2 4c891424                       mov        qword ptr [rsp], r10
01df6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01dfb 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e00 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e05 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e0a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e0f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e14 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01e19 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e1e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e23 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e28 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01e2d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01e32 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01e3a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01e3f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01e44 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e49 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01e4e 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01e53 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
01e58 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01e5d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e62 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e67 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
01e6f 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01e74 c5f877                         vzeroupper 
01e77 e8e4b9b5ff                     call       0x7fa87b9d7d60
01e7c 0f1f8400741f0022               nop        dword ptr [rax + rax + 0x22001f74]
01e84 bee4ffffff                     mov        esi, 0xffffffe4
01e89 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e8e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01e96 4c891424                       mov        qword ptr [rsp], r10
01e9a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e9f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ea4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ea9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eae 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01eb3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01eb8 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01ebd 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ec2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01ec7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ecc 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01ed1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ed6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ede 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01ee3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01ee8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01eed 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01ef2 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01ef7 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01efc 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01f01 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f06 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01f0b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01f10 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01f15 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
01f1d 666690                         nop        
01f20 c5f877                         vzeroupper 
01f23 e838b9b5ff                     call       0x7fa87b9d7d60
01f28 0f1f840020200023               nop        dword ptr [rax + rax + 0x23002020]
01f30 beccffffff                     mov        esi, 0xffffffcc
01f35 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f3a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f3f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f44 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f49 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f4e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f53 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f58 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01f5d 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f62 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01f67 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f6c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01f71 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f76 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01f7e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01f83 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01f88 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f8d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01f92 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01f97 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
01f9c 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01fa1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01fa6 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01fab 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01fb3 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01fb8 c5f877                         vzeroupper 
01fbb e8a0b8b5ff                     call       0x7fa87b9d7d60
01fc0 0f1f8400b8200024               nop        dword ptr [rax + rax + 0x240020b8]
01fc8 be6effffff                     mov        esi, 0xffffff6e
01fcd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01fd2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01fd7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01fdc 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01fe1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01fe6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01feb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01ff0 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ff4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01ff9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ffe 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
02003 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
02008 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
0200d 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
02012 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
02017 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0201c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02021 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02026 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
0202b 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
02030 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02035 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0203a 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0203f 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02043 90                             nop        
02044 c5f877                         vzeroupper 
02047 e814b8b5ff                     call       0x7fa87b9d7d60
0204c 0f1f840044210025               nop        dword ptr [rax + rax + 0x25002144]
02054 458bc1                         mov        r8d, r9d
02057 e9b8eeffff                     jmp        0x7fa87be7b414
0205c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
02061 458d5308                       lea        r10d, [r11 + 8]
02065 458bca                         mov        r9d, r10d
02068 be6effffff                     mov        esi, 0xffffff6e
0206d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02072 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02077 44895c2408                     mov        dword ptr [rsp + 8], r11d
0207c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02081 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02086 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0208b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02090 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02095 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0209a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0209f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020a4 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
020a9 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
020ae 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
020b3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020b8 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
020bd 4489542444                     mov        dword ptr [rsp + 0x44], r10d
020c2 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
020c7 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
020cc 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
020d1 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
020d6 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
020de 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
020e3 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
020e8 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
020f0 458bd3                         mov        r10d, r11d
020f3 4489542478                     mov        dword ptr [rsp + 0x78], r10d
020f8 c5f877                         vzeroupper 
020fb e860b7b5ff                     call       0x7fa87b9d7d60
02100 0f1f8400f8210026               nop        dword ptr [rax + rax + 0x260021f8]
02108 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0210d 458d5308                       lea        r10d, [r11 + 8]
02111 458bc2                         mov        r8d, r10d
02114 be66ffffff                     mov        esi, 0xffffff66
02119 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0211e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02123 44895c2408                     mov        dword ptr [rsp + 8], r11d
02128 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0212d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02132 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02137 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0213c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02141 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02146 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0214b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02150 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02155 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0215a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0215f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02164 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02169 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0216e 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
02173 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02178 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0217d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02182 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0218a 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0218f 458bd3                         mov        r10d, r11d
02192 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02197 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0219f 4489542478                     mov        dword ptr [rsp + 0x78], r10d
021a4 c5f877                         vzeroupper 
021a7 e8b4b6b5ff                     call       0x7fa87b9d7d60
021ac 0f1f8400a4220027               nop        dword ptr [rax + rax + 0x270022a4]
021b4 beccffffff                     mov        esi, 0xffffffcc
021b9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
021be 4c891424                       mov        qword ptr [rsp], r10
021c2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
021ca 4c89542408                     mov        qword ptr [rsp + 8], r10
021cf 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
021d7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021dc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
021e1 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
021e6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
021ee 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021f3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
021f8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
021fd 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02202 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02207 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0220c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02211 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02219 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0221e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02223 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02228 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0222d 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02232 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02237 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0223c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02241 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02246 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
0224b 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
02253 90                             nop        
02254 c5f877                         vzeroupper 
02257 e804b6b5ff                     call       0x7fa87b9d7d60
0225c 0f1f840054230028               nop        dword ptr [rax + rax + 0x28002354]
02264 bee4ffffff                     mov        esi, 0xffffffe4
02269 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0226e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02276 4c891424                       mov        qword ptr [rsp], r10
0227a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0227f 44895c2408                     mov        dword ptr [rsp + 8], r11d
02284 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02289 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0228e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02293 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02298 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0229d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
022a2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
022a7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022ac 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
022b1 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
022b6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
022be 4c89542448                     mov        qword ptr [rsp + 0x48], r10
022c3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022c8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
022cd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
022d2 4489542444                     mov        dword ptr [rsp + 0x44], r10d
022d7 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
022dc 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
022e1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
022e6 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
022eb 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
022f3 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
022f8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
022fd 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02302 6690                           nop        
02304 c5f877                         vzeroupper 
02307 e854b5b5ff                     call       0x7fa87b9d7d60
0230c 0f1f840004240029               nop        dword ptr [rax + rax + 0x29002404]
02314 bee4ffffff                     mov        esi, 0xffffffe4
02319 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0231e 4c891424                       mov        qword ptr [rsp], r10
02322 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0232a 4c89542408                     mov        qword ptr [rsp + 8], r10
0232f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02334 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02339 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0233e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02343 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02348 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0234d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02352 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02357 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0235f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02364 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02369 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0236e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
02373 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02378 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
0237d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02382 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02387 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0238c 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
02391 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02396 6690                           nop        
02398 c5f877                         vzeroupper 
0239b e8c0b4b5ff                     call       0x7fa87b9d7d60
023a0 0f1f84009824002a               nop        dword ptr [rax + rax + 0x2a002498]
023a8 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
023af ffc5                           inc        ebp
023b1 bee4ffffff                     mov        esi, 0xffffffe4
023b6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
023bb 4c891424                       mov        qword ptr [rsp], r10
023bf 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
023c7 4c89542408                     mov        qword ptr [rsp + 8], r10
023cc 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
023d4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023d9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023de 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023e3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
023e8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
023ed 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
023f2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023f7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
023fc 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02401 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02409 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0240e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02413 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02418 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0241d 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02422 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02427 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0242c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02431 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02436 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0243b 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
02440 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
02448 c5f877                         vzeroupper 
0244b e810b4b5ff                     call       0x7fa87b9d7d60
02450 0f1f84004825002b               nop        dword ptr [rax + rax + 0x2b002548]
02458 bee4ffffff                     mov        esi, 0xffffffe4
0245d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02462 4c891424                       mov        qword ptr [rsp], r10
02466 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0246e 4c89542408                     mov        qword ptr [rsp + 8], r10
02473 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02478 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0247d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02482 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02487 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0248c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02491 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02496 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0249b 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
024a3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
024a8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
024ad 4c89542458                     mov        qword ptr [rsp + 0x58], r10
024b2 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
024b7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
024bc 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
024c1 4489542460                     mov        dword ptr [rsp + 0x60], r10d
024c6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
024cb 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
024d0 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
024d5 4489542478                     mov        dword ptr [rsp + 0x78], r10d
024da 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
024e2 6690                           nop        
024e4 c5f877                         vzeroupper 
024e7 e874b3b5ff                     call       0x7fa87b9d7d60
024ec 0f1f8400e425002c               nop        dword ptr [rax + rax + 0x2c0025e4]
024f4 bee4ffffff                     mov        esi, 0xffffffe4
024f9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
024fe 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02503 4489542408                     mov        dword ptr [rsp + 8], r10d
02508 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0250d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02512 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02517 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0251c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02521 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02526 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0252b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02530 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02535 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0253a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0253f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02544 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02549 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0254e 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02553 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02558 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0255d 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02562 6690                           nop        
02564 c5f877                         vzeroupper 
02567 e8f4b2b5ff                     call       0x7fa87b9d7d60
0256c 0f1f84006426002d               nop        dword ptr [rax + rax + 0x2d002664]
02574 beccffffff                     mov        esi, 0xffffffcc
02579 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0257e 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02582 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02587 90                             nop        
02588 c5f877                         vzeroupper 
0258b e8d0b2b5ff                     call       0x7fa87b9d7d60
02590 0f1f84008826002e               nop        dword ptr [rax + rax + 0x2e002688]
02598 beccffffff                     mov        esi, 0xffffffcc
0259d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025a2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
025a7 44895c2408                     mov        dword ptr [rsp + 8], r11d
025ac 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
025b4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
025b9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025be 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025c3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
025c8 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
025cd 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
025d2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
025d7 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
025dc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025e1 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
025e6 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025eb 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
025f3 4c89542448                     mov        qword ptr [rsp + 0x48], r10
025f8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
025fd 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02602 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
02607 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0260c 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02611 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02616 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0261b 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02620 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
02625 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
0262a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02632 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0263a 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
02641 666690                         nop        
02644 c5f877                         vzeroupper 
02647 e814b2b5ff                     call       0x7fa87b9d7d60
0264c 0f1f84004427002f               nop        dword ptr [rax + rax + 0x2f002744]
02654 beccffffff                     mov        esi, 0xffffffcc
02659 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0265e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02666 4c891424                       mov        qword ptr [rsp], r10
0266a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0266f 4489542408                     mov        dword ptr [rsp + 8], r10d
02674 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0267c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02681 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02686 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0268b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02690 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02695 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0269a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0269f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
026a4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
026a9 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
026ae 4489542440                     mov        dword ptr [rsp + 0x40], r10d
026b3 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
026bb 4c89542448                     mov        qword ptr [rsp + 0x48], r10
026c0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026c5 4c89542450                     mov        qword ptr [rsp + 0x50], r10
026ca 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
026cf 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
026d4 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
026d9 4489542458                     mov        dword ptr [rsp + 0x58], r10d
026de 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
026e3 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
026e8 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
026ed 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
026f5 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
026fd 458bda                         mov        r11d, r10d
02700 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
02708 c5f877                         vzeroupper 
0270b e850b1b5ff                     call       0x7fa87b9d7d60
02710 0f1f840008280030               nop        dword ptr [rax + rax + 0x30002808]
02718 beccffffff                     mov        esi, 0xffffffcc
0271d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02722 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02727 44895c2408                     mov        dword ptr [rsp + 8], r11d
0272c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02731 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02736 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0273b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02740 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02745 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0274a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0274f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02754 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02759 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0275e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
02766 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0276b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02770 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02775 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0277a 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0277f 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
02784 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02789 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0278e 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02793 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0279b 4489542468                     mov        dword ptr [rsp + 0x68], r10d
027a0 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
027a5 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
027ad 666690                         nop        
027b0 c5f877                         vzeroupper 
027b3 e8a8b0b5ff                     call       0x7fa87b9d7d60
027b8 0f1f8400b0280031               nop        dword ptr [rax + rax + 0x310028b0]
027c0 eb10                           jmp        0x7fa87be7ccd2
027c2 eb0e                           jmp        0x7fa87be7ccd2
027c4 eb0c                           jmp        0x7fa87be7ccd2
027c6 eb0a                           jmp        0x7fa87be7ccd2
027c8 eb08                           jmp        0x7fa87be7ccd2
027ca eb06                           jmp        0x7fa87be7ccd2
027cc eb04                           jmp        0x7fa87be7ccd2
027ce eb02                           jmp        0x7fa87be7ccd2
027d0 eb00                           jmp        0x7fa87be7ccd2
027d2 488bf0                         mov        rsi, rax
027d5 e936e0ffff                     jmp        0x7fa87be7ad10
027da bef6ffffff                     mov        esi, 0xfffffff6
027df 90                             nop        
027e0 c5f877                         vzeroupper 
027e3 e878b0b5ff                     call       0x7fa87b9d7d60
027e8 0f1f8400e0280032               nop        dword ptr [rax + rax + 0x320028e0]
027f0 49bae9b4e77ba87f0000           movabs     r10, 0x7fa87be7b4e9
027fa 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02801 e9da61a9ff                     jmp        0x7fa87b912ee0
02806 e8952da8ff                     call       0x7fa87b8ffaa0
0280b e91ed8ffff                     jmp        0x7fa87be7a52e
