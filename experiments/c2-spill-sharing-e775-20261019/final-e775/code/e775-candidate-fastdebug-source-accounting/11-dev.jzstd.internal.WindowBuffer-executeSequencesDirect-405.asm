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
0001a 0f8540dcb4ff                   jne        0x7ff77b72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85a4340000                   jne        0x7ff77bbe45e2
0003e 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742408                     mov        qword ptr [rsp + 8], rsi
00051 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
00055 448b4604                       mov        r8d, dword ptr [rsi + 4]
00059 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0005e 458bc8                         mov        r9d, r8d
00061 452bca                         sub        r9d, r10d
00064 8b8c24e0000000                 mov        ecx, dword ptr [rsp + 0xe0]
0006b 413bc9                         cmp        ecx, r9d
0006e 0f8f402a0000                   jg         0x7ff77bbe3bb4
00074 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00078 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0007d 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00081 48638c24e0000000               movsxd     rcx, dword ptr [rsp + 0xe0]
00089 4d63ca                         movsxd     r9, r10d
0008c 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
00091 4d2bc1                         sub        r8, r9
00094 493bc8                         cmp        rcx, r8
00097 0f8f172a0000                   jg         0x7ff77bbe3bb4
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f8451150000                   je         0x7ff77bbe2704
000b3 33d2                           xor        edx, edx
000b5 4d8bf3                         mov        r14, r11
000b8 418b7304                       mov        esi, dword ptr [r11 + 4]
000bc 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
000c1 418b5b40                       mov        ebx, dword ptr [r11 + 0x40]
000c5 448bef                         mov        r13d, edi
000c8 85ff                           test       edi, edi
000ca 0f8ecc220000                   jle        0x7ff77bbe349c
000d0 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
000d8 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000dd 448d4ee0                       lea        r9d, [rsi - 0x20]
000e1 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
000e5 83c1e0                         add        ecx, -0x20
000e8 4c8bd8                         mov        r11, rax
000eb 418b7b04                       mov        edi, dword ptr [r11 + 4]
000ef 85ff                           test       edi, edi
000f1 0f86e9290000                   jbe        0x7ff77bbe3be0
000f7 4c63d7                         movsxd     r10, edi
000fa 4963fd                         movsxd     rdi, r13d
000fd 48ffcf                         dec        rdi
00100 493bfa                         cmp        rdi, r10
00103 0f83d7290000                   jae        0x7ff77bbe3be0
00109 488b8424e8000000               mov        rax, qword ptr [rsp + 0xe8]
00111 8b7804                         mov        edi, dword ptr [rax + 4]
00114 85ff                           test       edi, edi
00116 0f86402a0000                   jbe        0x7ff77bbe3c5c
0011c 83ff01                         cmp        edi, 1
0011f 0f86372a0000                   jbe        0x7ff77bbe3c5c
00125 83ff02                         cmp        edi, 2
00128 0f862e2a0000                   jbe        0x7ff77bbe3c5c
0012e 448d56f1                       lea        r10d, [rsi - 0xf]
00132 4585d2                         test       r10d, r10d
00135 0f8c212a0000                   jl         0x7ff77bbe3c5c
0013b 8b6b04                         mov        ebp, dword ptr [rbx + 4]
0013e 448d55f1                       lea        r10d, [rbp - 0xf]
00142 4585d2                         test       r10d, r10d
00145 0f8c112a0000                   jl         0x7ff77bbe3c5c
0014b 448d55f9                       lea        r10d, [rbp - 7]
0014f 4585d2                         test       r10d, r10d
00152 0f8c042a0000                   jl         0x7ff77bbe3c5c
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
001ad 4d63da                         movsxd     r11, r10d
001b0 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
001b5 458d58f1                       lea        r11d, [r8 - 0xf]
001b9 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
001be 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
001c3 4983c3f9                       add        r11, -7
001c7 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
001cf 458d42f9                       lea        r8d, [r10 - 7]
001d3 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
001db 4183c2f1                       add        r10d, -0xf
001df 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
001e7 4533f6                         xor        r14d, r14d
001ea 4533c0                         xor        r8d, r8d
001ed e944040000                     jmp        0x7ff77bbe1736
001f2 448bd3                         mov        r10d, ebx
001f5 4d63d2                         movsxd     r10, r10d
001f8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001ff c442a8f5db                     bzhi       r11, r11, r10
00204 c4c1fb92fb                     kmovq      k7, r11
00209 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0020f 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00215 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0021d 4403d3                         add        r10d, ebx
00220 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00228 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0022c 418502                         test       dword ptr [r10], eax
0022f 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00237 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
0023f 0f8d7b0a0000                   jge        0x7ff77bbe1dc0
00245 418bed                         mov        ebp, r13d
00248 448bcd                         mov        r9d, ebp
0024b 442b8c2498000000               sub        r9d, dword ptr [rsp + 0x98]
00253 8b9c2490000000                 mov        ebx, dword ptr [rsp + 0x90]
0025a 2b9c2498000000                 sub        ebx, dword ptr [rsp + 0x98]
00261 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
00268 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00270 410f4fdb                       cmovg      ebx, r11d
00274 4585c9                         test       r9d, r9d
00277 0f8c2b1c0000                   jl         0x7ff77bbe2fa8
0027d 85ed                           test       ebp, ebp
0027f 0f8c231c0000                   jl         0x7ff77bbe2fa8
00285 468d140b                       lea        r10d, [rbx + r9]
00289 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00291 453bda                         cmp        r11d, r10d
00294 0f820e1c0000                   jb         0x7ff77bbe2fa8
0029a 448d2c2b                       lea        r13d, [rbx + rbp]
0029e 453bdd                         cmp        r11d, r13d
002a1 0f82011c0000                   jb         0x7ff77bbe2fa8
002a7 85db                           test       ebx, ebx
002a9 0f8cf91b0000                   jl         0x7ff77bbe2fa8
002af 85db                           test       ebx, ebx
002b1 0f845effffff                   je         0x7ff77bbe1315
002b7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
002bc 498d742a08                     lea        rsi, [r10 + rbp + 8]
002c1 4b8d7c0a08                     lea        rdi, [r10 + r9 + 8]
002c6 4863d3                         movsxd     rdx, ebx
002c9 4883fa20                       cmp        rdx, 0x20
002cd 0f861fffffff                   jbe        0x7ff77bbe12f2
002d3 c5f877                         vzeroupper 
002d6 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
002e0 41ffd2                         call       r10
002e3 0f1f840000000000               nop        dword ptr [rax + rax]
002eb e925ffffff                     jmp        0x7ff77bbe1315
002f0 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
002f8 c4817a7f440b08                 vmovdqu    xmmword ptr [r11 + r9 + 8], xmm0
002ff 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00307 4503d1                         add        r10d, r9d
0030a e901030000                     jmp        0x7ff77bbe1710
0030f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00314 4b8d7c2a08                     lea        rdi, [r10 + r13 + 8]
00319 458bda                         mov        r11d, r10d
0031c 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00324 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00329 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00331 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
00339 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
00341 4963ca                         movsxd     rcx, r10d
00344 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
0034c 443b9c2490000000               cmp        r11d, dword ptr [rsp + 0x90]
00354 0f8cf3060000                   jl         0x7ff77bbe1b4d
0035a 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00362 4183fa30                       cmp        r10d, 0x30
00366 0f8e98000000                   jle        0x7ff77bbe1504
0036c 4585ed                         test       r13d, r13d
0036f 0f8ce31b0000                   jl         0x7ff77bbe3058
00375 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0037d 4585db                         test       r11d, r11d
00380 0f8cd21b0000                   jl         0x7ff77bbe3058
00386 4503d5                         add        r10d, r13d
00389 448b8424e8000000               mov        r8d, dword ptr [rsp + 0xe8]
00391 453bc2                         cmp        r8d, r10d
00394 0f82be1b0000                   jb         0x7ff77bbe3058
0039a 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
003a2 0f82b01b0000                   jb         0x7ff77bbe3058
003a8 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
003b0 4585db                         test       r11d, r11d
003b3 0f8447020000                   je         0x7ff77bbe1700
003b9 4963d3                         movsxd     rdx, r11d
003bc 4883fa20                       cmp        rdx, 0x20
003c0 7725                           ja         0x7ff77bbe14e7
003c2 4d63d3                         movsxd     r10, r11d
003c5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003cc c442a8f5db                     bzhi       r11, r11, r10
003d1 c4c1fb92fb                     kmovq      k7, r11
003d6 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003dc 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003e2 e919020000                     jmp        0x7ff77bbe1700
003e7 c5f877                         vzeroupper 
003ea 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
003f4 41ffd2                         call       r10
003f7 0f1f840000000000               nop        dword ptr [rax + rax]
003ff e9fc010000                     jmp        0x7ff77bbe1700
00404 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
0040c 0f83ee160000                   jae        0x7ff77bbe2c00
00412 4963dd                         movsxd     rbx, r13d
00415 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0041a 4d8b4c1b08                     mov        r9, qword ptr [r11 + rbx + 8]
0041f 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00427 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
0042f 0f8393170000                   jae        0x7ff77bbe2cc8
00435 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0043d 458d4208                       lea        r8d, [r10 + 8]
00441 4d63da                         movsxd     r11, r10d
00444 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
00448 4e894c1f08                     mov        qword ptr [rdi + r11 + 8], r9
0044d 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
00455 0f8da5010000                   jge        0x7ff77bbe1700
0045b 492bdb                         sub        rbx, r11
0045e 4d63c8                         movsxd     r9, r8d
00461 4d8d1c19                       lea        r11, [r9 + rbx]
00465 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0046d 0f8321180000                   jae        0x7ff77bbe2d94
00473 4c8bd9                         mov        r11, rcx
00476 4d2bd9                         sub        r11, r9
00479 4983c307                       add        r11, 7
0047d 4983e3f8                       and        r11, 0xfffffffffffffff8
00481 458bcb                         mov        r9d, r11d
00484 478d5c1108                     lea        r11d, [r9 + r10 + 8]
00489 4d63db                         movsxd     r11, r11d
0048c 4d8d4c1bf8                     lea        r9, [r11 + rbx - 8]
00491 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
00499 0f83f5170000                   jae        0x7ff77bbe2d94
0049f 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
004a7 0f83e7170000                   jae        0x7ff77bbe2d94
004ad 4983c3f8                       add        r11, -8
004b1 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
004b9 0f83d5170000                   jae        0x7ff77bbe2d94
004bf 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
004c7 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004ce 0f8f8c180000                   jg         0x7ff77bbe2e60
004d4 452bea                         sub        r13d, r10d
004d7 4183c210                       add        r10d, 0x10
004db 478d0c28                       lea        r9d, [r8 + r13]
004df 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
004e4 4b8b7c0b08                     mov        rdi, qword ptr [r11 + r9 + 8]
004e9 458bc8                         mov        r9d, r8d
004ec 4b897c0b08                     mov        qword ptr [r11 + r9 + 8], rdi
004f1 458d5808                       lea        r11d, [r8 + 8]
004f5 453bda                         cmp        r11d, r10d
004f8 7d05                           jge        0x7ff77bbe15ff
004fa 458bc3                         mov        r8d, r11d
004fd ebdc                           jmp        0x7ff77bbe15db
004ff 4883c1f8                       add        rcx, -8
00503 4881f900000080                 cmp        rcx, -0x80000000
0050a 49c7c200000080                 mov        r10, 0xffffffff80000000
00511 490f4cca                       cmovl      rcx, r10
00515 448bc9                         mov        r9d, ecx
00518 453bd9                         cmp        r11d, r9d
0051b 0f8d8d000000                   jge        0x7ff77bbe16ae
00521 4d63d3                         movsxd     r10, r11d
00524 4c03d3                         add        r10, rbx
00527 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0052f 0f83fb180000                   jae        0x7ff77bbe2f30
00535 4183c010                       add        r8d, 0x10
00539 4d63d0                         movsxd     r10, r8d
0053c 4c03d3                         add        r10, rbx
0053f 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
00547 0f83f7180000                   jae        0x7ff77bbe2f44
0054d 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00555 0f83fd180000                   jae        0x7ff77bbe2f58
0055b 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
00563 0f8303190000                   jae        0x7ff77bbe2f6c
00569 90                             nop        
0056a 90                             nop        
0056b 90                             nop        
0056c 90                             nop        
0056d 90                             nop        
0056e 90                             nop        
0056f 90                             nop        
00570 438d3c2b                       lea        edi, [r11 + r13]
00574 458bc3                         mov        r8d, r11d
00577 4963c8                         movsxd     rcx, r8d
0057a 448bd7                         mov        r10d, edi
0057d 8b542470                       mov        edx, dword ptr [rsp + 0x70]
00581 4a8b541208                     mov        rdx, qword ptr [rdx + r10 + 8]
00586 4863ff                         movsxd     rdi, edi
00589 458bc3                         mov        r8d, r11d
0058c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00591 4b89540208                     mov        qword ptr [r10 + r8 + 8], rdx
00596 4d8b543a10                     mov        r10, qword ptr [r10 + rdi + 0x10]
0059b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
005a0 4d89540810                     mov        qword ptr [r8 + rcx + 0x10], r10
005a5 4183c310                       add        r11d, 0x10
005a9 453bd9                         cmp        r11d, r9d
005ac 7cc2                           jl         0x7ff77bbe1670
005ae 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
005b6 7d48                           jge        0x7ff77bbe1700
005b8 4d63d3                         movsxd     r10, r11d
005bb 4c03d3                         add        r10, rbx
005be 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
005c6 0f83b4180000                   jae        0x7ff77bbe2f80
005cc 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
005d4 0f83ba180000                   jae        0x7ff77bbe2f94
005da 90                             nop        
005db 90                             nop        
005dc 478d142b                       lea        r10d, [r11 + r13]
005e0 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
005e5 4f8b441108                     mov        r8, qword ptr [r9 + r10 + 8]
005ea 458bd3                         mov        r10d, r11d
005ed 4f89441108                     mov        qword ptr [r9 + r10 + 8], r8
005f2 4183c308                       add        r11d, 8
005f6 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
005fe 7cdc                           jl         0x7ff77bbe16dc
00600 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00608 4403942490000000               add        r10d, dword ptr [rsp + 0x90]
00610 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00618 41ffc0                         inc        r8d
0061b 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00620 0f8d68080000                   jge        0x7ff77bbe1f8e
00626 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
0062e 448bb4249c000000               mov        r14d, dword ptr [rsp + 0x9c]
00636 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0063b 4f8b5cc208                     mov        r11, qword ptr [r10 + r8*8 + 8]
00640 4d8bd3                         mov        r10, r11
00643 49c1ea12                       shr        r10, 0x12
00647 458bd2                         mov        r10d, r10d
0064a 4181e2ffff0300                 and        r10d, 0x3ffff
00651 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00659 458bd3                         mov        r10d, r11d
0065c 49c1fb24                       sar        r11, 0x24
00660 4181e2ffff0100                 and        r10d, 0x1ffff
00667 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0066f 458bd3                         mov        r10d, r11d
00672 458bca                         mov        r9d, r10d
00675 4585d2                         test       r10d, r10d
00678 0f8c02120000                   jl         0x7ff77bbe2980
0067e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00686 4585db                         test       r11d, r11d
00689 0f8599020000                   jne        0x7ff77bbe1a28
0068f 4533d2                         xor        r10d, r10d
00692 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0069a 458bd1                         mov        r10d, r9d
0069d 4183fa03                       cmp        r10d, 3
006a1 0f8eeb020000                   jle        0x7ff77bbe1a92
006a7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006ac 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006b0 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
006b5 45895310                       mov        dword ptr [r11 + 0x10], r10d
006b9 458b5b08                       mov        r11d, dword ptr [r11 + 8]
006bd 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006c2 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
006c6 458d51fd                       lea        r10d, [r9 - 3]
006ca 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
006d2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006d7 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
006df 45895a08                       mov        dword ptr [r10 + 8], r11d
006e3 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
006eb 48639c2498000000               movsxd     rbx, dword ptr [rsp + 0x98]
006f3 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
006fb 4c638424a8000000               movsxd     r8, dword ptr [rsp + 0xa8]
00703 4c03442430                     add        r8, qword ptr [rsp + 0x30]
00708 4863942494000000               movsxd     rdx, dword ptr [rsp + 0x94]
00710 4c03c2                         add        r8, rdx
00713 488beb                         mov        rbp, rbx
00716 493bd8                         cmp        rbx, r8
00719 0f8f09120000                   jg         0x7ff77bbe2a28
0071f 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
00726 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0072d 448beb                         mov        r13d, ebx
00730 442bac2498000000               sub        r13d, dword ptr [rsp + 0x98]
00738 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0073d 4585d2                         test       r10d, r10d
00740 0f8426020000                   je         0x7ff77bbe1a6c
00746 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0074b 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00753 4585db                         test       r11d, r11d
00756 0f8eec100000                   jle        0x7ff77bbe2948
0075c 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00764 4403db                         add        r11d, ebx
00767 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
0076c 0f8f3e120000                   jg         0x7ff77bbe2ab0
00772 458bd6                         mov        r10d, r14d
00775 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
0077d 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00785 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
0078a 0f8fd4120000                   jg         0x7ff77bbe2b64
00790 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00798 4183fa10                       cmp        r10d, 0x10
0079c 0f8f2b050000                   jg         0x7ff77bbe1dcd
007a2 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
007a7 0f83760e0000                   jae        0x7ff77bbe2723
007ad 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007b2 c4817a6f443208                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 8]
007b9 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
007c1 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
007c9 0f83110f0000                   jae        0x7ff77bbe27e0
007cf 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007d7 4503de                         add        r11d, r14d
007da 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
007e2 448b742470                     mov        r14d, dword ptr [rsp + 0x70]
007e7 c4817a7f441608                 vmovdqu    xmmword ptr [r14 + r10 + 8], xmm0
007ee 448bb42494000000               mov        r14d, dword ptr [rsp + 0x94]
007f6 4503f2                         add        r14d, r10d
007f9 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00801 458bee                         mov        r13d, r14d
00804 442bac2498000000               sub        r13d, dword ptr [rsp + 0x98]
0080c 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00814 4183fb10                       cmp        r11d, 0x10
00818 0f8ff1faffff                   jg         0x7ff77bbe140f
0081e 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00826 4183fa10                       cmp        r10d, 0x10
0082a 0f8cdffaffff                   jl         0x7ff77bbe140f
00830 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
00838 0f83620f0000                   jae        0x7ff77bbe28a0
0083e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00843 c4817a6f442b08                 vmovdqu    xmm0, xmmword ptr [r11 + r13 + 8]
0084a 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00852 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0085a 0f8290faffff                   jb         0x7ff77bbe13f0
00860 bee4ffffff                     mov        esi, 0xffffffe4
00865 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0086a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0086f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00877 448b1c24                       mov        r11d, dword ptr [rsp]
0087b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
00883 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00888 4c891424                       mov        qword ptr [rsp], r10
0088c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00891 4c89542408                     mov        qword ptr [rsp + 8], r10
00896 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0089b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
008a3 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
008a8 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008ad 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
008b2 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008b7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
008bc 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008c1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
008c6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
008cb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008d0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008d5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
008da 4c89542438                     mov        qword ptr [rsp + 0x38], r10
008df 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
008e4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
008e9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008ee 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
008f3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008f8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
008fd c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
00903 90                             nop        
00904 c5f877                         vzeroupper 
00907 e854c0aeff                     call       0x7ff77b6cda60
0090c 0f1f8400040a0001               nop        dword ptr [rax + rax + 0x1000a04]
00914 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
0091e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00922 e8b9e11718                     call       0x7ff793d5fbe0
00927 f4                             hlt        
00928 448b1424                       mov        r10d, dword ptr [rsp]
0092c 452bd6                         sub        r10d, r14d
0092f 453bda                         cmp        r11d, r10d
00932 0f8e62fdffff                   jle        0x7ff77bbe179a
00938 be45ffffff                     mov        esi, 0xffffff45
0093d 418beb                         mov        ebp, r11d
00940 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
00948 c5f877                         vzeroupper 
0094b e810c0aeff                     call       0x7ff77b6cda60
00950 0f1f8400480a0002               nop        dword ptr [rax + rax + 0x2000a48]
00958 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
00962 4883e4f0                       and        rsp, 0xfffffffffffffff0
00966 e875e11718                     call       0x7ff793d5fbe0
0096b f4                             hlt        
0096c 4d63d5                         movsxd     r10, r13d
0096f 4c3b542440                     cmp        r10, qword ptr [rsp + 0x40]
00974 0f8ca6160000                   jl         0x7ff77bbe3120
0097a 483b6c2448                     cmp        rbp, qword ptr [rsp + 0x48]
0097f 0f8f3b170000                   jg         0x7ff77bbe31c0
00985 4533db                         xor        r11d, r11d
00988 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0098d e9b9fdffff                     jmp        0x7ff77bbe184b
00992 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
0099a 4585d2                         test       r10d, r10d
0099d 7407                           je         0x7ff77bbe1aa6
0099f 458d51ff                       lea        r10d, [r9 - 1]
009a3 458bca                         mov        r9d, r10d
009a6 4585c9                         test       r9d, r9d
009a9 7516                           jne        0x7ff77bbe1ac1
009ab 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
009b0 418b4a08                       mov        ecx, dword ptr [r10 + 8]
009b4 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
009bc e980000000                     jmp        0x7ff77bbe1b41
009c1 4183f903                       cmp        r9d, 3
009c5 0f84a91a0000                   je         0x7ff77bbe3574
009cb 4183f902                       cmp        r9d, 2
009cf 0f874f1b0000                   ja         0x7ff77bbe3624
009d5 443b8c24e4000000               cmp        r9d, dword ptr [rsp + 0xe4]
009dd 0f83f2180000                   jae        0x7ff77bbe33d5
009e3 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
009e8 438b4c8b08                     mov        ecx, dword ptr [r11 + r9*4 + 8]
009ed 4585c9                         test       r9d, r9d
009f0 7e3e                           jle        0x7ff77bbe1b30
009f2 458d51ff                       lea        r10d, [r9 - 1]
009f6 443b9424e4000000               cmp        r10d, dword ptr [rsp + 0xe4]
009fe 0f83af190000                   jae        0x7ff77bbe34b3
00a04 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00a0c 90                             nop        
00a0d 90                             nop        
00a0e 90                             nop        
00a0f 90                             nop        
00a10 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00a15 478b548b04                     mov        r10d, dword ptr [r11 + r9*4 + 4]
00a1a 4d8bc3                         mov        r8, r11
00a1d 4789548808                     mov        dword ptr [r8 + r9*4 + 8], r10d
00a22 458d51ff                       lea        r10d, [r9 - 1]
00a26 458bca                         mov        r9d, r10d
00a29 4585d2                         test       r10d, r10d
00a2c 7fe2                           jg         0x7ff77bbe1b10
00a2e eb08                           jmp        0x7ff77bbe1b38
00a30 44898424b0000000               mov        dword ptr [rsp + 0xb0], r8d
00a38 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00a3d 41894a08                       mov        dword ptr [r10 + 8], ecx
00a41 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
00a48 e99efcffff                     jmp        0x7ff77bbe17eb
00a4d 4183fb10                       cmp        r11d, 0x10
00a51 0f8dc11f0000                   jge        0x7ff77bbe3b18
00a57 4183fb08                       cmp        r11d, 8
00a5b 0f8d5d070000                   jge        0x7ff77bbe22be
00a61 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00a69 4183fa10                       cmp        r10d, 0x10
00a6d 0f8ebc000000                   jle        0x7ff77bbe1c2f
00a73 4585ed                         test       r13d, r13d
00a76 0f8cd41e0000                   jl         0x7ff77bbe3a50
00a7c 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00a84 4585db                         test       r11d, r11d
00a87 0f8cc31e0000                   jl         0x7ff77bbe3a50
00a8d 448b9424e8000000               mov        r10d, dword ptr [rsp + 0xe8]
00a95 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00a9d 0f82ad1e0000                   jb         0x7ff77bbe3a50
00aa3 8bac2498000000                 mov        ebp, dword ptr [rsp + 0x98]
00aaa 03ac2494000000                 add        ebp, dword ptr [rsp + 0x94]
00ab1 443bd5                         cmp        r10d, ebp
00ab4 0f82961e0000                   jb         0x7ff77bbe3a50
00aba 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00ac2 4585d2                         test       r10d, r10d
00ac5 0f8c851e0000                   jl         0x7ff77bbe3a50
00acb 4585d2                         test       r10d, r10d
00ace 0f8474f7ffff                   je         0x7ff77bbe1348
00ad4 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
00adc 4883fb20                       cmp        rbx, 0x20
00ae0 772d                           ja         0x7ff77bbe1c0f
00ae2 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00aea 4d63d3                         movsxd     r10, r11d
00aed 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00af4 c442a8f5db                     bzhi       r11, r11, r10
00af9 c4c1fb92fb                     kmovq      k7, r11
00afe 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b04 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b0a e939f7ffff                     jmp        0x7ff77bbe1348
00b0f 488bd3                         mov        rdx, rbx
00b12 c5f877                         vzeroupper 
00b15 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00b1f 41ffd2                         call       r10
00b22 0f1f840000000000               nop        dword ptr [rax + rax]
00b2a e919f7ffff                     jmp        0x7ff77bbe1348
00b2f 443bac24e8000000               cmp        r13d, dword ptr [rsp + 0xe8]
00b37 0f83971a0000                   jae        0x7ff77bbe36d4
00b3d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00b42 430fbe6c2b08                   movsx      ebp, byte ptr [r11 + r13 + 8]
00b48 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b50 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00b58 0f833e1b0000                   jae        0x7ff77bbe379c
00b5e 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00b63 43886c1a08                     mov        byte ptr [r10 + r11 + 8], bpl
00b68 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00b70 41ffc2                         inc        r10d
00b73 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00b7b 458d5d03                       lea        r11d, [r13 + 3]
00b7f 443b9c24e8000000               cmp        r11d, dword ptr [rsp + 0xe8]
00b87 0f83bb1b0000                   jae        0x7ff77bbe3848
00b8d 4d63cd                         movsxd     r9, r13d
00b90 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00b95 430fbe6c0b09                   movsx      ebp, byte ptr [r11 + r9 + 9]
00b9b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00ba3 4183c203                       add        r10d, 3
00ba7 443b9424e8000000               cmp        r10d, dword ptr [rsp + 0xe8]
00baf 0f83431c0000                   jae        0x7ff77bbe38f8
00bb5 4c63842494000000               movsxd     r8, dword ptr [rsp + 0x94]
00bbd 43886c0309                     mov        byte ptr [r11 + r8 + 9], bpl
00bc2 430fbe4c0b0a                   movsx      ecx, byte ptr [r11 + r9 + 0xa]
00bc8 43884c030a                     mov        byte ptr [r11 + r8 + 0xa], cl
00bcd 470fbe5c0b0b                   movsx      r11d, byte ptr [r11 + r9 + 0xb]
00bd3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00bd8 47885c020b                     mov        byte ptr [r10 + r8 + 0xb], r11b
00bdd 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00be5 4183fb08                       cmp        r11d, 8
00be9 0f83b11c0000                   jae        0x7ff77bbe39a0
00bef 49bbf03b27e300000000           movabs     r11, 0xe3273bf0
00bf9 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00c01 47036c9308                     add        r13d, dword ptr [r11 + r10*4 + 8]
00c06 44896c2404                     mov        dword ptr [rsp + 4], r13d
00c0b 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00c13 4183fa04                       cmp        r10d, 4
00c17 7e3f                           jle        0x7ff77bbe1d58
00c19 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00c20 83c504                         add        ebp, 4
00c23 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c28 418bd5                         mov        edx, r13d
00c2b 90                             nop        
00c2c c5f877                         vzeroupper 
00c2f e82cdfb4ff                     call       0x7ff77b72fc60
00c34 0f1f84002c0d0003               nop        dword ptr [rax + rax + 0x3000d2c]
00c3c 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c41 8bd5                           mov        edx, ebp
00c43 8bc8                           mov        ecx, eax
00c45 90                             nop        
00c46 90                             nop        
00c47 90                             nop        
00c48 c5f877                         vzeroupper 
00c4b e810dfb4ff                     call       0x7ff77b72fc60
00c50 0f1f8400480d0004               nop        dword ptr [rax + rax + 0x4000d48]
00c58 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00c60 4183fb08                       cmp        r11d, 8
00c64 7e5a                           jle        0x7ff77bbe1dc0
00c66 8b542404                       mov        edx, dword ptr [rsp + 4]
00c6a 49ba183c27e300000000           movabs     r10, 0xe3273c18
00c74 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00c7c 432b548208                     sub        edx, dword ptr [r10 + r8*4 + 8]
00c81 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00c88 83c508                         add        ebp, 8
00c8b 83c208                         add        edx, 8
00c8e 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c93 90                             nop        
00c94 c5f877                         vzeroupper 
00c97 e8c4deb4ff                     call       0x7ff77b72fc60
00c9c 0f1f8400940d0005               nop        dword ptr [rax + rax + 0x5000d94]
00ca4 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00ca9 8bd5                           mov        edx, ebp
00cab 488bc8                         mov        rcx, rax
00cae 90                             nop        
00caf 90                             nop        
00cb0 c5f877                         vzeroupper 
00cb3 e8a8deb4ff                     call       0x7ff77b72fc60
00cb8 0f1f8400b00d0006               nop        dword ptr [rax + rax + 0x6000db0]
00cc0 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00cc8 e943f9ffff                     jmp        0x7ff77bbe1710
00ccd 4183fa30                       cmp        r10d, 0x30
00cd1 0f8eb6000000                   jle        0x7ff77bbe1e8d
00cd7 4585f6                         test       r14d, r14d
00cda 0f8c00210000                   jl         0x7ff77bbe3ee0
00ce0 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00ce8 4585d2                         test       r10d, r10d
00ceb 0f8cf7200000                   jl         0x7ff77bbe3ee8
00cf1 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
00cf9 443b84249c000000               cmp        r8d, dword ptr [rsp + 0x9c]
00d01 0f82e1200000                   jb         0x7ff77bbe3ee8
00d07 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
00d0f 443bdb                         cmp        r11d, ebx
00d12 0f82d0200000                   jb         0x7ff77bbe3ee8
00d18 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00d20 4585db                         test       r11d, r11d
00d23 7442                           je         0x7ff77bbe1e67
00d25 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00d2a 4b8d7c3308                     lea        rdi, [r11 + r14 + 8]
00d2f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00d34 4b8d741308                     lea        rsi, [r11 + r10 + 8]
00d39 4883fa20                       cmp        rdx, 0x20
00d3d 7734                           ja         0x7ff77bbe1e73
00d3f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00d47 4d63d2                         movsxd     r10, r10d
00d4a 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d51 c442a8f5db                     bzhi       r11, r11, r10
00d56 c4c1fb92fb                     kmovq      k7, r11
00d5b 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d61 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d67 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00d6e e999faffff                     jmp        0x7ff77bbe190c
00d73 c5f877                         vzeroupper 
00d76 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00d80 41ffd2                         call       r10
00d83 0f1f840000000000               nop        dword ptr [rax + rax]
00d8b ebda                           jmp        0x7ff77bbe1e67
00d8d 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
00d92 0f83b01e0000                   jae        0x7ff77bbe3d48
00d98 4963c6                         movsxd     rax, r14d
00d9b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00da0 c4c17a6f440208                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 8]
00da7 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
00dae 3bbc248c000000                 cmp        edi, dword ptr [rsp + 0x8c]
00db5 0f83511f0000                   jae        0x7ff77bbe3e0c
00dbb 4c63cf                         movsxd     r9, edi
00dbe 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00dc3 c4817a7f440a08                 vmovdqu    xmmword ptr [r10 + r9 + 8], xmm0
00dca 448d5f10                       lea        r11d, [rdi + 0x10]
00dce 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00dd6 458bc3                         mov        r8d, r11d
00dd9 443bdb                         cmp        r11d, ebx
00ddc 0f8dbd030000                   jge        0x7ff77bbe229f
00de2 492bc1                         sub        rax, r9
00de5 4d63d3                         movsxd     r10, r11d
00de8 4c638c24ec000000               movsxd     r9, dword ptr [rsp + 0xec]
00df0 4983c1f1                       add        r9, -0xf
00df4 4d8d1c02                       lea        r11, [r10 + rax]
00df8 4d3bd9                         cmp        r11, r9
00dfb 0f83b3200000                   jae        0x7ff77bbe3fb4
00e01 4863d3                         movsxd     rdx, ebx
00e04 4c8bda                         mov        r11, rdx
00e07 4d2bda                         sub        r11, r10
00e0a 4983c30f                       add        r11, 0xf
00e0e 4983e3f0                       and        r11, 0xfffffffffffffff0
00e12 458bd3                         mov        r10d, r11d
00e15 458d543a10                     lea        r10d, [r10 + rdi + 0x10]
00e1a 4d63d2                         movsxd     r10, r10d
00e1d 4d8d5c02f0                     lea        r11, [r10 + rax - 0x10]
00e22 4d3bd9                         cmp        r11, r9
00e25 0f8389200000                   jae        0x7ff77bbe3fb4
00e2b 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00e33 0f837b200000                   jae        0x7ff77bbe3fb4
00e39 4983c2f0                       add        r10, -0x10
00e3d 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00e42 4983c3f1                       add        r11, -0xf
00e46 4d3bd3                         cmp        r10, r11
00e49 0f8365200000                   jae        0x7ff77bbe3fb4
00e4f 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00e55 0f8ff9200000                   jg         0x7ff77bbe4054
00e5b 458bd6                         mov        r10d, r14d
00e5e 442bd7                         sub        r10d, edi
00e61 83c720                         add        edi, 0x20
00e64 e9df000000                     jmp        0x7ff77bbe2048
00e69 4d63d3                         movsxd     r10, r11d
00e6c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e73 c442a8f5db                     bzhi       r11, r11, r10
00e78 c4c1fb92fb                     kmovq      k7, r11
00e7d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e83 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e89 e990000000                     jmp        0x7ff77bbe201e
00e8e 448b1c24                       mov        r11d, dword ptr [rsp]
00e92 442b9c249c000000               sub        r11d, dword ptr [rsp + 0x9c]
00e9a 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00ea2 4585c0                         test       r8d, r8d
00ea5 0f8c491d0000                   jl         0x7ff77bbe3cf4
00eab 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
00eb0 8bb424e0000000                 mov        esi, dword ptr [rsp + 0xe0]
00eb7 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00ebb 4585d2                         test       r10d, r10d
00ebe 0f8c391d0000                   jl         0x7ff77bbe3cfd
00ec4 3b3424                         cmp        esi, dword ptr [rsp]
00ec7 0f82301d0000                   jb         0x7ff77bbe3cfd
00ecd 438d2c1a                       lea        ebp, [r10 + r11]
00ed1 448b4b04                       mov        r9d, dword ptr [rbx + 4]
00ed5 443bcd                         cmp        r9d, ebp
00ed8 0f821f1d0000                   jb         0x7ff77bbe3cfd
00ede 4585db                         test       r11d, r11d
00ee1 0f8c161d0000                   jl         0x7ff77bbe3cfd
00ee7 4585db                         test       r11d, r11d
00eea 7432                           je         0x7ff77bbe201e
00eec 4b8d7c0608                     lea        rdi, [r14 + r8 + 8]
00ef1 4c8bc3                         mov        r8, rbx
00ef4 4a8d741308                     lea        rsi, [rbx + r10 + 8]
00ef9 4963d3                         movsxd     rdx, r11d
00efc 4883fa20                       cmp        rdx, 0x20
00f00 0f8663ffffff                   jbe        0x7ff77bbe1f69
00f06 c5f877                         vzeroupper 
00f09 49ba4091717bf77f0000           movabs     r10, 0x7ff77b719140
00f13 41ffd2                         call       r10
00f16 0f1f840000000000               nop        dword ptr [rax + rax]
00f1e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00f23 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00f27 c5f877                         vzeroupper 
00f2a 4881c4d0000000                 add        rsp, 0xd0
00f31 5d                             pop        rbp
00f32 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00f36 0f8790250000                   ja         0x7ff77bbe45cc
00f3c c3                             ret        
00f3d 90                             nop        
00f3e 90                             nop        
00f3f 90                             nop        
00f40 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00f48 458bc2                         mov        r8d, r10d
00f4b 440384249c000000               add        r8d, dword ptr [rsp + 0x9c]
00f53 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00f58 c4817a6f440308                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 8]
00f5f 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f67 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00f6b c4a17a7f441908                 vmovdqu    xmmword ptr [rcx + r11 + 8], xmm0
00f72 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00f7a 4183c010                       add        r8d, 0x10
00f7e 443bc7                         cmp        r8d, edi
00f81 7cbd                           jl         0x7ff77bbe2040
00f83 4881c210ffffff                 add        rdx, -0xf0
00f8a 4881fa00000080                 cmp        rdx, -0x80000000
00f91 49c7c300000080                 mov        r11, 0xffffffff80000000
00f98 490f4cd3                       cmovl      rdx, r11
00f9c 448bda                         mov        r11d, edx
00f9f 453bc3                         cmp        r8d, r11d
00fa2 0f8dae010000                   jge        0x7ff77bbe2256
00fa8 4963c8                         movsxd     rcx, r8d
00fab 4803c8                         add        rcx, rax
00fae 493bc9                         cmp        rcx, r9
00fb1 0f833d200000                   jae        0x7ff77bbe40f4
00fb7 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00fbe 81c100010000                   add        ecx, 0x100
00fc4 4863f9                         movsxd     rdi, ecx
00fc7 4803f8                         add        rdi, rax
00fca 493bf9                         cmp        rdi, r9
00fcd 0f8335200000                   jae        0x7ff77bbe4108
00fd3 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00fdb 0f833b200000                   jae        0x7ff77bbe411c
00fe1 3b8c248c000000                 cmp        ecx, dword ptr [rsp + 0x8c]
00fe8 0f8342200000                   jae        0x7ff77bbe4130
00fee 90                             nop        
00fef 90                             nop        
00ff0 438d3402                       lea        esi, [r10 + r8]
00ff4 418bc8                         mov        ecx, r8d
00ff7 4863f9                         movsxd     rdi, ecx
00ffa 8bce                           mov        ecx, esi
00ffc 488b542468                     mov        rdx, qword ptr [rsp + 0x68]
01001 c5fa6f440a08                   vmovdqu    xmm0, xmmword ptr [rdx + rcx + 8]
01007 4863d6                         movsxd     rdx, esi
0100a 418bc8                         mov        ecx, r8d
0100d 8b742470                       mov        esi, dword ptr [rsp + 0x70]
01011 c5fa7f440e08                   vmovdqu    xmmword ptr [rsi + rcx + 8], xmm0
01017 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0101c c5fa6f441118                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x18]
01022 c5fa7f443e18                   vmovdqu    xmmword ptr [rsi + rdi + 0x18], xmm0
01028 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0102d c5fa6f441128                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x28]
01033 c5fa7f443e28                   vmovdqu    xmmword ptr [rsi + rdi + 0x28], xmm0
01039 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0103e c5fa6f441138                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x38]
01044 c5fa7f443e38                   vmovdqu    xmmword ptr [rsi + rdi + 0x38], xmm0
0104a 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0104f c5fa6f441148                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x48]
01055 c5fa7f443e48                   vmovdqu    xmmword ptr [rsi + rdi + 0x48], xmm0
0105b 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01060 c5fa6f441158                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x58]
01066 c5fa7f443e58                   vmovdqu    xmmword ptr [rsi + rdi + 0x58], xmm0
0106c 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01071 c5fa6f441168                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x68]
01077 c5fa7f443e68                   vmovdqu    xmmword ptr [rsi + rdi + 0x68], xmm0
0107d 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01082 c5fa6f441178                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x78]
01088 c5fa7f443e78                   vmovdqu    xmmword ptr [rsi + rdi + 0x78], xmm0
0108e 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01093 c5fa6f841188000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x88]
0109c c5fa7f843e88000000             vmovdqu    xmmword ptr [rsi + rdi + 0x88], xmm0
010a5 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010aa c5fa6f841198000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x98]
010b3 c5fa7f843e98000000             vmovdqu    xmmword ptr [rsi + rdi + 0x98], xmm0
010bc 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010c1 c5fa6f8411a8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xa8]
010ca c5fa7f843ea8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xa8], xmm0
010d3 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010d8 c5fa6f8411b8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xb8]
010e1 c5fa7f843eb8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xb8], xmm0
010ea 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010ef c5fa6f8411c8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xc8]
010f8 c5fa7f843ec8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xc8], xmm0
01101 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01106 c5fa6f8411d8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xd8]
0110f c5fa7f843ed8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xd8], xmm0
01118 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0111d c5fa6f8411e8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xe8]
01126 c5fa7f843ee8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xe8], xmm0
0112f 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01134 c5fa6f8411f8000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xf8]
0113d c5fa7f843ef8000000             vmovdqu    xmmword ptr [rsi + rdi + 0xf8], xmm0
01146 4181c000010000                 add        r8d, 0x100
0114d 453bc3                         cmp        r8d, r11d
01150 0f8c9afeffff                   jl         0x7ff77bbe20f0
01156 443bc3                         cmp        r8d, ebx
01159 7d44                           jge        0x7ff77bbe229f
0115b 4d63d8                         movsxd     r11, r8d
0115e 4c03d8                         add        r11, rax
01161 4d3bd9                         cmp        r11, r9
01164 0f83f2210000                   jae        0x7ff77bbe445c
0116a 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
01172 0f83f8210000                   jae        0x7ff77bbe4470
01178 478d0c02                       lea        r9d, [r10 + r8]
0117c 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01181 c4817a6f440b08                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 8]
01188 458bd8                         mov        r11d, r8d
0118b 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0118f c4a17a7f441908                 vmovdqu    xmmword ptr [rcx + r11 + 8], xmm0
01196 4183c010                       add        r8d, 0x10
0119a 443bc3                         cmp        r8d, ebx
0119d 7cd9                           jl         0x7ff77bbe2278
0119f 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
011a7 4503d6                         add        r10d, r14d
011aa 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
011b2 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
011b9 e94ef6ffff                     jmp        0x7ff77bbe190c
011be 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
011c6 0f83781e0000                   jae        0x7ff77bbe4144
011cc 458bd5                         mov        r10d, r13d
011cf 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
011d7 4963da                         movsxd     rbx, r10d
011da 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
011df 4d8b541b08                     mov        r10, qword ptr [r11 + rbx + 8]
011e4 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
011ec 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
011f4 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
011fc 0f830a1f0000                   jae        0x7ff77bbe420c
01202 448b8c2494000000               mov        r9d, dword ptr [rsp + 0x94]
0120a 458d5908                       lea        r11d, [r9 + 8]
0120e 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
01216 4d63d1                         movsxd     r10, r9d
01219 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0121e 4c8b8424a0000000               mov        r8, qword ptr [rsp + 0xa0]
01226 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
0122b 8bac2498000000                 mov        ebp, dword ptr [rsp + 0x98]
01232 3bac24a8000000                 cmp        ebp, dword ptr [rsp + 0xa8]
01239 0f8db8030000                   jge        0x7ff77bbe26f7
0123f 492bda                         sub        rbx, r10
01242 4c63dd                         movsxd     r11, ebp
01245 4d8d141b                       lea        r10, [r11 + rbx]
01249 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01251 0f83551f0000                   jae        0x7ff77bbe42ac
01257 4c8bd1                         mov        r10, rcx
0125a 4d2bd3                         sub        r10, r11
0125d 4983c207                       add        r10, 7
01261 4983e2f8                       and        r10, 0xfffffffffffffff8
01265 458bc2                         mov        r8d, r10d
01268 478d540808                     lea        r10d, [r8 + r9 + 8]
0126d 4d63d2                         movsxd     r10, r10d
01270 4d8d441af8                     lea        r8, [r10 + rbx - 8]
01275 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
0127d 0f83291f0000                   jae        0x7ff77bbe42ac
01283 3bac2488000000                 cmp        ebp, dword ptr [rsp + 0x88]
0128a 0f831c1f0000                   jae        0x7ff77bbe42ac
01290 4983c2f8                       add        r10, -8
01294 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0129c 0f830a1f0000                   jae        0x7ff77bbe42ac
012a2 448b8424a8000000               mov        r8d, dword ptr [rsp + 0xa8]
012aa 4181f8f8ffff7f                 cmp        r8d, 0x7ffffff8
012b1 0f8fa51f0000                   jg         0x7ff77bbe435c
012b7 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
012bf 452bd1                         sub        r10d, r9d
012c2 418bc2                         mov        eax, r10d
012c5 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
012ca 418bf8                         mov        edi, r8d
012cd 41baf8ffffff                   mov        r10d, 0xfffffff8
012d3 442bd7                         sub        r10d, edi
012d6 452bd1                         sub        r10d, r9d
012d9 4183c110                       add        r9d, 0x10
012dd 4183c2f0                       add        r10d, -0x10
012e1 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
012e6 498bf8                         mov        rdi, r8
012e9 4c8d41c8                       lea        r8, [rcx - 0x38]
012ed 4981f800000080                 cmp        r8, -0x80000000
012f4 48c7c200000080                 mov        rdx, 0xffffffff80000000
012fb 4c0f4cc2                       cmovl      r8, rdx
012ff 418bd0                         mov        edx, r8d
01302 442bac2494000000               sub        r13d, dword ptr [rsp + 0x94]
0130a 4963f1                         movsxd     rsi, r9d
0130d 41b806000000                   mov        r8d, 6
01313 c442b8f5d2                     bzhi       r10, r10, r8
01318 4903f2                         add        rsi, r10
0131b 483bf1                         cmp        rsi, rcx
0131e 4c8bc1                         mov        r8, rcx
01321 4c0f4cc6                       cmovl      r8, rsi
01325 4d8bd0                         mov        r10, r8
01328 4d2bd3                         sub        r10, r11
0132b 498d72ff                       lea        rsi, [r10 - 1]
0132f 48c1fe3f                       sar        rsi, 0x3f
01333 48c1ee3d                       shr        rsi, 0x3d
01337 4e8d5416ff                     lea        r10, [rsi + r10 - 1]
0133c 4983e2f8                       and        r10, 0xfffffffffffffff8
01340 4d03d3                         add        r10, r11
01343 4d3bda                         cmp        r11, r10
01346 4d0f4cda                       cmovl      r11, r10
0134a 458bd3                         mov        r10d, r11d
0134d 438d741508                     lea        esi, [r13 + r10 + 8]
01352 4183c208                       add        r10d, 8
01356 4863f6                         movsxd     rsi, esi
01359 4803f7                         add        rsi, rdi
0135c 4963ea                         movsxd     rbp, r10d
0135f 4803ef                         add        rbp, rdi
01362 4c8d5e08                       lea        r11, [rsi + 8]
01366 4883c648                       add        rsi, 0x48
0136a 488d7d48                       lea        rdi, [rbp + 0x48]
0136e 4533d2                         xor        r10d, r10d
01371 493bfb                         cmp        rdi, r11
01374 410f96c2                       setbe      r10b
01378 4883c508                       add        rbp, 8
0137c 4533db                         xor        r11d, r11d
0137f 483bf5                         cmp        rsi, rbp
01382 410f96c3                       setbe      r11b
01386 450bd3                         or         r10d, r11d
01389 0f84d90d0000                   je         0x7ff77bbe3268
0138f 458bc0                         mov        r8d, r8d
01392 eb08                           jmp        0x7ff77bbe249c
01394 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
0139c 448bd0                         mov        r10d, eax
0139f 4403942498000000               add        r10d, dword ptr [rsp + 0x98]
013a7 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
013ac 4f8b541108                     mov        r10, qword ptr [r9 + r10 + 8]
013b1 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
013b9 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
013be 448b8c2498000000               mov        r9d, dword ptr [rsp + 0x98]
013c6 4183c108                       add        r9d, 8
013ca 453bc8                         cmp        r9d, r8d
013cd 7cc5                           jl         0x7ff77bbe2494
013cf 4881c108feffff                 add        rcx, -0x1f8
013d6 4881f900000080                 cmp        rcx, -0x80000000
013dd 49c7c200000080                 mov        r10, 0xffffffff80000000
013e4 490f4cca                       cmovl      rcx, r10
013e8 448bc1                         mov        r8d, ecx
013eb 453bc8                         cmp        r9d, r8d
013ee 0f8d101f0000                   jge        0x7ff77bbe4404
013f4 4d63d1                         movsxd     r10, r9d
013f7 4c03d3                         add        r10, rbx
013fa 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01402 0f83041f0000                   jae        0x7ff77bbe440c
01408 8b8c2498000000                 mov        ecx, dword ptr [rsp + 0x98]
0140f 81c100020000                   add        ecx, 0x200
01415 4c63d1                         movsxd     r10, ecx
01418 4c03d3                         add        r10, rbx
0141b 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01423 0f83f71e0000                   jae        0x7ff77bbe4420
01429 443b8c2488000000               cmp        r9d, dword ptr [rsp + 0x88]
01431 0f83fd1e0000                   jae        0x7ff77bbe4434
01437 3b8c2488000000                 cmp        ecx, dword ptr [rsp + 0x88]
0143e 0f83041f0000                   jae        0x7ff77bbe4448
01444 eb0d                           jmp        0x7ff77bbe2553
01446 90                             nop        
01447 90                             nop        
01448 90                             nop        
01449 90                             nop        
0144a 90                             nop        
0144b 90                             nop        
0144c 90                             nop        
0144d 90                             nop        
0144e 90                             nop        
0144f 90                             nop        
01450 448bc9                         mov        r9d, ecx
01453 468d1408                       lea        r10d, [rax + r9]
01457 418bc9                         mov        ecx, r9d
0145a 4863c9                         movsxd     rcx, ecx
0145d 458bda                         mov        r11d, r10d
01460 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
01464 62b17e486f841f08000000         vmovdqu32  zmm0, zmmword ptr [rdi + r11 + 8]
0146f 4963ea                         movsxd     rbp, r10d
01472 458d5140                       lea        r10d, [r9 + 0x40]
01476 4403d0                         add        r10d, eax
01479 418db180000000                 lea        esi, [r9 + 0x80]
01480 03f0                           add        esi, eax
01482 418db900010000                 lea        edi, [r9 + 0x100]
01489 03f8                           add        edi, eax
0148b 458bd9                         mov        r11d, r9d
0148e 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
01493 62917e487f841d08000000         vmovdqu32  zmmword ptr [r13 + r11 + 8], zmm0
0149e 62917e486f841508000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 8]
014a9 62d17e487f840d48000000         vmovdqu32  zmmword ptr [r13 + rcx + 0x48], zmm0
014b4 62d17e486f843508000000         vmovdqu32  zmm0, zmmword ptr [r13 + rsi + 8]
014bf 62d17e487f840d88000000         vmovdqu32  zmmword ptr [r13 + rcx + 0x88], zmm0
014ca 62d17e486f842dc8000000         vmovdqu32  zmm0, zmmword ptr [r13 + rbp + 0xc8]
014d5 62d17e487f840dc8000000         vmovdqu32  zmmword ptr [r13 + rcx + 0xc8], zmm0
014e0 448bd7                         mov        r10d, edi
014e3 62917e486f841508000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 8]
014ee 62d17e487f840d08010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x108], zmm0
014f9 62d17e486f842d48010000         vmovdqu32  zmm0, zmmword ptr [r13 + rbp + 0x148]
01504 62d17e487f840d48010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x148], zmm0
0150f 62d17e486f842d88010000         vmovdqu32  zmm0, zmmword ptr [r13 + rbp + 0x188]
0151a 62d17e487f840d88010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x188], zmm0
01525 4c63d7                         movsxd     r10, edi
01528 62917e486f8415c8000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 0xc8]
01533 62d17e487f840dc8010000         vmovdqu32  zmmword ptr [r13 + rcx + 0x1c8], zmm0
0153e 418d8900020000                 lea        ecx, [r9 + 0x200]
01545 413bc8                         cmp        ecx, r8d
01548 0f8c02ffffff                   jl         0x7ff77bbe2550
0154e 3bca                           cmp        ecx, edx
01550 7d53                           jge        0x7ff77bbe26a5
01552 4181c138020000                 add        r9d, 0x238
01559 4d63d1                         movsxd     r10, r9d
0155c 4c03d3                         add        r10, rbx
0155f 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01567 0f83171e0000                   jae        0x7ff77bbe4484
0156d 443b8c2488000000               cmp        r9d, dword ptr [rsp + 0x88]
01575 0f83311e0000                   jae        0x7ff77bbe44ac
0157b 90                             nop        
0157c 448d1408                       lea        r10d, [rax + rcx]
01580 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01585 62917e486f841308000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 8]
01590 448bd1                         mov        r10d, ecx
01593 62917e487f841308000000         vmovdqu32  zmmword ptr [r11 + r10 + 8], zmm0
0159e 83c140                         add        ecx, 0x40
015a1 3bca                           cmp        ecx, edx
015a3 7cd7                           jl         0x7ff77bbe267c
015a5 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
015ac 7d49                           jge        0x7ff77bbe26f7
015ae 4c63d1                         movsxd     r10, ecx
015b1 4c03d3                         add        r10, rbx
015b4 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
015bc 0f83d61d0000                   jae        0x7ff77bbe4498
015c2 3b8c2488000000                 cmp        ecx, dword ptr [rsp + 0x88]
015c9 0f83f11d0000                   jae        0x7ff77bbe44c0
015cf 90                             nop        
015d0 448d1408                       lea        r10d, [rax + rcx]
015d4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
015d9 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
015de 448bd9                         mov        r11d, ecx
015e1 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
015e6 4f89541908                     mov        qword ptr [r9 + r11 + 8], r10
015eb 83c108                         add        ecx, 8
015ee 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
015f5 7cd9                           jl         0x7ff77bbe26d0
015f7 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
015ff e90cf0ffff                     jmp        0x7ff77bbe1710
01604 4c03c9                         add        r9, rcx
01607 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
0160c 7e08                           jle        0x7ff77bbe2716
0160e 4533c0                         xor        r8d, r8d
01611 e99deaffff                     jmp        0x7ff77bbe11b3
01616 4533c0                         xor        r8d, r8d
01619 ba01000000                     mov        edx, 1
0161e e992eaffff                     jmp        0x7ff77bbe11b5
01623 bee4ffffff                     mov        esi, 0xffffffe4
01628 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0162d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01632 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0163a 448b1c24                       mov        r11d, dword ptr [rsp]
0163e 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01646 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0164b 4c891424                       mov        qword ptr [rsp], r10
0164f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01654 4c89542408                     mov        qword ptr [rsp + 8], r10
01659 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0165e 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
01666 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0166b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01670 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01675 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0167a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0167f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01684 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01689 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0168e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01693 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01698 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0169d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
016a2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
016a7 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
016ac 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
016b1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
016b6 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
016bb 90                             nop        
016bc c5f877                         vzeroupper 
016bf e89cb2aeff                     call       0x7ff77b6cda60
016c4 0f1f8400bc170007               nop        dword ptr [rax + rax + 0x70017bc]
016cc 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
016d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
016da e801d41718                     call       0x7ff793d5fbe0
016df f4                             hlt        
016e0 bee4ffffff                     mov        esi, 0xffffffe4
016e5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
016ea 448b0424                       mov        r8d, dword ptr [rsp]
016ee 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
016f6 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
016fb 4c891c24                       mov        qword ptr [rsp], r11
016ff 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01704 4c895c2408                     mov        qword ptr [rsp + 8], r11
01709 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0170e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01716 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
0171b 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01720 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01725 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0172a 4489742420                     mov        dword ptr [rsp + 0x20], r14d
0172f 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
01734 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01739 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0173e 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
01743 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01748 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0174d 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01752 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01757 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
0175c 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
01761 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01766 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0176b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01770 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01775 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
0177b 90                             nop        
0177c c5f877                         vzeroupper 
0177f e8dcb1aeff                     call       0x7ff77b6cda60
01784 0f1f84007c180008               nop        dword ptr [rax + rax + 0x800187c]
0178c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01796 4883e4f0                       and        rsp, 0xfffffffffffffff0
0179a e841d31718                     call       0x7ff793d5fbe0
0179f f4                             hlt        
017a0 bee4ffffff                     mov        esi, 0xffffffe4
017a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017aa 448b1424                       mov        r10d, dword ptr [rsp]
017ae 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
017b6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017bb 4c891424                       mov        qword ptr [rsp], r10
017bf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
017c4 4c89542408                     mov        qword ptr [rsp + 8], r10
017c9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
017ce 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
017d6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
017db 4c89542410                     mov        qword ptr [rsp + 0x10], r10
017e0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
017e5 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017ea 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
017ef 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017f4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017f9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
017fe 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01803 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01808 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0180d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01812 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01817 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0181c 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01821 90                             nop        
01822 90                             nop        
01823 90                             nop        
01824 c5f877                         vzeroupper 
01827 e834b1aeff                     call       0x7ff77b6cda60
0182c 0f1f840024190009               nop        dword ptr [rax + rax + 0x9001924]
01834 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
0183e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01842 e899d21718                     call       0x7ff793d5fbe0
01847 f4                             hlt        
01848 be45ffffff                     mov        esi, 0xffffff45
0184d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01852 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
0185a 90                             nop        
0185b 90                             nop        
0185c c5f877                         vzeroupper 
0185f e8fcb0aeff                     call       0x7ff77b6cda60
01864 0f1f84005c19000a               nop        dword ptr [rax + rax + 0xa00195c]
0186c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01876 4883e4f0                       and        rsp, 0xfffffffffffffff0
0187a e861d21718                     call       0x7ff793d5fbe0
0187f f4                             hlt        
01880 be45ffffff                     mov        esi, 0xffffff45
01885 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0188a 448b1424                       mov        r10d, dword ptr [rsp]
0188e 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01896 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0189b 4c891424                       mov        qword ptr [rsp], r10
0189f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018a4 4c89542408                     mov        qword ptr [rsp + 8], r10
018a9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018ae 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
018b6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018bb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018c0 4489742420                     mov        dword ptr [rsp + 0x20], r14d
018c5 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
018ca 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
018cf 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018d4 4c89542428                     mov        qword ptr [rsp + 0x28], r10
018d9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
018de 4489542430                     mov        dword ptr [rsp + 0x30], r10d
018e3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018e8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018ed 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
018f2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
018f7 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
018fc 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01901 90                             nop        
01902 90                             nop        
01903 90                             nop        
01904 c5f877                         vzeroupper 
01907 e854b0aeff                     call       0x7ff77b6cda60
0190c 0f1f8400041a000b               nop        dword ptr [rax + rax + 0xb001a04]
01914 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
0191e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01922 e8b9d11718                     call       0x7ff793d5fbe0
01927 f4                             hlt        
01928 493bd8                         cmp        rbx, r8
0192b bdffffffff                     mov        ebp, 0xffffffff
01930 7c08                           jl         0x7ff77bbe2a3a
01932 400f95c5                       setne      bpl
01936 400fb6ed                       movzx      ebp, bpl
0193a be45ffffff                     mov        esi, 0xffffff45
0193f 48ff742408                     push       qword ptr [rsp + 8]
01944 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
0194c 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01951 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01959 48ff742420                     push       qword ptr [rsp + 0x20]
0195e 488f442408                     pop        qword ptr [rsp + 8]
01963 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01968 4489542404                     mov        dword ptr [rsp + 4], r10d
0196d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01972 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01977 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0197c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01981 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01986 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0198b 90                             nop        
0198c c5f877                         vzeroupper 
0198f e8ccafaeff                     call       0x7ff77b6cda60
01994 0f1f84008c1a000c               nop        dword ptr [rax + rax + 0xc001a8c]
0199c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
019a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019aa e831d11718                     call       0x7ff793d5fbe0
019af f4                             hlt        
019b0 be45ffffff                     mov        esi, 0xffffff45
019b5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019ba 448b0424                       mov        r8d, dword ptr [rsp]
019be 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
019c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019cb 4c891424                       mov        qword ptr [rsp], r10
019cf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019d4 4c89542408                     mov        qword ptr [rsp + 8], r10
019d9 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
019de 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
019e6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019eb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
019f0 4489742420                     mov        dword ptr [rsp + 0x20], r14d
019f5 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
019fa 4489542424                     mov        dword ptr [rsp + 0x24], r10d
019ff 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a04 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a09 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01a0e 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01a13 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a18 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a1d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a22 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a27 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a2c 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a31 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01a36 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01a3b 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01a40 c5f877                         vzeroupper 
01a43 e818afaeff                     call       0x7ff77b6cda60
01a48 0f1f8400401b000d               nop        dword ptr [rax + rax + 0xd001b40]
01a50 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01a5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a5e e87dd01718                     call       0x7ff793d5fbe0
01a63 f4                             hlt        
01a64 be45ffffff                     mov        esi, 0xffffff45
01a69 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a6e 448b1424                       mov        r10d, dword ptr [rsp]
01a72 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01a7a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a7f 4c891424                       mov        qword ptr [rsp], r10
01a83 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01a88 4c89542408                     mov        qword ptr [rsp + 8], r10
01a8d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01a92 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01a9a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01a9f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01aa4 4489742420                     mov        dword ptr [rsp + 0x20], r14d
01aa9 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01aae 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ab3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ab8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01abd 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ac2 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ac7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01acc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ad1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ad6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01adb 90                             nop        
01adc c5f877                         vzeroupper 
01adf e87caeaeff                     call       0x7ff77b6cda60
01ae4 0f1f8400dc1b000e               nop        dword ptr [rax + rax + 0xe001bdc]
01aec 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01af6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01afa e8e1cf1718                     call       0x7ff793d5fbe0
01aff f4                             hlt        
01b00 bee4ffffff                     mov        esi, 0xffffffe4
01b05 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b0a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b0f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01b17 448b1c24                       mov        r11d, dword ptr [rsp]
01b1b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01b23 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b28 4c891424                       mov        qword ptr [rsp], r10
01b2c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b31 4c89542408                     mov        qword ptr [rsp + 8], r10
01b36 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01b3b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01b43 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b48 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b4d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b52 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01b57 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01b5c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b61 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b66 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b6b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b70 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b75 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b7a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b7f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b84 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b89 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01b8e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01b93 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01b98 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01b9d 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
01ba2 90                             nop        
01ba3 90                             nop        
01ba4 c5f877                         vzeroupper 
01ba7 e8b4adaeff                     call       0x7ff77b6cda60
01bac 0f1f8400a41c000f               nop        dword ptr [rax + rax + 0xf001ca4]
01bb4 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01bbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bc2 e819cf1718                     call       0x7ff793d5fbe0
01bc7 f4                             hlt        
01bc8 bee4ffffff                     mov        esi, 0xffffffe4
01bcd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01bd2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01bd7 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
01bdf 448b1424                       mov        r10d, dword ptr [rsp]
01be3 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01beb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bf0 4c891424                       mov        qword ptr [rsp], r10
01bf4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01bf9 4c89542408                     mov        qword ptr [rsp + 8], r10
01bfe 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01c03 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01c0b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c10 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c15 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c1a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01c1f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c24 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c29 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c2e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c33 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c38 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c3d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c42 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c47 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c4c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c51 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c56 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01c5b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c60 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c65 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01c6a 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01c6f 90                             nop        
01c70 c5f877                         vzeroupper 
01c73 e8e8acaeff                     call       0x7ff77b6cda60
01c78 0f1f8400701d0010               nop        dword ptr [rax + rax + 0x10001d70]
01c80 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01c8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c8e e84dce1718                     call       0x7ff793d5fbe0
01c93 f4                             hlt        
01c94 4183c508                       add        r13d, 8
01c98 be6effffff                     mov        esi, 0xffffff6e
01c9d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01ca2 448b1c24                       mov        r11d, dword ptr [rsp]
01ca6 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01cae 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01cb3 4c891c24                       mov        qword ptr [rsp], r11
01cb7 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01cbc 4c895c2408                     mov        qword ptr [rsp + 8], r11
01cc1 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01cc6 44898c24ec000000               mov        dword ptr [rsp + 0xec], r9d
01cce 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01cd3 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01cd8 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01cdd 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01ce2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ce7 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01cec 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cf1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01cf6 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cfb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d00 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01d05 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01d0a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d0f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01d14 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01d19 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01d1e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d23 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01d2b 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01d30 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01d35 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01d3a 90                             nop        
01d3b 90                             nop        
01d3c c5f877                         vzeroupper 
01d3f e81cacaeff                     call       0x7ff77b6cda60
01d44 0f1f84003c1e0011               nop        dword ptr [rax + rax + 0x11001e3c]
01d4c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01d56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d5a e881cd1718                     call       0x7ff793d5fbe0
01d5f f4                             hlt        
01d60 4183c508                       add        r13d, 8
01d64 be66ffffff                     mov        esi, 0xffffff66
01d69 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d6e 448b0c24                       mov        r9d, dword ptr [rsp]
01d72 44898c24e8000000               mov        dword ptr [rsp + 0xe8], r9d
01d7a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01d7f 4c891c24                       mov        qword ptr [rsp], r11
01d83 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01d88 4c895c2408                     mov        qword ptr [rsp + 8], r11
01d8d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01d92 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01d9a 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01d9f 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01da4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01da9 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01dae 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01db3 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01db8 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01dbd 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01dc2 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01dc7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01dcc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01dd1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01dd6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ddb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01de0 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01de5 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01dea 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01def 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01df7 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01dfc 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01e01 458bd3                         mov        r10d, r11d
01e04 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e09 90                             nop        
01e0a 90                             nop        
01e0b 90                             nop        
01e0c c5f877                         vzeroupper 
01e0f e84cabaeff                     call       0x7ff77b6cda60
01e14 0f1f84000c1f0012               nop        dword ptr [rax + rax + 0x12001f0c]
01e1c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01e26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e2a e8b1cc1718                     call       0x7ff793d5fbe0
01e2f f4                             hlt        
01e30 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
01e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3e e89dcc1718                     call       0x7ff793d5fbe0
01e43 f4                             hlt        
01e44 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
01e4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e52 e889cc1718                     call       0x7ff793d5fbe0
01e57 f4                             hlt        
01e58 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
01e62 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e66 e875cc1718                     call       0x7ff793d5fbe0
01e6b f4                             hlt        
01e6c 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
01e76 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e7a e861cc1718                     call       0x7ff793d5fbe0
01e7f f4                             hlt        
01e80 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
01e8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e8e e84dcc1718                     call       0x7ff793d5fbe0
01e93 f4                             hlt        
01e94 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
01e9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ea2 e839cc1718                     call       0x7ff793d5fbe0
01ea7 f4                             hlt        
01ea8 beccffffff                     mov        esi, 0xffffffcc
01ead 48ff742408                     push       qword ptr [rsp + 8]
01eb2 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
01eba 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01ebf 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ec7 48ff742420                     push       qword ptr [rsp + 0x20]
01ecc 488f442408                     pop        qword ptr [rsp + 8]
01ed1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01ed6 44895c2404                     mov        dword ptr [rsp + 4], r11d
01edb 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01ee0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ee5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01eea 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01eef 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01ef4 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ef9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01efe 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01f03 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f08 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f0d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01f12 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f17 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01f1c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01f21 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01f26 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01f2b 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01f30 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01f34 c5f877                         vzeroupper 
01f37 e824aaaeff                     call       0x7ff77b6cda60
01f3c 0f1f840034200013               nop        dword ptr [rax + rax + 0x13002034]
01f44 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
01f4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f52 e889cb1718                     call       0x7ff793d5fbe0
01f57 f4                             hlt        
01f58 beccffffff                     mov        esi, 0xffffffcc
01f5d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f62 448b1424                       mov        r10d, dword ptr [rsp]
01f66 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
01f6e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f73 4c891424                       mov        qword ptr [rsp], r10
01f77 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01f7c 4c89542408                     mov        qword ptr [rsp + 8], r10
01f81 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01f86 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01f8e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01f93 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01f98 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f9d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01fa2 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01fa7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fac 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01fb1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01fb6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01fbb 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01fc0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fc5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fca 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01fcf 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fd4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01fd9 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01fde 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01fe3 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01fe8 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01ff0 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01ff5 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01ffa 90                             nop        
01ffb 90                             nop        
01ffc c5f877                         vzeroupper 
01fff e85ca9aeff                     call       0x7ff77b6cda60
02004 0f1f8400fc200014               nop        dword ptr [rax + rax + 0x140020fc]
0200c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02016 4883e4f0                       and        rsp, 0xfffffffffffffff0
0201a e8c1ca1718                     call       0x7ff793d5fbe0
0201f f4                             hlt        
02020 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02025 4d3bd3                         cmp        r10, r11
02028 bdffffffff                     mov        ebp, 0xffffffff
0202d 7c08                           jl         0x7ff77bbe3137
0202f 400f95c5                       setne      bpl
02033 400fb6ed                       movzx      ebp, bpl
02037 be45ffffff                     mov        esi, 0xffffff45
0203c 48ff742408                     push       qword ptr [rsp + 8]
02041 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02049 48ff742420                     push       qword ptr [rsp + 0x20]
0204e 488f442408                     pop        qword ptr [rsp + 8]
02053 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02058 4489542404                     mov        dword ptr [rsp + 4], r10d
0205d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02062 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02067 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0206c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02071 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02076 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0207b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02080 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02085 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0208a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0208f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02094 4c89442460                     mov        qword ptr [rsp + 0x60], r8
02099 90                             nop        
0209a 90                             nop        
0209b 90                             nop        
0209c c5f877                         vzeroupper 
0209f e8bca8aeff                     call       0x7ff77b6cda60
020a4 0f1f84009c210015               nop        dword ptr [rax + rax + 0x1500219c]
020ac 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
020b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020ba e821ca1718                     call       0x7ff793d5fbe0
020bf f4                             hlt        
020c0 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
020c5 493bea                         cmp        rbp, r10
020c8 bdffffffff                     mov        ebp, 0xffffffff
020cd 7c08                           jl         0x7ff77bbe31d7
020cf 400f95c5                       setne      bpl
020d3 400fb6ed                       movzx      ebp, bpl
020d7 be45ffffff                     mov        esi, 0xffffff45
020dc 48ff742408                     push       qword ptr [rsp + 8]
020e1 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
020e9 48ff742420                     push       qword ptr [rsp + 0x20]
020ee 488f442408                     pop        qword ptr [rsp + 8]
020f3 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
020f8 4489542404                     mov        dword ptr [rsp + 4], r10d
020fd 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02102 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02107 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0210c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02111 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02116 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0211b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02120 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02125 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0212a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0212f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02134 4c89442460                     mov        qword ptr [rsp + 0x60], r8
02139 90                             nop        
0213a 90                             nop        
0213b 90                             nop        
0213c c5f877                         vzeroupper 
0213f e81ca8aeff                     call       0x7ff77b6cda60
02144 0f1f84003c220016               nop        dword ptr [rax + rax + 0x1600223c]
0214c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02156 4883e4f0                       and        rsp, 0xfffffffffffffff0
0215a e881c91718                     call       0x7ff793d5fbe0
0215f f4                             hlt        
02160 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
02168 448bd8                         mov        r11d, eax
0216b 44039c2498000000               add        r11d, dword ptr [rsp + 0x98]
02173 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02178 4f8b541a08                     mov        r10, qword ptr [r10 + r11 + 8]
0217d 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
02185 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
02189 4e89540108                     mov        qword ptr [rcx + r8 + 8], r10
0218e 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
02196 4183c008                       add        r8d, 8
0219a 453bc1                         cmp        r8d, r9d
0219d 7cc1                           jl         0x7ff77bbe3260
0219f 443bc2                         cmp        r8d, edx
021a2 0f8dcd000000                   jge        0x7ff77bbe3375
021a8 4d63d0                         movsxd     r10, r8d
021ab 4c03d3                         add        r10, rbx
021ae 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
021b6 0f8318120000                   jae        0x7ff77bbe44d4
021bc 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
021c4 4183c240                       add        r10d, 0x40
021c8 4d63da                         movsxd     r11, r10d
021cb 4c03db                         add        r11, rbx
021ce 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
021d6 0f830c120000                   jae        0x7ff77bbe44e8
021dc 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
021e4 0f8312120000                   jae        0x7ff77bbe44fc
021ea 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
021f2 0f8318120000                   jae        0x7ff77bbe4510
021f8 90                             nop        
021f9 90                             nop        
021fa 90                             nop        
021fb 90                             nop        
021fc 90                             nop        
021fd 90                             nop        
021fe 90                             nop        
021ff 90                             nop        
02200 468d1400                       lea        r10d, [rax + r8]
02204 458bc8                         mov        r9d, r8d
02207 4963c9                         movsxd     rcx, r9d
0220a 458bda                         mov        r11d, r10d
0220d 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
02212 4f8b5c1908                     mov        r11, qword ptr [r9 + r11 + 8]
02217 4963fa                         movsxd     rdi, r10d
0221a 458bc8                         mov        r9d, r8d
0221d 8b742470                       mov        esi, dword ptr [rsp + 0x70]
02221 4e895c0e08                     mov        qword ptr [rsi + r9 + 8], r11
02226 4c8b543e10                     mov        r10, qword ptr [rsi + rdi + 0x10]
0222b 4c89540e10                     mov        qword ptr [rsi + rcx + 0x10], r10
02230 4c8b543e18                     mov        r10, qword ptr [rsi + rdi + 0x18]
02235 4c89540e18                     mov        qword ptr [rsi + rcx + 0x18], r10
0223a 4c8b543e20                     mov        r10, qword ptr [rsi + rdi + 0x20]
0223f 4c89540e20                     mov        qword ptr [rsi + rcx + 0x20], r10
02244 4c8b543e28                     mov        r10, qword ptr [rsi + rdi + 0x28]
02249 4c89540e28                     mov        qword ptr [rsi + rcx + 0x28], r10
0224e 4c8b543e30                     mov        r10, qword ptr [rsi + rdi + 0x30]
02253 4c89540e30                     mov        qword ptr [rsi + rcx + 0x30], r10
02258 4c8b543e38                     mov        r10, qword ptr [rsi + rdi + 0x38]
0225d 4c89540e38                     mov        qword ptr [rsi + rcx + 0x38], r10
02262 4c8b543e40                     mov        r10, qword ptr [rsi + rdi + 0x40]
02267 4c89540e40                     mov        qword ptr [rsi + rcx + 0x40], r10
0226c 4183c040                       add        r8d, 0x40
02270 443bc2                         cmp        r8d, edx
02273 7c8b                           jl         0x7ff77bbe3300
02275 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
0227d 0f8d74f3ffff                   jge        0x7ff77bbe26f7
02283 4d63d0                         movsxd     r10, r8d
02286 4c03d3                         add        r10, rbx
02289 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
02291 0f838d110000                   jae        0x7ff77bbe4524
02297 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
0229f 0f8393110000                   jae        0x7ff77bbe4538
022a5 90                             nop        
022a6 90                             nop        
022a7 90                             nop        
022a8 468d1400                       lea        r10d, [rax + r8]
022ac 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022b1 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
022b6 458bd8                         mov        r11d, r8d
022b9 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
022bd 4e89541908                     mov        qword ptr [rcx + r11 + 8], r10
022c2 4183c008                       add        r8d, 8
022c6 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
022ce 7cd8                           jl         0x7ff77bbe33a8
022d0 e922f3ffff                     jmp        0x7ff77bbe26f7
022d5 bee4ffffff                     mov        esi, 0xffffffe4
022da 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
022df 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022e4 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
022ec 448b1c24                       mov        r11d, dword ptr [rsp]
022f0 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
022f8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022fd 4c891424                       mov        qword ptr [rsp], r10
02301 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02306 4c89542408                     mov        qword ptr [rsp + 8], r10
0230b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02310 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02318 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0231d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02322 4489742420                     mov        dword ptr [rsp + 0x20], r14d
02327 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0232c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02331 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02336 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0233b 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02340 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02345 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0234a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0234f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02354 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02359 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0235e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02363 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02368 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0236d 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02372 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02377 90                             nop        
02378 c5f877                         vzeroupper 
0237b e8e0a5aeff                     call       0x7ff77b6cda60
02380 0f1f840078240017               nop        dword ptr [rax + rax + 0x17002478]
02388 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02392 4883e4f0                       and        rsp, 0xfffffffffffffff0
02396 e845c71718                     call       0x7ff793d5fbe0
0239b f4                             hlt        
0239c 85db                           test       ebx, ebx
0239e 0f84a8100000                   je         0x7ff77bbe454c
023a4 448b0c24                       mov        r9d, dword ptr [rsp]
023a8 4533c0                         xor        r8d, r8d
023ab 458bd9                         mov        r11d, r9d
023ae e908ebffff                     jmp        0x7ff77bbe1fbb
023b3 be6effffff                     mov        esi, 0xffffff6e
023b8 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
023bd 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
023c2 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
023ca 448b1c24                       mov        r11d, dword ptr [rsp]
023ce 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
023d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023db 4c891424                       mov        qword ptr [rsp], r10
023df 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
023e4 4c89542408                     mov        qword ptr [rsp + 8], r10
023e9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
023ee 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
023f6 4489742420                     mov        dword ptr [rsp + 0x20], r14d
023fb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02400 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02405 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0240a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0240f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02414 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02419 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0241e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02423 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02428 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0242d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02432 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02437 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0243c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02441 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02446 894c2460                       mov        dword ptr [rsp + 0x60], ecx
0244a 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0244f 90                             nop        
02450 c5f877                         vzeroupper 
02453 e808a5aeff                     call       0x7ff77b6cda60
02458 0f1f840050250018               nop        dword ptr [rax + rax + 0x18002550]
02460 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
0246a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0246e e86dc61718                     call       0x7ff793d5fbe0
02473 f4                             hlt        
02474 be45ffffff                     mov        esi, 0xffffff45
02479 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0247e 448b1c24                       mov        r11d, dword ptr [rsp]
02482 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0248a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0248f 4c891424                       mov        qword ptr [rsp], r10
02493 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02498 4c89542408                     mov        qword ptr [rsp + 8], r10
0249d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
024a2 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
024aa 4489742420                     mov        dword ptr [rsp + 0x20], r14d
024af 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
024b4 4489542424                     mov        dword ptr [rsp + 0x24], r10d
024b9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
024be 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024c3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
024c8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
024cd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024d2 4c89542438                     mov        qword ptr [rsp + 0x38], r10
024d7 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
024dc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
024e1 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
024e6 4489542434                     mov        dword ptr [rsp + 0x34], r10d
024eb 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
024f0 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
024f5 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
024fa 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
024ff 90                             nop        
02500 c5f877                         vzeroupper 
02503 e858a4aeff                     call       0x7ff77b6cda60
02508 0f1f840000260019               nop        dword ptr [rax + rax + 0x19002600]
02510 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
0251a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0251e e8bdc51718                     call       0x7ff793d5fbe0
02523 f4                             hlt        
02524 be3dffffff                     mov        esi, 0xffffff3d
02529 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0252e 448b1c24                       mov        r11d, dword ptr [rsp]
02532 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0253a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0253f 4c891424                       mov        qword ptr [rsp], r10
02543 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02548 4c89542408                     mov        qword ptr [rsp + 8], r10
0254d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02552 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0255a 4489742420                     mov        dword ptr [rsp + 0x20], r14d
0255f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02564 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02569 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0256e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02573 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02578 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0257d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02582 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02587 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0258c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02591 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02596 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0259b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
025a0 4489542448                     mov        dword ptr [rsp + 0x48], r10d
025a5 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
025aa 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
025af 90                             nop        
025b0 c5f877                         vzeroupper 
025b3 e8a8a3aeff                     call       0x7ff77b6cda60
025b8 0f1f8400b026001a               nop        dword ptr [rax + rax + 0x1a0026b0]
025c0 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
025ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
025ce e80dc51718                     call       0x7ff793d5fbe0
025d3 f4                             hlt        
025d4 bee4ffffff                     mov        esi, 0xffffffe4
025d9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
025de 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
025e3 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
025eb 448b1c24                       mov        r11d, dword ptr [rsp]
025ef 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
025f7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025fc 4c891424                       mov        qword ptr [rsp], r10
02600 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02605 4c89542408                     mov        qword ptr [rsp + 8], r10
0260a 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0260f 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02617 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0261c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02621 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02626 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0262b 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02630 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02635 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0263a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0263f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02644 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02649 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0264e 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02653 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02658 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0265d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02662 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02667 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0266c 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02671 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02676 90                             nop        
02677 90                             nop        
02678 c5f877                         vzeroupper 
0267b e8e0a2aeff                     call       0x7ff77b6cda60
02680 0f1f84007827001b               nop        dword ptr [rax + rax + 0x1b002778]
02688 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02692 4883e4f0                       and        rsp, 0xfffffffffffffff0
02696 e845c41718                     call       0x7ff793d5fbe0
0269b f4                             hlt        
0269c bee4ffffff                     mov        esi, 0xffffffe4
026a1 48ff742408                     push       qword ptr [rsp + 8]
026a6 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
026ae 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026b3 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
026bb 48ff742420                     push       qword ptr [rsp + 0x20]
026c0 488f442408                     pop        qword ptr [rsp + 8]
026c5 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
026ca 4489542404                     mov        dword ptr [rsp + 4], r10d
026cf 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
026d4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026d9 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
026de 4489542420                     mov        dword ptr [rsp + 0x20], r10d
026e3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
026e8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
026ed 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
026f2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
026f7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
026fc 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02701 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02706 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0270b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02710 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02715 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0271a 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0271f 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02724 c5f877                         vzeroupper 
02727 e834a2aeff                     call       0x7ff77b6cda60
0272c 0f1f84002428001c               nop        dword ptr [rax + rax + 0x1c002824]
02734 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
0273e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02742 e899c31718                     call       0x7ff793d5fbe0
02747 f4                             hlt        
02748 418d6d01                       lea        ebp, [r13 + 1]
0274c bee4ffffff                     mov        esi, 0xffffffe4
02751 48ff742408                     push       qword ptr [rsp + 8]
02756 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
0275e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02763 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0276b 48ff742420                     push       qword ptr [rsp + 0x20]
02770 488f442408                     pop        qword ptr [rsp + 8]
02775 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0277a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0277f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02784 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02789 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0278e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02793 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02798 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0279d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
027a2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
027a7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
027ac 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027b1 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
027b6 4c89542440                     mov        qword ptr [rsp + 0x40], r10
027bb 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
027c0 4489542448                     mov        dword ptr [rsp + 0x48], r10d
027c5 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
027ca 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
027cf 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
027d4 c5f877                         vzeroupper 
027d7 e884a1aeff                     call       0x7ff77b6cda60
027dc 0f1f8400d428001d               nop        dword ptr [rax + rax + 0x1d0028d4]
027e4 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
027ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
027f2 e8e9c21718                     call       0x7ff793d5fbe0
027f7 f4                             hlt        
027f8 bee4ffffff                     mov        esi, 0xffffffe4
027fd 48ff742408                     push       qword ptr [rsp + 8]
02802 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
0280a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0280f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02817 48ff742420                     push       qword ptr [rsp + 0x20]
0281c 488f442408                     pop        qword ptr [rsp + 8]
02821 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02826 4489542404                     mov        dword ptr [rsp + 4], r10d
0282b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02830 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02835 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0283a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0283f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02844 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02849 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0284e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02853 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02858 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0285d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02862 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02867 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0286c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02871 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02876 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
0287b 90                             nop        
0287c c5f877                         vzeroupper 
0287f e8dca0aeff                     call       0x7ff77b6cda60
02884 0f1f84007c29001e               nop        dword ptr [rax + rax + 0x1e00297c]
0288c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02896 4883e4f0                       and        rsp, 0xfffffffffffffff0
0289a e841c21718                     call       0x7ff793d5fbe0
0289f f4                             hlt        
028a0 bee4ffffff                     mov        esi, 0xffffffe4
028a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028aa 448b1424                       mov        r10d, dword ptr [rsp]
028ae 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
028b6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028bb 4c891424                       mov        qword ptr [rsp], r10
028bf 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
028c4 4c89542408                     mov        qword ptr [rsp + 8], r10
028c9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
028ce 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
028d6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
028db 4c89542410                     mov        qword ptr [rsp + 0x10], r10
028e0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
028e5 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
028ea 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
028ef 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
028f4 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
028f9 4c89542428                     mov        qword ptr [rsp + 0x28], r10
028fe 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02903 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02908 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0290d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02912 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02917 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0291c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02921 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02926 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
0292b 90                             nop        
0292c c5f877                         vzeroupper 
0292f e82ca0aeff                     call       0x7ff77b6cda60
02934 0f1f84002c2a001f               nop        dword ptr [rax + rax + 0x1f002a2c]
0293c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02946 4883e4f0                       and        rsp, 0xfffffffffffffff0
0294a e891c11718                     call       0x7ff793d5fbe0
0294f f4                             hlt        
02950 beccffffff                     mov        esi, 0xffffffcc
02955 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0295a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0295f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02967 448b1c24                       mov        r11d, dword ptr [rsp]
0296b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02973 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02978 4c891424                       mov        qword ptr [rsp], r10
0297c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02981 4c89542408                     mov        qword ptr [rsp + 8], r10
02986 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0298b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02993 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02998 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0299d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
029a2 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
029a7 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
029ac 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
029b1 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
029b6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
029bb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
029c0 4489542424                     mov        dword ptr [rsp + 0x24], r10d
029c5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
029ca 4c89542430                     mov        qword ptr [rsp + 0x30], r10
029cf 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
029d4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
029d9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
029de 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
029e3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
029e8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
029ed 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
029f2 90                             nop        
029f3 90                             nop        
029f4 c5f877                         vzeroupper 
029f7 e8649faeff                     call       0x7ff77b6cda60
029fc 0f1f8400f42a0020               nop        dword ptr [rax + rax + 0x20002af4]
02a04 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02a0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a12 e8c9c01718                     call       0x7ff793d5fbe0
02a17 f4                             hlt        
02a18 be45ffffff                     mov        esi, 0xffffff45
02a1d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02a22 448b1424                       mov        r10d, dword ptr [rsp]
02a26 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02a2e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a33 4c891424                       mov        qword ptr [rsp], r10
02a37 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a3c 4c89542408                     mov        qword ptr [rsp + 8], r10
02a41 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02a46 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02a4e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02a53 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a58 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02a5d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02a62 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02a67 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02a6c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02a71 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02a76 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a7b 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a80 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02a85 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02a8a 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
02a8f 90                             nop        
02a90 c5f877                         vzeroupper 
02a93 e8c89eaeff                     call       0x7ff77b6cda60
02a98 0f1f8400902b0021               nop        dword ptr [rax + rax + 0x21002b90]
02aa0 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02aaa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aae e82dc01718                     call       0x7ff793d5fbe0
02ab3 f4                             hlt        
02ab4 be17000000                     mov        esi, 0x17
02ab9 90                             nop        
02aba 90                             nop        
02abb 90                             nop        
02abc c5f877                         vzeroupper 
02abf e89c9eaeff                     call       0x7ff77b6cda60
02ac4 0f1f8400bc2b0022               nop        dword ptr [rax + rax + 0x22002bbc]
02acc 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02ad6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ada e801c01718                     call       0x7ff793d5fbe0
02adf f4                             hlt        
02ae0 be6effffff                     mov        esi, 0xffffff6e
02ae5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02aea 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02af2 4c895c2408                     mov        qword ptr [rsp + 8], r11
02af7 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02afb 48894424f8                     mov        qword ptr [rsp - 8], rax
02b00 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02b04 89442420                       mov        dword ptr [rsp + 0x20], eax
02b08 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b0d 48ff742430                     push       qword ptr [rsp + 0x30]
02b12 488f442428                     pop        qword ptr [rsp + 0x28]
02b17 89542424                       mov        dword ptr [rsp + 0x24], edx
02b1b 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02b20 48ff742448                     push       qword ptr [rsp + 0x48]
02b25 488f442438                     pop        qword ptr [rsp + 0x38]
02b2a 894c2440                       mov        dword ptr [rsp + 0x40], ecx
02b2e 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02b33 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02b38 c5f877                         vzeroupper 
02b3b e8209eaeff                     call       0x7ff77b6cda60
02b40 0f1f8400382c0023               nop        dword ptr [rax + rax + 0x23002c38]
02b48 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02b52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b56 e885bf1718                     call       0x7ff793d5fbe0
02b5b f4                             hlt        
02b5c bebeffffff                     mov        esi, 0xffffffbe
02b61 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b66 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
02b6e 448b1424                       mov        r10d, dword ptr [rsp]
02b72 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02b7a 4c891c24                       mov        qword ptr [rsp], r11
02b7e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b83 4c89542408                     mov        qword ptr [rsp + 8], r10
02b88 4889442410                     mov        qword ptr [rsp + 0x10], rax
02b8d 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02b91 48894424f8                     mov        qword ptr [rsp - 8], rax
02b96 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02b9a 89442420                       mov        dword ptr [rsp + 0x20], eax
02b9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02ba3 48ff742430                     push       qword ptr [rsp + 0x30]
02ba8 488f442428                     pop        qword ptr [rsp + 0x28]
02bad 89542424                       mov        dword ptr [rsp + 0x24], edx
02bb1 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02bb6 48ff742448                     push       qword ptr [rsp + 0x48]
02bbb 488f442438                     pop        qword ptr [rsp + 0x38]
02bc0 894c2440                       mov        dword ptr [rsp + 0x40], ecx
02bc4 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02bc9 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02bce 90                             nop        
02bcf 90                             nop        
02bd0 c5f877                         vzeroupper 
02bd3 e8889daeff                     call       0x7ff77b6cda60
02bd8 0f1f8400d02c0024               nop        dword ptr [rax + rax + 0x24002cd0]
02be0 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02bea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bee e8edbe1718                     call       0x7ff793d5fbe0
02bf3 f4                             hlt        
02bf4 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
02bf9 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
02bfd beccffffff                     mov        esi, 0xffffffcc
02c02 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c07 4c89b424e8000000               mov        qword ptr [rsp + 0xe8], r14
02c0f 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
02c17 891c24                         mov        dword ptr [rsp], ebx
02c1a 4489542404                     mov        dword ptr [rsp + 4], r10d
02c1f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02c24 c5f877                         vzeroupper 
02c27 e8349daeff                     call       0x7ff77b6cda60
02c2c 0f1f8400242d0025               nop        dword ptr [rax + rax + 0x25002d24]
02c34 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02c3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c42 e899be1718                     call       0x7ff793d5fbe0
02c47 f4                             hlt        
02c48 bee4ffffff                     mov        esi, 0xffffffe4
02c4d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c52 448b1c24                       mov        r11d, dword ptr [rsp]
02c56 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02c5e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c63 4c891424                       mov        qword ptr [rsp], r10
02c67 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c6c 4c89542408                     mov        qword ptr [rsp + 8], r10
02c71 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02c76 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02c7e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02c83 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c88 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02c8d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02c92 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02c97 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02c9c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02ca1 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02ca6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02cab 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02cb0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02cb5 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02cba 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02cbf 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02cc4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02cc9 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02cce 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02cd3 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02cd8 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02cdc 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02ce1 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02ce6 90                             nop        
02ce7 90                             nop        
02ce8 c5f877                         vzeroupper 
02ceb e8709caeff                     call       0x7ff77b6cda60
02cf0 0f1f8400e82d0026               nop        dword ptr [rax + rax + 0x26002de8]
02cf8 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02d02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d06 e8d5bd1718                     call       0x7ff793d5fbe0
02d0b f4                             hlt        
02d0c c5fa7f8424a0000000             vmovdqu    xmmword ptr [rsp + 0xa0], xmm0
02d15 bee4ffffff                     mov        esi, 0xffffffe4
02d1a 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d1f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02d27 448b1424                       mov        r10d, dword ptr [rsp]
02d2b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02d33 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d38 4c891424                       mov        qword ptr [rsp], r10
02d3c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d41 4c89542408                     mov        qword ptr [rsp + 8], r10
02d46 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02d4b 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02d53 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02d58 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02d5d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02d62 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02d67 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02d6c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02d71 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02d76 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02d7b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02d80 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02d85 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d8a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d8f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02d94 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02d99 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02d9e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02da3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02da8 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02dad 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02db1 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02db6 897c2468                       mov        dword ptr [rsp + 0x68], edi
02dba 90                             nop        
02dbb 90                             nop        
02dbc c5f877                         vzeroupper 
02dbf e89c9baeff                     call       0x7ff77b6cda60
02dc4 0f1f8400bc2e0027               nop        dword ptr [rax + rax + 0x27002ebc]
02dcc 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dda e801bd1718                     call       0x7ff793d5fbe0
02ddf f4                             hlt        
02de0 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
02de8 beccffffff                     mov        esi, 0xffffffcc
02ded 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02df2 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
02df7 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
02dff 448b1c24                       mov        r11d, dword ptr [rsp]
02e03 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02e0b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02e10 4c891c24                       mov        qword ptr [rsp], r11
02e14 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02e19 4c895c2408                     mov        qword ptr [rsp + 8], r11
02e1e 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02e23 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
02e2b 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02e30 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02e35 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02e3a 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02e3f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02e44 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02e49 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02e4e 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02e53 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
02e58 4489442430                     mov        dword ptr [rsp + 0x30], r8d
02e5d 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02e62 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02e67 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02e6c 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
02e71 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02e76 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02e7b 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02e80 4489442448                     mov        dword ptr [rsp + 0x48], r8d
02e85 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02e8a 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02e8f 90                             nop        
02e90 c5f877                         vzeroupper 
02e93 e8c89aaeff                     call       0x7ff77b6cda60
02e98 0f1f8400902f0028               nop        dword ptr [rax + rax + 0x28002f90]
02ea0 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02eaa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02eae e82dbc1718                     call       0x7ff793d5fbe0
02eb3 f4                             hlt        
02eb4 418bee                         mov        ebp, r14d
02eb7 83c510                         add        ebp, 0x10
02eba be6effffff                     mov        esi, 0xffffff6e
02ebf 48ff742408                     push       qword ptr [rsp + 8]
02ec4 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02ecc 48ff742420                     push       qword ptr [rsp + 0x20]
02ed1 488f442408                     pop        qword ptr [rsp + 8]
02ed6 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02edb 44895c2404                     mov        dword ptr [rsp + 4], r11d
02ee0 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02ee5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02eea 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02eef 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02ef4 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02ef9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02efe 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02f03 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f08 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02f0d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02f12 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02f17 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02f1c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02f21 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02f26 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02f2b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02f2f 90                             nop        
02f30 c5f877                         vzeroupper 
02f33 e8289aaeff                     call       0x7ff77b6cda60
02f38 0f1f840030300029               nop        dword ptr [rax + rax + 0x29003030]
02f40 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02f4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f4e e88dbb1718                     call       0x7ff793d5fbe0
02f53 f4                             hlt        
02f54 418bee                         mov        ebp, r14d
02f57 83c510                         add        ebp, 0x10
02f5a be66ffffff                     mov        esi, 0xffffff66
02f5f 48ff742408                     push       qword ptr [rsp + 8]
02f64 488f8424e0000000               pop        qword ptr [rsp + 0xe0]
02f6c 48ff742420                     push       qword ptr [rsp + 0x20]
02f71 488f442408                     pop        qword ptr [rsp + 8]
02f76 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f7b 4489542404                     mov        dword ptr [rsp + 4], r10d
02f80 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02f85 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f8a 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02f8f 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02f94 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02f99 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02f9e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02fa3 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02fa8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02fad 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02fb2 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02fb7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02fbc 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02fc1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02fc6 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02fcb 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02fcf 90                             nop        
02fd0 c5f877                         vzeroupper 
02fd3 e88899aeff                     call       0x7ff77b6cda60
02fd8 0f1f8400d030002a               nop        dword ptr [rax + rax + 0x2a0030d0]
02fe0 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
02fea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02fee e8edba1718                     call       0x7ff793d5fbe0
02ff3 f4                             hlt        
02ff4 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
02ffe 4883e4f0                       and        rsp, 0xfffffffffffffff0
03002 e8d9ba1718                     call       0x7ff793d5fbe0
03007 f4                             hlt        
03008 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
03012 4883e4f0                       and        rsp, 0xfffffffffffffff0
03016 e8c5ba1718                     call       0x7ff793d5fbe0
0301b f4                             hlt        
0301c 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
03026 4883e4f0                       and        rsp, 0xfffffffffffffff0
0302a e8b1ba1718                     call       0x7ff793d5fbe0
0302f f4                             hlt        
03030 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
0303a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0303e e89dba1718                     call       0x7ff793d5fbe0
03043 f4                             hlt        
03044 bee4ffffff                     mov        esi, 0xffffffe4
03049 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0304e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
03053 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0305b 448b1424                       mov        r10d, dword ptr [rsp]
0305f 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
03067 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0306c 4c891424                       mov        qword ptr [rsp], r10
03070 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03075 4c89542408                     mov        qword ptr [rsp + 8], r10
0307a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0307f 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
03087 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0308c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03091 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03096 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0309b 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
030a0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
030a5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
030aa 4c89542428                     mov        qword ptr [rsp + 0x28], r10
030af 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
030b4 4489542424                     mov        dword ptr [rsp + 0x24], r10d
030b9 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
030be 4c89542430                     mov        qword ptr [rsp + 0x30], r10
030c3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
030c8 4c89542438                     mov        qword ptr [rsp + 0x38], r10
030cd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
030d2 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
030d7 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
030dc 4489542444                     mov        dword ptr [rsp + 0x44], r10d
030e1 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
030e6 90                             nop        
030e7 90                             nop        
030e8 c5f877                         vzeroupper 
030eb e87098aeff                     call       0x7ff77b6cda60
030f0 0f1f8400e831002b               nop        dword ptr [rax + rax + 0x2b0031e8]
030f8 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
03102 4883e4f0                       and        rsp, 0xfffffffffffffff0
03106 e8d5b91718                     call       0x7ff793d5fbe0
0310b f4                             hlt        
0310c bee4ffffff                     mov        esi, 0xffffffe4
03111 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03116 448b1c24                       mov        r11d, dword ptr [rsp]
0311a 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
03122 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03127 4c891424                       mov        qword ptr [rsp], r10
0312b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03130 4c89542408                     mov        qword ptr [rsp + 8], r10
03135 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0313a 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
03142 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03147 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0314c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03151 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
03156 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0315b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
03160 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
03165 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0316a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0316f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
03174 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03179 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0317e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
03183 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03188 c5f877                         vzeroupper 
0318b e8d097aeff                     call       0x7ff77b6cda60
03190 0f1f84008832002c               nop        dword ptr [rax + rax + 0x2c003288]
03198 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
031a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
031a6 e835b91718                     call       0x7ff793d5fbe0
031ab f4                             hlt        
031ac 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
031b4 4183c308                       add        r11d, 8
031b8 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
031bd be6effffff                     mov        esi, 0xffffff6e
031c2 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
031c7 448b1c24                       mov        r11d, dword ptr [rsp]
031cb 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
031d3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
031d8 4c891424                       mov        qword ptr [rsp], r10
031dc 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
031e1 4c89542408                     mov        qword ptr [rsp + 8], r10
031e6 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
031eb 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
031f3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
031f8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
031fd 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
03202 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03207 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0320c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
03211 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03216 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0321b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
03220 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03225 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0322d 458bd3                         mov        r10d, r11d
03230 4489542450                     mov        dword ptr [rsp + 0x50], r10d
03235 90                             nop        
03236 90                             nop        
03237 90                             nop        
03238 c5f877                         vzeroupper 
0323b e82097aeff                     call       0x7ff77b6cda60
03240 0f1f84003833002d               nop        dword ptr [rax + rax + 0x2d003338]
03248 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
03252 4883e4f0                       and        rsp, 0xfffffffffffffff0
03256 e885b81718                     call       0x7ff793d5fbe0
0325b f4                             hlt        
0325c 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
03264 4183c208                       add        r10d, 8
03268 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0326d be66ffffff                     mov        esi, 0xffffff66
03272 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03277 448b1c24                       mov        r11d, dword ptr [rsp]
0327b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
03283 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03288 4c891424                       mov        qword ptr [rsp], r10
0328c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03291 4c89542408                     mov        qword ptr [rsp + 8], r10
03296 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0329b 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
032a3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
032a8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
032ad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
032b2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
032b7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
032bc 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
032c1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
032c6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
032cb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
032d0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
032d5 458bd0                         mov        r10d, r8d
032d8 4489542450                     mov        dword ptr [rsp + 0x50], r10d
032dd 90                             nop        
032de 90                             nop        
032df 90                             nop        
032e0 c5f877                         vzeroupper 
032e3 e87896aeff                     call       0x7ff77b6cda60
032e8 0f1f8400e033002e               nop        dword ptr [rax + rax + 0x2e0033e0]
032f0 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
032fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
032fe e8ddb71718                     call       0x7ff793d5fbe0
03303 f4                             hlt        
03304 418bc9                         mov        ecx, r9d
03307 e999e2ffff                     jmp        0x7ff77bbe26a5
0330c 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
03316 4883e4f0                       and        rsp, 0xfffffffffffffff0
0331a e8c1b71718                     call       0x7ff793d5fbe0
0331f f4                             hlt        
03320 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
0332a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0332e e8adb71718                     call       0x7ff793d5fbe0
03333 f4                             hlt        
03334 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
0333e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03342 e899b71718                     call       0x7ff793d5fbe0
03347 f4                             hlt        
03348 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
03352 4883e4f0                       and        rsp, 0xfffffffffffffff0
03356 e885b71718                     call       0x7ff793d5fbe0
0335b f4                             hlt        
0335c 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
03366 4883e4f0                       and        rsp, 0xfffffffffffffff0
0336a e871b71718                     call       0x7ff793d5fbe0
0336f f4                             hlt        
03370 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
0337a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0337e e85db71718                     call       0x7ff793d5fbe0
03383 f4                             hlt        
03384 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
0338e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03392 e849b71718                     call       0x7ff793d5fbe0
03397 f4                             hlt        
03398 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
033a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
033a6 e835b71718                     call       0x7ff793d5fbe0
033ab f4                             hlt        
033ac 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
033b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
033ba e821b71718                     call       0x7ff793d5fbe0
033bf f4                             hlt        
033c0 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
033ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
033ce e80db71718                     call       0x7ff793d5fbe0
033d3 f4                             hlt        
033d4 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
033de 4883e4f0                       and        rsp, 0xfffffffffffffff0
033e2 e8f9b61718                     call       0x7ff793d5fbe0
033e7 f4                             hlt        
033e8 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
033f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
033f6 e8e5b61718                     call       0x7ff793d5fbe0
033fb f4                             hlt        
033fc 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
03406 4883e4f0                       and        rsp, 0xfffffffffffffff0
0340a e8d1b61718                     call       0x7ff793d5fbe0
0340f f4                             hlt        
03410 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
0341a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0341e e8bdb61718                     call       0x7ff793d5fbe0
03423 f4                             hlt        
03424 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
0342e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03432 e8a9b61718                     call       0x7ff793d5fbe0
03437 f4                             hlt        
03438 48bf600f0e54f77f0000           movabs     rdi, 0x7ff7540e0f60
03442 4883e4f0                       and        rsp, 0xfffffffffffffff0
03446 e895b61718                     call       0x7ff793d5fbe0
0344b f4                             hlt        
0344c bef6ffffff                     mov        esi, 0xfffffff6
03451 498bee                         mov        rbp, r14
03454 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0345c c5f877                         vzeroupper 
0345f e8fc94aeff                     call       0x7ff77b6cda60
03464 0f1f84005c35002f               nop        dword ptr [rax + rax + 0x2f00355c]
0346c 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
03476 4883e4f0                       and        rsp, 0xfffffffffffffff0
0347a e861b61718                     call       0x7ff793d5fbe0
0347f f4                             hlt        
03480 488bf0                         mov        rsi, rax
03483 eb0d                           jmp        0x7ff77bbe4592
03485 488bf0                         mov        rsi, rax
03488 eb08                           jmp        0x7ff77bbe4592
0348a 488bf0                         mov        rsi, rax
0348d eb03                           jmp        0x7ff77bbe4592
0348f 488bf0                         mov        rsi, rax
03492 c5f877                         vzeroupper 
03495 4881c4d0000000                 add        rsp, 0xd0
0349c 5d                             pop        rbp
0349d e93e33aeff                     jmp        0x7ff77b6c78e0
034a2 bef6ffffff                     mov        esi, 0xfffffff6
034a7 90                             nop        
034a8 c5f877                         vzeroupper 
034ab e8b094aeff                     call       0x7ff77b6cda60
034b0 0f1f8400a8350030               nop        dword ptr [rax + rax + 0x300035a8]
034b8 48bf80af5e54f77f0000           movabs     rdi, 0x7ff7545eaf80
034c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
034c6 e815b61718                     call       0x7ff793d5fbe0
034cb f4                             hlt        
034cc 49ba3220be7bf77f0000           movabs     r10, 0x7ff77bbe2032
034d6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
034dd e97eddb4ff                     jmp        0x7ff77b732360
034e2 e8f9abb3ff                     call       0x7ff77b71f1e0
034e7 e952cbffff                     jmp        0x7ff77bbe113e
034ec f4                             hlt        
034ed f4                             hlt        
034ee f4                             hlt        
034ef f4                             hlt        
