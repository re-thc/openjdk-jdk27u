00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0f6a8ff                   jne        0x7f53eb8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85d82d0000                   jne        0x7f53ebe6e096
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
0006e 0f8f20260000                   jg         0x7f53ebe6d914
00074 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00078 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0007d 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00081 48638c24e0000000               movsxd     rcx, dword ptr [rsp + 0xe0]
00089 4d63ca                         movsxd     r9, r10d
0008c 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
00091 4d2bc1                         sub        r8, r9
00094 493bc8                         cmp        rcx, r8
00097 0f8ff7250000                   jg         0x7f53ebe6d914
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f84c1130000                   je         0x7f53ebe6c6f4
000b3 33d2                           xor        edx, edx
000b5 4d8bf3                         mov        r14, r11
000b8 418b7304                       mov        esi, dword ptr [r11 + 4]
000bc 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
000c1 418b5b40                       mov        ebx, dword ptr [r11 + 0x40]
000c5 448bef                         mov        r13d, edi
000c8 85ff                           test       edi, edi
000ca 0f8e641f0000                   jle        0x7f53ebe6d2b4
000d0 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
000d8 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000dd 448d4ee0                       lea        r9d, [rsi - 0x20]
000e1 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
000e5 83c1e0                         add        ecx, -0x20
000e8 4c8bd8                         mov        r11, rax
000eb 418b7b04                       mov        edi, dword ptr [r11 + 4]
000ef 85ff                           test       edi, edi
000f1 0f86b5250000                   jbe        0x7f53ebe6d92c
000f7 4c63d7                         movsxd     r10, edi
000fa 4963fd                         movsxd     rdi, r13d
000fd 48ffcf                         dec        rdi
00100 493bfa                         cmp        rdi, r10
00103 0f83a3250000                   jae        0x7f53ebe6d92c
00109 488b8424e8000000               mov        rax, qword ptr [rsp + 0xe8]
00111 8b7804                         mov        edi, dword ptr [rax + 4]
00114 85ff                           test       edi, edi
00116 0f86f8250000                   jbe        0x7f53ebe6d994
0011c 83ff01                         cmp        edi, 1
0011f 0f86ef250000                   jbe        0x7f53ebe6d994
00125 83ff02                         cmp        edi, 2
00128 0f86e6250000                   jbe        0x7f53ebe6d994
0012e 448d56f1                       lea        r10d, [rsi - 0xf]
00132 4585d2                         test       r10d, r10d
00135 0f8cd9250000                   jl         0x7f53ebe6d994
0013b 8b6b04                         mov        ebp, dword ptr [rbx + 4]
0013e 448d55f1                       lea        r10d, [rbp - 0xf]
00142 4585d2                         test       r10d, r10d
00145 0f8cc9250000                   jl         0x7f53ebe6d994
0014b 448d55f9                       lea        r10d, [rbp - 7]
0014f 4585d2                         test       r10d, r10d
00152 0f8cbc250000                   jl         0x7f53ebe6d994
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
001e5 e9b7030000                     jmp        0x7f53ebe6b821
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
0022f 0f8d57090000                   jge        0x7f53ebe6be0c
00235 418bdd                         mov        ebx, r13d
00238 448bc3                         mov        r8d, ebx
0023b 442b842494000000               sub        r8d, dword ptr [rsp + 0x94]
00243 8bac2490000000                 mov        ebp, dword ptr [rsp + 0x90]
0024a 2bac2494000000                 sub        ebp, dword ptr [rsp + 0x94]
00251 3bac2494000000                 cmp        ebp, dword ptr [rsp + 0x94]
00258 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00260 410f4fea                       cmovg      ebp, r10d
00264 4585c0                         test       r8d, r8d
00267 0f8c5f190000                   jl         0x7f53ebe6ce4c
0026d 85db                           test       ebx, ebx
0026f 0f8c57190000                   jl         0x7f53ebe6ce4c
00275 458d1c28                       lea        r11d, [r8 + rbp]
00279 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
00281 453bd3                         cmp        r10d, r11d
00284 0f8242190000                   jb         0x7f53ebe6ce4c
0028a 448d2c2b                       lea        r13d, [rbx + rbp]
0028e 453bd5                         cmp        r10d, r13d
00291 0f8235190000                   jb         0x7f53ebe6ce4c
00297 85ed                           test       ebp, ebp
00299 0f8c2d190000                   jl         0x7f53ebe6ce4c
0029f 85ed                           test       ebp, ebp
002a1 0f8466ffffff                   je         0x7f53ebe6b48d
002a7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
002ac 498d741a08                     lea        rsi, [r10 + rbx + 8]
002b1 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
002b6 4863d5                         movsxd     rdx, ebp
002b9 4883fa20                       cmp        rdx, 0x20
002bd 0f8627ffffff                   jbe        0x7f53ebe6b46a
002c3 c5f877                         vzeroupper 
002c6 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
002d0 41ffd2                         call       r10
002d3 0f1f840000000000               nop        dword ptr [rax + rax]
002db e92dffffff                     jmp        0x7f53ebe6b48d
002e0 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
002e8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
002ed c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
002f4 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
002fc 4503cb                         add        r9d, r11d
002ff e974020000                     jmp        0x7f53ebe6b7f8
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
00341 0f8ce6050000                   jl         0x7f53ebe6bbad
00347 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0034f 4183fa30                       cmp        r10d, 0x30
00353 0f8e9b000000                   jle        0x7f53ebe6b674
00359 4585f6                         test       r14d, r14d
0035c 0f8c06190000                   jl         0x7f53ebe6cee8
00362 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0036a 4585db                         test       r11d, r11d
0036d 0f8cf5180000                   jl         0x7f53ebe6cee8
00373 4503d6                         add        r10d, r14d
00376 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
0037e 453bc2                         cmp        r8d, r10d
00381 0f82e1180000                   jb         0x7f53ebe6cee8
00387 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
0038f 0f82d3180000                   jb         0x7f53ebe6cee8
00395 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0039d 4585d2                         test       r10d, r10d
003a0 0f84c2010000                   je         0x7f53ebe6b7e8
003a6 4963d2                         movsxd     rdx, r10d
003a9 4883fa20                       cmp        rdx, 0x20
003ad 7728                           ja         0x7f53ebe6b657
003af 458bda                         mov        r11d, r10d
003b2 4d63d3                         movsxd     r10, r11d
003b5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003bc c442a8f5db                     bzhi       r11, r11, r10
003c1 c4c1fb92fb                     kmovq      k7, r11
003c6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003cc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003d2 e991010000                     jmp        0x7f53ebe6b7e8
003d7 c5f877                         vzeroupper 
003da 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
003e4 41ffd2                         call       r10
003e7 0f1f840000000000               nop        dword ptr [rax + rax]
003ef e974010000                     jmp        0x7f53ebe6b7e8
003f4 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
003f9 0f83f1140000                   jae        0x7f53ebe6cb70
003ff 4963fe                         movsxd     rdi, r14d
00402 4d8b443808                     mov        r8, qword ptr [r8 + rdi + 8]
00407 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
0040f 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
00414 0f838a150000                   jae        0x7f53ebe6cc24
0041a 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00422 458d4a08                       lea        r9d, [r10 + 8]
00426 4963da                         movsxd     rbx, r10d
00429 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0042e 4d89441b08                     mov        qword ptr [r11 + rbx + 8], r8
00433 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
0043b 0f8d27010000                   jge        0x7f53ebe6b7e8
00441 482bfb                         sub        rdi, rbx
00444 4d63c1                         movsxd     r8, r9d
00447 4d8d1c38                       lea        r11, [r8 + rdi]
0044b 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
00453 0f8303160000                   jae        0x7f53ebe6ccdc
00459 4c8bd9                         mov        r11, rcx
0045c 4d2bd8                         sub        r11, r8
0045f 4983c307                       add        r11, 7
00463 4983e3f8                       and        r11, 0xfffffffffffffff8
00467 458bdb                         mov        r11d, r11d
0046a 478d441308                     lea        r8d, [r11 + r10 + 8]
0046f 4d63d8                         movsxd     r11, r8d
00472 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
00477 4c3b842488000000               cmp        r8, qword ptr [rsp + 0x88]
0047f 0f83d7150000                   jae        0x7f53ebe6ccdc
00485 443b4c2474                     cmp        r9d, dword ptr [rsp + 0x74]
0048a 0f83cc150000                   jae        0x7f53ebe6ccdc
00490 4983c3f8                       add        r11, -8
00494 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
0049c 0f83ba150000                   jae        0x7f53ebe6ccdc
004a2 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
004aa 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004b1 0f8f5d160000                   jg         0x7f53ebe6cd94
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
004df 7cdd                           jl         0x7f53ebe6b73e
004e1 4883c1f8                       add        rcx, -8
004e5 4881f900000080                 cmp        rcx, -0x80000000
004ec 49c7c200000080                 mov        r10, 0xffffffff80000000
004f3 490f4cca                       cmovl      rcx, r10
004f7 8bc9                           mov        ecx, ecx
004f9 443bc9                         cmp        r9d, ecx
004fc 7d3c                           jge        0x7f53ebe6b7ba
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
00538 7cc6                           jl         0x7f53ebe6b780
0053a 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
00542 7d24                           jge        0x7f53ebe6b7e8
00544 478d1c0e                       lea        r11d, [r14 + r9]
00548 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0054d 4f8b5c1a08                     mov        r11, qword ptr [r10 + r11 + 8]
00552 458bc1                         mov        r8d, r9d
00555 4f895c0208                     mov        qword ptr [r10 + r8 + 8], r11
0055a 4183c108                       add        r9d, 8
0055e 443b8c24a0000000               cmp        r9d, dword ptr [rsp + 0xa0]
00566 7cdc                           jl         0x7f53ebe6b7c4
00568 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00570 44038c2490000000               add        r9d, dword ptr [rsp + 0x90]
00578 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00580 41ffc3                         inc        r11d
00583 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00588 0f8d130a0000                   jge        0x7f53ebe6c221
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
005de 0f8cd0100000                   jl         0x7f53ebe6c934
005e4 448bc0                         mov        r8d, eax
005e7 4585c0                         test       r8d, r8d
005ea 0f853c020000                   jne        0x7f53ebe6baac
005f0 4533db                         xor        r11d, r11d
005f3 418bc3                         mov        eax, r11d
005f6 83fb03                         cmp        ebx, 3
005f9 0f8e83020000                   jle        0x7f53ebe6bb02
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
0065c 0f8fe6100000                   jg         0x7f53ebe6c9c8
00662 448bac249c000000               mov        r13d, dword ptr [rsp + 0x9c]
0066a 4403e8                         add        r13d, eax
0066d 458bf5                         mov        r14d, r13d
00670 442bb42494000000               sub        r14d, dword ptr [rsp + 0x94]
00678 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0067d 4585db                         test       r11d, r11d
00680 0f84d6010000                   je         0x7f53ebe6badc
00686 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0068b 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
00693 4585c9                         test       r9d, r9d
00696 0f8ef40f0000                   jle        0x7f53ebe6c910
0069c 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
006a4 4503c5                         add        r8d, r13d
006a7 443b442464                     cmp        r8d, dword ptr [rsp + 0x64]
006ac 0f8f0e110000                   jg         0x7f53ebe6ca40
006b2 458d0402                       lea        r8d, [r10 + rax]
006b6 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
006be 443b442460                     cmp        r8d, dword ptr [rsp + 0x60]
006c3 0f8f9b110000                   jg         0x7f53ebe6cae4
006c9 83f810                         cmp        eax, 0x10
006cc 0f8fc7040000                   jg         0x7f53ebe6be19
006d2 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
006d7 0f83b60d0000                   jae        0x7f53ebe6c713
006dd 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
006e2 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
006e9 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
006f1 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
006f6 0f83440e0000                   jae        0x7f53ebe6c7c0
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
00737 0f8fc7fbffff                   jg         0x7f53ebe6b584
0073d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00745 4183fa10                       cmp        r10d, 0x10
00749 0f8cb5fbffff                   jl         0x7f53ebe6b584
0074f 443b74247c                     cmp        r14d, dword ptr [rsp + 0x7c]
00754 0f83a20e0000                   jae        0x7f53ebe6c87c
0075a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0075f c4817a6f443308                 vmovdqu    xmm0, xmmword ptr [r11 + r14 + 8]
00766 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
0076e 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00773 0f8267fbffff                   jb         0x7f53ebe6b560
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
0081f e8bc7bb5ff                     call       0x7f53eb9c3660
00824 0f1f84001c090001               nop        dword ptr [rax + rax + 0x100091c]
0082c 448b1c24                       mov        r11d, dword ptr [rsp]
00830 452bda                         sub        r11d, r10d
00833 453bc3                         cmp        r8d, r11d
00836 0f8ebafdffff                   jle        0x7f53ebe6b876
0083c be45ffffff                     mov        esi, 0xffffff45
00841 418be8                         mov        ebp, r8d
00844 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0084c c5f877                         vzeroupper 
0084f e88c7bb5ff                     call       0x7f53eb9c3660
00854 0f1f84004c090002               nop        dword ptr [rax + rax + 0x200094c]
0085c 4d63de                         movsxd     r11, r14d
0085f 4c3b5c2440                     cmp        r11, qword ptr [rsp + 0x40]
00864 0f8cb2140000                   jl         0x7f53ebe6cf9c
0086a 483b5c2448                     cmp        rbx, qword ptr [rsp + 0x48]
0086f 0f8f37150000                   jg         0x7f53ebe6d02c
00875 4533db                         xor        r11d, r11d
00878 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0087d e909feffff                     jmp        0x7f53ebe6b90b
00882 85c0                           test       eax, eax
00884 7407                           je         0x7f53ebe6bb0d
00886 448d5bff                       lea        r11d, [rbx - 1]
0088a 418bdb                         mov        ebx, r11d
0088d 85db                           test       ebx, ebx
0088f 7516                           jne        0x7f53ebe6bb27
00891 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00896 418b4b08                       mov        ecx, dword ptr [r11 + 8]
0089a 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
008a2 e97a000000                     jmp        0x7f53ebe6bba1
008a7 83fb03                         cmp        ebx, 3
008aa 0f8450180000                   je         0x7f53ebe6d380
008b0 83fb02                         cmp        ebx, 2
008b3 0f87e7180000                   ja         0x7f53ebe6d420
008b9 3b9c24e4000000                 cmp        ebx, dword ptr [rsp + 0xe4]
008c0 0f83b6160000                   jae        0x7f53ebe6d1fc
008c6 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008cb 418b4c9808                     mov        ecx, dword ptr [r8 + rbx*4 + 8]
008d0 85db                           test       ebx, ebx
008d2 7e3c                           jle        0x7f53ebe6bb90
008d4 448d43ff                       lea        r8d, [rbx - 1]
008d8 443b8424e4000000               cmp        r8d, dword ptr [rsp + 0xe4]
008e0 0f8368170000                   jae        0x7f53ebe6d2ce
008e6 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
008ee 6690                           nop        
008f0 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
008f5 458b5c9804                     mov        r11d, dword ptr [r8 + rbx*4 + 4]
008fa 4d8bc8                         mov        r9, r8
008fd 45895c9908                     mov        dword ptr [r9 + rbx*4 + 8], r11d
00902 448d5bff                       lea        r11d, [rbx - 1]
00906 418bdb                         mov        ebx, r11d
00909 4585db                         test       r11d, r11d
0090c 7fe2                           jg         0x7f53ebe6bb70
0090e eb08                           jmp        0x7f53ebe6bb98
00910 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
00918 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0091d 41894b08                       mov        dword ptr [r11 + 8], ecx
00921 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
00928 e90efdffff                     jmp        0x7f53ebe6b8bb
0092d 4183fb10                       cmp        r11d, 0x10
00931 0f8dd51c0000                   jge        0x7f53ebe6d88c
00937 4183fb08                       cmp        r11d, 8
0093b 0f8d15070000                   jge        0x7f53ebe6c2d6
00941 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00949 4183fa10                       cmp        r10d, 0x10
0094d 0f8eb4000000                   jle        0x7f53ebe6bc87
00953 4585f6                         test       r14d, r14d
00956 0f8cfc1b0000                   jl         0x7f53ebe6d7d8
0095c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00964 4585db                         test       r11d, r11d
00967 0f8ceb1b0000                   jl         0x7f53ebe6d7d8
0096d 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00975 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
0097d 0f82d51b0000                   jb         0x7f53ebe6d7d8
00983 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
0098a 039c249c000000                 add        ebx, dword ptr [rsp + 0x9c]
00991 443bdb                         cmp        r11d, ebx
00994 0f82be1b0000                   jb         0x7f53ebe6d7d8
0099a 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
009a2 4585db                         test       r11d, r11d
009a5 0f8cad1b0000                   jl         0x7f53ebe6d7d8
009ab 4585db                         test       r11d, r11d
009ae 0f8484f8ffff                   je         0x7f53ebe6b4b8
009b4 4883fd20                       cmp        rbp, 0x20
009b8 772d                           ja         0x7f53ebe6bc67
009ba 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
009c2 4d63d2                         movsxd     r10, r10d
009c5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
009cc c442a8f5db                     bzhi       r11, r11, r10
009d1 c4c1fb92fb                     kmovq      k7, r11
009d6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
009dc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
009e2 e951f8ffff                     jmp        0x7f53ebe6b4b8
009e7 488bd5                         mov        rdx, rbp
009ea c5f877                         vzeroupper 
009ed 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
009f7 41ffd2                         call       r10
009fa 0f1f840000000000               nop        dword ptr [rax + rax]
00a02 e931f8ffff                     jmp        0x7f53ebe6b4b8
00a07 443bb424e8000000               cmp        r14d, dword ptr [rsp + 0xe8]
00a0f 0f832b180000                   jae        0x7f53ebe6d4c0
00a15 430fbe6c3008                   movsx      ebp, byte ptr [r8 + r14 + 8]
00a1b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00a23 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a2b 0f83c3180000                   jae        0x7f53ebe6d574
00a31 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00a39 43886c1808                     mov        byte ptr [r8 + r11 + 8], bpl
00a3e 41ffc3                         inc        r11d
00a41 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
00a49 458d5603                       lea        r10d, [r14 + 3]
00a4d 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00a55 0f8331190000                   jae        0x7f53ebe6d60c
00a5b 4d63d6                         movsxd     r10, r14d
00a5e 430fbe6c1009                   movsx      ebp, byte ptr [r8 + r10 + 9]
00a64 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00a6c 4183c003                       add        r8d, 3
00a70 443b8424e8000000               cmp        r8d, dword ptr [rsp + 0xe8]
00a78 0f83aa190000                   jae        0x7f53ebe6d6a8
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
00ab6 0f83041a0000                   jae        0x7f53ebe6d740
00abc 49ba283827e300000000           movabs     r10, 0xe3273828
00ac6 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00ace 4703749a08                     add        r14d, dword ptr [r10 + r11*4 + 8]
00ad3 4489742404                     mov        dword ptr [rsp + 4], r14d
00ad8 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00ae0 4183fb04                       cmp        r11d, 4
00ae4 7e3e                           jle        0x7f53ebe6bda4
00ae6 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00aed 83c504                         add        ebp, 4
00af0 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00af5 418bd6                         mov        edx, r14d
00af8 c5f877                         vzeroupper 
00afb e8e0faa8ff                     call       0x7f53eb8fb860
00b00 0f1f8400f80b0003               nop        dword ptr [rax + rax + 0x3000bf8]
00b08 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b0d 8bd5                           mov        edx, ebp
00b0f 8bc8                           mov        ecx, eax
00b11 666690                         nop        
00b14 c5f877                         vzeroupper 
00b17 e8c4faa8ff                     call       0x7f53eb8fb860
00b1c 0f1f8400140c0004               nop        dword ptr [rax + rax + 0x4000c14]
00b24 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00b2c 4183fa08                       cmp        r10d, 8
00b30 7e5a                           jle        0x7f53ebe6be0c
00b32 8b542404                       mov        edx, dword ptr [rsp + 4]
00b36 49ba503827e300000000           movabs     r10, 0xe3273850
00b40 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b48 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00b4d 8bac249c000000                 mov        ebp, dword ptr [rsp + 0x9c]
00b54 83c508                         add        ebp, 8
00b57 83c208                         add        edx, 8
00b5a 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b5f 90                             nop        
00b60 c5f877                         vzeroupper 
00b63 e878faa8ff                     call       0x7f53eb8fb860
00b68 0f1f8400600c0005               nop        dword ptr [rax + rax + 0x5000c60]
00b70 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00b75 8bd5                           mov        edx, ebp
00b77 488bc8                         mov        rcx, rax
00b7a 6690                           nop        
00b7c c5f877                         vzeroupper 
00b7f e85cfaa8ff                     call       0x7f53eb8fb860
00b84 0f1f84007c0c0006               nop        dword ptr [rax + rax + 0x6000c7c]
00b8c 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00b94 e9dff9ffff                     jmp        0x7f53ebe6b7f8
00b99 83f830                         cmp        eax, 0x30
00b9c 0f8ea9000000                   jle        0x7f53ebe6becb
00ba2 4585d2                         test       r10d, r10d
00ba5 0f8ca11d0000                   jl         0x7f53ebe6dbcc
00bab 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00bb3 4585db                         test       r11d, r11d
00bb6 0f8c981d0000                   jl         0x7f53ebe6dbd4
00bbc 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00bc4 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
00bcc 0f82821d0000                   jb         0x7f53ebe6dbd4
00bd2 448b8c24e8000000               mov        r9d, dword ptr [rsp + 0xe8]
00bda 453bcd                         cmp        r9d, r13d
00bdd 0f82711d0000                   jb         0x7f53ebe6dbd4
00be3 85c0                           test       eax, eax
00be5 743d                           je         0x7f53ebe6bea4
00be7 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
00bec 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
00bf1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00bf6 4b8d741a08                     lea        rsi, [r10 + r11 + 8]
00bfb 4883fa20                       cmp        rdx, 0x20
00bff 7730                           ja         0x7f53ebe6beb1
00c01 448bd0                         mov        r10d, eax
00c04 4d63d2                         movsxd     r10, r10d
00c07 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c0e c442a8f5db                     bzhi       r11, r11, r10
00c13 c4c1fb92fb                     kmovq      k7, r11
00c18 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c1e 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c24 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00c2c e9fafaffff                     jmp        0x7f53ebe6b9ab
00c31 c5f877                         vzeroupper 
00c34 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
00c3e 41ffd2                         call       r10
00c41 0f1f840000000000               nop        dword ptr [rax + rax]
00c49 ebd9                           jmp        0x7f53ebe6bea4
00c4b 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00c50 0f83821b0000                   jae        0x7f53ebe6da58
00c56 4963ca                         movsxd     rcx, r10d
00c59 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00c5e c4c17a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + rcx + 8]
00c65 448b8c249c000000               mov        r9d, dword ptr [rsp + 0x9c]
00c6d 443b4c247c                     cmp        r9d, dword ptr [rsp + 0x7c]
00c72 0f83141c0000                   jae        0x7f53ebe6db0c
00c78 458d5910                       lea        r11d, [r9 + 0x10]
00c7c 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00c84 4963d9                         movsxd     rbx, r9d
00c87 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00c8c c4c17a7f441808                 vmovdqu    xmmword ptr [r8 + rbx + 8], xmm0
00c93 453bdd                         cmp        r11d, r13d
00c96 0f8dc7020000                   jge        0x7f53ebe6c1e3
00c9c 482bcb                         sub        rcx, rbx
00c9f 4d63db                         movsxd     r11, r11d
00ca2 4863bc24ec000000               movsxd     rdi, dword ptr [rsp + 0xec]
00caa 4883c7f1                       add        rdi, -0xf
00cae 4d8d040b                       lea        r8, [r11 + rcx]
00cb2 4c3bc7                         cmp        r8, rdi
00cb5 0f83551d0000                   jae        0x7f53ebe6dc90
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
00cdf 0f832b1d0000                   jae        0x7f53ebe6dc90
00ce5 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00ced 443b44247c                     cmp        r8d, dword ptr [rsp + 0x7c]
00cf2 0f83181d0000                   jae        0x7f53ebe6dc90
00cf8 4983c3f0                       add        r11, -0x10
00cfc 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
00d04 4983c0f1                       add        r8, -0xf
00d08 4d3bd8                         cmp        r11, r8
00d0b 0f83ff1c0000                   jae        0x7f53ebe6dc90
00d11 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00d18 0f8f821d0000                   jg         0x7f53ebe6dd20
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
00d6a 7cbc                           jl         0x7f53ebe6bfa8
00d6c 4881c310ffffff                 add        rbx, -0xf0
00d73 4881fb00000080                 cmp        rbx, -0x80000000
00d7a 49c7c300000080                 mov        r11, 0xffffffff80000000
00d81 490f4cdb                       cmovl      rbx, r11
00d85 8bdb                           mov        ebx, ebx
00d87 443bc3                         cmp        r8d, ebx
00d8a 0f8d96010000                   jge        0x7f53ebe6c1a6
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
00f20 0f8c7afeffff                   jl         0x7f53ebe6c020
00f26 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00f2e 453bdd                         cmp        r11d, r13d
00f31 7d30                           jge        0x7f53ebe6c1e3
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
00f61 7cd9                           jl         0x7f53ebe6c1bc
00f63 468d1c10                       lea        r11d, [rax + r10]
00f67 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00f6f 4489ac249c000000               mov        dword ptr [rsp + 0x9c], r13d
00f77 e9aff7ffff                     jmp        0x7f53ebe6b9ab
00f7c 4d63d0                         movsxd     r10, r8d
00f7f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00f86 c442a8f5db                     bzhi       r11, r11, r10
00f8b c4c1fb92fb                     kmovq      k7, r11
00f90 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00f96 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00f9c e996000000                     jmp        0x7f53ebe6c2b7
00fa1 448b1c24                       mov        r11d, dword ptr [rsp]
00fa5 458bc3                         mov        r8d, r11d
00fa8 442b842498000000               sub        r8d, dword ptr [rsp + 0x98]
00fb0 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00fb8 4585d2                         test       r10d, r10d
00fbb 0f8cd3170000                   jl         0x7f53ebe6da14
00fc1 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
00fc6 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00fcd 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00fd1 458bd9                         mov        r11d, r9d
00fd4 4585c9                         test       r9d, r9d
00fd7 0f8cc3170000                   jl         0x7f53ebe6da20
00fdd 3b3424                         cmp        esi, dword ptr [rsp]
00fe0 0f82ba170000                   jb         0x7f53ebe6da20
00fe6 448b4b04                       mov        r9d, dword ptr [rbx + 4]
00fea 438d2c03                       lea        ebp, [r11 + r8]
00fee 443bcd                         cmp        r9d, ebp
00ff1 0f82a9170000                   jb         0x7f53ebe6da20
00ff7 4585c0                         test       r8d, r8d
00ffa 0f8ca0170000                   jl         0x7f53ebe6da20
01000 4585c0                         test       r8d, r8d
01003 7432                           je         0x7f53ebe6c2b7
01005 4b8d7c1608                     lea        rdi, [r14 + r10 + 8]
0100a 4c8bd3                         mov        r10, rbx
0100d 4a8d741b08                     lea        rsi, [rbx + r11 + 8]
01012 4963d0                         movsxd     rdx, r8d
01015 4883fa20                       cmp        rdx, 0x20
01019 0f865dffffff                   jbe        0x7f53ebe6c1fc
0101f c5f877                         vzeroupper 
01022 49ba204f8eeb537f0000           movabs     r10, 0x7f53eb8e4f20
0102c 41ffd2                         call       r10
0102f 0f1f840000000000               nop        dword ptr [rax + rax]
01037 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0103c 41896a38                       mov        dword ptr [r10 + 0x38], ebp
01040 c5f877                         vzeroupper 
01043 4881c4d0000000                 add        rsp, 0xd0
0104a 5d                             pop        rbp
0104b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0104f 0f87ab1d0000                   ja         0x7f53ebe6e080
01055 c3                             ret        
01056 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
0105b 0f83cf1a0000                   jae        0x7f53ebe6ddb0
01061 458bde                         mov        r11d, r14d
01064 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0106c 4d63c3                         movsxd     r8, r11d
0106f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01074 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
01079 4c899424a8000000               mov        qword ptr [rsp + 0xa8], r10
01081 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
01089 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
0108e 0f83501b0000                   jae        0x7f53ebe6de64
01094 8b9c249c000000                 mov        ebx, dword ptr [rsp + 0x9c]
0109b 448d5308                       lea        r10d, [rbx + 8]
0109f 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
010a7 4c63d3                         movsxd     r10, ebx
010aa 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
010af 4c8b9c24a8000000               mov        r11, qword ptr [rsp + 0xa8]
010b7 4f895c1108                     mov        qword ptr [r9 + r10 + 8], r11
010bc 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
010c4 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
010cc 0f8d95030000                   jge        0x7f53ebe6c6e7
010d2 4d2bc2                         sub        r8, r10
010d5 4963fb                         movsxd     rdi, r11d
010d8 4e8d1407                       lea        r10, [rdi + r8]
010dc 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
010e4 0f83861b0000                   jae        0x7f53ebe6def0
010ea 4c8bd1                         mov        r10, rcx
010ed 4c2bd7                         sub        r10, rdi
010f0 4983c207                       add        r10, 7
010f4 4983e2f8                       and        r10, 0xfffffffffffffff8
010f8 458bda                         mov        r11d, r10d
010fb 458d541b08                     lea        r10d, [r11 + rbx + 8]
01100 4d63d2                         movsxd     r10, r10d
01103 4f8d5c02f8                     lea        r11, [r10 + r8 - 8]
01108 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
01110 0f835a1b0000                   jae        0x7f53ebe6def0
01116 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
0111e 443b442474                     cmp        r8d, dword ptr [rsp + 0x74]
01123 0f83471b0000                   jae        0x7f53ebe6def0
01129 4983c2f8                       add        r10, -8
0112d 4c3b942488000000               cmp        r10, qword ptr [rsp + 0x88]
01135 0f83351b0000                   jae        0x7f53ebe6def0
0113b 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01143 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
0114a 0f8fbc1b0000                   jg         0x7f53ebe6df8c
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
01221 0f84150c0000                   je         0x7f53ebe6d0bc
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
0126a 7cc0                           jl         0x7f53ebe6c4ac
0126c 4881c108feffff                 add        rcx, -0x1f8
01273 4881f900000080                 cmp        rcx, -0x80000000
0127a 49c7c200000080                 mov        r10, 0xffffffff80000000
01281 490f4cca                       cmovl      rcx, r10
01285 8bd9                           mov        ebx, ecx
01287 443bdb                         cmp        r11d, ebx
0128a 0f8d97010000                   jge        0x7f53ebe6c6a7
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
013cc 0f8ccefeffff                   jl         0x7f53ebe6c520
013d2 443bd6                         cmp        r10d, esi
013d5 7d50                           jge        0x7f53ebe6c6a7
013d7 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
013df 90                             nop        
013e0 458bd1                         mov        r10d, r9d
013e3 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
013eb 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
013f0 62917e486f841008000000         vmovdqu32  zmm0, zmmword ptr [r8 + r10 + 8]
013fb 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01403 62917e487f841008000000         vmovdqu32  zmmword ptr [r8 + r10 + 8], zmm0
0140e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01416 4183c340                       add        r11d, 0x40
0141a 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01422 443bde                         cmp        r11d, esi
01425 7cb9                           jl         0x7f53ebe6c660
01427 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0142f 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
01437 7d2e                           jge        0x7f53ebe6c6e7
01439 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01441 666690                         nop        
01444 478d1401                       lea        r10d, [r9 + r8]
01448 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0144c 4e8b541108                     mov        r10, qword ptr [rcx + r10 + 8]
01451 458bd8                         mov        r11d, r8d
01454 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
01459 4183c008                       add        r8d, 8
0145d 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
01465 7cdd                           jl         0x7f53ebe6c6c4
01467 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
0146f e904f1ffff                     jmp        0x7f53ebe6b7f8
01474 4c03c9                         add        r9, rcx
01477 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
0147c 7e08                           jle        0x7f53ebe6c706
0147e 4533c0                         xor        r8d, r8d
01481 e92decffff                     jmp        0x7f53ebe6b333
01486 4533c0                         xor        r8d, r8d
01489 ba01000000                     mov        edx, 1
0148e e922ecffff                     jmp        0x7f53ebe6b335
01493 bee4ffffff                     mov        esi, 0xffffffe4
01498 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0149d 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
014a2 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
014aa 448b1c24                       mov        r11d, dword ptr [rsp]
014ae 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
014b6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
014bb 4c891c24                       mov        qword ptr [rsp], r11
014bf 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
014c4 4c895c2408                     mov        qword ptr [rsp + 8], r11
014c9 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
014ce 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
014d6 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
014db 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
014e0 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
014e5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
014ea 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
014ef 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
014f4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014f9 4489442430                     mov        dword ptr [rsp + 0x30], r8d
014fe 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01503 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01508 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0150d 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01512 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01517 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0151c 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01521 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01526 89442450                       mov        dword ptr [rsp + 0x50], eax
0152a 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0152f 90                             nop        
01530 c5f877                         vzeroupper 
01533 e8a86eb5ff                     call       0x7f53eb9c3660
01538 0f1f840030160007               nop        dword ptr [rax + rax + 0x7001630]
01540 bee4ffffff                     mov        esi, 0xffffffe4
01545 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0154a 448b0c24                       mov        r9d, dword ptr [rsp]
0154e 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
01556 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0155b 4c890424                       mov        qword ptr [rsp], r8
0155f 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01564 4c89442408                     mov        qword ptr [rsp + 8], r8
01569 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0156e 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01576 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0157b 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01580 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01585 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0158a 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0158f 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01594 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01599 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0159e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015a3 4489542430                     mov        dword ptr [rsp + 0x30], r10d
015a8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
015ad 4c89542438                     mov        qword ptr [rsp + 0x38], r10
015b2 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
015b7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
015bc 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
015c1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
015c6 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
015cb 4489542448                     mov        dword ptr [rsp + 0x48], r10d
015d0 89442450                       mov        dword ptr [rsp + 0x50], eax
015d4 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
015d9 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
015de 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
015e3 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
015e9 666690                         nop        
015ec c5f877                         vzeroupper 
015ef e8ec6db5ff                     call       0x7f53eb9c3660
015f4 0f1f8400ec160008               nop        dword ptr [rax + rax + 0x80016ec]
015fc bee4ffffff                     mov        esi, 0xffffffe4
01601 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01606 448b1c24                       mov        r11d, dword ptr [rsp]
0160a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01612 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01617 4c891424                       mov        qword ptr [rsp], r10
0161b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01620 4c89542408                     mov        qword ptr [rsp + 8], r10
01625 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0162a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01632 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01637 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0163c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01641 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01646 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0164b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01650 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01655 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0165a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0165f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01664 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01669 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0166e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01673 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01678 4489742458                     mov        dword ptr [rsp + 0x58], r14d
0167d 666690                         nop        
01680 c5f877                         vzeroupper 
01683 e8586db5ff                     call       0x7f53eb9c3660
01688 0f1f840080170009               nop        dword ptr [rax + rax + 0x9001780]
01690 be45ffffff                     mov        esi, 0xffffff45
01695 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0169a 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
016a2 6690                           nop        
016a4 c5f877                         vzeroupper 
016a7 e8346db5ff                     call       0x7f53eb9c3660
016ac 0f1f8400a417000a               nop        dword ptr [rax + rax + 0xa0017a4]
016b4 be45ffffff                     mov        esi, 0xffffff45
016b9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016be 448b0424                       mov        r8d, dword ptr [rsp]
016c2 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
016ca 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
016cf 4c891c24                       mov        qword ptr [rsp], r11
016d3 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
016d8 4c895c2408                     mov        qword ptr [rsp + 8], r11
016dd 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
016e2 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
016ea 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
016ef 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
016f4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016f9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
016fe 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01703 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01708 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0170d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01712 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01717 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0171c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01721 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01726 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0172b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01730 89442450                       mov        dword ptr [rsp + 0x50], eax
01734 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01738 c5f877                         vzeroupper 
0173b e8a06cb5ff                     call       0x7f53eb9c3660
01740 0f1f84003818000b               nop        dword ptr [rax + rax + 0xb001838]
01748 493bd8                         cmp        rbx, r8
0174b bdffffffff                     mov        ebp, 0xffffffff
01750 7c08                           jl         0x7f53ebe6c9da
01752 400f95c5                       setne      bpl
01756 400fb6ed                       movzx      ebp, bpl
0175a be45ffffff                     mov        esi, 0xffffff45
0175f 48ff742408                     push       qword ptr [rsp + 8]
01764 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
0176c 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01771 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
01779 48ff742420                     push       qword ptr [rsp + 0x20]
0177e 488f442408                     pop        qword ptr [rsp + 8]
01783 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01788 44894c2404                     mov        dword ptr [rsp + 4], r9d
0178d 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01792 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01797 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0179c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
017a1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
017a6 89442458                       mov        dword ptr [rsp + 0x58], eax
017aa 4c89442468                     mov        qword ptr [rsp + 0x68], r8
017af 90                             nop        
017b0 c5f877                         vzeroupper 
017b3 e8286cb5ff                     call       0x7f53eb9c3660
017b8 0f1f8400b018000c               nop        dword ptr [rax + rax + 0xc0018b0]
017c0 be45ffffff                     mov        esi, 0xffffff45
017c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ca 448b1c24                       mov        r11d, dword ptr [rsp]
017ce 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
017d6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
017db 4c891c24                       mov        qword ptr [rsp], r11
017df 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
017e4 4c895c2408                     mov        qword ptr [rsp + 8], r11
017e9 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
017ee 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
017f6 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
017fb 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01800 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01805 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0180a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0180f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01814 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01819 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0181e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01823 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01828 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0182d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01832 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01837 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0183c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01841 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01846 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0184b 89442450                       mov        dword ptr [rsp + 0x50], eax
0184f 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
01854 c5f877                         vzeroupper 
01857 e8846bb5ff                     call       0x7f53eb9c3660
0185c 0f1f84005419000d               nop        dword ptr [rax + rax + 0xd001954]
01864 be45ffffff                     mov        esi, 0xffffff45
01869 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0186e 448b0424                       mov        r8d, dword ptr [rsp]
01872 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
0187a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0187f 4c891c24                       mov        qword ptr [rsp], r11
01883 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01888 4c895c2408                     mov        qword ptr [rsp + 8], r11
0188d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01892 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0189a 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0189f 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
018a4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
018a9 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018ae 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
018b3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018b8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018bd 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018c2 4489542430                     mov        dword ptr [rsp + 0x30], r10d
018c7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018cc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018d1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
018d6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018db 89442450                       mov        dword ptr [rsp + 0x50], eax
018df 90                             nop        
018e0 c5f877                         vzeroupper 
018e3 e8f86ab5ff                     call       0x7f53eb9c3660
018e8 0f1f8400e019000e               nop        dword ptr [rax + rax + 0xe0019e0]
018f0 bee4ffffff                     mov        esi, 0xffffffe4
018f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018fa 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018ff 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01907 448b1424                       mov        r10d, dword ptr [rsp]
0190b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01913 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01918 4c891424                       mov        qword ptr [rsp], r10
0191c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01921 4c89542408                     mov        qword ptr [rsp + 8], r10
01926 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0192b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01933 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01938 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0193d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01942 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01947 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0194c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01951 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01956 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0195b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01960 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01965 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0196a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0196f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01974 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01979 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0197e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01983 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01988 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0198d 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
01992 6690                           nop        
01994 c5f877                         vzeroupper 
01997 e8446ab5ff                     call       0x7f53eb9c3660
0199c 0f1f8400941a000f               nop        dword ptr [rax + rax + 0xf001a94]
019a4 bee4ffffff                     mov        esi, 0xffffffe4
019a9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019ae 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
019b3 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
019bb 448b1c24                       mov        r11d, dword ptr [rsp]
019bf 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
019c7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019cc 4c891424                       mov        qword ptr [rsp], r10
019d0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019d5 4c89542408                     mov        qword ptr [rsp + 8], r10
019da 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
019df 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
019e7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019ec 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019f1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019f6 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019fb 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01a00 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a05 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a0a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a0f 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a14 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01a19 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a1e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a23 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a28 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a2d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a32 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a37 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a3c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a41 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01a46 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01a4b 90                             nop        
01a4c c5f877                         vzeroupper 
01a4f e88c69b5ff                     call       0x7f53eb9c3660
01a54 0f1f84004c1b0010               nop        dword ptr [rax + rax + 0x10001b4c]
01a5c 4183c608                       add        r14d, 8
01a60 be6effffff                     mov        esi, 0xffffff6e
01a65 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a6a 448b0424                       mov        r8d, dword ptr [rsp]
01a6e 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01a76 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01a7b 4c891c24                       mov        qword ptr [rsp], r11
01a7f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a84 4c895c2408                     mov        qword ptr [rsp + 8], r11
01a89 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01a8e 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01a96 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01a9b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01aa0 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01aa5 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01aaa 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01aaf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ab4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ab9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01abe 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ac3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ac8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01acd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ad2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ad7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01adc 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ae1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01ae6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01aeb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01af3 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01af8 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01afd 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01b02 6690                           nop        
01b04 c5f877                         vzeroupper 
01b07 e8d468b5ff                     call       0x7f53eb9c3660
01b0c 0f1f8400041c0011               nop        dword ptr [rax + rax + 0x11001c04]
01b14 4183c608                       add        r14d, 8
01b18 be66ffffff                     mov        esi, 0xffffff66
01b1d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b22 448b1c24                       mov        r11d, dword ptr [rsp]
01b26 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b2e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01b33 4c891c24                       mov        qword ptr [rsp], r11
01b37 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b3c 4c895c2408                     mov        qword ptr [rsp + 8], r11
01b41 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b46 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01b4e 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01b53 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01b58 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01b5d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b62 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b67 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b6c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b71 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b76 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b7b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b80 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b85 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b8a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b8f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01b94 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01b99 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b9e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ba3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01bab 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01bb0 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01bb5 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01bba 6690                           nop        
01bbc c5f877                         vzeroupper 
01bbf e81c68b5ff                     call       0x7f53eb9c3660
01bc4 0f1f8400bc1c0012               nop        dword ptr [rax + rax + 0x12001cbc]
01bcc beccffffff                     mov        esi, 0xffffffcc
01bd1 48ff742408                     push       qword ptr [rsp + 8]
01bd6 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01bde 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01be3 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01beb 48ff742420                     push       qword ptr [rsp + 0x20]
01bf0 488f442408                     pop        qword ptr [rsp + 8]
01bf5 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01bfa 4489542404                     mov        dword ptr [rsp + 4], r10d
01bff 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c09 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c0e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c13 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c18 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01c1d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c22 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01c27 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c2c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c31 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c36 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c3b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c40 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01c45 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c4a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01c4f 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01c54 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01c58 c5f877                         vzeroupper 
01c5b e88067b5ff                     call       0x7f53eb9c3660
01c60 0f1f8400581d0013               nop        dword ptr [rax + rax + 0x13001d58]
01c68 beccffffff                     mov        esi, 0xffffffcc
01c6d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01c72 448b1c24                       mov        r11d, dword ptr [rsp]
01c76 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01c7e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c83 4c891424                       mov        qword ptr [rsp], r10
01c87 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c8c 4c89542408                     mov        qword ptr [rsp + 8], r10
01c91 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c96 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01c9e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ca3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01ca8 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01cad 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01cb2 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01cb7 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01cbc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cc1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cc6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ccb 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cd0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01cd5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01cda 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01cdf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ce4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ce9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01cee 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01cf3 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01cf8 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
01d00 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01d05 4489742458                     mov        dword ptr [rsp + 0x58], r14d
01d0a 6690                           nop        
01d0c c5f877                         vzeroupper 
01d0f e8cc66b5ff                     call       0x7f53eb9c3660
01d14 0f1f84000c1e0014               nop        dword ptr [rax + rax + 0x14001e0c]
01d1c 4c8b4c2440                     mov        r9, qword ptr [rsp + 0x40]
01d21 4d3bd9                         cmp        r11, r9
01d24 bdffffffff                     mov        ebp, 0xffffffff
01d29 7c08                           jl         0x7f53ebe6cfb3
01d2b 400f95c5                       setne      bpl
01d2f 400fb6ed                       movzx      ebp, bpl
01d33 be45ffffff                     mov        esi, 0xffffff45
01d38 48ff742408                     push       qword ptr [rsp + 8]
01d3d 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01d45 48ff742420                     push       qword ptr [rsp + 0x20]
01d4a 488f442408                     pop        qword ptr [rsp + 8]
01d4f 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01d54 44894c2404                     mov        dword ptr [rsp + 4], r9d
01d59 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01d5e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d63 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01d68 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d6d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d72 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d77 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d7c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01d81 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d86 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01d8b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01d90 89442454                       mov        dword ptr [rsp + 0x54], eax
01d94 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01d99 666690                         nop        
01d9c c5f877                         vzeroupper 
01d9f e83c66b5ff                     call       0x7f53eb9c3660
01da4 0f1f84009c1e0015               nop        dword ptr [rax + rax + 0x15001e9c]
01dac 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01db1 493bdb                         cmp        rbx, r11
01db4 bdffffffff                     mov        ebp, 0xffffffff
01db9 7c08                           jl         0x7f53ebe6d043
01dbb 400f95c5                       setne      bpl
01dbf 400fb6ed                       movzx      ebp, bpl
01dc3 be45ffffff                     mov        esi, 0xffffff45
01dc8 48ff742408                     push       qword ptr [rsp + 8]
01dcd 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01dd5 48ff742420                     push       qword ptr [rsp + 0x20]
01dda 488f442408                     pop        qword ptr [rsp + 8]
01ddf 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01de4 44894c2404                     mov        dword ptr [rsp + 4], r9d
01de9 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01dee 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01df3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01df8 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01dfd 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e02 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01e07 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e0c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01e11 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e16 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01e1b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01e20 89442454                       mov        dword ptr [rsp + 0x54], eax
01e24 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01e29 666690                         nop        
01e2c c5f877                         vzeroupper 
01e2f e8ac65b5ff                     call       0x7f53eb9c3660
01e34 0f1f84002c1f0016               nop        dword ptr [rax + rax + 0x16001f2c]
01e3c 458bd9                         mov        r11d, r9d
01e3f 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
01e47 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01e4c 4f8b541808                     mov        r10, qword ptr [r8 + r11 + 8]
01e51 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01e59 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e5e 4f89540308                     mov        qword ptr [r11 + r8 + 8], r10
01e63 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01e6b 4183c308                       add        r11d, 8
01e6f 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01e77 443bdb                         cmp        r11d, ebx
01e7a 7cc0                           jl         0x7f53ebe6d0bc
01e7c 443bde                         cmp        r11d, esi
01e7f 0f8da7000000                   jge        0x7f53ebe6d1ac
01e85 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01e8d 666690                         nop        
01e90 458bd9                         mov        r11d, r9d
01e93 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
01e9b 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01ea3 4963c8                         movsxd     rcx, r8d
01ea6 458bd3                         mov        r10d, r11d
01ea9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01eae 4f8b541008                     mov        r10, qword ptr [r8 + r10 + 8]
01eb3 4d63db                         movsxd     r11, r11d
01eb6 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
01ebe 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
01ec2 4e89540708                     mov        qword ptr [rdi + r8 + 8], r10
01ec7 4e8b541f10                     mov        r10, qword ptr [rdi + r11 + 0x10]
01ecc 8bdf                           mov        ebx, edi
01ece 4c89540b10                     mov        qword ptr [rbx + rcx + 0x10], r10
01ed3 4e8b541b18                     mov        r10, qword ptr [rbx + r11 + 0x18]
01ed8 4c89540b18                     mov        qword ptr [rbx + rcx + 0x18], r10
01edd 4e8b541b20                     mov        r10, qword ptr [rbx + r11 + 0x20]
01ee2 4c89540b20                     mov        qword ptr [rbx + rcx + 0x20], r10
01ee7 4e8b541b28                     mov        r10, qword ptr [rbx + r11 + 0x28]
01eec 4c89540b28                     mov        qword ptr [rbx + rcx + 0x28], r10
01ef1 4e8b541b30                     mov        r10, qword ptr [rbx + r11 + 0x30]
01ef6 4c89540b30                     mov        qword ptr [rbx + rcx + 0x30], r10
01efb 4e8b541b38                     mov        r10, qword ptr [rbx + r11 + 0x38]
01f00 4c89540b38                     mov        qword ptr [rbx + rcx + 0x38], r10
01f05 4e8b541b40                     mov        r10, qword ptr [rbx + r11 + 0x40]
01f0a 4c89540b40                     mov        qword ptr [rbx + rcx + 0x40], r10
01f0f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01f17 4183c240                       add        r10d, 0x40
01f1b 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
01f23 443bd6                         cmp        r10d, esi
01f26 0f8c64ffffff                   jl         0x7f53ebe6d110
01f2c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01f34 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
01f3c 0f8d25f5ffff                   jge        0x7f53ebe6c6e7
01f42 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
01f4a 6690                           nop        
01f4c 478d0419                       lea        r8d, [r9 + r11]
01f50 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f55 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
01f5a 418bcb                         mov        ecx, r11d
01f5d 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01f61 4c89540b08                     mov        qword ptr [rbx + rcx + 8], r10
01f66 458d5308                       lea        r10d, [r11 + 8]
01f6a 458bda                         mov        r11d, r10d
01f6d 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
01f75 7cd5                           jl         0x7f53ebe6d1cc
01f77 e9ebf4ffff                     jmp        0x7f53ebe6c6e7
01f7c bee4ffffff                     mov        esi, 0xffffffe4
01f81 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f86 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01f8b 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01f93 448b0424                       mov        r8d, dword ptr [rsp]
01f97 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01f9f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01fa4 4c891c24                       mov        qword ptr [rsp], r11
01fa8 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01fad 4c895c2408                     mov        qword ptr [rsp + 8], r11
01fb2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01fb7 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01fbf 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01fc4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01fc9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fce 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01fd3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fd8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fdd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fe2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fe7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01fec 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ff1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ff6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ffb 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02000 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02005 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0200a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0200f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02014 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02019 89442450                       mov        dword ptr [rsp + 0x50], eax
0201d 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02021 666690                         nop        
02024 c5f877                         vzeroupper 
02027 e8b463b5ff                     call       0x7f53eb9c3660
0202c 0f1f840024210017               nop        dword ptr [rax + rax + 0x17002124]
02034 85db                           test       ebx, ebx
02036 0f846c0d0000                   je         0x7f53ebe6e028
0203c 448b1c24                       mov        r11d, dword ptr [rsp]
02040 458bca                         mov        r9d, r10d
02043 4533d2                         xor        r10d, r10d
02046 458bc3                         mov        r8d, r11d
02049 e983efffff                     jmp        0x7f53ebe6c251
0204e be6effffff                     mov        esi, 0xffffff6e
02053 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02058 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
0205d 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02065 448b0424                       mov        r8d, dword ptr [rsp]
02069 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
02071 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02076 4c891c24                       mov        qword ptr [rsp], r11
0207a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0207f 4c895c2408                     mov        qword ptr [rsp + 8], r11
02084 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02089 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02091 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02096 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0209b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
020a0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
020a5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
020aa 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
020af 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
020b4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
020b9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
020be 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
020c3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
020c8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
020cd 4489542434                     mov        dword ptr [rsp + 0x34], r10d
020d2 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020d7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
020dc 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
020e1 89442450                       mov        dword ptr [rsp + 0x50], eax
020e5 894c2460                       mov        dword ptr [rsp + 0x60], ecx
020e9 895c2468                       mov        dword ptr [rsp + 0x68], ebx
020ed 666690                         nop        
020f0 c5f877                         vzeroupper 
020f3 e8e862b5ff                     call       0x7f53eb9c3660
020f8 0f1f8400f0210018               nop        dword ptr [rax + rax + 0x180021f0]
02100 be45ffffff                     mov        esi, 0xffffff45
02105 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0210a 448b0424                       mov        r8d, dword ptr [rsp]
0210e 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
02116 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0211b 4c891c24                       mov        qword ptr [rsp], r11
0211f 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02124 4c895c2408                     mov        qword ptr [rsp + 8], r11
02129 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0212e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02136 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0213b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02140 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02145 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0214a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0214f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02154 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02159 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0215e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02163 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02168 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0216d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02172 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02177 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0217c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02181 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02186 89442450                       mov        dword ptr [rsp + 0x50], eax
0218a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0218e 6690                           nop        
02190 c5f877                         vzeroupper 
02193 e84862b5ff                     call       0x7f53eb9c3660
02198 0f1f840090220019               nop        dword ptr [rax + rax + 0x19002290]
021a0 be3dffffff                     mov        esi, 0xffffff3d
021a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
021aa 448b0424                       mov        r8d, dword ptr [rsp]
021ae 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
021b6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
021bb 4c891c24                       mov        qword ptr [rsp], r11
021bf 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
021c4 4c895c2408                     mov        qword ptr [rsp + 8], r11
021c9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
021ce 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
021d6 4489542420                     mov        dword ptr [rsp + 0x20], r10d
021db 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
021e0 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
021e5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
021ea 4c89542428                     mov        qword ptr [rsp + 0x28], r10
021ef 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
021f4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
021f9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
021fe 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02203 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02208 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0220d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02212 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02217 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0221c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02221 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02226 89442450                       mov        dword ptr [rsp + 0x50], eax
0222a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0222e 6690                           nop        
02230 c5f877                         vzeroupper 
02233 e8a861b5ff                     call       0x7f53eb9c3660
02238 0f1f84003023001a               nop        dword ptr [rax + rax + 0x1a002330]
02240 bee4ffffff                     mov        esi, 0xffffffe4
02245 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0224a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0224f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02257 448b1424                       mov        r10d, dword ptr [rsp]
0225b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02263 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02268 4c891424                       mov        qword ptr [rsp], r10
0226c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02271 4c89542408                     mov        qword ptr [rsp + 8], r10
02276 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0227b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02283 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02288 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0228d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02292 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02297 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0229c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
022a1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
022a6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
022ab 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
022b0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
022b5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
022ba 4c89542438                     mov        qword ptr [rsp + 0x38], r10
022bf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
022c4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
022c9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
022ce 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
022d3 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
022d8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
022dd 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
022e2 6690                           nop        
022e4 c5f877                         vzeroupper 
022e7 e8f460b5ff                     call       0x7f53eb9c3660
022ec 0f1f8400e423001b               nop        dword ptr [rax + rax + 0x1b0023e4]
022f4 bee4ffffff                     mov        esi, 0xffffffe4
022f9 48ff742408                     push       qword ptr [rsp + 8]
022fe 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02306 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0230b 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02313 48ff742420                     push       qword ptr [rsp + 0x20]
02318 488f442408                     pop        qword ptr [rsp + 8]
0231d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02322 44895c2404                     mov        dword ptr [rsp + 4], r11d
02327 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0232c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02331 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02336 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0233b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02340 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02345 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0234a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0234f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02354 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02359 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0235e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02363 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02368 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0236d 4489442454                     mov        dword ptr [rsp + 0x54], r8d
02372 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02377 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0237c c5f877                         vzeroupper 
0237f e85c60b5ff                     call       0x7f53eb9c3660
02384 0f1f84007c24001c               nop        dword ptr [rax + rax + 0x1c00247c]
0238c 418d6e01                       lea        ebp, [r14 + 1]
02390 bee4ffffff                     mov        esi, 0xffffffe4
02395 48ff742408                     push       qword ptr [rsp + 8]
0239a 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
023a2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
023a7 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
023af 48ff742420                     push       qword ptr [rsp + 0x20]
023b4 488f442408                     pop        qword ptr [rsp + 8]
023b9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
023be 4489542404                     mov        dword ptr [rsp + 4], r10d
023c3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
023c8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023cd 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
023d2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
023d7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023dc 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
023e1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023e6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023eb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
023f0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023f5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
023fa 4489542448                     mov        dword ptr [rsp + 0x48], r10d
023ff 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02404 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02409 4489442454                     mov        dword ptr [rsp + 0x54], r8d
0240e 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02413 4489442468                     mov        dword ptr [rsp + 0x68], r8d
02418 c5f877                         vzeroupper 
0241b e8c05fb5ff                     call       0x7f53eb9c3660
02420 0f1f84001825001d               nop        dword ptr [rax + rax + 0x1d002518]
02428 bee4ffffff                     mov        esi, 0xffffffe4
0242d 48ff742408                     push       qword ptr [rsp + 8]
02432 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
0243a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0243f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02447 48ff742420                     push       qword ptr [rsp + 0x20]
0244c 488f442408                     pop        qword ptr [rsp + 8]
02451 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02456 44895c2404                     mov        dword ptr [rsp + 4], r11d
0245b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02460 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02465 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0246a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0246f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02474 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02479 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0247e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02483 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02488 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0248d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02492 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02497 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0249c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
024a1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
024a6 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
024ab 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
024b0 c5f877                         vzeroupper 
024b3 e8285fb5ff                     call       0x7f53eb9c3660
024b8 0f1f8400b025001e               nop        dword ptr [rax + rax + 0x1e0025b0]
024c0 bee4ffffff                     mov        esi, 0xffffffe4
024c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
024ca 448b1c24                       mov        r11d, dword ptr [rsp]
024ce 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
024d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024db 4c891424                       mov        qword ptr [rsp], r10
024df 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024e4 4c89542408                     mov        qword ptr [rsp + 8], r10
024e9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
024ee 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
024f6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
024fb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02500 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02505 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0250a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0250f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02514 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02519 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0251e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02523 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02528 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0252d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02532 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02537 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0253c 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
02540 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02545 666690                         nop        
02548 c5f877                         vzeroupper 
0254b e8905eb5ff                     call       0x7f53eb9c3660
02550 0f1f84004826001f               nop        dword ptr [rax + rax + 0x1f002648]
02558 beccffffff                     mov        esi, 0xffffffcc
0255d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02562 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02567 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0256f 448b1424                       mov        r10d, dword ptr [rsp]
02573 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0257b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02580 4c891424                       mov        qword ptr [rsp], r10
02584 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02589 4c89542408                     mov        qword ptr [rsp + 8], r10
0258e 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02593 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0259b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
025a0 4c89542410                     mov        qword ptr [rsp + 0x10], r10
025a5 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
025aa 4489542420                     mov        dword ptr [rsp + 0x20], r10d
025af 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
025b4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
025b9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
025be 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
025c3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
025c8 4c89542430                     mov        qword ptr [rsp + 0x30], r10
025cd 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
025d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025d7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
025dc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
025e1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
025e6 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
025eb 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
025f0 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
025f5 4489742460                     mov        dword ptr [rsp + 0x60], r14d
025fa 6690                           nop        
025fc c5f877                         vzeroupper 
025ff e8dc5db5ff                     call       0x7f53eb9c3660
02604 0f1f8400fc260020               nop        dword ptr [rax + rax + 0x200026fc]
0260c be45ffffff                     mov        esi, 0xffffff45
02611 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02616 448b1c24                       mov        r11d, dword ptr [rsp]
0261a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02622 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02627 4c891424                       mov        qword ptr [rsp], r10
0262b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02630 4c89542408                     mov        qword ptr [rsp + 8], r10
02635 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0263a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02642 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02647 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0264c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02651 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02656 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0265b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02660 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02665 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0266a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0266f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02674 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02679 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0267e 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02683 90                             nop        
02684 c5f877                         vzeroupper 
02687 e8545db5ff                     call       0x7f53eb9c3660
0268c 0f1f840084270021               nop        dword ptr [rax + rax + 0x21002784]
02694 be17000000                     mov        esi, 0x17
02699 666690                         nop        
0269c c5f877                         vzeroupper 
0269f e83c5db5ff                     call       0x7f53eb9c3660
026a4 0f1f84009c270022               nop        dword ptr [rax + rax + 0x2200279c]
026ac be6effffff                     mov        esi, 0xffffff6e
026b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
026b6 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
026be 4c895c2408                     mov        qword ptr [rsp + 8], r11
026c3 895c2418                       mov        dword ptr [rsp + 0x18], ebx
026c7 48894424f8                     mov        qword ptr [rsp - 8], rax
026cc 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
026d0 89442420                       mov        dword ptr [rsp + 0x20], eax
026d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
026d9 48ff742430                     push       qword ptr [rsp + 0x30]
026de 488f442428                     pop        qword ptr [rsp + 0x28]
026e3 89542424                       mov        dword ptr [rsp + 0x24], edx
026e7 4c89442430                     mov        qword ptr [rsp + 0x30], r8
026ec 48ff742448                     push       qword ptr [rsp + 0x48]
026f1 488f442438                     pop        qword ptr [rsp + 0x38]
026f6 894c2440                       mov        dword ptr [rsp + 0x40], ecx
026fa 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
026ff 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02704 c5f877                         vzeroupper 
02707 e8d45cb5ff                     call       0x7f53eb9c3660
0270c 0f1f840004280023               nop        dword ptr [rax + rax + 0x23002804]
02714 bebeffffff                     mov        esi, 0xffffffbe
02719 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0271e 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02726 8b3c24                         mov        edi, dword ptr [rsp]
02729 89bc24e8000000                 mov        dword ptr [rsp + 0xe8], edi
02730 4c891c24                       mov        qword ptr [rsp], r11
02734 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02739 4c89542408                     mov        qword ptr [rsp + 8], r10
0273e 4889442410                     mov        qword ptr [rsp + 0x10], rax
02743 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02747 48894424f8                     mov        qword ptr [rsp - 8], rax
0274c 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02750 89442420                       mov        dword ptr [rsp + 0x20], eax
02754 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02759 48ff742430                     push       qword ptr [rsp + 0x30]
0275e 488f442428                     pop        qword ptr [rsp + 0x28]
02763 89542424                       mov        dword ptr [rsp + 0x24], edx
02767 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0276c 48ff742448                     push       qword ptr [rsp + 0x48]
02771 488f442438                     pop        qword ptr [rsp + 0x38]
02776 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0277a 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0277f 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02784 c5f877                         vzeroupper 
02787 e8545cb5ff                     call       0x7f53eb9c3660
0278c 0f1f840084280024               nop        dword ptr [rax + rax + 0x24002884]
02794 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
02799 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
0279d 458bd9                         mov        r11d, r9d
027a0 beccffffff                     mov        esi, 0xffffffcc
027a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027aa 4c89b424e8000000               mov        qword ptr [rsp + 0xe8], r14
027b2 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
027ba 891c24                         mov        dword ptr [rsp], ebx
027bd 44895c2404                     mov        dword ptr [rsp + 4], r11d
027c2 448944240c                     mov        dword ptr [rsp + 0xc], r8d
027c7 90                             nop        
027c8 c5f877                         vzeroupper 
027cb e8105cb5ff                     call       0x7f53eb9c3660
027d0 0f1f8400c8280025               nop        dword ptr [rax + rax + 0x250028c8]
027d8 bee4ffffff                     mov        esi, 0xffffffe4
027dd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027e2 448b1c24                       mov        r11d, dword ptr [rsp]
027e6 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
027ee 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
027f3 4c891c24                       mov        qword ptr [rsp], r11
027f7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
027fc 4c895c2408                     mov        qword ptr [rsp + 8], r11
02801 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02806 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0280e 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02813 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02818 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0281d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02822 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02827 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0282c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02831 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02836 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0283b 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02840 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02845 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0284a 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0284f 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02854 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02859 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
0285e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02863 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02868 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0286c 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02871 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02876 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0287b 90                             nop        
0287c c5f877                         vzeroupper 
0287f e85c5bb5ff                     call       0x7f53eb9c3660
02884 0f1f84007c290026               nop        dword ptr [rax + rax + 0x2600297c]
0288c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
02895 bee4ffffff                     mov        esi, 0xffffffe4
0289a 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0289f 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
028a7 448b0424                       mov        r8d, dword ptr [rsp]
028ab 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
028b3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
028b8 4c891c24                       mov        qword ptr [rsp], r11
028bc 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
028c1 4c895c2408                     mov        qword ptr [rsp + 8], r11
028c6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028cb 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
028d3 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
028d8 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
028dd 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
028e2 4489442418                     mov        dword ptr [rsp + 0x18], r8d
028e7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
028ec 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028f1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
028f6 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
028fb 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
02900 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02905 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0290a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0290f 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02914 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02919 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0291e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02923 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02928 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0292d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02931 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
02936 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0293b 90                             nop        
0293c c5f877                         vzeroupper 
0293f e89c5ab5ff                     call       0x7f53eb9c3660
02944 0f1f84003c2a0027               nop        dword ptr [rax + rax + 0x27002a3c]
0294c 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
02954 beccffffff                     mov        esi, 0xffffffcc
02959 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0295e 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
02963 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
0296b 448b0c24                       mov        r9d, dword ptr [rsp]
0296f 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
02977 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0297c 4c890424                       mov        qword ptr [rsp], r8
02980 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
02985 4c89442408                     mov        qword ptr [rsp + 8], r8
0298a 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0298f 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
02997 4c8b442458                     mov        r8, qword ptr [rsp + 0x58]
0299c 4c89442410                     mov        qword ptr [rsp + 0x10], r8
029a1 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
029a6 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
029ab 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
029b0 4489442424                     mov        dword ptr [rsp + 0x24], r8d
029b5 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
029ba 4c89442428                     mov        qword ptr [rsp + 0x28], r8
029bf 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
029c4 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
029c9 4c8b442440                     mov        r8, qword ptr [rsp + 0x40]
029ce 4c89442438                     mov        qword ptr [rsp + 0x38], r8
029d3 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
029d8 4c89442440                     mov        qword ptr [rsp + 0x40], r8
029dd 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
029e2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
029e7 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
029ec 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
029f1 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
029f6 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
029fb 89442470                       mov        dword ptr [rsp + 0x70], eax
029ff 90                             nop        
02a00 c5f877                         vzeroupper 
02a03 e8d859b5ff                     call       0x7f53eb9c3660
02a08 0f1f8400002b0028               nop        dword ptr [rax + rax + 0x28002b00]
02a10 418bea                         mov        ebp, r10d
02a13 83c510                         add        ebp, 0x10
02a16 be6effffff                     mov        esi, 0xffffff6e
02a1b 48ff742408                     push       qword ptr [rsp + 8]
02a20 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02a28 48ff742420                     push       qword ptr [rsp + 0x20]
02a2d 488f442408                     pop        qword ptr [rsp + 8]
02a32 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02a37 4489442404                     mov        dword ptr [rsp + 4], r8d
02a3c 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02a41 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02a46 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02a4b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02a50 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02a55 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02a5a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02a5f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a64 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a69 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02a6e 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02a73 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02a78 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02a7d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02a82 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02a87 89442454                       mov        dword ptr [rsp + 0x54], eax
02a8b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
02a90 c5f877                         vzeroupper 
02a93 e84859b5ff                     call       0x7f53eb9c3660
02a98 0f1f8400902b0029               nop        dword ptr [rax + rax + 0x29002b90]
02aa0 418bea                         mov        ebp, r10d
02aa3 83c510                         add        ebp, 0x10
02aa6 be66ffffff                     mov        esi, 0xffffff66
02aab 48ff742408                     push       qword ptr [rsp + 8]
02ab0 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02ab8 48ff742420                     push       qword ptr [rsp + 0x20]
02abd 488f442408                     pop        qword ptr [rsp + 8]
02ac2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ac7 44895c2404                     mov        dword ptr [rsp + 4], r11d
02acc 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02ad1 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02ad6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02adb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02ae0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02ae5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02aea 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02aef 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02af4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02af9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02afe 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02b03 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02b08 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02b0d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b12 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02b17 89442454                       mov        dword ptr [rsp + 0x54], eax
02b1b 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
02b20 c5f877                         vzeroupper 
02b23 e8b858b5ff                     call       0x7f53eb9c3660
02b28 0f1f8400202c002a               nop        dword ptr [rax + rax + 0x2a002c20]
02b30 bee4ffffff                     mov        esi, 0xffffffe4
02b35 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b3a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02b3f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02b47 448b1c24                       mov        r11d, dword ptr [rsp]
02b4b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02b53 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b58 4c891424                       mov        qword ptr [rsp], r10
02b5c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b61 4c89542408                     mov        qword ptr [rsp + 8], r10
02b66 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b6b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02b73 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02b78 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b7d 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02b82 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02b87 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02b8c 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b91 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02b96 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02b9b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02ba0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02ba5 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02baa 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02baf 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02bb4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02bb9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02bbe 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02bc3 4489442458                     mov        dword ptr [rsp + 0x58], r8d
02bc8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
02bcd 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02bd2 6690                           nop        
02bd4 c5f877                         vzeroupper 
02bd7 e80458b5ff                     call       0x7f53eb9c3660
02bdc 0f1f8400d42c002b               nop        dword ptr [rax + rax + 0x2b002cd4]
02be4 bee4ffffff                     mov        esi, 0xffffffe4
02be9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02bee 448b1424                       mov        r10d, dword ptr [rsp]
02bf2 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02bfa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02bff 4c891424                       mov        qword ptr [rsp], r10
02c03 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c08 4c89542408                     mov        qword ptr [rsp + 8], r10
02c0d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02c12 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02c1a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02c1f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c24 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02c29 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02c2e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02c33 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02c38 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02c3d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c42 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02c47 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02c4c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c51 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c56 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02c5b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c60 c5f877                         vzeroupper 
02c63 e87857b5ff                     call       0x7f53eb9c3660
02c68 0f1f8400602d002c               nop        dword ptr [rax + rax + 0x2c002d60]
02c70 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
02c78 4183c308                       add        r11d, 8
02c7c 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02c81 be6effffff                     mov        esi, 0xffffff6e
02c86 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c8b 448b1424                       mov        r10d, dword ptr [rsp]
02c8f 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02c97 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c9c 4c891424                       mov        qword ptr [rsp], r10
02ca0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02ca5 4c89542408                     mov        qword ptr [rsp + 8], r10
02caa 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02caf 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02cb7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02cbc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02cc1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02cc6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ccb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02cd0 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02cd5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02cda 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02cdf 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02ce4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02ce9 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02cf1 458bda                         mov        r11d, r10d
02cf4 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02cf9 666690                         nop        
02cfc c5f877                         vzeroupper 
02cff e8dc56b5ff                     call       0x7f53eb9c3660
02d04 0f1f8400fc2d002d               nop        dword ptr [rax + rax + 0x2d002dfc]
02d0c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
02d14 4183c208                       add        r10d, 8
02d18 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02d1d be66ffffff                     mov        esi, 0xffffff66
02d22 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d27 448b1424                       mov        r10d, dword ptr [rsp]
02d2b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02d33 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d38 4c891424                       mov        qword ptr [rsp], r10
02d3c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d41 4c89542408                     mov        qword ptr [rsp + 8], r10
02d46 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02d4b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02d53 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02d58 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02d5d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02d62 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d67 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02d6c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02d71 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d76 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d7b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02d80 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02d85 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02d8d 458bda                         mov        r11d, r10d
02d90 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02d95 666690                         nop        
02d98 c5f877                         vzeroupper 
02d9b e84056b5ff                     call       0x7f53eb9c3660
02da0 0f1f8400982e002e               nop        dword ptr [rax + rax + 0x2e002e98]
02da8 bef6ffffff                     mov        esi, 0xfffffff6
02dad 498bee                         mov        rbp, r14
02db0 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02db8 c5f877                         vzeroupper 
02dbb e82056b5ff                     call       0x7f53eb9c3660
02dc0 0f1f8400b82e002f               nop        dword ptr [rax + rax + 0x2f002eb8]
02dc8 488bf0                         mov        rsi, rax
02dcb eb0d                           jmp        0x7f53ebe6e05a
02dcd 488bf0                         mov        rsi, rax
02dd0 eb08                           jmp        0x7f53ebe6e05a
02dd2 488bf0                         mov        rsi, rax
02dd5 eb03                           jmp        0x7f53ebe6e05a
02dd7 488bf0                         mov        rsi, rax
02dda c5f877                         vzeroupper 
02ddd 4881c4d0000000                 add        rsp, 0xd0
02de4 5d                             pop        rbp
02de5 e976d0b5ff                     jmp        0x7f53eb9cb0e0
02dea bef6ffffff                     mov        esi, 0xfffffff6
02def 90                             nop        
02df0 c5f877                         vzeroupper 
02df3 e8e855b5ff                     call       0x7f53eb9c3660
02df8 0f1f8400f02e0030               nop        dword ptr [rax + rax + 0x30002ef0]
02e00 49bacbc2e6eb537f0000           movabs     r10, 0x7f53ebe6c2cb
02e0a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02e11 e94afea8ff                     jmp        0x7f53eb8fdee0
02e16 e805caa7ff                     call       0x7f53eb8eaaa0
02e1b e91ed2ffff                     jmp        0x7f53ebe6b2be
