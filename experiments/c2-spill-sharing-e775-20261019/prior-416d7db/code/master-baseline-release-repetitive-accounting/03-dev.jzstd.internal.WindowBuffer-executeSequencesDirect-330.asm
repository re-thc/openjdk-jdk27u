00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c017aaff                   jne        0x7f46778fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85841a0000                   jne        0x7f4677e5ac42
0003e 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00042 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
00047 498be8                         mov        rbp, r8
0004a 448bcf                         mov        r9d, edi
0004d 488bde                         mov        rbx, rsi
00050 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00053 448b5604                       mov        r10d, dword ptr [rsi + 4]
00057 458bc2                         mov        r8d, r10d
0005a 442bc0                         sub        r8d, eax
0005d 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00064 413bc8                         cmp        ecx, r8d
00067 0f8fe5110000                   jg         0x7f4677e5a3d2
0006d 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00071 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00076 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
0007a 4c639c24c0000000               movsxd     r11, dword ptr [rsp + 0xc0]
00082 4c63c0                         movsxd     r8, eax
00085 4c03442440                     add        r8, qword ptr [rsp + 0x40]
0008a 492bf8                         sub        rdi, r8
0008d 4c3bdf                         cmp        r11, rdi
00090 0f8fbc110000                   jg         0x7f4677e5a3d2
00096 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
0009a 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f84b10f0000                   je         0x7f4677e5a1d8
000a7 33ff                           xor        edi, edi
000a9 4c8bc2                         mov        r8, rdx
000ac 8b7204                         mov        esi, dword ptr [rdx + 4]
000af 8b5340                         mov        edx, dword ptr [rbx + 0x40]
000b2 418bc9                         mov        ecx, r9d
000b5 4585c9                         test       r9d, r9d
000b8 0f8e83000000                   jle        0x7f4677e592c1
000be 89442410                       mov        dword ptr [rsp + 0x10], eax
000c2 4c2b6c2440                     sub        r13, qword ptr [rsp + 0x40]
000c7 8d46e0                         lea        eax, [rsi - 0x20]
000ca 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000cf 458d5ae0                       lea        r11d, [r10 - 0x20]
000d3 448b5504                       mov        r10d, dword ptr [rbp + 4]
000d7 4585d2                         test       r10d, r10d
000da 0f8674120000                   jbe        0x7f4677e5a4d4
000e0 4d63d2                         movsxd     r10, r10d
000e3 4d63c9                         movsxd     r9, r9d
000e6 49ffc9                         dec        r9
000e9 4d3bca                         cmp        r9, r10
000ec 0f8362120000                   jae        0x7f4677e5a4d4
000f2 4c8bd2                         mov        r10, rdx
000f5 4533c9                         xor        r9d, r9d
000f8 48895c2468                     mov        qword ptr [rsp + 0x68], rbx
000fd 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00102 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00106 4c89b42480000000               mov        qword ptr [rsp + 0x80], r14
0010e 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
00116 897c2454                       mov        dword ptr [rsp + 0x54], edi
0011a 89742458                       mov        dword ptr [rsp + 0x58], esi
0011e 8954247c                       mov        dword ptr [rsp + 0x7c], edx
00122 89842490000000                 mov        dword ptr [rsp + 0x90], eax
00129 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00131 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00139 4533d2                         xor        r10d, r10d
0013c e997010000                     jmp        0x7f4677e59458
00141 85d2                           test       edx, edx
00143 0f84d3110000                   je         0x7f4677e5a49c
00149 4c8bca                         mov        r9, rdx
0014c 4533db                         xor        r11d, r11d
0014f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00154 85c0                           test       eax, eax
00156 0f8c7c110000                   jl         0x7f4677e5a458
0015c 3b742438                       cmp        esi, dword ptr [rsp + 0x38]
00160 0f8276110000                   jb         0x7f4677e5a45c
00166 428d2c10                       lea        ebp, [rax + r10]
0016a 418b4904                       mov        ecx, dword ptr [r9 + 4]
0016e 3bcd                           cmp        ecx, ebp
00170 0f826a110000                   jb         0x7f4677e5a460
00176 4585d2                         test       r10d, r10d
00179 0f8c65110000                   jl         0x7f4677e5a464
0017f 4585d2                         test       r10d, r10d
00182 7433                           je         0x7f4677e59337
00184 498d740108                     lea        rsi, [r9 + rax + 8]
00189 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
0018e 4963d2                         movsxd     rdx, r10d
00191 4883fa20                       cmp        rdx, 0x20
00195 7739                           ja         0x7f4677e59350
00197 4d63d2                         movsxd     r10, r10d
0019a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001a1 c442a8f5db                     bzhi       r11, r11, r10
001a6 c4c1fb92fb                     kmovq      k7, r11
001ab 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
001b1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
001b7 896b38                         mov        dword ptr [rbx + 0x38], ebp
001ba c5f877                         vzeroupper 
001bd 4881c4b0000000                 add        rsp, 0xb0
001c4 5d                             pop        rbp
001c5 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001c9 0f87dd180000                   ja         0x7f4677e5ac2c
001cf c3                             ret        
001d0 c5f877                         vzeroupper 
001d3 49ba204f8e77467f0000           movabs     r10, 0x7f46778e4f20
001dd 41ffd2                         call       r10
001e0 0f1f840000000000               nop        dword ptr [rax + rax]
001e8 ebcd                           jmp        0x7f4677e59337
001ea 660f1f440000                   nop        word ptr [rax + rax]
001f0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
001f5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
001f9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
001fd 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00202 8bd5                           mov        edx, ebp
00204 c5f877                         vzeroupper 
00207 e8d424aaff                     call       0x7f46778fb860
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00219 8b542410                       mov        edx, dword ptr [rsp + 0x10]
0021d 488bc8                         mov        rcx, rax
00220 c5f877                         vzeroupper 
00223 e8b824aaff                     call       0x7f46778fb860
00228 0f1f840020030001               nop        dword ptr [rax + rax + 0x1000320]
00230 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00235 4183c208                       add        r10d, 8
00239 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
0023e 7cb0                           jl         0x7f4677e59370
00240 e9c10d0000                     jmp        0x7f4677e5a186
00245 4d63d2                         movsxd     r10, r10d
00248 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0024f c442a8f5db                     bzhi       r11, r11, r10
00254 c4c1fb92fb                     kmovq      k7, r11
00259 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0025f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00265 e99c0d0000                     jmp        0x7f4677e5a186
0026a 418bea                         mov        ebp, r10d
0026d 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
00275 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00279 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
0027d 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00282 8b7c2428                       mov        edi, dword ptr [rsp + 0x28]
00286 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0028b 44891c24                       mov        dword ptr [rsp], r11d
0028f 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00294 44894c2408                     mov        dword ptr [rsp + 8], r9d
00299 458bca                         mov        r9d, r10d
0029c c5f877                         vzeroupper 
0029f e83c24aaff                     call       0x7f46778fb860
002a4 0f1f84009c030002               nop        dword ptr [rax + rax + 0x200039c]
002ac 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
002b0 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
002b5 41ffc1                         inc        r9d
002b8 443b4c2464                     cmp        r9d, dword ptr [rsp + 0x64]
002bd 0f8db20d0000                   jge        0x7f4677e5a1f5
002c3 89442410                       mov        dword ptr [rsp + 0x10], eax
002c7 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
002cf 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
002d3 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002d8 4e8b5ccd08                     mov        r11, qword ptr [rbp + r9*8 + 8]
002dd 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
002e2 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
002ea 458bcb                         mov        r9d, r11d
002ed 4181e1ffff0100                 and        r9d, 0x1ffff
002f4 4d8bc3                         mov        r8, r11
002f7 49c1f824                       sar        r8, 0x24
002fb 49c1eb12                       shr        r11, 0x12
002ff 458bc0                         mov        r8d, r8d
00302 458bdb                         mov        r11d, r11d
00305 4181e3ffff0300                 and        r11d, 0x3ffff
0030c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00311 4585c0                         test       r8d, r8d
00314 7d26                           jge        0x7f4677e594bc
00316 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0031b 458b5b04                       mov        r11d, dword ptr [r11 + 4]
0031f 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
00324 453bc3                         cmp        r8d, r11d
00327 0f833b0f0000                   jae        0x7f4677e5a3e8
0032d 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00332 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00337 478b449808                     mov        r8d, dword ptr [r8 + r11*4 + 8]
0033c 4585c9                         test       r9d, r9d
0033f 0f84d20c0000                   je         0x7f4677e5a197
00345 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00349 412bca                         sub        ecx, r10d
0034c 443bc9                         cmp        r9d, ecx
0034f 0f8fdc0e0000                   jg         0x7f4677e5a3b1
00355 458bd9                         mov        r11d, r9d
00358 4183f803                       cmp        r8d, 3
0035c 7f66                           jg         0x7f4677e59544
0035e 4585db                         test       r11d, r11d
00361 7403                           je         0x7f4677e594e6
00363 41ffc8                         dec        r8d
00366 4585c0                         test       r8d, r8d
00369 0f843c0d0000                   je         0x7f4677e5a22b
0036f 4183f803                       cmp        r8d, 3
00373 0f844f0d0000                   je         0x7f4677e5a248
00379 4183f802                       cmp        r8d, 2
0037d 0f8693000000                   jbe        0x7f4677e59596
00383 48bef8ffa5e200000000           movabs     rsi, 0xe2a5fff8
0038d 418bea                         mov        ebp, r10d
00390 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00395 666690                         nop        
00398 c5f877                         vzeroupper 
0039b e84023aaff                     call       0x7f46778fb860
003a0 0f1f840098040003               nop        dword ptr [rax + rax + 0x3000498]
003a8 4885c0                         test       rax, rax
003ab 0f8447100000                   je         0x7f4677e5a578
003b1 488bf0                         mov        rsi, rax
003b4 c5f877                         vzeroupper 
003b7 4881c4b0000000                 add        rsp, 0xb0
003be 5d                             pop        rbp
003bf e99cbbb6ff                     jmp        0x7f46779c50e0
003c4 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
003c9 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003d1 458b5b04                       mov        r11d, dword ptr [r11 + 4]
003d5 4183c0fd                       add        r8d, -3
003d9 4183fb02                       cmp        r11d, 2
003dd 0f86c10e0000                   jbe        0x7f4677e5a424
003e3 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
003eb 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
003ef 45894b10                       mov        dword ptr [r11 + 0x10], r9d
003f3 458b5b08                       mov        r11d, dword ptr [r11 + 8]
003f7 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
003ff 4589590c                       mov        dword ptr [r9 + 0xc], r11d
00403 45894108                       mov        dword ptr [r9 + 8], r8d
00407 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0040c 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00411 e9cc010000                     jmp        0x7f4677e59762
00416 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0041b 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00423 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00427 443bc3                         cmp        r8d, ebx
0042a 0f83940f0000                   jae        0x7f4677e5a544
00430 438b6c8308                     mov        ebp, dword ptr [r11 + r8*4 + 8]
00435 4585c0                         test       r8d, r8d
00438 0f8e80010000                   jle        0x7f4677e5973e
0043e 85db                           test       ebx, ebx
00440 0f86fa0f0000                   jbe        0x7f4677e5a5c0
00446 4c63db                         movsxd     r11, ebx
00449 4d63c8                         movsxd     r9, r8d
0044c 49ffc9                         dec        r9
0044f 4d3bcb                         cmp        r9, r11
00452 0f83e80f0000                   jae        0x7f4677e5a5c0
00458 83fb01                         cmp        ebx, 1
0045b 0f86df0f0000                   jbe        0x7f4677e5a5c0
00461 458d58ff                       lea        r11d, [r8 - 1]
00465 4d63db                         movsxd     r11, r11d
00468 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00470 458bc9                         mov        r9d, r9d
00473 4183c1cc                       add        r9d, -0x34
00477 41c1e902                       shr        r9d, 2
0047b 438d4c01ff                     lea        ecx, [r9 + r8 - 1]
00480 41b904000000                   mov        r9d, 4
00486 c462b0f5c9                     bzhi       r9, rcx, r9
0048b 4d2bd9                         sub        r11, r9
0048e 4533c9                         xor        r9d, r9d
00491 4d85db                         test       r11, r11
00494 4d0f4cd9                       cmovl      r11, r9
00498 458bcb                         mov        r9d, r11d
0049b 90                             nop        
0049c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
004a4 478b5c8304                     mov        r11d, dword ptr [r11 + r8*4 + 4]
004a9 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
004b1 46895c8108                     mov        dword ptr [rcx + r8*4 + 8], r11d
004b6 41ffc8                         dec        r8d
004b9 453bc1                         cmp        r8d, r9d
004bc 7fde                           jg         0x7f4677e5961c
004be 4183f83f                       cmp        r8d, 0x3f
004c2 0f8ecc000000                   jle        0x7f4677e59714
004c8 0f1f840000000000               nop        dword ptr [rax + rax]
004d0 418d50c1                       lea        edx, [r8 - 0x3f]
004d4 458d58d0                       lea        r11d, [r8 - 0x30]
004d8 418d48f1                       lea        ecx, [r8 - 0xf]
004dc 418d78f0                       lea        edi, [r8 - 0x10]
004e0 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
004e8 62d17e486f84b908000000         vmovdqu32  zmm0, zmmword ptr [r9 + rdi*4 + 8]
004f3 62d17e487f848908000000         vmovdqu32  zmmword ptr [r9 + rcx*4 + 8], zmm0
004fe 458d48e1                       lea        r9d, [r8 - 0x1f]
00502 418d48e0                       lea        ecx, [r8 - 0x20]
00506 488bbc24c8000000               mov        rdi, qword ptr [rsp + 0xc8]
0050e 62f17e486f848f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + rcx*4 + 8]
00519 62b17e487f848f08000000         vmovdqu32  zmmword ptr [rdi + r9*4 + 8], zmm0
00524 62b17e486f849f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11*4 + 8]
0052f 458d58d1                       lea        r11d, [r8 - 0x2f]
00533 62b17e487f849f08000000         vmovdqu32  zmmword ptr [rdi + r11*4 + 8], zmm0
0053e 4183c0c0                       add        r8d, -0x40
00542 62b17e486f848708000000         vmovdqu32  zmm0, zmmword ptr [rdi + r8*4 + 8]
0054d 62f17e487f849708000000         vmovdqu32  zmmword ptr [rdi + rdx*4 + 8], zmm0
00558 4183f83f                       cmp        r8d, 0x3f
0055c 0f8f6effffff                   jg         0x7f4677e59650
00562 4183f80f                       cmp        r8d, 0xf
00566 7e2c                           jle        0x7f4677e59714
00568 458d48f1                       lea        r9d, [r8 - 0xf]
0056c 4183c0f0                       add        r8d, -0x10
00570 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00578 62917e486f848308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r8*4 + 8]
00583 62917e487f848b08000000         vmovdqu32  zmmword ptr [r11 + r9*4 + 8], zmm0
0058e 4183f80f                       cmp        r8d, 0xf
00592 7fd4                           jg         0x7f4677e596e8
00594 4585c0                         test       r8d, r8d
00597 7e25                           jle        0x7f4677e5973e
00599 666690                         nop        
0059c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
005a4 478b5c8304                     mov        r11d, dword ptr [r11 + r8*4 + 4]
005a9 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
005b1 47895c8108                     mov        dword ptr [r9 + r8*4 + 8], r11d
005b6 41ffc8                         dec        r8d
005b9 4585c0                         test       r8d, r8d
005bc 7fde                           jg         0x7f4677e5971c
005be 85db                           test       ebx, ebx
005c0 0f864a0e0000                   jbe        0x7f4677e5a590
005c6 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
005ce 896908                         mov        dword ptr [rcx + 8], ebp
005d1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
005d6 896c2448                       mov        dword ptr [rsp + 0x48], ebp
005da 48898c24c8000000               mov        qword ptr [rsp + 0xc8], rcx
005e2 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
005e7 4963d3                         movsxd     rdx, r11d
005ea 4c634c2410                     movsxd     r9, dword ptr [rsp + 0x10]
005ef 4c034c2440                     add        r9, qword ptr [rsp + 0x40]
005f4 4c03ca                         add        r9, rdx
005f7 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
005fc 4503c3                         add        r8d, r11d
005ff 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00604 48634c2448                     movsxd     rcx, dword ptr [rsp + 0x48]
00609 458be8                         mov        r13d, r8d
0060c 442b6c2448                     sub        r13d, dword ptr [rsp + 0x48]
00611 493bc9                         cmp        rcx, r9
00614 7f18                           jg         0x7f4677e597ae
00616 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
0061b 4585c0                         test       r8d, r8d
0061e 0f84600b0000                   je         0x7f4677e5a304
00624 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00629 4533c0                         xor        r8d, r8d
0062c eb10                           jmp        0x7f4677e597be
0062e 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
00633 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00638 41b801000000                   mov        r8d, 1
0063e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00643 4585db                         test       r11d, r11d
00646 0f8efc0b0000                   jle        0x7f4677e5a3c8
0064c 4585c0                         test       r8d, r8d
0064f 0f85ca090000                   jne        0x7f4677e5a19f
00655 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0065a 440344242c                     add        r8d, dword ptr [rsp + 0x2c]
0065f 458bda                         mov        r11d, r10d
00662 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
00667 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0066c 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
00674 0f8ff0fbffff                   jg         0x7f4677e593ea
0067a 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00682 0f8fe2fbffff                   jg         0x7f4677e593ea
00688 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
0068c 83c5f1                         add        ebp, -0xf
0068f 48c7c300000080                 mov        rbx, 0xffffffff80000000
00696 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0069b 4183fb10                       cmp        r11d, 0x10
0069f 0f8ec4030000                   jle        0x7f4677e59be9
006a5 4183fb30                       cmp        r11d, 0x30
006a9 0f8e89000000                   jle        0x7f4677e598b8
006af 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006b4 458b4304                       mov        r8d, dword ptr [r11 + 4]
006b8 4585d2                         test       r10d, r10d
006bb 0f8c53100000                   jl         0x7f4677e5a894
006c1 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
006c6 4585c9                         test       r9d, r9d
006c9 0f8c45100000                   jl         0x7f4677e5a894
006cf 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
006d4 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
006d9 0f8235100000                   jb         0x7f4677e5a894
006df 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
006e4 0f822a100000                   jb         0x7f4677e5a894
006ea 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
006ef 4585c0                         test       r8d, r8d
006f2 0f8427040000                   je         0x7f4677e59c9f
006f8 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
006fd 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00702 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00707 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0070c 4b8d740808                     lea        rsi, [r8 + r9 + 8]
00711 4883fa20                       cmp        rdx, 0x20
00715 0f86df030000                   jbe        0x7f4677e59c7a
0071b c5f877                         vzeroupper 
0071e 49ba204f8e77467f0000           movabs     r10, 0x7f46778e4f20
00728 41ffd2                         call       r10
0072b 0f1f840000000000               nop        dword ptr [rax + rax]
00733 e9e7030000                     jmp        0x7f4677e59c9f
00738 85ed                           test       ebp, ebp
0073a 0f8ca00f0000                   jl         0x7f4677e5a860
00740 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
00745 418d68f1                       lea        ebp, [r8 - 0xf]
00749 443bd5                         cmp        r10d, ebp
0074c 0f839a0e0000                   jae        0x7f4677e5a76c
00752 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00757 418b4904                       mov        ecx, dword ptr [r9 + 4]
0075b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00760 8d69f1                         lea        ebp, [rcx - 0xf]
00763 4d63ca                         movsxd     r9, r10d
00766 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0076b c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00772 85ed                           test       ebp, ebp
00774 0f8ce20f0000                   jl         0x7f4677e5a8dc
0077a 448d59f1                       lea        r11d, [rcx - 0xf]
0077e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00783 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00788 453bd3                         cmp        r10d, r11d
0078b 0f838f0e0000                   jae        0x7f4677e5a7a0
00791 418d7a10                       lea        edi, [r10 + 0x10]
00795 897c2418                       mov        dword ptr [rsp + 0x18], edi
00799 4d63da                         movsxd     r11, r10d
0079c 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
007a0 c4a17a7f441f08                 vmovdqu    xmmword ptr [rdi + r11 + 8], xmm0
007a7 8b542418                       mov        edx, dword ptr [rsp + 0x18]
007ab 3b54242c                       cmp        edx, dword ptr [rsp + 0x2c]
007af 0f8d91020000                   jge        0x7f4677e59bc6
007b5 4d2bcb                         sub        r9, r11
007b8 4963f8                         movsxd     rdi, r8d
007bb 4883c7f1                       add        rdi, -0xf
007bf 4c63da                         movsxd     r11, edx
007c2 4f8d040b                       lea        r8, [r11 + r9]
007c6 4c3bc7                         cmp        r8, rdi
007c9 0f83f90f0000                   jae        0x7f4677e5a948
007cf 486354242c                     movsxd     rdx, dword ptr [rsp + 0x2c]
007d4 4c8bc2                         mov        r8, rdx
007d7 4d2bc3                         sub        r8, r11
007da 4983c00f                       add        r8, 0xf
007de 4983e0f0                       and        r8, 0xfffffffffffffff0
007e2 458bc0                         mov        r8d, r8d
007e5 478d5c1010                     lea        r11d, [r8 + r10 + 0x10]
007ea 4d63db                         movsxd     r11, r11d
007ed 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
007f2 4c3bc7                         cmp        r8, rdi
007f5 0f83cd0f0000                   jae        0x7f4677e5a948
007fb 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00800 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00805 0f83bd0f0000                   jae        0x7f4677e5a948
0080b 4c63c1                         movsxd     r8, ecx
0080e 4983c3f0                       add        r11, -0x10
00812 4983c0f1                       add        r8, -0xf
00816 4d3bd8                         cmp        r11, r8
00819 0f83a90f0000                   jae        0x7f4677e5a948
0081f 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00824 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
0082b 0f8fb30f0000                   jg         0x7f4677e5a964
00831 8b4c2424                       mov        ecx, dword ptr [rsp + 0x24]
00835 412bca                         sub        ecx, r10d
00838 4183c220                       add        r10d, 0x20
0083c 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00841 448bd9                         mov        r11d, ecx
00844 44035c2418                     add        r11d, dword ptr [rsp + 0x18]
00849 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
0084e c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
00855 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0085a c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00861 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00866 4183c010                       add        r8d, 0x10
0086a 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0086f 453bc2                         cmp        r8d, r10d
00872 7cc8                           jl         0x7f4677e599bc
00874 4881c210ffffff                 add        rdx, -0xf0
0087b 4881fa00000080                 cmp        rdx, -0x80000000
00882 480f4cd3                       cmovl      rdx, rbx
00886 448bd2                         mov        r10d, edx
00889 453bc2                         cmp        r8d, r10d
0088c 0f8d73010000                   jge        0x7f4677e59b85
00892 458bd8                         mov        r11d, r8d
00895 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0089a 660f1f440000                   nop        word ptr [rax + rax]
008a0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
008a5 4963d3                         movsxd     rdx, r11d
008a8 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
008ad 8bf9                           mov        edi, ecx
008af 037c2418                       add        edi, dword ptr [rsp + 0x18]
008b3 448bdf                         mov        r11d, edi
008b6 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
008bb c4c17a6f443908                 vmovdqu    xmm0, xmmword ptr [r9 + rdi + 8]
008c2 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
008c6 c4a17a7f440708                 vmovdqu    xmmword ptr [rdi + r8 + 8], xmm0
008cd 4d63cb                         movsxd     r9, r11d
008d0 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
008d5 c4817a6f440b18                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x18]
008dc c5fa7f441718                   vmovdqu    xmmword ptr [rdi + rdx + 0x18], xmm0
008e2 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
008e7 c4817a6f440b28                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x28]
008ee c5fa7f441728                   vmovdqu    xmmword ptr [rdi + rdx + 0x28], xmm0
008f4 c4817a6f440b38                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x38]
008fb c5fa7f441738                   vmovdqu    xmmword ptr [rdi + rdx + 0x38], xmm0
00901 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00906 c4817a6f440b48                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x48]
0090d c5fa7f441748                   vmovdqu    xmmword ptr [rdi + rdx + 0x48], xmm0
00913 c4817a6f440b58                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x58]
0091a c5fa7f441758                   vmovdqu    xmmword ptr [rdi + rdx + 0x58], xmm0
00920 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00925 c4817a6f440b68                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x68]
0092c c5fa7f441768                   vmovdqu    xmmword ptr [rdi + rdx + 0x68], xmm0
00932 c4817a6f440b78                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x78]
00939 c5fa7f441778                   vmovdqu    xmmword ptr [rdi + rdx + 0x78], xmm0
0093f 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00944 c4817a6f840b88000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x88]
0094e c5fa7f841788000000             vmovdqu    xmmword ptr [rdi + rdx + 0x88], xmm0
00957 c4817a6f840b98000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0x98]
00961 c5fa7f841798000000             vmovdqu    xmmword ptr [rdi + rdx + 0x98], xmm0
0096a 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0096f c4817a6f840ba8000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xa8]
00979 c5fa7f8417a8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xa8], xmm0
00982 c4817a6f840bb8000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xb8]
0098c c5fa7f8417b8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xb8], xmm0
00995 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0099a c4817a6f840bc8000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xc8]
009a4 c5fa7f8417c8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xc8], xmm0
009ad c4817a6f840bd8000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xd8]
009b7 c5fa7f8417d8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xd8], xmm0
009c0 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
009c5 c4817a6f840be8000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xe8]
009cf c5fa7f8417e8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xe8], xmm0
009d8 c4817a6f840bf8000000           vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xf8]
009e2 c5fa7f8417f8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xf8], xmm0
009eb 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
009f0 4181c000010000                 add        r8d, 0x100
009f7 4489442418                     mov        dword ptr [rsp + 0x18], r8d
009fc 453bc2                         cmp        r8d, r10d
009ff 0f8c9bfeffff                   jl         0x7f4677e59a20
00a05 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00a0a 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00a0f 7d35                           jge        0x7f4677e59bc6
00a11 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00a16 458bc2                         mov        r8d, r10d
00a19 666690                         nop        
00a1c 468d1401                       lea        r10d, [rcx + r8]
00a20 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00a25 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00a2c 458bd0                         mov        r10d, r8d
00a2f 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00a34 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00a3b 4183c010                       add        r8d, 0x10
00a3f 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
00a44 7cd6                           jl         0x7f4677e59b9c
00a46 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a4b 44035c2424                     add        r11d, dword ptr [rsp + 0x24]
00a50 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00a55 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00a5a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00a5f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00a64 e9c5000000                     jmp        0x7f4677e59cae
00a69 85ed                           test       ebp, ebp
00a6b 0f8c670a0000                   jl         0x7f4677e5a658
00a71 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
00a75 83c5f1                         add        ebp, -0xf
00a78 443bd5                         cmp        r10d, ebp
00a7b 0f83f3090000                   jae        0x7f4677e5a5f4
00a81 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00a86 458b4304                       mov        r8d, dword ptr [r11 + 4]
00a8a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00a8f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00a94 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00a99 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00aa0 418d68f1                       lea        ebp, [r8 - 0xf]
00aa4 85ed                           test       ebp, ebp
00aa6 0f8c5c0a0000                   jl         0x7f4677e5a688
00aac 4183c0f1                       add        r8d, -0xf
00ab0 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ab5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00aba 453bd8                         cmp        r11d, r8d
00abd 0f83e1090000                   jae        0x7f4677e5a624
00ac3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ac8 4403542424                     add        r10d, dword ptr [rsp + 0x24]
00acd 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00ad2 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00ad7 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00ade 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ae3 4503d3                         add        r10d, r11d
00ae6 458bda                         mov        r11d, r10d
00ae9 442b5c2448                     sub        r11d, dword ptr [rsp + 0x48]
00aee 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00af3 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00af8 eb34                           jmp        0x7f4677e59cae
00afa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00aff 4d63d3                         movsxd     r10, r11d
00b02 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b09 c442a8f5db                     bzhi       r11, r11, r10
00b0e c4c1fb92fb                     kmovq      k7, r11
00b13 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b19 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b1f 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00b24 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b29 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b2e 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b33 458b5204                       mov        r10d, dword ptr [r10 + 4]
00b37 458d42f1                       lea        r8d, [r10 - 0xf]
00b3b 4489442418                     mov        dword ptr [rsp + 0x18], r8d
00b40 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00b45 4183fb10                       cmp        r11d, 0x10
00b49 7f68                           jg         0x7f4677e59d33
00b4b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00b50 4183f810                       cmp        r8d, 0x10
00b54 7c5d                           jl         0x7f4677e59d33
00b56 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00b5b 4585db                         test       r11d, r11d
00b5e 0f8c280c0000                   jl         0x7f4677e5a90c
00b64 458bc2                         mov        r8d, r10d
00b67 4183c0f1                       add        r8d, -0xf
00b6b 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00b70 453bd0                         cmp        r10d, r8d
00b73 0f83db0a0000                   jae        0x7f4677e5a7d4
00b79 4489442418                     mov        dword ptr [rsp + 0x18], r8d
00b7e 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00b83 c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
00b8a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b8f 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b94 0f83060b0000                   jae        0x7f4677e5a820
00b9a 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00b9e c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00ba5 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00baa 438d0413                       lea        eax, [r11 + r10]
00bae e9fdf6ffff                     jmp        0x7f4677e59430
00bb3 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00bb8 442b5c2460                     sub        r11d, dword ptr [rsp + 0x60]
00bbd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00bc2 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00bc7 4d8bd8                         mov        r11, r8
00bca 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00bcf 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00bd4 4183c308                       add        r11d, 8
00bd8 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00bdd 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00be2 4403442420                     add        r8d, dword ptr [rsp + 0x20]
00be7 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00bec 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bf1 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
00bf6 0f8d1a030000                   jge        0x7f4677e5a096
00bfc 4183fb10                       cmp        r11d, 0x10
00c00 0f8d9a000000                   jge        0x7f4677e59e20
00c06 4183fb08                       cmp        r11d, 8
00c0a 7d31                           jge        0x7f4677e59dbd
00c0c 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00c11 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00c15 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00c19 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00c1e 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00c23 90                             nop        
00c24 c5f877                         vzeroupper 
00c27 e8b41aaaff                     call       0x7f46778fb860
00c2c 0f1f8400240d0004               nop        dword ptr [rax + rax + 0x4000d24]
00c34 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00c38 e973f6ffff                     jmp        0x7f4677e59430
00c3d 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00c42 8b542450                       mov        edx, dword ptr [rsp + 0x50]
00c46 6690                           nop        
00c48 c5f877                         vzeroupper 
00c4b e8901aaaff                     call       0x7f46778fb860
00c50 0f1f8400480d0005               nop        dword ptr [rax + rax + 0x5000d48]
00c58 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00c5d 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00c61 488bc8                         mov        rcx, rax
00c64 c5f877                         vzeroupper 
00c67 e8741aaaff                     call       0x7f46778fb860
00c6c 0f1f8400640d0006               nop        dword ptr [rax + rax + 0x6000d64]
00c74 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00c79 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00c7e 0f8d9c050000                   jge        0x7f4677e5a3a0
00c84 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c89 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c90 0f8ff60c0000                   jg         0x7f4677e5ab0c
00c96 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00c9b e935050000                     jmp        0x7f4677e5a355
00ca0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00ca5 4585db                         test       r11d, r11d
00ca8 0f8c360c0000                   jl         0x7f4677e5aa64
00cae 458bda                         mov        r11d, r10d
00cb1 458bcb                         mov        r9d, r11d
00cb4 418d6bf1                       lea        ebp, [r11 - 0xf]
00cb8 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00cbd 443bd5                         cmp        r10d, ebp
00cc0 0f833a0b0000                   jae        0x7f4677e5a980
00cc6 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00ccb 4963fb                         movsxd     rdi, r11d
00cce 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00cd3 c4c17a6f443808                 vmovdqu    xmm0, xmmword ptr [r8 + rdi + 8]
00cda 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00cdf 443bd5                         cmp        r10d, ebp
00ce2 0f83380b0000                   jae        0x7f4677e5a9a0
00ce8 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00cec 448d5110                       lea        r10d, [rcx + 0x10]
00cf0 4c63c1                         movsxd     r8, ecx
00cf3 8b74247c                       mov        esi, dword ptr [rsp + 0x7c]
00cf7 c4a17a7f440608                 vmovdqu    xmmword ptr [rsi + r8 + 8], xmm0
00cfe 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
00d03 0f8dfc010000                   jge        0x7f4677e5a085
00d09 492bf8                         sub        rdi, r8
00d0c 4963d1                         movsxd     rdx, r9d
00d0f 4883c2f1                       add        rdx, -0xf
00d13 4d63c2                         movsxd     r8, r10d
00d16 4d8d0c38                       lea        r9, [r8 + rdi]
00d1a 4c3bca                         cmp        r9, rdx
00d1d 0f83310b0000                   jae        0x7f4677e5a9d4
00d23 486374243c                     movsxd     rsi, dword ptr [rsp + 0x3c]
00d28 4c8bce                         mov        r9, rsi
00d2b 4d2bc8                         sub        r9, r8
00d2e 4983c10f                       add        r9, 0xf
00d32 4983e1f0                       and        r9, 0xfffffffffffffff0
00d36 458bc1                         mov        r8d, r9d
00d39 458d4c0810                     lea        r9d, [r8 + rcx + 0x10]
00d3e 4d63c1                         movsxd     r8, r9d
00d41 4d8d4c38f0                     lea        r9, [r8 + rdi - 0x10]
00d46 4c3bca                         cmp        r9, rdx
00d49 0f83050b0000                   jae        0x7f4677e5a9d4
00d4f 443bd5                         cmp        r10d, ebp
00d52 0f83fc0a0000                   jae        0x7f4677e5a9d4
00d58 4983c0f0                       add        r8, -0x10
00d5c 4c3bc2                         cmp        r8, rdx
00d5f 0f83ef0a0000                   jae        0x7f4677e5a9d4
00d65 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00d6a 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
00d71 0f8f250b0000                   jg         0x7f4677e5aa1c
00d77 442bd9                         sub        r11d, ecx
00d7a 83c120                         add        ecx, 0x20
00d7d 458bca                         mov        r9d, r10d
00d80 478d0413                       lea        r8d, [r11 + r10]
00d84 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00d88 c4a17a6f440208                 vmovdqu    xmm0, xmmword ptr [rdx + r8 + 8]
00d8f c4a17a7f440a08                 vmovdqu    xmmword ptr [rdx + r9 + 8], xmm0
00d96 4183c210                       add        r10d, 0x10
00d9a 443bd1                         cmp        r10d, ecx
00d9d 7cde                           jl         0x7f4677e59efd
00d9f 4881c610ffffff                 add        rsi, -0xf0
00da6 4881fe00000080                 cmp        rsi, -0x80000000
00dad 480f4cf3                       cmovl      rsi, rbx
00db1 8bf6                           mov        esi, esi
00db3 443bd6                         cmp        r10d, esi
00db6 0f8d1c010000                   jge        0x7f4677e5a058
00dbc 0f1f4000                       nop        dword ptr [rax]
00dc0 458bca                         mov        r9d, r10d
00dc3 4963d1                         movsxd     rdx, r9d
00dc6 478d0413                       lea        r8d, [r11 + r10]
00dca 458bca                         mov        r9d, r10d
00dcd 418bd8                         mov        ebx, r8d
00dd0 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
00dd4 c5fa6f441f08                   vmovdqu    xmm0, xmmword ptr [rdi + rbx + 8]
00dda c4a17a7f440f08                 vmovdqu    xmmword ptr [rdi + r9 + 8], xmm0
00de1 4963c8                         movsxd     rcx, r8d
00de4 c5fa6f440f18                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x18]
00dea c5fa7f441718                   vmovdqu    xmmword ptr [rdi + rdx + 0x18], xmm0
00df0 c5fa6f440f28                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x28]
00df6 c5fa7f441728                   vmovdqu    xmmword ptr [rdi + rdx + 0x28], xmm0
00dfc c5fa6f440f38                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x38]
00e02 c5fa7f441738                   vmovdqu    xmmword ptr [rdi + rdx + 0x38], xmm0
00e08 c5fa6f440f48                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x48]
00e0e c5fa7f441748                   vmovdqu    xmmword ptr [rdi + rdx + 0x48], xmm0
00e14 c5fa6f440f58                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x58]
00e1a c5fa7f441758                   vmovdqu    xmmword ptr [rdi + rdx + 0x58], xmm0
00e20 c5fa6f440f68                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x68]
00e26 c5fa7f441768                   vmovdqu    xmmword ptr [rdi + rdx + 0x68], xmm0
00e2c c5fa6f440f78                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x78]
00e32 c5fa7f441778                   vmovdqu    xmmword ptr [rdi + rdx + 0x78], xmm0
00e38 c5fa6f840f88000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x88]
00e41 c5fa7f841788000000             vmovdqu    xmmword ptr [rdi + rdx + 0x88], xmm0
00e4a c5fa6f840f98000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x98]
00e53 c5fa7f841798000000             vmovdqu    xmmword ptr [rdi + rdx + 0x98], xmm0
00e5c c5fa6f840fa8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xa8]
00e65 c5fa7f8417a8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xa8], xmm0
00e6e c5fa6f840fb8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xb8]
00e77 c5fa7f8417b8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xb8], xmm0
00e80 c5fa6f840fc8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xc8]
00e89 c5fa7f8417c8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xc8], xmm0
00e92 c5fa6f840fd8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xd8]
00e9b c5fa7f8417d8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xd8], xmm0
00ea4 c5fa6f840fe8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xe8]
00ead c5fa7f8417e8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xe8], xmm0
00eb6 c5fa6f840ff8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xf8]
00ebf c5fa7f8417f8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xf8], xmm0
00ec8 4181c200010000                 add        r10d, 0x100
00ecf 443bd6                         cmp        r10d, esi
00ed2 0f8ce8feffff                   jl         0x7f4677e59f40
00ed8 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
00edd 7d26                           jge        0x7f4677e5a085
00edf 90                             nop        
00ee0 478d0c13                       lea        r9d, [r11 + r10]
00ee4 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00ee9 c4817a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 8]
00ef0 458bca                         mov        r9d, r10d
00ef3 c4817a7f440808                 vmovdqu    xmmword ptr [r8 + r9 + 8], xmm0
00efa 4183c210                       add        r10d, 0x10
00efe 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
00f03 7cdb                           jl         0x7f4677e5a060
00f05 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f0a 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00f0e 418bc3                         mov        eax, r11d
00f11 e99af3ffff                     jmp        0x7f4677e59430
00f16 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00f1b 4183fb30                       cmp        r11d, 0x30
00f1f 7f63                           jg         0x7f4677e5a104
00f21 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00f26 8b542450                       mov        edx, dword ptr [rsp + 0x50]
00f2a 6690                           nop        
00f2c c5f877                         vzeroupper 
00f2f e8ac17aaff                     call       0x7f46778fb860
00f34 0f1f84002c100007               nop        dword ptr [rax + rax + 0x700102c]
00f3c 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00f41 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00f45 488bc8                         mov        rcx, rax
00f48 c5f877                         vzeroupper 
00f4b e89017aaff                     call       0x7f46778fb860
00f50 0f1f840048100008               nop        dword ptr [rax + rax + 0x8001048]
00f58 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00f5d 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00f62 0f8d9e000000                   jge        0x7f4677e5a186
00f68 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f6d 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00f74 0f8fea090000                   jg         0x7f4677e5aae4
00f7a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00f7f e971f2ffff                     jmp        0x7f4677e59375
00f84 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00f89 4585db                         test       r11d, r11d
00f8c 0f8c82090000                   jl         0x7f4677e5aa94
00f92 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00f97 4585c0                         test       r8d, r8d
00f9a 0f8c74090000                   jl         0x7f4677e5aa94
00fa0 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00fa5 44035c2450                     add        r11d, dword ptr [rsp + 0x50]
00faa 453bd3                         cmp        r10d, r11d
00fad 0f8261090000                   jb         0x7f4677e5aa94
00fb3 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
00fb8 0f8256090000                   jb         0x7f4677e5aa94
00fbe 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00fc3 4585d2                         test       r10d, r10d
00fc6 743e                           je         0x7f4677e5a186
00fc8 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00fcd 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00fd2 4b8d7c1808                     lea        rdi, [r8 + r11 + 8]
00fd7 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00fdc 4b8d741808                     lea        rsi, [r8 + r11 + 8]
00fe1 4963d2                         movsxd     rdx, r10d
00fe4 4883fa20                       cmp        rdx, 0x20
00fe8 0f8657f2ffff                   jbe        0x7f4677e593c5
00fee c5f877                         vzeroupper 
00ff1 49ba204f8e77467f0000           movabs     r10, 0x7f46778e4f20
00ffb 41ffd2                         call       r10
00ffe 0f1f840000000000               nop        dword ptr [rax + rax]
01006 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0100b 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
0100f 418bc2                         mov        eax, r10d
01012 e999f2ffff                     jmp        0x7f4677e59430
01017 4533db                         xor        r11d, r11d
0101a e939f3ffff                     jmp        0x7f4677e594d8
0101f 4c2bc9                         sub        r9, rcx
01022 4d85c9                         test       r9, r9
01025 0f8d1d020000                   jge        0x7f4677e5a3c8
0102b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01030 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
01034 4d85d2                         test       r10, r10
01037 0f850b020000                   jne        0x7f4677e5a3c8
0103d bd08000000                     mov        ebp, 8
01042 be17000000                     mov        esi, 0x17
01047 90                             nop        
01048 c5f877                         vzeroupper 
0104b e89094b6ff                     call       0x7f46779c3660
01050 0f1f840048110009               nop        dword ptr [rax + rax + 0x9001148]
01058 4d03c3                         add        r8, r11
0105b 4d3bc6                         cmp        r8, r14
0105e 7e08                           jle        0x7f4677e5a1e8
01060 4533ed                         xor        r13d, r13d
01063 e93ff0ffff                     jmp        0x7f4677e59227
01068 4533ed                         xor        r13d, r13d
0106b bf01000000                     mov        edi, 1
01070 e934f0ffff                     jmp        0x7f4677e59229
01075 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0107a 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
0107f 85c9                           test       ecx, ecx
01081 0f84b1040000                   je         0x7f4677e5a6b8
01087 4c8bc9                         mov        r9, rcx
0108a 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0108f 4585db                         test       r11d, r11d
01092 0f8cb1040000                   jl         0x7f4677e5a6c9
01098 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
0109d 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
010a2 8b742458                       mov        esi, dword ptr [rsp + 0x58]
010a6 e9a9f0ffff                     jmp        0x7f4677e592d4
010ab 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
010b3 448b4904                       mov        r9d, dword ptr [rcx + 4]
010b7 4585c9                         test       r9d, r9d
010ba 0f869a040000                   jbe        0x7f4677e5a6da
010c0 8b6908                         mov        ebp, dword ptr [rcx + 8]
010c3 e90ef5ffff                     jmp        0x7f4677e59756
010c8 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
010d0 448b4104                       mov        r8d, dword ptr [rcx + 4]
010d4 4183f802                       cmp        r8d, 2
010d8 0f86c2040000                   jbe        0x7f4677e5a720
010de 8b6908                         mov        ebp, dword ptr [rcx + 8]
010e1 ffcd                           dec        ebp
010e3 85ed                           test       ebp, ebp
010e5 7e2f                           jle        0x7f4677e5a296
010e7 458bcb                         mov        r9d, r11d
010ea 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
010f2 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
010f6 45894310                       mov        dword ptr [r11 + 0x10], r8d
010fa 418b4b08                       mov        ecx, dword ptr [r11 + 8]
010fe 41894b0c                       mov        dword ptr [r11 + 0xc], ecx
01102 41896b08                       mov        dword ptr [r11 + 8], ebp
01106 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
0110e 458bd9                         mov        r11d, r9d
01111 e9c0f4ffff                     jmp        0x7f4677e59756
01116 48be2000a6e200000000           movabs     rsi, 0xe2a60020
01120 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01128 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01130 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
01138 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0113d 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
01145 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
0114d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01152 6690                           nop        
01154 c5f877                         vzeroupper 
01157 e88415aaff                     call       0x7f46778fb860
0115c 0f1f84005412000a               nop        dword ptr [rax + rax + 0xa001254]
01164 4885c0                         test       rax, rax
01167 0f8544f2ffff                   jne        0x7f4677e59531
0116d bef6ffffff                     mov        esi, 0xfffffff6
01172 6690                           nop        
01174 c5f877                         vzeroupper 
01177 e86493b6ff                     call       0x7f46779c3660
0117c 0f1f84007412000b               nop        dword ptr [rax + rax + 0xb001274]
01184 4d63dd                         movsxd     r11, r13d
01187 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
0118f 7c24                           jl         0x7f4677e5a335
01191 483b8c2480000000               cmp        rcx, qword ptr [rsp + 0x80]
01199 7e0d                           jle        0x7f4677e5a328
0119b 4533db                         xor        r11d, r11d
0119e 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
011a3 e990f4ffff                     jmp        0x7f4677e597b8
011a8 4533c0                         xor        r8d, r8d
011ab 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
011b0 e974f4ffff                     jmp        0x7f4677e597a9
011b5 4533c0                         xor        r8d, r8d
011b8 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
011bd e976f4ffff                     jmp        0x7f4677e597b8
011c2 0f1f8000000000                 nop        dword ptr [rax]
011c9 0f1f8000000000                 nop        dword ptr [rax]
011d0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
011d5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
011d9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
011dd 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
011e2 8bd5                           mov        edx, ebp
011e4 c5f877                         vzeroupper 
011e7 e8f414aaff                     call       0x7f46778fb860
011ec 0f1f8400e412000c               nop        dword ptr [rax + rax + 0xc0012e4]
011f4 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
011f9 8b542410                       mov        edx, dword ptr [rsp + 0x10]
011fd 488bc8                         mov        rcx, rax
01200 c5f877                         vzeroupper 
01203 e8d814aaff                     call       0x7f46778fb860
01208 0f1f84000013000d               nop        dword ptr [rax + rax + 0xd001300]
01210 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01215 4183c208                       add        r10d, 8
01219 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
0121e 7cb0                           jl         0x7f4677e5a350
01220 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01225 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
01229 418bc2                         mov        eax, r10d
0122c e97ff0ffff                     jmp        0x7f4677e59430
01231 be17000000                     mov        esi, 0x17
01236 6690                           nop        
01238 c5f877                         vzeroupper 
0123b e8a092b6ff                     call       0x7f46779c3660
01240 0f1f84003813000e               nop        dword ptr [rax + rax + 0xe001338]
01248 bd02000000                     mov        ebp, 2
0124d e9f0fdffff                     jmp        0x7f4677e5a1c2
01252 be17000000                     mov        esi, 0x17
01257 90                             nop        
01258 c5f877                         vzeroupper 
0125b e88092b6ff                     call       0x7f46779c3660
01260 0f1f84005813000f               nop        dword ptr [rax + rax + 0xf001358]
01268 bee4ffffff                     mov        esi, 0xffffffe4
0126d 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01275 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
0127d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01282 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0128a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0128f 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01294 c5f877                         vzeroupper 
01297 e84492b6ff                     call       0x7f46779c3660
0129c 0f1f840094130010               nop        dword ptr [rax + rax + 0x10001394]
012a4 bee4ffffff                     mov        esi, 0xffffffe4
012a9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
012ae 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
012b3 4489542418                     mov        dword ptr [rsp + 0x18], r10d
012b8 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
012bd 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
012c2 4489442420                     mov        dword ptr [rsp + 0x20], r8d
012c7 90                             nop        
012c8 c5f877                         vzeroupper 
012cb e81092b6ff                     call       0x7f46779c3660
012d0 0f1f8400c8130011               nop        dword ptr [rax + rax + 0x110013c8]
012d8 8be8                           mov        ebp, eax
012da eb0a                           jmp        0x7f4677e5a466
012dc 8be8                           mov        ebp, eax
012de eb06                           jmp        0x7f4677e5a466
012e0 8be8                           mov        ebp, eax
012e2 eb02                           jmp        0x7f4677e5a466
012e4 8be8                           mov        ebp, eax
012e6 beccffffff                     mov        esi, 0xffffffcc
012eb 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
012f3 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
012fb 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01300 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01305 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0130a 6690                           nop        
0130c c5f877                         vzeroupper 
0130f e8cc91b6ff                     call       0x7f46779c3660
01314 0f1f84000c140012               nop        dword ptr [rax + rax + 0x1200140c]
0131c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01321 8be8                           mov        ebp, eax
01323 4533db                         xor        r11d, r11d
01326 bef6ffffff                     mov        esi, 0xfffffff6
0132b 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01333 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
0133b 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01343 90                             nop        
01344 c5f877                         vzeroupper 
01347 e89491b6ff                     call       0x7f46779c3660
0134c 0f1f840044140013               nop        dword ptr [rax + rax + 0x13001444]
01354 be6effffff                     mov        esi, 0xffffff6e
01359 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01361 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
01369 899424c8000000                 mov        dword ptr [rsp + 0xc8], edx
01370 48894424f8                     mov        qword ptr [rsp - 8], rax
01375 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01379 898424cc000000                 mov        dword ptr [rsp + 0xcc], eax
01380 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01385 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
0138a 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0138f 48ff742440                     push       qword ptr [rsp + 0x40]
01394 488f442428                     pop        qword ptr [rsp + 0x28]
01399 897c2424                       mov        dword ptr [rsp + 0x24], edi
0139d 4c896c2440                     mov        qword ptr [rsp + 0x40], r13
013a2 4c89742448                     mov        qword ptr [rsp + 0x48], r14
013a7 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
013ac 89442450                       mov        dword ptr [rsp + 0x50], eax
013b0 894c2454                       mov        dword ptr [rsp + 0x54], ecx
013b4 c5f877                         vzeroupper 
013b7 e82491b6ff                     call       0x7f46779c3660
013bc 0f1f8400b4140014               nop        dword ptr [rax + rax + 0x140014b4]
013c4 bee4ffffff                     mov        esi, 0xffffffe4
013c9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
013ce 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
013d3 4489542418                     mov        dword ptr [rsp + 0x18], r10d
013d8 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
013dd 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
013e2 4489442424                     mov        dword ptr [rsp + 0x24], r8d
013e7 90                             nop        
013e8 c5f877                         vzeroupper 
013eb e8f090b6ff                     call       0x7f46779c3660
013f0 0f1f8400e8140015               nop        dword ptr [rax + rax + 0x150014e8]
013f8 bef6ffffff                     mov        esi, 0xfffffff6
013fd 666690                         nop        
01400 c5f877                         vzeroupper 
01403 e8d890b6ff                     call       0x7f46779c3660
01408 0f1f840000150016               nop        dword ptr [rax + rax + 0x16001500]
01410 bee4ffffff                     mov        esi, 0xffffffe4
01415 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0141a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0141f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01424 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01429 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0142e 6690                           nop        
01430 c5f877                         vzeroupper 
01433 e8a890b6ff                     call       0x7f46779c3660
01438 0f1f840030150017               nop        dword ptr [rax + rax + 0x17001530]
01440 be6effffff                     mov        esi, 0xffffff6e
01445 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0144a 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0144f 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01454 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01459 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0145e 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01463 90                             nop        
01464 c5f877                         vzeroupper 
01467 e87490b6ff                     call       0x7f46779c3660
0146c 0f1f840064150018               nop        dword ptr [rax + rax + 0x18001564]
01474 bee4ffffff                     mov        esi, 0xffffffe4
01479 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
0147e 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01483 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01488 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0148d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01492 6690                           nop        
01494 c5f877                         vzeroupper 
01497 e84490b6ff                     call       0x7f46779c3660
0149c 0f1f840094150019               nop        dword ptr [rax + rax + 0x19001594]
014a4 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
014aa bee4ffffff                     mov        esi, 0xffffffe4
014af 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
014b7 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
014bf 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
014c7 90                             nop        
014c8 c5f877                         vzeroupper 
014cb e81090b6ff                     call       0x7f46779c3660
014d0 0f1f8400c815001a               nop        dword ptr [rax + rax + 0x1a0015c8]
014d8 beccffffff                     mov        esi, 0xffffffcc
014dd 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
014e2 4489442418                     mov        dword ptr [rsp + 0x18], r8d
014e7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
014ec 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
014f1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
014f6 6690                           nop        
014f8 c5f877                         vzeroupper 
014fb e8e08fb6ff                     call       0x7f46779c3660
01500 0f1f8400f815001b               nop        dword ptr [rax + rax + 0x1b0015f8]
01508 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0150e beccffffff                     mov        esi, 0xffffffcc
01513 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01518 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0151d 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01522 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01527 90                             nop        
01528 c5f877                         vzeroupper 
0152b e8b08fb6ff                     call       0x7f46779c3660
01530 0f1f84002816001c               nop        dword ptr [rax + rax + 0x1c001628]
01538 8be8                           mov        ebp, eax
0153a 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
0153f 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01544 e9ddfdffff                     jmp        0x7f4677e5a4a6
01549 8be8                           mov        ebp, eax
0154b 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
01550 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
01555 e98cfdffff                     jmp        0x7f4677e5a466
0155a bee4ffffff                     mov        esi, 0xffffffe4
0155f 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01564 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0156c 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01571 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01576 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0157b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01580 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01585 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
0158a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0158f 90                             nop        
01590 c5f877                         vzeroupper 
01593 e8488fb6ff                     call       0x7f46779c3660
01598 0f1f84009016001d               nop        dword ptr [rax + rax + 0x1d001690]
015a0 bee4ffffff                     mov        esi, 0xffffffe4
015a5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
015aa 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
015b2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015b7 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
015bc 4489442410                     mov        dword ptr [rsp + 0x10], r8d
015c1 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
015c6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015cb 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
015d0 48894c2420                     mov        qword ptr [rsp + 0x20], rcx
015d5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015da 6690                           nop        
015dc c5f877                         vzeroupper 
015df e8fc8eb6ff                     call       0x7f46779c3660
015e4 0f1f8400dc16001e               nop        dword ptr [rax + rax + 0x1e0016dc]
015ec bee4ffffff                     mov        esi, 0xffffffe4
015f1 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
015f6 4489442418                     mov        dword ptr [rsp + 0x18], r8d
015fb 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01600 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01605 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0160a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0160f 90                             nop        
01610 c5f877                         vzeroupper 
01613 e8c88eb6ff                     call       0x7f46779c3660
01618 0f1f84001017001f               nop        dword ptr [rax + rax + 0x1f001710]
01620 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01626 bee4ffffff                     mov        esi, 0xffffffe4
0162b 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01633 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0163b 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01643 90                             nop        
01644 c5f877                         vzeroupper 
01647 e8948eb6ff                     call       0x7f46779c3660
0164c 0f1f840044170020               nop        dword ptr [rax + rax + 0x20001744]
01654 bee4ffffff                     mov        esi, 0xffffffe4
01659 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01661 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01669 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01671 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01676 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0167e 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
01683 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01688 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0168d 666690                         nop        
01690 c5f877                         vzeroupper 
01693 e8488eb6ff                     call       0x7f46779c3660
01698 0f1f840090170021               nop        dword ptr [rax + rax + 0x21001790]
016a0 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
016a6 bee4ffffff                     mov        esi, 0xffffffe4
016ab 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
016b3 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
016bb 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
016c3 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
016c8 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
016d0 c5f877                         vzeroupper 
016d3 e8088eb6ff                     call       0x7f46779c3660
016d8 0f1f8400d0170022               nop        dword ptr [rax + rax + 0x220017d0]
016e0 beccffffff                     mov        esi, 0xffffffcc
016e5 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
016ea 4489442418                     mov        dword ptr [rsp + 0x18], r8d
016ef 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
016f4 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016f9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016fe 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01703 90                             nop        
01704 c5f877                         vzeroupper 
01707 e8d48db6ff                     call       0x7f46779c3660
0170c 0f1f840004180023               nop        dword ptr [rax + rax + 0x23001804]
01714 beccffffff                     mov        esi, 0xffffffcc
01719 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01721 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01729 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01731 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01736 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0173b 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01740 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01745 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0174a 6690                           nop        
0174c c5f877                         vzeroupper 
0174f e88c8db6ff                     call       0x7f46779c3660
01754 0f1f84004c180024               nop        dword ptr [rax + rax + 0x2400184c]
0175c c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01762 beccffffff                     mov        esi, 0xffffffcc
01767 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0176c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01771 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01776 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0177b 90                             nop        
0177c c5f877                         vzeroupper 
0177f e85c8db6ff                     call       0x7f46779c3660
01784 0f1f84007c180025               nop        dword ptr [rax + rax + 0x2500187c]
0178c beccffffff                     mov        esi, 0xffffffcc
01791 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01799 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
017a1 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
017a9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
017ae 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
017b6 6690                           nop        
017b8 c5f877                         vzeroupper 
017bb e8208db6ff                     call       0x7f46779c3660
017c0 0f1f8400b8180026               nop        dword ptr [rax + rax + 0x260018b8]
017c8 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
017cc 83c510                         add        ebp, 0x10
017cf be6effffff                     mov        esi, 0xffffff6e
017d4 c5f877                         vzeroupper 
017d7 e8048db6ff                     call       0x7f46779c3660
017dc 0f1f8400d4180027               nop        dword ptr [rax + rax + 0x270018d4]
017e4 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
017e8 83c510                         add        ebp, 0x10
017eb be66ffffff                     mov        esi, 0xffffff66
017f0 c5f877                         vzeroupper 
017f3 e8e88cb6ff                     call       0x7f46779c3660
017f8 0f1f8400f0180028               nop        dword ptr [rax + rax + 0x280018f0]
01800 bee4ffffff                     mov        esi, 0xffffffe4
01805 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0180a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0180f 90                             nop        
01810 c5f877                         vzeroupper 
01813 e8c88cb6ff                     call       0x7f46779c3660
01818 0f1f840010190029               nop        dword ptr [rax + rax + 0x29001910]
01820 c5fa7f442420                   vmovdqu    xmmword ptr [rsp + 0x20], xmm0
01826 bee4ffffff                     mov        esi, 0xffffffe4
0182b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01830 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01835 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
0183a 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0183f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01844 c5f877                         vzeroupper 
01847 e8948cb6ff                     call       0x7f46779c3660
0184c 0f1f84004419002a               nop        dword ptr [rax + rax + 0x2a001944]
01854 4183c310                       add        r11d, 0x10
01858 be6effffff                     mov        esi, 0xffffff6e
0185d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01865 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0186d 4c898424c0000000               mov        qword ptr [rsp + 0xc0], r8
01875 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0187a 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
01882 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01887 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0188c c5f877                         vzeroupper 
0188f e84c8cb6ff                     call       0x7f46779c3660
01894 0f1f84008c19002b               nop        dword ptr [rax + rax + 0x2b00198c]
0189c 4183c310                       add        r11d, 0x10
018a0 be66ffffff                     mov        esi, 0xffffff66
018a5 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
018ad 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
018b5 4c898424c0000000               mov        qword ptr [rsp + 0xc0], r8
018bd 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
018c2 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
018ca 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
018cf 4489542418                     mov        dword ptr [rsp + 0x18], r10d
018d4 c5f877                         vzeroupper 
018d7 e8048cb6ff                     call       0x7f46779c3660
018dc 0f1f8400d419002c               nop        dword ptr [rax + rax + 0x2c0019d4]
018e4 beccffffff                     mov        esi, 0xffffffcc
018e9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
018f1 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
018f9 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01901 666690                         nop        
01904 c5f877                         vzeroupper 
01907 e8d48bb6ff                     call       0x7f46779c3660
0190c 0f1f8400041a002d               nop        dword ptr [rax + rax + 0x2d001a04]
01914 beccffffff                     mov        esi, 0xffffffcc
01919 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01921 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01929 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01931 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01936 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0193e 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01943 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01948 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0194d 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01952 6690                           nop        
01954 c5f877                         vzeroupper 
01957 e8848bb6ff                     call       0x7f46779c3660
0195c 0f1f8400541a002e               nop        dword ptr [rax + rax + 0x2e001a54]
01964 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01968 83c508                         add        ebp, 8
0196b be66ffffff                     mov        esi, 0xffffff66
01970 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01975 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0197a 6690                           nop        
0197c c5f877                         vzeroupper 
0197f e85c8bb6ff                     call       0x7f46779c3660
01984 0f1f84007c1a002f               nop        dword ptr [rax + rax + 0x2f001a7c]
0198c 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01990 83c508                         add        ebp, 8
01993 be66ffffff                     mov        esi, 0xffffff66
01998 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0199d 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
019a2 6690                           nop        
019a4 c5f877                         vzeroupper 
019a7 e8348bb6ff                     call       0x7f46779c3660
019ac 0f1f8400a41a0030               nop        dword ptr [rax + rax + 0x30001aa4]
019b4 bef6ffffff                     mov        esi, 0xfffffff6
019b9 666690                         nop        
019bc c5f877                         vzeroupper 
019bf e81c8bb6ff                     call       0x7f46779c3660
019c4 0f1f8400bc1a0031               nop        dword ptr [rax + rax + 0x31001abc]
019cc bef6ffffff                     mov        esi, 0xfffffff6
019d1 8b6c241c                       mov        ebp, dword ptr [rsp + 0x1c]
019d5 666690                         nop        
019d8 c5f877                         vzeroupper 
019db e8008bb6ff                     call       0x7f46779c3660
019e0 0f1f8400d81a0032               nop        dword ptr [rax + rax + 0x32001ad8]
019e8 bef6ffffff                     mov        esi, 0xfffffff6
019ed 666690                         nop        
019f0 c5f877                         vzeroupper 
019f3 e8e88ab6ff                     call       0x7f46779c3660
019f8 0f1f8400f01a0033               nop        dword ptr [rax + rax + 0x33001af0]
01a00 bef6ffffff                     mov        esi, 0xfffffff6
01a05 418be8                         mov        ebp, r8d
01a08 c5f877                         vzeroupper 
01a0b e8d08ab6ff                     call       0x7f46779c3660
01a10 0f1f8400081b0034               nop        dword ptr [rax + rax + 0x34001b08]
01a18 eb14                           jmp        0x7f4677e5abae
01a1a eb12                           jmp        0x7f4677e5abae
01a1c eb10                           jmp        0x7f4677e5abae
01a1e eb0e                           jmp        0x7f4677e5abae
01a20 eb0c                           jmp        0x7f4677e5abae
01a22 eb0a                           jmp        0x7f4677e5abae
01a24 eb08                           jmp        0x7f4677e5abae
01a26 eb06                           jmp        0x7f4677e5abae
01a28 eb04                           jmp        0x7f4677e5abae
01a2a eb02                           jmp        0x7f4677e5abae
01a2c eb00                           jmp        0x7f4677e5abae
01a2e 488bf0                         mov        rsi, rax
01a31 e97ee9ffff                     jmp        0x7f4677e59534
01a36 bef6ffffff                     mov        esi, 0xfffffff6
01a3b 90                             nop        
01a3c c5f877                         vzeroupper 
01a3f e89c8ab6ff                     call       0x7f46779c3660
01a44 0f1f84003c1b0035               nop        dword ptr [rax + rax + 0x35001b3c]
01a4c bef6ffffff                     mov        esi, 0xfffffff6
01a51 666690                         nop        
01a54 c5f877                         vzeroupper 
01a57 e8848ab6ff                     call       0x7f46779c3660
01a5c 0f1f8400541b0036               nop        dword ptr [rax + rax + 0x36001b54]
01a64 bef6ffffff                     mov        esi, 0xfffffff6
01a69 666690                         nop        
01a6c c5f877                         vzeroupper 
01a6f e86c8ab6ff                     call       0x7f46779c3660
01a74 0f1f84006c1b0037               nop        dword ptr [rax + rax + 0x37001b6c]
01a7c bef6ffffff                     mov        esi, 0xfffffff6
01a81 418bea                         mov        ebp, r10d
01a84 c5f877                         vzeroupper 
01a87 e8548ab6ff                     call       0x7f46779c3660
01a8c 0f1f8400841b0038               nop        dword ptr [rax + rax + 0x38001b84]
01a94 bef6ffffff                     mov        esi, 0xfffffff6
01a99 666690                         nop        
01a9c c5f877                         vzeroupper 
01a9f e83c8ab6ff                     call       0x7f46779c3660
01aa4 0f1f84009c1b0039               nop        dword ptr [rax + rax + 0x39001b9c]
01aac 49ba4593e577467f0000           movabs     r10, 0x7f4677e59345
01ab6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01abd e99e32aaff                     jmp        0x7f46778fdee0
01ac2 e859fea8ff                     call       0x7f46778eaaa0
01ac7 e972e5ffff                     jmp        0x7f4677e591be
01acc f4                             hlt        
01acd f4                             hlt        
01ace f4                             hlt        
01acf f4                             hlt        
