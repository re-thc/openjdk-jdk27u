00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c000aaff                   jne        0x7fea6f90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8534250000                   jne        0x7fea6fe71df2
0003e 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00042 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
00047 4d8bc8                         mov        r9, r8
0004a 448bdf                         mov        r11d, edi
0004d 488bde                         mov        rbx, rsi
00050 8b463c                         mov        eax, dword ptr [rsi + 0x3c]
00053 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00057 458bc2                         mov        r8d, r10d
0005a 442bc0                         sub        r8d, eax
0005d 8bbc24d0000000                 mov        edi, dword ptr [rsp + 0xd0]
00064 413bf8                         cmp        edi, r8d
00067 0f8fa1120000                   jg         0x7fea6fe70b8e
0006d 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00071 4c89442440                     mov        qword ptr [rsp + 0x40], r8
00076 488b7620                       mov        rsi, qword ptr [rsi + 0x20]
0007a 4c638424d0000000               movsxd     r8, dword ptr [rsp + 0xd0]
00082 4863c8                         movsxd     rcx, eax
00085 48034c2440                     add        rcx, qword ptr [rsp + 0x40]
0008a 482bf1                         sub        rsi, rcx
0008d 4c3bc6                         cmp        r8, rsi
00090 0f8f78120000                   jg         0x7fea6fe70b8e
00096 4c8b7310                       mov        r14, qword ptr [rbx + 0x10]
0009a 4c8b6b28                       mov        r13, qword ptr [rbx + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f8425100000                   je         0x7fea6fe7094c
000a7 33ff                           xor        edi, edi
000a9 4c8bc2                         mov        r8, rdx
000ac 8b7208                         mov        esi, dword ptr [rdx + 8]
000af 8b5344                         mov        edx, dword ptr [rbx + 0x44]
000b2 418bcb                         mov        ecx, r11d
000b5 4585db                         test       r11d, r11d
000b8 7e7d                           jle        0x7fea6fe6f9b7
000ba 89442410                       mov        dword ptr [rsp + 0x10], eax
000be 4c2b6c2440                     sub        r13, qword ptr [rsp + 0x40]
000c3 8d46e0                         lea        eax, [rsi - 0x20]
000c6 4489542458                     mov        dword ptr [rsp + 0x58], r10d
000cb 458d5ae0                       lea        r11d, [r10 - 0x20]
000cf 498be9                         mov        rbp, r9
000d2 458b5108                       mov        r10d, dword ptr [r9 + 8]
000d6 4585d2                         test       r10d, r10d
000d9 0f86bd130000                   jbe        0x7fea6fe70d1c
000df 4d63d2                         movsxd     r10, r10d
000e2 4c63c9                         movsxd     r9, ecx
000e5 49ffc9                         dec        r9
000e8 4d3bca                         cmp        r9, r10
000eb 0f83ab130000                   jae        0x7fea6fe70d1c
000f1 4c8bd2                         mov        r10, rdx
000f4 4533c9                         xor        r9d, r9d
000f7 48895c2448                     mov        qword ptr [rsp + 0x48], rbx
000fc 4c89442450                     mov        qword ptr [rsp + 0x50], r8
00101 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00105 4c89742468                     mov        qword ptr [rsp + 0x68], r14
0010a 4c896c2460                     mov        qword ptr [rsp + 0x60], r13
0010f 897c245c                       mov        dword ptr [rsp + 0x5c], edi
00113 89b424a4000000                 mov        dword ptr [rsp + 0xa4], esi
0011a 899424a8000000                 mov        dword ptr [rsp + 0xa8], edx
00121 89442474                       mov        dword ptr [rsp + 0x74], eax
00125 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0012a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0012f 4533d2                         xor        r10d, r10d
00132 e99d010000                     jmp        0x7fea6fe6fb54
00137 85d2                           test       edx, edx
00139 0f8421130000                   je         0x7fea6fe70ce0
0013f 4c8bca                         mov        r9, rdx
00142 4533db                         xor        r11d, r11d
00145 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0014a 85c0                           test       eax, eax
0014c 0f8cca120000                   jl         0x7fea6fe70c9c
00152 3b742438                       cmp        esi, dword ptr [rsp + 0x38]
00156 0f82c4120000                   jb         0x7fea6fe70ca0
0015c 428d2c10                       lea        ebp, [rax + r10]
00160 418b4908                       mov        ecx, dword ptr [r9 + 8]
00164 3bcd                           cmp        ecx, ebp
00166 0f82b8120000                   jb         0x7fea6fe70ca4
0016c 4585d2                         test       r10d, r10d
0016f 0f8cb3120000                   jl         0x7fea6fe70ca8
00175 4585d2                         test       r10d, r10d
00178 7433                           je         0x7fea6fe6fa2d
0017a 498d74010c                     lea        rsi, [r9 + rax + 0xc]
0017f 4b8d7c180c                     lea        rdi, [r8 + r11 + 0xc]
00184 4963d2                         movsxd     rdx, r10d
00187 4883fa20                       cmp        rdx, 0x20
0018b 7739                           ja         0x7fea6fe6fa46
0018d 4d63d2                         movsxd     r10, r10d
00190 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00197 c442a8f5db                     bzhi       r11, r11, r10
0019c c4c1fb92fb                     kmovq      k7, r11
001a1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
001a7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
001ad 896b3c                         mov        dword ptr [rbx + 0x3c], ebp
001b0 c5f877                         vzeroupper 
001b3 4881c4c0000000                 add        rsp, 0xc0
001ba 5d                             pop        rbp
001bb 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001bf 0f8797230000                   ja         0x7fea6fe71ddc
001c5 c3                             ret        
001c6 c5f877                         vzeroupper 
001c9 49ba209f8f6fea7f0000           movabs     r10, 0x7fea6f8f9f20
001d3 41ffd2                         call       r10
001d6 0f1f840000000000               nop        dword ptr [rax + rax]
001de ebcd                           jmp        0x7fea6fe6fa2d
001e0 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
001e5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
001e9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
001ed 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
001f5 8bd5                           mov        edx, ebp
001f7 90                             nop        
001f8 c5f877                         vzeroupper 
001fb e8e00daaff                     call       0x7fea6f910860
00200 0f1f8400f8020000               nop        dword ptr [rax + rax + 0x2f8]
00208 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00210 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00214 488bc8                         mov        rcx, rax
00217 90                             nop        
00218 c5f877                         vzeroupper 
0021b e8c00daaff                     call       0x7fea6f910860
00220 0f1f840018030001               nop        dword ptr [rax + rax + 0x1000318]
00228 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0022d 4183c308                       add        r11d, 8
00231 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00236 7ca8                           jl         0x7fea6fe6fa60
00238 e9380e0000                     jmp        0x7fea6fe708f5
0023d 458bda                         mov        r11d, r10d
00240 4d63d3                         movsxd     r10, r11d
00243 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0024a c442a8f5db                     bzhi       r11, r11, r10
0024f c4c1fb92fb                     kmovq      k7, r11
00254 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0025a 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00260 e9100e0000                     jmp        0x7fea6fe708f5
00265 418bea                         mov        ebp, r10d
00268 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
0026d 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00271 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
00275 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0027a 8b7c2478                       mov        edi, dword ptr [rsp + 0x78]
0027e 891c24                         mov        dword ptr [rsp], ebx
00281 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00286 44894c2408                     mov        dword ptr [rsp + 8], r9d
0028b 458bca                         mov        r9d, r10d
0028e 6690                           nop        
00290 c5f877                         vzeroupper 
00293 e8480daaff                     call       0x7fea6f910860
00298 0f1f840090030002               nop        dword ptr [rax + rax + 0x2000390]
002a0 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
002a8 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
002ad 41ffc1                         inc        r9d
002b0 443b4c243c                     cmp        r9d, dword ptr [rsp + 0x3c]
002b5 0f8d2e0e0000                   jge        0x7fea6fe70969
002bb 89442410                       mov        dword ptr [rsp + 0x10], eax
002bf 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
002c7 44898424a8000000               mov        dword ptr [rsp + 0xa8], r8d
002cf 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002d4 4e8b44cd10                     mov        r8, qword ptr [rbp + r9*8 + 0x10]
002d9 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
002de 4889ac24d0000000               mov        qword ptr [rsp + 0xd0], rbp
002e6 458bd8                         mov        r11d, r8d
002e9 4181e3ffff0100                 and        r11d, 0x1ffff
002f0 4d8bc8                         mov        r9, r8
002f3 49c1f924                       sar        r9, 0x24
002f7 49c1e812                       shr        r8, 0x12
002fb 418bd9                         mov        ebx, r9d
002fe 458bc0                         mov        r8d, r8d
00301 4181e0ffff0300                 and        r8d, 0x3ffff
00308 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0030d 85db                           test       ebx, ebx
0030f 7d26                           jge        0x7fea6fe6fbb7
00311 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
00316 418b4808                       mov        ecx, dword ptr [r8 + 8]
0031a 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
0031f 443bc1                         cmp        r8d, ecx
00322 0f83fc0f0000                   jae        0x7fea6fe70ba4
00328 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
0032d 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
00332 438b5c880c                     mov        ebx, dword ptr [r8 + r9*4 + 0xc]
00337 4585db                         test       r11d, r11d
0033a 0f844a0d0000                   je         0x7fea6fe7090a
00340 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00345 452bc2                         sub        r8d, r10d
00348 453bd8                         cmp        r11d, r8d
0034b 0f8f9c0f0000                   jg         0x7fea6fe70b6d
00351 458bc3                         mov        r8d, r11d
00354 83fb03                         cmp        ebx, 3
00357 7f5f                           jg         0x7fea6fe6fc38
00359 4585c0                         test       r8d, r8d
0035c 7402                           je         0x7fea6fe6fbe0
0035e ffcb                           dec        ebx
00360 85db                           test       ebx, ebx
00362 0f84bb0d0000                   je         0x7fea6fe709a3
00368 83fb03                         cmp        ebx, 3
0036b 0f84d00d0000                   je         0x7fea6fe709c1
00371 83fb02                         cmp        ebx, 2
00374 0f8687000000                   jbe        0x7fea6fe6fc81
0037a 48be0001cde200000000           movabs     rsi, 0xe2cd0100
00384 418bea                         mov        ebp, r10d
00387 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0038c c5f877                         vzeroupper 
0038f e84c0caaff                     call       0x7fea6f910860
00394 0f1f84008c040003               nop        dword ptr [rax + rax + 0x300048c]
0039c 4885c0                         test       rax, rax
0039f 0f84b3110000                   je         0x7fea6fe70dd8
003a5 488bf0                         mov        rsi, rax
003a8 c5f877                         vzeroupper 
003ab 4881c4c0000000                 add        rsp, 0xc0
003b2 5d                             pop        rbp
003b3 e928b0b6ff                     jmp        0x7fea6f9dac60
003b8 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
003c0 458b5b08                       mov        r11d, dword ptr [r11 + 8]
003c4 83c3fd                         add        ebx, -3
003c7 4183fb02                       cmp        r11d, 2
003cb 0f86d70f0000                   jbe        0x7fea6fe70c28
003d1 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
003d9 458b4b10                       mov        r9d, dword ptr [r11 + 0x10]
003dd 45894b14                       mov        dword ptr [r11 + 0x14], r9d
003e1 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
003e5 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
003ed 45895910                       mov        dword ptr [r9 + 0x10], r11d
003f1 4189590c                       mov        dword ptr [r9 + 0xc], ebx
003f5 899c248c000000                 mov        dword ptr [rsp + 0x8c], ebx
003fc e9b3010000                     jmp        0x7fea6fe6fe34
00401 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00409 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0040d 413bdb                         cmp        ebx, r11d
00410 0f830a110000                   jae        0x7fea6fe70da0
00416 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0041e 418b6c990c                     mov        ebp, dword ptr [r9 + rbx*4 + 0xc]
00423 85db                           test       ebx, ebx
00425 0f8e65010000                   jle        0x7fea6fe6fe10
0042b 4585db                         test       r11d, r11d
0042e 0f86b8110000                   jbe        0x7fea6fe70e6c
00434 4d63cb                         movsxd     r9, r11d
00437 4863cb                         movsxd     rcx, ebx
0043a 48ffc9                         dec        rcx
0043d 493bc9                         cmp        rcx, r9
00440 0f83a6110000                   jae        0x7fea6fe70e6c
00446 4183fb01                       cmp        r11d, 1
0044a 0f869c110000                   jbe        0x7fea6fe70e6c
00450 448d4bff                       lea        r9d, [rbx - 1]
00454 4d63c9                         movsxd     r9, r9d
00457 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
0045f 8bc9                           mov        ecx, ecx
00461 83c1d0                         add        ecx, -0x30
00464 c1e902                         shr        ecx, 2
00467 8d7c19ff                       lea        edi, [rcx + rbx - 1]
0046b b904000000                     mov        ecx, 4
00470 c4e2f0f5cf                     bzhi       rcx, rdi, rcx
00475 4c2bc9                         sub        r9, rcx
00478 33c9                           xor        ecx, ecx
0047a 4d85c9                         test       r9, r9
0047d 4c0f4cc9                       cmovl      r9, rcx
00481 418bc9                         mov        ecx, r9d
00484 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0048c 458b4c9908                     mov        r9d, dword ptr [r9 + rbx*4 + 8]
00491 488bbc24d8000000               mov        rdi, qword ptr [rsp + 0xd8]
00499 44894c9f0c                     mov        dword ptr [rdi + rbx*4 + 0xc], r9d
0049e ffcb                           dec        ebx
004a0 3bd9                           cmp        ebx, ecx
004a2 7fe0                           jg         0x7fea6fe6fd04
004a4 83fb3f                         cmp        ebx, 0x3f
004a7 0f8ebc000000                   jle        0x7fea6fe6fde9
004ad 666690                         nop        
004b0 8d7bc1                         lea        edi, [rbx - 0x3f]
004b3 8d73d0                         lea        esi, [rbx - 0x30]
004b6 8d53f1                         lea        edx, [rbx - 0xf]
004b9 8d4bf0                         lea        ecx, [rbx - 0x10]
004bc 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
004c4 62d17e486f84890c000000         vmovdqu32  zmm0, zmmword ptr [r9 + rcx*4 + 0xc]
004cf 62d17e487f84910c000000         vmovdqu32  zmmword ptr [r9 + rdx*4 + 0xc], zmm0
004da 8d43e1                         lea        eax, [rbx - 0x1f]
004dd 448d4be0                       lea        r9d, [rbx - 0x20]
004e1 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
004e9 62b17e486f84890c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r9*4 + 0xc]
004f4 62f17e487f84810c000000         vmovdqu32  zmmword ptr [rcx + rax*4 + 0xc], zmm0
004ff 62f17e486f84b10c000000         vmovdqu32  zmm0, zmmword ptr [rcx + rsi*4 + 0xc]
0050a 448d4bd1                       lea        r9d, [rbx - 0x2f]
0050e 62b17e487f84890c000000         vmovdqu32  zmmword ptr [rcx + r9*4 + 0xc], zmm0
00519 83c3c0                         add        ebx, -0x40
0051c 62f17e486f84990c000000         vmovdqu32  zmm0, zmmword ptr [rcx + rbx*4 + 0xc]
00527 62f17e487f84b90c000000         vmovdqu32  zmmword ptr [rcx + rdi*4 + 0xc], zmm0
00532 83fb3f                         cmp        ebx, 0x3f
00535 0f8f75ffffff                   jg         0x7fea6fe6fd30
0053b 83fb0f                         cmp        ebx, 0xf
0053e 7e29                           jle        0x7fea6fe6fde9
00540 8d4bf1                         lea        ecx, [rbx - 0xf]
00543 83c3f0                         add        ebx, -0x10
00546 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
0054e 62d17e486f84990c000000         vmovdqu32  zmm0, zmmword ptr [r9 + rbx*4 + 0xc]
00559 62d17e487f84890c000000         vmovdqu32  zmmword ptr [r9 + rcx*4 + 0xc], zmm0
00564 83fb0f                         cmp        ebx, 0xf
00567 7fd7                           jg         0x7fea6fe6fdc0
00569 85db                           test       ebx, ebx
0056b 7e23                           jle        0x7fea6fe6fe10
0056d 666690                         nop        
00570 4c8b8c24d8000000               mov        r9, qword ptr [rsp + 0xd8]
00578 458b4c9908                     mov        r9d, dword ptr [r9 + rbx*4 + 8]
0057d 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
00585 44894c990c                     mov        dword ptr [rcx + rbx*4 + 0xc], r9d
0058a ffcb                           dec        ebx
0058c 85db                           test       ebx, ebx
0058e 7fe0                           jg         0x7fea6fe6fdf0
00590 4585db                         test       r11d, r11d
00593 0f86d70f0000                   jbe        0x7fea6fe70df0
00599 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
005a1 41896b0c                       mov        dword ptr [r11 + 0xc], ebp
005a5 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
005ac 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
005b4 4489442478                     mov        dword ptr [rsp + 0x78], r8d
005b9 4963d0                         movsxd     rdx, r8d
005bc 4c635c2410                     movsxd     r11, dword ptr [rsp + 0x10]
005c1 4c035c2440                     add        r11, qword ptr [rsp + 0x40]
005c6 4c03da                         add        r11, rdx
005c9 448b742410                     mov        r14d, dword ptr [rsp + 0x10]
005ce 4503f0                         add        r14d, r8d
005d1 4c638c248c000000               movsxd     r9, dword ptr [rsp + 0x8c]
005d9 458bee                         mov        r13d, r14d
005dc 442bac248c000000               sub        r13d, dword ptr [rsp + 0x8c]
005e4 4d3bcb                         cmp        r9, r11
005e7 7f18                           jg         0x7fea6fe6fe81
005e9 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
005ee 4585c0                         test       r8d, r8d
005f1 0f84510c0000                   je         0x7fea6fe70ac8
005f7 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
005fc 4533c0                         xor        r8d, r8d
005ff eb0e                           jmp        0x7fea6fe6fe8f
00601 8b4c245c                       mov        ecx, dword ptr [rsp + 0x5c]
00605 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
00609 41b801000000                   mov        r8d, 1
0060f 8b9c248c000000                 mov        ebx, dword ptr [rsp + 0x8c]
00616 85db                           test       ebx, ebx
00618 0f8ee60c0000                   jle        0x7fea6fe70b84
0061e 4585c0                         test       r8d, r8d
00621 0f856b0a0000                   jne        0x7fea6fe70912
00627 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0062c 4503c6                         add        r8d, r14d
0062f 458bda                         mov        r11d, r10d
00632 44035c2478                     add        r11d, dword ptr [rsp + 0x78]
00637 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0063c 443b442470                     cmp        r8d, dword ptr [rsp + 0x70]
00641 0f8f1efcffff                   jg         0x7fea6fe6fae5
00647 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
0064c 0f8f13fcffff                   jg         0x7fea6fe6fae5
00652 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
00659 83c5f1                         add        ebp, -0xf
0065c 48c7c300000080                 mov        rbx, 0xffffffff80000000
00663 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00668 4183fb10                       cmp        r11d, 0x10
0066c 0f8ec6030000                   jle        0x7fea6fe702b8
00672 458bc3                         mov        r8d, r11d
00675 4183f830                       cmp        r8d, 0x30
00679 0f8e93000000                   jle        0x7fea6fe6ff92
0067f 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00687 458b4308                       mov        r8d, dword ptr [r11 + 8]
0068b 4585d2                         test       r10d, r10d
0068e 0f8cdc150000                   jl         0x7fea6fe714f0
00694 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00699 4585c9                         test       r9d, r9d
0069c 0f8cce150000                   jl         0x7fea6fe714f0
006a2 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
006aa 443b5c2414                     cmp        r11d, dword ptr [rsp + 0x14]
006af 0f82bb150000                   jb         0x7fea6fe714f0
006b5 453bc6                         cmp        r8d, r14d
006b8 0f82b2150000                   jb         0x7fea6fe714f0
006be 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
006c3 4585c0                         test       r8d, r8d
006c6 0f8426040000                   je         0x7fea6fe70372
006cc 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
006d1 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
006d6 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
006de 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
006e6 4b8d74080c                     lea        rsi, [r8 + r9 + 0xc]
006eb 4883fa20                       cmp        rdx, 0x20
006ef 0f86d8030000                   jbe        0x7fea6fe7034d
006f5 c5f877                         vzeroupper 
006f8 49ba209f8f6fea7f0000           movabs     r10, 0x7fea6f8f9f20
00702 41ffd2                         call       r10
00705 0f1f840000000000               nop        dword ptr [rax + rax]
0070d e9e0030000                     jmp        0x7fea6fe70372
00712 85ed                           test       ebp, ebp
00714 0f8c06150000                   jl         0x7fea6fe714a0
0071a 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
00722 418d68f1                       lea        ebp, [r8 - 0xf]
00726 443bd5                         cmp        r10d, ebp
00729 0f8371120000                   jae        0x7fea6fe71220
0072f 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00737 418b7908                       mov        edi, dword ptr [r9 + 8]
0073b 458bca                         mov        r9d, r10d
0073e 8d6ff1                         lea        ebp, [rdi - 0xf]
00741 4963ca                         movsxd     rcx, r10d
00744 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00749 c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
00750 85ed                           test       ebp, ebp
00752 0f8ca4150000                   jl         0x7fea6fe7157c
00758 448d5ff1                       lea        r11d, [rdi - 0xf]
0075c 418bd3                         mov        edx, r11d
0075f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00764 453bd3                         cmp        r10d, r11d
00767 0f8383120000                   jae        0x7fea6fe71270
0076d 418d7210                       lea        esi, [r10 + 0x10]
00771 89742418                       mov        dword ptr [rsp + 0x18], esi
00775 4963f2                         movsxd     rsi, r10d
00778 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00780 c4c17a7f44330c                 vmovdqu    xmmword ptr [r11 + rsi + 0xc], xmm0
00787 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0078c 453bde                         cmp        r11d, r14d
0078f 0f8d81020000                   jge        0x7fea6fe70296
00795 482bce                         sub        rcx, rsi
00798 4963f0                         movsxd     rsi, r8d
0079b 4883c6f1                       add        rsi, -0xf
0079f 4d63c3                         movsxd     r8, r11d
007a2 498d0408                       lea        rax, [r8 + rcx]
007a6 483bc6                         cmp        rax, rsi
007a9 0f83a9160000                   jae        0x7fea6fe716d8
007af 4963c6                         movsxd     rax, r14d
007b2 488be8                         mov        rbp, rax
007b5 492be8                         sub        rbp, r8
007b8 4883c50f                       add        rbp, 0xf
007bc 4883e5f0                       and        rbp, 0xfffffffffffffff0
007c0 448bc5                         mov        r8d, ebp
007c3 478d441010                     lea        r8d, [r8 + r10 + 0x10]
007c8 4d63c0                         movsxd     r8, r8d
007cb 498d4c08f0                     lea        rcx, [r8 + rcx - 0x10]
007d0 483bce                         cmp        rcx, rsi
007d3 0f837f160000                   jae        0x7fea6fe716d8
007d9 443bda                         cmp        r11d, edx
007dc 0f8376160000                   jae        0x7fea6fe716d8
007e2 4c63df                         movsxd     r11, edi
007e5 4983c0f0                       add        r8, -0x10
007e9 4983c3f1                       add        r11, -0xf
007ed 4d3bc3                         cmp        r8, r11
007f0 0f8362160000                   jae        0x7fea6fe716d8
007f6 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
007fd 0f8ffd160000                   jg         0x7fea6fe71780
00803 458bc1                         mov        r8d, r9d
00806 452bc2                         sub        r8d, r10d
00809 4183c220                       add        r10d, 0x20
0080d 666690                         nop        
00810 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
00814 458bd8                         mov        r11d, r8d
00817 44035c2418                     add        r11d, dword ptr [rsp + 0x18]
0081c 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
00821 c4a17a6f441f0c                 vmovdqu    xmm0, xmmword ptr [rdi + r11 + 0xc]
00828 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
0082f c5fa7f440f0c                   vmovdqu    xmmword ptr [rdi + rcx + 0xc], xmm0
00835 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0083a 4183c310                       add        r11d, 0x10
0083e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00843 453bda                         cmp        r11d, r10d
00846 7cc8                           jl         0x7fea6fe70090
00848 480510ffffff                   add        rax, -0xf0
0084e 483d00000080                   cmp        rax, -0x80000000
00854 480f4cc3                       cmovl      rax, rbx
00858 8bf0                           mov        esi, eax
0085a 443bde                         cmp        r11d, esi
0085d 0f8d7a010000                   jge        0x7fea6fe7025d
00863 458bd3                         mov        r10d, r11d
00866 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0086b 0f1f440000                     nop        dword ptr [rax + rax]
00870 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00875 4963d3                         movsxd     rdx, r11d
00878 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0087d 418bc8                         mov        ecx, r8d
00880 034c2418                       add        ecx, dword ptr [rsp + 0x18]
00884 448bd9                         mov        r11d, ecx
00887 488b7c2450                     mov        rdi, qword ptr [rsp + 0x50]
0088c c5fa6f440f0c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xc]
00892 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
00899 c4a17a7f44170c                 vmovdqu    xmmword ptr [rdi + r10 + 0xc], xmm0
008a0 4963cb                         movsxd     rcx, r11d
008a3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008a8 c4c17a6f440a1c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x1c]
008af c5fa7f44171c                   vmovdqu    xmmword ptr [rdi + rdx + 0x1c], xmm0
008b5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008ba c4c17a6f440a2c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x2c]
008c1 c5fa7f44172c                   vmovdqu    xmmword ptr [rdi + rdx + 0x2c], xmm0
008c7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008cc c4c17a6f440a3c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x3c]
008d3 c5fa7f44173c                   vmovdqu    xmmword ptr [rdi + rdx + 0x3c], xmm0
008d9 c4c17a6f440a4c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x4c]
008e0 c5fa7f44174c                   vmovdqu    xmmword ptr [rdi + rdx + 0x4c], xmm0
008e6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
008eb c4c17a6f440a5c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x5c]
008f2 c5fa7f44175c                   vmovdqu    xmmword ptr [rdi + rdx + 0x5c], xmm0
008f8 c4c17a6f440a6c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x6c]
008ff c5fa7f44176c                   vmovdqu    xmmword ptr [rdi + rdx + 0x6c], xmm0
00905 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0090a c4c17a6f440a7c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x7c]
00911 c5fa7f44177c                   vmovdqu    xmmword ptr [rdi + rdx + 0x7c], xmm0
00917 c4c17a6f840a8c000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x8c]
00921 c5fa7f84178c000000             vmovdqu    xmmword ptr [rdi + rdx + 0x8c], xmm0
0092a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0092f c4c17a6f840a9c000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0x9c]
00939 c5fa7f84179c000000             vmovdqu    xmmword ptr [rdi + rdx + 0x9c], xmm0
00942 c4c17a6f840aac000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xac]
0094c c5fa7f8417ac000000             vmovdqu    xmmword ptr [rdi + rdx + 0xac], xmm0
00955 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0095a c4c17a6f840abc000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xbc]
00964 c5fa7f8417bc000000             vmovdqu    xmmword ptr [rdi + rdx + 0xbc], xmm0
0096d c4c17a6f840acc000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xcc]
00977 c5fa7f8417cc000000             vmovdqu    xmmword ptr [rdi + rdx + 0xcc], xmm0
00980 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00985 c4c17a6f840adc000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xdc]
0098f c5fa7f8417dc000000             vmovdqu    xmmword ptr [rdi + rdx + 0xdc], xmm0
00998 c4c17a6f840aec000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xec]
009a2 c5fa7f8417ec000000             vmovdqu    xmmword ptr [rdi + rdx + 0xec], xmm0
009ab 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
009b0 c4c17a6f840afc000000           vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xfc]
009ba c5fa7f8417fc000000             vmovdqu    xmmword ptr [rdi + rdx + 0xfc], xmm0
009c3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
009c8 4181c200010000                 add        r10d, 0x100
009cf 4489542418                     mov        dword ptr [rsp + 0x18], r10d
009d4 443bd6                         cmp        r10d, esi
009d7 0f8c93feffff                   jl         0x7fea6fe700f0
009dd 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
009e2 453bd6                         cmp        r10d, r14d
009e5 7d2f                           jge        0x7fea6fe70296
009e7 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
009ec 478d1418                       lea        r10d, [r8 + r11]
009f0 488b4c2450                     mov        rcx, qword ptr [rsp + 0x50]
009f5 c4a17a6f44110c                 vmovdqu    xmm0, xmmword ptr [rcx + r10 + 0xc]
009fc 458bd3                         mov        r10d, r11d
009ff 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
00a06 c4a17a7f44170c                 vmovdqu    xmmword ptr [rdi + r10 + 0xc], xmm0
00a0d 4183c310                       add        r11d, 0x10
00a11 453bde                         cmp        r11d, r14d
00a14 7cd6                           jl         0x7fea6fe7026c
00a16 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00a1b 4503d1                         add        r10d, r9d
00a1e 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00a23 4489ac24a0000000               mov        dword ptr [rsp + 0xa0], r13d
00a2b 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
00a33 e9ca000000                     jmp        0x7fea6fe70382
00a38 85ed                           test       ebp, ebp
00a3a 0f8c100d0000                   jl         0x7fea6fe70fd0
00a40 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
00a47 83c5f1                         add        ebp, -0xf
00a4a 443bd5                         cmp        r10d, ebp
00a4d 0f83d10b0000                   jae        0x7fea6fe70ea4
00a53 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00a5b 458b4008                       mov        r8d, dword ptr [r8 + 8]
00a5f 418bca                         mov        ecx, r10d
00a62 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00a67 c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
00a6e 418d68f1                       lea        ebp, [r8 - 0xf]
00a72 85ed                           test       ebp, ebp
00a74 0f8c520d0000                   jl         0x7fea6fe7104c
00a7a 4183c0f1                       add        r8d, -0xf
00a7e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00a83 453bd0                         cmp        r10d, r8d
00a86 0f83140c0000                   jae        0x7fea6fe70f20
00a8c 4403d9                         add        r11d, ecx
00a8f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00a94 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a99 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00aa1 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00aa8 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00aad 4503d3                         add        r10d, r11d
00ab0 458bda                         mov        r11d, r10d
00ab3 442b9c248c000000               sub        r11d, dword ptr [rsp + 0x8c]
00abb 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00ac3 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00acb eb35                           jmp        0x7fea6fe70382
00acd 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00ad2 4d63d3                         movsxd     r10, r11d
00ad5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00adc c442a8f5db                     bzhi       r11, r11, r10
00ae1 c4c1fb92fb                     kmovq      k7, r11
00ae6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00aec 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00af2 4489ac24a0000000               mov        dword ptr [rsp + 0xa0], r13d
00afa 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
00b02 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00b0a 458b5308                       mov        r10d, dword ptr [r11 + 8]
00b0e 458d42f1                       lea        r8d, [r10 - 0xf]
00b12 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00b17 4183fb10                       cmp        r11d, 0x10
00b1b 7f74                           jg         0x7fea6fe70411
00b1d 448b8c248c000000               mov        r9d, dword ptr [rsp + 0x8c]
00b25 4183f910                       cmp        r9d, 0x10
00b29 7c66                           jl         0x7fea6fe70411
00b2b 4585c0                         test       r8d, r8d
00b2e 0f8c88120000                   jl         0x7fea6fe7163c
00b34 458bc2                         mov        r8d, r10d
00b37 4183c0f1                       add        r8d, -0xf
00b3b 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00b43 453bc8                         cmp        r9d, r8d
00b46 0f83780f0000                   jae        0x7fea6fe71344
00b4c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b54 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00b5c c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
00b63 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00b6b 453bd8                         cmp        r11d, r8d
00b6e 0f83ec0f0000                   jae        0x7fea6fe713e0
00b74 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00b7c c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00b83 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00b88 438d041a                       lea        eax, [r10 + r11]
00b8c e917f7ffff                     jmp        0x7fea6fe6fb28
00b91 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00b99 442b9c2488000000               sub        r11d, dword ptr [rsp + 0x88]
00ba1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ba6 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00bae 4d8bd9                         mov        r11, r9
00bb1 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
00bb9 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00bc1 4183c308                       add        r11d, 8
00bc5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00bca 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00bd2 44034c2420                     add        r9d, dword ptr [rsp + 0x20]
00bd7 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
00bdc 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
00be4 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
00be9 0f8d72030000                   jge        0x7fea6fe707e1
00bef 4183fb10                       cmp        r11d, 0x10
00bf3 0f8dcf000000                   jge        0x7fea6fe70548
00bf9 4183fb08                       cmp        r11d, 8
00bfd 7d52                           jge        0x7fea6fe704d1
00bff 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00c07 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00c0e 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
00c15 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00c1d 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00c22 488b6c2448                     mov        rbp, qword ptr [rsp + 0x48]
00c27 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00c2c 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00c31 666690                         nop        
00c34 c5f877                         vzeroupper 
00c37 e8a403aaff                     call       0x7fea6f910860
00c3c 0f1f8400340d0004               nop        dword ptr [rax + rax + 0x4000d34]
00c44 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00c4c e957f6ffff                     jmp        0x7fea6fe6fb28
00c51 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00c59 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00c60 488b6c2448                     mov        rbp, qword ptr [rsp + 0x48]
00c65 666690                         nop        
00c68 c5f877                         vzeroupper 
00c6b e87003aaff                     call       0x7fea6f910860
00c70 0f1f8400680d0005               nop        dword ptr [rax + rax + 0x5000d68]
00c78 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00c80 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00c87 488bc8                         mov        rcx, rax
00c8a 6690                           nop        
00c8c c5f877                         vzeroupper 
00c8f e84c03aaff                     call       0x7fea6f910860
00c94 0f1f84008c0d0006               nop        dword ptr [rax + rax + 0x6000d8c]
00c9c 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00ca1 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00ca6 0f8d2c060000                   jge        0x7fea6fe70b58
00cac 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00cb1 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00cb8 0f8f1a170000                   jg         0x7fea6fe71c58
00cbe 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00cc3 e9bd050000                     jmp        0x7fea6fe70b05
00cc8 4585c0                         test       r8d, r8d
00ccb 0f8c2b150000                   jl         0x7fea6fe71a7c
00cd1 458bda                         mov        r11d, r10d
00cd4 458bcb                         mov        r9d, r11d
00cd7 418d6bf1                       lea        ebp, [r11 - 0xf]
00cdb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00ce3 443bd5                         cmp        r10d, ebp
00ce6 0f83bc120000                   jae        0x7fea6fe71828
00cec 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00cf4 4963cb                         movsxd     rcx, r11d
00cf7 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00cff c4c17a6f44080c                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 0xc]
00d06 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00d0e 443bd5                         cmp        r10d, ebp
00d11 0f830d130000                   jae        0x7fea6fe718a4
00d17 8bbc2488000000                 mov        edi, dword ptr [rsp + 0x88]
00d1e 448d5710                       lea        r10d, [rdi + 0x10]
00d22 4c63c7                         movsxd     r8, edi
00d25 8bb424a8000000                 mov        esi, dword ptr [rsp + 0xa8]
00d2c c4a17a7f44060c                 vmovdqu    xmmword ptr [rsi + r8 + 0xc], xmm0
00d33 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00d38 0f8d0e020000                   jge        0x7fea6fe707cc
00d3e 492bc8                         sub        rcx, r8
00d41 4963d1                         movsxd     rdx, r9d
00d44 4883c2f1                       add        rdx, -0xf
00d48 4d63c2                         movsxd     r8, r10d
00d4b 4d8d0c08                       lea        r9, [r8 + rcx]
00d4f 4c3bca                         cmp        r9, rdx
00d52 0f834c130000                   jae        0x7fea6fe71924
00d58 4863742478                     movsxd     rsi, dword ptr [rsp + 0x78]
00d5d 4c8bce                         mov        r9, rsi
00d60 4d2bc8                         sub        r9, r8
00d63 4983c10f                       add        r9, 0xf
00d67 4983e1f0                       and        r9, 0xfffffffffffffff0
00d6b 458bc9                         mov        r9d, r9d
00d6e 458d443910                     lea        r8d, [r9 + rdi + 0x10]
00d73 4d63c0                         movsxd     r8, r8d
00d76 4d8d4c08f0                     lea        r9, [r8 + rcx - 0x10]
00d7b 4c3bca                         cmp        r9, rdx
00d7e 0f8320130000                   jae        0x7fea6fe71924
00d84 443bd5                         cmp        r10d, ebp
00d87 0f8317130000                   jae        0x7fea6fe71924
00d8d 4983c0f0                       add        r8, -0x10
00d91 4c3bc2                         cmp        r8, rdx
00d94 0f830a130000                   jae        0x7fea6fe71924
00d9a 448b442478                     mov        r8d, dword ptr [rsp + 0x78]
00d9f 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
00da6 0f8fa4130000                   jg         0x7fea6fe719d0
00dac 442bdf                         sub        r11d, edi
00daf 83c720                         add        edi, 0x20
00db2 458bc2                         mov        r8d, r10d
00db5 438d0c13                       lea        ecx, [r11 + r10]
00db9 8b9424a8000000                 mov        edx, dword ptr [rsp + 0xa8]
00dc0 c5fa6f440a0c                   vmovdqu    xmm0, xmmword ptr [rdx + rcx + 0xc]
00dc6 c4a17a7f44020c                 vmovdqu    xmmword ptr [rdx + r8 + 0xc], xmm0
00dcd 4183c210                       add        r10d, 0x10
00dd1 443bd7                         cmp        r10d, edi
00dd4 7cdc                           jl         0x7fea6fe70632
00dd6 4881c610ffffff                 add        rsi, -0xf0
00ddd 4881fe00000080                 cmp        rsi, -0x80000000
00de4 480f4cf3                       cmovl      rsi, rbx
00de8 8bd6                           mov        edx, esi
00dea 443bd2                         cmp        r10d, edx
00ded 0f8d29010000                   jge        0x7fea6fe7079c
00df3 0f1f8000000000                 nop        dword ptr [rax]
00dfa 660f1f440000                   nop        word ptr [rax + rax]
00e00 458bc2                         mov        r8d, r10d
00e03 4963d8                         movsxd     rbx, r8d
00e06 458bca                         mov        r9d, r10d
00e09 478d0413                       lea        r8d, [r11 + r10]
00e0d 418bc8                         mov        ecx, r8d
00e10 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
00e17 c4a17a6f44070c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xc]
00e1e c4a17a7f440f0c                 vmovdqu    xmmword ptr [rdi + r9 + 0xc], xmm0
00e25 4863c9                         movsxd     rcx, ecx
00e28 c5fa6f440f1c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x1c]
00e2e c5fa7f441f1c                   vmovdqu    xmmword ptr [rdi + rbx + 0x1c], xmm0
00e34 c5fa6f440f2c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x2c]
00e3a c5fa7f441f2c                   vmovdqu    xmmword ptr [rdi + rbx + 0x2c], xmm0
00e40 c5fa6f440f3c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x3c]
00e46 c5fa7f441f3c                   vmovdqu    xmmword ptr [rdi + rbx + 0x3c], xmm0
00e4c c5fa6f440f4c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x4c]
00e52 c5fa7f441f4c                   vmovdqu    xmmword ptr [rdi + rbx + 0x4c], xmm0
00e58 c5fa6f440f5c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x5c]
00e5e c5fa7f441f5c                   vmovdqu    xmmword ptr [rdi + rbx + 0x5c], xmm0
00e64 c5fa6f440f6c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x6c]
00e6a c5fa7f441f6c                   vmovdqu    xmmword ptr [rdi + rbx + 0x6c], xmm0
00e70 c5fa6f440f7c                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x7c]
00e76 c5fa7f441f7c                   vmovdqu    xmmword ptr [rdi + rbx + 0x7c], xmm0
00e7c c5fa6f840f8c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x8c]
00e85 c5fa7f841f8c000000             vmovdqu    xmmword ptr [rdi + rbx + 0x8c], xmm0
00e8e c5fa6f840f9c000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x9c]
00e97 c5fa7f841f9c000000             vmovdqu    xmmword ptr [rdi + rbx + 0x9c], xmm0
00ea0 c5fa6f840fac000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xac]
00ea9 c5fa7f841fac000000             vmovdqu    xmmword ptr [rdi + rbx + 0xac], xmm0
00eb2 c5fa6f840fbc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xbc]
00ebb c5fa7f841fbc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xbc], xmm0
00ec4 c5fa6f840fcc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xcc]
00ecd c5fa7f841fcc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xcc], xmm0
00ed6 c5fa6f840fdc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xdc]
00edf c5fa7f841fdc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xdc], xmm0
00ee8 c5fa6f840fec000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xec]
00ef1 c5fa7f841fec000000             vmovdqu    xmmword ptr [rdi + rbx + 0xec], xmm0
00efa c5fa6f840ffc000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xfc]
00f03 c5fa7f841ffc000000             vmovdqu    xmmword ptr [rdi + rbx + 0xfc], xmm0
00f0c 4181c200010000                 add        r10d, 0x100
00f13 443bd2                         cmp        r10d, edx
00f16 0f8ce4feffff                   jl         0x7fea6fe70680
00f1c 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00f21 7d29                           jge        0x7fea6fe707cc
00f23 90                             nop        
00f24 478d0413                       lea        r8d, [r11 + r10]
00f28 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00f30 c4817a6f44010c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xc]
00f37 458bc2                         mov        r8d, r10d
00f3a c4817a7f44010c                 vmovdqu    xmmword ptr [r9 + r8 + 0xc], xmm0
00f41 4183c210                       add        r10d, 0x10
00f45 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00f4a 7cd8                           jl         0x7fea6fe707a4
00f4c 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00f51 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
00f59 418bc2                         mov        eax, r10d
00f5c e947f3ffff                     jmp        0x7fea6fe6fb28
00f61 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00f66 4183fb30                       cmp        r11d, 0x30
00f6a 7f74                           jg         0x7fea6fe70860
00f6c 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00f74 8b9424a0000000                 mov        edx, dword ptr [rsp + 0xa0]
00f7b 488b6c2448                     mov        rbp, qword ptr [rsp + 0x48]
00f80 c5f877                         vzeroupper 
00f83 e85800aaff                     call       0x7fea6f910860
00f88 0f1f840080100007               nop        dword ptr [rax + rax + 0x7001080]
00f90 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
00f98 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00f9f 488bc8                         mov        rcx, rax
00fa2 6690                           nop        
00fa4 c5f877                         vzeroupper 
00fa7 e83400aaff                     call       0x7fea6f910860
00fac 0f1f8400a4100008               nop        dword ptr [rax + rax + 0x80010a4]
00fb4 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00fb9 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00fbe 0f8db1000000                   jge        0x7fea6fe708f5
00fc4 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00fc9 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00fd0 0f8f56130000                   jg         0x7fea6fe71bac
00fd6 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00fdb e905f2ffff                     jmp        0x7fea6fe6fa65
00fe0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00fe8 4585db                         test       r11d, r11d
00feb 0f8caf120000                   jl         0x7fea6fe71b20
00ff1 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00ff9 4585c0                         test       r8d, r8d
00ffc 0f8c9e120000                   jl         0x7fea6fe71b20
01002 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01007 44038424a0000000               add        r8d, dword ptr [rsp + 0xa0]
0100f 453bd0                         cmp        r10d, r8d
01012 0f8288120000                   jb         0x7fea6fe71b20
01018 453bd1                         cmp        r10d, r9d
0101b 0f827f120000                   jb         0x7fea6fe71b20
01021 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01026 4585db                         test       r11d, r11d
01029 744a                           je         0x7fea6fe708f5
0102b 458bd3                         mov        r10d, r11d
0102e 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01036 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
0103e 4b8d7c0b0c                     lea        rdi, [r11 + r9 + 0xc]
01043 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
0104b 4b8d740b0c                     lea        rsi, [r11 + r9 + 0xc]
01050 4963d2                         movsxd     rdx, r10d
01053 4883fa20                       cmp        rdx, 0x20
01057 0f86e0f1ffff                   jbe        0x7fea6fe6fabd
0105d c5f877                         vzeroupper 
01060 49ba209f8f6fea7f0000           movabs     r10, 0x7fea6f8f9f20
0106a 41ffd2                         call       r10
0106d 0f1f840000000000               nop        dword ptr [rax + rax]
01075 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
0107a 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
01082 418bc3                         mov        eax, r11d
01085 e91ef2ffff                     jmp        0x7fea6fe6fb28
0108a 4533c0                         xor        r8d, r8d
0108d e9c2f2ffff                     jmp        0x7fea6fe6fbd4
01092 4d2bd9                         sub        r11, r9
01095 4d85db                         test       r11, r11
01098 0f8d66020000                   jge        0x7fea6fe70b84
0109e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
010a3 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
010a7 4d85d2                         test       r10, r10
010aa 0f8554020000                   jne        0x7fea6fe70b84
010b0 bd08000000                     mov        ebp, 8
010b5 be17000000                     mov        esi, 0x17
010ba 6690                           nop        
010bc c5f877                         vzeroupper 
010bf e81c74b6ff                     call       0x7fea6f9d7d60
010c4 0f1f8400bc110009               nop        dword ptr [rax + rax + 0x90011bc]
010cc 4903c8                         add        rcx, r8
010cf 493bce                         cmp        rcx, r14
010d2 7e08                           jle        0x7fea6fe7095c
010d4 4533ed                         xor        r13d, r13d
010d7 e9cbefffff                     jmp        0x7fea6fe6f927
010dc 4533ed                         xor        r13d, r13d
010df bf01000000                     mov        edi, 1
010e4 e9c0efffff                     jmp        0x7fea6fe6f929
010e9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
010ee 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
010f3 4585c0                         test       r8d, r8d
010f6 0f8470070000                   je         0x7fea6fe710ec
010fc 4d8bc8                         mov        r9, r8
010ff 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01104 4585db                         test       r11d, r11d
01107 0f8c70070000                   jl         0x7fea6fe710fd
0110d 488b5c2448                     mov        rbx, qword ptr [rsp + 0x48]
01112 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01117 8bb424a4000000                 mov        esi, dword ptr [rsp + 0xa4]
0111e e927f0ffff                     jmp        0x7fea6fe6f9ca
01123 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0112b 458b4b08                       mov        r9d, dword ptr [r11 + 8]
0112f 4585c9                         test       r9d, r9d
01132 0f8656070000                   jbe        0x7fea6fe7110e
01138 418b6b0c                       mov        ebp, dword ptr [r11 + 0xc]
0113c e964f4ffff                     jmp        0x7fea6fe6fe25
01141 488b8c24d8000000               mov        rcx, qword ptr [rsp + 0xd8]
01149 448b5908                       mov        r11d, dword ptr [rcx + 8]
0114d 4183fb02                       cmp        r11d, 2
01151 0f86b9070000                   jbe        0x7fea6fe71190
01157 8b690c                         mov        ebp, dword ptr [rcx + 0xc]
0115a ffcd                           dec        ebp
0115c 85ed                           test       ebp, ebp
0115e 7e21                           jle        0x7fea6fe70a01
01160 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01168 458b4b10                       mov        r9d, dword ptr [r11 + 0x10]
0116c 45894b14                       mov        dword ptr [r11 + 0x14], r9d
01170 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
01174 41894b10                       mov        dword ptr [r11 + 0x10], ecx
01178 41896b0c                       mov        dword ptr [r11 + 0xc], ebp
0117c e924f4ffff                     jmp        0x7fea6fe6fe25
01181 48be3801cde200000000           movabs     rsi, 0xe2cd0138
0118b 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01193 48ffb424d8000000               push       qword ptr [rsp + 0xd8]
0119b 488f8424d0000000               pop        qword ptr [rsp + 0xd0]
011a3 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
011a8 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
011b0 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
011b8 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
011bd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
011c2 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
011c7 4489542410                     mov        dword ptr [rsp + 0x10], r10d
011cc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
011d1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011d6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
011db 4c89542420                     mov        qword ptr [rsp + 0x20], r10
011e0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
011e5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
011ea 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
011ef 4489542438                     mov        dword ptr [rsp + 0x38], r10d
011f4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
011f9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
011fe 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01203 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01208 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0120d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01212 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01217 90                             nop        
01218 c5f877                         vzeroupper 
0121b e8c0fda9ff                     call       0x7fea6f910860
01220 0f1f84001813000a               nop        dword ptr [rax + rax + 0xa001318]
01228 4885c0                         test       rax, rax
0122b 0f8574f1ffff                   jne        0x7fea6fe6fc25
01231 bef6ffffff                     mov        esi, 0xfffffff6
01236 6690                           nop        
01238 c5f877                         vzeroupper 
0123b e8a072b6ff                     call       0x7fea6f9d7d60
01240 0f1f84003813000b               nop        dword ptr [rax + rax + 0xb001338]
01248 4d63c5                         movsxd     r8, r13d
0124b 4c3b442460                     cmp        r8, qword ptr [rsp + 0x60]
01250 7c1f                           jl         0x7fea6fe70af1
01252 4c3b4c2468                     cmp        r9, qword ptr [rsp + 0x68]
01257 7e0d                           jle        0x7fea6fe70ae6
01259 4533c0                         xor        r8d, r8d
0125c 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01261 e9a3f3ffff                     jmp        0x7fea6fe6fe89
01266 33c9                           xor        ecx, ecx
01268 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
0126c e98bf3ffff                     jmp        0x7fea6fe6fe7c
01271 33c9                           xor        ecx, ecx
01273 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
01277 e98df3ffff                     jmp        0x7fea6fe6fe89
0127c 0f1f4000                       nop        dword ptr [rax]
01280 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01285 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01289 036c240c                       add        ebp, dword ptr [rsp + 0xc]
0128d 488bb42480000000               mov        rsi, qword ptr [rsp + 0x80]
01295 8bd5                           mov        edx, ebp
01297 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0129c c5f877                         vzeroupper 
0129f e83cfda9ff                     call       0x7fea6f910860
012a4 0f1f84009c13000c               nop        dword ptr [rax + rax + 0xc00139c]
012ac 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
012b1 8b542410                       mov        edx, dword ptr [rsp + 0x10]
012b5 488bc8                         mov        rcx, rax
012b8 c5f877                         vzeroupper 
012bb e820fda9ff                     call       0x7fea6f910860
012c0 0f1f8400b813000d               nop        dword ptr [rax + rax + 0xd0013b8]
012c8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012cd 4183c308                       add        r11d, 8
012d1 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
012d6 7ca8                           jl         0x7fea6fe70b00
012d8 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
012dd 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
012e5 418bc3                         mov        eax, r11d
012e8 e9bbefffff                     jmp        0x7fea6fe6fb28
012ed be17000000                     mov        esi, 0x17
012f2 6690                           nop        
012f4 c5f877                         vzeroupper 
012f7 e8e471b6ff                     call       0x7fea6f9d7d60
012fc 0f1f8400f413000e               nop        dword ptr [rax + rax + 0xe0013f4]
01304 bd02000000                     mov        ebp, 2
01309 e9a7fdffff                     jmp        0x7fea6fe70935
0130e be17000000                     mov        esi, 0x17
01313 90                             nop        
01314 c5f877                         vzeroupper 
01317 e8c471b6ff                     call       0x7fea6f9d7d60
0131c 0f1f84001414000f               nop        dword ptr [rax + rax + 0xf001414]
01324 bee4ffffff                     mov        esi, 0xffffffe4
01329 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
01331 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01339 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0133e 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
01346 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0134b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01350 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01355 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0135a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0135f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01364 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01369 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0136e 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01373 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01378 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0137d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01382 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01387 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0138c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01391 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01396 6690                           nop        
01398 c5f877                         vzeroupper 
0139b e84071b6ff                     call       0x7fea6f9d7d60
013a0 0f1f840098140010               nop        dword ptr [rax + rax + 0x10001498]
013a8 bee4ffffff                     mov        esi, 0xffffffe4
013ad 4489542414                     mov        dword ptr [rsp + 0x14], r10d
013b2 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
013b7 4489542418                     mov        dword ptr [rsp + 0x18], r10d
013bc 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
013c1 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
013c6 895c2420                       mov        dword ptr [rsp + 0x20], ebx
013ca 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
013cf 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
013d4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
013d9 4489542438                     mov        dword ptr [rsp + 0x38], r10d
013de 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
013e3 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
013e8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
013ed 4489542458                     mov        dword ptr [rsp + 0x58], r10d
013f2 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
013f7 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
013fc 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01401 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01406 4489442474                     mov        dword ptr [rsp + 0x74], r8d
0140b 90                             nop        
0140c c5f877                         vzeroupper 
0140f e8cc70b6ff                     call       0x7fea6f9d7d60
01414 0f1f84000c150011               nop        dword ptr [rax + rax + 0x1100150c]
0141c 8be8                           mov        ebp, eax
0141e eb0a                           jmp        0x7fea6fe70caa
01420 8be8                           mov        ebp, eax
01422 eb06                           jmp        0x7fea6fe70caa
01424 8be8                           mov        ebp, eax
01426 eb02                           jmp        0x7fea6fe70caa
01428 8be8                           mov        ebp, eax
0142a beccffffff                     mov        esi, 0xffffffcc
0142f 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01437 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
0143f 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01444 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01449 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0144e 6690                           nop        
01450 c5f877                         vzeroupper 
01453 e88870b6ff                     call       0x7fea6f9d7d60
01458 0f1f840050150012               nop        dword ptr [rax + rax + 0x12001550]
01460 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01465 8be8                           mov        ebp, eax
01467 4533c9                         xor        r9d, r9d
0146a 458bd3                         mov        r10d, r11d
0146d bef6ffffff                     mov        esi, 0xfffffff6
01472 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
0147a 4c898424d8000000               mov        qword ptr [rsp + 0xd8], r8
01482 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0148a 6690                           nop        
0148c c5f877                         vzeroupper 
0148f e84c70b6ff                     call       0x7fea6f9d7d60
01494 0f1f84008c150013               nop        dword ptr [rax + rax + 0x1300158c]
0149c be6effffff                     mov        esi, 0xffffff6e
014a1 48ffb424d8000000               push       qword ptr [rsp + 0xd8]
014a9 488f8424d0000000               pop        qword ptr [rsp + 0xd0]
014b1 899424d8000000                 mov        dword ptr [rsp + 0xd8], edx
014b8 48894424f8                     mov        qword ptr [rsp - 8], rax
014bd 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014c1 898424dc000000                 mov        dword ptr [rsp + 0xdc], eax
014c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014cd 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
014d2 4c89442418                     mov        qword ptr [rsp + 0x18], r8
014d7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
014dc 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014e1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014e6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014eb 48ff742440                     push       qword ptr [rsp + 0x40]
014f0 488f442430                     pop        qword ptr [rsp + 0x30]
014f5 897c2438                       mov        dword ptr [rsp + 0x38], edi
014f9 4c896c2440                     mov        qword ptr [rsp + 0x40], r13
014fe 4c89742448                     mov        qword ptr [rsp + 0x48], r14
01503 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01508 89442450                       mov        dword ptr [rsp + 0x50], eax
0150c 894c2454                       mov        dword ptr [rsp + 0x54], ecx
01510 c5f877                         vzeroupper 
01513 e8c86fb6ff                     call       0x7fea6f9d7d60
01518 0f1f840010160014               nop        dword ptr [rax + rax + 0x14001610]
01520 bee4ffffff                     mov        esi, 0xffffffe4
01525 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0152a 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0152f 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01534 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01539 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0153e 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01542 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01547 90                             nop        
01548 c5f877                         vzeroupper 
0154b e8906fb6ff                     call       0x7fea6f9d7d60
01550 0f1f840048160015               nop        dword ptr [rax + rax + 0x15001648]
01558 bef6ffffff                     mov        esi, 0xfffffff6
0155d 666690                         nop        
01560 c5f877                         vzeroupper 
01563 e8786fb6ff                     call       0x7fea6f9d7d60
01568 0f1f840060160016               nop        dword ptr [rax + rax + 0x16001660]
01570 bee4ffffff                     mov        esi, 0xffffffe4
01575 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0157a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0157f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01584 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01589 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0158e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01593 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01598 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0159d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
015a2 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
015a7 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
015ac 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
015b1 4489542454                     mov        dword ptr [rsp + 0x54], r10d
015b6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
015bb 4c89542458                     mov        qword ptr [rsp + 0x58], r10
015c0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
015c5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
015ca 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
015cf 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
015d4 4489442470                     mov        dword ptr [rsp + 0x70], r8d
015d9 666690                         nop        
015dc c5f877                         vzeroupper 
015df e8fc6eb6ff                     call       0x7fea6f9d7d60
015e4 0f1f8400dc160017               nop        dword ptr [rax + rax + 0x170016dc]
015ec be6effffff                     mov        esi, 0xffffff6e
015f1 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015f6 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
015fb 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01600 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01605 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0160a 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
0160e 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01613 90                             nop        
01614 c5f877                         vzeroupper 
01617 e8c46eb6ff                     call       0x7fea6f9d7d60
0161c 0f1f840014170018               nop        dword ptr [rax + rax + 0x18001714]
01624 bee4ffffff                     mov        esi, 0xffffffe4
01629 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0162e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01633 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01638 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0163d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01642 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01647 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0164c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01651 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01656 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0165b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01660 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01665 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0166a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0166f 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01674 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01679 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0167e 48894424f8                     mov        qword ptr [rsp - 8], rax
01683 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01687 89442474                       mov        dword ptr [rsp + 0x74], eax
0168b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01690 c5f877                         vzeroupper 
01693 e8486eb6ff                     call       0x7fea6f9d7d60
01698 0f1f840090170019               nop        dword ptr [rax + rax + 0x19001790]
016a0 bee4ffffff                     mov        esi, 0xffffffe4
016a5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
016ad 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
016b5 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
016bd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
016c2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016c7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
016cc 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016d1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
016d6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016db 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016e0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016e5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
016ea 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016ef 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
016f4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
016f9 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
016fd 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01702 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01707 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0170c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01711 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01716 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0171b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01720 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01725 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0172d 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01732 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01737 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01740 c5f877                         vzeroupper 
01743 e8986db6ff                     call       0x7fea6f9d7d60
01748 0f1f84004018001a               nop        dword ptr [rax + rax + 0x1a001840]
01750 beccffffff                     mov        esi, 0xffffffcc
01755 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
0175a 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0175f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01764 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01769 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0176e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01773 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01778 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0177d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01782 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01787 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0178c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01791 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01796 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0179b 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
017a0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
017a5 4489542470                     mov        dword ptr [rsp + 0x70], r10d
017aa 48894424f8                     mov        qword ptr [rsp - 8], rax
017af 8b442478                       mov        eax, dword ptr [rsp + 0x78]
017b3 89442474                       mov        dword ptr [rsp + 0x74], eax
017b7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017bc c5f877                         vzeroupper 
017bf e81c6db6ff                     call       0x7fea6f9d7d60
017c4 0f1f8400bc18001b               nop        dword ptr [rax + rax + 0x1b0018bc]
017cc beccffffff                     mov        esi, 0xffffffcc
017d1 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
017d6 4489542414                     mov        dword ptr [rsp + 0x14], r10d
017db 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
017e0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017e5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
017ea 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017ef 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
017f4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
017f9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017fe 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01803 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01808 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0180d 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01811 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01816 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0181b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01820 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01825 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0182a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0182f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01834 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01839 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0183e 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01843 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
0184b 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01850 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01859 666690                         nop        
0185c c5f877                         vzeroupper 
0185f e87c6cb6ff                     call       0x7fea6f9d7d60
01864 0f1f84005c19001c               nop        dword ptr [rax + rax + 0x1c00195c]
0186c 8be8                           mov        ebp, eax
0186e 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01873 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01878 e9f0fbffff                     jmp        0x7fea6fe70ced
0187d 8be8                           mov        ebp, eax
0187f 488b5c2448                     mov        rbx, qword ptr [rsp + 0x48]
01884 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01889 e99cfbffff                     jmp        0x7fea6fe70caa
0188e bee4ffffff                     mov        esi, 0xffffffe4
01893 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01898 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
018a0 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018a5 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
018aa 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
018af 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
018b4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
018b9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
018be 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
018c3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
018c8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018cd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018d2 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
018d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
018dc 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
018e1 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
018e6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
018eb 4c89542450                     mov        qword ptr [rsp + 0x50], r10
018f0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018f5 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018fa 4489442468                     mov        dword ptr [rsp + 0x68], r8d
018ff 90                             nop        
01900 c5f877                         vzeroupper 
01903 e8d86bb6ff                     call       0x7fea6f9d7d60
01908 0f1f8400001a001d               nop        dword ptr [rax + rax + 0x1d001a00]
01910 bee4ffffff                     mov        esi, 0xffffffe4
01915 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0191a 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01922 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01927 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0192c 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01931 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01936 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0193b 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
01940 48894c2420                     mov        qword ptr [rsp + 0x20], rcx
01945 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0194a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0194f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01954 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01959 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0195e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01963 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01968 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0196d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01972 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01977 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0197c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01981 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01986 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
0198b 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01990 c5f877                         vzeroupper 
01993 e8486bb6ff                     call       0x7fea6f9d7d60
01998 0f1f8400901a001e               nop        dword ptr [rax + rax + 0x1e001a90]
019a0 bee4ffffff                     mov        esi, 0xffffffe4
019a5 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
019aa 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019af 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
019b4 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
019b9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
019be 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019c3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
019c8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
019cd 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
019d2 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
019d7 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
019df 90                             nop        
019e0 c5f877                         vzeroupper 
019e3 e8f86ab6ff                     call       0x7fea6f9d7d60
019e8 0f1f8400e01a001f               nop        dword ptr [rax + rax + 0x1f001ae0]
019f0 bee4ffffff                     mov        esi, 0xffffffe4
019f5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
019fd 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01a05 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01a0d 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01a12 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01a1a 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01a1f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a24 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a29 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01a2e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01a33 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a38 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a3d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01a42 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a47 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a4c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01a51 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01a56 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01a5b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01a60 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a65 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01a6a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a6f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01a74 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01a79 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a83 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a87 89442468                       mov        dword ptr [rsp + 0x68], eax
01a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a90 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01a98 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01a9d 4489742470                     mov        dword ptr [rsp + 0x70], r14d
01aa2 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
01aa7 89542478                       mov        dword ptr [rsp + 0x78], edx
01aab c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01ab4 c5f877                         vzeroupper 
01ab7 e8246ab6ff                     call       0x7fea6f9d7d60
01abc 0f1f8400b41b0020               nop        dword ptr [rax + rax + 0x20001bb4]
01ac4 bee4ffffff                     mov        esi, 0xffffffe4
01ac9 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01ad1 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01ad9 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01ae1 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01ae6 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01aee 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01af3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01af8 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01afd 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01b02 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b07 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b0c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b11 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b16 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b1b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01b20 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b25 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b2a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01b2f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01b34 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01b39 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01b3e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b43 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01b48 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01b4d 666690                         nop        
01b50 c5f877                         vzeroupper 
01b53 e88869b6ff                     call       0x7fea6f9d7d60
01b58 0f1f8400501c0021               nop        dword ptr [rax + rax + 0x21001c50]
01b60 bee4ffffff                     mov        esi, 0xffffffe4
01b65 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01b6d 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01b75 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01b7d 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01b82 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01b8a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01b8f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b94 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01b99 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01b9e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ba3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ba8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01bad 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bb2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01bb7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01bbc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01bc1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01bc6 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01bcb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01bd0 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01bd5 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01bda 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01bdf 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01be4 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01be9 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01bee 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01bf3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01bf8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01bfd 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01c02 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01c07 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
01c0d 666690                         nop        
01c10 c5f877                         vzeroupper 
01c13 e8c868b6ff                     call       0x7fea6f9d7d60
01c18 0f1f8400101d0022               nop        dword ptr [rax + rax + 0x22001d10]
01c20 beccffffff                     mov        esi, 0xffffffcc
01c25 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01c2a 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01c2f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01c34 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01c39 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c3e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01c43 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c48 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c4d 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01c52 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01c57 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
01c5f 90                             nop        
01c60 c5f877                         vzeroupper 
01c63 e87868b6ff                     call       0x7fea6f9d7d60
01c68 0f1f8400601d0023               nop        dword ptr [rax + rax + 0x23001d60]
01c70 beccffffff                     mov        esi, 0xffffffcc
01c75 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01c7d 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
01c85 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
01c8d 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01c92 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01c97 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01c9c 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01ca1 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01ca6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01cab 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cb0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cb5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01cba 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01cbf 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01cc4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01cc9 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01cce 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01cd3 4489542458                     mov        dword ptr [rsp + 0x58], r10d
01cd8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01cdd 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01ce2 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01ce7 4489542470                     mov        dword ptr [rsp + 0x70], r10d
01cec c5f877                         vzeroupper 
01cef e8ec67b6ff                     call       0x7fea6f9d7d60
01cf4 0f1f8400ec1d0024               nop        dword ptr [rax + rax + 0x24001dec]
01cfc beccffffff                     mov        esi, 0xffffffcc
01d01 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01d06 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01d0b 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01d10 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01d15 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d1a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01d1f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01d24 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d29 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01d2e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01d33 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01d38 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01d3d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01d42 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01d47 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01d4c 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01d51 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d56 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01d5b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01d60 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01d65 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d6a 4489542468                     mov        dword ptr [rsp + 0x68], r10d
01d6f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01d74 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01d79 48894424f8                     mov        qword ptr [rsp - 8], rax
01d7e 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d82 89442470                       mov        dword ptr [rsp + 0x70], eax
01d86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d8b 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
01d93 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01d98 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01d9d 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
01da2 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01dab 90                             nop        
01dac c5f877                         vzeroupper 
01daf e82c67b6ff                     call       0x7fea6f9d7d60
01db4 0f1f8400ac1e0025               nop        dword ptr [rax + rax + 0x25001eac]
01dbc beccffffff                     mov        esi, 0xffffffcc
01dc1 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
01dc9 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
01dd1 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01dd9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01dde 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
01de6 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01deb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01df0 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01df5 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01dfa 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01dff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e04 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e09 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e0e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e13 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01e18 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e1d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01e22 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01e27 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01e2c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e31 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01e36 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01e3b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e40 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01e45 666690                         nop        
01e48 c5f877                         vzeroupper 
01e4b e89066b6ff                     call       0x7fea6f9d7d60
01e50 0f1f8400481f0026               nop        dword ptr [rax + rax + 0x26001f48]
01e58 418be9                         mov        ebp, r9d
01e5b 83c510                         add        ebp, 0x10
01e5e be6effffff                     mov        esi, 0xffffff6e
01e63 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01e68 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e6d 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01e72 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01e77 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01e7c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e81 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e86 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01e8b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01e90 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01e95 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01e9a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e9f 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01ea4 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01ea9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01eae 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01eb3 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01eb8 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01ebd 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01ec2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01ec7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01ecc 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01ed1 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01ed6 48894424f8                     mov        qword ptr [rsp - 8], rax
01edb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01edf 89442468                       mov        dword ptr [rsp + 0x68], eax
01ee3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee8 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01eed 666690                         nop        
01ef0 c5f877                         vzeroupper 
01ef3 e8e865b6ff                     call       0x7fea6f9d7d60
01ef8 0f1f8400f01f0027               nop        dword ptr [rax + rax + 0x27001ff0]
01f00 418be9                         mov        ebp, r9d
01f03 83c510                         add        ebp, 0x10
01f06 be66ffffff                     mov        esi, 0xffffff66
01f0b 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01f10 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01f15 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01f1a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01f1f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01f24 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01f29 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01f2e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01f33 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f38 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01f3d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01f42 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f47 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01f4c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01f51 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01f56 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01f5b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01f60 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01f65 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01f6a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f6f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01f74 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01f79 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01f7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f83 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01f87 89442468                       mov        dword ptr [rsp + 0x68], eax
01f8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f90 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01f95 666690                         nop        
01f98 c5f877                         vzeroupper 
01f9b e84065b6ff                     call       0x7fea6f9d7d60
01fa0 0f1f840098200028               nop        dword ptr [rax + rax + 0x28002098]
01fa8 bee4ffffff                     mov        esi, 0xffffffe4
01fad 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01fb2 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01fb7 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01fbc 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01fc1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01fc6 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01fcb 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fd0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fd5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01fda 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01fdf 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01fe4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01fe9 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01fee 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ff3 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01ff8 4c89542450                     mov        qword ptr [rsp + 0x50], r10
01ffd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02002 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02007 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0200c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02011 666690                         nop        
02014 c5f877                         vzeroupper 
02017 e8c464b6ff                     call       0x7fea6f9d7d60
0201c 0f1f840014210029               nop        dword ptr [rax + rax + 0x29002114]
02024 bee4ffffff                     mov        esi, 0xffffffe4
02029 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
0202e 4489442410                     mov        dword ptr [rsp + 0x10], r8d
02033 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
02038 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0203d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02042 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02047 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0204c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02051 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02056 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0205b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02060 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02065 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0206a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0206f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02074 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02079 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0207e 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02086 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0208b c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
02094 c5f877                         vzeroupper 
02097 e84464b6ff                     call       0x7fea6f9d7d60
0209c 0f1f84009421002a               nop        dword ptr [rax + rax + 0x2a002194]
020a4 4183c310                       add        r11d, 0x10
020a8 be6effffff                     mov        esi, 0xffffff6e
020ad 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
020b5 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
020bd 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
020c5 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
020ca 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
020d2 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
020d7 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
020dc 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
020e1 4489542418                     mov        dword ptr [rsp + 0x18], r10d
020e6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
020eb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
020f0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020f5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
020fa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020ff 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02104 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02109 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0210e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02113 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02118 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0211d 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02122 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02127 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0212c 48894424f8                     mov        qword ptr [rsp - 8], rax
02131 8b442478                       mov        eax, dword ptr [rsp + 0x78]
02135 89442464                       mov        dword ptr [rsp + 0x64], eax
02139 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213e 6690                           nop        
02140 c5f877                         vzeroupper 
02143 e89863b6ff                     call       0x7fea6f9d7d60
02148 0f1f84004022002b               nop        dword ptr [rax + rax + 0x2b002240]
02150 4183c310                       add        r11d, 0x10
02154 be66ffffff                     mov        esi, 0xffffff66
02159 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
02161 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
02169 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
02171 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
02176 44898c24dc000000               mov        dword ptr [rsp + 0xdc], r9d
0217e 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
02183 448944240c                     mov        dword ptr [rsp + 0xc], r8d
02188 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0218d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02192 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02197 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0219c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021a1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021a6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
021ab 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
021b0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
021b5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
021ba 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
021bf 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
021c4 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
021c9 4c89542450                     mov        qword ptr [rsp + 0x50], r10
021ce 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
021d3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
021d8 48894424f8                     mov        qword ptr [rsp - 8], rax
021dd 8b442478                       mov        eax, dword ptr [rsp + 0x78]
021e1 89442464                       mov        dword ptr [rsp + 0x64], eax
021e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ea 6690                           nop        
021ec c5f877                         vzeroupper 
021ef e8ec62b6ff                     call       0x7fea6f9d7d60
021f4 0f1f8400ec22002c               nop        dword ptr [rax + rax + 0x2c0022ec]
021fc beccffffff                     mov        esi, 0xffffffcc
02201 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
02209 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
02211 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02219 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0221e 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02226 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0222b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02230 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02235 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0223a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0223f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02244 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02249 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0224e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02253 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02258 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0225d 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02262 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02267 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0226c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02271 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02276 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0227b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02280 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02285 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0228a 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0228f 90                             nop        
02290 c5f877                         vzeroupper 
02293 e84862b6ff                     call       0x7fea6f9d7d60
02298 0f1f84009023002d               nop        dword ptr [rax + rax + 0x2d002390]
022a0 beccffffff                     mov        esi, 0xffffffcc
022a5 488bac24d0000000               mov        rbp, qword ptr [rsp + 0xd0]
022ad 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
022b5 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
022bd 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
022c2 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
022ca 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
022cf 448954240c                     mov        dword ptr [rsp + 0xc], r10d
022d4 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
022d9 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
022de 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
022e3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
022e8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
022ed 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022f2 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
022f7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
022fc 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02301 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02306 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0230b 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02310 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02315 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0231a 6690                           nop        
0231c c5f877                         vzeroupper 
0231f e8bc61b6ff                     call       0x7fea6f9d7d60
02324 0f1f84001c24002e               nop        dword ptr [rax + rax + 0x2e00241c]
0232c 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
02333 83c508                         add        ebp, 8
02336 be66ffffff                     mov        esi, 0xffffff66
0233b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
02340 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02345 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0234a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0234f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
02354 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02359 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0235e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02363 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02368 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0236d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02372 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02377 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0237c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02381 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02386 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0238b 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02390 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02395 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0239a 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0239f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
023a4 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
023a9 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
023ae 4489542468                     mov        dword ptr [rsp + 0x68], r10d
023b3 48894424f8                     mov        qword ptr [rsp - 8], rax
023b8 8b442478                       mov        eax, dword ptr [rsp + 0x78]
023bc 8944246c                       mov        dword ptr [rsp + 0x6c], eax
023c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c5 666690                         nop        
023c8 c5f877                         vzeroupper 
023cb e81061b6ff                     call       0x7fea6f9d7d60
023d0 0f1f8400c824002f               nop        dword ptr [rax + rax + 0x2f0024c8]
023d8 8bac24a0000000                 mov        ebp, dword ptr [rsp + 0xa0]
023df 83c508                         add        ebp, 8
023e2 be66ffffff                     mov        esi, 0xffffff66
023e7 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
023ec 4489542410                     mov        dword ptr [rsp + 0x10], r10d
023f1 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
023f6 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
023fb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02400 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02405 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0240a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0240f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02414 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02419 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0241e 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02423 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02428 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0242d 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02432 4c89542450                     mov        qword ptr [rsp + 0x50], r10
02437 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0243c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
02441 48894424f8                     mov        qword ptr [rsp - 8], rax
02446 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0244a 89442464                       mov        dword ptr [rsp + 0x64], eax
0244e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02453 90                             nop        
02454 c5f877                         vzeroupper 
02457 e88460b6ff                     call       0x7fea6f9d7d60
0245c 0f1f840054250030               nop        dword ptr [rax + rax + 0x30002554]
02464 bef6ffffff                     mov        esi, 0xfffffff6
02469 666690                         nop        
0246c c5f877                         vzeroupper 
0246f e86c60b6ff                     call       0x7fea6f9d7d60
02474 0f1f84006c250031               nop        dword ptr [rax + rax + 0x3100256c]
0247c bef6ffffff                     mov        esi, 0xfffffff6
02481 8b6c241c                       mov        ebp, dword ptr [rsp + 0x1c]
02485 666690                         nop        
02488 c5f877                         vzeroupper 
0248b e85060b6ff                     call       0x7fea6f9d7d60
02490 0f1f840088250032               nop        dword ptr [rax + rax + 0x32002588]
02498 bef6ffffff                     mov        esi, 0xfffffff6
0249d 666690                         nop        
024a0 c5f877                         vzeroupper 
024a3 e83860b6ff                     call       0x7fea6f9d7d60
024a8 0f1f8400a0250033               nop        dword ptr [rax + rax + 0x330025a0]
024b0 bef6ffffff                     mov        esi, 0xfffffff6
024b5 8beb                           mov        ebp, ebx
024b7 90                             nop        
024b8 c5f877                         vzeroupper 
024bb e82060b6ff                     call       0x7fea6f9d7d60
024c0 0f1f8400b8250034               nop        dword ptr [rax + rax + 0x340025b8]
024c8 eb14                           jmp        0x7fea6fe71d5e
024ca eb12                           jmp        0x7fea6fe71d5e
024cc eb10                           jmp        0x7fea6fe71d5e
024ce eb0e                           jmp        0x7fea6fe71d5e
024d0 eb0c                           jmp        0x7fea6fe71d5e
024d2 eb0a                           jmp        0x7fea6fe71d5e
024d4 eb08                           jmp        0x7fea6fe71d5e
024d6 eb06                           jmp        0x7fea6fe71d5e
024d8 eb04                           jmp        0x7fea6fe71d5e
024da eb02                           jmp        0x7fea6fe71d5e
024dc eb00                           jmp        0x7fea6fe71d5e
024de 488bf0                         mov        rsi, rax
024e1 e9c2deffff                     jmp        0x7fea6fe6fc28
024e6 bef6ffffff                     mov        esi, 0xfffffff6
024eb 90                             nop        
024ec c5f877                         vzeroupper 
024ef e8ec5fb6ff                     call       0x7fea6f9d7d60
024f4 0f1f8400ec250035               nop        dword ptr [rax + rax + 0x350025ec]
024fc bef6ffffff                     mov        esi, 0xfffffff6
02501 666690                         nop        
02504 c5f877                         vzeroupper 
02507 e8d45fb6ff                     call       0x7fea6f9d7d60
0250c 0f1f840004260036               nop        dword ptr [rax + rax + 0x36002604]
02514 bef6ffffff                     mov        esi, 0xfffffff6
02519 666690                         nop        
0251c c5f877                         vzeroupper 
0251f e8bc5fb6ff                     call       0x7fea6f9d7d60
02524 0f1f84001c260037               nop        dword ptr [rax + rax + 0x3700261c]
0252c bef6ffffff                     mov        esi, 0xfffffff6
02531 418bea                         mov        ebp, r10d
02534 c5f877                         vzeroupper 
02537 e8a45fb6ff                     call       0x7fea6f9d7d60
0253c 0f1f840034260038               nop        dword ptr [rax + rax + 0x38002634]
02544 bef6ffffff                     mov        esi, 0xfffffff6
02549 666690                         nop        
0254c c5f877                         vzeroupper 
0254f e88c5fb6ff                     call       0x7fea6f9d7d60
02554 0f1f84004c260039               nop        dword ptr [rax + rax + 0x3900264c]
0255c 49ba3bfae66fea7f0000           movabs     r10, 0x7fea6fe6fa3b
02566 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0256d e9ee10aaff                     jmp        0x7fea6f912ee0
02572 e8a9dca8ff                     call       0x7fea6f8ffaa0
02577 e9c2daffff                     jmp        0x7fea6fe6f8be
0257c f4                             hlt        
0257d f4                             hlt        
0257e f4                             hlt        
0257f f4                             hlt        
