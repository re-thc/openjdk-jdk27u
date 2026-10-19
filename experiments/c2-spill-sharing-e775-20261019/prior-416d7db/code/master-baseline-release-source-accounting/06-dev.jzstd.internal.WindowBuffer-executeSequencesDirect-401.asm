00000 e87b64a217                     call       0x7ffb03887280
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85bc2e0000                   jne        0x7ffaebe63cea
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
00101 49bac0d99603fb7f0000           movabs     r10, 0x7ffb0396d9c0
0010b 41ffd2                         call       r10
0010e 0f1f840000000000               nop        dword ptr [rax + rax]
00116 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011b 4d85d2                         test       r10, r10
0011e 0f847c1b0000                   je         0x7ffaebe62aa0
00124 458b12                         mov        r10d, dword ptr [r10]
00127 41c1ea0d                       shr        r10d, 0xd
0012b 4181fa15040000                 cmp        r10d, 0x415
00132 0f8568270000                   jne        0x7ffaebe636a0
00138 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0013d 4c891424                       mov        qword ptr [rsp], r10
00141 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00146 4d85d2                         test       r10, r10
00149 0f845d1b0000                   je         0x7ffaebe62aac
0014f 458b1a                         mov        r11d, dword ptr [r10]
00152 41c1eb0d                       shr        r11d, 0xd
00156 4181fb05010000                 cmp        r11d, 0x105
0015d 0f853d270000                   jne        0x7ffaebe636a0
00163 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00170 4d85d2                         test       r10, r10
00173 0f84431b0000                   je         0x7ffaebe62abc
00179 458b12                         mov        r10d, dword ptr [r10]
0017c 41c1ea0d                       shr        r10d, 0xd
00180 4181fa08010000                 cmp        r10d, 0x108
00187 0f8513270000                   jne        0x7ffaebe636a0
0018d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00192 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0019a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0019f 4d85d2                         test       r10, r10
001a2 0f84241b0000                   je         0x7ffaebe62acc
001a8 458b1a                         mov        r11d, dword ptr [r10]
001ab 41c1eb0d                       shr        r11d, 0xd
001af 4181fb07010000                 cmp        r11d, 0x107
001b6 0f85e4260000                   jne        0x7ffaebe636a0
001bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c6 4d85d2                         test       r10, r10
001c9 0f840a1b0000                   je         0x7ffaebe62ad9
001cf 458b12                         mov        r10d, dword ptr [r10]
001d2 41c1ea0d                       shr        r10d, 0xd
001d6 4181fa07010000                 cmp        r10d, 0x107
001dd 0f85bd260000                   jne        0x7ffaebe636a0
001e3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001e8 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001f0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f5 4d85d2                         test       r10, r10
001f8 0f84eb1a0000                   je         0x7ffaebe62ae9
001fe 458b1a                         mov        r11d, dword ptr [r10]
00201 41c1eb0d                       shr        r11d, 0xd
00205 4181fb05010000                 cmp        r11d, 0x105
0020c 0f858e260000                   jne        0x7ffaebe636a0
00212 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0021a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00222 458b5204                       mov        r10d, dword ptr [r10 + 4]
00226 4489542408                     mov        dword ptr [rsp + 8], r10d
0022b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00230 4585db                         test       r11d, r11d
00233 0f8417260000                   je         0x7ffaebe63650
00239 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00241 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00245 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0024a 4585db                         test       r11d, r11d
0024d 0f86fd250000                   jbe        0x7ffaebe63650
00253 4183fb01                       cmp        r11d, 1
00257 0f86f3250000                   jbe        0x7ffaebe63650
0025d 4183fb02                       cmp        r11d, 2
00261 0f86e9250000                   jbe        0x7ffaebe63650
00267 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0026f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00273 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00278 4183c2f1                       add        r10d, -0xf
0027c 4585d2                         test       r10d, r10d
0027f 0f8ccb250000                   jl         0x7ffaebe63650
00285 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0028d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00291 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00296 4183c3f1                       add        r11d, -0xf
0029a 4585db                         test       r11d, r11d
0029d 0f8cad250000                   jl         0x7ffaebe63650
002a3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002a8 4183c2f9                       add        r10d, -7
002ac 4585d2                         test       r10d, r10d
002af 0f8c9b250000                   jl         0x7ffaebe63650
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
002f9 e901040000                     jmp        0x7ffaebe614ff
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
0034b 0f8db3090000                   jge        0x7ffaebe61b04
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
00394 0f8c921b0000                   jl         0x7ffaebe62d2c
0039a 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003a2 4585db                         test       r11d, r11d
003a5 0f8c811b0000                   jl         0x7ffaebe62d2c
003ab 458d1c2a                       lea        r11d, [r10 + rbp]
003af 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
003b4 453bd3                         cmp        r10d, r11d
003b7 0f826f1b0000                   jb         0x7ffaebe62d2c
003bd 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c4 03dd                           add        ebx, ebp
003c6 443bd3                         cmp        r10d, ebx
003c9 0f825d1b0000                   jb         0x7ffaebe62d2c
003cf 85ed                           test       ebp, ebp
003d1 0f8c551b0000                   jl         0x7ffaebe62d2c
003d7 85ed                           test       ebp, ebp
003d9 0f8442ffffff                   je         0x7ffaebe61121
003df 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
003e7 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
003ef 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
003f4 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
003fc 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00401 4863d5                         movsxd     rdx, ebp
00404 4883fa20                       cmp        rdx, 0x20
00408 0f86f0feffff                   jbe        0x7ffaebe610fe
0040e c5f877                         vzeroupper 
00411 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
0041b 41ffd2                         call       r10
0041e 0f1f840000000000               nop        dword ptr [rax + rax]
00426 e9f6feffff                     jmp        0x7ffaebe61121
0042b 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00433 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0043b c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00442 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00449 4103da                         add        ebx, r10d
0044c e992020000                     jmp        0x7ffaebe614e3
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
00496 0f8ce1050000                   jl         0x7ffaebe6187d
0049c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004a4 4183fb30                       cmp        r11d, 0x30
004a8 0f8e98000000                   jle        0x7ffaebe61346
004ae 4585c0                         test       r8d, r8d
004b1 0f8cb5190000                   jl         0x7ffaebe62c6c
004b7 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
004bf 4585d2                         test       r10d, r10d
004c2 0f8ca4190000                   jl         0x7ffaebe62c6c
004c8 4503d8                         add        r11d, r8d
004cb 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
004d0 453bcb                         cmp        r9d, r11d
004d3 0f8293190000                   jb         0x7ffaebe62c6c
004d9 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
004e1 0f8285190000                   jb         0x7ffaebe62c6c
004e7 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004ef 4585db                         test       r11d, r11d
004f2 0f84dd010000                   je         0x7ffaebe614d5
004f8 4963d3                         movsxd     rdx, r11d
004fb 4883fa20                       cmp        rdx, 0x20
004ff 7728                           ja         0x7ffaebe61329
00501 458bd3                         mov        r10d, r11d
00504 4d63d2                         movsxd     r10, r10d
00507 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0050e c442a8f5db                     bzhi       r11, r11, r10
00513 c4c1fb92fb                     kmovq      k7, r11
00518 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0051e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00524 e9ac010000                     jmp        0x7ffaebe614d5
00529 c5f877                         vzeroupper 
0052c 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00536 41ffd2                         call       r10
00539 0f1f840000000000               nop        dword ptr [rax + rax]
00541 e98f010000                     jmp        0x7ffaebe614d5
00546 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
0054e 0f83c0150000                   jae        0x7ffaebe62914
00554 4963f8                         movsxd     rdi, r8d
00557 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0055f 4d8b5c3a08                     mov        r11, qword ptr [r10 + rdi + 8]
00564 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
0056c 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00574 0f835e160000                   jae        0x7ffaebe629d8
0057a 448b8c24c4000000               mov        r9d, dword ptr [rsp + 0xc4]
00582 418d5908                       lea        ebx, [r9 + 8]
00586 4d63d1                         movsxd     r10, r9d
00589 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
00591 4e895c1208                     mov        qword ptr [rdx + r10 + 8], r11
00596 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
0059d 0f8d32010000                   jge        0x7ffaebe614d5
005a3 492bfa                         sub        rdi, r10
005a6 4c63db                         movsxd     r11, ebx
005a9 4d8d143b                       lea        r10, [r11 + rdi]
005ad 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005b2 0f8341170000                   jae        0x7ffaebe62af9
005b8 4c8bd1                         mov        r10, rcx
005bb 4d2bd3                         sub        r10, r11
005be 4983c207                       add        r10, 7
005c2 4983e2f8                       and        r10, 0xfffffffffffffff8
005c6 458bda                         mov        r11d, r10d
005c9 478d540b08                     lea        r10d, [r11 + r9 + 8]
005ce 4d63d2                         movsxd     r10, r10d
005d1 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
005d6 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005db 0f8318170000                   jae        0x7ffaebe62af9
005e1 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
005e8 0f830b170000                   jae        0x7ffaebe62af9
005ee 4983c2f8                       add        r10, -8
005f2 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005f7 0f83fc160000                   jae        0x7ffaebe62af9
005fd 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
00605 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
0060c 0f8faa170000                   jg         0x7ffaebe62bbc
00612 452bc1                         sub        r8d, r9d
00615 4183c110                       add        r9d, 0x10
00619 458d1c18                       lea        r11d, [r8 + rbx]
0061d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00625 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
0062a 448bd3                         mov        r10d, ebx
0062d 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00635 4e895c1708                     mov        qword ptr [rdi + r10 + 8], r11
0063a 83c308                         add        ebx, 8
0063d 413bd9                         cmp        ebx, r9d
00640 7cd7                           jl         0x7ffaebe61419
00642 4883c1f8                       add        rcx, -8
00646 4881f900000080                 cmp        rcx, -0x80000000
0064d 49c7c200000080                 mov        r10, 0xffffffff80000000
00654 490f4cca                       cmovl      rcx, r10
00658 8bc9                           mov        ecx, ecx
0065a 3bd9                           cmp        ebx, ecx
0065c 7d40                           jge        0x7ffaebe6149e
0065e 6690                           nop        
00660 458d1c18                       lea        r11d, [r8 + rbx]
00664 448bcb                         mov        r9d, ebx
00667 4d63c9                         movsxd     r9, r9d
0066a 458bd3                         mov        r10d, r11d
0066d 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00675 4a8b7c1708                     mov        rdi, qword ptr [rdi + r10 + 8]
0067a 4d63d3                         movsxd     r10, r11d
0067d 448bdb                         mov        r11d, ebx
00680 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
00688 4a897c1a08                     mov        qword ptr [rdx + r11 + 8], rdi
0068d 4e8b541210                     mov        r10, qword ptr [rdx + r10 + 0x10]
00692 4e89540a10                     mov        qword ptr [rdx + r9 + 0x10], r10
00697 83c310                         add        ebx, 0x10
0069a 3bd9                           cmp        ebx, ecx
0069c 7cc2                           jl         0x7ffaebe61460
0069e 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
006a5 7d2e                           jge        0x7ffaebe614d5
006a7 90                             nop        
006a8 458d1418                       lea        r10d, [r8 + rbx]
006ac 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
006b4 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
006b9 448bdb                         mov        r11d, ebx
006bc 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
006c4 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
006c9 83c308                         add        ebx, 8
006cc 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
006d3 7cd3                           jl         0x7ffaebe614a8
006d5 8b9c24c4000000                 mov        ebx, dword ptr [rsp + 0xc4]
006dc 039c24b8000000                 add        ebx, dword ptr [rsp + 0xb8]
006e3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
006e8 41ffc2                         inc        r10d
006eb 4489542470                     mov        dword ptr [rsp + 0x70], r10d
006f0 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006f4 418502                         test       dword ptr [r10], eax
006f7 448bb424c0000000               mov        r14d, dword ptr [rsp + 0xc0]
006ff 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00707 498d741a08                     lea        rsi, [r10 + rbx + 8]
0070c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00711 452bde                         sub        r11d, r14d
00714 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0071c 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
00721 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00726 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
0072b 0f8d01060000                   jge        0x7ffaebe61b32
00731 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00736 0f83e50e0000                   jae        0x7ffaebe62421
0073c 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
00744 4f8b54d008                     mov        r10, qword ptr [r8 + r10*8 + 8]
00749 418bc2                         mov        eax, r10d
0074c 25ffff0100                     and        eax, 0x1ffff
00751 4d8bc2                         mov        r8, r10
00754 49c1e812                       shr        r8, 0x12
00758 49c1fa24                       sar        r10, 0x24
0075c 458bc8                         mov        r9d, r8d
0075f 458bd2                         mov        r10d, r10d
00762 418bd2                         mov        edx, r10d
00765 4181e1ffff0300                 and        r9d, 0x3ffff
0076c 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
00774 4585d2                         test       r10d, r10d
00777 0f8c4b110000                   jl         0x7ffaebe626c8
0077d 85c0                           test       eax, eax
0077f 0f853b020000                   jne        0x7ffaebe617c0
00785 4533d2                         xor        r10d, r10d
00788 418bc2                         mov        eax, r10d
0078b 448bd2                         mov        r10d, edx
0078e 4183fa03                       cmp        r10d, 3
00792 0f8e4c020000                   jle        0x7ffaebe617e4
00798 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007a0 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
007a4 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
007ac 45895310                       mov        dword ptr [r11 + 0x10], r10d
007b0 458b5b08                       mov        r11d, dword ptr [r11 + 8]
007b4 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007bc 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
007c0 448d52fd                       lea        r10d, [rdx - 3]
007c4 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
007cc 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007d4 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
007dc 45895a08                       mov        dword ptr [r10 + 8], r11d
007e0 4863ac24bc000000               movsxd     rbp, dword ptr [rsp + 0xbc]
007e8 4c63d3                         movsxd     r10, ebx
007eb 4c03542478                     add        r10, qword ptr [rsp + 0x78]
007f0 4863d0                         movsxd     rdx, eax
007f3 4c03d2                         add        r10, rdx
007f6 493bea                         cmp        rbp, r10
007f9 0f8f49110000                   jg         0x7ffaebe62748
007ff 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00807 4585db                         test       r11d, r11d
0080a 0f8e98100000                   jle        0x7ffaebe626a8
00810 448d2c03                       lea        r13d, [rbx + rax]
00814 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0081c 4503d5                         add        r10d, r13d
0081f 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
00824 0f8fbe110000                   jg         0x7ffaebe627e8
0082a 458d1406                       lea        r10d, [r14 + rax]
0082e 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00836 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0083e 0f8f34120000                   jg         0x7ffaebe62878
00844 83f810                         cmp        eax, 0x10
00847 0f8f6a050000                   jg         0x7ffaebe61bb7
0084d 443bb424b4000000               cmp        r14d, dword ptr [rsp + 0xb4]
00855 0f833d0e0000                   jae        0x7ffaebe62498
0085b 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00863 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0086a 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
00871 0f83c90e0000                   jae        0x7ffaebe62540
00877 468d1c30                       lea        r11d, [rax + r14]
0087b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00883 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0088b c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00892 448d1418                       lea        r10d, [rax + rbx]
00896 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0089e 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
008a6 442b8424bc000000               sub        r8d, dword ptr [rsp + 0xbc]
008ae 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
008b6 4183fb10                       cmp        r11d, 0x10
008ba 0f8f91fbffff                   jg         0x7ffaebe61251
008c0 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
008c8 4183fa10                       cmp        r10d, 0x10
008cc 0f8c7ffbffff                   jl         0x7ffaebe61251
008d2 443b8424b0000000               cmp        r8d, dword ptr [rsp + 0xb0]
008da 0f83340f0000                   jae        0x7ffaebe62614
008e0 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
008e8 c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
008ef 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
008f7 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
008ff 0f8226fbffff                   jb         0x7ffaebe6122b
00905 bee4ffffff                     mov        esi, 0xffffffe4
0090a 488b2c24                       mov        rbp, qword ptr [rsp]
0090e 48894424f8                     mov        qword ptr [rsp - 8], rax
00913 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00917 89442408                       mov        dword ptr [rsp + 8], eax
0091b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00920 48ff742420                     push       qword ptr [rsp + 0x20]
00925 488f442418                     pop        qword ptr [rsp + 0x18]
0092a 48894424f8                     mov        qword ptr [rsp - 8], rax
0092f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00933 8944240c                       mov        dword ptr [rsp + 0xc], eax
00937 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0093c 48894424f8                     mov        qword ptr [rsp - 8], rax
00941 8b442468                       mov        eax, dword ptr [rsp + 0x68]
00945 89442438                       mov        dword ptr [rsp + 0x38], eax
00949 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0094e 48894424f8                     mov        qword ptr [rsp - 8], rax
00953 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
00957 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0095b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00960 48ffb42480000000               push       qword ptr [rsp + 0x80]
00968 488f442450                     pop        qword ptr [rsp + 0x50]
0096d 48894424f8                     mov        qword ptr [rsp - 8], rax
00972 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00976 89442458                       mov        dword ptr [rsp + 0x58], eax
0097a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097f 48894424f8                     mov        qword ptr [rsp - 8], rax
00984 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0098b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0098f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00994 48894424f8                     mov        qword ptr [rsp - 8], rax
00999 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0099d 89442460                       mov        dword ptr [rsp + 0x60], eax
009a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a6 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
009af 90                             nop        
009b0 c5f877                         vzeroupper 
009b3 e8a81eb6ff                     call       0x7ffaeb9c3660
009b8 0f1f8400b00a0002               nop        dword ptr [rax + rax + 0x2000ab0]
009c0 413bc3                         cmp        eax, r11d
009c3 0f8ec2fdffff                   jle        0x7ffaebe6158b
009c9 be45ffffff                     mov        esi, 0xffffff45
009ce 8be8                           mov        ebp, eax
009d0 44891c24                       mov        dword ptr [rsp], r11d
009d4 c5f877                         vzeroupper 
009d7 e8841eb6ff                     call       0x7ffaeb9c3660
009dc 0f1f8400d40a0003               nop        dword ptr [rax + rax + 0x3000ad4]
009e4 85c0                           test       eax, eax
009e6 7407                           je         0x7ffaebe617ef
009e8 448d52ff                       lea        r10d, [rdx - 1]
009ec 418bd2                         mov        edx, r10d
009ef 85d2                           test       edx, edx
009f1 7471                           je         0x7ffaebe61864
009f3 83fa03                         cmp        edx, 3
009f6 0f8498180000                   je         0x7ffaebe63094
009fc 83fa02                         cmp        edx, 2
009ff 0f873b190000                   ja         0x7ffaebe63140
00a05 3b54240c                       cmp        edx, dword ptr [rsp + 0xc]
00a09 0f8318170000                   jae        0x7ffaebe62f27
00a0f 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00a17 458b449308                     mov        r8d, dword ptr [r11 + rdx*4 + 8]
00a1c 85d2                           test       edx, edx
00a1e 7e36                           jle        0x7ffaebe61856
00a20 448d52ff                       lea        r10d, [rdx - 1]
00a24 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00a29 0f83b5170000                   jae        0x7ffaebe62fe4
00a2f 90                             nop        
00a30 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00a38 458b5c9304                     mov        r11d, dword ptr [r11 + rdx*4 + 4]
00a3d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00a45 45895c9108                     mov        dword ptr [r9 + rdx*4 + 8], r11d
00a4a 448d52ff                       lea        r10d, [rdx - 1]
00a4e 418bd2                         mov        edx, r10d
00a51 4585d2                         test       r10d, r10d
00a54 7fda                           jg         0x7ffaebe61830
00a56 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a5e 45894208                       mov        dword ptr [r10 + 8], r8d
00a62 eb0c                           jmp        0x7ffaebe61870
00a64 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a6c 458b4208                       mov        r8d, dword ptr [r10 + 8]
00a70 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00a78 e963fdffff                     jmp        0x7ffaebe615e0
00a7d 4183fa10                       cmp        r10d, 0x10
00a81 0f8d591d0000                   jge        0x7ffaebe635e0
00a87 4183fa08                       cmp        r10d, 8
00a8b 0f8d58070000                   jge        0x7ffaebe61fe9
00a91 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00a99 4183fb10                       cmp        r11d, 0x10
00a9d 0f8ebb000000                   jle        0x7ffaebe6195e
00aa3 4585c0                         test       r8d, r8d
00aa6 0f8c741c0000                   jl         0x7ffaebe63520
00aac 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00ab4 4585d2                         test       r10d, r10d
00ab7 0f8c631c0000                   jl         0x7ffaebe63520
00abd 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00ac2 443b9c24c4000000               cmp        r11d, dword ptr [rsp + 0xc4]
00aca 0f82501c0000                   jb         0x7ffaebe63520
00ad0 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00ad8 44039424c4000000               add        r10d, dword ptr [rsp + 0xc4]
00ae0 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00ae8 453bda                         cmp        r11d, r10d
00aeb 0f822f1c0000                   jb         0x7ffaebe63520
00af1 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00af9 4585d2                         test       r10d, r10d
00afc 0f8c1e1c0000                   jl         0x7ffaebe63520
00b02 4585d2                         test       r10d, r10d
00b05 0f844df8ffff                   je         0x7ffaebe61158
00b0b 4883fd20                       cmp        rbp, 0x20
00b0f 772d                           ja         0x7ffaebe6193e
00b11 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b19 4d63d3                         movsxd     r10, r11d
00b1c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b23 c442a8f5db                     bzhi       r11, r11, r10
00b28 c4c1fb92fb                     kmovq      k7, r11
00b2d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b33 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b39 e91af8ffff                     jmp        0x7ffaebe61158
00b3e 488bd5                         mov        rdx, rbp
00b41 c5f877                         vzeroupper 
00b44 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00b4e 41ffd2                         call       r10
00b51 0f1f840000000000               nop        dword ptr [rax + rax]
00b59 e9faf7ffff                     jmp        0x7ffaebe61158
00b5e 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00b63 0f8383180000                   jae        0x7ffaebe631ec
00b69 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00b71 430fbe6c0208                   movsx      ebp, byte ptr [r10 + r8 + 8]
00b77 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00b7f 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b84 0f8326190000                   jae        0x7ffaebe632b0
00b8a 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00b92 448b8c24c4000000               mov        r9d, dword ptr [rsp + 0xc4]
00b9a 43886c0a08                     mov        byte ptr [r10 + r9 + 8], bpl
00b9f 458d5803                       lea        r11d, [r8 + 3]
00ba3 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00bab 41ffc2                         inc        r10d
00bae 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00bb6 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00bbb 0f838f190000                   jae        0x7ffaebe63350
00bc1 4d63c8                         movsxd     r9, r8d
00bc4 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00bcc 430fbe6c0a09                   movsx      ebp, byte ptr [r10 + r9 + 9]
00bd2 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00bda 4183c303                       add        r11d, 3
00bde 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00be3 0f830b1a0000                   jae        0x7ffaebe633f4
00be9 48638c24c4000000               movsxd     rcx, dword ptr [rsp + 0xc4]
00bf1 41886c0a09                     mov        byte ptr [r10 + rcx + 9], bpl
00bf6 470fbe540a0a                   movsx      r10d, byte ptr [r10 + r9 + 0xa]
00bfc 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00c04 4588540b0a                     mov        byte ptr [r11 + rcx + 0xa], r10b
00c09 470fbe5c0b0b                   movsx      r11d, byte ptr [r11 + r9 + 0xb]
00c0f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00c17 45885c0a0b                     mov        byte ptr [r10 + rcx + 0xb], r11b
00c1c 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00c24 4183fb08                       cmp        r11d, 8
00c28 0f83521a0000                   jae        0x7ffaebe63480
00c2e 458bc8                         mov        r9d, r8d
00c31 49ba60ac28e300000000           movabs     r10, 0xe328ac60
00c3b 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00c40 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c45 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c4d 4183fa04                       cmp        r10d, 4
00c51 7e41                           jle        0x7ffaebe61a94
00c53 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00c5a 83c504                         add        ebp, 4
00c5d 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c65 418bd1                         mov        edx, r9d
00c68 c5f877                         vzeroupper 
00c6b e8f09da9ff                     call       0x7ffaeb8fb860
00c70 0f1f8400680d0004               nop        dword ptr [rax + rax + 0x4000d68]
00c78 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c80 8bd5                           mov        edx, ebp
00c82 8bc8                           mov        ecx, eax
00c84 c5f877                         vzeroupper 
00c87 e8d49da9ff                     call       0x7ffaeb8fb860
00c8c 0f1f8400840d0005               nop        dword ptr [rax + rax + 0x5000d84]
00c94 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c9c 4183fb08                       cmp        r11d, 8
00ca0 7e62                           jle        0x7ffaebe61b04
00ca2 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00ca6 49ba88ac28e300000000           movabs     r10, 0xe328ac88
00cb0 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00cb8 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00cbd 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00cc4 83c508                         add        ebp, 8
00cc7 83c208                         add        edx, 8
00cca 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cd2 6690                           nop        
00cd4 c5f877                         vzeroupper 
00cd7 e8849da9ff                     call       0x7ffaeb8fb860
00cdc 0f1f8400d40d0006               nop        dword ptr [rax + rax + 0x6000dd4]
00ce4 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cec 8bd5                           mov        edx, ebp
00cee 488bc8                         mov        rcx, rax
00cf1 666690                         nop        
00cf4 c5f877                         vzeroupper 
00cf7 e8649da9ff                     call       0x7ffaeb8fb860
00cfc 0f1f8400f40d0007               nop        dword ptr [rax + rax + 0x7000df4]
00d04 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00d0b e9d3f9ffff                     jmp        0x7ffaebe614e3
00d10 4d63d3                         movsxd     r10, r11d
00d13 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d1a c442a8f5db                     bzhi       r11, r11, r10
00d1f c4c1fb92fb                     kmovq      k7, r11
00d24 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d2a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d30 eb67                           jmp        0x7ffaebe61b99
00d32 4585f6                         test       r14d, r14d
00d35 0f8c991b0000                   jl         0x7ffaebe636d4
00d3b 85db                           test       ebx, ebx
00d3d 0f8c911b0000                   jl         0x7ffaebe636d4
00d43 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00d48 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00d4d 0f82811b0000                   jb         0x7ffaebe636d4
00d53 428d2c1b                       lea        ebp, [rbx + r11]
00d57 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00d5c 443bd5                         cmp        r10d, ebp
00d5f 0f826f1b0000                   jb         0x7ffaebe636d4
00d65 4585db                         test       r11d, r11d
00d68 0f8c661b0000                   jl         0x7ffaebe636d4
00d6e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00d73 453bc6                         cmp        r8d, r14d
00d76 7421                           je         0x7ffaebe61b99
00d78 4963d3                         movsxd     rdx, r11d
00d7b 4883fa20                       cmp        rdx, 0x20
00d7f 768f                           jbe        0x7ffaebe61b10
00d81 c5f877                         vzeroupper 
00d84 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00d8e 41ffd2                         call       r10
00d91 0f1f840000000000               nop        dword ptr [rax + rax]
00d99 4c8b1424                       mov        r10, qword ptr [rsp]
00d9d 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00da1 c5f877                         vzeroupper 
00da4 4881c4f0000000                 add        rsp, 0xf0
00dab 5d                             pop        rbp
00dac 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00db0 0f871e210000                   ja         0x7ffaebe63cd4
00db6 c3                             ret        
00db7 83f830                         cmp        eax, 0x30
00dba 0f8e83000000                   jle        0x7ffaebe61c43
00dc0 4585f6                         test       r14d, r14d
00dc3 0f8ce71e0000                   jl         0x7ffaebe63ab0
00dc9 85db                           test       ebx, ebx
00dcb 0f8cdf1e0000                   jl         0x7ffaebe63ab0
00dd1 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00dd6 443b9424c0000000               cmp        r10d, dword ptr [rsp + 0xc0]
00dde 0f82cc1e0000                   jb         0x7ffaebe63ab0
00de4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00de9 453bdd                         cmp        r11d, r13d
00dec 0f82be1e0000                   jb         0x7ffaebe63ab0
00df2 85c0                           test       eax, eax
00df4 7426                           je         0x7ffaebe61c1c
00df6 4883fa20                       cmp        rdx, 0x20
00dfa 772d                           ja         0x7ffaebe61c29
00dfc 4c63d0                         movsxd     r10, eax
00dff 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e06 c442a8f5db                     bzhi       r11, r11, r10
00e0b c4c1fb92fb                     kmovq      k7, r11
00e10 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e16 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e1c 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
00e24 e975faffff                     jmp        0x7ffaebe6169e
00e29 c5f877                         vzeroupper 
00e2c 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00e36 41ffd2                         call       r10
00e39 0f1f840000000000               nop        dword ptr [rax + rax]
00e41 ebd9                           jmp        0x7ffaebe61c1c
00e43 443bb424b4000000               cmp        r14d, dword ptr [rsp + 0xb4]
00e4b 0f83db1c0000                   jae        0x7ffaebe6392c
00e51 4d63c6                         movsxd     r8, r14d
00e54 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e5c c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00e63 3b9c24b0000000                 cmp        ebx, dword ptr [rsp + 0xb0]
00e6a 0f837c1d0000                   jae        0x7ffaebe639ec
00e70 448d5b10                       lea        r11d, [rbx + 0x10]
00e74 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e7c 4c63d3                         movsxd     r10, ebx
00e7f 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00e87 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00e8e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00e96 453bdd                         cmp        r11d, r13d
00e99 0f8d33030000                   jge        0x7ffaebe61fd2
00e9f 4d2bc2                         sub        r8, r10
00ea2 4d63d3                         movsxd     r10, r11d
00ea5 48634c241c                     movsxd     rcx, dword ptr [rsp + 0x1c]
00eaa 4883c1f1                       add        rcx, -0xf
00eae 4f8d1c02                       lea        r11, [r10 + r8]
00eb2 4c3bd9                         cmp        r11, rcx
00eb5 0f83c11e0000                   jae        0x7ffaebe63b7c
00ebb 4d63cd                         movsxd     r9, r13d
00ebe 4d8bd9                         mov        r11, r9
00ec1 4d2bda                         sub        r11, r10
00ec4 4983c30f                       add        r11, 0xf
00ec8 4983e3f0                       and        r11, 0xfffffffffffffff0
00ecc 458bdb                         mov        r11d, r11d
00ecf 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00ed4 4d63da                         movsxd     r11, r10d
00ed7 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00edc 4c3bd1                         cmp        r10, rcx
00edf 0f83971e0000                   jae        0x7ffaebe63b7c
00ee5 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00eed 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00ef5 0f83811e0000                   jae        0x7ffaebe63b7c
00efb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f00 4983c2f1                       add        r10, -0xf
00f04 4983c3f0                       add        r11, -0x10
00f08 4d3bda                         cmp        r11, r10
00f0b 0f836b1e0000                   jae        0x7ffaebe63b7c
00f11 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00f18 0f8fee1e0000                   jg         0x7ffaebe63c0c
00f1e 418bce                         mov        ecx, r14d
00f21 2bcb                           sub        ecx, ebx
00f23 83c320                         add        ebx, 0x20
00f26 6690                           nop        
00f28 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f30 448bc1                         mov        r8d, ecx
00f33 44038424c0000000               add        r8d, dword ptr [rsp + 0xc0]
00f3b 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00f43 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00f4a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00f52 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00f59 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f61 4183c210                       add        r10d, 0x10
00f65 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00f6d 443bd3                         cmp        r10d, ebx
00f70 7cb6                           jl         0x7ffaebe61d28
00f72 4981c110ffffff                 add        r9, -0xf0
00f79 4981f900000080                 cmp        r9, -0x80000000
00f80 49c7c200000080                 mov        r10, 0xffffffff80000000
00f87 4d0f4cca                       cmovl      r9, r10
00f8b 458bc1                         mov        r8d, r9d
00f8e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00f96 453bd8                         cmp        r11d, r8d
00f99 0f8ded010000                   jge        0x7ffaebe61f8c
00f9f 458bd3                         mov        r10d, r11d
00fa2 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00faa 660f1f440000                   nop        word ptr [rax + rax]
00fb0 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00fb8 4d63d2                         movsxd     r10, r10d
00fbb 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00fc3 448bd9                         mov        r11d, ecx
00fc6 44039c24c0000000               add        r11d, dword ptr [rsp + 0xc0]
00fce 418bfb                         mov        edi, r11d
00fd1 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00fd9 c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
00fe0 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00fe8 c4817a7f440b08                 vmovdqu    xmmword ptr [r11 + r9 + 8], xmm0
00fef 4c63cf                         movsxd     r9, edi
00ff2 c4a17a6f440b18                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x18]
00ff9 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01001 c4817a7f441318                 vmovdqu    xmmword ptr [r11 + r10 + 0x18], xmm0
01008 c4a17a6f440b28                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x28]
0100f 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01017 c4817a7f441328                 vmovdqu    xmmword ptr [r11 + r10 + 0x28], xmm0
0101e c4a17a6f440b38                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x38]
01025 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0102d c4817a7f441338                 vmovdqu    xmmword ptr [r11 + r10 + 0x38], xmm0
01034 c4a17a6f440b48                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x48]
0103b 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01043 c4817a7f441348                 vmovdqu    xmmword ptr [r11 + r10 + 0x48], xmm0
0104a c4a17a6f440b58                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x58]
01051 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01059 c4817a7f441358                 vmovdqu    xmmword ptr [r11 + r10 + 0x58], xmm0
01060 c4a17a6f440b68                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x68]
01067 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0106f c4817a7f441368                 vmovdqu    xmmword ptr [r11 + r10 + 0x68], xmm0
01076 c4a17a6f440b78                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x78]
0107d 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01085 c4817a7f441378                 vmovdqu    xmmword ptr [r11 + r10 + 0x78], xmm0
0108c c4a17a6f840b88000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x88]
01096 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0109e c4817a7f841388000000           vmovdqu    xmmword ptr [r11 + r10 + 0x88], xmm0
010a8 c4a17a6f840b98000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x98]
010b2 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010ba c4817a7f841398000000           vmovdqu    xmmword ptr [r11 + r10 + 0x98], xmm0
010c4 c4a17a6f840ba8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xa8]
010ce 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010d6 c4817a7f8413a8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xa8], xmm0
010e0 c4a17a6f840bb8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xb8]
010ea 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010f2 c4817a7f8413b8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xb8], xmm0
010fc c4a17a6f840bc8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xc8]
01106 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0110e c4817a7f8413c8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xc8], xmm0
01118 c4a17a6f840bd8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xd8]
01122 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0112a c4817a7f8413d8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xd8], xmm0
01134 c4a17a6f840be8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xe8]
0113e 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01146 c4817a7f8413e8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xe8], xmm0
01150 c4a17a6f840bf8000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xf8]
0115a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01162 c4817a7f8413f8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xf8], xmm0
0116c 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01174 4181c300010000                 add        r11d, 0x100
0117b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01183 453bd8                         cmp        r11d, r8d
01186 0f8c24feffff                   jl         0x7ffaebe61db0
0118c 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
01194 453bd5                         cmp        r10d, r13d
01197 7d39                           jge        0x7ffaebe61fd2
01199 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
011a1 666690                         nop        
011a4 468d1401                       lea        r10d, [rcx + r8]
011a8 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
011b0 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
011b7 458bd8                         mov        r11d, r8d
011ba 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
011c2 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
011c9 4183c010                       add        r8d, 0x10
011cd 453bc5                         cmp        r8d, r13d
011d0 7cd2                           jl         0x7ffaebe61fa4
011d2 4103c6                         add        eax, r14d
011d5 898424c0000000                 mov        dword ptr [rsp + 0xc0], eax
011dc 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
011e4 e9b5f6ffff                     jmp        0x7ffaebe6169e
011e9 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
011f1 0f8305170000                   jae        0x7ffaebe636fc
011f7 4963d8                         movsxd     rbx, r8d
011fa 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01202 4d8b541a08                     mov        r10, qword ptr [r10 + rbx + 8]
01207 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0120f 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
01217 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0121f 0f8387170000                   jae        0x7ffaebe637ac
01225 458d4a08                       lea        r9d, [r10 + 8]
01229 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
01231 4d63da                         movsxd     r11, r10d
01234 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0123c 488bbc24d0000000               mov        rdi, qword ptr [rsp + 0xd0]
01244 4b897c1908                     mov        qword ptr [r9 + r11 + 8], rdi
01249 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01251 443b8c24c8000000               cmp        r9d, dword ptr [rsp + 0xc8]
01259 0f8db6030000                   jge        0x7ffaebe62415
0125f 492bdb                         sub        rbx, r11
01262 4963f9                         movsxd     rdi, r9d
01265 4c8d1c1f                       lea        r11, [rdi + rbx]
01269 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0126e 0f83d8170000                   jae        0x7ffaebe6384c
01274 4c8bd9                         mov        r11, rcx
01277 4c2bdf                         sub        r11, rdi
0127a 4983c307                       add        r11, 7
0127e 4983e3f8                       and        r11, 0xfffffffffffffff8
01282 458bcb                         mov        r9d, r11d
01285 478d5c1108                     lea        r11d, [r9 + r10 + 8]
0128a 4d63db                         movsxd     r11, r11d
0128d 4d8d4c1bf8                     lea        r9, [r11 + rbx - 8]
01292 4c3b4c2438                     cmp        r9, qword ptr [rsp + 0x38]
01297 0f83af170000                   jae        0x7ffaebe6384c
0129d 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
012a4 3b9c248c000000                 cmp        ebx, dword ptr [rsp + 0x8c]
012ab 0f839b170000                   jae        0x7ffaebe6384c
012b1 4983c3f8                       add        r11, -8
012b5 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
012ba 0f838c170000                   jae        0x7ffaebe6384c
012c0 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
012c8 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
012cf 0f8fef170000                   jg         0x7ffaebe638c4
012d5 452bc2                         sub        r8d, r10d
012d8 41b9f8ffffff                   mov        r9d, 0xfffffff8
012de 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
012e6 498bf3                         mov        rsi, r11
012e9 4c8d59c8                       lea        r11, [rcx - 0x38]
012ed 4981fb00000080                 cmp        r11, -0x80000000
012f4 48c7c300000080                 mov        rbx, 0xffffffff80000000
012fb 4c0f4cdb                       cmovl      r11, rbx
012ff 418bd3                         mov        edx, r11d
01302 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0130a 418bdb                         mov        ebx, r11d
0130d 442bcb                         sub        r9d, ebx
01310 452bca                         sub        r9d, r10d
01313 4183c210                       add        r10d, 0x10
01317 418bda                         mov        ebx, r10d
0131a 4183c1f0                       add        r9d, -0x10
0131e 4d63d2                         movsxd     r10, r10d
01321 41bb06000000                   mov        r11d, 6
01327 c442a0f5d9                     bzhi       r11, r9, r11
0132c 4d03d3                         add        r10, r11
0132f 4c3bd1                         cmp        r10, rcx
01332 4c8bd9                         mov        r11, rcx
01335 4d0f4cda                       cmovl      r11, r10
01339 4d8bd3                         mov        r10, r11
0133c 4c2bd7                         sub        r10, rdi
0133f 4d8d4aff                       lea        r9, [r10 - 1]
01343 49c1f93f                       sar        r9, 0x3f
01347 49c1e93d                       shr        r9, 0x3d
0134b 4f8d5411ff                     lea        r10, [r9 + r10 - 1]
01350 4983e2f8                       and        r10, 0xfffffffffffffff8
01354 4c03d7                         add        r10, rdi
01357 493bfa                         cmp        rdi, r10
0135a 490f4cfa                       cmovl      rdi, r10
0135e 448bd7                         mov        r10d, edi
01361 458d4a08                       lea        r9d, [r10 + 8]
01365 442b9424bc000000               sub        r10d, dword ptr [rsp + 0xbc]
0136d 4963c1                         movsxd     rax, r9d
01370 4803c6                         add        rax, rsi
01373 4183c208                       add        r10d, 8
01377 4963fa                         movsxd     rdi, r10d
0137a 4803fe                         add        rdi, rsi
0137d 4c8d4848                       lea        r9, [rax + 0x48]
01381 4883c008                       add        rax, 8
01385 488d7708                       lea        rsi, [rdi + 8]
01389 4533d2                         xor        r10d, r10d
0138c 4c3bce                         cmp        r9, rsi
0138f 410f96c2                       setbe      r10b
01393 4883c748                       add        rdi, 0x48
01397 4533c9                         xor        r9d, r9d
0139a 483bf8                         cmp        rdi, rax
0139d 410f96c1                       setbe      r9b
013a1 450bd1                         or         r10d, r9d
013a4 0f841e0c0000                   je         0x7ffaebe62dc8
013aa 458bd3                         mov        r10d, r11d
013ad 666690                         nop        
013b0 458bd8                         mov        r11d, r8d
013b3 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
013bb 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
013c3 4f8b5c1908                     mov        r11, qword ptr [r9 + r11 + 8]
013c8 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
013d0 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
013d8 4e895c0b08                     mov        qword ptr [rbx + r9 + 8], r11
013dd 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
013e5 4183c108                       add        r9d, 8
013e9 44898c24b8000000               mov        dword ptr [rsp + 0xb8], r9d
013f1 453bca                         cmp        r9d, r10d
013f4 7cba                           jl         0x7ffaebe621b0
013f6 4881c108feffff                 add        rcx, -0x1f8
013fd 4881f900000080                 cmp        rcx, -0x80000000
01404 49c7c200000080                 mov        r10, 0xffffffff80000000
0140b 490f4cca                       cmovl      rcx, r10
0140f 8bd9                           mov        ebx, ecx
01411 443bcb                         cmp        r9d, ebx
01414 0f8db4010000                   jge        0x7ffaebe623ce
0141a 458bd9                         mov        r11d, r9d
0141d 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01425 6666660f1f840000000000         nop        word ptr [rax + rax]
01430 458bd0                         mov        r10d, r8d
01433 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
0143b 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
01443 4181c100010000                 add        r9d, 0x100
0144a 4503c8                         add        r9d, r8d
0144d 418bca                         mov        ecx, r10d
01450 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01458 62d17e486f840b08000000         vmovdqu32  zmm0, zmmword ptr [r11 + rcx + 8]
01463 4963ca                         movsxd     rcx, r10d
01466 458bd9                         mov        r11d, r9d
01469 4963f9                         movsxd     rdi, r9d
0146c 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01474 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0147c 62917e487f841108000000         vmovdqu32  zmmword ptr [r9 + r10 + 8], zmm0
01487 62d17e486f840948000000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x48]
01492 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
0149a 4963f1                         movsxd     rsi, r9d
0149d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
014a5 62d17e487f843248000000         vmovdqu32  zmmword ptr [r10 + rsi + 0x48], zmm0
014b0 448b8c24b8000000               mov        r9d, dword ptr [rsp + 0xb8]
014b8 4181c180000000                 add        r9d, 0x80
014bf 4503c8                         add        r9d, r8d
014c2 418bc1                         mov        eax, r9d
014c5 62917e486f840a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r9 + 8]
014d0 62d17e487f843288000000         vmovdqu32  zmmword ptr [r10 + rsi + 0x88], zmm0
014db 4c63d0                         movsxd     r10, eax
014de 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
014e6 62917e486f841148000000         vmovdqu32  zmm0, zmmword ptr [r9 + r10 + 0x48]
014f1 62d17e487f8431c8000000         vmovdqu32  zmmword ptr [r9 + rsi + 0xc8], zmm0
014fc 62917e486f841908000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 8]
01507 62d17e487f843108010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x108], zmm0
01512 62d17e486f843948000000         vmovdqu32  zmm0, zmmword ptr [r9 + rdi + 0x48]
0151d 62d17e487f843148010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x148], zmm0
01528 62d17e486f840988010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x188]
01533 62d17e487f843188010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x188], zmm0
0153e 62d17e486f8409c8010000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx + 0x1c8]
01549 62d17e487f8431c8010000         vmovdqu32  zmmword ptr [r9 + rsi + 0x1c8], zmm0
01554 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0155c 4181c200020000                 add        r10d, 0x200
01563 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0156b 443bd3                         cmp        r10d, ebx
0156e 0f8cbcfeffff                   jl         0x7ffaebe62230
01574 443bd2                         cmp        r10d, edx
01577 7d55                           jge        0x7ffaebe623ce
01579 458bda                         mov        r11d, r10d
0157c 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01584 458bd8                         mov        r11d, r8d
01587 44039c24b8000000               add        r11d, dword ptr [rsp + 0xb8]
0158f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01597 62917e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 8]
015a2 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
015aa 62917e487f841a08000000         vmovdqu32  zmmword ptr [r10 + r11 + 8], zmm0
015b5 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
015bd 4183c240                       add        r10d, 0x40
015c1 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
015c9 443bd2                         cmp        r10d, edx
015cc 7cb6                           jl         0x7ffaebe62384
015ce 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
015d6 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
015de 7d35                           jge        0x7ffaebe62415
015e0 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
015e7 90                             nop        
015e8 458d1c18                       lea        r11d, [r8 + rbx]
015ec 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
015f4 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
015f9 448bcb                         mov        r9d, ebx
015fc 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01604 4f89540b08                     mov        qword ptr [r11 + r9 + 8], r10
01609 83c308                         add        ebx, 8
0160c 3b9c24c8000000                 cmp        ebx, dword ptr [rsp + 0xc8]
01613 7cd3                           jl         0x7ffaebe623e8
01615 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
0161c e9c2f0ffff                     jmp        0x7ffaebe614e3
01621 bee4ffffff                     mov        esi, 0xffffffe4
01626 488b2c24                       mov        rbp, qword ptr [rsp]
0162a 48894424f8                     mov        qword ptr [rsp - 8], rax
0162f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01633 89442408                       mov        dword ptr [rsp + 8], eax
01637 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163c 48ff742420                     push       qword ptr [rsp + 0x20]
01641 488f442418                     pop        qword ptr [rsp + 0x18]
01646 48894424f8                     mov        qword ptr [rsp - 8], rax
0164b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0164f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01658 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0165c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01661 48894424f8                     mov        qword ptr [rsp - 8], rax
01666 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0166a 89442438                       mov        dword ptr [rsp + 0x38], eax
0166e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01673 48894424f8                     mov        qword ptr [rsp - 8], rax
01678 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0167c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01680 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01685 666690                         nop        
01688 c5f877                         vzeroupper 
0168b e8d011b6ff                     call       0x7ffaeb9c3660
01690 0f1f840088170008               nop        dword ptr [rax + rax + 0x8001788]
01698 bee4ffffff                     mov        esi, 0xffffffe4
0169d 488b2c24                       mov        rbp, qword ptr [rsp]
016a1 48894424f8                     mov        qword ptr [rsp - 8], rax
016a6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016aa 89442408                       mov        dword ptr [rsp + 8], eax
016ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b3 48ff742420                     push       qword ptr [rsp + 0x20]
016b8 488f442418                     pop        qword ptr [rsp + 0x18]
016bd 48894424f8                     mov        qword ptr [rsp - 8], rax
016c2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016c6 8944240c                       mov        dword ptr [rsp + 0xc], eax
016ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016cf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016d3 48894424f8                     mov        qword ptr [rsp - 8], rax
016d8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016dc 89442438                       mov        dword ptr [rsp + 0x38], eax
016e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e5 48ff742478                     push       qword ptr [rsp + 0x78]
016ea 488f442440                     pop        qword ptr [rsp + 0x40]
016ef 48894424f8                     mov        qword ptr [rsp - 8], rax
016f4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
016f8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01701 48894424f8                     mov        qword ptr [rsp - 8], rax
01706 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0170a 89442458                       mov        dword ptr [rsp + 0x58], eax
0170e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01713 48894424f8                     mov        qword ptr [rsp - 8], rax
01718 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0171c 89442460                       mov        dword ptr [rsp + 0x60], eax
01720 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01725 89442464                       mov        dword ptr [rsp + 0x64], eax
01729 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0172e 6690                           nop        
01730 c5f877                         vzeroupper 
01733 e82811b6ff                     call       0x7ffaeb9c3660
01738 0f1f840030180009               nop        dword ptr [rax + rax + 0x9001830]
01740 bee4ffffff                     mov        esi, 0xffffffe4
01745 488b2c24                       mov        rbp, qword ptr [rsp]
01749 48894424f8                     mov        qword ptr [rsp - 8], rax
0174e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01752 89442408                       mov        dword ptr [rsp + 8], eax
01756 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175b 48ff742420                     push       qword ptr [rsp + 0x20]
01760 488f442418                     pop        qword ptr [rsp + 0x18]
01765 48894424f8                     mov        qword ptr [rsp - 8], rax
0176a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0176e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01772 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01777 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0177c 48894424f8                     mov        qword ptr [rsp - 8], rax
01781 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01785 89442438                       mov        dword ptr [rsp + 0x38], eax
01789 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178e 48ff742478                     push       qword ptr [rsp + 0x78]
01793 488f442440                     pop        qword ptr [rsp + 0x40]
01798 48894424f8                     mov        qword ptr [rsp - 8], rax
0179d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017a1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017aa 48ffb42480000000               push       qword ptr [rsp + 0x80]
017b2 488f442450                     pop        qword ptr [rsp + 0x50]
017b7 48894424f8                     mov        qword ptr [rsp - 8], rax
017bc 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017c0 89442458                       mov        dword ptr [rsp + 0x58], eax
017c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c9 48894424f8                     mov        qword ptr [rsp - 8], rax
017ce 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
017d5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
017d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017de 48894424f8                     mov        qword ptr [rsp - 8], rax
017e3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
017e7 89442460                       mov        dword ptr [rsp + 0x60], eax
017eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f0 89442464                       mov        dword ptr [rsp + 0x64], eax
017f4 895c2478                       mov        dword ptr [rsp + 0x78], ebx
017f8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01801 666690                         nop        
01804 c5f877                         vzeroupper 
01807 e85410b6ff                     call       0x7ffaeb9c3660
0180c 0f1f84000419000a               nop        dword ptr [rax + rax + 0xa001904]
01814 bee4ffffff                     mov        esi, 0xffffffe4
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
0184b 48894424f8                     mov        qword ptr [rsp - 8], rax
01850 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01854 89442438                       mov        dword ptr [rsp + 0x38], eax
01858 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185d 48894424f8                     mov        qword ptr [rsp - 8], rax
01862 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01866 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0186a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186f 48894424f8                     mov        qword ptr [rsp - 8], rax
01874 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01878 89442458                       mov        dword ptr [rsp + 0x58], eax
0187c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01881 48894424f8                     mov        qword ptr [rsp - 8], rax
01886 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0188a 89442460                       mov        dword ptr [rsp + 0x60], eax
0188e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01893 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01898 c5f877                         vzeroupper 
0189b e8c00fb6ff                     call       0x7ffaeb9c3660
018a0 0f1f84009819000b               nop        dword ptr [rax + rax + 0xb001998]
018a8 be45ffffff                     mov        esi, 0xffffff45
018ad 488b2c24                       mov        rbp, qword ptr [rsp]
018b1 4c89542408                     mov        qword ptr [rsp + 8], r10
018b6 6690                           nop        
018b8 c5f877                         vzeroupper 
018bb e8a00fb6ff                     call       0x7ffaeb9c3660
018c0 0f1f8400b819000c               nop        dword ptr [rax + rax + 0xc0019b8]
018c8 be45ffffff                     mov        esi, 0xffffff45
018cd 488b2c24                       mov        rbp, qword ptr [rsp]
018d1 48894424f8                     mov        qword ptr [rsp - 8], rax
018d6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018da 89442408                       mov        dword ptr [rsp + 8], eax
018de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e3 48ff742420                     push       qword ptr [rsp + 0x20]
018e8 488f442418                     pop        qword ptr [rsp + 0x18]
018ed 48894424f8                     mov        qword ptr [rsp - 8], rax
018f2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018f6 8944240c                       mov        dword ptr [rsp + 0xc], eax
018fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ff 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01903 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01908 48894424f8                     mov        qword ptr [rsp - 8], rax
0190d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01911 89442438                       mov        dword ptr [rsp + 0x38], eax
01915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191a 48894424f8                     mov        qword ptr [rsp - 8], rax
0191f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01923 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01927 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0192c 89442464                       mov        dword ptr [rsp + 0x64], eax
01930 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01935 666690                         nop        
01938 c5f877                         vzeroupper 
0193b e8200fb6ff                     call       0x7ffaeb9c3660
01940 0f1f8400381a000d               nop        dword ptr [rax + rax + 0xd001a38]
01948 493bea                         cmp        rbp, r10
0194b bdffffffff                     mov        ebp, 0xffffffff
01950 7c08                           jl         0x7ffaebe6275a
01952 400f95c5                       setne      bpl
01956 400fb6ed                       movzx      ebp, bpl
0195a be45ffffff                     mov        esi, 0xffffff45
0195f 48894424f8                     mov        qword ptr [rsp - 8], rax
01964 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01968 89442414                       mov        dword ptr [rsp + 0x14], eax
0196c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01971 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01975 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
0197a 48894424f8                     mov        qword ptr [rsp - 8], rax
0197f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01983 89442440                       mov        dword ptr [rsp + 0x40], eax
01987 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198c 48ff742478                     push       qword ptr [rsp + 0x78]
01991 488f442448                     pop        qword ptr [rsp + 0x48]
01996 48894424f8                     mov        qword ptr [rsp - 8], rax
0199b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0199f 89442444                       mov        dword ptr [rsp + 0x44], eax
019a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a8 48894424f8                     mov        qword ptr [rsp - 8], rax
019ad 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019b1 89442460                       mov        dword ptr [rsp + 0x60], eax
019b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ba 48894424f8                     mov        qword ptr [rsp - 8], rax
019bf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019c3 89442468                       mov        dword ptr [rsp + 0x68], eax
019c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cc 8944246c                       mov        dword ptr [rsp + 0x6c], eax
019d0 4c89542478                     mov        qword ptr [rsp + 0x78], r10
019d5 666690                         nop        
019d8 c5f877                         vzeroupper 
019db e8800eb6ff                     call       0x7ffaeb9c3660
019e0 0f1f8400d81a000e               nop        dword ptr [rax + rax + 0xe001ad8]
019e8 be45ffffff                     mov        esi, 0xffffff45
019ed 488b2c24                       mov        rbp, qword ptr [rsp]
019f1 48894424f8                     mov        qword ptr [rsp - 8], rax
019f6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019fa 89442408                       mov        dword ptr [rsp + 8], eax
019fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a03 48ff742420                     push       qword ptr [rsp + 0x20]
01a08 488f442418                     pop        qword ptr [rsp + 0x18]
01a0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a12 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a16 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01a23 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01a28 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a31 89442438                       mov        dword ptr [rsp + 0x38], eax
01a35 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a43 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a51 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a55 89442460                       mov        dword ptr [rsp + 0x60], eax
01a59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5e 89442464                       mov        dword ptr [rsp + 0x64], eax
01a62 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01a67 90                             nop        
01a68 c5f877                         vzeroupper 
01a6b e8f00db6ff                     call       0x7ffaeb9c3660
01a70 0f1f8400681b000f               nop        dword ptr [rax + rax + 0xf001b68]
01a78 be45ffffff                     mov        esi, 0xffffff45
01a7d 488b2c24                       mov        rbp, qword ptr [rsp]
01a81 48894424f8                     mov        qword ptr [rsp - 8], rax
01a86 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a8a 89442408                       mov        dword ptr [rsp + 8], eax
01a8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a93 48ff742420                     push       qword ptr [rsp + 0x20]
01a98 488f442418                     pop        qword ptr [rsp + 0x18]
01a9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01aa6 8944240c                       mov        dword ptr [rsp + 0xc], eax
01aaa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aaf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01ab3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01ab8 48894424f8                     mov        qword ptr [rsp - 8], rax
01abd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ac1 89442438                       mov        dword ptr [rsp + 0x38], eax
01ac5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aca 48894424f8                     mov        qword ptr [rsp - 8], rax
01acf 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ad3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ad7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01adc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ae5 89442458                       mov        dword ptr [rsp + 0x58], eax
01ae9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aee 48894424f8                     mov        qword ptr [rsp - 8], rax
01af3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01af7 89442460                       mov        dword ptr [rsp + 0x60], eax
01afb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b00 89442464                       mov        dword ptr [rsp + 0x64], eax
01b04 c5f877                         vzeroupper 
01b07 e8540db6ff                     call       0x7ffaeb9c3660
01b0c 0f1f8400041c0010               nop        dword ptr [rax + rax + 0x10001c04]
01b14 bee4ffffff                     mov        esi, 0xffffffe4
01b19 488b2c24                       mov        rbp, qword ptr [rsp]
01b1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b22 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b26 89442408                       mov        dword ptr [rsp + 8], eax
01b2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2f 48ff742420                     push       qword ptr [rsp + 0x20]
01b34 488f442418                     pop        qword ptr [rsp + 0x18]
01b39 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b42 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b50 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b54 89442438                       mov        dword ptr [rsp + 0x38], eax
01b58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5d 48ff742478                     push       qword ptr [rsp + 0x78]
01b62 488f442440                     pop        qword ptr [rsp + 0x40]
01b67 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b70 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b79 48ffb42480000000               push       qword ptr [rsp + 0x80]
01b81 488f442450                     pop        qword ptr [rsp + 0x50]
01b86 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01b8f 89442458                       mov        dword ptr [rsp + 0x58], eax
01b93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b98 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01ba4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ba8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bad 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01bb6 89442460                       mov        dword ptr [rsp + 0x60], eax
01bba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bbf 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01bc7 90                             nop        
01bc8 c5f877                         vzeroupper 
01bcb e8900cb6ff                     call       0x7ffaeb9c3660
01bd0 0f1f8400c81c0011               nop        dword ptr [rax + rax + 0x11001cc8]
01bd8 bee4ffffff                     mov        esi, 0xffffffe4
01bdd 488b2c24                       mov        rbp, qword ptr [rsp]
01be1 48894424f8                     mov        qword ptr [rsp - 8], rax
01be6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bea 89442408                       mov        dword ptr [rsp + 8], eax
01bee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf3 48ff742420                     push       qword ptr [rsp + 0x20]
01bf8 488f442418                     pop        qword ptr [rsp + 0x18]
01bfd 48894424f8                     mov        qword ptr [rsp - 8], rax
01c02 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c06 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c14 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c18 89442438                       mov        dword ptr [rsp + 0x38], eax
01c1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c21 48ff742478                     push       qword ptr [rsp + 0x78]
01c26 488f442440                     pop        qword ptr [rsp + 0x40]
01c2b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c30 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c34 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c38 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3d 48ffb42480000000               push       qword ptr [rsp + 0x80]
01c45 488f442450                     pop        qword ptr [rsp + 0x50]
01c4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01c53 89442458                       mov        dword ptr [rsp + 0x58], eax
01c57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c61 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01c68 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01c6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c71 48894424f8                     mov        qword ptr [rsp - 8], rax
01c76 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c7a 89442460                       mov        dword ptr [rsp + 0x60], eax
01c7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c83 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01c88 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01c8d 666690                         nop        
01c90 c5f877                         vzeroupper 
01c93 e8c80bb6ff                     call       0x7ffaeb9c3660
01c98 0f1f8400901d0012               nop        dword ptr [rax + rax + 0x12001d90]
01ca0 4533d2                         xor        r10d, r10d
01ca3 4c891424                       mov        qword ptr [rsp], r10
01ca7 e995e4ffff                     jmp        0x7ffaebe60f41
01cac 4533d2                         xor        r10d, r10d
01caf 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01cb7 e9afe4ffff                     jmp        0x7ffaebe60f6b
01cbc 4533d2                         xor        r10d, r10d
01cbf 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01cc7 e9cee4ffff                     jmp        0x7ffaebe60f9a
01ccc 4533d2                         xor        r10d, r10d
01ccf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01cd4 e9e8e4ffff                     jmp        0x7ffaebe60fc1
01cd9 4533d2                         xor        r10d, r10d
01cdc 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01ce4 e907e5ffff                     jmp        0x7ffaebe60ff0
01ce9 4533d2                         xor        r10d, r10d
01cec 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01cf4 e921e5ffff                     jmp        0x7ffaebe6101a
01cf9 4183c008                       add        r8d, 8
01cfd be6effffff                     mov        esi, 0xffffff6e
01d02 488b2c24                       mov        rbp, qword ptr [rsp]
01d06 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d0f 89442408                       mov        dword ptr [rsp + 8], eax
01d13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d18 48ff742420                     push       qword ptr [rsp + 0x20]
01d1d 488f442418                     pop        qword ptr [rsp + 0x18]
01d22 48894424f8                     mov        qword ptr [rsp - 8], rax
01d27 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d2b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d34 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01d39 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3e 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d42 89442438                       mov        dword ptr [rsp + 0x38], eax
01d46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4b 48ff742478                     push       qword ptr [rsp + 0x78]
01d50 488f442440                     pop        qword ptr [rsp + 0x40]
01d55 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5a 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d5e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d67 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d70 89442458                       mov        dword ptr [rsp + 0x58], eax
01d74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d79 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d82 89442460                       mov        dword ptr [rsp + 0x60], eax
01d86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d90 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
01d97 89442468                       mov        dword ptr [rsp + 0x68], eax
01d9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da0 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01da5 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01da9 666690                         nop        
01dac c5f877                         vzeroupper 
01daf e8ac0ab6ff                     call       0x7ffaeb9c3660
01db4 0f1f8400ac1e0013               nop        dword ptr [rax + rax + 0x13001eac]
01dbc 4183c008                       add        r8d, 8
01dc0 be66ffffff                     mov        esi, 0xffffff66
01dc5 488b2c24                       mov        rbp, qword ptr [rsp]
01dc9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dce 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01dd2 89442408                       mov        dword ptr [rsp + 8], eax
01dd6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ddb 48ff742420                     push       qword ptr [rsp + 0x20]
01de0 488f442418                     pop        qword ptr [rsp + 0x18]
01de5 48894424f8                     mov        qword ptr [rsp - 8], rax
01dea 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dee 8944240c                       mov        dword ptr [rsp + 0xc], eax
01df2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df7 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01dfc 48894424f8                     mov        qword ptr [rsp - 8], rax
01e01 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e05 89442438                       mov        dword ptr [rsp + 0x38], eax
01e09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e0e 48ff742478                     push       qword ptr [rsp + 0x78]
01e13 488f442440                     pop        qword ptr [rsp + 0x40]
01e18 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01e21 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e33 89442458                       mov        dword ptr [rsp + 0x58], eax
01e37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e41 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e45 89442460                       mov        dword ptr [rsp + 0x60], eax
01e49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4e 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01e53 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01e57 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01e5c c5f877                         vzeroupper 
01e5f e8fc09b6ff                     call       0x7ffaeb9c3660
01e64 0f1f84005c1f0014               nop        dword ptr [rax + rax + 0x14001f5c]
01e6c beccffffff                     mov        esi, 0xffffffcc
01e71 488b2c24                       mov        rbp, qword ptr [rsp]
01e75 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e7e 89442408                       mov        dword ptr [rsp + 8], eax
01e82 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e87 48ff742420                     push       qword ptr [rsp + 0x20]
01e8c 488f442418                     pop        qword ptr [rsp + 0x18]
01e91 48894424f8                     mov        qword ptr [rsp - 8], rax
01e96 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e9a 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01eac 89442438                       mov        dword ptr [rsp + 0x38], eax
01eb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb5 48ff742478                     push       qword ptr [rsp + 0x78]
01eba 488f442440                     pop        qword ptr [rsp + 0x40]
01ebf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ec8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ecc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed1 48ffb42480000000               push       qword ptr [rsp + 0x80]
01ed9 488f442450                     pop        qword ptr [rsp + 0x50]
01ede 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ee7 89442458                       mov        dword ptr [rsp + 0x58], eax
01eeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ef9 89442460                       mov        dword ptr [rsp + 0x60], eax
01efd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f02 48894424f8                     mov        qword ptr [rsp - 8], rax
01f07 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01f0e 89442464                       mov        dword ptr [rsp + 0x64], eax
01f12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f17 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01f1c c5f877                         vzeroupper 
01f1f e83c09b6ff                     call       0x7ffaeb9c3660
01f24 0f1f84001c200015               nop        dword ptr [rax + rax + 0x1500201c]
01f2c beccffffff                     mov        esi, 0xffffffcc
01f31 48894424f8                     mov        qword ptr [rsp - 8], rax
01f36 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f3a 89442414                       mov        dword ptr [rsp + 0x14], eax
01f3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f43 48894424f8                     mov        qword ptr [rsp - 8], rax
01f48 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f4c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f55 48ff742478                     push       qword ptr [rsp + 0x78]
01f5a 488f442440                     pop        qword ptr [rsp + 0x40]
01f5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01f64 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01f68 89442448                       mov        dword ptr [rsp + 0x48], eax
01f6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f71 48ffb42480000000               push       qword ptr [rsp + 0x80]
01f79 488f442458                     pop        qword ptr [rsp + 0x58]
01f7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f83 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01f87 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01f8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f90 48894424f8                     mov        qword ptr [rsp - 8], rax
01f95 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01f9c 89442460                       mov        dword ptr [rsp + 0x60], eax
01fa0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fa5 48894424f8                     mov        qword ptr [rsp - 8], rax
01faa 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01fae 89442464                       mov        dword ptr [rsp + 0x64], eax
01fb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb7 90                             nop        
01fb8 c5f877                         vzeroupper 
01fbb e8a008b6ff                     call       0x7ffaeb9c3660
01fc0 0f1f8400b8200016               nop        dword ptr [rax + rax + 0x160020b8]
01fc8 458bd0                         mov        r10d, r8d
01fcb 44039424b8000000               add        r10d, dword ptr [rsp + 0xb8]
01fd3 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01fdb 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01fe0 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
01fe8 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
01ff0 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
01ff5 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01ffd 4183c208                       add        r10d, 8
02001 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
02009 443bd3                         cmp        r10d, ebx
0200c 7cba                           jl         0x7ffaebe62dc8
0200e 443bd2                         cmp        r10d, edx
02011 0f8dba000000                   jge        0x7ffaebe62ed1
02017 458bda                         mov        r11d, r10d
0201a 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
02022 0f1f8000000000                 nop        dword ptr [rax]
02029 0f1f8000000000                 nop        dword ptr [rax]
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
020cb 0f8c5fffffff                   jl         0x7ffaebe62e30
020d1 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
020d9 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
020e1 0f8d2ef5ffff                   jge        0x7ffaebe62415
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
02120 7cce                           jl         0x7ffaebe62ef0
02122 e9eef4ffff                     jmp        0x7ffaebe62415
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
021d7 e88406b6ff                     call       0x7ffaeb9c3660
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
0227a 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0227f 8954247c                       mov        dword ptr [rsp + 0x7c], edx
02283 90                             nop        
02284 c5f877                         vzeroupper 
02287 e8d405b6ff                     call       0x7ffaeb9c3660
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
02333 e82805b6ff                     call       0x7ffaeb9c3660
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
023df e87c04b6ff                     call       0x7ffaeb9c3660
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
024a3 e8b803b6ff                     call       0x7ffaeb9c3660
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
02543 e81803b6ff                     call       0x7ffaeb9c3660
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
025e7 e87402b6ff                     call       0x7ffaeb9c3660
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
02673 e8e801b6ff                     call       0x7ffaeb9c3660
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
02713 e84801b6ff                     call       0x7ffaeb9c3660
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
027d3 e88800b6ff                     call       0x7ffaeb9c3660
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
02843 e81800b6ff                     call       0x7ffaeb9c3660
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
02893 e8c8ffb5ff                     call       0x7ffaeb9c3660
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
028c7 e894ffb5ff                     call       0x7ffaeb9c3660
028cc 0f1f8400c4290023               nop        dword ptr [rax + rax + 0x230029c4]
028d4 beccffffff                     mov        esi, 0xffffffcc
028d9 488b2c24                       mov        rbp, qword ptr [rsp]
028dd 4489742410                     mov        dword ptr [rsp + 0x10], r14d
028e2 895c2414                       mov        dword ptr [rsp + 0x14], ebx
028e6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028eb 90                             nop        
028ec c5f877                         vzeroupper 
028ef e86cffb5ff                     call       0x7ffaeb9c3660
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
0299f e8bcfeb5ff                     call       0x7ffaeb9c3660
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
02a3f e81cfeb5ff                     call       0x7ffaeb9c3660
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
02ab7 e8a4fdb5ff                     call       0x7ffaeb9c3660
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
02b1f e83cfdb5ff                     call       0x7ffaeb9c3660
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
02bdf e87cfcb5ff                     call       0x7ffaeb9c3660
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
02ca3 e8b8fbb5ff                     call       0x7ffaeb9c3660
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
02d6f e8ecfab5ff                     call       0x7ffaeb9c3660
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
02dff e85cfab5ff                     call       0x7ffaeb9c3660
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
02e8f e8ccf9b5ff                     call       0x7ffaeb9c3660
02e94 0f1f84008c2f002d               nop        dword ptr [rax + rax + 0x2d002f8c]
02e9c 488bf0                         mov        rsi, rax
02e9f eb0d                           jmp        0x7ffaebe63cae
02ea1 488bf0                         mov        rsi, rax
02ea4 eb08                           jmp        0x7ffaebe63cae
02ea6 488bf0                         mov        rsi, rax
02ea9 eb03                           jmp        0x7ffaebe63cae
02eab 488bf0                         mov        rsi, rax
02eae c5f877                         vzeroupper 
02eb1 4881c4f0000000                 add        rsp, 0xf0
02eb8 5d                             pop        rbp
02eb9 e9225bb6ff                     jmp        0x7ffaeb9c97e0
02ebe bef6ffffff                     mov        esi, 0xfffffff6
02ec3 90                             nop        
02ec4 c5f877                         vzeroupper 
02ec7 e894f9b5ff                     call       0x7ffaeb9c3660
02ecc 0f1f8400c42f002e               nop        dword ptr [rax + rax + 0x2e002fc4]
02ed4 49baac1be6ebfa7f0000           movabs     r10, 0x7ffaebe61bac
02ede 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02ee5 e9f6a1a9ff                     jmp        0x7ffaeb8fdee0
02eea e8b16da8ff                     call       0x7ffaeb8eaaa0
02eef e93ad1ffff                     jmp        0x7ffaebe60e2e
02ef4 f4                             hlt        
02ef5 f4                             hlt        
02ef6 f4                             hlt        
02ef7 f4                             hlt        
