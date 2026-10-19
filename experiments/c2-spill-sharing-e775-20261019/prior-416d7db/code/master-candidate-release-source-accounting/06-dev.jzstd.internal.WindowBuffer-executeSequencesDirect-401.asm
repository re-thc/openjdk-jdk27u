00000 e8bb448715                     call       0x7f4ec56d5340
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85fc2d0000                   jne        0x7f4eafe63caa
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00046 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
0004a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0004f 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00056 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0005b 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00062 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00067 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
0006e 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00073 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
0007a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0007f 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00086 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0008b 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
00092 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00097 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
0009d 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
000a4 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000ab 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
000b0 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000bc 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000c3 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
000c8 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cf 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
000d7 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000db 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000e0 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000e4 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
000ec 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000f3 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
000fb 488bfe                         mov        rdi, rsi
000fe c5f877                         vzeroupper 
00101 49ba80ba7bc54e7f0000           movabs     r10, 0x7f4ec57bba80
0010b 41ffd2                         call       r10
0010e 0f1f840000000000               nop        dword ptr [rax + rax]
00116 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011b 4d85d2                         test       r10, r10
0011e 0f84c81a0000                   je         0x7f4eafe62a6c
00124 458b12                         mov        r10d, dword ptr [r10]
00127 41c1ea0d                       shr        r10d, 0xd
0012b 4181fa15040000                 cmp        r10d, 0x415
00132 0f85a8260000                   jne        0x7f4eafe63660
00138 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0013d 4c891424                       mov        qword ptr [rsp], r10
00141 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00146 4d85d2                         test       r10, r10
00149 0f84a91a0000                   je         0x7f4eafe62a78
0014f 458b1a                         mov        r11d, dword ptr [r10]
00152 41c1eb0d                       shr        r11d, 0xd
00156 4181fb05010000                 cmp        r11d, 0x105
0015d 0f857d260000                   jne        0x7f4eafe63660
00163 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00170 4d85d2                         test       r10, r10
00173 0f848f1a0000                   je         0x7f4eafe62a88
00179 458b12                         mov        r10d, dword ptr [r10]
0017c 41c1ea0d                       shr        r10d, 0xd
00180 4181fa08010000                 cmp        r10d, 0x108
00187 0f8553260000                   jne        0x7f4eafe63660
0018d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00192 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0019a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0019f 4d85d2                         test       r10, r10
001a2 0f84701a0000                   je         0x7f4eafe62a98
001a8 458b1a                         mov        r11d, dword ptr [r10]
001ab 41c1eb0d                       shr        r11d, 0xd
001af 4181fb07010000                 cmp        r11d, 0x107
001b6 0f8524260000                   jne        0x7f4eafe63660
001bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c6 4d85d2                         test       r10, r10
001c9 0f84561a0000                   je         0x7f4eafe62aa5
001cf 458b12                         mov        r10d, dword ptr [r10]
001d2 41c1ea0d                       shr        r10d, 0xd
001d6 4181fa07010000                 cmp        r10d, 0x107
001dd 0f85fd250000                   jne        0x7f4eafe63660
001e3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001e8 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001f0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f5 4d85d2                         test       r10, r10
001f8 0f84371a0000                   je         0x7f4eafe62ab5
001fe 458b1a                         mov        r11d, dword ptr [r10]
00201 41c1eb0d                       shr        r11d, 0xd
00205 4181fb05010000                 cmp        r11d, 0x105
0020c 0f85ce250000                   jne        0x7f4eafe63660
00212 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0021a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00222 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00226 44895c2408                     mov        dword ptr [rsp + 8], r11d
0022b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00230 4585d2                         test       r10d, r10d
00233 0f8457250000                   je         0x7f4eafe63610
00239 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00241 458b5204                       mov        r10d, dword ptr [r10 + 4]
00245 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0024a 4585d2                         test       r10d, r10d
0024d 0f863d250000                   jbe        0x7f4eafe63610
00253 4183fa01                       cmp        r10d, 1
00257 0f8633250000                   jbe        0x7f4eafe63610
0025d 4183fa02                       cmp        r10d, 2
00261 0f8629250000                   jbe        0x7f4eafe63610
00267 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0026f 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00273 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00278 4183c3f1                       add        r11d, -0xf
0027c 4585db                         test       r11d, r11d
0027f 0f8c0b250000                   jl         0x7f4eafe63610
00285 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0028d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00291 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00296 4183c2f1                       add        r10d, -0xf
0029a 4585d2                         test       r10d, r10d
0029d 0f8ced240000                   jl         0x7f4eafe63610
002a3 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002a8 4183c3f9                       add        r11d, -7
002ac 4585db                         test       r11d, r11d
002af 0f8cdb240000                   jl         0x7f4eafe63610
002b5 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
002ba 458d59f9                       lea        r11d, [r9 - 7]
002be 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002c6 4d63d1                         movsxd     r10, r9d
002c9 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002ce 4183c1f1                       add        r9d, -0xf
002d2 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
002da 4983c2f9                       add        r10, -7
002de 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002e3 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002e8 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
002ed 458d5af1                       lea        r11d, [r10 - 0xf]
002f1 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
002f9 e901040000                     jmp        0x7f4eafe6157f
002fe 448bdd                         mov        r11d, ebp
00301 4d63d3                         movsxd     r10, r11d
00304 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0030b c442a8f5db                     bzhi       r11, r11, r10
00310 c4c1fb92fb                     kmovq      k7, r11
00315 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0031b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00321 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00329 4403d5                         add        r10d, ebp
0032c 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00334 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00338 418502                         test       dword ptr [r10], eax
0033b 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00343 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
0034b 0f8da3090000                   jge        0x7f4eafe61b74
00351 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
00358 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00360 442b9c24bc000000               sub        r11d, dword ptr [rsp + 0xbc]
00368 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00370 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00377 2bac24bc000000                 sub        ebp, dword ptr [rsp + 0xbc]
0037e 3bac24bc000000                 cmp        ebp, dword ptr [rsp + 0xbc]
00385 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0038d 410f4fea                       cmovg      ebp, r10d
00391 458bc3                         mov        r8d, r11d
00394 4585db                         test       r11d, r11d
00397 0f8cdb1a0000                   jl         0x7f4eafe62cf8
0039d 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003a5 4585db                         test       r11d, r11d
003a8 0f8cca1a0000                   jl         0x7f4eafe62cf8
003ae 458d1c28                       lea        r11d, [r8 + rbp]
003b2 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
003b7 453bd3                         cmp        r10d, r11d
003ba 0f82b81a0000                   jb         0x7f4eafe62cf8
003c0 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c7 03dd                           add        ebx, ebp
003c9 443bd3                         cmp        r10d, ebx
003cc 0f82a61a0000                   jb         0x7f4eafe62cf8
003d2 85ed                           test       ebp, ebp
003d4 0f8c9e1a0000                   jl         0x7f4eafe62cf8
003da 85ed                           test       ebp, ebp
003dc 0f843fffffff                   je         0x7f4eafe611a1
003e2 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
003ea 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003f2 4b8d741308                     lea        rsi, [r11 + r10 + 8]
003f7 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
003fc 4863d5                         movsxd     rdx, ebp
003ff 4883fa20                       cmp        rdx, 0x20
00403 0f86f5feffff                   jbe        0x7f4eafe6117e
00409 c5f877                         vzeroupper 
0040c 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00416 41ffd2                         call       r10
00419 0f1f840000000000               nop        dword ptr [rax + rax]
00421 e9fbfeffff                     jmp        0x7f4eafe611a1
00426 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
0042e 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00436 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0043d 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00444 4103db                         add        ebx, r11d
00447 e997020000                     jmp        0x7f4eafe61563
0044c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00454 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
0045c 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00461 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00466 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0046e 44039c24c4000000               add        r11d, dword ptr [rsp + 0xc4]
00476 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
0047e 4963cb                         movsxd     rcx, r11d
00481 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00489 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00491 0f8cd6050000                   jl         0x7f4eafe618ed
00497 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0049f 4183fa30                       cmp        r10d, 0x30
004a3 0f8e95000000                   jle        0x7f4eafe613be
004a9 4585c0                         test       r8d, r8d
004ac 0f8c06190000                   jl         0x7f4eafe62c38
004b2 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
004ba 4585db                         test       r11d, r11d
004bd 0f8cf5180000                   jl         0x7f4eafe62c38
004c3 4503d0                         add        r10d, r8d
004c6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
004cb 453bda                         cmp        r11d, r10d
004ce 0f82e4180000                   jb         0x7f4eafe62c38
004d4 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
004dc 0f82d6180000                   jb         0x7f4eafe62c38
004e2 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
004ea 4585d2                         test       r10d, r10d
004ed 0f84e2010000                   je         0x7f4eafe61555
004f3 4963d2                         movsxd     rdx, r10d
004f6 4883fa20                       cmp        rdx, 0x20
004fa 7725                           ja         0x7f4eafe613a1
004fc 4d63d2                         movsxd     r10, r10d
004ff 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00506 c442a8f5db                     bzhi       r11, r11, r10
0050b c4c1fb92fb                     kmovq      k7, r11
00510 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00516 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0051c e9b4010000                     jmp        0x7f4eafe61555
00521 c5f877                         vzeroupper 
00524 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
0052e 41ffd2                         call       r10
00531 0f1f840000000000               nop        dword ptr [rax + rax]
00539 e997010000                     jmp        0x7f4eafe61555
0053e 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00546 0f8314150000                   jae        0x7f4eafe628e0
0054c 4963f8                         movsxd     rdi, r8d
0054f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00557 4d8b543a08                     mov        r10, qword ptr [r10 + rdi + 8]
0055c 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00564 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
0056c 0f83b2150000                   jae        0x7f4eafe629a4
00572 448b8c24c4000000               mov        r9d, dword ptr [rsp + 0xc4]
0057a 418d5908                       lea        ebx, [r9 + 8]
0057e 4d63d9                         movsxd     r11, r9d
00581 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
00589 4e89541a08                     mov        qword ptr [rdx + r11 + 8], r10
0058e 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
00595 0f8d3a010000                   jge        0x7f4eafe61555
0059b 492bfb                         sub        rdi, r11
0059e 4c63db                         movsxd     r11, ebx
005a1 4d8d143b                       lea        r10, [r11 + rdi]
005a5 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005aa 0f8395160000                   jae        0x7f4eafe62ac5
005b0 4c8bd1                         mov        r10, rcx
005b3 4d2bd3                         sub        r10, r11
005b6 4983c207                       add        r10, 7
005ba 4983e2f8                       and        r10, 0xfffffffffffffff8
005be 458bda                         mov        r11d, r10d
005c1 478d540b08                     lea        r10d, [r11 + r9 + 8]
005c6 4d63d2                         movsxd     r10, r10d
005c9 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
005ce 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005d3 0f836c160000                   jae        0x7f4eafe62ac5
005d9 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
005e0 0f835f160000                   jae        0x7f4eafe62ac5
005e6 4983c2f8                       add        r10, -8
005ea 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005ef 0f8350160000                   jae        0x7f4eafe62ac5
005f5 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005fd 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00604 0f8ffe160000                   jg         0x7f4eafe62b88
0060a 452bc1                         sub        r8d, r9d
0060d 4183c110                       add        r9d, 0x10
00611 458d1418                       lea        r10d, [r8 + rbx]
00615 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0061d 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00622 448bdb                         mov        r11d, ebx
00625 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
0062d 4e89541f08                     mov        qword ptr [rdi + r11 + 8], r10
00632 83c308                         add        ebx, 8
00635 413bd9                         cmp        ebx, r9d
00638 7cd7                           jl         0x7f4eafe61491
0063a 4883c1f8                       add        rcx, -8
0063e 4881f900000080                 cmp        rcx, -0x80000000
00645 49c7c200000080                 mov        r10, 0xffffffff80000000
0064c 490f4cca                       cmovl      rcx, r10
00650 448bc9                         mov        r9d, ecx
00653 413bd9                         cmp        ebx, r9d
00656 7d47                           jge        0x7f4eafe6151f
00658 0f1f840000000000               nop        dword ptr [rax + rax]
00660 418d0c18                       lea        ecx, [r8 + rbx]
00664 448bd3                         mov        r10d, ebx
00667 4963fa                         movsxd     rdi, r10d
0066a 448bd9                         mov        r11d, ecx
0066d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00675 4b8b541a08                     mov        rdx, qword ptr [r10 + r11 + 8]
0067a 4c63d1                         movsxd     r10, ecx
0067d 448bdb                         mov        r11d, ebx
00680 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
00688 4a89541908                     mov        qword ptr [rcx + r11 + 8], rdx
0068d 4e8b541110                     mov        r10, qword ptr [rcx + r10 + 0x10]
00692 4c89543910                     mov        qword ptr [rcx + rdi + 0x10], r10
00697 83c310                         add        ebx, 0x10
0069a 413bd9                         cmp        ebx, r9d
0069d 7cc1                           jl         0x7f4eafe614e0
0069f 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
006a6 7d2d                           jge        0x7f4eafe61555
006a8 458d1418                       lea        r10d, [r8 + rbx]
006ac 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
006b4 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
006b9 448bdb                         mov        r11d, ebx
006bc 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
006c4 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
006c9 83c308                         add        ebx, 8
006cc 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
006d3 7cd3                           jl         0x7f4eafe61528
006d5 8b9c24c4000000                 mov        ebx, dword ptr [rsp + 0xc4]
006dc 039c24b8000000                 add        ebx, dword ptr [rsp + 0xb8]
006e3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006e8 41ffc3                         inc        r11d
006eb 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
006f0 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006f4 418502                         test       dword ptr [r10], eax
006f7 448bb424c0000000               mov        r14d, dword ptr [rsp + 0xc0]
006ff 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00707 498d741a08                     lea        rsi, [r10 + rbx + 8]
0070c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00711 452bde                         sub        r11d, r14d
00714 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0071c 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
00721 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00726 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0072b 0f8df1050000                   jge        0x7f4eafe61ba2
00731 443b442408                     cmp        r8d, dword ptr [rsp + 8]
00736 0f83310e0000                   jae        0x7f4eafe623ed
0073c 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00744 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
00749 418bc2                         mov        eax, r10d
0074c 25ffff0100                     and        eax, 0x1ffff
00751 4d8bc2                         mov        r8, r10
00754 49c1e812                       shr        r8, 0x12
00758 49c1fa24                       sar        r10, 0x24
0075c 458bc0                         mov        r8d, r8d
0075f 458bd2                         mov        r10d, r10d
00762 418bca                         mov        ecx, r10d
00765 4181e0ffff0300                 and        r8d, 0x3ffff
0076c 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
00774 4585d2                         test       r10d, r10d
00777 0f8c97100000                   jl         0x7f4eafe62694
0077d 85c0                           test       eax, eax
0077f 0f8523020000                   jne        0x7f4eafe61828
00785 4533d2                         xor        r10d, r10d
00788 418bc2                         mov        eax, r10d
0078b 448bd1                         mov        r10d, ecx
0078e 4183fa03                       cmp        r10d, 3
00792 0f8e34020000                   jle        0x7f4eafe6184c
00798 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007a0 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
007a4 45895a10                       mov        dword ptr [r10 + 0x10], r11d
007a8 458b5208                       mov        r10d, dword ptr [r10 + 8]
007ac 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
007b4 4589530c                       mov        dword ptr [r11 + 0xc], r10d
007b8 448d51fd                       lea        r10d, [rcx - 3]
007bc 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
007c4 45895308                       mov        dword ptr [r11 + 8], r10d
007c8 4863ac24bc000000               movsxd     rbp, dword ptr [rsp + 0xbc]
007d0 4c63d3                         movsxd     r10, ebx
007d3 4c03542478                     add        r10, qword ptr [rsp + 0x78]
007d8 4863d0                         movsxd     rdx, eax
007db 4c03d2                         add        r10, rdx
007de 493bea                         cmp        rbp, r10
007e1 0f8fad100000                   jg         0x7f4eafe62714
007e7 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
007ef 4585db                         test       r11d, r11d
007f2 0f8efc0f0000                   jle        0x7f4eafe62674
007f8 448d2c03                       lea        r13d, [rbx + rax]
007fc 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00804 4503dd                         add        r11d, r13d
00807 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
0080c 0f8f22110000                   jg         0x7f4eafe627b4
00812 458d1c06                       lea        r11d, [r14 + rax]
00816 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0081e 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00826 0f8f98110000                   jg         0x7f4eafe62844
0082c 83f810                         cmp        eax, 0x10
0082f 0f8f72050000                   jg         0x7f4eafe61c27
00835 443bb424b4000000               cmp        r14d, dword ptr [rsp + 0xb4]
0083d 0f83a10d0000                   jae        0x7f4eafe62464
00843 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0084b c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00852 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
00859 0f832d0e0000                   jae        0x7f4eafe6250c
0085f 468d1430                       lea        r10d, [rax + r14]
00863 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0086b 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00873 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
0087a 448d1418                       lea        r10d, [rax + rbx]
0087e 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00886 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
0088e 442b8424bc000000               sub        r8d, dword ptr [rsp + 0xbc]
00896 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0089e 4183fa10                       cmp        r10d, 0x10
008a2 0f8fa4fbffff                   jg         0x7f4eafe612cc
008a8 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
008b0 4183fb10                       cmp        r11d, 0x10
008b4 0f8c92fbffff                   jl         0x7f4eafe612cc
008ba 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
008c2 0f83980e0000                   jae        0x7f4eafe625e0
008c8 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
008d0 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
008d7 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
008df 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
008e7 0f8239fbffff                   jb         0x7f4eafe612a6
008ed bee4ffffff                     mov        esi, 0xffffffe4
008f2 488b2c24                       mov        rbp, qword ptr [rsp]
008f6 48894424f8                     mov        qword ptr [rsp - 8], rax
008fb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
008ff 89442408                       mov        dword ptr [rsp + 8], eax
00903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00908 48ff742420                     push       qword ptr [rsp + 0x20]
0090d 488f442418                     pop        qword ptr [rsp + 0x18]
00912 48894424f8                     mov        qword ptr [rsp - 8], rax
00917 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0091b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0091f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00924 48894424f8                     mov        qword ptr [rsp - 8], rax
00929 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0092d 89442438                       mov        dword ptr [rsp + 0x38], eax
00931 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00936 48894424f8                     mov        qword ptr [rsp - 8], rax
0093b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0093f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00943 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00948 48ffb42480000000               push       qword ptr [rsp + 0x80]
00950 488f442450                     pop        qword ptr [rsp + 0x50]
00955 48894424f8                     mov        qword ptr [rsp - 8], rax
0095a 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0095e 89442458                       mov        dword ptr [rsp + 0x58], eax
00962 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00967 48894424f8                     mov        qword ptr [rsp - 8], rax
0096c 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00973 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00977 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097c 48894424f8                     mov        qword ptr [rsp - 8], rax
00981 8b442470                       mov        eax, dword ptr [rsp + 0x70]
00985 89442460                       mov        dword ptr [rsp + 0x60], eax
00989 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098e c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00997 90                             nop        
00998 c5f877                         vzeroupper 
0099b e8401eb6ff                     call       0x7f4eaf9c3660
009a0 0f1f8400980a0002               nop        dword ptr [rax + rax + 0x2000a98]
009a8 413bc3                         cmp        eax, r11d
009ab 0f8edafdffff                   jle        0x7f4eafe6160b
009b1 be45ffffff                     mov        esi, 0xffffff45
009b6 8be8                           mov        ebp, eax
009b8 44891c24                       mov        dword ptr [rsp], r11d
009bc c5f877                         vzeroupper 
009bf e81c1eb6ff                     call       0x7f4eaf9c3660
009c4 0f1f8400bc0a0003               nop        dword ptr [rax + rax + 0x3000abc]
009cc 85c0                           test       eax, eax
009ce 7407                           je         0x7f4eafe61857
009d0 448d51ff                       lea        r10d, [rcx - 1]
009d4 418bca                         mov        ecx, r10d
009d7 85c9                           test       ecx, ecx
009d9 7479                           je         0x7f4eafe618d4
009db 83f903                         cmp        ecx, 3
009de 0f84f0170000                   je         0x7f4eafe63054
009e4 83f902                         cmp        ecx, 2
009e7 0f8793180000                   ja         0x7f4eafe63100
009ed 3b4c240c                       cmp        ecx, dword ptr [rsp + 0xc]
009f1 0f8371160000                   jae        0x7f4eafe62ee8
009f7 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
009ff 458b448b08                     mov        r8d, dword ptr [r11 + rcx*4 + 8]
00a04 85c9                           test       ecx, ecx
00a06 7e3e                           jle        0x7f4eafe618c6
00a08 448d51ff                       lea        r10d, [rcx - 1]
00a0c 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00a11 0f830d170000                   jae        0x7f4eafe62fa4
00a17 660f1f840000000000             nop        word ptr [rax + rax]
00a20 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00a28 458b5c8b04                     mov        r11d, dword ptr [r11 + rcx*4 + 4]
00a2d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00a35 45895c8908                     mov        dword ptr [r9 + rcx*4 + 8], r11d
00a3a 448d51ff                       lea        r10d, [rcx - 1]
00a3e 418bca                         mov        ecx, r10d
00a41 4585d2                         test       r10d, r10d
00a44 7fda                           jg         0x7f4eafe618a0
00a46 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a4e 45894208                       mov        dword ptr [r10 + 8], r8d
00a52 eb0c                           jmp        0x7f4eafe618e0
00a54 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a5c 458b4208                       mov        r8d, dword ptr [r10 + 8]
00a60 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00a68 e95bfdffff                     jmp        0x7f4eafe61648
00a6d 4183fb10                       cmp        r11d, 0x10
00a71 0f8da91c0000                   jge        0x7f4eafe635a0
00a77 4183fb08                       cmp        r11d, 8
00a7b 0f8dcc060000                   jge        0x7f4eafe61fcd
00a81 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00a89 4183fa10                       cmp        r10d, 0x10
00a8d 0f8ebb000000                   jle        0x7f4eafe619ce
00a93 4585c0                         test       r8d, r8d
00a96 0f8cc41b0000                   jl         0x7f4eafe634e0
00a9c 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00aa4 4585db                         test       r11d, r11d
00aa7 0f8cb31b0000                   jl         0x7f4eafe634e0
00aad 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00ab2 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00aba 0f82a01b0000                   jb         0x7f4eafe634e0
00ac0 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00ac8 44039c24c4000000               add        r11d, dword ptr [rsp + 0xc4]
00ad0 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00ad8 453bd3                         cmp        r10d, r11d
00adb 0f827f1b0000                   jb         0x7f4eafe634e0
00ae1 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00ae9 4585db                         test       r11d, r11d
00aec 0f8c6e1b0000                   jl         0x7f4eafe634e0
00af2 4585db                         test       r11d, r11d
00af5 0f845df8ffff                   je         0x7f4eafe611d8
00afb 4883fd20                       cmp        rbp, 0x20
00aff 772d                           ja         0x7f4eafe619ae
00b01 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b09 4d63d2                         movsxd     r10, r10d
00b0c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b13 c442a8f5db                     bzhi       r11, r11, r10
00b18 c4c1fb92fb                     kmovq      k7, r11
00b1d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b23 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b29 e92af8ffff                     jmp        0x7f4eafe611d8
00b2e 488bd5                         mov        rdx, rbp
00b31 c5f877                         vzeroupper 
00b34 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00b3e 41ffd2                         call       r10
00b41 0f1f840000000000               nop        dword ptr [rax + rax]
00b49 e90af8ffff                     jmp        0x7f4eafe611d8
00b4e 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00b53 0f83d3170000                   jae        0x7f4eafe631ac
00b59 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00b61 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
00b67 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00b6f 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b74 0f8376180000                   jae        0x7f4eafe63270
00b7a 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00b82 448b8c24c4000000               mov        r9d, dword ptr [rsp + 0xc4]
00b8a 43886c0a08                     mov        byte ptr [r10 + r9 + 8], bpl
00b8f 458d5803                       lea        r11d, [r8 + 3]
00b93 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00b9b 41ffc2                         inc        r10d
00b9e 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00ba6 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00bab 0f83df180000                   jae        0x7f4eafe63310
00bb1 4d63c8                         movsxd     r9, r8d
00bb4 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00bbc 430fbe6c0a09                   movsx      ebp, byte ptr [r10 + r9 + 9]
00bc2 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00bca 4183c303                       add        r11d, 3
00bce 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00bd3 0f835b190000                   jae        0x7f4eafe633b4
00bd9 48638c24c4000000               movsxd     rcx, dword ptr [rsp + 0xc4]
00be1 41886c0a09                     mov        byte ptr [r10 + rcx + 9], bpl
00be6 470fbe540a0a                   movsx      r10d, byte ptr [r10 + r9 + 0xa]
00bec 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00bf4 4588540b0a                     mov        byte ptr [r11 + rcx + 0xa], r10b
00bf9 470fbe5c0b0b                   movsx      r11d, byte ptr [r11 + r9 + 0xb]
00bff 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00c07 45885c0a0b                     mov        byte ptr [r10 + rcx + 0xb], r11b
00c0c 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00c14 4183fb08                       cmp        r11d, 8
00c18 0f83a2190000                   jae        0x7f4eafe63440
00c1e 458bc8                         mov        r9d, r8d
00c21 49ba60ac28e300000000           movabs     r10, 0xe328ac60
00c2b 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00c30 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c35 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c3d 4183fa04                       cmp        r10d, 4
00c41 7e41                           jle        0x7f4eafe61b04
00c43 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00c4a 83c504                         add        ebp, 4
00c4d 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c55 418bd1                         mov        edx, r9d
00c58 c5f877                         vzeroupper 
00c5b e8809da9ff                     call       0x7f4eaf8fb860
00c60 0f1f8400580d0004               nop        dword ptr [rax + rax + 0x4000d58]
00c68 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c70 8bd5                           mov        edx, ebp
00c72 8bc8                           mov        ecx, eax
00c74 c5f877                         vzeroupper 
00c77 e8649da9ff                     call       0x7f4eaf8fb860
00c7c 0f1f8400740d0005               nop        dword ptr [rax + rax + 0x5000d74]
00c84 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c8c 4183fb08                       cmp        r11d, 8
00c90 7e62                           jle        0x7f4eafe61b74
00c92 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00c96 49ba88ac28e300000000           movabs     r10, 0xe328ac88
00ca0 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00ca8 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00cad 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00cb4 83c508                         add        ebp, 8
00cb7 83c208                         add        edx, 8
00cba 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cc2 6690                           nop        
00cc4 c5f877                         vzeroupper 
00cc7 e8149da9ff                     call       0x7f4eaf8fb860
00ccc 0f1f8400c40d0006               nop        dword ptr [rax + rax + 0x6000dc4]
00cd4 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cdc 8bd5                           mov        edx, ebp
00cde 488bc8                         mov        rcx, rax
00ce1 666690                         nop        
00ce4 c5f877                         vzeroupper 
00ce7 e8f49ca9ff                     call       0x7f4eaf8fb860
00cec 0f1f8400e40d0007               nop        dword ptr [rax + rax + 0x7000de4]
00cf4 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00cfb e9e3f9ffff                     jmp        0x7f4eafe61563
00d00 4d63d3                         movsxd     r10, r11d
00d03 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d0a c442a8f5db                     bzhi       r11, r11, r10
00d0f c4c1fb92fb                     kmovq      k7, r11
00d14 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d1a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d20 eb67                           jmp        0x7f4eafe61c09
00d22 4585f6                         test       r14d, r14d
00d25 0f8ce91a0000                   jl         0x7f4eafe63694
00d2b 85db                           test       ebx, ebx
00d2d 0f8ce11a0000                   jl         0x7f4eafe63694
00d33 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00d38 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00d3d 0f82d11a0000                   jb         0x7f4eafe63694
00d43 428d2c1b                       lea        ebp, [rbx + r11]
00d47 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d4c 443bc5                         cmp        r8d, ebp
00d4f 0f82bf1a0000                   jb         0x7f4eafe63694
00d55 4585db                         test       r11d, r11d
00d58 0f8cb61a0000                   jl         0x7f4eafe63694
00d5e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d63 453bd6                         cmp        r10d, r14d
00d66 7421                           je         0x7f4eafe61c09
00d68 4963d3                         movsxd     rdx, r11d
00d6b 4883fa20                       cmp        rdx, 0x20
00d6f 768f                           jbe        0x7f4eafe61b80
00d71 c5f877                         vzeroupper 
00d74 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00d7e 41ffd2                         call       r10
00d81 0f1f840000000000               nop        dword ptr [rax + rax]
00d89 4c8b1424                       mov        r10, qword ptr [rsp]
00d8d 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00d91 c5f877                         vzeroupper 
00d94 4881c4f0000000                 add        rsp, 0xf0
00d9b 5d                             pop        rbp
00d9c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00da0 0f876e200000                   ja         0x7f4eafe63c94
00da6 c3                             ret        
00da7 83f830                         cmp        eax, 0x30
00daa 0f8e83000000                   jle        0x7f4eafe61cb3
00db0 4585f6                         test       r14d, r14d
00db3 0f8c371e0000                   jl         0x7f4eafe63a70
00db9 85db                           test       ebx, ebx
00dbb 0f8c2f1e0000                   jl         0x7f4eafe63a70
00dc1 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00dc6 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
00dce 0f821c1e0000                   jb         0x7f4eafe63a70
00dd4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00dd9 453bdd                         cmp        r11d, r13d
00ddc 0f820e1e0000                   jb         0x7f4eafe63a70
00de2 85c0                           test       eax, eax
00de4 7426                           je         0x7f4eafe61c8c
00de6 4883fa20                       cmp        rdx, 0x20
00dea 772d                           ja         0x7f4eafe61c99
00dec 4c63d0                         movsxd     r10, eax
00def 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00df6 c442a8f5db                     bzhi       r11, r11, r10
00dfb c4c1fb92fb                     kmovq      k7, r11
00e00 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e06 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e0c 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
00e14 e96dfaffff                     jmp        0x7f4eafe61706
00e19 c5f877                         vzeroupper 
00e1c 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00e26 41ffd2                         call       r10
00e29 0f1f840000000000               nop        dword ptr [rax + rax]
00e31 ebd9                           jmp        0x7f4eafe61c8c
00e33 443bb424b4000000               cmp        r14d, dword ptr [rsp + 0xb4]
00e3b 0f832b1c0000                   jae        0x7f4eafe638ec
00e41 4d63d6                         movsxd     r10, r14d
00e44 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00e4c c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00e53 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
00e5a 0f83cc1c0000                   jae        0x7f4eafe639ac
00e60 448d5b10                       lea        r11d, [rbx + 0x10]
00e64 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e6c 4c63db                         movsxd     r11, ebx
00e6f 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00e77 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00e7e 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00e85 413bcd                         cmp        ecx, r13d
00e88 0f8da8020000                   jge        0x7f4eafe61fb6
00e8e 4d2bd3                         sub        r10, r11
00e91 4c63c1                         movsxd     r8, ecx
00e94 4c634c241c                     movsxd     r9, dword ptr [rsp + 0x1c]
00e99 4983c1f1                       add        r9, -0xf
00e9d 4f8d1c10                       lea        r11, [r8 + r10]
00ea1 4d3bd9                         cmp        r11, r9
00ea4 0f83121e0000                   jae        0x7f4eafe63b3c
00eaa 4d63dd                         movsxd     r11, r13d
00ead 498bfb                         mov        rdi, r11
00eb0 492bf8                         sub        rdi, r8
00eb3 4883c70f                       add        rdi, 0xf
00eb7 4883e7f0                       and        rdi, 0xfffffffffffffff0
00ebb 448bc7                         mov        r8d, edi
00ebe 458d441810                     lea        r8d, [r8 + rbx + 0x10]
00ec3 4d63c0                         movsxd     r8, r8d
00ec6 4f8d5410f0                     lea        r10, [r8 + r10 - 0x10]
00ecb 4d3bd1                         cmp        r10, r9
00ece 0f83e81d0000                   jae        0x7f4eafe63b3c
00ed4 3b8c24b0000000                 cmp        ecx, dword ptr [rsp + 0xb0]
00edb 0f83db1d0000                   jae        0x7f4eafe63b3c
00ee1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ee6 4983c2f1                       add        r10, -0xf
00eea 4983c0f0                       add        r8, -0x10
00eee 4d3bc2                         cmp        r8, r10
00ef1 0f83c51d0000                   jae        0x7f4eafe63b3c
00ef7 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00efe 0f8f481e0000                   jg         0x7f4eafe63bcc
00f04 418bce                         mov        ecx, r14d
00f07 2bcb                           sub        ecx, ebx
00f09 83c320                         add        ebx, 0x20
00f0c 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f14 448bc1                         mov        r8d, ecx
00f17 44038424c0000000               add        r8d, dword ptr [rsp + 0xc0]
00f1f 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00f27 c4817a6f440108                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 8]
00f2e 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00f36 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00f3d 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
00f45 4183c010                       add        r8d, 0x10
00f49 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00f51 458bd0                         mov        r10d, r8d
00f54 443bc3                         cmp        r8d, ebx
00f57 7cb3                           jl         0x7f4eafe61d8c
00f59 4981c310ffffff                 add        r11, -0xf0
00f60 4981fb00000080                 cmp        r11, -0x80000000
00f67 49c7c000000080                 mov        r8, 0xffffffff80000000
00f6e 4d0f4cd8                       cmovl      r11, r8
00f72 458bcb                         mov        r9d, r11d
00f75 453bd1                         cmp        r10d, r9d
00f78 0f8d73010000                   jge        0x7f4eafe61f71
00f7e 458bda                         mov        r11d, r10d
00f81 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00f89 0f1f8000000000                 nop        dword ptr [rax]
00f90 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f98 4d63d2                         movsxd     r10, r10d
00f9b 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00fa3 8bd9                           mov        ebx, ecx
00fa5 039c24c0000000                 add        ebx, dword ptr [rsp + 0xc0]
00fac 448bc3                         mov        r8d, ebx
00faf 488bbc2498000000               mov        rdi, qword ptr [rsp + 0x98]
00fb7 c5fa6f441f08                   vmovdqu    xmm0, xmmword ptr [rdi + rbx + 8]
00fbd 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
00fc5 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
00fcc 4d63c0                         movsxd     r8, r8d
00fcf c4a17a6f440718                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x18]
00fd6 c4a17a7f441318                 vmovdqu    xmmword ptr [rbx + r10 + 0x18], xmm0
00fdd c4a17a6f440728                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x28]
00fe4 c4a17a7f441328                 vmovdqu    xmmword ptr [rbx + r10 + 0x28], xmm0
00feb c4a17a6f440738                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x38]
00ff2 c4a17a7f441338                 vmovdqu    xmmword ptr [rbx + r10 + 0x38], xmm0
00ff9 c4a17a6f440748                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x48]
01000 c4a17a7f441348                 vmovdqu    xmmword ptr [rbx + r10 + 0x48], xmm0
01007 c4a17a6f440758                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x58]
0100e c4a17a7f441358                 vmovdqu    xmmword ptr [rbx + r10 + 0x58], xmm0
01015 c4a17a6f440768                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x68]
0101c c4a17a7f441368                 vmovdqu    xmmword ptr [rbx + r10 + 0x68], xmm0
01023 c4a17a6f440778                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x78]
0102a c4a17a7f441378                 vmovdqu    xmmword ptr [rbx + r10 + 0x78], xmm0
01031 c4a17a6f840788000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x88]
0103b c4a17a7f841388000000           vmovdqu    xmmword ptr [rbx + r10 + 0x88], xmm0
01045 c4a17a6f840798000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x98]
0104f c4a17a7f841398000000           vmovdqu    xmmword ptr [rbx + r10 + 0x98], xmm0
01059 c4a17a6f8407a8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xa8]
01063 c4a17a7f8413a8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xa8], xmm0
0106d c4a17a6f8407b8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xb8]
01077 c4a17a7f8413b8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xb8], xmm0
01081 c4a17a6f8407c8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xc8]
0108b c4a17a7f8413c8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xc8], xmm0
01095 c4a17a6f8407d8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xd8]
0109f c4a17a7f8413d8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xd8], xmm0
010a9 c4a17a6f8407e8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xe8]
010b3 c4a17a7f8413e8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xe8], xmm0
010bd c4a17a6f8407f8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xf8]
010c7 c4a17a7f8413f8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xf8], xmm0
010d1 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
010d9 4181c200010000                 add        r10d, 0x100
010e0 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
010e8 453bd1                         cmp        r10d, r9d
010eb 0f8c9ffeffff                   jl         0x7f4eafe61e10
010f1 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
010f9 453bdd                         cmp        r11d, r13d
010fc 7d38                           jge        0x7f4eafe61fb6
010fe 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
01106 6690                           nop        
01108 468d1c09                       lea        r11d, [rcx + r9]
0110c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01114 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
0111b 458bd1                         mov        r10d, r9d
0111e 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01126 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0112d 4183c110                       add        r9d, 0x10
01131 453bcd                         cmp        r9d, r13d
01134 7cd2                           jl         0x7f4eafe61f88
01136 4103c6                         add        eax, r14d
01139 898424c0000000                 mov        dword ptr [rsp + 0xc0], eax
01140 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
01148 e939f7ffff                     jmp        0x7f4eafe61706
0114d 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
01155 0f83e1160000                   jae        0x7f4eafe636bc
0115b 4963d0                         movsxd     rdx, r8d
0115e 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01166 4d8b541208                     mov        r10, qword ptr [r10 + rdx + 8]
0116b 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01173 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
0117b 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
01183 0f8363170000                   jae        0x7f4eafe6376c
01189 458d4a08                       lea        r9d, [r10 + 8]
0118d 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
01195 4d63da                         movsxd     r11, r10d
01198 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
011a0 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
011a8 4b895c1908                     mov        qword ptr [r9 + r11 + 8], rbx
011ad 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
011b4 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
011bb 0f8da0030000                   jge        0x7f4eafe623e1
011c1 492bd3                         sub        rdx, r11
011c4 4863fb                         movsxd     rdi, ebx
011c7 4c8d1c17                       lea        r11, [rdi + rdx]
011cb 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
011d0 0f83b6170000                   jae        0x7f4eafe6380c
011d6 4c8bd9                         mov        r11, rcx
011d9 4c2bdf                         sub        r11, rdi
011dc 4983c307                       add        r11, 7
011e0 4983e3f8                       and        r11, 0xfffffffffffffff8
011e4 458bcb                         mov        r9d, r11d
011e7 478d5c1108                     lea        r11d, [r9 + r10 + 8]
011ec 4d63db                         movsxd     r11, r11d
011ef 4d8d4c13f8                     lea        r9, [r11 + rdx - 8]
011f4 4c3b4c2438                     cmp        r9, qword ptr [rsp + 0x38]
011f9 0f838d170000                   jae        0x7f4eafe6380c
011ff 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
01206 0f8380170000                   jae        0x7f4eafe6380c
0120c 4983c3f8                       add        r11, -8
01210 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
01215 0f8371170000                   jae        0x7f4eafe6380c
0121b 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
01223 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
0122a 0f8fd4170000                   jg         0x7f4eafe63884
01230 452bc2                         sub        r8d, r10d
01233 bef8ffffff                     mov        esi, 0xfffffff8
01238 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01240 4d8bcb                         mov        r9, r11
01243 4c8d59c8                       lea        r11, [rcx - 0x38]
01247 4981fb00000080                 cmp        r11, -0x80000000
0124e 48c7c300000080                 mov        rbx, 0xffffffff80000000
01255 4c0f4cdb                       cmovl      r11, rbx
01259 418bd3                         mov        edx, r11d
0125c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01264 458bdb                         mov        r11d, r11d
01267 412bf3                         sub        esi, r11d
0126a 412bf2                         sub        esi, r10d
0126d 4183c210                       add        r10d, 0x10
01271 418bda                         mov        ebx, r10d
01274 83c6f0                         add        esi, -0x10
01277 4d63d2                         movsxd     r10, r10d
0127a 41bb06000000                   mov        r11d, 6
01280 c462a0f5de                     bzhi       r11, rsi, r11
01285 4d03d3                         add        r10, r11
01288 4c3bd1                         cmp        r10, rcx
0128b 4c8bd9                         mov        r11, rcx
0128e 4d0f4cda                       cmovl      r11, r10
01292 4d8bd3                         mov        r10, r11
01295 4c2bd7                         sub        r10, rdi
01298 498d72ff                       lea        rsi, [r10 - 1]
0129c 48c1fe3f                       sar        rsi, 0x3f
012a0 48c1ee3d                       shr        rsi, 0x3d
012a4 4e8d5416ff                     lea        r10, [rsi + r10 - 1]
012a9 4983e2f8                       and        r10, 0xfffffffffffffff8
012ad 4c03d7                         add        r10, rdi
012b0 493bfa                         cmp        rdi, r10
012b3 490f4cfa                       cmovl      rdi, r10
012b7 448bd7                         mov        r10d, edi
012ba 418d7208                       lea        esi, [r10 + 8]
012be 442b9424bc000000               sub        r10d, dword ptr [rsp + 0xbc]
012c6 4863f6                         movsxd     rsi, esi
012c9 4903f1                         add        rsi, r9
012cc 4183c208                       add        r10d, 8
012d0 4963fa                         movsxd     rdi, r10d
012d3 4903f9                         add        rdi, r9
012d6 4c8d4e48                       lea        r9, [rsi + 0x48]
012da 4883c608                       add        rsi, 8
012de 488d4708                       lea        rax, [rdi + 8]
012e2 4533d2                         xor        r10d, r10d
012e5 4c3bc8                         cmp        r9, rax
012e8 410f96c2                       setbe      r10b
012ec 4883c748                       add        rdi, 0x48
012f0 4533c9                         xor        r9d, r9d
012f3 483bfe                         cmp        rdi, rsi
012f6 410f96c1                       setbe      r9b
012fa 450bd1                         or         r10d, r9d
012fd 0f84110c0000                   je         0x7f4eafe62d94
01303 458bd3                         mov        r10d, r11d
01306 6690                           nop        
01308 458bc8                         mov        r9d, r8d
0130b 44038c24b8000000               add        r9d, dword ptr [rsp + 0xb8]
01313 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0131b 4f8b5c0b08                     mov        r11, qword ptr [r11 + r9 + 8]
01320 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
01327 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0132f 4d895c1908                     mov        qword ptr [r9 + rbx + 8], r11
01334 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
0133c 4183c108                       add        r9d, 8
01340 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
01348 453bca                         cmp        r9d, r10d
0134b 7cbb                           jl         0x7f4eafe62188
0134d 4881c108feffff                 add        rcx, -0x1f8
01354 4881f900000080                 cmp        rcx, -0x80000000
0135b 49c7c200000080                 mov        r10, 0xffffffff80000000
01362 490f4cca                       cmovl      rcx, r10
01366 8bd9                           mov        ebx, ecx
01368 443bcb                         cmp        r9d, ebx
0136b 0f8da9010000                   jge        0x7f4eafe6239a
01371 458bd1                         mov        r10d, r9d
01374 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0137c 0f1f4000                       nop        dword ptr [rax]
01380 458bd8                         mov        r11d, r8d
01383 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
0138b 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01393 4181c100010000                 add        r9d, 0x100
0139a 4503c8                         add        r9d, r8d
0139d 458bd3                         mov        r10d, r11d
013a0 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
013a8 62b17e486f841108000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 8]
013b3 4963cb                         movsxd     rcx, r11d
013b6 458bd9                         mov        r11d, r9d
013b9 4963f9                         movsxd     rdi, r9d
013bc 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
013c4 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
013cc 62917e487f840a08000000         vmovdqu32  zmmword ptr [r10 + r9 + 8], zmm0
013d7 62d17e486f840a48000000         vmovdqu32  zmm0, zmmword ptr [r10 + rcx + 0x48]
013e2 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
013ea 4963c2                         movsxd     rax, r10d
013ed 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
013f5 62d17e487f840248000000         vmovdqu32  zmmword ptr [r10 + rax + 0x48], zmm0
01400 8bb424b8000000                 mov        esi, dword ptr [rsp + 0xb8]
01407 81c680000000                   add        esi, 0x80
0140d 4103f0                         add        esi, r8d
01410 448bce                         mov        r9d, esi
01413 62d17e486f843208000000         vmovdqu32  zmm0, zmmword ptr [r10 + rsi + 8]
0141e 62d17e487f840288000000         vmovdqu32  zmmword ptr [r10 + rax + 0x88], zmm0
01429 4d63d1                         movsxd     r10, r9d
0142c 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
01434 62917e486f841148000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0x48]
0143f 62d17e487f8401c8000000         vmovdqu32  zmmword ptr [r9 + rax + 0xc8], zmm0
0144a 62917e486f841908000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 8]
01455 62d17e487f840108010000         vmovdqu32  zmmword ptr [r9 + rax + 0x108], zmm0
01460 62d17e486f843948000000         vmovdqu32  zmm0, zmmword ptr [r9 + rdi + 0x48]
0146b 62d17e487f840148010000         vmovdqu32  zmmword ptr [r9 + rax + 0x148], zmm0
01476 62d17e486f840988010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x188]
01481 62d17e487f840188010000         vmovdqu32  zmmword ptr [r9 + rax + 0x188], zmm0
0148c 62d17e486f8409c8010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x1c8]
01497 62d17e487f8401c8010000         vmovdqu32  zmmword ptr [r9 + rax + 0x1c8], zmm0
014a2 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
014aa 4181c300020000                 add        r11d, 0x200
014b1 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
014b9 443bdb                         cmp        r11d, ebx
014bc 0f8cbefeffff                   jl         0x7f4eafe62200
014c2 443bda                         cmp        r11d, edx
014c5 7d53                           jge        0x7f4eafe6239a
014c7 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
014cf 90                             nop        
014d0 458bd0                         mov        r10d, r8d
014d3 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
014db 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
014e3 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
014ee 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
014f6 62917e487f841308000000         vmovdqu32  zmmword ptr [r11 + r10 + 8], zmm0
01501 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01509 4183c240                       add        r10d, 0x40
0150d 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01515 443bd2                         cmp        r10d, edx
01518 7cb6                           jl         0x7f4eafe62350
0151a 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01522 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
0152a 7d35                           jge        0x7f4eafe623e1
0152c 8b8c24b8000000                 mov        ecx, dword ptr [rsp + 0xb8]
01533 90                             nop        
01534 458d1408                       lea        r10d, [r8 + rcx]
01538 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01540 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01545 448bd9                         mov        r11d, ecx
01548 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
01550 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
01555 83c108                         add        ecx, 8
01558 3b8c24c8000000                 cmp        ecx, dword ptr [rsp + 0xc8]
0155f 7cd3                           jl         0x7f4eafe623b4
01561 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
01568 e976f1ffff                     jmp        0x7f4eafe61563
0156d bee4ffffff                     mov        esi, 0xffffffe4
01572 488b2c24                       mov        rbp, qword ptr [rsp]
01576 48894424f8                     mov        qword ptr [rsp - 8], rax
0157b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0157f 89442408                       mov        dword ptr [rsp + 8], eax
01583 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01588 48ff742420                     push       qword ptr [rsp + 0x20]
0158d 488f442418                     pop        qword ptr [rsp + 0x18]
01592 48894424f8                     mov        qword ptr [rsp - 8], rax
01597 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0159b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0159f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a4 895c2430                       mov        dword ptr [rsp + 0x30], ebx
015a8 4489742434                     mov        dword ptr [rsp + 0x34], r14d
015ad 48894424f8                     mov        qword ptr [rsp - 8], rax
015b2 8b442468                       mov        eax, dword ptr [rsp + 0x68]
015b6 89442438                       mov        dword ptr [rsp + 0x38], eax
015ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015bf 48894424f8                     mov        qword ptr [rsp - 8], rax
015c4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
015c8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d1 666690                         nop        
015d4 c5f877                         vzeroupper 
015d7 e80412b6ff                     call       0x7f4eaf9c3660
015dc 0f1f8400d4160008               nop        dword ptr [rax + rax + 0x80016d4]
015e4 bee4ffffff                     mov        esi, 0xffffffe4
015e9 488b2c24                       mov        rbp, qword ptr [rsp]
015ed 48894424f8                     mov        qword ptr [rsp - 8], rax
015f2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015f6 89442408                       mov        dword ptr [rsp + 8], eax
015fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ff 48ff742420                     push       qword ptr [rsp + 0x20]
01604 488f442418                     pop        qword ptr [rsp + 0x18]
01609 48894424f8                     mov        qword ptr [rsp - 8], rax
0160e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01612 8944240c                       mov        dword ptr [rsp + 0xc], eax
01616 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0161b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0161f 48894424f8                     mov        qword ptr [rsp - 8], rax
01624 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01628 89442438                       mov        dword ptr [rsp + 0x38], eax
0162c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01631 48ff742478                     push       qword ptr [rsp + 0x78]
01636 488f442440                     pop        qword ptr [rsp + 0x40]
0163b 48894424f8                     mov        qword ptr [rsp - 8], rax
01640 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01644 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01648 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164d 48894424f8                     mov        qword ptr [rsp - 8], rax
01652 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01656 89442458                       mov        dword ptr [rsp + 0x58], eax
0165a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165f 48894424f8                     mov        qword ptr [rsp - 8], rax
01664 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01668 89442460                       mov        dword ptr [rsp + 0x60], eax
0166c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01671 89442464                       mov        dword ptr [rsp + 0x64], eax
01675 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0167a 6690                           nop        
0167c c5f877                         vzeroupper 
0167f e85c11b6ff                     call       0x7f4eaf9c3660
01684 0f1f84007c170009               nop        dword ptr [rax + rax + 0x900177c]
0168c bee4ffffff                     mov        esi, 0xffffffe4
01691 488b2c24                       mov        rbp, qword ptr [rsp]
01695 48894424f8                     mov        qword ptr [rsp - 8], rax
0169a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0169e 89442408                       mov        dword ptr [rsp + 8], eax
016a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a7 48ff742420                     push       qword ptr [rsp + 0x20]
016ac 488f442418                     pop        qword ptr [rsp + 0x18]
016b1 48894424f8                     mov        qword ptr [rsp - 8], rax
016b6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016ba 8944240c                       mov        dword ptr [rsp + 0xc], eax
016be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
016c8 48894424f8                     mov        qword ptr [rsp - 8], rax
016cd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016d1 89442438                       mov        dword ptr [rsp + 0x38], eax
016d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016da 48ff742478                     push       qword ptr [rsp + 0x78]
016df 488f442440                     pop        qword ptr [rsp + 0x40]
016e4 48894424f8                     mov        qword ptr [rsp - 8], rax
016e9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
016ed 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f6 48ffb42480000000               push       qword ptr [rsp + 0x80]
016fe 488f442450                     pop        qword ptr [rsp + 0x50]
01703 48894424f8                     mov        qword ptr [rsp - 8], rax
01708 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0170c 89442458                       mov        dword ptr [rsp + 0x58], eax
01710 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01715 48894424f8                     mov        qword ptr [rsp - 8], rax
0171a 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01721 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01725 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0172a 48894424f8                     mov        qword ptr [rsp - 8], rax
0172f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01733 89442460                       mov        dword ptr [rsp + 0x60], eax
01737 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173c 89442464                       mov        dword ptr [rsp + 0x64], eax
01740 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01744 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0174d 666690                         nop        
01750 c5f877                         vzeroupper 
01753 e88810b6ff                     call       0x7f4eaf9c3660
01758 0f1f84005018000a               nop        dword ptr [rax + rax + 0xa001850]
01760 bee4ffffff                     mov        esi, 0xffffffe4
01765 488b2c24                       mov        rbp, qword ptr [rsp]
01769 48894424f8                     mov        qword ptr [rsp - 8], rax
0176e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01772 89442408                       mov        dword ptr [rsp + 8], eax
01776 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177b 48ff742420                     push       qword ptr [rsp + 0x20]
01780 488f442418                     pop        qword ptr [rsp + 0x18]
01785 48894424f8                     mov        qword ptr [rsp - 8], rax
0178a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0178e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01792 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01797 48894424f8                     mov        qword ptr [rsp - 8], rax
0179c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017a0 89442438                       mov        dword ptr [rsp + 0x38], eax
017a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a9 48894424f8                     mov        qword ptr [rsp - 8], rax
017ae 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017b2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017bb 48894424f8                     mov        qword ptr [rsp - 8], rax
017c0 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017c4 89442458                       mov        dword ptr [rsp + 0x58], eax
017c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cd 48894424f8                     mov        qword ptr [rsp - 8], rax
017d2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
017d6 89442460                       mov        dword ptr [rsp + 0x60], eax
017da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017df 4489442470                     mov        dword ptr [rsp + 0x70], r8d
017e4 c5f877                         vzeroupper 
017e7 e8f40fb6ff                     call       0x7f4eaf9c3660
017ec 0f1f8400e418000b               nop        dword ptr [rax + rax + 0xb0018e4]
017f4 be45ffffff                     mov        esi, 0xffffff45
017f9 488b2c24                       mov        rbp, qword ptr [rsp]
017fd 4c89542408                     mov        qword ptr [rsp + 8], r10
01802 6690                           nop        
01804 c5f877                         vzeroupper 
01807 e8d40fb6ff                     call       0x7f4eaf9c3660
0180c 0f1f84000419000c               nop        dword ptr [rax + rax + 0xc001904]
01814 be45ffffff                     mov        esi, 0xffffff45
01819 488b2c24                       mov        rbp, qword ptr [rsp]
0181d 48894424f8                     mov        qword ptr [rsp - 8], rax
01822 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01826 89442408                       mov        dword ptr [rsp + 8], eax
0182a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182f 48ff742420                     push       qword ptr [rsp + 0x20]
01834 488f442418                     pop        qword ptr [rsp + 0x18]
01839 48894424f8                     mov        qword ptr [rsp - 8], rax
0183e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01842 8944240c                       mov        dword ptr [rsp + 0xc], eax
01846 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0184f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01854 48894424f8                     mov        qword ptr [rsp - 8], rax
01859 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0185d 89442438                       mov        dword ptr [rsp + 0x38], eax
01861 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01866 48894424f8                     mov        qword ptr [rsp - 8], rax
0186b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0186f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01873 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01878 89442464                       mov        dword ptr [rsp + 0x64], eax
0187c 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01881 666690                         nop        
01884 c5f877                         vzeroupper 
01887 e8540fb6ff                     call       0x7f4eaf9c3660
0188c 0f1f84008419000d               nop        dword ptr [rax + rax + 0xd001984]
01894 493bea                         cmp        rbp, r10
01897 bdffffffff                     mov        ebp, 0xffffffff
0189c 7c08                           jl         0x7f4eafe62726
0189e 400f95c5                       setne      bpl
018a2 400fb6ed                       movzx      ebp, bpl
018a6 be45ffffff                     mov        esi, 0xffffff45
018ab 48894424f8                     mov        qword ptr [rsp - 8], rax
018b0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018b4 89442414                       mov        dword ptr [rsp + 0x14], eax
018b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bd 895c2438                       mov        dword ptr [rsp + 0x38], ebx
018c1 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
018c6 48894424f8                     mov        qword ptr [rsp - 8], rax
018cb 8b442468                       mov        eax, dword ptr [rsp + 0x68]
018cf 89442440                       mov        dword ptr [rsp + 0x40], eax
018d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d8 48ff742478                     push       qword ptr [rsp + 0x78]
018dd 488f442448                     pop        qword ptr [rsp + 0x48]
018e2 48894424f8                     mov        qword ptr [rsp - 8], rax
018e7 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
018eb 89442444                       mov        dword ptr [rsp + 0x44], eax
018ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f4 48894424f8                     mov        qword ptr [rsp - 8], rax
018f9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
018fd 89442460                       mov        dword ptr [rsp + 0x60], eax
01901 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01906 48894424f8                     mov        qword ptr [rsp - 8], rax
0190b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0190f 89442468                       mov        dword ptr [rsp + 0x68], eax
01913 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01918 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0191c 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01921 666690                         nop        
01924 c5f877                         vzeroupper 
01927 e8b40eb6ff                     call       0x7f4eaf9c3660
0192c 0f1f8400241a000e               nop        dword ptr [rax + rax + 0xe001a24]
01934 be45ffffff                     mov        esi, 0xffffff45
01939 488b2c24                       mov        rbp, qword ptr [rsp]
0193d 48894424f8                     mov        qword ptr [rsp - 8], rax
01942 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01946 89442408                       mov        dword ptr [rsp + 8], eax
0194a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194f 48ff742420                     push       qword ptr [rsp + 0x20]
01954 488f442418                     pop        qword ptr [rsp + 0x18]
01959 48894424f8                     mov        qword ptr [rsp - 8], rax
0195e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01962 8944240c                       mov        dword ptr [rsp + 0xc], eax
01966 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0196f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01974 48894424f8                     mov        qword ptr [rsp - 8], rax
01979 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0197d 89442438                       mov        dword ptr [rsp + 0x38], eax
01981 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01986 48894424f8                     mov        qword ptr [rsp - 8], rax
0198b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0198f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01993 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01998 48894424f8                     mov        qword ptr [rsp - 8], rax
0199d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019a1 89442460                       mov        dword ptr [rsp + 0x60], eax
019a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019aa 89442464                       mov        dword ptr [rsp + 0x64], eax
019ae 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
019b3 90                             nop        
019b4 c5f877                         vzeroupper 
019b7 e8240eb6ff                     call       0x7f4eaf9c3660
019bc 0f1f8400b41a000f               nop        dword ptr [rax + rax + 0xf001ab4]
019c4 be45ffffff                     mov        esi, 0xffffff45
019c9 488b2c24                       mov        rbp, qword ptr [rsp]
019cd 48894424f8                     mov        qword ptr [rsp - 8], rax
019d2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019d6 89442408                       mov        dword ptr [rsp + 8], eax
019da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019df 48ff742420                     push       qword ptr [rsp + 0x20]
019e4 488f442418                     pop        qword ptr [rsp + 0x18]
019e9 48894424f8                     mov        qword ptr [rsp - 8], rax
019ee 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019f2 8944240c                       mov        dword ptr [rsp + 0xc], eax
019f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019ff 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a04 48894424f8                     mov        qword ptr [rsp - 8], rax
01a09 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a0d 89442438                       mov        dword ptr [rsp + 0x38], eax
01a11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a16 48894424f8                     mov        qword ptr [rsp - 8], rax
01a1b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a1f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a28 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a31 89442458                       mov        dword ptr [rsp + 0x58], eax
01a35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a43 89442460                       mov        dword ptr [rsp + 0x60], eax
01a47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4c 89442464                       mov        dword ptr [rsp + 0x64], eax
01a50 c5f877                         vzeroupper 
01a53 e8880db6ff                     call       0x7f4eaf9c3660
01a58 0f1f8400501b0010               nop        dword ptr [rax + rax + 0x10001b50]
01a60 bee4ffffff                     mov        esi, 0xffffffe4
01a65 488b2c24                       mov        rbp, qword ptr [rsp]
01a69 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a72 89442408                       mov        dword ptr [rsp + 8], eax
01a76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7b 48ff742420                     push       qword ptr [rsp + 0x20]
01a80 488f442418                     pop        qword ptr [rsp + 0x18]
01a85 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a8e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a97 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01aa0 89442438                       mov        dword ptr [rsp + 0x38], eax
01aa4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa9 48ff742478                     push       qword ptr [rsp + 0x78]
01aae 488f442440                     pop        qword ptr [rsp + 0x40]
01ab3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab8 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01abc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ac0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac5 48ffb42480000000               push       qword ptr [rsp + 0x80]
01acd 488f442450                     pop        qword ptr [rsp + 0x50]
01ad2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01adb 89442458                       mov        dword ptr [rsp + 0x58], eax
01adf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01af0 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01af4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af9 48894424f8                     mov        qword ptr [rsp - 8], rax
01afe 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b02 89442460                       mov        dword ptr [rsp + 0x60], eax
01b06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0b 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01b13 90                             nop        
01b14 c5f877                         vzeroupper 
01b17 e8c40cb6ff                     call       0x7f4eaf9c3660
01b1c 0f1f8400141c0011               nop        dword ptr [rax + rax + 0x11001c14]
01b24 bee4ffffff                     mov        esi, 0xffffffe4
01b29 488b2c24                       mov        rbp, qword ptr [rsp]
01b2d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b32 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b36 89442408                       mov        dword ptr [rsp + 8], eax
01b3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b3f 48ff742420                     push       qword ptr [rsp + 0x20]
01b44 488f442418                     pop        qword ptr [rsp + 0x18]
01b49 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b52 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b60 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b64 89442438                       mov        dword ptr [rsp + 0x38], eax
01b68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6d 48ff742478                     push       qword ptr [rsp + 0x78]
01b72 488f442440                     pop        qword ptr [rsp + 0x40]
01b77 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b80 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b89 48ffb42480000000               push       qword ptr [rsp + 0x80]
01b91 488f442450                     pop        qword ptr [rsp + 0x50]
01b96 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01b9f 89442458                       mov        dword ptr [rsp + 0x58], eax
01ba3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bad 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01bb4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01bb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01bc2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01bc6 89442460                       mov        dword ptr [rsp + 0x60], eax
01bca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bcf 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01bd4 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01bd9 666690                         nop        
01bdc c5f877                         vzeroupper 
01bdf e8fc0bb6ff                     call       0x7f4eaf9c3660
01be4 0f1f8400dc1c0012               nop        dword ptr [rax + rax + 0x12001cdc]
01bec 4533d2                         xor        r10d, r10d
01bef 4c891424                       mov        qword ptr [rsp], r10
01bf3 e949e5ffff                     jmp        0x7f4eafe60fc1
01bf8 4533d2                         xor        r10d, r10d
01bfb 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01c03 e963e5ffff                     jmp        0x7f4eafe60feb
01c08 4533d2                         xor        r10d, r10d
01c0b 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01c13 e982e5ffff                     jmp        0x7f4eafe6101a
01c18 4533d2                         xor        r10d, r10d
01c1b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c20 e99ce5ffff                     jmp        0x7f4eafe61041
01c25 4533d2                         xor        r10d, r10d
01c28 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01c30 e9bbe5ffff                     jmp        0x7f4eafe61070
01c35 4533d2                         xor        r10d, r10d
01c38 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01c40 e9d5e5ffff                     jmp        0x7f4eafe6109a
01c45 4183c008                       add        r8d, 8
01c49 be6effffff                     mov        esi, 0xffffff6e
01c4e 488b2c24                       mov        rbp, qword ptr [rsp]
01c52 48894424f8                     mov        qword ptr [rsp - 8], rax
01c57 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c5b 89442408                       mov        dword ptr [rsp + 8], eax
01c5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c64 48ff742420                     push       qword ptr [rsp + 0x20]
01c69 488f442418                     pop        qword ptr [rsp + 0x18]
01c6e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c73 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c77 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c80 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01c85 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8a 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c8e 89442438                       mov        dword ptr [rsp + 0x38], eax
01c92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c97 48ff742478                     push       qword ptr [rsp + 0x78]
01c9c 488f442440                     pop        qword ptr [rsp + 0x40]
01ca1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca6 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01caa 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb3 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01cbc 89442458                       mov        dword ptr [rsp + 0x58], eax
01cc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cca 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01cce 89442460                       mov        dword ptr [rsp + 0x60], eax
01cd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdc 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
01ce3 89442468                       mov        dword ptr [rsp + 0x68], eax
01ce7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cec 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01cf1 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01cf5 666690                         nop        
01cf8 c5f877                         vzeroupper 
01cfb e8e00ab6ff                     call       0x7f4eaf9c3660
01d00 0f1f8400f81d0013               nop        dword ptr [rax + rax + 0x13001df8]
01d08 4183c008                       add        r8d, 8
01d0c be66ffffff                     mov        esi, 0xffffff66
01d11 488b2c24                       mov        rbp, qword ptr [rsp]
01d15 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d1e 89442408                       mov        dword ptr [rsp + 8], eax
01d22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d27 48ff742420                     push       qword ptr [rsp + 0x20]
01d2c 488f442418                     pop        qword ptr [rsp + 0x18]
01d31 48894424f8                     mov        qword ptr [rsp - 8], rax
01d36 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d3a 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d43 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01d48 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d51 89442438                       mov        dword ptr [rsp + 0x38], eax
01d55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5a 48ff742478                     push       qword ptr [rsp + 0x78]
01d5f 488f442440                     pop        qword ptr [rsp + 0x40]
01d64 48894424f8                     mov        qword ptr [rsp - 8], rax
01d69 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d6d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d76 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d7f 89442458                       mov        dword ptr [rsp + 0x58], eax
01d83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d88 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d91 89442460                       mov        dword ptr [rsp + 0x60], eax
01d95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9a 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01d9f 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01da3 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01da8 c5f877                         vzeroupper 
01dab e8300ab6ff                     call       0x7f4eaf9c3660
01db0 0f1f8400a81e0014               nop        dword ptr [rax + rax + 0x14001ea8]
01db8 beccffffff                     mov        esi, 0xffffffcc
01dbd 488b2c24                       mov        rbp, qword ptr [rsp]
01dc1 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01dca 89442408                       mov        dword ptr [rsp + 8], eax
01dce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd3 48ff742420                     push       qword ptr [rsp + 0x20]
01dd8 488f442418                     pop        qword ptr [rsp + 0x18]
01ddd 48894424f8                     mov        qword ptr [rsp - 8], rax
01de2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01de6 8944240c                       mov        dword ptr [rsp + 0xc], eax
01dea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01def 48894424f8                     mov        qword ptr [rsp - 8], rax
01df4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01df8 89442438                       mov        dword ptr [rsp + 0x38], eax
01dfc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e01 48ff742478                     push       qword ptr [rsp + 0x78]
01e06 488f442440                     pop        qword ptr [rsp + 0x40]
01e0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e10 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01e14 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1d 48ffb42480000000               push       qword ptr [rsp + 0x80]
01e25 488f442450                     pop        qword ptr [rsp + 0x50]
01e2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e33 89442458                       mov        dword ptr [rsp + 0x58], eax
01e37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e41 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e45 89442460                       mov        dword ptr [rsp + 0x60], eax
01e49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e53 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01e5a 89442464                       mov        dword ptr [rsp + 0x64], eax
01e5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e63 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01e68 c5f877                         vzeroupper 
01e6b e87009b6ff                     call       0x7f4eaf9c3660
01e70 0f1f8400681f0015               nop        dword ptr [rax + rax + 0x15001f68]
01e78 beccffffff                     mov        esi, 0xffffffcc
01e7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e82 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e86 89442414                       mov        dword ptr [rsp + 0x14], eax
01e8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e94 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e98 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea1 48ff742478                     push       qword ptr [rsp + 0x78]
01ea6 488f442440                     pop        qword ptr [rsp + 0x40]
01eab 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb0 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01eb4 89442448                       mov        dword ptr [rsp + 0x48], eax
01eb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebd 48ffb42480000000               push       qword ptr [rsp + 0x80]
01ec5 488f442458                     pop        qword ptr [rsp + 0x58]
01eca 48894424f8                     mov        qword ptr [rsp - 8], rax
01ecf 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ed3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ed7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01edc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01ee8 89442460                       mov        dword ptr [rsp + 0x60], eax
01eec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01efa 89442464                       mov        dword ptr [rsp + 0x64], eax
01efe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f03 90                             nop        
01f04 c5f877                         vzeroupper 
01f07 e8d408b6ff                     call       0x7f4eaf9c3660
01f0c 0f1f840004200016               nop        dword ptr [rax + rax + 0x16002004]
01f14 458bd8                         mov        r11d, r8d
01f17 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
01f1f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01f27 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01f2c 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01f34 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01f3c 4f89540b08                     mov        qword ptr [r11 + r9 + 8], r10
01f41 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01f49 4183c208                       add        r10d, 8
01f4d 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01f55 443bd3                         cmp        r10d, ebx
01f58 7cba                           jl         0x7f4eafe62d94
01f5a 443bd2                         cmp        r10d, edx
01f5d 0f8dae000000                   jge        0x7f4eafe62e91
01f63 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01f6b 0f1f440000                     nop        dword ptr [rax + rax]
01f70 458bd8                         mov        r11d, r8d
01f73 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
01f7b 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01f83 4963c9                         movsxd     rcx, r9d
01f86 458bd3                         mov        r10d, r11d
01f89 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
01f91 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
01f96 4d63db                         movsxd     r11, r11d
01f99 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01fa1 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
01fa9 4e89540b08                     mov        qword ptr [rbx + r9 + 8], r10
01fae 4e8b541b10                     mov        r10, qword ptr [rbx + r11 + 0x10]
01fb3 4c89540b10                     mov        qword ptr [rbx + rcx + 0x10], r10
01fb8 4e8b541b18                     mov        r10, qword ptr [rbx + r11 + 0x18]
01fbd 4c89540b18                     mov        qword ptr [rbx + rcx + 0x18], r10
01fc2 4e8b541b20                     mov        r10, qword ptr [rbx + r11 + 0x20]
01fc7 4c89540b20                     mov        qword ptr [rbx + rcx + 0x20], r10
01fcc 4e8b541b28                     mov        r10, qword ptr [rbx + r11 + 0x28]
01fd1 4c89540b28                     mov        qword ptr [rbx + rcx + 0x28], r10
01fd6 4e8b541b30                     mov        r10, qword ptr [rbx + r11 + 0x30]
01fdb 4c89540b30                     mov        qword ptr [rbx + rcx + 0x30], r10
01fe0 4e8b541b38                     mov        r10, qword ptr [rbx + r11 + 0x38]
01fe5 4c89540b38                     mov        qword ptr [rbx + rcx + 0x38], r10
01fea 4e8b541b40                     mov        r10, qword ptr [rbx + r11 + 0x40]
01fef 4c89540b40                     mov        qword ptr [rbx + rcx + 0x40], r10
01ff4 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
01ffc 4183c340                       add        r11d, 0x40
02000 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
02008 443bda                         cmp        r11d, edx
0200b 0f8c5fffffff                   jl         0x7f4eafe62df0
02011 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
02019 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
02021 0f8d3af5ffff                   jge        0x7f4eafe623e1
02027 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0202f 458bda                         mov        r11d, r10d
02032 6690                           nop        
02034 478d0c18                       lea        r9d, [r8 + r11]
02038 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
02040 4f8b540a08                     mov        r10, qword ptr [r10 + r9 + 8]
02045 418bcb                         mov        ecx, r11d
02048 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
02050 4d89540908                     mov        qword ptr [r9 + rcx + 8], r10
02055 4183c308                       add        r11d, 8
02059 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
02061 7cd1                           jl         0x7f4eafe62eb4
02063 e9f9f4ffff                     jmp        0x7f4eafe623e1
02068 bee4ffffff                     mov        esi, 0xffffffe4
0206d 488b2c24                       mov        rbp, qword ptr [rsp]
02071 48894424f8                     mov        qword ptr [rsp - 8], rax
02076 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0207a 89442408                       mov        dword ptr [rsp + 8], eax
0207e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02083 48ff742420                     push       qword ptr [rsp + 0x20]
02088 488f442418                     pop        qword ptr [rsp + 0x18]
0208d 48894424f8                     mov        qword ptr [rsp - 8], rax
02092 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02096 8944240c                       mov        dword ptr [rsp + 0xc], eax
0209a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020a3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020a8 48894424f8                     mov        qword ptr [rsp - 8], rax
020ad 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020b1 89442438                       mov        dword ptr [rsp + 0x38], eax
020b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ba 48ff742478                     push       qword ptr [rsp + 0x78]
020bf 488f442440                     pop        qword ptr [rsp + 0x40]
020c4 48894424f8                     mov        qword ptr [rsp - 8], rax
020c9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
020cd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d6 48ffb42480000000               push       qword ptr [rsp + 0x80]
020de 488f442450                     pop        qword ptr [rsp + 0x50]
020e3 48894424f8                     mov        qword ptr [rsp - 8], rax
020e8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
020ec 89442458                       mov        dword ptr [rsp + 0x58], eax
020f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f5 48894424f8                     mov        qword ptr [rsp - 8], rax
020fa 8b442470                       mov        eax, dword ptr [rsp + 0x70]
020fe 89442460                       mov        dword ptr [rsp + 0x60], eax
02102 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02107 89442464                       mov        dword ptr [rsp + 0x64], eax
0210b 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
02112 6690                           nop        
02114 c5f877                         vzeroupper 
02117 e8c406b6ff                     call       0x7f4eaf9c3660
0211c 0f1f840014220017               nop        dword ptr [rax + rax + 0x17002214]
02124 be6effffff                     mov        esi, 0xffffff6e
02129 488b2c24                       mov        rbp, qword ptr [rsp]
0212d 48894424f8                     mov        qword ptr [rsp - 8], rax
02132 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02136 89442408                       mov        dword ptr [rsp + 8], eax
0213a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213f 48ff742420                     push       qword ptr [rsp + 0x20]
02144 488f442418                     pop        qword ptr [rsp + 0x18]
02149 48894424f8                     mov        qword ptr [rsp - 8], rax
0214e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02152 8944240c                       mov        dword ptr [rsp + 0xc], eax
02156 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0215f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02164 48894424f8                     mov        qword ptr [rsp - 8], rax
02169 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0216d 89442438                       mov        dword ptr [rsp + 0x38], eax
02171 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02176 48ff742478                     push       qword ptr [rsp + 0x78]
0217b 488f442440                     pop        qword ptr [rsp + 0x40]
02180 48894424f8                     mov        qword ptr [rsp - 8], rax
02185 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02189 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0218d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02192 48894424f8                     mov        qword ptr [rsp - 8], rax
02197 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0219b 89442458                       mov        dword ptr [rsp + 0x58], eax
0219f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a4 48894424f8                     mov        qword ptr [rsp - 8], rax
021a9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
021ad 89442460                       mov        dword ptr [rsp + 0x60], eax
021b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b6 89442464                       mov        dword ptr [rsp + 0x64], eax
021ba 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
021bf 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
021c3 90                             nop        
021c4 c5f877                         vzeroupper 
021c7 e81406b6ff                     call       0x7f4eaf9c3660
021cc 0f1f8400c4220018               nop        dword ptr [rax + rax + 0x180022c4]
021d4 be45ffffff                     mov        esi, 0xffffff45
021d9 488b2c24                       mov        rbp, qword ptr [rsp]
021dd 48894424f8                     mov        qword ptr [rsp - 8], rax
021e2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
021e6 89442408                       mov        dword ptr [rsp + 8], eax
021ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ef 48ff742420                     push       qword ptr [rsp + 0x20]
021f4 488f442418                     pop        qword ptr [rsp + 0x18]
021f9 48894424f8                     mov        qword ptr [rsp - 8], rax
021fe 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02202 8944240c                       mov        dword ptr [rsp + 0xc], eax
02206 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0220f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02214 48894424f8                     mov        qword ptr [rsp - 8], rax
02219 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0221d 89442438                       mov        dword ptr [rsp + 0x38], eax
02221 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02226 48ff742478                     push       qword ptr [rsp + 0x78]
0222b 488f442440                     pop        qword ptr [rsp + 0x40]
02230 48894424f8                     mov        qword ptr [rsp - 8], rax
02235 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02239 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0223d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02242 48894424f8                     mov        qword ptr [rsp - 8], rax
02247 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0224b 89442458                       mov        dword ptr [rsp + 0x58], eax
0224f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02254 48894424f8                     mov        qword ptr [rsp - 8], rax
02259 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0225d 89442460                       mov        dword ptr [rsp + 0x60], eax
02261 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02266 89442464                       mov        dword ptr [rsp + 0x64], eax
0226a 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0226e 6690                           nop        
02270 c5f877                         vzeroupper 
02273 e86805b6ff                     call       0x7f4eaf9c3660
02278 0f1f840070230019               nop        dword ptr [rax + rax + 0x19002370]
02280 be3dffffff                     mov        esi, 0xffffff3d
02285 488b2c24                       mov        rbp, qword ptr [rsp]
02289 48894424f8                     mov        qword ptr [rsp - 8], rax
0228e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02292 89442408                       mov        dword ptr [rsp + 8], eax
02296 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0229b 48ff742420                     push       qword ptr [rsp + 0x20]
022a0 488f442418                     pop        qword ptr [rsp + 0x18]
022a5 48894424f8                     mov        qword ptr [rsp - 8], rax
022aa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022ae 8944240c                       mov        dword ptr [rsp + 0xc], eax
022b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
022bb 4489742434                     mov        dword ptr [rsp + 0x34], r14d
022c0 48894424f8                     mov        qword ptr [rsp - 8], rax
022c5 8b442468                       mov        eax, dword ptr [rsp + 0x68]
022c9 89442438                       mov        dword ptr [rsp + 0x38], eax
022cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d2 48ff742478                     push       qword ptr [rsp + 0x78]
022d7 488f442440                     pop        qword ptr [rsp + 0x40]
022dc 48894424f8                     mov        qword ptr [rsp - 8], rax
022e1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
022e5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ee 48894424f8                     mov        qword ptr [rsp - 8], rax
022f3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
022f7 89442458                       mov        dword ptr [rsp + 0x58], eax
022fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02300 48894424f8                     mov        qword ptr [rsp - 8], rax
02305 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02309 89442460                       mov        dword ptr [rsp + 0x60], eax
0230d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02312 89442464                       mov        dword ptr [rsp + 0x64], eax
02316 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0231a 6690                           nop        
0231c c5f877                         vzeroupper 
0231f e8bc04b6ff                     call       0x7f4eaf9c3660
02324 0f1f84001c24001a               nop        dword ptr [rax + rax + 0x1a00241c]
0232c bee4ffffff                     mov        esi, 0xffffffe4
02331 488b2c24                       mov        rbp, qword ptr [rsp]
02335 48894424f8                     mov        qword ptr [rsp - 8], rax
0233a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0233e 89442408                       mov        dword ptr [rsp + 8], eax
02342 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02347 48ff742420                     push       qword ptr [rsp + 0x20]
0234c 488f442418                     pop        qword ptr [rsp + 0x18]
02351 48894424f8                     mov        qword ptr [rsp - 8], rax
02356 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0235a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0235e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02363 48894424f8                     mov        qword ptr [rsp - 8], rax
02368 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0236c 89442434                       mov        dword ptr [rsp + 0x34], eax
02370 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02375 48ff742478                     push       qword ptr [rsp + 0x78]
0237a 488f442438                     pop        qword ptr [rsp + 0x38]
0237f 48894424f8                     mov        qword ptr [rsp - 8], rax
02384 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02388 89442440                       mov        dword ptr [rsp + 0x40], eax
0238c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02391 48ffb42480000000               push       qword ptr [rsp + 0x80]
02399 488f442450                     pop        qword ptr [rsp + 0x50]
0239e 48894424f8                     mov        qword ptr [rsp - 8], rax
023a3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
023a7 89442444                       mov        dword ptr [rsp + 0x44], eax
023ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023b0 48894424f8                     mov        qword ptr [rsp - 8], rax
023b5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
023bc 89442458                       mov        dword ptr [rsp + 0x58], eax
023c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c5 48894424f8                     mov        qword ptr [rsp - 8], rax
023ca 8b442470                       mov        eax, dword ptr [rsp + 0x70]
023ce 8944245c                       mov        dword ptr [rsp + 0x5c], eax
023d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d7 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
023df 90                             nop        
023e0 c5f877                         vzeroupper 
023e3 e8f803b6ff                     call       0x7f4eaf9c3660
023e8 0f1f8400e024001b               nop        dword ptr [rax + rax + 0x1b0024e0]
023f0 bee4ffffff                     mov        esi, 0xffffffe4
023f5 48894424f8                     mov        qword ptr [rsp - 8], rax
023fa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023fe 89442414                       mov        dword ptr [rsp + 0x14], eax
02402 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02407 48894424f8                     mov        qword ptr [rsp - 8], rax
0240c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02410 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02414 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02419 48ff742478                     push       qword ptr [rsp + 0x78]
0241e 488f442440                     pop        qword ptr [rsp + 0x40]
02423 48894424f8                     mov        qword ptr [rsp - 8], rax
02428 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0242c 89442448                       mov        dword ptr [rsp + 0x48], eax
02430 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02435 48ffb42480000000               push       qword ptr [rsp + 0x80]
0243d 488f442458                     pop        qword ptr [rsp + 0x58]
02442 48894424f8                     mov        qword ptr [rsp - 8], rax
02447 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0244b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0244f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02454 48894424f8                     mov        qword ptr [rsp - 8], rax
02459 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02460 89442460                       mov        dword ptr [rsp + 0x60], eax
02464 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02469 48894424f8                     mov        qword ptr [rsp - 8], rax
0246e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02472 89442464                       mov        dword ptr [rsp + 0x64], eax
02476 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0247b 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02480 c5f877                         vzeroupper 
02483 e85803b6ff                     call       0x7f4eaf9c3660
02488 0f1f84008025001c               nop        dword ptr [rax + rax + 0x1c002580]
02490 418d6801                       lea        ebp, [r8 + 1]
02494 bee4ffffff                     mov        esi, 0xffffffe4
02499 48894424f8                     mov        qword ptr [rsp - 8], rax
0249e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
024a2 89442414                       mov        dword ptr [rsp + 0x14], eax
024a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ab 48894424f8                     mov        qword ptr [rsp - 8], rax
024b0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
024b4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
024b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024bd 48ff742478                     push       qword ptr [rsp + 0x78]
024c2 488f442440                     pop        qword ptr [rsp + 0x40]
024c7 48894424f8                     mov        qword ptr [rsp - 8], rax
024cc 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
024d0 89442448                       mov        dword ptr [rsp + 0x48], eax
024d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d9 48ffb42480000000               push       qword ptr [rsp + 0x80]
024e1 488f442458                     pop        qword ptr [rsp + 0x58]
024e6 48894424f8                     mov        qword ptr [rsp - 8], rax
024eb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
024ef 8944244c                       mov        dword ptr [rsp + 0x4c], eax
024f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f8 48894424f8                     mov        qword ptr [rsp - 8], rax
024fd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02504 89442460                       mov        dword ptr [rsp + 0x60], eax
02508 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250d 48894424f8                     mov        qword ptr [rsp - 8], rax
02512 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02516 89442464                       mov        dword ptr [rsp + 0x64], eax
0251a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251f 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02524 c5f877                         vzeroupper 
02527 e8b402b6ff                     call       0x7f4eaf9c3660
0252c 0f1f84002426001d               nop        dword ptr [rax + rax + 0x1d002624]
02534 bee4ffffff                     mov        esi, 0xffffffe4
02539 48894424f8                     mov        qword ptr [rsp - 8], rax
0253e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02542 89442414                       mov        dword ptr [rsp + 0x14], eax
02546 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254b 48894424f8                     mov        qword ptr [rsp - 8], rax
02550 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02554 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02558 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255d 48ff742478                     push       qword ptr [rsp + 0x78]
02562 488f442440                     pop        qword ptr [rsp + 0x40]
02567 48894424f8                     mov        qword ptr [rsp - 8], rax
0256c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02570 89442448                       mov        dword ptr [rsp + 0x48], eax
02574 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02579 48ffb42480000000               push       qword ptr [rsp + 0x80]
02581 488f442458                     pop        qword ptr [rsp + 0x58]
02586 48894424f8                     mov        qword ptr [rsp - 8], rax
0258b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0258f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02598 48894424f8                     mov        qword ptr [rsp - 8], rax
0259d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
025a1 89442464                       mov        dword ptr [rsp + 0x64], eax
025a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025aa 4489442474                     mov        dword ptr [rsp + 0x74], r8d
025af 90                             nop        
025b0 c5f877                         vzeroupper 
025b3 e82802b6ff                     call       0x7f4eaf9c3660
025b8 0f1f8400b026001e               nop        dword ptr [rax + rax + 0x1e0026b0]
025c0 bee4ffffff                     mov        esi, 0xffffffe4
025c5 488b2c24                       mov        rbp, qword ptr [rsp]
025c9 48894424f8                     mov        qword ptr [rsp - 8], rax
025ce 8b442410                       mov        eax, dword ptr [rsp + 0x10]
025d2 89442408                       mov        dword ptr [rsp + 8], eax
025d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025db 48ff742420                     push       qword ptr [rsp + 0x20]
025e0 488f442418                     pop        qword ptr [rsp + 0x18]
025e5 48894424f8                     mov        qword ptr [rsp - 8], rax
025ea 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025ee 8944240c                       mov        dword ptr [rsp + 0xc], eax
025f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f7 48894424f8                     mov        qword ptr [rsp - 8], rax
025fc 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02600 89442434                       mov        dword ptr [rsp + 0x34], eax
02604 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02609 48ff742478                     push       qword ptr [rsp + 0x78]
0260e 488f442438                     pop        qword ptr [rsp + 0x38]
02613 48894424f8                     mov        qword ptr [rsp - 8], rax
02618 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0261c 89442440                       mov        dword ptr [rsp + 0x40], eax
02620 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02625 48894424f8                     mov        qword ptr [rsp - 8], rax
0262a 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0262e 89442444                       mov        dword ptr [rsp + 0x44], eax
02632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02637 48894424f8                     mov        qword ptr [rsp - 8], rax
0263c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02640 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02644 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02649 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0264e 6690                           nop        
02650 c5f877                         vzeroupper 
02653 e88801b6ff                     call       0x7f4eaf9c3660
02658 0f1f84005027001f               nop        dword ptr [rax + rax + 0x1f002750]
02660 beccffffff                     mov        esi, 0xffffffcc
02665 488b2c24                       mov        rbp, qword ptr [rsp]
02669 48894424f8                     mov        qword ptr [rsp - 8], rax
0266e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02672 89442408                       mov        dword ptr [rsp + 8], eax
02676 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0267b 48ff742420                     push       qword ptr [rsp + 0x20]
02680 488f442418                     pop        qword ptr [rsp + 0x18]
02685 48894424f8                     mov        qword ptr [rsp - 8], rax
0268a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0268e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02692 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02697 48894424f8                     mov        qword ptr [rsp - 8], rax
0269c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
026a0 89442434                       mov        dword ptr [rsp + 0x34], eax
026a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a9 48ff742478                     push       qword ptr [rsp + 0x78]
026ae 488f442438                     pop        qword ptr [rsp + 0x38]
026b3 48894424f8                     mov        qword ptr [rsp - 8], rax
026b8 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
026bc 89442440                       mov        dword ptr [rsp + 0x40], eax
026c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c5 48ffb42480000000               push       qword ptr [rsp + 0x80]
026cd 488f442450                     pop        qword ptr [rsp + 0x50]
026d2 48894424f8                     mov        qword ptr [rsp - 8], rax
026d7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
026db 89442444                       mov        dword ptr [rsp + 0x44], eax
026df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e4 48894424f8                     mov        qword ptr [rsp - 8], rax
026e9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
026f0 89442458                       mov        dword ptr [rsp + 0x58], eax
026f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f9 48894424f8                     mov        qword ptr [rsp - 8], rax
026fe 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02702 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02706 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270b 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02710 c5f877                         vzeroupper 
02713 e8c800b6ff                     call       0x7f4eaf9c3660
02718 0f1f840010280020               nop        dword ptr [rax + rax + 0x20002810]
02720 be45ffffff                     mov        esi, 0xffffff45
02725 488b2c24                       mov        rbp, qword ptr [rsp]
02729 48894424f8                     mov        qword ptr [rsp - 8], rax
0272e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02732 89442408                       mov        dword ptr [rsp + 8], eax
02736 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273b 48ff742420                     push       qword ptr [rsp + 0x20]
02740 488f442418                     pop        qword ptr [rsp + 0x18]
02745 48894424f8                     mov        qword ptr [rsp - 8], rax
0274a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0274e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02752 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02757 48894424f8                     mov        qword ptr [rsp - 8], rax
0275c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02760 89442438                       mov        dword ptr [rsp + 0x38], eax
02764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02769 48894424f8                     mov        qword ptr [rsp - 8], rax
0276e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02772 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02776 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277b 4489442468                     mov        dword ptr [rsp + 0x68], r8d
02780 c5f877                         vzeroupper 
02783 e85800b6ff                     call       0x7f4eaf9c3660
02788 0f1f840080280021               nop        dword ptr [rax + rax + 0x21002880]
02790 bebeffffff                     mov        esi, 0xffffffbe
02795 488b2c24                       mov        rbp, qword ptr [rsp]
02799 48894424f8                     mov        qword ptr [rsp - 8], rax
0279e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027a2 89442408                       mov        dword ptr [rsp + 8], eax
027a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ab 48ff742420                     push       qword ptr [rsp + 0x20]
027b0 488f442418                     pop        qword ptr [rsp + 0x18]
027b5 48894424f8                     mov        qword ptr [rsp - 8], rax
027ba 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027be 8944240c                       mov        dword ptr [rsp + 0xc], eax
027c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
027cb 4489742434                     mov        dword ptr [rsp + 0x34], r14d
027d0 c5f877                         vzeroupper 
027d3 e80800b6ff                     call       0x7f4eaf9c3660
027d8 0f1f8400d0280022               nop        dword ptr [rax + rax + 0x220028d0]
027e0 be85ffffff                     mov        esi, 0xffffff85
027e5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
027e9 48894424f8                     mov        qword ptr [rsp - 8], rax
027ee 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027f2 890424                         mov        dword ptr [rsp], eax
027f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027fa 895c2404                       mov        dword ptr [rsp + 4], ebx
027fe 4489742408                     mov        dword ptr [rsp + 8], r14d
02803 90                             nop        
02804 c5f877                         vzeroupper 
02807 e8d4ffb5ff                     call       0x7f4eaf9c3660
0280c 0f1f840004290023               nop        dword ptr [rax + rax + 0x23002904]
02814 beccffffff                     mov        esi, 0xffffffcc
02819 488b2c24                       mov        rbp, qword ptr [rsp]
0281d 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02822 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02826 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0282b 90                             nop        
0282c c5f877                         vzeroupper 
0282f e8acffb5ff                     call       0x7f4eaf9c3660
02834 0f1f84002c290024               nop        dword ptr [rax + rax + 0x2400292c]
0283c bee4ffffff                     mov        esi, 0xffffffe4
02841 488b2c24                       mov        rbp, qword ptr [rsp]
02845 48894424f8                     mov        qword ptr [rsp - 8], rax
0284a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0284e 89442408                       mov        dword ptr [rsp + 8], eax
02852 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02857 48ff742420                     push       qword ptr [rsp + 0x20]
0285c 488f442418                     pop        qword ptr [rsp + 0x18]
02861 48894424f8                     mov        qword ptr [rsp - 8], rax
02866 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0286a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0286e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02873 48894424f8                     mov        qword ptr [rsp - 8], rax
02878 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0287c 89442434                       mov        dword ptr [rsp + 0x34], eax
02880 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02885 48ff742478                     push       qword ptr [rsp + 0x78]
0288a 488f442438                     pop        qword ptr [rsp + 0x38]
0288f 48894424f8                     mov        qword ptr [rsp - 8], rax
02894 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02898 89442440                       mov        dword ptr [rsp + 0x40], eax
0289c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a1 48ffb42480000000               push       qword ptr [rsp + 0x80]
028a9 488f442450                     pop        qword ptr [rsp + 0x50]
028ae 48894424f8                     mov        qword ptr [rsp - 8], rax
028b3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
028b7 89442444                       mov        dword ptr [rsp + 0x44], eax
028bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028c0 48894424f8                     mov        qword ptr [rsp - 8], rax
028c5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
028c9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
028cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d2 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
028da 6690                           nop        
028dc c5f877                         vzeroupper 
028df e8fcfeb5ff                     call       0x7f4eaf9c3660
028e4 0f1f8400dc290025               nop        dword ptr [rax + rax + 0x250029dc]
028ec bee4ffffff                     mov        esi, 0xffffffe4
028f1 488b2c24                       mov        rbp, qword ptr [rsp]
028f5 48894424f8                     mov        qword ptr [rsp - 8], rax
028fa 8b442410                       mov        eax, dword ptr [rsp + 0x10]
028fe 89442408                       mov        dword ptr [rsp + 8], eax
02902 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02907 48ff742420                     push       qword ptr [rsp + 0x20]
0290c 488f442418                     pop        qword ptr [rsp + 0x18]
02911 48894424f8                     mov        qword ptr [rsp - 8], rax
02916 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0291a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0291e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02923 48894424f8                     mov        qword ptr [rsp - 8], rax
02928 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0292c 89442434                       mov        dword ptr [rsp + 0x34], eax
02930 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02935 48ff742478                     push       qword ptr [rsp + 0x78]
0293a 488f442438                     pop        qword ptr [rsp + 0x38]
0293f 48894424f8                     mov        qword ptr [rsp - 8], rax
02944 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02948 89442440                       mov        dword ptr [rsp + 0x40], eax
0294c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02951 48894424f8                     mov        qword ptr [rsp - 8], rax
02956 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0295a 89442444                       mov        dword ptr [rsp + 0x44], eax
0295e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02963 48894424f8                     mov        qword ptr [rsp - 8], rax
02968 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0296c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02970 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02975 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0297a 6690                           nop        
0297c c5f877                         vzeroupper 
0297f e85cfeb5ff                     call       0x7f4eaf9c3660
02984 0f1f84007c2a0026               nop        dword ptr [rax + rax + 0x26002a7c]
0298c 4183c008                       add        r8d, 8
02990 be6effffff                     mov        esi, 0xffffff6e
02995 488b2c24                       mov        rbp, qword ptr [rsp]
02999 48894424f8                     mov        qword ptr [rsp - 8], rax
0299e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
029a2 89442408                       mov        dword ptr [rsp + 8], eax
029a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ab 48ff742420                     push       qword ptr [rsp + 0x20]
029b0 488f442418                     pop        qword ptr [rsp + 0x18]
029b5 48894424f8                     mov        qword ptr [rsp - 8], rax
029ba 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029be 8944240c                       mov        dword ptr [rsp + 0xc], eax
029c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c7 48894424f8                     mov        qword ptr [rsp - 8], rax
029cc 8b442468                       mov        eax, dword ptr [rsp + 0x68]
029d0 89442434                       mov        dword ptr [rsp + 0x34], eax
029d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029d9 48894424f8                     mov        qword ptr [rsp - 8], rax
029de 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
029e5 89442460                       mov        dword ptr [rsp + 0x60], eax
029e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ee 4489442464                     mov        dword ptr [rsp + 0x64], r8d
029f3 90                             nop        
029f4 c5f877                         vzeroupper 
029f7 e8e4fdb5ff                     call       0x7f4eaf9c3660
029fc 0f1f8400f42a0027               nop        dword ptr [rax + rax + 0x27002af4]
02a04 4183c008                       add        r8d, 8
02a08 be66ffffff                     mov        esi, 0xffffff66
02a0d 488b2c24                       mov        rbp, qword ptr [rsp]
02a11 48894424f8                     mov        qword ptr [rsp - 8], rax
02a16 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02a1a 89442408                       mov        dword ptr [rsp + 8], eax
02a1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a23 48ff742420                     push       qword ptr [rsp + 0x20]
02a28 488f442418                     pop        qword ptr [rsp + 0x18]
02a2d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a32 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a36 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a3f 48894424f8                     mov        qword ptr [rsp - 8], rax
02a44 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02a48 89442434                       mov        dword ptr [rsp + 0x34], eax
02a4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a51 4489442464                     mov        dword ptr [rsp + 0x64], r8d
02a56 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02a5b 90                             nop        
02a5c c5f877                         vzeroupper 
02a5f e87cfdb5ff                     call       0x7f4eaf9c3660
02a64 0f1f84005c2b0028               nop        dword ptr [rax + rax + 0x28002b5c]
02a6c bee4ffffff                     mov        esi, 0xffffffe4
02a71 488b2c24                       mov        rbp, qword ptr [rsp]
02a75 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02a7e 89442408                       mov        dword ptr [rsp + 8], eax
02a82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a87 48ff742420                     push       qword ptr [rsp + 0x20]
02a8c 488f442418                     pop        qword ptr [rsp + 0x18]
02a91 48894424f8                     mov        qword ptr [rsp - 8], rax
02a96 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a9a 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aa3 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02aac 89442434                       mov        dword ptr [rsp + 0x34], eax
02ab0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab5 48ff742478                     push       qword ptr [rsp + 0x78]
02aba 488f442438                     pop        qword ptr [rsp + 0x38]
02abf 48894424f8                     mov        qword ptr [rsp - 8], rax
02ac4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02ac8 89442440                       mov        dword ptr [rsp + 0x40], eax
02acc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad1 48ffb42480000000               push       qword ptr [rsp + 0x80]
02ad9 488f442450                     pop        qword ptr [rsp + 0x50]
02ade 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02ae7 89442444                       mov        dword ptr [rsp + 0x44], eax
02aeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af0 48894424f8                     mov        qword ptr [rsp - 8], rax
02af5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02af9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02afd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b02 89442460                       mov        dword ptr [rsp + 0x60], eax
02b06 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02b0b 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02b0f 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02b14 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02b1c c5f877                         vzeroupper 
02b1f e8bcfcb5ff                     call       0x7f4eaf9c3660
02b24 0f1f84001c2c0029               nop        dword ptr [rax + rax + 0x29002c1c]
02b2c c5fa7f8424c0000000             vmovdqu    xmmword ptr [rsp + 0xc0], xmm0
02b35 bee4ffffff                     mov        esi, 0xffffffe4
02b3a 488b2c24                       mov        rbp, qword ptr [rsp]
02b3e 48894424f8                     mov        qword ptr [rsp - 8], rax
02b43 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02b47 89442408                       mov        dword ptr [rsp + 8], eax
02b4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b50 48ff742420                     push       qword ptr [rsp + 0x20]
02b55 488f442418                     pop        qword ptr [rsp + 0x18]
02b5a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b5f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b63 8944240c                       mov        dword ptr [rsp + 0xc], eax
02b67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b6c 48894424f8                     mov        qword ptr [rsp - 8], rax
02b71 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02b75 89442434                       mov        dword ptr [rsp + 0x34], eax
02b79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b7e 48ff742478                     push       qword ptr [rsp + 0x78]
02b83 488f442438                     pop        qword ptr [rsp + 0x38]
02b88 48894424f8                     mov        qword ptr [rsp - 8], rax
02b8d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02b91 89442440                       mov        dword ptr [rsp + 0x40], eax
02b95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b9a 48ffb42480000000               push       qword ptr [rsp + 0x80]
02ba2 488f442450                     pop        qword ptr [rsp + 0x50]
02ba7 48894424f8                     mov        qword ptr [rsp - 8], rax
02bac 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02bb0 89442444                       mov        dword ptr [rsp + 0x44], eax
02bb4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bb9 48894424f8                     mov        qword ptr [rsp - 8], rax
02bbe 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02bc2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02bc6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bcb 89442460                       mov        dword ptr [rsp + 0x60], eax
02bcf 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02bd4 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02bd9 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02be0 c5f877                         vzeroupper 
02be3 e8f8fbb5ff                     call       0x7f4eaf9c3660
02be8 0f1f8400e02c002a               nop        dword ptr [rax + rax + 0x2a002ce0]
02bf0 beccffffff                     mov        esi, 0xffffffcc
02bf5 488b2c24                       mov        rbp, qword ptr [rsp]
02bf9 48894424f8                     mov        qword ptr [rsp - 8], rax
02bfe 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c02 89442408                       mov        dword ptr [rsp + 8], eax
02c06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c0b 48ff742420                     push       qword ptr [rsp + 0x20]
02c10 488f442418                     pop        qword ptr [rsp + 0x18]
02c15 48894424f8                     mov        qword ptr [rsp - 8], rax
02c1a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c1e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c27 48894424f8                     mov        qword ptr [rsp - 8], rax
02c2c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02c30 89442438                       mov        dword ptr [rsp + 0x38], eax
02c34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c39 48ff742478                     push       qword ptr [rsp + 0x78]
02c3e 488f442440                     pop        qword ptr [rsp + 0x40]
02c43 48894424f8                     mov        qword ptr [rsp - 8], rax
02c48 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02c4c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02c50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c55 48ffb42480000000               push       qword ptr [rsp + 0x80]
02c5d 488f442450                     pop        qword ptr [rsp + 0x50]
02c62 48894424f8                     mov        qword ptr [rsp - 8], rax
02c67 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02c6b 89442458                       mov        dword ptr [rsp + 0x58], eax
02c6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c74 48894424f8                     mov        qword ptr [rsp - 8], rax
02c79 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02c80 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02c84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c89 48894424f8                     mov        qword ptr [rsp - 8], rax
02c8e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c92 89442460                       mov        dword ptr [rsp + 0x60], eax
02c96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c9b 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02ca0 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02ca4 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02cab 90                             nop        
02cac c5f877                         vzeroupper 
02caf e82cfbb5ff                     call       0x7f4eaf9c3660
02cb4 0f1f8400ac2d002b               nop        dword ptr [rax + rax + 0x2b002dac]
02cbc 418bee                         mov        ebp, r14d
02cbf 83c510                         add        ebp, 0x10
02cc2 be6effffff                     mov        esi, 0xffffff6e
02cc7 48894424f8                     mov        qword ptr [rsp - 8], rax
02ccc 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02cd0 89442414                       mov        dword ptr [rsp + 0x14], eax
02cd4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cd9 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02cde 48894424f8                     mov        qword ptr [rsp - 8], rax
02ce3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02ce7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ceb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cf0 48ff742478                     push       qword ptr [rsp + 0x78]
02cf5 488f442440                     pop        qword ptr [rsp + 0x40]
02cfa 48894424f8                     mov        qword ptr [rsp - 8], rax
02cff 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02d03 89442448                       mov        dword ptr [rsp + 0x48], eax
02d07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d0c 48894424f8                     mov        qword ptr [rsp - 8], rax
02d11 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02d15 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02d19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d1e 48894424f8                     mov        qword ptr [rsp - 8], rax
02d23 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02d27 89442464                       mov        dword ptr [rsp + 0x64], eax
02d2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d30 89442468                       mov        dword ptr [rsp + 0x68], eax
02d34 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02d39 666690                         nop        
02d3c c5f877                         vzeroupper 
02d3f e89cfab5ff                     call       0x7f4eaf9c3660
02d44 0f1f84003c2e002c               nop        dword ptr [rax + rax + 0x2c002e3c]
02d4c 418bee                         mov        ebp, r14d
02d4f 83c510                         add        ebp, 0x10
02d52 be66ffffff                     mov        esi, 0xffffff66
02d57 48894424f8                     mov        qword ptr [rsp - 8], rax
02d5c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d60 89442414                       mov        dword ptr [rsp + 0x14], eax
02d64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d69 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02d6e 48894424f8                     mov        qword ptr [rsp - 8], rax
02d73 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02d77 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02d7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d80 48ff742478                     push       qword ptr [rsp + 0x78]
02d85 488f442440                     pop        qword ptr [rsp + 0x40]
02d8a 48894424f8                     mov        qword ptr [rsp - 8], rax
02d8f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02d93 89442448                       mov        dword ptr [rsp + 0x48], eax
02d97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d9c 48894424f8                     mov        qword ptr [rsp - 8], rax
02da1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02da5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02da9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dae 48894424f8                     mov        qword ptr [rsp - 8], rax
02db3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02db7 89442464                       mov        dword ptr [rsp + 0x64], eax
02dbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dc0 89442468                       mov        dword ptr [rsp + 0x68], eax
02dc4 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02dc9 666690                         nop        
02dcc c5f877                         vzeroupper 
02dcf e80cfab5ff                     call       0x7f4eaf9c3660
02dd4 0f1f8400cc2e002d               nop        dword ptr [rax + rax + 0x2d002ecc]
02ddc 488bf0                         mov        rsi, rax
02ddf eb0d                           jmp        0x7f4eafe63c6e
02de1 488bf0                         mov        rsi, rax
02de4 eb08                           jmp        0x7f4eafe63c6e
02de6 488bf0                         mov        rsi, rax
02de9 eb03                           jmp        0x7f4eafe63c6e
02deb 488bf0                         mov        rsi, rax
02dee c5f877                         vzeroupper 
02df1 4881c4f0000000                 add        rsp, 0xf0
02df8 5d                             pop        rbp
02df9 e9e225b6ff                     jmp        0x7f4eaf9c6260
02dfe bef6ffffff                     mov        esi, 0xfffffff6
02e03 90                             nop        
02e04 c5f877                         vzeroupper 
02e07 e8d4f9b5ff                     call       0x7f4eaf9c3660
02e0c 0f1f8400042f002e               nop        dword ptr [rax + rax + 0x2e002f04]
02e14 49ba1c1ce6af4e7f0000           movabs     r10, 0x7f4eafe61c1c
02e1e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02e25 e936a2a9ff                     jmp        0x7f4eaf8fdee0
02e2a e8f16da8ff                     call       0x7f4eaf8eaaa0
02e2f e9fad1ffff                     jmp        0x7f4eafe60eae
02e34 f4                             hlt        
02e35 f4                             hlt        
02e36 f4                             hlt        
02e37 f4                             hlt        
