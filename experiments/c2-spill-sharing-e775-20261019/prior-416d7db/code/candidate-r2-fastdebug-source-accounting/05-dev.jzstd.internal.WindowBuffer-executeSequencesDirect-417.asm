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
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0a5b5ff                   jne        0x7f63db742d60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecc0000000                 sub        rsp, 0xc0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85182f0000                   jne        0x7f63dbbeb6d6
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742460                     mov        qword ptr [rsp + 0x60], rsi
00051 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00055 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00059 4489442468                     mov        dword ptr [rsp + 0x68], r8d
0005e 458bc8                         mov        r9d, r8d
00061 452bca                         sub        r9d, r10d
00064 8b8c24d0000000                 mov        ecx, dword ptr [rsp + 0xd0]
0006b 413bc9                         cmp        ecx, r9d
0006e 0f8fc8240000                   jg         0x7f63dbbeacbc
00074 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00078 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0007d 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
00081 48638c24d0000000               movsxd     rcx, dword ptr [rsp + 0xd0]
00089 4d63ca                         movsxd     r9, r10d
0008c 4c034c2420                     add        r9, qword ptr [rsp + 0x20]
00091 4d2bc1                         sub        r8, r9
00094 493bc8                         cmp        rcx, r8
00097 0f8f9f240000                   jg         0x7f63dbbeacbc
0009d 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a1 4c89442458                     mov        qword ptr [rsp + 0x58], r8
000a6 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000aa 4d85c0                         test       r8, r8
000ad 0f84e4130000                   je         0x7f63dbbe9c17
000b3 33d2                           xor        edx, edx
000b5 4d8bf3                         mov        r14, r11
000b8 418b7308                       mov        esi, dword ptr [r11 + 8]
000bc 4c8b5c2460                     mov        r11, qword ptr [rsp + 0x60]
000c1 418b5b44                       mov        ebx, dword ptr [r11 + 0x44]
000c5 448bef                         mov        r13d, edi
000c8 85ff                           test       edi, edi
000ca 0f8e101d0000                   jle        0x7f63dbbea560
000d0 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
000d8 4c2b442420                     sub        r8, qword ptr [rsp + 0x20]
000dd 448d4ee0                       lea        r9d, [rsi - 0x20]
000e1 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
000e5 83c1e0                         add        ecx, -0x20
000e8 4c8bd8                         mov        r11, rax
000eb 418b7b08                       mov        edi, dword ptr [r11 + 8]
000ef 85ff                           test       edi, edi
000f1 0f8671240000                   jbe        0x7f63dbbeace8
000f7 4c63d7                         movsxd     r10, edi
000fa 4963fd                         movsxd     rdi, r13d
000fd 48ffcf                         dec        rdi
00100 493bfa                         cmp        rdi, r10
00103 0f835f240000                   jae        0x7f63dbbeace8
00109 85d2                           test       edx, edx
0010b 0f8457240000                   je         0x7f63dbbeace8
00111 488b8424d8000000               mov        rax, qword ptr [rsp + 0xd8]
00119 8b7808                         mov        edi, dword ptr [rax + 8]
0011c 85ff                           test       edi, edi
0011e 0f86a4240000                   jbe        0x7f63dbbead48
00124 83ff01                         cmp        edi, 1
00127 0f869b240000                   jbe        0x7f63dbbead48
0012d 83ff02                         cmp        edi, 2
00130 0f8692240000                   jbe        0x7f63dbbead48
00136 448d56f1                       lea        r10d, [rsi - 0xf]
0013a 4585d2                         test       r10d, r10d
0013d 0f8c85240000                   jl         0x7f63dbbead48
00143 8b6b08                         mov        ebp, dword ptr [rbx + 8]
00146 448d55f1                       lea        r10d, [rbp - 0xf]
0014a 4585d2                         test       r10d, r10d
0014d 0f8c75240000                   jl         0x7f63dbbead48
00153 448d55f9                       lea        r10d, [rbp - 7]
00157 4585d2                         test       r10d, r10d
0015a 0f8c68240000                   jl         0x7f63dbbead48
00160 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00167 89bc24d4000000                 mov        dword ptr [rsp + 0xd4], edi
0016e 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00172 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00177 89b424d0000000                 mov        dword ptr [rsp + 0xd0], esi
0017e 8954246c                       mov        dword ptr [rsp + 0x6c], edx
00182 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00187 4889442430                     mov        qword ptr [rsp + 0x30], rax
0018c 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
00191 44896c2408                     mov        dword ptr [rsp + 8], r13d
00196 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0019b 4c8bd3                         mov        r10, rbx
0019e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
001a3 895c2448                       mov        dword ptr [rsp + 0x48], ebx
001a7 448bd5                         mov        r10d, ebp
001aa 448bde                         mov        r11d, esi
001ad 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
001b5 458d42f9                       lea        r8d, [r10 - 7]
001b9 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
001be 4183c3f1                       add        r11d, -0xf
001c2 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
001c7 4d63da                         movsxd     r11, r10d
001ca 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
001cf 4183c2f1                       add        r10d, -0xf
001d3 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
001d8 4d8d53f9                       lea        r10, [r11 - 7]
001dc 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
001e4 4533f6                         xor        r14d, r14d
001e7 4533c0                         xor        r8d, r8d
001ea e933040000                     jmp        0x7f63dbbe8da2
001ef 448bd5                         mov        r10d, ebp
001f2 4d63d2                         movsxd     r10, r10d
001f5 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001fc c442a8f5db                     bzhi       r11, r11, r10
00201 c4c1fb92fb                     kmovq      k7, r11
00206 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0020c 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00212 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
0021a 4403d5                         add        r10d, ebp
0021d 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00225 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00229 418502                         test       dword ptr [r10], eax
0022c 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00234 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
0023c 0f8dce090000                   jge        0x7f63dbbe9390
00242 448bf3                         mov        r14d, ebx
00245 458bce                         mov        r9d, r14d
00248 442b8c2490000000               sub        r9d, dword ptr [rsp + 0x90]
00250 8bac248c000000                 mov        ebp, dword ptr [rsp + 0x8c]
00257 2bac2490000000                 sub        ebp, dword ptr [rsp + 0x90]
0025e 3bac2490000000                 cmp        ebp, dword ptr [rsp + 0x90]
00265 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0026d 410f4feb                       cmovg      ebp, r11d
00271 4585c9                         test       r9d, r9d
00274 0f8caa1a0000                   jl         0x7f63dbbea4a4
0027a 4585f6                         test       r14d, r14d
0027d 0f8ca11a0000                   jl         0x7f63dbbea4a4
00283 458d1429                       lea        r10d, [r9 + rbp]
00287 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
0028f 453bc2                         cmp        r8d, r10d
00292 0f828c1a0000                   jb         0x7f63dbbea4a4
00298 418d1c2e                       lea        ebx, [r14 + rbp]
0029c 443bc3                         cmp        r8d, ebx
0029f 0f827f1a0000                   jb         0x7f63dbbea4a4
002a5 85ed                           test       ebp, ebp
002a7 0f8c771a0000                   jl         0x7f63dbbea4a4
002ad 85ed                           test       ebp, ebp
002af 0f845dffffff                   je         0x7f63dbbe8992
002b5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
002ba 4b8d74330c                     lea        rsi, [r11 + r14 + 0xc]
002bf 4b8d7c0b0c                     lea        rdi, [r11 + r9 + 0xc]
002c4 4863d5                         movsxd     rdx, ebp
002c7 4883fa20                       cmp        rdx, 0x20
002cb 0f861effffff                   jbe        0x7f63dbbe896f
002d1 c5f877                         vzeroupper 
002d4 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
002de 41ffd2                         call       r10
002e1 0f1f840000000000               nop        dword ptr [rax + rax]
002e9 e924ffffff                     jmp        0x7f63dbbe8992
002ee 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
002f6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
002fb c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00302 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
0030a 4503da                         add        r11d, r10d
0030d e9ea020000                     jmp        0x7f63dbbe8d7c
00312 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00317 4b8d7c130c                     lea        rdi, [r11 + r10 + 0xc]
0031c 458bc3                         mov        r8d, r11d
0031f 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00327 4b8d74180c                     lea        rsi, [r8 + r11 + 0xc]
0032c 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00334 4403842488000000               add        r8d, dword ptr [rsp + 0x88]
0033c 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
00344 4d63f0                         movsxd     r14, r8d
00347 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0034f 443b9c248c000000               cmp        r11d, dword ptr [rsp + 0x8c]
00357 0f8c54060000                   jl         0x7f63dbbe9131
0035d 448b84248c000000               mov        r8d, dword ptr [rsp + 0x8c]
00365 4183f830                       cmp        r8d, 0x30
00369 0f8e98000000                   jle        0x7f63dbbe8b87
0036f 4585d2                         test       r10d, r10d
00372 0f8c00190000                   jl         0x7f63dbbea3f8
00378 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00380 4585db                         test       r11d, r11d
00383 0f8cef180000                   jl         0x7f63dbbea3f8
00389 4503c2                         add        r8d, r10d
0038c 448b8c24d8000000               mov        r9d, dword ptr [rsp + 0xd8]
00394 453bc8                         cmp        r9d, r8d
00397 0f82db180000                   jb         0x7f63dbbea3f8
0039d 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
003a5 0f82cd180000                   jb         0x7f63dbbea3f8
003ab 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
003b3 4585db                         test       r11d, r11d
003b6 0f8430020000                   je         0x7f63dbbe8d6c
003bc 4963d3                         movsxd     rdx, r11d
003bf 4883fa20                       cmp        rdx, 0x20
003c3 7725                           ja         0x7f63dbbe8b6a
003c5 4d63d3                         movsxd     r10, r11d
003c8 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003cf c442a8f5db                     bzhi       r11, r11, r10
003d4 c4c1fb92fb                     kmovq      k7, r11
003d9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003df 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003e5 e902020000                     jmp        0x7f63dbbe8d6c
003ea c5f877                         vzeroupper 
003ed 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
003f7 41ffd2                         call       r10
003fa 0f1f840000000000               nop        dword ptr [rax + rax]
00402 e9e5010000                     jmp        0x7f63dbbe8d6c
00407 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
0040c 0f833a150000                   jae        0x7f63dbbea0cc
00412 4963fa                         movsxd     rdi, r10d
00415 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0041a 4d8b4c3b0c                     mov        r9, qword ptr [r11 + rdi + 0xc]
0041f 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00427 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
0042c 0f83ba150000                   jae        0x7f63dbbea16c
00432 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00439 8d4b08                         lea        ecx, [rbx + 8]
0043c 4c63db                         movsxd     r11, ebx
0043f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00444 4f894c180c                     mov        qword ptr [r8 + r11 + 0xc], r9
00449 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
00450 0f8d96010000                   jge        0x7f63dbbe8d6c
00456 492bfb                         sub        rdi, r11
00459 4c63c1                         movsxd     r8, ecx
0045c 4d8d1c38                       lea        r11, [r8 + rdi]
00460 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00468 0f8322160000                   jae        0x7f63dbbea210
0046e 4d8bde                         mov        r11, r14
00471 4d2bd8                         sub        r11, r8
00474 4983c307                       add        r11, 7
00478 4983e3f8                       and        r11, 0xfffffffffffffff8
0047c 458bc3                         mov        r8d, r11d
0047f 458d5c1808                     lea        r11d, [r8 + rbx + 8]
00484 4d63db                         movsxd     r11, r11d
00487 4d8d443bf8                     lea        r8, [r11 + rdi - 8]
0048c 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
00494 0f83f6150000                   jae        0x7f63dbbea210
0049a 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
0049e 0f83ec150000                   jae        0x7f63dbbea210
004a4 4983c3f8                       add        r11, -8
004a8 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
004b0 0f83da150000                   jae        0x7f63dbbea210
004b6 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
004be 4181f8f8ffff7f                 cmp        r8d, 0x7ffffff8
004c5 0f8f7d160000                   jg         0x7f63dbbea2c8
004cb 442bd3                         sub        r10d, ebx
004ce 83c310                         add        ebx, 0x10
004d1 458d040a                       lea        r8d, [r10 + rcx]
004d5 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
004da 4f8b4c010c                     mov        r9, qword ptr [r9 + r8 + 0xc]
004df 448bd9                         mov        r11d, ecx
004e2 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
004e7 4f894c180c                     mov        qword ptr [r8 + r11 + 0xc], r9
004ec 448d4108                       lea        r8d, [rcx + 8]
004f0 443bc3                         cmp        r8d, ebx
004f3 7d05                           jge        0x7f63dbbe8c7a
004f5 418bc8                         mov        ecx, r8d
004f8 ebd7                           jmp        0x7f63dbbe8c51
004fa 4983c6f8                       add        r14, -8
004fe 4981fe00000080                 cmp        r14, -0x80000000
00505 49c7c300000080                 mov        r11, 0xffffffff80000000
0050c 4d0f4cf3                       cmovl      r14, r11
00510 418bde                         mov        ebx, r14d
00513 443bc3                         cmp        r8d, ebx
00516 0f8d7d000000                   jge        0x7f63dbbe8d19
0051c 4d63d8                         movsxd     r11, r8d
0051f 4c03df                         add        r11, rdi
00522 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0052a 0f83d0160000                   jae        0x7f63dbbea380
00530 83c110                         add        ecx, 0x10
00533 4c63d9                         movsxd     r11, ecx
00536 4c03df                         add        r11, rdi
00539 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00541 0f83cd160000                   jae        0x7f63dbbea394
00547 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
0054c 0f83d6160000                   jae        0x7f63dbbea3a8
00552 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
00556 0f83e0160000                   jae        0x7f63dbbea3bc
0055c 90                             nop        
0055d 90                             nop        
0055e 90                             nop        
0055f 90                             nop        
00560 478d1c02                       lea        r11d, [r10 + r8]
00564 458bc8                         mov        r9d, r8d
00567 4963d1                         movsxd     rdx, r9d
0056a 418bcb                         mov        ecx, r11d
0056d 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00572 4d8b4c090c                     mov        r9, qword ptr [r9 + rcx + 0xc]
00577 4963f3                         movsxd     rsi, r11d
0057a 458bd8                         mov        r11d, r8d
0057d 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00581 4e894c190c                     mov        qword ptr [rcx + r11 + 0xc], r9
00586 4c8b4c3114                     mov        r9, qword ptr [rcx + rsi + 0x14]
0058b 4c894c1114                     mov        qword ptr [rcx + rdx + 0x14], r9
00590 4183c010                       add        r8d, 0x10
00594 443bc3                         cmp        r8d, ebx
00597 7cc7                           jl         0x7f63dbbe8ce0
00599 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
005a1 7d49                           jge        0x7f63dbbe8d6c
005a3 4d63d8                         movsxd     r11, r8d
005a6 4c03df                         add        r11, rdi
005a9 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
005b1 0f8399160000                   jae        0x7f63dbbea3d0
005b7 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
005bc 0f83a2160000                   jae        0x7f63dbbea3e4
005c2 90                             nop        
005c3 90                             nop        
005c4 478d0c02                       lea        r9d, [r10 + r8]
005c8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
005cd 4f8b4c0b0c                     mov        r9, qword ptr [r11 + r9 + 0xc]
005d2 458bd8                         mov        r11d, r8d
005d5 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
005d9 4e894c190c                     mov        qword ptr [rcx + r11 + 0xc], r9
005de 4183c008                       add        r8d, 8
005e2 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
005ea 7cd8                           jl         0x7f63dbbe8d44
005ec 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
005f4 44039c248c000000               add        r11d, dword ptr [rsp + 0x8c]
005fc 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00604 41ffc0                         inc        r8d
00607 443b442408                     cmp        r8d, dword ptr [rsp + 8]
0060c 0f8d30060000                   jge        0x7f63dbbe93c2
00612 448bb42494000000               mov        r14d, dword ptr [rsp + 0x94]
0061a 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
00622 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00627 4f8b5cc210                     mov        r11, qword ptr [r10 + r8*8 + 0x10]
0062c 458bd3                         mov        r10d, r11d
0062f 4181e2ffff0100                 and        r10d, 0x1ffff
00636 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0063e 4d8bd3                         mov        r10, r11
00641 49c1ea12                       shr        r10, 0x12
00645 49c1fb24                       sar        r11, 0x24
00649 458bd2                         mov        r10d, r10d
0064c 458bdb                         mov        r11d, r11d
0064f 418bcb                         mov        ecx, r11d
00652 4181e2ffff0300                 and        r10d, 0x3ffff
00659 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00661 4585db                         test       r11d, r11d
00664 0f8c4e100000                   jl         0x7f63dbbe9e38
0066a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00672 4585db                         test       r11d, r11d
00675 0f853d020000                   jne        0x7f63dbbe9038
0067b 4533d2                         xor        r10d, r10d
0067e 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
00686 83f903                         cmp        ecx, 3
00689 0f8e6d020000                   jle        0x7f63dbbe907c
0068f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00694 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
00698 45895a14                       mov        dword ptr [r10 + 0x14], r11d
0069c 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006a0 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
006a5 45895310                       mov        dword ptr [r11 + 0x10], r10d
006a9 448d51fd                       lea        r10d, [rcx - 3]
006ad 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
006b5 4589530c                       mov        dword ptr [r11 + 0xc], r10d
006b9 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
006c1 48639c2490000000               movsxd     rbx, dword ptr [rsp + 0x90]
006c9 488beb                         mov        rbp, rbx
006cc 4c63842498000000               movsxd     r8, dword ptr [rsp + 0x98]
006d4 4c03442420                     add        r8, qword ptr [rsp + 0x20]
006d9 4863942488000000               movsxd     rdx, dword ptr [rsp + 0x88]
006e1 4c03c2                         add        r8, rdx
006e4 493bd8                         cmp        rbx, r8
006e7 0f8f6b100000                   jg         0x7f63dbbe9ed8
006ed 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
006f5 4585db                         test       r11d, r11d
006f8 0f8e860f0000                   jle        0x7f63dbbe9e04
006fe 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
00706 4403ac2488000000               add        r13d, dword ptr [rsp + 0x88]
0070e 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00716 4503d5                         add        r10d, r13d
00719 443b54243c                     cmp        r10d, dword ptr [rsp + 0x3c]
0071e 0f8ff0100000                   jg         0x7f63dbbe9f94
00724 458bd6                         mov        r10d, r14d
00727 4403942488000000               add        r10d, dword ptr [rsp + 0x88]
0072f 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00737 443b542438                     cmp        r10d, dword ptr [rsp + 0x38]
0073c 0f8f76110000                   jg         0x7f63dbbea038
00742 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0074a 4183fa10                       cmp        r10d, 0x10
0074e 0f8f9d050000                   jg         0x7f63dbbe9471
00754 443b742478                     cmp        r14d, dword ptr [rsp + 0x78]
00759 0f83570d0000                   jae        0x7f63dbbe9c36
0075f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00764 c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
0076b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00773 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
00778 0f83e20d0000                   jae        0x7f63dbbe9ce0
0077e 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00786 4503c6                         add        r8d, r14d
00789 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
00791 448b742448                     mov        r14d, dword ptr [rsp + 0x48]
00796 c4817a7f44160c                 vmovdqu    xmmword ptr [r14 + r10 + 0xc], xmm0
0079d 448bb42488000000               mov        r14d, dword ptr [rsp + 0x88]
007a5 4503f2                         add        r14d, r10d
007a8 4489b42488000000               mov        dword ptr [rsp + 0x88], r14d
007b0 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
007b8 442b942490000000               sub        r10d, dword ptr [rsp + 0x90]
007c0 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
007c8 4183fb10                       cmp        r11d, 0x10
007cc 0f8f40fbffff                   jg         0x7f63dbbe8a92
007d2 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
007da 4183f810                       cmp        r8d, 0x10
007de 0f8c2efbffff                   jl         0x7f63dbbe8a92
007e4 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
007e9 0f83010e0000                   jae        0x7f63dbbe9d70
007ef 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
007f4 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
007fb 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00803 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00808 0f82e0faffff                   jb         0x7f63dbbe8a6e
0080e bee4ffffff                     mov        esi, 0xffffffe4
00813 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
00818 448b1c24                       mov        r11d, dword ptr [rsp]
0081c 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
00824 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00829 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
00831 448b542408                     mov        r10d, dword ptr [rsp + 8]
00836 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0083e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00843 4c891424                       mov        qword ptr [rsp], r10
00847 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0084c 44895c2408                     mov        dword ptr [rsp + 8], r11d
00851 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00856 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0085b 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00860 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00865 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0086a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0086f c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00875 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0087a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0087f 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00884 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00889 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0088e 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00893 90                             nop        
00894 c5f877                         vzeroupper 
00897 e84417b0ff                     call       0x7f63db6ea760
0089c 0f1f840094090001               nop        dword ptr [rax + rax + 0x1000994]
008a4 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
008ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
008b2 e8c978b418                     call       0x7f63f4730900
008b7 f4                             hlt        
008b8 448b1424                       mov        r10d, dword ptr [rsp]
008bc 452bd6                         sub        r10d, r14d
008bf 453bda                         cmp        r11d, r10d
008c2 0f8ebefdffff                   jle        0x7f63dbbe8e06
008c8 be45ffffff                     mov        esi, 0xffffff45
008cd 418beb                         mov        ebp, r11d
008d0 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
008d8 c5f877                         vzeroupper 
008db e80017b0ff                     call       0x7f63db6ea760
008e0 0f1f8400d8090002               nop        dword ptr [rax + rax + 0x20009d8]
008e8 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
008f2 4883e4f0                       and        rsp, 0xfffffffffffffff0
008f6 e88578b418                     call       0x7f63f4730900
008fb f4                             hlt        
008fc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00904 4585d2                         test       r10d, r10d
00907 7407                           je         0x7f63dbbe9090
00909 448d51ff                       lea        r10d, [rcx - 1]
0090d 418bca                         mov        ecx, r10d
00910 85c9                           test       ecx, ecx
00912 0f847b000000                   je         0x7f63dbbe9113
00918 83f903                         cmp        ecx, 3
0091b 0f843b160000                   je         0x7f63dbbea6dc
00921 83f902                         cmp        ecx, 2
00924 0f87d2160000                   ja         0x7f63dbbea77c
0092a 3b8c24d4000000                 cmp        ecx, dword ptr [rsp + 0xd4]
00931 0f83c2140000                   jae        0x7f63dbbea579
00937 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0093c 458b4c8b0c                     mov        r9d, dword ptr [r11 + rcx*4 + 0xc]
00941 85c9                           test       ecx, ecx
00943 7e3b                           jle        0x7f63dbbe9100
00945 448d59ff                       lea        r11d, [rcx - 1]
00949 443b9c24d4000000               cmp        r11d, dword ptr [rsp + 0xd4]
00951 0f8355150000                   jae        0x7f63dbbea62c
00957 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
0095f 90                             nop        
00960 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
00965 458b548b08                     mov        r10d, dword ptr [r11 + rcx*4 + 8]
0096a 4d8bc3                         mov        r8, r11
0096d 458954880c                     mov        dword ptr [r8 + rcx*4 + 0xc], r10d
00972 448d51ff                       lea        r10d, [rcx - 1]
00976 418bca                         mov        ecx, r10d
00979 4585d2                         test       r10d, r10d
0097c 7fe2                           jg         0x7f63dbbe90e0
0097e eb08                           jmp        0x7f63dbbe9108
00980 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00988 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0098d 45894a0c                       mov        dword ptr [r10 + 0xc], r9d
00991 eb11                           jmp        0x7f63dbbe9124
00993 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
00998 458b4a0c                       mov        r9d, dword ptr [r10 + 0xc]
0099c 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
009a4 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
009ac e910fdffff                     jmp        0x7f63dbbe8e41
009b1 4183fb10                       cmp        r11d, 0x10
009b5 0f8ded1a0000                   jge        0x7f63dbbeac28
009bb 4183fb08                       cmp        r11d, 8
009bf 0f8dbc040000                   jge        0x7f63dbbe9601
009c5 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
009cd 4183fb10                       cmp        r11d, 0x10
009d1 0f8eba000000                   jle        0x7f63dbbe9211
009d7 4585d2                         test       r10d, r10d
009da 0f8c201a0000                   jl         0x7f63dbbeab80
009e0 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
009e8 4585c0                         test       r8d, r8d
009eb 0f8c0f1a0000                   jl         0x7f63dbbeab80
009f1 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
009f9 443b9c2488000000               cmp        r11d, dword ptr [rsp + 0x88]
00a01 0f82f9190000                   jb         0x7f63dbbeab80
00a07 8b9c2490000000                 mov        ebx, dword ptr [rsp + 0x90]
00a0e 039c2488000000                 add        ebx, dword ptr [rsp + 0x88]
00a15 448bf3                         mov        r14d, ebx
00a18 443bdb                         cmp        r11d, ebx
00a1b 0f82df190000                   jb         0x7f63dbbeab80
00a21 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00a29 4585db                         test       r11d, r11d
00a2c 0f8cce190000                   jl         0x7f63dbbeab80
00a32 4585db                         test       r11d, r11d
00a35 0f840af8ffff                   je         0x7f63dbbe89c5
00a3b 488bdd                         mov        rbx, rbp
00a3e 4883fb20                       cmp        rbx, 0x20
00a42 772d                           ja         0x7f63dbbe91f1
00a44 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00a4c 4d63d2                         movsxd     r10, r10d
00a4f 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00a56 c442a8f5db                     bzhi       r11, r11, r10
00a5b c4c1fb92fb                     kmovq      k7, r11
00a60 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00a66 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00a6c e9d4f7ffff                     jmp        0x7f63dbbe89c5
00a71 488bd3                         mov        rdx, rbx
00a74 c5f877                         vzeroupper 
00a77 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00a81 41ffd2                         call       r10
00a84 0f1f840000000000               nop        dword ptr [rax + rax]
00a8c e9b4f7ffff                     jmp        0x7f63dbbe89c5
00a91 443b9424d8000000               cmp        r10d, dword ptr [rsp + 0xd8]
00a99 0f83fd150000                   jae        0x7f63dbbea81c
00a9f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00aa4 430fbe6c130c                   movsx      ebp, byte ptr [r11 + r10 + 0xc]
00aaa 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00ab2 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
00aba 0f8384160000                   jae        0x7f63dbbea8c4
00ac0 43886c030c                     mov        byte ptr [r11 + r8 + 0xc], bpl
00ac5 458d4203                       lea        r8d, [r10 + 3]
00ac9 448b8c2488000000               mov        r9d, dword ptr [rsp + 0x88]
00ad1 41ffc1                         inc        r9d
00ad4 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
00adc 0f8312170000                   jae        0x7f63dbbea974
00ae2 4963ca                         movsxd     rcx, r10d
00ae5 410fbe6c0b0d                   movsx      ebp, byte ptr [r11 + rcx + 0xd]
00aeb 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00af3 4183c003                       add        r8d, 3
00af7 443b8424d8000000               cmp        r8d, dword ptr [rsp + 0xd8]
00aff 0f83af170000                   jae        0x7f63dbbeaa34
00b05 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
00b0d 43886c0b0d                     mov        byte ptr [r11 + r9 + 0xd], bpl
00b12 450fbe440b0e                   movsx      r8d, byte ptr [r11 + rcx + 0xe]
00b18 418bdb                         mov        ebx, r11d
00b1b 4688440b0e                     mov        byte ptr [rbx + r9 + 0xe], r8b
00b20 440fbe440b0f                   movsx      r8d, byte ptr [rbx + rcx + 0xf]
00b26 4688440b0f                     mov        byte ptr [rbx + r9 + 0xf], r8b
00b2b 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00b33 4183fb08                       cmp        r11d, 8
00b37 0f832b180000                   jae        0x7f63dbbeaae8
00b3d 458bc2                         mov        r8d, r10d
00b40 49bbf0ef2fe300000000           movabs     r11, 0xe32feff0
00b4a 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00b52 470344930c                     add        r8d, dword ptr [r11 + r10*4 + 0xc]
00b57 4489442404                     mov        dword ptr [rsp + 4], r8d
00b5c 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00b64 4183fa04                       cmp        r10d, 4
00b68 7e3e                           jle        0x7f63dbbe9328
00b6a 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00b71 83c504                         add        ebp, 4
00b74 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b79 418bd0                         mov        edx, r8d
00b7c c5f877                         vzeroupper 
00b7f e85ca9b5ff                     call       0x7f63db743c60
00b84 0f1f84007c0c0003               nop        dword ptr [rax + rax + 0x3000c7c]
00b8c 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00b91 8bd5                           mov        edx, ebp
00b93 8bc8                           mov        ecx, eax
00b95 488bee                         mov        rbp, rsi
00b98 c5f877                         vzeroupper 
00b9b e840a9b5ff                     call       0x7f63db743c60
00ba0 0f1f8400980c0004               nop        dword ptr [rax + rax + 0x4000c98]
00ba8 448b94248c000000               mov        r10d, dword ptr [rsp + 0x8c]
00bb0 4183fa08                       cmp        r10d, 8
00bb4 7e5a                           jle        0x7f63dbbe9390
00bb6 8b542404                       mov        edx, dword ptr [rsp + 4]
00bba 49ba20f02fe300000000           movabs     r10, 0xe32ff020
00bc4 448b842490000000               mov        r8d, dword ptr [rsp + 0x90]
00bcc 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00bd1 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00bd8 83c508                         add        ebp, 8
00bdb 83c208                         add        edx, 8
00bde 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00be3 90                             nop        
00be4 c5f877                         vzeroupper 
00be7 e8f4a8b5ff                     call       0x7f63db743c60
00bec 0f1f8400e40c0005               nop        dword ptr [rax + rax + 0x5000ce4]
00bf4 488b742418                     mov        rsi, qword ptr [rsp + 0x18]
00bf9 8bd5                           mov        edx, ebp
00bfb 488bc8                         mov        rcx, rax
00bfe 90                             nop        
00bff 90                             nop        
00c00 c5f877                         vzeroupper 
00c03 e8d8a8b5ff                     call       0x7f63db743c60
00c08 0f1f8400000d0006               nop        dword ptr [rax + rax + 0x6000d00]
00c10 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00c18 e9dff9ffff                     jmp        0x7f63dbbe8d7c
00c1d 4d63d2                         movsxd     r10, r10d
00c20 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c27 c442a8f5db                     bzhi       r11, r11, r10
00c2c c4c1fb92fb                     kmovq      k7, r11
00c31 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c37 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c3d e990000000                     jmp        0x7f63dbbe9452
00c42 448b1424                       mov        r10d, dword ptr [rsp]
00c46 442b942494000000               sub        r10d, dword ptr [rsp + 0x94]
00c4e 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00c56 4585c0                         test       r8d, r8d
00c59 0f8cd5190000                   jl         0x7f63dbbeadb4
00c5f 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
00c64 8bb424d0000000                 mov        esi, dword ptr [rsp + 0xd0]
00c6b 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00c6f 4585db                         test       r11d, r11d
00c72 0f8cc5190000                   jl         0x7f63dbbeadbd
00c78 3b3424                         cmp        esi, dword ptr [rsp]
00c7b 0f82bc190000                   jb         0x7f63dbbeadbd
00c81 448b4b08                       mov        r9d, dword ptr [rbx + 8]
00c85 478d2c13                       lea        r13d, [r11 + r10]
00c89 453bcd                         cmp        r9d, r13d
00c8c 0f82ab190000                   jb         0x7f63dbbeadbd
00c92 4585d2                         test       r10d, r10d
00c95 0f8ca2190000                   jl         0x7f63dbbeadbd
00c9b 4585d2                         test       r10d, r10d
00c9e 7432                           je         0x7f63dbbe9452
00ca0 4b8d7c060c                     lea        rdi, [r14 + r8 + 0xc]
00ca5 4c8bc3                         mov        r8, rbx
00ca8 4a8d741b0c                     lea        rsi, [rbx + r11 + 0xc]
00cad 4963d2                         movsxd     rdx, r10d
00cb0 4883fa20                       cmp        rdx, 0x20
00cb4 0f8663ffffff                   jbe        0x7f63dbbe939d
00cba c5f877                         vzeroupper 
00cbd 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00cc7 41ffd2                         call       r10
00cca 0f1f840000000000               nop        dword ptr [rax + rax]
00cd2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
00cd7 45896a3c                       mov        dword ptr [r10 + 0x3c], r13d
00cdb c5f877                         vzeroupper 
00cde 4881c4c0000000                 add        rsp, 0xc0
00ce5 5d                             pop        rbp
00ce6 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00cea 0f8750220000                   ja         0x7f63dbbeb6c0
00cf0 c3                             ret        
00cf1 4183fa30                       cmp        r10d, 0x30
00cf5 0f8eb7000000                   jle        0x7f63dbbe9532
00cfb 4585f6                         test       r14d, r14d
00cfe 0f8cc01e0000                   jl         0x7f63dbbeb344
00d04 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
00d0c 4585c0                         test       r8d, r8d
00d0f 0f8cb71e0000                   jl         0x7f63dbbeb34c
00d15 448b9424d0000000               mov        r10d, dword ptr [rsp + 0xd0]
00d1d 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00d25 0f82a11e0000                   jb         0x7f63dbbeb34c
00d2b 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
00d33 453bdd                         cmp        r11d, r13d
00d36 0f82901e0000                   jb         0x7f63dbbeb34c
00d3c 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00d44 4585d2                         test       r10d, r10d
00d47 7442                           je         0x7f63dbbe950b
00d49 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00d4e 4b8d7c320c                     lea        rdi, [r10 + r14 + 0xc]
00d53 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00d58 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
00d5d 4883fa20                       cmp        rdx, 0x20
00d61 7735                           ja         0x7f63dbbe9518
00d63 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00d6b 4d63d2                         movsxd     r10, r10d
00d6e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d75 c442a8f5db                     bzhi       r11, r11, r10
00d7a c4c1fb92fb                     kmovq      k7, r11
00d7f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d85 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d8b 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
00d93 e918faffff                     jmp        0x7f63dbbe8f30
00d98 c5f877                         vzeroupper 
00d9b 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00da5 41ffd2                         call       r10
00da8 0f1f840000000000               nop        dword ptr [rax + rax]
00db0 ebd9                           jmp        0x7f63dbbe950b
00db2 443b742478                     cmp        r14d, dword ptr [rsp + 0x78]
00db7 0f839f1c0000                   jae        0x7f63dbbeb1dc
00dbd 4d63c6                         movsxd     r8, r14d
00dc0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00dc5 c4817a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + r8 + 0xc]
00dcc 8b9c2498000000                 mov        ebx, dword ptr [rsp + 0x98]
00dd3 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00dd7 0f831f1d0000                   jae        0x7f63dbbeb27c
00ddd 448d5310                       lea        r10d, [rbx + 0x10]
00de1 418bc2                         mov        eax, r10d
00de4 4c63db                         movsxd     r11, ebx
00de7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00dec c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00df3 8bc8                           mov        ecx, eax
00df5 413bcd                         cmp        ecx, r13d
00df8 0f8d79060000                   jge        0x7f63dbbe9bf7
00dfe 4d2bc3                         sub        r8, r11
00e01 4c63d1                         movsxd     r10, ecx
00e04 4c638c24dc000000               movsxd     r9, dword ptr [rsp + 0xdc]
00e0c 4983c1f1                       add        r9, -0xf
00e10 4f8d1c02                       lea        r11, [r10 + r8]
00e14 4d3bd9                         cmp        r11, r9
00e17 0f834b1e0000                   jae        0x7f63dbbeb3e8
00e1d 4963d5                         movsxd     rdx, r13d
00e20 4c8bda                         mov        r11, rdx
00e23 4d2bda                         sub        r11, r10
00e26 4983c30f                       add        r11, 0xf
00e2a 4983e3f0                       and        r11, 0xfffffffffffffff0
00e2e 458bdb                         mov        r11d, r11d
00e31 458d541b10                     lea        r10d, [r11 + rbx + 0x10]
00e36 4d63d2                         movsxd     r10, r10d
00e39 4f8d5c02f0                     lea        r11, [r10 + r8 - 0x10]
00e3e 4d3bd9                         cmp        r11, r9
00e41 0f83211e0000                   jae        0x7f63dbbeb3e8
00e47 3b4c247c                       cmp        ecx, dword ptr [rsp + 0x7c]
00e4b 0f83171e0000                   jae        0x7f63dbbeb3e8
00e51 4983c2f0                       add        r10, -0x10
00e55 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00e5a 4983c3f1                       add        r11, -0xf
00e5e 4d3bd3                         cmp        r10, r11
00e61 0f83011e0000                   jae        0x7f63dbbeb3e8
00e67 4181fdf0ffff7f                 cmp        r13d, 0x7ffffff0
00e6e 0f8fbc1e0000                   jg         0x7f63dbbeb4b0
00e74 418bce                         mov        ecx, r14d
00e77 2bcb                           sub        ecx, ebx
00e79 83c320                         add        ebx, 0x20
00e7c e9dd030000                     jmp        0x7f63dbbe99de
00e81 443b54244c                     cmp        r10d, dword ptr [rsp + 0x4c]
00e86 0f83fc170000                   jae        0x7f63dbbeae08
00e8c 4d63ea                         movsxd     r13, r10d
00e8f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e94 4f8b4c2b0c                     mov        r9, qword ptr [r11 + r13 + 0xc]
00e99 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
00ea1 443b44244c                     cmp        r8d, dword ptr [rsp + 0x4c]
00ea6 0f8390180000                   jae        0x7f63dbbeaebc
00eac 8b8c2488000000                 mov        ecx, dword ptr [rsp + 0x88]
00eb3 8d6908                         lea        ebp, [rcx + 8]
00eb6 4c63d9                         movsxd     r11, ecx
00eb9 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00ebe 4f894c180c                     mov        qword ptr [r8 + r11 + 0xc], r9
00ec3 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00eca 0f8d7e030000                   jge        0x7f63dbbe99ce
00ed0 4d2beb                         sub        r13, r11
00ed3 4c63cd                         movsxd     r9, ebp
00ed6 4f8d1c29                       lea        r11, [r9 + r13]
00eda 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00ee2 0f8318190000                   jae        0x7f63dbbeaf80
00ee8 4d8bde                         mov        r11, r14
00eeb 4d2bd9                         sub        r11, r9
00eee 4983c307                       add        r11, 7
00ef2 4983e3f8                       and        r11, 0xfffffffffffffff8
00ef6 458bdb                         mov        r11d, r11d
00ef9 458d440b08                     lea        r8d, [r11 + rcx + 8]
00efe 4d63d8                         movsxd     r11, r8d
00f01 4f8d442bf8                     lea        r8, [r11 + r13 - 8]
00f06 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
00f0e 0f83ec180000                   jae        0x7f63dbbeaf80
00f14 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00f18 0f83e2180000                   jae        0x7f63dbbeaf80
00f1e 4983c3f8                       add        r11, -8
00f22 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00f2a 0f83d0180000                   jae        0x7f63dbbeaf80
00f30 4c8b5c2418                     mov        r11, qword ptr [rsp + 0x18]
00f35 498bdb                         mov        rbx, r11
00f38 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00f3d 458bc0                         mov        r8d, r8d
00f40 41bbf4ffffff                   mov        r11d, 0xfffffff4
00f46 452bd8                         sub        r11d, r8d
00f49 442bd9                         sub        r11d, ecx
00f4c 4183c3f0                       add        r11d, -0x10
00f50 448d4110                       lea        r8d, [rcx + 0x10]
00f54 4d63c0                         movsxd     r8, r8d
00f57 bf06000000                     mov        edi, 6
00f5c c442c0f5db                     bzhi       r11, r11, rdi
00f61 4d03c3                         add        r8, r11
00f64 4d3bc6                         cmp        r8, r14
00f67 498bfe                         mov        rdi, r14
00f6a 490f4cf8                       cmovl      rdi, r8
00f6e 4c8bdf                         mov        r11, rdi
00f71 4d2bd9                         sub        r11, r9
00f74 4d8d43ff                       lea        r8, [r11 - 1]
00f78 49c1f83f                       sar        r8, 0x3f
00f7c 49c1e83d                       shr        r8, 0x3d
00f80 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
00f85 4983e3f8                       and        r11, 0xfffffffffffffff8
00f89 4d03d9                         add        r11, r9
00f8c 4d3bcb                         cmp        r9, r11
00f8f 4d0f4ccb                       cmovl      r9, r11
00f93 458bc9                         mov        r9d, r9d
00f96 458d4108                       lea        r8d, [r9 + 8]
00f9a 442b8c2490000000               sub        r9d, dword ptr [rsp + 0x90]
00fa2 4963d0                         movsxd     rdx, r8d
00fa5 4803d3                         add        rdx, rbx
00fa8 4183c108                       add        r9d, 8
00fac 4d63d9                         movsxd     r11, r9d
00faf 4c03db                         add        r11, rbx
00fb2 4c8d4a4c                       lea        r9, [rdx + 0x4c]
00fb6 4883c20c                       add        rdx, 0xc
00fba 498d5b0c                       lea        rbx, [r11 + 0xc]
00fbe 4533c0                         xor        r8d, r8d
00fc1 4c3bcb                         cmp        r9, rbx
00fc4 410f96c0                       setbe      r8b
00fc8 4983c34c                       add        r11, 0x4c
00fcc 4533c9                         xor        r9d, r9d
00fcf 4c3bda                         cmp        r11, rdx
00fd2 410f96c1                       setbe      r9b
00fd6 450bc1                         or         r8d, r9d
00fd9 0f84cd180000                   je         0x7f63dbbeb02c
00fdf 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00fe7 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00fee 0f8f64190000                   jg         0x7f63dbbeb0d8
00ff4 442bd1                         sub        r10d, ecx
00ff7 8bdf                           mov        ebx, edi
00ff9 eb04                           jmp        0x7f63dbbe977f
00ffb 90                             nop        
00ffc 418beb                         mov        ebp, r11d
00fff 458d042a                       lea        r8d, [r10 + rbp]
01003 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01008 4f8b5c030c                     mov        r11, qword ptr [r11 + r8 + 0xc]
0100d 448bcd                         mov        r9d, ebp
01010 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01014 4e895c090c                     mov        qword ptr [rcx + r9 + 0xc], r11
01019 448d5d08                       lea        r11d, [rbp + 8]
0101d 443bdb                         cmp        r11d, ebx
01020 7cda                           jl         0x7f63dbbe977c
01022 4d8d8608feffff                 lea        r8, [r14 - 0x1f8]
01029 4981f800000080                 cmp        r8, -0x80000000
01030 49c7c100000080                 mov        r9, 0xffffffff80000000
01037 4d0f4cc1                       cmovl      r8, r9
0103b 418bc0                         mov        eax, r8d
0103e 443bd8                         cmp        r11d, eax
01041 0f8dbd190000                   jge        0x7f63dbbeb184
01047 4d63c3                         movsxd     r8, r11d
0104a 4d03c5                         add        r8, r13
0104d 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
01055 0f83b1190000                   jae        0x7f63dbbeb18c
0105b 81c500020000                   add        ebp, 0x200
01061 4c63c5                         movsxd     r8, ebp
01064 4d03c5                         add        r8, r13
01067 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
0106f 0f83ab190000                   jae        0x7f63dbbeb1a0
01075 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
0107a 0f83b4190000                   jae        0x7f63dbbeb1b4
01080 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
01084 0f83be190000                   jae        0x7f63dbbeb1c8
0108a eb07                           jmp        0x7f63dbbe9813
0108c 90                             nop        
0108d 90                             nop        
0108e 90                             nop        
0108f 90                             nop        
01090 448bd9                         mov        r11d, ecx
01093 478d041a                       lea        r8d, [r10 + r11]
01097 458bcb                         mov        r9d, r11d
0109a 4963c9                         movsxd     rcx, r9d
0109d 418bd8                         mov        ebx, r8d
010a0 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
010a5 62d17e486f84190c000000         vmovdqu32  zmm0, zmmword ptr [r9 + rbx + 0xc]
010b0 4963f8                         movsxd     rdi, r8d
010b3 458d8380000000                 lea        r8d, [r11 + 0x80]
010ba 4503c2                         add        r8d, r10d
010bd 418d9b00010000                 lea        ebx, [r11 + 0x100]
010c4 4103da                         add        ebx, r10d
010c7 458bc8                         mov        r9d, r8d
010ca 4963d0                         movsxd     rdx, r8d
010cd 448bc3                         mov        r8d, ebx
010d0 4863f3                         movsxd     rsi, ebx
010d3 418bdb                         mov        ebx, r11d
010d6 8b6c2448                       mov        ebp, dword ptr [rsp + 0x48]
010da 62f17e487f841d0c000000         vmovdqu32  zmmword ptr [rbp + rbx + 0xc], zmm0
010e5 62f17e486f843d4c000000         vmovdqu32  zmm0, zmmword ptr [rbp + rdi + 0x4c]
010f0 62f17e487f840d4c000000         vmovdqu32  zmmword ptr [rbp + rcx + 0x4c], zmm0
010fb 62b17e486f840d0c000000         vmovdqu32  zmm0, zmmword ptr [rbp + r9 + 0xc]
01106 8bdd                           mov        ebx, ebp
01108 62f17e487f840b8c000000         vmovdqu32  zmmword ptr [rbx + rcx + 0x8c], zmm0
01113 62f17e486f84134c000000         vmovdqu32  zmm0, zmmword ptr [rbx + rdx + 0x4c]
0111e 62f17e487f840bcc000000         vmovdqu32  zmmword ptr [rbx + rcx + 0xcc], zmm0
01129 62b17e486f84030c000000         vmovdqu32  zmm0, zmmword ptr [rbx + r8 + 0xc]
01134 62f17e487f840b0c010000         vmovdqu32  zmmword ptr [rbx + rcx + 0x10c], zmm0
0113f 62f17e486f84334c000000         vmovdqu32  zmm0, zmmword ptr [rbx + rsi + 0x4c]
0114a 62f17e487f840b4c010000         vmovdqu32  zmmword ptr [rbx + rcx + 0x14c], zmm0
01155 62f17e486f843b8c010000         vmovdqu32  zmm0, zmmword ptr [rbx + rdi + 0x18c]
01160 62f17e487f840b8c010000         vmovdqu32  zmmword ptr [rbx + rcx + 0x18c], zmm0
0116b 62f17e486f843bcc010000         vmovdqu32  zmm0, zmmword ptr [rbx + rdi + 0x1cc]
01176 62f17e487f840bcc010000         vmovdqu32  zmmword ptr [rbx + rcx + 0x1cc], zmm0
01181 418d8b00020000                 lea        ecx, [r11 + 0x200]
01188 3bc8                           cmp        ecx, eax
0118a 0f8c00ffffff                   jl         0x7f63dbbe9810
01190 4983c6c8                       add        r14, -0x38
01194 4981fe00000080                 cmp        r14, -0x80000000
0119b 49c7c000000080                 mov        r8, 0xffffffff80000000
011a2 4d0f4cf0                       cmovl      r14, r8
011a6 458bc6                         mov        r8d, r14d
011a9 413bc8                         cmp        ecx, r8d
011ac 7d53                           jge        0x7f63dbbe9981
011ae 4181c338020000                 add        r11d, 0x238
011b5 4d63cb                         movsxd     r9, r11d
011b8 4d03cd                         add        r9, r13
011bb 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
011c3 0f837f1c0000                   jae        0x7f63dbbeb5c8
011c9 443b5c244c                     cmp        r11d, dword ptr [rsp + 0x4c]
011ce 0f839c1c0000                   jae        0x7f63dbbeb5f0
011d4 458d1c0a                       lea        r11d, [r10 + rcx]
011d8 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
011dd 62917e486f84190c000000         vmovdqu32  zmm0, zmmword ptr [r9 + r11 + 0xc]
011e8 448bd9                         mov        r11d, ecx
011eb 418bd9                         mov        ebx, r9d
011ee 62b17e487f841b0c000000         vmovdqu32  zmmword ptr [rbx + r11 + 0xc], zmm0
011f9 83c140                         add        ecx, 0x40
011fc 413bc8                         cmp        ecx, r8d
011ff 7cd3                           jl         0x7f63dbbe9954
01201 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
01208 7d44                           jge        0x7f63dbbe99ce
0120a 4c63d9                         movsxd     r11, ecx
0120d 4d03dd                         add        r11, r13
01210 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
01218 0f833e1c0000                   jae        0x7f63dbbeb5dc
0121e 3b4c244c                       cmp        ecx, dword ptr [rsp + 0x4c]
01222 0f835c1c0000                   jae        0x7f63dbbeb604
01228 458d1c0a                       lea        r11d, [r10 + rcx]
0122c 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01231 4f8b5c180c                     mov        r11, qword ptr [r8 + r11 + 0xc]
01236 448bc1                         mov        r8d, ecx
01239 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
0123d 4e895c030c                     mov        qword ptr [rbx + r8 + 0xc], r11
01242 83c108                         add        ecx, 8
01245 3b8c2498000000                 cmp        ecx, dword ptr [rsp + 0x98]
0124c 7cda                           jl         0x7f63dbbe99a8
0124e 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01256 e9a1f3ffff                     jmp        0x7f63dbbe8d7c
0125b 90                             nop        
0125c 8bc7                           mov        eax, edi
0125e 448d1c01                       lea        r11d, [rcx + rax]
01262 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01267 c4817a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 0xc]
0126e 448bd8                         mov        r11d, eax
01271 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01276 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
0127d 8d7810                         lea        edi, [rax + 0x10]
01280 3bfb                           cmp        edi, ebx
01282 7cd8                           jl         0x7f63dbbe99dc
01284 4881c210ffffff                 add        rdx, -0xf0
0128b 4881fa00000080                 cmp        rdx, -0x80000000
01292 49c7c200000080                 mov        r10, 0xffffffff80000000
01299 490f4cd2                       cmovl      rdx, r10
0129d 8bda                           mov        ebx, edx
0129f 3bfb                           cmp        edi, ebx
012a1 0f8d89010000                   jge        0x7f63dbbe9bb0
012a7 4c63d7                         movsxd     r10, edi
012aa 4d03d0                         add        r10, r8
012ad 4d3bd1                         cmp        r10, r9
012b0 0f83421b0000                   jae        0x7f63dbbeb578
012b6 448d9000010000                 lea        r10d, [rax + 0x100]
012bd 4d63da                         movsxd     r11, r10d
012c0 4d03d8                         add        r11, r8
012c3 4d3bd9                         cmp        r11, r9
012c6 0f83401b0000                   jae        0x7f63dbbeb58c
012cc 3b7c247c                       cmp        edi, dword ptr [rsp + 0x7c]
012d0 0f834a1b0000                   jae        0x7f63dbbeb5a0
012d6 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
012db 0f83531b0000                   jae        0x7f63dbbeb5b4
012e1 90                             nop        
012e2 90                             nop        
012e3 90                             nop        
012e4 90                             nop        
012e5 90                             nop        
012e6 90                             nop        
012e7 90                             nop        
012e8 90                             nop        
012e9 90                             nop        
012ea 90                             nop        
012eb 90                             nop        
012ec 90                             nop        
012ed 90                             nop        
012ee 90                             nop        
012ef 90                             nop        
012f0 448d1c39                       lea        r11d, [rcx + rdi]
012f4 448bd7                         mov        r10d, edi
012f7 4963d2                         movsxd     rdx, r10d
012fa 418bf3                         mov        esi, r11d
012fd 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01302 c4c17a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + rsi + 0xc]
01309 4963c3                         movsxd     rax, r11d
0130c 448bd7                         mov        r10d, edi
0130f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01314 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
0131b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01320 c4c17a6f44021c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x1c]
01327 c4c17a7f44131c                 vmovdqu    xmmword ptr [r11 + rdx + 0x1c], xmm0
0132e c4c17a6f44022c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x2c]
01335 c4c17a7f44132c                 vmovdqu    xmmword ptr [r11 + rdx + 0x2c], xmm0
0133c c4c17a6f44023c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x3c]
01343 c4c17a7f44133c                 vmovdqu    xmmword ptr [r11 + rdx + 0x3c], xmm0
0134a c4c17a6f44024c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x4c]
01351 c4c17a7f44134c                 vmovdqu    xmmword ptr [r11 + rdx + 0x4c], xmm0
01358 c4c17a6f44025c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x5c]
0135f c4c17a7f44135c                 vmovdqu    xmmword ptr [r11 + rdx + 0x5c], xmm0
01366 c4c17a6f44026c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x6c]
0136d c4c17a7f44136c                 vmovdqu    xmmword ptr [r11 + rdx + 0x6c], xmm0
01374 c4c17a6f44027c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x7c]
0137b c4c17a7f44137c                 vmovdqu    xmmword ptr [r11 + rdx + 0x7c], xmm0
01382 c4c17a6f84028c000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x8c]
0138c c4c17a7f84138c000000           vmovdqu    xmmword ptr [r11 + rdx + 0x8c], xmm0
01396 c4c17a6f84029c000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0x9c]
013a0 c4c17a7f84139c000000           vmovdqu    xmmword ptr [r11 + rdx + 0x9c], xmm0
013aa c4c17a6f8402ac000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0xac]
013b4 c4c17a7f8413ac000000           vmovdqu    xmmword ptr [r11 + rdx + 0xac], xmm0
013be c4c17a6f8402bc000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0xbc]
013c8 c4c17a7f8413bc000000           vmovdqu    xmmword ptr [r11 + rdx + 0xbc], xmm0
013d2 c4c17a6f8402cc000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0xcc]
013dc c4c17a7f8413cc000000           vmovdqu    xmmword ptr [r11 + rdx + 0xcc], xmm0
013e6 c4c17a6f8402dc000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0xdc]
013f0 c4c17a7f8413dc000000           vmovdqu    xmmword ptr [r11 + rdx + 0xdc], xmm0
013fa c4c17a6f8402ec000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0xec]
01404 c4c17a7f8413ec000000           vmovdqu    xmmword ptr [r11 + rdx + 0xec], xmm0
0140e c4c17a6f8402fc000000           vmovdqu    xmm0, xmmword ptr [r10 + rax + 0xfc]
01418 c4c17a7f8413fc000000           vmovdqu    xmmword ptr [r11 + rdx + 0xfc], xmm0
01422 81c700010000                   add        edi, 0x100
01428 3bfb                           cmp        edi, ebx
0142a 0f8cc0feffff                   jl         0x7f63dbbe9a70
01430 413bfd                         cmp        edi, r13d
01433 7d42                           jge        0x7f63dbbe9bf7
01435 4c63d7                         movsxd     r10, edi
01438 4d03d0                         add        r10, r8
0143b 4d3bd1                         cmp        r10, r9
0143e 0f83541a0000                   jae        0x7f63dbbeb618
01444 3b7c247c                       cmp        edi, dword ptr [rsp + 0x7c]
01448 0f835e1a0000                   jae        0x7f63dbbeb62c
0144e 90                             nop        
0144f 90                             nop        
01450 448d1439                       lea        r10d, [rcx + rdi]
01454 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01459 c4817a6f44130c                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 0xc]
01460 448bd7                         mov        r10d, edi
01463 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01468 c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
0146f 83c710                         add        edi, 0x10
01472 413bfd                         cmp        edi, r13d
01475 7cd9                           jl         0x7f63dbbe9bd0
01477 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
0147f 4503d6                         add        r10d, r14d
01482 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0148a 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01492 e919f3ffff                     jmp        0x7f63dbbe8f30
01497 4c03c9                         add        r9, rcx
0149a 4c3b4c2458                     cmp        r9, qword ptr [rsp + 0x58]
0149f 7e08                           jle        0x7f63dbbe9c29
014a1 4533c0                         xor        r8d, r8d
014a4 e90aecffff                     jmp        0x7f63dbbe8833
014a9 4533c0                         xor        r8d, r8d
014ac ba01000000                     mov        edx, 1
014b1 e9ffebffff                     jmp        0x7f63dbbe8835
014b6 bee4ffffff                     mov        esi, 0xffffffe4
014bb 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
014c0 448b1c24                       mov        r11d, dword ptr [rsp]
014c4 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
014cc 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
014d1 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
014d9 448b542408                     mov        r10d, dword ptr [rsp + 8]
014de 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
014e6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
014eb 4c891424                       mov        qword ptr [rsp], r10
014ef 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
014f4 4489542408                     mov        dword ptr [rsp + 8], r10d
014f9 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014fe 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01503 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01508 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0150d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01512 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01517 4489742434                     mov        dword ptr [rsp + 0x34], r14d
0151c 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01521 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01526 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0152b 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01530 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01535 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0153a 90                             nop        
0153b 90                             nop        
0153c c5f877                         vzeroupper 
0153f e89c0ab0ff                     call       0x7f63db6ea760
01544 0f1f84003c160007               nop        dword ptr [rax + rax + 0x700163c]
0154c 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01556 4883e4f0                       and        rsp, 0xfffffffffffffff0
0155a e8216cb418                     call       0x7f63f4730900
0155f f4                             hlt        
01560 bee4ffffff                     mov        esi, 0xffffffe4
01565 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0156a 448b1c24                       mov        r11d, dword ptr [rsp]
0156e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01576 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0157b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01583 448b442408                     mov        r8d, dword ptr [rsp + 8]
01588 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01590 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01595 4c891c24                       mov        qword ptr [rsp], r11
01599 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0159e 44895c2408                     mov        dword ptr [rsp + 8], r11d
015a3 4489742410                     mov        dword ptr [rsp + 0x10], r14d
015a8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
015ad 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
015b2 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015b7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
015bc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
015c1 4489442420                     mov        dword ptr [rsp + 0x20], r8d
015c6 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
015cc c5f877                         vzeroupper 
015cf e80c0ab0ff                     call       0x7f63db6ea760
015d4 0f1f8400cc160008               nop        dword ptr [rax + rax + 0x80016cc]
015dc 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
015e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ea e8916bb418                     call       0x7f63f4730900
015ef f4                             hlt        
015f0 bee4ffffff                     mov        esi, 0xffffffe4
015f5 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
015fa 448b0424                       mov        r8d, dword ptr [rsp]
015fe 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01606 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0160b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01613 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01618 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01620 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01625 4c891c24                       mov        qword ptr [rsp], r11
01629 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0162e 4489442408                     mov        dword ptr [rsp + 8], r8d
01633 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01638 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0163d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01642 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01647 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0164c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01651 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01656 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0165b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01660 c5f877                         vzeroupper 
01663 e87809b0ff                     call       0x7f63db6ea760
01668 0f1f840060170009               nop        dword ptr [rax + rax + 0x9001760]
01670 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0167a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0167e e8fd6ab418                     call       0x7f63f4730900
01683 f4                             hlt        
01684 be45ffffff                     mov        esi, 0xffffff45
01689 4c898424d0000000               mov        qword ptr [rsp + 0xd0], r8
01691 90                             nop        
01692 90                             nop        
01693 90                             nop        
01694 c5f877                         vzeroupper 
01697 e84409b0ff                     call       0x7f63db6ea760
0169c 0f1f84009417000a               nop        dword ptr [rax + rax + 0xa001794]
016a4 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
016ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
016b2 e8c96ab418                     call       0x7f63f4730900
016b7 f4                             hlt        
016b8 be45ffffff                     mov        esi, 0xffffff45
016bd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
016c2 448b1c24                       mov        r11d, dword ptr [rsp]
016c6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
016ce 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016d3 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
016db 448b542408                     mov        r10d, dword ptr [rsp + 8]
016e0 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
016e8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
016ed 4c891424                       mov        qword ptr [rsp], r10
016f1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016f6 44895c2408                     mov        dword ptr [rsp + 8], r11d
016fb 4489742410                     mov        dword ptr [rsp + 0x10], r14d
01700 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01705 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0170a 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0170f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01714 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01719 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0171e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01723 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01727 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0172c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01731 90                             nop        
01732 90                             nop        
01733 90                             nop        
01734 c5f877                         vzeroupper 
01737 e8a408b0ff                     call       0x7f63db6ea760
0173c 0f1f84003418000b               nop        dword ptr [rax + rax + 0xb001834]
01744 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0174e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01752 e8296ab418                     call       0x7f63f4730900
01757 f4                             hlt        
01758 493bd8                         cmp        rbx, r8
0175b bdffffffff                     mov        ebp, 0xffffffff
01760 7c08                           jl         0x7f63dbbe9eea
01762 400f95c5                       setne      bpl
01766 400fb6ed                       movzx      ebp, bpl
0176a be45ffffff                     mov        esi, 0xffffff45
0176f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01774 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
0177c 448b1c24                       mov        r11d, dword ptr [rsp]
01780 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
01788 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0178d 4c891424                       mov        qword ptr [rsp], r10
01791 448b542408                     mov        r10d, dword ptr [rsp + 8]
01796 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
0179e 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
017a3 4c89542408                     mov        qword ptr [rsp + 8], r10
017a8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017ad 4489542410                     mov        dword ptr [rsp + 0x10], r10d
017b2 4489742418                     mov        dword ptr [rsp + 0x18], r14d
017b7 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
017bc 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
017c1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017c6 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017cb 4c89442440                     mov        qword ptr [rsp + 0x40], r8
017d0 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
017d5 4c89542448                     mov        qword ptr [rsp + 0x48], r10
017da 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
017df 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
017e4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
017e9 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
017ee 90                             nop        
017ef 90                             nop        
017f0 c5f877                         vzeroupper 
017f3 e8e807b0ff                     call       0x7f63db6ea760
017f8 0f1f8400f018000c               nop        dword ptr [rax + rax + 0xc0018f0]
01800 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0180a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0180e e86d69b418                     call       0x7f63f4730900
01813 f4                             hlt        
01814 be45ffffff                     mov        esi, 0xffffff45
01819 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0181e 448b1c24                       mov        r11d, dword ptr [rsp]
01822 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0182a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0182f 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01837 448b442408                     mov        r8d, dword ptr [rsp + 8]
0183c 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01844 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01849 4c891c24                       mov        qword ptr [rsp], r11
0184d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01852 44895c2408                     mov        dword ptr [rsp + 8], r11d
01857 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0185c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01861 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01866 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0186b 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01870 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01875 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0187a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0187f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01884 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01889 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0188e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01893 90                             nop        
01894 c5f877                         vzeroupper 
01897 e84407b0ff                     call       0x7f63db6ea760
0189c 0f1f84009419000d               nop        dword ptr [rax + rax + 0xd001994]
018a4 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
018ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
018b2 e8c968b418                     call       0x7f63f4730900
018b7 f4                             hlt        
018b8 be45ffffff                     mov        esi, 0xffffff45
018bd 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
018c2 448b1c24                       mov        r11d, dword ptr [rsp]
018c6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
018ce 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
018d3 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
018db 448b542408                     mov        r10d, dword ptr [rsp + 8]
018e0 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
018e8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
018ed 4c891424                       mov        qword ptr [rsp], r10
018f1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018f6 44895c2408                     mov        dword ptr [rsp + 8], r11d
018fb 4489742410                     mov        dword ptr [rsp + 0x10], r14d
01900 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01905 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0190a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0190f 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01914 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01919 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0191e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01923 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01928 c5f877                         vzeroupper 
0192b e8b006b0ff                     call       0x7f63db6ea760
01930 0f1f8400281a000e               nop        dword ptr [rax + rax + 0xe001a28]
01938 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01942 4883e4f0                       and        rsp, 0xfffffffffffffff0
01946 e83568b418                     call       0x7f63f4730900
0194b f4                             hlt        
0194c bee4ffffff                     mov        esi, 0xffffffe4
01951 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01956 448b1c24                       mov        r11d, dword ptr [rsp]
0195a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01962 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01967 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0196f 448b442408                     mov        r8d, dword ptr [rsp + 8]
01974 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
0197c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01981 4c891c24                       mov        qword ptr [rsp], r11
01985 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0198a 44895c2408                     mov        dword ptr [rsp + 8], r11d
0198f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01994 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01999 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0199e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
019a3 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
019a8 4489442420                     mov        dword ptr [rsp + 0x20], r8d
019ad 4489542444                     mov        dword ptr [rsp + 0x44], r10d
019b2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
019b7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019bc 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
019c1 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
019c6 90                             nop        
019c7 90                             nop        
019c8 c5f877                         vzeroupper 
019cb e81006b0ff                     call       0x7f63db6ea760
019d0 0f1f8400c81a000f               nop        dword ptr [rax + rax + 0xf001ac8]
019d8 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
019e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019e6 e89567b418                     call       0x7f63f4730900
019eb f4                             hlt        
019ec bee4ffffff                     mov        esi, 0xffffffe4
019f1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
019f6 448b0424                       mov        r8d, dword ptr [rsp]
019fa 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01a02 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01a07 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01a0f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a14 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01a1c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01a21 4c891c24                       mov        qword ptr [rsp], r11
01a25 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01a2a 4489442408                     mov        dword ptr [rsp + 8], r8d
01a2f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01a34 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01a39 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a3e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01a43 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01a48 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01a4d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a52 4c894c2438                     mov        qword ptr [rsp + 0x38], r9
01a57 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01a5c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a61 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01a66 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01a6b 90                             nop        
01a6c c5f877                         vzeroupper 
01a6f e86c05b0ff                     call       0x7f63db6ea760
01a74 0f1f84006c1b0010               nop        dword ptr [rax + rax + 0x10001b6c]
01a7c 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01a86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a8a e8f166b418                     call       0x7f63f4730900
01a8f f4                             hlt        
01a90 4183c208                       add        r10d, 8
01a94 be6effffff                     mov        esi, 0xffffff6e
01a99 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01a9e 448b1c24                       mov        r11d, dword ptr [rsp]
01aa2 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01aaa 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01aaf 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01ab7 448b442408                     mov        r8d, dword ptr [rsp + 8]
01abc 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01ac4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01ac9 4c891c24                       mov        qword ptr [rsp], r11
01acd 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ad2 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ad7 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01adb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01ae0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ae5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01aea 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01aef 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01af4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01af9 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
01b01 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01b06 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01b0a 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01b0f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01b14 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b19 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b1e 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01b23 90                             nop        
01b24 c5f877                         vzeroupper 
01b27 e8b404b0ff                     call       0x7f63db6ea760
01b2c 0f1f8400241c0011               nop        dword ptr [rax + rax + 0x11001c24]
01b34 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01b3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b42 e83966b418                     call       0x7f63f4730900
01b47 f4                             hlt        
01b48 4183c208                       add        r10d, 8
01b4c be66ffffff                     mov        esi, 0xffffff66
01b51 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01b56 448b0424                       mov        r8d, dword ptr [rsp]
01b5a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
01b62 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01b67 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01b6f 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b74 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01b7c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01b81 4c891c24                       mov        qword ptr [rsp], r11
01b85 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01b8a 4489442408                     mov        dword ptr [rsp + 8], r8d
01b8f 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01b93 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01b98 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01b9d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01ba2 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01ba7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01bac 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01bb1 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
01bb9 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01bbe 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01bc2 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01bc7 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01bcc 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01bd1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01bd6 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01bdb 90                             nop        
01bdc c5f877                         vzeroupper 
01bdf e8fc03b0ff                     call       0x7f63db6ea760
01be4 0f1f8400dc1c0012               nop        dword ptr [rax + rax + 0x12001cdc]
01bec 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bfa e88165b418                     call       0x7f63f4730900
01bff f4                             hlt        
01c00 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
01c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c0e e86d65b418                     call       0x7f63f4730900
01c13 f4                             hlt        
01c14 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
01c1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c22 e85965b418                     call       0x7f63f4730900
01c27 f4                             hlt        
01c28 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
01c32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c36 e84565b418                     call       0x7f63f4730900
01c3b f4                             hlt        
01c3c 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
01c46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c4a e83165b418                     call       0x7f63f4730900
01c4f f4                             hlt        
01c50 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
01c5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c5e e81d65b418                     call       0x7f63f4730900
01c63 f4                             hlt        
01c64 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
01c6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c72 e80965b418                     call       0x7f63f4730900
01c77 f4                             hlt        
01c78 beccffffff                     mov        esi, 0xffffffcc
01c7d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01c82 448b1c24                       mov        r11d, dword ptr [rsp]
01c86 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01c8e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
01c93 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
01c9b 448b442408                     mov        r8d, dword ptr [rsp + 8]
01ca0 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
01ca8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
01cad 4c891c24                       mov        qword ptr [rsp], r11
01cb1 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01cb6 4489442408                     mov        dword ptr [rsp + 8], r8d
01cbb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01cc0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01cc5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01cca 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01ccf 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cd4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01cd9 448b9c248c000000               mov        r11d, dword ptr [rsp + 0x8c]
01ce1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ce6 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ceb 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01cf0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01cf5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01cfa 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01cff 90                             nop        
01d00 c5f877                         vzeroupper 
01d03 e8d802b0ff                     call       0x7f63db6ea760
01d08 0f1f8400001e0013               nop        dword ptr [rax + rax + 0x13001e00]
01d10 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01d1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d1e e85d64b418                     call       0x7f63f4730900
01d23 f4                             hlt        
01d24 beccffffff                     mov        esi, 0xffffffcc
01d29 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01d2e 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
01d36 448b1424                       mov        r10d, dword ptr [rsp]
01d3a 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
01d42 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01d47 4c891424                       mov        qword ptr [rsp], r10
01d4b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d50 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
01d58 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01d5d 4c89542408                     mov        qword ptr [rsp + 8], r10
01d62 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01d67 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01d6c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d71 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d76 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01d7b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01d80 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01d85 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01d8a 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01d8f 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01d94 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01d99 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01d9e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01da3 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01da8 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01dad 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01db2 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
01db7 4489742474                     mov        dword ptr [rsp + 0x74], r14d
01dbc c5f877                         vzeroupper 
01dbf e81c02b0ff                     call       0x7f63db6ea760
01dc4 0f1f8400bc1e0014               nop        dword ptr [rax + rax + 0x14001ebc]
01dcc 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dda e8a163b418                     call       0x7f63f4730900
01ddf f4                             hlt        
01de0 85db                           test       ebx, ebx
01de2 0f84d8100000                   je         0x7f63dbbeb640
01de8 8b0c24                         mov        ecx, dword ptr [rsp]
01deb 458bda                         mov        r11d, r10d
01dee 4533c0                         xor        r8d, r8d
01df1 448bd1                         mov        r10d, ecx
01df4 e976eeffff                     jmp        0x7f63dbbe93ef
01df9 bee4ffffff                     mov        esi, 0xffffffe4
01dfe 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01e03 448b1c24                       mov        r11d, dword ptr [rsp]
01e07 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01e0f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e14 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01e1c 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e21 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01e29 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01e2e 4c891424                       mov        qword ptr [rsp], r10
01e32 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01e37 4489542408                     mov        dword ptr [rsp + 8], r10d
01e3c 4489742410                     mov        dword ptr [rsp + 0x10], r14d
01e41 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e46 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e4b 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e50 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01e55 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01e5a 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e5f 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01e64 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01e68 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01e6d 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01e72 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01e77 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01e7c 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01e81 4489542464                     mov        dword ptr [rsp + 0x64], r10d
01e86 90                             nop        
01e87 90                             nop        
01e88 c5f877                         vzeroupper 
01e8b e85001b0ff                     call       0x7f63db6ea760
01e90 0f1f8400881f0015               nop        dword ptr [rax + rax + 0x15001f88]
01e98 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01ea2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ea6 e8d562b418                     call       0x7f63f4730900
01eab f4                             hlt        
01eac be6effffff                     mov        esi, 0xffffff6e
01eb1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01eb6 448b1424                       mov        r10d, dword ptr [rsp]
01eba 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
01ec2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ec7 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01ecf 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ed4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
01edc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ee1 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ee6 4489742410                     mov        dword ptr [rsp + 0x10], r14d
01eeb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ef0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ef5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01efa 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01eff 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f04 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f09 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01f0e 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01f13 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01f17 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01f1c 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01f21 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01f26 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01f2b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01f30 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01f35 90                             nop        
01f36 90                             nop        
01f37 90                             nop        
01f38 c5f877                         vzeroupper 
01f3b e8a000b0ff                     call       0x7f63db6ea760
01f40 0f1f840038200016               nop        dword ptr [rax + rax + 0x16002038]
01f48 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01f52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f56 e82562b418                     call       0x7f63f4730900
01f5b f4                             hlt        
01f5c be45ffffff                     mov        esi, 0xffffff45
01f61 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
01f66 448b1c24                       mov        r11d, dword ptr [rsp]
01f6a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
01f72 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01f77 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
01f7f 448b542408                     mov        r10d, dword ptr [rsp + 8]
01f84 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
01f8c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01f91 4489542408                     mov        dword ptr [rsp + 8], r10d
01f96 4489742410                     mov        dword ptr [rsp + 0x10], r14d
01f9b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fa0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fa5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01faa 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01faf 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01fb4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fb9 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01fbe 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01fc2 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
01fc7 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01fcc 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01fd1 4c89542448                     mov        qword ptr [rsp + 0x48], r10
01fd6 90                             nop        
01fd7 90                             nop        
01fd8 c5f877                         vzeroupper 
01fdb e80000b0ff                     call       0x7f63db6ea760
01fe0 0f1f8400d8200017               nop        dword ptr [rax + rax + 0x170020d8]
01fe8 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
01ff2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ff6 e88561b418                     call       0x7f63f4730900
01ffb f4                             hlt        
01ffc be3dffffff                     mov        esi, 0xffffff3d
02001 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02006 448b1c24                       mov        r11d, dword ptr [rsp]
0200a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02012 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02017 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0201f 448b542408                     mov        r10d, dword ptr [rsp + 8]
02024 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
0202c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02031 44895c2408                     mov        dword ptr [rsp + 8], r11d
02036 4489742410                     mov        dword ptr [rsp + 0x10], r14d
0203b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02040 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02045 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0204a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0204f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02054 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02059 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0205e 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
02062 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02067 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0206c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02071 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02076 90                             nop        
02077 90                             nop        
02078 c5f877                         vzeroupper 
0207b e860ffafff                     call       0x7f63db6ea760
02080 0f1f840078210018               nop        dword ptr [rax + rax + 0x18002178]
02088 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02092 4883e4f0                       and        rsp, 0xfffffffffffffff0
02096 e8e560b418                     call       0x7f63f4730900
0209b f4                             hlt        
0209c bee4ffffff                     mov        esi, 0xffffffe4
020a1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
020a6 448b0424                       mov        r8d, dword ptr [rsp]
020aa 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
020b2 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
020b7 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
020bf 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
020c4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
020cc 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
020d1 4c891c24                       mov        qword ptr [rsp], r11
020d5 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
020da 4489442408                     mov        dword ptr [rsp + 8], r8d
020df 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
020e4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
020e9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
020ee 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
020f3 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
020f8 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
020fd 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02102 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02107 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0210c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02111 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02116 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0211b 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02120 c5f877                         vzeroupper 
02123 e8b8feafff                     call       0x7f63db6ea760
02128 0f1f840020220019               nop        dword ptr [rax + rax + 0x19002220]
02130 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0213a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0213e e83d60b418                     call       0x7f63f4730900
02143 f4                             hlt        
02144 bee4ffffff                     mov        esi, 0xffffffe4
02149 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0214e 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02156 448b0424                       mov        r8d, dword ptr [rsp]
0215a 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02162 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02167 4c891c24                       mov        qword ptr [rsp], r11
0216b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02170 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02178 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0217d 4c895c2408                     mov        qword ptr [rsp + 8], r11
02182 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02187 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0218c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02191 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02196 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0219b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
021a0 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
021a5 4489442424                     mov        dword ptr [rsp + 0x24], r8d
021aa 4489542434                     mov        dword ptr [rsp + 0x34], r10d
021af 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
021b4 4c89542448                     mov        qword ptr [rsp + 0x48], r10
021b9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
021be 4489542460                     mov        dword ptr [rsp + 0x60], r10d
021c3 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
021c8 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
021cd 90                             nop        
021ce 90                             nop        
021cf 90                             nop        
021d0 c5f877                         vzeroupper 
021d3 e808feafff                     call       0x7f63db6ea760
021d8 0f1f8400d022001a               nop        dword ptr [rax + rax + 0x1a0022d0]
021e0 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
021ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
021ee e88d5fb418                     call       0x7f63f4730900
021f3 f4                             hlt        
021f4 418d6a01                       lea        ebp, [r10 + 1]
021f8 bee4ffffff                     mov        esi, 0xffffffe4
021fd 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02202 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0220a 448b1c24                       mov        r11d, dword ptr [rsp]
0220e 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
02216 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0221b 4c891c24                       mov        qword ptr [rsp], r11
0221f 448b442408                     mov        r8d, dword ptr [rsp + 8]
02224 44898424dc000000               mov        dword ptr [rsp + 0xdc], r8d
0222c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02231 4c895c2408                     mov        qword ptr [rsp + 8], r11
02236 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0223b 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02240 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02245 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0224a 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0224f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
02254 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02259 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0225e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02263 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02268 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0226d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02272 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02277 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0227c 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02281 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02286 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0228b 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
02290 c5f877                         vzeroupper 
02293 e848fdafff                     call       0x7f63db6ea760
02298 0f1f84009023001b               nop        dword ptr [rax + rax + 0x1b002390]
022a0 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
022aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
022ae e8cd5eb418                     call       0x7f63f4730900
022b3 f4                             hlt        
022b4 bee4ffffff                     mov        esi, 0xffffffe4
022b9 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
022be 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
022c6 448b0424                       mov        r8d, dword ptr [rsp]
022ca 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
022d2 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
022d7 4c891c24                       mov        qword ptr [rsp], r11
022db 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
022e0 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
022e8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
022ed 4c895c2408                     mov        qword ptr [rsp + 8], r11
022f2 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
022f7 4489442410                     mov        dword ptr [rsp + 0x10], r8d
022fc 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02301 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02306 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0230b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
02310 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02315 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0231a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0231f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02324 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02329 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0232e 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02333 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02338 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0233d 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02342 90                             nop        
02343 90                             nop        
02344 c5f877                         vzeroupper 
02347 e894fcafff                     call       0x7f63db6ea760
0234c 0f1f84004424001c               nop        dword ptr [rax + rax + 0x1c002444]
02354 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0235e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02362 e8195eb418                     call       0x7f63f4730900
02367 f4                             hlt        
02368 bee4ffffff                     mov        esi, 0xffffffe4
0236d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02372 448b0424                       mov        r8d, dword ptr [rsp]
02376 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
0237e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02383 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0238b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02390 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02398 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0239d 4c891c24                       mov        qword ptr [rsp], r11
023a1 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
023a6 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
023ab 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
023b0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
023b5 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
023ba 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
023bf 895c2424                       mov        dword ptr [rsp + 0x24], ebx
023c3 4489542434                     mov        dword ptr [rsp + 0x34], r10d
023c8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
023cd 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023d2 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023d7 4c89542448                     mov        qword ptr [rsp + 0x48], r10
023dc c5f877                         vzeroupper 
023df e8fcfbafff                     call       0x7f63db6ea760
023e4 0f1f8400dc24001d               nop        dword ptr [rax + rax + 0x1d0024dc]
023ec 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
023f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023fa e8815db418                     call       0x7f63f4730900
023ff f4                             hlt        
02400 beccffffff                     mov        esi, 0xffffffcc
02405 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
0240a 448b1c24                       mov        r11d, dword ptr [rsp]
0240e 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02416 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0241b 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
02423 448b442408                     mov        r8d, dword ptr [rsp + 8]
02428 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
02430 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02435 4c891c24                       mov        qword ptr [rsp], r11
02439 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0243e 44895c2408                     mov        dword ptr [rsp + 8], r11d
02443 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02448 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0244d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02452 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02457 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0245c 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
02461 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02466 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0246b 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02470 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02475 4489542460                     mov        dword ptr [rsp + 0x60], r10d
0247a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0247f 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02484 c5f877                         vzeroupper 
02487 e854fbafff                     call       0x7f63db6ea760
0248c 0f1f84008425001e               nop        dword ptr [rax + rax + 0x1e002584]
02494 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0249e 4883e4f0                       and        rsp, 0xfffffffffffffff0
024a2 e8d95cb418                     call       0x7f63f4730900
024a7 f4                             hlt        
024a8 be45ffffff                     mov        esi, 0xffffff45
024ad 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
024b2 448b1c24                       mov        r11d, dword ptr [rsp]
024b6 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
024be 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
024c3 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
024cb 448b442408                     mov        r8d, dword ptr [rsp + 8]
024d0 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
024d8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
024dd 4c891c24                       mov        qword ptr [rsp], r11
024e1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
024e6 44895c2408                     mov        dword ptr [rsp + 8], r11d
024eb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
024f0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
024f5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
024fa 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
024ff 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02504 4489442420                     mov        dword ptr [rsp + 0x20], r8d
02509 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0250e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02513 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02518 c5f877                         vzeroupper 
0251b e8c0faafff                     call       0x7f63db6ea760
02520 0f1f84001826001f               nop        dword ptr [rax + rax + 0x1f002618]
02528 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02532 4883e4f0                       and        rsp, 0xfffffffffffffff0
02536 e8455cb418                     call       0x7f63f4730900
0253b f4                             hlt        
0253c be17000000                     mov        esi, 0x17
02541 90                             nop        
02542 90                             nop        
02543 90                             nop        
02544 c5f877                         vzeroupper 
02547 e894faafff                     call       0x7f63db6ea760
0254c 0f1f840044260020               nop        dword ptr [rax + rax + 0x20002644]
02554 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0255e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02562 e8195cb418                     call       0x7f63f4730900
02567 f4                             hlt        
02568 be6effffff                     mov        esi, 0xffffff6e
0256d 498bee                         mov        rbp, r14
02570 8b3c24                         mov        edi, dword ptr [rsp]
02573 89bc24d0000000                 mov        dword ptr [rsp + 0xd0], edi
0257a 4c891c24                       mov        qword ptr [rsp], r11
0257e 895c2408                       mov        dword ptr [rsp + 8], ebx
02582 48ff742420                     push       qword ptr [rsp + 0x20]
02587 488f442410                     pop        qword ptr [rsp + 0x10]
0258c 894c2418                       mov        dword ptr [rsp + 0x18], ecx
02590 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02595 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
0259a 89542438                       mov        dword ptr [rsp + 0x38], edx
0259e 4c89442440                     mov        qword ptr [rsp + 0x40], r8
025a3 90                             nop        
025a4 c5f877                         vzeroupper 
025a7 e834faafff                     call       0x7f63db6ea760
025ac 0f1f8400a4260021               nop        dword ptr [rax + rax + 0x210026a4]
025b4 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
025be 4883e4f0                       and        rsp, 0xfffffffffffffff0
025c2 e8b95bb418                     call       0x7f63f4730900
025c7 f4                             hlt        
025c8 bebeffffff                     mov        esi, 0xffffffbe
025cd 498bee                         mov        rbp, r14
025d0 448b1424                       mov        r10d, dword ptr [rsp]
025d4 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
025dc 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
025e4 48890424                       mov        qword ptr [rsp], rax
025e8 895c2408                       mov        dword ptr [rsp + 8], ebx
025ec 48ff742420                     push       qword ptr [rsp + 0x20]
025f1 488f442410                     pop        qword ptr [rsp + 0x10]
025f6 894c2418                       mov        dword ptr [rsp + 0x18], ecx
025fa 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
025ff 44896c2420                     mov        dword ptr [rsp + 0x20], r13d
02604 89542438                       mov        dword ptr [rsp + 0x38], edx
02608 4c89442440                     mov        qword ptr [rsp + 0x40], r8
0260d 90                             nop        
0260e 90                             nop        
0260f 90                             nop        
02610 c5f877                         vzeroupper 
02613 e8c8f9afff                     call       0x7f63db6ea760
02618 0f1f840010270022               nop        dword ptr [rax + rax + 0x22002710]
02620 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0262a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0262e e84d5bb418                     call       0x7f63f4730900
02633 f4                             hlt        
02634 4c8b742440                     mov        r14, qword ptr [rsp + 0x40]
02639 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
0263d beccffffff                     mov        esi, 0xffffffcc
02642 4c89b424d0000000               mov        qword ptr [rsp + 0xd0], r14
0264a 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02652 899c24dc000000                 mov        dword ptr [rsp + 0xdc], ebx
02659 44891c24                       mov        dword ptr [rsp], r11d
0265d 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02662 90                             nop        
02663 90                             nop        
02664 c5f877                         vzeroupper 
02667 e874f9afff                     call       0x7f63db6ea760
0266c 0f1f840064270023               nop        dword ptr [rax + rax + 0x23002764]
02674 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0267e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02682 e8f95ab418                     call       0x7f63f4730900
02687 f4                             hlt        
02688 bee4ffffff                     mov        esi, 0xffffffe4
0268d 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02692 448b1c24                       mov        r11d, dword ptr [rsp]
02696 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
0269e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
026a3 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
026ab 448b442408                     mov        r8d, dword ptr [rsp + 8]
026b0 44898424d4000000               mov        dword ptr [rsp + 0xd4], r8d
026b8 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
026bd 4c891c24                       mov        qword ptr [rsp], r11
026c1 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
026c6 44895c2408                     mov        dword ptr [rsp + 8], r11d
026cb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
026d0 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
026d5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
026da 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
026df 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
026e4 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
026e9 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
026ee 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
026f3 4489542440                     mov        dword ptr [rsp + 0x40], r10d
026f8 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
026fd 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02702 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02707 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0270c 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02711 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02716 90                             nop        
02717 90                             nop        
02718 c5f877                         vzeroupper 
0271b e8c0f8afff                     call       0x7f63db6ea760
02720 0f1f840018280024               nop        dword ptr [rax + rax + 0x24002818]
02728 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02732 4883e4f0                       and        rsp, 0xfffffffffffffff0
02736 e8455ab418                     call       0x7f63f4730900
0273b f4                             hlt        
0273c bee4ffffff                     mov        esi, 0xffffffe4
02741 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02746 448b0424                       mov        r8d, dword ptr [rsp]
0274a 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
02752 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02757 4c899c24d8000000               mov        qword ptr [rsp + 0xd8], r11
0275f 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02764 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
0276c 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02771 4c891c24                       mov        qword ptr [rsp], r11
02775 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0277a 4489442408                     mov        dword ptr [rsp + 8], r8d
0277f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02784 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02789 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0278e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02793 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02798 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0279d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
027a2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
027a7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
027ac 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
027b1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
027b6 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027bb 4c89542448                     mov        qword ptr [rsp + 0x48], r10
027c0 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
027c5 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
027ca 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
027cf 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
027d4 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
027d9 90                             nop        
027da 90                             nop        
027db 90                             nop        
027dc c5f877                         vzeroupper 
027df e8fcf7afff                     call       0x7f63db6ea760
027e4 0f1f8400dc280025               nop        dword ptr [rax + rax + 0x250028dc]
027ec 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
027f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
027fa e88159b418                     call       0x7f63f4730900
027ff f4                             hlt        
02800 4183c208                       add        r10d, 8
02804 be6effffff                     mov        esi, 0xffffff6e
02809 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0280e 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
02816 448b0424                       mov        r8d, dword ptr [rsp]
0281a 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
02822 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02827 4c891c24                       mov        qword ptr [rsp], r11
0282b 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02830 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02838 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
0283d 4c895c2408                     mov        qword ptr [rsp + 8], r11
02842 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
02847 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0284c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02851 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02856 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0285b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02860 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02865 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0286a 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
02872 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02877 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0287c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02881 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02886 90                             nop        
02887 90                             nop        
02888 c5f877                         vzeroupper 
0288b e850f7afff                     call       0x7f63db6ea760
02890 0f1f840088290026               nop        dword ptr [rax + rax + 0x26002988]
02898 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
028a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
028a6 e8d558b418                     call       0x7f63f4730900
028ab f4                             hlt        
028ac 4183c208                       add        r10d, 8
028b0 beb6ffffff                     mov        esi, 0xffffffb6
028b5 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
028ba 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
028c2 448b0424                       mov        r8d, dword ptr [rsp]
028c6 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
028ce 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
028d3 4c891c24                       mov        qword ptr [rsp], r11
028d7 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
028dc 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
028e4 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
028e9 4c895c2408                     mov        qword ptr [rsp + 8], r11
028ee 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
028f3 4489442410                     mov        dword ptr [rsp + 0x10], r8d
028f8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
028fd 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02902 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02907 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0290c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
02911 4489442424                     mov        dword ptr [rsp + 0x24], r8d
02916 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
0291e 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02923 4489442434                     mov        dword ptr [rsp + 0x34], r8d
02928 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0292d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02932 90                             nop        
02933 90                             nop        
02934 c5f877                         vzeroupper 
02937 e8a4f6afff                     call       0x7f63db6ea760
0293c 0f1f8400342a0027               nop        dword ptr [rax + rax + 0x27002a34]
02944 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
0294e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02952 e82958b418                     call       0x7f63f4730900
02957 f4                             hlt        
02958 4183c208                       add        r10d, 8
0295c be66ffffff                     mov        esi, 0xffffff66
02961 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02966 4c899c24d0000000               mov        qword ptr [rsp + 0xd0], r11
0296e 448b0424                       mov        r8d, dword ptr [rsp]
02972 44898424d8000000               mov        dword ptr [rsp + 0xd8], r8d
0297a 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0297f 4c891c24                       mov        qword ptr [rsp], r11
02983 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02988 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02990 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02995 4c895c2408                     mov        qword ptr [rsp + 8], r11
0299a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0299f 4489442410                     mov        dword ptr [rsp + 0x10], r8d
029a4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
029a9 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
029ae 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
029b3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
029b8 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
029bd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
029c2 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
029ca 4489542430                     mov        dword ptr [rsp + 0x30], r10d
029cf 4489442434                     mov        dword ptr [rsp + 0x34], r8d
029d4 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
029d9 4c89542440                     mov        qword ptr [rsp + 0x40], r10
029de 90                             nop        
029df 90                             nop        
029e0 c5f877                         vzeroupper 
029e3 e8f8f5afff                     call       0x7f63db6ea760
029e8 0f1f8400e02a0028               nop        dword ptr [rax + rax + 0x28002ae0]
029f0 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
029fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
029fe e87d57b418                     call       0x7f63f4730900
02a03 f4                             hlt        
02a04 418bcb                         mov        ecx, r11d
02a07 e9f5e7ffff                     jmp        0x7f63dbbe9981
02a0c 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a1a e86157b418                     call       0x7f63f4730900
02a1f f4                             hlt        
02a20 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02a2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a2e e84d57b418                     call       0x7f63f4730900
02a33 f4                             hlt        
02a34 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02a3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a42 e83957b418                     call       0x7f63f4730900
02a47 f4                             hlt        
02a48 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02a52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a56 e82557b418                     call       0x7f63f4730900
02a5b f4                             hlt        
02a5c bee4ffffff                     mov        esi, 0xffffffe4
02a61 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02a66 448b1c24                       mov        r11d, dword ptr [rsp]
02a6a 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02a72 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a77 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02a7f 448b542408                     mov        r10d, dword ptr [rsp + 8]
02a84 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02a8c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02a91 4c891424                       mov        qword ptr [rsp], r10
02a95 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02a9a 44895c2408                     mov        dword ptr [rsp + 8], r11d
02a9f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02aa4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02aa9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02aae 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02ab3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02ab8 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
02abd 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02ac2 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02ac7 448974243c                     mov        dword ptr [rsp + 0x3c], r14d
02acc 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02ad1 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02ad6 90                             nop        
02ad7 90                             nop        
02ad8 c5f877                         vzeroupper 
02adb e800f5afff                     call       0x7f63db6ea760
02ae0 0f1f8400d82b0029               nop        dword ptr [rax + rax + 0x29002bd8]
02ae8 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02af2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02af6 e88556b418                     call       0x7f63f4730900
02afb f4                             hlt        
02afc bee4ffffff                     mov        esi, 0xffffffe4
02b01 498bea                         mov        rbp, r10
02b04 448b1c24                       mov        r11d, dword ptr [rsp]
02b08 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
02b10 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b15 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02b1d 448b542408                     mov        r10d, dword ptr [rsp + 8]
02b22 44899424d4000000               mov        dword ptr [rsp + 0xd4], r10d
02b2a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02b2f 4c891424                       mov        qword ptr [rsp], r10
02b33 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02b38 4489542408                     mov        dword ptr [rsp + 8], r10d
02b3d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b42 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b47 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02b4c 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02b51 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02b56 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
02b5b 44896c2430                     mov        dword ptr [rsp + 0x30], r13d
02b60 4489742438                     mov        dword ptr [rsp + 0x38], r14d
02b65 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
02b6a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02b6f 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02b74 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02b79 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02b7e 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02b83 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02b88 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02b8d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02b92 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02b97 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
02b9d 90                             nop        
02b9e 90                             nop        
02b9f 90                             nop        
02ba0 c5f877                         vzeroupper 
02ba3 e838f4afff                     call       0x7f63db6ea760
02ba8 0f1f8400a02c002a               nop        dword ptr [rax + rax + 0x2a002ca0]
02bb0 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bbe e8bd55b418                     call       0x7f63f4730900
02bc3 f4                             hlt        
02bc4 448b842498000000               mov        r8d, dword ptr [rsp + 0x98]
02bcc beccffffff                     mov        esi, 0xffffffcc
02bd1 488b6c2440                     mov        rbp, qword ptr [rsp + 0x40]
02bd6 448b1424                       mov        r10d, dword ptr [rsp]
02bda 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02be2 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02be7 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
02bef 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02bf4 44899c24d4000000               mov        dword ptr [rsp + 0xd4], r11d
02bfc 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02c01 4c891424                       mov        qword ptr [rsp], r10
02c05 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02c0a 44895c2408                     mov        dword ptr [rsp + 8], r11d
02c0f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c14 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02c19 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02c1e 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02c23 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02c28 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02c2d 4489742434                     mov        dword ptr [rsp + 0x34], r14d
02c32 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02c37 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02c3c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02c41 90                             nop        
02c42 90                             nop        
02c43 90                             nop        
02c44 c5f877                         vzeroupper 
02c47 e894f3afff                     call       0x7f63db6ea760
02c4c 0f1f8400442d002b               nop        dword ptr [rax + rax + 0x2b002d44]
02c54 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02c5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c62 e81955b418                     call       0x7f63f4730900
02c67 f4                             hlt        
02c68 418bee                         mov        ebp, r14d
02c6b 83c510                         add        ebp, 0x10
02c6e be6effffff                     mov        esi, 0xffffff6e
02c73 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c78 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02c80 448b1424                       mov        r10d, dword ptr [rsp]
02c84 44899424d8000000               mov        dword ptr [rsp + 0xd8], r10d
02c8c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02c91 4c891424                       mov        qword ptr [rsp], r10
02c95 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02c9a 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
02ca2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02ca7 4c89542408                     mov        qword ptr [rsp + 8], r10
02cac 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02cb1 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02cb6 4489742414                     mov        dword ptr [rsp + 0x14], r14d
02cbb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02cc0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02cc5 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
02cca 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02ccf 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02cd4 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02cd9 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02cde 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02ce3 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02ce8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ced 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02cf2 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02cf7 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02cfc 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02d01 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02d06 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
02d0a 90                             nop        
02d0b 90                             nop        
02d0c c5f877                         vzeroupper 
02d0f e8ccf2afff                     call       0x7f63db6ea760
02d14 0f1f84000c2e002c               nop        dword ptr [rax + rax + 0x2c002e0c]
02d1c 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02d26 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d2a e85154b418                     call       0x7f63f4730900
02d2f f4                             hlt        
02d30 418bee                         mov        ebp, r14d
02d33 83c510                         add        ebp, 0x10
02d36 be66ffffff                     mov        esi, 0xffffff66
02d3b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d40 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02d48 448b1c24                       mov        r11d, dword ptr [rsp]
02d4c 44899c24d8000000               mov        dword ptr [rsp + 0xd8], r11d
02d54 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02d59 4c891424                       mov        qword ptr [rsp], r10
02d5d 448b542408                     mov        r10d, dword ptr [rsp + 8]
02d62 44899424dc000000               mov        dword ptr [rsp + 0xdc], r10d
02d6a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02d6f 4c89542408                     mov        qword ptr [rsp + 8], r10
02d74 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02d79 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02d7e 4489742414                     mov        dword ptr [rsp + 0x14], r14d
02d83 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d88 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02d8d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
02d92 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02d97 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02d9c 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02da1 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
02da6 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
02dab 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02db0 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02db5 4c89542448                     mov        qword ptr [rsp + 0x48], r10
02dba 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02dbf 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02dc4 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02dc9 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
02dce 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
02dd2 90                             nop        
02dd3 90                             nop        
02dd4 c5f877                         vzeroupper 
02dd7 e804f2afff                     call       0x7f63db6ea760
02ddc 0f1f8400d42e002d               nop        dword ptr [rax + rax + 0x2d002ed4]
02de4 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02dee 4883e4f0                       and        rsp, 0xfffffffffffffff0
02df2 e88953b418                     call       0x7f63f4730900
02df7 f4                             hlt        
02df8 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e06 e87553b418                     call       0x7f63f4730900
02e0b f4                             hlt        
02e0c 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e16 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e1a e86153b418                     call       0x7f63f4730900
02e1f f4                             hlt        
02e20 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e2e e84d53b418                     call       0x7f63f4730900
02e33 f4                             hlt        
02e34 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e42 e83953b418                     call       0x7f63f4730900
02e47 f4                             hlt        
02e48 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e52 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e56 e82553b418                     call       0x7f63f4730900
02e5b f4                             hlt        
02e5c 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e66 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e6a e81153b418                     call       0x7f63f4730900
02e6f f4                             hlt        
02e70 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e7e e8fd52b418                     call       0x7f63f4730900
02e83 f4                             hlt        
02e84 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e92 e8e952b418                     call       0x7f63f4730900
02e97 f4                             hlt        
02e98 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02ea2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ea6 e8d552b418                     call       0x7f63f4730900
02eab f4                             hlt        
02eac 48bf406a1ab4637f0000           movabs     rdi, 0x7f63b41a6a40
02eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02eba e8c152b418                     call       0x7f63f4730900
02ebf f4                             hlt        
02ec0 bef6ffffff                     mov        esi, 0xfffffff6
02ec5 498bee                         mov        rbp, r14
02ec8 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
02ed0 c5f877                         vzeroupper 
02ed3 e808f1afff                     call       0x7f63db6ea760
02ed8 0f1f8400d02f002e               nop        dword ptr [rax + rax + 0x2e002fd0]
02ee0 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02eea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02eee e88d52b418                     call       0x7f63f4730900
02ef3 f4                             hlt        
02ef4 488bf0                         mov        rsi, rax
02ef7 eb0d                           jmp        0x7f63dbbeb686
02ef9 488bf0                         mov        rsi, rax
02efc eb08                           jmp        0x7f63dbbeb686
02efe 488bf0                         mov        rsi, rax
02f01 eb03                           jmp        0x7f63dbbeb686
02f03 488bf0                         mov        rsi, rax
02f06 c5f877                         vzeroupper 
02f09 4881c4c0000000                 add        rsp, 0xc0
02f10 5d                             pop        rbp
02f11 e9ca78afff                     jmp        0x7f63db6e2f60
02f16 bef6ffffff                     mov        esi, 0xfffffff6
02f1b 90                             nop        
02f1c c5f877                         vzeroupper 
02f1f e8bcf0afff                     call       0x7f63db6ea760
02f24 0f1f84001c30002f               nop        dword ptr [rax + rax + 0x2f00301c]
02f2c 48bf206743b4637f0000           movabs     rdi, 0x7f63b4436720
02f36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f3a e84152b418                     call       0x7f63f4730900
02f3f f4                             hlt        
02f40 49ba6694bedb637f0000           movabs     r10, 0x7f63dbbe9466
02f4a 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
02f51 e98aacb5ff                     jmp        0x7f63db746360
02f56 e8057bb4ff                     call       0x7f63db7331e0
02f5b e9ded0ffff                     jmp        0x7f63dbbe87be
