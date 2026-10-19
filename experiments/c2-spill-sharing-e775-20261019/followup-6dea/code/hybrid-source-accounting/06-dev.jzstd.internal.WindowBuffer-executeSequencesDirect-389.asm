00000 e87bd55319                     call       0x7f540539d780
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85bc2e0000                   jne        0x7f53ebe630ea
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00046 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
0004a 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0004f 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00056 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0005b 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00062 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00067 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
0006e 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00073 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
0007a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0007f 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00086 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0008b 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
00092 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00097 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
0009d 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
000a4 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000ab 4489542468                     mov        dword ptr [rsp + 0x68], r10d
000b0 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000bc 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000c3 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
000c8 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cf 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
000d7 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000db 4489542474                     mov        dword ptr [rsp + 0x74], r10d
000e0 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000e4 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
000ec 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000f3 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
000fb 488bfe                         mov        rdi, rsi
000fe c5f877                         vzeroupper 
00101 49bac03e4805547f0000           movabs     r10, 0x7f5405483ec0
0010b 41ffd2                         call       r10
0010e 0f1f840000000000               nop        dword ptr [rax + rax]
00116 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011b 4d85d2                         test       r10, r10
0011e 0f848c1b0000                   je         0x7f53ebe61eb0
00124 458b12                         mov        r10d, dword ptr [r10]
00127 41c1ea0d                       shr        r10d, 0xd
0012b 4181fa15410000                 cmp        r10d, 0x4115
00132 0f8568270000                   jne        0x7f53ebe62aa0
00138 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0013d 4c891424                       mov        qword ptr [rsp], r10
00141 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00146 4d85d2                         test       r10, r10
00149 0f846d1b0000                   je         0x7f53ebe61ebc
0014f 458b1a                         mov        r11d, dword ptr [r10]
00152 41c1eb0d                       shr        r11d, 0xd
00156 4181fbdd050000                 cmp        r11d, 0x5dd
0015d 0f853d270000                   jne        0x7f53ebe62aa0
00163 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00170 4d85d2                         test       r10, r10
00173 0f84531b0000                   je         0x7f53ebe61ecc
00179 458b12                         mov        r10d, dword ptr [r10]
0017c 41c1ea0d                       shr        r10d, 0xd
00180 4181fae0050000                 cmp        r10d, 0x5e0
00187 0f8513270000                   jne        0x7f53ebe62aa0
0018d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00192 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0019a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0019f 4d85d2                         test       r10, r10
001a2 0f84341b0000                   je         0x7f53ebe61edc
001a8 458b1a                         mov        r11d, dword ptr [r10]
001ab 41c1eb0d                       shr        r11d, 0xd
001af 4181fbdf050000                 cmp        r11d, 0x5df
001b6 0f85e4260000                   jne        0x7f53ebe62aa0
001bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c6 4d85d2                         test       r10, r10
001c9 0f841a1b0000                   je         0x7f53ebe61ee9
001cf 458b12                         mov        r10d, dword ptr [r10]
001d2 41c1ea0d                       shr        r10d, 0xd
001d6 4181fadf050000                 cmp        r10d, 0x5df
001dd 0f85bd260000                   jne        0x7f53ebe62aa0
001e3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001e8 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001f0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f5 4d85d2                         test       r10, r10
001f8 0f84fb1a0000                   je         0x7f53ebe61ef9
001fe 458b1a                         mov        r11d, dword ptr [r10]
00201 41c1eb0d                       shr        r11d, 0xd
00205 4181fbdd050000                 cmp        r11d, 0x5dd
0020c 0f858e260000                   jne        0x7f53ebe62aa0
00212 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0021a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00222 458b5204                       mov        r10d, dword ptr [r10 + 4]
00226 4489542408                     mov        dword ptr [rsp + 8], r10d
0022b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00230 4585db                         test       r11d, r11d
00233 0f8417260000                   je         0x7f53ebe62a50
00239 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00241 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00245 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0024a 4585db                         test       r11d, r11d
0024d 0f86fd250000                   jbe        0x7f53ebe62a50
00253 4183fb01                       cmp        r11d, 1
00257 0f86f3250000                   jbe        0x7f53ebe62a50
0025d 4183fb02                       cmp        r11d, 2
00261 0f86e9250000                   jbe        0x7f53ebe62a50
00267 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0026f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00273 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00278 4183c2f1                       add        r10d, -0xf
0027c 4585d2                         test       r10d, r10d
0027f 0f8ccb250000                   jl         0x7f53ebe62a50
00285 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0028d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00291 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00296 4183c3f1                       add        r11d, -0xf
0029a 4585db                         test       r11d, r11d
0029d 0f8cad250000                   jl         0x7f53ebe62a50
002a3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002a8 4183c2f9                       add        r10d, -7
002ac 4585d2                         test       r10d, r10d
002af 0f8c9b250000                   jl         0x7f53ebe62a50
002b5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002ba 458d53f9                       lea        r10d, [r11 - 7]
002be 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002c6 4d63d3                         movsxd     r10, r11d
002c9 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002ce 4183c3f1                       add        r11d, -0xf
002d2 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
002da 4983c2f9                       add        r10, -7
002de 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002e3 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002e8 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
002ed 458d53f1                       lea        r10d, [r11 - 0xf]
002f1 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
002f9 e907040000                     jmp        0x7f53ebe60905
002fe 448bd5                         mov        r10d, ebp
00301 4d63d2                         movsxd     r10, r10d
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
0034b 0f8dc3090000                   jge        0x7f53ebe60f14
00351 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
00358 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00360 442b9424bc000000               sub        r10d, dword ptr [rsp + 0xbc]
00368 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00370 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00377 2bac24bc000000                 sub        ebp, dword ptr [rsp + 0xbc]
0037e 3bac24bc000000                 cmp        ebp, dword ptr [rsp + 0xbc]
00385 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0038d 410f4feb                       cmovg      ebp, r11d
00391 4585d2                         test       r10d, r10d
00394 0f8ca21b0000                   jl         0x7f53ebe6213c
0039a 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003a2 4585db                         test       r11d, r11d
003a5 0f8c911b0000                   jl         0x7f53ebe6213c
003ab 458d1c2a                       lea        r11d, [r10 + rbp]
003af 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
003b4 453bd3                         cmp        r10d, r11d
003b7 0f827f1b0000                   jb         0x7f53ebe6213c
003bd 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c4 03dd                           add        ebx, ebp
003c6 443bd3                         cmp        r10d, ebx
003c9 0f826d1b0000                   jb         0x7f53ebe6213c
003cf 85ed                           test       ebp, ebp
003d1 0f8c651b0000                   jl         0x7f53ebe6213c
003d7 85ed                           test       ebp, ebp
003d9 0f8442ffffff                   je         0x7f53ebe60521
003df 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
003e7 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003ef 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
003f4 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
003fc 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00401 4863d5                         movsxd     rdx, ebp
00404 4883fa20                       cmp        rdx, 0x20
00408 0f86f0feffff                   jbe        0x7f53ebe604fe
0040e c5f877                         vzeroupper 
00411 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
0041b 41ffd2                         call       r10
0041e 0f1f840000000000               nop        dword ptr [rax + rax]
00426 e9f6feffff                     jmp        0x7f53ebe60521
0042b 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00433 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0043b c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00442 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00449 4103da                         add        ebx, r10d
0044c e998020000                     jmp        0x7f53ebe608e9
00451 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00459 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00461 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00466 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
0046b 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00473 44039424c4000000               add        r10d, dword ptr [rsp + 0xc4]
0047b 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00483 4963ca                         movsxd     rcx, r10d
00486 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0048e 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00496 0f8cf1050000                   jl         0x7f53ebe60c8d
0049c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004a4 4183fb30                       cmp        r11d, 0x30
004a8 0f8e98000000                   jle        0x7f53ebe60746
004ae 4585c0                         test       r8d, r8d
004b1 0f8cc5190000                   jl         0x7f53ebe6207c
004b7 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
004bf 4585d2                         test       r10d, r10d
004c2 0f8cb4190000                   jl         0x7f53ebe6207c
004c8 4503d8                         add        r11d, r8d
004cb 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
004d0 453bcb                         cmp        r9d, r11d
004d3 0f82a3190000                   jb         0x7f53ebe6207c
004d9 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
004e1 0f8295190000                   jb         0x7f53ebe6207c
004e7 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004ef 4585db                         test       r11d, r11d
004f2 0f84e3010000                   je         0x7f53ebe608db
004f8 4963d3                         movsxd     rdx, r11d
004fb 4883fa20                       cmp        rdx, 0x20
004ff 7728                           ja         0x7f53ebe60729
00501 458bd3                         mov        r10d, r11d
00504 4d63d2                         movsxd     r10, r10d
00507 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0050e c442a8f5db                     bzhi       r11, r11, r10
00513 c4c1fb92fb                     kmovq      k7, r11
00518 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0051e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00524 e9b2010000                     jmp        0x7f53ebe608db
00529 c5f877                         vzeroupper 
0052c 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00536 41ffd2                         call       r10
00539 0f1f840000000000               nop        dword ptr [rax + rax]
00541 e995010000                     jmp        0x7f53ebe608db
00546 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0054e 0f83d0150000                   jae        0x7f53ebe61d24
00554 4963d8                         movsxd     rbx, r8d
00557 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0055f 4d8b5c1a08                     mov        r11, qword ptr [r10 + rbx + 8]
00564 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
0056c 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00574 0f836e160000                   jae        0x7f53ebe61de8
0057a 8bbc24c4000000                 mov        edi, dword ptr [rsp + 0xc4]
00581 448d4f08                       lea        r9d, [rdi + 8]
00585 4c63d7                         movsxd     r10, edi
00588 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
00590 4e895c1208                     mov        qword ptr [rdx + r10 + 8], r11
00595 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
0059d 0f8d38010000                   jge        0x7f53ebe608db
005a3 492bda                         sub        rbx, r10
005a6 4d63d9                         movsxd     r11, r9d
005a9 4d8d141b                       lea        r10, [r11 + rbx]
005ad 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005b2 0f8351170000                   jae        0x7f53ebe61f09
005b8 4c8bd1                         mov        r10, rcx
005bb 4d2bd3                         sub        r10, r11
005be 4983c207                       add        r10, 7
005c2 4983e2f8                       and        r10, 0xfffffffffffffff8
005c6 458bda                         mov        r11d, r10d
005c9 458d543b08                     lea        r10d, [r11 + rdi + 8]
005ce 4d63d2                         movsxd     r10, r10d
005d1 4d8d5c1af8                     lea        r11, [r10 + rbx - 8]
005d6 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005db 0f8328170000                   jae        0x7f53ebe61f09
005e1 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
005e9 0f831a170000                   jae        0x7f53ebe61f09
005ef 4983c2f8                       add        r10, -8
005f3 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005f8 0f830b170000                   jae        0x7f53ebe61f09
005fe 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00606 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
0060d 0f8fb9170000                   jg         0x7f53ebe61fcc
00613 442bc7                         sub        r8d, edi
00616 83c710                         add        edi, 0x10
00619 478d1c08                       lea        r11d, [r8 + r9]
0061d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00625 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
0062a 458bd1                         mov        r10d, r9d
0062d 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
00635 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
0063a 4183c108                       add        r9d, 8
0063e 443bcf                         cmp        r9d, edi
00641 7cd6                           jl         0x7f53ebe60819
00643 4883c1f8                       add        rcx, -8
00647 4881f900000080                 cmp        rcx, -0x80000000
0064e 49c7c200000080                 mov        r10, 0xffffffff80000000
00655 490f4cca                       cmovl      rcx, r10
00659 8bd9                           mov        ebx, ecx
0065b 443bcb                         cmp        r9d, ebx
0065e 7d40                           jge        0x7f53ebe608a0
00660 478d1c08                       lea        r11d, [r8 + r9]
00664 418bc9                         mov        ecx, r9d
00667 4863c9                         movsxd     rcx, ecx
0066a 458bd3                         mov        r10d, r11d
0066d 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00675 4a8b7c1708                     mov        rdi, qword ptr [rdi + r10 + 8]
0067a 4d63d3                         movsxd     r10, r11d
0067d 458bd9                         mov        r11d, r9d
00680 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
00688 4a897c1a08                     mov        qword ptr [rdx + r11 + 8], rdi
0068d 4e8b541210                     mov        r10, qword ptr [rdx + r10 + 0x10]
00692 4c89540a10                     mov        qword ptr [rdx + rcx + 0x10], r10
00697 4183c110                       add        r9d, 0x10
0069b 443bcb                         cmp        r9d, ebx
0069e 7cc0                           jl         0x7f53ebe60860
006a0 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
006a8 7d31                           jge        0x7f53ebe608db
006aa 6690                           nop        
006ac 478d1408                       lea        r10d, [r8 + r9]
006b0 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
006b8 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
006bd 458bd9                         mov        r11d, r9d
006c0 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
006c8 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
006cd 4183c108                       add        r9d, 8
006d1 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
006d9 7cd1                           jl         0x7f53ebe608ac
006db 8b9c24c4000000                 mov        ebx, dword ptr [rsp + 0xc4]
006e2 039c24b8000000                 add        ebx, dword ptr [rsp + 0xb8]
006e9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
006ee 41ffc2                         inc        r10d
006f1 4489542470                     mov        dword ptr [rsp + 0x70], r10d
006f6 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006fa 418502                         test       dword ptr [r10], eax
006fd 448bb424c0000000               mov        r14d, dword ptr [rsp + 0xc0]
00705 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0070d 498d741a08                     lea        rsi, [r10 + rbx + 8]
00712 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00717 452bde                         sub        r11d, r14d
0071a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00722 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
00727 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0072c 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00731 0f8d0b060000                   jge        0x7f53ebe60f42
00737 443b542408                     cmp        r10d, dword ptr [rsp + 8]
0073c 0f83ef0e0000                   jae        0x7f53ebe61831
00742 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
0074a 4f8b54d008                     mov        r10, qword ptr [r8 + r10*8 + 8]
0074f 418bc2                         mov        eax, r10d
00752 25ffff0100                     and        eax, 0x1ffff
00757 4d8bc2                         mov        r8, r10
0075a 49c1e812                       shr        r8, 0x12
0075e 49c1fa24                       sar        r10, 0x24
00762 458bc8                         mov        r9d, r8d
00765 458bd2                         mov        r10d, r10d
00768 418bd2                         mov        edx, r10d
0076b 4181e1ffff0300                 and        r9d, 0x3ffff
00772 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
0077a 4585d2                         test       r10d, r10d
0077d 0f8c55110000                   jl         0x7f53ebe61ad8
00783 85c0                           test       eax, eax
00785 0f853d020000                   jne        0x7f53ebe60bc8
0078b 4533d2                         xor        r10d, r10d
0078e 418bc2                         mov        eax, r10d
00791 448bd2                         mov        r10d, edx
00794 4183fa03                       cmp        r10d, 3
00798 0f8e4e020000                   jle        0x7f53ebe60bec
0079e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007a6 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
007aa 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
007b2 45895310                       mov        dword ptr [r11 + 0x10], r10d
007b6 458b5b08                       mov        r11d, dword ptr [r11 + 8]
007ba 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007c2 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
007c6 448d52fd                       lea        r10d, [rdx - 3]
007ca 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
007d2 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007da 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
007e2 45895a08                       mov        dword ptr [r10 + 8], r11d
007e6 4863ac24bc000000               movsxd     rbp, dword ptr [rsp + 0xbc]
007ee 4c63d3                         movsxd     r10, ebx
007f1 4c03542478                     add        r10, qword ptr [rsp + 0x78]
007f6 4863d0                         movsxd     rdx, eax
007f9 4c03d2                         add        r10, rdx
007fc 493bea                         cmp        rbp, r10
007ff 0f8f53110000                   jg         0x7f53ebe61b58
00805 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0080d 4585db                         test       r11d, r11d
00810 0f8ea2100000                   jle        0x7f53ebe61ab8
00816 448d2c03                       lea        r13d, [rbx + rax]
0081a 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00822 4503dd                         add        r11d, r13d
00825 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
0082a 0f8fc8110000                   jg         0x7f53ebe61bf8
00830 458d1406                       lea        r10d, [r14 + rax]
00834 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0083c 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00844 0f8f3e120000                   jg         0x7f53ebe61c88
0084a 83f810                         cmp        eax, 0x10
0084d 0f8f74050000                   jg         0x7f53ebe60fc7
00853 443bb424b4000000               cmp        r14d, dword ptr [rsp + 0xb4]
0085b 0f83470e0000                   jae        0x7f53ebe618a8
00861 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00869 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00870 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
00877 0f83d30e0000                   jae        0x7f53ebe61950
0087d 468d1c30                       lea        r11d, [rax + r14]
00881 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00889 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00891 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00898 448d1418                       lea        r10d, [rax + rbx]
0089c 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
008a4 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
008ac 442b8424bc000000               sub        r8d, dword ptr [rsp + 0xbc]
008b4 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
008bc 4183fb10                       cmp        r11d, 0x10
008c0 0f8f8bfbffff                   jg         0x7f53ebe60651
008c6 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
008ce 4183fa10                       cmp        r10d, 0x10
008d2 0f8c79fbffff                   jl         0x7f53ebe60651
008d8 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
008e0 0f833e0f0000                   jae        0x7f53ebe61a24
008e6 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
008ee c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
008f5 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
008fd 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00905 0f8220fbffff                   jb         0x7f53ebe6062b
0090b bee4ffffff                     mov        esi, 0xffffffe4
00910 488b2c24                       mov        rbp, qword ptr [rsp]
00914 48894424f8                     mov        qword ptr [rsp - 8], rax
00919 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0091d 89442408                       mov        dword ptr [rsp + 8], eax
00921 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00926 48ff742420                     push       qword ptr [rsp + 0x20]
0092b 488f442418                     pop        qword ptr [rsp + 0x18]
00930 48894424f8                     mov        qword ptr [rsp - 8], rax
00935 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00939 8944240c                       mov        dword ptr [rsp + 0xc], eax
0093d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00942 48894424f8                     mov        qword ptr [rsp - 8], rax
00947 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0094b 89442438                       mov        dword ptr [rsp + 0x38], eax
0094f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00954 48894424f8                     mov        qword ptr [rsp - 8], rax
00959 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0095d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00961 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00966 48ffb42480000000               push       qword ptr [rsp + 0x80]
0096e 488f442450                     pop        qword ptr [rsp + 0x50]
00973 48894424f8                     mov        qword ptr [rsp - 8], rax
00978 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0097c 89442458                       mov        dword ptr [rsp + 0x58], eax
00980 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00985 48894424f8                     mov        qword ptr [rsp - 8], rax
0098a 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00991 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00995 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0099a 48894424f8                     mov        qword ptr [rsp - 8], rax
0099f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
009a3 89442460                       mov        dword ptr [rsp + 0x60], eax
009a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009ac c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
009b5 666690                         nop        
009b8 c5f877                         vzeroupper 
009bb e8a02ab6ff                     call       0x7f53eb9c3660
009c0 0f1f8400b80a0002               nop        dword ptr [rax + rax + 0x2000ab8]
009c8 413bc3                         cmp        eax, r11d
009cb 0f8ec0fdffff                   jle        0x7f53ebe60991
009d1 be45ffffff                     mov        esi, 0xffffff45
009d6 8be8                           mov        ebp, eax
009d8 44891c24                       mov        dword ptr [rsp], r11d
009dc c5f877                         vzeroupper 
009df e87c2ab6ff                     call       0x7f53eb9c3660
009e4 0f1f8400dc0a0003               nop        dword ptr [rax + rax + 0x3000adc]
009ec 85c0                           test       eax, eax
009ee 7407                           je         0x7f53ebe60bf7
009f0 448d52ff                       lea        r10d, [rdx - 1]
009f4 418bd2                         mov        edx, r10d
009f7 85d2                           test       edx, edx
009f9 7479                           je         0x7f53ebe60c74
009fb 83fa03                         cmp        edx, 3
009fe 0f8490180000                   je         0x7f53ebe62494
00a04 83fa02                         cmp        edx, 2
00a07 0f8733190000                   ja         0x7f53ebe62540
00a0d 3b54240c                       cmp        edx, dword ptr [rsp + 0xc]
00a11 0f8310170000                   jae        0x7f53ebe62327
00a17 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00a1f 458b5c9308                     mov        r11d, dword ptr [r11 + rdx*4 + 8]
00a24 85d2                           test       edx, edx
00a26 7e3e                           jle        0x7f53ebe60c66
00a28 448d52ff                       lea        r10d, [rdx - 1]
00a2c 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00a31 0f83ad170000                   jae        0x7f53ebe623e4
00a37 660f1f840000000000             nop        word ptr [rax + rax]
00a40 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00a48 458b449004                     mov        r8d, dword ptr [r8 + rdx*4 + 4]
00a4d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00a55 4589449108                     mov        dword ptr [r9 + rdx*4 + 8], r8d
00a5a 448d52ff                       lea        r10d, [rdx - 1]
00a5e 418bd2                         mov        edx, r10d
00a61 4585d2                         test       r10d, r10d
00a64 7fda                           jg         0x7f53ebe60c40
00a66 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a6e 45895a08                       mov        dword ptr [r10 + 8], r11d
00a72 eb0c                           jmp        0x7f53ebe60c80
00a74 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a7c 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00a80 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00a88 e959fdffff                     jmp        0x7f53ebe609e6
00a8d 4183fa10                       cmp        r10d, 0x10
00a91 0f8d491d0000                   jge        0x7f53ebe629e0
00a97 4183fa08                       cmp        r10d, 8
00a9b 0f8d58070000                   jge        0x7f53ebe613f9
00aa1 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00aa9 4183fb10                       cmp        r11d, 0x10
00aad 0f8ebb000000                   jle        0x7f53ebe60d6e
00ab3 4585c0                         test       r8d, r8d
00ab6 0f8c641c0000                   jl         0x7f53ebe62920
00abc 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00ac4 4585d2                         test       r10d, r10d
00ac7 0f8c531c0000                   jl         0x7f53ebe62920
00acd 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00ad2 443b9c24c4000000               cmp        r11d, dword ptr [rsp + 0xc4]
00ada 0f82401c0000                   jb         0x7f53ebe62920
00ae0 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00ae8 44039424c4000000               add        r10d, dword ptr [rsp + 0xc4]
00af0 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00af8 453bda                         cmp        r11d, r10d
00afb 0f821f1c0000                   jb         0x7f53ebe62920
00b01 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b09 4585d2                         test       r10d, r10d
00b0c 0f8c0e1c0000                   jl         0x7f53ebe62920
00b12 4585d2                         test       r10d, r10d
00b15 0f843df8ffff                   je         0x7f53ebe60558
00b1b 4883fd20                       cmp        rbp, 0x20
00b1f 772d                           ja         0x7f53ebe60d4e
00b21 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b29 4d63d3                         movsxd     r10, r11d
00b2c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b33 c442a8f5db                     bzhi       r11, r11, r10
00b38 c4c1fb92fb                     kmovq      k7, r11
00b3d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b43 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b49 e90af8ffff                     jmp        0x7f53ebe60558
00b4e 488bd5                         mov        rdx, rbp
00b51 c5f877                         vzeroupper 
00b54 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00b5e 41ffd2                         call       r10
00b61 0f1f840000000000               nop        dword ptr [rax + rax]
00b69 e9eaf7ffff                     jmp        0x7f53ebe60558
00b6e 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00b73 0f8373180000                   jae        0x7f53ebe625ec
00b79 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00b81 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
00b87 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00b8f 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b94 0f8316190000                   jae        0x7f53ebe626b0
00b9a 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00ba2 448b8c24c4000000               mov        r9d, dword ptr [rsp + 0xc4]
00baa 43886c0a08                     mov        byte ptr [r10 + r9 + 8], bpl
00baf 458d5803                       lea        r11d, [r8 + 3]
00bb3 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00bbb 41ffc2                         inc        r10d
00bbe 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00bc6 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00bcb 0f837f190000                   jae        0x7f53ebe62750
00bd1 4d63c8                         movsxd     r9, r8d
00bd4 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00bdc 430fbe6c0a09                   movsx      ebp, byte ptr [r10 + r9 + 9]
00be2 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00bea 4183c303                       add        r11d, 3
00bee 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00bf3 0f83fb190000                   jae        0x7f53ebe627f4
00bf9 48638c24c4000000               movsxd     rcx, dword ptr [rsp + 0xc4]
00c01 41886c0a09                     mov        byte ptr [r10 + rcx + 9], bpl
00c06 470fbe540a0a                   movsx      r10d, byte ptr [r10 + r9 + 0xa]
00c0c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00c14 4588540b0a                     mov        byte ptr [r11 + rcx + 0xa], r10b
00c19 470fbe5c0b0b                   movsx      r11d, byte ptr [r11 + r9 + 0xb]
00c1f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00c27 45885c0a0b                     mov        byte ptr [r10 + rcx + 0xb], r11b
00c2c 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00c34 4183fb08                       cmp        r11d, 8
00c38 0f83421a0000                   jae        0x7f53ebe62880
00c3e 458bc8                         mov        r9d, r8d
00c41 49ba283827e300000000           movabs     r10, 0xe3273828
00c4b 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00c50 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c55 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c5d 4183fa04                       cmp        r10d, 4
00c61 7e41                           jle        0x7f53ebe60ea4
00c63 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00c6a 83c504                         add        ebp, 4
00c6d 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c75 418bd1                         mov        edx, r9d
00c78 c5f877                         vzeroupper 
00c7b e8e0a9a9ff                     call       0x7f53eb8fb860
00c80 0f1f8400780d0004               nop        dword ptr [rax + rax + 0x4000d78]
00c88 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c90 8bd5                           mov        edx, ebp
00c92 8bc8                           mov        ecx, eax
00c94 c5f877                         vzeroupper 
00c97 e8c4a9a9ff                     call       0x7f53eb8fb860
00c9c 0f1f8400940d0005               nop        dword ptr [rax + rax + 0x5000d94]
00ca4 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00cac 4183fb08                       cmp        r11d, 8
00cb0 7e62                           jle        0x7f53ebe60f14
00cb2 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00cb6 49ba503827e300000000           movabs     r10, 0xe3273850
00cc0 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00cc8 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00ccd 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00cd4 83c508                         add        ebp, 8
00cd7 83c208                         add        edx, 8
00cda 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00ce2 6690                           nop        
00ce4 c5f877                         vzeroupper 
00ce7 e874a9a9ff                     call       0x7f53eb8fb860
00cec 0f1f8400e40d0006               nop        dword ptr [rax + rax + 0x6000de4]
00cf4 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cfc 8bd5                           mov        edx, ebp
00cfe 488bc8                         mov        rcx, rax
00d01 666690                         nop        
00d04 c5f877                         vzeroupper 
00d07 e854a9a9ff                     call       0x7f53eb8fb860
00d0c 0f1f8400040e0007               nop        dword ptr [rax + rax + 0x7000e04]
00d14 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00d1b e9c9f9ffff                     jmp        0x7f53ebe608e9
00d20 4d63d3                         movsxd     r10, r11d
00d23 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d2a c442a8f5db                     bzhi       r11, r11, r10
00d2f c4c1fb92fb                     kmovq      k7, r11
00d34 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d3a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d40 eb67                           jmp        0x7f53ebe60fa9
00d42 4585f6                         test       r14d, r14d
00d45 0f8c891b0000                   jl         0x7f53ebe62ad4
00d4b 85db                           test       ebx, ebx
00d4d 0f8c811b0000                   jl         0x7f53ebe62ad4
00d53 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00d58 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00d5d 0f82711b0000                   jb         0x7f53ebe62ad4
00d63 428d2c1b                       lea        ebp, [rbx + r11]
00d67 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00d6c 443bd5                         cmp        r10d, ebp
00d6f 0f825f1b0000                   jb         0x7f53ebe62ad4
00d75 4585db                         test       r11d, r11d
00d78 0f8c561b0000                   jl         0x7f53ebe62ad4
00d7e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00d83 453bc6                         cmp        r8d, r14d
00d86 7421                           je         0x7f53ebe60fa9
00d88 4963d3                         movsxd     rdx, r11d
00d8b 4883fa20                       cmp        rdx, 0x20
00d8f 768f                           jbe        0x7f53ebe60f20
00d91 c5f877                         vzeroupper 
00d94 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00d9e 41ffd2                         call       r10
00da1 0f1f840000000000               nop        dword ptr [rax + rax]
00da9 4c8b1424                       mov        r10, qword ptr [rsp]
00dad 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00db1 c5f877                         vzeroupper 
00db4 4881c4f0000000                 add        rsp, 0xf0
00dbb 5d                             pop        rbp
00dbc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00dc0 0f870e210000                   ja         0x7f53ebe630d4
00dc6 c3                             ret        
00dc7 83f830                         cmp        eax, 0x30
00dca 0f8e83000000                   jle        0x7f53ebe61053
00dd0 4585f6                         test       r14d, r14d
00dd3 0f8cd71e0000                   jl         0x7f53ebe62eb0
00dd9 85db                           test       ebx, ebx
00ddb 0f8ccf1e0000                   jl         0x7f53ebe62eb0
00de1 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00de6 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
00dee 0f82bc1e0000                   jb         0x7f53ebe62eb0
00df4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00df9 453bdd                         cmp        r11d, r13d
00dfc 0f82ae1e0000                   jb         0x7f53ebe62eb0
00e02 85c0                           test       eax, eax
00e04 7426                           je         0x7f53ebe6102c
00e06 4883fa20                       cmp        rdx, 0x20
00e0a 772d                           ja         0x7f53ebe61039
00e0c 4c63d0                         movsxd     r10, eax
00e0f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e16 c442a8f5db                     bzhi       r11, r11, r10
00e1b c4c1fb92fb                     kmovq      k7, r11
00e20 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e26 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e2c 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
00e34 e96bfaffff                     jmp        0x7f53ebe60aa4
00e39 c5f877                         vzeroupper 
00e3c 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00e46 41ffd2                         call       r10
00e49 0f1f840000000000               nop        dword ptr [rax + rax]
00e51 ebd9                           jmp        0x7f53ebe6102c
00e53 443bb424b4000000               cmp        r14d, dword ptr [rsp + 0xb4]
00e5b 0f83cb1c0000                   jae        0x7f53ebe62d2c
00e61 4d63c6                         movsxd     r8, r14d
00e64 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e6c c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00e73 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
00e7a 0f836c1d0000                   jae        0x7f53ebe62dec
00e80 448d5b10                       lea        r11d, [rbx + 0x10]
00e84 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e8c 4c63d3                         movsxd     r10, ebx
00e8f 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00e97 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00e9e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00ea6 453bdd                         cmp        r11d, r13d
00ea9 0f8d33030000                   jge        0x7f53ebe613e2
00eaf 4d2bc2                         sub        r8, r10
00eb2 4d63d3                         movsxd     r10, r11d
00eb5 48634c241c                     movsxd     rcx, dword ptr [rsp + 0x1c]
00eba 4883c1f1                       add        rcx, -0xf
00ebe 4f8d1c02                       lea        r11, [r10 + r8]
00ec2 4c3bd9                         cmp        r11, rcx
00ec5 0f83b11e0000                   jae        0x7f53ebe62f7c
00ecb 4d63cd                         movsxd     r9, r13d
00ece 4d8bd9                         mov        r11, r9
00ed1 4d2bda                         sub        r11, r10
00ed4 4983c30f                       add        r11, 0xf
00ed8 4983e3f0                       and        r11, 0xfffffffffffffff0
00edc 458bdb                         mov        r11d, r11d
00edf 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00ee4 4d63da                         movsxd     r11, r10d
00ee7 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00eec 4c3bd1                         cmp        r10, rcx
00eef 0f83871e0000                   jae        0x7f53ebe62f7c
00ef5 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00efd 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00f05 0f83711e0000                   jae        0x7f53ebe62f7c
00f0b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f10 4983c2f1                       add        r10, -0xf
00f14 4983c3f0                       add        r11, -0x10
00f18 4d3bda                         cmp        r11, r10
00f1b 0f835b1e0000                   jae        0x7f53ebe62f7c
00f21 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00f28 0f8fde1e0000                   jg         0x7f53ebe6300c
00f2e 418bce                         mov        ecx, r14d
00f31 2bcb                           sub        ecx, ebx
00f33 83c320                         add        ebx, 0x20
00f36 6690                           nop        
00f38 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f40 448bc1                         mov        r8d, ecx
00f43 44038424c0000000               add        r8d, dword ptr [rsp + 0xc0]
00f4b 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00f53 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00f5a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00f62 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00f69 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f71 4183c210                       add        r10d, 0x10
00f75 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00f7d 443bd3                         cmp        r10d, ebx
00f80 7cb6                           jl         0x7f53ebe61138
00f82 4981c110ffffff                 add        r9, -0xf0
00f89 4981f900000080                 cmp        r9, -0x80000000
00f90 49c7c200000080                 mov        r10, 0xffffffff80000000
00f97 4d0f4cca                       cmovl      r9, r10
00f9b 458bc1                         mov        r8d, r9d
00f9e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00fa6 453bd8                         cmp        r11d, r8d
00fa9 0f8ded010000                   jge        0x7f53ebe6139c
00faf 458bd3                         mov        r10d, r11d
00fb2 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00fba 660f1f440000                   nop        word ptr [rax + rax]
00fc0 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00fc8 4d63d2                         movsxd     r10, r10d
00fcb 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00fd3 448bd9                         mov        r11d, ecx
00fd6 44039c24c0000000               add        r11d, dword ptr [rsp + 0xc0]
00fde 418bfb                         mov        edi, r11d
00fe1 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00fe9 c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
00ff0 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00ff8 c4817a7f440b08                 vmovdqu    xmmword ptr [r11 + r9 + 8], xmm0
00fff 4c63cf                         movsxd     r9, edi
01002 c4a17a6f440b18                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x18]
01009 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01011 c4817a7f441318                 vmovdqu    xmmword ptr [r11 + r10 + 0x18], xmm0
01018 c4a17a6f440b28                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x28]
0101f 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01027 c4817a7f441328                 vmovdqu    xmmword ptr [r11 + r10 + 0x28], xmm0
0102e c4a17a6f440b38                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x38]
01035 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0103d c4817a7f441338                 vmovdqu    xmmword ptr [r11 + r10 + 0x38], xmm0
01044 c4a17a6f440b48                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x48]
0104b 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01053 c4817a7f441348                 vmovdqu    xmmword ptr [r11 + r10 + 0x48], xmm0
0105a c4a17a6f440b58                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x58]
01061 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01069 c4817a7f441358                 vmovdqu    xmmword ptr [r11 + r10 + 0x58], xmm0
01070 c4a17a6f440b68                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x68]
01077 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0107f c4817a7f441368                 vmovdqu    xmmword ptr [r11 + r10 + 0x68], xmm0
01086 c4a17a6f440b78                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x78]
0108d 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01095 c4817a7f441378                 vmovdqu    xmmword ptr [r11 + r10 + 0x78], xmm0
0109c c4a17a6f840b88000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x88]
010a6 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010ae c4817a7f841388000000           vmovdqu    xmmword ptr [r11 + r10 + 0x88], xmm0
010b8 c4a17a6f840b98000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x98]
010c2 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010ca c4817a7f841398000000           vmovdqu    xmmword ptr [r11 + r10 + 0x98], xmm0
010d4 c4a17a6f840ba8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xa8]
010de 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010e6 c4817a7f8413a8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xa8], xmm0
010f0 c4a17a6f840bb8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xb8]
010fa 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01102 c4817a7f8413b8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xb8], xmm0
0110c c4a17a6f840bc8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xc8]
01116 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0111e c4817a7f8413c8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xc8], xmm0
01128 c4a17a6f840bd8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xd8]
01132 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0113a c4817a7f8413d8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xd8], xmm0
01144 c4a17a6f840be8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xe8]
0114e 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01156 c4817a7f8413e8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xe8], xmm0
01160 c4a17a6f840bf8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xf8]
0116a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01172 c4817a7f8413f8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xf8], xmm0
0117c 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01184 4181c300010000                 add        r11d, 0x100
0118b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01193 453bd8                         cmp        r11d, r8d
01196 0f8c24feffff                   jl         0x7f53ebe611c0
0119c 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
011a4 453bd5                         cmp        r10d, r13d
011a7 7d39                           jge        0x7f53ebe613e2
011a9 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
011b1 666690                         nop        
011b4 468d1401                       lea        r10d, [rcx + r8]
011b8 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
011c0 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
011c7 458bd8                         mov        r11d, r8d
011ca 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
011d2 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
011d9 4183c010                       add        r8d, 0x10
011dd 453bc5                         cmp        r8d, r13d
011e0 7cd2                           jl         0x7f53ebe613b4
011e2 4103c6                         add        eax, r14d
011e5 898424c0000000                 mov        dword ptr [rsp + 0xc0], eax
011ec 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
011f4 e9abf6ffff                     jmp        0x7f53ebe60aa4
011f9 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
01201 0f83f5160000                   jae        0x7f53ebe62afc
01207 4963d8                         movsxd     rbx, r8d
0120a 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01212 4d8b541a08                     mov        r10, qword ptr [r10 + rbx + 8]
01217 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0121f 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
01227 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0122f 0f8377170000                   jae        0x7f53ebe62bac
01235 458d4a08                       lea        r9d, [r10 + 8]
01239 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
01241 4d63da                         movsxd     r11, r10d
01244 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0124c 488bbc24d0000000               mov        rdi, qword ptr [rsp + 0xd0]
01254 4b897c1908                     mov        qword ptr [r9 + r11 + 8], rdi
01259 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01261 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
01269 0f8db6030000                   jge        0x7f53ebe61825
0126f 492bdb                         sub        rbx, r11
01272 4963f9                         movsxd     rdi, r9d
01275 4c8d1c1f                       lea        r11, [rdi + rbx]
01279 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0127e 0f83c8170000                   jae        0x7f53ebe62c4c
01284 4c8bd9                         mov        r11, rcx
01287 4c2bdf                         sub        r11, rdi
0128a 4983c307                       add        r11, 7
0128e 4983e3f8                       and        r11, 0xfffffffffffffff8
01292 458bcb                         mov        r9d, r11d
01295 478d5c1108                     lea        r11d, [r9 + r10 + 8]
0129a 4d63db                         movsxd     r11, r11d
0129d 4d8d4c1bf8                     lea        r9, [r11 + rbx - 8]
012a2 4c3b4c2438                     cmp        r9, qword ptr [rsp + 0x38]
012a7 0f839f170000                   jae        0x7f53ebe62c4c
012ad 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
012b4 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
012bb 0f838b170000                   jae        0x7f53ebe62c4c
012c1 4983c3f8                       add        r11, -8
012c5 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
012ca 0f837c170000                   jae        0x7f53ebe62c4c
012d0 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
012d8 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
012df 0f8fdf170000                   jg         0x7f53ebe62cc4
012e5 452bc2                         sub        r8d, r10d
012e8 41b9f8ffffff                   mov        r9d, 0xfffffff8
012ee 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
012f6 498bf3                         mov        rsi, r11
012f9 4c8d59c8                       lea        r11, [rcx - 0x38]
012fd 4981fb00000080                 cmp        r11, -0x80000000
01304 48c7c300000080                 mov        rbx, 0xffffffff80000000
0130b 4c0f4cdb                       cmovl      r11, rbx
0130f 418bd3                         mov        edx, r11d
01312 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0131a 418bdb                         mov        ebx, r11d
0131d 442bcb                         sub        r9d, ebx
01320 452bca                         sub        r9d, r10d
01323 4183c210                       add        r10d, 0x10
01327 418bda                         mov        ebx, r10d
0132a 4183c1f0                       add        r9d, -0x10
0132e 4d63d2                         movsxd     r10, r10d
01331 41bb06000000                   mov        r11d, 6
01337 c442a0f5d9                     bzhi       r11, r9, r11
0133c 4d03d3                         add        r10, r11
0133f 4c3bd1                         cmp        r10, rcx
01342 4c8bd9                         mov        r11, rcx
01345 4d0f4cda                       cmovl      r11, r10
01349 4d8bd3                         mov        r10, r11
0134c 4c2bd7                         sub        r10, rdi
0134f 4d8d4aff                       lea        r9, [r10 - 1]
01353 49c1f93f                       sar        r9, 0x3f
01357 49c1e93d                       shr        r9, 0x3d
0135b 4f8d5411ff                     lea        r10, [r9 + r10 - 1]
01360 4983e2f8                       and        r10, 0xfffffffffffffff8
01364 4c03d7                         add        r10, rdi
01367 493bfa                         cmp        rdi, r10
0136a 490f4cfa                       cmovl      rdi, r10
0136e 448bd7                         mov        r10d, edi
01371 458d4a08                       lea        r9d, [r10 + 8]
01375 442b9424bc000000               sub        r10d, dword ptr [rsp + 0xbc]
0137d 4963c1                         movsxd     rax, r9d
01380 4803c6                         add        rax, rsi
01383 4183c208                       add        r10d, 8
01387 4963fa                         movsxd     rdi, r10d
0138a 4803fe                         add        rdi, rsi
0138d 4c8d4848                       lea        r9, [rax + 0x48]
01391 4883c008                       add        rax, 8
01395 488d7708                       lea        rsi, [rdi + 8]
01399 4533d2                         xor        r10d, r10d
0139c 4c3bce                         cmp        r9, rsi
0139f 410f96c2                       setbe      r10b
013a3 4883c748                       add        rdi, 0x48
013a7 4533c9                         xor        r9d, r9d
013aa 483bf8                         cmp        rdi, rax
013ad 410f96c1                       setbe      r9b
013b1 450bd1                         or         r10d, r9d
013b4 0f841e0c0000                   je         0x7f53ebe621d8
013ba 458bd3                         mov        r10d, r11d
013bd 666690                         nop        
013c0 458bd8                         mov        r11d, r8d
013c3 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
013cb 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
013d3 4f8b5c1908                     mov        r11, qword ptr [r9 + r11 + 8]
013d8 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
013e0 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
013e8 4e895c0b08                     mov        qword ptr [rbx + r9 + 8], r11
013ed 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
013f5 4183c108                       add        r9d, 8
013f9 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
01401 453bca                         cmp        r9d, r10d
01404 7cba                           jl         0x7f53ebe615c0
01406 4881c108feffff                 add        rcx, -0x1f8
0140d 4881f900000080                 cmp        rcx, -0x80000000
01414 49c7c200000080                 mov        r10, 0xffffffff80000000
0141b 490f4cca                       cmovl      rcx, r10
0141f 8bd9                           mov        ebx, ecx
01421 443bcb                         cmp        r9d, ebx
01424 0f8db4010000                   jge        0x7f53ebe617de
0142a 458bd9                         mov        r11d, r9d
0142d 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01435 6666660f1f840000000000         nop        word ptr [rax + rax]
01440 458bd0                         mov        r10d, r8d
01443 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
0144b 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01453 4181c100010000                 add        r9d, 0x100
0145a 4503c8                         add        r9d, r8d
0145d 418bca                         mov        ecx, r10d
01460 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01468 62d17e486f840b08000000         vmovdqu32  zmm0, zmmword ptr [r11 + rcx + 8]
01473 4963ca                         movsxd     rcx, r10d
01476 458bd9                         mov        r11d, r9d
01479 4963f9                         movsxd     rdi, r9d
0147c 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01484 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0148c 62917e487f841108000000         vmovdqu32  zmmword ptr [r9 + r10 + 8], zmm0
01497 62d17e486f840948000000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x48]
014a2 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
014aa 4963f1                         movsxd     rsi, r9d
014ad 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
014b5 62d17e487f843248000000         vmovdqu32  zmmword ptr [r10 + rsi + 0x48], zmm0
014c0 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
014c8 4181c180000000                 add        r9d, 0x80
014cf 4503c8                         add        r9d, r8d
014d2 418bc1                         mov        eax, r9d
014d5 62917e486f840a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r9 + 8]
014e0 62d17e487f843288000000         vmovdqu32  zmmword ptr [r10 + rsi + 0x88], zmm0
014eb 4c63d0                         movsxd     r10, eax
014ee 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
014f6 62917e486f841148000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0x48]
01501 62d17e487f8431c8000000         vmovdqu32  zmmword ptr [r9 + rsi + 0xc8], zmm0
0150c 62917e486f841908000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 8]
01517 62d17e487f843108010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x108], zmm0
01522 62d17e486f843948000000         vmovdqu32  zmm0, zmmword ptr [r9 + rdi + 0x48]
0152d 62d17e487f843148010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x148], zmm0
01538 62d17e486f840988010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x188]
01543 62d17e487f843188010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x188], zmm0
0154e 62d17e486f8409c8010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x1c8]
01559 62d17e487f8431c8010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x1c8], zmm0
01564 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0156c 4181c200020000                 add        r10d, 0x200
01573 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0157b 443bd3                         cmp        r10d, ebx
0157e 0f8cbcfeffff                   jl         0x7f53ebe61640
01584 443bd2                         cmp        r10d, edx
01587 7d55                           jge        0x7f53ebe617de
01589 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01591 666690                         nop        
01594 458bd8                         mov        r11d, r8d
01597 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
0159f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
015a7 62917e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 8]
015b2 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
015ba 62917e487f841a08000000         vmovdqu32  zmmword ptr [r10 + r11 + 8], zmm0
015c5 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
015cd 4183c340                       add        r11d, 0x40
015d1 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
015d9 443bda                         cmp        r11d, edx
015dc 7cb6                           jl         0x7f53ebe61794
015de 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
015e6 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
015ee 7d35                           jge        0x7f53ebe61825
015f0 8b8c24b8000000                 mov        ecx, dword ptr [rsp + 0xb8]
015f7 90                             nop        
015f8 458d1c08                       lea        r11d, [r8 + rcx]
015fc 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01604 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01609 448bc9                         mov        r9d, ecx
0160c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01614 4f89540b08                     mov        qword ptr [r11 + r9 + 8], r10
01619 83c108                         add        ecx, 8
0161c 3b8c24c8000000                 cmp        ecx, dword ptr [rsp + 0xc8]
01623 7cd3                           jl         0x7f53ebe617f8
01625 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
0162c e9b8f0ffff                     jmp        0x7f53ebe608e9
01631 bee4ffffff                     mov        esi, 0xffffffe4
01636 488b2c24                       mov        rbp, qword ptr [rsp]
0163a 48894424f8                     mov        qword ptr [rsp - 8], rax
0163f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01643 89442408                       mov        dword ptr [rsp + 8], eax
01647 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164c 48ff742420                     push       qword ptr [rsp + 0x20]
01651 488f442418                     pop        qword ptr [rsp + 0x18]
01656 48894424f8                     mov        qword ptr [rsp - 8], rax
0165b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0165f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01663 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01668 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0166c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01671 48894424f8                     mov        qword ptr [rsp - 8], rax
01676 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0167a 89442438                       mov        dword ptr [rsp + 0x38], eax
0167e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01683 48894424f8                     mov        qword ptr [rsp - 8], rax
01688 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0168c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01690 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01695 666690                         nop        
01698 c5f877                         vzeroupper 
0169b e8c01db6ff                     call       0x7f53eb9c3660
016a0 0f1f840098170008               nop        dword ptr [rax + rax + 0x8001798]
016a8 bee4ffffff                     mov        esi, 0xffffffe4
016ad 488b2c24                       mov        rbp, qword ptr [rsp]
016b1 48894424f8                     mov        qword ptr [rsp - 8], rax
016b6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016ba 89442408                       mov        dword ptr [rsp + 8], eax
016be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c3 48ff742420                     push       qword ptr [rsp + 0x20]
016c8 488f442418                     pop        qword ptr [rsp + 0x18]
016cd 48894424f8                     mov        qword ptr [rsp - 8], rax
016d2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016d6 8944240c                       mov        dword ptr [rsp + 0xc], eax
016da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016df 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016e3 48894424f8                     mov        qword ptr [rsp - 8], rax
016e8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016ec 89442438                       mov        dword ptr [rsp + 0x38], eax
016f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f5 48ff742478                     push       qword ptr [rsp + 0x78]
016fa 488f442440                     pop        qword ptr [rsp + 0x40]
016ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01704 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01708 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0170c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01711 48894424f8                     mov        qword ptr [rsp - 8], rax
01716 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0171a 89442458                       mov        dword ptr [rsp + 0x58], eax
0171e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01723 48894424f8                     mov        qword ptr [rsp - 8], rax
01728 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0172c 89442460                       mov        dword ptr [rsp + 0x60], eax
01730 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01735 89442464                       mov        dword ptr [rsp + 0x64], eax
01739 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0173e 6690                           nop        
01740 c5f877                         vzeroupper 
01743 e8181db6ff                     call       0x7f53eb9c3660
01748 0f1f840040180009               nop        dword ptr [rax + rax + 0x9001840]
01750 bee4ffffff                     mov        esi, 0xffffffe4
01755 488b2c24                       mov        rbp, qword ptr [rsp]
01759 48894424f8                     mov        qword ptr [rsp - 8], rax
0175e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01762 89442408                       mov        dword ptr [rsp + 8], eax
01766 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176b 48ff742420                     push       qword ptr [rsp + 0x20]
01770 488f442418                     pop        qword ptr [rsp + 0x18]
01775 48894424f8                     mov        qword ptr [rsp - 8], rax
0177a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0177e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01782 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01787 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0178c 48894424f8                     mov        qword ptr [rsp - 8], rax
01791 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01795 89442438                       mov        dword ptr [rsp + 0x38], eax
01799 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179e 48ff742478                     push       qword ptr [rsp + 0x78]
017a3 488f442440                     pop        qword ptr [rsp + 0x40]
017a8 48894424f8                     mov        qword ptr [rsp - 8], rax
017ad 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017b1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ba 48ffb42480000000               push       qword ptr [rsp + 0x80]
017c2 488f442450                     pop        qword ptr [rsp + 0x50]
017c7 48894424f8                     mov        qword ptr [rsp - 8], rax
017cc 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017d0 89442458                       mov        dword ptr [rsp + 0x58], eax
017d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d9 48894424f8                     mov        qword ptr [rsp - 8], rax
017de 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
017e5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
017e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ee 48894424f8                     mov        qword ptr [rsp - 8], rax
017f3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
017f7 89442460                       mov        dword ptr [rsp + 0x60], eax
017fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01800 89442464                       mov        dword ptr [rsp + 0x64], eax
01804 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01808 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01811 666690                         nop        
01814 c5f877                         vzeroupper 
01817 e8441cb6ff                     call       0x7f53eb9c3660
0181c 0f1f84001419000a               nop        dword ptr [rax + rax + 0xa001914]
01824 bee4ffffff                     mov        esi, 0xffffffe4
01829 488b2c24                       mov        rbp, qword ptr [rsp]
0182d 48894424f8                     mov        qword ptr [rsp - 8], rax
01832 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01836 89442408                       mov        dword ptr [rsp + 8], eax
0183a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183f 48ff742420                     push       qword ptr [rsp + 0x20]
01844 488f442418                     pop        qword ptr [rsp + 0x18]
01849 48894424f8                     mov        qword ptr [rsp - 8], rax
0184e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01852 8944240c                       mov        dword ptr [rsp + 0xc], eax
01856 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185b 48894424f8                     mov        qword ptr [rsp - 8], rax
01860 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01864 89442438                       mov        dword ptr [rsp + 0x38], eax
01868 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186d 48894424f8                     mov        qword ptr [rsp - 8], rax
01872 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01876 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0187a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187f 48894424f8                     mov        qword ptr [rsp - 8], rax
01884 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01888 89442458                       mov        dword ptr [rsp + 0x58], eax
0188c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01891 48894424f8                     mov        qword ptr [rsp - 8], rax
01896 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0189a 89442460                       mov        dword ptr [rsp + 0x60], eax
0189e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a3 4489442470                     mov        dword ptr [rsp + 0x70], r8d
018a8 c5f877                         vzeroupper 
018ab e8b01bb6ff                     call       0x7f53eb9c3660
018b0 0f1f8400a819000b               nop        dword ptr [rax + rax + 0xb0019a8]
018b8 be45ffffff                     mov        esi, 0xffffff45
018bd 488b2c24                       mov        rbp, qword ptr [rsp]
018c1 4c89542408                     mov        qword ptr [rsp + 8], r10
018c6 6690                           nop        
018c8 c5f877                         vzeroupper 
018cb e8901bb6ff                     call       0x7f53eb9c3660
018d0 0f1f8400c819000c               nop        dword ptr [rax + rax + 0xc0019c8]
018d8 be45ffffff                     mov        esi, 0xffffff45
018dd 488b2c24                       mov        rbp, qword ptr [rsp]
018e1 48894424f8                     mov        qword ptr [rsp - 8], rax
018e6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018ea 89442408                       mov        dword ptr [rsp + 8], eax
018ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f3 48ff742420                     push       qword ptr [rsp + 0x20]
018f8 488f442418                     pop        qword ptr [rsp + 0x18]
018fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01902 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01906 8944240c                       mov        dword ptr [rsp + 0xc], eax
0190a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01913 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01918 48894424f8                     mov        qword ptr [rsp - 8], rax
0191d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01921 89442438                       mov        dword ptr [rsp + 0x38], eax
01925 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0192a 48894424f8                     mov        qword ptr [rsp - 8], rax
0192f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01933 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01937 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193c 89442464                       mov        dword ptr [rsp + 0x64], eax
01940 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01945 666690                         nop        
01948 c5f877                         vzeroupper 
0194b e8101bb6ff                     call       0x7f53eb9c3660
01950 0f1f8400481a000d               nop        dword ptr [rax + rax + 0xd001a48]
01958 493bea                         cmp        rbp, r10
0195b bdffffffff                     mov        ebp, 0xffffffff
01960 7c08                           jl         0x7f53ebe61b6a
01962 400f95c5                       setne      bpl
01966 400fb6ed                       movzx      ebp, bpl
0196a be45ffffff                     mov        esi, 0xffffff45
0196f 48894424f8                     mov        qword ptr [rsp - 8], rax
01974 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01978 89442414                       mov        dword ptr [rsp + 0x14], eax
0197c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01981 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01985 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
0198a 48894424f8                     mov        qword ptr [rsp - 8], rax
0198f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01993 89442440                       mov        dword ptr [rsp + 0x40], eax
01997 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0199c 48ff742478                     push       qword ptr [rsp + 0x78]
019a1 488f442448                     pop        qword ptr [rsp + 0x48]
019a6 48894424f8                     mov        qword ptr [rsp - 8], rax
019ab 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
019af 89442444                       mov        dword ptr [rsp + 0x44], eax
019b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b8 48894424f8                     mov        qword ptr [rsp - 8], rax
019bd 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019c1 89442460                       mov        dword ptr [rsp + 0x60], eax
019c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ca 48894424f8                     mov        qword ptr [rsp - 8], rax
019cf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019d3 89442468                       mov        dword ptr [rsp + 0x68], eax
019d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dc 8944246c                       mov        dword ptr [rsp + 0x6c], eax
019e0 4c89542478                     mov        qword ptr [rsp + 0x78], r10
019e5 666690                         nop        
019e8 c5f877                         vzeroupper 
019eb e8701ab6ff                     call       0x7f53eb9c3660
019f0 0f1f8400e81a000e               nop        dword ptr [rax + rax + 0xe001ae8]
019f8 be45ffffff                     mov        esi, 0xffffff45
019fd 488b2c24                       mov        rbp, qword ptr [rsp]
01a01 48894424f8                     mov        qword ptr [rsp - 8], rax
01a06 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a0a 89442408                       mov        dword ptr [rsp + 8], eax
01a0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a13 48ff742420                     push       qword ptr [rsp + 0x20]
01a18 488f442418                     pop        qword ptr [rsp + 0x18]
01a1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a22 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a26 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01a33 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a38 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a41 89442438                       mov        dword ptr [rsp + 0x38], eax
01a45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a53 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a61 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a65 89442460                       mov        dword ptr [rsp + 0x60], eax
01a69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6e 89442464                       mov        dword ptr [rsp + 0x64], eax
01a72 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01a77 90                             nop        
01a78 c5f877                         vzeroupper 
01a7b e8e019b6ff                     call       0x7f53eb9c3660
01a80 0f1f8400781b000f               nop        dword ptr [rax + rax + 0xf001b78]
01a88 be45ffffff                     mov        esi, 0xffffff45
01a8d 488b2c24                       mov        rbp, qword ptr [rsp]
01a91 48894424f8                     mov        qword ptr [rsp - 8], rax
01a96 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a9a 89442408                       mov        dword ptr [rsp + 8], eax
01a9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa3 48ff742420                     push       qword ptr [rsp + 0x20]
01aa8 488f442418                     pop        qword ptr [rsp + 0x18]
01aad 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ab6 8944240c                       mov        dword ptr [rsp + 0xc], eax
01aba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ac3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01ac8 48894424f8                     mov        qword ptr [rsp - 8], rax
01acd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ad1 89442438                       mov        dword ptr [rsp + 0x38], eax
01ad5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ada 48894424f8                     mov        qword ptr [rsp - 8], rax
01adf 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ae3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ae7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aec 48894424f8                     mov        qword ptr [rsp - 8], rax
01af1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01af5 89442458                       mov        dword ptr [rsp + 0x58], eax
01af9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afe 48894424f8                     mov        qword ptr [rsp - 8], rax
01b03 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b07 89442460                       mov        dword ptr [rsp + 0x60], eax
01b0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b10 89442464                       mov        dword ptr [rsp + 0x64], eax
01b14 c5f877                         vzeroupper 
01b17 e84419b6ff                     call       0x7f53eb9c3660
01b1c 0f1f8400141c0010               nop        dword ptr [rax + rax + 0x10001c14]
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
01bcf 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01bd7 90                             nop        
01bd8 c5f877                         vzeroupper 
01bdb e88018b6ff                     call       0x7f53eb9c3660
01be0 0f1f8400d81c0011               nop        dword ptr [rax + rax + 0x11001cd8]
01be8 bee4ffffff                     mov        esi, 0xffffffe4
01bed 488b2c24                       mov        rbp, qword ptr [rsp]
01bf1 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bfa 89442408                       mov        dword ptr [rsp + 8], eax
01bfe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c03 48ff742420                     push       qword ptr [rsp + 0x20]
01c08 488f442418                     pop        qword ptr [rsp + 0x18]
01c0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c12 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c16 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c1f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c24 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c28 89442438                       mov        dword ptr [rsp + 0x38], eax
01c2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c31 48ff742478                     push       qword ptr [rsp + 0x78]
01c36 488f442440                     pop        qword ptr [rsp + 0x40]
01c3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c40 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c44 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4d 48ffb42480000000               push       qword ptr [rsp + 0x80]
01c55 488f442450                     pop        qword ptr [rsp + 0x50]
01c5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01c63 89442458                       mov        dword ptr [rsp + 0x58], eax
01c67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c71 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01c78 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01c7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c81 48894424f8                     mov        qword ptr [rsp - 8], rax
01c86 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c8a 89442460                       mov        dword ptr [rsp + 0x60], eax
01c8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c93 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01c98 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01c9d 666690                         nop        
01ca0 c5f877                         vzeroupper 
01ca3 e8b817b6ff                     call       0x7f53eb9c3660
01ca8 0f1f8400a01d0012               nop        dword ptr [rax + rax + 0x12001da0]
01cb0 4533d2                         xor        r10d, r10d
01cb3 4c891424                       mov        qword ptr [rsp], r10
01cb7 e985e4ffff                     jmp        0x7f53ebe60341
01cbc 4533d2                         xor        r10d, r10d
01cbf 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01cc7 e99fe4ffff                     jmp        0x7f53ebe6036b
01ccc 4533d2                         xor        r10d, r10d
01ccf 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01cd7 e9bee4ffff                     jmp        0x7f53ebe6039a
01cdc 4533d2                         xor        r10d, r10d
01cdf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01ce4 e9d8e4ffff                     jmp        0x7f53ebe603c1
01ce9 4533d2                         xor        r10d, r10d
01cec 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01cf4 e9f7e4ffff                     jmp        0x7f53ebe603f0
01cf9 4533d2                         xor        r10d, r10d
01cfc 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01d04 e911e5ffff                     jmp        0x7f53ebe6041a
01d09 4183c008                       add        r8d, 8
01d0d be6effffff                     mov        esi, 0xffffff6e
01d12 488b2c24                       mov        rbp, qword ptr [rsp]
01d16 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d1f 89442408                       mov        dword ptr [rsp + 8], eax
01d23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d28 48ff742420                     push       qword ptr [rsp + 0x20]
01d2d 488f442418                     pop        qword ptr [rsp + 0x18]
01d32 48894424f8                     mov        qword ptr [rsp - 8], rax
01d37 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d3b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d44 897c2430                       mov        dword ptr [rsp + 0x30], edi
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
01d9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9f 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
01da6 89442468                       mov        dword ptr [rsp + 0x68], eax
01daa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daf 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01db4 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
01db9 666690                         nop        
01dbc c5f877                         vzeroupper 
01dbf e89c16b6ff                     call       0x7f53eb9c3660
01dc4 0f1f8400bc1e0013               nop        dword ptr [rax + rax + 0x13001ebc]
01dcc 4183c008                       add        r8d, 8
01dd0 be66ffffff                     mov        esi, 0xffffff66
01dd5 488b2c24                       mov        rbp, qword ptr [rsp]
01dd9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dde 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01de2 89442408                       mov        dword ptr [rsp + 8], eax
01de6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01deb 48ff742420                     push       qword ptr [rsp + 0x20]
01df0 488f442418                     pop        qword ptr [rsp + 0x18]
01df5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dfe 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e07 897c2430                       mov        dword ptr [rsp + 0x30], edi
01e0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e10 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e14 89442438                       mov        dword ptr [rsp + 0x38], eax
01e18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1d 48ff742478                     push       qword ptr [rsp + 0x78]
01e22 488f442440                     pop        qword ptr [rsp + 0x40]
01e27 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01e30 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e39 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3e 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e42 89442458                       mov        dword ptr [rsp + 0x58], eax
01e46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e50 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e54 89442460                       mov        dword ptr [rsp + 0x60], eax
01e58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5d 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01e62 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
01e67 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01e6c c5f877                         vzeroupper 
01e6f e8ec15b6ff                     call       0x7f53eb9c3660
01e74 0f1f84006c1f0014               nop        dword ptr [rax + rax + 0x14001f6c]
01e7c beccffffff                     mov        esi, 0xffffffcc
01e81 488b2c24                       mov        rbp, qword ptr [rsp]
01e85 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e8e 89442408                       mov        dword ptr [rsp + 8], eax
01e92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e97 48ff742420                     push       qword ptr [rsp + 0x20]
01e9c 488f442418                     pop        qword ptr [rsp + 0x18]
01ea1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01eaa 8944240c                       mov        dword ptr [rsp + 0xc], eax
01eae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb3 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ebc 89442438                       mov        dword ptr [rsp + 0x38], eax
01ec0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec5 48ff742478                     push       qword ptr [rsp + 0x78]
01eca 488f442440                     pop        qword ptr [rsp + 0x40]
01ecf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ed8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01edc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee1 48ffb42480000000               push       qword ptr [rsp + 0x80]
01ee9 488f442450                     pop        qword ptr [rsp + 0x50]
01eee 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ef7 89442458                       mov        dword ptr [rsp + 0x58], eax
01efb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f00 48894424f8                     mov        qword ptr [rsp - 8], rax
01f05 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f09 89442460                       mov        dword ptr [rsp + 0x60], eax
01f0d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f12 48894424f8                     mov        qword ptr [rsp - 8], rax
01f17 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f1e 89442464                       mov        dword ptr [rsp + 0x64], eax
01f22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f27 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01f2c c5f877                         vzeroupper 
01f2f e82c15b6ff                     call       0x7f53eb9c3660
01f34 0f1f84002c200015               nop        dword ptr [rax + rax + 0x1500202c]
01f3c beccffffff                     mov        esi, 0xffffffcc
01f41 48894424f8                     mov        qword ptr [rsp - 8], rax
01f46 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f4a 89442414                       mov        dword ptr [rsp + 0x14], eax
01f4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f53 48894424f8                     mov        qword ptr [rsp - 8], rax
01f58 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f5c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f65 48ff742478                     push       qword ptr [rsp + 0x78]
01f6a 488f442440                     pop        qword ptr [rsp + 0x40]
01f6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f74 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01f78 89442448                       mov        dword ptr [rsp + 0x48], eax
01f7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f81 48ffb42480000000               push       qword ptr [rsp + 0x80]
01f89 488f442458                     pop        qword ptr [rsp + 0x58]
01f8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f93 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01f97 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01f9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01fac 89442460                       mov        dword ptr [rsp + 0x60], eax
01fb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fba 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01fbe 89442464                       mov        dword ptr [rsp + 0x64], eax
01fc2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc7 90                             nop        
01fc8 c5f877                         vzeroupper 
01fcb e89014b6ff                     call       0x7f53eb9c3660
01fd0 0f1f8400c8200016               nop        dword ptr [rax + rax + 0x160020c8]
01fd8 458bd0                         mov        r10d, r8d
01fdb 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
01fe3 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01feb 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01ff0 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
01ff8 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
02000 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
02005 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0200d 4183c308                       add        r11d, 8
02011 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
02019 443bdb                         cmp        r11d, ebx
0201c 7cba                           jl         0x7f53ebe621d8
0201e 443bda                         cmp        r11d, edx
02021 0f8daa000000                   jge        0x7f53ebe622d1
02027 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0202f 90                             nop        
02030 458bd0                         mov        r10d, r8d
02033 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
0203b 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
02043 4963cb                         movsxd     rcx, r11d
02046 458bca                         mov        r9d, r10d
02049 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
02051 4f8b5c0b08                     mov        r11, qword ptr [r11 + r9 + 8]
02056 4d63ca                         movsxd     r9, r10d
02059 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
02061 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
02069 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
0206e 4e8b540b10                     mov        r10, qword ptr [rbx + r9 + 0x10]
02073 4c89540b10                     mov        qword ptr [rbx + rcx + 0x10], r10
02078 4e8b540b18                     mov        r10, qword ptr [rbx + r9 + 0x18]
0207d 4c89540b18                     mov        qword ptr [rbx + rcx + 0x18], r10
02082 4e8b540b20                     mov        r10, qword ptr [rbx + r9 + 0x20]
02087 4c89540b20                     mov        qword ptr [rbx + rcx + 0x20], r10
0208c 4e8b540b28                     mov        r10, qword ptr [rbx + r9 + 0x28]
02091 4c89540b28                     mov        qword ptr [rbx + rcx + 0x28], r10
02096 4e8b540b30                     mov        r10, qword ptr [rbx + r9 + 0x30]
0209b 4c89540b30                     mov        qword ptr [rbx + rcx + 0x30], r10
020a0 4e8b540b38                     mov        r10, qword ptr [rbx + r9 + 0x38]
020a5 4c89540b38                     mov        qword ptr [rbx + rcx + 0x38], r10
020aa 4e8b540b40                     mov        r10, qword ptr [rbx + r9 + 0x40]
020af 4c89540b40                     mov        qword ptr [rbx + rcx + 0x40], r10
020b4 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
020bc 4183c240                       add        r10d, 0x40
020c0 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
020c8 443bd2                         cmp        r10d, edx
020cb 0f8c5fffffff                   jl         0x7f53ebe62230
020d1 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
020d9 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
020e1 0f8d3ef5ffff                   jge        0x7f53ebe61825
020e7 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
020ef 90                             nop        
020f0 478d1418                       lea        r10d, [r8 + r11]
020f4 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
020fc 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
02101 458bcb                         mov        r9d, r11d
02104 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
0210c 4e89540908                     mov        qword ptr [rcx + r9 + 8], r10
02111 458d5308                       lea        r10d, [r11 + 8]
02115 458bda                         mov        r11d, r10d
02118 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
02120 7cce                           jl         0x7f53ebe622f0
02122 e9fef4ffff                     jmp        0x7f53ebe61825
02127 bee4ffffff                     mov        esi, 0xffffffe4
0212c 488b2c24                       mov        rbp, qword ptr [rsp]
02130 48894424f8                     mov        qword ptr [rsp - 8], rax
02135 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02139 89442408                       mov        dword ptr [rsp + 8], eax
0213d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02142 48ff742420                     push       qword ptr [rsp + 0x20]
02147 488f442418                     pop        qword ptr [rsp + 0x18]
0214c 48894424f8                     mov        qword ptr [rsp - 8], rax
02151 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02155 8944240c                       mov        dword ptr [rsp + 0xc], eax
02159 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215e 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02162 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02167 48894424f8                     mov        qword ptr [rsp - 8], rax
0216c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02170 89442438                       mov        dword ptr [rsp + 0x38], eax
02174 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02179 48ff742478                     push       qword ptr [rsp + 0x78]
0217e 488f442440                     pop        qword ptr [rsp + 0x40]
02183 48894424f8                     mov        qword ptr [rsp - 8], rax
02188 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0218c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02190 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02195 48ffb42480000000               push       qword ptr [rsp + 0x80]
0219d 488f442450                     pop        qword ptr [rsp + 0x50]
021a2 48894424f8                     mov        qword ptr [rsp - 8], rax
021a7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
021ab 89442458                       mov        dword ptr [rsp + 0x58], eax
021af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b4 48894424f8                     mov        qword ptr [rsp - 8], rax
021b9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
021bd 89442460                       mov        dword ptr [rsp + 0x60], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 89442464                       mov        dword ptr [rsp + 0x64], eax
021ca 89942480000000                 mov        dword ptr [rsp + 0x80], edx
021d1 666690                         nop        
021d4 c5f877                         vzeroupper 
021d7 e88412b6ff                     call       0x7f53eb9c3660
021dc 0f1f8400d4220017               nop        dword ptr [rax + rax + 0x170022d4]
021e4 be6effffff                     mov        esi, 0xffffff6e
021e9 488b2c24                       mov        rbp, qword ptr [rsp]
021ed 48894424f8                     mov        qword ptr [rsp - 8], rax
021f2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
021f6 89442408                       mov        dword ptr [rsp + 8], eax
021fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ff 48ff742420                     push       qword ptr [rsp + 0x20]
02204 488f442418                     pop        qword ptr [rsp + 0x18]
02209 48894424f8                     mov        qword ptr [rsp - 8], rax
0220e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02212 8944240c                       mov        dword ptr [rsp + 0xc], eax
02216 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0221f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02224 48894424f8                     mov        qword ptr [rsp - 8], rax
02229 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0222d 89442438                       mov        dword ptr [rsp + 0x38], eax
02231 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02236 48ff742478                     push       qword ptr [rsp + 0x78]
0223b 488f442440                     pop        qword ptr [rsp + 0x40]
02240 48894424f8                     mov        qword ptr [rsp - 8], rax
02245 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02249 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0224d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02252 48894424f8                     mov        qword ptr [rsp - 8], rax
02257 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0225b 89442458                       mov        dword ptr [rsp + 0x58], eax
0225f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02264 48894424f8                     mov        qword ptr [rsp - 8], rax
02269 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0226d 89442460                       mov        dword ptr [rsp + 0x60], eax
02271 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02276 89442464                       mov        dword ptr [rsp + 0x64], eax
0227a 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0227f 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02283 90                             nop        
02284 c5f877                         vzeroupper 
02287 e8d411b6ff                     call       0x7f53eb9c3660
0228c 0f1f840084230018               nop        dword ptr [rax + rax + 0x18002384]
02294 be45ffffff                     mov        esi, 0xffffff45
02299 488b2c24                       mov        rbp, qword ptr [rsp]
0229d 48894424f8                     mov        qword ptr [rsp - 8], rax
022a2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
022a6 89442408                       mov        dword ptr [rsp + 8], eax
022aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022af 48ff742420                     push       qword ptr [rsp + 0x20]
022b4 488f442418                     pop        qword ptr [rsp + 0x18]
022b9 48894424f8                     mov        qword ptr [rsp - 8], rax
022be 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022c2 8944240c                       mov        dword ptr [rsp + 0xc], eax
022c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022cb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
022cf 4489742434                     mov        dword ptr [rsp + 0x34], r14d
022d4 48894424f8                     mov        qword ptr [rsp - 8], rax
022d9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
022dd 89442438                       mov        dword ptr [rsp + 0x38], eax
022e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e6 48ff742478                     push       qword ptr [rsp + 0x78]
022eb 488f442440                     pop        qword ptr [rsp + 0x40]
022f0 48894424f8                     mov        qword ptr [rsp - 8], rax
022f5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
022f9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02302 48894424f8                     mov        qword ptr [rsp - 8], rax
02307 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0230b 89442458                       mov        dword ptr [rsp + 0x58], eax
0230f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02314 48894424f8                     mov        qword ptr [rsp - 8], rax
02319 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0231d 89442460                       mov        dword ptr [rsp + 0x60], eax
02321 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02326 89442464                       mov        dword ptr [rsp + 0x64], eax
0232a 89542478                       mov        dword ptr [rsp + 0x78], edx
0232e 6690                           nop        
02330 c5f877                         vzeroupper 
02333 e82811b6ff                     call       0x7f53eb9c3660
02338 0f1f840030240019               nop        dword ptr [rax + rax + 0x19002430]
02340 be3dffffff                     mov        esi, 0xffffff3d
02345 488b2c24                       mov        rbp, qword ptr [rsp]
02349 48894424f8                     mov        qword ptr [rsp - 8], rax
0234e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02352 89442408                       mov        dword ptr [rsp + 8], eax
02356 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235b 48ff742420                     push       qword ptr [rsp + 0x20]
02360 488f442418                     pop        qword ptr [rsp + 0x18]
02365 48894424f8                     mov        qword ptr [rsp - 8], rax
0236a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0236e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02372 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02377 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0237b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02380 48894424f8                     mov        qword ptr [rsp - 8], rax
02385 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02389 89442438                       mov        dword ptr [rsp + 0x38], eax
0238d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02392 48ff742478                     push       qword ptr [rsp + 0x78]
02397 488f442440                     pop        qword ptr [rsp + 0x40]
0239c 48894424f8                     mov        qword ptr [rsp - 8], rax
023a1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
023a5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ae 48894424f8                     mov        qword ptr [rsp - 8], rax
023b3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
023b7 89442458                       mov        dword ptr [rsp + 0x58], eax
023bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c0 48894424f8                     mov        qword ptr [rsp - 8], rax
023c5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
023c9 89442460                       mov        dword ptr [rsp + 0x60], eax
023cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d2 89442464                       mov        dword ptr [rsp + 0x64], eax
023d6 89542478                       mov        dword ptr [rsp + 0x78], edx
023da 6690                           nop        
023dc c5f877                         vzeroupper 
023df e87c10b6ff                     call       0x7f53eb9c3660
023e4 0f1f8400dc24001a               nop        dword ptr [rax + rax + 0x1a0024dc]
023ec bee4ffffff                     mov        esi, 0xffffffe4
023f1 488b2c24                       mov        rbp, qword ptr [rsp]
023f5 48894424f8                     mov        qword ptr [rsp - 8], rax
023fa 8b442410                       mov        eax, dword ptr [rsp + 0x10]
023fe 89442408                       mov        dword ptr [rsp + 8], eax
02402 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02407 48ff742420                     push       qword ptr [rsp + 0x20]
0240c 488f442418                     pop        qword ptr [rsp + 0x18]
02411 48894424f8                     mov        qword ptr [rsp - 8], rax
02416 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0241a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0241e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02423 48894424f8                     mov        qword ptr [rsp - 8], rax
02428 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0242c 89442434                       mov        dword ptr [rsp + 0x34], eax
02430 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02435 48ff742478                     push       qword ptr [rsp + 0x78]
0243a 488f442438                     pop        qword ptr [rsp + 0x38]
0243f 48894424f8                     mov        qword ptr [rsp - 8], rax
02444 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02448 89442440                       mov        dword ptr [rsp + 0x40], eax
0244c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02451 48ffb42480000000               push       qword ptr [rsp + 0x80]
02459 488f442450                     pop        qword ptr [rsp + 0x50]
0245e 48894424f8                     mov        qword ptr [rsp - 8], rax
02463 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02467 89442444                       mov        dword ptr [rsp + 0x44], eax
0246b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02470 48894424f8                     mov        qword ptr [rsp - 8], rax
02475 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0247c 89442458                       mov        dword ptr [rsp + 0x58], eax
02480 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02485 48894424f8                     mov        qword ptr [rsp - 8], rax
0248a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0248e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02492 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02497 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0249f 90                             nop        
024a0 c5f877                         vzeroupper 
024a3 e8b80fb6ff                     call       0x7f53eb9c3660
024a8 0f1f8400a025001b               nop        dword ptr [rax + rax + 0x1b0025a0]
024b0 bee4ffffff                     mov        esi, 0xffffffe4
024b5 48894424f8                     mov        qword ptr [rsp - 8], rax
024ba 8b442428                       mov        eax, dword ptr [rsp + 0x28]
024be 89442414                       mov        dword ptr [rsp + 0x14], eax
024c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c7 48894424f8                     mov        qword ptr [rsp - 8], rax
024cc 8b442468                       mov        eax, dword ptr [rsp + 0x68]
024d0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
024d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d9 48ff742478                     push       qword ptr [rsp + 0x78]
024de 488f442440                     pop        qword ptr [rsp + 0x40]
024e3 48894424f8                     mov        qword ptr [rsp - 8], rax
024e8 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
024ec 89442448                       mov        dword ptr [rsp + 0x48], eax
024f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f5 48ffb42480000000               push       qword ptr [rsp + 0x80]
024fd 488f442458                     pop        qword ptr [rsp + 0x58]
02502 48894424f8                     mov        qword ptr [rsp - 8], rax
02507 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0250b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0250f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02514 48894424f8                     mov        qword ptr [rsp - 8], rax
02519 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02520 89442460                       mov        dword ptr [rsp + 0x60], eax
02524 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02529 48894424f8                     mov        qword ptr [rsp - 8], rax
0252e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02532 89442464                       mov        dword ptr [rsp + 0x64], eax
02536 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253b 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02540 c5f877                         vzeroupper 
02543 e8180fb6ff                     call       0x7f53eb9c3660
02548 0f1f84004026001c               nop        dword ptr [rax + rax + 0x1c002640]
02550 418d6801                       lea        ebp, [r8 + 1]
02554 bee4ffffff                     mov        esi, 0xffffffe4
02559 48894424f8                     mov        qword ptr [rsp - 8], rax
0255e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02562 89442414                       mov        dword ptr [rsp + 0x14], eax
02566 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256b 48894424f8                     mov        qword ptr [rsp - 8], rax
02570 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02574 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02578 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257d 48ff742478                     push       qword ptr [rsp + 0x78]
02582 488f442440                     pop        qword ptr [rsp + 0x40]
02587 48894424f8                     mov        qword ptr [rsp - 8], rax
0258c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02590 89442448                       mov        dword ptr [rsp + 0x48], eax
02594 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02599 48ffb42480000000               push       qword ptr [rsp + 0x80]
025a1 488f442458                     pop        qword ptr [rsp + 0x58]
025a6 48894424f8                     mov        qword ptr [rsp - 8], rax
025ab 8b442474                       mov        eax, dword ptr [rsp + 0x74]
025af 8944244c                       mov        dword ptr [rsp + 0x4c], eax
025b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b8 48894424f8                     mov        qword ptr [rsp - 8], rax
025bd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
025c4 89442460                       mov        dword ptr [rsp + 0x60], eax
025c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025cd 48894424f8                     mov        qword ptr [rsp - 8], rax
025d2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
025d6 89442464                       mov        dword ptr [rsp + 0x64], eax
025da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025df 4489442474                     mov        dword ptr [rsp + 0x74], r8d
025e4 c5f877                         vzeroupper 
025e7 e8740eb6ff                     call       0x7f53eb9c3660
025ec 0f1f8400e426001d               nop        dword ptr [rax + rax + 0x1d0026e4]
025f4 bee4ffffff                     mov        esi, 0xffffffe4
025f9 48894424f8                     mov        qword ptr [rsp - 8], rax
025fe 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02602 89442414                       mov        dword ptr [rsp + 0x14], eax
02606 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0260b 48894424f8                     mov        qword ptr [rsp - 8], rax
02610 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02614 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02618 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0261d 48ff742478                     push       qword ptr [rsp + 0x78]
02622 488f442440                     pop        qword ptr [rsp + 0x40]
02627 48894424f8                     mov        qword ptr [rsp - 8], rax
0262c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02630 89442448                       mov        dword ptr [rsp + 0x48], eax
02634 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02639 48ffb42480000000               push       qword ptr [rsp + 0x80]
02641 488f442458                     pop        qword ptr [rsp + 0x58]
02646 48894424f8                     mov        qword ptr [rsp - 8], rax
0264b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0264f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02658 48894424f8                     mov        qword ptr [rsp - 8], rax
0265d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02661 89442464                       mov        dword ptr [rsp + 0x64], eax
02665 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266a 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0266f 90                             nop        
02670 c5f877                         vzeroupper 
02673 e8e80db6ff                     call       0x7f53eb9c3660
02678 0f1f84007027001e               nop        dword ptr [rax + rax + 0x1e002770]
02680 bee4ffffff                     mov        esi, 0xffffffe4
02685 488b2c24                       mov        rbp, qword ptr [rsp]
02689 48894424f8                     mov        qword ptr [rsp - 8], rax
0268e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02692 89442408                       mov        dword ptr [rsp + 8], eax
02696 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269b 48ff742420                     push       qword ptr [rsp + 0x20]
026a0 488f442418                     pop        qword ptr [rsp + 0x18]
026a5 48894424f8                     mov        qword ptr [rsp - 8], rax
026aa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026ae 8944240c                       mov        dword ptr [rsp + 0xc], eax
026b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b7 48894424f8                     mov        qword ptr [rsp - 8], rax
026bc 8b442468                       mov        eax, dword ptr [rsp + 0x68]
026c0 89442434                       mov        dword ptr [rsp + 0x34], eax
026c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c9 48ff742478                     push       qword ptr [rsp + 0x78]
026ce 488f442438                     pop        qword ptr [rsp + 0x38]
026d3 48894424f8                     mov        qword ptr [rsp - 8], rax
026d8 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
026dc 89442440                       mov        dword ptr [rsp + 0x40], eax
026e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e5 48894424f8                     mov        qword ptr [rsp - 8], rax
026ea 8b442474                       mov        eax, dword ptr [rsp + 0x74]
026ee 89442444                       mov        dword ptr [rsp + 0x44], eax
026f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f7 48894424f8                     mov        qword ptr [rsp - 8], rax
026fc 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02700 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02704 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02709 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0270e 6690                           nop        
02710 c5f877                         vzeroupper 
02713 e8480db6ff                     call       0x7f53eb9c3660
02718 0f1f84001028001f               nop        dword ptr [rax + rax + 0x1f002810]
02720 beccffffff                     mov        esi, 0xffffffcc
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
02760 89442434                       mov        dword ptr [rsp + 0x34], eax
02764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02769 48ff742478                     push       qword ptr [rsp + 0x78]
0276e 488f442438                     pop        qword ptr [rsp + 0x38]
02773 48894424f8                     mov        qword ptr [rsp - 8], rax
02778 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0277c 89442440                       mov        dword ptr [rsp + 0x40], eax
02780 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02785 48ffb42480000000               push       qword ptr [rsp + 0x80]
0278d 488f442450                     pop        qword ptr [rsp + 0x50]
02792 48894424f8                     mov        qword ptr [rsp - 8], rax
02797 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0279b 89442444                       mov        dword ptr [rsp + 0x44], eax
0279f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a4 48894424f8                     mov        qword ptr [rsp - 8], rax
027a9 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
027b0 89442458                       mov        dword ptr [rsp + 0x58], eax
027b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b9 48894424f8                     mov        qword ptr [rsp - 8], rax
027be 8b442470                       mov        eax, dword ptr [rsp + 0x70]
027c2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027cb 4489442474                     mov        dword ptr [rsp + 0x74], r8d
027d0 c5f877                         vzeroupper 
027d3 e8880cb6ff                     call       0x7f53eb9c3660
027d8 0f1f8400d0280020               nop        dword ptr [rax + rax + 0x200028d0]
027e0 be45ffffff                     mov        esi, 0xffffff45
027e5 488b2c24                       mov        rbp, qword ptr [rsp]
027e9 48894424f8                     mov        qword ptr [rsp - 8], rax
027ee 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027f2 89442408                       mov        dword ptr [rsp + 8], eax
027f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027fb 48ff742420                     push       qword ptr [rsp + 0x20]
02800 488f442418                     pop        qword ptr [rsp + 0x18]
02805 48894424f8                     mov        qword ptr [rsp - 8], rax
0280a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0280e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02812 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02817 48894424f8                     mov        qword ptr [rsp - 8], rax
0281c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02820 89442438                       mov        dword ptr [rsp + 0x38], eax
02824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02829 48894424f8                     mov        qword ptr [rsp - 8], rax
0282e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02832 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02836 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283b 4489442468                     mov        dword ptr [rsp + 0x68], r8d
02840 c5f877                         vzeroupper 
02843 e8180cb6ff                     call       0x7f53eb9c3660
02848 0f1f840040290021               nop        dword ptr [rax + rax + 0x21002940]
02850 bebeffffff                     mov        esi, 0xffffffbe
02855 488b2c24                       mov        rbp, qword ptr [rsp]
02859 48894424f8                     mov        qword ptr [rsp - 8], rax
0285e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02862 89442408                       mov        dword ptr [rsp + 8], eax
02866 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0286b 48ff742420                     push       qword ptr [rsp + 0x20]
02870 488f442418                     pop        qword ptr [rsp + 0x18]
02875 48894424f8                     mov        qword ptr [rsp - 8], rax
0287a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0287e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02882 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02887 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0288b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02890 c5f877                         vzeroupper 
02893 e8c80bb6ff                     call       0x7f53eb9c3660
02898 0f1f840090290022               nop        dword ptr [rax + rax + 0x22002990]
028a0 be85ffffff                     mov        esi, 0xffffff85
028a5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
028a9 48894424f8                     mov        qword ptr [rsp - 8], rax
028ae 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028b2 890424                         mov        dword ptr [rsp], eax
028b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ba 895c2404                       mov        dword ptr [rsp + 4], ebx
028be 4489742408                     mov        dword ptr [rsp + 8], r14d
028c3 90                             nop        
028c4 c5f877                         vzeroupper 
028c7 e8940bb6ff                     call       0x7f53eb9c3660
028cc 0f1f8400c4290023               nop        dword ptr [rax + rax + 0x230029c4]
028d4 beccffffff                     mov        esi, 0xffffffcc
028d9 488b2c24                       mov        rbp, qword ptr [rsp]
028dd 4489742410                     mov        dword ptr [rsp + 0x10], r14d
028e2 895c2414                       mov        dword ptr [rsp + 0x14], ebx
028e6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028eb 90                             nop        
028ec c5f877                         vzeroupper 
028ef e86c0bb6ff                     call       0x7f53eb9c3660
028f4 0f1f8400ec290024               nop        dword ptr [rax + rax + 0x240029ec]
028fc bee4ffffff                     mov        esi, 0xffffffe4
02901 488b2c24                       mov        rbp, qword ptr [rsp]
02905 48894424f8                     mov        qword ptr [rsp - 8], rax
0290a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0290e 89442408                       mov        dword ptr [rsp + 8], eax
02912 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02917 48ff742420                     push       qword ptr [rsp + 0x20]
0291c 488f442418                     pop        qword ptr [rsp + 0x18]
02921 48894424f8                     mov        qword ptr [rsp - 8], rax
02926 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0292a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0292e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02933 48894424f8                     mov        qword ptr [rsp - 8], rax
02938 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0293c 89442434                       mov        dword ptr [rsp + 0x34], eax
02940 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02945 48ff742478                     push       qword ptr [rsp + 0x78]
0294a 488f442438                     pop        qword ptr [rsp + 0x38]
0294f 48894424f8                     mov        qword ptr [rsp - 8], rax
02954 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02958 89442440                       mov        dword ptr [rsp + 0x40], eax
0295c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02961 48ffb42480000000               push       qword ptr [rsp + 0x80]
02969 488f442450                     pop        qword ptr [rsp + 0x50]
0296e 48894424f8                     mov        qword ptr [rsp - 8], rax
02973 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02977 89442444                       mov        dword ptr [rsp + 0x44], eax
0297b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02980 48894424f8                     mov        qword ptr [rsp - 8], rax
02985 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02989 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0298d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02992 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
0299a 6690                           nop        
0299c c5f877                         vzeroupper 
0299f e8bc0ab6ff                     call       0x7f53eb9c3660
029a4 0f1f84009c2a0025               nop        dword ptr [rax + rax + 0x25002a9c]
029ac bee4ffffff                     mov        esi, 0xffffffe4
029b1 488b2c24                       mov        rbp, qword ptr [rsp]
029b5 48894424f8                     mov        qword ptr [rsp - 8], rax
029ba 8b442410                       mov        eax, dword ptr [rsp + 0x10]
029be 89442408                       mov        dword ptr [rsp + 8], eax
029c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c7 48ff742420                     push       qword ptr [rsp + 0x20]
029cc 488f442418                     pop        qword ptr [rsp + 0x18]
029d1 48894424f8                     mov        qword ptr [rsp - 8], rax
029d6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029da 8944240c                       mov        dword ptr [rsp + 0xc], eax
029de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e3 48894424f8                     mov        qword ptr [rsp - 8], rax
029e8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
029ec 89442434                       mov        dword ptr [rsp + 0x34], eax
029f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f5 48ff742478                     push       qword ptr [rsp + 0x78]
029fa 488f442438                     pop        qword ptr [rsp + 0x38]
029ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02a04 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02a08 89442440                       mov        dword ptr [rsp + 0x40], eax
02a0c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a11 48894424f8                     mov        qword ptr [rsp - 8], rax
02a16 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02a1a 89442444                       mov        dword ptr [rsp + 0x44], eax
02a1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a23 48894424f8                     mov        qword ptr [rsp - 8], rax
02a28 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a2c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02a30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a35 4489442468                     mov        dword ptr [rsp + 0x68], r8d
02a3a 6690                           nop        
02a3c c5f877                         vzeroupper 
02a3f e81c0ab6ff                     call       0x7f53eb9c3660
02a44 0f1f84003c2b0026               nop        dword ptr [rax + rax + 0x26002b3c]
02a4c 4183c008                       add        r8d, 8
02a50 be6effffff                     mov        esi, 0xffffff6e
02a55 488b2c24                       mov        rbp, qword ptr [rsp]
02a59 48894424f8                     mov        qword ptr [rsp - 8], rax
02a5e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02a62 89442408                       mov        dword ptr [rsp + 8], eax
02a66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a6b 48ff742420                     push       qword ptr [rsp + 0x20]
02a70 488f442418                     pop        qword ptr [rsp + 0x18]
02a75 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a7e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a87 48894424f8                     mov        qword ptr [rsp - 8], rax
02a8c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02a90 89442434                       mov        dword ptr [rsp + 0x34], eax
02a94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a99 48894424f8                     mov        qword ptr [rsp - 8], rax
02a9e 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
02aa5 89442460                       mov        dword ptr [rsp + 0x60], eax
02aa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aae 4489442464                     mov        dword ptr [rsp + 0x64], r8d
02ab3 90                             nop        
02ab4 c5f877                         vzeroupper 
02ab7 e8a409b6ff                     call       0x7f53eb9c3660
02abc 0f1f8400b42b0027               nop        dword ptr [rax + rax + 0x27002bb4]
02ac4 4183c008                       add        r8d, 8
02ac8 be66ffffff                     mov        esi, 0xffffff66
02acd 488b2c24                       mov        rbp, qword ptr [rsp]
02ad1 48894424f8                     mov        qword ptr [rsp - 8], rax
02ad6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02ada 89442408                       mov        dword ptr [rsp + 8], eax
02ade 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ae3 48ff742420                     push       qword ptr [rsp + 0x20]
02ae8 488f442418                     pop        qword ptr [rsp + 0x18]
02aed 48894424f8                     mov        qword ptr [rsp - 8], rax
02af2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02af6 8944240c                       mov        dword ptr [rsp + 0xc], eax
02afa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aff 48894424f8                     mov        qword ptr [rsp - 8], rax
02b04 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02b08 89442434                       mov        dword ptr [rsp + 0x34], eax
02b0c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b11 4489442464                     mov        dword ptr [rsp + 0x64], r8d
02b16 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02b1b 90                             nop        
02b1c c5f877                         vzeroupper 
02b1f e83c09b6ff                     call       0x7f53eb9c3660
02b24 0f1f84001c2c0028               nop        dword ptr [rax + rax + 0x28002c1c]
02b2c bee4ffffff                     mov        esi, 0xffffffe4
02b31 488b2c24                       mov        rbp, qword ptr [rsp]
02b35 48894424f8                     mov        qword ptr [rsp - 8], rax
02b3a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02b3e 89442408                       mov        dword ptr [rsp + 8], eax
02b42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b47 48ff742420                     push       qword ptr [rsp + 0x20]
02b4c 488f442418                     pop        qword ptr [rsp + 0x18]
02b51 48894424f8                     mov        qword ptr [rsp - 8], rax
02b56 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b5a 8944240c                       mov        dword ptr [rsp + 0xc], eax
02b5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b63 48894424f8                     mov        qword ptr [rsp - 8], rax
02b68 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02b6c 89442434                       mov        dword ptr [rsp + 0x34], eax
02b70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b75 48ff742478                     push       qword ptr [rsp + 0x78]
02b7a 488f442438                     pop        qword ptr [rsp + 0x38]
02b7f 48894424f8                     mov        qword ptr [rsp - 8], rax
02b84 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02b88 89442440                       mov        dword ptr [rsp + 0x40], eax
02b8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b91 48ffb42480000000               push       qword ptr [rsp + 0x80]
02b99 488f442450                     pop        qword ptr [rsp + 0x50]
02b9e 48894424f8                     mov        qword ptr [rsp - 8], rax
02ba3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02ba7 89442444                       mov        dword ptr [rsp + 0x44], eax
02bab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bb0 48894424f8                     mov        qword ptr [rsp - 8], rax
02bb5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02bb9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02bbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bc2 89442460                       mov        dword ptr [rsp + 0x60], eax
02bc6 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02bcb 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02bcf 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02bd4 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02bdc c5f877                         vzeroupper 
02bdf e87c08b6ff                     call       0x7f53eb9c3660
02be4 0f1f8400dc2c0029               nop        dword ptr [rax + rax + 0x29002cdc]
02bec c5fa7f8424c0000000             vmovdqu    xmmword ptr [rsp + 0xc0], xmm0
02bf5 bee4ffffff                     mov        esi, 0xffffffe4
02bfa 488b2c24                       mov        rbp, qword ptr [rsp]
02bfe 48894424f8                     mov        qword ptr [rsp - 8], rax
02c03 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c07 89442408                       mov        dword ptr [rsp + 8], eax
02c0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c10 48ff742420                     push       qword ptr [rsp + 0x20]
02c15 488f442418                     pop        qword ptr [rsp + 0x18]
02c1a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c1f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c23 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c2c 48894424f8                     mov        qword ptr [rsp - 8], rax
02c31 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02c35 89442434                       mov        dword ptr [rsp + 0x34], eax
02c39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c3e 48ff742478                     push       qword ptr [rsp + 0x78]
02c43 488f442438                     pop        qword ptr [rsp + 0x38]
02c48 48894424f8                     mov        qword ptr [rsp - 8], rax
02c4d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02c51 89442440                       mov        dword ptr [rsp + 0x40], eax
02c55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c5a 48ffb42480000000               push       qword ptr [rsp + 0x80]
02c62 488f442450                     pop        qword ptr [rsp + 0x50]
02c67 48894424f8                     mov        qword ptr [rsp - 8], rax
02c6c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02c70 89442444                       mov        dword ptr [rsp + 0x44], eax
02c74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c79 48894424f8                     mov        qword ptr [rsp - 8], rax
02c7e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c82 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02c86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c8b 89442460                       mov        dword ptr [rsp + 0x60], eax
02c8f 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02c94 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02c99 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02ca0 c5f877                         vzeroupper 
02ca3 e8b807b6ff                     call       0x7f53eb9c3660
02ca8 0f1f8400a02d002a               nop        dword ptr [rax + rax + 0x2a002da0]
02cb0 beccffffff                     mov        esi, 0xffffffcc
02cb5 488b2c24                       mov        rbp, qword ptr [rsp]
02cb9 48894424f8                     mov        qword ptr [rsp - 8], rax
02cbe 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02cc2 89442408                       mov        dword ptr [rsp + 8], eax
02cc6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ccb 48ff742420                     push       qword ptr [rsp + 0x20]
02cd0 488f442418                     pop        qword ptr [rsp + 0x18]
02cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
02cda 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02cde 8944240c                       mov        dword ptr [rsp + 0xc], eax
02ce2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ce7 48894424f8                     mov        qword ptr [rsp - 8], rax
02cec 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02cf0 89442438                       mov        dword ptr [rsp + 0x38], eax
02cf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cf9 48ff742478                     push       qword ptr [rsp + 0x78]
02cfe 488f442440                     pop        qword ptr [rsp + 0x40]
02d03 48894424f8                     mov        qword ptr [rsp - 8], rax
02d08 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02d0c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02d10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d15 48ffb42480000000               push       qword ptr [rsp + 0x80]
02d1d 488f442450                     pop        qword ptr [rsp + 0x50]
02d22 48894424f8                     mov        qword ptr [rsp - 8], rax
02d27 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02d2b 89442458                       mov        dword ptr [rsp + 0x58], eax
02d2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d34 48894424f8                     mov        qword ptr [rsp - 8], rax
02d39 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02d40 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02d44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d49 48894424f8                     mov        qword ptr [rsp - 8], rax
02d4e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02d52 89442460                       mov        dword ptr [rsp + 0x60], eax
02d56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d5b 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02d60 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02d64 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02d6b 90                             nop        
02d6c c5f877                         vzeroupper 
02d6f e8ec06b6ff                     call       0x7f53eb9c3660
02d74 0f1f84006c2e002b               nop        dword ptr [rax + rax + 0x2b002e6c]
02d7c 418bee                         mov        ebp, r14d
02d7f 83c510                         add        ebp, 0x10
02d82 be6effffff                     mov        esi, 0xffffff6e
02d87 48894424f8                     mov        qword ptr [rsp - 8], rax
02d8c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d90 89442414                       mov        dword ptr [rsp + 0x14], eax
02d94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d99 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02d9e 48894424f8                     mov        qword ptr [rsp - 8], rax
02da3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02da7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02dab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02db0 48ff742478                     push       qword ptr [rsp + 0x78]
02db5 488f442440                     pop        qword ptr [rsp + 0x40]
02dba 48894424f8                     mov        qword ptr [rsp - 8], rax
02dbf 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02dc3 89442448                       mov        dword ptr [rsp + 0x48], eax
02dc7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dcc 48894424f8                     mov        qword ptr [rsp - 8], rax
02dd1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02dd5 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02dd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dde 48894424f8                     mov        qword ptr [rsp - 8], rax
02de3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02de7 89442464                       mov        dword ptr [rsp + 0x64], eax
02deb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02df0 89442468                       mov        dword ptr [rsp + 0x68], eax
02df4 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02df9 666690                         nop        
02dfc c5f877                         vzeroupper 
02dff e85c06b6ff                     call       0x7f53eb9c3660
02e04 0f1f8400fc2e002c               nop        dword ptr [rax + rax + 0x2c002efc]
02e0c 418bee                         mov        ebp, r14d
02e0f 83c510                         add        ebp, 0x10
02e12 be66ffffff                     mov        esi, 0xffffff66
02e17 48894424f8                     mov        qword ptr [rsp - 8], rax
02e1c 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e20 89442414                       mov        dword ptr [rsp + 0x14], eax
02e24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e29 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02e2e 48894424f8                     mov        qword ptr [rsp - 8], rax
02e33 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02e37 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02e3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e40 48ff742478                     push       qword ptr [rsp + 0x78]
02e45 488f442440                     pop        qword ptr [rsp + 0x40]
02e4a 48894424f8                     mov        qword ptr [rsp - 8], rax
02e4f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02e53 89442448                       mov        dword ptr [rsp + 0x48], eax
02e57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e5c 48894424f8                     mov        qword ptr [rsp - 8], rax
02e61 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02e65 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e6e 48894424f8                     mov        qword ptr [rsp - 8], rax
02e73 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e77 89442464                       mov        dword ptr [rsp + 0x64], eax
02e7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e80 89442468                       mov        dword ptr [rsp + 0x68], eax
02e84 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02e89 666690                         nop        
02e8c c5f877                         vzeroupper 
02e8f e8cc05b6ff                     call       0x7f53eb9c3660
02e94 0f1f84008c2f002d               nop        dword ptr [rax + rax + 0x2d002f8c]
02e9c 488bf0                         mov        rsi, rax
02e9f eb0d                           jmp        0x7f53ebe630ae
02ea1 488bf0                         mov        rsi, rax
02ea4 eb08                           jmp        0x7f53ebe630ae
02ea6 488bf0                         mov        rsi, rax
02ea9 eb03                           jmp        0x7f53ebe630ae
02eab 488bf0                         mov        rsi, rax
02eae c5f877                         vzeroupper 
02eb1 4881c4f0000000                 add        rsp, 0xf0
02eb8 5d                             pop        rbp
02eb9 e92280b6ff                     jmp        0x7f53eb9cb0e0
02ebe bef6ffffff                     mov        esi, 0xfffffff6
02ec3 90                             nop        
02ec4 c5f877                         vzeroupper 
02ec7 e89405b6ff                     call       0x7f53eb9c3660
02ecc 0f1f8400c42f002e               nop        dword ptr [rax + rax + 0x2e002fc4]
02ed4 49babc0fe6eb537f0000           movabs     r10, 0x7f53ebe60fbc
02ede 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02ee5 e9f6ada9ff                     jmp        0x7f53eb8fdee0
02eea e8b179a8ff                     call       0x7f53eb8eaaa0
02eef e93ad1ffff                     jmp        0x7f53ebe6022e
02ef4 f4                             hlt        
02ef5 f4                             hlt        
02ef6 f4                             hlt        
02ef7 f4                             hlt        
