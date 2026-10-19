00000 e8bbe39516                     call       0x7f1e967d5740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f85782f0000                   jne        0x7f1e7fe7a326
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
00111 0f84311a0000                   je         0x7f1e7fe78ec8
00117 458b5504                       mov        r10d, dword ptr [r13 + 4]
0011b 41c1ea0a                       shr        r10d, 0xa
0011f 4181fa0c080000                 cmp        r10d, 0x80c
00126 0f85d8260000                   jne        0x7f1e7fe79b84
0012c 4d8bd5                         mov        r10, r13
0012f 4c891424                       mov        qword ptr [rsp], r10
00133 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00138 4d85d2                         test       r10, r10
0013b 0f84131a0000                   je         0x7f1e7fe78ed4
00141 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00145 41c1eb0a                       shr        r11d, 0xa
00149 4181fb05020000                 cmp        r11d, 0x205
00150 0f85ae260000                   jne        0x7f1e7fe79b84
00156 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0015e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00163 4d85d2                         test       r10, r10
00166 0f84f8190000                   je         0x7f1e7fe78ee4
0016c 458b5204                       mov        r10d, dword ptr [r10 + 4]
00170 41c1ea0a                       shr        r10d, 0xa
00174 4181fa08020000                 cmp        r10d, 0x208
0017b 0f8583260000                   jne        0x7f1e7fe79b84
00181 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00186 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0018e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00193 4d85d2                         test       r10, r10
00196 0f84d8190000                   je         0x7f1e7fe78ef4
0019c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001a0 41c1eb0a                       shr        r11d, 0xa
001a4 4181fb07020000                 cmp        r11d, 0x207
001ab 0f8553260000                   jne        0x7f1e7fe79b84
001b1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001bb 4d85d2                         test       r10, r10
001be 0f84bd190000                   je         0x7f1e7fe78f01
001c4 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c8 41c1ea0a                       shr        r10d, 0xa
001cc 4181fa07020000                 cmp        r10d, 0x207
001d3 0f852b260000                   jne        0x7f1e7fe79b84
001d9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001de 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
001e6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001eb 4d85d2                         test       r10, r10
001ee 0f849d190000                   je         0x7f1e7fe78f11
001f4 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f8 41c1eb0a                       shr        r11d, 0xa
001fc 4181fb05020000                 cmp        r11d, 0x205
00203 0f85fb250000                   jne        0x7f1e7fe79b84
00209 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
00211 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00219 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00222 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00227 4585db                         test       r11d, r11d
0022a 0f8470250000                   je         0x7f1e7fe79b20
00230 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00238 458b5208                       mov        r10d, dword ptr [r10 + 8]
0023c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00241 4585d2                         test       r10d, r10d
00244 0f8656250000                   jbe        0x7f1e7fe79b20
0024a 4183fa01                       cmp        r10d, 1
0024e 0f864c250000                   jbe        0x7f1e7fe79b20
00254 4183fa02                       cmp        r10d, 2
00258 0f8642250000                   jbe        0x7f1e7fe79b20
0025e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00266 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0026a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0026f 4183c3f1                       add        r11d, -0xf
00273 4585db                         test       r11d, r11d
00276 0f8c24250000                   jl         0x7f1e7fe79b20
0027c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00284 458b5208                       mov        r10d, dword ptr [r10 + 8]
00288 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0028d 4183c2f1                       add        r10d, -0xf
00291 4585d2                         test       r10d, r10d
00294 0f8c06250000                   jl         0x7f1e7fe79b20
0029a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0029f 4183c3f9                       add        r11d, -7
002a3 4585db                         test       r11d, r11d
002a6 0f8cf4240000                   jl         0x7f1e7fe79b20
002ac 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
002b1 458d53f9                       lea        r10d, [r11 - 7]
002b5 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
002bd 4d63d3                         movsxd     r10, r11d
002c0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
002c5 4183c3f1                       add        r11d, -0xf
002c9 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
002d1 4983c2f9                       add        r10, -7
002d5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
002da 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002df 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
002e4 458d53f1                       lea        r10d, [r11 - 0xf]
002e8 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
002f0 e9ea030000                     jmp        0x7f1e7fe77a5f
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
00342 0f8da4090000                   jge        0x7f1e7fe7806c
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
0037d 0f8c791a0000                   jl         0x7f1e7fe7917c
00383 4585ed                         test       r13d, r13d
00386 0f8c701a0000                   jl         0x7f1e7fe7917c
0038c 458d1429                       lea        r10d, [r9 + rbp]
00390 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00395 453bda                         cmp        r11d, r10d
00398 0f825e1a0000                   jb         0x7f1e7fe7917c
0039e 418bdd                         mov        ebx, r13d
003a1 03dd                           add        ebx, ebp
003a3 443bdb                         cmp        r11d, ebx
003a6 0f82501a0000                   jb         0x7f1e7fe7917c
003ac 85ed                           test       ebp, ebp
003ae 0f8c481a0000                   jl         0x7f1e7fe7917c
003b4 85ed                           test       ebp, ebp
003b6 0f845cffffff                   je         0x7f1e7fe77698
003bc 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
003c4 4b8d742a0c                     lea        rsi, [r10 + r13 + 0xc]
003c9 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003d1 458bd1                         mov        r10d, r9d
003d4 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
003d9 4863d5                         movsxd     rdx, ebp
003dc 4883fa20                       cmp        rdx, 0x20
003e0 0f860fffffff                   jbe        0x7f1e7fe77675
003e6 c5f877                         vzeroupper 
003e9 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
003f3 41ffd2                         call       r10
003f6 0f1f840000000000               nop        dword ptr [rax + rax]
003fe e915ffffff                     jmp        0x7f1e7fe77698
00403 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
0040b c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
00412 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00419 4103d8                         add        ebx, r8d
0041c e9a2020000                     jmp        0x7f1e7fe77a43
00421 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00429 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00431 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
00436 4b8d7c0b0c                     lea        rdi, [r11 + r9 + 0xc]
0043b 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00443 44039c24bc000000               add        r11d, dword ptr [rsp + 0xbc]
0044b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00453 4d63c3                         movsxd     r8, r11d
00456 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
0045e 443b9424b0000000               cmp        r10d, dword ptr [rsp + 0xb0]
00466 0f8c01060000                   jl         0x7f1e7fe77ded
0046c 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00474 4183fb30                       cmp        r11d, 0x30
00478 0f8e9d000000                   jle        0x7f1e7fe7789b
0047e 4585c9                         test       r9d, r9d
00481 0f8ca1180000                   jl         0x7f1e7fe790a8
00487 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0048f 4585db                         test       r11d, r11d
00492 0f8c90180000                   jl         0x7f1e7fe790a8
00498 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
004a0 4503d9                         add        r11d, r9d
004a3 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
004a8 453bc3                         cmp        r8d, r11d
004ab 0f8277180000                   jb         0x7f1e7fe790a8
004b1 443b8424c0000000               cmp        r8d, dword ptr [rsp + 0xc0]
004b9 0f8269180000                   jb         0x7f1e7fe790a8
004bf 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
004c7 4585db                         test       r11d, r11d
004ca 0f84e5010000                   je         0x7f1e7fe77a35
004d0 4963d3                         movsxd     rdx, r11d
004d3 4883fa20                       cmp        rdx, 0x20
004d7 7725                           ja         0x7f1e7fe7787e
004d9 4d63d3                         movsxd     r10, r11d
004dc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004e3 c442a8f5db                     bzhi       r11, r11, r10
004e8 c4c1fb92fb                     kmovq      k7, r11
004ed 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004f3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004f9 e9b7010000                     jmp        0x7f1e7fe77a35
004fe c5f877                         vzeroupper 
00501 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
0050b 41ffd2                         call       r10
0050e 0f1f840000000000               nop        dword ptr [rax + rax]
00516 e99a010000                     jmp        0x7f1e7fe77a35
0051b 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
00523 0f837f140000                   jae        0x7f1e7fe78d28
00529 4963f9                         movsxd     rdi, r9d
0052c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00534 4d8b5c3a0c                     mov        r11, qword ptr [r10 + rdi + 0xc]
00539 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00541 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00549 0f8329150000                   jae        0x7f1e7fe78df8
0054f 8b8c24bc000000                 mov        ecx, dword ptr [rsp + 0xbc]
00556 8d5908                         lea        ebx, [rcx + 8]
00559 4c63d1                         movsxd     r10, ecx
0055c 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
00564 4e895c120c                     mov        qword ptr [rdx + r10 + 0xc], r11
00569 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00570 0f8d3f010000                   jge        0x7f1e7fe77a35
00576 492bfa                         sub        rdi, r10
00579 4c63db                         movsxd     r11, ebx
0057c 4d8d143b                       lea        r10, [r11 + rdi]
00580 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
00585 0f8316160000                   jae        0x7f1e7fe78f21
0058b 4d8bd0                         mov        r10, r8
0058e 4d2bd3                         sub        r10, r11
00591 4983c207                       add        r10, 7
00595 4983e2f8                       and        r10, 0xfffffffffffffff8
00599 458bda                         mov        r11d, r10d
0059c 458d540b08                     lea        r10d, [r11 + rcx + 8]
005a1 4d63d2                         movsxd     r10, r10d
005a4 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
005a9 4c3b5c2438                     cmp        r11, qword ptr [rsp + 0x38]
005ae 0f83ed150000                   jae        0x7f1e7fe78f21
005b4 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
005bb 0f83e0150000                   jae        0x7f1e7fe78f21
005c1 4983c2f8                       add        r10, -8
005c5 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
005ca 0f83d1150000                   jae        0x7f1e7fe78f21
005d0 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
005d8 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
005df 0f8f87160000                   jg         0x7f1e7fe78fec
005e5 442bc9                         sub        r9d, ecx
005e8 83c110                         add        ecx, 0x10
005eb 458d1c19                       lea        r11d, [r9 + rbx]
005ef 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
005f7 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
005fc 448bd3                         mov        r10d, ebx
005ff 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
00607 4e895c170c                     mov        qword ptr [rdi + r10 + 0xc], r11
0060c 83c308                         add        ebx, 8
0060f 3bd9                           cmp        ebx, ecx
00611 7cd8                           jl         0x7f1e7fe7796b
00613 4983c0f8                       add        r8, -8
00617 4981f800000080                 cmp        r8, -0x80000000
0061e 49c7c200000080                 mov        r10, 0xffffffff80000000
00625 4d0f4cc2                       cmovl      r8, r10
00629 458bd8                         mov        r11d, r8d
0062c 413bdb                         cmp        ebx, r11d
0062f 7d4e                           jge        0x7f1e7fe779ff
00631 0f1f840000000000               nop        dword ptr [rax + rax]
00639 0f1f8000000000                 nop        dword ptr [rax]
00640 458d1419                       lea        r10d, [r9 + rbx]
00644 448bc3                         mov        r8d, ebx
00647 4963c8                         movsxd     rcx, r8d
0064a 458bc2                         mov        r8d, r10d
0064d 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
00655 4a8b7c070c                     mov        rdi, qword ptr [rdi + r8 + 0xc]
0065a 4d63c2                         movsxd     r8, r10d
0065d 448bd3                         mov        r10d, ebx
00660 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
00668 4a897c120c                     mov        qword ptr [rdx + r10 + 0xc], rdi
0066d 4e8b540214                     mov        r10, qword ptr [rdx + r8 + 0x14]
00672 4c89540a14                     mov        qword ptr [rdx + rcx + 0x14], r10
00677 83c310                         add        ebx, 0x10
0067a 413bdb                         cmp        ebx, r11d
0067d 7cc1                           jl         0x7f1e7fe779c0
0067f 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
00686 7d2d                           jge        0x7f1e7fe77a35
00688 458d1419                       lea        r10d, [r9 + rbx]
0068c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00694 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
00699 448bdb                         mov        r11d, ebx
0069c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
006a4 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
006a9 83c308                         add        ebx, 8
006ac 3b9c24c0000000                 cmp        ebx, dword ptr [rsp + 0xc0]
006b3 7cd3                           jl         0x7f1e7fe77a08
006b5 8b9c24bc000000                 mov        ebx, dword ptr [rsp + 0xbc]
006bc 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
006c3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
006c8 41ffc3                         inc        r11d
006cb 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
006d0 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
006d4 418502                         test       dword ptr [r10], eax
006d7 448bb424b8000000               mov        r14d, dword ptr [rsp + 0xb8]
006df 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
006e7 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
006ec 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
006f1 452bde                         sub        r11d, r14d
006f4 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
006fc 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
00701 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00706 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0070b 0f8d09060000                   jge        0x7f1e7fe7809a
00711 443b442408                     cmp        r8d, dword ptr [rsp + 8]
00716 0f83390d0000                   jae        0x7f1e7fe787d5
0071c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00724 4f8b54c210                     mov        r10, qword ptr [r10 + r8*8 + 0x10]
00729 418bc2                         mov        eax, r10d
0072c 25ffff0100                     and        eax, 0x1ffff
00731 4d8bc2                         mov        r8, r10
00734 49c1e812                       shr        r8, 0x12
00738 49c1fa24                       sar        r10, 0x24
0073c 458bc8                         mov        r9d, r8d
0073f 458bd2                         mov        r10d, r10d
00742 418bca                         mov        ecx, r10d
00745 4181e1ffff0300                 and        r9d, 0x3ffff
0074c 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
00754 4585d2                         test       r10d, r10d
00757 0f8cd70f0000                   jl         0x7f1e7fe78ab4
0075d 85c0                           test       eax, eax
0075f 0f8543020000                   jne        0x7f1e7fe77d28
00765 4533d2                         xor        r10d, r10d
00768 418bc2                         mov        eax, r10d
0076b 448bd1                         mov        r10d, ecx
0076e 4183fa03                       cmp        r10d, 3
00772 0f8e54020000                   jle        0x7f1e7fe77d4c
00778 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00780 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
00784 45895a14                       mov        dword ptr [r10 + 0x14], r11d
00788 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0078c 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00794 45895310                       mov        dword ptr [r11 + 0x10], r10d
00798 448d51fd                       lea        r10d, [rcx - 3]
0079c 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
007a4 4589530c                       mov        dword ptr [r11 + 0xc], r10d
007a8 4863ac24b4000000               movsxd     rbp, dword ptr [rsp + 0xb4]
007b0 4c63d3                         movsxd     r10, ebx
007b3 4c03542468                     add        r10, qword ptr [rsp + 0x68]
007b8 4863d0                         movsxd     rdx, eax
007bb 4c03d2                         add        r10, rdx
007be 493bea                         cmp        rbp, r10
007c1 0f8ff50f0000                   jg         0x7f1e7fe78b3c
007c7 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
007cf 4585c0                         test       r8d, r8d
007d2 0f8e3c0f0000                   jle        0x7f1e7fe78a94
007d8 448d2c03                       lea        r13d, [rbx + rax]
007dc 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
007e4 4503d5                         add        r10d, r13d
007e7 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
007ec 0f8f72100000                   jg         0x7f1e7fe78be4
007f2 458d1406                       lea        r10d, [r14 + rax]
007f6 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
007fe 443b942480000000               cmp        r10d, dword ptr [rsp + 0x80]
00806 0f8ff4100000                   jg         0x7f1e7fe78c80
0080c 83f810                         cmp        eax, 0x10
0080f 0f8f8a050000                   jg         0x7f1e7fe7811f
00815 443bb424ac000000               cmp        r14d, dword ptr [rsp + 0xac]
0081d 0f83b10c0000                   jae        0x7f1e7fe78854
00823 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0082b c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
00832 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
00839 0f83450d0000                   jae        0x7f1e7fe78904
0083f 468d1c30                       lea        r11d, [rax + r14]
00843 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0084b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00853 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
0085a 448d1418                       lea        r10d, [rax + rbx]
0085e 44899424bc000000               mov        dword ptr [rsp + 0xbc], r10d
00866 448b8c24bc000000               mov        r9d, dword ptr [rsp + 0xbc]
0086e 442b8c24b4000000               sub        r9d, dword ptr [rsp + 0xb4]
00876 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
0087e 4183fa10                       cmp        r10d, 0x10
00882 0f8f99fbffff                   jg         0x7f1e7fe777a1
00888 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00890 4183fb10                       cmp        r11d, 0x10
00894 0f8c87fbffff                   jl         0x7f1e7fe777a1
0089a 443b8c2484000000               cmp        r9d, dword ptr [rsp + 0x84]
008a2 0f83cc0d0000                   jae        0x7f1e7fe789f4
008a8 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
008b0 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
008b7 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
008bf 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
008c7 0f8236fbffff                   jb         0x7f1e7fe77783
008cd bee4ffffff                     mov        esi, 0xffffffe4
008d2 488b2c24                       mov        rbp, qword ptr [rsp]
008d6 48894424f8                     mov        qword ptr [rsp - 8], rax
008db 8b442410                       mov        eax, dword ptr [rsp + 0x10]
008df 89442408                       mov        dword ptr [rsp + 8], eax
008e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008e8 48ff742420                     push       qword ptr [rsp + 0x20]
008ed 488f442418                     pop        qword ptr [rsp + 0x18]
008f2 48894424f8                     mov        qword ptr [rsp - 8], rax
008f7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008fb 8944240c                       mov        dword ptr [rsp + 0xc], eax
008ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00904 48894424f8                     mov        qword ptr [rsp - 8], rax
00909 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0090d 89442438                       mov        dword ptr [rsp + 0x38], eax
00911 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00916 48ff742468                     push       qword ptr [rsp + 0x68]
0091b 488f442440                     pop        qword ptr [rsp + 0x40]
00920 48894424f8                     mov        qword ptr [rsp - 8], rax
00925 8b442464                       mov        eax, dword ptr [rsp + 0x64]
00929 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0092d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00932 48ffb42488000000               push       qword ptr [rsp + 0x88]
0093a 488f442448                     pop        qword ptr [rsp + 0x48]
0093f 48894424f8                     mov        qword ptr [rsp - 8], rax
00944 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00948 89442458                       mov        dword ptr [rsp + 0x58], eax
0094c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00951 48894424f8                     mov        qword ptr [rsp - 8], rax
00956 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
0095d 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00961 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00966 48894424f8                     mov        qword ptr [rsp - 8], rax
0096b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0096f 89442460                       mov        dword ptr [rsp + 0x60], eax
00973 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00978 48894424f8                     mov        qword ptr [rsp - 8], rax
0097d 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
00984 89442474                       mov        dword ptr [rsp + 0x74], eax
00988 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0098d c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
00996 6690                           nop        
00998 c5f877                         vzeroupper 
0099b e84000b6ff                     call       0x7f1e7f9d7d60
009a0 0f1f8400980a0002               nop        dword ptr [rax + rax + 0x2000a98]
009a8 413bc3                         cmp        eax, r11d
009ab 0f8ebafdffff                   jle        0x7f1e7fe77aeb
009b1 be45ffffff                     mov        esi, 0xffffff45
009b6 8be8                           mov        ebp, eax
009b8 44891c24                       mov        dword ptr [rsp], r11d
009bc c5f877                         vzeroupper 
009bf e81c00b6ff                     call       0x7f1e7f9d7d60
009c4 0f1f8400bc0a0003               nop        dword ptr [rax + rax + 0x3000abc]
009cc 85c0                           test       eax, eax
009ce 7407                           je         0x7f1e7fe77d57
009d0 448d51ff                       lea        r10d, [rcx - 1]
009d4 418bca                         mov        ecx, r10d
009d7 85c9                           test       ecx, ecx
009d9 7479                           je         0x7f1e7fe77dd4
009db 83f903                         cmp        ecx, 3
009de 0f8470170000                   je         0x7f1e7fe794d4
009e4 83f902                         cmp        ecx, 2
009e7 0f871b180000                   ja         0x7f1e7fe79588
009ed 3b4c240c                       cmp        ecx, dword ptr [rsp + 0xc]
009f1 0f83d4150000                   jae        0x7f1e7fe7934b
009f7 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
009ff 458b448b0c                     mov        r8d, dword ptr [r11 + rcx*4 + 0xc]
00a04 85c9                           test       ecx, ecx
00a06 7e3e                           jle        0x7f1e7fe77dc6
00a08 448d51ff                       lea        r10d, [rcx - 1]
00a0c 443b54240c                     cmp        r10d, dword ptr [rsp + 0xc]
00a11 0f8381160000                   jae        0x7f1e7fe79418
00a17 660f1f840000000000             nop        word ptr [rax + rax]
00a20 4c8b9c24a0000000               mov        r11, qword ptr [rsp + 0xa0]
00a28 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
00a2d 4c8b8c24a0000000               mov        r9, qword ptr [rsp + 0xa0]
00a35 458954890c                     mov        dword ptr [r9 + rcx*4 + 0xc], r10d
00a3a 448d51ff                       lea        r10d, [rcx - 1]
00a3e 418bca                         mov        ecx, r10d
00a41 4585d2                         test       r10d, r10d
00a44 7fda                           jg         0x7f1e7fe77da0
00a46 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a4e 4589420c                       mov        dword ptr [r10 + 0xc], r8d
00a52 eb0c                           jmp        0x7f1e7fe77de0
00a54 4c8b9424a0000000               mov        r10, qword ptr [rsp + 0xa0]
00a5c 458b420c                       mov        r8d, dword ptr [r10 + 0xc]
00a60 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
00a68 e93bfdffff                     jmp        0x7f1e7fe77b28
00a6d 4183fa10                       cmp        r10d, 0x10
00a71 0f8dad1c0000                   jge        0x7f1e7fe79aa4
00a77 4183fa08                       cmp        r10d, 8
00a7b 0f8d61060000                   jge        0x7f1e7fe78462
00a81 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a89 4183fb10                       cmp        r11d, 0x10
00a8d 0f8eb3000000                   jle        0x7f1e7fe77ec6
00a93 4585c9                         test       r9d, r9d
00a96 0f8cbc1b0000                   jl         0x7f1e7fe799d8
00a9c 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00aa4 4585d2                         test       r10d, r10d
00aa7 0f8cab1b0000                   jl         0x7f1e7fe799d8
00aad 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00ab2 443b9c24bc000000               cmp        r11d, dword ptr [rsp + 0xbc]
00aba 0f82981b0000                   jb         0x7f1e7fe799d8
00ac0 448bac24b4000000               mov        r13d, dword ptr [rsp + 0xb4]
00ac8 4403ac24bc000000               add        r13d, dword ptr [rsp + 0xbc]
00ad0 453bdd                         cmp        r11d, r13d
00ad3 0f827f1b0000                   jb         0x7f1e7fe799d8
00ad9 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00ae1 4585db                         test       r11d, r11d
00ae4 0f8c6e1b0000                   jl         0x7f1e7fe799d8
00aea 4585db                         test       r11d, r11d
00aed 0f8458f8ffff                   je         0x7f1e7fe776cb
00af3 4883fd20                       cmp        rbp, 0x20
00af7 772d                           ja         0x7f1e7fe77ea6
00af9 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00b01 4d63d2                         movsxd     r10, r10d
00b04 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b0b c442a8f5db                     bzhi       r11, r11, r10
00b10 c4c1fb92fb                     kmovq      k7, r11
00b15 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b1b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b21 e925f8ffff                     jmp        0x7f1e7fe776cb
00b26 488bd5                         mov        rdx, rbp
00b29 c5f877                         vzeroupper 
00b2c 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00b36 41ffd2                         call       r10
00b39 0f1f840000000000               nop        dword ptr [rax + rax]
00b41 e905f8ffff                     jmp        0x7f1e7fe776cb
00b46 443b4c2418                     cmp        r9d, dword ptr [rsp + 0x18]
00b4b 0f836b170000                   jae        0x7f1e7fe7963c
00b51 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00b59 430fbe6c0a0c                   movsx      ebp, byte ptr [r10 + r9 + 0xc]
00b5f 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
00b67 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00b6c 0f831a180000                   jae        0x7f1e7fe7970c
00b72 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00b7a 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00b82 43886c130c                     mov        byte ptr [r11 + r10 + 0xc], bpl
00b87 458d5103                       lea        r10d, [r9 + 3]
00b8b 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
00b93 41ffc0                         inc        r8d
00b96 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b9b 0f8397180000                   jae        0x7f1e7fe797b8
00ba1 4d63d9                         movsxd     r11, r9d
00ba4 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bac 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00bb2 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
00bba 4183c203                       add        r10d, 3
00bbe 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00bc3 0f8333190000                   jae        0x7f1e7fe7987c
00bc9 4c638424bc000000               movsxd     r8, dword ptr [rsp + 0xbc]
00bd1 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00bd9 43886c020d                     mov        byte ptr [r10 + r8 + 0xd], bpl
00bde 470fbe541a0e                   movsx      r10d, byte ptr [r10 + r11 + 0xe]
00be4 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00bec 468854010e                     mov        byte ptr [rcx + r8 + 0xe], r10b
00bf1 460fbe5c190f                   movsx      r11d, byte ptr [rcx + r11 + 0xf]
00bf7 46885c010f                     mov        byte ptr [rcx + r8 + 0xf], r11b
00bfc 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00c04 4183fb08                       cmp        r11d, 8
00c08 0f83a2190000                   jae        0x7f1e7fe79930
00c0e 49bbc8df2fe300000000           movabs     r11, 0xe32fdfc8
00c18 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00c20 47034c930c                     add        r9d, dword ptr [r11 + r10*4 + 0xc]
00c25 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c2a 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00c32 4183fb04                       cmp        r11d, 4
00c36 7e44                           jle        0x7f1e7fe77ffc
00c38 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00c3f 83c504                         add        ebp, 4
00c42 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c4a 418bd1                         mov        edx, r9d
00c4d 666690                         nop        
00c50 c5f877                         vzeroupper 
00c53 e88888a9ff                     call       0x7f1e7f910860
00c58 0f1f8400500d0004               nop        dword ptr [rax + rax + 0x4000d50]
00c60 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00c68 8bd5                           mov        edx, ebp
00c6a 8bc8                           mov        ecx, eax
00c6c c5f877                         vzeroupper 
00c6f e86c88a9ff                     call       0x7f1e7f910860
00c74 0f1f84006c0d0005               nop        dword ptr [rax + rax + 0x5000d6c]
00c7c 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00c84 4183fa08                       cmp        r10d, 8
00c88 7e62                           jle        0x7f1e7fe7806c
00c8a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
00c8e 49baf8df2fe300000000           movabs     r10, 0xe32fdff8
00c98 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00ca0 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00ca5 8bac24bc000000                 mov        ebp, dword ptr [rsp + 0xbc]
00cac 83c508                         add        ebp, 8
00caf 83c208                         add        edx, 8
00cb2 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cba 6690                           nop        
00cbc c5f877                         vzeroupper 
00cbf e81c88a9ff                     call       0x7f1e7f910860
00cc4 0f1f8400bc0d0006               nop        dword ptr [rax + rax + 0x6000dbc]
00ccc 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00cd4 8bd5                           mov        edx, ebp
00cd6 488bc8                         mov        rcx, rax
00cd9 666690                         nop        
00cdc c5f877                         vzeroupper 
00cdf e8fc87a9ff                     call       0x7f1e7f910860
00ce4 0f1f8400dc0d0007               nop        dword ptr [rax + rax + 0x7000ddc]
00cec 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00cf3 e9cbf9ffff                     jmp        0x7f1e7fe77a43
00cf8 4d63d3                         movsxd     r10, r11d
00cfb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d02 c442a8f5db                     bzhi       r11, r11, r10
00d07 c4c1fb92fb                     kmovq      k7, r11
00d0c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d12 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d18 eb67                           jmp        0x7f1e7fe78101
00d1a 4585f6                         test       r14d, r14d
00d1d 0f8c3d1b0000                   jl         0x7f1e7fe79be0
00d23 85db                           test       ebx, ebx
00d25 0f8c351b0000                   jl         0x7f1e7fe79be0
00d2b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00d30 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
00d35 0f82251b0000                   jb         0x7f1e7fe79be0
00d3b 428d2c1b                       lea        ebp, [rbx + r11]
00d3f 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d44 443bc5                         cmp        r8d, ebp
00d47 0f82131b0000                   jb         0x7f1e7fe79be0
00d4d 4585db                         test       r11d, r11d
00d50 0f8c0a1b0000                   jl         0x7f1e7fe79be0
00d56 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d5b 453bd6                         cmp        r10d, r14d
00d5e 7421                           je         0x7f1e7fe78101
00d60 4963d3                         movsxd     rdx, r11d
00d63 4883fa20                       cmp        rdx, 0x20
00d67 768f                           jbe        0x7f1e7fe78078
00d69 c5f877                         vzeroupper 
00d6c 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00d76 41ffd2                         call       r10
00d79 0f1f840000000000               nop        dword ptr [rax + rax]
00d81 4c8b1424                       mov        r10, qword ptr [rsp]
00d85 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00d89 c5f877                         vzeroupper 
00d8c 4881c4f0000000                 add        rsp, 0xf0
00d93 5d                             pop        rbp
00d94 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d98 0f87f2210000                   ja         0x7f1e7fe7a310
00d9e c3                             ret        
00d9f 83f830                         cmp        eax, 0x30
00da2 0f8e83000000                   jle        0x7f1e7fe781ab
00da8 4585f6                         test       r14d, r14d
00dab 0f8c671f0000                   jl         0x7f1e7fe7a098
00db1 85db                           test       ebx, ebx
00db3 0f8c5f1f0000                   jl         0x7f1e7fe7a098
00db9 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00dbe 443b9c24b8000000               cmp        r11d, dword ptr [rsp + 0xb8]
00dc6 0f824c1f0000                   jb         0x7f1e7fe7a098
00dcc 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00dd1 453bd5                         cmp        r10d, r13d
00dd4 0f823e1f0000                   jb         0x7f1e7fe7a098
00dda 85c0                           test       eax, eax
00ddc 7426                           je         0x7f1e7fe78184
00dde 4883fa20                       cmp        rdx, 0x20
00de2 772d                           ja         0x7f1e7fe78191
00de4 4c63d0                         movsxd     r10, eax
00de7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00dee c442a8f5db                     bzhi       r11, r11, r10
00df3 c4c1fb92fb                     kmovq      k7, r11
00df8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00dfe 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e04 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
00e0c e955faffff                     jmp        0x7f1e7fe77be6
00e11 c5f877                         vzeroupper 
00e14 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00e1e 41ffd2                         call       r10
00e21 0f1f840000000000               nop        dword ptr [rax + rax]
00e29 ebd9                           jmp        0x7f1e7fe78184
00e2b 443bb424ac000000               cmp        r14d, dword ptr [rsp + 0xac]
00e33 0f831b1d0000                   jae        0x7f1e7fe79ed4
00e39 4d63c6                         movsxd     r8, r14d
00e3c 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00e44 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00e4b 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
00e52 0f83d01d0000                   jae        0x7f1e7fe79fa8
00e58 8d5310                         lea        edx, [rbx + 0x10]
00e5b 4c63db                         movsxd     r11, ebx
00e5e 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00e66 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00e6d 413bd5                         cmp        edx, r13d
00e70 0f8d53020000                   jge        0x7f1e7fe78449
00e76 4d2bc3                         sub        r8, r11
00e79 4c63d2                         movsxd     r10, edx
00e7c 48634c241c                     movsxd     rcx, dword ptr [rsp + 0x1c]
00e81 4883c1f1                       add        rcx, -0xf
00e85 4f8d1c02                       lea        r11, [r10 + r8]
00e89 4c3bd9                         cmp        r11, rcx
00e8c 0f835e1f0000                   jae        0x7f1e7fe7a170
00e92 4d63cd                         movsxd     r9, r13d
00e95 4d8bd9                         mov        r11, r9
00e98 4d2bda                         sub        r11, r10
00e9b 4983c30f                       add        r11, 0xf
00e9f 4983e3f0                       and        r11, 0xfffffffffffffff0
00ea3 458bdb                         mov        r11d, r11d
00ea6 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00eab 4d63da                         movsxd     r11, r10d
00eae 4f8d5403f0                     lea        r10, [r11 + r8 - 0x10]
00eb3 4c3bd1                         cmp        r10, rcx
00eb6 0f83341f0000                   jae        0x7f1e7fe7a170
00ebc 3b942484000000                 cmp        edx, dword ptr [rsp + 0x84]
00ec3 0f83271f0000                   jae        0x7f1e7fe7a170
00ec9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00ece 4983c2f1                       add        r10, -0xf
00ed2 4983c3f0                       add        r11, -0x10
00ed6 4d3bda                         cmp        r11, r10
00ed9 0f83111f0000                   jae        0x7f1e7fe7a170
00edf 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00ee6 0f8fb81f0000                   jg         0x7f1e7fe7a224
00eec 458bde                         mov        r11d, r14d
00eef 442bdb                         sub        r11d, ebx
00ef2 83c320                         add        ebx, 0x20
00ef5 666690                         nop        
00ef8 448bd2                         mov        r10d, edx
00efb 458d0413                       lea        r8d, [r11 + rdx]
00eff 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00f07 c4a17a6f44010c                 vmovdqu    xmm0, xmmword ptr [rcx + r8 + 0xc]
00f0e 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00f16 c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
00f1d 448d5210                       lea        r10d, [rdx + 0x10]
00f21 418bd2                         mov        edx, r10d
00f24 443bd3                         cmp        r10d, ebx
00f27 7ccf                           jl         0x7f1e7fe78278
00f29 4981c110ffffff                 add        r9, -0xf0
00f30 4981f900000080                 cmp        r9, -0x80000000
00f37 49c7c200000080                 mov        r10, 0xffffffff80000000
00f3e 4d0f4cca                       cmovl      r9, r10
00f42 458bc9                         mov        r9d, r9d
00f45 448bd2                         mov        r10d, edx
00f48 453bd1                         cmp        r10d, r9d
00f4b 0f8d44010000                   jge        0x7f1e7fe78415
00f51 418bd2                         mov        edx, r10d
00f54 660f1f440000                   nop        word ptr [rax + rax]
00f5a 660f1f440000                   nop        word ptr [rax + rax]
00f60 448bd2                         mov        r10d, edx
00f63 4d63d2                         movsxd     r10, r10d
00f66 448bc2                         mov        r8d, edx
00f69 418d1c13                       lea        ebx, [r11 + rdx]
00f6d 8bcb                           mov        ecx, ebx
00f6f 488bbc2490000000               mov        rdi, qword ptr [rsp + 0x90]
00f77 c5fa6f441f0c                   vmovdqu    xmm0, xmmword ptr [rdi + rbx + 0xc]
00f7d 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
00f85 c4a17a7f44030c                 vmovdqu    xmmword ptr [rbx + r8 + 0xc], xmm0
00f8c 4863c9                         movsxd     rcx, ecx
00f8f c5fa6f440f1c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x1c]
00f95 c4a17a7f44131c                 vmovdqu    xmmword ptr [rbx + r10 + 0x1c], xmm0
00f9c c5fa6f440f2c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x2c]
00fa2 c4a17a7f44132c                 vmovdqu    xmmword ptr [rbx + r10 + 0x2c], xmm0
00fa9 c5fa6f440f3c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x3c]
00faf c4a17a7f44133c                 vmovdqu    xmmword ptr [rbx + r10 + 0x3c], xmm0
00fb6 c5fa6f440f4c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x4c]
00fbc c4a17a7f44134c                 vmovdqu    xmmword ptr [rbx + r10 + 0x4c], xmm0
00fc3 c5fa6f440f5c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x5c]
00fc9 c4a17a7f44135c                 vmovdqu    xmmword ptr [rbx + r10 + 0x5c], xmm0
00fd0 c5fa6f440f6c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x6c]
00fd6 c4a17a7f44136c                 vmovdqu    xmmword ptr [rbx + r10 + 0x6c], xmm0
00fdd c5fa6f440f7c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x7c]
00fe3 c4a17a7f44137c                 vmovdqu    xmmword ptr [rbx + r10 + 0x7c], xmm0
00fea c5fa6f840f8c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x8c]
00ff3 c4a17a7f84138c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x8c], xmm0
00ffd c5fa6f840f9c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x9c]
01006 c4a17a7f84139c000000           vmovdqu    xmmword ptr [rbx + r10 + 0x9c], xmm0
01010 c5fa6f840fac000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xac]
01019 c4a17a7f8413ac000000           vmovdqu    xmmword ptr [rbx + r10 + 0xac], xmm0
01023 c5fa6f840fbc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xbc]
0102c c4a17a7f8413bc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xbc], xmm0
01036 c5fa6f840fcc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xcc]
0103f c4a17a7f8413cc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xcc], xmm0
01049 c5fa6f840fdc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xdc]
01052 c4a17a7f8413dc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xdc], xmm0
0105c c5fa6f840fec000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xec]
01065 c4a17a7f8413ec000000           vmovdqu    xmmword ptr [rbx + r10 + 0xec], xmm0
0106f c5fa6f840ffc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xfc]
01078 c4a17a7f8413fc000000           vmovdqu    xmmword ptr [rbx + r10 + 0xfc], xmm0
01082 448d9200010000                 lea        r10d, [rdx + 0x100]
01089 418bd2                         mov        edx, r10d
0108c 453bd1                         cmp        r10d, r9d
0108f 0f8ccbfeffff                   jl         0x7f1e7fe782e0
01095 413bd5                         cmp        edx, r13d
01098 7d2f                           jge        0x7f1e7fe78449
0109a 6690                           nop        
0109c 458d1413                       lea        r10d, [r11 + rdx]
010a0 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
010a8 c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
010af 448bc2                         mov        r8d, edx
010b2 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
010ba c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
010c1 83c210                         add        edx, 0x10
010c4 413bd5                         cmp        edx, r13d
010c7 7cd3                           jl         0x7f1e7fe7841c
010c9 468d1430                       lea        r10d, [rax + r14]
010cd 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
010d5 4489ac24bc000000               mov        dword ptr [rsp + 0xbc], r13d
010dd e984f7ffff                     jmp        0x7f1e7fe77be6
010e2 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
010ea 0f8398170000                   jae        0x7f1e7fe79c08
010f0 4963f9                         movsxd     rdi, r9d
010f3 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
010fb 4d8b543a0c                     mov        r10, qword ptr [r10 + rdi + 0xc]
01100 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
01108 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
01110 0f8332180000                   jae        0x7f1e7fe79cc8
01116 418d4b08                       lea        ecx, [r11 + 8]
0111a 4963db                         movsxd     rbx, r11d
0111d 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
01125 4c89541a0c                     mov        qword ptr [rdx + rbx + 0xc], r10
0112a 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
01131 0f8d12030000                   jge        0x7f1e7fe787c9
01137 482bfb                         sub        rdi, rbx
0113a 4863d1                         movsxd     rdx, ecx
0113d 4c8d143a                       lea        r10, [rdx + rdi]
01141 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
01146 0f83c4180000                   jae        0x7f1e7fe79d90
0114c 4d8bd0                         mov        r10, r8
0114f 4c2bd2                         sub        r10, rdx
01152 4983c207                       add        r10, 7
01156 4983e2f8                       and        r10, 0xfffffffffffffff8
0115a 458bd2                         mov        r10d, r10d
0115d 438d5c1a08                     lea        ebx, [r10 + r11 + 8]
01162 4c63d3                         movsxd     r10, ebx
01165 498d5c3af8                     lea        rbx, [r10 + rdi - 8]
0116a 483b5c2438                     cmp        rbx, qword ptr [rsp + 0x38]
0116f 0f839b180000                   jae        0x7f1e7fe79d90
01175 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
0117c 0f838e180000                   jae        0x7f1e7fe79d90
01182 4983c2f8                       add        r10, -8
01186 4c3b542438                     cmp        r10, qword ptr [rsp + 0x38]
0118b 0f837f180000                   jae        0x7f1e7fe79d90
01191 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01198 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
0119e 0f8f18190000                   jg         0x7f1e7fe79e3c
011a4 452bcb                         sub        r9d, r11d
011a7 b8f4ffffff                     mov        eax, 0xfffffff4
011ac 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
011b4 498bf2                         mov        rsi, r10
011b7 4d8d50c8                       lea        r10, [r8 - 0x38]
011bb 4981fa00000080                 cmp        r10, -0x80000000
011c2 48c7c300000080                 mov        rbx, 0xffffffff80000000
011c9 4c0f4cd3                       cmovl      r10, rbx
011cd 418bfa                         mov        edi, r10d
011d0 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
011d8 458bd2                         mov        r10d, r10d
011db 412bc2                         sub        eax, r10d
011de 412bc3                         sub        eax, r11d
011e1 4183c310                       add        r11d, 0x10
011e5 418bdb                         mov        ebx, r11d
011e8 83c0f0                         add        eax, -0x10
011eb 4d63d3                         movsxd     r10, r11d
011ee 41bb06000000                   mov        r11d, 6
011f4 c462a0f5d8                     bzhi       r11, rax, r11
011f9 4d03d3                         add        r10, r11
011fc 4d3bd0                         cmp        r10, r8
011ff 498bc0                         mov        rax, r8
01202 490f4cc2                       cmovl      rax, r10
01206 4c8bd0                         mov        r10, rax
01209 4c2bd2                         sub        r10, rdx
0120c 4d8d5aff                       lea        r11, [r10 - 1]
01210 49c1fb3f                       sar        r11, 0x3f
01214 49c1eb3d                       shr        r11, 0x3d
01218 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
0121d 4983e2f8                       and        r10, 0xfffffffffffffff8
01221 4c03d2                         add        r10, rdx
01224 493bd2                         cmp        rdx, r10
01227 490f4cd2                       cmovl      rdx, r10
0122b 448bd2                         mov        r10d, edx
0122e 418d5208                       lea        edx, [r10 + 8]
01232 442b9424b4000000               sub        r10d, dword ptr [rsp + 0xb4]
0123a 4863ea                         movsxd     rbp, edx
0123d 4803ee                         add        rbp, rsi
01240 4183c208                       add        r10d, 8
01244 4963d2                         movsxd     rdx, r10d
01247 4803d6                         add        rdx, rsi
0124a 4c8d5d4c                       lea        r11, [rbp + 0x4c]
0124e 4883c50c                       add        rbp, 0xc
01252 488d720c                       lea        rsi, [rdx + 0xc]
01256 4533d2                         xor        r10d, r10d
01259 4c3bde                         cmp        r11, rsi
0125c 410f96c2                       setbe      r10b
01260 4883c24c                       add        rdx, 0x4c
01264 4533db                         xor        r11d, r11d
01267 483bd5                         cmp        rdx, rbp
0126a 410f96c3                       setbe      r11b
0126e 450bd3                         or         r10d, r11d
01271 0f84490c0000                   je         0x7f1e7fe79240
01277 448bd8                         mov        r11d, eax
0127a 6690                           nop        
0127c 418d1c09                       lea        ebx, [r9 + rcx]
01280 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01288 4d8b541a0c                     mov        r10, qword ptr [r10 + rbx + 0xc]
0128d 8bd1                           mov        edx, ecx
0128f 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
01297 4c8954130c                     mov        qword ptr [rbx + rdx + 0xc], r10
0129c 83c108                         add        ecx, 8
0129f 413bcb                         cmp        ecx, r11d
012a2 7cd8                           jl         0x7f1e7fe785fc
012a4 4981c008feffff                 add        r8, -0x1f8
012ab 4981f800000080                 cmp        r8, -0x80000000
012b2 49c7c200000080                 mov        r10, 0xffffffff80000000
012b9 4d0f4cc2                       cmovl      r8, r10
012bd 418bd0                         mov        edx, r8d
012c0 3bca                           cmp        ecx, edx
012c2 0f8d48010000                   jge        0x7f1e7fe78790
012c8 0f1f840000000000               nop        dword ptr [rax + rax]
012d0 458d1c09                       lea        r11d, [r9 + rcx]
012d4 8d9900010000                   lea        ebx, [rcx + 0x100]
012da 4103d9                         add        ebx, r9d
012dd 458bd3                         mov        r10d, r11d
012e0 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
012e8 62917e486f84100c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc]
012f3 4963f3                         movsxd     rsi, r11d
012f6 448bd3                         mov        r10d, ebx
012f9 4863db                         movsxd     rbx, ebx
012fc 448bc1                         mov        r8d, ecx
012ff 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01307 62917e487f84030c000000         vmovdqu32  zmmword ptr [r11 + r8 + 0xc], zmm0
01312 62d17e486f84334c000000         vmovdqu32  zmm0, zmmword ptr [r11 + rsi + 0x4c]
0131d 448bd9                         mov        r11d, ecx
01320 4963eb                         movsxd     rbp, r11d
01323 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0132b 62d17e487f842b4c000000         vmovdqu32  zmmword ptr [r11 + rbp + 0x4c], zmm0
01336 8d8180000000                   lea        eax, [rcx + 0x80]
0133c 4103c1                         add        eax, r9d
0133f 448bc0                         mov        r8d, eax
01342 62d17e486f84030c000000         vmovdqu32  zmm0, zmmword ptr [r11 + rax + 0xc]
0134d 62d17e487f842b8c000000         vmovdqu32  zmmword ptr [r11 + rbp + 0x8c], zmm0
01358 4d63d8                         movsxd     r11, r8d
0135b 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01363 62917e486f84184c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 0x4c]
0136e 62d17e487f8428cc000000         vmovdqu32  zmmword ptr [r8 + rbp + 0xcc], zmm0
01379 62917e486f84100c000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 0xc]
01384 62d17e487f84280c010000         vmovdqu32  zmmword ptr [r8 + rbp + 0x10c], zmm0
0138f 62d17e486f84184c000000         vmovdqu32  zmm0, zmmword ptr [r8 + rbx + 0x4c]
0139a 62d17e487f84284c010000         vmovdqu32  zmmword ptr [r8 + rbp + 0x14c], zmm0
013a5 62d17e486f84308c010000         vmovdqu32  zmm0, zmmword ptr [r8 + rsi + 0x18c]
013b0 62d17e487f84288c010000         vmovdqu32  zmmword ptr [r8 + rbp + 0x18c], zmm0
013bb 62d17e486f8430cc010000         vmovdqu32  zmm0, zmmword ptr [r8 + rsi + 0x1cc]
013c6 62d17e487f8428cc010000         vmovdqu32  zmmword ptr [r8 + rbp + 0x1cc], zmm0
013d1 81c100020000                   add        ecx, 0x200
013d7 3bca                           cmp        ecx, edx
013d9 0f8cf1feffff                   jl         0x7f1e7fe78650
013df 3bcf                           cmp        ecx, edi
013e1 7d2d                           jge        0x7f1e7fe78790
013e3 90                             nop        
013e4 458d1409                       lea        r10d, [r9 + rcx]
013e8 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
013f0 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
013fb 448bd1                         mov        r10d, ecx
013fe 62917e487f84130c000000         vmovdqu32  zmmword ptr [r11 + r10 + 0xc], zmm0
01409 83c140                         add        ecx, 0x40
0140c 3bcf                           cmp        ecx, edi
0140e 7cd4                           jl         0x7f1e7fe78764
01410 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
01417 7d30                           jge        0x7f1e7fe787c9
01419 666690                         nop        
0141c 458d1409                       lea        r10d, [r9 + rcx]
01420 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01428 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
0142d 448bd9                         mov        r11d, ecx
01430 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01438 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
0143d 83c108                         add        ecx, 8
01440 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
01447 7cd3                           jl         0x7f1e7fe7879c
01449 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01450 e96ef2ffff                     jmp        0x7f1e7fe77a43
01455 bee4ffffff                     mov        esi, 0xffffffe4
0145a 488b2c24                       mov        rbp, qword ptr [rsp]
0145e 48894424f8                     mov        qword ptr [rsp - 8], rax
01463 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01467 89442408                       mov        dword ptr [rsp + 8], eax
0146b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01470 48ff742420                     push       qword ptr [rsp + 0x20]
01475 488f442418                     pop        qword ptr [rsp + 0x18]
0147a 48894424f8                     mov        qword ptr [rsp - 8], rax
0147f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01483 8944240c                       mov        dword ptr [rsp + 0xc], eax
01487 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148c 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01490 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01495 48894424f8                     mov        qword ptr [rsp - 8], rax
0149a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0149e 89442438                       mov        dword ptr [rsp + 0x38], eax
014a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a7 48ff742468                     push       qword ptr [rsp + 0x68]
014ac 488f442440                     pop        qword ptr [rsp + 0x40]
014b1 48894424f8                     mov        qword ptr [rsp - 8], rax
014b6 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014ba 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c3 90                             nop        
014c4 c5f877                         vzeroupper 
014c7 e814f5b5ff                     call       0x7f1e7f9d7d60
014cc 0f1f8400c4150008               nop        dword ptr [rax + rax + 0x80015c4]
014d4 bee4ffffff                     mov        esi, 0xffffffe4
014d9 488b2c24                       mov        rbp, qword ptr [rsp]
014dd 48894424f8                     mov        qword ptr [rsp - 8], rax
014e2 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014e6 89442408                       mov        dword ptr [rsp + 8], eax
014ea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014ef 48ff742420                     push       qword ptr [rsp + 0x20]
014f4 488f442418                     pop        qword ptr [rsp + 0x18]
014f9 48894424f8                     mov        qword ptr [rsp - 8], rax
014fe 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01502 8944240c                       mov        dword ptr [rsp + 0xc], eax
01506 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0150f 48894424f8                     mov        qword ptr [rsp - 8], rax
01514 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01518 89442438                       mov        dword ptr [rsp + 0x38], eax
0151c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01521 48ff742468                     push       qword ptr [rsp + 0x68]
01526 488f442440                     pop        qword ptr [rsp + 0x40]
0152b 48894424f8                     mov        qword ptr [rsp - 8], rax
01530 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01534 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01538 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0153d 48ff742478                     push       qword ptr [rsp + 0x78]
01542 488f442450                     pop        qword ptr [rsp + 0x50]
01547 48894424f8                     mov        qword ptr [rsp - 8], rax
0154c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01550 89442458                       mov        dword ptr [rsp + 0x58], eax
01554 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01559 48894424f8                     mov        qword ptr [rsp - 8], rax
0155e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01562 89442460                       mov        dword ptr [rsp + 0x60], eax
01566 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0156b 89442464                       mov        dword ptr [rsp + 0x64], eax
0156f 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01574 c5f877                         vzeroupper 
01577 e864f4b5ff                     call       0x7f1e7f9d7d60
0157c 0f1f840074160009               nop        dword ptr [rax + rax + 0x9001674]
01584 bee4ffffff                     mov        esi, 0xffffffe4
01589 488b2c24                       mov        rbp, qword ptr [rsp]
0158d 48894424f8                     mov        qword ptr [rsp - 8], rax
01592 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01596 89442408                       mov        dword ptr [rsp + 8], eax
0159a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0159f 48ff742420                     push       qword ptr [rsp + 0x20]
015a4 488f442418                     pop        qword ptr [rsp + 0x18]
015a9 48894424f8                     mov        qword ptr [rsp - 8], rax
015ae 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015b2 8944240c                       mov        dword ptr [rsp + 0xc], eax
015b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015bb 4489742434                     mov        dword ptr [rsp + 0x34], r14d
015c0 48894424f8                     mov        qword ptr [rsp - 8], rax
015c5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
015c9 89442438                       mov        dword ptr [rsp + 0x38], eax
015cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015d2 48ff742468                     push       qword ptr [rsp + 0x68]
015d7 488f442440                     pop        qword ptr [rsp + 0x40]
015dc 48894424f8                     mov        qword ptr [rsp - 8], rax
015e1 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015e5 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015e9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ee 48ffb42488000000               push       qword ptr [rsp + 0x88]
015f6 488f442448                     pop        qword ptr [rsp + 0x48]
015fb 48ff742478                     push       qword ptr [rsp + 0x78]
01600 488f442450                     pop        qword ptr [rsp + 0x50]
01605 48894424f8                     mov        qword ptr [rsp - 8], rax
0160a 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0160e 89442458                       mov        dword ptr [rsp + 0x58], eax
01612 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01617 48894424f8                     mov        qword ptr [rsp - 8], rax
0161c 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01623 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01627 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0162c 48894424f8                     mov        qword ptr [rsp - 8], rax
01631 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01635 89442460                       mov        dword ptr [rsp + 0x60], eax
01639 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0163e 89442464                       mov        dword ptr [rsp + 0x64], eax
01642 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01646 48894424f8                     mov        qword ptr [rsp - 8], rax
0164b 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
01652 8944247c                       mov        dword ptr [rsp + 0x7c], eax
01656 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01664 c5f877                         vzeroupper 
01667 e874f3b5ff                     call       0x7f1e7f9d7d60
0166c 0f1f84006417000a               nop        dword ptr [rax + rax + 0xa001764]
01674 bee4ffffff                     mov        esi, 0xffffffe4
01679 488b2c24                       mov        rbp, qword ptr [rsp]
0167d 48894424f8                     mov        qword ptr [rsp - 8], rax
01682 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01686 89442408                       mov        dword ptr [rsp + 8], eax
0168a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0168f 48ff742420                     push       qword ptr [rsp + 0x20]
01694 488f442418                     pop        qword ptr [rsp + 0x18]
01699 48894424f8                     mov        qword ptr [rsp - 8], rax
0169e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
016a2 8944240c                       mov        dword ptr [rsp + 0xc], eax
016a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016ab 48894424f8                     mov        qword ptr [rsp - 8], rax
016b0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
016b4 89442438                       mov        dword ptr [rsp + 0x38], eax
016b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016bd 48ff742468                     push       qword ptr [rsp + 0x68]
016c2 488f442440                     pop        qword ptr [rsp + 0x40]
016c7 48894424f8                     mov        qword ptr [rsp - 8], rax
016cc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
016d0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
016d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d9 48894424f8                     mov        qword ptr [rsp - 8], rax
016de 8b442474                       mov        eax, dword ptr [rsp + 0x74]
016e2 89442458                       mov        dword ptr [rsp + 0x58], eax
016e6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016eb 48894424f8                     mov        qword ptr [rsp - 8], rax
016f0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
016f4 89442460                       mov        dword ptr [rsp + 0x60], eax
016f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016fd 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01702 6690                           nop        
01704 c5f877                         vzeroupper 
01707 e8d4f2b5ff                     call       0x7f1e7f9d7d60
0170c 0f1f84000418000b               nop        dword ptr [rax + rax + 0xb001804]
01714 be45ffffff                     mov        esi, 0xffffff45
01719 488b2c24                       mov        rbp, qword ptr [rsp]
0171d 4c89542408                     mov        qword ptr [rsp + 8], r10
01722 6690                           nop        
01724 c5f877                         vzeroupper 
01727 e8b4f2b5ff                     call       0x7f1e7f9d7d60
0172c 0f1f84002418000c               nop        dword ptr [rax + rax + 0xc001824]
01734 be45ffffff                     mov        esi, 0xffffff45
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
0176b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0176f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01774 48894424f8                     mov        qword ptr [rsp - 8], rax
01779 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0177d 89442438                       mov        dword ptr [rsp + 0x38], eax
01781 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01786 48ff742468                     push       qword ptr [rsp + 0x68]
0178b 488f442440                     pop        qword ptr [rsp + 0x40]
01790 48894424f8                     mov        qword ptr [rsp - 8], rax
01795 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01799 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0179d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017a2 89442464                       mov        dword ptr [rsp + 0x64], eax
017a6 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
017ab 90                             nop        
017ac c5f877                         vzeroupper 
017af e82cf2b5ff                     call       0x7f1e7f9d7d60
017b4 0f1f8400ac18000d               nop        dword ptr [rax + rax + 0xd0018ac]
017bc 493bea                         cmp        rbp, r10
017bf bdffffffff                     mov        ebp, 0xffffffff
017c4 7c08                           jl         0x7f1e7fe78b4e
017c6 400f95c5                       setne      bpl
017ca 400fb6ed                       movzx      ebp, bpl
017ce be45ffffff                     mov        esi, 0xffffff45
017d3 48894424f8                     mov        qword ptr [rsp - 8], rax
017d8 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017dc 89442414                       mov        dword ptr [rsp + 0x14], eax
017e0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e5 895c2438                       mov        dword ptr [rsp + 0x38], ebx
017e9 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
017ee 48894424f8                     mov        qword ptr [rsp - 8], rax
017f3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
017f7 89442440                       mov        dword ptr [rsp + 0x40], eax
017fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01800 48ff742468                     push       qword ptr [rsp + 0x68]
01805 488f442448                     pop        qword ptr [rsp + 0x48]
0180a 48894424f8                     mov        qword ptr [rsp - 8], rax
0180f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01813 89442444                       mov        dword ptr [rsp + 0x44], eax
01817 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181c 48ff742478                     push       qword ptr [rsp + 0x78]
01821 488f442458                     pop        qword ptr [rsp + 0x58]
01826 48894424f8                     mov        qword ptr [rsp - 8], rax
0182b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0182f 89442460                       mov        dword ptr [rsp + 0x60], eax
01833 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01838 48894424f8                     mov        qword ptr [rsp - 8], rax
0183d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01841 89442468                       mov        dword ptr [rsp + 0x68], eax
01845 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0184a 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0184e 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01853 90                             nop        
01854 c5f877                         vzeroupper 
01857 e884f1b5ff                     call       0x7f1e7f9d7d60
0185c 0f1f84005419000e               nop        dword ptr [rax + rax + 0xe001954]
01864 be45ffffff                     mov        esi, 0xffffff45
01869 488b2c24                       mov        rbp, qword ptr [rsp]
0186d 48894424f8                     mov        qword ptr [rsp - 8], rax
01872 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01876 89442408                       mov        dword ptr [rsp + 8], eax
0187a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187f 48ff742420                     push       qword ptr [rsp + 0x20]
01884 488f442418                     pop        qword ptr [rsp + 0x18]
01889 48894424f8                     mov        qword ptr [rsp - 8], rax
0188e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01892 8944240c                       mov        dword ptr [rsp + 0xc], eax
01896 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0189f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
018a4 48894424f8                     mov        qword ptr [rsp - 8], rax
018a9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
018ad 89442438                       mov        dword ptr [rsp + 0x38], eax
018b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018b6 48ff742468                     push       qword ptr [rsp + 0x68]
018bb 488f442440                     pop        qword ptr [rsp + 0x40]
018c0 48894424f8                     mov        qword ptr [rsp - 8], rax
018c5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
018c9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
018cd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d2 48894424f8                     mov        qword ptr [rsp - 8], rax
018d7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018db 89442460                       mov        dword ptr [rsp + 0x60], eax
018df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e4 89442464                       mov        dword ptr [rsp + 0x64], eax
018e8 4489542470                     mov        dword ptr [rsp + 0x70], r10d
018ed 666690                         nop        
018f0 c5f877                         vzeroupper 
018f3 e8e8f0b5ff                     call       0x7f1e7f9d7d60
018f8 0f1f8400f019000f               nop        dword ptr [rax + rax + 0xf0019f0]
01900 be45ffffff                     mov        esi, 0xffffff45
01905 488b2c24                       mov        rbp, qword ptr [rsp]
01909 48894424f8                     mov        qword ptr [rsp - 8], rax
0190e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01912 89442408                       mov        dword ptr [rsp + 8], eax
01916 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0191b 48ff742420                     push       qword ptr [rsp + 0x20]
01920 488f442418                     pop        qword ptr [rsp + 0x18]
01925 48894424f8                     mov        qword ptr [rsp - 8], rax
0192a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0192e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01932 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01937 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0193b 4489742434                     mov        dword ptr [rsp + 0x34], r14d
01940 48894424f8                     mov        qword ptr [rsp - 8], rax
01945 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01949 89442438                       mov        dword ptr [rsp + 0x38], eax
0194d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01952 48ff742468                     push       qword ptr [rsp + 0x68]
01957 488f442440                     pop        qword ptr [rsp + 0x40]
0195c 48894424f8                     mov        qword ptr [rsp - 8], rax
01961 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01965 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01969 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0196e 48894424f8                     mov        qword ptr [rsp - 8], rax
01973 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01977 89442458                       mov        dword ptr [rsp + 0x58], eax
0197b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01980 48894424f8                     mov        qword ptr [rsp - 8], rax
01985 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01989 89442460                       mov        dword ptr [rsp + 0x60], eax
0198d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01992 89442464                       mov        dword ptr [rsp + 0x64], eax
01996 6690                           nop        
01998 c5f877                         vzeroupper 
0199b e840f0b5ff                     call       0x7f1e7f9d7d60
019a0 0f1f8400981a0010               nop        dword ptr [rax + rax + 0x10001a98]
019a8 bee4ffffff                     mov        esi, 0xffffffe4
019ad 488b2c24                       mov        rbp, qword ptr [rsp]
019b1 48894424f8                     mov        qword ptr [rsp - 8], rax
019b6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
019ba 89442408                       mov        dword ptr [rsp + 8], eax
019be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c3 48ff742420                     push       qword ptr [rsp + 0x20]
019c8 488f442418                     pop        qword ptr [rsp + 0x18]
019cd 48894424f8                     mov        qword ptr [rsp - 8], rax
019d2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
019d6 8944240c                       mov        dword ptr [rsp + 0xc], eax
019da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019df 48894424f8                     mov        qword ptr [rsp - 8], rax
019e4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019e8 89442438                       mov        dword ptr [rsp + 0x38], eax
019ec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f1 48ff742468                     push       qword ptr [rsp + 0x68]
019f6 488f442440                     pop        qword ptr [rsp + 0x40]
019fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01a00 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a04 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a0d 48ffb42488000000               push       qword ptr [rsp + 0x88]
01a15 488f442448                     pop        qword ptr [rsp + 0x48]
01a1a 48ff742478                     push       qword ptr [rsp + 0x78]
01a1f 488f442450                     pop        qword ptr [rsp + 0x50]
01a24 48894424f8                     mov        qword ptr [rsp - 8], rax
01a29 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a2d 89442458                       mov        dword ptr [rsp + 0x58], eax
01a31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a36 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01a42 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a50 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01a54 89442460                       mov        dword ptr [rsp + 0x60], eax
01a58 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5d 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01a65 666690                         nop        
01a68 c5f877                         vzeroupper 
01a6b e870efb5ff                     call       0x7f1e7f9d7d60
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
01ab4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ab8 89442438                       mov        dword ptr [rsp + 0x38], eax
01abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac1 48ff742468                     push       qword ptr [rsp + 0x68]
01ac6 488f442440                     pop        qword ptr [rsp + 0x40]
01acb 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ad4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ad8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01add 48ffb42488000000               push       qword ptr [rsp + 0x88]
01ae5 488f442448                     pop        qword ptr [rsp + 0x48]
01aea 48ff742478                     push       qword ptr [rsp + 0x78]
01aef 488f442450                     pop        qword ptr [rsp + 0x50]
01af4 48894424f8                     mov        qword ptr [rsp - 8], rax
01af9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01afd 89442458                       mov        dword ptr [rsp + 0x58], eax
01b01 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b06 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0b 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01b12 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01b16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b20 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01b24 89442460                       mov        dword ptr [rsp + 0x60], eax
01b28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2d 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01b32 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
01b37 90                             nop        
01b38 c5f877                         vzeroupper 
01b3b e8a0eeb5ff                     call       0x7f1e7f9d7d60
01b40 0f1f8400381c0012               nop        dword ptr [rax + rax + 0x12001c38]
01b48 4533d2                         xor        r10d, r10d
01b4b 4c891424                       mov        qword ptr [rsp], r10
01b4f e9dfe5ffff                     jmp        0x7f1e7fe774b3
01b54 4533d2                         xor        r10d, r10d
01b57 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01b5f e9fae5ffff                     jmp        0x7f1e7fe774de
01b64 4533d2                         xor        r10d, r10d
01b67 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
01b6f e91ae6ffff                     jmp        0x7f1e7fe7750e
01b74 4533d2                         xor        r10d, r10d
01b77 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b7c e935e6ffff                     jmp        0x7f1e7fe77536
01b81 4533d2                         xor        r10d, r10d
01b84 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01b8c e955e6ffff                     jmp        0x7f1e7fe77566
01b91 4533d2                         xor        r10d, r10d
01b94 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
01b9c e970e6ffff                     jmp        0x7f1e7fe77591
01ba1 4183c108                       add        r9d, 8
01ba5 be6effffff                     mov        esi, 0xffffff6e
01baa 488b2c24                       mov        rbp, qword ptr [rsp]
01bae 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01bb7 89442408                       mov        dword ptr [rsp + 8], eax
01bbb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc0 48ff742420                     push       qword ptr [rsp + 0x20]
01bc5 488f442418                     pop        qword ptr [rsp + 0x18]
01bca 48894424f8                     mov        qword ptr [rsp - 8], rax
01bcf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01bd3 8944240c                       mov        dword ptr [rsp + 0xc], eax
01bd7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bdc 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01be0 48894424f8                     mov        qword ptr [rsp - 8], rax
01be5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01be9 89442438                       mov        dword ptr [rsp + 0x38], eax
01bed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf2 48ff742468                     push       qword ptr [rsp + 0x68]
01bf7 488f442440                     pop        qword ptr [rsp + 0x40]
01bfc 48894424f8                     mov        qword ptr [rsp - 8], rax
01c01 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c05 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c09 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0e 48ff742478                     push       qword ptr [rsp + 0x78]
01c13 488f442450                     pop        qword ptr [rsp + 0x50]
01c18 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01c21 89442458                       mov        dword ptr [rsp + 0x58], eax
01c25 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c2f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c33 89442460                       mov        dword ptr [rsp + 0x60], eax
01c37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c41 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
01c48 89442468                       mov        dword ptr [rsp + 0x68], eax
01c4c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c51 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01c56 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c5a 6690                           nop        
01c5c c5f877                         vzeroupper 
01c5f e87cedb5ff                     call       0x7f1e7f9d7d60
01c64 0f1f84005c1d0013               nop        dword ptr [rax + rax + 0x13001d5c]
01c6c 4183c108                       add        r9d, 8
01c70 be66ffffff                     mov        esi, 0xffffff66
01c75 488b2c24                       mov        rbp, qword ptr [rsp]
01c79 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7e 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c82 89442408                       mov        dword ptr [rsp + 8], eax
01c86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8b 48ff742420                     push       qword ptr [rsp + 0x20]
01c90 488f442418                     pop        qword ptr [rsp + 0x18]
01c95 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c9e 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ca2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca7 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01cab 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb0 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01cb4 89442438                       mov        dword ptr [rsp + 0x38], eax
01cb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cbd 48ff742468                     push       qword ptr [rsp + 0x68]
01cc2 488f442440                     pop        qword ptr [rsp + 0x40]
01cc7 48894424f8                     mov        qword ptr [rsp - 8], rax
01ccc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01cd0 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01cd4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd9 48ff742478                     push       qword ptr [rsp + 0x78]
01cde 488f442450                     pop        qword ptr [rsp + 0x50]
01ce3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ce8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01cec 89442458                       mov        dword ptr [rsp + 0x58], eax
01cf0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cf5 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfa 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01cfe 89442460                       mov        dword ptr [rsp + 0x60], eax
01d02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d07 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01d0c 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01d10 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01d15 666690                         nop        
01d18 c5f877                         vzeroupper 
01d1b e8c0ecb5ff                     call       0x7f1e7f9d7d60
01d20 0f1f8400181e0014               nop        dword ptr [rax + rax + 0x14001e18]
01d28 beccffffff                     mov        esi, 0xffffffcc
01d2d 488b2c24                       mov        rbp, qword ptr [rsp]
01d31 48894424f8                     mov        qword ptr [rsp - 8], rax
01d36 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d3a 89442408                       mov        dword ptr [rsp + 8], eax
01d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d43 48ff742420                     push       qword ptr [rsp + 0x20]
01d48 488f442418                     pop        qword ptr [rsp + 0x18]
01d4d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d52 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d56 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d5a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5f 48894424f8                     mov        qword ptr [rsp - 8], rax
01d64 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d68 89442438                       mov        dword ptr [rsp + 0x38], eax
01d6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d71 48ff742468                     push       qword ptr [rsp + 0x68]
01d76 488f442440                     pop        qword ptr [rsp + 0x40]
01d7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d80 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d84 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8d 48ff742478                     push       qword ptr [rsp + 0x78]
01d92 488f442450                     pop        qword ptr [rsp + 0x50]
01d97 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01da0 89442458                       mov        dword ptr [rsp + 0x58], eax
01da4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dae 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01db5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01db9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbe 48894424f8                     mov        qword ptr [rsp - 8], rax
01dc3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01dc7 89442460                       mov        dword ptr [rsp + 0x60], eax
01dcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd0 48894424f8                     mov        qword ptr [rsp - 8], rax
01dd5 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01ddc 89442464                       mov        dword ptr [rsp + 0x64], eax
01de0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01de5 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01dea 6690                           nop        
01dec c5f877                         vzeroupper 
01def e8ecebb5ff                     call       0x7f1e7f9d7d60
01df4 0f1f8400ec1e0015               nop        dword ptr [rax + rax + 0x15001eec]
01dfc beccffffff                     mov        esi, 0xffffffcc
01e01 48ffb42490000000               push       qword ptr [rsp + 0x90]
01e09 488f442408                     pop        qword ptr [rsp + 8]
01e0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e13 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e17 89442414                       mov        dword ptr [rsp + 0x14], eax
01e1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e20 48894424f8                     mov        qword ptr [rsp - 8], rax
01e25 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01e29 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e2d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e32 48ff742468                     push       qword ptr [rsp + 0x68]
01e37 488f442440                     pop        qword ptr [rsp + 0x40]
01e3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e41 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e45 89442448                       mov        dword ptr [rsp + 0x48], eax
01e49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4e 48ffb42488000000               push       qword ptr [rsp + 0x88]
01e56 488f442450                     pop        qword ptr [rsp + 0x50]
01e5b 48ff742478                     push       qword ptr [rsp + 0x78]
01e60 488f442458                     pop        qword ptr [rsp + 0x58]
01e65 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6a 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e6e 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e77 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7c 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
01e83 89442460                       mov        dword ptr [rsp + 0x60], eax
01e87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e91 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e95 89442464                       mov        dword ptr [rsp + 0x64], eax
01e99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9e 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01ea6 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01eae 6690                           nop        
01eb0 c5f877                         vzeroupper 
01eb3 e828ebb5ff                     call       0x7f1e7f9d7d60
01eb8 0f1f8400b01f0016               nop        dword ptr [rax + rax + 0x16001fb0]
01ec0 458d1c09                       lea        r11d, [r9 + rcx]
01ec4 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01ecc 4f8b541a0c                     mov        r10, qword ptr [r10 + r11 + 0xc]
01ed1 448bc1                         mov        r8d, ecx
01ed4 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01edc 4f8954030c                     mov        qword ptr [r11 + r8 + 0xc], r10
01ee1 448d5908                       lea        r11d, [rcx + 8]
01ee5 418bcb                         mov        ecx, r11d
01ee8 443bdb                         cmp        r11d, ebx
01eeb 7cd3                           jl         0x7f1e7fe79240
01eed 443bdf                         cmp        r11d, edi
01ef0 0f8d8d000000                   jge        0x7f1e7fe79303
01ef6 458bd3                         mov        r10d, r11d
01ef9 418bca                         mov        ecx, r10d
01efc 0f1f4000                       nop        dword ptr [rax]
01f00 458d1c09                       lea        r11d, [r9 + rcx]
01f04 448bc1                         mov        r8d, ecx
01f07 4963d8                         movsxd     rbx, r8d
01f0a 458bd3                         mov        r10d, r11d
01f0d 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01f15 4f8b54100c                     mov        r10, qword ptr [r8 + r10 + 0xc]
01f1a 4d63db                         movsxd     r11, r11d
01f1d 448bc1                         mov        r8d, ecx
01f20 488b9424c8000000               mov        rdx, qword ptr [rsp + 0xc8]
01f28 4e8954020c                     mov        qword ptr [rdx + r8 + 0xc], r10
01f2d 4e8b541a14                     mov        r10, qword ptr [rdx + r11 + 0x14]
01f32 4c89541a14                     mov        qword ptr [rdx + rbx + 0x14], r10
01f37 4e8b541a1c                     mov        r10, qword ptr [rdx + r11 + 0x1c]
01f3c 4c89541a1c                     mov        qword ptr [rdx + rbx + 0x1c], r10
01f41 4e8b541a24                     mov        r10, qword ptr [rdx + r11 + 0x24]
01f46 4c89541a24                     mov        qword ptr [rdx + rbx + 0x24], r10
01f4b 4e8b541a2c                     mov        r10, qword ptr [rdx + r11 + 0x2c]
01f50 4c89541a2c                     mov        qword ptr [rdx + rbx + 0x2c], r10
01f55 4e8b541a34                     mov        r10, qword ptr [rdx + r11 + 0x34]
01f5a 4c89541a34                     mov        qword ptr [rdx + rbx + 0x34], r10
01f5f 4e8b541a3c                     mov        r10, qword ptr [rdx + r11 + 0x3c]
01f64 4c89541a3c                     mov        qword ptr [rdx + rbx + 0x3c], r10
01f69 4e8b541a44                     mov        r10, qword ptr [rdx + r11 + 0x44]
01f6e 4c89541a44                     mov        qword ptr [rdx + rbx + 0x44], r10
01f73 448d5940                       lea        r11d, [rcx + 0x40]
01f77 418bcb                         mov        ecx, r11d
01f7a 443bdf                         cmp        r11d, edi
01f7d 0f8c7dffffff                   jl         0x7f1e7fe79280
01f83 3b8c24c0000000                 cmp        ecx, dword ptr [rsp + 0xc0]
01f8a 0f8db9f4ffff                   jge        0x7f1e7fe787c9
01f90 448bd1                         mov        r10d, ecx
01f93 90                             nop        
01f94 478d0411                       lea        r8d, [r9 + r10]
01f98 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01fa0 4f8b5c030c                     mov        r11, qword ptr [r11 + r8 + 0xc]
01fa5 418bca                         mov        ecx, r10d
01fa8 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01fb0 4d895c080c                     mov        qword ptr [r8 + rcx + 0xc], r11
01fb5 458d5a08                       lea        r11d, [r10 + 8]
01fb9 458bd3                         mov        r10d, r11d
01fbc 443b9c24c0000000               cmp        r11d, dword ptr [rsp + 0xc0]
01fc4 7cce                           jl         0x7f1e7fe79314
01fc6 e97ef4ffff                     jmp        0x7f1e7fe787c9
01fcb bee4ffffff                     mov        esi, 0xffffffe4
01fd0 488b2c24                       mov        rbp, qword ptr [rsp]
01fd4 48894424f8                     mov        qword ptr [rsp - 8], rax
01fd9 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01fdd 89442408                       mov        dword ptr [rsp + 8], eax
01fe1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe6 48ff742420                     push       qword ptr [rsp + 0x20]
01feb 488f442418                     pop        qword ptr [rsp + 0x18]
01ff0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff5 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ff9 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ffd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02002 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02006 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0200b 48894424f8                     mov        qword ptr [rsp - 8], rax
02010 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02014 89442438                       mov        dword ptr [rsp + 0x38], eax
02018 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201d 48ff742468                     push       qword ptr [rsp + 0x68]
02022 488f442440                     pop        qword ptr [rsp + 0x40]
02027 48894424f8                     mov        qword ptr [rsp - 8], rax
0202c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02030 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02034 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02039 48ff742478                     push       qword ptr [rsp + 0x78]
0203e 488f442450                     pop        qword ptr [rsp + 0x50]
02043 48894424f8                     mov        qword ptr [rsp - 8], rax
02048 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0204c 89442458                       mov        dword ptr [rsp + 0x58], eax
02050 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02055 48894424f8                     mov        qword ptr [rsp - 8], rax
0205a 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02061 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02065 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206a 48894424f8                     mov        qword ptr [rsp - 8], rax
0206f 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02073 89442460                       mov        dword ptr [rsp + 0x60], eax
02077 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0207c 89442464                       mov        dword ptr [rsp + 0x64], eax
02080 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
02087 90                             nop        
02088 c5f877                         vzeroupper 
0208b e850e9b5ff                     call       0x7f1e7f9d7d60
02090 0f1f840088210017               nop        dword ptr [rax + rax + 0x17002188]
02098 be6effffff                     mov        esi, 0xffffff6e
0209d 488b2c24                       mov        rbp, qword ptr [rsp]
020a1 48894424f8                     mov        qword ptr [rsp - 8], rax
020a6 8b442410                       mov        eax, dword ptr [rsp + 0x10]
020aa 89442408                       mov        dword ptr [rsp + 8], eax
020ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020b3 48ff742420                     push       qword ptr [rsp + 0x20]
020b8 488f442418                     pop        qword ptr [rsp + 0x18]
020bd 48894424f8                     mov        qword ptr [rsp - 8], rax
020c2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020c6 8944240c                       mov        dword ptr [rsp + 0xc], eax
020ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020cf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020d3 4489742434                     mov        dword ptr [rsp + 0x34], r14d
020d8 48894424f8                     mov        qword ptr [rsp - 8], rax
020dd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020e1 89442438                       mov        dword ptr [rsp + 0x38], eax
020e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ea 48ff742468                     push       qword ptr [rsp + 0x68]
020ef 488f442440                     pop        qword ptr [rsp + 0x40]
020f4 48894424f8                     mov        qword ptr [rsp - 8], rax
020f9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
020fd 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02101 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02106 48ff742478                     push       qword ptr [rsp + 0x78]
0210b 488f442450                     pop        qword ptr [rsp + 0x50]
02110 48894424f8                     mov        qword ptr [rsp - 8], rax
02115 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02119 89442458                       mov        dword ptr [rsp + 0x58], eax
0211d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02122 48894424f8                     mov        qword ptr [rsp - 8], rax
02127 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0212b 89442460                       mov        dword ptr [rsp + 0x60], eax
0212f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02134 89442464                       mov        dword ptr [rsp + 0x64], eax
02138 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0213d 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
02141 666690                         nop        
02144 c5f877                         vzeroupper 
02147 e894e8b5ff                     call       0x7f1e7f9d7d60
0214c 0f1f840044220018               nop        dword ptr [rax + rax + 0x18002244]
02154 be45ffffff                     mov        esi, 0xffffff45
02159 488b2c24                       mov        rbp, qword ptr [rsp]
0215d 48894424f8                     mov        qword ptr [rsp - 8], rax
02162 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02166 89442408                       mov        dword ptr [rsp + 8], eax
0216a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0216f 48ff742420                     push       qword ptr [rsp + 0x20]
02174 488f442418                     pop        qword ptr [rsp + 0x18]
02179 48894424f8                     mov        qword ptr [rsp - 8], rax
0217e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02182 8944240c                       mov        dword ptr [rsp + 0xc], eax
02186 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0218b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0218f 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02194 48894424f8                     mov        qword ptr [rsp - 8], rax
02199 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0219d 89442438                       mov        dword ptr [rsp + 0x38], eax
021a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a6 48ff742468                     push       qword ptr [rsp + 0x68]
021ab 488f442440                     pop        qword ptr [rsp + 0x40]
021b0 48894424f8                     mov        qword ptr [rsp - 8], rax
021b5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021b9 8944243c                       mov        dword ptr [rsp + 0x3c], eax
021bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c2 48ff742478                     push       qword ptr [rsp + 0x78]
021c7 488f442450                     pop        qword ptr [rsp + 0x50]
021cc 48894424f8                     mov        qword ptr [rsp - 8], rax
021d1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
021d5 89442458                       mov        dword ptr [rsp + 0x58], eax
021d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021de 48894424f8                     mov        qword ptr [rsp - 8], rax
021e3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
021e7 89442460                       mov        dword ptr [rsp + 0x60], eax
021eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021f0 89442464                       mov        dword ptr [rsp + 0x64], eax
021f4 894c2478                       mov        dword ptr [rsp + 0x78], ecx
021f8 c5f877                         vzeroupper 
021fb e8e0e7b5ff                     call       0x7f1e7f9d7d60
02200 0f1f8400f8220019               nop        dword ptr [rax + rax + 0x190022f8]
02208 be3dffffff                     mov        esi, 0xffffff3d
0220d 488b2c24                       mov        rbp, qword ptr [rsp]
02211 48894424f8                     mov        qword ptr [rsp - 8], rax
02216 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0221a 89442408                       mov        dword ptr [rsp + 8], eax
0221e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02223 48ff742420                     push       qword ptr [rsp + 0x20]
02228 488f442418                     pop        qword ptr [rsp + 0x18]
0222d 48894424f8                     mov        qword ptr [rsp - 8], rax
02232 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02236 8944240c                       mov        dword ptr [rsp + 0xc], eax
0223a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0223f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
02243 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02248 48894424f8                     mov        qword ptr [rsp - 8], rax
0224d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02251 89442438                       mov        dword ptr [rsp + 0x38], eax
02255 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0225a 48ff742468                     push       qword ptr [rsp + 0x68]
0225f 488f442440                     pop        qword ptr [rsp + 0x40]
02264 48894424f8                     mov        qword ptr [rsp - 8], rax
02269 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0226d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02271 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02276 48ff742478                     push       qword ptr [rsp + 0x78]
0227b 488f442450                     pop        qword ptr [rsp + 0x50]
02280 48894424f8                     mov        qword ptr [rsp - 8], rax
02285 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02289 89442458                       mov        dword ptr [rsp + 0x58], eax
0228d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02292 48894424f8                     mov        qword ptr [rsp - 8], rax
02297 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0229b 89442460                       mov        dword ptr [rsp + 0x60], eax
0229f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a4 89442464                       mov        dword ptr [rsp + 0x64], eax
022a8 894c2478                       mov        dword ptr [rsp + 0x78], ecx
022ac c5f877                         vzeroupper 
022af e82ce7b5ff                     call       0x7f1e7f9d7d60
022b4 0f1f8400ac23001a               nop        dword ptr [rax + rax + 0x1a0023ac]
022bc bee4ffffff                     mov        esi, 0xffffffe4
022c1 488b2c24                       mov        rbp, qword ptr [rsp]
022c5 48894424f8                     mov        qword ptr [rsp - 8], rax
022ca 8b442410                       mov        eax, dword ptr [rsp + 0x10]
022ce 89442408                       mov        dword ptr [rsp + 8], eax
022d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022d7 48ff742420                     push       qword ptr [rsp + 0x20]
022dc 488f442418                     pop        qword ptr [rsp + 0x18]
022e1 48894424f8                     mov        qword ptr [rsp - 8], rax
022e6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
022ea 8944240c                       mov        dword ptr [rsp + 0xc], eax
022ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022f3 48894424f8                     mov        qword ptr [rsp - 8], rax
022f8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
022fc 89442434                       mov        dword ptr [rsp + 0x34], eax
02300 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02305 48ff742468                     push       qword ptr [rsp + 0x68]
0230a 488f442438                     pop        qword ptr [rsp + 0x38]
0230f 48894424f8                     mov        qword ptr [rsp - 8], rax
02314 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02318 89442440                       mov        dword ptr [rsp + 0x40], eax
0231c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02321 48ffb42488000000               push       qword ptr [rsp + 0x88]
02329 488f442448                     pop        qword ptr [rsp + 0x48]
0232e 48ff742478                     push       qword ptr [rsp + 0x78]
02333 488f442450                     pop        qword ptr [rsp + 0x50]
02338 48894424f8                     mov        qword ptr [rsp - 8], rax
0233d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02341 89442444                       mov        dword ptr [rsp + 0x44], eax
02345 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0234a 48894424f8                     mov        qword ptr [rsp - 8], rax
0234f 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02356 89442458                       mov        dword ptr [rsp + 0x58], eax
0235a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0235f 48894424f8                     mov        qword ptr [rsp - 8], rax
02364 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02368 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0236c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02371 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
02379 666690                         nop        
0237c c5f877                         vzeroupper 
0237f e85ce6b5ff                     call       0x7f1e7f9d7d60
02384 0f1f84007c24001b               nop        dword ptr [rax + rax + 0x1b00247c]
0238c bee4ffffff                     mov        esi, 0xffffffe4
02391 48894424f8                     mov        qword ptr [rsp - 8], rax
02396 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0239a 89442414                       mov        dword ptr [rsp + 0x14], eax
0239e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023a3 48894424f8                     mov        qword ptr [rsp - 8], rax
023a8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
023ac 8944243c                       mov        dword ptr [rsp + 0x3c], eax
023b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023b5 48ff742468                     push       qword ptr [rsp + 0x68]
023ba 488f442440                     pop        qword ptr [rsp + 0x40]
023bf 48894424f8                     mov        qword ptr [rsp - 8], rax
023c4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023c8 89442448                       mov        dword ptr [rsp + 0x48], eax
023cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d1 48ffb42488000000               push       qword ptr [rsp + 0x88]
023d9 488f442450                     pop        qword ptr [rsp + 0x50]
023de 48ff742478                     push       qword ptr [rsp + 0x78]
023e3 488f442458                     pop        qword ptr [rsp + 0x58]
023e8 48894424f8                     mov        qword ptr [rsp - 8], rax
023ed 8b442474                       mov        eax, dword ptr [rsp + 0x74]
023f1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
023f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023fa 48894424f8                     mov        qword ptr [rsp - 8], rax
023ff 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02406 89442460                       mov        dword ptr [rsp + 0x60], eax
0240a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0240f 48894424f8                     mov        qword ptr [rsp - 8], rax
02414 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02418 89442464                       mov        dword ptr [rsp + 0x64], eax
0241c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02421 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02426 6690                           nop        
02428 c5f877                         vzeroupper 
0242b e8b0e5b5ff                     call       0x7f1e7f9d7d60
02430 0f1f84002825001c               nop        dword ptr [rax + rax + 0x1c002528]
02438 418d6901                       lea        ebp, [r9 + 1]
0243c bee4ffffff                     mov        esi, 0xffffffe4
02441 48ffb42490000000               push       qword ptr [rsp + 0x90]
02449 488f442408                     pop        qword ptr [rsp + 8]
0244e 48894424f8                     mov        qword ptr [rsp - 8], rax
02453 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02457 89442414                       mov        dword ptr [rsp + 0x14], eax
0245b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02460 48894424f8                     mov        qword ptr [rsp - 8], rax
02465 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02469 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0246d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02472 48ff742468                     push       qword ptr [rsp + 0x68]
02477 488f442440                     pop        qword ptr [rsp + 0x40]
0247c 48894424f8                     mov        qword ptr [rsp - 8], rax
02481 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02485 89442448                       mov        dword ptr [rsp + 0x48], eax
02489 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0248e 48ffb42488000000               push       qword ptr [rsp + 0x88]
02496 488f442450                     pop        qword ptr [rsp + 0x50]
0249b 48ff742478                     push       qword ptr [rsp + 0x78]
024a0 488f442458                     pop        qword ptr [rsp + 0x58]
024a5 48894424f8                     mov        qword ptr [rsp - 8], rax
024aa 8b442474                       mov        eax, dword ptr [rsp + 0x74]
024ae 8944244c                       mov        dword ptr [rsp + 0x4c], eax
024b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024b7 48894424f8                     mov        qword ptr [rsp - 8], rax
024bc 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
024c3 89442460                       mov        dword ptr [rsp + 0x60], eax
024c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024cc 48894424f8                     mov        qword ptr [rsp - 8], rax
024d1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
024d5 89442464                       mov        dword ptr [rsp + 0x64], eax
024d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024de 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
024e3 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
024eb 90                             nop        
024ec c5f877                         vzeroupper 
024ef e8ece4b5ff                     call       0x7f1e7f9d7d60
024f4 0f1f8400ec25001d               nop        dword ptr [rax + rax + 0x1d0025ec]
024fc bee4ffffff                     mov        esi, 0xffffffe4
02501 48894424f8                     mov        qword ptr [rsp - 8], rax
02506 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0250a 89442414                       mov        dword ptr [rsp + 0x14], eax
0250e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02513 48894424f8                     mov        qword ptr [rsp - 8], rax
02518 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0251c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02520 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02525 48ff742468                     push       qword ptr [rsp + 0x68]
0252a 488f442440                     pop        qword ptr [rsp + 0x40]
0252f 48894424f8                     mov        qword ptr [rsp - 8], rax
02534 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02538 89442448                       mov        dword ptr [rsp + 0x48], eax
0253c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02541 48ffb42488000000               push       qword ptr [rsp + 0x88]
02549 488f442450                     pop        qword ptr [rsp + 0x50]
0254e 48ff742478                     push       qword ptr [rsp + 0x78]
02553 488f442458                     pop        qword ptr [rsp + 0x58]
02558 48894424f8                     mov        qword ptr [rsp - 8], rax
0255d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02561 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02565 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0256a 48894424f8                     mov        qword ptr [rsp - 8], rax
0256f 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02576 89442460                       mov        dword ptr [rsp + 0x60], eax
0257a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257f 48894424f8                     mov        qword ptr [rsp - 8], rax
02584 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02588 89442464                       mov        dword ptr [rsp + 0x64], eax
0258c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02591 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02596 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
0259e 6690                           nop        
025a0 c5f877                         vzeroupper 
025a3 e838e4b5ff                     call       0x7f1e7f9d7d60
025a8 0f1f8400a026001e               nop        dword ptr [rax + rax + 0x1e0026a0]
025b0 bee4ffffff                     mov        esi, 0xffffffe4
025b5 488b2c24                       mov        rbp, qword ptr [rsp]
025b9 48894424f8                     mov        qword ptr [rsp - 8], rax
025be 8b442410                       mov        eax, dword ptr [rsp + 0x10]
025c2 89442408                       mov        dword ptr [rsp + 8], eax
025c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025cb 48ff742420                     push       qword ptr [rsp + 0x20]
025d0 488f442418                     pop        qword ptr [rsp + 0x18]
025d5 48894424f8                     mov        qword ptr [rsp - 8], rax
025da 8b442428                       mov        eax, dword ptr [rsp + 0x28]
025de 8944240c                       mov        dword ptr [rsp + 0xc], eax
025e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025e7 48894424f8                     mov        qword ptr [rsp - 8], rax
025ec 8b442460                       mov        eax, dword ptr [rsp + 0x60]
025f0 89442434                       mov        dword ptr [rsp + 0x34], eax
025f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f9 48ff742468                     push       qword ptr [rsp + 0x68]
025fe 488f442438                     pop        qword ptr [rsp + 0x38]
02603 48894424f8                     mov        qword ptr [rsp - 8], rax
02608 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0260c 89442440                       mov        dword ptr [rsp + 0x40], eax
02610 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02615 48ff742478                     push       qword ptr [rsp + 0x78]
0261a 488f442450                     pop        qword ptr [rsp + 0x50]
0261f 48894424f8                     mov        qword ptr [rsp - 8], rax
02624 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02628 89442444                       mov        dword ptr [rsp + 0x44], eax
0262c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02631 48894424f8                     mov        qword ptr [rsp - 8], rax
02636 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0263a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0263e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02643 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02648 c5f877                         vzeroupper 
0264b e890e3b5ff                     call       0x7f1e7f9d7d60
02650 0f1f84004827001f               nop        dword ptr [rax + rax + 0x1f002748]
02658 beccffffff                     mov        esi, 0xffffffcc
0265d 488b2c24                       mov        rbp, qword ptr [rsp]
02661 48894424f8                     mov        qword ptr [rsp - 8], rax
02666 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0266a 89442408                       mov        dword ptr [rsp + 8], eax
0266e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02673 48ff742420                     push       qword ptr [rsp + 0x20]
02678 488f442418                     pop        qword ptr [rsp + 0x18]
0267d 48894424f8                     mov        qword ptr [rsp - 8], rax
02682 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02686 8944240c                       mov        dword ptr [rsp + 0xc], eax
0268a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0268f 48894424f8                     mov        qword ptr [rsp - 8], rax
02694 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02698 89442434                       mov        dword ptr [rsp + 0x34], eax
0269c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026a1 48ff742468                     push       qword ptr [rsp + 0x68]
026a6 488f442438                     pop        qword ptr [rsp + 0x38]
026ab 48894424f8                     mov        qword ptr [rsp - 8], rax
026b0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026b4 89442440                       mov        dword ptr [rsp + 0x40], eax
026b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026bd 48ffb42488000000               push       qword ptr [rsp + 0x88]
026c5 488f442448                     pop        qword ptr [rsp + 0x48]
026ca 48ff742478                     push       qword ptr [rsp + 0x78]
026cf 488f442450                     pop        qword ptr [rsp + 0x50]
026d4 48894424f8                     mov        qword ptr [rsp - 8], rax
026d9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
026dd 89442444                       mov        dword ptr [rsp + 0x44], eax
026e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e6 48894424f8                     mov        qword ptr [rsp - 8], rax
026eb 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
026f2 89442458                       mov        dword ptr [rsp + 0x58], eax
026f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026fb 48894424f8                     mov        qword ptr [rsp - 8], rax
02700 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02704 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02708 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270d 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02712 6690                           nop        
02714 c5f877                         vzeroupper 
02717 e8c4e2b5ff                     call       0x7f1e7f9d7d60
0271c 0f1f840014280020               nop        dword ptr [rax + rax + 0x20002814]
02724 be45ffffff                     mov        esi, 0xffffff45
02729 488b2c24                       mov        rbp, qword ptr [rsp]
0272d 48894424f8                     mov        qword ptr [rsp - 8], rax
02732 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02736 89442408                       mov        dword ptr [rsp + 8], eax
0273a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0273f 48ff742420                     push       qword ptr [rsp + 0x20]
02744 488f442418                     pop        qword ptr [rsp + 0x18]
02749 48894424f8                     mov        qword ptr [rsp - 8], rax
0274e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02752 8944240c                       mov        dword ptr [rsp + 0xc], eax
02756 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0275b 48894424f8                     mov        qword ptr [rsp - 8], rax
02760 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02764 89442438                       mov        dword ptr [rsp + 0x38], eax
02768 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0276d 48ff742468                     push       qword ptr [rsp + 0x68]
02772 488f442440                     pop        qword ptr [rsp + 0x40]
02777 48894424f8                     mov        qword ptr [rsp - 8], rax
0277c 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02780 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02784 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02789 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0278e 6690                           nop        
02790 c5f877                         vzeroupper 
02793 e848e2b5ff                     call       0x7f1e7f9d7d60
02798 0f1f840090280021               nop        dword ptr [rax + rax + 0x21002890]
027a0 bebeffffff                     mov        esi, 0xffffffbe
027a5 488b2c24                       mov        rbp, qword ptr [rsp]
027a9 48894424f8                     mov        qword ptr [rsp - 8], rax
027ae 8b442410                       mov        eax, dword ptr [rsp + 0x10]
027b2 89442408                       mov        dword ptr [rsp + 8], eax
027b6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027bb 48ff742420                     push       qword ptr [rsp + 0x20]
027c0 488f442418                     pop        qword ptr [rsp + 0x18]
027c5 48894424f8                     mov        qword ptr [rsp - 8], rax
027ca 8b442428                       mov        eax, dword ptr [rsp + 0x28]
027ce 8944240c                       mov        dword ptr [rsp + 0xc], eax
027d2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027d7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
027db 4489742434                     mov        dword ptr [rsp + 0x34], r14d
027e0 48894424f8                     mov        qword ptr [rsp - 8], rax
027e5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
027e9 89442438                       mov        dword ptr [rsp + 0x38], eax
027ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027f2 6690                           nop        
027f4 c5f877                         vzeroupper 
027f7 e8e4e1b5ff                     call       0x7f1e7f9d7d60
027fc 0f1f8400f4280022               nop        dword ptr [rax + rax + 0x220028f4]
02804 be85ffffff                     mov        esi, 0xffffff85
02809 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0280d 48894424f8                     mov        qword ptr [rsp - 8], rax
02812 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02816 890424                         mov        dword ptr [rsp], eax
02819 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0281e 895c2404                       mov        dword ptr [rsp + 4], ebx
02822 4489742408                     mov        dword ptr [rsp + 8], r14d
02827 48894424f8                     mov        qword ptr [rsp - 8], rax
0282c 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02830 8944240c                       mov        dword ptr [rsp + 0xc], eax
02834 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02839 48894424f8                     mov        qword ptr [rsp - 8], rax
0283e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02842 89442418                       mov        dword ptr [rsp + 0x18], eax
02846 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0284b 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
02850 c5f877                         vzeroupper 
02853 e888e1b5ff                     call       0x7f1e7f9d7d60
02858 0f1f840050290023               nop        dword ptr [rax + rax + 0x23002950]
02860 beccffffff                     mov        esi, 0xffffffcc
02865 488b2c24                       mov        rbp, qword ptr [rsp]
02869 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0286e 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02872 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02877 90                             nop        
02878 c5f877                         vzeroupper 
0287b e860e1b5ff                     call       0x7f1e7f9d7d60
02880 0f1f840078290024               nop        dword ptr [rax + rax + 0x24002978]
02888 bee4ffffff                     mov        esi, 0xffffffe4
0288d 488b2c24                       mov        rbp, qword ptr [rsp]
02891 48894424f8                     mov        qword ptr [rsp - 8], rax
02896 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0289a 89442408                       mov        dword ptr [rsp + 8], eax
0289e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028a3 48ff742420                     push       qword ptr [rsp + 0x20]
028a8 488f442418                     pop        qword ptr [rsp + 0x18]
028ad 48894424f8                     mov        qword ptr [rsp - 8], rax
028b2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
028b6 8944240c                       mov        dword ptr [rsp + 0xc], eax
028ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028bf 48894424f8                     mov        qword ptr [rsp - 8], rax
028c4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
028c8 89442434                       mov        dword ptr [rsp + 0x34], eax
028cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d1 48ff742468                     push       qword ptr [rsp + 0x68]
028d6 488f442438                     pop        qword ptr [rsp + 0x38]
028db 48894424f8                     mov        qword ptr [rsp - 8], rax
028e0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
028e4 89442440                       mov        dword ptr [rsp + 0x40], eax
028e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028ed 48ff742478                     push       qword ptr [rsp + 0x78]
028f2 488f442450                     pop        qword ptr [rsp + 0x50]
028f7 48894424f8                     mov        qword ptr [rsp - 8], rax
028fc 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02900 89442444                       mov        dword ptr [rsp + 0x44], eax
02904 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02909 48894424f8                     mov        qword ptr [rsp - 8], rax
0290e 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02915 89442458                       mov        dword ptr [rsp + 0x58], eax
02919 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0291e 48894424f8                     mov        qword ptr [rsp - 8], rax
02923 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02927 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0292b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02930 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
02938 c5f877                         vzeroupper 
0293b e8a0e0b5ff                     call       0x7f1e7f9d7d60
02940 0f1f8400382a0025               nop        dword ptr [rax + rax + 0x25002a38]
02948 bee4ffffff                     mov        esi, 0xffffffe4
0294d 488b2c24                       mov        rbp, qword ptr [rsp]
02951 48894424f8                     mov        qword ptr [rsp - 8], rax
02956 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0295a 89442408                       mov        dword ptr [rsp + 8], eax
0295e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02963 48ff742420                     push       qword ptr [rsp + 0x20]
02968 488f442418                     pop        qword ptr [rsp + 0x18]
0296d 48894424f8                     mov        qword ptr [rsp - 8], rax
02972 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02976 8944240c                       mov        dword ptr [rsp + 0xc], eax
0297a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0297f 48894424f8                     mov        qword ptr [rsp - 8], rax
02984 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02988 89442434                       mov        dword ptr [rsp + 0x34], eax
0298c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02991 48ff742468                     push       qword ptr [rsp + 0x68]
02996 488f442438                     pop        qword ptr [rsp + 0x38]
0299b 48894424f8                     mov        qword ptr [rsp - 8], rax
029a0 8b442464                       mov        eax, dword ptr [rsp + 0x64]
029a4 89442440                       mov        dword ptr [rsp + 0x40], eax
029a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029ad 48ff742478                     push       qword ptr [rsp + 0x78]
029b2 488f442450                     pop        qword ptr [rsp + 0x50]
029b7 48894424f8                     mov        qword ptr [rsp - 8], rax
029bc 8b442474                       mov        eax, dword ptr [rsp + 0x74]
029c0 89442444                       mov        dword ptr [rsp + 0x44], eax
029c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029c9 48894424f8                     mov        qword ptr [rsp - 8], rax
029ce 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
029d5 89442458                       mov        dword ptr [rsp + 0x58], eax
029d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029de 48894424f8                     mov        qword ptr [rsp - 8], rax
029e3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
029e7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
029eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029f0 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
029f5 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
029fd 666690                         nop        
02a00 c5f877                         vzeroupper 
02a03 e8d8dfb5ff                     call       0x7f1e7f9d7d60
02a08 0f1f8400002b0026               nop        dword ptr [rax + rax + 0x26002b00]
02a10 4183c108                       add        r9d, 8
02a14 be6effffff                     mov        esi, 0xffffff6e
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
02a79 48894424f8                     mov        qword ptr [rsp - 8], rax
02a7e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02a82 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02a86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a8b 48894424f8                     mov        qword ptr [rsp - 8], rax
02a90 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
02a97 89442460                       mov        dword ptr [rsp + 0x60], eax
02a9b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aa0 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02aa5 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02aa9 666690                         nop        
02aac c5f877                         vzeroupper 
02aaf e82cdfb5ff                     call       0x7f1e7f9d7d60
02ab4 0f1f8400ac2b0027               nop        dword ptr [rax + rax + 0x27002bac]
02abc 4183c108                       add        r9d, 8
02ac0 be66ffffff                     mov        esi, 0xffffff66
02ac5 488b2c24                       mov        rbp, qword ptr [rsp]
02ac9 48894424f8                     mov        qword ptr [rsp - 8], rax
02ace 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02ad2 89442408                       mov        dword ptr [rsp + 8], eax
02ad6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02adb 48ff742420                     push       qword ptr [rsp + 0x20]
02ae0 488f442418                     pop        qword ptr [rsp + 0x18]
02ae5 48894424f8                     mov        qword ptr [rsp - 8], rax
02aea 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02aee 8944240c                       mov        dword ptr [rsp + 0xc], eax
02af2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02af7 48894424f8                     mov        qword ptr [rsp - 8], rax
02afc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02b00 89442434                       mov        dword ptr [rsp + 0x34], eax
02b04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b09 48ff742468                     push       qword ptr [rsp + 0x68]
02b0e 488f442438                     pop        qword ptr [rsp + 0x38]
02b13 48894424f8                     mov        qword ptr [rsp - 8], rax
02b18 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b1c 89442440                       mov        dword ptr [rsp + 0x40], eax
02b20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b25 48894424f8                     mov        qword ptr [rsp - 8], rax
02b2a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02b2e 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02b32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b37 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02b3c 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02b40 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02b44 c5f877                         vzeroupper 
02b47 e894deb5ff                     call       0x7f1e7f9d7d60
02b4c 0f1f8400442c0028               nop        dword ptr [rax + rax + 0x28002c44]
02b54 bee4ffffff                     mov        esi, 0xffffffe4
02b59 488b2c24                       mov        rbp, qword ptr [rsp]
02b5d 48894424f8                     mov        qword ptr [rsp - 8], rax
02b62 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02b66 89442408                       mov        dword ptr [rsp + 8], eax
02b6a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b6f 48ff742420                     push       qword ptr [rsp + 0x20]
02b74 488f442418                     pop        qword ptr [rsp + 0x18]
02b79 48894424f8                     mov        qword ptr [rsp - 8], rax
02b7e 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02b82 8944240c                       mov        dword ptr [rsp + 0xc], eax
02b86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b8b 48894424f8                     mov        qword ptr [rsp - 8], rax
02b90 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02b94 89442434                       mov        dword ptr [rsp + 0x34], eax
02b98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b9d 48ff742468                     push       qword ptr [rsp + 0x68]
02ba2 488f442438                     pop        qword ptr [rsp + 0x38]
02ba7 48894424f8                     mov        qword ptr [rsp - 8], rax
02bac 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02bb0 89442440                       mov        dword ptr [rsp + 0x40], eax
02bb4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bb9 48ff742478                     push       qword ptr [rsp + 0x78]
02bbe 488f442450                     pop        qword ptr [rsp + 0x50]
02bc3 48894424f8                     mov        qword ptr [rsp - 8], rax
02bc8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02bcc 89442444                       mov        dword ptr [rsp + 0x44], eax
02bd0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd5 48894424f8                     mov        qword ptr [rsp - 8], rax
02bda 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02be1 89442458                       mov        dword ptr [rsp + 0x58], eax
02be5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bea 48894424f8                     mov        qword ptr [rsp - 8], rax
02bef 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02bf3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02bf7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bfc 89442460                       mov        dword ptr [rsp + 0x60], eax
02c00 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02c05 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02c09 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02c0e 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02c16 6690                           nop        
02c18 c5f877                         vzeroupper 
02c1b e8c0ddb5ff                     call       0x7f1e7f9d7d60
02c20 0f1f8400182d0029               nop        dword ptr [rax + rax + 0x29002d18]
02c28 bee4ffffff                     mov        esi, 0xffffffe4
02c2d 488b2c24                       mov        rbp, qword ptr [rsp]
02c31 48ffb42490000000               push       qword ptr [rsp + 0x90]
02c39 488f0424                       pop        qword ptr [rsp]
02c3d 48894424f8                     mov        qword ptr [rsp - 8], rax
02c42 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02c46 89442408                       mov        dword ptr [rsp + 8], eax
02c4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c4f 48ffb42498000000               push       qword ptr [rsp + 0x98]
02c57 488f442410                     pop        qword ptr [rsp + 0x10]
02c5c 48ff742420                     push       qword ptr [rsp + 0x20]
02c61 488f442418                     pop        qword ptr [rsp + 0x18]
02c66 48894424f8                     mov        qword ptr [rsp - 8], rax
02c6b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02c6f 8944240c                       mov        dword ptr [rsp + 0xc], eax
02c73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c78 48894424f8                     mov        qword ptr [rsp - 8], rax
02c7d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02c81 89442434                       mov        dword ptr [rsp + 0x34], eax
02c85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c8a 48ff742468                     push       qword ptr [rsp + 0x68]
02c8f 488f442438                     pop        qword ptr [rsp + 0x38]
02c94 48894424f8                     mov        qword ptr [rsp - 8], rax
02c99 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c9d 89442440                       mov        dword ptr [rsp + 0x40], eax
02ca1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ca6 48ff742478                     push       qword ptr [rsp + 0x78]
02cab 488f442450                     pop        qword ptr [rsp + 0x50]
02cb0 48894424f8                     mov        qword ptr [rsp - 8], rax
02cb5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02cb9 89442444                       mov        dword ptr [rsp + 0x44], eax
02cbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cc2 48894424f8                     mov        qword ptr [rsp - 8], rax
02cc7 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02cce 89442458                       mov        dword ptr [rsp + 0x58], eax
02cd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cd7 48894424f8                     mov        qword ptr [rsp - 8], rax
02cdc 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02ce0 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ce4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ce9 89442460                       mov        dword ptr [rsp + 0x60], eax
02ced 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02cf2 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02cf7 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02cfe c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02d07 90                             nop        
02d08 c5f877                         vzeroupper 
02d0b e8d0dcb5ff                     call       0x7f1e7f9d7d60
02d10 0f1f8400082e002a               nop        dword ptr [rax + rax + 0x2a002e08]
02d18 beccffffff                     mov        esi, 0xffffffcc
02d1d 488b2c24                       mov        rbp, qword ptr [rsp]
02d21 48894424f8                     mov        qword ptr [rsp - 8], rax
02d26 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02d2a 89442408                       mov        dword ptr [rsp + 8], eax
02d2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d33 48ff742420                     push       qword ptr [rsp + 0x20]
02d38 488f442418                     pop        qword ptr [rsp + 0x18]
02d3d 48894424f8                     mov        qword ptr [rsp - 8], rax
02d42 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02d46 8944240c                       mov        dword ptr [rsp + 0xc], eax
02d4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d4f 48894424f8                     mov        qword ptr [rsp - 8], rax
02d54 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02d58 89442438                       mov        dword ptr [rsp + 0x38], eax
02d5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d61 48ff742468                     push       qword ptr [rsp + 0x68]
02d66 488f442440                     pop        qword ptr [rsp + 0x40]
02d6b 48894424f8                     mov        qword ptr [rsp - 8], rax
02d70 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02d74 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02d78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d7d 48ffb42488000000               push       qword ptr [rsp + 0x88]
02d85 488f442448                     pop        qword ptr [rsp + 0x48]
02d8a 48ff742478                     push       qword ptr [rsp + 0x78]
02d8f 488f442450                     pop        qword ptr [rsp + 0x50]
02d94 48894424f8                     mov        qword ptr [rsp - 8], rax
02d99 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02d9d 89442458                       mov        dword ptr [rsp + 0x58], eax
02da1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02da6 48894424f8                     mov        qword ptr [rsp - 8], rax
02dab 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02db2 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02db6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dbb 48894424f8                     mov        qword ptr [rsp - 8], rax
02dc0 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02dc4 89442460                       mov        dword ptr [rsp + 0x60], eax
02dc8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dcd 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02dd2 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02dd6 89842488000000                 mov        dword ptr [rsp + 0x88], eax
02ddd 666690                         nop        
02de0 c5f877                         vzeroupper 
02de3 e8f8dbb5ff                     call       0x7f1e7f9d7d60
02de8 0f1f8400e02e002b               nop        dword ptr [rax + rax + 0x2b002ee0]
02df0 418bee                         mov        ebp, r14d
02df3 83c510                         add        ebp, 0x10
02df6 be6effffff                     mov        esi, 0xffffff6e
02dfb 48894424f8                     mov        qword ptr [rsp - 8], rax
02e00 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02e04 89442414                       mov        dword ptr [rsp + 0x14], eax
02e08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e0d 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02e12 48894424f8                     mov        qword ptr [rsp - 8], rax
02e17 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02e1b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02e1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e24 48ff742468                     push       qword ptr [rsp + 0x68]
02e29 488f442440                     pop        qword ptr [rsp + 0x40]
02e2e 48894424f8                     mov        qword ptr [rsp - 8], rax
02e33 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02e37 89442448                       mov        dword ptr [rsp + 0x48], eax
02e3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e40 48ff742478                     push       qword ptr [rsp + 0x78]
02e45 488f442458                     pop        qword ptr [rsp + 0x58]
02e4a 48894424f8                     mov        qword ptr [rsp - 8], rax
02e4f 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02e53 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e5c 48894424f8                     mov        qword ptr [rsp - 8], rax
02e61 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02e68 89442460                       mov        dword ptr [rsp + 0x60], eax
02e6c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e71 48894424f8                     mov        qword ptr [rsp - 8], rax
02e76 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02e7a 89442464                       mov        dword ptr [rsp + 0x64], eax
02e7e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e83 89442468                       mov        dword ptr [rsp + 0x68], eax
02e87 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02e8c 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02e93 90                             nop        
02e94 c5f877                         vzeroupper 
02e97 e844dbb5ff                     call       0x7f1e7f9d7d60
02e9c 0f1f8400942f002c               nop        dword ptr [rax + rax + 0x2c002f94]
02ea4 418bee                         mov        ebp, r14d
02ea7 83c510                         add        ebp, 0x10
02eaa be66ffffff                     mov        esi, 0xffffff66
02eaf 48894424f8                     mov        qword ptr [rsp - 8], rax
02eb4 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02eb8 89442414                       mov        dword ptr [rsp + 0x14], eax
02ebc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ec1 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02ec6 48894424f8                     mov        qword ptr [rsp - 8], rax
02ecb 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ecf 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02ed3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ed8 48ff742468                     push       qword ptr [rsp + 0x68]
02edd 488f442440                     pop        qword ptr [rsp + 0x40]
02ee2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ee7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02eeb 89442448                       mov        dword ptr [rsp + 0x48], eax
02eef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ef4 48ff742478                     push       qword ptr [rsp + 0x78]
02ef9 488f442458                     pop        qword ptr [rsp + 0x58]
02efe 48894424f8                     mov        qword ptr [rsp - 8], rax
02f03 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02f07 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02f0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f10 48894424f8                     mov        qword ptr [rsp - 8], rax
02f15 8b842480000000                 mov        eax, dword ptr [rsp + 0x80]
02f1c 89442460                       mov        dword ptr [rsp + 0x60], eax
02f20 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f25 48894424f8                     mov        qword ptr [rsp - 8], rax
02f2a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02f2e 89442464                       mov        dword ptr [rsp + 0x64], eax
02f32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f37 89442468                       mov        dword ptr [rsp + 0x68], eax
02f3b 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02f40 89942480000000                 mov        dword ptr [rsp + 0x80], edx
02f47 90                             nop        
02f48 c5f877                         vzeroupper 
02f4b e890dab5ff                     call       0x7f1e7f9d7d60
02f50 0f1f84004830002d               nop        dword ptr [rax + rax + 0x2d003048]
02f58 488bf0                         mov        rsi, rax
02f5b eb0d                           jmp        0x7f1e7fe7a2ea
02f5d 488bf0                         mov        rsi, rax
02f60 eb08                           jmp        0x7f1e7fe7a2ea
02f62 488bf0                         mov        rsi, rax
02f65 eb03                           jmp        0x7f1e7fe7a2ea
02f67 488bf0                         mov        rsi, rax
02f6a c5f877                         vzeroupper 
02f6d 4881c4f0000000                 add        rsp, 0xf0
02f74 5d                             pop        rbp
02f75 e96606b6ff                     jmp        0x7f1e7f9da960
02f7a bef6ffffff                     mov        esi, 0xfffffff6
02f7f 90                             nop        
02f80 c5f877                         vzeroupper 
02f83 e858dab5ff                     call       0x7f1e7f9d7d60
02f88 0f1f84008030002e               nop        dword ptr [rax + rax + 0x2e003080]
02f90 49ba1481e77f1e7f0000           movabs     r10, 0x7f1e7fe78114
02f9a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02fa1 e9ba8ba9ff                     jmp        0x7f1e7f912ee0
02fa6 e87557a8ff                     call       0x7f1e7f8ffaa0
02fab e97ed0ffff                     jmp        0x7f1e7fe773ae
