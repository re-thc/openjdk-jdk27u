00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540e9a8ff                   jne        0x7f4eaf8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85c42d0000                   jne        0x7f4eafe6ee02
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
0006e 0f8f10260000                   jg         0x7f4eafe6e684
00074 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00078 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0007d 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00081 48638c24e0000000               movsxd     rcx, dword ptr [rsp + 0xe0]
00089 4d63ca                         movsxd     r9, r10d
0008c 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
00091 4d2bc1                         sub        r8, r9
00094 493bc8                         cmp        rcx, r8
00097 0f8fe7250000                   jg         0x7f4eafe6e684
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f84ad130000                   je         0x7f4eafe6d460
000b3 33d2                           xor        edx, edx
000b5 4d8bf3                         mov        r14, r11
000b8 418b7304                       mov        esi, dword ptr [r11 + 4]
000bc 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
000c1 418b5b40                       mov        ebx, dword ptr [r11 + 0x40]
000c5 448bef                         mov        r13d, edi
000c8 85ff                           test       edi, edi
000ca 0f8e541f0000                   jle        0x7f4eafe6e024
000d0 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
000d8 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000dd 448d4ee0                       lea        r9d, [rsi - 0x20]
000e1 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
000e5 83c1e0                         add        ecx, -0x20
000e8 4c8bd8                         mov        r11, rax
000eb 418b7b04                       mov        edi, dword ptr [r11 + 4]
000ef 85ff                           test       edi, edi
000f1 0f86a5250000                   jbe        0x7f4eafe6e69c
000f7 4c63d7                         movsxd     r10, edi
000fa 4963fd                         movsxd     rdi, r13d
000fd 48ffcf                         dec        rdi
00100 493bfa                         cmp        rdi, r10
00103 0f8393250000                   jae        0x7f4eafe6e69c
00109 488b8424e8000000               mov        rax, qword ptr [rsp + 0xe8]
00111 8b7804                         mov        edi, dword ptr [rax + 4]
00114 85ff                           test       edi, edi
00116 0f86e8250000                   jbe        0x7f4eafe6e704
0011c 83ff01                         cmp        edi, 1
0011f 0f86df250000                   jbe        0x7f4eafe6e704
00125 83ff02                         cmp        edi, 2
00128 0f86d6250000                   jbe        0x7f4eafe6e704
0012e 448d56f1                       lea        r10d, [rsi - 0xf]
00132 4585d2                         test       r10d, r10d
00135 0f8cc9250000                   jl         0x7f4eafe6e704
0013b 8b6b04                         mov        ebp, dword ptr [rbx + 4]
0013e 448d55f1                       lea        r10d, [rbp - 0xf]
00142 4585d2                         test       r10d, r10d
00145 0f8cb9250000                   jl         0x7f4eafe6e704
0014b 448d55f9                       lea        r10d, [rbp - 7]
0014f 4585d2                         test       r10d, r10d
00152 0f8cac250000                   jl         0x7f4eafe6e704
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
001e5 e9b7030000                     jmp        0x7f4eafe6c5a1
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
0022f 0f8d57090000                   jge        0x7f4eafe6cb8c
00235 418bdd                         mov        ebx, r13d
00238 448bc3                         mov        r8d, ebx
0023b 442b842494000000               sub        r8d, dword ptr [rsp + 0x94]
00243 8bac2490000000                 mov        ebp, dword ptr [rsp + 0x90]
0024a 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00251 3bac2494000000                 cmp        ebp, dword ptr [rsp + 0x94]
00258 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00260 410f4fea                       cmovg      ebp, r10d
00264 4585c0                         test       r8d, r8d
00267 0f8c4b190000                   jl         0x7f4eafe6dbb8
0026d 85db                           test       ebx, ebx
0026f 0f8c43190000                   jl         0x7f4eafe6dbb8
00275 458d1c28                       lea        r11d, [r8 + rbp]
00279 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
00281 453bd3                         cmp        r10d, r11d
00284 0f822e190000                   jb         0x7f4eafe6dbb8
0028a 448d2c2b                       lea        r13d, [rbx + rbp]
0028e 453bd5                         cmp        r10d, r13d
00291 0f8221190000                   jb         0x7f4eafe6dbb8
00297 85ed                           test       ebp, ebp
00299 0f8c19190000                   jl         0x7f4eafe6dbb8
0029f 85ed                           test       ebp, ebp
002a1 0f8466ffffff                   je         0x7f4eafe6c20d
002a7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
002ac 498d741a08                     lea        rsi, [r10 + rbx + 8]
002b1 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
002b6 4863d5                         movsxd     rdx, ebp
002b9 4883fa20                       cmp        rdx, 0x20
002bd 0f8627ffffff                   jbe        0x7f4eafe6c1ea
002c3 c5f877                         vzeroupper 
002c6 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
002d0 41ffd2                         call       r10
002d3 0f1f840000000000               nop        dword ptr [rax + rax]
002db e92dffffff                     jmp        0x7f4eafe6c20d
002e0 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
002e8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
002ed c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
002f4 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
002fc 4503cb                         add        r9d, r11d
002ff e974020000                     jmp        0x7f4eafe6c578
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
00341 0f8ce6050000                   jl         0x7f4eafe6c92d
00347 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0034f 4183fa30                       cmp        r10d, 0x30
00353 0f8e9b000000                   jle        0x7f4eafe6c3f4
00359 4585f6                         test       r14d, r14d
0035c 0f8cf2180000                   jl         0x7f4eafe6dc54
00362 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0036a 4585db                         test       r11d, r11d
0036d 0f8ce1180000                   jl         0x7f4eafe6dc54
00373 4503d6                         add        r10d, r14d
00376 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
0037e 453bc2                         cmp        r8d, r10d
00381 0f82cd180000                   jb         0x7f4eafe6dc54
00387 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
0038f 0f82bf180000                   jb         0x7f4eafe6dc54
00395 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0039d 4585d2                         test       r10d, r10d
003a0 0f84c2010000                   je         0x7f4eafe6c568
003a6 4963d2                         movsxd     rdx, r10d
003a9 4883fa20                       cmp        rdx, 0x20
003ad 7728                           ja         0x7f4eafe6c3d7
003af 458bda                         mov        r11d, r10d
003b2 4d63d3                         movsxd     r10, r11d
003b5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003bc c442a8f5db                     bzhi       r11, r11, r10
003c1 c4c1fb92fb                     kmovq      k7, r11
003c6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003cc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003d2 e991010000                     jmp        0x7f4eafe6c568
003d7 c5f877                         vzeroupper 
003da 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
003e4 41ffd2                         call       r10
003e7 0f1f840000000000               nop        dword ptr [rax + rax]
003ef e974010000                     jmp        0x7f4eafe6c568
003f4 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
003f9 0f83dd140000                   jae        0x7f4eafe6d8dc
003ff 4963fe                         movsxd     rdi, r14d
00402 4d8b443808                     mov        r8, qword ptr [r8 + rdi + 8]
00407 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0040f 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
00414 0f8376150000                   jae        0x7f4eafe6d990
0041a 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00422 458d4a08                       lea        r9d, [r10 + 8]
00426 4963da                         movsxd     rbx, r10d
00429 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0042e 4d89441b08                     mov        qword ptr [r11 + rbx + 8], r8
00433 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
0043b 0f8d27010000                   jge        0x7f4eafe6c568
00441 482bfb                         sub        rdi, rbx
00444 4d63c1                         movsxd     r8, r9d
00447 4d8d1c38                       lea        r11, [r8 + rdi]
0044b 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00453 0f83ef150000                   jae        0x7f4eafe6da48
00459 4c8bd9                         mov        r11, rcx
0045c 4d2bd8                         sub        r11, r8
0045f 4983c307                       add        r11, 7
00463 4983e3f8                       and        r11, 0xfffffffffffffff8
00467 458bdb                         mov        r11d, r11d
0046a 478d441308                     lea        r8d, [r11 + r10 + 8]
0046f 4d63d8                         movsxd     r11, r8d
00472 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
00477 4c3b842488000000               cmp        r8, qword ptr [rsp + 0x88]
0047f 0f83c3150000                   jae        0x7f4eafe6da48
00485 443b4c2474                     cmp        r9d, dword ptr [rsp + 0x74]
0048a 0f83b8150000                   jae        0x7f4eafe6da48
00490 4983c3f8                       add        r11, -8
00494 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
0049c 0f83a6150000                   jae        0x7f4eafe6da48
004a2 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
004aa 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004b1 0f8f49160000                   jg         0x7f4eafe6db00
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
004df 7cdd                           jl         0x7f4eafe6c4be
004e1 4883c1f8                       add        rcx, -8
004e5 4881f900000080                 cmp        rcx, -0x80000000
004ec 49c7c200000080                 mov        r10, 0xffffffff80000000
004f3 490f4cca                       cmovl      rcx, r10
004f7 8bc9                           mov        ecx, ecx
004f9 443bc9                         cmp        r9d, ecx
004fc 7d3c                           jge        0x7f4eafe6c53a
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
00538 7cc6                           jl         0x7f4eafe6c500
0053a 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
00542 7d24                           jge        0x7f4eafe6c568
00544 478d1c0e                       lea        r11d, [r14 + r9]
00548 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0054d 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
00552 458bc1                         mov        r8d, r9d
00555 4f895c0208                     mov        qword ptr [r10 + r8 + 8], r11
0055a 4183c108                       add        r9d, 8
0055e 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
00566 7cdc                           jl         0x7f4eafe6c544
00568 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00570 44038c2490000000               add        r9d, dword ptr [rsp + 0x90]
00578 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00580 41ffc3                         inc        r11d
00583 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00588 0f8d140a0000                   jge        0x7f4eafe6cfa2
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
005de 0f8cbc100000                   jl         0x7f4eafe6d6a0
005e4 448bc0                         mov        r8d, eax
005e7 4585c0                         test       r8d, r8d
005ea 0f853c020000                   jne        0x7f4eafe6c82c
005f0 4533db                         xor        r11d, r11d
005f3 418bc3                         mov        eax, r11d
005f6 83fb03                         cmp        ebx, 3
005f9 0f8e83020000                   jle        0x7f4eafe6c882
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
0065c 0f8fd2100000                   jg         0x7f4eafe6d734
00662 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
0066a 4403e8                         add        r13d, eax
0066d 458bf5                         mov        r14d, r13d
00670 442bb42494000000               sub        r14d, dword ptr [rsp + 0x94]
00678 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0067d 4585c9                         test       r9d, r9d
00680 0f84d6010000                   je         0x7f4eafe6c85c
00686 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0068b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00693 4585db                         test       r11d, r11d
00696 0f8ee00f0000                   jle        0x7f4eafe6d67c
0069c 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
006a4 4503c5                         add        r8d, r13d
006a7 443b442464                     cmp        r8d, dword ptr [rsp + 0x64]
006ac 0f8ffa100000                   jg         0x7f4eafe6d7ac
006b2 458d0402                       lea        r8d, [r10 + rax]
006b6 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
006be 443b442460                     cmp        r8d, dword ptr [rsp + 0x60]
006c3 0f8f87110000                   jg         0x7f4eafe6d850
006c9 83f810                         cmp        eax, 0x10
006cc 0f8fc7040000                   jg         0x7f4eafe6cb99
006d2 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
006d7 0f83a20d0000                   jae        0x7f4eafe6d47f
006dd 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
006e2 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
006e9 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
006f1 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
006f6 0f83300e0000                   jae        0x7f4eafe6d52c
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
00737 0f8fc7fbffff                   jg         0x7f4eafe6c304
0073d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00745 4183fa10                       cmp        r10d, 0x10
00749 0f8cb5fbffff                   jl         0x7f4eafe6c304
0074f 443b74247c                     cmp        r14d, dword ptr [rsp + 0x7c]
00754 0f838e0e0000                   jae        0x7f4eafe6d5e8
0075a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0075f c4817a6f443308                 vmovdqu    xmm0, xmmword ptr [r11 + r14 + 8]
00766 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0076e 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00773 0f8267fbffff                   jb         0x7f4eafe6c2e0
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
0081f e83c6eb5ff                     call       0x7f4eaf9c3660
00824 0f1f84001c090001               nop        dword ptr [rax + rax + 0x100091c]
0082c 448b1c24                       mov        r11d, dword ptr [rsp]
00830 452bda                         sub        r11d, r10d
00833 453bc3                         cmp        r8d, r11d
00836 0f8ebafdffff                   jle        0x7f4eafe6c5f6
0083c be45ffffff                     mov        esi, 0xffffff45
00841 418be8                         mov        ebp, r8d
00844 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0084c c5f877                         vzeroupper 
0084f e80c6eb5ff                     call       0x7f4eaf9c3660
00854 0f1f84004c090002               nop        dword ptr [rax + rax + 0x200094c]
0085c 4d63de                         movsxd     r11, r14d
0085f 4c3b5c2440                     cmp        r11, qword ptr [rsp + 0x40]
00864 0f8c9e140000                   jl         0x7f4eafe6dd08
0086a 483b5c2448                     cmp        rbx, qword ptr [rsp + 0x48]
0086f 0f8f23150000                   jg         0x7f4eafe6dd98
00875 4533db                         xor        r11d, r11d
00878 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0087d e909feffff                     jmp        0x7f4eafe6c68b
00882 85c0                           test       eax, eax
00884 7407                           je         0x7f4eafe6c88d
00886 448d5bff                       lea        r11d, [rbx - 1]
0088a 418bdb                         mov        ebx, r11d
0088d 85db                           test       ebx, ebx
0088f 7516                           jne        0x7f4eafe6c8a7
00891 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00896 418b4b08                       mov        ecx, dword ptr [r11 + 8]
0089a 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
008a2 e97a000000                     jmp        0x7f4eafe6c921
008a7 83fb03                         cmp        ebx, 3
008aa 0f8440180000                   je         0x7f4eafe6e0f0
008b0 83fb02                         cmp        ebx, 2
008b3 0f87d7180000                   ja         0x7f4eafe6e190
008b9 3b9c24e4000000                 cmp        ebx, dword ptr [rsp + 0xe4]
008c0 0f83a6160000                   jae        0x7f4eafe6df6c
008c6 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008cb 418b4c9808                     mov        ecx, dword ptr [r8 + rbx*4 + 8]
008d0 85db                           test       ebx, ebx
008d2 7e3c                           jle        0x7f4eafe6c910
008d4 448d43ff                       lea        r8d, [rbx - 1]
008d8 443b8424e4000000               cmp        r8d, dword ptr [rsp + 0xe4]
008e0 0f8358170000                   jae        0x7f4eafe6e03e
008e6 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
008ee 6690                           nop        
008f0 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008f5 458b5c9804                     mov        r11d, dword ptr [r8 + rbx*4 + 4]
008fa 4d8bc8                         mov        r9, r8
008fd 45895c9908                     mov        dword ptr [r9 + rbx*4 + 8], r11d
00902 448d5bff                       lea        r11d, [rbx - 1]
00906 418bdb                         mov        ebx, r11d
00909 4585db                         test       r11d, r11d
0090c 7fe2                           jg         0x7f4eafe6c8f0
0090e eb08                           jmp        0x7f4eafe6c918
00910 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
00918 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0091d 41894b08                       mov        dword ptr [r11 + 8], ecx
00921 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00928 e90efdffff                     jmp        0x7f4eafe6c63b
0092d 4183fb10                       cmp        r11d, 0x10
00931 0f8dc51c0000                   jge        0x7f4eafe6e5fc
00937 4183fb08                       cmp        r11d, 8
0093b 0f8d14070000                   jge        0x7f4eafe6d055
00941 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00949 4183fa10                       cmp        r10d, 0x10
0094d 0f8eb4000000                   jle        0x7f4eafe6ca07
00953 4585f6                         test       r14d, r14d
00956 0f8cec1b0000                   jl         0x7f4eafe6e548
0095c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00964 4585db                         test       r11d, r11d
00967 0f8cdb1b0000                   jl         0x7f4eafe6e548
0096d 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00975 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
0097d 0f82c51b0000                   jb         0x7f4eafe6e548
00983 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
0098a 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00991 443bdb                         cmp        r11d, ebx
00994 0f82ae1b0000                   jb         0x7f4eafe6e548
0099a 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009a2 4585db                         test       r11d, r11d
009a5 0f8c9d1b0000                   jl         0x7f4eafe6e548
009ab 4585db                         test       r11d, r11d
009ae 0f8484f8ffff                   je         0x7f4eafe6c238
009b4 4883fd20                       cmp        rbp, 0x20
009b8 772d                           ja         0x7f4eafe6c9e7
009ba 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
009c2 4d63d2                         movsxd     r10, r10d
009c5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009cc c442a8f5db                     bzhi       r11, r11, r10
009d1 c4c1fb92fb                     kmovq      k7, r11
009d6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009dc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009e2 e951f8ffff                     jmp        0x7f4eafe6c238
009e7 488bd5                         mov        rdx, rbp
009ea c5f877                         vzeroupper 
009ed 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
009f7 41ffd2                         call       r10
009fa 0f1f840000000000               nop        dword ptr [rax + rax]
00a02 e931f8ffff                     jmp        0x7f4eafe6c238
00a07 443bb424e8000000               cmp        r14d, dword ptr [rsp + 0xe8]
00a0f 0f831b180000                   jae        0x7f4eafe6e230
00a15 430fbe6c3008                   movsx      ebp, byte ptr [r8 + r14 + 8]
00a1b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a23 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a2b 0f83b3180000                   jae        0x7f4eafe6e2e4
00a31 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a39 43886c1808                     mov        byte ptr [r8 + r11 + 8], bpl
00a3e 41ffc3                         inc        r11d
00a41 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00a49 458d5603                       lea        r10d, [r14 + 3]
00a4d 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a55 0f8321190000                   jae        0x7f4eafe6e37c
00a5b 4d63d6                         movsxd     r10, r14d
00a5e 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
00a64 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00a6c 4183c003                       add        r8d, 3
00a70 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00a78 0f839a190000                   jae        0x7f4eafe6e418
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
00ab6 0f83f4190000                   jae        0x7f4eafe6e4b0
00abc 49ba60ac28e300000000           movabs     r10, 0xe328ac60
00ac6 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00ace 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00ad3 4489742404                     mov        dword ptr [rsp + 4], r14d
00ad8 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00ae0 4183fb04                       cmp        r11d, 4
00ae4 7e3e                           jle        0x7f4eafe6cb24
00ae6 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00aed 83c504                         add        ebp, 4
00af0 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00af5 418bd6                         mov        edx, r14d
00af8 c5f877                         vzeroupper 
00afb e860eda8ff                     call       0x7f4eaf8fb860
00b00 0f1f8400f80b0003               nop        dword ptr [rax + rax + 0x3000bf8]
00b08 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b0d 8bd5                           mov        edx, ebp
00b0f 8bc8                           mov        ecx, eax
00b11 666690                         nop        
00b14 c5f877                         vzeroupper 
00b17 e844eda8ff                     call       0x7f4eaf8fb860
00b1c 0f1f8400140c0004               nop        dword ptr [rax + rax + 0x4000c14]
00b24 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00b2c 4183fb08                       cmp        r11d, 8
00b30 7e5a                           jle        0x7f4eafe6cb8c
00b32 8b542404                       mov        edx, dword ptr [rsp + 4]
00b36 49ba88ac28e300000000           movabs     r10, 0xe328ac88
00b40 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00b48 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00b4d 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b54 83c508                         add        ebp, 8
00b57 83c208                         add        edx, 8
00b5a 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b5f 90                             nop        
00b60 c5f877                         vzeroupper 
00b63 e8f8eca8ff                     call       0x7f4eaf8fb860
00b68 0f1f8400600c0005               nop        dword ptr [rax + rax + 0x5000c60]
00b70 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b75 8bd5                           mov        edx, ebp
00b77 488bc8                         mov        rcx, rax
00b7a 6690                           nop        
00b7c c5f877                         vzeroupper 
00b7f e8dceca8ff                     call       0x7f4eaf8fb860
00b84 0f1f84007c0c0006               nop        dword ptr [rax + rax + 0x6000c7c]
00b8c 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00b94 e9dff9ffff                     jmp        0x7f4eafe6c578
00b99 83f830                         cmp        eax, 0x30
00b9c 0f8ea9000000                   jle        0x7f4eafe6cc4b
00ba2 4585d2                         test       r10d, r10d
00ba5 0f8c911d0000                   jl         0x7f4eafe6e93c
00bab 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00bb3 4585db                         test       r11d, r11d
00bb6 0f8c881d0000                   jl         0x7f4eafe6e944
00bbc 448b8c24e0000000               mov        r9d, dword ptr [rsp + 0xe0]
00bc4 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
00bcc 0f82721d0000                   jb         0x7f4eafe6e944
00bd2 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
00bda 453bc5                         cmp        r8d, r13d
00bdd 0f82611d0000                   jb         0x7f4eafe6e944
00be3 85c0                           test       eax, eax
00be5 743d                           je         0x7f4eafe6cc24
00be7 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00bec 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
00bf1 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00bf6 4b8d741808                     lea        rsi, [r8 + r11 + 8]
00bfb 4883fa20                       cmp        rdx, 0x20
00bff 7730                           ja         0x7f4eafe6cc31
00c01 448bd0                         mov        r10d, eax
00c04 4d63d2                         movsxd     r10, r10d
00c07 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c0e c442a8f5db                     bzhi       r11, r11, r10
00c13 c4c1fb92fb                     kmovq      k7, r11
00c18 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c1e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c24 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00c2c e9fafaffff                     jmp        0x7f4eafe6c72b
00c31 c5f877                         vzeroupper 
00c34 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
00c3e 41ffd2                         call       r10
00c41 0f1f840000000000               nop        dword ptr [rax + rax]
00c49 ebd9                           jmp        0x7f4eafe6cc24
00c4b 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00c50 0f83721b0000                   jae        0x7f4eafe6e7c8
00c56 4963fa                         movsxd     rdi, r10d
00c59 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00c5e c4c17a6f443b08                 vmovdqu    xmm0, xmmword ptr [r11 + rdi + 8]
00c65 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00c6d 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
00c72 0f83041c0000                   jae        0x7f4eafe6e87c
00c78 458d4110                       lea        r8d, [r9 + 0x10]
00c7c 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00c84 4d63c1                         movsxd     r8, r9d
00c87 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00c8c c4817a7f440308                 vmovdqu    xmmword ptr [r11 + r8 + 8], xmm0
00c93 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00c9b 453bdd                         cmp        r11d, r13d
00c9e 0f8dc0020000                   jge        0x7f4eafe6cf64
00ca4 492bf8                         sub        rdi, r8
00ca7 4d63c3                         movsxd     r8, r11d
00caa 48639424ec000000               movsxd     rdx, dword ptr [rsp + 0xec]
00cb2 4883c2f1                       add        rdx, -0xf
00cb6 498d0c38                       lea        rcx, [r8 + rdi]
00cba 483bca                         cmp        rcx, rdx
00cbd 0f833d1d0000                   jae        0x7f4eafe6ea00
00cc3 4963dd                         movsxd     rbx, r13d
00cc6 488bcb                         mov        rcx, rbx
00cc9 492bc8                         sub        rcx, r8
00ccc 4883c10f                       add        rcx, 0xf
00cd0 4883e1f0                       and        rcx, 0xfffffffffffffff0
00cd4 448bc1                         mov        r8d, ecx
00cd7 438d4c0810                     lea        ecx, [r8 + r9 + 0x10]
00cdc 4c63c1                         movsxd     r8, ecx
00cdf 498d4c38f0                     lea        rcx, [r8 + rdi - 0x10]
00ce4 483bca                         cmp        rcx, rdx
00ce7 0f83131d0000                   jae        0x7f4eafe6ea00
00ced 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00cf2 0f83081d0000                   jae        0x7f4eafe6ea00
00cf8 4983c0f0                       add        r8, -0x10
00cfc 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d04 4983c3f1                       add        r11, -0xf
00d08 4d3bc3                         cmp        r8, r11
00d0b 0f83ef1c0000                   jae        0x7f4eafe6ea00
00d11 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00d18 0f8f721d0000                   jg         0x7f4eafe6ea90
00d1e 418bca                         mov        ecx, r10d
00d21 412bc9                         sub        ecx, r9d
00d24 4183c120                       add        r9d, 0x20
00d28 448bd9                         mov        r11d, ecx
00d2b 44039c2498000000               add        r11d, dword ptr [rsp + 0x98]
00d33 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00d38 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00d3f 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d47 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00d4c c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00d53 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00d5b 4183c310                       add        r11d, 0x10
00d5f 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d67 458bc3                         mov        r8d, r11d
00d6a 453bd9                         cmp        r11d, r9d
00d6d 7cb9                           jl         0x7f4eafe6cd28
00d6f 4881c310ffffff                 add        rbx, -0xf0
00d76 4881fb00000080                 cmp        rbx, -0x80000000
00d7d 49c7c300000080                 mov        r11, 0xffffffff80000000
00d84 490f4cdb                       cmovl      rbx, r11
00d88 8bdb                           mov        ebx, ebx
00d8a 443bc3                         cmp        r8d, ebx
00d8d 0f8d93010000                   jge        0x7f4eafe6cf26
00d93 458bd8                         mov        r11d, r8d
00d96 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00d9e 6690                           nop        
00da0 448bc1                         mov        r8d, ecx
00da3 4403842498000000               add        r8d, dword ptr [rsp + 0x98]
00dab 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
00db3 4963f9                         movsxd     rdi, r9d
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
00f20 0f8c7afeffff                   jl         0x7f4eafe6cda0
00f26 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00f2e 453bdd                         cmp        r11d, r13d
00f31 7d31                           jge        0x7f4eafe6cf64
00f33 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
00f3b 90                             nop        
00f3c 468d1c09                       lea        r11d, [rcx + r9]
00f40 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00f45 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
00f4c 458bd9                         mov        r11d, r9d
00f4f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00f54 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00f5b 4183c110                       add        r9d, 0x10
00f5f 453bcd                         cmp        r9d, r13d
00f62 7cd8                           jl         0x7f4eafe6cf3c
00f64 468d1c10                       lea        r11d, [rax + r10]
00f68 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00f70 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00f78 e9aef7ffff                     jmp        0x7f4eafe6c72b
00f7d 4d63d0                         movsxd     r10, r8d
00f80 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f87 c442a8f5db                     bzhi       r11, r11, r10
00f8c c4c1fb92fb                     kmovq      k7, r11
00f91 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f97 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f9d e994000000                     jmp        0x7f4eafe6d036
00fa2 448b1c24                       mov        r11d, dword ptr [rsp]
00fa6 458bc3                         mov        r8d, r11d
00fa9 442b842498000000               sub        r8d, dword ptr [rsp + 0x98]
00fb1 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00fb9 4585d2                         test       r10d, r10d
00fbc 0f8cc2170000                   jl         0x7f4eafe6e784
00fc2 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
00fc7 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00fce 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00fd2 458bd9                         mov        r11d, r9d
00fd5 4585c9                         test       r9d, r9d
00fd8 0f8cb2170000                   jl         0x7f4eafe6e790
00fde 3b3424                         cmp        esi, dword ptr [rsp]
00fe1 0f82a9170000                   jb         0x7f4eafe6e790
00fe7 8b4b04                         mov        ecx, dword ptr [rbx + 4]
00fea 438d2c01                       lea        ebp, [r9 + r8]
00fee 3bcd                           cmp        ecx, ebp
00ff0 0f829a170000                   jb         0x7f4eafe6e790
00ff6 4585c0                         test       r8d, r8d
00ff9 0f8c91170000                   jl         0x7f4eafe6e790
00fff 4585c0                         test       r8d, r8d
01002 7432                           je         0x7f4eafe6d036
01004 4b8d7c1608                     lea        rdi, [r14 + r10 + 8]
01009 4c8bd3                         mov        r10, rbx
0100c 4a8d740b08                     lea        rsi, [rbx + r9 + 8]
01011 4963d0                         movsxd     rdx, r8d
01014 4883fa20                       cmp        rdx, 0x20
01018 0f865fffffff                   jbe        0x7f4eafe6cf7d
0101e c5f877                         vzeroupper 
01021 49ba204f8eaf4e7f0000           movabs     r10, 0x7f4eaf8e4f20
0102b 41ffd2                         call       r10
0102e 0f1f840000000000               nop        dword ptr [rax + rax]
01036 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0103b 41896a38                       mov        dword ptr [r10 + 0x38], ebp
0103f c5f877                         vzeroupper 
01042 4881c4d0000000                 add        rsp, 0xd0
01049 5d                             pop        rbp
0104a 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0104e 0f87981d0000                   ja         0x7f4eafe6edec
01054 c3                             ret        
01055 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
0105a 0f83c01a0000                   jae        0x7f4eafe6eb20
01060 458bd6                         mov        r10d, r14d
01063 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0106b 4d63ca                         movsxd     r9, r10d
0106e 4f8b540808                     mov        r10, qword ptr [r8 + r9 + 8]
01073 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
0107b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
01083 443b542474                     cmp        r10d, dword ptr [rsp + 0x74]
01088 0f83461b0000                   jae        0x7f4eafe6ebd4
0108e 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
01095 448d5b08                       lea        r11d, [rbx + 8]
01099 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
010a1 4c63d3                         movsxd     r10, ebx
010a4 458bd8                         mov        r11d, r8d
010a7 4c8b8424a8000000               mov        r8, qword ptr [rsp + 0xa8]
010af 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
010b4 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
010bc 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
010c4 0f8d89030000                   jge        0x7f4eafe6d453
010ca 4d2bca                         sub        r9, r10
010cd 4963f8                         movsxd     rdi, r8d
010d0 4e8d140f                       lea        r10, [rdi + r9]
010d4 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
010dc 0f837a1b0000                   jae        0x7f4eafe6ec5c
010e2 4c8bd1                         mov        r10, rcx
010e5 4c2bd7                         sub        r10, rdi
010e8 4983c207                       add        r10, 7
010ec 4983e2f8                       and        r10, 0xfffffffffffffff8
010f0 458bda                         mov        r11d, r10d
010f3 458d5c1b08                     lea        r11d, [r11 + rbx + 8]
010f8 4d63d3                         movsxd     r10, r11d
010fb 4f8d5c0af8                     lea        r11, [r10 + r9 - 8]
01100 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
01108 0f834e1b0000                   jae        0x7f4eafe6ec5c
0110e 443b442474                     cmp        r8d, dword ptr [rsp + 0x74]
01113 0f83431b0000                   jae        0x7f4eafe6ec5c
01119 4983c2f8                       add        r10, -8
0111d 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
01125 0f83311b0000                   jae        0x7f4eafe6ec5c
0112b 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01133 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
0113a 0f8fb81b0000                   jg         0x7f4eafe6ecf8
01140 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01148 442bd3                         sub        r10d, ebx
0114b 458bca                         mov        r9d, r10d
0114e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01153 458bd3                         mov        r10d, r11d
01156 41b8f8ffffff                   mov        r8d, 0xfffffff8
0115c 452bc2                         sub        r8d, r10d
0115f 442bc3                         sub        r8d, ebx
01162 83c310                         add        ebx, 0x10
01165 4183c0f0                       add        r8d, -0x10
01169 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0116e 498bc2                         mov        rax, r10
01171 4c8d51c8                       lea        r10, [rcx - 0x38]
01175 4981fa00000080                 cmp        r10, -0x80000000
0117c 49c7c300000080                 mov        r11, 0xffffffff80000000
01183 4d0f4cd3                       cmovl      r10, r11
01187 418bd2                         mov        edx, r10d
0118a 442bb4249c000000               sub        r14d, dword ptr [rsp + 0x9c]
01192 4c63d3                         movsxd     r10, ebx
01195 be06000000                     mov        esi, 6
0119a c442c8f5d8                     bzhi       r11, r8, rsi
0119f 4d03d3                         add        r10, r11
011a2 4c3bd1                         cmp        r10, rcx
011a5 4c8bd9                         mov        r11, rcx
011a8 4d0f4cda                       cmovl      r11, r10
011ac 4d8bd3                         mov        r10, r11
011af 4c2bd7                         sub        r10, rdi
011b2 4d8d42ff                       lea        r8, [r10 - 1]
011b6 49c1f83f                       sar        r8, 0x3f
011ba 49c1e83d                       shr        r8, 0x3d
011be 4f8d5410ff                     lea        r10, [r8 + r10 - 1]
011c3 4983e2f8                       and        r10, 0xfffffffffffffff8
011c7 4c03d7                         add        r10, rdi
011ca 493bfa                         cmp        rdi, r10
011cd 490f4cfa                       cmovl      rdi, r10
011d1 8bff                           mov        edi, edi
011d3 458d443e08                     lea        r8d, [r14 + rdi + 8]
011d8 83c708                         add        edi, 8
011db 4963f0                         movsxd     rsi, r8d
011de 4803f0                         add        rsi, rax
011e1 4863ff                         movsxd     rdi, edi
011e4 4803f8                         add        rdi, rax
011e7 4c8d4608                       lea        r8, [rsi + 8]
011eb 4883c648                       add        rsi, 0x48
011ef 488d4748                       lea        rax, [rdi + 0x48]
011f3 4533d2                         xor        r10d, r10d
011f6 493bc0                         cmp        rax, r8
011f9 410f96c2                       setbe      r10b
011fd 4883c708                       add        rdi, 8
01201 4533c0                         xor        r8d, r8d
01204 483bf7                         cmp        rsi, rdi
01207 410f96c0                       setbe      r8b
0120b 450bd0                         or         r10d, r8d
0120e 0f84140c0000                   je         0x7f4eafe6de28
01214 418bfb                         mov        edi, r11d
01217 90                             nop        
01218 458bd1                         mov        r10d, r9d
0121b 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
01223 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01228 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
0122d 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01235 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01239 4e89541b08                     mov        qword ptr [rbx + r11 + 8], r10
0123e 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01246 4183c208                       add        r10d, 8
0124a 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01252 458bda                         mov        r11d, r10d
01255 443bd7                         cmp        r10d, edi
01258 7cbe                           jl         0x7f4eafe6d218
0125a 4881c108feffff                 add        rcx, -0x1f8
01261 4881f900000080                 cmp        rcx, -0x80000000
01268 49c7c200000080                 mov        r10, 0xffffffff80000000
0126f 490f4cca                       cmovl      rcx, r10
01273 8bc9                           mov        ecx, ecx
01275 443bd9                         cmp        r11d, ecx
01278 0f8d95010000                   jge        0x7f4eafe6d413
0127e 458bd3                         mov        r10d, r11d
01281 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01289 0f1f8000000000                 nop        dword ptr [rax]
01290 458bd1                         mov        r10d, r9d
01293 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
0129b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
012a3 4963fb                         movsxd     rdi, r11d
012a6 458bc2                         mov        r8d, r10d
012a9 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
012ad 62b17e486f840308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r8 + 8]
012b8 4963c2                         movsxd     rax, r10d
012bb 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
012c3 4183c240                       add        r10d, 0x40
012c7 4503d1                         add        r10d, r9d
012ca 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
012d2 4181c380000000                 add        r11d, 0x80
012d9 4503d9                         add        r11d, r9d
012dc 8bb42494000000                 mov        esi, dword ptr [rsp + 0x94]
012e3 81c600010000                   add        esi, 0x100
012e9 4103f1                         add        esi, r9d
012ec 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
012f4 62b17e487f840308000000         vmovdqu32  zmmword ptr [rbx + r8 + 8], zmm0
012ff 62b17e486f841308000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 8]
0130a 62f17e487f843b48000000         vmovdqu32  zmmword ptr [rbx + rdi + 0x48], zmm0
01315 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
01320 62f17e487f843b88000000         vmovdqu32  zmmword ptr [rbx + rdi + 0x88], zmm0
0132b 62f17e486f8403c8000000         vmovdqu32  zmm0, zmmword ptr [rbx + rax + 0xc8]
01336 62f17e487f843bc8000000         vmovdqu32  zmmword ptr [rbx + rdi + 0xc8], zmm0
01341 448bde                         mov        r11d, esi
01344 62b17e486f841b08000000         vmovdqu32  zmm0, zmmword ptr [rbx + r11 + 8]
0134f 62f17e487f843b08010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x108], zmm0
0135a 62f17e486f840348010000         vmovdqu32  zmm0, zmmword ptr [rbx + rax + 0x148]
01365 62f17e487f843b48010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x148], zmm0
01370 62f17e486f840388010000         vmovdqu32  zmm0, zmmword ptr [rbx + rax + 0x188]
0137b 62f17e487f843b88010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x188], zmm0
01386 4c63d6                         movsxd     r10, esi
01389 62b17e486f8413c8000000         vmovdqu32  zmm0, zmmword ptr [rbx + r10 + 0xc8]
01394 62f17e487f843bc8010000         vmovdqu32  zmmword ptr [rbx + rdi + 0x1c8], zmm0
0139f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
013a7 4181c200020000                 add        r10d, 0x200
013ae 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
013b6 443bd1                         cmp        r10d, ecx
013b9 0f8cd1feffff                   jl         0x7f4eafe6d290
013bf 443bd2                         cmp        r10d, edx
013c2 7d4f                           jge        0x7f4eafe6d413
013c4 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
013cc 458bd9                         mov        r11d, r9d
013cf 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
013d7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
013dc 62917e486f841808000000         vmovdqu32  zmm0, zmmword ptr [r8 + r11 + 8]
013e7 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
013ef 62917e487f841808000000         vmovdqu32  zmmword ptr [r8 + r11 + 8], zmm0
013fa 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01402 4183c340                       add        r11d, 0x40
01406 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0140e 443bda                         cmp        r11d, edx
01411 7cb9                           jl         0x7f4eafe6d3cc
01413 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0141b 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
01423 7d2e                           jge        0x7f4eafe6d453
01425 8b8c2494000000                 mov        ecx, dword ptr [rsp + 0x94]
0142c 458d1c09                       lea        r11d, [r9 + rcx]
01430 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01435 4f8b541808                     mov        r10, qword ptr [r8 + r11 + 8]
0143a 448bc1                         mov        r8d, ecx
0143d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01442 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01447 83c108                         add        ecx, 8
0144a 3b8c24a0000000                 cmp        ecx, dword ptr [rsp + 0xa0]
01451 7cd9                           jl         0x7f4eafe6d42c
01453 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
0145b e918f1ffff                     jmp        0x7f4eafe6c578
01460 4c03c9                         add        r9, rcx
01463 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
01468 7e08                           jle        0x7f4eafe6d472
0146a 4533c0                         xor        r8d, r8d
0146d e941ecffff                     jmp        0x7f4eafe6c0b3
01472 4533c0                         xor        r8d, r8d
01475 ba01000000                     mov        edx, 1
0147a e936ecffff                     jmp        0x7f4eafe6c0b5
0147f bee4ffffff                     mov        esi, 0xffffffe4
01484 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01489 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
0148e 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01496 448b1c24                       mov        r11d, dword ptr [rsp]
0149a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
014a2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
014a7 4c891c24                       mov        qword ptr [rsp], r11
014ab 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
014b0 4c895c2408                     mov        qword ptr [rsp + 8], r11
014b5 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
014ba 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
014c2 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
014c7 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
014cc 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
014d1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
014d6 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014db 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
014e0 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014e5 4489442430                     mov        dword ptr [rsp + 0x30], r8d
014ea 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
014ef 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
014f4 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
014f9 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
014fe 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01503 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01508 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0150d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01512 89442450                       mov        dword ptr [rsp + 0x50], eax
01516 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0151b 90                             nop        
0151c c5f877                         vzeroupper 
0151f e83c61b5ff                     call       0x7f4eaf9c3660
01524 0f1f84001c160007               nop        dword ptr [rax + rax + 0x700161c]
0152c bee4ffffff                     mov        esi, 0xffffffe4
01531 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01536 448b0c24                       mov        r9d, dword ptr [rsp]
0153a 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
01542 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01547 4c890424                       mov        qword ptr [rsp], r8
0154b 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01550 4c89442408                     mov        qword ptr [rsp + 8], r8
01555 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0155a 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01562 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
01567 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0156c 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01571 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01576 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0157b 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01580 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01585 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0158a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0158f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01594 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01599 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0159e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
015a3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015a8 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
015ad 4489442434                     mov        dword ptr [rsp + 0x34], r8d
015b2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
015b7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
015bc 89442450                       mov        dword ptr [rsp + 0x50], eax
015c0 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
015c5 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
015ca 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
015cf c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
015d5 666690                         nop        
015d8 c5f877                         vzeroupper 
015db e88060b5ff                     call       0x7f4eaf9c3660
015e0 0f1f8400d8160008               nop        dword ptr [rax + rax + 0x80016d8]
015e8 bee4ffffff                     mov        esi, 0xffffffe4
015ed 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015f2 448b1c24                       mov        r11d, dword ptr [rsp]
015f6 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
015fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01603 4c891424                       mov        qword ptr [rsp], r10
01607 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0160c 4c89542408                     mov        qword ptr [rsp + 8], r10
01611 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01616 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0161e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01623 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01628 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0162d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01632 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01637 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0163c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01641 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01646 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0164b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01650 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01655 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0165a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0165f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01664 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01669 666690                         nop        
0166c c5f877                         vzeroupper 
0166f e8ec5fb5ff                     call       0x7f4eaf9c3660
01674 0f1f84006c170009               nop        dword ptr [rax + rax + 0x900176c]
0167c be45ffffff                     mov        esi, 0xffffff45
01681 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01686 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
0168e 6690                           nop        
01690 c5f877                         vzeroupper 
01693 e8c85fb5ff                     call       0x7f4eaf9c3660
01698 0f1f84009017000a               nop        dword ptr [rax + rax + 0xa001790]
016a0 be45ffffff                     mov        esi, 0xffffff45
016a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016aa 448b0424                       mov        r8d, dword ptr [rsp]
016ae 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
016b6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
016bb 4c891c24                       mov        qword ptr [rsp], r11
016bf 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
016c4 4c895c2408                     mov        qword ptr [rsp + 8], r11
016c9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
016ce 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
016d6 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
016db 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
016e0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016e5 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
016ea 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016ef 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016f4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
016f9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
016fe 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01703 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01708 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0170d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01712 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01717 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0171c 89442450                       mov        dword ptr [rsp + 0x50], eax
01720 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01724 c5f877                         vzeroupper 
01727 e8345fb5ff                     call       0x7f4eaf9c3660
0172c 0f1f84002418000b               nop        dword ptr [rax + rax + 0xb001824]
01734 493bd8                         cmp        rbx, r8
01737 bdffffffff                     mov        ebp, 0xffffffff
0173c 7c08                           jl         0x7f4eafe6d746
0173e 400f95c5                       setne      bpl
01742 400fb6ed                       movzx      ebp, bpl
01746 be45ffffff                     mov        esi, 0xffffff45
0174b 48ff742408                     push       qword ptr [rsp + 8]
01750 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01758 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
0175d 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01765 48ff742420                     push       qword ptr [rsp + 0x20]
0176a 488f442408                     pop        qword ptr [rsp + 8]
0176f 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01774 44894c2404                     mov        dword ptr [rsp + 4], r9d
01779 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0177e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01783 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01788 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0178d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01792 89442458                       mov        dword ptr [rsp + 0x58], eax
01796 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0179b 90                             nop        
0179c c5f877                         vzeroupper 
0179f e8bc5eb5ff                     call       0x7f4eaf9c3660
017a4 0f1f84009c18000c               nop        dword ptr [rax + rax + 0xc00189c]
017ac be45ffffff                     mov        esi, 0xffffff45
017b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017b6 448b1c24                       mov        r11d, dword ptr [rsp]
017ba 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
017c2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017c7 4c891c24                       mov        qword ptr [rsp], r11
017cb 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
017d0 4c895c2408                     mov        qword ptr [rsp + 8], r11
017d5 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
017da 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
017e2 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
017e7 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
017ec 4489542420                     mov        dword ptr [rsp + 0x20], r10d
017f1 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
017f6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017fb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01800 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01805 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0180a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0180f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01814 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01819 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0181e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01823 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01828 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0182d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01832 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01837 89442450                       mov        dword ptr [rsp + 0x50], eax
0183b 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01840 c5f877                         vzeroupper 
01843 e8185eb5ff                     call       0x7f4eaf9c3660
01848 0f1f84004019000d               nop        dword ptr [rax + rax + 0xd001940]
01850 be45ffffff                     mov        esi, 0xffffff45
01855 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0185a 448b0424                       mov        r8d, dword ptr [rsp]
0185e 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01866 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0186b 4c891c24                       mov        qword ptr [rsp], r11
0186f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01874 4c895c2408                     mov        qword ptr [rsp + 8], r11
01879 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0187e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01886 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0188b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01890 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01895 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0189a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0189f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018a4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018a9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018ae 4489542430                     mov        dword ptr [rsp + 0x30], r10d
018b3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018b8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018bd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
018c2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018c7 89442450                       mov        dword ptr [rsp + 0x50], eax
018cb 90                             nop        
018cc c5f877                         vzeroupper 
018cf e88c5db5ff                     call       0x7f4eaf9c3660
018d4 0f1f8400cc19000e               nop        dword ptr [rax + rax + 0xe0019cc]
018dc bee4ffffff                     mov        esi, 0xffffffe4
018e1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018e6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018eb 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
018f3 448b1424                       mov        r10d, dword ptr [rsp]
018f7 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
018ff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01904 4c891424                       mov        qword ptr [rsp], r10
01908 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0190d 4c89542408                     mov        qword ptr [rsp + 8], r10
01912 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01917 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0191f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01924 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01929 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0192e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01933 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01938 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0193d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01942 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01947 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0194c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01951 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01956 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0195b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01960 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01965 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0196a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0196f 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01974 4489442468                     mov        dword ptr [rsp + 0x68], r8d
01979 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
0197e 6690                           nop        
01980 c5f877                         vzeroupper 
01983 e8d85cb5ff                     call       0x7f4eaf9c3660
01988 0f1f8400801a000f               nop        dword ptr [rax + rax + 0xf001a80]
01990 bee4ffffff                     mov        esi, 0xffffffe4
01995 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0199a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0199f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
019a7 448b1c24                       mov        r11d, dword ptr [rsp]
019ab 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
019b3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019b8 4c891424                       mov        qword ptr [rsp], r10
019bc 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019c1 4c89542408                     mov        qword ptr [rsp + 8], r10
019c6 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
019cb 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
019d3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019d8 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019dd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019e2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019e7 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
019ec 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019f1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
019f6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
019fb 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a00 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01a05 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a0a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a0f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a14 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a19 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a1e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a23 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a28 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a2d 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01a32 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01a37 90                             nop        
01a38 c5f877                         vzeroupper 
01a3b e8205cb5ff                     call       0x7f4eaf9c3660
01a40 0f1f8400381b0010               nop        dword ptr [rax + rax + 0x10001b38]
01a48 4183c608                       add        r14d, 8
01a4c be6effffff                     mov        esi, 0xffffff6e
01a51 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a56 448b0424                       mov        r8d, dword ptr [rsp]
01a5a 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01a62 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01a67 4c891c24                       mov        qword ptr [rsp], r11
01a6b 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a70 4c895c2408                     mov        qword ptr [rsp + 8], r11
01a75 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01a7a 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01a82 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01a87 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01a8c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01a91 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a96 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a9b 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01aa0 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01aa5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01aaa 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01aaf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ab4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ab9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01abe 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ac3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01ac8 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01acd 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01ad2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ad7 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01adf 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01ae4 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01ae9 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01aee 6690                           nop        
01af0 c5f877                         vzeroupper 
01af3 e8685bb5ff                     call       0x7f4eaf9c3660
01af8 0f1f8400f01b0011               nop        dword ptr [rax + rax + 0x11001bf0]
01b00 4183c608                       add        r14d, 8
01b04 be66ffffff                     mov        esi, 0xffffff66
01b09 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b0e 448b1c24                       mov        r11d, dword ptr [rsp]
01b12 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b1a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01b1f 4c891c24                       mov        qword ptr [rsp], r11
01b23 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b28 4c895c2408                     mov        qword ptr [rsp + 8], r11
01b2d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b32 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01b3a 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01b3f 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01b44 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01b49 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b4e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b53 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b58 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b5d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b62 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b67 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b6c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b71 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b76 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b7b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01b80 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01b85 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b8a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01b8f 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01b97 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01b9c 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01ba1 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01ba6 6690                           nop        
01ba8 c5f877                         vzeroupper 
01bab e8b05ab5ff                     call       0x7f4eaf9c3660
01bb0 0f1f8400a81c0012               nop        dword ptr [rax + rax + 0x12001ca8]
01bb8 beccffffff                     mov        esi, 0xffffffcc
01bbd 48ff742408                     push       qword ptr [rsp + 8]
01bc2 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01bca 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01bcf 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01bd7 48ff742420                     push       qword ptr [rsp + 0x20]
01bdc 488f442408                     pop        qword ptr [rsp + 8]
01be1 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01be6 4489542404                     mov        dword ptr [rsp + 4], r10d
01beb 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01bf0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bf5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01bfa 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bff 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c04 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01c09 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c0e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01c13 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c18 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c1d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c22 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c27 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c2c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c31 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c36 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01c3b 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c40 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c44 c5f877                         vzeroupper 
01c47 e8145ab5ff                     call       0x7f4eaf9c3660
01c4c 0f1f8400441d0013               nop        dword ptr [rax + rax + 0x13001d44]
01c54 beccffffff                     mov        esi, 0xffffffcc
01c59 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01c5e 448b1c24                       mov        r11d, dword ptr [rsp]
01c62 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01c6a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c6f 4c891424                       mov        qword ptr [rsp], r10
01c73 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c78 4c89542408                     mov        qword ptr [rsp + 8], r10
01c7d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c82 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01c8a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c8f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c94 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c99 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01c9e 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01ca3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ca8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cad 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cb2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01cb7 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cbc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01cc1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01cc6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ccb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cd0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01cd5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01cda 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01cdf 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01ce4 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01cec 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01cf1 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01cf6 6690                           nop        
01cf8 c5f877                         vzeroupper 
01cfb e86059b5ff                     call       0x7f4eaf9c3660
01d00 0f1f8400f81d0014               nop        dword ptr [rax + rax + 0x14001df8]
01d08 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
01d0d 4d3bd9                         cmp        r11, r9
01d10 bdffffffff                     mov        ebp, 0xffffffff
01d15 7c08                           jl         0x7f4eafe6dd1f
01d17 400f95c5                       setne      bpl
01d1b 400fb6ed                       movzx      ebp, bpl
01d1f be45ffffff                     mov        esi, 0xffffff45
01d24 48ff742408                     push       qword ptr [rsp + 8]
01d29 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01d31 48ff742420                     push       qword ptr [rsp + 0x20]
01d36 488f442408                     pop        qword ptr [rsp + 8]
01d3b 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01d40 44894c2404                     mov        dword ptr [rsp + 4], r9d
01d45 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01d4a 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d4f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01d54 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d59 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d5e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d63 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d68 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01d6d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d72 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d77 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01d7c 89442454                       mov        dword ptr [rsp + 0x54], eax
01d80 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01d85 666690                         nop        
01d88 c5f877                         vzeroupper 
01d8b e8d058b5ff                     call       0x7f4eaf9c3660
01d90 0f1f8400881e0015               nop        dword ptr [rax + rax + 0x15001e88]
01d98 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01d9d 493bdb                         cmp        rbx, r11
01da0 bdffffffff                     mov        ebp, 0xffffffff
01da5 7c08                           jl         0x7f4eafe6ddaf
01da7 400f95c5                       setne      bpl
01dab 400fb6ed                       movzx      ebp, bpl
01daf be45ffffff                     mov        esi, 0xffffff45
01db4 48ff742408                     push       qword ptr [rsp + 8]
01db9 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01dc1 48ff742420                     push       qword ptr [rsp + 0x20]
01dc6 488f442408                     pop        qword ptr [rsp + 8]
01dcb 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01dd0 44894c2404                     mov        dword ptr [rsp + 4], r9d
01dd5 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01dda 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ddf 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01de4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01de9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01dee 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01df3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01df8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01dfd 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e02 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01e07 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01e0c 89442454                       mov        dword ptr [rsp + 0x54], eax
01e10 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01e15 666690                         nop        
01e18 c5f877                         vzeroupper 
01e1b e84058b5ff                     call       0x7f4eaf9c3660
01e20 0f1f8400181f0016               nop        dword ptr [rax + rax + 0x16001f18]
01e28 458bd1                         mov        r10d, r9d
01e2b 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
01e33 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01e38 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01e3d 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01e45 4f89541808                     mov        qword ptr [r8 + r11 + 8], r10
01e4a 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01e52 4183c308                       add        r11d, 8
01e56 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01e5e 443bdb                         cmp        r11d, ebx
01e61 7cc5                           jl         0x7f4eafe6de28
01e63 443bda                         cmp        r11d, edx
01e66 0f8db0000000                   jge        0x7f4eafe6df1c
01e6c 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01e74 660f1f440000                   nop        word ptr [rax + rax]
01e7a 660f1f440000                   nop        word ptr [rax + rax]
01e80 458bd1                         mov        r10d, r9d
01e83 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
01e8b 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01e93 4963cb                         movsxd     rcx, r11d
01e96 458bc2                         mov        r8d, r10d
01e99 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e9e 4f8b5c0308                     mov        r11, qword ptr [r11 + r8 + 8]
01ea3 4d63c2                         movsxd     r8, r10d
01ea6 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01eae 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
01eb2 4e895c1708                     mov        qword ptr [rdi + r10 + 8], r11
01eb7 4e8b540710                     mov        r10, qword ptr [rdi + r8 + 0x10]
01ebc 8bdf                           mov        ebx, edi
01ebe 4c89540b10                     mov        qword ptr [rbx + rcx + 0x10], r10
01ec3 4e8b540318                     mov        r10, qword ptr [rbx + r8 + 0x18]
01ec8 4c89540b18                     mov        qword ptr [rbx + rcx + 0x18], r10
01ecd 4e8b540320                     mov        r10, qword ptr [rbx + r8 + 0x20]
01ed2 4c89540b20                     mov        qword ptr [rbx + rcx + 0x20], r10
01ed7 4e8b540328                     mov        r10, qword ptr [rbx + r8 + 0x28]
01edc 4c89540b28                     mov        qword ptr [rbx + rcx + 0x28], r10
01ee1 4e8b540330                     mov        r10, qword ptr [rbx + r8 + 0x30]
01ee6 4c89540b30                     mov        qword ptr [rbx + rcx + 0x30], r10
01eeb 4e8b540338                     mov        r10, qword ptr [rbx + r8 + 0x38]
01ef0 4c89540b38                     mov        qword ptr [rbx + rcx + 0x38], r10
01ef5 4e8b540340                     mov        r10, qword ptr [rbx + r8 + 0x40]
01efa 4c89540b40                     mov        qword ptr [rbx + rcx + 0x40], r10
01eff 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01f07 4183c240                       add        r10d, 0x40
01f0b 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01f13 443bd2                         cmp        r10d, edx
01f16 0f8c64ffffff                   jl         0x7f4eafe6de80
01f1c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01f24 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
01f2c 0f8d21f5ffff                   jge        0x7f4eafe6d453
01f32 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01f3a 6690                           nop        
01f3c 478d1419                       lea        r10d, [r9 + r11]
01f40 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01f45 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01f4a 458bc3                         mov        r8d, r11d
01f4d 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01f51 4e89540308                     mov        qword ptr [rbx + r8 + 8], r10
01f56 458d5308                       lea        r10d, [r11 + 8]
01f5a 458bda                         mov        r11d, r10d
01f5d 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
01f65 7cd5                           jl         0x7f4eafe6df3c
01f67 e9e7f4ffff                     jmp        0x7f4eafe6d453
01f6c bee4ffffff                     mov        esi, 0xffffffe4
01f71 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f76 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01f7b 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01f83 448b0424                       mov        r8d, dword ptr [rsp]
01f87 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01f8f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01f94 4c891c24                       mov        qword ptr [rsp], r11
01f98 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01f9d 4c895c2408                     mov        qword ptr [rsp + 8], r11
01fa2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01fa7 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01faf 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01fb4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01fb9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fbe 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01fc3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fc8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fcd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fd2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fd7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01fdc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fe1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fe6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01feb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ff0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01ff5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ffa 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01fff 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02004 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02009 89442450                       mov        dword ptr [rsp + 0x50], eax
0200d 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02011 666690                         nop        
02014 c5f877                         vzeroupper 
02017 e84456b5ff                     call       0x7f4eaf9c3660
0201c 0f1f840014210017               nop        dword ptr [rax + rax + 0x17002114]
02024 85db                           test       ebx, ebx
02026 0f84680d0000                   je         0x7f4eafe6ed94
0202c 448b1c24                       mov        r11d, dword ptr [rsp]
02030 458bca                         mov        r9d, r10d
02033 4533d2                         xor        r10d, r10d
02036 458bc3                         mov        r8d, r11d
02039 e994efffff                     jmp        0x7f4eafe6cfd2
0203e be6effffff                     mov        esi, 0xffffff6e
02043 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02048 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
0204d 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02055 448b0424                       mov        r8d, dword ptr [rsp]
02059 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
02061 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02066 4c891c24                       mov        qword ptr [rsp], r11
0206a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0206f 4c895c2408                     mov        qword ptr [rsp + 8], r11
02074 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02079 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02081 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02086 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0208b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02090 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02095 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0209a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0209f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
020a4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020a9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020ae 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
020b3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020b8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
020bd 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020c2 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020c7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
020cc 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
020d1 89442450                       mov        dword ptr [rsp + 0x50], eax
020d5 894c2460                       mov        dword ptr [rsp + 0x60], ecx
020d9 895c2468                       mov        dword ptr [rsp + 0x68], ebx
020dd 666690                         nop        
020e0 c5f877                         vzeroupper 
020e3 e87855b5ff                     call       0x7f4eaf9c3660
020e8 0f1f8400e0210018               nop        dword ptr [rax + rax + 0x180021e0]
020f0 be45ffffff                     mov        esi, 0xffffff45
020f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020fa 448b0424                       mov        r8d, dword ptr [rsp]
020fe 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
02106 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0210b 4c891c24                       mov        qword ptr [rsp], r11
0210f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02114 4c895c2408                     mov        qword ptr [rsp + 8], r11
02119 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0211e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02126 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0212b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02130 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02135 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0213a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0213f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02144 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02149 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0214e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02153 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02158 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0215d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02162 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02167 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0216c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02171 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02176 89442450                       mov        dword ptr [rsp + 0x50], eax
0217a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0217e 6690                           nop        
02180 c5f877                         vzeroupper 
02183 e8d854b5ff                     call       0x7f4eaf9c3660
02188 0f1f840080220019               nop        dword ptr [rax + rax + 0x19002280]
02190 be3dffffff                     mov        esi, 0xffffff3d
02195 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0219a 448b0424                       mov        r8d, dword ptr [rsp]
0219e 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
021a6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
021ab 4c891c24                       mov        qword ptr [rsp], r11
021af 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
021b4 4c895c2408                     mov        qword ptr [rsp + 8], r11
021b9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
021be 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
021c6 4489542420                     mov        dword ptr [rsp + 0x20], r10d
021cb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
021d0 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
021d5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
021da 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021df 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
021e4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
021e9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
021ee 4c89542438                     mov        qword ptr [rsp + 0x38], r10
021f3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
021f8 4c89542440                     mov        qword ptr [rsp + 0x40], r10
021fd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02202 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02207 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0220c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02211 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02216 89442450                       mov        dword ptr [rsp + 0x50], eax
0221a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0221e 6690                           nop        
02220 c5f877                         vzeroupper 
02223 e83854b5ff                     call       0x7f4eaf9c3660
02228 0f1f84002023001a               nop        dword ptr [rax + rax + 0x1a002320]
02230 bee4ffffff                     mov        esi, 0xffffffe4
02235 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0223a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0223f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02247 448b1424                       mov        r10d, dword ptr [rsp]
0224b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02253 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02258 4c891424                       mov        qword ptr [rsp], r10
0225c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02261 4c89542408                     mov        qword ptr [rsp + 8], r10
02266 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0226b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02273 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02278 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0227d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02282 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02287 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0228c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02291 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02296 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0229b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022a0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
022a5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
022aa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022af 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
022b4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
022b9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022be 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
022c3 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
022c8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
022cd 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
022d2 6690                           nop        
022d4 c5f877                         vzeroupper 
022d7 e88453b5ff                     call       0x7f4eaf9c3660
022dc 0f1f8400d423001b               nop        dword ptr [rax + rax + 0x1b0023d4]
022e4 bee4ffffff                     mov        esi, 0xffffffe4
022e9 48ff742408                     push       qword ptr [rsp + 8]
022ee 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
022f6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022fb 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02303 48ff742420                     push       qword ptr [rsp + 0x20]
02308 488f442408                     pop        qword ptr [rsp + 8]
0230d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02312 44895c2404                     mov        dword ptr [rsp + 4], r11d
02317 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0231c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02321 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02326 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0232b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02330 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02335 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0233a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0233f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02344 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02349 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0234e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02353 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02358 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0235d 4489442454                     mov        dword ptr [rsp + 0x54], r8d
02362 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02367 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0236c c5f877                         vzeroupper 
0236f e8ec52b5ff                     call       0x7f4eaf9c3660
02374 0f1f84006c24001c               nop        dword ptr [rax + rax + 0x1c00246c]
0237c 418d6e01                       lea        ebp, [r14 + 1]
02380 bee4ffffff                     mov        esi, 0xffffffe4
02385 48ff742408                     push       qword ptr [rsp + 8]
0238a 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02392 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02397 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0239f 48ff742420                     push       qword ptr [rsp + 0x20]
023a4 488f442408                     pop        qword ptr [rsp + 8]
023a9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
023ae 4489542404                     mov        dword ptr [rsp + 4], r10d
023b3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
023b8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023bd 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
023c2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
023c7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023cc 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
023d1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023d6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023db 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
023e0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023e5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
023ea 4489542448                     mov        dword ptr [rsp + 0x48], r10d
023ef 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
023f4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
023f9 4489442454                     mov        dword ptr [rsp + 0x54], r8d
023fe 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02403 4489442468                     mov        dword ptr [rsp + 0x68], r8d
02408 c5f877                         vzeroupper 
0240b e85052b5ff                     call       0x7f4eaf9c3660
02410 0f1f84000825001d               nop        dword ptr [rax + rax + 0x1d002508]
02418 bee4ffffff                     mov        esi, 0xffffffe4
0241d 48ff742408                     push       qword ptr [rsp + 8]
02422 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
0242a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0242f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02437 48ff742420                     push       qword ptr [rsp + 0x20]
0243c 488f442408                     pop        qword ptr [rsp + 8]
02441 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02446 44895c2404                     mov        dword ptr [rsp + 4], r11d
0244b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02450 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02455 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0245a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0245f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02464 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02469 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0246e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02473 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02478 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0247d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02482 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02487 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0248c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02491 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02496 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0249b 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
024a0 c5f877                         vzeroupper 
024a3 e8b851b5ff                     call       0x7f4eaf9c3660
024a8 0f1f8400a025001e               nop        dword ptr [rax + rax + 0x1e0025a0]
024b0 bee4ffffff                     mov        esi, 0xffffffe4
024b5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
024ba 448b1c24                       mov        r11d, dword ptr [rsp]
024be 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
024c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024cb 4c891424                       mov        qword ptr [rsp], r10
024cf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024d4 4c89542408                     mov        qword ptr [rsp + 8], r10
024d9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
024de 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
024e6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
024eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
024f0 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
024f5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
024fa 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
024ff 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02504 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02509 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0250e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02513 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02518 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0251d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02522 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02527 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0252c 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
02530 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02535 666690                         nop        
02538 c5f877                         vzeroupper 
0253b e82051b5ff                     call       0x7f4eaf9c3660
02540 0f1f84003826001f               nop        dword ptr [rax + rax + 0x1f002638]
02548 beccffffff                     mov        esi, 0xffffffcc
0254d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02552 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02557 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0255f 448b1424                       mov        r10d, dword ptr [rsp]
02563 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0256b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02570 4c891424                       mov        qword ptr [rsp], r10
02574 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02579 4c89542408                     mov        qword ptr [rsp + 8], r10
0257e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02583 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0258b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02590 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02595 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0259a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0259f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
025a4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
025a9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
025ae 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
025b3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
025b8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
025bd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
025c2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025c7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
025cc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
025d1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
025d6 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
025db 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
025e0 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
025e5 4489742460                     mov        dword ptr [rsp + 0x60], r14d
025ea 6690                           nop        
025ec c5f877                         vzeroupper 
025ef e86c50b5ff                     call       0x7f4eaf9c3660
025f4 0f1f8400ec260020               nop        dword ptr [rax + rax + 0x200026ec]
025fc be45ffffff                     mov        esi, 0xffffff45
02601 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02606 448b1c24                       mov        r11d, dword ptr [rsp]
0260a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02612 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02617 4c891424                       mov        qword ptr [rsp], r10
0261b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02620 4c89542408                     mov        qword ptr [rsp + 8], r10
02625 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0262a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02632 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02637 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0263c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02641 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02646 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0264b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02650 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02655 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0265a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0265f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02664 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02669 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0266e 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02673 90                             nop        
02674 c5f877                         vzeroupper 
02677 e8e44fb5ff                     call       0x7f4eaf9c3660
0267c 0f1f840074270021               nop        dword ptr [rax + rax + 0x21002774]
02684 be17000000                     mov        esi, 0x17
02689 666690                         nop        
0268c c5f877                         vzeroupper 
0268f e8cc4fb5ff                     call       0x7f4eaf9c3660
02694 0f1f84008c270022               nop        dword ptr [rax + rax + 0x2200278c]
0269c be6effffff                     mov        esi, 0xffffff6e
026a1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
026a6 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
026ae 4c895c2408                     mov        qword ptr [rsp + 8], r11
026b3 895c2418                       mov        dword ptr [rsp + 0x18], ebx
026b7 48894424f8                     mov        qword ptr [rsp - 8], rax
026bc 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
026c0 89442420                       mov        dword ptr [rsp + 0x20], eax
026c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026c9 48ff742430                     push       qword ptr [rsp + 0x30]
026ce 488f442428                     pop        qword ptr [rsp + 0x28]
026d3 89542424                       mov        dword ptr [rsp + 0x24], edx
026d7 4c89442430                     mov        qword ptr [rsp + 0x30], r8
026dc 48ff742448                     push       qword ptr [rsp + 0x48]
026e1 488f442438                     pop        qword ptr [rsp + 0x38]
026e6 894c2440                       mov        dword ptr [rsp + 0x40], ecx
026ea 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
026ef 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
026f4 c5f877                         vzeroupper 
026f7 e8644fb5ff                     call       0x7f4eaf9c3660
026fc 0f1f8400f4270023               nop        dword ptr [rax + rax + 0x230027f4]
02704 bebeffffff                     mov        esi, 0xffffffbe
02709 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0270e 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02716 8b3c24                         mov        edi, dword ptr [rsp]
02719 89bc24e8000000                 mov        dword ptr [rsp + 0xe8], edi
02720 4c891c24                       mov        qword ptr [rsp], r11
02724 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02729 4c89542408                     mov        qword ptr [rsp + 8], r10
0272e 4889442410                     mov        qword ptr [rsp + 0x10], rax
02733 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02737 48894424f8                     mov        qword ptr [rsp - 8], rax
0273c 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02740 89442420                       mov        dword ptr [rsp + 0x20], eax
02744 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02749 48ff742430                     push       qword ptr [rsp + 0x30]
0274e 488f442428                     pop        qword ptr [rsp + 0x28]
02753 89542424                       mov        dword ptr [rsp + 0x24], edx
02757 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0275c 48ff742448                     push       qword ptr [rsp + 0x48]
02761 488f442438                     pop        qword ptr [rsp + 0x38]
02766 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0276a 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0276f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02774 c5f877                         vzeroupper 
02777 e8e44eb5ff                     call       0x7f4eaf9c3660
0277c 0f1f840074280024               nop        dword ptr [rax + rax + 0x24002874]
02784 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
02789 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0278d 458bd9                         mov        r11d, r9d
02790 beccffffff                     mov        esi, 0xffffffcc
02795 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0279a 4c89b424e8000000               mov        qword ptr [rsp + 0xe8], r14
027a2 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
027aa 891c24                         mov        dword ptr [rsp], ebx
027ad 44895c2404                     mov        dword ptr [rsp + 4], r11d
027b2 448944240c                     mov        dword ptr [rsp + 0xc], r8d
027b7 90                             nop        
027b8 c5f877                         vzeroupper 
027bb e8a04eb5ff                     call       0x7f4eaf9c3660
027c0 0f1f8400b8280025               nop        dword ptr [rax + rax + 0x250028b8]
027c8 bee4ffffff                     mov        esi, 0xffffffe4
027cd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027d2 448b1c24                       mov        r11d, dword ptr [rsp]
027d6 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
027de 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
027e3 4c891c24                       mov        qword ptr [rsp], r11
027e7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
027ec 4c895c2408                     mov        qword ptr [rsp + 8], r11
027f1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
027f6 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
027fe 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02803 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02808 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0280d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02812 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02817 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0281c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02821 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02826 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0282b 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02830 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02835 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0283a 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0283f 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02844 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02849 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0284e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02853 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02858 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0285c 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02861 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02866 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0286b 90                             nop        
0286c c5f877                         vzeroupper 
0286f e8ec4db5ff                     call       0x7f4eaf9c3660
02874 0f1f84006c290026               nop        dword ptr [rax + rax + 0x2600296c]
0287c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
02885 bee4ffffff                     mov        esi, 0xffffffe4
0288a 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0288f 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02897 448b0424                       mov        r8d, dword ptr [rsp]
0289b 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
028a3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
028a8 4c891c24                       mov        qword ptr [rsp], r11
028ac 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
028b1 4c895c2408                     mov        qword ptr [rsp + 8], r11
028b6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028bb 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
028c3 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
028c8 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
028cd 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
028d2 4489442418                     mov        dword ptr [rsp + 0x18], r8d
028d7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
028dc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028e1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
028e6 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
028eb 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
028f0 4489442424                     mov        dword ptr [rsp + 0x24], r8d
028f5 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
028fa 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
028ff 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02904 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02909 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0290e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02913 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02918 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0291d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02921 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02926 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0292b 90                             nop        
0292c c5f877                         vzeroupper 
0292f e82c4db5ff                     call       0x7f4eaf9c3660
02934 0f1f84002c2a0027               nop        dword ptr [rax + rax + 0x27002a2c]
0293c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
02944 beccffffff                     mov        esi, 0xffffffcc
02949 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0294e 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
02953 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
0295b 448b0c24                       mov        r9d, dword ptr [rsp]
0295f 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
02967 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0296c 4c890424                       mov        qword ptr [rsp], r8
02970 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
02975 4c89442408                     mov        qword ptr [rsp + 8], r8
0297a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0297f 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
02987 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0298c 4c89442410                     mov        qword ptr [rsp + 0x10], r8
02991 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
02996 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
0299b 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
029a0 4489442424                     mov        dword ptr [rsp + 0x24], r8d
029a5 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
029aa 4c89442428                     mov        qword ptr [rsp + 0x28], r8
029af 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
029b4 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
029b9 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
029be 4c89442438                     mov        qword ptr [rsp + 0x38], r8
029c3 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
029c8 4c89442440                     mov        qword ptr [rsp + 0x40], r8
029cd 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
029d2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
029d7 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
029dc 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
029e1 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
029e6 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
029eb 89442470                       mov        dword ptr [rsp + 0x70], eax
029ef 90                             nop        
029f0 c5f877                         vzeroupper 
029f3 e8684cb5ff                     call       0x7f4eaf9c3660
029f8 0f1f8400f02a0028               nop        dword ptr [rax + rax + 0x28002af0]
02a00 418bea                         mov        ebp, r10d
02a03 83c510                         add        ebp, 0x10
02a06 be6effffff                     mov        esi, 0xffffff6e
02a0b 48ff742408                     push       qword ptr [rsp + 8]
02a10 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02a18 48ff742420                     push       qword ptr [rsp + 0x20]
02a1d 488f442408                     pop        qword ptr [rsp + 8]
02a22 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02a27 4489442404                     mov        dword ptr [rsp + 4], r8d
02a2c 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02a31 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02a36 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02a3b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02a40 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02a45 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02a4a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02a4f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a54 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a59 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02a5e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02a63 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02a68 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02a6d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02a72 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02a77 89442454                       mov        dword ptr [rsp + 0x54], eax
02a7b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
02a80 c5f877                         vzeroupper 
02a83 e8d84bb5ff                     call       0x7f4eaf9c3660
02a88 0f1f8400802b0029               nop        dword ptr [rax + rax + 0x29002b80]
02a90 418bea                         mov        ebp, r10d
02a93 83c510                         add        ebp, 0x10
02a96 be66ffffff                     mov        esi, 0xffffff66
02a9b 48ff742408                     push       qword ptr [rsp + 8]
02aa0 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02aa8 48ff742420                     push       qword ptr [rsp + 0x20]
02aad 488f442408                     pop        qword ptr [rsp + 8]
02ab2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ab7 44895c2404                     mov        dword ptr [rsp + 4], r11d
02abc 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02ac1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02ac6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02acb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02ad0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02ad5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02ada 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02adf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ae4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02ae9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02aee 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02af3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02af8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02afd 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b02 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02b07 89442454                       mov        dword ptr [rsp + 0x54], eax
02b0b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
02b10 c5f877                         vzeroupper 
02b13 e8484bb5ff                     call       0x7f4eaf9c3660
02b18 0f1f8400102c002a               nop        dword ptr [rax + rax + 0x2a002c10]
02b20 bee4ffffff                     mov        esi, 0xffffffe4
02b25 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b2a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02b2f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02b37 448b1c24                       mov        r11d, dword ptr [rsp]
02b3b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02b43 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b48 4c891424                       mov        qword ptr [rsp], r10
02b4c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b51 4c89542408                     mov        qword ptr [rsp + 8], r10
02b56 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b5b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02b63 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02b68 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b6d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02b72 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02b77 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02b7c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b81 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02b86 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02b8b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b90 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b95 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02b9a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b9f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02ba4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02ba9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02bae 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02bb3 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02bb8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
02bbd 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02bc2 6690                           nop        
02bc4 c5f877                         vzeroupper 
02bc7 e8944ab5ff                     call       0x7f4eaf9c3660
02bcc 0f1f8400c42c002b               nop        dword ptr [rax + rax + 0x2b002cc4]
02bd4 bee4ffffff                     mov        esi, 0xffffffe4
02bd9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02bde 448b1424                       mov        r10d, dword ptr [rsp]
02be2 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02bea 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02bef 4c891424                       mov        qword ptr [rsp], r10
02bf3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02bf8 4c89542408                     mov        qword ptr [rsp + 8], r10
02bfd 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02c02 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02c0a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02c0f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c14 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02c19 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02c1e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02c23 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c28 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02c2d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02c32 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c37 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c3c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02c41 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c46 4489442454                     mov        dword ptr [rsp + 0x54], r8d
02c4b 90                             nop        
02c4c c5f877                         vzeroupper 
02c4f e80c4ab5ff                     call       0x7f4eaf9c3660
02c54 0f1f84004c2d002c               nop        dword ptr [rax + rax + 0x2c002d4c]
02c5c 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
02c64 4183c308                       add        r11d, 8
02c68 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02c6d be6effffff                     mov        esi, 0xffffff6e
02c72 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c77 448b1424                       mov        r10d, dword ptr [rsp]
02c7b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02c83 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c88 4c891424                       mov        qword ptr [rsp], r10
02c8c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c91 4c89542408                     mov        qword ptr [rsp + 8], r10
02c96 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02c9b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02ca3 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02ca8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02cad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02cb2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02cb7 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02cbc 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02cc1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02cc6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ccb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02cd0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02cd5 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02cdd 458bda                         mov        r11d, r10d
02ce0 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02ce5 666690                         nop        
02ce8 c5f877                         vzeroupper 
02ceb e87049b5ff                     call       0x7f4eaf9c3660
02cf0 0f1f8400e82d002d               nop        dword ptr [rax + rax + 0x2d002de8]
02cf8 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
02d00 4183c208                       add        r10d, 8
02d04 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02d09 be66ffffff                     mov        esi, 0xffffff66
02d0e 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d13 448b1424                       mov        r10d, dword ptr [rsp]
02d17 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02d1f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d24 4c891424                       mov        qword ptr [rsp], r10
02d28 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d2d 4c89542408                     mov        qword ptr [rsp + 8], r10
02d32 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02d37 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02d3f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02d44 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02d49 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02d4e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d53 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02d58 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02d5d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d62 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d67 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02d6c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02d71 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02d79 458bda                         mov        r11d, r10d
02d7c 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02d81 666690                         nop        
02d84 c5f877                         vzeroupper 
02d87 e8d448b5ff                     call       0x7f4eaf9c3660
02d8c 0f1f8400842e002e               nop        dword ptr [rax + rax + 0x2e002e84]
02d94 bef6ffffff                     mov        esi, 0xfffffff6
02d99 498bee                         mov        rbp, r14
02d9c 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02da4 c5f877                         vzeroupper 
02da7 e8b448b5ff                     call       0x7f4eaf9c3660
02dac 0f1f8400a42e002f               nop        dword ptr [rax + rax + 0x2f002ea4]
02db4 488bf0                         mov        rsi, rax
02db7 eb0d                           jmp        0x7f4eafe6edc6
02db9 488bf0                         mov        rsi, rax
02dbc eb08                           jmp        0x7f4eafe6edc6
02dbe 488bf0                         mov        rsi, rax
02dc1 eb03                           jmp        0x7f4eafe6edc6
02dc3 488bf0                         mov        rsi, rax
02dc6 c5f877                         vzeroupper 
02dc9 4881c4d0000000                 add        rsp, 0xd0
02dd0 5d                             pop        rbp
02dd1 e98a74b5ff                     jmp        0x7f4eaf9c6260
02dd6 bef6ffffff                     mov        esi, 0xfffffff6
02ddb 90                             nop        
02ddc c5f877                         vzeroupper 
02ddf e87c48b5ff                     call       0x7f4eaf9c3660
02de4 0f1f8400dc2e0030               nop        dword ptr [rax + rax + 0x30002edc]
02dec 49ba4ad0e6af4e7f0000           movabs     r10, 0x7f4eafe6d04a
02df6 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02dfd e9def0a8ff                     jmp        0x7f4eaf8fdee0
02e02 e899bca7ff                     call       0x7f4eaf8eaaa0
02e07 e932d2ffff                     jmp        0x7f4eafe6c03e
02e0c f4                             hlt        
02e0d f4                             hlt        
02e0e f4                             hlt        
02e0f f4                             hlt        
