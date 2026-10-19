00000 e87b342919                     call       0x7fea89100880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecc0000000                 sub        rsp, 0xc0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85c4220000                   jne        0x7fea6fe6f6f2
0002e 488b9e40010000                 mov        rbx, qword ptr [rsi + 0x140]
00035 4c8bb638010000                 mov        r14, qword ptr [rsi + 0x138]
0003c 8b2e                           mov        ebp, dword ptr [rsi]
0003e 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00045 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0004d 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00054 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0005c 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00063 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0006b 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00072 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0007a 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00081 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00086 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
0008d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00092 448b9ef0000000                 mov        r11d, dword ptr [rsi + 0xf0]
00099 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0009e 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
000aa 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
000b6 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000bd 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000c2 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000c9 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000ce 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d2 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000da 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000de 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
000e6 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
000ea 4489542424                     mov        dword ptr [rsp + 0x24], r10d
000ef 448b5e10                       mov        r11d, dword ptr [rsi + 0x10]
000f3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
000f8 448b6e08                       mov        r13d, dword ptr [rsi + 8]
000fc 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
00103 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00108 488bfe                         mov        rdi, rsi
0010b c5f877                         vzeroupper 
0010e 49ba40f81d89ea7f0000           movabs     r10, 0x7fea891df840
00118 41ffd2                         call       r10
0011b 0f1f840000000000               nop        dword ptr [rax + rax]
00123 4885db                         test       rbx, rbx
00126 0f847c100000                   je         0x7fea6fe6e5a8
0012c 448b5304                       mov        r10d, dword ptr [rbx + 4]
00130 41c1ea0a                       shr        r10d, 0xa
00134 4181fa0c080000                 cmp        r10d, 0x80c
0013b 0f85f2120000                   jne        0x7fea6fe6e833
00141 4c8bd3                         mov        r10, rbx
00144 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00149 4d85f6                         test       r14, r14
0014c 0f8463100000                   je         0x7fea6fe6e5b5
00152 458b5e04                       mov        r11d, dword ptr [r14 + 4]
00156 41c1eb0a                       shr        r11d, 0xa
0015a 4181fb05020000                 cmp        r11d, 0x205
00161 0f85cc120000                   jne        0x7fea6fe6e833
00167 4d8bd6                         mov        r10, r14
0016a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0016f 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00177 4d85d2                         test       r10, r10
0017a 0f8442100000                   je         0x7fea6fe6e5c2
00180 458b5204                       mov        r10d, dword ptr [r10 + 4]
00184 41c1ea0a                       shr        r10d, 0xa
00188 4181fa08020000                 cmp        r10d, 0x208
0018f 0f859e120000                   jne        0x7fea6fe6e833
00195 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0019d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
001a2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
001aa 4d85d2                         test       r10, r10
001ad 0f841c100000                   je         0x7fea6fe6e5cf
001b3 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001b7 41c1eb0a                       shr        r11d, 0xa
001bb 4181fb07020000                 cmp        r11d, 0x207
001c2 0f856b120000                   jne        0x7fea6fe6e833
001c8 4c89542478                     mov        qword ptr [rsp + 0x78], r10
001cd 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
001d5 4d85d2                         test       r10, r10
001d8 0f84fe0f0000                   je         0x7fea6fe6e5dc
001de 458b5204                       mov        r10d, dword ptr [r10 + 4]
001e2 41c1ea0a                       shr        r10d, 0xa
001e6 4181fa07020000                 cmp        r10d, 0x207
001ed 0f8540120000                   jne        0x7fea6fe6e833
001f3 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
001fb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
00203 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0020b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0020f 41c1eb0a                       shr        r11d, 0xa
00213 4181fb05020000                 cmp        r11d, 0x205
0021a 0f8513120000                   jne        0x7fea6fe6e833
00220 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00225 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00229 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0022e 458d53f1                       lea        r10d, [r11 - 0xf]
00232 4585d2                         test       r10d, r10d
00235 0f8c9a120000                   jl         0x7fea6fe6e8d5
0023b 458bd3                         mov        r10d, r11d
0023e 4183c2f1                       add        r10d, -0xf
00242 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
0024a 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00251 0f83190e0000                   jae        0x7fea6fe6e470
00257 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0025c c4c17a6f442a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xc]
00263 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
0026b 0f83b7110000                   jae        0x7fea6fe6e828
00271 83c510                         add        ebp, 0x10
00274 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00278 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0027d c4817a7f442b0c                 vmovdqu    xmmword ptr [r11 + r13 + 0xc], xmm0
00284 4183c510                       add        r13d, 0x10
00288 418502                         test       dword ptr [r10], eax
0028b 443b6c240c                     cmp        r13d, dword ptr [rsp + 0xc]
00290 7d56                           jge        0x7fea6fe6d6e8
00292 0f1f8000000000                 nop        dword ptr [rax]
00299 0f1f8000000000                 nop        dword ptr [rax]
002a0 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
002a7 0f83c30d0000                   jae        0x7fea6fe6e470
002ad 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
002b2 c4c17a6f442a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rbp + 0xc]
002b9 443bac2498000000               cmp        r13d, dword ptr [rsp + 0x98]
002c1 0f836d0e0000                   jae        0x7fea6fe6e534
002c7 83c510                         add        ebp, 0x10
002ca 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002ce 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
002d3 c4817a7f442b0c                 vmovdqu    xmmword ptr [r11 + r13 + 0xc], xmm0
002da 4183c510                       add        r13d, 0x10
002de 418502                         test       dword ptr [r10], eax
002e1 443b6c240c                     cmp        r13d, dword ptr [rsp + 0xc]
002e6 7cb8                           jl         0x7fea6fe6d6a0
002e8 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
002ed 41ffc3                         inc        r11d
002f0 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
002f5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002f9 418502                         test       dword ptr [r10], eax
002fc 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00301 4963c9                         movsxd     rcx, r9d
00304 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00309 452bd9                         sub        r11d, r9d
0030c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00311 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
00316 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
0031b 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
00320 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00325 0f8da7070000                   jge        0x7fea6fe6ded2
0032b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00330 458b5208                       mov        r10d, dword ptr [r10 + 8]
00334 453bc2                         cmp        r8d, r10d
00337 0f83af0e0000                   jae        0x7fea6fe6e5ec
0033d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00342 4f8b44c210                     mov        r8, qword ptr [r10 + r8*8 + 0x10]
00347 4d8bd0                         mov        r10, r8
0034a 49c1fa24                       sar        r10, 0x24
0034e 418bda                         mov        ebx, r10d
00351 458bd0                         mov        r10d, r8d
00354 49c1e812                       shr        r8, 0x12
00358 4181e2ffff0100                 and        r10d, 0x1ffff
0035f 418bf8                         mov        edi, r8d
00362 81e7ffff0300                   and        edi, 0x3ffff
00368 89bc2494000000                 mov        dword ptr [rsp + 0x94], edi
0036f 85db                           test       ebx, ebx
00371 7d20                           jge        0x7fea6fe6d793
00373 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00378 458b4008                       mov        r8d, dword ptr [r8 + 8]
0037c 8b5c2424                       mov        ebx, dword ptr [rsp + 0x24]
00380 413bd8                         cmp        ebx, r8d
00383 0f83050f0000                   jae        0x7fea6fe6e68e
00389 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0038e 418b5c980c                     mov        ebx, dword ptr [r8 + rbx*4 + 0xc]
00393 4585d2                         test       r10d, r10d
00396 0f84ce070000                   je         0x7fea6fe6df6a
0039c 453bd3                         cmp        r10d, r11d
0039f 0f8fc70e0000                   jg         0x7fea6fe6e66c
003a5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
003ad 83fb03                         cmp        ebx, 3
003b0 0f8f0e020000                   jg         0x7fea6fe6d9c4
003b6 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
003be 4585d2                         test       r10d, r10d
003c1 7402                           je         0x7fea6fe6d7c5
003c3 ffcb                           dec        ebx
003c5 85db                           test       ebx, ebx
003c7 0f84eb070000                   je         0x7fea6fe6dfb8
003cd 83fb03                         cmp        ebx, 3
003d0 0f8408080000                   je         0x7fea6fe6dfde
003d6 83fb02                         cmp        ebx, 2
003d9 0f87ac010000                   ja         0x7fea6fe6d98b
003df 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
003e7 458b5208                       mov        r10d, dword ptr [r10 + 8]
003eb 413bda                         cmp        ebx, r10d
003ee 0f8394110000                   jae        0x7fea6fe6e988
003f4 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
003fc 458b6c9b0c                     mov        r13d, dword ptr [r11 + rbx*4 + 0xc]
00401 85db                           test       ebx, ebx
00403 0f8e6b010000                   jle        0x7fea6fe6d974
00409 4585d2                         test       r10d, r10d
0040c 0f8676130000                   jbe        0x7fea6fe6eb88
00412 4d63da                         movsxd     r11, r10d
00415 4c63c3                         movsxd     r8, ebx
00418 49ffc8                         dec        r8
0041b 4d3bc3                         cmp        r8, r11
0041e 0f8364130000                   jae        0x7fea6fe6eb88
00424 4183fa01                       cmp        r10d, 1
00428 0f865a130000                   jbe        0x7fea6fe6eb88
0042e 448d5bff                       lea        r11d, [rbx - 1]
00432 4963d3                         movsxd     rdx, r11d
00435 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0043d 458bdb                         mov        r11d, r11d
00440 4183c3d0                       add        r11d, -0x30
00444 41c1eb02                       shr        r11d, 2
00448 418d7c1bff                     lea        edi, [r11 + rbx - 1]
0044d 4533db                         xor        r11d, r11d
00450 41b804000000                   mov        r8d, 4
00456 c462b8f5c7                     bzhi       r8, rdi, r8
0045b 492bd0                         sub        rdx, r8
0045e 4885d2                         test       rdx, rdx
00461 490f4cd3                       cmovl      rdx, r11
00465 8bd2                           mov        edx, edx
00467 90                             nop        
00468 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00470 458b449b08                     mov        r8d, dword ptr [r11 + rbx*4 + 8]
00475 4589449b0c                     mov        dword ptr [r11 + rbx*4 + 0xc], r8d
0047a ffcb                           dec        ebx
0047c 3bda                           cmp        ebx, edx
0047e 7fe8                           jg         0x7fea6fe6d868
00480 83fb3f                         cmp        ebx, 0x3f
00483 0f8ec5000000                   jle        0x7fea6fe6d94e
00489 0f1f8000000000                 nop        dword ptr [rax]
00490 8d53c1                         lea        edx, [rbx - 0x3f]
00493 448d5bd0                       lea        r11d, [rbx - 0x30]
00497 8d7bf1                         lea        edi, [rbx - 0xf]
0049a 8d43f0                         lea        eax, [rbx - 0x10]
0049d 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
004a5 62d17e486f84800c000000         vmovdqu32  zmm0, zmmword ptr [r8 + rax*4 + 0xc]
004b0 62d17e487f84b80c000000         vmovdqu32  zmmword ptr [r8 + rdi*4 + 0xc], zmm0
004bb 448d43e1                       lea        r8d, [rbx - 0x1f]
004bf 8d43e0                         lea        eax, [rbx - 0x20]
004c2 488bbc2488000000               mov        rdi, qword ptr [rsp + 0x88]
004ca 62f17e486f84870c000000         vmovdqu32  zmm0, zmmword ptr [rdi + rax*4 + 0xc]
004d5 62b17e487f84870c000000         vmovdqu32  zmmword ptr [rdi + r8*4 + 0xc], zmm0
004e0 62b17e486f849f0c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11*4 + 0xc]
004eb 448d43d1                       lea        r8d, [rbx - 0x2f]
004ef 62b17e487f84870c000000         vmovdqu32  zmmword ptr [rdi + r8*4 + 0xc], zmm0
004fa 83c3c0                         add        ebx, -0x40
004fd 62f17e486f849f0c000000         vmovdqu32  zmm0, zmmword ptr [rdi + rbx*4 + 0xc]
00508 62f17e487f84970c000000         vmovdqu32  zmmword ptr [rdi + rdx*4 + 0xc], zmm0
00513 83fb3f                         cmp        ebx, 0x3f
00516 0f8f74ffffff                   jg         0x7fea6fe6d890
0051c 83fb0f                         cmp        ebx, 0xf
0051f 7e2d                           jle        0x7fea6fe6d94e
00521 666690                         nop        
00524 448d5bf1                       lea        r11d, [rbx - 0xf]
00528 83c3f0                         add        ebx, -0x10
0052b 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00533 62d17e486f84980c000000         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 + 0xc]
0053e 62917e487f84980c000000         vmovdqu32  zmmword ptr [r8 + r11*4 + 0xc], zmm0
00549 83fb0f                         cmp        ebx, 0xf
0054c 7fd6                           jg         0x7fea6fe6d924
0054e 85db                           test       ebx, ebx
00550 7e22                           jle        0x7fea6fe6d974
00552 6690                           nop        
00554 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
0055c 458b5c9b08                     mov        r11d, dword ptr [r11 + rbx*4 + 8]
00561 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00569 45895c980c                     mov        dword ptr [r8 + rbx*4 + 0xc], r11d
0056e ffcb                           dec        ebx
00570 85db                           test       ebx, ebx
00572 7fe0                           jg         0x7fea6fe6d954
00574 4585d2                         test       r10d, r10d
00577 0f8603110000                   jbe        0x7fea6fe6ea80
0057d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00585 45896a0c                       mov        dword ptr [r10 + 0xc], r13d
00589 eb79                           jmp        0x7fea6fe6da04
0058b 48be0001cde200000000           movabs     rsi, 0xe2cd0100
00595 418be9                         mov        ebp, r9d
00598 c5f877                         vzeroupper 
0059b e8c02eaaff                     call       0x7fea6f910860
005a0 0f1f840098060003               nop        dword ptr [rax + rax + 0x3000698]
005a8 4885c0                         test       rax, rax
005ab 0f84b7100000                   je         0x7fea6fe6ea68
005b1 488bf0                         mov        rsi, rax
005b4 c5f877                         vzeroupper 
005b7 4881c4c0000000                 add        rsp, 0xc0
005be 5d                             pop        rbp
005bf e99cd2b6ff                     jmp        0x7fea6f9dac60
005c4 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005cc 458b5208                       mov        r10d, dword ptr [r10 + 8]
005d0 83c3fd                         add        ebx, -3
005d3 4183fa02                       cmp        r10d, 2
005d7 0f866f0d0000                   jbe        0x7fea6fe6e74c
005dd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
005e5 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
005e9 45895a14                       mov        dword ptr [r10 + 0x14], r11d
005ed 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
005f1 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
005f9 45895310                       mov        dword ptr [r11 + 0x10], r10d
005fd 41895b0c                       mov        dword ptr [r11 + 0xc], ebx
00601 448beb                         mov        r13d, ebx
00604 4d63dd                         movsxd     r11, r13d
00607 4c6344240c                     movsxd     r8, dword ptr [rsp + 0xc]
0060c 4c03442458                     add        r8, qword ptr [rsp + 0x58]
00611 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00615 039c2490000000                 add        ebx, dword ptr [rsp + 0x90]
0061c 4863942490000000               movsxd     rdx, dword ptr [rsp + 0x90]
00624 4c03c2                         add        r8, rdx
00627 8beb                           mov        ebp, ebx
00629 412bed                         sub        ebp, r13d
0062c 4d3bd8                         cmp        r11, r8
0062f 7f25                           jg         0x7fea6fe6da56
00631 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00636 4585d2                         test       r10d, r10d
00639 0f84bd060000                   je         0x7fea6fe6e0fc
0063f 48894424f8                     mov        qword ptr [rsp - 8], rax
00644 8b442460                       mov        eax, dword ptr [rsp + 0x60]
00648 89442410                       mov        dword ptr [rsp + 0x10], eax
0064c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00651 4533d2                         xor        r10d, r10d
00654 eb18                           jmp        0x7fea6fe6da6e
00656 48894424f8                     mov        qword ptr [rsp - 8], rax
0065b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0065f 89442410                       mov        dword ptr [rsp + 0x10], eax
00663 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00668 41ba01000000                   mov        r10d, 1
0066e 4585ed                         test       r13d, r13d
00671 0f8e0d0c0000                   jle        0x7fea6fe6e684
00677 4585d2                         test       r10d, r10d
0067a 0f85fa040000                   jne        0x7fea6fe6df7a
00680 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00688 4403d3                         add        r10d, ebx
0068b 458bc1                         mov        r8d, r9d
0068e 4403842490000000               add        r8d, dword ptr [rsp + 0x90]
00696 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0069b 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
006a0 41ffc3                         inc        r11d
006a3 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
006a8 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
006b0 0f8f92030000                   jg         0x7fea6fe6de48
006b6 443b842484000000               cmp        r8d, dword ptr [rsp + 0x84]
006be 0f8f84030000                   jg         0x7fea6fe6de48
006c4 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
006cc 4183fb10                       cmp        r11d, 0x10
006d0 0f8fb1010000                   jg         0x7fea6fe6dc87
006d6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
006db 458b5a08                       mov        r11d, dword ptr [r10 + 8]
006df 418d6bf1                       lea        ebp, [r11 - 0xf]
006e3 85ed                           test       ebp, ebp
006e5 0f8c49130000                   jl         0x7fea6fe6ee34
006eb 4183c3f1                       add        r11d, -0xf
006ef 453bcb                         cmp        r9d, r11d
006f2 0f8384110000                   jae        0x7fea6fe6ec7c
006f8 458bd1                         mov        r10d, r9d
006fb 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00700 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00707 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0070c 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00714 0f831a120000                   jae        0x7fea6fe6ed34
0071a 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00722 4503c2                         add        r8d, r10d
00725 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0072a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0072f 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00734 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0073b 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00743 4503c2                         add        r8d, r10d
00746 458bd8                         mov        r11d, r8d
00749 452bdd                         sub        r11d, r13d
0074c 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
00754 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
0075c eb2e                           jmp        0x7fea6fe6db8c
0075e 4d63d3                         movsxd     r10, r11d
00761 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00768 c442a8f5db                     bzhi       r11, r11, r10
0076d c4c1fb92fb                     kmovq      k7, r11
00772 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00778 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0077e 89ac24ac000000                 mov        dword ptr [rsp + 0xac], ebp
00785 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
0078c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00794 4183fa10                       cmp        r10d, 0x10
00798 7f75                           jg         0x7fea6fe6dc0f
0079a 4183fd10                       cmp        r13d, 0x10
0079e 7c6f                           jl         0x7fea6fe6dc0f
007a0 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
007a8 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
007b0 0f83ea170000                   jae        0x7fea6fe6f3a0
007b6 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
007be 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
007c3 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
007ca 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
007d2 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
007da 0f8348180000                   jae        0x7fea6fe6f428
007e0 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
007e7 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007ef 478d0413                       lea        r8d, [r11 + r10]
007f3 448944240c                     mov        dword ptr [rsp + 0xc], r8d
007f8 48894424f8                     mov        qword ptr [rsp - 8], rax
007fd 8b442418                       mov        eax, dword ptr [rsp + 0x18]
00801 89442424                       mov        dword ptr [rsp + 0x24], eax
00805 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0080a e9e6faffff                     jmp        0x7fea6fe6d6f5
0080f 453bea                         cmp        r13d, r10d
00812 0f8d1c050000                   jge        0x7fea6fe6e134
00818 4183fd10                       cmp        r13d, 0x10
0081c 0f8d36070000                   jge        0x7fea6fe6e358
00822 4183fd08                       cmp        r13d, 8
00826 0f8d50070000                   jge        0x7fea6fe6e37c
0082c 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00830 48894424f8                     mov        qword ptr [rsp - 8], rax
00835 8b442424                       mov        eax, dword ptr [rsp + 0x24]
00839 8944240c                       mov        dword ptr [rsp + 0xc], eax
0083d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00842 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00847 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
0084e 8b8c24ac000000                 mov        ecx, dword ptr [rsp + 0xac]
00855 458bc5                         mov        r8d, r13d
00858 458bca                         mov        r9d, r10d
0085b 90                             nop        
0085c c5f877                         vzeroupper 
0085f e8fc2baaff                     call       0x7fea6f910860
00864 0f1f84005c090004               nop        dword ptr [rax + rax + 0x400095c]
0086c 8944240c                       mov        dword ptr [rsp + 0xc], eax
00870 48894424f8                     mov        qword ptr [rsp - 8], rax
00875 8b442418                       mov        eax, dword ptr [rsp + 0x18]
00879 89442424                       mov        dword ptr [rsp + 0x24], eax
0087d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00882 e96efaffff                     jmp        0x7fea6fe6d6f5
00887 4183fb30                       cmp        r11d, 0x30
0088b 7e73                           jle        0x7fea6fe6dd00
0088d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00892 458b5208                       mov        r10d, dword ptr [r10 + 8]
00896 4585c9                         test       r9d, r9d
00899 0f8c69150000                   jl         0x7fea6fe6f208
0089f 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
008a4 4585c0                         test       r8d, r8d
008a7 0f8c5b150000                   jl         0x7fea6fe6f208
008ad 443b542420                     cmp        r10d, dword ptr [rsp + 0x20]
008b2 0f8250150000                   jb         0x7fea6fe6f208
008b8 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
008bd 443bd3                         cmp        r10d, ebx
008c0 0f8242150000                   jb         0x7fea6fe6f208
008c6 4585db                         test       r11d, r11d
008c9 0f84affeffff                   je         0x7fea6fe6db7e
008cf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
008d4 498d7c0a0c                     lea        rdi, [r10 + rcx + 0xc]
008d9 4883fa20                       cmp        rdx, 0x20
008dd 0f867bfeffff                   jbe        0x7fea6fe6db5e
008e3 c5f877                         vzeroupper 
008e6 49ba209f8f6fea7f0000           movabs     r10, 0x7fea6f8f9f20
008f0 41ffd2                         call       r10
008f3 0f1f840000000000               nop        dword ptr [rax + rax]
008fb e97efeffff                     jmp        0x7fea6fe6db7e
00900 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00905 458b5208                       mov        r10d, dword ptr [r10 + 8]
00909 418d6af1                       lea        ebp, [r10 - 0xf]
0090d 85ed                           test       ebp, ebp
0090f 0f8cb7150000                   jl         0x7fea6fe6f2cc
00915 458bda                         mov        r11d, r10d
00918 458d53f1                       lea        r10d, [r11 - 0xf]
0091c 453bca                         cmp        r9d, r10d
0091f 0f832b130000                   jae        0x7fea6fe6f050
00925 458bd9                         mov        r11d, r9d
00928 458bd3                         mov        r10d, r11d
0092b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00930 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00937 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0093c 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
00944 0f83e2130000                   jae        0x7fea6fe6f12c
0094a 458d5a10                       lea        r11d, [r10 + 0x10]
0094e 458bc3                         mov        r8d, r11d
00951 be95ffffff                     mov        esi, 0xffffff95
00956 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0095a 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0095f c4c17a7f442b0c                 vmovdqu    xmmword ptr [r11 + rbp + 0xc], xmm0
00966 83c510                         add        ebp, 0x10
00969 48ff742428                     push       qword ptr [rsp + 0x28]
0096e 488f442418                     pop        qword ptr [rsp + 0x18]
00973 48ff742430                     push       qword ptr [rsp + 0x30]
00978 488f442428                     pop        qword ptr [rsp + 0x28]
0097d 48894424f8                     mov        qword ptr [rsp - 8], rax
00982 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00986 8944240c                       mov        dword ptr [rsp + 0xc], eax
0098a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098f 48ff742440                     push       qword ptr [rsp + 0x40]
00994 488f442430                     pop        qword ptr [rsp + 0x30]
00999 48ff742478                     push       qword ptr [rsp + 0x78]
0099e 488f442440                     pop        qword ptr [rsp + 0x40]
009a3 48894424f8                     mov        qword ptr [rsp - 8], rax
009a8 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
009ac 89442414                       mov        dword ptr [rsp + 0x14], eax
009b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009b5 48ffb42488000000               push       qword ptr [rsp + 0x88]
009bd 488f442438                     pop        qword ptr [rsp + 0x38]
009c2 48894424f8                     mov        qword ptr [rsp - 8], rax
009c7 8b442450                       mov        eax, dword ptr [rsp + 0x50]
009cb 89442420                       mov        dword ptr [rsp + 0x20], eax
009cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009d4 48ff742458                     push       qword ptr [rsp + 0x58]
009d9 488f442450                     pop        qword ptr [rsp + 0x50]
009de 48ff742468                     push       qword ptr [rsp + 0x68]
009e3 488f442458                     pop        qword ptr [rsp + 0x58]
009e8 48ff742470                     push       qword ptr [rsp + 0x70]
009ed 488f442460                     pop        qword ptr [rsp + 0x60]
009f2 48894424f8                     mov        qword ptr [rsp - 8], rax
009f7 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
009fe 89442468                       mov        dword ptr [rsp + 0x68], eax
00a02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a07 48894424f8                     mov        qword ptr [rsp - 8], rax
00a0c 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
00a13 8944246c                       mov        dword ptr [rsp + 0x6c], eax
00a17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a1c 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00a21 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
00a28 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00a30 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
00a38 c5f877                         vzeroupper 
00a3b e8209fb6ff                     call       0x7fea6f9d7d60
00a40 0f1f8400380b0005               nop        dword ptr [rax + rax + 0x5000b38]
00a48 418be9                         mov        ebp, r9d
00a4b 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00a50 8b54240c                       mov        edx, dword ptr [rsp + 0xc]
00a54 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00a58 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00a5d 8bbc2490000000                 mov        edi, dword ptr [rsp + 0x90]
00a64 44892c24                       mov        dword ptr [rsp], r13d
00a68 48894424f8                     mov        qword ptr [rsp - 8], rax
00a6d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
00a74 89442408                       mov        dword ptr [rsp + 8], eax
00a78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00a7d 666690                         nop        
00a80 c5f877                         vzeroupper 
00a83 e8d829aaff                     call       0x7fea6f910860
00a88 0f1f8400800b0006               nop        dword ptr [rax + rax + 0x6000b80]
00a90 8944240c                       mov        dword ptr [rsp + 0xc], eax
00a94 48894424f8                     mov        qword ptr [rsp - 8], rax
00a99 8b442418                       mov        eax, dword ptr [rsp + 0x18]
00a9d 89442424                       mov        dword ptr [rsp + 0x24], eax
00aa1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00aa6 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00aab e951f8ffff                     jmp        0x7fea6fe6d701
00ab0 4d63d3                         movsxd     r10, r11d
00ab3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00aba c442a8f5db                     bzhi       r11, r11, r10
00abf c4c1fb92fb                     kmovq      k7, r11
00ac4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aca 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ad0 eb79                           jmp        0x7fea6fe6df4b
00ad2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ad7 458b4208                       mov        r8d, dword ptr [r10 + 8]
00adb 4585c9                         test       r9d, r9d
00ade 0f8c780c0000                   jl         0x7fea6fe6eb5c
00ae4 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
00ae8 85db                           test       ebx, ebx
00aea 0f8c700c0000                   jl         0x7fea6fe6eb60
00af0 443b442438                     cmp        r8d, dword ptr [rsp + 0x38]
00af5 0f82650c0000                   jb         0x7fea6fe6eb60
00afb 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00aff 4103eb                         add        ebp, r11d
00b02 8b7c2414                       mov        edi, dword ptr [rsp + 0x14]
00b06 3bfd                           cmp        edi, ebp
00b08 0f82520c0000                   jb         0x7fea6fe6eb60
00b0e 4585db                         test       r11d, r11d
00b11 0f8c490c0000                   jl         0x7fea6fe6eb60
00b17 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b1c 453bc1                         cmp        r8d, r9d
00b1f 742a                           je         0x7fea6fe6df4b
00b21 498d7c0a0c                     lea        rdi, [r10 + rcx + 0xc]
00b26 4963d3                         movsxd     rdx, r11d
00b29 4883fa20                       cmp        rdx, 0x20
00b2d 0f867dffffff                   jbe        0x7fea6fe6deb0
00b33 c5f877                         vzeroupper 
00b36 49ba209f8f6fea7f0000           movabs     r10, 0x7fea6f8f9f20
00b40 41ffd2                         call       r10
00b43 0f1f840000000000               nop        dword ptr [rax + rax]
00b4b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00b50 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00b54 c5f877                         vzeroupper 
00b57 4881c4c0000000                 add        rsp, 0xc0
00b5e 5d                             pop        rbp
00b5f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00b63 0f8773170000                   ja         0x7fea6fe6f6dc
00b69 c3                             ret        
00b6a 4533d2                         xor        r10d, r10d
00b6d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00b75 e933f8ffff                     jmp        0x7fea6fe6d7ad
00b7a 4d2bc3                         sub        r8, r11
00b7d 4d85c0                         test       r8, r8
00b80 0f8dfe060000                   jge        0x7fea6fe6e684
00b86 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00b8b 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
00b8f 4d85d2                         test       r10, r10
00b92 0f85ec060000                   jne        0x7fea6fe6e684
00b98 bd08000000                     mov        ebp, 8
00b9d be17000000                     mov        esi, 0x17
00ba2 44896c240c                     mov        dword ptr [rsp + 0xc], r13d
00ba7 90                             nop        
00ba8 c5f877                         vzeroupper 
00bab e8b09db6ff                     call       0x7fea6f9d7d60
00bb0 0f1f8400a80c0007               nop        dword ptr [rax + rax + 0x7000ca8]
00bb8 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bc0 458b5208                       mov        r10d, dword ptr [r10 + 8]
00bc4 4585d2                         test       r10d, r10d
00bc7 0f86fb0e0000                   jbe        0x7fea6fe6eec8
00bcd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bd5 458b6a0c                       mov        r13d, dword ptr [r10 + 0xc]
00bd9 e926faffff                     jmp        0x7fea6fe6da04
00bde 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00be6 458b5208                       mov        r10d, dword ptr [r10 + 8]
00bea 4183fa02                       cmp        r10d, 2
00bee 0f86840f0000                   jbe        0x7fea6fe6ef78
00bf4 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00bfc 458b6a0c                       mov        r13d, dword ptr [r10 + 0xc]
00c00 41ffcd                         dec        r13d
00c03 4585ed                         test       r13d, r13d
00c06 7e29                           jle        0x7fea6fe6e031
00c08 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
00c0c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00c14 45895314                       mov        dword ptr [r11 + 0x14], r10d
00c18 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00c1c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00c24 45895a10                       mov        dword ptr [r10 + 0x10], r11d
00c28 45896a0c                       mov        dword ptr [r10 + 0xc], r13d
00c2c e9d3f9ffff                     jmp        0x7fea6fe6da04
00c31 48be3801cde200000000           movabs     rsi, 0xe2cd0138
00c3b 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
00c40 48ff742430                     push       qword ptr [rsp + 0x30]
00c45 488f442410                     pop        qword ptr [rsp + 0x10]
00c4a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c4f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00c53 89442418                       mov        dword ptr [rsp + 0x18], eax
00c57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c5c 48ff742440                     push       qword ptr [rsp + 0x40]
00c61 488f442428                     pop        qword ptr [rsp + 0x28]
00c66 48894424f8                     mov        qword ptr [rsp - 8], rax
00c6b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00c6f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00c73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c78 48ff742448                     push       qword ptr [rsp + 0x48]
00c7d 488f442440                     pop        qword ptr [rsp + 0x40]
00c82 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c87 48894424f8                     mov        qword ptr [rsp - 8], rax
00c8c 8b442450                       mov        eax, dword ptr [rsp + 0x50]
00c90 89442448                       mov        dword ptr [rsp + 0x48], eax
00c94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c99 48ff742458                     push       qword ptr [rsp + 0x58]
00c9e 488f442450                     pop        qword ptr [rsp + 0x50]
00ca3 48894424f8                     mov        qword ptr [rsp - 8], rax
00ca8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
00cac 8944244c                       mov        dword ptr [rsp + 0x4c], eax
00cb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00cb5 48ff742468                     push       qword ptr [rsp + 0x68]
00cba 488f442458                     pop        qword ptr [rsp + 0x58]
00cbf 48ff742470                     push       qword ptr [rsp + 0x70]
00cc4 488f442460                     pop        qword ptr [rsp + 0x60]
00cc9 666690                         nop        
00ccc c5f877                         vzeroupper 
00ccf e88c27aaff                     call       0x7fea6f910860
00cd4 0f1f8400cc0d0008               nop        dword ptr [rax + rax + 0x8000dcc]
00cdc 4885c0                         test       rax, rax
00cdf 0f85ccf8ffff                   jne        0x7fea6fe6d9b1
00ce5 bef6ffffff                     mov        esi, 0xfffffff6
00cea 6690                           nop        
00cec c5f877                         vzeroupper 
00cef e86c9cb6ff                     call       0x7fea6f9d7d60
00cf4 0f1f8400ec0d0009               nop        dword ptr [rax + rax + 0x9000dec]
00cfc 4c63d5                         movsxd     r10, ebp
00cff 4c3b542468                     cmp        r10, qword ptr [rsp + 0x68]
00d04 7c21                           jl         0x7fea6fe6e127
00d06 4c3b5c2470                     cmp        r11, qword ptr [rsp + 0x70]
00d0b 7e0d                           jle        0x7fea6fe6e11a
00d0d 4533d2                         xor        r10d, r10d
00d10 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d15 e94ef9ffff                     jmp        0x7fea6fe6da68
00d1a 4533d2                         xor        r10d, r10d
00d1d 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d22 e92af9ffff                     jmp        0x7fea6fe6da51
00d27 4533d2                         xor        r10d, r10d
00d2a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d2f e934f9ffff                     jmp        0x7fea6fe6da68
00d34 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00d39 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00d41 4503da                         add        r11d, r10d
00d44 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d49 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00d51 4183fa30                       cmp        r10d, 0x30
00d55 0f8ed3000000                   jle        0x7fea6fe6e22e
00d5b 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00d63 4585db                         test       r11d, r11d
00d66 0f8c78130000                   jl         0x7fea6fe6f4e4
00d6c 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00d74 4585d2                         test       r10d, r10d
00d77 0f8c67130000                   jl         0x7fea6fe6f4e4
00d7d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00d85 44039424ac000000               add        r10d, dword ptr [rsp + 0xac]
00d8d 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00d92 453bc2                         cmp        r8d, r10d
00d95 0f8249130000                   jb         0x7fea6fe6f4e4
00d9b 443b44240c                     cmp        r8d, dword ptr [rsp + 0xc]
00da0 0f823e130000                   jb         0x7fea6fe6f4e4
00da6 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00dae 4585db                         test       r11d, r11d
00db1 0f8441faffff                   je         0x7fea6fe6dbf8
00db7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00dbc 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00dc4 4b8d7c1a0c                     lea        rdi, [r10 + r11 + 0xc]
00dc9 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00dd1 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
00dd6 4863942494000000               movsxd     rdx, dword ptr [rsp + 0x94]
00dde 4883fa20                       cmp        rdx, 0x20
00de2 772d                           ja         0x7fea6fe6e211
00de4 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00dec 4d63d2                         movsxd     r10, r10d
00def 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00df6 c442a8f5db                     bzhi       r11, r11, r10
00dfb c4c1fb92fb                     kmovq      k7, r11
00e00 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e06 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e0c e9e7f9ffff                     jmp        0x7fea6fe6dbf8
00e11 c5f877                         vzeroupper 
00e14 49ba209f8f6fea7f0000           movabs     r10, 0x7fea6f8f9f20
00e1e 41ffd2                         call       r10
00e21 0f1f840000000000               nop        dword ptr [rax + rax]
00e29 e9caf9ffff                     jmp        0x7fea6fe6dbf8
00e2e 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e33 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
00e3a 6690                           nop        
00e3c c5f877                         vzeroupper 
00e3f e81c26aaff                     call       0x7fea6f910860
00e44 0f1f84003c0f000a               nop        dword ptr [rax + rax + 0xa000f3c]
00e4c 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00e50 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00e55 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
00e5c 488bc8                         mov        rcx, rax
00e5f 90                             nop        
00e60 c5f877                         vzeroupper 
00e63 e8f825aaff                     call       0x7fea6f910860
00e68 0f1f8400600f000b               nop        dword ptr [rax + rax + 0xb000f60]
00e70 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00e75 458bda                         mov        r11d, r10d
00e78 44039c24a8000000               add        r11d, dword ptr [rsp + 0xa8]
00e80 458bd3                         mov        r10d, r11d
00e83 be95ffffff                     mov        esi, 0xffffff95
00e88 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00e90 458bc3                         mov        r8d, r11d
00e93 458d5808                       lea        r11d, [r8 + 8]
00e97 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
00e9e 83c508                         add        ebp, 8
00ea1 48ff742428                     push       qword ptr [rsp + 0x28]
00ea6 488f442418                     pop        qword ptr [rsp + 0x18]
00eab 48ff742430                     push       qword ptr [rsp + 0x30]
00eb0 488f442428                     pop        qword ptr [rsp + 0x28]
00eb5 48894424f8                     mov        qword ptr [rsp - 8], rax
00eba 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00ebe 8944240c                       mov        dword ptr [rsp + 0xc], eax
00ec2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ec7 48ff742440                     push       qword ptr [rsp + 0x40]
00ecc 488f442430                     pop        qword ptr [rsp + 0x30]
00ed1 48ff742478                     push       qword ptr [rsp + 0x78]
00ed6 488f442440                     pop        qword ptr [rsp + 0x40]
00edb 48894424f8                     mov        qword ptr [rsp - 8], rax
00ee0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
00ee4 89442414                       mov        dword ptr [rsp + 0x14], eax
00ee8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eed 48ffb42488000000               push       qword ptr [rsp + 0x88]
00ef5 488f442438                     pop        qword ptr [rsp + 0x38]
00efa 48ff742468                     push       qword ptr [rsp + 0x68]
00eff 488f442460                     pop        qword ptr [rsp + 0x60]
00f04 48ff742470                     push       qword ptr [rsp + 0x70]
00f09 488f442468                     pop        qword ptr [rsp + 0x68]
00f0e 48894424f8                     mov        qword ptr [rsp - 8], rax
00f13 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
00f1a 89442470                       mov        dword ptr [rsp + 0x70], eax
00f1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f23 48894424f8                     mov        qword ptr [rsp - 8], rax
00f28 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
00f2f 89442474                       mov        dword ptr [rsp + 0x74], eax
00f33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f38 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00f40 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00f48 c5f877                         vzeroupper 
00f4b e8109ab6ff                     call       0x7fea6f9d7d60
00f50 0f1f84004810000c               nop        dword ptr [rax + rax + 0xc001048]
00f58 458bda                         mov        r11d, r10d
00f5b 44039c24a8000000               add        r11d, dword ptr [rsp + 0xa8]
00f63 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f68 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
00f6f 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00f77 e9cef2ffff                     jmp        0x7fea6fe6d64a
00f7c 44039424a8000000               add        r10d, dword ptr [rsp + 0xa8]
00f84 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00f8c 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00f91 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
00f98 c5f877                         vzeroupper 
00f9b e8c024aaff                     call       0x7fea6f910860
00fa0 0f1f84009810000d               nop        dword ptr [rax + rax + 0xd001098]
00fa8 488b742448                     mov        rsi, qword ptr [rsp + 0x48]
00fad 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
00fb4 488bc8                         mov        rcx, rax
00fb7 90                             nop        
00fb8 c5f877                         vzeroupper 
00fbb e8a024aaff                     call       0x7fea6f910860
00fc0 0f1f8400b810000e               nop        dword ptr [rax + rax + 0xe0010b8]
00fc8 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00fd0 458d5308                       lea        r10d, [r11 + 8]
00fd4 be95ffffff                     mov        esi, 0xffffff95
00fd9 8bac24a8000000                 mov        ebp, dword ptr [rsp + 0xa8]
00fe0 83c508                         add        ebp, 8
00fe3 48ff742428                     push       qword ptr [rsp + 0x28]
00fe8 488f442418                     pop        qword ptr [rsp + 0x18]
00fed 48ff742430                     push       qword ptr [rsp + 0x30]
00ff2 488f442428                     pop        qword ptr [rsp + 0x28]
00ff7 48894424f8                     mov        qword ptr [rsp - 8], rax
00ffc 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01000 8944240c                       mov        dword ptr [rsp + 0xc], eax
01004 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01009 48ff742440                     push       qword ptr [rsp + 0x40]
0100e 488f442430                     pop        qword ptr [rsp + 0x30]
01013 48ff742478                     push       qword ptr [rsp + 0x78]
01018 488f442440                     pop        qword ptr [rsp + 0x40]
0101d 48894424f8                     mov        qword ptr [rsp - 8], rax
01022 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01026 89442414                       mov        dword ptr [rsp + 0x14], eax
0102a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0102f 48ff742468                     push       qword ptr [rsp + 0x68]
01034 488f442460                     pop        qword ptr [rsp + 0x60]
01039 48ff742470                     push       qword ptr [rsp + 0x70]
0103e 488f442468                     pop        qword ptr [rsp + 0x68]
01043 48894424f8                     mov        qword ptr [rsp - 8], rax
01048 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
0104f 89442474                       mov        dword ptr [rsp + 0x74], eax
01053 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01058 4489542478                     mov        dword ptr [rsp + 0x78], r10d
0105d 666690                         nop        
01060 c5f877                         vzeroupper 
01063 e8f898b6ff                     call       0x7fea6f9d7d60
01068 0f1f84006011000f               nop        dword ptr [rax + rax + 0xf001160]
01070 bee4ffffff                     mov        esi, 0xffffffe4
01075 48ff742428                     push       qword ptr [rsp + 0x28]
0107a 488f442410                     pop        qword ptr [rsp + 0x10]
0107f 48ff742430                     push       qword ptr [rsp + 0x30]
01084 488f442418                     pop        qword ptr [rsp + 0x18]
01089 48894424f8                     mov        qword ptr [rsp - 8], rax
0108e 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01092 89442428                       mov        dword ptr [rsp + 0x28], eax
01096 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109b 48ff742440                     push       qword ptr [rsp + 0x40]
010a0 488f442430                     pop        qword ptr [rsp + 0x30]
010a5 48ff742478                     push       qword ptr [rsp + 0x78]
010aa 488f442440                     pop        qword ptr [rsp + 0x40]
010af 48894424f8                     mov        qword ptr [rsp - 8], rax
010b4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
010b8 8944242c                       mov        dword ptr [rsp + 0x2c], eax
010bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c1 48ffb42488000000               push       qword ptr [rsp + 0x88]
010c9 488f442438                     pop        qword ptr [rsp + 0x38]
010ce 48894424f8                     mov        qword ptr [rsp - 8], rax
010d3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
010d7 89442454                       mov        dword ptr [rsp + 0x54], eax
010db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010e0 48ff742468                     push       qword ptr [rsp + 0x68]
010e5 488f442460                     pop        qword ptr [rsp + 0x60]
010ea 48ff742470                     push       qword ptr [rsp + 0x70]
010ef 488f442468                     pop        qword ptr [rsp + 0x68]
010f4 48894424f8                     mov        qword ptr [rsp - 8], rax
010f9 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01100 89442470                       mov        dword ptr [rsp + 0x70], eax
01104 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01109 48894424f8                     mov        qword ptr [rsp - 8], rax
0110e 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01115 89442474                       mov        dword ptr [rsp + 0x74], eax
01119 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0111e 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01123 90                             nop        
01124 c5f877                         vzeroupper 
01127 e83498b6ff                     call       0x7fea6f9d7d60
0112c 0f1f840024120010               nop        dword ptr [rax + rax + 0x10001224]
01134 c5fa7f442410                   vmovdqu    xmmword ptr [rsp + 0x10], xmm0
0113a bee4ffffff                     mov        esi, 0xffffffe4
0113f 48894424f8                     mov        qword ptr [rsp - 8], rax
01144 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01148 89442454                       mov        dword ptr [rsp + 0x54], eax
0114c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01151 48ff742468                     push       qword ptr [rsp + 0x68]
01156 488f442460                     pop        qword ptr [rsp + 0x60]
0115b 48ff742470                     push       qword ptr [rsp + 0x70]
01160 488f442468                     pop        qword ptr [rsp + 0x68]
01165 48894424f8                     mov        qword ptr [rsp - 8], rax
0116a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01171 89442470                       mov        dword ptr [rsp + 0x70], eax
01175 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0117a 48894424f8                     mov        qword ptr [rsp - 8], rax
0117f 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01186 89442474                       mov        dword ptr [rsp + 0x74], eax
0118a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0118f 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
01197 90                             nop        
01198 c5f877                         vzeroupper 
0119b e8c097b6ff                     call       0x7fea6f9d7d60
011a0 0f1f840098120011               nop        dword ptr [rax + rax + 0x11001298]
011a8 4533d2                         xor        r10d, r10d
011ab 4c89542428                     mov        qword ptr [rsp + 0x28], r10
011b0 e994efffff                     jmp        0x7fea6fe6d549
011b5 4533d2                         xor        r10d, r10d
011b8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
011bd e9adefffff                     jmp        0x7fea6fe6d56f
011c2 4533d2                         xor        r10d, r10d
011c5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
011ca e9d3efffff                     jmp        0x7fea6fe6d5a2
011cf 4533d2                         xor        r10d, r10d
011d2 4c89542478                     mov        qword ptr [rsp + 0x78], r10
011d7 e9f1efffff                     jmp        0x7fea6fe6d5cd
011dc 4533d2                         xor        r10d, r10d
011df 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
011e7 e917f0ffff                     jmp        0x7fea6fe6d603
011ec bee4ffffff                     mov        esi, 0xffffffe4
011f1 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
011f6 48ff742430                     push       qword ptr [rsp + 0x30]
011fb 488f442410                     pop        qword ptr [rsp + 0x10]
01200 48894424f8                     mov        qword ptr [rsp - 8], rax
01205 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01209 89442418                       mov        dword ptr [rsp + 0x18], eax
0120d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01212 48ff742478                     push       qword ptr [rsp + 0x78]
01217 488f442430                     pop        qword ptr [rsp + 0x30]
0121c 48894424f8                     mov        qword ptr [rsp - 8], rax
01221 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01225 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01229 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0122e 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01233 48894424f8                     mov        qword ptr [rsp - 8], rax
01238 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0123c 89442454                       mov        dword ptr [rsp + 0x54], eax
01240 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01245 48ff742468                     push       qword ptr [rsp + 0x68]
0124a 488f442460                     pop        qword ptr [rsp + 0x60]
0124f 48ff742470                     push       qword ptr [rsp + 0x70]
01254 488f442468                     pop        qword ptr [rsp + 0x68]
01259 666690                         nop        
0125c c5f877                         vzeroupper 
0125f e8fc96b6ff                     call       0x7fea6f9d7d60
01264 0f1f84005c130012               nop        dword ptr [rax + rax + 0x1200135c]
0126c be17000000                     mov        esi, 0x17
01271 666690                         nop        
01274 c5f877                         vzeroupper 
01277 e8e496b6ff                     call       0x7fea6f9d7d60
0127c 0f1f840074130013               nop        dword ptr [rax + rax + 0x13001374]
01284 bd02000000                     mov        ebp, 2
01289 e90ff9ffff                     jmp        0x7fea6fe6df9d
0128e bee4ffffff                     mov        esi, 0xffffffe4
01293 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01298 48ff742430                     push       qword ptr [rsp + 0x30]
0129d 488f442410                     pop        qword ptr [rsp + 0x10]
012a2 48894424f8                     mov        qword ptr [rsp - 8], rax
012a7 8b442438                       mov        eax, dword ptr [rsp + 0x38]
012ab 89442418                       mov        dword ptr [rsp + 0x18], eax
012af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012b4 48ff742440                     push       qword ptr [rsp + 0x40]
012b9 488f442428                     pop        qword ptr [rsp + 0x28]
012be 48894424f8                     mov        qword ptr [rsp - 8], rax
012c3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
012c7 8944241c                       mov        dword ptr [rsp + 0x1c], eax
012cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012d0 48ff742448                     push       qword ptr [rsp + 0x48]
012d5 488f442440                     pop        qword ptr [rsp + 0x40]
012da 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
012df 48894424f8                     mov        qword ptr [rsp - 8], rax
012e4 8b442450                       mov        eax, dword ptr [rsp + 0x50]
012e8 89442448                       mov        dword ptr [rsp + 0x48], eax
012ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f1 48ff742458                     push       qword ptr [rsp + 0x58]
012f6 488f442450                     pop        qword ptr [rsp + 0x50]
012fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01300 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01304 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01308 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0130d 48ff742468                     push       qword ptr [rsp + 0x68]
01312 488f442458                     pop        qword ptr [rsp + 0x58]
01317 48ff742470                     push       qword ptr [rsp + 0x70]
0131c 488f442460                     pop        qword ptr [rsp + 0x60]
01321 48894424f8                     mov        qword ptr [rsp - 8], rax
01326 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0132d 89442468                       mov        dword ptr [rsp + 0x68], eax
01331 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01336 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0133b 90                             nop        
0133c c5f877                         vzeroupper 
0133f e81c96b6ff                     call       0x7fea6f9d7d60
01344 0f1f84003c140014               nop        dword ptr [rax + rax + 0x1400143c]
0134c bee4ffffff                     mov        esi, 0xffffffe4
01351 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01356 48ff742430                     push       qword ptr [rsp + 0x30]
0135b 488f442410                     pop        qword ptr [rsp + 0x10]
01360 48894424f8                     mov        qword ptr [rsp - 8], rax
01365 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01369 89442418                       mov        dword ptr [rsp + 0x18], eax
0136d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01372 48ff742440                     push       qword ptr [rsp + 0x40]
01377 488f442428                     pop        qword ptr [rsp + 0x28]
0137c 48ff742478                     push       qword ptr [rsp + 0x78]
01381 488f442430                     pop        qword ptr [rsp + 0x30]
01386 48894424f8                     mov        qword ptr [rsp - 8], rax
0138b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0138f 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01393 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01398 48ff742448                     push       qword ptr [rsp + 0x48]
0139d 488f442440                     pop        qword ptr [rsp + 0x40]
013a2 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
013a7 48894424f8                     mov        qword ptr [rsp - 8], rax
013ac 8b442450                       mov        eax, dword ptr [rsp + 0x50]
013b0 89442448                       mov        dword ptr [rsp + 0x48], eax
013b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b9 48ff742458                     push       qword ptr [rsp + 0x58]
013be 488f442450                     pop        qword ptr [rsp + 0x50]
013c3 48894424f8                     mov        qword ptr [rsp - 8], rax
013c8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013cc 8944244c                       mov        dword ptr [rsp + 0x4c], eax
013d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013d5 48ff742468                     push       qword ptr [rsp + 0x68]
013da 488f442458                     pop        qword ptr [rsp + 0x58]
013df 48ff742470                     push       qword ptr [rsp + 0x70]
013e4 488f442460                     pop        qword ptr [rsp + 0x60]
013e9 48894424f8                     mov        qword ptr [rsp - 8], rax
013ee 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
013f5 89442468                       mov        dword ptr [rsp + 0x68], eax
013f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01403 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0140a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0140e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01413 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01417 90                             nop        
01418 c5f877                         vzeroupper 
0141b e84095b6ff                     call       0x7fea6f9d7d60
01420 0f1f840018150015               nop        dword ptr [rax + rax + 0x15001518]
01428 c5fa7f442410                   vmovdqu    xmmword ptr [rsp + 0x10], xmm0
0142e e907fdffff                     jmp        0x7fea6fe6e53a
01433 be85ffffff                     mov        esi, 0xffffff85
01438 48894424f8                     mov        qword ptr [rsp - 8], rax
0143d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01441 89442410                       mov        dword ptr [rsp + 0x10], eax
01445 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0144a 48894424f8                     mov        qword ptr [rsp - 8], rax
0144f 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01453 89442414                       mov        dword ptr [rsp + 0x14], eax
01457 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145c 48894424f8                     mov        qword ptr [rsp - 8], rax
01461 8b442420                       mov        eax, dword ptr [rsp + 0x20]
01465 89442418                       mov        dword ptr [rsp + 0x18], eax
01469 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0146e 48894424f8                     mov        qword ptr [rsp - 8], rax
01473 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01477 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0147b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01480 48ff742458                     push       qword ptr [rsp + 0x58]
01485 488f442428                     pop        qword ptr [rsp + 0x28]
0148a 48894424f8                     mov        qword ptr [rsp - 8], rax
0148f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01493 89442420                       mov        dword ptr [rsp + 0x20], eax
01497 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0149c 48ff742468                     push       qword ptr [rsp + 0x68]
014a1 488f442430                     pop        qword ptr [rsp + 0x30]
014a6 48ff742470                     push       qword ptr [rsp + 0x70]
014ab 488f442438                     pop        qword ptr [rsp + 0x38]
014b0 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
014b5 48895c2450                     mov        qword ptr [rsp + 0x50], rbx
014ba 4c89742458                     mov        qword ptr [rsp + 0x58], r14
014bf 90                             nop        
014c0 c5f877                         vzeroupper 
014c3 e89894b6ff                     call       0x7fea6f9d7d60
014c8 0f1f8400c0150016               nop        dword ptr [rax + rax + 0x160015c0]
014d0 4533d2                         xor        r10d, r10d
014d3 eb05                           jmp        0x7fea6fe6e8da
014d5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
014da be6effffff                     mov        esi, 0xffffff6e
014df 48ff742428                     push       qword ptr [rsp + 0x28]
014e4 488f442410                     pop        qword ptr [rsp + 0x10]
014e9 48ff742430                     push       qword ptr [rsp + 0x30]
014ee 488f442418                     pop        qword ptr [rsp + 0x18]
014f3 48894424f8                     mov        qword ptr [rsp - 8], rax
014f8 8b442438                       mov        eax, dword ptr [rsp + 0x38]
014fc 89442428                       mov        dword ptr [rsp + 0x28], eax
01500 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01505 48ff742440                     push       qword ptr [rsp + 0x40]
0150a 488f442430                     pop        qword ptr [rsp + 0x30]
0150f 48ff742478                     push       qword ptr [rsp + 0x78]
01514 488f442440                     pop        qword ptr [rsp + 0x40]
01519 48894424f8                     mov        qword ptr [rsp - 8], rax
0151e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01522 8944242c                       mov        dword ptr [rsp + 0x2c], eax
01526 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0152b 48894424f8                     mov        qword ptr [rsp - 8], rax
01530 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01534 89442448                       mov        dword ptr [rsp + 0x48], eax
01538 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153d 48ff742458                     push       qword ptr [rsp + 0x58]
01542 488f442450                     pop        qword ptr [rsp + 0x50]
01547 48894424f8                     mov        qword ptr [rsp - 8], rax
0154c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01550 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01554 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01559 48ff742468                     push       qword ptr [rsp + 0x68]
0155e 488f442458                     pop        qword ptr [rsp + 0x58]
01563 48ff742470                     push       qword ptr [rsp + 0x70]
01568 488f442460                     pop        qword ptr [rsp + 0x60]
0156d 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01572 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01577 90                             nop        
01578 c5f877                         vzeroupper 
0157b e8e093b6ff                     call       0x7fea6f9d7d60
01580 0f1f840078160017               nop        dword ptr [rax + rax + 0x17001678]
01588 bee4ffffff                     mov        esi, 0xffffffe4
0158d 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01592 48ff742430                     push       qword ptr [rsp + 0x30]
01597 488f442410                     pop        qword ptr [rsp + 0x10]
0159c 48894424f8                     mov        qword ptr [rsp - 8], rax
015a1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
015a5 89442418                       mov        dword ptr [rsp + 0x18], eax
015a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ae 48ff742440                     push       qword ptr [rsp + 0x40]
015b3 488f442428                     pop        qword ptr [rsp + 0x28]
015b8 48ff742478                     push       qword ptr [rsp + 0x78]
015bd 488f442430                     pop        qword ptr [rsp + 0x30]
015c2 48894424f8                     mov        qword ptr [rsp - 8], rax
015c7 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015cb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
015cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d4 48ff742448                     push       qword ptr [rsp + 0x48]
015d9 488f442440                     pop        qword ptr [rsp + 0x40]
015de 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
015e3 48894424f8                     mov        qword ptr [rsp - 8], rax
015e8 8b442450                       mov        eax, dword ptr [rsp + 0x50]
015ec 89442448                       mov        dword ptr [rsp + 0x48], eax
015f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f5 48ff742458                     push       qword ptr [rsp + 0x58]
015fa 488f442450                     pop        qword ptr [rsp + 0x50]
015ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01604 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01608 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0160c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01611 48ff742468                     push       qword ptr [rsp + 0x68]
01616 488f442458                     pop        qword ptr [rsp + 0x58]
0161b 48ff742470                     push       qword ptr [rsp + 0x70]
01620 488f442460                     pop        qword ptr [rsp + 0x60]
01625 48894424f8                     mov        qword ptr [rsp - 8], rax
0162a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01631 89442468                       mov        dword ptr [rsp + 0x68], eax
01635 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163a 48894424f8                     mov        qword ptr [rsp - 8], rax
0163f 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01646 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0164a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164f 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
01656 6690                           nop        
01658 c5f877                         vzeroupper 
0165b e80093b6ff                     call       0x7fea6f9d7d60
01660 0f1f840058170018               nop        dword ptr [rax + rax + 0x18001758]
01668 bef6ffffff                     mov        esi, 0xfffffff6
0166d 666690                         nop        
01670 c5f877                         vzeroupper 
01673 e8e892b6ff                     call       0x7fea6f9d7d60
01678 0f1f840070170019               nop        dword ptr [rax + rax + 0x19001770]
01680 bee4ffffff                     mov        esi, 0xffffffe4
01685 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0168a 48ff742430                     push       qword ptr [rsp + 0x30]
0168f 488f442410                     pop        qword ptr [rsp + 0x10]
01694 48894424f8                     mov        qword ptr [rsp - 8], rax
01699 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0169d 89442418                       mov        dword ptr [rsp + 0x18], eax
016a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a6 48ff742440                     push       qword ptr [rsp + 0x40]
016ab 488f442428                     pop        qword ptr [rsp + 0x28]
016b0 48ff742478                     push       qword ptr [rsp + 0x78]
016b5 488f442430                     pop        qword ptr [rsp + 0x30]
016ba 48894424f8                     mov        qword ptr [rsp - 8], rax
016bf 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
016c3 8944241c                       mov        dword ptr [rsp + 0x1c], eax
016c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016cc 48ff742448                     push       qword ptr [rsp + 0x48]
016d1 488f442440                     pop        qword ptr [rsp + 0x40]
016d6 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
016db 48894424f8                     mov        qword ptr [rsp - 8], rax
016e0 8b442450                       mov        eax, dword ptr [rsp + 0x50]
016e4 89442448                       mov        dword ptr [rsp + 0x48], eax
016e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ed 48ff742458                     push       qword ptr [rsp + 0x58]
016f2 488f442450                     pop        qword ptr [rsp + 0x50]
016f7 48894424f8                     mov        qword ptr [rsp - 8], rax
016fc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01700 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01704 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01709 48ff742468                     push       qword ptr [rsp + 0x68]
0170e 488f442458                     pop        qword ptr [rsp + 0x58]
01713 48ff742470                     push       qword ptr [rsp + 0x70]
01718 488f442460                     pop        qword ptr [rsp + 0x60]
0171d 48894424f8                     mov        qword ptr [rsp - 8], rax
01722 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01729 89442468                       mov        dword ptr [rsp + 0x68], eax
0172d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01732 48894424f8                     mov        qword ptr [rsp - 8], rax
01737 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
0173e 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01742 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01747 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
0174c c5f877                         vzeroupper 
0174f e80c92b6ff                     call       0x7fea6f9d7d60
01754 0f1f84004c18001a               nop        dword ptr [rax + rax + 0x1a00184c]
0175c 8b5c240c                       mov        ebx, dword ptr [rsp + 0xc]
01760 beccffffff                     mov        esi, 0xffffffcc
01765 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0176a 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0176f 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01773 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01778 c5f877                         vzeroupper 
0177b e8e091b6ff                     call       0x7fea6f9d7d60
01780 0f1f84007818001b               nop        dword ptr [rax + rax + 0x1b001878]
01788 be6effffff                     mov        esi, 0xffffff6e
0178d 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01792 48ff742430                     push       qword ptr [rsp + 0x30]
01797 488f442410                     pop        qword ptr [rsp + 0x10]
0179c 48894424f8                     mov        qword ptr [rsp - 8], rax
017a1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
017a5 89442418                       mov        dword ptr [rsp + 0x18], eax
017a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ae 48ff742440                     push       qword ptr [rsp + 0x40]
017b3 488f442428                     pop        qword ptr [rsp + 0x28]
017b8 48ff742478                     push       qword ptr [rsp + 0x78]
017bd 488f442430                     pop        qword ptr [rsp + 0x30]
017c2 48894424f8                     mov        qword ptr [rsp - 8], rax
017c7 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
017cb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
017cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d4 48ff742448                     push       qword ptr [rsp + 0x48]
017d9 488f442440                     pop        qword ptr [rsp + 0x40]
017de 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
017e3 48894424f8                     mov        qword ptr [rsp - 8], rax
017e8 8b442450                       mov        eax, dword ptr [rsp + 0x50]
017ec 89442448                       mov        dword ptr [rsp + 0x48], eax
017f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f5 48ff742458                     push       qword ptr [rsp + 0x58]
017fa 488f442450                     pop        qword ptr [rsp + 0x50]
017ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01804 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01808 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0180c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01811 48ff742468                     push       qword ptr [rsp + 0x68]
01816 488f442458                     pop        qword ptr [rsp + 0x58]
0181b 48ff742470                     push       qword ptr [rsp + 0x70]
01820 488f442460                     pop        qword ptr [rsp + 0x60]
01825 48894424f8                     mov        qword ptr [rsp - 8], rax
0182a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01831 89442468                       mov        dword ptr [rsp + 0x68], eax
01835 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183a 48894424f8                     mov        qword ptr [rsp - 8], rax
0183f 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01846 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0184a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184f 48ffb42488000000               push       qword ptr [rsp + 0x88]
01857 488f442478                     pop        qword ptr [rsp + 0x78]
0185c 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01864 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0186b 90                             nop        
0186c c5f877                         vzeroupper 
0186f e8ec90b6ff                     call       0x7fea6f9d7d60
01874 0f1f84006c19001c               nop        dword ptr [rax + rax + 0x1c00196c]
0187c bee4ffffff                     mov        esi, 0xffffffe4
01881 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01886 48894424f8                     mov        qword ptr [rsp - 8], rax
0188b 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0188f 89442414                       mov        dword ptr [rsp + 0x14], eax
01893 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01898 48ff742440                     push       qword ptr [rsp + 0x40]
0189d 488f442428                     pop        qword ptr [rsp + 0x28]
018a2 48ff742478                     push       qword ptr [rsp + 0x78]
018a7 488f442440                     pop        qword ptr [rsp + 0x40]
018ac 48894424f8                     mov        qword ptr [rsp - 8], rax
018b1 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
018b5 89442420                       mov        dword ptr [rsp + 0x20], eax
018b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018be 48ffb42488000000               push       qword ptr [rsp + 0x88]
018c6 488f442438                     pop        qword ptr [rsp + 0x38]
018cb 48ff742468                     push       qword ptr [rsp + 0x68]
018d0 488f442460                     pop        qword ptr [rsp + 0x60]
018d5 48ff742470                     push       qword ptr [rsp + 0x70]
018da 488f442468                     pop        qword ptr [rsp + 0x68]
018df 48894424f8                     mov        qword ptr [rsp - 8], rax
018e4 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
018eb 89442470                       mov        dword ptr [rsp + 0x70], eax
018ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f4 48894424f8                     mov        qword ptr [rsp - 8], rax
018f9 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01900 89442474                       mov        dword ptr [rsp + 0x74], eax
01904 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01909 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01911 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
01919 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
01921 666690                         nop        
01924 c5f877                         vzeroupper 
01927 e83490b6ff                     call       0x7fea6f9d7d60
0192c 0f1f8400241a001d               nop        dword ptr [rax + rax + 0x1d001a24]
01934 bee4ffffff                     mov        esi, 0xffffffe4
01939 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
0193e 48ff742430                     push       qword ptr [rsp + 0x30]
01943 488f442418                     pop        qword ptr [rsp + 0x18]
01948 48894424f8                     mov        qword ptr [rsp - 8], rax
0194d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01951 89442414                       mov        dword ptr [rsp + 0x14], eax
01955 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195a 48ff742440                     push       qword ptr [rsp + 0x40]
0195f 488f442428                     pop        qword ptr [rsp + 0x28]
01964 48ff742478                     push       qword ptr [rsp + 0x78]
01969 488f442430                     pop        qword ptr [rsp + 0x30]
0196e 48894424f8                     mov        qword ptr [rsp - 8], rax
01973 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01977 89442420                       mov        dword ptr [rsp + 0x20], eax
0197b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01980 48ffb42488000000               push       qword ptr [rsp + 0x88]
01988 488f442438                     pop        qword ptr [rsp + 0x38]
0198d 48ff742468                     push       qword ptr [rsp + 0x68]
01992 488f442460                     pop        qword ptr [rsp + 0x60]
01997 48ff742470                     push       qword ptr [rsp + 0x70]
0199c 488f442468                     pop        qword ptr [rsp + 0x68]
019a1 48894424f8                     mov        qword ptr [rsp - 8], rax
019a6 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
019ad 89442454                       mov        dword ptr [rsp + 0x54], eax
019b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b6 48894424f8                     mov        qword ptr [rsp - 8], rax
019bb 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
019c2 89442470                       mov        dword ptr [rsp + 0x70], eax
019c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cb 48894424f8                     mov        qword ptr [rsp - 8], rax
019d0 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
019d7 89442474                       mov        dword ptr [rsp + 0x74], eax
019db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e0 48894424f8                     mov        qword ptr [rsp - 8], rax
019e5 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
019ec 89442478                       mov        dword ptr [rsp + 0x78], eax
019f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f5 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
019fa 48894424f8                     mov        qword ptr [rsp - 8], rax
019ff 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
01a06 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01a0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a12 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01a1a c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
01a23 90                             nop        
01a24 c5f877                         vzeroupper 
01a27 e8348fb6ff                     call       0x7fea6f9d7d60
01a2c 0f1f8400241b001e               nop        dword ptr [rax + rax + 0x1e001b24]
01a34 beccffffff                     mov        esi, 0xffffffcc
01a39 48ff742428                     push       qword ptr [rsp + 0x28]
01a3e 488f442418                     pop        qword ptr [rsp + 0x18]
01a43 48894424f8                     mov        qword ptr [rsp - 8], rax
01a48 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01a4c 89442414                       mov        dword ptr [rsp + 0x14], eax
01a50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a55 48ff742478                     push       qword ptr [rsp + 0x78]
01a5a 488f442460                     pop        qword ptr [rsp + 0x60]
01a5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a64 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01a68 89442420                       mov        dword ptr [rsp + 0x20], eax
01a6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a71 48ffb42488000000               push       qword ptr [rsp + 0x88]
01a79 488f442438                     pop        qword ptr [rsp + 0x38]
01a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a83 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01a8a 89442478                       mov        dword ptr [rsp + 0x78], eax
01a8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a93 48894424f8                     mov        qword ptr [rsp - 8], rax
01a98 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01a9f 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01aa3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa8 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01ab0 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01ab8 c5f877                         vzeroupper 
01abb e8a08eb6ff                     call       0x7fea6f9d7d60
01ac0 0f1f8400b81b001f               nop        dword ptr [rax + rax + 0x1f001bb8]
01ac8 bee4ffffff                     mov        esi, 0xffffffe4
01acd 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01ad2 48ff742430                     push       qword ptr [rsp + 0x30]
01ad7 488f442410                     pop        qword ptr [rsp + 0x10]
01adc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae1 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01ae5 89442418                       mov        dword ptr [rsp + 0x18], eax
01ae9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aee 48ff742440                     push       qword ptr [rsp + 0x40]
01af3 488f442428                     pop        qword ptr [rsp + 0x28]
01af8 48ff742478                     push       qword ptr [rsp + 0x78]
01afd 488f442430                     pop        qword ptr [rsp + 0x30]
01b02 48894424f8                     mov        qword ptr [rsp - 8], rax
01b07 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01b0b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01b0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b14 48ff742448                     push       qword ptr [rsp + 0x48]
01b19 488f442440                     pop        qword ptr [rsp + 0x40]
01b1e 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01b23 48894424f8                     mov        qword ptr [rsp - 8], rax
01b28 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01b2c 89442448                       mov        dword ptr [rsp + 0x48], eax
01b30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b35 48ff742458                     push       qword ptr [rsp + 0x58]
01b3a 488f442450                     pop        qword ptr [rsp + 0x50]
01b3f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b44 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b48 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b51 48ff742468                     push       qword ptr [rsp + 0x68]
01b56 488f442458                     pop        qword ptr [rsp + 0x58]
01b5b 48ff742470                     push       qword ptr [rsp + 0x70]
01b60 488f442460                     pop        qword ptr [rsp + 0x60]
01b65 666690                         nop        
01b68 c5f877                         vzeroupper 
01b6b e8f08db6ff                     call       0x7fea6f9d7d60
01b70 0f1f8400681c0020               nop        dword ptr [rax + rax + 0x20001c68]
01b78 bee4ffffff                     mov        esi, 0xffffffe4
01b7d 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01b82 48ff742430                     push       qword ptr [rsp + 0x30]
01b87 488f442410                     pop        qword ptr [rsp + 0x10]
01b8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b91 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01b95 89442418                       mov        dword ptr [rsp + 0x18], eax
01b99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9e 48ff742440                     push       qword ptr [rsp + 0x40]
01ba3 488f442428                     pop        qword ptr [rsp + 0x28]
01ba8 48ff742478                     push       qword ptr [rsp + 0x78]
01bad 488f442430                     pop        qword ptr [rsp + 0x30]
01bb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb7 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01bbb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01bbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc4 48ff742448                     push       qword ptr [rsp + 0x48]
01bc9 488f442440                     pop        qword ptr [rsp + 0x40]
01bce 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01bd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd8 8b442450                       mov        eax, dword ptr [rsp + 0x50]
01bdc 89442448                       mov        dword ptr [rsp + 0x48], eax
01be0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be5 48ff742458                     push       qword ptr [rsp + 0x58]
01bea 488f442450                     pop        qword ptr [rsp + 0x50]
01bef 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01bf8 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01bfc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c01 48ff742468                     push       qword ptr [rsp + 0x68]
01c06 488f442458                     pop        qword ptr [rsp + 0x58]
01c0b 48ff742470                     push       qword ptr [rsp + 0x70]
01c10 488f442460                     pop        qword ptr [rsp + 0x60]
01c15 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01c21 89442468                       mov        dword ptr [rsp + 0x68], eax
01c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2f 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01c36 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01c3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3f 90                             nop        
01c40 c5f877                         vzeroupper 
01c43 e8188db6ff                     call       0x7fea6f9d7d60
01c48 0f1f8400401d0021               nop        dword ptr [rax + rax + 0x21001d40]
01c50 bee4ffffff                     mov        esi, 0xffffffe4
01c55 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5f 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01c63 89442414                       mov        dword ptr [rsp + 0x14], eax
01c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6c 48ff742440                     push       qword ptr [rsp + 0x40]
01c71 488f442428                     pop        qword ptr [rsp + 0x28]
01c76 48ff742478                     push       qword ptr [rsp + 0x78]
01c7b 488f442440                     pop        qword ptr [rsp + 0x40]
01c80 48894424f8                     mov        qword ptr [rsp - 8], rax
01c85 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01c89 89442420                       mov        dword ptr [rsp + 0x20], eax
01c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c92 48ffb42488000000               push       qword ptr [rsp + 0x88]
01c9a 488f442438                     pop        qword ptr [rsp + 0x38]
01c9f 48ff742468                     push       qword ptr [rsp + 0x68]
01ca4 488f442460                     pop        qword ptr [rsp + 0x60]
01ca9 48ff742470                     push       qword ptr [rsp + 0x70]
01cae 488f442468                     pop        qword ptr [rsp + 0x68]
01cb3 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb8 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01cbf 89442470                       mov        dword ptr [rsp + 0x70], eax
01cc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ccd 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01cd4 89442474                       mov        dword ptr [rsp + 0x74], eax
01cd8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cdd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce2 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01ce9 89442478                       mov        dword ptr [rsp + 0x78], eax
01ced 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf2 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01cfa 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
01d01 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01d09 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01d11 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
01d19 666690                         nop        
01d1c c5f877                         vzeroupper 
01d1f e83c8cb6ff                     call       0x7fea6f9d7d60
01d24 0f1f84001c1e0022               nop        dword ptr [rax + rax + 0x22001e1c]
01d2c bee4ffffff                     mov        esi, 0xffffffe4
01d31 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01d36 48ff742430                     push       qword ptr [rsp + 0x30]
01d3b 488f442418                     pop        qword ptr [rsp + 0x18]
01d40 48894424f8                     mov        qword ptr [rsp - 8], rax
01d45 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01d49 89442414                       mov        dword ptr [rsp + 0x14], eax
01d4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d52 48ff742440                     push       qword ptr [rsp + 0x40]
01d57 488f442428                     pop        qword ptr [rsp + 0x28]
01d5c 48ff742478                     push       qword ptr [rsp + 0x78]
01d61 488f442430                     pop        qword ptr [rsp + 0x30]
01d66 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6b 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01d6f 89442420                       mov        dword ptr [rsp + 0x20], eax
01d73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d78 48ffb42488000000               push       qword ptr [rsp + 0x88]
01d80 488f442438                     pop        qword ptr [rsp + 0x38]
01d85 48ff742468                     push       qword ptr [rsp + 0x68]
01d8a 488f442460                     pop        qword ptr [rsp + 0x60]
01d8f 48ff742470                     push       qword ptr [rsp + 0x70]
01d94 488f442468                     pop        qword ptr [rsp + 0x68]
01d99 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01da5 89442454                       mov        dword ptr [rsp + 0x54], eax
01da9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dae 48894424f8                     mov        qword ptr [rsp - 8], rax
01db3 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01dba 89442470                       mov        dword ptr [rsp + 0x70], eax
01dbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc3 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc8 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01dcf 89442474                       mov        dword ptr [rsp + 0x74], eax
01dd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd8 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
01ddd 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01de4 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
01dec c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
01df5 666690                         nop        
01df8 c5f877                         vzeroupper 
01dfb e8608bb6ff                     call       0x7fea6f9d7d60
01e00 0f1f8400f81e0023               nop        dword ptr [rax + rax + 0x23001ef8]
01e08 beccffffff                     mov        esi, 0xffffffcc
01e0d 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01e12 48894424f8                     mov        qword ptr [rsp - 8], rax
01e17 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01e1b 89442414                       mov        dword ptr [rsp + 0x14], eax
01e1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e24 48ff742440                     push       qword ptr [rsp + 0x40]
01e29 488f442428                     pop        qword ptr [rsp + 0x28]
01e2e 48ff742478                     push       qword ptr [rsp + 0x78]
01e33 488f442440                     pop        qword ptr [rsp + 0x40]
01e38 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3d 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e41 89442420                       mov        dword ptr [rsp + 0x20], eax
01e45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4a 48ffb42488000000               push       qword ptr [rsp + 0x88]
01e52 488f442438                     pop        qword ptr [rsp + 0x38]
01e57 48ff742468                     push       qword ptr [rsp + 0x68]
01e5c 488f442460                     pop        qword ptr [rsp + 0x60]
01e61 48ff742470                     push       qword ptr [rsp + 0x70]
01e66 488f442468                     pop        qword ptr [rsp + 0x68]
01e6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e70 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01e77 89442470                       mov        dword ptr [rsp + 0x70], eax
01e7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e80 48894424f8                     mov        qword ptr [rsp - 8], rax
01e85 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01e8c 89442474                       mov        dword ptr [rsp + 0x74], eax
01e90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e95 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9a 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01ea1 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01ea5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eaa 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
01eb2 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
01eba 6690                           nop        
01ebc c5f877                         vzeroupper 
01ebf e89c8ab6ff                     call       0x7fea6f9d7d60
01ec4 0f1f8400bc1f0024               nop        dword ptr [rax + rax + 0x24001fbc]
01ecc beccffffff                     mov        esi, 0xffffffcc
01ed1 48ff742428                     push       qword ptr [rsp + 0x28]
01ed6 488f442418                     pop        qword ptr [rsp + 0x18]
01edb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee0 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01ee4 89442414                       mov        dword ptr [rsp + 0x14], eax
01ee8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eed 48ff742478                     push       qword ptr [rsp + 0x78]
01ef2 488f442460                     pop        qword ptr [rsp + 0x60]
01ef7 48894424f8                     mov        qword ptr [rsp - 8], rax
01efc 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01f00 89442420                       mov        dword ptr [rsp + 0x20], eax
01f04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f09 48ffb42488000000               push       qword ptr [rsp + 0x88]
01f11 488f442438                     pop        qword ptr [rsp + 0x38]
01f16 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01f22 89442478                       mov        dword ptr [rsp + 0x78], eax
01f26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f30 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01f37 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01f3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f40 48894424f8                     mov        qword ptr [rsp - 8], rax
01f45 8b842490000000                 mov        eax, dword ptr [rsp + 0x90]
01f4c 89842480000000                 mov        dword ptr [rsp + 0x80], eax
01f53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f58 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5d 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
01f64 89842484000000                 mov        dword ptr [rsp + 0x84], eax
01f6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f70 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01f78 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
01f7f 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01f87 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01f8f 90                             nop        
01f90 c5f877                         vzeroupper 
01f93 e8c889b6ff                     call       0x7fea6f9d7d60
01f98 0f1f840090200025               nop        dword ptr [rax + rax + 0x25002090]
01fa0 bee4ffffff                     mov        esi, 0xffffffe4
01fa5 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
01faa 48ff742430                     push       qword ptr [rsp + 0x30]
01faf 488f442418                     pop        qword ptr [rsp + 0x18]
01fb4 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb9 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01fbd 8944240c                       mov        dword ptr [rsp + 0xc], eax
01fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc6 48ff742440                     push       qword ptr [rsp + 0x40]
01fcb 488f442428                     pop        qword ptr [rsp + 0x28]
01fd0 48ff742478                     push       qword ptr [rsp + 0x78]
01fd5 488f442430                     pop        qword ptr [rsp + 0x30]
01fda 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdf 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01fe3 89442414                       mov        dword ptr [rsp + 0x14], eax
01fe7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fec 48ff742468                     push       qword ptr [rsp + 0x68]
01ff1 488f442460                     pop        qword ptr [rsp + 0x60]
01ff6 48ff742470                     push       qword ptr [rsp + 0x70]
01ffb 488f442468                     pop        qword ptr [rsp + 0x68]
02000 48894424f8                     mov        qword ptr [rsp - 8], rax
02005 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0200c 89442470                       mov        dword ptr [rsp + 0x70], eax
02010 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02015 666690                         nop        
02018 c5f877                         vzeroupper 
0201b e84089b6ff                     call       0x7fea6f9d7d60
02020 0f1f840018210026               nop        dword ptr [rax + rax + 0x26002118]
02028 bee4ffffff                     mov        esi, 0xffffffe4
0202d 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
02032 48ff742430                     push       qword ptr [rsp + 0x30]
02037 488f442418                     pop        qword ptr [rsp + 0x18]
0203c 48894424f8                     mov        qword ptr [rsp - 8], rax
02041 8b442438                       mov        eax, dword ptr [rsp + 0x38]
02045 8944240c                       mov        dword ptr [rsp + 0xc], eax
02049 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204e 48ff742440                     push       qword ptr [rsp + 0x40]
02053 488f442428                     pop        qword ptr [rsp + 0x28]
02058 48ff742478                     push       qword ptr [rsp + 0x78]
0205d 488f442430                     pop        qword ptr [rsp + 0x30]
02062 48894424f8                     mov        qword ptr [rsp - 8], rax
02067 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0206b 89442414                       mov        dword ptr [rsp + 0x14], eax
0206f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02074 48ff742468                     push       qword ptr [rsp + 0x68]
02079 488f442460                     pop        qword ptr [rsp + 0x60]
0207e 48ff742470                     push       qword ptr [rsp + 0x70]
02083 488f442468                     pop        qword ptr [rsp + 0x68]
02088 48894424f8                     mov        qword ptr [rsp - 8], rax
0208d 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02094 89442470                       mov        dword ptr [rsp + 0x70], eax
02098 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209d 48894424f8                     mov        qword ptr [rsp - 8], rax
020a2 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
020a9 89442478                       mov        dword ptr [rsp + 0x78], eax
020ad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b2 48894424f8                     mov        qword ptr [rsp - 8], rax
020b7 8b842498000000                 mov        eax, dword ptr [rsp + 0x98]
020be 89842480000000                 mov        dword ptr [rsp + 0x80], eax
020c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ca c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
020d3 90                             nop        
020d4 c5f877                         vzeroupper 
020d7 e88488b6ff                     call       0x7fea6f9d7d60
020dc 0f1f8400d4210027               nop        dword ptr [rax + rax + 0x270021d4]
020e4 beccffffff                     mov        esi, 0xffffffcc
020e9 488b6c2428                     mov        rbp, qword ptr [rsp + 0x28]
020ee 48ff742430                     push       qword ptr [rsp + 0x30]
020f3 488f442418                     pop        qword ptr [rsp + 0x18]
020f8 48894424f8                     mov        qword ptr [rsp - 8], rax
020fd 8b442438                       mov        eax, dword ptr [rsp + 0x38]
02101 8944240c                       mov        dword ptr [rsp + 0xc], eax
02105 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210a 48ff742440                     push       qword ptr [rsp + 0x40]
0210f 488f442428                     pop        qword ptr [rsp + 0x28]
02114 48ff742478                     push       qword ptr [rsp + 0x78]
02119 488f442430                     pop        qword ptr [rsp + 0x30]
0211e 48894424f8                     mov        qword ptr [rsp - 8], rax
02123 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02127 89442414                       mov        dword ptr [rsp + 0x14], eax
0212b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02130 48ffb42488000000               push       qword ptr [rsp + 0x88]
02138 488f442438                     pop        qword ptr [rsp + 0x38]
0213d 48ff742468                     push       qword ptr [rsp + 0x68]
02142 488f442460                     pop        qword ptr [rsp + 0x60]
02147 48ff742470                     push       qword ptr [rsp + 0x70]
0214c 488f442468                     pop        qword ptr [rsp + 0x68]
02151 48894424f8                     mov        qword ptr [rsp - 8], rax
02156 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0215d 89442470                       mov        dword ptr [rsp + 0x70], eax
02161 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02166 48894424f8                     mov        qword ptr [rsp - 8], rax
0216b 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
02172 89442474                       mov        dword ptr [rsp + 0x74], eax
02176 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0217b 48894424f8                     mov        qword ptr [rsp - 8], rax
02180 8b842494000000                 mov        eax, dword ptr [rsp + 0x94]
02187 89442478                       mov        dword ptr [rsp + 0x78], eax
0218b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02190 c5f877                         vzeroupper 
02193 e8c887b6ff                     call       0x7fea6f9d7d60
02198 0f1f840090220028               nop        dword ptr [rax + rax + 0x28002290]
021a0 bef6ffffff                     mov        esi, 0xfffffff6
021a5 666690                         nop        
021a8 c5f877                         vzeroupper 
021ab e8b087b6ff                     call       0x7fea6f9d7d60
021b0 0f1f8400a8220029               nop        dword ptr [rax + rax + 0x290022a8]
021b8 bef6ffffff                     mov        esi, 0xfffffff6
021bd 666690                         nop        
021c0 c5f877                         vzeroupper 
021c3 e89887b6ff                     call       0x7fea6f9d7d60
021c8 0f1f8400c022002a               nop        dword ptr [rax + rax + 0x2a0022c0]
021d0 bef6ffffff                     mov        esi, 0xfffffff6
021d5 666690                         nop        
021d8 c5f877                         vzeroupper 
021db e88087b6ff                     call       0x7fea6f9d7d60
021e0 0f1f8400d822002b               nop        dword ptr [rax + rax + 0x2b0022d8]
021e8 bef6ffffff                     mov        esi, 0xfffffff6
021ed 8beb                           mov        ebp, ebx
021ef 90                             nop        
021f0 c5f877                         vzeroupper 
021f3 e86887b6ff                     call       0x7fea6f9d7d60
021f8 0f1f8400f022002c               nop        dword ptr [rax + rax + 0x2c0022f0]
02200 bef6ffffff                     mov        esi, 0xfffffff6
02205 418be9                         mov        ebp, r9d
02208 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0220d 666690                         nop        
02210 c5f877                         vzeroupper 
02213 e84887b6ff                     call       0x7fea6f9d7d60
02218 0f1f84001023002d               nop        dword ptr [rax + rax + 0x2d002310]
02220 bef6ffffff                     mov        esi, 0xfffffff6
02225 666690                         nop        
02228 c5f877                         vzeroupper 
0222b e83087b6ff                     call       0x7fea6f9d7d60
02230 0f1f84002823002e               nop        dword ptr [rax + rax + 0x2e002328]
02238 bef6ffffff                     mov        esi, 0xfffffff6
0223d 666690                         nop        
02240 c5f877                         vzeroupper 
02243 e81887b6ff                     call       0x7fea6f9d7d60
02248 0f1f84004023002f               nop        dword ptr [rax + rax + 0x2f002340]
02250 bef6ffffff                     mov        esi, 0xfffffff6
02255 666690                         nop        
02258 c5f877                         vzeroupper 
0225b e80087b6ff                     call       0x7fea6f9d7d60
02260 0f1f840058230030               nop        dword ptr [rax + rax + 0x30002358]
02268 bef6ffffff                     mov        esi, 0xfffffff6
0226d 666690                         nop        
02270 c5f877                         vzeroupper 
02273 e8e886b6ff                     call       0x7fea6f9d7d60
02278 0f1f840070230031               nop        dword ptr [rax + rax + 0x31002370]
02280 eb0c                           jmp        0x7fea6fe6f68e
02282 eb0a                           jmp        0x7fea6fe6f68e
02284 eb08                           jmp        0x7fea6fe6f68e
02286 eb06                           jmp        0x7fea6fe6f68e
02288 eb04                           jmp        0x7fea6fe6f68e
0228a eb02                           jmp        0x7fea6fe6f68e
0228c eb00                           jmp        0x7fea6fe6f68e
0228e 488bf0                         mov        rsi, rax
02291 e91ee3ffff                     jmp        0x7fea6fe6d9b4
02296 bef6ffffff                     mov        esi, 0xfffffff6
0229b 90                             nop        
0229c c5f877                         vzeroupper 
0229f e8bc86b6ff                     call       0x7fea6f9d7d60
022a4 0f1f84009c230032               nop        dword ptr [rax + rax + 0x3200239c]
022ac bef6ffffff                     mov        esi, 0xfffffff6
022b1 418be9                         mov        ebp, r9d
022b4 c5f877                         vzeroupper 
022b7 e8a486b6ff                     call       0x7fea6f9d7d60
022bc 0f1f8400b4230033               nop        dword ptr [rax + rax + 0x330023b4]
022c4 bef6ffffff                     mov        esi, 0xfffffff6
022c9 666690                         nop        
022cc c5f877                         vzeroupper 
022cf e88c86b6ff                     call       0x7fea6f9d7d60
022d4 0f1f8400cc230034               nop        dword ptr [rax + rax + 0x340023cc]
022dc 49ba5fdfe66fea7f0000           movabs     r10, 0x7fea6fe6df5f
022e6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
022ed e9ee37aaff                     jmp        0x7fea6f912ee0
022f2 e8a903a9ff                     call       0x7fea6f8ffaa0
022f7 e932ddffff                     jmp        0x7fea6fe6d42e
022fc f4                             hlt        
022fd f4                             hlt        
022fe f4                             hlt        
022ff f4                             hlt        
