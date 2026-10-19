00000 e83b69e217                     call       0x7f603fc81640
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85f82c0000                   jne        0x7f6027e5da26
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
00101 49ba807dd63f607f0000           movabs     r10, 0x7f603fd67d80
0010b 41ffd2                         call       r10
0010e 0f1f840000000000               nop        dword ptr [rax + rax]
00116 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011b 4d85d2                         test       r10, r10
0011e 0f84981a0000                   je         0x7f6027e5c8bc
00124 458b12                         mov        r10d, dword ptr [r10]
00127 41c1ea0d                       shr        r10d, 0xd
0012b 4181fa15410000                 cmp        r10d, 0x4115
00132 0f8520250000                   jne        0x7f6027e5d358
00138 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0013d 4c891424                       mov        qword ptr [rsp], r10
00141 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00146 4d85d2                         test       r10, r10
00149 0f84791a0000                   je         0x7f6027e5c8c8
0014f 458b1a                         mov        r11d, dword ptr [r10]
00152 41c1eb0d                       shr        r11d, 0xd
00156 4181fbe4050000                 cmp        r11d, 0x5e4
0015d 0f85f5240000                   jne        0x7f6027e5d358
00163 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00170 4d85d2                         test       r10, r10
00173 0f845f1a0000                   je         0x7f6027e5c8d8
00179 458b12                         mov        r10d, dword ptr [r10]
0017c 41c1ea0d                       shr        r10d, 0xd
00180 4181fae7050000                 cmp        r10d, 0x5e7
00187 0f85cb240000                   jne        0x7f6027e5d358
0018d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00192 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0019a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0019f 4d85d2                         test       r10, r10
001a2 0f84401a0000                   je         0x7f6027e5c8e8
001a8 458b1a                         mov        r11d, dword ptr [r10]
001ab 41c1eb0d                       shr        r11d, 0xd
001af 4181fbe6050000                 cmp        r11d, 0x5e6
001b6 0f859c240000                   jne        0x7f6027e5d358
001bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c6 4d85d2                         test       r10, r10
001c9 0f84261a0000                   je         0x7f6027e5c8f5
001cf 458b12                         mov        r10d, dword ptr [r10]
001d2 41c1ea0d                       shr        r10d, 0xd
001d6 4181fae6050000                 cmp        r10d, 0x5e6
001dd 0f8575240000                   jne        0x7f6027e5d358
001e3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001e8 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001f0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f5 4d85d2                         test       r10, r10
001f8 0f84071a0000                   je         0x7f6027e5c905
001fe 458b1a                         mov        r11d, dword ptr [r10]
00201 41c1eb0d                       shr        r11d, 0xd
00205 4181fbe4050000                 cmp        r11d, 0x5e4
0020c 0f8546240000                   jne        0x7f6027e5d358
00212 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0021a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00222 458b5204                       mov        r10d, dword ptr [r10 + 4]
00226 4489542408                     mov        dword ptr [rsp + 8], r10d
0022b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00230 4585db                         test       r11d, r11d
00233 0f84cf230000                   je         0x7f6027e5d308
00239 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00241 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00245 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0024a 4585db                         test       r11d, r11d
0024d 0f86b5230000                   jbe        0x7f6027e5d308
00253 4183fb01                       cmp        r11d, 1
00257 0f86ab230000                   jbe        0x7f6027e5d308
0025d 4183fb02                       cmp        r11d, 2
00261 0f86a1230000                   jbe        0x7f6027e5d308
00267 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0026f 458b5204                       mov        r10d, dword ptr [r10 + 4]
00273 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00278 4183c2f1                       add        r10d, -0xf
0027c 4585d2                         test       r10d, r10d
0027f 0f8c83230000                   jl         0x7f6027e5d308
00285 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0028d 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00291 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00296 4183c3f1                       add        r11d, -0xf
0029a 4585db                         test       r11d, r11d
0029d 0f8c65230000                   jl         0x7f6027e5d308
002a3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002a8 4183c2f9                       add        r10d, -7
002ac 4585d2                         test       r10d, r10d
002af 0f8c53230000                   jl         0x7f6027e5d308
002b5 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002ba 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
002bf 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
002c4 458d5af1                       lea        r11d, [r10 - 0xf]
002c8 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
002d0 458d51f9                       lea        r10d, [r9 - 7]
002d4 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
002dc 4d63d1                         movsxd     r10, r9d
002df 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002e4 4183c1f1                       add        r9d, -0xf
002e8 44898c24b4000000               mov        dword ptr [rsp + 0xb4], r9d
002f0 4983c2f9                       add        r10, -7
002f4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002f9 e907040000                     jmp        0x7f6027e5b405
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
0034b 0f8dc3090000                   jge        0x7f6027e5ba14
00351 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
00358 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00360 442b9c24bc000000               sub        r11d, dword ptr [rsp + 0xbc]
00368 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00370 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
00377 2bac24bc000000                 sub        ebp, dword ptr [rsp + 0xbc]
0037e 3bac24bc000000                 cmp        ebp, dword ptr [rsp + 0xbc]
00385 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0038d 410f4fea                       cmovg      ebp, r10d
00391 4585db                         test       r11d, r11d
00394 0f8caa1a0000                   jl         0x7f6027e5cb44
0039a 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
003a2 4585c0                         test       r8d, r8d
003a5 0f8c991a0000                   jl         0x7f6027e5cb44
003ab 458d142b                       lea        r10d, [r11 + rbp]
003af 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
003b4 453bc2                         cmp        r8d, r10d
003b7 0f82871a0000                   jb         0x7f6027e5cb44
003bd 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003c4 03dd                           add        ebx, ebp
003c6 443bc3                         cmp        r8d, ebx
003c9 0f82751a0000                   jb         0x7f6027e5cb44
003cf 85ed                           test       ebp, ebp
003d1 0f8c6d1a0000                   jl         0x7f6027e5cb44
003d7 85ed                           test       ebp, ebp
003d9 0f8442ffffff                   je         0x7f6027e5b021
003df 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
003e7 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003ef 4b8d741008                     lea        rsi, [r8 + r10 + 8]
003f4 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
003f9 4863d5                         movsxd     rdx, ebp
003fc 4883fa20                       cmp        rdx, 0x20
00400 0f86f8feffff                   jbe        0x7f6027e5affe
00406 c5f877                         vzeroupper 
00409 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00413 41ffd2                         call       r10
00416 0f1f840000000000               nop        dword ptr [rax + rax]
0041e e9fefeffff                     jmp        0x7f6027e5b021
00423 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
0042b 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00433 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0043a 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00441 4103db                         add        ebx, r11d
00444 e9a0020000                     jmp        0x7f6027e5b3e9
00449 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00451 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00459 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
0045e 498d7c0a08                     lea        rdi, [r10 + rcx + 8]
00463 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0046b 44039424c4000000               add        r10d, dword ptr [rsp + 0xc4]
00473 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
0047b 4d63ca                         movsxd     r9, r10d
0047e 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00486 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
0048e 0f8cf9050000                   jl         0x7f6027e5b78d
00494 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0049c 4183fa30                       cmp        r10d, 0x30
004a0 0f8e9f000000                   jle        0x7f6027e5b245
004a6 85c9                           test       ecx, ecx
004a8 0f8cd6180000                   jl         0x7f6027e5ca84
004ae 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
004b6 4585d2                         test       r10d, r10d
004b9 0f8cc5180000                   jl         0x7f6027e5ca84
004bf 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
004c7 4403d1                         add        r10d, ecx
004ca 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
004cf 453bda                         cmp        r11d, r10d
004d2 0f82ac180000                   jb         0x7f6027e5ca84
004d8 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
004e0 0f829e180000                   jb         0x7f6027e5ca84
004e6 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
004ee 4585d2                         test       r10d, r10d
004f1 0f84e4010000                   je         0x7f6027e5b3db
004f7 4963d2                         movsxd     rdx, r10d
004fa 4883fa20                       cmp        rdx, 0x20
004fe 7728                           ja         0x7f6027e5b228
00500 458bda                         mov        r11d, r10d
00503 4d63d3                         movsxd     r10, r11d
00506 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0050d c442a8f5db                     bzhi       r11, r11, r10
00512 c4c1fb92fb                     kmovq      k7, r11
00517 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0051d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00523 e9b3010000                     jmp        0x7f6027e5b3db
00528 c5f877                         vzeroupper 
0052b 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00535 41ffd2                         call       r10
00538 0f1f840000000000               nop        dword ptr [rax + rax]
00540 e996010000                     jmp        0x7f6027e5b3db
00545 3b8c24b0000000                 cmp        ecx, dword ptr [rsp + 0xb0]
0054c 0f83e2140000                   jae        0x7f6027e5c734
00552 4863f9                         movsxd     rdi, ecx
00555 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0055d 4d8b443a08                     mov        r8, qword ptr [r10 + rdi + 8]
00562 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
0056a 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
00572 0f8380150000                   jae        0x7f6027e5c7f8
00578 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00580 458d5a08                       lea        r11d, [r10 + 8]
00584 4963da                         movsxd     rbx, r10d
00587 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
0058f 4c89441a08                     mov        qword ptr [rdx + rbx + 8], r8
00594 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0059c 0f8d39010000                   jge        0x7f6027e5b3db
005a2 482bfb                         sub        rdi, rbx
005a5 4963db                         movsxd     rbx, r11d
005a8 4c8d043b                       lea        r8, [rbx + rdi]
005ac 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
005b1 0f835e160000                   jae        0x7f6027e5c915
005b7 4d8bc1                         mov        r8, r9
005ba 4c2bc3                         sub        r8, rbx
005bd 4983c007                       add        r8, 7
005c1 4983e0f8                       and        r8, 0xfffffffffffffff8
005c5 418bd8                         mov        ebx, r8d
005c8 468d441308                     lea        r8d, [rbx + r10 + 8]
005cd 4d63c0                         movsxd     r8, r8d
005d0 498d5c38f8                     lea        rbx, [r8 + rdi - 8]
005d5 483b5c2438                     cmp        rbx, qword ptr [rsp + 0x38]
005da 0f8335160000                   jae        0x7f6027e5c915
005e0 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
005e8 0f8327160000                   jae        0x7f6027e5c915
005ee 4983c0f8                       add        r8, -8
005f2 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
005f7 0f8318160000                   jae        0x7f6027e5c915
005fd 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00604 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
0060a 0f8fc4160000                   jg         0x7f6027e5c9d4
00610 412bca                         sub        ecx, r10d
00613 4183c210                       add        r10d, 0x10
00617 428d1c19                       lea        ebx, [rcx + r11]
0061b 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00623 498b5c1808                     mov        rbx, qword ptr [r8 + rbx + 8]
00628 458bc3                         mov        r8d, r11d
0062b 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00633 4a895c0708                     mov        qword ptr [rdi + r8 + 8], rbx
00638 4183c308                       add        r11d, 8
0063c 453bda                         cmp        r11d, r10d
0063f 7cd6                           jl         0x7f6027e5b317
00641 4983c1f8                       add        r9, -8
00645 4981f900000080                 cmp        r9, -0x80000000
0064c 49c7c200000080                 mov        r10, 0xffffffff80000000
00653 4d0f4cca                       cmovl      r9, r10
00657 458bd1                         mov        r10d, r9d
0065a 453bda                         cmp        r11d, r10d
0065d 7d41                           jge        0x7f6027e5b3a0
0065f 90                             nop        
00660 468d0c19                       lea        r9d, [rcx + r11]
00664 418bdb                         mov        ebx, r11d
00667 4863db                         movsxd     rbx, ebx
0066a 458bc1                         mov        r8d, r9d
0066d 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00675 4a8b7c0708                     mov        rdi, qword ptr [rdi + r8 + 8]
0067a 4d63c1                         movsxd     r8, r9d
0067d 458bcb                         mov        r9d, r11d
00680 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
00688 4a897c0a08                     mov        qword ptr [rdx + r9 + 8], rdi
0068d 4e8b440210                     mov        r8, qword ptr [rdx + r8 + 0x10]
00692 4c89441a10                     mov        qword ptr [rdx + rbx + 0x10], r8
00697 4183c310                       add        r11d, 0x10
0069b 453bda                         cmp        r11d, r10d
0069e 7cc0                           jl         0x7f6027e5b360
006a0 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
006a8 7d31                           jge        0x7f6027e5b3db
006aa 6690                           nop        
006ac 468d0419                       lea        r8d, [rcx + r11]
006b0 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
006b8 4f8b440208                     mov        r8, qword ptr [r10 + r8 + 8]
006bd 458bd3                         mov        r10d, r11d
006c0 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
006c8 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
006cd 4183c308                       add        r11d, 8
006d1 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
006d9 7cd1                           jl         0x7f6027e5b3ac
006db 8b9c24c4000000                 mov        ebx, dword ptr [rsp + 0xc4]
006e2 039c24b8000000                 add        ebx, dword ptr [rsp + 0xb8]
006e9 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006ed 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
006f2 41ffc0                         inc        r8d
006f5 4489442470                     mov        dword ptr [rsp + 0x70], r8d
006fa 418502                         test       dword ptr [r10], eax
006fd 448bb424c0000000               mov        r14d, dword ptr [rsp + 0xc0]
00705 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0070d 498d741a08                     lea        rsi, [r10 + rbx + 8]
00712 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00717 452bc6                         sub        r8d, r14d
0071a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00722 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
00727 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0072c 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
00731 0f8d0b060000                   jge        0x7f6027e5ba42
00737 443b542408                     cmp        r10d, dword ptr [rsp + 8]
0073c 0f83ff0d0000                   jae        0x7f6027e5c241
00742 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
0074a 4f8b54d308                     mov        r10, qword ptr [r11 + r10*8 + 8]
0074f 418bc2                         mov        eax, r10d
00752 25ffff0100                     and        eax, 0x1ffff
00757 4d8bda                         mov        r11, r10
0075a 49c1eb12                       shr        r11, 0x12
0075e 49c1fa24                       sar        r10, 0x24
00762 458bdb                         mov        r11d, r11d
00765 458bd2                         mov        r10d, r10d
00768 418bd2                         mov        edx, r10d
0076b 4181e3ffff0300                 and        r11d, 0x3ffff
00772 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0077a 4585d2                         test       r10d, r10d
0077d 0f8c65100000                   jl         0x7f6027e5c4e8
00783 85c0                           test       eax, eax
00785 0f8539020000                   jne        0x7f6027e5b6c4
0078b 4533d2                         xor        r10d, r10d
0078e 418bc2                         mov        eax, r10d
00791 448bd2                         mov        r10d, edx
00794 4183fa03                       cmp        r10d, 3
00798 0f8e4a020000                   jle        0x7f6027e5b6e8
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
007ff 0f8f63100000                   jg         0x7f6027e5c568
00805 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
0080d 4585c0                         test       r8d, r8d
00810 0f8eb20f0000                   jle        0x7f6027e5c4c8
00816 448d2c03                       lea        r13d, [rbx + rax]
0081a 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00822 4503d5                         add        r10d, r13d
00825 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
0082a 0f8fd8100000                   jg         0x7f6027e5c608
00830 458d1c06                       lea        r11d, [r14 + rax]
00834 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0083c 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00844 0f8f4e110000                   jg         0x7f6027e5c698
0084a 83f810                         cmp        eax, 0x10
0084d 0f8f74050000                   jg         0x7f6027e5bac7
00853 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
0085b 0f83570d0000                   jae        0x7f6027e5c2b8
00861 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00869 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00870 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
00877 0f83e30d0000                   jae        0x7f6027e5c360
0087d 468d1c30                       lea        r11d, [rax + r14]
00881 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00889 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00891 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00898 448d1418                       lea        r10d, [rax + rbx]
0089c 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
008a4 8b8c24c4000000                 mov        ecx, dword ptr [rsp + 0xc4]
008ab 2b8c24bc000000                 sub        ecx, dword ptr [rsp + 0xbc]
008b2 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
008ba 4183fa10                       cmp        r10d, 0x10
008be 0f8f85fbffff                   jg         0x7f6027e5b149
008c4 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
008cc 4183fb10                       cmp        r11d, 0x10
008d0 0f8c73fbffff                   jl         0x7f6027e5b149
008d6 3b8c24b4000000                 cmp        ecx, dword ptr [rsp + 0xb4]
008dd 0f83510e0000                   jae        0x7f6027e5c434
008e3 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
008eb c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
008f2 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
008fa 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
00902 0f821bfbffff                   jb         0x7f6027e5b123
00908 bee4ffffff                     mov        esi, 0xffffffe4
0090d 488b2c24                       mov        rbp, qword ptr [rsp]
00911 48894424f8                     mov        qword ptr [rsp - 8], rax
00916 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0091a 89442408                       mov        dword ptr [rsp + 8], eax
0091e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00923 48ff742420                     push       qword ptr [rsp + 0x20]
00928 488f442418                     pop        qword ptr [rsp + 0x18]
0092d 48894424f8                     mov        qword ptr [rsp - 8], rax
00932 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00936 8944240c                       mov        dword ptr [rsp + 0xc], eax
0093a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0093f 48894424f8                     mov        qword ptr [rsp - 8], rax
00944 8b442468                       mov        eax, dword ptr [rsp + 0x68]
00948 89442438                       mov        dword ptr [rsp + 0x38], eax
0094c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00951 48894424f8                     mov        qword ptr [rsp - 8], rax
00956 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0095a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0095e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00963 48ffb42480000000               push       qword ptr [rsp + 0x80]
0096b 488f442450                     pop        qword ptr [rsp + 0x50]
00970 48894424f8                     mov        qword ptr [rsp - 8], rax
00975 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00979 89442458                       mov        dword ptr [rsp + 0x58], eax
0097d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00982 48894424f8                     mov        qword ptr [rsp - 8], rax
00987 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0098e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00992 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00997 48894424f8                     mov        qword ptr [rsp - 8], rax
0099c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
009a0 89442460                       mov        dword ptr [rsp + 0x60], eax
009a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a9 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
009b2 6690                           nop        
009b4 c5f877                         vzeroupper 
009b7 e8a47fb6ff                     call       0x7f60279c3660
009bc 0f1f8400b40a0002               nop        dword ptr [rax + rax + 0x2000ab4]
009c4 413bc0                         cmp        eax, r8d
009c7 0f8ec4fdffff                   jle        0x7f6027e5b491
009cd be45ffffff                     mov        esi, 0xffffff45
009d2 8be8                           mov        ebp, eax
009d4 44890424                       mov        dword ptr [rsp], r8d
009d8 c5f877                         vzeroupper 
009db e8807fb6ff                     call       0x7f60279c3660
009e0 0f1f8400d80a0003               nop        dword ptr [rax + rax + 0x3000ad8]
009e8 85c0                           test       eax, eax
009ea 7407                           je         0x7f6027e5b6f3
009ec 448d52ff                       lea        r10d, [rdx - 1]
009f0 418bd2                         mov        edx, r10d
009f3 85d2                           test       edx, edx
009f5 747d                           je         0x7f6027e5b774
009f7 83fa03                         cmp        edx, 3
009fa 0f844c160000                   je         0x7f6027e5cd4c
00a00 83fa02                         cmp        edx, 2
00a03 0f87ef160000                   ja         0x7f6027e5cdf8
00a09 3b54240c                       cmp        edx, dword ptr [rsp + 0xc]
00a0d 0f83cd140000                   jae        0x7f6027e5cbe0
00a13 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00a1b 458b449308                     mov        r8d, dword ptr [r11 + rdx*4 + 8]
00a20 85d2                           test       edx, edx
00a22 7e42                           jle        0x7f6027e5b766
00a24 448d52ff                       lea        r10d, [rdx - 1]
00a28 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00a2d 0f8369150000                   jae        0x7f6027e5cc9c
00a33 0f1f8000000000                 nop        dword ptr [rax]
00a3a 660f1f440000                   nop        word ptr [rax + rax]
00a40 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00a48 458b549304                     mov        r10d, dword ptr [r11 + rdx*4 + 4]
00a4d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00a55 4589549108                     mov        dword ptr [r9 + rdx*4 + 8], r10d
00a5a 448d52ff                       lea        r10d, [rdx - 1]
00a5e 418bd2                         mov        edx, r10d
00a61 4585d2                         test       r10d, r10d
00a64 7fda                           jg         0x7f6027e5b740
00a66 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a6e 45894208                       mov        dword ptr [r10 + 8], r8d
00a72 eb0c                           jmp        0x7f6027e5b780
00a74 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a7c 458b4208                       mov        r8d, dword ptr [r10 + 8]
00a80 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00a88 e959fdffff                     jmp        0x7f6027e5b4e6
00a8d 4183fb10                       cmp        r11d, 0x10
00a91 0f8d011b0000                   jge        0x7f6027e5d298
00a97 4183fb08                       cmp        r11d, 8
00a9b 0f8d33070000                   jge        0x7f6027e5bed4
00aa1 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00aa9 4183fb10                       cmp        r11d, 0x10
00aad 0f8eba000000                   jle        0x7f6027e5b86d
00ab3 85c9                           test       ecx, ecx
00ab5 0f8c1d1a0000                   jl         0x7f6027e5d1d8
00abb 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00ac3 4585d2                         test       r10d, r10d
00ac6 0f8c0c1a0000                   jl         0x7f6027e5d1d8
00acc 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00ad1 443b9c24c4000000               cmp        r11d, dword ptr [rsp + 0xc4]
00ad9 0f82f9190000                   jb         0x7f6027e5d1d8
00adf 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00ae7 44039424c4000000               add        r10d, dword ptr [rsp + 0xc4]
00aef 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00af7 453bda                         cmp        r11d, r10d
00afa 0f82d8190000                   jb         0x7f6027e5d1d8
00b00 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b08 4585d2                         test       r10d, r10d
00b0b 0f8cc7190000                   jl         0x7f6027e5d1d8
00b11 4585d2                         test       r10d, r10d
00b14 0f843ef8ffff                   je         0x7f6027e5b058
00b1a 4883fd20                       cmp        rbp, 0x20
00b1e 772d                           ja         0x7f6027e5b84d
00b20 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b28 4d63d3                         movsxd     r10, r11d
00b2b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b32 c442a8f5db                     bzhi       r11, r11, r10
00b37 c4c1fb92fb                     kmovq      k7, r11
00b3c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b42 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b48 e90bf8ffff                     jmp        0x7f6027e5b058
00b4d 488bd5                         mov        rdx, rbp
00b50 c5f877                         vzeroupper 
00b53 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00b5d 41ffd2                         call       r10
00b60 0f1f840000000000               nop        dword ptr [rax + rax]
00b68 e9ebf7ffff                     jmp        0x7f6027e5b058
00b6d 3b4c2418                       cmp        ecx, dword ptr [rsp + 0x18]
00b71 0f832d160000                   jae        0x7f6027e5cea4
00b77 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00b7f 410fbe6c0a08                   movsx      ebp, byte ptr [r10 + rcx + 8]
00b85 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00b8d 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b92 0f83d0160000                   jae        0x7f6027e5cf68
00b98 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00ba0 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
00ba8 43886c0208                     mov        byte ptr [r10 + r8 + 8], bpl
00bad 448d5103                       lea        r10d, [rcx + 3]
00bb1 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00bb9 41ffc3                         inc        r11d
00bbc 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00bc4 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00bc9 0f8339170000                   jae        0x7f6027e5d008
00bcf 4c63c1                         movsxd     r8, ecx
00bd2 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00bda 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00be0 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00be8 4183c303                       add        r11d, 3
00bec 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00bf1 0f83b5170000                   jae        0x7f6027e5d0ac
00bf7 4c638c24c4000000               movsxd     r9, dword ptr [rsp + 0xc4]
00bff 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
00c04 470fbe54020a                   movsx      r10d, byte ptr [r10 + r8 + 0xa]
00c0a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00c12 4788540b0a                     mov        byte ptr [r11 + r9 + 0xa], r10b
00c17 470fbe5c030b                   movsx      r11d, byte ptr [r11 + r8 + 0xb]
00c1d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00c25 47885c0a0b                     mov        byte ptr [r10 + r9 + 0xb], r11b
00c2a 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00c32 4183fb08                       cmp        r11d, 8
00c36 0f83fc170000                   jae        0x7f6027e5d138
00c3c 448bc9                         mov        r9d, ecx
00c3f 49ba083827e300000000           movabs     r10, 0xe3273808
00c49 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00c4e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c53 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c5b 4183fa04                       cmp        r10d, 4
00c5f 7e43                           jle        0x7f6027e5b9a4
00c61 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00c68 83c504                         add        ebp, 4
00c6b 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c73 418bd1                         mov        edx, r9d
00c76 6690                           nop        
00c78 c5f877                         vzeroupper 
00c7b e8e0fea9ff                     call       0x7f60278fb860
00c80 0f1f8400780d0004               nop        dword ptr [rax + rax + 0x4000d78]
00c88 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c90 8bd5                           mov        edx, ebp
00c92 8bc8                           mov        ecx, eax
00c94 c5f877                         vzeroupper 
00c97 e8c4fea9ff                     call       0x7f60278fb860
00c9c 0f1f8400940d0005               nop        dword ptr [rax + rax + 0x5000d94]
00ca4 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00cac 4183fb08                       cmp        r11d, 8
00cb0 7e62                           jle        0x7f6027e5ba14
00cb2 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00cb6 49ba303827e300000000           movabs     r10, 0xe3273830
00cc0 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00cc8 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00ccd 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00cd4 83c508                         add        ebp, 8
00cd7 83c208                         add        edx, 8
00cda 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00ce2 6690                           nop        
00ce4 c5f877                         vzeroupper 
00ce7 e874fea9ff                     call       0x7f60278fb860
00cec 0f1f8400e40d0006               nop        dword ptr [rax + rax + 0x6000de4]
00cf4 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cfc 8bd5                           mov        edx, ebp
00cfe 488bc8                         mov        rcx, rax
00d01 666690                         nop        
00d04 c5f877                         vzeroupper 
00d07 e854fea9ff                     call       0x7f60278fb860
00d0c 0f1f8400040e0007               nop        dword ptr [rax + rax + 0x7000e04]
00d14 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00d1b e9c9f9ffff                     jmp        0x7f6027e5b3e9
00d20 4d63d0                         movsxd     r10, r8d
00d23 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d2a c442a8f5db                     bzhi       r11, r11, r10
00d2f c4c1fb92fb                     kmovq      k7, r11
00d34 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d3a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d40 eb67                           jmp        0x7f6027e5baa9
00d42 4585f6                         test       r14d, r14d
00d45 0f8c41190000                   jl         0x7f6027e5d38c
00d4b 85db                           test       ebx, ebx
00d4d 0f8c39190000                   jl         0x7f6027e5d38c
00d53 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00d58 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00d5d 0f8229190000                   jb         0x7f6027e5d38c
00d63 428d2c03                       lea        ebp, [rbx + r8]
00d67 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00d6c 443bdd                         cmp        r11d, ebp
00d6f 0f8217190000                   jb         0x7f6027e5d38c
00d75 4585c0                         test       r8d, r8d
00d78 0f8c0e190000                   jl         0x7f6027e5d38c
00d7e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d83 453bd6                         cmp        r10d, r14d
00d86 7421                           je         0x7f6027e5baa9
00d88 4963d0                         movsxd     rdx, r8d
00d8b 4883fa20                       cmp        rdx, 0x20
00d8f 768f                           jbe        0x7f6027e5ba20
00d91 c5f877                         vzeroupper 
00d94 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00d9e 41ffd2                         call       r10
00da1 0f1f840000000000               nop        dword ptr [rax + rax]
00da9 4c8b1424                       mov        r10, qword ptr [rsp]
00dad 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00db1 c5f877                         vzeroupper 
00db4 4881c4f0000000                 add        rsp, 0xf0
00dbb 5d                             pop        rbp
00dbc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00dc0 0f874a1f0000                   ja         0x7f6027e5da10
00dc6 c3                             ret        
00dc7 83f830                         cmp        eax, 0x30
00dca 0f8e83000000                   jle        0x7f6027e5bb53
00dd0 4585f6                         test       r14d, r14d
00dd3 0f8c131d0000                   jl         0x7f6027e5d7ec
00dd9 85db                           test       ebx, ebx
00ddb 0f8c0b1d0000                   jl         0x7f6027e5d7ec
00de1 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00de6 443b9c24c0000000               cmp        r11d, dword ptr [rsp + 0xc0]
00dee 0f82f81c0000                   jb         0x7f6027e5d7ec
00df4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00df9 453bd5                         cmp        r10d, r13d
00dfc 0f82ea1c0000                   jb         0x7f6027e5d7ec
00e02 85c0                           test       eax, eax
00e04 7426                           je         0x7f6027e5bb2c
00e06 4883fa20                       cmp        rdx, 0x20
00e0a 772d                           ja         0x7f6027e5bb39
00e0c 4c63d0                         movsxd     r10, eax
00e0f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e16 c442a8f5db                     bzhi       r11, r11, r10
00e1b c4c1fb92fb                     kmovq      k7, r11
00e20 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e26 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e2c 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
00e34 e96bfaffff                     jmp        0x7f6027e5b5a4
00e39 c5f877                         vzeroupper 
00e3c 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00e46 41ffd2                         call       r10
00e49 0f1f840000000000               nop        dword ptr [rax + rax]
00e51 ebd9                           jmp        0x7f6027e5bb2c
00e53 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00e5b 0f83071b0000                   jae        0x7f6027e5d668
00e61 4d63d6                         movsxd     r10, r14d
00e64 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00e6c c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00e73 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
00e7a 0f83a81b0000                   jae        0x7f6027e5d728
00e80 448d5b10                       lea        r11d, [rbx + 0x10]
00e84 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e8c 4c63c3                         movsxd     r8, ebx
00e8f 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00e97 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00e9e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00ea6 453bdd                         cmp        r11d, r13d
00ea9 0f8d0e030000                   jge        0x7f6027e5bebd
00eaf 4d2bd0                         sub        r10, r8
00eb2 4d63c3                         movsxd     r8, r11d
00eb5 48637c241c                     movsxd     rdi, dword ptr [rsp + 0x1c]
00eba 4883c7f1                       add        rdi, -0xf
00ebe 4f8d0c10                       lea        r9, [r8 + r10]
00ec2 4c3bcf                         cmp        r9, rdi
00ec5 0f83ed1c0000                   jae        0x7f6027e5d8b8
00ecb 4963cd                         movsxd     rcx, r13d
00ece 4c8bc9                         mov        r9, rcx
00ed1 4d2bc8                         sub        r9, r8
00ed4 4983c10f                       add        r9, 0xf
00ed8 4983e1f0                       and        r9, 0xfffffffffffffff0
00edc 458bc1                         mov        r8d, r9d
00edf 458d4c1810                     lea        r9d, [r8 + rbx + 0x10]
00ee4 4d63c1                         movsxd     r8, r9d
00ee7 4f8d5410f0                     lea        r10, [r8 + r10 - 0x10]
00eec 4c3bd7                         cmp        r10, rdi
00eef 0f83c31c0000                   jae        0x7f6027e5d8b8
00ef5 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
00efd 0f83b51c0000                   jae        0x7f6027e5d8b8
00f03 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00f08 4983c2f1                       add        r10, -0xf
00f0c 4983c0f0                       add        r8, -0x10
00f10 4d3bc2                         cmp        r8, r10
00f13 0f839f1c0000                   jae        0x7f6027e5d8b8
00f19 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00f20 0f8f221d0000                   jg         0x7f6027e5d948
00f26 458bce                         mov        r9d, r14d
00f29 442bcb                         sub        r9d, ebx
00f2c 83c320                         add        ebx, 0x20
00f2f 90                             nop        
00f30 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f38 458bc1                         mov        r8d, r9d
00f3b 44038424c0000000               add        r8d, dword ptr [rsp + 0xc0]
00f43 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00f4b c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00f52 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00f5a c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00f61 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f69 4183c210                       add        r10d, 0x10
00f6d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00f75 458bda                         mov        r11d, r10d
00f78 443bd3                         cmp        r10d, ebx
00f7b 7cb3                           jl         0x7f6027e5bc30
00f7d 4881c110ffffff                 add        rcx, -0xf0
00f84 4881f900000080                 cmp        rcx, -0x80000000
00f8b 49c7c200000080                 mov        r10, 0xffffffff80000000
00f92 490f4cca                       cmovl      rcx, r10
00f96 448bc1                         mov        r8d, ecx
00f99 453bd8                         cmp        r11d, r8d
00f9c 0f8dda010000                   jge        0x7f6027e5be7c
00fa2 458bd3                         mov        r10d, r11d
00fa5 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00fad 666690                         nop        
00fb0 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00fb8 4d63d2                         movsxd     r10, r10d
00fbb 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00fc2 458bd9                         mov        r11d, r9d
00fc5 44039c24c0000000               add        r11d, dword ptr [rsp + 0xc0]
00fcd 418bfb                         mov        edi, r11d
00fd0 488b9c2498000000               mov        rbx, qword ptr [rsp + 0x98]
00fd8 c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
00fdf 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00fe7 c4c17a7f440b08                 vmovdqu    xmmword ptr [r11 + rcx + 8], xmm0
00fee 4863cf                         movsxd     rcx, edi
00ff1 c5fa6f440b18                   vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x18]
00ff7 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00fff c4817a7f441318                 vmovdqu    xmmword ptr [r11 + r10 + 0x18], xmm0
01006 c5fa6f440b28                   vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x28]
0100c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01014 c4817a7f441328                 vmovdqu    xmmword ptr [r11 + r10 + 0x28], xmm0
0101b c5fa6f440b38                   vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x38]
01021 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01029 c4817a7f441338                 vmovdqu    xmmword ptr [r11 + r10 + 0x38], xmm0
01030 c5fa6f440b48                   vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x48]
01036 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0103e c4817a7f441348                 vmovdqu    xmmword ptr [r11 + r10 + 0x48], xmm0
01045 c5fa6f440b58                   vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x58]
0104b 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01053 c4817a7f441358                 vmovdqu    xmmword ptr [r11 + r10 + 0x58], xmm0
0105a c5fa6f440b68                   vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x68]
01060 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01068 c4817a7f441368                 vmovdqu    xmmword ptr [r11 + r10 + 0x68], xmm0
0106f c5fa6f440b78                   vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x78]
01075 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0107d c4817a7f441378                 vmovdqu    xmmword ptr [r11 + r10 + 0x78], xmm0
01084 c5fa6f840b88000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x88]
0108d 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01095 c4817a7f841388000000           vmovdqu    xmmword ptr [r11 + r10 + 0x88], xmm0
0109f c5fa6f840b98000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0x98]
010a8 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010b0 c4817a7f841398000000           vmovdqu    xmmword ptr [r11 + r10 + 0x98], xmm0
010ba c5fa6f840ba8000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0xa8]
010c3 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010cb c4817a7f8413a8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xa8], xmm0
010d5 c5fa6f840bb8000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0xb8]
010de 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
010e6 c4817a7f8413b8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xb8], xmm0
010f0 c5fa6f840bc8000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0xc8]
010f9 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01101 c4817a7f8413c8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xc8], xmm0
0110b c5fa6f840bd8000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0xd8]
01114 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0111c c4817a7f8413d8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xd8], xmm0
01126 c5fa6f840be8000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0xe8]
0112f 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01137 c4817a7f8413e8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xe8], xmm0
01141 c5fa6f840bf8000000             vmovdqu    xmm0, xmmword ptr [rbx + rcx + 0xf8]
0114a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01152 c4817a7f8413f8000000           vmovdqu    xmmword ptr [r11 + r10 + 0xf8], xmm0
0115c 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01164 4181c300010000                 add        r11d, 0x100
0116b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01173 453bd8                         cmp        r11d, r8d
01176 0f8c34feffff                   jl         0x7f6027e5bcb0
0117c 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
01184 453bd5                         cmp        r10d, r13d
01187 7d34                           jge        0x7f6027e5bebd
01189 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01190 458d1409                       lea        r10d, [r9 + rcx]
01194 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0119c c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
011a3 448bd9                         mov        r11d, ecx
011a6 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
011ae c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
011b5 83c110                         add        ecx, 0x10
011b8 413bcd                         cmp        ecx, r13d
011bb 7cd3                           jl         0x7f6027e5be90
011bd 4103c6                         add        eax, r14d
011c0 898424c0000000                 mov        dword ptr [rsp + 0xc0], eax
011c7 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
011cf e9d0f6ffff                     jmp        0x7f6027e5b5a4
011d4 3b8c24b0000000                 cmp        ecx, dword ptr [rsp + 0xb0]
011db 0f83d3140000                   jae        0x7f6027e5d3b4
011e1 4863f9                         movsxd     rdi, ecx
011e4 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
011ec 4d8b543a08                     mov        r10, qword ptr [r10 + rdi + 8]
011f1 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
011f9 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
01201 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
01209 0f8355150000                   jae        0x7f6027e5d464
0120f 418d6a08                       lea        ebp, [r10 + 8]
01213 4d63da                         movsxd     r11, r10d
01216 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
0121e 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
01226 4b895c1808                     mov        qword ptr [r8 + r11 + 8], rbx
0122b 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01232 0f8dfd020000                   jge        0x7f6027e5c235
01238 492bfb                         sub        rdi, r11
0123b 4863dd                         movsxd     rbx, ebp
0123e 4c8d1c3b                       lea        r11, [rbx + rdi]
01242 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
01247 0f83b7150000                   jae        0x7f6027e5d504
0124d 4d8bd9                         mov        r11, r9
01250 4c2bdb                         sub        r11, rbx
01253 4983c307                       add        r11, 7
01257 4983e3f8                       and        r11, 0xfffffffffffffff8
0125b 458bdb                         mov        r11d, r11d
0125e 478d441308                     lea        r8d, [r11 + r10 + 8]
01263 4d63d8                         movsxd     r11, r8d
01266 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
0126b 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
01270 0f838e150000                   jae        0x7f6027e5d504
01276 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
0127d 0f8381150000                   jae        0x7f6027e5d504
01283 4983c3f8                       add        r11, -8
01287 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0128c 0f8372150000                   jae        0x7f6027e5d504
01292 baf8ffffff                     mov        edx, 0xfffffff8
01297 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0129f 498bfb                         mov        rdi, r11
012a2 458bdb                         mov        r11d, r11d
012a5 412bd3                         sub        edx, r11d
012a8 412bd2                         sub        edx, r10d
012ab 83c2f0                         add        edx, -0x10
012ae 458d5a10                       lea        r11d, [r10 + 0x10]
012b2 4d63db                         movsxd     r11, r11d
012b5 41b806000000                   mov        r8d, 6
012bb c462b8f5c2                     bzhi       r8, rdx, r8
012c0 4d03d8                         add        r11, r8
012c3 4d3bd9                         cmp        r11, r9
012c6 498bd1                         mov        rdx, r9
012c9 490f4cd3                       cmovl      rdx, r11
012cd 4c8bda                         mov        r11, rdx
012d0 4c2bdb                         sub        r11, rbx
012d3 4d8d43ff                       lea        r8, [r11 - 1]
012d7 49c1f83f                       sar        r8, 0x3f
012db 49c1e83d                       shr        r8, 0x3d
012df 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
012e4 4983e3f8                       and        r11, 0xfffffffffffffff8
012e8 4c03db                         add        r11, rbx
012eb 493bdb                         cmp        rbx, r11
012ee 490f4cdb                       cmovl      rbx, r11
012f2 448bdb                         mov        r11d, ebx
012f5 418d5b08                       lea        ebx, [r11 + 8]
012f9 442b9c24bc000000               sub        r11d, dword ptr [rsp + 0xbc]
01301 4c63c3                         movsxd     r8, ebx
01304 4c03c7                         add        r8, rdi
01307 4183c308                       add        r11d, 8
0130b 4963db                         movsxd     rbx, r11d
0130e 4803df                         add        rbx, rdi
01311 498d7848                       lea        rdi, [r8 + 0x48]
01315 4983c008                       add        r8, 8
01319 488d7308                       lea        rsi, [rbx + 8]
0131d 4533db                         xor        r11d, r11d
01320 483bfe                         cmp        rdi, rsi
01323 410f96c3                       setbe      r11b
01327 4883c348                       add        rbx, 0x48
0132b 33f6                           xor        esi, esi
0132d 493bd8                         cmp        rbx, r8
01330 400f96c6                       setbe      sil
01334 440bde                         or         r11d, esi
01337 0f8443150000                   je         0x7f6027e5d580
0133d 448b8424c8000000               mov        r8d, dword ptr [rsp + 0xc8]
01345 4181f8f8ffff7f                 cmp        r8d, 0x7ffffff8
0134c 0f8faa150000                   jg         0x7f6027e5d5fc
01352 412bca                         sub        ecx, r10d
01355 448bd2                         mov        r10d, edx
01358 448d1c29                       lea        r11d, [rcx + rbp]
0135c 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
01364 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
01369 448bc5                         mov        r8d, ebp
0136c 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
01374 4e895c0308                     mov        qword ptr [rbx + r8 + 8], r11
01379 83c508                         add        ebp, 8
0137c 413bea                         cmp        ebp, r10d
0137f 7cd7                           jl         0x7f6027e5c058
01381 4d8d9108feffff                 lea        r10, [r9 - 0x1f8]
01388 4981fa00000080                 cmp        r10, -0x80000000
0138f 49c7c300000080                 mov        r11, 0xffffffff80000000
01396 4d0f4cd3                       cmovl      r10, r11
0139a 418bfa                         mov        edi, r10d
0139d 3bef                           cmp        ebp, edi
0139f 0f8d58010000                   jge        0x7f6027e5c1fd
013a5 6666660f1f840000000000         nop        word ptr [rax + rax]
013b0 448d9500010000                 lea        r10d, [rbp + 0x100]
013b7 4403d1                         add        r10d, ecx
013ba 448d8580000000                 lea        r8d, [rbp + 0x80]
013c1 4403c1                         add        r8d, ecx
013c4 418bda                         mov        ebx, r10d
013c7 4963c2                         movsxd     rax, r10d
013ca 418bf0                         mov        esi, r8d
013cd 4d63e8                         movsxd     r13, r8d
013d0 448bc5                         mov        r8d, ebp
013d3 8d1429                         lea        edx, [rcx + rbp]
013d6 448bdd                         mov        r11d, ebp
013d9 4d63f3                         movsxd     r14, r11d
013dc 448bd2                         mov        r10d, edx
013df 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
013e7 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
013f2 62917e487f840308000000         vmovdqu32  zmmword ptr [r11 + r8 + 8], zmm0
013fd 4c63da                         movsxd     r11, edx
01400 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01408 62917e486f841a48000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x48]
01413 62917e487f843248000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x48], zmm0
0141e 62d17e486f843208000000         vmovdqu32  zmm0, zmmword ptr [r10 + rsi + 8]
01429 62917e487f843288000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x88], zmm0
01434 62917e486f842a48000000         vmovdqu32  zmm0, zmmword ptr [r10 + r13 + 0x48]
0143f 62917e487f8432c8000000         vmovdqu32  zmmword ptr [r10 + r14 + 0xc8], zmm0
0144a 62d17e486f841a08000000         vmovdqu32  zmm0, zmmword ptr [r10 + rbx + 8]
01455 62917e487f843208010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x108], zmm0
01460 62d17e486f840248000000         vmovdqu32  zmm0, zmmword ptr [r10 + rax + 0x48]
0146b 62917e487f843248010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x148], zmm0
01476 62917e486f841a88010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x188]
01481 62917e487f843288010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x188], zmm0
0148c 62917e486f841ac8010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x1c8]
01497 62917e487f8432c8010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x1c8], zmm0
014a2 81c500020000                   add        ebp, 0x200
014a8 3bef                           cmp        ebp, edi
014aa 0f8c00ffffff                   jl         0x7f6027e5c0b0
014b0 4983c1c8                       add        r9, -0x38
014b4 4981f900000080                 cmp        r9, -0x80000000
014bb 49c7c200000080                 mov        r10, 0xffffffff80000000
014c2 4d0f4cca                       cmovl      r9, r10
014c6 458bd9                         mov        r11d, r9d
014c9 413beb                         cmp        ebp, r11d
014cc 7d2f                           jge        0x7f6027e5c1fd
014ce 6690                           nop        
014d0 448d0429                       lea        r8d, [rcx + rbp]
014d4 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
014dc 62917e486f840208000000         vmovdqu32  zmm0, zmmword ptr [r10 + r8 + 8]
014e7 448bc5                         mov        r8d, ebp
014ea 62917e487f840208000000         vmovdqu32  zmmword ptr [r10 + r8 + 8], zmm0
014f5 83c540                         add        ebp, 0x40
014f8 413beb                         cmp        ebp, r11d
014fb 7cd3                           jl         0x7f6027e5c1d0
014fd 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01504 7d2f                           jge        0x7f6027e5c235
01506 6690                           nop        
01508 448d1c29                       lea        r11d, [rcx + rbp]
0150c 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01514 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01519 448bc5                         mov        r8d, ebp
0151c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01524 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01529 83c508                         add        ebp, 8
0152c 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01533 7cd3                           jl         0x7f6027e5c208
01535 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
0153c e9a8f1ffff                     jmp        0x7f6027e5b3e9
01541 bee4ffffff                     mov        esi, 0xffffffe4
01546 488b2c24                       mov        rbp, qword ptr [rsp]
0154a 48894424f8                     mov        qword ptr [rsp - 8], rax
0154f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01553 89442408                       mov        dword ptr [rsp + 8], eax
01557 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0155c 48ff742420                     push       qword ptr [rsp + 0x20]
01561 488f442418                     pop        qword ptr [rsp + 0x18]
01566 48894424f8                     mov        qword ptr [rsp - 8], rax
0156b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0156f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01573 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01578 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0157c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01581 48894424f8                     mov        qword ptr [rsp - 8], rax
01586 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0158a 89442438                       mov        dword ptr [rsp + 0x38], eax
0158e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01593 48894424f8                     mov        qword ptr [rsp - 8], rax
01598 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0159c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a5 666690                         nop        
015a8 c5f877                         vzeroupper 
015ab e8b073b6ff                     call       0x7f60279c3660
015b0 0f1f8400a8160008               nop        dword ptr [rax + rax + 0x80016a8]
015b8 bee4ffffff                     mov        esi, 0xffffffe4
015bd 488b2c24                       mov        rbp, qword ptr [rsp]
015c1 48894424f8                     mov        qword ptr [rsp - 8], rax
015c6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015ca 89442408                       mov        dword ptr [rsp + 8], eax
015ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d3 48ff742420                     push       qword ptr [rsp + 0x20]
015d8 488f442418                     pop        qword ptr [rsp + 0x18]
015dd 48894424f8                     mov        qword ptr [rsp - 8], rax
015e2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015e6 8944240c                       mov        dword ptr [rsp + 0xc], eax
015ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ef 895c2430                       mov        dword ptr [rsp + 0x30], ebx
015f3 48894424f8                     mov        qword ptr [rsp - 8], rax
015f8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
015fc 89442438                       mov        dword ptr [rsp + 0x38], eax
01600 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01605 48ff742478                     push       qword ptr [rsp + 0x78]
0160a 488f442440                     pop        qword ptr [rsp + 0x40]
0160f 48894424f8                     mov        qword ptr [rsp - 8], rax
01614 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01618 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0161c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01621 48894424f8                     mov        qword ptr [rsp - 8], rax
01626 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0162a 89442458                       mov        dword ptr [rsp + 0x58], eax
0162e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01633 48894424f8                     mov        qword ptr [rsp - 8], rax
01638 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0163c 89442460                       mov        dword ptr [rsp + 0x60], eax
01640 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01645 89442464                       mov        dword ptr [rsp + 0x64], eax
01649 4489742478                     mov        dword ptr [rsp + 0x78], r14d
0164e 6690                           nop        
01650 c5f877                         vzeroupper 
01653 e80873b6ff                     call       0x7f60279c3660
01658 0f1f840050170009               nop        dword ptr [rax + rax + 0x9001750]
01660 bee4ffffff                     mov        esi, 0xffffffe4
01665 488b2c24                       mov        rbp, qword ptr [rsp]
01669 48894424f8                     mov        qword ptr [rsp - 8], rax
0166e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01672 89442408                       mov        dword ptr [rsp + 8], eax
01676 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167b 48ff742420                     push       qword ptr [rsp + 0x20]
01680 488f442418                     pop        qword ptr [rsp + 0x18]
01685 48894424f8                     mov        qword ptr [rsp - 8], rax
0168a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0168e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01692 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01697 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0169c 48894424f8                     mov        qword ptr [rsp - 8], rax
016a1 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016a5 89442438                       mov        dword ptr [rsp + 0x38], eax
016a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ae 48ff742478                     push       qword ptr [rsp + 0x78]
016b3 488f442440                     pop        qword ptr [rsp + 0x40]
016b8 48894424f8                     mov        qword ptr [rsp - 8], rax
016bd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
016c1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ca 48ffb42480000000               push       qword ptr [rsp + 0x80]
016d2 488f442450                     pop        qword ptr [rsp + 0x50]
016d7 48894424f8                     mov        qword ptr [rsp - 8], rax
016dc 8b442474                       mov        eax, dword ptr [rsp + 0x74]
016e0 89442458                       mov        dword ptr [rsp + 0x58], eax
016e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016e9 48894424f8                     mov        qword ptr [rsp - 8], rax
016ee 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
016f5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
016f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01703 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01707 89442460                       mov        dword ptr [rsp + 0x60], eax
0170b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01710 89442464                       mov        dword ptr [rsp + 0x64], eax
01714 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01718 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01721 666690                         nop        
01724 c5f877                         vzeroupper 
01727 e83472b6ff                     call       0x7f60279c3660
0172c 0f1f84002418000a               nop        dword ptr [rax + rax + 0xa001824]
01734 bee4ffffff                     mov        esi, 0xffffffe4
01739 488b2c24                       mov        rbp, qword ptr [rsp]
0173d 48894424f8                     mov        qword ptr [rsp - 8], rax
01742 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01746 89442408                       mov        dword ptr [rsp + 8], eax
0174a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174f 48ff742420                     push       qword ptr [rsp + 0x20]
01754 488f442418                     pop        qword ptr [rsp + 0x18]
01759 48894424f8                     mov        qword ptr [rsp - 8], rax
0175e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01762 8944240c                       mov        dword ptr [rsp + 0xc], eax
01766 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176b 48894424f8                     mov        qword ptr [rsp - 8], rax
01770 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01774 89442438                       mov        dword ptr [rsp + 0x38], eax
01778 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0177d 48894424f8                     mov        qword ptr [rsp - 8], rax
01782 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01786 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0178a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178f 48894424f8                     mov        qword ptr [rsp - 8], rax
01794 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01798 89442458                       mov        dword ptr [rsp + 0x58], eax
0179c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a1 48894424f8                     mov        qword ptr [rsp - 8], rax
017a6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
017aa 89442460                       mov        dword ptr [rsp + 0x60], eax
017ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b3 894c2470                       mov        dword ptr [rsp + 0x70], ecx
017b7 90                             nop        
017b8 c5f877                         vzeroupper 
017bb e8a071b6ff                     call       0x7f60279c3660
017c0 0f1f8400b818000b               nop        dword ptr [rax + rax + 0xb0018b8]
017c8 be45ffffff                     mov        esi, 0xffffff45
017cd 488b2c24                       mov        rbp, qword ptr [rsp]
017d1 4c89542408                     mov        qword ptr [rsp + 8], r10
017d6 6690                           nop        
017d8 c5f877                         vzeroupper 
017db e88071b6ff                     call       0x7f60279c3660
017e0 0f1f8400d818000c               nop        dword ptr [rax + rax + 0xc0018d8]
017e8 be45ffffff                     mov        esi, 0xffffff45
017ed 488b2c24                       mov        rbp, qword ptr [rsp]
017f1 48894424f8                     mov        qword ptr [rsp - 8], rax
017f6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017fa 89442408                       mov        dword ptr [rsp + 8], eax
017fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01803 48ff742420                     push       qword ptr [rsp + 0x20]
01808 488f442418                     pop        qword ptr [rsp + 0x18]
0180d 48894424f8                     mov        qword ptr [rsp - 8], rax
01812 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01816 8944240c                       mov        dword ptr [rsp + 0xc], eax
0181a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01823 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01828 48894424f8                     mov        qword ptr [rsp - 8], rax
0182d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01831 89442438                       mov        dword ptr [rsp + 0x38], eax
01835 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183a 48894424f8                     mov        qword ptr [rsp - 8], rax
0183f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01843 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01847 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184c 89442464                       mov        dword ptr [rsp + 0x64], eax
01850 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01855 666690                         nop        
01858 c5f877                         vzeroupper 
0185b e80071b6ff                     call       0x7f60279c3660
01860 0f1f84005819000d               nop        dword ptr [rax + rax + 0xd001958]
01868 493bea                         cmp        rbp, r10
0186b bdffffffff                     mov        ebp, 0xffffffff
01870 7c08                           jl         0x7f6027e5c57a
01872 400f95c5                       setne      bpl
01876 400fb6ed                       movzx      ebp, bpl
0187a be45ffffff                     mov        esi, 0xffffff45
0187f 48894424f8                     mov        qword ptr [rsp - 8], rax
01884 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01888 89442414                       mov        dword ptr [rsp + 0x14], eax
0188c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01891 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01895 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
0189a 48894424f8                     mov        qword ptr [rsp - 8], rax
0189f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
018a3 89442440                       mov        dword ptr [rsp + 0x40], eax
018a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ac 48ff742478                     push       qword ptr [rsp + 0x78]
018b1 488f442448                     pop        qword ptr [rsp + 0x48]
018b6 48894424f8                     mov        qword ptr [rsp - 8], rax
018bb 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
018bf 89442444                       mov        dword ptr [rsp + 0x44], eax
018c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c8 48894424f8                     mov        qword ptr [rsp - 8], rax
018cd 8b442474                       mov        eax, dword ptr [rsp + 0x74]
018d1 89442460                       mov        dword ptr [rsp + 0x60], eax
018d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018da 48894424f8                     mov        qword ptr [rsp - 8], rax
018df 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018e3 89442468                       mov        dword ptr [rsp + 0x68], eax
018e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ec 8944246c                       mov        dword ptr [rsp + 0x6c], eax
018f0 4c89542478                     mov        qword ptr [rsp + 0x78], r10
018f5 666690                         nop        
018f8 c5f877                         vzeroupper 
018fb e86070b6ff                     call       0x7f60279c3660
01900 0f1f8400f819000e               nop        dword ptr [rax + rax + 0xe0019f8]
01908 be45ffffff                     mov        esi, 0xffffff45
0190d 488b2c24                       mov        rbp, qword ptr [rsp]
01911 48894424f8                     mov        qword ptr [rsp - 8], rax
01916 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0191a 89442408                       mov        dword ptr [rsp + 8], eax
0191e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01923 48ff742420                     push       qword ptr [rsp + 0x20]
01928 488f442418                     pop        qword ptr [rsp + 0x18]
0192d 48894424f8                     mov        qword ptr [rsp - 8], rax
01932 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01936 8944240c                       mov        dword ptr [rsp + 0xc], eax
0193a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01943 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01948 48894424f8                     mov        qword ptr [rsp - 8], rax
0194d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01951 89442438                       mov        dword ptr [rsp + 0x38], eax
01955 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195a 48894424f8                     mov        qword ptr [rsp - 8], rax
0195f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01963 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196c 48894424f8                     mov        qword ptr [rsp - 8], rax
01971 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01975 89442460                       mov        dword ptr [rsp + 0x60], eax
01979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197e 89442464                       mov        dword ptr [rsp + 0x64], eax
01982 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01987 90                             nop        
01988 c5f877                         vzeroupper 
0198b e8d06fb6ff                     call       0x7f60279c3660
01990 0f1f8400881a000f               nop        dword ptr [rax + rax + 0xf001a88]
01998 be45ffffff                     mov        esi, 0xffffff45
0199d 488b2c24                       mov        rbp, qword ptr [rsp]
019a1 48894424f8                     mov        qword ptr [rsp - 8], rax
019a6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019aa 89442408                       mov        dword ptr [rsp + 8], eax
019ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b3 48ff742420                     push       qword ptr [rsp + 0x20]
019b8 488f442418                     pop        qword ptr [rsp + 0x18]
019bd 48894424f8                     mov        qword ptr [rsp - 8], rax
019c2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019c6 8944240c                       mov        dword ptr [rsp + 0xc], eax
019ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019d3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
019d8 48894424f8                     mov        qword ptr [rsp - 8], rax
019dd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
019e1 89442438                       mov        dword ptr [rsp + 0x38], eax
019e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ea 48894424f8                     mov        qword ptr [rsp - 8], rax
019ef 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
019f3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01a01 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a05 89442458                       mov        dword ptr [rsp + 0x58], eax
01a09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a13 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a17 89442460                       mov        dword ptr [rsp + 0x60], eax
01a1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a20 89442464                       mov        dword ptr [rsp + 0x64], eax
01a24 c5f877                         vzeroupper 
01a27 e8346fb6ff                     call       0x7f60279c3660
01a2c 0f1f8400241b0010               nop        dword ptr [rax + rax + 0x10001b24]
01a34 bee4ffffff                     mov        esi, 0xffffffe4
01a39 488b2c24                       mov        rbp, qword ptr [rsp]
01a3d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a42 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a46 89442408                       mov        dword ptr [rsp + 8], eax
01a4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4f 48ff742420                     push       qword ptr [rsp + 0x20]
01a54 488f442418                     pop        qword ptr [rsp + 0x18]
01a59 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a62 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a70 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a74 89442438                       mov        dword ptr [rsp + 0x38], eax
01a78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7d 48ff742478                     push       qword ptr [rsp + 0x78]
01a82 488f442440                     pop        qword ptr [rsp + 0x40]
01a87 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a90 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a99 48ffb42480000000               push       qword ptr [rsp + 0x80]
01aa1 488f442450                     pop        qword ptr [rsp + 0x50]
01aa6 48894424f8                     mov        qword ptr [rsp - 8], rax
01aab 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01aaf 89442458                       mov        dword ptr [rsp + 0x58], eax
01ab3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab8 48894424f8                     mov        qword ptr [rsp - 8], rax
01abd 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01ac4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ac8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01acd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ad6 89442460                       mov        dword ptr [rsp + 0x60], eax
01ada 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01adf 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
01ae6 6690                           nop        
01ae8 c5f877                         vzeroupper 
01aeb e8706eb6ff                     call       0x7f60279c3660
01af0 0f1f8400e81b0011               nop        dword ptr [rax + rax + 0x11001be8]
01af8 bee4ffffff                     mov        esi, 0xffffffe4
01afd 488b2c24                       mov        rbp, qword ptr [rsp]
01b01 48894424f8                     mov        qword ptr [rsp - 8], rax
01b06 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b0a 89442408                       mov        dword ptr [rsp + 8], eax
01b0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b13 48ff742420                     push       qword ptr [rsp + 0x20]
01b18 488f442418                     pop        qword ptr [rsp + 0x18]
01b1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b22 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b26 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b34 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01b38 89442438                       mov        dword ptr [rsp + 0x38], eax
01b3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b41 48ff742478                     push       qword ptr [rsp + 0x78]
01b46 488f442440                     pop        qword ptr [rsp + 0x40]
01b4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b50 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01b54 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5d 48ffb42480000000               push       qword ptr [rsp + 0x80]
01b65 488f442450                     pop        qword ptr [rsp + 0x50]
01b6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01b73 89442458                       mov        dword ptr [rsp + 0x58], eax
01b77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b81 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01b88 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b91 48894424f8                     mov        qword ptr [rsp - 8], rax
01b96 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b9a 89442460                       mov        dword ptr [rsp + 0x60], eax
01b9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba3 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01ba7 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01bac c5f877                         vzeroupper 
01baf e8ac6db6ff                     call       0x7f60279c3660
01bb4 0f1f8400ac1c0012               nop        dword ptr [rax + rax + 0x12001cac]
01bbc 4533d2                         xor        r10d, r10d
01bbf 4c891424                       mov        qword ptr [rsp], r10
01bc3 e979e5ffff                     jmp        0x7f6027e5ae41
01bc8 4533d2                         xor        r10d, r10d
01bcb 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01bd3 e993e5ffff                     jmp        0x7f6027e5ae6b
01bd8 4533d2                         xor        r10d, r10d
01bdb 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01be3 e9b2e5ffff                     jmp        0x7f6027e5ae9a
01be8 4533d2                         xor        r10d, r10d
01beb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bf0 e9cce5ffff                     jmp        0x7f6027e5aec1
01bf5 4533d2                         xor        r10d, r10d
01bf8 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01c00 e9ebe5ffff                     jmp        0x7f6027e5aef0
01c05 4533d2                         xor        r10d, r10d
01c08 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01c10 e905e6ffff                     jmp        0x7f6027e5af1a
01c15 83c108                         add        ecx, 8
01c18 be6effffff                     mov        esi, 0xffffff6e
01c1d 488b2c24                       mov        rbp, qword ptr [rsp]
01c21 48894424f8                     mov        qword ptr [rsp - 8], rax
01c26 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c2a 89442408                       mov        dword ptr [rsp + 8], eax
01c2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c33 48ff742420                     push       qword ptr [rsp + 0x20]
01c38 488f442418                     pop        qword ptr [rsp + 0x18]
01c3d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c42 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c46 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c54 48894424f8                     mov        qword ptr [rsp - 8], rax
01c59 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c5d 89442438                       mov        dword ptr [rsp + 0x38], eax
01c61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c66 48ff742478                     push       qword ptr [rsp + 0x78]
01c6b 488f442440                     pop        qword ptr [rsp + 0x40]
01c70 48894424f8                     mov        qword ptr [rsp - 8], rax
01c75 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01c79 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c82 48894424f8                     mov        qword ptr [rsp - 8], rax
01c87 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01c8b 89442458                       mov        dword ptr [rsp + 0x58], eax
01c8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c94 48894424f8                     mov        qword ptr [rsp - 8], rax
01c99 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c9d 89442460                       mov        dword ptr [rsp + 0x60], eax
01ca1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cab 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
01cb2 89442468                       mov        dword ptr [rsp + 0x68], eax
01cb6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbb 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01cbf 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01cc4 c5f877                         vzeroupper 
01cc7 e8946cb6ff                     call       0x7f60279c3660
01ccc 0f1f8400c41d0013               nop        dword ptr [rax + rax + 0x13001dc4]
01cd4 83c108                         add        ecx, 8
01cd7 be66ffffff                     mov        esi, 0xffffff66
01cdc 488b2c24                       mov        rbp, qword ptr [rsp]
01ce0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce5 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01ce9 89442408                       mov        dword ptr [rsp + 8], eax
01ced 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf2 48ff742420                     push       qword ptr [rsp + 0x20]
01cf7 488f442418                     pop        qword ptr [rsp + 0x18]
01cfc 48894424f8                     mov        qword ptr [rsp - 8], rax
01d01 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d05 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0e 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d13 48894424f8                     mov        qword ptr [rsp - 8], rax
01d18 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d1c 89442438                       mov        dword ptr [rsp + 0x38], eax
01d20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d25 48ff742478                     push       qword ptr [rsp + 0x78]
01d2a 488f442440                     pop        qword ptr [rsp + 0x40]
01d2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d34 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d38 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d41 48894424f8                     mov        qword ptr [rsp - 8], rax
01d46 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d4a 89442458                       mov        dword ptr [rsp + 0x58], eax
01d4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d53 48894424f8                     mov        qword ptr [rsp - 8], rax
01d58 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d5c 89442460                       mov        dword ptr [rsp + 0x60], eax
01d60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d65 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01d69 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01d6e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01d72 6690                           nop        
01d74 c5f877                         vzeroupper 
01d77 e8e46bb6ff                     call       0x7f60279c3660
01d7c 0f1f8400741e0014               nop        dword ptr [rax + rax + 0x14001e74]
01d84 beccffffff                     mov        esi, 0xffffffcc
01d89 488b2c24                       mov        rbp, qword ptr [rsp]
01d8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d92 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d96 89442408                       mov        dword ptr [rsp + 8], eax
01d9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9f 48ff742420                     push       qword ptr [rsp + 0x20]
01da4 488f442418                     pop        qword ptr [rsp + 0x18]
01da9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dae 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01db2 8944240c                       mov        dword ptr [rsp + 0xc], eax
01db6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbb 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01dc4 89442438                       mov        dword ptr [rsp + 0x38], eax
01dc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dcd 48ff742478                     push       qword ptr [rsp + 0x78]
01dd2 488f442440                     pop        qword ptr [rsp + 0x40]
01dd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01ddc 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01de0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01de4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de9 48ffb42480000000               push       qword ptr [rsp + 0x80]
01df1 488f442450                     pop        qword ptr [rsp + 0x50]
01df6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01dff 89442458                       mov        dword ptr [rsp + 0x58], eax
01e03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e08 48894424f8                     mov        qword ptr [rsp - 8], rax
01e0d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e11 89442460                       mov        dword ptr [rsp + 0x60], eax
01e15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01e26 89442464                       mov        dword ptr [rsp + 0x64], eax
01e2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2f 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01e33 90                             nop        
01e34 c5f877                         vzeroupper 
01e37 e8246bb6ff                     call       0x7f60279c3660
01e3c 0f1f8400341f0015               nop        dword ptr [rax + rax + 0x15001f34]
01e44 beccffffff                     mov        esi, 0xffffffcc
01e49 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e52 89442414                       mov        dword ptr [rsp + 0x14], eax
01e56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e60 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01e64 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e6d 48ff742478                     push       qword ptr [rsp + 0x78]
01e72 488f442440                     pop        qword ptr [rsp + 0x40]
01e77 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01e80 89442448                       mov        dword ptr [rsp + 0x48], eax
01e84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e89 48ffb42480000000               push       qword ptr [rsp + 0x80]
01e91 488f442458                     pop        qword ptr [rsp + 0x58]
01e96 48894424f8                     mov        qword ptr [rsp - 8], rax
01e9b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e9f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ea3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ead 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01eb4 89442460                       mov        dword ptr [rsp + 0x60], eax
01eb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebd 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ec6 89442464                       mov        dword ptr [rsp + 0x64], eax
01eca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ecf 90                             nop        
01ed0 c5f877                         vzeroupper 
01ed3 e8886ab6ff                     call       0x7f60279c3660
01ed8 0f1f8400d01f0016               nop        dword ptr [rax + rax + 0x16001fd0]
01ee0 bee4ffffff                     mov        esi, 0xffffffe4
01ee5 488b2c24                       mov        rbp, qword ptr [rsp]
01ee9 48894424f8                     mov        qword ptr [rsp - 8], rax
01eee 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01ef2 89442408                       mov        dword ptr [rsp + 8], eax
01ef6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01efb 48ff742420                     push       qword ptr [rsp + 0x20]
01f00 488f442418                     pop        qword ptr [rsp + 0x18]
01f05 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f0e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f17 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f1b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01f20 48894424f8                     mov        qword ptr [rsp - 8], rax
01f25 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f29 89442438                       mov        dword ptr [rsp + 0x38], eax
01f2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f32 48ff742478                     push       qword ptr [rsp + 0x78]
01f37 488f442440                     pop        qword ptr [rsp + 0x40]
01f3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f41 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01f45 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4e 48ffb42480000000               push       qword ptr [rsp + 0x80]
01f56 488f442450                     pop        qword ptr [rsp + 0x50]
01f5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f60 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01f64 89442458                       mov        dword ptr [rsp + 0x58], eax
01f68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f72 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f76 89442460                       mov        dword ptr [rsp + 0x60], eax
01f7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7f 89442464                       mov        dword ptr [rsp + 0x64], eax
01f83 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01f8a 6690                           nop        
01f8c c5f877                         vzeroupper 
01f8f e8cc69b6ff                     call       0x7f60279c3660
01f94 0f1f84008c200017               nop        dword ptr [rax + rax + 0x1700208c]
01f9c be6effffff                     mov        esi, 0xffffff6e
01fa1 488b2c24                       mov        rbp, qword ptr [rsp]
01fa5 48894424f8                     mov        qword ptr [rsp - 8], rax
01faa 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fae 89442408                       mov        dword ptr [rsp + 8], eax
01fb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb7 48ff742420                     push       qword ptr [rsp + 0x20]
01fbc 488f442418                     pop        qword ptr [rsp + 0x18]
01fc1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fca 8944240c                       mov        dword ptr [rsp + 0xc], eax
01fce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01fd7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01fdc 48894424f8                     mov        qword ptr [rsp - 8], rax
01fe1 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01fe5 89442438                       mov        dword ptr [rsp + 0x38], eax
01fe9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fee 48ff742478                     push       qword ptr [rsp + 0x78]
01ff3 488f442440                     pop        qword ptr [rsp + 0x40]
01ff8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffd 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02001 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02005 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200a 48894424f8                     mov        qword ptr [rsp - 8], rax
0200f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02013 89442458                       mov        dword ptr [rsp + 0x58], eax
02017 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201c 48894424f8                     mov        qword ptr [rsp - 8], rax
02021 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02025 89442460                       mov        dword ptr [rsp + 0x60], eax
02029 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0202e 89442464                       mov        dword ptr [rsp + 0x64], eax
02032 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02037 8954247c                       mov        dword ptr [rsp + 0x7c], edx
0203b 90                             nop        
0203c c5f877                         vzeroupper 
0203f e81c69b6ff                     call       0x7f60279c3660
02044 0f1f84003c210018               nop        dword ptr [rax + rax + 0x1800213c]
0204c be45ffffff                     mov        esi, 0xffffff45
02051 488b2c24                       mov        rbp, qword ptr [rsp]
02055 48894424f8                     mov        qword ptr [rsp - 8], rax
0205a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0205e 89442408                       mov        dword ptr [rsp + 8], eax
02062 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02067 48ff742420                     push       qword ptr [rsp + 0x20]
0206c 488f442418                     pop        qword ptr [rsp + 0x18]
02071 48894424f8                     mov        qword ptr [rsp - 8], rax
02076 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0207a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0207e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02083 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02087 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0208c 48894424f8                     mov        qword ptr [rsp - 8], rax
02091 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02095 89442438                       mov        dword ptr [rsp + 0x38], eax
02099 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209e 48ff742478                     push       qword ptr [rsp + 0x78]
020a3 488f442440                     pop        qword ptr [rsp + 0x40]
020a8 48894424f8                     mov        qword ptr [rsp - 8], rax
020ad 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
020b1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ba 48894424f8                     mov        qword ptr [rsp - 8], rax
020bf 8b442474                       mov        eax, dword ptr [rsp + 0x74]
020c3 89442458                       mov        dword ptr [rsp + 0x58], eax
020c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020cc 48894424f8                     mov        qword ptr [rsp - 8], rax
020d1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
020d5 89442460                       mov        dword ptr [rsp + 0x60], eax
020d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020de 89442464                       mov        dword ptr [rsp + 0x64], eax
020e2 89542478                       mov        dword ptr [rsp + 0x78], edx
020e6 6690                           nop        
020e8 c5f877                         vzeroupper 
020eb e87068b6ff                     call       0x7f60279c3660
020f0 0f1f8400e8210019               nop        dword ptr [rax + rax + 0x190021e8]
020f8 be3dffffff                     mov        esi, 0xffffff3d
020fd 488b2c24                       mov        rbp, qword ptr [rsp]
02101 48894424f8                     mov        qword ptr [rsp - 8], rax
02106 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0210a 89442408                       mov        dword ptr [rsp + 8], eax
0210e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02113 48ff742420                     push       qword ptr [rsp + 0x20]
02118 488f442418                     pop        qword ptr [rsp + 0x18]
0211d 48894424f8                     mov        qword ptr [rsp - 8], rax
02122 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02126 8944240c                       mov        dword ptr [rsp + 0xc], eax
0212a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02133 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02138 48894424f8                     mov        qword ptr [rsp - 8], rax
0213d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02141 89442438                       mov        dword ptr [rsp + 0x38], eax
02145 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0214a 48ff742478                     push       qword ptr [rsp + 0x78]
0214f 488f442440                     pop        qword ptr [rsp + 0x40]
02154 48894424f8                     mov        qword ptr [rsp - 8], rax
02159 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0215d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02161 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02166 48894424f8                     mov        qword ptr [rsp - 8], rax
0216b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0216f 89442458                       mov        dword ptr [rsp + 0x58], eax
02173 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02178 48894424f8                     mov        qword ptr [rsp - 8], rax
0217d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02181 89442460                       mov        dword ptr [rsp + 0x60], eax
02185 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218a 89442464                       mov        dword ptr [rsp + 0x64], eax
0218e 89542478                       mov        dword ptr [rsp + 0x78], edx
02192 6690                           nop        
02194 c5f877                         vzeroupper 
02197 e8c467b6ff                     call       0x7f60279c3660
0219c 0f1f84009422001a               nop        dword ptr [rax + rax + 0x1a002294]
021a4 bee4ffffff                     mov        esi, 0xffffffe4
021a9 488b2c24                       mov        rbp, qword ptr [rsp]
021ad 48894424f8                     mov        qword ptr [rsp - 8], rax
021b2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
021b6 89442408                       mov        dword ptr [rsp + 8], eax
021ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021bf 48ff742420                     push       qword ptr [rsp + 0x20]
021c4 488f442418                     pop        qword ptr [rsp + 0x18]
021c9 48894424f8                     mov        qword ptr [rsp - 8], rax
021ce 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021d2 8944240c                       mov        dword ptr [rsp + 0xc], eax
021d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021db 48894424f8                     mov        qword ptr [rsp - 8], rax
021e0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
021e4 89442434                       mov        dword ptr [rsp + 0x34], eax
021e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ed 48ff742478                     push       qword ptr [rsp + 0x78]
021f2 488f442438                     pop        qword ptr [rsp + 0x38]
021f7 48894424f8                     mov        qword ptr [rsp - 8], rax
021fc 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02200 89442440                       mov        dword ptr [rsp + 0x40], eax
02204 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02209 48ffb42480000000               push       qword ptr [rsp + 0x80]
02211 488f442450                     pop        qword ptr [rsp + 0x50]
02216 48894424f8                     mov        qword ptr [rsp - 8], rax
0221b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0221f 89442444                       mov        dword ptr [rsp + 0x44], eax
02223 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02228 48894424f8                     mov        qword ptr [rsp - 8], rax
0222d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02234 89442458                       mov        dword ptr [rsp + 0x58], eax
02238 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0223d 48894424f8                     mov        qword ptr [rsp - 8], rax
02242 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02246 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0224a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0224f 898c2484000000                 mov        dword ptr [rsp + 0x84], ecx
02256 6690                           nop        
02258 c5f877                         vzeroupper 
0225b e80067b6ff                     call       0x7f60279c3660
02260 0f1f84005823001b               nop        dword ptr [rax + rax + 0x1b002358]
02268 bee4ffffff                     mov        esi, 0xffffffe4
0226d 48894424f8                     mov        qword ptr [rsp - 8], rax
02272 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02276 89442414                       mov        dword ptr [rsp + 0x14], eax
0227a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227f 48894424f8                     mov        qword ptr [rsp - 8], rax
02284 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02288 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0228c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02291 48ff742478                     push       qword ptr [rsp + 0x78]
02296 488f442440                     pop        qword ptr [rsp + 0x40]
0229b 48894424f8                     mov        qword ptr [rsp - 8], rax
022a0 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
022a4 89442448                       mov        dword ptr [rsp + 0x48], eax
022a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ad 48ffb42480000000               push       qword ptr [rsp + 0x80]
022b5 488f442458                     pop        qword ptr [rsp + 0x58]
022ba 48894424f8                     mov        qword ptr [rsp - 8], rax
022bf 8b442474                       mov        eax, dword ptr [rsp + 0x74]
022c3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
022c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022cc 48894424f8                     mov        qword ptr [rsp - 8], rax
022d1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
022d8 89442460                       mov        dword ptr [rsp + 0x60], eax
022dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022e1 48894424f8                     mov        qword ptr [rsp - 8], rax
022e6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
022ea 89442464                       mov        dword ptr [rsp + 0x64], eax
022ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f3 894c2474                       mov        dword ptr [rsp + 0x74], ecx
022f7 90                             nop        
022f8 c5f877                         vzeroupper 
022fb e86066b6ff                     call       0x7f60279c3660
02300 0f1f8400f823001c               nop        dword ptr [rax + rax + 0x1c0023f8]
02308 8d6901                         lea        ebp, [rcx + 1]
0230b bee4ffffff                     mov        esi, 0xffffffe4
02310 48894424f8                     mov        qword ptr [rsp - 8], rax
02315 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02319 89442414                       mov        dword ptr [rsp + 0x14], eax
0231d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02322 48894424f8                     mov        qword ptr [rsp - 8], rax
02327 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0232b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0232f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02334 48ff742478                     push       qword ptr [rsp + 0x78]
02339 488f442440                     pop        qword ptr [rsp + 0x40]
0233e 48894424f8                     mov        qword ptr [rsp - 8], rax
02343 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02347 89442448                       mov        dword ptr [rsp + 0x48], eax
0234b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02350 48ffb42480000000               push       qword ptr [rsp + 0x80]
02358 488f442458                     pop        qword ptr [rsp + 0x58]
0235d 48894424f8                     mov        qword ptr [rsp - 8], rax
02362 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02366 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0236a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0236f 48894424f8                     mov        qword ptr [rsp - 8], rax
02374 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
0237b 89442460                       mov        dword ptr [rsp + 0x60], eax
0237f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02384 48894424f8                     mov        qword ptr [rsp - 8], rax
02389 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0238d 89442464                       mov        dword ptr [rsp + 0x64], eax
02391 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02396 894c2474                       mov        dword ptr [rsp + 0x74], ecx
0239a 6690                           nop        
0239c c5f877                         vzeroupper 
0239f e8bc65b6ff                     call       0x7f60279c3660
023a4 0f1f84009c24001d               nop        dword ptr [rax + rax + 0x1d00249c]
023ac bee4ffffff                     mov        esi, 0xffffffe4
023b1 48894424f8                     mov        qword ptr [rsp - 8], rax
023b6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023ba 89442414                       mov        dword ptr [rsp + 0x14], eax
023be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c3 48894424f8                     mov        qword ptr [rsp - 8], rax
023c8 8b442468                       mov        eax, dword ptr [rsp + 0x68]
023cc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d5 48ff742478                     push       qword ptr [rsp + 0x78]
023da 488f442440                     pop        qword ptr [rsp + 0x40]
023df 48894424f8                     mov        qword ptr [rsp - 8], rax
023e4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
023e8 89442448                       mov        dword ptr [rsp + 0x48], eax
023ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f1 48ffb42480000000               push       qword ptr [rsp + 0x80]
023f9 488f442458                     pop        qword ptr [rsp + 0x58]
023fe 48894424f8                     mov        qword ptr [rsp - 8], rax
02403 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02407 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0240b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02410 48894424f8                     mov        qword ptr [rsp - 8], rax
02415 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02419 89442464                       mov        dword ptr [rsp + 0x64], eax
0241d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02422 894c2474                       mov        dword ptr [rsp + 0x74], ecx
02426 6690                           nop        
02428 c5f877                         vzeroupper 
0242b e83065b6ff                     call       0x7f60279c3660
02430 0f1f84002825001e               nop        dword ptr [rax + rax + 0x1e002528]
02438 bee4ffffff                     mov        esi, 0xffffffe4
0243d 488b2c24                       mov        rbp, qword ptr [rsp]
02441 48894424f8                     mov        qword ptr [rsp - 8], rax
02446 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0244a 89442408                       mov        dword ptr [rsp + 8], eax
0244e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02453 48ff742420                     push       qword ptr [rsp + 0x20]
02458 488f442418                     pop        qword ptr [rsp + 0x18]
0245d 48894424f8                     mov        qword ptr [rsp - 8], rax
02462 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02466 8944240c                       mov        dword ptr [rsp + 0xc], eax
0246a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0246f 48894424f8                     mov        qword ptr [rsp - 8], rax
02474 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02478 89442434                       mov        dword ptr [rsp + 0x34], eax
0247c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02481 48ff742478                     push       qword ptr [rsp + 0x78]
02486 488f442438                     pop        qword ptr [rsp + 0x38]
0248b 48894424f8                     mov        qword ptr [rsp - 8], rax
02490 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02494 89442440                       mov        dword ptr [rsp + 0x40], eax
02498 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249d 48894424f8                     mov        qword ptr [rsp - 8], rax
024a2 8b442474                       mov        eax, dword ptr [rsp + 0x74]
024a6 89442444                       mov        dword ptr [rsp + 0x44], eax
024aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024af 48894424f8                     mov        qword ptr [rsp - 8], rax
024b4 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024b8 8944245c                       mov        dword ptr [rsp + 0x5c], eax
024bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c1 894c2474                       mov        dword ptr [rsp + 0x74], ecx
024c5 666690                         nop        
024c8 c5f877                         vzeroupper 
024cb e89064b6ff                     call       0x7f60279c3660
024d0 0f1f8400c825001f               nop        dword ptr [rax + rax + 0x1f0025c8]
024d8 beccffffff                     mov        esi, 0xffffffcc
024dd 488b2c24                       mov        rbp, qword ptr [rsp]
024e1 48894424f8                     mov        qword ptr [rsp - 8], rax
024e6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
024ea 89442408                       mov        dword ptr [rsp + 8], eax
024ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f3 48ff742420                     push       qword ptr [rsp + 0x20]
024f8 488f442418                     pop        qword ptr [rsp + 0x18]
024fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02502 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02506 8944240c                       mov        dword ptr [rsp + 0xc], eax
0250a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250f 48894424f8                     mov        qword ptr [rsp - 8], rax
02514 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02518 89442434                       mov        dword ptr [rsp + 0x34], eax
0251c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02521 48ff742478                     push       qword ptr [rsp + 0x78]
02526 488f442438                     pop        qword ptr [rsp + 0x38]
0252b 48894424f8                     mov        qword ptr [rsp - 8], rax
02530 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02534 89442440                       mov        dword ptr [rsp + 0x40], eax
02538 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253d 48ffb42480000000               push       qword ptr [rsp + 0x80]
02545 488f442450                     pop        qword ptr [rsp + 0x50]
0254a 48894424f8                     mov        qword ptr [rsp - 8], rax
0254f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02553 89442444                       mov        dword ptr [rsp + 0x44], eax
02557 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0255c 48894424f8                     mov        qword ptr [rsp - 8], rax
02561 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02568 89442458                       mov        dword ptr [rsp + 0x58], eax
0256c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02571 48894424f8                     mov        qword ptr [rsp - 8], rax
02576 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0257a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0257e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02583 894c2474                       mov        dword ptr [rsp + 0x74], ecx
02587 90                             nop        
02588 c5f877                         vzeroupper 
0258b e8d063b6ff                     call       0x7f60279c3660
02590 0f1f840088260020               nop        dword ptr [rax + rax + 0x20002688]
02598 be45ffffff                     mov        esi, 0xffffff45
0259d 488b2c24                       mov        rbp, qword ptr [rsp]
025a1 48894424f8                     mov        qword ptr [rsp - 8], rax
025a6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
025aa 89442408                       mov        dword ptr [rsp + 8], eax
025ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b3 48ff742420                     push       qword ptr [rsp + 0x20]
025b8 488f442418                     pop        qword ptr [rsp + 0x18]
025bd 48894424f8                     mov        qword ptr [rsp - 8], rax
025c2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025c6 8944240c                       mov        dword ptr [rsp + 0xc], eax
025ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025cf 48894424f8                     mov        qword ptr [rsp - 8], rax
025d4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
025d8 89442438                       mov        dword ptr [rsp + 0x38], eax
025dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e1 48894424f8                     mov        qword ptr [rsp - 8], rax
025e6 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
025ea 8944243c                       mov        dword ptr [rsp + 0x3c], eax
025ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f3 894c2468                       mov        dword ptr [rsp + 0x68], ecx
025f7 90                             nop        
025f8 c5f877                         vzeroupper 
025fb e86063b6ff                     call       0x7f60279c3660
02600 0f1f8400f8260021               nop        dword ptr [rax + rax + 0x210026f8]
02608 bebeffffff                     mov        esi, 0xffffffbe
0260d 488b2c24                       mov        rbp, qword ptr [rsp]
02611 48894424f8                     mov        qword ptr [rsp - 8], rax
02616 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0261a 89442408                       mov        dword ptr [rsp + 8], eax
0261e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02623 48ff742420                     push       qword ptr [rsp + 0x20]
02628 488f442418                     pop        qword ptr [rsp + 0x18]
0262d 48894424f8                     mov        qword ptr [rsp - 8], rax
02632 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02636 8944240c                       mov        dword ptr [rsp + 0xc], eax
0263a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0263f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02643 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02648 c5f877                         vzeroupper 
0264b e81063b6ff                     call       0x7f60279c3660
02650 0f1f840048270022               nop        dword ptr [rax + rax + 0x22002748]
02658 be85ffffff                     mov        esi, 0xffffff85
0265d 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
02661 48894424f8                     mov        qword ptr [rsp - 8], rax
02666 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0266a 890424                         mov        dword ptr [rsp], eax
0266d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02672 895c2404                       mov        dword ptr [rsp + 4], ebx
02676 4489742408                     mov        dword ptr [rsp + 8], r14d
0267b 90                             nop        
0267c c5f877                         vzeroupper 
0267f e8dc62b6ff                     call       0x7f60279c3660
02684 0f1f84007c270023               nop        dword ptr [rax + rax + 0x2300277c]
0268c beccffffff                     mov        esi, 0xffffffcc
02691 488b2c24                       mov        rbp, qword ptr [rsp]
02695 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0269a 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0269e 4489442420                     mov        dword ptr [rsp + 0x20], r8d
026a3 90                             nop        
026a4 c5f877                         vzeroupper 
026a7 e8b462b6ff                     call       0x7f60279c3660
026ac 0f1f8400a4270024               nop        dword ptr [rax + rax + 0x240027a4]
026b4 bee4ffffff                     mov        esi, 0xffffffe4
026b9 488b2c24                       mov        rbp, qword ptr [rsp]
026bd 48894424f8                     mov        qword ptr [rsp - 8], rax
026c2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
026c6 89442408                       mov        dword ptr [rsp + 8], eax
026ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026cf 48ff742420                     push       qword ptr [rsp + 0x20]
026d4 488f442418                     pop        qword ptr [rsp + 0x18]
026d9 48894424f8                     mov        qword ptr [rsp - 8], rax
026de 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026e2 8944240c                       mov        dword ptr [rsp + 0xc], eax
026e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026eb 48894424f8                     mov        qword ptr [rsp - 8], rax
026f0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
026f4 89442434                       mov        dword ptr [rsp + 0x34], eax
026f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026fd 48ff742478                     push       qword ptr [rsp + 0x78]
02702 488f442438                     pop        qword ptr [rsp + 0x38]
02707 48894424f8                     mov        qword ptr [rsp - 8], rax
0270c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02710 89442440                       mov        dword ptr [rsp + 0x40], eax
02714 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02719 48ffb42480000000               push       qword ptr [rsp + 0x80]
02721 488f442450                     pop        qword ptr [rsp + 0x50]
02726 48894424f8                     mov        qword ptr [rsp - 8], rax
0272b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0272f 89442444                       mov        dword ptr [rsp + 0x44], eax
02733 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02738 48894424f8                     mov        qword ptr [rsp - 8], rax
0273d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02741 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02745 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274a 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
02751 666690                         nop        
02754 c5f877                         vzeroupper 
02757 e80462b6ff                     call       0x7f60279c3660
0275c 0f1f840054280025               nop        dword ptr [rax + rax + 0x25002854]
02764 bee4ffffff                     mov        esi, 0xffffffe4
02769 488b2c24                       mov        rbp, qword ptr [rsp]
0276d 48894424f8                     mov        qword ptr [rsp - 8], rax
02772 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02776 89442408                       mov        dword ptr [rsp + 8], eax
0277a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277f 48ff742420                     push       qword ptr [rsp + 0x20]
02784 488f442418                     pop        qword ptr [rsp + 0x18]
02789 48894424f8                     mov        qword ptr [rsp - 8], rax
0278e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02792 8944240c                       mov        dword ptr [rsp + 0xc], eax
02796 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279b 48894424f8                     mov        qword ptr [rsp - 8], rax
027a0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
027a4 89442434                       mov        dword ptr [rsp + 0x34], eax
027a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ad 48ff742478                     push       qword ptr [rsp + 0x78]
027b2 488f442438                     pop        qword ptr [rsp + 0x38]
027b7 48894424f8                     mov        qword ptr [rsp - 8], rax
027bc 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
027c0 89442440                       mov        dword ptr [rsp + 0x40], eax
027c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c9 48894424f8                     mov        qword ptr [rsp - 8], rax
027ce 8b442474                       mov        eax, dword ptr [rsp + 0x74]
027d2 89442444                       mov        dword ptr [rsp + 0x44], eax
027d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027db 48894424f8                     mov        qword ptr [rsp - 8], rax
027e0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
027e4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ed 894c2468                       mov        dword ptr [rsp + 0x68], ecx
027f1 666690                         nop        
027f4 c5f877                         vzeroupper 
027f7 e86461b6ff                     call       0x7f60279c3660
027fc 0f1f8400f4280026               nop        dword ptr [rax + rax + 0x260028f4]
02804 83c108                         add        ecx, 8
02807 be6effffff                     mov        esi, 0xffffff6e
0280c 48894424f8                     mov        qword ptr [rsp - 8], rax
02811 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02815 89442414                       mov        dword ptr [rsp + 0x14], eax
02819 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281e 48894424f8                     mov        qword ptr [rsp - 8], rax
02823 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02827 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0282b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02830 48894424f8                     mov        qword ptr [rsp - 8], rax
02835 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02839 89442448                       mov        dword ptr [rsp + 0x48], eax
0283d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02842 48894424f8                     mov        qword ptr [rsp - 8], rax
02847 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0284b 89442464                       mov        dword ptr [rsp + 0x64], eax
0284f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02854 48894424f8                     mov        qword ptr [rsp - 8], rax
02859 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
02860 89442468                       mov        dword ptr [rsp + 0x68], eax
02864 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02869 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
0286d 666690                         nop        
02870 c5f877                         vzeroupper 
02873 e8e860b6ff                     call       0x7f60279c3660
02878 0f1f840070290027               nop        dword ptr [rax + rax + 0x27002970]
02880 83c108                         add        ecx, 8
02883 beb6ffffff                     mov        esi, 0xffffffb6
02888 48894424f8                     mov        qword ptr [rsp - 8], rax
0288d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02891 89442414                       mov        dword ptr [rsp + 0x14], eax
02895 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0289a 48894424f8                     mov        qword ptr [rsp - 8], rax
0289f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
028a3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
028a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ac 48894424f8                     mov        qword ptr [rsp - 8], rax
028b1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
028b5 89442448                       mov        dword ptr [rsp + 0x48], eax
028b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028be 48894424f8                     mov        qword ptr [rsp - 8], rax
028c3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
028c7 89442464                       mov        dword ptr [rsp + 0x64], eax
028cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d0 48894424f8                     mov        qword ptr [rsp - 8], rax
028d5 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
028dc 89442468                       mov        dword ptr [rsp + 0x68], eax
028e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e5 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
028e9 666690                         nop        
028ec c5f877                         vzeroupper 
028ef e86c60b6ff                     call       0x7f60279c3660
028f4 0f1f8400ec290028               nop        dword ptr [rax + rax + 0x280029ec]
028fc 83c108                         add        ecx, 8
028ff be66ffffff                     mov        esi, 0xffffff66
02904 48894424f8                     mov        qword ptr [rsp - 8], rax
02909 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0290d 89442414                       mov        dword ptr [rsp + 0x14], eax
02911 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02916 48894424f8                     mov        qword ptr [rsp - 8], rax
0291b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0291f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02923 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02928 48894424f8                     mov        qword ptr [rsp - 8], rax
0292d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02931 89442448                       mov        dword ptr [rsp + 0x48], eax
02935 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0293a 48894424f8                     mov        qword ptr [rsp - 8], rax
0293f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02943 89442464                       mov        dword ptr [rsp + 0x64], eax
02947 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0294c 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
02950 4489442470                     mov        dword ptr [rsp + 0x70], r8d
02955 666690                         nop        
02958 c5f877                         vzeroupper 
0295b e80060b6ff                     call       0x7f60279c3660
02960 0f1f8400582a0029               nop        dword ptr [rax + rax + 0x29002a58]
02968 bee4ffffff                     mov        esi, 0xffffffe4
0296d 488b2c24                       mov        rbp, qword ptr [rsp]
02971 48894424f8                     mov        qword ptr [rsp - 8], rax
02976 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0297a 89442408                       mov        dword ptr [rsp + 8], eax
0297e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02983 48ff742420                     push       qword ptr [rsp + 0x20]
02988 488f442418                     pop        qword ptr [rsp + 0x18]
0298d 48894424f8                     mov        qword ptr [rsp - 8], rax
02992 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02996 8944240c                       mov        dword ptr [rsp + 0xc], eax
0299a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0299f 48894424f8                     mov        qword ptr [rsp - 8], rax
029a4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
029a8 89442434                       mov        dword ptr [rsp + 0x34], eax
029ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b1 48ff742478                     push       qword ptr [rsp + 0x78]
029b6 488f442438                     pop        qword ptr [rsp + 0x38]
029bb 48894424f8                     mov        qword ptr [rsp - 8], rax
029c0 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
029c4 89442440                       mov        dword ptr [rsp + 0x40], eax
029c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029cd 48ffb42480000000               push       qword ptr [rsp + 0x80]
029d5 488f442450                     pop        qword ptr [rsp + 0x50]
029da 48894424f8                     mov        qword ptr [rsp - 8], rax
029df 8b442474                       mov        eax, dword ptr [rsp + 0x74]
029e3 89442444                       mov        dword ptr [rsp + 0x44], eax
029e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ec 48894424f8                     mov        qword ptr [rsp - 8], rax
029f1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029f5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
029f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029fe 89442460                       mov        dword ptr [rsp + 0x60], eax
02a02 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02a07 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02a0b 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02a10 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02a18 c5f877                         vzeroupper 
02a1b e8405fb6ff                     call       0x7f60279c3660
02a20 0f1f8400182b002a               nop        dword ptr [rax + rax + 0x2a002b18]
02a28 c5fa7f8424c0000000             vmovdqu    xmmword ptr [rsp + 0xc0], xmm0
02a31 bee4ffffff                     mov        esi, 0xffffffe4
02a36 488b2c24                       mov        rbp, qword ptr [rsp]
02a3a 48894424f8                     mov        qword ptr [rsp - 8], rax
02a3f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02a43 89442408                       mov        dword ptr [rsp + 8], eax
02a47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a4c 48ff742420                     push       qword ptr [rsp + 0x20]
02a51 488f442418                     pop        qword ptr [rsp + 0x18]
02a56 48894424f8                     mov        qword ptr [rsp - 8], rax
02a5b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a5f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a68 48894424f8                     mov        qword ptr [rsp - 8], rax
02a6d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02a71 89442434                       mov        dword ptr [rsp + 0x34], eax
02a75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a7a 48ff742478                     push       qword ptr [rsp + 0x78]
02a7f 488f442438                     pop        qword ptr [rsp + 0x38]
02a84 48894424f8                     mov        qword ptr [rsp - 8], rax
02a89 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02a8d 89442440                       mov        dword ptr [rsp + 0x40], eax
02a91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a96 48ffb42480000000               push       qword ptr [rsp + 0x80]
02a9e 488f442450                     pop        qword ptr [rsp + 0x50]
02aa3 48894424f8                     mov        qword ptr [rsp - 8], rax
02aa8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02aac 89442444                       mov        dword ptr [rsp + 0x44], eax
02ab0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab5 48894424f8                     mov        qword ptr [rsp - 8], rax
02aba 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02abe 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ac2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac7 89442460                       mov        dword ptr [rsp + 0x60], eax
02acb 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02ad0 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02ad5 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02adc c5f877                         vzeroupper 
02adf e87c5eb6ff                     call       0x7f60279c3660
02ae4 0f1f8400dc2b002b               nop        dword ptr [rax + rax + 0x2b002bdc]
02aec beccffffff                     mov        esi, 0xffffffcc
02af1 488b2c24                       mov        rbp, qword ptr [rsp]
02af5 48894424f8                     mov        qword ptr [rsp - 8], rax
02afa 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02afe 89442408                       mov        dword ptr [rsp + 8], eax
02b02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b07 48ff742420                     push       qword ptr [rsp + 0x20]
02b0c 488f442418                     pop        qword ptr [rsp + 0x18]
02b11 48894424f8                     mov        qword ptr [rsp - 8], rax
02b16 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b1a 8944240c                       mov        dword ptr [rsp + 0xc], eax
02b1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b23 48894424f8                     mov        qword ptr [rsp - 8], rax
02b28 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02b2c 89442438                       mov        dword ptr [rsp + 0x38], eax
02b30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b35 48ff742478                     push       qword ptr [rsp + 0x78]
02b3a 488f442440                     pop        qword ptr [rsp + 0x40]
02b3f 48894424f8                     mov        qword ptr [rsp - 8], rax
02b44 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02b48 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b51 48ffb42480000000               push       qword ptr [rsp + 0x80]
02b59 488f442450                     pop        qword ptr [rsp + 0x50]
02b5e 48894424f8                     mov        qword ptr [rsp - 8], rax
02b63 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02b67 89442458                       mov        dword ptr [rsp + 0x58], eax
02b6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b70 48894424f8                     mov        qword ptr [rsp - 8], rax
02b75 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02b7c 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02b80 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b85 48894424f8                     mov        qword ptr [rsp - 8], rax
02b8a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b8e 89442460                       mov        dword ptr [rsp + 0x60], eax
02b92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b97 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02b9c 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02ba0 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02ba7 90                             nop        
02ba8 c5f877                         vzeroupper 
02bab e8b05db6ff                     call       0x7f60279c3660
02bb0 0f1f8400a82c002c               nop        dword ptr [rax + rax + 0x2c002ca8]
02bb8 418bee                         mov        ebp, r14d
02bbb 83c510                         add        ebp, 0x10
02bbe be6effffff                     mov        esi, 0xffffff6e
02bc3 48894424f8                     mov        qword ptr [rsp - 8], rax
02bc8 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02bcc 89442414                       mov        dword ptr [rsp + 0x14], eax
02bd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd5 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02bda 48894424f8                     mov        qword ptr [rsp - 8], rax
02bdf 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02be3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02be7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bec 48ff742478                     push       qword ptr [rsp + 0x78]
02bf1 488f442440                     pop        qword ptr [rsp + 0x40]
02bf6 48894424f8                     mov        qword ptr [rsp - 8], rax
02bfb 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02bff 89442448                       mov        dword ptr [rsp + 0x48], eax
02c03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c08 48894424f8                     mov        qword ptr [rsp - 8], rax
02c0d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02c11 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02c15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c1a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c1f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c23 89442464                       mov        dword ptr [rsp + 0x64], eax
02c27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c2c 89442468                       mov        dword ptr [rsp + 0x68], eax
02c30 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02c35 666690                         nop        
02c38 c5f877                         vzeroupper 
02c3b e8205db6ff                     call       0x7f60279c3660
02c40 0f1f8400382d002d               nop        dword ptr [rax + rax + 0x2d002d38]
02c48 418bee                         mov        ebp, r14d
02c4b 83c510                         add        ebp, 0x10
02c4e be66ffffff                     mov        esi, 0xffffff66
02c53 48894424f8                     mov        qword ptr [rsp - 8], rax
02c58 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c5c 89442414                       mov        dword ptr [rsp + 0x14], eax
02c60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c65 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02c6a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c6f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02c73 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02c77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c7c 48ff742478                     push       qword ptr [rsp + 0x78]
02c81 488f442440                     pop        qword ptr [rsp + 0x40]
02c86 48894424f8                     mov        qword ptr [rsp - 8], rax
02c8b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02c8f 89442448                       mov        dword ptr [rsp + 0x48], eax
02c93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c98 48894424f8                     mov        qword ptr [rsp - 8], rax
02c9d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02ca1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02ca5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02caa 48894424f8                     mov        qword ptr [rsp - 8], rax
02caf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02cb3 89442464                       mov        dword ptr [rsp + 0x64], eax
02cb7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cbc 89442468                       mov        dword ptr [rsp + 0x68], eax
02cc0 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02cc5 666690                         nop        
02cc8 c5f877                         vzeroupper 
02ccb e8905cb6ff                     call       0x7f60279c3660
02cd0 0f1f8400c82d002e               nop        dword ptr [rax + rax + 0x2e002dc8]
02cd8 488bf0                         mov        rsi, rax
02cdb eb0d                           jmp        0x7f6027e5d9ea
02cdd 488bf0                         mov        rsi, rax
02ce0 eb08                           jmp        0x7f6027e5d9ea
02ce2 488bf0                         mov        rsi, rax
02ce5 eb03                           jmp        0x7f6027e5d9ea
02ce7 488bf0                         mov        rsi, rax
02cea c5f877                         vzeroupper 
02ced 4881c4f0000000                 add        rsp, 0xf0
02cf4 5d                             pop        rbp
02cf5 e966dbb6ff                     jmp        0x7f60279cb560
02cfa bef6ffffff                     mov        esi, 0xfffffff6
02cff 90                             nop        
02d00 c5f877                         vzeroupper 
02d03 e8585cb6ff                     call       0x7f60279c3660
02d08 0f1f8400002e002f               nop        dword ptr [rax + rax + 0x2f002e00]
02d10 49babcbae527607f0000           movabs     r10, 0x7f6027e5babc
02d1a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02d21 e9ba04aaff                     jmp        0x7f60278fdee0
02d26 e875d0a8ff                     call       0x7f60278eaaa0
02d2b e9fed2ffff                     jmp        0x7f6027e5ad2e
