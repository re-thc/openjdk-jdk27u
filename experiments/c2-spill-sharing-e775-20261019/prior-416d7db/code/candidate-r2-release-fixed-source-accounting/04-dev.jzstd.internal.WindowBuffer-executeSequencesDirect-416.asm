00000 e8fb7fcb18                     call       0x7f4c34b29880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85382e0000                   jne        0x7f4c1be746e6
0002e 4c8bae40010000                 mov        r13, qword ptr [rsi + 0x140]
00035 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
0003c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00041 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
00045 4489542470                     mov        dword ptr [rsp + 0x70], r10d
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
00111 0f84b9190000                   je         0x7f4c1be73350
00117 458b5504                       mov        r10d, dword ptr [r13 + 4]
0011b 41c1ea0a                       shr        r10d, 0xa
0011f 4181fa0c080000                 cmp        r10d, 0x80c
00126 0f8554250000                   jne        0x7f4c1be73f00
0012c 4d8bd5                         mov        r10, r13
0012f 4c891424                       mov        qword ptr [rsp], r10
00133 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00138 4d85d2                         test       r10, r10
0013b 0f849b190000                   je         0x7f4c1be7335c
00141 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00145 41c1eb0a                       shr        r11d, 0xa
00149 4181fb05020000                 cmp        r11d, 0x205
00150 0f852a250000                   jne        0x7f4c1be73f00
00156 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0015e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00163 4d85d2                         test       r10, r10
00166 0f8480190000                   je         0x7f4c1be7336c
0016c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00170 41c1ea0a                       shr        r10d, 0xa
00174 4181fa08020000                 cmp        r10d, 0x208
0017b 0f85ff240000                   jne        0x7f4c1be73f00
00181 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00186 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0018e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00193 4d85d2                         test       r10, r10
00196 0f8460190000                   je         0x7f4c1be7337c
0019c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001a0 41c1eb0a                       shr        r11d, 0xa
001a4 4181fb07020000                 cmp        r11d, 0x207
001ab 0f85cf240000                   jne        0x7f4c1be73f00
001b1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001bb 4d85d2                         test       r10, r10
001be 0f8445190000                   je         0x7f4c1be73389
001c4 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c8 41c1ea0a                       shr        r10d, 0xa
001cc 4181fa07020000                 cmp        r10d, 0x207
001d3 0f85a7240000                   jne        0x7f4c1be73f00
001d9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001de 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001e6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001eb 4d85d2                         test       r10, r10
001ee 0f8425190000                   je         0x7f4c1be73399
001f4 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f8 41c1eb0a                       shr        r11d, 0xa
001fc 4181fb05020000                 cmp        r11d, 0x205
00203 0f8577240000                   jne        0x7f4c1be73f00
00209 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00211 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00219 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00222 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00227 4585db                         test       r11d, r11d
0022a 0f84ec230000                   je         0x7f4c1be73e9c
00230 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00238 458b5208                       mov        r10d, dword ptr [r10 + 8]
0023c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00241 4585d2                         test       r10d, r10d
00244 0f86d2230000                   jbe        0x7f4c1be73e9c
0024a 4183fa01                       cmp        r10d, 1
0024e 0f86c8230000                   jbe        0x7f4c1be73e9c
00254 4183fa02                       cmp        r10d, 2
00258 0f86be230000                   jbe        0x7f4c1be73e9c
0025e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00266 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0026a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0026f 458d53f1                       lea        r10d, [r11 - 0xf]
00273 4585d2                         test       r10d, r10d
00276 0f8ca0230000                   jl         0x7f4c1be73e9c
0027c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00284 458b5208                       mov        r10d, dword ptr [r10 + 8]
00288 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0028d 458d5af1                       lea        r11d, [r10 - 0xf]
00291 4585db                         test       r11d, r11d
00294 0f8c82230000                   jl         0x7f4c1be73e9c
0029a 4183c2f9                       add        r10d, -7
0029e 4585d2                         test       r10d, r10d
002a1 0f8c75230000                   jl         0x7f4c1be73e9c
002a7 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002ac 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
002b1 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
002b6 458d5af1                       lea        r11d, [r10 - 0xf]
002ba 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002c2 458d51f9                       lea        r10d, [r9 - 7]
002c6 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
002ce 4d63d1                         movsxd     r10, r9d
002d1 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002d6 4183c1f1                       add        r9d, -0xf
002da 44898c24ac000000               mov        dword ptr [rsp + 0xac], r9d
002e2 4983c2f9                       add        r10, -7
002e6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002eb e9cf030000                     jmp        0x7f4c1be71f3f
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
0033d 0f8d71090000                   jge        0x7f4c1be72534
00343 448beb                         mov        r13d, ebx
00346 458bd5                         mov        r10d, r13d
00349 442b9424b4000000               sub        r10d, dword ptr [rsp + 0xb4]
00351 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00358 2bac24b4000000                 sub        ebp, dword ptr [rsp + 0xb4]
0035f 3bac24b4000000                 cmp        ebp, dword ptr [rsp + 0xb4]
00366 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0036e 410f4feb                       cmovg      ebp, r11d
00372 4585d2                         test       r10d, r10d
00375 0f8c091a0000                   jl         0x7f4c1be73604
0037b 4585ed                         test       r13d, r13d
0037e 0f8c001a0000                   jl         0x7f4c1be73604
00384 458d1c2a                       lea        r11d, [r10 + rbp]
00388 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
0038d 453bcb                         cmp        r9d, r11d
00390 0f82ee190000                   jb         0x7f4c1be73604
00396 418bdd                         mov        ebx, r13d
00399 03dd                           add        ebx, ebp
0039b 443bcb                         cmp        r9d, ebx
0039e 0f82e0190000                   jb         0x7f4c1be73604
003a4 85ed                           test       ebp, ebp
003a6 0f8cd8190000                   jl         0x7f4c1be73604
003ac 85ed                           test       ebp, ebp
003ae 0f845fffffff                   je         0x7f4c1be71b93
003b4 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003bc 4b8d742b0c                     lea        rsi, [r11 + r13 + 0xc]
003c1 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
003c6 4863d5                         movsxd     rdx, ebp
003c9 4883fa20                       cmp        rdx, 0x20
003cd 0f861dffffff                   jbe        0x7f4c1be71b70
003d3 c5f877                         vzeroupper 
003d6 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
003e0 41ffd2                         call       r10
003e3 0f1f840000000000               nop        dword ptr [rax + rax]
003eb e923ffffff                     jmp        0x7f4c1be71b93
003f0 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
003f7 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003fe 4103db                         add        ebx, r11d
00401 e99d020000                     jmp        0x7f4c1be71f23
00406 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0040e 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00416 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
0041b 4b8d7c0b0c                     lea        rdi, [r11 + r9 + 0xc]
00420 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00428 44039c24bc000000               add        r11d, dword ptr [rsp + 0xbc]
00430 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00438 4d63c3                         movsxd     r8, r11d
0043b 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00443 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0044b 0f8cec050000                   jl         0x7f4c1be722bd
00451 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00459 4183fb30                       cmp        r11d, 0x30
0045d 0f8e9d000000                   jle        0x7f4c1be71d80
00463 4585c9                         test       r9d, r9d
00466 0f8c44180000                   jl         0x7f4c1be73530
0046c 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00474 4585db                         test       r11d, r11d
00477 0f8c33180000                   jl         0x7f4c1be73530
0047d 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00485 4503d9                         add        r11d, r9d
00488 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0048d 453bc3                         cmp        r8d, r11d
00490 0f821a180000                   jb         0x7f4c1be73530
00496 443b8424c0000000               cmp        r8d, dword ptr [rsp + 0xc0]
0049e 0f820c180000                   jb         0x7f4c1be73530
004a4 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
004ac 4585db                         test       r11d, r11d
004af 0f84e0010000                   je         0x7f4c1be71f15
004b5 4963d3                         movsxd     rdx, r11d
004b8 4883fa20                       cmp        rdx, 0x20
004bc 7725                           ja         0x7f4c1be71d63
004be 4d63d3                         movsxd     r10, r11d
004c1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004c8 c442a8f5db                     bzhi       r11, r11, r10
004cd c4c1fb92fb                     kmovq      k7, r11
004d2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004d8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004de e9b2010000                     jmp        0x7f4c1be71f15
004e3 c5f877                         vzeroupper 
004e6 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
004f0 41ffd2                         call       r10
004f3 0f1f840000000000               nop        dword ptr [rax + rax]
004fb e995010000                     jmp        0x7f4c1be71f15
00500 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
00508 0f8322140000                   jae        0x7f4c1be731b0
0050e 4963f9                         movsxd     rdi, r9d
00511 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00519 4d8b5c3a0c                     mov        r11, qword ptr [r10 + rdi + 0xc]
0051e 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00526 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
0052e 0f83cc140000                   jae        0x7f4c1be73280
00534 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0053b 8d5908                         lea        ebx, [rcx + 8]
0053e 4c63d1                         movsxd     r10, ecx
00541 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
00549 4e895c120c                     mov        qword ptr [rdx + r10 + 0xc], r11
0054e 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00555 0f8d3a010000                   jge        0x7f4c1be71f15
0055b 492bfa                         sub        rdi, r10
0055e 4c63db                         movsxd     r11, ebx
00561 4d8d143b                       lea        r10, [r11 + rdi]
00565 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0056a 0f83b9150000                   jae        0x7f4c1be733a9
00570 4d8bd0                         mov        r10, r8
00573 4d2bd3                         sub        r10, r11
00576 4983c207                       add        r10, 7
0057a 4983e2f8                       and        r10, 0xfffffffffffffff8
0057e 458bda                         mov        r11d, r10d
00581 458d540b08                     lea        r10d, [r11 + rcx + 8]
00586 4d63d2                         movsxd     r10, r10d
00589 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
0058e 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
00593 0f8390150000                   jae        0x7f4c1be733a9
00599 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
005a0 0f8383150000                   jae        0x7f4c1be733a9
005a6 4983c2f8                       add        r10, -8
005aa 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005af 0f8374150000                   jae        0x7f4c1be733a9
005b5 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
005bd 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
005c4 0f8f2a160000                   jg         0x7f4c1be73474
005ca 442bc9                         sub        r9d, ecx
005cd 83c110                         add        ecx, 0x10
005d0 458d1c19                       lea        r11d, [r9 + rbx]
005d4 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
005dc 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
005e1 448bd3                         mov        r10d, ebx
005e4 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
005ec 4e895c170c                     mov        qword ptr [rdi + r10 + 0xc], r11
005f1 83c308                         add        ebx, 8
005f4 3bd9                           cmp        ebx, ecx
005f6 7cd8                           jl         0x7f4c1be71e50
005f8 4983c0f8                       add        r8, -8
005fc 4981f800000080                 cmp        r8, -0x80000000
00603 49c7c200000080                 mov        r10, 0xffffffff80000000
0060a 4d0f4cc2                       cmovl      r8, r10
0060e 458bd8                         mov        r11d, r8d
00611 413bdb                         cmp        ebx, r11d
00614 7d49                           jge        0x7f4c1be71edf
00616 66660f1f840000000000           nop        word ptr [rax + rax]
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
0065d 7cc1                           jl         0x7f4c1be71ea0
0065f 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00666 7d2d                           jge        0x7f4c1be71f15
00668 458d1c19                       lea        r11d, [r9 + rbx]
0066c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00674 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
00679 448bd3                         mov        r10d, ebx
0067c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00684 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
00689 83c308                         add        ebx, 8
0068c 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00693 7cd3                           jl         0x7f4c1be71ee8
00695 8b9c24bc000000                 mov        ebx, dword ptr [rsp + 0xbc]
0069c 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
006a3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006a7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006ac 41ffc3                         inc        r11d
006af 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
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
006eb 0f8df1050000                   jge        0x7f4c1be72562
006f1 443b442408                     cmp        r8d, dword ptr [rsp + 8]
006f6 0f83f50c0000                   jae        0x7f4c1be72c71
006fc 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00704 4f8b54c210                     mov        r10, qword ptr [r10 + r8*8 + 0x10]
00709 418bc2                         mov        eax, r10d
0070c 25ffff0100                     and        eax, 0x1ffff
00711 4d8bc2                         mov        r8, r10
00714 49c1e812                       shr        r8, 0x12
00718 49c1fa24                       sar        r10, 0x24
0071c 458bc0                         mov        r8d, r8d
0071f 458bd2                         mov        r10d, r10d
00722 418bca                         mov        ecx, r10d
00725 4181e0ffff0300                 and        r8d, 0x3ffff
0072c 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00734 4585d2                         test       r10d, r10d
00737 0f8c7f0f0000                   jl         0x7f4c1be72f3c
0073d 85c0                           test       eax, eax
0073f 0f852f020000                   jne        0x7f4c1be721f4
00745 4533d2                         xor        r10d, r10d
00748 418bc2                         mov        eax, r10d
0074b 448bd1                         mov        r10d, ecx
0074e 4183fa03                       cmp        r10d, 3
00752 0f8e40020000                   jle        0x7f4c1be72218
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
007a1 0f8f9d0f0000                   jg         0x7f4c1be72fc4
007a7 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
007af 4585c0                         test       r8d, r8d
007b2 0f8ee40e0000                   jle        0x7f4c1be72f1c
007b8 448d2c03                       lea        r13d, [rbx + rax]
007bc 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
007c4 4503dd                         add        r11d, r13d
007c7 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
007cc 0f8f1a100000                   jg         0x7f4c1be7306c
007d2 458d1c06                       lea        r11d, [r14 + rax]
007d6 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
007de 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
007e6 0f8f9c100000                   jg         0x7f4c1be73108
007ec 83f810                         cmp        eax, 0x10
007ef 0f8f72050000                   jg         0x7f4c1be725e7
007f5 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
007fd 0f836d0c0000                   jae        0x7f4c1be72cf0
00803 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0080b c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
00812 3b9c24ac000000                 cmp        ebx, dword ptr [rsp + 0xac]
00819 0f83010d0000                   jae        0x7f4c1be72da0
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
00862 0f8f9efbffff                   jg         0x7f4c1be71c86
00868 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00870 4183fb10                       cmp        r11d, 0x10
00874 0f8c8cfbffff                   jl         0x7f4c1be71c86
0087a 443b8c24ac000000               cmp        r9d, dword ptr [rsp + 0xac]
00882 0f83740d0000                   jae        0x7f4c1be72e7c
00888 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00890 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00897 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0089f 443b9c24ac000000               cmp        r11d, dword ptr [rsp + 0xac]
008a7 0f8243fbffff                   jb         0x7f4c1be71c70
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
00958 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00961 666690                         nop        
00964 c5f877                         vzeroupper 
00967 e8745bb6ff                     call       0x7f4c1b9d7d60
0096c 0f1f8400640a0002               nop        dword ptr [rax + rax + 0x2000a64]
00974 413bc3                         cmp        eax, r11d
00977 0f8ecefdffff                   jle        0x7f4c1be71fcb
0097d be45ffffff                     mov        esi, 0xffffff45
00982 8be8                           mov        ebp, eax
00984 44891c24                       mov        dword ptr [rsp], r11d
00988 c5f877                         vzeroupper 
0098b e8505bb6ff                     call       0x7f4c1b9d7d60
00990 0f1f8400880a0003               nop        dword ptr [rax + rax + 0x3000a88]
00998 85c0                           test       eax, eax
0099a 7407                           je         0x7f4c1be72223
0099c 448d51ff                       lea        r10d, [rcx - 1]
009a0 418bca                         mov        ecx, r10d
009a3 85c9                           test       ecx, ecx
009a5 747d                           je         0x7f4c1be722a4
009a7 83f903                         cmp        ecx, 3
009aa 0f8420160000                   je         0x7f4c1be73850
009b0 83f902                         cmp        ecx, 2
009b3 0f87cb160000                   ja         0x7f4c1be73904
009b9 3b4c240c                       cmp        ecx, dword ptr [rsp + 0xc]
009bd 0f8385140000                   jae        0x7f4c1be736c8
009c3 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
009cb 458b448b0c                     mov        r8d, dword ptr [r11 + rcx*4 + 0xc]
009d0 85c9                           test       ecx, ecx
009d2 7e42                           jle        0x7f4c1be72296
009d4 448d51ff                       lea        r10d, [rcx - 1]
009d8 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
009dd 0f8331150000                   jae        0x7f4c1be73794
009e3 0f1f8000000000                 nop        dword ptr [rax]
009ea 660f1f440000                   nop        word ptr [rax + rax]
009f0 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
009f8 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
009fd 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
00a05 458954890c                     mov        dword ptr [r9 + rcx*4 + 0xc], r10d
00a0a 448d51ff                       lea        r10d, [rcx - 1]
00a0e 418bca                         mov        ecx, r10d
00a11 4585d2                         test       r10d, r10d
00a14 7fda                           jg         0x7f4c1be72270
00a16 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a1e 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00a22 eb0c                           jmp        0x7f4c1be722b0
00a24 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a2c 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
00a30 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
00a38 e94bfdffff                     jmp        0x7f4c1be72008
00a3d 4183fa10                       cmp        r10d, 0x10
00a41 0f8d591b0000                   jge        0x7f4c1be73e20
00a47 4183fa08                       cmp        r10d, 8
00a4b 0f8d51060000                   jge        0x7f4c1be72922
00a51 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a59 4183fb10                       cmp        r11d, 0x10
00a5d 0f8eb3000000                   jle        0x7f4c1be72396
00a63 4585c9                         test       r9d, r9d
00a66 0f8c681a0000                   jl         0x7f4c1be73d54
00a6c 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00a74 4585d2                         test       r10d, r10d
00a77 0f8c571a0000                   jl         0x7f4c1be73d54
00a7d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00a82 443b9c24bc000000               cmp        r11d, dword ptr [rsp + 0xbc]
00a8a 0f82441a0000                   jb         0x7f4c1be73d54
00a90 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
00a98 4403ac24bc000000               add        r13d, dword ptr [rsp + 0xbc]
00aa0 453bdd                         cmp        r11d, r13d
00aa3 0f822b1a0000                   jb         0x7f4c1be73d54
00aa9 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00ab1 4585db                         test       r11d, r11d
00ab4 0f8c1a1a0000                   jl         0x7f4c1be73d54
00aba 4585db                         test       r11d, r11d
00abd 0f8483f8ffff                   je         0x7f4c1be71bc6
00ac3 4883fd20                       cmp        rbp, 0x20
00ac7 772d                           ja         0x7f4c1be72376
00ac9 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00ad1 4d63d2                         movsxd     r10, r10d
00ad4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00adb c442a8f5db                     bzhi       r11, r11, r10
00ae0 c4c1fb92fb                     kmovq      k7, r11
00ae5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aeb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00af1 e950f8ffff                     jmp        0x7f4c1be71bc6
00af6 488bd5                         mov        rdx, rbp
00af9 c5f877                         vzeroupper 
00afc 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00b06 41ffd2                         call       r10
00b09 0f1f840000000000               nop        dword ptr [rax + rax]
00b11 e930f8ffff                     jmp        0x7f4c1be71bc6
00b16 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00b1b 0f8317160000                   jae        0x7f4c1be739b8
00b21 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b29 430fbe6c0a0c                   movsx      ebp, byte ptr [r10 + r9 + 0xc]
00b2f 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b37 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00b3c 0f83c6160000                   jae        0x7f4c1be73a88
00b42 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00b4a 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b52 43886c130c                     mov        byte ptr [r11 + r10 + 0xc], bpl
00b57 458d5103                       lea        r10d, [r9 + 3]
00b5b 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00b63 41ffc0                         inc        r8d
00b66 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b6b 0f8343170000                   jae        0x7f4c1be73b34
00b71 4d63d9                         movsxd     r11, r9d
00b74 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b7c 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00b82 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b8a 4183c203                       add        r10d, 3
00b8e 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b93 0f83df170000                   jae        0x7f4c1be73bf8
00b99 4c639424bc000000               movsxd     r10, dword ptr [rsp + 0xbc]
00ba1 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00ba9 43886c100d                     mov        byte ptr [r8 + r10 + 0xd], bpl
00bae 470fbe44180e                   movsx      r8d, byte ptr [r8 + r11 + 0xe]
00bb4 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00bbc 468844110e                     mov        byte ptr [rcx + r10 + 0xe], r8b
00bc1 460fbe5c190f                   movsx      r11d, byte ptr [rcx + r11 + 0xf]
00bc7 46885c110f                     mov        byte ptr [rcx + r10 + 0xf], r11b
00bcc 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00bd4 4183fb08                       cmp        r11d, 8
00bd8 0f834e180000                   jae        0x7f4c1be73cac
00bde 49bae0df2fe300000000           movabs     r10, 0xe32fdfe0
00be8 47034c9a0c                     add        r9d, dword ptr [r10 + r11*4 + 0xc]
00bed 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00bf2 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00bfa 4183fa04                       cmp        r10d, 4
00bfe 7e44                           jle        0x7f4c1be724c4
00c00 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00c07 83c504                         add        ebp, 4
00c0a 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c12 418bd1                         mov        edx, r9d
00c15 666690                         nop        
00c18 c5f877                         vzeroupper 
00c1b e8c0e3a9ff                     call       0x7f4c1b910860
00c20 0f1f8400180d0004               nop        dword ptr [rax + rax + 0x4000d18]
00c28 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c30 8bd5                           mov        edx, ebp
00c32 8bc8                           mov        ecx, eax
00c34 c5f877                         vzeroupper 
00c37 e8a4e3a9ff                     call       0x7f4c1b910860
00c3c 0f1f8400340d0005               nop        dword ptr [rax + rax + 0x5000d34]
00c44 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00c4c 4183fa08                       cmp        r10d, 8
00c50 7e62                           jle        0x7f4c1be72534
00c52 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00c56 49ba10e02fe300000000           movabs     r10, 0xe32fe010
00c60 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00c68 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00c6d 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00c74 83c508                         add        ebp, 8
00c77 83c208                         add        edx, 8
00c7a 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c82 6690                           nop        
00c84 c5f877                         vzeroupper 
00c87 e854e3a9ff                     call       0x7f4c1b910860
00c8c 0f1f8400840d0006               nop        dword ptr [rax + rax + 0x6000d84]
00c94 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c9c 8bd5                           mov        edx, ebp
00c9e 488bc8                         mov        rcx, rax
00ca1 666690                         nop        
00ca4 c5f877                         vzeroupper 
00ca7 e834e3a9ff                     call       0x7f4c1b910860
00cac 0f1f8400a40d0007               nop        dword ptr [rax + rax + 0x7000da4]
00cb4 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00cbb e9e3f9ffff                     jmp        0x7f4c1be71f23
00cc0 4d63d3                         movsxd     r10, r11d
00cc3 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cca c442a8f5db                     bzhi       r11, r11, r10
00ccf c4c1fb92fb                     kmovq      k7, r11
00cd4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cda 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ce0 eb67                           jmp        0x7f4c1be725c9
00ce2 4585f6                         test       r14d, r14d
00ce5 0f8cf1190000                   jl         0x7f4c1be73f5c
00ceb 85db                           test       ebx, ebx
00ced 0f8ce9190000                   jl         0x7f4c1be73f5c
00cf3 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00cf8 443b442410                     cmp        r8d, dword ptr [rsp + 0x10]
00cfd 0f82d9190000                   jb         0x7f4c1be73f5c
00d03 428d2c1b                       lea        ebp, [rbx + r11]
00d07 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00d0c 443bd5                         cmp        r10d, ebp
00d0f 0f82c7190000                   jb         0x7f4c1be73f5c
00d15 4585db                         test       r11d, r11d
00d18 0f8cbe190000                   jl         0x7f4c1be73f5c
00d1e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00d23 453bc6                         cmp        r8d, r14d
00d26 7421                           je         0x7f4c1be725c9
00d28 4963d3                         movsxd     rdx, r11d
00d2b 4883fa20                       cmp        rdx, 0x20
00d2f 768f                           jbe        0x7f4c1be72540
00d31 c5f877                         vzeroupper 
00d34 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00d3e 41ffd2                         call       r10
00d41 0f1f840000000000               nop        dword ptr [rax + rax]
00d49 4c8b1424                       mov        r10, qword ptr [rsp]
00d4d 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00d51 c5f877                         vzeroupper 
00d54 4881c4f0000000                 add        rsp, 0xf0
00d5b 5d                             pop        rbp
00d5c 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d60 0f87ea200000                   ja         0x7f4c1be746d0
00d66 c3                             ret        
00d67 83f830                         cmp        eax, 0x30
00d6a 0f8e83000000                   jle        0x7f4c1be72673
00d70 4585f6                         test       r14d, r14d
00d73 0f8c5f1e0000                   jl         0x7f4c1be74458
00d79 85db                           test       ebx, ebx
00d7b 0f8c571e0000                   jl         0x7f4c1be74458
00d81 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00d86 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00d8e 0f82441e0000                   jb         0x7f4c1be74458
00d94 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00d99 453bd5                         cmp        r10d, r13d
00d9c 0f82361e0000                   jb         0x7f4c1be74458
00da2 85c0                           test       eax, eax
00da4 7426                           je         0x7f4c1be7264c
00da6 4883fa20                       cmp        rdx, 0x20
00daa 772d                           ja         0x7f4c1be72659
00dac 4c63d0                         movsxd     r10, eax
00daf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00db6 c442a8f5db                     bzhi       r11, r11, r10
00dbb c4c1fb92fb                     kmovq      k7, r11
00dc0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dc6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00dcc 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
00dd4 e96dfaffff                     jmp        0x7f4c1be720c6
00dd9 c5f877                         vzeroupper 
00ddc 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00de6 41ffd2                         call       r10
00de9 0f1f840000000000               nop        dword ptr [rax + rax]
00df1 ebd9                           jmp        0x7f4c1be7264c
00df3 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
00dfb 0f83131c0000                   jae        0x7f4c1be74294
00e01 4d63d6                         movsxd     r10, r14d
00e04 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00e0c c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00e13 3b9c24ac000000                 cmp        ebx, dword ptr [rsp + 0xac]
00e1a 0f83c81c0000                   jae        0x7f4c1be74368
00e20 8d5310                         lea        edx, [rbx + 0x10]
00e23 4c63db                         movsxd     r11, ebx
00e26 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00e2e c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00e35 413bd5                         cmp        edx, r13d
00e38 0f8d4b020000                   jge        0x7f4c1be72909
00e3e 4d2bd3                         sub        r10, r11
00e41 4c63ca                         movsxd     r9, edx
00e44 48634c241c                     movsxd     rcx, dword ptr [rsp + 0x1c]
00e49 4883c1f1                       add        rcx, -0xf
00e4d 4f8d1c11                       lea        r11, [r9 + r10]
00e51 4c3bd9                         cmp        r11, rcx
00e54 0f83561e0000                   jae        0x7f4c1be74530
00e5a 4d63dd                         movsxd     r11, r13d
00e5d 498bfb                         mov        rdi, r11
00e60 492bf9                         sub        rdi, r9
00e63 4883c70f                       add        rdi, 0xf
00e67 4883e7f0                       and        rdi, 0xfffffffffffffff0
00e6b 448bcf                         mov        r9d, edi
00e6e 458d4c1910                     lea        r9d, [r9 + rbx + 0x10]
00e73 4d63c9                         movsxd     r9, r9d
00e76 4f8d5411f0                     lea        r10, [r9 + r10 - 0x10]
00e7b 4c3bd1                         cmp        r10, rcx
00e7e 0f832c1e0000                   jae        0x7f4c1be74530
00e84 3b9424ac000000                 cmp        edx, dword ptr [rsp + 0xac]
00e8b 0f831f1e0000                   jae        0x7f4c1be74530
00e91 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00e96 4983c2f1                       add        r10, -0xf
00e9a 4983c1f0                       add        r9, -0x10
00e9e 4d3bca                         cmp        r9, r10
00ea1 0f83091e0000                   jae        0x7f4c1be74530
00ea7 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00eae 0f8fb01e0000                   jg         0x7f4c1be745e4
00eb4 458bce                         mov        r9d, r14d
00eb7 442bcb                         sub        r9d, ebx
00eba 83c320                         add        ebx, 0x20
00ebd 666690                         nop        
00ec0 448bd2                         mov        r10d, edx
00ec3 458d0411                       lea        r8d, [r9 + rdx]
00ec7 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00ecf c4a17a6f44010c                 vmovdqu    xmm0, xmmword ptr [rcx + r8 + 0xc]
00ed6 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00ede c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
00ee5 448d5210                       lea        r10d, [rdx + 0x10]
00ee9 418bd2                         mov        edx, r10d
00eec 443bd3                         cmp        r10d, ebx
00eef 7ccf                           jl         0x7f4c1be72740
00ef1 4981c310ffffff                 add        r11, -0xf0
00ef8 4981fb00000080                 cmp        r11, -0x80000000
00eff 49c7c000000080                 mov        r8, 0xffffffff80000000
00f06 4d0f4cd8                       cmovl      r11, r8
00f0a 458bc3                         mov        r8d, r11d
00f0d 453bd0                         cmp        r10d, r8d
00f10 0f8d3f010000                   jge        0x7f4c1be728d5
00f16 418bd2                         mov        edx, r10d
00f19 0f1f8000000000                 nop        dword ptr [rax]
00f20 448bd2                         mov        r10d, edx
00f23 4d63d2                         movsxd     r10, r10d
00f26 448bda                         mov        r11d, edx
00f29 418d1c11                       lea        ebx, [r9 + rdx]
00f2d 8bcb                           mov        ecx, ebx
00f2f 488bbc2490000000               mov        rdi, qword ptr [rsp + 0x90]
00f37 c5fa6f441f0c                   vmovdqu    xmm0, xmmword ptr [rdi + rbx + 0xc]
00f3d 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00f45 c4a17a7f441b0c                 vmovdqu    xmmword ptr [rbx + r11 + 0xc], xmm0
00f4c 4863c9                         movsxd     rcx, ecx
00f4f c5fa6f440f1c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x1c]
00f55 c4a17a7f44131c                 vmovdqu    xmmword ptr [rbx + r10 + 0x1c], xmm0
00f5c c5fa6f440f2c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x2c]
00f62 c4a17a7f44132c                 vmovdqu    xmmword ptr [rbx + r10 + 0x2c], xmm0
00f69 c5fa6f440f3c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x3c]
00f6f c4a17a7f44133c                 vmovdqu    xmmword ptr [rbx + r10 + 0x3c], xmm0
00f76 c5fa6f440f4c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x4c]
00f7c c4a17a7f44134c                 vmovdqu    xmmword ptr [rbx + r10 + 0x4c], xmm0
00f83 c5fa6f440f5c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x5c]
00f89 c4a17a7f44135c                 vmovdqu    xmmword ptr [rbx + r10 + 0x5c], xmm0
00f90 c5fa6f440f6c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x6c]
00f96 c4a17a7f44136c                 vmovdqu    xmmword ptr [rbx + r10 + 0x6c], xmm0
00f9d c5fa6f440f7c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x7c]
00fa3 c4a17a7f44137c                 vmovdqu    xmmword ptr [rbx + r10 + 0x7c], xmm0
00faa c5fa6f840f8c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x8c]
00fb3 c4a17a7f84138c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x8c], xmm0
00fbd c5fa6f840f9c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x9c]
00fc6 c4a17a7f84139c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x9c], xmm0
00fd0 c5fa6f840fac000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xac]
00fd9 c4a17a7f8413ac000000           vmovdqu    xmmword ptr [rbx + r10 + 0xac], xmm0
00fe3 c5fa6f840fbc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xbc]
00fec c4a17a7f8413bc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xbc], xmm0
00ff6 c5fa6f840fcc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xcc]
00fff c4a17a7f8413cc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xcc], xmm0
01009 c5fa6f840fdc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xdc]
01012 c4a17a7f8413dc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xdc], xmm0
0101c c5fa6f840fec000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xec]
01025 c4a17a7f8413ec000000           vmovdqu    xmmword ptr [rbx + r10 + 0xec], xmm0
0102f c5fa6f840ffc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xfc]
01038 c4a17a7f8413fc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xfc], xmm0
01042 448d9200010000                 lea        r10d, [rdx + 0x100]
01049 418bd2                         mov        edx, r10d
0104c 453bd0                         cmp        r10d, r8d
0104f 0f8ccbfeffff                   jl         0x7f4c1be727a0
01055 413bd5                         cmp        edx, r13d
01058 7d2f                           jge        0x7f4c1be72909
0105a 6690                           nop        
0105c 458d1411                       lea        r10d, [r9 + rdx]
01060 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01068 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
0106f 448bda                         mov        r11d, edx
01072 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0107a c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
01081 83c210                         add        edx, 0x10
01084 413bd5                         cmp        edx, r13d
01087 7cd3                           jl         0x7f4c1be728dc
01089 468d1430                       lea        r10d, [rax + r14]
0108d 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
01095 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
0109d e9a4f7ffff                     jmp        0x7f4c1be720c6
010a2 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
010aa 0f8354160000                   jae        0x7f4c1be73f84
010b0 4963f9                         movsxd     rdi, r9d
010b3 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
010bb 498b4c3a0c                     mov        rcx, qword ptr [r10 + rdi + 0xc]
010c0 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
010c8 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
010d0 0f83ee160000                   jae        0x7f4c1be74044
010d6 418d6b08                       lea        ebp, [r11 + 8]
010da 4d63d3                         movsxd     r10, r11d
010dd 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
010e5 4a894c130c                     mov        qword ptr [rbx + r10 + 0xc], rcx
010ea 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
010f1 0f8dee020000                   jge        0x7f4c1be72c65
010f7 492bfa                         sub        rdi, r10
010fa 4863dd                         movsxd     rbx, ebp
010fd 4c8d143b                       lea        r10, [rbx + rdi]
01101 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01106 0f8380170000                   jae        0x7f4c1be7410c
0110c 4d8bd0                         mov        r10, r8
0110f 4c2bd3                         sub        r10, rbx
01112 4983c207                       add        r10, 7
01116 4983e2f8                       and        r10, 0xfffffffffffffff8
0111a 418bca                         mov        ecx, r10d
0111d 468d541908                     lea        r10d, [rcx + r11 + 8]
01122 4d63d2                         movsxd     r10, r10d
01125 498d4c3af8                     lea        rcx, [r10 + rdi - 8]
0112a 483b4c2438                     cmp        rcx, qword ptr [rsp + 0x38]
0112f 0f8357170000                   jae        0x7f4c1be7410c
01135 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
0113c 0f834a170000                   jae        0x7f4c1be7410c
01142 4983c2f8                       add        r10, -8
01146 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0114b 0f833b170000                   jae        0x7f4c1be7410c
01151 baf4ffffff                     mov        edx, 0xfffffff4
01156 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0115e 498bf2                         mov        rsi, r10
01161 418bca                         mov        ecx, r10d
01164 2bd1                           sub        edx, ecx
01166 412bd3                         sub        edx, r11d
01169 83c2f0                         add        edx, -0x10
0116c 418d4b10                       lea        ecx, [r11 + 0x10]
01170 4c63d1                         movsxd     r10, ecx
01173 bf06000000                     mov        edi, 6
01178 c4e2c0f5ca                     bzhi       rcx, rdx, rdi
0117d 4c03d1                         add        r10, rcx
01180 4d3bd0                         cmp        r10, r8
01183 498bf8                         mov        rdi, r8
01186 490f4cfa                       cmovl      rdi, r10
0118a 4c8bd7                         mov        r10, rdi
0118d 4c2bd3                         sub        r10, rbx
01190 498d4aff                       lea        rcx, [r10 - 1]
01194 48c1f93f                       sar        rcx, 0x3f
01198 48c1e93d                       shr        rcx, 0x3d
0119c 4e8d5411ff                     lea        r10, [rcx + r10 - 1]
011a1 4983e2f8                       and        r10, 0xfffffffffffffff8
011a5 4c03d3                         add        r10, rbx
011a8 493bda                         cmp        rbx, r10
011ab 490f4cda                       cmovl      rbx, r10
011af 8bcb                           mov        ecx, ebx
011b1 448d5108                       lea        r10d, [rcx + 8]
011b5 2b8c24b4000000                 sub        ecx, dword ptr [rsp + 0xb4]
011bc 4963da                         movsxd     rbx, r10d
011bf 4803de                         add        rbx, rsi
011c2 83c108                         add        ecx, 8
011c5 4863c9                         movsxd     rcx, ecx
011c8 4803ce                         add        rcx, rsi
011cb 488d534c                       lea        rdx, [rbx + 0x4c]
011cf 4883c30c                       add        rbx, 0xc
011d3 488d710c                       lea        rsi, [rcx + 0xc]
011d7 4533d2                         xor        r10d, r10d
011da 483bd6                         cmp        rdx, rsi
011dd 410f96c2                       setbe      r10b
011e1 4883c14c                       add        rcx, 0x4c
011e5 33d2                           xor        edx, edx
011e7 483bcb                         cmp        rcx, rbx
011ea 0f96c2                         setbe      dl
011ed 440bd2                         or         r10d, edx
011f0 0f841e170000                   je         0x7f4c1be74194
011f6 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
011fe 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01205 0f8f91170000                   jg         0x7f4c1be7421c
0120b 452bcb                         sub        r9d, r11d
0120e 448bdf                         mov        r11d, edi
01211 666690                         nop        
01214 418d0c29                       lea        ecx, [r9 + rbp]
01218 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01220 4d8b540a0c                     mov        r10, qword ptr [r10 + rcx + 0xc]
01225 8bdd                           mov        ebx, ebp
01227 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
0122f 4c8954190c                     mov        qword ptr [rcx + rbx + 0xc], r10
01234 83c508                         add        ebp, 8
01237 413beb                         cmp        ebp, r11d
0123a 7cd8                           jl         0x7f4c1be72a94
0123c 4d8d9008feffff                 lea        r10, [r8 - 0x1f8]
01243 4981fa00000080                 cmp        r10, -0x80000000
0124a 49c7c300000080                 mov        r11, 0xffffffff80000000
01251 4d0f4cd3                       cmovl      r10, r11
01255 418bca                         mov        ecx, r10d
01258 3be9                           cmp        ebp, ecx
0125a 0f8d4d010000                   jge        0x7f4c1be72c2d
01260 448d9d00010000                 lea        r11d, [rbp + 0x100]
01267 4503d9                         add        r11d, r9d
0126a 448d9580000000                 lea        r10d, [rbp + 0x80]
01271 4503d1                         add        r10d, r9d
01274 418bd3                         mov        edx, r11d
01277 4963f3                         movsxd     rsi, r11d
0127a 418bfa                         mov        edi, r10d
0127d 4d63ea                         movsxd     r13, r10d
01280 8bdd                           mov        ebx, ebp
01282 418d0429                       lea        eax, [r9 + rbp]
01286 448bdd                         mov        r11d, ebp
01289 4d63f3                         movsxd     r14, r11d
0128c 448bd0                         mov        r10d, eax
0128f 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01297 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
012a2 62d17e487f841b0c000000         vmovdqu32  zmmword ptr [r11 + rbx + 0xc], zmm0
012ad 4c63d8                         movsxd     r11, eax
012b0 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
012b8 62917e486f841a4c000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x4c]
012c3 62917e487f84324c000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x4c], zmm0
012ce 62d17e486f843a0c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rdi + 0xc]
012d9 62917e487f84328c000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x8c], zmm0
012e4 62917e486f842a4c000000         vmovdqu32  zmm0, zmmword ptr [r10 + r13 + 0x4c]
012ef 62917e487f8432cc000000         vmovdqu32  zmmword ptr [r10 + r14 + 0xcc], zmm0
012fa 62d17e486f84120c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rdx + 0xc]
01305 62917e487f84320c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x10c], zmm0
01310 62d17e486f84324c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rsi + 0x4c]
0131b 62917e487f84324c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x14c], zmm0
01326 62917e486f841a8c010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x18c]
01331 62917e487f84328c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x18c], zmm0
0133c 62917e486f841acc010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x1cc]
01347 62917e487f8432cc010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x1cc], zmm0
01352 81c500020000                   add        ebp, 0x200
01358 3be9                           cmp        ebp, ecx
0135a 0f8c00ffffff                   jl         0x7f4c1be72ae0
01360 4983c0c8                       add        r8, -0x38
01364 4981f800000080                 cmp        r8, -0x80000000
0136b 49c7c200000080                 mov        r10, 0xffffffff80000000
01372 4d0f4cc2                       cmovl      r8, r10
01376 458bd0                         mov        r10d, r8d
01379 413bea                         cmp        ebp, r10d
0137c 7d2f                           jge        0x7f4c1be72c2d
0137e 6690                           nop        
01380 458d1c29                       lea        r11d, [r9 + rbp]
01384 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0138c 62917e486f84180c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 0xc]
01397 448bdd                         mov        r11d, ebp
0139a 62917e487f84180c000000         vmovdqu32  zmmword ptr [r8 + r11 + 0xc], zmm0
013a5 83c540                         add        ebp, 0x40
013a8 413bea                         cmp        ebp, r10d
013ab 7cd3                           jl         0x7f4c1be72c00
013ad 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
013b4 7d2f                           jge        0x7f4c1be72c65
013b6 6690                           nop        
013b8 458d1429                       lea        r10d, [r9 + rbp]
013bc 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
013c4 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
013c9 448bdd                         mov        r11d, ebp
013cc 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
013d4 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
013d9 83c508                         add        ebp, 8
013dc 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
013e3 7cd3                           jl         0x7f4c1be72c38
013e5 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
013ec e9b2f2ffff                     jmp        0x7f4c1be71f23
013f1 bee4ffffff                     mov        esi, 0xffffffe4
013f6 488b2c24                       mov        rbp, qword ptr [rsp]
013fa 48894424f8                     mov        qword ptr [rsp - 8], rax
013ff 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01403 89442408                       mov        dword ptr [rsp + 8], eax
01407 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0140c 48ff742420                     push       qword ptr [rsp + 0x20]
01411 488f442418                     pop        qword ptr [rsp + 0x18]
01416 48894424f8                     mov        qword ptr [rsp - 8], rax
0141b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0141f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01423 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01428 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0142c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01431 48894424f8                     mov        qword ptr [rsp - 8], rax
01436 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0143a 89442438                       mov        dword ptr [rsp + 0x38], eax
0143e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01443 48ff742468                     push       qword ptr [rsp + 0x68]
01448 488f442440                     pop        qword ptr [rsp + 0x40]
0144d 48894424f8                     mov        qword ptr [rsp - 8], rax
01452 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01456 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0145a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145f 90                             nop        
01460 c5f877                         vzeroupper 
01463 e87850b6ff                     call       0x7f4c1b9d7d60
01468 0f1f840060150008               nop        dword ptr [rax + rax + 0x8001560]
01470 bee4ffffff                     mov        esi, 0xffffffe4
01475 488b2c24                       mov        rbp, qword ptr [rsp]
01479 48894424f8                     mov        qword ptr [rsp - 8], rax
0147e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01482 89442408                       mov        dword ptr [rsp + 8], eax
01486 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148b 48ff742420                     push       qword ptr [rsp + 0x20]
01490 488f442418                     pop        qword ptr [rsp + 0x18]
01495 48894424f8                     mov        qword ptr [rsp - 8], rax
0149a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0149e 8944240c                       mov        dword ptr [rsp + 0xc], eax
014a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014ab 48894424f8                     mov        qword ptr [rsp - 8], rax
014b0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014b4 89442438                       mov        dword ptr [rsp + 0x38], eax
014b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bd 48ff742468                     push       qword ptr [rsp + 0x68]
014c2 488f442440                     pop        qword ptr [rsp + 0x40]
014c7 48894424f8                     mov        qword ptr [rsp - 8], rax
014cc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014d0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d9 48ff742478                     push       qword ptr [rsp + 0x78]
014de 488f442450                     pop        qword ptr [rsp + 0x50]
014e3 48894424f8                     mov        qword ptr [rsp - 8], rax
014e8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
014ec 89442458                       mov        dword ptr [rsp + 0x58], eax
014f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f5 48894424f8                     mov        qword ptr [rsp - 8], rax
014fa 8b442470                       mov        eax, dword ptr [rsp + 0x70]
014fe 89442460                       mov        dword ptr [rsp + 0x60], eax
01502 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01507 89442464                       mov        dword ptr [rsp + 0x64], eax
0150b 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01510 c5f877                         vzeroupper 
01513 e8c84fb6ff                     call       0x7f4c1b9d7d60
01518 0f1f840010160009               nop        dword ptr [rax + rax + 0x9001610]
01520 bee4ffffff                     mov        esi, 0xffffffe4
01525 488b2c24                       mov        rbp, qword ptr [rsp]
01529 48894424f8                     mov        qword ptr [rsp - 8], rax
0152e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01532 89442408                       mov        dword ptr [rsp + 8], eax
01536 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153b 48ff742420                     push       qword ptr [rsp + 0x20]
01540 488f442418                     pop        qword ptr [rsp + 0x18]
01545 48894424f8                     mov        qword ptr [rsp - 8], rax
0154a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0154e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01552 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01557 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0155c 48894424f8                     mov        qword ptr [rsp - 8], rax
01561 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01565 89442438                       mov        dword ptr [rsp + 0x38], eax
01569 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156e 48ff742468                     push       qword ptr [rsp + 0x68]
01573 488f442440                     pop        qword ptr [rsp + 0x40]
01578 48894424f8                     mov        qword ptr [rsp - 8], rax
0157d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01581 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01585 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0158a 48ffb42488000000               push       qword ptr [rsp + 0x88]
01592 488f442448                     pop        qword ptr [rsp + 0x48]
01597 48ff742478                     push       qword ptr [rsp + 0x78]
0159c 488f442450                     pop        qword ptr [rsp + 0x50]
015a1 48894424f8                     mov        qword ptr [rsp - 8], rax
015a6 8b442474                       mov        eax, dword ptr [rsp + 0x74]
015aa 89442458                       mov        dword ptr [rsp + 0x58], eax
015ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b3 48894424f8                     mov        qword ptr [rsp - 8], rax
015b8 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
015bf 8944245c                       mov        dword ptr [rsp + 0x5c], eax
015c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c8 48894424f8                     mov        qword ptr [rsp - 8], rax
015cd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
015d1 89442460                       mov        dword ptr [rsp + 0x60], eax
015d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015da 89442464                       mov        dword ptr [rsp + 0x64], eax
015de 895c2478                       mov        dword ptr [rsp + 0x78], ebx
015e2 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
015eb 90                             nop        
015ec c5f877                         vzeroupper 
015ef e8ec4eb6ff                     call       0x7f4c1b9d7d60
015f4 0f1f8400ec16000a               nop        dword ptr [rax + rax + 0xa0016ec]
015fc bee4ffffff                     mov        esi, 0xffffffe4
01601 488b2c24                       mov        rbp, qword ptr [rsp]
01605 48894424f8                     mov        qword ptr [rsp - 8], rax
0160a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0160e 89442408                       mov        dword ptr [rsp + 8], eax
01612 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01617 48ff742420                     push       qword ptr [rsp + 0x20]
0161c 488f442418                     pop        qword ptr [rsp + 0x18]
01621 48894424f8                     mov        qword ptr [rsp - 8], rax
01626 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0162a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0162e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01633 48894424f8                     mov        qword ptr [rsp - 8], rax
01638 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0163c 89442438                       mov        dword ptr [rsp + 0x38], eax
01640 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01645 48ff742468                     push       qword ptr [rsp + 0x68]
0164a 488f442440                     pop        qword ptr [rsp + 0x40]
0164f 48894424f8                     mov        qword ptr [rsp - 8], rax
01654 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01658 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0165c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01661 48894424f8                     mov        qword ptr [rsp - 8], rax
01666 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0166a 89442458                       mov        dword ptr [rsp + 0x58], eax
0166e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01673 48894424f8                     mov        qword ptr [rsp - 8], rax
01678 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0167c 89442460                       mov        dword ptr [rsp + 0x60], eax
01680 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01685 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
0168a 6690                           nop        
0168c c5f877                         vzeroupper 
0168f e84c4eb6ff                     call       0x7f4c1b9d7d60
01694 0f1f84008c17000b               nop        dword ptr [rax + rax + 0xb00178c]
0169c be45ffffff                     mov        esi, 0xffffff45
016a1 488b2c24                       mov        rbp, qword ptr [rsp]
016a5 4c89542408                     mov        qword ptr [rsp + 8], r10
016aa 6690                           nop        
016ac c5f877                         vzeroupper 
016af e82c4eb6ff                     call       0x7f4c1b9d7d60
016b4 0f1f8400ac17000c               nop        dword ptr [rax + rax + 0xc0017ac]
016bc be45ffffff                     mov        esi, 0xffffff45
016c1 488b2c24                       mov        rbp, qword ptr [rsp]
016c5 48894424f8                     mov        qword ptr [rsp - 8], rax
016ca 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016ce 89442408                       mov        dword ptr [rsp + 8], eax
016d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d7 48ff742420                     push       qword ptr [rsp + 0x20]
016dc 488f442418                     pop        qword ptr [rsp + 0x18]
016e1 48894424f8                     mov        qword ptr [rsp - 8], rax
016e6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016ea 8944240c                       mov        dword ptr [rsp + 0xc], eax
016ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016f3 895c2430                       mov        dword ptr [rsp + 0x30], ebx
016f7 4489742434                     mov        dword ptr [rsp + 0x34], r14d
016fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01701 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01705 89442438                       mov        dword ptr [rsp + 0x38], eax
01709 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0170e 48ff742468                     push       qword ptr [rsp + 0x68]
01713 488f442440                     pop        qword ptr [rsp + 0x40]
01718 48894424f8                     mov        qword ptr [rsp - 8], rax
0171d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01721 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01725 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0172a 89442464                       mov        dword ptr [rsp + 0x64], eax
0172e 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01733 90                             nop        
01734 c5f877                         vzeroupper 
01737 e8a44db6ff                     call       0x7f4c1b9d7d60
0173c 0f1f84003418000d               nop        dword ptr [rax + rax + 0xd001834]
01744 493bea                         cmp        rbp, r10
01747 bdffffffff                     mov        ebp, 0xffffffff
0174c 7c08                           jl         0x7f4c1be72fd6
0174e 400f95c5                       setne      bpl
01752 400fb6ed                       movzx      ebp, bpl
01756 be45ffffff                     mov        esi, 0xffffff45
0175b 48894424f8                     mov        qword ptr [rsp - 8], rax
01760 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01764 89442414                       mov        dword ptr [rsp + 0x14], eax
01768 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176d 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01771 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
01776 48894424f8                     mov        qword ptr [rsp - 8], rax
0177b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0177f 89442440                       mov        dword ptr [rsp + 0x40], eax
01783 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01788 48ff742468                     push       qword ptr [rsp + 0x68]
0178d 488f442448                     pop        qword ptr [rsp + 0x48]
01792 48894424f8                     mov        qword ptr [rsp - 8], rax
01797 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0179b 89442444                       mov        dword ptr [rsp + 0x44], eax
0179f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a4 48ff742478                     push       qword ptr [rsp + 0x78]
017a9 488f442458                     pop        qword ptr [rsp + 0x58]
017ae 48894424f8                     mov        qword ptr [rsp - 8], rax
017b3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017b7 89442460                       mov        dword ptr [rsp + 0x60], eax
017bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c0 48894424f8                     mov        qword ptr [rsp - 8], rax
017c5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
017c9 89442468                       mov        dword ptr [rsp + 0x68], eax
017cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d2 8944246c                       mov        dword ptr [rsp + 0x6c], eax
017d6 4c89542478                     mov        qword ptr [rsp + 0x78], r10
017db 90                             nop        
017dc c5f877                         vzeroupper 
017df e8fc4cb6ff                     call       0x7f4c1b9d7d60
017e4 0f1f8400dc18000e               nop        dword ptr [rax + rax + 0xe0018dc]
017ec be45ffffff                     mov        esi, 0xffffff45
017f1 488b2c24                       mov        rbp, qword ptr [rsp]
017f5 48894424f8                     mov        qword ptr [rsp - 8], rax
017fa 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017fe 89442408                       mov        dword ptr [rsp + 8], eax
01802 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01807 48ff742420                     push       qword ptr [rsp + 0x20]
0180c 488f442418                     pop        qword ptr [rsp + 0x18]
01811 48894424f8                     mov        qword ptr [rsp - 8], rax
01816 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0181a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0181e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01823 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01827 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0182c 48894424f8                     mov        qword ptr [rsp - 8], rax
01831 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01835 89442438                       mov        dword ptr [rsp + 0x38], eax
01839 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0183e 48ff742468                     push       qword ptr [rsp + 0x68]
01843 488f442440                     pop        qword ptr [rsp + 0x40]
01848 48894424f8                     mov        qword ptr [rsp - 8], rax
0184d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01851 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01855 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0185a 48894424f8                     mov        qword ptr [rsp - 8], rax
0185f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01863 89442460                       mov        dword ptr [rsp + 0x60], eax
01867 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186c 89442464                       mov        dword ptr [rsp + 0x64], eax
01870 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01875 666690                         nop        
01878 c5f877                         vzeroupper 
0187b e8604cb6ff                     call       0x7f4c1b9d7d60
01880 0f1f84007819000f               nop        dword ptr [rax + rax + 0xf001978]
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
018cd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
018d1 89442438                       mov        dword ptr [rsp + 0x38], eax
018d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018da 48ff742468                     push       qword ptr [rsp + 0x68]
018df 488f442440                     pop        qword ptr [rsp + 0x40]
018e4 48894424f8                     mov        qword ptr [rsp - 8], rax
018e9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
018ed 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f6 48894424f8                     mov        qword ptr [rsp - 8], rax
018fb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
018ff 89442458                       mov        dword ptr [rsp + 0x58], eax
01903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01908 48894424f8                     mov        qword ptr [rsp - 8], rax
0190d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01911 89442460                       mov        dword ptr [rsp + 0x60], eax
01915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191a 89442464                       mov        dword ptr [rsp + 0x64], eax
0191e 6690                           nop        
01920 c5f877                         vzeroupper 
01923 e8b84bb6ff                     call       0x7f4c1b9d7d60
01928 0f1f8400201a0010               nop        dword ptr [rax + rax + 0x10001a20]
01930 bee4ffffff                     mov        esi, 0xffffffe4
01935 488b2c24                       mov        rbp, qword ptr [rsp]
01939 48894424f8                     mov        qword ptr [rsp - 8], rax
0193e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01942 89442408                       mov        dword ptr [rsp + 8], eax
01946 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194b 48ff742420                     push       qword ptr [rsp + 0x20]
01950 488f442418                     pop        qword ptr [rsp + 0x18]
01955 48894424f8                     mov        qword ptr [rsp - 8], rax
0195a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0195e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01962 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01967 48894424f8                     mov        qword ptr [rsp - 8], rax
0196c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01970 89442438                       mov        dword ptr [rsp + 0x38], eax
01974 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01979 48ff742468                     push       qword ptr [rsp + 0x68]
0197e 488f442440                     pop        qword ptr [rsp + 0x40]
01983 48894424f8                     mov        qword ptr [rsp - 8], rax
01988 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0198c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01990 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01995 48ffb42488000000               push       qword ptr [rsp + 0x88]
0199d 488f442448                     pop        qword ptr [rsp + 0x48]
019a2 48ff742478                     push       qword ptr [rsp + 0x78]
019a7 488f442450                     pop        qword ptr [rsp + 0x50]
019ac 48894424f8                     mov        qword ptr [rsp - 8], rax
019b1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019b5 89442458                       mov        dword ptr [rsp + 0x58], eax
019b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019be 48894424f8                     mov        qword ptr [rsp - 8], rax
019c3 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
019ca 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d3 48894424f8                     mov        qword ptr [rsp - 8], rax
019d8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019dc 89442460                       mov        dword ptr [rsp + 0x60], eax
019e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e5 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
019ed 666690                         nop        
019f0 c5f877                         vzeroupper 
019f3 e8e84ab6ff                     call       0x7f4c1b9d7d60
019f8 0f1f8400f01a0011               nop        dword ptr [rax + rax + 0x11001af0]
01a00 bee4ffffff                     mov        esi, 0xffffffe4
01a05 488b2c24                       mov        rbp, qword ptr [rsp]
01a09 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a12 89442408                       mov        dword ptr [rsp + 8], eax
01a16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1b 48ff742420                     push       qword ptr [rsp + 0x20]
01a20 488f442418                     pop        qword ptr [rsp + 0x18]
01a25 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a2e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a37 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a40 89442438                       mov        dword ptr [rsp + 0x38], eax
01a44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a49 48ff742468                     push       qword ptr [rsp + 0x68]
01a4e 488f442440                     pop        qword ptr [rsp + 0x40]
01a53 48894424f8                     mov        qword ptr [rsp - 8], rax
01a58 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a5c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a65 48ffb42488000000               push       qword ptr [rsp + 0x88]
01a6d 488f442448                     pop        qword ptr [rsp + 0x48]
01a72 48ff742478                     push       qword ptr [rsp + 0x78]
01a77 488f442450                     pop        qword ptr [rsp + 0x50]
01a7c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a81 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a85 89442458                       mov        dword ptr [rsp + 0x58], eax
01a89 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a93 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01a9a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa3 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01aac 89442460                       mov        dword ptr [rsp + 0x60], eax
01ab0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab5 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01aba 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01abf 90                             nop        
01ac0 c5f877                         vzeroupper 
01ac3 e8184ab6ff                     call       0x7f4c1b9d7d60
01ac8 0f1f8400c01b0012               nop        dword ptr [rax + rax + 0x12001bc0]
01ad0 4533d2                         xor        r10d, r10d
01ad3 4c891424                       mov        qword ptr [rsp], r10
01ad7 e957e6ffff                     jmp        0x7f4c1be719b3
01adc 4533d2                         xor        r10d, r10d
01adf 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01ae7 e972e6ffff                     jmp        0x7f4c1be719de
01aec 4533d2                         xor        r10d, r10d
01aef 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01af7 e992e6ffff                     jmp        0x7f4c1be71a0e
01afc 4533d2                         xor        r10d, r10d
01aff 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b04 e9ade6ffff                     jmp        0x7f4c1be71a36
01b09 4533d2                         xor        r10d, r10d
01b0c 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01b14 e9cde6ffff                     jmp        0x7f4c1be71a66
01b19 4533d2                         xor        r10d, r10d
01b1c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01b24 e9e8e6ffff                     jmp        0x7f4c1be71a91
01b29 4183c108                       add        r9d, 8
01b2d be6effffff                     mov        esi, 0xffffff6e
01b32 488b2c24                       mov        rbp, qword ptr [rsp]
01b36 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b3f 89442408                       mov        dword ptr [rsp + 8], eax
01b43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b48 48ff742420                     push       qword ptr [rsp + 0x20]
01b4d 488f442418                     pop        qword ptr [rsp + 0x18]
01b52 48894424f8                     mov        qword ptr [rsp - 8], rax
01b57 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b5b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b64 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01b68 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b71 89442438                       mov        dword ptr [rsp + 0x38], eax
01b75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7a 48ff742468                     push       qword ptr [rsp + 0x68]
01b7f 488f442440                     pop        qword ptr [rsp + 0x40]
01b84 48894424f8                     mov        qword ptr [rsp - 8], rax
01b89 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b8d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b96 48ff742478                     push       qword ptr [rsp + 0x78]
01b9b 488f442450                     pop        qword ptr [rsp + 0x50]
01ba0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ba9 89442458                       mov        dword ptr [rsp + 0x58], eax
01bad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01bbb 89442460                       mov        dword ptr [rsp + 0x60], eax
01bbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bc9 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
01bd0 89442468                       mov        dword ptr [rsp + 0x68], eax
01bd4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bd9 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01bde 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01be2 6690                           nop        
01be4 c5f877                         vzeroupper 
01be7 e8f448b6ff                     call       0x7f4c1b9d7d60
01bec 0f1f8400e41c0013               nop        dword ptr [rax + rax + 0x13001ce4]
01bf4 4183c108                       add        r9d, 8
01bf8 be66ffffff                     mov        esi, 0xffffff66
01bfd 488b2c24                       mov        rbp, qword ptr [rsp]
01c01 48894424f8                     mov        qword ptr [rsp - 8], rax
01c06 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c0a 89442408                       mov        dword ptr [rsp + 8], eax
01c0e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c13 48ff742420                     push       qword ptr [rsp + 0x20]
01c18 488f442418                     pop        qword ptr [rsp + 0x18]
01c1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c22 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c26 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2f 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01c33 48894424f8                     mov        qword ptr [rsp - 8], rax
01c38 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c3c 89442438                       mov        dword ptr [rsp + 0x38], eax
01c40 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c45 48ff742468                     push       qword ptr [rsp + 0x68]
01c4a 488f442440                     pop        qword ptr [rsp + 0x40]
01c4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c54 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c58 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c61 48ff742478                     push       qword ptr [rsp + 0x78]
01c66 488f442450                     pop        qword ptr [rsp + 0x50]
01c6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01c70 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01c74 89442458                       mov        dword ptr [rsp + 0x58], eax
01c78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c82 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c86 89442460                       mov        dword ptr [rsp + 0x60], eax
01c8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8f 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c94 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c98 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01c9d 666690                         nop        
01ca0 c5f877                         vzeroupper 
01ca3 e83848b6ff                     call       0x7f4c1b9d7d60
01ca8 0f1f8400a01d0014               nop        dword ptr [rax + rax + 0x14001da0]
01cb0 beccffffff                     mov        esi, 0xffffffcc
01cb5 488b2c24                       mov        rbp, qword ptr [rsp]
01cb9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbe 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01cc2 89442408                       mov        dword ptr [rsp + 8], eax
01cc6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ccb 48ff742420                     push       qword ptr [rsp + 0x20]
01cd0 488f442418                     pop        qword ptr [rsp + 0x18]
01cd5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cda 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01cde 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ce2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce7 48894424f8                     mov        qword ptr [rsp - 8], rax
01cec 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cf0 89442438                       mov        dword ptr [rsp + 0x38], eax
01cf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf9 48ff742468                     push       qword ptr [rsp + 0x68]
01cfe 488f442440                     pop        qword ptr [rsp + 0x40]
01d03 48894424f8                     mov        qword ptr [rsp - 8], rax
01d08 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d0c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d15 48ff742478                     push       qword ptr [rsp + 0x78]
01d1a 488f442450                     pop        qword ptr [rsp + 0x50]
01d1f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d24 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d28 89442458                       mov        dword ptr [rsp + 0x58], eax
01d2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d31 48894424f8                     mov        qword ptr [rsp - 8], rax
01d36 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01d3d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d46 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d4f 89442460                       mov        dword ptr [rsp + 0x60], eax
01d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d58 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d64 89442464                       mov        dword ptr [rsp + 0x64], eax
01d68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6d 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01d72 6690                           nop        
01d74 c5f877                         vzeroupper 
01d77 e86447b6ff                     call       0x7f4c1b9d7d60
01d7c 0f1f8400741e0015               nop        dword ptr [rax + rax + 0x15001e74]
01d84 beccffffff                     mov        esi, 0xffffffcc
01d89 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d91 488f442408                     pop        qword ptr [rsp + 8]
01d96 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d9f 89442414                       mov        dword ptr [rsp + 0x14], eax
01da3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da8 48894424f8                     mov        qword ptr [rsp - 8], rax
01dad 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01db1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01db5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dba 48ff742468                     push       qword ptr [rsp + 0x68]
01dbf 488f442440                     pop        qword ptr [rsp + 0x40]
01dc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01dcd 89442448                       mov        dword ptr [rsp + 0x48], eax
01dd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd6 48ffb42488000000               push       qword ptr [rsp + 0x88]
01dde 488f442450                     pop        qword ptr [rsp + 0x50]
01de3 48ff742478                     push       qword ptr [rsp + 0x78]
01de8 488f442458                     pop        qword ptr [rsp + 0x58]
01ded 48894424f8                     mov        qword ptr [rsp - 8], rax
01df2 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01df6 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01dfa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dff 48894424f8                     mov        qword ptr [rsp - 8], rax
01e04 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01e0b 89442460                       mov        dword ptr [rsp + 0x60], eax
01e0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e14 48894424f8                     mov        qword ptr [rsp - 8], rax
01e19 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e1d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e21 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e26 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
01e2e 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01e36 6690                           nop        
01e38 c5f877                         vzeroupper 
01e3b e8a046b6ff                     call       0x7f4c1b9d7d60
01e40 0f1f8400381f0016               nop        dword ptr [rax + rax + 0x16001f38]
01e48 bee4ffffff                     mov        esi, 0xffffffe4
01e4d 488b2c24                       mov        rbp, qword ptr [rsp]
01e51 48894424f8                     mov        qword ptr [rsp - 8], rax
01e56 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e5a 89442408                       mov        dword ptr [rsp + 8], eax
01e5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e63 48ff742420                     push       qword ptr [rsp + 0x20]
01e68 488f442418                     pop        qword ptr [rsp + 0x18]
01e6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e72 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e76 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01e83 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01e88 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e91 89442438                       mov        dword ptr [rsp + 0x38], eax
01e95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9a 48ff742468                     push       qword ptr [rsp + 0x68]
01e9f 488f442440                     pop        qword ptr [rsp + 0x40]
01ea4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ead 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01eb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb6 48ff742478                     push       qword ptr [rsp + 0x78]
01ebb 488f442450                     pop        qword ptr [rsp + 0x50]
01ec0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ec9 89442458                       mov        dword ptr [rsp + 0x58], eax
01ecd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed7 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01ede 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ee2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee7 48894424f8                     mov        qword ptr [rsp - 8], rax
01eec 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ef0 89442460                       mov        dword ptr [rsp + 0x60], eax
01ef4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef9 89442464                       mov        dword ptr [rsp + 0x64], eax
01efd 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01f04 c5f877                         vzeroupper 
01f07 e8d445b6ff                     call       0x7f4c1b9d7d60
01f0c 0f1f840004200017               nop        dword ptr [rax + rax + 0x17002004]
01f14 be6effffff                     mov        esi, 0xffffff6e
01f19 488b2c24                       mov        rbp, qword ptr [rsp]
01f1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f22 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01f26 89442408                       mov        dword ptr [rsp + 8], eax
01f2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f2f 48ff742420                     push       qword ptr [rsp + 0x20]
01f34 488f442418                     pop        qword ptr [rsp + 0x18]
01f39 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f42 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f4b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f4f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01f54 48894424f8                     mov        qword ptr [rsp - 8], rax
01f59 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01f5d 89442438                       mov        dword ptr [rsp + 0x38], eax
01f61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f66 48ff742468                     push       qword ptr [rsp + 0x68]
01f6b 488f442440                     pop        qword ptr [rsp + 0x40]
01f70 48894424f8                     mov        qword ptr [rsp - 8], rax
01f75 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01f79 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01f7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f82 48ff742478                     push       qword ptr [rsp + 0x78]
01f87 488f442450                     pop        qword ptr [rsp + 0x50]
01f8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f91 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01f95 89442458                       mov        dword ptr [rsp + 0x58], eax
01f99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01fa7 89442460                       mov        dword ptr [rsp + 0x60], eax
01fab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb0 89442464                       mov        dword ptr [rsp + 0x64], eax
01fb4 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01fb9 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01fbd 666690                         nop        
01fc0 c5f877                         vzeroupper 
01fc3 e81845b6ff                     call       0x7f4c1b9d7d60
01fc8 0f1f8400c0200018               nop        dword ptr [rax + rax + 0x180020c0]
01fd0 be45ffffff                     mov        esi, 0xffffff45
01fd5 488b2c24                       mov        rbp, qword ptr [rsp]
01fd9 48894424f8                     mov        qword ptr [rsp - 8], rax
01fde 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fe2 89442408                       mov        dword ptr [rsp + 8], eax
01fe6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01feb 48ff742420                     push       qword ptr [rsp + 0x20]
01ff0 488f442418                     pop        qword ptr [rsp + 0x18]
01ff5 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ffe 8944240c                       mov        dword ptr [rsp + 0xc], eax
02002 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02007 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0200b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02010 48894424f8                     mov        qword ptr [rsp - 8], rax
02015 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02019 89442438                       mov        dword ptr [rsp + 0x38], eax
0201d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02022 48ff742468                     push       qword ptr [rsp + 0x68]
02027 488f442440                     pop        qword ptr [rsp + 0x40]
0202c 48894424f8                     mov        qword ptr [rsp - 8], rax
02031 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02035 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02039 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203e 48ff742478                     push       qword ptr [rsp + 0x78]
02043 488f442450                     pop        qword ptr [rsp + 0x50]
02048 48894424f8                     mov        qword ptr [rsp - 8], rax
0204d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02051 89442458                       mov        dword ptr [rsp + 0x58], eax
02055 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0205a 48894424f8                     mov        qword ptr [rsp - 8], rax
0205f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02063 89442460                       mov        dword ptr [rsp + 0x60], eax
02067 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206c 89442464                       mov        dword ptr [rsp + 0x64], eax
02070 894c2478                       mov        dword ptr [rsp + 0x78], ecx
02074 c5f877                         vzeroupper 
02077 e86444b6ff                     call       0x7f4c1b9d7d60
0207c 0f1f840074210019               nop        dword ptr [rax + rax + 0x19002174]
02084 be3dffffff                     mov        esi, 0xffffff3d
02089 488b2c24                       mov        rbp, qword ptr [rsp]
0208d 48894424f8                     mov        qword ptr [rsp - 8], rax
02092 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02096 89442408                       mov        dword ptr [rsp + 8], eax
0209a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209f 48ff742420                     push       qword ptr [rsp + 0x20]
020a4 488f442418                     pop        qword ptr [rsp + 0x18]
020a9 48894424f8                     mov        qword ptr [rsp - 8], rax
020ae 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020b2 8944240c                       mov        dword ptr [rsp + 0xc], eax
020b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020bb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020bf 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020c4 48894424f8                     mov        qword ptr [rsp - 8], rax
020c9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020cd 89442438                       mov        dword ptr [rsp + 0x38], eax
020d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020d6 48ff742468                     push       qword ptr [rsp + 0x68]
020db 488f442440                     pop        qword ptr [rsp + 0x40]
020e0 48894424f8                     mov        qword ptr [rsp - 8], rax
020e5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020e9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f2 48ff742478                     push       qword ptr [rsp + 0x78]
020f7 488f442450                     pop        qword ptr [rsp + 0x50]
020fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02101 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02105 89442458                       mov        dword ptr [rsp + 0x58], eax
02109 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210e 48894424f8                     mov        qword ptr [rsp - 8], rax
02113 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02117 89442460                       mov        dword ptr [rsp + 0x60], eax
0211b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02120 89442464                       mov        dword ptr [rsp + 0x64], eax
02124 894c2478                       mov        dword ptr [rsp + 0x78], ecx
02128 c5f877                         vzeroupper 
0212b e8b043b6ff                     call       0x7f4c1b9d7d60
02130 0f1f84002822001a               nop        dword ptr [rax + rax + 0x1a002228]
02138 bee4ffffff                     mov        esi, 0xffffffe4
0213d 488b2c24                       mov        rbp, qword ptr [rsp]
02141 48894424f8                     mov        qword ptr [rsp - 8], rax
02146 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0214a 89442408                       mov        dword ptr [rsp + 8], eax
0214e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02153 48ff742420                     push       qword ptr [rsp + 0x20]
02158 488f442418                     pop        qword ptr [rsp + 0x18]
0215d 48894424f8                     mov        qword ptr [rsp - 8], rax
02162 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02166 8944240c                       mov        dword ptr [rsp + 0xc], eax
0216a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216f 48894424f8                     mov        qword ptr [rsp - 8], rax
02174 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02178 89442434                       mov        dword ptr [rsp + 0x34], eax
0217c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02181 48ff742468                     push       qword ptr [rsp + 0x68]
02186 488f442438                     pop        qword ptr [rsp + 0x38]
0218b 48894424f8                     mov        qword ptr [rsp - 8], rax
02190 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02194 89442440                       mov        dword ptr [rsp + 0x40], eax
02198 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0219d 48ffb42488000000               push       qword ptr [rsp + 0x88]
021a5 488f442448                     pop        qword ptr [rsp + 0x48]
021aa 48ff742478                     push       qword ptr [rsp + 0x78]
021af 488f442450                     pop        qword ptr [rsp + 0x50]
021b4 48894424f8                     mov        qword ptr [rsp - 8], rax
021b9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
021bd 89442444                       mov        dword ptr [rsp + 0x44], eax
021c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c6 48894424f8                     mov        qword ptr [rsp - 8], rax
021cb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
021d2 89442458                       mov        dword ptr [rsp + 0x58], eax
021d6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021db 48894424f8                     mov        qword ptr [rsp - 8], rax
021e0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
021e4 8944245c                       mov        dword ptr [rsp + 0x5c], eax
021e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ed 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
021f5 666690                         nop        
021f8 c5f877                         vzeroupper 
021fb e8e042b6ff                     call       0x7f4c1b9d7d60
02200 0f1f8400f822001b               nop        dword ptr [rax + rax + 0x1b0022f8]
02208 bee4ffffff                     mov        esi, 0xffffffe4
0220d 48894424f8                     mov        qword ptr [rsp - 8], rax
02212 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02216 89442414                       mov        dword ptr [rsp + 0x14], eax
0221a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221f 48894424f8                     mov        qword ptr [rsp - 8], rax
02224 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02228 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0222c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02231 48ff742468                     push       qword ptr [rsp + 0x68]
02236 488f442440                     pop        qword ptr [rsp + 0x40]
0223b 48894424f8                     mov        qword ptr [rsp - 8], rax
02240 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02244 89442448                       mov        dword ptr [rsp + 0x48], eax
02248 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0224d 48ffb42488000000               push       qword ptr [rsp + 0x88]
02255 488f442450                     pop        qword ptr [rsp + 0x50]
0225a 48ff742478                     push       qword ptr [rsp + 0x78]
0225f 488f442458                     pop        qword ptr [rsp + 0x58]
02264 48894424f8                     mov        qword ptr [rsp - 8], rax
02269 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0226d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02271 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02276 48894424f8                     mov        qword ptr [rsp - 8], rax
0227b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02282 89442460                       mov        dword ptr [rsp + 0x60], eax
02286 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228b 48894424f8                     mov        qword ptr [rsp - 8], rax
02290 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02294 89442464                       mov        dword ptr [rsp + 0x64], eax
02298 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0229d 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
022a2 6690                           nop        
022a4 c5f877                         vzeroupper 
022a7 e83442b6ff                     call       0x7f4c1b9d7d60
022ac 0f1f8400a423001c               nop        dword ptr [rax + rax + 0x1c0023a4]
022b4 418d6901                       lea        ebp, [r9 + 1]
022b8 bee4ffffff                     mov        esi, 0xffffffe4
022bd 48ffb42490000000               push       qword ptr [rsp + 0x90]
022c5 488f442408                     pop        qword ptr [rsp + 8]
022ca 48894424f8                     mov        qword ptr [rsp - 8], rax
022cf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022d3 89442414                       mov        dword ptr [rsp + 0x14], eax
022d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022dc 48894424f8                     mov        qword ptr [rsp - 8], rax
022e1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
022e5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
022e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022ee 48ff742468                     push       qword ptr [rsp + 0x68]
022f3 488f442440                     pop        qword ptr [rsp + 0x40]
022f8 48894424f8                     mov        qword ptr [rsp - 8], rax
022fd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02301 89442448                       mov        dword ptr [rsp + 0x48], eax
02305 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230a 48ffb42488000000               push       qword ptr [rsp + 0x88]
02312 488f442450                     pop        qword ptr [rsp + 0x50]
02317 48ff742478                     push       qword ptr [rsp + 0x78]
0231c 488f442458                     pop        qword ptr [rsp + 0x58]
02321 48894424f8                     mov        qword ptr [rsp - 8], rax
02326 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0232a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0232e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02333 48894424f8                     mov        qword ptr [rsp - 8], rax
02338 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0233f 89442460                       mov        dword ptr [rsp + 0x60], eax
02343 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02348 48894424f8                     mov        qword ptr [rsp - 8], rax
0234d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02351 89442464                       mov        dword ptr [rsp + 0x64], eax
02355 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235a 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0235f 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
02367 90                             nop        
02368 c5f877                         vzeroupper 
0236b e87041b6ff                     call       0x7f4c1b9d7d60
02370 0f1f84006824001d               nop        dword ptr [rax + rax + 0x1d002468]
02378 bee4ffffff                     mov        esi, 0xffffffe4
0237d 48894424f8                     mov        qword ptr [rsp - 8], rax
02382 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02386 89442414                       mov        dword ptr [rsp + 0x14], eax
0238a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0238f 48894424f8                     mov        qword ptr [rsp - 8], rax
02394 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02398 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0239c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a1 48ff742468                     push       qword ptr [rsp + 0x68]
023a6 488f442440                     pop        qword ptr [rsp + 0x40]
023ab 48894424f8                     mov        qword ptr [rsp - 8], rax
023b0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023b4 89442448                       mov        dword ptr [rsp + 0x48], eax
023b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023bd 48ffb42488000000               push       qword ptr [rsp + 0x88]
023c5 488f442450                     pop        qword ptr [rsp + 0x50]
023ca 48ff742478                     push       qword ptr [rsp + 0x78]
023cf 488f442458                     pop        qword ptr [rsp + 0x58]
023d4 48894424f8                     mov        qword ptr [rsp - 8], rax
023d9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
023dd 8944244c                       mov        dword ptr [rsp + 0x4c], eax
023e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e6 48894424f8                     mov        qword ptr [rsp - 8], rax
023eb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
023f2 89442460                       mov        dword ptr [rsp + 0x60], eax
023f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02400 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02404 89442464                       mov        dword ptr [rsp + 0x64], eax
02408 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0240d 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02412 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
0241a 6690                           nop        
0241c c5f877                         vzeroupper 
0241f e8bc40b6ff                     call       0x7f4c1b9d7d60
02424 0f1f84001c25001e               nop        dword ptr [rax + rax + 0x1e00251c]
0242c bee4ffffff                     mov        esi, 0xffffffe4
02431 488b2c24                       mov        rbp, qword ptr [rsp]
02435 48894424f8                     mov        qword ptr [rsp - 8], rax
0243a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0243e 89442408                       mov        dword ptr [rsp + 8], eax
02442 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02447 48ff742420                     push       qword ptr [rsp + 0x20]
0244c 488f442418                     pop        qword ptr [rsp + 0x18]
02451 48894424f8                     mov        qword ptr [rsp - 8], rax
02456 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0245a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0245e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02463 48894424f8                     mov        qword ptr [rsp - 8], rax
02468 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0246c 89442434                       mov        dword ptr [rsp + 0x34], eax
02470 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02475 48ff742468                     push       qword ptr [rsp + 0x68]
0247a 488f442438                     pop        qword ptr [rsp + 0x38]
0247f 48894424f8                     mov        qword ptr [rsp - 8], rax
02484 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02488 89442440                       mov        dword ptr [rsp + 0x40], eax
0248c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02491 48ff742478                     push       qword ptr [rsp + 0x78]
02496 488f442450                     pop        qword ptr [rsp + 0x50]
0249b 48894424f8                     mov        qword ptr [rsp - 8], rax
024a0 8b442474                       mov        eax, dword ptr [rsp + 0x74]
024a4 89442444                       mov        dword ptr [rsp + 0x44], eax
024a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ad 48894424f8                     mov        qword ptr [rsp - 8], rax
024b2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024b6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
024ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024bf 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
024c4 c5f877                         vzeroupper 
024c7 e81440b6ff                     call       0x7f4c1b9d7d60
024cc 0f1f8400c425001f               nop        dword ptr [rax + rax + 0x1f0025c4]
024d4 beccffffff                     mov        esi, 0xffffffcc
024d9 488b2c24                       mov        rbp, qword ptr [rsp]
024dd 48894424f8                     mov        qword ptr [rsp - 8], rax
024e2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
024e6 89442408                       mov        dword ptr [rsp + 8], eax
024ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ef 48ff742420                     push       qword ptr [rsp + 0x20]
024f4 488f442418                     pop        qword ptr [rsp + 0x18]
024f9 48894424f8                     mov        qword ptr [rsp - 8], rax
024fe 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02502 8944240c                       mov        dword ptr [rsp + 0xc], eax
02506 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0250b 48894424f8                     mov        qword ptr [rsp - 8], rax
02510 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02514 89442434                       mov        dword ptr [rsp + 0x34], eax
02518 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251d 48ff742468                     push       qword ptr [rsp + 0x68]
02522 488f442438                     pop        qword ptr [rsp + 0x38]
02527 48894424f8                     mov        qword ptr [rsp - 8], rax
0252c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02530 89442440                       mov        dword ptr [rsp + 0x40], eax
02534 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02539 48ffb42488000000               push       qword ptr [rsp + 0x88]
02541 488f442448                     pop        qword ptr [rsp + 0x48]
02546 48ff742478                     push       qword ptr [rsp + 0x78]
0254b 488f442450                     pop        qword ptr [rsp + 0x50]
02550 48894424f8                     mov        qword ptr [rsp - 8], rax
02555 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02559 89442444                       mov        dword ptr [rsp + 0x44], eax
0255d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02562 48894424f8                     mov        qword ptr [rsp - 8], rax
02567 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0256e 89442458                       mov        dword ptr [rsp + 0x58], eax
02572 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02577 48894424f8                     mov        qword ptr [rsp - 8], rax
0257c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02580 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02584 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02589 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0258e 6690                           nop        
02590 c5f877                         vzeroupper 
02593 e8483fb6ff                     call       0x7f4c1b9d7d60
02598 0f1f840090260020               nop        dword ptr [rax + rax + 0x20002690]
025a0 be45ffffff                     mov        esi, 0xffffff45
025a5 488b2c24                       mov        rbp, qword ptr [rsp]
025a9 48894424f8                     mov        qword ptr [rsp - 8], rax
025ae 8b442410                       mov        eax, dword ptr [rsp + 0x10]
025b2 89442408                       mov        dword ptr [rsp + 8], eax
025b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025bb 48ff742420                     push       qword ptr [rsp + 0x20]
025c0 488f442418                     pop        qword ptr [rsp + 0x18]
025c5 48894424f8                     mov        qword ptr [rsp - 8], rax
025ca 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025ce 8944240c                       mov        dword ptr [rsp + 0xc], eax
025d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025d7 48894424f8                     mov        qword ptr [rsp - 8], rax
025dc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
025e0 89442438                       mov        dword ptr [rsp + 0x38], eax
025e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e9 48ff742468                     push       qword ptr [rsp + 0x68]
025ee 488f442440                     pop        qword ptr [rsp + 0x40]
025f3 48894424f8                     mov        qword ptr [rsp - 8], rax
025f8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
025fc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02600 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02605 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0260a 6690                           nop        
0260c c5f877                         vzeroupper 
0260f e8cc3eb6ff                     call       0x7f4c1b9d7d60
02614 0f1f84000c270021               nop        dword ptr [rax + rax + 0x2100270c]
0261c bebeffffff                     mov        esi, 0xffffffbe
02621 488b2c24                       mov        rbp, qword ptr [rsp]
02625 48894424f8                     mov        qword ptr [rsp - 8], rax
0262a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0262e 89442408                       mov        dword ptr [rsp + 8], eax
02632 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02637 48ff742420                     push       qword ptr [rsp + 0x20]
0263c 488f442418                     pop        qword ptr [rsp + 0x18]
02641 48894424f8                     mov        qword ptr [rsp - 8], rax
02646 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0264a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0264e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02653 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02657 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0265c 48894424f8                     mov        qword ptr [rsp - 8], rax
02661 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02665 89442438                       mov        dword ptr [rsp + 0x38], eax
02669 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0266e 6690                           nop        
02670 c5f877                         vzeroupper 
02673 e8683eb6ff                     call       0x7f4c1b9d7d60
02678 0f1f840070270022               nop        dword ptr [rax + rax + 0x22002770]
02680 be85ffffff                     mov        esi, 0xffffff85
02685 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
02689 48894424f8                     mov        qword ptr [rsp - 8], rax
0268e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02692 890424                         mov        dword ptr [rsp], eax
02695 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269a 895c2404                       mov        dword ptr [rsp + 4], ebx
0269e 4489742408                     mov        dword ptr [rsp + 8], r14d
026a3 48894424f8                     mov        qword ptr [rsp - 8], rax
026a8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
026ac 8944240c                       mov        dword ptr [rsp + 0xc], eax
026b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b5 48894424f8                     mov        qword ptr [rsp - 8], rax
026ba 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026be 89442418                       mov        dword ptr [rsp + 0x18], eax
026c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c7 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
026cc c5f877                         vzeroupper 
026cf e80c3eb6ff                     call       0x7f4c1b9d7d60
026d4 0f1f8400cc270023               nop        dword ptr [rax + rax + 0x230027cc]
026dc beccffffff                     mov        esi, 0xffffffcc
026e1 488b2c24                       mov        rbp, qword ptr [rsp]
026e5 4489742410                     mov        dword ptr [rsp + 0x10], r14d
026ea 895c2414                       mov        dword ptr [rsp + 0x14], ebx
026ee 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
026f3 90                             nop        
026f4 c5f877                         vzeroupper 
026f7 e8e43db6ff                     call       0x7f4c1b9d7d60
026fc 0f1f8400f4270024               nop        dword ptr [rax + rax + 0x240027f4]
02704 bee4ffffff                     mov        esi, 0xffffffe4
02709 488b2c24                       mov        rbp, qword ptr [rsp]
0270d 48894424f8                     mov        qword ptr [rsp - 8], rax
02712 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02716 89442408                       mov        dword ptr [rsp + 8], eax
0271a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0271f 48ff742420                     push       qword ptr [rsp + 0x20]
02724 488f442418                     pop        qword ptr [rsp + 0x18]
02729 48894424f8                     mov        qword ptr [rsp - 8], rax
0272e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02732 8944240c                       mov        dword ptr [rsp + 0xc], eax
02736 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273b 48894424f8                     mov        qword ptr [rsp - 8], rax
02740 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02744 89442434                       mov        dword ptr [rsp + 0x34], eax
02748 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274d 48ff742468                     push       qword ptr [rsp + 0x68]
02752 488f442438                     pop        qword ptr [rsp + 0x38]
02757 48894424f8                     mov        qword ptr [rsp - 8], rax
0275c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02760 89442440                       mov        dword ptr [rsp + 0x40], eax
02764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02769 48ff742478                     push       qword ptr [rsp + 0x78]
0276e 488f442450                     pop        qword ptr [rsp + 0x50]
02773 48894424f8                     mov        qword ptr [rsp - 8], rax
02778 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0277c 89442444                       mov        dword ptr [rsp + 0x44], eax
02780 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02785 48894424f8                     mov        qword ptr [rsp - 8], rax
0278a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02791 89442458                       mov        dword ptr [rsp + 0x58], eax
02795 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0279a 48894424f8                     mov        qword ptr [rsp - 8], rax
0279f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
027a3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ac 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
027b4 c5f877                         vzeroupper 
027b7 e8243db6ff                     call       0x7f4c1b9d7d60
027bc 0f1f8400b4280025               nop        dword ptr [rax + rax + 0x250028b4]
027c4 bee4ffffff                     mov        esi, 0xffffffe4
027c9 488b2c24                       mov        rbp, qword ptr [rsp]
027cd 48894424f8                     mov        qword ptr [rsp - 8], rax
027d2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027d6 89442408                       mov        dword ptr [rsp + 8], eax
027da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027df 48ff742420                     push       qword ptr [rsp + 0x20]
027e4 488f442418                     pop        qword ptr [rsp + 0x18]
027e9 48894424f8                     mov        qword ptr [rsp - 8], rax
027ee 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027f2 8944240c                       mov        dword ptr [rsp + 0xc], eax
027f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02800 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02804 89442434                       mov        dword ptr [rsp + 0x34], eax
02808 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0280d 48ff742468                     push       qword ptr [rsp + 0x68]
02812 488f442438                     pop        qword ptr [rsp + 0x38]
02817 48894424f8                     mov        qword ptr [rsp - 8], rax
0281c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02820 89442440                       mov        dword ptr [rsp + 0x40], eax
02824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02829 48ff742478                     push       qword ptr [rsp + 0x78]
0282e 488f442450                     pop        qword ptr [rsp + 0x50]
02833 48894424f8                     mov        qword ptr [rsp - 8], rax
02838 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0283c 89442444                       mov        dword ptr [rsp + 0x44], eax
02840 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02845 48894424f8                     mov        qword ptr [rsp - 8], rax
0284a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02851 89442458                       mov        dword ptr [rsp + 0x58], eax
02855 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285a 48894424f8                     mov        qword ptr [rsp - 8], rax
0285f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02863 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02867 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0286c 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02871 48898c2480000000               mov        qword ptr [rsp + 0x80], rcx
02879 666690                         nop        
0287c c5f877                         vzeroupper 
0287f e85c3cb6ff                     call       0x7f4c1b9d7d60
02884 0f1f84007c290026               nop        dword ptr [rax + rax + 0x2600297c]
0288c 4183c108                       add        r9d, 8
02890 be6effffff                     mov        esi, 0xffffff6e
02895 48894424f8                     mov        qword ptr [rsp - 8], rax
0289a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0289e 89442414                       mov        dword ptr [rsp + 0x14], eax
028a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a7 48894424f8                     mov        qword ptr [rsp - 8], rax
028ac 8b442460                       mov        eax, dword ptr [rsp + 0x60]
028b0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
028b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b9 48ff742468                     push       qword ptr [rsp + 0x68]
028be 488f442440                     pop        qword ptr [rsp + 0x40]
028c3 48894424f8                     mov        qword ptr [rsp - 8], rax
028c8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
028cc 89442448                       mov        dword ptr [rsp + 0x48], eax
028d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d5 48894424f8                     mov        qword ptr [rsp - 8], rax
028da 8b442470                       mov        eax, dword ptr [rsp + 0x70]
028de 89442464                       mov        dword ptr [rsp + 0x64], eax
028e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e7 48894424f8                     mov        qword ptr [rsp - 8], rax
028ec 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
028f3 89442468                       mov        dword ptr [rsp + 0x68], eax
028f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028fc 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02901 666690                         nop        
02904 c5f877                         vzeroupper 
02907 e8d43bb6ff                     call       0x7f4c1b9d7d60
0290c 0f1f8400042a0027               nop        dword ptr [rax + rax + 0x27002a04]
02914 4183c108                       add        r9d, 8
02918 beb6ffffff                     mov        esi, 0xffffffb6
0291d 48894424f8                     mov        qword ptr [rsp - 8], rax
02922 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02926 89442414                       mov        dword ptr [rsp + 0x14], eax
0292a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0292f 48894424f8                     mov        qword ptr [rsp - 8], rax
02934 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02938 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0293c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02941 48ff742468                     push       qword ptr [rsp + 0x68]
02946 488f442440                     pop        qword ptr [rsp + 0x40]
0294b 48894424f8                     mov        qword ptr [rsp - 8], rax
02950 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02954 89442448                       mov        dword ptr [rsp + 0x48], eax
02958 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0295d 48894424f8                     mov        qword ptr [rsp - 8], rax
02962 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02966 89442464                       mov        dword ptr [rsp + 0x64], eax
0296a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0296f 48894424f8                     mov        qword ptr [rsp - 8], rax
02974 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
0297b 89442468                       mov        dword ptr [rsp + 0x68], eax
0297f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02984 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02989 666690                         nop        
0298c c5f877                         vzeroupper 
0298f e84c3bb6ff                     call       0x7f4c1b9d7d60
02994 0f1f84008c2a0028               nop        dword ptr [rax + rax + 0x28002a8c]
0299c 4183c108                       add        r9d, 8
029a0 be66ffffff                     mov        esi, 0xffffff66
029a5 48894424f8                     mov        qword ptr [rsp - 8], rax
029aa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029ae 89442414                       mov        dword ptr [rsp + 0x14], eax
029b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b7 48894424f8                     mov        qword ptr [rsp - 8], rax
029bc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
029c0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c9 48ff742468                     push       qword ptr [rsp + 0x68]
029ce 488f442440                     pop        qword ptr [rsp + 0x40]
029d3 48894424f8                     mov        qword ptr [rsp - 8], rax
029d8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
029dc 89442448                       mov        dword ptr [rsp + 0x48], eax
029e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e5 48894424f8                     mov        qword ptr [rsp - 8], rax
029ea 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029ee 89442464                       mov        dword ptr [rsp + 0x64], eax
029f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f7 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
029fc 4489542470                     mov        dword ptr [rsp + 0x70], r10d
02a01 666690                         nop        
02a04 c5f877                         vzeroupper 
02a07 e8d43ab6ff                     call       0x7f4c1b9d7d60
02a0c 0f1f8400042b0029               nop        dword ptr [rax + rax + 0x29002b04]
02a14 bee4ffffff                     mov        esi, 0xffffffe4
02a19 488b2c24                       mov        rbp, qword ptr [rsp]
02a1d 48894424f8                     mov        qword ptr [rsp - 8], rax
02a22 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02a26 89442408                       mov        dword ptr [rsp + 8], eax
02a2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a2f 48ff742420                     push       qword ptr [rsp + 0x20]
02a34 488f442418                     pop        qword ptr [rsp + 0x18]
02a39 48894424f8                     mov        qword ptr [rsp - 8], rax
02a3e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a42 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a4b 48894424f8                     mov        qword ptr [rsp - 8], rax
02a50 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02a54 89442434                       mov        dword ptr [rsp + 0x34], eax
02a58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a5d 48ff742468                     push       qword ptr [rsp + 0x68]
02a62 488f442438                     pop        qword ptr [rsp + 0x38]
02a67 48894424f8                     mov        qword ptr [rsp - 8], rax
02a6c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a70 89442440                       mov        dword ptr [rsp + 0x40], eax
02a74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a79 48ff742478                     push       qword ptr [rsp + 0x78]
02a7e 488f442450                     pop        qword ptr [rsp + 0x50]
02a83 48894424f8                     mov        qword ptr [rsp - 8], rax
02a88 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02a8c 89442444                       mov        dword ptr [rsp + 0x44], eax
02a90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a95 48894424f8                     mov        qword ptr [rsp - 8], rax
02a9a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02aa1 89442458                       mov        dword ptr [rsp + 0x58], eax
02aa5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aaa 48894424f8                     mov        qword ptr [rsp - 8], rax
02aaf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02ab3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ab7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02abc 89442460                       mov        dword ptr [rsp + 0x60], eax
02ac0 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02ac5 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02ac9 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02ace 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02ad6 6690                           nop        
02ad8 c5f877                         vzeroupper 
02adb e8003ab6ff                     call       0x7f4c1b9d7d60
02ae0 0f1f8400d82b002a               nop        dword ptr [rax + rax + 0x2a002bd8]
02ae8 bee4ffffff                     mov        esi, 0xffffffe4
02aed 488b2c24                       mov        rbp, qword ptr [rsp]
02af1 48ffb42490000000               push       qword ptr [rsp + 0x90]
02af9 488f0424                       pop        qword ptr [rsp]
02afd 48894424f8                     mov        qword ptr [rsp - 8], rax
02b02 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02b06 89442408                       mov        dword ptr [rsp + 8], eax
02b0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b0f 48ffb42498000000               push       qword ptr [rsp + 0x98]
02b17 488f442410                     pop        qword ptr [rsp + 0x10]
02b1c 48ff742420                     push       qword ptr [rsp + 0x20]
02b21 488f442418                     pop        qword ptr [rsp + 0x18]
02b26 48894424f8                     mov        qword ptr [rsp - 8], rax
02b2b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b2f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02b33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b38 48894424f8                     mov        qword ptr [rsp - 8], rax
02b3d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02b41 89442434                       mov        dword ptr [rsp + 0x34], eax
02b45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b4a 48ff742468                     push       qword ptr [rsp + 0x68]
02b4f 488f442438                     pop        qword ptr [rsp + 0x38]
02b54 48894424f8                     mov        qword ptr [rsp - 8], rax
02b59 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b5d 89442440                       mov        dword ptr [rsp + 0x40], eax
02b61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b66 48ff742478                     push       qword ptr [rsp + 0x78]
02b6b 488f442450                     pop        qword ptr [rsp + 0x50]
02b70 48894424f8                     mov        qword ptr [rsp - 8], rax
02b75 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02b79 89442444                       mov        dword ptr [rsp + 0x44], eax
02b7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b82 48894424f8                     mov        qword ptr [rsp - 8], rax
02b87 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02b8e 89442458                       mov        dword ptr [rsp + 0x58], eax
02b92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b97 48894424f8                     mov        qword ptr [rsp - 8], rax
02b9c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02ba0 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ba4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ba9 89442460                       mov        dword ptr [rsp + 0x60], eax
02bad 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02bb2 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02bb7 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02bbe c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02bc7 90                             nop        
02bc8 c5f877                         vzeroupper 
02bcb e81039b6ff                     call       0x7f4c1b9d7d60
02bd0 0f1f8400c82c002b               nop        dword ptr [rax + rax + 0x2b002cc8]
02bd8 beccffffff                     mov        esi, 0xffffffcc
02bdd 488b2c24                       mov        rbp, qword ptr [rsp]
02be1 48894424f8                     mov        qword ptr [rsp - 8], rax
02be6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02bea 89442408                       mov        dword ptr [rsp + 8], eax
02bee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bf3 48ff742420                     push       qword ptr [rsp + 0x20]
02bf8 488f442418                     pop        qword ptr [rsp + 0x18]
02bfd 48894424f8                     mov        qword ptr [rsp - 8], rax
02c02 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c06 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c0f 48894424f8                     mov        qword ptr [rsp - 8], rax
02c14 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02c18 89442438                       mov        dword ptr [rsp + 0x38], eax
02c1c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c21 48ff742468                     push       qword ptr [rsp + 0x68]
02c26 488f442440                     pop        qword ptr [rsp + 0x40]
02c2b 48894424f8                     mov        qword ptr [rsp - 8], rax
02c30 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c34 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02c38 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c3d 48ffb42488000000               push       qword ptr [rsp + 0x88]
02c45 488f442448                     pop        qword ptr [rsp + 0x48]
02c4a 48ff742478                     push       qword ptr [rsp + 0x78]
02c4f 488f442450                     pop        qword ptr [rsp + 0x50]
02c54 48894424f8                     mov        qword ptr [rsp - 8], rax
02c59 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02c5d 89442458                       mov        dword ptr [rsp + 0x58], eax
02c61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c66 48894424f8                     mov        qword ptr [rsp - 8], rax
02c6b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02c72 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02c76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c7b 48894424f8                     mov        qword ptr [rsp - 8], rax
02c80 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02c84 89442460                       mov        dword ptr [rsp + 0x60], eax
02c88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c8d 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02c92 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02c96 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02c9d 666690                         nop        
02ca0 c5f877                         vzeroupper 
02ca3 e83838b6ff                     call       0x7f4c1b9d7d60
02ca8 0f1f8400a02d002c               nop        dword ptr [rax + rax + 0x2c002da0]
02cb0 418bee                         mov        ebp, r14d
02cb3 83c510                         add        ebp, 0x10
02cb6 be6effffff                     mov        esi, 0xffffff6e
02cbb 48894424f8                     mov        qword ptr [rsp - 8], rax
02cc0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02cc4 89442414                       mov        dword ptr [rsp + 0x14], eax
02cc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ccd 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02cd2 48894424f8                     mov        qword ptr [rsp - 8], rax
02cd7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02cdb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02cdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ce4 48ff742468                     push       qword ptr [rsp + 0x68]
02ce9 488f442440                     pop        qword ptr [rsp + 0x40]
02cee 48894424f8                     mov        qword ptr [rsp - 8], rax
02cf3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02cf7 89442448                       mov        dword ptr [rsp + 0x48], eax
02cfb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d00 48ff742478                     push       qword ptr [rsp + 0x78]
02d05 488f442458                     pop        qword ptr [rsp + 0x58]
02d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
02d0f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02d13 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d1c 48894424f8                     mov        qword ptr [rsp - 8], rax
02d21 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02d28 89442460                       mov        dword ptr [rsp + 0x60], eax
02d2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d31 48894424f8                     mov        qword ptr [rsp - 8], rax
02d36 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02d3a 89442464                       mov        dword ptr [rsp + 0x64], eax
02d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d43 89442468                       mov        dword ptr [rsp + 0x68], eax
02d47 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02d4c 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02d53 90                             nop        
02d54 c5f877                         vzeroupper 
02d57 e88437b6ff                     call       0x7f4c1b9d7d60
02d5c 0f1f8400542e002d               nop        dword ptr [rax + rax + 0x2d002e54]
02d64 418bee                         mov        ebp, r14d
02d67 83c510                         add        ebp, 0x10
02d6a be66ffffff                     mov        esi, 0xffffff66
02d6f 48894424f8                     mov        qword ptr [rsp - 8], rax
02d74 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d78 89442414                       mov        dword ptr [rsp + 0x14], eax
02d7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d81 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02d86 48894424f8                     mov        qword ptr [rsp - 8], rax
02d8b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02d8f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02d93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d98 48ff742468                     push       qword ptr [rsp + 0x68]
02d9d 488f442440                     pop        qword ptr [rsp + 0x40]
02da2 48894424f8                     mov        qword ptr [rsp - 8], rax
02da7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02dab 89442448                       mov        dword ptr [rsp + 0x48], eax
02daf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02db4 48ff742478                     push       qword ptr [rsp + 0x78]
02db9 488f442458                     pop        qword ptr [rsp + 0x58]
02dbe 48894424f8                     mov        qword ptr [rsp - 8], rax
02dc3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02dc7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02dcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dd0 48894424f8                     mov        qword ptr [rsp - 8], rax
02dd5 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02ddc 89442460                       mov        dword ptr [rsp + 0x60], eax
02de0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02de5 48894424f8                     mov        qword ptr [rsp - 8], rax
02dea 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02dee 89442464                       mov        dword ptr [rsp + 0x64], eax
02df2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02df7 89442468                       mov        dword ptr [rsp + 0x68], eax
02dfb 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02e00 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02e07 90                             nop        
02e08 c5f877                         vzeroupper 
02e0b e8d036b6ff                     call       0x7f4c1b9d7d60
02e10 0f1f8400082f002e               nop        dword ptr [rax + rax + 0x2e002f08]
02e18 488bf0                         mov        rsi, rax
02e1b eb0d                           jmp        0x7f4c1be746aa
02e1d 488bf0                         mov        rsi, rax
02e20 eb08                           jmp        0x7f4c1be746aa
02e22 488bf0                         mov        rsi, rax
02e25 eb03                           jmp        0x7f4c1be746aa
02e27 488bf0                         mov        rsi, rax
02e2a c5f877                         vzeroupper 
02e2d 4881c4f0000000                 add        rsp, 0xf0
02e34 5d                             pop        rbp
02e35 e9265fb6ff                     jmp        0x7f4c1b9da5e0
02e3a bef6ffffff                     mov        esi, 0xfffffff6
02e3f 90                             nop        
02e40 c5f877                         vzeroupper 
02e43 e89836b6ff                     call       0x7f4c1b9d7d60
02e48 0f1f8400402f002f               nop        dword ptr [rax + rax + 0x2f002f40]
02e50 49badc25e71b4c7f0000           movabs     r10, 0x7f4c1be725dc
02e5a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02e61 e9fae7a9ff                     jmp        0x7f4c1b912ee0
02e66 e8b5b3a8ff                     call       0x7f4c1b8ffaa0
02e6b e9bed1ffff                     jmp        0x7f4c1be718ae
