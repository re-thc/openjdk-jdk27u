00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854026a8ff                   jne        0x7f05378fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85e32f0000                   jne        0x7f0537e7b321
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00047 498bd8                         mov        rbx, r8
0004a 448bdf                         mov        r11d, edi
0004d 4c8bf6                         mov        r14, rsi
00050 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00054 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00059 448b5604                       mov        r10d, dword ptr [rsi + 4]
0005d 458bca                         mov        r9d, r10d
00060 452bc8                         sub        r9d, r8d
00063 448b8424f0000000               mov        r8d, dword ptr [rsp + 0xf0]
0006b 453bc1                         cmp        r8d, r9d
0006e 0f8f04290000                   jg         0x7f0537e7ac78
00074 4c8b4e08                       mov        r9, qword ptr [rsi + 8]
00078 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0007d 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00081 48638c24f0000000               movsxd     rcx, dword ptr [rsp + 0xf0]
00089 48637c2464                     movsxd     rdi, dword ptr [rsp + 0x64]
0008e 48037c2428                     add        rdi, qword ptr [rsp + 0x28]
00093 4c2bcf                         sub        r9, rdi
00096 493bc9                         cmp        rcx, r9
00099 0f8fd9280000                   jg         0x7f0537e7ac78
0009f 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a3 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a8 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ac 4d85c0                         test       r8, r8
000af 0f8448130000                   je         0x7f0537e796fd
000b5 33ff                           xor        edi, edi
000b7 4c8bea                         mov        r13, rdx
000ba 8b7204                         mov        esi, dword ptr [rdx + 4]
000bd 458b4e40                       mov        r9d, dword ptr [r14 + 0x40]
000c1 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
000c9 418beb                         mov        ebp, r11d
000cc 4585db                         test       r11d, r11d
000cf 0f8e9f220000                   jle        0x7f0537e7a674
000d5 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000da 448d4ee0                       lea        r9d, [rsi - 0x20]
000de 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e6 418d4ae0                       lea        ecx, [r10 - 0x20]
000ea 4c8bdb                         mov        r11, rbx
000ed 458b5304                       mov        r10d, dword ptr [r11 + 4]
000f1 4585d2                         test       r10d, r10d
000f4 0f8696280000                   jbe        0x7f0537e7ac90
000fa 4d63d2                         movsxd     r10, r10d
000fd 4863dd                         movsxd     rbx, ebp
00100 48ffcb                         dec        rbx
00103 493bda                         cmp        rbx, r10
00106 0f8384280000                   jae        0x7f0537e7ac90
0010c 488b9424f8000000               mov        rdx, qword ptr [rsp + 0xf8]
00114 8b5a04                         mov        ebx, dword ptr [rdx + 4]
00117 85db                           test       ebx, ebx
00119 0f86c1280000                   jbe        0x7f0537e7ace0
0011f 83fb01                         cmp        ebx, 1
00122 0f86b8280000                   jbe        0x7f0537e7ace0
00128 83fb02                         cmp        ebx, 2
0012b 0f86af280000                   jbe        0x7f0537e7ace0
00131 448d56f1                       lea        r10d, [rsi - 0xf]
00135 4585d2                         test       r10d, r10d
00138 0f8ca2280000                   jl         0x7f0537e7ace0
0013e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00146 418b4204                       mov        eax, dword ptr [r10 + 4]
0014a 448d50f1                       lea        r10d, [rax - 0xf]
0014e 4585d2                         test       r10d, r10d
00151 0f8c89280000                   jl         0x7f0537e7ace0
00157 448d50fd                       lea        r10d, [rax - 3]
0015b 4585d2                         test       r10d, r10d
0015e 0f8c7c280000                   jl         0x7f0537e7ace0
00164 448d50f9                       lea        r10d, [rax - 7]
00168 4585d2                         test       r10d, r10d
0016b 0f8c6f280000                   jl         0x7f0537e7ace0
00171 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00175 899c24fc000000                 mov        dword ptr [rsp + 0xfc], ebx
0017c 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00180 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00185 89b424f8000000                 mov        dword ptr [rsp + 0xf8], esi
0018c 897c2430                       mov        dword ptr [rsp + 0x30], edi
00190 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00195 4889542450                     mov        qword ptr [rsp + 0x50], rdx
0019a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0019f 896c2418                       mov        dword ptr [rsp + 0x18], ebp
001a3 4c896c2468                     mov        qword ptr [rsp + 0x68], r13
001a8 4c89742478                     mov        qword ptr [rsp + 0x78], r14
001ad 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
001b5 4d8bd3                         mov        r10, r11
001b8 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001bd 448bd0                         mov        r10d, eax
001c0 448bde                         mov        r11d, esi
001c3 458d4afd                       lea        r9d, [r10 - 3]
001c7 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
001cf 4d63c3                         movsxd     r8, r11d
001d2 4183c3f1                       add        r11d, -0xf
001d6 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
001de 4983c0f1                       add        r8, -0xf
001e2 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
001ea 4d63c2                         movsxd     r8, r10d
001ed 458d5af9                       lea        r11d, [r10 - 7]
001f1 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
001f9 4183c2f1                       add        r10d, -0xf
001fd 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00205 4d8d50f1                       lea        r10, [r8 - 0xf]
00209 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
00211 4983c0f9                       add        r8, -7
00215 4c898424a8000000               mov        qword ptr [rsp + 0xa8], r8
0021d 4533c9                         xor        r9d, r9d
00220 4533c0                         xor        r8d, r8d
00223 e97b040000                     jmp        0x7f0537e789a3
00228 448bdd                         mov        r11d, ebp
0022b 4d63d3                         movsxd     r10, r11d
0022e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00235 c442a8f5db                     bzhi       r11, r11, r10
0023a c4c1fb92fb                     kmovq      k7, r11
0023f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00245 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0024b 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00253 4403d5                         add        r10d, ebp
00256 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0025e 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00262 418502                         test       dword ptr [r10], eax
00265 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0026d 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00272 0f8ddf070000                   jge        0x7f0537e78d57
00278 4489b424b4000000               mov        dword ptr [rsp + 0xb4], r14d
00280 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00288 442b9c24b0000000               sub        r11d, dword ptr [rsp + 0xb0]
00290 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
00298 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
0029c 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
002a3 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
002aa 448bb424b0000000               mov        r14d, dword ptr [rsp + 0xb0]
002b2 410f4fee                       cmovg      ebp, r14d
002b6 458bc3                         mov        r8d, r11d
002b9 4585db                         test       r11d, r11d
002bc 0f8c221c0000                   jl         0x7f0537e7a1e4
002c2 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
002ca 4585db                         test       r11d, r11d
002cd 0f8c111c0000                   jl         0x7f0537e7a1e4
002d3 458d0c28                       lea        r9d, [r8 + rbp]
002d7 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
002dc 453bd1                         cmp        r10d, r9d
002df 0f82ff1b0000                   jb         0x7f0537e7a1e4
002e5 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
002ed 4403f5                         add        r14d, ebp
002f0 453bd6                         cmp        r10d, r14d
002f3 0f82eb1b0000                   jb         0x7f0537e7a1e4
002f9 85ed                           test       ebp, ebp
002fb 0f8ce31b0000                   jl         0x7f0537e7a1e4
00301 85ed                           test       ebp, ebp
00303 0f8442ffffff                   je         0x7f0537e7854b
00309 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00311 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00316 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
0031b 4863d5                         movsxd     rdx, ebp
0031e 4883fa20                       cmp        rdx, 0x20
00322 0f8600ffffff                   jbe        0x7f0537e78528
00328 c5f877                         vzeroupper 
0032b 49ba204f8e37057f0000           movabs     r10, 0x7f05378e4f20
00335 41ffd2                         call       r10
00338 0f1f840000000000               nop        dword ptr [rax + rax]
00340 e906ffffff                     jmp        0x7f0537e7854b
00345 458beb                         mov        r13d, r11d
00348 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00350 4585db                         test       r11d, r11d
00353 0f8eab130000                   jle        0x7f0537e79a04
00359 458d1c01                       lea        r11d, [r9 + rax]
0035d 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00362 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00367 4403db                         add        r11d, ebx
0036a 443b5c2448                     cmp        r11d, dword ptr [rsp + 0x48]
0036f 0f8fa7100000                   jg         0x7f0537e7971c
00375 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0037a 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
0037f 0f8faf140000                   jg         0x7f0537e79b34
00385 83f810                         cmp        eax, 0x10
00388 0f8f81070000                   jg         0x7f0537e78e0f
0038e 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00396 0f83f1100000                   jae        0x7f0537e7978d
0039c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
003a1 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
003a8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
003ad 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
003b5 0f8369110000                   jae        0x7f0537e79824
003bb 468d1408                       lea        r10d, [rax + r9]
003bf 4489542460                     mov        dword ptr [rsp + 0x60], r10d
003c4 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
003c9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003d1 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
003d8 468d1400                       lea        r10d, [rax + r8]
003dc 4489542464                     mov        dword ptr [rsp + 0x64], r10d
003e1 458bf2                         mov        r14d, r10d
003e4 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
003ec 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
003f0 83fb10                         cmp        ebx, 0x10
003f3 7f53                           jg         0x7f0537e78748
003f5 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003fc 83fb10                         cmp        ebx, 0x10
003ff 7c47                           jl         0x7f0537e78748
00401 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
00409 0f83cd110000                   jae        0x7f0537e798dc
0040f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00417 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
0041e 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00422 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
00429 0f8339120000                   jae        0x7f0537e79968
0042f c4c17a7f441a08                 vmovdqu    xmmword ptr [r10 + rbx + 8], xmm0
00436 448b6c245c                     mov        r13d, dword ptr [rsp + 0x5c]
0043b 4403eb                         add        r13d, ebx
0043e 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
00443 e940020000                     jmp        0x7f0537e78988
00448 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00450 4b8d7c3308                     lea        rdi, [r11 + r14 + 8]
00455 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00459 498d741b08                     lea        rsi, [r11 + rbx + 8]
0045e 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00462 035c2464                       add        ebx, dword ptr [rsp + 0x64]
00466 4c63cb                         movsxd     r9, ebx
00469 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00471 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00476 0f8c13040000                   jl         0x7f0537e78b8f
0047c 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00481 4183fa30                       cmp        r10d, 0x30
00485 0f8e90000000                   jle        0x7f0537e7881b
0048b 4585f6                         test       r14d, r14d
0048e 0f8cec170000                   jl         0x7f0537e79f80
00494 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00499 4585d2                         test       r10d, r10d
0049c 0f8cde170000                   jl         0x7f0537e79f80
004a2 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
004a7 4503c6                         add        r8d, r14d
004aa 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
004af 453bd8                         cmp        r11d, r8d
004b2 0f82c8170000                   jb         0x7f0537e79f80
004b8 443bdb                         cmp        r11d, ebx
004bb 0f82bf170000                   jb         0x7f0537e79f80
004c1 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004c5 85db                           test       ebx, ebx
004c7 0f84af010000                   je         0x7f0537e7897c
004cd 4863d3                         movsxd     rdx, ebx
004d0 4883fa20                       cmp        rdx, 0x20
004d4 7728                           ja         0x7f0537e787fe
004d6 448bd3                         mov        r10d, ebx
004d9 4d63d2                         movsxd     r10, r10d
004dc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004e3 c442a8f5db                     bzhi       r11, r11, r10
004e8 c4c1fb92fb                     kmovq      k7, r11
004ed 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004f3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004f9 e97e010000                     jmp        0x7f0537e7897c
004fe c5f877                         vzeroupper 
00501 49ba204f8e37057f0000           movabs     r10, 0x7f05378e4f20
0050b 41ffd2                         call       r10
0050e 0f1f840000000000               nop        dword ptr [rax + rax]
00516 e961010000                     jmp        0x7f0537e7897c
0051b 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00523 0f838f130000                   jae        0x7f0537e79bb8
00529 4d63d6                         movsxd     r10, r14d
0052c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00534 4f8b441308                     mov        r8, qword ptr [r11 + r10 + 8]
00539 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
0053d 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
00544 0f832a140000                   jae        0x7f0537e79c74
0054a 8d7908                         lea        edi, [rcx + 8]
0054d 4863d1                         movsxd     rdx, ecx
00550 4d89441308                     mov        qword ptr [r11 + rdx + 8], r8
00555 3bfb                           cmp        edi, ebx
00557 0f8d1f010000                   jge        0x7f0537e7897c
0055d 4c2bd2                         sub        r10, rdx
00560 4c63c7                         movsxd     r8, edi
00563 4f8d1c10                       lea        r11, [r8 + r10]
00567 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
0056f 0f83c3150000                   jae        0x7f0537e79e38
00575 4d8bd9                         mov        r11, r9
00578 4d2bd8                         sub        r11, r8
0057b 4983c307                       add        r11, 7
0057f 4983e3f8                       and        r11, 0xfffffffffffffff8
00583 458bdb                         mov        r11d, r11d
00586 458d440b08                     lea        r8d, [r11 + rcx + 8]
0058b 4d63d8                         movsxd     r11, r8d
0058e 4f8d5413f8                     lea        r10, [r11 + r10 - 8]
00593 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0059b 0f8397150000                   jae        0x7f0537e79e38
005a1 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
005a8 0f838a150000                   jae        0x7f0537e79e38
005ae 4983c3f8                       add        r11, -8
005b2 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
005ba 0f8378150000                   jae        0x7f0537e79e38
005c0 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005c6 0f8f10160000                   jg         0x7f0537e79edc
005cc 442bf1                         sub        r14d, ecx
005cf 83c110                         add        ecx, 0x10
005d2 458d143e                       lea        r10d, [r14 + rdi]
005d6 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
005de 4f8b441308                     mov        r8, qword ptr [r11 + r10 + 8]
005e3 448bd7                         mov        r10d, edi
005e6 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
005eb 83c708                         add        edi, 8
005ee 3bf9                           cmp        edi, ecx
005f0 7ce0                           jl         0x7f0537e788d2
005f2 4983c1f8                       add        r9, -8
005f6 4981f900000080                 cmp        r9, -0x80000000
005fd 49c7c200000080                 mov        r10, 0xffffffff80000000
00604 4d0f4cca                       cmovl      r9, r10
00608 458bd1                         mov        r10d, r9d
0060b 413bfa                         cmp        edi, r10d
0060e 7d3f                           jge        0x7f0537e7894f
00610 418d143e                       lea        edx, [r14 + rdi]
00614 448bdf                         mov        r11d, edi
00617 4963cb                         movsxd     rcx, r11d
0061a 448bda                         mov        r11d, edx
0061d 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00625 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
0062a 4863d2                         movsxd     rdx, edx
0062d 448bc7                         mov        r8d, edi
00630 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00638 4f895c0108                     mov        qword ptr [r9 + r8 + 8], r11
0063d 4d8b5c1110                     mov        r11, qword ptr [r9 + rdx + 0x10]
00642 4d895c0910                     mov        qword ptr [r9 + rcx + 0x10], r11
00647 83c710                         add        edi, 0x10
0064a 413bfa                         cmp        edi, r10d
0064d 7cc1                           jl         0x7f0537e78910
0064f 3bfb                           cmp        edi, ebx
00651 7d29                           jge        0x7f0537e7897c
00653 90                             nop        
00654 458d1c3e                       lea        r11d, [r14 + rdi]
00658 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00660 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
00665 448bd7                         mov        r10d, edi
00668 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00670 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
00675 83c708                         add        edi, 8
00678 3bfb                           cmp        edi, ebx
0067a 7cd8                           jl         0x7f0537e78954
0067c 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00680 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
00684 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00688 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
00690 41ffc0                         inc        r8d
00693 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00698 0f8dc4050000                   jge        0x7f0537e78f62
0069e 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
006a3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
006a8 4f8b54c208                     mov        r10, qword ptr [r10 + r8*8 + 8]
006ad 4d8bda                         mov        r11, r10
006b0 49c1eb12                       shr        r11, 0x12
006b4 418bdb                         mov        ebx, r11d
006b7 81e3ffff0300                   and        ebx, 0x3ffff
006bd 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
006c1 4d8bda                         mov        r11, r10
006c4 49c1fb24                       sar        r11, 0x24
006c8 458bd2                         mov        r10d, r10d
006cb 458bdb                         mov        r11d, r11d
006ce 418bcb                         mov        ecx, r11d
006d1 4181e2ffff0100                 and        r10d, 0x1ffff
006d8 418bc2                         mov        eax, r10d
006db 4585db                         test       r11d, r11d
006de 0f8c40100000                   jl         0x7f0537e79a24
006e4 448bd8                         mov        r11d, eax
006e7 4585db                         test       r11d, r11d
006ea 0f85b6000000                   jne        0x7f0537e78aa6
006f0 4533d2                         xor        r10d, r10d
006f3 418bc2                         mov        eax, r10d
006f6 83f903                         cmp        ecx, 3
006f9 0f8ed9000000                   jle        0x7f0537e78ad8
006ff 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00704 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00708 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0070d 45895310                       mov        dword ptr [r11 + 0x10], r10d
00711 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00715 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0071a 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
0071e 448d51fd                       lea        r10d, [rcx - 3]
00722 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
0072a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0072f 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
00736 41895a08                       mov        dword ptr [r10 + 8], ebx
0073a 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00742 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
0074a 488beb                         mov        rbp, rbx
0074d 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
00752 4c03542428                     add        r10, qword ptr [rsp + 0x28]
00757 4863d0                         movsxd     rdx, eax
0075a 4c03d2                         add        r10, rdx
0075d 493bda                         cmp        rbx, r10
00760 0f8f4e100000                   jg         0x7f0537e79ab4
00766 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0076a 03d8                           add        ebx, eax
0076c 448bf3                         mov        r14d, ebx
0076f 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
00777 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0077c 4585db                         test       r11d, r11d
0077f 0f85c0fbffff                   jne        0x7f0537e78645
00785 4d63c6                         movsxd     r8, r14d
00788 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
0078d 0f8c8d120000                   jl         0x7f0537e79d20
00793 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
00798 0f8f0e130000                   jg         0x7f0537e79dac
0079e 4533ed                         xor        r13d, r13d
007a1 e9a2fbffff                     jmp        0x7f0537e78648
007a6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
007ab 452bd1                         sub        r10d, r9d
007ae 453bda                         cmp        r11d, r10d
007b1 0f8e3fffffff                   jle        0x7f0537e789f6
007b7 be45ffffff                     mov        esi, 0xffffff45
007bc 418beb                         mov        ebp, r11d
007bf 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
007c7 90                             nop        
007c8 c5f877                         vzeroupper 
007cb e890abb4ff                     call       0x7f05379c3660
007d0 0f1f8400c8080001               nop        dword ptr [rax + rax + 0x10008c8]
007d8 85c0                           test       eax, eax
007da 7407                           je         0x7f0537e78ae3
007dc 448d51ff                       lea        r10d, [rcx - 1]
007e0 418bca                         mov        ecx, r10d
007e3 85c9                           test       ecx, ecx
007e5 7516                           jne        0x7f0537e78afd
007e7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007ec 418b5a08                       mov        ebx, dword ptr [r10 + 8]
007f0 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
007f8 e986000000                     jmp        0x7f0537e78b83
007fd 83f903                         cmp        ecx, 3
00800 0f84261c0000                   je         0x7f0537e7a72c
00806 83f902                         cmp        ecx, 2
00809 0f87b11c0000                   ja         0x7f0537e7a7c0
0080f 3b8c24fc000000                 cmp        ecx, dword ptr [rsp + 0xfc]
00816 0f8316160000                   jae        0x7f0537e7a132
0081c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00821 418b5c8b08                     mov        ebx, dword ptr [r11 + rcx*4 + 8]
00826 85c9                           test       ecx, ecx
00828 7e48                           jle        0x7f0537e78b72
0082a 448d51ff                       lea        r10d, [rcx - 1]
0082e 443b9424fc000000               cmp        r10d, dword ptr [rsp + 0xfc]
00836 0f83511b0000                   jae        0x7f0537e7a68d
0083c 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00844 660f1f440000                   nop        word ptr [rax + rax]
0084a 660f1f440000                   nop        word ptr [rax + rax]
00850 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00855 458b5c8b04                     mov        r11d, dword ptr [r11 + rcx*4 + 4]
0085a 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0085f 45895c8808                     mov        dword ptr [r8 + rcx*4 + 8], r11d
00864 448d51ff                       lea        r10d, [rcx - 1]
00868 418bca                         mov        ecx, r10d
0086b 4585d2                         test       r10d, r10d
0086e 7fe0                           jg         0x7f0537e78b50
00870 eb08                           jmp        0x7f0537e78b7a
00872 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
0087a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0087f 41895a08                       mov        dword ptr [r10 + 8], ebx
00883 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0088a e9b3feffff                     jmp        0x7f0537e78a42
0088f 4183fb10                       cmp        r11d, 0x10
00893 0f8dd2080000                   jge        0x7f0537e7946b
00899 4183fb08                       cmp        r11d, 8
0089d 0f8d79040000                   jge        0x7f0537e7901c
008a3 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
008a8 4183fa10                       cmp        r10d, 0x10
008ac 0f8fae010000                   jg         0x7f0537e78d60
008b2 443b74241c                     cmp        r14d, dword ptr [rsp + 0x1c]
008b7 0f83af160000                   jae        0x7f0537e7a26c
008bd 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
008c5 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
008cb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008d0 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008d5 0f8345170000                   jae        0x7f0537e7a320
008db 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
008e0 41ffc3                         inc        r11d
008e3 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
008eb 458d5e03                       lea        r11d, [r14 + 3]
008ef 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
008f4 0f83aa170000                   jae        0x7f0537e7a3a4
008fa 4d63c6                         movsxd     r8, r14d
008fd 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
00903 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00908 4183c303                       add        r11d, 3
0090c 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00911 0f831d180000                   jae        0x7f0537e7a434
00917 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
0091c 43886c0a09                     mov        byte ptr [r10 + r9 + 9], bpl
00921 470fbe54020a                   movsx      r10d, byte ptr [r10 + r8 + 0xa]
00927 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0092f 4788540b0a                     mov        byte ptr [r11 + r9 + 0xa], r10b
00934 470fbe54030b                   movsx      r10d, byte ptr [r11 + r8 + 0xb]
0093a 4788540b0b                     mov        byte ptr [r11 + r9 + 0xb], r10b
0093f 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00947 4183fa08                       cmp        r10d, 8
0094b 0f8367180000                   jae        0x7f0537e7a4b8
00951 49baf03727e300000000           movabs     r10, 0xe32737f0
0095b 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00963 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00968 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0096d 4183fa04                       cmp        r10d, 4
00971 7e62                           jle        0x7f0537e78cd5
00973 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00978 4183c304                       add        r11d, 4
0097c 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
00984 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
0098c 0f83ba180000                   jae        0x7f0537e7a54c
00992 458bd6                         mov        r10d, r14d
00995 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0099d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
009a5 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
009ad 438b6c0208                     mov        ebp, dword ptr [r10 + r8 + 8]
009b2 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
009ba 0f8334190000                   jae        0x7f0537e7a5f4
009c0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
009c5 4d63d3                         movsxd     r10, r11d
009c8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
009d0 43896c130c                     mov        dword ptr [r11 + r10 + 0xc], ebp
009d5 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
009da 4183fb08                       cmp        r11d, 8
009de 7e77                           jle        0x7f0537e78d57
009e0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
009e5 4183c208                       add        r10d, 8
009e9 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
009f1 49ba183827e300000000           movabs     r10, 0xe3273818
009fb 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a03 478b549a08                     mov        r10d, dword ptr [r10 + r11*4 + 8]
00a08 452bf2                         sub        r14d, r10d
00a0b 418d6e08                       lea        ebp, [r14 + 8]
00a0f 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00a16 0f83381b0000                   jae        0x7f0537e7a854
00a1c 4d63de                         movsxd     r11, r14d
00a1f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a27 4b8b6c1a10                     mov        rbp, qword ptr [r10 + r11 + 0x10]
00a2c 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00a34 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00a3c 0f83921b0000                   jae        0x7f0537e7a8d4
00a42 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00a47 4d63dd                         movsxd     r11, r13d
00a4a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a52 4b896c1a10                     mov        qword ptr [r10 + r11 + 0x10], rbp
00a57 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00a5b e928fcffff                     jmp        0x7f0537e78988
00a60 4585f6                         test       r14d, r14d
00a63 0f8cdf1b0000                   jl         0x7f0537e7a948
00a69 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00a6e 4585db                         test       r11d, r11d
00a71 0f8cd11b0000                   jl         0x7f0537e7a948
00a77 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00a7c 443b542464                     cmp        r10d, dword ptr [rsp + 0x64]
00a81 0f82c11b0000                   jb         0x7f0537e7a948
00a87 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a8f 4403542464                     add        r10d, dword ptr [rsp + 0x64]
00a94 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00a9c 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00aa1 453bda                         cmp        r11d, r10d
00aa4 0f829e1b0000                   jb         0x7f0537e7a948
00aaa 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00ab2 4585db                         test       r11d, r11d
00ab5 0f8c8d1b0000                   jl         0x7f0537e7a948
00abb 4585db                         test       r11d, r11d
00abe 0f84bcf7ffff                   je         0x7f0537e78580
00ac4 4883fd20                       cmp        rbp, 0x20
00ac8 7725                           ja         0x7f0537e78def
00aca 4d63d3                         movsxd     r10, r11d
00acd 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ad4 c442a8f5db                     bzhi       r11, r11, r10
00ad9 c4c1fb92fb                     kmovq      k7, r11
00ade 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ae4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00aea e991f7ffff                     jmp        0x7f0537e78580
00aef 488bd5                         mov        rdx, rbp
00af2 c5f877                         vzeroupper 
00af5 49ba204f8e37057f0000           movabs     r10, 0x7f05378e4f20
00aff 41ffd2                         call       r10
00b02 0f1f840000000000               nop        dword ptr [rax + rax]
00b0a e971f7ffff                     jmp        0x7f0537e78580
00b0f 83f830                         cmp        eax, 0x30
00b12 0f8fd0050000                   jg         0x7f0537e793e8
00b18 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00b20 0f83d61b0000                   jae        0x7f0537e7a9fc
00b26 4963c9                         movsxd     rcx, r9d
00b29 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00b2e c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
00b35 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b3a 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00b42 0f83641c0000                   jae        0x7f0537e7aaac
00b48 418bfa                         mov        edi, r10d
00b4b 458d5a10                       lea        r11d, [r10 + 0x10]
00b4f 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b54 4d63da                         movsxd     r11, r10d
00b57 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00b5f c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00b66 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00b6b 443bc3                         cmp        r8d, ebx
00b6e 0f8db7000000                   jge        0x7f0537e78f2b
00b74 492bcb                         sub        rcx, r11
00b77 4d63d8                         movsxd     r11, r8d
00b7a 4d8d140b                       lea        r10, [r11 + rcx]
00b7e 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00b86 0f83e41c0000                   jae        0x7f0537e7ab70
00b8c 4c63d3                         movsxd     r10, ebx
00b8f 4d2bd3                         sub        r10, r11
00b92 4983c20f                       add        r10, 0xf
00b96 4983e2f0                       and        r10, 0xfffffffffffffff0
00b9a 458bd2                         mov        r10d, r10d
00b9d 458d543a10                     lea        r10d, [r10 + rdi + 0x10]
00ba2 4d63d2                         movsxd     r10, r10d
00ba5 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
00baa 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
00bb2 0f83b81c0000                   jae        0x7f0537e7ab70
00bb8 443b84249c000000               cmp        r8d, dword ptr [rsp + 0x9c]
00bc0 0f83aa1c0000                   jae        0x7f0537e7ab70
00bc6 4983c2f0                       add        r10, -0x10
00bca 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00bd2 0f83981c0000                   jae        0x7f0537e7ab70
00bd8 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00bde 0f8f101d0000                   jg         0x7f0537e7abf4
00be4 458bd1                         mov        r10d, r9d
00be7 442bd7                         sub        r10d, edi
00bea 660f1f440000                   nop        word ptr [rax + rax]
00bf0 458bc2                         mov        r8d, r10d
00bf3 4403442460                     add        r8d, dword ptr [rsp + 0x60]
00bf8 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00bfd c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00c04 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c09 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00c11 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00c18 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c1d 4183c310                       add        r11d, 0x10
00c21 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00c26 443bdb                         cmp        r11d, ebx
00c29 7cc5                           jl         0x7f0537e78ef0
00c2b 468d1408                       lea        r10d, [rax + r9]
00c2f 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00c34 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00c38 e9aff7ffff                     jmp        0x7f0537e786ec
00c3d 4d63d2                         movsxd     r10, r10d
00c40 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c47 c442a8f5db                     bzhi       r11, r11, r10
00c4c c4c1fb92fb                     kmovq      k7, r11
00c51 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c57 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c5d e9a0000000                     jmp        0x7f0537e79002
00c62 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00c67 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00c6c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00c74 4585db                         test       r11d, r11d
00c77 0f84c31d0000                   je         0x7f0537e7ad40
00c7d 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c82 4585c0                         test       r8d, r8d
00c85 0f8c351e0000                   jl         0x7f0537e7adc0
00c8b 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00c90 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00c95 8bb424f8000000                 mov        esi, dword ptr [rsp + 0xf8]
00c9c 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00ca0 85db                           test       ebx, ebx
00ca2 0f8ccc1d0000                   jl         0x7f0537e7ad74
00ca8 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00cac 0f82c81d0000                   jb         0x7f0537e7ad7a
00cb2 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00cb6 4103ea                         add        ebp, r10d
00cb9 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00cbd 3bcd                           cmp        ecx, ebp
00cbf 0f82bb1d0000                   jb         0x7f0537e7ad80
00cc5 4585d2                         test       r10d, r10d
00cc8 0f8cb81d0000                   jl         0x7f0537e7ad86
00cce 4585d2                         test       r10d, r10d
00cd1 742f                           je         0x7f0537e79002
00cd3 498d741b08                     lea        rsi, [r11 + rbx + 8]
00cd8 4b8d7c0508                     lea        rdi, [r13 + r8 + 8]
00cdd 4963d2                         movsxd     rdx, r10d
00ce0 4883fa20                       cmp        rdx, 0x20
00ce4 0f8653ffffff                   jbe        0x7f0537e78f3d
00cea c5f877                         vzeroupper 
00ced 49ba204f8e37057f0000           movabs     r10, 0x7f05378e4f20
00cf7 41ffd2                         call       r10
00cfa 0f1f840000000000               nop        dword ptr [rax + rax]
00d02 41896e38                       mov        dword ptr [r14 + 0x38], ebp
00d06 c5f877                         vzeroupper 
00d09 4881c4e0000000                 add        rsp, 0xe0
00d10 5d                             pop        rbp
00d11 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d15 0f87f0220000                   ja         0x7f0537e7b30b
00d1b c3                             ret        
00d1c 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00d24 0f83a61d0000                   jae        0x7f0537e7add0
00d2a 418bee                         mov        ebp, r14d
00d2d 896c245c                       mov        dword ptr [rsp + 0x5c], ebp
00d31 4c63c5                         movsxd     r8, ebp
00d34 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00d3c 4b8b6c0308                     mov        rbp, qword ptr [r11 + r8 + 8]
00d41 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00d49 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00d4e 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00d56 0f83181e0000                   jae        0x7f0537e7ae74
00d5c 8b742464                       mov        esi, dword ptr [rsp + 0x64]
00d60 8d6e08                         lea        ebp, [rsi + 8]
00d63 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00d67 4c63d6                         movsxd     r10, esi
00d6a 488bac24b0000000               mov        rbp, qword ptr [rsp + 0xb0]
00d72 4b896c1308                     mov        qword ptr [r11 + r10 + 8], rbp
00d77 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00d7b 3beb                           cmp        ebp, ebx
00d7d 0f8d37030000                   jge        0x7f0537e793ba
00d83 4d2bc2                         sub        r8, r10
00d86 4863cd                         movsxd     rcx, ebp
00d89 4e8d1401                       lea        r10, [rcx + r8]
00d8d 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00d95 0f83651e0000                   jae        0x7f0537e7af00
00d9b 4d8bd1                         mov        r10, r9
00d9e 4c2bd1                         sub        r10, rcx
00da1 4983c207                       add        r10, 7
00da5 4983e2f8                       and        r10, 0xfffffffffffffff8
00da9 458bd2                         mov        r10d, r10d
00dac 458d5c3208                     lea        r11d, [r10 + rsi + 8]
00db1 4d63d3                         movsxd     r10, r11d
00db4 4f8d5c02f8                     lea        r11, [r10 + r8 - 8]
00db9 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00dc1 0f83391e0000                   jae        0x7f0537e7af00
00dc7 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00dce 0f832c1e0000                   jae        0x7f0537e7af00
00dd4 4983c2f8                       add        r10, -8
00dd8 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00de0 0f831a1e0000                   jae        0x7f0537e7af00
00de6 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00dec 0f8f9a1e0000                   jg         0x7f0537e7af8c
00df2 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00df6 2bee                           sub        ebp, esi
00df8 448bed                         mov        r13d, ebp
00dfb 41baf8ffffff                   mov        r10d, 0xfffffff8
00e01 4d8d59c8                       lea        r11, [r9 - 0x38]
00e05 4981fb00000080                 cmp        r11, -0x80000000
00e0c 49c7c000000080                 mov        r8, 0xffffffff80000000
00e13 4d0f4cd8                       cmovl      r11, r8
00e17 418bfb                         mov        edi, r11d
00e1a 442b742464                     sub        r14d, dword ptr [rsp + 0x64]
00e1f 8d5610                         lea        edx, [rsi + 0x10]
00e22 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00e27 4d8bc3                         mov        r8, r11
00e2a 4863c2                         movsxd     rax, edx
00e2d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00e35 458bdb                         mov        r11d, r11d
00e38 452bd3                         sub        r10d, r11d
00e3b 442bd6                         sub        r10d, esi
00e3e 4183c2f0                       add        r10d, -0x10
00e42 41bb06000000                   mov        r11d, 6
00e48 c442a0f5d2                     bzhi       r10, r10, r11
00e4d 4903c2                         add        rax, r10
00e50 493bc1                         cmp        rax, r9
00e53 4d8bd9                         mov        r11, r9
00e56 4c0f4cd8                       cmovl      r11, rax
00e5a 4d8bd3                         mov        r10, r11
00e5d 4c2bd1                         sub        r10, rcx
00e60 498d72ff                       lea        rsi, [r10 - 1]
00e64 48c1fe3f                       sar        rsi, 0x3f
00e68 48c1ee3d                       shr        rsi, 0x3d
00e6c 4e8d5416ff                     lea        r10, [rsi + r10 - 1]
00e71 4983e2f8                       and        r10, 0xfffffffffffffff8
00e75 4c03d1                         add        r10, rcx
00e78 493bca                         cmp        rcx, r10
00e7b 490f4cca                       cmovl      rcx, r10
00e7f 448bd1                         mov        r10d, ecx
00e82 438d741608                     lea        esi, [r14 + r10 + 8]
00e87 4183c208                       add        r10d, 8
00e8b 4863ce                         movsxd     rcx, esi
00e8e 4903c8                         add        rcx, r8
00e91 4963f2                         movsxd     rsi, r10d
00e94 4903f0                         add        rsi, r8
00e97 4c8d4108                       lea        r8, [rcx + 8]
00e9b 4883c148                       add        rcx, 0x48
00e9f 488d4648                       lea        rax, [rsi + 0x48]
00ea3 4533d2                         xor        r10d, r10d
00ea6 493bc0                         cmp        rax, r8
00ea9 410f96c2                       setbe      r10b
00ead 4883c608                       add        rsi, 8
00eb1 4533c0                         xor        r8d, r8d
00eb4 483bce                         cmp        rcx, rsi
00eb7 410f96c0                       setbe      r8b
00ebb 450bd0                         or         r10d, r8d
00ebe 0f84500e0000                   je         0x7f0537e7a014
00ec4 458bd3                         mov        r10d, r11d
00ec7 90                             nop        
00ec8 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ecd 418bcd                         mov        ecx, r13d
00ed0 034c244c                       add        ecx, dword ptr [rsp + 0x4c]
00ed4 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00edb 488b4c0a08                     mov        rcx, qword ptr [rdx + rcx + 8]
00ee0 4a894c1a08                     mov        qword ptr [rdx + r11 + 8], rcx
00ee5 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00ee9 83c508                         add        ebp, 8
00eec 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00ef0 413bea                         cmp        ebp, r10d
00ef3 7cd3                           jl         0x7f0537e791c8
00ef5 4981c108feffff                 add        r9, -0x1f8
00efc 4981f900000080                 cmp        r9, -0x80000000
00f03 49c7c200000080                 mov        r10, 0xffffffff80000000
00f0a 4d0f4cca                       cmovl      r9, r10
00f0e 458bd1                         mov        r10d, r9d
00f11 413bea                         cmp        ebp, r10d
00f14 0f8d6c010000                   jge        0x7f0537e79386
00f1a 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
00f1e 6690                           nop        
00f20 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f25 4963c8                         movsxd     rcx, r8d
00f28 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f2d 418bd5                         mov        edx, r13d
00f30 0354244c                       add        edx, dword ptr [rsp + 0x4c]
00f34 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00f39 4183c040                       add        r8d, 0x40
00f3d 4503c5                         add        r8d, r13d
00f40 448bca                         mov        r9d, edx
00f43 8b842484000000                 mov        eax, dword ptr [rsp + 0x84]
00f4a 62b17e486f840808000000         vmovdqu32  zmm0, zmmword ptr [rax + r9 + 8]
00f55 448bc8                         mov        r9d, eax
00f58 62917e487f841908000000         vmovdqu32  zmmword ptr [r9 + r11 + 8], zmm0
00f63 62917e486f840108000000         vmovdqu32  zmm0, zmmword ptr [r9 + r8 + 8]
00f6e 62d17e487f840948000000         vmovdqu32  zmmword ptr [r9 + rcx + 0x48], zmm0
00f79 4863d2                         movsxd     rdx, edx
00f7c 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f81 4181c380000000                 add        r11d, 0x80
00f88 4503dd                         add        r11d, r13d
00f8b 62917e486f841908000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 8]
00f96 62d17e487f840988000000         vmovdqu32  zmmword ptr [r9 + rcx + 0x88], zmm0
00fa1 62d17e486f8411c8000000         vmovdqu32  zmm0, zmmword ptr [r9 + rdx + 0xc8]
00fac 62d17e487f8409c8000000         vmovdqu32  zmmword ptr [r9 + rcx + 0xc8], zmm0
00fb7 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fbc 4181c300010000                 add        r11d, 0x100
00fc3 4503dd                         add        r11d, r13d
00fc6 458bcb                         mov        r9d, r11d
00fc9 62b17e486f841808000000         vmovdqu32  zmm0, zmmword ptr [rax + r11 + 8]
00fd4 62f17e487f840808010000         vmovdqu32  zmmword ptr [rax + rcx + 0x108], zmm0
00fdf 62f17e486f841048010000         vmovdqu32  zmm0, zmmword ptr [rax + rdx + 0x148]
00fea 62f17e487f840848010000         vmovdqu32  zmmword ptr [rax + rcx + 0x148], zmm0
00ff5 62f17e486f841088010000         vmovdqu32  zmm0, zmmword ptr [rax + rdx + 0x188]
01000 62f17e487f840888010000         vmovdqu32  zmmword ptr [rax + rcx + 0x188], zmm0
0100b 4d63d9                         movsxd     r11, r9d
0100e 62b17e486f8418c8000000         vmovdqu32  zmm0, zmmword ptr [rax + r11 + 0xc8]
01019 62f17e487f8408c8010000         vmovdqu32  zmmword ptr [rax + rcx + 0x1c8], zmm0
01024 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
01028 81c500020000                   add        ebp, 0x200
0102e 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
01032 413bea                         cmp        ebp, r10d
01035 0f8ce5feffff                   jl         0x7f0537e79220
0103b 3bef                           cmp        ebp, edi
0103d 7d47                           jge        0x7f0537e79386
0103f 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
01043 90                             nop        
01044 458bd5                         mov        r10d, r13d
01047 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
0104c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01054 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
0105f 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01064 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0106c 62917e487f841808000000         vmovdqu32  zmmword ptr [r8 + r11 + 8], zmm0
01077 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
0107b 83c540                         add        ebp, 0x40
0107e 896c244c                       mov        dword ptr [rsp + 0x4c], ebp
01082 3bef                           cmp        ebp, edi
01084 7cbe                           jl         0x7f0537e79344
01086 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
0108a 3beb                           cmp        ebp, ebx
0108c 7d2c                           jge        0x7f0537e793ba
0108e 6690                           nop        
01090 458bd5                         mov        r10d, r13d
01093 4403d5                         add        r10d, ebp
01096 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0109e 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
010a3 448bdd                         mov        r11d, ebp
010a6 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
010ae 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
010b3 83c508                         add        ebp, 8
010b6 3beb                           cmp        ebp, ebx
010b8 7cd6                           jl         0x7f0537e79390
010ba 895c2464                       mov        dword ptr [rsp + 0x64], ebx
010be e9c5f5ffff                     jmp        0x7f0537e78988
010c3 448bd0                         mov        r10d, eax
010c6 4d63d2                         movsxd     r10, r10d
010c9 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
010d0 c442a8f5db                     bzhi       r11, r11, r10
010d5 c4c1fb92fb                     kmovq      k7, r11
010da 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
010e0 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
010e6 eb7a                           jmp        0x7f0537e79462
010e8 4585c9                         test       r9d, r9d
010eb 0f8c271c0000                   jl         0x7f0537e7b018
010f1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
010f6 4585d2                         test       r10d, r10d
010f9 0f8c191c0000                   jl         0x7f0537e7b018
010ff 448b9c24f8000000               mov        r11d, dword ptr [rsp + 0xf8]
01107 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
0110c 0f82061c0000                   jb         0x7f0537e7b018
01112 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01117 443bd3                         cmp        r10d, ebx
0111a 0f82f81b0000                   jb         0x7f0537e7b018
01120 85c0                           test       eax, eax
01122 743e                           je         0x7f0537e79462
01124 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01129 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
0112e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01136 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0113b 4b8d740208                     lea        rsi, [r10 + r8 + 8]
01140 4883fa20                       cmp        rdx, 0x20
01144 0f8679ffffff                   jbe        0x7f0537e793c3
0114a c5f877                         vzeroupper 
0114d 49ba204f8e37057f0000           movabs     r10, 0x7f05378e4f20
01157 41ffd2                         call       r10
0115a 0f1f840000000000               nop        dword ptr [rax + rax]
01162 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01166 e981f2ffff                     jmp        0x7f0537e786ec
0116b 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
01173 0f83431c0000                   jae        0x7f0537e7b0bc
01179 4d63c6                         movsxd     r8, r14d
0117c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01184 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
0118b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01190 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01198 0f83b61c0000                   jae        0x7f0537e7b154
0119e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
011a3 418bfb                         mov        edi, r11d
011a6 418d6b10                       lea        ebp, [r11 + 0x10]
011aa 4d63db                         movsxd     r11, r11d
011ad 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
011b5 c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
011bc 3beb                           cmp        ebp, ebx
011be 0f8d30020000                   jge        0x7f0537e796f4
011c4 4d2bc3                         sub        r8, r11
011c7 4c63dd                         movsxd     r11, ebp
011ca 4f8d1403                       lea        r10, [r11 + r8]
011ce 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
011d6 0f831c1d0000                   jae        0x7f0537e7b1f8
011dc 4d8bd1                         mov        r10, r9
011df 4d2bd3                         sub        r10, r11
011e2 4983c20f                       add        r10, 0xf
011e6 4983e2f0                       and        r10, 0xfffffffffffffff0
011ea 458bd2                         mov        r10d, r10d
011ed 448bdf                         mov        r11d, edi
011f0 478d5c1a10                     lea        r11d, [r10 + r11 + 0x10]
011f5 4d63d3                         movsxd     r10, r11d
011f8 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
011fd 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
01205 0f83ed1c0000                   jae        0x7f0537e7b1f8
0120b 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01212 0f83e01c0000                   jae        0x7f0537e7b1f8
01218 4983c2f0                       add        r10, -0x10
0121c 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01224 0f83ce1c0000                   jae        0x7f0537e7b1f8
0122a 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
01230 0f8f2e1d0000                   jg         0x7f0537e7b264
01236 442bf7                         sub        r14d, edi
01239 8d4f20                         lea        ecx, [rdi + 0x20]
0123c 458d142e                       lea        r10d, [r14 + rbp]
01240 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01248 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
0124f 448bd5                         mov        r10d, ebp
01252 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
01259 83c510                         add        ebp, 0x10
0125c 3be9                           cmp        ebp, ecx
0125e 7cdc                           jl         0x7f0537e7953c
01260 4981c110ffffff                 add        r9, -0xf0
01267 4981f900000080                 cmp        r9, -0x80000000
0126e 49c7c200000080                 mov        r10, 0xffffffff80000000
01275 4d0f4cca                       cmovl      r9, r10
01279 418bc9                         mov        ecx, r9d
0127c 3be9                           cmp        ebp, ecx
0127e 0f8d45010000                   jge        0x7f0537e796c9
01284 660f1f440000                   nop        word ptr [rax + rax]
0128a 660f1f440000                   nop        word ptr [rax + rax]
01290 458d142e                       lea        r10d, [r14 + rbp]
01294 448bc5                         mov        r8d, ebp
01297 4d63c8                         movsxd     r9, r8d
0129a 458bc2                         mov        r8d, r10d
0129d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
012a5 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
012ac 4d63c2                         movsxd     r8, r10d
012af 448bd5                         mov        r10d, ebp
012b2 c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
012b9 c4817a6f440318                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x18]
012c0 c4817a7f440b18                 vmovdqu    xmmword ptr [r11 + r9 + 0x18], xmm0
012c7 c4817a6f440328                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x28]
012ce c4817a7f440b28                 vmovdqu    xmmword ptr [r11 + r9 + 0x28], xmm0
012d5 c4817a6f440338                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x38]
012dc c4817a7f440b38                 vmovdqu    xmmword ptr [r11 + r9 + 0x38], xmm0
012e3 c4817a6f440348                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x48]
012ea c4817a7f440b48                 vmovdqu    xmmword ptr [r11 + r9 + 0x48], xmm0
012f1 c4817a6f440358                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x58]
012f8 c4817a7f440b58                 vmovdqu    xmmword ptr [r11 + r9 + 0x58], xmm0
012ff c4817a6f440368                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x68]
01306 c4817a7f440b68                 vmovdqu    xmmword ptr [r11 + r9 + 0x68], xmm0
0130d c4817a6f440378                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x78]
01314 c4817a7f440b78                 vmovdqu    xmmword ptr [r11 + r9 + 0x78], xmm0
0131b c4817a6f840388000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x88]
01325 c4817a7f840b88000000           vmovdqu    xmmword ptr [r11 + r9 + 0x88], xmm0
0132f c4817a6f840398000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0x98]
01339 c4817a7f840b98000000           vmovdqu    xmmword ptr [r11 + r9 + 0x98], xmm0
01343 c4817a6f8403a8000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xa8]
0134d c4817a7f840ba8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xa8], xmm0
01357 c4817a6f8403b8000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xb8]
01361 c4817a7f840bb8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xb8], xmm0
0136b c4817a6f8403c8000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc8]
01375 c4817a7f840bc8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xc8], xmm0
0137f c4817a6f8403d8000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xd8]
01389 c4817a7f840bd8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xd8], xmm0
01393 c4817a6f8403e8000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xe8]
0139d c4817a7f840be8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xe8], xmm0
013a7 c4817a6f8403f8000000           vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xf8]
013b1 c4817a7f840bf8000000           vmovdqu    xmmword ptr [r11 + r9 + 0xf8], xmm0
013bb 81c500010000                   add        ebp, 0x100
013c1 3be9                           cmp        ebp, ecx
013c3 0f8cc7feffff                   jl         0x7f0537e79590
013c9 3beb                           cmp        ebp, ebx
013cb 7d27                           jge        0x7f0537e796f4
013cd 666690                         nop        
013d0 458d142e                       lea        r10d, [r14 + rbp]
013d4 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
013dc c4817a6f441008                 vmovdqu    xmm0, xmmword ptr [r8 + r10 + 8]
013e3 448bd5                         mov        r10d, ebp
013e6 c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
013ed 83c510                         add        ebp, 0x10
013f0 3beb                           cmp        ebp, ebx
013f2 7cdc                           jl         0x7f0537e796d0
013f4 895c2464                       mov        dword ptr [rsp + 0x64], ebx
013f8 e98bf2ffff                     jmp        0x7f0537e78988
013fd 4803f9                         add        rdi, rcx
01400 483b7c2440                     cmp        rdi, qword ptr [rsp + 0x40]
01405 7e08                           jle        0x7f0537e7970f
01407 4533c0                         xor        r8d, r8d
0140a e9a6ecffff                     jmp        0x7f0537e783b5
0140f 4533c0                         xor        r8d, r8d
01412 bf01000000                     mov        edi, 1
01417 e99becffff                     jmp        0x7f0537e783b7
0141c 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01424 4d8bd3                         mov        r10, r11
01427 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0142f 418be9                         mov        ebp, r9d
01432 4489ac24f0000000               mov        dword ptr [rsp + 0xf0], r13d
0143a 898424f4000000                 mov        dword ptr [rsp + 0xf4], eax
01441 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
01449 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0144d 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
01454 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01459 8bf8                           mov        edi, eax
0145b 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
01463 44891424                       mov        dword ptr [rsp], r10d
01467 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0146c 44895c2408                     mov        dword ptr [rsp + 8], r11d
01471 666690                         nop        
01474 c5f877                         vzeroupper 
01477 e8e420a8ff                     call       0x7f05378fb860
0147c 0f1f840074150002               nop        dword ptr [rax + rax + 0x2001574]
01484 89442464                       mov        dword ptr [rsp + 0x64], eax
01488 e9fbf1ffff                     jmp        0x7f0537e78988
0148d bee4ffffff                     mov        esi, 0xffffffe4
01492 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01497 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0149c 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
014a4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
014a9 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
014b1 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
014b6 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
014be 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
014c3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
014c8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
014cd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
014d2 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
014d7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
014dc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
014e1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
014e6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
014eb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
014f0 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
014f5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
014fa 4489542440                     mov        dword ptr [rsp + 0x40], r10d
014ff 89442448                       mov        dword ptr [rsp + 0x48], eax
01503 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01508 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0150d 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
01512 6690                           nop        
01514 c5f877                         vzeroupper 
01517 e8449eb4ff                     call       0x7f05379c3660
0151c 0f1f840014160003               nop        dword ptr [rax + rax + 0x3001614]
01524 bee4ffffff                     mov        esi, 0xffffffe4
01529 498bea                         mov        rbp, r10
0152c 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01531 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01539 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0153e 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01546 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0154b 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01553 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01558 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0155d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01565 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0156a 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
0156f 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01574 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01579 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0157e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01583 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01588 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0158d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01592 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01597 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0159c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
015a1 4489542440                     mov        dword ptr [rsp + 0x40], r10d
015a6 89442448                       mov        dword ptr [rsp + 0x48], eax
015aa 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
015af 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
015b4 48894424f8                     mov        qword ptr [rsp - 8], rax
015b9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
015bd 89442458                       mov        dword ptr [rsp + 0x58], eax
015c1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c6 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
015cc c5f877                         vzeroupper 
015cf e88c9db4ff                     call       0x7f05379c3660
015d4 0f1f8400cc160004               nop        dword ptr [rax + rax + 0x40016cc]
015dc bee4ffffff                     mov        esi, 0xffffffe4
015e1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
015e6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
015eb 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
015f3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
015f8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01600 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01605 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0160d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01612 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01617 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0161f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01624 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01629 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0162e 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01633 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01638 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0163d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01642 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01647 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0164c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01651 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01656 6690                           nop        
01658 c5f877                         vzeroupper 
0165b e8009db4ff                     call       0x7f05379c3660
01660 0f1f840058170005               nop        dword ptr [rax + rax + 0x5001758]
01668 bee4ffffff                     mov        esi, 0xffffffe4
0166d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01672 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01677 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0167f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01684 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0168c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01691 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01699 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0169e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016a3 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
016ab 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016b0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016b5 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016ba 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016bf 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016c4 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
016c9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016ce 4c89542430                     mov        qword ptr [rsp + 0x30], r10
016d3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
016d8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
016dd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016e2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
016e7 895c2450                       mov        dword ptr [rsp + 0x50], ebx
016eb c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
016f1 666690                         nop        
016f4 c5f877                         vzeroupper 
016f7 e8649cb4ff                     call       0x7f05379c3660
016fc 0f1f8400f4170006               nop        dword ptr [rax + rax + 0x60017f4]
01704 be45ffffff                     mov        esi, 0xffffff45
01709 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01711 666690                         nop        
01714 c5f877                         vzeroupper 
01717 e8449cb4ff                     call       0x7f05379c3660
0171c 0f1f840014180007               nop        dword ptr [rax + rax + 0x7001814]
01724 be45ffffff                     mov        esi, 0xffffff45
01729 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0172e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01733 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0173b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01740 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01748 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0174d 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01755 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0175a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0175f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01764 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01769 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0176e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01773 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01778 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0177d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01782 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01787 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0178c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01791 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01796 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0179b 89442448                       mov        dword ptr [rsp + 0x48], eax
0179f 894c2450                       mov        dword ptr [rsp + 0x50], ecx
017a3 90                             nop        
017a4 c5f877                         vzeroupper 
017a7 e8b49bb4ff                     call       0x7f05379c3660
017ac 0f1f8400a4180008               nop        dword ptr [rax + rax + 0x80018a4]
017b4 493bda                         cmp        rbx, r10
017b7 bdffffffff                     mov        ebp, 0xffffffff
017bc 7c08                           jl         0x7f0537e79ac6
017be 400f95c5                       setne      bpl
017c2 400fb6ed                       movzx      ebp, bpl
017c6 be45ffffff                     mov        esi, 0xffffff45
017cb 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
017d0 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
017d8 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
017dd 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
017e5 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
017ea 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
017ef 48894424f8                     mov        qword ptr [rsp - 8], rax
017f4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
017f8 89442420                       mov        dword ptr [rsp + 0x20], eax
017fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01801 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01806 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0180b 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01810 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01815 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0181a 89442450                       mov        dword ptr [rsp + 0x50], eax
0181e 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01823 90                             nop        
01824 c5f877                         vzeroupper 
01827 e8349bb4ff                     call       0x7f05379c3660
0182c 0f1f840024190009               nop        dword ptr [rax + rax + 0x9001924]
01834 be45ffffff                     mov        esi, 0xffffff45
01839 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0183e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01843 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0184b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01850 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01858 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0185d 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01865 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0186a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0186f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01874 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01879 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0187e 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01883 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01888 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0188d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01892 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01897 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0189c 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
018a1 89442448                       mov        dword ptr [rsp + 0x48], eax
018a5 666690                         nop        
018a8 c5f877                         vzeroupper 
018ab e8b09ab4ff                     call       0x7f05379c3660
018b0 0f1f8400a819000a               nop        dword ptr [rax + rax + 0xa0019a8]
018b8 bee4ffffff                     mov        esi, 0xffffffe4
018bd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
018c2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
018c7 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
018cf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018d4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
018dc 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018e1 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
018e9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
018ee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018f3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
018fb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01900 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01905 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0190a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0190f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01914 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01919 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0191e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01923 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01928 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0192d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01932 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01937 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0193c 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01941 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01946 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0194b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0194f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01954 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01959 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0195e 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01963 90                             nop        
01964 c5f877                         vzeroupper 
01967 e8f499b4ff                     call       0x7f05379c3660
0196c 0f1f8400641a000b               nop        dword ptr [rax + rax + 0xb001a64]
01974 bee4ffffff                     mov        esi, 0xffffffe4
01979 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0197e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01983 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0198b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01990 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01998 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0199d 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
019a5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
019aa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019af 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019b4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
019b9 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
019be 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
019c3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
019c8 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
019cd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
019d2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
019d7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019dc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019e1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
019e6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
019eb 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
019f0 4489542440                     mov        dword ptr [rsp + 0x40], r10d
019f5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
019fa 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019ff 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01a03 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01a08 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01a0d 666690                         nop        
01a10 c5f877                         vzeroupper 
01a13 e84899b4ff                     call       0x7f05379c3660
01a18 0f1f8400101b000c               nop        dword ptr [rax + rax + 0xc001b10]
01a20 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01a25 4d3bc3                         cmp        r8, r11
01a28 bdffffffff                     mov        ebp, 0xffffffff
01a2d 7c08                           jl         0x7f0537e79d37
01a2f 400f95c5                       setne      bpl
01a33 400fb6ed                       movzx      ebp, bpl
01a37 be45ffffff                     mov        esi, 0xffffff45
01a3c 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01a40 898c24f8000000                 mov        dword ptr [rsp + 0xf8], ecx
01a47 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01a4c 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
01a54 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01a59 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01a5e 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a63 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01a68 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01a6d 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01a72 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a77 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01a7c 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01a81 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01a86 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01a8a 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a8f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01a94 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01a99 666690                         nop        
01a9c c5f877                         vzeroupper 
01a9f e8bc98b4ff                     call       0x7f05379c3660
01aa4 0f1f84009c1b000d               nop        dword ptr [rax + rax + 0xd001b9c]
01aac 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01ab1 493beb                         cmp        rbp, r11
01ab4 bdffffffff                     mov        ebp, 0xffffffff
01ab9 7c08                           jl         0x7f0537e79dc3
01abb 400f95c5                       setne      bpl
01abf 400fb6ed                       movzx      ebp, bpl
01ac3 be45ffffff                     mov        esi, 0xffffff45
01ac8 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01acd 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
01ad5 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01ad9 898c24fc000000                 mov        dword ptr [rsp + 0xfc], ecx
01ae0 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01ae5 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01aea 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01aef 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01af4 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01af9 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01afe 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01b03 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01b08 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01b0d 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01b12 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01b16 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01b1b 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01b20 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01b25 666690                         nop        
01b28 c5f877                         vzeroupper 
01b2b e83098b4ff                     call       0x7f05379c3660
01b30 0f1f8400281c000e               nop        dword ptr [rax + rax + 0xe001c28]
01b38 4183c608                       add        r14d, 8
01b3c be6effffff                     mov        esi, 0xffffff6e
01b41 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01b46 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b4b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
01b53 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b58 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01b60 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b65 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01b6d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b72 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b77 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01b7b 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01b80 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b85 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01b8a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01b8f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01b94 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b99 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b9e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ba3 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ba8 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01bad 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01bb2 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01bb7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01bbc 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01bc1 897c2458                       mov        dword ptr [rsp + 0x58], edi
01bc5 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01bc9 666690                         nop        
01bcc c5f877                         vzeroupper 
01bcf e88c97b4ff                     call       0x7f05379c3660
01bd4 0f1f8400cc1c000f               nop        dword ptr [rax + rax + 0xf001ccc]
01bdc 4183c608                       add        r14d, 8
01be0 be66ffffff                     mov        esi, 0xffffff66
01be5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01bea 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01bef 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01bf7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01bfc 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01c04 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c09 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
01c11 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c16 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c1b 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01c1f 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c24 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c29 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01c2e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c33 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01c38 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c3d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c42 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01c47 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01c4c 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01c51 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01c56 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01c5b 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c60 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01c65 897c2458                       mov        dword ptr [rsp + 0x58], edi
01c69 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01c6d 666690                         nop        
01c70 c5f877                         vzeroupper 
01c73 e8e896b4ff                     call       0x7f05379c3660
01c78 0f1f8400701d0010               nop        dword ptr [rax + rax + 0x10001d70]
01c80 beccffffff                     mov        esi, 0xffffffcc
01c85 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c8a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01c8f 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01c97 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c9c 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01ca4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01ca9 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01cb1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cb6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cbb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01cc3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01cc8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01ccd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01cd2 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01cd7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01cdc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ce1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ce6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ceb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01cf0 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cf5 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01cfa 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01cff 4489742450                     mov        dword ptr [rsp + 0x50], r14d
01d04 c5f877                         vzeroupper 
01d07 e85496b4ff                     call       0x7f05379c3660
01d0c 0f1f8400041e0011               nop        dword ptr [rax + rax + 0x11001e04]
01d14 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01d19 458bd5                         mov        r10d, r13d
01d1c 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
01d21 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01d29 4f8b5c1308                     mov        r11, qword ptr [r11 + r10 + 8]
01d2e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01d36 4f895c0208                     mov        qword ptr [r10 + r8 + 8], r11
01d3b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d40 4183c208                       add        r10d, 8
01d44 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01d49 443bd2                         cmp        r10d, edx
01d4c 7cc6                           jl         0x7f0537e7a014
01d4e 443bd7                         cmp        r10d, edi
01d51 0f8d92000000                   jge        0x7f0537e7a0e9
01d57 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01d5c 0f1f4000                       nop        dword ptr [rax]
01d60 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d65 4d63ca                         movsxd     r9, r10d
01d68 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01d6d 458bc5                         mov        r8d, r13d
01d70 440344244c                     add        r8d, dword ptr [rsp + 0x4c]
01d75 458bd8                         mov        r11d, r8d
01d78 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
01d7f 4e8b440108                     mov        r8, qword ptr [rcx + r8 + 8]
01d84 4e89441108                     mov        qword ptr [rcx + r10 + 8], r8
01d89 4d63c3                         movsxd     r8, r11d
01d8c 4e8b540110                     mov        r10, qword ptr [rcx + r8 + 0x10]
01d91 4e89540910                     mov        qword ptr [rcx + r9 + 0x10], r10
01d96 4e8b540118                     mov        r10, qword ptr [rcx + r8 + 0x18]
01d9b 4e89540918                     mov        qword ptr [rcx + r9 + 0x18], r10
01da0 4e8b540120                     mov        r10, qword ptr [rcx + r8 + 0x20]
01da5 4e89540920                     mov        qword ptr [rcx + r9 + 0x20], r10
01daa 4e8b540128                     mov        r10, qword ptr [rcx + r8 + 0x28]
01daf 4e89540928                     mov        qword ptr [rcx + r9 + 0x28], r10
01db4 4e8b540130                     mov        r10, qword ptr [rcx + r8 + 0x30]
01db9 4e89540930                     mov        qword ptr [rcx + r9 + 0x30], r10
01dbe 4e8b540138                     mov        r10, qword ptr [rcx + r8 + 0x38]
01dc3 4e89540938                     mov        qword ptr [rcx + r9 + 0x38], r10
01dc8 4e8b5c0140                     mov        r11, qword ptr [rcx + r8 + 0x40]
01dcd 4e895c0940                     mov        qword ptr [rcx + r9 + 0x40], r11
01dd2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01dd7 4183c340                       add        r11d, 0x40
01ddb 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01de0 443bdf                         cmp        r11d, edi
01de3 0f8c77ffffff                   jl         0x7f0537e7a060
01de9 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01dee 443bd3                         cmp        r10d, ebx
01df1 0f8dc3f2ffff                   jge        0x7f0537e793ba
01df7 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01dfc 458bcb                         mov        r9d, r11d
01dff 90                             nop        
01e00 478d1c29                       lea        r11d, [r9 + r13]
01e04 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01e0c 4f8b441808                     mov        r8, qword ptr [r8 + r11 + 8]
01e11 458bd1                         mov        r10d, r9d
01e14 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01e1c 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
01e21 458d5108                       lea        r10d, [r9 + 8]
01e25 458bca                         mov        r9d, r10d
01e28 443bd3                         cmp        r10d, ebx
01e2b 7cd3                           jl         0x7f0537e7a100
01e2d e988f2ffff                     jmp        0x7f0537e793ba
01e32 bee4ffffff                     mov        esi, 0xffffffe4
01e37 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01e3c 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01e41 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01e49 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e4e 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01e56 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01e5b 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01e63 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01e68 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01e6d 48894424f8                     mov        qword ptr [rsp - 8], rax
01e72 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e76 89442418                       mov        dword ptr [rsp + 0x18], eax
01e7a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01e84 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01e89 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01e8e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01e93 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01e98 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01e9d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01ea2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ea7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01eac 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01eb1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01eb6 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01ebb 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01ec0 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01ec5 89442448                       mov        dword ptr [rsp + 0x48], eax
01ec9 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01ecd 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
01ed1 666690                         nop        
01ed4 c5f877                         vzeroupper 
01ed7 e88494b4ff                     call       0x7f05379c3660
01edc 0f1f8400d41f0012               nop        dword ptr [rax + rax + 0x12001fd4]
01ee4 beccffffff                     mov        esi, 0xffffffcc
01ee9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01eee 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01ef6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01efb 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01f03 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01f08 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f0d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01f15 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f1a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01f1f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f24 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
01f29 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01f2e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01f33 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f38 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f3d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01f42 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01f47 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01f4c 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01f51 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01f56 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01f5b 90                             nop        
01f5c c5f877                         vzeroupper 
01f5f e8fc93b4ff                     call       0x7f05379c3660
01f64 0f1f84005c200013               nop        dword ptr [rax + rax + 0x1300205c]
01f6c bee4ffffff                     mov        esi, 0xffffffe4
01f71 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01f76 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01f7b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
01f83 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01f88 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01f90 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f95 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
01f9d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fa2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01fa7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01faf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fb4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01fb9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01fbe 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01fc3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01fc8 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
01fcd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01fd2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fd7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fdc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01fe1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01fe6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01feb 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01ff0 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ff5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01ffa 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01fff 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02004 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02009 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0200e 6690                           nop        
02010 c5f877                         vzeroupper 
02013 e84893b4ff                     call       0x7f05379c3660
02018 0f1f840010210014               nop        dword ptr [rax + rax + 0x14002110]
02020 bee4ffffff                     mov        esi, 0xffffffe4
02025 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0202a 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02032 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02037 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0203f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02044 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02049 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02051 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02056 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0205b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02060 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02065 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0206a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0206f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02074 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02079 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0207e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02083 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02088 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0208d 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02092 6690                           nop        
02094 c5f877                         vzeroupper 
02097 e8c492b4ff                     call       0x7f05379c3660
0209c 0f1f840094210015               nop        dword ptr [rax + rax + 0x15002194]
020a4 418d6e01                       lea        ebp, [r14 + 1]
020a8 bee4ffffff                     mov        esi, 0xffffffe4
020ad 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
020b2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
020ba 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
020bf 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
020c7 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020cc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020d1 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
020d9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020de 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020e3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
020e8 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
020ed 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
020f2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
020f7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020fc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02101 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02106 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0210b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02110 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02115 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0211a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0211f 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02124 c5f877                         vzeroupper 
02127 e83492b4ff                     call       0x7f05379c3660
0212c 0f1f840024220016               nop        dword ptr [rax + rax + 0x16002224]
02134 bee4ffffff                     mov        esi, 0xffffffe4
02139 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0213e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02146 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0214b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02153 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02158 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0215d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02165 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0216a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0216f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02174 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02179 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0217e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02183 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02188 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0218d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02192 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02197 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0219c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
021a1 4489742454                     mov        dword ptr [rsp + 0x54], r14d
021a6 6690                           nop        
021a8 c5f877                         vzeroupper 
021ab e8b091b4ff                     call       0x7f05379c3660
021b0 0f1f8400a8220017               nop        dword ptr [rax + rax + 0x170022a8]
021b8 bee4ffffff                     mov        esi, 0xffffffe4
021bd 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
021c2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
021c7 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
021cf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
021d4 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
021dc 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
021e1 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
021e9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021ee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
021f3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
021fb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02200 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02205 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0220a 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0220f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02214 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02219 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0221e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02223 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02228 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0222d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02232 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02237 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0223c c5f877                         vzeroupper 
0223f e81c91b4ff                     call       0x7f05379c3660
02244 0f1f84003c230018               nop        dword ptr [rax + rax + 0x1800233c]
0224c bee4ffffff                     mov        esi, 0xffffffe4
02251 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02256 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0225b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02263 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02268 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02270 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02275 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0227d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02282 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02287 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0228f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02294 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02299 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0229e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
022a3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
022a8 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
022ad 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
022b2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022b7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022bc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
022c1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
022c6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
022cb 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
022d0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
022d5 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
022da 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
022df 4489742460                     mov        dword ptr [rsp + 0x60], r14d
022e4 c5f877                         vzeroupper 
022e7 e87490b4ff                     call       0x7f05379c3660
022ec 0f1f8400e4230019               nop        dword ptr [rax + rax + 0x190023e4]
022f4 bee4ffffff                     mov        esi, 0xffffffe4
022f9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
022fe 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02306 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0230b 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02313 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02318 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0231d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02325 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0232a 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0232f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02334 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02339 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0233e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02343 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02348 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0234d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02352 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02357 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0235c 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
02361 666690                         nop        
02364 c5f877                         vzeroupper 
02367 e8f48fb4ff                     call       0x7f05379c3660
0236c 0f1f84006424001a               nop        dword ptr [rax + rax + 0x1a002464]
02374 4585c9                         test       r9d, r9d
02377 0f84530c0000                   je         0x7f0537e7b2d0
0237d 4d8bd9                         mov        r11, r9
02380 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02385 4533c0                         xor        r8d, r8d
02388 e90fe9ffff                     jmp        0x7f0537e78f9c
0238d be6effffff                     mov        esi, 0xffffff6e
02392 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02397 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0239c 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
023a4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023a9 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
023b1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
023b6 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
023be 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
023c3 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
023c8 4c89542420                     mov        qword ptr [rsp + 0x20], r10
023cd 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
023d2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
023d7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
023dc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
023e1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023e6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023eb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
023f0 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
023f5 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
023fa 4489542440                     mov        dword ptr [rsp + 0x40], r10d
023ff 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02404 89442448                       mov        dword ptr [rsp + 0x48], eax
02408 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0240d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02412 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02416 894c2460                       mov        dword ptr [rsp + 0x60], ecx
0241a 6690                           nop        
0241c c5f877                         vzeroupper 
0241f e83c8fb4ff                     call       0x7f05379c3660
02424 0f1f84001c25001b               nop        dword ptr [rax + rax + 0x1b00251c]
0242c be45ffffff                     mov        esi, 0xffffff45
02431 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02436 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0243b 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02443 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02448 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02450 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02455 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0245d 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02462 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02467 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0246c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02471 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02476 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0247b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02480 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02485 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0248a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0248f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02494 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02499 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0249e 4489442444                     mov        dword ptr [rsp + 0x44], r8d
024a3 89442448                       mov        dword ptr [rsp + 0x48], eax
024a7 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
024ab 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
024af 90                             nop        
024b0 c5f877                         vzeroupper 
024b3 e8a88eb4ff                     call       0x7f05379c3660
024b8 0f1f8400b025001c               nop        dword ptr [rax + rax + 0x1c0025b0]
024c0 be3dffffff                     mov        esi, 0xffffff3d
024c5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
024ca 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
024cf 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
024d7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024dc 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
024e4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
024e9 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
024f1 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
024f6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
024fb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02500 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02505 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0250a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0250f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02514 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02519 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0251e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02523 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02528 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0252d 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02532 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02537 89442448                       mov        dword ptr [rsp + 0x48], eax
0253b 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0253f 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02543 90                             nop        
02544 c5f877                         vzeroupper 
02547 e8148eb4ff                     call       0x7f05379c3660
0254c 0f1f84004426001d               nop        dword ptr [rax + rax + 0x1d002644]
02554 bee4ffffff                     mov        esi, 0xffffffe4
02559 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0255e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02566 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0256b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02573 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02578 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0257d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02585 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0258a 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0258f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02594 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02599 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0259e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025a3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
025a8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025ad 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
025b2 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025b7 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
025bc 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
025c1 666690                         nop        
025c4 c5f877                         vzeroupper 
025c7 e8948db4ff                     call       0x7f05379c3660
025cc 0f1f8400c426001e               nop        dword ptr [rax + rax + 0x1e0026c4]
025d4 bee4ffffff                     mov        esi, 0xffffffe4
025d9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
025de 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
025e6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
025eb 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
025f3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
025f8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025fd 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02605 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0260a 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0260f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02614 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02619 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0261e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02623 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02628 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0262d 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02632 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02637 90                             nop        
02638 c5f877                         vzeroupper 
0263b e8208db4ff                     call       0x7f05379c3660
02640 0f1f84003827001f               nop        dword ptr [rax + rax + 0x1f002738]
02648 beccffffff                     mov        esi, 0xffffffcc
0264d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02652 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02657 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0265f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02664 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0266c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02671 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02679 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0267e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02683 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0268b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02690 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02695 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0269a 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0269f 4c89542420                     mov        qword ptr [rsp + 0x20], r10
026a4 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
026a9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
026ae 4c89542428                     mov        qword ptr [rsp + 0x28], r10
026b3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
026b8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
026bd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
026c2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
026c7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
026cc 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
026d1 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
026d6 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
026db 4489742458                     mov        dword ptr [rsp + 0x58], r14d
026e0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
026e5 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
026ea 6690                           nop        
026ec c5f877                         vzeroupper 
026ef e86c8cb4ff                     call       0x7f05379c3660
026f4 0f1f8400ec270020               nop        dword ptr [rax + rax + 0x200027ec]
026fc bee4ffffff                     mov        esi, 0xffffffe4
02701 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02706 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0270b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02713 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02718 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02720 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02725 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0272d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02732 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02737 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0273c 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02741 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02746 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0274b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02750 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02755 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0275a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0275f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02764 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02769 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0276e 89442444                       mov        dword ptr [rsp + 0x44], eax
02772 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02777 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0277c 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02780 48894424f8                     mov        qword ptr [rsp - 8], rax
02785 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02789 89442454                       mov        dword ptr [rsp + 0x54], eax
0278d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02792 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02797 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
0279c c5f877                         vzeroupper 
0279f e8bc8bb4ff                     call       0x7f05379c3660
027a4 0f1f84009c280021               nop        dword ptr [rax + rax + 0x2100289c]
027ac c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
027b5 bee4ffffff                     mov        esi, 0xffffffe4
027ba 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
027bf 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
027c4 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
027cc 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
027d1 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
027d9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
027de 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
027e6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
027f0 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
027f8 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
027fd 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02802 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02807 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0280c 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02811 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02816 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0281b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02820 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02825 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0282a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0282f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02834 89442444                       mov        dword ptr [rsp + 0x44], eax
02838 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0283d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02842 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02846 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0284b 48894424f8                     mov        qword ptr [rsp - 8], rax
02850 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02854 89442460                       mov        dword ptr [rsp + 0x60], eax
02858 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0285d 666690                         nop        
02860 c5f877                         vzeroupper 
02863 e8f88ab4ff                     call       0x7f05379c3660
02868 0f1f840060290022               nop        dword ptr [rax + rax + 0x22002960]
02870 418be9                         mov        ebp, r9d
02873 83c510                         add        ebp, 0x10
02876 be6effffff                     mov        esi, 0xffffff6e
0287b 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02880 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02888 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0288d 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02895 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0289a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0289f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
028a4 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
028a9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
028ae 4c89542430                     mov        qword ptr [rsp + 0x30], r10
028b3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028b8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028bd 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
028c2 4489542440                     mov        dword ptr [rsp + 0x40], r10d
028c7 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
028cc 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
028d1 8944244c                       mov        dword ptr [rsp + 0x4c], eax
028d5 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
028da 4489542450                     mov        dword ptr [rsp + 0x50], r10d
028df 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
028e3 90                             nop        
028e4 c5f877                         vzeroupper 
028e7 e8748ab4ff                     call       0x7f05379c3660
028ec 0f1f8400e4290023               nop        dword ptr [rax + rax + 0x230029e4]
028f4 418be9                         mov        ebp, r9d
028f7 83c510                         add        ebp, 0x10
028fa be66ffffff                     mov        esi, 0xffffff66
028ff 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02904 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0290c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02911 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02919 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0291e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02923 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
02928 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0292d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02932 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02937 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0293c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02941 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02946 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0294b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02950 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02955 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02959 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0295e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02963 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02967 90                             nop        
02968 c5f877                         vzeroupper 
0296b e8f089b4ff                     call       0x7f05379c3660
02970 0f1f8400682a0024               nop        dword ptr [rax + rax + 0x24002a68]
02978 be17000000                     mov        esi, 0x17
0297d 666690                         nop        
02980 c5f877                         vzeroupper 
02983 e8d889b4ff                     call       0x7f05379c3660
02988 0f1f8400802a0025               nop        dword ptr [rax + rax + 0x25002a80]
02990 be6effffff                     mov        esi, 0xffffff6e
02995 48899424f0000000               mov        qword ptr [rsp + 0xf0], rdx
0299d 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
029a2 48ff742428                     push       qword ptr [rsp + 0x28]
029a7 488f442420                     pop        qword ptr [rsp + 0x20]
029ac 897c2428                       mov        dword ptr [rsp + 0x28], edi
029b0 4c89442430                     mov        qword ptr [rsp + 0x30], r8
029b5 48ff742440                     push       qword ptr [rsp + 0x40]
029ba 488f442438                     pop        qword ptr [rsp + 0x38]
029bf 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
029c3 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
029c8 4c89742448                     mov        qword ptr [rsp + 0x48], r14
029cd 666690                         nop        
029d0 c5f877                         vzeroupper 
029d3 e88889b4ff                     call       0x7f05379c3660
029d8 0f1f8400d02a0026               nop        dword ptr [rax + rax + 0x26002ad0]
029e0 bebeffffff                     mov        esi, 0xffffffbe
029e5 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
029ed 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
029f2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
029fa 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
029ff 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02a04 48ff742428                     push       qword ptr [rsp + 0x28]
02a09 488f442420                     pop        qword ptr [rsp + 0x20]
02a0e 897c2428                       mov        dword ptr [rsp + 0x28], edi
02a12 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02a17 48ff742440                     push       qword ptr [rsp + 0x40]
02a1c 488f442438                     pop        qword ptr [rsp + 0x38]
02a21 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
02a25 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02a2a 4c89742448                     mov        qword ptr [rsp + 0x48], r14
02a2f 90                             nop        
02a30 c5f877                         vzeroupper 
02a33 e82889b4ff                     call       0x7f05379c3660
02a38 0f1f8400302b0027               nop        dword ptr [rax + rax + 0x27002b30]
02a40 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02a45 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
02a4a bef6ffffff                     mov        esi, 0xfffffff6
02a4f 498bed                         mov        rbp, r13
02a52 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
02a5a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02a62 6690                           nop        
02a64 c5f877                         vzeroupper 
02a67 e8f488b4ff                     call       0x7f05379c3660
02a6c 0f1f8400642b0028               nop        dword ptr [rax + rax + 0x28002b64]
02a74 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a78 eb10                           jmp        0x7f0537e7ad8a
02a7a 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a7e eb0a                           jmp        0x7f0537e7ad8a
02a80 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a84 eb04                           jmp        0x7f0537e7ad8a
02a86 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02a8a beccffffff                     mov        esi, 0xffffffcc
02a8f 4c89ac24f0000000               mov        qword ptr [rsp + 0xf0], r13
02a97 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
02a9f 4c89742410                     mov        qword ptr [rsp + 0x10], r14
02aa4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02aa9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02aae 6690                           nop        
02ab0 c5f877                         vzeroupper 
02ab3 e8a888b4ff                     call       0x7f05379c3660
02ab8 0f1f8400b02b0029               nop        dword ptr [rax + rax + 0x29002bb0]
02ac0 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
02ac4 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
02ac9 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
02ace ebba                           jmp        0x7f0537e7ad8a
02ad0 bee4ffffff                     mov        esi, 0xffffffe4
02ad5 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02ada 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02adf 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02ae7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02aec 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02af4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02af9 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02b01 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02b06 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b0b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02b13 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02b18 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b1d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02b22 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02b27 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02b2c 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02b31 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02b36 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b3b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b40 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b45 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02b4a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02b4f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02b54 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02b59 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02b5d 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02b62 6690                           nop        
02b64 c5f877                         vzeroupper 
02b67 e8f487b4ff                     call       0x7f05379c3660
02b6c 0f1f8400642c002a               nop        dword ptr [rax + rax + 0x2a002c64]
02b74 bee4ffffff                     mov        esi, 0xffffffe4
02b79 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02b7e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02b83 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02b8b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b90 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02b98 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02b9d 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
02ba5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02baa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02baf 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02bb7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02bbc 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02bc1 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02bc6 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02bcb 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02bd0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02bd5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02bda 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02bdf 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02be4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02be9 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02bed 666690                         nop        
02bf0 c5f877                         vzeroupper 
02bf3 e86887b4ff                     call       0x7f05379c3660
02bf8 0f1f8400f02c002b               nop        dword ptr [rax + rax + 0x2b002cf0]
02c00 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02c05 4183c308                       add        r11d, 8
02c09 be6effffff                     mov        esi, 0xffffff6e
02c0e 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02c13 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02c18 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02c20 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c25 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02c2d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02c32 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
02c3a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c3f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c44 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02c49 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02c4e 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02c53 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02c58 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c5d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c62 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c67 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02c6c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02c71 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02c75 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02c7a 6690                           nop        
02c7c c5f877                         vzeroupper 
02c7f e8dc86b4ff                     call       0x7f05379c3660
02c84 0f1f84007c2d002c               nop        dword ptr [rax + rax + 0x2c002d7c]
02c8c 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02c91 4183c308                       add        r11d, 8
02c95 be66ffffff                     mov        esi, 0xffffff66
02c9a 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02c9f 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02ca4 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
02cac 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02cb1 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02cb9 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02cbe 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
02cc6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ccb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02cd0 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02cd5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02cda 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02cdf 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02ce4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ce9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02cee 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02cf3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02cf8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02cfd 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02d01 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02d06 6690                           nop        
02d08 c5f877                         vzeroupper 
02d0b e85086b4ff                     call       0x7f05379c3660
02d10 0f1f8400082e002d               nop        dword ptr [rax + rax + 0x2d002e08]
02d18 beccffffff                     mov        esi, 0xffffffcc
02d1d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02d22 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02d27 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02d2f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d34 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02d3c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02d41 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02d49 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02d4e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02d53 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02d5b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02d60 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02d65 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02d6a 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
02d6f 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02d74 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d79 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d7e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02d83 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02d88 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02d8d 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02d92 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02d97 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02d9c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02da1 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
02da6 89442468                       mov        dword ptr [rsp + 0x68], eax
02daa 6690                           nop        
02dac c5f877                         vzeroupper 
02daf e8ac85b4ff                     call       0x7f05379c3660
02db4 0f1f8400ac2e002e               nop        dword ptr [rax + rax + 0x2e002eac]
02dbc bee4ffffff                     mov        esi, 0xffffffe4
02dc1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02dc6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02dcb 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02dd3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02dd8 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02de0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02de5 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02ded 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02df2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02df7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02dff 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02e04 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02e09 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02e0e 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02e13 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02e18 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02e1d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e22 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02e27 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02e2c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02e31 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02e36 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02e3b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02e3f 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02e44 c5f877                         vzeroupper 
02e47 e81485b4ff                     call       0x7f05379c3660
02e4c 0f1f8400442f002f               nop        dword ptr [rax + rax + 0x2f002f44]
02e54 c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
02e5d bee4ffffff                     mov        esi, 0xffffffe4
02e62 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02e67 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02e6c 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
02e74 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02e79 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02e81 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02e86 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02e8e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e93 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02e98 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02ea0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02ea5 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02eaa 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02eaf 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02eb4 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02eb9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ebe 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ec3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ec8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02ecd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02ed2 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02ed7 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02edc 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02ee0 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
02ee5 666690                         nop        
02ee8 c5f877                         vzeroupper 
02eeb e87084b4ff                     call       0x7f05379c3660
02ef0 0f1f8400e82f0030               nop        dword ptr [rax + rax + 0x30002fe8]
02ef8 4183c610                       add        r14d, 0x10
02efc be6effffff                     mov        esi, 0xffffff6e
02f01 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02f06 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02f0e 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f13 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02f1b 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02f20 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f25 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02f2a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02f2f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f34 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f39 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02f3e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f43 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02f48 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02f4d 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02f51 666690                         nop        
02f54 c5f877                         vzeroupper 
02f57 e80484b4ff                     call       0x7f05379c3660
02f5c 0f1f840054300031               nop        dword ptr [rax + rax + 0x31003054]
02f64 4183c610                       add        r14d, 0x10
02f68 be66ffffff                     mov        esi, 0xffffff66
02f6d 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02f72 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02f7a 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f7f 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02f87 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02f8c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f91 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02f96 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02f9b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02fa0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02fa5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02faa 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02faf 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02fb4 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02fb9 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02fbd 666690                         nop        
02fc0 c5f877                         vzeroupper 
02fc3 e89883b4ff                     call       0x7f05379c3660
02fc8 0f1f8400c0300032               nop        dword ptr [rax + rax + 0x320030c0]
02fd0 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02fd5 4533c9                         xor        r9d, r9d
02fd8 458bd3                         mov        r10d, r11d
02fdb e96afaffff                     jmp        0x7f0537e7ad4a
02fe0 bef6ffffff                     mov        esi, 0xfffffff6
02fe5 666690                         nop        
02fe8 c5f877                         vzeroupper 
02feb e87083b4ff                     call       0x7f05379c3660
02ff0 0f1f8400e8300033               nop        dword ptr [rax + rax + 0x330030e8]
02ff8 488bf0                         mov        rsi, rax
02ffb c5f877                         vzeroupper 
02ffe 4881c4e0000000                 add        rsp, 0xe0
03005 5d                             pop        rbp
03006 e95502b5ff                     jmp        0x7f05379cb560
0300b 49ba1190e737057f0000           movabs     r10, 0x7f0537e79011
03015 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0301c e9bf2ba8ff                     jmp        0x7f05378fdee0
03021 e87af7a6ff                     call       0x7f05378eaaa0
03026 e913d0ffff                     jmp        0x7f0537e7833e
0302b f4                             hlt        
0302c f4                             hlt        
0302d f4                             hlt        
0302e f4                             hlt        
0302f f4                             hlt        
