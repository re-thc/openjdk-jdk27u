00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0b0a9ff                   jne        0x7f4c1b90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8568280000                   jne        0x7f4c1be77126
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742460                     mov        qword ptr [rsp + 0x60], rsi
00051 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00055 448b4e38                       mov        r9d, dword ptr [rsi + 0x38]
00059 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0005e 458bc1                         mov        r8d, r9d
00061 452bc2                         sub        r8d, r10d
00064 8b8c24d0000000                 mov        ecx, dword ptr [rsp + 0xd0]
0006b 413bc8                         cmp        ecx, r8d
0006e 0f8f80200000                   jg         0x7f4c1be76974
00074 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00078 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0007d 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00081 48638c24d0000000               movsxd     rcx, dword ptr [rsp + 0xd0]
00089 4d63ca                         movsxd     r9, r10d
0008c 4c034c2420                     add        r9, qword ptr [rsp + 0x20]
00091 4d2bc1                         sub        r8, r9
00094 493bc8                         cmp        rcx, r8
00097 0f8f57200000                   jg         0x7f4c1be76974
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442458                     mov        qword ptr [rsp + 0x58], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f84e9110000                   je         0x7f4c1be75b1c
000b3 33d2                           xor        edx, edx
000b5 4d8bf3                         mov        r14, r11
000b8 418b7308                       mov        esi, dword ptr [r11 + 8]
000bc 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
000c1 418b5b44                       mov        ebx, dword ptr [r11 + 0x44]
000c5 448bef                         mov        r13d, edi
000c8 85ff                           test       edi, edi
000ca 0f8e98190000                   jle        0x7f4c1be762e8
000d0 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
000d8 4c2b442420                     sub        r8, qword ptr [rsp + 0x20]
000dd 448d4ee0                       lea        r9d, [rsi - 0x20]
000e1 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
000e5 83c1e0                         add        ecx, -0x20
000e8 4c8bd8                         mov        r11, rax
000eb 418b7b08                       mov        edi, dword ptr [r11 + 8]
000ef 85ff                           test       edi, edi
000f1 0f8615200000                   jbe        0x7f4c1be7698c
000f7 4c63d7                         movsxd     r10, edi
000fa 4963fd                         movsxd     rdi, r13d
000fd 48ffcf                         dec        rdi
00100 493bfa                         cmp        rdi, r10
00103 0f8303200000                   jae        0x7f4c1be7698c
00109 85d2                           test       edx, edx
0010b 0f84fb1f0000                   je         0x7f4c1be7698c
00111 488b8424d8000000               mov        rax, qword ptr [rsp + 0xd8]
00119 8b7808                         mov        edi, dword ptr [rax + 8]
0011c 85ff                           test       edi, edi
0011e 0f8638200000                   jbe        0x7f4c1be769dc
00124 83ff01                         cmp        edi, 1
00127 0f862f200000                   jbe        0x7f4c1be769dc
0012d 83ff02                         cmp        edi, 2
00130 0f8626200000                   jbe        0x7f4c1be769dc
00136 448d56f1                       lea        r10d, [rsi - 0xf]
0013a 4585d2                         test       r10d, r10d
0013d 0f8c19200000                   jl         0x7f4c1be769dc
00143 8b6b08                         mov        ebp, dword ptr [rbx + 8]
00146 448d55f1                       lea        r10d, [rbp - 0xf]
0014a 4585d2                         test       r10d, r10d
0014d 0f8c09200000                   jl         0x7f4c1be769dc
00153 448d55f9                       lea        r10d, [rbp - 7]
00157 4585d2                         test       r10d, r10d
0015a 0f8cfc1f0000                   jl         0x7f4c1be769dc
00160 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00167 89bc24d4000000                 mov        dword ptr [rsp + 0xd4], edi
0016e 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00172 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00177 8954246c                       mov        dword ptr [rsp + 0x6c], edx
0017b 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00180 4889442430                     mov        qword ptr [rsp + 0x30], rax
00185 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0018a 44896c2408                     mov        dword ptr [rsp + 8], r13d
0018f 4c89742440                     mov        qword ptr [rsp + 0x40], r14
00194 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
0019b 89b424dc000000                 mov        dword ptr [rsp + 0xdc], esi
001a2 4c8bd3                         mov        r10, rbx
001a5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001aa 895c2448                       mov        dword ptr [rsp + 0x48], ebx
001ae 448d5ef1                       lea        r11d, [rsi - 0xf]
001b2 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
001b7 448bc5                         mov        r8d, ebp
001ba 458d50f1                       lea        r10d, [r8 - 0xf]
001be 4489542478                     mov        dword ptr [rsp + 0x78], r10d
001c3 458d58f9                       lea        r11d, [r8 - 7]
001c7 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
001cc 4d63d0                         movsxd     r10, r8d
001cf 4c89542428                     mov        qword ptr [rsp + 0x28], r10
001d4 4983c2f9                       add        r10, -7
001d8 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001e0 4533d2                         xor        r10d, r10d
001e3 4533c9                         xor        r9d, r9d
001e6 e9a9030000                     jmp        0x7f4c1be74e14
001eb 448bdd                         mov        r11d, ebp
001ee 4d63d3                         movsxd     r10, r11d
001f1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001f8 c442a8f5db                     bzhi       r11, r11, r10
001fd c4c1fb92fb                     kmovq      k7, r11
00202 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00208 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0020e 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00216 4403d5                         add        r10d, ebp
00219 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00221 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00225 418502                         test       dword ptr [r10], eax
00228 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00230 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00238 0f8dbe080000                   jge        0x7f4c1be7537c
0023e 458bf5                         mov        r14d, r13d
00241 458bc6                         mov        r8d, r14d
00244 442b84248c000000               sub        r8d, dword ptr [rsp + 0x8c]
0024c 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00253 2bac248c000000                 sub        ebp, dword ptr [rsp + 0x8c]
0025a 3bac248c000000                 cmp        ebp, dword ptr [rsp + 0x8c]
00261 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00269 410f4feb                       cmovg      ebp, r11d
0026d 4585c0                         test       r8d, r8d
00270 0f8c4a170000                   jl         0x7f4c1be76240
00276 4585f6                         test       r14d, r14d
00279 0f8c41170000                   jl         0x7f4c1be76240
0027f 458d1428                       lea        r10d, [r8 + rbp]
00283 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
0028b 453bda                         cmp        r11d, r10d
0028e 0f822c170000                   jb         0x7f4c1be76240
00294 458d2c2e                       lea        r13d, [r14 + rbp]
00298 453bdd                         cmp        r11d, r13d
0029b 0f821f170000                   jb         0x7f4c1be76240
002a1 85ed                           test       ebp, ebp
002a3 0f8c17170000                   jl         0x7f4c1be76240
002a9 85ed                           test       ebp, ebp
002ab 0f845dffffff                   je         0x7f4c1be74a8e
002b1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
002b6 4b8d74320c                     lea        rsi, [r10 + r14 + 0xc]
002bb 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
002c0 4863d5                         movsxd     rdx, ebp
002c3 4883fa20                       cmp        rdx, 0x20
002c7 0f861effffff                   jbe        0x7f4c1be74a6b
002cd c5f877                         vzeroupper 
002d0 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
002da 41ffd2                         call       r10
002dd 0f1f840000000000               nop        dword ptr [rax + rax]
002e5 e924ffffff                     jmp        0x7f4c1be74a8e
002ea 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
002f2 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
002f9 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00301 4503d8                         add        r11d, r8d
00304 e965020000                     jmp        0x7f4c1be74dee
00309 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0030e 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
00313 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
0031b 4b8d740b0c                     lea        rsi, [r11 + r9 + 0xc]
00320 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00328 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
00330 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00338 4963d2                         movsxd     rdx, r10d
0033b 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00343 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0034b 0f8c71050000                   jl         0x7f4c1be75142
00351 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00359 4183fb30                       cmp        r11d, 0x30
0035d 0f8e98000000                   jle        0x7f4c1be74c7b
00363 4585c0                         test       r8d, r8d
00366 0f8cbc150000                   jl         0x7f4c1be761a8
0036c 4585c9                         test       r9d, r9d
0036f 0f8cb3150000                   jl         0x7f4c1be761a8
00375 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0037d 4503d0                         add        r10d, r8d
00380 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
00388 453bca                         cmp        r9d, r10d
0038b 0f8297150000                   jb         0x7f4c1be761a8
00391 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
00399 0f8289150000                   jb         0x7f4c1be761a8
0039f 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
003a7 4585d2                         test       r10d, r10d
003aa 0f84ae010000                   je         0x7f4c1be74dde
003b0 4963d2                         movsxd     rdx, r10d
003b3 4883fa20                       cmp        rdx, 0x20
003b7 7725                           ja         0x7f4c1be74c5e
003b9 4d63d2                         movsxd     r10, r10d
003bc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003c3 c442a8f5db                     bzhi       r11, r11, r10
003c8 c4c1fb92fb                     kmovq      k7, r11
003cd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003d3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003d9 e980010000                     jmp        0x7f4c1be74dde
003de c5f877                         vzeroupper 
003e1 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
003eb 41ffd2                         call       r10
003ee 0f1f840000000000               nop        dword ptr [rax + rax]
003f6 e963010000                     jmp        0x7f4c1be74dde
003fb 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
00400 0f83ce120000                   jae        0x7f4c1be75f54
00406 4963f8                         movsxd     rdi, r8d
00409 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0040e 498b4c3b0c                     mov        rcx, qword ptr [r11 + rdi + 0xc]
00413 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
00418 0f8336130000                   jae        0x7f4c1be75fd4
0041e 418d5908                       lea        ebx, [r9 + 8]
00422 4d63d9                         movsxd     r11, r9d
00425 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0042a 4b894c1a0c                     mov        qword ptr [r10 + r11 + 0xc], rcx
0042f 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
00436 0f8d22010000                   jge        0x7f4c1be74dde
0043c 492bfb                         sub        rdi, r11
0043f 4c63db                         movsxd     r11, ebx
00442 4d8d143b                       lea        r10, [r11 + rdi]
00446 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0044e 0f8388130000                   jae        0x7f4c1be7605c
00454 4c8bd2                         mov        r10, rdx
00457 4d2bd3                         sub        r10, r11
0045a 4983c207                       add        r10, 7
0045e 4983e2f8                       and        r10, 0xfffffffffffffff8
00462 458bd2                         mov        r10d, r10d
00465 478d5c0a08                     lea        r11d, [r10 + r9 + 8]
0046a 4d63d3                         movsxd     r10, r11d
0046d 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
00472 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0047a 0f835c130000                   jae        0x7f4c1be7605c
00480 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00484 0f8352130000                   jae        0x7f4c1be7605c
0048a 4983c2f8                       add        r10, -8
0048e 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
00496 0f8340130000                   jae        0x7f4c1be7605c
0049c 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
004a4 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
004ab 0f8fd3130000                   jg         0x7f4c1be76104
004b1 452bc1                         sub        r8d, r9d
004b4 4183c110                       add        r9d, 0x10
004b8 458d1418                       lea        r10d, [r8 + rbx]
004bc 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
004c0 4a8b4c110c                     mov        rcx, qword ptr [rcx + r10 + 0xc]
004c5 448bdb                         mov        r11d, ebx
004c8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
004cd 4b894c1a0c                     mov        qword ptr [r10 + r11 + 0xc], rcx
004d2 83c308                         add        ebx, 8
004d5 413bd9                         cmp        ebx, r9d
004d8 7cde                           jl         0x7f4c1be74d38
004da 4883c2f8                       add        rdx, -8
004de 4881fa00000080                 cmp        rdx, -0x80000000
004e5 49c7c200000080                 mov        r10, 0xffffffff80000000
004ec 490f4cd2                       cmovl      rdx, r10
004f0 448bca                         mov        r9d, edx
004f3 413bd9                         cmp        ebx, r9d
004f6 7d3a                           jge        0x7f4c1be74db2
004f8 0f1f840000000000               nop        dword ptr [rax + rax]
00500 458d1418                       lea        r10d, [r8 + rbx]
00504 8bcb                           mov        ecx, ebx
00506 4863f9                         movsxd     rdi, ecx
00509 458bda                         mov        r11d, r10d
0050c 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00510 4e8b5c190c                     mov        r11, qword ptr [rcx + r11 + 0xc]
00515 4963d2                         movsxd     rdx, r10d
00518 448bd3                         mov        r10d, ebx
0051b 4e895c110c                     mov        qword ptr [rcx + r10 + 0xc], r11
00520 4c8b541114                     mov        r10, qword ptr [rcx + rdx + 0x14]
00525 4c89543914                     mov        qword ptr [rcx + rdi + 0x14], r10
0052a 83c310                         add        ebx, 0x10
0052d 413bd9                         cmp        ebx, r9d
00530 7cce                           jl         0x7f4c1be74d80
00532 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
00539 7d23                           jge        0x7f4c1be74dde
0053b 90                             nop        
0053c 458d1418                       lea        r10d, [r8 + rbx]
00540 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00545 4f8b4c130c                     mov        r9, qword ptr [r11 + r10 + 0xc]
0054a 448bd3                         mov        r10d, ebx
0054d 4f894c130c                     mov        qword ptr [r11 + r10 + 0xc], r9
00552 83c308                         add        ebx, 8
00555 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
0055c 7cde                           jl         0x7f4c1be74dbc
0055e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00566 44039c2488000000               add        r11d, dword ptr [rsp + 0x88]
0056e 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00576 41ffc1                         inc        r9d
00579 443b4c2408                     cmp        r9d, dword ptr [rsp + 8]
0057e 0f8daa050000                   jge        0x7f4c1be753ae
00584 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0058c 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00594 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00599 4f8b44cb10                     mov        r8, qword ptr [r11 + r9*8 + 0x10]
0059e 458bd8                         mov        r11d, r8d
005a1 4181e3ffff0100                 and        r11d, 0x1ffff
005a8 418bc3                         mov        eax, r11d
005ab 4d8bd8                         mov        r11, r8
005ae 49c1eb12                       shr        r11, 0x12
005b2 49c1f824                       sar        r8, 0x24
005b6 458bdb                         mov        r11d, r11d
005b9 458bc0                         mov        r8d, r8d
005bc 418bf8                         mov        edi, r8d
005bf 4181e3ffff0300                 and        r11d, 0x3ffff
005c6 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
005ce 4585c0                         test       r8d, r8d
005d1 0f8ca90e0000                   jl         0x7f4c1be75d00
005d7 448bd8                         mov        r11d, eax
005da 4585db                         test       r11d, r11d
005dd 0f85fd010000                   jne        0x7f4c1be75060
005e3 4533db                         xor        r11d, r11d
005e6 418bc3                         mov        eax, r11d
005e9 83ff03                         cmp        edi, 3
005ec 0f8e1e020000                   jle        0x7f4c1be75090
005f2 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
005f7 458b4310                       mov        r8d, dword ptr [r11 + 0x10]
005fb 45894314                       mov        dword ptr [r11 + 0x14], r8d
005ff 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00603 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00608 45895810                       mov        dword ptr [r8 + 0x10], r11d
0060c 448d5ffd                       lea        r11d, [rdi - 3]
00610 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
00618 4589580c                       mov        dword ptr [r8 + 0xc], r11d
0061c 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
00624 48639c248c000000               movsxd     rbx, dword ptr [rsp + 0x8c]
0062c 488beb                         mov        rbp, rbx
0062f 4c639c2494000000               movsxd     r11, dword ptr [rsp + 0x94]
00637 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
0063c 4863d0                         movsxd     rdx, eax
0063f 4c03da                         add        r11, rdx
00642 493bdb                         cmp        rbx, r11
00645 0f8fc50e0000                   jg         0x7f4c1be75d90
0064b 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00653 4585c0                         test       r8d, r8d
00656 0f8e040e0000                   jle        0x7f4c1be75ce0
0065c 448bac2494000000               mov        r13d, dword ptr [rsp + 0x94]
00664 4403e8                         add        r13d, eax
00667 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
0066f 4503dd                         add        r11d, r13d
00672 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00677 0f8f3f0f0000                   jg         0x7f4c1be75e3c
0067d 458d0402                       lea        r8d, [r10 + rax]
00681 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00689 443b442438                     cmp        r8d, dword ptr [rsp + 0x38]
0068e 0f8fbc0f0000                   jg         0x7f4c1be75ed0
00694 83f810                         cmp        eax, 0x10
00697 0f8f3f050000                   jg         0x7f4c1be7545c
0069d 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
006a2 0f83130c0000                   jae        0x7f4c1be75b3b
006a8 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
006ad c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
006b4 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
006bc 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
006c1 0f83990c0000                   jae        0x7f4c1be75be0
006c7 468d0c10                       lea        r9d, [rax + r10]
006cb 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
006d3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
006d8 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
006df 468d1418                       lea        r10d, [rax + r11]
006e3 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
006eb 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
006f3 442b84248c000000               sub        r8d, dword ptr [rsp + 0x8c]
006fb 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00703 4183fa10                       cmp        r10d, 0x10
00707 0f8ffcfbffff                   jg         0x7f4c1be74b89
0070d 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00715 4183fb10                       cmp        r11d, 0x10
00719 0f8ceafbffff                   jl         0x7f4c1be74b89
0071f 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
00724 0f83b60c0000                   jae        0x7f4c1be75c60
0072a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0072f c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
00736 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0073e 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00743 0f82a1fbffff                   jb         0x7f4c1be74b6a
00749 bee4ffffff                     mov        esi, 0xffffffe4
0074e 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00753 448b1424                       mov        r10d, dword ptr [rsp]
00757 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0075f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00764 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0076c 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00771 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
00779 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0077e 4c891424                       mov        qword ptr [rsp], r10
00782 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00787 4489542408                     mov        dword ptr [rsp + 8], r10d
0078c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00791 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00796 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0079b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
007a0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
007a5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
007aa c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
007b0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
007b5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
007ba 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
007bf 4489542460                     mov        dword ptr [rsp + 0x60], r10d
007c4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
007c9 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
007ce 6690                           nop        
007d0 c5f877                         vzeroupper 
007d3 e8082db6ff                     call       0x7f4c1b9d7d60
007d8 0f1f8400d0080001               nop        dword ptr [rax + rax + 0x10008d0]
007e0 448b0424                       mov        r8d, dword ptr [rsp]
007e4 452bc2                         sub        r8d, r10d
007e7 453bd8                         cmp        r11d, r8d
007ea 0f8ef9fdffff                   jle        0x7f4c1be74e69
007f0 be45ffffff                     mov        esi, 0xffffff45
007f5 418beb                         mov        ebp, r11d
007f8 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00800 c5f877                         vzeroupper 
00803 e8d82cb6ff                     call       0x7f4c1b9d7d60
00808 0f1f840000090002               nop        dword ptr [rax + rax + 0x2000900]
00810 85c0                           test       eax, eax
00812 7407                           je         0x7f4c1be7509b
00814 448d5fff                       lea        r11d, [rdi - 1]
00818 418bfb                         mov        edi, r11d
0081b 85ff                           test       edi, edi
0081d 0f8482000000                   je         0x7f4c1be75125
00823 83ff03                         cmp        edi, 3
00826 0f8494130000                   je         0x7f4c1be76440
0082c 83ff02                         cmp        edi, 2
0082f 0f871b140000                   ja         0x7f4c1be764d0
00835 3bbc24d4000000                 cmp        edi, dword ptr [rsp + 0xd4]
0083c 0f8340120000                   jae        0x7f4c1be76302
00842 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00847 418b5cb80c                     mov        ebx, dword ptr [r8 + rdi*4 + 0xc]
0084c 85ff                           test       edi, edi
0084e 7e42                           jle        0x7f4c1be75112
00850 448d5fff                       lea        r11d, [rdi - 1]
00854 443b9c24d4000000               cmp        r11d, dword ptr [rsp + 0xd4]
0085c 0f83c2120000                   jae        0x7f4c1be763a4
00862 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
0086a 660f1f440000                   nop        word ptr [rax + rax]
00870 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00875 458b44b808                     mov        r8d, dword ptr [r8 + rdi*4 + 8]
0087a 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
0087f 458944b90c                     mov        dword ptr [r9 + rdi*4 + 0xc], r8d
00884 448d5fff                       lea        r11d, [rdi - 1]
00888 418bfb                         mov        edi, r11d
0088b 4585db                         test       r11d, r11d
0088e 7fe0                           jg         0x7f4c1be750f0
00890 eb08                           jmp        0x7f4c1be7511a
00892 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
0089a 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0089f 41895b0c                       mov        dword ptr [r11 + 0xc], ebx
008a3 eb11                           jmp        0x7f4c1be75136
008a5 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
008aa 418b5b0c                       mov        ebx, dword ptr [r11 + 0xc]
008ae 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
008b6 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
008bd e962fdffff                     jmp        0x7f4c1be74ea4
008c2 4183fa10                       cmp        r10d, 0x10
008c6 0f8da8170000                   jge        0x7f4c1be768f4
008cc 4183fa08                       cmp        r10d, 8
008d0 0f8d92060000                   jge        0x7f4c1be757e8
008d6 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
008de 4183fb10                       cmp        r11d, 0x10
008e2 0f8eaa000000                   jle        0x7f4c1be75212
008e8 4585c0                         test       r8d, r8d
008eb 0f8cef160000                   jl         0x7f4c1be76860
008f1 4585c9                         test       r9d, r9d
008f4 0f8ce6160000                   jl         0x7f4c1be76860
008fa 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
00902 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
0090a 0f82d0160000                   jb         0x7f4c1be76860
00910 8b9c248c000000                 mov        ebx, dword ptr [rsp + 0x8c]
00917 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0091e 448bf3                         mov        r14d, ebx
00921 443bdb                         cmp        r11d, ebx
00924 0f82b6160000                   jb         0x7f4c1be76860
0092a 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00932 4585db                         test       r11d, r11d
00935 0f8ca5160000                   jl         0x7f4c1be76860
0093b 4585db                         test       r11d, r11d
0093e 0f84fdf8ffff                   je         0x7f4c1be74ac1
00944 488bdd                         mov        rbx, rbp
00947 4883fb20                       cmp        rbx, 0x20
0094b 7725                           ja         0x7f4c1be751f2
0094d 4d63d3                         movsxd     r10, r11d
00950 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00957 c442a8f5db                     bzhi       r11, r11, r10
0095c c4c1fb92fb                     kmovq      k7, r11
00961 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00967 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0096d e9cff8ffff                     jmp        0x7f4c1be74ac1
00972 488bd3                         mov        rdx, rbx
00975 c5f877                         vzeroupper 
00978 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00982 41ffd2                         call       r10
00985 0f1f840000000000               nop        dword ptr [rax + rax]
0098d e9aff8ffff                     jmp        0x7f4c1be74ac1
00992 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
0099a 0f8340130000                   jae        0x7f4c1be76560
009a0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
009a5 430fbe6c030c                   movsx      ebp, byte ptr [r11 + r8 + 0xc]
009ab 443b8c24d8000000               cmp        r9d, dword ptr [rsp + 0xd8]
009b3 0f83bb130000                   jae        0x7f4c1be765f4
009b9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
009be 43886c0a0c                     mov        byte ptr [r10 + r9 + 0xc], bpl
009c3 458d5803                       lea        r11d, [r8 + 3]
009c7 41ffc1                         inc        r9d
009ca 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
009d2 0f8338140000                   jae        0x7f4c1be76690
009d8 4963c8                         movsxd     rcx, r8d
009db 410fbe6c0a0d                   movsx      ebp, byte ptr [r10 + rcx + 0xd]
009e1 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009e9 4183c303                       add        r11d, 3
009ed 443b9c24d8000000               cmp        r11d, dword ptr [rsp + 0xd8]
009f5 0f83c1140000                   jae        0x7f4c1be7673c
009fb 4c638c2494000000               movsxd     r9, dword ptr [rsp + 0x94]
00a03 43886c0a0d                     mov        byte ptr [r10 + r9 + 0xd], bpl
00a08 450fbe540a0e                   movsx      r10d, byte ptr [r10 + rcx + 0xe]
00a0e 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00a12 4688540b0e                     mov        byte ptr [rbx + r9 + 0xe], r10b
00a17 440fbe540b0f                   movsx      r10d, byte ptr [rbx + rcx + 0xf]
00a1d 4688540b0f                     mov        byte ptr [rbx + r9 + 0xf], r10b
00a22 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00a2a 4183fa08                       cmp        r10d, 8
00a2e 0f8328150000                   jae        0x7f4c1be767dc
00a34 49bbe0df2fe300000000           movabs     r11, 0xe32fdfe0
00a3e 470344930c                     add        r8d, dword ptr [r11 + r10*4 + 0xc]
00a43 4489442404                     mov        dword ptr [rsp + 4], r8d
00a48 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00a50 4183fb04                       cmp        r11d, 4
00a54 7e3e                           jle        0x7f4c1be75314
00a56 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00a5d 83c504                         add        ebp, 4
00a60 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00a65 418bd0                         mov        edx, r8d
00a68 c5f877                         vzeroupper 
00a6b e870b5a9ff                     call       0x7f4c1b910860
00a70 0f1f8400680b0003               nop        dword ptr [rax + rax + 0x3000b68]
00a78 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00a7d 8bd5                           mov        edx, ebp
00a7f 8bc8                           mov        ecx, eax
00a81 488bee                         mov        rbp, rsi
00a84 c5f877                         vzeroupper 
00a87 e854b5a9ff                     call       0x7f4c1b910860
00a8c 0f1f8400840b0004               nop        dword ptr [rax + rax + 0x4000b84]
00a94 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00a9c 4183fb08                       cmp        r11d, 8
00aa0 7e5a                           jle        0x7f4c1be7537c
00aa2 8b542404                       mov        edx, dword ptr [rsp + 4]
00aa6 49ba10e02fe300000000           movabs     r10, 0xe32fe010
00ab0 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00ab8 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00abd 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00ac4 83c508                         add        ebp, 8
00ac7 83c208                         add        edx, 8
00aca 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00acf 90                             nop        
00ad0 c5f877                         vzeroupper 
00ad3 e808b5a9ff                     call       0x7f4c1b910860
00ad8 0f1f8400d00b0005               nop        dword ptr [rax + rax + 0x5000bd0]
00ae0 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00ae5 8bd5                           mov        edx, ebp
00ae7 488bc8                         mov        rcx, rax
00aea 6690                           nop        
00aec c5f877                         vzeroupper 
00aef e8ecb4a9ff                     call       0x7f4c1b910860
00af4 0f1f8400ec0b0006               nop        dword ptr [rax + rax + 0x6000bec]
00afc 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00b04 e965faffff                     jmp        0x7f4c1be74dee
00b09 4d63d2                         movsxd     r10, r10d
00b0c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b13 c442a8f5db                     bzhi       r11, r11, r10
00b18 c4c1fb92fb                     kmovq      k7, r11
00b1d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b23 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b29 e98f000000                     jmp        0x7f4c1be7543d
00b2e 448b1424                       mov        r10d, dword ptr [rsp]
00b32 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
00b3a 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00b42 4585c9                         test       r9d, r9d
00b45 0f8c69160000                   jl         0x7f4c1be76a34
00b4b 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
00b50 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00b57 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00b5b 4585db                         test       r11d, r11d
00b5e 0f8c59160000                   jl         0x7f4c1be76a3d
00b64 3b3424                         cmp        esi, dword ptr [rsp]
00b67 0f8250160000                   jb         0x7f4c1be76a3d
00b6d 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00b70 478d2c13                       lea        r13d, [r11 + r10]
00b74 413bcd                         cmp        ecx, r13d
00b77 0f8240160000                   jb         0x7f4c1be76a3d
00b7d 4585d2                         test       r10d, r10d
00b80 0f8c37160000                   jl         0x7f4c1be76a3d
00b86 4585d2                         test       r10d, r10d
00b89 7432                           je         0x7f4c1be7543d
00b8b 4b8d7c0e0c                     lea        rdi, [r14 + r9 + 0xc]
00b90 4c8bc3                         mov        r8, rbx
00b93 4a8d741b0c                     lea        rsi, [rbx + r11 + 0xc]
00b98 4963d2                         movsxd     rdx, r10d
00b9b 4883fa20                       cmp        rdx, 0x20
00b9f 0f8664ffffff                   jbe        0x7f4c1be75389
00ba5 c5f877                         vzeroupper 
00ba8 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00bb2 41ffd2                         call       r10
00bb5 0f1f840000000000               nop        dword ptr [rax + rax]
00bbd 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00bc2 45896a3c                       mov        dword ptr [r10 + 0x3c], r13d
00bc6 c5f877                         vzeroupper 
00bc9 4881c4c0000000                 add        rsp, 0xc0
00bd0 5d                             pop        rbp
00bd1 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00bd5 0f87b51c0000                   ja         0x7f4c1be77110
00bdb c3                             ret        
00bdc 83f830                         cmp        eax, 0x30
00bdf 0f8ea9000000                   jle        0x7f4c1be7550e
00be5 4585d2                         test       r10d, r10d
00be8 0f8c461a0000                   jl         0x7f4c1be76eb4
00bee 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00bf6 4585c9                         test       r9d, r9d
00bf9 0f8c3d1a0000                   jl         0x7f4c1be76ebc
00bff 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00c07 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00c0f 0f82271a0000                   jb         0x7f4c1be76ebc
00c15 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
00c1d 453bc5                         cmp        r8d, r13d
00c20 0f82161a0000                   jb         0x7f4c1be76ebc
00c26 85c0                           test       eax, eax
00c28 743d                           je         0x7f4c1be754e7
00c2a 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00c2f 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
00c34 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c39 4b8d740b0c                     lea        rsi, [r11 + r9 + 0xc]
00c3e 4883fa20                       cmp        rdx, 0x20
00c42 7730                           ja         0x7f4c1be754f4
00c44 448bd0                         mov        r10d, eax
00c47 4d63d2                         movsxd     r10, r10d
00c4a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c51 c442a8f5db                     bzhi       r11, r11, r10
00c56 c4c1fb92fb                     kmovq      k7, r11
00c5b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c61 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c67 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
00c6f e977faffff                     jmp        0x7f4c1be74f6b
00c74 c5f877                         vzeroupper 
00c77 49ba209f8f1b4c7f0000           movabs     r10, 0x7f4c1b8f9f20
00c81 41ffd2                         call       r10
00c84 0f1f840000000000               nop        dword ptr [rax + rax]
00c8c ebd9                           jmp        0x7f4c1be754e7
00c8e 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00c93 0f834b180000                   jae        0x7f4c1be76d64
00c99 4d63c2                         movsxd     r8, r10d
00c9c 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00ca1 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
00ca8 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00cb0 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00cb5 0f83c1180000                   jae        0x7f4c1be76dfc
00cbb 418d7310                       lea        esi, [r11 + 0x10]
00cbf 448bf6                         mov        r14d, esi
00cc2 4963cb                         movsxd     rcx, r11d
00cc5 8b742448                       mov        esi, dword ptr [rsp + 0x48]
00cc9 c5fa7f440e0c                   vmovdqu    xmmword ptr [rsi + rcx + 0xc], xmm0
00ccf 458bce                         mov        r9d, r14d
00cd2 453bcd                         cmp        r9d, r13d
00cd5 0f8d74020000                   jge        0x7f4c1be757cf
00cdb 4c2bc1                         sub        r8, rcx
00cde 4963f9                         movsxd     rdi, r9d
00ce1 48639c24dc000000               movsxd     rbx, dword ptr [rsp + 0xdc]
00ce9 4883c3f1                       add        rbx, -0xf
00ced 4a8d0c07                       lea        rcx, [rdi + r8]
00cf1 483bcb                         cmp        rcx, rbx
00cf4 0f83ce190000                   jae        0x7f4c1be76f48
00cfa 4963cd                         movsxd     rcx, r13d
00cfd 488bd1                         mov        rdx, rcx
00d00 482bd7                         sub        rdx, rdi
00d03 4883c20f                       add        rdx, 0xf
00d07 4883e2f0                       and        rdx, 0xfffffffffffffff0
00d0b 8bf2                           mov        esi, edx
00d0d 428d741e10                     lea        esi, [rsi + r11 + 0x10]
00d12 4863fe                         movsxd     rdi, esi
00d15 4e8d4407f0                     lea        r8, [rdi + r8 - 0x10]
00d1a 4c3bc3                         cmp        r8, rbx
00d1d 0f83a5190000                   jae        0x7f4c1be76f48
00d23 443b4c2478                     cmp        r9d, dword ptr [rsp + 0x78]
00d28 0f839a190000                   jae        0x7f4c1be76f48
00d2e 4883c7f0                       add        rdi, -0x10
00d32 4c8b442428                     mov        r8, qword ptr [rsp + 0x28]
00d37 4983c0f1                       add        r8, -0xf
00d3b 493bf8                         cmp        rdi, r8
00d3e 0f8384190000                   jae        0x7f4c1be76f48
00d44 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00d4b 0f8f2f1a0000                   jg         0x7f4c1be77000
00d51 418bda                         mov        ebx, r10d
00d54 412bdb                         sub        ebx, r11d
00d57 4183c320                       add        r11d, 0x20
00d5b 90                             nop        
00d5c 468d0c33                       lea        r9d, [rbx + r14]
00d60 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00d65 c4817a6f44080c                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 0xc]
00d6c 458bce                         mov        r9d, r14d
00d6f 8b7c2448                       mov        edi, dword ptr [rsp + 0x48]
00d73 c4a17a7f440f0c                 vmovdqu    xmmword ptr [rdi + r9 + 0xc], xmm0
00d7a 458d4610                       lea        r8d, [r14 + 0x10]
00d7e 458bf0                         mov        r14d, r8d
00d81 453bc3                         cmp        r8d, r11d
00d84 7cd6                           jl         0x7f4c1be755dc
00d86 4881c110ffffff                 add        rcx, -0xf0
00d8d 4881f900000080                 cmp        rcx, -0x80000000
00d94 49c7c300000080                 mov        r11, 0xffffffff80000000
00d9b 490f4ccb                       cmovl      rcx, r11
00d9f 448bc1                         mov        r8d, ecx
00da2 453bf0                         cmp        r14d, r8d
00da5 0f8d72010000                   jge        0x7f4c1be7579d
00dab 458bde                         mov        r11d, r14d
00dae 458bf3                         mov        r14d, r11d
00db1 0f1f840000000000               nop        dword ptr [rax + rax]
00db9 0f1f8000000000                 nop        dword ptr [rax]
00dc0 468d0c33                       lea        r9d, [rbx + r14]
00dc4 458bde                         mov        r11d, r14d
00dc7 4963cb                         movsxd     rcx, r11d
00dca 418bf9                         mov        edi, r9d
00dcd 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00dd2 c4c17a6f443b0c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xc]
00dd9 4963f9                         movsxd     rdi, r9d
00ddc 458bde                         mov        r11d, r14d
00ddf 8b542448                       mov        edx, dword ptr [rsp + 0x48]
00de3 c4a17a7f441a0c                 vmovdqu    xmmword ptr [rdx + r11 + 0xc], xmm0
00dea 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00def c4c17a6f443b1c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x1c]
00df6 c5fa7f440a1c                   vmovdqu    xmmword ptr [rdx + rcx + 0x1c], xmm0
00dfc 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00e01 c4c17a6f443b2c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x2c]
00e08 c5fa7f440a2c                   vmovdqu    xmmword ptr [rdx + rcx + 0x2c], xmm0
00e0e c4c17a6f443b3c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x3c]
00e15 c5fa7f440a3c                   vmovdqu    xmmword ptr [rdx + rcx + 0x3c], xmm0
00e1b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00e20 c4c17a6f443b4c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x4c]
00e27 c5fa7f440a4c                   vmovdqu    xmmword ptr [rdx + rcx + 0x4c], xmm0
00e2d c4c17a6f443b5c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x5c]
00e34 c5fa7f440a5c                   vmovdqu    xmmword ptr [rdx + rcx + 0x5c], xmm0
00e3a 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00e3f c4c17a6f443b6c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x6c]
00e46 c5fa7f440a6c                   vmovdqu    xmmword ptr [rdx + rcx + 0x6c], xmm0
00e4c c4c17a6f443b7c                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x7c]
00e53 c5fa7f440a7c                   vmovdqu    xmmword ptr [rdx + rcx + 0x7c], xmm0
00e59 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00e5e c4c17a6f843b8c000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x8c]
00e68 c5fa7f840a8c000000             vmovdqu    xmmword ptr [rdx + rcx + 0x8c], xmm0
00e71 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00e76 c4c17a6f843b9c000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0x9c]
00e80 c5fa7f840a9c000000             vmovdqu    xmmword ptr [rdx + rcx + 0x9c], xmm0
00e89 c4c17a6f843bac000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xac]
00e93 c5fa7f840aac000000             vmovdqu    xmmword ptr [rdx + rcx + 0xac], xmm0
00e9c 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00ea1 c4c17a6f843bbc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xbc]
00eab c5fa7f840abc000000             vmovdqu    xmmword ptr [rdx + rcx + 0xbc], xmm0
00eb4 c4c17a6f843bcc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xcc]
00ebe c5fa7f840acc000000             vmovdqu    xmmword ptr [rdx + rcx + 0xcc], xmm0
00ec7 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00ecc c4c17a6f843bdc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xdc]
00ed6 c5fa7f840adc000000             vmovdqu    xmmword ptr [rdx + rcx + 0xdc], xmm0
00edf c4c17a6f843bec000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xec]
00ee9 c5fa7f840aec000000             vmovdqu    xmmword ptr [rdx + rcx + 0xec], xmm0
00ef2 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
00ef7 c4c17a6f843bfc000000           vmovdqu    xmm0, xmmword ptr [r11 + rdi + 0xfc]
00f01 c5fa7f840afc000000             vmovdqu    xmmword ptr [rdx + rcx + 0xfc], xmm0
00f0a 458d9e00010000                 lea        r11d, [r14 + 0x100]
00f11 458bf3                         mov        r14d, r11d
00f14 453bd8                         cmp        r11d, r8d
00f17 0f8ca3feffff                   jl         0x7f4c1be75640
00f1d 453bf5                         cmp        r14d, r13d
00f20 7d2d                           jge        0x7f4c1be757cf
00f22 458bde                         mov        r11d, r14d
00f25 666690                         nop        
00f28 468d041b                       lea        r8d, [rbx + r11]
00f2c 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
00f31 c4817a6f44010c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xc]
00f38 458bc3                         mov        r8d, r11d
00f3b 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00f3f c4a17a7f44010c                 vmovdqu    xmmword ptr [rcx + r8 + 0xc], xmm0
00f46 4183c310                       add        r11d, 0x10
00f4a 453bdd                         cmp        r11d, r13d
00f4d 7cd9                           jl         0x7f4c1be757a8
00f4f 468d1c10                       lea        r11d, [rax + r10]
00f53 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f5b 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
00f63 e983f7ffff                     jmp        0x7f4c1be74f6b
00f68 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
00f6d 0f8381120000                   jae        0x7f4c1be76a74
00f73 4963d8                         movsxd     rbx, r8d
00f76 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f7b 4d8b4c1b0c                     mov        r9, qword ptr [r11 + rbx + 0xc]
00f80 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00f88 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00f8d 0f83f5120000                   jae        0x7f4c1be76b08
00f93 418d6a08                       lea        ebp, [r10 + 8]
00f97 4d63da                         movsxd     r11, r10d
00f9a 8b7c2448                       mov        edi, dword ptr [rsp + 0x48]
00f9e 4e894c1f0c                     mov        qword ptr [rdi + r11 + 0xc], r9
00fa3 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00faa 0f8ddf020000                   jge        0x7f4c1be75b0f
00fb0 492bdb                         sub        rbx, r11
00fb3 4863cd                         movsxd     rcx, ebp
00fb6 4c8d1c19                       lea        r11, [rcx + rbx]
00fba 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00fc2 0f8364130000                   jae        0x7f4c1be76bac
00fc8 4c8bda                         mov        r11, rdx
00fcb 4c2bd9                         sub        r11, rcx
00fce 4983c307                       add        r11, 7
00fd2 4983e3f8                       and        r11, 0xfffffffffffffff8
00fd6 458bcb                         mov        r9d, r11d
00fd9 478d5c1108                     lea        r11d, [r9 + r10 + 8]
00fde 4d63db                         movsxd     r11, r11d
00fe1 4d8d4c1bf8                     lea        r9, [r11 + rbx - 8]
00fe6 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
00fee 0f8338130000                   jae        0x7f4c1be76bac
00ff4 3b6c247c                       cmp        ebp, dword ptr [rsp + 0x7c]
00ff8 0f832e130000                   jae        0x7f4c1be76bac
00ffe 4983c3f8                       add        r11, -8
01002 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0100a 0f831c130000                   jae        0x7f4c1be76bac
01010 bef4ffffff                     mov        esi, 0xfffffff4
01015 448bcf                         mov        r9d, edi
01018 412bf1                         sub        esi, r9d
0101b 412bf2                         sub        esi, r10d
0101e 83c6f0                         add        esi, -0x10
01021 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01026 498bfb                         mov        rdi, r11
01029 458d4a10                       lea        r9d, [r10 + 0x10]
0102d 4d63d9                         movsxd     r11, r9d
01030 bb06000000                     mov        ebx, 6
01035 c462e0f5ce                     bzhi       r9, rsi, rbx
0103a 4d03d9                         add        r11, r9
0103d 4c3bda                         cmp        r11, rdx
01040 488bda                         mov        rbx, rdx
01043 490f4cdb                       cmovl      rbx, r11
01047 4c8bdb                         mov        r11, rbx
0104a 4c2bd9                         sub        r11, rcx
0104d 4d8d4bff                       lea        r9, [r11 - 1]
01051 49c1f93f                       sar        r9, 0x3f
01055 49c1e93d                       shr        r9, 0x3d
01059 4f8d5c19ff                     lea        r11, [r9 + r11 - 1]
0105e 4983e3f8                       and        r11, 0xfffffffffffffff8
01062 4c03d9                         add        r11, rcx
01065 493bcb                         cmp        rcx, r11
01068 490f4ccb                       cmovl      rcx, r11
0106c 448bc9                         mov        r9d, ecx
0106f 458d5908                       lea        r11d, [r9 + 8]
01073 442b8c248c000000               sub        r9d, dword ptr [rsp + 0x8c]
0107b 4963cb                         movsxd     rcx, r11d
0107e 4803cf                         add        rcx, rdi
01081 4183c108                       add        r9d, 8
01085 4d63c9                         movsxd     r9, r9d
01088 4c03cf                         add        r9, rdi
0108b 488d794c                       lea        rdi, [rcx + 0x4c]
0108f 4883c10c                       add        rcx, 0xc
01093 498d710c                       lea        rsi, [r9 + 0xc]
01097 4533db                         xor        r11d, r11d
0109a 483bfe                         cmp        rdi, rsi
0109d 410f96c3                       setbe      r11b
010a1 4983c14c                       add        r9, 0x4c
010a5 33ff                           xor        edi, edi
010a7 4c3bc9                         cmp        r9, rcx
010aa 400f96c7                       setbe      dil
010ae 440bdf                         or         r11d, edi
010b1 0f8405130000                   je         0x7f4c1be76c3c
010b7 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
010bf 4181f9f8ffff7f                 cmp        r9d, 0x7ffffff8
010c6 0f8f88130000                   jg         0x7f4c1be76cd4
010cc 452bc2                         sub        r8d, r10d
010cf 448bdb                         mov        r11d, ebx
010d2 6690                           nop        
010d4 458d1428                       lea        r10d, [r8 + rbp]
010d8 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
010dd 4f8b54110c                     mov        r10, qword ptr [r9 + r10 + 0xc]
010e2 448bcd                         mov        r9d, ebp
010e5 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
010e9 4e89540b0c                     mov        qword ptr [rbx + r9 + 0xc], r10
010ee 83c508                         add        ebp, 8
010f1 413beb                         cmp        ebp, r11d
010f4 7cde                           jl         0x7f4c1be75954
010f6 4c8d9208feffff                 lea        r10, [rdx - 0x1f8]
010fd 4981fa00000080                 cmp        r10, -0x80000000
01104 49c7c300000080                 mov        r11, 0xffffffff80000000
0110b 4d0f4cd3                       cmovl      r10, r11
0110f 418bca                         mov        ecx, r10d
01112 3be9                           cmp        ebp, ecx
01114 0f8d43010000                   jge        0x7f4c1be75add
0111a 660f1f440000                   nop        word ptr [rax + rax]
01120 448bd5                         mov        r10d, ebp
01123 4963da                         movsxd     rbx, r10d
01126 448bdd                         mov        r11d, ebp
01129 458d1428                       lea        r10d, [r8 + rbp]
0112d 8d8580000000                   lea        eax, [rbp + 0x80]
01133 4103c0                         add        eax, r8d
01136 458bca                         mov        r9d, r10d
01139 8b7c2448                       mov        edi, dword ptr [rsp + 0x48]
0113d 62b17e486f840f0c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 0xc]
01148 62b17e487f841f0c000000         vmovdqu32  zmmword ptr [rdi + r11 + 0xc], zmm0
01153 4d63ca                         movsxd     r9, r10d
01156 62b17e486f840f4c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 0x4c]
01161 62f17e487f841f4c000000         vmovdqu32  zmmword ptr [rdi + rbx + 0x4c], zmm0
0116c 448bd8                         mov        r11d, eax
0116f 62b17e486f841f0c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11 + 0xc]
0117a 62f17e487f841f8c000000         vmovdqu32  zmmword ptr [rdi + rbx + 0x8c], zmm0
01185 4c63d0                         movsxd     r10, eax
01188 62b17e486f84174c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r10 + 0x4c]
01193 62f17e487f841fcc000000         vmovdqu32  zmmword ptr [rdi + rbx + 0xcc], zmm0
0119e 448d9d00010000                 lea        r11d, [rbp + 0x100]
011a5 4503d8                         add        r11d, r8d
011a8 458bd3                         mov        r10d, r11d
011ab 62b17e486f841f0c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11 + 0xc]
011b6 62f17e487f841f0c010000         vmovdqu32  zmmword ptr [rdi + rbx + 0x10c], zmm0
011c1 4d63d2                         movsxd     r10, r10d
011c4 62b17e486f84174c000000         vmovdqu32  zmm0, zmmword ptr [rdi + r10 + 0x4c]
011cf 62f17e487f841f4c010000         vmovdqu32  zmmword ptr [rdi + rbx + 0x14c], zmm0
011da 62b17e486f840f8c010000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 0x18c]
011e5 62f17e487f841f8c010000         vmovdqu32  zmmword ptr [rdi + rbx + 0x18c], zmm0
011f0 62b17e486f840fcc010000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 0x1cc]
011fb 62f17e487f841fcc010000         vmovdqu32  zmmword ptr [rdi + rbx + 0x1cc], zmm0
01206 81c500020000                   add        ebp, 0x200
0120c 3be9                           cmp        ebp, ecx
0120e 0f8c0cffffff                   jl         0x7f4c1be759a0
01214 4883c2c8                       add        rdx, -0x38
01218 4881fa00000080                 cmp        rdx, -0x80000000
0121f 49c7c200000080                 mov        r10, 0xffffffff80000000
01226 490f4cd2                       cmovl      rdx, r10
0122a 448bda                         mov        r11d, edx
0122d 413beb                         cmp        ebp, r11d
01230 7d2b                           jge        0x7f4c1be75add
01232 6690                           nop        
01234 458d0c28                       lea        r9d, [r8 + rbp]
01238 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0123c 62b17e486f84090c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r9 + 0xc]
01247 448bcd                         mov        r9d, ebp
0124a 62b17e487f84090c000000         vmovdqu32  zmmword ptr [rcx + r9 + 0xc], zmm0
01255 83c540                         add        ebp, 0x40
01258 413beb                         cmp        ebp, r11d
0125b 7cd7                           jl         0x7f4c1be75ab4
0125d 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
01264 7d29                           jge        0x7f4c1be75b0f
01266 6690                           nop        
01268 458d1c28                       lea        r11d, [r8 + rbp]
0126c 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01271 4f8b54190c                     mov        r10, qword ptr [r9 + r11 + 0xc]
01276 448bcd                         mov        r9d, ebp
01279 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0127e 4f89540b0c                     mov        qword ptr [r11 + r9 + 0xc], r10
01283 83c508                         add        ebp, 8
01286 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
0128d 7cd9                           jl         0x7f4c1be75ae8
0128f 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01297 e9d2f2ffff                     jmp        0x7f4c1be74dee
0129c 4c03c9                         add        r9, rcx
0129f 4c3b4c2458                     cmp        r9, qword ptr [rsp + 0x58]
012a4 7e08                           jle        0x7f4c1be75b2e
012a6 4533c0                         xor        r8d, r8d
012a9 e905eeffff                     jmp        0x7f4c1be74933
012ae 4533c0                         xor        r8d, r8d
012b1 ba01000000                     mov        edx, 1
012b6 e9faedffff                     jmp        0x7f4c1be74935
012bb bee4ffffff                     mov        esi, 0xffffffe4
012c0 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
012c5 448b1c24                       mov        r11d, dword ptr [rsp]
012c9 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
012d1 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
012d6 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
012de 448b442408                     mov        r8d, dword ptr [rsp + 8]
012e3 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
012eb 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
012f0 4c891c24                       mov        qword ptr [rsp], r11
012f4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
012f9 44895c2408                     mov        dword ptr [rsp + 8], r11d
012fe 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01303 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01308 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0130d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01312 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01317 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0131c 89442428                       mov        dword ptr [rsp + 0x28], eax
01320 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01325 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0132a 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0132f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01334 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01339 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0133e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01343 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01348 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0134d 666690                         nop        
01350 c5f877                         vzeroupper 
01353 e88821b6ff                     call       0x7f4c1b9d7d60
01358 0f1f840050140007               nop        dword ptr [rax + rax + 0x7001450]
01360 bee4ffffff                     mov        esi, 0xffffffe4
01365 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0136a 448b0424                       mov        r8d, dword ptr [rsp]
0136e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01376 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
0137b 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
01383 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01388 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
01390 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01395 4c890424                       mov        qword ptr [rsp], r8
01399 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0139e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
013a3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013a8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013ad 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
013b2 4489442414                     mov        dword ptr [rsp + 0x14], r8d
013b7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
013bc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
013c1 89442428                       mov        dword ptr [rsp + 0x28], eax
013c5 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
013ca c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
013d0 c5f877                         vzeroupper 
013d3 e80821b6ff                     call       0x7f4c1b9d7d60
013d8 0f1f8400d0140008               nop        dword ptr [rax + rax + 0x80014d0]
013e0 bee4ffffff                     mov        esi, 0xffffffe4
013e5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
013ea 448b1424                       mov        r10d, dword ptr [rsp]
013ee 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
013f6 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
013fb 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01403 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01408 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01410 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01415 4c891424                       mov        qword ptr [rsp], r10
01419 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0141e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01423 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01428 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0142d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01432 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01437 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0143c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01441 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01446 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0144b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01450 c5f877                         vzeroupper 
01453 e88820b6ff                     call       0x7f4c1b9d7d60
01458 0f1f840050150009               nop        dword ptr [rax + rax + 0x9001550]
01460 be45ffffff                     mov        esi, 0xffffff45
01465 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0146d 666690                         nop        
01470 c5f877                         vzeroupper 
01473 e86820b6ff                     call       0x7f4c1b9d7d60
01478 0f1f84007015000a               nop        dword ptr [rax + rax + 0xa001570]
01480 be45ffffff                     mov        esi, 0xffffff45
01485 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0148a 448b1c24                       mov        r11d, dword ptr [rsp]
0148e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01496 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0149b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
014a3 448b442408                     mov        r8d, dword ptr [rsp + 8]
014a8 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
014b0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014b5 4c891c24                       mov        qword ptr [rsp], r11
014b9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
014be 44895c2408                     mov        dword ptr [rsp + 8], r11d
014c3 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014c8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014cd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014d2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
014d7 4489542414                     mov        dword ptr [rsp + 0x14], r10d
014dc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
014e1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
014e6 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
014eb 89442428                       mov        dword ptr [rsp + 0x28], eax
014ef 897c2430                       mov        dword ptr [rsp + 0x30], edi
014f3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
014f8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014fd 666690                         nop        
01500 c5f877                         vzeroupper 
01503 e8d81fb6ff                     call       0x7f4c1b9d7d60
01508 0f1f84000016000b               nop        dword ptr [rax + rax + 0xb001600]
01510 493bdb                         cmp        rbx, r11
01513 bdffffffff                     mov        ebp, 0xffffffff
01518 7c08                           jl         0x7f4c1be75da2
0151a 400f95c5                       setne      bpl
0151e 400fb6ed                       movzx      ebp, bpl
01522 be45ffffff                     mov        esi, 0xffffff45
01527 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
0152c 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01534 448b0424                       mov        r8d, dword ptr [rsp]
01538 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
01540 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01545 4c890424                       mov        qword ptr [rsp], r8
01549 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0154e 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
01556 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0155b 4c89442408                     mov        qword ptr [rsp + 8], r8
01560 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01565 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0156a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0156f 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01574 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01579 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0157e 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01583 89442430                       mov        dword ptr [rsp + 0x30], eax
01587 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
0158c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01591 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01596 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0159b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
015a0 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
015a5 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
015aa 6690                           nop        
015ac c5f877                         vzeroupper 
015af e82c1fb6ff                     call       0x7f4c1b9d7d60
015b4 0f1f8400ac16000c               nop        dword ptr [rax + rax + 0xc0016ac]
015bc be45ffffff                     mov        esi, 0xffffff45
015c1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
015c6 448b0c24                       mov        r9d, dword ptr [rsp]
015ca 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
015d2 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
015d7 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
015df 448b442408                     mov        r8d, dword ptr [rsp + 8]
015e4 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
015ec 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
015f1 4c890424                       mov        qword ptr [rsp], r8
015f5 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
015fa 44894c2408                     mov        dword ptr [rsp + 8], r9d
015ff 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01604 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01609 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0160e 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01613 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01618 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0161d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01622 89442428                       mov        dword ptr [rsp + 0x28], eax
01626 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0162b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01630 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01635 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0163a 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0163f 90                             nop        
01640 c5f877                         vzeroupper 
01643 e8981eb6ff                     call       0x7f4c1b9d7d60
01648 0f1f84004017000d               nop        dword ptr [rax + rax + 0xd001740]
01650 be45ffffff                     mov        esi, 0xffffff45
01655 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0165a 448b1c24                       mov        r11d, dword ptr [rsp]
0165e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01666 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0166b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01673 448b442408                     mov        r8d, dword ptr [rsp + 8]
01678 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01680 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01685 4c891c24                       mov        qword ptr [rsp], r11
01689 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0168e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01693 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01698 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0169d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016a2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
016a7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016ac 89442428                       mov        dword ptr [rsp + 0x28], eax
016b0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
016b5 4c89542440                     mov        qword ptr [rsp + 0x40], r10
016ba 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016bf 4c89542448                     mov        qword ptr [rsp + 0x48], r10
016c4 c5f877                         vzeroupper 
016c7 e8141eb6ff                     call       0x7f4c1b9d7d60
016cc 0f1f8400c417000e               nop        dword ptr [rax + rax + 0xe0017c4]
016d4 bee4ffffff                     mov        esi, 0xffffffe4
016d9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016de 448b1c24                       mov        r11d, dword ptr [rsp]
016e2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
016ea 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016ef 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
016f7 448b542408                     mov        r10d, dword ptr [rsp + 8]
016fc 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01704 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01709 4c891424                       mov        qword ptr [rsp], r10
0170d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01712 4489542408                     mov        dword ptr [rsp + 8], r10d
01717 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0171c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01721 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01726 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0172b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01730 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01735 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0173a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0173f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01744 c5f877                         vzeroupper 
01747 e8941db6ff                     call       0x7f4c1b9d7d60
0174c 0f1f84004418000f               nop        dword ptr [rax + rax + 0xf001844]
01754 bee4ffffff                     mov        esi, 0xffffffe4
01759 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0175e 448b1424                       mov        r10d, dword ptr [rsp]
01762 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0176a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0176f 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01777 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0177c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01784 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01789 4c891424                       mov        qword ptr [rsp], r10
0178d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01792 4489542408                     mov        dword ptr [rsp + 8], r10d
01797 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0179c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017a1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
017a6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017ab 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017b0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017b5 4489442434                     mov        dword ptr [rsp + 0x34], r8d
017ba 48894c2438                     mov        qword ptr [rsp + 0x38], rcx
017bf 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
017c4 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
017c9 666690                         nop        
017cc c5f877                         vzeroupper 
017cf e80c1db6ff                     call       0x7f4c1b9d7d60
017d4 0f1f8400cc180010               nop        dword ptr [rax + rax + 0x100018cc]
017dc 4183c008                       add        r8d, 8
017e0 be6effffff                     mov        esi, 0xffffff6e
017e5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
017ea 448b1c24                       mov        r11d, dword ptr [rsp]
017ee 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
017f6 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
017fb 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01803 448b542408                     mov        r10d, dword ptr [rsp + 8]
01808 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01810 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01815 4c891424                       mov        qword ptr [rsp], r10
01819 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0181e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01823 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01828 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0182d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01832 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01837 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0183c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01841 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01846 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0184e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01853 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01857 458bd3                         mov        r10d, r11d
0185a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0185f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01864 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01869 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0186e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01873 90                             nop        
01874 c5f877                         vzeroupper 
01877 e8641cb6ff                     call       0x7f4c1b9d7d60
0187c 0f1f840074190011               nop        dword ptr [rax + rax + 0x11001974]
01884 4183c008                       add        r8d, 8
01888 be66ffffff                     mov        esi, 0xffffff66
0188d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01892 448b1c24                       mov        r11d, dword ptr [rsp]
01896 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0189e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018a3 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
018ab 448b542408                     mov        r10d, dword ptr [rsp + 8]
018b0 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
018b8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018bd 4c891424                       mov        qword ptr [rsp], r10
018c1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018c6 4489542408                     mov        dword ptr [rsp + 8], r10d
018cb 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
018d0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018da 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018df 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018e4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
018e9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018ee 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
018f6 4489442434                     mov        dword ptr [rsp + 0x34], r8d
018fb 895c2438                       mov        dword ptr [rsp + 0x38], ebx
018ff 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01904 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01909 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0190e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01913 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01918 c5f877                         vzeroupper 
0191b e8c01bb6ff                     call       0x7f4c1b9d7d60
01920 0f1f8400181a0012               nop        dword ptr [rax + rax + 0x12001a18]
01928 beccffffff                     mov        esi, 0xffffffcc
0192d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01932 448b1c24                       mov        r11d, dword ptr [rsp]
01936 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0193e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01943 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0194b 448b542408                     mov        r10d, dword ptr [rsp + 8]
01950 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01958 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0195d 4c891424                       mov        qword ptr [rsp], r10
01961 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01966 44895c2408                     mov        dword ptr [rsp + 8], r11d
0196b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01970 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01975 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0197a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0197f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01984 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01989 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
01991 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01996 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0199b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
019a0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019a5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
019aa 4c89542448                     mov        qword ptr [rsp + 0x48], r10
019af 90                             nop        
019b0 c5f877                         vzeroupper 
019b3 e8281bb6ff                     call       0x7f4c1b9d7d60
019b8 0f1f8400b01a0013               nop        dword ptr [rax + rax + 0x13001ab0]
019c0 beccffffff                     mov        esi, 0xffffffcc
019c5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019ca 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
019d2 448b1424                       mov        r10d, dword ptr [rsp]
019d6 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
019de 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019e3 4c891424                       mov        qword ptr [rsp], r10
019e7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
019ec 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
019f4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019f9 4c89542408                     mov        qword ptr [rsp + 8], r10
019fe 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a03 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01a08 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a0d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a12 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a17 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a1c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a21 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a26 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a2b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a30 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01a35 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a3a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a3f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01a44 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a49 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01a4e 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01a53 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01a58 c5f877                         vzeroupper 
01a5b e8801ab6ff                     call       0x7f4c1b9d7d60
01a60 0f1f8400581b0014               nop        dword ptr [rax + rax + 0x14001b58]
01a68 85db                           test       ebx, ebx
01a6a 0f84c80d0000                   je         0x7f4c1be770b8
01a70 448b0424                       mov        r8d, dword ptr [rsp]
01a74 458bda                         mov        r11d, r10d
01a77 4533c9                         xor        r9d, r9d
01a7a 458bd0                         mov        r10d, r8d
01a7d e9d9f0ffff                     jmp        0x7f4c1be753db
01a82 bee4ffffff                     mov        esi, 0xffffffe4
01a87 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01a8c 448b1c24                       mov        r11d, dword ptr [rsp]
01a90 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01a98 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a9d 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01aa5 448b442408                     mov        r8d, dword ptr [rsp + 8]
01aaa 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01ab2 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01ab7 4c891c24                       mov        qword ptr [rsp], r11
01abb 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01ac0 4489442408                     mov        dword ptr [rsp + 8], r8d
01ac5 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01aca 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01acf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ad4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ad9 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ade 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ae3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01ae8 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01aed 89442428                       mov        dword ptr [rsp + 0x28], eax
01af1 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01af5 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01afa 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01aff 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01b04 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01b09 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01b0e 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01b13 90                             nop        
01b14 c5f877                         vzeroupper 
01b17 e8c419b6ff                     call       0x7f4c1b9d7d60
01b1c 0f1f8400141c0015               nop        dword ptr [rax + rax + 0x15001c14]
01b24 be6effffff                     mov        esi, 0xffffff6e
01b29 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01b2e 448b0424                       mov        r8d, dword ptr [rsp]
01b32 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01b3a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b3f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01b47 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b4c 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01b54 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b59 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b5e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b68 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b6d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b72 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01b77 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b7c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b81 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01b86 89442428                       mov        dword ptr [rsp + 0x28], eax
01b8a 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01b8e 897c2440                       mov        dword ptr [rsp + 0x40], edi
01b92 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01b97 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b9c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01ba1 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01ba6 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01bab 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01bb0 c5f877                         vzeroupper 
01bb3 e82819b6ff                     call       0x7f4c1b9d7d60
01bb8 0f1f8400b01c0016               nop        dword ptr [rax + rax + 0x16001cb0]
01bc0 be45ffffff                     mov        esi, 0xffffff45
01bc5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01bca 448b1c24                       mov        r11d, dword ptr [rsp]
01bce 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01bd6 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01bdb 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01be3 448b442408                     mov        r8d, dword ptr [rsp + 8]
01be8 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01bf0 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01bf5 4489442408                     mov        dword ptr [rsp + 8], r8d
01bfa 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01bff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c09 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c0e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c13 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01c18 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c1d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01c22 89442428                       mov        dword ptr [rsp + 0x28], eax
01c26 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01c2a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01c2f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c34 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c39 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01c3e 6690                           nop        
01c40 c5f877                         vzeroupper 
01c43 e89818b6ff                     call       0x7f4c1b9d7d60
01c48 0f1f8400401d0017               nop        dword ptr [rax + rax + 0x17001d40]
01c50 be3dffffff                     mov        esi, 0xffffff3d
01c55 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01c5a 448b1c24                       mov        r11d, dword ptr [rsp]
01c5e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01c66 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01c6b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01c73 448b442408                     mov        r8d, dword ptr [rsp + 8]
01c78 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01c80 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c85 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c8a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01c8f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c94 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c99 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c9e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ca3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ca8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01cad 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01cb2 89442428                       mov        dword ptr [rsp + 0x28], eax
01cb6 897c243c                       mov        dword ptr [rsp + 0x3c], edi
01cba 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01cbf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cc4 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cc9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01cce 6690                           nop        
01cd0 c5f877                         vzeroupper 
01cd3 e80818b6ff                     call       0x7f4c1b9d7d60
01cd8 0f1f8400d01d0018               nop        dword ptr [rax + rax + 0x18001dd0]
01ce0 bee4ffffff                     mov        esi, 0xffffffe4
01ce5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01cea 448b1424                       mov        r10d, dword ptr [rsp]
01cee 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01cf6 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cfb 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01d03 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d08 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01d10 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d15 4c891424                       mov        qword ptr [rsp], r10
01d19 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01d1e 4489542408                     mov        dword ptr [rsp + 8], r10d
01d23 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d28 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01d2d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d32 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01d37 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d3c 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01d41 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01d46 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d4b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d50 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01d55 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d5a 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01d5f 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01d64 c5f877                         vzeroupper 
01d67 e87417b6ff                     call       0x7f4c1b9d7d60
01d6c 0f1f8400641e0019               nop        dword ptr [rax + rax + 0x19001e64]
01d74 bee4ffffff                     mov        esi, 0xffffffe4
01d79 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d7e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01d86 448b1424                       mov        r10d, dword ptr [rsp]
01d8a 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01d92 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d97 4c891424                       mov        qword ptr [rsp], r10
01d9b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01da0 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01da8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01dad 4c89542408                     mov        qword ptr [rsp + 8], r10
01db2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01db7 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01dbc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dc1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dc6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01dcb 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01dd0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01dd5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01dda 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01ddf 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01de4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01de9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01dee 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01df3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01df8 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01dfd 666690                         nop        
01e00 c5f877                         vzeroupper 
01e03 e8d816b6ff                     call       0x7f4c1b9d7d60
01e08 0f1f8400001f001a               nop        dword ptr [rax + rax + 0x1a001f00]
01e10 418d6801                       lea        ebp, [r8 + 1]
01e14 bee4ffffff                     mov        esi, 0xffffffe4
01e19 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01e1e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01e26 448b1c24                       mov        r11d, dword ptr [rsp]
01e2a 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01e32 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e37 4c891424                       mov        qword ptr [rsp], r10
01e3b 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e40 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01e48 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e4d 4c89542408                     mov        qword ptr [rsp + 8], r10
01e52 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e57 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e66 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e6b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e70 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e75 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01e7a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01e7f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e84 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01e89 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01e8e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e93 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01e98 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e9d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ea2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ea7 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01eac c5f877                         vzeroupper 
01eaf e82c16b6ff                     call       0x7f4c1b9d7d60
01eb4 0f1f8400ac1f001b               nop        dword ptr [rax + rax + 0x1b001fac]
01ebc bee4ffffff                     mov        esi, 0xffffffe4
01ec1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ec6 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01ece 448b1424                       mov        r10d, dword ptr [rsp]
01ed2 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01eda 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01edf 4c891424                       mov        qword ptr [rsp], r10
01ee3 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ee8 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01ef0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ef5 4c89542408                     mov        qword ptr [rsp + 8], r10
01efa 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01eff 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f04 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f09 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f0e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01f13 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01f18 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f1d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01f22 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01f27 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01f2c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01f31 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01f36 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01f3b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01f40 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01f45 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01f4a 6690                           nop        
01f4c c5f877                         vzeroupper 
01f4f e88c15b6ff                     call       0x7f4c1b9d7d60
01f54 0f1f84004c20001c               nop        dword ptr [rax + rax + 0x1c00204c]
01f5c bee4ffffff                     mov        esi, 0xffffffe4
01f61 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01f66 448b1424                       mov        r10d, dword ptr [rsp]
01f6a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01f72 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01f77 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01f7f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f84 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01f8c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01f91 4c891424                       mov        qword ptr [rsp], r10
01f95 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f9a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f9f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01fa4 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01fa9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fae 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01fb3 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01fb7 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01fbc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01fc1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fc6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fcb 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01fd0 c5f877                         vzeroupper 
01fd3 e80815b6ff                     call       0x7f4c1b9d7d60
01fd8 0f1f8400d020001d               nop        dword ptr [rax + rax + 0x1d0020d0]
01fe0 beccffffff                     mov        esi, 0xffffffcc
01fe5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01fea 448b1c24                       mov        r11d, dword ptr [rsp]
01fee 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01ff6 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ffb 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02003 448b542408                     mov        r10d, dword ptr [rsp + 8]
02008 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02010 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02015 4c891424                       mov        qword ptr [rsp], r10
02019 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0201e 4489542408                     mov        dword ptr [rsp + 8], r10d
02023 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02028 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0202d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02032 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02037 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0203c 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02041 4489442438                     mov        dword ptr [rsp + 0x38], r8d
02046 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0204b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02050 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02055 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0205a 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0205f 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02064 c5f877                         vzeroupper 
02067 e87414b6ff                     call       0x7f4c1b9d7d60
0206c 0f1f84006421001e               nop        dword ptr [rax + rax + 0x1e002164]
02074 be45ffffff                     mov        esi, 0xffffff45
02079 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0207e 448b1c24                       mov        r11d, dword ptr [rsp]
02082 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0208a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0208f 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02097 448b542408                     mov        r10d, dword ptr [rsp + 8]
0209c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
020a4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020a9 4c891424                       mov        qword ptr [rsp], r10
020ad 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
020b2 44895c2408                     mov        dword ptr [rsp + 8], r11d
020b7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020c1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
020c6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
020cb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020d0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
020d5 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
020da 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020df 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020e4 c5f877                         vzeroupper 
020e7 e8f413b6ff                     call       0x7f4c1b9d7d60
020ec 0f1f8400e421001f               nop        dword ptr [rax + rax + 0x1f0021e4]
020f4 be17000000                     mov        esi, 0x17
020f9 666690                         nop        
020fc c5f877                         vzeroupper 
020ff e8dc13b6ff                     call       0x7f4c1b9d7d60
02104 0f1f8400fc210020               nop        dword ptr [rax + rax + 0x200021fc]
0210c be6effffff                     mov        esi, 0xffffff6e
02111 498bee                         mov        rbp, r14
02114 448b1424                       mov        r10d, dword ptr [rsp]
02118 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02120 4c891c24                       mov        qword ptr [rsp], r11
02124 895c2408                       mov        dword ptr [rsp + 8], ebx
02128 48ff742420                     push       qword ptr [rsp + 0x20]
0212d 488f442410                     pop        qword ptr [rsp + 0x10]
02132 894c2418                       mov        dword ptr [rsp + 0x18], ecx
02136 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0213b 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02140 89542438                       mov        dword ptr [rsp + 0x38], edx
02144 4c89442440                     mov        qword ptr [rsp + 0x40], r8
02149 666690                         nop        
0214c c5f877                         vzeroupper 
0214f e88c13b6ff                     call       0x7f4c1b9d7d60
02154 0f1f84004c220021               nop        dword ptr [rax + rax + 0x2100224c]
0215c bebeffffff                     mov        esi, 0xffffffbe
02161 498bee                         mov        rbp, r14
02164 448b1424                       mov        r10d, dword ptr [rsp]
02168 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02170 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02178 48890424                       mov        qword ptr [rsp], rax
0217c 895c2408                       mov        dword ptr [rsp + 8], ebx
02180 48ff742420                     push       qword ptr [rsp + 0x20]
02185 488f442410                     pop        qword ptr [rsp + 0x10]
0218a 894c2418                       mov        dword ptr [rsp + 0x18], ecx
0218e 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02193 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02198 89542438                       mov        dword ptr [rsp + 0x38], edx
0219c 4c89442440                     mov        qword ptr [rsp + 0x40], r8
021a1 666690                         nop        
021a4 c5f877                         vzeroupper 
021a7 e83413b6ff                     call       0x7f4c1b9d7d60
021ac 0f1f8400a4220022               nop        dword ptr [rax + rax + 0x220022a4]
021b4 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
021b9 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
021bd beccffffff                     mov        esi, 0xffffffcc
021c2 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
021ca 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
021d2 899c24dc000000                 mov        dword ptr [rsp + 0xdc], ebx
021d9 44891c24                       mov        dword ptr [rsp], r11d
021dd 4489542410                     mov        dword ptr [rsp + 0x10], r10d
021e2 6690                           nop        
021e4 c5f877                         vzeroupper 
021e7 e8f412b6ff                     call       0x7f4c1b9d7d60
021ec 0f1f8400e4220023               nop        dword ptr [rax + rax + 0x230022e4]
021f4 bee4ffffff                     mov        esi, 0xffffffe4
021f9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
021fe 448b1c24                       mov        r11d, dword ptr [rsp]
02202 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0220a 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0220f 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02217 448b542408                     mov        r10d, dword ptr [rsp + 8]
0221c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02224 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02229 4c891424                       mov        qword ptr [rsp], r10
0222d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02232 44895c2408                     mov        dword ptr [rsp + 8], r11d
02237 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0223c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02241 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02246 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0224b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02250 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02255 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0225a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0225f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02264 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02269 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0226e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02273 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02278 c5f877                         vzeroupper 
0227b e86012b6ff                     call       0x7f4c1b9d7d60
02280 0f1f840078230024               nop        dword ptr [rax + rax + 0x24002378]
02288 bee4ffffff                     mov        esi, 0xffffffe4
0228d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02292 448b1424                       mov        r10d, dword ptr [rsp]
02296 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0229e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
022a3 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
022ab 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
022b0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
022b8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
022bd 4c891424                       mov        qword ptr [rsp], r10
022c1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022c6 4489542408                     mov        dword ptr [rsp + 8], r10d
022cb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022d0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
022d5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
022da 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
022df 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
022e4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
022e9 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
022ee 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
022f3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022f8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
022fd 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02302 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02307 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0230c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02311 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02316 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
0231b 90                             nop        
0231c c5f877                         vzeroupper 
0231f e8bc11b6ff                     call       0x7f4c1b9d7d60
02324 0f1f84001c240025               nop        dword ptr [rax + rax + 0x2500241c]
0232c 4183c008                       add        r8d, 8
02330 be6effffff                     mov        esi, 0xffffff6e
02335 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0233a 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02342 448b1424                       mov        r10d, dword ptr [rsp]
02346 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
0234e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02353 4c891424                       mov        qword ptr [rsp], r10
02357 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0235c 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02364 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02369 4c89542408                     mov        qword ptr [rsp + 8], r10
0236e 897c2410                       mov        dword ptr [rsp + 0x10], edi
02372 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02377 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0237c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02381 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02386 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0238b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02390 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
02398 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0239d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
023a2 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023a7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023ac c5f877                         vzeroupper 
023af e82c11b6ff                     call       0x7f4c1b9d7d60
023b4 0f1f8400ac240026               nop        dword ptr [rax + rax + 0x260024ac]
023bc 4183c008                       add        r8d, 8
023c0 beb6ffffff                     mov        esi, 0xffffffb6
023c5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023ca 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
023d2 448b1424                       mov        r10d, dword ptr [rsp]
023d6 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
023de 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023e3 4c891424                       mov        qword ptr [rsp], r10
023e7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
023ec 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
023f4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
023f9 4c89542408                     mov        qword ptr [rsp + 8], r10
023fe 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02403 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02408 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0240d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02412 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02417 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0241c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02421 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02426 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0242e 4489442430                     mov        dword ptr [rsp + 0x30], r8d
02433 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02438 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0243d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02442 6690                           nop        
02444 c5f877                         vzeroupper 
02447 e89410b6ff                     call       0x7f4c1b9d7d60
0244c 0f1f840044250027               nop        dword ptr [rax + rax + 0x27002544]
02454 4183c008                       add        r8d, 8
02458 be66ffffff                     mov        esi, 0xffffff66
0245d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02462 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0246a 448b1424                       mov        r10d, dword ptr [rsp]
0246e 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
02476 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0247b 4c891424                       mov        qword ptr [rsp], r10
0247f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02484 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0248c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02491 4c89542408                     mov        qword ptr [rsp + 8], r10
02496 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0249b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
024a0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024a5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024aa 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
024af 4489542420                     mov        dword ptr [rsp + 0x20], r10d
024b4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024b9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
024be 4489442430                     mov        dword ptr [rsp + 0x30], r8d
024c3 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
024c8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
024cd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
024d2 6690                           nop        
024d4 c5f877                         vzeroupper 
024d7 e80410b6ff                     call       0x7f4c1b9d7d60
024dc 0f1f8400d4250028               nop        dword ptr [rax + rax + 0x280025d4]
024e4 bee4ffffff                     mov        esi, 0xffffffe4
024e9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
024ee 448b1c24                       mov        r11d, dword ptr [rsp]
024f2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
024fa 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
024ff 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02507 448b442408                     mov        r8d, dword ptr [rsp + 8]
0250c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02514 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02519 4c891c24                       mov        qword ptr [rsp], r11
0251d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02522 44895c2408                     mov        dword ptr [rsp + 8], r11d
02527 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0252c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02531 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
02536 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0253b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02540 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02545 89442424                       mov        dword ptr [rsp + 0x24], eax
02549 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
0254e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02553 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02558 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0255d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02562 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02567 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0256c c5f877                         vzeroupper 
0256f e86c0fb6ff                     call       0x7f4c1b9d7d60
02574 0f1f84006c260029               nop        dword ptr [rax + rax + 0x2900266c]
0257c bee4ffffff                     mov        esi, 0xffffffe4
02581 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02586 448b0424                       mov        r8d, dword ptr [rsp]
0258a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02592 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
02597 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
0259f 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
025a4 44898c24d4000000               mov        dword ptr [rsp + 0xd4], r9d
025ac 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
025b1 4c890424                       mov        qword ptr [rsp], r8
025b5 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
025ba 44894c2408                     mov        dword ptr [rsp + 8], r9d
025bf 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
025c4 4c89442410                     mov        qword ptr [rsp + 0x10], r8
025c9 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
025ce 4489442418                     mov        dword ptr [rsp + 0x18], r8d
025d3 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
025d8 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
025dd 89442424                       mov        dword ptr [rsp + 0x24], eax
025e1 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
025e6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
025eb 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
025f0 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025f5 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
025fa 4c89542448                     mov        qword ptr [rsp + 0x48], r10
025ff 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02604 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02609 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0260e 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02613 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02618 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0261d c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
02623 90                             nop        
02624 c5f877                         vzeroupper 
02627 e8b40eb6ff                     call       0x7f4c1b9d7d60
0262c 0f1f84002427002a               nop        dword ptr [rax + rax + 0x2a002724]
02634 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
0263c beccffffff                     mov        esi, 0xffffffcc
02641 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02646 448b0424                       mov        r8d, dword ptr [rsp]
0264a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02652 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02657 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0265f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02664 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0266c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02671 4c891c24                       mov        qword ptr [rsp], r11
02675 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0267a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0267f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02684 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02689 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0268e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02693 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02698 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0269d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
026a2 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
026a7 89442448                       mov        dword ptr [rsp + 0x48], eax
026ab 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
026b0 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
026b5 666690                         nop        
026b8 c5f877                         vzeroupper 
026bb e8200eb6ff                     call       0x7f4c1b9d7d60
026c0 0f1f8400b827002b               nop        dword ptr [rax + rax + 0x2b0027b8]
026c8 418bea                         mov        ebp, r10d
026cb 83c510                         add        ebp, 0x10
026ce be6effffff                     mov        esi, 0xffffff6e
026d3 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
026d8 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
026e0 448b0424                       mov        r8d, dword ptr [rsp]
026e4 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
026ec 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
026f1 4c891c24                       mov        qword ptr [rsp], r11
026f5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
026fa 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02702 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02707 4c895c2408                     mov        qword ptr [rsp + 8], r11
0270c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02711 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02716 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0271b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02720 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02725 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0272a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0272f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02734 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02739 8944242c                       mov        dword ptr [rsp + 0x2c], eax
0273d 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02742 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02747 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0274c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02751 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02756 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0275b 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02760 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02765 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0276a 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
0276f 90                             nop        
02770 c5f877                         vzeroupper 
02773 e8680db6ff                     call       0x7f4c1b9d7d60
02778 0f1f84007028002c               nop        dword ptr [rax + rax + 0x2c002870]
02780 418bea                         mov        ebp, r10d
02783 83c510                         add        ebp, 0x10
02786 be66ffffff                     mov        esi, 0xffffff66
0278b 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02790 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02798 448b1c24                       mov        r11d, dword ptr [rsp]
0279c 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
027a4 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
027a9 4c891c24                       mov        qword ptr [rsp], r11
027ad 448b442408                     mov        r8d, dword ptr [rsp + 8]
027b2 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
027ba 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
027bf 4c895c2408                     mov        qword ptr [rsp + 8], r11
027c4 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
027c9 4489442410                     mov        dword ptr [rsp + 0x10], r8d
027ce 4489542414                     mov        dword ptr [rsp + 0x14], r10d
027d3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
027d8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027dd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
027e2 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
027e7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
027ec 4489542424                     mov        dword ptr [rsp + 0x24], r10d
027f1 8944242c                       mov        dword ptr [rsp + 0x2c], eax
027f5 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
027fa 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
027ff 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02804 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02809 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0280e 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02813 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02818 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0281d 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02822 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02827 90                             nop        
02828 c5f877                         vzeroupper 
0282b e8b00cb6ff                     call       0x7f4c1b9d7d60
02830 0f1f84002829002d               nop        dword ptr [rax + rax + 0x2d002928]
02838 bef6ffffff                     mov        esi, 0xfffffff6
0283d 498bee                         mov        rbp, r14
02840 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02848 c5f877                         vzeroupper 
0284b e8900cb6ff                     call       0x7f4c1b9d7d60
02850 0f1f84004829002e               nop        dword ptr [rax + rax + 0x2e002948]
02858 488bf0                         mov        rsi, rax
0285b eb0d                           jmp        0x7f4c1be770ea
0285d 488bf0                         mov        rsi, rax
02860 eb08                           jmp        0x7f4c1be770ea
02862 488bf0                         mov        rsi, rax
02865 eb03                           jmp        0x7f4c1be770ea
02867 488bf0                         mov        rsi, rax
0286a c5f877                         vzeroupper 
0286d 4881c4c0000000                 add        rsp, 0xc0
02874 5d                             pop        rbp
02875 e9e634b6ff                     jmp        0x7f4c1b9da5e0
0287a bef6ffffff                     mov        esi, 0xfffffff6
0287f 90                             nop        
02880 c5f877                         vzeroupper 
02883 e8580cb6ff                     call       0x7f4c1b9d7d60
02888 0f1f84008029002f               nop        dword ptr [rax + rax + 0x2f002980]
02890 49ba5154e71b4c7f0000           movabs     r10, 0x7f4c1be75451
0289a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
028a1 e9babda9ff                     jmp        0x7f4c1b912ee0
028a6 e87589a8ff                     call       0x7f4c1b8ffaa0
028ab e98ed7ffff                     jmp        0x7f4c1be748be
