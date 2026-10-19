00000 e8bb3e9616                     call       0x7f1e967d5740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85642e0000                   jne        0x7f1e7fe74712
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
0007a 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00081 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00086 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0008d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00092 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00098 448bb6f0000000                 mov        r14d, dword ptr [rsi + 0xf0]
0009f 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a6 4489542460                     mov        dword ptr [rsp + 0x60], r10d
000ab 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000b7 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000be 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
000c3 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000ca 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000cf 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d3 4489542474                     mov        dword ptr [rsp + 0x74], r10d
000d8 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000dc 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
000e4 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000eb 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000f3 488bfe                         mov        rdi, rsi
000f6 c5f877                         vzeroupper 
000f9 49ba00478b961e7f0000           movabs     r10, 0x7f1e968b4700
00103 41ffd2                         call       r10
00106 0f1f840000000000               nop        dword ptr [rax + rax]
0010e 4d85ed                         test       r13, r13
00111 0f84e9190000                   je         0x7f1e7fe73380
00117 458b5504                       mov        r10d, dword ptr [r13 + 4]
0011b 41c1ea0a                       shr        r10d, 0xa
0011f 4181fa0c080000                 cmp        r10d, 0x80c
00126 0f8584250000                   jne        0x7f1e7fe73f30
0012c 4d8bd5                         mov        r10, r13
0012f 4c891424                       mov        qword ptr [rsp], r10
00133 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00138 4d85d2                         test       r10, r10
0013b 0f84cb190000                   je         0x7f1e7fe7338c
00141 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00145 41c1eb0a                       shr        r11d, 0xa
00149 4181fb05020000                 cmp        r11d, 0x205
00150 0f855a250000                   jne        0x7f1e7fe73f30
00156 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0015e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00163 4d85d2                         test       r10, r10
00166 0f84b0190000                   je         0x7f1e7fe7339c
0016c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00170 41c1ea0a                       shr        r10d, 0xa
00174 4181fa08020000                 cmp        r10d, 0x208
0017b 0f852f250000                   jne        0x7f1e7fe73f30
00181 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00186 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0018e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00193 4d85d2                         test       r10, r10
00196 0f8490190000                   je         0x7f1e7fe733ac
0019c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001a0 41c1eb0a                       shr        r11d, 0xa
001a4 4181fb07020000                 cmp        r11d, 0x207
001ab 0f85ff240000                   jne        0x7f1e7fe73f30
001b1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001bb 4d85d2                         test       r10, r10
001be 0f8475190000                   je         0x7f1e7fe733b9
001c4 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c8 41c1ea0a                       shr        r10d, 0xa
001cc 4181fa07020000                 cmp        r10d, 0x207
001d3 0f85d7240000                   jne        0x7f1e7fe73f30
001d9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001de 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001e6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001eb 4d85d2                         test       r10, r10
001ee 0f8455190000                   je         0x7f1e7fe733c9
001f4 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f8 41c1eb0a                       shr        r11d, 0xa
001fc 4181fb05020000                 cmp        r11d, 0x205
00203 0f85a7240000                   jne        0x7f1e7fe73f30
00209 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00211 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00219 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00222 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00227 4585db                         test       r11d, r11d
0022a 0f841c240000                   je         0x7f1e7fe73ecc
00230 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00238 458b5208                       mov        r10d, dword ptr [r10 + 8]
0023c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00241 4585d2                         test       r10d, r10d
00244 0f8602240000                   jbe        0x7f1e7fe73ecc
0024a 4183fa01                       cmp        r10d, 1
0024e 0f86f8230000                   jbe        0x7f1e7fe73ecc
00254 4183fa02                       cmp        r10d, 2
00258 0f86ee230000                   jbe        0x7f1e7fe73ecc
0025e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00266 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0026a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0026f 4183c3f1                       add        r11d, -0xf
00273 4585db                         test       r11d, r11d
00276 0f8cd0230000                   jl         0x7f1e7fe73ecc
0027c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00284 458b5208                       mov        r10d, dword ptr [r10 + 8]
00288 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0028d 4183c2f1                       add        r10d, -0xf
00291 4585d2                         test       r10d, r10d
00294 0f8cb2230000                   jl         0x7f1e7fe73ecc
0029a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0029f 4183c3f9                       add        r11d, -7
002a3 4585db                         test       r11d, r11d
002a6 0f8ca0230000                   jl         0x7f1e7fe73ecc
002ac 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002b1 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
002b6 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
002bb 458d5af1                       lea        r11d, [r10 - 0xf]
002bf 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002c7 458d51f9                       lea        r10d, [r9 - 7]
002cb 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
002d3 4d63d1                         movsxd     r10, r9d
002d6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002db 4183c1f1                       add        r9d, -0xf
002df 44898c24ac000000               mov        dword ptr [rsp + 0xac], r9d
002e7 4983c2f9                       add        r10, -7
002eb 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002f0 e9da030000                     jmp        0x7f1e7fe71f4f
002f5 448bd5                         mov        r10d, ebp
002f8 4d63d2                         movsxd     r10, r10d
002fb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00302 c442a8f5db                     bzhi       r11, r11, r10
00307 c4c1fb92fb                     kmovq      k7, r11
0030c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00312 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00318 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00320 4403d5                         add        r10d, ebp
00323 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
0032b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0032f 418502                         test       dword ptr [r10], eax
00332 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0033a 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00342 0f8d84090000                   jge        0x7f1e7fe7254c
00348 448beb                         mov        r13d, ebx
0034b 458bd5                         mov        r10d, r13d
0034e 442b9424b4000000               sub        r10d, dword ptr [rsp + 0xb4]
00356 458bca                         mov        r9d, r10d
00359 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00360 2bac24b4000000                 sub        ebp, dword ptr [rsp + 0xb4]
00367 3bac24b4000000                 cmp        ebp, dword ptr [rsp + 0xb4]
0036e 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00376 410f4feb                       cmovg      ebp, r11d
0037a 4585d2                         test       r10d, r10d
0037d 0f8c311a0000                   jl         0x7f1e7fe73634
00383 4585ed                         test       r13d, r13d
00386 0f8c281a0000                   jl         0x7f1e7fe73634
0038c 458d1429                       lea        r10d, [r9 + rbp]
00390 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00395 453bda                         cmp        r11d, r10d
00398 0f82161a0000                   jb         0x7f1e7fe73634
0039e 418bdd                         mov        ebx, r13d
003a1 03dd                           add        ebx, ebp
003a3 443bdb                         cmp        r11d, ebx
003a6 0f82081a0000                   jb         0x7f1e7fe73634
003ac 85ed                           test       ebp, ebp
003ae 0f8c001a0000                   jl         0x7f1e7fe73634
003b4 85ed                           test       ebp, ebp
003b6 0f845cffffff                   je         0x7f1e7fe71b98
003bc 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
003c4 4b8d742a0c                     lea        rsi, [r10 + r13 + 0xc]
003c9 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003d1 458bd1                         mov        r10d, r9d
003d4 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
003d9 4863d5                         movsxd     rdx, ebp
003dc 4883fa20                       cmp        rdx, 0x20
003e0 0f860fffffff                   jbe        0x7f1e7fe71b75
003e6 c5f877                         vzeroupper 
003e9 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
003f3 41ffd2                         call       r10
003f6 0f1f840000000000               nop        dword ptr [rax + rax]
003fe e915ffffff                     jmp        0x7f1e7fe71b98
00403 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
0040a 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00411 4103db                         add        ebx, r11d
00414 e99a020000                     jmp        0x7f1e7fe71f33
00419 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00421 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00429 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
0042e 4b8d7c0b0c                     lea        rdi, [r11 + r9 + 0xc]
00433 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0043b 44039c24bc000000               add        r11d, dword ptr [rsp + 0xbc]
00443 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0044b 4d63c3                         movsxd     r8, r11d
0044e 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00456 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
0045e 0f8ce9050000                   jl         0x7f1e7fe722cd
00464 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0046c 4183fb30                       cmp        r11d, 0x30
00470 0f8e9d000000                   jle        0x7f1e7fe71d93
00476 4585c9                         test       r9d, r9d
00479 0f8c61180000                   jl         0x7f1e7fe73560
0047f 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00487 4585db                         test       r11d, r11d
0048a 0f8c50180000                   jl         0x7f1e7fe73560
00490 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00498 4503d9                         add        r11d, r9d
0049b 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
004a0 453bc3                         cmp        r8d, r11d
004a3 0f8237180000                   jb         0x7f1e7fe73560
004a9 443b8424c0000000               cmp        r8d, dword ptr [rsp + 0xc0]
004b1 0f8229180000                   jb         0x7f1e7fe73560
004b7 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
004bf 4585db                         test       r11d, r11d
004c2 0f84dd010000                   je         0x7f1e7fe71f25
004c8 4963d3                         movsxd     rdx, r11d
004cb 4883fa20                       cmp        rdx, 0x20
004cf 7725                           ja         0x7f1e7fe71d76
004d1 4d63d3                         movsxd     r10, r11d
004d4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004db c442a8f5db                     bzhi       r11, r11, r10
004e0 c4c1fb92fb                     kmovq      k7, r11
004e5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004eb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004f1 e9af010000                     jmp        0x7f1e7fe71f25
004f6 c5f877                         vzeroupper 
004f9 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00503 41ffd2                         call       r10
00506 0f1f840000000000               nop        dword ptr [rax + rax]
0050e e992010000                     jmp        0x7f1e7fe71f25
00513 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
0051b 0f833f140000                   jae        0x7f1e7fe731e0
00521 4963f9                         movsxd     rdi, r9d
00524 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0052c 4d8b5c3a0c                     mov        r11, qword ptr [r10 + rdi + 0xc]
00531 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00539 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00541 0f83e9140000                   jae        0x7f1e7fe732b0
00547 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
0054e 8d5908                         lea        ebx, [rcx + 8]
00551 4c63d1                         movsxd     r10, ecx
00554 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
0055c 4e895c120c                     mov        qword ptr [rdx + r10 + 0xc], r11
00561 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00568 0f8d37010000                   jge        0x7f1e7fe71f25
0056e 492bfa                         sub        rdi, r10
00571 4c63db                         movsxd     r11, ebx
00574 4d8d143b                       lea        r10, [r11 + rdi]
00578 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0057d 0f83d6150000                   jae        0x7f1e7fe733d9
00583 4d8bd0                         mov        r10, r8
00586 4d2bd3                         sub        r10, r11
00589 4983c207                       add        r10, 7
0058d 4983e2f8                       and        r10, 0xfffffffffffffff8
00591 458bda                         mov        r11d, r10d
00594 458d540b08                     lea        r10d, [r11 + rcx + 8]
00599 4d63d2                         movsxd     r10, r10d
0059c 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
005a1 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005a6 0f83ad150000                   jae        0x7f1e7fe733d9
005ac 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
005b3 0f83a0150000                   jae        0x7f1e7fe733d9
005b9 4983c2f8                       add        r10, -8
005bd 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005c2 0f8391150000                   jae        0x7f1e7fe733d9
005c8 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
005d0 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
005d7 0f8f47160000                   jg         0x7f1e7fe734a4
005dd 442bc9                         sub        r9d, ecx
005e0 83c110                         add        ecx, 0x10
005e3 458d1c19                       lea        r11d, [r9 + rbx]
005e7 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
005ef 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
005f4 448bd3                         mov        r10d, ebx
005f7 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
005ff 4e895c170c                     mov        qword ptr [rdi + r10 + 0xc], r11
00604 83c308                         add        ebx, 8
00607 3bd9                           cmp        ebx, ecx
00609 7cd8                           jl         0x7f1e7fe71e63
0060b 4983c0f8                       add        r8, -8
0060f 4981f800000080                 cmp        r8, -0x80000000
00616 49c7c200000080                 mov        r10, 0xffffffff80000000
0061d 4d0f4cc2                       cmovl      r8, r10
00621 458bd8                         mov        r11d, r8d
00624 413bdb                         cmp        ebx, r11d
00627 7d46                           jge        0x7f1e7fe71eef
00629 0f1f8000000000                 nop        dword ptr [rax]
00630 458d1419                       lea        r10d, [r9 + rbx]
00634 448bc3                         mov        r8d, ebx
00637 4963c8                         movsxd     rcx, r8d
0063a 458bc2                         mov        r8d, r10d
0063d 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
00645 4a8b7c070c                     mov        rdi, qword ptr [rdi + r8 + 0xc]
0064a 4d63c2                         movsxd     r8, r10d
0064d 448bd3                         mov        r10d, ebx
00650 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
00658 4a897c120c                     mov        qword ptr [rdx + r10 + 0xc], rdi
0065d 4e8b540214                     mov        r10, qword ptr [rdx + r8 + 0x14]
00662 4c89540a14                     mov        qword ptr [rdx + rcx + 0x14], r10
00667 83c310                         add        ebx, 0x10
0066a 413bdb                         cmp        ebx, r11d
0066d 7cc1                           jl         0x7f1e7fe71eb0
0066f 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00676 7d2d                           jge        0x7f1e7fe71f25
00678 458d1419                       lea        r10d, [r9 + rbx]
0067c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00684 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
00689 448bdb                         mov        r11d, ebx
0068c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00694 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
00699 83c308                         add        ebx, 8
0069c 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
006a3 7cd3                           jl         0x7f1e7fe71ef8
006a5 8b9c24bc000000                 mov        ebx, dword ptr [rsp + 0xbc]
006ac 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
006b3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006b7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
006bc 41ffc0                         inc        r8d
006bf 4489442470                     mov        dword ptr [rsp + 0x70], r8d
006c4 418502                         test       dword ptr [r10], eax
006c7 448bb424b8000000               mov        r14d, dword ptr [rsp + 0xb8]
006cf 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
006d7 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
006dc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
006e1 452bde                         sub        r11d, r14d
006e4 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
006ec 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
006f1 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
006f6 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
006fb 0f8df9050000                   jge        0x7f1e7fe7257a
00701 443b442408                     cmp        r8d, dword ptr [rsp + 8]
00706 0f83150d0000                   jae        0x7f1e7fe72ca1
0070c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00714 4f8b54c210                     mov        r10, qword ptr [r10 + r8*8 + 0x10]
00719 418bc2                         mov        eax, r10d
0071c 25ffff0100                     and        eax, 0x1ffff
00721 4d8bc2                         mov        r8, r10
00724 49c1e812                       shr        r8, 0x12
00728 49c1fa24                       sar        r10, 0x24
0072c 458bc0                         mov        r8d, r8d
0072f 458bd2                         mov        r10d, r10d
00732 418bca                         mov        ecx, r10d
00735 4181e0ffff0300                 and        r8d, 0x3ffff
0073c 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00744 4585d2                         test       r10d, r10d
00747 0f8c9f0f0000                   jl         0x7f1e7fe72f6c
0074d 85c0                           test       eax, eax
0074f 0f852f020000                   jne        0x7f1e7fe72204
00755 4533d2                         xor        r10d, r10d
00758 418bc2                         mov        eax, r10d
0075b 448bd1                         mov        r10d, ecx
0075e 4183fa03                       cmp        r10d, 3
00762 0f8e40020000                   jle        0x7f1e7fe72228
00768 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00770 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
00774 45895a14                       mov        dword ptr [r10 + 0x14], r11d
00778 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0077c 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00784 45895310                       mov        dword ptr [r11 + 0x10], r10d
00788 448d51fd                       lea        r10d, [rcx - 3]
0078c 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00794 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00798 4863ac24b4000000               movsxd     rbp, dword ptr [rsp + 0xb4]
007a0 4c63d3                         movsxd     r10, ebx
007a3 4c03542468                     add        r10, qword ptr [rsp + 0x68]
007a8 4863d0                         movsxd     rdx, eax
007ab 4c03d2                         add        r10, rdx
007ae 493bea                         cmp        rbp, r10
007b1 0f8fbd0f0000                   jg         0x7f1e7fe72ff4
007b7 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
007bf 4585c0                         test       r8d, r8d
007c2 0f8e040f0000                   jle        0x7f1e7fe72f4c
007c8 448d2c03                       lea        r13d, [rbx + rax]
007cc 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
007d4 4503d5                         add        r10d, r13d
007d7 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
007dc 0f8f3a100000                   jg         0x7f1e7fe7309c
007e2 458d1c06                       lea        r11d, [r14 + rax]
007e6 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
007ee 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
007f6 0f8fbc100000                   jg         0x7f1e7fe73138
007fc 83f810                         cmp        eax, 0x10
007ff 0f8f7a050000                   jg         0x7f1e7fe725ff
00805 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
0080d 0f838d0c0000                   jae        0x7f1e7fe72d20
00813 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0081b c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
00822 3b9c24ac000000                 cmp        ebx, dword ptr [rsp + 0xac]
00829 0f83210d0000                   jae        0x7f1e7fe72dd0
0082f 468d1c30                       lea        r11d, [rax + r14]
00833 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0083b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00843 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
0084a 448d1418                       lea        r10d, [rax + rbx]
0084e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00856 448b8c24bc000000               mov        r9d, dword ptr [rsp + 0xbc]
0085e 442b8c24b4000000               sub        r9d, dword ptr [rsp + 0xb4]
00866 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0086e 4183fa10                       cmp        r10d, 0x10
00872 0f8fa1fbffff                   jg         0x7f1e7fe71c99
00878 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00880 4183fb10                       cmp        r11d, 0x10
00884 0f8c8ffbffff                   jl         0x7f1e7fe71c99
0088a 443b8c24ac000000               cmp        r9d, dword ptr [rsp + 0xac]
00892 0f83940d0000                   jae        0x7f1e7fe72eac
00898 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008a0 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
008a7 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
008af 443b9c24ac000000               cmp        r11d, dword ptr [rsp + 0xac]
008b7 0f8246fbffff                   jb         0x7f1e7fe71c83
008bd bee4ffffff                     mov        esi, 0xffffffe4
008c2 488b2c24                       mov        rbp, qword ptr [rsp]
008c6 48894424f8                     mov        qword ptr [rsp - 8], rax
008cb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
008cf 89442408                       mov        dword ptr [rsp + 8], eax
008d3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008d8 48ff742420                     push       qword ptr [rsp + 0x20]
008dd 488f442418                     pop        qword ptr [rsp + 0x18]
008e2 48894424f8                     mov        qword ptr [rsp - 8], rax
008e7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008eb 8944240c                       mov        dword ptr [rsp + 0xc], eax
008ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008f4 48894424f8                     mov        qword ptr [rsp - 8], rax
008f9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
008fd 89442438                       mov        dword ptr [rsp + 0x38], eax
00901 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00906 48ff742468                     push       qword ptr [rsp + 0x68]
0090b 488f442440                     pop        qword ptr [rsp + 0x40]
00910 48894424f8                     mov        qword ptr [rsp - 8], rax
00915 8b442464                       mov        eax, dword ptr [rsp + 0x64]
00919 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0091d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00922 48ffb42488000000               push       qword ptr [rsp + 0x88]
0092a 488f442448                     pop        qword ptr [rsp + 0x48]
0092f 48894424f8                     mov        qword ptr [rsp - 8], rax
00934 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00938 89442458                       mov        dword ptr [rsp + 0x58], eax
0093c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00941 48894424f8                     mov        qword ptr [rsp - 8], rax
00946 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0094d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00951 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00956 48894424f8                     mov        qword ptr [rsp - 8], rax
0095b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0095f 89442460                       mov        dword ptr [rsp + 0x60], eax
00963 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00968 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00971 666690                         nop        
00974 c5f877                         vzeroupper 
00977 e8645bb6ff                     call       0x7f1e7f9d7d60
0097c 0f1f8400740a0002               nop        dword ptr [rax + rax + 0x2000a74]
00984 413bc3                         cmp        eax, r11d
00987 0f8ecefdffff                   jle        0x7f1e7fe71fdb
0098d be45ffffff                     mov        esi, 0xffffff45
00992 8be8                           mov        ebp, eax
00994 44891c24                       mov        dword ptr [rsp], r11d
00998 c5f877                         vzeroupper 
0099b e8405bb6ff                     call       0x7f1e7f9d7d60
009a0 0f1f8400980a0003               nop        dword ptr [rax + rax + 0x3000a98]
009a8 85c0                           test       eax, eax
009aa 7407                           je         0x7f1e7fe72233
009ac 448d51ff                       lea        r10d, [rcx - 1]
009b0 418bca                         mov        ecx, r10d
009b3 85c9                           test       ecx, ecx
009b5 747d                           je         0x7f1e7fe722b4
009b7 83f903                         cmp        ecx, 3
009ba 0f8440160000                   je         0x7f1e7fe73880
009c0 83f902                         cmp        ecx, 2
009c3 0f87eb160000                   ja         0x7f1e7fe73934
009c9 3b4c240c                       cmp        ecx, dword ptr [rsp + 0xc]
009cd 0f83a5140000                   jae        0x7f1e7fe736f8
009d3 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
009db 458b448b0c                     mov        r8d, dword ptr [r11 + rcx*4 + 0xc]
009e0 85c9                           test       ecx, ecx
009e2 7e42                           jle        0x7f1e7fe722a6
009e4 448d51ff                       lea        r10d, [rcx - 1]
009e8 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
009ed 0f8351150000                   jae        0x7f1e7fe737c4
009f3 0f1f8000000000                 nop        dword ptr [rax]
009fa 660f1f440000                   nop        word ptr [rax + rax]
00a00 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00a08 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
00a0d 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
00a15 458954890c                     mov        dword ptr [r9 + rcx*4 + 0xc], r10d
00a1a 448d51ff                       lea        r10d, [rcx - 1]
00a1e 418bca                         mov        ecx, r10d
00a21 4585d2                         test       r10d, r10d
00a24 7fda                           jg         0x7f1e7fe72280
00a26 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a2e 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00a32 eb0c                           jmp        0x7f1e7fe722c0
00a34 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a3c 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
00a40 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
00a48 e94bfdffff                     jmp        0x7f1e7fe72018
00a4d 4183fa10                       cmp        r10d, 0x10
00a51 0f8d791b0000                   jge        0x7f1e7fe73e50
00a57 4183fa08                       cmp        r10d, 8
00a5b 0f8d61060000                   jge        0x7f1e7fe72942
00a61 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a69 4183fb10                       cmp        r11d, 0x10
00a6d 0f8eb3000000                   jle        0x7f1e7fe723a6
00a73 4585c9                         test       r9d, r9d
00a76 0f8c881a0000                   jl         0x7f1e7fe73d84
00a7c 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00a84 4585d2                         test       r10d, r10d
00a87 0f8c771a0000                   jl         0x7f1e7fe73d84
00a8d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00a92 443b9c24bc000000               cmp        r11d, dword ptr [rsp + 0xbc]
00a9a 0f82641a0000                   jb         0x7f1e7fe73d84
00aa0 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
00aa8 4403ac24bc000000               add        r13d, dword ptr [rsp + 0xbc]
00ab0 453bdd                         cmp        r11d, r13d
00ab3 0f824b1a0000                   jb         0x7f1e7fe73d84
00ab9 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00ac1 4585db                         test       r11d, r11d
00ac4 0f8c3a1a0000                   jl         0x7f1e7fe73d84
00aca 4585db                         test       r11d, r11d
00acd 0f8478f8ffff                   je         0x7f1e7fe71bcb
00ad3 4883fd20                       cmp        rbp, 0x20
00ad7 772d                           ja         0x7f1e7fe72386
00ad9 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00ae1 4d63d2                         movsxd     r10, r10d
00ae4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00aeb c442a8f5db                     bzhi       r11, r11, r10
00af0 c4c1fb92fb                     kmovq      k7, r11
00af5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00afb 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b01 e945f8ffff                     jmp        0x7f1e7fe71bcb
00b06 488bd5                         mov        rdx, rbp
00b09 c5f877                         vzeroupper 
00b0c 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00b16 41ffd2                         call       r10
00b19 0f1f840000000000               nop        dword ptr [rax + rax]
00b21 e925f8ffff                     jmp        0x7f1e7fe71bcb
00b26 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00b2b 0f8337160000                   jae        0x7f1e7fe739e8
00b31 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b39 430fbe6c0a0c                   movsx      ebp, byte ptr [r10 + r9 + 0xc]
00b3f 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b47 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00b4c 0f83e6160000                   jae        0x7f1e7fe73ab8
00b52 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00b5a 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b62 43886c130c                     mov        byte ptr [r11 + r10 + 0xc], bpl
00b67 458d5103                       lea        r10d, [r9 + 3]
00b6b 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
00b72 ffc1                           inc        ecx
00b74 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b79 0f8365170000                   jae        0x7f1e7fe73b64
00b7f 4d63d9                         movsxd     r11, r9d
00b82 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b8a 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00b90 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b98 4183c203                       add        r10d, 3
00b9c 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00ba1 0f8301180000                   jae        0x7f1e7fe73c28
00ba7 4c638424bc000000               movsxd     r8, dword ptr [rsp + 0xbc]
00baf 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bb7 43886c020d                     mov        byte ptr [r10 + r8 + 0xd], bpl
00bbc 470fbe541a0e                   movsx      r10d, byte ptr [r10 + r11 + 0xe]
00bc2 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00bca 468854010e                     mov        byte ptr [rcx + r8 + 0xe], r10b
00bcf 460fbe5c190f                   movsx      r11d, byte ptr [rcx + r11 + 0xf]
00bd5 46885c010f                     mov        byte ptr [rcx + r8 + 0xf], r11b
00bda 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00be2 4183fb08                       cmp        r11d, 8
00be6 0f8370180000                   jae        0x7f1e7fe73cdc
00bec 458bc1                         mov        r8d, r9d
00bef 49bbc8df2fe300000000           movabs     r11, 0xe32fdfc8
00bf9 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00c01 470344930c                     add        r8d, dword ptr [r11 + r10*4 + 0xc]
00c06 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c0b 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00c13 4183fb04                       cmp        r11d, 4
00c17 7e43                           jle        0x7f1e7fe724dc
00c19 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00c20 83c504                         add        ebp, 4
00c23 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c2b 418bd0                         mov        edx, r8d
00c2e 6690                           nop        
00c30 c5f877                         vzeroupper 
00c33 e8a8e3a9ff                     call       0x7f1e7f910860
00c38 0f1f8400300d0004               nop        dword ptr [rax + rax + 0x4000d30]
00c40 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c48 8bd5                           mov        edx, ebp
00c4a 8bc8                           mov        ecx, eax
00c4c c5f877                         vzeroupper 
00c4f e88ce3a9ff                     call       0x7f1e7f910860
00c54 0f1f84004c0d0005               nop        dword ptr [rax + rax + 0x5000d4c]
00c5c 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00c64 4183fb08                       cmp        r11d, 8
00c68 7e62                           jle        0x7f1e7fe7254c
00c6a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00c6e 49baf8df2fe300000000           movabs     r10, 0xe32fdff8
00c78 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
00c80 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00c85 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00c8c 83c508                         add        ebp, 8
00c8f 83c208                         add        edx, 8
00c92 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c9a 6690                           nop        
00c9c c5f877                         vzeroupper 
00c9f e83ce3a9ff                     call       0x7f1e7f910860
00ca4 0f1f84009c0d0006               nop        dword ptr [rax + rax + 0x6000d9c]
00cac 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cb4 8bd5                           mov        edx, ebp
00cb6 488bc8                         mov        rcx, rax
00cb9 666690                         nop        
00cbc c5f877                         vzeroupper 
00cbf e81ce3a9ff                     call       0x7f1e7f910860
00cc4 0f1f8400bc0d0007               nop        dword ptr [rax + rax + 0x7000dbc]
00ccc 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00cd3 e9dbf9ffff                     jmp        0x7f1e7fe71f33
00cd8 4d63d3                         movsxd     r10, r11d
00cdb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ce2 c442a8f5db                     bzhi       r11, r11, r10
00ce7 c4c1fb92fb                     kmovq      k7, r11
00cec 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cf2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cf8 eb67                           jmp        0x7f1e7fe725e1
00cfa 4585f6                         test       r14d, r14d
00cfd 0f8c091a0000                   jl         0x7f1e7fe73f8c
00d03 85db                           test       ebx, ebx
00d05 0f8c011a0000                   jl         0x7f1e7fe73f8c
00d0b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00d10 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00d15 0f82f1190000                   jb         0x7f1e7fe73f8c
00d1b 428d2c1b                       lea        ebp, [rbx + r11]
00d1f 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d24 443bc5                         cmp        r8d, ebp
00d27 0f82df190000                   jb         0x7f1e7fe73f8c
00d2d 4585db                         test       r11d, r11d
00d30 0f8cd6190000                   jl         0x7f1e7fe73f8c
00d36 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d3b 453bd6                         cmp        r10d, r14d
00d3e 7421                           je         0x7f1e7fe725e1
00d40 4963d3                         movsxd     rdx, r11d
00d43 4883fa20                       cmp        rdx, 0x20
00d47 768f                           jbe        0x7f1e7fe72558
00d49 c5f877                         vzeroupper 
00d4c 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00d56 41ffd2                         call       r10
00d59 0f1f840000000000               nop        dword ptr [rax + rax]
00d61 4c8b1424                       mov        r10, qword ptr [rsp]
00d65 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00d69 c5f877                         vzeroupper 
00d6c 4881c4f0000000                 add        rsp, 0xf0
00d73 5d                             pop        rbp
00d74 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d78 0f87fe200000                   ja         0x7f1e7fe746fc
00d7e c3                             ret        
00d7f 83f830                         cmp        eax, 0x30
00d82 0f8e83000000                   jle        0x7f1e7fe7268b
00d88 4585f6                         test       r14d, r14d
00d8b 0f8c731e0000                   jl         0x7f1e7fe74484
00d91 85db                           test       ebx, ebx
00d93 0f8c6b1e0000                   jl         0x7f1e7fe74484
00d99 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00d9e 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00da6 0f82581e0000                   jb         0x7f1e7fe74484
00dac 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00db1 453bd5                         cmp        r10d, r13d
00db4 0f824a1e0000                   jb         0x7f1e7fe74484
00dba 85c0                           test       eax, eax
00dbc 7426                           je         0x7f1e7fe72664
00dbe 4883fa20                       cmp        rdx, 0x20
00dc2 772d                           ja         0x7f1e7fe72671
00dc4 4c63d0                         movsxd     r10, eax
00dc7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dce c442a8f5db                     bzhi       r11, r11, r10
00dd3 c4c1fb92fb                     kmovq      k7, r11
00dd8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dde 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00de4 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
00dec e965faffff                     jmp        0x7f1e7fe720d6
00df1 c5f877                         vzeroupper 
00df4 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00dfe 41ffd2                         call       r10
00e01 0f1f840000000000               nop        dword ptr [rax + rax]
00e09 ebd9                           jmp        0x7f1e7fe72664
00e0b 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
00e13 0f83271c0000                   jae        0x7f1e7fe742c0
00e19 4d63c6                         movsxd     r8, r14d
00e1c 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00e24 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00e2b 3b9c24ac000000                 cmp        ebx, dword ptr [rsp + 0xac]
00e32 0f83dc1c0000                   jae        0x7f1e7fe74394
00e38 8d5310                         lea        edx, [rbx + 0x10]
00e3b 4c63db                         movsxd     r11, ebx
00e3e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00e46 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00e4d 413bd5                         cmp        edx, r13d
00e50 0f8d53020000                   jge        0x7f1e7fe72929
00e56 4d2bc3                         sub        r8, r11
00e59 4c63d2                         movsxd     r10, edx
00e5c 48634c241c                     movsxd     rcx, dword ptr [rsp + 0x1c]
00e61 4883c1f1                       add        rcx, -0xf
00e65 4f8d1c02                       lea        r11, [r10 + r8]
00e69 4c3bd9                         cmp        r11, rcx
00e6c 0f836a1e0000                   jae        0x7f1e7fe7455c
00e72 4d63cd                         movsxd     r9, r13d
00e75 4d8bd9                         mov        r11, r9
00e78 4d2bda                         sub        r11, r10
00e7b 4983c30f                       add        r11, 0xf
00e7f 4983e3f0                       and        r11, 0xfffffffffffffff0
00e83 458bdb                         mov        r11d, r11d
00e86 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00e8b 4d63da                         movsxd     r11, r10d
00e8e 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00e93 4c3bd1                         cmp        r10, rcx
00e96 0f83401e0000                   jae        0x7f1e7fe7455c
00e9c 3b9424ac000000                 cmp        edx, dword ptr [rsp + 0xac]
00ea3 0f83331e0000                   jae        0x7f1e7fe7455c
00ea9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00eae 4983c2f1                       add        r10, -0xf
00eb2 4983c3f0                       add        r11, -0x10
00eb6 4d3bda                         cmp        r11, r10
00eb9 0f831d1e0000                   jae        0x7f1e7fe7455c
00ebf 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00ec6 0f8fc41e0000                   jg         0x7f1e7fe74610
00ecc 458bde                         mov        r11d, r14d
00ecf 442bdb                         sub        r11d, ebx
00ed2 83c320                         add        ebx, 0x20
00ed5 666690                         nop        
00ed8 448bd2                         mov        r10d, edx
00edb 458d0413                       lea        r8d, [r11 + rdx]
00edf 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00ee7 c4a17a6f44010c                 vmovdqu    xmm0, xmmword ptr [rcx + r8 + 0xc]
00eee 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00ef6 c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
00efd 448d5210                       lea        r10d, [rdx + 0x10]
00f01 418bd2                         mov        edx, r10d
00f04 443bd3                         cmp        r10d, ebx
00f07 7ccf                           jl         0x7f1e7fe72758
00f09 4981c110ffffff                 add        r9, -0xf0
00f10 4981f900000080                 cmp        r9, -0x80000000
00f17 49c7c200000080                 mov        r10, 0xffffffff80000000
00f1e 4d0f4cca                       cmovl      r9, r10
00f22 458bc9                         mov        r9d, r9d
00f25 448bd2                         mov        r10d, edx
00f28 453bd1                         cmp        r10d, r9d
00f2b 0f8d44010000                   jge        0x7f1e7fe728f5
00f31 418bd2                         mov        edx, r10d
00f34 660f1f440000                   nop        word ptr [rax + rax]
00f3a 660f1f440000                   nop        word ptr [rax + rax]
00f40 448bd2                         mov        r10d, edx
00f43 4d63d2                         movsxd     r10, r10d
00f46 448bc2                         mov        r8d, edx
00f49 418d1c13                       lea        ebx, [r11 + rdx]
00f4d 8bcb                           mov        ecx, ebx
00f4f 488bbc2490000000               mov        rdi, qword ptr [rsp + 0x90]
00f57 c5fa6f441f0c                   vmovdqu    xmm0, xmmword ptr [rdi + rbx + 0xc]
00f5d 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00f65 c4a17a7f44030c                 vmovdqu    xmmword ptr [rbx + r8 + 0xc], xmm0
00f6c 4863c9                         movsxd     rcx, ecx
00f6f c5fa6f440f1c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x1c]
00f75 c4a17a7f44131c                 vmovdqu    xmmword ptr [rbx + r10 + 0x1c], xmm0
00f7c c5fa6f440f2c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x2c]
00f82 c4a17a7f44132c                 vmovdqu    xmmword ptr [rbx + r10 + 0x2c], xmm0
00f89 c5fa6f440f3c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x3c]
00f8f c4a17a7f44133c                 vmovdqu    xmmword ptr [rbx + r10 + 0x3c], xmm0
00f96 c5fa6f440f4c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x4c]
00f9c c4a17a7f44134c                 vmovdqu    xmmword ptr [rbx + r10 + 0x4c], xmm0
00fa3 c5fa6f440f5c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x5c]
00fa9 c4a17a7f44135c                 vmovdqu    xmmword ptr [rbx + r10 + 0x5c], xmm0
00fb0 c5fa6f440f6c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x6c]
00fb6 c4a17a7f44136c                 vmovdqu    xmmword ptr [rbx + r10 + 0x6c], xmm0
00fbd c5fa6f440f7c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x7c]
00fc3 c4a17a7f44137c                 vmovdqu    xmmword ptr [rbx + r10 + 0x7c], xmm0
00fca c5fa6f840f8c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x8c]
00fd3 c4a17a7f84138c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x8c], xmm0
00fdd c5fa6f840f9c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x9c]
00fe6 c4a17a7f84139c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x9c], xmm0
00ff0 c5fa6f840fac000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xac]
00ff9 c4a17a7f8413ac000000           vmovdqu    xmmword ptr [rbx + r10 + 0xac], xmm0
01003 c5fa6f840fbc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xbc]
0100c c4a17a7f8413bc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xbc], xmm0
01016 c5fa6f840fcc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xcc]
0101f c4a17a7f8413cc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xcc], xmm0
01029 c5fa6f840fdc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xdc]
01032 c4a17a7f8413dc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xdc], xmm0
0103c c5fa6f840fec000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xec]
01045 c4a17a7f8413ec000000           vmovdqu    xmmword ptr [rbx + r10 + 0xec], xmm0
0104f c5fa6f840ffc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xfc]
01058 c4a17a7f8413fc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xfc], xmm0
01062 448d9200010000                 lea        r10d, [rdx + 0x100]
01069 418bd2                         mov        edx, r10d
0106c 453bd1                         cmp        r10d, r9d
0106f 0f8ccbfeffff                   jl         0x7f1e7fe727c0
01075 413bd5                         cmp        edx, r13d
01078 7d2f                           jge        0x7f1e7fe72929
0107a 6690                           nop        
0107c 458d1413                       lea        r10d, [r11 + rdx]
01080 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
01088 c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
0108f 448bc2                         mov        r8d, edx
01092 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0109a c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
010a1 83c210                         add        edx, 0x10
010a4 413bd5                         cmp        edx, r13d
010a7 7cd3                           jl         0x7f1e7fe728fc
010a9 468d1430                       lea        r10d, [rax + r14]
010ad 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
010b5 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
010bd e994f7ffff                     jmp        0x7f1e7fe720d6
010c2 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
010ca 0f8364160000                   jae        0x7f1e7fe73fb4
010d0 4963f9                         movsxd     rdi, r9d
010d3 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
010db 498b4c3a0c                     mov        rcx, qword ptr [r10 + rdi + 0xc]
010e0 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
010e8 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
010f0 0f83fe160000                   jae        0x7f1e7fe74074
010f6 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
010fe 418d6b08                       lea        ebp, [r11 + 8]
01102 4d63d3                         movsxd     r10, r11d
01105 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
0110d 4a894c130c                     mov        qword ptr [rbx + r10 + 0xc], rcx
01112 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
01119 0f8df6020000                   jge        0x7f1e7fe72c95
0111f 492bfa                         sub        rdi, r10
01122 4863dd                         movsxd     rbx, ebp
01125 4c8d143b                       lea        r10, [rbx + rdi]
01129 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0112e 0f8388170000                   jae        0x7f1e7fe7413c
01134 4d8bd0                         mov        r10, r8
01137 4c2bd3                         sub        r10, rbx
0113a 4983c207                       add        r10, 7
0113e 4983e2f8                       and        r10, 0xfffffffffffffff8
01142 418bca                         mov        ecx, r10d
01145 468d541908                     lea        r10d, [rcx + r11 + 8]
0114a 4d63d2                         movsxd     r10, r10d
0114d 498d4c3af8                     lea        rcx, [r10 + rdi - 8]
01152 483b4c2438                     cmp        rcx, qword ptr [rsp + 0x38]
01157 0f835f170000                   jae        0x7f1e7fe7413c
0115d 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
01164 0f8352170000                   jae        0x7f1e7fe7413c
0116a 4983c2f8                       add        r10, -8
0116e 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01173 0f8343170000                   jae        0x7f1e7fe7413c
01179 baf4ffffff                     mov        edx, 0xfffffff4
0117e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01186 498bf2                         mov        rsi, r10
01189 418bca                         mov        ecx, r10d
0118c 2bd1                           sub        edx, ecx
0118e 412bd3                         sub        edx, r11d
01191 83c2f0                         add        edx, -0x10
01194 418d4b10                       lea        ecx, [r11 + 0x10]
01198 4c63d1                         movsxd     r10, ecx
0119b bf06000000                     mov        edi, 6
011a0 c4e2c0f5ca                     bzhi       rcx, rdx, rdi
011a5 4c03d1                         add        r10, rcx
011a8 4d3bd0                         cmp        r10, r8
011ab 498bf8                         mov        rdi, r8
011ae 490f4cfa                       cmovl      rdi, r10
011b2 4c8bd7                         mov        r10, rdi
011b5 4c2bd3                         sub        r10, rbx
011b8 498d4aff                       lea        rcx, [r10 - 1]
011bc 48c1f93f                       sar        rcx, 0x3f
011c0 48c1e93d                       shr        rcx, 0x3d
011c4 4e8d5411ff                     lea        r10, [rcx + r10 - 1]
011c9 4983e2f8                       and        r10, 0xfffffffffffffff8
011cd 4c03d3                         add        r10, rbx
011d0 493bda                         cmp        rbx, r10
011d3 490f4cda                       cmovl      rbx, r10
011d7 8bcb                           mov        ecx, ebx
011d9 448d5108                       lea        r10d, [rcx + 8]
011dd 2b8c24b4000000                 sub        ecx, dword ptr [rsp + 0xb4]
011e4 4963da                         movsxd     rbx, r10d
011e7 4803de                         add        rbx, rsi
011ea 83c108                         add        ecx, 8
011ed 4863c9                         movsxd     rcx, ecx
011f0 4803ce                         add        rcx, rsi
011f3 488d534c                       lea        rdx, [rbx + 0x4c]
011f7 4883c30c                       add        rbx, 0xc
011fb 488d710c                       lea        rsi, [rcx + 0xc]
011ff 4533d2                         xor        r10d, r10d
01202 483bd6                         cmp        rdx, rsi
01205 410f96c2                       setbe      r10b
01209 4883c14c                       add        rcx, 0x4c
0120d 33d2                           xor        edx, edx
0120f 483bcb                         cmp        rcx, rbx
01212 0f96c2                         setbe      dl
01215 440bd2                         or         r10d, edx
01218 0f8426170000                   je         0x7f1e7fe741c4
0121e 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01225 81f9f8ffff7f                   cmp        ecx, 0x7ffffff8
0122b 0f8f9b170000                   jg         0x7f1e7fe7424c
01231 452bcb                         sub        r9d, r11d
01234 448bdf                         mov        r11d, edi
01237 90                             nop        
01238 418d0c29                       lea        ecx, [r9 + rbp]
0123c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01244 4d8b540a0c                     mov        r10, qword ptr [r10 + rcx + 0xc]
01249 8bdd                           mov        ebx, ebp
0124b 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01253 4c8954190c                     mov        qword ptr [rcx + rbx + 0xc], r10
01258 83c508                         add        ebp, 8
0125b 413beb                         cmp        ebp, r11d
0125e 7cd8                           jl         0x7f1e7fe72ab8
01260 4d8d9008feffff                 lea        r10, [r8 - 0x1f8]
01267 4981fa00000080                 cmp        r10, -0x80000000
0126e 49c7c300000080                 mov        r11, 0xffffffff80000000
01275 4d0f4cd3                       cmovl      r10, r11
01279 418bfa                         mov        edi, r10d
0127c 3bef                           cmp        ebp, edi
0127e 0f8d59010000                   jge        0x7f1e7fe72c5d
01284 660f1f440000                   nop        word ptr [rax + rax]
0128a 660f1f440000                   nop        word ptr [rax + rax]
01290 448d9d00010000                 lea        r11d, [rbp + 0x100]
01297 4503d9                         add        r11d, r9d
0129a 448d9580000000                 lea        r10d, [rbp + 0x80]
012a1 4503d1                         add        r10d, r9d
012a4 418bdb                         mov        ebx, r11d
012a7 4963c3                         movsxd     rax, r11d
012aa 418bf2                         mov        esi, r10d
012ad 4d63ea                         movsxd     r13, r10d
012b0 8bcd                           mov        ecx, ebp
012b2 418d1429                       lea        edx, [r9 + rbp]
012b6 448bdd                         mov        r11d, ebp
012b9 4d63f3                         movsxd     r14, r11d
012bc 448bd2                         mov        r10d, edx
012bf 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
012c7 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
012d2 62d17e487f840b0c000000         vmovdqu32  zmmword ptr [r11 + rcx + 0xc], zmm0
012dd 4c63da                         movsxd     r11, edx
012e0 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
012e8 62917e486f841a4c000000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x4c]
012f3 62917e487f84324c000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x4c], zmm0
012fe 62d17e486f84320c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rsi + 0xc]
01309 62917e487f84328c000000         vmovdqu32  zmmword ptr [r10 + r14 + 0x8c], zmm0
01314 62917e486f842a4c000000         vmovdqu32  zmm0, zmmword ptr [r10 + r13 + 0x4c]
0131f 62917e487f8432cc000000         vmovdqu32  zmmword ptr [r10 + r14 + 0xcc], zmm0
0132a 62d17e486f841a0c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rbx + 0xc]
01335 62917e487f84320c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x10c], zmm0
01340 62d17e486f84024c000000         vmovdqu32  zmm0, zmmword ptr [r10 + rax + 0x4c]
0134b 62917e487f84324c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x14c], zmm0
01356 62917e486f841a8c010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x18c]
01361 62917e487f84328c010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x18c], zmm0
0136c 62917e486f841acc010000         vmovdqu32  zmm0, zmmword ptr [r10 + r11 + 0x1cc]
01377 62917e487f8432cc010000         vmovdqu32  zmmword ptr [r10 + r14 + 0x1cc], zmm0
01382 81c500020000                   add        ebp, 0x200
01388 3bef                           cmp        ebp, edi
0138a 0f8c00ffffff                   jl         0x7f1e7fe72b10
01390 4983c0c8                       add        r8, -0x38
01394 4981f800000080                 cmp        r8, -0x80000000
0139b 49c7c200000080                 mov        r10, 0xffffffff80000000
013a2 4d0f4cc2                       cmovl      r8, r10
013a6 458bd0                         mov        r10d, r8d
013a9 413bea                         cmp        ebp, r10d
013ac 7d2f                           jge        0x7f1e7fe72c5d
013ae 6690                           nop        
013b0 458d1c29                       lea        r11d, [r9 + rbp]
013b4 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
013bc 62917e486f84180c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 0xc]
013c7 448bdd                         mov        r11d, ebp
013ca 62917e487f84180c000000         vmovdqu32  zmmword ptr [r8 + r11 + 0xc], zmm0
013d5 83c540                         add        ebp, 0x40
013d8 413bea                         cmp        ebp, r10d
013db 7cd3                           jl         0x7f1e7fe72c30
013dd 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
013e4 7d2f                           jge        0x7f1e7fe72c95
013e6 6690                           nop        
013e8 458d1429                       lea        r10d, [r9 + rbp]
013ec 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
013f4 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
013f9 448bdd                         mov        r11d, ebp
013fc 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01404 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
01409 83c508                         add        ebp, 8
0140c 3bac24c0000000                 cmp        ebp, dword ptr [rsp + 0xc0]
01413 7cd3                           jl         0x7f1e7fe72c68
01415 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
0141c e992f2ffff                     jmp        0x7f1e7fe71f33
01421 bee4ffffff                     mov        esi, 0xffffffe4
01426 488b2c24                       mov        rbp, qword ptr [rsp]
0142a 48894424f8                     mov        qword ptr [rsp - 8], rax
0142f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01433 89442408                       mov        dword ptr [rsp + 8], eax
01437 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0143c 48ff742420                     push       qword ptr [rsp + 0x20]
01441 488f442418                     pop        qword ptr [rsp + 0x18]
01446 48894424f8                     mov        qword ptr [rsp - 8], rax
0144b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0144f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01453 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01458 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0145c 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01461 48894424f8                     mov        qword ptr [rsp - 8], rax
01466 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0146a 89442438                       mov        dword ptr [rsp + 0x38], eax
0146e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01473 48ff742468                     push       qword ptr [rsp + 0x68]
01478 488f442440                     pop        qword ptr [rsp + 0x40]
0147d 48894424f8                     mov        qword ptr [rsp - 8], rax
01482 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01486 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0148a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148f 90                             nop        
01490 c5f877                         vzeroupper 
01493 e84850b6ff                     call       0x7f1e7f9d7d60
01498 0f1f840090150008               nop        dword ptr [rax + rax + 0x8001590]
014a0 bee4ffffff                     mov        esi, 0xffffffe4
014a5 488b2c24                       mov        rbp, qword ptr [rsp]
014a9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ae 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014b2 89442408                       mov        dword ptr [rsp + 8], eax
014b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014bb 48ff742420                     push       qword ptr [rsp + 0x20]
014c0 488f442418                     pop        qword ptr [rsp + 0x18]
014c5 48894424f8                     mov        qword ptr [rsp - 8], rax
014ca 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014ce 8944240c                       mov        dword ptr [rsp + 0xc], eax
014d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014db 48894424f8                     mov        qword ptr [rsp - 8], rax
014e0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
014e4 89442438                       mov        dword ptr [rsp + 0x38], eax
014e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ed 48ff742468                     push       qword ptr [rsp + 0x68]
014f2 488f442440                     pop        qword ptr [rsp + 0x40]
014f7 48894424f8                     mov        qword ptr [rsp - 8], rax
014fc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01500 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01504 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01509 48ff742478                     push       qword ptr [rsp + 0x78]
0150e 488f442450                     pop        qword ptr [rsp + 0x50]
01513 48894424f8                     mov        qword ptr [rsp - 8], rax
01518 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0151c 89442458                       mov        dword ptr [rsp + 0x58], eax
01520 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01525 48894424f8                     mov        qword ptr [rsp - 8], rax
0152a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0152e 89442460                       mov        dword ptr [rsp + 0x60], eax
01532 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01537 89442464                       mov        dword ptr [rsp + 0x64], eax
0153b 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01540 c5f877                         vzeroupper 
01543 e8984fb6ff                     call       0x7f1e7f9d7d60
01548 0f1f840040160009               nop        dword ptr [rax + rax + 0x9001640]
01550 bee4ffffff                     mov        esi, 0xffffffe4
01555 488b2c24                       mov        rbp, qword ptr [rsp]
01559 48894424f8                     mov        qword ptr [rsp - 8], rax
0155e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01562 89442408                       mov        dword ptr [rsp + 8], eax
01566 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156b 48ff742420                     push       qword ptr [rsp + 0x20]
01570 488f442418                     pop        qword ptr [rsp + 0x18]
01575 48894424f8                     mov        qword ptr [rsp - 8], rax
0157a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0157e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01582 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01587 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0158c 48894424f8                     mov        qword ptr [rsp - 8], rax
01591 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01595 89442438                       mov        dword ptr [rsp + 0x38], eax
01599 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159e 48ff742468                     push       qword ptr [rsp + 0x68]
015a3 488f442440                     pop        qword ptr [rsp + 0x40]
015a8 48894424f8                     mov        qword ptr [rsp - 8], rax
015ad 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015b1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ba 48ffb42488000000               push       qword ptr [rsp + 0x88]
015c2 488f442448                     pop        qword ptr [rsp + 0x48]
015c7 48ff742478                     push       qword ptr [rsp + 0x78]
015cc 488f442450                     pop        qword ptr [rsp + 0x50]
015d1 48894424f8                     mov        qword ptr [rsp - 8], rax
015d6 8b442474                       mov        eax, dword ptr [rsp + 0x74]
015da 89442458                       mov        dword ptr [rsp + 0x58], eax
015de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e3 48894424f8                     mov        qword ptr [rsp - 8], rax
015e8 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
015ef 8944245c                       mov        dword ptr [rsp + 0x5c], eax
015f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015f8 48894424f8                     mov        qword ptr [rsp - 8], rax
015fd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01601 89442460                       mov        dword ptr [rsp + 0x60], eax
01605 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160a 89442464                       mov        dword ptr [rsp + 0x64], eax
0160e 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01612 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0161b 90                             nop        
0161c c5f877                         vzeroupper 
0161f e8bc4eb6ff                     call       0x7f1e7f9d7d60
01624 0f1f84001c17000a               nop        dword ptr [rax + rax + 0xa00171c]
0162c bee4ffffff                     mov        esi, 0xffffffe4
01631 488b2c24                       mov        rbp, qword ptr [rsp]
01635 48894424f8                     mov        qword ptr [rsp - 8], rax
0163a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0163e 89442408                       mov        dword ptr [rsp + 8], eax
01642 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01647 48ff742420                     push       qword ptr [rsp + 0x20]
0164c 488f442418                     pop        qword ptr [rsp + 0x18]
01651 48894424f8                     mov        qword ptr [rsp - 8], rax
01656 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0165a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0165e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01663 48894424f8                     mov        qword ptr [rsp - 8], rax
01668 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0166c 89442438                       mov        dword ptr [rsp + 0x38], eax
01670 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01675 48ff742468                     push       qword ptr [rsp + 0x68]
0167a 488f442440                     pop        qword ptr [rsp + 0x40]
0167f 48894424f8                     mov        qword ptr [rsp - 8], rax
01684 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01688 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0168c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01691 48894424f8                     mov        qword ptr [rsp - 8], rax
01696 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0169a 89442458                       mov        dword ptr [rsp + 0x58], eax
0169e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a3 48894424f8                     mov        qword ptr [rsp - 8], rax
016a8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
016ac 89442460                       mov        dword ptr [rsp + 0x60], eax
016b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016b5 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
016ba 6690                           nop        
016bc c5f877                         vzeroupper 
016bf e81c4eb6ff                     call       0x7f1e7f9d7d60
016c4 0f1f8400bc17000b               nop        dword ptr [rax + rax + 0xb0017bc]
016cc be45ffffff                     mov        esi, 0xffffff45
016d1 488b2c24                       mov        rbp, qword ptr [rsp]
016d5 4c89542408                     mov        qword ptr [rsp + 8], r10
016da 6690                           nop        
016dc c5f877                         vzeroupper 
016df e8fc4db6ff                     call       0x7f1e7f9d7d60
016e4 0f1f8400dc17000c               nop        dword ptr [rax + rax + 0xc0017dc]
016ec be45ffffff                     mov        esi, 0xffffff45
016f1 488b2c24                       mov        rbp, qword ptr [rsp]
016f5 48894424f8                     mov        qword ptr [rsp - 8], rax
016fa 8b442410                       mov        eax, dword ptr [rsp + 0x10]
016fe 89442408                       mov        dword ptr [rsp + 8], eax
01702 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01707 48ff742420                     push       qword ptr [rsp + 0x20]
0170c 488f442418                     pop        qword ptr [rsp + 0x18]
01711 48894424f8                     mov        qword ptr [rsp - 8], rax
01716 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0171a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0171e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01723 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01727 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0172c 48894424f8                     mov        qword ptr [rsp - 8], rax
01731 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01735 89442438                       mov        dword ptr [rsp + 0x38], eax
01739 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173e 48ff742468                     push       qword ptr [rsp + 0x68]
01743 488f442440                     pop        qword ptr [rsp + 0x40]
01748 48894424f8                     mov        qword ptr [rsp - 8], rax
0174d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01751 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01755 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175a 89442464                       mov        dword ptr [rsp + 0x64], eax
0175e 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01763 90                             nop        
01764 c5f877                         vzeroupper 
01767 e8744db6ff                     call       0x7f1e7f9d7d60
0176c 0f1f84006418000d               nop        dword ptr [rax + rax + 0xd001864]
01774 493bea                         cmp        rbp, r10
01777 bdffffffff                     mov        ebp, 0xffffffff
0177c 7c08                           jl         0x7f1e7fe73006
0177e 400f95c5                       setne      bpl
01782 400fb6ed                       movzx      ebp, bpl
01786 be45ffffff                     mov        esi, 0xffffff45
0178b 48894424f8                     mov        qword ptr [rsp - 8], rax
01790 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01794 89442414                       mov        dword ptr [rsp + 0x14], eax
01798 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179d 895c2438                       mov        dword ptr [rsp + 0x38], ebx
017a1 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
017a6 48894424f8                     mov        qword ptr [rsp - 8], rax
017ab 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017af 89442440                       mov        dword ptr [rsp + 0x40], eax
017b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b8 48ff742468                     push       qword ptr [rsp + 0x68]
017bd 488f442448                     pop        qword ptr [rsp + 0x48]
017c2 48894424f8                     mov        qword ptr [rsp - 8], rax
017c7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017cb 89442444                       mov        dword ptr [rsp + 0x44], eax
017cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d4 48ff742478                     push       qword ptr [rsp + 0x78]
017d9 488f442458                     pop        qword ptr [rsp + 0x58]
017de 48894424f8                     mov        qword ptr [rsp - 8], rax
017e3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
017e7 89442460                       mov        dword ptr [rsp + 0x60], eax
017eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f0 48894424f8                     mov        qword ptr [rsp - 8], rax
017f5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
017f9 89442468                       mov        dword ptr [rsp + 0x68], eax
017fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01802 8944246c                       mov        dword ptr [rsp + 0x6c], eax
01806 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0180b 90                             nop        
0180c c5f877                         vzeroupper 
0180f e8cc4cb6ff                     call       0x7f1e7f9d7d60
01814 0f1f84000c19000e               nop        dword ptr [rax + rax + 0xe00190c]
0181c be45ffffff                     mov        esi, 0xffffff45
01821 488b2c24                       mov        rbp, qword ptr [rsp]
01825 48894424f8                     mov        qword ptr [rsp - 8], rax
0182a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0182e 89442408                       mov        dword ptr [rsp + 8], eax
01832 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01837 48ff742420                     push       qword ptr [rsp + 0x20]
0183c 488f442418                     pop        qword ptr [rsp + 0x18]
01841 48894424f8                     mov        qword ptr [rsp - 8], rax
01846 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0184a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0184e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01853 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01857 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0185c 48894424f8                     mov        qword ptr [rsp - 8], rax
01861 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01865 89442438                       mov        dword ptr [rsp + 0x38], eax
01869 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0186e 48ff742468                     push       qword ptr [rsp + 0x68]
01873 488f442440                     pop        qword ptr [rsp + 0x40]
01878 48894424f8                     mov        qword ptr [rsp - 8], rax
0187d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01881 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01885 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188a 48894424f8                     mov        qword ptr [rsp - 8], rax
0188f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01893 89442460                       mov        dword ptr [rsp + 0x60], eax
01897 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189c 89442464                       mov        dword ptr [rsp + 0x64], eax
018a0 4489542470                     mov        dword ptr [rsp + 0x70], r10d
018a5 666690                         nop        
018a8 c5f877                         vzeroupper 
018ab e8304cb6ff                     call       0x7f1e7f9d7d60
018b0 0f1f8400a819000f               nop        dword ptr [rax + rax + 0xf0019a8]
018b8 be45ffffff                     mov        esi, 0xffffff45
018bd 488b2c24                       mov        rbp, qword ptr [rsp]
018c1 48894424f8                     mov        qword ptr [rsp - 8], rax
018c6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018ca 89442408                       mov        dword ptr [rsp + 8], eax
018ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d3 48ff742420                     push       qword ptr [rsp + 0x20]
018d8 488f442418                     pop        qword ptr [rsp + 0x18]
018dd 48894424f8                     mov        qword ptr [rsp - 8], rax
018e2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
018e6 8944240c                       mov        dword ptr [rsp + 0xc], eax
018ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ef 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018f3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
018f8 48894424f8                     mov        qword ptr [rsp - 8], rax
018fd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01901 89442438                       mov        dword ptr [rsp + 0x38], eax
01905 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190a 48ff742468                     push       qword ptr [rsp + 0x68]
0190f 488f442440                     pop        qword ptr [rsp + 0x40]
01914 48894424f8                     mov        qword ptr [rsp - 8], rax
01919 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0191d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01921 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01926 48894424f8                     mov        qword ptr [rsp - 8], rax
0192b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0192f 89442458                       mov        dword ptr [rsp + 0x58], eax
01933 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01938 48894424f8                     mov        qword ptr [rsp - 8], rax
0193d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01941 89442460                       mov        dword ptr [rsp + 0x60], eax
01945 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194a 89442464                       mov        dword ptr [rsp + 0x64], eax
0194e 6690                           nop        
01950 c5f877                         vzeroupper 
01953 e8884bb6ff                     call       0x7f1e7f9d7d60
01958 0f1f8400501a0010               nop        dword ptr [rax + rax + 0x10001a50]
01960 bee4ffffff                     mov        esi, 0xffffffe4
01965 488b2c24                       mov        rbp, qword ptr [rsp]
01969 48894424f8                     mov        qword ptr [rsp - 8], rax
0196e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01972 89442408                       mov        dword ptr [rsp + 8], eax
01976 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197b 48ff742420                     push       qword ptr [rsp + 0x20]
01980 488f442418                     pop        qword ptr [rsp + 0x18]
01985 48894424f8                     mov        qword ptr [rsp - 8], rax
0198a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0198e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01992 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01997 48894424f8                     mov        qword ptr [rsp - 8], rax
0199c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019a0 89442438                       mov        dword ptr [rsp + 0x38], eax
019a4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a9 48ff742468                     push       qword ptr [rsp + 0x68]
019ae 488f442440                     pop        qword ptr [rsp + 0x40]
019b3 48894424f8                     mov        qword ptr [rsp - 8], rax
019b8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
019bc 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c5 48ffb42488000000               push       qword ptr [rsp + 0x88]
019cd 488f442448                     pop        qword ptr [rsp + 0x48]
019d2 48ff742478                     push       qword ptr [rsp + 0x78]
019d7 488f442450                     pop        qword ptr [rsp + 0x50]
019dc 48894424f8                     mov        qword ptr [rsp - 8], rax
019e1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019e5 89442458                       mov        dword ptr [rsp + 0x58], eax
019e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ee 48894424f8                     mov        qword ptr [rsp - 8], rax
019f3 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
019fa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a03 48894424f8                     mov        qword ptr [rsp - 8], rax
01a08 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a0c 89442460                       mov        dword ptr [rsp + 0x60], eax
01a10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a15 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01a1d 666690                         nop        
01a20 c5f877                         vzeroupper 
01a23 e8b84ab6ff                     call       0x7f1e7f9d7d60
01a28 0f1f8400201b0011               nop        dword ptr [rax + rax + 0x11001b20]
01a30 bee4ffffff                     mov        esi, 0xffffffe4
01a35 488b2c24                       mov        rbp, qword ptr [rsp]
01a39 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a42 89442408                       mov        dword ptr [rsp + 8], eax
01a46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4b 48ff742420                     push       qword ptr [rsp + 0x20]
01a50 488f442418                     pop        qword ptr [rsp + 0x18]
01a55 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a5e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a62 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a67 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01a70 89442438                       mov        dword ptr [rsp + 0x38], eax
01a74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a79 48ff742468                     push       qword ptr [rsp + 0x68]
01a7e 488f442440                     pop        qword ptr [rsp + 0x40]
01a83 48894424f8                     mov        qword ptr [rsp - 8], rax
01a88 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a8c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a90 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a95 48ffb42488000000               push       qword ptr [rsp + 0x88]
01a9d 488f442448                     pop        qword ptr [rsp + 0x48]
01aa2 48ff742478                     push       qword ptr [rsp + 0x78]
01aa7 488f442450                     pop        qword ptr [rsp + 0x50]
01aac 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ab5 89442458                       mov        dword ptr [rsp + 0x58], eax
01ab9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01abe 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac3 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01aca 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ace 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01adc 89442460                       mov        dword ptr [rsp + 0x60], eax
01ae0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae5 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01aea 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01aef 90                             nop        
01af0 c5f877                         vzeroupper 
01af3 e8e849b6ff                     call       0x7f1e7f9d7d60
01af8 0f1f8400f01b0012               nop        dword ptr [rax + rax + 0x12001bf0]
01b00 4533d2                         xor        r10d, r10d
01b03 4c891424                       mov        qword ptr [rsp], r10
01b07 e927e6ffff                     jmp        0x7f1e7fe719b3
01b0c 4533d2                         xor        r10d, r10d
01b0f 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01b17 e942e6ffff                     jmp        0x7f1e7fe719de
01b1c 4533d2                         xor        r10d, r10d
01b1f 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01b27 e962e6ffff                     jmp        0x7f1e7fe71a0e
01b2c 4533d2                         xor        r10d, r10d
01b2f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b34 e97de6ffff                     jmp        0x7f1e7fe71a36
01b39 4533d2                         xor        r10d, r10d
01b3c 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01b44 e99de6ffff                     jmp        0x7f1e7fe71a66
01b49 4533d2                         xor        r10d, r10d
01b4c 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01b54 e9b8e6ffff                     jmp        0x7f1e7fe71a91
01b59 4183c108                       add        r9d, 8
01b5d be6effffff                     mov        esi, 0xffffff6e
01b62 488b2c24                       mov        rbp, qword ptr [rsp]
01b66 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b6f 89442408                       mov        dword ptr [rsp + 8], eax
01b73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b78 48ff742420                     push       qword ptr [rsp + 0x20]
01b7d 488f442418                     pop        qword ptr [rsp + 0x18]
01b82 48894424f8                     mov        qword ptr [rsp - 8], rax
01b87 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b8b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b94 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01b98 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ba1 89442438                       mov        dword ptr [rsp + 0x38], eax
01ba5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01baa 48ff742468                     push       qword ptr [rsp + 0x68]
01baf 488f442440                     pop        qword ptr [rsp + 0x40]
01bb4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01bbd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01bc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc6 48ff742478                     push       qword ptr [rsp + 0x78]
01bcb 488f442450                     pop        qword ptr [rsp + 0x50]
01bd0 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01bd9 89442458                       mov        dword ptr [rsp + 0x58], eax
01bdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be2 48894424f8                     mov        qword ptr [rsp - 8], rax
01be7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01beb 89442460                       mov        dword ptr [rsp + 0x60], eax
01bef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bf9 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
01c00 89442468                       mov        dword ptr [rsp + 0x68], eax
01c04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c09 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c0e 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c12 6690                           nop        
01c14 c5f877                         vzeroupper 
01c17 e8c448b6ff                     call       0x7f1e7f9d7d60
01c1c 0f1f8400141d0013               nop        dword ptr [rax + rax + 0x13001d14]
01c24 4183c108                       add        r9d, 8
01c28 be66ffffff                     mov        esi, 0xffffff66
01c2d 488b2c24                       mov        rbp, qword ptr [rsp]
01c31 48894424f8                     mov        qword ptr [rsp - 8], rax
01c36 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c3a 89442408                       mov        dword ptr [rsp + 8], eax
01c3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c43 48ff742420                     push       qword ptr [rsp + 0x20]
01c48 488f442418                     pop        qword ptr [rsp + 0x18]
01c4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c52 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c56 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5f 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01c63 48894424f8                     mov        qword ptr [rsp - 8], rax
01c68 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c6c 89442438                       mov        dword ptr [rsp + 0x38], eax
01c70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c75 48ff742468                     push       qword ptr [rsp + 0x68]
01c7a 488f442440                     pop        qword ptr [rsp + 0x40]
01c7f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c84 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c88 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c8c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c91 48ff742478                     push       qword ptr [rsp + 0x78]
01c96 488f442450                     pop        qword ptr [rsp + 0x50]
01c9b 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca0 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ca4 89442458                       mov        dword ptr [rsp + 0x58], eax
01ca8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cad 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01cb6 89442460                       mov        dword ptr [rsp + 0x60], eax
01cba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbf 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01cc4 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01cc8 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01ccd 666690                         nop        
01cd0 c5f877                         vzeroupper 
01cd3 e80848b6ff                     call       0x7f1e7f9d7d60
01cd8 0f1f8400d01d0014               nop        dword ptr [rax + rax + 0x14001dd0]
01ce0 beccffffff                     mov        esi, 0xffffffcc
01ce5 488b2c24                       mov        rbp, qword ptr [rsp]
01ce9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cee 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01cf2 89442408                       mov        dword ptr [rsp + 8], eax
01cf6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cfb 48ff742420                     push       qword ptr [rsp + 0x20]
01d00 488f442418                     pop        qword ptr [rsp + 0x18]
01d05 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d0e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d17 48894424f8                     mov        qword ptr [rsp - 8], rax
01d1c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d20 89442438                       mov        dword ptr [rsp + 0x38], eax
01d24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d29 48ff742468                     push       qword ptr [rsp + 0x68]
01d2e 488f442440                     pop        qword ptr [rsp + 0x40]
01d33 48894424f8                     mov        qword ptr [rsp - 8], rax
01d38 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d3c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d40 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d45 48ff742478                     push       qword ptr [rsp + 0x78]
01d4a 488f442450                     pop        qword ptr [rsp + 0x50]
01d4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d54 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d58 89442458                       mov        dword ptr [rsp + 0x58], eax
01d5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d61 48894424f8                     mov        qword ptr [rsp - 8], rax
01d66 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01d6d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01d71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d76 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d7f 89442460                       mov        dword ptr [rsp + 0x60], eax
01d83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d88 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01d94 89442464                       mov        dword ptr [rsp + 0x64], eax
01d98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d9d 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01da2 6690                           nop        
01da4 c5f877                         vzeroupper 
01da7 e83447b6ff                     call       0x7f1e7f9d7d60
01dac 0f1f8400a41e0015               nop        dword ptr [rax + rax + 0x15001ea4]
01db4 beccffffff                     mov        esi, 0xffffffcc
01db9 48ffb42490000000               push       qword ptr [rsp + 0x90]
01dc1 488f442408                     pop        qword ptr [rsp + 8]
01dc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dcb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dcf 89442414                       mov        dword ptr [rsp + 0x14], eax
01dd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ddd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01de1 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01de5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dea 48ff742468                     push       qword ptr [rsp + 0x68]
01def 488f442440                     pop        qword ptr [rsp + 0x40]
01df4 48894424f8                     mov        qword ptr [rsp - 8], rax
01df9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01dfd 89442448                       mov        dword ptr [rsp + 0x48], eax
01e01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e06 48ffb42488000000               push       qword ptr [rsp + 0x88]
01e0e 488f442450                     pop        qword ptr [rsp + 0x50]
01e13 48ff742478                     push       qword ptr [rsp + 0x78]
01e18 488f442458                     pop        qword ptr [rsp + 0x58]
01e1d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e22 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e26 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e34 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01e3b 89442460                       mov        dword ptr [rsp + 0x60], eax
01e3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e44 48894424f8                     mov        qword ptr [rsp - 8], rax
01e49 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e4d 89442464                       mov        dword ptr [rsp + 0x64], eax
01e51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e56 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01e5e 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01e66 6690                           nop        
01e68 c5f877                         vzeroupper 
01e6b e87046b6ff                     call       0x7f1e7f9d7d60
01e70 0f1f8400681f0016               nop        dword ptr [rax + rax + 0x16001f68]
01e78 bee4ffffff                     mov        esi, 0xffffffe4
01e7d 488b2c24                       mov        rbp, qword ptr [rsp]
01e81 48894424f8                     mov        qword ptr [rsp - 8], rax
01e86 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e8a 89442408                       mov        dword ptr [rsp + 8], eax
01e8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e93 48ff742420                     push       qword ptr [rsp + 0x20]
01e98 488f442418                     pop        qword ptr [rsp + 0x18]
01e9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ea6 8944240c                       mov        dword ptr [rsp + 0xc], eax
01eaa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eaf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01eb3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01eb8 48894424f8                     mov        qword ptr [rsp - 8], rax
01ebd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ec1 89442438                       mov        dword ptr [rsp + 0x38], eax
01ec5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eca 48ff742468                     push       qword ptr [rsp + 0x68]
01ecf 488f442440                     pop        qword ptr [rsp + 0x40]
01ed4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01edd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ee1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee6 48ff742478                     push       qword ptr [rsp + 0x78]
01eeb 488f442450                     pop        qword ptr [rsp + 0x50]
01ef0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ef9 89442458                       mov        dword ptr [rsp + 0x58], eax
01efd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f02 48894424f8                     mov        qword ptr [rsp - 8], rax
01f07 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01f0e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01f12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f17 48894424f8                     mov        qword ptr [rsp - 8], rax
01f1c 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f20 89442460                       mov        dword ptr [rsp + 0x60], eax
01f24 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f29 89442464                       mov        dword ptr [rsp + 0x64], eax
01f2d 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01f34 c5f877                         vzeroupper 
01f37 e8a445b6ff                     call       0x7f1e7f9d7d60
01f3c 0f1f840034200017               nop        dword ptr [rax + rax + 0x17002034]
01f44 be6effffff                     mov        esi, 0xffffff6e
01f49 488b2c24                       mov        rbp, qword ptr [rsp]
01f4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f52 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01f56 89442408                       mov        dword ptr [rsp + 8], eax
01f5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5f 48ff742420                     push       qword ptr [rsp + 0x20]
01f64 488f442418                     pop        qword ptr [rsp + 0x18]
01f69 48894424f8                     mov        qword ptr [rsp - 8], rax
01f6e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f72 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01f7f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01f84 48894424f8                     mov        qword ptr [rsp - 8], rax
01f89 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01f8d 89442438                       mov        dword ptr [rsp + 0x38], eax
01f91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f96 48ff742468                     push       qword ptr [rsp + 0x68]
01f9b 488f442440                     pop        qword ptr [rsp + 0x40]
01fa0 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fa9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb2 48ff742478                     push       qword ptr [rsp + 0x78]
01fb7 488f442450                     pop        qword ptr [rsp + 0x50]
01fbc 48894424f8                     mov        qword ptr [rsp - 8], rax
01fc1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01fc5 89442458                       mov        dword ptr [rsp + 0x58], eax
01fc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fce 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01fd7 89442460                       mov        dword ptr [rsp + 0x60], eax
01fdb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe0 89442464                       mov        dword ptr [rsp + 0x64], eax
01fe4 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01fe9 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01fed 666690                         nop        
01ff0 c5f877                         vzeroupper 
01ff3 e8e844b6ff                     call       0x7f1e7f9d7d60
01ff8 0f1f8400f0200018               nop        dword ptr [rax + rax + 0x180020f0]
02000 be45ffffff                     mov        esi, 0xffffff45
02005 488b2c24                       mov        rbp, qword ptr [rsp]
02009 48894424f8                     mov        qword ptr [rsp - 8], rax
0200e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02012 89442408                       mov        dword ptr [rsp + 8], eax
02016 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201b 48ff742420                     push       qword ptr [rsp + 0x20]
02020 488f442418                     pop        qword ptr [rsp + 0x18]
02025 48894424f8                     mov        qword ptr [rsp - 8], rax
0202a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0202e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02032 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02037 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0203b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02040 48894424f8                     mov        qword ptr [rsp - 8], rax
02045 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02049 89442438                       mov        dword ptr [rsp + 0x38], eax
0204d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02052 48ff742468                     push       qword ptr [rsp + 0x68]
02057 488f442440                     pop        qword ptr [rsp + 0x40]
0205c 48894424f8                     mov        qword ptr [rsp - 8], rax
02061 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02065 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02069 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206e 48ff742478                     push       qword ptr [rsp + 0x78]
02073 488f442450                     pop        qword ptr [rsp + 0x50]
02078 48894424f8                     mov        qword ptr [rsp - 8], rax
0207d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02081 89442458                       mov        dword ptr [rsp + 0x58], eax
02085 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0208a 48894424f8                     mov        qword ptr [rsp - 8], rax
0208f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02093 89442460                       mov        dword ptr [rsp + 0x60], eax
02097 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0209c 89442464                       mov        dword ptr [rsp + 0x64], eax
020a0 894c2478                       mov        dword ptr [rsp + 0x78], ecx
020a4 c5f877                         vzeroupper 
020a7 e83444b6ff                     call       0x7f1e7f9d7d60
020ac 0f1f8400a4210019               nop        dword ptr [rax + rax + 0x190021a4]
020b4 be3dffffff                     mov        esi, 0xffffff3d
020b9 488b2c24                       mov        rbp, qword ptr [rsp]
020bd 48894424f8                     mov        qword ptr [rsp - 8], rax
020c2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
020c6 89442408                       mov        dword ptr [rsp + 8], eax
020ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020cf 48ff742420                     push       qword ptr [rsp + 0x20]
020d4 488f442418                     pop        qword ptr [rsp + 0x18]
020d9 48894424f8                     mov        qword ptr [rsp - 8], rax
020de 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020e2 8944240c                       mov        dword ptr [rsp + 0xc], eax
020e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020eb 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020ef 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020f4 48894424f8                     mov        qword ptr [rsp - 8], rax
020f9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020fd 89442438                       mov        dword ptr [rsp + 0x38], eax
02101 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02106 48ff742468                     push       qword ptr [rsp + 0x68]
0210b 488f442440                     pop        qword ptr [rsp + 0x40]
02110 48894424f8                     mov        qword ptr [rsp - 8], rax
02115 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02119 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0211d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02122 48ff742478                     push       qword ptr [rsp + 0x78]
02127 488f442450                     pop        qword ptr [rsp + 0x50]
0212c 48894424f8                     mov        qword ptr [rsp - 8], rax
02131 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02135 89442458                       mov        dword ptr [rsp + 0x58], eax
02139 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213e 48894424f8                     mov        qword ptr [rsp - 8], rax
02143 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02147 89442460                       mov        dword ptr [rsp + 0x60], eax
0214b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02150 89442464                       mov        dword ptr [rsp + 0x64], eax
02154 894c2478                       mov        dword ptr [rsp + 0x78], ecx
02158 c5f877                         vzeroupper 
0215b e88043b6ff                     call       0x7f1e7f9d7d60
02160 0f1f84005822001a               nop        dword ptr [rax + rax + 0x1a002258]
02168 bee4ffffff                     mov        esi, 0xffffffe4
0216d 488b2c24                       mov        rbp, qword ptr [rsp]
02171 48894424f8                     mov        qword ptr [rsp - 8], rax
02176 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0217a 89442408                       mov        dword ptr [rsp + 8], eax
0217e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02183 48ff742420                     push       qword ptr [rsp + 0x20]
02188 488f442418                     pop        qword ptr [rsp + 0x18]
0218d 48894424f8                     mov        qword ptr [rsp - 8], rax
02192 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02196 8944240c                       mov        dword ptr [rsp + 0xc], eax
0219a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0219f 48894424f8                     mov        qword ptr [rsp - 8], rax
021a4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021a8 89442434                       mov        dword ptr [rsp + 0x34], eax
021ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b1 48ff742468                     push       qword ptr [rsp + 0x68]
021b6 488f442438                     pop        qword ptr [rsp + 0x38]
021bb 48894424f8                     mov        qword ptr [rsp - 8], rax
021c0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021c4 89442440                       mov        dword ptr [rsp + 0x40], eax
021c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021cd 48ffb42488000000               push       qword ptr [rsp + 0x88]
021d5 488f442448                     pop        qword ptr [rsp + 0x48]
021da 48ff742478                     push       qword ptr [rsp + 0x78]
021df 488f442450                     pop        qword ptr [rsp + 0x50]
021e4 48894424f8                     mov        qword ptr [rsp - 8], rax
021e9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
021ed 89442444                       mov        dword ptr [rsp + 0x44], eax
021f1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f6 48894424f8                     mov        qword ptr [rsp - 8], rax
021fb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02202 89442458                       mov        dword ptr [rsp + 0x58], eax
02206 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220b 48894424f8                     mov        qword ptr [rsp - 8], rax
02210 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02214 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02218 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0221d 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
02225 666690                         nop        
02228 c5f877                         vzeroupper 
0222b e8b042b6ff                     call       0x7f1e7f9d7d60
02230 0f1f84002823001b               nop        dword ptr [rax + rax + 0x1b002328]
02238 bee4ffffff                     mov        esi, 0xffffffe4
0223d 48894424f8                     mov        qword ptr [rsp - 8], rax
02242 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02246 89442414                       mov        dword ptr [rsp + 0x14], eax
0224a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0224f 48894424f8                     mov        qword ptr [rsp - 8], rax
02254 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02258 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0225c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02261 48ff742468                     push       qword ptr [rsp + 0x68]
02266 488f442440                     pop        qword ptr [rsp + 0x40]
0226b 48894424f8                     mov        qword ptr [rsp - 8], rax
02270 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02274 89442448                       mov        dword ptr [rsp + 0x48], eax
02278 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227d 48ffb42488000000               push       qword ptr [rsp + 0x88]
02285 488f442450                     pop        qword ptr [rsp + 0x50]
0228a 48ff742478                     push       qword ptr [rsp + 0x78]
0228f 488f442458                     pop        qword ptr [rsp + 0x58]
02294 48894424f8                     mov        qword ptr [rsp - 8], rax
02299 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0229d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
022a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a6 48894424f8                     mov        qword ptr [rsp - 8], rax
022ab 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
022b2 89442460                       mov        dword ptr [rsp + 0x60], eax
022b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022bb 48894424f8                     mov        qword ptr [rsp - 8], rax
022c0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
022c4 89442464                       mov        dword ptr [rsp + 0x64], eax
022c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022cd 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
022d2 6690                           nop        
022d4 c5f877                         vzeroupper 
022d7 e80442b6ff                     call       0x7f1e7f9d7d60
022dc 0f1f8400d423001c               nop        dword ptr [rax + rax + 0x1c0023d4]
022e4 418d6901                       lea        ebp, [r9 + 1]
022e8 bee4ffffff                     mov        esi, 0xffffffe4
022ed 48ffb42490000000               push       qword ptr [rsp + 0x90]
022f5 488f442408                     pop        qword ptr [rsp + 8]
022fa 48894424f8                     mov        qword ptr [rsp - 8], rax
022ff 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02303 89442414                       mov        dword ptr [rsp + 0x14], eax
02307 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230c 48894424f8                     mov        qword ptr [rsp - 8], rax
02311 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02315 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02319 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0231e 48ff742468                     push       qword ptr [rsp + 0x68]
02323 488f442440                     pop        qword ptr [rsp + 0x40]
02328 48894424f8                     mov        qword ptr [rsp - 8], rax
0232d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02331 89442448                       mov        dword ptr [rsp + 0x48], eax
02335 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0233a 48ffb42488000000               push       qword ptr [rsp + 0x88]
02342 488f442450                     pop        qword ptr [rsp + 0x50]
02347 48ff742478                     push       qword ptr [rsp + 0x78]
0234c 488f442458                     pop        qword ptr [rsp + 0x58]
02351 48894424f8                     mov        qword ptr [rsp - 8], rax
02356 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0235a 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0235e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02363 48894424f8                     mov        qword ptr [rsp - 8], rax
02368 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0236f 89442460                       mov        dword ptr [rsp + 0x60], eax
02373 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02378 48894424f8                     mov        qword ptr [rsp - 8], rax
0237d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02381 89442464                       mov        dword ptr [rsp + 0x64], eax
02385 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0238a 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0238f 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
02396 6690                           nop        
02398 c5f877                         vzeroupper 
0239b e84041b6ff                     call       0x7f1e7f9d7d60
023a0 0f1f84009824001d               nop        dword ptr [rax + rax + 0x1d002498]
023a8 bee4ffffff                     mov        esi, 0xffffffe4
023ad 48894424f8                     mov        qword ptr [rsp - 8], rax
023b2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
023b6 89442414                       mov        dword ptr [rsp + 0x14], eax
023ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023bf 48894424f8                     mov        qword ptr [rsp - 8], rax
023c4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023c8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d1 48ff742468                     push       qword ptr [rsp + 0x68]
023d6 488f442440                     pop        qword ptr [rsp + 0x40]
023db 48894424f8                     mov        qword ptr [rsp - 8], rax
023e0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023e4 89442448                       mov        dword ptr [rsp + 0x48], eax
023e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023ed 48ffb42488000000               push       qword ptr [rsp + 0x88]
023f5 488f442450                     pop        qword ptr [rsp + 0x50]
023fa 48ff742478                     push       qword ptr [rsp + 0x78]
023ff 488f442458                     pop        qword ptr [rsp + 0x58]
02404 48894424f8                     mov        qword ptr [rsp - 8], rax
02409 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0240d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02411 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02416 48894424f8                     mov        qword ptr [rsp - 8], rax
0241b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02422 89442460                       mov        dword ptr [rsp + 0x60], eax
02426 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242b 48894424f8                     mov        qword ptr [rsp - 8], rax
02430 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02434 89442464                       mov        dword ptr [rsp + 0x64], eax
02438 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0243d 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02442 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
02449 666690                         nop        
0244c c5f877                         vzeroupper 
0244f e88c40b6ff                     call       0x7f1e7f9d7d60
02454 0f1f84004c25001e               nop        dword ptr [rax + rax + 0x1e00254c]
0245c bee4ffffff                     mov        esi, 0xffffffe4
02461 488b2c24                       mov        rbp, qword ptr [rsp]
02465 48894424f8                     mov        qword ptr [rsp - 8], rax
0246a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0246e 89442408                       mov        dword ptr [rsp + 8], eax
02472 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02477 48ff742420                     push       qword ptr [rsp + 0x20]
0247c 488f442418                     pop        qword ptr [rsp + 0x18]
02481 48894424f8                     mov        qword ptr [rsp - 8], rax
02486 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0248a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0248e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02493 48894424f8                     mov        qword ptr [rsp - 8], rax
02498 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0249c 89442434                       mov        dword ptr [rsp + 0x34], eax
024a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a5 48ff742468                     push       qword ptr [rsp + 0x68]
024aa 488f442438                     pop        qword ptr [rsp + 0x38]
024af 48894424f8                     mov        qword ptr [rsp - 8], rax
024b4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
024b8 89442440                       mov        dword ptr [rsp + 0x40], eax
024bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024c1 48ff742478                     push       qword ptr [rsp + 0x78]
024c6 488f442450                     pop        qword ptr [rsp + 0x50]
024cb 48894424f8                     mov        qword ptr [rsp - 8], rax
024d0 8b442474                       mov        eax, dword ptr [rsp + 0x74]
024d4 89442444                       mov        dword ptr [rsp + 0x44], eax
024d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024dd 48894424f8                     mov        qword ptr [rsp - 8], rax
024e2 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024e6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
024ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ef 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
024f4 c5f877                         vzeroupper 
024f7 e8e43fb6ff                     call       0x7f1e7f9d7d60
024fc 0f1f8400f425001f               nop        dword ptr [rax + rax + 0x1f0025f4]
02504 beccffffff                     mov        esi, 0xffffffcc
02509 488b2c24                       mov        rbp, qword ptr [rsp]
0250d 48894424f8                     mov        qword ptr [rsp - 8], rax
02512 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02516 89442408                       mov        dword ptr [rsp + 8], eax
0251a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0251f 48ff742420                     push       qword ptr [rsp + 0x20]
02524 488f442418                     pop        qword ptr [rsp + 0x18]
02529 48894424f8                     mov        qword ptr [rsp - 8], rax
0252e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02532 8944240c                       mov        dword ptr [rsp + 0xc], eax
02536 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0253b 48894424f8                     mov        qword ptr [rsp - 8], rax
02540 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02544 89442434                       mov        dword ptr [rsp + 0x34], eax
02548 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0254d 48ff742468                     push       qword ptr [rsp + 0x68]
02552 488f442438                     pop        qword ptr [rsp + 0x38]
02557 48894424f8                     mov        qword ptr [rsp - 8], rax
0255c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02560 89442440                       mov        dword ptr [rsp + 0x40], eax
02564 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02569 48ffb42488000000               push       qword ptr [rsp + 0x88]
02571 488f442448                     pop        qword ptr [rsp + 0x48]
02576 48ff742478                     push       qword ptr [rsp + 0x78]
0257b 488f442450                     pop        qword ptr [rsp + 0x50]
02580 48894424f8                     mov        qword ptr [rsp - 8], rax
02585 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02589 89442444                       mov        dword ptr [rsp + 0x44], eax
0258d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02592 48894424f8                     mov        qword ptr [rsp - 8], rax
02597 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0259e 89442458                       mov        dword ptr [rsp + 0x58], eax
025a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025a7 48894424f8                     mov        qword ptr [rsp - 8], rax
025ac 8b442470                       mov        eax, dword ptr [rsp + 0x70]
025b0 8944245c                       mov        dword ptr [rsp + 0x5c], eax
025b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025b9 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
025be 6690                           nop        
025c0 c5f877                         vzeroupper 
025c3 e8183fb6ff                     call       0x7f1e7f9d7d60
025c8 0f1f8400c0260020               nop        dword ptr [rax + rax + 0x200026c0]
025d0 be45ffffff                     mov        esi, 0xffffff45
025d5 488b2c24                       mov        rbp, qword ptr [rsp]
025d9 48894424f8                     mov        qword ptr [rsp - 8], rax
025de 8b442410                       mov        eax, dword ptr [rsp + 0x10]
025e2 89442408                       mov        dword ptr [rsp + 8], eax
025e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025eb 48ff742420                     push       qword ptr [rsp + 0x20]
025f0 488f442418                     pop        qword ptr [rsp + 0x18]
025f5 48894424f8                     mov        qword ptr [rsp - 8], rax
025fa 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025fe 8944240c                       mov        dword ptr [rsp + 0xc], eax
02602 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02607 48894424f8                     mov        qword ptr [rsp - 8], rax
0260c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02610 89442438                       mov        dword ptr [rsp + 0x38], eax
02614 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02619 48ff742468                     push       qword ptr [rsp + 0x68]
0261e 488f442440                     pop        qword ptr [rsp + 0x40]
02623 48894424f8                     mov        qword ptr [rsp - 8], rax
02628 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0262c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02630 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02635 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0263a 6690                           nop        
0263c c5f877                         vzeroupper 
0263f e89c3eb6ff                     call       0x7f1e7f9d7d60
02644 0f1f84003c270021               nop        dword ptr [rax + rax + 0x2100273c]
0264c bebeffffff                     mov        esi, 0xffffffbe
02651 488b2c24                       mov        rbp, qword ptr [rsp]
02655 48894424f8                     mov        qword ptr [rsp - 8], rax
0265a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0265e 89442408                       mov        dword ptr [rsp + 8], eax
02662 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02667 48ff742420                     push       qword ptr [rsp + 0x20]
0266c 488f442418                     pop        qword ptr [rsp + 0x18]
02671 48894424f8                     mov        qword ptr [rsp - 8], rax
02676 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0267a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0267e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02683 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02687 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0268c 48894424f8                     mov        qword ptr [rsp - 8], rax
02691 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02695 89442438                       mov        dword ptr [rsp + 0x38], eax
02699 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0269e 6690                           nop        
026a0 c5f877                         vzeroupper 
026a3 e8383eb6ff                     call       0x7f1e7f9d7d60
026a8 0f1f8400a0270022               nop        dword ptr [rax + rax + 0x220027a0]
026b0 be85ffffff                     mov        esi, 0xffffff85
026b5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
026b9 48894424f8                     mov        qword ptr [rsp - 8], rax
026be 8b442428                       mov        eax, dword ptr [rsp + 0x28]
026c2 890424                         mov        dword ptr [rsp], eax
026c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ca 895c2404                       mov        dword ptr [rsp + 4], ebx
026ce 4489742408                     mov        dword ptr [rsp + 8], r14d
026d3 48894424f8                     mov        qword ptr [rsp - 8], rax
026d8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
026dc 8944240c                       mov        dword ptr [rsp + 0xc], eax
026e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e5 48894424f8                     mov        qword ptr [rsp - 8], rax
026ea 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026ee 89442418                       mov        dword ptr [rsp + 0x18], eax
026f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f7 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
026fc c5f877                         vzeroupper 
026ff e8dc3db6ff                     call       0x7f1e7f9d7d60
02704 0f1f8400fc270023               nop        dword ptr [rax + rax + 0x230027fc]
0270c beccffffff                     mov        esi, 0xffffffcc
02711 488b2c24                       mov        rbp, qword ptr [rsp]
02715 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0271a 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0271e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02723 90                             nop        
02724 c5f877                         vzeroupper 
02727 e8b43db6ff                     call       0x7f1e7f9d7d60
0272c 0f1f840024280024               nop        dword ptr [rax + rax + 0x24002824]
02734 bee4ffffff                     mov        esi, 0xffffffe4
02739 488b2c24                       mov        rbp, qword ptr [rsp]
0273d 48894424f8                     mov        qword ptr [rsp - 8], rax
02742 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02746 89442408                       mov        dword ptr [rsp + 8], eax
0274a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0274f 48ff742420                     push       qword ptr [rsp + 0x20]
02754 488f442418                     pop        qword ptr [rsp + 0x18]
02759 48894424f8                     mov        qword ptr [rsp - 8], rax
0275e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02762 8944240c                       mov        dword ptr [rsp + 0xc], eax
02766 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0276b 48894424f8                     mov        qword ptr [rsp - 8], rax
02770 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02774 89442434                       mov        dword ptr [rsp + 0x34], eax
02778 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277d 48ff742468                     push       qword ptr [rsp + 0x68]
02782 488f442438                     pop        qword ptr [rsp + 0x38]
02787 48894424f8                     mov        qword ptr [rsp - 8], rax
0278c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02790 89442440                       mov        dword ptr [rsp + 0x40], eax
02794 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02799 48ff742478                     push       qword ptr [rsp + 0x78]
0279e 488f442450                     pop        qword ptr [rsp + 0x50]
027a3 48894424f8                     mov        qword ptr [rsp - 8], rax
027a8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
027ac 89442444                       mov        dword ptr [rsp + 0x44], eax
027b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b5 48894424f8                     mov        qword ptr [rsp - 8], rax
027ba 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
027c1 89442458                       mov        dword ptr [rsp + 0x58], eax
027c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027ca 48894424f8                     mov        qword ptr [rsp - 8], rax
027cf 8b442470                       mov        eax, dword ptr [rsp + 0x70]
027d3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
027d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027dc 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
027e4 c5f877                         vzeroupper 
027e7 e8f43cb6ff                     call       0x7f1e7f9d7d60
027ec 0f1f8400e4280025               nop        dword ptr [rax + rax + 0x250028e4]
027f4 bee4ffffff                     mov        esi, 0xffffffe4
027f9 488b2c24                       mov        rbp, qword ptr [rsp]
027fd 48894424f8                     mov        qword ptr [rsp - 8], rax
02802 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02806 89442408                       mov        dword ptr [rsp + 8], eax
0280a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0280f 48ff742420                     push       qword ptr [rsp + 0x20]
02814 488f442418                     pop        qword ptr [rsp + 0x18]
02819 48894424f8                     mov        qword ptr [rsp - 8], rax
0281e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02822 8944240c                       mov        dword ptr [rsp + 0xc], eax
02826 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0282b 48894424f8                     mov        qword ptr [rsp - 8], rax
02830 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02834 89442434                       mov        dword ptr [rsp + 0x34], eax
02838 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0283d 48ff742468                     push       qword ptr [rsp + 0x68]
02842 488f442438                     pop        qword ptr [rsp + 0x38]
02847 48894424f8                     mov        qword ptr [rsp - 8], rax
0284c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02850 89442440                       mov        dword ptr [rsp + 0x40], eax
02854 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02859 48ff742478                     push       qword ptr [rsp + 0x78]
0285e 488f442450                     pop        qword ptr [rsp + 0x50]
02863 48894424f8                     mov        qword ptr [rsp - 8], rax
02868 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0286c 89442444                       mov        dword ptr [rsp + 0x44], eax
02870 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02875 48894424f8                     mov        qword ptr [rsp - 8], rax
0287a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02881 89442458                       mov        dword ptr [rsp + 0x58], eax
02885 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0288a 48894424f8                     mov        qword ptr [rsp - 8], rax
0288f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02893 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02897 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0289c 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
028a1 48898c2480000000               mov        qword ptr [rsp + 0x80], rcx
028a9 666690                         nop        
028ac c5f877                         vzeroupper 
028af e82c3cb6ff                     call       0x7f1e7f9d7d60
028b4 0f1f8400ac290026               nop        dword ptr [rax + rax + 0x260029ac]
028bc 4183c108                       add        r9d, 8
028c0 be6effffff                     mov        esi, 0xffffff6e
028c5 48894424f8                     mov        qword ptr [rsp - 8], rax
028ca 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028ce 89442414                       mov        dword ptr [rsp + 0x14], eax
028d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d7 48894424f8                     mov        qword ptr [rsp - 8], rax
028dc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
028e0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
028e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e9 48ff742468                     push       qword ptr [rsp + 0x68]
028ee 488f442440                     pop        qword ptr [rsp + 0x40]
028f3 48894424f8                     mov        qword ptr [rsp - 8], rax
028f8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
028fc 89442448                       mov        dword ptr [rsp + 0x48], eax
02900 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02905 48894424f8                     mov        qword ptr [rsp - 8], rax
0290a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0290e 89442464                       mov        dword ptr [rsp + 0x64], eax
02912 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02917 48894424f8                     mov        qword ptr [rsp - 8], rax
0291c 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
02923 89442468                       mov        dword ptr [rsp + 0x68], eax
02927 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0292c 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02931 666690                         nop        
02934 c5f877                         vzeroupper 
02937 e8a43bb6ff                     call       0x7f1e7f9d7d60
0293c 0f1f8400342a0027               nop        dword ptr [rax + rax + 0x27002a34]
02944 4183c108                       add        r9d, 8
02948 beb6ffffff                     mov        esi, 0xffffffb6
0294d 48894424f8                     mov        qword ptr [rsp - 8], rax
02952 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02956 89442414                       mov        dword ptr [rsp + 0x14], eax
0295a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0295f 48894424f8                     mov        qword ptr [rsp - 8], rax
02964 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02968 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0296c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02971 48ff742468                     push       qword ptr [rsp + 0x68]
02976 488f442440                     pop        qword ptr [rsp + 0x40]
0297b 48894424f8                     mov        qword ptr [rsp - 8], rax
02980 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02984 89442448                       mov        dword ptr [rsp + 0x48], eax
02988 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0298d 48894424f8                     mov        qword ptr [rsp - 8], rax
02992 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02996 89442464                       mov        dword ptr [rsp + 0x64], eax
0299a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0299f 48894424f8                     mov        qword ptr [rsp - 8], rax
029a4 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
029ab 89442468                       mov        dword ptr [rsp + 0x68], eax
029af 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029b4 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
029b9 666690                         nop        
029bc c5f877                         vzeroupper 
029bf e81c3bb6ff                     call       0x7f1e7f9d7d60
029c4 0f1f8400bc2a0028               nop        dword ptr [rax + rax + 0x28002abc]
029cc 4183c108                       add        r9d, 8
029d0 be66ffffff                     mov        esi, 0xffffff66
029d5 48894424f8                     mov        qword ptr [rsp - 8], rax
029da 8b442428                       mov        eax, dword ptr [rsp + 0x28]
029de 89442414                       mov        dword ptr [rsp + 0x14], eax
029e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029e7 48894424f8                     mov        qword ptr [rsp - 8], rax
029ec 8b442460                       mov        eax, dword ptr [rsp + 0x60]
029f0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
029f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f9 48ff742468                     push       qword ptr [rsp + 0x68]
029fe 488f442440                     pop        qword ptr [rsp + 0x40]
02a03 48894424f8                     mov        qword ptr [rsp - 8], rax
02a08 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a0c 89442448                       mov        dword ptr [rsp + 0x48], eax
02a10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a15 48894424f8                     mov        qword ptr [rsp - 8], rax
02a1a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a1e 89442464                       mov        dword ptr [rsp + 0x64], eax
02a22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a27 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02a2c 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02a30 c5f877                         vzeroupper 
02a33 e8a83ab6ff                     call       0x7f1e7f9d7d60
02a38 0f1f8400302b0029               nop        dword ptr [rax + rax + 0x29002b30]
02a40 bee4ffffff                     mov        esi, 0xffffffe4
02a45 488b2c24                       mov        rbp, qword ptr [rsp]
02a49 48894424f8                     mov        qword ptr [rsp - 8], rax
02a4e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02a52 89442408                       mov        dword ptr [rsp + 8], eax
02a56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a5b 48ff742420                     push       qword ptr [rsp + 0x20]
02a60 488f442418                     pop        qword ptr [rsp + 0x18]
02a65 48894424f8                     mov        qword ptr [rsp - 8], rax
02a6a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02a6e 8944240c                       mov        dword ptr [rsp + 0xc], eax
02a72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a77 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02a80 89442434                       mov        dword ptr [rsp + 0x34], eax
02a84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a89 48ff742468                     push       qword ptr [rsp + 0x68]
02a8e 488f442438                     pop        qword ptr [rsp + 0x38]
02a93 48894424f8                     mov        qword ptr [rsp - 8], rax
02a98 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a9c 89442440                       mov        dword ptr [rsp + 0x40], eax
02aa0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aa5 48ff742478                     push       qword ptr [rsp + 0x78]
02aaa 488f442450                     pop        qword ptr [rsp + 0x50]
02aaf 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab4 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02ab8 89442444                       mov        dword ptr [rsp + 0x44], eax
02abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac1 48894424f8                     mov        qword ptr [rsp - 8], rax
02ac6 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02acd 89442458                       mov        dword ptr [rsp + 0x58], eax
02ad1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ad6 48894424f8                     mov        qword ptr [rsp - 8], rax
02adb 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02adf 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ae3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ae8 89442460                       mov        dword ptr [rsp + 0x60], eax
02aec 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02af1 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02af5 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02afa 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02b02 6690                           nop        
02b04 c5f877                         vzeroupper 
02b07 e8d439b6ff                     call       0x7f1e7f9d7d60
02b0c 0f1f8400042c002a               nop        dword ptr [rax + rax + 0x2a002c04]
02b14 bee4ffffff                     mov        esi, 0xffffffe4
02b19 488b2c24                       mov        rbp, qword ptr [rsp]
02b1d 48ffb42490000000               push       qword ptr [rsp + 0x90]
02b25 488f0424                       pop        qword ptr [rsp]
02b29 48894424f8                     mov        qword ptr [rsp - 8], rax
02b2e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02b32 89442408                       mov        dword ptr [rsp + 8], eax
02b36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b3b 48ffb42498000000               push       qword ptr [rsp + 0x98]
02b43 488f442410                     pop        qword ptr [rsp + 0x10]
02b48 48ff742420                     push       qword ptr [rsp + 0x20]
02b4d 488f442418                     pop        qword ptr [rsp + 0x18]
02b52 48894424f8                     mov        qword ptr [rsp - 8], rax
02b57 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b5b 8944240c                       mov        dword ptr [rsp + 0xc], eax
02b5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b64 48894424f8                     mov        qword ptr [rsp - 8], rax
02b69 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02b6d 89442434                       mov        dword ptr [rsp + 0x34], eax
02b71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b76 48ff742468                     push       qword ptr [rsp + 0x68]
02b7b 488f442438                     pop        qword ptr [rsp + 0x38]
02b80 48894424f8                     mov        qword ptr [rsp - 8], rax
02b85 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b89 89442440                       mov        dword ptr [rsp + 0x40], eax
02b8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b92 48ff742478                     push       qword ptr [rsp + 0x78]
02b97 488f442450                     pop        qword ptr [rsp + 0x50]
02b9c 48894424f8                     mov        qword ptr [rsp - 8], rax
02ba1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02ba5 89442444                       mov        dword ptr [rsp + 0x44], eax
02ba9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bae 48894424f8                     mov        qword ptr [rsp - 8], rax
02bb3 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02bba 89442458                       mov        dword ptr [rsp + 0x58], eax
02bbe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bc3 48894424f8                     mov        qword ptr [rsp - 8], rax
02bc8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02bcc 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02bd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd5 89442460                       mov        dword ptr [rsp + 0x60], eax
02bd9 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02bde 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02be3 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02bea c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02bf3 90                             nop        
02bf4 c5f877                         vzeroupper 
02bf7 e8e438b6ff                     call       0x7f1e7f9d7d60
02bfc 0f1f8400f42c002b               nop        dword ptr [rax + rax + 0x2b002cf4]
02c04 beccffffff                     mov        esi, 0xffffffcc
02c09 488b2c24                       mov        rbp, qword ptr [rsp]
02c0d 48894424f8                     mov        qword ptr [rsp - 8], rax
02c12 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c16 89442408                       mov        dword ptr [rsp + 8], eax
02c1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c1f 48ff742420                     push       qword ptr [rsp + 0x20]
02c24 488f442418                     pop        qword ptr [rsp + 0x18]
02c29 48894424f8                     mov        qword ptr [rsp - 8], rax
02c2e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c32 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c36 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c3b 48894424f8                     mov        qword ptr [rsp - 8], rax
02c40 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02c44 89442438                       mov        dword ptr [rsp + 0x38], eax
02c48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c4d 48ff742468                     push       qword ptr [rsp + 0x68]
02c52 488f442440                     pop        qword ptr [rsp + 0x40]
02c57 48894424f8                     mov        qword ptr [rsp - 8], rax
02c5c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c60 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02c64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c69 48ffb42488000000               push       qword ptr [rsp + 0x88]
02c71 488f442448                     pop        qword ptr [rsp + 0x48]
02c76 48ff742478                     push       qword ptr [rsp + 0x78]
02c7b 488f442450                     pop        qword ptr [rsp + 0x50]
02c80 48894424f8                     mov        qword ptr [rsp - 8], rax
02c85 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02c89 89442458                       mov        dword ptr [rsp + 0x58], eax
02c8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c92 48894424f8                     mov        qword ptr [rsp - 8], rax
02c97 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02c9e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ca2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ca7 48894424f8                     mov        qword ptr [rsp - 8], rax
02cac 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02cb0 89442460                       mov        dword ptr [rsp + 0x60], eax
02cb4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cb9 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02cbe 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02cc2 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02cc9 666690                         nop        
02ccc c5f877                         vzeroupper 
02ccf e80c38b6ff                     call       0x7f1e7f9d7d60
02cd4 0f1f8400cc2d002c               nop        dword ptr [rax + rax + 0x2c002dcc]
02cdc 418bee                         mov        ebp, r14d
02cdf 83c510                         add        ebp, 0x10
02ce2 be6effffff                     mov        esi, 0xffffff6e
02ce7 48894424f8                     mov        qword ptr [rsp - 8], rax
02cec 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02cf0 89442414                       mov        dword ptr [rsp + 0x14], eax
02cf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cf9 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02cfe 48894424f8                     mov        qword ptr [rsp - 8], rax
02d03 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02d07 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02d0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d10 48ff742468                     push       qword ptr [rsp + 0x68]
02d15 488f442440                     pop        qword ptr [rsp + 0x40]
02d1a 48894424f8                     mov        qword ptr [rsp - 8], rax
02d1f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02d23 89442448                       mov        dword ptr [rsp + 0x48], eax
02d27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d2c 48ff742478                     push       qword ptr [rsp + 0x78]
02d31 488f442458                     pop        qword ptr [rsp + 0x58]
02d36 48894424f8                     mov        qword ptr [rsp - 8], rax
02d3b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02d3f 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02d43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d48 48894424f8                     mov        qword ptr [rsp - 8], rax
02d4d 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02d54 89442460                       mov        dword ptr [rsp + 0x60], eax
02d58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d5d 48894424f8                     mov        qword ptr [rsp - 8], rax
02d62 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02d66 89442464                       mov        dword ptr [rsp + 0x64], eax
02d6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d6f 89442468                       mov        dword ptr [rsp + 0x68], eax
02d73 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02d78 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02d7f 90                             nop        
02d80 c5f877                         vzeroupper 
02d83 e85837b6ff                     call       0x7f1e7f9d7d60
02d88 0f1f8400802e002d               nop        dword ptr [rax + rax + 0x2d002e80]
02d90 418bee                         mov        ebp, r14d
02d93 83c510                         add        ebp, 0x10
02d96 be66ffffff                     mov        esi, 0xffffff66
02d9b 48894424f8                     mov        qword ptr [rsp - 8], rax
02da0 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02da4 89442414                       mov        dword ptr [rsp + 0x14], eax
02da8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dad 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02db2 48894424f8                     mov        qword ptr [rsp - 8], rax
02db7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02dbb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02dbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dc4 48ff742468                     push       qword ptr [rsp + 0x68]
02dc9 488f442440                     pop        qword ptr [rsp + 0x40]
02dce 48894424f8                     mov        qword ptr [rsp - 8], rax
02dd3 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02dd7 89442448                       mov        dword ptr [rsp + 0x48], eax
02ddb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02de0 48ff742478                     push       qword ptr [rsp + 0x78]
02de5 488f442458                     pop        qword ptr [rsp + 0x58]
02dea 48894424f8                     mov        qword ptr [rsp - 8], rax
02def 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02df3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02df7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dfc 48894424f8                     mov        qword ptr [rsp - 8], rax
02e01 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02e08 89442460                       mov        dword ptr [rsp + 0x60], eax
02e0c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e11 48894424f8                     mov        qword ptr [rsp - 8], rax
02e16 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e1a 89442464                       mov        dword ptr [rsp + 0x64], eax
02e1e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e23 89442468                       mov        dword ptr [rsp + 0x68], eax
02e27 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02e2c 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02e33 90                             nop        
02e34 c5f877                         vzeroupper 
02e37 e8a436b6ff                     call       0x7f1e7f9d7d60
02e3c 0f1f8400342f002e               nop        dword ptr [rax + rax + 0x2e002f34]
02e44 488bf0                         mov        rsi, rax
02e47 eb0d                           jmp        0x7f1e7fe746d6
02e49 488bf0                         mov        rsi, rax
02e4c eb08                           jmp        0x7f1e7fe746d6
02e4e 488bf0                         mov        rsi, rax
02e51 eb03                           jmp        0x7f1e7fe746d6
02e53 488bf0                         mov        rsi, rax
02e56 c5f877                         vzeroupper 
02e59 4881c4f0000000                 add        rsp, 0xf0
02e60 5d                             pop        rbp
02e61 e97a62b6ff                     jmp        0x7f1e7f9da960
02e66 bef6ffffff                     mov        esi, 0xfffffff6
02e6b 90                             nop        
02e6c c5f877                         vzeroupper 
02e6f e86c36b6ff                     call       0x7f1e7f9d7d60
02e74 0f1f84006c2f002f               nop        dword ptr [rax + rax + 0x2f002f6c]
02e7c 49baf425e77f1e7f0000           movabs     r10, 0x7f1e7fe725f4
02e86 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02e8d e9cee7a9ff                     jmp        0x7f1e7f912ee0
02e92 e889b3a8ff                     call       0x7f1e7f8ffaa0
02e97 e992d1ffff                     jmp        0x7f1e7fe718ae
02e9c f4                             hlt        
02e9d f4                             hlt        
02e9e f4                             hlt        
02e9f f4                             hlt        
