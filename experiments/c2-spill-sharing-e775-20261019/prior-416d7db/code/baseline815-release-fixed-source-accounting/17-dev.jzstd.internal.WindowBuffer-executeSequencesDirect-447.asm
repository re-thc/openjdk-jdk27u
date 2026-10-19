00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f854030a8ff                   jne        0x7f1e7f90f960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8540330000                   jne        0x7f1e7fe8fc7e
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 448bd7                         mov        r10d, edi
0004e 488bde                         mov        rbx, rsi
00051 8b463c                         mov        eax, dword ptr [rsi + 0x3c]
00054 8b6e38                         mov        ebp, dword ptr [rsi + 0x38]
00057 448bdd                         mov        r11d, ebp
0005a 442bd8                         sub        r11d, eax
0005d 8b8c24d0000000                 mov        ecx, dword ptr [rsp + 0xd0]
00064 413bcb                         cmp        ecx, r11d
00067 0f8fc3280000                   jg         0x7f1e7fe8f230
0006d 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00071 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00075 4c639c24d0000000               movsxd     r11, dword ptr [rsp + 0xd0]
0007d 4863c8                         movsxd     rcx, eax
00080 4903c8                         add        rcx, r8
00083 4c2bc9                         sub        r9, rcx
00086 4d3bd9                         cmp        r11, r9
00089 0f8fa1280000                   jg         0x7f1e7fe8f230
0008f 488b7e10                       mov        rdi, qword ptr [rsi + 0x10]
00093 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00097 4d85c9                         test       r9, r9
0009a 0f84200f0000                   je         0x7f1e7fe8d8c0
000a0 4533ed                         xor        r13d, r13d
000a3 4c8bda                         mov        r11, rdx
000a6 8b7208                         mov        esi, dword ptr [rdx + 8]
000a9 448b7344                       mov        r14d, dword ptr [rbx + 0x44]
000ad 4585d2                         test       r10d, r10d
000b0 0f8e861e0000                   jle        0x7f1e7fe8e83c
000b6 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
000bd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000c2 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000c7 48895c2478                     mov        qword ptr [rsp + 0x78], rbx
000cc 4d2bc8                         sub        r9, r8
000cf 448d5ee0                       lea        r11d, [rsi - 0x20]
000d3 83c5e0                         add        ebp, -0x20
000d6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000db 418b4a08                       mov        ecx, dword ptr [r10 + 8]
000df 85c9                           test       ecx, ecx
000e1 0f8661280000                   jbe        0x7f1e7fe8f248
000e7 4c63d1                         movsxd     r10, ecx
000ea 48634c2438                     movsxd     rcx, dword ptr [rsp + 0x38]
000ef 48ffc9                         dec        rcx
000f2 493bca                         cmp        rcx, r10
000f5 0f834d280000                   jae        0x7f1e7fe8f248
000fb 4c8b9424d8000000               mov        r10, qword ptr [rsp + 0xd8]
00103 418b5a08                       mov        ebx, dword ptr [r10 + 8]
00107 85db                           test       ebx, ebx
00109 0f8671280000                   jbe        0x7f1e7fe8f280
0010f 83fb01                         cmp        ebx, 1
00112 0f8668280000                   jbe        0x7f1e7fe8f280
00118 83fb02                         cmp        ebx, 2
0011b 0f865f280000                   jbe        0x7f1e7fe8f280
00121 448d56f1                       lea        r10d, [rsi - 0xf]
00125 4585d2                         test       r10d, r10d
00128 0f8c52280000                   jl         0x7f1e7fe8f280
0012e 418b4e08                       mov        ecx, dword ptr [r14 + 8]
00132 448d51f1                       lea        r10d, [rcx - 0xf]
00136 4585d2                         test       r10d, r10d
00139 0f8c41280000                   jl         0x7f1e7fe8f280
0013f 448d51fd                       lea        r10d, [rcx - 3]
00143 4585d2                         test       r10d, r10d
00146 0f8c34280000                   jl         0x7f1e7fe8f280
0014c 448d51f9                       lea        r10d, [rcx - 7]
00150 4585d2                         test       r10d, r10d
00153 0f8c27280000                   jl         0x7f1e7fe8f280
00159 894c2404                       mov        dword ptr [rsp + 4], ecx
0015d 899c24d4000000                 mov        dword ptr [rsp + 0xd4], ebx
00164 896c2464                       mov        dword ptr [rsp + 0x64], ebp
00168 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0016d 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
00174 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00179 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0017e 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
00183 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00188 498bde                         mov        rbx, r14
0018b 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00190 4489742460                     mov        dword ptr [rsp + 0x60], r14d
00195 448be9                         mov        r13d, ecx
00198 8bde                           mov        ebx, esi
0019a 895c2418                       mov        dword ptr [rsp + 0x18], ebx
0019e 418d5df9                       lea        ebx, [r13 - 7]
001a2 895c2468                       mov        dword ptr [rsp + 0x68], ebx
001a6 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
001aa 83c3f1                         add        ebx, -0xf
001ad 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
001b1 418d5dfd                       lea        ebx, [r13 - 3]
001b5 895c2458                       mov        dword ptr [rsp + 0x58], ebx
001b9 4963dd                         movsxd     rbx, r13d
001bc 4183c5f1                       add        r13d, -0xf
001c0 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
001c8 4c8d6bf9                       lea        r13, [rbx - 7]
001cc 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
001d4 4883c3f1                       add        rbx, -0xf
001d8 48899c2490000000               mov        qword ptr [rsp + 0x90], rbx
001e0 4533d2                         xor        r10d, r10d
001e3 33db                           xor        ebx, ebx
001e5 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
001ec e91f040000                     jmp        0x7f1e7fe8cf10
001f1 448bd5                         mov        r10d, ebp
001f4 4d63d2                         movsxd     r10, r10d
001f7 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001fe c442a8f5db                     bzhi       r11, r11, r10
00203 c4c1fb92fb                     kmovq      k7, r11
00208 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0020e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00214 4403ed                         add        r13d, ebp
00217 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0021b 418502                         test       dword ptr [r10], eax
0021e 443b6c2448                     cmp        r13d, dword ptr [rsp + 0x48]
00223 0f8dbe030000                   jge        0x7f1e7fe8cee7
00229 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0022e 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00233 452bd5                         sub        r10d, r13d
00236 458bca                         mov        r9d, r10d
00239 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
0023d 412bed                         sub        ebp, r13d
00240 413bed                         cmp        ebp, r13d
00243 410f4fed                       cmovg      ebp, r13d
00247 4585d2                         test       r10d, r10d
0024a 0f8cfc210000                   jl         0x7f1e7fe8ed4c
00250 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00255 4585f6                         test       r14d, r14d
00258 0f8cee210000                   jl         0x7f1e7fe8ed4c
0025e 458d1429                       lea        r10d, [r9 + rbp]
00262 448b742404                     mov        r14d, dword ptr [rsp + 4]
00267 453bf2                         cmp        r14d, r10d
0026a 0f82dc210000                   jb         0x7f1e7fe8ed4c
00270 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00275 4403f5                         add        r14d, ebp
00278 448b542404                     mov        r10d, dword ptr [rsp + 4]
0027d 453bd6                         cmp        r10d, r14d
00280 0f82c6210000                   jb         0x7f1e7fe8ed4c
00286 85ed                           test       ebp, ebp
00288 0f8cbe210000                   jl         0x7f1e7fe8ed4c
0028e 85ed                           test       ebp, ebp
00290 0f847effffff                   je         0x7f1e7fe8cb14
00296 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0029b 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
002a0 4b8d74100c                     lea        rsi, [r8 + r10 + 0xc]
002a5 458bd1                         mov        r10d, r9d
002a8 4b8d7c100c                     lea        rdi, [r8 + r10 + 0xc]
002ad 4863d5                         movsxd     rdx, ebp
002b0 4883fa20                       cmp        rdx, 0x20
002b4 0f8637ffffff                   jbe        0x7f1e7fe8caf1
002ba c5f877                         vzeroupper 
002bd 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
002c7 41ffd2                         call       r10
002ca 0f1f840000000000               nop        dword ptr [rax + rax]
002d2 e93dffffff                     jmp        0x7f1e7fe8cb14
002d7 48894424f8                     mov        qword ptr [rsp - 8], rax
002dc 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002e0 89442444                       mov        dword ptr [rsp + 0x44], eax
002e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
002e9 4585ed                         test       r13d, r13d
002ec 0f8e4e120000                   jle        0x7f1e7fe8de40
002f2 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
002f7 44034c245c                     add        r9d, dword ptr [rsp + 0x5c]
002fc 443b4c2464                     cmp        r9d, dword ptr [rsp + 0x64]
00301 0f8f99130000                   jg         0x7f1e7fe8dfa0
00307 458d041a                       lea        r8d, [r10 + rbx]
0030b 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00313 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00318 0f8f3e140000                   jg         0x7f1e7fe8e05c
0031e 83fb10                         cmp        ebx, 0x10
00321 0f8f66060000                   jg         0x7f1e7fe8d28d
00327 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
0032c 0f833c0f0000                   jae        0x7f1e7fe8db6e
00332 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00337 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
0033e 3b842484000000                 cmp        eax, dword ptr [rsp + 0x84]
00345 0f83e90f0000                   jae        0x7f1e7fe8dc34
0034b 468d3413                       lea        r14d, [rbx + r10]
0034f 4489b42498000000               mov        dword ptr [rsp + 0x98], r14d
00357 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
0035c c4c17a7f44060c                 vmovdqu    xmmword ptr [r14 + rax + 0xc], xmm0
00363 03d8                           add        ebx, eax
00365 448bf3                         mov        r14d, ebx
00368 452bf5                         sub        r14d, r13d
0036b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00370 4183f810                       cmp        r8d, 0x10
00374 7f44                           jg         0x7f1e7fe8ccba
00376 4183fd10                       cmp        r13d, 0x10
0037a 7c3e                           jl         0x7f1e7fe8ccba
0037c 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
00384 0f8376100000                   jae        0x7f1e7fe8dd00
0038a 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
0038f c4817a6f44350c                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 0xc]
00396 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
0039d 0f83e9100000                   jae        0x7f1e7fe8dd8c
003a3 c4c17a7f441d0c                 vmovdqu    xmmword ptr [r13 + rbx + 0xc], xmm0
003aa 4403c3                         add        r8d, ebx
003ad 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
003b5 e92d020000                     jmp        0x7f1e7fe8cee7
003ba 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
003bf 4b8d7c330c                     lea        rdi, [r11 + r14 + 0xc]
003c4 498d741b0c                     lea        rsi, [r11 + rbx + 0xc]
003c9 458d1c18                       lea        r11d, [r8 + rbx]
003cd 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
003d5 4d63cb                         movsxd     r9, r11d
003d8 453be8                         cmp        r13d, r8d
003db 0f8ccd030000                   jl         0x7f1e7fe8d0ae
003e1 4183f830                       cmp        r8d, 0x30
003e5 0f8e8e000000                   jle        0x7f1e7fe8cd79
003eb 4585f6                         test       r14d, r14d
003ee 0f8ca8180000                   jl         0x7f1e7fe8e59c
003f4 85db                           test       ebx, ebx
003f6 0f8ca0180000                   jl         0x7f1e7fe8e59c
003fc 478d2c30                       lea        r13d, [r8 + r14]
00400 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00405 453bdd                         cmp        r11d, r13d
00408 0f828e180000                   jb         0x7f1e7fe8e59c
0040e 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00416 0f8280180000                   jb         0x7f1e7fe8e59c
0041c 4585c0                         test       r8d, r8d
0041f 0f846f180000                   je         0x7f1e7fe8e594
00425 4963d0                         movsxd     rdx, r8d
00428 4883fa20                       cmp        rdx, 0x20
0042c 772b                           ja         0x7f1e7fe8cd59
0042e 458be8                         mov        r13d, r8d
00431 4d63d5                         movsxd     r10, r13d
00434 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0043b c442a8f5db                     bzhi       r11, r11, r10
00440 c4c1fb92fb                     kmovq      k7, r11
00445 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0044b 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00451 418be8                         mov        ebp, r8d
00454 e985010000                     jmp        0x7f1e7fe8cede
00459 418be8                         mov        ebp, r8d
0045c c5f877                         vzeroupper 
0045f 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00469 41ffd2                         call       r10
0046c 0f1f840000000000               nop        dword ptr [rax + rax]
00474 e965010000                     jmp        0x7f1e7fe8cede
00479 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
0047e 0f83c4140000                   jae        0x7f1e7fe8e248
00484 4d63d6                         movsxd     r10, r14d
00487 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
0048c 4f8b5c150c                     mov        r11, qword ptr [r13 + r10 + 0xc]
00491 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
00495 0f8391150000                   jae        0x7f1e7fe8e32c
0049b 8bfb                           mov        edi, ebx
0049d 8d4f08                         lea        ecx, [rdi + 8]
004a0 4863d7                         movsxd     rdx, edi
004a3 4d895c150c                     mov        qword ptr [r13 + rdx + 0xc], r11
004a8 3b8c249c000000                 cmp        ecx, dword ptr [rsp + 0x9c]
004af 7c08                           jl         0x7f1e7fe8cdb9
004b1 418be8                         mov        ebp, r8d
004b4 e925010000                     jmp        0x7f1e7fe8cede
004b9 4c2bd2                         sub        r10, rdx
004bc 4863d1                         movsxd     rdx, ecx
004bf 4e8d1c12                       lea        r11, [rdx + r10]
004c3 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
004cb 0f8333160000                   jae        0x7f1e7fe8e404
004d1 4d8bd9                         mov        r11, r9
004d4 4c2bda                         sub        r11, rdx
004d7 4983c307                       add        r11, 7
004db 4983e3f8                       and        r11, 0xfffffffffffffff8
004df 458bdb                         mov        r11d, r11d
004e2 418d543b08                     lea        edx, [r11 + rdi + 8]
004e7 4c63da                         movsxd     r11, edx
004ea 4f8d5413f8                     lea        r10, [r11 + r10 - 8]
004ef 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
004f7 0f8307160000                   jae        0x7f1e7fe8e404
004fd 3b4c2468                       cmp        ecx, dword ptr [rsp + 0x68]
00501 0f83fd150000                   jae        0x7f1e7fe8e404
00507 4983c3f8                       add        r11, -8
0050b 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00513 0f83eb150000                   jae        0x7f1e7fe8e404
00519 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00521 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00528 0f8fa6160000                   jg         0x7f1e7fe8e4d4
0052e 442bf7                         sub        r14d, edi
00531 83c710                         add        edi, 0x10
00534 418be8                         mov        ebp, r8d
00537 458d1c0e                       lea        r11d, [r14 + rcx]
0053b 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00540 4f8b5c1d0c                     mov        r11, qword ptr [r13 + r11 + 0xc]
00545 448bd1                         mov        r10d, ecx
00548 4f895c150c                     mov        qword ptr [r13 + r10 + 0xc], r11
0054d 83c108                         add        ecx, 8
00550 3bcf                           cmp        ecx, edi
00552 7ce3                           jl         0x7f1e7fe8ce37
00554 4983c1f8                       add        r9, -8
00558 4981f900000080                 cmp        r9, -0x80000000
0055f 49c7c200000080                 mov        r10, 0xffffffff80000000
00566 4d0f4cca                       cmovl      r9, r10
0056a 418bf9                         mov        edi, r9d
0056d 3bcf                           cmp        ecx, edi
0056f 7d42                           jge        0x7f1e7fe8ceb3
00571 0f1f840000000000               nop        dword ptr [rax + rax]
00579 0f1f8000000000                 nop        dword ptr [rax]
00580 458d140e                       lea        r10d, [r14 + rcx]
00584 448bc1                         mov        r8d, ecx
00587 4d63c8                         movsxd     r9, r8d
0058a 458bc2                         mov        r8d, r10d
0058d 4f8b44050c                     mov        r8, qword ptr [r13 + r8 + 0xc]
00592 4963d2                         movsxd     rdx, r10d
00595 448bd1                         mov        r10d, ecx
00598 4f8944150c                     mov        qword ptr [r13 + r10 + 0xc], r8
0059d 4d8b541514                     mov        r10, qword ptr [r13 + rdx + 0x14]
005a2 4f89540d14                     mov        qword ptr [r13 + r9 + 0x14], r10
005a7 83c110                         add        ecx, 0x10
005aa 3bcf                           cmp        ecx, edi
005ac 7cd2                           jl         0x7f1e7fe8ce80
005ae 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
005b3 3b8c249c000000                 cmp        ecx, dword ptr [rsp + 0x9c]
005ba 7d22                           jge        0x7f1e7fe8cede
005bc 458d140e                       lea        r10d, [r14 + rcx]
005c0 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
005c5 4f8b54150c                     mov        r10, qword ptr [r13 + r10 + 0xc]
005ca 448bd9                         mov        r11d, ecx
005cd 4f89541d0c                     mov        qword ptr [r13 + r11 + 0xc], r10
005d2 83c108                         add        ecx, 8
005d5 3b8c249c000000                 cmp        ecx, dword ptr [rsp + 0x9c]
005dc 7cde                           jl         0x7f1e7fe8cebc
005de 03dd                           add        ebx, ebp
005e0 899c249c000000                 mov        dword ptr [rsp + 0x9c], ebx
005e7 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
005ee ffc3                           inc        ebx
005f0 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
005f4 0f8d6d050000                   jge        0x7f1e7fe8d467
005fa 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00602 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
00609 899c24a0000000                 mov        dword ptr [rsp + 0xa0], ebx
00610 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00615 8b9c24a0000000                 mov        ebx, dword ptr [rsp + 0xa0]
0061c 4d8b5cdb10                     mov        r11, qword ptr [r11 + rbx*8 + 0x10]
00621 418bdb                         mov        ebx, r11d
00624 81e3ffff0100                   and        ebx, 0x1ffff
0062a 4d8bc3                         mov        r8, r11
0062d 49c1e812                       shr        r8, 0x12
00631 49c1fb24                       sar        r11, 0x24
00635 458bf0                         mov        r14d, r8d
00638 458beb                         mov        r13d, r11d
0063b 4181e6ffff0300                 and        r14d, 0x3ffff
00642 4489742448                     mov        dword ptr [rsp + 0x48], r14d
00647 4585ed                         test       r13d, r13d
0064a 0f8c180f0000                   jl         0x7f1e7fe8de68
00650 85db                           test       ebx, ebx
00652 0f8596000000                   jne        0x7f1e7fe8cfee
00658 33db                           xor        ebx, ebx
0065a 4183fd03                       cmp        r13d, 3
0065e 0f8ebc000000                   jle        0x7f1e7fe8d020
00664 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
0066c 458b5b10                       mov        r11d, dword ptr [r11 + 0x10]
00670 4c8b8424d8000000               mov        r8, qword ptr [rsp + 0xd8]
00678 45895814                       mov        dword ptr [r8 + 0x14], r11d
0067c 458b400c                       mov        r8d, dword ptr [r8 + 0xc]
00680 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00688 45894310                       mov        dword ptr [r11 + 0x10], r8d
0068c 4183c5fd                       add        r13d, -3
00690 45896b0c                       mov        dword ptr [r11 + 0xc], r13d
00694 4963ed                         movsxd     rbp, r13d
00697 4c63d8                         movsxd     r11, eax
0069a 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
0069f 4863d3                         movsxd     rdx, ebx
006a2 4c03da                         add        r11, rdx
006a5 493beb                         cmp        rbp, r11
006a8 0f8f520f0000                   jg         0x7f1e7fe8df00
006ae 448d3418                       lea        r14d, [rax + rbx]
006b2 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
006b7 452bf5                         sub        r14d, r13d
006ba 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
006bf 4585c9                         test       r9d, r9d
006c2 0f850ffcffff                   jne        0x7f1e7fe8cbd7
006c8 4d63c6                         movsxd     r8, r14d
006cb 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
006d0 0f8c2a110000                   jl         0x7f1e7fe8e100
006d6 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
006db 0f8fc3110000                   jg         0x7f1e7fe8e1a4
006e1 4533c0                         xor        r8d, r8d
006e4 4489442444                     mov        dword ptr [rsp + 0x44], r8d
006e9 e9fbfbffff                     jmp        0x7f1e7fe8cbe9
006ee 448b0424                       mov        r8d, dword ptr [rsp]
006f2 452bc2                         sub        r8d, r10d
006f5 413bd8                         cmp        ebx, r8d
006f8 0f8e5cffffff                   jle        0x7f1e7fe8cf5a
006fe be45ffffff                     mov        esi, 0xffffff45
00703 8beb                           mov        ebp, ebx
00705 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0070d 666690                         nop        
00710 c5f877                         vzeroupper 
00713 e848adb4ff                     call       0x7f1e7f9d7d60
00718 0f1f840010080001               nop        dword ptr [rax + rax + 0x1000810]
00720 85db                           test       ebx, ebx
00722 7403                           je         0x7f1e7fe8d027
00724 41ffcd                         dec        r13d
00727 4585ed                         test       r13d, r13d
0072a 750e                           jne        0x7f1e7fe8d03a
0072c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00734 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
00738 eb6c                           jmp        0x7f1e7fe8d0a6
0073a 4183fd03                       cmp        r13d, 3
0073e 0f84701e0000                   je         0x7f1e7fe8eeb4
00744 4183fd02                       cmp        r13d, 2
00748 0f87221f0000                   ja         0x7f1e7fe8ef70
0074e 443bac24d4000000               cmp        r13d, dword ptr [rsp + 0xd4]
00756 0f8324170000                   jae        0x7f1e7fe8e780
0075c 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00764 478b4cab0c                     mov        r9d, dword ptr [r11 + r13*4 + 0xc]
00769 4585ed                         test       r13d, r13d
0076c 7e2c                           jle        0x7f1e7fe8d09a
0076e 458d5dff                       lea        r11d, [r13 - 1]
00772 443b9c24d4000000               cmp        r11d, dword ptr [rsp + 0xd4]
0077a 0f83741d0000                   jae        0x7f1e7fe8edf4
00780 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
00788 478b44ab08                     mov        r8d, dword ptr [r11 + r13*4 + 8]
0078d 478944ab0c                     mov        dword ptr [r11 + r13*4 + 0xc], r8d
00792 41ffcd                         dec        r13d
00795 4585ed                         test       r13d, r13d
00798 7fe6                           jg         0x7f1e7fe8d080
0079a 4c8b9c24d8000000               mov        r11, qword ptr [rsp + 0xd8]
007a2 45894b0c                       mov        dword ptr [r11 + 0xc], r9d
007a6 458be9                         mov        r13d, r9d
007a9 e9e6feffff                     jmp        0x7f1e7fe8cf94
007ae 4183fd10                       cmp        r13d, 0x10
007b2 0f8d26080000                   jge        0x7f1e7fe8d8de
007b8 4183fd08                       cmp        r13d, 8
007bc 0f8da9040000                   jge        0x7f1e7fe8d56b
007c2 4183f810                       cmp        r8d, 0x10
007c6 0f8f2e010000                   jg         0x7f1e7fe8d1fa
007cc 443b742404                     cmp        r14d, dword ptr [rsp + 4]
007d1 0f8380170000                   jae        0x7f1e7fe8e857
007d7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
007dc 430fbe6c320c                   movsx      ebp, byte ptr [r10 + r14 + 0xc]
007e2 3b5c2404                       cmp        ebx, dword ptr [rsp + 4]
007e6 0f8330180000                   jae        0x7f1e7fe8e91c
007ec 41886c1a0c                     mov        byte ptr [r10 + rbx + 0xc], bpl
007f1 448d5301                       lea        r10d, [rbx + 1]
007f5 418bca                         mov        ecx, r10d
007f8 458d5603                       lea        r10d, [r14 + 3]
007fc 443b542404                     cmp        r10d, dword ptr [rsp + 4]
00801 0f83b9180000                   jae        0x7f1e7fe8e9c0
00807 4d63ce                         movsxd     r9, r14d
0080a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0080f 430fbe6c0b0d                   movsx      ebp, byte ptr [r11 + r9 + 0xd]
00815 448d5303                       lea        r10d, [rbx + 3]
00819 443b542404                     cmp        r10d, dword ptr [rsp + 4]
0081e 0f8354190000                   jae        0x7f1e7fe8ea78
00824 4863cb                         movsxd     rcx, ebx
00827 41886c0b0d                     mov        byte ptr [r11 + rcx + 0xd], bpl
0082c 470fbe540b0e                   movsx      r10d, byte ptr [r11 + r9 + 0xe]
00832 4588540b0e                     mov        byte ptr [r11 + rcx + 0xe], r10b
00837 470fbe5c0b0f                   movsx      r11d, byte ptr [r11 + r9 + 0xf]
0083d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00842 45885c0a0f                     mov        byte ptr [r10 + rcx + 0xf], r11b
00847 4183fd08                       cmp        r13d, 8
0084b 0f83cf190000                   jae        0x7f1e7fe8eb20
00851 49bac8df2fe300000000           movabs     r10, 0xe32fdfc8
0085b 470374aa0c                     add        r14d, dword ptr [r10 + r13*4 + 0xc]
00860 4183f804                       cmp        r8d, 4
00864 7e3b                           jle        0x7f1e7fe8d1a1
00866 448d5304                       lea        r10d, [rbx + 4]
0086a 418bfa                         mov        edi, r10d
0086d 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
00872 0f834c1a0000                   jae        0x7f1e7fe8ebc4
00878 458bd6                         mov        r10d, r14d
0087b 418bca                         mov        ecx, r10d
0087e 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00883 438b6c110c                     mov        ebp, dword ptr [r9 + r10 + 0xc]
00888 448bd7                         mov        r10d, edi
0088b 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
00890 0f83061b0000                   jae        0x7f1e7fe8ec9c
00896 448bdb                         mov        r11d, ebx
00899 4d63db                         movsxd     r11, r11d
0089c 43896c1910                     mov        dword ptr [r9 + r11 + 0x10], ebp
008a1 4183f808                       cmp        r8d, 8
008a5 0f8e3cfdffff                   jle        0x7f1e7fe8cee7
008ab 448d5308                       lea        r10d, [rbx + 8]
008af 458bca                         mov        r9d, r10d
008b2 49baf8df2fe300000000           movabs     r10, 0xe32fdff8
008bc 478b5caa0c                     mov        r11d, dword ptr [r10 + r13*4 + 0xc]
008c1 452bf3                         sub        r14d, r11d
008c4 418d6e08                       lea        ebp, [r14 + 8]
008c8 3b6c2468                       cmp        ebp, dword ptr [rsp + 0x68]
008cc 0f835a1e0000                   jae        0x7f1e7fe8f02c
008d2 4d63d6                         movsxd     r10, r14d
008d5 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
008da 4b8b6c1514                     mov        rbp, qword ptr [r13 + r10 + 0x14]
008df 458bd1                         mov        r10d, r9d
008e2 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
008e7 0f83ef1e0000                   jae        0x7f1e7fe8f0dc
008ed 4c63d3                         movsxd     r10, ebx
008f0 4b896c1514                     mov        qword ptr [r13 + r10 + 0x14], rbp
008f5 e9edfcffff                     jmp        0x7f1e7fe8cee7
008fa 4585f6                         test       r14d, r14d
008fd 0f8c651f0000                   jl         0x7f1e7fe8f168
00903 85db                           test       ebx, ebx
00905 0f8c5d1f0000                   jl         0x7f1e7fe8f168
0090b 448b542404                     mov        r10d, dword ptr [rsp + 4]
00910 443bd3                         cmp        r10d, ebx
00913 0f824f1f0000                   jb         0x7f1e7fe8f168
00919 468d1c2b                       lea        r11d, [rbx + r13]
0091d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00922 443b54245c                     cmp        r10d, dword ptr [rsp + 0x5c]
00927 0f823b1f0000                   jb         0x7f1e7fe8f168
0092d 4585ed                         test       r13d, r13d
00930 0f8c321f0000                   jl         0x7f1e7fe8f168
00936 4585ed                         test       r13d, r13d
00939 0f84eff8ffff                   je         0x7f1e7fe8cb2e
0093f 4883fd20                       cmp        rbp, 0x20
00943 7728                           ja         0x7f1e7fe8d26d
00945 458bd5                         mov        r10d, r13d
00948 4d63d2                         movsxd     r10, r10d
0094b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00952 c442a8f5db                     bzhi       r11, r11, r10
00957 c4c1fb92fb                     kmovq      k7, r11
0095c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00962 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00968 e9c1f8ffff                     jmp        0x7f1e7fe8cb2e
0096d 488bd5                         mov        rdx, rbp
00970 c5f877                         vzeroupper 
00973 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
0097d 41ffd2                         call       r10
00980 0f1f840000000000               nop        dword ptr [rax + rax]
00988 e9a1f8ffff                     jmp        0x7f1e7fe8cb2e
0098d 83fb30                         cmp        ebx, 0x30
00990 0f8e98000000                   jle        0x7f1e7fe8d32e
00996 4585d2                         test       r10d, r10d
00999 0f8c51220000                   jl         0x7f1e7fe8f4f0
0099f 85c0                           test       eax, eax
009a1 0f8c49220000                   jl         0x7f1e7fe8f4f0
009a7 448b8424d0000000               mov        r8d, dword ptr [rsp + 0xd0]
009af 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
009b7 0f8233220000                   jb         0x7f1e7fe8f4f0
009bd 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
009c2 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
009c7 0f8223220000                   jb         0x7f1e7fe8f4f0
009cd 85db                           test       ebx, ebx
009cf 743a                           je         0x7f1e7fe8d30b
009d1 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
009d6 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
009db 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
009e0 498d74030c                     lea        rsi, [r11 + rax + 0xc]
009e5 4883fa20                       cmp        rdx, 0x20
009e9 7729                           ja         0x7f1e7fe8d314
009eb 4c63d3                         movsxd     r10, ebx
009ee 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009f5 c442a8f5db                     bzhi       r11, r11, r10
009fa c4c1fb92fb                     kmovq      k7, r11
009ff 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a05 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a0b 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00a0f e957f9ffff                     jmp        0x7f1e7fe8cc6b
00a14 c5f877                         vzeroupper 
00a17 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00a21 41ffd2                         call       r10
00a24 0f1f840000000000               nop        dword ptr [rax + rax]
00a2c ebdd                           jmp        0x7f1e7fe8d30b
00a2e 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00a33 0f83cb1f0000                   jae        0x7f1e7fe8f304
00a39 4d63ca                         movsxd     r9, r10d
00a3c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00a41 c4817a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xc]
00a48 3b842484000000                 cmp        eax, dword ptr [rsp + 0x84]
00a4f 0f83ab200000                   jae        0x7f1e7fe8f400
00a55 448d5810                       lea        r11d, [rax + 0x10]
00a59 418bfb                         mov        edi, r11d
00a5c 4c63c0                         movsxd     r8, eax
00a5f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00a64 c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
00a6b 448bdf                         mov        r11d, edi
00a6e 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00a73 0f8db4000000                   jge        0x7f1e7fe8d42d
00a79 4d2bc8                         sub        r9, r8
00a7c 4d63c3                         movsxd     r8, r11d
00a7f 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
00a84 4883c1f1                       add        rcx, -0xf
00a88 4f8d1c08                       lea        r11, [r8 + r9]
00a8c 4c3bd9                         cmp        r11, rcx
00a8f 0f832b220000                   jae        0x7f1e7fe8f5c0
00a95 4c635c245c                     movsxd     r11, dword ptr [rsp + 0x5c]
00a9a 4d2bd8                         sub        r11, r8
00a9d 4983c30f                       add        r11, 0xf
00aa1 4983e3f0                       and        r11, 0xfffffffffffffff0
00aa5 458bc3                         mov        r8d, r11d
00aa8 458d5c0010                     lea        r11d, [r8 + rax + 0x10]
00aad 4d63c3                         movsxd     r8, r11d
00ab0 4f8d5c08f0                     lea        r11, [r8 + r9 - 0x10]
00ab5 4c3bd9                         cmp        r11, rcx
00ab8 0f8302220000                   jae        0x7f1e7fe8f5c0
00abe 448bdf                         mov        r11d, edi
00ac1 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
00ac9 0f83f1210000                   jae        0x7f1e7fe8f5c0
00acf 4983c0f0                       add        r8, -0x10
00ad3 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00adb 0f83df210000                   jae        0x7f1e7fe8f5c0
00ae1 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00ae6 4181f8f0ffff7f                 cmp        r8d, 0x7ffffff0
00aed 0f8f89220000                   jg         0x7f1e7fe8f67c
00af3 418bca                         mov        ecx, r10d
00af6 2bc8                           sub        ecx, eax
00af8 0f1f840000000000               nop        dword ptr [rax + rax]
00b00 448d1c39                       lea        r11d, [rcx + rdi]
00b04 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00b09 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
00b10 448bdf                         mov        r11d, edi
00b13 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b18 c4817a7f44190c                 vmovdqu    xmmword ptr [r9 + r11 + 0xc], xmm0
00b1f 448d5f10                       lea        r11d, [rdi + 0x10]
00b23 418bfb                         mov        edi, r11d
00b26 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00b2b 7cd3                           jl         0x7f1e7fe8d400
00b2d 468d1c13                       lea        r11d, [rbx + r10]
00b31 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00b35 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00b3d e929f8ffff                     jmp        0x7f1e7fe8cc6b
00b42 4c63d5                         movsxd     r10, ebp
00b45 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b4c c442a8f5db                     bzhi       r11, r11, r10
00b51 c4c1fb92fb                     kmovq      k7, r11
00b56 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b5c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b62 e9a1000000                     jmp        0x7f1e7fe8d508
00b67 8b2c24                         mov        ebp, dword ptr [rsp]
00b6a 2bac2498000000                 sub        ebp, dword ptr [rsp + 0x98]
00b71 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00b79 4585c0                         test       r8d, r8d
00b7c 0f8c361e0000                   jl         0x7f1e7fe8f2b8
00b82 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
00b87 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00b8c 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00b93 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
00b98 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00ba0 4585c9                         test       r9d, r9d
00ba3 0f8c261e0000                   jl         0x7f1e7fe8f2cf
00ba9 3b3424                         cmp        esi, dword ptr [rsp]
00bac 0f821d1e0000                   jb         0x7f1e7fe8f2cf
00bb2 418b4e08                       mov        ecx, dword ptr [r14 + 8]
00bb6 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00bbe 4403ed                         add        r13d, ebp
00bc1 413bcd                         cmp        ecx, r13d
00bc4 0f82051e0000                   jb         0x7f1e7fe8f2cf
00bca 85ed                           test       ebp, ebp
00bcc 0f8cfd1d0000                   jl         0x7f1e7fe8f2cf
00bd2 85ed                           test       ebp, ebp
00bd4 7432                           je         0x7f1e7fe8d508
00bd6 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
00bdb 4d8bd6                         mov        r10, r14
00bde 4b8d740e0c                     lea        rsi, [r14 + r9 + 0xc]
00be3 4863d5                         movsxd     rdx, ebp
00be6 4883fa20                       cmp        rdx, 0x20
00bea 0f8652ffffff                   jbe        0x7f1e7fe8d442
00bf0 c5f877                         vzeroupper 
00bf3 49ba209f8f7f1e7f0000           movabs     r10, 0x7f1e7f8f9f20
00bfd 41ffd2                         call       r10
00c00 0f1f840000000000               nop        dword ptr [rax + rax]
00c08 44896b3c                       mov        dword ptr [rbx + 0x3c], r13d
00c0c c5f877                         vzeroupper 
00c0f 4881c4c0000000                 add        rsp, 0xc0
00c16 5d                             pop        rbp
00c17 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00c1b 0f8747270000                   ja         0x7f1e7fe8fc68
00c21 c3                             ret        
00c22 458bd3                         mov        r10d, r11d
00c25 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00c2a 8bd9                           mov        ebx, ecx
00c2c 448bd0                         mov        r10d, eax
00c2f 4403542440                     add        r10d, dword ptr [rsp + 0x40]
00c34 62b17e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0xc]
00c3f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00c44 62b17e487f841b0c000000         vmovdqu32  zmmword ptr [rbx + r11 + 0xc], zmm0
00c4f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00c54 4183c240                       add        r10d, 0x40
00c58 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00c5d 443bd7                         cmp        r10d, edi
00c60 7cca                           jl         0x7f1e7fe8d52c
00c62 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00c66 e917030000                     jmp        0x7f1e7fe8d882
00c6b 443b742468                     cmp        r14d, dword ptr [rsp + 0x68]
00c70 0f83c2210000                   jae        0x7f1e7fe8f738
00c76 458bd6                         mov        r10d, r14d
00c79 418bc2                         mov        eax, r10d
00c7c 4963fa                         movsxd     rdi, r10d
00c7f 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00c84 4d8b543d0c                     mov        r10, qword ptr [r13 + rdi + 0xc]
00c89 498bca                         mov        rcx, r10
00c8c 3b5c2468                       cmp        ebx, dword ptr [rsp + 0x68]
00c90 0f8372220000                   jae        0x7f1e7fe8f808
00c96 448bd3                         mov        r10d, ebx
00c99 458d5a08                       lea        r11d, [r10 + 8]
00c9d 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00ca2 4d63c2                         movsxd     r8, r10d
00ca5 4b894c050c                     mov        qword ptr [r13 + r8 + 0xc], rcx
00caa 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00caf 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00cb7 0f8d2af9ffff                   jge        0x7f1e7fe8cee7
00cbd 492bf8                         sub        rdi, r8
00cc0 4963cb                         movsxd     rcx, r11d
00cc3 4c8d1c39                       lea        r11, [rcx + rdi]
00cc7 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00ccf 0f83e3220000                   jae        0x7f1e7fe8f8b8
00cd5 4d8bd9                         mov        r11, r9
00cd8 4c2bd9                         sub        r11, rcx
00cdb 4983c307                       add        r11, 7
00cdf 4983e3f8                       and        r11, 0xfffffffffffffff8
00ce3 458bc3                         mov        r8d, r11d
00ce6 478d5c1008                     lea        r11d, [r8 + r10 + 8]
00ceb 4d63c3                         movsxd     r8, r11d
00cee 4d8d5c38f8                     lea        r11, [r8 + rdi - 8]
00cf3 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00cfb 0f83b7220000                   jae        0x7f1e7fe8f8b8
00d01 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00d06 443b5c2468                     cmp        r11d, dword ptr [rsp + 0x68]
00d0b 0f83a7220000                   jae        0x7f1e7fe8f8b8
00d11 4983c0f8                       add        r8, -8
00d15 4c3b842488000000               cmp        r8, qword ptr [rsp + 0x88]
00d1d 0f8395220000                   jae        0x7f1e7fe8f8b8
00d23 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
00d2b 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00d32 0f8f24230000                   jg         0x7f1e7fe8f95c
00d38 448bd8                         mov        r11d, eax
00d3b 452bda                         sub        r11d, r10d
00d3e 418bc3                         mov        eax, r11d
00d41 baf4ffffff                     mov        edx, 0xfffffff4
00d46 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
00d4b 458bc5                         mov        r8d, r13d
00d4e 412bd0                         sub        edx, r8d
00d51 412bd2                         sub        edx, r10d
00d54 4183c210                       add        r10d, 0x10
00d58 83c2f0                         add        edx, -0x10
00d5b 4d8d59c8                       lea        r11, [r9 - 0x38]
00d5f 4981fb00000080                 cmp        r11, -0x80000000
00d66 49c7c000000080                 mov        r8, 0xffffffff80000000
00d6d 4d0f4cd8                       cmovl      r11, r8
00d71 418bfb                         mov        edi, r11d
00d74 442bf3                         sub        r14d, ebx
00d77 4d63c2                         movsxd     r8, r10d
00d7a 488b5c2410                     mov        rbx, qword ptr [rsp + 0x10]
00d7f 41bb06000000                   mov        r11d, 6
00d85 c462a0f5da                     bzhi       r11, rdx, r11
00d8a 4d03c3                         add        r8, r11
00d8d 4d3bc1                         cmp        r8, r9
00d90 498bd1                         mov        rdx, r9
00d93 490f4cd0                       cmovl      rdx, r8
00d97 4c8bda                         mov        r11, rdx
00d9a 4c2bd9                         sub        r11, rcx
00d9d 4d8d43ff                       lea        r8, [r11 - 1]
00da1 49c1f83f                       sar        r8, 0x3f
00da5 49c1e83d                       shr        r8, 0x3d
00da9 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
00dae 4983e3f8                       and        r11, 0xfffffffffffffff8
00db2 4c03d9                         add        r11, rcx
00db5 493bcb                         cmp        rcx, r11
00db8 490f4ccb                       cmovl      rcx, r11
00dbc 448bc1                         mov        r8d, ecx
00dbf 478d5c0608                     lea        r11d, [r14 + r8 + 8]
00dc4 4183c008                       add        r8d, 8
00dc8 4963cb                         movsxd     rcx, r11d
00dcb 4803cb                         add        rcx, rbx
00dce 4963f0                         movsxd     rsi, r8d
00dd1 4803f3                         add        rsi, rbx
00dd4 4c8d590c                       lea        r11, [rcx + 0xc]
00dd8 4883c14c                       add        rcx, 0x4c
00ddc 488d5e4c                       lea        rbx, [rsi + 0x4c]
00de0 4533c0                         xor        r8d, r8d
00de3 493bdb                         cmp        rbx, r11
00de6 410f96c0                       setbe      r8b
00dea 4883c60c                       add        rsi, 0xc
00dee 4533db                         xor        r11d, r11d
00df1 483bce                         cmp        rcx, rsi
00df4 410f96c3                       setbe      r11b
00df8 450bc3                         or         r8d, r11d
00dfb 0f845f0f0000                   je         0x7f1e7fe8e660
00e01 448bd2                         mov        r10d, edx
00e04 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00e09 448bd8                         mov        r11d, eax
00e0c 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
00e11 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00e15 4e8b5c1b0c                     mov        r11, qword ptr [rbx + r11 + 0xc]
00e1a 4e895c030c                     mov        qword ptr [rbx + r8 + 0xc], r11
00e1f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00e24 4183c308                       add        r11d, 8
00e28 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00e2d 453bda                         cmp        r11d, r10d
00e30 7cd2                           jl         0x7f1e7fe8d704
00e32 4981c108feffff                 add        r9, -0x1f8
00e39 4981f900000080                 cmp        r9, -0x80000000
00e40 49c7c200000080                 mov        r10, 0xffffffff80000000
00e47 4d0f4cca                       cmovl      r9, r10
00e4b 458bd1                         mov        r10d, r9d
00e4e 453bda                         cmp        r11d, r10d
00e51 0f8d2b010000                   jge        0x7f1e7fe8d882
00e57 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00e5c 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00e60 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00e65 4963d0                         movsxd     rdx, r8d
00e68 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00e6d 448bd8                         mov        r11d, eax
00e70 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
00e75 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00e7a 4183c140                       add        r9d, 0x40
00e7e 4403c8                         add        r9d, eax
00e81 418bdb                         mov        ebx, r11d
00e84 62f17e486f84190c000000         vmovdqu32  zmm0, zmmword ptr [rcx + rbx + 0xc]
00e8f 62b17e487f84010c000000         vmovdqu32  zmmword ptr [rcx + r8 + 0xc], zmm0
00e9a 62b17e486f84090c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r9 + 0xc]
00ea5 62f17e487f84114c000000         vmovdqu32  zmmword ptr [rcx + rdx + 0x4c], zmm0
00eb0 4d63cb                         movsxd     r9, r11d
00eb3 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00eb8 4181c380000000                 add        r11d, 0x80
00ebf 4403d8                         add        r11d, eax
00ec2 62b17e486f84190c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 0xc]
00ecd 62f17e487f84118c000000         vmovdqu32  zmmword ptr [rcx + rdx + 0x8c], zmm0
00ed8 62b17e486f8409cc000000         vmovdqu32  zmm0, zmmword ptr [rcx + r9 + 0xcc]
00ee3 62f17e487f8411cc000000         vmovdqu32  zmmword ptr [rcx + rdx + 0xcc], zmm0
00eee 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00ef3 4181c300010000                 add        r11d, 0x100
00efa 4403d8                         add        r11d, eax
00efd 458bc3                         mov        r8d, r11d
00f00 62b17e486f84190c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 0xc]
00f0b 62f17e487f84110c010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x10c], zmm0
00f16 62b17e486f84094c010000         vmovdqu32  zmm0, zmmword ptr [rcx + r9 + 0x14c]
00f21 62f17e487f84114c010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x14c], zmm0
00f2c 62b17e486f84098c010000         vmovdqu32  zmm0, zmmword ptr [rcx + r9 + 0x18c]
00f37 62f17e487f84118c010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x18c], zmm0
00f42 4d63d8                         movsxd     r11, r8d
00f45 62b17e486f8419cc000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 0xcc]
00f50 62f17e487f8411cc010000         vmovdqu32  zmmword ptr [rcx + rdx + 0x1cc], zmm0
00f5b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f60 4181c300020000                 add        r11d, 0x200
00f67 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00f6c 453bda                         cmp        r11d, r10d
00f6f 0f8cebfeffff                   jl         0x7f1e7fe8d760
00f75 443bdf                         cmp        r11d, edi
00f78 0f8ca4fcffff                   jl         0x7f1e7fe8d522
00f7e 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00f82 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00f87 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00f8f 0f8d52f6ffff                   jge        0x7f1e7fe8cee7
00f95 666690                         nop        
00f98 468d1418                       lea        r10d, [rax + r11]
00f9c 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00fa0 4e8b54130c                     mov        r10, qword ptr [rbx + r10 + 0xc]
00fa5 458bc3                         mov        r8d, r11d
00fa8 4e8954030c                     mov        qword ptr [rbx + r8 + 0xc], r10
00fad 4183c308                       add        r11d, 8
00fb1 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00fb9 7cdd                           jl         0x7f1e7fe8d898
00fbb e927f6ffff                     jmp        0x7f1e7fe8cee7
00fc0 4903cb                         add        rcx, r11
00fc3 483bcf                         cmp        rcx, rdi
00fc6 7e08                           jle        0x7f1e7fe8d8d0
00fc8 4533c9                         xor        r9d, r9d
00fcb e9d0f0ffff                     jmp        0x7f1e7fe8c9a0
00fd0 4533c9                         xor        r9d, r9d
00fd3 41bd01000000                   mov        r13d, 1
00fd9 e9c5f0ffff                     jmp        0x7f1e7fe8c9a3
00fde 443bb42484000000               cmp        r14d, dword ptr [rsp + 0x84]
00fe6 0f8304210000                   jae        0x7f1e7fe8f9f0
00fec 4d63c6                         movsxd     r8, r14d
00fef 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ff4 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00ffb 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
01002 0f8384210000                   jae        0x7f1e7fe8fa8c
01008 8d6b10                         lea        ebp, [rbx + 0x10]
0100b 4c63d3                         movsxd     r10, ebx
0100e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01013 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0101a 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01021 0f8dc0f5ffff                   jge        0x7f1e7fe8cee7
01027 4d2bc2                         sub        r8, r10
0102a 4c63dd                         movsxd     r11, ebp
0102d 4f8d1403                       lea        r10, [r11 + r8]
01031 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
01039 0f8301220000                   jae        0x7f1e7fe8fb40
0103f 4d8bd1                         mov        r10, r9
01042 4d2bd3                         sub        r10, r11
01045 4983c20f                       add        r10, 0xf
01049 4983e2f0                       and        r10, 0xfffffffffffffff0
0104d 458bda                         mov        r11d, r10d
01050 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
01055 4d63d2                         movsxd     r10, r10d
01058 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
0105d 4c3b9c2490000000               cmp        r11, qword ptr [rsp + 0x90]
01065 0f83d5210000                   jae        0x7f1e7fe8fb40
0106b 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
01072 0f83c8210000                   jae        0x7f1e7fe8fb40
01078 4983c2f0                       add        r10, -0x10
0107c 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
01084 0f83b6210000                   jae        0x7f1e7fe8fb40
0108a 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01092 4181faf0ffff7f                 cmp        r10d, 0x7ffffff0
01099 0f8f19220000                   jg         0x7f1e7fe8fbb8
0109f 442bf3                         sub        r14d, ebx
010a2 83c320                         add        ebx, 0x20
010a5 666690                         nop        
010a8 458d142e                       lea        r10d, [r14 + rbp]
010ac 448b6c2460                     mov        r13d, dword ptr [rsp + 0x60]
010b1 c4817a6f44150c                 vmovdqu    xmm0, xmmword ptr [r13 + r10 + 0xc]
010b8 448bdd                         mov        r11d, ebp
010bb c4817a7f441d0c                 vmovdqu    xmmword ptr [r13 + r11 + 0xc], xmm0
010c2 83c510                         add        ebp, 0x10
010c5 3beb                           cmp        ebp, ebx
010c7 7cdf                           jl         0x7f1e7fe8d9a8
010c9 4981c110ffffff                 add        r9, -0xf0
010d0 4981f900000080                 cmp        r9, -0x80000000
010d7 49c7c200000080                 mov        r10, 0xffffffff80000000
010de 4d0f4cca                       cmovl      r9, r10
010e2 458bd9                         mov        r11d, r9d
010e5 413beb                         cmp        ebp, r11d
010e8 0f8d48010000                   jge        0x7f1e7fe8db36
010ee 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
010f2 0f1f8000000000                 nop        dword ptr [rax]
010f9 0f1f8000000000                 nop        dword ptr [rax]
01100 458d142e                       lea        r10d, [r14 + rbp]
01104 448bc5                         mov        r8d, ebp
01107 4d63c0                         movsxd     r8, r8d
0110a 458bca                         mov        r9d, r10d
0110d c4a17a6f440b0c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xc]
01114 4d63ca                         movsxd     r9, r10d
01117 448bd5                         mov        r10d, ebp
0111a c4a17a7f44130c                 vmovdqu    xmmword ptr [rbx + r10 + 0xc], xmm0
01121 c4a17a6f440b1c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x1c]
01128 c4a17a7f44031c                 vmovdqu    xmmword ptr [rbx + r8 + 0x1c], xmm0
0112f c4a17a6f440b2c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x2c]
01136 c4a17a7f44032c                 vmovdqu    xmmword ptr [rbx + r8 + 0x2c], xmm0
0113d c4a17a6f440b3c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x3c]
01144 c4a17a7f44033c                 vmovdqu    xmmword ptr [rbx + r8 + 0x3c], xmm0
0114b c4a17a6f440b4c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x4c]
01152 c4a17a7f44034c                 vmovdqu    xmmword ptr [rbx + r8 + 0x4c], xmm0
01159 c4a17a6f440b5c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x5c]
01160 c4a17a7f44035c                 vmovdqu    xmmword ptr [rbx + r8 + 0x5c], xmm0
01167 c4a17a6f440b6c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x6c]
0116e c4a17a7f44036c                 vmovdqu    xmmword ptr [rbx + r8 + 0x6c], xmm0
01175 c4a17a6f440b7c                 vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x7c]
0117c c4a17a7f44037c                 vmovdqu    xmmword ptr [rbx + r8 + 0x7c], xmm0
01183 c4a17a6f840b8c000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x8c]
0118d c4a17a7f84038c000000           vmovdqu    xmmword ptr [rbx + r8 + 0x8c], xmm0
01197 c4a17a6f840b9c000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0x9c]
011a1 c4a17a7f84039c000000           vmovdqu    xmmword ptr [rbx + r8 + 0x9c], xmm0
011ab c4a17a6f840bac000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xac]
011b5 c4a17a7f8403ac000000           vmovdqu    xmmword ptr [rbx + r8 + 0xac], xmm0
011bf c4a17a6f840bbc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xbc]
011c9 c4a17a7f8403bc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xbc], xmm0
011d3 c4a17a6f840bcc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xcc]
011dd c4a17a7f8403cc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xcc], xmm0
011e7 c4a17a6f840bdc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xdc]
011f1 c4a17a7f8403dc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xdc], xmm0
011fb c4a17a6f840bec000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xec]
01205 c4a17a7f8403ec000000           vmovdqu    xmmword ptr [rbx + r8 + 0xec], xmm0
0120f c4a17a6f840bfc000000           vmovdqu    xmm0, xmmword ptr [rbx + r9 + 0xfc]
01219 c4a17a7f8403fc000000           vmovdqu    xmmword ptr [rbx + r8 + 0xfc], xmm0
01223 81c500010000                   add        ebp, 0x100
01229 413beb                         cmp        ebp, r11d
0122c 0f8ccefeffff                   jl         0x7f1e7fe8da00
01232 895c2460                       mov        dword ptr [rsp + 0x60], ebx
01236 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
0123d 0f8da4f3ffff                   jge        0x7f1e7fe8cee7
01243 90                             nop        
01244 458d142e                       lea        r10d, [r14 + rbp]
01248 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0124c c4a17a6f44130c                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 0xc]
01253 448bdd                         mov        r11d, ebp
01256 c4a17a7f441b0c                 vmovdqu    xmmword ptr [rbx + r11 + 0xc], xmm0
0125d 83c510                         add        ebp, 0x10
01260 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
01267 7cdb                           jl         0x7f1e7fe8db44
01269 e979f3ffff                     jmp        0x7f1e7fe8cee7
0126e bee4ffffff                     mov        esi, 0xffffffe4
01273 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01278 448b1c24                       mov        r11d, dword ptr [rsp]
0127c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01284 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01289 4c891c24                       mov        qword ptr [rsp], r11
0128d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01292 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0129a 48894424f8                     mov        qword ptr [rsp - 8], rax
0129f 8b442460                       mov        eax, dword ptr [rsp + 0x60]
012a3 89442408                       mov        dword ptr [rsp + 8], eax
012a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012ac 8944240c                       mov        dword ptr [rsp + 0xc], eax
012b0 48ff742420                     push       qword ptr [rsp + 0x20]
012b5 488f442418                     pop        qword ptr [rsp + 0x18]
012ba 48894424f8                     mov        qword ptr [rsp - 8], rax
012bf 8b442444                       mov        eax, dword ptr [rsp + 0x44]
012c3 89442414                       mov        dword ptr [rsp + 0x14], eax
012c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012cc 48ff742428                     push       qword ptr [rsp + 0x28]
012d1 488f442420                     pop        qword ptr [rsp + 0x20]
012d6 48ff742430                     push       qword ptr [rsp + 0x30]
012db 488f442428                     pop        qword ptr [rsp + 0x28]
012e0 48894424f8                     mov        qword ptr [rsp - 8], rax
012e5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
012e9 89442430                       mov        dword ptr [rsp + 0x30], eax
012ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f2 48894424f8                     mov        qword ptr [rsp - 8], rax
012f7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
012fb 89442434                       mov        dword ptr [rsp + 0x34], eax
012ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01304 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01308 48894424f8                     mov        qword ptr [rsp - 8], rax
0130d 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01311 89442440                       mov        dword ptr [rsp + 0x40], eax
01315 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0131a 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0131f 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01324 c5f877                         vzeroupper 
01327 e834a1b4ff                     call       0x7f1e7f9d7d60
0132c 0f1f840024140002               nop        dword ptr [rax + rax + 0x2001424]
01334 bee4ffffff                     mov        esi, 0xffffffe4
01339 498beb                         mov        rbp, r11
0133c 448b0424                       mov        r8d, dword ptr [rsp]
01340 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01348 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0134d 4c891c24                       mov        qword ptr [rsp], r11
01351 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01356 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0135e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01363 48ff742420                     push       qword ptr [rsp + 0x20]
01368 488f442418                     pop        qword ptr [rsp + 0x18]
0136d 48894424f8                     mov        qword ptr [rsp - 8], rax
01372 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01376 89442414                       mov        dword ptr [rsp + 0x14], eax
0137a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0137f 48ff742428                     push       qword ptr [rsp + 0x28]
01384 488f442420                     pop        qword ptr [rsp + 0x20]
01389 48ff742430                     push       qword ptr [rsp + 0x30]
0138e 488f442428                     pop        qword ptr [rsp + 0x28]
01393 48894424f8                     mov        qword ptr [rsp - 8], rax
01398 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0139c 89442430                       mov        dword ptr [rsp + 0x30], eax
013a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013a5 48894424f8                     mov        qword ptr [rsp - 8], rax
013aa 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
013ae 89442434                       mov        dword ptr [rsp + 0x34], eax
013b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b7 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
013bb 48894424f8                     mov        qword ptr [rsp - 8], rax
013c0 8b442448                       mov        eax, dword ptr [rsp + 0x48]
013c4 89442440                       mov        dword ptr [rsp + 0x40], eax
013c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013cd 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
013d2 48894424f8                     mov        qword ptr [rsp - 8], rax
013d7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
013db 89442448                       mov        dword ptr [rsp + 0x48], eax
013df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e4 8944244c                       mov        dword ptr [rsp + 0x4c], eax
013e8 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
013ee 6690                           nop        
013f0 c5f877                         vzeroupper 
013f3 e868a0b4ff                     call       0x7f1e7f9d7d60
013f8 0f1f8400f0140003               nop        dword ptr [rax + rax + 0x30014f0]
01400 bee4ffffff                     mov        esi, 0xffffffe4
01405 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0140a 448b1424                       mov        r10d, dword ptr [rsp]
0140e 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01416 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0141b 4c891424                       mov        qword ptr [rsp], r10
0141f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01424 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0142c 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01430 48ff742420                     push       qword ptr [rsp + 0x20]
01435 488f442418                     pop        qword ptr [rsp + 0x18]
0143a 48894424f8                     mov        qword ptr [rsp - 8], rax
0143f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01443 89442414                       mov        dword ptr [rsp + 0x14], eax
01447 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0144c 48ff742428                     push       qword ptr [rsp + 0x28]
01451 488f442420                     pop        qword ptr [rsp + 0x20]
01456 48ff742430                     push       qword ptr [rsp + 0x30]
0145b 488f442428                     pop        qword ptr [rsp + 0x28]
01460 48894424f8                     mov        qword ptr [rsp - 8], rax
01465 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01469 89442434                       mov        dword ptr [rsp + 0x34], eax
0146d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01472 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01477 4489742444                     mov        dword ptr [rsp + 0x44], r14d
0147c c5f877                         vzeroupper 
0147f e8dc9fb4ff                     call       0x7f1e7f9d7d60
01484 0f1f84007c150004               nop        dword ptr [rax + rax + 0x400157c]
0148c bee4ffffff                     mov        esi, 0xffffffe4
01491 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01496 448b1424                       mov        r10d, dword ptr [rsp]
0149a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
014a2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014a7 4c891424                       mov        qword ptr [rsp], r10
014ab 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
014b0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
014b8 48ff742420                     push       qword ptr [rsp + 0x20]
014bd 488f442418                     pop        qword ptr [rsp + 0x18]
014c2 48894424f8                     mov        qword ptr [rsp - 8], rax
014c7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
014cb 89442414                       mov        dword ptr [rsp + 0x14], eax
014cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014d4 48ff742428                     push       qword ptr [rsp + 0x28]
014d9 488f442420                     pop        qword ptr [rsp + 0x20]
014de 48ff742430                     push       qword ptr [rsp + 0x30]
014e3 488f442428                     pop        qword ptr [rsp + 0x28]
014e8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ed 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014f1 89442430                       mov        dword ptr [rsp + 0x30], eax
014f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fa 48894424f8                     mov        qword ptr [rsp - 8], rax
014ff 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01503 89442434                       mov        dword ptr [rsp + 0x34], eax
01507 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0150c 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01511 48894424f8                     mov        qword ptr [rsp - 8], rax
01516 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0151a 89442440                       mov        dword ptr [rsp + 0x40], eax
0151e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01523 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01527 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0152d 666690                         nop        
01530 c5f877                         vzeroupper 
01533 e8289fb4ff                     call       0x7f1e7f9d7d60
01538 0f1f840030160005               nop        dword ptr [rax + rax + 0x5001630]
01540 be45ffffff                     mov        esi, 0xffffff45
01545 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0154d 4489ac24d8000000               mov        dword ptr [rsp + 0xd8], r13d
01555 666690                         nop        
01558 c5f877                         vzeroupper 
0155b e8009fb4ff                     call       0x7f1e7f9d7d60
01560 0f1f840058160006               nop        dword ptr [rax + rax + 0x6001658]
01568 be45ffffff                     mov        esi, 0xffffff45
0156d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01572 448b1c24                       mov        r11d, dword ptr [rsp]
01576 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0157e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01583 4c891c24                       mov        qword ptr [rsp], r11
01587 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0158c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01594 8944240c                       mov        dword ptr [rsp + 0xc], eax
01598 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0159d 48ff742420                     push       qword ptr [rsp + 0x20]
015a2 488f442418                     pop        qword ptr [rsp + 0x18]
015a7 48894424f8                     mov        qword ptr [rsp - 8], rax
015ac 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
015b0 89442414                       mov        dword ptr [rsp + 0x14], eax
015b4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015b9 48ff742428                     push       qword ptr [rsp + 0x28]
015be 488f442420                     pop        qword ptr [rsp + 0x20]
015c3 48ff742430                     push       qword ptr [rsp + 0x30]
015c8 488f442428                     pop        qword ptr [rsp + 0x28]
015cd 48894424f8                     mov        qword ptr [rsp - 8], rax
015d2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
015d6 89442434                       mov        dword ptr [rsp + 0x34], eax
015da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015df 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
015e3 4489742440                     mov        dword ptr [rsp + 0x40], r14d
015e8 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
015ed 666690                         nop        
015f0 c5f877                         vzeroupper 
015f3 e8689eb4ff                     call       0x7f1e7f9d7d60
015f8 0f1f8400f0160007               nop        dword ptr [rax + rax + 0x70016f0]
01600 493beb                         cmp        rbp, r11
01603 bdffffffff                     mov        ebp, 0xffffffff
01608 7c08                           jl         0x7f1e7fe8df12
0160a 400f95c5                       setne      bpl
0160e 400fb6ed                       movzx      ebp, bpl
01612 be45ffffff                     mov        esi, 0xffffff45
01617 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0161c 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01624 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01629 44894c2404                     mov        dword ptr [rsp + 4], r9d
0162e 48894424f8                     mov        qword ptr [rsp - 8], rax
01633 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01637 89442410                       mov        dword ptr [rsp + 0x10], eax
0163b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01640 89442414                       mov        dword ptr [rsp + 0x14], eax
01644 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01649 48894424f8                     mov        qword ptr [rsp - 8], rax
0164e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01652 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01656 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0165b 48894424f8                     mov        qword ptr [rsp - 8], rax
01660 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01664 89442438                       mov        dword ptr [rsp + 0x38], eax
01668 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0166d 48894424f8                     mov        qword ptr [rsp - 8], rax
01672 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01676 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0167a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0167f 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01683 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01688 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0168d 666690                         nop        
01690 c5f877                         vzeroupper 
01693 e8c89db4ff                     call       0x7f1e7f9d7d60
01698 0f1f840090170008               nop        dword ptr [rax + rax + 0x8001790]
016a0 be45ffffff                     mov        esi, 0xffffff45
016a5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
016aa 448b1c24                       mov        r11d, dword ptr [rsp]
016ae 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
016b6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
016bb 4c891c24                       mov        qword ptr [rsp], r11
016bf 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
016c4 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
016cc 48894424f8                     mov        qword ptr [rsp - 8], rax
016d1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
016d5 89442408                       mov        dword ptr [rsp + 8], eax
016d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016de 8944240c                       mov        dword ptr [rsp + 0xc], eax
016e2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016e7 48ff742420                     push       qword ptr [rsp + 0x20]
016ec 488f442418                     pop        qword ptr [rsp + 0x18]
016f1 48894424f8                     mov        qword ptr [rsp - 8], rax
016f6 8b442444                       mov        eax, dword ptr [rsp + 0x44]
016fa 89442414                       mov        dword ptr [rsp + 0x14], eax
016fe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01703 48ff742428                     push       qword ptr [rsp + 0x28]
01708 488f442420                     pop        qword ptr [rsp + 0x20]
0170d 48ff742430                     push       qword ptr [rsp + 0x30]
01712 488f442428                     pop        qword ptr [rsp + 0x28]
01717 48894424f8                     mov        qword ptr [rsp - 8], rax
0171c 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01720 89442434                       mov        dword ptr [rsp + 0x34], eax
01724 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01729 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0172d 48894424f8                     mov        qword ptr [rsp - 8], rax
01732 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01736 89442440                       mov        dword ptr [rsp + 0x40], eax
0173a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0173f 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01744 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01749 666690                         nop        
0174c c5f877                         vzeroupper 
0174f e80c9db4ff                     call       0x7f1e7f9d7d60
01754 0f1f84004c180009               nop        dword ptr [rax + rax + 0x900184c]
0175c be45ffffff                     mov        esi, 0xffffff45
01761 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01766 448b1c24                       mov        r11d, dword ptr [rsp]
0176a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01772 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01777 4c891c24                       mov        qword ptr [rsp], r11
0177b 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01780 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01788 48894424f8                     mov        qword ptr [rsp - 8], rax
0178d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01791 89442408                       mov        dword ptr [rsp + 8], eax
01795 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179a 8944240c                       mov        dword ptr [rsp + 0xc], eax
0179e 4489542410                     mov        dword ptr [rsp + 0x10], r10d
017a3 48ff742420                     push       qword ptr [rsp + 0x20]
017a8 488f442418                     pop        qword ptr [rsp + 0x18]
017ad 48894424f8                     mov        qword ptr [rsp - 8], rax
017b2 8b442444                       mov        eax, dword ptr [rsp + 0x44]
017b6 89442414                       mov        dword ptr [rsp + 0x14], eax
017ba 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017bf 48ff742428                     push       qword ptr [rsp + 0x28]
017c4 488f442420                     pop        qword ptr [rsp + 0x20]
017c9 48ff742430                     push       qword ptr [rsp + 0x30]
017ce 488f442428                     pop        qword ptr [rsp + 0x28]
017d3 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
017d7 48894424f8                     mov        qword ptr [rsp - 8], rax
017dc 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017e0 89442440                       mov        dword ptr [rsp + 0x40], eax
017e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
017ee 6690                           nop        
017f0 c5f877                         vzeroupper 
017f3 e8689cb4ff                     call       0x7f1e7f9d7d60
017f8 0f1f8400f018000a               nop        dword ptr [rax + rax + 0xa0018f0]
01800 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
01805 4d3bc1                         cmp        r8, r9
01808 bdffffffff                     mov        ebp, 0xffffffff
0180d 7c08                           jl         0x7f1e7fe8e117
0180f 400f95c5                       setne      bpl
01813 400fb6ed                       movzx      ebp, bpl
01817 be45ffffff                     mov        esi, 0xffffff45
0181c 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01821 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01829 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0182e 44894c2404                     mov        dword ptr [rsp + 4], r9d
01833 48894424f8                     mov        qword ptr [rsp - 8], rax
01838 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0183c 89442410                       mov        dword ptr [rsp + 0x10], eax
01840 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01845 89442414                       mov        dword ptr [rsp + 0x14], eax
01849 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0184e 48894424f8                     mov        qword ptr [rsp - 8], rax
01853 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01857 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0185b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01860 48894424f8                     mov        qword ptr [rsp - 8], rax
01865 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01869 89442438                       mov        dword ptr [rsp + 0x38], eax
0186d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01872 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01876 48894424f8                     mov        qword ptr [rsp - 8], rax
0187b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0187f 89442444                       mov        dword ptr [rsp + 0x44], eax
01883 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01888 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
0188d 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01892 6690                           nop        
01894 c5f877                         vzeroupper 
01897 e8c49bb4ff                     call       0x7f1e7f9d7d60
0189c 0f1f84009419000b               nop        dword ptr [rax + rax + 0xb001994]
018a4 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
018a9 493be9                         cmp        rbp, r9
018ac bdffffffff                     mov        ebp, 0xffffffff
018b1 7c08                           jl         0x7f1e7fe8e1bb
018b3 400f95c5                       setne      bpl
018b7 400fb6ed                       movzx      ebp, bpl
018bb be45ffffff                     mov        esi, 0xffffff45
018c0 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
018c5 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
018cd 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
018d2 44894c2404                     mov        dword ptr [rsp + 4], r9d
018d7 48894424f8                     mov        qword ptr [rsp - 8], rax
018dc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
018e0 89442410                       mov        dword ptr [rsp + 0x10], eax
018e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e9 89442414                       mov        dword ptr [rsp + 0x14], eax
018ed 4489542418                     mov        dword ptr [rsp + 0x18], r10d
018f2 48894424f8                     mov        qword ptr [rsp - 8], rax
018f7 8b442464                       mov        eax, dword ptr [rsp + 0x64]
018fb 8944241c                       mov        dword ptr [rsp + 0x1c], eax
018ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01904 48894424f8                     mov        qword ptr [rsp - 8], rax
01909 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0190d 89442438                       mov        dword ptr [rsp + 0x38], eax
01911 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01916 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0191a 48894424f8                     mov        qword ptr [rsp - 8], rax
0191f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01923 89442444                       mov        dword ptr [rsp + 0x44], eax
01927 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0192c 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01931 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01936 6690                           nop        
01938 c5f877                         vzeroupper 
0193b e8209bb4ff                     call       0x7f1e7f9d7d60
01940 0f1f8400381a000c               nop        dword ptr [rax + rax + 0xc001a38]
01948 bee4ffffff                     mov        esi, 0xffffffe4
0194d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01952 448b1424                       mov        r10d, dword ptr [rsp]
01956 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
0195e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01963 4c891424                       mov        qword ptr [rsp], r10
01967 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0196c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01974 48ff742420                     push       qword ptr [rsp + 0x20]
01979 488f442418                     pop        qword ptr [rsp + 0x18]
0197e 48894424f8                     mov        qword ptr [rsp - 8], rax
01983 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01987 89442414                       mov        dword ptr [rsp + 0x14], eax
0198b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01990 48ff742428                     push       qword ptr [rsp + 0x28]
01995 488f442420                     pop        qword ptr [rsp + 0x20]
0199a 48ff742430                     push       qword ptr [rsp + 0x30]
0199f 488f442428                     pop        qword ptr [rsp + 0x28]
019a4 48894424f8                     mov        qword ptr [rsp - 8], rax
019a9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
019ad 89442430                       mov        dword ptr [rsp + 0x30], eax
019b1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b6 48894424f8                     mov        qword ptr [rsp - 8], rax
019bb 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
019bf 89442434                       mov        dword ptr [rsp + 0x34], eax
019c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c8 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
019cd 895c2444                       mov        dword ptr [rsp + 0x44], ebx
019d1 48894424f8                     mov        qword ptr [rsp - 8], rax
019d6 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019da 8944244c                       mov        dword ptr [rsp + 0x4c], eax
019de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019e3 895c2450                       mov        dword ptr [rsp + 0x50], ebx
019e7 48894424f8                     mov        qword ptr [rsp - 8], rax
019ec 8b442460                       mov        eax, dword ptr [rsp + 0x60]
019f0 89442454                       mov        dword ptr [rsp + 0x54], eax
019f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f9 4489742458                     mov        dword ptr [rsp + 0x58], r14d
019fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01a03 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01a07 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01a0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a10 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01a15 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01a1a 6690                           nop        
01a1c c5f877                         vzeroupper 
01a1f e83c9ab4ff                     call       0x7f1e7f9d7d60
01a24 0f1f84001c1b000d               nop        dword ptr [rax + rax + 0xd001b1c]
01a2c bee4ffffff                     mov        esi, 0xffffffe4
01a31 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01a36 448b0c24                       mov        r9d, dword ptr [rsp]
01a3a 44898c24d0000000               mov        dword ptr [rsp + 0xd0], r9d
01a42 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a47 4c891424                       mov        qword ptr [rsp], r10
01a4b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a50 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01a58 48ff742420                     push       qword ptr [rsp + 0x20]
01a5d 488f442418                     pop        qword ptr [rsp + 0x18]
01a62 48894424f8                     mov        qword ptr [rsp - 8], rax
01a67 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01a6b 89442414                       mov        dword ptr [rsp + 0x14], eax
01a6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a74 48ff742428                     push       qword ptr [rsp + 0x28]
01a79 488f442420                     pop        qword ptr [rsp + 0x20]
01a7e 48ff742430                     push       qword ptr [rsp + 0x30]
01a83 488f442428                     pop        qword ptr [rsp + 0x28]
01a88 48894424f8                     mov        qword ptr [rsp - 8], rax
01a8d 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a91 89442430                       mov        dword ptr [rsp + 0x30], eax
01a95 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9f 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01aa3 89442434                       mov        dword ptr [rsp + 0x34], eax
01aa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aac 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01ab1 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01ab5 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01aba 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01abf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac4 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ac8 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01acc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad1 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01ad5 48894424f8                     mov        qword ptr [rsp - 8], rax
01ada 8b442468                       mov        eax, dword ptr [rsp + 0x68]
01ade 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ae2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01aec 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01af1 666690                         nop        
01af4 c5f877                         vzeroupper 
01af7 e86499b4ff                     call       0x7f1e7f9d7d60
01afc 0f1f8400f41b000e               nop        dword ptr [rax + rax + 0xe001bf4]
01b04 4183c608                       add        r14d, 8
01b08 be6effffff                     mov        esi, 0xffffff6e
01b0d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b12 448b1424                       mov        r10d, dword ptr [rsp]
01b16 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01b1e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b23 4c891424                       mov        qword ptr [rsp], r10
01b27 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b2c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01b34 48894424f8                     mov        qword ptr [rsp - 8], rax
01b39 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01b3d 89442408                       mov        dword ptr [rsp + 8], eax
01b41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b46 897c240c                       mov        dword ptr [rsp + 0xc], edi
01b4a 48ff742420                     push       qword ptr [rsp + 0x20]
01b4f 488f442418                     pop        qword ptr [rsp + 0x18]
01b54 48894424f8                     mov        qword ptr [rsp - 8], rax
01b59 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01b5d 89442414                       mov        dword ptr [rsp + 0x14], eax
01b61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b66 48ff742428                     push       qword ptr [rsp + 0x28]
01b6b 488f442420                     pop        qword ptr [rsp + 0x20]
01b70 48ff742430                     push       qword ptr [rsp + 0x30]
01b75 488f442428                     pop        qword ptr [rsp + 0x28]
01b7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01b83 89442430                       mov        dword ptr [rsp + 0x30], eax
01b87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b91 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01b95 89442434                       mov        dword ptr [rsp + 0x34], eax
01b99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9e 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01ba3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba8 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
01baf 89442440                       mov        dword ptr [rsp + 0x40], eax
01bb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb8 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01bbd 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01bc1 666690                         nop        
01bc4 c5f877                         vzeroupper 
01bc7 e89498b4ff                     call       0x7f1e7f9d7d60
01bcc 0f1f8400c41c000f               nop        dword ptr [rax + rax + 0xf001cc4]
01bd4 4183c608                       add        r14d, 8
01bd8 be66ffffff                     mov        esi, 0xffffff66
01bdd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01be2 448b1c24                       mov        r11d, dword ptr [rsp]
01be6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01bee 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01bf3 4c891424                       mov        qword ptr [rsp], r10
01bf7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01bfc 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01c04 48894424f8                     mov        qword ptr [rsp - 8], rax
01c09 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01c0d 89442408                       mov        dword ptr [rsp + 8], eax
01c11 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c16 897c240c                       mov        dword ptr [rsp + 0xc], edi
01c1a 48ff742420                     push       qword ptr [rsp + 0x20]
01c1f 488f442418                     pop        qword ptr [rsp + 0x18]
01c24 48894424f8                     mov        qword ptr [rsp - 8], rax
01c29 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01c2d 89442414                       mov        dword ptr [rsp + 0x14], eax
01c31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c36 48ff742428                     push       qword ptr [rsp + 0x28]
01c3b 488f442420                     pop        qword ptr [rsp + 0x20]
01c40 48ff742430                     push       qword ptr [rsp + 0x30]
01c45 488f442428                     pop        qword ptr [rsp + 0x28]
01c4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01c53 89442430                       mov        dword ptr [rsp + 0x30], eax
01c57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c5c 48894424f8                     mov        qword ptr [rsp - 8], rax
01c61 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01c65 89442434                       mov        dword ptr [rsp + 0x34], eax
01c69 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c6e 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01c73 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01c78 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01c7c 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01c81 666690                         nop        
01c84 c5f877                         vzeroupper 
01c87 e8d497b4ff                     call       0x7f1e7f9d7d60
01c8c 0f1f8400841d0010               nop        dword ptr [rax + rax + 0x10001d84]
01c94 418be8                         mov        ebp, r8d
01c97 e942e9ffff                     jmp        0x7f1e7fe8cede
01c9c beccffffff                     mov        esi, 0xffffffcc
01ca1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01ca6 448b1c24                       mov        r11d, dword ptr [rsp]
01caa 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01cb2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01cb7 4c891424                       mov        qword ptr [rsp], r10
01cbb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cc0 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01cc8 48ff742420                     push       qword ptr [rsp + 0x20]
01ccd 488f442418                     pop        qword ptr [rsp + 0x18]
01cd2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cd7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01cdb 89442414                       mov        dword ptr [rsp + 0x14], eax
01cdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce4 48ff742428                     push       qword ptr [rsp + 0x28]
01ce9 488f442420                     pop        qword ptr [rsp + 0x20]
01cee 48ff742430                     push       qword ptr [rsp + 0x30]
01cf3 488f442428                     pop        qword ptr [rsp + 0x28]
01cf8 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfd 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d01 89442430                       mov        dword ptr [rsp + 0x30], eax
01d05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0f 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01d13 89442434                       mov        dword ptr [rsp + 0x34], eax
01d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01d21 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d25 89442440                       mov        dword ptr [rsp + 0x40], eax
01d29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2e 4489742444                     mov        dword ptr [rsp + 0x44], r14d
01d33 48894424f8                     mov        qword ptr [rsp - 8], rax
01d38 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01d3c 89442448                       mov        dword ptr [rsp + 0x48], eax
01d40 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d45 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01d49 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01d4e 6690                           nop        
01d50 c5f877                         vzeroupper 
01d53 e80897b4ff                     call       0x7f1e7f9d7d60
01d58 0f1f8400501e0011               nop        dword ptr [rax + rax + 0x11001e50]
01d60 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01d65 448bd8                         mov        r11d, eax
01d68 44035c2440                     add        r11d, dword ptr [rsp + 0x40]
01d6d 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01d72 4f8b5c190c                     mov        r11, qword ptr [r9 + r11 + 0xc]
01d77 4f895c010c                     mov        qword ptr [r9 + r8 + 0xc], r11
01d7c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01d81 4183c308                       add        r11d, 8
01d85 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d8a 453bda                         cmp        r11d, r10d
01d8d 7cd1                           jl         0x7f1e7fe8e660
01d8f 443bdf                         cmp        r11d, edi
01d92 0f8d9e000000                   jge        0x7f1e7fe8e736
01d98 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d9d 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
01da1 0f1f840000000000               nop        dword ptr [rax + rax]
01da9 0f1f8000000000                 nop        dword ptr [rax]
01db0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01db5 4d63ca                         movsxd     r9, r10d
01db8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01dbd 448bc0                         mov        r8d, eax
01dc0 4403442440                     add        r8d, dword ptr [rsp + 0x40]
01dc5 458bd8                         mov        r11d, r8d
01dc8 4e8b44030c                     mov        r8, qword ptr [rbx + r8 + 0xc]
01dcd 4e8944130c                     mov        qword ptr [rbx + r10 + 0xc], r8
01dd2 4d63db                         movsxd     r11, r11d
01dd5 4e8b541b14                     mov        r10, qword ptr [rbx + r11 + 0x14]
01dda 4e89540b14                     mov        qword ptr [rbx + r9 + 0x14], r10
01ddf 4e8b541b1c                     mov        r10, qword ptr [rbx + r11 + 0x1c]
01de4 4e89540b1c                     mov        qword ptr [rbx + r9 + 0x1c], r10
01de9 4e8b541b24                     mov        r10, qword ptr [rbx + r11 + 0x24]
01dee 4e89540b24                     mov        qword ptr [rbx + r9 + 0x24], r10
01df3 4e8b541b2c                     mov        r10, qword ptr [rbx + r11 + 0x2c]
01df8 4e89540b2c                     mov        qword ptr [rbx + r9 + 0x2c], r10
01dfd 4e8b541b34                     mov        r10, qword ptr [rbx + r11 + 0x34]
01e02 4e89540b34                     mov        qword ptr [rbx + r9 + 0x34], r10
01e07 4e8b541b3c                     mov        r10, qword ptr [rbx + r11 + 0x3c]
01e0c 4e89540b3c                     mov        qword ptr [rbx + r9 + 0x3c], r10
01e11 4e8b541b44                     mov        r10, qword ptr [rbx + r11 + 0x44]
01e16 4e89540b44                     mov        qword ptr [rbx + r9 + 0x44], r10
01e1b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e20 4183c240                       add        r10d, 0x40
01e24 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01e29 443bd7                         cmp        r10d, edi
01e2c 0f8c7effffff                   jl         0x7f1e7fe8e6b0
01e32 895c2460                       mov        dword ptr [rsp + 0x60], ebx
01e36 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e3b 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
01e43 0f8d9ee7ffff                   jge        0x7f1e7fe8cee7
01e49 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01e4e 418bcb                         mov        ecx, r11d
01e51 666690                         nop        
01e54 448d1c08                       lea        r11d, [rax + rcx]
01e58 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01e5d 4f8b5c1a0c                     mov        r11, qword ptr [r10 + r11 + 0xc]
01e62 448bc1                         mov        r8d, ecx
01e65 4f895c020c                     mov        qword ptr [r10 + r8 + 0xc], r11
01e6a 448d5908                       lea        r11d, [rcx + 8]
01e6e 418bcb                         mov        ecx, r11d
01e71 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
01e79 7cd9                           jl         0x7f1e7fe8e754
01e7b e967e7ffff                     jmp        0x7f1e7fe8cee7
01e80 bee4ffffff                     mov        esi, 0xffffffe4
01e85 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01e8a 448b0424                       mov        r8d, dword ptr [rsp]
01e8e 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01e96 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01e9b 4c891c24                       mov        qword ptr [rsp], r11
01e9f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ea4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01eac 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01eb5 89442408                       mov        dword ptr [rsp + 8], eax
01eb9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ebe 8944240c                       mov        dword ptr [rsp + 0xc], eax
01ec2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ec7 48ff742420                     push       qword ptr [rsp + 0x20]
01ecc 488f442418                     pop        qword ptr [rsp + 0x18]
01ed1 48894424f8                     mov        qword ptr [rsp - 8], rax
01ed6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01eda 89442414                       mov        dword ptr [rsp + 0x14], eax
01ede 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ee3 48ff742428                     push       qword ptr [rsp + 0x28]
01ee8 488f442420                     pop        qword ptr [rsp + 0x20]
01eed 48ff742430                     push       qword ptr [rsp + 0x30]
01ef2 488f442428                     pop        qword ptr [rsp + 0x28]
01ef7 48894424f8                     mov        qword ptr [rsp - 8], rax
01efc 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01f00 89442430                       mov        dword ptr [rsp + 0x30], eax
01f04 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f09 48894424f8                     mov        qword ptr [rsp - 8], rax
01f0e 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01f12 89442434                       mov        dword ptr [rsp + 0x34], eax
01f16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f1b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01f1f 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01f24 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01f29 666690                         nop        
01f2c c5f877                         vzeroupper 
01f2f e82c95b4ff                     call       0x7f1e7f9d7d60
01f34 0f1f84002c200012               nop        dword ptr [rax + rax + 0x1200202c]
01f3c 4585f6                         test       r14d, r14d
01f3f 0f84eb130000                   je         0x7f1e7fe8fc30
01f45 8b2c24                         mov        ebp, dword ptr [rsp]
01f48 8984249c000000                 mov        dword ptr [rsp + 0x9c], eax
01f4f 4533c0                         xor        r8d, r8d
01f52 e941ecffff                     jmp        0x7f1e7fe8d498
01f57 bee4ffffff                     mov        esi, 0xffffffe4
01f5c 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01f61 448b1424                       mov        r10d, dword ptr [rsp]
01f65 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01f6d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f72 4c891424                       mov        qword ptr [rsp], r10
01f76 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f7b 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01f83 48ff742420                     push       qword ptr [rsp + 0x20]
01f88 488f442410                     pop        qword ptr [rsp + 0x10]
01f8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f92 8b442444                       mov        eax, dword ptr [rsp + 0x44]
01f96 89442418                       mov        dword ptr [rsp + 0x18], eax
01f9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9f 48ff742428                     push       qword ptr [rsp + 0x28]
01fa4 488f442420                     pop        qword ptr [rsp + 0x20]
01fa9 48ff742430                     push       qword ptr [rsp + 0x30]
01fae 488f442428                     pop        qword ptr [rsp + 0x28]
01fb3 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01fbc 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01fc0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc5 48894424f8                     mov        qword ptr [rsp - 8], rax
01fca 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
01fce 89442430                       mov        dword ptr [rsp + 0x30], eax
01fd2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd7 48894424f8                     mov        qword ptr [rsp - 8], rax
01fdc 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01fe0 89442438                       mov        dword ptr [rsp + 0x38], eax
01fe4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fe9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01fee 48894424f8                     mov        qword ptr [rsp - 8], rax
01ff3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
01ff7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01ffb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02000 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02004 4489742458                     mov        dword ptr [rsp + 0x58], r14d
02009 666690                         nop        
0200c c5f877                         vzeroupper 
0200f e84c94b4ff                     call       0x7f1e7f9d7d60
02014 0f1f84000c210013               nop        dword ptr [rax + rax + 0x1300210c]
0201c bee4ffffff                     mov        esi, 0xffffffe4
02021 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02026 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0202e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02033 4489542404                     mov        dword ptr [rsp + 4], r10d
02038 48ff742420                     push       qword ptr [rsp + 0x20]
0203d 488f442418                     pop        qword ptr [rsp + 0x18]
02042 48894424f8                     mov        qword ptr [rsp - 8], rax
02047 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0204b 89442420                       mov        dword ptr [rsp + 0x20], eax
0204f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02054 48894424f8                     mov        qword ptr [rsp - 8], rax
02059 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0205d 89442424                       mov        dword ptr [rsp + 0x24], eax
02061 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02066 48894424f8                     mov        qword ptr [rsp - 8], rax
0206b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0206f 89442438                       mov        dword ptr [rsp + 0x38], eax
02073 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02078 48894424f8                     mov        qword ptr [rsp - 8], rax
0207d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02081 89442440                       mov        dword ptr [rsp + 0x40], eax
02085 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0208a 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0208f 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02094 4489442450                     mov        dword ptr [rsp + 0x50], r8d
02099 48894424f8                     mov        qword ptr [rsp - 8], rax
0209e 8b442460                       mov        eax, dword ptr [rsp + 0x60]
020a2 89442454                       mov        dword ptr [rsp + 0x54], eax
020a6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020ab 895c2458                       mov        dword ptr [rsp + 0x58], ebx
020af 90                             nop        
020b0 c5f877                         vzeroupper 
020b3 e8a893b4ff                     call       0x7f1e7f9d7d60
020b8 0f1f8400b0210014               nop        dword ptr [rax + rax + 0x140021b0]
020c0 418d6e01                       lea        ebp, [r14 + 1]
020c4 bee4ffffff                     mov        esi, 0xffffffe4
020c9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020ce 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
020d6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020db 44895c2404                     mov        dword ptr [rsp + 4], r11d
020e0 48ff742420                     push       qword ptr [rsp + 0x20]
020e5 488f442418                     pop        qword ptr [rsp + 0x18]
020ea 48894424f8                     mov        qword ptr [rsp - 8], rax
020ef 8b442444                       mov        eax, dword ptr [rsp + 0x44]
020f3 89442420                       mov        dword ptr [rsp + 0x20], eax
020f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02101 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02105 89442424                       mov        dword ptr [rsp + 0x24], eax
02109 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0210e 48894424f8                     mov        qword ptr [rsp - 8], rax
02113 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02117 89442438                       mov        dword ptr [rsp + 0x38], eax
0211b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02120 48894424f8                     mov        qword ptr [rsp - 8], rax
02125 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02129 89442440                       mov        dword ptr [rsp + 0x40], eax
0212d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02132 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02136 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0213b 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02140 4489442450                     mov        dword ptr [rsp + 0x50], r8d
02145 48894424f8                     mov        qword ptr [rsp - 8], rax
0214a 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0214e 89442454                       mov        dword ptr [rsp + 0x54], eax
02152 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02157 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0215c 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02161 894c2470                       mov        dword ptr [rsp + 0x70], ecx
02165 666690                         nop        
02168 c5f877                         vzeroupper 
0216b e8f092b4ff                     call       0x7f1e7f9d7d60
02170 0f1f840068220015               nop        dword ptr [rax + rax + 0x15002268]
02178 bee4ffffff                     mov        esi, 0xffffffe4
0217d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02182 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0218a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0218f 44895c2404                     mov        dword ptr [rsp + 4], r11d
02194 48ff742420                     push       qword ptr [rsp + 0x20]
02199 488f442418                     pop        qword ptr [rsp + 0x18]
0219e 48894424f8                     mov        qword ptr [rsp - 8], rax
021a3 8b442444                       mov        eax, dword ptr [rsp + 0x44]
021a7 89442420                       mov        dword ptr [rsp + 0x20], eax
021ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b0 48894424f8                     mov        qword ptr [rsp - 8], rax
021b5 8b442464                       mov        eax, dword ptr [rsp + 0x64]
021b9 89442424                       mov        dword ptr [rsp + 0x24], eax
021bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c2 48894424f8                     mov        qword ptr [rsp - 8], rax
021c7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
021cb 89442438                       mov        dword ptr [rsp + 0x38], eax
021cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d4 48894424f8                     mov        qword ptr [rsp - 8], rax
021d9 8b442460                       mov        eax, dword ptr [rsp + 0x60]
021dd 89442440                       mov        dword ptr [rsp + 0x40], eax
021e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021e6 895c2444                       mov        dword ptr [rsp + 0x44], ebx
021ea 4489742448                     mov        dword ptr [rsp + 0x48], r14d
021ef 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
021f4 4489442450                     mov        dword ptr [rsp + 0x50], r8d
021f9 48894424f8                     mov        qword ptr [rsp - 8], rax
021fe 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02202 89442454                       mov        dword ptr [rsp + 0x54], eax
02206 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220b 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
0220f 90                             nop        
02210 c5f877                         vzeroupper 
02213 e84892b4ff                     call       0x7f1e7f9d7d60
02218 0f1f840010230016               nop        dword ptr [rax + rax + 0x16002310]
02220 bee4ffffff                     mov        esi, 0xffffffe4
02225 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0222a 448b1c24                       mov        r11d, dword ptr [rsp]
0222e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02236 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0223b 4c891424                       mov        qword ptr [rsp], r10
0223f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02244 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0224c 48ff742420                     push       qword ptr [rsp + 0x20]
02251 488f442410                     pop        qword ptr [rsp + 0x10]
02256 48894424f8                     mov        qword ptr [rsp - 8], rax
0225b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0225f 89442418                       mov        dword ptr [rsp + 0x18], eax
02263 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02268 48ff742428                     push       qword ptr [rsp + 0x28]
0226d 488f442420                     pop        qword ptr [rsp + 0x20]
02272 48ff742430                     push       qword ptr [rsp + 0x30]
02277 488f442428                     pop        qword ptr [rsp + 0x28]
0227c 48894424f8                     mov        qword ptr [rsp - 8], rax
02281 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02285 89442430                       mov        dword ptr [rsp + 0x30], eax
02289 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0228e 48894424f8                     mov        qword ptr [rsp - 8], rax
02293 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02297 89442438                       mov        dword ptr [rsp + 0x38], eax
0229b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022a0 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
022a4 4489442444                     mov        dword ptr [rsp + 0x44], r8d
022a9 4489742448                     mov        dword ptr [rsp + 0x48], r14d
022ae 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
022b3 90                             nop        
022b4 c5f877                         vzeroupper 
022b7 e8a491b4ff                     call       0x7f1e7f9d7d60
022bc 0f1f8400b4230017               nop        dword ptr [rax + rax + 0x170023b4]
022c4 bee4ffffff                     mov        esi, 0xffffffe4
022c9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
022ce 448b1424                       mov        r10d, dword ptr [rsp]
022d2 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
022da 4c8b542408                     mov        r10, qword ptr [rsp + 8]
022df 4c891424                       mov        qword ptr [rsp], r10
022e3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
022e8 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
022f0 48ff742420                     push       qword ptr [rsp + 0x20]
022f5 488f442410                     pop        qword ptr [rsp + 0x10]
022fa 48894424f8                     mov        qword ptr [rsp - 8], rax
022ff 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02303 89442418                       mov        dword ptr [rsp + 0x18], eax
02307 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0230c 48ff742428                     push       qword ptr [rsp + 0x28]
02311 488f442420                     pop        qword ptr [rsp + 0x20]
02316 48ff742430                     push       qword ptr [rsp + 0x30]
0231b 488f442428                     pop        qword ptr [rsp + 0x28]
02320 48894424f8                     mov        qword ptr [rsp - 8], rax
02325 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02329 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0232d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02332 48894424f8                     mov        qword ptr [rsp - 8], rax
02337 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0233b 89442430                       mov        dword ptr [rsp + 0x30], eax
0233f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02344 48894424f8                     mov        qword ptr [rsp - 8], rax
02349 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0234d 89442438                       mov        dword ptr [rsp + 0x38], eax
02351 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02356 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0235a 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
0235f 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02364 48894424f8                     mov        qword ptr [rsp - 8], rax
02369 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0236d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02371 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02376 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0237b 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02380 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02385 897c2470                       mov        dword ptr [rsp + 0x70], edi
02389 666690                         nop        
0238c c5f877                         vzeroupper 
0238f e8cc90b4ff                     call       0x7f1e7f9d7d60
02394 0f1f84008c240018               nop        dword ptr [rax + rax + 0x1800248c]
0239c bee4ffffff                     mov        esi, 0xffffffe4
023a1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023a6 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
023ae 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
023b3 4489542404                     mov        dword ptr [rsp + 4], r10d
023b8 48ff742420                     push       qword ptr [rsp + 0x20]
023bd 488f442418                     pop        qword ptr [rsp + 0x18]
023c2 48894424f8                     mov        qword ptr [rsp - 8], rax
023c7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
023cb 89442420                       mov        dword ptr [rsp + 0x20], eax
023cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023d4 48894424f8                     mov        qword ptr [rsp - 8], rax
023d9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
023dd 89442424                       mov        dword ptr [rsp + 0x24], eax
023e1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023e6 48894424f8                     mov        qword ptr [rsp - 8], rax
023eb 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
023ef 89442438                       mov        dword ptr [rsp + 0x38], eax
023f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023f8 48894424f8                     mov        qword ptr [rsp - 8], rax
023fd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02401 89442440                       mov        dword ptr [rsp + 0x40], eax
02405 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0240a 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0240e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02413 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02418 48894424f8                     mov        qword ptr [rsp - 8], rax
0241d 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02421 89442450                       mov        dword ptr [rsp + 0x50], eax
02425 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0242a 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
0242f 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02434 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02438 897c2470                       mov        dword ptr [rsp + 0x70], edi
0243c c5f877                         vzeroupper 
0243f e81c90b4ff                     call       0x7f1e7f9d7d60
02444 0f1f84003c250019               nop        dword ptr [rax + rax + 0x1900253c]
0244c beccffffff                     mov        esi, 0xffffffcc
02451 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02456 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0245e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02463 4489542404                     mov        dword ptr [rsp + 4], r10d
02468 48ff742420                     push       qword ptr [rsp + 0x20]
0246d 488f442418                     pop        qword ptr [rsp + 0x18]
02472 48894424f8                     mov        qword ptr [rsp - 8], rax
02477 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0247b 89442420                       mov        dword ptr [rsp + 0x20], eax
0247f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02484 48894424f8                     mov        qword ptr [rsp - 8], rax
02489 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0248d 89442424                       mov        dword ptr [rsp + 0x24], eax
02491 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02496 48894424f8                     mov        qword ptr [rsp - 8], rax
0249b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0249f 89442438                       mov        dword ptr [rsp + 0x38], eax
024a3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024a8 48894424f8                     mov        qword ptr [rsp - 8], rax
024ad 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024b1 89442440                       mov        dword ptr [rsp + 0x40], eax
024b5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024ba 895c2444                       mov        dword ptr [rsp + 0x44], ebx
024be 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
024c3 48894424f8                     mov        qword ptr [rsp - 8], rax
024c8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
024cc 89442450                       mov        dword ptr [rsp + 0x50], eax
024d0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
024d5 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
024da 4c89542468                     mov        qword ptr [rsp + 0x68], r10
024df 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
024e4 c5f877                         vzeroupper 
024e7 e8748fb4ff                     call       0x7f1e7f9d7d60
024ec 0f1f8400e425001a               nop        dword ptr [rax + rax + 0x1a0025e4]
024f4 be6effffff                     mov        esi, 0xffffff6e
024f9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
024fe 448b0424                       mov        r8d, dword ptr [rsp]
02502 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0250a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0250f 4c891c24                       mov        qword ptr [rsp], r11
02513 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02518 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02520 48894424f8                     mov        qword ptr [rsp - 8], rax
02525 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02529 89442408                       mov        dword ptr [rsp + 8], eax
0252d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02532 8944240c                       mov        dword ptr [rsp + 0xc], eax
02536 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0253b 48ff742420                     push       qword ptr [rsp + 0x20]
02540 488f442418                     pop        qword ptr [rsp + 0x18]
02545 48894424f8                     mov        qword ptr [rsp - 8], rax
0254a 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0254e 89442414                       mov        dword ptr [rsp + 0x14], eax
02552 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02557 48ff742428                     push       qword ptr [rsp + 0x28]
0255c 488f442420                     pop        qword ptr [rsp + 0x20]
02561 48ff742430                     push       qword ptr [rsp + 0x30]
02566 488f442428                     pop        qword ptr [rsp + 0x28]
0256b 48894424f8                     mov        qword ptr [rsp - 8], rax
02570 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02574 89442430                       mov        dword ptr [rsp + 0x30], eax
02578 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0257d 48894424f8                     mov        qword ptr [rsp - 8], rax
02582 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02586 89442434                       mov        dword ptr [rsp + 0x34], eax
0258a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0258f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02593 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02598 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0259d 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
025a2 6690                           nop        
025a4 c5f877                         vzeroupper 
025a7 e8b48eb4ff                     call       0x7f1e7f9d7d60
025ac 0f1f8400a426001b               nop        dword ptr [rax + rax + 0x1b0026a4]
025b4 be45ffffff                     mov        esi, 0xffffff45
025b9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
025be 448b0424                       mov        r8d, dword ptr [rsp]
025c2 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
025ca 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
025cf 4c891c24                       mov        qword ptr [rsp], r11
025d3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
025d8 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
025e0 48894424f8                     mov        qword ptr [rsp - 8], rax
025e5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
025e9 89442408                       mov        dword ptr [rsp + 8], eax
025ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
025f2 8944240c                       mov        dword ptr [rsp + 0xc], eax
025f6 4489542410                     mov        dword ptr [rsp + 0x10], r10d
025fb 48ff742420                     push       qword ptr [rsp + 0x20]
02600 488f442418                     pop        qword ptr [rsp + 0x18]
02605 48894424f8                     mov        qword ptr [rsp - 8], rax
0260a 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0260e 89442414                       mov        dword ptr [rsp + 0x14], eax
02612 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02617 48ff742428                     push       qword ptr [rsp + 0x28]
0261c 488f442420                     pop        qword ptr [rsp + 0x20]
02621 48ff742430                     push       qword ptr [rsp + 0x30]
02626 488f442428                     pop        qword ptr [rsp + 0x28]
0262b 48894424f8                     mov        qword ptr [rsp - 8], rax
02630 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02634 89442430                       mov        dword ptr [rsp + 0x30], eax
02638 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0263d 48894424f8                     mov        qword ptr [rsp - 8], rax
02642 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02646 89442434                       mov        dword ptr [rsp + 0x34], eax
0264a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0264f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02653 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02658 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0265d 666690                         nop        
02660 c5f877                         vzeroupper 
02663 e8f88db4ff                     call       0x7f1e7f9d7d60
02668 0f1f84006027001c               nop        dword ptr [rax + rax + 0x1c002760]
02670 be3dffffff                     mov        esi, 0xffffff3d
02675 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0267a 448b1c24                       mov        r11d, dword ptr [rsp]
0267e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02686 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0268b 4c891c24                       mov        qword ptr [rsp], r11
0268f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02694 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0269c 48894424f8                     mov        qword ptr [rsp - 8], rax
026a1 8b442460                       mov        eax, dword ptr [rsp + 0x60]
026a5 89442408                       mov        dword ptr [rsp + 8], eax
026a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026ae 8944240c                       mov        dword ptr [rsp + 0xc], eax
026b2 4489542410                     mov        dword ptr [rsp + 0x10], r10d
026b7 48ff742420                     push       qword ptr [rsp + 0x20]
026bc 488f442418                     pop        qword ptr [rsp + 0x18]
026c1 48894424f8                     mov        qword ptr [rsp - 8], rax
026c6 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
026ca 89442414                       mov        dword ptr [rsp + 0x14], eax
026ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d3 48ff742428                     push       qword ptr [rsp + 0x28]
026d8 488f442420                     pop        qword ptr [rsp + 0x20]
026dd 48ff742430                     push       qword ptr [rsp + 0x30]
026e2 488f442428                     pop        qword ptr [rsp + 0x28]
026e7 48894424f8                     mov        qword ptr [rsp - 8], rax
026ec 8b442464                       mov        eax, dword ptr [rsp + 0x64]
026f0 89442430                       mov        dword ptr [rsp + 0x30], eax
026f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026f9 48894424f8                     mov        qword ptr [rsp - 8], rax
026fe 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02702 89442434                       mov        dword ptr [rsp + 0x34], eax
02706 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0270b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0270f 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02714 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02719 666690                         nop        
0271c c5f877                         vzeroupper 
0271f e83c8db4ff                     call       0x7f1e7f9d7d60
02724 0f1f84001c28001d               nop        dword ptr [rax + rax + 0x1d00281c]
0272c bee4ffffff                     mov        esi, 0xffffffe4
02731 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02736 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0273e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02743 4489542404                     mov        dword ptr [rsp + 4], r10d
02748 48ff742420                     push       qword ptr [rsp + 0x20]
0274d 488f442418                     pop        qword ptr [rsp + 0x18]
02752 48894424f8                     mov        qword ptr [rsp - 8], rax
02757 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0275b 89442420                       mov        dword ptr [rsp + 0x20], eax
0275f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02764 48894424f8                     mov        qword ptr [rsp - 8], rax
02769 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0276d 89442424                       mov        dword ptr [rsp + 0x24], eax
02771 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02776 48894424f8                     mov        qword ptr [rsp - 8], rax
0277b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0277f 89442438                       mov        dword ptr [rsp + 0x38], eax
02783 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02788 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0278c 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02791 48894424f8                     mov        qword ptr [rsp - 8], rax
02796 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0279a 89442448                       mov        dword ptr [rsp + 0x48], eax
0279e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027a3 48894424f8                     mov        qword ptr [rsp - 8], rax
027a8 8b442460                       mov        eax, dword ptr [rsp + 0x60]
027ac 8944244c                       mov        dword ptr [rsp + 0x4c], eax
027b0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027b5 48894424f8                     mov        qword ptr [rsp - 8], rax
027ba 8b442468                       mov        eax, dword ptr [rsp + 0x68]
027be 89442450                       mov        dword ptr [rsp + 0x50], eax
027c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
027c7 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
027cc c5f877                         vzeroupper 
027cf e88c8cb4ff                     call       0x7f1e7f9d7d60
027d4 0f1f8400cc28001e               nop        dword ptr [rax + rax + 0x1e0028cc]
027dc bee4ffffff                     mov        esi, 0xffffffe4
027e1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027e6 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
027ee 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
027f3 44895c2404                     mov        dword ptr [rsp + 4], r11d
027f8 48ff742420                     push       qword ptr [rsp + 0x20]
027fd 488f442418                     pop        qword ptr [rsp + 0x18]
02802 48894424f8                     mov        qword ptr [rsp - 8], rax
02807 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0280b 89442420                       mov        dword ptr [rsp + 0x20], eax
0280f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02814 48894424f8                     mov        qword ptr [rsp - 8], rax
02819 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0281d 89442424                       mov        dword ptr [rsp + 0x24], eax
02821 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02826 48894424f8                     mov        qword ptr [rsp - 8], rax
0282b 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
0282f 89442438                       mov        dword ptr [rsp + 0x38], eax
02833 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02838 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0283c 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02841 48894424f8                     mov        qword ptr [rsp - 8], rax
02846 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0284a 89442448                       mov        dword ptr [rsp + 0x48], eax
0284e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02853 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02858 c5f877                         vzeroupper 
0285b e8008cb4ff                     call       0x7f1e7f9d7d60
02860 0f1f84005829001f               nop        dword ptr [rax + rax + 0x1f002958]
02868 beccffffff                     mov        esi, 0xffffffcc
0286d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02872 448b1c24                       mov        r11d, dword ptr [rsp]
02876 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0287e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02883 4c891424                       mov        qword ptr [rsp], r10
02887 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0288c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02894 48ff742420                     push       qword ptr [rsp + 0x20]
02899 488f442410                     pop        qword ptr [rsp + 0x10]
0289e 48894424f8                     mov        qword ptr [rsp - 8], rax
028a3 8b442444                       mov        eax, dword ptr [rsp + 0x44]
028a7 89442418                       mov        dword ptr [rsp + 0x18], eax
028ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028b0 48ff742428                     push       qword ptr [rsp + 0x28]
028b5 488f442420                     pop        qword ptr [rsp + 0x20]
028ba 48ff742430                     push       qword ptr [rsp + 0x30]
028bf 488f442428                     pop        qword ptr [rsp + 0x28]
028c4 48894424f8                     mov        qword ptr [rsp - 8], rax
028c9 8b442464                       mov        eax, dword ptr [rsp + 0x64]
028cd 8944241c                       mov        dword ptr [rsp + 0x1c], eax
028d1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028d6 48894424f8                     mov        qword ptr [rsp - 8], rax
028db 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
028df 89442430                       mov        dword ptr [rsp + 0x30], eax
028e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028e8 48894424f8                     mov        qword ptr [rsp - 8], rax
028ed 8b442460                       mov        eax, dword ptr [rsp + 0x60]
028f1 89442438                       mov        dword ptr [rsp + 0x38], eax
028f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028fa 4489442440                     mov        dword ptr [rsp + 0x40], r8d
028ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02904 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02908 89442448                       mov        dword ptr [rsp + 0x48], eax
0290c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02911 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
02916 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0291a 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
0291f 90                             nop        
02920 c5f877                         vzeroupper 
02923 e8388bb4ff                     call       0x7f1e7f9d7d60
02928 0f1f8400202a0020               nop        dword ptr [rax + rax + 0x20002a20]
02930 be17000000                     mov        esi, 0x17
02935 666690                         nop        
02938 c5f877                         vzeroupper 
0293b e8208bb4ff                     call       0x7f1e7f9d7d60
02940 0f1f8400382a0021               nop        dword ptr [rax + rax + 0x21002a38]
02948 be6effffff                     mov        esi, 0xffffff6e
0294d 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02952 89442414                       mov        dword ptr [rsp + 0x14], eax
02956 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0295b 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02960 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02965 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0296a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0296f 90                             nop        
02970 c5f877                         vzeroupper 
02973 e8e88ab4ff                     call       0x7f1e7f9d7d60
02978 0f1f8400702a0022               nop        dword ptr [rax + rax + 0x22002a70]
02980 bebeffffff                     mov        esi, 0xffffffbe
02985 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0298a 89442414                       mov        dword ptr [rsp + 0x14], eax
0298e 4c89442418                     mov        qword ptr [rsp + 0x18], r8
02993 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02998 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0299d 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
029a2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
029a7 90                             nop        
029a8 c5f877                         vzeroupper 
029ab e8b08ab4ff                     call       0x7f1e7f9d7d60
029b0 0f1f8400a82a0023               nop        dword ptr [rax + rax + 0x23002aa8]
029b8 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
029bd 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
029c2 448b742460                     mov        r14d, dword ptr [rsp + 0x60]
029c7 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
029cf beccffffff                     mov        esi, 0xffffffcc
029d4 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
029dc 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
029e4 44893424                       mov        dword ptr [rsp], r14d
029e8 44894c2404                     mov        dword ptr [rsp + 4], r9d
029ed 48895c2408                     mov        qword ptr [rsp + 8], rbx
029f2 6690                           nop        
029f4 c5f877                         vzeroupper 
029f7 e8648ab4ff                     call       0x7f1e7f9d7d60
029fc 0f1f8400f42a0024               nop        dword ptr [rax + rax + 0x24002af4]
02a04 bee4ffffff                     mov        esi, 0xffffffe4
02a09 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02a0e 448b1c24                       mov        r11d, dword ptr [rsp]
02a12 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02a1a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02a1f 4c891c24                       mov        qword ptr [rsp], r11
02a23 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02a28 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02a30 48894424f8                     mov        qword ptr [rsp - 8], rax
02a35 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02a39 89442408                       mov        dword ptr [rsp + 8], eax
02a3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a42 48ff742420                     push       qword ptr [rsp + 0x20]
02a47 488f442410                     pop        qword ptr [rsp + 0x10]
02a4c 48894424f8                     mov        qword ptr [rsp - 8], rax
02a51 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02a55 89442418                       mov        dword ptr [rsp + 0x18], eax
02a59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a5e 48ff742428                     push       qword ptr [rsp + 0x28]
02a63 488f442420                     pop        qword ptr [rsp + 0x20]
02a68 48ff742430                     push       qword ptr [rsp + 0x30]
02a6d 488f442428                     pop        qword ptr [rsp + 0x28]
02a72 48894424f8                     mov        qword ptr [rsp - 8], rax
02a77 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a7b 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02a7f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a84 48894424f8                     mov        qword ptr [rsp - 8], rax
02a89 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02a8d 89442430                       mov        dword ptr [rsp + 0x30], eax
02a91 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a96 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02a9a 48894424f8                     mov        qword ptr [rsp - 8], rax
02a9f 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02aa3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02aa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02aac 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02ab1 48894424f8                     mov        qword ptr [rsp - 8], rax
02ab6 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02aba 89442444                       mov        dword ptr [rsp + 0x44], eax
02abe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ac3 89442448                       mov        dword ptr [rsp + 0x48], eax
02ac7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02acc 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02ad1 48894424f8                     mov        qword ptr [rsp - 8], rax
02ad6 8b44246c                       mov        eax, dword ptr [rsp + 0x6c]
02ada 8944245c                       mov        dword ptr [rsp + 0x5c], eax
02ade 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ae3 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02ae8 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02aed 666690                         nop        
02af0 c5f877                         vzeroupper 
02af3 e86889b4ff                     call       0x7f1e7f9d7d60
02af8 0f1f8400f02b0025               nop        dword ptr [rax + rax + 0x25002bf0]
02b00 bee4ffffff                     mov        esi, 0xffffffe4
02b05 498beb                         mov        rbp, r11
02b08 448b1c24                       mov        r11d, dword ptr [rsp]
02b0c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02b14 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02b19 4c891c24                       mov        qword ptr [rsp], r11
02b1d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02b22 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02b2a 48ff742420                     push       qword ptr [rsp + 0x20]
02b2f 488f442410                     pop        qword ptr [rsp + 0x10]
02b34 48894424f8                     mov        qword ptr [rsp - 8], rax
02b39 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02b3d 89442418                       mov        dword ptr [rsp + 0x18], eax
02b41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b46 48ff742428                     push       qword ptr [rsp + 0x28]
02b4b 488f442420                     pop        qword ptr [rsp + 0x20]
02b50 48ff742430                     push       qword ptr [rsp + 0x30]
02b55 488f442428                     pop        qword ptr [rsp + 0x28]
02b5a 48894424f8                     mov        qword ptr [rsp - 8], rax
02b5f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b63 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02b67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b6c 48894424f8                     mov        qword ptr [rsp - 8], rax
02b71 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02b75 89442430                       mov        dword ptr [rsp + 0x30], eax
02b79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b7e 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02b82 48894424f8                     mov        qword ptr [rsp - 8], rax
02b87 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02b8b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02b8f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b94 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02b99 48894424f8                     mov        qword ptr [rsp - 8], rax
02b9e 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02ba2 89442444                       mov        dword ptr [rsp + 0x44], eax
02ba6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bab 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02bb0 48894424f8                     mov        qword ptr [rsp - 8], rax
02bb5 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02bb9 89442450                       mov        dword ptr [rsp + 0x50], eax
02bbd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bc2 89442454                       mov        dword ptr [rsp + 0x54], eax
02bc6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02bcb 4c89542460                     mov        qword ptr [rsp + 0x60], r10
02bd0 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02bd5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02bda c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
02be0 c5f877                         vzeroupper 
02be3 e87888b4ff                     call       0x7f1e7f9d7d60
02be8 0f1f8400e02c0026               nop        dword ptr [rax + rax + 0x26002ce0]
02bf0 beccffffff                     mov        esi, 0xffffffcc
02bf5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02bfa 448b1c24                       mov        r11d, dword ptr [rsp]
02bfe 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02c06 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02c0b 4c891c24                       mov        qword ptr [rsp], r11
02c0f 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02c14 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02c1c 48ff742420                     push       qword ptr [rsp + 0x20]
02c21 488f442418                     pop        qword ptr [rsp + 0x18]
02c26 48894424f8                     mov        qword ptr [rsp - 8], rax
02c2b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02c2f 89442414                       mov        dword ptr [rsp + 0x14], eax
02c33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c38 48ff742428                     push       qword ptr [rsp + 0x28]
02c3d 488f442420                     pop        qword ptr [rsp + 0x20]
02c42 48ff742430                     push       qword ptr [rsp + 0x30]
02c47 488f442428                     pop        qword ptr [rsp + 0x28]
02c4c 48894424f8                     mov        qword ptr [rsp - 8], rax
02c51 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02c55 89442430                       mov        dword ptr [rsp + 0x30], eax
02c59 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c5e 48894424f8                     mov        qword ptr [rsp - 8], rax
02c63 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02c67 89442434                       mov        dword ptr [rsp + 0x34], eax
02c6b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c70 48894424f8                     mov        qword ptr [rsp - 8], rax
02c75 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02c79 89442440                       mov        dword ptr [rsp + 0x40], eax
02c7d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c82 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
02c87 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02c8c 48894424f8                     mov        qword ptr [rsp - 8], rax
02c91 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02c95 89442454                       mov        dword ptr [rsp + 0x54], eax
02c99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02c9e 89442458                       mov        dword ptr [rsp + 0x58], eax
02ca2 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
02ca6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02cab 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02cb0 c5f877                         vzeroupper 
02cb3 e8a887b4ff                     call       0x7f1e7f9d7d60
02cb8 0f1f8400b02d0027               nop        dword ptr [rax + rax + 0x27002db0]
02cc0 418bea                         mov        ebp, r10d
02cc3 83c510                         add        ebp, 0x10
02cc6 be6effffff                     mov        esi, 0xffffff6e
02ccb 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02cd0 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02cd8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02cdd 44895c2404                     mov        dword ptr [rsp + 4], r11d
02ce2 48894424f8                     mov        qword ptr [rsp - 8], rax
02ce7 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ceb 89442410                       mov        dword ptr [rsp + 0x10], eax
02cef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cf4 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02cf9 48ff742420                     push       qword ptr [rsp + 0x20]
02cfe 488f442418                     pop        qword ptr [rsp + 0x18]
02d03 48894424f8                     mov        qword ptr [rsp - 8], rax
02d08 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02d0c 89442420                       mov        dword ptr [rsp + 0x20], eax
02d10 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d15 48894424f8                     mov        qword ptr [rsp - 8], rax
02d1a 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02d1e 89442424                       mov        dword ptr [rsp + 0x24], eax
02d22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d27 48894424f8                     mov        qword ptr [rsp - 8], rax
02d2c 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02d30 89442438                       mov        dword ptr [rsp + 0x38], eax
02d34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d39 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02d3d 48894424f8                     mov        qword ptr [rsp - 8], rax
02d42 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02d46 89442444                       mov        dword ptr [rsp + 0x44], eax
02d4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d4f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02d54 48894424f8                     mov        qword ptr [rsp - 8], rax
02d59 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02d5d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02d61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d66 897c246c                       mov        dword ptr [rsp + 0x6c], edi
02d6a 6690                           nop        
02d6c c5f877                         vzeroupper 
02d6f e8ec86b4ff                     call       0x7f1e7f9d7d60
02d74 0f1f84006c2e0028               nop        dword ptr [rax + rax + 0x28002e6c]
02d7c 418bea                         mov        ebp, r10d
02d7f 83c510                         add        ebp, 0x10
02d82 be66ffffff                     mov        esi, 0xffffff66
02d87 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02d8c 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02d94 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02d99 4489442404                     mov        dword ptr [rsp + 4], r8d
02d9e 48894424f8                     mov        qword ptr [rsp - 8], rax
02da3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02da7 89442410                       mov        dword ptr [rsp + 0x10], eax
02dab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02db0 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02db5 48ff742420                     push       qword ptr [rsp + 0x20]
02dba 488f442418                     pop        qword ptr [rsp + 0x18]
02dbf 48894424f8                     mov        qword ptr [rsp - 8], rax
02dc4 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02dc8 89442420                       mov        dword ptr [rsp + 0x20], eax
02dcc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02dd1 48894424f8                     mov        qword ptr [rsp - 8], rax
02dd6 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02dda 89442424                       mov        dword ptr [rsp + 0x24], eax
02dde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02de3 48894424f8                     mov        qword ptr [rsp - 8], rax
02de8 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02dec 89442438                       mov        dword ptr [rsp + 0x38], eax
02df0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02df5 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02df9 48894424f8                     mov        qword ptr [rsp - 8], rax
02dfe 8b442448                       mov        eax, dword ptr [rsp + 0x48]
02e02 89442444                       mov        dword ptr [rsp + 0x44], eax
02e06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e0b 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02e10 48894424f8                     mov        qword ptr [rsp - 8], rax
02e15 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02e19 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02e1d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e22 897c246c                       mov        dword ptr [rsp + 0x6c], edi
02e26 6690                           nop        
02e28 c5f877                         vzeroupper 
02e2b e83086b4ff                     call       0x7f1e7f9d7d60
02e30 0f1f8400282f0029               nop        dword ptr [rax + rax + 0x29002f28]
02e38 bee4ffffff                     mov        esi, 0xffffffe4
02e3d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02e42 448b1c24                       mov        r11d, dword ptr [rsp]
02e46 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02e4e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02e53 4c891424                       mov        qword ptr [rsp], r10
02e57 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02e5c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02e64 48ff742420                     push       qword ptr [rsp + 0x20]
02e69 488f442410                     pop        qword ptr [rsp + 0x10]
02e6e 48894424f8                     mov        qword ptr [rsp - 8], rax
02e73 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02e77 89442418                       mov        dword ptr [rsp + 0x18], eax
02e7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e80 48ff742428                     push       qword ptr [rsp + 0x28]
02e85 488f442420                     pop        qword ptr [rsp + 0x20]
02e8a 48ff742430                     push       qword ptr [rsp + 0x30]
02e8f 488f442428                     pop        qword ptr [rsp + 0x28]
02e94 48894424f8                     mov        qword ptr [rsp - 8], rax
02e99 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02e9d 8944241c                       mov        dword ptr [rsp + 0x1c], eax
02ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ea6 48894424f8                     mov        qword ptr [rsp - 8], rax
02eab 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02eaf 89442430                       mov        dword ptr [rsp + 0x30], eax
02eb3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eb8 48894424f8                     mov        qword ptr [rsp - 8], rax
02ebd 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ec1 89442444                       mov        dword ptr [rsp + 0x44], eax
02ec5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02eca 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02ece 48894424f8                     mov        qword ptr [rsp - 8], rax
02ed3 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02ed7 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02edb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ee0 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02ee5 48894424f8                     mov        qword ptr [rsp - 8], rax
02eea 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02eee 89442454                       mov        dword ptr [rsp + 0x54], eax
02ef2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ef7 90                             nop        
02ef8 c5f877                         vzeroupper 
02efb e86085b4ff                     call       0x7f1e7f9d7d60
02f00 0f1f8400f82f002a               nop        dword ptr [rax + rax + 0x2a002ff8]
02f08 bee4ffffff                     mov        esi, 0xffffffe4
02f0d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02f12 448b1c24                       mov        r11d, dword ptr [rsp]
02f16 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02f1e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02f23 4c891424                       mov        qword ptr [rsp], r10
02f27 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02f2c 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02f34 48ff742420                     push       qword ptr [rsp + 0x20]
02f39 488f442410                     pop        qword ptr [rsp + 0x10]
02f3e 48894424f8                     mov        qword ptr [rsp - 8], rax
02f43 8b442444                       mov        eax, dword ptr [rsp + 0x44]
02f47 89442418                       mov        dword ptr [rsp + 0x18], eax
02f4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f50 48ff742428                     push       qword ptr [rsp + 0x28]
02f55 488f442420                     pop        qword ptr [rsp + 0x20]
02f5a 48ff742430                     push       qword ptr [rsp + 0x30]
02f5f 488f442428                     pop        qword ptr [rsp + 0x28]
02f64 48894424f8                     mov        qword ptr [rsp - 8], rax
02f69 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02f6d 89442430                       mov        dword ptr [rsp + 0x30], eax
02f71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f76 48894424f8                     mov        qword ptr [rsp - 8], rax
02f7b 8b442460                       mov        eax, dword ptr [rsp + 0x60]
02f7f 89442440                       mov        dword ptr [rsp + 0x40], eax
02f83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f88 895c2444                       mov        dword ptr [rsp + 0x44], ebx
02f8c 48894424f8                     mov        qword ptr [rsp - 8], rax
02f91 8b442468                       mov        eax, dword ptr [rsp + 0x68]
02f95 89442448                       mov        dword ptr [rsp + 0x48], eax
02f99 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f9e 89442460                       mov        dword ptr [rsp + 0x60], eax
02fa2 48894c2468                     mov        qword ptr [rsp + 0x68], rcx
02fa7 90                             nop        
02fa8 c5f877                         vzeroupper 
02fab e8b084b4ff                     call       0x7f1e7f9d7d60
02fb0 0f1f8400a830002b               nop        dword ptr [rax + rax + 0x2b0030a8]
02fb8 448bd8                         mov        r11d, eax
02fbb 458d5308                       lea        r10d, [r11 + 8]
02fbf 458bca                         mov        r9d, r10d
02fc2 be6effffff                     mov        esi, 0xffffff6e
02fc7 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02fcc 448b1c24                       mov        r11d, dword ptr [rsp]
02fd0 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02fd8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02fdd 4c891424                       mov        qword ptr [rsp], r10
02fe1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02fe6 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02fee 48ff742420                     push       qword ptr [rsp + 0x20]
02ff3 488f442410                     pop        qword ptr [rsp + 0x10]
02ff8 48894424f8                     mov        qword ptr [rsp - 8], rax
02ffd 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03001 89442418                       mov        dword ptr [rsp + 0x18], eax
03005 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0300a 48ff742428                     push       qword ptr [rsp + 0x28]
0300f 488f442420                     pop        qword ptr [rsp + 0x20]
03014 48ff742430                     push       qword ptr [rsp + 0x30]
03019 488f442428                     pop        qword ptr [rsp + 0x28]
0301e 48894424f8                     mov        qword ptr [rsp - 8], rax
03023 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03027 89442430                       mov        dword ptr [rsp + 0x30], eax
0302b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03030 48894424f8                     mov        qword ptr [rsp - 8], rax
03035 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0303c 89442438                       mov        dword ptr [rsp + 0x38], eax
03040 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03045 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0304a 6690                           nop        
0304c c5f877                         vzeroupper 
0304f e80c84b4ff                     call       0x7f1e7f9d7d60
03054 0f1f84004c31002c               nop        dword ptr [rax + rax + 0x2c00314c]
0305c 448bd8                         mov        r11d, eax
0305f 458d5308                       lea        r10d, [r11 + 8]
03063 458bca                         mov        r9d, r10d
03066 be66ffffff                     mov        esi, 0xffffff66
0306b 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
03070 448b1c24                       mov        r11d, dword ptr [rsp]
03074 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0307c 4c8b542408                     mov        r10, qword ptr [rsp + 8]
03081 4c891424                       mov        qword ptr [rsp], r10
03085 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0308a 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
03092 48ff742420                     push       qword ptr [rsp + 0x20]
03097 488f442410                     pop        qword ptr [rsp + 0x10]
0309c 48894424f8                     mov        qword ptr [rsp - 8], rax
030a1 8b442444                       mov        eax, dword ptr [rsp + 0x44]
030a5 89442418                       mov        dword ptr [rsp + 0x18], eax
030a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030ae 48ff742428                     push       qword ptr [rsp + 0x28]
030b3 488f442420                     pop        qword ptr [rsp + 0x20]
030b8 48ff742430                     push       qword ptr [rsp + 0x30]
030bd 488f442428                     pop        qword ptr [rsp + 0x28]
030c2 48894424f8                     mov        qword ptr [rsp - 8], rax
030c7 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
030cb 89442430                       mov        dword ptr [rsp + 0x30], eax
030cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
030d4 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
030d9 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
030de 6690                           nop        
030e0 c5f877                         vzeroupper 
030e3 e87883b4ff                     call       0x7f1e7f9d7d60
030e8 0f1f8400e031002d               nop        dword ptr [rax + rax + 0x2d0031e0]
030f0 bee4ffffff                     mov        esi, 0xffffffe4
030f5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
030fa 448b1c24                       mov        r11d, dword ptr [rsp]
030fe 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
03106 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0310b 4c891424                       mov        qword ptr [rsp], r10
0310f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
03114 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0311c 48ff742420                     push       qword ptr [rsp + 0x20]
03121 488f442410                     pop        qword ptr [rsp + 0x10]
03126 48894424f8                     mov        qword ptr [rsp - 8], rax
0312b 8b442444                       mov        eax, dword ptr [rsp + 0x44]
0312f 89442418                       mov        dword ptr [rsp + 0x18], eax
03133 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03138 48ff742428                     push       qword ptr [rsp + 0x28]
0313d 488f442420                     pop        qword ptr [rsp + 0x20]
03142 48ff742430                     push       qword ptr [rsp + 0x30]
03147 488f442428                     pop        qword ptr [rsp + 0x28]
0314c 48894424f8                     mov        qword ptr [rsp - 8], rax
03151 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03155 89442430                       mov        dword ptr [rsp + 0x30], eax
03159 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0315e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
03162 48894424f8                     mov        qword ptr [rsp - 8], rax
03167 8b442460                       mov        eax, dword ptr [rsp + 0x60]
0316b 89442444                       mov        dword ptr [rsp + 0x44], eax
0316f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03174 4489742448                     mov        dword ptr [rsp + 0x48], r14d
03179 666690                         nop        
0317c c5f877                         vzeroupper 
0317f e8dc82b4ff                     call       0x7f1e7f9d7d60
03184 0f1f84007c32002e               nop        dword ptr [rax + rax + 0x2e00327c]
0318c bee4ffffff                     mov        esi, 0xffffffe4
03191 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
03196 448b1c24                       mov        r11d, dword ptr [rsp]
0319a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
031a2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
031a7 4c891424                       mov        qword ptr [rsp], r10
031ab 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
031b0 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
031b8 48ff742420                     push       qword ptr [rsp + 0x20]
031bd 488f442410                     pop        qword ptr [rsp + 0x10]
031c2 48894424f8                     mov        qword ptr [rsp - 8], rax
031c7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
031cb 89442418                       mov        dword ptr [rsp + 0x18], eax
031cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031d4 48ff742428                     push       qword ptr [rsp + 0x28]
031d9 488f442420                     pop        qword ptr [rsp + 0x20]
031de 48ff742430                     push       qword ptr [rsp + 0x30]
031e3 488f442428                     pop        qword ptr [rsp + 0x28]
031e8 48894424f8                     mov        qword ptr [rsp - 8], rax
031ed 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
031f1 89442430                       mov        dword ptr [rsp + 0x30], eax
031f5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
031fa 4489742440                     mov        dword ptr [rsp + 0x40], r14d
031ff 48894424f8                     mov        qword ptr [rsp - 8], rax
03204 8b442460                       mov        eax, dword ptr [rsp + 0x60]
03208 89442444                       mov        dword ptr [rsp + 0x44], eax
0320c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03211 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03215 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0321a 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0321f 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
03224 4c89542458                     mov        qword ptr [rsp + 0x58], r10
03229 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
0322f 90                             nop        
03230 c5f877                         vzeroupper 
03233 e82882b4ff                     call       0x7f1e7f9d7d60
03238 0f1f84003033002f               nop        dword ptr [rax + rax + 0x2f003330]
03240 4183c610                       add        r14d, 0x10
03244 be6effffff                     mov        esi, 0xffffff6e
03249 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0324e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
03256 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0325b 4489542404                     mov        dword ptr [rsp + 4], r10d
03260 48ff742420                     push       qword ptr [rsp + 0x20]
03265 488f442418                     pop        qword ptr [rsp + 0x18]
0326a 48894424f8                     mov        qword ptr [rsp - 8], rax
0326f 8b442444                       mov        eax, dword ptr [rsp + 0x44]
03273 89442420                       mov        dword ptr [rsp + 0x20], eax
03277 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0327c 48894424f8                     mov        qword ptr [rsp - 8], rax
03281 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
03285 89442438                       mov        dword ptr [rsp + 0x38], eax
03289 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0328e 48894424f8                     mov        qword ptr [rsp - 8], rax
03293 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
0329a 89442440                       mov        dword ptr [rsp + 0x40], eax
0329e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032a3 4489742444                     mov        dword ptr [rsp + 0x44], r14d
032a8 c5f877                         vzeroupper 
032ab e8b081b4ff                     call       0x7f1e7f9d7d60
032b0 0f1f8400a8330030               nop        dword ptr [rax + rax + 0x300033a8]
032b8 4183c610                       add        r14d, 0x10
032bc be66ffffff                     mov        esi, 0xffffff66
032c1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
032c6 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
032ce 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
032d3 44895c2404                     mov        dword ptr [rsp + 4], r11d
032d8 48ff742420                     push       qword ptr [rsp + 0x20]
032dd 488f442418                     pop        qword ptr [rsp + 0x18]
032e2 48894424f8                     mov        qword ptr [rsp - 8], rax
032e7 8b442444                       mov        eax, dword ptr [rsp + 0x44]
032eb 89442420                       mov        dword ptr [rsp + 0x20], eax
032ef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
032f4 48894424f8                     mov        qword ptr [rsp - 8], rax
032f9 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
032fd 89442438                       mov        dword ptr [rsp + 0x38], eax
03301 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03306 48894424f8                     mov        qword ptr [rsp - 8], rax
0330b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
03312 89442440                       mov        dword ptr [rsp + 0x40], eax
03316 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0331b 4489742444                     mov        dword ptr [rsp + 0x44], r14d
03320 c5f877                         vzeroupper 
03323 e83881b4ff                     call       0x7f1e7f9d7d60
03328 0f1f840020340031               nop        dword ptr [rax + rax + 0x31003420]
03330 bef6ffffff                     mov        esi, 0xfffffff6
03335 488bea                         mov        rbp, rdx
03338 898424d0000000                 mov        dword ptr [rsp + 0xd0], eax
0333f 90                             nop        
03340 c5f877                         vzeroupper 
03343 e81881b4ff                     call       0x7f1e7f9d7d60
03348 0f1f840040340032               nop        dword ptr [rax + rax + 0x32003440]
03350 bef6ffffff                     mov        esi, 0xfffffff6
03355 666690                         nop        
03358 c5f877                         vzeroupper 
0335b e80081b4ff                     call       0x7f1e7f9d7d60
03360 0f1f840058340033               nop        dword ptr [rax + rax + 0x33003458]
03368 49ba17d5e87f1e7f0000           movabs     r10, 0x7f1e7fe8d517
03372 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
03379 e96232a8ff                     jmp        0x7f1e7f912ee0
0337e e81dfea6ff                     call       0x7f1e7f8ffaa0
03383 e9b6ccffff                     jmp        0x7f1e7fe8c93e
