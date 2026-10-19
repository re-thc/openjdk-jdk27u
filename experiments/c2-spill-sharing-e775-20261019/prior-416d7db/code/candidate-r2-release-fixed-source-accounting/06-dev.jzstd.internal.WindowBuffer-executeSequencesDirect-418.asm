00000 e87b25cb18                     call       0x7f4c34b29880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f854c2f0000                   jne        0x7f4c1be7a27a
0002e 4c8bae40010000                 mov        r13, qword ptr [rsi + 0x140]
00035 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
0003c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00041 448b5e68                       mov        r11d, dword ptr [rsi + 0x68]
00045 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0004a 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00051 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00056 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
0005d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00062 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00069 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0006e 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00075 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0007a 448b9e30010000                 mov        r11d, dword ptr [rsi + 0x130]
00081 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00086 448b9618010000                 mov        r10d, dword ptr [rsi + 0x118]
0008d 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00092 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00098 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
0009f 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000a6 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
000ab 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000b7 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000be 4489542464                     mov        dword ptr [rsp + 0x64], r10d
000c3 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000ca 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000cf 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d3 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
000d8 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000dc 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e4 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000eb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000f3 488bfe                         mov        rdi, rsi
000f6 c5f877                         vzeroupper 
000f9 49ba4088c0344c7f0000           movabs     r10, 0x7f4c34c08840
00103 41ffd2                         call       r10
00106 0f1f840000000000               nop        dword ptr [rax + rax]
0010e 4d85ed                         test       r13, r13
00111 0f84011a0000                   je         0x7f4c1be78e18
00117 458b5504                       mov        r10d, dword ptr [r13 + 4]
0011b 41c1ea0a                       shr        r10d, 0xa
0011f 4181fa0c080000                 cmp        r10d, 0x80c
00126 0f85a8260000                   jne        0x7f4c1be79ad4
0012c 4d8bd5                         mov        r10, r13
0012f 4c891424                       mov        qword ptr [rsp], r10
00133 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00138 4d85d2                         test       r10, r10
0013b 0f84e3190000                   je         0x7f4c1be78e24
00141 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00145 41c1eb0a                       shr        r11d, 0xa
00149 4181fb05020000                 cmp        r11d, 0x205
00150 0f857e260000                   jne        0x7f4c1be79ad4
00156 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0015e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00163 4d85d2                         test       r10, r10
00166 0f84c8190000                   je         0x7f4c1be78e34
0016c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00170 41c1ea0a                       shr        r10d, 0xa
00174 4181fa08020000                 cmp        r10d, 0x208
0017b 0f8553260000                   jne        0x7f4c1be79ad4
00181 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00186 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0018e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00193 4d85d2                         test       r10, r10
00196 0f84a8190000                   je         0x7f4c1be78e44
0019c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001a0 41c1eb0a                       shr        r11d, 0xa
001a4 4181fb07020000                 cmp        r11d, 0x207
001ab 0f8523260000                   jne        0x7f4c1be79ad4
001b1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001bb 4d85d2                         test       r10, r10
001be 0f848d190000                   je         0x7f4c1be78e51
001c4 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c8 41c1ea0a                       shr        r10d, 0xa
001cc 4181fa07020000                 cmp        r10d, 0x207
001d3 0f85fb250000                   jne        0x7f4c1be79ad4
001d9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001de 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001e6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001eb 4d85d2                         test       r10, r10
001ee 0f846d190000                   je         0x7f4c1be78e61
001f4 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f8 41c1eb0a                       shr        r11d, 0xa
001fc 4181fb05020000                 cmp        r11d, 0x205
00203 0f85cb250000                   jne        0x7f4c1be79ad4
00209 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00211 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00219 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00222 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00227 4585db                         test       r11d, r11d
0022a 0f8440250000                   je         0x7f4c1be79a70
00230 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00238 458b5208                       mov        r10d, dword ptr [r10 + 8]
0023c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00241 4585d2                         test       r10d, r10d
00244 0f8626250000                   jbe        0x7f4c1be79a70
0024a 4183fa01                       cmp        r10d, 1
0024e 0f861c250000                   jbe        0x7f4c1be79a70
00254 4183fa02                       cmp        r10d, 2
00258 0f8612250000                   jbe        0x7f4c1be79a70
0025e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00266 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0026a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0026f 458d53f1                       lea        r10d, [r11 - 0xf]
00273 4585d2                         test       r10d, r10d
00276 0f8cf4240000                   jl         0x7f4c1be79a70
0027c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00284 458b5208                       mov        r10d, dword ptr [r10 + 8]
00288 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0028d 458d5af1                       lea        r11d, [r10 - 0xf]
00291 4585db                         test       r11d, r11d
00294 0f8cd6240000                   jl         0x7f4c1be79a70
0029a 4183c2f9                       add        r10d, -7
0029e 4585d2                         test       r10d, r10d
002a1 0f8cc9240000                   jl         0x7f4c1be79a70
002a7 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002ac 458d53f9                       lea        r10d, [r11 - 7]
002b0 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
002b8 4d63d3                         movsxd     r10, r11d
002bb 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002c0 4183c3f1                       add        r11d, -0xf
002c4 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002cc 4983c2f9                       add        r10, -7
002d0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002d5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002da 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
002df 458d53f1                       lea        r10d, [r11 - 0xf]
002e3 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
002eb e9cf030000                     jmp        0x7f4c1be779bf
002f0 448bd5                         mov        r10d, ebp
002f3 4d63d2                         movsxd     r10, r10d
002f6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
002fd c442a8f5db                     bzhi       r11, r11, r10
00302 c4c1fb92fb                     kmovq      k7, r11
00307 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0030d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00313 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0031b 4403d5                         add        r10d, ebp
0031e 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00326 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0032a 418502                         test       dword ptr [r10], eax
0032d 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00335 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0033d 0f8d81090000                   jge        0x7f4c1be77fc4
00343 448beb                         mov        r13d, ebx
00346 458bd5                         mov        r10d, r13d
00349 442b9424b4000000               sub        r10d, dword ptr [rsp + 0xb4]
00351 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00358 2bac24b4000000                 sub        ebp, dword ptr [rsp + 0xb4]
0035f 3bac24b4000000                 cmp        ebp, dword ptr [rsp + 0xb4]
00366 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0036e 410f4feb                       cmovg      ebp, r11d
00372 4585d2                         test       r10d, r10d
00375 0f8c511a0000                   jl         0x7f4c1be790cc
0037b 4585ed                         test       r13d, r13d
0037e 0f8c481a0000                   jl         0x7f4c1be790cc
00384 458d1c2a                       lea        r11d, [r10 + rbp]
00388 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
0038d 453bcb                         cmp        r9d, r11d
00390 0f82361a0000                   jb         0x7f4c1be790cc
00396 418bdd                         mov        ebx, r13d
00399 03dd                           add        ebx, ebp
0039b 443bcb                         cmp        r9d, ebx
0039e 0f82281a0000                   jb         0x7f4c1be790cc
003a4 85ed                           test       ebp, ebp
003a6 0f8c201a0000                   jl         0x7f4c1be790cc
003ac 85ed                           test       ebp, ebp
003ae 0f845fffffff                   je         0x7f4c1be77613
003b4 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003bc 4b8d742b0c                     lea        rsi, [r11 + r13 + 0xc]
003c1 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
003c6 4863d5                         movsxd     rdx, ebp
003c9 4883fa20                       cmp        rdx, 0x20
003cd 0f861dffffff                   jbe        0x7f4c1be775f0
003d3 c5f877                         vzeroupper 
003d6 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
003e0 41ffd2                         call       r10
003e3 0f1f840000000000               nop        dword ptr [rax + rax]
003eb e923ffffff                     jmp        0x7f4c1be77613
003f0 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
003f8 c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
003ff 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00406 4103d8                         add        ebx, r8d
00409 e995020000                     jmp        0x7f4c1be779a3
0040e 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00416 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0041e 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
00423 4b8d7c0b0c                     lea        rdi, [r11 + r9 + 0xc]
00428 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00430 44039c24bc000000               add        r11d, dword ptr [rsp + 0xbc]
00438 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00440 4d63c3                         movsxd     r8, r11d
00443 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0044b 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00453 0f8cf4050000                   jl         0x7f4c1be77d4d
00459 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00461 4183fb30                       cmp        r11d, 0x30
00465 0f8e9d000000                   jle        0x7f4c1be77808
0046b 4585c9                         test       r9d, r9d
0046e 0f8c84180000                   jl         0x7f4c1be78ff8
00474 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0047c 4585db                         test       r11d, r11d
0047f 0f8c73180000                   jl         0x7f4c1be78ff8
00485 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0048d 4503d9                         add        r11d, r9d
00490 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00495 453bc3                         cmp        r8d, r11d
00498 0f825a180000                   jb         0x7f4c1be78ff8
0049e 443b8424c0000000               cmp        r8d, dword ptr [rsp + 0xc0]
004a6 0f824c180000                   jb         0x7f4c1be78ff8
004ac 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
004b4 4585db                         test       r11d, r11d
004b7 0f84d8010000                   je         0x7f4c1be77995
004bd 4963d3                         movsxd     rdx, r11d
004c0 4883fa20                       cmp        rdx, 0x20
004c4 7725                           ja         0x7f4c1be777eb
004c6 4d63d3                         movsxd     r10, r11d
004c9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004d0 c442a8f5db                     bzhi       r11, r11, r10
004d5 c4c1fb92fb                     kmovq      k7, r11
004da 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004e0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004e6 e9aa010000                     jmp        0x7f4c1be77995
004eb c5f877                         vzeroupper 
004ee 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
004f8 41ffd2                         call       r10
004fb 0f1f840000000000               nop        dword ptr [rax + rax]
00503 e98d010000                     jmp        0x7f4c1be77995
00508 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
00510 0f8362140000                   jae        0x7f4c1be78c78
00516 4963f9                         movsxd     rdi, r9d
00519 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00521 4d8b5c3a0c                     mov        r11, qword ptr [r10 + rdi + 0xc]
00526 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
0052e 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00536 0f830c150000                   jae        0x7f4c1be78d48
0053c 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
00543 8d5908                         lea        ebx, [rcx + 8]
00546 4c63d1                         movsxd     r10, ecx
00549 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
00551 4e895c120c                     mov        qword ptr [rdx + r10 + 0xc], r11
00556 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
0055d 0f8d32010000                   jge        0x7f4c1be77995
00563 492bfa                         sub        rdi, r10
00566 4c63db                         movsxd     r11, ebx
00569 4d8d143b                       lea        r10, [r11 + rdi]
0056d 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
00572 0f83f9150000                   jae        0x7f4c1be78e71
00578 4d8bd0                         mov        r10, r8
0057b 4d2bd3                         sub        r10, r11
0057e 4983c207                       add        r10, 7
00582 4983e2f8                       and        r10, 0xfffffffffffffff8
00586 458bda                         mov        r11d, r10d
00589 458d540b08                     lea        r10d, [r11 + rcx + 8]
0058e 4d63d2                         movsxd     r10, r10d
00591 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
00596 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
0059b 0f83d0150000                   jae        0x7f4c1be78e71
005a1 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
005a8 0f83c3150000                   jae        0x7f4c1be78e71
005ae 4983c2f8                       add        r10, -8
005b2 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005b7 0f83b4150000                   jae        0x7f4c1be78e71
005bd 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
005c5 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
005cc 0f8f6a160000                   jg         0x7f4c1be78f3c
005d2 442bc9                         sub        r9d, ecx
005d5 83c110                         add        ecx, 0x10
005d8 458d1c19                       lea        r11d, [r9 + rbx]
005dc 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
005e4 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
005e9 448bd3                         mov        r10d, ebx
005ec 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
005f4 4e895c170c                     mov        qword ptr [rdi + r10 + 0xc], r11
005f9 83c308                         add        ebx, 8
005fc 3bd9                           cmp        ebx, ecx
005fe 7cd8                           jl         0x7f4c1be778d8
00600 4983c0f8                       add        r8, -8
00604 4981f800000080                 cmp        r8, -0x80000000
0060b 49c7c200000080                 mov        r10, 0xffffffff80000000
00612 4d0f4cc2                       cmovl      r8, r10
00616 458bd8                         mov        r11d, r8d
00619 413bdb                         cmp        ebx, r11d
0061c 7d41                           jge        0x7f4c1be7795f
0061e 6690                           nop        
00620 458d1419                       lea        r10d, [r9 + rbx]
00624 448bc3                         mov        r8d, ebx
00627 4963c8                         movsxd     rcx, r8d
0062a 458bc2                         mov        r8d, r10d
0062d 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
00635 4a8b7c070c                     mov        rdi, qword ptr [rdi + r8 + 0xc]
0063a 4d63c2                         movsxd     r8, r10d
0063d 448bd3                         mov        r10d, ebx
00640 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
00648 4a897c120c                     mov        qword ptr [rdx + r10 + 0xc], rdi
0064d 4e8b540214                     mov        r10, qword ptr [rdx + r8 + 0x14]
00652 4c89540a14                     mov        qword ptr [rdx + rcx + 0x14], r10
00657 83c310                         add        ebx, 0x10
0065a 413bdb                         cmp        ebx, r11d
0065d 7cc1                           jl         0x7f4c1be77920
0065f 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00666 7d2d                           jge        0x7f4c1be77995
00668 458d1c19                       lea        r11d, [r9 + rbx]
0066c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00674 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
00679 448bd3                         mov        r10d, ebx
0067c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00684 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
00689 83c308                         add        ebx, 8
0068c 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00693 7cd3                           jl         0x7f4c1be77968
00695 8b9c24bc000000                 mov        ebx, dword ptr [rsp + 0xbc]
0069c 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
006a3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006a8 41ffc3                         inc        r11d
006ab 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
006b0 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006b4 418502                         test       dword ptr [r10], eax
006b7 448bb424b8000000               mov        r14d, dword ptr [rsp + 0xb8]
006bf 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
006c7 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
006cc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
006d1 452bde                         sub        r11d, r14d
006d4 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
006dc 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
006e1 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
006e6 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
006eb 0f8d01060000                   jge        0x7f4c1be77ff2
006f1 443b442408                     cmp        r8d, dword ptr [rsp + 8]
006f6 0f83290d0000                   jae        0x7f4c1be78725
006fc 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00704 4f8b54c210                     mov        r10, qword ptr [r10 + r8*8 + 0x10]
00709 418bc2                         mov        eax, r10d
0070c 25ffff0100                     and        eax, 0x1ffff
00711 4d8bc2                         mov        r8, r10
00714 49c1e812                       shr        r8, 0x12
00718 49c1fa24                       sar        r10, 0x24
0071c 458bc8                         mov        r9d, r8d
0071f 458bd2                         mov        r10d, r10d
00722 418bca                         mov        ecx, r10d
00725 4181e1ffff0300                 and        r9d, 0x3ffff
0072c 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
00734 4585d2                         test       r10d, r10d
00737 0f8cc70f0000                   jl         0x7f4c1be78a04
0073d 85c0                           test       eax, eax
0073f 0f8543020000                   jne        0x7f4c1be77c88
00745 4533d2                         xor        r10d, r10d
00748 418bc2                         mov        eax, r10d
0074b 448bd1                         mov        r10d, ecx
0074e 4183fa03                       cmp        r10d, 3
00752 0f8e54020000                   jle        0x7f4c1be77cac
00758 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00760 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
00764 45895a14                       mov        dword ptr [r10 + 0x14], r11d
00768 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0076c 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00774 45895310                       mov        dword ptr [r11 + 0x10], r10d
00778 448d51fd                       lea        r10d, [rcx - 3]
0077c 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00784 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00788 4863ac24b4000000               movsxd     rbp, dword ptr [rsp + 0xb4]
00790 4c63d3                         movsxd     r10, ebx
00793 4c03542468                     add        r10, qword ptr [rsp + 0x68]
00798 4863d0                         movsxd     rdx, eax
0079b 4c03d2                         add        r10, rdx
0079e 493bea                         cmp        rbp, r10
007a1 0f8fe50f0000                   jg         0x7f4c1be78a8c
007a7 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
007af 4585c0                         test       r8d, r8d
007b2 0f8e2c0f0000                   jle        0x7f4c1be789e4
007b8 448d2c03                       lea        r13d, [rbx + rax]
007bc 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
007c4 4503dd                         add        r11d, r13d
007c7 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
007cc 0f8f62100000                   jg         0x7f4c1be78b34
007d2 458d1406                       lea        r10d, [r14 + rax]
007d6 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
007de 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
007e6 0f8fe4100000                   jg         0x7f4c1be78bd0
007ec 83f810                         cmp        eax, 0x10
007ef 0f8f82050000                   jg         0x7f4c1be78077
007f5 443bb424ac000000               cmp        r14d, dword ptr [rsp + 0xac]
007fd 0f83a10c0000                   jae        0x7f4c1be787a4
00803 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0080b c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
00812 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
00819 0f83350d0000                   jae        0x7f4c1be78854
0081f 468d1c30                       lea        r11d, [rax + r14]
00823 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0082b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00833 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
0083a 448d1418                       lea        r10d, [rax + rbx]
0083e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00846 448b8c24bc000000               mov        r9d, dword ptr [rsp + 0xbc]
0084e 442b8c24b4000000               sub        r9d, dword ptr [rsp + 0xb4]
00856 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0085e 4183fa10                       cmp        r10d, 0x10
00862 0f8fa6fbffff                   jg         0x7f4c1be7770e
00868 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00870 4183fb10                       cmp        r11d, 0x10
00874 0f8c94fbffff                   jl         0x7f4c1be7770e
0087a 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
00882 0f83bc0d0000                   jae        0x7f4c1be78944
00888 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00890 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00897 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0089f 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
008a7 0f8243fbffff                   jb         0x7f4c1be776f0
008ad bee4ffffff                     mov        esi, 0xffffffe4
008b2 488b2c24                       mov        rbp, qword ptr [rsp]
008b6 48894424f8                     mov        qword ptr [rsp - 8], rax
008bb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
008bf 89442408                       mov        dword ptr [rsp + 8], eax
008c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008c8 48ff742420                     push       qword ptr [rsp + 0x20]
008cd 488f442418                     pop        qword ptr [rsp + 0x18]
008d2 48894424f8                     mov        qword ptr [rsp - 8], rax
008d7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008db 8944240c                       mov        dword ptr [rsp + 0xc], eax
008df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e4 48894424f8                     mov        qword ptr [rsp - 8], rax
008e9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
008ed 89442438                       mov        dword ptr [rsp + 0x38], eax
008f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008f6 48ff742468                     push       qword ptr [rsp + 0x68]
008fb 488f442440                     pop        qword ptr [rsp + 0x40]
00900 48894424f8                     mov        qword ptr [rsp - 8], rax
00905 8b442464                       mov        eax, dword ptr [rsp + 0x64]
00909 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0090d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00912 48ffb42488000000               push       qword ptr [rsp + 0x88]
0091a 488f442448                     pop        qword ptr [rsp + 0x48]
0091f 48894424f8                     mov        qword ptr [rsp - 8], rax
00924 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00928 89442458                       mov        dword ptr [rsp + 0x58], eax
0092c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00931 48894424f8                     mov        qword ptr [rsp - 8], rax
00936 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0093d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00941 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00946 48894424f8                     mov        qword ptr [rsp - 8], rax
0094b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0094f 89442460                       mov        dword ptr [rsp + 0x60], eax
00953 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00958 48894424f8                     mov        qword ptr [rsp - 8], rax
0095d 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
00964 89442474                       mov        dword ptr [rsp + 0x74], eax
00968 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0096d c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00976 6690                           nop        
00978 c5f877                         vzeroupper 
0097b e8e000b6ff                     call       0x7f4c1b9d7d60
00980 0f1f8400780a0002               nop        dword ptr [rax + rax + 0x2000a78]
00988 413bc3                         cmp        eax, r11d
0098b 0f8ebafdffff                   jle        0x7f4c1be77a4b
00991 be45ffffff                     mov        esi, 0xffffff45
00996 8be8                           mov        ebp, eax
00998 44891c24                       mov        dword ptr [rsp], r11d
0099c c5f877                         vzeroupper 
0099f e8bc00b6ff                     call       0x7f4c1b9d7d60
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 85c0                           test       eax, eax
009ae 7407                           je         0x7f4c1be77cb7
009b0 448d51ff                       lea        r10d, [rcx - 1]
009b4 418bca                         mov        ecx, r10d
009b7 85c9                           test       ecx, ecx
009b9 7479                           je         0x7f4c1be77d34
009bb 83f903                         cmp        ecx, 3
009be 0f8460170000                   je         0x7f4c1be79424
009c4 83f902                         cmp        ecx, 2
009c7 0f870b180000                   ja         0x7f4c1be794d8
009cd 3b4c240c                       cmp        ecx, dword ptr [rsp + 0xc]
009d1 0f83c5150000                   jae        0x7f4c1be7929c
009d7 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
009df 458b448b0c                     mov        r8d, dword ptr [r11 + rcx*4 + 0xc]
009e4 85c9                           test       ecx, ecx
009e6 7e3e                           jle        0x7f4c1be77d26
009e8 448d51ff                       lea        r10d, [rcx - 1]
009ec 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
009f1 0f8371160000                   jae        0x7f4c1be79368
009f7 660f1f840000000000             nop        word ptr [rax + rax]
00a00 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00a08 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
00a0d 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
00a15 458954890c                     mov        dword ptr [r9 + rcx*4 + 0xc], r10d
00a1a 448d51ff                       lea        r10d, [rcx - 1]
00a1e 418bca                         mov        ecx, r10d
00a21 4585d2                         test       r10d, r10d
00a24 7fda                           jg         0x7f4c1be77d00
00a26 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a2e 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00a32 eb0c                           jmp        0x7f4c1be77d40
00a34 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a3c 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
00a40 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
00a48 e93bfdffff                     jmp        0x7f4c1be77a88
00a4d 4183fa10                       cmp        r10d, 0x10
00a51 0f8d9d1c0000                   jge        0x7f4c1be799f4
00a57 4183fa08                       cmp        r10d, 8
00a5b 0f8d51060000                   jge        0x7f4c1be783b2
00a61 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a69 4183fb10                       cmp        r11d, 0x10
00a6d 0f8eb3000000                   jle        0x7f4c1be77e26
00a73 4585c9                         test       r9d, r9d
00a76 0f8cac1b0000                   jl         0x7f4c1be79928
00a7c 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00a84 4585d2                         test       r10d, r10d
00a87 0f8c9b1b0000                   jl         0x7f4c1be79928
00a8d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00a92 443b9c24bc000000               cmp        r11d, dword ptr [rsp + 0xbc]
00a9a 0f82881b0000                   jb         0x7f4c1be79928
00aa0 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
00aa8 4403ac24bc000000               add        r13d, dword ptr [rsp + 0xbc]
00ab0 453bdd                         cmp        r11d, r13d
00ab3 0f826f1b0000                   jb         0x7f4c1be79928
00ab9 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00ac1 4585db                         test       r11d, r11d
00ac4 0f8c5e1b0000                   jl         0x7f4c1be79928
00aca 4585db                         test       r11d, r11d
00acd 0f8473f8ffff                   je         0x7f4c1be77646
00ad3 4883fd20                       cmp        rbp, 0x20
00ad7 772d                           ja         0x7f4c1be77e06
00ad9 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00ae1 4d63d2                         movsxd     r10, r10d
00ae4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00aeb c442a8f5db                     bzhi       r11, r11, r10
00af0 c4c1fb92fb                     kmovq      k7, r11
00af5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00afb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b01 e940f8ffff                     jmp        0x7f4c1be77646
00b06 488bd5                         mov        rdx, rbp
00b09 c5f877                         vzeroupper 
00b0c 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00b16 41ffd2                         call       r10
00b19 0f1f840000000000               nop        dword ptr [rax + rax]
00b21 e920f8ffff                     jmp        0x7f4c1be77646
00b26 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00b2b 0f835b170000                   jae        0x7f4c1be7958c
00b31 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b39 430fbe6c0a0c                   movsx      ebp, byte ptr [r10 + r9 + 0xc]
00b3f 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b47 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00b4c 0f830a180000                   jae        0x7f4c1be7965c
00b52 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00b5a 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b62 43886c130c                     mov        byte ptr [r11 + r10 + 0xc], bpl
00b67 458d5103                       lea        r10d, [r9 + 3]
00b6b 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
00b72 ffc1                           inc        ecx
00b74 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b79 0f8389180000                   jae        0x7f4c1be79708
00b7f 4d63d9                         movsxd     r11, r9d
00b82 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b8a 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00b90 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b98 4183c203                       add        r10d, 3
00b9c 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00ba1 0f8325190000                   jae        0x7f4c1be797cc
00ba7 4c639424bc000000               movsxd     r10, dword ptr [rsp + 0xbc]
00baf 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00bb7 43886c100d                     mov        byte ptr [r8 + r10 + 0xd], bpl
00bbc 470fbe44180e                   movsx      r8d, byte ptr [r8 + r11 + 0xe]
00bc2 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00bca 468844110e                     mov        byte ptr [rcx + r10 + 0xe], r8b
00bcf 460fbe5c190f                   movsx      r11d, byte ptr [rcx + r11 + 0xf]
00bd5 46885c110f                     mov        byte ptr [rcx + r10 + 0xf], r11b
00bda 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00be2 4183fb08                       cmp        r11d, 8
00be6 0f8394190000                   jae        0x7f4c1be79880
00bec 458bc1                         mov        r8d, r9d
00bef 49bae0df2fe300000000           movabs     r10, 0xe32fdfe0
00bf9 4703449a0c                     add        r8d, dword ptr [r10 + r11*4 + 0xc]
00bfe 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c03 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00c0b 4183fa04                       cmp        r10d, 4
00c0f 7e43                           jle        0x7f4c1be77f54
00c11 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00c18 83c504                         add        ebp, 4
00c1b 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c23 418bd0                         mov        edx, r8d
00c26 6690                           nop        
00c28 c5f877                         vzeroupper 
00c2b e83089a9ff                     call       0x7f4c1b910860
00c30 0f1f8400280d0004               nop        dword ptr [rax + rax + 0x4000d28]
00c38 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c40 8bd5                           mov        edx, ebp
00c42 8bc8                           mov        ecx, eax
00c44 c5f877                         vzeroupper 
00c47 e81489a9ff                     call       0x7f4c1b910860
00c4c 0f1f8400440d0005               nop        dword ptr [rax + rax + 0x5000d44]
00c54 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00c5c 4183fb08                       cmp        r11d, 8
00c60 7e62                           jle        0x7f4c1be77fc4
00c62 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00c66 49ba10e02fe300000000           movabs     r10, 0xe32fe010
00c70 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
00c78 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00c7d 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00c84 83c508                         add        ebp, 8
00c87 83c208                         add        edx, 8
00c8a 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c92 6690                           nop        
00c94 c5f877                         vzeroupper 
00c97 e8c488a9ff                     call       0x7f4c1b910860
00c9c 0f1f8400940d0006               nop        dword ptr [rax + rax + 0x6000d94]
00ca4 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cac 8bd5                           mov        edx, ebp
00cae 488bc8                         mov        rcx, rax
00cb1 666690                         nop        
00cb4 c5f877                         vzeroupper 
00cb7 e8a488a9ff                     call       0x7f4c1b910860
00cbc 0f1f8400b40d0007               nop        dword ptr [rax + rax + 0x7000db4]
00cc4 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00ccb e9d3f9ffff                     jmp        0x7f4c1be779a3
00cd0 4d63d3                         movsxd     r10, r11d
00cd3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cda c442a8f5db                     bzhi       r11, r11, r10
00cdf c4c1fb92fb                     kmovq      k7, r11
00ce4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cea 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cf0 eb67                           jmp        0x7f4c1be78059
00cf2 4585f6                         test       r14d, r14d
00cf5 0f8c351b0000                   jl         0x7f4c1be79b30
00cfb 85db                           test       ebx, ebx
00cfd 0f8c2d1b0000                   jl         0x7f4c1be79b30
00d03 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00d08 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00d0d 0f821d1b0000                   jb         0x7f4c1be79b30
00d13 428d2c1b                       lea        ebp, [rbx + r11]
00d17 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d1c 443bc5                         cmp        r8d, ebp
00d1f 0f820b1b0000                   jb         0x7f4c1be79b30
00d25 4585db                         test       r11d, r11d
00d28 0f8c021b0000                   jl         0x7f4c1be79b30
00d2e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d33 453bd6                         cmp        r10d, r14d
00d36 7421                           je         0x7f4c1be78059
00d38 4963d3                         movsxd     rdx, r11d
00d3b 4883fa20                       cmp        rdx, 0x20
00d3f 768f                           jbe        0x7f4c1be77fd0
00d41 c5f877                         vzeroupper 
00d44 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00d4e 41ffd2                         call       r10
00d51 0f1f840000000000               nop        dword ptr [rax + rax]
00d59 4c8b1424                       mov        r10, qword ptr [rsp]
00d5d 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00d61 c5f877                         vzeroupper 
00d64 4881c4f0000000                 add        rsp, 0xf0
00d6b 5d                             pop        rbp
00d6c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d70 0f87ee210000                   ja         0x7f4c1be7a264
00d76 c3                             ret        
00d77 83f830                         cmp        eax, 0x30
00d7a 0f8e83000000                   jle        0x7f4c1be78103
00d80 4585f6                         test       r14d, r14d
00d83 0f8c631f0000                   jl         0x7f4c1be79fec
00d89 85db                           test       ebx, ebx
00d8b 0f8c5b1f0000                   jl         0x7f4c1be79fec
00d91 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00d96 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00d9e 0f82481f0000                   jb         0x7f4c1be79fec
00da4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00da9 453bd5                         cmp        r10d, r13d
00dac 0f823a1f0000                   jb         0x7f4c1be79fec
00db2 85c0                           test       eax, eax
00db4 7426                           je         0x7f4c1be780dc
00db6 4883fa20                       cmp        rdx, 0x20
00dba 772d                           ja         0x7f4c1be780e9
00dbc 4c63d0                         movsxd     r10, eax
00dbf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dc6 c442a8f5db                     bzhi       r11, r11, r10
00dcb c4c1fb92fb                     kmovq      k7, r11
00dd0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dd6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ddc 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
00de4 e95dfaffff                     jmp        0x7f4c1be77b46
00de9 c5f877                         vzeroupper 
00dec 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00df6 41ffd2                         call       r10
00df9 0f1f840000000000               nop        dword ptr [rax + rax]
00e01 ebd9                           jmp        0x7f4c1be780dc
00e03 443bb424ac000000               cmp        r14d, dword ptr [rsp + 0xac]
00e0b 0f83171d0000                   jae        0x7f4c1be79e28
00e11 4d63d6                         movsxd     r10, r14d
00e14 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00e1c c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00e23 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
00e2a 0f83cc1d0000                   jae        0x7f4c1be79efc
00e30 8d5310                         lea        edx, [rbx + 0x10]
00e33 4c63db                         movsxd     r11, ebx
00e36 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00e3e c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00e45 413bd5                         cmp        edx, r13d
00e48 0f8d4b020000                   jge        0x7f4c1be78399
00e4e 4d2bd3                         sub        r10, r11
00e51 4c63ca                         movsxd     r9, edx
00e54 48634c241c                     movsxd     rcx, dword ptr [rsp + 0x1c]
00e59 4883c1f1                       add        rcx, -0xf
00e5d 4f8d1c11                       lea        r11, [r9 + r10]
00e61 4c3bd9                         cmp        r11, rcx
00e64 0f835a1f0000                   jae        0x7f4c1be7a0c4
00e6a 4d63dd                         movsxd     r11, r13d
00e6d 498bfb                         mov        rdi, r11
00e70 492bf9                         sub        rdi, r9
00e73 4883c70f                       add        rdi, 0xf
00e77 4883e7f0                       and        rdi, 0xfffffffffffffff0
00e7b 448bcf                         mov        r9d, edi
00e7e 458d4c1910                     lea        r9d, [r9 + rbx + 0x10]
00e83 4d63c9                         movsxd     r9, r9d
00e86 4f8d5411f0                     lea        r10, [r9 + r10 - 0x10]
00e8b 4c3bd1                         cmp        r10, rcx
00e8e 0f83301f0000                   jae        0x7f4c1be7a0c4
00e94 3b942484000000                 cmp        edx, dword ptr [rsp + 0x84]
00e9b 0f83231f0000                   jae        0x7f4c1be7a0c4
00ea1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ea6 4983c2f1                       add        r10, -0xf
00eaa 4983c1f0                       add        r9, -0x10
00eae 4d3bca                         cmp        r9, r10
00eb1 0f830d1f0000                   jae        0x7f4c1be7a0c4
00eb7 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00ebe 0f8fb41f0000                   jg         0x7f4c1be7a178
00ec4 458bce                         mov        r9d, r14d
00ec7 442bcb                         sub        r9d, ebx
00eca 83c320                         add        ebx, 0x20
00ecd 666690                         nop        
00ed0 448bd2                         mov        r10d, edx
00ed3 458d0411                       lea        r8d, [r9 + rdx]
00ed7 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00edf c4a17a6f44010c                 vmovdqu    xmm0, xmmword ptr [rcx + r8 + 0xc]
00ee6 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00eee c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
00ef5 448d5210                       lea        r10d, [rdx + 0x10]
00ef9 418bd2                         mov        edx, r10d
00efc 443bd3                         cmp        r10d, ebx
00eff 7ccf                           jl         0x7f4c1be781d0
00f01 4981c310ffffff                 add        r11, -0xf0
00f08 4981fb00000080                 cmp        r11, -0x80000000
00f0f 49c7c000000080                 mov        r8, 0xffffffff80000000
00f16 4d0f4cd8                       cmovl      r11, r8
00f1a 458bc3                         mov        r8d, r11d
00f1d 453bd0                         cmp        r10d, r8d
00f20 0f8d3f010000                   jge        0x7f4c1be78365
00f26 418bd2                         mov        edx, r10d
00f29 0f1f8000000000                 nop        dword ptr [rax]
00f30 448bd2                         mov        r10d, edx
00f33 4d63d2                         movsxd     r10, r10d
00f36 448bda                         mov        r11d, edx
00f39 418d1c11                       lea        ebx, [r9 + rdx]
00f3d 8bcb                           mov        ecx, ebx
00f3f 488bbc2490000000               mov        rdi, qword ptr [rsp + 0x90]
00f47 c5fa6f441f0c                   vmovdqu    xmm0, xmmword ptr [rdi + rbx + 0xc]
00f4d 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00f55 c4a17a7f441b0c                 vmovdqu    xmmword ptr [rbx + r11 + 0xc], xmm0
00f5c 4863c9                         movsxd     rcx, ecx
00f5f c5fa6f440f1c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x1c]
00f65 c4a17a7f44131c                 vmovdqu    xmmword ptr [rbx + r10 + 0x1c], xmm0
00f6c c5fa6f440f2c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x2c]
00f72 c4a17a7f44132c                 vmovdqu    xmmword ptr [rbx + r10 + 0x2c], xmm0
00f79 c5fa6f440f3c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x3c]
00f7f c4a17a7f44133c                 vmovdqu    xmmword ptr [rbx + r10 + 0x3c], xmm0
00f86 c5fa6f440f4c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x4c]
00f8c c4a17a7f44134c                 vmovdqu    xmmword ptr [rbx + r10 + 0x4c], xmm0
00f93 c5fa6f440f5c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x5c]
00f99 c4a17a7f44135c                 vmovdqu    xmmword ptr [rbx + r10 + 0x5c], xmm0
00fa0 c5fa6f440f6c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x6c]
00fa6 c4a17a7f44136c                 vmovdqu    xmmword ptr [rbx + r10 + 0x6c], xmm0
00fad c5fa6f440f7c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x7c]
00fb3 c4a17a7f44137c                 vmovdqu    xmmword ptr [rbx + r10 + 0x7c], xmm0
00fba c5fa6f840f8c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x8c]
00fc3 c4a17a7f84138c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x8c], xmm0
00fcd c5fa6f840f9c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x9c]
00fd6 c4a17a7f84139c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x9c], xmm0
00fe0 c5fa6f840fac000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xac]
00fe9 c4a17a7f8413ac000000           vmovdqu    xmmword ptr [rbx + r10 + 0xac], xmm0
00ff3 c5fa6f840fbc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xbc]
00ffc c4a17a7f8413bc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xbc], xmm0
01006 c5fa6f840fcc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xcc]
0100f c4a17a7f8413cc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xcc], xmm0
01019 c5fa6f840fdc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xdc]
01022 c4a17a7f8413dc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xdc], xmm0
0102c c5fa6f840fec000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xec]
01035 c4a17a7f8413ec000000           vmovdqu    xmmword ptr [rbx + r10 + 0xec], xmm0
0103f c5fa6f840ffc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xfc]
01048 c4a17a7f8413fc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xfc], xmm0
01052 448d9200010000                 lea        r10d, [rdx + 0x100]
01059 418bd2                         mov        edx, r10d
0105c 453bd0                         cmp        r10d, r8d
0105f 0f8ccbfeffff                   jl         0x7f4c1be78230
01065 413bd5                         cmp        edx, r13d
01068 7d2f                           jge        0x7f4c1be78399
0106a 6690                           nop        
0106c 458d1411                       lea        r10d, [r9 + rdx]
01070 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01078 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
0107f 448bda                         mov        r11d, edx
01082 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0108a c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
01091 83c210                         add        edx, 0x10
01094 413bd5                         cmp        edx, r13d
01097 7cd3                           jl         0x7f4c1be7836c
01099 468d1430                       lea        r10d, [rax + r14]
0109d 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
010a5 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
010ad e994f7ffff                     jmp        0x7f4c1be77b46
010b2 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
010ba 0f8398170000                   jae        0x7f4c1be79b58
010c0 4963f9                         movsxd     rdi, r9d
010c3 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
010cb 4d8b543a0c                     mov        r10, qword ptr [r10 + rdi + 0xc]
010d0 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
010d7 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
010de 0f8334180000                   jae        0x7f4c1be79c18
010e4 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
010ec 418d4b08                       lea        ecx, [r11 + 8]
010f0 4963db                         movsxd     rbx, r11d
010f3 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
010fb 4c89541a0c                     mov        qword ptr [rdx + rbx + 0xc], r10
01100 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
01107 0f8d0c030000                   jge        0x7f4c1be78719
0110d 482bfb                         sub        rdi, rbx
01110 4863d1                         movsxd     rdx, ecx
01113 4c8d143a                       lea        r10, [rdx + rdi]
01117 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0111c 0f83be180000                   jae        0x7f4c1be79ce0
01122 4d8bd0                         mov        r10, r8
01125 4c2bd2                         sub        r10, rdx
01128 4983c207                       add        r10, 7
0112c 4983e2f8                       and        r10, 0xfffffffffffffff8
01130 458bd2                         mov        r10d, r10d
01133 438d5c1a08                     lea        ebx, [r10 + r11 + 8]
01138 4c63d3                         movsxd     r10, ebx
0113b 498d5c3af8                     lea        rbx, [r10 + rdi - 8]
01140 483b5c2438                     cmp        rbx, qword ptr [rsp + 0x38]
01145 0f8395180000                   jae        0x7f4c1be79ce0
0114b 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
01152 0f8388180000                   jae        0x7f4c1be79ce0
01158 4983c2f8                       add        r10, -8
0115c 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01161 0f8379180000                   jae        0x7f4c1be79ce0
01167 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0116f 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01176 0f8f10190000                   jg         0x7f4c1be79d8c
0117c 452bcb                         sub        r9d, r11d
0117f b8f4ffffff                     mov        eax, 0xfffffff4
01184 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0118c 498bf2                         mov        rsi, r10
0118f 4d8d50c8                       lea        r10, [r8 - 0x38]
01193 4981fa00000080                 cmp        r10, -0x80000000
0119a 48c7c300000080                 mov        rbx, 0xffffffff80000000
011a1 4c0f4cd3                       cmovl      r10, rbx
011a5 418bfa                         mov        edi, r10d
011a8 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
011b0 458bd2                         mov        r10d, r10d
011b3 412bc2                         sub        eax, r10d
011b6 412bc3                         sub        eax, r11d
011b9 4183c310                       add        r11d, 0x10
011bd 418bdb                         mov        ebx, r11d
011c0 83c0f0                         add        eax, -0x10
011c3 4d63d3                         movsxd     r10, r11d
011c6 41bb06000000                   mov        r11d, 6
011cc c462a0f5d8                     bzhi       r11, rax, r11
011d1 4d03d3                         add        r10, r11
011d4 4d3bd0                         cmp        r10, r8
011d7 498bc0                         mov        rax, r8
011da 490f4cc2                       cmovl      rax, r10
011de 4c8bd0                         mov        r10, rax
011e1 4c2bd2                         sub        r10, rdx
011e4 4d8d5aff                       lea        r11, [r10 - 1]
011e8 49c1fb3f                       sar        r11, 0x3f
011ec 49c1eb3d                       shr        r11, 0x3d
011f0 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
011f5 4983e2f8                       and        r10, 0xfffffffffffffff8
011f9 4c03d2                         add        r10, rdx
011fc 493bd2                         cmp        rdx, r10
011ff 490f4cd2                       cmovl      rdx, r10
01203 448bd2                         mov        r10d, edx
01206 418d5208                       lea        edx, [r10 + 8]
0120a 442b9424b4000000               sub        r10d, dword ptr [rsp + 0xb4]
01212 4863ea                         movsxd     rbp, edx
01215 4803ee                         add        rbp, rsi
01218 4183c208                       add        r10d, 8
0121c 4963d2                         movsxd     rdx, r10d
0121f 4803d6                         add        rdx, rsi
01222 4c8d5d4c                       lea        r11, [rbp + 0x4c]
01226 4883c50c                       add        rbp, 0xc
0122a 488d720c                       lea        rsi, [rdx + 0xc]
0122e 4533d2                         xor        r10d, r10d
01231 4c3bde                         cmp        r11, rsi
01234 410f96c2                       setbe      r10b
01238 4883c24c                       add        rdx, 0x4c
0123c 4533db                         xor        r11d, r11d
0123f 483bd5                         cmp        rdx, rbp
01242 410f96c3                       setbe      r11b
01246 450bd3                         or         r10d, r11d
01249 0f84410c0000                   je         0x7f4c1be79190
0124f 448bd8                         mov        r11d, eax
01252 6690                           nop        
01254 418d1c09                       lea        ebx, [r9 + rcx]
01258 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01260 4d8b541a0c                     mov        r10, qword ptr [r10 + rbx + 0xc]
01265 8bd1                           mov        edx, ecx
01267 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
0126f 4c8954130c                     mov        qword ptr [rbx + rdx + 0xc], r10
01274 83c108                         add        ecx, 8
01277 413bcb                         cmp        ecx, r11d
0127a 7cd8                           jl         0x7f4c1be78554
0127c 4981c008feffff                 add        r8, -0x1f8
01283 4981f800000080                 cmp        r8, -0x80000000
0128a 49c7c200000080                 mov        r10, 0xffffffff80000000
01291 4d0f4cc2                       cmovl      r8, r10
01295 418bf0                         mov        esi, r8d
01298 3bce                           cmp        ecx, esi
0129a 0f8d40010000                   jge        0x7f4c1be786e0
012a0 458d1c09                       lea        r11d, [r9 + rcx]
012a4 8d9900010000                   lea        ebx, [rcx + 0x100]
012aa 4103d9                         add        ebx, r9d
012ad 458bd3                         mov        r10d, r11d
012b0 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
012b8 62917e486f84100c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc]
012c3 4963d3                         movsxd     rdx, r11d
012c6 448bd3                         mov        r10d, ebx
012c9 4863db                         movsxd     rbx, ebx
012cc 448bc1                         mov        r8d, ecx
012cf 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
012d7 62917e487f84030c000000         vmovdqu32  zmmword ptr [r11 + r8 + 0xc], zmm0
012e2 62d17e486f84134c000000         vmovdqu32  zmm0, zmmword ptr [r11 + rdx + 0x4c]
012ed 448bd9                         mov        r11d, ecx
012f0 4963c3                         movsxd     rax, r11d
012f3 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
012fb 62d17e487f84034c000000         vmovdqu32  zmmword ptr [r11 + rax + 0x4c], zmm0
01306 448d8180000000                 lea        r8d, [rcx + 0x80]
0130d 4503c1                         add        r8d, r9d
01310 418be8                         mov        ebp, r8d
01313 62917e486f84030c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 0xc]
0131e 62d17e487f84038c000000         vmovdqu32  zmmword ptr [r11 + rax + 0x8c], zmm0
01329 4c63dd                         movsxd     r11, ebp
0132c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01334 62917e486f84184c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 0x4c]
0133f 62d17e487f8400cc000000         vmovdqu32  zmmword ptr [r8 + rax + 0xcc], zmm0
0134a 62917e486f84100c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc]
01355 62d17e487f84000c010000         vmovdqu32  zmmword ptr [r8 + rax + 0x10c], zmm0
01360 62d17e486f84184c000000         vmovdqu32  zmm0, zmmword ptr [r8 + rbx + 0x4c]
0136b 62d17e487f84004c010000         vmovdqu32  zmmword ptr [r8 + rax + 0x14c], zmm0
01376 62d17e486f84108c010000         vmovdqu32  zmm0, zmmword ptr [r8 + rdx + 0x18c]
01381 62d17e487f84008c010000         vmovdqu32  zmmword ptr [r8 + rax + 0x18c], zmm0
0138c 62d17e486f8410cc010000         vmovdqu32  zmm0, zmmword ptr [r8 + rdx + 0x1cc]
01397 62d17e487f8400cc010000         vmovdqu32  zmmword ptr [r8 + rax + 0x1cc], zmm0
013a2 81c100020000                   add        ecx, 0x200
013a8 3bce                           cmp        ecx, esi
013aa 0f8cf0feffff                   jl         0x7f4c1be785a0
013b0 3bcf                           cmp        ecx, edi
013b2 7d2c                           jge        0x7f4c1be786e0
013b4 458d1409                       lea        r10d, [r9 + rcx]
013b8 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
013c0 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
013cb 448bd1                         mov        r10d, ecx
013ce 62917e487f84130c000000         vmovdqu32  zmmword ptr [r11 + r10 + 0xc], zmm0
013d9 83c140                         add        ecx, 0x40
013dc 3bcf                           cmp        ecx, edi
013de 7cd4                           jl         0x7f4c1be786b4
013e0 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
013e7 7d30                           jge        0x7f4c1be78719
013e9 666690                         nop        
013ec 458d1409                       lea        r10d, [r9 + rcx]
013f0 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
013f8 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
013fd 448bd9                         mov        r11d, ecx
01400 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01408 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
0140d 83c108                         add        ecx, 8
01410 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
01417 7cd3                           jl         0x7f4c1be786ec
01419 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01420 e97ef2ffff                     jmp        0x7f4c1be779a3
01425 bee4ffffff                     mov        esi, 0xffffffe4
0142a 488b2c24                       mov        rbp, qword ptr [rsp]
0142e 48894424f8                     mov        qword ptr [rsp - 8], rax
01433 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01437 89442408                       mov        dword ptr [rsp + 8], eax
0143b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01440 48ff742420                     push       qword ptr [rsp + 0x20]
01445 488f442418                     pop        qword ptr [rsp + 0x18]
0144a 48894424f8                     mov        qword ptr [rsp - 8], rax
0144f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01453 8944240c                       mov        dword ptr [rsp + 0xc], eax
01457 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145c 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01460 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01465 48894424f8                     mov        qword ptr [rsp - 8], rax
0146a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0146e 89442438                       mov        dword ptr [rsp + 0x38], eax
01472 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01477 48ff742468                     push       qword ptr [rsp + 0x68]
0147c 488f442440                     pop        qword ptr [rsp + 0x40]
01481 48894424f8                     mov        qword ptr [rsp - 8], rax
01486 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0148a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0148e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01493 90                             nop        
01494 c5f877                         vzeroupper 
01497 e8c4f5b5ff                     call       0x7f4c1b9d7d60
0149c 0f1f840094150008               nop        dword ptr [rax + rax + 0x8001594]
014a4 bee4ffffff                     mov        esi, 0xffffffe4
014a9 488b2c24                       mov        rbp, qword ptr [rsp]
014ad 48894424f8                     mov        qword ptr [rsp - 8], rax
014b2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014b6 89442408                       mov        dword ptr [rsp + 8], eax
014ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bf 48ff742420                     push       qword ptr [rsp + 0x20]
014c4 488f442418                     pop        qword ptr [rsp + 0x18]
014c9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ce 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014d2 8944240c                       mov        dword ptr [rsp + 0xc], eax
014d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014db 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014df 48894424f8                     mov        qword ptr [rsp - 8], rax
014e4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014e8 89442438                       mov        dword ptr [rsp + 0x38], eax
014ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f1 48ff742468                     push       qword ptr [rsp + 0x68]
014f6 488f442440                     pop        qword ptr [rsp + 0x40]
014fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01500 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01504 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01508 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150d 48ff742478                     push       qword ptr [rsp + 0x78]
01512 488f442450                     pop        qword ptr [rsp + 0x50]
01517 48894424f8                     mov        qword ptr [rsp - 8], rax
0151c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01520 89442458                       mov        dword ptr [rsp + 0x58], eax
01524 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01529 48894424f8                     mov        qword ptr [rsp - 8], rax
0152e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01532 89442460                       mov        dword ptr [rsp + 0x60], eax
01536 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153b 89442464                       mov        dword ptr [rsp + 0x64], eax
0153f 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01544 c5f877                         vzeroupper 
01547 e814f5b5ff                     call       0x7f4c1b9d7d60
0154c 0f1f840044160009               nop        dword ptr [rax + rax + 0x9001644]
01554 bee4ffffff                     mov        esi, 0xffffffe4
01559 488b2c24                       mov        rbp, qword ptr [rsp]
0155d 48894424f8                     mov        qword ptr [rsp - 8], rax
01562 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01566 89442408                       mov        dword ptr [rsp + 8], eax
0156a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156f 48ff742420                     push       qword ptr [rsp + 0x20]
01574 488f442418                     pop        qword ptr [rsp + 0x18]
01579 48894424f8                     mov        qword ptr [rsp - 8], rax
0157e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01582 8944240c                       mov        dword ptr [rsp + 0xc], eax
01586 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0158b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01590 48894424f8                     mov        qword ptr [rsp - 8], rax
01595 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01599 89442438                       mov        dword ptr [rsp + 0x38], eax
0159d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015a2 48ff742468                     push       qword ptr [rsp + 0x68]
015a7 488f442440                     pop        qword ptr [rsp + 0x40]
015ac 48894424f8                     mov        qword ptr [rsp - 8], rax
015b1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015b5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015be 48ffb42488000000               push       qword ptr [rsp + 0x88]
015c6 488f442448                     pop        qword ptr [rsp + 0x48]
015cb 48ff742478                     push       qword ptr [rsp + 0x78]
015d0 488f442450                     pop        qword ptr [rsp + 0x50]
015d5 48894424f8                     mov        qword ptr [rsp - 8], rax
015da 8b442474                       mov        eax, dword ptr [rsp + 0x74]
015de 89442458                       mov        dword ptr [rsp + 0x58], eax
015e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e7 48894424f8                     mov        qword ptr [rsp - 8], rax
015ec 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
015f3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
015f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01601 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01605 89442460                       mov        dword ptr [rsp + 0x60], eax
01609 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160e 89442464                       mov        dword ptr [rsp + 0x64], eax
01612 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01616 48894424f8                     mov        qword ptr [rsp - 8], rax
0161b 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01622 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01626 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01634 c5f877                         vzeroupper 
01637 e824f4b5ff                     call       0x7f4c1b9d7d60
0163c 0f1f84003417000a               nop        dword ptr [rax + rax + 0xa001734]
01644 bee4ffffff                     mov        esi, 0xffffffe4
01649 488b2c24                       mov        rbp, qword ptr [rsp]
0164d 48894424f8                     mov        qword ptr [rsp - 8], rax
01652 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01656 89442408                       mov        dword ptr [rsp + 8], eax
0165a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165f 48ff742420                     push       qword ptr [rsp + 0x20]
01664 488f442418                     pop        qword ptr [rsp + 0x18]
01669 48894424f8                     mov        qword ptr [rsp - 8], rax
0166e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01672 8944240c                       mov        dword ptr [rsp + 0xc], eax
01676 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167b 48894424f8                     mov        qword ptr [rsp - 8], rax
01680 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01684 89442438                       mov        dword ptr [rsp + 0x38], eax
01688 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0168d 48ff742468                     push       qword ptr [rsp + 0x68]
01692 488f442440                     pop        qword ptr [rsp + 0x40]
01697 48894424f8                     mov        qword ptr [rsp - 8], rax
0169c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
016a0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a9 48894424f8                     mov        qword ptr [rsp - 8], rax
016ae 8b442474                       mov        eax, dword ptr [rsp + 0x74]
016b2 89442458                       mov        dword ptr [rsp + 0x58], eax
016b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016bb 48894424f8                     mov        qword ptr [rsp - 8], rax
016c0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
016c4 89442460                       mov        dword ptr [rsp + 0x60], eax
016c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016cd 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
016d2 6690                           nop        
016d4 c5f877                         vzeroupper 
016d7 e884f3b5ff                     call       0x7f4c1b9d7d60
016dc 0f1f8400d417000b               nop        dword ptr [rax + rax + 0xb0017d4]
016e4 be45ffffff                     mov        esi, 0xffffff45
016e9 488b2c24                       mov        rbp, qword ptr [rsp]
016ed 4c89542408                     mov        qword ptr [rsp + 8], r10
016f2 6690                           nop        
016f4 c5f877                         vzeroupper 
016f7 e864f3b5ff                     call       0x7f4c1b9d7d60
016fc 0f1f8400f417000c               nop        dword ptr [rax + rax + 0xc0017f4]
01704 be45ffffff                     mov        esi, 0xffffff45
01709 488b2c24                       mov        rbp, qword ptr [rsp]
0170d 48894424f8                     mov        qword ptr [rsp - 8], rax
01712 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01716 89442408                       mov        dword ptr [rsp + 8], eax
0171a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171f 48ff742420                     push       qword ptr [rsp + 0x20]
01724 488f442418                     pop        qword ptr [rsp + 0x18]
01729 48894424f8                     mov        qword ptr [rsp - 8], rax
0172e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01732 8944240c                       mov        dword ptr [rsp + 0xc], eax
01736 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0173f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01744 48894424f8                     mov        qword ptr [rsp - 8], rax
01749 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0174d 89442438                       mov        dword ptr [rsp + 0x38], eax
01751 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01756 48ff742468                     push       qword ptr [rsp + 0x68]
0175b 488f442440                     pop        qword ptr [rsp + 0x40]
01760 48894424f8                     mov        qword ptr [rsp - 8], rax
01765 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01769 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0176d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01772 89442464                       mov        dword ptr [rsp + 0x64], eax
01776 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0177b 90                             nop        
0177c c5f877                         vzeroupper 
0177f e8dcf2b5ff                     call       0x7f4c1b9d7d60
01784 0f1f84007c18000d               nop        dword ptr [rax + rax + 0xd00187c]
0178c 493bea                         cmp        rbp, r10
0178f bdffffffff                     mov        ebp, 0xffffffff
01794 7c08                           jl         0x7f4c1be78a9e
01796 400f95c5                       setne      bpl
0179a 400fb6ed                       movzx      ebp, bpl
0179e be45ffffff                     mov        esi, 0xffffff45
017a3 48894424f8                     mov        qword ptr [rsp - 8], rax
017a8 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017ac 89442414                       mov        dword ptr [rsp + 0x14], eax
017b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b5 895c2438                       mov        dword ptr [rsp + 0x38], ebx
017b9 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
017be 48894424f8                     mov        qword ptr [rsp - 8], rax
017c3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017c7 89442440                       mov        dword ptr [rsp + 0x40], eax
017cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d0 48ff742468                     push       qword ptr [rsp + 0x68]
017d5 488f442448                     pop        qword ptr [rsp + 0x48]
017da 48894424f8                     mov        qword ptr [rsp - 8], rax
017df 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017e3 89442444                       mov        dword ptr [rsp + 0x44], eax
017e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ec 48ff742478                     push       qword ptr [rsp + 0x78]
017f1 488f442458                     pop        qword ptr [rsp + 0x58]
017f6 48894424f8                     mov        qword ptr [rsp - 8], rax
017fb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017ff 89442460                       mov        dword ptr [rsp + 0x60], eax
01803 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01808 48894424f8                     mov        qword ptr [rsp - 8], rax
0180d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01811 89442468                       mov        dword ptr [rsp + 0x68], eax
01815 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0181e 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01823 90                             nop        
01824 c5f877                         vzeroupper 
01827 e834f2b5ff                     call       0x7f4c1b9d7d60
0182c 0f1f84002419000e               nop        dword ptr [rax + rax + 0xe001924]
01834 be45ffffff                     mov        esi, 0xffffff45
01839 488b2c24                       mov        rbp, qword ptr [rsp]
0183d 48894424f8                     mov        qword ptr [rsp - 8], rax
01842 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01846 89442408                       mov        dword ptr [rsp + 8], eax
0184a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184f 48ff742420                     push       qword ptr [rsp + 0x20]
01854 488f442418                     pop        qword ptr [rsp + 0x18]
01859 48894424f8                     mov        qword ptr [rsp - 8], rax
0185e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01862 8944240c                       mov        dword ptr [rsp + 0xc], eax
01866 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0186f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01874 48894424f8                     mov        qword ptr [rsp - 8], rax
01879 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0187d 89442438                       mov        dword ptr [rsp + 0x38], eax
01881 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01886 48ff742468                     push       qword ptr [rsp + 0x68]
0188b 488f442440                     pop        qword ptr [rsp + 0x40]
01890 48894424f8                     mov        qword ptr [rsp - 8], rax
01895 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01899 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0189d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018a2 48894424f8                     mov        qword ptr [rsp - 8], rax
018a7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018ab 89442460                       mov        dword ptr [rsp + 0x60], eax
018af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b4 89442464                       mov        dword ptr [rsp + 0x64], eax
018b8 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
018bd 666690                         nop        
018c0 c5f877                         vzeroupper 
018c3 e898f1b5ff                     call       0x7f4c1b9d7d60
018c8 0f1f8400c019000f               nop        dword ptr [rax + rax + 0xf0019c0]
018d0 be45ffffff                     mov        esi, 0xffffff45
018d5 488b2c24                       mov        rbp, qword ptr [rsp]
018d9 48894424f8                     mov        qword ptr [rsp - 8], rax
018de 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018e2 89442408                       mov        dword ptr [rsp + 8], eax
018e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018eb 48ff742420                     push       qword ptr [rsp + 0x20]
018f0 488f442418                     pop        qword ptr [rsp + 0x18]
018f5 48894424f8                     mov        qword ptr [rsp - 8], rax
018fa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018fe 8944240c                       mov        dword ptr [rsp + 0xc], eax
01902 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01907 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0190b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01910 48894424f8                     mov        qword ptr [rsp - 8], rax
01915 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01919 89442438                       mov        dword ptr [rsp + 0x38], eax
0191d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01922 48ff742468                     push       qword ptr [rsp + 0x68]
01927 488f442440                     pop        qword ptr [rsp + 0x40]
0192c 48894424f8                     mov        qword ptr [rsp - 8], rax
01931 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01935 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01939 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193e 48894424f8                     mov        qword ptr [rsp - 8], rax
01943 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01947 89442458                       mov        dword ptr [rsp + 0x58], eax
0194b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01950 48894424f8                     mov        qword ptr [rsp - 8], rax
01955 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01959 89442460                       mov        dword ptr [rsp + 0x60], eax
0195d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01962 89442464                       mov        dword ptr [rsp + 0x64], eax
01966 6690                           nop        
01968 c5f877                         vzeroupper 
0196b e8f0f0b5ff                     call       0x7f4c1b9d7d60
01970 0f1f8400681a0010               nop        dword ptr [rax + rax + 0x10001a68]
01978 bee4ffffff                     mov        esi, 0xffffffe4
0197d 488b2c24                       mov        rbp, qword ptr [rsp]
01981 48894424f8                     mov        qword ptr [rsp - 8], rax
01986 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0198a 89442408                       mov        dword ptr [rsp + 8], eax
0198e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01993 48ff742420                     push       qword ptr [rsp + 0x20]
01998 488f442418                     pop        qword ptr [rsp + 0x18]
0199d 48894424f8                     mov        qword ptr [rsp - 8], rax
019a2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019a6 8944240c                       mov        dword ptr [rsp + 0xc], eax
019aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019af 48894424f8                     mov        qword ptr [rsp - 8], rax
019b4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019b8 89442438                       mov        dword ptr [rsp + 0x38], eax
019bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c1 48ff742468                     push       qword ptr [rsp + 0x68]
019c6 488f442440                     pop        qword ptr [rsp + 0x40]
019cb 48894424f8                     mov        qword ptr [rsp - 8], rax
019d0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
019d4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dd 48ffb42488000000               push       qword ptr [rsp + 0x88]
019e5 488f442448                     pop        qword ptr [rsp + 0x48]
019ea 48ff742478                     push       qword ptr [rsp + 0x78]
019ef 488f442450                     pop        qword ptr [rsp + 0x50]
019f4 48894424f8                     mov        qword ptr [rsp - 8], rax
019f9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019fd 89442458                       mov        dword ptr [rsp + 0x58], eax
01a01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a06 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01a12 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a20 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a24 89442460                       mov        dword ptr [rsp + 0x60], eax
01a28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2d 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01a35 666690                         nop        
01a38 c5f877                         vzeroupper 
01a3b e820f0b5ff                     call       0x7f4c1b9d7d60
01a40 0f1f8400381b0011               nop        dword ptr [rax + rax + 0x11001b38]
01a48 bee4ffffff                     mov        esi, 0xffffffe4
01a4d 488b2c24                       mov        rbp, qword ptr [rsp]
01a51 48894424f8                     mov        qword ptr [rsp - 8], rax
01a56 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a5a 89442408                       mov        dword ptr [rsp + 8], eax
01a5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a63 48ff742420                     push       qword ptr [rsp + 0x20]
01a68 488f442418                     pop        qword ptr [rsp + 0x18]
01a6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01a72 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a76 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a84 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a88 89442438                       mov        dword ptr [rsp + 0x38], eax
01a8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a91 48ff742468                     push       qword ptr [rsp + 0x68]
01a96 488f442440                     pop        qword ptr [rsp + 0x40]
01a9b 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01aa4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01aa8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aad 48ffb42488000000               push       qword ptr [rsp + 0x88]
01ab5 488f442448                     pop        qword ptr [rsp + 0x48]
01aba 48ff742478                     push       qword ptr [rsp + 0x78]
01abf 488f442450                     pop        qword ptr [rsp + 0x50]
01ac4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01acd 89442458                       mov        dword ptr [rsp + 0x58], eax
01ad1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad6 48894424f8                     mov        qword ptr [rsp - 8], rax
01adb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01ae2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ae6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aeb 48894424f8                     mov        qword ptr [rsp - 8], rax
01af0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01af4 89442460                       mov        dword ptr [rsp + 0x60], eax
01af8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01afd 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01b02 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01b07 90                             nop        
01b08 c5f877                         vzeroupper 
01b0b e850efb5ff                     call       0x7f4c1b9d7d60
01b10 0f1f8400081c0012               nop        dword ptr [rax + rax + 0x12001c08]
01b18 4533d2                         xor        r10d, r10d
01b1b 4c891424                       mov        qword ptr [rsp], r10
01b1f e90fe6ffff                     jmp        0x7f4c1be77433
01b24 4533d2                         xor        r10d, r10d
01b27 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01b2f e92ae6ffff                     jmp        0x7f4c1be7745e
01b34 4533d2                         xor        r10d, r10d
01b37 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01b3f e94ae6ffff                     jmp        0x7f4c1be7748e
01b44 4533d2                         xor        r10d, r10d
01b47 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b4c e965e6ffff                     jmp        0x7f4c1be774b6
01b51 4533d2                         xor        r10d, r10d
01b54 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01b5c e985e6ffff                     jmp        0x7f4c1be774e6
01b61 4533d2                         xor        r10d, r10d
01b64 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01b6c e9a0e6ffff                     jmp        0x7f4c1be77511
01b71 4183c108                       add        r9d, 8
01b75 be6effffff                     mov        esi, 0xffffff6e
01b7a 488b2c24                       mov        rbp, qword ptr [rsp]
01b7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b83 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b87 89442408                       mov        dword ptr [rsp + 8], eax
01b8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b90 48ff742420                     push       qword ptr [rsp + 0x20]
01b95 488f442418                     pop        qword ptr [rsp + 0x18]
01b9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ba3 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ba7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bac 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01bb0 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01bb9 89442438                       mov        dword ptr [rsp + 0x38], eax
01bbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc2 48ff742468                     push       qword ptr [rsp + 0x68]
01bc7 488f442440                     pop        qword ptr [rsp + 0x40]
01bcc 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01bd5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01bd9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bde 48ff742478                     push       qword ptr [rsp + 0x78]
01be3 488f442450                     pop        qword ptr [rsp + 0x50]
01be8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bed 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01bf1 89442458                       mov        dword ptr [rsp + 0x58], eax
01bf5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bfa 48894424f8                     mov        qword ptr [rsp - 8], rax
01bff 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c03 89442460                       mov        dword ptr [rsp + 0x60], eax
01c07 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c11 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
01c18 89442468                       mov        dword ptr [rsp + 0x68], eax
01c1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c21 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c26 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c2a 6690                           nop        
01c2c c5f877                         vzeroupper 
01c2f e82ceeb5ff                     call       0x7f4c1b9d7d60
01c34 0f1f84002c1d0013               nop        dword ptr [rax + rax + 0x13001d2c]
01c3c 4183c108                       add        r9d, 8
01c40 be66ffffff                     mov        esi, 0xffffff66
01c45 488b2c24                       mov        rbp, qword ptr [rsp]
01c49 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c52 89442408                       mov        dword ptr [rsp + 8], eax
01c56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5b 48ff742420                     push       qword ptr [rsp + 0x20]
01c60 488f442418                     pop        qword ptr [rsp + 0x18]
01c65 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c6e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c77 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01c7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c80 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c84 89442438                       mov        dword ptr [rsp + 0x38], eax
01c88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8d 48ff742468                     push       qword ptr [rsp + 0x68]
01c92 488f442440                     pop        qword ptr [rsp + 0x40]
01c97 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ca0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ca4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca9 48ff742478                     push       qword ptr [rsp + 0x78]
01cae 488f442450                     pop        qword ptr [rsp + 0x50]
01cb3 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01cbc 89442458                       mov        dword ptr [rsp + 0x58], eax
01cc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cca 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01cce 89442460                       mov        dword ptr [rsp + 0x60], eax
01cd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd7 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01cdc 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01ce0 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01ce5 666690                         nop        
01ce8 c5f877                         vzeroupper 
01ceb e870edb5ff                     call       0x7f4c1b9d7d60
01cf0 0f1f8400e81d0014               nop        dword ptr [rax + rax + 0x14001de8]
01cf8 beccffffff                     mov        esi, 0xffffffcc
01cfd 488b2c24                       mov        rbp, qword ptr [rsp]
01d01 48894424f8                     mov        qword ptr [rsp - 8], rax
01d06 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d0a 89442408                       mov        dword ptr [rsp + 8], eax
01d0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d13 48ff742420                     push       qword ptr [rsp + 0x20]
01d18 488f442418                     pop        qword ptr [rsp + 0x18]
01d1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d22 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d26 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d34 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d38 89442438                       mov        dword ptr [rsp + 0x38], eax
01d3c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d41 48ff742468                     push       qword ptr [rsp + 0x68]
01d46 488f442440                     pop        qword ptr [rsp + 0x40]
01d4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d50 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d54 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5d 48ff742478                     push       qword ptr [rsp + 0x78]
01d62 488f442450                     pop        qword ptr [rsp + 0x50]
01d67 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d70 89442458                       mov        dword ptr [rsp + 0x58], eax
01d74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d79 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01d85 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d93 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d97 89442460                       mov        dword ptr [rsp + 0x60], eax
01d9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da0 48894424f8                     mov        qword ptr [rsp - 8], rax
01da5 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01dac 89442464                       mov        dword ptr [rsp + 0x64], eax
01db0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db5 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01dba 6690                           nop        
01dbc c5f877                         vzeroupper 
01dbf e89cecb5ff                     call       0x7f4c1b9d7d60
01dc4 0f1f8400bc1e0015               nop        dword ptr [rax + rax + 0x15001ebc]
01dcc beccffffff                     mov        esi, 0xffffffcc
01dd1 48ffb42490000000               push       qword ptr [rsp + 0x90]
01dd9 488f442408                     pop        qword ptr [rsp + 8]
01dde 48894424f8                     mov        qword ptr [rsp - 8], rax
01de3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01de7 89442414                       mov        dword ptr [rsp + 0x14], eax
01deb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df0 48894424f8                     mov        qword ptr [rsp - 8], rax
01df5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01df9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01dfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e02 48ff742468                     push       qword ptr [rsp + 0x68]
01e07 488f442440                     pop        qword ptr [rsp + 0x40]
01e0c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e11 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e15 89442448                       mov        dword ptr [rsp + 0x48], eax
01e19 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1e 48ffb42488000000               push       qword ptr [rsp + 0x88]
01e26 488f442450                     pop        qword ptr [rsp + 0x50]
01e2b 48ff742478                     push       qword ptr [rsp + 0x78]
01e30 488f442458                     pop        qword ptr [rsp + 0x58]
01e35 48894424f8                     mov        qword ptr [rsp - 8], rax
01e3a 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e3e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e42 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e47 48894424f8                     mov        qword ptr [rsp - 8], rax
01e4c 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01e53 89442460                       mov        dword ptr [rsp + 0x60], eax
01e57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e61 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e65 89442464                       mov        dword ptr [rsp + 0x64], eax
01e69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e6e 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
01e76 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01e7e 6690                           nop        
01e80 c5f877                         vzeroupper 
01e83 e8d8ebb5ff                     call       0x7f4c1b9d7d60
01e88 0f1f8400801f0016               nop        dword ptr [rax + rax + 0x16001f80]
01e90 458d1c09                       lea        r11d, [r9 + rcx]
01e94 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01e9c 4f8b541a0c                     mov        r10, qword ptr [r10 + r11 + 0xc]
01ea1 448bc1                         mov        r8d, ecx
01ea4 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01eac 4f8954030c                     mov        qword ptr [r11 + r8 + 0xc], r10
01eb1 448d5108                       lea        r10d, [rcx + 8]
01eb5 418bca                         mov        ecx, r10d
01eb8 443bd3                         cmp        r10d, ebx
01ebb 7cd3                           jl         0x7f4c1be79190
01ebd 443bd7                         cmp        r10d, edi
01ec0 0f8d8d000000                   jge        0x7f4c1be79253
01ec6 418bca                         mov        ecx, r10d
01ec9 0f1f8000000000                 nop        dword ptr [rax]
01ed0 458d1c09                       lea        r11d, [r9 + rcx]
01ed4 448bc1                         mov        r8d, ecx
01ed7 4963d8                         movsxd     rbx, r8d
01eda 458bd3                         mov        r10d, r11d
01edd 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01ee5 4f8b54100c                     mov        r10, qword ptr [r8 + r10 + 0xc]
01eea 4d63db                         movsxd     r11, r11d
01eed 448bc1                         mov        r8d, ecx
01ef0 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
01ef8 4e8954020c                     mov        qword ptr [rdx + r8 + 0xc], r10
01efd 4e8b541a14                     mov        r10, qword ptr [rdx + r11 + 0x14]
01f02 4c89541a14                     mov        qword ptr [rdx + rbx + 0x14], r10
01f07 4e8b541a1c                     mov        r10, qword ptr [rdx + r11 + 0x1c]
01f0c 4c89541a1c                     mov        qword ptr [rdx + rbx + 0x1c], r10
01f11 4e8b541a24                     mov        r10, qword ptr [rdx + r11 + 0x24]
01f16 4c89541a24                     mov        qword ptr [rdx + rbx + 0x24], r10
01f1b 4e8b541a2c                     mov        r10, qword ptr [rdx + r11 + 0x2c]
01f20 4c89541a2c                     mov        qword ptr [rdx + rbx + 0x2c], r10
01f25 4e8b541a34                     mov        r10, qword ptr [rdx + r11 + 0x34]
01f2a 4c89541a34                     mov        qword ptr [rdx + rbx + 0x34], r10
01f2f 4e8b541a3c                     mov        r10, qword ptr [rdx + r11 + 0x3c]
01f34 4c89541a3c                     mov        qword ptr [rdx + rbx + 0x3c], r10
01f39 4e8b541a44                     mov        r10, qword ptr [rdx + r11 + 0x44]
01f3e 4c89541a44                     mov        qword ptr [rdx + rbx + 0x44], r10
01f43 448d5940                       lea        r11d, [rcx + 0x40]
01f47 418bcb                         mov        ecx, r11d
01f4a 443bdf                         cmp        r11d, edi
01f4d 0f8c7dffffff                   jl         0x7f4c1be791d0
01f53 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
01f5a 0f8db9f4ffff                   jge        0x7f4c1be78719
01f60 448bd1                         mov        r10d, ecx
01f63 458bda                         mov        r11d, r10d
01f66 6690                           nop        
01f68 478d0419                       lea        r8d, [r9 + r11]
01f6c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01f74 4f8b54020c                     mov        r10, qword ptr [r10 + r8 + 0xc]
01f79 418bcb                         mov        ecx, r11d
01f7c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01f84 4d8954080c                     mov        qword ptr [r8 + rcx + 0xc], r10
01f89 4183c308                       add        r11d, 8
01f8d 443b9c24c0000000               cmp        r11d, dword ptr [rsp + 0xc0]
01f95 7cd1                           jl         0x7f4c1be79268
01f97 e97df4ffff                     jmp        0x7f4c1be78719
01f9c bee4ffffff                     mov        esi, 0xffffffe4
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
01fe1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fe5 89442438                       mov        dword ptr [rsp + 0x38], eax
01fe9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fee 48ff742468                     push       qword ptr [rsp + 0x68]
01ff3 488f442440                     pop        qword ptr [rsp + 0x40]
01ff8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02001 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02005 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200a 48ff742478                     push       qword ptr [rsp + 0x78]
0200f 488f442450                     pop        qword ptr [rsp + 0x50]
02014 48894424f8                     mov        qword ptr [rsp - 8], rax
02019 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0201d 89442458                       mov        dword ptr [rsp + 0x58], eax
02021 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02026 48894424f8                     mov        qword ptr [rsp - 8], rax
0202b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02032 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02036 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203b 48894424f8                     mov        qword ptr [rsp - 8], rax
02040 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02044 89442460                       mov        dword ptr [rsp + 0x60], eax
02048 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0204d 89442464                       mov        dword ptr [rsp + 0x64], eax
02051 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
02058 c5f877                         vzeroupper 
0205b e800eab5ff                     call       0x7f4c1b9d7d60
02060 0f1f840058210017               nop        dword ptr [rax + rax + 0x17002158]
02068 be6effffff                     mov        esi, 0xffffff6e
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
020ad 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020b1 89442438                       mov        dword ptr [rsp + 0x38], eax
020b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ba 48ff742468                     push       qword ptr [rsp + 0x68]
020bf 488f442440                     pop        qword ptr [rsp + 0x40]
020c4 48894424f8                     mov        qword ptr [rsp - 8], rax
020c9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020cd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d6 48ff742478                     push       qword ptr [rsp + 0x78]
020db 488f442450                     pop        qword ptr [rsp + 0x50]
020e0 48894424f8                     mov        qword ptr [rsp - 8], rax
020e5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
020e9 89442458                       mov        dword ptr [rsp + 0x58], eax
020ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f2 48894424f8                     mov        qword ptr [rsp - 8], rax
020f7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
020fb 89442460                       mov        dword ptr [rsp + 0x60], eax
020ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02104 89442464                       mov        dword ptr [rsp + 0x64], eax
02108 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0210d 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
02111 666690                         nop        
02114 c5f877                         vzeroupper 
02117 e844e9b5ff                     call       0x7f4c1b9d7d60
0211c 0f1f840014220018               nop        dword ptr [rax + rax + 0x18002214]
02124 be45ffffff                     mov        esi, 0xffffff45
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
02169 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0216d 89442438                       mov        dword ptr [rsp + 0x38], eax
02171 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02176 48ff742468                     push       qword ptr [rsp + 0x68]
0217b 488f442440                     pop        qword ptr [rsp + 0x40]
02180 48894424f8                     mov        qword ptr [rsp - 8], rax
02185 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02189 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0218d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02192 48ff742478                     push       qword ptr [rsp + 0x78]
02197 488f442450                     pop        qword ptr [rsp + 0x50]
0219c 48894424f8                     mov        qword ptr [rsp - 8], rax
021a1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
021a5 89442458                       mov        dword ptr [rsp + 0x58], eax
021a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ae 48894424f8                     mov        qword ptr [rsp - 8], rax
021b3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
021b7 89442460                       mov        dword ptr [rsp + 0x60], eax
021bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c0 89442464                       mov        dword ptr [rsp + 0x64], eax
021c4 894c2478                       mov        dword ptr [rsp + 0x78], ecx
021c8 c5f877                         vzeroupper 
021cb e890e8b5ff                     call       0x7f4c1b9d7d60
021d0 0f1f8400c8220019               nop        dword ptr [rax + rax + 0x190022c8]
021d8 be3dffffff                     mov        esi, 0xffffff3d
021dd 488b2c24                       mov        rbp, qword ptr [rsp]
021e1 48894424f8                     mov        qword ptr [rsp - 8], rax
021e6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
021ea 89442408                       mov        dword ptr [rsp + 8], eax
021ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f3 48ff742420                     push       qword ptr [rsp + 0x20]
021f8 488f442418                     pop        qword ptr [rsp + 0x18]
021fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02202 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02206 8944240c                       mov        dword ptr [rsp + 0xc], eax
0220a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02213 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02218 48894424f8                     mov        qword ptr [rsp - 8], rax
0221d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02221 89442438                       mov        dword ptr [rsp + 0x38], eax
02225 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0222a 48ff742468                     push       qword ptr [rsp + 0x68]
0222f 488f442440                     pop        qword ptr [rsp + 0x40]
02234 48894424f8                     mov        qword ptr [rsp - 8], rax
02239 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0223d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02241 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02246 48ff742478                     push       qword ptr [rsp + 0x78]
0224b 488f442450                     pop        qword ptr [rsp + 0x50]
02250 48894424f8                     mov        qword ptr [rsp - 8], rax
02255 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02259 89442458                       mov        dword ptr [rsp + 0x58], eax
0225d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02262 48894424f8                     mov        qword ptr [rsp - 8], rax
02267 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0226b 89442460                       mov        dword ptr [rsp + 0x60], eax
0226f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02274 89442464                       mov        dword ptr [rsp + 0x64], eax
02278 894c2478                       mov        dword ptr [rsp + 0x78], ecx
0227c c5f877                         vzeroupper 
0227f e8dce7b5ff                     call       0x7f4c1b9d7d60
02284 0f1f84007c23001a               nop        dword ptr [rax + rax + 0x1a00237c]
0228c bee4ffffff                     mov        esi, 0xffffffe4
02291 488b2c24                       mov        rbp, qword ptr [rsp]
02295 48894424f8                     mov        qword ptr [rsp - 8], rax
0229a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0229e 89442408                       mov        dword ptr [rsp + 8], eax
022a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a7 48ff742420                     push       qword ptr [rsp + 0x20]
022ac 488f442418                     pop        qword ptr [rsp + 0x18]
022b1 48894424f8                     mov        qword ptr [rsp - 8], rax
022b6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022ba 8944240c                       mov        dword ptr [rsp + 0xc], eax
022be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022c3 48894424f8                     mov        qword ptr [rsp - 8], rax
022c8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
022cc 89442434                       mov        dword ptr [rsp + 0x34], eax
022d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d5 48ff742468                     push       qword ptr [rsp + 0x68]
022da 488f442438                     pop        qword ptr [rsp + 0x38]
022df 48894424f8                     mov        qword ptr [rsp - 8], rax
022e4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
022e8 89442440                       mov        dword ptr [rsp + 0x40], eax
022ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f1 48ffb42488000000               push       qword ptr [rsp + 0x88]
022f9 488f442448                     pop        qword ptr [rsp + 0x48]
022fe 48ff742478                     push       qword ptr [rsp + 0x78]
02303 488f442450                     pop        qword ptr [rsp + 0x50]
02308 48894424f8                     mov        qword ptr [rsp - 8], rax
0230d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02311 89442444                       mov        dword ptr [rsp + 0x44], eax
02315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231a 48894424f8                     mov        qword ptr [rsp - 8], rax
0231f 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02326 89442458                       mov        dword ptr [rsp + 0x58], eax
0232a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232f 48894424f8                     mov        qword ptr [rsp - 8], rax
02334 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02338 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0233c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02341 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
02349 666690                         nop        
0234c c5f877                         vzeroupper 
0234f e80ce7b5ff                     call       0x7f4c1b9d7d60
02354 0f1f84004c24001b               nop        dword ptr [rax + rax + 0x1b00244c]
0235c bee4ffffff                     mov        esi, 0xffffffe4
02361 48894424f8                     mov        qword ptr [rsp - 8], rax
02366 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0236a 89442414                       mov        dword ptr [rsp + 0x14], eax
0236e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02373 48894424f8                     mov        qword ptr [rsp - 8], rax
02378 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0237c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02380 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02385 48ff742468                     push       qword ptr [rsp + 0x68]
0238a 488f442440                     pop        qword ptr [rsp + 0x40]
0238f 48894424f8                     mov        qword ptr [rsp - 8], rax
02394 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02398 89442448                       mov        dword ptr [rsp + 0x48], eax
0239c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a1 48ffb42488000000               push       qword ptr [rsp + 0x88]
023a9 488f442450                     pop        qword ptr [rsp + 0x50]
023ae 48ff742478                     push       qword ptr [rsp + 0x78]
023b3 488f442458                     pop        qword ptr [rsp + 0x58]
023b8 48894424f8                     mov        qword ptr [rsp - 8], rax
023bd 8b442474                       mov        eax, dword ptr [rsp + 0x74]
023c1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
023c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ca 48894424f8                     mov        qword ptr [rsp - 8], rax
023cf 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
023d6 89442460                       mov        dword ptr [rsp + 0x60], eax
023da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023df 48894424f8                     mov        qword ptr [rsp - 8], rax
023e4 8b442470                       mov        eax, dword ptr [rsp + 0x70]
023e8 89442464                       mov        dword ptr [rsp + 0x64], eax
023ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f1 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
023f6 6690                           nop        
023f8 c5f877                         vzeroupper 
023fb e860e6b5ff                     call       0x7f4c1b9d7d60
02400 0f1f8400f824001c               nop        dword ptr [rax + rax + 0x1c0024f8]
02408 418d6901                       lea        ebp, [r9 + 1]
0240c bee4ffffff                     mov        esi, 0xffffffe4
02411 48ffb42490000000               push       qword ptr [rsp + 0x90]
02419 488f442408                     pop        qword ptr [rsp + 8]
0241e 48894424f8                     mov        qword ptr [rsp - 8], rax
02423 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02427 89442414                       mov        dword ptr [rsp + 0x14], eax
0242b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02430 48894424f8                     mov        qword ptr [rsp - 8], rax
02435 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02439 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0243d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02442 48ff742468                     push       qword ptr [rsp + 0x68]
02447 488f442440                     pop        qword ptr [rsp + 0x40]
0244c 48894424f8                     mov        qword ptr [rsp - 8], rax
02451 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02455 89442448                       mov        dword ptr [rsp + 0x48], eax
02459 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0245e 48ffb42488000000               push       qword ptr [rsp + 0x88]
02466 488f442450                     pop        qword ptr [rsp + 0x50]
0246b 48ff742478                     push       qword ptr [rsp + 0x78]
02470 488f442458                     pop        qword ptr [rsp + 0x58]
02475 48894424f8                     mov        qword ptr [rsp - 8], rax
0247a 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0247e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02482 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02487 48894424f8                     mov        qword ptr [rsp - 8], rax
0248c 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02493 89442460                       mov        dword ptr [rsp + 0x60], eax
02497 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0249c 48894424f8                     mov        qword ptr [rsp - 8], rax
024a1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024a5 89442464                       mov        dword ptr [rsp + 0x64], eax
024a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ae 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
024b3 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
024ba 6690                           nop        
024bc c5f877                         vzeroupper 
024bf e89ce5b5ff                     call       0x7f4c1b9d7d60
024c4 0f1f8400bc25001d               nop        dword ptr [rax + rax + 0x1d0025bc]
024cc bee4ffffff                     mov        esi, 0xffffffe4
024d1 48894424f8                     mov        qword ptr [rsp - 8], rax
024d6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
024da 89442414                       mov        dword ptr [rsp + 0x14], eax
024de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024e3 48894424f8                     mov        qword ptr [rsp - 8], rax
024e8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024ec 8944243c                       mov        dword ptr [rsp + 0x3c], eax
024f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024f5 48ff742468                     push       qword ptr [rsp + 0x68]
024fa 488f442440                     pop        qword ptr [rsp + 0x40]
024ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02504 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02508 89442448                       mov        dword ptr [rsp + 0x48], eax
0250c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02511 48ffb42488000000               push       qword ptr [rsp + 0x88]
02519 488f442450                     pop        qword ptr [rsp + 0x50]
0251e 48ff742478                     push       qword ptr [rsp + 0x78]
02523 488f442458                     pop        qword ptr [rsp + 0x58]
02528 48894424f8                     mov        qword ptr [rsp - 8], rax
0252d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02531 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02535 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253a 48894424f8                     mov        qword ptr [rsp - 8], rax
0253f 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02546 89442460                       mov        dword ptr [rsp + 0x60], eax
0254a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254f 48894424f8                     mov        qword ptr [rsp - 8], rax
02554 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02558 89442464                       mov        dword ptr [rsp + 0x64], eax
0255c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02561 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02566 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
0256d 666690                         nop        
02570 c5f877                         vzeroupper 
02573 e8e8e4b5ff                     call       0x7f4c1b9d7d60
02578 0f1f84007026001e               nop        dword ptr [rax + rax + 0x1e002670]
02580 bee4ffffff                     mov        esi, 0xffffffe4
02585 488b2c24                       mov        rbp, qword ptr [rsp]
02589 48894424f8                     mov        qword ptr [rsp - 8], rax
0258e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02592 89442408                       mov        dword ptr [rsp + 8], eax
02596 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0259b 48ff742420                     push       qword ptr [rsp + 0x20]
025a0 488f442418                     pop        qword ptr [rsp + 0x18]
025a5 48894424f8                     mov        qword ptr [rsp - 8], rax
025aa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025ae 8944240c                       mov        dword ptr [rsp + 0xc], eax
025b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b7 48894424f8                     mov        qword ptr [rsp - 8], rax
025bc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
025c0 89442434                       mov        dword ptr [rsp + 0x34], eax
025c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025c9 48ff742468                     push       qword ptr [rsp + 0x68]
025ce 488f442438                     pop        qword ptr [rsp + 0x38]
025d3 48894424f8                     mov        qword ptr [rsp - 8], rax
025d8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
025dc 89442440                       mov        dword ptr [rsp + 0x40], eax
025e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e5 48ff742478                     push       qword ptr [rsp + 0x78]
025ea 488f442450                     pop        qword ptr [rsp + 0x50]
025ef 48894424f8                     mov        qword ptr [rsp - 8], rax
025f4 8b442474                       mov        eax, dword ptr [rsp + 0x74]
025f8 89442444                       mov        dword ptr [rsp + 0x44], eax
025fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02601 48894424f8                     mov        qword ptr [rsp - 8], rax
02606 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0260a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0260e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02613 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02618 c5f877                         vzeroupper 
0261b e840e4b5ff                     call       0x7f4c1b9d7d60
02620 0f1f84001827001f               nop        dword ptr [rax + rax + 0x1f002718]
02628 beccffffff                     mov        esi, 0xffffffcc
0262d 488b2c24                       mov        rbp, qword ptr [rsp]
02631 48894424f8                     mov        qword ptr [rsp - 8], rax
02636 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0263a 89442408                       mov        dword ptr [rsp + 8], eax
0263e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02643 48ff742420                     push       qword ptr [rsp + 0x20]
02648 488f442418                     pop        qword ptr [rsp + 0x18]
0264d 48894424f8                     mov        qword ptr [rsp - 8], rax
02652 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02656 8944240c                       mov        dword ptr [rsp + 0xc], eax
0265a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0265f 48894424f8                     mov        qword ptr [rsp - 8], rax
02664 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02668 89442434                       mov        dword ptr [rsp + 0x34], eax
0266c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02671 48ff742468                     push       qword ptr [rsp + 0x68]
02676 488f442438                     pop        qword ptr [rsp + 0x38]
0267b 48894424f8                     mov        qword ptr [rsp - 8], rax
02680 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02684 89442440                       mov        dword ptr [rsp + 0x40], eax
02688 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0268d 48ffb42488000000               push       qword ptr [rsp + 0x88]
02695 488f442448                     pop        qword ptr [rsp + 0x48]
0269a 48ff742478                     push       qword ptr [rsp + 0x78]
0269f 488f442450                     pop        qword ptr [rsp + 0x50]
026a4 48894424f8                     mov        qword ptr [rsp - 8], rax
026a9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
026ad 89442444                       mov        dword ptr [rsp + 0x44], eax
026b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b6 48894424f8                     mov        qword ptr [rsp - 8], rax
026bb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
026c2 89442458                       mov        dword ptr [rsp + 0x58], eax
026c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026cb 48894424f8                     mov        qword ptr [rsp - 8], rax
026d0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
026d4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
026d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026dd 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
026e2 6690                           nop        
026e4 c5f877                         vzeroupper 
026e7 e874e3b5ff                     call       0x7f4c1b9d7d60
026ec 0f1f8400e4270020               nop        dword ptr [rax + rax + 0x200027e4]
026f4 be45ffffff                     mov        esi, 0xffffff45
026f9 488b2c24                       mov        rbp, qword ptr [rsp]
026fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02702 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02706 89442408                       mov        dword ptr [rsp + 8], eax
0270a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270f 48ff742420                     push       qword ptr [rsp + 0x20]
02714 488f442418                     pop        qword ptr [rsp + 0x18]
02719 48894424f8                     mov        qword ptr [rsp - 8], rax
0271e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02722 8944240c                       mov        dword ptr [rsp + 0xc], eax
02726 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0272b 48894424f8                     mov        qword ptr [rsp - 8], rax
02730 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02734 89442438                       mov        dword ptr [rsp + 0x38], eax
02738 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273d 48ff742468                     push       qword ptr [rsp + 0x68]
02742 488f442440                     pop        qword ptr [rsp + 0x40]
02747 48894424f8                     mov        qword ptr [rsp - 8], rax
0274c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02750 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02754 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02759 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0275e 6690                           nop        
02760 c5f877                         vzeroupper 
02763 e8f8e2b5ff                     call       0x7f4c1b9d7d60
02768 0f1f840060280021               nop        dword ptr [rax + rax + 0x21002860]
02770 bebeffffff                     mov        esi, 0xffffffbe
02775 488b2c24                       mov        rbp, qword ptr [rsp]
02779 48894424f8                     mov        qword ptr [rsp - 8], rax
0277e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02782 89442408                       mov        dword ptr [rsp + 8], eax
02786 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0278b 48ff742420                     push       qword ptr [rsp + 0x20]
02790 488f442418                     pop        qword ptr [rsp + 0x18]
02795 48894424f8                     mov        qword ptr [rsp - 8], rax
0279a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0279e 8944240c                       mov        dword ptr [rsp + 0xc], eax
027a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
027ab 4489742434                     mov        dword ptr [rsp + 0x34], r14d
027b0 48894424f8                     mov        qword ptr [rsp - 8], rax
027b5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
027b9 89442438                       mov        dword ptr [rsp + 0x38], eax
027bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c2 6690                           nop        
027c4 c5f877                         vzeroupper 
027c7 e894e2b5ff                     call       0x7f4c1b9d7d60
027cc 0f1f8400c4280022               nop        dword ptr [rax + rax + 0x220028c4]
027d4 be85ffffff                     mov        esi, 0xffffff85
027d9 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
027dd 48894424f8                     mov        qword ptr [rsp - 8], rax
027e2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027e6 890424                         mov        dword ptr [rsp], eax
027e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ee 895c2404                       mov        dword ptr [rsp + 4], ebx
027f2 4489742408                     mov        dword ptr [rsp + 8], r14d
027f7 48894424f8                     mov        qword ptr [rsp - 8], rax
027fc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02800 8944240c                       mov        dword ptr [rsp + 0xc], eax
02804 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02809 48894424f8                     mov        qword ptr [rsp - 8], rax
0280e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02812 89442418                       mov        dword ptr [rsp + 0x18], eax
02816 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281b 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
02820 c5f877                         vzeroupper 
02823 e838e2b5ff                     call       0x7f4c1b9d7d60
02828 0f1f840020290023               nop        dword ptr [rax + rax + 0x23002920]
02830 beccffffff                     mov        esi, 0xffffffcc
02835 488b2c24                       mov        rbp, qword ptr [rsp]
02839 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0283e 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02842 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02847 90                             nop        
02848 c5f877                         vzeroupper 
0284b e810e2b5ff                     call       0x7f4c1b9d7d60
02850 0f1f840048290024               nop        dword ptr [rax + rax + 0x24002948]
02858 bee4ffffff                     mov        esi, 0xffffffe4
0285d 488b2c24                       mov        rbp, qword ptr [rsp]
02861 48894424f8                     mov        qword ptr [rsp - 8], rax
02866 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0286a 89442408                       mov        dword ptr [rsp + 8], eax
0286e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02873 48ff742420                     push       qword ptr [rsp + 0x20]
02878 488f442418                     pop        qword ptr [rsp + 0x18]
0287d 48894424f8                     mov        qword ptr [rsp - 8], rax
02882 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02886 8944240c                       mov        dword ptr [rsp + 0xc], eax
0288a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0288f 48894424f8                     mov        qword ptr [rsp - 8], rax
02894 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02898 89442434                       mov        dword ptr [rsp + 0x34], eax
0289c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a1 48ff742468                     push       qword ptr [rsp + 0x68]
028a6 488f442438                     pop        qword ptr [rsp + 0x38]
028ab 48894424f8                     mov        qword ptr [rsp - 8], rax
028b0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
028b4 89442440                       mov        dword ptr [rsp + 0x40], eax
028b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028bd 48ff742478                     push       qword ptr [rsp + 0x78]
028c2 488f442450                     pop        qword ptr [rsp + 0x50]
028c7 48894424f8                     mov        qword ptr [rsp - 8], rax
028cc 8b442474                       mov        eax, dword ptr [rsp + 0x74]
028d0 89442444                       mov        dword ptr [rsp + 0x44], eax
028d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d9 48894424f8                     mov        qword ptr [rsp - 8], rax
028de 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
028e5 89442458                       mov        dword ptr [rsp + 0x58], eax
028e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ee 48894424f8                     mov        qword ptr [rsp - 8], rax
028f3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
028f7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
028fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02900 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
02908 c5f877                         vzeroupper 
0290b e850e1b5ff                     call       0x7f4c1b9d7d60
02910 0f1f8400082a0025               nop        dword ptr [rax + rax + 0x25002a08]
02918 bee4ffffff                     mov        esi, 0xffffffe4
0291d 488b2c24                       mov        rbp, qword ptr [rsp]
02921 48894424f8                     mov        qword ptr [rsp - 8], rax
02926 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0292a 89442408                       mov        dword ptr [rsp + 8], eax
0292e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02933 48ff742420                     push       qword ptr [rsp + 0x20]
02938 488f442418                     pop        qword ptr [rsp + 0x18]
0293d 48894424f8                     mov        qword ptr [rsp - 8], rax
02942 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02946 8944240c                       mov        dword ptr [rsp + 0xc], eax
0294a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0294f 48894424f8                     mov        qword ptr [rsp - 8], rax
02954 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02958 89442434                       mov        dword ptr [rsp + 0x34], eax
0295c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02961 48ff742468                     push       qword ptr [rsp + 0x68]
02966 488f442438                     pop        qword ptr [rsp + 0x38]
0296b 48894424f8                     mov        qword ptr [rsp - 8], rax
02970 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02974 89442440                       mov        dword ptr [rsp + 0x40], eax
02978 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297d 48ff742478                     push       qword ptr [rsp + 0x78]
02982 488f442450                     pop        qword ptr [rsp + 0x50]
02987 48894424f8                     mov        qword ptr [rsp - 8], rax
0298c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02990 89442444                       mov        dword ptr [rsp + 0x44], eax
02994 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02999 48894424f8                     mov        qword ptr [rsp - 8], rax
0299e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
029a5 89442458                       mov        dword ptr [rsp + 0x58], eax
029a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ae 48894424f8                     mov        qword ptr [rsp - 8], rax
029b3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029b7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
029bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c0 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
029c5 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
029cd 666690                         nop        
029d0 c5f877                         vzeroupper 
029d3 e888e0b5ff                     call       0x7f4c1b9d7d60
029d8 0f1f8400d02a0026               nop        dword ptr [rax + rax + 0x26002ad0]
029e0 4183c108                       add        r9d, 8
029e4 be6effffff                     mov        esi, 0xffffff6e
029e9 488b2c24                       mov        rbp, qword ptr [rsp]
029ed 48894424f8                     mov        qword ptr [rsp - 8], rax
029f2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
029f6 89442408                       mov        dword ptr [rsp + 8], eax
029fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ff 48ff742420                     push       qword ptr [rsp + 0x20]
02a04 488f442418                     pop        qword ptr [rsp + 0x18]
02a09 48894424f8                     mov        qword ptr [rsp - 8], rax
02a0e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a12 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a1b 48894424f8                     mov        qword ptr [rsp - 8], rax
02a20 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02a24 89442434                       mov        dword ptr [rsp + 0x34], eax
02a28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a2d 48ff742468                     push       qword ptr [rsp + 0x68]
02a32 488f442438                     pop        qword ptr [rsp + 0x38]
02a37 48894424f8                     mov        qword ptr [rsp - 8], rax
02a3c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a40 89442440                       mov        dword ptr [rsp + 0x40], eax
02a44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a49 48894424f8                     mov        qword ptr [rsp - 8], rax
02a4e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a52 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02a56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a5b 48894424f8                     mov        qword ptr [rsp - 8], rax
02a60 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
02a67 89442460                       mov        dword ptr [rsp + 0x60], eax
02a6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a70 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02a75 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02a79 666690                         nop        
02a7c c5f877                         vzeroupper 
02a7f e8dcdfb5ff                     call       0x7f4c1b9d7d60
02a84 0f1f84007c2b0027               nop        dword ptr [rax + rax + 0x27002b7c]
02a8c 4183c108                       add        r9d, 8
02a90 be66ffffff                     mov        esi, 0xffffff66
02a95 488b2c24                       mov        rbp, qword ptr [rsp]
02a99 48894424f8                     mov        qword ptr [rsp - 8], rax
02a9e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02aa2 89442408                       mov        dword ptr [rsp + 8], eax
02aa6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aab 48ff742420                     push       qword ptr [rsp + 0x20]
02ab0 488f442418                     pop        qword ptr [rsp + 0x18]
02ab5 48894424f8                     mov        qword ptr [rsp - 8], rax
02aba 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02abe 8944240c                       mov        dword ptr [rsp + 0xc], eax
02ac2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac7 48894424f8                     mov        qword ptr [rsp - 8], rax
02acc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ad0 89442434                       mov        dword ptr [rsp + 0x34], eax
02ad4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad9 48ff742468                     push       qword ptr [rsp + 0x68]
02ade 488f442438                     pop        qword ptr [rsp + 0x38]
02ae3 48894424f8                     mov        qword ptr [rsp - 8], rax
02ae8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02aec 89442440                       mov        dword ptr [rsp + 0x40], eax
02af0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af5 48894424f8                     mov        qword ptr [rsp - 8], rax
02afa 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02afe 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02b02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b07 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02b0c 4489542468                     mov        dword ptr [rsp + 0x68], r10d
02b11 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02b15 666690                         nop        
02b18 c5f877                         vzeroupper 
02b1b e840dfb5ff                     call       0x7f4c1b9d7d60
02b20 0f1f8400182c0028               nop        dword ptr [rax + rax + 0x28002c18]
02b28 bee4ffffff                     mov        esi, 0xffffffe4
02b2d 488b2c24                       mov        rbp, qword ptr [rsp]
02b31 48894424f8                     mov        qword ptr [rsp - 8], rax
02b36 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02b3a 89442408                       mov        dword ptr [rsp + 8], eax
02b3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b43 48ff742420                     push       qword ptr [rsp + 0x20]
02b48 488f442418                     pop        qword ptr [rsp + 0x18]
02b4d 48894424f8                     mov        qword ptr [rsp - 8], rax
02b52 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b56 8944240c                       mov        dword ptr [rsp + 0xc], eax
02b5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b5f 48894424f8                     mov        qword ptr [rsp - 8], rax
02b64 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02b68 89442434                       mov        dword ptr [rsp + 0x34], eax
02b6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b71 48ff742468                     push       qword ptr [rsp + 0x68]
02b76 488f442438                     pop        qword ptr [rsp + 0x38]
02b7b 48894424f8                     mov        qword ptr [rsp - 8], rax
02b80 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b84 89442440                       mov        dword ptr [rsp + 0x40], eax
02b88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b8d 48ff742478                     push       qword ptr [rsp + 0x78]
02b92 488f442450                     pop        qword ptr [rsp + 0x50]
02b97 48894424f8                     mov        qword ptr [rsp - 8], rax
02b9c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02ba0 89442444                       mov        dword ptr [rsp + 0x44], eax
02ba4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ba9 48894424f8                     mov        qword ptr [rsp - 8], rax
02bae 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02bb5 89442458                       mov        dword ptr [rsp + 0x58], eax
02bb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bbe 48894424f8                     mov        qword ptr [rsp - 8], rax
02bc3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02bc7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02bcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd0 89442460                       mov        dword ptr [rsp + 0x60], eax
02bd4 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02bd9 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02bdd 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02be2 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02bea 6690                           nop        
02bec c5f877                         vzeroupper 
02bef e86cdeb5ff                     call       0x7f4c1b9d7d60
02bf4 0f1f8400ec2c0029               nop        dword ptr [rax + rax + 0x29002cec]
02bfc bee4ffffff                     mov        esi, 0xffffffe4
02c01 488b2c24                       mov        rbp, qword ptr [rsp]
02c05 48ffb42490000000               push       qword ptr [rsp + 0x90]
02c0d 488f0424                       pop        qword ptr [rsp]
02c11 48894424f8                     mov        qword ptr [rsp - 8], rax
02c16 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c1a 89442408                       mov        dword ptr [rsp + 8], eax
02c1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c23 48ffb42498000000               push       qword ptr [rsp + 0x98]
02c2b 488f442410                     pop        qword ptr [rsp + 0x10]
02c30 48ff742420                     push       qword ptr [rsp + 0x20]
02c35 488f442418                     pop        qword ptr [rsp + 0x18]
02c3a 48894424f8                     mov        qword ptr [rsp - 8], rax
02c3f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c43 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c4c 48894424f8                     mov        qword ptr [rsp - 8], rax
02c51 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02c55 89442434                       mov        dword ptr [rsp + 0x34], eax
02c59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c5e 48ff742468                     push       qword ptr [rsp + 0x68]
02c63 488f442438                     pop        qword ptr [rsp + 0x38]
02c68 48894424f8                     mov        qword ptr [rsp - 8], rax
02c6d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c71 89442440                       mov        dword ptr [rsp + 0x40], eax
02c75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c7a 48ff742478                     push       qword ptr [rsp + 0x78]
02c7f 488f442450                     pop        qword ptr [rsp + 0x50]
02c84 48894424f8                     mov        qword ptr [rsp - 8], rax
02c89 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02c8d 89442444                       mov        dword ptr [rsp + 0x44], eax
02c91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c96 48894424f8                     mov        qword ptr [rsp - 8], rax
02c9b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02ca2 89442458                       mov        dword ptr [rsp + 0x58], eax
02ca6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cab 48894424f8                     mov        qword ptr [rsp - 8], rax
02cb0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02cb4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02cb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cbd 89442460                       mov        dword ptr [rsp + 0x60], eax
02cc1 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02cc6 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02ccb 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02cd2 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02cdb 90                             nop        
02cdc c5f877                         vzeroupper 
02cdf e87cddb5ff                     call       0x7f4c1b9d7d60
02ce4 0f1f8400dc2d002a               nop        dword ptr [rax + rax + 0x2a002ddc]
02cec beccffffff                     mov        esi, 0xffffffcc
02cf1 488b2c24                       mov        rbp, qword ptr [rsp]
02cf5 48894424f8                     mov        qword ptr [rsp - 8], rax
02cfa 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02cfe 89442408                       mov        dword ptr [rsp + 8], eax
02d02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d07 48ff742420                     push       qword ptr [rsp + 0x20]
02d0c 488f442418                     pop        qword ptr [rsp + 0x18]
02d11 48894424f8                     mov        qword ptr [rsp - 8], rax
02d16 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d1a 8944240c                       mov        dword ptr [rsp + 0xc], eax
02d1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d23 48894424f8                     mov        qword ptr [rsp - 8], rax
02d28 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02d2c 89442438                       mov        dword ptr [rsp + 0x38], eax
02d30 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d35 48ff742468                     push       qword ptr [rsp + 0x68]
02d3a 488f442440                     pop        qword ptr [rsp + 0x40]
02d3f 48894424f8                     mov        qword ptr [rsp - 8], rax
02d44 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02d48 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02d4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d51 48ffb42488000000               push       qword ptr [rsp + 0x88]
02d59 488f442448                     pop        qword ptr [rsp + 0x48]
02d5e 48ff742478                     push       qword ptr [rsp + 0x78]
02d63 488f442450                     pop        qword ptr [rsp + 0x50]
02d68 48894424f8                     mov        qword ptr [rsp - 8], rax
02d6d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02d71 89442458                       mov        dword ptr [rsp + 0x58], eax
02d75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d7a 48894424f8                     mov        qword ptr [rsp - 8], rax
02d7f 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02d86 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02d8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d8f 48894424f8                     mov        qword ptr [rsp - 8], rax
02d94 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02d98 89442460                       mov        dword ptr [rsp + 0x60], eax
02d9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02da1 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02da6 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02daa 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02db1 666690                         nop        
02db4 c5f877                         vzeroupper 
02db7 e8a4dcb5ff                     call       0x7f4c1b9d7d60
02dbc 0f1f8400b42e002b               nop        dword ptr [rax + rax + 0x2b002eb4]
02dc4 418bee                         mov        ebp, r14d
02dc7 83c510                         add        ebp, 0x10
02dca be6effffff                     mov        esi, 0xffffff6e
02dcf 48894424f8                     mov        qword ptr [rsp - 8], rax
02dd4 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02dd8 89442414                       mov        dword ptr [rsp + 0x14], eax
02ddc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02de1 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02de6 48894424f8                     mov        qword ptr [rsp - 8], rax
02deb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02def 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02df3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02df8 48ff742468                     push       qword ptr [rsp + 0x68]
02dfd 488f442440                     pop        qword ptr [rsp + 0x40]
02e02 48894424f8                     mov        qword ptr [rsp - 8], rax
02e07 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02e0b 89442448                       mov        dword ptr [rsp + 0x48], eax
02e0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e14 48ff742478                     push       qword ptr [rsp + 0x78]
02e19 488f442458                     pop        qword ptr [rsp + 0x58]
02e1e 48894424f8                     mov        qword ptr [rsp - 8], rax
02e23 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02e27 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e30 48894424f8                     mov        qword ptr [rsp - 8], rax
02e35 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02e3c 89442460                       mov        dword ptr [rsp + 0x60], eax
02e40 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e45 48894424f8                     mov        qword ptr [rsp - 8], rax
02e4a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e4e 89442464                       mov        dword ptr [rsp + 0x64], eax
02e52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e57 89442468                       mov        dword ptr [rsp + 0x68], eax
02e5b 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02e60 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02e67 90                             nop        
02e68 c5f877                         vzeroupper 
02e6b e8f0dbb5ff                     call       0x7f4c1b9d7d60
02e70 0f1f8400682f002c               nop        dword ptr [rax + rax + 0x2c002f68]
02e78 418bee                         mov        ebp, r14d
02e7b 83c510                         add        ebp, 0x10
02e7e be66ffffff                     mov        esi, 0xffffff66
02e83 48894424f8                     mov        qword ptr [rsp - 8], rax
02e88 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e8c 89442414                       mov        dword ptr [rsp + 0x14], eax
02e90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e95 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02e9a 48894424f8                     mov        qword ptr [rsp - 8], rax
02e9f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ea3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ea7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eac 48ff742468                     push       qword ptr [rsp + 0x68]
02eb1 488f442440                     pop        qword ptr [rsp + 0x40]
02eb6 48894424f8                     mov        qword ptr [rsp - 8], rax
02ebb 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02ebf 89442448                       mov        dword ptr [rsp + 0x48], eax
02ec3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ec8 48ff742478                     push       qword ptr [rsp + 0x78]
02ecd 488f442458                     pop        qword ptr [rsp + 0x58]
02ed2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ed7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02edb 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02edf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ee4 48894424f8                     mov        qword ptr [rsp - 8], rax
02ee9 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02ef0 89442460                       mov        dword ptr [rsp + 0x60], eax
02ef4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ef9 48894424f8                     mov        qword ptr [rsp - 8], rax
02efe 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02f02 89442464                       mov        dword ptr [rsp + 0x64], eax
02f06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f0b 89442468                       mov        dword ptr [rsp + 0x68], eax
02f0f 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02f14 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02f1b 90                             nop        
02f1c c5f877                         vzeroupper 
02f1f e83cdbb5ff                     call       0x7f4c1b9d7d60
02f24 0f1f84001c30002d               nop        dword ptr [rax + rax + 0x2d00301c]
02f2c 488bf0                         mov        rsi, rax
02f2f eb0d                           jmp        0x7f4c1be7a23e
02f31 488bf0                         mov        rsi, rax
02f34 eb08                           jmp        0x7f4c1be7a23e
02f36 488bf0                         mov        rsi, rax
02f39 eb03                           jmp        0x7f4c1be7a23e
02f3b 488bf0                         mov        rsi, rax
02f3e c5f877                         vzeroupper 
02f41 4881c4f0000000                 add        rsp, 0xf0
02f48 5d                             pop        rbp
02f49 e99203b6ff                     jmp        0x7f4c1b9da5e0
02f4e bef6ffffff                     mov        esi, 0xfffffff6
02f53 90                             nop        
02f54 c5f877                         vzeroupper 
02f57 e804dbb5ff                     call       0x7f4c1b9d7d60
02f5c 0f1f84005430002e               nop        dword ptr [rax + rax + 0x2e003054]
02f64 49ba6c80e71b4c7f0000           movabs     r10, 0x7f4c1be7806c
02f6e 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02f75 e9668ca9ff                     jmp        0x7f4c1b912ee0
02f7a e82158a8ff                     call       0x7f4c1b8ffaa0
02f7f e9aad0ffff                     jmp        0x7f4c1be7732e
02f84 f4                             hlt        
02f85 f4                             hlt        
02f86 f4                             hlt        
02f87 f4                             hlt        
