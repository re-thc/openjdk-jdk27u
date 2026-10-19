00000 e8bb529516                     call       0x7f1e967d5740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ecf0000000                 sub        rsp, 0xf0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8524250000                   jne        0x7f1e7fe829d2
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00046 448b36                         mov        r14d, dword ptr [rsi]
00049 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00050 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00055 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
0005c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00061 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00068 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0006d 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00074 4c89542470                     mov        qword ptr [rsp + 0x70], r10
00079 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
00080 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00085 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
0008c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00091 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
00097 448baef0000000                 mov        r13d, dword ptr [rsi + 0xf0]
0009e 448b9ee8000000                 mov        r11d, dword ptr [rsi + 0xe8]
000a5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
000aa 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b1 4c89542478                     mov        qword ptr [rsp + 0x78], r10
000b6 448b96a0000000                 mov        r10d, dword ptr [rsi + 0xa0]
000bd 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000c5 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cc 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
000d4 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
000d8 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
000e0 448b5670                       mov        r10d, dword ptr [rsi + 0x70]
000e4 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
000ec 8b6e68                         mov        ebp, dword ptr [rsi + 0x68]
000ef 448b5648                       mov        r10d, dword ptr [rsi + 0x48]
000f3 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
000fb 448b5e10                       mov        r11d, dword ptr [rsi + 0x10]
000ff 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00107 448b5608                       mov        r10d, dword ptr [rsi + 8]
0010b 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00113 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
0011a 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00122 488bfe                         mov        rdi, rsi
00125 c5f877                         vzeroupper 
00128 49ba00478b961e7f0000           movabs     r10, 0x7f1e968b4700
00132 41ffd2                         call       r10
00135 0f1f840000000000               nop        dword ptr [rax + rax]
0013d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00142 4d85d2                         test       r10, r10
00145 0f8451170000                   je         0x7f1e7fe81d1c
0014b 458b5204                       mov        r10d, dword ptr [r10 + 4]
0014f 41c1ea0a                       shr        r10d, 0xa
00153 4181fa0c080000                 cmp        r10d, 0x80c
0015a 0f85081f0000                   jne        0x7f1e7fe824e8
00160 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00165 4c891424                       mov        qword ptr [rsp], r10
00169 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0016e 4d85d2                         test       r10, r10
00171 0f8431170000                   je         0x7f1e7fe81d28
00177 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0017b 41c1eb0a                       shr        r11d, 0xa
0017f 4181fb05020000                 cmp        r11d, 0x205
00186 0f85dc1e0000                   jne        0x7f1e7fe824e8
0018c 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
00194 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00199 4d85d2                         test       r10, r10
0019c 0f8416170000                   je         0x7f1e7fe81d38
001a2 458b5204                       mov        r10d, dword ptr [r10 + 4]
001a6 41c1ea0a                       shr        r10d, 0xa
001aa 4181fa08020000                 cmp        r10d, 0x208
001b1 0f85b11e0000                   jne        0x7f1e7fe824e8
001b7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
001bc 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
001c4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
001c9 4d85d2                         test       r10, r10
001cc 0f84f6160000                   je         0x7f1e7fe81d48
001d2 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001d6 41c1eb0a                       shr        r11d, 0xa
001da 4181fb07020000                 cmp        r11d, 0x207
001e1 0f85811e0000                   jne        0x7f1e7fe824e8
001e7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ec 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
001f1 4d85d2                         test       r10, r10
001f4 0f84db160000                   je         0x7f1e7fe81d55
001fa 458b5204                       mov        r10d, dword ptr [r10 + 4]
001fe 41c1ea0a                       shr        r10d, 0xa
00202 4181fa07020000                 cmp        r10d, 0x207
00209 0f85591e0000                   jne        0x7f1e7fe824e8
0020f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00214 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0021c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00221 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00225 41c1eb0a                       shr        r11d, 0xa
00229 4181fb05020000                 cmp        r11d, 0x205
00230 0f85321e0000                   jne        0x7f1e7fe824e8
00236 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0023e 458b5208                       mov        r10d, dword ptr [r10 + 8]
00242 4489542408                     mov        dword ptr [rsp + 8], r10d
00247 4183c2f9                       add        r10d, -7
0024b 4585d2                         test       r10d, r10d
0024e 0f8c5c1e0000                   jl         0x7f1e7fe82530
00254 448b542408                     mov        r10d, dword ptr [rsp + 8]
00259 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0025e 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00263 4183c3f1                       add        r11d, -0xf
00267 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0026c 4183c2f9                       add        r10d, -7
00270 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00278 e904020000                     jmp        0x7f1e7fe80901
0027d 458bdd                         mov        r11d, r13d
00280 4d63d3                         movsxd     r10, r11d
00283 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0028a c442a8f5db                     bzhi       r11, r11, r10
0028f c4c1fb92fb                     kmovq      k7, r11
00294 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0029a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
002a0 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
002a8 4503dd                         add        r11d, r13d
002ab 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
002b3 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
002b7 418502                         test       dword ptr [r10], eax
002ba 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
002c2 0f8da0090000                   jge        0x7f1e7fe810e8
002c8 8bdd                           mov        ebx, ebp
002ca 448bcb                         mov        r9d, ebx
002cd 442b8c24cc000000               sub        r9d, dword ptr [rsp + 0xcc]
002d5 448bac2494000000               mov        r13d, dword ptr [rsp + 0x94]
002dd 442bac24cc000000               sub        r13d, dword ptr [rsp + 0xcc]
002e5 443bac24cc000000               cmp        r13d, dword ptr [rsp + 0xcc]
002ed 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
002f5 450f4fea                       cmovg      r13d, r10d
002f9 4585c9                         test       r9d, r9d
002fc 0f8ce3150000                   jl         0x7f1e7fe81d65
00302 85db                           test       ebx, ebx
00304 0f8cdb150000                   jl         0x7f1e7fe81d65
0030a 478d1c29                       lea        r11d, [r9 + r13]
0030e 448b542408                     mov        r10d, dword ptr [rsp + 8]
00313 453bd3                         cmp        r10d, r11d
00316 0f82c9150000                   jb         0x7f1e7fe81d65
0031c 428d2c2b                       lea        ebp, [rbx + r13]
00320 443bd5                         cmp        r10d, ebp
00323 0f82bc150000                   jb         0x7f1e7fe81d65
00329 4585ed                         test       r13d, r13d
0032c 0f8cb3150000                   jl         0x7f1e7fe81d65
00332 4585ed                         test       r13d, r13d
00335 0f8465ffffff                   je         0x7f1e7fe80720
0033b 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00343 498d741a0c                     lea        rsi, [r10 + rbx + 0xc]
00348 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
0034d 4963d5                         movsxd     rdx, r13d
00350 4883fa20                       cmp        rdx, 0x20
00354 0f8623ffffff                   jbe        0x7f1e7fe806fd
0035a c5f877                         vzeroupper 
0035d 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00367 41ffd2                         call       r10
0036a 0f1f840000000000               nop        dword ptr [rax + rax]
00372 e929ffffff                     jmp        0x7f1e7fe80720
00377 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0037f c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00386 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
0038d 4103da                         add        ebx, r10d
00390 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
00394 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00399 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
003a1 e989020000                     jmp        0x7f1e7fe80aaf
003a6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
003ae 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
003b3 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
003bb 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
003c0 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
003c8 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
003d0 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
003d8 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
003e0 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
003e8 0f8c01060000                   jl         0x7f1e7fe80e6f
003ee 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
003f6 4183fb30                       cmp        r11d, 0x30
003fa 7e75                           jle        0x7f1e7fe808f1
003fc 4585f6                         test       r14d, r14d
003ff 0f8c8f150000                   jl         0x7f1e7fe81e14
00405 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0040d 4585d2                         test       r10d, r10d
00410 0f8c7e150000                   jl         0x7f1e7fe81e14
00416 478d1433                       lea        r10d, [r11 + r14]
0041a 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0041f 453bda                         cmp        r11d, r10d
00422 0f826c150000                   jb         0x7f1e7fe81e14
00428 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
00430 0f825e150000                   jb         0x7f1e7fe81e14
00436 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0043e 4585d2                         test       r10d, r10d
00441 0f843c010000                   je         0x7f1e7fe80a03
00447 4963d2                         movsxd     rdx, r10d
0044a 4883fa20                       cmp        rdx, 0x20
0044e 0f860c010000                   jbe        0x7f1e7fe809e0
00454 c5f877                         vzeroupper 
00457 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00461 41ffd2                         call       r10
00464 0f1f840000000000               nop        dword ptr [rax + rax]
0046c e912010000                     jmp        0x7f1e7fe80a03
00471 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
00475 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0047c 448b6c2474                     mov        r13d, dword ptr [rsp + 0x74]
00481 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
00489 0f8311130000                   jae        0x7f1e7fe81c20
0048f 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00497 4f8b44320c                     mov        r8, qword ptr [r10 + r14 + 0xc]
0049c 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
004a4 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
004ac 0f835e130000                   jae        0x7f1e7fe81c90
004b2 4183c608                       add        r14d, 8
004b6 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
004ba 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
004c2 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
004ca 4f8944190c                     mov        qword ptr [r9 + r11 + 0xc], r8
004cf 4183c308                       add        r11d, 8
004d3 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
004db 418502                         test       dword ptr [r10], eax
004de 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
004e6 7d6f                           jge        0x7f1e7fe809d7
004e8 0f1f840000000000               nop        dword ptr [rax + rax]
004f0 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
004f8 0f83a2120000                   jae        0x7f1e7fe81c20
004fe 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00506 4f8b44320c                     mov        r8, qword ptr [r10 + r14 + 0xc]
0050b 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00513 443b9c24c8000000               cmp        r11d, dword ptr [rsp + 0xc8]
0051b 0f83ef120000                   jae        0x7f1e7fe81c90
00521 4183c608                       add        r14d, 8
00525 4d8b5f30                       mov        r11, qword ptr [r15 + 0x30]
00529 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00531 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00539 4f8944110c                     mov        qword ptr [r9 + r10 + 0xc], r8
0053e 4183c208                       add        r10d, 8
00542 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0054a 418503                         test       dword ptr [r11], eax
0054d 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00555 7c99                           jl         0x7f1e7fe80970
00557 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0055e eb33                           jmp        0x7f1e7fe80a13
00560 458bda                         mov        r11d, r10d
00563 4d63d3                         movsxd     r10, r11d
00566 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0056d c442a8f5db                     bzhi       r11, r11, r10
00572 c4c1fb92fb                     kmovq      k7, r11
00577 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0057d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00583 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
00587 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
0058e 448b6c2474                     mov        r13d, dword ptr [rsp + 0x74]
00593 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
0059b 458b4208                       mov        r8d, dword ptr [r10 + 8]
0059f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
005a4 4585db                         test       r11d, r11d
005a7 0f8cc7120000                   jl         0x7f1e7fe81cf4
005ad 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
005b5 458b5a08                       mov        r11d, dword ptr [r10 + 8]
005b9 4183fb01                       cmp        r11d, 1
005bd 0f86b1120000                   jbe        0x7f1e7fe81cf4
005c3 4183fb02                       cmp        r11d, 2
005c7 0f86a7120000                   jbe        0x7f1e7fe81cf4
005cd 4585db                         test       r11d, r11d
005d0 0f869e120000                   jbe        0x7f1e7fe81cf4
005d6 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
005de 418b4a08                       mov        ecx, dword ptr [r10 + 8]
005e2 448d49f1                       lea        r9d, [rcx - 0xf]
005e6 4585c9                         test       r9d, r9d
005e9 0f8c85120000                   jl         0x7f1e7fe81cf4
005ef 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
005f4 448bd1                         mov        r10d, ecx
005f7 458d71f1                       lea        r14d, [r9 - 0xf]
005fb 4489b424d4000000               mov        dword ptr [rsp + 0xd4], r14d
00603 458d72f1                       lea        r14d, [r10 - 0xf]
00607 4489ac2498000000               mov        dword ptr [rsp + 0x98], r13d
0060f 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00614 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00619 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0061d 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00622 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00627 4489b424d0000000               mov        dword ptr [rsp + 0xd0], r14d
0062f 4d8b4730                       mov        r8, qword ptr [r15 + 0x30]
00633 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00638 442b942498000000               sub        r10d, dword ptr [rsp + 0x98]
00640 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00648 498d741b0c                     lea        rsi, [r11 + rbx + 0xc]
0064d 4c8b8c24a8000000               mov        r9, qword ptr [rsp + 0xa8]
00655 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0065d 4b8d7c190c                     lea        rdi, [r9 + r11 + 0xc]
00662 448d5d01                       lea        r11d, [rbp + 1]
00666 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0066b 418500                         test       dword ptr [r8], eax
0066e 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00673 0f8d050a0000                   jge        0x7f1e7fe814fe
00679 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0067e 0f830a0e0000                   jae        0x7f1e7fe8190e
00684 4c63dd                         movsxd     r11, ebp
00687 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
0068f 4f8b4cd818                     mov        r9, qword ptr [r8 + r11*8 + 0x18]
00694 458bd9                         mov        r11d, r9d
00697 4181e3ffff0100                 and        r11d, 0x1ffff
0069e 418bc3                         mov        eax, r11d
006a1 4d8bd9                         mov        r11, r9
006a4 49c1eb12                       shr        r11, 0x12
006a8 49c1f924                       sar        r9, 0x24
006ac 458bc3                         mov        r8d, r11d
006af 458bd9                         mov        r11d, r9d
006b2 418bd3                         mov        edx, r11d
006b5 4181e0ffff0300                 and        r8d, 0x3ffff
006bc 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
006c4 4585db                         test       r11d, r11d
006c7 0f8c770f0000                   jl         0x7f1e7fe81ac4
006cd 448bd8                         mov        r11d, eax
006d0 4585db                         test       r11d, r11d
006d3 0f851f020000                   jne        0x7f1e7fe80d78
006d9 4533d2                         xor        r10d, r10d
006dc 418bc2                         mov        eax, r10d
006df 83fa03                         cmp        edx, 3
006e2 0f8e67020000                   jle        0x7f1e7fe80dcf
006e8 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
006f0 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
006f4 45895a14                       mov        dword ptr [r10 + 0x14], r11d
006f8 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006fc 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00704 45895310                       mov        dword ptr [r11 + 0x10], r10d
00708 448d52fd                       lea        r10d, [rdx - 3]
0070c 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00714 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0071c 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00724 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
00728 4863ac24cc000000               movsxd     rbp, dword ptr [rsp + 0xcc]
00730 48896c2418                     mov        qword ptr [rsp + 0x18], rbp
00735 4c63d3                         movsxd     r10, ebx
00738 4c03542478                     add        r10, qword ptr [rsp + 0x78]
0073d 4863d0                         movsxd     rdx, eax
00740 4c03d2                         add        r10, rdx
00743 493bea                         cmp        rbp, r10
00746 0f8f480f0000                   jg         0x7f1e7fe81b14
0074c 448d2c03                       lea        r13d, [rbx + rax]
00750 458bf5                         mov        r14d, r13d
00753 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
0075b 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00763 4585db                         test       r11d, r11d
00766 0f84b4010000                   je         0x7f1e7fe80da0
0076c 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
00774 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
0077c 4585c0                         test       r8d, r8d
0077f 0f8e9f0e0000                   jle        0x7f1e7fe81aa4
00785 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0078d 4503d5                         add        r10d, r13d
00790 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
00798 0f8f4a0f0000                   jg         0x7f1e7fe81b68
0079e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
007a6 4403d8                         add        r11d, eax
007a9 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
007ae 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
007b6 0f8f840f0000                   jg         0x7f1e7fe81bc0
007bc 83f810                         cmp        eax, 0x10
007bf 0f8fb8040000                   jg         0x7f1e7fe810fd
007c5 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
007cd 443b9c24d0000000               cmp        r11d, dword ptr [rsp + 0xd0]
007d5 0f83050d0000                   jae        0x7f1e7fe81960
007db 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
007e3 c4817a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 0xc]
007ea 3b9c24d4000000                 cmp        ebx, dword ptr [rsp + 0xd4]
007f1 0f83490d0000                   jae        0x7f1e7fe819c0
007f7 468d1418                       lea        r10d, [rax + r11]
007fb 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00800 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00808 c4c17a7f441a0c                 vmovdqu    xmmword ptr [r10 + rbx + 0xc], xmm0
0080f 448d1418                       lea        r10d, [rax + rbx]
00813 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0081b 458bf2                         mov        r14d, r10d
0081e 442bb424cc000000               sub        r14d, dword ptr [rsp + 0xcc]
00826 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0082e 4183fb10                       cmp        r11d, 0x10
00832 0f8f6efbffff                   jg         0x7f1e7fe80826
00838 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00840 4183fb10                       cmp        r11d, 0x10
00844 0f8c5cfbffff                   jl         0x7f1e7fe80826
0084a 443bb424d4000000               cmp        r14d, dword ptr [rsp + 0xd4]
00852 0f83700d0000                   jae        0x7f1e7fe81a48
00858 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00860 c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
00867 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0086f 443b9424d4000000               cmp        r10d, dword ptr [rsp + 0xd4]
00877 0f82fafaffff                   jb         0x7f1e7fe807f7
0087d bee4ffffff                     mov        esi, 0xffffffe4
00882 488b2c24                       mov        rbp, qword ptr [rsp]
00886 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0088b 44895c2408                     mov        dword ptr [rsp + 8], r11d
00890 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00895 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0089a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0089f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008a4 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
008a9 4489542434                     mov        dword ptr [rsp + 0x34], r10d
008ae 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
008b3 4489542438                     mov        dword ptr [rsp + 0x38], r10d
008b8 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
008c0 4c89542450                     mov        qword ptr [rsp + 0x50], r10
008c5 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008cd 4489542458                     mov        dword ptr [rsp + 0x58], r10d
008d2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
008d7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
008dc c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
008e5 666690                         nop        
008e8 c5f877                         vzeroupper 
008eb e8f06fb5ff                     call       0x7f1e7f9d7d60
008f0 0f1f8400e8090004               nop        dword ptr [rax + rax + 0x40009e8]
008f8 453bda                         cmp        r11d, r10d
008fb 0f8edefdffff                   jle        0x7f1e7fe80b5f
00901 be45ffffff                     mov        esi, 0xffffff45
00906 418beb                         mov        ebp, r11d
00909 44891424                       mov        dword ptr [rsp], r10d
0090d 666690                         nop        
00910 c5f877                         vzeroupper 
00913 e8c86fb5ff                     call       0x7f1e7f9d7d60
00918 0f1f8400100a0005               nop        dword ptr [rax + rax + 0x5000a10]
00920 4d63de                         movsxd     r11, r14d
00923 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
0092b 0f8cd7100000                   jl         0x7f1e7fe81e88
00931 483bac2488000000               cmp        rbp, qword ptr [rsp + 0x88]
00939 0f8f25110000                   jg         0x7f1e7fe81ee4
0093f 4533db                         xor        r11d, r11d
00942 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
0094a e925feffff                     jmp        0x7f1e7fe80bf4
0094f 85c0                           test       eax, eax
00951 7407                           je         0x7f1e7fe80dda
00953 448d52ff                       lea        r10d, [rdx - 1]
00957 418bd2                         mov        edx, r10d
0095a 85d2                           test       edx, edx
0095c 750e                           jne        0x7f1e7fe80dec
0095e 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00966 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
0096a eb76                           jmp        0x7f1e7fe80e62
0096c 83fa03                         cmp        edx, 3
0096f 0f8423130000                   je         0x7f1e7fe82118
00975 83fa02                         cmp        edx, 2
00978 0f877e130000                   ja         0x7f1e7fe8217c
0097e 3b542430                       cmp        edx, dword ptr [rsp + 0x30]
00982 0f8337120000                   jae        0x7f1e7fe8203f
00988 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00990 458b54930c                     mov        r10d, dword ptr [r11 + rdx*4 + 0xc]
00995 85d2                           test       edx, edx
00997 7e3d                           jle        0x7f1e7fe80e56
00999 448d5aff                       lea        r11d, [rdx - 1]
0099d 443b5c2430                     cmp        r11d, dword ptr [rsp + 0x30]
009a2 0f8388120000                   jae        0x7f1e7fe820b0
009a8 0f1f840000000000               nop        dword ptr [rax + rax]
009b0 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
009b8 458b5c9008                     mov        r11d, dword ptr [r8 + rdx*4 + 8]
009bd 4c8b8c24b8000000               mov        r9, qword ptr [rsp + 0xb8]
009c5 45895c910c                     mov        dword ptr [r9 + rdx*4 + 0xc], r11d
009ca 448d5aff                       lea        r11d, [rdx - 1]
009ce 418bd3                         mov        edx, r11d
009d1 4585db                         test       r11d, r11d
009d4 7fda                           jg         0x7f1e7fe80e30
009d6 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009de 4589530c                       mov        dword ptr [r11 + 0xc], r10d
009e2 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009ea e939fdffff                     jmp        0x7f1e7fe80ba8
009ef 4183fa10                       cmp        r10d, 0x10
009f3 0f8d27160000                   jge        0x7f1e7fe824a0
009f9 4183fa08                       cmp        r10d, 8
009fd 0f8d11070000                   jge        0x7f1e7fe81594
00a03 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00a0b 4183fa10                       cmp        r10d, 0x10
00a0f 0f8eb6000000                   jle        0x7f1e7fe80f4b
00a15 4585f6                         test       r14d, r14d
00a18 0f8c82150000                   jl         0x7f1e7fe82420
00a1e 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a26 4585db                         test       r11d, r11d
00a29 0f8c71150000                   jl         0x7f1e7fe82420
00a2f 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a34 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00a3c 0f825e150000                   jb         0x7f1e7fe82420
00a42 8b9c24cc000000                 mov        ebx, dword ptr [rsp + 0xcc]
00a49 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00a50 443bd3                         cmp        r10d, ebx
00a53 0f8247150000                   jb         0x7f1e7fe82420
00a59 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00a61 4585d2                         test       r10d, r10d
00a64 0f8c36150000                   jl         0x7f1e7fe82420
00a6a 4585d2                         test       r10d, r10d
00a6d 0f8457f8ffff                   je         0x7f1e7fe8074a
00a73 488b6c2418                     mov        rbp, qword ptr [rsp + 0x18]
00a78 4883fd20                       cmp        rbp, 0x20
00a7c 772d                           ja         0x7f1e7fe80f2b
00a7e 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00a86 4d63d3                         movsxd     r10, r11d
00a89 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a90 c442a8f5db                     bzhi       r11, r11, r10
00a95 c4c1fb92fb                     kmovq      k7, r11
00a9a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aa0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00aa6 e91ff8ffff                     jmp        0x7f1e7fe8074a
00aab 488bd5                         mov        rdx, rbp
00aae c5f877                         vzeroupper 
00ab1 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00abb 41ffd2                         call       r10
00abe 0f1f840000000000               nop        dword ptr [rax + rax]
00ac6 e9fff7ffff                     jmp        0x7f1e7fe8074a
00acb 443b742408                     cmp        r14d, dword ptr [rsp + 8]
00ad0 0f838a120000                   jae        0x7f1e7fe821e0
00ad6 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00ade 430fbe6c320c                   movsx      ebp, byte ptr [r10 + r14 + 0xc]
00ae4 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00aec 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00af1 0f83ed120000                   jae        0x7f1e7fe82264
00af7 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00aff 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00b07 43886c1a0c                     mov        byte ptr [r10 + r11 + 0xc], bpl
00b0c 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00b14 41ffc0                         inc        r8d
00b17 458d5e03                       lea        r11d, [r14 + 3]
00b1b 443b5c2408                     cmp        r11d, dword ptr [rsp + 8]
00b20 0f8326130000                   jae        0x7f1e7fe822cc
00b26 4d63de                         movsxd     r11, r14d
00b29 430fbe6c1a0d                   movsx      ebp, byte ptr [r10 + r11 + 0xd]
00b2f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00b37 4183c203                       add        r10d, 3
00b3b 443b542408                     cmp        r10d, dword ptr [rsp + 8]
00b40 0f8386130000                   jae        0x7f1e7fe8234c
00b46 4c6394249c000000               movsxd     r10, dword ptr [rsp + 0x9c]
00b4e 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00b56 43886c100d                     mov        byte ptr [r8 + r10 + 0xd], bpl
00b5b 470fbe44180e                   movsx      r8d, byte ptr [r8 + r11 + 0xe]
00b61 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
00b69 478844110e                     mov        byte ptr [r9 + r10 + 0xe], r8b
00b6e 470fbe5c190f                   movsx      r11d, byte ptr [r9 + r11 + 0xf]
00b74 47885c110f                     mov        byte ptr [r9 + r10 + 0xf], r11b
00b79 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00b81 4183fa08                       cmp        r10d, 8
00b85 0f83b1130000                   jae        0x7f1e7fe823bc
00b8b 49bac8df2fe300000000           movabs     r10, 0xe32fdfc8
00b95 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00b9d 4703749a0c                     add        r14d, dword ptr [r10 + r11*4 + 0xc]
00ba2 4489742418                     mov        dword ptr [rsp + 0x18], r14d
00ba7 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00baf 4183fb04                       cmp        r11d, 4
00bb3 7e43                           jle        0x7f1e7fe81078
00bb5 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00bbc 83c504                         add        ebp, 4
00bbf 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00bc7 418bd6                         mov        edx, r14d
00bca 6690                           nop        
00bcc c5f877                         vzeroupper 
00bcf e80cf8a8ff                     call       0x7f1e7f910860
00bd4 0f1f8400cc0c0006               nop        dword ptr [rax + rax + 0x6000ccc]
00bdc 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00be4 8bd5                           mov        edx, ebp
00be6 8bc8                           mov        ecx, eax
00be8 c5f877                         vzeroupper 
00beb e8f0f7a8ff                     call       0x7f1e7f910860
00bf0 0f1f8400e80c0007               nop        dword ptr [rax + rax + 0x7000ce8]
00bf8 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00c00 4183fa08                       cmp        r10d, 8
00c04 7e62                           jle        0x7f1e7fe810e8
00c06 8b542418                       mov        edx, dword ptr [rsp + 0x18]
00c0a 49baf8df2fe300000000           movabs     r10, 0xe32fdff8
00c14 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00c1c 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00c21 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00c28 83c508                         add        ebp, 8
00c2b 83c208                         add        edx, 8
00c2e 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c36 6690                           nop        
00c38 c5f877                         vzeroupper 
00c3b e8a0f7a8ff                     call       0x7f1e7f910860
00c40 0f1f8400380d0008               nop        dword ptr [rax + rax + 0x8000d38]
00c48 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
00c50 8bd5                           mov        edx, ebp
00c52 488bc8                         mov        rcx, rax
00c55 666690                         nop        
00c58 c5f877                         vzeroupper 
00c5b e880f7a8ff                     call       0x7f1e7f910860
00c60 0f1f8400580d0009               nop        dword ptr [rax + rax + 0x9000d58]
00c68 8b6c2470                       mov        ebp, dword ptr [rsp + 0x70]
00c6c 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00c73 448b6c2474                     mov        r13d, dword ptr [rsp + 0x74]
00c78 e916f9ffff                     jmp        0x7f1e7fe80a13
00c7d 83f830                         cmp        eax, 0x30
00c80 0f8e89000000                   jle        0x7f1e7fe8118f
00c86 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00c8e 4585d2                         test       r10d, r10d
00c91 0f8c8d150000                   jl         0x7f1e7fe826a4
00c97 85db                           test       ebx, ebx
00c99 0f8c85150000                   jl         0x7f1e7fe826a4
00c9f 8b6c2434                       mov        ebp, dword ptr [rsp + 0x34]
00ca3 3b6c2474                       cmp        ebp, dword ptr [rsp + 0x74]
00ca7 0f8277150000                   jb         0x7f1e7fe826a4
00cad 448b542408                     mov        r10d, dword ptr [rsp + 8]
00cb2 453bd5                         cmp        r10d, r13d
00cb5 0f8269150000                   jb         0x7f1e7fe826a4
00cbb 85c0                           test       eax, eax
00cbd 7429                           je         0x7f1e7fe81168
00cbf 4883fa20                       cmp        rdx, 0x20
00cc3 7730                           ja         0x7f1e7fe81175
00cc5 448bd0                         mov        r10d, eax
00cc8 4d63d2                         movsxd     r10, r10d
00ccb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00cd2 c442a8f5db                     bzhi       r11, r11, r10
00cd7 c4c1fb92fb                     kmovq      k7, r11
00cdc 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ce2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ce8 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00cf0 e931fbffff                     jmp        0x7f1e7fe80ca6
00cf5 c5f877                         vzeroupper 
00cf8 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00d02 41ffd2                         call       r10
00d05 0f1f840000000000               nop        dword ptr [rax + rax]
00d0d ebd9                           jmp        0x7f1e7fe81168
00d0f 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d17 443b8424d0000000               cmp        r8d, dword ptr [rsp + 0xd0]
00d1f 0f83f3130000                   jae        0x7f1e7fe82598
00d25 4d63c8                         movsxd     r9, r8d
00d28 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00d30 c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00d37 3b9c24d4000000                 cmp        ebx, dword ptr [rsp + 0xd4]
00d3e 0f8344140000                   jae        0x7f1e7fe82608
00d44 418bd0                         mov        edx, r8d
00d47 448d5310                       lea        r10d, [rbx + 0x10]
00d4b 418bfa                         mov        edi, r10d
00d4e 4c63db                         movsxd     r11, ebx
00d51 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
00d59 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00d60 448bd7                         mov        r10d, edi
00d63 453bd5                         cmp        r10d, r13d
00d66 0f8dda020000                   jge        0x7f1e7fe814c6
00d6c 4d2bcb                         sub        r9, r11
00d6f 4d63d2                         movsxd     r10, r10d
00d72 48634c243c                     movsxd     rcx, dword ptr [rsp + 0x3c]
00d77 4883c1f1                       add        rcx, -0xf
00d7b 4f8d1c0a                       lea        r11, [r10 + r9]
00d7f 4c3bd9                         cmp        r11, rcx
00d82 0f8318150000                   jae        0x7f1e7fe82720
00d88 4d63dd                         movsxd     r11, r13d
00d8b 4d8bc3                         mov        r8, r11
00d8e 4d2bc2                         sub        r8, r10
00d91 4983c00f                       add        r8, 0xf
00d95 4983e0f0                       and        r8, 0xfffffffffffffff0
00d99 458bc0                         mov        r8d, r8d
00d9c 458d541810                     lea        r10d, [r8 + rbx + 0x10]
00da1 4d63c2                         movsxd     r8, r10d
00da4 4f8d5408f0                     lea        r10, [r8 + r9 - 0x10]
00da9 4c3bd1                         cmp        r10, rcx
00dac 0f83ee140000                   jae        0x7f1e7fe82720
00db2 448bd7                         mov        r10d, edi
00db5 443b9424d4000000               cmp        r10d, dword ptr [rsp + 0xd4]
00dbd 0f83dd140000                   jae        0x7f1e7fe82720
00dc3 4983c0f0                       add        r8, -0x10
00dc7 4c63542438                     movsxd     r10, dword ptr [rsp + 0x38]
00dcc 4983c2f1                       add        r10, -0xf
00dd0 4d3bc2                         cmp        r8, r10
00dd3 0f83c7140000                   jae        0x7f1e7fe82720
00dd9 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00de0 0f8f12150000                   jg         0x7f1e7fe82778
00de6 448bca                         mov        r9d, edx
00de9 442bcb                         sub        r9d, ebx
00dec 83c320                         add        ebx, 0x20
00def 90                             nop        
00df0 458d0439                       lea        r8d, [r9 + rdi]
00df4 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00dfc c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00e03 448bd7                         mov        r10d, edi
00e06 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
00e0e c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
00e15 448d5710                       lea        r10d, [rdi + 0x10]
00e19 418bfa                         mov        edi, r10d
00e1c 443bd3                         cmp        r10d, ebx
00e1f 7ccf                           jl         0x7f1e7fe81270
00e21 4981c310ffffff                 add        r11, -0xf0
00e28 4981fb00000080                 cmp        r11, -0x80000000
00e2f 49c7c200000080                 mov        r10, 0xffffffff80000000
00e36 4d0f4cda                       cmovl      r11, r10
00e3a 418bcb                         mov        ecx, r11d
00e3d 448bd7                         mov        r10d, edi
00e40 443bd1                         cmp        r10d, ecx
00e43 0f8dc5010000                   jge        0x7f1e7fe8148e
00e49 418bfa                         mov        edi, r10d
00e4c 0f1f4000                       nop        dword ptr [rax]
00e50 458d0439                       lea        r8d, [r9 + rdi]
00e54 448bdf                         mov        r11d, edi
00e57 4d63db                         movsxd     r11, r11d
00e5a 458bd0                         mov        r10d, r8d
00e5d 488b9c24a8000000               mov        rbx, qword ptr [rsp + 0xa8]
00e65 c4a17a6f44130c                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xc]
00e6c 4d63d0                         movsxd     r10, r8d
00e6f 448bc7                         mov        r8d, edi
00e72 488b9c24c0000000               mov        rbx, qword ptr [rsp + 0xc0]
00e7a c4a17a7f44030c                 vmovdqu    xmmword ptr [rbx + r8 + 0xc], xmm0
00e81 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00e89 c4817a6f44101c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x1c]
00e90 c4a17a7f441b1c                 vmovdqu    xmmword ptr [rbx + r11 + 0x1c], xmm0
00e97 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00e9f c4817a6f44102c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x2c]
00ea6 c4a17a7f441b2c                 vmovdqu    xmmword ptr [rbx + r11 + 0x2c], xmm0
00ead 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00eb5 c4817a6f44103c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x3c]
00ebc c4a17a7f441b3c                 vmovdqu    xmmword ptr [rbx + r11 + 0x3c], xmm0
00ec3 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00ecb c4817a6f44104c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x4c]
00ed2 c4a17a7f441b4c                 vmovdqu    xmmword ptr [rbx + r11 + 0x4c], xmm0
00ed9 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00ee1 c4817a6f44105c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x5c]
00ee8 c4a17a7f441b5c                 vmovdqu    xmmword ptr [rbx + r11 + 0x5c], xmm0
00eef 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00ef7 c4817a6f44106c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x6c]
00efe c4a17a7f441b6c                 vmovdqu    xmmword ptr [rbx + r11 + 0x6c], xmm0
00f05 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f0d c4817a6f44107c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x7c]
00f14 c4a17a7f441b7c                 vmovdqu    xmmword ptr [rbx + r11 + 0x7c], xmm0
00f1b 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f23 c4817a6f84108c000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x8c]
00f2d c4a17a7f841b8c000000           vmovdqu    xmmword ptr [rbx + r11 + 0x8c], xmm0
00f37 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f3f c4817a6f84109c000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0x9c]
00f49 c4a17a7f841b9c000000           vmovdqu    xmmword ptr [rbx + r11 + 0x9c], xmm0
00f53 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f5b c4817a6f8410ac000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xac]
00f65 c4a17a7f841bac000000           vmovdqu    xmmword ptr [rbx + r11 + 0xac], xmm0
00f6f 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f77 c4817a6f8410bc000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xbc]
00f81 c4a17a7f841bbc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xbc], xmm0
00f8b 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00f93 c4817a6f8410cc000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xcc]
00f9d c4a17a7f841bcc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xcc], xmm0
00fa7 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00faf c4817a6f8410dc000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xdc]
00fb9 c4a17a7f841bdc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xdc], xmm0
00fc3 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fcb c4817a6f8410ec000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xec]
00fd5 c4a17a7f841bec000000           vmovdqu    xmmword ptr [rbx + r11 + 0xec], xmm0
00fdf 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
00fe7 c4817a6f8410fc000000           vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xfc]
00ff1 c4a17a7f841bfc000000           vmovdqu    xmmword ptr [rbx + r11 + 0xfc], xmm0
00ffb 448d9700010000                 lea        r10d, [rdi + 0x100]
01002 418bfa                         mov        edi, r10d
01005 443bd1                         cmp        r10d, ecx
01008 0f8c42feffff                   jl         0x7f1e7fe812d0
0100e 413bfd                         cmp        edi, r13d
01011 7d33                           jge        0x7f1e7fe814c6
01013 448bd7                         mov        r10d, edi
01016 6690                           nop        
01018 478d1c11                       lea        r11d, [r9 + r10]
0101c 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
01024 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
0102b 458bda                         mov        r11d, r10d
0102e 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01036 c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
0103d 4183c210                       add        r10d, 0x10
01041 453bd5                         cmp        r10d, r13d
01044 7cd2                           jl         0x7f1e7fe81498
01046 448d1410                       lea        r10d, [rax + rdx]
0104a 4489542474                     mov        dword ptr [rsp + 0x74], r10d
0104f 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
01057 e9caf7ffff                     jmp        0x7f1e7fe80ca6
0105c 4d63d2                         movsxd     r10, r10d
0105f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01066 c442a8f5db                     bzhi       r11, r11, r10
0106b c4c1fb92fb                     kmovq      k7, r11
01070 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01076 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0107c eb78                           jmp        0x7f1e7fe81576
0107e 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01086 4585c0                         test       r8d, r8d
01089 0f8c65100000                   jl         0x7f1e7fe82574
0108f 85db                           test       ebx, ebx
01091 0f8c5d100000                   jl         0x7f1e7fe82574
01097 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0109c 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
010a1 0f824d100000                   jb         0x7f1e7fe82574
010a7 428d2c13                       lea        ebp, [rbx + r10]
010ab 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
010b0 443bdd                         cmp        r11d, ebp
010b3 0f823b100000                   jb         0x7f1e7fe82574
010b9 4585d2                         test       r10d, r10d
010bc 0f8c32100000                   jl         0x7f1e7fe82574
010c2 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
010c7 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
010cf 7425                           je         0x7f1e7fe81576
010d1 4963d2                         movsxd     rdx, r10d
010d4 4883fa20                       cmp        rdx, 0x20
010d8 0f867effffff                   jbe        0x7f1e7fe814dc
010de c5f877                         vzeroupper 
010e1 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
010eb 41ffd2                         call       r10
010ee 0f1f840000000000               nop        dword ptr [rax + rax]
010f6 4c8b1424                       mov        r10, qword ptr [rsp]
010fa 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
010fe c5f877                         vzeroupper 
01101 4881c4f0000000                 add        rsp, 0xf0
01108 5d                             pop        rbp
01109 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0110d 0f8729140000                   ja         0x7f1e7fe829bc
01113 c3                             ret        
01114 443bb424c8000000               cmp        r14d, dword ptr [rsp + 0xc8]
0111c 0f832e120000                   jae        0x7f1e7fe827d0
01122 458bce                         mov        r9d, r14d
01125 4963d9                         movsxd     rbx, r9d
01128 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01130 4d8b441a0c                     mov        r8, qword ptr [r10 + rbx + 0xc]
01135 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0113d 443b9424c8000000               cmp        r10d, dword ptr [rsp + 0xc8]
01145 0f8379120000                   jae        0x7f1e7fe82844
0114b 418d4908                       lea        ecx, [r9 + 8]
0114f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01153 8bb4249c000000                 mov        esi, dword ptr [rsp + 0x9c]
0115a 4c63de                         movsxd     r11, esi
0115d 488bbc24c0000000               mov        rdi, qword ptr [rsp + 0xc0]
01165 4e89441f0c                     mov        qword ptr [rdi + r11 + 0xc], r8
0116a 8d5608                         lea        edx, [rsi + 8]
0116d 418502                         test       dword ptr [r10], eax
01170 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01177 0f8debfaffff                   jge        0x7f1e7fe810e8
0117d 492bdb                         sub        rbx, r11
01180 486344240c                     movsxd     rax, dword ptr [rsp + 0xc]
01185 4883c0f9                       add        rax, -7
01189 4c63c2                         movsxd     r8, edx
0118c 4d8d1418                       lea        r10, [r8 + rbx]
01190 4c3bd0                         cmp        r10, rax
01193 0f83a7120000                   jae        0x7f1e7fe828c0
01199 4863bc2498000000               movsxd     rdi, dword ptr [rsp + 0x98]
011a1 4c8bd7                         mov        r10, rdi
011a4 4d2bd0                         sub        r10, r8
011a7 4983c207                       add        r10, 7
011ab 4983e2f8                       and        r10, 0xfffffffffffffff8
011af 458bd2                         mov        r10d, r10d
011b2 458d5c3208                     lea        r11d, [r10 + rsi + 8]
011b7 4d63d3                         movsxd     r10, r11d
011ba 4d8d5c1af8                     lea        r11, [r10 + rbx - 8]
011bf 4c3bd8                         cmp        r11, rax
011c2 0f8378120000                   jae        0x7f1e7fe828c0
011c8 3b9424c8000000                 cmp        edx, dword ptr [rsp + 0xc8]
011cf 0f836b120000                   jae        0x7f1e7fe828c0
011d5 4983c2f8                       add        r10, -8
011d9 4c3bd0                         cmp        r10, rax
011dc 0f835e120000                   jae        0x7f1e7fe828c0
011e2 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
011ea 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
011f1 0f8fa9120000                   jg         0x7f1e7fe82920
011f7 442bce                         sub        r9d, esi
011fa 418bc1                         mov        eax, r9d
011fd 41baf4ffffff                   mov        r10d, 0xfffffff4
01203 4c8d5fc8                       lea        r11, [rdi - 0x38]
01207 4981fb00000080                 cmp        r11, -0x80000000
0120e 49c7c100000080                 mov        r9, 0xffffffff80000000
01215 4d0f4cd9                       cmovl      r11, r9
01219 418bdb                         mov        ebx, r11d
0121c 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
01224 448d4e10                       lea        r9d, [rsi + 0x10]
01228 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01230 498bcb                         mov        rcx, r11
01233 4963e9                         movsxd     rbp, r9d
01236 458bdb                         mov        r11d, r11d
01239 452bd3                         sub        r10d, r11d
0123c 442bd6                         sub        r10d, esi
0123f 4183c2f0                       add        r10d, -0x10
01243 be06000000                     mov        esi, 6
01248 c442c8f5d2                     bzhi       r10, r10, rsi
0124d 4903ea                         add        rbp, r10
01250 483bef                         cmp        rbp, rdi
01253 4c8bdf                         mov        r11, rdi
01256 4c0f4cdd                       cmovl      r11, rbp
0125a 4d8bd3                         mov        r10, r11
0125d 4d2bd0                         sub        r10, r8
01260 498d72ff                       lea        rsi, [r10 - 1]
01264 48c1fe3f                       sar        rsi, 0x3f
01268 48c1ee3d                       shr        rsi, 0x3d
0126c 4e8d5416ff                     lea        r10, [rsi + r10 - 1]
01271 4983e2f8                       and        r10, 0xfffffffffffffff8
01275 4d03d0                         add        r10, r8
01278 4d3bc2                         cmp        r8, r10
0127b 4d0f4cc2                       cmovl      r8, r10
0127f 458bc0                         mov        r8d, r8d
01282 478d540608                     lea        r10d, [r14 + r8 + 8]
01287 4183c008                       add        r8d, 8
0128b 4963ea                         movsxd     rbp, r10d
0128e 4803e9                         add        rbp, rcx
01291 4963f0                         movsxd     rsi, r8d
01294 4803f1                         add        rsi, rcx
01297 4c8d450c                       lea        r8, [rbp + 0xc]
0129b 4883c54c                       add        rbp, 0x4c
0129f 488d4e4c                       lea        rcx, [rsi + 0x4c]
012a3 4533d2                         xor        r10d, r10d
012a6 493bc8                         cmp        rcx, r8
012a9 410f96c2                       setbe      r10b
012ad 4883c60c                       add        rsi, 0xc
012b1 4533c0                         xor        r8d, r8d
012b4 483bee                         cmp        rbp, rsi
012b7 410f96c0                       setbe      r8b
012bb 450bd0                         or         r10d, r8d
012be 0f84fc070000                   je         0x7f1e7fe81f40
012c4 458bd3                         mov        r10d, r11d
012c7 90                             nop        
012c8 448bda                         mov        r11d, edx
012cb 448d0c10                       lea        r9d, [rax + rdx]
012cf 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
012d7 4f8b44080c                     mov        r8, qword ptr [r8 + r9 + 0xc]
012dc 4c8b8c24c0000000               mov        r9, qword ptr [rsp + 0xc0]
012e4 4f8944190c                     mov        qword ptr [r9 + r11 + 0xc], r8
012e9 83c208                         add        edx, 8
012ec 413bd2                         cmp        edx, r10d
012ef 7cd7                           jl         0x7f1e7fe81748
012f1 4881c708feffff                 add        rdi, -0x1f8
012f8 4881ff00000080                 cmp        rdi, -0x80000000
012ff 49c7c200000080                 mov        r10, 0xffffffff80000000
01306 490f4cfa                       cmovl      rdi, r10
0130a 448bd7                         mov        r10d, edi
0130d 413bd2                         cmp        edx, r10d
01310 0f8d36010000                   jge        0x7f1e7fe818cc
01316 66660f1f840000000000           nop        word ptr [rax + rax]
01320 448bda                         mov        r11d, edx
01323 4963fb                         movsxd     rdi, r11d
01326 448bc2                         mov        r8d, edx
01329 448d1c10                       lea        r11d, [rax + rdx]
0132d 8d4a40                         lea        ecx, [rdx + 0x40]
01330 03c8                           add        ecx, eax
01332 458bcb                         mov        r9d, r11d
01335 488bb424c0000000               mov        rsi, qword ptr [rsp + 0xc0]
0133d 62b17e486f840e0c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0xc]
01348 62b17e487f84060c000000         vmovdqu32  zmmword ptr [rsi + r8 + 0xc], zmm0
01353 62f17e486f840e0c000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0xc]
0135e 62f17e487f843e4c000000         vmovdqu32  zmmword ptr [rsi + rdi + 0x4c], zmm0
01369 4d63cb                         movsxd     r9, r11d
0136c 448d8280000000                 lea        r8d, [rdx + 0x80]
01373 4403c0                         add        r8d, eax
01376 62b17e486f84060c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r8 + 0xc]
01381 62f17e487f843e8c000000         vmovdqu32  zmmword ptr [rsi + rdi + 0x8c], zmm0
0138c 62b17e486f840ecc000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0xcc]
01397 62f17e487f843ecc000000         vmovdqu32  zmmword ptr [rsi + rdi + 0xcc], zmm0
013a2 448d8200010000                 lea        r8d, [rdx + 0x100]
013a9 4403c0                         add        r8d, eax
013ac 458bd8                         mov        r11d, r8d
013af 62b17e486f84060c000000         vmovdqu32  zmm0, zmmword ptr [rsi + r8 + 0xc]
013ba 62f17e487f843e0c010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x10c], zmm0
013c5 62b17e486f840e4c010000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0x14c]
013d0 62f17e487f843e4c010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x14c], zmm0
013db 62b17e486f840e8c010000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 0x18c]
013e6 62f17e487f843e8c010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x18c], zmm0
013f1 4d63db                         movsxd     r11, r11d
013f4 62b17e486f841ecc000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 0xcc]
013ff 62f17e487f843ecc010000         vmovdqu32  zmmword ptr [rsi + rdi + 0x1cc], zmm0
0140a 81c200020000                   add        edx, 0x200
01410 413bd2                         cmp        edx, r10d
01413 0f8c07ffffff                   jl         0x7f1e7fe817a0
01419 3bd3                           cmp        edx, ebx
0141b 7d2f                           jge        0x7f1e7fe818cc
0141d 666690                         nop        
01420 448d1410                       lea        r10d, [rax + rdx]
01424 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
0142c 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
01437 448bd2                         mov        r10d, edx
0143a 62917e487f84130c000000         vmovdqu32  zmmword ptr [r11 + r10 + 0xc], zmm0
01445 83c240                         add        edx, 0x40
01448 3bd3                           cmp        edx, ebx
0144a 7cd4                           jl         0x7f1e7fe818a0
0144c 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01453 0f8d0ff8ffff                   jge        0x7f1e7fe810e8
01459 666690                         nop        
0145c 448d1410                       lea        r10d, [rax + rdx]
01460 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01468 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
0146d 448bda                         mov        r11d, edx
01470 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01478 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
0147d 83c208                         add        edx, 8
01480 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01487 7cd3                           jl         0x7f1e7fe818dc
01489 e9daf7ffff                     jmp        0x7f1e7fe810e8
0148e bee4ffffff                     mov        esi, 0xffffffe4
01493 488b2c24                       mov        rbp, qword ptr [rsp]
01497 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0149c 4489542408                     mov        dword ptr [rsp + 8], r10d
014a1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014a6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014ab 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
014b0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
014b5 895c2430                       mov        dword ptr [rsp + 0x30], ebx
014b9 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
014be 4489542438                     mov        dword ptr [rsp + 0x38], r10d
014c3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
014c8 4489542460                     mov        dword ptr [rsp + 0x60], r10d
014cd 666690                         nop        
014d0 c5f877                         vzeroupper 
014d3 e80864b5ff                     call       0x7f1e7f9d7d60
014d8 0f1f8400d015000b               nop        dword ptr [rax + rax + 0xb0015d0]
014e0 bee4ffffff                     mov        esi, 0xffffffe4
014e5 488b2c24                       mov        rbp, qword ptr [rsp]
014e9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014ee 4489542408                     mov        dword ptr [rsp + 8], r10d
014f3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014f8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014fd 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01502 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01507 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0150b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01510 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01515 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0151a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0151f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01524 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01529 89442464                       mov        dword ptr [rsp + 0x64], eax
0152d 666690                         nop        
01530 c5f877                         vzeroupper 
01533 e8a863b5ff                     call       0x7f1e7f9d7d60
01538 0f1f84003016000c               nop        dword ptr [rax + rax + 0xc001630]
01540 bee4ffffff                     mov        esi, 0xffffffe4
01545 488b2c24                       mov        rbp, qword ptr [rsp]
01549 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0154e 4489542408                     mov        dword ptr [rsp + 8], r10d
01553 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01558 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0155d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01562 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01567 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0156c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01571 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01576 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0157b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01580 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01588 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0158d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01595 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0159a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0159f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
015a4 89442464                       mov        dword ptr [rsp + 0x64], eax
015a8 895c2478                       mov        dword ptr [rsp + 0x78], ebx
015ac c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
015b5 666690                         nop        
015b8 c5f877                         vzeroupper 
015bb e82063b5ff                     call       0x7f1e7f9d7d60
015c0 0f1f8400b816000d               nop        dword ptr [rax + rax + 0xd0016b8]
015c8 bee4ffffff                     mov        esi, 0xffffffe4
015cd 488b2c24                       mov        rbp, qword ptr [rsp]
015d1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015d6 4489542408                     mov        dword ptr [rsp + 8], r10d
015db 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015e0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015e5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015ea 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015ef 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
015f4 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
015f9 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
015fe 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01603 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01608 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0160d 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01612 6690                           nop        
01614 c5f877                         vzeroupper 
01617 e8c462b5ff                     call       0x7f1e7f9d7d60
0161c 0f1f84001417000e               nop        dword ptr [rax + rax + 0xe001714]
01624 be45ffffff                     mov        esi, 0xffffff45
01629 488b2c24                       mov        rbp, qword ptr [rsp]
0162d 4c89542408                     mov        qword ptr [rsp + 8], r10
01632 6690                           nop        
01634 c5f877                         vzeroupper 
01637 e8a462b5ff                     call       0x7f1e7f9d7d60
0163c 0f1f84003417000f               nop        dword ptr [rax + rax + 0xf001734]
01644 be45ffffff                     mov        esi, 0xffffff45
01649 488b2c24                       mov        rbp, qword ptr [rsp]
0164d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01652 44895c2408                     mov        dword ptr [rsp + 8], r11d
01657 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0165c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01661 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01666 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0166b 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0166f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01674 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01679 89442464                       mov        dword ptr [rsp + 0x64], eax
0167d 8954246c                       mov        dword ptr [rsp + 0x6c], edx
01681 666690                         nop        
01684 c5f877                         vzeroupper 
01687 e85462b5ff                     call       0x7f1e7f9d7d60
0168c 0f1f840084170010               nop        dword ptr [rax + rax + 0x10001784]
01694 493bea                         cmp        rbp, r10
01697 bdffffffff                     mov        ebp, 0xffffffff
0169c 7c08                           jl         0x7f1e7fe81b26
0169e 400f95c5                       setne      bpl
016a2 400fb6ed                       movzx      ebp, bpl
016a6 be45ffffff                     mov        esi, 0xffffff45
016ab 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016b0 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016b5 895c2438                       mov        dword ptr [rsp + 0x38], ebx
016b9 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
016be 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
016c3 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
016c8 4489442468                     mov        dword ptr [rsp + 0x68], r8d
016cd 8944246c                       mov        dword ptr [rsp + 0x6c], eax
016d1 4c89542478                     mov        qword ptr [rsp + 0x78], r10
016d6 6690                           nop        
016d8 c5f877                         vzeroupper 
016db e80062b5ff                     call       0x7f1e7f9d7d60
016e0 0f1f8400d8170011               nop        dword ptr [rax + rax + 0x110017d8]
016e8 be45ffffff                     mov        esi, 0xffffff45
016ed 488b2c24                       mov        rbp, qword ptr [rsp]
016f1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016f6 44895c2408                     mov        dword ptr [rsp + 8], r11d
016fb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01700 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01705 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0170a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0170f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01713 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01718 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0171d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01722 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01727 89442464                       mov        dword ptr [rsp + 0x64], eax
0172b 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01730 c5f877                         vzeroupper 
01733 e8a861b5ff                     call       0x7f1e7f9d7d60
01738 0f1f840030180012               nop        dword ptr [rax + rax + 0x12001830]
01740 be45ffffff                     mov        esi, 0xffffff45
01745 488b2c24                       mov        rbp, qword ptr [rsp]
01749 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0174e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01753 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01758 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0175d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01762 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01767 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0176b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01770 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01775 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0177a 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0177f 89442464                       mov        dword ptr [rsp + 0x64], eax
01783 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01788 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0178d 666690                         nop        
01790 c5f877                         vzeroupper 
01793 e84861b5ff                     call       0x7f1e7f9d7d60
01798 0f1f840090180013               nop        dword ptr [rax + rax + 0x13001890]
017a0 bee4ffffff                     mov        esi, 0xffffffe4
017a5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017aa 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
017af 895c2438                       mov        dword ptr [rsp + 0x38], ebx
017b3 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
017b8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
017bd 4c89542448                     mov        qword ptr [rsp + 0x48], r10
017c2 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
017ca 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
017cf 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
017d7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017dc 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
017e4 4489542460                     mov        dword ptr [rsp + 0x60], r10d
017e9 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
017f1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
017f6 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
017fe 6690                           nop        
01800 c5f877                         vzeroupper 
01803 e8d860b5ff                     call       0x7f1e7f9d7d60
01808 0f1f840000190014               nop        dword ptr [rax + rax + 0x14001900]
01810 bee4ffffff                     mov        esi, 0xffffffe4
01815 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0181a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0181f 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01823 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01828 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0182d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01832 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0183a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0183f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01847 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0184c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01854 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01859 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0185e 4c89442478                     mov        qword ptr [rsp + 0x78], r8
01863 90                             nop        
01864 c5f877                         vzeroupper 
01867 e87460b5ff                     call       0x7f1e7f9d7d60
0186c 0f1f840064190015               nop        dword ptr [rax + rax + 0x15001964]
01874 bebeffffff                     mov        esi, 0xffffffbe
01879 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0187e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01883 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01887 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
0188c c5f877                         vzeroupper 
0188f e84c60b5ff                     call       0x7f1e7f9d7d60
01894 0f1f84008c190016               nop        dword ptr [rax + rax + 0x1600198c]
0189c 4533d2                         xor        r10d, r10d
0189f 4c891424                       mov        qword ptr [rsp], r10
018a3 e9c1e8ffff                     jmp        0x7f1e7fe805e9
018a8 4533d2                         xor        r10d, r10d
018ab 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
018b3 e9dce8ffff                     jmp        0x7f1e7fe80614
018b8 4533d2                         xor        r10d, r10d
018bb 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
018c3 e9fce8ffff                     jmp        0x7f1e7fe80644
018c8 4533d2                         xor        r10d, r10d
018cb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018d0 e917e9ffff                     jmp        0x7f1e7fe8066c
018d5 4533d2                         xor        r10d, r10d
018d8 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
018e0 e937e9ffff                     jmp        0x7f1e7fe8069c
018e5 beccffffff                     mov        esi, 0xffffffcc
018ea 488b2c24                       mov        rbp, qword ptr [rsp]
018ee 48894424f8                     mov        qword ptr [rsp - 8], rax
018f3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
018f7 89442408                       mov        dword ptr [rsp + 8], eax
018fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01900 48ff742420                     push       qword ptr [rsp + 0x20]
01905 488f442418                     pop        qword ptr [rsp + 0x18]
0190a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0190f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01914 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01919 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0191e 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01923 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01928 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0192d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01932 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0193a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0193f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01947 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0194c 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01954 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01959 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0195e 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01963 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0196b 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01970 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
01975 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
0197c 4489ac2494000000               mov        dword ptr [rsp + 0x94], r13d
01984 c5f877                         vzeroupper 
01987 e8545fb5ff                     call       0x7f1e7f9d7d60
0198c 0f1f8400841a0017               nop        dword ptr [rax + rax + 0x17001a84]
01994 beccffffff                     mov        esi, 0xffffffcc
01999 488b2c24                       mov        rbp, qword ptr [rsp]
0199d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019a2 4489542408                     mov        dword ptr [rsp + 8], r10d
019a7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019ac 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019b1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019b6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019bb 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
019c0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
019c5 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
019ca 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019cf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019d4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
019d9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
019de 4489542460                     mov        dword ptr [rsp + 0x60], r10d
019e3 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
019eb 4489742470                     mov        dword ptr [rsp + 0x70], r14d
019f0 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
019f8 c5f877                         vzeroupper 
019fb e8e05eb5ff                     call       0x7f1e7f9d7d60
01a00 0f1f8400f81a0018               nop        dword ptr [rax + rax + 0x18001af8]
01a08 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01a10 4d3bd8                         cmp        r11, r8
01a13 bdffffffff                     mov        ebp, 0xffffffff
01a18 7c08                           jl         0x7f1e7fe81ea2
01a1a 400f95c5                       setne      bpl
01a1e 400fb6ed                       movzx      ebp, bpl
01a22 be45ffffff                     mov        esi, 0xffffff45
01a27 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a2c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a31 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a35 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01a3a 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01a3f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a44 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01a49 89442468                       mov        dword ptr [rsp + 0x68], eax
01a4d 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01a52 6690                           nop        
01a54 c5f877                         vzeroupper 
01a57 e8845eb5ff                     call       0x7f1e7f9d7d60
01a5c 0f1f8400541b0019               nop        dword ptr [rax + rax + 0x19001b54]
01a64 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01a6c 493be8                         cmp        rbp, r8
01a6f bdffffffff                     mov        ebp, 0xffffffff
01a74 7c08                           jl         0x7f1e7fe81efe
01a76 400f95c5                       setne      bpl
01a7a 400fb6ed                       movzx      ebp, bpl
01a7e be45ffffff                     mov        esi, 0xffffff45
01a83 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a88 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a8d 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a91 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01a96 4c895c2448                     mov        qword ptr [rsp + 0x48], r11
01a9b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01aa0 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01aa5 89442468                       mov        dword ptr [rsp + 0x68], eax
01aa9 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01aae 6690                           nop        
01ab0 c5f877                         vzeroupper 
01ab3 e8285eb5ff                     call       0x7f1e7f9d7d60
01ab8 0f1f8400b01b001a               nop        dword ptr [rax + rax + 0x1a001bb0]
01ac0 448bda                         mov        r11d, edx
01ac3 448d1410                       lea        r10d, [rax + rdx]
01ac7 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01acf 4f8b54100c                     mov        r10, qword ptr [r8 + r10 + 0xc]
01ad4 4f8954180c                     mov        qword ptr [r8 + r11 + 0xc], r10
01ad9 448d5208                       lea        r10d, [rdx + 8]
01add 418bd2                         mov        edx, r10d
01ae0 453bd1                         cmp        r10d, r9d
01ae3 7cdb                           jl         0x7f1e7fe81f40
01ae5 443bd3                         cmp        r10d, ebx
01ae8 0f8d89000000                   jge        0x7f1e7fe81ff7
01aee 458bda                         mov        r11d, r10d
01af1 418bd3                         mov        edx, r11d
01af4 660f1f440000                   nop        word ptr [rax + rax]
01afa 660f1f440000                   nop        word ptr [rax + rax]
01b00 448bda                         mov        r11d, edx
01b03 4d63cb                         movsxd     r9, r11d
01b06 448bd2                         mov        r10d, edx
01b09 448d0410                       lea        r8d, [rax + rdx]
01b0d 458bd8                         mov        r11d, r8d
01b10 488b8c24c0000000               mov        rcx, qword ptr [rsp + 0xc0]
01b18 4e8b44010c                     mov        r8, qword ptr [rcx + r8 + 0xc]
01b1d 4e8944110c                     mov        qword ptr [rcx + r10 + 0xc], r8
01b22 4d63c3                         movsxd     r8, r11d
01b25 4e8b540114                     mov        r10, qword ptr [rcx + r8 + 0x14]
01b2a 4e89540914                     mov        qword ptr [rcx + r9 + 0x14], r10
01b2f 4e8b54011c                     mov        r10, qword ptr [rcx + r8 + 0x1c]
01b34 4e8954091c                     mov        qword ptr [rcx + r9 + 0x1c], r10
01b39 4e8b540124                     mov        r10, qword ptr [rcx + r8 + 0x24]
01b3e 4e89540924                     mov        qword ptr [rcx + r9 + 0x24], r10
01b43 4e8b54012c                     mov        r10, qword ptr [rcx + r8 + 0x2c]
01b48 4e8954092c                     mov        qword ptr [rcx + r9 + 0x2c], r10
01b4d 4e8b540134                     mov        r10, qword ptr [rcx + r8 + 0x34]
01b52 4e89540934                     mov        qword ptr [rcx + r9 + 0x34], r10
01b57 4e8b54013c                     mov        r10, qword ptr [rcx + r8 + 0x3c]
01b5c 4e8954093c                     mov        qword ptr [rcx + r9 + 0x3c], r10
01b61 4e8b540144                     mov        r10, qword ptr [rcx + r8 + 0x44]
01b66 4e89540944                     mov        qword ptr [rcx + r9 + 0x44], r10
01b6b 448d5240                       lea        r10d, [rdx + 0x40]
01b6f 418bd2                         mov        edx, r10d
01b72 443bd3                         cmp        r10d, ebx
01b75 7c89                           jl         0x7f1e7fe81f80
01b77 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01b7e 0f8de4f0ffff                   jge        0x7f1e7fe810e8
01b84 448bda                         mov        r11d, edx
01b87 90                             nop        
01b88 468d0418                       lea        r8d, [rax + r11]
01b8c 4c8b9424c0000000               mov        r10, qword ptr [rsp + 0xc0]
01b94 4f8b54020c                     mov        r10, qword ptr [r10 + r8 + 0xc]
01b99 458bcb                         mov        r9d, r11d
01b9c 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
01ba4 4f8954080c                     mov        qword ptr [r8 + r9 + 0xc], r10
01ba9 458d5308                       lea        r10d, [r11 + 8]
01bad 458bda                         mov        r11d, r10d
01bb0 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01bb8 7cce                           jl         0x7f1e7fe82008
01bba e9a9f0ffff                     jmp        0x7f1e7fe810e8
01bbf bee4ffffff                     mov        esi, 0xffffffe4
01bc4 488b2c24                       mov        rbp, qword ptr [rsp]
01bc8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01bcd 4489542408                     mov        dword ptr [rsp + 8], r10d
01bd2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bd7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bdc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01be1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01be6 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01bea 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01bef 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01bf4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01bf9 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01bfe 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
01c06 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01c0b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c10 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01c15 89442464                       mov        dword ptr [rsp + 0x64], eax
01c19 89942480000000                 mov        dword ptr [rsp + 0x80], edx
01c20 c5f877                         vzeroupper 
01c23 e8b85cb5ff                     call       0x7f1e7f9d7d60
01c28 0f1f8400201d001b               nop        dword ptr [rax + rax + 0x1b001d20]
01c30 be6effffff                     mov        esi, 0xffffff6e
01c35 488b2c24                       mov        rbp, qword ptr [rsp]
01c39 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01c3e 4489442408                     mov        dword ptr [rsp + 8], r8d
01c43 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01c48 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01c4d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01c52 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01c57 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01c5b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01c60 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01c65 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01c6a 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01c6f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c74 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01c79 89442464                       mov        dword ptr [rsp + 0x64], eax
01c7d 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01c82 8954247c                       mov        dword ptr [rsp + 0x7c], edx
01c86 6690                           nop        
01c88 c5f877                         vzeroupper 
01c8b e8505cb5ff                     call       0x7f1e7f9d7d60
01c90 0f1f8400881d001c               nop        dword ptr [rax + rax + 0x1c001d88]
01c98 be45ffffff                     mov        esi, 0xffffff45
01c9d 488b2c24                       mov        rbp, qword ptr [rsp]
01ca1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ca6 4489542408                     mov        dword ptr [rsp + 8], r10d
01cab 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cb0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cb5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cba 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cbf 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01cc3 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01cc8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ccd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cd2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cd7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01cdc 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01ce1 89442464                       mov        dword ptr [rsp + 0x64], eax
01ce5 89542478                       mov        dword ptr [rsp + 0x78], edx
01ce9 666690                         nop        
01cec c5f877                         vzeroupper 
01cef e8ec5bb5ff                     call       0x7f1e7f9d7d60
01cf4 0f1f8400ec1d001d               nop        dword ptr [rax + rax + 0x1d001dec]
01cfc be3dffffff                     mov        esi, 0xffffff3d
01d01 488b2c24                       mov        rbp, qword ptr [rsp]
01d05 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d0a 4489542408                     mov        dword ptr [rsp + 8], r10d
01d0f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d14 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d19 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d1e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d23 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d27 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01d2c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01d31 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01d36 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d3b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01d40 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01d45 89442464                       mov        dword ptr [rsp + 0x64], eax
01d49 89542478                       mov        dword ptr [rsp + 0x78], edx
01d4d 666690                         nop        
01d50 c5f877                         vzeroupper 
01d53 e8885bb5ff                     call       0x7f1e7f9d7d60
01d58 0f1f8400501e001e               nop        dword ptr [rax + rax + 0x1e001e50]
01d60 bee4ffffff                     mov        esi, 0xffffffe4
01d65 488b2c24                       mov        rbp, qword ptr [rsp]
01d69 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d6e 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d73 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d78 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d7d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d82 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d87 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01d8c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d91 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01d96 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01d9b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01da0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01da5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01dad 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01db2 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01dba 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01dbf 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01dc4 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01dc9 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
01dd1 666690                         nop        
01dd4 c5f877                         vzeroupper 
01dd7 e8045bb5ff                     call       0x7f1e7f9d7d60
01ddc 0f1f8400d41e001f               nop        dword ptr [rax + rax + 0x1f001ed4]
01de4 bee4ffffff                     mov        esi, 0xffffffe4
01de9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dee 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01df3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01df8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01dfd 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e02 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01e07 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e0c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e11 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01e19 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e1e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01e26 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01e2b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e30 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e35 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01e3a 6690                           nop        
01e3c c5f877                         vzeroupper 
01e3f e89c5ab5ff                     call       0x7f1e7f9d7d60
01e44 0f1f84003c1f0020               nop        dword ptr [rax + rax + 0x20001f3c]
01e4c 418d6e01                       lea        ebp, [r14 + 1]
01e50 bee4ffffff                     mov        esi, 0xffffffe4
01e55 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01e5a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e5f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01e64 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e69 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01e6e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01e73 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01e78 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e7d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01e85 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e8a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01e92 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01e97 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01e9f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ea4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01ea9 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01eae 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01eb3 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01ebb 90                             nop        
01ebc c5f877                         vzeroupper 
01ebf e81c5ab5ff                     call       0x7f1e7f9d7d60
01ec4 0f1f8400bc1f0021               nop        dword ptr [rax + rax + 0x21001fbc]
01ecc bee4ffffff                     mov        esi, 0xffffffe4
01ed1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ed6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01edb 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01ee0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ee5 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01eea 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01eef 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ef4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ef9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01f01 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01f06 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01f0e 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01f13 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f18 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01f1d 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f22 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01f2a 6690                           nop        
01f2c c5f877                         vzeroupper 
01f2f e8ac59b5ff                     call       0x7f1e7f9d7d60
01f34 0f1f84002c200022               nop        dword ptr [rax + rax + 0x2200202c]
01f3c bee4ffffff                     mov        esi, 0xffffffe4
01f41 488b2c24                       mov        rbp, qword ptr [rsp]
01f45 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f4a 4489542408                     mov        dword ptr [rsp + 8], r10d
01f4f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f54 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f59 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f5e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f63 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01f68 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01f6d 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01f72 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01f77 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01f7c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f81 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f86 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01f8b 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01f90 c5f877                         vzeroupper 
01f93 e84859b5ff                     call       0x7f1e7f9d7d60
01f98 0f1f840090200023               nop        dword ptr [rax + rax + 0x23002090]
01fa0 beccffffff                     mov        esi, 0xffffffcc
01fa5 488b2c24                       mov        rbp, qword ptr [rsp]
01fa9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01fae 44895c2408                     mov        dword ptr [rsp + 8], r11d
01fb3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fb8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fbd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fc2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fc7 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01fcc 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01fd1 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01fd6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01fdb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01fe0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fe5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01fed 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01ff2 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01ffa 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01fff 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02004 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02009 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0200e 6690                           nop        
02010 c5f877                         vzeroupper 
02013 e8c858b5ff                     call       0x7f1e7f9d7d60
02018 0f1f840010210024               nop        dword ptr [rax + rax + 0x24002110]
02020 be45ffffff                     mov        esi, 0xffffff45
02025 488b2c24                       mov        rbp, qword ptr [rsp]
02029 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0202e 4489542408                     mov        dword ptr [rsp + 8], r10d
02033 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02038 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0203d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02042 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02047 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0204c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02051 4489742468                     mov        dword ptr [rsp + 0x68], r14d
02056 6690                           nop        
02058 c5f877                         vzeroupper 
0205b e88058b5ff                     call       0x7f1e7f9d7d60
02060 0f1f840058210025               nop        dword ptr [rax + rax + 0x25002158]
02068 be85ffffff                     mov        esi, 0xffffff85
0206d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02072 44891c24                       mov        dword ptr [rsp], r11d
02076 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0207b 44895c2404                     mov        dword ptr [rsp + 4], r11d
02080 895c2408                       mov        dword ptr [rsp + 8], ebx
02084 44896c240c                     mov        dword ptr [rsp + 0xc], r13d
02089 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0208e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02093 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02098 c5f877                         vzeroupper 
0209b e84058b5ff                     call       0x7f1e7f9d7d60
020a0 0f1f840098210026               nop        dword ptr [rax + rax + 0x26002198]
020a8 4533d2                         xor        r10d, r10d
020ab 4d8bc2                         mov        r8, r10
020ae eb08                           jmp        0x7f1e7fe82538
020b0 4c8b8424c0000000               mov        r8, qword ptr [rsp + 0xc0]
020b8 be6effffff                     mov        esi, 0xffffff6e
020bd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020c2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
020c7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
020cb 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
020d0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
020d5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
020da 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
020df 4c89442470                     mov        qword ptr [rsp + 0x70], r8
020e4 c5f877                         vzeroupper 
020e7 e8f457b5ff                     call       0x7f1e7f9d7d60
020ec 0f1f8400e4210027               nop        dword ptr [rax + rax + 0x270021e4]
020f4 beccffffff                     mov        esi, 0xffffffcc
020f9 488b2c24                       mov        rbp, qword ptr [rsp]
020fd 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02101 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02106 6690                           nop        
02108 c5f877                         vzeroupper 
0210b e8d057b5ff                     call       0x7f1e7f9d7d60
02110 0f1f840008220028               nop        dword ptr [rax + rax + 0x28002208]
02118 bee4ffffff                     mov        esi, 0xffffffe4
0211d 488b2c24                       mov        rbp, qword ptr [rsp]
02121 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02126 4489542408                     mov        dword ptr [rsp + 8], r10d
0212b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02130 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02135 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0213a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0213f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02144 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02149 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0214e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02153 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0215b 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02160 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02165 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0216a 89442460                       mov        dword ptr [rsp + 0x60], eax
0216e 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02173 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02177 90                             nop        
02178 c5f877                         vzeroupper 
0217b e86057b5ff                     call       0x7f1e7f9d7d60
02180 0f1f840078220029               nop        dword ptr [rax + rax + 0x29002278]
02188 bee4ffffff                     mov        esi, 0xffffffe4
0218d 488b2c24                       mov        rbp, qword ptr [rsp]
02191 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02196 44895c2408                     mov        dword ptr [rsp + 8], r11d
0219b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021a0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021a5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021aa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021af 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
021b4 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
021b9 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
021be 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021c3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
021cb 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
021d0 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
021d8 4489542458                     mov        dword ptr [rsp + 0x58], r10d
021dd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
021e2 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
021e7 89442460                       mov        dword ptr [rsp + 0x60], eax
021eb 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
021f3 4489542464                     mov        dword ptr [rsp + 0x64], r10d
021f8 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
021fd 4489442474                     mov        dword ptr [rsp + 0x74], r8d
02202 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02209 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02212 6690                           nop        
02214 c5f877                         vzeroupper 
02217 e8c456b5ff                     call       0x7f1e7f9d7d60
0221c 0f1f84001423002a               nop        dword ptr [rax + rax + 0x2a002314]
02224 beccffffff                     mov        esi, 0xffffffcc
02229 488b2c24                       mov        rbp, qword ptr [rsp]
0222d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02232 44895c2408                     mov        dword ptr [rsp + 8], r11d
02237 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0223c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02241 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02246 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0224b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02250 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02255 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0225a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0225f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
02267 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0226c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02274 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02279 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0227e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02283 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
02287 89842488000000                 mov        dword ptr [rsp + 0x88], eax
0228e 6690                           nop        
02290 c5f877                         vzeroupper 
02293 e84856b5ff                     call       0x7f1e7f9d7d60
02298 0f1f84009023002b               nop        dword ptr [rax + rax + 0x2b002390]
022a0 8bea                           mov        ebp, edx
022a2 83c510                         add        ebp, 0x10
022a5 be6effffff                     mov        esi, 0xffffff6e
022aa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
022af 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
022b4 89542438                       mov        dword ptr [rsp + 0x38], edx
022b8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
022bd 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
022c2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
022c7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
022cc 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
022d1 4489542464                     mov        dword ptr [rsp + 0x64], r10d
022d6 89442468                       mov        dword ptr [rsp + 0x68], eax
022da 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
022df 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
022e6 6690                           nop        
022e8 c5f877                         vzeroupper 
022eb e8f055b5ff                     call       0x7f1e7f9d7d60
022f0 0f1f8400e823002c               nop        dword ptr [rax + rax + 0x2c0023e8]
022f8 8bea                           mov        ebp, edx
022fa 83c510                         add        ebp, 0x10
022fd be66ffffff                     mov        esi, 0xffffff66
02302 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02307 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0230c 89542438                       mov        dword ptr [rsp + 0x38], edx
02310 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02315 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0231a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0231f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02324 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02329 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0232e 89442468                       mov        dword ptr [rsp + 0x68], eax
02332 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
02337 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
0233e 6690                           nop        
02340 c5f877                         vzeroupper 
02343 e89855b5ff                     call       0x7f1e7f9d7d60
02348 0f1f84004024002d               nop        dword ptr [rax + rax + 0x2d002440]
02350 bee4ffffff                     mov        esi, 0xffffffe4
02355 488b2c24                       mov        rbp, qword ptr [rsp]
02359 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0235e 4489542408                     mov        dword ptr [rsp + 8], r10d
02363 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02368 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0236d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02372 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02377 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0237c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02381 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02386 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0238b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02390 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02395 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0239d 4489542444                     mov        dword ptr [rsp + 0x44], r10d
023a2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
023a7 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
023ac 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
023b4 c5f877                         vzeroupper 
023b7 e82455b5ff                     call       0x7f1e7f9d7d60
023bc 0f1f8400b424002e               nop        dword ptr [rax + rax + 0x2e0024b4]
023c4 bee4ffffff                     mov        esi, 0xffffffe4
023c9 488b2c24                       mov        rbp, qword ptr [rsp]
023cd 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
023d2 44895c2408                     mov        dword ptr [rsp + 8], r11d
023d7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023e1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023e6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023eb 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
023f0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
023f5 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
023fa 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
023ff 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02404 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02409 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02411 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02416 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0241b 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02420 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
02425 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
0242d 666690                         nop        
02430 c5f877                         vzeroupper 
02433 e8a854b5ff                     call       0x7f1e7f9d7d60
02438 0f1f84003025002f               nop        dword ptr [rax + rax + 0x2f002530]
02440 be6effffff                     mov        esi, 0xffffff6e
02445 488b2c24                       mov        rbp, qword ptr [rsp]
02449 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0244e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02453 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02458 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0245d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02462 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02467 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0246c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02471 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02476 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0247b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
02483 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02488 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
0248c 89542470                       mov        dword ptr [rsp + 0x70], edx
02490 c5f877                         vzeroupper 
02493 e84854b5ff                     call       0x7f1e7f9d7d60
02498 0f1f840090250030               nop        dword ptr [rax + rax + 0x30002590]
024a0 be66ffffff                     mov        esi, 0xffffff66
024a5 488b2c24                       mov        rbp, qword ptr [rsp]
024a9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
024ae 44895c2408                     mov        dword ptr [rsp + 8], r11d
024b3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024b8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024bd 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024c2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
024c7 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
024cc 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
024d1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
024d6 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
024db 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
024e3 458bda                         mov        r11d, r10d
024e6 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
024eb 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
024ef 89542470                       mov        dword ptr [rsp + 0x70], edx
024f3 90                             nop        
024f4 c5f877                         vzeroupper 
024f7 e8e453b5ff                     call       0x7f1e7f9d7d60
024fc 0f1f8400f4250031               nop        dword ptr [rax + rax + 0x310025f4]
02504 488bf0                         mov        rsi, rax
02507 eb0d                           jmp        0x7f1e7fe82996
02509 488bf0                         mov        rsi, rax
0250c eb08                           jmp        0x7f1e7fe82996
0250e 488bf0                         mov        rsi, rax
02511 eb03                           jmp        0x7f1e7fe82996
02513 488bf0                         mov        rsi, rax
02516 c5f877                         vzeroupper 
02519 4881c4f0000000                 add        rsp, 0xf0
02520 5d                             pop        rbp
02521 e9ba7fb5ff                     jmp        0x7f1e7f9da960
02526 bef6ffffff                     mov        esi, 0xfffffff6
0252b 90                             nop        
0252c c5f877                         vzeroupper 
0252f e8ac53b5ff                     call       0x7f1e7f9d7d60
02534 0f1f84002c260032               nop        dword ptr [rax + rax + 0x3200262c]
0253c 49ba8915e87f1e7f0000           movabs     r10, 0x7f1e7fe81589
02546 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0254d e90e05a9ff                     jmp        0x7f1e7f912ee0
02552 e8c9d0a7ff                     call       0x7f1e7f8ffaa0
02557 e9d2daffff                     jmp        0x7f1e7fe804ae
0255c f4                             hlt        
0255d f4                             hlt        
0255e f4                             hlt        
0255f f4                             hlt        
