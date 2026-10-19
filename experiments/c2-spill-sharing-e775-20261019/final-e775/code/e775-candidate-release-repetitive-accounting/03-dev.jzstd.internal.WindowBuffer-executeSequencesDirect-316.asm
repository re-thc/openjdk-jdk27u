00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c029aaff                   jne        0x7f11f78fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85381a0000                   jne        0x7f11f7e599f6
0003e 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00042 4c894c2430                     mov        qword ptr [rsp + 0x30], r9
00047 448bdf                         mov        r11d, edi
0004a 488bde                         mov        rbx, rsi
0004d 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00050 448b5604                       mov        r10d, dword ptr [rsi + 4]
00054 458bca                         mov        r9d, r10d
00057 442bc8                         sub        r9d, eax
0005a 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00061 413bc9                         cmp        ecx, r9d
00064 0f8fb8110000                   jg         0x7f11f7e591a2
0006a 4c8b4e08                       mov        r9, qword ptr [rsi + 8]
0006e 4c894c2440                     mov        qword ptr [rsp + 0x40], r9
00073 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
00077 4c638c24c0000000               movsxd     r9, dword ptr [rsp + 0xc0]
0007f 4863c8                         movsxd     rcx, eax
00082 48034c2440                     add        rcx, qword ptr [rsp + 0x40]
00087 482bf9                         sub        rdi, rcx
0008a 4c3bcf                         cmp        r9, rdi
0008d 0f8f8f110000                   jg         0x7f11f7e591a2
00093 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
00097 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
0009b 4d85ed                         test       r13, r13
0009e 0f84940f0000                   je         0x7f11f7e58fb8
000a4 33ed                           xor        ebp, ebp
000a6 4c8bca                         mov        r9, rdx
000a9 8b7204                         mov        esi, dword ptr [rdx + 4]
000ac 8b7b40                         mov        edi, dword ptr [rbx + 0x40]
000af 418bcb                         mov        ecx, r11d
000b2 4585db                         test       r11d, r11d
000b5 0f8e86000000                   jle        0x7f11f7e580c1
000bb 89442410                       mov        dword ptr [rsp + 0x10], eax
000bf 4c2b6c2440                     sub        r13, qword ptr [rsp + 0x40]
000c4 8d46e0                         lea        eax, [rsi - 0x20]
000c7 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000cc 458d5ae0                       lea        r11d, [r10 - 0x20]
000d0 498bd0                         mov        rdx, r8
000d3 458b5004                       mov        r10d, dword ptr [r8 + 4]
000d7 4585d2                         test       r10d, r10d
000da 0f864c120000                   jbe        0x7f11f7e592ac
000e0 4d63d2                         movsxd     r10, r10d
000e3 4c63c1                         movsxd     r8, ecx
000e6 49ffc8                         dec        r8
000e9 4d3bc2                         cmp        r8, r10
000ec 0f833a120000                   jae        0x7f11f7e592ac
000f2 4c8bd7                         mov        r10, rdi
000f5 4533c0                         xor        r8d, r8d
000f8 48895c2468                     mov        qword ptr [rsp + 0x68], rbx
000fd 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00102 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00106 4c89b42480000000               mov        qword ptr [rsp + 0x80], r14
0010e 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
00116 896c2454                       mov        dword ptr [rsp + 0x54], ebp
0011a 89742458                       mov        dword ptr [rsp + 0x58], esi
0011e 897c247c                       mov        dword ptr [rsp + 0x7c], edi
00122 89842490000000                 mov        dword ptr [rsp + 0x90], eax
00129 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00131 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00139 4533d2                         xor        r10d, r10d
0013c e997010000                     jmp        0x7f11f7e58258
00141 85ff                           test       edi, edi
00143 0f84ab110000                   je         0x7f11f7e59274
00149 4c8bc7                         mov        r8, rdi
0014c 4533d2                         xor        r10d, r10d
0014f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00154 85c0                           test       eax, eax
00156 0f8c54110000                   jl         0x7f11f7e59230
0015c 3b742438                       cmp        esi, dword ptr [rsp + 0x38]
00160 0f824e110000                   jb         0x7f11f7e59234
00166 468d2c18                       lea        r13d, [rax + r11]
0016a 418b7804                       mov        edi, dword ptr [r8 + 4]
0016e 413bfd                         cmp        edi, r13d
00171 0f8241110000                   jb         0x7f11f7e59238
00177 4585db                         test       r11d, r11d
0017a 0f8c3c110000                   jl         0x7f11f7e5923c
00180 4585db                         test       r11d, r11d
00183 7433                           je         0x7f11f7e58138
00185 498d740008                     lea        rsi, [r8 + rax + 8]
0018a 4b8d7c1108                     lea        rdi, [r9 + r10 + 8]
0018f 4963d3                         movsxd     rdx, r11d
00192 4883fa20                       cmp        rdx, 0x20
00196 773a                           ja         0x7f11f7e58152
00198 4d63d3                         movsxd     r10, r11d
0019b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001a2 c442a8f5db                     bzhi       r11, r11, r10
001a7 c4c1fb92fb                     kmovq      k7, r11
001ac 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
001b2 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
001b8 44896b38                       mov        dword ptr [rbx + 0x38], r13d
001bc c5f877                         vzeroupper 
001bf 4881c4b0000000                 add        rsp, 0xb0
001c6 5d                             pop        rbp
001c7 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001cb 0f878f180000                   ja         0x7f11f7e599e0
001d1 c3                             ret        
001d2 c5f877                         vzeroupper 
001d5 49ba204f8ef7117f0000           movabs     r10, 0x7f11f78e4f20
001df 41ffd2                         call       r10
001e2 0f1f840000000000               nop        dword ptr [rax + rax]
001ea ebcc                           jmp        0x7f11f7e58138
001ec 0f1f4000                       nop        dword ptr [rax]
001f0 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
001f5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
001f9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
001fd 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00202 8bd5                           mov        edx, ebp
00204 c5f877                         vzeroupper 
00207 e8d436aaff                     call       0x7f11f78fb860
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00219 8b542410                       mov        edx, dword ptr [rsp + 0x10]
0021d 488bc8                         mov        rcx, rax
00220 c5f877                         vzeroupper 
00223 e8b836aaff                     call       0x7f11f78fb860
00228 0f1f840020030001               nop        dword ptr [rax + rax + 0x1000320]
00230 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00235 4183c308                       add        r11d, 8
00239 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
0023e 7cb0                           jl         0x7f11f7e58170
00240 e9a10d0000                     jmp        0x7f11f7e58f66
00245 4d63d3                         movsxd     r10, r11d
00248 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0024f c442a8f5db                     bzhi       r11, r11, r10
00254 c4c1fb92fb                     kmovq      k7, r11
00259 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0025f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00265 e97c0d0000                     jmp        0x7f11f7e58f66
0026a 418bea                         mov        ebp, r10d
0026d 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
00275 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00279 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
0027d 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00282 8b7c2428                       mov        edi, dword ptr [rsp + 0x28]
00286 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0028b 44890c24                       mov        dword ptr [rsp], r9d
0028f 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00294 44895c2408                     mov        dword ptr [rsp + 8], r11d
00299 458bca                         mov        r9d, r10d
0029c c5f877                         vzeroupper 
0029f e83c36aaff                     call       0x7f11f78fb860
002a4 0f1f84009c030002               nop        dword ptr [rax + rax + 0x200039c]
002ac 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
002b0 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
002b5 41ffc0                         inc        r8d
002b8 443b442464                     cmp        r8d, dword ptr [rsp + 0x64]
002bd 0f8d920d0000                   jge        0x7f11f7e58fd5
002c3 89442410                       mov        dword ptr [rsp + 0x10], eax
002c7 488b9424c0000000               mov        rdx, qword ptr [rsp + 0xc0]
002cf 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
002d3 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002d8 4e8b4cc208                     mov        r9, qword ptr [rdx + r8*8 + 8]
002dd 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
002e2 48899424c0000000               mov        qword ptr [rsp + 0xc0], rdx
002ea 418bc9                         mov        ecx, r9d
002ed 81e1ffff0100                   and        ecx, 0x1ffff
002f3 4d8bd9                         mov        r11, r9
002f6 49c1fb24                       sar        r11, 0x24
002fa 49c1e912                       shr        r9, 0x12
002fe 458bdb                         mov        r11d, r11d
00301 458bc9                         mov        r9d, r9d
00304 4181e1ffff0300                 and        r9d, 0x3ffff
0030b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00310 4585db                         test       r11d, r11d
00313 7d17                           jge        0x7f11f7e582ac
00315 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0031a 458b4b04                       mov        r9d, dword ptr [r11 + 4]
0031e 453bc1                         cmp        r8d, r9d
00321 0f83110f0000                   jae        0x7f11f7e591b8
00327 478b5c8308                     mov        r11d, dword ptr [r11 + r8*4 + 8]
0032c 85c9                           test       ecx, ecx
0032e 0f84c30c0000                   je         0x7f11f7e58f77
00334 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00339 452bc2                         sub        r8d, r10d
0033c 413bc8                         cmp        ecx, r8d
0033f 0f8fbc0e0000                   jg         0x7f11f7e59181
00345 448bc1                         mov        r8d, ecx
00348 4183fb03                       cmp        r11d, 3
0034c 7f66                           jg         0x7f11f7e58334
0034e 4585c0                         test       r8d, r8d
00351 7403                           je         0x7f11f7e582d6
00353 41ffcb                         dec        r11d
00356 4585db                         test       r11d, r11d
00359 0f842c0d0000                   je         0x7f11f7e5900b
0035f 4183fb03                       cmp        r11d, 3
00363 0f843f0d0000                   je         0x7f11f7e59028
00369 4183fb02                       cmp        r11d, 2
0036d 0f8693000000                   jbe        0x7f11f7e58386
00373 48beb801a5e200000000           movabs     rsi, 0xe2a501b8
0037d 418bea                         mov        ebp, r10d
00380 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00385 666690                         nop        
00388 c5f877                         vzeroupper 
0038b e85035aaff                     call       0x7f11f78fb860
00390 0f1f840088040003               nop        dword ptr [rax + rax + 0x3000488]
00398 4885c0                         test       rax, rax
0039b 0f8407100000                   je         0x7f11f7e59328
003a1 488bf0                         mov        rsi, rax
003a4 c5f877                         vzeroupper 
003a7 4881c4b0000000                 add        rsp, 0xb0
003ae 5d                             pop        rbp
003af e9acf9b6ff                     jmp        0x7f11f79c7ce0
003b4 4489442424                     mov        dword ptr [rsp + 0x24], r8d
003b9 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
003c1 458b4804                       mov        r9d, dword ptr [r8 + 4]
003c5 4183c3fd                       add        r11d, -3
003c9 4183f902                       cmp        r9d, 2
003cd 0f86a50e0000                   jbe        0x7f11f7e591f8
003d3 458b400c                       mov        r8d, dword ptr [r8 + 0xc]
003d7 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
003df 45894110                       mov        dword ptr [r9 + 0x10], r8d
003e3 458b4908                       mov        r9d, dword ptr [r9 + 8]
003e7 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
003ef 4589480c                       mov        dword ptr [r8 + 0xc], r9d
003f3 45895808                       mov        dword ptr [r8 + 8], r11d
003f7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
003fc 448b442424                     mov        r8d, dword ptr [rsp + 0x24]
00401 e9b4010000                     jmp        0x7f11f7e5853a
00406 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0040b 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00413 418b7804                       mov        edi, dword ptr [r8 + 4]
00417 443bdf                         cmp        r11d, edi
0041a 0f83500f0000                   jae        0x7f11f7e592f0
00420 438b6c9808                     mov        ebp, dword ptr [r8 + r11*4 + 8]
00425 4585db                         test       r11d, r11d
00428 0f8e68010000                   jle        0x7f11f7e58516
0042e 85ff                           test       edi, edi
00430 0f86ba0f0000                   jbe        0x7f11f7e59370
00436 4c63c7                         movsxd     r8, edi
00439 4d63cb                         movsxd     r9, r11d
0043c 49ffc9                         dec        r9
0043f 4d3bc8                         cmp        r9, r8
00442 0f83a80f0000                   jae        0x7f11f7e59370
00448 83ff01                         cmp        edi, 1
0044b 0f869f0f0000                   jbe        0x7f11f7e59370
00451 458d4bff                       lea        r9d, [r11 - 1]
00455 4d63c1                         movsxd     r8, r9d
00458 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00460 418bc9                         mov        ecx, r9d
00463 83c1cc                         add        ecx, -0x34
00466 c1e902                         shr        ecx, 2
00469 468d4c19ff                     lea        r9d, [rcx + r11 - 1]
0046e bb04000000                     mov        ebx, 4
00473 c442e0f5c9                     bzhi       r9, r9, rbx
00478 4d2bc1                         sub        r8, r9
0047b 4533c9                         xor        r9d, r9d
0047e 4d85c0                         test       r8, r8
00481 4d0f4cc1                       cmovl      r8, r9
00485 458bc0                         mov        r8d, r8d
00488 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00490 438b4c9904                     mov        ecx, dword ptr [r9 + r11*4 + 4]
00495 43894c9908                     mov        dword ptr [r9 + r11*4 + 8], ecx
0049a 41ffcb                         dec        r11d
0049d 453bd8                         cmp        r11d, r8d
004a0 7fe6                           jg         0x7f11f7e58408
004a2 4183fb3f                       cmp        r11d, 0x3f
004a6 0f8ec8000000                   jle        0x7f11f7e584f4
004ac 0f1f4000                       nop        dword ptr [rax]
004b0 418d73c1                       lea        esi, [r11 - 0x3f]
004b4 458d4bd0                       lea        r9d, [r11 - 0x30]
004b8 458d43f1                       lea        r8d, [r11 - 0xf]
004bc 418d4bf0                       lea        ecx, [r11 - 0x10]
004c0 488b9c24c8000000               mov        rbx, qword ptr [rsp + 0xc8]
004c8 62f17e486f848b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + rcx*4 + 8]
004d3 62b17e487f848308000000         vmovdqu32  zmmword ptr [rbx + r8*4 + 8], zmm0
004de 418d4be1                       lea        ecx, [r11 - 0x1f]
004e2 418d5be0                       lea        ebx, [r11 - 0x20]
004e6 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004ee 62d17e486f849808000000         vmovdqu32  zmm0, zmmword ptr [r8 + rbx*4 + 8]
004f9 62d17e487f848808000000         vmovdqu32  zmmword ptr [r8 + rcx*4 + 8], zmm0
00504 62917e486f848808000000         vmovdqu32  zmm0, zmmword ptr [r8 + r9*4 + 8]
0050f 458d4bd1                       lea        r9d, [r11 - 0x2f]
00513 62917e487f848808000000         vmovdqu32  zmmword ptr [r8 + r9*4 + 8], zmm0
0051e 4183c3c0                       add        r11d, -0x40
00522 62917e486f849808000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11*4 + 8]
0052d 62d17e487f84b008000000         vmovdqu32  zmmword ptr [r8 + rsi*4 + 8], zmm0
00538 4183fb3f                       cmp        r11d, 0x3f
0053c 0f8f6effffff                   jg         0x7f11f7e58430
00542 4183fb0f                       cmp        r11d, 0xf
00546 7e2c                           jle        0x7f11f7e584f4
00548 458d43f1                       lea        r8d, [r11 - 0xf]
0054c 4183c3f0                       add        r11d, -0x10
00550 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00558 62917e486f849908000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11*4 + 8]
00563 62917e487f848108000000         vmovdqu32  zmmword ptr [r9 + r8*4 + 8], zmm0
0056e 4183fb0f                       cmp        r11d, 0xf
00572 7fd4                           jg         0x7f11f7e584c8
00574 4585db                         test       r11d, r11d
00577 7e1d                           jle        0x7f11f7e58516
00579 666690                         nop        
0057c 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00584 478b4c9804                     mov        r9d, dword ptr [r8 + r11*4 + 4]
00589 47894c9808                     mov        dword ptr [r8 + r11*4 + 8], r9d
0058e 41ffcb                         dec        r11d
00591 4585db                         test       r11d, r11d
00594 7fe6                           jg         0x7f11f7e584fc
00596 85ff                           test       edi, edi
00598 0f86220e0000                   jbe        0x7f11f7e59340
0059e 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
005a6 896908                         mov        dword ptr [rcx + 8], ebp
005a9 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
005ae 896c2448                       mov        dword ptr [rsp + 0x48], ebp
005b2 48898c24c8000000               mov        qword ptr [rsp + 0xc8], rcx
005ba 4489442428                     mov        dword ptr [rsp + 0x28], r8d
005bf 4963d0                         movsxd     rdx, r8d
005c2 4c63442410                     movsxd     r8, dword ptr [rsp + 0x10]
005c7 4c03442440                     add        r8, qword ptr [rsp + 0x40]
005cc 4c03c2                         add        r8, rdx
005cf 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
005d4 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
005d9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
005de 4c634c2448                     movsxd     r9, dword ptr [rsp + 0x48]
005e3 418bdb                         mov        ebx, r11d
005e6 2b5c2448                       sub        ebx, dword ptr [rsp + 0x48]
005ea 4d3bc8                         cmp        r9, r8
005ed 7f17                           jg         0x7f11f7e58586
005ef 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
005f4 4585db                         test       r11d, r11d
005f7 0f845b0b0000                   je         0x7f11f7e590d8
005fd 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00602 33c9                           xor        ecx, ecx
00604 eb0f                           jmp        0x7f11f7e58595
00606 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0060b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00610 b901000000                     mov        ecx, 1
00615 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0061a 4585db                         test       r11d, r11d
0061d 0f8ef50b0000                   jle        0x7f11f7e59198
00623 85c9                           test       ecx, ecx
00625 0f85d4090000                   jne        0x7f11f7e58f7f
0062b 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00630 44035c242c                     add        r11d, dword ptr [rsp + 0x2c]
00635 458bca                         mov        r9d, r10d
00638 44034c2428                     add        r9d, dword ptr [rsp + 0x28]
0063d 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00642 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
0064a 0f8f1afcffff                   jg         0x7f11f7e581ea
00650 443b8c2490000000               cmp        r9d, dword ptr [rsp + 0x90]
00658 0f8f0cfcffff                   jg         0x7f11f7e581ea
0065e 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
00662 83c5f1                         add        ebp, -0xf
00665 49c7c500000080                 mov        r13, 0xffffffff80000000
0066c 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00671 4183f810                       cmp        r8d, 0x10
00675 0f8ed0030000                   jle        0x7f11f7e589cb
0067b 4183f830                       cmp        r8d, 0x30
0067f 0f8e87000000                   jle        0x7f11f7e5868c
00685 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0068a 458b5804                       mov        r11d, dword ptr [r8 + 4]
0068e 4585d2                         test       r10d, r10d
00691 0f8c35100000                   jl         0x7f11f7e5964c
00697 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0069c 4585c0                         test       r8d, r8d
0069f 0f8c27100000                   jl         0x7f11f7e5964c
006a5 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
006aa 443b4c2414                     cmp        r9d, dword ptr [rsp + 0x14]
006af 0f8217100000                   jb         0x7f11f7e5964c
006b5 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
006ba 0f820c100000                   jb         0x7f11f7e5964c
006c0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
006c5 4585db                         test       r11d, r11d
006c8 0f8438040000                   je         0x7f11f7e58a86
006ce 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
006d3 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
006d8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
006dd 4d8bd3                         mov        r10, r11
006e0 4b8d740308                     lea        rsi, [r11 + r8 + 8]
006e5 4883fa20                       cmp        rdx, 0x20
006e9 0f86f2030000                   jbe        0x7f11f7e58a61
006ef c5f877                         vzeroupper 
006f2 49ba204f8ef7117f0000           movabs     r10, 0x7f11f78e4f20
006fc 41ffd2                         call       r10
006ff 0f1f840000000000               nop        dword ptr [rax + rax]
00707 e9fa030000                     jmp        0x7f11f7e58a86
0070c 85ed                           test       ebp, ebp
0070e 0f8c840f0000                   jl         0x7f11f7e59618
00714 8b4c2458                       mov        ecx, dword ptr [rsp + 0x58]
00718 8d69f1                         lea        ebp, [rcx - 0xf]
0071b 443bd5                         cmp        r10d, ebp
0071e 0f83800e0000                   jae        0x7f11f7e59524
00724 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00729 458b5b04                       mov        r11d, dword ptr [r11 + 4]
0072d 458bc2                         mov        r8d, r10d
00730 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00735 418d6bf1                       lea        ebp, [r11 - 0xf]
00739 4d63c8                         movsxd     r9, r8d
0073c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00741 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00748 85ed                           test       ebp, ebp
0074a 0f8cc40f0000                   jl         0x7f11f7e59694
00750 458d53f1                       lea        r10d, [r11 - 0xf]
00754 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00759 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0075e 453bc2                         cmp        r8d, r10d
00761 0f83710e0000                   jae        0x7f11f7e59558
00767 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
0076b 448d5710                       lea        r10d, [rdi + 0x10]
0076f 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00774 4c63d7                         movsxd     r10, edi
00777 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
0077b c4a17a7f441208                 vmovdqu    xmmword ptr [rdx + r10 + 8], xmm0
00782 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00787 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
0078c 0f8d94020000                   jge        0x7f11f7e589a6
00792 4d2bca                         sub        r9, r10
00795 4863d1                         movsxd     rdx, ecx
00798 4883c2f1                       add        rdx, -0xf
0079c 4d63d0                         movsxd     r10, r8d
0079f 4b8d0c0a                       lea        rcx, [r10 + r9]
007a3 483bca                         cmp        rcx, rdx
007a6 0f83d40f0000                   jae        0x7f11f7e59700
007ac 486374242c                     movsxd     rsi, dword ptr [rsp + 0x2c]
007b1 488bce                         mov        rcx, rsi
007b4 492bca                         sub        rcx, r10
007b7 4883c10f                       add        rcx, 0xf
007bb 4883e1f0                       and        rcx, 0xfffffffffffffff0
007bf 8bc9                           mov        ecx, ecx
007c1 448d543910                     lea        r10d, [rcx + rdi + 0x10]
007c6 4d63d2                         movsxd     r10, r10d
007c9 4f8d4c0af0                     lea        r9, [r10 + r9 - 0x10]
007ce 4c3bca                         cmp        r9, rdx
007d1 0f83a90f0000                   jae        0x7f11f7e59700
007d7 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
007dc 0f839e0f0000                   jae        0x7f11f7e59700
007e2 4d63db                         movsxd     r11, r11d
007e5 4983c2f0                       add        r10, -0x10
007e9 4983c3f1                       add        r11, -0xf
007ed 4d3bd3                         cmp        r10, r11
007f0 0f838a0f0000                   jae        0x7f11f7e59700
007f6 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
007fb 4181faf0ffff7f                 cmp        r10d, 0x7ffffff0
00802 0f8f940f0000                   jg         0x7f11f7e5971c
00808 448b4c2424                     mov        r9d, dword ptr [rsp + 0x24]
0080d 442bcf                         sub        r9d, edi
00810 83c720                         add        edi, 0x20
00813 90                             nop        
00814 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00819 458bc1                         mov        r8d, r9d
0081c 4403442418                     add        r8d, dword ptr [rsp + 0x18]
00821 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00826 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0082d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00832 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00839 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0083e 4183c210                       add        r10d, 0x10
00842 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00847 458bc2                         mov        r8d, r10d
0084a 443bd7                         cmp        r10d, edi
0084d 7cc5                           jl         0x7f11f7e58794
0084f 4881c610ffffff                 add        rsi, -0xf0
00856 4881fe00000080                 cmp        rsi, -0x80000000
0085d 490f4cf5                       cmovl      rsi, r13
00861 448bd6                         mov        r10d, esi
00864 453bc2                         cmp        r8d, r10d
00867 0f8d78010000                   jge        0x7f11f7e58965
0086d 458bd8                         mov        r11d, r8d
00870 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00875 6666660f1f840000000000         nop        word ptr [rax + rax]
00880 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00885 4963d0                         movsxd     rdx, r8d
00888 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0088d 418bc9                         mov        ecx, r9d
00890 034c2418                       add        ecx, dword ptr [rsp + 0x18]
00894 448bd9                         mov        r11d, ecx
00897 488b7c2470                     mov        rdi, qword ptr [rsp + 0x70]
0089c c5fa6f440f08                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 8]
008a2 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
008a6 c4a17a7f440708                 vmovdqu    xmmword ptr [rdi + r8 + 8], xmm0
008ad 4963cb                         movsxd     rcx, r11d
008b0 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
008b5 c4c17a6f440b18                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x18]
008bc c5fa7f441718                   vmovdqu    xmmword ptr [rdi + rdx + 0x18], xmm0
008c2 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
008c7 c4c17a6f440b28                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x28]
008ce c5fa7f441728                   vmovdqu    xmmword ptr [rdi + rdx + 0x28], xmm0
008d4 c4c17a6f440b38                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x38]
008db c5fa7f441738                   vmovdqu    xmmword ptr [rdi + rdx + 0x38], xmm0
008e1 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
008e6 c4c17a6f440b48                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x48]
008ed c5fa7f441748                   vmovdqu    xmmword ptr [rdi + rdx + 0x48], xmm0
008f3 c4c17a6f440b58                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x58]
008fa c5fa7f441758                   vmovdqu    xmmword ptr [rdi + rdx + 0x58], xmm0
00900 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00905 c4c17a6f440b68                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x68]
0090c c5fa7f441768                   vmovdqu    xmmword ptr [rdi + rdx + 0x68], xmm0
00912 c4c17a6f440b78                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x78]
00919 c5fa7f441778                   vmovdqu    xmmword ptr [rdi + rdx + 0x78], xmm0
0091f 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00924 c4c17a6f840b88000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x88]
0092e c5fa7f841788000000             vmovdqu    xmmword ptr [rdi + rdx + 0x88], xmm0
00937 c4c17a6f840b98000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0x98]
00941 c5fa7f841798000000             vmovdqu    xmmword ptr [rdi + rdx + 0x98], xmm0
0094a 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0094f c4c17a6f840ba8000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xa8]
00959 c5fa7f8417a8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xa8], xmm0
00962 c4c17a6f840bb8000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xb8]
0096c c5fa7f8417b8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xb8], xmm0
00975 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0097a c4c17a6f840bc8000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xc8]
00984 c5fa7f8417c8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xc8], xmm0
0098d c4c17a6f840bd8000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xd8]
00997 c5fa7f8417d8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xd8], xmm0
009a0 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
009a5 c4c17a6f840be8000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xe8]
009af c5fa7f8417e8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xe8], xmm0
009b8 c4c17a6f840bf8000000           vmovdqu    xmm0, xmmword ptr [r11 + rcx + 0xf8]
009c2 c5fa7f8417f8000000             vmovdqu    xmmword ptr [rdi + rdx + 0xf8], xmm0
009cb 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
009d0 4181c000010000                 add        r8d, 0x100
009d7 4489442418                     mov        dword ptr [rsp + 0x18], r8d
009dc 453bc2                         cmp        r8d, r10d
009df 0f8c9bfeffff                   jl         0x7f11f7e58800
009e5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
009ea 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
009ef 7d35                           jge        0x7f11f7e589a6
009f1 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
009f6 458bc2                         mov        r8d, r10d
009f9 666690                         nop        
009fc 478d1c01                       lea        r11d, [r9 + r8]
00a00 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00a05 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00a0c 458bd8                         mov        r11d, r8d
00a0f 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00a14 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00a1b 4183c010                       add        r8d, 0x10
00a1f 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
00a24 7cd6                           jl         0x7f11f7e5897c
00a26 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00a2b 458bda                         mov        r11d, r10d
00a2e 44035c2424                     add        r11d, dword ptr [rsp + 0x24]
00a33 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00a38 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00a3c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00a41 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00a46 e9c9000000                     jmp        0x7f11f7e58a94
00a4b 85ed                           test       ebp, ebp
00a4d 0f8c350a0000                   jl         0x7f11f7e59408
00a53 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
00a57 83c5f1                         add        ebp, -0xf
00a5a 443bd5                         cmp        r10d, ebp
00a5d 0f83c1090000                   jae        0x7f11f7e593a4
00a63 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00a68 458b4304                       mov        r8d, dword ptr [r11 + 4]
00a6c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00a71 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00a76 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00a7b c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00a82 418d68f1                       lea        ebp, [r8 - 0xf]
00a86 85ed                           test       ebp, ebp
00a88 0f8c2a0a0000                   jl         0x7f11f7e59438
00a8e 4183c0f1                       add        r8d, -0xf
00a92 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00a97 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a9c 453bd8                         cmp        r11d, r8d
00a9f 0f83af090000                   jae        0x7f11f7e593d4
00aa5 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00aaa 4403542424                     add        r10d, dword ptr [rsp + 0x24]
00aaf 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00ab4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00ab9 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00abe c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00ac5 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00aca 4503c2                         add        r8d, r10d
00acd 458bd8                         mov        r11d, r8d
00ad0 442b5c2448                     sub        r11d, dword ptr [rsp + 0x48]
00ad5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00ada 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00adf eb33                           jmp        0x7f11f7e58a94
00ae1 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ae6 4d63d2                         movsxd     r10, r10d
00ae9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00af0 c442a8f5db                     bzhi       r11, r11, r10
00af5 c4c1fb92fb                     kmovq      k7, r11
00afa 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b00 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b06 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00b0a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00b0f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00b14 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00b19 458b5204                       mov        r10d, dword ptr [r10 + 4]
00b1d 458d42f1                       lea        r8d, [r10 - 0xf]
00b21 4489442418                     mov        dword ptr [rsp + 0x18], r8d
00b26 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00b2b 4183fb10                       cmp        r11d, 0x10
00b2f 7f6f                           jg         0x7f11f7e58b20
00b31 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00b36 4183f810                       cmp        r8d, 0x10
00b3a 7c64                           jl         0x7f11f7e58b20
00b3c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00b41 4585db                         test       r11d, r11d
00b44 0f8cfa0b0000                   jl         0x7f11f7e596c4
00b4a 4183c2f1                       add        r10d, -0xf
00b4e 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
00b53 453bc2                         cmp        r8d, r10d
00b56 0f83b00a0000                   jae        0x7f11f7e5958c
00b5c 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00b61 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00b66 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00b6b c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00b72 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b77 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00b7c 0f83d60a0000                   jae        0x7f11f7e595d8
00b82 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00b87 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00b8b c4a17a7f440108                 vmovdqu    xmmword ptr [rcx + r8 + 8], xmm0
00b92 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
00b97 438d0402                       lea        eax, [r10 + r8]
00b9b e910f7ffff                     jmp        0x7f11f7e58230
00ba0 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00ba5 442b5c2460                     sub        r11d, dword ptr [rsp + 0x60]
00baa 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00baf 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00bb4 4d8bd8                         mov        r11, r8
00bb7 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00bbc 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00bc1 4183c308                       add        r11d, 8
00bc5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00bca 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00bcf 4403442420                     add        r8d, dword ptr [rsp + 0x20]
00bd4 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00bd9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bde 443b5c2420                     cmp        r11d, dword ptr [rsp + 0x20]
00be3 0f8d0d030000                   jge        0x7f11f7e58e76
00be9 4183fb10                       cmp        r11d, 0x10
00bed 0f8d99000000                   jge        0x7f11f7e58c0c
00bf3 4183fb08                       cmp        r11d, 8
00bf7 7d30                           jge        0x7f11f7e58ba9
00bf9 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00bfe 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00c02 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00c06 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00c0b 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00c10 c5f877                         vzeroupper 
00c13 e8c82caaff                     call       0x7f11f78fb860
00c18 0f1f8400100d0004               nop        dword ptr [rax + rax + 0x4000d10]
00c20 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00c24 e987f6ffff                     jmp        0x7f11f7e58230
00c29 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00c2e 8b542450                       mov        edx, dword ptr [rsp + 0x50]
00c32 6690                           nop        
00c34 c5f877                         vzeroupper 
00c37 e8a42caaff                     call       0x7f11f78fb860
00c3c 0f1f8400340d0005               nop        dword ptr [rax + rax + 0x5000d34]
00c44 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00c49 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00c4d 488bc8                         mov        rcx, rax
00c50 c5f877                         vzeroupper 
00c53 e8882caaff                     call       0x7f11f78fb860
00c58 0f1f8400500d0006               nop        dword ptr [rax + rax + 0x6000d50]
00c60 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00c65 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00c6a 0f8d80050000                   jge        0x7f11f7e59170
00c70 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c75 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00c7c 0f8fc20c0000                   jg         0x7f11f7e598c4
00c82 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00c87 e919050000                     jmp        0x7f11f7e59125
00c8c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00c91 4585db                         test       r11d, r11d
00c94 0f8c020c0000                   jl         0x7f11f7e5981c
00c9a 458bda                         mov        r11d, r10d
00c9d 418d6bf1                       lea        ebp, [r11 - 0xf]
00ca1 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00ca6 443bd5                         cmp        r10d, ebp
00ca9 0f83090b0000                   jae        0x7f11f7e59738
00caf 4963ca                         movsxd     rcx, r10d
00cb2 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00cb7 c4c17a6f440908                 vmovdqu    xmm0, xmmword ptr [r9 + rcx + 8]
00cbe 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00cc3 443bc5                         cmp        r8d, ebp
00cc6 0f830c0b0000                   jae        0x7f11f7e59758
00ccc 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00cd0 448d4310                       lea        r8d, [rbx + 0x10]
00cd4 4c63cb                         movsxd     r9, ebx
00cd7 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00cdb c4a17a7f440a08                 vmovdqu    xmmword ptr [rdx + r9 + 8], xmm0
00ce2 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00ce7 0f8df8010000                   jge        0x7f11f7e58e65
00ced 492bc9                         sub        rcx, r9
00cf0 4963fb                         movsxd     rdi, r11d
00cf3 4883c7f1                       add        rdi, -0xf
00cf7 4d63d8                         movsxd     r11, r8d
00cfa 4d8d0c0b                       lea        r9, [r11 + rcx]
00cfe 4c3bcf                         cmp        r9, rdi
00d01 0f83050b0000                   jae        0x7f11f7e5978c
00d07 486354243c                     movsxd     rdx, dword ptr [rsp + 0x3c]
00d0c 4c8bca                         mov        r9, rdx
00d0f 4d2bcb                         sub        r9, r11
00d12 4983c10f                       add        r9, 0xf
00d16 4983e1f0                       and        r9, 0xfffffffffffffff0
00d1a 458bc9                         mov        r9d, r9d
00d1d 458d5c1910                     lea        r11d, [r9 + rbx + 0x10]
00d22 4d63db                         movsxd     r11, r11d
00d25 4d8d4c0bf0                     lea        r9, [r11 + rcx - 0x10]
00d2a 4c3bcf                         cmp        r9, rdi
00d2d 0f83d90a0000                   jae        0x7f11f7e5978c
00d33 443bc5                         cmp        r8d, ebp
00d36 0f83d00a0000                   jae        0x7f11f7e5978c
00d3c 4983c3f0                       add        r11, -0x10
00d40 4c3bdf                         cmp        r11, rdi
00d43 0f83c30a0000                   jae        0x7f11f7e5978c
00d49 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d4e 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00d55 0f8ff90a0000                   jg         0x7f11f7e597d4
00d5b 442bd3                         sub        r10d, ebx
00d5e 83c320                         add        ebx, 0x20
00d61 458bd8                         mov        r11d, r8d
00d64 438d0c02                       lea        ecx, [r10 + r8]
00d68 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
00d6c c5fa6f440f08                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 8]
00d72 c4a17a7f441f08                 vmovdqu    xmmword ptr [rdi + r11 + 8], xmm0
00d79 4183c010                       add        r8d, 0x10
00d7d 443bc3                         cmp        r8d, ebx
00d80 7cdf                           jl         0x7f11f7e58ce1
00d82 4881c210ffffff                 add        rdx, -0xf0
00d89 4881fa00000080                 cmp        rdx, -0x80000000
00d90 490f4cd5                       cmovl      rdx, r13
00d94 8bd2                           mov        edx, edx
00d96 443bc2                         cmp        r8d, edx
00d99 0f8d19010000                   jge        0x7f11f7e58e38
00d9f 90                             nop        
00da0 458bd8                         mov        r11d, r8d
00da3 4963db                         movsxd     rbx, r11d
00da6 478d0c02                       lea        r9d, [r10 + r8]
00daa 418bc8                         mov        ecx, r8d
00dad 458bd9                         mov        r11d, r9d
00db0 8b7c247c                       mov        edi, dword ptr [rsp + 0x7c]
00db4 c4a17a6f441f08                 vmovdqu    xmm0, xmmword ptr [rdi + r11 + 8]
00dbb c5fa7f440f08                   vmovdqu    xmmword ptr [rdi + rcx + 8], xmm0
00dc1 4963c9                         movsxd     rcx, r9d
00dc4 c5fa6f440f18                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x18]
00dca c5fa7f441f18                   vmovdqu    xmmword ptr [rdi + rbx + 0x18], xmm0
00dd0 c5fa6f440f28                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x28]
00dd6 c5fa7f441f28                   vmovdqu    xmmword ptr [rdi + rbx + 0x28], xmm0
00ddc c5fa6f440f38                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x38]
00de2 c5fa7f441f38                   vmovdqu    xmmword ptr [rdi + rbx + 0x38], xmm0
00de8 c5fa6f440f48                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x48]
00dee c5fa7f441f48                   vmovdqu    xmmword ptr [rdi + rbx + 0x48], xmm0
00df4 c5fa6f440f58                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x58]
00dfa c5fa7f441f58                   vmovdqu    xmmword ptr [rdi + rbx + 0x58], xmm0
00e00 c5fa6f440f68                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x68]
00e06 c5fa7f441f68                   vmovdqu    xmmword ptr [rdi + rbx + 0x68], xmm0
00e0c c5fa6f440f78                   vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x78]
00e12 c5fa7f441f78                   vmovdqu    xmmword ptr [rdi + rbx + 0x78], xmm0
00e18 c5fa6f840f88000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x88]
00e21 c5fa7f841f88000000             vmovdqu    xmmword ptr [rdi + rbx + 0x88], xmm0
00e2a c5fa6f840f98000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0x98]
00e33 c5fa7f841f98000000             vmovdqu    xmmword ptr [rdi + rbx + 0x98], xmm0
00e3c c5fa6f840fa8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xa8]
00e45 c5fa7f841fa8000000             vmovdqu    xmmword ptr [rdi + rbx + 0xa8], xmm0
00e4e c5fa6f840fb8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xb8]
00e57 c5fa7f841fb8000000             vmovdqu    xmmword ptr [rdi + rbx + 0xb8], xmm0
00e60 c5fa6f840fc8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xc8]
00e69 c5fa7f841fc8000000             vmovdqu    xmmword ptr [rdi + rbx + 0xc8], xmm0
00e72 c5fa6f840fd8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xd8]
00e7b c5fa7f841fd8000000             vmovdqu    xmmword ptr [rdi + rbx + 0xd8], xmm0
00e84 c5fa6f840fe8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xe8]
00e8d c5fa7f841fe8000000             vmovdqu    xmmword ptr [rdi + rbx + 0xe8], xmm0
00e96 c5fa6f840ff8000000             vmovdqu    xmm0, xmmword ptr [rdi + rcx + 0xf8]
00e9f c5fa7f841ff8000000             vmovdqu    xmmword ptr [rdi + rbx + 0xf8], xmm0
00ea8 4181c000010000                 add        r8d, 0x100
00eaf 443bc2                         cmp        r8d, edx
00eb2 0f8ce8feffff                   jl         0x7f11f7e58d20
00eb8 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00ebd 7d26                           jge        0x7f11f7e58e65
00ebf 90                             nop        
00ec0 478d1c02                       lea        r11d, [r10 + r8]
00ec4 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00ec9 c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
00ed0 458bd8                         mov        r11d, r8d
00ed3 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00eda 4183c010                       add        r8d, 0x10
00ede 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
00ee3 7cdb                           jl         0x7f11f7e58e40
00ee5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00eea 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00eee 418bc2                         mov        eax, r10d
00ef1 e9baf3ffff                     jmp        0x7f11f7e58230
00ef6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00efb 4183fb30                       cmp        r11d, 0x30
00eff 7f63                           jg         0x7f11f7e58ee4
00f01 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00f06 8b542450                       mov        edx, dword ptr [rsp + 0x50]
00f0a 6690                           nop        
00f0c c5f877                         vzeroupper 
00f0f e8cc29aaff                     call       0x7f11f78fb860
00f14 0f1f84000c100007               nop        dword ptr [rax + rax + 0x700100c]
00f1c 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00f21 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00f25 488bc8                         mov        rcx, rax
00f28 c5f877                         vzeroupper 
00f2b e8b029aaff                     call       0x7f11f78fb860
00f30 0f1f840028100008               nop        dword ptr [rax + rax + 0x8001028]
00f38 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00f3d 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
00f42 0f8d9e000000                   jge        0x7f11f7e58f66
00f48 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f4d 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00f54 0f8fc2090000                   jg         0x7f11f7e5989c
00f5a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00f5f e991f2ffff                     jmp        0x7f11f7e58175
00f64 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00f69 4585db                         test       r11d, r11d
00f6c 0f8c5a090000                   jl         0x7f11f7e5984c
00f72 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00f77 4585c0                         test       r8d, r8d
00f7a 0f8c4c090000                   jl         0x7f11f7e5984c
00f80 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
00f85 4403442450                     add        r8d, dword ptr [rsp + 0x50]
00f8a 453bd0                         cmp        r10d, r8d
00f8d 0f8239090000                   jb         0x7f11f7e5984c
00f93 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
00f98 0f822e090000                   jb         0x7f11f7e5984c
00f9e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00fa3 4585db                         test       r11d, r11d
00fa6 743e                           je         0x7f11f7e58f66
00fa8 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00fad 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
00fb2 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
00fb7 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00fbc 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
00fc1 4963d3                         movsxd     rdx, r11d
00fc4 4883fa20                       cmp        rdx, 0x20
00fc8 0f8677f2ffff                   jbe        0x7f11f7e581c5
00fce c5f877                         vzeroupper 
00fd1 49ba204f8ef7117f0000           movabs     r10, 0x7f11f78e4f20
00fdb 41ffd2                         call       r10
00fde 0f1f840000000000               nop        dword ptr [rax + rax]
00fe6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00feb 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00fef 418bc3                         mov        eax, r11d
00ff2 e9b9f2ffff                     jmp        0x7f11f7e58230
00ff7 4533c0                         xor        r8d, r8d
00ffa e949f3ffff                     jmp        0x7f11f7e582c8
00fff 4d2bc1                         sub        r8, r9
01002 4d85c0                         test       r8, r8
01005 0f8d0d020000                   jge        0x7f11f7e59198
0100b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01010 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
01014 4d85d2                         test       r10, r10
01017 0f85fb010000                   jne        0x7f11f7e59198
0101d bd08000000                     mov        ebp, 8
01022 be17000000                     mov        esi, 0x17
01027 90                             nop        
01028 c5f877                         vzeroupper 
0102b e8b0a6b6ff                     call       0x7f11f79c3660
01030 0f1f840028110009               nop        dword ptr [rax + rax + 0x9001128]
01038 4903c9                         add        rcx, r9
0103b 493bce                         cmp        rcx, r14
0103e 7e08                           jle        0x7f11f7e58fc8
01040 4533ed                         xor        r13d, r13d
01043 e95cf0ffff                     jmp        0x7f11f7e58024
01048 4533ed                         xor        r13d, r13d
0104b bd01000000                     mov        ebp, 1
01050 e951f0ffff                     jmp        0x7f11f7e58026
01055 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0105a 442b5c2414                     sub        r11d, dword ptr [rsp + 0x14]
0105f 85c9                           test       ecx, ecx
01061 0f8481040000                   je         0x7f11f7e59468
01067 4c8bc1                         mov        r8, rcx
0106a 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
0106f 4585d2                         test       r10d, r10d
01072 0f8c81040000                   jl         0x7f11f7e59479
01078 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
0107d 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
01082 8b742458                       mov        esi, dword ptr [rsp + 0x58]
01086 e9c9f0ffff                     jmp        0x7f11f7e580d4
0108b 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01093 448b5904                       mov        r11d, dword ptr [rcx + 4]
01097 4585db                         test       r11d, r11d
0109a 0f866a040000                   jbe        0x7f11f7e5948a
010a0 8b6908                         mov        ebp, dword ptr [rcx + 8]
010a3 e906f5ffff                     jmp        0x7f11f7e5852e
010a8 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
010b0 448b4904                       mov        r9d, dword ptr [rcx + 4]
010b4 4183f902                       cmp        r9d, 2
010b8 0f8696040000                   jbe        0x7f11f7e594d4
010be 8b6908                         mov        ebp, dword ptr [rcx + 8]
010c1 ffcd                           dec        ebp
010c3 85ed                           test       ebp, ebp
010c5 7e29                           jle        0x7f11f7e59070
010c7 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
010cf 418b4b0c                       mov        ecx, dword ptr [r11 + 0xc]
010d3 41894b10                       mov        dword ptr [r11 + 0x10], ecx
010d7 458b4b08                       mov        r9d, dword ptr [r11 + 8]
010db 45894b0c                       mov        dword ptr [r11 + 0xc], r9d
010df 41896b08                       mov        dword ptr [r11 + 8], ebp
010e3 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
010eb e9bef4ffff                     jmp        0x7f11f7e5852e
010f0 48bee001a5e200000000           movabs     rsi, 0xe2a501e0
010fa 488bea                         mov        rbp, rdx
010fd 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01105 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
0110d 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01112 44898c24c8000000               mov        dword ptr [rsp + 0xc8], r9d
0111a 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
01122 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01127 90                             nop        
01128 c5f877                         vzeroupper 
0112b e8b027aaff                     call       0x7f11f78fb860
01130 0f1f84002812000a               nop        dword ptr [rax + rax + 0xa001228]
01138 4885c0                         test       rax, rax
0113b 0f8560f2ffff                   jne        0x7f11f7e58321
01141 bef6ffffff                     mov        esi, 0xfffffff6
01146 6690                           nop        
01148 c5f877                         vzeroupper 
0114b e890a5b6ff                     call       0x7f11f79c3660
01150 0f1f84004812000b               nop        dword ptr [rax + rax + 0xb001248]
01158 4c63db                         movsxd     r11, ebx
0115b 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
01163 7c22                           jl         0x7f11f7e59107
01165 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
0116d 7e0b                           jle        0x7f11f7e590fa
0116f 33c9                           xor        ecx, ecx
01171 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01175 e996f4ffff                     jmp        0x7f11f7e58590
0117a 4533db                         xor        r11d, r11d
0117d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01182 e97bf4ffff                     jmp        0x7f11f7e58582
01187 4533db                         xor        r11d, r11d
0118a 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0118f e97cf4ffff                     jmp        0x7f11f7e58590
01194 660f1f440000                   nop        word ptr [rax + rax]
0119a 660f1f440000                   nop        word ptr [rax + rax]
011a0 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
011a5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
011a9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
011ad 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
011b2 8bd5                           mov        edx, ebp
011b4 c5f877                         vzeroupper 
011b7 e82427aaff                     call       0x7f11f78fb860
011bc 0f1f8400b412000c               nop        dword ptr [rax + rax + 0xc0012b4]
011c4 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
011c9 8b542410                       mov        edx, dword ptr [rsp + 0x10]
011cd 488bc8                         mov        rcx, rax
011d0 c5f877                         vzeroupper 
011d3 e80827aaff                     call       0x7f11f78fb860
011d8 0f1f8400d012000d               nop        dword ptr [rax + rax + 0xd0012d0]
011e0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
011e5 4183c308                       add        r11d, 8
011e9 443b5c243c                     cmp        r11d, dword ptr [rsp + 0x3c]
011ee 7cb0                           jl         0x7f11f7e59120
011f0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
011f5 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
011f9 418bc3                         mov        eax, r11d
011fc e9aff0ffff                     jmp        0x7f11f7e58230
01201 be17000000                     mov        esi, 0x17
01206 6690                           nop        
01208 c5f877                         vzeroupper 
0120b e8d0a4b6ff                     call       0x7f11f79c3660
01210 0f1f84000813000e               nop        dword ptr [rax + rax + 0xe001308]
01218 bd02000000                     mov        ebp, 2
0121d e900feffff                     jmp        0x7f11f7e58fa2
01222 be17000000                     mov        esi, 0x17
01227 90                             nop        
01228 c5f877                         vzeroupper 
0122b e8b0a4b6ff                     call       0x7f11f79c3660
01230 0f1f84002813000f               nop        dword ptr [rax + rax + 0xf001328]
01238 bee4ffffff                     mov        esi, 0xffffffe4
0123d 488bea                         mov        rbp, rdx
01240 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01248 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01250 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01255 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
0125d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01262 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01266 6690                           nop        
01268 c5f877                         vzeroupper 
0126b e870a4b6ff                     call       0x7f11f79c3660
01270 0f1f840068130010               nop        dword ptr [rax + rax + 0x10001368]
01278 bee4ffffff                     mov        esi, 0xffffffe4
0127d 488bea                         mov        rbp, rdx
01280 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01285 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
0128a 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0128f 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01294 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01299 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0129e 6690                           nop        
012a0 c5f877                         vzeroupper 
012a3 e838a4b6ff                     call       0x7f11f79c3660
012a8 0f1f8400a0130011               nop        dword ptr [rax + rax + 0x110013a0]
012b0 8be8                           mov        ebp, eax
012b2 eb0a                           jmp        0x7f11f7e5923e
012b4 8be8                           mov        ebp, eax
012b6 eb06                           jmp        0x7f11f7e5923e
012b8 8be8                           mov        ebp, eax
012ba eb02                           jmp        0x7f11f7e5923e
012bc 8be8                           mov        ebp, eax
012be beccffffff                     mov        esi, 0xffffffcc
012c3 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
012cb 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
012d3 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
012d8 4c89442418                     mov        qword ptr [rsp + 0x18], r8
012dd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
012e2 6690                           nop        
012e4 c5f877                         vzeroupper 
012e7 e8f4a3b6ff                     call       0x7f11f79c3660
012ec 0f1f8400e4130012               nop        dword ptr [rax + rax + 0x120013e4]
012f4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
012f9 8be8                           mov        ebp, eax
012fb 4533c0                         xor        r8d, r8d
012fe bef6ffffff                     mov        esi, 0xfffffff6
01303 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0130b 4c898c24c8000000               mov        qword ptr [rsp + 0xc8], r9
01313 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0131b 90                             nop        
0131c c5f877                         vzeroupper 
0131f e8bca3b6ff                     call       0x7f11f79c3660
01324 0f1f84001c140013               nop        dword ptr [rax + rax + 0x1300141c]
0132c be6effffff                     mov        esi, 0xffffff6e
01331 48899424c0000000               mov        qword ptr [rsp + 0xc0], rdx
01339 897c240c                       mov        dword ptr [rsp + 0xc], edi
0133d 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
01342 4c894c2420                     mov        qword ptr [rsp + 0x20], r9
01347 4c896c2448                     mov        qword ptr [rsp + 0x48], r13
0134c 4c89742450                     mov        qword ptr [rsp + 0x50], r14
01351 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01356 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0135a 894c2458                       mov        dword ptr [rsp + 0x58], ecx
0135e 6690                           nop        
01360 c5f877                         vzeroupper 
01363 e878a3b6ff                     call       0x7f11f79c3660
01368 0f1f840060140014               nop        dword ptr [rax + rax + 0x14001460]
01370 bee4ffffff                     mov        esi, 0xffffffe4
01375 488bea                         mov        rbp, rdx
01378 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0137d 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01382 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01387 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
0138c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01391 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01396 6690                           nop        
01398 c5f877                         vzeroupper 
0139b e840a3b6ff                     call       0x7f11f79c3660
013a0 0f1f840098140015               nop        dword ptr [rax + rax + 0x15001498]
013a8 bef6ffffff                     mov        esi, 0xfffffff6
013ad 666690                         nop        
013b0 c5f877                         vzeroupper 
013b3 e828a3b6ff                     call       0x7f11f79c3660
013b8 0f1f8400b0140016               nop        dword ptr [rax + rax + 0x160014b0]
013c0 bee4ffffff                     mov        esi, 0xffffffe4
013c5 4489542414                     mov        dword ptr [rsp + 0x14], r10d
013ca 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
013cf 4489542418                     mov        dword ptr [rsp + 0x18], r10d
013d4 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
013d9 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
013de 6690                           nop        
013e0 c5f877                         vzeroupper 
013e3 e8f8a2b6ff                     call       0x7f11f79c3660
013e8 0f1f8400e0140017               nop        dword ptr [rax + rax + 0x170014e0]
013f0 be6effffff                     mov        esi, 0xffffff6e
013f5 4489542414                     mov        dword ptr [rsp + 0x14], r10d
013fa 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
013ff 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01404 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01409 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0140e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01413 90                             nop        
01414 c5f877                         vzeroupper 
01417 e8c4a2b6ff                     call       0x7f11f79c3660
0141c 0f1f840014150018               nop        dword ptr [rax + rax + 0x18001514]
01424 bee4ffffff                     mov        esi, 0xffffffe4
01429 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0142e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01433 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01438 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0143d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01442 6690                           nop        
01444 c5f877                         vzeroupper 
01447 e894a2b6ff                     call       0x7f11f79c3660
0144c 0f1f840044150019               nop        dword ptr [rax + rax + 0x19001544]
01454 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0145a bee4ffffff                     mov        esi, 0xffffffe4
0145f 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01467 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0146f 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01477 90                             nop        
01478 c5f877                         vzeroupper 
0147b e860a2b6ff                     call       0x7f11f79c3660
01480 0f1f84007815001a               nop        dword ptr [rax + rax + 0x1a001578]
01488 beccffffff                     mov        esi, 0xffffffcc
0148d 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01492 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01497 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0149c 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
014a1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
014a6 6690                           nop        
014a8 c5f877                         vzeroupper 
014ab e830a2b6ff                     call       0x7f11f79c3660
014b0 0f1f8400a815001b               nop        dword ptr [rax + rax + 0x1b0015a8]
014b8 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
014be beccffffff                     mov        esi, 0xffffffcc
014c3 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
014c8 4489542414                     mov        dword ptr [rsp + 0x14], r10d
014cd 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
014d2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
014d7 90                             nop        
014d8 c5f877                         vzeroupper 
014db e800a2b6ff                     call       0x7f11f79c3660
014e0 0f1f8400d815001c               nop        dword ptr [rax + rax + 0x1c0015d8]
014e8 8be8                           mov        ebp, eax
014ea 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
014ef 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
014f4 e905feffff                     jmp        0x7f11f7e5927e
014f9 8be8                           mov        ebp, eax
014fb 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
01500 4c8b4c2470                     mov        r9, qword ptr [rsp + 0x70]
01505 e9b4fdffff                     jmp        0x7f11f7e5923e
0150a bee4ffffff                     mov        esi, 0xffffffe4
0150f 488bea                         mov        rbp, rdx
01512 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01517 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
0151f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01524 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01529 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0152e 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01533 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01538 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
0153d 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01542 6690                           nop        
01544 c5f877                         vzeroupper 
01547 e894a1b6ff                     call       0x7f11f79c3660
0154c 0f1f84004416001d               nop        dword ptr [rax + rax + 0x1d001644]
01554 bee4ffffff                     mov        esi, 0xffffffe4
01559 488bea                         mov        rbp, rdx
0155c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01561 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
01569 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0156e 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01573 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01578 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0157d 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01582 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
01587 48894c2420                     mov        qword ptr [rsp + 0x20], rcx
0158c 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01591 666690                         nop        
01594 c5f877                         vzeroupper 
01597 e844a1b6ff                     call       0x7f11f79c3660
0159c 0f1f84009416001e               nop        dword ptr [rax + rax + 0x1e001694]
015a4 bee4ffffff                     mov        esi, 0xffffffe4
015a9 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
015ae 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
015b3 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
015b8 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
015bd 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015c2 4489542424                     mov        dword ptr [rsp + 0x24], r10d
015c7 90                             nop        
015c8 c5f877                         vzeroupper 
015cb e810a1b6ff                     call       0x7f11f79c3660
015d0 0f1f8400c816001f               nop        dword ptr [rax + rax + 0x1f0016c8]
015d8 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
015de bee4ffffff                     mov        esi, 0xffffffe4
015e3 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
015eb 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
015f3 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
015fb 90                             nop        
015fc c5f877                         vzeroupper 
015ff e8dca0b6ff                     call       0x7f11f79c3660
01604 0f1f8400fc160020               nop        dword ptr [rax + rax + 0x200016fc]
0160c bee4ffffff                     mov        esi, 0xffffffe4
01611 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01619 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01621 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01629 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0162e 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
01636 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0163b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01640 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01645 666690                         nop        
01648 c5f877                         vzeroupper 
0164b e890a0b6ff                     call       0x7f11f79c3660
01650 0f1f840048170021               nop        dword ptr [rax + rax + 0x21001748]
01658 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0165e bee4ffffff                     mov        esi, 0xffffffe4
01663 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0166b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01673 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0167b 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01680 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
01688 c5f877                         vzeroupper 
0168b e850a0b6ff                     call       0x7f11f79c3660
01690 0f1f840088170022               nop        dword ptr [rax + rax + 0x22001788]
01698 beccffffff                     mov        esi, 0xffffffcc
0169d 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
016a2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
016a7 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
016ac 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
016b1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016b6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016bb 90                             nop        
016bc c5f877                         vzeroupper 
016bf e81ca0b6ff                     call       0x7f11f79c3660
016c4 0f1f8400bc170023               nop        dword ptr [rax + rax + 0x230017bc]
016cc beccffffff                     mov        esi, 0xffffffcc
016d1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
016d9 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
016e1 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
016e9 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
016ee 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
016f3 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
016f8 4489442418                     mov        dword ptr [rsp + 0x18], r8d
016fd 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01702 6690                           nop        
01704 c5f877                         vzeroupper 
01707 e8d49fb6ff                     call       0x7f11f79c3660
0170c 0f1f840004180024               nop        dword ptr [rax + rax + 0x24001804]
01714 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0171a beccffffff                     mov        esi, 0xffffffcc
0171f 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01724 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01729 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
0172e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01733 90                             nop        
01734 c5f877                         vzeroupper 
01737 e8a49fb6ff                     call       0x7f11f79c3660
0173c 0f1f840034180025               nop        dword ptr [rax + rax + 0x25001834]
01744 beccffffff                     mov        esi, 0xffffffcc
01749 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01751 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01759 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01761 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01766 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0176e 6690                           nop        
01770 c5f877                         vzeroupper 
01773 e8689fb6ff                     call       0x7f11f79c3660
01778 0f1f840070180026               nop        dword ptr [rax + rax + 0x26001870]
01780 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
01784 83c510                         add        ebp, 0x10
01787 be6effffff                     mov        esi, 0xffffff6e
0178c c5f877                         vzeroupper 
0178f e84c9fb6ff                     call       0x7f11f79c3660
01794 0f1f84008c180027               nop        dword ptr [rax + rax + 0x2700188c]
0179c 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
017a0 83c510                         add        ebp, 0x10
017a3 be66ffffff                     mov        esi, 0xffffff66
017a8 c5f877                         vzeroupper 
017ab e8309fb6ff                     call       0x7f11f79c3660
017b0 0f1f8400a8180028               nop        dword ptr [rax + rax + 0x280018a8]
017b8 bee4ffffff                     mov        esi, 0xffffffe4
017bd 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
017c2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
017c7 90                             nop        
017c8 c5f877                         vzeroupper 
017cb e8109fb6ff                     call       0x7f11f79c3660
017d0 0f1f8400c8180029               nop        dword ptr [rax + rax + 0x290018c8]
017d8 c5fa7f442420                   vmovdqu    xmmword ptr [rsp + 0x20], xmm0
017de bee4ffffff                     mov        esi, 0xffffffe4
017e3 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
017e8 4489442410                     mov        dword ptr [rsp + 0x10], r8d
017ed 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
017f2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
017f7 4489542418                     mov        dword ptr [rsp + 0x18], r10d
017fc c5f877                         vzeroupper 
017ff e8dc9eb6ff                     call       0x7f11f79c3660
01804 0f1f8400fc18002a               nop        dword ptr [rax + rax + 0x2a0018fc]
0180c 4183c210                       add        r10d, 0x10
01810 be6effffff                     mov        esi, 0xffffff6e
01815 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0181d 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01825 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
0182d 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01832 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0183a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0183f 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01844 c5f877                         vzeroupper 
01847 e8949eb6ff                     call       0x7f11f79c3660
0184c 0f1f84004419002b               nop        dword ptr [rax + rax + 0x2b001944]
01854 4183c210                       add        r10d, 0x10
01858 be66ffffff                     mov        esi, 0xffffff66
0185d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01865 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0186d 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01875 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0187a 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
01882 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01887 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0188c c5f877                         vzeroupper 
0188f e84c9eb6ff                     call       0x7f11f79c3660
01894 0f1f84008c19002c               nop        dword ptr [rax + rax + 0x2c00198c]
0189c beccffffff                     mov        esi, 0xffffffcc
018a1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
018a9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
018b1 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
018b9 666690                         nop        
018bc c5f877                         vzeroupper 
018bf e81c9eb6ff                     call       0x7f11f79c3660
018c4 0f1f8400bc19002d               nop        dword ptr [rax + rax + 0x2d0019bc]
018cc beccffffff                     mov        esi, 0xffffffcc
018d1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
018d9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
018e1 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
018e9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
018ee 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
018f6 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
018fb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01900 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01905 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0190a 6690                           nop        
0190c c5f877                         vzeroupper 
0190f e8cc9db6ff                     call       0x7f11f79c3660
01914 0f1f84000c1a002e               nop        dword ptr [rax + rax + 0x2e001a0c]
0191c 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01920 83c508                         add        ebp, 8
01923 be66ffffff                     mov        esi, 0xffffff66
01928 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0192d 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01932 6690                           nop        
01934 c5f877                         vzeroupper 
01937 e8a49db6ff                     call       0x7f11f79c3660
0193c 0f1f8400341a002f               nop        dword ptr [rax + rax + 0x2f001a34]
01944 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01948 83c508                         add        ebp, 8
0194b be66ffffff                     mov        esi, 0xffffff66
01950 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01955 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0195a 6690                           nop        
0195c c5f877                         vzeroupper 
0195f e87c9db6ff                     call       0x7f11f79c3660
01964 0f1f84005c1a0030               nop        dword ptr [rax + rax + 0x30001a5c]
0196c bef6ffffff                     mov        esi, 0xfffffff6
01971 666690                         nop        
01974 c5f877                         vzeroupper 
01977 e8649db6ff                     call       0x7f11f79c3660
0197c 0f1f8400741a0031               nop        dword ptr [rax + rax + 0x31001a74]
01984 bef6ffffff                     mov        esi, 0xfffffff6
01989 418be8                         mov        ebp, r8d
0198c c5f877                         vzeroupper 
0198f e84c9db6ff                     call       0x7f11f79c3660
01994 0f1f84008c1a0032               nop        dword ptr [rax + rax + 0x32001a8c]
0199c bef6ffffff                     mov        esi, 0xfffffff6
019a1 666690                         nop        
019a4 c5f877                         vzeroupper 
019a7 e8349db6ff                     call       0x7f11f79c3660
019ac 0f1f8400a41a0033               nop        dword ptr [rax + rax + 0x33001aa4]
019b4 bef6ffffff                     mov        esi, 0xfffffff6
019b9 418beb                         mov        ebp, r11d
019bc c5f877                         vzeroupper 
019bf e81c9db6ff                     call       0x7f11f79c3660
019c4 0f1f8400bc1a0034               nop        dword ptr [rax + rax + 0x34001abc]
019cc eb14                           jmp        0x7f11f7e59962
019ce eb12                           jmp        0x7f11f7e59962
019d0 eb10                           jmp        0x7f11f7e59962
019d2 eb0e                           jmp        0x7f11f7e59962
019d4 eb0c                           jmp        0x7f11f7e59962
019d6 eb0a                           jmp        0x7f11f7e59962
019d8 eb08                           jmp        0x7f11f7e59962
019da eb06                           jmp        0x7f11f7e59962
019dc eb04                           jmp        0x7f11f7e59962
019de eb02                           jmp        0x7f11f7e59962
019e0 eb00                           jmp        0x7f11f7e59962
019e2 488bf0                         mov        rsi, rax
019e5 e9bae9ffff                     jmp        0x7f11f7e58324
019ea bef6ffffff                     mov        esi, 0xfffffff6
019ef 90                             nop        
019f0 c5f877                         vzeroupper 
019f3 e8e89cb6ff                     call       0x7f11f79c3660
019f8 0f1f8400f01a0035               nop        dword ptr [rax + rax + 0x35001af0]
01a00 bef6ffffff                     mov        esi, 0xfffffff6
01a05 666690                         nop        
01a08 c5f877                         vzeroupper 
01a0b e8d09cb6ff                     call       0x7f11f79c3660
01a10 0f1f8400081b0036               nop        dword ptr [rax + rax + 0x36001b08]
01a18 bef6ffffff                     mov        esi, 0xfffffff6
01a1d 666690                         nop        
01a20 c5f877                         vzeroupper 
01a23 e8b89cb6ff                     call       0x7f11f79c3660
01a28 0f1f8400201b0037               nop        dword ptr [rax + rax + 0x37001b20]
01a30 bef6ffffff                     mov        esi, 0xfffffff6
01a35 418bea                         mov        ebp, r10d
01a38 c5f877                         vzeroupper 
01a3b e8a09cb6ff                     call       0x7f11f79c3660
01a40 0f1f8400381b0038               nop        dword ptr [rax + rax + 0x38001b38]
01a48 bef6ffffff                     mov        esi, 0xfffffff6
01a4d 666690                         nop        
01a50 c5f877                         vzeroupper 
01a53 e8889cb6ff                     call       0x7f11f79c3660
01a58 0f1f8400501b0039               nop        dword ptr [rax + rax + 0x39001b50]
01a60 49ba4781e5f7117f0000           movabs     r10, 0x7f11f7e58147
01a6a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01a71 e9ea44aaff                     jmp        0x7f11f78fdee0
01a76 e8a510a9ff                     call       0x7f11f78eaaa0
01a7b e9bee5ffff                     jmp        0x7f11f7e57fbe
