00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ecd0000000                 sub        rsp, 0xd0
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85181d0000                   jne        0x7fef87e5c936
0001e 4889742438                     mov        qword ptr [rsp + 0x38], rsi
00023 448d5aff                       lea        r11d, [rdx - 1]
00027 8b4604                         mov        eax, dword ptr [rsi + 4]
0002a 443bd8                         cmp        r11d, eax
0002d 0f83270b0000                   jae        0x7fef87e5b75a
00033 440fb65c1607                   movzx      r11d, byte ptr [rsi + rdx + 7]
00039 4585db                         test       r11d, r11d
0003c 0f84b20c0000                   je         0x7fef87e5b8f4
00042 8bda                           mov        ebx, edx
00044 2bd9                           sub        ebx, ecx
00046 f3450fbdd3                     lzcnt      r10d, r11d
0004b 448d1cdd00000000               lea        r11d, [rbx*8]
00053 be1f000000                     mov        esi, 0x1f
00058 412bf2                         sub        esi, r10d
0005b 41ba08000000                   mov        r10d, 8
00061 442bd6                         sub        r10d, esi
00064 418beb                         mov        ebp, r11d
00067 412bea                         sub        ebp, r10d
0006a 83fb08                         cmp        ebx, 8
0006d 0f8d990c0000                   jge        0x7fef87e5b90c
00073 896c2428                       mov        dword ptr [rsp + 0x28], ebp
00077 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
0007e 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00083 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00088 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0008c 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00090 4863c9                         movsxd     rcx, ecx
00093 4863e8                         movsxd     rbp, eax
00096 85db                           test       ebx, ebx
00098 0f8fcb090000                   jg         0x7fef87e5b669
0009e 4533c0                         xor        r8d, r8d
000a1 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000a6 eb39                           jmp        0x7fef87e5ace1
000a8 49c1e508                       shl        r13, 8
000ac 448bc2                         mov        r8d, edx
000af 4403442440                     add        r8d, dword ptr [rsp + 0x40]
000b4 4c8b4c2438                     mov        r9, qword ptr [rsp + 0x38]
000b9 4f0fb64c0108                   movzx      r9, byte ptr [r9 + r8 + 8]
000bf 4d0bcd                         or         r9, r13
000c2 ffca                           dec        edx
000c4 83faff                         cmp        edx, -1
000c7 7e05                           jle        0x7fef87e5acce
000c9 4d8be9                         mov        r13, r9
000cc ebda                           jmp        0x7fef87e5aca8
000ce 41b840000000                   mov        r8d, 0x40
000d4 452bc3                         sub        r8d, r11d
000d7 c442b9f7c1                     shlx       r8, r9, r8
000dc 4c89442430                     mov        qword ptr [rsp + 0x30], r8
000e1 448d4bf8                       lea        r9d, [rbx - 8]
000e5 4183f908                       cmp        r9d, 8
000e9 0f8d5d0c0000                   jge        0x7fef87e5b94c
000ef 4585c9                         test       r9d, r9d
000f2 0f8f8c080000                   jg         0x7fef87e5b584
000f8 4533c0                         xor        r8d, r8d
000fb eb34                           jmp        0x7fef87e5ad31
000fd 48c1e208                       shl        rdx, 8
00101 448bcf                         mov        r9d, edi
00104 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
00109 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
0010e 4f0fb6440808                   movzx      r8, byte ptr [r8 + r9 + 8]
00114 4c0bc2                         or         r8, rdx
00117 ffcf                           dec        edi
00119 83ffff                         cmp        edi, -1
0011c 7e05                           jle        0x7fef87e5ad23
0011e 498bd0                         mov        rdx, r8
00121 ebda                           jmp        0x7fef87e5acfd
00123 41b980000000                   mov        r9d, 0x80
00129 452bcb                         sub        r9d, r11d
0012c c442b1f7c0                     shlx       r8, r8, r9
00131 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
00136 458b5918                       mov        r11d, dword ptr [r9 + 0x18]
0013a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0013f 4c89442448                     mov        qword ptr [rsp + 0x48], r8
00144 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00148 44891c24                       mov        dword ptr [rsp], r11d
0014c 458b591c                       mov        r11d, dword ptr [r9 + 0x1c]
00150 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00155 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00159 458b5920                       mov        r11d, dword ptr [r9 + 0x20]
0015d 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
00162 458b4304                       mov        r8d, dword ptr [r11 + 4]
00166 bb40000000                     mov        ebx, 0x40
0016b 412bda                         sub        ebx, r10d
0016e 448bc9                         mov        r9d, ecx
00171 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00176 45034b04                       add        r9d, dword ptr [r11 + 4]
0017a 4503c8                         add        r9d, r8d
0017d 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00182 4585c9                         test       r9d, r9d
00185 0f84f10b0000                   je         0x7fef87e5b97c
0018b 443bcb                         cmp        r9d, ebx
0018e 0f8f5c0c0000                   jg         0x7fef87e5b9f0
00194 412bd9                         sub        ebx, r9d
00197 c462e3f74c2430                 shrx       r9, qword ptr [rsp + 0x30], rbx
0019e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
001a3 4183fb40                       cmp        r11d, 0x40
001a7 0f8dc30c0000                   jge        0x7fef87e5ba70
001ad 458bd3                         mov        r10d, r11d
001b0 442bd6                         sub        r10d, esi
001b3 4183c208                       add        r10d, 8
001b7 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001bc 41bb01000000                   mov        r11d, 1
001c2 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
001c7 c442a9f7db                     shlx       r11, r11, r10
001cc 49ffcb                         dec        r11
001cf 4d23d9                         and        r11, r9
001d2 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
001d7 4183fa40                       cmp        r10d, 0x40
001db 0f8d170d0000                   jge        0x7fef87e5baf8
001e1 4183f820                       cmp        r8d, 0x20
001e5 0f8d790d0000                   jge        0x7fef87e5bb64
001eb c442bbf7cb                     shrx       r9, r11, r8
001f0 ba01000000                     mov        edx, 1
001f5 c46239f7d2                     shlx       r10d, edx, r8d
001fa 41ffca                         dec        r10d
001fd 4d63d2                         movsxd     r10, r10d
00200 4d23d3                         and        r10, r11
00203 458bd2                         mov        r10d, r10d
00206 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0020b 83f920                         cmp        ecx, 0x20
0020e 0f8de00d0000                   jge        0x7fef87e5bbf4
00214 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00219 458b5204                       mov        r10d, dword ptr [r10 + 4]
0021d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00222 448b1424                       mov        r10d, dword ptr [rsp]
00226 458b4204                       mov        r8d, dword ptr [r10 + 4]
0022a 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
0022f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00233 418bea                         mov        ebp, r10d
00236 418b7a04                       mov        edi, dword ptr [r10 + 4]
0023a 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
0023f 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
00243 418bc2                         mov        eax, r10d
00246 418b5a04                       mov        ebx, dword ptr [r10 + 4]
0024a 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00252 4585d2                         test       r10d, r10d
00255 0f8ee7060000                   jle        0x7fef87e5b542
0025b c46271f7d2                     shlx       r10d, edx, ecx
00260 c442f3f7d9                     shrx       r11, r9, rcx
00265 41ffca                         dec        r10d
00268 418bcb                         mov        ecx, r11d
0026b 898c249c000000                 mov        dword ptr [rsp + 0x9c], ecx
00272 4d63d2                         movsxd     r10, r10d
00275 4d23d1                         and        r10, r9
00278 458bd2                         mov        r10d, r10d
0027b 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00283 458d50ff                       lea        r10d, [r8 - 1]
00287 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0028f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00294 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
0029b 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
002a3 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
002a8 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
002af 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
002b7 448d5bff                       lea        r11d, [rbx - 1]
002bb 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
002c3 448d5fff                       lea        r11d, [rdi - 1]
002c7 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
002cf 4585c0                         test       r8d, r8d
002d2 0f86b4080000                   jbe        0x7fef87e5b78c
002d8 85ff                           test       edi, edi
002da 0f86ac080000                   jbe        0x7fef87e5b78c
002e0 85db                           test       ebx, ebx
002e2 0f86a4080000                   jbe        0x7fef87e5b78c
002e8 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
002f0 458b5204                       mov        r10d, dword ptr [r10 + 4]
002f4 4585d2                         test       r10d, r10d
002f7 0f868f080000                   jbe        0x7fef87e5b78c
002fd 4d63d2                         movsxd     r10, r10d
00300 4c639c2488000000               movsxd     r11, dword ptr [rsp + 0x88]
00308 49ffcb                         dec        r11
0030b 4d3bda                         cmp        r11, r10
0030e 0f8378080000                   jae        0x7fef87e5b78c
00314 4983fb01                       cmp        r11, 1
00318 41ba01000000                   mov        r10d, 1
0031e 4d0f4cda                       cmovl      r11, r10
00322 418bf3                         mov        esi, r11d
00325 3bb42488000000                 cmp        esi, dword ptr [rsp + 0x88]
0032c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00334 410f4ff3                       cmovg      esi, r11d
00338 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0033d 44239424ac000000               and        r10d, dword ptr [rsp + 0xac]
00345 418bca                         mov        ecx, r10d
00348 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00350 44239424b0000000               and        r10d, dword ptr [rsp + 0xb0]
00358 418bfa                         mov        edi, r10d
0035b 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00363 44239424a4000000               and        r10d, dword ptr [rsp + 0xa4]
0036b 4533db                         xor        r11d, r11d
0036e 4533c0                         xor        r8d, r8d
00371 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
00376 4489542404                     mov        dword ptr [rsp + 4], r10d
0037b 4c898424b8000000               mov        qword ptr [rsp + 0xb8], r8
00383 448b1424                       mov        r10d, dword ptr [rsp]
00387 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0038c 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00391 448b742464                     mov        r14d, dword ptr [rsp + 0x64]
00396 41ffc6                         inc        r14d
00399 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0039e 49c1ea20                       shr        r10, 0x20
003a2 458bd2                         mov        r10d, r10d
003a5 450fb6da                       movzx      r11d, r10b
003a9 8bd8                           mov        ebx, eax
003ab 4c8b54c808                     mov        r10, qword ptr [rax + rcx*8 + 8]
003b0 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
003b8 448bc5                         mov        r8d, ebp
003bb 448bcf                         mov        r9d, edi
003be 4c8b54fd08                     mov        r10, qword ptr [rbp + rdi*8 + 8]
003c3 4c89542470                     mov        qword ptr [rsp + 0x70], r10
003c8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
003d0 49c1ea20                       shr        r10, 0x20
003d4 418bfa                         mov        edi, r10d
003d7 440fb6d7                       movzx      r10d, dil
003db 488b7c2470                     mov        rdi, qword ptr [rsp + 0x70]
003e0 48c1ef20                       shr        rdi, 0x20
003e4 8bd7                           mov        edx, edi
003e6 440fb6ea                       movzx      r13d, dl
003ea 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
003f2 0f8c940c0000                   jl         0x7fef87e5bc8c
003f8 438d142a                       lea        edx, [r10 + r13]
003fc 4103d3                         add        edx, r11d
003ff 0f84770d0000                   je         0x7fef87e5bd7c
00405 83fa3f                         cmp        edx, 0x3f
00408 0f8f6a0e0000                   jg         0x7fef87e5be78
0040e b840000000                     mov        eax, 0x40
00413 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
00417 3bd0                           cmp        edx, eax
00419 0f8f550f0000                   jg         0x7fef87e5bf74
0041f 2bc2                           sub        eax, edx
00421 c4e2fbf77c2430                 shrx       rdi, qword ptr [rsp + 0x30], rax
00428 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
0042c 03c2                           add        eax, edx
0042e 8944247c                       mov        dword ptr [rsp + 0x7c], eax
00432 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00436 03c2                           add        eax, edx
00438 89442458                       mov        dword ptr [rsp + 0x58], eax
0043c b801000000                     mov        eax, 1
00441 c4e2e9f7d0                     shlx       rdx, rax, rdx
00446 48ffca                         dec        rdx
00449 4823fa                         and        rdi, rdx
0044c 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
00450 83fa40                         cmp        edx, 0x40
00453 0f8d1b100000                   jge        0x7fef87e5c074
00459 4183fb40                       cmp        r11d, 0x40
0045d 0f8de9100000                   jge        0x7fef87e5c14c
00463 c4e2a3f7d7                     shrx       rdx, rdi, r11
00468 c462a1f7d8                     shlx       r11, rax, r11
0046d 49ffcb                         dec        r11
00470 4c23df                         and        r11, rdi
00473 4183fa40                       cmp        r10d, 0x40
00477 0f8ddb110000                   jge        0x7fef87e5c258
0047d c4e2abf7c2                     shrx       rax, rdx, r10
00482 bf01000000                     mov        edi, 1
00487 c4e2a9f7ef                     shlx       rbp, rdi, r10
0048c 48ffcd                         dec        rbp
0048f 4823ea                         and        rbp, rdx
00492 4183fd40                       cmp        r13d, 0x40
00496 0f8d74120000                   jge        0x7fef87e5c310
0049c 41ba01000000                   mov        r10d, 1
004a2 c4c291f7fa                     shlx       rdi, r10, r13
004a7 458bd3                         mov        r10d, r11d
004aa 48ffcf                         dec        rdi
004ad 4823f8                         and        rdi, rax
004b0 448bdd                         mov        r11d, ebp
004b3 488b542470                     mov        rdx, qword ptr [rsp + 0x70]
004b8 8bd2                           mov        edx, edx
004ba 4803fa                         add        rdi, rdx
004bd 488b542468                     mov        rdx, qword ptr [rsp + 0x68]
004c2 8bd2                           mov        edx, edx
004c4 4403d2                         add        r10d, edx
004c7 488b942480000000               mov        rdx, qword ptr [rsp + 0x80]
004cf 8bc2                           mov        eax, edx
004d1 4403d8                         add        r11d, eax
004d4 4963c3                         movsxd     rax, r11d
004d7 488b9424b8000000               mov        rdx, qword ptr [rsp + 0xb8]
004df 4803d0                         add        rdx, rax
004e2 48899424b8000000               mov        qword ptr [rsp + 0xb8], rdx
004ea 4885ff                         test       rdi, rdi
004ed 0f8e32070000                   jle        0x7fef87e5b825
004f3 4881ffffffff7f                 cmp        rdi, 0x7fffffff
004fa 0f8fc0120000                   jg         0x7fef87e5c3c0
00500 4181faffff0100                 cmp        r10d, 0x1ffff
00507 0f8f87130000                   jg         0x7fef87e5c494
0050d 4181fbffff0300                 cmp        r11d, 0x3ffff
00514 0f8f3e140000                   jg         0x7fef87e5c558
0051a 8bd7                           mov        edx, edi
0051c 81fa00000010                   cmp        edx, 0x10000000
00522 0f83f4140000                   jae        0x7fef87e5c61c
00528 4d63d2                         movsxd     r10, r10d
0052b 48c1e012                       shl        rax, 0x12
0052f 4c63da                         movsxd     r11, edx
00532 49c1e324                       shl        r11, 0x24
00536 490bc3                         or         rax, r11
00539 490bc2                         or         rax, r10
0053c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00544 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00549 4b8944da08                     mov        qword ptr [r10 + r11*8 + 8], rax
0054e 443bf6                         cmp        r14d, esi
00551 7d12                           jge        0x7fef87e5b165
00553 4489742464                     mov        dword ptr [rsp + 0x64], r14d
00558 418be8                         mov        ebp, r8d
0055b 8bc3                           mov        eax, ebx
0055d 418bf9                         mov        edi, r9d
00560 e91efeffff                     jmp        0x7fef87e5af83
00565 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
0056d 0f8da1060000                   jge        0x7fef87e5b814
00573 41ffc3                         inc        r11d
00576 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
0057b 448b1424                       mov        r10d, dword ptr [rsp]
0057f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00584 4f8b5cda08                     mov        r11, qword ptr [r10 + r11*8 + 8]
00589 4c8b54cb08                     mov        r10, qword ptr [rbx + rcx*8 + 8]
0058e 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00593 49c1eb20                       shr        r11, 0x20
00597 458bdb                         mov        r11d, r11d
0059a 450fb6db                       movzx      r11d, r11b
0059e 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
005a6 49c1ea20                       shr        r10, 0x20
005aa 458bd2                         mov        r10d, r10d
005ad 450fb6d2                       movzx      r10d, r10b
005b1 4b8b7cc808                     mov        rdi, qword ptr [r8 + r9*8 + 8]
005b6 48897c2470                     mov        qword ptr [rsp + 0x70], rdi
005bb 48c1ef20                       shr        rdi, 0x20
005bf 8bff                           mov        edi, edi
005c1 440fb6ef                       movzx      r13d, dil
005c5 438d142a                       lea        edx, [r10 + r13]
005c9 4103d3                         add        edx, r11d
005cc 0f84aa0b0000                   je         0x7fef87e5bd7c
005d2 83fa3f                         cmp        edx, 0x3f
005d5 0f8f9d0c0000                   jg         0x7fef87e5be78
005db b840000000                     mov        eax, 0x40
005e0 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
005e4 3bd0                           cmp        edx, eax
005e6 0f8f880d0000                   jg         0x7fef87e5bf74
005ec 2bc2                           sub        eax, edx
005ee c4e2fbf77c2430                 shrx       rdi, qword ptr [rsp + 0x30], rax
005f5 be01000000                     mov        esi, 1
005fa c4e2e9f7f6                     shlx       rsi, rsi, rdx
005ff 48ffce                         dec        rsi
00602 4823fe                         and        rdi, rsi
00605 8b74247c                       mov        esi, dword ptr [rsp + 0x7c]
00609 03f2                           add        esi, edx
0060b 8974247c                       mov        dword ptr [rsp + 0x7c], esi
0060f 8b742458                       mov        esi, dword ptr [rsp + 0x58]
00613 03f2                           add        esi, edx
00615 89742458                       mov        dword ptr [rsp + 0x58], esi
00619 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
0061d 83fa40                         cmp        edx, 0x40
00620 0f8d4e0e0000                   jge        0x7fef87e5c074
00626 4183fb40                       cmp        r11d, 0x40
0062a 0f8d1c0f0000                   jge        0x7fef87e5c14c
00630 c4e2a3f7d7                     shrx       rdx, rdi, r11
00635 be01000000                     mov        esi, 1
0063a c462a1f7de                     shlx       r11, rsi, r11
0063f 49ffcb                         dec        r11
00642 4c23df                         and        r11, rdi
00645 4183fa40                       cmp        r10d, 0x40
00649 0f8d09100000                   jge        0x7fef87e5c258
0064f c4e2abf7c2                     shrx       rax, rdx, r10
00654 bf01000000                     mov        edi, 1
00659 c4e2a9f7ef                     shlx       rbp, rdi, r10
0065e 48ffcd                         dec        rbp
00661 4823ea                         and        rbp, rdx
00664 4183fd40                       cmp        r13d, 0x40
00668 0f8da2100000                   jge        0x7fef87e5c310
0066e 41ba01000000                   mov        r10d, 1
00674 c4c291f7fa                     shlx       rdi, r10, r13
00679 458bd3                         mov        r10d, r11d
0067c 48ffcf                         dec        rdi
0067f 4823f8                         and        rdi, rax
00682 448bdd                         mov        r11d, ebp
00685 488b542468                     mov        rdx, qword ptr [rsp + 0x68]
0068a 8bd2                           mov        edx, edx
0068c 4403d2                         add        r10d, edx
0068f 488b942480000000               mov        rdx, qword ptr [rsp + 0x80]
00697 8bf2                           mov        esi, edx
00699 4403de                         add        r11d, esi
0069c 488b542470                     mov        rdx, qword ptr [rsp + 0x70]
006a1 8bd2                           mov        edx, edx
006a3 4803fa                         add        rdi, rdx
006a6 4963d3                         movsxd     rdx, r11d
006a9 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
006b1 4803f2                         add        rsi, rdx
006b4 4889b424b8000000               mov        qword ptr [rsp + 0xb8], rsi
006bc 4885ff                         test       rdi, rdi
006bf 0f8e60050000                   jle        0x7fef87e5b825
006c5 4881ffffffff7f                 cmp        rdi, 0x7fffffff
006cc 0f8fee100000                   jg         0x7fef87e5c3c0
006d2 4181faffff0100                 cmp        r10d, 0x1ffff
006d9 0f8fb5110000                   jg         0x7fef87e5c494
006df 4181fbffff0300                 cmp        r11d, 0x3ffff
006e6 0f8f6c120000                   jg         0x7fef87e5c558
006ec 8bf7                           mov        esi, edi
006ee 81fe00000010                   cmp        esi, 0x10000000
006f4 0f8322130000                   jae        0x7fef87e5c61c
006fa 4d63d2                         movsxd     r10, r10d
006fd 48c1e212                       shl        rdx, 0x12
00701 4c63de                         movsxd     r11, esi
00704 49c1e324                       shl        r11, 0x24
00708 4c0bda                         or         r11, rdx
0070b 4d0bda                         or         r11, r10
0070e 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00716 8b7c2464                       mov        edi, dword ptr [rsp + 0x64]
0071a 4d895cfa08                     mov        qword ptr [r10 + rdi*8 + 8], r11
0071f ffc7                           inc        edi
00721 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
00728 7d09                           jge        0x7fef87e5b333
0072a 897c2464                       mov        dword ptr [rsp + 0x64], edi
0072e e948feffff                     jmp        0x7fef87e5b17b
00733 418bd0                         mov        edx, r8d
00736 448bdb                         mov        r11d, ebx
00739 418bd9                         mov        ebx, r9d
0073c 3bbc2488000000                 cmp        edi, dword ptr [rsp + 0x88]
00743 0f8def010000                   jge        0x7fef87e5b538
00749 897c2464                       mov        dword ptr [rsp + 0x64], edi
0074d 666690                         nop        
00750 458bc3                         mov        r8d, r11d
00753 448bc9                         mov        r9d, ecx
00756 4d8b54cb08                     mov        r10, qword ptr [r11 + rcx*8 + 8]
0075b 448b742464                     mov        r14d, dword ptr [rsp + 0x64]
00760 41ffc6                         inc        r14d
00763 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0076b 49c1ea20                       shr        r10, 0x20
0076f 458bda                         mov        r11d, r10d
00772 450fb6d3                       movzx      r10d, r11b
00776 8bca                           mov        ecx, edx
00778 4c8b5cda08                     mov        r11, qword ptr [rdx + rbx*8 + 8]
0077d 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00782 8b3424                         mov        esi, dword ptr [rsp]
00785 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0078a 4e8b5cde08                     mov        r11, qword ptr [rsi + r11*8 + 8]
0078f 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00794 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
00799 49c1eb20                       shr        r11, 0x20
0079d 458bdb                         mov        r11d, r11d
007a0 450fb6eb                       movzx      r13d, r11b
007a4 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
007a9 49c1eb20                       shr        r11, 0x20
007ad 458bdb                         mov        r11d, r11d
007b0 450fb6db                       movzx      r11d, r11b
007b4 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
007bc 0f8cca080000                   jl         0x7fef87e5bc8c
007c2 438d142a                       lea        edx, [r10 + r13]
007c6 4103d3                         add        edx, r11d
007c9 0f84ad090000                   je         0x7fef87e5bd7c
007cf 83fa3f                         cmp        edx, 0x3f
007d2 0f8fa00a0000                   jg         0x7fef87e5be78
007d8 b840000000                     mov        eax, 0x40
007dd 2b44247c                       sub        eax, dword ptr [rsp + 0x7c]
007e1 3bd0                           cmp        edx, eax
007e3 0f8f8b0b0000                   jg         0x7fef87e5bf74
007e9 2bc2                           sub        eax, edx
007eb c4e2fbf77c2430                 shrx       rdi, qword ptr [rsp + 0x30], rax
007f2 b801000000                     mov        eax, 1
007f7 c4e2e9f7c0                     shlx       rax, rax, rdx
007fc 48ffc8                         dec        rax
007ff 4823f8                         and        rdi, rax
00802 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
00806 03c2                           add        eax, edx
00808 8944247c                       mov        dword ptr [rsp + 0x7c], eax
0080c 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00810 03c2                           add        eax, edx
00812 89442458                       mov        dword ptr [rsp + 0x58], eax
00816 8b54247c                       mov        edx, dword ptr [rsp + 0x7c]
0081a 83fa40                         cmp        edx, 0x40
0081d 0f8d510c0000                   jge        0x7fef87e5c074
00823 4183fb40                       cmp        r11d, 0x40
00827 0f8d1f0d0000                   jge        0x7fef87e5c14c
0082d c4e2a3f7d7                     shrx       rdx, rdi, r11
00832 b801000000                     mov        eax, 1
00837 c462a1f7d8                     shlx       r11, rax, r11
0083c 49ffcb                         dec        r11
0083f 4c23df                         and        r11, rdi
00842 4183fa40                       cmp        r10d, 0x40
00846 0f8d0c0e0000                   jge        0x7fef87e5c258
0084c c4e2abf7c2                     shrx       rax, rdx, r10
00851 bf01000000                     mov        edi, 1
00856 c4e2a9f7ef                     shlx       rbp, rdi, r10
0085b 48ffcd                         dec        rbp
0085e 4823ea                         and        rbp, rdx
00861 4183fd40                       cmp        r13d, 0x40
00865 0f8da50e0000                   jge        0x7fef87e5c310
0086b 41ba01000000                   mov        r10d, 1
00871 c4c291f7fa                     shlx       rdi, r10, r13
00876 458bd3                         mov        r10d, r11d
00879 48ffcf                         dec        rdi
0087c 4823f8                         and        rdi, rax
0087f 448bdd                         mov        r11d, ebp
00882 488b542468                     mov        rdx, qword ptr [rsp + 0x68]
00887 8bd2                           mov        edx, edx
00889 4403d2                         add        r10d, edx
0088c 488b942480000000               mov        rdx, qword ptr [rsp + 0x80]
00894 8bc2                           mov        eax, edx
00896 4403d8                         add        r11d, eax
00899 488b542470                     mov        rdx, qword ptr [rsp + 0x70]
0089e 8bd2                           mov        edx, edx
008a0 4803fa                         add        rdi, rdx
008a3 4963d3                         movsxd     rdx, r11d
008a6 488b8424b8000000               mov        rax, qword ptr [rsp + 0xb8]
008ae 4803c2                         add        rax, rdx
008b1 48898424b8000000               mov        qword ptr [rsp + 0xb8], rax
008b9 4885ff                         test       rdi, rdi
008bc 0f8e63030000                   jle        0x7fef87e5b825
008c2 4881ffffffff7f                 cmp        rdi, 0x7fffffff
008c9 0f8ff10e0000                   jg         0x7fef87e5c3c0
008cf 4181faffff0100                 cmp        r10d, 0x1ffff
008d6 0f8fb80f0000                   jg         0x7fef87e5c494
008dc 4181fbffff0300                 cmp        r11d, 0x3ffff
008e3 0f8f6f100000                   jg         0x7fef87e5c558
008e9 8bc7                           mov        eax, edi
008eb 3d00000010                     cmp        eax, 0x10000000
008f0 0f8326110000                   jae        0x7fef87e5c61c
008f6 4d63d2                         movsxd     r10, r10d
008f9 4c63d8                         movsxd     r11, eax
008fc 48c1e212                       shl        rdx, 0x12
00900 49c1e324                       shl        r11, 0x24
00904 490bd3                         or         rdx, r11
00907 490bd2                         or         rdx, r10
0090a 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00912 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00917 4b8954da08                     mov        qword ptr [r10 + r11*8 + 8], rdx
0091c 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
00924 7d12                           jge        0x7fef87e5b538
00926 4489742464                     mov        dword ptr [rsp + 0x64], r14d
0092b 8bd1                           mov        edx, ecx
0092d 458bd8                         mov        r11d, r8d
00930 418bc9                         mov        ecx, r9d
00933 e918feffff                     jmp        0x7fef87e5b350
00938 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00940 eb03                           jmp        0x7fef87e5b545
00942 4533c0                         xor        r8d, r8d
00945 4c63542460                     movsxd     r10, dword ptr [rsp + 0x60]
0094a 4d03c2                         add        r8, r10
0094d 4c639424e0000000               movsxd     r10, dword ptr [rsp + 0xe0]
00955 4d3bc2                         cmp        r8, r10
00958 0f8f72110000                   jg         0x7fef87e5c6d0
0095e 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
00963 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00968 0f8586110000                   jne        0x7fef87e5c6f4
0096e 418bc0                         mov        eax, r8d
00971 4881c4d0000000                 add        rsp, 0xd0
00978 5d                             pop        rbp
00979 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
0097d 0f879d130000                   ja         0x7fef87e5c920
00983 c3                             ret        
00984 8d7bf7                         lea        edi, [rbx - 9]
00987 85ff                           test       edi, edi
00989 0f8cc3010000                   jl         0x7fef87e5b752
0098f 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00994 443bc0                         cmp        r8d, eax
00997 0f83bb110000                   jae        0x7fef87e5c758
0099d 4c63c7                         movsxd     r8, edi
009a0 4c03c1                         add        r8, rcx
009a3 4c3bc5                         cmp        r8, rbp
009a6 0f83ac110000                   jae        0x7fef87e5c758
009ac 85ff                           test       edi, edi
009ae 0f8e54120000                   jle        0x7fef87e5c808
009b4 83c3f6                         add        ebx, -0xa
009b7 4533c9                         xor        r9d, r9d
009ba 49c1e108                       shl        r9, 8
009be 448bc7                         mov        r8d, edi
009c1 4403442440                     add        r8d, dword ptr [rsp + 0x40]
009c6 488b4c2438                     mov        rcx, qword ptr [rsp + 0x38]
009cb 4a0fb6540108                   movzx      rdx, byte ptr [rcx + r8 + 8]
009d1 490bd1                         or         rdx, r9
009d4 ffcf                           dec        edi
009d6 3bfb                           cmp        edi, ebx
009d8 7e05                           jle        0x7fef87e5b5df
009da 4c8bca                         mov        r9, rdx
009dd ebdb                           jmp        0x7fef87e5b5ba
009df 83ff02                         cmp        edi, 2
009e2 7e74                           jle        0x7fef87e5b658
009e4 660f1f440000                   nop        word ptr [rax + rax]
009ea 660f1f440000                   nop        word ptr [rax + rax]
009f0 48c1e208                       shl        rdx, 8
009f4 8bcf                           mov        ecx, edi
009f6 034c2440                       add        ecx, dword ptr [rsp + 0x40]
009fa 448bcf                         mov        r9d, edi
009fd 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
00a02 4d63c9                         movsxd     r9, r9d
00a05 448d41fe                       lea        r8d, [rcx - 2]
00a09 488b5c2438                     mov        rbx, qword ptr [rsp + 0x38]
00a0e 4a0fb65c0308                   movzx      rbx, byte ptr [rbx + r8 + 8]
00a14 83c1fd                         add        ecx, -3
00a17 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00a1c 4d0fb6440808                   movzx      r8, byte ptr [r8 + rcx + 8]
00a22 488b4c2438                     mov        rcx, qword ptr [rsp + 0x38]
00a27 4a0fb64c0907                   movzx      rcx, byte ptr [rcx + r9 + 7]
00a2d 488b442438                     mov        rax, qword ptr [rsp + 0x38]
00a32 4e0fb64c0808                   movzx      r9, byte ptr [rax + r9 + 8]
00a38 490bd1                         or         rdx, r9
00a3b 48c1e208                       shl        rdx, 8
00a3f 480bd1                         or         rdx, rcx
00a42 48c1e208                       shl        rdx, 8
00a46 480bd3                         or         rdx, rbx
00a49 48c1e208                       shl        rdx, 8
00a4d 490bd0                         or         rdx, r8
00a50 83c7fc                         add        edi, -4
00a53 83ff02                         cmp        edi, 2
00a56 7f98                           jg         0x7fef87e5b5f0
00a58 83ffff                         cmp        edi, -1
00a5b 0f8f9cf6ffff                   jg         0x7fef87e5acfd
00a61 4c8bc2                         mov        r8, rdx
00a64 e9baf6ffff                     jmp        0x7fef87e5ad23
00a69 8d53ff                         lea        edx, [rbx - 1]
00a6c 85d2                           test       edx, edx
00a6e 0f8cd6000000                   jl         0x7fef87e5b74a
00a74 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00a79 443bc0                         cmp        r8d, eax
00a7c 0f8386100000                   jae        0x7fef87e5c708
00a82 4c63c2                         movsxd     r8, edx
00a85 4c03c1                         add        r8, rcx
00a88 4c3bc5                         cmp        r8, rbp
00a8b 0f8377100000                   jae        0x7fef87e5c708
00a91 85d2                           test       edx, edx
00a93 0f8e1f110000                   jle        0x7fef87e5c7b8
00a99 448d4bfe                       lea        r9d, [rbx - 2]
00a9d 33ff                           xor        edi, edi
00a9f 448bc2                         mov        r8d, edx
00aa2 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00aa7 4c8b6c2438                     mov        r13, qword ptr [rsp + 0x38]
00aac 4f0fb66c0508                   movzx      r13, byte ptr [r13 + r8 + 8]
00ab2 48c1e708                       shl        rdi, 8
00ab6 4c0bef                         or         r13, rdi
00ab9 ffca                           dec        edx
00abb 413bd1                         cmp        edx, r9d
00abe 7e05                           jle        0x7fef87e5b6c5
00ac0 498bfd                         mov        rdi, r13
00ac3 ebda                           jmp        0x7fef87e5b69f
00ac5 83fa02                         cmp        edx, 2
00ac8 7e6f                           jle        0x7fef87e5b739
00aca 893424                         mov        dword ptr [rsp], esi
00acd 666690                         nop        
00ad0 49c1e508                       shl        r13, 8
00ad4 448bca                         mov        r9d, edx
00ad7 44034c2440                     add        r9d, dword ptr [rsp + 0x40]
00adc 448bc2                         mov        r8d, edx
00adf 4403442440                     add        r8d, dword ptr [rsp + 0x40]
00ae4 4963f0                         movsxd     rsi, r8d
00ae7 418d79fe                       lea        edi, [r9 - 2]
00aeb 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00af0 490fb67c3808                   movzx      rdi, byte ptr [r8 + rdi + 8]
00af6 4183c1fd                       add        r9d, -3
00afa 4f0fb6440808                   movzx      r8, byte ptr [r8 + r9 + 8]
00b00 4c8b4c2438                     mov        r9, qword ptr [rsp + 0x38]
00b05 4d0fb64c3107                   movzx      r9, byte ptr [r9 + rsi + 7]
00b0b 4c8b742438                     mov        r14, qword ptr [rsp + 0x38]
00b10 490fb6743608                   movzx      rsi, byte ptr [r14 + rsi + 8]
00b16 4c0bee                         or         r13, rsi
00b19 49c1e508                       shl        r13, 8
00b1d 4d0be9                         or         r13, r9
00b20 49c1e508                       shl        r13, 8
00b24 4c0bef                         or         r13, rdi
00b27 49c1e508                       shl        r13, 8
00b2b 4d0be8                         or         r13, r8
00b2e 83c2fc                         add        edx, -4
00b31 83fa02                         cmp        edx, 2
00b34 7f9a                           jg         0x7fef87e5b6d0
00b36 8b3424                         mov        esi, dword ptr [rsp]
00b39 83faff                         cmp        edx, -1
00b3c 0f8f66f5ffff                   jg         0x7fef87e5aca8
00b42 4d8bcd                         mov        r9, r13
00b45 e984f5ffff                     jmp        0x7fef87e5acce
00b4a 4533c9                         xor        r9d, r9d
00b4d e97cf5ffff                     jmp        0x7fef87e5acce
00b52 4533c0                         xor        r8d, r8d
00b55 e9c9f5ffff                     jmp        0x7fef87e5ad23
00b5a bee4ffffff                     mov        esi, 0xffffffe4
00b5f 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00b64 891424                         mov        dword ptr [rsp], edx
00b67 894c2404                       mov        dword ptr [rsp + 4], ecx
00b6b 4c89442408                     mov        qword ptr [rsp + 8], r8
00b70 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00b75 897c2418                       mov        dword ptr [rsp + 0x18], edi
00b79 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00b7e 90                             nop        
00b7f e8dc7eb6ff                     call       0x7fef879c3660
00b84 0f1f84007c0c0000               nop        dword ptr [rax + rax + 0xc7c]
00b8c be6effffff                     mov        esi, 0xffffff6e
00b91 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00b96 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00b9b 44891c24                       mov        dword ptr [rsp], r11d
00b9f 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00ba4 4489542404                     mov        dword ptr [rsp + 4], r10d
00ba9 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00bae 4c89542408                     mov        qword ptr [rsp + 8], r10
00bb3 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00bb8 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00bbd 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00bc5 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00bca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00bcf 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00bd4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00bd9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00bde 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00be3 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00be8 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00bed 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00bf2 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00bf7 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00bfc 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
00c01 4489542444                     mov        dword ptr [rsp + 0x44], r10d
00c06 90                             nop        
00c07 e8547eb6ff                     call       0x7fef879c3660
00c0c 0f1f8400040d0001               nop        dword ptr [rax + rax + 0x1000d04]
00c14 418bd0                         mov        edx, r8d
00c17 448bdb                         mov        r11d, ebx
00c1a 418bd9                         mov        ebx, r9d
00c1d 418bfe                         mov        edi, r14d
00c20 e917fbffff                     jmp        0x7fef87e5b33c
00c25 4533c0                         xor        r8d, r8d
00c28 493bf8                         cmp        rdi, r8
00c2b bdffffffff                     mov        ebp, 0xffffffff
00c30 7c08                           jl         0x7fef87e5b83a
00c32 400f95c5                       setne      bpl
00c36 400fb6ed                       movzx      ebp, bpl
00c3a be45ffffff                     mov        esi, 0xffffff45
00c3f 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00c44 4c890424                       mov        qword ptr [rsp], r8
00c48 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
00c4d 44894c2408                     mov        dword ptr [rsp + 8], r9d
00c52 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00c57 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00c5c 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00c64 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c69 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00c6e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00c73 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
00c78 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00c7d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00c82 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c87 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
00c8c 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00c91 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
00c96 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00c9b 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
00ca0 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00ca5 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
00caa 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00caf 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
00cb7 48ffb42480000000               push       qword ptr [rsp + 0x80]
00cbf 488f442478                     pop        qword ptr [rsp + 0x78]
00cc4 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
00ccc 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
00cd4 458bd1                         mov        r10d, r9d
00cd7 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00cdf 4889bc2490000000               mov        qword ptr [rsp + 0x90], rdi
00ce7 e8747db6ff                     call       0x7fef879c3660
00cec 0f1f8400e40d0002               nop        dword ptr [rax + rax + 0x2000de4]
00cf4 be45ffffff                     mov        esi, 0xffffff45
00cf9 418beb                         mov        ebp, r11d
00cfc 666690                         nop        
00cff e85c7db6ff                     call       0x7fef879c3660
00d04 0f1f8400fc0d0003               nop        dword ptr [rax + rax + 0x3000dfc]
00d0c be45ffffff                     mov        esi, 0xffffff45
00d11 48ff742438                     push       qword ptr [rsp + 0x38]
00d16 488f0424                       pop        qword ptr [rsp]
00d1a 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00d1e 4c89442410                     mov        qword ptr [rsp + 0x10], r8
00d23 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00d28 897c2420                       mov        dword ptr [rsp + 0x20], edi
00d2c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d31 89542428                       mov        dword ptr [rsp + 0x28], edx
00d35 8954242c                       mov        dword ptr [rsp + 0x2c], edx
00d39 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00d3d 6690                           nop        
00d3f e81c7db6ff                     call       0x7fef879c3660
00d44 0f1f84003c0e0004               nop        dword ptr [rax + rax + 0x4000e3c]
00d4c 8b6c242c                       mov        ebp, dword ptr [rsp + 0x2c]
00d50 83c5f8                         add        ebp, -8
00d53 be45ffffff                     mov        esi, 0xffffff45
00d58 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00d5d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00d62 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d67 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00d6c 666690                         nop        
00d6f e8ec7cb6ff                     call       0x7fef879c3660
00d74 0f1f84006c0e0005               nop        dword ptr [rax + rax + 0x5000e6c]
00d7c be45ffffff                     mov        esi, 0xffffff45
00d81 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00d86 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00d8b 44891c24                       mov        dword ptr [rsp], r11d
00d8f 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
00d94 4489442404                     mov        dword ptr [rsp + 4], r8d
00d99 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00d9e 4c895c2408                     mov        qword ptr [rsp + 8], r11
00da3 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00da8 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00dad 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00db2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00db7 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00dbc 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00dc1 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00dc6 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00dcb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00dd0 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00dd5 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00dda 895c2448                       mov        dword ptr [rsp + 0x48], ebx
00dde 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00de3 e8787cb6ff                     call       0x7fef879c3660
00de8 0f1f8400e00e0006               nop        dword ptr [rax + rax + 0x6000ee0]
00df0 be45ffffff                     mov        esi, 0xffffff45
00df5 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00dfa 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00dff 44890424                       mov        dword ptr [rsp], r8d
00e03 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00e08 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e0d 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00e12 4c895c2408                     mov        qword ptr [rsp + 8], r11
00e17 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00e1c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00e21 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00e26 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00e2b 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00e30 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00e35 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00e3a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00e3f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e44 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
00e49 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e4e 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00e53 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00e58 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
00e5d 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00e61 6690                           nop        
00e63 e8f87bb6ff                     call       0x7fef879c3660
00e68 0f1f8400600f0007               nop        dword ptr [rax + rax + 0x7000f60]
00e70 be45ffffff                     mov        esi, 0xffffff45
00e75 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00e7a 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00e7f 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
00e84 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e89 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
00e8e 4c895c2408                     mov        qword ptr [rsp + 8], r11
00e93 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00e98 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00e9d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ea2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00ea7 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00eac 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00eb1 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00eb6 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
00ebb 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
00ec0 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ec5 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
00eca 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ecf 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00ed4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00ed9 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
00ede 4c894c2448                     mov        qword ptr [rsp + 0x48], r9
00ee3 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ee8 666690                         nop        
00eeb e8707bb6ff                     call       0x7fef879c3660
00ef0 0f1f8400e80f0008               nop        dword ptr [rax + rax + 0x8000fe8]
00ef8 be45ffffff                     mov        esi, 0xffffff45
00efd 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00f02 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f07 44891424                       mov        dword ptr [rsp], r10d
00f0b 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
00f10 4489542404                     mov        dword ptr [rsp + 4], r10d
00f15 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00f1a 4c89542408                     mov        qword ptr [rsp + 8], r10
00f1f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00f24 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f29 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00f2e 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00f33 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00f38 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00f3d 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00f42 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00f47 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
00f4c 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f51 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00f56 90                             nop        
00f57 e8047bb6ff                     call       0x7fef879c3660
00f5c 0f1f840054100009               nop        dword ptr [rax + rax + 0x9001054]
00f64 be45ffffff                     mov        esi, 0xffffff45
00f69 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00f6e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f73 44891424                       mov        dword ptr [rsp], r10d
00f77 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
00f7c 44894c2404                     mov        dword ptr [rsp + 4], r9d
00f81 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00f86 4c89542408                     mov        qword ptr [rsp + 8], r10
00f8b 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
00f90 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f95 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00f9a 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
00f9f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00fa4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
00fa9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00fae 4c89542430                     mov        qword ptr [rsp + 0x30], r10
00fb3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
00fb8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00fbd 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
00fc2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00fc7 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
00fcc 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00fd1 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
00fd6 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00fdb 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00fe0 4489442458                     mov        dword ptr [rsp + 0x58], r8d
00fe5 6690                           nop        
00fe7 e8747ab6ff                     call       0x7fef879c3660
00fec 0f1f8400e410000a               nop        dword ptr [rax + rax + 0xa0010e4]
00ff4 be45ffffff                     mov        esi, 0xffffff45
00ff9 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
00ffe 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01003 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01008 4489542404                     mov        dword ptr [rsp + 4], r10d
0100d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01012 4c89542408                     mov        qword ptr [rsp + 8], r10
01017 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
0101c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01021 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01026 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0102b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01030 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01035 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0103a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0103f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01044 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01049 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0104e 448b542444                     mov        r10d, dword ptr [rsp + 0x44]
01053 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01058 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
0105d 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01062 448b542454                     mov        r10d, dword ptr [rsp + 0x54]
01067 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0106c 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01071 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01076 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
0107b 894c2454                       mov        dword ptr [rsp + 0x54], ecx
0107f e8dc79b6ff                     call       0x7fef879c3660
01084 0f1f84007c11000b               nop        dword ptr [rax + rax + 0xb00117c]
0108c be45ffffff                     mov        esi, 0xffffff45
01091 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01096 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
0109b 44890c24                       mov        dword ptr [rsp], r9d
0109f 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
010a4 44894c2404                     mov        dword ptr [rsp + 4], r9d
010a9 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
010ae 4c89442408                     mov        qword ptr [rsp + 8], r8
010b3 4c8b442418                     mov        r8, qword ptr [rsp + 0x18]
010b8 4c89442410                     mov        qword ptr [rsp + 0x10], r8
010bd 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
010c2 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
010c7 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
010cc 4c89442428                     mov        qword ptr [rsp + 0x28], r8
010d1 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
010d6 4c89442430                     mov        qword ptr [rsp + 0x30], r8
010db 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
010e0 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
010e5 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
010ea 4489442438                     mov        dword ptr [rsp + 0x38], r8d
010ef 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
010f4 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
010f9 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
010fe 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01103 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01108 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0110d 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01112 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01117 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0111c 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01121 48894424f8                     mov        qword ptr [rsp - 8], rax
01126 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0112a 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0112e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01133 48ff742468                     push       qword ptr [rsp + 0x68]
01138 488f442460                     pop        qword ptr [rsp + 0x60]
0113d 48ff742470                     push       qword ptr [rsp + 0x70]
01142 488f442468                     pop        qword ptr [rsp + 0x68]
01147 48ffb42480000000               push       qword ptr [rsp + 0x80]
0114f 488f442470                     pop        qword ptr [rsp + 0x70]
01154 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01159 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0115e 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01166 4489b42484000000               mov        dword ptr [rsp + 0x84], r14d
0116e 90                             nop        
0116f e8ec78b6ff                     call       0x7fef879c3660
01174 0f1f84006c12000c               nop        dword ptr [rax + rax + 0xc00126c]
0117c be45ffffff                     mov        esi, 0xffffff45
01181 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01186 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0118b 44890424                       mov        dword ptr [rsp], r8d
0118f 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01194 4489442404                     mov        dword ptr [rsp + 4], r8d
01199 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
0119e 4c89442408                     mov        qword ptr [rsp + 8], r8
011a3 4c8b442418                     mov        r8, qword ptr [rsp + 0x18]
011a8 4c89442410                     mov        qword ptr [rsp + 0x10], r8
011ad 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
011b5 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
011ba 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
011bf 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
011c4 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
011c9 4c89442428                     mov        qword ptr [rsp + 0x28], r8
011ce 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
011d3 4c89442430                     mov        qword ptr [rsp + 0x30], r8
011d8 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
011dd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
011e2 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
011e7 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
011ec 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
011f1 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
011f6 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
011fb 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01200 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
01205 4489442444                     mov        dword ptr [rsp + 0x44], r8d
0120a 448b4c245c                     mov        r9d, dword ptr [rsp + 0x5c]
0120f 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01214 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01219 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0121e 48894424f8                     mov        qword ptr [rsp - 8], rax
01223 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01227 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0122b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01230 48ff742468                     push       qword ptr [rsp + 0x68]
01235 488f442460                     pop        qword ptr [rsp + 0x60]
0123a 48ff742470                     push       qword ptr [rsp + 0x70]
0123f 488f442468                     pop        qword ptr [rsp + 0x68]
01244 48ffb42480000000               push       qword ptr [rsp + 0x80]
0124c 488f442470                     pop        qword ptr [rsp + 0x70]
01251 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01256 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
0125b 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01263 89942488000000                 mov        dword ptr [rsp + 0x88], edx
0126a 90                             nop        
0126b e8f077b6ff                     call       0x7fef879c3660
01270 0f1f84006813000d               nop        dword ptr [rax + rax + 0xd001368]
01278 be45ffffff                     mov        esi, 0xffffff45
0127d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01282 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01287 44890c24                       mov        dword ptr [rsp], r9d
0128b 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01290 44894c2404                     mov        dword ptr [rsp + 4], r9d
01295 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
0129a 4c89442408                     mov        qword ptr [rsp + 8], r8
0129f 4c8b442418                     mov        r8, qword ptr [rsp + 0x18]
012a4 4c89442410                     mov        qword ptr [rsp + 0x10], r8
012a9 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
012b1 4489442418                     mov        dword ptr [rsp + 0x18], r8d
012b6 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
012bb 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
012c0 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
012c5 4c89442428                     mov        qword ptr [rsp + 0x28], r8
012ca 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
012cf 4c89442430                     mov        qword ptr [rsp + 0x30], r8
012d4 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
012d9 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
012de 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
012e3 4489442438                     mov        dword ptr [rsp + 0x38], r8d
012e8 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
012ed 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
012f2 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
012f7 4489442440                     mov        dword ptr [rsp + 0x40], r8d
012fc 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01301 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01306 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
0130b 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01310 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01315 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0131a 48894424f8                     mov        qword ptr [rsp - 8], rax
0131f 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01323 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01327 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132c 48ff742468                     push       qword ptr [rsp + 0x68]
01331 488f442460                     pop        qword ptr [rsp + 0x60]
01336 48ff742470                     push       qword ptr [rsp + 0x70]
0133b 488f442468                     pop        qword ptr [rsp + 0x68]
01340 48ffb42480000000               push       qword ptr [rsp + 0x80]
01348 488f442470                     pop        qword ptr [rsp + 0x70]
0134d 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01352 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01357 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
0135f 89942488000000                 mov        dword ptr [rsp + 0x88], edx
01366 90                             nop        
01367 e8f476b6ff                     call       0x7fef879c3660
0136c 0f1f84006414000e               nop        dword ptr [rax + rax + 0xe001464]
01374 be45ffffff                     mov        esi, 0xffffff45
01379 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0137e 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01383 44890424                       mov        dword ptr [rsp], r8d
01387 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
0138c 44894c2404                     mov        dword ptr [rsp + 4], r9d
01391 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01396 4c89442408                     mov        qword ptr [rsp + 8], r8
0139b 4c8b442418                     mov        r8, qword ptr [rsp + 0x18]
013a0 4c89442410                     mov        qword ptr [rsp + 0x10], r8
013a5 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
013ad 4489442418                     mov        dword ptr [rsp + 0x18], r8d
013b2 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
013b7 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
013bc 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
013c1 4c89442428                     mov        qword ptr [rsp + 0x28], r8
013c6 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
013cb 4c89442430                     mov        qword ptr [rsp + 0x30], r8
013d0 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
013d5 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
013da 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
013df 4489442438                     mov        dword ptr [rsp + 0x38], r8d
013e4 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
013e9 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
013ee 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
013f3 4489442440                     mov        dword ptr [rsp + 0x40], r8d
013f8 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
013fd 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
01402 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01407 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0140c 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
01414 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01419 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0141e 4489442454                     mov        dword ptr [rsp + 0x54], r8d
01423 48894424f8                     mov        qword ptr [rsp - 8], rax
01428 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0142c 89442460                       mov        dword ptr [rsp + 0x60], eax
01430 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01435 48ffb42480000000               push       qword ptr [rsp + 0x80]
0143d 488f442478                     pop        qword ptr [rsp + 0x78]
01442 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
01447 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0144f 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01457 8994248c000000                 mov        dword ptr [rsp + 0x8c], edx
0145e 89842490000000                 mov        dword ptr [rsp + 0x90], eax
01465 6690                           nop        
01467 e8f475b6ff                     call       0x7fef879c3660
0146c 0f1f84006415000f               nop        dword ptr [rax + rax + 0xf001564]
01474 be45ffffff                     mov        esi, 0xffffff45
01479 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0147e 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01483 44890c24                       mov        dword ptr [rsp], r9d
01487 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
0148c 4489442404                     mov        dword ptr [rsp + 4], r8d
01491 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01496 4c89442408                     mov        qword ptr [rsp + 8], r8
0149b 4c8b442418                     mov        r8, qword ptr [rsp + 0x18]
014a0 4c89442410                     mov        qword ptr [rsp + 0x10], r8
014a5 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014aa 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
014af 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
014b4 4c89442428                     mov        qword ptr [rsp + 0x28], r8
014b9 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
014be 4489442430                     mov        dword ptr [rsp + 0x30], r8d
014c3 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
014c8 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
014cd 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
014d2 4489442438                     mov        dword ptr [rsp + 0x38], r8d
014d7 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
014dc 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
014e1 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
014e6 4489442440                     mov        dword ptr [rsp + 0x40], r8d
014eb 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
014f0 4489442450                     mov        dword ptr [rsp + 0x50], r8d
014f5 48894424f8                     mov        qword ptr [rsp - 8], rax
014fa 8b442464                       mov        eax, dword ptr [rsp + 0x64]
014fe 89442454                       mov        dword ptr [rsp + 0x54], eax
01502 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01507 48ff742468                     push       qword ptr [rsp + 0x68]
0150c 488f442458                     pop        qword ptr [rsp + 0x58]
01511 48ff742470                     push       qword ptr [rsp + 0x70]
01516 488f442460                     pop        qword ptr [rsp + 0x60]
0151b 48ffb42480000000               push       qword ptr [rsp + 0x80]
01523 488f442468                     pop        qword ptr [rsp + 0x68]
01528 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
0152d 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01532 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01537 4889bc2480000000               mov        qword ptr [rsp + 0x80], rdi
0153f e81c75b6ff                     call       0x7fef879c3660
01544 0f1f84003c160010               nop        dword ptr [rax + rax + 0x1000163c]
0154c be45ffffff                     mov        esi, 0xffffff45
01551 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01556 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0155b 44890424                       mov        dword ptr [rsp], r8d
0155f 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01564 44894c2404                     mov        dword ptr [rsp + 4], r9d
01569 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
0156e 4c89442408                     mov        qword ptr [rsp + 8], r8
01573 4c8b442418                     mov        r8, qword ptr [rsp + 0x18]
01578 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0157d 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
01585 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0158a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0158f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01594 4c8b442430                     mov        r8, qword ptr [rsp + 0x30]
01599 4c89442428                     mov        qword ptr [rsp + 0x28], r8
0159e 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
015a3 4c89442430                     mov        qword ptr [rsp + 0x30], r8
015a8 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
015ad 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
015b2 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
015b7 4489442438                     mov        dword ptr [rsp + 0x38], r8d
015bc 448b4c2444                     mov        r9d, dword ptr [rsp + 0x44]
015c1 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
015c6 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
015cb 4489442440                     mov        dword ptr [rsp + 0x40], r8d
015d0 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
015d5 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
015da 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
015df 4489442448                     mov        dword ptr [rsp + 0x48], r8d
015e4 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
015ec 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
015f1 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
015f6 4489442458                     mov        dword ptr [rsp + 0x58], r8d
015fb 48894424f8                     mov        qword ptr [rsp - 8], rax
01600 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01604 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01608 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0160d 48ff742468                     push       qword ptr [rsp + 0x68]
01612 488f442460                     pop        qword ptr [rsp + 0x60]
01617 48ff742470                     push       qword ptr [rsp + 0x70]
0161c 488f442468                     pop        qword ptr [rsp + 0x68]
01621 48ffb42480000000               push       qword ptr [rsp + 0x80]
01629 488f442470                     pop        qword ptr [rsp + 0x70]
0162e 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
01633 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01638 4889bc2490000000               mov        qword ptr [rsp + 0x90], rdi
01640 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01648 666690                         nop        
0164b e81074b6ff                     call       0x7fef879c3660
01650 0f1f840048170011               nop        dword ptr [rax + rax + 0x11001748]
01658 be45ffffff                     mov        esi, 0xffffff45
0165d 418beb                         mov        ebp, r11d
01660 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01665 4c891c24                       mov        qword ptr [rsp], r11
01669 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
0166e 4489442408                     mov        dword ptr [rsp + 8], r8d
01673 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01678 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0167d 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
01685 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0168a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0168f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01694 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
01699 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
0169e 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
016a3 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
016a8 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
016ad 4489442440                     mov        dword ptr [rsp + 0x40], r8d
016b2 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
016b7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
016bc 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
016c1 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
016c6 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
016cb 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
016d0 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
016d8 4489442454                     mov        dword ptr [rsp + 0x54], r8d
016dd 48ffb42480000000               push       qword ptr [rsp + 0x80]
016e5 488f442478                     pop        qword ptr [rsp + 0x78]
016ea 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
016f2 4889942490000000               mov        qword ptr [rsp + 0x90], rdx
016fa 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
01702 90                             nop        
01703 e85873b6ff                     call       0x7fef879c3660
01708 0f1f840000180012               nop        dword ptr [rax + rax + 0x12001800]
01710 be45ffffff                     mov        esi, 0xffffff45
01715 448bd5                         mov        r10d, ebp
01718 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01720 418beb                         mov        ebp, r11d
01723 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01728 4c891424                       mov        qword ptr [rsp], r10
0172c 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01731 4489542408                     mov        dword ptr [rsp + 8], r10d
01736 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0173b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01740 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
01748 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0174d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01752 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01757 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0175c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01761 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
01766 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0176b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01770 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01775 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
0177a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0177f 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01784 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01789 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0178e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01793 48ffb42480000000               push       qword ptr [rsp + 0x80]
0179b 488f442478                     pop        qword ptr [rsp + 0x78]
017a0 4889842480000000               mov        qword ptr [rsp + 0x80], rax
017a8 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
017b0 666690                         nop        
017b3 e8a872b6ff                     call       0x7fef879c3660
017b8 0f1f8400b0180013               nop        dword ptr [rax + rax + 0x130018b0]
017c0 be45ffffff                     mov        esi, 0xffffff45
017c5 41b8ffffff7f                   mov        r8d, 0x7fffffff
017cb 493bf8                         cmp        rdi, r8
017ce bdffffffff                     mov        ebp, 0xffffffff
017d3 7c08                           jl         0x7fef87e5c3dd
017d5 400f95c5                       setne      bpl
017d9 400fb6ed                       movzx      ebp, bpl
017dd 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
017e2 4c890424                       mov        qword ptr [rsp], r8
017e6 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
017eb 4489442408                     mov        dword ptr [rsp + 8], r8d
017f0 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
017f5 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
017fa 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
01802 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01807 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0180c 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01811 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
01816 4c89442438                     mov        qword ptr [rsp + 0x38], r8
0181b 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01820 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01825 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
0182a 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0182f 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
01834 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01839 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
0183e 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01843 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01848 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0184d 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
01855 48ffb42480000000               push       qword ptr [rsp + 0x80]
0185d 488f442478                     pop        qword ptr [rsp + 0x78]
01862 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
0186a 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01872 458bd1                         mov        r10d, r9d
01875 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0187d 4889bc2490000000               mov        qword ptr [rsp + 0x90], rdi
01885 6690                           nop        
01887 e8d471b6ff                     call       0x7fef879c3660
0188c 0f1f840084190014               nop        dword ptr [rax + rax + 0x14001984]
01894 be45ffffff                     mov        esi, 0xffffff45
01899 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
0189e 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
018a3 44890424                       mov        dword ptr [rsp], r8d
018a7 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
018ac 44895c2404                     mov        dword ptr [rsp + 4], r11d
018b1 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
018b6 4c895c2408                     mov        qword ptr [rsp + 8], r11
018bb 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
018c0 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
018c5 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
018ca 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
018cf 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
018d4 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
018d9 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
018de 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
018e3 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
018e8 4489442438                     mov        dword ptr [rsp + 0x38], r8d
018ed 448b5c2444                     mov        r11d, dword ptr [rsp + 0x44]
018f2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
018f7 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
018fc 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01901 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
01906 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0190b 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01910 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01915 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0191a 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0191f 48894424f8                     mov        qword ptr [rsp - 8], rax
01924 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01928 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0192c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01931 48ff742468                     push       qword ptr [rsp + 0x68]
01936 488f442460                     pop        qword ptr [rsp + 0x60]
0193b 48ff742470                     push       qword ptr [rsp + 0x70]
01940 488f442468                     pop        qword ptr [rsp + 0x68]
01945 4489542478                     mov        dword ptr [rsp + 0x78], r10d
0194a 90                             nop        
0194b e81071b6ff                     call       0x7fef879c3660
01950 0f1f8400481a0015               nop        dword ptr [rax + rax + 0x15001a48]
01958 be45ffffff                     mov        esi, 0xffffff45
0195d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01962 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01967 44891424                       mov        dword ptr [rsp], r10d
0196b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01970 4489442404                     mov        dword ptr [rsp + 4], r8d
01975 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0197a 4c89542408                     mov        qword ptr [rsp + 8], r10
0197f 4c8b542418                     mov        r10, qword ptr [rsp + 0x18]
01984 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01989 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0198e 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01993 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01998 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0199d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
019a2 4c89542430                     mov        qword ptr [rsp + 0x30], r10
019a7 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
019ac 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019b1 448b442444                     mov        r8d, dword ptr [rsp + 0x44]
019b6 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
019bb 448b542450                     mov        r10d, dword ptr [rsp + 0x50]
019c0 4489542440                     mov        dword ptr [rsp + 0x40], r10d
019c5 448b442454                     mov        r8d, dword ptr [rsp + 0x54]
019ca 4489442444                     mov        dword ptr [rsp + 0x44], r8d
019cf 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
019d4 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019d9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
019de 4489542458                     mov        dword ptr [rsp + 0x58], r10d
019e3 48894424f8                     mov        qword ptr [rsp - 8], rax
019e8 8b442464                       mov        eax, dword ptr [rsp + 0x64]
019ec 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019f5 48ff742468                     push       qword ptr [rsp + 0x68]
019fa 488f442460                     pop        qword ptr [rsp + 0x60]
019ff 48ff742470                     push       qword ptr [rsp + 0x70]
01a04 488f442468                     pop        qword ptr [rsp + 0x68]
01a09 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
01a0e 90                             nop        
01a0f e84c70b6ff                     call       0x7fef879c3660
01a14 0f1f84000c1b0016               nop        dword ptr [rax + rax + 0x16001b0c]
01a1c be3dffffff                     mov        esi, 0xffffff3d
01a21 8bef                           mov        ebp, edi
01a23 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01a28 4c890424                       mov        qword ptr [rsp], r8
01a2c 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01a31 4489442408                     mov        dword ptr [rsp + 8], r8d
01a36 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
01a3b 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01a40 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
01a48 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01a4d 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01a52 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01a57 4c8b442448                     mov        r8, qword ptr [rsp + 0x48]
01a5c 4c89442438                     mov        qword ptr [rsp + 0x38], r8
01a61 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01a66 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01a6b 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
01a70 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01a75 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
01a7a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01a7f 448b4c2454                     mov        r9d, dword ptr [rsp + 0x54]
01a84 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01a89 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01a8e 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01a93 448b8c2490000000               mov        r9d, dword ptr [rsp + 0x90]
01a9b 48ffb42480000000               push       qword ptr [rsp + 0x80]
01aa3 488f442478                     pop        qword ptr [rsp + 0x78]
01aa8 44898c2480000000               mov        dword ptr [rsp + 0x80], r9d
01ab0 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
01ab8 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
01ac0 666690                         nop        
01ac3 e8986fb6ff                     call       0x7fef879c3660
01ac8 0f1f8400c01b0017               nop        dword ptr [rax + rax + 0x17001bc0]
01ad0 4d3bc2                         cmp        r8, r10
01ad3 bdffffffff                     mov        ebp, 0xffffffff
01ad8 7c08                           jl         0x7fef87e5c6e2
01ada 400f95c5                       setne      bpl
01ade 400fb6ed                       movzx      ebp, bpl
01ae2 be45ffffff                     mov        esi, 0xffffff45
01ae7 e8746fb6ff                     call       0x7fef879c3660
01aec 0f1f8400e41b0018               nop        dword ptr [rax + rax + 0x18001be4]
01af4 be45ffffff                     mov        esi, 0xffffff45
01af9 6690                           nop        
01afb e8606fb6ff                     call       0x7fef879c3660
01b00 0f1f8400f81b0019               nop        dword ptr [rax + rax + 0x19001bf8]
01b08 be6effffff                     mov        esi, 0xffffff6e
01b0d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01b12 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01b17 44890424                       mov        dword ptr [rsp], r8d
01b1b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01b20 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b25 4c895c2408                     mov        qword ptr [rsp + 8], r11
01b2a 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01b2f 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01b34 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b39 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b3e 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01b42 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01b47 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01b4b e8106fb6ff                     call       0x7fef879c3660
01b50 0f1f8400481c001a               nop        dword ptr [rax + rax + 0x1a001c48]
01b58 be6effffff                     mov        esi, 0xffffff6e
01b5d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01b62 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01b67 44890424                       mov        dword ptr [rsp], r8d
01b6b 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01b70 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b75 4c895c2408                     mov        qword ptr [rsp + 8], r11
01b7a 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01b7f 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01b84 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01b89 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b8e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b93 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b98 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b9d 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01ba2 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01ba7 897c2444                       mov        dword ptr [rsp + 0x44], edi
01bab e8b06eb6ff                     call       0x7fef879c3660
01bb0 0f1f8400a81c001b               nop        dword ptr [rax + rax + 0x1b001ca8]
01bb8 be66ffffff                     mov        esi, 0xffffff66
01bbd 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01bc2 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01bc7 44891c24                       mov        dword ptr [rsp], r11d
01bcb 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01bd0 44895c2404                     mov        dword ptr [rsp + 4], r11d
01bd5 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01bda 4c895c2408                     mov        qword ptr [rsp + 8], r11
01bdf 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01be4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01be9 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bee 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01bf3 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01bf7 8954243c                       mov        dword ptr [rsp + 0x3c], edx
01bfb e8606eb6ff                     call       0x7fef879c3660
01c00 0f1f8400f81c001c               nop        dword ptr [rax + rax + 0x1c001cf8]
01c08 be66ffffff                     mov        esi, 0xffffff66
01c0d 488b6c2438                     mov        rbp, qword ptr [rsp + 0x38]
01c12 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c17 44891c24                       mov        dword ptr [rsp], r11d
01c1b 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01c20 44895c2404                     mov        dword ptr [rsp + 4], r11d
01c25 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01c2a 4c895c2408                     mov        qword ptr [rsp + 8], r11
01c2f 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
01c34 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01c39 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c3e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01c43 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01c48 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c4d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c52 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01c57 897c2444                       mov        dword ptr [rsp + 0x44], edi
01c5b e8006eb6ff                     call       0x7fef879c3660
01c60 0f1f8400581d001d               nop        dword ptr [rax + rax + 0x1d001d58]
01c68 bef6ffffff                     mov        esi, 0xfffffff6
01c6d 418beb                         mov        ebp, r11d
01c70 666690                         nop        
01c73 e8e86db6ff                     call       0x7fef879c3660
01c78 0f1f8400701d001e               nop        dword ptr [rax + rax + 0x1e001d70]
01c80 bef6ffffff                     mov        esi, 0xfffffff6
01c85 6690                           nop        
01c87 e8d46db6ff                     call       0x7fef879c3660
01c8c 0f1f8400841d001f               nop        dword ptr [rax + rax + 0x1f001d84]
01c94 bef6ffffff                     mov        esi, 0xfffffff6
01c99 6690                           nop        
01c9b e8c06db6ff                     call       0x7fef879c3660
01ca0 0f1f8400981d0020               nop        dword ptr [rax + rax + 0x20001d98]
01ca8 bef6ffffff                     mov        esi, 0xfffffff6
01cad 6690                           nop        
01caf e8ac6db6ff                     call       0x7fef879c3660
01cb4 0f1f8400ac1d0021               nop        dword ptr [rax + rax + 0x21001dac]
01cbc bef6ffffff                     mov        esi, 0xfffffff6
01cc1 6690                           nop        
01cc3 e8986db6ff                     call       0x7fef879c3660
01cc8 0f1f8400c01d0022               nop        dword ptr [rax + rax + 0x22001dc0]
01cd0 bef6ffffff                     mov        esi, 0xfffffff6
01cd5 6690                           nop        
01cd7 e8846db6ff                     call       0x7fef879c3660
01cdc 0f1f8400d41d0023               nop        dword ptr [rax + rax + 0x23001dd4]
01ce4 bef6ffffff                     mov        esi, 0xfffffff6
01ce9 6690                           nop        
01ceb e8706db6ff                     call       0x7fef879c3660
01cf0 0f1f8400e81d0024               nop        dword ptr [rax + rax + 0x24001de8]
01cf8 bef6ffffff                     mov        esi, 0xfffffff6
01cfd 6690                           nop        
01cff e85c6db6ff                     call       0x7fef879c3660
01d04 0f1f8400fc1d0025               nop        dword ptr [rax + rax + 0x25001dfc]
01d0c bef6ffffff                     mov        esi, 0xfffffff6
01d11 6690                           nop        
01d13 e8486db6ff                     call       0x7fef879c3660
01d18 0f1f8400101e0026               nop        dword ptr [rax + rax + 0x26001e10]
01d20 49ba79b5e587ef7f0000           movabs     r10, 0x7fef87e5b579
01d2a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01d31 e9aa15aaff                     jmp        0x7fef878fdee0
01d36 e865e1a8ff                     call       0x7fef878eaaa0
01d3b e9dee2ffff                     jmp        0x7fef87e5ac1e
