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
0001a 0f854034b4ff                   jne        0x7f6a9772ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85a42e0000                   jne        0x7f6a97bee7e2
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4c89442408                     mov        qword ptr [rsp + 8], r8
0004b 8bcf                           mov        ecx, edi
0004d 488bde                         mov        rbx, rsi
00050 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00053 8b6e04                         mov        ebp, dword ptr [rsi + 4]
00056 448bdd                         mov        r11d, ebp
00059 442bd8                         sub        r11d, eax
0005c 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
00064 453bd3                         cmp        r10d, r11d
00067 0f8fc3240000                   jg         0x7f6a97bede30
0006d 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00071 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00075 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
0007d 4c63d8                         movsxd     r11, eax
00080 4d03d8                         add        r11, r8
00083 4d2bcb                         sub        r9, r11
00086 4d3bd1                         cmp        r10, r9
00089 0f8fa1240000                   jg         0x7f6a97bede30
0008f 488b7e10                       mov        rdi, qword ptr [rsi + 0x10]
00093 4c8b4e28                       mov        r9, qword ptr [rsi + 0x28]
00097 4d85c9                         test       r9, r9
0009a 0f8463100000                   je         0x7f6a97beca03
000a0 4533ed                         xor        r13d, r13d
000a3 4c8bda                         mov        r11, rdx
000a6 8b7204                         mov        esi, dword ptr [rdx + 4]
000a9 448b7340                       mov        r14d, dword ptr [rbx + 0x40]
000ad 448bd1                         mov        r10d, ecx
000b0 4585d2                         test       r10d, r10d
000b3 0f8e1b1e0000                   jle        0x7f6a97bed7d4
000b9 89ac2480000000                 mov        dword ptr [rsp + 0x80], ebp
000c0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
000c5 4889542450                     mov        qword ptr [rsp + 0x50], rdx
000ca 48895c2478                     mov        qword ptr [rsp + 0x78], rbx
000cf 4d2bc8                         sub        r9, r8
000d2 448d5ee0                       lea        r11d, [rsi - 0x20]
000d6 83c5e0                         add        ebp, -0x20
000d9 4c8b542408                     mov        r10, qword ptr [rsp + 8]
000de 458b5204                       mov        r10d, dword ptr [r10 + 4]
000e2 4585d2                         test       r10d, r10d
000e5 0f8671240000                   jbe        0x7f6a97bede5c
000eb 4d63d2                         movsxd     r10, r10d
000ee 4863c9                         movsxd     rcx, ecx
000f1 48ffc9                         dec        rcx
000f4 493bca                         cmp        rcx, r10
000f7 0f835f240000                   jae        0x7f6a97bede5c
000fd 4c8b9424e8000000               mov        r10, qword ptr [rsp + 0xe8]
00105 418b5a04                       mov        ebx, dword ptr [r10 + 4]
00109 85db                           test       ebx, ebx
0010b 0f8697240000                   jbe        0x7f6a97bedea8
00111 83fb01                         cmp        ebx, 1
00114 0f868e240000                   jbe        0x7f6a97bedea8
0011a 83fb02                         cmp        ebx, 2
0011d 0f8685240000                   jbe        0x7f6a97bedea8
00123 448d56f1                       lea        r10d, [rsi - 0xf]
00127 4585d2                         test       r10d, r10d
0012a 0f8c78240000                   jl         0x7f6a97bedea8
00130 418b4e04                       mov        ecx, dword ptr [r14 + 4]
00134 448d51f1                       lea        r10d, [rcx - 0xf]
00138 4585d2                         test       r10d, r10d
0013b 0f8c67240000                   jl         0x7f6a97bedea8
00141 448d51fd                       lea        r10d, [rcx - 3]
00145 4585d2                         test       r10d, r10d
00148 0f8c5a240000                   jl         0x7f6a97bedea8
0014e 448d51f9                       lea        r10d, [rcx - 7]
00152 4585d2                         test       r10d, r10d
00155 0f8c4d240000                   jl         0x7f6a97bedea8
0015b 894c2404                       mov        dword ptr [rsp + 4], ecx
0015f 899c24e4000000                 mov        dword ptr [rsp + 0xe4], ebx
00166 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
0016d 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00175 89b424e0000000                 mov        dword ptr [rsp + 0xe0], esi
0017c 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
00181 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
00186 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0018b 4c89442420                     mov        qword ptr [rsp + 0x20], r8
00190 498bde                         mov        rbx, r14
00193 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
00198 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
001a0 8bd9                           mov        ebx, ecx
001a2 448bee                         mov        r13d, esi
001a5 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
001aa 448d5bfd                       lea        r11d, [rbx - 3]
001ae 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
001b3 4183c5f1                       add        r13d, -0xf
001b7 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
001bc 4c63f3                         movsxd     r14, ebx
001bf 448d6bf9                       lea        r13d, [rbx - 7]
001c3 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
001c8 83c3f1                         add        ebx, -0xf
001cb 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
001d2 498d5ef1                       lea        rbx, [r14 - 0xf]
001d6 48899c2498000000               mov        qword ptr [rsp + 0x98], rbx
001de 4983c6f9                       add        r14, -7
001e2 4c89b424a0000000               mov        qword ptr [rsp + 0xa0], r14
001ea 4533d2                         xor        r10d, r10d
001ed 33db                           xor        ebx, ebx
001ef 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
001f6 e9b2040000                     jmp        0x7f6a97bebfad
001fb 448bdd                         mov        r11d, ebp
001fe 4d63d3                         movsxd     r10, r11d
00201 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00208 c442a8f5db                     bzhi       r11, r11, r10
0020d c4c1fb92fb                     kmovq      k7, r11
00212 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00218 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0021e 4403ed                         add        r13d, ebp
00221 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00225 418502                         test       dword ptr [r10], eax
00228 443b6c2448                     cmp        r13d, dword ptr [rsp + 0x48]
0022d 0f8d51040000                   jge        0x7f6a97bebf84
00233 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
00238 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0023d 452bdd                         sub        r11d, r13d
00240 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00245 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
00249 412bed                         sub        ebp, r13d
0024c 413bed                         cmp        ebp, r13d
0024f 410f4fed                       cmovg      ebp, r13d
00253 4585db                         test       r11d, r11d
00256 0f8c941f0000                   jl         0x7f6a97bedaf0
0025c 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00261 4585db                         test       r11d, r11d
00264 0f8c861f0000                   jl         0x7f6a97bedaf0
0026a 448bd5                         mov        r10d, ebp
0026d 4403542460                     add        r10d, dword ptr [rsp + 0x60]
00272 448b742404                     mov        r14d, dword ptr [rsp + 4]
00277 453bf2                         cmp        r14d, r10d
0027a 0f82701f0000                   jb         0x7f6a97bedaf0
00280 448b74245c                     mov        r14d, dword ptr [rsp + 0x5c]
00285 4403f5                         add        r14d, ebp
00288 448b542404                     mov        r10d, dword ptr [rsp + 4]
0028d 453bd6                         cmp        r10d, r14d
00290 0f825a1f0000                   jb         0x7f6a97bedaf0
00296 85ed                           test       ebp, ebp
00298 0f8c521f0000                   jl         0x7f6a97bedaf0
0029e 85ed                           test       ebp, ebp
002a0 0f8478ffffff                   je         0x7f6a97bebb1e
002a6 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
002ae 4b8d741808                     lea        rsi, [r8 + r11 + 8]
002b3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
002b8 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
002bd 4863d5                         movsxd     rdx, ebp
002c0 4883fa20                       cmp        rdx, 0x20
002c4 0f8631ffffff                   jbe        0x7f6a97bebafb
002ca c5f877                         vzeroupper 
002cd 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
002d7 41ffd2                         call       r10
002da 0f1f840000000000               nop        dword ptr [rax + rax]
002e2 e937ffffff                     jmp        0x7f6a97bebb1e
002e7 48894424f8                     mov        qword ptr [rsp - 8], rax
002ec 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
002f0 898424ac000000                 mov        dword ptr [rsp + 0xac], eax
002f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
002fc 4585ed                         test       r13d, r13d
002ff 0f8e3f130000                   jle        0x7f6a97becf44
00305 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0030a 44034c244c                     add        r9d, dword ptr [rsp + 0x4c]
0030f 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00317 0f8f73140000                   jg         0x7f6a97bed090
0031d 458d041a                       lea        r8d, [r10 + rbx]
00321 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00329 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
00331 0f8ff1140000                   jg         0x7f6a97bed128
00337 83fb10                         cmp        ebx, 0x10
0033a 0f8f18070000                   jg         0x7f6a97bec358
00340 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
00345 0f83d0100000                   jae        0x7f6a97becd1b
0034b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00350 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00357 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
0035e 0f834c110000                   jae        0x7f6a97becdb0
00364 468d3413                       lea        r14d, [rbx + r10]
00368 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00370 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00378 c4c17a7f440608                 vmovdqu    xmmword ptr [r14 + rax + 8], xmm0
0037f 03d8                           add        ebx, eax
00381 448bf3                         mov        r14d, ebx
00384 452bf5                         sub        r14d, r13d
00387 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0038c 4183f910                       cmp        r9d, 0x10
00390 7f47                           jg         0x7f6a97bebcd9
00392 4183fd10                       cmp        r13d, 0x10
00396 7c41                           jl         0x7f6a97bebcd9
00398 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
003a0 0f83a2110000                   jae        0x7f6a97bece48
003a6 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
003ae c4817a6f443508                 vmovdqu    xmm0, xmmword ptr [r13 + r14 + 8]
003b5 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
003bc 0f8302120000                   jae        0x7f6a97becec4
003c2 c4c17a7f441d08                 vmovdqu    xmmword ptr [r13 + rbx + 8], xmm0
003c9 4403cb                         add        r9d, ebx
003cc 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
003d4 e9ab020000                     jmp        0x7f6a97bebf84
003d9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003e1 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
003e6 498d741a08                     lea        rsi, [r10 + rbx + 8]
003eb 458d1c19                       lea        r11d, [r9 + rbx]
003ef 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
003f7 4d63c3                         movsxd     r8, r11d
003fa 453be9                         cmp        r13d, r9d
003fd 0f8c6b040000                   jl         0x7f6a97bec16e
00403 4183f930                       cmp        r9d, 0x30
00407 0f8e89000000                   jle        0x7f6a97bebd96
0040d 4585f6                         test       r14d, r14d
00410 0f8c56180000                   jl         0x7f6a97bed56c
00416 85db                           test       ebx, ebx
00418 0f8c4e180000                   jl         0x7f6a97bed56c
0041e 478d1431                       lea        r10d, [r9 + r14]
00422 448b6c2404                     mov        r13d, dword ptr [rsp + 4]
00427 453bea                         cmp        r13d, r10d
0042a 0f823c180000                   jb         0x7f6a97bed56c
00430 453beb                         cmp        r13d, r11d
00433 0f8233180000                   jb         0x7f6a97bed56c
00439 4585c9                         test       r9d, r9d
0043c 0f8422180000                   je         0x7f6a97bed564
00442 4963d1                         movsxd     rdx, r9d
00445 4883fa20                       cmp        rdx, 0x20
00449 772b                           ja         0x7f6a97bebd76
0044b 458bd1                         mov        r10d, r9d
0044e 4d63d2                         movsxd     r10, r10d
00451 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00458 c442a8f5db                     bzhi       r11, r11, r10
0045d c4c1fb92fb                     kmovq      k7, r11
00462 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00468 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0046e 418be9                         mov        ebp, r9d
00471 e905020000                     jmp        0x7f6a97bebf7b
00476 418be9                         mov        ebp, r9d
00479 c5f877                         vzeroupper 
0047c 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00486 41ffd2                         call       r10
00489 0f1f840000000000               nop        dword ptr [rax + rax]
00491 e9e5010000                     jmp        0x7f6a97bebf7b
00496 443b74246c                     cmp        r14d, dword ptr [rsp + 0x6c]
0049b 0f831b150000                   jae        0x7f6a97bed2bc
004a1 4963d6                         movsxd     rdx, r14d
004a4 498b7c1208                     mov        rdi, qword ptr [r10 + rdx + 8]
004a9 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
004ad 0f8389150000                   jae        0x7f6a97bed33c
004b3 8bcb                           mov        ecx, ebx
004b5 448d5908                       lea        r11d, [rcx + 8]
004b9 4c63d1                         movsxd     r10, ecx
004bc 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
004c4 4b897c1508                     mov        qword ptr [r13 + r10 + 8], rdi
004c9 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
004d1 7c08                           jl         0x7f6a97bebddb
004d3 418be9                         mov        ebp, r9d
004d6 e9a0010000                     jmp        0x7f6a97bebf7b
004db 492bd2                         sub        rdx, r10
004de 4963fb                         movsxd     rdi, r11d
004e1 4c8d1417                       lea        r10, [rdi + rdx]
004e5 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
004ed 0f83d1150000                   jae        0x7f6a97bed3c4
004f3 4d8bd0                         mov        r10, r8
004f6 4c2bd7                         sub        r10, rdi
004f9 4983c207                       add        r10, 7
004fd 4983e2f8                       and        r10, 0xfffffffffffffff8
00501 458bd2                         mov        r10d, r10d
00504 418d7c0a08                     lea        edi, [r10 + rcx + 8]
00509 4c63d7                         movsxd     r10, edi
0050c 498d7c12f8                     lea        rdi, [r10 + rdx - 8]
00511 483bbc24a0000000               cmp        rdi, qword ptr [rsp + 0xa0]
00519 0f83a5150000                   jae        0x7f6a97bed3c4
0051f 443b5c246c                     cmp        r11d, dword ptr [rsp + 0x6c]
00524 0f839a150000                   jae        0x7f6a97bed3c4
0052a 4983c2f8                       add        r10, -8
0052e 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00536 0f8388150000                   jae        0x7f6a97bed3c4
0053c 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00544 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
0054b 0f8f0f160000                   jg         0x7f6a97bed460
00551 442bf1                         sub        r14d, ecx
00554 83c110                         add        ecx, 0x10
00557 418be9                         mov        ebp, r9d
0055a 478d141e                       lea        r10d, [r14 + r11]
0055e 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00566 4f8b541508                     mov        r10, qword ptr [r13 + r10 + 8]
0056b 458bcb                         mov        r9d, r11d
0056e 4f89540d08                     mov        qword ptr [r13 + r9 + 8], r10
00573 458d5308                       lea        r10d, [r11 + 8]
00577 443bd1                         cmp        r10d, ecx
0057a 7d05                           jge        0x7f6a97bebe81
0057c 458bda                         mov        r11d, r10d
0057f ebd9                           jmp        0x7f6a97bebe5a
00581 4983c0f8                       add        r8, -8
00585 4981f800000080                 cmp        r8, -0x80000000
0058c 49c7c100000080                 mov        r9, 0xffffffff80000000
00593 4d0f4cc1                       cmovl      r8, r9
00597 418bc8                         mov        ecx, r8d
0059a 443bd1                         cmp        r10d, ecx
0059d 0f8d85000000                   jge        0x7f6a97bebf28
005a3 4d63c2                         movsxd     r8, r10d
005a6 4c03c2                         add        r8, rdx
005a9 4c3b8424a0000000               cmp        r8, qword ptr [rsp + 0xa0]
005b1 0f8335160000                   jae        0x7f6a97bed4ec
005b7 4183c310                       add        r11d, 0x10
005bb 4d63c3                         movsxd     r8, r11d
005be 4c03c2                         add        r8, rdx
005c1 4c3b8424a0000000               cmp        r8, qword ptr [rsp + 0xa0]
005c9 0f8331160000                   jae        0x7f6a97bed500
005cf 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
005d4 0f833a160000                   jae        0x7f6a97bed514
005da 443b5c246c                     cmp        r11d, dword ptr [rsp + 0x6c]
005df 0f8343160000                   jae        0x7f6a97bed528
005e5 90                             nop        
005e6 90                             nop        
005e7 90                             nop        
005e8 90                             nop        
005e9 90                             nop        
005ea 90                             nop        
005eb 90                             nop        
005ec 90                             nop        
005ed 90                             nop        
005ee 90                             nop        
005ef 90                             nop        
005f0 478d0416                       lea        r8d, [r14 + r10]
005f4 458bca                         mov        r9d, r10d
005f7 4963f9                         movsxd     rdi, r9d
005fa 458bd8                         mov        r11d, r8d
005fd 4b8b741d08                     mov        rsi, qword ptr [r13 + r11 + 8]
00602 4d63c0                         movsxd     r8, r8d
00605 458bda                         mov        r11d, r10d
00608 4b89741d08                     mov        qword ptr [r13 + r11 + 8], rsi
0060d 4f8b5c0510                     mov        r11, qword ptr [r13 + r8 + 0x10]
00612 4d895c3d10                     mov        qword ptr [r13 + rdi + 0x10], r11
00617 4183c210                       add        r10d, 0x10
0061b 443bd1                         cmp        r10d, ecx
0061e 7cd0                           jl         0x7f6a97bebef0
00620 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
00628 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00630 7d49                           jge        0x7f6a97bebf7b
00632 4d63da                         movsxd     r11, r10d
00635 4c03da                         add        r11, rdx
00638 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00640 0f83f6150000                   jae        0x7f6a97bed53c
00646 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
0064b 0f83ff150000                   jae        0x7f6a97bed550
00651 90                             nop        
00652 90                             nop        
00653 90                             nop        
00654 478d0416                       lea        r8d, [r14 + r10]
00658 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00660 4f8b440508                     mov        r8, qword ptr [r13 + r8 + 8]
00665 458bda                         mov        r11d, r10d
00668 4f89441d08                     mov        qword ptr [r13 + r11 + 8], r8
0066d 4183c208                       add        r10d, 8
00671 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00679 7cd9                           jl         0x7f6a97bebf54
0067b 03dd                           add        ebx, ebp
0067d 899c24a8000000                 mov        dword ptr [rsp + 0xa8], ebx
00684 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
0068b ffc3                           inc        ebx
0068d 3b5c2438                       cmp        ebx, dword ptr [rsp + 0x38]
00691 0f8db0050000                   jge        0x7f6a97bec547
00697 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
0069e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
006a6 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
006ad 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
006b2 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
006b9 4d8b5cdb08                     mov        r11, qword ptr [r11 + rbx*8 + 8]
006be 418bdb                         mov        ebx, r11d
006c1 81e3ffff0100                   and        ebx, 0x1ffff
006c7 4d8bc3                         mov        r8, r11
006ca 49c1e812                       shr        r8, 0x12
006ce 49c1fb24                       sar        r11, 0x24
006d2 458bf0                         mov        r14d, r8d
006d5 458beb                         mov        r13d, r11d
006d8 4181e6ffff0300                 and        r14d, 0x3ffff
006df 4489742448                     mov        dword ptr [rsp + 0x48], r14d
006e4 4585ed                         test       r13d, r13d
006e7 0f8c930f0000                   jl         0x7f6a97becf80
006ed 85db                           test       ebx, ebx
006ef 0f8599000000                   jne        0x7f6a97bec08e
006f5 33db                           xor        ebx, ebx
006f7 4183fd03                       cmp        r13d, 3
006fb 0f8ed3000000                   jle        0x7f6a97bec0d4
00701 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00709 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
0070d 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00715 45895810                       mov        dword ptr [r8 + 0x10], r11d
00719 458b4008                       mov        r8d, dword ptr [r8 + 8]
0071d 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00725 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00729 4183c5fd                       add        r13d, -3
0072d 45896b08                       mov        dword ptr [r11 + 8], r13d
00731 4963ed                         movsxd     rbp, r13d
00734 4c63d8                         movsxd     r11, eax
00737 4c035c2420                     add        r11, qword ptr [rsp + 0x20]
0073c 4863d3                         movsxd     rdx, ebx
0073f 4c03da                         add        r11, rdx
00742 493beb                         cmp        rbp, r11
00745 0f8fc90f0000                   jg         0x7f6a97bed014
0074b 448d3418                       lea        r14d, [rax + rbx]
0074f 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
00754 452bf5                         sub        r14d, r13d
00757 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0075c 4585c9                         test       r9d, r9d
0075f 0f8582fbffff                   jne        0x7f6a97bebbe7
00765 4d63c6                         movsxd     r8, r14d
00768 4c3b442428                     cmp        r8, qword ptr [rsp + 0x28]
0076d 0f8c49110000                   jl         0x7f6a97bed1bc
00773 483b6c2430                     cmp        rbp, qword ptr [rsp + 0x30]
00778 0f8fbe110000                   jg         0x7f6a97bed23c
0077e 4533c0                         xor        r8d, r8d
00781 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00789 e96efbffff                     jmp        0x7f6a97bebbfc
0078e 448b0424                       mov        r8d, dword ptr [rsp]
00792 452bc2                         sub        r8d, r10d
00795 413bd8                         cmp        ebx, r8d
00798 0f8e59ffffff                   jle        0x7f6a97bebff7
0079e be45ffffff                     mov        esi, 0xffffff45
007a3 8beb                           mov        ebp, ebx
007a5 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
007ad 90                             nop        
007ae 90                             nop        
007af 90                             nop        
007b0 c5f877                         vzeroupper 
007b3 e8a819aeff                     call       0x7f6a976cda60
007b8 0f1f8400b0080001               nop        dword ptr [rax + rax + 0x10008b0]
007c0 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
007ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
007ce e88d241318                     call       0x7f6aafd1e560
007d3 f4                             hlt        
007d4 85db                           test       ebx, ebx
007d6 7403                           je         0x7f6a97bec0db
007d8 41ffcd                         dec        r13d
007db 4585ed                         test       r13d, r13d
007de 750e                           jne        0x7f6a97bec0ee
007e0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
007e8 458b4308                       mov        r8d, dword ptr [r11 + 8]
007ec eb78                           jmp        0x7f6a97bec166
007ee 4183fd03                       cmp        r13d, 3
007f2 0f84e81a0000                   je         0x7f6a97bedbe0
007f8 4183fd02                       cmp        r13d, 2
007fc 0f87761b0000                   ja         0x7f6a97bedc78
00802 443bac24e4000000               cmp        r13d, dword ptr [rsp + 0xe4]
0080a 0f832a160000                   jae        0x7f6a97bed73a
00810 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00818 478b44ab08                     mov        r8d, dword ptr [r11 + r13*4 + 8]
0081d 4585ed                         test       r13d, r13d
00820 7e38                           jle        0x7f6a97bec15a
00822 458d5dff                       lea        r11d, [r13 - 1]
00826 443b9c24e4000000               cmp        r11d, dword ptr [rsp + 0xe4]
0082e 0f83101a0000                   jae        0x7f6a97bedb44
00834 90                             nop        
00835 90                             nop        
00836 90                             nop        
00837 90                             nop        
00838 90                             nop        
00839 90                             nop        
0083a 90                             nop        
0083b 90                             nop        
0083c 90                             nop        
0083d 90                             nop        
0083e 90                             nop        
0083f 90                             nop        
00840 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00848 478b4cab04                     mov        r9d, dword ptr [r11 + r13*4 + 4]
0084d 47894cab08                     mov        dword ptr [r11 + r13*4 + 8], r9d
00852 41ffcd                         dec        r13d
00855 4585ed                         test       r13d, r13d
00858 7fe6                           jg         0x7f6a97bec140
0085a 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
00862 45894308                       mov        dword ptr [r11 + 8], r8d
00866 458be8                         mov        r13d, r8d
00869 e9c3feffff                     jmp        0x7f6a97bec031
0086e 4183fd10                       cmp        r13d, 0x10
00872 0f8da9080000                   jge        0x7f6a97beca21
00878 4183fd08                       cmp        r13d, 8
0087c 0f8d83040000                   jge        0x7f6a97bec605
00882 4183f910                       cmp        r9d, 0x10
00886 0f8f39010000                   jg         0x7f6a97bec2c5
0088c 443b742404                     cmp        r14d, dword ptr [rsp + 4]
00891 0f8358160000                   jae        0x7f6a97bed7ef
00897 430fbe6c3208                   movsx      ebp, byte ptr [r10 + r14 + 8]
0089d 3b5c2404                       cmp        ebx, dword ptr [rsp + 4]
008a1 0f83c5160000                   jae        0x7f6a97bed86c
008a7 41886c1a08                     mov        byte ptr [r10 + rbx + 8], bpl
008ac 448d5b01                       lea        r11d, [rbx + 1]
008b0 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
008b5 458d5e03                       lea        r11d, [r14 + 3]
008b9 443b5c2404                     cmp        r11d, dword ptr [rsp + 4]
008be 0f8308170000                   jae        0x7f6a97bed8cc
008c4 4d63c6                         movsxd     r8, r14d
008c7 430fbe6c0209                   movsx      ebp, byte ptr [r10 + r8 + 9]
008cd 448d5b03                       lea        r11d, [rbx + 3]
008d1 443b5c2404                     cmp        r11d, dword ptr [rsp + 4]
008d6 0f8354170000                   jae        0x7f6a97bed930
008dc 4863cb                         movsxd     rcx, ebx
008df 41886c0a09                     mov        byte ptr [r10 + rcx + 9], bpl
008e4 470fbe54020a                   movsx      r10d, byte ptr [r10 + r8 + 0xa]
008ea 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
008f2 4588540b0a                     mov        byte ptr [r11 + rcx + 0xa], r10b
008f7 470fbe54030b                   movsx      r10d, byte ptr [r11 + r8 + 0xb]
008fd 4588540b0b                     mov        byte ptr [r11 + rcx + 0xb], r10b
00902 4183fd08                       cmp        r13d, 8
00906 0f8384170000                   jae        0x7f6a97bed990
0090c 49ba20ae28e300000000           movabs     r10, 0xe328ae20
00916 470374aa08                     add        r14d, dword ptr [r10 + r13*4 + 8]
0091b 4183f904                       cmp        r9d, 4
0091f 7e44                           jle        0x7f6a97bec265
00921 448d5304                       lea        r10d, [rbx + 4]
00925 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0092a 443b742458                     cmp        r14d, dword ptr [rsp + 0x58]
0092f 0f83df170000                   jae        0x7f6a97beda14
00935 458bde                         mov        r11d, r14d
00938 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0093d 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00945 438b6c1808                     mov        ebp, dword ptr [r8 + r11 + 8]
0094a 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0094f 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
00954 0f833e180000                   jae        0x7f6a97beda98
0095a 448bdb                         mov        r11d, ebx
0095d 4d63db                         movsxd     r11, r11d
00960 43896c180c                     mov        dword ptr [r8 + r11 + 0xc], ebp
00965 4183f908                       cmp        r9d, 8
00969 0f8e15fdffff                   jle        0x7f6a97bebf84
0096f 448d5308                       lea        r10d, [rbx + 8]
00973 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00978 49ba48ae28e300000000           movabs     r10, 0xe328ae48
00982 478b54aa08                     mov        r10d, dword ptr [r10 + r13*4 + 8]
00987 452bf2                         sub        r14d, r10d
0098a 418d6e08                       lea        ebp, [r14 + 8]
0098e 3b6c246c                       cmp        ebp, dword ptr [rsp + 0x6c]
00992 0f83781a0000                   jae        0x7f6a97bedd10
00998 4d63d6                         movsxd     r10, r14d
0099b 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
009a3 4b8b6c1510                     mov        rbp, qword ptr [r13 + r10 + 0x10]
009a8 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
009ad 443b5c246c                     cmp        r11d, dword ptr [rsp + 0x6c]
009b2 0f83ac1a0000                   jae        0x7f6a97bedd64
009b8 4c63d3                         movsxd     r10, ebx
009bb 4b896c1510                     mov        qword ptr [r13 + r10 + 0x10], rbp
009c0 e9bffcffff                     jmp        0x7f6a97bebf84
009c5 4585f6                         test       r14d, r14d
009c8 0f8cde1a0000                   jl         0x7f6a97beddac
009ce 85db                           test       ebx, ebx
009d0 0f8cd61a0000                   jl         0x7f6a97beddac
009d6 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
009db 443bdb                         cmp        r11d, ebx
009de 0f82c81a0000                   jb         0x7f6a97beddac
009e4 468d142b                       lea        r10d, [rbx + r13]
009e8 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
009ed 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
009f2 0f82b41a0000                   jb         0x7f6a97beddac
009f8 4585ed                         test       r13d, r13d
009fb 0f8cab1a0000                   jl         0x7f6a97beddac
00a01 4585ed                         test       r13d, r13d
00a04 0f842ef8ffff                   je         0x7f6a97bebb38
00a0a 4883fd20                       cmp        rbp, 0x20
00a0e 7728                           ja         0x7f6a97bec338
00a10 458bdd                         mov        r11d, r13d
00a13 4d63d3                         movsxd     r10, r11d
00a16 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a1d c442a8f5db                     bzhi       r11, r11, r10
00a22 c4c1fb92fb                     kmovq      k7, r11
00a27 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a2d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a33 e900f8ffff                     jmp        0x7f6a97bebb38
00a38 488bd5                         mov        rdx, rbp
00a3b c5f877                         vzeroupper 
00a3e 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00a48 41ffd2                         call       r10
00a4b 0f1f840000000000               nop        dword ptr [rax + rax]
00a53 e9e0f7ffff                     jmp        0x7f6a97bebb38
00a58 83fb30                         cmp        ebx, 0x30
00a5b 0f8e9b000000                   jle        0x7f6a97bec3fc
00a61 4585d2                         test       r10d, r10d
00a64 0f8c421d0000                   jl         0x7f6a97bee0ac
00a6a 85c0                           test       eax, eax
00a6c 0f8c3a1d0000                   jl         0x7f6a97bee0ac
00a72 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00a7a 443b842494000000               cmp        r8d, dword ptr [rsp + 0x94]
00a82 0f82241d0000                   jb         0x7f6a97bee0ac
00a88 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00a8d 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00a92 0f82141d0000                   jb         0x7f6a97bee0ac
00a98 85db                           test       ebx, ebx
00a9a 743d                           je         0x7f6a97bec3d9
00a9c 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00aa1 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00aa6 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00aae 498d740308                     lea        rsi, [r11 + rax + 8]
00ab3 4883fa20                       cmp        rdx, 0x20
00ab7 7729                           ja         0x7f6a97bec3e2
00ab9 4c63d3                         movsxd     r10, ebx
00abc 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ac3 c442a8f5db                     bzhi       r11, r11, r10
00ac8 c4c1fb92fb                     kmovq      k7, r11
00acd 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ad3 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00ad9 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00add e9a5f8ffff                     jmp        0x7f6a97bebc87
00ae2 c5f877                         vzeroupper 
00ae5 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00aef 41ffd2                         call       r10
00af2 0f1f840000000000               nop        dword ptr [rax + rax]
00afa ebdd                           jmp        0x7f6a97bec3d9
00afc 443b542468                     cmp        r10d, dword ptr [rsp + 0x68]
00b01 0f83511b0000                   jae        0x7f6a97bedf58
00b07 4d63da                         movsxd     r11, r10d
00b0a 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
00b0f c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00b16 3b842490000000                 cmp        eax, dword ptr [rsp + 0x90]
00b1d 0f83e11b0000                   jae        0x7f6a97bee004
00b23 4863c8                         movsxd     rcx, eax
00b26 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00b2e c4c17a7f440808                 vmovdqu    xmmword ptr [r8 + rcx + 8], xmm0
00b35 448d4810                       lea        r9d, [rax + 0x10]
00b39 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00b3e 443b4c244c                     cmp        r9d, dword ptr [rsp + 0x4c]
00b43 0f8dc4000000                   jge        0x7f6a97bec50d
00b49 4c2bd9                         sub        r11, rcx
00b4c 4d63c9                         movsxd     r9, r9d
00b4f 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
00b54 4883c1f1                       add        rcx, -0xf
00b58 4f8d0419                       lea        r8, [r9 + r11]
00b5c 4c3bc1                         cmp        r8, rcx
00b5f 0f83db1c0000                   jae        0x7f6a97bee140
00b65 4c6344244c                     movsxd     r8, dword ptr [rsp + 0x4c]
00b6a 4d2bc1                         sub        r8, r9
00b6d 4983c00f                       add        r8, 0xf
00b71 4983e0f0                       and        r8, 0xfffffffffffffff0
00b75 458bc8                         mov        r9d, r8d
00b78 458d440110                     lea        r8d, [r9 + rax + 0x10]
00b7d 4d63c0                         movsxd     r8, r8d
00b80 4f8d5c18f0                     lea        r11, [r8 + r11 - 0x10]
00b85 4c3bd9                         cmp        r11, rcx
00b88 0f83b21c0000                   jae        0x7f6a97bee140
00b8e 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00b93 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00b9b 0f839f1c0000                   jae        0x7f6a97bee140
00ba1 4983c0f0                       add        r8, -0x10
00ba5 4c3b842498000000               cmp        r8, qword ptr [rsp + 0x98]
00bad 0f838d1c0000                   jae        0x7f6a97bee140
00bb3 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00bb8 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
00bbf 0f8feb1c0000                   jg         0x7f6a97bee1b0
00bc5 458bc2                         mov        r8d, r10d
00bc8 442bc0                         sub        r8d, eax
00bcb 90                             nop        
00bcc 90                             nop        
00bcd 90                             nop        
00bce 90                             nop        
00bcf 90                             nop        
00bd0 458bc8                         mov        r9d, r8d
00bd3 44034c245c                     add        r9d, dword ptr [rsp + 0x5c]
00bd8 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00bdd c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
00be4 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00be9 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00bf1 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00bf8 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00bfd 4183c310                       add        r11d, 0x10
00c01 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00c06 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
00c0b 7cc3                           jl         0x7f6a97bec4d0
00c0d 468d0413                       lea        r8d, [rbx + r10]
00c11 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00c15 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00c1d e965f7ffff                     jmp        0x7f6a97bebc87
00c22 4c63d5                         movsxd     r10, ebp
00c25 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c2c c442a8f5db                     bzhi       r11, r11, r10
00c31 c4c1fb92fb                     kmovq      k7, r11
00c36 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c3c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c42 e9a4000000                     jmp        0x7f6a97bec5eb
00c47 8b2c24                         mov        ebp, dword ptr [rsp]
00c4a 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00c51 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00c59 4585c0                         test       r8d, r8d
00c5c 0f8c92190000                   jl         0x7f6a97bedef4
00c62 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
00c67 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
00c6c 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00c73 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
00c7b 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00c83 4585d2                         test       r10d, r10d
00c86 0f8c82190000                   jl         0x7f6a97bedf0e
00c8c 3b3424                         cmp        esi, dword ptr [rsp]
00c8f 0f8279190000                   jb         0x7f6a97bedf0e
00c95 458b4e04                       mov        r9d, dword ptr [r14 + 4]
00c99 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00ca1 4403ed                         add        r13d, ebp
00ca4 453bcd                         cmp        r9d, r13d
00ca7 0f8261190000                   jb         0x7f6a97bedf0e
00cad 85ed                           test       ebp, ebp
00caf 0f8c59190000                   jl         0x7f6a97bedf0e
00cb5 85ed                           test       ebp, ebp
00cb7 7432                           je         0x7f6a97bec5eb
00cb9 4b8d7c0308                     lea        rdi, [r11 + r8 + 8]
00cbe 4d8bde                         mov        r11, r14
00cc1 4b8d741608                     lea        rsi, [r14 + r10 + 8]
00cc6 4863d5                         movsxd     rdx, ebp
00cc9 4883fa20                       cmp        rdx, 0x20
00ccd 0f864fffffff                   jbe        0x7f6a97bec522
00cd3 c5f877                         vzeroupper 
00cd6 49ba409171976a7f0000           movabs     r10, 0x7f6a97719140
00ce0 41ffd2                         call       r10
00ce3 0f1f840000000000               nop        dword ptr [rax + rax]
00ceb 44896b38                       mov        dword ptr [rbx + 0x38], r13d
00cef c5f877                         vzeroupper 
00cf2 4881c4d0000000                 add        rsp, 0xd0
00cf9 5d                             pop        rbp
00cfa 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00cfe 0f87c8210000                   ja         0x7f6a97bee7cc
00d04 c3                             ret        
00d05 443b74246c                     cmp        r14d, dword ptr [rsp + 0x6c]
00d0a 0f83101c0000                   jae        0x7f6a97bee220
00d10 458bde                         mov        r11d, r14d
00d13 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00d18 4963cb                         movsxd     rcx, r11d
00d1b 4d8b540a08                     mov        r10, qword ptr [r10 + rcx + 8]
00d20 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00d25 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
00d29 0f83691c0000                   jae        0x7f6a97bee298
00d2f 448bcb                         mov        r9d, ebx
00d32 418d6908                       lea        ebp, [r9 + 8]
00d36 896c2440                       mov        dword ptr [rsp + 0x40], ebp
00d3a 4d63d1                         movsxd     r10, r9d
00d3d 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
00d42 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00d4a 4f895c1508                     mov        qword ptr [r13 + r10 + 8], r11
00d4f 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
00d56 0f8d28f9ffff                   jge        0x7f6a97bebf84
00d5c 492bca                         sub        rcx, r10
00d5f 4863fd                         movsxd     rdi, ebp
00d62 4c8d140f                       lea        r10, [rdi + rcx]
00d66 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00d6e 0f83981c0000                   jae        0x7f6a97bee30c
00d74 4d8bd0                         mov        r10, r8
00d77 4c2bd7                         sub        r10, rdi
00d7a 4983c207                       add        r10, 7
00d7e 4983e2f8                       and        r10, 0xfffffffffffffff8
00d82 458bda                         mov        r11d, r10d
00d85 478d540b08                     lea        r10d, [r11 + r9 + 8]
00d8a 4d63d2                         movsxd     r10, r10d
00d8d 4d8d5c0af8                     lea        r11, [r10 + rcx - 8]
00d92 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00d9a 0f836c1c0000                   jae        0x7f6a97bee30c
00da0 3b6c246c                       cmp        ebp, dword ptr [rsp + 0x6c]
00da4 0f83621c0000                   jae        0x7f6a97bee30c
00daa 4983c2f8                       add        r10, -8
00dae 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00db6 0f83501c0000                   jae        0x7f6a97bee30c
00dbc 448bac24a8000000               mov        r13d, dword ptr [rsp + 0xa8]
00dc4 4181fdf8ffff7f                 cmp        r13d, 0x7ffffff8
00dcb 0f8fcf1c0000                   jg         0x7f6a97bee3a0
00dd1 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
00dd5 412be9                         sub        ebp, r9d
00dd8 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00de0 458bd5                         mov        r10d, r13d
00de3 bef8ffffff                     mov        esi, 0xfffffff8
00de8 412bf2                         sub        esi, r10d
00deb 412bf1                         sub        esi, r9d
00dee 4183c110                       add        r9d, 0x10
00df2 83c6f0                         add        esi, -0x10
00df5 4c8b6c2410                     mov        r13, qword ptr [rsp + 0x10]
00dfa 498bc5                         mov        rax, r13
00dfd 4d8d50c8                       lea        r10, [r8 - 0x38]
00e01 4981fa00000080                 cmp        r10, -0x80000000
00e08 49c7c300000080                 mov        r11, 0xffffffff80000000
00e0f 4d0f4cd3                       cmovl      r10, r11
00e13 418bd2                         mov        edx, r10d
00e16 442bf3                         sub        r14d, ebx
00e19 4d63d1                         movsxd     r10, r9d
00e1c 41bb06000000                   mov        r11d, 6
00e22 c462a0f5de                     bzhi       r11, rsi, r11
00e27 4d03d3                         add        r10, r11
00e2a 4d3bd0                         cmp        r10, r8
00e2d 498bd8                         mov        rbx, r8
00e30 490f4cda                       cmovl      rbx, r10
00e34 4c8bd3                         mov        r10, rbx
00e37 4c2bd7                         sub        r10, rdi
00e3a 4d8d5aff                       lea        r11, [r10 - 1]
00e3e 49c1fb3f                       sar        r11, 0x3f
00e42 49c1eb3d                       shr        r11, 0x3d
00e46 4f8d5413ff                     lea        r10, [r11 + r10 - 1]
00e4b 4983e2f8                       and        r10, 0xfffffffffffffff8
00e4f 4c03d7                         add        r10, rdi
00e52 493bfa                         cmp        rdi, r10
00e55 490f4cfa                       cmovl      rdi, r10
00e59 448bdf                         mov        r11d, edi
00e5c 478d541e08                     lea        r10d, [r14 + r11 + 8]
00e61 4183c308                       add        r11d, 8
00e65 4963fa                         movsxd     rdi, r10d
00e68 4803f8                         add        rdi, rax
00e6b 4963f3                         movsxd     rsi, r11d
00e6e 4803f0                         add        rsi, rax
00e71 4c8d5708                       lea        r10, [rdi + 8]
00e75 4883c748                       add        rdi, 0x48
00e79 488d4648                       lea        rax, [rsi + 0x48]
00e7d 4533db                         xor        r11d, r11d
00e80 493bc2                         cmp        rax, r10
00e83 410f96c3                       setbe      r11b
00e87 4883c608                       add        rsi, 8
00e8b 4533d2                         xor        r10d, r10d
00e8e 483bfe                         cmp        rdi, rsi
00e91 410f96c2                       setbe      r10b
00e95 450bda                         or         r11d, r10d
00e98 0f844e0e0000                   je         0x7f6a97bed5ec
00e9e 448bd3                         mov        r10d, ebx
00ea1 eb05                           jmp        0x7f6a97bec7a8
00ea3 90                             nop        
00ea4 895c2440                       mov        dword ptr [rsp + 0x40], ebx
00ea8 448bcd                         mov        r9d, ebp
00eab 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
00eb0 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
00eb8 4f8b4c0d08                     mov        r9, qword ptr [r13 + r9 + 8]
00ebd 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00ec2 4f894c1d08                     mov        qword ptr [r13 + r11 + 8], r9
00ec7 8b5c2440                       mov        ebx, dword ptr [rsp + 0x40]
00ecb 83c308                         add        ebx, 8
00ece 413bda                         cmp        ebx, r10d
00ed1 7cd1                           jl         0x7f6a97bec7a4
00ed3 4981c008feffff                 add        r8, -0x1f8
00eda 4981f800000080                 cmp        r8, -0x80000000
00ee1 49c7c200000080                 mov        r10, 0xffffffff80000000
00ee8 4d0f4cc2                       cmovl      r8, r10
00eec 418bf0                         mov        esi, r8d
00eef 3bde                           cmp        ebx, esi
00ef1 0f8d2d1c0000                   jge        0x7f6a97bee424
00ef7 4c63d3                         movsxd     r10, ebx
00efa 4c03d1                         add        r10, rcx
00efd 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00f05 0f83211c0000                   jae        0x7f6a97bee42c
00f0b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f10 4181c200020000                 add        r10d, 0x200
00f17 4d63da                         movsxd     r11, r10d
00f1a 4c03d9                         add        r11, rcx
00f1d 4c3b9c24a0000000               cmp        r11, qword ptr [rsp + 0xa0]
00f25 0f83151c0000                   jae        0x7f6a97bee440
00f2b 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
00f2f 0f831f1c0000                   jae        0x7f6a97bee454
00f35 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
00f3a 0f83281c0000                   jae        0x7f6a97bee468
00f40 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
00f47 eb0a                           jmp        0x7f6a97bec853
00f49 90                             nop        
00f4a 90                             nop        
00f4b 90                             nop        
00f4c 90                             nop        
00f4d 90                             nop        
00f4e 90                             nop        
00f4f 90                             nop        
00f50 418bd9                         mov        ebx, r9d
00f53 448d142b                       lea        r10d, [rbx + rbp]
00f57 448d9b00010000                 lea        r11d, [rbx + 0x100]
00f5e 4403dd                         add        r11d, ebp
00f61 458bca                         mov        r9d, r10d
00f64 62b17e486f840f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 8]
00f6f 4d63ca                         movsxd     r9, r10d
00f72 458bd3                         mov        r10d, r11d
00f75 4963c3                         movsxd     rax, r11d
00f78 448bdb                         mov        r11d, ebx
00f7b 62b17e487f841f08000000         vmovdqu32  zmmword ptr [rdi + r11 + 8], zmm0
00f86 448bc3                         mov        r8d, ebx
00f89 4d63c0                         movsxd     r8, r8d
00f8c 448d5b40                       lea        r11d, [rbx + 0x40]
00f90 4403dd                         add        r11d, ebp
00f93 62b17e486f841f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11 + 8]
00f9e 62b17e487f840748000000         vmovdqu32  zmmword ptr [rdi + r8 + 0x48], zmm0
00fa9 448d9b80000000                 lea        r11d, [rbx + 0x80]
00fb0 4403dd                         add        r11d, ebp
00fb3 62b17e486f841f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11 + 8]
00fbe 62b17e487f840788000000         vmovdqu32  zmmword ptr [rdi + r8 + 0x88], zmm0
00fc9 62b17e486f840fc8000000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 0xc8]
00fd4 62b17e487f8407c8000000         vmovdqu32  zmmword ptr [rdi + r8 + 0xc8], zmm0
00fdf 62b17e486f841708000000         vmovdqu32  zmm0, zmmword ptr [rdi + r10 + 8]
00fea 62b17e487f840708010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x108], zmm0
00ff5 62b17e486f840f48010000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 0x148]
01000 62b17e487f840748010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x148], zmm0
0100b 62b17e486f840f88010000         vmovdqu32  zmm0, zmmword ptr [rdi + r9 + 0x188]
01016 62b17e487f840788010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x188], zmm0
01021 62f17e486f8407c8000000         vmovdqu32  zmm0, zmmword ptr [rdi + rax + 0xc8]
0102c 62b17e487f8407c8010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x1c8], zmm0
01037 448d8b00020000                 lea        r9d, [rbx + 0x200]
0103e 443bce                         cmp        r9d, esi
01041 0f8c09ffffff                   jl         0x7f6a97bec850
01047 443bca                         cmp        r9d, edx
0104a 7d57                           jge        0x7f6a97bec9a3
0104c 81c338020000                   add        ebx, 0x238
01052 4c63d3                         movsxd     r10, ebx
01055 4c03d1                         add        r10, rcx
01058 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01060 0f832a1b0000                   jae        0x7f6a97bee490
01066 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
0106a 0f83481b0000                   jae        0x7f6a97bee4b8
01070 8bdf                           mov        ebx, edi
01072 90                             nop        
01073 90                             nop        
01074 458d1c29                       lea        r11d, [r9 + rbp]
01078 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
01083 458bd1                         mov        r10d, r9d
01086 62b17e487f841308000000         vmovdqu32  zmmword ptr [rbx + r10 + 8], zmm0
01091 4183c140                       add        r9d, 0x40
01095 443bca                         cmp        r9d, edx
01098 7cda                           jl         0x7f6a97bec974
0109a 899c2484000000                 mov        dword ptr [rsp + 0x84], ebx
010a1 eb07                           jmp        0x7f6a97bec9aa
010a3 89bc2484000000                 mov        dword ptr [rsp + 0x84], edi
010aa 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
010b2 0f8dccf5ffff                   jge        0x7f6a97bebf84
010b8 4d63d1                         movsxd     r10, r9d
010bb 4c03d1                         add        r10, rcx
010be 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
010c6 0f83b01a0000                   jae        0x7f6a97bee47c
010cc 443b4c246c                     cmp        r9d, dword ptr [rsp + 0x6c]
010d1 0f83cd1a0000                   jae        0x7f6a97bee4a4
010d7 90                             nop        
010d8 458d1c29                       lea        r11d, [r9 + rbp]
010dc 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
010e3 4e8b5c1b08                     mov        r11, qword ptr [rbx + r11 + 8]
010e8 458bd1                         mov        r10d, r9d
010eb 4e895c1308                     mov        qword ptr [rbx + r10 + 8], r11
010f0 4183c108                       add        r9d, 8
010f4 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
010fc 7cda                           jl         0x7f6a97bec9d8
010fe e981f5ffff                     jmp        0x7f6a97bebf84
01103 4d03da                         add        r11, r10
01106 4c3bdf                         cmp        r11, rdi
01109 7e08                           jle        0x7f6a97beca13
0110b 4533c9                         xor        r9d, r9d
0110e e98defffff                     jmp        0x7f6a97beb9a0
01113 4533c9                         xor        r9d, r9d
01116 41bd01000000                   mov        r13d, 1
0111c e982efffff                     jmp        0x7f6a97beb9a3
01121 443bb42490000000               cmp        r14d, dword ptr [rsp + 0x90]
01129 0f839d1a0000                   jae        0x7f6a97bee4cc
0112f 4963ce                         movsxd     rcx, r14d
01132 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
01139 3b9c2490000000                 cmp        ebx, dword ptr [rsp + 0x90]
01140 0f83fe1a0000                   jae        0x7f6a97bee544
01146 8d6b10                         lea        ebp, [rbx + 0x10]
01149 4c63db                         movsxd     r11, ebx
0114c c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
01153 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
0115a 0f8d24f5ffff                   jge        0x7f6a97bebf84
01160 492bcb                         sub        rcx, r11
01163 4c63dd                         movsxd     r11, ebp
01166 4d8d140b                       lea        r10, [r11 + rcx]
0116a 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
01172 0f834c1b0000                   jae        0x7f6a97bee5c4
01178 4d8bd0                         mov        r10, r8
0117b 4d2bd3                         sub        r10, r11
0117e 4983c20f                       add        r10, 0xf
01182 4983e2f0                       and        r10, 0xfffffffffffffff0
01186 458bda                         mov        r11d, r10d
01189 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
0118e 4d63d2                         movsxd     r10, r10d
01191 4d8d5c0af0                     lea        r11, [r10 + rcx - 0x10]
01196 4c3b9c2498000000               cmp        r11, qword ptr [rsp + 0x98]
0119e 0f83201b0000                   jae        0x7f6a97bee5c4
011a4 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
011ab 0f83131b0000                   jae        0x7f6a97bee5c4
011b1 4983c2f0                       add        r10, -0x10
011b5 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
011bd 0f83011b0000                   jae        0x7f6a97bee5c4
011c3 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
011cb 4181fbf0ffff7f                 cmp        r11d, 0x7ffffff0
011d2 0f8f481b0000                   jg         0x7f6a97bee620
011d8 442bf3                         sub        r14d, ebx
011db 83c320                         add        ebx, 0x20
011de eb03                           jmp        0x7f6a97becae3
011e0 418be9                         mov        ebp, r9d
011e3 458d142e                       lea        r10d, [r14 + rbp]
011e7 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
011ef c4817a6f441508                 vmovdqu    xmm0, xmmword ptr [r13 + r10 + 8]
011f6 448bdd                         mov        r11d, ebp
011f9 c4817a7f441d08                 vmovdqu    xmmword ptr [r13 + r11 + 8], xmm0
01200 448d4d10                       lea        r9d, [rbp + 0x10]
01204 443bcb                         cmp        r9d, ebx
01207 7cd7                           jl         0x7f6a97becae0
01209 4981c010ffffff                 add        r8, -0xf0
01210 4981f800000080                 cmp        r8, -0x80000000
01217 49c7c200000080                 mov        r10, 0xffffffff80000000
0121e 4d0f4cc2                       cmovl      r8, r10
01222 458bd8                         mov        r11d, r8d
01225 453bcb                         cmp        r9d, r11d
01228 0f8d8d010000                   jge        0x7f6a97beccbb
0122e 4d63d1                         movsxd     r10, r9d
01231 4c03d1                         add        r10, rcx
01234 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
0123c 0f833a1b0000                   jae        0x7f6a97bee67c
01242 81c500010000                   add        ebp, 0x100
01248 4c63d5                         movsxd     r10, ebp
0124b 4c03d1                         add        r10, rcx
0124e 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
01256 0f83341b0000                   jae        0x7f6a97bee690
0125c 443b8c2490000000               cmp        r9d, dword ptr [rsp + 0x90]
01264 0f833a1b0000                   jae        0x7f6a97bee6a4
0126a 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
01271 0f83411b0000                   jae        0x7f6a97bee6b8
01277 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0127f 90                             nop        
01280 478d140e                       lea        r10d, [r14 + r9]
01284 418bd9                         mov        ebx, r9d
01287 4863fb                         movsxd     rdi, ebx
0128a 418bda                         mov        ebx, r10d
0128d c4c17a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 8]
01294 4963da                         movsxd     rbx, r10d
01297 458bd1                         mov        r10d, r9d
0129a c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
012a1 c4c17a6f441818                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x18]
012a8 c4c17a7f443818                 vmovdqu    xmmword ptr [r8 + rdi + 0x18], xmm0
012af c4c17a6f441828                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x28]
012b6 c4c17a7f443828                 vmovdqu    xmmword ptr [r8 + rdi + 0x28], xmm0
012bd c4c17a6f441838                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x38]
012c4 c4c17a7f443838                 vmovdqu    xmmword ptr [r8 + rdi + 0x38], xmm0
012cb c4c17a6f441848                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x48]
012d2 c4c17a7f443848                 vmovdqu    xmmword ptr [r8 + rdi + 0x48], xmm0
012d9 c4c17a6f441858                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x58]
012e0 c4c17a7f443858                 vmovdqu    xmmword ptr [r8 + rdi + 0x58], xmm0
012e7 c4c17a6f441868                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x68]
012ee c4c17a7f443868                 vmovdqu    xmmword ptr [r8 + rdi + 0x68], xmm0
012f5 c4c17a6f441878                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x78]
012fc c4c17a7f443878                 vmovdqu    xmmword ptr [r8 + rdi + 0x78], xmm0
01303 c4c17a6f841888000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x88]
0130d c4c17a7f843888000000           vmovdqu    xmmword ptr [r8 + rdi + 0x88], xmm0
01317 c4c17a6f841898000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0x98]
01321 c4c17a7f843898000000           vmovdqu    xmmword ptr [r8 + rdi + 0x98], xmm0
0132b c4c17a6f8418a8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xa8]
01335 c4c17a7f8438a8000000           vmovdqu    xmmword ptr [r8 + rdi + 0xa8], xmm0
0133f c4c17a6f8418b8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xb8]
01349 c4c17a7f8438b8000000           vmovdqu    xmmword ptr [r8 + rdi + 0xb8], xmm0
01353 c4c17a6f8418c8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xc8]
0135d c4c17a7f8438c8000000           vmovdqu    xmmword ptr [r8 + rdi + 0xc8], xmm0
01367 c4c17a6f8418d8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xd8]
01371 c4c17a7f8438d8000000           vmovdqu    xmmword ptr [r8 + rdi + 0xd8], xmm0
0137b c4c17a6f8418e8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xe8]
01385 c4c17a7f8438e8000000           vmovdqu    xmmword ptr [r8 + rdi + 0xe8], xmm0
0138f c4c17a6f8418f8000000           vmovdqu    xmm0, xmmword ptr [r8 + rbx + 0xf8]
01399 c4c17a7f8438f8000000           vmovdqu    xmmword ptr [r8 + rdi + 0xf8], xmm0
013a3 4181c100010000                 add        r9d, 0x100
013aa 453bcb                         cmp        r9d, r11d
013ad 0f8ccdfeffff                   jl         0x7f6a97becb80
013b3 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
013bb 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
013c3 0f8dbbf2ffff                   jge        0x7f6a97bebf84
013c9 4d63d1                         movsxd     r10, r9d
013cc 4c03d1                         add        r10, rcx
013cf 4c3b942498000000               cmp        r10, qword ptr [rsp + 0x98]
013d7 0f83ef190000                   jae        0x7f6a97bee6cc
013dd 443b8c2490000000               cmp        r9d, dword ptr [rsp + 0x90]
013e5 0f83f5190000                   jae        0x7f6a97bee6e0
013eb 90                             nop        
013ec 478d140e                       lea        r10d, [r14 + r9]
013f0 8b9c2484000000                 mov        ebx, dword ptr [rsp + 0x84]
013f7 c4a17a6f441308                 vmovdqu    xmm0, xmmword ptr [rbx + r10 + 8]
013fe 458bd9                         mov        r11d, r9d
01401 c4a17a7f441b08                 vmovdqu    xmmword ptr [rbx + r11 + 8], xmm0
01408 4183c110                       add        r9d, 0x10
0140c 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
01414 7cd6                           jl         0x7f6a97beccec
01416 e969f2ffff                     jmp        0x7f6a97bebf84
0141b bee4ffffff                     mov        esi, 0xffffffe4
01420 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01425 448b1c24                       mov        r11d, dword ptr [rsp]
01429 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01431 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01436 4c891c24                       mov        qword ptr [rsp], r11
0143a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0143f 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01447 8944240c                       mov        dword ptr [rsp + 0xc], eax
0144b 48ff742420                     push       qword ptr [rsp + 0x20]
01450 488f442418                     pop        qword ptr [rsp + 0x18]
01455 48ff742428                     push       qword ptr [rsp + 0x28]
0145a 488f442420                     pop        qword ptr [rsp + 0x20]
0145f 48ff742430                     push       qword ptr [rsp + 0x30]
01464 488f442428                     pop        qword ptr [rsp + 0x28]
01469 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0146d 48894424f8                     mov        qword ptr [rsp - 8], rax
01472 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01476 89442440                       mov        dword ptr [rsp + 0x40], eax
0147a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0147f 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01484 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01489 90                             nop        
0148a 90                             nop        
0148b 90                             nop        
0148c c5f877                         vzeroupper 
0148f e8cc0caeff                     call       0x7f6a976cda60
01494 0f1f84008c150002               nop        dword ptr [rax + rax + 0x200158c]
0149c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
014a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014aa e8b1171318                     call       0x7f6aafd1e560
014af f4                             hlt        
014b0 bee4ffffff                     mov        esi, 0xffffffe4
014b5 498beb                         mov        rbp, r11
014b8 448b0424                       mov        r8d, dword ptr [rsp]
014bc 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
014c4 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
014c9 4c891c24                       mov        qword ptr [rsp], r11
014cd 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
014d2 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
014da 4489542410                     mov        dword ptr [rsp + 0x10], r10d
014df 48ff742420                     push       qword ptr [rsp + 0x20]
014e4 488f442418                     pop        qword ptr [rsp + 0x18]
014e9 48ff742428                     push       qword ptr [rsp + 0x28]
014ee 488f442420                     pop        qword ptr [rsp + 0x20]
014f3 48ff742430                     push       qword ptr [rsp + 0x30]
014f8 488f442428                     pop        qword ptr [rsp + 0x28]
014fd 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01501 48894424f8                     mov        qword ptr [rsp - 8], rax
01506 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0150a 89442440                       mov        dword ptr [rsp + 0x40], eax
0150e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01513 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01518 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0151c c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01522 90                             nop        
01523 90                             nop        
01524 c5f877                         vzeroupper 
01527 e8340caeff                     call       0x7f6a976cda60
0152c 0f1f840024160003               nop        dword ptr [rax + rax + 0x3001624]
01534 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0153e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01542 e819171318                     call       0x7f6aafd1e560
01547 f4                             hlt        
01548 bee4ffffff                     mov        esi, 0xffffffe4
0154d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01552 448b1c24                       mov        r11d, dword ptr [rsp]
01556 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0155e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01563 4c891424                       mov        qword ptr [rsp], r10
01567 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0156c 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01574 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01578 48ff742420                     push       qword ptr [rsp + 0x20]
0157d 488f442418                     pop        qword ptr [rsp + 0x18]
01582 48ff742428                     push       qword ptr [rsp + 0x28]
01587 488f442420                     pop        qword ptr [rsp + 0x20]
0158c 48ff742430                     push       qword ptr [rsp + 0x30]
01591 488f442428                     pop        qword ptr [rsp + 0x28]
01596 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0159b 4489742444                     mov        dword ptr [rsp + 0x44], r14d
015a0 c5f877                         vzeroupper 
015a3 e8b80baeff                     call       0x7f6a976cda60
015a8 0f1f8400a0160004               nop        dword ptr [rax + rax + 0x40016a0]
015b0 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
015ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
015be e89d161318                     call       0x7f6aafd1e560
015c3 f4                             hlt        
015c4 bee4ffffff                     mov        esi, 0xffffffe4
015c9 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
015ce 448b1424                       mov        r10d, dword ptr [rsp]
015d2 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
015da 4c8b542408                     mov        r10, qword ptr [rsp + 8]
015df 4c891424                       mov        qword ptr [rsp], r10
015e3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015e8 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
015f0 48ff742420                     push       qword ptr [rsp + 0x20]
015f5 488f442418                     pop        qword ptr [rsp + 0x18]
015fa 48ff742428                     push       qword ptr [rsp + 0x28]
015ff 488f442420                     pop        qword ptr [rsp + 0x20]
01604 48ff742430                     push       qword ptr [rsp + 0x30]
01609 488f442428                     pop        qword ptr [rsp + 0x28]
0160e 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01613 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01617 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0161d 90                             nop        
0161e 90                             nop        
0161f 90                             nop        
01620 c5f877                         vzeroupper 
01623 e8380baeff                     call       0x7f6a976cda60
01628 0f1f840020170005               nop        dword ptr [rax + rax + 0x5001720]
01630 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0163a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0163e e81d161318                     call       0x7f6aafd1e560
01643 f4                             hlt        
01644 be45ffffff                     mov        esi, 0xffffff45
01649 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01651 4489ac24e8000000               mov        dword ptr [rsp + 0xe8], r13d
01659 90                             nop        
0165a 90                             nop        
0165b 90                             nop        
0165c c5f877                         vzeroupper 
0165f e8fc0aaeff                     call       0x7f6a976cda60
01664 0f1f84005c170006               nop        dword ptr [rax + rax + 0x600175c]
0166c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01676 4883e4f0                       and        rsp, 0xfffffffffffffff0
0167a e8e1151318                     call       0x7f6aafd1e560
0167f f4                             hlt        
01680 be45ffffff                     mov        esi, 0xffffff45
01685 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0168a 448b0424                       mov        r8d, dword ptr [rsp]
0168e 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01696 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0169b 4c891c24                       mov        qword ptr [rsp], r11
0169f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
016a4 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
016ac 8944240c                       mov        dword ptr [rsp + 0xc], eax
016b0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
016b5 48ff742420                     push       qword ptr [rsp + 0x20]
016ba 488f442418                     pop        qword ptr [rsp + 0x18]
016bf 48894424f8                     mov        qword ptr [rsp - 8], rax
016c4 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
016c8 89442414                       mov        dword ptr [rsp + 0x14], eax
016cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016d1 48ff742428                     push       qword ptr [rsp + 0x28]
016d6 488f442420                     pop        qword ptr [rsp + 0x20]
016db 48ff742430                     push       qword ptr [rsp + 0x30]
016e0 488f442428                     pop        qword ptr [rsp + 0x28]
016e5 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
016e9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
016ee 90                             nop        
016ef 90                             nop        
016f0 c5f877                         vzeroupper 
016f3 e8680aaeff                     call       0x7f6a976cda60
016f8 0f1f8400f0170007               nop        dword ptr [rax + rax + 0x70017f0]
01700 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0170a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170e e84d151318                     call       0x7f6aafd1e560
01713 f4                             hlt        
01714 493beb                         cmp        rbp, r11
01717 bdffffffff                     mov        ebp, 0xffffffff
0171c 7c08                           jl         0x7f6a97bed026
0171e 400f95c5                       setne      bpl
01722 400fb6ed                       movzx      ebp, bpl
01726 be45ffffff                     mov        esi, 0xffffff45
0172b 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01730 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01738 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0173d 44894c2404                     mov        dword ptr [rsp + 4], r9d
01742 89442414                       mov        dword ptr [rsp + 0x14], eax
01746 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0174b 48894424f8                     mov        qword ptr [rsp - 8], rax
01750 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01754 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01758 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0175d 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01761 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01766 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0176b 90                             nop        
0176c c5f877                         vzeroupper 
0176f e8ec09aeff                     call       0x7f6a976cda60
01774 0f1f84006c180008               nop        dword ptr [rax + rax + 0x800186c]
0177c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01786 4883e4f0                       and        rsp, 0xfffffffffffffff0
0178a e8d1141318                     call       0x7f6aafd1e560
0178f f4                             hlt        
01790 be45ffffff                     mov        esi, 0xffffff45
01795 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0179a 448b1c24                       mov        r11d, dword ptr [rsp]
0179e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
017a6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
017ab 4c891c24                       mov        qword ptr [rsp], r11
017af 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
017b4 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
017bc 8944240c                       mov        dword ptr [rsp + 0xc], eax
017c0 4489542410                     mov        dword ptr [rsp + 0x10], r10d
017c5 48ff742420                     push       qword ptr [rsp + 0x20]
017ca 488f442418                     pop        qword ptr [rsp + 0x18]
017cf 48ff742428                     push       qword ptr [rsp + 0x28]
017d4 488f442420                     pop        qword ptr [rsp + 0x20]
017d9 48ff742430                     push       qword ptr [rsp + 0x30]
017de 488f442428                     pop        qword ptr [rsp + 0x28]
017e3 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
017e7 48894424f8                     mov        qword ptr [rsp - 8], rax
017ec 8b442448                       mov        eax, dword ptr [rsp + 0x48]
017f0 89442440                       mov        dword ptr [rsp + 0x40], eax
017f4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017f9 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
017fe 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01803 90                             nop        
01804 c5f877                         vzeroupper 
01807 e85409aeff                     call       0x7f6a976cda60
0180c 0f1f840004190009               nop        dword ptr [rax + rax + 0x9001904]
01814 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0181e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01822 e839141318                     call       0x7f6aafd1e560
01827 f4                             hlt        
01828 be45ffffff                     mov        esi, 0xffffff45
0182d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01832 448b0424                       mov        r8d, dword ptr [rsp]
01836 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0183e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01843 4c891c24                       mov        qword ptr [rsp], r11
01847 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0184c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01854 8944240c                       mov        dword ptr [rsp + 0xc], eax
01858 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0185d 48ff742420                     push       qword ptr [rsp + 0x20]
01862 488f442418                     pop        qword ptr [rsp + 0x18]
01867 48ff742428                     push       qword ptr [rsp + 0x28]
0186c 488f442420                     pop        qword ptr [rsp + 0x20]
01871 48ff742430                     push       qword ptr [rsp + 0x30]
01876 488f442428                     pop        qword ptr [rsp + 0x28]
0187b 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0187f 48894424f8                     mov        qword ptr [rsp - 8], rax
01884 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01888 89442440                       mov        dword ptr [rsp + 0x40], eax
0188c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01891 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01896 90                             nop        
01897 90                             nop        
01898 c5f877                         vzeroupper 
0189b e8c008aeff                     call       0x7f6a976cda60
018a0 0f1f84009819000a               nop        dword ptr [rax + rax + 0xa001998]
018a8 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
018b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
018b6 e8a5131318                     call       0x7f6aafd1e560
018bb f4                             hlt        
018bc 4c8b4c2428                     mov        r9, qword ptr [rsp + 0x28]
018c1 4d3bc1                         cmp        r8, r9
018c4 bdffffffff                     mov        ebp, 0xffffffff
018c9 7c08                           jl         0x7f6a97bed1d3
018cb 400f95c5                       setne      bpl
018cf 400fb6ed                       movzx      ebp, bpl
018d3 be45ffffff                     mov        esi, 0xffffff45
018d8 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
018dd 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
018e5 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
018ea 44894c2404                     mov        dword ptr [rsp + 4], r9d
018ef 89442414                       mov        dword ptr [rsp + 0x14], eax
018f3 4489542418                     mov        dword ptr [rsp + 0x18], r10d
018f8 895c2440                       mov        dword ptr [rsp + 0x40], ebx
018fc 48894424f8                     mov        qword ptr [rsp - 8], rax
01901 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01905 89442444                       mov        dword ptr [rsp + 0x44], eax
01909 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01913 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01918 c5f877                         vzeroupper 
0191b e84008aeff                     call       0x7f6a976cda60
01920 0f1f8400181a000b               nop        dword ptr [rax + rax + 0xb001a18]
01928 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01932 4883e4f0                       and        rsp, 0xfffffffffffffff0
01936 e825131318                     call       0x7f6aafd1e560
0193b f4                             hlt        
0193c 4c8b4c2430                     mov        r9, qword ptr [rsp + 0x30]
01941 493be9                         cmp        rbp, r9
01944 bdffffffff                     mov        ebp, 0xffffffff
01949 7c08                           jl         0x7f6a97bed253
0194b 400f95c5                       setne      bpl
0194f 400fb6ed                       movzx      ebp, bpl
01953 be45ffffff                     mov        esi, 0xffffff45
01958 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
0195d 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01965 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0196a 44894c2404                     mov        dword ptr [rsp + 4], r9d
0196f 89442414                       mov        dword ptr [rsp + 0x14], eax
01973 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01978 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0197c 48894424f8                     mov        qword ptr [rsp - 8], rax
01981 8b442448                       mov        eax, dword ptr [rsp + 0x48]
01985 89442444                       mov        dword ptr [rsp + 0x44], eax
01989 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198e 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
01993 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
01998 c5f877                         vzeroupper 
0199b e8c007aeff                     call       0x7f6a976cda60
019a0 0f1f8400981a000c               nop        dword ptr [rax + rax + 0xc001a98]
019a8 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
019b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019b6 e8a5121318                     call       0x7f6aafd1e560
019bb f4                             hlt        
019bc bee4ffffff                     mov        esi, 0xffffffe4
019c1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
019c6 448b1424                       mov        r10d, dword ptr [rsp]
019ca 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
019d2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
019d7 4c891424                       mov        qword ptr [rsp], r10
019db 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
019e0 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
019e8 48ff742420                     push       qword ptr [rsp + 0x20]
019ed 488f442418                     pop        qword ptr [rsp + 0x18]
019f2 48ff742428                     push       qword ptr [rsp + 0x28]
019f7 488f442420                     pop        qword ptr [rsp + 0x20]
019fc 48ff742430                     push       qword ptr [rsp + 0x30]
01a01 488f442428                     pop        qword ptr [rsp + 0x28]
01a06 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01a0b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01a0f 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01a13 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01a18 c5f877                         vzeroupper 
01a1b e84007aeff                     call       0x7f6a976cda60
01a20 0f1f8400181b000d               nop        dword ptr [rax + rax + 0xd001b18]
01a28 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01a32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a36 e825121318                     call       0x7f6aafd1e560
01a3b f4                             hlt        
01a3c bee4ffffff                     mov        esi, 0xffffffe4
01a41 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01a46 448b1c24                       mov        r11d, dword ptr [rsp]
01a4a 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01a52 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01a57 4c891424                       mov        qword ptr [rsp], r10
01a5b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a60 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01a68 48ff742420                     push       qword ptr [rsp + 0x20]
01a6d 488f442418                     pop        qword ptr [rsp + 0x18]
01a72 48ff742428                     push       qword ptr [rsp + 0x28]
01a77 488f442420                     pop        qword ptr [rsp + 0x20]
01a7c 48ff742430                     push       qword ptr [rsp + 0x30]
01a81 488f442428                     pop        qword ptr [rsp + 0x28]
01a86 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01a8b 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01a8f 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01a94 48897c2450                     mov        qword ptr [rsp + 0x50], rdi
01a99 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01a9d 90                             nop        
01a9e 90                             nop        
01a9f 90                             nop        
01aa0 c5f877                         vzeroupper 
01aa3 e8b806aeff                     call       0x7f6a976cda60
01aa8 0f1f8400a01b000e               nop        dword ptr [rax + rax + 0xe001ba0]
01ab0 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01aba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01abe e89d111318                     call       0x7f6aafd1e560
01ac3 f4                             hlt        
01ac4 4183c608                       add        r14d, 8
01ac8 be6effffff                     mov        esi, 0xffffff6e
01acd 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01ad2 448b0424                       mov        r8d, dword ptr [rsp]
01ad6 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01ade 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01ae3 4c891424                       mov        qword ptr [rsp], r10
01ae7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01aec 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01af4 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01af8 48ff742420                     push       qword ptr [rsp + 0x20]
01afd 488f442418                     pop        qword ptr [rsp + 0x18]
01b02 48ff742428                     push       qword ptr [rsp + 0x28]
01b07 488f442420                     pop        qword ptr [rsp + 0x20]
01b0c 48ff742430                     push       qword ptr [rsp + 0x30]
01b11 488f442428                     pop        qword ptr [rsp + 0x28]
01b16 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01b1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b20 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
01b27 89442440                       mov        dword ptr [rsp + 0x40], eax
01b2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b30 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01b35 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01b3a 90                             nop        
01b3b 90                             nop        
01b3c c5f877                         vzeroupper 
01b3f e81c06aeff                     call       0x7f6a976cda60
01b44 0f1f84003c1c000f               nop        dword ptr [rax + rax + 0xf001c3c]
01b4c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01b56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b5a e801111318                     call       0x7f6aafd1e560
01b5f f4                             hlt        
01b60 4183c608                       add        r14d, 8
01b64 be66ffffff                     mov        esi, 0xffffff66
01b69 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01b6e 448b0424                       mov        r8d, dword ptr [rsp]
01b72 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01b7a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01b7f 4c891424                       mov        qword ptr [rsp], r10
01b83 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b88 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01b90 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01b94 48ff742420                     push       qword ptr [rsp + 0x20]
01b99 488f442418                     pop        qword ptr [rsp + 0x18]
01b9e 48ff742428                     push       qword ptr [rsp + 0x28]
01ba3 488f442420                     pop        qword ptr [rsp + 0x20]
01ba8 48ff742430                     push       qword ptr [rsp + 0x30]
01bad 488f442428                     pop        qword ptr [rsp + 0x28]
01bb2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01bb7 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01bbc 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01bc1 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
01bc6 90                             nop        
01bc7 90                             nop        
01bc8 c5f877                         vzeroupper 
01bcb e89005aeff                     call       0x7f6a976cda60
01bd0 0f1f8400c81c0010               nop        dword ptr [rax + rax + 0x10001cc8]
01bd8 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be6 e875101318                     call       0x7f6aafd1e560
01beb f4                             hlt        
01bec 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
01bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bfa e861101318                     call       0x7f6aafd1e560
01bff f4                             hlt        
01c00 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
01c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c0e e84d101318                     call       0x7f6aafd1e560
01c13 f4                             hlt        
01c14 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
01c1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c22 e839101318                     call       0x7f6aafd1e560
01c27 f4                             hlt        
01c28 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
01c32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c36 e825101318                     call       0x7f6aafd1e560
01c3b f4                             hlt        
01c3c 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
01c46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c4a e811101318                     call       0x7f6aafd1e560
01c4f f4                             hlt        
01c50 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
01c5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c5e e8fd0f1318                     call       0x7f6aafd1e560
01c63 f4                             hlt        
01c64 418be9                         mov        ebp, r9d
01c67 e90feaffff                     jmp        0x7f6a97bebf7b
01c6c beccffffff                     mov        esi, 0xffffffcc
01c71 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01c76 448b1c24                       mov        r11d, dword ptr [rsp]
01c7a 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01c82 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01c87 4c891424                       mov        qword ptr [rsp], r10
01c8b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01c90 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01c98 48ff742420                     push       qword ptr [rsp + 0x20]
01c9d 488f442418                     pop        qword ptr [rsp + 0x18]
01ca2 48ff742428                     push       qword ptr [rsp + 0x28]
01ca7 488f442420                     pop        qword ptr [rsp + 0x20]
01cac 48ff742430                     push       qword ptr [rsp + 0x30]
01cb1 488f442428                     pop        qword ptr [rsp + 0x28]
01cb6 4489742444                     mov        dword ptr [rsp + 0x44], r14d
01cbb 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01cbf 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01cc4 c5f877                         vzeroupper 
01cc7 e89404aeff                     call       0x7f6a976cda60
01ccc 0f1f8400c41d0011               nop        dword ptr [rax + rax + 0x11001dc4]
01cd4 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01cde 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ce2 e8790f1318                     call       0x7f6aafd1e560
01ce7 f4                             hlt        
01ce8 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01cec 448bd5                         mov        r10d, ebp
01cef 4403542440                     add        r10d, dword ptr [rsp + 0x40]
01cf4 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01cfc 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01d01 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01d06 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01d0b 8b5c2440                       mov        ebx, dword ptr [rsp + 0x40]
01d0f 83c308                         add        ebx, 8
01d12 413bd9                         cmp        ebx, r9d
01d15 7cd1                           jl         0x7f6a97bed5e8
01d17 3bda                           cmp        ebx, edx
01d19 0f8dc3000000                   jge        0x7f6a97bed6e2
01d1f 4c63d3                         movsxd     r10, ebx
01d22 4c03d1                         add        r10, rcx
01d25 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01d2d 0f83c1100000                   jae        0x7f6a97bee6f4
01d33 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01d38 4183c040                       add        r8d, 0x40
01d3c 458bd0                         mov        r10d, r8d
01d3f 4d63c0                         movsxd     r8, r8d
01d42 4c03c1                         add        r8, rcx
01d45 4c3b8424a0000000               cmp        r8, qword ptr [rsp + 0xa0]
01d4d 0f83b5100000                   jae        0x7f6a97bee708
01d53 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
01d57 0f83bf100000                   jae        0x7f6a97bee71c
01d5d 443b54246c                     cmp        r10d, dword ptr [rsp + 0x6c]
01d62 0f83c8100000                   jae        0x7f6a97bee730
01d68 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01d70 448d142b                       lea        r10d, [rbx + rbp]
01d74 448bc3                         mov        r8d, ebx
01d77 4d63d8                         movsxd     r11, r8d
01d7a 458bc2                         mov        r8d, r10d
01d7d 4f8b440108                     mov        r8, qword ptr [r9 + r8 + 8]
01d82 4963fa                         movsxd     rdi, r10d
01d85 448bd3                         mov        r10d, ebx
01d88 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
01d8d 4d8b543910                     mov        r10, qword ptr [r9 + rdi + 0x10]
01d92 4f89541910                     mov        qword ptr [r9 + r11 + 0x10], r10
01d97 4d8b543918                     mov        r10, qword ptr [r9 + rdi + 0x18]
01d9c 4f89541918                     mov        qword ptr [r9 + r11 + 0x18], r10
01da1 4d8b543920                     mov        r10, qword ptr [r9 + rdi + 0x20]
01da6 4f89541920                     mov        qword ptr [r9 + r11 + 0x20], r10
01dab 4d8b543928                     mov        r10, qword ptr [r9 + rdi + 0x28]
01db0 4f89541928                     mov        qword ptr [r9 + r11 + 0x28], r10
01db5 4d8b543930                     mov        r10, qword ptr [r9 + rdi + 0x30]
01dba 4f89541930                     mov        qword ptr [r9 + r11 + 0x30], r10
01dbf 4d8b543938                     mov        r10, qword ptr [r9 + rdi + 0x38]
01dc4 4f89541938                     mov        qword ptr [r9 + r11 + 0x38], r10
01dc9 4d8b543940                     mov        r10, qword ptr [r9 + rdi + 0x40]
01dce 4f89541940                     mov        qword ptr [r9 + r11 + 0x40], r10
01dd3 83c340                         add        ebx, 0x40
01dd6 3bda                           cmp        ebx, edx
01dd8 7c96                           jl         0x7f6a97bed670
01dda 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
01de2 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01de9 0f8d95e8ffff                   jge        0x7f6a97bebf84
01def 4c63d3                         movsxd     r10, ebx
01df2 4c03d1                         add        r10, rcx
01df5 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01dfd 0f8341100000                   jae        0x7f6a97bee744
01e03 3b5c246c                       cmp        ebx, dword ptr [rsp + 0x6c]
01e07 0f834b100000                   jae        0x7f6a97bee758
01e0d 90                             nop        
01e0e 90                             nop        
01e0f 90                             nop        
01e10 448d1c2b                       lea        r11d, [rbx + rbp]
01e14 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
01e1c 4f8b5c1908                     mov        r11, qword ptr [r9 + r11 + 8]
01e21 448bd3                         mov        r10d, ebx
01e24 4f895c1108                     mov        qword ptr [r9 + r10 + 8], r11
01e29 83c308                         add        ebx, 8
01e2c 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
01e33 7cdb                           jl         0x7f6a97bed710
01e35 e94ae8ffff                     jmp        0x7f6a97bebf84
01e3a bee4ffffff                     mov        esi, 0xffffffe4
01e3f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01e44 448b0424                       mov        r8d, dword ptr [rsp]
01e48 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01e50 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01e55 4c891c24                       mov        qword ptr [rsp], r11
01e59 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01e5e 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01e66 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e6a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01e6f 48ff742420                     push       qword ptr [rsp + 0x20]
01e74 488f442418                     pop        qword ptr [rsp + 0x18]
01e79 48894424f8                     mov        qword ptr [rsp - 8], rax
01e7e 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
01e82 89442414                       mov        dword ptr [rsp + 0x14], eax
01e86 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8b 48ff742428                     push       qword ptr [rsp + 0x28]
01e90 488f442420                     pop        qword ptr [rsp + 0x20]
01e95 48ff742430                     push       qword ptr [rsp + 0x30]
01e9a 488f442428                     pop        qword ptr [rsp + 0x28]
01e9f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01ea3 4489742440                     mov        dword ptr [rsp + 0x40], r14d
01ea8 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01ead 90                             nop        
01eae 90                             nop        
01eaf 90                             nop        
01eb0 c5f877                         vzeroupper 
01eb3 e8a802aeff                     call       0x7f6a976cda60
01eb8 0f1f8400b01f0012               nop        dword ptr [rax + rax + 0x12001fb0]
01ec0 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ece e88d0d1318                     call       0x7f6aafd1e560
01ed3 f4                             hlt        
01ed4 4585f6                         test       r14d, r14d
01ed7 0f848f0f0000                   je         0x7f6a97bee76c
01edd 8b2c24                         mov        ebp, dword ptr [rsp]
01ee0 898424a8000000                 mov        dword ptr [rsp + 0xa8], eax
01ee7 4533c0                         xor        r8d, r8d
01eea e98cedffff                     jmp        0x7f6a97bec57b
01eef bee4ffffff                     mov        esi, 0xffffffe4
01ef4 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
01ef9 448b1c24                       mov        r11d, dword ptr [rsp]
01efd 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01f05 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01f0a 4c891424                       mov        qword ptr [rsp], r10
01f0e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f13 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01f1b 48ff742420                     push       qword ptr [rsp + 0x20]
01f20 488f442410                     pop        qword ptr [rsp + 0x10]
01f25 48ff742428                     push       qword ptr [rsp + 0x28]
01f2a 488f442420                     pop        qword ptr [rsp + 0x20]
01f2f 48ff742430                     push       qword ptr [rsp + 0x30]
01f34 488f442428                     pop        qword ptr [rsp + 0x28]
01f39 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
01f3e 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01f42 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01f47 90                             nop        
01f48 c5f877                         vzeroupper 
01f4b e81002aeff                     call       0x7f6a976cda60
01f50 0f1f840048200013               nop        dword ptr [rax + rax + 0x13002048]
01f58 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01f62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f66 e8f50c1318                     call       0x7f6aafd1e560
01f6b f4                             hlt        
01f6c bee4ffffff                     mov        esi, 0xffffffe4
01f71 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01f76 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01f7e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01f83 44895c2404                     mov        dword ptr [rsp + 4], r11d
01f88 48ff742420                     push       qword ptr [rsp + 0x20]
01f8d 488f442418                     pop        qword ptr [rsp + 0x18]
01f92 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01f97 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
01f9c 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01fa1 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01fa5 90                             nop        
01fa6 90                             nop        
01fa7 90                             nop        
01fa8 c5f877                         vzeroupper 
01fab e8b001aeff                     call       0x7f6a976cda60
01fb0 0f1f8400a8200014               nop        dword ptr [rax + rax + 0x140020a8]
01fb8 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
01fc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fc6 e8950c1318                     call       0x7f6aafd1e560
01fcb f4                             hlt        
01fcc 418d6e01                       lea        ebp, [r14 + 1]
01fd0 bee4ffffff                     mov        esi, 0xffffffe4
01fd5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fda 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01fe2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fe7 44895c2404                     mov        dword ptr [rsp + 4], r11d
01fec 48ff742420                     push       qword ptr [rsp + 0x20]
01ff1 488f442418                     pop        qword ptr [rsp + 0x18]
01ff6 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01ffa 4489742448                     mov        dword ptr [rsp + 0x48], r14d
01fff 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02004 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
02009 90                             nop        
0200a 90                             nop        
0200b 90                             nop        
0200c c5f877                         vzeroupper 
0200f e84c01aeff                     call       0x7f6a976cda60
02014 0f1f84000c210015               nop        dword ptr [rax + rax + 0x1500210c]
0201c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02026 4883e4f0                       and        rsp, 0xfffffffffffffff0
0202a e8310c1318                     call       0x7f6aafd1e560
0202f f4                             hlt        
02030 bee4ffffff                     mov        esi, 0xffffffe4
02035 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0203a 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02042 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02047 44895c2404                     mov        dword ptr [rsp + 4], r11d
0204c 48ff742420                     push       qword ptr [rsp + 0x20]
02051 488f442418                     pop        qword ptr [rsp + 0x18]
02056 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0205a 4489742448                     mov        dword ptr [rsp + 0x48], r14d
0205f 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
02064 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
02069 90                             nop        
0206a 90                             nop        
0206b 90                             nop        
0206c c5f877                         vzeroupper 
0206f e8ec00aeff                     call       0x7f6a976cda60
02074 0f1f84006c210016               nop        dword ptr [rax + rax + 0x1600216c]
0207c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02086 4883e4f0                       and        rsp, 0xfffffffffffffff0
0208a e8d10b1318                     call       0x7f6aafd1e560
0208f f4                             hlt        
02090 bee4ffffff                     mov        esi, 0xffffffe4
02095 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0209a 448b1c24                       mov        r11d, dword ptr [rsp]
0209e 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
020a6 4c8b542408                     mov        r10, qword ptr [rsp + 8]
020ab 4c891424                       mov        qword ptr [rsp], r10
020af 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
020b4 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
020bc 48ff742420                     push       qword ptr [rsp + 0x20]
020c1 488f442410                     pop        qword ptr [rsp + 0x10]
020c6 48ff742428                     push       qword ptr [rsp + 0x28]
020cb 488f442420                     pop        qword ptr [rsp + 0x20]
020d0 48ff742430                     push       qword ptr [rsp + 0x30]
020d5 488f442428                     pop        qword ptr [rsp + 0x28]
020da 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
020de 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
020e3 4489742448                     mov        dword ptr [rsp + 0x48], r14d
020e8 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
020ed 90                             nop        
020ee 90                             nop        
020ef 90                             nop        
020f0 c5f877                         vzeroupper 
020f3 e86800aeff                     call       0x7f6a976cda60
020f8 0f1f8400f0210017               nop        dword ptr [rax + rax + 0x170021f0]
02100 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0210a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0210e e84d0b1318                     call       0x7f6aafd1e560
02113 f4                             hlt        
02114 bee4ffffff                     mov        esi, 0xffffffe4
02119 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0211e 448b1424                       mov        r10d, dword ptr [rsp]
02122 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0212a 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0212f 4c891424                       mov        qword ptr [rsp], r10
02133 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02138 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02140 48ff742420                     push       qword ptr [rsp + 0x20]
02145 488f442410                     pop        qword ptr [rsp + 0x10]
0214a 48ff742428                     push       qword ptr [rsp + 0x28]
0214f 488f442420                     pop        qword ptr [rsp + 0x20]
02154 48ff742430                     push       qword ptr [rsp + 0x30]
02159 488f442428                     pop        qword ptr [rsp + 0x28]
0215e 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02162 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
02167 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0216c 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02171 90                             nop        
02172 90                             nop        
02173 90                             nop        
02174 c5f877                         vzeroupper 
02177 e8e4ffadff                     call       0x7f6a976cda60
0217c 0f1f840074220018               nop        dword ptr [rax + rax + 0x18002274]
02184 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0218e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02192 e8c90a1318                     call       0x7f6aafd1e560
02197 f4                             hlt        
02198 bee4ffffff                     mov        esi, 0xffffffe4
0219d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021a2 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
021aa 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
021af 4489542404                     mov        dword ptr [rsp + 4], r10d
021b4 48ff742420                     push       qword ptr [rsp + 0x20]
021b9 488f442418                     pop        qword ptr [rsp + 0x18]
021be 895c2444                       mov        dword ptr [rsp + 0x44], ebx
021c2 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
021c7 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
021cc c5f877                         vzeroupper 
021cf e88cffadff                     call       0x7f6a976cda60
021d4 0f1f8400cc220019               nop        dword ptr [rax + rax + 0x190022cc]
021dc 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
021e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
021ea e8710a1318                     call       0x7f6aafd1e560
021ef f4                             hlt        
021f0 beccffffff                     mov        esi, 0xffffffcc
021f5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
021fa 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02202 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02207 44895c2404                     mov        dword ptr [rsp + 4], r11d
0220c 48ff742420                     push       qword ptr [rsp + 0x20]
02211 488f442418                     pop        qword ptr [rsp + 0x18]
02216 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0221a 44896c244c                     mov        dword ptr [rsp + 0x4c], r13d
0221f 90                             nop        
02220 c5f877                         vzeroupper 
02223 e838ffadff                     call       0x7f6a976cda60
02228 0f1f84002023001a               nop        dword ptr [rax + rax + 0x1a002320]
02230 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0223a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0223e e81d0a1318                     call       0x7f6aafd1e560
02243 f4                             hlt        
02244 be6effffff                     mov        esi, 0xffffff6e
02249 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0224e 448b1c24                       mov        r11d, dword ptr [rsp]
02252 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0225a 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
0225f 4c891c24                       mov        qword ptr [rsp], r11
02263 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02268 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02270 8944240c                       mov        dword ptr [rsp + 0xc], eax
02274 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02279 48ff742420                     push       qword ptr [rsp + 0x20]
0227e 488f442418                     pop        qword ptr [rsp + 0x18]
02283 48894424f8                     mov        qword ptr [rsp - 8], rax
02288 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
0228c 89442414                       mov        dword ptr [rsp + 0x14], eax
02290 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02295 48ff742428                     push       qword ptr [rsp + 0x28]
0229a 488f442420                     pop        qword ptr [rsp + 0x20]
0229f 48ff742430                     push       qword ptr [rsp + 0x30]
022a4 488f442428                     pop        qword ptr [rsp + 0x28]
022a9 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
022ad 4489742440                     mov        dword ptr [rsp + 0x40], r14d
022b2 4489442444                     mov        dword ptr [rsp + 0x44], r8d
022b7 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
022bc c5f877                         vzeroupper 
022bf e89cfeadff                     call       0x7f6a976cda60
022c4 0f1f8400bc23001b               nop        dword ptr [rax + rax + 0x1b0023bc]
022cc 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
022d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
022da e881091318                     call       0x7f6aafd1e560
022df f4                             hlt        
022e0 be45ffffff                     mov        esi, 0xffffff45
022e5 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
022ea 448b0424                       mov        r8d, dword ptr [rsp]
022ee 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
022f6 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
022fb 4c891c24                       mov        qword ptr [rsp], r11
022ff 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02304 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
0230c 8944240c                       mov        dword ptr [rsp + 0xc], eax
02310 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02315 48ff742420                     push       qword ptr [rsp + 0x20]
0231a 488f442418                     pop        qword ptr [rsp + 0x18]
0231f 48894424f8                     mov        qword ptr [rsp - 8], rax
02324 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
02328 89442414                       mov        dword ptr [rsp + 0x14], eax
0232c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02331 48ff742428                     push       qword ptr [rsp + 0x28]
02336 488f442420                     pop        qword ptr [rsp + 0x20]
0233b 48ff742430                     push       qword ptr [rsp + 0x30]
02340 488f442428                     pop        qword ptr [rsp + 0x28]
02345 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02349 4489742440                     mov        dword ptr [rsp + 0x40], r14d
0234e 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
02353 90                             nop        
02354 c5f877                         vzeroupper 
02357 e804feadff                     call       0x7f6a976cda60
0235c 0f1f84005424001c               nop        dword ptr [rax + rax + 0x1c002454]
02364 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0236e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02372 e8e9081318                     call       0x7f6aafd1e560
02377 f4                             hlt        
02378 be3dffffff                     mov        esi, 0xffffff3d
0237d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02382 448b1c24                       mov        r11d, dword ptr [rsp]
02386 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0238e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02393 4c891c24                       mov        qword ptr [rsp], r11
02397 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0239c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
023a4 8944240c                       mov        dword ptr [rsp + 0xc], eax
023a8 4489542410                     mov        dword ptr [rsp + 0x10], r10d
023ad 48ff742420                     push       qword ptr [rsp + 0x20]
023b2 488f442418                     pop        qword ptr [rsp + 0x18]
023b7 48894424f8                     mov        qword ptr [rsp - 8], rax
023bc 8b44243c                       mov        eax, dword ptr [rsp + 0x3c]
023c0 89442414                       mov        dword ptr [rsp + 0x14], eax
023c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
023c9 48ff742428                     push       qword ptr [rsp + 0x28]
023ce 488f442420                     pop        qword ptr [rsp + 0x20]
023d3 48ff742430                     push       qword ptr [rsp + 0x30]
023d8 488f442428                     pop        qword ptr [rsp + 0x28]
023dd 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
023e1 4489742440                     mov        dword ptr [rsp + 0x40], r14d
023e6 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
023eb 90                             nop        
023ec c5f877                         vzeroupper 
023ef e86cfdadff                     call       0x7f6a976cda60
023f4 0f1f8400ec24001d               nop        dword ptr [rax + rax + 0x1d0024ec]
023fc 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02406 4883e4f0                       and        rsp, 0xfffffffffffffff0
0240a e851081318                     call       0x7f6aafd1e560
0240f f4                             hlt        
02410 bee4ffffff                     mov        esi, 0xffffffe4
02415 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0241a 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02422 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02427 4489542404                     mov        dword ptr [rsp + 4], r10d
0242c 48ff742420                     push       qword ptr [rsp + 0x20]
02431 488f442418                     pop        qword ptr [rsp + 0x18]
02436 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0243a 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0243f 90                             nop        
02440 c5f877                         vzeroupper 
02443 e818fdadff                     call       0x7f6a976cda60
02448 0f1f84004025001e               nop        dword ptr [rax + rax + 0x1e002540]
02450 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0245a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0245e e8fd071318                     call       0x7f6aafd1e560
02463 f4                             hlt        
02464 bee4ffffff                     mov        esi, 0xffffffe4
02469 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0246e 44895c2404                     mov        dword ptr [rsp + 4], r11d
02473 48ff742420                     push       qword ptr [rsp + 0x20]
02478 488f442418                     pop        qword ptr [rsp + 0x18]
0247d 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02481 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02486 90                             nop        
02487 90                             nop        
02488 c5f877                         vzeroupper 
0248b e8d0fcadff                     call       0x7f6a976cda60
02490 0f1f84008825001f               nop        dword ptr [rax + rax + 0x1f002588]
02498 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
024a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
024a6 e8b5071318                     call       0x7f6aafd1e560
024ab f4                             hlt        
024ac beccffffff                     mov        esi, 0xffffffcc
024b1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
024b6 448b1c24                       mov        r11d, dword ptr [rsp]
024ba 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
024c2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
024c7 4c891424                       mov        qword ptr [rsp], r10
024cb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
024d0 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
024d8 48ff742420                     push       qword ptr [rsp + 0x20]
024dd 488f442410                     pop        qword ptr [rsp + 0x10]
024e2 48ff742428                     push       qword ptr [rsp + 0x28]
024e7 488f442420                     pop        qword ptr [rsp + 0x20]
024ec 48ff742430                     push       qword ptr [rsp + 0x30]
024f1 488f442428                     pop        qword ptr [rsp + 0x28]
024f6 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
024fb 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
02500 895c2454                       mov        dword ptr [rsp + 0x54], ebx
02504 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02509 90                             nop        
0250a 90                             nop        
0250b 90                             nop        
0250c c5f877                         vzeroupper 
0250f e84cfcadff                     call       0x7f6a976cda60
02514 0f1f84000c260020               nop        dword ptr [rax + rax + 0x2000260c]
0251c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02526 4883e4f0                       and        rsp, 0xfffffffffffffff0
0252a e831071318                     call       0x7f6aafd1e560
0252f f4                             hlt        
02530 be17000000                     mov        esi, 0x17
02535 90                             nop        
02536 90                             nop        
02537 90                             nop        
02538 c5f877                         vzeroupper 
0253b e820fcadff                     call       0x7f6a976cda60
02540 0f1f840038260021               nop        dword ptr [rax + rax + 0x21002638]
02548 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02552 4883e4f0                       and        rsp, 0xfffffffffffffff0
02556 e805071318                     call       0x7f6aafd1e560
0255b f4                             hlt        
0255c be6effffff                     mov        esi, 0xffffff6e
02561 4489742410                     mov        dword ptr [rsp + 0x10], r14d
02566 89442414                       mov        dword ptr [rsp + 0x14], eax
0256a 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0256f 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02574 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
02579 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
0257e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02583 90                             nop        
02584 c5f877                         vzeroupper 
02587 e8d4fbadff                     call       0x7f6a976cda60
0258c 0f1f840084260022               nop        dword ptr [rax + rax + 0x22002684]
02594 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0259e 4883e4f0                       and        rsp, 0xfffffffffffffff0
025a2 e8b9061318                     call       0x7f6aafd1e560
025a7 f4                             hlt        
025a8 bebeffffff                     mov        esi, 0xffffffbe
025ad 4489742410                     mov        dword ptr [rsp + 0x10], r14d
025b2 89442414                       mov        dword ptr [rsp + 0x14], eax
025b6 4c89442418                     mov        qword ptr [rsp + 0x18], r8
025bb 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
025c0 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
025c5 48897c2430                     mov        qword ptr [rsp + 0x30], rdi
025ca 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
025cf 90                             nop        
025d0 c5f877                         vzeroupper 
025d3 e888fbadff                     call       0x7f6a976cda60
025d8 0f1f8400d0260023               nop        dword ptr [rax + rax + 0x230026d0]
025e0 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
025ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
025ee e86d061318                     call       0x7f6aafd1e560
025f3 f4                             hlt        
025f4 488b5c2478                     mov        rbx, qword ptr [rsp + 0x78]
025f9 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
025fe 448bb42484000000               mov        r14d, dword ptr [rsp + 0x84]
02606 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
0260e beccffffff                     mov        esi, 0xffffffcc
02613 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0261b 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02623 44893424                       mov        dword ptr [rsp], r14d
02627 4489542404                     mov        dword ptr [rsp + 4], r10d
0262c 48895c2408                     mov        qword ptr [rsp + 8], rbx
02631 90                             nop        
02632 90                             nop        
02633 90                             nop        
02634 c5f877                         vzeroupper 
02637 e824fbadff                     call       0x7f6a976cda60
0263c 0f1f840034270024               nop        dword ptr [rax + rax + 0x24002734]
02644 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0264e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02652 e809061318                     call       0x7f6aafd1e560
02657 f4                             hlt        
02658 bee4ffffff                     mov        esi, 0xffffffe4
0265d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02662 448b1c24                       mov        r11d, dword ptr [rsp]
02666 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0266e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02673 4c891c24                       mov        qword ptr [rsp], r11
02677 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0267c 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02684 48ff742420                     push       qword ptr [rsp + 0x20]
02689 488f442410                     pop        qword ptr [rsp + 0x10]
0268e 48ff742428                     push       qword ptr [rsp + 0x28]
02693 488f442420                     pop        qword ptr [rsp + 0x20]
02698 48ff742430                     push       qword ptr [rsp + 0x30]
0269d 488f442428                     pop        qword ptr [rsp + 0x28]
026a2 895c2438                       mov        dword ptr [rsp + 0x38], ebx
026a6 48894424f8                     mov        qword ptr [rsp - 8], rax
026ab 8b442448                       mov        eax, dword ptr [rsp + 0x48]
026af 8944243c                       mov        dword ptr [rsp + 0x3c], eax
026b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026b8 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
026bd 48894424f8                     mov        qword ptr [rsp - 8], rax
026c2 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
026c6 89442444                       mov        dword ptr [rsp + 0x44], eax
026ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026cf 89442448                       mov        dword ptr [rsp + 0x48], eax
026d3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
026d8 4489542458                     mov        dword ptr [rsp + 0x58], r10d
026dd 90                             nop        
026de 90                             nop        
026df 90                             nop        
026e0 c5f877                         vzeroupper 
026e3 e878faadff                     call       0x7f6a976cda60
026e8 0f1f8400e0270025               nop        dword ptr [rax + rax + 0x250027e0]
026f0 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
026fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
026fe e85d051318                     call       0x7f6aafd1e560
02703 f4                             hlt        
02704 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
0270a bee4ffffff                     mov        esi, 0xffffffe4
0270f 498be8                         mov        rbp, r8
02712 448b0424                       mov        r8d, dword ptr [rsp]
02716 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0271e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
02723 4c891c24                       mov        qword ptr [rsp], r11
02727 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0272c 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02734 48ff742420                     push       qword ptr [rsp + 0x20]
02739 488f442410                     pop        qword ptr [rsp + 0x10]
0273e 48ff742428                     push       qword ptr [rsp + 0x28]
02743 488f442420                     pop        qword ptr [rsp + 0x20]
02748 48ff742430                     push       qword ptr [rsp + 0x30]
0274d 488f442428                     pop        qword ptr [rsp + 0x28]
02752 895c2438                       mov        dword ptr [rsp + 0x38], ebx
02756 48894424f8                     mov        qword ptr [rsp - 8], rax
0275b 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0275f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
02763 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02768 44896c2440                     mov        dword ptr [rsp + 0x40], r13d
0276d 48894424f8                     mov        qword ptr [rsp - 8], rax
02772 8b44244c                       mov        eax, dword ptr [rsp + 0x4c]
02776 89442444                       mov        dword ptr [rsp + 0x44], eax
0277a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0277f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02784 89442454                       mov        dword ptr [rsp + 0x54], eax
02788 c5f877                         vzeroupper 
0278b e8d0f9adff                     call       0x7f6a976cda60
02790 0f1f840088280026               nop        dword ptr [rax + rax + 0x26002888]
02798 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
027a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
027a6 e8b5041318                     call       0x7f6aafd1e560
027ab f4                             hlt        
027ac beccffffff                     mov        esi, 0xffffffcc
027b1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
027b6 448b1c24                       mov        r11d, dword ptr [rsp]
027ba 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
027c2 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
027c7 4c891c24                       mov        qword ptr [rsp], r11
027cb 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
027d0 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
027d8 48ff742420                     push       qword ptr [rsp + 0x20]
027dd 488f442418                     pop        qword ptr [rsp + 0x18]
027e2 48ff742428                     push       qword ptr [rsp + 0x28]
027e7 488f442420                     pop        qword ptr [rsp + 0x20]
027ec 48ff742430                     push       qword ptr [rsp + 0x30]
027f1 488f442428                     pop        qword ptr [rsp + 0x28]
027f6 48894424f8                     mov        qword ptr [rsp - 8], rax
027fb 8b442448                       mov        eax, dword ptr [rsp + 0x48]
027ff 89442440                       mov        dword ptr [rsp + 0x40], eax
02803 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02808 44896c2444                     mov        dword ptr [rsp + 0x44], r13d
0280d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02812 89442458                       mov        dword ptr [rsp + 0x58], eax
02816 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
0281a 90                             nop        
0281b 90                             nop        
0281c c5f877                         vzeroupper 
0281f e83cf9adff                     call       0x7f6a976cda60
02824 0f1f84001c290027               nop        dword ptr [rax + rax + 0x2700291c]
0282c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02836 4883e4f0                       and        rsp, 0xfffffffffffffff0
0283a e821041318                     call       0x7f6aafd1e560
0283f f4                             hlt        
02840 418bea                         mov        ebp, r10d
02843 83c510                         add        ebp, 0x10
02846 be6effffff                     mov        esi, 0xffffff6e
0284b 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
02850 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02858 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0285d 44895c2404                     mov        dword ptr [rsp + 4], r11d
02862 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02867 48ff742420                     push       qword ptr [rsp + 0x20]
0286c 488f442418                     pop        qword ptr [rsp + 0x18]
02871 895c2440                       mov        dword ptr [rsp + 0x40], ebx
02875 48894424f8                     mov        qword ptr [rsp - 8], rax
0287a 8b442448                       mov        eax, dword ptr [rsp + 0x48]
0287e 89442444                       mov        dword ptr [rsp + 0x44], eax
02882 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02887 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
0288c c5f877                         vzeroupper 
0288f e8ccf8adff                     call       0x7f6a976cda60
02894 0f1f84008c290028               nop        dword ptr [rax + rax + 0x2800298c]
0289c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
028a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028aa e8b1031318                     call       0x7f6aafd1e560
028af f4                             hlt        
028b0 418bea                         mov        ebp, r10d
028b3 83c510                         add        ebp, 0x10
028b6 be66ffffff                     mov        esi, 0xffffff66
028bb 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
028c0 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
028c8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
028cd 4489442404                     mov        dword ptr [rsp + 4], r8d
028d2 4489542414                     mov        dword ptr [rsp + 0x14], r10d
028d7 48ff742420                     push       qword ptr [rsp + 0x20]
028dc 488f442418                     pop        qword ptr [rsp + 0x18]
028e1 895c2440                       mov        dword ptr [rsp + 0x40], ebx
028e5 48894424f8                     mov        qword ptr [rsp - 8], rax
028ea 8b442448                       mov        eax, dword ptr [rsp + 0x48]
028ee 89442444                       mov        dword ptr [rsp + 0x44], eax
028f2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
028f7 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
028fc c5f877                         vzeroupper 
028ff e85cf8adff                     call       0x7f6a976cda60
02904 0f1f8400fc290029               nop        dword ptr [rax + rax + 0x290029fc]
0290c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02916 4883e4f0                       and        rsp, 0xfffffffffffffff0
0291a e841031318                     call       0x7f6aafd1e560
0291f f4                             hlt        
02920 bee4ffffff                     mov        esi, 0xffffffe4
02925 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
0292a 448b1424                       mov        r10d, dword ptr [rsp]
0292e 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02936 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0293b 4c891424                       mov        qword ptr [rsp], r10
0293f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02944 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
0294c 48ff742420                     push       qword ptr [rsp + 0x20]
02951 488f442410                     pop        qword ptr [rsp + 0x10]
02956 48ff742428                     push       qword ptr [rsp + 0x28]
0295b 488f442420                     pop        qword ptr [rsp + 0x20]
02960 48ff742430                     push       qword ptr [rsp + 0x30]
02965 488f442428                     pop        qword ptr [rsp + 0x28]
0296a 895c2448                       mov        dword ptr [rsp + 0x48], ebx
0296e 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02973 90                             nop        
02974 c5f877                         vzeroupper 
02977 e8e4f7adff                     call       0x7f6a976cda60
0297c 0f1f8400742a002a               nop        dword ptr [rax + rax + 0x2a002a74]
02984 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
0298e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02992 e8c9021318                     call       0x7f6aafd1e560
02997 f4                             hlt        
02998 bee4ffffff                     mov        esi, 0xffffffe4
0299d 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
029a2 448b1c24                       mov        r11d, dword ptr [rsp]
029a6 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
029ae 4c8b542408                     mov        r10, qword ptr [rsp + 8]
029b3 4c891424                       mov        qword ptr [rsp], r10
029b7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
029bc 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
029c4 48ff742420                     push       qword ptr [rsp + 0x20]
029c9 488f442410                     pop        qword ptr [rsp + 0x10]
029ce 48ff742428                     push       qword ptr [rsp + 0x28]
029d3 488f442420                     pop        qword ptr [rsp + 0x20]
029d8 48ff742430                     push       qword ptr [rsp + 0x30]
029dd 488f442428                     pop        qword ptr [rsp + 0x28]
029e2 895c2444                       mov        dword ptr [rsp + 0x44], ebx
029e6 90                             nop        
029e7 90                             nop        
029e8 c5f877                         vzeroupper 
029eb e870f7adff                     call       0x7f6a976cda60
029f0 0f1f8400e82a002b               nop        dword ptr [rax + rax + 0x2b002ae8]
029f8 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a06 e855021318                     call       0x7f6aafd1e560
02a0b f4                             hlt        
02a0c 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
02a11 458d5a08                       lea        r11d, [r10 + 8]
02a15 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02a1a be6effffff                     mov        esi, 0xffffff6e
02a1f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02a24 448b1c24                       mov        r11d, dword ptr [rsp]
02a28 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02a30 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02a35 4c891424                       mov        qword ptr [rsp], r10
02a39 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02a3e 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02a46 48ff742420                     push       qword ptr [rsp + 0x20]
02a4b 488f442410                     pop        qword ptr [rsp + 0x10]
02a50 48ff742428                     push       qword ptr [rsp + 0x28]
02a55 488f442420                     pop        qword ptr [rsp + 0x20]
02a5a 48ff742430                     push       qword ptr [rsp + 0x30]
02a5f 488f442428                     pop        qword ptr [rsp + 0x28]
02a64 48894424f8                     mov        qword ptr [rsp - 8], rax
02a69 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02a70 89442438                       mov        dword ptr [rsp + 0x38], eax
02a74 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a79 90                             nop        
02a7a 90                             nop        
02a7b 90                             nop        
02a7c c5f877                         vzeroupper 
02a7f e8dcf6adff                     call       0x7f6a976cda60
02a84 0f1f84007c2b002c               nop        dword ptr [rax + rax + 0x2c002b7c]
02a8c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02a96 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a9a e8c1011318                     call       0x7f6aafd1e560
02a9f f4                             hlt        
02aa0 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
02aa5 458d5a08                       lea        r11d, [r10 + 8]
02aa9 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02aae be66ffffff                     mov        esi, 0xffffff66
02ab3 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02ab8 448b1424                       mov        r10d, dword ptr [rsp]
02abc 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02ac4 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02ac9 4c891424                       mov        qword ptr [rsp], r10
02acd 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02ad2 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02ada 48ff742420                     push       qword ptr [rsp + 0x20]
02adf 488f442410                     pop        qword ptr [rsp + 0x10]
02ae4 48ff742428                     push       qword ptr [rsp + 0x28]
02ae9 488f442420                     pop        qword ptr [rsp + 0x20]
02aee 48ff742430                     push       qword ptr [rsp + 0x30]
02af3 488f442428                     pop        qword ptr [rsp + 0x28]
02af8 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02afd 90                             nop        
02afe 90                             nop        
02aff 90                             nop        
02b00 c5f877                         vzeroupper 
02b03 e858f6adff                     call       0x7f6a976cda60
02b08 0f1f8400002c002d               nop        dword ptr [rax + rax + 0x2d002c00]
02b10 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02b1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b1e e83d011318                     call       0x7f6aafd1e560
02b23 f4                             hlt        
02b24 448bcb                         mov        r9d, ebx
02b27 e97ee5ffff                     jmp        0x7f6a97bec9aa
02b2c 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02b36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b3a e821011318                     call       0x7f6aafd1e560
02b3f f4                             hlt        
02b40 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02b4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b4e e80d011318                     call       0x7f6aafd1e560
02b53 f4                             hlt        
02b54 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b62 e8f9001318                     call       0x7f6aafd1e560
02b67 f4                             hlt        
02b68 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02b72 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b76 e8e5001318                     call       0x7f6aafd1e560
02b7b f4                             hlt        
02b7c 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02b86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b8a e8d1001318                     call       0x7f6aafd1e560
02b8f f4                             hlt        
02b90 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02b9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b9e e8bd001318                     call       0x7f6aafd1e560
02ba3 f4                             hlt        
02ba4 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02bae 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bb2 e8a9001318                     call       0x7f6aafd1e560
02bb7 f4                             hlt        
02bb8 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02bc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bc6 e895001318                     call       0x7f6aafd1e560
02bcb f4                             hlt        
02bcc bee4ffffff                     mov        esi, 0xffffffe4
02bd1 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02bd6 448b1424                       mov        r10d, dword ptr [rsp]
02bda 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02be2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02be7 4c891424                       mov        qword ptr [rsp], r10
02beb 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02bf0 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02bf8 48ff742420                     push       qword ptr [rsp + 0x20]
02bfd 488f442410                     pop        qword ptr [rsp + 0x10]
02c02 48ff742428                     push       qword ptr [rsp + 0x28]
02c07 488f442420                     pop        qword ptr [rsp + 0x20]
02c0c 48ff742430                     push       qword ptr [rsp + 0x30]
02c11 488f442428                     pop        qword ptr [rsp + 0x28]
02c16 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
02c1a 4489742448                     mov        dword ptr [rsp + 0x48], r14d
02c1f 90                             nop        
02c20 c5f877                         vzeroupper 
02c23 e838f5adff                     call       0x7f6a976cda60
02c28 0f1f8400202d002e               nop        dword ptr [rax + rax + 0x2e002d20]
02c30 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02c3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c3e e81d001318                     call       0x7f6aafd1e560
02c43 f4                             hlt        
02c44 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
02c4a bee4ffffff                     mov        esi, 0xffffffe4
02c4f 488b6c2450                     mov        rbp, qword ptr [rsp + 0x50]
02c54 448b1c24                       mov        r11d, dword ptr [rsp]
02c58 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02c60 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02c65 4c891424                       mov        qword ptr [rsp], r10
02c69 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02c6e 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02c76 48ff742420                     push       qword ptr [rsp + 0x20]
02c7b 488f442410                     pop        qword ptr [rsp + 0x10]
02c80 48ff742428                     push       qword ptr [rsp + 0x28]
02c85 488f442420                     pop        qword ptr [rsp + 0x20]
02c8a 48ff742430                     push       qword ptr [rsp + 0x30]
02c8f 488f442428                     pop        qword ptr [rsp + 0x28]
02c94 4489742440                     mov        dword ptr [rsp + 0x40], r14d
02c99 895c2448                       mov        dword ptr [rsp + 0x48], ebx
02c9d 90                             nop        
02c9e 90                             nop        
02c9f 90                             nop        
02ca0 c5f877                         vzeroupper 
02ca3 e8b8f4adff                     call       0x7f6a976cda60
02ca8 0f1f8400a02d002f               nop        dword ptr [rax + rax + 0x2f002da0]
02cb0 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02cba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cbe e89dff1218                     call       0x7f6aafd1e560
02cc3 f4                             hlt        
02cc4 4183c610                       add        r14d, 0x10
02cc8 be6effffff                     mov        esi, 0xffffff6e
02ccd 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02cd2 44895c2404                     mov        dword ptr [rsp + 4], r11d
02cd7 48ff742420                     push       qword ptr [rsp + 0x20]
02cdc 488f442418                     pop        qword ptr [rsp + 0x18]
02ce1 48894424f8                     mov        qword ptr [rsp - 8], rax
02ce6 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02ced 89442440                       mov        dword ptr [rsp + 0x40], eax
02cf1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02cf6 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02cfb 90                             nop        
02cfc c5f877                         vzeroupper 
02cff e85cf4adff                     call       0x7f6a976cda60
02d04 0f1f8400fc2d0030               nop        dword ptr [rax + rax + 0x30002dfc]
02d0c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02d16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d1a e841ff1218                     call       0x7f6aafd1e560
02d1f f4                             hlt        
02d20 4183c610                       add        r14d, 0x10
02d24 be66ffffff                     mov        esi, 0xffffff66
02d29 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02d2e 44895c2404                     mov        dword ptr [rsp + 4], r11d
02d33 48ff742420                     push       qword ptr [rsp + 0x20]
02d38 488f442418                     pop        qword ptr [rsp + 0x18]
02d3d 48894424f8                     mov        qword ptr [rsp - 8], rax
02d42 8b8424a8000000                 mov        eax, dword ptr [rsp + 0xa8]
02d49 89442440                       mov        dword ptr [rsp + 0x40], eax
02d4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02d52 4489742444                     mov        dword ptr [rsp + 0x44], r14d
02d57 90                             nop        
02d58 c5f877                         vzeroupper 
02d5b e800f4adff                     call       0x7f6a976cda60
02d60 0f1f8400582e0031               nop        dword ptr [rax + rax + 0x31002e58]
02d68 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d76 e8e5fe1218                     call       0x7f6aafd1e560
02d7b f4                             hlt        
02d7c 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d8a e8d1fe1218                     call       0x7f6aafd1e560
02d8f f4                             hlt        
02d90 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02d9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d9e e8bdfe1218                     call       0x7f6aafd1e560
02da3 f4                             hlt        
02da4 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02dae 4883e4f0                       and        rsp, 0xfffffffffffffff0
02db2 e8a9fe1218                     call       0x7f6aafd1e560
02db7 f4                             hlt        
02db8 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02dc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dc6 e895fe1218                     call       0x7f6aafd1e560
02dcb f4                             hlt        
02dcc 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dda e881fe1218                     call       0x7f6aafd1e560
02ddf f4                             hlt        
02de0 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02dea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dee e86dfe1218                     call       0x7f6aafd1e560
02df3 f4                             hlt        
02df4 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e02 e859fe1218                     call       0x7f6aafd1e560
02e07 f4                             hlt        
02e08 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02e12 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e16 e845fe1218                     call       0x7f6aafd1e560
02e1b f4                             hlt        
02e1c 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02e26 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e2a e831fe1218                     call       0x7f6aafd1e560
02e2f f4                             hlt        
02e30 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e3e e81dfe1218                     call       0x7f6aafd1e560
02e43 f4                             hlt        
02e44 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02e4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e52 e809fe1218                     call       0x7f6aafd1e560
02e57 f4                             hlt        
02e58 48bff07e51706a7f0000           movabs     rdi, 0x7f6a70517ef0
02e62 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e66 e8f5fd1218                     call       0x7f6aafd1e560
02e6b f4                             hlt        
02e6c bef6ffffff                     mov        esi, 0xfffffff6
02e71 488bea                         mov        rbp, rdx
02e74 898424e0000000                 mov        dword ptr [rsp + 0xe0], eax
02e7b 90                             nop        
02e7c c5f877                         vzeroupper 
02e7f e8dcf2adff                     call       0x7f6a976cda60
02e84 0f1f84007c2f0032               nop        dword ptr [rax + rax + 0x32002f7c]
02e8c 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02e96 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e9a e8c1fd1218                     call       0x7f6aafd1e560
02e9f f4                             hlt        
02ea0 bef6ffffff                     mov        esi, 0xfffffff6
02ea5 90                             nop        
02ea6 90                             nop        
02ea7 90                             nop        
02ea8 c5f877                         vzeroupper 
02eab e8b0f2adff                     call       0x7f6a976cda60
02eb0 0f1f8400a82f0033               nop        dword ptr [rax + rax + 0x33002fa8]
02eb8 48bf6038b2706a7f0000           movabs     rdi, 0x7f6a70b23860
02ec2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ec6 e895fd1218                     call       0x7f6aafd1e560
02ecb f4                             hlt        
02ecc 49bafac5be976a7f0000           movabs     r10, 0x7f6a97bec5fa
02ed6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02edd e97e3bb4ff                     jmp        0x7f6a97732360
02ee2 e8f909b3ff                     call       0x7f6a9771f1e0
02ee7 e952d1ffff                     jmp        0x7f6a97beb93e
02eec f4                             hlt        
02eed f4                             hlt        
02eee f4                             hlt        
02eef f4                             hlt        
