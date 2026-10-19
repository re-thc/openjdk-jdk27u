00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854029a9ff                   jne        0x7fd1c390f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f851a280000                   jne        0x7fd1c3e7f858
0003e 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 c4c1f96ec0                     vmovq      xmm0, r8
0004b 448bef                         mov        r13d, edi
0004e 488bee                         mov        rbp, rsi
00051 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00055 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00059 4489442454                     mov        dword ptr [rsp + 0x54], r8d
0005e 452bc2                         sub        r8d, r10d
00061 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00069 453bc8                         cmp        r9d, r8d
0006c 0f8f721b0000                   jg         0x7fd1c3e7ebe4
00072 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00076 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
0007a 4c638c24f0000000               movsxd     r9, dword ptr [rsp + 0xf0]
00082 4d63c2                         movsxd     r8, r10d
00085 4d03c3                         add        r8, r11
00088 492bc8                         sub        rcx, r8
0008b 4c3bc9                         cmp        r9, rcx
0008e 0f8f501b0000                   jg         0x7fd1c3e7ebe4
00094 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
00098 488b4628                       mov        rax, qword ptr [rsi + 0x28]
0009c 4885c0                         test       rax, rax
0009f 0f848f120000                   je         0x7fd1c3e7e334
000a5 33db                           xor        ebx, ebx
000a7 4c8bc2                         mov        r8, rdx
000aa 8b7208                         mov        esi, dword ptr [rdx + 8]
000ad 8b7d44                         mov        edi, dword ptr [rbp + 0x44]
000b0 458bcd                         mov        r9d, r13d
000b3 4585c9                         test       r9d, r9d
000b6 0f8e6c180000                   jle        0x7fd1c3e7e928
000bc 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
000c4 492bc3                         sub        rax, r11
000c7 8d4ee0                         lea        ecx, [rsi - 0x20]
000ca 8b542454                       mov        edx, dword ptr [rsp + 0x54]
000ce 83c2e0                         add        edx, -0x20
000d1 c4c1f97ec5                     vmovq      r13, xmm0
000d6 458b5508                       mov        r10d, dword ptr [r13 + 8]
000da 4585d2                         test       r10d, r10d
000dd 0f86251b0000                   jbe        0x7fd1c3e7ec08
000e3 89542430                       mov        dword ptr [rsp + 0x30], edx
000e7 894c2438                       mov        dword ptr [rsp + 0x38], ecx
000eb 897c2448                       mov        dword ptr [rsp + 0x48], edi
000ef 89742404                       mov        dword ptr [rsp + 4], esi
000f3 4889442470                     mov        qword ptr [rsp + 0x70], rax
000f8 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000fd 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00102 4c896c2408                     mov        qword ptr [rsp + 8], r13
00107 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0010c 4c89442440                     mov        qword ptr [rsp + 0x40], r8
00111 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
00116 4d63d2                         movsxd     r10, r10d
00119 4d63d9                         movsxd     r11, r9d
0011c 49ffcb                         dec        r11
0011f 4d3bda                         cmp        r11, r10
00122 0f83d41a0000                   jae        0x7fd1c3e7ebfc
00128 85db                           test       ebx, ebx
0012a 0f84d31a0000                   je         0x7fd1c3e7ec03
00130 4c8b9c24f8000000               mov        r11, qword ptr [rsp + 0xf8]
00138 458b5308                       mov        r10d, dword ptr [r11 + 8]
0013c 4585d2                         test       r10d, r10d
0013f 0f86101b0000                   jbe        0x7fd1c3e7ec55
00145 4183fa01                       cmp        r10d, 1
00149 0f86061b0000                   jbe        0x7fd1c3e7ec55
0014f 4183fa02                       cmp        r10d, 2
00153 0f86fc1a0000                   jbe        0x7fd1c3e7ec55
00159 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
00161 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
00168 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
0016d 448b5f08                       mov        r11d, dword ptr [rdi + 8]
00171 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
00179 448d5ef1                       lea        r11d, [rsi - 0xf]
0017d 4585db                         test       r11d, r11d
00180 0f8c1a1b0000                   jl         0x7fd1c3e7eca0
00186 448b9424fc000000               mov        r10d, dword ptr [rsp + 0xfc]
0018e 4183c2f1                       add        r10d, -0xf
00192 4585d2                         test       r10d, r10d
00195 0f8c0c1b0000                   jl         0x7fd1c3e7eca7
0019b 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
001a3 4183c3f9                       add        r11d, -7
001a7 4585db                         test       r11d, r11d
001aa 0f8cfe1a0000                   jl         0x7fd1c3e7ecae
001b0 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
001b8 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
001bd 4c8bd7                         mov        r10, rdi
001c0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001c5 4d63d3                         movsxd     r10, r11d
001c8 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001d0 4183c3f1                       add        r11d, -0xf
001d4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
001d9 4983c2f1                       add        r10, -0xf
001dd 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
001e5 448bde                         mov        r11d, esi
001e8 458d53f1                       lea        r10d, [r11 - 0xf]
001ec 4489542450                     mov        dword ptr [rsp + 0x50], r10d
001f1 4d63d3                         movsxd     r10, r11d
001f4 4983c2f1                       add        r10, -0xf
001f8 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00200 4533c0                         xor        r8d, r8d
00203 33db                           xor        ebx, ebx
00205 e9ee010000                     jmp        0x7fd1c3e7d3f8
0020a 4533ed                         xor        r13d, r13d
0020d 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00215 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0021a 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
0021e 83fa03                         cmp        edx, 3
00221 0f8e61030000                   jle        0x7fd1c3e7d588
00227 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0022c 45895314                       mov        dword ptr [r11 + 0x14], r10d
00230 458b530c                       mov        r10d, dword ptr [r11 + 0xc]
00234 45895310                       mov        dword ptr [r11 + 0x10], r10d
00238 448d52fd                       lea        r10d, [rdx - 3]
0023c 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00244 4589530c                       mov        dword ptr [r11 + 0xc], r10d
00248 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00250 4c639424a0000000               movsxd     r10, dword ptr [rsp + 0xa0]
00258 4c638424a8000000               movsxd     r8, dword ptr [rsp + 0xa8]
00260 4c03442428                     add        r8, qword ptr [rsp + 0x28]
00265 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
0026d 4d8bcb                         mov        r9, r11
00270 4d03c3                         add        r8, r11
00273 4d3bd0                         cmp        r10, r8
00276 0f8f00150000                   jg         0x7fd1c3e7e77c
0027c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00284 4585d2                         test       r10d, r10d
00287 0f8e3b140000                   jle        0x7fd1c3e7e6c8
0028d 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00295 4403ac2484000000               add        r13d, dword ptr [rsp + 0x84]
0029d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
002a2 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
002aa 4b8d741a0c                     lea        rsi, [r10 + r11 + 0xc]
002af 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
002b4 4503d5                         add        r10d, r13d
002b7 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
002bc 498d7c180c                     lea        rdi, [r8 + rbx + 0xc]
002c1 448bc3                         mov        r8d, ebx
002c4 4403842484000000               add        r8d, dword ptr [rsp + 0x84]
002cc 4489442434                     mov        dword ptr [rsp + 0x34], r8d
002d1 48636c243c                     movsxd     rbp, dword ptr [rsp + 0x3c]
002d6 443b542430                     cmp        r10d, dword ptr [rsp + 0x30]
002db 0f8f380c0000                   jg         0x7fd1c3e7df19
002e1 443b442438                     cmp        r8d, dword ptr [rsp + 0x38]
002e6 0f8f2c150000                   jg         0x7fd1c3e7e818
002ec 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
002f4 4183fe10                       cmp        r14d, 0x10
002f8 0f8f7a010000                   jg         0x7fd1c3e7d478
002fe 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
00302 0f83a4120000                   jae        0x7fd1c3e7e5ac
00308 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0030d c4c17a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rbx + 0xc]
00314 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00319 0f8319130000                   jae        0x7fd1c3e7e638
0031f 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00327 4403c3                         add        r8d, ebx
0032a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0032f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00334 c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
0033b 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
00342 4103db                         add        ebx, r11d
00345 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
0034c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00354 442b9c24a0000000               sub        r11d, dword ptr [rsp + 0xa0]
0035c 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00364 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00369 4183fa10                       cmp        r10d, 0x10
0036d 0f8f25150000                   jg         0x7fd1c3e7e898
00373 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0037b 4183fb10                       cmp        r11d, 0x10
0037f 0f8c73030000                   jl         0x7fd1c3e7d6f8
00385 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0038d 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00392 0f83d9100000                   jae        0x7fd1c3e7e471
00398 458bda                         mov        r11d, r10d
0039b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
003a0 c4817a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 0xc]
003a7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
003af 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
003b4 0f8352110000                   jae        0x7fd1c3e7e50c
003ba 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003c2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
003c7 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
003ce 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
003d3 4503c2                         add        r8d, r10d
003d6 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
003de 448b8424bc000000               mov        r8d, dword ptr [rsp + 0xbc]
003e6 41ffc0                         inc        r8d
003e9 443b442420                     cmp        r8d, dword ptr [rsp + 0x20]
003ee 0f8da50d0000                   jge        0x7fd1c3e7e199
003f4 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
003f8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
003fd 4f8b54c210                     mov        r10, qword ptr [r10 + r8*8 + 0x10]
00402 4d8bda                         mov        r11, r10
00405 49c1eb12                       shr        r11, 0x12
00409 458bdb                         mov        r11d, r11d
0040c 4181e3ffff0300                 and        r11d, 0x3ffff
00413 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00418 458bea                         mov        r13d, r10d
0041b 49c1fa24                       sar        r10, 0x24
0041f 4181e5ffff0100                 and        r13d, 0x1ffff
00426 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
0042e 458bd2                         mov        r10d, r10d
00431 418bd2                         mov        edx, r10d
00434 4585d2                         test       r10d, r10d
00437 0f8cab120000                   jl         0x7fd1c3e7e6e8
0043d 4585ed                         test       r13d, r13d
00440 0f84c4fdffff                   je         0x7fd1c3e7d20a
00446 448b1424                       mov        r10d, dword ptr [rsp]
0044a 442bd3                         sub        r10d, ebx
0044d 453bea                         cmp        r13d, r10d
00450 0f8ebffdffff                   jle        0x7fd1c3e7d215
00456 be45ffffff                     mov        esi, 0xffffff45
0045b 418bed                         mov        ebp, r13d
0045e 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00466 6690                           nop        
00468 c5f877                         vzeroupper 
0046b e8f062acff                     call       0x7fd1c3943760
00470 0f1f840068050000               nop        dword ptr [rax + rax + 0x568]
00478 4183fe30                       cmp        r14d, 0x30
0047c 0f8f7e080000                   jg         0x7fd1c3e7dd00
00482 3b5c2450                       cmp        ebx, dword ptr [rsp + 0x50]
00486 0f83bd140000                   jae        0x7fd1c3e7e949
0048c 4c63d3                         movsxd     r10, ebx
0048f 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00494 c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
0049b 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
004a0 0f832e150000                   jae        0x7fd1c3e7e9d4
004a6 458d4310                       lea        r8d, [r11 + 0x10]
004aa 418bf8                         mov        edi, r8d
004ad 4d63cb                         movsxd     r9, r11d
004b0 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
004b5 c4817a7f44080c                 vmovdqu    xmmword ptr [r8 + r9 + 0xc], xmm0
004bc 448bc7                         mov        r8d, edi
004bf 453bc5                         cmp        r8d, r13d
004c2 0f8da3000000                   jge        0x7fd1c3e7d56b
004c8 4d2bd1                         sub        r10, r9
004cb 4d63c8                         movsxd     r9, r8d
004ce 4f8d0411                       lea        r8, [r9 + r10]
004d2 4c3b842498000000               cmp        r8, qword ptr [rsp + 0x98]
004da 0f83a4150000                   jae        0x7fd1c3e7ea84
004e0 4d63c5                         movsxd     r8, r13d
004e3 4d2bc1                         sub        r8, r9
004e6 4983c00f                       add        r8, 0xf
004ea 4983e0f0                       and        r8, 0xfffffffffffffff0
004ee 458bc0                         mov        r8d, r8d
004f1 478d4c1810                     lea        r9d, [r8 + r11 + 0x10]
004f6 4d63c1                         movsxd     r8, r9d
004f9 4f8d5410f0                     lea        r10, [r8 + r10 - 0x10]
004fe 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
00506 0f8378150000                   jae        0x7fd1c3e7ea84
0050c 3b7c244c                       cmp        edi, dword ptr [rsp + 0x4c]
00510 0f836e150000                   jae        0x7fd1c3e7ea84
00516 4983c0f0                       add        r8, -0x10
0051a 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00522 0f835c150000                   jae        0x7fd1c3e7ea84
00528 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
0052f 0f8fff150000                   jg         0x7fd1c3e7eb34
00535 448bd3                         mov        r10d, ebx
00538 452bd3                         sub        r10d, r11d
0053b 0f1f440000                     nop        dword ptr [rax + rax]
00540 458d1c3a                       lea        r11d, [r10 + rdi]
00544 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
00549 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
00550 448bdf                         mov        r11d, edi
00553 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00558 c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
0055f 448d5f10                       lea        r11d, [rdi + 0x10]
00563 418bfb                         mov        edi, r11d
00566 453bdd                         cmp        r11d, r13d
00569 7cd5                           jl         0x7fd1c3e7d540
0056b 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00573 4403f3                         add        r14d, ebx
00576 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0057b 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00583 e9c4fdffff                     jmp        0x7fd1c3e7d34c
00588 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00590 4585ed                         test       r13d, r13d
00593 7407                           je         0x7fd1c3e7d59c
00595 448d5aff                       lea        r11d, [rdx - 1]
00599 418bd3                         mov        edx, r11d
0059c 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
005a1 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
005a5 85d2                           test       edx, edx
005a7 0f84bc080000                   je         0x7fd1c3e7de69
005ad 83fa03                         cmp        edx, 3
005b0 0f849e0c0000                   je         0x7fd1c3e7e254
005b6 83fa02                         cmp        edx, 2
005b9 0f8788000000                   ja         0x7fd1c3e7d647
005bf 3b9424f8000000                 cmp        edx, dword ptr [rsp + 0xf8]
005c6 0f83e9160000                   jae        0x7fd1c3e7ecb5
005cc 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
005d1 418b4c930c                     mov        ecx, dword ptr [r11 + rdx*4 + 0xc]
005d6 85d2                           test       edx, edx
005d8 7e50                           jle        0x7fd1c3e7d62a
005da 448d52ff                       lea        r10d, [rdx - 1]
005de 443b9424f8000000               cmp        r10d, dword ptr [rsp + 0xf8]
005e6 0f83e4190000                   jae        0x7fd1c3e7efd0
005ec 4c63ca                         movsxd     r9, edx
005ef 458bd3                         mov        r10d, r11d
005f2 4183c2d0                       add        r10d, -0x30
005f6 41c1ea02                       shr        r10d, 2
005fa 458d5c12ff                     lea        r11d, [r10 + rdx - 1]
005ff 41ba04000000                   mov        r10d, 4
00605 c442a8f5d3                     bzhi       r10, r11, r10
0060a 4d2bca                         sub        r9, r10
0060d 49ffc9                         dec        r9
00610 4533d2                         xor        r10d, r10d
00613 4d85c9                         test       r9, r9
00616 4d0f4cca                       cmovl      r9, r10
0061a 418bf9                         mov        edi, r9d
0061d 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00625 e93d070000                     jmp        0x7fd1c3e7dd67
0062a 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00632 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00637 41894a0c                       mov        dword ptr [r10 + 0xc], ecx
0063b 898c24a0000000                 mov        dword ptr [rsp + 0xa0], ecx
00642 e909fcffff                     jmp        0x7fd1c3e7d250
00647 48be48387ce200000000           movabs     rsi, 0xe27c3848
00651 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00656 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
0065e 448b1424                       mov        r10d, dword ptr [rsp]
00662 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0066a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0066f 4c891424                       mov        qword ptr [rsp], r10
00673 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00678 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
00680 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00685 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0068a 895c2418                       mov        dword ptr [rsp + 0x18], ebx
0068e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
00693 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00698 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0069d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
006a2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006a7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
006ac 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
006b1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
006b6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
006bb 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
006c0 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
006c5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
006ca 6690                           nop        
006cc c5f877                         vzeroupper 
006cf e88c31a9ff                     call       0x7fd1c3910860
006d4 0f1f8400cc070001               nop        dword ptr [rax + rax + 0x10007cc]
006dc 4885c0                         test       rax, rax
006df 0f846f160000                   je         0x7fd1c3e7ed54
006e5 488bf0                         mov        rsi, rax
006e8 c5f877                         vzeroupper 
006eb 4881c4e0000000                 add        rsp, 0xe0
006f2 5d                             pop        rbp
006f3 e968b3acff                     jmp        0x7fd1c3948a60
006f8 458bda                         mov        r11d, r10d
006fb 44039c2484000000               add        r11d, dword ptr [rsp + 0x84]
00703 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
0070b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00713 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
00718 0f8dfa020000                   jge        0x7fd1c3e7da18
0071e 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00726 4183c308                       add        r11d, 8
0072a 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
00732 4183fa08                       cmp        r10d, 8
00736 0f8da9010000                   jge        0x7fd1c3e7d8e5
0073c 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00744 443b9c24fc000000               cmp        r11d, dword ptr [rsp + 0xfc]
0074c 0f835e1b0000                   jae        0x7fd1c3e7f2b0
00752 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00757 430fbe6c1a0c                   movsx      ebp, byte ptr [r10 + r11 + 0xc]
0075d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00765 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
0076d 0f83dd1b0000                   jae        0x7fd1c3e7f350
00773 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00778 43886c130c                     mov        byte ptr [r11 + r10 + 0xc], bpl
0077d 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00785 4183c203                       add        r10d, 3
00789 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00791 41ffc0                         inc        r8d
00794 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
0079c 0f833a1c0000                   jae        0x7fd1c3e7f3dc
007a2 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
007aa 4183c203                       add        r10d, 3
007ae 4c639c24a4000000               movsxd     r11, dword ptr [rsp + 0xa4]
007b6 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
007ba 420fbe6c190d                   movsx      ebp, byte ptr [rcx + r11 + 0xd]
007c0 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
007c8 0f83b21c0000                   jae        0x7fd1c3e7f480
007ce 4c63942484000000               movsxd     r10, dword ptr [rsp + 0x84]
007d6 42886c110d                     mov        byte ptr [rcx + r10 + 0xd], bpl
007db 460fbe4c190e                   movsx      r9d, byte ptr [rcx + r11 + 0xe]
007e1 46884c110e                     mov        byte ptr [rcx + r10 + 0xe], r9b
007e6 460fbe5c190f                   movsx      r11d, byte ptr [rcx + r11 + 0xf]
007ec 46885c110f                     mov        byte ptr [rcx + r10 + 0xf], r11b
007f1 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
007f9 4183fb08                       cmp        r11d, 8
007fd 0f830d1d0000                   jae        0x7fd1c3e7f510
00803 49bab08c79e200000000           movabs     r10, 0xe2798cb0
0080d 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
00815 47034c9a0c                     add        r9d, dword ptr [r10 + r11*4 + 0xc]
0081a 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
00822 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00827 4183fa04                       cmp        r10d, 4
0082b 7e3f                           jle        0x7fd1c3e7d86c
0082d 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
00834 83c504                         add        ebp, 4
00837 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
0083c 418bd1                         mov        edx, r9d
0083f 90                             nop        
00840 c5f877                         vzeroupper 
00843 e81830a9ff                     call       0x7fd1c3910860
00848 0f1f840040090002               nop        dword ptr [rax + rax + 0x2000940]
00850 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00855 8bd5                           mov        edx, ebp
00857 8bc8                           mov        ecx, eax
00859 488bee                         mov        rbp, rsi
0085c c5f877                         vzeroupper 
0085f e8fc2fa9ff                     call       0x7fd1c3910860
00864 0f1f84005c090003               nop        dword ptr [rax + rax + 0x300095c]
0086c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00871 4183fa08                       cmp        r10d, 8
00875 0f8e63fbffff                   jle        0x7fd1c3e7d3de
0087b 49bae08c79e200000000           movabs     r10, 0xe2798ce0
00885 8b9424f0000000                 mov        edx, dword ptr [rsp + 0xf0]
0088c 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00894 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00899 83c208                         add        edx, 8
0089c 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
008a1 488bee                         mov        rbp, rsi
008a4 c5f877                         vzeroupper 
008a7 e8b42fa9ff                     call       0x7fd1c3910860
008ac 0f1f8400a4090004               nop        dword ptr [rax + rax + 0x40009a4]
008b4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008b9 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
008c1 488bf5                         mov        rsi, rbp
008c4 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
008cb 488bc8                         mov        rcx, rax
008ce 6690                           nop        
008d0 c5f877                         vzeroupper 
008d3 e8882fa9ff                     call       0x7fd1c3910860
008d8 0f1f8400d0090005               nop        dword ptr [rax + rax + 0x50009d0]
008e0 e9f9faffff                     jmp        0x7fd1c3e7d3de
008e5 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
008ea 8b9424a4000000                 mov        edx, dword ptr [rsp + 0xa4]
008f1 666690                         nop        
008f4 c5f877                         vzeroupper 
008f7 e8642fa9ff                     call       0x7fd1c3910860
008fc 0f1f8400f4090006               nop        dword ptr [rax + rax + 0x60009f4]
00904 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0090c 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00914 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00919 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00920 488bc8                         mov        rcx, rax
00923 90                             nop        
00924 c5f877                         vzeroupper 
00927 e8342fa9ff                     call       0x7fd1c3910860
0092c 0f1f8400240a0007               nop        dword ptr [rax + rax + 0x7000a24]
00934 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
0093c 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00944 0f8d94faffff                   jge        0x7fd1c3e7d3de
0094a 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00952 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00959 0f8e29050000                   jle        0x7fd1c3e7de88
0095f 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
00967 4183c008                       add        r8d, 8
0096b be66ffffff                     mov        esi, 0xffffff66
00970 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00975 448b1c24                       mov        r11d, dword ptr [rsp]
00979 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00981 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00986 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0098e 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00993 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0099b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
009a0 44895c2408                     mov        dword ptr [rsp + 8], r11d
009a5 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
009aa 448954240c                     mov        dword ptr [rsp + 0xc], r10d
009af 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
009b4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
009b9 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
009be 4489542418                     mov        dword ptr [rsp + 0x18], r10d
009c3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
009c8 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
009cd 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
009d5 4489442428                     mov        dword ptr [rsp + 0x28], r8d
009da 458bda                         mov        r11d, r10d
009dd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
009e2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
009e7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
009ec 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
009f1 4489542440                     mov        dword ptr [rsp + 0x40], r10d
009f6 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
009fe 458bda                         mov        r11d, r10d
00a01 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00a06 6690                           nop        
00a08 c5f877                         vzeroupper 
00a0b e8505dacff                     call       0x7fd1c3943760
00a10 0f1f8400080b0008               nop        dword ptr [rax + rax + 0x8000b08]
00a18 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00a1d 4183fb30                       cmp        r11d, 0x30
00a21 0f8f0f020000                   jg         0x7fd1c3e7dc36
00a27 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a2c 4183c2f9                       add        r10d, -7
00a30 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00a38 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00a40 453bda                         cmp        r11d, r10d
00a43 0f839b130000                   jae        0x7fd1c3e7ede4
00a49 458bd3                         mov        r10d, r11d
00a4c 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
00a54 4d63d2                         movsxd     r10, r10d
00a57 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
00a5f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00a64 4f8b44130c                     mov        r8, qword ptr [r11 + r10 + 0xc]
00a69 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a71 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
00a79 0f830d140000                   jae        0x7fd1c3e7ee8c
00a7f 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a87 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
00a8f 4d63d3                         movsxd     r10, r11d
00a92 4c899424b0000000               mov        qword ptr [rsp + 0xb0], r10
00a9a 498d4a0c                       lea        rcx, [r10 + 0xc]
00a9e 48be00b722e200000000           movabs     rsi, 0xe222b700
00aa8 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
00aad 4533c9                         xor        r9d, r9d
00ab0 c5f877                         vzeroupper 
00ab3 e8a823a9ff                     call       0x7fd1c390fe60
00ab8 0f1f8400b00b0009               nop        dword ptr [rax + rax + 0x9000bb0]
00ac0 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00ac8 4183c308                       add        r11d, 8
00acc 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00ad4 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00adc 0f8d3a010000                   jge        0x7fd1c3e7dc1c
00ae2 4c8b8c24f0000000               mov        r9, qword ptr [rsp + 0xf0]
00aea 4c2b8c24b0000000               sub        r9, qword ptr [rsp + 0xb0]
00af2 4d63d3                         movsxd     r10, r11d
00af5 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00afd 4983c3f9                       add        r11, -7
00b01 4f8d040a                       lea        r8, [r10 + r9]
00b05 4d3bc3                         cmp        r8, r11
00b08 0f835e150000                   jae        0x7fd1c3e7f06c
00b0e 4c638424a8000000               movsxd     r8, dword ptr [rsp + 0xa8]
00b16 4d2bc2                         sub        r8, r10
00b19 4983c007                       add        r8, 7
00b1d 4983e0f8                       and        r8, 0xfffffffffffffff8
00b21 458bd0                         mov        r10d, r8d
00b24 8b8c24ac000000                 mov        ecx, dword ptr [rsp + 0xac]
00b2b 458d440a08                     lea        r8d, [r10 + rcx + 8]
00b30 4d63d0                         movsxd     r10, r8d
00b33 4f8d440af8                     lea        r8, [r10 + r9 - 8]
00b38 4d3bc3                         cmp        r8, r11
00b3b 0f832b150000                   jae        0x7fd1c3e7f06c
00b41 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
00b49 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
00b51 0f8315150000                   jae        0x7fd1c3e7f06c
00b57 4983c2f8                       add        r10, -8
00b5b 4d3bd3                         cmp        r10, r11
00b5e 0f8308150000                   jae        0x7fd1c3e7f06c
00b64 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00b6c 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00b73 0f8fbf150000                   jg         0x7fd1c3e7f138
00b79 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00b81 442bd1                         sub        r10d, ecx
00b84 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00b8c 0f1f4000                       nop        dword ptr [rax]
00b90 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
00b98 4963ca                         movsxd     rcx, r10d
00b9b 4883c10c                       add        rcx, 0xc
00b9f 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
00ba6 03ac24b8000000                 add        ebp, dword ptr [rsp + 0xb8]
00bad 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00bb2 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
00bb7 48be00b722e200000000           movabs     rsi, 0xe222b700
00bc1 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
00bc6 4533c9                         xor        r9d, r9d
00bc9 666690                         nop        
00bcc c5f877                         vzeroupper 
00bcf e88c22a9ff                     call       0x7fd1c390fe60
00bd4 0f1f8400cc0c000a               nop        dword ptr [rax + rax + 0xa000ccc]
00bdc 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
00be4 4183c308                       add        r11d, 8
00be8 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00bf0 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
00bf8 7c96                           jl         0x7fd1c3e7db90
00bfa eb20                           jmp        0x7fd1c3e7dc1c
00bfc 4d63d3                         movsxd     r10, r11d
00bff 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c06 c442a8f5db                     bzhi       r11, r11, r10
00c0b c4c1fb92fb                     kmovq      k7, r11
00c10 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c16 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c1c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00c24 440354243c                     add        r10d, dword ptr [rsp + 0x3c]
00c29 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00c31 e9a8f7ffff                     jmp        0x7fd1c3e7d3de
00c36 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00c3e 4585db                         test       r11d, r11d
00c41 0f8cf9120000                   jl         0x7fd1c3e7ef40
00c47 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00c4f 4585d2                         test       r10d, r10d
00c52 0f8ce8120000                   jl         0x7fd1c3e7ef40
00c58 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c5d 44039c24a4000000               add        r11d, dword ptr [rsp + 0xa4]
00c65 448b8424fc000000               mov        r8d, dword ptr [rsp + 0xfc]
00c6d 453bc3                         cmp        r8d, r11d
00c70 0f82ca120000                   jb         0x7fd1c3e7ef40
00c76 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
00c7e 0f82bc120000                   jb         0x7fd1c3e7ef40
00c84 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c89 4585db                         test       r11d, r11d
00c8c 748e                           je         0x7fd1c3e7dc1c
00c8e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00c93 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00c9b 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
00ca0 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
00ca8 4b8d7c020c                     lea        rdi, [r10 + r8 + 0xc]
00cad 4883fd20                       cmp        rbp, 0x20
00cb1 0f8645ffffff                   jbe        0x7fd1c3e7dbfc
00cb7 488bd5                         mov        rdx, rbp
00cba c5f877                         vzeroupper 
00cbd 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00cc7 41ffd2                         call       r10
00cca 0f1f840000000000               nop        dword ptr [rax + rax]
00cd2 e945ffffff                     jmp        0x7fd1c3e7dc1c
00cd7 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
00cde 4c63d3                         movsxd     r10, ebx
00ce1 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ce8 c442a8f5db                     bzhi       r11, r11, r10
00ced c4c1fb92fb                     kmovq      k7, r11
00cf2 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00cf8 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cfe eb56                           jmp        0x7fd1c3e7dd56
00d00 85db                           test       ebx, ebx
00d02 0f8c64100000                   jl         0x7fd1c3e7ed6c
00d08 4585db                         test       r11d, r11d
00d0b 0f8c5b100000                   jl         0x7fd1c3e7ed6c
00d11 448b542404                     mov        r10d, dword ptr [rsp + 4]
00d16 453bd0                         cmp        r10d, r8d
00d19 0f824d100000                   jb         0x7fd1c3e7ed6c
00d1f 448b9424fc000000               mov        r10d, dword ptr [rsp + 0xfc]
00d27 453bd5                         cmp        r10d, r13d
00d2a 0f823c100000                   jb         0x7fd1c3e7ed6c
00d30 4585f6                         test       r14d, r14d
00d33 7421                           je         0x7fd1c3e7dd56
00d35 4983f920                       cmp        r9, 0x20
00d39 769c                           jbe        0x7fd1c3e7dcd7
00d3b 498bd1                         mov        rdx, r9
00d3e c5f877                         vzeroupper 
00d41 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00d4b 41ffd2                         call       r10
00d4e 0f1f840000000000               nop        dword ptr [rax + rax]
00d56 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00d5e e9e9f5ffff                     jmp        0x7fd1c3e7d34c
00d63 90                             nop        
00d64 418bd3                         mov        edx, r11d
00d67 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d6c 458b5c9308                     mov        r11d, dword ptr [r11 + rdx*4 + 8]
00d71 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00d76 45895c900c                     mov        dword ptr [r8 + rdx*4 + 0xc], r11d
00d7b 448d5aff                       lea        r11d, [rdx - 1]
00d7f 443bdf                         cmp        r11d, edi
00d82 7fe0                           jg         0x7fd1c3e7dd64
00d84 4183fb3f                       cmp        r11d, 0x3f
00d88 0f8ed6120000                   jle        0x7fd1c3e7f064
00d8e 448bd2                         mov        r10d, edx
00d91 41ffca                         dec        r10d
00d94 458bc2                         mov        r8d, r10d
00d97 eb0a                           jmp        0x7fd1c3e7dda3
00d99 0f1f8000000000                 nop        dword ptr [rax]
00da0 458bc2                         mov        r8d, r10d
00da3 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00da8 62917e486f8483ccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0x34]
00db3 62917e487f8483d0ffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0x30], zmm0
00dbe 62917e486f84838cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0x74]
00dc9 62917e487f848390ffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0x70], zmm0
00dd4 62917e486f84834cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0xb4]
00ddf 62917e487f848350ffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0xb0], zmm0
00dea 62917e486f84830cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 - 0xf4]
00df5 62917e487f848310ffffff         vmovdqu32  zmmword ptr [r11 + r8*4 - 0xf0], zmm0
00e00 458d50c0                       lea        r10d, [r8 - 0x40]
00e04 4183fa3f                       cmp        r10d, 0x3f
00e08 7f96                           jg         0x7fd1c3e7dda0
00e0a 4183fa0f                       cmp        r10d, 0xf
00e0e 7e2d                           jle        0x7fd1c3e7de3d
00e10 458bd0                         mov        r10d, r8d
00e13 4183c2c0                       add        r10d, -0x40
00e17 90                             nop        
00e18 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00e1d 62917e486f8493ccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x34]
00e28 62917e487f8493d0ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x30], zmm0
00e33 4183c2f0                       add        r10d, -0x10
00e37 4183fa0f                       cmp        r10d, 0xf
00e3b 7fdb                           jg         0x7fd1c3e7de18
00e3d 4585d2                         test       r10d, r10d
00e40 0f8eecf7ffff                   jle        0x7fd1c3e7d632
00e46 6690                           nop        
00e48 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00e4d 478b5c9308                     mov        r11d, dword ptr [r11 + r10*4 + 8]
00e52 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00e57 47895c900c                     mov        dword ptr [r8 + r10*4 + 0xc], r11d
00e5c 41ffca                         dec        r10d
00e5f 4585d2                         test       r10d, r10d
00e62 7fe4                           jg         0x7fd1c3e7de48
00e64 e9c9f7ffff                     jmp        0x7fd1c3e7d632
00e69 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
00e71 e9c5f7ffff                     jmp        0x7fd1c3e7d63b
00e76 66660f1f840000000000           nop        word ptr [rax + rax]
00e80 44899424ac000000               mov        dword ptr [rsp + 0xac], r10d
00e88 8bac24ac000000                 mov        ebp, dword ptr [rsp + 0xac]
00e8f 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
00e96 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00e9b 8bd5                           mov        edx, ebp
00e9d 4c8bd6                         mov        r10, rsi
00ea0 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
00ea8 c5f877                         vzeroupper 
00eab e8b029a9ff                     call       0x7fd1c3910860
00eb0 0f1f8400a80f000b               nop        dword ptr [rax + rax + 0xb000fa8]
00eb8 488bb424f0000000               mov        rsi, qword ptr [rsp + 0xf0]
00ec0 8b9424ac000000                 mov        edx, dword ptr [rsp + 0xac]
00ec7 488bc8                         mov        rcx, rax
00eca 6690                           nop        
00ecc c5f877                         vzeroupper 
00ecf e88c29a9ff                     call       0x7fd1c3910860
00ed4 0f1f8400cc0f000c               nop        dword ptr [rax + rax + 0xc000fcc]
00edc 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
00ee4 4183c208                       add        r10d, 8
00ee8 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00ef0 7c8e                           jl         0x7fd1c3e7de80
00ef2 e9e7f4ffff                     jmp        0x7fd1c3e7d3de
00ef7 4d63d3                         movsxd     r10, r11d
00efa 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f01 c442a8f5db                     bzhi       r11, r11, r10
00f06 c4c1fb92fb                     kmovq      k7, r11
00f0b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f11 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f17 eb71                           jmp        0x7fd1c3e7df8a
00f19 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00f21 4585d2                         test       r10d, r10d
00f24 0f843a050000                   je         0x7fd1c3e7e464
00f2a 85db                           test       ebx, ebx
00f2c 0f8ce2160000                   jl         0x7fd1c3e7f614
00f32 4585db                         test       r11d, r11d
00f35 0f8cd9160000                   jl         0x7fd1c3e7f614
00f3b 448b442404                     mov        r8d, dword ptr [rsp + 4]
00f40 443b442434                     cmp        r8d, dword ptr [rsp + 0x34]
00f45 0f82c9160000                   jb         0x7fd1c3e7f614
00f4b 448b9424fc000000               mov        r10d, dword ptr [rsp + 0xfc]
00f53 453bd5                         cmp        r10d, r13d
00f56 0f82b8160000                   jb         0x7fd1c3e7f614
00f5c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00f64 4585db                         test       r11d, r11d
00f67 7421                           je         0x7fd1c3e7df8a
00f69 4983f920                       cmp        r9, 0x20
00f6d 7688                           jbe        0x7fd1c3e7def7
00f6f 498bd1                         mov        rdx, r9
00f72 c5f877                         vzeroupper 
00f75 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00f7f 41ffd2                         call       r10
00f82 0f1f840000000000               nop        dword ptr [rax + rax]
00f8a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f8f 4585d2                         test       r10d, r10d
00f92 0f8eb7010000                   jle        0x7fd1c3e7e14f
00f98 458bc5                         mov        r8d, r13d
00f9b 442b8424a0000000               sub        r8d, dword ptr [rsp + 0xa0]
00fa3 458bd5                         mov        r10d, r13d
00fa6 440354243c                     add        r10d, dword ptr [rsp + 0x3c]
00fab 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00fb3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00fb8 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
00fbd 4b8d742b0c                     lea        rsi, [r11 + r13 + 0xc]
00fc2 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00fca 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00fcf 0f8dea000000                   jge        0x7fd1c3e7e0bf
00fd5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fda 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
00fe2 458bda                         mov        r11d, r10d
00fe5 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00fed 450f4fda                       cmovg      r11d, r10d
00ff1 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00ff9 4585c0                         test       r8d, r8d
00ffc 0f8c92160000                   jl         0x7fd1c3e7f694
01002 4585ed                         test       r13d, r13d
01005 0f8c89160000                   jl         0x7fd1c3e7f694
0100b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01013 4503d0                         add        r10d, r8d
01016 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
0101e 453bda                         cmp        r11d, r10d
01021 0f826d160000                   jb         0x7fd1c3e7f694
01027 458bdd                         mov        r11d, r13d
0102a 44039c24a0000000               add        r11d, dword ptr [rsp + 0xa0]
01032 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
0103a 448b9424fc000000               mov        r10d, dword ptr [rsp + 0xfc]
01042 453bd3                         cmp        r10d, r11d
01045 0f8249160000                   jb         0x7fd1c3e7f694
0104b 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01053 4585db                         test       r11d, r11d
01056 0f8c38160000                   jl         0x7fd1c3e7f694
0105c 4585db                         test       r11d, r11d
0105f 742c                           je         0x7fd1c3e7e08d
01061 4963d3                         movsxd     rdx, r11d
01064 4883fa20                       cmp        rdx, 0x20
01068 773b                           ja         0x7fd1c3e7e0a5
0106a 458bd3                         mov        r10d, r11d
0106d 4d63d2                         movsxd     r10, r10d
01070 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
01077 c442a8f5db                     bzhi       r11, r11, r10
0107c c4c1fb92fb                     kmovq      k7, r11
01081 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
01087 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0108d 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01095 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
0109a 0f8db7000000                   jge        0x7fd1c3e7e157
010a0 e9fa020000                     jmp        0x7fd1c3e7e39f
010a5 c5f877                         vzeroupper 
010a8 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
010b2 41ffd2                         call       r10
010b5 0f1f840000000000               nop        dword ptr [rax + rax]
010bd ebce                           jmp        0x7fd1c3e7e08d
010bf 4585c0                         test       r8d, r8d
010c2 0f8c90160000                   jl         0x7fd1c3e7f758
010c8 4585ed                         test       r13d, r13d
010cb 0f8c87160000                   jl         0x7fd1c3e7f758
010d1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
010d6 4503d8                         add        r11d, r8d
010d9 448b9424fc000000               mov        r10d, dword ptr [rsp + 0xfc]
010e1 453bd3                         cmp        r10d, r11d
010e4 0f826e160000                   jb         0x7fd1c3e7f758
010ea 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
010f2 453bd3                         cmp        r10d, r11d
010f5 0f825d160000                   jb         0x7fd1c3e7f758
010fb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01100 4585d2                         test       r10d, r10d
01103 7452                           je         0x7fd1c3e7e157
01105 4883fd20                       cmp        rbp, 0x20
01109 7727                           ja         0x7fd1c3e7e132
0110b 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01110 4d63d3                         movsxd     r10, r11d
01113 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0111a c442a8f5db                     bzhi       r11, r11, r10
0111f c4c1fb92fb                     kmovq      k7, r11
01124 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0112a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01130 eb25                           jmp        0x7fd1c3e7e157
01132 488bd5                         mov        rdx, rbp
01135 c5f877                         vzeroupper 
01138 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
01142 41ffd2                         call       r10
01145 0f1f840000000000               nop        dword ptr [rax + rax]
0114d eb08                           jmp        0x7fd1c3e7e157
0114f 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
01157 48894424f8                     mov        qword ptr [rsp - 8], rax
0115c 8b8424f0000000                 mov        eax, dword ptr [rsp + 0xf0]
01163 898424a8000000                 mov        dword ptr [rsp + 0xa8], eax
0116a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0116f e96af2ffff                     jmp        0x7fd1c3e7d3de
01174 4d63d2                         movsxd     r10, r10d
01177 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0117e c442a8f5db                     bzhi       r11, r11, r10
01183 c4c1fb92fb                     kmovq      k7, r11
01188 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0118e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01194 e9a2000000                     jmp        0x7fd1c3e7e23b
01199 448b1424                       mov        r10d, dword ptr [rsp]
0119d 442b542434                     sub        r10d, dword ptr [rsp + 0x34]
011a2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
011a7 4585db                         test       r11d, r11d
011aa 0f84ec130000                   je         0x7fd1c3e7f59c
011b0 498bcb                         mov        rcx, r11
011b3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
011b8 4585db                         test       r11d, r11d
011bb 0f8c0b140000                   jl         0x7fd1c3e7f5cc
011c1 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
011c6 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
011cb 8b742404                       mov        esi, dword ptr [rsp + 4]
011cf 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
011d7 4585c9                         test       r9d, r9d
011da 0f8cfe130000                   jl         0x7fd1c3e7f5de
011e0 3b3424                         cmp        esi, dword ptr [rsp]
011e3 0f82f5130000                   jb         0x7fd1c3e7f5de
011e9 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
011f0 4103da                         add        ebx, r10d
011f3 8b7908                         mov        edi, dword ptr [rcx + 8]
011f6 3bfb                           cmp        edi, ebx
011f8 0f82e0130000                   jb         0x7fd1c3e7f5de
011fe 4585d2                         test       r10d, r10d
01201 0f8cd7130000                   jl         0x7fd1c3e7f5de
01207 4585d2                         test       r10d, r10d
0120a 742f                           je         0x7fd1c3e7e23b
0120c 4a8d74090c                     lea        rsi, [rcx + r9 + 0xc]
01211 4b8d7c180c                     lea        rdi, [r8 + r11 + 0xc]
01216 4963d2                         movsxd     rdx, r10d
01219 4883fa20                       cmp        rdx, 0x20
0121d 0f8651ffffff                   jbe        0x7fd1c3e7e174
01223 c5f877                         vzeroupper 
01226 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
01230 41ffd2                         call       r10
01233 0f1f840000000000               nop        dword ptr [rax + rax]
0123b 895d3c                         mov        dword ptr [rbp + 0x3c], ebx
0123e c5f877                         vzeroupper 
01241 4881c4e0000000                 add        rsp, 0xe0
01248 5d                             pop        rbp
01249 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0124d 0f87ef150000                   ja         0x7fd1c3e7f842
01253 c3                             ret        
01254 ffc9                           dec        ecx
01256 85c9                           test       ecx, ecx
01258 7e27                           jle        0x7fd1c3e7e281
0125a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0125f 45895314                       mov        dword ptr [r11 + 0x14], r10d
01263 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
01267 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0126c 45895a10                       mov        dword ptr [r10 + 0x10], r11d
01270 41894a0c                       mov        dword ptr [r10 + 0xc], ecx
01274 44898424bc000000               mov        dword ptr [rsp + 0xbc], r8d
0127c e9baf3ffff                     jmp        0x7fd1c3e7d63b
01281 48be08387ce200000000           movabs     rsi, 0xe27c3808
0128b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01290 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01298 448b1c24                       mov        r11d, dword ptr [rsp]
0129c 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
012a4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
012a9 4c891424                       mov        qword ptr [rsp], r10
012ad 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
012b2 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
012ba 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
012bf 4489542410                     mov        dword ptr [rsp + 0x10], r10d
012c4 895c2418                       mov        dword ptr [rsp + 0x18], ebx
012c8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
012cd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
012d2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
012d7 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
012dc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
012e1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
012e6 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
012eb 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
012f0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
012f5 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
012fa 4489542448                     mov        dword ptr [rsp + 0x48], r10d
012ff 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01304 c5f877                         vzeroupper 
01307 e85425a9ff                     call       0x7fd1c3910860
0130c 0f1f84000414000d               nop        dword ptr [rax + rax + 0xd001404]
01314 4885c0                         test       rax, rax
01317 0f85c8f3ffff                   jne        0x7fd1c3e7d6e5
0131d bef6ffffff                     mov        esi, 0xfffffff6
01322 6690                           nop        
01324 c5f877                         vzeroupper 
01327 e83454acff                     call       0x7fd1c3943760
0132c 0f1f84002414000e               nop        dword ptr [rax + rax + 0xe001424]
01334 4d03c1                         add        r8, r9
01337 4d3bc6                         cmp        r8, r14
0133a 7e07                           jle        0x7fd1c3e7e343
0133c 33c0                           xor        eax, eax
0133e e962edffff                     jmp        0x7fd1c3e7d0a5
01343 33c0                           xor        eax, eax
01345 bb01000000                     mov        ebx, 1
0134a e958edffff                     jmp        0x7fd1c3e7d0a7
0134f 448bd5                         mov        r10d, ebp
01352 4d63d2                         movsxd     r10, r10d
01355 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0135c c442a8f5db                     bzhi       r11, r11, r10
01361 c4c1fb92fb                     kmovq      k7, r11
01366 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0136c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
01372 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0137a 4403dd                         add        r11d, ebp
0137d 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
01385 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01389 418502                         test       dword ptr [r10], eax
0138c 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
01391 0f8dc0fdffff                   jge        0x7fd1c3e7e157
01397 4489b424a4000000               mov        dword ptr [rsp + 0xa4], r14d
0139f 448b8c24a4000000               mov        r9d, dword ptr [rsp + 0xa4]
013a7 442b8c24a0000000               sub        r9d, dword ptr [rsp + 0xa0]
013af 8b6c243c                       mov        ebp, dword ptr [rsp + 0x3c]
013b3 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
013ba 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
013c1 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
013c9 410f4fea                       cmovg      ebp, r10d
013cd 4585c9                         test       r9d, r9d
013d0 0f8c2e0e0000                   jl         0x7fd1c3e7f204
013d6 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
013de 4585db                         test       r11d, r11d
013e1 0f8c1d0e0000                   jl         0x7fd1c3e7f204
013e7 458d1429                       lea        r10d, [r9 + rbp]
013eb 448b9c24fc000000               mov        r11d, dword ptr [rsp + 0xfc]
013f3 453bda                         cmp        r11d, r10d
013f6 0f82080e0000                   jb         0x7fd1c3e7f204
013fc 448bb424a4000000               mov        r14d, dword ptr [rsp + 0xa4]
01404 4403f5                         add        r14d, ebp
01407 453bde                         cmp        r11d, r14d
0140a 0f82f40d0000                   jb         0x7fd1c3e7f204
01410 85ed                           test       ebp, ebp
01412 0f8cec0d0000                   jl         0x7fd1c3e7f204
01418 85ed                           test       ebp, ebp
0141a 0f8452ffffff                   je         0x7fd1c3e7e372
01420 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01425 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
0142a 458bda                         mov        r11d, r10d
0142d 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01435 4b8d74130c                     lea        rsi, [r11 + r10 + 0xc]
0143a 4863d5                         movsxd     rdx, ebp
0143d 4883fa20                       cmp        rdx, 0x20
01441 0f8608ffffff                   jbe        0x7fd1c3e7e34f
01447 c5f877                         vzeroupper 
0144a 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
01454 41ffd2                         call       r10
01457 0f1f840000000000               nop        dword ptr [rax + rax]
0145f e90effffff                     jmp        0x7fd1c3e7e372
01464 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
0146c e919fbffff                     jmp        0x7fd1c3e7df8a
01471 bee4ffffff                     mov        esi, 0xffffffe4
01476 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0147b 448b1424                       mov        r10d, dword ptr [rsp]
0147f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01487 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0148c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01494 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01499 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
014a1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
014a6 4489542408                     mov        dword ptr [rsp + 8], r10d
014ab 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
014b0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014b5 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
014ba 4c89542418                     mov        qword ptr [rsp + 0x18], r10
014bf 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
014c4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
014c9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
014ce 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
014d3 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
014d8 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
014dd 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014e2 4489542434                     mov        dword ptr [rsp + 0x34], r10d
014e7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
014ec 4c89542440                     mov        qword ptr [rsp + 0x40], r10
014f1 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
014f6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
014fb 90                             nop        
014fc c5f877                         vzeroupper 
014ff e85c52acff                     call       0x7fd1c3943760
01504 0f1f8400fc150010               nop        dword ptr [rax + rax + 0x100015fc]
0150c bee4ffffff                     mov        esi, 0xffffffe4
01511 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01516 448b1c24                       mov        r11d, dword ptr [rsp]
0151a 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01522 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01527 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0152f 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01534 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0153c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01541 44895c2408                     mov        dword ptr [rsp + 8], r11d
01546 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0154b 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01550 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01555 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0155a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0155f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01564 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01569 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0156e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01573 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01578 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0157d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01582 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
01588 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0158d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01592 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01597 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0159c c5f877                         vzeroupper 
0159f e8bc51acff                     call       0x7fd1c3943760
015a4 0f1f84009c160011               nop        dword ptr [rax + rax + 0x1100169c]
015ac bee4ffffff                     mov        esi, 0xffffffe4
015b1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
015b6 448b1424                       mov        r10d, dword ptr [rsp]
015ba 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
015c2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015c7 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
015cf 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
015d4 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
015dc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
015e1 4489542408                     mov        dword ptr [rsp + 8], r10d
015e6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
015eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015f0 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
015f5 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015fa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015ff 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01604 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01609 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0160e 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01612 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
01617 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0161c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01621 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01626 6690                           nop        
01628 c5f877                         vzeroupper 
0162b e83051acff                     call       0x7fd1c3943760
01630 0f1f840028170012               nop        dword ptr [rax + rax + 0x12001728]
01638 bee4ffffff                     mov        esi, 0xffffffe4
0163d 498bea                         mov        rbp, r10
01640 448b1424                       mov        r10d, dword ptr [rsp]
01644 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0164c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01651 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01659 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0165e 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
01666 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0166b 4489542408                     mov        dword ptr [rsp + 8], r10d
01670 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01674 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01679 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0167e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01683 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01688 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0168d 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01692 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01697 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0169c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016a1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
016a6 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
016ac 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
016b1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
016b6 6690                           nop        
016b8 c5f877                         vzeroupper 
016bb e8a050acff                     call       0x7fd1c3943760
016c0 0f1f8400b8170013               nop        dword ptr [rax + rax + 0x130017b8]
016c8 be45ffffff                     mov        esi, 0xffffff45
016cd 4c898424f0000000               mov        qword ptr [rsp + 0xf0], r8
016d5 666690                         nop        
016d8 c5f877                         vzeroupper 
016db e88050acff                     call       0x7fd1c3943760
016e0 0f1f8400d8170014               nop        dword ptr [rax + rax + 0x140017d8]
016e8 be45ffffff                     mov        esi, 0xffffff45
016ed 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016f2 448b1c24                       mov        r11d, dword ptr [rsp]
016f6 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
016fe 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01703 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0170b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01710 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01718 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0171d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01722 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01726 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0172b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01730 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01735 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0173a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0173f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01744 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01749 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0174e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01753 89542430                       mov        dword ptr [rsp + 0x30], edx
01757 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0175c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01761 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01766 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0176b 90                             nop        
0176c c5f877                         vzeroupper 
0176f e8ec4facff                     call       0x7fd1c3943760
01774 0f1f84006c180015               nop        dword ptr [rax + rax + 0x1500186c]
0177c 4d3bd0                         cmp        r10, r8
0177f bdffffffff                     mov        ebp, 0xffffffff
01784 7c08                           jl         0x7fd1c3e7e78e
01786 400f95c5                       setne      bpl
0178a 400fb6ed                       movzx      ebp, bpl
0178e be45ffffff                     mov        esi, 0xffffff45
01793 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01798 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
017a0 448b1c24                       mov        r11d, dword ptr [rsp]
017a4 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
017ac 4c8b542408                     mov        r10, qword ptr [rsp + 8]
017b1 4c891424                       mov        qword ptr [rsp], r10
017b5 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
017ba 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
017c2 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
017c7 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
017cc 895c2418                       mov        dword ptr [rsp + 0x18], ebx
017d0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
017d5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
017da 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
017df 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
017e4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017e9 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017ee 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017f3 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
017f8 4c89442440                     mov        qword ptr [rsp + 0x40], r8
017fd 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01802 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01807 90                             nop        
01808 c5f877                         vzeroupper 
0180b e8504facff                     call       0x7fd1c3943760
01810 0f1f840008190016               nop        dword ptr [rax + rax + 0x16001908]
01818 be45ffffff                     mov        esi, 0xffffff45
0181d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01822 448b0424                       mov        r8d, dword ptr [rsp]
01826 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
0182e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01833 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0183b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01840 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01848 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0184d 4489442408                     mov        dword ptr [rsp + 8], r8d
01852 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01856 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0185b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01860 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01865 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0186a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0186f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01874 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01879 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0187e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01883 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01888 c5f877                         vzeroupper 
0188b e8d04eacff                     call       0x7fd1c3943760
01890 0f1f840088190017               nop        dword ptr [rax + rax + 0x17001988]
01898 be45ffffff                     mov        esi, 0xffffff45
0189d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
018a2 448b1c24                       mov        r11d, dword ptr [rsp]
018a6 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
018ae 4c8b542408                     mov        r10, qword ptr [rsp + 8]
018b3 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
018bb 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
018c0 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
018c8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018cd 44895c2408                     mov        dword ptr [rsp + 8], r11d
018d2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
018d7 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
018dc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
018e1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018e6 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
018eb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018f0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
018f5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
018fa 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018ff 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01904 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01909 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0190e 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01913 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01918 c5f877                         vzeroupper 
0191b e8404eacff                     call       0x7fd1c3943760
01920 0f1f8400181a0018               nop        dword ptr [rax + rax + 0x18001a18]
01928 85ff                           test       edi, edi
0192a 0f84c80e0000                   je         0x7fd1c3e7f7f8
01930 488bcf                         mov        rcx, rdi
01933 8b1c24                         mov        ebx, dword ptr [rsp]
01936 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0193e 4533db                         xor        r11d, r11d
01941 448bd3                         mov        r10d, ebx
01944 e986f8ffff                     jmp        0x7fd1c3e7e1cf
01949 bee4ffffff                     mov        esi, 0xffffffe4
0194e 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01953 448b1424                       mov        r10d, dword ptr [rsp]
01957 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0195f 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01964 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0196c 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01971 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01979 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0197e 4489442408                     mov        dword ptr [rsp + 8], r8d
01983 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01988 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0198d 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01992 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01997 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0199c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
019a1 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
019a6 4489442428                     mov        dword ptr [rsp + 0x28], r8d
019ab 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
019b0 895c2438                       mov        dword ptr [rsp + 0x38], ebx
019b4 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
019b8 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
019bd 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019c2 6690                           nop        
019c4 c5f877                         vzeroupper 
019c7 e8944dacff                     call       0x7fd1c3943760
019cc 0f1f8400c41a0019               nop        dword ptr [rax + rax + 0x19001ac4]
019d4 bee4ffffff                     mov        esi, 0xffffffe4
019d9 498be8                         mov        rbp, r8
019dc 448b0424                       mov        r8d, dword ptr [rsp]
019e0 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
019e8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019ed 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
019f5 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
019fa 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
01a02 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a07 4c891424                       mov        qword ptr [rsp], r10
01a0b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a10 4489542408                     mov        dword ptr [rsp + 8], r10d
01a15 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01a1a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a1f 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01a24 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01a29 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01a2e 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01a33 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01a38 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a3d 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
01a42 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01a46 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01a4b 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01a50 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a55 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01a5a 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01a5f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01a64 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a69 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01a6e c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
01a74 c5f877                         vzeroupper 
01a77 e8e44cacff                     call       0x7fd1c3943760
01a7c 0f1f8400741b001a               nop        dword ptr [rax + rax + 0x1a001b74]
01a84 8beb                           mov        ebp, ebx
01a86 83c510                         add        ebp, 0x10
01a89 be6effffff                     mov        esi, 0xffffff6e
01a8e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a93 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01a9b 448b1424                       mov        r10d, dword ptr [rsp]
01a9f 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01aa7 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01aac 4c891424                       mov        qword ptr [rsp], r10
01ab0 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01ab5 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
01abd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ac2 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01ac7 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01acb 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01ad0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ad5 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ada 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01adf 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ae4 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ae9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01aee 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01af3 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01af8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01afd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b02 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b07 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b0c 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01b11 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01b16 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b1b 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01b20 897c246c                       mov        dword ptr [rsp + 0x6c], edi
01b24 c5f877                         vzeroupper 
01b27 e8344cacff                     call       0x7fd1c3943760
01b2c 0f1f8400241c001b               nop        dword ptr [rax + rax + 0x1b001c24]
01b34 8beb                           mov        ebp, ebx
01b36 83c510                         add        ebp, 0x10
01b39 be66ffffff                     mov        esi, 0xffffff66
01b3e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b43 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01b4b 448b1c24                       mov        r11d, dword ptr [rsp]
01b4f 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01b57 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b5c 4c891424                       mov        qword ptr [rsp], r10
01b60 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01b65 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
01b6d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b72 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01b77 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01b7b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01b80 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b85 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b8a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b8f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b94 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b99 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b9e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ba3 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01ba8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01bad 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01bb2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01bb7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01bbc 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01bc1 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01bc6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01bcb 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01bd0 897c246c                       mov        dword ptr [rsp + 0x6c], edi
01bd4 c5f877                         vzeroupper 
01bd7 e8844bacff                     call       0x7fd1c3943760
01bdc 0f1f8400d41c001c               nop        dword ptr [rax + rax + 0x1c001cd4]
01be4 be17000000                     mov        esi, 0x17
01be9 666690                         nop        
01bec c5f877                         vzeroupper 
01bef e86c4bacff                     call       0x7fd1c3943760
01bf4 0f1f8400ec1c001d               nop        dword ptr [rax + rax + 0x1d001cec]
01bfc 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
01c01 eb05                           jmp        0x7fd1c3e7ec08
01c03 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
01c08 be6effffff                     mov        esi, 0xffffff6e
01c0d 4c898424f0000000               mov        qword ptr [rsp + 0xf0], r8
01c15 4c896c2408                     mov        qword ptr [rsp + 8], r13
01c1a 897c2410                       mov        dword ptr [rsp + 0x10], edi
01c1e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01c23 89542420                       mov        dword ptr [rsp + 0x20], edx
01c27 894c2424                       mov        dword ptr [rsp + 0x24], ecx
01c2b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01c30 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01c34 4889442440                     mov        qword ptr [rsp + 0x40], rax
01c39 4c89742448                     mov        qword ptr [rsp + 0x48], r14
01c3e 6690                           nop        
01c40 c5f877                         vzeroupper 
01c43 e8184bacff                     call       0x7fd1c3943760
01c48 0f1f8400401d001e               nop        dword ptr [rax + rax + 0x1e001d40]
01c50 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01c55 bebeffffff                     mov        esi, 0xffffffbe
01c5a 498be8                         mov        rbp, r8
01c5d 448b0424                       mov        r8d, dword ptr [rsp]
01c61 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
01c69 4c89ac24f8000000               mov        qword ptr [rsp + 0xf8], r13
01c71 4c891c24                       mov        qword ptr [rsp], r11
01c75 897c2408                       mov        dword ptr [rsp + 8], edi
01c79 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c7e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c83 89542418                       mov        dword ptr [rsp + 0x18], edx
01c87 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01c8b 895c2438                       mov        dword ptr [rsp + 0x38], ebx
01c8f 90                             nop        
01c90 c5f877                         vzeroupper 
01c93 e8c84aacff                     call       0x7fd1c3943760
01c98 0f1f8400901d001f               nop        dword ptr [rax + rax + 0x1f001d90]
01ca0 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01ca5 ebae                           jmp        0x7fd1c3e7ec55
01ca7 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01cac eba7                           jmp        0x7fd1c3e7ec55
01cae 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01cb3 eba0                           jmp        0x7fd1c3e7ec55
01cb5 bee4ffffff                     mov        esi, 0xffffffe4
01cba 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01cbf 448b1424                       mov        r10d, dword ptr [rsp]
01cc3 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01ccb 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01cd0 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01cd8 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01cdd 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01ce5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01cea 4c891424                       mov        qword ptr [rsp], r10
01cee 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01cf3 4489542408                     mov        dword ptr [rsp + 8], r10d
01cf8 895c2410                       mov        dword ptr [rsp + 0x10], ebx
01cfc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01d01 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d06 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01d0b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d10 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d15 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d1a 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01d1f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d24 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01d29 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01d2d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d32 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d37 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01d3c 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01d41 666690                         nop        
01d44 c5f877                         vzeroupper 
01d47 e8144aacff                     call       0x7fd1c3943760
01d4c 0f1f8400441e0020               nop        dword ptr [rax + rax + 0x20001e44]
01d54 bef6ffffff                     mov        esi, 0xfffffff6
01d59 666690                         nop        
01d5c c5f877                         vzeroupper 
01d5f e8fc49acff                     call       0x7fd1c3943760
01d64 0f1f84005c1e0021               nop        dword ptr [rax + rax + 0x21001e5c]
01d6c beccffffff                     mov        esi, 0xffffffcc
01d71 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01d76 448b1424                       mov        r10d, dword ptr [rsp]
01d7a 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01d82 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01d87 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01d8f 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01d94 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
01d9c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01da1 4489542408                     mov        dword ptr [rsp + 8], r10d
01da6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01dab 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01db0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01db5 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01dba 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01dbf 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01dc4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01dc9 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01dce 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01dd2 6690                           nop        
01dd4 c5f877                         vzeroupper 
01dd7 e88449acff                     call       0x7fd1c3943760
01ddc 0f1f8400d41e0022               nop        dword ptr [rax + rax + 0x22001ed4]
01de4 bee4ffffff                     mov        esi, 0xffffffe4
01de9 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01dee 448b1c24                       mov        r11d, dword ptr [rsp]
01df2 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01dfa 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01dff 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01e07 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01e0c 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01e14 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e19 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e1e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01e23 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e28 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01e2d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e32 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01e37 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e3c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e41 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e46 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e4b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01e50 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01e58 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e5d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e62 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01e67 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01e6c 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01e71 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e76 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01e7b 90                             nop        
01e7c c5f877                         vzeroupper 
01e7f e8dc48acff                     call       0x7fd1c3943760
01e84 0f1f84007c1f0023               nop        dword ptr [rax + rax + 0x23001f7c]
01e8c bee4ffffff                     mov        esi, 0xffffffe4
01e91 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e96 448b1c24                       mov        r11d, dword ptr [rsp]
01e9a 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01ea2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ea7 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01eaf 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01eb4 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01ebc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ec1 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ec6 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ecb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ed0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01ed5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eda 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01edf 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ee4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ee9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01eee 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ef3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ef8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01efd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f02 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01f07 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01f0c 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01f11 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01f16 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f1b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01f20 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01f25 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01f2a 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01f2f 90                             nop        
01f30 c5f877                         vzeroupper 
01f33 e82848acff                     call       0x7fd1c3943760
01f38 0f1f840030200024               nop        dword ptr [rax + rax + 0x24002030]
01f40 beccffffff                     mov        esi, 0xffffffcc
01f45 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01f4a 448b1424                       mov        r10d, dword ptr [rsp]
01f4e 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01f56 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f5b 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01f63 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01f68 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01f70 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01f75 4489542408                     mov        dword ptr [rsp + 8], r10d
01f7a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01f7f 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f84 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01f89 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f8e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01f93 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f98 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f9d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fa2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01fa7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fac 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01fb1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01fb6 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01fbb 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01fc0 c5f877                         vzeroupper 
01fc3 e89847acff                     call       0x7fd1c3943760
01fc8 0f1f8400c0200025               nop        dword ptr [rax + rax + 0x250020c0]
01fd0 be6effffff                     mov        esi, 0xffffff6e
01fd5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01fda 448b1424                       mov        r10d, dword ptr [rsp]
01fde 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01fe6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01feb 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01ff3 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01ff8 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02000 4c891c24                       mov        qword ptr [rsp], r11
02004 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02009 4489542408                     mov        dword ptr [rsp + 8], r10d
0200e 895c2410                       mov        dword ptr [rsp + 0x10], ebx
02012 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02017 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0201c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02021 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02026 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0202b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02030 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02035 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0203a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0203f 894c2438                       mov        dword ptr [rsp + 0x38], ecx
02043 89542440                       mov        dword ptr [rsp + 0x40], edx
02047 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0204c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02051 666690                         nop        
02054 c5f877                         vzeroupper 
02057 e80447acff                     call       0x7fd1c3943760
0205c 0f1f840054210026               nop        dword ptr [rax + rax + 0x26002154]
02064 458bd3                         mov        r10d, r11d
02067 e9d1edffff                     jmp        0x7fd1c3e7de3d
0206c 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
02074 458d5308                       lea        r10d, [r11 + 8]
02078 458bca                         mov        r9d, r10d
0207b be6effffff                     mov        esi, 0xffffff6e
02080 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02085 448b1c24                       mov        r11d, dword ptr [rsp]
02089 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02091 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02096 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0209e 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
020a3 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
020ab 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
020b0 44895c2408                     mov        dword ptr [rsp + 8], r11d
020b5 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
020ba 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020bf 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
020c4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020c9 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
020ce 4489542418                     mov        dword ptr [rsp + 0x18], r10d
020d3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020d8 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
020dd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
020e2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
020e7 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
020ef 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
020f4 458bda                         mov        r11d, r10d
020f7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
020fc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02101 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02106 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0210b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02110 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
02115 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0211a 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
02122 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02127 90                             nop        
02128 c5f877                         vzeroupper 
0212b e83046acff                     call       0x7fd1c3943760
02130 0f1f840028220027               nop        dword ptr [rax + rax + 0x27002228]
02138 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
02140 458d5308                       lea        r10d, [r11 + 8]
02144 458bc2                         mov        r8d, r10d
02147 be66ffffff                     mov        esi, 0xffffff66
0214c 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02151 448b1c24                       mov        r11d, dword ptr [rsp]
02155 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0215d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02162 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0216a 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0216f 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02177 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0217c 44895c2408                     mov        dword ptr [rsp + 8], r11d
02181 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
02186 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0218b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02190 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02195 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0219a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0219f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
021a4 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
021a9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
021ae 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
021b3 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
021bb 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
021c0 458bda                         mov        r11d, r10d
021c3 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
021c8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
021cd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021d2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
021d7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021dc 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
021e1 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
021e6 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
021ee 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
021f3 90                             nop        
021f4 c5f877                         vzeroupper 
021f7 e86445acff                     call       0x7fd1c3943760
021fc 0f1f8400f4220028               nop        dword ptr [rax + rax + 0x280022f4]
02204 beccffffff                     mov        esi, 0xffffffcc
02209 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0220e 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02216 448b1c24                       mov        r11d, dword ptr [rsp]
0221a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02222 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02227 4c891424                       mov        qword ptr [rsp], r10
0222b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02230 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02238 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0223d 4c89542408                     mov        qword ptr [rsp + 8], r10
02242 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02247 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0224c 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02250 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02255 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0225a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0225f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02264 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02269 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0226e 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
02273 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02278 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0227d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02282 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02287 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
0228c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02291 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02296 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0229b 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
022a0 c5f877                         vzeroupper 
022a3 e8b844acff                     call       0x7fd1c3943760
022a8 0f1f8400a0230029               nop        dword ptr [rax + rax + 0x290023a0]
022b0 bee4ffffff                     mov        esi, 0xffffffe4
022b5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
022ba 448b1424                       mov        r10d, dword ptr [rsp]
022be 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
022c6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
022cb 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
022d3 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
022d8 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
022e0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
022e5 4489542408                     mov        dword ptr [rsp + 8], r10d
022ea 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
022ef 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
022f4 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
022f9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
022fe 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02303 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02308 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0230d 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02312 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0231a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0231f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02324 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02329 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0232e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02333 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
02338 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0233d 666690                         nop        
02340 c5f877                         vzeroupper 
02343 e81844acff                     call       0x7fd1c3943760
02348 0f1f84004024002a               nop        dword ptr [rax + rax + 0x2a002440]
02350 bee4ffffff                     mov        esi, 0xffffffe4
02355 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0235a 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02362 448b1424                       mov        r10d, dword ptr [rsp]
02366 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0236e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02373 4c891424                       mov        qword ptr [rsp], r10
02377 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0237c 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02384 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02389 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0238e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
02393 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02398 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0239d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023a2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
023a7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
023ac 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
023b1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
023b6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
023bb 4c89542448                     mov        qword ptr [rsp + 0x48], r10
023c0 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
023c5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
023ca 6690                           nop        
023cc c5f877                         vzeroupper 
023cf e88c43acff                     call       0x7fd1c3943760
023d4 0f1f8400cc24002b               nop        dword ptr [rax + rax + 0x2b0024cc]
023dc 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
023e3 ffc5                           inc        ebp
023e5 bee4ffffff                     mov        esi, 0xffffffe4
023ea 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023ef 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
023f7 448b1c24                       mov        r11d, dword ptr [rsp]
023fb 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02403 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02408 4c891424                       mov        qword ptr [rsp], r10
0240c 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02411 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02419 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0241e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02423 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
02428 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0242d 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02432 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02437 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0243c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02441 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02446 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0244b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02450 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02455 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0245a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0245f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02464 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02469 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0246e 6690                           nop        
02470 c5f877                         vzeroupper 
02473 e8e842acff                     call       0x7fd1c3943760
02478 0f1f84007025002c               nop        dword ptr [rax + rax + 0x2c002570]
02480 bee4ffffff                     mov        esi, 0xffffffe4
02485 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0248a 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02492 448b1424                       mov        r10d, dword ptr [rsp]
02496 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0249e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
024a3 4c891424                       mov        qword ptr [rsp], r10
024a7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
024ac 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
024b4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
024b9 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
024be 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
024c3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
024c8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
024cd 4489542420                     mov        dword ptr [rsp + 0x20], r10d
024d2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024d7 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
024dc 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
024e0 894c2440                       mov        dword ptr [rsp + 0x40], ecx
024e4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
024e9 4c89542448                     mov        qword ptr [rsp + 0x48], r10
024ee 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
024f3 4489542444                     mov        dword ptr [rsp + 0x44], r10d
024f8 4489442454                     mov        dword ptr [rsp + 0x54], r8d
024fd 666690                         nop        
02500 c5f877                         vzeroupper 
02503 e85842acff                     call       0x7fd1c3943760
02508 0f1f84000026002d               nop        dword ptr [rax + rax + 0x2d002600]
02510 bee4ffffff                     mov        esi, 0xffffffe4
02515 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0251a 448b1424                       mov        r10d, dword ptr [rsp]
0251e 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02526 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0252b 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02533 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
02538 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02540 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
02545 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0254a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0254f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02554 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02559 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0255e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02563 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02568 894c2424                       mov        dword ptr [rsp + 0x24], ecx
0256c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02571 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02576 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0257b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02580 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02585 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0258a 6690                           nop        
0258c c5f877                         vzeroupper 
0258f e8cc41acff                     call       0x7fd1c3943760
02594 0f1f84008c26002e               nop        dword ptr [rax + rax + 0x2e00268c]
0259c 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
025a1 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
025a5 bef6ffffff                     mov        esi, 0xfffffff6
025aa 498be8                         mov        rbp, r8
025ad 898c24f0000000                 mov        dword ptr [rsp + 0xf0], ecx
025b4 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
025bc c5f877                         vzeroupper 
025bf e89c41acff                     call       0x7fd1c3943760
025c4 0f1f8400bc26002f               nop        dword ptr [rax + rax + 0x2f0026bc]
025cc 488b6c2460                     mov        rbp, qword ptr [rsp + 0x60]
025d1 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
025d6 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
025de beccffffff                     mov        esi, 0xffffffcc
025e3 4c898424f8000000               mov        qword ptr [rsp + 0xf8], r8
025eb 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
025f3 44890c24                       mov        dword ptr [rsp], r9d
025f7 48894c2408                     mov        qword ptr [rsp + 8], rcx
025fc 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02601 666690                         nop        
02604 c5f877                         vzeroupper 
02607 e85441acff                     call       0x7fd1c3943760
0260c 0f1f840004270030               nop        dword ptr [rax + rax + 0x30002704]
02614 beccffffff                     mov        esi, 0xffffffcc
02619 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0261e 448b1424                       mov        r10d, dword ptr [rsp]
02622 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0262a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0262f 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02637 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0263c 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
02644 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02649 4c891424                       mov        qword ptr [rsp], r10
0264d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02652 4489542408                     mov        dword ptr [rsp + 8], r10d
02657 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0265c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02661 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02666 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0266b 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02670 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
02675 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0267a 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0267f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02683 90                             nop        
02684 c5f877                         vzeroupper 
02687 e8d440acff                     call       0x7fd1c3943760
0268c 0f1f840084270031               nop        dword ptr [rax + rax + 0x31002784]
02694 beccffffff                     mov        esi, 0xffffffcc
02699 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0269e 448b1424                       mov        r10d, dword ptr [rsp]
026a2 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
026aa 4c8b542408                     mov        r10, qword ptr [rsp + 8]
026af 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
026b7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
026bc 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
026c4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
026c9 44895c2408                     mov        dword ptr [rsp + 8], r11d
026ce 895c240c                       mov        dword ptr [rsp + 0xc], ebx
026d2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
026d7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
026dc 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
026e1 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
026e6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
026eb 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
026f0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
026f5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
026fa 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
026ff 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02704 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02709 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0270e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02713 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
02718 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0271d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02722 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02727 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0272c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02731 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02739 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0273e 458bda                         mov        r11d, r10d
02741 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
02746 6690                           nop        
02748 c5f877                         vzeroupper 
0274b e81040acff                     call       0x7fd1c3943760
02750 0f1f840048280032               nop        dword ptr [rax + rax + 0x32002848]
02758 beccffffff                     mov        esi, 0xffffffcc
0275d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02762 448b1424                       mov        r10d, dword ptr [rsp]
02766 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0276e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02773 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0277b 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
02780 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02788 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0278d 4489542408                     mov        dword ptr [rsp + 8], r10d
02792 895c240c                       mov        dword ptr [rsp + 0xc], ebx
02796 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0279b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
027a0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
027a5 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
027aa 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
027af 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
027b4 44896c2438                     mov        dword ptr [rsp + 0x38], r13d
027b9 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
027be 4c89542440                     mov        qword ptr [rsp + 0x40], r10
027c3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
027c8 4c89542448                     mov        qword ptr [rsp + 0x48], r10
027cd 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
027d2 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
027d7 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
027dc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
027e1 4489442468                     mov        dword ptr [rsp + 0x68], r8d
027e6 6690                           nop        
027e8 c5f877                         vzeroupper 
027eb e8703facff                     call       0x7fd1c3943760
027f0 0f1f8400e8280033               nop        dword ptr [rax + rax + 0x330028e8]
027f8 448b1c24                       mov        r11d, dword ptr [rsp]
027fc 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
02804 33c9                           xor        ecx, ecx
02806 458bd3                         mov        r10d, r11d
02809 e997fdffff                     jmp        0x7fd1c3e7f5a5
0280e bef6ffffff                     mov        esi, 0xfffffff6
02813 90                             nop        
02814 c5f877                         vzeroupper 
02817 e8443facff                     call       0x7fd1c3943760
0281c 0f1f840014290034               nop        dword ptr [rax + rax + 0x34002914]
02824 eb14                           jmp        0x7fd1c3e7f83a
02826 eb12                           jmp        0x7fd1c3e7f83a
02828 eb10                           jmp        0x7fd1c3e7f83a
0282a eb0e                           jmp        0x7fd1c3e7f83a
0282c eb0c                           jmp        0x7fd1c3e7f83a
0282e eb0a                           jmp        0x7fd1c3e7f83a
02830 eb08                           jmp        0x7fd1c3e7f83a
02832 eb06                           jmp        0x7fd1c3e7f83a
02834 eb04                           jmp        0x7fd1c3e7f83a
02836 eb02                           jmp        0x7fd1c3e7f83a
02838 eb00                           jmp        0x7fd1c3e7f83a
0283a 488bf0                         mov        rsi, rax
0283d e9a6deffff                     jmp        0x7fd1c3e7d6e8
02842 49ba49e2e7c3d17f0000           movabs     r10, 0x7fd1c3e7e249
0284c 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02853 e98836a9ff                     jmp        0x7fd1c3912ee0
02858 e84302a8ff                     call       0x7fd1c38ffaa0
0285d e9dcd7ffff                     jmp        0x7fd1c3e7d03e
02862 f4                             hlt        
02863 f4                             hlt        
02864 f4                             hlt        
02865 f4                             hlt        
02866 f4                             hlt        
02867 f4                             hlt        
