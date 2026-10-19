00000 e87b887315                     call       0x7fc021593580
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85782c0000                   jne        0x7fc00be5d9a6
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
00101 49bac09c6721c07f0000           movabs     r10, 0x7fc021679cc0
0010b 41ffd2                         call       r10
0010e 0f1f840000000000               nop        dword ptr [rax + rax]
00116 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0011b 4d85d2                         test       r10, r10
0011e 0f84181a0000                   je         0x7fc00be5c83c
00124 458b12                         mov        r10d, dword ptr [r10]
00127 41c1ea0d                       shr        r10d, 0xd
0012b 4181fa15410000                 cmp        r10d, 0x4115
00132 0f85a0240000                   jne        0x7fc00be5d2d8
00138 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0013d 4c891424                       mov        qword ptr [rsp], r10
00141 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00146 4d85d2                         test       r10, r10
00149 0f84f9190000                   je         0x7fc00be5c848
0014f 458b1a                         mov        r11d, dword ptr [r10]
00152 41c1eb0d                       shr        r11d, 0xd
00156 4181fbe4050000                 cmp        r11d, 0x5e4
0015d 0f8575240000                   jne        0x7fc00be5d2d8
00163 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0016b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00170 4d85d2                         test       r10, r10
00173 0f84df190000                   je         0x7fc00be5c858
00179 458b12                         mov        r10d, dword ptr [r10]
0017c 41c1ea0d                       shr        r10d, 0xd
00180 4181fae7050000                 cmp        r10d, 0x5e7
00187 0f854b240000                   jne        0x7fc00be5d2d8
0018d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00192 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0019a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0019f 4d85d2                         test       r10, r10
001a2 0f84c0190000                   je         0x7fc00be5c868
001a8 458b1a                         mov        r11d, dword ptr [r10]
001ab 41c1eb0d                       shr        r11d, 0xd
001af 4181fbe6050000                 cmp        r11d, 0x5e6
001b6 0f851c240000                   jne        0x7fc00be5d2d8
001bc 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001c1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001c6 4d85d2                         test       r10, r10
001c9 0f84a6190000                   je         0x7fc00be5c875
001cf 458b12                         mov        r10d, dword ptr [r10]
001d2 41c1ea0d                       shr        r10d, 0xd
001d6 4181fae6050000                 cmp        r10d, 0x5e6
001dd 0f85f5230000                   jne        0x7fc00be5d2d8
001e3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001e8 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
001f0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001f5 4d85d2                         test       r10, r10
001f8 0f8487190000                   je         0x7fc00be5c885
001fe 458b1a                         mov        r11d, dword ptr [r10]
00201 41c1eb0d                       shr        r11d, 0xd
00205 4181fbe4050000                 cmp        r11d, 0x5e4
0020c 0f85c6230000                   jne        0x7fc00be5d2d8
00212 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0021a 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00222 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00226 44895c2408                     mov        dword ptr [rsp + 8], r11d
0022b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00230 4585d2                         test       r10d, r10d
00233 0f844f230000                   je         0x7fc00be5d288
00239 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00241 458b5204                       mov        r10d, dword ptr [r10 + 4]
00245 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0024a 4585d2                         test       r10d, r10d
0024d 0f8635230000                   jbe        0x7fc00be5d288
00253 4183fa01                       cmp        r10d, 1
00257 0f862b230000                   jbe        0x7fc00be5d288
0025d 4183fa02                       cmp        r10d, 2
00261 0f8621230000                   jbe        0x7fc00be5d288
00267 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0026f 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00273 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00278 4183c3f1                       add        r11d, -0xf
0027c 4585db                         test       r11d, r11d
0027f 0f8c03230000                   jl         0x7fc00be5d288
00285 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0028d 458b5204                       mov        r10d, dword ptr [r10 + 4]
00291 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00296 4183c2f1                       add        r10d, -0xf
0029a 4585d2                         test       r10d, r10d
0029d 0f8ce5220000                   jl         0x7fc00be5d288
002a3 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002a8 4183c3f9                       add        r11d, -7
002ac 4585db                         test       r11d, r11d
002af 0f8cd3220000                   jl         0x7fc00be5d288
002b5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002ba 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
002bf 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
002c4 458d53f1                       lea        r10d, [r11 - 0xf]
002c8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
002d0 458d59f9                       lea        r11d, [r9 - 7]
002d4 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
002dc 4d63d1                         movsxd     r10, r9d
002df 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002e4 4183c1f1                       add        r9d, -0xf
002e8 44898c24b4000000               mov        dword ptr [rsp + 0xb4], r9d
002f0 4983c2f9                       add        r10, -7
002f4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002f9 e917040000                     jmp        0x7fc00be5b415
002fe 448bd5                         mov        r10d, ebp
00301 4d63d2                         movsxd     r10, r10d
00304 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0030b c442a8f5db                     bzhi       r11, r11, r10
00310 c4c1fb92fb                     kmovq      k7, r11
00315 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0031b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00321 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00329 4403dd                         add        r11d, ebp
0032c 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00334 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00338 418502                         test       dword ptr [r10], eax
0033b 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00343 0f8dab090000                   jge        0x7fc00be5b9f4
00349 899c24cc000000                 mov        dword ptr [rsp + 0xcc], ebx
00350 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00358 442b9c24bc000000               sub        r11d, dword ptr [rsp + 0xbc]
00360 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00368 8bac24b8000000                 mov        ebp, dword ptr [rsp + 0xb8]
0036f 2bac24bc000000                 sub        ebp, dword ptr [rsp + 0xbc]
00376 3bac24bc000000                 cmp        ebp, dword ptr [rsp + 0xbc]
0037d 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00385 410f4fea                       cmovg      ebp, r10d
00389 4585db                         test       r11d, r11d
0038c 0f8c321a0000                   jl         0x7fc00be5cac4
00392 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0039a 4585d2                         test       r10d, r10d
0039d 0f8c211a0000                   jl         0x7fc00be5cac4
003a3 458d142b                       lea        r10d, [r11 + rbp]
003a7 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
003ac 453bc2                         cmp        r8d, r10d
003af 0f820f1a0000                   jb         0x7fc00be5cac4
003b5 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
003bc 03dd                           add        ebx, ebp
003be 443bc3                         cmp        r8d, ebx
003c1 0f82fd190000                   jb         0x7fc00be5cac4
003c7 85ed                           test       ebp, ebp
003c9 0f8cf5190000                   jl         0x7fc00be5cac4
003cf 85ed                           test       ebp, ebp
003d1 0f844affffff                   je         0x7fc00be5b021
003d7 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
003df 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
003e7 4b8d740208                     lea        rsi, [r10 + r8 + 8]
003ec 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
003f4 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
003fc 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00401 4863d5                         movsxd     rdx, ebp
00404 4883fa20                       cmp        rdx, 0x20
00408 0f86f0feffff                   jbe        0x7fc00be5affe
0040e c5f877                         vzeroupper 
00411 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
0041b 41ffd2                         call       r10
0041e 0f1f840000000000               nop        dword ptr [rax + rax]
00426 e9f6feffff                     jmp        0x7fc00be5b021
0042b 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00433 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0043b c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00442 8b9c24b8000000                 mov        ebx, dword ptr [rsp + 0xb8]
00449 4103db                         add        ebx, r11d
0044c e9a8020000                     jmp        0x7fc00be5b3f9
00451 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00459 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00461 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00466 498d7c0b08                     lea        rdi, [r11 + rcx + 8]
0046b 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00473 44039c24c4000000               add        r11d, dword ptr [rsp + 0xc4]
0047b 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00483 4d63cb                         movsxd     r9, r11d
00486 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0048e 443b9424b8000000               cmp        r10d, dword ptr [rsp + 0xb8]
00496 0f8ce1050000                   jl         0x7fc00be5b77d
0049c 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
004a4 4183fb30                       cmp        r11d, 0x30
004a8 0f8e9f000000                   jle        0x7fc00be5b24d
004ae 85c9                           test       ecx, ecx
004b0 0f8c4e180000                   jl         0x7fc00be5ca04
004b6 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
004be 4585db                         test       r11d, r11d
004c1 0f8c3d180000                   jl         0x7fc00be5ca04
004c7 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
004cf 4403d1                         add        r10d, ecx
004d2 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
004d7 453bc2                         cmp        r8d, r10d
004da 0f8224180000                   jb         0x7fc00be5ca04
004e0 443b8424c8000000               cmp        r8d, dword ptr [rsp + 0xc8]
004e8 0f8216180000                   jb         0x7fc00be5ca04
004ee 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
004f6 4585d2                         test       r10d, r10d
004f9 0f84ec010000                   je         0x7fc00be5b3eb
004ff 4963d2                         movsxd     rdx, r10d
00502 4883fa20                       cmp        rdx, 0x20
00506 7728                           ja         0x7fc00be5b230
00508 458bda                         mov        r11d, r10d
0050b 4d63d3                         movsxd     r10, r11d
0050e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00515 c442a8f5db                     bzhi       r11, r11, r10
0051a c4c1fb92fb                     kmovq      k7, r11
0051f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00525 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0052b e9bb010000                     jmp        0x7fc00be5b3eb
00530 c5f877                         vzeroupper 
00533 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
0053d 41ffd2                         call       r10
00540 0f1f840000000000               nop        dword ptr [rax + rax]
00548 e99e010000                     jmp        0x7fc00be5b3eb
0054d 3b8c24b0000000                 cmp        ecx, dword ptr [rsp + 0xb0]
00554 0f835a140000                   jae        0x7fc00be5c6b4
0055a 4863f9                         movsxd     rdi, ecx
0055d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00565 4d8b443a08                     mov        r8, qword ptr [r10 + rdi + 8]
0056a 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
00572 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0057a 0f83f8140000                   jae        0x7fc00be5c778
00580 458d5a08                       lea        r11d, [r10 + 8]
00584 4963da                         movsxd     rbx, r10d
00587 488b9424d8000000               mov        rdx, qword ptr [rsp + 0xd8]
0058f 4c89441a08                     mov        qword ptr [rdx + rbx + 8], r8
00594 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0059c 0f8d49010000                   jge        0x7fc00be5b3eb
005a2 482bfb                         sub        rdi, rbx
005a5 4963db                         movsxd     rbx, r11d
005a8 4c8d043b                       lea        r8, [rbx + rdi]
005ac 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
005b1 0f83de150000                   jae        0x7fc00be5c895
005b7 4d8bc1                         mov        r8, r9
005ba 4c2bc3                         sub        r8, rbx
005bd 4983c007                       add        r8, 7
005c1 4983e0f8                       and        r8, 0xfffffffffffffff8
005c5 458bc0                         mov        r8d, r8d
005c8 438d5c1008                     lea        ebx, [r8 + r10 + 8]
005cd 4c63c3                         movsxd     r8, ebx
005d0 498d5c38f8                     lea        rbx, [r8 + rdi - 8]
005d5 483b5c2438                     cmp        rbx, qword ptr [rsp + 0x38]
005da 0f83b5150000                   jae        0x7fc00be5c895
005e0 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
005e8 0f83a7150000                   jae        0x7fc00be5c895
005ee 4983c0f8                       add        r8, -8
005f2 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
005f7 0f8398150000                   jae        0x7fc00be5c895
005fd 448b8424c8000000               mov        r8d, dword ptr [rsp + 0xc8]
00605 4181f8f8ffff7f                 cmp        r8d, 0x7ffffff8
0060c 0f8f42160000                   jg         0x7fc00be5c954
00612 412bca                         sub        ecx, r10d
00615 4183c210                       add        r10d, 0x10
00619 468d0419                       lea        r8d, [rcx + r11]
0061d 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
00625 4e8b440308                     mov        r8, qword ptr [rbx + r8 + 8]
0062a 418bdb                         mov        ebx, r11d
0062d 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00635 4c89441f08                     mov        qword ptr [rdi + rbx + 8], r8
0063a 4183c308                       add        r11d, 8
0063e 453bda                         cmp        r11d, r10d
00641 7cd6                           jl         0x7fc00be5b319
00643 4983c1f8                       add        r9, -8
00647 4981f900000080                 cmp        r9, -0x80000000
0064e 49c7c200000080                 mov        r10, 0xffffffff80000000
00655 4d0f4cca                       cmovl      r9, r10
00659 458bd1                         mov        r10d, r9d
0065c 453bda                         cmp        r11d, r10d
0065f 7d4f                           jge        0x7fc00be5b3b0
00661 0f1f840000000000               nop        dword ptr [rax + rax]
00669 0f1f8000000000                 nop        dword ptr [rax]
00670 468d0c19                       lea        r9d, [rcx + r11]
00674 458bc3                         mov        r8d, r11d
00677 4963d8                         movsxd     rbx, r8d
0067a 458bc1                         mov        r8d, r9d
0067d 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00685 4a8b540708                     mov        rdx, qword ptr [rdi + r8 + 8]
0068a 4d63c1                         movsxd     r8, r9d
0068d 418bfb                         mov        edi, r11d
00690 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
00698 4989543908                     mov        qword ptr [r9 + rdi + 8], rdx
0069d 4f8b440110                     mov        r8, qword ptr [r9 + r8 + 0x10]
006a2 4d89441910                     mov        qword ptr [r9 + rbx + 0x10], r8
006a7 4183c310                       add        r11d, 0x10
006ab 453bda                         cmp        r11d, r10d
006ae 7cc0                           jl         0x7fc00be5b370
006b0 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
006b8 7d31                           jge        0x7fc00be5b3eb
006ba 6690                           nop        
006bc 468d0419                       lea        r8d, [rcx + r11]
006c0 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
006c8 4f8b440208                     mov        r8, qword ptr [r10 + r8 + 8]
006cd 458bd3                         mov        r10d, r11d
006d0 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
006d8 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
006dd 4183c308                       add        r11d, 8
006e1 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
006e9 7cd1                           jl         0x7fc00be5b3bc
006eb 8b9c24c4000000                 mov        ebx, dword ptr [rsp + 0xc4]
006f2 039c24b8000000                 add        ebx, dword ptr [rsp + 0xb8]
006f9 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006fd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00702 41ffc3                         inc        r11d
00705 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0070a 418502                         test       dword ptr [r10], eax
0070d 448bb424c0000000               mov        r14d, dword ptr [rsp + 0xc0]
00715 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0071d 498d741a08                     lea        rsi, [r10 + rbx + 8]
00722 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00727 452bc6                         sub        r8d, r14d
0072a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00732 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
00737 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0073c 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00741 0f8ddb050000                   jge        0x7fc00be5ba22
00747 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
0074c 0f836f0d0000                   jae        0x7fc00be5c1c1
00752 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
0075a 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
0075f 418bc2                         mov        eax, r10d
00762 25ffff0100                     and        eax, 0x1ffff
00767 4d8bda                         mov        r11, r10
0076a 49c1eb12                       shr        r11, 0x12
0076e 49c1fa24                       sar        r10, 0x24
00772 458bdb                         mov        r11d, r11d
00775 458bd2                         mov        r10d, r10d
00778 418bca                         mov        ecx, r10d
0077b 4181e3ffff0300                 and        r11d, 0x3ffff
00782 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0078a 4585d2                         test       r10d, r10d
0078d 0f8cd50f0000                   jl         0x7fc00be5c468
00793 85c0                           test       eax, eax
00795 0f8521020000                   jne        0x7fc00be5b6bc
0079b 4533d2                         xor        r10d, r10d
0079e 418bc2                         mov        eax, r10d
007a1 448bd1                         mov        r10d, ecx
007a4 4183fa03                       cmp        r10d, 3
007a8 0f8e32020000                   jle        0x7fc00be5b6e0
007ae 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007b6 458b5a0c                       mov        r11d, dword ptr [r10 + 0xc]
007ba 45895a10                       mov        dword ptr [r10 + 0x10], r11d
007be 458b5208                       mov        r10d, dword ptr [r10 + 8]
007c2 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
007ca 4589530c                       mov        dword ptr [r11 + 0xc], r10d
007ce 448d51fd                       lea        r10d, [rcx - 3]
007d2 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
007da 45895308                       mov        dword ptr [r11 + 8], r10d
007de 4863ac24bc000000               movsxd     rbp, dword ptr [rsp + 0xbc]
007e6 4c63d3                         movsxd     r10, ebx
007e9 4c03542478                     add        r10, qword ptr [rsp + 0x78]
007ee 4863d0                         movsxd     rdx, eax
007f1 4c03d2                         add        r10, rdx
007f4 493bea                         cmp        rbp, r10
007f7 0f8feb0f0000                   jg         0x7fc00be5c4e8
007fd 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00805 4585c0                         test       r8d, r8d
00808 0f8e3a0f0000                   jle        0x7fc00be5c448
0080e 448d2c03                       lea        r13d, [rbx + rax]
00812 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0081a 4503dd                         add        r11d, r13d
0081d 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
00822 0f8f60100000                   jg         0x7fc00be5c588
00828 458d1c06                       lea        r11d, [r14 + rax]
0082c 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00834 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0083c 0f8fd6100000                   jg         0x7fc00be5c618
00842 83f810                         cmp        eax, 0x10
00845 0f8f5c050000                   jg         0x7fc00be5baa7
0084b 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00853 0f83df0c0000                   jae        0x7fc00be5c238
00859 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00861 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
00868 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
0086f 0f836b0d0000                   jae        0x7fc00be5c2e0
00875 468d1430                       lea        r10d, [rax + r14]
00879 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00881 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00889 c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00890 448d1418                       lea        r10d, [rax + rbx]
00894 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0089c 8b8c24c4000000                 mov        ecx, dword ptr [rsp + 0xc4]
008a3 2b8c24bc000000                 sub        ecx, dword ptr [rsp + 0xbc]
008aa 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
008b2 4183fa10                       cmp        r10d, 0x10
008b6 0f8f95fbffff                   jg         0x7fc00be5b151
008bc 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
008c4 4183fb10                       cmp        r11d, 0x10
008c8 0f8c83fbffff                   jl         0x7fc00be5b151
008ce 3b8c24b4000000                 cmp        ecx, dword ptr [rsp + 0xb4]
008d5 0f83d90d0000                   jae        0x7fc00be5c3b4
008db 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
008e3 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
008ea 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
008f2 443b9424b4000000               cmp        r10d, dword ptr [rsp + 0xb4]
008fa 0f822bfbffff                   jb         0x7fc00be5b12b
00900 bee4ffffff                     mov        esi, 0xffffffe4
00905 488b2c24                       mov        rbp, qword ptr [rsp]
00909 48894424f8                     mov        qword ptr [rsp - 8], rax
0090e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00912 89442408                       mov        dword ptr [rsp + 8], eax
00916 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0091b 48ff742420                     push       qword ptr [rsp + 0x20]
00920 488f442418                     pop        qword ptr [rsp + 0x18]
00925 48894424f8                     mov        qword ptr [rsp - 8], rax
0092a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0092e 8944240c                       mov        dword ptr [rsp + 0xc], eax
00932 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00937 48894424f8                     mov        qword ptr [rsp - 8], rax
0093c 8b442468                       mov        eax, dword ptr [rsp + 0x68]
00940 89442438                       mov        dword ptr [rsp + 0x38], eax
00944 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00949 48894424f8                     mov        qword ptr [rsp - 8], rax
0094e 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
00952 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00956 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0095b 48ffb42480000000               push       qword ptr [rsp + 0x80]
00963 488f442450                     pop        qword ptr [rsp + 0x50]
00968 48894424f8                     mov        qword ptr [rsp - 8], rax
0096d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00971 89442458                       mov        dword ptr [rsp + 0x58], eax
00975 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0097a 48894424f8                     mov        qword ptr [rsp - 8], rax
0097f 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
00986 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0098a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098f 48894424f8                     mov        qword ptr [rsp - 8], rax
00994 8b442470                       mov        eax, dword ptr [rsp + 0x70]
00998 89442460                       mov        dword ptr [rsp + 0x60], eax
0099c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
009a1 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
009aa 6690                           nop        
009ac c5f877                         vzeroupper 
009af e8ac7fb6ff                     call       0x7fc00b9c3660
009b4 0f1f8400ac0a0002               nop        dword ptr [rax + rax + 0x2000aac]
009bc 413bc0                         cmp        eax, r8d
009bf 0f8edcfdffff                   jle        0x7fc00be5b4a1
009c5 be45ffffff                     mov        esi, 0xffffff45
009ca 8be8                           mov        ebp, eax
009cc 44890424                       mov        dword ptr [rsp], r8d
009d0 c5f877                         vzeroupper 
009d3 e8887fb6ff                     call       0x7fc00b9c3660
009d8 0f1f8400d00a0003               nop        dword ptr [rax + rax + 0x3000ad0]
009e0 85c0                           test       eax, eax
009e2 7407                           je         0x7fc00be5b6eb
009e4 448d51ff                       lea        r10d, [rcx - 1]
009e8 418bca                         mov        ecx, r10d
009eb 85c9                           test       ecx, ecx
009ed 7475                           je         0x7fc00be5b764
009ef 83f903                         cmp        ecx, 3
009f2 0f84d4150000                   je         0x7fc00be5cccc
009f8 83f902                         cmp        ecx, 2
009fb 0f8777160000                   ja         0x7fc00be5cd78
00a01 3b4c240c                       cmp        ecx, dword ptr [rsp + 0xc]
00a05 0f8355140000                   jae        0x7fc00be5cb60
00a0b 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
00a13 458b5c8b08                     mov        r11d, dword ptr [r11 + rcx*4 + 8]
00a18 85c9                           test       ecx, ecx
00a1a 7e3a                           jle        0x7fc00be5b756
00a1c 448d51ff                       lea        r10d, [rcx - 1]
00a20 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00a25 0f83f1140000                   jae        0x7fc00be5cc1c
00a2b 0f1f440000                     nop        dword ptr [rax + rax]
00a30 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00a38 458b548804                     mov        r10d, dword ptr [r8 + rcx*4 + 4]
00a3d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00a45 4589548908                     mov        dword ptr [r9 + rcx*4 + 8], r10d
00a4a 448d51ff                       lea        r10d, [rcx - 1]
00a4e 418bca                         mov        ecx, r10d
00a51 4585d2                         test       r10d, r10d
00a54 7fda                           jg         0x7fc00be5b730
00a56 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a5e 45895a08                       mov        dword ptr [r10 + 8], r11d
00a62 eb0c                           jmp        0x7fc00be5b770
00a64 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00a6c 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00a70 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00a78 e961fdffff                     jmp        0x7fc00be5b4de
00a7d 4183fa10                       cmp        r10d, 0x10
00a81 0f8d911a0000                   jge        0x7fc00be5d218
00a87 4183fa08                       cmp        r10d, 8
00a8b 0f8dbb060000                   jge        0x7fc00be5be4c
00a91 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00a99 4183fa10                       cmp        r10d, 0x10
00a9d 0f8eba000000                   jle        0x7fc00be5b85d
00aa3 85c9                           test       ecx, ecx
00aa5 0f8cad190000                   jl         0x7fc00be5d158
00aab 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00ab3 4585db                         test       r11d, r11d
00ab6 0f8c9c190000                   jl         0x7fc00be5d158
00abc 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00ac1 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
00ac9 0f8289190000                   jb         0x7fc00be5d158
00acf 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00ad7 44039c24c4000000               add        r11d, dword ptr [rsp + 0xc4]
00adf 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00ae7 453bd3                         cmp        r10d, r11d
00aea 0f8268190000                   jb         0x7fc00be5d158
00af0 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00af8 4585db                         test       r11d, r11d
00afb 0f8c57190000                   jl         0x7fc00be5d158
00b01 4585db                         test       r11d, r11d
00b04 0f8446f8ffff                   je         0x7fc00be5b050
00b0a 4883fd20                       cmp        rbp, 0x20
00b0e 772d                           ja         0x7fc00be5b83d
00b10 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b18 4d63d2                         movsxd     r10, r10d
00b1b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b22 c442a8f5db                     bzhi       r11, r11, r10
00b27 c4c1fb92fb                     kmovq      k7, r11
00b2c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b32 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b38 e913f8ffff                     jmp        0x7fc00be5b050
00b3d 488bd5                         mov        rdx, rbp
00b40 c5f877                         vzeroupper 
00b43 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
00b4d 41ffd2                         call       r10
00b50 0f1f840000000000               nop        dword ptr [rax + rax]
00b58 e9f3f7ffff                     jmp        0x7fc00be5b050
00b5d 3b4c2418                       cmp        ecx, dword ptr [rsp + 0x18]
00b61 0f83bd150000                   jae        0x7fc00be5ce24
00b67 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00b6f 410fbe6c0a08                   movsx      ebp, byte ptr [r10 + rcx + 8]
00b75 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
00b7d 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00b82 0f8360160000                   jae        0x7fc00be5cee8
00b88 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00b8d 448d5103                       lea        r10d, [rcx + 3]
00b91 448b8424c4000000               mov        r8d, dword ptr [rsp + 0xc4]
00b99 41ffc0                         inc        r8d
00b9c 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
00ba4 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00ba9 0f83d9160000                   jae        0x7fc00be5cf88
00baf 4c63c1                         movsxd     r8, ecx
00bb2 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00bba 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00bc0 4183c303                       add        r11d, 3
00bc4 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00bc9 0f835d170000                   jae        0x7fc00be5d02c
00bcf 4c638c24c4000000               movsxd     r9, dword ptr [rsp + 0xc4]
00bd7 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
00bdc 470fbe54020a                   movsx      r10d, byte ptr [r10 + r8 + 0xa]
00be2 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00bea 4788540b0a                     mov        byte ptr [r11 + r9 + 0xa], r10b
00bef 470fbe5c030b                   movsx      r11d, byte ptr [r11 + r8 + 0xb]
00bf5 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00bfd 47885c0a0b                     mov        byte ptr [r10 + r9 + 0xb], r11b
00c02 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00c0a 4183fa08                       cmp        r10d, 8
00c0e 0f83a4170000                   jae        0x7fc00be5d0b8
00c14 448bd9                         mov        r11d, ecx
00c17 49baf83727e300000000           movabs     r10, 0xe32737f8
00c21 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00c29 47035c8208                     add        r11d, dword ptr [r10 + r8*4 + 8]
00c2e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00c33 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00c3b 4183fb04                       cmp        r11d, 4
00c3f 7e43                           jle        0x7fc00be5b984
00c41 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00c48 83c504                         add        ebp, 4
00c4b 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c53 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00c57 90                             nop        
00c58 c5f877                         vzeroupper 
00c5b e800ffa9ff                     call       0x7fc00b8fb860
00c60 0f1f8400580d0004               nop        dword ptr [rax + rax + 0x4000d58]
00c68 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00c70 8bd5                           mov        edx, ebp
00c72 8bc8                           mov        ecx, eax
00c74 c5f877                         vzeroupper 
00c77 e8e4fea9ff                     call       0x7fc00b8fb860
00c7c 0f1f8400740d0005               nop        dword ptr [rax + rax + 0x5000d74]
00c84 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00c8c 4183fa08                       cmp        r10d, 8
00c90 7e62                           jle        0x7fc00be5b9f4
00c92 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00c96 49ba203827e300000000           movabs     r10, 0xe3273820
00ca0 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00ca8 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00cad 8bac24c4000000                 mov        ebp, dword ptr [rsp + 0xc4]
00cb4 83c508                         add        ebp, 8
00cb7 83c208                         add        edx, 8
00cba 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cc2 6690                           nop        
00cc4 c5f877                         vzeroupper 
00cc7 e894fea9ff                     call       0x7fc00b8fb860
00ccc 0f1f8400c40d0006               nop        dword ptr [rax + rax + 0x6000dc4]
00cd4 488bb424d8000000               mov        rsi, qword ptr [rsp + 0xd8]
00cdc 8bd5                           mov        edx, ebp
00cde 488bc8                         mov        rcx, rax
00ce1 666690                         nop        
00ce4 c5f877                         vzeroupper 
00ce7 e874fea9ff                     call       0x7fc00b8fb860
00cec 0f1f8400e40d0007               nop        dword ptr [rax + rax + 0x7000de4]
00cf4 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
00cfb e9f9f9ffff                     jmp        0x7fc00be5b3f9
00d00 4d63d0                         movsxd     r10, r8d
00d03 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d0a c442a8f5db                     bzhi       r11, r11, r10
00d0f c4c1fb92fb                     kmovq      k7, r11
00d14 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d1a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d20 eb67                           jmp        0x7fc00be5ba89
00d22 4585f6                         test       r14d, r14d
00d25 0f8ce1180000                   jl         0x7fc00be5d30c
00d2b 85db                           test       ebx, ebx
00d2d 0f8cd9180000                   jl         0x7fc00be5d30c
00d33 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00d38 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00d3d 0f82c9180000                   jb         0x7fc00be5d30c
00d43 428d2c03                       lea        ebp, [rbx + r8]
00d47 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00d4c 443bd5                         cmp        r10d, ebp
00d4f 0f82b7180000                   jb         0x7fc00be5d30c
00d55 4585c0                         test       r8d, r8d
00d58 0f8cae180000                   jl         0x7fc00be5d30c
00d5e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d63 453bde                         cmp        r11d, r14d
00d66 7421                           je         0x7fc00be5ba89
00d68 4963d0                         movsxd     rdx, r8d
00d6b 4883fa20                       cmp        rdx, 0x20
00d6f 768f                           jbe        0x7fc00be5ba00
00d71 c5f877                         vzeroupper 
00d74 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
00d7e 41ffd2                         call       r10
00d81 0f1f840000000000               nop        dword ptr [rax + rax]
00d89 4c8b1424                       mov        r10, qword ptr [rsp]
00d8d 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00d91 c5f877                         vzeroupper 
00d94 4881c4f0000000                 add        rsp, 0xf0
00d9b 5d                             pop        rbp
00d9c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00da0 0f87ea1e0000                   ja         0x7fc00be5d990
00da6 c3                             ret        
00da7 83f830                         cmp        eax, 0x30
00daa 0f8e83000000                   jle        0x7fc00be5bb33
00db0 4585f6                         test       r14d, r14d
00db3 0f8cb31c0000                   jl         0x7fc00be5d76c
00db9 85db                           test       ebx, ebx
00dbb 0f8cab1c0000                   jl         0x7fc00be5d76c
00dc1 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00dc6 443b9c24c0000000               cmp        r11d, dword ptr [rsp + 0xc0]
00dce 0f82981c0000                   jb         0x7fc00be5d76c
00dd4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00dd9 453bd5                         cmp        r10d, r13d
00ddc 0f828a1c0000                   jb         0x7fc00be5d76c
00de2 85c0                           test       eax, eax
00de4 7426                           je         0x7fc00be5bb0c
00de6 4883fa20                       cmp        rdx, 0x20
00dea 772d                           ja         0x7fc00be5bb19
00dec 4c63d0                         movsxd     r10, eax
00def 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00df6 c442a8f5db                     bzhi       r11, r11, r10
00dfb c4c1fb92fb                     kmovq      k7, r11
00e00 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e06 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e0c 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
00e14 e983faffff                     jmp        0x7fc00be5b59c
00e19 c5f877                         vzeroupper 
00e1c 49ba204f8e0bc07f0000           movabs     r10, 0x7fc00b8e4f20
00e26 41ffd2                         call       r10
00e29 0f1f840000000000               nop        dword ptr [rax + rax]
00e31 ebd9                           jmp        0x7fc00be5bb0c
00e33 443bb4248c000000               cmp        r14d, dword ptr [rsp + 0x8c]
00e3b 0f83a71a0000                   jae        0x7fc00be5d5e8
00e41 4d63c6                         movsxd     r8, r14d
00e44 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e4c c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00e53 3b9c24b4000000                 cmp        ebx, dword ptr [rsp + 0xb4]
00e5a 0f83481b0000                   jae        0x7fc00be5d6a8
00e60 448d5310                       lea        r10d, [rbx + 0x10]
00e64 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00e6c 4c63db                         movsxd     r11, ebx
00e6f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00e77 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00e7e 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00e86 453bd5                         cmp        r10d, r13d
00e89 0f8da6020000                   jge        0x7fc00be5be35
00e8f 4d2bc3                         sub        r8, r11
00e92 4d63d2                         movsxd     r10, r10d
00e95 4c634c241c                     movsxd     r9, dword ptr [rsp + 0x1c]
00e9a 4983c1f1                       add        r9, -0xf
00e9e 4f8d1c02                       lea        r11, [r10 + r8]
00ea2 4d3bd9                         cmp        r11, r9
00ea5 0f838d1c0000                   jae        0x7fc00be5d838
00eab 4963cd                         movsxd     rcx, r13d
00eae 4c8bd9                         mov        r11, rcx
00eb1 4d2bda                         sub        r11, r10
00eb4 4983c30f                       add        r11, 0xf
00eb8 4983e3f0                       and        r11, 0xfffffffffffffff0
00ebc 458bdb                         mov        r11d, r11d
00ebf 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00ec4 4d63d2                         movsxd     r10, r10d
00ec7 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
00ecc 4d3bd9                         cmp        r11, r9
00ecf 0f83631c0000                   jae        0x7fc00be5d838
00ed5 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00edd 443b9c24b4000000               cmp        r11d, dword ptr [rsp + 0xb4]
00ee5 0f834d1c0000                   jae        0x7fc00be5d838
00eeb 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00ef0 4983c3f1                       add        r11, -0xf
00ef4 4983c2f0                       add        r10, -0x10
00ef8 4d3bd3                         cmp        r10, r11
00efb 0f83371c0000                   jae        0x7fc00be5d838
00f01 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00f08 0f8fba1c0000                   jg         0x7fc00be5d8c8
00f0e 458bce                         mov        r9d, r14d
00f11 442bcb                         sub        r9d, ebx
00f14 83c320                         add        ebx, 0x20
00f17 90                             nop        
00f18 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f20 458bc1                         mov        r8d, r9d
00f23 44038424c0000000               add        r8d, dword ptr [rsp + 0xc0]
00f2b 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00f33 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00f3a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00f42 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00f49 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00f51 4183c310                       add        r11d, 0x10
00f55 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00f5d 443bdb                         cmp        r11d, ebx
00f60 7cb6                           jl         0x7fc00be5bc18
00f62 4881c110ffffff                 add        rcx, -0xf0
00f69 4881f900000080                 cmp        rcx, -0x80000000
00f70 49c7c200000080                 mov        r10, 0xffffffff80000000
00f77 490f4cca                       cmovl      rcx, r10
00f7b 8bc9                           mov        ecx, ecx
00f7d 443bd9                         cmp        r11d, ecx
00f80 0f8d6c010000                   jge        0x7fc00be5bdf2
00f86 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00f8e 6690                           nop        
00f90 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00f98 4d63d2                         movsxd     r10, r10d
00f9b 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00fa3 418bd9                         mov        ebx, r9d
00fa6 039c24c0000000                 add        ebx, dword ptr [rsp + 0xc0]
00fad 448bc3                         mov        r8d, ebx
00fb0 488bbc2498000000               mov        rdi, qword ptr [rsp + 0x98]
00fb8 c5fa6f441f08                   vmovdqu    xmm0, xmmword ptr [rdi + rbx + 8]
00fbe 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
00fc6 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
00fcd 4d63c0                         movsxd     r8, r8d
00fd0 c4a17a6f440718                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x18]
00fd7 c4a17a7f441318                 vmovdqu    xmmword ptr [rbx + r10 + 0x18], xmm0
00fde c4a17a6f440728                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x28]
00fe5 c4a17a7f441328                 vmovdqu    xmmword ptr [rbx + r10 + 0x28], xmm0
00fec c4a17a6f440738                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x38]
00ff3 c4a17a7f441338                 vmovdqu    xmmword ptr [rbx + r10 + 0x38], xmm0
00ffa c4a17a6f440748                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x48]
01001 c4a17a7f441348                 vmovdqu    xmmword ptr [rbx + r10 + 0x48], xmm0
01008 c4a17a6f440758                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x58]
0100f c4a17a7f441358                 vmovdqu    xmmword ptr [rbx + r10 + 0x58], xmm0
01016 c4a17a6f440768                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x68]
0101d c4a17a7f441368                 vmovdqu    xmmword ptr [rbx + r10 + 0x68], xmm0
01024 c4a17a6f440778                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x78]
0102b c4a17a7f441378                 vmovdqu    xmmword ptr [rbx + r10 + 0x78], xmm0
01032 c4a17a6f840788000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x88]
0103c c4a17a7f841388000000           vmovdqu    xmmword ptr [rbx + r10 + 0x88], xmm0
01046 c4a17a6f840798000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0x98]
01050 c4a17a7f841398000000           vmovdqu    xmmword ptr [rbx + r10 + 0x98], xmm0
0105a c4a17a6f8407a8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xa8]
01064 c4a17a7f8413a8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xa8], xmm0
0106e c4a17a6f8407b8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xb8]
01078 c4a17a7f8413b8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xb8], xmm0
01082 c4a17a6f8407c8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xc8]
0108c c4a17a7f8413c8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xc8], xmm0
01096 c4a17a6f8407d8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xd8]
010a0 c4a17a7f8413d8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xd8], xmm0
010aa c4a17a6f8407e8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xe8]
010b4 c4a17a7f8413e8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xe8], xmm0
010be c4a17a6f8407f8000000           vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xf8]
010c8 c4a17a7f8413f8000000           vmovdqu    xmmword ptr [rbx + r10 + 0xf8], xmm0
010d2 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
010da 4181c200010000                 add        r10d, 0x100
010e1 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
010e9 443bd1                         cmp        r10d, ecx
010ec 0f8c9efeffff                   jl         0x7fc00be5bc90
010f2 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
010fa 453bdd                         cmp        r11d, r13d
010fd 7d36                           jge        0x7fc00be5be35
010ff 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01106 6690                           nop        
01108 458d1c09                       lea        r11d, [r9 + rcx]
0110c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01114 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
0111b 448bd1                         mov        r10d, ecx
0111e 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01126 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
0112d 83c110                         add        ecx, 0x10
01130 413bcd                         cmp        ecx, r13d
01133 7cd3                           jl         0x7fc00be5be08
01135 4103c6                         add        eax, r14d
01138 898424c0000000                 mov        dword ptr [rsp + 0xc0], eax
0113f 4489ac24c4000000               mov        dword ptr [rsp + 0xc4], r13d
01147 e950f7ffff                     jmp        0x7fc00be5b59c
0114c 3b8c24b0000000                 cmp        ecx, dword ptr [rsp + 0xb0]
01153 0f83db140000                   jae        0x7fc00be5d334
01159 4863f9                         movsxd     rdi, ecx
0115c 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01164 4d8b543a08                     mov        r10, qword ptr [r10 + rdi + 8]
01169 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01171 448b9c24c4000000               mov        r11d, dword ptr [rsp + 0xc4]
01179 443b9c24b0000000               cmp        r11d, dword ptr [rsp + 0xb0]
01181 0f835d150000                   jae        0x7fc00be5d3e4
01187 448b9424c4000000               mov        r10d, dword ptr [rsp + 0xc4]
0118f 418d6a08                       lea        ebp, [r10 + 8]
01193 4d63da                         movsxd     r11, r10d
01196 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
0119e 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
011a6 4b895c1808                     mov        qword ptr [r8 + r11 + 8], rbx
011ab 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
011b2 0f8dfd020000                   jge        0x7fc00be5c1b5
011b8 492bfb                         sub        rdi, r11
011bb 4863dd                         movsxd     rbx, ebp
011be 4c8d1c3b                       lea        r11, [rbx + rdi]
011c2 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
011c7 0f83b7150000                   jae        0x7fc00be5d484
011cd 4d8bd9                         mov        r11, r9
011d0 4c2bdb                         sub        r11, rbx
011d3 4983c307                       add        r11, 7
011d7 4983e3f8                       and        r11, 0xfffffffffffffff8
011db 458bdb                         mov        r11d, r11d
011de 478d441308                     lea        r8d, [r11 + r10 + 8]
011e3 4d63d8                         movsxd     r11, r8d
011e6 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
011eb 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
011f0 0f838e150000                   jae        0x7fc00be5d484
011f6 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
011fd 0f8381150000                   jae        0x7fc00be5d484
01203 4983c3f8                       add        r11, -8
01207 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0120c 0f8372150000                   jae        0x7fc00be5d484
01212 baf8ffffff                     mov        edx, 0xfffffff8
01217 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0121f 498bfb                         mov        rdi, r11
01222 458bdb                         mov        r11d, r11d
01225 412bd3                         sub        edx, r11d
01228 412bd2                         sub        edx, r10d
0122b 83c2f0                         add        edx, -0x10
0122e 458d5a10                       lea        r11d, [r10 + 0x10]
01232 4d63db                         movsxd     r11, r11d
01235 41b806000000                   mov        r8d, 6
0123b c462b8f5c2                     bzhi       r8, rdx, r8
01240 4d03d8                         add        r11, r8
01243 4d3bd9                         cmp        r11, r9
01246 498bd1                         mov        rdx, r9
01249 490f4cd3                       cmovl      rdx, r11
0124d 4c8bda                         mov        r11, rdx
01250 4c2bdb                         sub        r11, rbx
01253 4d8d43ff                       lea        r8, [r11 - 1]
01257 49c1f83f                       sar        r8, 0x3f
0125b 49c1e83d                       shr        r8, 0x3d
0125f 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
01264 4983e3f8                       and        r11, 0xfffffffffffffff8
01268 4c03db                         add        r11, rbx
0126b 493bdb                         cmp        rbx, r11
0126e 490f4cdb                       cmovl      rbx, r11
01272 448bdb                         mov        r11d, ebx
01275 418d5b08                       lea        ebx, [r11 + 8]
01279 442b9c24bc000000               sub        r11d, dword ptr [rsp + 0xbc]
01281 4c63c3                         movsxd     r8, ebx
01284 4c03c7                         add        r8, rdi
01287 4183c308                       add        r11d, 8
0128b 4963db                         movsxd     rbx, r11d
0128e 4803df                         add        rbx, rdi
01291 498d7848                       lea        rdi, [r8 + 0x48]
01295 4983c008                       add        r8, 8
01299 488d7308                       lea        rsi, [rbx + 8]
0129d 4533db                         xor        r11d, r11d
012a0 483bfe                         cmp        rdi, rsi
012a3 410f96c3                       setbe      r11b
012a7 4883c348                       add        rbx, 0x48
012ab 33f6                           xor        esi, esi
012ad 493bd8                         cmp        rbx, r8
012b0 400f96c6                       setbe      sil
012b4 440bde                         or         r11d, esi
012b7 0f8443150000                   je         0x7fc00be5d500
012bd 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
012c5 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
012cc 0f8faa150000                   jg         0x7fc00be5d57c
012d2 412bca                         sub        ecx, r10d
012d5 448bd2                         mov        r10d, edx
012d8 448d1c29                       lea        r11d, [rcx + rbp]
012dc 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
012e4 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
012e9 448bc5                         mov        r8d, ebp
012ec 488b9c24d8000000               mov        rbx, qword ptr [rsp + 0xd8]
012f4 4e895c0308                     mov        qword ptr [rbx + r8 + 8], r11
012f9 83c508                         add        ebp, 8
012fc 413bea                         cmp        ebp, r10d
012ff 7cd7                           jl         0x7fc00be5bfd8
01301 4d8d9108feffff                 lea        r10, [r9 - 0x1f8]
01308 4981fa00000080                 cmp        r10, -0x80000000
0130f 49c7c300000080                 mov        r11, 0xffffffff80000000
01316 4d0f4cd3                       cmovl      r10, r11
0131a 418bfa                         mov        edi, r10d
0131d 3bef                           cmp        ebp, edi
0131f 0f8d58010000                   jge        0x7fc00be5c17d
01325 6666660f1f840000000000         nop        word ptr [rax + rax]
01330 448d9500010000                 lea        r10d, [rbp + 0x100]
01337 4403d1                         add        r10d, ecx
0133a 448d8580000000                 lea        r8d, [rbp + 0x80]
01341 4403c1                         add        r8d, ecx
01344 418bf2                         mov        esi, r10d
01347 4d63ea                         movsxd     r13, r10d
0134a 418bd0                         mov        edx, r8d
0134d 4d63c0                         movsxd     r8, r8d
01350 8bdd                           mov        ebx, ebp
01352 8d0429                         lea        eax, [rcx + rbp]
01355 448bdd                         mov        r11d, ebp
01358 4d63f3                         movsxd     r14, r11d
0135b 448bd0                         mov        r10d, eax
0135e 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01366 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
01371 62d17e487f841b08000000         vmovdqu32  zmmword ptr [r11 + rbx + 8], zmm0
0137c 4c63d8                         movsxd     r11, eax
0137f 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01387 62917e486f841a48000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x48]
01392 62917e487f843248000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x48], zmm0
0139d 62d17e486f841208000000         vmovdqu32  zmm0, zmmword ptr [r10 + rdx + 8]
013a8 62917e487f843288000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x88], zmm0
013b3 62917e486f840248000000         vmovdqu32  zmm0, zmmword ptr [r10 + r8 + 0x48]
013be 62917e487f8432c8000000         vmovdqu32  zmmword ptr [r10 + r14 + 0xc8], zmm0
013c9 62d17e486f843208000000         vmovdqu32  zmm0, zmmword ptr [r10 + rsi + 8]
013d4 62917e487f843208010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x108], zmm0
013df 62917e486f842a48000000         vmovdqu32  zmm0, zmmword ptr [r10 + r13 + 0x48]
013ea 62917e487f843248010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x148], zmm0
013f5 62917e486f841a88010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x188]
01400 62917e487f843288010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x188], zmm0
0140b 62917e486f841ac8010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x1c8]
01416 62917e487f8432c8010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x1c8], zmm0
01421 81c500020000                   add        ebp, 0x200
01427 3bef                           cmp        ebp, edi
01429 0f8c01ffffff                   jl         0x7fc00be5c030
0142f 4983c1c8                       add        r9, -0x38
01433 4981f900000080                 cmp        r9, -0x80000000
0143a 49c7c200000080                 mov        r10, 0xffffffff80000000
01441 4d0f4cca                       cmovl      r9, r10
01445 458bd9                         mov        r11d, r9d
01448 413beb                         cmp        ebp, r11d
0144b 7d30                           jge        0x7fc00be5c17d
0144d 666690                         nop        
01450 448d0429                       lea        r8d, [rcx + rbp]
01454 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0145c 62917e486f840208000000         vmovdqu32  zmm0, zmmword ptr [r10 + r8 + 8]
01467 448bc5                         mov        r8d, ebp
0146a 62917e487f840208000000         vmovdqu32  zmmword ptr [r10 + r8 + 8], zmm0
01475 83c540                         add        ebp, 0x40
01478 413beb                         cmp        ebp, r11d
0147b 7cd3                           jl         0x7fc00be5c150
0147d 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
01484 7d2f                           jge        0x7fc00be5c1b5
01486 6690                           nop        
01488 448d1c29                       lea        r11d, [rcx + rbp]
0148c 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01494 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01499 448bc5                         mov        r8d, ebp
0149c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
014a4 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
014a9 83c508                         add        ebp, 8
014ac 3bac24c8000000                 cmp        ebp, dword ptr [rsp + 0xc8]
014b3 7cd3                           jl         0x7fc00be5c188
014b5 8b9c24c8000000                 mov        ebx, dword ptr [rsp + 0xc8]
014bc e938f2ffff                     jmp        0x7fc00be5b3f9
014c1 bee4ffffff                     mov        esi, 0xffffffe4
014c6 488b2c24                       mov        rbp, qword ptr [rsp]
014ca 48894424f8                     mov        qword ptr [rsp - 8], rax
014cf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014d3 89442408                       mov        dword ptr [rsp + 8], eax
014d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014dc 48ff742420                     push       qword ptr [rsp + 0x20]
014e1 488f442418                     pop        qword ptr [rsp + 0x18]
014e6 48894424f8                     mov        qword ptr [rsp - 8], rax
014eb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014ef 8944240c                       mov        dword ptr [rsp + 0xc], eax
014f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f8 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014fc 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01501 48894424f8                     mov        qword ptr [rsp - 8], rax
01506 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0150a 89442438                       mov        dword ptr [rsp + 0x38], eax
0150e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01513 48894424f8                     mov        qword ptr [rsp - 8], rax
01518 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0151c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01520 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01525 666690                         nop        
01528 c5f877                         vzeroupper 
0152b e83074b6ff                     call       0x7fc00b9c3660
01530 0f1f840028160008               nop        dword ptr [rax + rax + 0x8001628]
01538 bee4ffffff                     mov        esi, 0xffffffe4
0153d 488b2c24                       mov        rbp, qword ptr [rsp]
01541 48894424f8                     mov        qword ptr [rsp - 8], rax
01546 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0154a 89442408                       mov        dword ptr [rsp + 8], eax
0154e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01553 48ff742420                     push       qword ptr [rsp + 0x20]
01558 488f442418                     pop        qword ptr [rsp + 0x18]
0155d 48894424f8                     mov        qword ptr [rsp - 8], rax
01562 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01566 8944240c                       mov        dword ptr [rsp + 0xc], eax
0156a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01573 48894424f8                     mov        qword ptr [rsp - 8], rax
01578 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0157c 89442438                       mov        dword ptr [rsp + 0x38], eax
01580 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01585 48ff742478                     push       qword ptr [rsp + 0x78]
0158a 488f442440                     pop        qword ptr [rsp + 0x40]
0158f 48894424f8                     mov        qword ptr [rsp - 8], rax
01594 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01598 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0159c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a1 48894424f8                     mov        qword ptr [rsp - 8], rax
015a6 8b442474                       mov        eax, dword ptr [rsp + 0x74]
015aa 89442458                       mov        dword ptr [rsp + 0x58], eax
015ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b3 48894424f8                     mov        qword ptr [rsp - 8], rax
015b8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
015bc 89442460                       mov        dword ptr [rsp + 0x60], eax
015c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c5 89442464                       mov        dword ptr [rsp + 0x64], eax
015c9 4489742478                     mov        dword ptr [rsp + 0x78], r14d
015ce 6690                           nop        
015d0 c5f877                         vzeroupper 
015d3 e88873b6ff                     call       0x7fc00b9c3660
015d8 0f1f8400d0160009               nop        dword ptr [rax + rax + 0x90016d0]
015e0 bee4ffffff                     mov        esi, 0xffffffe4
015e5 488b2c24                       mov        rbp, qword ptr [rsp]
015e9 48894424f8                     mov        qword ptr [rsp - 8], rax
015ee 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015f2 89442408                       mov        dword ptr [rsp + 8], eax
015f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fb 48ff742420                     push       qword ptr [rsp + 0x20]
01600 488f442418                     pop        qword ptr [rsp + 0x18]
01605 48894424f8                     mov        qword ptr [rsp - 8], rax
0160a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0160e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01612 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01617 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0161c 48894424f8                     mov        qword ptr [rsp - 8], rax
01621 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01625 89442438                       mov        dword ptr [rsp + 0x38], eax
01629 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162e 48ff742478                     push       qword ptr [rsp + 0x78]
01633 488f442440                     pop        qword ptr [rsp + 0x40]
01638 48894424f8                     mov        qword ptr [rsp - 8], rax
0163d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01641 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01645 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0164a 48ffb42480000000               push       qword ptr [rsp + 0x80]
01652 488f442450                     pop        qword ptr [rsp + 0x50]
01657 48894424f8                     mov        qword ptr [rsp - 8], rax
0165c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01660 89442458                       mov        dword ptr [rsp + 0x58], eax
01664 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01669 48894424f8                     mov        qword ptr [rsp - 8], rax
0166e 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01675 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01679 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167e 48894424f8                     mov        qword ptr [rsp - 8], rax
01683 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01687 89442460                       mov        dword ptr [rsp + 0x60], eax
0168b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01690 89442464                       mov        dword ptr [rsp + 0x64], eax
01694 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01698 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016a1 666690                         nop        
016a4 c5f877                         vzeroupper 
016a7 e8b472b6ff                     call       0x7fc00b9c3660
016ac 0f1f8400a417000a               nop        dword ptr [rax + rax + 0xa0017a4]
016b4 bee4ffffff                     mov        esi, 0xffffffe4
016b9 488b2c24                       mov        rbp, qword ptr [rsp]
016bd 48894424f8                     mov        qword ptr [rsp - 8], rax
016c2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016c6 89442408                       mov        dword ptr [rsp + 8], eax
016ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016cf 48ff742420                     push       qword ptr [rsp + 0x20]
016d4 488f442418                     pop        qword ptr [rsp + 0x18]
016d9 48894424f8                     mov        qword ptr [rsp - 8], rax
016de 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016e2 8944240c                       mov        dword ptr [rsp + 0xc], eax
016e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016eb 48894424f8                     mov        qword ptr [rsp - 8], rax
016f0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
016f4 89442438                       mov        dword ptr [rsp + 0x38], eax
016f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016fd 48894424f8                     mov        qword ptr [rsp - 8], rax
01702 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01706 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0170a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170f 48894424f8                     mov        qword ptr [rsp - 8], rax
01714 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01718 89442458                       mov        dword ptr [rsp + 0x58], eax
0171c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01721 48894424f8                     mov        qword ptr [rsp - 8], rax
01726 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0172a 89442460                       mov        dword ptr [rsp + 0x60], eax
0172e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01733 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01737 90                             nop        
01738 c5f877                         vzeroupper 
0173b e82072b6ff                     call       0x7fc00b9c3660
01740 0f1f84003818000b               nop        dword ptr [rax + rax + 0xb001838]
01748 be45ffffff                     mov        esi, 0xffffff45
0174d 488b2c24                       mov        rbp, qword ptr [rsp]
01751 4c89542408                     mov        qword ptr [rsp + 8], r10
01756 6690                           nop        
01758 c5f877                         vzeroupper 
0175b e80072b6ff                     call       0x7fc00b9c3660
01760 0f1f84005818000c               nop        dword ptr [rax + rax + 0xc001858]
01768 be45ffffff                     mov        esi, 0xffffff45
0176d 488b2c24                       mov        rbp, qword ptr [rsp]
01771 48894424f8                     mov        qword ptr [rsp - 8], rax
01776 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0177a 89442408                       mov        dword ptr [rsp + 8], eax
0177e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01783 48ff742420                     push       qword ptr [rsp + 0x20]
01788 488f442418                     pop        qword ptr [rsp + 0x18]
0178d 48894424f8                     mov        qword ptr [rsp - 8], rax
01792 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01796 8944240c                       mov        dword ptr [rsp + 0xc], eax
0179a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017a3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
017a8 48894424f8                     mov        qword ptr [rsp - 8], rax
017ad 8b442468                       mov        eax, dword ptr [rsp + 0x68]
017b1 89442438                       mov        dword ptr [rsp + 0x38], eax
017b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ba 48894424f8                     mov        qword ptr [rsp - 8], rax
017bf 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
017c3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
017c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017cc 89442464                       mov        dword ptr [rsp + 0x64], eax
017d0 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
017d5 666690                         nop        
017d8 c5f877                         vzeroupper 
017db e88071b6ff                     call       0x7fc00b9c3660
017e0 0f1f8400d818000d               nop        dword ptr [rax + rax + 0xd0018d8]
017e8 493bea                         cmp        rbp, r10
017eb bdffffffff                     mov        ebp, 0xffffffff
017f0 7c08                           jl         0x7fc00be5c4fa
017f2 400f95c5                       setne      bpl
017f6 400fb6ed                       movzx      ebp, bpl
017fa be45ffffff                     mov        esi, 0xffffff45
017ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01804 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01808 89442414                       mov        dword ptr [rsp + 0x14], eax
0180c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01811 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01815 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
0181a 48894424f8                     mov        qword ptr [rsp - 8], rax
0181f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01823 89442440                       mov        dword ptr [rsp + 0x40], eax
01827 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182c 48ff742478                     push       qword ptr [rsp + 0x78]
01831 488f442448                     pop        qword ptr [rsp + 0x48]
01836 48894424f8                     mov        qword ptr [rsp - 8], rax
0183b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0183f 89442444                       mov        dword ptr [rsp + 0x44], eax
01843 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01848 48894424f8                     mov        qword ptr [rsp - 8], rax
0184d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01851 89442460                       mov        dword ptr [rsp + 0x60], eax
01855 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185a 48894424f8                     mov        qword ptr [rsp - 8], rax
0185f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01863 89442468                       mov        dword ptr [rsp + 0x68], eax
01867 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186c 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01870 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01875 666690                         nop        
01878 c5f877                         vzeroupper 
0187b e8e070b6ff                     call       0x7fc00b9c3660
01880 0f1f84007819000e               nop        dword ptr [rax + rax + 0xe001978]
01888 be45ffffff                     mov        esi, 0xffffff45
0188d 488b2c24                       mov        rbp, qword ptr [rsp]
01891 48894424f8                     mov        qword ptr [rsp - 8], rax
01896 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0189a 89442408                       mov        dword ptr [rsp + 8], eax
0189e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a3 48ff742420                     push       qword ptr [rsp + 0x20]
018a8 488f442418                     pop        qword ptr [rsp + 0x18]
018ad 48894424f8                     mov        qword ptr [rsp - 8], rax
018b2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018b6 8944240c                       mov        dword ptr [rsp + 0xc], eax
018ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018c3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
018c8 48894424f8                     mov        qword ptr [rsp - 8], rax
018cd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
018d1 89442438                       mov        dword ptr [rsp + 0x38], eax
018d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018da 48894424f8                     mov        qword ptr [rsp - 8], rax
018df 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
018e3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ec 48894424f8                     mov        qword ptr [rsp - 8], rax
018f1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018f5 89442460                       mov        dword ptr [rsp + 0x60], eax
018f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018fe 89442464                       mov        dword ptr [rsp + 0x64], eax
01902 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01907 90                             nop        
01908 c5f877                         vzeroupper 
0190b e85070b6ff                     call       0x7fc00b9c3660
01910 0f1f8400081a000f               nop        dword ptr [rax + rax + 0xf001a08]
01918 be45ffffff                     mov        esi, 0xffffff45
0191d 488b2c24                       mov        rbp, qword ptr [rsp]
01921 48894424f8                     mov        qword ptr [rsp - 8], rax
01926 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0192a 89442408                       mov        dword ptr [rsp + 8], eax
0192e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01933 48ff742420                     push       qword ptr [rsp + 0x20]
01938 488f442418                     pop        qword ptr [rsp + 0x18]
0193d 48894424f8                     mov        qword ptr [rsp - 8], rax
01942 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01946 8944240c                       mov        dword ptr [rsp + 0xc], eax
0194a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01953 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01958 48894424f8                     mov        qword ptr [rsp - 8], rax
0195d 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01961 89442438                       mov        dword ptr [rsp + 0x38], eax
01965 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196a 48894424f8                     mov        qword ptr [rsp - 8], rax
0196f 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01973 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01977 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197c 48894424f8                     mov        qword ptr [rsp - 8], rax
01981 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01985 89442458                       mov        dword ptr [rsp + 0x58], eax
01989 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198e 48894424f8                     mov        qword ptr [rsp - 8], rax
01993 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01997 89442460                       mov        dword ptr [rsp + 0x60], eax
0199b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a0 89442464                       mov        dword ptr [rsp + 0x64], eax
019a4 c5f877                         vzeroupper 
019a7 e8b46fb6ff                     call       0x7fc00b9c3660
019ac 0f1f8400a41a0010               nop        dword ptr [rax + rax + 0x10001aa4]
019b4 bee4ffffff                     mov        esi, 0xffffffe4
019b9 488b2c24                       mov        rbp, qword ptr [rsp]
019bd 48894424f8                     mov        qword ptr [rsp - 8], rax
019c2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019c6 89442408                       mov        dword ptr [rsp + 8], eax
019ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019cf 48ff742420                     push       qword ptr [rsp + 0x20]
019d4 488f442418                     pop        qword ptr [rsp + 0x18]
019d9 48894424f8                     mov        qword ptr [rsp - 8], rax
019de 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019e2 8944240c                       mov        dword ptr [rsp + 0xc], eax
019e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019eb 48894424f8                     mov        qword ptr [rsp - 8], rax
019f0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
019f4 89442438                       mov        dword ptr [rsp + 0x38], eax
019f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fd 48ff742478                     push       qword ptr [rsp + 0x78]
01a02 488f442440                     pop        qword ptr [rsp + 0x40]
01a07 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01a10 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a14 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a19 48ffb42480000000               push       qword ptr [rsp + 0x80]
01a21 488f442450                     pop        qword ptr [rsp + 0x50]
01a26 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a2f 89442458                       mov        dword ptr [rsp + 0x58], eax
01a33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a38 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01a44 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a52 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a56 89442460                       mov        dword ptr [rsp + 0x60], eax
01a5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5f 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
01a66 6690                           nop        
01a68 c5f877                         vzeroupper 
01a6b e8f06eb6ff                     call       0x7fc00b9c3660
01a70 0f1f8400681b0011               nop        dword ptr [rax + rax + 0x11001b68]
01a78 bee4ffffff                     mov        esi, 0xffffffe4
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
01aaf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ab8 89442438                       mov        dword ptr [rsp + 0x38], eax
01abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac1 48ff742478                     push       qword ptr [rsp + 0x78]
01ac6 488f442440                     pop        qword ptr [rsp + 0x40]
01acb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad0 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ad4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ad8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01add 48ffb42480000000               push       qword ptr [rsp + 0x80]
01ae5 488f442450                     pop        qword ptr [rsp + 0x50]
01aea 48894424f8                     mov        qword ptr [rsp - 8], rax
01aef 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01af3 89442458                       mov        dword ptr [rsp + 0x58], eax
01af7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afc 48894424f8                     mov        qword ptr [rsp - 8], rax
01b01 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01b08 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b0c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b11 48894424f8                     mov        qword ptr [rsp - 8], rax
01b16 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b1a 89442460                       mov        dword ptr [rsp + 0x60], eax
01b1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b23 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01b27 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01b2c c5f877                         vzeroupper 
01b2f e82c6eb6ff                     call       0x7fc00b9c3660
01b34 0f1f84002c1c0012               nop        dword ptr [rax + rax + 0x12001c2c]
01b3c 4533d2                         xor        r10d, r10d
01b3f 4c891424                       mov        qword ptr [rsp], r10
01b43 e9f9e5ffff                     jmp        0x7fc00be5ae41
01b48 4533d2                         xor        r10d, r10d
01b4b 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01b53 e913e6ffff                     jmp        0x7fc00be5ae6b
01b58 4533d2                         xor        r10d, r10d
01b5b 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01b63 e932e6ffff                     jmp        0x7fc00be5ae9a
01b68 4533d2                         xor        r10d, r10d
01b6b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b70 e94ce6ffff                     jmp        0x7fc00be5aec1
01b75 4533d2                         xor        r10d, r10d
01b78 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01b80 e96be6ffff                     jmp        0x7fc00be5aef0
01b85 4533d2                         xor        r10d, r10d
01b88 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01b90 e985e6ffff                     jmp        0x7fc00be5af1a
01b95 83c108                         add        ecx, 8
01b98 be6effffff                     mov        esi, 0xffffff6e
01b9d 488b2c24                       mov        rbp, qword ptr [rsp]
01ba1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01baa 89442408                       mov        dword ptr [rsp + 8], eax
01bae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb3 48ff742420                     push       qword ptr [rsp + 0x20]
01bb8 488f442418                     pop        qword ptr [rsp + 0x18]
01bbd 48894424f8                     mov        qword ptr [rsp - 8], rax
01bc2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01bc6 8944240c                       mov        dword ptr [rsp + 0xc], eax
01bca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bcf 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bd4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd9 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01bdd 89442438                       mov        dword ptr [rsp + 0x38], eax
01be1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be6 48ff742478                     push       qword ptr [rsp + 0x78]
01beb 488f442440                     pop        qword ptr [rsp + 0x40]
01bf0 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01bf9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01bfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c02 48894424f8                     mov        qword ptr [rsp - 8], rax
01c07 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01c0b 89442458                       mov        dword ptr [rsp + 0x58], eax
01c0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c14 48894424f8                     mov        qword ptr [rsp - 8], rax
01c19 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c1d 89442460                       mov        dword ptr [rsp + 0x60], eax
01c21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c26 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2b 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
01c32 89442468                       mov        dword ptr [rsp + 0x68], eax
01c36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3b 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01c3f 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01c44 c5f877                         vzeroupper 
01c47 e8146db6ff                     call       0x7fc00b9c3660
01c4c 0f1f8400441d0013               nop        dword ptr [rax + rax + 0x13001d44]
01c54 83c108                         add        ecx, 8
01c57 be66ffffff                     mov        esi, 0xffffff66
01c5c 488b2c24                       mov        rbp, qword ptr [rsp]
01c60 48894424f8                     mov        qword ptr [rsp - 8], rax
01c65 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c69 89442408                       mov        dword ptr [rsp + 8], eax
01c6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c72 48ff742420                     push       qword ptr [rsp + 0x20]
01c77 488f442418                     pop        qword ptr [rsp + 0x18]
01c7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c81 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c85 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8e 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c93 48894424f8                     mov        qword ptr [rsp - 8], rax
01c98 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01c9c 89442438                       mov        dword ptr [rsp + 0x38], eax
01ca0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca5 48ff742478                     push       qword ptr [rsp + 0x78]
01caa 488f442440                     pop        qword ptr [rsp + 0x40]
01caf 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01cb8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cbc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc1 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc6 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01cca 89442458                       mov        dword ptr [rsp + 0x58], eax
01cce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd3 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01cdc 89442460                       mov        dword ptr [rsp + 0x60], eax
01ce0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce5 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01ce9 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01cee 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01cf3 90                             nop        
01cf4 c5f877                         vzeroupper 
01cf7 e8646cb6ff                     call       0x7fc00b9c3660
01cfc 0f1f8400f41d0014               nop        dword ptr [rax + rax + 0x14001df4]
01d04 beccffffff                     mov        esi, 0xffffffcc
01d09 488b2c24                       mov        rbp, qword ptr [rsp]
01d0d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d12 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d16 89442408                       mov        dword ptr [rsp + 8], eax
01d1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1f 48ff742420                     push       qword ptr [rsp + 0x20]
01d24 488f442418                     pop        qword ptr [rsp + 0x18]
01d29 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d32 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d40 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01d44 89442438                       mov        dword ptr [rsp + 0x38], eax
01d48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d4d 48ff742478                     push       qword ptr [rsp + 0x78]
01d52 488f442440                     pop        qword ptr [rsp + 0x40]
01d57 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01d60 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d69 48ffb42480000000               push       qword ptr [rsp + 0x80]
01d71 488f442450                     pop        qword ptr [rsp + 0x50]
01d76 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d7f 89442458                       mov        dword ptr [rsp + 0x58], eax
01d83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d88 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d91 89442460                       mov        dword ptr [rsp + 0x60], eax
01d95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9f 8b8424b8000000                 mov        eax, dword ptr [rsp + 0xb8]
01da6 89442464                       mov        dword ptr [rsp + 0x64], eax
01daa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01daf 894c2470                       mov        dword ptr [rsp + 0x70], ecx
01db3 90                             nop        
01db4 c5f877                         vzeroupper 
01db7 e8a46bb6ff                     call       0x7fc00b9c3660
01dbc 0f1f8400b41e0015               nop        dword ptr [rax + rax + 0x15001eb4]
01dc4 beccffffff                     mov        esi, 0xffffffcc
01dc9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dce 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dd2 89442414                       mov        dword ptr [rsp + 0x14], eax
01dd6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ddb 48894424f8                     mov        qword ptr [rsp - 8], rax
01de0 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01de4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01de8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ded 48ff742478                     push       qword ptr [rsp + 0x78]
01df2 488f442440                     pop        qword ptr [rsp + 0x40]
01df7 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfc 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01e00 89442448                       mov        dword ptr [rsp + 0x48], eax
01e04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e09 48ffb42480000000               push       qword ptr [rsp + 0x80]
01e11 488f442458                     pop        qword ptr [rsp + 0x58]
01e16 48894424f8                     mov        qword ptr [rsp - 8], rax
01e1b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e1f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e23 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e28 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2d 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
01e34 89442460                       mov        dword ptr [rsp + 0x60], eax
01e38 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e42 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e46 89442464                       mov        dword ptr [rsp + 0x64], eax
01e4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4f 90                             nop        
01e50 c5f877                         vzeroupper 
01e53 e8086bb6ff                     call       0x7fc00b9c3660
01e58 0f1f8400501f0016               nop        dword ptr [rax + rax + 0x16001f50]
01e60 bee4ffffff                     mov        esi, 0xffffffe4
01e65 488b2c24                       mov        rbp, qword ptr [rsp]
01e69 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e72 89442408                       mov        dword ptr [rsp + 8], eax
01e76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7b 48ff742420                     push       qword ptr [rsp + 0x20]
01e80 488f442418                     pop        qword ptr [rsp + 0x18]
01e85 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e8e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e97 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01e9b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01ea0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea5 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ea9 89442438                       mov        dword ptr [rsp + 0x38], eax
01ead 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb2 48ff742478                     push       qword ptr [rsp + 0x78]
01eb7 488f442440                     pop        qword ptr [rsp + 0x40]
01ebc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec1 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01ec5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ec9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ece 48ffb42480000000               push       qword ptr [rsp + 0x80]
01ed6 488f442450                     pop        qword ptr [rsp + 0x50]
01edb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee0 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ee4 89442458                       mov        dword ptr [rsp + 0x58], eax
01ee8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eed 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ef6 89442460                       mov        dword ptr [rsp + 0x60], eax
01efa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eff 89442464                       mov        dword ptr [rsp + 0x64], eax
01f03 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01f0a 6690                           nop        
01f0c c5f877                         vzeroupper 
01f0f e84c6ab6ff                     call       0x7fc00b9c3660
01f14 0f1f84000c200017               nop        dword ptr [rax + rax + 0x1700200c]
01f1c be6effffff                     mov        esi, 0xffffff6e
01f21 488b2c24                       mov        rbp, qword ptr [rsp]
01f25 48894424f8                     mov        qword ptr [rsp - 8], rax
01f2a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01f2e 89442408                       mov        dword ptr [rsp + 8], eax
01f32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f37 48ff742420                     push       qword ptr [rsp + 0x20]
01f3c 488f442418                     pop        qword ptr [rsp + 0x18]
01f41 48894424f8                     mov        qword ptr [rsp - 8], rax
01f46 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f4a 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f4e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f53 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f57 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01f5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f61 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01f65 89442438                       mov        dword ptr [rsp + 0x38], eax
01f69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6e 48ff742478                     push       qword ptr [rsp + 0x78]
01f73 488f442440                     pop        qword ptr [rsp + 0x40]
01f78 48894424f8                     mov        qword ptr [rsp - 8], rax
01f7d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
01f81 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01f8f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01f93 89442458                       mov        dword ptr [rsp + 0x58], eax
01f97 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9c 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01fa5 89442460                       mov        dword ptr [rsp + 0x60], eax
01fa9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fae 89442464                       mov        dword ptr [rsp + 0x64], eax
01fb2 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01fb7 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01fbb 90                             nop        
01fbc c5f877                         vzeroupper 
01fbf e89c69b6ff                     call       0x7fc00b9c3660
01fc4 0f1f8400bc200018               nop        dword ptr [rax + rax + 0x180020bc]
01fcc be45ffffff                     mov        esi, 0xffffff45
01fd1 488b2c24                       mov        rbp, qword ptr [rsp]
01fd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fda 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fde 89442408                       mov        dword ptr [rsp + 8], eax
01fe2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe7 48ff742420                     push       qword ptr [rsp + 0x20]
01fec 488f442418                     pop        qword ptr [rsp + 0x18]
01ff1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ffa 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ffe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02003 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02007 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0200c 48894424f8                     mov        qword ptr [rsp - 8], rax
02011 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02015 89442438                       mov        dword ptr [rsp + 0x38], eax
02019 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201e 48ff742478                     push       qword ptr [rsp + 0x78]
02023 488f442440                     pop        qword ptr [rsp + 0x40]
02028 48894424f8                     mov        qword ptr [rsp - 8], rax
0202d 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02031 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02035 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203a 48894424f8                     mov        qword ptr [rsp - 8], rax
0203f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02043 89442458                       mov        dword ptr [rsp + 0x58], eax
02047 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204c 48894424f8                     mov        qword ptr [rsp - 8], rax
02051 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02055 89442460                       mov        dword ptr [rsp + 0x60], eax
02059 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205e 89442464                       mov        dword ptr [rsp + 0x64], eax
02062 894c2478                       mov        dword ptr [rsp + 0x78], ecx
02066 6690                           nop        
02068 c5f877                         vzeroupper 
0206b e8f068b6ff                     call       0x7fc00b9c3660
02070 0f1f840068210019               nop        dword ptr [rax + rax + 0x19002168]
02078 be3dffffff                     mov        esi, 0xffffff3d
0207d 488b2c24                       mov        rbp, qword ptr [rsp]
02081 48894424f8                     mov        qword ptr [rsp - 8], rax
02086 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0208a 89442408                       mov        dword ptr [rsp + 8], eax
0208e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02093 48ff742420                     push       qword ptr [rsp + 0x20]
02098 488f442418                     pop        qword ptr [rsp + 0x18]
0209d 48894424f8                     mov        qword ptr [rsp - 8], rax
020a2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020a6 8944240c                       mov        dword ptr [rsp + 0xc], eax
020aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020af 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020b3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020b8 48894424f8                     mov        qword ptr [rsp - 8], rax
020bd 8b442468                       mov        eax, dword ptr [rsp + 0x68]
020c1 89442438                       mov        dword ptr [rsp + 0x38], eax
020c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ca 48ff742478                     push       qword ptr [rsp + 0x78]
020cf 488f442440                     pop        qword ptr [rsp + 0x40]
020d4 48894424f8                     mov        qword ptr [rsp - 8], rax
020d9 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
020dd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e6 48894424f8                     mov        qword ptr [rsp - 8], rax
020eb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
020ef 89442458                       mov        dword ptr [rsp + 0x58], eax
020f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f8 48894424f8                     mov        qword ptr [rsp - 8], rax
020fd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02101 89442460                       mov        dword ptr [rsp + 0x60], eax
02105 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210a 89442464                       mov        dword ptr [rsp + 0x64], eax
0210e 894c2478                       mov        dword ptr [rsp + 0x78], ecx
02112 6690                           nop        
02114 c5f877                         vzeroupper 
02117 e84468b6ff                     call       0x7fc00b9c3660
0211c 0f1f84001422001a               nop        dword ptr [rax + rax + 0x1a002214]
02124 bee4ffffff                     mov        esi, 0xffffffe4
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
0215b 48894424f8                     mov        qword ptr [rsp - 8], rax
02160 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02164 89442434                       mov        dword ptr [rsp + 0x34], eax
02168 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216d 48ff742478                     push       qword ptr [rsp + 0x78]
02172 488f442438                     pop        qword ptr [rsp + 0x38]
02177 48894424f8                     mov        qword ptr [rsp - 8], rax
0217c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02180 89442440                       mov        dword ptr [rsp + 0x40], eax
02184 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02189 48ffb42480000000               push       qword ptr [rsp + 0x80]
02191 488f442450                     pop        qword ptr [rsp + 0x50]
02196 48894424f8                     mov        qword ptr [rsp - 8], rax
0219b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0219f 89442444                       mov        dword ptr [rsp + 0x44], eax
021a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a8 48894424f8                     mov        qword ptr [rsp - 8], rax
021ad 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
021b4 89442458                       mov        dword ptr [rsp + 0x58], eax
021b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021bd 48894424f8                     mov        qword ptr [rsp - 8], rax
021c2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
021c6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
021ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021cf 898c2484000000                 mov        dword ptr [rsp + 0x84], ecx
021d6 6690                           nop        
021d8 c5f877                         vzeroupper 
021db e88067b6ff                     call       0x7fc00b9c3660
021e0 0f1f8400d822001b               nop        dword ptr [rax + rax + 0x1b0022d8]
021e8 bee4ffffff                     mov        esi, 0xffffffe4
021ed 48894424f8                     mov        qword ptr [rsp - 8], rax
021f2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
021f6 89442414                       mov        dword ptr [rsp + 0x14], eax
021fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02204 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02208 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0220c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02211 48ff742478                     push       qword ptr [rsp + 0x78]
02216 488f442440                     pop        qword ptr [rsp + 0x40]
0221b 48894424f8                     mov        qword ptr [rsp - 8], rax
02220 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02224 89442448                       mov        dword ptr [rsp + 0x48], eax
02228 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222d 48ffb42480000000               push       qword ptr [rsp + 0x80]
02235 488f442458                     pop        qword ptr [rsp + 0x58]
0223a 48894424f8                     mov        qword ptr [rsp - 8], rax
0223f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02243 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02247 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0224c 48894424f8                     mov        qword ptr [rsp - 8], rax
02251 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02258 89442460                       mov        dword ptr [rsp + 0x60], eax
0225c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02261 48894424f8                     mov        qword ptr [rsp - 8], rax
02266 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0226a 89442464                       mov        dword ptr [rsp + 0x64], eax
0226e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02273 894c2474                       mov        dword ptr [rsp + 0x74], ecx
02277 90                             nop        
02278 c5f877                         vzeroupper 
0227b e8e066b6ff                     call       0x7fc00b9c3660
02280 0f1f84007823001c               nop        dword ptr [rax + rax + 0x1c002378]
02288 8d6901                         lea        ebp, [rcx + 1]
0228b bee4ffffff                     mov        esi, 0xffffffe4
02290 48894424f8                     mov        qword ptr [rsp - 8], rax
02295 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02299 89442414                       mov        dword ptr [rsp + 0x14], eax
0229d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a2 48894424f8                     mov        qword ptr [rsp - 8], rax
022a7 8b442468                       mov        eax, dword ptr [rsp + 0x68]
022ab 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b4 48ff742478                     push       qword ptr [rsp + 0x78]
022b9 488f442440                     pop        qword ptr [rsp + 0x40]
022be 48894424f8                     mov        qword ptr [rsp - 8], rax
022c3 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
022c7 89442448                       mov        dword ptr [rsp + 0x48], eax
022cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d0 48ffb42480000000               push       qword ptr [rsp + 0x80]
022d8 488f442458                     pop        qword ptr [rsp + 0x58]
022dd 48894424f8                     mov        qword ptr [rsp - 8], rax
022e2 8b442474                       mov        eax, dword ptr [rsp + 0x74]
022e6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
022ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ef 48894424f8                     mov        qword ptr [rsp - 8], rax
022f4 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
022fb 89442460                       mov        dword ptr [rsp + 0x60], eax
022ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02304 48894424f8                     mov        qword ptr [rsp - 8], rax
02309 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0230d 89442464                       mov        dword ptr [rsp + 0x64], eax
02311 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02316 894c2474                       mov        dword ptr [rsp + 0x74], ecx
0231a 6690                           nop        
0231c c5f877                         vzeroupper 
0231f e83c66b6ff                     call       0x7fc00b9c3660
02324 0f1f84001c24001d               nop        dword ptr [rax + rax + 0x1d00241c]
0232c bee4ffffff                     mov        esi, 0xffffffe4
02331 48894424f8                     mov        qword ptr [rsp - 8], rax
02336 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0233a 89442414                       mov        dword ptr [rsp + 0x14], eax
0233e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02343 48894424f8                     mov        qword ptr [rsp - 8], rax
02348 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0234c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02350 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02355 48ff742478                     push       qword ptr [rsp + 0x78]
0235a 488f442440                     pop        qword ptr [rsp + 0x40]
0235f 48894424f8                     mov        qword ptr [rsp - 8], rax
02364 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02368 89442448                       mov        dword ptr [rsp + 0x48], eax
0236c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02371 48ffb42480000000               push       qword ptr [rsp + 0x80]
02379 488f442458                     pop        qword ptr [rsp + 0x58]
0237e 48894424f8                     mov        qword ptr [rsp - 8], rax
02383 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02387 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0238b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02390 48894424f8                     mov        qword ptr [rsp - 8], rax
02395 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02399 89442464                       mov        dword ptr [rsp + 0x64], eax
0239d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a2 894c2474                       mov        dword ptr [rsp + 0x74], ecx
023a6 6690                           nop        
023a8 c5f877                         vzeroupper 
023ab e8b065b6ff                     call       0x7fc00b9c3660
023b0 0f1f8400a824001e               nop        dword ptr [rax + rax + 0x1e0024a8]
023b8 bee4ffffff                     mov        esi, 0xffffffe4
023bd 488b2c24                       mov        rbp, qword ptr [rsp]
023c1 48894424f8                     mov        qword ptr [rsp - 8], rax
023c6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
023ca 89442408                       mov        dword ptr [rsp + 8], eax
023ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d3 48ff742420                     push       qword ptr [rsp + 0x20]
023d8 488f442418                     pop        qword ptr [rsp + 0x18]
023dd 48894424f8                     mov        qword ptr [rsp - 8], rax
023e2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023e6 8944240c                       mov        dword ptr [rsp + 0xc], eax
023ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ef 48894424f8                     mov        qword ptr [rsp - 8], rax
023f4 8b442468                       mov        eax, dword ptr [rsp + 0x68]
023f8 89442434                       mov        dword ptr [rsp + 0x34], eax
023fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02401 48ff742478                     push       qword ptr [rsp + 0x78]
02406 488f442438                     pop        qword ptr [rsp + 0x38]
0240b 48894424f8                     mov        qword ptr [rsp - 8], rax
02410 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02414 89442440                       mov        dword ptr [rsp + 0x40], eax
02418 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0241d 48894424f8                     mov        qword ptr [rsp - 8], rax
02422 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02426 89442444                       mov        dword ptr [rsp + 0x44], eax
0242a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242f 48894424f8                     mov        qword ptr [rsp - 8], rax
02434 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02438 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0243c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02441 894c2474                       mov        dword ptr [rsp + 0x74], ecx
02445 666690                         nop        
02448 c5f877                         vzeroupper 
0244b e81065b6ff                     call       0x7fc00b9c3660
02450 0f1f84004825001f               nop        dword ptr [rax + rax + 0x1f002548]
02458 beccffffff                     mov        esi, 0xffffffcc
0245d 488b2c24                       mov        rbp, qword ptr [rsp]
02461 48894424f8                     mov        qword ptr [rsp - 8], rax
02466 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0246a 89442408                       mov        dword ptr [rsp + 8], eax
0246e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02473 48ff742420                     push       qword ptr [rsp + 0x20]
02478 488f442418                     pop        qword ptr [rsp + 0x18]
0247d 48894424f8                     mov        qword ptr [rsp - 8], rax
02482 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02486 8944240c                       mov        dword ptr [rsp + 0xc], eax
0248a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248f 48894424f8                     mov        qword ptr [rsp - 8], rax
02494 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02498 89442434                       mov        dword ptr [rsp + 0x34], eax
0249c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a1 48ff742478                     push       qword ptr [rsp + 0x78]
024a6 488f442438                     pop        qword ptr [rsp + 0x38]
024ab 48894424f8                     mov        qword ptr [rsp - 8], rax
024b0 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
024b4 89442440                       mov        dword ptr [rsp + 0x40], eax
024b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024bd 48ffb42480000000               push       qword ptr [rsp + 0x80]
024c5 488f442450                     pop        qword ptr [rsp + 0x50]
024ca 48894424f8                     mov        qword ptr [rsp - 8], rax
024cf 8b442474                       mov        eax, dword ptr [rsp + 0x74]
024d3 89442444                       mov        dword ptr [rsp + 0x44], eax
024d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024dc 48894424f8                     mov        qword ptr [rsp - 8], rax
024e1 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
024e8 89442458                       mov        dword ptr [rsp + 0x58], eax
024ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f1 48894424f8                     mov        qword ptr [rsp - 8], rax
024f6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024fa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
024fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02503 894c2474                       mov        dword ptr [rsp + 0x74], ecx
02507 90                             nop        
02508 c5f877                         vzeroupper 
0250b e85064b6ff                     call       0x7fc00b9c3660
02510 0f1f840008260020               nop        dword ptr [rax + rax + 0x20002608]
02518 be45ffffff                     mov        esi, 0xffffff45
0251d 488b2c24                       mov        rbp, qword ptr [rsp]
02521 48894424f8                     mov        qword ptr [rsp - 8], rax
02526 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0252a 89442408                       mov        dword ptr [rsp + 8], eax
0252e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02533 48ff742420                     push       qword ptr [rsp + 0x20]
02538 488f442418                     pop        qword ptr [rsp + 0x18]
0253d 48894424f8                     mov        qword ptr [rsp - 8], rax
02542 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02546 8944240c                       mov        dword ptr [rsp + 0xc], eax
0254a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254f 48894424f8                     mov        qword ptr [rsp - 8], rax
02554 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02558 89442438                       mov        dword ptr [rsp + 0x38], eax
0255c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02561 48894424f8                     mov        qword ptr [rsp - 8], rax
02566 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
0256a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0256e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02573 894c2468                       mov        dword ptr [rsp + 0x68], ecx
02577 90                             nop        
02578 c5f877                         vzeroupper 
0257b e8e063b6ff                     call       0x7fc00b9c3660
02580 0f1f840078260021               nop        dword ptr [rax + rax + 0x21002678]
02588 bebeffffff                     mov        esi, 0xffffffbe
0258d 488b2c24                       mov        rbp, qword ptr [rsp]
02591 48894424f8                     mov        qword ptr [rsp - 8], rax
02596 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0259a 89442408                       mov        dword ptr [rsp + 8], eax
0259e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a3 48ff742420                     push       qword ptr [rsp + 0x20]
025a8 488f442418                     pop        qword ptr [rsp + 0x18]
025ad 48894424f8                     mov        qword ptr [rsp - 8], rax
025b2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025b6 8944240c                       mov        dword ptr [rsp + 0xc], eax
025ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025bf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
025c3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
025c8 c5f877                         vzeroupper 
025cb e89063b6ff                     call       0x7fc00b9c3660
025d0 0f1f8400c8260022               nop        dword ptr [rax + rax + 0x220026c8]
025d8 be85ffffff                     mov        esi, 0xffffff85
025dd 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
025e1 48894424f8                     mov        qword ptr [rsp - 8], rax
025e6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025ea 890424                         mov        dword ptr [rsp], eax
025ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f2 895c2404                       mov        dword ptr [rsp + 4], ebx
025f6 4489742408                     mov        dword ptr [rsp + 8], r14d
025fb 90                             nop        
025fc c5f877                         vzeroupper 
025ff e85c63b6ff                     call       0x7fc00b9c3660
02604 0f1f8400fc260023               nop        dword ptr [rax + rax + 0x230026fc]
0260c beccffffff                     mov        esi, 0xffffffcc
02611 488b2c24                       mov        rbp, qword ptr [rsp]
02615 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0261a 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0261e 4489442420                     mov        dword ptr [rsp + 0x20], r8d
02623 90                             nop        
02624 c5f877                         vzeroupper 
02627 e83463b6ff                     call       0x7fc00b9c3660
0262c 0f1f840024270024               nop        dword ptr [rax + rax + 0x24002724]
02634 bee4ffffff                     mov        esi, 0xffffffe4
02639 488b2c24                       mov        rbp, qword ptr [rsp]
0263d 48894424f8                     mov        qword ptr [rsp - 8], rax
02642 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02646 89442408                       mov        dword ptr [rsp + 8], eax
0264a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264f 48ff742420                     push       qword ptr [rsp + 0x20]
02654 488f442418                     pop        qword ptr [rsp + 0x18]
02659 48894424f8                     mov        qword ptr [rsp - 8], rax
0265e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02662 8944240c                       mov        dword ptr [rsp + 0xc], eax
02666 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266b 48894424f8                     mov        qword ptr [rsp - 8], rax
02670 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02674 89442434                       mov        dword ptr [rsp + 0x34], eax
02678 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0267d 48ff742478                     push       qword ptr [rsp + 0x78]
02682 488f442438                     pop        qword ptr [rsp + 0x38]
02687 48894424f8                     mov        qword ptr [rsp - 8], rax
0268c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02690 89442440                       mov        dword ptr [rsp + 0x40], eax
02694 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02699 48ffb42480000000               push       qword ptr [rsp + 0x80]
026a1 488f442450                     pop        qword ptr [rsp + 0x50]
026a6 48894424f8                     mov        qword ptr [rsp - 8], rax
026ab 8b442474                       mov        eax, dword ptr [rsp + 0x74]
026af 89442444                       mov        dword ptr [rsp + 0x44], eax
026b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b8 48894424f8                     mov        qword ptr [rsp - 8], rax
026bd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
026c1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
026c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ca 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
026d1 666690                         nop        
026d4 c5f877                         vzeroupper 
026d7 e88462b6ff                     call       0x7fc00b9c3660
026dc 0f1f8400d4270025               nop        dword ptr [rax + rax + 0x250027d4]
026e4 bee4ffffff                     mov        esi, 0xffffffe4
026e9 488b2c24                       mov        rbp, qword ptr [rsp]
026ed 48894424f8                     mov        qword ptr [rsp - 8], rax
026f2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
026f6 89442408                       mov        dword ptr [rsp + 8], eax
026fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ff 48ff742420                     push       qword ptr [rsp + 0x20]
02704 488f442418                     pop        qword ptr [rsp + 0x18]
02709 48894424f8                     mov        qword ptr [rsp - 8], rax
0270e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02712 8944240c                       mov        dword ptr [rsp + 0xc], eax
02716 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271b 48894424f8                     mov        qword ptr [rsp - 8], rax
02720 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02724 89442434                       mov        dword ptr [rsp + 0x34], eax
02728 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0272d 48ff742478                     push       qword ptr [rsp + 0x78]
02732 488f442438                     pop        qword ptr [rsp + 0x38]
02737 48894424f8                     mov        qword ptr [rsp - 8], rax
0273c 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02740 89442440                       mov        dword ptr [rsp + 0x40], eax
02744 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02749 48894424f8                     mov        qword ptr [rsp - 8], rax
0274e 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02752 89442444                       mov        dword ptr [rsp + 0x44], eax
02756 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0275b 48894424f8                     mov        qword ptr [rsp - 8], rax
02760 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02764 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02768 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0276d 894c2468                       mov        dword ptr [rsp + 0x68], ecx
02771 666690                         nop        
02774 c5f877                         vzeroupper 
02777 e8e461b6ff                     call       0x7fc00b9c3660
0277c 0f1f840074280026               nop        dword ptr [rax + rax + 0x26002874]
02784 83c108                         add        ecx, 8
02787 be6effffff                     mov        esi, 0xffffff6e
0278c 48894424f8                     mov        qword ptr [rsp - 8], rax
02791 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02795 89442414                       mov        dword ptr [rsp + 0x14], eax
02799 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279e 48894424f8                     mov        qword ptr [rsp - 8], rax
027a3 8b442468                       mov        eax, dword ptr [rsp + 0x68]
027a7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
027ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b0 48894424f8                     mov        qword ptr [rsp - 8], rax
027b5 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
027b9 89442448                       mov        dword ptr [rsp + 0x48], eax
027bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c2 48894424f8                     mov        qword ptr [rsp - 8], rax
027c7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
027cb 89442464                       mov        dword ptr [rsp + 0x64], eax
027cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d4 48894424f8                     mov        qword ptr [rsp - 8], rax
027d9 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
027e0 89442468                       mov        dword ptr [rsp + 0x68], eax
027e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027e9 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
027ed 666690                         nop        
027f0 c5f877                         vzeroupper 
027f3 e86861b6ff                     call       0x7fc00b9c3660
027f8 0f1f8400f0280027               nop        dword ptr [rax + rax + 0x270028f0]
02800 83c108                         add        ecx, 8
02803 beb6ffffff                     mov        esi, 0xffffffb6
02808 48894424f8                     mov        qword ptr [rsp - 8], rax
0280d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02811 89442414                       mov        dword ptr [rsp + 0x14], eax
02815 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281a 48894424f8                     mov        qword ptr [rsp - 8], rax
0281f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02823 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02827 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282c 48894424f8                     mov        qword ptr [rsp - 8], rax
02831 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02835 89442448                       mov        dword ptr [rsp + 0x48], eax
02839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283e 48894424f8                     mov        qword ptr [rsp - 8], rax
02843 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02847 89442464                       mov        dword ptr [rsp + 0x64], eax
0284b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02850 48894424f8                     mov        qword ptr [rsp - 8], rax
02855 8b8424c8000000                 mov        eax, dword ptr [rsp + 0xc8]
0285c 89442468                       mov        dword ptr [rsp + 0x68], eax
02860 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02865 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
02869 666690                         nop        
0286c c5f877                         vzeroupper 
0286f e8ec60b6ff                     call       0x7fc00b9c3660
02874 0f1f84006c290028               nop        dword ptr [rax + rax + 0x2800296c]
0287c 83c108                         add        ecx, 8
0287f be66ffffff                     mov        esi, 0xffffff66
02884 48894424f8                     mov        qword ptr [rsp - 8], rax
02889 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0288d 89442414                       mov        dword ptr [rsp + 0x14], eax
02891 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02896 48894424f8                     mov        qword ptr [rsp - 8], rax
0289b 8b442468                       mov        eax, dword ptr [rsp + 0x68]
0289f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
028a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a8 48894424f8                     mov        qword ptr [rsp - 8], rax
028ad 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
028b1 89442448                       mov        dword ptr [rsp + 0x48], eax
028b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ba 48894424f8                     mov        qword ptr [rsp - 8], rax
028bf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
028c3 89442464                       mov        dword ptr [rsp + 0x64], eax
028c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028cc 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
028d0 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
028d5 666690                         nop        
028d8 c5f877                         vzeroupper 
028db e88060b6ff                     call       0x7fc00b9c3660
028e0 0f1f8400d8290029               nop        dword ptr [rax + rax + 0x290029d8]
028e8 bee4ffffff                     mov        esi, 0xffffffe4
028ed 488b2c24                       mov        rbp, qword ptr [rsp]
028f1 48894424f8                     mov        qword ptr [rsp - 8], rax
028f6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
028fa 89442408                       mov        dword ptr [rsp + 8], eax
028fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02903 48ff742420                     push       qword ptr [rsp + 0x20]
02908 488f442418                     pop        qword ptr [rsp + 0x18]
0290d 48894424f8                     mov        qword ptr [rsp - 8], rax
02912 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02916 8944240c                       mov        dword ptr [rsp + 0xc], eax
0291a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0291f 48894424f8                     mov        qword ptr [rsp - 8], rax
02924 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02928 89442434                       mov        dword ptr [rsp + 0x34], eax
0292c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02931 48ff742478                     push       qword ptr [rsp + 0x78]
02936 488f442438                     pop        qword ptr [rsp + 0x38]
0293b 48894424f8                     mov        qword ptr [rsp - 8], rax
02940 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02944 89442440                       mov        dword ptr [rsp + 0x40], eax
02948 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0294d 48ffb42480000000               push       qword ptr [rsp + 0x80]
02955 488f442450                     pop        qword ptr [rsp + 0x50]
0295a 48894424f8                     mov        qword ptr [rsp - 8], rax
0295f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02963 89442444                       mov        dword ptr [rsp + 0x44], eax
02967 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0296c 48894424f8                     mov        qword ptr [rsp - 8], rax
02971 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02975 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02979 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297e 89442460                       mov        dword ptr [rsp + 0x60], eax
02982 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02987 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0298b 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02990 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02998 c5f877                         vzeroupper 
0299b e8c05fb6ff                     call       0x7fc00b9c3660
029a0 0f1f8400982a002a               nop        dword ptr [rax + rax + 0x2a002a98]
029a8 c5fa7f8424c0000000             vmovdqu    xmmword ptr [rsp + 0xc0], xmm0
029b1 bee4ffffff                     mov        esi, 0xffffffe4
029b6 488b2c24                       mov        rbp, qword ptr [rsp]
029ba 48894424f8                     mov        qword ptr [rsp - 8], rax
029bf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
029c3 89442408                       mov        dword ptr [rsp + 8], eax
029c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029cc 48ff742420                     push       qword ptr [rsp + 0x20]
029d1 488f442418                     pop        qword ptr [rsp + 0x18]
029d6 48894424f8                     mov        qword ptr [rsp - 8], rax
029db 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029df 8944240c                       mov        dword ptr [rsp + 0xc], eax
029e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e8 48894424f8                     mov        qword ptr [rsp - 8], rax
029ed 8b442468                       mov        eax, dword ptr [rsp + 0x68]
029f1 89442434                       mov        dword ptr [rsp + 0x34], eax
029f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029fa 48ff742478                     push       qword ptr [rsp + 0x78]
029ff 488f442438                     pop        qword ptr [rsp + 0x38]
02a04 48894424f8                     mov        qword ptr [rsp - 8], rax
02a09 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02a0d 89442440                       mov        dword ptr [rsp + 0x40], eax
02a11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a16 48ffb42480000000               push       qword ptr [rsp + 0x80]
02a1e 488f442450                     pop        qword ptr [rsp + 0x50]
02a23 48894424f8                     mov        qword ptr [rsp - 8], rax
02a28 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02a2c 89442444                       mov        dword ptr [rsp + 0x44], eax
02a30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a35 48894424f8                     mov        qword ptr [rsp - 8], rax
02a3a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a3e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02a42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a47 89442460                       mov        dword ptr [rsp + 0x60], eax
02a4b 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02a50 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02a55 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02a5c c5f877                         vzeroupper 
02a5f e8fc5eb6ff                     call       0x7fc00b9c3660
02a64 0f1f84005c2b002b               nop        dword ptr [rax + rax + 0x2b002b5c]
02a6c beccffffff                     mov        esi, 0xffffffcc
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
02aac 89442438                       mov        dword ptr [rsp + 0x38], eax
02ab0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ab5 48ff742478                     push       qword ptr [rsp + 0x78]
02aba 488f442440                     pop        qword ptr [rsp + 0x40]
02abf 48894424f8                     mov        qword ptr [rsp - 8], rax
02ac4 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02ac8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02acc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad1 48ffb42480000000               push       qword ptr [rsp + 0x80]
02ad9 488f442450                     pop        qword ptr [rsp + 0x50]
02ade 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02ae7 89442458                       mov        dword ptr [rsp + 0x58], eax
02aeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af0 48894424f8                     mov        qword ptr [rsp - 8], rax
02af5 8b842488000000                 mov        eax, dword ptr [rsp + 0x88]
02afc 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02b00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b05 48894424f8                     mov        qword ptr [rsp - 8], rax
02b0a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b0e 89442460                       mov        dword ptr [rsp + 0x60], eax
02b12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b17 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02b1c 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02b20 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02b27 90                             nop        
02b28 c5f877                         vzeroupper 
02b2b e8305eb6ff                     call       0x7fc00b9c3660
02b30 0f1f8400282c002c               nop        dword ptr [rax + rax + 0x2c002c28]
02b38 418bee                         mov        ebp, r14d
02b3b 83c510                         add        ebp, 0x10
02b3e be6effffff                     mov        esi, 0xffffff6e
02b43 48894424f8                     mov        qword ptr [rsp - 8], rax
02b48 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b4c 89442414                       mov        dword ptr [rsp + 0x14], eax
02b50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b55 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02b5a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b5f 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02b63 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b6c 48ff742478                     push       qword ptr [rsp + 0x78]
02b71 488f442440                     pop        qword ptr [rsp + 0x40]
02b76 48894424f8                     mov        qword ptr [rsp - 8], rax
02b7b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02b7f 89442448                       mov        dword ptr [rsp + 0x48], eax
02b83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b88 48894424f8                     mov        qword ptr [rsp - 8], rax
02b8d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02b91 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02b95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b9a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b9f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02ba3 89442464                       mov        dword ptr [rsp + 0x64], eax
02ba7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bac 89442468                       mov        dword ptr [rsp + 0x68], eax
02bb0 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02bb5 666690                         nop        
02bb8 c5f877                         vzeroupper 
02bbb e8a05db6ff                     call       0x7fc00b9c3660
02bc0 0f1f8400b82c002d               nop        dword ptr [rax + rax + 0x2d002cb8]
02bc8 418bee                         mov        ebp, r14d
02bcb 83c510                         add        ebp, 0x10
02bce be66ffffff                     mov        esi, 0xffffff66
02bd3 48894424f8                     mov        qword ptr [rsp - 8], rax
02bd8 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02bdc 89442414                       mov        dword ptr [rsp + 0x14], eax
02be0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02be5 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02bea 48894424f8                     mov        qword ptr [rsp - 8], rax
02bef 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02bf3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02bf7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bfc 48ff742478                     push       qword ptr [rsp + 0x78]
02c01 488f442440                     pop        qword ptr [rsp + 0x40]
02c06 48894424f8                     mov        qword ptr [rsp - 8], rax
02c0b 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02c0f 89442448                       mov        dword ptr [rsp + 0x48], eax
02c13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c18 48894424f8                     mov        qword ptr [rsp - 8], rax
02c1d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02c21 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c2f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c33 89442464                       mov        dword ptr [rsp + 0x64], eax
02c37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c3c 89442468                       mov        dword ptr [rsp + 0x68], eax
02c40 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02c45 666690                         nop        
02c48 c5f877                         vzeroupper 
02c4b e8105db6ff                     call       0x7fc00b9c3660
02c50 0f1f8400482d002e               nop        dword ptr [rax + rax + 0x2e002d48]
02c58 488bf0                         mov        rsi, rax
02c5b eb0d                           jmp        0x7fc00be5d96a
02c5d 488bf0                         mov        rsi, rax
02c60 eb08                           jmp        0x7fc00be5d96a
02c62 488bf0                         mov        rsi, rax
02c65 eb03                           jmp        0x7fc00be5d96a
02c67 488bf0                         mov        rsi, rax
02c6a c5f877                         vzeroupper 
02c6d 4881c4f0000000                 add        rsp, 0xf0
02c74 5d                             pop        rbp
02c75 e9e6dbb6ff                     jmp        0x7fc00b9cb560
02c7a bef6ffffff                     mov        esi, 0xfffffff6
02c7f 90                             nop        
02c80 c5f877                         vzeroupper 
02c83 e8d85cb6ff                     call       0x7fc00b9c3660
02c88 0f1f8400802d002f               nop        dword ptr [rax + rax + 0x2f002d80]
02c90 49ba9cbae50bc07f0000           movabs     r10, 0x7fc00be5ba9c
02c9a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02ca1 e93a05aaff                     jmp        0x7fc00b8fdee0
02ca6 e8f5d0a8ff                     call       0x7fc00b8eaaa0
02cab e97ed3ffff                     jmp        0x7fc00be5ad2e
