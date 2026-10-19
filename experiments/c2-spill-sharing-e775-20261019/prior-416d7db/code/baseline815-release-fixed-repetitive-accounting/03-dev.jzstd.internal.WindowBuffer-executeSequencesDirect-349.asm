00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c000aaff                   jne        0x7f5bbb90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8504250000                   jne        0x7f5bbbe71dc2
0003e 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00042 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
00047 c4c1f96ec0                     vmovq      xmm0, r8
0004c 448bc7                         mov        r8d, edi
0004f 488bde                         mov        rbx, rsi
00052 8b463c                         mov        eax, dword ptr [rsi + 0x3c]
00055 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00059 458bca                         mov        r9d, r10d
0005c 442bc8                         sub        r9d, eax
0005f 448b9c24d0000000               mov        r11d, dword ptr [rsp + 0xd0]
00067 453bd9                         cmp        r11d, r9d
0006a 0f8f6e120000                   jg         0x7f5bbbe70b5e
00070 4c8b4e08                       mov        r9, qword ptr [rsi + 8]
00074 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
00079 488b4e20                       mov        rcx, qword ptr [rsi + 0x20]
0007d 4c639c24d0000000               movsxd     r11, dword ptr [rsp + 0xd0]
00085 4c63c8                         movsxd     r9, eax
00088 4c034c2440                     add        r9, qword ptr [rsp + 0x40]
0008d 492bc9                         sub        rcx, r9
00090 4c3bd9                         cmp        r11, rcx
00093 0f8f45120000                   jg         0x7f5bbbe70b5e
00099 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
0009d 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a1 4d85ed                         test       r13, r13
000a4 0f84f20f0000                   je         0x7f5bbbe7091c
000aa 33ed                           xor        ebp, ebp
000ac 4c8bca                         mov        r9, rdx
000af 8b7208                         mov        esi, dword ptr [rdx + 8]
000b2 8b7b44                         mov        edi, dword ptr [rbx + 0x44]
000b5 418bc8                         mov        ecx, r8d
000b8 4585c0                         test       r8d, r8d
000bb 7e7f                           jle        0x7f5bbbe6f9bc
000bd 89442410                       mov        dword ptr [rsp + 0x10], eax
000c1 4c2b6c2440                     sub        r13, qword ptr [rsp + 0x40]
000c6 8d46e0                         lea        eax, [rsi - 0x20]
000c9 4489542458                     mov        dword ptr [rsp + 0x58], r10d
000ce 458d5ae0                       lea        r11d, [r10 - 0x20]
000d2 c4e1f97ec2                     vmovq      rdx, xmm0
000d7 448b5208                       mov        r10d, dword ptr [rdx + 8]
000db 4585d2                         test       r10d, r10d
000de 0f868c130000                   jbe        0x7f5bbbe70cf0
000e4 4d63d2                         movsxd     r10, r10d
000e7 4d63c0                         movsxd     r8, r8d
000ea 49ffc8                         dec        r8
000ed 4d3bc2                         cmp        r8, r10
000f0 0f837a130000                   jae        0x7f5bbbe70cf0
000f6 4c8bd7                         mov        r10, rdi
000f9 4533c0                         xor        r8d, r8d
000fc 48895c2448                     mov        qword ptr [rsp + 0x48], rbx
00101 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00106 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0010a 4c89742468                     mov        qword ptr [rsp + 0x68], r14
0010f 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
00114 896c245c                       mov        dword ptr [rsp + 0x5c], ebp
00118 89b424a4000000                 mov        dword ptr [rsp + 0xa4], esi
0011f 89bc24a8000000                 mov        dword ptr [rsp + 0xa8], edi
00126 89442474                       mov        dword ptr [rsp + 0x74], eax
0012a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0012f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00134 4533d2                         xor        r10d, r10d
00137 e9a2010000                     jmp        0x7f5bbbe6fb5e
0013c 85ff                           test       edi, edi
0013e 0f84f4120000                   je         0x7f5bbbe70cb8
00144 4c8bc7                         mov        r8, rdi
00147 4533d2                         xor        r10d, r10d
0014a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0014f 85c0                           test       eax, eax
00151 0f8c9d120000                   jl         0x7f5bbbe70c74
00157 3b742438                       cmp        esi, dword ptr [rsp + 0x38]
0015b 0f8297120000                   jb         0x7f5bbbe70c78
00161 468d2c18                       lea        r13d, [rax + r11]
00165 418b4808                       mov        ecx, dword ptr [r8 + 8]
00169 413bcd                         cmp        ecx, r13d
0016c 0f828a120000                   jb         0x7f5bbbe70c7c
00172 4585db                         test       r11d, r11d
00175 0f8c85120000                   jl         0x7f5bbbe70c80
0017b 4585db                         test       r11d, r11d
0017e 7433                           je         0x7f5bbbe6fa33
00180 498d74000c                     lea        rsi, [r8 + rax + 0xc]
00185 4b8d7c110c                     lea        rdi, [r9 + r10 + 0xc]
0018a 4963d3                         movsxd     rdx, r11d
0018d 4883fa20                       cmp        rdx, 0x20
00191 773a                           ja         0x7f5bbbe6fa4d
00193 4d63d3                         movsxd     r10, r11d
00196 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0019d c442a8f5db                     bzhi       r11, r11, r10
001a2 c4c1fb92fb                     kmovq      k7, r11
001a7 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
001ad 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
001b3 44896b3c                       mov        dword ptr [rbx + 0x3c], r13d
001b7 c5f877                         vzeroupper 
001ba 4881c4c0000000                 add        rsp, 0xc0
001c1 5d                             pop        rbp
001c2 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001c6 0f8760230000                   ja         0x7f5bbbe71dac
001cc c3                             ret        
001cd c5f877                         vzeroupper 
001d0 49ba209f8fbb5b7f0000           movabs     r10, 0x7f5bbb8f9f20
001da 41ffd2                         call       r10
001dd 0f1f840000000000               nop        dword ptr [rax + rax]
001e5 ebcc                           jmp        0x7f5bbbe6fa33
001e7 660f1f840000000000             nop        word ptr [rax + rax]
001f0 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
001f5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
001f9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
001fd 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00205 8bd5                           mov        edx, ebp
00207 90                             nop        
00208 c5f877                         vzeroupper 
0020b e8d00daaff                     call       0x7f5bbb910860
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00220 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00224 488bc8                         mov        rcx, rax
00227 90                             nop        
00228 c5f877                         vzeroupper 
0022b e8b00daaff                     call       0x7f5bbb910860
00230 0f1f840028030001               nop        dword ptr [rax + rax + 0x1000328]
00238 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0023d 4183c308                       add        r11d, 8
00241 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00246 7ca8                           jl         0x7f5bbbe6fa70
00248 e9f80d0000                     jmp        0x7f5bbbe708c5
0024d 4d63d3                         movsxd     r10, r11d
00250 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00257 c442a8f5db                     bzhi       r11, r11, r10
0025c c4c1fb92fb                     kmovq      k7, r11
00261 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00267 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0026d e9d30d0000                     jmp        0x7f5bbbe708c5
00272 418bea                         mov        ebp, r10d
00275 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
0027a 8b542410                       mov        edx, dword ptr [rsp + 0x10]
0027e 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
00282 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00287 8b7c2478                       mov        edi, dword ptr [rsp + 0x78]
0028b 44892c24                       mov        dword ptr [rsp], r13d
0028f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00294 44895c2408                     mov        dword ptr [rsp + 8], r11d
00299 458bca                         mov        r9d, r10d
0029c c5f877                         vzeroupper 
0029f e83c0daaff                     call       0x7f5bbb910860
002a4 0f1f84009c030002               nop        dword ptr [rax + rax + 0x200039c]
002ac 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
002b3 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
002b8 41ffc0                         inc        r8d
002bb 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
002c0 0f8df30d0000                   jge        0x7f5bbbe70939
002c6 89442410                       mov        dword ptr [rsp + 0x10], eax
002ca 488b9424d0000000               mov        rdx, qword ptr [rsp + 0xd0]
002d2 898c24a8000000                 mov        dword ptr [rsp + 0xa8], ecx
002d9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002de 4e8b5cc210                     mov        r11, qword ptr [rdx + r8*8 + 0x10]
002e3 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
002e8 48899424d0000000               mov        qword ptr [rsp + 0xd0], rdx
002f0 458bc3                         mov        r8d, r11d
002f3 4181e0ffff0100                 and        r8d, 0x1ffff
002fa 4d8bcb                         mov        r9, r11
002fd 49c1f924                       sar        r9, 0x24
00301 49c1eb12                       shr        r11, 0x12
00305 418bd9                         mov        ebx, r9d
00308 458bdb                         mov        r11d, r11d
0030b 4181e3ffff0300                 and        r11d, 0x3ffff
00312 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00317 85db                           test       ebx, ebx
00319 7d26                           jge        0x7f5bbbe6fbc1
0031b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00320 418b4b08                       mov        ecx, dword ptr [r11 + 8]
00324 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00329 443bd9                         cmp        r11d, ecx
0032c 0f83c20f0000                   jae        0x7f5bbbe70b74
00332 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00337 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
0033c 438b5c8b0c                     mov        ebx, dword ptr [r11 + r9*4 + 0xc]
00341 4585c0                         test       r8d, r8d
00344 0f840f0d0000                   je         0x7f5bbbe708d9
0034a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0034f 452bda                         sub        r11d, r10d
00352 453bc3                         cmp        r8d, r11d
00355 0f8f610f0000                   jg         0x7f5bbbe70b3c
0035b 83fb03                         cmp        ebx, 3
0035e 7f60                           jg         0x7f5bbbe6fc40
00360 4585c0                         test       r8d, r8d
00363 7402                           je         0x7f5bbbe6fbe7
00365 ffcb                           dec        ebx
00367 85db                           test       ebx, ebx
00369 0f84830d0000                   je         0x7f5bbbe70972
0036f 83fb03                         cmp        ebx, 3
00372 0f84970d0000                   je         0x7f5bbbe7098f
00378 83fb02                         cmp        ebx, 2
0037b 0f8688000000                   jbe        0x7f5bbbe6fc89
00381 48be2801cde200000000           movabs     rsi, 0xe2cd0128
0038b 418bea                         mov        ebp, r10d
0038e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00393 90                             nop        
00394 c5f877                         vzeroupper 
00397 e8440caaff                     call       0x7f5bbb910860
0039c 0f1f840094040003               nop        dword ptr [rax + rax + 0x3000494]
003a4 4885c0                         test       rax, rax
003a7 0f8473110000                   je         0x7f5bbbe70da0
003ad 488bf0                         mov        rsi, rax
003b0 c5f877                         vzeroupper 
003b3 4881c4c0000000                 add        rsp, 0xc0
003ba 5d                             pop        rbp
003bb e92087b6ff                     jmp        0x7f5bbb9d8360
003c0 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
003c8 458b5b08                       mov        r11d, dword ptr [r11 + 8]
003cc 83c3fd                         add        ebx, -3
003cf 4183fb02                       cmp        r11d, 2
003d3 0f86a30f0000                   jbe        0x7f5bbbe70bfc
003d9 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
003e1 458b4b10                       mov        r9d, dword ptr [r11 + 0x10]
003e5 45894b14                       mov        dword ptr [r11 + 0x14], r9d
003e9 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
003ed 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
003f5 45895910                       mov        dword ptr [r9 + 0x10], r11d
003f9 4189590c                       mov        dword ptr [r9 + 0xc], ebx
003fd 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
00404 e9bd010000                     jmp        0x7f5bbbe6fe46
00409 458bc8                         mov        r9d, r8d
0040c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00414 458b4308                       mov        r8d, dword ptr [r11 + 8]
00418 413bd8                         cmp        ebx, r8d
0041b 0f83c3100000                   jae        0x7f5bbbe70d64
00421 418b6c9b0c                     mov        ebp, dword ptr [r11 + rbx*4 + 0xc]
00426 85db                           test       ebx, ebx
00428 0f8e72010000                   jle        0x7f5bbbe6fe20
0042e 4585c0                         test       r8d, r8d
00431 0f867d110000                   jbe        0x7f5bbbe70e34
00437 4d63d8                         movsxd     r11, r8d
0043a 4863cb                         movsxd     rcx, ebx
0043d 48ffc9                         dec        rcx
00440 493bcb                         cmp        rcx, r11
00443 0f836b110000                   jae        0x7f5bbbe70e34
00449 4183f801                       cmp        r8d, 1
0044d 0f8661110000                   jbe        0x7f5bbbe70e34
00453 448d5bff                       lea        r11d, [rbx - 1]
00457 4d63db                         movsxd     r11, r11d
0045a 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
00462 8bc9                           mov        ecx, ecx
00464 83c1d0                         add        ecx, -0x30
00467 c1e902                         shr        ecx, 2
0046a 8d7c19ff                       lea        edi, [rcx + rbx - 1]
0046e b904000000                     mov        ecx, 4
00473 c4e2f0f5cf                     bzhi       rcx, rdi, rcx
00478 4c2bd9                         sub        r11, rcx
0047b 33c9                           xor        ecx, ecx
0047d 4d85db                         test       r11, r11
00480 4c0f4cd9                       cmovl      r11, rcx
00484 418bcb                         mov        ecx, r11d
00487 90                             nop        
00488 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00490 458b5c9b08                     mov        r11d, dword ptr [r11 + rbx*4 + 8]
00495 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
0049d 44895c9f0c                     mov        dword ptr [rdi + rbx*4 + 0xc], r11d
004a2 ffcb                           dec        ebx
004a4 3bd9                           cmp        ebx, ecx
004a6 7fe0                           jg         0x7f5bbbe6fd08
004a8 83fb3f                         cmp        ebx, 0x3f
004ab 0f8ec8000000                   jle        0x7f5bbbe6fdf9
004b1 0f1f840000000000               nop        dword ptr [rax + rax]
004b9 0f1f8000000000                 nop        dword ptr [rax]
004c0 8d7bc1                         lea        edi, [rbx - 0x3f]
004c3 8d73d0                         lea        esi, [rbx - 0x30]
004c6 8d53f1                         lea        edx, [rbx - 0xf]
004c9 8d4bf0                         lea        ecx, [rbx - 0x10]
004cc 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
004d4 62d17e486f848b0c000000         vmovdqu32  zmm0, zmmword ptr [r11 + rcx*4 + 0xc]
004df 62d17e487f84930c000000         vmovdqu32  zmmword ptr [r11 + rdx*4 + 0xc], zmm0
004ea 8d43e1                         lea        eax, [rbx - 0x1f]
004ed 448d5be0                       lea        r11d, [rbx - 0x20]
004f1 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
004f9 62b17e486f84990c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11*4 + 0xc]
00504 62f17e487f84810c000000         vmovdqu32  zmmword ptr [rcx + rax*4 + 0xc], zmm0
0050f 62f17e486f84b10c000000         vmovdqu32  zmm0, zmmword ptr [rcx + rsi*4 + 0xc]
0051a 448d5bd1                       lea        r11d, [rbx - 0x2f]
0051e 62b17e487f84990c000000         vmovdqu32  zmmword ptr [rcx + r11*4 + 0xc], zmm0
00529 83c3c0                         add        ebx, -0x40
0052c 62f17e486f84990c000000         vmovdqu32  zmm0, zmmword ptr [rcx + rbx*4 + 0xc]
00537 62f17e487f84b90c000000         vmovdqu32  zmmword ptr [rcx + rdi*4 + 0xc], zmm0
00542 83fb3f                         cmp        ebx, 0x3f
00545 0f8f75ffffff                   jg         0x7f5bbbe6fd40
0054b 83fb0f                         cmp        ebx, 0xf
0054e 7e29                           jle        0x7f5bbbe6fdf9
00550 8d4bf1                         lea        ecx, [rbx - 0xf]
00553 83c3f0                         add        ebx, -0x10
00556 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0055e 62d17e486f849b0c000000         vmovdqu32  zmm0, zmmword ptr [r11 + rbx*4 + 0xc]
00569 62d17e487f848b0c000000         vmovdqu32  zmmword ptr [r11 + rcx*4 + 0xc], zmm0
00574 83fb0f                         cmp        ebx, 0xf
00577 7fd7                           jg         0x7f5bbbe6fdd0
00579 85db                           test       ebx, ebx
0057b 7e23                           jle        0x7f5bbbe6fe20
0057d 666690                         nop        
00580 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00588 458b5c9b08                     mov        r11d, dword ptr [r11 + rbx*4 + 8]
0058d 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
00595 44895c990c                     mov        dword ptr [rcx + rbx*4 + 0xc], r11d
0059a ffcb                           dec        ebx
0059c 85db                           test       ebx, ebx
0059e 7fe0                           jg         0x7f5bbbe6fe00
005a0 4585c0                         test       r8d, r8d
005a3 0f868f0f0000                   jbe        0x7f5bbbe70db8
005a9 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
005b1 89690c                         mov        dword ptr [rcx + 0xc], ebp
005b4 458bc1                         mov        r8d, r9d
005b7 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
005be 48898c24d8000000               mov        qword ptr [rsp + 0xd8], rcx
005c6 4489442478                     mov        dword ptr [rsp + 0x78], r8d
005cb 4963d0                         movsxd     rdx, r8d
005ce 4c635c2410                     movsxd     r11, dword ptr [rsp + 0x10]
005d3 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
005d8 4c03da                         add        r11, rdx
005db 448b742410                     mov        r14d, dword ptr [rsp + 0x10]
005e0 4503f0                         add        r14d, r8d
005e3 4c638c248c000000               movsxd     r9, dword ptr [rsp + 0x8c]
005eb 418bde                         mov        ebx, r14d
005ee 2b9c248c000000                 sub        ebx, dword ptr [rsp + 0x8c]
005f5 4d3bcb                         cmp        r9, r11
005f8 7f18                           jg         0x7f5bbbe6fe92
005fa 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
005ff 4585c0                         test       r8d, r8d
00602 0f84100c0000                   je         0x7f5bbbe70a98
00608 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0060d 4533c0                         xor        r8d, r8d
00610 eb0e                           jmp        0x7f5bbbe6fea0
00612 8b4c245c                       mov        ecx, dword ptr [rsp + 0x5c]
00616 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
0061a 41b801000000                   mov        r8d, 1
00620 448bac248c000000               mov        r13d, dword ptr [rsp + 0x8c]
00628 4585ed                         test       r13d, r13d
0062b 0f8ea30c0000                   jle        0x7f5bbbe70b54
00631 4585c0                         test       r8d, r8d
00634 0f85270a0000                   jne        0x7f5bbbe708e1
0063a 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0063f 4503c6                         add        r8d, r14d
00642 458bda                         mov        r11d, r10d
00645 44035c2478                     add        r11d, dword ptr [rsp + 0x78]
0064a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0064f 443b442470                     cmp        r8d, dword ptr [rsp + 0x70]
00654 0f8f18fcffff                   jg         0x7f5bbbe6faf2
0065a 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
0065f 0f8f0dfcffff                   jg         0x7f5bbbe6faf2
00665 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
0066c 83c5f1                         add        ebp, -0xf
0066f 49c7c500000080                 mov        r13, 0xffffffff80000000
00676 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0067b 4183fb10                       cmp        r11d, 0x10
0067f 0f8e9f030000                   jle        0x7f5bbbe702a4
00685 458bc3                         mov        r8d, r11d
00688 4183f830                       cmp        r8d, 0x30
0068c 0f8e93000000                   jle        0x7f5bbbe6ffa5
00692 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0069a 458b4308                       mov        r8d, dword ptr [r11 + 8]
0069e 4585d2                         test       r10d, r10d
006a1 0f8c99150000                   jl         0x7f5bbbe714c0
006a7 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
006ac 4585c9                         test       r9d, r9d
006af 0f8c8b150000                   jl         0x7f5bbbe714c0
006b5 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
006bd 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
006c2 0f8278150000                   jb         0x7f5bbbe714c0
006c8 453bc6                         cmp        r8d, r14d
006cb 0f826f150000                   jb         0x7f5bbbe714c0
006d1 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
006d6 4585c0                         test       r8d, r8d
006d9 0f84f7030000                   je         0x7f5bbbe70356
006df 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
006e4 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
006e9 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
006f1 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
006f9 4b8d74080c                     lea        rsi, [r8 + r9 + 0xc]
006fe 4883fa20                       cmp        rdx, 0x20
00702 0f86a9030000                   jbe        0x7f5bbbe70331
00708 c5f877                         vzeroupper 
0070b 49ba209f8fbb5b7f0000           movabs     r10, 0x7f5bbb8f9f20
00715 41ffd2                         call       r10
00718 0f1f840000000000               nop        dword ptr [rax + rax]
00720 e9b1030000                     jmp        0x7f5bbbe70356
00725 85ed                           test       ebp, ebp
00727 0f8cc3140000                   jl         0x7f5bbbe71470
0072d 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00735 418d6bf1                       lea        ebp, [r11 - 0xf]
00739 443bd5                         cmp        r10d, ebp
0073c 0f832e120000                   jae        0x7f5bbbe711f0
00742 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
0074a 418b5108                       mov        edx, dword ptr [r9 + 8]
0074e 418bca                         mov        ecx, r10d
00751 8d6af1                         lea        ebp, [rdx - 0xf]
00754 4963fa                         movsxd     rdi, r10d
00757 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0075c c4c17a6f443a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rdi + 0xc]
00763 85ed                           test       ebp, ebp
00765 0f8c61150000                   jl         0x7f5bbbe7154c
0076b 448d42f1                       lea        r8d, [rdx - 0xf]
0076f 418bc0                         mov        eax, r8d
00772 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00777 453bd0                         cmp        r10d, r8d
0077a 0f8340120000                   jae        0x7f5bbbe71240
00780 458d4a10                       lea        r9d, [r10 + 0x10]
00784 4d63c2                         movsxd     r8, r10d
00787 8bb424a8000000                 mov        esi, dword ptr [rsp + 0xa8]
0078e c4a17a7f44060c                 vmovdqu    xmmword ptr [rsi + r8 + 0xc], xmm0
00795 453bce                         cmp        r9d, r14d
00798 0f8d65020000                   jge        0x7f5bbbe70283
0079e 492bf8                         sub        rdi, r8
007a1 4963f3                         movsxd     rsi, r11d
007a4 4883c6f1                       add        rsi, -0xf
007a8 4d63d9                         movsxd     r11, r9d
007ab 4d8d043b                       lea        r8, [r11 + rdi]
007af 4c3bc6                         cmp        r8, rsi
007b2 0f8370160000                   jae        0x7f5bbbe716a8
007b8 4963ee                         movsxd     rbp, r14d
007bb 4c8bc5                         mov        r8, rbp
007be 4d2bc3                         sub        r8, r11
007c1 4983c00f                       add        r8, 0xf
007c5 4983e0f0                       and        r8, 0xfffffffffffffff0
007c9 458bc0                         mov        r8d, r8d
007cc 478d5c1010                     lea        r11d, [r8 + r10 + 0x10]
007d1 4d63db                         movsxd     r11, r11d
007d4 4d8d443bf0                     lea        r8, [r11 + rdi - 0x10]
007d9 4c3bc6                         cmp        r8, rsi
007dc 0f8346160000                   jae        0x7f5bbbe716a8
007e2 443bc8                         cmp        r9d, eax
007e5 0f833d160000                   jae        0x7f5bbbe716a8
007eb 4c63c2                         movsxd     r8, edx
007ee 4983c3f0                       add        r11, -0x10
007f2 4983c0f1                       add        r8, -0xf
007f6 4d3bd8                         cmp        r11, r8
007f9 0f8329160000                   jae        0x7f5bbbe716a8
007ff 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
00806 0f8fc4160000                   jg         0x7f5bbbe71750
0080c 8bf9                           mov        edi, ecx
0080e 412bfa                         sub        edi, r10d
00811 4183c220                       add        r10d, 0x20
00815 666690                         nop        
00818 458bc1                         mov        r8d, r9d
0081b 468d1c0f                       lea        r11d, [rdi + r9]
0081f 488b542450                     mov        rdx, qword ptr [rsp + 0x50]
00824 c4a17a6f441a0c                 vmovdqu    xmm0, xmmword ptr [rdx + r11 + 0xc]
0082b 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
00832 c4a17a7f44020c                 vmovdqu    xmmword ptr [rdx + r8 + 0xc], xmm0
00839 4183c110                       add        r9d, 0x10
0083d 453bca                         cmp        r9d, r10d
00840 7cd6                           jl         0x7f5bbbe70098
00842 4881c510ffffff                 add        rbp, -0xf0
00849 4881fd00000080                 cmp        rbp, -0x80000000
00850 490f4ced                       cmovl      rbp, r13
00854 8bc5                           mov        eax, ebp
00856 443bc8                         cmp        r9d, eax
00859 0f8d6e010000                   jge        0x7f5bbbe7024d
0085f 458bd1                         mov        r10d, r9d
00862 458bca                         mov        r9d, r10d
00865 6666660f1f840000000000         nop        word ptr [rax + rax]
00870 458bd9                         mov        r11d, r9d
00873 4963f3                         movsxd     rsi, r11d
00876 458bd1                         mov        r10d, r9d
00879 468d1c0f                       lea        r11d, [rdi + r9]
0087d 458bc3                         mov        r8d, r11d
00880 488b542450                     mov        rdx, qword ptr [rsp + 0x50]
00885 c4a17a6f441a0c                 vmovdqu    xmm0, xmmword ptr [rdx + r11 + 0xc]
0088c 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
00893 c4a17a7f44120c                 vmovdqu    xmmword ptr [rdx + r10 + 0xc], xmm0
0089a 4d63c0                         movsxd     r8, r8d
0089d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008a2 c4817a6f44021c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x1c]
008a9 c5fa7f44321c                   vmovdqu    xmmword ptr [rdx + rsi + 0x1c], xmm0
008af 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008b4 c4817a6f44022c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x2c]
008bb c5fa7f44322c                   vmovdqu    xmmword ptr [rdx + rsi + 0x2c], xmm0
008c1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008c6 c4817a6f44023c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x3c]
008cd c5fa7f44323c                   vmovdqu    xmmword ptr [rdx + rsi + 0x3c], xmm0
008d3 c4817a6f44024c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x4c]
008da c5fa7f44324c                   vmovdqu    xmmword ptr [rdx + rsi + 0x4c], xmm0
008e0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008e5 c4817a6f44025c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x5c]
008ec c5fa7f44325c                   vmovdqu    xmmword ptr [rdx + rsi + 0x5c], xmm0
008f2 c4817a6f44026c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x6c]
008f9 c5fa7f44326c                   vmovdqu    xmmword ptr [rdx + rsi + 0x6c], xmm0
008ff 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00904 c4817a6f44027c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x7c]
0090b c5fa7f44327c                   vmovdqu    xmmword ptr [rdx + rsi + 0x7c], xmm0
00911 c4817a6f84028c000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x8c]
0091b c5fa7f84328c000000             vmovdqu    xmmword ptr [rdx + rsi + 0x8c], xmm0
00924 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00929 c4817a6f84029c000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0x9c]
00933 c5fa7f84329c000000             vmovdqu    xmmword ptr [rdx + rsi + 0x9c], xmm0
0093c c4817a6f8402ac000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xac]
00946 c5fa7f8432ac000000             vmovdqu    xmmword ptr [rdx + rsi + 0xac], xmm0
0094f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00954 c4817a6f8402bc000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xbc]
0095e c5fa7f8432bc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xbc], xmm0
00967 c4817a6f8402cc000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xcc]
00971 c5fa7f8432cc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xcc], xmm0
0097a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0097f c4817a6f8402dc000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xdc]
00989 c5fa7f8432dc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xdc], xmm0
00992 c4817a6f8402ec000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xec]
0099c c5fa7f8432ec000000             vmovdqu    xmmword ptr [rdx + rsi + 0xec], xmm0
009a5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
009aa c4817a6f8402fc000000           vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xfc]
009b4 c5fa7f8432fc000000             vmovdqu    xmmword ptr [rdx + rsi + 0xfc], xmm0
009bd 4181c100010000                 add        r9d, 0x100
009c4 443bc8                         cmp        r9d, eax
009c7 0f8ca3feffff                   jl         0x7f5bbbe700f0
009cd 453bce                         cmp        r9d, r14d
009d0 7d31                           jge        0x7f5bbbe70283
009d2 458bd9                         mov        r11d, r9d
009d5 666690                         nop        
009d8 468d141f                       lea        r10d, [rdi + r11]
009dc 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
009e1 c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
009e8 458bd3                         mov        r10d, r11d
009eb 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
009f3 c4817a7f44110c                 vmovdqu    xmmword ptr [r9 + r10 + 0xc], xmm0
009fa 4183c310                       add        r11d, 0x10
009fe 453bde                         cmp        r11d, r14d
00a01 7cd5                           jl         0x7f5bbbe70258
00a03 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00a08 4403d1                         add        r10d, ecx
00a0b 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00a10 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
00a17 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
00a1f e9c1000000                     jmp        0x7f5bbbe70365
00a24 85ed                           test       ebp, ebp
00a26 0f8cec0c0000                   jl         0x7f5bbbe70f98
00a2c 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
00a33 83c5f1                         add        ebp, -0xf
00a36 443bd5                         cmp        r10d, ebp
00a39 0f83ad0b0000                   jae        0x7f5bbbe70e6c
00a3f 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00a47 458b4808                       mov        r9d, dword ptr [r8 + 8]
00a4b 418bca                         mov        ecx, r10d
00a4e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a53 c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
00a5a 418d69f1                       lea        ebp, [r9 - 0xf]
00a5e 85ed                           test       ebp, ebp
00a60 0f8c2e0d0000                   jl         0x7f5bbbe71014
00a66 4183c1f1                       add        r9d, -0xf
00a6a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a6f 453bd1                         cmp        r10d, r9d
00a72 0f83f00b0000                   jae        0x7f5bbbe70ee8
00a78 4403d9                         add        r11d, ecx
00a7b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00a80 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a85 c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00a8c 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00a91 4503d3                         add        r10d, r11d
00a94 458bda                         mov        r11d, r10d
00a97 442b9c248c000000               sub        r11d, dword ptr [rsp + 0x8c]
00a9f 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00aa7 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00aaf eb34                           jmp        0x7f5bbbe70365
00ab1 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00ab6 4d63d3                         movsxd     r10, r11d
00ab9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ac0 c442a8f5db                     bzhi       r11, r11, r10
00ac5 c4c1fb92fb                     kmovq      k7, r11
00aca 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ad0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ad6 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
00add 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
00ae5 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00aed 458b5308                       mov        r10d, dword ptr [r11 + 8]
00af1 458d42f1                       lea        r8d, [r10 - 0xf]
00af5 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00afa 4183fb10                       cmp        r11d, 0x10
00afe 7f76                           jg         0x7f5bbbe703f6
00b00 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
00b08 4183f910                       cmp        r9d, 0x10
00b0c 7c68                           jl         0x7f5bbbe703f6
00b0e 4585c0                         test       r8d, r8d
00b11 0f8c75120000                   jl         0x7f5bbbe7160c
00b17 458bda                         mov        r11d, r10d
00b1a 4183c3f1                       add        r11d, -0xf
00b1e 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b26 453bd3                         cmp        r10d, r11d
00b29 0f83650f0000                   jae        0x7f5bbbe71314
00b2f 458bcb                         mov        r9d, r11d
00b32 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00b3a c4817a6f44100c                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 0xc]
00b41 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00b49 453bd3                         cmp        r10d, r11d
00b4c 0f83de0f0000                   jae        0x7f5bbbe713b0
00b52 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b5a 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
00b61 c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00b68 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00b6d 438d041a                       lea        eax, [r10 + r11]
00b71 e93df7ffff                     jmp        0x7f5bbbe6fb33
00b76 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00b7e 442b9c2488000000               sub        r11d, dword ptr [rsp + 0x88]
00b86 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00b8b 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00b93 4d8bd9                         mov        r11, r9
00b96 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
00b9e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00ba6 4183c308                       add        r11d, 8
00baa 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00baf 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00bb7 44034c2420                     add        r9d, dword ptr [rsp + 0x20]
00bbc 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
00bc1 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00bc9 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
00bce 0f8d5c030000                   jge        0x7f5bbbe707b0
00bd4 4183fb10                       cmp        r11d, 0x10
00bd8 0f8dca000000                   jge        0x7f5bbbe70528
00bde 4183fb08                       cmp        r11d, 8
00be2 7d50                           jge        0x7f5bbbe704b4
00be4 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00bec 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00bf3 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
00bfa 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00c02 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00c07 488b6c2448                     mov        rbp, qword ptr [rsp + 0x48]
00c0c 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00c11 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00c16 6690                           nop        
00c18 c5f877                         vzeroupper 
00c1b e8c003aaff                     call       0x7f5bbb910860
00c20 0f1f8400180d0004               nop        dword ptr [rax + rax + 0x4000d18]
00c28 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
00c2f e97ff6ffff                     jmp        0x7f5bbbe6fb33
00c34 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00c3c 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00c43 488b6c2448                     mov        rbp, qword ptr [rsp + 0x48]
00c48 c5f877                         vzeroupper 
00c4b e89003aaff                     call       0x7f5bbb910860
00c50 0f1f8400480d0005               nop        dword ptr [rax + rax + 0x5000d48]
00c58 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00c60 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00c67 488bc8                         mov        rcx, rax
00c6a 6690                           nop        
00c6c c5f877                         vzeroupper 
00c6f e86c03aaff                     call       0x7f5bbb910860
00c74 0f1f84006c0d0006               nop        dword ptr [rax + rax + 0x6000d6c]
00c7c 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00c81 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00c86 0f8d1c060000                   jge        0x7f5bbbe70b28
00c8c 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00c91 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c98 0f8f0a170000                   jg         0x7f5bbbe71c28
00c9e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00ca3 e9ad050000                     jmp        0x7f5bbbe70ad5
00ca8 4585c0                         test       r8d, r8d
00cab 0f8c1b150000                   jl         0x7f5bbbe71a4c
00cb1 458bda                         mov        r11d, r10d
00cb4 418d6bf1                       lea        ebp, [r11 - 0xf]
00cb8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00cc0 443bd5                         cmp        r10d, ebp
00cc3 0f83af120000                   jae        0x7f5bbbe717f8
00cc9 4963ca                         movsxd     rcx, r10d
00ccc 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00cd4 c4c17a6f44090c                 vmovdqu    xmm0, xmmword ptr [r9 + rcx + 0xc]
00cdb 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00ce3 443bc5                         cmp        r8d, ebp
00ce6 0f8308130000                   jae        0x7f5bbbe71874
00cec 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00cf3 448d4310                       lea        r8d, [rbx + 0x10]
00cf7 4c63cb                         movsxd     r9, ebx
00cfa 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
00d01 c4a17a7f440a0c                 vmovdqu    xmmword ptr [rdx + r9 + 0xc], xmm0
00d08 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
00d0d 0f8d09020000                   jge        0x7f5bbbe7079c
00d13 492bc9                         sub        rcx, r9
00d16 4963fb                         movsxd     rdi, r11d
00d19 4883c7f1                       add        rdi, -0xf
00d1d 4d63d8                         movsxd     r11, r8d
00d20 4d8d0c0b                       lea        r9, [r11 + rcx]
00d24 4c3bcf                         cmp        r9, rdi
00d27 0f8347130000                   jae        0x7f5bbbe718f4
00d2d 4863542478                     movsxd     rdx, dword ptr [rsp + 0x78]
00d32 4c8bca                         mov        r9, rdx
00d35 4d2bcb                         sub        r9, r11
00d38 4983c10f                       add        r9, 0xf
00d3c 4983e1f0                       and        r9, 0xfffffffffffffff0
00d40 458bc9                         mov        r9d, r9d
00d43 458d5c1910                     lea        r11d, [r9 + rbx + 0x10]
00d48 4d63db                         movsxd     r11, r11d
00d4b 4d8d4c0bf0                     lea        r9, [r11 + rcx - 0x10]
00d50 4c3bcf                         cmp        r9, rdi
00d53 0f831b130000                   jae        0x7f5bbbe718f4
00d59 443bc5                         cmp        r8d, ebp
00d5c 0f8312130000                   jae        0x7f5bbbe718f4
00d62 4983c3f0                       add        r11, -0x10
00d66 4c3bdf                         cmp        r11, rdi
00d69 0f8305130000                   jae        0x7f5bbbe718f4
00d6f 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d74 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00d7b 0f8f9f130000                   jg         0x7f5bbbe719a0
00d81 442bd3                         sub        r10d, ebx
00d84 83c320                         add        ebx, 0x20
00d87 458bd8                         mov        r11d, r8d
00d8a 438d0c02                       lea        ecx, [r10 + r8]
00d8e 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
00d95 c5fa6f440f0c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xc]
00d9b c4a17a7f441f0c                 vmovdqu    xmmword ptr [rdi + r11 + 0xc], xmm0
00da2 4183c010                       add        r8d, 0x10
00da6 443bc3                         cmp        r8d, ebx
00da9 7cdc                           jl         0x7f5bbbe70607
00dab 4881c210ffffff                 add        rdx, -0xf0
00db2 4881fa00000080                 cmp        rdx, -0x80000000
00db9 490f4cd5                       cmovl      rdx, r13
00dbd 8bd2                           mov        edx, edx
00dbf 443bc2                         cmp        r8d, edx
00dc2 0f8d24010000                   jge        0x7f5bbbe7076c
00dc8 0f1f840000000000               nop        dword ptr [rax + rax]
00dd0 458bd8                         mov        r11d, r8d
00dd3 4963db                         movsxd     rbx, r11d
00dd6 458bc8                         mov        r9d, r8d
00dd9 478d1c02                       lea        r11d, [r10 + r8]
00ddd 418bcb                         mov        ecx, r11d
00de0 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
00de7 c4a17a6f441f0c                 vmovdqu    xmm0, xmmword ptr [rdi + r11 + 0xc]
00dee c4a17a7f440f0c                 vmovdqu    xmmword ptr [rdi + r9 + 0xc], xmm0
00df5 4863c9                         movsxd     rcx, ecx
00df8 c5fa6f440f1c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x1c]
00dfe c5fa7f441f1c                   vmovdqu    xmmword ptr [rdi + rbx + 0x1c], xmm0
00e04 c5fa6f440f2c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x2c]
00e0a c5fa7f441f2c                   vmovdqu    xmmword ptr [rdi + rbx + 0x2c], xmm0
00e10 c5fa6f440f3c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x3c]
00e16 c5fa7f441f3c                   vmovdqu    xmmword ptr [rdi + rbx + 0x3c], xmm0
00e1c c5fa6f440f4c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x4c]
00e22 c5fa7f441f4c                   vmovdqu    xmmword ptr [rdi + rbx + 0x4c], xmm0
00e28 c5fa6f440f5c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x5c]
00e2e c5fa7f441f5c                   vmovdqu    xmmword ptr [rdi + rbx + 0x5c], xmm0
00e34 c5fa6f440f6c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x6c]
00e3a c5fa7f441f6c                   vmovdqu    xmmword ptr [rdi + rbx + 0x6c], xmm0
00e40 c5fa6f440f7c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x7c]
00e46 c5fa7f441f7c                   vmovdqu    xmmword ptr [rdi + rbx + 0x7c], xmm0
00e4c c5fa6f840f8c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x8c]
00e55 c5fa7f841f8c000000             vmovdqu    xmmword ptr [rdi + rbx + 0x8c], xmm0
00e5e c5fa6f840f9c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x9c]
00e67 c5fa7f841f9c000000             vmovdqu    xmmword ptr [rdi + rbx + 0x9c], xmm0
00e70 c5fa6f840fac000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xac]
00e79 c5fa7f841fac000000             vmovdqu    xmmword ptr [rdi + rbx + 0xac], xmm0
00e82 c5fa6f840fbc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xbc]
00e8b c5fa7f841fbc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xbc], xmm0
00e94 c5fa6f840fcc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xcc]
00e9d c5fa7f841fcc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xcc], xmm0
00ea6 c5fa6f840fdc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xdc]
00eaf c5fa7f841fdc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xdc], xmm0
00eb8 c5fa6f840fec000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xec]
00ec1 c5fa7f841fec000000             vmovdqu    xmmword ptr [rdi + rbx + 0xec], xmm0
00eca c5fa6f840ffc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xfc]
00ed3 c5fa7f841ffc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xfc], xmm0
00edc 4181c000010000                 add        r8d, 0x100
00ee3 443bc2                         cmp        r8d, edx
00ee6 0f8ce4feffff                   jl         0x7f5bbbe70650
00eec 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
00ef1 7d29                           jge        0x7f5bbbe7079c
00ef3 90                             nop        
00ef4 478d1c02                       lea        r11d, [r10 + r8]
00ef8 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00f00 c4817a6f44190c                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 0xc]
00f07 458bd8                         mov        r11d, r8d
00f0a c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
00f11 4183c010                       add        r8d, 0x10
00f15 443b442478                     cmp        r8d, dword ptr [rsp + 0x78]
00f1a 7cd8                           jl         0x7f5bbbe70774
00f1c 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00f21 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
00f28 418bc2                         mov        eax, r10d
00f2b e983f3ffff                     jmp        0x7f5bbbe6fb33
00f30 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00f35 4183fb30                       cmp        r11d, 0x30
00f39 7f75                           jg         0x7f5bbbe70830
00f3b 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00f43 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00f4a 488b6c2448                     mov        rbp, qword ptr [rsp + 0x48]
00f4f 90                             nop        
00f50 c5f877                         vzeroupper 
00f53 e88800aaff                     call       0x7f5bbb910860
00f58 0f1f840050100007               nop        dword ptr [rax + rax + 0x7001050]
00f60 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00f68 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00f6f 488bc8                         mov        rcx, rax
00f72 6690                           nop        
00f74 c5f877                         vzeroupper 
00f77 e86400aaff                     call       0x7f5bbb910860
00f7c 0f1f840074100008               nop        dword ptr [rax + rax + 0x8001074]
00f84 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00f89 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00f8e 0f8db1000000                   jge        0x7f5bbbe708c5
00f94 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00f99 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00fa0 0f8f56130000                   jg         0x7f5bbbe71b7c
00fa6 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00fab e945f2ffff                     jmp        0x7f5bbbe6fa75
00fb0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00fb8 4585db                         test       r11d, r11d
00fbb 0f8caf120000                   jl         0x7f5bbbe71af0
00fc1 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00fc9 4585c0                         test       r8d, r8d
00fcc 0f8c9e120000                   jl         0x7f5bbbe71af0
00fd2 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
00fd7 44038424a0000000               add        r8d, dword ptr [rsp + 0xa0]
00fdf 453bd0                         cmp        r10d, r8d
00fe2 0f8288120000                   jb         0x7f5bbbe71af0
00fe8 453bd1                         cmp        r10d, r9d
00feb 0f827f120000                   jb         0x7f5bbbe71af0
00ff1 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00ff6 4585d2                         test       r10d, r10d
00ff9 744a                           je         0x7f5bbbe708c5
00ffb 458bda                         mov        r11d, r10d
00ffe 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
01006 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0100e 4b8d7c100c                     lea        rdi, [r8 + r10 + 0xc]
01013 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0101b 4b8d74100c                     lea        rsi, [r8 + r10 + 0xc]
01020 4963d3                         movsxd     rdx, r11d
01023 4883fa20                       cmp        rdx, 0x20
01027 0f8620f2ffff                   jbe        0x7f5bbbe6facd
0102d c5f877                         vzeroupper 
01030 49ba209f8fbb5b7f0000           movabs     r10, 0x7f5bbb8f9f20
0103a 41ffd2                         call       r10
0103d 0f1f840000000000               nop        dword ptr [rax + rax]
01045 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0104a 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
01051 418bc3                         mov        eax, r11d
01054 e95af2ffff                     jmp        0x7f5bbbe6fb33
01059 4533c0                         xor        r8d, r8d
0105c e9faf2ffff                     jmp        0x7f5bbbe6fbdb
01061 4d2bd9                         sub        r11, r9
01064 4d85db                         test       r11, r11
01067 0f8d67020000                   jge        0x7f5bbbe70b54
0106d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01072 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
01076 4d85d2                         test       r10, r10
01079 0f8555020000                   jne        0x7f5bbbe70b54
0107f bd08000000                     mov        ebp, 8
01084 be17000000                     mov        esi, 0x17
01089 666690                         nop        
0108c c5f877                         vzeroupper 
0108f e84c74b6ff                     call       0x7f5bbb9d7d60
01094 0f1f84008c110009               nop        dword ptr [rax + rax + 0x900118c]
0109c 4d03cb                         add        r9, r11
0109f 4d3bce                         cmp        r9, r14
010a2 7e08                           jle        0x7f5bbbe7092c
010a4 4533ed                         xor        r13d, r13d
010a7 e9feefffff                     jmp        0x7f5bbbe6f92a
010ac 4533ed                         xor        r13d, r13d
010af bd01000000                     mov        ebp, 1
010b4 e9f3efffff                     jmp        0x7f5bbbe6f92c
010b9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
010be 442b5c2414                     sub        r11d, dword ptr [rsp + 0x14]
010c3 85c9                           test       ecx, ecx
010c5 0f8469070000                   je         0x7f5bbbe710b4
010cb 4c8bc1                         mov        r8, rcx
010ce 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
010d3 4585d2                         test       r10d, r10d
010d6 0f8c69070000                   jl         0x7f5bbbe710c5
010dc 488b5c2448                     mov        rbx, qword ptr [rsp + 0x48]
010e1 4c8b4c2450                     mov        r9, qword ptr [rsp + 0x50]
010e6 8bb424a4000000                 mov        esi, dword ptr [rsp + 0xa4]
010ed e95df0ffff                     jmp        0x7f5bbbe6f9cf
010f2 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
010fa 448b4908                       mov        r9d, dword ptr [rcx + 8]
010fe 4585c9                         test       r9d, r9d
01101 0f864f070000                   jbe        0x7f5bbbe710d6
01107 8b690c                         mov        ebp, dword ptr [rcx + 0xc]
0110a e9a8f4ffff                     jmp        0x7f5bbbe6fe37
0110f 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
01117 448b5908                       mov        r11d, dword ptr [rcx + 8]
0111b 4183fb02                       cmp        r11d, 2
0111f 0f86b7070000                   jbe        0x7f5bbbe7115c
01125 8b690c                         mov        ebp, dword ptr [rcx + 0xc]
01128 ffcd                           dec        ebp
0112a 85ed                           test       ebp, ebp
0112c 7e29                           jle        0x7f5bbbe709d7
0112e 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01136 458b4b10                       mov        r9d, dword ptr [r11 + 0x10]
0113a 45894b14                       mov        dword ptr [r11 + 0x14], r9d
0113e 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
01142 41894b10                       mov        dword ptr [r11 + 0x10], ecx
01146 41896b0c                       mov        dword ptr [r11 + 0xc], ebp
0114a 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
01152 e960f4ffff                     jmp        0x7f5bbbe6fe37
01157 48be6001cde200000000           movabs     rsi, 0xe2cd0160
01161 488bea                         mov        rbp, rdx
01164 48ffb424d8000000               push       qword ptr [rsp + 0xd8]
0116c 488f8424d0000000               pop        qword ptr [rsp + 0xd0]
01174 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01179 44898c24d8000000               mov        dword ptr [rsp + 0xd8], r9d
01181 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01189 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0118e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01193 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01198 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0119d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
011a2 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011a7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
011ac 4c89542420                     mov        qword ptr [rsp + 0x20], r10
011b1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
011b6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
011bb 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
011c0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
011c5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
011ca 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
011cf 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
011d4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
011d9 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
011de 4c89542450                     mov        qword ptr [rsp + 0x50], r10
011e3 4489442464                     mov        dword ptr [rsp + 0x64], r8d
011e8 c5f877                         vzeroupper 
011eb e8f0fda9ff                     call       0x7f5bbb910860
011f0 0f1f8400e812000a               nop        dword ptr [rax + rax + 0xa0012e8]
011f8 4885c0                         test       rax, rax
011fb 0f85acf1ffff                   jne        0x7f5bbbe6fc2d
01201 bef6ffffff                     mov        esi, 0xfffffff6
01206 6690                           nop        
01208 c5f877                         vzeroupper 
0120b e8d072b6ff                     call       0x7f5bbb9d7d60
01210 0f1f84000813000b               nop        dword ptr [rax + rax + 0xb001308]
01218 4c63c3                         movsxd     r8, ebx
0121b 4c3b442460                     cmp        r8, qword ptr [rsp + 0x60]
01220 7c1f                           jl         0x7f5bbbe70ac1
01222 4c3b4c2468                     cmp        r9, qword ptr [rsp + 0x68]
01227 7e0d                           jle        0x7f5bbbe70ab6
01229 4533c0                         xor        r8d, r8d
0122c 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01231 e9e4f3ffff                     jmp        0x7f5bbbe6fe9a
01236 33c9                           xor        ecx, ecx
01238 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
0123c e9ccf3ffff                     jmp        0x7f5bbbe6fe8d
01241 33c9                           xor        ecx, ecx
01243 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01247 e9cef3ffff                     jmp        0x7f5bbbe6fe9a
0124c 0f1f4000                       nop        dword ptr [rax]
01250 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01255 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01259 036c240c                       add        ebp, dword ptr [rsp + 0xc]
0125d 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
01265 8bd5                           mov        edx, ebp
01267 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0126c c5f877                         vzeroupper 
0126f e86cfda9ff                     call       0x7f5bbb910860
01274 0f1f84006c13000c               nop        dword ptr [rax + rax + 0xc00136c]
0127c 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01281 8b542410                       mov        edx, dword ptr [rsp + 0x10]
01285 488bc8                         mov        rcx, rax
01288 c5f877                         vzeroupper 
0128b e850fda9ff                     call       0x7f5bbb910860
01290 0f1f84008813000d               nop        dword ptr [rax + rax + 0xd001388]
01298 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0129d 4183c308                       add        r11d, 8
012a1 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
012a6 7ca8                           jl         0x7f5bbbe70ad0
012a8 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
012ad 8b8c24a8000000                 mov        ecx, dword ptr [rsp + 0xa8]
012b4 418bc3                         mov        eax, r11d
012b7 e9f7efffff                     jmp        0x7f5bbbe6fb33
012bc be17000000                     mov        esi, 0x17
012c1 666690                         nop        
012c4 c5f877                         vzeroupper 
012c7 e81472b6ff                     call       0x7f5bbb9d7d60
012cc 0f1f8400c413000e               nop        dword ptr [rax + rax + 0xe0013c4]
012d4 bd02000000                     mov        ebp, 2
012d9 e9a6fdffff                     jmp        0x7f5bbbe70904
012de be17000000                     mov        esi, 0x17
012e3 90                             nop        
012e4 c5f877                         vzeroupper 
012e7 e8f471b6ff                     call       0x7f5bbb9d7d60
012ec 0f1f8400e413000f               nop        dword ptr [rax + rax + 0xf0013e4]
012f4 bee4ffffff                     mov        esi, 0xffffffe4
012f9 488bea                         mov        rbp, rdx
012fc 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01304 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0130c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01311 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
01319 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0131e 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01323 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01328 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0132d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01332 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01337 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0133c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01341 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01346 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0134b 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01350 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01355 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0135a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0135f 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01364 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01369 666690                         nop        
0136c c5f877                         vzeroupper 
0136f e86c71b6ff                     call       0x7f5bbb9d7d60
01374 0f1f84006c140010               nop        dword ptr [rax + rax + 0x1000146c]
0137c bee4ffffff                     mov        esi, 0xffffffe4
01381 488bea                         mov        rbp, rdx
01384 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01389 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0138e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01393 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01398 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0139d 895c2420                       mov        dword ptr [rsp + 0x20], ebx
013a1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
013a6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
013ab 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
013b0 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
013b5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
013ba 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
013bf 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
013c4 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
013c9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
013ce 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
013d3 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
013d8 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
013dd 4489442474                     mov        dword ptr [rsp + 0x74], r8d
013e2 6690                           nop        
013e4 c5f877                         vzeroupper 
013e7 e8f470b6ff                     call       0x7f5bbb9d7d60
013ec 0f1f8400e4140011               nop        dword ptr [rax + rax + 0x110014e4]
013f4 8be8                           mov        ebp, eax
013f6 eb0a                           jmp        0x7f5bbbe70c82
013f8 8be8                           mov        ebp, eax
013fa eb06                           jmp        0x7f5bbbe70c82
013fc 8be8                           mov        ebp, eax
013fe eb02                           jmp        0x7f5bbbe70c82
01400 8be8                           mov        ebp, eax
01402 beccffffff                     mov        esi, 0xffffffcc
01407 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0140f 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
01417 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
0141c 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01421 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01426 6690                           nop        
01428 c5f877                         vzeroupper 
0142b e8b070b6ff                     call       0x7f5bbb9d7d60
01430 0f1f840028150012               nop        dword ptr [rax + rax + 0x12001528]
01438 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0143d 8be8                           mov        ebp, eax
0143f 4533c0                         xor        r8d, r8d
01442 bef6ffffff                     mov        esi, 0xfffffff6
01447 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0144f 4c898c24d8000000               mov        qword ptr [rsp + 0xd8], r9
01457 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0145f 90                             nop        
01460 c5f877                         vzeroupper 
01463 e87870b6ff                     call       0x7f5bbb9d7d60
01468 0f1f840060150013               nop        dword ptr [rax + rax + 0x13001560]
01470 be6effffff                     mov        esi, 0xffffff6e
01475 48899424d0000000               mov        qword ptr [rsp + 0xd0], rdx
0147d 897c240c                       mov        dword ptr [rsp + 0xc], edi
01481 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
01486 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
0148b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01490 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01495 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0149a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0149f 48894424f8                     mov        qword ptr [rsp - 8], rax
014a4 8b442458                       mov        eax, dword ptr [rsp + 0x58]
014a8 89442434                       mov        dword ptr [rsp + 0x34], eax
014ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014b1 48ff742440                     push       qword ptr [rsp + 0x40]
014b6 488f442438                     pop        qword ptr [rsp + 0x38]
014bb 4c896c2440                     mov        qword ptr [rsp + 0x40], r13
014c0 4c89742448                     mov        qword ptr [rsp + 0x48], r14
014c5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
014ca 89442454                       mov        dword ptr [rsp + 0x54], eax
014ce 894c2458                       mov        dword ptr [rsp + 0x58], ecx
014d2 6690                           nop        
014d4 c5f877                         vzeroupper 
014d7 e80470b6ff                     call       0x7f5bbb9d7d60
014dc 0f1f8400d4150014               nop        dword ptr [rax + rax + 0x140015d4]
014e4 bee4ffffff                     mov        esi, 0xffffffe4
014e9 488bea                         mov        rbp, rdx
014ec 4489542414                     mov        dword ptr [rsp + 0x14], r10d
014f1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
014f6 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
014fb 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01500 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01505 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01509 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
0150e 6690                           nop        
01510 c5f877                         vzeroupper 
01513 e8c86fb6ff                     call       0x7f5bbb9d7d60
01518 0f1f840010160015               nop        dword ptr [rax + rax + 0x15001610]
01520 bef6ffffff                     mov        esi, 0xfffffff6
01525 666690                         nop        
01528 c5f877                         vzeroupper 
0152b e8b06fb6ff                     call       0x7f5bbb9d7d60
01530 0f1f840028160016               nop        dword ptr [rax + rax + 0x16001628]
01538 bee4ffffff                     mov        esi, 0xffffffe4
0153d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01542 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01547 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0154c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01551 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01556 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0155b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01560 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01565 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0156a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0156f 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01574 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01579 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0157e 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01583 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01588 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0158d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01592 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01597 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0159c 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
015a1 666690                         nop        
015a4 c5f877                         vzeroupper 
015a7 e8346fb6ff                     call       0x7f5bbb9d7d60
015ac 0f1f8400a4160017               nop        dword ptr [rax + rax + 0x170016a4]
015b4 be6effffff                     mov        esi, 0xffffff6e
015b9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015be 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
015c3 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
015c8 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
015cd 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
015d2 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
015d6 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
015db 90                             nop        
015dc c5f877                         vzeroupper 
015df e8fc6eb6ff                     call       0x7f5bbb9d7d60
015e4 0f1f8400dc160018               nop        dword ptr [rax + rax + 0x180016dc]
015ec bee4ffffff                     mov        esi, 0xffffffe4
015f1 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
015f6 4489442418                     mov        dword ptr [rsp + 0x18], r8d
015fb 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01600 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01605 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0160a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0160f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01614 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01619 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0161e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01623 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01628 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0162d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01632 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01637 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0163c 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01641 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01646 48894424f8                     mov        qword ptr [rsp - 8], rax
0164b 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0164f 89442474                       mov        dword ptr [rsp + 0x74], eax
01653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01658 c5f877                         vzeroupper 
0165b e8806eb6ff                     call       0x7f5bbb9d7d60
01660 0f1f840058170019               nop        dword ptr [rax + rax + 0x19001758]
01668 bee4ffffff                     mov        esi, 0xffffffe4
0166d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01675 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
0167d 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01685 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0168a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0168f 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01694 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01699 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0169e 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016a3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016a8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016ad 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
016b2 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
016b7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
016bc 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
016c1 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
016c5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
016ca 4489542448                     mov        dword ptr [rsp + 0x48], r10d
016cf 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
016d4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
016d9 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
016de 4c89542458                     mov        qword ptr [rsp + 0x58], r10
016e3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
016e8 4489542460                     mov        dword ptr [rsp + 0x60], r10d
016ed 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
016f5 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
016fa 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
016ff c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01708 c5f877                         vzeroupper 
0170b e8d06db6ff                     call       0x7f5bbb9d7d60
01710 0f1f84000818001a               nop        dword ptr [rax + rax + 0x1a001808]
01718 beccffffff                     mov        esi, 0xffffffcc
0171d 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01722 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01727 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0172c 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01731 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01736 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0173b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01740 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01745 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0174a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0174f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01754 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01759 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0175e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01763 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01768 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0176d 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01772 48894424f8                     mov        qword ptr [rsp - 8], rax
01777 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0177b 89442474                       mov        dword ptr [rsp + 0x74], eax
0177f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01784 c5f877                         vzeroupper 
01787 e8546db6ff                     call       0x7f5bbb9d7d60
0178c 0f1f84008418001b               nop        dword ptr [rax + rax + 0x1b001884]
01794 beccffffff                     mov        esi, 0xffffffcc
01799 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0179e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
017a3 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
017a8 4489542418                     mov        dword ptr [rsp + 0x18], r10d
017ad 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
017b2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017b7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
017bc 4c89542448                     mov        qword ptr [rsp + 0x48], r10
017c1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017c6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
017cb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
017d0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
017d5 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
017d9 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
017de 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
017e3 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
017e8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017ed 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
017f2 4c89542460                     mov        qword ptr [rsp + 0x60], r10
017f7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
017fc 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01801 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01806 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
0180b 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01813 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01818 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01821 666690                         nop        
01824 c5f877                         vzeroupper 
01827 e8b46cb6ff                     call       0x7f5bbb9d7d60
0182c 0f1f84002419001c               nop        dword ptr [rax + rax + 0x1c001924]
01834 8be8                           mov        ebp, eax
01836 4c8b4c2450                     mov        r9, qword ptr [rsp + 0x50]
0183b 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01840 e9fdfbffff                     jmp        0x7f5bbbe70cc2
01845 8be8                           mov        ebp, eax
01847 488b5c2448                     mov        rbx, qword ptr [rsp + 0x48]
0184c 4c8b4c2450                     mov        r9, qword ptr [rsp + 0x50]
01851 e9acfbffff                     jmp        0x7f5bbbe70c82
01856 bee4ffffff                     mov        esi, 0xffffffe4
0185b 488bea                         mov        rbp, rdx
0185e 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01863 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
0186b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01870 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01875 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0187a 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0187f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01884 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
01889 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0188e 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01893 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01898 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0189d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
018a2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018a7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
018ac 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
018b1 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
018b6 4c89542450                     mov        qword ptr [rsp + 0x50], r10
018bb 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018c0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018c5 4489442468                     mov        dword ptr [rsp + 0x68], r8d
018ca 6690                           nop        
018cc c5f877                         vzeroupper 
018cf e80c6cb6ff                     call       0x7f5bbb9d7d60
018d4 0f1f8400cc19001d               nop        dword ptr [rax + rax + 0x1d0019cc]
018dc bee4ffffff                     mov        esi, 0xffffffe4
018e1 488bea                         mov        rbp, rdx
018e4 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
018e9 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
018f1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018f6 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
018fb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01900 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01905 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0190a 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
0190f 48894c2420                     mov        qword ptr [rsp + 0x20], rcx
01914 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01919 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0191e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01923 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01928 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0192d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01932 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01937 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0193c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01941 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01946 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0194b 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01950 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01955 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0195a 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0195f 90                             nop        
01960 c5f877                         vzeroupper 
01963 e8786bb6ff                     call       0x7f5bbb9d7d60
01968 0f1f8400601a001e               nop        dword ptr [rax + rax + 0x1e001a60]
01970 bee4ffffff                     mov        esi, 0xffffffe4
01975 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
0197a 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0197f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01984 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01989 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0198e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01993 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01998 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0199d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
019a2 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
019a7 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
019af 90                             nop        
019b0 c5f877                         vzeroupper 
019b3 e8286bb6ff                     call       0x7f5bbb9d7d60
019b8 0f1f8400b01a001f               nop        dword ptr [rax + rax + 0x1f001ab0]
019c0 bee4ffffff                     mov        esi, 0xffffffe4
019c5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
019cd 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
019d5 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
019dd 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
019e2 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
019ea 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
019ef 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019f4 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
019f9 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019fe 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01a03 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a08 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a0d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01a12 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a17 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a1c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01a21 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01a26 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a2b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a30 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a35 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01a3a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a3f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01a44 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01a49 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01a4e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a53 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a57 89442468                       mov        dword ptr [rsp + 0x68], eax
01a5b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a60 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01a68 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01a6d 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01a72 894c2474                       mov        dword ptr [rsp + 0x74], ecx
01a76 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01a7b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01a84 c5f877                         vzeroupper 
01a87 e8546ab6ff                     call       0x7f5bbb9d7d60
01a8c 0f1f8400841b0020               nop        dword ptr [rax + rax + 0x20001b84]
01a94 bee4ffffff                     mov        esi, 0xffffffe4
01a99 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01aa1 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
01aa9 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01ab1 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01ab6 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
01abe 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
01ac3 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01ac8 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01acd 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01ad2 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
01ad7 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01adc 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01ae1 4c89442420                     mov        qword ptr [rsp + 0x20], r8
01ae6 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01aeb 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01af0 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01af5 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01afa 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
01aff 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01b04 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
01b09 4c89442450                     mov        qword ptr [rsp + 0x50], r8
01b0e 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01b13 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01b18 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01b1d 666690                         nop        
01b20 c5f877                         vzeroupper 
01b23 e8b869b6ff                     call       0x7f5bbb9d7d60
01b28 0f1f8400201c0021               nop        dword ptr [rax + rax + 0x21001c20]
01b30 bee4ffffff                     mov        esi, 0xffffffe4
01b35 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b3d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01b45 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01b4d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01b52 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01b5a 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01b5f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b64 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01b69 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01b6e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b73 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b78 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b7d 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b82 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b87 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b8c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b91 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b96 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01b9b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ba0 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01ba5 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01baa 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01baf 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01bb4 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01bb9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01bbe 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01bc3 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01bc8 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01bcd 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01bd2 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
01bd7 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
01bdd 666690                         nop        
01be0 c5f877                         vzeroupper 
01be3 e8f868b6ff                     call       0x7f5bbb9d7d60
01be8 0f1f8400e01c0022               nop        dword ptr [rax + rax + 0x22001ce0]
01bf0 beccffffff                     mov        esi, 0xffffffcc
01bf5 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01bfa 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01bff 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01c04 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01c09 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c0e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01c13 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c18 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c1d 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01c22 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01c27 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
01c2f 90                             nop        
01c30 c5f877                         vzeroupper 
01c33 e8a868b6ff                     call       0x7f5bbb9d7d60
01c38 0f1f8400301d0023               nop        dword ptr [rax + rax + 0x23001d30]
01c40 beccffffff                     mov        esi, 0xffffffcc
01c45 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01c4d 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01c55 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01c5d 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01c62 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c67 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01c6c 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01c71 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c76 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c7b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c80 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01c85 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01c8a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01c8f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01c94 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01c99 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01c9e 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01ca3 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01ca8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01cad 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01cb2 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01cb7 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01cbc c5f877                         vzeroupper 
01cbf e81c68b6ff                     call       0x7f5bbb9d7d60
01cc4 0f1f8400bc1d0024               nop        dword ptr [rax + rax + 0x24001dbc]
01ccc beccffffff                     mov        esi, 0xffffffcc
01cd1 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01cd6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01cdb 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01ce0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01ce5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01cea 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cef 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cf4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01cf9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cfe 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01d03 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d08 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01d0d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01d12 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01d17 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01d1c 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01d21 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d26 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01d2b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01d30 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01d35 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d3a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01d3f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01d44 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01d49 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d52 89442470                       mov        dword ptr [rsp + 0x70], eax
01d56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5b 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01d63 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01d68 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01d6d 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01d71 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01d7a 6690                           nop        
01d7c c5f877                         vzeroupper 
01d7f e85c67b6ff                     call       0x7f5bbb9d7d60
01d84 0f1f84007c1e0025               nop        dword ptr [rax + rax + 0x25001e7c]
01d8c beccffffff                     mov        esi, 0xffffffcc
01d91 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01d99 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01da1 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01da9 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01dae 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01db6 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01dbb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01dc0 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01dc5 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01dca 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01dcf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dd4 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01dd9 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01dde 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01de3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01de8 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ded 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01df2 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01df7 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01dfc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e01 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e06 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01e0b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e10 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01e15 666690                         nop        
01e18 c5f877                         vzeroupper 
01e1b e8c066b6ff                     call       0x7f5bbb9d7d60
01e20 0f1f8400181f0026               nop        dword ptr [rax + rax + 0x26001f18]
01e28 8be9                           mov        ebp, ecx
01e2a 83c510                         add        ebp, 0x10
01e2d be6effffff                     mov        esi, 0xffffff6e
01e32 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01e37 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e3c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01e41 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e46 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01e4b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e50 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e55 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e5a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e5f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01e64 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01e69 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01e6e 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01e72 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01e77 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01e7c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e81 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e86 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01e8b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e90 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e95 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01e9a 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01e9f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ea4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ead 89442464                       mov        dword ptr [rsp + 0x64], eax
01eb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb6 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
01ebb 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01ec0 c5f877                         vzeroupper 
01ec3 e81866b6ff                     call       0x7f5bbb9d7d60
01ec8 0f1f8400c01f0027               nop        dword ptr [rax + rax + 0x27001fc0]
01ed0 8be9                           mov        ebp, ecx
01ed2 83c510                         add        ebp, 0x10
01ed5 be66ffffff                     mov        esi, 0xffffff66
01eda 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01edf 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01ee4 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01ee9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01eee 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ef3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ef8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01efd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f02 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f07 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01f0c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01f11 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01f16 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01f1a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01f1f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f24 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01f29 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f2e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01f33 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01f38 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f3d 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01f42 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01f47 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01f4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01f51 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f55 89442464                       mov        dword ptr [rsp + 0x64], eax
01f59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f5e 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
01f63 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01f68 c5f877                         vzeroupper 
01f6b e87065b6ff                     call       0x7f5bbb9d7d60
01f70 0f1f840068200028               nop        dword ptr [rax + rax + 0x28002068]
01f78 bee4ffffff                     mov        esi, 0xffffffe4
01f7d 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01f82 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f87 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01f8c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f91 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01f96 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f9b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fa0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fa5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01faa 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01faf 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01fb4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01fb9 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01fbe 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01fc3 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01fc8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01fcd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01fd2 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01fd7 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01fdc 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01fe1 666690                         nop        
01fe4 c5f877                         vzeroupper 
01fe7 e8f464b6ff                     call       0x7f5bbb9d7d60
01fec 0f1f8400e4200029               nop        dword ptr [rax + rax + 0x290020e4]
01ff4 bee4ffffff                     mov        esi, 0xffffffe4
01ff9 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01ffe 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02003 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
02008 4489442414                     mov        dword ptr [rsp + 0x14], r8d
0200d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02012 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02017 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0201c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02021 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02026 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0202b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02030 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02035 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0203a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0203f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02044 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02049 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0204e 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02056 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0205b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
02064 c5f877                         vzeroupper 
02067 e87464b6ff                     call       0x7f5bbb9d7d60
0206c 0f1f84006421002a               nop        dword ptr [rax + rax + 0x2a002164]
02074 4183c210                       add        r10d, 0x10
02078 be6effffff                     mov        esi, 0xffffff6e
0207d 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
02085 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0208d 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02095 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0209a 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
020a2 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
020a7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020ac 4489542414                     mov        dword ptr [rsp + 0x14], r10d
020b1 4489442418                     mov        dword ptr [rsp + 0x18], r8d
020b6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
020bb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
020c0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020c5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
020ca 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
020cf 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
020d4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
020d9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
020de 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
020e3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
020e8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
020ed 4c89542450                     mov        qword ptr [rsp + 0x50], r10
020f2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
020f7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
020fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02101 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02105 89442464                       mov        dword ptr [rsp + 0x64], eax
02109 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210e 6690                           nop        
02110 c5f877                         vzeroupper 
02113 e8c863b6ff                     call       0x7f5bbb9d7d60
02118 0f1f84001022002b               nop        dword ptr [rax + rax + 0x2b002210]
02120 4183c210                       add        r10d, 0x10
02124 be66ffffff                     mov        esi, 0xffffff66
02129 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
02131 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
02139 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02141 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
02146 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0214e 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
02153 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
02158 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0215d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02162 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02167 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0216c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02171 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02176 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0217b 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02180 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02185 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0218a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0218f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02194 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02199 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0219e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
021a3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
021a8 48894424f8                     mov        qword ptr [rsp - 8], rax
021ad 8b442478                       mov        eax, dword ptr [rsp + 0x78]
021b1 89442464                       mov        dword ptr [rsp + 0x64], eax
021b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ba 6690                           nop        
021bc c5f877                         vzeroupper 
021bf e81c63b6ff                     call       0x7f5bbb9d7d60
021c4 0f1f8400bc22002c               nop        dword ptr [rax + rax + 0x2c0022bc]
021cc beccffffff                     mov        esi, 0xffffffcc
021d1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
021d9 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
021e1 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
021e9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
021ee 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
021f6 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
021fb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02200 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02205 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0220a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0220f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02214 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02219 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0221e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02223 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02228 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0222d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02232 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02237 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0223c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02241 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02246 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0224b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02250 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02255 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0225a 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0225f 90                             nop        
02260 c5f877                         vzeroupper 
02263 e87862b6ff                     call       0x7f5bbb9d7d60
02268 0f1f84006023002d               nop        dword ptr [rax + rax + 0x2d002360]
02270 beccffffff                     mov        esi, 0xffffffcc
02275 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
0227d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
02285 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0228d 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
02292 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0229a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0229f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
022a4 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
022a9 4489542410                     mov        dword ptr [rsp + 0x10], r10d
022ae 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
022b3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
022b8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
022bd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022c2 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
022c7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
022cc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
022d1 4c89542458                     mov        qword ptr [rsp + 0x58], r10
022d6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022db 4c89542460                     mov        qword ptr [rsp + 0x60], r10
022e0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
022e5 4489542454                     mov        dword ptr [rsp + 0x54], r10d
022ea 6690                           nop        
022ec c5f877                         vzeroupper 
022ef e8ec61b6ff                     call       0x7f5bbb9d7d60
022f4 0f1f8400ec23002e               nop        dword ptr [rax + rax + 0x2e0023ec]
022fc 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
02303 83c508                         add        ebp, 8
02306 be66ffffff                     mov        esi, 0xffffff66
0230b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
02310 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02315 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0231a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0231f 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
02324 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02329 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0232e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02333 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02338 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0233d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02342 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02347 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0234c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02351 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02356 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0235b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02360 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02365 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0236a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0236f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02374 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02379 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0237e 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
02383 48894424f8                     mov        qword ptr [rsp - 8], rax
02388 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0238c 8944246c                       mov        dword ptr [rsp + 0x6c], eax
02390 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02395 666690                         nop        
02398 c5f877                         vzeroupper 
0239b e84061b6ff                     call       0x7f5bbb9d7d60
023a0 0f1f84009824002f               nop        dword ptr [rax + rax + 0x2f002498]
023a8 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
023af 83c508                         add        ebp, 8
023b2 be66ffffff                     mov        esi, 0xffffff66
023b7 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
023bc 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
023c1 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
023c6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
023cb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
023d0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023d5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023da 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023df 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
023e4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
023e9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023ee 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
023f3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
023f8 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
023fd 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02402 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02407 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0240c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02411 48894424f8                     mov        qword ptr [rsp - 8], rax
02416 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0241a 89442464                       mov        dword ptr [rsp + 0x64], eax
0241e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02423 90                             nop        
02424 c5f877                         vzeroupper 
02427 e8b460b6ff                     call       0x7f5bbb9d7d60
0242c 0f1f840024250030               nop        dword ptr [rax + rax + 0x30002524]
02434 bef6ffffff                     mov        esi, 0xfffffff6
02439 666690                         nop        
0243c c5f877                         vzeroupper 
0243f e89c60b6ff                     call       0x7f5bbb9d7d60
02444 0f1f84003c250031               nop        dword ptr [rax + rax + 0x3100253c]
0244c bef6ffffff                     mov        esi, 0xfffffff6
02451 8b6c241c                       mov        ebp, dword ptr [rsp + 0x1c]
02455 666690                         nop        
02458 c5f877                         vzeroupper 
0245b e88060b6ff                     call       0x7f5bbb9d7d60
02460 0f1f840058250032               nop        dword ptr [rax + rax + 0x32002558]
02468 bef6ffffff                     mov        esi, 0xfffffff6
0246d 666690                         nop        
02470 c5f877                         vzeroupper 
02473 e86860b6ff                     call       0x7f5bbb9d7d60
02478 0f1f840070250033               nop        dword ptr [rax + rax + 0x33002570]
02480 bef6ffffff                     mov        esi, 0xfffffff6
02485 8beb                           mov        ebp, ebx
02487 90                             nop        
02488 c5f877                         vzeroupper 
0248b e85060b6ff                     call       0x7f5bbb9d7d60
02490 0f1f840088250034               nop        dword ptr [rax + rax + 0x34002588]
02498 eb14                           jmp        0x7f5bbbe71d2e
0249a eb12                           jmp        0x7f5bbbe71d2e
0249c eb10                           jmp        0x7f5bbbe71d2e
0249e eb0e                           jmp        0x7f5bbbe71d2e
024a0 eb0c                           jmp        0x7f5bbbe71d2e
024a2 eb0a                           jmp        0x7f5bbbe71d2e
024a4 eb08                           jmp        0x7f5bbbe71d2e
024a6 eb06                           jmp        0x7f5bbbe71d2e
024a8 eb04                           jmp        0x7f5bbbe71d2e
024aa eb02                           jmp        0x7f5bbbe71d2e
024ac eb00                           jmp        0x7f5bbbe71d2e
024ae 488bf0                         mov        rsi, rax
024b1 e9fadeffff                     jmp        0x7f5bbbe6fc30
024b6 bef6ffffff                     mov        esi, 0xfffffff6
024bb 90                             nop        
024bc c5f877                         vzeroupper 
024bf e81c60b6ff                     call       0x7f5bbb9d7d60
024c4 0f1f8400bc250035               nop        dword ptr [rax + rax + 0x350025bc]
024cc bef6ffffff                     mov        esi, 0xfffffff6
024d1 666690                         nop        
024d4 c5f877                         vzeroupper 
024d7 e80460b6ff                     call       0x7f5bbb9d7d60
024dc 0f1f8400d4250036               nop        dword ptr [rax + rax + 0x360025d4]
024e4 bef6ffffff                     mov        esi, 0xfffffff6
024e9 666690                         nop        
024ec c5f877                         vzeroupper 
024ef e8ec5fb6ff                     call       0x7f5bbb9d7d60
024f4 0f1f8400ec250037               nop        dword ptr [rax + rax + 0x370025ec]
024fc bef6ffffff                     mov        esi, 0xfffffff6
02501 418bea                         mov        ebp, r10d
02504 c5f877                         vzeroupper 
02507 e8d45fb6ff                     call       0x7f5bbb9d7d60
0250c 0f1f840004260038               nop        dword ptr [rax + rax + 0x38002604]
02514 bef6ffffff                     mov        esi, 0xfffffff6
02519 666690                         nop        
0251c c5f877                         vzeroupper 
0251f e8bc5fb6ff                     call       0x7f5bbb9d7d60
02524 0f1f84001c260039               nop        dword ptr [rax + rax + 0x3900261c]
0252c 49ba42fae6bb5b7f0000           movabs     r10, 0x7f5bbbe6fa42
02536 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0253d e91e11aaff                     jmp        0x7f5bbb912ee0
02542 e8d9dca8ff                     call       0x7f5bbb8ffaa0
02547 e9f2daffff                     jmp        0x7f5bbbe6f8be
0254c f4                             hlt        
0254d f4                             hlt        
0254e f4                             hlt        
0254f f4                             hlt        
