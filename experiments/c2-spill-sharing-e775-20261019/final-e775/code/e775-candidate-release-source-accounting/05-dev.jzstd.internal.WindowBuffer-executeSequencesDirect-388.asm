00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540cda9ff                   jne        0x7f60278fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8580240000                   jne        0x7f6027e600be
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742460                     mov        qword ptr [rsp + 0x60], rsi
00051 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00055 448b4e04                       mov        r9d, dword ptr [rsi + 4]
00059 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0005e 452bca                         sub        r9d, r10d
00061 8b9c24d0000000                 mov        ebx, dword ptr [rsp + 0xd0]
00068 413bd9                         cmp        ebx, r9d
0006b 0f8f531e0000                   jg         0x7f6027e5fac4
00071 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00075 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0007a 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007e 48638c24d0000000               movsxd     rcx, dword ptr [rsp + 0xd0]
00086 4d63ca                         movsxd     r9, r10d
00089 4c034c2420                     add        r9, qword ptr [rsp + 0x20]
0008e 4d2bc1                         sub        r8, r9
00091 493bc8                         cmp        rcx, r8
00094 0f8f2a1e0000                   jg         0x7f6027e5fac4
0009a 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
0009e 4c89442458                     mov        qword ptr [rsp + 0x58], r8
000a3 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000a7 4d85c0                         test       r8, r8
000aa 0f84bb120000                   je         0x7f6027e5ef6b
000b0 33d2                           xor        edx, edx
000b2 4d8bf3                         mov        r14, r11
000b5 418b7304                       mov        esi, dword ptr [r11 + 4]
000b9 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
000be 418b5b40                       mov        ebx, dword ptr [r11 + 0x40]
000c2 448bef                         mov        r13d, edi
000c5 85ff                           test       edi, edi
000c7 0f8ee7180000                   jle        0x7f6027e5f5b4
000cd 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
000d5 4c2b442420                     sub        r8, qword ptr [rsp + 0x20]
000da 448d4ee0                       lea        r9d, [rsi - 0x20]
000de 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
000e2 83c1e0                         add        ecx, -0x20
000e5 4c8bd8                         mov        r11, rax
000e8 458b5304                       mov        r10d, dword ptr [r11 + 4]
000ec 4585d2                         test       r10d, r10d
000ef 0f86e71d0000                   jbe        0x7f6027e5fadc
000f5 4d63d2                         movsxd     r10, r10d
000f8 4863ff                         movsxd     rdi, edi
000fb 48ffcf                         dec        rdi
000fe 493bfa                         cmp        rdi, r10
00101 0f83d51d0000                   jae        0x7f6027e5fadc
00107 85d2                           test       edx, edx
00109 0f84cd1d0000                   je         0x7f6027e5fadc
0010f 488b8424d8000000               mov        rax, qword ptr [rsp + 0xd8]
00117 8b7804                         mov        edi, dword ptr [rax + 4]
0011a 85ff                           test       edi, edi
0011c 0f86061e0000                   jbe        0x7f6027e5fb28
00122 83ff01                         cmp        edi, 1
00125 0f86fd1d0000                   jbe        0x7f6027e5fb28
0012b 83ff02                         cmp        edi, 2
0012e 0f86f41d0000                   jbe        0x7f6027e5fb28
00134 448d56f1                       lea        r10d, [rsi - 0xf]
00138 4585d2                         test       r10d, r10d
0013b 0f8ce71d0000                   jl         0x7f6027e5fb28
00141 8b6b04                         mov        ebp, dword ptr [rbx + 4]
00144 448d55f1                       lea        r10d, [rbp - 0xf]
00148 4585d2                         test       r10d, r10d
0014b 0f8cd71d0000                   jl         0x7f6027e5fb28
00151 448d55f9                       lea        r10d, [rbp - 7]
00155 4585d2                         test       r10d, r10d
00158 0f8cca1d0000                   jl         0x7f6027e5fb28
0015e 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00165 89bc24d4000000                 mov        dword ptr [rsp + 0xd4], edi
0016c 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00170 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00175 8954246c                       mov        dword ptr [rsp + 0x6c], edx
00179 4c89442470                     mov        qword ptr [rsp + 0x70], r8
0017e 4889442430                     mov        qword ptr [rsp + 0x30], rax
00183 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00188 44896c2408                     mov        dword ptr [rsp + 8], r13d
0018d 4c89742440                     mov        qword ptr [rsp + 0x40], r14
00192 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
00199 89b424dc000000                 mov        dword ptr [rsp + 0xdc], esi
001a0 4c8bd3                         mov        r10, rbx
001a3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a8 895c2448                       mov        dword ptr [rsp + 0x48], ebx
001ac 448d5ef1                       lea        r11d, [rsi - 0xf]
001b0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
001b5 448bc5                         mov        r8d, ebp
001b8 458d58f1                       lea        r11d, [r8 - 0xf]
001bc 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
001c1 458d50f9                       lea        r10d, [r8 - 7]
001c5 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001ca 4d63d0                         movsxd     r10, r8d
001cd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
001d2 4983c2f9                       add        r10, -7
001d6 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001de 4533d2                         xor        r10d, r10d
001e1 4533c9                         xor        r9d, r9d
001e4 e9ea030000                     jmp        0x7f6027e5e1d3
001e9 448bdd                         mov        r11d, ebp
001ec 4d63d3                         movsxd     r10, r11d
001ef 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001f6 c442a8f5db                     bzhi       r11, r11, r10
001fb c4c1fb92fb                     kmovq      k7, r11
00200 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00206 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0020c 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00214 4403d5                         add        r10d, ebp
00217 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0021f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00223 418502                         test       dword ptr [r10], eax
00226 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0022e 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00236 0f8d24090000                   jge        0x7f6027e5e760
0023c 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00244 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0024c 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
00254 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0025c 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00263 2bac248c000000                 sub        ebp, dword ptr [rsp + 0x8c]
0026a 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
00271 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00279 410f4feb                       cmovg      ebp, r11d
0027d 458bda                         mov        r11d, r10d
00280 4585d2                         test       r10d, r10d
00283 0f8cb3160000                   jl         0x7f6027e5f53c
00289 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00291 4585d2                         test       r10d, r10d
00294 0f8ca2160000                   jl         0x7f6027e5f53c
0029a 458d042b                       lea        r8d, [r11 + rbp]
0029e 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
002a6 453bd0                         cmp        r10d, r8d
002a9 0f828d160000                   jb         0x7f6027e5f53c
002af 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
002b7 4403ed                         add        r13d, ebp
002ba 453bd5                         cmp        r10d, r13d
002bd 0f8279160000                   jb         0x7f6027e5f53c
002c3 85ed                           test       ebp, ebp
002c5 0f8c71160000                   jl         0x7f6027e5f53c
002cb 85ed                           test       ebp, ebp
002cd 0f8439ffffff                   je         0x7f6027e5de0c
002d3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
002d8 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
002e0 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
002e5 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
002ea 4863d5                         movsxd     rdx, ebp
002ed 4883fa20                       cmp        rdx, 0x20
002f1 0f86f2feffff                   jbe        0x7f6027e5dde9
002f7 c5f877                         vzeroupper 
002fa 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00304 41ffd2                         call       r10
00307 0f1f840000000000               nop        dword ptr [rax + rax]
0030f e9f8feffff                     jmp        0x7f6027e5de0c
00314 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0031b 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00323 4503c3                         add        r8d, r11d
00326 e982020000                     jmp        0x7f6027e5e1ad
0032b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00330 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00335 458bd3                         mov        r10d, r11d
00338 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00340 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00345 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0034d 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
00355 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0035d 4963db                         movsxd     rbx, r11d
00360 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00368 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00370 0f8c6c050000                   jl         0x7f6027e5e4e2
00376 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0037e 4183fb30                       cmp        r11d, 0x30
00382 0f8ea3000000                   jle        0x7f6027e5e02b
00388 4585c0                         test       r8d, r8d
0038b 0f8c27150000                   jl         0x7f6027e5f4b8
00391 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00399 4585db                         test       r11d, r11d
0039c 0f8c16150000                   jl         0x7f6027e5f4b8
003a2 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003aa 4503d0                         add        r10d, r8d
003ad 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
003b5 453bca                         cmp        r9d, r10d
003b8 0f82fa140000                   jb         0x7f6027e5f4b8
003be 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
003c6 0f82ec140000                   jb         0x7f6027e5f4b8
003cc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003d4 4585d2                         test       r10d, r10d
003d7 0f84c0010000                   je         0x7f6027e5e19d
003dd 4963d2                         movsxd     rdx, r10d
003e0 4883fa20                       cmp        rdx, 0x20
003e4 7728                           ja         0x7f6027e5e00e
003e6 458bda                         mov        r11d, r10d
003e9 4d63d3                         movsxd     r10, r11d
003ec 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003f3 c442a8f5db                     bzhi       r11, r11, r10
003f8 c4c1fb92fb                     kmovq      k7, r11
003fd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00403 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00409 e98f010000                     jmp        0x7f6027e5e19d
0040e c5f877                         vzeroupper 
00411 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
0041b 41ffd2                         call       r10
0041e 0f1f840000000000               nop        dword ptr [rax + rax]
00426 e972010000                     jmp        0x7f6027e5e19d
0042b 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
00430 0f837e120000                   jae        0x7f6027e5f2b4
00436 4963d0                         movsxd     rdx, r8d
00439 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0043e 498b4c1208                     mov        rcx, qword ptr [r10 + rdx + 8]
00443 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0044b 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00450 0f83d6120000                   jae        0x7f6027e5f32c
00456 458d4a08                       lea        r9d, [r10 + 8]
0045a 4963fa                         movsxd     rdi, r10d
0045d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00462 49894c3b08                     mov        qword ptr [r11 + rdi + 8], rcx
00467 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
0046f 0f8d28010000                   jge        0x7f6027e5e19d
00475 482bd7                         sub        rdx, rdi
00478 4963c9                         movsxd     rcx, r9d
0047b 4c8d1c11                       lea        r11, [rcx + rdx]
0047f 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00487 0f831b130000                   jae        0x7f6027e5f3a8
0048d 4c8bdb                         mov        r11, rbx
00490 4c2bd9                         sub        r11, rcx
00493 4983c307                       add        r11, 7
00497 4983e3f8                       and        r11, 0xfffffffffffffff8
0049b 418bcb                         mov        ecx, r11d
0049e 468d5c1108                     lea        r11d, [rcx + r10 + 8]
004a3 4d63db                         movsxd     r11, r11d
004a6 498d4c13f8                     lea        rcx, [r11 + rdx - 8]
004ab 483b8c2480000000               cmp        rcx, qword ptr [rsp + 0x80]
004b3 0f83ef120000                   jae        0x7f6027e5f3a8
004b9 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
004be 0f83e4120000                   jae        0x7f6027e5f3a8
004c4 4983c3f8                       add        r11, -8
004c8 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
004d0 0f83d2120000                   jae        0x7f6027e5f3a8
004d6 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
004de 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004e5 0f8f45130000                   jg         0x7f6027e5f430
004eb 452bc2                         sub        r8d, r10d
004ee 4183c210                       add        r10d, 0x10
004f2 438d0c08                       lea        ecx, [r8 + r9]
004f6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
004fb 498b7c0b08                     mov        rdi, qword ptr [r11 + rcx + 8]
00500 418bc9                         mov        ecx, r9d
00503 49897c0b08                     mov        qword ptr [r11 + rcx + 8], rdi
00508 4183c108                       add        r9d, 8
0050c 453bca                         cmp        r9d, r10d
0050f 7ce1                           jl         0x7f6027e5e0f2
00511 4883c3f8                       add        rbx, -8
00515 4881fb00000080                 cmp        rbx, -0x80000000
0051c 49c7c200000080                 mov        r10, 0xffffffff80000000
00523 490f4cda                       cmovl      rbx, r10
00527 8bdb                           mov        ebx, ebx
00529 443bcb                         cmp        r9d, ebx
0052c 7d3b                           jge        0x7f6027e5e169
0052e 6690                           nop        
00530 438d0c08                       lea        ecx, [r8 + r9]
00534 458bd9                         mov        r11d, r9d
00537 4963fb                         movsxd     rdi, r11d
0053a 8bd1                           mov        edx, ecx
0053c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00541 4d8b5c1308                     mov        r11, qword ptr [r11 + rdx + 8]
00546 4863c9                         movsxd     rcx, ecx
00549 418bd1                         mov        edx, r9d
0054c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00551 4d895c1208                     mov        qword ptr [r10 + rdx + 8], r11
00556 4d8b5c0a10                     mov        r11, qword ptr [r10 + rcx + 0x10]
0055b 4d895c3a10                     mov        qword ptr [r10 + rdi + 0x10], r11
00560 4183c110                       add        r9d, 0x10
00564 443bcb                         cmp        r9d, ebx
00567 7cc7                           jl         0x7f6027e5e130
00569 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
00571 7d2a                           jge        0x7f6027e5e19d
00573 90                             nop        
00574 478d1c08                       lea        r11d, [r8 + r9]
00578 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0057d 4b8b4c1a08                     mov        rcx, qword ptr [r10 + r11 + 8]
00582 458bd1                         mov        r10d, r9d
00585 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0058a 4b894c1308                     mov        qword ptr [r11 + r10 + 8], rcx
0058f 4183c108                       add        r9d, 8
00593 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
0059b 7cd7                           jl         0x7f6027e5e174
0059d 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
005a5 4403842488000000               add        r8d, dword ptr [rsp + 0x88]
005ad 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
005b5 41ffc1                         inc        r9d
005b8 443b4c2408                     cmp        r9d, dword ptr [rsp + 8]
005bd 0f8dcf050000                   jge        0x7f6027e5e792
005c3 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
005cb 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
005d3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
005d8 4b8b4ccb08                     mov        rcx, qword ptr [r11 + r9*8 + 8]
005dd 448bd9                         mov        r11d, ecx
005e0 4181e3ffff0100                 and        r11d, 0x1ffff
005e7 418bc3                         mov        eax, r11d
005ea 4c8bd9                         mov        r11, rcx
005ed 49c1eb12                       shr        r11, 0x12
005f1 48c1f924                       sar        rcx, 0x24
005f5 458bc3                         mov        r8d, r11d
005f8 448bd9                         mov        r11d, ecx
005fb 418bfb                         mov        edi, r11d
005fe 4181e0ffff0300                 and        r8d, 0x3ffff
00605 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
0060d 4585db                         test       r11d, r11d
00610 0f8cea0e0000                   jl         0x7f6027e5f100
00616 448bd8                         mov        r11d, eax
00619 4585db                         test       r11d, r11d
0061c 0f85da010000                   jne        0x7f6027e5e3fc
00622 4533db                         xor        r11d, r11d
00625 418bc3                         mov        eax, r11d
00628 448bdf                         mov        r11d, edi
0062b 4183fb03                       cmp        r11d, 3
0062f 0f8ef7010000                   jle        0x7f6027e5e42c
00635 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0063a 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
0063e 45894310                       mov        dword ptr [r11 + 0x10], r8d
00642 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00646 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0064b 4589580c                       mov        dword ptr [r8 + 0xc], r11d
0064f 448d5ffd                       lea        r11d, [rdi - 3]
00653 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
0065b 4d8bd8                         mov        r11, r8
0065e 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00666 45894308                       mov        dword ptr [r11 + 8], r8d
0066a 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
00672 48639c248c000000               movsxd     rbx, dword ptr [rsp + 0x8c]
0067a 488beb                         mov        rbp, rbx
0067d 4c638c2494000000               movsxd     r9, dword ptr [rsp + 0x94]
00685 4c034c2420                     add        r9, qword ptr [rsp + 0x20]
0068a 4863d0                         movsxd     rdx, eax
0068d 4c03ca                         add        r9, rdx
00690 493bd9                         cmp        rbx, r9
00693 0f8fcf0e0000                   jg         0x7f6027e5f168
00699 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
006a1 4585db                         test       r11d, r11d
006a4 0f8e360e0000                   jle        0x7f6027e5f0e0
006aa 448bac2494000000               mov        r13d, dword ptr [rsp + 0x94]
006b2 4403e8                         add        r13d, eax
006b5 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
006bd 4503dd                         add        r11d, r13d
006c0 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
006c5 0f8f150f0000                   jg         0x7f6027e5f1e0
006cb 458d0402                       lea        r8d, [r10 + rax]
006cf 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
006d7 443b442438                     cmp        r8d, dword ptr [rsp + 0x38]
006dc 0f8f760f0000                   jg         0x7f6027e5f258
006e2 83f810                         cmp        eax, 0x10
006e5 0f8f56050000                   jg         0x7f6027e5e841
006eb 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
006f0 0f83940c0000                   jae        0x7f6027e5ef8a
006f6 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
006fb c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00702 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0070a 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
0070f 0f83e70c0000                   jae        0x7f6027e5effc
00715 468d0410                       lea        r8d, [rax + r10]
00719 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00721 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00726 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
0072d 468d1418                       lea        r10d, [rax + r11]
00731 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00739 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00741 442b84248c000000               sub        r8d, dword ptr [rsp + 0x8c]
00749 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00751 4183fb10                       cmp        r11d, 0x10
00755 0f8fd0fbffff                   jg         0x7f6027e5df2b
0075b 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00763 4183fa10                       cmp        r10d, 0x10
00767 0f8cbefbffff                   jl         0x7f6027e5df2b
0076d 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
00772 0f83040d0000                   jae        0x7f6027e5f07c
00778 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0077d c4817a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 8]
00784 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0078c 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00791 0f827dfbffff                   jb         0x7f6027e5df14
00797 bee4ffffff                     mov        esi, 0xffffffe4
0079c 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
007a1 448b1424                       mov        r10d, dword ptr [rsp]
007a5 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
007ad 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
007b2 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
007ba 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
007bf 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
007c7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007cc 4c891424                       mov        qword ptr [rsp], r10
007d0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
007d5 4489542408                     mov        dword ptr [rsp + 8], r10d
007da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
007e4 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
007ea 6690                           nop        
007ec c5f877                         vzeroupper 
007ef e86c52b6ff                     call       0x7f60279c3660
007f4 0f1f8400ec080001               nop        dword ptr [rax + rax + 0x10008ec]
007fc 448b0424                       mov        r8d, dword ptr [rsp]
00800 452bc2                         sub        r8d, r10d
00803 453bd8                         cmp        r11d, r8d
00806 0f8e1cfeffff                   jle        0x7f6027e5e228
0080c be45ffffff                     mov        esi, 0xffffff45
00811 418beb                         mov        ebp, r11d
00814 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0081c c5f877                         vzeroupper 
0081f e83c52b6ff                     call       0x7f60279c3660
00824 0f1f84001c090002               nop        dword ptr [rax + rax + 0x200091c]
0082c 85c0                           test       eax, eax
0082e 7407                           je         0x7f6027e5e437
00830 448d5fff                       lea        r11d, [rdi - 1]
00834 418bfb                         mov        edi, r11d
00837 85ff                           test       edi, edi
00839 0f8486000000                   je         0x7f6027e5e4c5
0083f 83ff03                         cmp        edi, 3
00842 0f8474120000                   je         0x7f6027e5f6bc
00848 83ff02                         cmp        edi, 2
0084b 0f87db120000                   ja         0x7f6027e5f72c
00851 3bbc24d4000000                 cmp        edi, dword ptr [rsp + 0xd4]
00858 0f836f110000                   jae        0x7f6027e5f5cd
0085e 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00863 418b5cb808                     mov        ebx, dword ptr [r8 + rdi*4 + 8]
00868 85ff                           test       edi, edi
0086a 7e46                           jle        0x7f6027e5e4b2
0086c 448d5fff                       lea        r11d, [rdi - 1]
00870 443b9c24d4000000               cmp        r11d, dword ptr [rsp + 0xd4]
00878 0f83ca110000                   jae        0x7f6027e5f648
0087e 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
00886 66660f1f840000000000           nop        word ptr [rax + rax]
00890 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00895 458b44b804                     mov        r8d, dword ptr [r8 + rdi*4 + 4]
0089a 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
0089f 458944b908                     mov        dword ptr [r9 + rdi*4 + 8], r8d
008a4 448d5fff                       lea        r11d, [rdi - 1]
008a8 418bfb                         mov        edi, r11d
008ab 4585db                         test       r11d, r11d
008ae 7fe0                           jg         0x7f6027e5e490
008b0 eb08                           jmp        0x7f6027e5e4ba
008b2 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
008ba 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
008bf 41895b08                       mov        dword ptr [r11 + 8], ebx
008c3 eb11                           jmp        0x7f6027e5e4d6
008c5 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
008ca 418b5b08                       mov        ebx, dword ptr [r11 + 8]
008ce 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
008d6 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
008dd e990fdffff                     jmp        0x7f6027e5e272
008e2 4183fa10                       cmp        r10d, 0x10
008e6 0f8d80150000                   jge        0x7f6027e5fa6c
008ec 4183fa08                       cmp        r10d, 8
008f0 0f8d23070000                   jge        0x7f6027e5ec19
008f6 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
008fe 4183fa10                       cmp        r10d, 0x10
00902 0f8ec6000000                   jle        0x7f6027e5e5ce
00908 4585c0                         test       r8d, r8d
0090b 0f8ce3140000                   jl         0x7f6027e5f9f4
00911 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00919 4585db                         test       r11d, r11d
0091c 0f8cd2140000                   jl         0x7f6027e5f9f4
00922 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
0092a 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00932 0f82bc140000                   jb         0x7f6027e5f9f4
00938 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00940 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
00948 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00950 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00958 0f8296140000                   jb         0x7f6027e5f9f4
0095e 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00966 4585db                         test       r11d, r11d
00969 0f8c85140000                   jl         0x7f6027e5f9f4
0096f 4585db                         test       r11d, r11d
00972 0f84ccf8ffff                   je         0x7f6027e5de44
00978 488bdd                         mov        rbx, rbp
0097b 4883fb20                       cmp        rbx, 0x20
0097f 772d                           ja         0x7f6027e5e5ae
00981 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00989 4d63d2                         movsxd     r10, r10d
0098c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00993 c442a8f5db                     bzhi       r11, r11, r10
00998 c4c1fb92fb                     kmovq      k7, r11
0099d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009a3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009a9 e996f8ffff                     jmp        0x7f6027e5de44
009ae 488bd3                         mov        rdx, rbx
009b1 c5f877                         vzeroupper 
009b4 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
009be 41ffd2                         call       r10
009c1 0f1f840000000000               nop        dword ptr [rax + rax]
009c9 e976f8ffff                     jmp        0x7f6027e5de44
009ce 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
009d6 0f83c0110000                   jae        0x7f6027e5f79c
009dc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
009e1 430fbe6c0308                   movsx      ebp, byte ptr [r11 + r8 + 8]
009e7 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009ef 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
009f7 0f8317120000                   jae        0x7f6027e5f814
009fd 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00a02 43886c1908                     mov        byte ptr [r9 + r11 + 8], bpl
00a07 458d5803                       lea        r11d, [r8 + 3]
00a0b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00a13 41ffc2                         inc        r10d
00a16 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00a1e 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
00a26 0f8364120000                   jae        0x7f6027e5f890
00a2c 4d63d0                         movsxd     r10, r8d
00a2f 430fbe6c1109                   movsx      ebp, byte ptr [r9 + r10 + 9]
00a35 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00a3d 4183c103                       add        r9d, 3
00a41 443b8c24d8000000               cmp        r9d, dword ptr [rsp + 0xd8]
00a49 0f83c1120000                   jae        0x7f6027e5f910
00a4f 4c638c2494000000               movsxd     r9, dword ptr [rsp + 0x94]
00a57 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00a5c 43886c0b09                     mov        byte ptr [r11 + r9 + 9], bpl
00a61 470fbe5c130a                   movsx      r11d, byte ptr [r11 + r10 + 0xa]
00a67 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00a6b 46885c0b0a                     mov        byte ptr [rbx + r9 + 0xa], r11b
00a70 460fbe5c130b                   movsx      r11d, byte ptr [rbx + r10 + 0xb]
00a76 46885c0b0b                     mov        byte ptr [rbx + r9 + 0xb], r11b
00a7b 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00a83 4183fb08                       cmp        r11d, 8
00a87 0f83ff120000                   jae        0x7f6027e5f98c
00a8d 49bb083827e300000000           movabs     r11, 0xe3273808
00a97 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00a9f 4703449308                     add        r8d, dword ptr [r11 + r10*4 + 8]
00aa4 4489442404                     mov        dword ptr [rsp + 4], r8d
00aa9 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00ab1 4183fa04                       cmp        r10d, 4
00ab5 7e41                           jle        0x7f6027e5e6f8
00ab7 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00abe 83c504                         add        ebp, 4
00ac1 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00ac6 418bd0                         mov        edx, r8d
00ac9 666690                         nop        
00acc c5f877                         vzeroupper 
00acf e88cd1a9ff                     call       0x7f60278fb860
00ad4 0f1f8400cc0b0003               nop        dword ptr [rax + rax + 0x3000bcc]
00adc 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00ae1 8bd5                           mov        edx, ebp
00ae3 8bc8                           mov        ecx, eax
00ae5 666690                         nop        
00ae8 c5f877                         vzeroupper 
00aeb e870d1a9ff                     call       0x7f60278fb860
00af0 0f1f8400e80b0004               nop        dword ptr [rax + rax + 0x4000be8]
00af8 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b00 4183fa08                       cmp        r10d, 8
00b04 7e5a                           jle        0x7f6027e5e760
00b06 8b542404                       mov        edx, dword ptr [rsp + 4]
00b0a 49ba303827e300000000           movabs     r10, 0xe3273830
00b14 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00b1c 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00b21 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00b28 83c508                         add        ebp, 8
00b2b 83c208                         add        edx, 8
00b2e 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b33 90                             nop        
00b34 c5f877                         vzeroupper 
00b37 e824d1a9ff                     call       0x7f60278fb860
00b3c 0f1f8400340c0005               nop        dword ptr [rax + rax + 0x5000c34]
00b44 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b49 8bd5                           mov        edx, ebp
00b4b 488bc8                         mov        rcx, rax
00b4e 6690                           nop        
00b50 c5f877                         vzeroupper 
00b53 e808d1a9ff                     call       0x7f60278fb860
00b58 0f1f8400500c0006               nop        dword ptr [rax + rax + 0x6000c50]
00b60 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00b68 e940faffff                     jmp        0x7f6027e5e1ad
00b6d 4d63d2                         movsxd     r10, r10d
00b70 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b77 c442a8f5db                     bzhi       r11, r11, r10
00b7c c4c1fb92fb                     kmovq      k7, r11
00b81 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b87 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b8d e990000000                     jmp        0x7f6027e5e822
00b92 448b1424                       mov        r10d, dword ptr [rsp]
00b96 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00b9e 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00ba6 4585db                         test       r11d, r11d
00ba9 0f8ccd130000                   jl         0x7f6027e5fb7c
00baf 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
00bb4 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00bbb 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00bbf 4585c0                         test       r8d, r8d
00bc2 0f8cbd130000                   jl         0x7f6027e5fb85
00bc8 3b3424                         cmp        esi, dword ptr [rsp]
00bcb 0f82b4130000                   jb         0x7f6027e5fb85
00bd1 448b4b04                       mov        r9d, dword ptr [rbx + 4]
00bd5 438d2c10                       lea        ebp, [r8 + r10]
00bd9 443bcd                         cmp        r9d, ebp
00bdc 0f82a3130000                   jb         0x7f6027e5fb85
00be2 4585d2                         test       r10d, r10d
00be5 0f8c9a130000                   jl         0x7f6027e5fb85
00beb 4585d2                         test       r10d, r10d
00bee 7432                           je         0x7f6027e5e822
00bf0 4b8d7c1e08                     lea        rdi, [r14 + r11 + 8]
00bf5 4c8bdb                         mov        r11, rbx
00bf8 4a8d740308                     lea        rsi, [rbx + r8 + 8]
00bfd 4963d2                         movsxd     rdx, r10d
00c00 4883fa20                       cmp        rdx, 0x20
00c04 0f8663ffffff                   jbe        0x7f6027e5e76d
00c0a c5f877                         vzeroupper 
00c0d 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00c17 41ffd2                         call       r10
00c1a 0f1f840000000000               nop        dword ptr [rax + rax]
00c22 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00c27 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00c2b c5f877                         vzeroupper 
00c2e 4881c4c0000000                 add        rsp, 0xc0
00c35 5d                             pop        rbp
00c36 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c3a 0f8768180000                   ja         0x7f6027e600a8
00c40 c3                             ret        
00c41 83f830                         cmp        eax, 0x30
00c44 0f8ea9000000                   jle        0x7f6027e5e8f3
00c4a 4585d2                         test       r10d, r10d
00c4d 0f8c8d160000                   jl         0x7f6027e5fee0
00c53 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00c5b 4585c9                         test       r9d, r9d
00c5e 0f8c84160000                   jl         0x7f6027e5fee8
00c64 448b8424d0000000               mov        r8d, dword ptr [rsp + 0xd0]
00c6c 443b842490000000               cmp        r8d, dword ptr [rsp + 0x90]
00c74 0f826e160000                   jb         0x7f6027e5fee8
00c7a 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
00c82 453bdd                         cmp        r11d, r13d
00c85 0f825d160000                   jb         0x7f6027e5fee8
00c8b 85c0                           test       eax, eax
00c8d 743d                           je         0x7f6027e5e8cc
00c8f 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00c94 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00c99 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c9e 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00ca3 4883fa20                       cmp        rdx, 0x20
00ca7 7730                           ja         0x7f6027e5e8d9
00ca9 448bd0                         mov        r10d, eax
00cac 4d63d2                         movsxd     r10, r10d
00caf 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cb6 c442a8f5db                     bzhi       r11, r11, r10
00cbb c4c1fb92fb                     kmovq      k7, r11
00cc0 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cc6 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ccc 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
00cd4 e960faffff                     jmp        0x7f6027e5e339
00cd9 c5f877                         vzeroupper 
00cdc 49ba204f8e27607f0000           movabs     r10, 0x7f60278e4f20
00ce6 41ffd2                         call       r10
00ce9 0f1f840000000000               nop        dword ptr [rax + rax]
00cf1 ebd9                           jmp        0x7f6027e5e8cc
00cf3 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00cf8 0f83ce140000                   jae        0x7f6027e5fdcc
00cfe 4d63c2                         movsxd     r8, r10d
00d01 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00d06 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00d0d 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00d15 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00d1a 0f8330150000                   jae        0x7f6027e5fe50
00d20 418d7310                       lea        esi, [r11 + 0x10]
00d24 89b42490000000                 mov        dword ptr [rsp + 0x90], esi
00d2b 4963cb                         movsxd     rcx, r11d
00d2e 8b742448                       mov        esi, dword ptr [rsp + 0x48]
00d32 c5fa7f440e08                   vmovdqu    xmmword ptr [rsi + rcx + 8], xmm0
00d38 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00d40 453bcd                         cmp        r9d, r13d
00d43 0f8db7020000                   jge        0x7f6027e5ec00
00d49 4c2bc1                         sub        r8, rcx
00d4c 4963f9                         movsxd     rdi, r9d
00d4f 48638c24dc000000               movsxd     rcx, dword ptr [rsp + 0xdc]
00d57 4883c1f1                       add        rcx, -0xf
00d5b 4a8d1c07                       lea        rbx, [rdi + r8]
00d5f 483bd9                         cmp        rbx, rcx
00d62 0f8300160000                   jae        0x7f6027e5ff68
00d68 4963dd                         movsxd     rbx, r13d
00d6b 488bd3                         mov        rdx, rbx
00d6e 482bd7                         sub        rdx, rdi
00d71 4883c20f                       add        rdx, 0xf
00d75 4883e2f0                       and        rdx, 0xfffffffffffffff0
00d79 8bf2                           mov        esi, edx
00d7b 428d741e10                     lea        esi, [rsi + r11 + 0x10]
00d80 4863fe                         movsxd     rdi, esi
00d83 4e8d4407f0                     lea        r8, [rdi + r8 - 0x10]
00d88 4c3bc1                         cmp        r8, rcx
00d8b 0f83d7150000                   jae        0x7f6027e5ff68
00d91 443b4c2478                     cmp        r9d, dword ptr [rsp + 0x78]
00d96 0f83cc150000                   jae        0x7f6027e5ff68
00d9c 4883c7f0                       add        rdi, -0x10
00da0 4c8b442428                     mov        r8, qword ptr [rsp + 0x28]
00da5 4983c0f1                       add        r8, -0xf
00da9 493bf8                         cmp        rdi, r8
00dac 0f83b6150000                   jae        0x7f6027e5ff68
00db2 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00db9 0f8f1d160000                   jg         0x7f6027e5ffdc
00dbf 418bca                         mov        ecx, r10d
00dc2 412bcb                         sub        ecx, r11d
00dc5 4183c320                       add        r11d, 0x20
00dc9 666690                         nop        
00dcc 448bc1                         mov        r8d, ecx
00dcf 4403842490000000               add        r8d, dword ptr [rsp + 0x90]
00dd7 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
00ddc c4817a6f440108                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 8]
00de3 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00deb 8b7c2448                       mov        edi, dword ptr [rsp + 0x48]
00def c4a17a7f440f08                 vmovdqu    xmmword ptr [rdi + r9 + 8], xmm0
00df6 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00dfe 4183c010                       add        r8d, 0x10
00e02 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e0a 458bc8                         mov        r9d, r8d
00e0d 453bc3                         cmp        r8d, r11d
00e10 7cba                           jl         0x7f6027e5e9cc
00e12 4881c310ffffff                 add        rbx, -0xf0
00e19 4881fb00000080                 cmp        rbx, -0x80000000
00e20 49c7c300000080                 mov        r11, 0xffffffff80000000
00e27 490f4cdb                       cmovl      rbx, r11
00e2b 448bc3                         mov        r8d, ebx
00e2e 453bc8                         cmp        r9d, r8d
00e31 0f8d8a010000                   jge        0x7f6027e5ebc1
00e37 458bd9                         mov        r11d, r9d
00e3a 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00e42 0f1f8000000000                 nop        dword ptr [rax]
00e49 0f1f8000000000                 nop        dword ptr [rax]
00e50 448bc9                         mov        r9d, ecx
00e53 44038c2490000000               add        r9d, dword ptr [rsp + 0x90]
00e5b 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00e63 4963db                         movsxd     rbx, r11d
00e66 418bf9                         mov        edi, r9d
00e69 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00e6e c4c17a6f443b08                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 8]
00e75 4963f9                         movsxd     rdi, r9d
00e78 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00e80 8b542448                       mov        edx, dword ptr [rsp + 0x48]
00e84 c4a17a7f441a08                 vmovdqu    xmmword ptr [rdx + r11 + 8], xmm0
00e8b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00e90 c4c17a6f443b18                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x18]
00e97 c5fa7f441a18                   vmovdqu    xmmword ptr [rdx + rbx + 0x18], xmm0
00e9d c4c17a6f443b28                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x28]
00ea4 c5fa7f441a28                   vmovdqu    xmmword ptr [rdx + rbx + 0x28], xmm0
00eaa 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00eaf c4c17a6f443b38                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x38]
00eb6 c5fa7f441a38                   vmovdqu    xmmword ptr [rdx + rbx + 0x38], xmm0
00ebc c4c17a6f443b48                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x48]
00ec3 c5fa7f441a48                   vmovdqu    xmmword ptr [rdx + rbx + 0x48], xmm0
00ec9 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00ece c4c17a6f443b58                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x58]
00ed5 c5fa7f441a58                   vmovdqu    xmmword ptr [rdx + rbx + 0x58], xmm0
00edb c4c17a6f443b68                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x68]
00ee2 c5fa7f441a68                   vmovdqu    xmmword ptr [rdx + rbx + 0x68], xmm0
00ee8 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00eed c4c17a6f443b78                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x78]
00ef4 c5fa7f441a78                   vmovdqu    xmmword ptr [rdx + rbx + 0x78], xmm0
00efa c4c17a6f843b88000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x88]
00f04 c5fa7f841a88000000             vmovdqu    xmmword ptr [rdx + rbx + 0x88], xmm0
00f0d c4c17a6f843b98000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x98]
00f17 c5fa7f841a98000000             vmovdqu    xmmword ptr [rdx + rbx + 0x98], xmm0
00f20 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00f25 c4c17a6f843ba8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xa8]
00f2f c5fa7f841aa8000000             vmovdqu    xmmword ptr [rdx + rbx + 0xa8], xmm0
00f38 c4c17a6f843bb8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xb8]
00f42 c5fa7f841ab8000000             vmovdqu    xmmword ptr [rdx + rbx + 0xb8], xmm0
00f4b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00f50 c4c17a6f843bc8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xc8]
00f5a c5fa7f841ac8000000             vmovdqu    xmmword ptr [rdx + rbx + 0xc8], xmm0
00f63 c4c17a6f843bd8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xd8]
00f6d c5fa7f841ad8000000             vmovdqu    xmmword ptr [rdx + rbx + 0xd8], xmm0
00f76 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00f7b c4c17a6f843be8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xe8]
00f85 c5fa7f841ae8000000             vmovdqu    xmmword ptr [rdx + rbx + 0xe8], xmm0
00f8e c4c17a6f843bf8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xf8]
00f98 c5fa7f841af8000000             vmovdqu    xmmword ptr [rdx + rbx + 0xf8], xmm0
00fa1 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00fa9 4181c100010000                 add        r9d, 0x100
00fb0 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00fb8 453bc8                         cmp        r9d, r8d
00fbb 0f8c8ffeffff                   jl         0x7f6027e5ea50
00fc1 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00fc9 453bdd                         cmp        r11d, r13d
00fcc 7d32                           jge        0x7f6027e5ec00
00fce 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00fd6 6690                           nop        
00fd8 468d1c09                       lea        r11d, [rcx + r9]
00fdc 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00fe1 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00fe8 458bc1                         mov        r8d, r9d
00feb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ff0 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00ff7 4183c110                       add        r9d, 0x10
00ffb 453bcd                         cmp        r9d, r13d
00ffe 7cd8                           jl         0x7f6027e5ebd8
01000 468d1c10                       lea        r11d, [rax + r10]
01004 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0100c 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01014 e920f7ffff                     jmp        0x7f6027e5e339
01019 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
0101e 0f83980f0000                   jae        0x7f6027e5fbbc
01024 4963c8                         movsxd     rcx, r8d
01027 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0102c 4d8b540b08                     mov        r10, qword ptr [r11 + rcx + 8]
01031 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
01039 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01041 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
01046 0f83e80f0000                   jae        0x7f6027e5fc34
0104c 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01054 418d6b08                       lea        ebp, [r11 + 8]
01058 4d63cb                         movsxd     r9, r11d
0105b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01060 488bbc24a0000000               mov        rdi, qword ptr [rsp + 0xa0]
01068 4b897c0a08                     mov        qword ptr [r10 + r9 + 8], rdi
0106d 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01074 0f8de4020000                   jge        0x7f6027e5ef5e
0107a 492bc9                         sub        rcx, r9
0107d 4863fd                         movsxd     rdi, ebp
01080 4c8d140f                       lea        r10, [rdi + rcx]
01084 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0108c 0f830e100000                   jae        0x7f6027e5fca0
01092 4c8bd3                         mov        r10, rbx
01095 4c2bd7                         sub        r10, rdi
01098 4983c207                       add        r10, 7
0109c 4983e2f8                       and        r10, 0xfffffffffffffff8
010a0 458bd2                         mov        r10d, r10d
010a3 478d4c1a08                     lea        r9d, [r10 + r11 + 8]
010a8 4d63d1                         movsxd     r10, r9d
010ab 4d8d4c0af8                     lea        r9, [r10 + rcx - 8]
010b0 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
010b8 0f83e20f0000                   jae        0x7f6027e5fca0
010be 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
010c2 0f83d80f0000                   jae        0x7f6027e5fca0
010c8 4983c2f8                       add        r10, -8
010cc 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
010d4 0f83c60f0000                   jae        0x7f6027e5fca0
010da b9f8ffffff                     mov        ecx, 0xfffffff8
010df 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
010e4 458bd1                         mov        r10d, r9d
010e7 412bca                         sub        ecx, r10d
010ea 412bcb                         sub        ecx, r11d
010ed 83c1f0                         add        ecx, -0x10
010f0 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
010f5 498bd2                         mov        rdx, r10
010f8 458d5310                       lea        r10d, [r11 + 0x10]
010fc 4d63d2                         movsxd     r10, r10d
010ff 41b906000000                   mov        r9d, 6
01105 c462b0f5c9                     bzhi       r9, rcx, r9
0110a 4d03d1                         add        r10, r9
0110d 4c3bd3                         cmp        r10, rbx
01110 488bcb                         mov        rcx, rbx
01113 490f4cca                       cmovl      rcx, r10
01117 4c8bd1                         mov        r10, rcx
0111a 4c2bd7                         sub        r10, rdi
0111d 4d8d4aff                       lea        r9, [r10 - 1]
01121 49c1f93f                       sar        r9, 0x3f
01125 49c1e93d                       shr        r9, 0x3d
01129 4f8d5411ff                     lea        r10, [r9 + r10 - 1]
0112e 4983e2f8                       and        r10, 0xfffffffffffffff8
01132 4c03d7                         add        r10, rdi
01135 493bfa                         cmp        rdi, r10
01138 490f4cfa                       cmovl      rdi, r10
0113c 448bd7                         mov        r10d, edi
0113f 418d7a08                       lea        edi, [r10 + 8]
01143 442b94248c000000               sub        r10d, dword ptr [rsp + 0x8c]
0114b 4c63cf                         movsxd     r9, edi
0114e 4c03ca                         add        r9, rdx
01151 4183c208                       add        r10d, 8
01155 4963fa                         movsxd     rdi, r10d
01158 4803fa                         add        rdi, rdx
0115b 498d5148                       lea        rdx, [r9 + 0x48]
0115f 4983c108                       add        r9, 8
01163 488d7708                       lea        rsi, [rdi + 8]
01167 4533d2                         xor        r10d, r10d
0116a 483bd6                         cmp        rdx, rsi
0116d 410f96c2                       setbe      r10b
01171 4883c748                       add        rdi, 0x48
01175 33f6                           xor        esi, esi
01177 493bf9                         cmp        rdi, r9
0117a 400f96c6                       setbe      sil
0117e 440bd6                         or         r10d, esi
01181 0f847d0f0000                   je         0x7f6027e5fd04
01187 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0118f 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
01196 0f8fcc0f0000                   jg         0x7f6027e5fd68
0119c 452bc3                         sub        r8d, r11d
0119f 448bd1                         mov        r10d, ecx
011a2 6690                           nop        
011a4 458d0c28                       lea        r9d, [r8 + rbp]
011a8 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
011ac 4e8b5c0908                     mov        r11, qword ptr [rcx + r9 + 8]
011b1 8bcd                           mov        ecx, ebp
011b3 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
011b8 4d895c0908                     mov        qword ptr [r9 + rcx + 8], r11
011bd 83c508                         add        ebp, 8
011c0 413bea                         cmp        ebp, r10d
011c3 7cdf                           jl         0x7f6027e5eda4
011c5 4c8d9308feffff                 lea        r10, [rbx - 0x1f8]
011cc 4981fa00000080                 cmp        r10, -0x80000000
011d3 49c7c300000080                 mov        r11, 0xffffffff80000000
011da 4d0f4cd3                       cmovl      r10, r11
011de 418bd2                         mov        edx, r10d
011e1 3bea                           cmp        ebp, edx
011e3 0f8d45010000                   jge        0x7f6027e5ef2e
011e9 0f1f8000000000                 nop        dword ptr [rax]
011f0 448bdd                         mov        r11d, ebp
011f3 4d63db                         movsxd     r11, r11d
011f6 448bd5                         mov        r10d, ebp
011f9 458d0c28                       lea        r9d, [r8 + rbp]
011fd 8dbd80000000                   lea        edi, [rbp + 0x80]
01203 4103f8                         add        edi, r8d
01206 418bc9                         mov        ecx, r9d
01209 8b742448                       mov        esi, dword ptr [rsp + 0x48]
0120d 62f17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 8]
01218 62b17e487f841608000000         vmovdqu32  zmmword ptr [rsi + r10 + 8], zmm0
01223 4963c9                         movsxd     rcx, r9d
01226 62f17e486f840e48000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x48]
01231 62b17e487f841e48000000         vmovdqu32  zmmword ptr [rsi + r11 + 0x48], zmm0
0123c 448bd7                         mov        r10d, edi
0123f 62b17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 8]
0124a 62b17e487f841e88000000         vmovdqu32  zmmword ptr [rsi + r11 + 0x88], zmm0
01255 4c63d7                         movsxd     r10, edi
01258 62b17e486f841648000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 0x48]
01263 62b17e487f841ec8000000         vmovdqu32  zmmword ptr [rsi + r11 + 0xc8], zmm0
0126e 448d9500010000                 lea        r10d, [rbp + 0x100]
01275 4503d0                         add        r10d, r8d
01278 458bca                         mov        r9d, r10d
0127b 62b17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 8]
01286 62b17e487f841e08010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x108], zmm0
01291 4d63d1                         movsxd     r10, r9d
01294 62b17e486f841648000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 0x48]
0129f 62b17e487f841e48010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x148], zmm0
012aa 62f17e486f840e88010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x188]
012b5 62b17e487f841e88010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x188], zmm0
012c0 62f17e486f840ec8010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x1c8]
012cb 62b17e487f841ec8010000         vmovdqu32  zmmword ptr [rsi + r11 + 0x1c8], zmm0
012d6 81c500020000                   add        ebp, 0x200
012dc 3bea                           cmp        ebp, edx
012de 0f8c0cffffff                   jl         0x7f6027e5edf0
012e4 4883c3c8                       add        rbx, -0x38
012e8 4881fb00000080                 cmp        rbx, -0x80000000
012ef 49c7c200000080                 mov        r10, 0xffffffff80000000
012f6 490f4cda                       cmovl      rbx, r10
012fa 448bd3                         mov        r10d, ebx
012fd 413bea                         cmp        ebp, r10d
01300 7d2c                           jge        0x7f6027e5ef2e
01302 6690                           nop        
01304 458d1c28                       lea        r11d, [r8 + rbp]
01308 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0130d 62917e486f841908000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 8]
01318 448bdd                         mov        r11d, ebp
0131b 62917e487f841908000000         vmovdqu32  zmmword ptr [r9 + r11 + 8], zmm0
01326 83c540                         add        ebp, 0x40
01329 413bea                         cmp        ebp, r10d
0132c 7cd6                           jl         0x7f6027e5ef04
0132e 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01335 7d27                           jge        0x7f6027e5ef5e
01337 90                             nop        
01338 458d1428                       lea        r10d, [r8 + rbp]
0133c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01341 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01346 448bdd                         mov        r11d, ebp
01349 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0134d 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
01352 83c508                         add        ebp, 8
01355 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
0135c 7cda                           jl         0x7f6027e5ef38
0135e 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01366 e942f2ffff                     jmp        0x7f6027e5e1ad
0136b 4c03c9                         add        r9, rcx
0136e 4c3b4c2458                     cmp        r9, qword ptr [rsp + 0x58]
01373 7e08                           jle        0x7f6027e5ef7d
01375 4533c0                         xor        r8d, r8d
01378 e933edffff                     jmp        0x7f6027e5dcb0
0137d 4533c0                         xor        r8d, r8d
01380 ba01000000                     mov        edx, 1
01385 e928edffff                     jmp        0x7f6027e5dcb2
0138a bee4ffffff                     mov        esi, 0xffffffe4
0138f 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01394 448b1c24                       mov        r11d, dword ptr [rsp]
01398 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
013a0 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
013a5 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
013ad 448b442408                     mov        r8d, dword ptr [rsp + 8]
013b2 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
013ba 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
013bf 4c891c24                       mov        qword ptr [rsp], r11
013c3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
013c8 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
013cd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
013d2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
013d7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
013dc 4489442420                     mov        dword ptr [rsp + 0x20], r8d
013e1 89442428                       mov        dword ptr [rsp + 0x28], eax
013e5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
013ea 6690                           nop        
013ec c5f877                         vzeroupper 
013ef e86c46b6ff                     call       0x7f60279c3660
013f4 0f1f8400ec140007               nop        dword ptr [rax + rax + 0x70014ec]
013fc bee4ffffff                     mov        esi, 0xffffffe4
01401 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01406 448b0c24                       mov        r9d, dword ptr [rsp]
0140a 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
01412 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01417 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
0141f 448b442408                     mov        r8d, dword ptr [rsp + 8]
01424 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0142c 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01431 4c890424                       mov        qword ptr [rsp], r8
01435 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0143a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0143f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01444 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01449 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0144e 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01453 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01458 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0145d 89442428                       mov        dword ptr [rsp + 0x28], eax
01461 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01466 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
0146c c5f877                         vzeroupper 
0146f e8ec45b6ff                     call       0x7f60279c3660
01474 0f1f84006c150008               nop        dword ptr [rax + rax + 0x800156c]
0147c bee4ffffff                     mov        esi, 0xffffffe4
01481 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01486 448b1c24                       mov        r11d, dword ptr [rsp]
0148a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01492 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01497 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0149f 448b542408                     mov        r10d, dword ptr [rsp + 8]
014a4 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
014ac 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014b1 4c891424                       mov        qword ptr [rsp], r10
014b5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
014ba 44895c2408                     mov        dword ptr [rsp + 8], r11d
014bf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014c4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014c9 4489442430                     mov        dword ptr [rsp + 0x30], r8d
014ce 6690                           nop        
014d0 c5f877                         vzeroupper 
014d3 e88845b6ff                     call       0x7f60279c3660
014d8 0f1f8400d0150009               nop        dword ptr [rax + rax + 0x90015d0]
014e0 be45ffffff                     mov        esi, 0xffffff45
014e5 4c898c24d0000000               mov        qword ptr [rsp + 0xd0], r9
014ed 666690                         nop        
014f0 c5f877                         vzeroupper 
014f3 e86845b6ff                     call       0x7f60279c3660
014f8 0f1f8400f015000a               nop        dword ptr [rax + rax + 0xa0015f0]
01500 be45ffffff                     mov        esi, 0xffffff45
01505 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0150a 448b1c24                       mov        r11d, dword ptr [rsp]
0150e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01516 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0151b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01523 448b442408                     mov        r8d, dword ptr [rsp + 8]
01528 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01530 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01535 4c891c24                       mov        qword ptr [rsp], r11
01539 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0153e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01543 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01548 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0154d 89442428                       mov        dword ptr [rsp + 0x28], eax
01551 897c2430                       mov        dword ptr [rsp + 0x30], edi
01555 666690                         nop        
01558 c5f877                         vzeroupper 
0155b e80045b6ff                     call       0x7f60279c3660
01560 0f1f84005816000b               nop        dword ptr [rax + rax + 0xb001658]
01568 493bd9                         cmp        rbx, r9
0156b bdffffffff                     mov        ebp, 0xffffffff
01570 7c08                           jl         0x7f6027e5f17a
01572 400f95c5                       setne      bpl
01576 400fb6ed                       movzx      ebp, bpl
0157a be45ffffff                     mov        esi, 0xffffff45
0157f 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01584 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0158c 448b1c24                       mov        r11d, dword ptr [rsp]
01590 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01598 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0159d 4c891c24                       mov        qword ptr [rsp], r11
015a1 448b442408                     mov        r8d, dword ptr [rsp + 8]
015a6 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
015ae 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
015b3 4c895c2408                     mov        qword ptr [rsp + 8], r11
015b8 4489542418                     mov        dword ptr [rsp + 0x18], r10d
015bd 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015c2 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015c7 89442430                       mov        dword ptr [rsp + 0x30], eax
015cb 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
015d0 c5f877                         vzeroupper 
015d3 e88844b6ff                     call       0x7f60279c3660
015d8 0f1f8400d016000c               nop        dword ptr [rax + rax + 0xc0016d0]
015e0 be45ffffff                     mov        esi, 0xffffff45
015e5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
015ea 448b0c24                       mov        r9d, dword ptr [rsp]
015ee 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
015f6 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
015fb 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
01603 448b442408                     mov        r8d, dword ptr [rsp + 8]
01608 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01610 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01615 4c890424                       mov        qword ptr [rsp], r8
01619 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0161e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01623 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01628 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0162d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01632 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01637 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0163c 89442428                       mov        dword ptr [rsp + 0x28], eax
01640 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01645 666690                         nop        
01648 c5f877                         vzeroupper 
0164b e81044b6ff                     call       0x7f60279c3660
01650 0f1f84004817000d               nop        dword ptr [rax + rax + 0xd001748]
01658 be45ffffff                     mov        esi, 0xffffff45
0165d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01662 448b1c24                       mov        r11d, dword ptr [rsp]
01666 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0166e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01673 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0167b 448b442408                     mov        r8d, dword ptr [rsp + 8]
01680 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01688 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0168d 4c891c24                       mov        qword ptr [rsp], r11
01691 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01696 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0169b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016a0 89442428                       mov        dword ptr [rsp + 0x28], eax
016a4 c5f877                         vzeroupper 
016a7 e8b443b6ff                     call       0x7f60279c3660
016ac 0f1f8400a417000e               nop        dword ptr [rax + rax + 0xe0017a4]
016b4 bee4ffffff                     mov        esi, 0xffffffe4
016b9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016be 448b1424                       mov        r10d, dword ptr [rsp]
016c2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
016ca 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016cf 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
016d7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016dc 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
016e4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016e9 4c891424                       mov        qword ptr [rsp], r10
016ed 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016f2 44895c2408                     mov        dword ptr [rsp + 8], r11d
016f7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016fc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01701 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01706 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0170b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01710 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01715 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0171a 6690                           nop        
0171c c5f877                         vzeroupper 
0171f e83c43b6ff                     call       0x7f60279c3660
01724 0f1f84001c18000f               nop        dword ptr [rax + rax + 0xf00181c]
0172c bee4ffffff                     mov        esi, 0xffffffe4
01731 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01736 448b1c24                       mov        r11d, dword ptr [rsp]
0173a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01742 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01747 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0174f 448b542408                     mov        r10d, dword ptr [rsp + 8]
01754 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0175c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01761 4c891424                       mov        qword ptr [rsp], r10
01765 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0176a 4489542408                     mov        dword ptr [rsp + 8], r10d
0176f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01774 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01779 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0177e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01783 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01788 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0178d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01792 48894c2438                     mov        qword ptr [rsp + 0x38], rcx
01797 90                             nop        
01798 c5f877                         vzeroupper 
0179b e8c042b6ff                     call       0x7f60279c3660
017a0 0f1f840098180010               nop        dword ptr [rax + rax + 0x10001898]
017a8 4183c008                       add        r8d, 8
017ac be6effffff                     mov        esi, 0xffffff6e
017b1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017b6 8b0c24                         mov        ecx, dword ptr [rsp]
017b9 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
017c0 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
017c5 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
017cd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
017d2 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
017da 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
017df 4c891c24                       mov        qword ptr [rsp], r11
017e3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017e8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017ed 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017f2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017f7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
017fc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01801 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01806 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0180e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01813 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01818 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0181d 666690                         nop        
01820 c5f877                         vzeroupper 
01823 e83842b6ff                     call       0x7f60279c3660
01828 0f1f840020190011               nop        dword ptr [rax + rax + 0x11001920]
01830 4183c008                       add        r8d, 8
01834 be66ffffff                     mov        esi, 0xffffff66
01839 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0183e 8b0c24                         mov        ecx, dword ptr [rsp]
01841 898c24d0000000                 mov        dword ptr [rsp + 0xd0], ecx
01848 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0184d 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01855 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0185a 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01862 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01867 4c891c24                       mov        qword ptr [rsp], r11
0186b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01870 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01875 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0187a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0187f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01884 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01889 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0188e 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01896 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0189b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
018a0 458bda                         mov        r11d, r10d
018a3 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018a8 c5f877                         vzeroupper 
018ab e8b041b6ff                     call       0x7f60279c3660
018b0 0f1f8400a8190012               nop        dword ptr [rax + rax + 0x120019a8]
018b8 beccffffff                     mov        esi, 0xffffffcc
018bd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
018c2 448b1424                       mov        r10d, dword ptr [rsp]
018c6 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
018ce 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018d3 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
018db 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
018e0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
018e8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018ed 4c891424                       mov        qword ptr [rsp], r10
018f1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018f6 4489542408                     mov        dword ptr [rsp + 8], r10d
018fb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01900 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01905 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0190a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0190f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01914 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01919 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01921 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01926 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0192b 90                             nop        
0192c c5f877                         vzeroupper 
0192f e82c41b6ff                     call       0x7f60279c3660
01934 0f1f84002c1a0013               nop        dword ptr [rax + rax + 0x13001a2c]
0193c beccffffff                     mov        esi, 0xffffffcc
01941 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01946 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0194e 448b1c24                       mov        r11d, dword ptr [rsp]
01952 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
0195a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0195f 4c891424                       mov        qword ptr [rsp], r10
01963 448b542408                     mov        r10d, dword ptr [rsp + 8]
01968 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01970 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01975 4c89542408                     mov        qword ptr [rsp + 8], r10
0197a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0197f 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01984 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01989 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0198e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01993 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01998 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0199d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019a2 6690                           nop        
019a4 c5f877                         vzeroupper 
019a7 e8b440b6ff                     call       0x7f60279c3660
019ac 0f1f8400a41a0014               nop        dword ptr [rax + rax + 0x14001aa4]
019b4 85db                           test       ebx, ebx
019b6 0f84940a0000                   je         0x7f6027e60050
019bc 8b0c24                         mov        ecx, dword ptr [rsp]
019bf 458bc2                         mov        r8d, r10d
019c2 4533db                         xor        r11d, r11d
019c5 448bd1                         mov        r10d, ecx
019c8 e9f2f1ffff                     jmp        0x7f6027e5e7bf
019cd bee4ffffff                     mov        esi, 0xffffffe4
019d2 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
019d7 448b1c24                       mov        r11d, dword ptr [rsp]
019db 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
019e3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
019e8 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
019f0 448b442408                     mov        r8d, dword ptr [rsp + 8]
019f5 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
019fd 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01a02 4c891c24                       mov        qword ptr [rsp], r11
01a06 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a0b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a10 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a15 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a1a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a1f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a24 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01a29 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a2e 89442428                       mov        dword ptr [rsp + 0x28], eax
01a32 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01a36 6690                           nop        
01a38 c5f877                         vzeroupper 
01a3b e82040b6ff                     call       0x7f60279c3660
01a40 0f1f8400381b0015               nop        dword ptr [rax + rax + 0x15001b38]
01a48 be6effffff                     mov        esi, 0xffffff6e
01a4d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01a52 448b0424                       mov        r8d, dword ptr [rsp]
01a56 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01a5e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a63 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01a6b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a70 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01a78 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01a7d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a82 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a87 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a8c 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01a91 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a96 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01a9b 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01aa0 89442428                       mov        dword ptr [rsp + 0x28], eax
01aa4 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01aa8 897c2440                       mov        dword ptr [rsp + 0x40], edi
01aac c5f877                         vzeroupper 
01aaf e8ac3fb6ff                     call       0x7f60279c3660
01ab4 0f1f8400ac1b0016               nop        dword ptr [rax + rax + 0x16001bac]
01abc be45ffffff                     mov        esi, 0xffffff45
01ac1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01ac6 448b1c24                       mov        r11d, dword ptr [rsp]
01aca 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01ad2 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01ad7 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01adf 448b442408                     mov        r8d, dword ptr [rsp + 8]
01ae4 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01aec 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01af1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01af6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01afb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b00 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b05 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b0a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b0f 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b14 89442428                       mov        dword ptr [rsp + 0x28], eax
01b18 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01b1c c5f877                         vzeroupper 
01b1f e83c3fb6ff                     call       0x7f60279c3660
01b24 0f1f84001c1c0017               nop        dword ptr [rax + rax + 0x17001c1c]
01b2c be3dffffff                     mov        esi, 0xffffff3d
01b31 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01b36 448b1c24                       mov        r11d, dword ptr [rsp]
01b3a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01b42 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b47 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01b4f 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b54 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01b5c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b61 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b66 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b6b 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b70 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01b75 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b7a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b7f 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b84 89442428                       mov        dword ptr [rsp + 0x28], eax
01b88 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01b8c c5f877                         vzeroupper 
01b8f e8cc3eb6ff                     call       0x7f60279c3660
01b94 0f1f84008c1c0018               nop        dword ptr [rax + rax + 0x18001c8c]
01b9c bee4ffffff                     mov        esi, 0xffffffe4
01ba1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01ba6 448b1c24                       mov        r11d, dword ptr [rsp]
01baa 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01bb2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01bb7 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01bbf 448b542408                     mov        r10d, dword ptr [rsp + 8]
01bc4 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01bcc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01bd1 4c891424                       mov        qword ptr [rsp], r10
01bd5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bda 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bdf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01be4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01be9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01bee 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01bf3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bf8 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01bfd 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01c02 6690                           nop        
01c04 c5f877                         vzeroupper 
01c07 e8543eb6ff                     call       0x7f60279c3660
01c0c 0f1f8400041d0019               nop        dword ptr [rax + rax + 0x19001d04]
01c14 bee4ffffff                     mov        esi, 0xffffffe4
01c19 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c1e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01c26 448b1c24                       mov        r11d, dword ptr [rsp]
01c2a 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01c32 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c37 4c891424                       mov        qword ptr [rsp], r10
01c3b 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c40 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01c48 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c4d 4c89542408                     mov        qword ptr [rsp + 8], r10
01c52 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c57 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01c5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c66 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c6b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c70 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c75 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c7a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01c7f 90                             nop        
01c80 c5f877                         vzeroupper 
01c83 e8d83db6ff                     call       0x7f60279c3660
01c88 0f1f8400801d001a               nop        dword ptr [rax + rax + 0x1a001d80]
01c90 418d6801                       lea        ebp, [r8 + 1]
01c94 bee4ffffff                     mov        esi, 0xffffffe4
01c99 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c9e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01ca6 448b1c24                       mov        r11d, dword ptr [rsp]
01caa 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01cb2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cb7 4c891424                       mov        qword ptr [rsp], r10
01cbb 448b542408                     mov        r10d, dword ptr [rsp + 8]
01cc0 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01cc8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ccd 4c89542408                     mov        qword ptr [rsp + 8], r10
01cd2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cd7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cdc 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ce1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ce6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ceb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01cf0 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01cf5 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01cfa 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01cff 90                             nop        
01d00 c5f877                         vzeroupper 
01d03 e8583db6ff                     call       0x7f60279c3660
01d08 0f1f8400001e001b               nop        dword ptr [rax + rax + 0x1b001e00]
01d10 bee4ffffff                     mov        esi, 0xffffffe4
01d15 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d1a 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01d22 448b1c24                       mov        r11d, dword ptr [rsp]
01d26 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01d2e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d33 4c891424                       mov        qword ptr [rsp], r10
01d37 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d3c 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01d44 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d49 4c89542408                     mov        qword ptr [rsp + 8], r10
01d4e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d53 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01d58 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d5d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d62 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d67 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d6c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d71 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01d76 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01d7b 90                             nop        
01d7c c5f877                         vzeroupper 
01d7f e8dc3cb6ff                     call       0x7f60279c3660
01d84 0f1f84007c1e001c               nop        dword ptr [rax + rax + 0x1c001e7c]
01d8c bee4ffffff                     mov        esi, 0xffffffe4
01d91 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01d96 448b1c24                       mov        r11d, dword ptr [rsp]
01d9a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01da2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01da7 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01daf 448b542408                     mov        r10d, dword ptr [rsp + 8]
01db4 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01dbc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01dc1 4c891424                       mov        qword ptr [rsp], r10
01dc5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dca 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01dcf 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01dd4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01dd9 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01ddd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01de2 6690                           nop        
01de4 c5f877                         vzeroupper 
01de7 e8743cb6ff                     call       0x7f60279c3660
01dec 0f1f8400e41e001d               nop        dword ptr [rax + rax + 0x1d001ee4]
01df4 beccffffff                     mov        esi, 0xffffffcc
01df9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01dfe 448b1c24                       mov        r11d, dword ptr [rsp]
01e02 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01e0a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e0f 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01e17 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e1c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01e24 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e29 4c891424                       mov        qword ptr [rsp], r10
01e2d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e32 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e37 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e3c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e41 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e46 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01e4b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e50 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01e55 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01e5a 6690                           nop        
01e5c c5f877                         vzeroupper 
01e5f e8fc3bb6ff                     call       0x7f60279c3660
01e64 0f1f84005c1f001e               nop        dword ptr [rax + rax + 0x1e001f5c]
01e6c be45ffffff                     mov        esi, 0xffffff45
01e71 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e76 448b1c24                       mov        r11d, dword ptr [rsp]
01e7a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01e82 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e87 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01e8f 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e94 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01e9c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ea1 4c891424                       mov        qword ptr [rsp], r10
01ea5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01eaa 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eaf 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01eb4 c5f877                         vzeroupper 
01eb7 e8a43bb6ff                     call       0x7f60279c3660
01ebc 0f1f8400b41f001f               nop        dword ptr [rax + rax + 0x1f001fb4]
01ec4 be17000000                     mov        esi, 0x17
01ec9 666690                         nop        
01ecc c5f877                         vzeroupper 
01ecf e88c3bb6ff                     call       0x7f60279c3660
01ed4 0f1f8400cc1f0020               nop        dword ptr [rax + rax + 0x20001fcc]
01edc be6effffff                     mov        esi, 0xffffff6e
01ee1 498bee                         mov        rbp, r14
01ee4 8b3c24                         mov        edi, dword ptr [rsp]
01ee7 89bc24d0000000                 mov        dword ptr [rsp + 0xd0], edi
01eee 4c891c24                       mov        qword ptr [rsp], r11
01ef2 895c2408                       mov        dword ptr [rsp + 8], ebx
01ef6 48ff742420                     push       qword ptr [rsp + 0x20]
01efb 488f442410                     pop        qword ptr [rsp + 0x10]
01f00 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01f04 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01f09 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
01f0e 89542430                       mov        dword ptr [rsp + 0x30], edx
01f12 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01f17 90                             nop        
01f18 c5f877                         vzeroupper 
01f1b e8403bb6ff                     call       0x7f60279c3660
01f20 0f1f840018200021               nop        dword ptr [rax + rax + 0x21002018]
01f28 bebeffffff                     mov        esi, 0xffffffbe
01f2d 498bee                         mov        rbp, r14
01f30 8b3c24                         mov        edi, dword ptr [rsp]
01f33 89bc24d0000000                 mov        dword ptr [rsp + 0xd0], edi
01f3a 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01f42 48890424                       mov        qword ptr [rsp], rax
01f46 895c2408                       mov        dword ptr [rsp + 8], ebx
01f4a 48ff742420                     push       qword ptr [rsp + 0x20]
01f4f 488f442410                     pop        qword ptr [rsp + 0x10]
01f54 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01f58 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01f5d 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
01f62 89542430                       mov        dword ptr [rsp + 0x30], edx
01f66 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01f6b 90                             nop        
01f6c c5f877                         vzeroupper 
01f6f e8ec3ab6ff                     call       0x7f60279c3660
01f74 0f1f84006c200022               nop        dword ptr [rax + rax + 0x2200206c]
01f7c 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
01f81 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01f85 beccffffff                     mov        esi, 0xffffffcc
01f8a 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
01f92 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01f9a 899c24dc000000                 mov        dword ptr [rsp + 0xdc], ebx
01fa1 44890424                       mov        dword ptr [rsp], r8d
01fa5 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01faa 6690                           nop        
01fac c5f877                         vzeroupper 
01faf e8ac3ab6ff                     call       0x7f60279c3660
01fb4 0f1f8400ac200023               nop        dword ptr [rax + rax + 0x230020ac]
01fbc bee4ffffff                     mov        esi, 0xffffffe4
01fc1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01fc6 448b1c24                       mov        r11d, dword ptr [rsp]
01fca 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01fd2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01fd7 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01fdf 448b542408                     mov        r10d, dword ptr [rsp + 8]
01fe4 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01fec 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ff1 4c891424                       mov        qword ptr [rsp], r10
01ff5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ffa 44895c2408                     mov        dword ptr [rsp + 8], r11d
01fff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02004 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02009 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0200e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02013 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02018 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0201d 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
02022 6690                           nop        
02024 c5f877                         vzeroupper 
02027 e8343ab6ff                     call       0x7f60279c3660
0202c 0f1f840024210024               nop        dword ptr [rax + rax + 0x24002124]
02034 bee4ffffff                     mov        esi, 0xffffffe4
02039 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0203e 448b1c24                       mov        r11d, dword ptr [rsp]
02042 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0204a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0204f 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02057 448b542408                     mov        r10d, dword ptr [rsp + 8]
0205c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02064 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02069 4c891424                       mov        qword ptr [rsp], r10
0206d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02072 44895c2408                     mov        dword ptr [rsp + 8], r11d
02077 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0207c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02081 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02086 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0208b 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
02090 c5f877                         vzeroupper 
02093 e8c839b6ff                     call       0x7f60279c3660
02098 0f1f840090210025               nop        dword ptr [rax + rax + 0x25002190]
020a0 4183c008                       add        r8d, 8
020a4 be6effffff                     mov        esi, 0xffffff6e
020a9 448b1c24                       mov        r11d, dword ptr [rsp]
020ad 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
020b5 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
020ba 4c891424                       mov        qword ptr [rsp], r10
020be 448b542408                     mov        r10d, dword ptr [rsp + 8]
020c3 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
020cb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020d0 4c89542408                     mov        qword ptr [rsp + 8], r10
020d5 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020da 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020df 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
020e7 4489442430                     mov        dword ptr [rsp + 0x30], r8d
020ec 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020f1 666690                         nop        
020f4 c5f877                         vzeroupper 
020f7 e86439b6ff                     call       0x7f60279c3660
020fc 0f1f8400f4210026               nop        dword ptr [rax + rax + 0x260021f4]
02104 4183c008                       add        r8d, 8
02108 beb6ffffff                     mov        esi, 0xffffffb6
0210d 448b1c24                       mov        r11d, dword ptr [rsp]
02111 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
02119 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0211e 4c891424                       mov        qword ptr [rsp], r10
02122 448b542408                     mov        r10d, dword ptr [rsp + 8]
02127 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0212f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02134 4c89542408                     mov        qword ptr [rsp + 8], r10
02139 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0213e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02143 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0214b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
02150 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02155 666690                         nop        
02158 c5f877                         vzeroupper 
0215b e80039b6ff                     call       0x7f60279c3660
02160 0f1f840058220027               nop        dword ptr [rax + rax + 0x27002258]
02168 4183c008                       add        r8d, 8
0216c be66ffffff                     mov        esi, 0xffffff66
02171 448b1c24                       mov        r11d, dword ptr [rsp]
02175 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
0217d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02182 4c891424                       mov        qword ptr [rsp], r10
02186 448b542408                     mov        r10d, dword ptr [rsp + 8]
0218b 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
02193 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02198 4c89542408                     mov        qword ptr [rsp + 8], r10
0219d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021a2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021a7 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
021af 4489442430                     mov        dword ptr [rsp + 0x30], r8d
021b4 4489542434                     mov        dword ptr [rsp + 0x34], r10d
021b9 666690                         nop        
021bc c5f877                         vzeroupper 
021bf e89c38b6ff                     call       0x7f60279c3660
021c4 0f1f8400bc220028               nop        dword ptr [rax + rax + 0x280022bc]
021cc bee4ffffff                     mov        esi, 0xffffffe4
021d1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
021d6 448b1c24                       mov        r11d, dword ptr [rsp]
021da 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
021e2 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
021e7 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
021ef 448b442408                     mov        r8d, dword ptr [rsp + 8]
021f4 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
021fc 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02201 4c891c24                       mov        qword ptr [rsp], r11
02205 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0220a 4489442408                     mov        dword ptr [rsp + 8], r8d
0220f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02214 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02219 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0221e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02223 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02228 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0222d 89442424                       mov        dword ptr [rsp + 0x24], eax
02231 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02236 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0223b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02240 c5f877                         vzeroupper 
02243 e81838b6ff                     call       0x7f60279c3660
02248 0f1f840040230029               nop        dword ptr [rax + rax + 0x29002340]
02250 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02259 bee4ffffff                     mov        esi, 0xffffffe4
0225e 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02263 448b0424                       mov        r8d, dword ptr [rsp]
02267 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0226f 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
02274 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
0227c 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
02281 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
02289 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0228e 4c890424                       mov        qword ptr [rsp], r8
02292 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
02297 44894c2408                     mov        dword ptr [rsp + 8], r9d
0229c 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
022a1 4c89442410                     mov        qword ptr [rsp + 0x10], r8
022a6 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
022ab 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
022b0 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
022b5 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
022ba 89442424                       mov        dword ptr [rsp + 0x24], eax
022be 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
022c3 4489542438                     mov        dword ptr [rsp + 0x38], r10d
022c8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
022cd 666690                         nop        
022d0 c5f877                         vzeroupper 
022d3 e88837b6ff                     call       0x7f60279c3660
022d8 0f1f8400d023002a               nop        dword ptr [rax + rax + 0x2a0023d0]
022e0 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
022e8 beccffffff                     mov        esi, 0xffffffcc
022ed 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
022f2 448b0424                       mov        r8d, dword ptr [rsp]
022f6 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
022fe 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02303 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0230b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02310 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02318 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0231d 4c891c24                       mov        qword ptr [rsp], r11
02321 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02326 44895c2408                     mov        dword ptr [rsp + 8], r11d
0232b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02330 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02335 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0233a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0233f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02344 4489442420                     mov        dword ptr [rsp + 0x20], r8d
02349 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0234e 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02353 89442448                       mov        dword ptr [rsp + 0x48], eax
02357 90                             nop        
02358 c5f877                         vzeroupper 
0235b e80037b6ff                     call       0x7f60279c3660
02360 0f1f84005824002b               nop        dword ptr [rax + rax + 0x2b002458]
02368 418bea                         mov        ebp, r10d
0236b 83c510                         add        ebp, 0x10
0236e be6effffff                     mov        esi, 0xffffff6e
02373 448b1c24                       mov        r11d, dword ptr [rsp]
02377 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
0237f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02384 4c891c24                       mov        qword ptr [rsp], r11
02388 448b442408                     mov        r8d, dword ptr [rsp + 8]
0238d 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
02395 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0239a 4c895c2408                     mov        qword ptr [rsp + 8], r11
0239f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023a4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023a9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023ae 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023b3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
023b8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
023bd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
023c2 8944242c                       mov        dword ptr [rsp + 0x2c], eax
023c6 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
023cb 90                             nop        
023cc c5f877                         vzeroupper 
023cf e88c36b6ff                     call       0x7f60279c3660
023d4 0f1f8400cc24002c               nop        dword ptr [rax + rax + 0x2c0024cc]
023dc 418bea                         mov        ebp, r10d
023df 83c510                         add        ebp, 0x10
023e2 be66ffffff                     mov        esi, 0xffffff66
023e7 448b1c24                       mov        r11d, dword ptr [rsp]
023eb 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
023f3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
023f8 4c891c24                       mov        qword ptr [rsp], r11
023fc 448b442408                     mov        r8d, dword ptr [rsp + 8]
02401 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
02409 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0240e 4c895c2408                     mov        qword ptr [rsp + 8], r11
02413 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02418 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0241d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02422 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02427 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0242c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02431 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02436 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0243a 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0243f 90                             nop        
02440 c5f877                         vzeroupper 
02443 e81836b6ff                     call       0x7f60279c3660
02448 0f1f84004025002d               nop        dword ptr [rax + rax + 0x2d002540]
02450 bef6ffffff                     mov        esi, 0xfffffff6
02455 498bee                         mov        rbp, r14
02458 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02460 c5f877                         vzeroupper 
02463 e8f835b6ff                     call       0x7f60279c3660
02468 0f1f84006025002e               nop        dword ptr [rax + rax + 0x2e002560]
02470 488bf0                         mov        rsi, rax
02473 eb0d                           jmp        0x7f6027e60082
02475 488bf0                         mov        rsi, rax
02478 eb08                           jmp        0x7f6027e60082
0247a 488bf0                         mov        rsi, rax
0247d eb03                           jmp        0x7f6027e60082
0247f 488bf0                         mov        rsi, rax
02482 c5f877                         vzeroupper 
02485 4881c4c0000000                 add        rsp, 0xc0
0248c 5d                             pop        rbp
0248d e9ceb4b6ff                     jmp        0x7f60279cb560
02492 bef6ffffff                     mov        esi, 0xfffffff6
02497 90                             nop        
02498 c5f877                         vzeroupper 
0249b e8c035b6ff                     call       0x7f60279c3660
024a0 0f1f84009825002f               nop        dword ptr [rax + rax + 0x2f002598]
024a8 49ba36e8e527607f0000           movabs     r10, 0x7f6027e5e836
024b2 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
024b9 e922dea9ff                     jmp        0x7f60278fdee0
024be e8dda9a8ff                     call       0x7f60278eaaa0
024c3 e976dbffff                     jmp        0x7f6027e5dc3e
