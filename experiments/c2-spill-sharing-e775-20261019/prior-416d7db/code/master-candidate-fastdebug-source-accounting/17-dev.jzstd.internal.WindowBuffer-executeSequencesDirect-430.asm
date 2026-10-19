00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c034b4ff                   jne        0x7efc7b72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85dc2e0000                   jne        0x7efc7bbee79a
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 4c8bee                         mov        r13, rsi
0004e 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00051 8b6e04                         mov        ebp, dword ptr [rsi + 4]
00054 448bd5                         mov        r10d, ebp
00057 442bd0                         sub        r10d, eax
0005a 448b9c24e0000000               mov        r11d, dword ptr [rsp + 0xe0]
00062 453bda                         cmp        r11d, r10d
00065 0f8f0d250000                   jg         0x7efc7bbeddf8
0006b 4c8b4608                       mov        r8, qword ptr [rsi + 8]
0006f 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00073 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
0007b 4c63d8                         movsxd     r11, eax
0007e 4d03d8                         add        r11, r8
00081 4d2bcb                         sub        r9, r11
00084 4d3bd1                         cmp        r10, r9
00087 0f8feb240000                   jg         0x7efc7bbeddf8
0008d 488b4e10                       mov        rcx, qword ptr [rsi + 0x10]
00091 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00095 4d85c9                         test       r9, r9
00098 0f8498100000                   je         0x7efc7bbec9b6
0009e 33db                           xor        ebx, ebx
000a0 4c8bda                         mov        r11, rdx
000a3 8b7204                         mov        esi, dword ptr [rdx + 4]
000a6 458b7540                       mov        r14d, dword ptr [r13 + 0x40]
000aa 85ff                           test       edi, edi
000ac 0f8e6a1e0000                   jle        0x7efc7bbed79c
000b2 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
000b9 897c2438                       mov        dword ptr [rsp + 0x38], edi
000bd 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000c2 4c896c2478                     mov        qword ptr [rsp + 0x78], r13
000c7 4d2bc8                         sub        r9, r8
000ca 448d5ee0                       lea        r11d, [rsi - 0x20]
000ce 83c5e0                         add        ebp, -0x20
000d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000d6 458b5204                       mov        r10d, dword ptr [r10 + 4]
000da 4585d2                         test       r10d, r10d
000dd 0f86c1240000                   jbe        0x7efc7bbede24
000e3 4d63d2                         movsxd     r10, r10d
000e6 4863ff                         movsxd     rdi, edi
000e9 48ffcf                         dec        rdi
000ec 493bfa                         cmp        rdi, r10
000ef 0f83af240000                   jae        0x7efc7bbede24
000f5 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
000fd 458b6a04                       mov        r13d, dword ptr [r10 + 4]
00101 4585ed                         test       r13d, r13d
00104 0f86e6240000                   jbe        0x7efc7bbede70
0010a 4183fd01                       cmp        r13d, 1
0010e 0f86dc240000                   jbe        0x7efc7bbede70
00114 4183fd02                       cmp        r13d, 2
00118 0f86d2240000                   jbe        0x7efc7bbede70
0011e 448d56f1                       lea        r10d, [rsi - 0xf]
00122 4585d2                         test       r10d, r10d
00125 0f8cc5240000                   jl         0x7efc7bbede70
0012b 418b7e04                       mov        edi, dword ptr [r14 + 4]
0012f 448d57f1                       lea        r10d, [rdi - 0xf]
00133 4585d2                         test       r10d, r10d
00136 0f8cb4240000                   jl         0x7efc7bbede70
0013c 448d57fd                       lea        r10d, [rdi - 3]
00140 4585d2                         test       r10d, r10d
00143 0f8ca7240000                   jl         0x7efc7bbede70
00149 448d57f9                       lea        r10d, [rdi - 7]
0014d 4585d2                         test       r10d, r10d
00150 0f8c9a240000                   jl         0x7efc7bbede70
00156 897c2410                       mov        dword ptr [rsp + 0x10], edi
0015a 44896c2404                     mov        dword ptr [rsp + 4], r13d
0015f 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
00166 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0016e 89b424e4000000                 mov        dword ptr [rsp + 0xe4], esi
00175 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00179 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0017e 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
00183 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00188 498bde                         mov        rbx, r14
0018b 48895c2418                     mov        qword ptr [rsp + 0x18], rbx
00190 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
00198 8bdf                           mov        ebx, edi
0019a 448bee                         mov        r13d, esi
0019d 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
001a2 448d53fd                       lea        r10d, [rbx - 3]
001a6 4489542458                     mov        dword ptr [rsp + 0x58], r10d
001ab 4183c5f1                       add        r13d, -0xf
001af 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
001b4 4c63f3                         movsxd     r14, ebx
001b7 448d6bf9                       lea        r13d, [rbx - 7]
001bb 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
001c0 83c3f1                         add        ebx, -0xf
001c3 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
001ca 498d5ef1                       lea        rbx, [r14 - 0xf]
001ce 48899c2498000000               mov        qword ptr [rsp + 0x98], rbx
001d6 4983c6f9                       add        r14, -7
001da 4c89b424a0000000               mov        qword ptr [rsp + 0xa0], r14
001e2 4533d2                         xor        r10d, r10d
001e5 33db                           xor        ebx, ebx
001e7 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
001ee e9aa040000                     jmp        0x7efc7bbebf1d
001f3 448bd5                         mov        r10d, ebp
001f6 4d63d2                         movsxd     r10, r10d
001f9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00200 c442a8f5db                     bzhi       r11, r11, r10
00205 c4c1fb92fb                     kmovq      k7, r11
0020a 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00210 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00216 4403ed                         add        r13d, ebp
00219 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0021d 418502                         test       dword ptr [r10], eax
00220 443b6c2448                     cmp        r13d, dword ptr [rsp + 0x48]
00225 0f8d49040000                   jge        0x7efc7bbebef4
0022b 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
00230 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00235 452bd5                         sub        r10d, r13d
00238 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0023d 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
00241 412bed                         sub        ebp, r13d
00244 413bed                         cmp        ebp, r13d
00247 410f4fed                       cmovg      ebp, r13d
0024b 458bda                         mov        r11d, r10d
0024e 4585d2                         test       r10d, r10d
00251 0f8ce11f0000                   jl         0x7efc7bbedab8
00257 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0025c 4585d2                         test       r10d, r10d
0025f 0f8cd31f0000                   jl         0x7efc7bbedab8
00265 458d142b                       lea        r10d, [r11 + rbp]
00269 448b742410                     mov        r14d, dword ptr [rsp + 0x10]
0026e 453bf2                         cmp        r14d, r10d
00271 0f82c11f0000                   jb         0x7efc7bbedab8
00277 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
0027c 4403f5                         add        r14d, ebp
0027f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00284 453bd6                         cmp        r10d, r14d
00287 0f82ab1f0000                   jb         0x7efc7bbedab8
0028d 85ed                           test       ebp, ebp
0028f 0f8ca31f0000                   jl         0x7efc7bbedab8
00295 85ed                           test       ebp, ebp
00297 0f8479ffffff                   je         0x7efc7bbeba96
0029d 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
002a2 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
002aa 4b8d741108                     lea        rsi, [r9 + r10 + 8]
002af 4b8d7c1908                     lea        rdi, [r9 + r11 + 8]
002b4 4863d5                         movsxd     rdx, ebp
002b7 4883fa20                       cmp        rdx, 0x20
002bb 0f8632ffffff                   jbe        0x7efc7bbeba73
002c1 c5f877                         vzeroupper 
002c4 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
002ce 41ffd2                         call       r10
002d1 0f1f840000000000               nop        dword ptr [rax + rax]
002d9 e938ffffff                     jmp        0x7efc7bbeba96
002de 48894424f8                     mov        qword ptr [rsp - 8], rax
002e3 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002e7 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
002ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
002f3 4585ed                         test       r13d, r13d
002f6 0f8e78130000                   jle        0x7efc7bbecef4
002fc 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00300 034c244c                       add        ecx, dword ptr [rsp + 0x4c]
00304 3b8c248c000000                 cmp        ecx, dword ptr [rsp + 0x8c]
0030b 0f8faf140000                   jg         0x7efc7bbed040
00311 458d041a                       lea        r8d, [r10 + rbx]
00315 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
0031d 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
00325 0f8f2d150000                   jg         0x7efc7bbed0d8
0032b 83fb10                         cmp        ebx, 0x10
0032e 0f8f1f070000                   jg         0x7efc7bbec2d3
00334 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
00339 0f830c110000                   jae        0x7efc7bbecccb
0033f 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00344 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0034b 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00352 0f8388110000                   jae        0x7efc7bbecd60
00358 468d3413                       lea        r14d, [rbx + r10]
0035c 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00364 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
0036c c4c17a7f440608                 vmovdqu    xmmword ptr [r14 + rax + 8], xmm0
00373 03d8                           add        ebx, eax
00375 448bf3                         mov        r14d, ebx
00378 452bf5                         sub        r14d, r13d
0037b 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00380 4183f910                       cmp        r9d, 0x10
00384 7f47                           jg         0x7efc7bbebc4d
00386 4183fd10                       cmp        r13d, 0x10
0038a 7c41                           jl         0x7efc7bbebc4d
0038c 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
00394 0f83de110000                   jae        0x7efc7bbecdf8
0039a 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
003a2 c4817a6f443508                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 8]
003a9 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
003b0 0f833e120000                   jae        0x7efc7bbece74
003b6 c4c17a7f441d08                 vmovdqu    xmmword ptr [r13 + rbx + 8], xmm0
003bd 4403cb                         add        r9d, ebx
003c0 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
003c8 e9a7020000                     jmp        0x7efc7bbebef4
003cd 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
003d5 4b8d7c3308                     lea        rdi, [r11 + r14 + 8]
003da 498d741b08                     lea        rsi, [r11 + rbx + 8]
003df 458d1419                       lea        r10d, [r9 + rbx]
003e3 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
003eb 4d63da                         movsxd     r11, r10d
003ee 453be9                         cmp        r13d, r9d
003f1 0f8c57040000                   jl         0x7efc7bbec0ce
003f7 4183f930                       cmp        r9d, 0x30
003fb 0f8e8e000000                   jle        0x7efc7bbebd0f
00401 4585f6                         test       r14d, r14d
00404 0f8c92180000                   jl         0x7efc7bbed51c
0040a 85db                           test       ebx, ebx
0040c 0f8c8a180000                   jl         0x7efc7bbed51c
00412 478d1431                       lea        r10d, [r9 + r14]
00416 448b6c2410                     mov        r13d, dword ptr [rsp + 0x10]
0041b 453bea                         cmp        r13d, r10d
0041e 0f8278180000                   jb         0x7efc7bbed51c
00424 443bac24a8000000               cmp        r13d, dword ptr [rsp + 0xa8]
0042c 0f826a180000                   jb         0x7efc7bbed51c
00432 4585c9                         test       r9d, r9d
00435 0f8459180000                   je         0x7efc7bbed514
0043b 4963d1                         movsxd     rdx, r9d
0043e 4883fa20                       cmp        rdx, 0x20
00442 772b                           ja         0x7efc7bbebcef
00444 458bd1                         mov        r10d, r9d
00447 4d63d2                         movsxd     r10, r10d
0044a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00451 c442a8f5db                     bzhi       r11, r11, r10
00456 c4c1fb92fb                     kmovq      k7, r11
0045b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00461 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00467 418be9                         mov        ebp, r9d
0046a e9fc010000                     jmp        0x7efc7bbebeeb
0046f 418be9                         mov        ebp, r9d
00472 c5f877                         vzeroupper 
00475 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
0047f 41ffd2                         call       r10
00482 0f1f840000000000               nop        dword ptr [rax + rax]
0048a e9dc010000                     jmp        0x7efc7bbebeeb
0048f 443b74246c                     cmp        r14d, dword ptr [rsp + 0x6c]
00494 0f8352150000                   jae        0x7efc7bbed26c
0049a 4963d6                         movsxd     rdx, r14d
0049d 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
004a5 498b4c1508                     mov        rcx, qword ptr [r13 + rdx + 8]
004aa 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
004ae 0f83b8150000                   jae        0x7efc7bbed2ec
004b4 448bc3                         mov        r8d, ebx
004b7 418d7808                       lea        edi, [r8 + 8]
004bb 4d63d0                         movsxd     r10, r8d
004be 4b894c1508                     mov        qword ptr [r13 + r10 + 8], rcx
004c3 3bbc24a8000000                 cmp        edi, dword ptr [rsp + 0xa8]
004ca 7c08                           jl         0x7efc7bbebd54
004cc 418be9                         mov        ebp, r9d
004cf e997010000                     jmp        0x7efc7bbebeeb
004d4 492bd2                         sub        rdx, r10
004d7 4863cf                         movsxd     rcx, edi
004da 4c8d1411                       lea        r10, [rcx + rdx]
004de 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
004e6 0f8308160000                   jae        0x7efc7bbed374
004ec 4d8bd3                         mov        r10, r11
004ef 4c2bd1                         sub        r10, rcx
004f2 4983c207                       add        r10, 7
004f6 4983e2f8                       and        r10, 0xfffffffffffffff8
004fa 418bca                         mov        ecx, r10d
004fd 468d540108                     lea        r10d, [rcx + r8 + 8]
00502 4d63d2                         movsxd     r10, r10d
00505 498d4c12f8                     lea        rcx, [r10 + rdx - 8]
0050a 483b8c24a0000000               cmp        rcx, qword ptr [rsp + 0xa0]
00512 0f83dc150000                   jae        0x7efc7bbed374
00518 3b7c246c                       cmp        edi, dword ptr [rsp + 0x6c]
0051c 0f83d2150000                   jae        0x7efc7bbed374
00522 4983c2f8                       add        r10, -8
00526 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
0052e 0f83c0150000                   jae        0x7efc7bbed374
00534 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
0053c 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00543 0f8f47160000                   jg         0x7efc7bbed410
00549 452bf0                         sub        r14d, r8d
0054c 4183c010                       add        r8d, 0x10
00550 418be9                         mov        ebp, r9d
00553 458d0c3e                       lea        r9d, [r14 + rdi]
00557 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
0055f 4f8b4c0d08                     mov        r9, qword ptr [r13 + r9 + 8]
00564 448bd7                         mov        r10d, edi
00567 4f894c1508                     mov        qword ptr [r13 + r10 + 8], r9
0056c 448d5708                       lea        r10d, [rdi + 8]
00570 453bd0                         cmp        r10d, r8d
00573 7d05                           jge        0x7efc7bbebdfa
00575 418bfa                         mov        edi, r10d
00578 ebd9                           jmp        0x7efc7bbebdd3
0057a 4983c3f8                       add        r11, -8
0057e 4981fb00000080                 cmp        r11, -0x80000000
00585 49c7c000000080                 mov        r8, 0xffffffff80000000
0058c 4d0f4cd8                       cmovl      r11, r8
00590 418bf3                         mov        esi, r11d
00593 443bd6                         cmp        r10d, esi
00596 0f8d7c000000                   jge        0x7efc7bbebe98
0059c 4d63da                         movsxd     r11, r10d
0059f 4c03da                         add        r11, rdx
005a2 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
005aa 0f836c160000                   jae        0x7efc7bbed49c
005b0 83c710                         add        edi, 0x10
005b3 4c63df                         movsxd     r11, edi
005b6 4c03da                         add        r11, rdx
005b9 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
005c1 0f8369160000                   jae        0x7efc7bbed4b0
005c7 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
005cc 0f8372160000                   jae        0x7efc7bbed4c4
005d2 3b7c246c                       cmp        edi, dword ptr [rsp + 0x6c]
005d6 0f837c160000                   jae        0x7efc7bbed4d8
005dc 90                             nop        
005dd 90                             nop        
005de 90                             nop        
005df 90                             nop        
005e0 478d1c16                       lea        r11d, [r14 + r10]
005e4 458bc2                         mov        r8d, r10d
005e7 4963c8                         movsxd     rcx, r8d
005ea 458bcb                         mov        r9d, r11d
005ed 4b8b7c0d08                     mov        rdi, qword ptr [r13 + r9 + 8]
005f2 4d63db                         movsxd     r11, r11d
005f5 458bca                         mov        r9d, r10d
005f8 4b897c0d08                     mov        qword ptr [r13 + r9 + 8], rdi
005fd 4f8b5c1d10                     mov        r11, qword ptr [r13 + r11 + 0x10]
00602 4d895c0d10                     mov        qword ptr [r13 + rcx + 0x10], r11
00607 4183c210                       add        r10d, 0x10
0060b 443bd6                         cmp        r10d, esi
0060e 7cd0                           jl         0x7efc7bbebe60
00610 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00618 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00620 7d49                           jge        0x7efc7bbebeeb
00622 4d63da                         movsxd     r11, r10d
00625 4c03da                         add        r11, rdx
00628 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00630 0f8336160000                   jae        0x7efc7bbed4ec
00636 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
0063b 0f833f160000                   jae        0x7efc7bbed500
00641 90                             nop        
00642 90                             nop        
00643 90                             nop        
00644 478d1c16                       lea        r11d, [r14 + r10]
00648 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00650 4f8b5c1d08                     mov        r11, qword ptr [r13 + r11 + 8]
00655 458bc2                         mov        r8d, r10d
00658 4f895c0508                     mov        qword ptr [r13 + r8 + 8], r11
0065d 4183c208                       add        r10d, 8
00661 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00669 7cd9                           jl         0x7efc7bbebec4
0066b 03dd                           add        ebx, ebp
0066d 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
00674 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0067b ffc3                           inc        ebx
0067d 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
00681 0f8dc0050000                   jge        0x7efc7bbec4c7
00687 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0068e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00696 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0069d 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
006a2 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
006a9 4d8b5cdb08                     mov        r11, qword ptr [r11 + rbx*8 + 8]
006ae 418bdb                         mov        ebx, r11d
006b1 81e3ffff0100                   and        ebx, 0x1ffff
006b7 4d8bc3                         mov        r8, r11
006ba 49c1e812                       shr        r8, 0x12
006be 49c1fb24                       sar        r11, 0x24
006c2 458bf0                         mov        r14d, r8d
006c5 458beb                         mov        r13d, r11d
006c8 4181e6ffff0300                 and        r14d, 0x3ffff
006cf 4489742448                     mov        dword ptr [rsp + 0x48], r14d
006d4 4585ed                         test       r13d, r13d
006d7 0f8cd30f0000                   jl         0x7efc7bbecf30
006dd 85db                           test       ebx, ebx
006df 0f8591000000                   jne        0x7efc7bbebff6
006e5 33db                           xor        ebx, ebx
006e7 4183fd03                       cmp        r13d, 3
006eb 0f8ecb000000                   jle        0x7efc7bbec03c
006f1 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
006f9 458b430c                       mov        r8d, dword ptr [r11 + 0xc]
006fd 45894310                       mov        dword ptr [r11 + 0x10], r8d
00701 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00705 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
0070d 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00711 4183c5fd                       add        r13d, -3
00715 45896808                       mov        dword ptr [r8 + 8], r13d
00719 4963ed                         movsxd     rbp, r13d
0071c 4c63d8                         movsxd     r11, eax
0071f 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
00724 4863d3                         movsxd     rdx, ebx
00727 4c03da                         add        r11, rdx
0072a 493beb                         cmp        rbp, r11
0072d 0f8f11100000                   jg         0x7efc7bbecfc4
00733 448d3418                       lea        r14d, [rax + rbx]
00737 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
0073c 452bf5                         sub        r14d, r13d
0073f 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00744 4585c9                         test       r9d, r9d
00747 0f8591fbffff                   jne        0x7efc7bbebb5e
0074d 4d63c6                         movsxd     r8, r14d
00750 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
00755 0f8c91110000                   jl         0x7efc7bbed16c
0075b 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
00760 0f8f06120000                   jg         0x7efc7bbed1ec
00766 4533c0                         xor        r8d, r8d
00769 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00771 e97dfbffff                     jmp        0x7efc7bbebb73
00776 448b1c24                       mov        r11d, dword ptr [rsp]
0077a 452bda                         sub        r11d, r10d
0077d 413bdb                         cmp        ebx, r11d
00780 0f8e61ffffff                   jle        0x7efc7bbebf67
00786 be45ffffff                     mov        esi, 0xffffff45
0078b 8beb                           mov        ebp, ebx
0078d 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
00795 90                             nop        
00796 90                             nop        
00797 90                             nop        
00798 c5f877                         vzeroupper 
0079b e8401aaeff                     call       0x7efc7b6cda60
007a0 0f1f840098080001               nop        dword ptr [rax + rax + 0x1000898]
007a8 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
007b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
007b6 e8a594cb17                     call       0x7efc938a54e0
007bb f4                             hlt        
007bc 85db                           test       ebx, ebx
007be 7403                           je         0x7efc7bbec043
007c0 41ffcd                         dec        r13d
007c3 4585ed                         test       r13d, r13d
007c6 750e                           jne        0x7efc7bbec056
007c8 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007d0 458b4b08                       mov        r9d, dword ptr [r11 + 8]
007d4 eb70                           jmp        0x7efc7bbec0c6
007d6 4183fd03                       cmp        r13d, 3
007da 0f84481b0000                   je         0x7efc7bbedba8
007e0 4183fd02                       cmp        r13d, 2
007e4 0f87d61b0000                   ja         0x7efc7bbedc40
007ea 443b6c2404                     cmp        r13d, dword ptr [rsp + 4]
007ef 0f8390160000                   jae        0x7efc7bbed705
007f5 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007fd 478b4cab08                     mov        r9d, dword ptr [r11 + r13*4 + 8]
00802 4585ed                         test       r13d, r13d
00805 7e33                           jle        0x7efc7bbec0ba
00807 458d5dff                       lea        r11d, [r13 - 1]
0080b 443b5c2404                     cmp        r11d, dword ptr [rsp + 4]
00810 0f83761a0000                   jae        0x7efc7bbedb0c
00816 90                             nop        
00817 90                             nop        
00818 90                             nop        
00819 90                             nop        
0081a 90                             nop        
0081b 90                             nop        
0081c 90                             nop        
0081d 90                             nop        
0081e 90                             nop        
0081f 90                             nop        
00820 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00828 478b44ab04                     mov        r8d, dword ptr [r11 + r13*4 + 4]
0082d 478944ab08                     mov        dword ptr [r11 + r13*4 + 8], r8d
00832 41ffcd                         dec        r13d
00835 4585ed                         test       r13d, r13d
00838 7fe6                           jg         0x7efc7bbec0a0
0083a 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00842 45894b08                       mov        dword ptr [r11 + 8], r9d
00846 458be9                         mov        r13d, r9d
00849 e9cbfeffff                     jmp        0x7efc7bbebf99
0084e 4183fd10                       cmp        r13d, 0x10
00852 0f8dfb080000                   jge        0x7efc7bbec9d3
00858 4183fd08                       cmp        r13d, 8
0085c 0f8da0040000                   jge        0x7efc7bbec582
00862 4183f910                       cmp        r9d, 0x10
00866 0f8f54010000                   jg         0x7efc7bbec240
0086c 443b742410                     cmp        r14d, dword ptr [rsp + 0x10]
00871 0f83c0160000                   jae        0x7efc7bbed7b7
00877 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0087f 430fbe6c3308                   movsx      ebp, byte ptr [r11 + r14 + 8]
00885 3b5c2410                       cmp        ebx, dword ptr [rsp + 0x10]
00889 0f8325170000                   jae        0x7efc7bbed834
0088f 41886c1b08                     mov        byte ptr [r11 + rbx + 8], bpl
00894 448d5b01                       lea        r11d, [rbx + 1]
00898 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0089d 458d5603                       lea        r10d, [r14 + 3]
008a1 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
008a6 0f8368170000                   jae        0x7efc7bbed894
008ac 4d63c6                         movsxd     r8, r14d
008af 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008b7 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
008bd 448d5303                       lea        r10d, [rbx + 3]
008c1 443b542410                     cmp        r10d, dword ptr [rsp + 0x10]
008c6 0f83ac170000                   jae        0x7efc7bbed8f8
008cc 4863cb                         movsxd     rcx, ebx
008cf 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008d7 41886c0a09                     mov        byte ptr [r10 + rcx + 9], bpl
008dc 470fbe5c020a                   movsx      r11d, byte ptr [r10 + r8 + 0xa]
008e2 45885c0a0a                     mov        byte ptr [r10 + rcx + 0xa], r11b
008e7 470fbe5c020b                   movsx      r11d, byte ptr [r10 + r8 + 0xb]
008ed 45885c0a0b                     mov        byte ptr [r10 + rcx + 0xb], r11b
008f2 4183fd08                       cmp        r13d, 8
008f6 0f83dc170000                   jae        0x7efc7bbed958
008fc 49ba20ae28e300000000           movabs     r10, 0xe328ae20
00906 470374aa08                     add        r14d, dword ptr [r10 + r13*4 + 8]
0090b 4183f904                       cmp        r9d, 4
0090f 7e4f                           jle        0x7efc7bbec1e0
00911 448d5304                       lea        r10d, [rbx + 4]
00915 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0091a 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
0091f 0f8337180000                   jae        0x7efc7bbed9dc
00925 458bde                         mov        r11d, r14d
00928 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0092d 458bd3                         mov        r10d, r11d
00930 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00938 438b6c1308                     mov        ebp, dword ptr [r11 + r10 + 8]
0093d 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00942 443b5c2458                     cmp        r11d, dword ptr [rsp + 0x58]
00947 0f8393180000                   jae        0x7efc7bbeda60
0094d 448bd3                         mov        r10d, ebx
00950 4d63d2                         movsxd     r10, r10d
00953 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0095b 43896c130c                     mov        dword ptr [r11 + r10 + 0xc], ebp
00960 4183f908                       cmp        r9d, 8
00964 0f8e0afdffff                   jle        0x7efc7bbebef4
0096a 448d5308                       lea        r10d, [rbx + 8]
0096e 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00973 49ba48ae28e300000000           movabs     r10, 0xe328ae48
0097d 478b5caa08                     mov        r11d, dword ptr [r10 + r13*4 + 8]
00982 452bf3                         sub        r14d, r11d
00985 418d6e08                       lea        ebp, [r14 + 8]
00989 3b6c246c                       cmp        ebp, dword ptr [rsp + 0x6c]
0098d 0f83c51a0000                   jae        0x7efc7bbedcd8
00993 4d63d6                         movsxd     r10, r14d
00996 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
0099e 4b8b6c1510                     mov        rbp, qword ptr [r13 + r10 + 0x10]
009a3 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
009a8 443b5c246c                     cmp        r11d, dword ptr [rsp + 0x6c]
009ad 0f83f91a0000                   jae        0x7efc7bbedd2c
009b3 4c63d3                         movsxd     r10, ebx
009b6 4b896c1510                     mov        qword ptr [r13 + r10 + 0x10], rbp
009bb e9b4fcffff                     jmp        0x7efc7bbebef4
009c0 4585f6                         test       r14d, r14d
009c3 0f8c2b1b0000                   jl         0x7efc7bbedd74
009c9 85db                           test       ebx, ebx
009cb 0f8c231b0000                   jl         0x7efc7bbedd74
009d1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009d6 443bd3                         cmp        r10d, ebx
009d9 0f82151b0000                   jb         0x7efc7bbedd74
009df 468d1c2b                       lea        r11d, [rbx + r13]
009e3 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
009e8 443b54245c                     cmp        r10d, dword ptr [rsp + 0x5c]
009ed 0f82011b0000                   jb         0x7efc7bbedd74
009f3 4585ed                         test       r13d, r13d
009f6 0f8cf81a0000                   jl         0x7efc7bbedd74
009fc 4585ed                         test       r13d, r13d
009ff 0f842bf8ffff                   je         0x7efc7bbebab0
00a05 4883fd20                       cmp        rbp, 0x20
00a09 7728                           ja         0x7efc7bbec2b3
00a0b 458bd5                         mov        r10d, r13d
00a0e 4d63d2                         movsxd     r10, r10d
00a11 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a18 c442a8f5db                     bzhi       r11, r11, r10
00a1d c4c1fb92fb                     kmovq      k7, r11
00a22 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a28 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a2e e9fdf7ffff                     jmp        0x7efc7bbebab0
00a33 488bd5                         mov        rdx, rbp
00a36 c5f877                         vzeroupper 
00a39 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00a43 41ffd2                         call       r10
00a46 0f1f840000000000               nop        dword ptr [rax + rax]
00a4e e9ddf7ffff                     jmp        0x7efc7bbebab0
00a53 83fb30                         cmp        ebx, 0x30
00a56 0f8e9b000000                   jle        0x7efc7bbec377
00a5c 4585d2                         test       r10d, r10d
00a5f 0f8c8f1d0000                   jl         0x7efc7bbee074
00a65 85c0                           test       eax, eax
00a67 0f8c871d0000                   jl         0x7efc7bbee074
00a6d 448b8424e4000000               mov        r8d, dword ptr [rsp + 0xe4]
00a75 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
00a7d 0f82711d0000                   jb         0x7efc7bbee074
00a83 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a88 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00a8d 0f82611d0000                   jb         0x7efc7bbee074
00a93 85db                           test       ebx, ebx
00a95 743d                           je         0x7efc7bbec354
00a97 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a9c 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00aa1 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00aa9 498d740208                     lea        rsi, [r10 + rax + 8]
00aae 4883fa20                       cmp        rdx, 0x20
00ab2 7729                           ja         0x7efc7bbec35d
00ab4 4c63d3                         movsxd     r10, ebx
00ab7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00abe c442a8f5db                     bzhi       r11, r11, r10
00ac3 c4c1fb92fb                     kmovq      k7, r11
00ac8 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ace 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ad4 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00ad8 e99ef8ffff                     jmp        0x7efc7bbebbfb
00add c5f877                         vzeroupper 
00ae0 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00aea 41ffd2                         call       r10
00aed 0f1f840000000000               nop        dword ptr [rax + rax]
00af5 ebdd                           jmp        0x7efc7bbec354
00af7 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
00afc 0f839e1b0000                   jae        0x7efc7bbedf20
00b02 4d63ca                         movsxd     r9, r10d
00b05 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00b0a c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
00b11 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00b18 0f832e1c0000                   jae        0x7efc7bbedfcc
00b1e 4c63c0                         movsxd     r8, eax
00b21 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00b29 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00b30 448d5810                       lea        r11d, [rax + 0x10]
00b34 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b39 418bcb                         mov        ecx, r11d
00b3c 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00b41 0f8dc6000000                   jge        0x7efc7bbec48d
00b47 4d2bc8                         sub        r9, r8
00b4a 4d63c3                         movsxd     r8, r11d
00b4d 48637c2414                     movsxd     rdi, dword ptr [rsp + 0x14]
00b52 4883c7f1                       add        rdi, -0xf
00b56 4f8d1c08                       lea        r11, [r8 + r9]
00b5a 4c3bdf                         cmp        r11, rdi
00b5d 0f83251d0000                   jae        0x7efc7bbee108
00b63 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00b68 4d2bd8                         sub        r11, r8
00b6b 4983c30f                       add        r11, 0xf
00b6f 4983e3f0                       and        r11, 0xfffffffffffffff0
00b73 458bc3                         mov        r8d, r11d
00b76 458d5c0010                     lea        r11d, [r8 + rax + 0x10]
00b7b 4d63db                         movsxd     r11, r11d
00b7e 4f8d440bf0                     lea        r8, [r11 + r9 - 0x10]
00b83 4c3bc7                         cmp        r8, rdi
00b86 0f83fc1c0000                   jae        0x7efc7bbee108
00b8c 3b8c2490000000                 cmp        ecx, dword ptr [rsp + 0x90]
00b93 0f83ef1c0000                   jae        0x7efc7bbee108
00b99 4983c3f0                       add        r11, -0x10
00b9d 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
00ba5 0f83dd1c0000                   jae        0x7efc7bbee108
00bab 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00bb0 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
00bb7 0f8f3b1d0000                   jg         0x7efc7bbee178
00bbd 458bca                         mov        r9d, r10d
00bc0 442bc8                         sub        r9d, eax
00bc3 90                             nop        
00bc4 90                             nop        
00bc5 90                             nop        
00bc6 90                             nop        
00bc7 90                             nop        
00bc8 90                             nop        
00bc9 90                             nop        
00bca 90                             nop        
00bcb 90                             nop        
00bcc 90                             nop        
00bcd 90                             nop        
00bce 90                             nop        
00bcf 90                             nop        
00bd0 458bd9                         mov        r11d, r9d
00bd3 44035c245c                     add        r11d, dword ptr [rsp + 0x5c]
00bd8 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00bdd c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00be4 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00be9 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00bf1 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00bf8 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00bfd 4183c010                       add        r8d, 0x10
00c01 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00c06 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00c0b 7cc3                           jl         0x7efc7bbec450
00c0d 468d0413                       lea        r8d, [rbx + r10]
00c11 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00c15 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00c1d e959f7ffff                     jmp        0x7efc7bbebbfb
00c22 4c63d5                         movsxd     r10, ebp
00c25 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c2c c442a8f5db                     bzhi       r11, r11, r10
00c31 c4c1fb92fb                     kmovq      k7, r11
00c36 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c3c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c42 e9a1000000                     jmp        0x7efc7bbec568
00c47 8b2c24                         mov        ebp, dword ptr [rsp]
00c4a 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00c51 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00c59 4585d2                         test       r10d, r10d
00c5c 0f8cda190000                   jl         0x7efc7bbedebc
00c62 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
00c67 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00c6c 8bb424e4000000                 mov        esi, dword ptr [rsp + 0xe4]
00c73 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00c7b 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
00c83 4585c9                         test       r9d, r9d
00c86 0f8cca190000                   jl         0x7efc7bbeded6
00c8c 3b3424                         cmp        esi, dword ptr [rsp]
00c8f 0f82c1190000                   jb         0x7efc7bbeded6
00c95 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00c99 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
00ca0 03dd                           add        ebx, ebp
00ca2 3bcb                           cmp        ecx, ebx
00ca4 0f82ac190000                   jb         0x7efc7bbeded6
00caa 85ed                           test       ebp, ebp
00cac 0f8ca4190000                   jl         0x7efc7bbeded6
00cb2 85ed                           test       ebp, ebp
00cb4 7432                           je         0x7efc7bbec568
00cb6 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00cbb 4d8bd6                         mov        r10, r14
00cbe 4b8d740e08                     lea        rsi, [r14 + r9 + 8]
00cc3 4863d5                         movsxd     rdx, ebp
00cc6 4883fa20                       cmp        rdx, 0x20
00cca 0f8652ffffff                   jbe        0x7efc7bbec4a2
00cd0 c5f877                         vzeroupper 
00cd3 49ba4091717bfc7e0000           movabs     r10, 0x7efc7b719140
00cdd 41ffd2                         call       r10
00ce0 0f1f840000000000               nop        dword ptr [rax + rax]
00ce8 41895d38                       mov        dword ptr [r13 + 0x38], ebx
00cec c5f877                         vzeroupper 
00cef 4881c4d0000000                 add        rsp, 0xd0
00cf6 5d                             pop        rbp
00cf7 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00cfb 0f8703220000                   ja         0x7efc7bbee784
00d01 c3                             ret        
00d02 443b74246c                     cmp        r14d, dword ptr [rsp + 0x6c]
00d07 0f835b1c0000                   jae        0x7efc7bbee1e8
00d0d 458bc6                         mov        r8d, r14d
00d10 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00d15 4963d0                         movsxd     rdx, r8d
00d18 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00d20 4d8b541508                     mov        r10, qword ptr [r13 + rdx + 8]
00d25 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00d2a 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
00d2e 0f83ac1c0000                   jae        0x7efc7bbee260
00d34 448bcb                         mov        r9d, ebx
00d37 418d6908                       lea        ebp, [r9 + 8]
00d3b 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00d3f 4d63d1                         movsxd     r10, r9d
00d42 4c8b442460                     mov        r8, qword ptr [rsp + 0x60]
00d47 4f89441508                     mov        qword ptr [r13 + r10 + 8], r8
00d4c 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00d53 0f8d1bf9ffff                   jge        0x7efc7bbebef4
00d59 492bd2                         sub        rdx, r10
00d5c 4863cd                         movsxd     rcx, ebp
00d5f 4c8d1411                       lea        r10, [rcx + rdx]
00d63 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00d6b 0f83e31c0000                   jae        0x7efc7bbee2d4
00d71 4d8bd3                         mov        r10, r11
00d74 4c2bd1                         sub        r10, rcx
00d77 4983c207                       add        r10, 7
00d7b 4983e2f8                       and        r10, 0xfffffffffffffff8
00d7f 458bd2                         mov        r10d, r10d
00d82 478d440a08                     lea        r8d, [r10 + r9 + 8]
00d87 4d63d0                         movsxd     r10, r8d
00d8a 4d8d4412f8                     lea        r8, [r10 + rdx - 8]
00d8f 4c3b8424a0000000               cmp        r8, qword ptr [rsp + 0xa0]
00d97 0f83b71c0000                   jae        0x7efc7bbee2d4
00d9d 3b6c246c                       cmp        ebp, dword ptr [rsp + 0x6c]
00da1 0f83ad1c0000                   jae        0x7efc7bbee2d4
00da7 4983c2f8                       add        r10, -8
00dab 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00db3 0f839b1c0000                   jae        0x7efc7bbee2d4
00db9 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00dc1 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00dc8 0f8f1a1d0000                   jg         0x7efc7bbee368
00dce 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00dd2 412be9                         sub        ebp, r9d
00dd5 89ac24e0000000                 mov        dword ptr [rsp + 0xe0], ebp
00ddc 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00de4 458bc5                         mov        r8d, r13d
00de7 41baf8ffffff                   mov        r10d, 0xfffffff8
00ded 452bd0                         sub        r10d, r8d
00df0 452bd1                         sub        r10d, r9d
00df3 4183c110                       add        r9d, 0x10
00df7 4183c2f0                       add        r10d, -0x10
00dfb 4c8b6c2418                     mov        r13, qword ptr [rsp + 0x18]
00e00 498bf5                         mov        rsi, r13
00e03 4d8d43c8                       lea        r8, [r11 - 0x38]
00e07 4981f800000080                 cmp        r8, -0x80000000
00e0e 48c7c700000080                 mov        rdi, 0xffffffff80000000
00e15 4c0f4cc7                       cmovl      r8, rdi
00e19 458bc0                         mov        r8d, r8d
00e1c 442bf3                         sub        r14d, ebx
00e1f 4963d9                         movsxd     rbx, r9d
00e22 bf06000000                     mov        edi, 6
00e27 c442c0f5d2                     bzhi       r10, r10, rdi
00e2c 4903da                         add        rbx, r10
00e2f 493bdb                         cmp        rbx, r11
00e32 498bfb                         mov        rdi, r11
00e35 480f4cfb                       cmovl      rdi, rbx
00e39 4c8bd7                         mov        r10, rdi
00e3c 4c2bd1                         sub        r10, rcx
00e3f 498d5aff                       lea        rbx, [r10 - 1]
00e43 48c1fb3f                       sar        rbx, 0x3f
00e47 48c1eb3d                       shr        rbx, 0x3d
00e4b 4e8d5413ff                     lea        r10, [rbx + r10 - 1]
00e50 4983e2f8                       and        r10, 0xfffffffffffffff8
00e54 4c03d1                         add        r10, rcx
00e57 493bca                         cmp        rcx, r10
00e5a 490f4cca                       cmovl      rcx, r10
00e5e 448bd1                         mov        r10d, ecx
00e61 438d5c1608                     lea        ebx, [r14 + r10 + 8]
00e66 4183c208                       add        r10d, 8
00e6a 4863cb                         movsxd     rcx, ebx
00e6d 4803ce                         add        rcx, rsi
00e70 4963c2                         movsxd     rax, r10d
00e73 4803c6                         add        rax, rsi
00e76 488d5908                       lea        rbx, [rcx + 8]
00e7a 4883c148                       add        rcx, 0x48
00e7e 488d7048                       lea        rsi, [rax + 0x48]
00e82 4533d2                         xor        r10d, r10d
00e85 483bf3                         cmp        rsi, rbx
00e88 410f96c2                       setbe      r10b
00e8c 4883c008                       add        rax, 8
00e90 33db                           xor        ebx, ebx
00e92 483bc8                         cmp        rcx, rax
00e95 0f96c3                         setbe      bl
00e98 440bd3                         or         r10d, ebx
00e9b 0f847b0e0000                   je         0x7efc7bbed59c
00ea1 448bcf                         mov        r9d, edi
00ea4 eb06                           jmp        0x7efc7bbec72c
00ea6 90                             nop        
00ea7 90                             nop        
00ea8 897c2440                       mov        dword ptr [rsp + 0x40], edi
00eac 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
00eb4 4403542440                     add        r10d, dword ptr [rsp + 0x40]
00eb9 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00ec1 4f8b541508                     mov        r10, qword ptr [r13 + r10 + 8]
00ec6 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
00eca 4d89540d08                     mov        qword ptr [r13 + rcx + 8], r10
00ecf 8b7c2440                       mov        edi, dword ptr [rsp + 0x40]
00ed3 83c708                         add        edi, 8
00ed6 413bf9                         cmp        edi, r9d
00ed9 7ccd                           jl         0x7efc7bbec728
00edb 4981c308feffff                 add        r11, -0x1f8
00ee2 4981fb00000080                 cmp        r11, -0x80000000
00ee9 49c7c200000080                 mov        r10, 0xffffffff80000000
00ef0 4d0f4cda                       cmovl      r11, r10
00ef4 418bdb                         mov        ebx, r11d
00ef7 3bfb                           cmp        edi, ebx
00ef9 0f8d6d1c0000                   jge        0x7efc7bbee3ec
00eff 4c63d7                         movsxd     r10, edi
00f02 4c03d2                         add        r10, rdx
00f05 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00f0d 0f83611c0000                   jae        0x7efc7bbee3f4
00f13 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f18 4181c200020000                 add        r10d, 0x200
00f1f 4d63da                         movsxd     r11, r10d
00f22 4c03da                         add        r11, rdx
00f25 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00f2d 0f83551c0000                   jae        0x7efc7bbee408
00f33 3b7c246c                       cmp        edi, dword ptr [rsp + 0x6c]
00f37 0f835f1c0000                   jae        0x7efc7bbee41c
00f3d 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00f42 0f83681c0000                   jae        0x7efc7bbee430
00f48 8bb42484000000                 mov        esi, dword ptr [rsp + 0x84]
00f4f eb12                           jmp        0x7efc7bbec7e3
00f51 90                             nop        
00f52 90                             nop        
00f53 90                             nop        
00f54 90                             nop        
00f55 90                             nop        
00f56 90                             nop        
00f57 90                             nop        
00f58 90                             nop        
00f59 90                             nop        
00f5a 90                             nop        
00f5b 90                             nop        
00f5c 90                             nop        
00f5d 90                             nop        
00f5e 90                             nop        
00f5f 90                             nop        
00f60 418bf9                         mov        edi, r9d
00f63 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
00f6b 4403d7                         add        r10d, edi
00f6e 448d9f00010000                 lea        r11d, [rdi + 0x100]
00f75 44039c24e0000000               add        r11d, dword ptr [rsp + 0xe0]
00f7d 418bca                         mov        ecx, r10d
00f80 62f17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 8]
00f8b 4963ca                         movsxd     rcx, r10d
00f8e 458bd3                         mov        r10d, r11d
00f91 4963c3                         movsxd     rax, r11d
00f94 448bdf                         mov        r11d, edi
00f97 62b17e487f841e08000000         vmovdqu32  zmmword ptr [rsi + r11 + 8], zmm0
00fa2 448bcf                         mov        r9d, edi
00fa5 4963e9                         movsxd     rbp, r9d
00fa8 448d5f40                       lea        r11d, [rdi + 0x40]
00fac 44039c24e0000000               add        r11d, dword ptr [rsp + 0xe0]
00fb4 62b17e486f841e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 8]
00fbf 62f17e487f842e48000000         vmovdqu32  zmmword ptr [rsi + rbp + 0x48], zmm0
00fca 448d8f80000000                 lea        r9d, [rdi + 0x80]
00fd1 44038c24e0000000               add        r9d, dword ptr [rsp + 0xe0]
00fd9 62b17e486f840e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r9 + 8]
00fe4 62f17e487f842e88000000         vmovdqu32  zmmword ptr [rsi + rbp + 0x88], zmm0
00fef 62f17e486f840ec8000000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0xc8]
00ffa 62f17e487f842ec8000000         vmovdqu32  zmmword ptr [rsi + rbp + 0xc8], zmm0
01005 62b17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 8]
01010 62f17e487f842e08010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x108], zmm0
0101b 62f17e486f840e48010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x148]
01026 62f17e487f842e48010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x148], zmm0
01031 62f17e486f840e88010000         vmovdqu32  zmm0, zmmword ptr [rsi + rcx + 0x188]
0103c 62f17e487f842e88010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x188], zmm0
01047 62f17e486f8406c8000000         vmovdqu32  zmm0, zmmword ptr [rsi + rax + 0xc8]
01052 62f17e487f842ec8010000         vmovdqu32  zmmword ptr [rsi + rbp + 0x1c8], zmm0
0105d 448d8f00020000                 lea        r9d, [rdi + 0x200]
01064 443bcb                         cmp        r9d, ebx
01067 0f8cf3feffff                   jl         0x7efc7bbec7e0
0106d 453bc8                         cmp        r9d, r8d
01070 7d5c                           jge        0x7efc7bbec94e
01072 81c738020000                   add        edi, 0x238
01078 4c63d7                         movsxd     r10, edi
0107b 4c03d2                         add        r10, rdx
0107e 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01086 0f834c1b0000                   jae        0x7efc7bbee458
0108c 3b7c246c                       cmp        edi, dword ptr [rsp + 0x6c]
01090 0f836a1b0000                   jae        0x7efc7bbee480
01096 8bde                           mov        ebx, esi
01098 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
010a0 4503d1                         add        r10d, r9d
010a3 62b17e486f841308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 8]
010ae 458bd9                         mov        r11d, r9d
010b1 62b17e487f841b08000000         vmovdqu32  zmmword ptr [rbx + r11 + 8], zmm0
010bc 4183c140                       add        r9d, 0x40
010c0 453bc8                         cmp        r9d, r8d
010c3 7cd3                           jl         0x7efc7bbec918
010c5 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
010cc eb07                           jmp        0x7efc7bbec955
010ce 89b42484000000                 mov        dword ptr [rsp + 0x84], esi
010d5 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
010dd 0f8d91f5ffff                   jge        0x7efc7bbebef4
010e3 4d63d1                         movsxd     r10, r9d
010e6 4c03d2                         add        r10, rdx
010e9 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
010f1 0f83cd1a0000                   jae        0x7efc7bbee444
010f7 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
010fc 0f83ea1a0000                   jae        0x7efc7bbee46c
01102 90                             nop        
01103 90                             nop        
01104 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
0110c 4503d1                         add        r10d, r9d
0110f 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01116 4e8b541308                     mov        r10, qword ptr [rbx + r10 + 8]
0111b 458bd9                         mov        r11d, r9d
0111e 4e89541b08                     mov        qword ptr [rbx + r11 + 8], r10
01123 4183c108                       add        r9d, 8
01127 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
0112f 7cd3                           jl         0x7efc7bbec984
01131 e93ef5ffff                     jmp        0x7efc7bbebef4
01136 4d03da                         add        r11, r10
01139 4c3bd9                         cmp        r11, rcx
0113c 7e08                           jle        0x7efc7bbec9c6
0113e 4533c9                         xor        r9d, r9d
01141 e958efffff                     jmp        0x7efc7bbeb91e
01146 4533c9                         xor        r9d, r9d
01149 bb01000000                     mov        ebx, 1
0114e e94defffff                     jmp        0x7efc7bbeb920
01153 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
0115b 0f83b31a0000                   jae        0x7efc7bbee494
01161 4963ce                         movsxd     rcx, r14d
01164 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0116c c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
01173 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
0117a 0f830c1b0000                   jae        0x7efc7bbee50c
01180 8d6b10                         lea        ebp, [rbx + 0x10]
01183 4c63c3                         movsxd     r8, ebx
01186 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
0118d 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
01194 0f8ddaf4ffff                   jge        0x7efc7bbebef4
0119a 492bc8                         sub        rcx, r8
0119d 4c63c5                         movsxd     r8, ebp
011a0 4d8d1408                       lea        r10, [r8 + rcx]
011a4 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
011ac 0f835a1b0000                   jae        0x7efc7bbee58c
011b2 4d8bd3                         mov        r10, r11
011b5 4d2bd0                         sub        r10, r8
011b8 4983c20f                       add        r10, 0xf
011bc 4983e2f0                       and        r10, 0xfffffffffffffff0
011c0 458bd2                         mov        r10d, r10d
011c3 458d441a10                     lea        r8d, [r10 + rbx + 0x10]
011c8 4d63d0                         movsxd     r10, r8d
011cb 4d8d440af0                     lea        r8, [r10 + rcx - 0x10]
011d0 4c3b842498000000               cmp        r8, qword ptr [rsp + 0x98]
011d8 0f832e1b0000                   jae        0x7efc7bbee58c
011de 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
011e5 0f83211b0000                   jae        0x7efc7bbee58c
011eb 4983c2f0                       add        r10, -0x10
011ef 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
011f7 0f830f1b0000                   jae        0x7efc7bbee58c
011fd 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
01205 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
0120c 0f8f561b0000                   jg         0x7efc7bbee5e8
01212 442bf3                         sub        r14d, ebx
01215 83c320                         add        ebx, 0x20
01218 eb05                           jmp        0x7efc7bbeca9f
0121a 90                             nop        
0121b 90                             nop        
0121c 418be9                         mov        ebp, r9d
0121f 458d042e                       lea        r8d, [r14 + rbp]
01223 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
0122b c4817a6f440508                 vmovdqu    xmm0, xmmword ptr [r13 + r8 + 8]
01232 448bd5                         mov        r10d, ebp
01235 c4817a7f441508                 vmovdqu    xmmword ptr [r13 + r10 + 8], xmm0
0123c 448d4d10                       lea        r9d, [rbp + 0x10]
01240 443bcb                         cmp        r9d, ebx
01243 7cd7                           jl         0x7efc7bbeca9c
01245 4981c310ffffff                 add        r11, -0xf0
0124c 4981fb00000080                 cmp        r11, -0x80000000
01253 49c7c200000080                 mov        r10, 0xffffffff80000000
0125a 4d0f4cda                       cmovl      r11, r10
0125e 458bd3                         mov        r10d, r11d
01261 453bca                         cmp        r9d, r10d
01264 0f8d81010000                   jge        0x7efc7bbecc6b
0126a 4d63d9                         movsxd     r11, r9d
0126d 4c03d9                         add        r11, rcx
01270 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
01278 0f83361b0000                   jae        0x7efc7bbee634
0127e 81c500010000                   add        ebp, 0x100
01284 4c63dd                         movsxd     r11, ebp
01287 4c03d9                         add        r11, rcx
0128a 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
01292 0f83301b0000                   jae        0x7efc7bbee648
01298 443b8c2490000000               cmp        r9d, dword ptr [rsp + 0x90]
012a0 0f83361b0000                   jae        0x7efc7bbee65c
012a6 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
012ad 0f833d1b0000                   jae        0x7efc7bbee670
012b3 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
012ba 90                             nop        
012bb 90                             nop        
012bc 90                             nop        
012bd 90                             nop        
012be 90                             nop        
012bf 90                             nop        
012c0 478d040e                       lea        r8d, [r14 + r9]
012c4 458bd9                         mov        r11d, r9d
012c7 4963fb                         movsxd     rdi, r11d
012ca 458bd8                         mov        r11d, r8d
012cd c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
012d4 4d63d8                         movsxd     r11, r8d
012d7 458bc1                         mov        r8d, r9d
012da c4a17a7f440308                 vmovdqu    xmmword ptr [rbx + r8 + 8], xmm0
012e1 c4a17a6f441b18                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x18]
012e8 c5fa7f443b18                   vmovdqu    xmmword ptr [rbx + rdi + 0x18], xmm0
012ee c4a17a6f441b28                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x28]
012f5 c5fa7f443b28                   vmovdqu    xmmword ptr [rbx + rdi + 0x28], xmm0
012fb c4a17a6f441b38                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x38]
01302 c5fa7f443b38                   vmovdqu    xmmword ptr [rbx + rdi + 0x38], xmm0
01308 c4a17a6f441b48                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x48]
0130f c5fa7f443b48                   vmovdqu    xmmword ptr [rbx + rdi + 0x48], xmm0
01315 c4a17a6f441b58                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x58]
0131c c5fa7f443b58                   vmovdqu    xmmword ptr [rbx + rdi + 0x58], xmm0
01322 c4a17a6f441b68                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x68]
01329 c5fa7f443b68                   vmovdqu    xmmword ptr [rbx + rdi + 0x68], xmm0
0132f c4a17a6f441b78                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x78]
01336 c5fa7f443b78                   vmovdqu    xmmword ptr [rbx + rdi + 0x78], xmm0
0133c c4a17a6f841b88000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x88]
01346 c5fa7f843b88000000             vmovdqu    xmmword ptr [rbx + rdi + 0x88], xmm0
0134f c4a17a6f841b98000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0x98]
01359 c5fa7f843b98000000             vmovdqu    xmmword ptr [rbx + rdi + 0x98], xmm0
01362 c4a17a6f841ba8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xa8]
0136c c5fa7f843ba8000000             vmovdqu    xmmword ptr [rbx + rdi + 0xa8], xmm0
01375 c4a17a6f841bb8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xb8]
0137f c5fa7f843bb8000000             vmovdqu    xmmword ptr [rbx + rdi + 0xb8], xmm0
01388 c4a17a6f841bc8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xc8]
01392 c5fa7f843bc8000000             vmovdqu    xmmword ptr [rbx + rdi + 0xc8], xmm0
0139b c4a17a6f841bd8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xd8]
013a5 c5fa7f843bd8000000             vmovdqu    xmmword ptr [rbx + rdi + 0xd8], xmm0
013ae c4a17a6f841be8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xe8]
013b8 c5fa7f843be8000000             vmovdqu    xmmword ptr [rbx + rdi + 0xe8], xmm0
013c1 c4a17a6f841bf8000000           vmovdqu    xmm0, xmmword ptr [rbx + r11 + 0xf8]
013cb c5fa7f843bf8000000             vmovdqu    xmmword ptr [rbx + rdi + 0xf8], xmm0
013d4 4181c100010000                 add        r9d, 0x100
013db 453bca                         cmp        r9d, r10d
013de 0f8cdcfeffff                   jl         0x7efc7bbecb40
013e4 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
013eb 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
013f3 0f8d7bf2ffff                   jge        0x7efc7bbebef4
013f9 4d63d1                         movsxd     r10, r9d
013fc 4c03d1                         add        r10, rcx
013ff 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
01407 0f83f7190000                   jae        0x7efc7bbee684
0140d 443b8c2490000000               cmp        r9d, dword ptr [rsp + 0x90]
01415 0f83fd190000                   jae        0x7efc7bbee698
0141b 90                             nop        
0141c 478d1c0e                       lea        r11d, [r14 + r9]
01420 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
01427 c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
0142e 458bd1                         mov        r10d, r9d
01431 c4a17a7f441308                 vmovdqu    xmmword ptr [rbx + r10 + 8], xmm0
01438 4183c110                       add        r9d, 0x10
0143c 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
01444 7cd6                           jl         0x7efc7bbecc9c
01446 e929f2ffff                     jmp        0x7efc7bbebef4
0144b bee4ffffff                     mov        esi, 0xffffffe4
01450 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01455 448b0424                       mov        r8d, dword ptr [rsp]
01459 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01461 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01466 4c891c24                       mov        qword ptr [rsp], r11
0146a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0146f 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01477 8944240c                       mov        dword ptr [rsp + 0xc], eax
0147b 48ff742420                     push       qword ptr [rsp + 0x20]
01480 488f442418                     pop        qword ptr [rsp + 0x18]
01485 48ff742428                     push       qword ptr [rsp + 0x28]
0148a 488f442420                     pop        qword ptr [rsp + 0x20]
0148f 48ff742430                     push       qword ptr [rsp + 0x30]
01494 488f442428                     pop        qword ptr [rsp + 0x28]
01499 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0149d 48894424f8                     mov        qword ptr [rsp - 8], rax
014a2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
014a6 89442440                       mov        dword ptr [rsp + 0x40], eax
014aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014af 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
014b4 4489542450                     mov        dword ptr [rsp + 0x50], r10d
014b9 90                             nop        
014ba 90                             nop        
014bb 90                             nop        
014bc c5f877                         vzeroupper 
014bf e81c0daeff                     call       0x7efc7b6cda60
014c4 0f1f8400bc150002               nop        dword ptr [rax + rax + 0x20015bc]
014cc 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
014d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014da e88187cb17                     call       0x7efc938a54e0
014df f4                             hlt        
014e0 bee4ffffff                     mov        esi, 0xffffffe4
014e5 498beb                         mov        rbp, r11
014e8 448b1c24                       mov        r11d, dword ptr [rsp]
014ec 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
014f4 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014f9 4c891c24                       mov        qword ptr [rsp], r11
014fd 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01502 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0150a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0150f 48ff742420                     push       qword ptr [rsp + 0x20]
01514 488f442418                     pop        qword ptr [rsp + 0x18]
01519 48ff742428                     push       qword ptr [rsp + 0x28]
0151e 488f442420                     pop        qword ptr [rsp + 0x20]
01523 48ff742430                     push       qword ptr [rsp + 0x30]
01528 488f442428                     pop        qword ptr [rsp + 0x28]
0152d 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01531 48894424f8                     mov        qword ptr [rsp - 8], rax
01536 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0153a 89442440                       mov        dword ptr [rsp + 0x40], eax
0153e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01543 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01548 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0154c c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01552 90                             nop        
01553 90                             nop        
01554 c5f877                         vzeroupper 
01557 e8840caeff                     call       0x7efc7b6cda60
0155c 0f1f840054160003               nop        dword ptr [rax + rax + 0x3001654]
01564 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0156e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01572 e8e986cb17                     call       0x7efc938a54e0
01577 f4                             hlt        
01578 bee4ffffff                     mov        esi, 0xffffffe4
0157d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01582 448b1424                       mov        r10d, dword ptr [rsp]
01586 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0158e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01593 4c891424                       mov        qword ptr [rsp], r10
01597 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0159c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
015a4 895c240c                       mov        dword ptr [rsp + 0xc], ebx
015a8 48ff742420                     push       qword ptr [rsp + 0x20]
015ad 488f442418                     pop        qword ptr [rsp + 0x18]
015b2 48ff742428                     push       qword ptr [rsp + 0x28]
015b7 488f442420                     pop        qword ptr [rsp + 0x20]
015bc 48ff742430                     push       qword ptr [rsp + 0x30]
015c1 488f442428                     pop        qword ptr [rsp + 0x28]
015c6 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
015cb 4489742444                     mov        dword ptr [rsp + 0x44], r14d
015d0 c5f877                         vzeroupper 
015d3 e8080caeff                     call       0x7efc7b6cda60
015d8 0f1f8400d0160004               nop        dword ptr [rax + rax + 0x40016d0]
015e0 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
015ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ee e86d86cb17                     call       0x7efc938a54e0
015f3 f4                             hlt        
015f4 bee4ffffff                     mov        esi, 0xffffffe4
015f9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
015fe 448b1c24                       mov        r11d, dword ptr [rsp]
01602 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0160a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0160f 4c891424                       mov        qword ptr [rsp], r10
01613 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01618 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01620 48ff742420                     push       qword ptr [rsp + 0x20]
01625 488f442418                     pop        qword ptr [rsp + 0x18]
0162a 48ff742428                     push       qword ptr [rsp + 0x28]
0162f 488f442420                     pop        qword ptr [rsp + 0x20]
01634 48ff742430                     push       qword ptr [rsp + 0x30]
01639 488f442428                     pop        qword ptr [rsp + 0x28]
0163e 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01643 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01647 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0164d 90                             nop        
0164e 90                             nop        
0164f 90                             nop        
01650 c5f877                         vzeroupper 
01653 e8880baeff                     call       0x7efc7b6cda60
01658 0f1f840050170005               nop        dword ptr [rax + rax + 0x5001750]
01660 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0166a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0166e e8ed85cb17                     call       0x7efc938a54e0
01673 f4                             hlt        
01674 be45ffffff                     mov        esi, 0xffffff45
01679 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01681 4489ac24e8000000               mov        dword ptr [rsp + 0xe8], r13d
01689 90                             nop        
0168a 90                             nop        
0168b 90                             nop        
0168c c5f877                         vzeroupper 
0168f e84c0baeff                     call       0x7efc7b6cda60
01694 0f1f84008c170006               nop        dword ptr [rax + rax + 0x600178c]
0169c 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
016a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016aa e8b185cb17                     call       0x7efc938a54e0
016af f4                             hlt        
016b0 be45ffffff                     mov        esi, 0xffffff45
016b5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
016ba 448b1c24                       mov        r11d, dword ptr [rsp]
016be 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
016c6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
016cb 4c891c24                       mov        qword ptr [rsp], r11
016cf 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
016d4 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
016dc 8944240c                       mov        dword ptr [rsp + 0xc], eax
016e0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016e5 48ff742420                     push       qword ptr [rsp + 0x20]
016ea 488f442418                     pop        qword ptr [rsp + 0x18]
016ef 48894424f8                     mov        qword ptr [rsp - 8], rax
016f4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
016f8 89442414                       mov        dword ptr [rsp + 0x14], eax
016fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01701 48ff742428                     push       qword ptr [rsp + 0x28]
01706 488f442420                     pop        qword ptr [rsp + 0x20]
0170b 48ff742430                     push       qword ptr [rsp + 0x30]
01710 488f442428                     pop        qword ptr [rsp + 0x28]
01715 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01719 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0171e 90                             nop        
0171f 90                             nop        
01720 c5f877                         vzeroupper 
01723 e8b80aaeff                     call       0x7efc7b6cda60
01728 0f1f840020180007               nop        dword ptr [rax + rax + 0x7001820]
01730 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0173a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0173e e81d85cb17                     call       0x7efc938a54e0
01743 f4                             hlt        
01744 493beb                         cmp        rbp, r11
01747 bdffffffff                     mov        ebp, 0xffffffff
0174c 7c08                           jl         0x7efc7bbecfd6
0174e 400f95c5                       setne      bpl
01752 400fb6ed                       movzx      ebp, bpl
01756 be45ffffff                     mov        esi, 0xffffff45
0175b 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01760 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01768 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0176d 4489442404                     mov        dword ptr [rsp + 4], r8d
01772 89442414                       mov        dword ptr [rsp + 0x14], eax
01776 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0177b 48894424f8                     mov        qword ptr [rsp - 8], rax
01780 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01784 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01788 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0178d 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01791 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01796 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0179b 90                             nop        
0179c c5f877                         vzeroupper 
0179f e83c0aaeff                     call       0x7efc7b6cda60
017a4 0f1f84009c180008               nop        dword ptr [rax + rax + 0x800189c]
017ac 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
017b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ba e8a184cb17                     call       0x7efc938a54e0
017bf f4                             hlt        
017c0 be45ffffff                     mov        esi, 0xffffff45
017c5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
017ca 448b0424                       mov        r8d, dword ptr [rsp]
017ce 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
017d6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
017db 4c891c24                       mov        qword ptr [rsp], r11
017df 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017e4 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
017ec 8944240c                       mov        dword ptr [rsp + 0xc], eax
017f0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
017f5 48ff742420                     push       qword ptr [rsp + 0x20]
017fa 488f442418                     pop        qword ptr [rsp + 0x18]
017ff 48ff742428                     push       qword ptr [rsp + 0x28]
01804 488f442420                     pop        qword ptr [rsp + 0x20]
01809 48ff742430                     push       qword ptr [rsp + 0x30]
0180e 488f442428                     pop        qword ptr [rsp + 0x28]
01813 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01817 48894424f8                     mov        qword ptr [rsp - 8], rax
0181c 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01820 89442440                       mov        dword ptr [rsp + 0x40], eax
01824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01829 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0182e 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01832 90                             nop        
01833 90                             nop        
01834 c5f877                         vzeroupper 
01837 e8a409aeff                     call       0x7efc7b6cda60
0183c 0f1f840034190009               nop        dword ptr [rax + rax + 0x9001934]
01844 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0184e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01852 e80984cb17                     call       0x7efc938a54e0
01857 f4                             hlt        
01858 be45ffffff                     mov        esi, 0xffffff45
0185d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01862 448b1c24                       mov        r11d, dword ptr [rsp]
01866 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0186e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01873 4c891c24                       mov        qword ptr [rsp], r11
01877 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0187c 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01884 8944240c                       mov        dword ptr [rsp + 0xc], eax
01888 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0188d 48ff742420                     push       qword ptr [rsp + 0x20]
01892 488f442418                     pop        qword ptr [rsp + 0x18]
01897 48ff742428                     push       qword ptr [rsp + 0x28]
0189c 488f442420                     pop        qword ptr [rsp + 0x20]
018a1 48ff742430                     push       qword ptr [rsp + 0x30]
018a6 488f442428                     pop        qword ptr [rsp + 0x28]
018ab 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
018af 48894424f8                     mov        qword ptr [rsp - 8], rax
018b4 8b442448                       mov        eax, dword ptr [rsp + 0x48]
018b8 89442440                       mov        dword ptr [rsp + 0x40], eax
018bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c1 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
018c6 90                             nop        
018c7 90                             nop        
018c8 c5f877                         vzeroupper 
018cb e81009aeff                     call       0x7efc7b6cda60
018d0 0f1f8400c819000a               nop        dword ptr [rax + rax + 0xa0019c8]
018d8 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
018e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018e6 e87583cb17                     call       0x7efc938a54e0
018eb f4                             hlt        
018ec 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
018f1 4d3bc1                         cmp        r8, r9
018f4 bdffffffff                     mov        ebp, 0xffffffff
018f9 7c08                           jl         0x7efc7bbed183
018fb 400f95c5                       setne      bpl
018ff 400fb6ed                       movzx      ebp, bpl
01903 be45ffffff                     mov        esi, 0xffffff45
01908 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0190d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01915 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0191a 4489442404                     mov        dword ptr [rsp + 4], r8d
0191f 89442414                       mov        dword ptr [rsp + 0x14], eax
01923 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01928 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0192c 48894424f8                     mov        qword ptr [rsp - 8], rax
01931 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01935 89442444                       mov        dword ptr [rsp + 0x44], eax
01939 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01943 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01948 c5f877                         vzeroupper 
0194b e89008aeff                     call       0x7efc7b6cda60
01950 0f1f8400481a000b               nop        dword ptr [rax + rax + 0xb001a48]
01958 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01962 4883e4f0                       and        rsp, 0xfffffffffffffff0
01966 e8f582cb17                     call       0x7efc938a54e0
0196b f4                             hlt        
0196c 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01971 493be8                         cmp        rbp, r8
01974 bdffffffff                     mov        ebp, 0xffffffff
01979 7c08                           jl         0x7efc7bbed203
0197b 400f95c5                       setne      bpl
0197f 400fb6ed                       movzx      ebp, bpl
01983 be45ffffff                     mov        esi, 0xffffff45
01988 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0198d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01995 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0199a 4489442404                     mov        dword ptr [rsp + 4], r8d
0199f 89442414                       mov        dword ptr [rsp + 0x14], eax
019a3 4489542418                     mov        dword ptr [rsp + 0x18], r10d
019a8 895c2440                       mov        dword ptr [rsp + 0x40], ebx
019ac 48894424f8                     mov        qword ptr [rsp - 8], rax
019b1 8b442448                       mov        eax, dword ptr [rsp + 0x48]
019b5 89442444                       mov        dword ptr [rsp + 0x44], eax
019b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019be 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
019c3 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
019c8 c5f877                         vzeroupper 
019cb e81008aeff                     call       0x7efc7b6cda60
019d0 0f1f8400c81a000c               nop        dword ptr [rax + rax + 0xc001ac8]
019d8 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
019e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019e6 e87582cb17                     call       0x7efc938a54e0
019eb f4                             hlt        
019ec bee4ffffff                     mov        esi, 0xffffffe4
019f1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
019f6 448b1c24                       mov        r11d, dword ptr [rsp]
019fa 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01a02 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a07 4c891424                       mov        qword ptr [rsp], r10
01a0b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a10 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01a18 48ff742420                     push       qword ptr [rsp + 0x20]
01a1d 488f442418                     pop        qword ptr [rsp + 0x18]
01a22 48ff742428                     push       qword ptr [rsp + 0x28]
01a27 488f442420                     pop        qword ptr [rsp + 0x20]
01a2c 48ff742430                     push       qword ptr [rsp + 0x30]
01a31 488f442428                     pop        qword ptr [rsp + 0x28]
01a36 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01a3b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01a3f 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01a43 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01a48 c5f877                         vzeroupper 
01a4b e89007aeff                     call       0x7efc7b6cda60
01a50 0f1f8400481b000d               nop        dword ptr [rax + rax + 0xd001b48]
01a58 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01a62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a66 e8f581cb17                     call       0x7efc938a54e0
01a6b f4                             hlt        
01a6c bee4ffffff                     mov        esi, 0xffffffe4
01a71 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01a76 448b1424                       mov        r10d, dword ptr [rsp]
01a7a 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01a82 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a87 4c891424                       mov        qword ptr [rsp], r10
01a8b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a90 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01a98 48ff742420                     push       qword ptr [rsp + 0x20]
01a9d 488f442418                     pop        qword ptr [rsp + 0x18]
01aa2 48ff742428                     push       qword ptr [rsp + 0x28]
01aa7 488f442420                     pop        qword ptr [rsp + 0x20]
01aac 48ff742430                     push       qword ptr [rsp + 0x30]
01ab1 488f442428                     pop        qword ptr [rsp + 0x28]
01ab6 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01abb 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01abf 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01ac4 48894c2450                     mov        qword ptr [rsp + 0x50], rcx
01ac9 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01acd 90                             nop        
01ace 90                             nop        
01acf 90                             nop        
01ad0 c5f877                         vzeroupper 
01ad3 e80807aeff                     call       0x7efc7b6cda60
01ad8 0f1f8400d01b000e               nop        dword ptr [rax + rax + 0xe001bd0]
01ae0 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aee e86d81cb17                     call       0x7efc938a54e0
01af3 f4                             hlt        
01af4 4183c608                       add        r14d, 8
01af8 be6effffff                     mov        esi, 0xffffff6e
01afd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b02 448b1c24                       mov        r11d, dword ptr [rsp]
01b06 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01b0e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b13 4c891424                       mov        qword ptr [rsp], r10
01b17 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b1c 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01b24 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01b29 48ff742420                     push       qword ptr [rsp + 0x20]
01b2e 488f442418                     pop        qword ptr [rsp + 0x18]
01b33 48ff742428                     push       qword ptr [rsp + 0x28]
01b38 488f442420                     pop        qword ptr [rsp + 0x20]
01b3d 48ff742430                     push       qword ptr [rsp + 0x30]
01b42 488f442428                     pop        qword ptr [rsp + 0x28]
01b47 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01b4c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b51 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01b58 89442440                       mov        dword ptr [rsp + 0x40], eax
01b5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b61 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01b66 897c244c                       mov        dword ptr [rsp + 0x4c], edi
01b6a 90                             nop        
01b6b 90                             nop        
01b6c c5f877                         vzeroupper 
01b6f e86c06aeff                     call       0x7efc7b6cda60
01b74 0f1f84006c1c000f               nop        dword ptr [rax + rax + 0xf001c6c]
01b7c 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01b86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b8a e8d180cb17                     call       0x7efc938a54e0
01b8f f4                             hlt        
01b90 4183c608                       add        r14d, 8
01b94 be66ffffff                     mov        esi, 0xffffff66
01b99 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b9e 448b1c24                       mov        r11d, dword ptr [rsp]
01ba2 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01baa 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01baf 4c891424                       mov        qword ptr [rsp], r10
01bb3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bb8 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01bc0 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01bc5 48ff742420                     push       qword ptr [rsp + 0x20]
01bca 488f442418                     pop        qword ptr [rsp + 0x18]
01bcf 48ff742428                     push       qword ptr [rsp + 0x28]
01bd4 488f442420                     pop        qword ptr [rsp + 0x20]
01bd9 48ff742430                     push       qword ptr [rsp + 0x30]
01bde 488f442428                     pop        qword ptr [rsp + 0x28]
01be3 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01be8 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01bed 897c244c                       mov        dword ptr [rsp + 0x4c], edi
01bf1 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01bf6 90                             nop        
01bf7 90                             nop        
01bf8 c5f877                         vzeroupper 
01bfb e8e005aeff                     call       0x7efc7b6cda60
01c00 0f1f8400f81c0010               nop        dword ptr [rax + rax + 0x10001cf8]
01c08 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01c12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c16 e84580cb17                     call       0x7efc938a54e0
01c1b f4                             hlt        
01c1c 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
01c26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2a e83180cb17                     call       0x7efc938a54e0
01c2f f4                             hlt        
01c30 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
01c3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c3e e81d80cb17                     call       0x7efc938a54e0
01c43 f4                             hlt        
01c44 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
01c4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c52 e80980cb17                     call       0x7efc938a54e0
01c57 f4                             hlt        
01c58 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
01c62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c66 e8f57fcb17                     call       0x7efc938a54e0
01c6b f4                             hlt        
01c6c 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
01c76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c7a e8e17fcb17                     call       0x7efc938a54e0
01c7f f4                             hlt        
01c80 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
01c8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c8e e8cd7fcb17                     call       0x7efc938a54e0
01c93 f4                             hlt        
01c94 418be9                         mov        ebp, r9d
01c97 e9cfe9ffff                     jmp        0x7efc7bbebeeb
01c9c beccffffff                     mov        esi, 0xffffffcc
01ca1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01ca6 448b1424                       mov        r10d, dword ptr [rsp]
01caa 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01cb2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01cb7 4c891424                       mov        qword ptr [rsp], r10
01cbb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cc0 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01cc8 48ff742420                     push       qword ptr [rsp + 0x20]
01ccd 488f442418                     pop        qword ptr [rsp + 0x18]
01cd2 48ff742428                     push       qword ptr [rsp + 0x28]
01cd7 488f442420                     pop        qword ptr [rsp + 0x20]
01cdc 48ff742430                     push       qword ptr [rsp + 0x30]
01ce1 488f442428                     pop        qword ptr [rsp + 0x28]
01ce6 4489742444                     mov        dword ptr [rsp + 0x44], r14d
01ceb 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01cef 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01cf4 c5f877                         vzeroupper 
01cf7 e8e404aeff                     call       0x7efc7b6cda60
01cfc 0f1f8400f41d0011               nop        dword ptr [rax + rax + 0x11001df4]
01d04 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01d0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d12 e8497fcb17                     call       0x7efc938a54e0
01d17 f4                             hlt        
01d18 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01d1c 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
01d24 4403542440                     add        r10d, dword ptr [rsp + 0x40]
01d29 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01d31 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01d36 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
01d3a 4d89540b08                     mov        qword ptr [r11 + rcx + 8], r10
01d3f 8b5c2440                       mov        ebx, dword ptr [rsp + 0x40]
01d43 83c308                         add        ebx, 8
01d46 413bd9                         cmp        ebx, r9d
01d49 7ccd                           jl         0x7efc7bbed598
01d4b 413bd8                         cmp        ebx, r8d
01d4e 0f8dd5000000                   jge        0x7efc7bbed6a9
01d54 4c63d3                         movsxd     r10, ebx
01d57 4c03d2                         add        r10, rdx
01d5a 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01d62 0f83c4100000                   jae        0x7efc7bbee6ac
01d68 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01d6d 4183c140                       add        r9d, 0x40
01d71 4d63d1                         movsxd     r10, r9d
01d74 4c03d2                         add        r10, rdx
01d77 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01d7f 0f83bb100000                   jae        0x7efc7bbee6c0
01d85 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
01d89 0f83c5100000                   jae        0x7efc7bbee6d4
01d8f 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
01d94 0f83ce100000                   jae        0x7efc7bbee6e8
01d9a 8bb42484000000                 mov        esi, dword ptr [rsp + 0x84]
01da1 90                             nop        
01da2 90                             nop        
01da3 90                             nop        
01da4 90                             nop        
01da5 90                             nop        
01da6 90                             nop        
01da7 90                             nop        
01da8 90                             nop        
01da9 90                             nop        
01daa 90                             nop        
01dab 90                             nop        
01dac 90                             nop        
01dad 90                             nop        
01dae 90                             nop        
01daf 90                             nop        
01db0 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
01db8 4403d3                         add        r10d, ebx
01dbb 448bdb                         mov        r11d, ebx
01dbe 4963fb                         movsxd     rdi, r11d
01dc1 458bca                         mov        r9d, r10d
01dc4 4e8b4c0e08                     mov        r9, qword ptr [rsi + r9 + 8]
01dc9 4d63d2                         movsxd     r10, r10d
01dcc 448bdb                         mov        r11d, ebx
01dcf 4e894c1e08                     mov        qword ptr [rsi + r11 + 8], r9
01dd4 4e8b5c1610                     mov        r11, qword ptr [rsi + r10 + 0x10]
01dd9 4c895c3e10                     mov        qword ptr [rsi + rdi + 0x10], r11
01dde 4e8b5c1618                     mov        r11, qword ptr [rsi + r10 + 0x18]
01de3 4c895c3e18                     mov        qword ptr [rsi + rdi + 0x18], r11
01de8 4e8b5c1620                     mov        r11, qword ptr [rsi + r10 + 0x20]
01ded 4c895c3e20                     mov        qword ptr [rsi + rdi + 0x20], r11
01df2 4e8b5c1628                     mov        r11, qword ptr [rsi + r10 + 0x28]
01df7 4c895c3e28                     mov        qword ptr [rsi + rdi + 0x28], r11
01dfc 4e8b5c1630                     mov        r11, qword ptr [rsi + r10 + 0x30]
01e01 4c895c3e30                     mov        qword ptr [rsi + rdi + 0x30], r11
01e06 4e8b5c1638                     mov        r11, qword ptr [rsi + r10 + 0x38]
01e0b 4c895c3e38                     mov        qword ptr [rsi + rdi + 0x38], r11
01e10 4e8b541640                     mov        r10, qword ptr [rsi + r10 + 0x40]
01e15 4c89543e40                     mov        qword ptr [rsi + rdi + 0x40], r10
01e1a 83c340                         add        ebx, 0x40
01e1d 413bd8                         cmp        ebx, r8d
01e20 7c8e                           jl         0x7efc7bbed630
01e22 89b42484000000                 mov        dword ptr [rsp + 0x84], esi
01e29 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01e30 0f8d3ee8ffff                   jge        0x7efc7bbebef4
01e36 4c63d3                         movsxd     r10, ebx
01e39 4c03d2                         add        r10, rdx
01e3c 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01e44 0f8332100000                   jae        0x7efc7bbee6fc
01e4a 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
01e4e 0f833c100000                   jae        0x7efc7bbee710
01e54 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
01e5c 4403d3                         add        r10d, ebx
01e5f 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01e67 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01e6c 448bdb                         mov        r11d, ebx
01e6f 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01e74 83c308                         add        ebx, 8
01e77 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01e7e 7cd4                           jl         0x7efc7bbed6d4
01e80 e9efe7ffff                     jmp        0x7efc7bbebef4
01e85 bee4ffffff                     mov        esi, 0xffffffe4
01e8a 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01e8f 448b1c24                       mov        r11d, dword ptr [rsp]
01e93 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01e9b 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01ea0 4c891c24                       mov        qword ptr [rsp], r11
01ea4 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01ea9 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01eb1 8944240c                       mov        dword ptr [rsp + 0xc], eax
01eb5 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01eba 48ff742420                     push       qword ptr [rsp + 0x20]
01ebf 488f442418                     pop        qword ptr [rsp + 0x18]
01ec4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec9 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01ecd 89442414                       mov        dword ptr [rsp + 0x14], eax
01ed1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed6 48ff742428                     push       qword ptr [rsp + 0x28]
01edb 488f442420                     pop        qword ptr [rsp + 0x20]
01ee0 48ff742430                     push       qword ptr [rsp + 0x30]
01ee5 488f442428                     pop        qword ptr [rsp + 0x28]
01eea 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01eee 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01ef3 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01ef8 c5f877                         vzeroupper 
01efb e8e002aeff                     call       0x7efc7b6cda60
01f00 0f1f8400f81f0012               nop        dword ptr [rax + rax + 0x12001ff8]
01f08 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01f12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f16 e8457dcb17                     call       0x7efc938a54e0
01f1b f4                             hlt        
01f1c 4585f6                         test       r14d, r14d
01f1f 0f847f0f0000                   je         0x7efc7bbee724
01f25 8b2c24                         mov        ebp, dword ptr [rsp]
01f28 898424a8000000                 mov        dword ptr [rsp + 0xa8], eax
01f2f 4533d2                         xor        r10d, r10d
01f32 e944edffff                     jmp        0x7efc7bbec4fb
01f37 bee4ffffff                     mov        esi, 0xffffffe4
01f3c 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01f41 448b1424                       mov        r10d, dword ptr [rsp]
01f45 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01f4d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f52 4c891424                       mov        qword ptr [rsp], r10
01f56 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f5b 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01f63 48ff742420                     push       qword ptr [rsp + 0x20]
01f68 488f442410                     pop        qword ptr [rsp + 0x10]
01f6d 48ff742428                     push       qword ptr [rsp + 0x28]
01f72 488f442420                     pop        qword ptr [rsp + 0x20]
01f77 48ff742430                     push       qword ptr [rsp + 0x30]
01f7c 488f442428                     pop        qword ptr [rsp + 0x28]
01f81 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01f86 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01f8a 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01f8f 90                             nop        
01f90 c5f877                         vzeroupper 
01f93 e84802aeff                     call       0x7efc7b6cda60
01f98 0f1f840090200013               nop        dword ptr [rax + rax + 0x13002090]
01fa0 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
01faa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fae e8ad7ccb17                     call       0x7efc938a54e0
01fb3 f4                             hlt        
01fb4 bee4ffffff                     mov        esi, 0xffffffe4
01fb9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fbe 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01fc6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01fcb 4489542404                     mov        dword ptr [rsp + 4], r10d
01fd0 48ff742420                     push       qword ptr [rsp + 0x20]
01fd5 488f442418                     pop        qword ptr [rsp + 0x18]
01fda 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01fdf 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01fe4 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01fe9 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01fed 90                             nop        
01fee 90                             nop        
01fef 90                             nop        
01ff0 c5f877                         vzeroupper 
01ff3 e8e801aeff                     call       0x7efc7b6cda60
01ff8 0f1f8400f0200014               nop        dword ptr [rax + rax + 0x140020f0]
02000 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0200a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0200e e84d7ccb17                     call       0x7efc938a54e0
02013 f4                             hlt        
02014 418d6e01                       lea        ebp, [r14 + 1]
02018 bee4ffffff                     mov        esi, 0xffffffe4
0201d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02022 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0202a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0202f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02034 48ff742420                     push       qword ptr [rsp + 0x20]
02039 488f442418                     pop        qword ptr [rsp + 0x18]
0203e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02042 4489742448                     mov        dword ptr [rsp + 0x48], r14d
02047 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0204c 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
02051 90                             nop        
02052 90                             nop        
02053 90                             nop        
02054 c5f877                         vzeroupper 
02057 e88401aeff                     call       0x7efc7b6cda60
0205c 0f1f840054210015               nop        dword ptr [rax + rax + 0x15002154]
02064 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0206e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02072 e8e97bcb17                     call       0x7efc938a54e0
02077 f4                             hlt        
02078 bee4ffffff                     mov        esi, 0xffffffe4
0207d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02082 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0208a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0208f 4489542404                     mov        dword ptr [rsp + 4], r10d
02094 48ff742420                     push       qword ptr [rsp + 0x20]
02099 488f442418                     pop        qword ptr [rsp + 0x18]
0209e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
020a2 4489742448                     mov        dword ptr [rsp + 0x48], r14d
020a7 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
020ac 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
020b1 90                             nop        
020b2 90                             nop        
020b3 90                             nop        
020b4 c5f877                         vzeroupper 
020b7 e82401aeff                     call       0x7efc7b6cda60
020bc 0f1f8400b4210016               nop        dword ptr [rax + rax + 0x160021b4]
020c4 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
020ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
020d2 e8897bcb17                     call       0x7efc938a54e0
020d7 f4                             hlt        
020d8 bee4ffffff                     mov        esi, 0xffffffe4
020dd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
020e2 448b1424                       mov        r10d, dword ptr [rsp]
020e6 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
020ee 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020f3 4c891424                       mov        qword ptr [rsp], r10
020f7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020fc 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02104 48ff742420                     push       qword ptr [rsp + 0x20]
02109 488f442410                     pop        qword ptr [rsp + 0x10]
0210e 48ff742428                     push       qword ptr [rsp + 0x28]
02113 488f442420                     pop        qword ptr [rsp + 0x20]
02118 48ff742430                     push       qword ptr [rsp + 0x30]
0211d 488f442428                     pop        qword ptr [rsp + 0x28]
02122 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02126 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0212b 4489742448                     mov        dword ptr [rsp + 0x48], r14d
02130 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02135 90                             nop        
02136 90                             nop        
02137 90                             nop        
02138 c5f877                         vzeroupper 
0213b e8a000aeff                     call       0x7efc7b6cda60
02140 0f1f840038220017               nop        dword ptr [rax + rax + 0x17002238]
02148 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02152 4883e4f0                       and        rsp, 0xfffffffffffffff0
02156 e8057bcb17                     call       0x7efc938a54e0
0215b f4                             hlt        
0215c bee4ffffff                     mov        esi, 0xffffffe4
02161 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02166 448b1c24                       mov        r11d, dword ptr [rsp]
0216a 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02172 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02177 4c891424                       mov        qword ptr [rsp], r10
0217b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02180 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02188 48ff742420                     push       qword ptr [rsp + 0x20]
0218d 488f442410                     pop        qword ptr [rsp + 0x10]
02192 48ff742428                     push       qword ptr [rsp + 0x28]
02197 488f442420                     pop        qword ptr [rsp + 0x20]
0219c 48ff742430                     push       qword ptr [rsp + 0x30]
021a1 488f442428                     pop        qword ptr [rsp + 0x28]
021a6 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
021aa 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
021af 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
021b4 4489742454                     mov        dword ptr [rsp + 0x54], r14d
021b9 90                             nop        
021ba 90                             nop        
021bb 90                             nop        
021bc c5f877                         vzeroupper 
021bf e81c00aeff                     call       0x7efc7b6cda60
021c4 0f1f8400bc220018               nop        dword ptr [rax + rax + 0x180022bc]
021cc 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
021d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
021da e8817acb17                     call       0x7efc938a54e0
021df f4                             hlt        
021e0 bee4ffffff                     mov        esi, 0xffffffe4
021e5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021ea 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
021f2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
021f7 44895c2404                     mov        dword ptr [rsp + 4], r11d
021fc 48ff742420                     push       qword ptr [rsp + 0x20]
02201 488f442418                     pop        qword ptr [rsp + 0x18]
02206 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0220a 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
0220f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02214 c5f877                         vzeroupper 
02217 e8c4ffadff                     call       0x7efc7b6cda60
0221c 0f1f840014230019               nop        dword ptr [rax + rax + 0x19002314]
02224 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0222e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02232 e8297acb17                     call       0x7efc938a54e0
02237 f4                             hlt        
02238 beccffffff                     mov        esi, 0xffffffcc
0223d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02242 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0224a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0224f 4489542404                     mov        dword ptr [rsp + 4], r10d
02254 48ff742420                     push       qword ptr [rsp + 0x20]
02259 488f442418                     pop        qword ptr [rsp + 0x18]
0225e 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02262 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02267 90                             nop        
02268 c5f877                         vzeroupper 
0226b e870ffadff                     call       0x7efc7b6cda60
02270 0f1f84006823001a               nop        dword ptr [rax + rax + 0x1a002368]
02278 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02282 4883e4f0                       and        rsp, 0xfffffffffffffff0
02286 e8d579cb17                     call       0x7efc938a54e0
0228b f4                             hlt        
0228c be6effffff                     mov        esi, 0xffffff6e
02291 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02296 448b1c24                       mov        r11d, dword ptr [rsp]
0229a 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
022a2 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
022a7 4c891c24                       mov        qword ptr [rsp], r11
022ab 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
022b0 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
022b8 8944240c                       mov        dword ptr [rsp + 0xc], eax
022bc 4489542410                     mov        dword ptr [rsp + 0x10], r10d
022c1 48ff742420                     push       qword ptr [rsp + 0x20]
022c6 488f442418                     pop        qword ptr [rsp + 0x18]
022cb 48894424f8                     mov        qword ptr [rsp - 8], rax
022d0 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
022d4 89442414                       mov        dword ptr [rsp + 0x14], eax
022d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022dd 48ff742428                     push       qword ptr [rsp + 0x28]
022e2 488f442420                     pop        qword ptr [rsp + 0x20]
022e7 48ff742430                     push       qword ptr [rsp + 0x30]
022ec 488f442428                     pop        qword ptr [rsp + 0x28]
022f1 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
022f5 4489742440                     mov        dword ptr [rsp + 0x40], r14d
022fa 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
022ff 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02304 c5f877                         vzeroupper 
02307 e8d4feadff                     call       0x7efc7b6cda60
0230c 0f1f84000424001b               nop        dword ptr [rax + rax + 0x1b002404]
02314 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0231e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02322 e83979cb17                     call       0x7efc938a54e0
02327 f4                             hlt        
02328 be45ffffff                     mov        esi, 0xffffff45
0232d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02332 448b1c24                       mov        r11d, dword ptr [rsp]
02336 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0233e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02343 4c891c24                       mov        qword ptr [rsp], r11
02347 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0234c 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02354 8944240c                       mov        dword ptr [rsp + 0xc], eax
02358 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0235d 48ff742420                     push       qword ptr [rsp + 0x20]
02362 488f442418                     pop        qword ptr [rsp + 0x18]
02367 48894424f8                     mov        qword ptr [rsp - 8], rax
0236c 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02370 89442414                       mov        dword ptr [rsp + 0x14], eax
02374 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02379 48ff742428                     push       qword ptr [rsp + 0x28]
0237e 488f442420                     pop        qword ptr [rsp + 0x20]
02383 48ff742430                     push       qword ptr [rsp + 0x30]
02388 488f442428                     pop        qword ptr [rsp + 0x28]
0238d 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02391 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02396 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0239b 90                             nop        
0239c c5f877                         vzeroupper 
0239f e83cfeadff                     call       0x7efc7b6cda60
023a4 0f1f84009c24001c               nop        dword ptr [rax + rax + 0x1c00249c]
023ac 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
023b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023ba e8a178cb17                     call       0x7efc938a54e0
023bf f4                             hlt        
023c0 be3dffffff                     mov        esi, 0xffffff3d
023c5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
023ca 448b0424                       mov        r8d, dword ptr [rsp]
023ce 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
023d6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
023db 4c891c24                       mov        qword ptr [rsp], r11
023df 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
023e4 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
023ec 8944240c                       mov        dword ptr [rsp + 0xc], eax
023f0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
023f5 48ff742420                     push       qword ptr [rsp + 0x20]
023fa 488f442418                     pop        qword ptr [rsp + 0x18]
023ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02404 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02408 89442414                       mov        dword ptr [rsp + 0x14], eax
0240c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02411 48ff742428                     push       qword ptr [rsp + 0x28]
02416 488f442420                     pop        qword ptr [rsp + 0x20]
0241b 48ff742430                     push       qword ptr [rsp + 0x30]
02420 488f442428                     pop        qword ptr [rsp + 0x28]
02425 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02429 4489742440                     mov        dword ptr [rsp + 0x40], r14d
0242e 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02433 90                             nop        
02434 c5f877                         vzeroupper 
02437 e8a4fdadff                     call       0x7efc7b6cda60
0243c 0f1f84003425001d               nop        dword ptr [rax + rax + 0x1d002534]
02444 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0244e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02452 e80978cb17                     call       0x7efc938a54e0
02457 f4                             hlt        
02458 bee4ffffff                     mov        esi, 0xffffffe4
0245d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02462 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0246a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0246f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02474 48ff742420                     push       qword ptr [rsp + 0x20]
02479 488f442418                     pop        qword ptr [rsp + 0x18]
0247e 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02482 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02487 90                             nop        
02488 c5f877                         vzeroupper 
0248b e850fdadff                     call       0x7efc7b6cda60
02490 0f1f84008825001e               nop        dword ptr [rax + rax + 0x1e002588]
02498 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
024a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024a6 e8b577cb17                     call       0x7efc938a54e0
024ab f4                             hlt        
024ac bee4ffffff                     mov        esi, 0xffffffe4
024b1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
024b6 4489542404                     mov        dword ptr [rsp + 4], r10d
024bb 48ff742420                     push       qword ptr [rsp + 0x20]
024c0 488f442418                     pop        qword ptr [rsp + 0x18]
024c5 895c2440                       mov        dword ptr [rsp + 0x40], ebx
024c9 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
024ce 90                             nop        
024cf 90                             nop        
024d0 c5f877                         vzeroupper 
024d3 e808fdadff                     call       0x7efc7b6cda60
024d8 0f1f8400d025001f               nop        dword ptr [rax + rax + 0x1f0025d0]
024e0 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
024ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
024ee e86d77cb17                     call       0x7efc938a54e0
024f3 f4                             hlt        
024f4 beccffffff                     mov        esi, 0xffffffcc
024f9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
024fe 448b1424                       mov        r10d, dword ptr [rsp]
02502 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0250a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0250f 4c891424                       mov        qword ptr [rsp], r10
02513 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02518 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02520 48ff742420                     push       qword ptr [rsp + 0x20]
02525 488f442410                     pop        qword ptr [rsp + 0x10]
0252a 48ff742428                     push       qword ptr [rsp + 0x28]
0252f 488f442420                     pop        qword ptr [rsp + 0x20]
02534 48ff742430                     push       qword ptr [rsp + 0x30]
02539 488f442428                     pop        qword ptr [rsp + 0x28]
0253e 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02543 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
02548 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0254c 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02551 90                             nop        
02552 90                             nop        
02553 90                             nop        
02554 c5f877                         vzeroupper 
02557 e884fcadff                     call       0x7efc7b6cda60
0255c 0f1f840054260020               nop        dword ptr [rax + rax + 0x20002654]
02564 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0256e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02572 e8e976cb17                     call       0x7efc938a54e0
02577 f4                             hlt        
02578 be17000000                     mov        esi, 0x17
0257d 90                             nop        
0257e 90                             nop        
0257f 90                             nop        
02580 c5f877                         vzeroupper 
02583 e858fcadff                     call       0x7efc7b6cda60
02588 0f1f840080260021               nop        dword ptr [rax + rax + 0x21002680]
02590 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0259a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0259e e8bd76cb17                     call       0x7efc938a54e0
025a3 f4                             hlt        
025a4 be6effffff                     mov        esi, 0xffffff6e
025a9 4489742410                     mov        dword ptr [rsp + 0x10], r14d
025ae 89442414                       mov        dword ptr [rsp + 0x14], eax
025b2 4c89442418                     mov        qword ptr [rsp + 0x18], r8
025b7 895c2420                       mov        dword ptr [rsp + 0x20], ebx
025bb 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
025c0 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
025c5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
025ca 90                             nop        
025cb 90                             nop        
025cc c5f877                         vzeroupper 
025cf e80cfcadff                     call       0x7efc7b6cda60
025d4 0f1f8400cc260022               nop        dword ptr [rax + rax + 0x220026cc]
025dc 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
025e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
025ea e87176cb17                     call       0x7efc938a54e0
025ef f4                             hlt        
025f0 bebeffffff                     mov        esi, 0xffffffbe
025f5 4489742410                     mov        dword ptr [rsp + 0x10], r14d
025fa 89442414                       mov        dword ptr [rsp + 0x14], eax
025fe 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02603 895c2420                       mov        dword ptr [rsp + 0x20], ebx
02607 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0260c 48894c2430                     mov        qword ptr [rsp + 0x30], rcx
02611 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02616 90                             nop        
02617 90                             nop        
02618 c5f877                         vzeroupper 
0261b e8c0fbadff                     call       0x7efc7b6cda60
02620 0f1f840018270023               nop        dword ptr [rax + rax + 0x23002718]
02628 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02632 4883e4f0                       and        rsp, 0xfffffffffffffff0
02636 e82576cb17                     call       0x7efc938a54e0
0263b f4                             hlt        
0263c 4c8b6c2478                     mov        r13, qword ptr [rsp + 0x78]
02641 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02646 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
0264e 448b8c24a8000000               mov        r9d, dword ptr [rsp + 0xa8]
02656 beccffffff                     mov        esi, 0xffffffcc
0265b 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
02663 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0266b 44893424                       mov        dword ptr [rsp], r14d
0266f 44894c2404                     mov        dword ptr [rsp + 4], r9d
02674 4c896c2408                     mov        qword ptr [rsp + 8], r13
02679 90                             nop        
0267a 90                             nop        
0267b 90                             nop        
0267c c5f877                         vzeroupper 
0267f e85cfbadff                     call       0x7efc7b6cda60
02684 0f1f84007c270024               nop        dword ptr [rax + rax + 0x2400277c]
0268c 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02696 4883e4f0                       and        rsp, 0xfffffffffffffff0
0269a e8c175cb17                     call       0x7efc938a54e0
0269f f4                             hlt        
026a0 bee4ffffff                     mov        esi, 0xffffffe4
026a5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
026aa 448b0424                       mov        r8d, dword ptr [rsp]
026ae 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
026b6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
026bb 4c891c24                       mov        qword ptr [rsp], r11
026bf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
026c4 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
026cc 48ff742420                     push       qword ptr [rsp + 0x20]
026d1 488f442410                     pop        qword ptr [rsp + 0x10]
026d6 48ff742428                     push       qword ptr [rsp + 0x28]
026db 488f442420                     pop        qword ptr [rsp + 0x20]
026e0 48ff742430                     push       qword ptr [rsp + 0x30]
026e5 488f442428                     pop        qword ptr [rsp + 0x28]
026ea 895c2438                       mov        dword ptr [rsp + 0x38], ebx
026ee 48894424f8                     mov        qword ptr [rsp - 8], rax
026f3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
026f7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
026fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02700 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02705 48894424f8                     mov        qword ptr [rsp - 8], rax
0270a 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0270e 89442444                       mov        dword ptr [rsp + 0x44], eax
02712 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02717 89442448                       mov        dword ptr [rsp + 0x48], eax
0271b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02720 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02725 90                             nop        
02726 90                             nop        
02727 90                             nop        
02728 c5f877                         vzeroupper 
0272b e8b0faadff                     call       0x7efc7b6cda60
02730 0f1f840028280025               nop        dword ptr [rax + rax + 0x25002828]
02738 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02742 4883e4f0                       and        rsp, 0xfffffffffffffff0
02746 e81575cb17                     call       0x7efc938a54e0
0274b f4                             hlt        
0274c c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02752 bee4ffffff                     mov        esi, 0xffffffe4
02757 498beb                         mov        rbp, r11
0275a 448b1c24                       mov        r11d, dword ptr [rsp]
0275e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02766 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0276b 4c891c24                       mov        qword ptr [rsp], r11
0276f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02774 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0277c 48ff742420                     push       qword ptr [rsp + 0x20]
02781 488f442410                     pop        qword ptr [rsp + 0x10]
02786 48ff742428                     push       qword ptr [rsp + 0x28]
0278b 488f442420                     pop        qword ptr [rsp + 0x20]
02790 48ff742430                     push       qword ptr [rsp + 0x30]
02795 488f442428                     pop        qword ptr [rsp + 0x28]
0279a 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0279e 48894424f8                     mov        qword ptr [rsp - 8], rax
027a3 8b442448                       mov        eax, dword ptr [rsp + 0x48]
027a7 8944243c                       mov        dword ptr [rsp + 0x3c], eax
027ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b0 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
027b5 48894424f8                     mov        qword ptr [rsp - 8], rax
027ba 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
027be 89442444                       mov        dword ptr [rsp + 0x44], eax
027c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
027cc 89442454                       mov        dword ptr [rsp + 0x54], eax
027d0 c5f877                         vzeroupper 
027d3 e808faadff                     call       0x7efc7b6cda60
027d8 0f1f8400d0280026               nop        dword ptr [rax + rax + 0x260028d0]
027e0 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
027ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
027ee e86d74cb17                     call       0x7efc938a54e0
027f3 f4                             hlt        
027f4 beccffffff                     mov        esi, 0xffffffcc
027f9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
027fe 448b0424                       mov        r8d, dword ptr [rsp]
02802 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0280a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0280f 4c891c24                       mov        qword ptr [rsp], r11
02813 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02818 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02820 48ff742420                     push       qword ptr [rsp + 0x20]
02825 488f442418                     pop        qword ptr [rsp + 0x18]
0282a 48ff742428                     push       qword ptr [rsp + 0x28]
0282f 488f442420                     pop        qword ptr [rsp + 0x20]
02834 48ff742430                     push       qword ptr [rsp + 0x30]
02839 488f442428                     pop        qword ptr [rsp + 0x28]
0283e 48894424f8                     mov        qword ptr [rsp - 8], rax
02843 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02847 89442440                       mov        dword ptr [rsp + 0x40], eax
0284b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02850 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
02855 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0285a 89442458                       mov        dword ptr [rsp + 0x58], eax
0285e 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02862 90                             nop        
02863 90                             nop        
02864 c5f877                         vzeroupper 
02867 e874f9adff                     call       0x7efc7b6cda60
0286c 0f1f840064290027               nop        dword ptr [rax + rax + 0x27002964]
02874 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0287e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02882 e8d973cb17                     call       0x7efc938a54e0
02887 f4                             hlt        
02888 418bea                         mov        ebp, r10d
0288b 83c510                         add        ebp, 0x10
0288e be6effffff                     mov        esi, 0xffffff6e
02893 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02898 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
028a0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
028a5 44895c2404                     mov        dword ptr [rsp + 4], r11d
028aa 4489542414                     mov        dword ptr [rsp + 0x14], r10d
028af 48ff742420                     push       qword ptr [rsp + 0x20]
028b4 488f442418                     pop        qword ptr [rsp + 0x18]
028b9 895c2440                       mov        dword ptr [rsp + 0x40], ebx
028bd 48894424f8                     mov        qword ptr [rsp - 8], rax
028c2 8b442448                       mov        eax, dword ptr [rsp + 0x48]
028c6 89442444                       mov        dword ptr [rsp + 0x44], eax
028ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028cf 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
028d4 c5f877                         vzeroupper 
028d7 e804f9adff                     call       0x7efc7b6cda60
028dc 0f1f8400d4290028               nop        dword ptr [rax + rax + 0x280029d4]
028e4 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
028ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
028f2 e86973cb17                     call       0x7efc938a54e0
028f7 f4                             hlt        
028f8 418bea                         mov        ebp, r10d
028fb 83c510                         add        ebp, 0x10
028fe be66ffffff                     mov        esi, 0xffffff66
02903 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02908 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02910 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02915 4489442404                     mov        dword ptr [rsp + 4], r8d
0291a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0291f 48ff742420                     push       qword ptr [rsp + 0x20]
02924 488f442418                     pop        qword ptr [rsp + 0x18]
02929 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0292d 48894424f8                     mov        qword ptr [rsp - 8], rax
02932 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02936 89442444                       mov        dword ptr [rsp + 0x44], eax
0293a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0293f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02944 c5f877                         vzeroupper 
02947 e894f8adff                     call       0x7efc7b6cda60
0294c 0f1f8400442a0029               nop        dword ptr [rax + rax + 0x29002a44]
02954 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
0295e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02962 e8f972cb17                     call       0x7efc938a54e0
02967 f4                             hlt        
02968 bee4ffffff                     mov        esi, 0xffffffe4
0296d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02972 448b1c24                       mov        r11d, dword ptr [rsp]
02976 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0297e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02983 4c891424                       mov        qword ptr [rsp], r10
02987 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0298c 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02994 48ff742420                     push       qword ptr [rsp + 0x20]
02999 488f442410                     pop        qword ptr [rsp + 0x10]
0299e 48ff742428                     push       qword ptr [rsp + 0x28]
029a3 488f442420                     pop        qword ptr [rsp + 0x20]
029a8 48ff742430                     push       qword ptr [rsp + 0x30]
029ad 488f442428                     pop        qword ptr [rsp + 0x28]
029b2 895c2448                       mov        dword ptr [rsp + 0x48], ebx
029b6 4489742450                     mov        dword ptr [rsp + 0x50], r14d
029bb 90                             nop        
029bc c5f877                         vzeroupper 
029bf e81cf8adff                     call       0x7efc7b6cda60
029c4 0f1f8400bc2a002a               nop        dword ptr [rax + rax + 0x2a002abc]
029cc 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
029d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
029da e88172cb17                     call       0x7efc938a54e0
029df f4                             hlt        
029e0 bee4ffffff                     mov        esi, 0xffffffe4
029e5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
029ea 448b1424                       mov        r10d, dword ptr [rsp]
029ee 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
029f6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
029fb 4c891424                       mov        qword ptr [rsp], r10
029ff 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02a04 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02a0c 48ff742420                     push       qword ptr [rsp + 0x20]
02a11 488f442410                     pop        qword ptr [rsp + 0x10]
02a16 48ff742428                     push       qword ptr [rsp + 0x28]
02a1b 488f442420                     pop        qword ptr [rsp + 0x20]
02a20 48ff742430                     push       qword ptr [rsp + 0x30]
02a25 488f442428                     pop        qword ptr [rsp + 0x28]
02a2a 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02a2e 90                             nop        
02a2f 90                             nop        
02a30 c5f877                         vzeroupper 
02a33 e8a8f7adff                     call       0x7efc7b6cda60
02a38 0f1f8400302b002b               nop        dword ptr [rax + rax + 0x2b002b30]
02a40 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02a4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a4e e80d72cb17                     call       0x7efc938a54e0
02a53 f4                             hlt        
02a54 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
02a59 458d5308                       lea        r10d, [r11 + 8]
02a5d 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02a62 be6effffff                     mov        esi, 0xffffff6e
02a67 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02a6c 448b1424                       mov        r10d, dword ptr [rsp]
02a70 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02a78 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02a7d 4c891424                       mov        qword ptr [rsp], r10
02a81 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02a86 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02a8e 48ff742420                     push       qword ptr [rsp + 0x20]
02a93 488f442410                     pop        qword ptr [rsp + 0x10]
02a98 48ff742428                     push       qword ptr [rsp + 0x28]
02a9d 488f442420                     pop        qword ptr [rsp + 0x20]
02aa2 48ff742430                     push       qword ptr [rsp + 0x30]
02aa7 488f442428                     pop        qword ptr [rsp + 0x28]
02aac 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab1 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02ab8 89442438                       mov        dword ptr [rsp + 0x38], eax
02abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac1 90                             nop        
02ac2 90                             nop        
02ac3 90                             nop        
02ac4 c5f877                         vzeroupper 
02ac7 e814f7adff                     call       0x7efc7b6cda60
02acc 0f1f8400c42b002c               nop        dword ptr [rax + rax + 0x2c002bc4]
02ad4 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02ade 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ae2 e87971cb17                     call       0x7efc938a54e0
02ae7 f4                             hlt        
02ae8 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
02aed 458d5308                       lea        r10d, [r11 + 8]
02af1 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02af6 be66ffffff                     mov        esi, 0xffffff66
02afb 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02b00 448b1c24                       mov        r11d, dword ptr [rsp]
02b04 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02b0c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02b11 4c891424                       mov        qword ptr [rsp], r10
02b15 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02b1a 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02b22 48ff742420                     push       qword ptr [rsp + 0x20]
02b27 488f442410                     pop        qword ptr [rsp + 0x10]
02b2c 48ff742428                     push       qword ptr [rsp + 0x28]
02b31 488f442420                     pop        qword ptr [rsp + 0x20]
02b36 48ff742430                     push       qword ptr [rsp + 0x30]
02b3b 488f442428                     pop        qword ptr [rsp + 0x28]
02b40 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02b45 90                             nop        
02b46 90                             nop        
02b47 90                             nop        
02b48 c5f877                         vzeroupper 
02b4b e890f6adff                     call       0x7efc7b6cda60
02b50 0f1f8400482c002d               nop        dword ptr [rax + rax + 0x2d002c48]
02b58 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02b62 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b66 e8f570cb17                     call       0x7efc938a54e0
02b6b f4                             hlt        
02b6c 448bcf                         mov        r9d, edi
02b6f e961e5ffff                     jmp        0x7efc7bbec955
02b74 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02b7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b82 e8d970cb17                     call       0x7efc938a54e0
02b87 f4                             hlt        
02b88 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02b92 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b96 e8c570cb17                     call       0x7efc938a54e0
02b9b f4                             hlt        
02b9c 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02ba6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02baa e8b170cb17                     call       0x7efc938a54e0
02baf f4                             hlt        
02bb0 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bbe e89d70cb17                     call       0x7efc938a54e0
02bc3 f4                             hlt        
02bc4 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02bce 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bd2 e88970cb17                     call       0x7efc938a54e0
02bd7 f4                             hlt        
02bd8 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02be6 e87570cb17                     call       0x7efc938a54e0
02beb f4                             hlt        
02bec 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bfa e86170cb17                     call       0x7efc938a54e0
02bff f4                             hlt        
02c00 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c0e e84d70cb17                     call       0x7efc938a54e0
02c13 f4                             hlt        
02c14 bee4ffffff                     mov        esi, 0xffffffe4
02c19 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02c1e 448b1c24                       mov        r11d, dword ptr [rsp]
02c22 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02c2a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02c2f 4c891424                       mov        qword ptr [rsp], r10
02c33 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02c38 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02c40 48ff742420                     push       qword ptr [rsp + 0x20]
02c45 488f442410                     pop        qword ptr [rsp + 0x10]
02c4a 48ff742428                     push       qword ptr [rsp + 0x28]
02c4f 488f442420                     pop        qword ptr [rsp + 0x20]
02c54 48ff742430                     push       qword ptr [rsp + 0x30]
02c59 488f442428                     pop        qword ptr [rsp + 0x28]
02c5e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02c62 4489742448                     mov        dword ptr [rsp + 0x48], r14d
02c67 90                             nop        
02c68 c5f877                         vzeroupper 
02c6b e870f5adff                     call       0x7efc7b6cda60
02c70 0f1f8400682d002e               nop        dword ptr [rax + rax + 0x2e002d68]
02c78 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02c82 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c86 e8d56fcb17                     call       0x7efc938a54e0
02c8b f4                             hlt        
02c8c c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02c92 bee4ffffff                     mov        esi, 0xffffffe4
02c97 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02c9c 448b1424                       mov        r10d, dword ptr [rsp]
02ca0 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02ca8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02cad 4c891424                       mov        qword ptr [rsp], r10
02cb1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02cb6 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02cbe 48ff742420                     push       qword ptr [rsp + 0x20]
02cc3 488f442410                     pop        qword ptr [rsp + 0x10]
02cc8 48ff742428                     push       qword ptr [rsp + 0x28]
02ccd 488f442420                     pop        qword ptr [rsp + 0x20]
02cd2 48ff742430                     push       qword ptr [rsp + 0x30]
02cd7 488f442428                     pop        qword ptr [rsp + 0x28]
02cdc 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02ce1 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02ce5 90                             nop        
02ce6 90                             nop        
02ce7 90                             nop        
02ce8 c5f877                         vzeroupper 
02ceb e8f0f4adff                     call       0x7efc7b6cda60
02cf0 0f1f8400e82d002f               nop        dword ptr [rax + rax + 0x2f002de8]
02cf8 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02d02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d06 e8556fcb17                     call       0x7efc938a54e0
02d0b f4                             hlt        
02d0c 4183c610                       add        r14d, 0x10
02d10 be6effffff                     mov        esi, 0xffffff6e
02d15 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02d1a 4489542404                     mov        dword ptr [rsp + 4], r10d
02d1f 48ff742420                     push       qword ptr [rsp + 0x20]
02d24 488f442418                     pop        qword ptr [rsp + 0x18]
02d29 48894424f8                     mov        qword ptr [rsp - 8], rax
02d2e 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02d35 89442440                       mov        dword ptr [rsp + 0x40], eax
02d39 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d3e 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02d43 90                             nop        
02d44 c5f877                         vzeroupper 
02d47 e894f4adff                     call       0x7efc7b6cda60
02d4c 0f1f8400442e0030               nop        dword ptr [rax + rax + 0x30002e44]
02d54 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d62 e8f96ecb17                     call       0x7efc938a54e0
02d67 f4                             hlt        
02d68 4183c610                       add        r14d, 0x10
02d6c be66ffffff                     mov        esi, 0xffffff66
02d71 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02d76 4489542404                     mov        dword ptr [rsp + 4], r10d
02d7b 48ff742420                     push       qword ptr [rsp + 0x20]
02d80 488f442418                     pop        qword ptr [rsp + 0x18]
02d85 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02d8a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
02d8f 90                             nop        
02d90 c5f877                         vzeroupper 
02d93 e848f4adff                     call       0x7efc7b6cda60
02d98 0f1f8400902e0031               nop        dword ptr [rax + rax + 0x31002e90]
02da0 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02daa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dae e8ad6ecb17                     call       0x7efc938a54e0
02db3 f4                             hlt        
02db4 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02dbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dc2 e8996ecb17                     call       0x7efc938a54e0
02dc7 f4                             hlt        
02dc8 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dd6 e8856ecb17                     call       0x7efc938a54e0
02ddb f4                             hlt        
02ddc 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02de6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dea e8716ecb17                     call       0x7efc938a54e0
02def f4                             hlt        
02df0 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02dfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dfe e85d6ecb17                     call       0x7efc938a54e0
02e03 f4                             hlt        
02e04 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e12 e8496ecb17                     call       0x7efc938a54e0
02e17 f4                             hlt        
02e18 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e22 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e26 e8356ecb17                     call       0x7efc938a54e0
02e2b f4                             hlt        
02e2c 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e3a e8216ecb17                     call       0x7efc938a54e0
02e3f f4                             hlt        
02e40 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e4e e80d6ecb17                     call       0x7efc938a54e0
02e53 f4                             hlt        
02e54 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e62 e8f96dcb17                     call       0x7efc938a54e0
02e67 f4                             hlt        
02e68 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e72 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e76 e8e56dcb17                     call       0x7efc938a54e0
02e7b f4                             hlt        
02e7c 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e8a e8d16dcb17                     call       0x7efc938a54e0
02e8f f4                             hlt        
02e90 48bf10ee4554fc7e0000           movabs     rdi, 0x7efc5445ee10
02e9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e9e e8bd6dcb17                     call       0x7efc938a54e0
02ea3 f4                             hlt        
02ea4 bef6ffffff                     mov        esi, 0xfffffff6
02ea9 488bea                         mov        rbp, rdx
02eac 898424e0000000                 mov        dword ptr [rsp + 0xe0], eax
02eb3 90                             nop        
02eb4 c5f877                         vzeroupper 
02eb7 e824f3adff                     call       0x7efc7b6cda60
02ebc 0f1f8400b42f0032               nop        dword ptr [rax + rax + 0x32002fb4]
02ec4 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02ece 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ed2 e8896dcb17                     call       0x7efc938a54e0
02ed7 f4                             hlt        
02ed8 bef6ffffff                     mov        esi, 0xfffffff6
02edd 90                             nop        
02ede 90                             nop        
02edf 90                             nop        
02ee0 c5f877                         vzeroupper 
02ee3 e8f8f2adff                     call       0x7efc7b6cda60
02ee8 0f1f8400e02f0033               nop        dword ptr [rax + rax + 0x33002fe0]
02ef0 48bf40e8b954fc7e0000           movabs     rdi, 0x7efc54b9e840
02efa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02efe e85d6dcb17                     call       0x7efc938a54e0
02f03 f4                             hlt        
02f04 49ba77c5be7bfc7e0000           movabs     r10, 0x7efc7bbec577
02f0e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02f15 e9c63bb4ff                     jmp        0x7efc7b732360
02f1a e8410ab3ff                     call       0x7efc7b71f1e0
02f1f e91ad1ffff                     jmp        0x7efc7bbeb8be
02f24 f4                             hlt        
02f25 f4                             hlt        
02f26 f4                             hlt        
02f27 f4                             hlt        
