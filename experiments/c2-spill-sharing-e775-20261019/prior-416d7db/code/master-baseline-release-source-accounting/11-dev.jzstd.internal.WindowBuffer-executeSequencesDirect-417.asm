00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0e7a8ff                   jne        0x7ffaeb8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85e82d0000                   jne        0x7ffaebe6efa6
0003e 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742408                     mov        qword ptr [rsp + 8], rsi
00051 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00055 448b4e04                       mov        r9d, dword ptr [rsi + 4]
00059 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0005e 458bc1                         mov        r8d, r9d
00061 452bc2                         sub        r8d, r10d
00064 8b8c24e0000000                 mov        ecx, dword ptr [rsp + 0xe0]
0006b 413bc8                         cmp        ecx, r8d
0006e 0f8f30260000                   jg         0x7ffaebe6e824
00074 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00078 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0007d 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00081 48638c24e0000000               movsxd     rcx, dword ptr [rsp + 0xe0]
00089 4d63ca                         movsxd     r9, r10d
0008c 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
00091 4d2bc1                         sub        r8, r9
00094 493bc8                         cmp        rcx, r8
00097 0f8f07260000                   jg         0x7ffaebe6e824
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f84c4130000                   je         0x7ffaebe6d5f7
000b3 33d2                           xor        edx, edx
000b5 4d8bf3                         mov        r14, r11
000b8 418b7304                       mov        esi, dword ptr [r11 + 4]
000bc 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
000c1 418b5b40                       mov        ebx, dword ptr [r11 + 0x40]
000c5 448bef                         mov        r13d, edi
000c8 85ff                           test       edi, edi
000ca 0f8e741f0000                   jle        0x7ffaebe6e1c4
000d0 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
000d8 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000dd 448d4ee0                       lea        r9d, [rsi - 0x20]
000e1 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
000e5 83c1e0                         add        ecx, -0x20
000e8 4c8bd8                         mov        r11, rax
000eb 418b7b04                       mov        edi, dword ptr [r11 + 4]
000ef 85ff                           test       edi, edi
000f1 0f86c5250000                   jbe        0x7ffaebe6e83c
000f7 4c63d7                         movsxd     r10, edi
000fa 4963fd                         movsxd     rdi, r13d
000fd 48ffcf                         dec        rdi
00100 493bfa                         cmp        rdi, r10
00103 0f83b3250000                   jae        0x7ffaebe6e83c
00109 488b8424e8000000               mov        rax, qword ptr [rsp + 0xe8]
00111 8b7804                         mov        edi, dword ptr [rax + 4]
00114 85ff                           test       edi, edi
00116 0f8608260000                   jbe        0x7ffaebe6e8a4
0011c 83ff01                         cmp        edi, 1
0011f 0f86ff250000                   jbe        0x7ffaebe6e8a4
00125 83ff02                         cmp        edi, 2
00128 0f86f6250000                   jbe        0x7ffaebe6e8a4
0012e 448d56f1                       lea        r10d, [rsi - 0xf]
00132 4585d2                         test       r10d, r10d
00135 0f8ce9250000                   jl         0x7ffaebe6e8a4
0013b 8b6b04                         mov        ebp, dword ptr [rbx + 4]
0013e 448d55f1                       lea        r10d, [rbp - 0xf]
00142 4585d2                         test       r10d, r10d
00145 0f8cd9250000                   jl         0x7ffaebe6e8a4
0014b 448d55f9                       lea        r10d, [rbp - 7]
0014f 4585d2                         test       r10d, r10d
00152 0f8ccc250000                   jl         0x7ffaebe6e8a4
00158 89ac24e8000000                 mov        dword ptr [rsp + 0xe8], ebp
0015f 89bc24e4000000                 mov        dword ptr [rsp + 0xe4], edi
00166 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0016a 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0016f 89b424e0000000                 mov        dword ptr [rsp + 0xe0], esi
00176 89542438                       mov        dword ptr [rsp + 0x38], edx
0017a 4c89442440                     mov        qword ptr [rsp + 0x40], r8
0017f 4889442458                     mov        qword ptr [rsp + 0x58], rax
00184 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00189 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
0018e 4c89742468                     mov        qword ptr [rsp + 0x68], r14
00193 4c8bd3                         mov        r10, rbx
00196 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0019b 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0019f 448bd5                         mov        r10d, ebp
001a2 448bc6                         mov        r8d, esi
001a5 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
001ad 458d5af9                       lea        r11d, [r10 - 7]
001b1 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
001b6 4183c0f1                       add        r8d, -0xf
001ba 4489442478                     mov        dword ptr [rsp + 0x78], r8d
001bf 4d63da                         movsxd     r11, r10d
001c2 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
001ca 4183c2f1                       add        r10d, -0xf
001ce 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001d3 4d8d53f9                       lea        r10, [r11 - 7]
001d7 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
001df 4533d2                         xor        r10d, r10d
001e2 4533c9                         xor        r9d, r9d
001e5 e9b7030000                     jmp        0x7ffaebe6c721
001ea 448bd5                         mov        r10d, ebp
001ed 4d63d2                         movsxd     r10, r10d
001f0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001f7 c442a8f5db                     bzhi       r11, r11, r10
001fc c4c1fb92fb                     kmovq      k7, r11
00201 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00207 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0020d 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00215 4403dd                         add        r11d, ebp
00218 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00220 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00224 418502                         test       dword ptr [r10], eax
00227 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0022f 0f8d57090000                   jge        0x7ffaebe6cd0c
00235 418bdd                         mov        ebx, r13d
00238 448bc3                         mov        r8d, ebx
0023b 442b842494000000               sub        r8d, dword ptr [rsp + 0x94]
00243 8bac2490000000                 mov        ebp, dword ptr [rsp + 0x90]
0024a 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00251 3bac2494000000                 cmp        ebp, dword ptr [rsp + 0x94]
00258 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00260 410f4fea                       cmovg      ebp, r10d
00264 4585c0                         test       r8d, r8d
00267 0f8c63190000                   jl         0x7ffaebe6dd50
0026d 85db                           test       ebx, ebx
0026f 0f8c5b190000                   jl         0x7ffaebe6dd50
00275 458d1c28                       lea        r11d, [r8 + rbp]
00279 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
00281 453bd3                         cmp        r10d, r11d
00284 0f8246190000                   jb         0x7ffaebe6dd50
0028a 448d2c2b                       lea        r13d, [rbx + rbp]
0028e 453bd5                         cmp        r10d, r13d
00291 0f8239190000                   jb         0x7ffaebe6dd50
00297 85ed                           test       ebp, ebp
00299 0f8c31190000                   jl         0x7ffaebe6dd50
0029f 85ed                           test       ebp, ebp
002a1 0f8466ffffff                   je         0x7ffaebe6c38d
002a7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
002ac 498d741a08                     lea        rsi, [r10 + rbx + 8]
002b1 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
002b6 4863d5                         movsxd     rdx, ebp
002b9 4883fa20                       cmp        rdx, 0x20
002bd 0f8627ffffff                   jbe        0x7ffaebe6c36a
002c3 c5f877                         vzeroupper 
002c6 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
002d0 41ffd2                         call       r10
002d3 0f1f840000000000               nop        dword ptr [rax + rax]
002db e92dffffff                     jmp        0x7ffaebe6c38d
002e0 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
002e8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
002ed c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
002f4 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
002fc 4503cb                         add        r9d, r11d
002ff e974020000                     jmp        0x7ffaebe6c6f8
00304 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00309 4b8d7c3208                     lea        rdi, [r10 + r14 + 8]
0030e 458bc2                         mov        r8d, r10d
00311 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00319 4b8d741008                     lea        rsi, [r8 + r10 + 8]
0031e 44039c249c000000               add        r11d, dword ptr [rsp + 0x9c]
00326 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0032e 4963cb                         movsxd     rcx, r11d
00331 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00339 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00341 0f8ce6050000                   jl         0x7ffaebe6caad
00347 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0034f 4183fa30                       cmp        r10d, 0x30
00353 0f8e9b000000                   jle        0x7ffaebe6c574
00359 4585f6                         test       r14d, r14d
0035c 0f8c0a190000                   jl         0x7ffaebe6ddec
00362 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0036a 4585db                         test       r11d, r11d
0036d 0f8cf9180000                   jl         0x7ffaebe6ddec
00373 4503d6                         add        r10d, r14d
00376 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
0037e 453bc2                         cmp        r8d, r10d
00381 0f82e5180000                   jb         0x7ffaebe6ddec
00387 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
0038f 0f82d7180000                   jb         0x7ffaebe6ddec
00395 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0039d 4585d2                         test       r10d, r10d
003a0 0f84c2010000                   je         0x7ffaebe6c6e8
003a6 4963d2                         movsxd     rdx, r10d
003a9 4883fa20                       cmp        rdx, 0x20
003ad 7728                           ja         0x7ffaebe6c557
003af 458bda                         mov        r11d, r10d
003b2 4d63d3                         movsxd     r10, r11d
003b5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003bc c442a8f5db                     bzhi       r11, r11, r10
003c1 c4c1fb92fb                     kmovq      k7, r11
003c6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003cc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003d2 e991010000                     jmp        0x7ffaebe6c6e8
003d7 c5f877                         vzeroupper 
003da 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
003e4 41ffd2                         call       r10
003e7 0f1f840000000000               nop        dword ptr [rax + rax]
003ef e974010000                     jmp        0x7ffaebe6c6e8
003f4 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
003f9 0f83f5140000                   jae        0x7ffaebe6da74
003ff 4963fe                         movsxd     rdi, r14d
00402 4d8b443808                     mov        r8, qword ptr [r8 + rdi + 8]
00407 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0040f 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
00414 0f838e150000                   jae        0x7ffaebe6db28
0041a 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00422 458d4a08                       lea        r9d, [r10 + 8]
00426 4963da                         movsxd     rbx, r10d
00429 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0042e 4d89441b08                     mov        qword ptr [r11 + rbx + 8], r8
00433 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
0043b 0f8d27010000                   jge        0x7ffaebe6c6e8
00441 482bfb                         sub        rdi, rbx
00444 4d63c1                         movsxd     r8, r9d
00447 4d8d1c38                       lea        r11, [r8 + rdi]
0044b 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00453 0f8307160000                   jae        0x7ffaebe6dbe0
00459 4c8bd9                         mov        r11, rcx
0045c 4d2bd8                         sub        r11, r8
0045f 4983c307                       add        r11, 7
00463 4983e3f8                       and        r11, 0xfffffffffffffff8
00467 458bdb                         mov        r11d, r11d
0046a 478d441308                     lea        r8d, [r11 + r10 + 8]
0046f 4d63d8                         movsxd     r11, r8d
00472 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
00477 4c3b842488000000               cmp        r8, qword ptr [rsp + 0x88]
0047f 0f83db150000                   jae        0x7ffaebe6dbe0
00485 443b4c2474                     cmp        r9d, dword ptr [rsp + 0x74]
0048a 0f83d0150000                   jae        0x7ffaebe6dbe0
00490 4983c3f8                       add        r11, -8
00494 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
0049c 0f83be150000                   jae        0x7ffaebe6dbe0
004a2 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
004aa 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004b1 0f8f61160000                   jg         0x7ffaebe6dc98
004b7 452bf2                         sub        r14d, r10d
004ba 4183c210                       add        r10d, 0x10
004be 478d040e                       lea        r8d, [r14 + r9]
004c2 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
004c7 4f8b440308                     mov        r8, qword ptr [r11 + r8 + 8]
004cc 458bd9                         mov        r11d, r9d
004cf 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
004d3 4e89441b08                     mov        qword ptr [rbx + r11 + 8], r8
004d8 4183c108                       add        r9d, 8
004dc 453bca                         cmp        r9d, r10d
004df 7cdd                           jl         0x7ffaebe6c63e
004e1 4883c1f8                       add        rcx, -8
004e5 4881f900000080                 cmp        rcx, -0x80000000
004ec 49c7c200000080                 mov        r10, 0xffffffff80000000
004f3 490f4cca                       cmovl      rcx, r10
004f7 8bc9                           mov        ecx, ecx
004f9 443bc9                         cmp        r9d, ecx
004fc 7d3c                           jge        0x7ffaebe6c6ba
004fe 6690                           nop        
00500 478d140e                       lea        r10d, [r14 + r9]
00504 458bc1                         mov        r8d, r9d
00507 4d63c0                         movsxd     r8, r8d
0050a 418bda                         mov        ebx, r10d
0050d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00512 4d8b5c1b08                     mov        r11, qword ptr [r11 + rbx + 8]
00517 4963fa                         movsxd     rdi, r10d
0051a 418bd9                         mov        ebx, r9d
0051d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00522 4d895c1a08                     mov        qword ptr [r10 + rbx + 8], r11
00527 4d8b5c3a10                     mov        r11, qword ptr [r10 + rdi + 0x10]
0052c 4f895c0210                     mov        qword ptr [r10 + r8 + 0x10], r11
00531 4183c110                       add        r9d, 0x10
00535 443bc9                         cmp        r9d, ecx
00538 7cc6                           jl         0x7ffaebe6c680
0053a 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
00542 7d24                           jge        0x7ffaebe6c6e8
00544 478d1c0e                       lea        r11d, [r14 + r9]
00548 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0054d 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
00552 458bc1                         mov        r8d, r9d
00555 4f895c0208                     mov        qword ptr [r10 + r8 + 8], r11
0055a 4183c108                       add        r9d, 8
0055e 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
00566 7cdc                           jl         0x7ffaebe6c6c4
00568 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00570 44038c2490000000               add        r9d, dword ptr [rsp + 0x90]
00578 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00580 41ffc3                         inc        r11d
00583 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00588 0f8d130a0000                   jge        0x7ffaebe6d121
0058e 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00596 44898c249c000000               mov        dword ptr [rsp + 0x9c], r9d
0059e 458bcb                         mov        r9d, r11d
005a1 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
005a6 4f8b44cb08                     mov        r8, qword ptr [r11 + r9*8 + 8]
005ab 458bd8                         mov        r11d, r8d
005ae 4181e3ffff0100                 and        r11d, 0x1ffff
005b5 418bc3                         mov        eax, r11d
005b8 4d8bd8                         mov        r11, r8
005bb 49c1eb12                       shr        r11, 0x12
005bf 49c1f824                       sar        r8, 0x24
005c3 458bdb                         mov        r11d, r11d
005c6 458bc0                         mov        r8d, r8d
005c9 418bd8                         mov        ebx, r8d
005cc 4181e3ffff0300                 and        r11d, 0x3ffff
005d3 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
005db 4585c0                         test       r8d, r8d
005de 0f8cd4100000                   jl         0x7ffaebe6d838
005e4 448bd8                         mov        r11d, eax
005e7 4585db                         test       r11d, r11d
005ea 0f853c020000                   jne        0x7ffaebe6c9ac
005f0 4533db                         xor        r11d, r11d
005f3 418bc3                         mov        eax, r11d
005f6 83fb03                         cmp        ebx, 3
005f9 0f8e83020000                   jle        0x7ffaebe6ca02
005ff 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00604 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00608 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0060d 45895810                       mov        dword ptr [r8 + 0x10], r11d
00611 458b4008                       mov        r8d, dword ptr [r8 + 8]
00615 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0061a 4589430c                       mov        dword ptr [r11 + 0xc], r8d
0061e 448d5bfd                       lea        r11d, [rbx - 3]
00622 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0062a 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0062f 45895808                       mov        dword ptr [r8 + 8], r11d
00633 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
0063b 48639c2494000000               movsxd     rbx, dword ptr [rsp + 0x94]
00643 488beb                         mov        rbp, rbx
00646 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
0064e 4c03442430                     add        r8, qword ptr [rsp + 0x30]
00653 4863d0                         movsxd     rdx, eax
00656 4c03c2                         add        r8, rdx
00659 493bd8                         cmp        rbx, r8
0065c 0f8fea100000                   jg         0x7ffaebe6d8cc
00662 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
0066a 4403e8                         add        r13d, eax
0066d 458bf5                         mov        r14d, r13d
00670 442bb42494000000               sub        r14d, dword ptr [rsp + 0x94]
00678 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0067d 4585db                         test       r11d, r11d
00680 0f84d6010000                   je         0x7ffaebe6c9dc
00686 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0068b 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00693 4585c9                         test       r9d, r9d
00696 0f8ef80f0000                   jle        0x7ffaebe6d814
0069c 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
006a4 4503c5                         add        r8d, r13d
006a7 443b442464                     cmp        r8d, dword ptr [rsp + 0x64]
006ac 0f8f12110000                   jg         0x7ffaebe6d944
006b2 458d0402                       lea        r8d, [r10 + rax]
006b6 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
006be 443b442460                     cmp        r8d, dword ptr [rsp + 0x60]
006c3 0f8f9f110000                   jg         0x7ffaebe6d9e8
006c9 83f810                         cmp        eax, 0x10
006cc 0f8fc7040000                   jg         0x7ffaebe6cd19
006d2 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
006d7 0f83b90d0000                   jae        0x7ffaebe6d616
006dd 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
006e2 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
006e9 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
006f1 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
006f6 0f83480e0000                   jae        0x7ffaebe6d6c4
006fc 468d0c10                       lea        r9d, [rax + r10]
00700 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
00708 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0070d c4817a7f441a08                 vmovdqu    xmmword ptr [r10 + r11 + 8], xmm0
00714 468d1418                       lea        r10d, [rax + r11]
00718 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00720 458bf2                         mov        r14d, r10d
00723 442bb42494000000               sub        r14d, dword ptr [rsp + 0x94]
0072b 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00733 4183fb10                       cmp        r11d, 0x10
00737 0f8fc7fbffff                   jg         0x7ffaebe6c484
0073d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00745 4183fa10                       cmp        r10d, 0x10
00749 0f8cb5fbffff                   jl         0x7ffaebe6c484
0074f 443b74247c                     cmp        r14d, dword ptr [rsp + 0x7c]
00754 0f83a60e0000                   jae        0x7ffaebe6d780
0075a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0075f c4817a6f443308                 vmovdqu    xmm0, xmmword ptr [r11 + r14 + 8]
00766 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0076e 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00773 0f8267fbffff                   jb         0x7ffaebe6c460
00779 bee4ffffff                     mov        esi, 0xffffffe4
0077e 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00783 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00788 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00790 448b1424                       mov        r10d, dword ptr [rsp]
00794 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0079c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
007a1 4c891424                       mov        qword ptr [rsp], r10
007a5 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
007aa 4c89542408                     mov        qword ptr [rsp + 8], r10
007af 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
007b4 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
007bc 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
007c1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
007c6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
007cb 4489542418                     mov        dword ptr [rsp + 0x18], r10d
007d0 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
007d5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
007da 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
007df 4c89542428                     mov        qword ptr [rsp + 0x28], r10
007e4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
007e9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
007ee 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
007f3 4c89542438                     mov        qword ptr [rsp + 0x38], r10
007f8 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
007fd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00802 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00807 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0080c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00811 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00816 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
0081c c5f877                         vzeroupper 
0081f e8bc6cb5ff                     call       0x7ffaeb9c3660
00824 0f1f84001c090001               nop        dword ptr [rax + rax + 0x100091c]
0082c 448b1c24                       mov        r11d, dword ptr [rsp]
00830 452bda                         sub        r11d, r10d
00833 413bc3                         cmp        eax, r11d
00836 0f8ebafdffff                   jle        0x7ffaebe6c776
0083c be45ffffff                     mov        esi, 0xffffff45
00841 8be8                           mov        ebp, eax
00843 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0084b 90                             nop        
0084c c5f877                         vzeroupper 
0084f e88c6cb5ff                     call       0x7ffaeb9c3660
00854 0f1f84004c090002               nop        dword ptr [rax + rax + 0x200094c]
0085c 4d63de                         movsxd     r11, r14d
0085f 4c3b5c2440                     cmp        r11, qword ptr [rsp + 0x40]
00864 0f8cb6140000                   jl         0x7ffaebe6dea0
0086a 483b5c2448                     cmp        rbx, qword ptr [rsp + 0x48]
0086f 0f8f3b150000                   jg         0x7ffaebe6df30
00875 4533db                         xor        r11d, r11d
00878 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0087d e909feffff                     jmp        0x7ffaebe6c80b
00882 85c0                           test       eax, eax
00884 7407                           je         0x7ffaebe6ca0d
00886 448d5bff                       lea        r11d, [rbx - 1]
0088a 418bdb                         mov        ebx, r11d
0088d 85db                           test       ebx, ebx
0088f 7516                           jne        0x7ffaebe6ca27
00891 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00896 418b4b08                       mov        ecx, dword ptr [r11 + 8]
0089a 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
008a2 e97a000000                     jmp        0x7ffaebe6caa1
008a7 83fb03                         cmp        ebx, 3
008aa 0f8460180000                   je         0x7ffaebe6e290
008b0 83fb02                         cmp        ebx, 2
008b3 0f87f7180000                   ja         0x7ffaebe6e330
008b9 3b9c24e4000000                 cmp        ebx, dword ptr [rsp + 0xe4]
008c0 0f83c6160000                   jae        0x7ffaebe6e10c
008c6 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008cb 418b4c9808                     mov        ecx, dword ptr [r8 + rbx*4 + 8]
008d0 85db                           test       ebx, ebx
008d2 7e3c                           jle        0x7ffaebe6ca90
008d4 448d43ff                       lea        r8d, [rbx - 1]
008d8 443b8424e4000000               cmp        r8d, dword ptr [rsp + 0xe4]
008e0 0f8378170000                   jae        0x7ffaebe6e1de
008e6 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
008ee 6690                           nop        
008f0 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008f5 458b5c9804                     mov        r11d, dword ptr [r8 + rbx*4 + 4]
008fa 4d8bc8                         mov        r9, r8
008fd 45895c9908                     mov        dword ptr [r9 + rbx*4 + 8], r11d
00902 448d5bff                       lea        r11d, [rbx - 1]
00906 418bdb                         mov        ebx, r11d
00909 4585db                         test       r11d, r11d
0090c 7fe2                           jg         0x7ffaebe6ca70
0090e eb08                           jmp        0x7ffaebe6ca98
00910 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
00918 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0091d 41894b08                       mov        dword ptr [r11 + 8], ecx
00921 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00928 e90efdffff                     jmp        0x7ffaebe6c7bb
0092d 4183fb10                       cmp        r11d, 0x10
00931 0f8de51c0000                   jge        0x7ffaebe6e79c
00937 4183fb08                       cmp        r11d, 8
0093b 0f8d15070000                   jge        0x7ffaebe6d1d6
00941 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00949 4183fa10                       cmp        r10d, 0x10
0094d 0f8eb4000000                   jle        0x7ffaebe6cb87
00953 4585f6                         test       r14d, r14d
00956 0f8c0c1c0000                   jl         0x7ffaebe6e6e8
0095c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00964 4585db                         test       r11d, r11d
00967 0f8cfb1b0000                   jl         0x7ffaebe6e6e8
0096d 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00975 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
0097d 0f82e51b0000                   jb         0x7ffaebe6e6e8
00983 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
0098a 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00991 443bdb                         cmp        r11d, ebx
00994 0f82ce1b0000                   jb         0x7ffaebe6e6e8
0099a 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009a2 4585db                         test       r11d, r11d
009a5 0f8cbd1b0000                   jl         0x7ffaebe6e6e8
009ab 4585db                         test       r11d, r11d
009ae 0f8484f8ffff                   je         0x7ffaebe6c3b8
009b4 4883fd20                       cmp        rbp, 0x20
009b8 772d                           ja         0x7ffaebe6cb67
009ba 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
009c2 4d63d2                         movsxd     r10, r10d
009c5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009cc c442a8f5db                     bzhi       r11, r11, r10
009d1 c4c1fb92fb                     kmovq      k7, r11
009d6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009dc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009e2 e951f8ffff                     jmp        0x7ffaebe6c3b8
009e7 488bd5                         mov        rdx, rbp
009ea c5f877                         vzeroupper 
009ed 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
009f7 41ffd2                         call       r10
009fa 0f1f840000000000               nop        dword ptr [rax + rax]
00a02 e931f8ffff                     jmp        0x7ffaebe6c3b8
00a07 443bb424e8000000               cmp        r14d, dword ptr [rsp + 0xe8]
00a0f 0f833b180000                   jae        0x7ffaebe6e3d0
00a15 430fbe6c3008                   movsx      ebp, byte ptr [r8 + r14 + 8]
00a1b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a23 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a2b 0f83d3180000                   jae        0x7ffaebe6e484
00a31 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a39 43886c1808                     mov        byte ptr [r8 + r11 + 8], bpl
00a3e 41ffc3                         inc        r11d
00a41 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00a49 458d5603                       lea        r10d, [r14 + 3]
00a4d 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a55 0f8341190000                   jae        0x7ffaebe6e51c
00a5b 4d63d6                         movsxd     r10, r14d
00a5e 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
00a64 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00a6c 4183c003                       add        r8d, 3
00a70 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00a78 0f83ba190000                   jae        0x7ffaebe6e5b8
00a7e 4c6384249c000000               movsxd     r8, dword ptr [rsp + 0x9c]
00a86 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00a8b 43886c0309                     mov        byte ptr [r11 + r8 + 9], bpl
00a90 470fbe5c130a                   movsx      r11d, byte ptr [r11 + r10 + 0xa]
00a96 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00a9a 46885c010a                     mov        byte ptr [rcx + r8 + 0xa], r11b
00a9f 460fbe5c110b                   movsx      r11d, byte ptr [rcx + r10 + 0xb]
00aa5 46885c010b                     mov        byte ptr [rcx + r8 + 0xb], r11b
00aaa 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00ab2 4183fa08                       cmp        r10d, 8
00ab6 0f83141a0000                   jae        0x7ffaebe6e650
00abc 49ba60ac28e300000000           movabs     r10, 0xe328ac60
00ac6 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00ace 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00ad3 4489742404                     mov        dword ptr [rsp + 4], r14d
00ad8 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00ae0 4183fb04                       cmp        r11d, 4
00ae4 7e3e                           jle        0x7ffaebe6cca4
00ae6 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00aed 83c504                         add        ebp, 4
00af0 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00af5 418bd6                         mov        edx, r14d
00af8 c5f877                         vzeroupper 
00afb e8e0eba8ff                     call       0x7ffaeb8fb860
00b00 0f1f8400f80b0003               nop        dword ptr [rax + rax + 0x3000bf8]
00b08 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b0d 8bd5                           mov        edx, ebp
00b0f 8bc8                           mov        ecx, eax
00b11 666690                         nop        
00b14 c5f877                         vzeroupper 
00b17 e8c4eba8ff                     call       0x7ffaeb8fb860
00b1c 0f1f8400140c0004               nop        dword ptr [rax + rax + 0x4000c14]
00b24 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00b2c 4183fa08                       cmp        r10d, 8
00b30 7e5a                           jle        0x7ffaebe6cd0c
00b32 8b542404                       mov        edx, dword ptr [rsp + 4]
00b36 49ba88ac28e300000000           movabs     r10, 0xe328ac88
00b40 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b48 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00b4d 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b54 83c508                         add        ebp, 8
00b57 83c208                         add        edx, 8
00b5a 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b5f 90                             nop        
00b60 c5f877                         vzeroupper 
00b63 e878eba8ff                     call       0x7ffaeb8fb860
00b68 0f1f8400600c0005               nop        dword ptr [rax + rax + 0x5000c60]
00b70 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b75 8bd5                           mov        edx, ebp
00b77 488bc8                         mov        rcx, rax
00b7a 6690                           nop        
00b7c c5f877                         vzeroupper 
00b7f e85ceba8ff                     call       0x7ffaeb8fb860
00b84 0f1f84007c0c0006               nop        dword ptr [rax + rax + 0x6000c7c]
00b8c 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00b94 e9dff9ffff                     jmp        0x7ffaebe6c6f8
00b99 83f830                         cmp        eax, 0x30
00b9c 0f8ea9000000                   jle        0x7ffaebe6cdcb
00ba2 4585d2                         test       r10d, r10d
00ba5 0f8cb11d0000                   jl         0x7ffaebe6eadc
00bab 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00bb3 4585db                         test       r11d, r11d
00bb6 0f8ca81d0000                   jl         0x7ffaebe6eae4
00bbc 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00bc4 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
00bcc 0f82921d0000                   jb         0x7ffaebe6eae4
00bd2 448b8c24e8000000               mov        r9d, dword ptr [rsp + 0xe8]
00bda 453bcd                         cmp        r9d, r13d
00bdd 0f82811d0000                   jb         0x7ffaebe6eae4
00be3 85c0                           test       eax, eax
00be5 743d                           je         0x7ffaebe6cda4
00be7 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00bec 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
00bf1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00bf6 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00bfb 4883fa20                       cmp        rdx, 0x20
00bff 7730                           ja         0x7ffaebe6cdb1
00c01 448bd0                         mov        r10d, eax
00c04 4d63d2                         movsxd     r10, r10d
00c07 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c0e c442a8f5db                     bzhi       r11, r11, r10
00c13 c4c1fb92fb                     kmovq      k7, r11
00c18 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c1e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c24 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00c2c e9fafaffff                     jmp        0x7ffaebe6c8ab
00c31 c5f877                         vzeroupper 
00c34 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
00c3e 41ffd2                         call       r10
00c41 0f1f840000000000               nop        dword ptr [rax + rax]
00c49 ebd9                           jmp        0x7ffaebe6cda4
00c4b 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00c50 0f83921b0000                   jae        0x7ffaebe6e968
00c56 4963ca                         movsxd     rcx, r10d
00c59 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00c5e c4c17a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 8]
00c65 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00c6d 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
00c72 0f83241c0000                   jae        0x7ffaebe6ea1c
00c78 458d5910                       lea        r11d, [r9 + 0x10]
00c7c 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00c84 4963d9                         movsxd     rbx, r9d
00c87 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00c8c c4c17a7f441808                 vmovdqu    xmmword ptr [r8 + rbx + 8], xmm0
00c93 453bdd                         cmp        r11d, r13d
00c96 0f8dc7020000                   jge        0x7ffaebe6d0e3
00c9c 482bcb                         sub        rcx, rbx
00c9f 4d63db                         movsxd     r11, r11d
00ca2 4863bc24ec000000               movsxd     rdi, dword ptr [rsp + 0xec]
00caa 4883c7f1                       add        rdi, -0xf
00cae 4d8d040b                       lea        r8, [r11 + rcx]
00cb2 4c3bc7                         cmp        r8, rdi
00cb5 0f83651d0000                   jae        0x7ffaebe6eba0
00cbb 4963dd                         movsxd     rbx, r13d
00cbe 4c8bc3                         mov        r8, rbx
00cc1 4d2bc3                         sub        r8, r11
00cc4 4983c00f                       add        r8, 0xf
00cc8 4983e0f0                       and        r8, 0xfffffffffffffff0
00ccc 458bc0                         mov        r8d, r8d
00ccf 478d5c0810                     lea        r11d, [r8 + r9 + 0x10]
00cd4 4d63db                         movsxd     r11, r11d
00cd7 4d8d440bf0                     lea        r8, [r11 + rcx - 0x10]
00cdc 4c3bc7                         cmp        r8, rdi
00cdf 0f833b1d0000                   jae        0x7ffaebe6eba0
00ce5 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00ced 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
00cf2 0f83281d0000                   jae        0x7ffaebe6eba0
00cf8 4983c3f0                       add        r11, -0x10
00cfc 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
00d04 4983c0f1                       add        r8, -0xf
00d08 4d3bd8                         cmp        r11, r8
00d0b 0f830f1d0000                   jae        0x7ffaebe6eba0
00d11 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00d18 0f8f921d0000                   jg         0x7ffaebe6ec30
00d1e 418bca                         mov        ecx, r10d
00d21 412bc9                         sub        ecx, r9d
00d24 4183c120                       add        r9d, 0x20
00d28 448bc1                         mov        r8d, ecx
00d2b 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00d33 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00d38 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00d3f 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d47 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00d4c c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00d53 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d5b 4183c010                       add        r8d, 0x10
00d5f 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00d67 453bc1                         cmp        r8d, r9d
00d6a 7cbc                           jl         0x7ffaebe6cea8
00d6c 4881c310ffffff                 add        rbx, -0xf0
00d73 4881fb00000080                 cmp        rbx, -0x80000000
00d7a 49c7c300000080                 mov        r11, 0xffffffff80000000
00d81 490f4cdb                       cmovl      rbx, r11
00d85 8bdb                           mov        ebx, ebx
00d87 443bc3                         cmp        r8d, ebx
00d8a 0f8d96010000                   jge        0x7ffaebe6d0a6
00d90 458bd8                         mov        r11d, r8d
00d93 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d9b 0f1f440000                     nop        dword ptr [rax + rax]
00da0 448bc1                         mov        r8d, ecx
00da3 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00dab 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00db3 4963fb                         movsxd     rdi, r11d
00db6 458bd8                         mov        r11d, r8d
00db9 4c8b4c2468                     mov        r9, qword ptr [rsp + 0x68]
00dbe c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
00dc5 4963d0                         movsxd     rdx, r8d
00dc8 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00dd0 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00dd5 c4817a7f440108                 vmovdqu    xmmword ptr [r9 + r8 + 8], xmm0
00ddc 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00de1 c4c17a6f441318                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x18]
00de8 c4c17a7f443918                 vmovdqu    xmmword ptr [r9 + rdi + 0x18], xmm0
00def 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00df4 c4c17a6f441328                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x28]
00dfb c4c17a7f443928                 vmovdqu    xmmword ptr [r9 + rdi + 0x28], xmm0
00e02 c4c17a6f441338                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x38]
00e09 c4c17a7f443938                 vmovdqu    xmmword ptr [r9 + rdi + 0x38], xmm0
00e10 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e15 c4c17a6f441348                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x48]
00e1c c4c17a7f443948                 vmovdqu    xmmword ptr [r9 + rdi + 0x48], xmm0
00e23 c4c17a6f441358                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x58]
00e2a c4c17a7f443958                 vmovdqu    xmmword ptr [r9 + rdi + 0x58], xmm0
00e31 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e36 c4c17a6f441368                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x68]
00e3d c4c17a7f443968                 vmovdqu    xmmword ptr [r9 + rdi + 0x68], xmm0
00e44 c4c17a6f441378                 vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x78]
00e4b c4c17a7f443978                 vmovdqu    xmmword ptr [r9 + rdi + 0x78], xmm0
00e52 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e57 c4c17a6f841388000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x88]
00e61 c4c17a7f843988000000           vmovdqu    xmmword ptr [r9 + rdi + 0x88], xmm0
00e6b c4c17a6f841398000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0x98]
00e75 c4c17a7f843998000000           vmovdqu    xmmword ptr [r9 + rdi + 0x98], xmm0
00e7f 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00e84 c4c17a6f8413a8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xa8]
00e8e c4c17a7f8439a8000000           vmovdqu    xmmword ptr [r9 + rdi + 0xa8], xmm0
00e98 c4c17a6f8413b8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xb8]
00ea2 c4c17a7f8439b8000000           vmovdqu    xmmword ptr [r9 + rdi + 0xb8], xmm0
00eac 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00eb1 c4c17a6f8413c8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xc8]
00ebb c4c17a7f8439c8000000           vmovdqu    xmmword ptr [r9 + rdi + 0xc8], xmm0
00ec5 c4c17a6f8413d8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xd8]
00ecf c4c17a7f8439d8000000           vmovdqu    xmmword ptr [r9 + rdi + 0xd8], xmm0
00ed9 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00ede c4c17a6f8413e8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xe8]
00ee8 c4c17a7f8439e8000000           vmovdqu    xmmword ptr [r9 + rdi + 0xe8], xmm0
00ef2 c4c17a6f8413f8000000           vmovdqu    xmm0, xmmword ptr [r11 + rdx + 0xf8]
00efc c4c17a7f8439f8000000           vmovdqu    xmmword ptr [r9 + rdi + 0xf8], xmm0
00f06 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00f0e 4181c000010000                 add        r8d, 0x100
00f15 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00f1d 443bc3                         cmp        r8d, ebx
00f20 0f8c7afeffff                   jl         0x7ffaebe6cf20
00f26 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00f2e 453bdd                         cmp        r11d, r13d
00f31 7d30                           jge        0x7ffaebe6d0e3
00f33 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00f3a 6690                           nop        
00f3c 448d1c19                       lea        r11d, [rcx + rbx]
00f40 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00f45 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00f4c 448bc3                         mov        r8d, ebx
00f4f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f54 c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00f5b 83c310                         add        ebx, 0x10
00f5e 413bdd                         cmp        ebx, r13d
00f61 7cd9                           jl         0x7ffaebe6d0bc
00f63 468d1c10                       lea        r11d, [rax + r10]
00f67 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00f6f 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00f77 e9aff7ffff                     jmp        0x7ffaebe6c8ab
00f7c 4d63d0                         movsxd     r10, r8d
00f7f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f86 c442a8f5db                     bzhi       r11, r11, r10
00f8b c4c1fb92fb                     kmovq      k7, r11
00f90 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f96 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f9c e996000000                     jmp        0x7ffaebe6d1b7
00fa1 448b1c24                       mov        r11d, dword ptr [rsp]
00fa5 458bc3                         mov        r8d, r11d
00fa8 442b842498000000               sub        r8d, dword ptr [rsp + 0x98]
00fb0 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00fb8 4585d2                         test       r10d, r10d
00fbb 0f8ce3170000                   jl         0x7ffaebe6e924
00fc1 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
00fc6 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00fcd 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00fd1 458bd9                         mov        r11d, r9d
00fd4 4585c9                         test       r9d, r9d
00fd7 0f8cd3170000                   jl         0x7ffaebe6e930
00fdd 3b3424                         cmp        esi, dword ptr [rsp]
00fe0 0f82ca170000                   jb         0x7ffaebe6e930
00fe6 448b4b04                       mov        r9d, dword ptr [rbx + 4]
00fea 438d2c03                       lea        ebp, [r11 + r8]
00fee 443bcd                         cmp        r9d, ebp
00ff1 0f82b9170000                   jb         0x7ffaebe6e930
00ff7 4585c0                         test       r8d, r8d
00ffa 0f8cb0170000                   jl         0x7ffaebe6e930
01000 4585c0                         test       r8d, r8d
01003 7432                           je         0x7ffaebe6d1b7
01005 4b8d7c1608                     lea        rdi, [r14 + r10 + 8]
0100a 4c8bd3                         mov        r10, rbx
0100d 4a8d741b08                     lea        rsi, [rbx + r11 + 8]
01012 4963d0                         movsxd     rdx, r8d
01015 4883fa20                       cmp        rdx, 0x20
01019 0f865dffffff                   jbe        0x7ffaebe6d0fc
0101f c5f877                         vzeroupper 
01022 49ba204f8eebfa7f0000           movabs     r10, 0x7ffaeb8e4f20
0102c 41ffd2                         call       r10
0102f 0f1f840000000000               nop        dword ptr [rax + rax]
01037 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0103c 41896a38                       mov        dword ptr [r10 + 0x38], ebp
01040 c5f877                         vzeroupper 
01043 4881c4d0000000                 add        rsp, 0xd0
0104a 5d                             pop        rbp
0104b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0104f 0f87bb1d0000                   ja         0x7ffaebe6ef90
01055 c3                             ret        
01056 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
0105b 0f83df1a0000                   jae        0x7ffaebe6ecc0
01061 458bde                         mov        r11d, r14d
01064 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0106c 4d63c3                         movsxd     r8, r11d
0106f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01074 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
01079 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01081 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01089 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
0108e 0f83601b0000                   jae        0x7ffaebe6ed74
01094 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0109b 448d5308                       lea        r10d, [rbx + 8]
0109f 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
010a7 4c63d3                         movsxd     r10, ebx
010aa 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
010af 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
010b7 4f895c1108                     mov        qword ptr [r9 + r10 + 8], r11
010bc 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
010c4 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
010cc 0f8d98030000                   jge        0x7ffaebe6d5ea
010d2 4d2bc2                         sub        r8, r10
010d5 4963fb                         movsxd     rdi, r11d
010d8 4e8d1407                       lea        r10, [rdi + r8]
010dc 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
010e4 0f83961b0000                   jae        0x7ffaebe6ee00
010ea 4c8bd1                         mov        r10, rcx
010ed 4c2bd7                         sub        r10, rdi
010f0 4983c207                       add        r10, 7
010f4 4983e2f8                       and        r10, 0xfffffffffffffff8
010f8 458bda                         mov        r11d, r10d
010fb 458d541b08                     lea        r10d, [r11 + rbx + 8]
01100 4d63d2                         movsxd     r10, r10d
01103 4f8d5c02f8                     lea        r11, [r10 + r8 - 8]
01108 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
01110 0f836a1b0000                   jae        0x7ffaebe6ee00
01116 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
0111e 443b442474                     cmp        r8d, dword ptr [rsp + 0x74]
01123 0f83571b0000                   jae        0x7ffaebe6ee00
01129 4983c2f8                       add        r10, -8
0112d 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
01135 0f83451b0000                   jae        0x7ffaebe6ee00
0113b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01143 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
0114a 0f8fcc1b0000                   jg         0x7ffaebe6ee9c
01150 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01158 442bdb                         sub        r11d, ebx
0115b 458bcb                         mov        r9d, r11d
0115e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01163 458bda                         mov        r11d, r10d
01166 41b8f8ffffff                   mov        r8d, 0xfffffff8
0116c 452bc3                         sub        r8d, r11d
0116f 442bc3                         sub        r8d, ebx
01172 83c310                         add        ebx, 0x10
01175 4183c0f0                       add        r8d, -0x10
01179 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0117e 498bd2                         mov        rdx, r10
01181 4c8d51c8                       lea        r10, [rcx - 0x38]
01185 4981fa00000080                 cmp        r10, -0x80000000
0118c 49c7c300000080                 mov        r11, 0xffffffff80000000
01193 4d0f4cd3                       cmovl      r10, r11
01197 418bf2                         mov        esi, r10d
0119a 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
011a2 4c63d3                         movsxd     r10, ebx
011a5 41bb06000000                   mov        r11d, 6
011ab c442a0f5d8                     bzhi       r11, r8, r11
011b0 4d03d3                         add        r10, r11
011b3 4c3bd1                         cmp        r10, rcx
011b6 4c8bd9                         mov        r11, rcx
011b9 4d0f4cda                       cmovl      r11, r10
011bd 4d8bd3                         mov        r10, r11
011c0 4c2bd7                         sub        r10, rdi
011c3 4d8d42ff                       lea        r8, [r10 - 1]
011c7 49c1f83f                       sar        r8, 0x3f
011cb 49c1e83d                       shr        r8, 0x3d
011cf 4f8d5410ff                     lea        r10, [r8 + r10 - 1]
011d4 4983e2f8                       and        r10, 0xfffffffffffffff8
011d8 4c03d7                         add        r10, rdi
011db 493bfa                         cmp        rdi, r10
011de 490f4cfa                       cmovl      rdi, r10
011e2 448bc7                         mov        r8d, edi
011e5 478d540608                     lea        r10d, [r14 + r8 + 8]
011ea 4183c008                       add        r8d, 8
011ee 4963c2                         movsxd     rax, r10d
011f1 4803c2                         add        rax, rdx
011f4 4963f8                         movsxd     rdi, r8d
011f7 4803fa                         add        rdi, rdx
011fa 4c8d4008                       lea        r8, [rax + 8]
011fe 4883c048                       add        rax, 0x48
01202 488d5748                       lea        rdx, [rdi + 0x48]
01206 4533d2                         xor        r10d, r10d
01209 493bd0                         cmp        rdx, r8
0120c 410f96c2                       setbe      r10b
01210 4883c708                       add        rdi, 8
01214 4533c0                         xor        r8d, r8d
01217 483bc7                         cmp        rax, rdi
0121a 410f96c0                       setbe      r8b
0121e 450bd0                         or         r10d, r8d
01221 0f84190c0000                   je         0x7ffaebe6dfc0
01227 418bdb                         mov        ebx, r11d
0122a 6690                           nop        
0122c 458bd9                         mov        r11d, r9d
0122f 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
01237 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0123c 4f8b541808                     mov        r10, qword ptr [r8 + r11 + 8]
01241 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01249 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0124e 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01253 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0125b 4183c308                       add        r11d, 8
0125f 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01267 443bdb                         cmp        r11d, ebx
0126a 7cc0                           jl         0x7ffaebe6d3ac
0126c 4881c108feffff                 add        rcx, -0x1f8
01273 4881f900000080                 cmp        rcx, -0x80000000
0127a 49c7c200000080                 mov        r10, 0xffffffff80000000
01281 490f4cca                       cmovl      rcx, r10
01285 8bd9                           mov        ebx, ecx
01287 443bdb                         cmp        r11d, ebx
0128a 0f8d9b010000                   jge        0x7ffaebe6d5ab
01290 458bd3                         mov        r10d, r11d
01293 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0129b 0f1f440000                     nop        dword ptr [rax + rax]
012a0 458bd9                         mov        r11d, r9d
012a3 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
012ab 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
012b3 4d63c0                         movsxd     r8, r8d
012b6 458bd3                         mov        r10d, r11d
012b9 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
012bd 62b17e486f841108000000         vmovdqu32  zmm0, zmmword ptr [rcx + r10 + 8]
012c8 4963c3                         movsxd     rax, r11d
012cb 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
012d3 4183c240                       add        r10d, 0x40
012d7 4503d1                         add        r10d, r9d
012da 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
012e2 4181c380000000                 add        r11d, 0x80
012e9 4503d9                         add        r11d, r9d
012ec 8b942494000000                 mov        edx, dword ptr [rsp + 0x94]
012f3 81c200010000                   add        edx, 0x100
012f9 4103d1                         add        edx, r9d
012fc 8b8c2494000000                 mov        ecx, dword ptr [rsp + 0x94]
01303 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
01307 62f17e487f840f08000000         vmovdqu32  zmmword ptr [rdi + rcx + 8], zmm0
01312 62b17e486f841708000000         vmovdqu32  zmm0, zmmword ptr [rdi + r10 + 8]
0131d 62b17e487f840748000000         vmovdqu32  zmmword ptr [rdi + r8 + 0x48], zmm0
01328 62b17e486f841f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11 + 8]
01333 62b17e487f840788000000         vmovdqu32  zmmword ptr [rdi + r8 + 0x88], zmm0
0133e 62f17e486f8407c8000000         vmovdqu32  zmm0, zmmword ptr [rdi + rax + 0xc8]
01349 62b17e487f8407c8000000         vmovdqu32  zmmword ptr [rdi + r8 + 0xc8], zmm0
01354 448bd2                         mov        r10d, edx
01357 62b17e486f841708000000         vmovdqu32  zmm0, zmmword ptr [rdi + r10 + 8]
01362 62b17e487f840708010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x108], zmm0
0136d 62f17e486f840748010000         vmovdqu32  zmm0, zmmword ptr [rdi + rax + 0x148]
01378 62b17e487f840748010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x148], zmm0
01383 62f17e486f840788010000         vmovdqu32  zmm0, zmmword ptr [rdi + rax + 0x188]
0138e 62b17e487f840788010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x188], zmm0
01399 4c63d2                         movsxd     r10, edx
0139c 62b17e486f8417c8000000         vmovdqu32  zmm0, zmmword ptr [rdi + r10 + 0xc8]
013a7 62b17e487f8407c8010000         vmovdqu32  zmmword ptr [rdi + r8 + 0x1c8], zmm0
013b2 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
013ba 4181c200020000                 add        r10d, 0x200
013c1 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
013c9 443bd3                         cmp        r10d, ebx
013cc 0f8ccefeffff                   jl         0x7ffaebe6d420
013d2 443bd6                         cmp        r10d, esi
013d5 7d54                           jge        0x7ffaebe6d5ab
013d7 458bda                         mov        r11d, r10d
013da 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
013e2 6690                           nop        
013e4 458bd1                         mov        r10d, r9d
013e7 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
013ef 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
013f4 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
013ff 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01407 62917e487f841308000000         vmovdqu32  zmmword ptr [r11 + r10 + 8], zmm0
01412 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0141a 4183c240                       add        r10d, 0x40
0141e 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01426 443bd6                         cmp        r10d, esi
01429 7cb9                           jl         0x7ffaebe6d564
0142b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01433 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
0143b 7d2d                           jge        0x7ffaebe6d5ea
0143d 8b8c2494000000                 mov        ecx, dword ptr [rsp + 0x94]
01444 458d1409                       lea        r10d, [r9 + rcx]
01448 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0144d 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
01452 448bd9                         mov        r11d, ecx
01455 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01459 4e89541b08                     mov        qword ptr [rbx + r11 + 8], r10
0145e 83c108                         add        ecx, 8
01461 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
01468 7cda                           jl         0x7ffaebe6d5c4
0146a 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
01472 e901f1ffff                     jmp        0x7ffaebe6c6f8
01477 4c03c9                         add        r9, rcx
0147a 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
0147f 7e08                           jle        0x7ffaebe6d609
01481 4533c0                         xor        r8d, r8d
01484 e92aecffff                     jmp        0x7ffaebe6c233
01489 4533c0                         xor        r8d, r8d
0148c ba01000000                     mov        edx, 1
01491 e91fecffff                     jmp        0x7ffaebe6c235
01496 bee4ffffff                     mov        esi, 0xffffffe4
0149b 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014a0 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
014a5 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
014ad 448b1c24                       mov        r11d, dword ptr [rsp]
014b1 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
014b9 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
014be 4c891c24                       mov        qword ptr [rsp], r11
014c2 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
014c7 4c895c2408                     mov        qword ptr [rsp + 8], r11
014cc 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
014d1 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
014d9 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
014de 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
014e3 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
014e8 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
014ed 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014f2 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
014f7 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014fc 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01501 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01506 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
0150b 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01510 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01515 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0151a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0151f 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01524 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01529 89442450                       mov        dword ptr [rsp + 0x50], eax
0152d 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01532 6690                           nop        
01534 c5f877                         vzeroupper 
01537 e8a45fb5ff                     call       0x7ffaeb9c3660
0153c 0f1f840034160007               nop        dword ptr [rax + rax + 0x7001634]
01544 bee4ffffff                     mov        esi, 0xffffffe4
01549 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0154e 448b0c24                       mov        r9d, dword ptr [rsp]
01552 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
0155a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0155f 4c890424                       mov        qword ptr [rsp], r8
01563 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01568 4c89442408                     mov        qword ptr [rsp + 8], r8
0156d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01572 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
0157a 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0157f 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01584 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01589 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0158e 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01593 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01598 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0159d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
015a2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015a7 4489542430                     mov        dword ptr [rsp + 0x30], r10d
015ac 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
015b1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
015b6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
015bb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015c0 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
015c5 4489442434                     mov        dword ptr [rsp + 0x34], r8d
015ca 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
015cf 4489542448                     mov        dword ptr [rsp + 0x48], r10d
015d4 89442450                       mov        dword ptr [rsp + 0x50], eax
015d8 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
015dd 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
015e2 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
015e7 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
015ed 666690                         nop        
015f0 c5f877                         vzeroupper 
015f3 e8e85eb5ff                     call       0x7ffaeb9c3660
015f8 0f1f8400f0160008               nop        dword ptr [rax + rax + 0x80016f0]
01600 bee4ffffff                     mov        esi, 0xffffffe4
01605 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0160a 448b1c24                       mov        r11d, dword ptr [rsp]
0160e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01616 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0161b 4c891424                       mov        qword ptr [rsp], r10
0161f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01624 4c89542408                     mov        qword ptr [rsp + 8], r10
01629 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0162e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01636 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0163b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01640 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01645 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0164a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0164f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01654 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01659 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0165e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01663 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01668 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0166d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01672 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01677 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0167c 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01681 666690                         nop        
01684 c5f877                         vzeroupper 
01687 e8545eb5ff                     call       0x7ffaeb9c3660
0168c 0f1f840084170009               nop        dword ptr [rax + rax + 0x9001784]
01694 be45ffffff                     mov        esi, 0xffffff45
01699 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0169e 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
016a6 6690                           nop        
016a8 c5f877                         vzeroupper 
016ab e8305eb5ff                     call       0x7ffaeb9c3660
016b0 0f1f8400a817000a               nop        dword ptr [rax + rax + 0xa0017a8]
016b8 be45ffffff                     mov        esi, 0xffffff45
016bd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016c2 448b0424                       mov        r8d, dword ptr [rsp]
016c6 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
016ce 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
016d3 4c891c24                       mov        qword ptr [rsp], r11
016d7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
016dc 4c895c2408                     mov        qword ptr [rsp + 8], r11
016e1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
016e6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
016ee 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
016f3 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
016f8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016fd 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01702 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01707 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0170c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01711 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01716 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0171b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01720 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01725 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0172a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0172f 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01734 89442450                       mov        dword ptr [rsp + 0x50], eax
01738 895c2458                       mov        dword ptr [rsp + 0x58], ebx
0173c c5f877                         vzeroupper 
0173f e89c5db5ff                     call       0x7ffaeb9c3660
01744 0f1f84003c18000b               nop        dword ptr [rax + rax + 0xb00183c]
0174c 493bd8                         cmp        rbx, r8
0174f bdffffffff                     mov        ebp, 0xffffffff
01754 7c08                           jl         0x7ffaebe6d8de
01756 400f95c5                       setne      bpl
0175a 400fb6ed                       movzx      ebp, bpl
0175e be45ffffff                     mov        esi, 0xffffff45
01763 48ff742408                     push       qword ptr [rsp + 8]
01768 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01770 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01775 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0177d 48ff742420                     push       qword ptr [rsp + 0x20]
01782 488f442408                     pop        qword ptr [rsp + 8]
01787 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
0178c 44894c2404                     mov        dword ptr [rsp + 4], r9d
01791 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01796 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0179b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017a0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
017a5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
017aa 89442458                       mov        dword ptr [rsp + 0x58], eax
017ae 4c89442468                     mov        qword ptr [rsp + 0x68], r8
017b3 90                             nop        
017b4 c5f877                         vzeroupper 
017b7 e8245db5ff                     call       0x7ffaeb9c3660
017bc 0f1f8400b418000c               nop        dword ptr [rax + rax + 0xc0018b4]
017c4 be45ffffff                     mov        esi, 0xffffff45
017c9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ce 448b1c24                       mov        r11d, dword ptr [rsp]
017d2 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
017da 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017df 4c891c24                       mov        qword ptr [rsp], r11
017e3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
017e8 4c895c2408                     mov        qword ptr [rsp + 8], r11
017ed 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
017f2 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
017fa 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
017ff 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01804 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01809 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0180e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01813 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01818 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0181d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01822 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01827 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0182c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01831 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01836 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0183b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01840 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01845 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0184a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0184f 89442450                       mov        dword ptr [rsp + 0x50], eax
01853 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01858 c5f877                         vzeroupper 
0185b e8805cb5ff                     call       0x7ffaeb9c3660
01860 0f1f84005819000d               nop        dword ptr [rax + rax + 0xd001958]
01868 be45ffffff                     mov        esi, 0xffffff45
0186d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01872 448b0424                       mov        r8d, dword ptr [rsp]
01876 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
0187e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01883 4c891c24                       mov        qword ptr [rsp], r11
01887 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0188c 4c895c2408                     mov        qword ptr [rsp + 8], r11
01891 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01896 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0189e 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
018a3 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
018a8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
018ad 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018b2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
018b7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018bc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018c1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018c6 4489542430                     mov        dword ptr [rsp + 0x30], r10d
018cb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018d0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018d5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
018da 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018df 89442450                       mov        dword ptr [rsp + 0x50], eax
018e3 90                             nop        
018e4 c5f877                         vzeroupper 
018e7 e8f45bb5ff                     call       0x7ffaeb9c3660
018ec 0f1f8400e419000e               nop        dword ptr [rax + rax + 0xe0019e4]
018f4 bee4ffffff                     mov        esi, 0xffffffe4
018f9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018fe 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01903 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0190b 448b1424                       mov        r10d, dword ptr [rsp]
0190f 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01917 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0191c 4c891424                       mov        qword ptr [rsp], r10
01920 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01925 4c89542408                     mov        qword ptr [rsp + 8], r10
0192a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0192f 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01937 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0193c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01941 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01946 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0194b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01950 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01955 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0195a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0195f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01964 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01969 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0196e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01973 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01978 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0197d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01982 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01987 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0198c 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01991 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01996 6690                           nop        
01998 c5f877                         vzeroupper 
0199b e8405bb5ff                     call       0x7ffaeb9c3660
019a0 0f1f8400981a000f               nop        dword ptr [rax + rax + 0xf001a98]
019a8 bee4ffffff                     mov        esi, 0xffffffe4
019ad 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019b2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
019b7 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
019bf 448b1c24                       mov        r11d, dword ptr [rsp]
019c3 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
019cb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019d0 4c891424                       mov        qword ptr [rsp], r10
019d4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019d9 4c89542408                     mov        qword ptr [rsp + 8], r10
019de 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
019e3 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
019eb 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019f0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019f5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019fa 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019ff 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a04 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a09 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a0e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a13 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a18 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01a1d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a22 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a27 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a2c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a31 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a36 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a3b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a40 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a45 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01a4a 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01a4f 90                             nop        
01a50 c5f877                         vzeroupper 
01a53 e8885ab5ff                     call       0x7ffaeb9c3660
01a58 0f1f8400501b0010               nop        dword ptr [rax + rax + 0x10001b50]
01a60 4183c608                       add        r14d, 8
01a64 be6effffff                     mov        esi, 0xffffff6e
01a69 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a6e 448b0424                       mov        r8d, dword ptr [rsp]
01a72 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01a7a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01a7f 4c891c24                       mov        qword ptr [rsp], r11
01a83 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a88 4c895c2408                     mov        qword ptr [rsp + 8], r11
01a8d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01a92 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01a9a 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01a9f 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01aa4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01aa9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01aae 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ab3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ab8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01abd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ac2 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ac7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01acc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ad1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ad6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01adb 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01ae0 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ae5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01aea 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01aef 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01af7 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01afc 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01b01 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01b06 6690                           nop        
01b08 c5f877                         vzeroupper 
01b0b e8d059b5ff                     call       0x7ffaeb9c3660
01b10 0f1f8400081c0011               nop        dword ptr [rax + rax + 0x11001c08]
01b18 4183c608                       add        r14d, 8
01b1c be66ffffff                     mov        esi, 0xffffff66
01b21 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b26 448b1c24                       mov        r11d, dword ptr [rsp]
01b2a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b32 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01b37 4c891c24                       mov        qword ptr [rsp], r11
01b3b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b40 4c895c2408                     mov        qword ptr [rsp + 8], r11
01b45 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b4a 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01b52 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01b57 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01b5c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01b61 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b66 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b6b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b70 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b75 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b7a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b7f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b84 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b89 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b8e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b93 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01b98 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01b9d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01ba2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ba7 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01baf 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01bb4 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01bb9 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01bbe 6690                           nop        
01bc0 c5f877                         vzeroupper 
01bc3 e81859b5ff                     call       0x7ffaeb9c3660
01bc8 0f1f8400c01c0012               nop        dword ptr [rax + rax + 0x12001cc0]
01bd0 beccffffff                     mov        esi, 0xffffffcc
01bd5 48ff742408                     push       qword ptr [rsp + 8]
01bda 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01be2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01be7 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01bef 48ff742420                     push       qword ptr [rsp + 0x20]
01bf4 488f442408                     pop        qword ptr [rsp + 8]
01bf9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01bfe 4489542404                     mov        dword ptr [rsp + 4], r10d
01c03 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c08 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c0d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c12 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c17 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c1c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01c21 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c26 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01c2b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c30 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c35 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c3a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c3f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c44 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c49 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c4e 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01c53 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c58 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c5c c5f877                         vzeroupper 
01c5f e87c58b5ff                     call       0x7ffaeb9c3660
01c64 0f1f84005c1d0013               nop        dword ptr [rax + rax + 0x13001d5c]
01c6c beccffffff                     mov        esi, 0xffffffcc
01c71 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01c76 448b1c24                       mov        r11d, dword ptr [rsp]
01c7a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01c82 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c87 4c891424                       mov        qword ptr [rsp], r10
01c8b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c90 4c89542408                     mov        qword ptr [rsp + 8], r10
01c95 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c9a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01ca2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ca7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cac 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01cb1 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01cb6 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01cbb 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01cc0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cc5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cca 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ccf 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cd4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01cd9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01cde 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ce3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ce8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ced 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01cf2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01cf7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01cfc 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01d04 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01d09 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01d0e 6690                           nop        
01d10 c5f877                         vzeroupper 
01d13 e8c857b5ff                     call       0x7ffaeb9c3660
01d18 0f1f8400101e0014               nop        dword ptr [rax + rax + 0x14001e10]
01d20 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
01d25 4d3bd9                         cmp        r11, r9
01d28 bdffffffff                     mov        ebp, 0xffffffff
01d2d 7c08                           jl         0x7ffaebe6deb7
01d2f 400f95c5                       setne      bpl
01d33 400fb6ed                       movzx      ebp, bpl
01d37 be45ffffff                     mov        esi, 0xffffff45
01d3c 48ff742408                     push       qword ptr [rsp + 8]
01d41 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01d49 48ff742420                     push       qword ptr [rsp + 0x20]
01d4e 488f442408                     pop        qword ptr [rsp + 8]
01d53 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01d58 44894c2404                     mov        dword ptr [rsp + 4], r9d
01d5d 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01d62 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d67 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01d6c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d71 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d76 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d7b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d80 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01d85 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d8a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d8f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01d94 89442454                       mov        dword ptr [rsp + 0x54], eax
01d98 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01d9d 666690                         nop        
01da0 c5f877                         vzeroupper 
01da3 e83857b5ff                     call       0x7ffaeb9c3660
01da8 0f1f8400a01e0015               nop        dword ptr [rax + rax + 0x15001ea0]
01db0 4c8b4c2448                     mov        r9, qword ptr [rsp + 0x48]
01db5 493bd9                         cmp        rbx, r9
01db8 bdffffffff                     mov        ebp, 0xffffffff
01dbd 7c08                           jl         0x7ffaebe6df47
01dbf 400f95c5                       setne      bpl
01dc3 400fb6ed                       movzx      ebp, bpl
01dc7 be45ffffff                     mov        esi, 0xffffff45
01dcc 48ff742408                     push       qword ptr [rsp + 8]
01dd1 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01dd9 48ff742420                     push       qword ptr [rsp + 0x20]
01dde 488f442408                     pop        qword ptr [rsp + 8]
01de3 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01de8 44894c2404                     mov        dword ptr [rsp + 4], r9d
01ded 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01df2 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01df7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01dfc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01e01 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e06 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01e0b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e10 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01e15 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e1a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01e1f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01e24 89442454                       mov        dword ptr [rsp + 0x54], eax
01e28 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01e2d 666690                         nop        
01e30 c5f877                         vzeroupper 
01e33 e8a856b5ff                     call       0x7ffaeb9c3660
01e38 0f1f8400301f0016               nop        dword ptr [rax + rax + 0x16001f30]
01e40 458bd9                         mov        r11d, r9d
01e43 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
01e4b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e50 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
01e55 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01e5d 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01e61 4e89540108                     mov        qword ptr [rcx + r8 + 8], r10
01e66 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01e6e 4183c208                       add        r10d, 8
01e72 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01e7a 443bd3                         cmp        r10d, ebx
01e7d 7cc1                           jl         0x7ffaebe6dfc0
01e7f 443bd6                         cmp        r10d, esi
01e82 0f8db4000000                   jge        0x7ffaebe6e0bc
01e88 458bda                         mov        r11d, r10d
01e8b 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01e93 0f1f8000000000                 nop        dword ptr [rax]
01e9a 660f1f440000                   nop        word ptr [rax + rax]
01ea0 458bd9                         mov        r11d, r9d
01ea3 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
01eab 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01eb3 4963c8                         movsxd     rcx, r8d
01eb6 458bd3                         mov        r10d, r11d
01eb9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01ebe 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01ec3 4d63db                         movsxd     r11, r11d
01ec6 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01ece 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
01ed2 4e89540708                     mov        qword ptr [rdi + r8 + 8], r10
01ed7 4e8b541f10                     mov        r10, qword ptr [rdi + r11 + 0x10]
01edc 8bdf                           mov        ebx, edi
01ede 4c89540b10                     mov        qword ptr [rbx + rcx + 0x10], r10
01ee3 4e8b541b18                     mov        r10, qword ptr [rbx + r11 + 0x18]
01ee8 4c89540b18                     mov        qword ptr [rbx + rcx + 0x18], r10
01eed 4e8b541b20                     mov        r10, qword ptr [rbx + r11 + 0x20]
01ef2 4c89540b20                     mov        qword ptr [rbx + rcx + 0x20], r10
01ef7 4e8b541b28                     mov        r10, qword ptr [rbx + r11 + 0x28]
01efc 4c89540b28                     mov        qword ptr [rbx + rcx + 0x28], r10
01f01 4e8b541b30                     mov        r10, qword ptr [rbx + r11 + 0x30]
01f06 4c89540b30                     mov        qword ptr [rbx + rcx + 0x30], r10
01f0b 4e8b541b38                     mov        r10, qword ptr [rbx + r11 + 0x38]
01f10 4c89540b38                     mov        qword ptr [rbx + rcx + 0x38], r10
01f15 4e8b541b40                     mov        r10, qword ptr [rbx + r11 + 0x40]
01f1a 4c89540b40                     mov        qword ptr [rbx + rcx + 0x40], r10
01f1f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01f27 4183c240                       add        r10d, 0x40
01f2b 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01f33 443bd6                         cmp        r10d, esi
01f36 0f8c64ffffff                   jl         0x7ffaebe6e020
01f3c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01f44 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
01f4c 0f8d18f5ffff                   jge        0x7ffaebe6d5ea
01f52 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01f5a 6690                           nop        
01f5c 478d0419                       lea        r8d, [r9 + r11]
01f60 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f65 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
01f6a 418bcb                         mov        ecx, r11d
01f6d 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01f71 4c89540b08                     mov        qword ptr [rbx + rcx + 8], r10
01f76 458d5308                       lea        r10d, [r11 + 8]
01f7a 458bda                         mov        r11d, r10d
01f7d 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
01f85 7cd5                           jl         0x7ffaebe6e0dc
01f87 e9def4ffff                     jmp        0x7ffaebe6d5ea
01f8c bee4ffffff                     mov        esi, 0xffffffe4
01f91 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f96 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01f9b 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01fa3 448b0424                       mov        r8d, dword ptr [rsp]
01fa7 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01faf 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01fb4 4c891c24                       mov        qword ptr [rsp], r11
01fb8 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01fbd 4c895c2408                     mov        qword ptr [rsp + 8], r11
01fc2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01fc7 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01fcf 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01fd4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01fd9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fde 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01fe3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fe8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fed 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ff2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ff7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ffc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02001 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02006 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0200b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02010 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02015 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0201a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0201f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02024 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02029 89442450                       mov        dword ptr [rsp + 0x50], eax
0202d 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02031 666690                         nop        
02034 c5f877                         vzeroupper 
02037 e8a454b5ff                     call       0x7ffaeb9c3660
0203c 0f1f840034210017               nop        dword ptr [rax + rax + 0x17002134]
02044 85db                           test       ebx, ebx
02046 0f846c0d0000                   je         0x7ffaebe6ef38
0204c 448b1c24                       mov        r11d, dword ptr [rsp]
02050 458bca                         mov        r9d, r10d
02053 4533d2                         xor        r10d, r10d
02056 458bc3                         mov        r8d, r11d
02059 e973efffff                     jmp        0x7ffaebe6d151
0205e be6effffff                     mov        esi, 0xffffff6e
02063 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02068 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
0206d 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02075 448b0424                       mov        r8d, dword ptr [rsp]
02079 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
02081 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02086 4c891c24                       mov        qword ptr [rsp], r11
0208a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0208f 4c895c2408                     mov        qword ptr [rsp + 8], r11
02094 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02099 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
020a1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
020a6 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
020ab 4489542424                     mov        dword ptr [rsp + 0x24], r10d
020b0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020b5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
020ba 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020bf 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
020c4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020c9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020ce 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
020d3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020d8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
020dd 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020e2 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020e7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
020ec 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
020f1 89442450                       mov        dword ptr [rsp + 0x50], eax
020f5 894c2460                       mov        dword ptr [rsp + 0x60], ecx
020f9 895c2468                       mov        dword ptr [rsp + 0x68], ebx
020fd 666690                         nop        
02100 c5f877                         vzeroupper 
02103 e8d853b5ff                     call       0x7ffaeb9c3660
02108 0f1f840000220018               nop        dword ptr [rax + rax + 0x18002200]
02110 be45ffffff                     mov        esi, 0xffffff45
02115 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0211a 448b0424                       mov        r8d, dword ptr [rsp]
0211e 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
02126 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0212b 4c891c24                       mov        qword ptr [rsp], r11
0212f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02134 4c895c2408                     mov        qword ptr [rsp + 8], r11
02139 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0213e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02146 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0214b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02150 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02155 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0215a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0215f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02164 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02169 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0216e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02173 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02178 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0217d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02182 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02187 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0218c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02191 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02196 89442450                       mov        dword ptr [rsp + 0x50], eax
0219a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0219e 6690                           nop        
021a0 c5f877                         vzeroupper 
021a3 e83853b5ff                     call       0x7ffaeb9c3660
021a8 0f1f8400a0220019               nop        dword ptr [rax + rax + 0x190022a0]
021b0 be3dffffff                     mov        esi, 0xffffff3d
021b5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
021ba 448b0424                       mov        r8d, dword ptr [rsp]
021be 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
021c6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
021cb 4c891c24                       mov        qword ptr [rsp], r11
021cf 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
021d4 4c895c2408                     mov        qword ptr [rsp + 8], r11
021d9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
021de 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
021e6 4489542420                     mov        dword ptr [rsp + 0x20], r10d
021eb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
021f0 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
021f5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
021fa 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021ff 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02204 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02209 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0220e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02213 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02218 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0221d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02222 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02227 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0222c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02231 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02236 89442450                       mov        dword ptr [rsp + 0x50], eax
0223a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0223e 6690                           nop        
02240 c5f877                         vzeroupper 
02243 e89852b5ff                     call       0x7ffaeb9c3660
02248 0f1f84004023001a               nop        dword ptr [rax + rax + 0x1a002340]
02250 bee4ffffff                     mov        esi, 0xffffffe4
02255 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0225a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0225f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02267 448b1424                       mov        r10d, dword ptr [rsp]
0226b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02273 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02278 4c891424                       mov        qword ptr [rsp], r10
0227c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02281 4c89542408                     mov        qword ptr [rsp + 8], r10
02286 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0228b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02293 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02298 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0229d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
022a2 4489542420                     mov        dword ptr [rsp + 0x20], r10d
022a7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
022ac 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022b1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
022b6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
022bb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022c0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
022c5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
022ca 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022cf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
022d4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
022d9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022de 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
022e3 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
022e8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
022ed 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
022f2 6690                           nop        
022f4 c5f877                         vzeroupper 
022f7 e8e451b5ff                     call       0x7ffaeb9c3660
022fc 0f1f8400f423001b               nop        dword ptr [rax + rax + 0x1b0023f4]
02304 bee4ffffff                     mov        esi, 0xffffffe4
02309 48ff742408                     push       qword ptr [rsp + 8]
0230e 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02316 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0231b 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02323 48ff742420                     push       qword ptr [rsp + 0x20]
02328 488f442408                     pop        qword ptr [rsp + 8]
0232d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02332 44895c2404                     mov        dword ptr [rsp + 4], r11d
02337 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0233c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02341 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02346 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0234b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02350 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02355 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0235a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0235f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02364 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02369 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0236e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02373 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02378 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0237d 4489442454                     mov        dword ptr [rsp + 0x54], r8d
02382 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02387 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0238c c5f877                         vzeroupper 
0238f e84c51b5ff                     call       0x7ffaeb9c3660
02394 0f1f84008c24001c               nop        dword ptr [rax + rax + 0x1c00248c]
0239c 418d6e01                       lea        ebp, [r14 + 1]
023a0 bee4ffffff                     mov        esi, 0xffffffe4
023a5 48ff742408                     push       qword ptr [rsp + 8]
023aa 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
023b2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
023b7 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
023bf 48ff742420                     push       qword ptr [rsp + 0x20]
023c4 488f442408                     pop        qword ptr [rsp + 8]
023c9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
023ce 4489542404                     mov        dword ptr [rsp + 4], r10d
023d3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
023d8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023dd 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
023e2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
023e7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023ec 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
023f1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023f6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023fb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02400 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02405 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0240a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0240f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02414 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02419 4489442454                     mov        dword ptr [rsp + 0x54], r8d
0241e 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02423 4489442468                     mov        dword ptr [rsp + 0x68], r8d
02428 c5f877                         vzeroupper 
0242b e8b050b5ff                     call       0x7ffaeb9c3660
02430 0f1f84002825001d               nop        dword ptr [rax + rax + 0x1d002528]
02438 bee4ffffff                     mov        esi, 0xffffffe4
0243d 48ff742408                     push       qword ptr [rsp + 8]
02442 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
0244a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0244f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02457 48ff742420                     push       qword ptr [rsp + 0x20]
0245c 488f442408                     pop        qword ptr [rsp + 8]
02461 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02466 44895c2404                     mov        dword ptr [rsp + 4], r11d
0246b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02470 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02475 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0247a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0247f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02484 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02489 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0248e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02493 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02498 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0249d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
024a2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
024a7 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
024ac 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
024b1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
024b6 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
024bb 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
024c0 c5f877                         vzeroupper 
024c3 e81850b5ff                     call       0x7ffaeb9c3660
024c8 0f1f8400c025001e               nop        dword ptr [rax + rax + 0x1e0025c0]
024d0 bee4ffffff                     mov        esi, 0xffffffe4
024d5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
024da 448b1c24                       mov        r11d, dword ptr [rsp]
024de 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
024e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024eb 4c891424                       mov        qword ptr [rsp], r10
024ef 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024f4 4c89542408                     mov        qword ptr [rsp + 8], r10
024f9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
024fe 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02506 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0250b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02510 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02515 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0251a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0251f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02524 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02529 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0252e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02533 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02538 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0253d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02542 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02547 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0254c 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
02550 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02555 666690                         nop        
02558 c5f877                         vzeroupper 
0255b e8804fb5ff                     call       0x7ffaeb9c3660
02560 0f1f84005826001f               nop        dword ptr [rax + rax + 0x1f002658]
02568 beccffffff                     mov        esi, 0xffffffcc
0256d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02572 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02577 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0257f 448b1424                       mov        r10d, dword ptr [rsp]
02583 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0258b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02590 4c891424                       mov        qword ptr [rsp], r10
02594 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02599 4c89542408                     mov        qword ptr [rsp + 8], r10
0259e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
025a3 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
025ab 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
025b0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
025b5 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
025ba 4489542420                     mov        dword ptr [rsp + 0x20], r10d
025bf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
025c4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
025c9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
025ce 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
025d3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
025d8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
025dd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
025e2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025e7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
025ec 4489542440                     mov        dword ptr [rsp + 0x40], r10d
025f1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
025f6 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
025fb 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02600 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
02605 4489742460                     mov        dword ptr [rsp + 0x60], r14d
0260a 6690                           nop        
0260c c5f877                         vzeroupper 
0260f e8cc4eb5ff                     call       0x7ffaeb9c3660
02614 0f1f84000c270020               nop        dword ptr [rax + rax + 0x2000270c]
0261c be45ffffff                     mov        esi, 0xffffff45
02621 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02626 448b1c24                       mov        r11d, dword ptr [rsp]
0262a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02632 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02637 4c891424                       mov        qword ptr [rsp], r10
0263b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02640 4c89542408                     mov        qword ptr [rsp + 8], r10
02645 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0264a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02652 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02657 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0265c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02661 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02666 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0266b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02670 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02675 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0267a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0267f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02684 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02689 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0268e 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02693 90                             nop        
02694 c5f877                         vzeroupper 
02697 e8444eb5ff                     call       0x7ffaeb9c3660
0269c 0f1f840094270021               nop        dword ptr [rax + rax + 0x21002794]
026a4 be17000000                     mov        esi, 0x17
026a9 666690                         nop        
026ac c5f877                         vzeroupper 
026af e82c4eb5ff                     call       0x7ffaeb9c3660
026b4 0f1f8400ac270022               nop        dword ptr [rax + rax + 0x220027ac]
026bc be6effffff                     mov        esi, 0xffffff6e
026c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
026c6 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
026ce 4c895c2408                     mov        qword ptr [rsp + 8], r11
026d3 895c2418                       mov        dword ptr [rsp + 0x18], ebx
026d7 48894424f8                     mov        qword ptr [rsp - 8], rax
026dc 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
026e0 89442420                       mov        dword ptr [rsp + 0x20], eax
026e4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026e9 48ff742430                     push       qword ptr [rsp + 0x30]
026ee 488f442428                     pop        qword ptr [rsp + 0x28]
026f3 89542424                       mov        dword ptr [rsp + 0x24], edx
026f7 4c89442430                     mov        qword ptr [rsp + 0x30], r8
026fc 48ff742448                     push       qword ptr [rsp + 0x48]
02701 488f442438                     pop        qword ptr [rsp + 0x38]
02706 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0270a 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0270f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02714 c5f877                         vzeroupper 
02717 e8c44db5ff                     call       0x7ffaeb9c3660
0271c 0f1f840014280023               nop        dword ptr [rax + rax + 0x23002814]
02724 bebeffffff                     mov        esi, 0xffffffbe
02729 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0272e 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02736 8b3c24                         mov        edi, dword ptr [rsp]
02739 89bc24e8000000                 mov        dword ptr [rsp + 0xe8], edi
02740 4c891c24                       mov        qword ptr [rsp], r11
02744 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02749 4c89542408                     mov        qword ptr [rsp + 8], r10
0274e 4889442410                     mov        qword ptr [rsp + 0x10], rax
02753 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02757 48894424f8                     mov        qword ptr [rsp - 8], rax
0275c 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02760 89442420                       mov        dword ptr [rsp + 0x20], eax
02764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02769 48ff742430                     push       qword ptr [rsp + 0x30]
0276e 488f442428                     pop        qword ptr [rsp + 0x28]
02773 89542424                       mov        dword ptr [rsp + 0x24], edx
02777 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0277c 48ff742448                     push       qword ptr [rsp + 0x48]
02781 488f442438                     pop        qword ptr [rsp + 0x38]
02786 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0278a 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0278f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02794 c5f877                         vzeroupper 
02797 e8444db5ff                     call       0x7ffaeb9c3660
0279c 0f1f840094280024               nop        dword ptr [rax + rax + 0x24002894]
027a4 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
027a9 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
027ad 458bd9                         mov        r11d, r9d
027b0 beccffffff                     mov        esi, 0xffffffcc
027b5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027ba 4c89b424e8000000               mov        qword ptr [rsp + 0xe8], r14
027c2 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
027ca 891c24                         mov        dword ptr [rsp], ebx
027cd 44895c2404                     mov        dword ptr [rsp + 4], r11d
027d2 448944240c                     mov        dword ptr [rsp + 0xc], r8d
027d7 90                             nop        
027d8 c5f877                         vzeroupper 
027db e8004db5ff                     call       0x7ffaeb9c3660
027e0 0f1f8400d8280025               nop        dword ptr [rax + rax + 0x250028d8]
027e8 bee4ffffff                     mov        esi, 0xffffffe4
027ed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027f2 448b1c24                       mov        r11d, dword ptr [rsp]
027f6 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
027fe 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02803 4c891c24                       mov        qword ptr [rsp], r11
02807 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0280c 4c895c2408                     mov        qword ptr [rsp + 8], r11
02811 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02816 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0281e 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02823 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02828 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0282d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02832 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02837 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0283c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02841 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02846 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0284b 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02850 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02855 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0285a 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0285f 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02864 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02869 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0286e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02873 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02878 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0287c 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02881 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02886 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0288b 90                             nop        
0288c c5f877                         vzeroupper 
0288f e84c4cb5ff                     call       0x7ffaeb9c3660
02894 0f1f84008c290026               nop        dword ptr [rax + rax + 0x2600298c]
0289c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
028a5 bee4ffffff                     mov        esi, 0xffffffe4
028aa 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028af 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
028b7 448b0424                       mov        r8d, dword ptr [rsp]
028bb 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
028c3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
028c8 4c891c24                       mov        qword ptr [rsp], r11
028cc 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
028d1 4c895c2408                     mov        qword ptr [rsp + 8], r11
028d6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028db 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
028e3 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
028e8 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
028ed 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
028f2 4489442418                     mov        dword ptr [rsp + 0x18], r8d
028f7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
028fc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02901 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02906 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
0290b 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
02910 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02915 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0291a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0291f 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02924 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02929 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0292e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02933 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02938 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0293d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02941 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02946 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0294b 90                             nop        
0294c c5f877                         vzeroupper 
0294f e88c4bb5ff                     call       0x7ffaeb9c3660
02954 0f1f84004c2a0027               nop        dword ptr [rax + rax + 0x27002a4c]
0295c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
02964 beccffffff                     mov        esi, 0xffffffcc
02969 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0296e 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
02973 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
0297b 448b0c24                       mov        r9d, dword ptr [rsp]
0297f 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
02987 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0298c 4c890424                       mov        qword ptr [rsp], r8
02990 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
02995 4c89442408                     mov        qword ptr [rsp + 8], r8
0299a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0299f 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
029a7 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
029ac 4c89442410                     mov        qword ptr [rsp + 0x10], r8
029b1 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
029b6 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
029bb 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
029c0 4489442424                     mov        dword ptr [rsp + 0x24], r8d
029c5 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
029ca 4c89442428                     mov        qword ptr [rsp + 0x28], r8
029cf 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
029d4 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
029d9 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
029de 4c89442438                     mov        qword ptr [rsp + 0x38], r8
029e3 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
029e8 4c89442440                     mov        qword ptr [rsp + 0x40], r8
029ed 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
029f2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
029f7 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
029fc 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
02a01 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02a06 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02a0b 89442470                       mov        dword ptr [rsp + 0x70], eax
02a0f 90                             nop        
02a10 c5f877                         vzeroupper 
02a13 e8c84ab5ff                     call       0x7ffaeb9c3660
02a18 0f1f8400102b0028               nop        dword ptr [rax + rax + 0x28002b10]
02a20 418bea                         mov        ebp, r10d
02a23 83c510                         add        ebp, 0x10
02a26 be6effffff                     mov        esi, 0xffffff6e
02a2b 48ff742408                     push       qword ptr [rsp + 8]
02a30 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02a38 48ff742420                     push       qword ptr [rsp + 0x20]
02a3d 488f442408                     pop        qword ptr [rsp + 8]
02a42 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02a47 4489442404                     mov        dword ptr [rsp + 4], r8d
02a4c 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02a51 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02a56 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02a5b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02a60 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02a65 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02a6a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02a6f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a74 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a79 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02a7e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02a83 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02a88 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02a8d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02a92 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02a97 89442454                       mov        dword ptr [rsp + 0x54], eax
02a9b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
02aa0 c5f877                         vzeroupper 
02aa3 e8384ab5ff                     call       0x7ffaeb9c3660
02aa8 0f1f8400a02b0029               nop        dword ptr [rax + rax + 0x29002ba0]
02ab0 418bea                         mov        ebp, r10d
02ab3 83c510                         add        ebp, 0x10
02ab6 be66ffffff                     mov        esi, 0xffffff66
02abb 48ff742408                     push       qword ptr [rsp + 8]
02ac0 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02ac8 48ff742420                     push       qword ptr [rsp + 0x20]
02acd 488f442408                     pop        qword ptr [rsp + 8]
02ad2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ad7 44895c2404                     mov        dword ptr [rsp + 4], r11d
02adc 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02ae1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02ae6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02aeb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02af0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02af5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02afa 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02aff 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b04 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b09 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02b0e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02b13 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02b18 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02b1d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b22 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02b27 89442454                       mov        dword ptr [rsp + 0x54], eax
02b2b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
02b30 c5f877                         vzeroupper 
02b33 e8a849b5ff                     call       0x7ffaeb9c3660
02b38 0f1f8400302c002a               nop        dword ptr [rax + rax + 0x2a002c30]
02b40 bee4ffffff                     mov        esi, 0xffffffe4
02b45 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b4a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02b4f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02b57 448b1c24                       mov        r11d, dword ptr [rsp]
02b5b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02b63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b68 4c891424                       mov        qword ptr [rsp], r10
02b6c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b71 4c89542408                     mov        qword ptr [rsp + 8], r10
02b76 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b7b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02b83 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02b88 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b8d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02b92 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02b97 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02b9c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ba1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02ba6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02bab 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02bb0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02bb5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02bba 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02bbf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02bc4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02bc9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02bce 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02bd3 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02bd8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
02bdd 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02be2 6690                           nop        
02be4 c5f877                         vzeroupper 
02be7 e8f448b5ff                     call       0x7ffaeb9c3660
02bec 0f1f8400e42c002b               nop        dword ptr [rax + rax + 0x2b002ce4]
02bf4 bee4ffffff                     mov        esi, 0xffffffe4
02bf9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02bfe 448b1424                       mov        r10d, dword ptr [rsp]
02c02 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02c0a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c0f 4c891424                       mov        qword ptr [rsp], r10
02c13 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c18 4c89542408                     mov        qword ptr [rsp + 8], r10
02c1d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02c22 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02c2a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02c2f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c34 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02c39 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02c3e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02c43 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02c48 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02c4d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c52 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02c57 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02c5c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c61 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c66 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02c6b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c70 c5f877                         vzeroupper 
02c73 e86848b5ff                     call       0x7ffaeb9c3660
02c78 0f1f8400702d002c               nop        dword ptr [rax + rax + 0x2c002d70]
02c80 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
02c88 4183c308                       add        r11d, 8
02c8c 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02c91 be6effffff                     mov        esi, 0xffffff6e
02c96 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c9b 448b1424                       mov        r10d, dword ptr [rsp]
02c9f 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02ca7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02cac 4c891424                       mov        qword ptr [rsp], r10
02cb0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02cb5 4c89542408                     mov        qword ptr [rsp + 8], r10
02cba 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02cbf 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02cc7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02ccc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02cd1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02cd6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02cdb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02ce0 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02ce5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02cea 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02cef 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02cf4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02cf9 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02d01 458bda                         mov        r11d, r10d
02d04 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02d09 666690                         nop        
02d0c c5f877                         vzeroupper 
02d0f e8cc47b5ff                     call       0x7ffaeb9c3660
02d14 0f1f84000c2e002d               nop        dword ptr [rax + rax + 0x2d002e0c]
02d1c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
02d24 4183c208                       add        r10d, 8
02d28 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02d2d be66ffffff                     mov        esi, 0xffffff66
02d32 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d37 448b1424                       mov        r10d, dword ptr [rsp]
02d3b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02d43 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d48 4c891424                       mov        qword ptr [rsp], r10
02d4c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d51 4c89542408                     mov        qword ptr [rsp + 8], r10
02d56 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02d5b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02d63 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02d68 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02d6d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02d72 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d77 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02d7c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02d81 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d86 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d8b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02d90 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02d95 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02d9d 458bda                         mov        r11d, r10d
02da0 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02da5 666690                         nop        
02da8 c5f877                         vzeroupper 
02dab e83047b5ff                     call       0x7ffaeb9c3660
02db0 0f1f8400a82e002e               nop        dword ptr [rax + rax + 0x2e002ea8]
02db8 bef6ffffff                     mov        esi, 0xfffffff6
02dbd 498bee                         mov        rbp, r14
02dc0 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02dc8 c5f877                         vzeroupper 
02dcb e81047b5ff                     call       0x7ffaeb9c3660
02dd0 0f1f8400c82e002f               nop        dword ptr [rax + rax + 0x2f002ec8]
02dd8 488bf0                         mov        rsi, rax
02ddb eb0d                           jmp        0x7ffaebe6ef6a
02ddd 488bf0                         mov        rsi, rax
02de0 eb08                           jmp        0x7ffaebe6ef6a
02de2 488bf0                         mov        rsi, rax
02de5 eb03                           jmp        0x7ffaebe6ef6a
02de7 488bf0                         mov        rsi, rax
02dea c5f877                         vzeroupper 
02ded 4881c4d0000000                 add        rsp, 0xd0
02df4 5d                             pop        rbp
02df5 e966a8b5ff                     jmp        0x7ffaeb9c97e0
02dfa bef6ffffff                     mov        esi, 0xfffffff6
02dff 90                             nop        
02e00 c5f877                         vzeroupper 
02e03 e8d846b5ff                     call       0x7ffaeb9c3660
02e08 0f1f8400002f0030               nop        dword ptr [rax + rax + 0x30002f00]
02e10 49bacbd1e6ebfa7f0000           movabs     r10, 0x7ffaebe6d1cb
02e1a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02e21 e93aefa8ff                     jmp        0x7ffaeb8fdee0
02e26 e8f5baa7ff                     call       0x7ffaeb8eaaa0
02e2b e90ed2ffff                     jmp        0x7ffaebe6c1be
