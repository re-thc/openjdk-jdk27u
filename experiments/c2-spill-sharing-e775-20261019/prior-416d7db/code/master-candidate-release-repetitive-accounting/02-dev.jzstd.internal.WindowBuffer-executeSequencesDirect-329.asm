00000 e8bbd46d19                     call       0x7fbe49534340
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecd0000000                 sub        rsp, 0xd0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f851c210000                   jne        0x7fbe2fe58fca
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
0008a 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00091 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00096 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
0009d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
000a2 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
000a9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
000ae 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000b5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
000ba 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000c1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000c6 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000cd 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000d2 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000d9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000de 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000e2 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000ea 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000ee 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
000f6 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
000fa 4489542424                     mov        dword ptr [rsp + 0x24], r10d
000ff 448b5e10                       mov        r11d, dword ptr [rsi + 0x10]
00103 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00108 448b6e08                       mov        r13d, dword ptr [rsi + 8]
0010c 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
00113 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00118 488bfe                         mov        rdi, rsi
0011b c5f877                         vzeroupper 
0011e 49ba80aa6149be7f0000           movabs     r10, 0x7fbe4961aa80
00128 41ffd2                         call       r10
0012b 0f1f840000000000               nop        dword ptr [rax + rax]
00133 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0013b 4d85d2                         test       r10, r10
0013e 0f84e40f0000                   je         0x7fbe2fe57fa8
00144 458b12                         mov        r10d, dword ptr [r10]
00147 41c1ea0d                       shr        r10d, 0xd
0014b 4181fa15040000                 cmp        r10d, 0x415
00152 0f855b120000                   jne        0x7fbe2fe58233
00158 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00160 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00165 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0016d 4d85d2                         test       r10, r10
00170 0f84bf0f0000                   je         0x7fbe2fe57fb5
00176 458b1a                         mov        r11d, dword ptr [r10]
00179 41c1eb0d                       shr        r11d, 0xd
0017d 4181fb05010000                 cmp        r11d, 0x105
00184 0f8529120000                   jne        0x7fbe2fe58233
0018a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0018f 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00197 4d85d2                         test       r10, r10
0019a 0f84a20f0000                   je         0x7fbe2fe57fc2
001a0 458b12                         mov        r10d, dword ptr [r10]
001a3 41c1ea0d                       shr        r10d, 0xd
001a7 4181fa08010000                 cmp        r10d, 0x108
001ae 0f85ff110000                   jne        0x7fbe2fe58233
001b4 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
001bc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
001c1 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
001c9 4d85d2                         test       r10, r10
001cc 0f847d0f0000                   je         0x7fbe2fe57fcf
001d2 458b1a                         mov        r11d, dword ptr [r10]
001d5 41c1eb0d                       shr        r11d, 0xd
001d9 4181fb07010000                 cmp        r11d, 0x107
001e0 0f85cd110000                   jne        0x7fbe2fe58233
001e6 4c89542478                     mov        qword ptr [rsp + 0x78], r10
001eb 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
001f3 4d85d2                         test       r10, r10
001f6 0f84600f0000                   je         0x7fbe2fe57fdc
001fc 458b12                         mov        r10d, dword ptr [r10]
001ff 41c1ea0d                       shr        r10d, 0xd
00203 4181fa07010000                 cmp        r10d, 0x107
0020a 0f85a3110000                   jne        0x7fbe2fe58233
00210 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00218 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00220 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00228 458b1a                         mov        r11d, dword ptr [r10]
0022b 41c1eb0d                       shr        r11d, 0xd
0022f 4181fb05010000                 cmp        r11d, 0x105
00236 0f8577110000                   jne        0x7fbe2fe58233
0023c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00241 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00245 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0024a 458d53f1                       lea        r10d, [r11 - 0xf]
0024e 4585d2                         test       r10d, r10d
00251 0f8cba110000                   jl         0x7fbe2fe58291
00257 458bd3                         mov        r10d, r11d
0025a 4183c2f1                       add        r10d, -0xf
0025e 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00266 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
0026d 0f837d0d0000                   jae        0x7fbe2fe57e70
00273 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00278 c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
0027f 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
00287 0f831b110000                   jae        0x7fbe2fe58228
0028d 83c510                         add        ebp, 0x10
00290 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00294 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00299 c4817a7f442b08                 vmovdqu    xmmword ptr [r11 + r13 + 8], xmm0
002a0 4183c510                       add        r13d, 0x10
002a4 418502                         test       dword ptr [r10], eax
002a7 443b6c240c                     cmp        r13d, dword ptr [rsp + 0xc]
002ac 7d4a                           jge        0x7fbe2fe57178
002ae 6690                           nop        
002b0 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
002b7 0f83330d0000                   jae        0x7fbe2fe57e70
002bd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
002c2 c4c17a6f442a08                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 8]
002c9 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
002d1 0f83dd0d0000                   jae        0x7fbe2fe57f34
002d7 83c510                         add        ebp, 0x10
002da 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002de 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
002e3 c4817a7f442b08                 vmovdqu    xmmword ptr [r11 + r13 + 8], xmm0
002ea 4183c510                       add        r13d, 0x10
002ee 418502                         test       dword ptr [r10], eax
002f1 443b6c240c                     cmp        r13d, dword ptr [rsp + 0xc]
002f6 7cb8                           jl         0x7fbe2fe57130
002f8 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
002fd 41ffc3                         inc        r11d
00300 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00305 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00309 418502                         test       dword ptr [r10], eax
0030c 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00311 4963c9                         movsxd     rcx, r9d
00314 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00319 452bd9                         sub        r11d, r9d
0031c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00321 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
00326 4b8d740208                     lea        rsi, [r10 + r8 + 8]
0032b 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
00330 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00335 0f8d8f070000                   jge        0x7fbe2fe5794a
0033b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00340 458b5204                       mov        r10d, dword ptr [r10 + 4]
00344 453bc2                         cmp        r8d, r10d
00347 0f831f0e0000                   jae        0x7fbe2fe57fec
0034d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00352 4f8b44c208                     mov        r8, qword ptr [r10 + r8*8 + 8]
00357 4d8bd0                         mov        r10, r8
0035a 49c1fa24                       sar        r10, 0x24
0035e 418bda                         mov        ebx, r10d
00361 458bd0                         mov        r10d, r8d
00364 49c1e812                       shr        r8, 0x12
00368 4181e2ffff0100                 and        r10d, 0x1ffff
0036f 418bf8                         mov        edi, r8d
00372 81e7ffff0300                   and        edi, 0x3ffff
00378 89bc2494000000                 mov        dword ptr [rsp + 0x94], edi
0037f 85db                           test       ebx, ebx
00381 7d20                           jge        0x7fbe2fe57223
00383 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00388 458b4004                       mov        r8d, dword ptr [r8 + 4]
0038c 8b5c2424                       mov        ebx, dword ptr [rsp + 0x24]
00390 413bd8                         cmp        ebx, r8d
00393 0f83750e0000                   jae        0x7fbe2fe5808e
00399 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0039e 418b5c9808                     mov        ebx, dword ptr [r8 + rbx*4 + 8]
003a3 4585d2                         test       r10d, r10d
003a6 0f84b6070000                   je         0x7fbe2fe579e2
003ac 453bd3                         cmp        r10d, r11d
003af 0f8f370e0000                   jg         0x7fbe2fe5806c
003b5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
003bd 83fb03                         cmp        ebx, 3
003c0 0f8f0e020000                   jg         0x7fbe2fe57454
003c6 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
003ce 4585d2                         test       r10d, r10d
003d1 7402                           je         0x7fbe2fe57255
003d3 ffcb                           dec        ebx
003d5 85db                           test       ebx, ebx
003d7 0f84d3070000                   je         0x7fbe2fe57a30
003dd 83fb03                         cmp        ebx, 3
003e0 0f84f0070000                   je         0x7fbe2fe57a56
003e6 83fb02                         cmp        ebx, 2
003e9 0f87ac010000                   ja         0x7fbe2fe5741b
003ef 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
003f7 458b5204                       mov        r10d, dword ptr [r10 + 4]
003fb 413bda                         cmp        ebx, r10d
003fe 0f83b8100000                   jae        0x7fbe2fe5833c
00404 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0040c 458b6c9b08                     mov        r13d, dword ptr [r11 + rbx*4 + 8]
00411 85db                           test       ebx, ebx
00413 0f8e6b010000                   jle        0x7fbe2fe57404
00419 4585d2                         test       r10d, r10d
0041c 0f869a120000                   jbe        0x7fbe2fe5853c
00422 4d63da                         movsxd     r11, r10d
00425 4c63c3                         movsxd     r8, ebx
00428 49ffc8                         dec        r8
0042b 4d3bc3                         cmp        r8, r11
0042e 0f8388120000                   jae        0x7fbe2fe5853c
00434 4183fa01                       cmp        r10d, 1
00438 0f867e120000                   jbe        0x7fbe2fe5853c
0043e 448d5bff                       lea        r11d, [rbx - 1]
00442 4963d3                         movsxd     rdx, r11d
00445 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0044d 458bdb                         mov        r11d, r11d
00450 4183c3cc                       add        r11d, -0x34
00454 41c1eb02                       shr        r11d, 2
00458 418d7c1bff                     lea        edi, [r11 + rbx - 1]
0045d 4533db                         xor        r11d, r11d
00460 41b804000000                   mov        r8d, 4
00466 c462b8f5c7                     bzhi       r8, rdi, r8
0046b 492bd0                         sub        rdx, r8
0046e 4885d2                         test       rdx, rdx
00471 490f4cd3                       cmovl      rdx, r11
00475 8bd2                           mov        edx, edx
00477 90                             nop        
00478 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00480 458b449b04                     mov        r8d, dword ptr [r11 + rbx*4 + 4]
00485 4589449b08                     mov        dword ptr [r11 + rbx*4 + 8], r8d
0048a ffcb                           dec        ebx
0048c 3bda                           cmp        ebx, edx
0048e 7fe8                           jg         0x7fbe2fe572f8
00490 83fb3f                         cmp        ebx, 0x3f
00493 0f8ec5000000                   jle        0x7fbe2fe573de
00499 0f1f8000000000                 nop        dword ptr [rax]
004a0 8d53c1                         lea        edx, [rbx - 0x3f]
004a3 448d5bd0                       lea        r11d, [rbx - 0x30]
004a7 8d7bf1                         lea        edi, [rbx - 0xf]
004aa 8d43f0                         lea        eax, [rbx - 0x10]
004ad 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
004b5 62d17e486f848008000000         vmovdqu32  zmm0, zmmword ptr [r8 + rax*4 + 8]
004c0 62d17e487f84b808000000         vmovdqu32  zmmword ptr [r8 + rdi*4 + 8], zmm0
004cb 448d43e1                       lea        r8d, [rbx - 0x1f]
004cf 8d43e0                         lea        eax, [rbx - 0x20]
004d2 488bbc2488000000               mov        rdi, qword ptr [rsp + 0x88]
004da 62f17e486f848708000000         vmovdqu32  zmm0, zmmword ptr [rdi + rax*4 + 8]
004e5 62b17e487f848708000000         vmovdqu32  zmmword ptr [rdi + r8*4 + 8], zmm0
004f0 62b17e486f849f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11*4 + 8]
004fb 448d43d1                       lea        r8d, [rbx - 0x2f]
004ff 62b17e487f848708000000         vmovdqu32  zmmword ptr [rdi + r8*4 + 8], zmm0
0050a 83c3c0                         add        ebx, -0x40
0050d 62f17e486f849f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + rbx*4 + 8]
00518 62f17e487f849708000000         vmovdqu32  zmmword ptr [rdi + rdx*4 + 8], zmm0
00523 83fb3f                         cmp        ebx, 0x3f
00526 0f8f74ffffff                   jg         0x7fbe2fe57320
0052c 83fb0f                         cmp        ebx, 0xf
0052f 7e2d                           jle        0x7fbe2fe573de
00531 666690                         nop        
00534 448d5bf1                       lea        r11d, [rbx - 0xf]
00538 83c3f0                         add        ebx, -0x10
0053b 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00543 62d17e486f849808000000         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 + 8]
0054e 62917e487f849808000000         vmovdqu32  zmmword ptr [r8 + r11*4 + 8], zmm0
00559 83fb0f                         cmp        ebx, 0xf
0055c 7fd6                           jg         0x7fbe2fe573b4
0055e 85db                           test       ebx, ebx
00560 7e22                           jle        0x7fbe2fe57404
00562 6690                           nop        
00564 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0056c 458b5c9b04                     mov        r11d, dword ptr [r11 + rbx*4 + 4]
00571 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00579 45895c9808                     mov        dword ptr [r8 + rbx*4 + 8], r11d
0057e ffcb                           dec        ebx
00580 85db                           test       ebx, ebx
00582 7fe0                           jg         0x7fbe2fe573e4
00584 4585d2                         test       r10d, r10d
00587 0f8627100000                   jbe        0x7fbe2fe58434
0058d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00595 45896a08                       mov        dword ptr [r10 + 8], r13d
00599 eb79                           jmp        0x7fbe2fe57494
0059b 48bec8ffa5e200000000           movabs     rsi, 0xe2a5ffc8
005a5 418be9                         mov        ebp, r9d
005a8 c5f877                         vzeroupper 
005ab e83044aaff                     call       0x7fbe2f8fb860
005b0 0f1f8400a8060003               nop        dword ptr [rax + rax + 0x30006a8]
005b8 4885c0                         test       rax, rax
005bb 0f84db0f0000                   je         0x7fbe2fe5841c
005c1 488bf0                         mov        rsi, rax
005c4 c5f877                         vzeroupper 
005c7 4881c4d0000000                 add        rsp, 0xd0
005ce 5d                             pop        rbp
005cf e90cebb6ff                     jmp        0x7fbe2f9c5f60
005d4 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005dc 458b5204                       mov        r10d, dword ptr [r10 + 4]
005e0 83c3fd                         add        ebx, -3
005e3 4183fa02                       cmp        r10d, 2
005e7 0f86df0c0000                   jbe        0x7fbe2fe5814c
005ed 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005f5 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
005f9 45895a10                       mov        dword ptr [r10 + 0x10], r11d
005fd 458b5208                       mov        r10d, dword ptr [r10 + 8]
00601 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00609 4589530c                       mov        dword ptr [r11 + 0xc], r10d
0060d 41895b08                       mov        dword ptr [r11 + 8], ebx
00611 448beb                         mov        r13d, ebx
00614 4d63dd                         movsxd     r11, r13d
00617 4c6344240c                     movsxd     r8, dword ptr [rsp + 0xc]
0061c 4c03442458                     add        r8, qword ptr [rsp + 0x58]
00621 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00625 039c2490000000                 add        ebx, dword ptr [rsp + 0x90]
0062c 4863942490000000               movsxd     rdx, dword ptr [rsp + 0x90]
00634 4c03c2                         add        r8, rdx
00637 8beb                           mov        ebp, ebx
00639 412bed                         sub        ebp, r13d
0063c 4d3bd8                         cmp        r11, r8
0063f 7f25                           jg         0x7fbe2fe574e6
00641 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00646 4585d2                         test       r10d, r10d
00649 0f84a5060000                   je         0x7fbe2fe57b74
0064f 48894424f8                     mov        qword ptr [rsp - 8], rax
00654 8b442460                       mov        eax, dword ptr [rsp + 0x60]
00658 89442410                       mov        dword ptr [rsp + 0x10], eax
0065c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00661 4533d2                         xor        r10d, r10d
00664 eb18                           jmp        0x7fbe2fe574fe
00666 48894424f8                     mov        qword ptr [rsp - 8], rax
0066b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0066f 89442410                       mov        dword ptr [rsp + 0x10], eax
00673 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00678 41ba01000000                   mov        r10d, 1
0067e 4585ed                         test       r13d, r13d
00681 0f8e7d0b0000                   jle        0x7fbe2fe58084
00687 4585d2                         test       r10d, r10d
0068a 0f85e2040000                   jne        0x7fbe2fe579f2
00690 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00698 4403d3                         add        r10d, ebx
0069b 458bc1                         mov        r8d, r9d
0069e 4403842490000000               add        r8d, dword ptr [rsp + 0x90]
006a6 4489442420                     mov        dword ptr [rsp + 0x20], r8d
006ab 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
006b0 41ffc3                         inc        r11d
006b3 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
006b8 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
006c0 0f8f7a030000                   jg         0x7fbe2fe578c0
006c6 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
006ce 0f8f6c030000                   jg         0x7fbe2fe578c0
006d4 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
006dc 4183fb10                       cmp        r11d, 0x10
006e0 0f8fa9010000                   jg         0x7fbe2fe5770f
006e6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006eb 458b5204                       mov        r10d, dword ptr [r10 + 4]
006ef 418d6af1                       lea        ebp, [r10 - 0xf]
006f3 85ed                           test       ebp, ebp
006f5 0f8cfd110000                   jl         0x7fbe2fe58778
006fb 4183c2f1                       add        r10d, -0xf
006ff 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00707 453bca                         cmp        r9d, r10d
0070a 0f83a0100000                   jae        0x7fbe2fe58630
00710 458bd9                         mov        r11d, r9d
00713 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0071b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00720 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00727 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0072c 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00734 0f8316110000                   jae        0x7fbe2fe586d0
0073a 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00742 440394249c000000               add        r10d, dword ptr [rsp + 0x9c]
0074a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0074f 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00754 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00759 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00760 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00768 4503c2                         add        r8d, r10d
0076b 458bd8                         mov        r11d, r8d
0076e 452bdd                         sub        r11d, r13d
00771 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00779 4489442454                     mov        dword ptr [rsp + 0x54], r8d
0077e eb33                           jmp        0x7fbe2fe57633
00780 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00788 4d63d3                         movsxd     r10, r11d
0078b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00792 c442a8f5db                     bzhi       r11, r11, r10
00797 c4c1fb92fb                     kmovq      k7, r11
0079c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
007a2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
007a8 89ac249c000000                 mov        dword ptr [rsp + 0x9c], ebp
007af 895c2454                       mov        dword ptr [rsp + 0x54], ebx
007b3 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007bb 4183fb10                       cmp        r11d, 0x10
007bf 7f6e                           jg         0x7fbe2fe576af
007c1 4183fd10                       cmp        r13d, 0x10
007c5 7c68                           jl         0x7fbe2fe576af
007c7 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
007cf 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
007d7 0f8347160000                   jae        0x7fbe2fe58ca4
007dd 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
007e2 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
007e9 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
007ee 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
007f6 0f83b0160000                   jae        0x7fbe2fe58d2c
007fc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00801 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00808 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00810 4503d3                         add        r10d, r11d
00813 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00818 48894424f8                     mov        qword ptr [rsp - 8], rax
0081d 8b442418                       mov        eax, dword ptr [rsp + 0x18]
00821 89442424                       mov        dword ptr [rsp + 0x24], eax
00825 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0082a e9d6faffff                     jmp        0x7fbe2fe57185
0082f 453beb                         cmp        r13d, r11d
00832 0f8df4040000                   jge        0x7fbe2fe57bac
00838 4183fd10                       cmp        r13d, 0x10
0083c 0f8dc2060000                   jge        0x7fbe2fe57d84
00842 4183fd08                       cmp        r13d, 8
00846 0f8dd6060000                   jge        0x7fbe2fe57da2
0084c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00851 8b542454                       mov        edx, dword ptr [rsp + 0x54]
00855 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
0085c 458bc5                         mov        r8d, r13d
0085f 458bcb                         mov        r9d, r11d
00862 6690                           nop        
00864 c5f877                         vzeroupper 
00867 e87441aaff                     call       0x7fbe2f8fb860
0086c 0f1f840064090004               nop        dword ptr [rax + rax + 0x4000964]
00874 8944240c                       mov        dword ptr [rsp + 0xc], eax
00878 48894424f8                     mov        qword ptr [rsp - 8], rax
0087d 8b442418                       mov        eax, dword ptr [rsp + 0x18]
00881 89442424                       mov        dword ptr [rsp + 0x24], eax
00885 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0088a e976faffff                     jmp        0x7fbe2fe57185
0088f 4183fb30                       cmp        r11d, 0x30
00893 7e79                           jle        0x7fbe2fe5778e
00895 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0089a 458b5204                       mov        r10d, dword ptr [r10 + 4]
0089e 4585c9                         test       r9d, r9d
008a1 0f8ce5130000                   jl         0x7fbe2fe58b0c
008a7 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008ac 4585db                         test       r11d, r11d
008af 0f8cd7130000                   jl         0x7fbe2fe58b0c
008b5 453bd0                         cmp        r10d, r8d
008b8 0f82ce130000                   jb         0x7fbe2fe58b0c
008be 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
008c3 443bdb                         cmp        r11d, ebx
008c6 0f82c0130000                   jb         0x7fbe2fe58b0c
008cc 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
008d4 4585d2                         test       r10d, r10d
008d7 0f84cbfeffff                   je         0x7fbe2fe57628
008dd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
008e2 498d7c0a08                     lea        rdi, [r10 + rcx + 8]
008e7 4883fa20                       cmp        rdx, 0x20
008eb 0f868ffeffff                   jbe        0x7fbe2fe57600
008f1 c5f877                         vzeroupper 
008f4 49ba204f8e2fbe7f0000           movabs     r10, 0x7fbe2f8e4f20
008fe 41ffd2                         call       r10
00901 0f1f840000000000               nop        dword ptr [rax + rax]
00909 e99afeffff                     jmp        0x7fbe2fe57628
0090e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00913 458b5204                       mov        r10d, dword ptr [r10 + 4]
00917 418d6af1                       lea        ebp, [r10 - 0xf]
0091b 85ed                           test       ebp, ebp
0091d 0f8c2d140000                   jl         0x7fbe2fe58bd0
00923 458d5af1                       lea        r11d, [r10 - 0xf]
00927 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0092f 453bcb                         cmp        r9d, r11d
00932 0f83dc110000                   jae        0x7fbe2fe58994
00938 458bd1                         mov        r10d, r9d
0093b 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00943 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00948 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00950 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00957 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0095c 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00964 0f8366120000                   jae        0x7fbe2fe58a50
0096a 458bd0                         mov        r10d, r8d
0096d 458d5a10                       lea        r11d, [r10 + 0x10]
00971 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00979 be95ffffff                     mov        esi, 0xffffff95
0097e 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00982 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00987 c4c17a7f442a08                 vmovdqu    xmmword ptr [r10 + rbp + 8], xmm0
0098e 83c510                         add        ebp, 0x10
00991 48ff742428                     push       qword ptr [rsp + 0x28]
00996 488f442418                     pop        qword ptr [rsp + 0x18]
0099b 48ff742430                     push       qword ptr [rsp + 0x30]
009a0 488f442428                     pop        qword ptr [rsp + 0x28]
009a5 48894424f8                     mov        qword ptr [rsp - 8], rax
009aa 8b442438                       mov        eax, dword ptr [rsp + 0x38]
009ae 8944240c                       mov        dword ptr [rsp + 0xc], eax
009b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009b7 48ff742440                     push       qword ptr [rsp + 0x40]
009bc 488f442430                     pop        qword ptr [rsp + 0x30]
009c1 48ff742478                     push       qword ptr [rsp + 0x78]
009c6 488f442440                     pop        qword ptr [rsp + 0x40]
009cb 48894424f8                     mov        qword ptr [rsp - 8], rax
009d0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
009d4 89442414                       mov        dword ptr [rsp + 0x14], eax
009d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009dd 48894424f8                     mov        qword ptr [rsp - 8], rax
009e2 8b442450                       mov        eax, dword ptr [rsp + 0x50]
009e6 89442420                       mov        dword ptr [rsp + 0x20], eax
009ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009ef 48ff742458                     push       qword ptr [rsp + 0x58]
009f4 488f442450                     pop        qword ptr [rsp + 0x50]
009f9 48ff742468                     push       qword ptr [rsp + 0x68]
009fe 488f442458                     pop        qword ptr [rsp + 0x58]
00a03 48ff742470                     push       qword ptr [rsp + 0x70]
00a08 488f442460                     pop        qword ptr [rsp + 0x60]
00a0d 48894424f8                     mov        qword ptr [rsp - 8], rax
00a12 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
00a19 89442468                       mov        dword ptr [rsp + 0x68], eax
00a1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a22 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00a27 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
00a2e 6690                           nop        
00a30 c5f877                         vzeroupper 
00a33 e8a8bdb6ff                     call       0x7fbe2f9c3660
00a38 0f1f8400300b0005               nop        dword ptr [rax + rax + 0x5000b30]
00a40 418be9                         mov        ebp, r9d
00a43 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00a48 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a4c 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00a50 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00a55 8bbc2490000000                 mov        edi, dword ptr [rsp + 0x90]
00a5c 44892c24                       mov        dword ptr [rsp], r13d
00a60 48894424f8                     mov        qword ptr [rsp - 8], rax
00a65 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00a6c 89442408                       mov        dword ptr [rsp + 8], eax
00a70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a75 666690                         nop        
00a78 c5f877                         vzeroupper 
00a7b e8603faaff                     call       0x7fbe2f8fb860
00a80 0f1f8400780b0006               nop        dword ptr [rax + rax + 0x6000b78]
00a88 8944240c                       mov        dword ptr [rsp + 0xc], eax
00a8c 48894424f8                     mov        qword ptr [rsp - 8], rax
00a91 8b442418                       mov        eax, dword ptr [rsp + 0x18]
00a95 89442424                       mov        dword ptr [rsp + 0x24], eax
00a99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a9e 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00aa3 e969f8ffff                     jmp        0x7fbe2fe57191
00aa8 4d63d3                         movsxd     r10, r11d
00aab 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ab2 c442a8f5db                     bzhi       r11, r11, r10
00ab7 c4c1fb92fb                     kmovq      k7, r11
00abc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ac2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ac8 eb79                           jmp        0x7fbe2fe579c3
00aca 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00acf 458b5004                       mov        r10d, dword ptr [r8 + 4]
00ad3 4585c9                         test       r9d, r9d
00ad6 0f8cb40b0000                   jl         0x7fbe2fe58510
00adc 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00ae0 85db                           test       ebx, ebx
00ae2 0f8cac0b0000                   jl         0x7fbe2fe58514
00ae8 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
00aed 0f82a10b0000                   jb         0x7fbe2fe58514
00af3 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00af7 4103eb                         add        ebp, r11d
00afa 8b7c2414                       mov        edi, dword ptr [rsp + 0x14]
00afe 3bfd                           cmp        edi, ebp
00b00 0f828e0b0000                   jb         0x7fbe2fe58514
00b06 4585db                         test       r11d, r11d
00b09 0f8c850b0000                   jl         0x7fbe2fe58514
00b0f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b14 453bd1                         cmp        r10d, r9d
00b17 742a                           je         0x7fbe2fe579c3
00b19 498d7c0808                     lea        rdi, [r8 + rcx + 8]
00b1e 4963d3                         movsxd     rdx, r11d
00b21 4883fa20                       cmp        rdx, 0x20
00b25 0f867dffffff                   jbe        0x7fbe2fe57928
00b2b c5f877                         vzeroupper 
00b2e 49ba204f8e2fbe7f0000           movabs     r10, 0x7fbe2f8e4f20
00b38 41ffd2                         call       r10
00b3b 0f1f840000000000               nop        dword ptr [rax + rax]
00b43 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00b48 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00b4c c5f877                         vzeroupper 
00b4f 4881c4d0000000                 add        rsp, 0xd0
00b56 5d                             pop        rbp
00b57 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00b5b 0f87d3150000                   ja         0x7fbe2fe58fb4
00b61 c3                             ret        
00b62 4533d2                         xor        r10d, r10d
00b65 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00b6d e94bf8ffff                     jmp        0x7fbe2fe5723d
00b72 4d2bc3                         sub        r8, r11
00b75 4d85c0                         test       r8, r8
00b78 0f8d86060000                   jge        0x7fbe2fe58084
00b7e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00b83 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
00b87 4d85d2                         test       r10, r10
00b8a 0f8574060000                   jne        0x7fbe2fe58084
00b90 bd08000000                     mov        ebp, 8
00b95 be17000000                     mov        esi, 0x17
00b9a 44896c240c                     mov        dword ptr [rsp + 0xc], r13d
00b9f 90                             nop        
00ba0 c5f877                         vzeroupper 
00ba3 e838bcb6ff                     call       0x7fbe2f9c3660
00ba8 0f1f8400a00c0007               nop        dword ptr [rax + rax + 0x7000ca0]
00bb0 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bb8 458b5204                       mov        r10d, dword ptr [r10 + 4]
00bbc 4585d2                         test       r10d, r10d
00bbf 0f86c70d0000                   jbe        0x7fbe2fe5880c
00bc5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bcd 458b6a08                       mov        r13d, dword ptr [r10 + 8]
00bd1 e93efaffff                     jmp        0x7fbe2fe57494
00bd6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bde 458b5204                       mov        r10d, dword ptr [r10 + 4]
00be2 4183fa02                       cmp        r10d, 2
00be6 0f86500e0000                   jbe        0x7fbe2fe588bc
00bec 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bf4 458b6a08                       mov        r13d, dword ptr [r10 + 8]
00bf8 41ffcd                         dec        r13d
00bfb 4585ed                         test       r13d, r13d
00bfe 7e29                           jle        0x7fbe2fe57aa9
00c00 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00c04 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00c0c 45895310                       mov        dword ptr [r11 + 0x10], r10d
00c10 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00c14 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00c1c 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00c20 45896a08                       mov        dword ptr [r10 + 8], r13d
00c24 e9ebf9ffff                     jmp        0x7fbe2fe57494
00c29 48bef0ffa5e200000000           movabs     rsi, 0xe2a5fff0
00c33 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00c38 48ff742430                     push       qword ptr [rsp + 0x30]
00c3d 488f442410                     pop        qword ptr [rsp + 0x10]
00c42 48894424f8                     mov        qword ptr [rsp - 8], rax
00c47 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00c4b 89442418                       mov        dword ptr [rsp + 0x18], eax
00c4f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c54 48ff742440                     push       qword ptr [rsp + 0x40]
00c59 488f442428                     pop        qword ptr [rsp + 0x28]
00c5e 48894424f8                     mov        qword ptr [rsp - 8], rax
00c63 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00c67 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c70 48ff742448                     push       qword ptr [rsp + 0x48]
00c75 488f442440                     pop        qword ptr [rsp + 0x40]
00c7a 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c7f 48894424f8                     mov        qword ptr [rsp - 8], rax
00c84 8b442450                       mov        eax, dword ptr [rsp + 0x50]
00c88 89442448                       mov        dword ptr [rsp + 0x48], eax
00c8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c91 48ff742458                     push       qword ptr [rsp + 0x58]
00c96 488f442450                     pop        qword ptr [rsp + 0x50]
00c9b 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
00ca4 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00ca8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cad 48ff742468                     push       qword ptr [rsp + 0x68]
00cb2 488f442458                     pop        qword ptr [rsp + 0x58]
00cb7 48ff742470                     push       qword ptr [rsp + 0x70]
00cbc 488f442460                     pop        qword ptr [rsp + 0x60]
00cc1 666690                         nop        
00cc4 c5f877                         vzeroupper 
00cc7 e8143daaff                     call       0x7fbe2f8fb860
00ccc 0f1f8400c40d0008               nop        dword ptr [rax + rax + 0x8000dc4]
00cd4 4885c0                         test       rax, rax
00cd7 0f85e4f8ffff                   jne        0x7fbe2fe57441
00cdd bef6ffffff                     mov        esi, 0xfffffff6
00ce2 6690                           nop        
00ce4 c5f877                         vzeroupper 
00ce7 e8f4bab6ff                     call       0x7fbe2f9c3660
00cec 0f1f8400e40d0009               nop        dword ptr [rax + rax + 0x9000de4]
00cf4 4c63d5                         movsxd     r10, ebp
00cf7 4c3b542468                     cmp        r10, qword ptr [rsp + 0x68]
00cfc 7c21                           jl         0x7fbe2fe57b9f
00cfe 4c3b5c2470                     cmp        r11, qword ptr [rsp + 0x70]
00d03 7e0d                           jle        0x7fbe2fe57b92
00d05 4533d2                         xor        r10d, r10d
00d08 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d0d e966f9ffff                     jmp        0x7fbe2fe574f8
00d12 4533d2                         xor        r10d, r10d
00d15 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d1a e942f9ffff                     jmp        0x7fbe2fe574e1
00d1f 4533d2                         xor        r10d, r10d
00d22 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d27 e94cf9ffff                     jmp        0x7fbe2fe574f8
00d2c 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00d31 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
00d36 4503d3                         add        r10d, r11d
00d39 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d3e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00d46 4183fb30                       cmp        r11d, 0x30
00d4a 0f8ecd000000                   jle        0x7fbe2fe57c9d
00d50 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00d58 4585d2                         test       r10d, r10d
00d5b 0f8cdb110000                   jl         0x7fbe2fe58dbc
00d61 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
00d66 4585db                         test       r11d, r11d
00d69 0f8ccd110000                   jl         0x7fbe2fe58dbc
00d6f 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00d77 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
00d7f 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00d84 453bd3                         cmp        r10d, r11d
00d87 0f82af110000                   jb         0x7fbe2fe58dbc
00d8d 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00d92 0f82a4110000                   jb         0x7fbe2fe58dbc
00d98 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00da0 4585d2                         test       r10d, r10d
00da3 0f846ffaffff                   je         0x7fbe2fe57698
00da9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00dae 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00db6 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00dbb 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
00dc0 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00dc5 4863942494000000               movsxd     rdx, dword ptr [rsp + 0x94]
00dcd 4883fa20                       cmp        rdx, 0x20
00dd1 772d                           ja         0x7fbe2fe57c80
00dd3 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00ddb 4d63d3                         movsxd     r10, r11d
00dde 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00de5 c442a8f5db                     bzhi       r11, r11, r10
00dea c4c1fb92fb                     kmovq      k7, r11
00def 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00df5 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00dfb e918faffff                     jmp        0x7fbe2fe57698
00e00 c5f877                         vzeroupper 
00e03 49ba204f8e2fbe7f0000           movabs     r10, 0x7fbe2f8e4f20
00e0d 41ffd2                         call       r10
00e10 0f1f840000000000               nop        dword ptr [rax + rax]
00e18 e9fbf9ffff                     jmp        0x7fbe2fe57698
00e1d 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e22 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00e29 666690                         nop        
00e2c c5f877                         vzeroupper 
00e2f e8ac3baaff                     call       0x7fbe2f8fb860
00e34 0f1f84002c0f000a               nop        dword ptr [rax + rax + 0xa000f2c]
00e3c 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00e40 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e45 8b542454                       mov        edx, dword ptr [rsp + 0x54]
00e49 488bc8                         mov        rcx, rax
00e4c c5f877                         vzeroupper 
00e4f e88c3baaff                     call       0x7fbe2f8fb860
00e54 0f1f84004c0f000b               nop        dword ptr [rax + rax + 0xb000f4c]
00e5c 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00e61 458bd3                         mov        r10d, r11d
00e64 4403542454                     add        r10d, dword ptr [rsp + 0x54]
00e69 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00e71 be95ffffff                     mov        esi, 0xffffff95
00e76 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
00e7b 458bd3                         mov        r10d, r11d
00e7e 458d5a08                       lea        r11d, [r10 + 8]
00e82 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00e8a 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00e91 83c508                         add        ebp, 8
00e94 48ff742428                     push       qword ptr [rsp + 0x28]
00e99 488f442418                     pop        qword ptr [rsp + 0x18]
00e9e 48ff742430                     push       qword ptr [rsp + 0x30]
00ea3 488f442428                     pop        qword ptr [rsp + 0x28]
00ea8 48894424f8                     mov        qword ptr [rsp - 8], rax
00ead 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00eb1 8944240c                       mov        dword ptr [rsp + 0xc], eax
00eb5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eba 48ff742440                     push       qword ptr [rsp + 0x40]
00ebf 488f442430                     pop        qword ptr [rsp + 0x30]
00ec4 48ff742478                     push       qword ptr [rsp + 0x78]
00ec9 488f442440                     pop        qword ptr [rsp + 0x40]
00ece 48894424f8                     mov        qword ptr [rsp - 8], rax
00ed3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00ed7 89442414                       mov        dword ptr [rsp + 0x14], eax
00edb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ee0 48ff742468                     push       qword ptr [rsp + 0x68]
00ee5 488f442460                     pop        qword ptr [rsp + 0x60]
00eea 48ff742470                     push       qword ptr [rsp + 0x70]
00eef 488f442468                     pop        qword ptr [rsp + 0x68]
00ef4 c5f877                         vzeroupper 
00ef7 e8e4b8b6ff                     call       0x7fbe2f9c3660
00efc 0f1f8400f40f000c               nop        dword ptr [rax + rax + 0xc000ff4]
00f04 458bd3                         mov        r10d, r11d
00f07 4403542454                     add        r10d, dword ptr [rsp + 0x54]
00f0c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f11 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00f18 448b6c2454                     mov        r13d, dword ptr [rsp + 0x54]
00f1d e944f3ffff                     jmp        0x7fbe2fe570e6
00f22 44035c2454                     add        r11d, dword ptr [rsp + 0x54]
00f27 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f2f 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00f34 8b94249c000000                 mov        edx, dword ptr [rsp + 0x9c]
00f3b 90                             nop        
00f3c c5f877                         vzeroupper 
00f3f e89c3aaaff                     call       0x7fbe2f8fb860
00f44 0f1f84003c10000d               nop        dword ptr [rax + rax + 0xd00103c]
00f4c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00f51 8b542454                       mov        edx, dword ptr [rsp + 0x54]
00f55 488bc8                         mov        rcx, rax
00f58 c5f877                         vzeroupper 
00f5b e8803aaaff                     call       0x7fbe2f8fb860
00f60 0f1f84005810000e               nop        dword ptr [rax + rax + 0xe001058]
00f68 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00f70 458d5a08                       lea        r11d, [r10 + 8]
00f74 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00f7c be95ffffff                     mov        esi, 0xffffff95
00f81 8b6c2454                       mov        ebp, dword ptr [rsp + 0x54]
00f85 83c508                         add        ebp, 8
00f88 48ff742428                     push       qword ptr [rsp + 0x28]
00f8d 488f442418                     pop        qword ptr [rsp + 0x18]
00f92 48ff742430                     push       qword ptr [rsp + 0x30]
00f97 488f442428                     pop        qword ptr [rsp + 0x28]
00f9c 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00fa5 8944240c                       mov        dword ptr [rsp + 0xc], eax
00fa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fae 48ff742440                     push       qword ptr [rsp + 0x40]
00fb3 488f442430                     pop        qword ptr [rsp + 0x30]
00fb8 48894424f8                     mov        qword ptr [rsp - 8], rax
00fbd 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00fc1 89442414                       mov        dword ptr [rsp + 0x14], eax
00fc5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fca 48ff742468                     push       qword ptr [rsp + 0x68]
00fcf 488f442460                     pop        qword ptr [rsp + 0x60]
00fd4 48ff742470                     push       qword ptr [rsp + 0x70]
00fd9 488f442468                     pop        qword ptr [rsp + 0x68]
00fde 6690                           nop        
00fe0 c5f877                         vzeroupper 
00fe3 e8f8b7b6ff                     call       0x7fbe2f9c3660
00fe8 0f1f8400e010000f               nop        dword ptr [rax + rax + 0xf0010e0]
00ff0 bee4ffffff                     mov        esi, 0xffffffe4
00ff5 48ff742428                     push       qword ptr [rsp + 0x28]
00ffa 488f442410                     pop        qword ptr [rsp + 0x10]
00fff 48ff742430                     push       qword ptr [rsp + 0x30]
01004 488f442418                     pop        qword ptr [rsp + 0x18]
01009 48894424f8                     mov        qword ptr [rsp - 8], rax
0100e 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01012 89442428                       mov        dword ptr [rsp + 0x28], eax
01016 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0101b 48ff742440                     push       qword ptr [rsp + 0x40]
01020 488f442430                     pop        qword ptr [rsp + 0x30]
01025 48ff742478                     push       qword ptr [rsp + 0x78]
0102a 488f442440                     pop        qword ptr [rsp + 0x40]
0102f 48894424f8                     mov        qword ptr [rsp - 8], rax
01034 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01038 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0103c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01041 48ffb42488000000               push       qword ptr [rsp + 0x88]
01049 488f442438                     pop        qword ptr [rsp + 0x38]
0104e 48894424f8                     mov        qword ptr [rsp - 8], rax
01053 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01057 89442454                       mov        dword ptr [rsp + 0x54], eax
0105b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01060 48ff742468                     push       qword ptr [rsp + 0x68]
01065 488f442460                     pop        qword ptr [rsp + 0x60]
0106a 48ff742470                     push       qword ptr [rsp + 0x70]
0106f 488f442468                     pop        qword ptr [rsp + 0x68]
01074 48894424f8                     mov        qword ptr [rsp - 8], rax
01079 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01080 89442470                       mov        dword ptr [rsp + 0x70], eax
01084 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01089 48894424f8                     mov        qword ptr [rsp - 8], rax
0108e 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01095 89442474                       mov        dword ptr [rsp + 0x74], eax
01099 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109e 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
010a3 90                             nop        
010a4 c5f877                         vzeroupper 
010a7 e834b7b6ff                     call       0x7fbe2f9c3660
010ac 0f1f8400a4110010               nop        dword ptr [rax + rax + 0x100011a4]
010b4 c5fa7f442410                   vmovdqu    xmmword ptr [rsp + 0x10], xmm0
010ba bee4ffffff                     mov        esi, 0xffffffe4
010bf 48894424f8                     mov        qword ptr [rsp - 8], rax
010c4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
010c8 89442454                       mov        dword ptr [rsp + 0x54], eax
010cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d1 48ff742468                     push       qword ptr [rsp + 0x68]
010d6 488f442460                     pop        qword ptr [rsp + 0x60]
010db 48ff742470                     push       qword ptr [rsp + 0x70]
010e0 488f442468                     pop        qword ptr [rsp + 0x68]
010e5 48894424f8                     mov        qword ptr [rsp - 8], rax
010ea 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
010f1 89442470                       mov        dword ptr [rsp + 0x70], eax
010f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010fa 48894424f8                     mov        qword ptr [rsp - 8], rax
010ff 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01106 89442474                       mov        dword ptr [rsp + 0x74], eax
0110a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0110f 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
01117 90                             nop        
01118 c5f877                         vzeroupper 
0111b e8c0b6b6ff                     call       0x7fbe2f9c3660
01120 0f1f840018120011               nop        dword ptr [rax + rax + 0x11001218]
01128 4533d2                         xor        r10d, r10d
0112b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01130 e930f0ffff                     jmp        0x7fbe2fe56fe5
01135 4533d2                         xor        r10d, r10d
01138 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0113d e94df0ffff                     jmp        0x7fbe2fe5700f
01142 4533d2                         xor        r10d, r10d
01145 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0114a e972f0ffff                     jmp        0x7fbe2fe57041
0114f 4533d2                         xor        r10d, r10d
01152 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01157 e98ff0ffff                     jmp        0x7fbe2fe5706b
0115c 4533d2                         xor        r10d, r10d
0115f 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
01167 e9b4f0ffff                     jmp        0x7fbe2fe570a0
0116c bee4ffffff                     mov        esi, 0xffffffe4
01171 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01176 48ff742430                     push       qword ptr [rsp + 0x30]
0117b 488f442410                     pop        qword ptr [rsp + 0x10]
01180 48894424f8                     mov        qword ptr [rsp - 8], rax
01185 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01189 89442418                       mov        dword ptr [rsp + 0x18], eax
0118d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01192 48ff742478                     push       qword ptr [rsp + 0x78]
01197 488f442430                     pop        qword ptr [rsp + 0x30]
0119c 48894424f8                     mov        qword ptr [rsp - 8], rax
011a1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
011a5 8944241c                       mov        dword ptr [rsp + 0x1c], eax
011a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ae 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
011b3 48894424f8                     mov        qword ptr [rsp - 8], rax
011b8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
011bc 89442454                       mov        dword ptr [rsp + 0x54], eax
011c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011c5 48ff742468                     push       qword ptr [rsp + 0x68]
011ca 488f442460                     pop        qword ptr [rsp + 0x60]
011cf 48ff742470                     push       qword ptr [rsp + 0x70]
011d4 488f442468                     pop        qword ptr [rsp + 0x68]
011d9 666690                         nop        
011dc c5f877                         vzeroupper 
011df e8fcb5b6ff                     call       0x7fbe2f9c3660
011e4 0f1f8400dc120012               nop        dword ptr [rax + rax + 0x120012dc]
011ec be17000000                     mov        esi, 0x17
011f1 666690                         nop        
011f4 c5f877                         vzeroupper 
011f7 e8e4b5b6ff                     call       0x7fbe2f9c3660
011fc 0f1f8400f4120013               nop        dword ptr [rax + rax + 0x130012f4]
01204 bd02000000                     mov        ebp, 2
01209 e987f9ffff                     jmp        0x7fbe2fe57a15
0120e bee4ffffff                     mov        esi, 0xffffffe4
01213 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01218 48ff742430                     push       qword ptr [rsp + 0x30]
0121d 488f442410                     pop        qword ptr [rsp + 0x10]
01222 48894424f8                     mov        qword ptr [rsp - 8], rax
01227 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0122b 89442418                       mov        dword ptr [rsp + 0x18], eax
0122f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01234 48ff742440                     push       qword ptr [rsp + 0x40]
01239 488f442428                     pop        qword ptr [rsp + 0x28]
0123e 48894424f8                     mov        qword ptr [rsp - 8], rax
01243 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01247 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0124b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01250 48ff742448                     push       qword ptr [rsp + 0x48]
01255 488f442440                     pop        qword ptr [rsp + 0x40]
0125a 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0125f 48894424f8                     mov        qword ptr [rsp - 8], rax
01264 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01268 89442448                       mov        dword ptr [rsp + 0x48], eax
0126c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01271 48ff742458                     push       qword ptr [rsp + 0x58]
01276 488f442450                     pop        qword ptr [rsp + 0x50]
0127b 48894424f8                     mov        qword ptr [rsp - 8], rax
01280 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01284 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01288 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0128d 48ff742468                     push       qword ptr [rsp + 0x68]
01292 488f442458                     pop        qword ptr [rsp + 0x58]
01297 48ff742470                     push       qword ptr [rsp + 0x70]
0129c 488f442460                     pop        qword ptr [rsp + 0x60]
012a1 48894424f8                     mov        qword ptr [rsp - 8], rax
012a6 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
012ad 89442468                       mov        dword ptr [rsp + 0x68], eax
012b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b6 4489542470                     mov        dword ptr [rsp + 0x70], r10d
012bb 90                             nop        
012bc c5f877                         vzeroupper 
012bf e81cb5b6ff                     call       0x7fbe2f9c3660
012c4 0f1f8400bc130014               nop        dword ptr [rax + rax + 0x140013bc]
012cc bee4ffffff                     mov        esi, 0xffffffe4
012d1 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
012d6 48ff742430                     push       qword ptr [rsp + 0x30]
012db 488f442410                     pop        qword ptr [rsp + 0x10]
012e0 48894424f8                     mov        qword ptr [rsp - 8], rax
012e5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
012e9 89442418                       mov        dword ptr [rsp + 0x18], eax
012ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f2 48ff742440                     push       qword ptr [rsp + 0x40]
012f7 488f442428                     pop        qword ptr [rsp + 0x28]
012fc 48ff742478                     push       qword ptr [rsp + 0x78]
01301 488f442430                     pop        qword ptr [rsp + 0x30]
01306 48894424f8                     mov        qword ptr [rsp - 8], rax
0130b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0130f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01313 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01318 48ff742448                     push       qword ptr [rsp + 0x48]
0131d 488f442440                     pop        qword ptr [rsp + 0x40]
01322 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01327 48894424f8                     mov        qword ptr [rsp - 8], rax
0132c 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01330 89442448                       mov        dword ptr [rsp + 0x48], eax
01334 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01339 48ff742458                     push       qword ptr [rsp + 0x58]
0133e 488f442450                     pop        qword ptr [rsp + 0x50]
01343 48894424f8                     mov        qword ptr [rsp - 8], rax
01348 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0134c 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01350 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01355 48ff742468                     push       qword ptr [rsp + 0x68]
0135a 488f442458                     pop        qword ptr [rsp + 0x58]
0135f 48ff742470                     push       qword ptr [rsp + 0x70]
01364 488f442460                     pop        qword ptr [rsp + 0x60]
01369 48894424f8                     mov        qword ptr [rsp - 8], rax
0136e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01375 89442468                       mov        dword ptr [rsp + 0x68], eax
01379 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0137e 48894424f8                     mov        qword ptr [rsp - 8], rax
01383 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0138a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0138e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01393 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01397 90                             nop        
01398 c5f877                         vzeroupper 
0139b e840b4b6ff                     call       0x7fbe2f9c3660
013a0 0f1f840098140015               nop        dword ptr [rax + rax + 0x15001498]
013a8 c5fa7f442410                   vmovdqu    xmmword ptr [rsp + 0x10], xmm0
013ae e907fdffff                     jmp        0x7fbe2fe57f3a
013b3 be85ffffff                     mov        esi, 0xffffff85
013b8 48894424f8                     mov        qword ptr [rsp - 8], rax
013bd 8b442438                       mov        eax, dword ptr [rsp + 0x38]
013c1 89442410                       mov        dword ptr [rsp + 0x10], eax
013c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ca 48894424f8                     mov        qword ptr [rsp - 8], rax
013cf 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
013d3 89442414                       mov        dword ptr [rsp + 0x14], eax
013d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013dc 48894424f8                     mov        qword ptr [rsp - 8], rax
013e1 8b442420                       mov        eax, dword ptr [rsp + 0x20]
013e5 89442418                       mov        dword ptr [rsp + 0x18], eax
013e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ee 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
013f3 90                             nop        
013f4 c5f877                         vzeroupper 
013f7 e8e4b3b6ff                     call       0x7fbe2f9c3660
013fc 0f1f8400f4140016               nop        dword ptr [rax + rax + 0x160014f4]
01404 4533d2                         xor        r10d, r10d
01407 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0140f eb0d                           jmp        0x7fbe2fe5829e
01411 48ff742448                     push       qword ptr [rsp + 0x48]
01416 488f842490000000               pop        qword ptr [rsp + 0x90]
0141e be6effffff                     mov        esi, 0xffffff6e
01423 48ff742428                     push       qword ptr [rsp + 0x28]
01428 488f442410                     pop        qword ptr [rsp + 0x10]
0142d 48ff742430                     push       qword ptr [rsp + 0x30]
01432 488f442418                     pop        qword ptr [rsp + 0x18]
01437 48894424f8                     mov        qword ptr [rsp - 8], rax
0143c 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01440 89442428                       mov        dword ptr [rsp + 0x28], eax
01444 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01449 48ff742440                     push       qword ptr [rsp + 0x40]
0144e 488f442430                     pop        qword ptr [rsp + 0x30]
01453 48894424f8                     mov        qword ptr [rsp - 8], rax
01458 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0145c 8944242c                       mov        dword ptr [rsp + 0x2c], eax
01460 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01465 48894424f8                     mov        qword ptr [rsp - 8], rax
0146a 8b442450                       mov        eax, dword ptr [rsp + 0x50]
0146e 89442448                       mov        dword ptr [rsp + 0x48], eax
01472 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01477 48ff742458                     push       qword ptr [rsp + 0x58]
0147c 488f442450                     pop        qword ptr [rsp + 0x50]
01481 48894424f8                     mov        qword ptr [rsp - 8], rax
01486 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0148a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0148e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01493 48ff742468                     push       qword ptr [rsp + 0x68]
01498 488f442458                     pop        qword ptr [rsp + 0x58]
0149d 48ff742470                     push       qword ptr [rsp + 0x70]
014a2 488f442460                     pop        qword ptr [rsp + 0x60]
014a7 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
014ac c5f877                         vzeroupper 
014af e82cb3b6ff                     call       0x7fbe2f9c3660
014b4 0f1f8400ac150017               nop        dword ptr [rax + rax + 0x170015ac]
014bc bee4ffffff                     mov        esi, 0xffffffe4
014c1 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
014c6 48ff742430                     push       qword ptr [rsp + 0x30]
014cb 488f442410                     pop        qword ptr [rsp + 0x10]
014d0 48894424f8                     mov        qword ptr [rsp - 8], rax
014d5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
014d9 89442418                       mov        dword ptr [rsp + 0x18], eax
014dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e2 48ff742440                     push       qword ptr [rsp + 0x40]
014e7 488f442428                     pop        qword ptr [rsp + 0x28]
014ec 48ff742478                     push       qword ptr [rsp + 0x78]
014f1 488f442430                     pop        qword ptr [rsp + 0x30]
014f6 48894424f8                     mov        qword ptr [rsp - 8], rax
014fb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
014ff 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01503 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01508 48ff742448                     push       qword ptr [rsp + 0x48]
0150d 488f442440                     pop        qword ptr [rsp + 0x40]
01512 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01517 48894424f8                     mov        qword ptr [rsp - 8], rax
0151c 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01520 89442448                       mov        dword ptr [rsp + 0x48], eax
01524 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01529 48ff742458                     push       qword ptr [rsp + 0x58]
0152e 488f442450                     pop        qword ptr [rsp + 0x50]
01533 48894424f8                     mov        qword ptr [rsp - 8], rax
01538 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0153c 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01540 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01545 48ff742468                     push       qword ptr [rsp + 0x68]
0154a 488f442458                     pop        qword ptr [rsp + 0x58]
0154f 48ff742470                     push       qword ptr [rsp + 0x70]
01554 488f442460                     pop        qword ptr [rsp + 0x60]
01559 48894424f8                     mov        qword ptr [rsp - 8], rax
0155e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01565 89442468                       mov        dword ptr [rsp + 0x68], eax
01569 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156e 48894424f8                     mov        qword ptr [rsp - 8], rax
01573 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0157a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0157e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01583 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
0158a 6690                           nop        
0158c c5f877                         vzeroupper 
0158f e84cb2b6ff                     call       0x7fbe2f9c3660
01594 0f1f84008c160018               nop        dword ptr [rax + rax + 0x1800168c]
0159c bef6ffffff                     mov        esi, 0xfffffff6
015a1 666690                         nop        
015a4 c5f877                         vzeroupper 
015a7 e834b2b6ff                     call       0x7fbe2f9c3660
015ac 0f1f8400a4160019               nop        dword ptr [rax + rax + 0x190016a4]
015b4 bee4ffffff                     mov        esi, 0xffffffe4
015b9 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
015be 48ff742430                     push       qword ptr [rsp + 0x30]
015c3 488f442410                     pop        qword ptr [rsp + 0x10]
015c8 48894424f8                     mov        qword ptr [rsp - 8], rax
015cd 8b442438                       mov        eax, dword ptr [rsp + 0x38]
015d1 89442418                       mov        dword ptr [rsp + 0x18], eax
015d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015da 48ff742440                     push       qword ptr [rsp + 0x40]
015df 488f442428                     pop        qword ptr [rsp + 0x28]
015e4 48ff742478                     push       qword ptr [rsp + 0x78]
015e9 488f442430                     pop        qword ptr [rsp + 0x30]
015ee 48894424f8                     mov        qword ptr [rsp - 8], rax
015f3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015f7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
015fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01600 48ff742448                     push       qword ptr [rsp + 0x48]
01605 488f442440                     pop        qword ptr [rsp + 0x40]
0160a 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0160f 48894424f8                     mov        qword ptr [rsp - 8], rax
01614 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01618 89442448                       mov        dword ptr [rsp + 0x48], eax
0161c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01621 48ff742458                     push       qword ptr [rsp + 0x58]
01626 488f442450                     pop        qword ptr [rsp + 0x50]
0162b 48894424f8                     mov        qword ptr [rsp - 8], rax
01630 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01634 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01638 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163d 48ff742468                     push       qword ptr [rsp + 0x68]
01642 488f442458                     pop        qword ptr [rsp + 0x58]
01647 48ff742470                     push       qword ptr [rsp + 0x70]
0164c 488f442460                     pop        qword ptr [rsp + 0x60]
01651 48894424f8                     mov        qword ptr [rsp - 8], rax
01656 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0165d 89442468                       mov        dword ptr [rsp + 0x68], eax
01661 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01666 48894424f8                     mov        qword ptr [rsp - 8], rax
0166b 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01672 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01676 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167b 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01680 c5f877                         vzeroupper 
01683 e858b1b6ff                     call       0x7fbe2f9c3660
01688 0f1f84008017001a               nop        dword ptr [rax + rax + 0x1a001780]
01690 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
01694 beccffffff                     mov        esi, 0xffffffcc
01699 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0169e 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
016a3 895c2428                       mov        dword ptr [rsp + 0x28], ebx
016a7 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
016ac c5f877                         vzeroupper 
016af e82cb1b6ff                     call       0x7fbe2f9c3660
016b4 0f1f8400ac17001b               nop        dword ptr [rax + rax + 0x1b0017ac]
016bc be6effffff                     mov        esi, 0xffffff6e
016c1 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
016c6 48ff742430                     push       qword ptr [rsp + 0x30]
016cb 488f442410                     pop        qword ptr [rsp + 0x10]
016d0 48894424f8                     mov        qword ptr [rsp - 8], rax
016d5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
016d9 89442418                       mov        dword ptr [rsp + 0x18], eax
016dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e2 48ff742440                     push       qword ptr [rsp + 0x40]
016e7 488f442428                     pop        qword ptr [rsp + 0x28]
016ec 48ff742478                     push       qword ptr [rsp + 0x78]
016f1 488f442430                     pop        qword ptr [rsp + 0x30]
016f6 48894424f8                     mov        qword ptr [rsp - 8], rax
016fb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
016ff 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01703 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01708 48ff742448                     push       qword ptr [rsp + 0x48]
0170d 488f442440                     pop        qword ptr [rsp + 0x40]
01712 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01717 48894424f8                     mov        qword ptr [rsp - 8], rax
0171c 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01720 89442448                       mov        dword ptr [rsp + 0x48], eax
01724 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01729 48ff742458                     push       qword ptr [rsp + 0x58]
0172e 488f442450                     pop        qword ptr [rsp + 0x50]
01733 48894424f8                     mov        qword ptr [rsp - 8], rax
01738 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0173c 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01740 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01745 48ff742468                     push       qword ptr [rsp + 0x68]
0174a 488f442458                     pop        qword ptr [rsp + 0x58]
0174f 48ff742470                     push       qword ptr [rsp + 0x70]
01754 488f442460                     pop        qword ptr [rsp + 0x60]
01759 48894424f8                     mov        qword ptr [rsp - 8], rax
0175e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01765 89442468                       mov        dword ptr [rsp + 0x68], eax
01769 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176e 48894424f8                     mov        qword ptr [rsp - 8], rax
01773 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0177a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0177e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01783 48ffb42488000000               push       qword ptr [rsp + 0x88]
0178b 488f442478                     pop        qword ptr [rsp + 0x78]
01790 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01798 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0179f 90                             nop        
017a0 c5f877                         vzeroupper 
017a3 e838b0b6ff                     call       0x7fbe2f9c3660
017a8 0f1f8400a018001c               nop        dword ptr [rax + rax + 0x1c0018a0]
017b0 bee4ffffff                     mov        esi, 0xffffffe4
017b5 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
017ba 48894424f8                     mov        qword ptr [rsp - 8], rax
017bf 8b442438                       mov        eax, dword ptr [rsp + 0x38]
017c3 89442414                       mov        dword ptr [rsp + 0x14], eax
017c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cc 48ff742440                     push       qword ptr [rsp + 0x40]
017d1 488f442428                     pop        qword ptr [rsp + 0x28]
017d6 48ff742478                     push       qword ptr [rsp + 0x78]
017db 488f442440                     pop        qword ptr [rsp + 0x40]
017e0 48894424f8                     mov        qword ptr [rsp - 8], rax
017e5 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
017e9 89442420                       mov        dword ptr [rsp + 0x20], eax
017ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f2 48ff742468                     push       qword ptr [rsp + 0x68]
017f7 488f442460                     pop        qword ptr [rsp + 0x60]
017fc 48ff742470                     push       qword ptr [rsp + 0x70]
01801 488f442468                     pop        qword ptr [rsp + 0x68]
01806 48894424f8                     mov        qword ptr [rsp - 8], rax
0180b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01812 89442470                       mov        dword ptr [rsp + 0x70], eax
01816 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181b 48894424f8                     mov        qword ptr [rsp - 8], rax
01820 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01827 89442474                       mov        dword ptr [rsp + 0x74], eax
0182b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01830 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01838 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
01840 c5f877                         vzeroupper 
01843 e898afb6ff                     call       0x7fbe2f9c3660
01848 0f1f84004019001d               nop        dword ptr [rax + rax + 0x1d001940]
01850 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
01859 bee4ffffff                     mov        esi, 0xffffffe4
0185e 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01863 48ff742430                     push       qword ptr [rsp + 0x30]
01868 488f442418                     pop        qword ptr [rsp + 0x18]
0186d 48894424f8                     mov        qword ptr [rsp - 8], rax
01872 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01876 89442414                       mov        dword ptr [rsp + 0x14], eax
0187a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187f 48ff742440                     push       qword ptr [rsp + 0x40]
01884 488f442428                     pop        qword ptr [rsp + 0x28]
01889 48ff742478                     push       qword ptr [rsp + 0x78]
0188e 488f442430                     pop        qword ptr [rsp + 0x30]
01893 48894424f8                     mov        qword ptr [rsp - 8], rax
01898 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0189c 89442420                       mov        dword ptr [rsp + 0x20], eax
018a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a5 48ff742468                     push       qword ptr [rsp + 0x68]
018aa 488f442460                     pop        qword ptr [rsp + 0x60]
018af 48ff742470                     push       qword ptr [rsp + 0x70]
018b4 488f442468                     pop        qword ptr [rsp + 0x68]
018b9 48894424f8                     mov        qword ptr [rsp - 8], rax
018be 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
018c5 89442454                       mov        dword ptr [rsp + 0x54], eax
018c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ce 48894424f8                     mov        qword ptr [rsp - 8], rax
018d3 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
018da 89442470                       mov        dword ptr [rsp + 0x70], eax
018de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e3 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
018e8 c5f877                         vzeroupper 
018eb e8f0aeb6ff                     call       0x7fbe2f9c3660
018f0 0f1f8400e819001e               nop        dword ptr [rax + rax + 0x1e0019e8]
018f8 beccffffff                     mov        esi, 0xffffffcc
018fd 48ff742428                     push       qword ptr [rsp + 0x28]
01902 488f442418                     pop        qword ptr [rsp + 0x18]
01907 48894424f8                     mov        qword ptr [rsp - 8], rax
0190c 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01910 89442414                       mov        dword ptr [rsp + 0x14], eax
01914 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01919 48ff742478                     push       qword ptr [rsp + 0x78]
0191e 488f442460                     pop        qword ptr [rsp + 0x60]
01923 48894424f8                     mov        qword ptr [rsp - 8], rax
01928 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0192c 89442420                       mov        dword ptr [rsp + 0x20], eax
01930 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01935 48ffb42488000000               push       qword ptr [rsp + 0x88]
0193d 488f442438                     pop        qword ptr [rsp + 0x38]
01942 48894424f8                     mov        qword ptr [rsp - 8], rax
01947 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0194e 89442478                       mov        dword ptr [rsp + 0x78], eax
01952 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01957 48894424f8                     mov        qword ptr [rsp - 8], rax
0195c 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01963 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196c 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01974 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
0197c c5f877                         vzeroupper 
0197f e85caeb6ff                     call       0x7fbe2f9c3660
01984 0f1f84007c1a001f               nop        dword ptr [rax + rax + 0x1f001a7c]
0198c bee4ffffff                     mov        esi, 0xffffffe4
01991 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01996 48ff742430                     push       qword ptr [rsp + 0x30]
0199b 488f442410                     pop        qword ptr [rsp + 0x10]
019a0 48894424f8                     mov        qword ptr [rsp - 8], rax
019a5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
019a9 89442418                       mov        dword ptr [rsp + 0x18], eax
019ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b2 48ff742440                     push       qword ptr [rsp + 0x40]
019b7 488f442428                     pop        qword ptr [rsp + 0x28]
019bc 48ff742478                     push       qword ptr [rsp + 0x78]
019c1 488f442430                     pop        qword ptr [rsp + 0x30]
019c6 48894424f8                     mov        qword ptr [rsp - 8], rax
019cb 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
019cf 8944241c                       mov        dword ptr [rsp + 0x1c], eax
019d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d8 48ff742448                     push       qword ptr [rsp + 0x48]
019dd 488f442440                     pop        qword ptr [rsp + 0x40]
019e2 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
019e7 48894424f8                     mov        qword ptr [rsp - 8], rax
019ec 8b442450                       mov        eax, dword ptr [rsp + 0x50]
019f0 89442448                       mov        dword ptr [rsp + 0x48], eax
019f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f9 48ff742458                     push       qword ptr [rsp + 0x58]
019fe 488f442450                     pop        qword ptr [rsp + 0x50]
01a03 48894424f8                     mov        qword ptr [rsp - 8], rax
01a08 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a0c 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a15 48ff742468                     push       qword ptr [rsp + 0x68]
01a1a 488f442458                     pop        qword ptr [rsp + 0x58]
01a1f 48ff742470                     push       qword ptr [rsp + 0x70]
01a24 488f442460                     pop        qword ptr [rsp + 0x60]
01a29 666690                         nop        
01a2c c5f877                         vzeroupper 
01a2f e8acadb6ff                     call       0x7fbe2f9c3660
01a34 0f1f84002c1b0020               nop        dword ptr [rax + rax + 0x20001b2c]
01a3c bee4ffffff                     mov        esi, 0xffffffe4
01a41 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01a46 48ff742430                     push       qword ptr [rsp + 0x30]
01a4b 488f442410                     pop        qword ptr [rsp + 0x10]
01a50 48894424f8                     mov        qword ptr [rsp - 8], rax
01a55 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01a59 89442418                       mov        dword ptr [rsp + 0x18], eax
01a5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a62 48ff742440                     push       qword ptr [rsp + 0x40]
01a67 488f442428                     pop        qword ptr [rsp + 0x28]
01a6c 48ff742478                     push       qword ptr [rsp + 0x78]
01a71 488f442430                     pop        qword ptr [rsp + 0x30]
01a76 48894424f8                     mov        qword ptr [rsp - 8], rax
01a7b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01a7f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01a83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a88 48ff742448                     push       qword ptr [rsp + 0x48]
01a8d 488f442440                     pop        qword ptr [rsp + 0x40]
01a92 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01a97 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9c 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01aa0 89442448                       mov        dword ptr [rsp + 0x48], eax
01aa4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa9 48ff742458                     push       qword ptr [rsp + 0x58]
01aae 488f442450                     pop        qword ptr [rsp + 0x50]
01ab3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01abc 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ac0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac5 48ff742468                     push       qword ptr [rsp + 0x68]
01aca 488f442458                     pop        qword ptr [rsp + 0x58]
01acf 48ff742470                     push       qword ptr [rsp + 0x70]
01ad4 488f442460                     pop        qword ptr [rsp + 0x60]
01ad9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ade 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01ae5 89442468                       mov        dword ptr [rsp + 0x68], eax
01ae9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aee 48894424f8                     mov        qword ptr [rsp - 8], rax
01af3 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01afa 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01afe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b03 90                             nop        
01b04 c5f877                         vzeroupper 
01b07 e8d4acb6ff                     call       0x7fbe2f9c3660
01b0c 0f1f8400041c0021               nop        dword ptr [rax + rax + 0x21001c04]
01b14 bee4ffffff                     mov        esi, 0xffffffe4
01b19 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01b1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b23 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01b27 89442414                       mov        dword ptr [rsp + 0x14], eax
01b2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b30 48ff742440                     push       qword ptr [rsp + 0x40]
01b35 488f442428                     pop        qword ptr [rsp + 0x28]
01b3a 48ff742478                     push       qword ptr [rsp + 0x78]
01b3f 488f442440                     pop        qword ptr [rsp + 0x40]
01b44 48894424f8                     mov        qword ptr [rsp - 8], rax
01b49 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b4d 89442420                       mov        dword ptr [rsp + 0x20], eax
01b51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b56 48ffb42488000000               push       qword ptr [rsp + 0x88]
01b5e 488f442438                     pop        qword ptr [rsp + 0x38]
01b63 48ff742468                     push       qword ptr [rsp + 0x68]
01b68 488f442460                     pop        qword ptr [rsp + 0x60]
01b6d 48ff742470                     push       qword ptr [rsp + 0x70]
01b72 488f442468                     pop        qword ptr [rsp + 0x68]
01b77 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7c 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01b83 89442470                       mov        dword ptr [rsp + 0x70], eax
01b87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b91 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01b98 89442474                       mov        dword ptr [rsp + 0x74], eax
01b9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba1 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01ba9 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
01bb0 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01bb8 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01bc0 c5f877                         vzeroupper 
01bc3 e818acb6ff                     call       0x7fbe2f9c3660
01bc8 0f1f8400c01c0022               nop        dword ptr [rax + rax + 0x22001cc0]
01bd0 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
01bd9 bee4ffffff                     mov        esi, 0xffffffe4
01bde 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01be3 48ff742430                     push       qword ptr [rsp + 0x30]
01be8 488f442418                     pop        qword ptr [rsp + 0x18]
01bed 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf2 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01bf6 89442414                       mov        dword ptr [rsp + 0x14], eax
01bfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bff 48ff742440                     push       qword ptr [rsp + 0x40]
01c04 488f442428                     pop        qword ptr [rsp + 0x28]
01c09 48ff742478                     push       qword ptr [rsp + 0x78]
01c0e 488f442430                     pop        qword ptr [rsp + 0x30]
01c13 48894424f8                     mov        qword ptr [rsp - 8], rax
01c18 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c1c 89442420                       mov        dword ptr [rsp + 0x20], eax
01c20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c25 48ffb42488000000               push       qword ptr [rsp + 0x88]
01c2d 488f442438                     pop        qword ptr [rsp + 0x38]
01c32 48ff742468                     push       qword ptr [rsp + 0x68]
01c37 488f442460                     pop        qword ptr [rsp + 0x60]
01c3c 48ff742470                     push       qword ptr [rsp + 0x70]
01c41 488f442468                     pop        qword ptr [rsp + 0x68]
01c46 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01c52 89442454                       mov        dword ptr [rsp + 0x54], eax
01c56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c60 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01c67 89442470                       mov        dword ptr [rsp + 0x70], eax
01c6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c70 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01c75 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01c7c c5f877                         vzeroupper 
01c7f e85cabb6ff                     call       0x7fbe2f9c3660
01c84 0f1f84007c1d0023               nop        dword ptr [rax + rax + 0x23001d7c]
01c8c beccffffff                     mov        esi, 0xffffffcc
01c91 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01c96 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9b 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01c9f 89442414                       mov        dword ptr [rsp + 0x14], eax
01ca3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca8 48ff742440                     push       qword ptr [rsp + 0x40]
01cad 488f442428                     pop        qword ptr [rsp + 0x28]
01cb2 48ff742478                     push       qword ptr [rsp + 0x78]
01cb7 488f442440                     pop        qword ptr [rsp + 0x40]
01cbc 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01cc5 89442420                       mov        dword ptr [rsp + 0x20], eax
01cc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cce 48ffb42488000000               push       qword ptr [rsp + 0x88]
01cd6 488f442438                     pop        qword ptr [rsp + 0x38]
01cdb 48ff742468                     push       qword ptr [rsp + 0x68]
01ce0 488f442460                     pop        qword ptr [rsp + 0x60]
01ce5 48ff742470                     push       qword ptr [rsp + 0x70]
01cea 488f442468                     pop        qword ptr [rsp + 0x68]
01cef 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf4 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01cfb 89442470                       mov        dword ptr [rsp + 0x70], eax
01cff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d04 48894424f8                     mov        qword ptr [rsp - 8], rax
01d09 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01d10 89442474                       mov        dword ptr [rsp + 0x74], eax
01d14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d19 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1e 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01d25 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2e 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01d36 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
01d3e 6690                           nop        
01d40 c5f877                         vzeroupper 
01d43 e898aab6ff                     call       0x7fbe2f9c3660
01d48 0f1f8400401e0024               nop        dword ptr [rax + rax + 0x24001e40]
01d50 beccffffff                     mov        esi, 0xffffffcc
01d55 48ff742428                     push       qword ptr [rsp + 0x28]
01d5a 488f442418                     pop        qword ptr [rsp + 0x18]
01d5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d64 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01d68 89442414                       mov        dword ptr [rsp + 0x14], eax
01d6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d71 48ff742478                     push       qword ptr [rsp + 0x78]
01d76 488f442460                     pop        qword ptr [rsp + 0x60]
01d7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d80 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01d84 89442420                       mov        dword ptr [rsp + 0x20], eax
01d88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8d 48ffb42488000000               push       qword ptr [rsp + 0x88]
01d95 488f442438                     pop        qword ptr [rsp + 0x38]
01d9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9f 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01da6 89442478                       mov        dword ptr [rsp + 0x78], eax
01daa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daf 48894424f8                     mov        qword ptr [rsp - 8], rax
01db4 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01dbb 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01dbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc9 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01dd0 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01dd7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ddc 48894424f8                     mov        qword ptr [rsp - 8], rax
01de1 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01de8 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01def 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df4 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01dfc 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
01e03 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01e0b 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01e13 90                             nop        
01e14 c5f877                         vzeroupper 
01e17 e8c4a9b6ff                     call       0x7fbe2f9c3660
01e1c 0f1f8400141f0025               nop        dword ptr [rax + rax + 0x25001f14]
01e24 bee4ffffff                     mov        esi, 0xffffffe4
01e29 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01e2e 48ff742430                     push       qword ptr [rsp + 0x30]
01e33 488f442418                     pop        qword ptr [rsp + 0x18]
01e38 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01e41 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4a 48ff742440                     push       qword ptr [rsp + 0x40]
01e4f 488f442428                     pop        qword ptr [rsp + 0x28]
01e54 48ff742478                     push       qword ptr [rsp + 0x78]
01e59 488f442430                     pop        qword ptr [rsp + 0x30]
01e5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e63 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e67 89442414                       mov        dword ptr [rsp + 0x14], eax
01e6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e70 48ff742468                     push       qword ptr [rsp + 0x68]
01e75 488f442460                     pop        qword ptr [rsp + 0x60]
01e7a 48ff742470                     push       qword ptr [rsp + 0x70]
01e7f 488f442468                     pop        qword ptr [rsp + 0x68]
01e84 48894424f8                     mov        qword ptr [rsp - 8], rax
01e89 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01e90 89442470                       mov        dword ptr [rsp + 0x70], eax
01e94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e99 666690                         nop        
01e9c c5f877                         vzeroupper 
01e9f e83ca9b6ff                     call       0x7fbe2f9c3660
01ea4 0f1f84009c1f0026               nop        dword ptr [rax + rax + 0x26001f9c]
01eac c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
01eb5 bee4ffffff                     mov        esi, 0xffffffe4
01eba 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01ebf 48ff742430                     push       qword ptr [rsp + 0x30]
01ec4 488f442418                     pop        qword ptr [rsp + 0x18]
01ec9 48894424f8                     mov        qword ptr [rsp - 8], rax
01ece 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01ed2 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ed6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01edb 48ff742440                     push       qword ptr [rsp + 0x40]
01ee0 488f442428                     pop        qword ptr [rsp + 0x28]
01ee5 48ff742478                     push       qword ptr [rsp + 0x78]
01eea 488f442430                     pop        qword ptr [rsp + 0x30]
01eef 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01ef8 89442414                       mov        dword ptr [rsp + 0x14], eax
01efc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f01 48ff742468                     push       qword ptr [rsp + 0x68]
01f06 488f442460                     pop        qword ptr [rsp + 0x60]
01f0b 48ff742470                     push       qword ptr [rsp + 0x70]
01f10 488f442468                     pop        qword ptr [rsp + 0x68]
01f15 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01f21 89442470                       mov        dword ptr [rsp + 0x70], eax
01f25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2a 6690                           nop        
01f2c c5f877                         vzeroupper 
01f2f e8aca8b6ff                     call       0x7fbe2f9c3660
01f34 0f1f84002c200027               nop        dword ptr [rax + rax + 0x2700202c]
01f3c beccffffff                     mov        esi, 0xffffffcc
01f41 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01f46 48ff742430                     push       qword ptr [rsp + 0x30]
01f4b 488f442418                     pop        qword ptr [rsp + 0x18]
01f50 48894424f8                     mov        qword ptr [rsp - 8], rax
01f55 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01f59 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f5d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f62 48ff742440                     push       qword ptr [rsp + 0x40]
01f67 488f442428                     pop        qword ptr [rsp + 0x28]
01f6c 48ff742478                     push       qword ptr [rsp + 0x78]
01f71 488f442430                     pop        qword ptr [rsp + 0x30]
01f76 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f7f 89442414                       mov        dword ptr [rsp + 0x14], eax
01f83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f88 48ffb42488000000               push       qword ptr [rsp + 0x88]
01f90 488f442438                     pop        qword ptr [rsp + 0x38]
01f95 48ff742468                     push       qword ptr [rsp + 0x68]
01f9a 488f442460                     pop        qword ptr [rsp + 0x60]
01f9f 48ff742470                     push       qword ptr [rsp + 0x70]
01fa4 488f442468                     pop        qword ptr [rsp + 0x68]
01fa9 48894424f8                     mov        qword ptr [rsp - 8], rax
01fae 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01fb5 89442470                       mov        dword ptr [rsp + 0x70], eax
01fb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc3 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01fca 89442474                       mov        dword ptr [rsp + 0x74], eax
01fce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd8 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01fdf 89442478                       mov        dword ptr [rsp + 0x78], eax
01fe3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe8 c5f877                         vzeroupper 
01feb e8f0a7b6ff                     call       0x7fbe2f9c3660
01ff0 0f1f8400e8200028               nop        dword ptr [rax + rax + 0x280020e8]
01ff8 bef6ffffff                     mov        esi, 0xfffffff6
01ffd 666690                         nop        
02000 c5f877                         vzeroupper 
02003 e8d8a7b6ff                     call       0x7fbe2f9c3660
02008 0f1f840000210029               nop        dword ptr [rax + rax + 0x29002100]
02010 bef6ffffff                     mov        esi, 0xfffffff6
02015 666690                         nop        
02018 c5f877                         vzeroupper 
0201b e8c0a7b6ff                     call       0x7fbe2f9c3660
02020 0f1f84001821002a               nop        dword ptr [rax + rax + 0x2a002118]
02028 bef6ffffff                     mov        esi, 0xfffffff6
0202d 666690                         nop        
02030 c5f877                         vzeroupper 
02033 e8a8a7b6ff                     call       0x7fbe2f9c3660
02038 0f1f84003021002b               nop        dword ptr [rax + rax + 0x2b002130]
02040 bef6ffffff                     mov        esi, 0xfffffff6
02045 8beb                           mov        ebp, ebx
02047 90                             nop        
02048 c5f877                         vzeroupper 
0204b e890a7b6ff                     call       0x7fbe2f9c3660
02050 0f1f84004821002c               nop        dword ptr [rax + rax + 0x2c002148]
02058 bef6ffffff                     mov        esi, 0xfffffff6
0205d 418be9                         mov        ebp, r9d
02060 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02065 666690                         nop        
02068 c5f877                         vzeroupper 
0206b e870a7b6ff                     call       0x7fbe2f9c3660
02070 0f1f84006821002d               nop        dword ptr [rax + rax + 0x2d002168]
02078 bef6ffffff                     mov        esi, 0xfffffff6
0207d 666690                         nop        
02080 c5f877                         vzeroupper 
02083 e858a7b6ff                     call       0x7fbe2f9c3660
02088 0f1f84008021002e               nop        dword ptr [rax + rax + 0x2e002180]
02090 bef6ffffff                     mov        esi, 0xfffffff6
02095 666690                         nop        
02098 c5f877                         vzeroupper 
0209b e840a7b6ff                     call       0x7fbe2f9c3660
020a0 0f1f84009821002f               nop        dword ptr [rax + rax + 0x2f002198]
020a8 bef6ffffff                     mov        esi, 0xfffffff6
020ad 666690                         nop        
020b0 c5f877                         vzeroupper 
020b3 e828a7b6ff                     call       0x7fbe2f9c3660
020b8 0f1f8400b0210030               nop        dword ptr [rax + rax + 0x300021b0]
020c0 bef6ffffff                     mov        esi, 0xfffffff6
020c5 666690                         nop        
020c8 c5f877                         vzeroupper 
020cb e810a7b6ff                     call       0x7fbe2f9c3660
020d0 0f1f8400c8210031               nop        dword ptr [rax + rax + 0x310021c8]
020d8 eb0c                           jmp        0x7fbe2fe58f66
020da eb0a                           jmp        0x7fbe2fe58f66
020dc eb08                           jmp        0x7fbe2fe58f66
020de eb06                           jmp        0x7fbe2fe58f66
020e0 eb04                           jmp        0x7fbe2fe58f66
020e2 eb02                           jmp        0x7fbe2fe58f66
020e4 eb00                           jmp        0x7fbe2fe58f66
020e6 488bf0                         mov        rsi, rax
020e9 e9d6e4ffff                     jmp        0x7fbe2fe57444
020ee bef6ffffff                     mov        esi, 0xfffffff6
020f3 90                             nop        
020f4 c5f877                         vzeroupper 
020f7 e8e4a6b6ff                     call       0x7fbe2f9c3660
020fc 0f1f8400f4210032               nop        dword ptr [rax + rax + 0x320021f4]
02104 bef6ffffff                     mov        esi, 0xfffffff6
02109 418be9                         mov        ebp, r9d
0210c c5f877                         vzeroupper 
0210f e8cca6b6ff                     call       0x7fbe2f9c3660
02114 0f1f84000c220033               nop        dword ptr [rax + rax + 0x3300220c]
0211c bef6ffffff                     mov        esi, 0xfffffff6
02121 666690                         nop        
02124 c5f877                         vzeroupper 
02127 e8b4a6b6ff                     call       0x7fbe2f9c3660
0212c 0f1f840024220034               nop        dword ptr [rax + rax + 0x34002224]
02134 49bad779e52fbe7f0000           movabs     r10, 0x7fbe2fe579d7
0213e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02145 e9164faaff                     jmp        0x7fbe2f8fdee0
0214a e8d11aa9ff                     call       0x7fbe2f8eaaa0
0214f e9dadeffff                     jmp        0x7fbe2fe56eae
02154 f4                             hlt        
02155 f4                             hlt        
02156 f4                             hlt        
02157 f4                             hlt        
