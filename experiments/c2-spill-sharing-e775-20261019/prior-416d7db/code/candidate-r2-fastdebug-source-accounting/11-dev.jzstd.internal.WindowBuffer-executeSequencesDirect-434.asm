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
0001a 0f8540b1b4ff                   jne        0x7f63db742d60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ece0000000                 sub        rsp, 0xe0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8584330000                   jne        0x7f63dbbfafc2
0003e 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 498bc0                         mov        rax, r8
00049 4c8bda                         mov        r11, rdx
0004c 4889742408                     mov        qword ptr [rsp + 8], rsi
00051 448b563c                       mov        r10d, dword ptr [rsi + 0x3c]
00055 448b4638                       mov        r8d, dword ptr [rsi + 0x38]
00059 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0005e 452bc2                         sub        r8d, r10d
00061 8b8c24f0000000                 mov        ecx, dword ptr [rsp + 0xf0]
00068 413bc8                         cmp        ecx, r8d
0006b 0f8f03290000                   jg         0x7f63dbbfa574
00071 4c8b4608                       mov        r8, qword ptr [rsi + 8]
00075 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0007a 4c8b4620                       mov        r8, qword ptr [rsi + 0x20]
0007e 48638c24f0000000               movsxd     rcx, dword ptr [rsp + 0xf0]
00086 4d63ca                         movsxd     r9, r10d
00089 4c034c2430                     add        r9, qword ptr [rsp + 0x30]
0008e 4d2bc1                         sub        r8, r9
00091 493bc8                         cmp        rcx, r8
00094 0f8fda280000                   jg         0x7f63dbbfa574
0009a 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
0009e 4c89442448                     mov        qword ptr [rsp + 0x48], r8
000a3 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000a7 4d85c0                         test       r8, r8
000aa 0f84d5140000                   je         0x7f63dbbf9185
000b0 33d2                           xor        edx, edx
000b2 4d8bf3                         mov        r14, r11
000b5 418b7308                       mov        esi, dword ptr [r11 + 8]
000b9 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
000be 418b5b44                       mov        ebx, dword ptr [r11 + 0x44]
000c2 448bef                         mov        r13d, edi
000c5 85ff                           test       edi, edi
000c7 0f8ec3210000                   jle        0x7f63dbbf9e90
000cd 44899424a8000000               mov        dword ptr [rsp + 0xa8], r10d
000d5 4c2b442430                     sub        r8, qword ptr [rsp + 0x30]
000da 448d4ee0                       lea        r9d, [rsi - 0x20]
000de 8b4c242c                       mov        ecx, dword ptr [rsp + 0x2c]
000e2 83c1e0                         add        ecx, -0x20
000e5 4c8bd8                         mov        r11, rax
000e8 458b5308                       mov        r10d, dword ptr [r11 + 8]
000ec 4585d2                         test       r10d, r10d
000ef 0f86ab280000                   jbe        0x7f63dbbfa5a0
000f5 4d63d2                         movsxd     r10, r10d
000f8 4863ff                         movsxd     rdi, edi
000fb 48ffcf                         dec        rdi
000fe 493bfa                         cmp        rdi, r10
00101 0f8399280000                   jae        0x7f63dbbfa5a0
00107 488b8424f8000000               mov        rax, qword ptr [rsp + 0xf8]
0010f 8b7808                         mov        edi, dword ptr [rax + 8]
00112 85ff                           test       edi, edi
00114 0f8602290000                   jbe        0x7f63dbbfa61c
0011a 83ff01                         cmp        edi, 1
0011d 0f86f9280000                   jbe        0x7f63dbbfa61c
00123 83ff02                         cmp        edi, 2
00126 0f86f0280000                   jbe        0x7f63dbbfa61c
0012c 448d56f1                       lea        r10d, [rsi - 0xf]
00130 4585d2                         test       r10d, r10d
00133 0f8ce3280000                   jl         0x7f63dbbfa61c
00139 8b6b08                         mov        ebp, dword ptr [rbx + 8]
0013c 448d55f1                       lea        r10d, [rbp - 0xf]
00140 4585d2                         test       r10d, r10d
00143 0f8cd3280000                   jl         0x7f63dbbfa61c
00149 448d55f9                       lea        r10d, [rbp - 7]
0014d 4585d2                         test       r10d, r10d
00150 0f8cc6280000                   jl         0x7f63dbbfa61c
00156 89ac24f8000000                 mov        dword ptr [rsp + 0xf8], ebp
0015d 89bc24f4000000                 mov        dword ptr [rsp + 0xf4], edi
00164 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00168 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0016d 89b424f0000000                 mov        dword ptr [rsp + 0xf0], esi
00174 89542438                       mov        dword ptr [rsp + 0x38], edx
00178 4c89442440                     mov        qword ptr [rsp + 0x40], r8
0017d 4889442458                     mov        qword ptr [rsp + 0x58], rax
00182 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00187 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
0018c 4c89742468                     mov        qword ptr [rsp + 0x68], r14
00191 4c8bd3                         mov        r10, rbx
00194 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00199 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0019d 448bd5                         mov        r10d, ebp
001a0 448bc6                         mov        r8d, esi
001a3 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
001ab 4d63da                         movsxd     r11, r10d
001ae 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
001b3 458d58f1                       lea        r11d, [r8 - 0xf]
001b7 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
001bc 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
001c1 4983c3f9                       add        r11, -7
001c5 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
001cd 458d42f9                       lea        r8d, [r10 - 7]
001d1 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
001d9 4183c2f1                       add        r10d, -0xf
001dd 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
001e5 4533f6                         xor        r14d, r14d
001e8 4533c0                         xor        r8d, r8d
001eb e94b040000                     jmp        0x7f63dbbf823b
001f0 448bd3                         mov        r10d, ebx
001f3 4d63d2                         movsxd     r10, r10d
001f6 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001fd c442a8f5db                     bzhi       r11, r11, r10
00202 c4c1fb92fb                     kmovq      k7, r11
00207 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0020d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00213 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0021b 4403d3                         add        r10d, ebx
0021e 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
00226 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0022a 418502                         test       dword ptr [r10], eax
0022d 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00235 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
0023d 0f8d450a0000                   jge        0x7f63dbbf8888
00243 418bee                         mov        ebp, r14d
00246 448bc5                         mov        r8d, ebp
00249 442b842498000000               sub        r8d, dword ptr [rsp + 0x98]
00251 8b9c2490000000                 mov        ebx, dword ptr [rsp + 0x90]
00258 2b9c2498000000                 sub        ebx, dword ptr [rsp + 0x98]
0025f 3b9c2498000000                 cmp        ebx, dword ptr [rsp + 0x98]
00266 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0026e 410f4fda                       cmovg      ebx, r10d
00272 4585c0                         test       r8d, r8d
00275 0f8c511b0000                   jl         0x7f63dbbf99cc
0027b 85ed                           test       ebp, ebp
0027d 0f8c491b0000                   jl         0x7f63dbbf99cc
00283 468d1403                       lea        r10d, [rbx + r8]
00287 448b8c24f8000000               mov        r9d, dword ptr [rsp + 0xf8]
0028f 453bca                         cmp        r9d, r10d
00292 0f82341b0000                   jb         0x7f63dbbf99cc
00298 448d342b                       lea        r14d, [rbx + rbp]
0029c 453bce                         cmp        r9d, r14d
0029f 0f82271b0000                   jb         0x7f63dbbf99cc
002a5 85db                           test       ebx, ebx
002a7 0f8c1f1b0000                   jl         0x7f63dbbf99cc
002ad 85db                           test       ebx, ebx
002af 0f845effffff                   je         0x7f63dbbf7e13
002b5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
002ba 498d742b0c                     lea        rsi, [r11 + rbp + 0xc]
002bf 4b8d7c030c                     lea        rdi, [r11 + r8 + 0xc]
002c4 4863d3                         movsxd     rdx, ebx
002c7 4883fa20                       cmp        rdx, 0x20
002cb 0f861fffffff                   jbe        0x7f63dbbf7df0
002d1 c5f877                         vzeroupper 
002d4 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
002de 41ffd2                         call       r10
002e1 0f1f840000000000               nop        dword ptr [rax + rax]
002e9 e925ffffff                     jmp        0x7f63dbbf7e13
002ee 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
002f6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
002fb c4817a7f44030c                 vmovdqu    xmmword ptr [r11 + r8 + 0xc], xmm0
00302 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
0030a 4503d8                         add        r11d, r8d
0030d e903030000                     jmp        0x7f63dbbf8215
00312 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00317 4b8d7c2a0c                     lea        rdi, [r10 + r13 + 0xc]
0031c 448b842494000000               mov        r8d, dword ptr [rsp + 0x94]
00324 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
00329 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00331 44039c2494000000               add        r11d, dword ptr [rsp + 0x94]
00339 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00341 4d63cb                         movsxd     r9, r11d
00344 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
0034c 443b942490000000               cmp        r10d, dword ptr [rsp + 0x90]
00354 0f8cf3060000                   jl         0x7f63dbbf864d
0035a 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00362 4183fb30                       cmp        r11d, 0x30
00366 0f8e93000000                   jle        0x7f63dbbf7fff
0036c 4585ed                         test       r13d, r13d
0036f 0f8cff1a0000                   jl         0x7f63dbbf9a74
00375 4585c0                         test       r8d, r8d
00378 0f8cf61a0000                   jl         0x7f63dbbf9a74
0037e 4503dd                         add        r11d, r13d
00381 448b8424f8000000               mov        r8d, dword ptr [rsp + 0xf8]
00389 453bc3                         cmp        r8d, r11d
0038c 0f82e21a0000                   jb         0x7f63dbbf9a74
00392 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
0039a 0f82d41a0000                   jb         0x7f63dbbf9a74
003a0 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
003a8 4585d2                         test       r10d, r10d
003ab 0f8454020000                   je         0x7f63dbbf8205
003b1 4963d2                         movsxd     rdx, r10d
003b4 4883fa20                       cmp        rdx, 0x20
003b8 7728                           ja         0x7f63dbbf7fe2
003ba 458bda                         mov        r11d, r10d
003bd 4d63d3                         movsxd     r10, r11d
003c0 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
003c7 c442a8f5db                     bzhi       r11, r11, r10
003cc c4c1fb92fb                     kmovq      k7, r11
003d1 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
003d7 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
003dd e923020000                     jmp        0x7f63dbbf8205
003e2 c5f877                         vzeroupper 
003e5 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
003ef 41ffd2                         call       r10
003f2 0f1f840000000000               nop        dword ptr [rax + rax]
003fa e906020000                     jmp        0x7f63dbbf8205
003ff 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
00407 0f8347160000                   jae        0x7f63dbbf9654
0040d 4963fd                         movsxd     rdi, r13d
00410 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00415 4d8b443a0c                     mov        r8, qword ptr [r10 + rdi + 0xc]
0041a 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00422 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
0042a 0f83e0160000                   jae        0x7f63dbbf9710
00430 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
00437 8d4b08                         lea        ecx, [rbx + 8]
0043a 4c63db                         movsxd     r11, ebx
0043d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00442 4f89441a0c                     mov        qword ptr [r10 + r11 + 0xc], r8
00447 3b8c24a8000000                 cmp        ecx, dword ptr [rsp + 0xa8]
0044e 0f8db1010000                   jge        0x7f63dbbf8205
00454 492bfb                         sub        rdi, r11
00457 4c63d9                         movsxd     r11, ecx
0045a 4d8d143b                       lea        r10, [r11 + rdi]
0045e 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
00466 0f8368170000                   jae        0x7f63dbbf97d4
0046c 4d8bd1                         mov        r10, r9
0046f 4d2bd3                         sub        r10, r11
00472 4983c207                       add        r10, 7
00476 4983e2f8                       and        r10, 0xfffffffffffffff8
0047a 458bd2                         mov        r10d, r10d
0047d 458d5c1a08                     lea        r11d, [r10 + rbx + 8]
00482 4d63d3                         movsxd     r10, r11d
00485 4d8d5c3af8                     lea        r11, [r10 + rdi - 8]
0048a 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00492 0f833c170000                   jae        0x7f63dbbf97d4
00498 3b8c2488000000                 cmp        ecx, dword ptr [rsp + 0x88]
0049f 0f832f170000                   jae        0x7f63dbbf97d4
004a5 4983c2f8                       add        r10, -8
004a9 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
004b1 0f831d170000                   jae        0x7f63dbbf97d4
004b7 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
004bf 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
004c6 0f8fc8170000                   jg         0x7f63dbbf9894
004cc 442beb                         sub        r13d, ebx
004cf 83c310                         add        ebx, 0x10
004d2 468d1429                       lea        r10d, [rcx + r13]
004d6 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
004db 4f8b44100c                     mov        r8, qword ptr [r8 + r10 + 0xc]
004e0 448bd1                         mov        r10d, ecx
004e3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
004e8 4f8944130c                     mov        qword ptr [r11 + r10 + 0xc], r8
004ed 448d5108                       lea        r10d, [rcx + 8]
004f1 443bd3                         cmp        r10d, ebx
004f4 7d05                           jge        0x7f63dbbf80fb
004f6 418bca                         mov        ecx, r10d
004f9 ebd7                           jmp        0x7f63dbbf80d2
004fb 4983c1f8                       add        r9, -8
004ff 4981f900000080                 cmp        r9, -0x80000000
00506 49c7c300000080                 mov        r11, 0xffffffff80000000
0050d 4d0f4ccb                       cmovl      r9, r11
00511 458bc1                         mov        r8d, r9d
00514 453bd0                         cmp        r10d, r8d
00517 0f8d91000000                   jge        0x7f63dbbf81ae
0051d 4d63da                         movsxd     r11, r10d
00520 4c03df                         add        r11, rdi
00523 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
0052b 0f8323180000                   jae        0x7f63dbbf9954
00531 83c110                         add        ecx, 0x10
00534 4c63d9                         movsxd     r11, ecx
00537 4c03df                         add        r11, rdi
0053a 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
00542 0f8320180000                   jae        0x7f63dbbf9968
00548 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
00550 0f8326180000                   jae        0x7f63dbbf997c
00556 3b8c2488000000                 cmp        ecx, dword ptr [rsp + 0x88]
0055d 0f832d180000                   jae        0x7f63dbbf9990
00563 90                             nop        
00564 90                             nop        
00565 90                             nop        
00566 90                             nop        
00567 90                             nop        
00568 90                             nop        
00569 90                             nop        
0056a 90                             nop        
0056b 90                             nop        
0056c 90                             nop        
0056d 90                             nop        
0056e 90                             nop        
0056f 90                             nop        
00570 478d0c2a                       lea        r9d, [r10 + r13]
00574 458bda                         mov        r11d, r10d
00577 4963cb                         movsxd     rcx, r11d
0057a 458bd9                         mov        r11d, r9d
0057d 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00581 4a8b5c1b0c                     mov        rbx, qword ptr [rbx + r11 + 0xc]
00586 4963d1                         movsxd     rdx, r9d
00589 458bda                         mov        r11d, r10d
0058c 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00591 4b895c190c                     mov        qword ptr [r9 + r11 + 0xc], rbx
00596 4d8b4c1114                     mov        r9, qword ptr [r9 + rdx + 0x14]
0059b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
005a0 4d894c0b14                     mov        qword ptr [r11 + rcx + 0x14], r9
005a5 4183c210                       add        r10d, 0x10
005a9 453bd0                         cmp        r10d, r8d
005ac 7cc2                           jl         0x7f63dbbf8170
005ae 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
005b6 7d4d                           jge        0x7f63dbbf8205
005b8 4d63da                         movsxd     r11, r10d
005bb 4c03df                         add        r11, rdi
005be 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
005c6 0f83d8170000                   jae        0x7f63dbbf99a4
005cc 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
005d4 0f83de170000                   jae        0x7f63dbbf99b8
005da 90                             nop        
005db 90                             nop        
005dc 478d042a                       lea        r8d, [r10 + r13]
005e0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
005e5 4f8b44030c                     mov        r8, qword ptr [r11 + r8 + 0xc]
005ea 458bda                         mov        r11d, r10d
005ed 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
005f2 4f8944190c                     mov        qword ptr [r9 + r11 + 0xc], r8
005f7 4183c208                       add        r10d, 8
005fb 443b9424a8000000               cmp        r10d, dword ptr [rsp + 0xa8]
00603 7cd7                           jl         0x7f63dbbf81dc
00605 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0060d 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
00615 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0061d 41ffc0                         inc        r8d
00620 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00625 0f8d28080000                   jge        0x7f63dbbf8a53
0062b 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
00633 448bb4249c000000               mov        r14d, dword ptr [rsp + 0x9c]
0063b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00640 4f8b5cc210                     mov        r11, qword ptr [r10 + r8*8 + 0x10]
00645 4d8bd3                         mov        r10, r11
00648 49c1ea12                       shr        r10, 0x12
0064c 458bd2                         mov        r10d, r10d
0064f 4181e2ffff0300                 and        r10d, 0x3ffff
00656 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
0065e 458bd3                         mov        r10d, r11d
00661 49c1fb24                       sar        r11, 0x24
00665 4181e2ffff0100                 and        r10d, 0x1ffff
0066c 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00674 458bd3                         mov        r10d, r11d
00677 458bca                         mov        r9d, r10d
0067a 4585d2                         test       r10d, r10d
0067d 0f8c61110000                   jl         0x7f63dbbf93e4
00683 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
0068b 4585db                         test       r11d, r11d
0068e 0f858c020000                   jne        0x7f63dbbf8520
00694 4533d2                         xor        r10d, r10d
00697 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
0069f 458bd1                         mov        r10d, r9d
006a2 4183fa03                       cmp        r10d, 3
006a6 0f8ee1020000                   jle        0x7f63dbbf858d
006ac 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
006b1 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
006b5 45895a14                       mov        dword ptr [r10 + 0x14], r11d
006b9 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
006bd 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
006c2 45895310                       mov        dword ptr [r11 + 0x10], r10d
006c6 458d51fd                       lea        r10d, [r9 - 3]
006ca 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
006d2 4d8bd3                         mov        r10, r11
006d5 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
006dd 45895a0c                       mov        dword ptr [r10 + 0xc], r11d
006e1 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
006e9 48639c2498000000               movsxd     rbx, dword ptr [rsp + 0x98]
006f1 48899c24a0000000               mov        qword ptr [rsp + 0xa0], rbx
006f9 4c638424a8000000               movsxd     r8, dword ptr [rsp + 0xa8]
00701 4c03442430                     add        r8, qword ptr [rsp + 0x30]
00706 4863942494000000               movsxd     rdx, dword ptr [rsp + 0x94]
0070e 4c03c2                         add        r8, rdx
00711 488beb                         mov        rbp, rbx
00714 493bd8                         cmp        rbx, r8
00717 0f8f6f110000                   jg         0x7f63dbbf948c
0071d 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
00724 039c2494000000                 add        ebx, dword ptr [rsp + 0x94]
0072b 448beb                         mov        r13d, ebx
0072e 442bac2498000000               sub        r13d, dword ptr [rsp + 0x98]
00736 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0073b 4585db                         test       r11d, r11d
0073e 0f8420020000                   je         0x7f63dbbf8564
00744 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
0074c 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00754 4585d2                         test       r10d, r10d
00757 0f8e4f100000                   jle        0x7f63dbbf93ac
0075d 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00765 4403db                         add        r11d, ebx
00768 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
0076d 0f8fa1110000                   jg         0x7f63dbbf9514
00773 458bd6                         mov        r10d, r14d
00776 4403942494000000               add        r10d, dword ptr [rsp + 0x94]
0077e 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00786 443b542460                     cmp        r10d, dword ptr [rsp + 0x60]
0078b 0f8f2f120000                   jg         0x7f63dbbf95c0
00791 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00799 4183fa10                       cmp        r10d, 0x10
0079d 0f8ff2040000                   jg         0x7f63dbbf8895
007a3 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
007a8 0f83f60d0000                   jae        0x7f63dbbf91a4
007ae 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
007b3 c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
007ba 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
007c2 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
007ca 0f83880e0000                   jae        0x7f63dbbf9258
007d0 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
007d8 4503de                         add        r11d, r14d
007db 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
007e3 448b742470                     mov        r14d, dword ptr [rsp + 0x70]
007e8 c4817a7f44160c                 vmovdqu    xmmword ptr [r14 + r10 + 0xc], xmm0
007ef 448bb42494000000               mov        r14d, dword ptr [rsp + 0x94]
007f7 4503f2                         add        r14d, r10d
007fa 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
00802 458bee                         mov        r13d, r14d
00805 442bac2498000000               sub        r13d, dword ptr [rsp + 0x98]
0080d 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00815 4183fa10                       cmp        r10d, 0x10
00819 0f8ff3faffff                   jg         0x7f63dbbf7f12
0081f 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00827 4183fb10                       cmp        r11d, 0x10
0082b 0f8ce1faffff                   jl         0x7f63dbbf7f12
00831 443bac248c000000               cmp        r13d, dword ptr [rsp + 0x8c]
00839 0f83d10e0000                   jae        0x7f63dbbf9310
0083f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00844 c4817a6f442a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 0xc]
0084b 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00853 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
0085b 0f828dfaffff                   jb         0x7f63dbbf7eee
00861 bee4ffffff                     mov        esi, 0xffffffe4
00866 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0086b 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00870 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
00878 448b1424                       mov        r10d, dword ptr [rsp]
0087c 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
00884 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00889 4c891424                       mov        qword ptr [rsp], r10
0088d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00892 4c89542408                     mov        qword ptr [rsp + 8], r10
00897 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0089c 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
008a4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
008a9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008ae 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
008b3 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008b8 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
008bd 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008c2 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
008c7 4c89542428                     mov        qword ptr [rsp + 0x28], r10
008cc 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
008d1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
008d6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
008db 4c89542440                     mov        qword ptr [rsp + 0x40], r10
008e0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008e5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
008ea 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008ef 4489542448                     mov        dword ptr [rsp + 0x48], r10d
008f4 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
008fa 90                             nop        
008fb 90                             nop        
008fc c5f877                         vzeroupper 
008ff e85c22afff                     call       0x7f63db6ea760
00904 0f1f8400fc090001               nop        dword ptr [rax + rax + 0x10009fc]
0090c 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
00916 4883e4f0                       and        rsp, 0xfffffffffffffff0
0091a e8e183b318                     call       0x7f63f4730900
0091f f4                             hlt        
00920 448b1424                       mov        r10d, dword ptr [rsp]
00924 452bd6                         sub        r10d, r14d
00927 453bda                         cmp        r11d, r10d
0092a 0f8e6ffdffff                   jle        0x7f63dbbf829f
00930 be45ffffff                     mov        esi, 0xffffff45
00935 418beb                         mov        ebp, r11d
00938 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00940 c5f877                         vzeroupper 
00943 e81822afff                     call       0x7f63db6ea760
00948 0f1f8400400a0002               nop        dword ptr [rax + rax + 0x2000a40]
00950 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0095a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0095e e89d83b318                     call       0x7f63f4730900
00963 f4                             hlt        
00964 4d63d5                         movsxd     r10, r13d
00967 4c3b542440                     cmp        r10, qword ptr [rsp + 0x40]
0096c 0f8cbe150000                   jl         0x7f63dbbf9b30
00972 483b6c2448                     cmp        rbp, qword ptr [rsp + 0x48]
00977 0f8f53160000                   jg         0x7f63dbbf9bd0
0097d 4533db                         xor        r11d, r11d
00980 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
00988 e9bffdffff                     jmp        0x7f63dbbf834c
0098d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00995 4585d2                         test       r10d, r10d
00998 7407                           je         0x7f63dbbf85a1
0099a 458d51ff                       lea        r10d, [r9 - 1]
0099e 458bca                         mov        r9d, r10d
009a1 4585c9                         test       r9d, r9d
009a4 7516                           jne        0x7f63dbbf85bc
009a6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
009ab 418b4a0c                       mov        ecx, dword ptr [r10 + 0xc]
009af 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
009b7 e985000000                     jmp        0x7f63dbbf8641
009bc 4183f903                       cmp        r9d, 3
009c0 0f84a2190000                   je         0x7f63dbbf9f68
009c6 4183f902                       cmp        r9d, 2
009ca 0f87481a0000                   ja         0x7f63dbbfa018
009d0 443b8c24f4000000               cmp        r9d, dword ptr [rsp + 0xf4]
009d8 0f83eb170000                   jae        0x7f63dbbf9dc9
009de 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
009e3 438b4c8b0c                     mov        ecx, dword ptr [r11 + r9*4 + 0xc]
009e8 4585c9                         test       r9d, r9d
009eb 7e43                           jle        0x7f63dbbf8630
009ed 458d51ff                       lea        r10d, [r9 - 1]
009f1 443b9424f4000000               cmp        r10d, dword ptr [rsp + 0xf4]
009f9 0f83a8180000                   jae        0x7f63dbbf9ea7
009ff 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00a07 90                             nop        
00a08 90                             nop        
00a09 90                             nop        
00a0a 90                             nop        
00a0b 90                             nop        
00a0c 90                             nop        
00a0d 90                             nop        
00a0e 90                             nop        
00a0f 90                             nop        
00a10 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
00a15 478b548b08                     mov        r10d, dword ptr [r11 + r9*4 + 8]
00a1a 4d8bc3                         mov        r8, r11
00a1d 478954880c                     mov        dword ptr [r8 + r9*4 + 0xc], r10d
00a22 458d51ff                       lea        r10d, [r9 - 1]
00a26 458bca                         mov        r9d, r10d
00a29 4585d2                         test       r10d, r10d
00a2c 7fe2                           jg         0x7f63dbbf8610
00a2e eb08                           jmp        0x7f63dbbf8638
00a30 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00a38 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
00a3d 41894a0c                       mov        dword ptr [r10 + 0xc], ecx
00a41 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
00a48 e99cfcffff                     jmp        0x7f63dbbf82e9
00a4d 4183fa10                       cmp        r10d, 0x10
00a51 0f8d891e0000                   jge        0x7f63dbbfa4e0
00a57 4183fa08                       cmp        r10d, 8
00a5b 0f8d1e070000                   jge        0x7f63dbbf8d7f
00a61 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00a69 4183fa10                       cmp        r10d, 0x10
00a6d 0f8eac000000                   jle        0x7f63dbbf871f
00a73 4585ed                         test       r13d, r13d
00a76 0f8ca81d0000                   jl         0x7f63dbbfa424
00a7c 4585c0                         test       r8d, r8d
00a7f 0f8c9f1d0000                   jl         0x7f63dbbfa424
00a85 448b9424f8000000               mov        r10d, dword ptr [rsp + 0xf8]
00a8d 443b942494000000               cmp        r10d, dword ptr [rsp + 0x94]
00a95 0f82891d0000                   jb         0x7f63dbbfa424
00a9b 8bac2498000000                 mov        ebp, dword ptr [rsp + 0x98]
00aa2 03ac2494000000                 add        ebp, dword ptr [rsp + 0x94]
00aa9 443bd5                         cmp        r10d, ebp
00aac 0f82721d0000                   jb         0x7f63dbbfa424
00ab2 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00aba 4585db                         test       r11d, r11d
00abd 0f8c611d0000                   jl         0x7f63dbbfa424
00ac3 4585db                         test       r11d, r11d
00ac6 0f847af7ffff                   je         0x7f63dbbf7e46
00acc 488b9c24a0000000               mov        rbx, qword ptr [rsp + 0xa0]
00ad4 4883fb20                       cmp        rbx, 0x20
00ad8 7725                           ja         0x7f63dbbf86ff
00ada 4d63d3                         movsxd     r10, r11d
00add 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00ae4 c442a8f5db                     bzhi       r11, r11, r10
00ae9 c4c1fb92fb                     kmovq      k7, r11
00aee 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00af4 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00afa e947f7ffff                     jmp        0x7f63dbbf7e46
00aff 488bd3                         mov        rdx, rbx
00b02 c5f877                         vzeroupper 
00b05 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00b0f 41ffd2                         call       r10
00b12 0f1f840000000000               nop        dword ptr [rax + rax]
00b1a e927f7ffff                     jmp        0x7f63dbbf7e46
00b1f 443bac24f8000000               cmp        r13d, dword ptr [rsp + 0xf8]
00b27 0f839b190000                   jae        0x7f63dbbfa0c8
00b2d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00b32 430fbe6c2b0c                   movsx      ebp, byte ptr [r11 + r13 + 0xc]
00b38 443b8424f8000000               cmp        r8d, dword ptr [rsp + 0xf8]
00b40 0f833e1a0000                   jae        0x7f63dbbfa184
00b46 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00b4b 43886c020c                     mov        byte ptr [r10 + r8 + 0xc], bpl
00b50 41ffc0                         inc        r8d
00b53 458d5d03                       lea        r11d, [r13 + 3]
00b57 443b9c24f8000000               cmp        r11d, dword ptr [rsp + 0xf8]
00b5f 0f83c31a0000                   jae        0x7f63dbbfa228
00b65 4d63cd                         movsxd     r9, r13d
00b68 430fbe6c0a0d                   movsx      ebp, byte ptr [r10 + r9 + 0xd]
00b6e 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00b76 4183c303                       add        r11d, 3
00b7a 443b9c24f8000000               cmp        r11d, dword ptr [rsp + 0xf8]
00b82 0f834c1b0000                   jae        0x7f63dbbfa2d4
00b88 4c63842494000000               movsxd     r8, dword ptr [rsp + 0x94]
00b90 43886c020d                     mov        byte ptr [r10 + r8 + 0xd], bpl
00b95 470fbe5c0a0e                   movsx      r11d, byte ptr [r10 + r9 + 0xe]
00b9b 47885c020e                     mov        byte ptr [r10 + r8 + 0xe], r11b
00ba0 470fbe5c0a0f                   movsx      r11d, byte ptr [r10 + r9 + 0xf]
00ba6 47885c020f                     mov        byte ptr [r10 + r8 + 0xf], r11b
00bab 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
00bb3 4183fa08                       cmp        r10d, 8
00bb7 0f83bf1b0000                   jae        0x7f63dbbfa37c
00bbd 49bbf0ef2fe300000000           movabs     r11, 0xe32feff0
00bc7 47036c930c                     add        r13d, dword ptr [r11 + r10*4 + 0xc]
00bcc 44896c2404                     mov        dword ptr [rsp + 4], r13d
00bd1 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00bd9 4183fb04                       cmp        r11d, 4
00bdd 7e41                           jle        0x7f63dbbf8820
00bdf 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00be6 83c504                         add        ebp, 4
00be9 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00bee 418bd5                         mov        edx, r13d
00bf1 90                             nop        
00bf2 90                             nop        
00bf3 90                             nop        
00bf4 c5f877                         vzeroupper 
00bf7 e864b4b4ff                     call       0x7f63db743c60
00bfc 0f1f8400f40c0003               nop        dword ptr [rax + rax + 0x3000cf4]
00c04 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c09 8bd5                           mov        edx, ebp
00c0b 8bc8                           mov        ecx, eax
00c0d 488bee                         mov        rbp, rsi
00c10 c5f877                         vzeroupper 
00c13 e848b4b4ff                     call       0x7f63db743c60
00c18 0f1f8400100d0004               nop        dword ptr [rax + rax + 0x4000d10]
00c20 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00c28 4183fb08                       cmp        r11d, 8
00c2c 7e5a                           jle        0x7f63dbbf8888
00c2e 8b542404                       mov        edx, dword ptr [rsp + 4]
00c32 49ba20f02fe300000000           movabs     r10, 0xe32ff020
00c3c 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
00c44 432b549a0c                     sub        edx, dword ptr [r10 + r11*4 + 0xc]
00c49 8bac2494000000                 mov        ebp, dword ptr [rsp + 0x94]
00c50 83c508                         add        ebp, 8
00c53 83c208                         add        edx, 8
00c56 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c5b 90                             nop        
00c5c c5f877                         vzeroupper 
00c5f e8fcb3b4ff                     call       0x7f63db743c60
00c64 0f1f84005c0d0005               nop        dword ptr [rax + rax + 0x5000d5c]
00c6c 488b742450                     mov        rsi, qword ptr [rsp + 0x50]
00c71 8bd5                           mov        edx, ebp
00c73 488bc8                         mov        rcx, rax
00c76 90                             nop        
00c77 90                             nop        
00c78 c5f877                         vzeroupper 
00c7b e8e0b3b4ff                     call       0x7f63db743c60
00c80 0f1f8400780d0006               nop        dword ptr [rax + rax + 0x6000d78]
00c88 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00c90 e980f9ffff                     jmp        0x7f63dbbf8215
00c95 4183fa30                       cmp        r10d, 0x30
00c99 0f8eb6000000                   jle        0x7f63dbbf8955
00c9f 4585f6                         test       r14d, r14d
00ca2 0f8cdc1f0000                   jl         0x7f63dbbfa884
00ca8 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
00cb0 4585d2                         test       r10d, r10d
00cb3 0f8cd31f0000                   jl         0x7f63dbbfa88c
00cb9 448b9c24f0000000               mov        r11d, dword ptr [rsp + 0xf0]
00cc1 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00cc9 0f82bd1f0000                   jb         0x7f63dbbfa88c
00ccf 448b8424f8000000               mov        r8d, dword ptr [rsp + 0xf8]
00cd7 443bc3                         cmp        r8d, ebx
00cda 0f82ac1f0000                   jb         0x7f63dbbfa88c
00ce0 448b9c2494000000               mov        r11d, dword ptr [rsp + 0x94]
00ce8 4585db                         test       r11d, r11d
00ceb 7442                           je         0x7f63dbbf892f
00ced 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00cf2 4b8d7c330c                     lea        rdi, [r11 + r14 + 0xc]
00cf7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00cfc 4b8d74100c                     lea        rsi, [r8 + r10 + 0xc]
00d01 4883fa20                       cmp        rdx, 0x20
00d05 7734                           ja         0x7f63dbbf893b
00d07 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
00d0f 4d63d2                         movsxd     r10, r10d
00d12 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d19 c442a8f5db                     bzhi       r11, r11, r10
00d1e c4c1fb92fb                     kmovq      k7, r11
00d23 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d29 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d2f 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00d36 e9d2faffff                     jmp        0x7f63dbbf840d
00d3b c5f877                         vzeroupper 
00d3e 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00d48 41ffd2                         call       r10
00d4b 0f1f840000000000               nop        dword ptr [rax + rax]
00d53 ebda                           jmp        0x7f63dbbf892f
00d55 443b742474                     cmp        r14d, dword ptr [rsp + 0x74]
00d5a 0f83a81d0000                   jae        0x7f63dbbfa708
00d60 4963c6                         movsxd     rax, r14d
00d63 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00d68 c4c17a6f44020c                 vmovdqu    xmm0, xmmword ptr [r10 + rax + 0xc]
00d6f 8bbc24a8000000                 mov        edi, dword ptr [rsp + 0xa8]
00d76 3bbc248c000000                 cmp        edi, dword ptr [rsp + 0x8c]
00d7d 0f833d1e0000                   jae        0x7f63dbbfa7c0
00d83 4c63df                         movsxd     r11, edi
00d86 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00d8b c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00d92 448d5710                       lea        r10d, [rdi + 0x10]
00d96 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00d9e 443bd3                         cmp        r10d, ebx
00da1 0f8db9030000                   jge        0x7f63dbbf8d60
00da7 492bc3                         sub        rax, r11
00daa 4d63da                         movsxd     r11, r10d
00dad 4c638c24fc000000               movsxd     r9, dword ptr [rsp + 0xfc]
00db5 4983c1f1                       add        r9, -0xf
00db9 4d8d0403                       lea        r8, [r11 + rax]
00dbd 4d3bc1                         cmp        r8, r9
00dc0 0f838a1f0000                   jae        0x7f63dbbfa950
00dc6 4863d3                         movsxd     rdx, ebx
00dc9 4c8bc2                         mov        r8, rdx
00dcc 4d2bc3                         sub        r8, r11
00dcf 4983c00f                       add        r8, 0xf
00dd3 4983e0f0                       and        r8, 0xfffffffffffffff0
00dd7 458bd8                         mov        r11d, r8d
00dda 458d5c3b10                     lea        r11d, [r11 + rdi + 0x10]
00ddf 4d63db                         movsxd     r11, r11d
00de2 4d8d4403f0                     lea        r8, [r11 + rax - 0x10]
00de7 4d3bc1                         cmp        r8, r9
00dea 0f83601f0000                   jae        0x7f63dbbfa950
00df0 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00df8 0f83521f0000                   jae        0x7f63dbbfa950
00dfe 4983c3f0                       add        r11, -0x10
00e02 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e07 4983c2f1                       add        r10, -0xf
00e0b 4d3bda                         cmp        r11, r10
00e0e 0f833c1f0000                   jae        0x7f63dbbfa950
00e14 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00e1a 0f8fe81f0000                   jg         0x7f63dbbfaa08
00e20 458bd6                         mov        r10d, r14d
00e23 442bd7                         sub        r10d, edi
00e26 83c720                         add        edi, 0x20
00e29 e9da000000                     jmp        0x7f63dbbf8b08
00e2e 4d63d0                         movsxd     r10, r8d
00e31 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e38 c442a8f5db                     bzhi       r11, r11, r10
00e3d c4c1fb92fb                     kmovq      k7, r11
00e42 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e48 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e4e e98e000000                     jmp        0x7f63dbbf8ae1
00e53 448b0424                       mov        r8d, dword ptr [rsp]
00e57 442b84249c000000               sub        r8d, dword ptr [rsp + 0x9c]
00e5f 448b94249c000000               mov        r10d, dword ptr [rsp + 0x9c]
00e67 4585d2                         test       r10d, r10d
00e6a 0f8c441c0000                   jl         0x7f63dbbfa6b4
00e70 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
00e75 8bb424f0000000                 mov        esi, dword ptr [rsp + 0xf0]
00e7c 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00e80 4585db                         test       r11d, r11d
00e83 0f8c341c0000                   jl         0x7f63dbbfa6bd
00e89 3b3424                         cmp        esi, dword ptr [rsp]
00e8c 0f822b1c0000                   jb         0x7f63dbbfa6bd
00e92 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00e95 438d2c03                       lea        ebp, [r11 + r8]
00e99 3bcd                           cmp        ecx, ebp
00e9b 0f821c1c0000                   jb         0x7f63dbbfa6bd
00ea1 4585c0                         test       r8d, r8d
00ea4 0f8c131c0000                   jl         0x7f63dbbfa6bd
00eaa 4585c0                         test       r8d, r8d
00ead 7432                           je         0x7f63dbbf8ae1
00eaf 4b8d7c160c                     lea        rdi, [r14 + r10 + 0xc]
00eb4 4c8bd3                         mov        r10, rbx
00eb7 4a8d741b0c                     lea        rsi, [rbx + r11 + 0xc]
00ebc 4963d0                         movsxd     rdx, r8d
00ebf 4883fa20                       cmp        rdx, 0x20
00ec3 0f8665ffffff                   jbe        0x7f63dbbf8a2e
00ec9 c5f877                         vzeroupper 
00ecc 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00ed6 41ffd2                         call       r10
00ed9 0f1f840000000000               nop        dword ptr [rax + rax]
00ee1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00ee6 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00eea c5f877                         vzeroupper 
00eed 4881c4e0000000                 add        rsp, 0xe0
00ef4 5d                             pop        rbp
00ef5 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ef9 0f87ad240000                   ja         0x7f63dbbfafac
00eff c3                             ret        
00f00 448984249c000000               mov        dword ptr [rsp + 0x9c], r8d
00f08 458bc2                         mov        r8d, r10d
00f0b 440384249c000000               add        r8d, dword ptr [rsp + 0x9c]
00f13 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00f18 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
00f1f 448b9c249c000000               mov        r11d, dword ptr [rsp + 0x9c]
00f27 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
00f2b c4a17a7f44190c                 vmovdqu    xmmword ptr [rcx + r11 + 0xc], xmm0
00f32 448b84249c000000               mov        r8d, dword ptr [rsp + 0x9c]
00f3a 4183c010                       add        r8d, 0x10
00f3e 443bc7                         cmp        r8d, edi
00f41 7cbd                           jl         0x7f63dbbf8b00
00f43 4881c210ffffff                 add        rdx, -0xf0
00f4a 4881fa00000080                 cmp        rdx, -0x80000000
00f51 49c7c300000080                 mov        r11, 0xffffffff80000000
00f58 490f4cd3                       cmovl      rdx, r11
00f5c 448bda                         mov        r11d, edx
00f5f 453bc3                         cmp        r8d, r11d
00f62 0f8dae010000                   jge        0x7f63dbbf8d16
00f68 4963c8                         movsxd     rcx, r8d
00f6b 4803c8                         add        rcx, rax
00f6e 493bc9                         cmp        rcx, r9
00f71 0f83491f0000                   jae        0x7f63dbbfaac0
00f77 8b8c249c000000                 mov        ecx, dword ptr [rsp + 0x9c]
00f7e 81c100010000                   add        ecx, 0x100
00f84 4863f9                         movsxd     rdi, ecx
00f87 4803f8                         add        rdi, rax
00f8a 493bf9                         cmp        rdi, r9
00f8d 0f83411f0000                   jae        0x7f63dbbfaad4
00f93 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
00f9b 0f83471f0000                   jae        0x7f63dbbfaae8
00fa1 3b8c248c000000                 cmp        ecx, dword ptr [rsp + 0x8c]
00fa8 0f834e1f0000                   jae        0x7f63dbbfaafc
00fae 90                             nop        
00faf 90                             nop        
00fb0 438d3402                       lea        esi, [r10 + r8]
00fb4 418bc8                         mov        ecx, r8d
00fb7 4863f9                         movsxd     rdi, ecx
00fba 8bce                           mov        ecx, esi
00fbc 488b542468                     mov        rdx, qword ptr [rsp + 0x68]
00fc1 c5fa6f440a0c                   vmovdqu    xmm0, xmmword ptr [rdx + rcx + 0xc]
00fc7 4863d6                         movsxd     rdx, esi
00fca 418bc8                         mov        ecx, r8d
00fcd 8b742470                       mov        esi, dword ptr [rsp + 0x70]
00fd1 c5fa7f440e0c                   vmovdqu    xmmword ptr [rsi + rcx + 0xc], xmm0
00fd7 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
00fdc c5fa6f44111c                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x1c]
00fe2 c5fa7f443e1c                   vmovdqu    xmmword ptr [rsi + rdi + 0x1c], xmm0
00fe8 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
00fed c5fa6f44112c                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x2c]
00ff3 c5fa7f443e2c                   vmovdqu    xmmword ptr [rsi + rdi + 0x2c], xmm0
00ff9 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
00ffe c5fa6f44113c                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x3c]
01004 c5fa7f443e3c                   vmovdqu    xmmword ptr [rsi + rdi + 0x3c], xmm0
0100a 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0100f c5fa6f44114c                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x4c]
01015 c5fa7f443e4c                   vmovdqu    xmmword ptr [rsi + rdi + 0x4c], xmm0
0101b 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01020 c5fa6f44115c                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x5c]
01026 c5fa7f443e5c                   vmovdqu    xmmword ptr [rsi + rdi + 0x5c], xmm0
0102c 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01031 c5fa6f44116c                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x6c]
01037 c5fa7f443e6c                   vmovdqu    xmmword ptr [rsi + rdi + 0x6c], xmm0
0103d 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01042 c5fa6f44117c                   vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x7c]
01048 c5fa7f443e7c                   vmovdqu    xmmword ptr [rsi + rdi + 0x7c], xmm0
0104e 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01053 c5fa6f84118c000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x8c]
0105c c5fa7f843e8c000000             vmovdqu    xmmword ptr [rsi + rdi + 0x8c], xmm0
01065 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
0106a c5fa6f84119c000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0x9c]
01073 c5fa7f843e9c000000             vmovdqu    xmmword ptr [rsi + rdi + 0x9c], xmm0
0107c 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01081 c5fa6f8411ac000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xac]
0108a c5fa7f843eac000000             vmovdqu    xmmword ptr [rsi + rdi + 0xac], xmm0
01093 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
01098 c5fa6f8411bc000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xbc]
010a1 c5fa7f843ebc000000             vmovdqu    xmmword ptr [rsi + rdi + 0xbc], xmm0
010aa 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010af c5fa6f8411cc000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xcc]
010b8 c5fa7f843ecc000000             vmovdqu    xmmword ptr [rsi + rdi + 0xcc], xmm0
010c1 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010c6 c5fa6f8411dc000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xdc]
010cf c5fa7f843edc000000             vmovdqu    xmmword ptr [rsi + rdi + 0xdc], xmm0
010d8 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010dd c5fa6f8411ec000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xec]
010e6 c5fa7f843eec000000             vmovdqu    xmmword ptr [rsi + rdi + 0xec], xmm0
010ef 488b4c2468                     mov        rcx, qword ptr [rsp + 0x68]
010f4 c5fa6f8411fc000000             vmovdqu    xmm0, xmmword ptr [rcx + rdx + 0xfc]
010fd c5fa7f843efc000000             vmovdqu    xmmword ptr [rsi + rdi + 0xfc], xmm0
01106 4181c000010000                 add        r8d, 0x100
0110d 453bc3                         cmp        r8d, r11d
01110 0f8c9afeffff                   jl         0x7f63dbbf8bb0
01116 443bc3                         cmp        r8d, ebx
01119 7d45                           jge        0x7f63dbbf8d60
0111b 4d63d8                         movsxd     r11, r8d
0111e 4c03d8                         add        r11, rax
01121 4d3bd9                         cmp        r11, r9
01124 0f8312210000                   jae        0x7f63dbbfae3c
0112a 443b84248c000000               cmp        r8d, dword ptr [rsp + 0x8c]
01132 0f8318210000                   jae        0x7f63dbbfae50
01138 478d0c02                       lea        r9d, [r10 + r8]
0113c 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01141 c4817a6f440b0c                 vmovdqu    xmm0, xmmword ptr [r11 + r9 + 0xc]
01148 458bc8                         mov        r9d, r8d
0114b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01150 c4817a7f440b0c                 vmovdqu    xmmword ptr [r11 + r9 + 0xc], xmm0
01157 4183c010                       add        r8d, 0x10
0115b 443bc3                         cmp        r8d, ebx
0115e 7cd8                           jl         0x7f63dbbf8d38
01160 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
01168 4503d6                         add        r10d, r14d
0116b 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
01173 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
0117a e98ef6ffff                     jmp        0x7f63dbbf840d
0117f 443bac2488000000               cmp        r13d, dword ptr [rsp + 0x88]
01187 0f83831d0000                   jae        0x7f63dbbfab10
0118d 418bcd                         mov        ecx, r13d
01190 4863d9                         movsxd     rbx, ecx
01193 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01198 4d8b441b0c                     mov        r8, qword ptr [r11 + rbx + 0xc]
0119d 448b942494000000               mov        r10d, dword ptr [rsp + 0x94]
011a5 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
011ad 0f83191e0000                   jae        0x7f63dbbfabcc
011b3 8b942494000000                 mov        edx, dword ptr [rsp + 0x94]
011ba 448d7208                       lea        r14d, [rdx + 8]
011be 4c63da                         movsxd     r11, edx
011c1 8b7c2470                       mov        edi, dword ptr [rsp + 0x70]
011c5 4e89441f0c                     mov        qword ptr [rdi + r11 + 0xc], r8
011ca 443bb424a8000000               cmp        r14d, dword ptr [rsp + 0xa8]
011d2 0f8da0030000                   jge        0x7f63dbbf9178
011d8 492bdb                         sub        rbx, r11
011db 4963f6                         movsxd     rsi, r14d
011de 4c8d1c1e                       lea        r11, [rsi + rbx]
011e2 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
011ea 0f83941e0000                   jae        0x7f63dbbfac84
011f0 4d8bd9                         mov        r11, r9
011f3 4c2bde                         sub        r11, rsi
011f6 4983c307                       add        r11, 7
011fa 4983e3f8                       and        r11, 0xfffffffffffffff8
011fe 458bdb                         mov        r11d, r11d
01201 458d441308                     lea        r8d, [r11 + rdx + 8]
01206 4d63d8                         movsxd     r11, r8d
01209 4d8d441bf8                     lea        r8, [r11 + rbx - 8]
0120e 4c3b842480000000               cmp        r8, qword ptr [rsp + 0x80]
01216 0f83681e0000                   jae        0x7f63dbbfac84
0121c 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
01224 0f835a1e0000                   jae        0x7f63dbbfac84
0122a 4983c3f8                       add        r11, -8
0122e 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
01236 0f83481e0000                   jae        0x7f63dbbfac84
0123c 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
01244 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
0124b 0f8fe31e0000                   jg         0x7f63dbbfad34
01251 2bca                           sub        ecx, edx
01253 894c2404                       mov        dword ptr [rsp + 4], ecx
01257 b8f4ffffff                     mov        eax, 0xfffffff4
0125c 4d8d51c8                       lea        r10, [r9 - 0x38]
01260 4981fa00000080                 cmp        r10, -0x80000000
01267 49c7c300000080                 mov        r11, 0xffffffff80000000
0126e 4d0f4cd3                       cmovl      r10, r11
01272 418bca                         mov        ecx, r10d
01275 442bac2494000000               sub        r13d, dword ptr [rsp + 0x94]
0127d 448d5210                       lea        r10d, [rdx + 0x10]
01281 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01286 498bfb                         mov        rdi, r11
01289 4963ea                         movsxd     rbp, r10d
0128c 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01291 458bd8                         mov        r11d, r8d
01294 412bc3                         sub        eax, r11d
01297 2bc2                           sub        eax, edx
01299 83c0f0                         add        eax, -0x10
0129c 41bb06000000                   mov        r11d, 6
012a2 c462a0f5d8                     bzhi       r11, rax, r11
012a7 4903eb                         add        rbp, r11
012aa 493be9                         cmp        rbp, r9
012ad 498bd1                         mov        rdx, r9
012b0 480f4cd5                       cmovl      rdx, rbp
012b4 4c8bda                         mov        r11, rdx
012b7 4c2bde                         sub        r11, rsi
012ba 4d8d43ff                       lea        r8, [r11 - 1]
012be 49c1f83f                       sar        r8, 0x3f
012c2 49c1e83d                       shr        r8, 0x3d
012c6 4f8d5c18ff                     lea        r11, [r8 + r11 - 1]
012cb 4983e3f8                       and        r11, 0xfffffffffffffff8
012cf 4c03de                         add        r11, rsi
012d2 493bf3                         cmp        rsi, r11
012d5 490f4cf3                       cmovl      rsi, r11
012d9 448bc6                         mov        r8d, esi
012dc 478d5c0508                     lea        r11d, [r13 + r8 + 8]
012e1 4183c008                       add        r8d, 8
012e5 4963f3                         movsxd     rsi, r11d
012e8 4803f7                         add        rsi, rdi
012eb 4963c0                         movsxd     rax, r8d
012ee 4803c7                         add        rax, rdi
012f1 4c8d5e0c                       lea        r11, [rsi + 0xc]
012f5 4883c64c                       add        rsi, 0x4c
012f9 488d784c                       lea        rdi, [rax + 0x4c]
012fd 4533c0                         xor        r8d, r8d
01300 493bfb                         cmp        rdi, r11
01303 410f96c0                       setbe      r8b
01307 4883c00c                       add        rax, 0xc
0130b 4533db                         xor        r11d, r11d
0130e 483bf0                         cmp        rsi, rax
01311 410f96c3                       setbe      r11b
01315 450bc3                         or         r8d, r11d
01318 0f84550d0000                   je         0x7f63dbbf9c73
0131e 448bda                         mov        r11d, edx
01321 eb04                           jmp        0x7f63dbbf8f27
01323 90                             nop        
01324 448bf2                         mov        r14d, edx
01327 418bd6                         mov        edx, r14d
0132a 448b542404                     mov        r10d, dword ptr [rsp + 4]
0132f 4503d6                         add        r10d, r14d
01332 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01337 4f8b54100c                     mov        r10, qword ptr [r8 + r10 + 0xc]
0133c 4d8954100c                     mov        qword ptr [r8 + rdx + 0xc], r10
01341 418d5608                       lea        edx, [r14 + 8]
01345 413bd3                         cmp        edx, r11d
01348 7cda                           jl         0x7f63dbbf8f24
0134a 4981c108feffff                 add        r9, -0x1f8
01351 4981f900000080                 cmp        r9, -0x80000000
01358 49c7c200000080                 mov        r10, 0xffffffff80000000
0135f 4d0f4cca                       cmovl      r9, r10
01363 418bf9                         mov        edi, r9d
01366 3bd7                           cmp        edx, edi
01368 0f8d761e0000                   jge        0x7f63dbbfade4
0136e 4c63d2                         movsxd     r10, edx
01371 4c03d3                         add        r10, rbx
01374 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
0137c 0f836a1e0000                   jae        0x7f63dbbfadec
01382 4181c600020000                 add        r14d, 0x200
01389 4d63d6                         movsxd     r10, r14d
0138c 4c03d3                         add        r10, rbx
0138f 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01397 0f83631e0000                   jae        0x7f63dbbfae00
0139d 3b942488000000                 cmp        edx, dword ptr [rsp + 0x88]
013a4 0f836a1e0000                   jae        0x7f63dbbfae14
013aa 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
013b2 0f83701e0000                   jae        0x7f63dbbfae28
013b8 eb09                           jmp        0x7f63dbbf8fc3
013ba 90                             nop        
013bb 90                             nop        
013bc 90                             nop        
013bd 90                             nop        
013be 90                             nop        
013bf 90                             nop        
013c0 418bd1                         mov        edx, r9d
013c3 448d9200010000                 lea        r10d, [rdx + 0x100]
013ca 4403542404                     add        r10d, dword ptr [rsp + 4]
013cf 448d8a80000000                 lea        r9d, [rdx + 0x80]
013d6 44034c2404                     add        r9d, dword ptr [rsp + 4]
013db 418bf2                         mov        esi, r10d
013de 4d63da                         movsxd     r11, r10d
013e1 8bea                           mov        ebp, edx
013e3 8b442404                       mov        eax, dword ptr [rsp + 4]
013e7 03c2                           add        eax, edx
013e9 448bd2                         mov        r10d, edx
013ec 4d63f2                         movsxd     r14, r10d
013ef 448bc0                         mov        r8d, eax
013f2 448b6c2470                     mov        r13d, dword ptr [rsp + 0x70]
013f7 62917e486f84050c000000         vmovdqu32  zmm0, zmmword ptr [r13 + r8 + 0xc]
01402 62d17e487f842d0c000000         vmovdqu32  zmmword ptr [r13 + rbp + 0xc], zmm0
0140d 4863c0                         movsxd     rax, eax
01410 448d4240                       lea        r8d, [rdx + 0x40]
01414 4403442404                     add        r8d, dword ptr [rsp + 4]
01419 62917e486f84050c000000         vmovdqu32  zmm0, zmmword ptr [r13 + r8 + 0xc]
01424 62917e487f84354c000000         vmovdqu32  zmmword ptr [r13 + r14 + 0x4c], zmm0
0142f 62917e486f840d0c000000         vmovdqu32  zmm0, zmmword ptr [r13 + r9 + 0xc]
0143a 62917e487f84358c000000         vmovdqu32  zmmword ptr [r13 + r14 + 0x8c], zmm0
01445 62d17e486f8405cc000000         vmovdqu32  zmm0, zmmword ptr [r13 + rax + 0xcc]
01450 62917e487f8435cc000000         vmovdqu32  zmmword ptr [r13 + r14 + 0xcc], zmm0
0145b 62d17e486f84350c000000         vmovdqu32  zmm0, zmmword ptr [r13 + rsi + 0xc]
01466 62917e487f84350c010000         vmovdqu32  zmmword ptr [r13 + r14 + 0x10c], zmm0
01471 62d17e486f84054c010000         vmovdqu32  zmm0, zmmword ptr [r13 + rax + 0x14c]
0147c 62917e487f84354c010000         vmovdqu32  zmmword ptr [r13 + r14 + 0x14c], zmm0
01487 62d17e486f84058c010000         vmovdqu32  zmm0, zmmword ptr [r13 + rax + 0x18c]
01492 62917e487f84358c010000         vmovdqu32  zmmword ptr [r13 + r14 + 0x18c], zmm0
0149d 62917e486f841dcc000000         vmovdqu32  zmm0, zmmword ptr [r13 + r11 + 0xcc]
014a8 62917e487f8435cc010000         vmovdqu32  zmmword ptr [r13 + r14 + 0x1cc], zmm0
014b3 448d8a00020000                 lea        r9d, [rdx + 0x200]
014ba 443bcf                         cmp        r9d, edi
014bd 0f8cfdfeffff                   jl         0x7f63dbbf8fc0
014c3 443bc9                         cmp        r9d, ecx
014c6 7d57                           jge        0x7f63dbbf911f
014c8 81c238020000                   add        edx, 0x238
014ce 4c63d2                         movsxd     r10, edx
014d1 4c03d3                         add        r10, rbx
014d4 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
014dc 0f83821d0000                   jae        0x7f63dbbfae64
014e2 3b942488000000                 cmp        edx, dword ptr [rsp + 0x88]
014e9 0f839d1d0000                   jae        0x7f63dbbfae8c
014ef 90                             nop        
014f0 458bd1                         mov        r10d, r9d
014f3 448b442404                     mov        r8d, dword ptr [rsp + 4]
014f8 4503c1                         add        r8d, r9d
014fb 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01500 62917e486f84030c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r8 + 0xc]
0150b 62917e487f84130c000000         vmovdqu32  zmmword ptr [r11 + r10 + 0xc], zmm0
01516 4183c140                       add        r9d, 0x40
0151a 443bc9                         cmp        r9d, ecx
0151d 7cd1                           jl         0x7f63dbbf90f0
0151f 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
01527 7d4f                           jge        0x7f63dbbf9178
01529 4d63d1                         movsxd     r10, r9d
0152c 4c03d3                         add        r10, rbx
0152f 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
01537 0f833b1d0000                   jae        0x7f63dbbfae78
0153d 443b8c2488000000               cmp        r9d, dword ptr [rsp + 0x88]
01545 0f83551d0000                   jae        0x7f63dbbfaea0
0154b 90                             nop        
0154c 448b542404                     mov        r10d, dword ptr [rsp + 4]
01551 4503d1                         add        r10d, r9d
01554 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01559 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
0155e 458bd9                         mov        r11d, r9d
01561 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01565 4e8954190c                     mov        qword ptr [rcx + r11 + 0xc], r10
0156a 4183c108                       add        r9d, 8
0156e 443b8c24a8000000               cmp        r9d, dword ptr [rsp + 0xa8]
01576 7cd4                           jl         0x7f63dbbf914c
01578 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01580 e990f0ffff                     jmp        0x7f63dbbf8215
01585 4c03c9                         add        r9, rcx
01588 4c3b4c2448                     cmp        r9, qword ptr [rsp + 0x48]
0158d 7e08                           jle        0x7f63dbbf9197
0158f 4533c0                         xor        r8d, r8d
01592 e919ebffff                     jmp        0x7f63dbbf7cb0
01597 4533c0                         xor        r8d, r8d
0159a ba01000000                     mov        edx, 1
0159f e90eebffff                     jmp        0x7f63dbbf7cb2
015a4 bee4ffffff                     mov        esi, 0xffffffe4
015a9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015ae 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
015b3 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
015bb 448b1c24                       mov        r11d, dword ptr [rsp]
015bf 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
015c7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015cc 4c891424                       mov        qword ptr [rsp], r10
015d0 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
015d5 4c89542408                     mov        qword ptr [rsp + 8], r10
015da 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
015df 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
015e7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
015ec 4c89542410                     mov        qword ptr [rsp + 0x10], r10
015f1 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
015f6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
015fb 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01600 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01605 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0160a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0160f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01614 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01619 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0161e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01623 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01628 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0162d 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
01632 90                             nop        
01633 90                             nop        
01634 c5f877                         vzeroupper 
01637 e82415afff                     call       0x7f63db6ea760
0163c 0f1f840034170007               nop        dword ptr [rax + rax + 0x7001734]
01644 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0164e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01652 e8a976b318                     call       0x7f63f4730900
01657 f4                             hlt        
01658 bee4ffffff                     mov        esi, 0xffffffe4
0165d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01662 448b1c24                       mov        r11d, dword ptr [rsp]
01666 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
0166e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01673 4c891c24                       mov        qword ptr [rsp], r11
01677 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
0167c 4c895c2408                     mov        qword ptr [rsp + 8], r11
01681 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01686 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
0168e 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
01693 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01698 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0169d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
016a2 4489742420                     mov        dword ptr [rsp + 0x20], r14d
016a7 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
016ac 4489442424                     mov        dword ptr [rsp + 0x24], r8d
016b1 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
016b6 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
016bb 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
016c0 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
016c5 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
016ca 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
016cf 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
016d4 4489442434                     mov        dword ptr [rsp + 0x34], r8d
016d9 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016de 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
016e3 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
016e9 90                             nop        
016ea 90                             nop        
016eb 90                             nop        
016ec c5f877                         vzeroupper 
016ef e86c14afff                     call       0x7f63db6ea760
016f4 0f1f8400ec170008               nop        dword ptr [rax + rax + 0x80017ec]
016fc 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01706 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170a e8f175b318                     call       0x7f63f4730900
0170f f4                             hlt        
01710 bee4ffffff                     mov        esi, 0xffffffe4
01715 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0171a 448b1c24                       mov        r11d, dword ptr [rsp]
0171e 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01726 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0172b 4c891424                       mov        qword ptr [rsp], r10
0172f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01734 4c89542408                     mov        qword ptr [rsp + 8], r10
01739 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0173e 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
01746 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0174b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01750 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01755 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0175a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0175f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01764 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01769 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0176e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01773 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01778 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0177d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01782 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01787 90                             nop        
01788 c5f877                         vzeroupper 
0178b e8d013afff                     call       0x7f63db6ea760
01790 0f1f840088180009               nop        dword ptr [rax + rax + 0x9001888]
01798 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
017a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
017a6 e85575b318                     call       0x7f63f4730900
017ab f4                             hlt        
017ac be45ffffff                     mov        esi, 0xffffff45
017b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017b6 4c898424f8000000               mov        qword ptr [rsp + 0xf8], r8
017be 90                             nop        
017bf 90                             nop        
017c0 c5f877                         vzeroupper 
017c3 e89813afff                     call       0x7f63db6ea760
017c8 0f1f8400c018000a               nop        dword ptr [rax + rax + 0xa0018c0]
017d0 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
017da 4883e4f0                       and        rsp, 0xfffffffffffffff0
017de e81d75b318                     call       0x7f63f4730900
017e3 f4                             hlt        
017e4 be45ffffff                     mov        esi, 0xffffff45
017e9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ee 448b1424                       mov        r10d, dword ptr [rsp]
017f2 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
017fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017ff 4c891424                       mov        qword ptr [rsp], r10
01803 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01808 4c89542408                     mov        qword ptr [rsp + 8], r10
0180d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01812 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0181a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0181f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01824 4489742420                     mov        dword ptr [rsp + 0x20], r14d
01829 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0182e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01833 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01838 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0183d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01842 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01847 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0184c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01851 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01856 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0185b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01860 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01865 90                             nop        
01866 90                             nop        
01867 90                             nop        
01868 c5f877                         vzeroupper 
0186b e8f012afff                     call       0x7f63db6ea760
01870 0f1f84006819000b               nop        dword ptr [rax + rax + 0xb001968]
01878 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01882 4883e4f0                       and        rsp, 0xfffffffffffffff0
01886 e87574b318                     call       0x7f63f4730900
0188b f4                             hlt        
0188c 493bd8                         cmp        rbx, r8
0188f bdffffffff                     mov        ebp, 0xffffffff
01894 7c08                           jl         0x7f63dbbf949e
01896 400f95c5                       setne      bpl
0189a 400fb6ed                       movzx      ebp, bpl
0189e be45ffffff                     mov        esi, 0xffffff45
018a3 48ff742408                     push       qword ptr [rsp + 8]
018a8 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
018b0 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
018b5 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
018bd 48ff742420                     push       qword ptr [rsp + 0x20]
018c2 488f442408                     pop        qword ptr [rsp + 8]
018c7 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
018cc 4489542404                     mov        dword ptr [rsp + 4], r10d
018d1 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
018d6 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018db 4489742428                     mov        dword ptr [rsp + 0x28], r14d
018e0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
018e5 4489542450                     mov        dword ptr [rsp + 0x50], r10d
018ea 4c89442468                     mov        qword ptr [rsp + 0x68], r8
018ef 90                             nop        
018f0 c5f877                         vzeroupper 
018f3 e86812afff                     call       0x7f63db6ea760
018f8 0f1f8400f019000c               nop        dword ptr [rax + rax + 0xc0019f0]
01900 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0190a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0190e e8ed73b318                     call       0x7f63f4730900
01913 f4                             hlt        
01914 be45ffffff                     mov        esi, 0xffffff45
01919 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0191e 448b0424                       mov        r8d, dword ptr [rsp]
01922 44898424f8000000               mov        dword ptr [rsp + 0xf8], r8d
0192a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0192f 4c891424                       mov        qword ptr [rsp], r10
01933 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01938 4c89542408                     mov        qword ptr [rsp + 8], r10
0193d 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01942 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
0194a 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0194f 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01954 4489742420                     mov        dword ptr [rsp + 0x20], r14d
01959 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0195e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01963 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01968 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0196d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01972 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01977 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0197c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01981 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01986 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0198b 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01990 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01995 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0199a 90                             nop        
0199b 90                             nop        
0199c c5f877                         vzeroupper 
0199f e8bc11afff                     call       0x7f63db6ea760
019a4 0f1f84009c1a000d               nop        dword ptr [rax + rax + 0xd001a9c]
019ac 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
019b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019ba e84173b318                     call       0x7f63f4730900
019bf f4                             hlt        
019c0 be45ffffff                     mov        esi, 0xffffff45
019c5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019ca 448b1424                       mov        r10d, dword ptr [rsp]
019ce 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
019d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019db 4c891424                       mov        qword ptr [rsp], r10
019df 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
019e4 4c89542408                     mov        qword ptr [rsp + 8], r10
019e9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
019ee 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
019f6 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
019fb 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a00 4489742420                     mov        dword ptr [rsp + 0x20], r14d
01a05 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01a0a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a0f 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01a14 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01a19 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01a1e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01a23 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01a28 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01a2d 90                             nop        
01a2e 90                             nop        
01a2f 90                             nop        
01a30 c5f877                         vzeroupper 
01a33 e82811afff                     call       0x7f63db6ea760
01a38 0f1f8400301b000e               nop        dword ptr [rax + rax + 0xe001b30]
01a40 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01a4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a4e e8ad72b318                     call       0x7f63f4730900
01a53 f4                             hlt        
01a54 bee4ffffff                     mov        esi, 0xffffffe4
01a59 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a5e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01a63 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01a6b 448b1424                       mov        r10d, dword ptr [rsp]
01a6f 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01a77 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a7c 4c891424                       mov        qword ptr [rsp], r10
01a80 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01a85 4c89542408                     mov        qword ptr [rsp + 8], r10
01a8a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01a8f 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01a97 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01a9c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01aa1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01aa6 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01aab 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01ab0 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ab5 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01aba 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01abf 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ac4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ac9 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ace 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ad3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01ad8 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01add 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01ae2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01ae7 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
01aec c5f877                         vzeroupper 
01aef e86c10afff                     call       0x7f63db6ea760
01af4 0f1f8400ec1b000f               nop        dword ptr [rax + rax + 0xf001bec]
01afc 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01b06 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0a e8f171b318                     call       0x7f63f4730900
01b0f f4                             hlt        
01b10 bee4ffffff                     mov        esi, 0xffffffe4
01b15 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b1a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01b1f 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
01b27 448b1c24                       mov        r11d, dword ptr [rsp]
01b2b 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01b33 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b38 4c891424                       mov        qword ptr [rsp], r10
01b3c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b41 4c89542408                     mov        qword ptr [rsp + 8], r10
01b46 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01b4b 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
01b53 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01b58 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b5d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b62 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01b67 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01b6c 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b71 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01b76 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01b7b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b80 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b85 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01b8a 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01b8f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01b94 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01b99 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b9e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01ba3 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01ba8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01bad 90                             nop        
01bae 90                             nop        
01baf 90                             nop        
01bb0 c5f877                         vzeroupper 
01bb3 e8a80fafff                     call       0x7f63db6ea760
01bb8 0f1f8400b01c0010               nop        dword ptr [rax + rax + 0x10001cb0]
01bc0 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01bca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bce e82d71b318                     call       0x7f63f4730900
01bd3 f4                             hlt        
01bd4 4183c508                       add        r13d, 8
01bd8 be6effffff                     mov        esi, 0xffffff6e
01bdd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01be2 448b1424                       mov        r10d, dword ptr [rsp]
01be6 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01bee 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bf3 4c891424                       mov        qword ptr [rsp], r10
01bf7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01bfc 4c89542408                     mov        qword ptr [rsp + 8], r10
01c01 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01c06 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01c0e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01c13 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c18 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01c1c 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c21 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01c26 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01c2b 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01c30 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01c35 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01c3a 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01c3f 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01c44 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01c49 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01c4e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c53 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01c58 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01c60 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01c65 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01c69 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01c6e 90                             nop        
01c6f 90                             nop        
01c70 c5f877                         vzeroupper 
01c73 e8e80eafff                     call       0x7f63db6ea760
01c78 0f1f8400701d0011               nop        dword ptr [rax + rax + 0x11001d70]
01c80 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01c8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c8e e86d70b318                     call       0x7f63f4730900
01c93 f4                             hlt        
01c94 4183c508                       add        r13d, 8
01c98 be66ffffff                     mov        esi, 0xffffff66
01c9d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01ca2 448b1c24                       mov        r11d, dword ptr [rsp]
01ca6 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
01cae 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cb3 4c891424                       mov        qword ptr [rsp], r10
01cb7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01cbc 4c89542408                     mov        qword ptr [rsp + 8], r10
01cc1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01cc6 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01cce 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01cd3 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01cd8 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01cdc 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01ce1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ce6 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ceb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01cf0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01cf5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01cfa 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01cff 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01d04 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01d09 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01d0e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01d13 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d18 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
01d20 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
01d25 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01d29 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01d2e 90                             nop        
01d2f 90                             nop        
01d30 c5f877                         vzeroupper 
01d33 e8280eafff                     call       0x7f63db6ea760
01d38 0f1f8400301e0012               nop        dword ptr [rax + rax + 0x12001e30]
01d40 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01d4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d4e e8ad6fb318                     call       0x7f63f4730900
01d53 f4                             hlt        
01d54 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
01d5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d62 e8996fb318                     call       0x7f63f4730900
01d67 f4                             hlt        
01d68 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
01d72 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d76 e8856fb318                     call       0x7f63f4730900
01d7b f4                             hlt        
01d7c 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
01d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8a e8716fb318                     call       0x7f63f4730900
01d8f f4                             hlt        
01d90 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
01d9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d9e e85d6fb318                     call       0x7f63f4730900
01da3 f4                             hlt        
01da4 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
01dae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db2 e8496fb318                     call       0x7f63f4730900
01db7 f4                             hlt        
01db8 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
01dc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dc6 e8356fb318                     call       0x7f63f4730900
01dcb f4                             hlt        
01dcc beccffffff                     mov        esi, 0xffffffcc
01dd1 48ff742408                     push       qword ptr [rsp + 8]
01dd6 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
01dde 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01de3 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
01deb 48ff742420                     push       qword ptr [rsp + 0x20]
01df0 488f442408                     pop        qword ptr [rsp + 8]
01df5 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01dfa 4489542404                     mov        dword ptr [rsp + 4], r10d
01dff 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01e04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e09 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01e0e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01e13 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01e18 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01e1d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01e22 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01e27 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01e2c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01e31 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01e36 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e3b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01e40 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01e45 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
01e4a 895c2478                       mov        dword ptr [rsp + 0x78], ebx
01e4e 90                             nop        
01e4f 90                             nop        
01e50 c5f877                         vzeroupper 
01e53 e8080dafff                     call       0x7f63db6ea760
01e58 0f1f8400501f0013               nop        dword ptr [rax + rax + 0x13001f50]
01e60 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01e6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e6e e88d6eb318                     call       0x7f63f4730900
01e73 f4                             hlt        
01e74 beccffffff                     mov        esi, 0xffffffcc
01e79 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e7e 448b1424                       mov        r10d, dword ptr [rsp]
01e82 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
01e8a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e8f 4c891424                       mov        qword ptr [rsp], r10
01e93 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01e98 4c89542408                     mov        qword ptr [rsp + 8], r10
01e9d 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01ea2 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
01eaa 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01eaf 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01eb4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01eb9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01ebe 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01ec3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ec8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
01ecd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
01ed2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ed7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01edc 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01ee1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01ee6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01eeb 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01ef0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01ef5 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01efa 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
01f02 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01f07 44896c2458                     mov        dword ptr [rsp + 0x58], r13d
01f0c c5f877                         vzeroupper 
01f0f e84c0cafff                     call       0x7f63db6ea760
01f14 0f1f84000c200014               nop        dword ptr [rax + rax + 0x1400200c]
01f1c 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01f26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f2a e8d16db318                     call       0x7f63f4730900
01f2f f4                             hlt        
01f30 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01f35 4d3bd3                         cmp        r10, r11
01f38 bdffffffff                     mov        ebp, 0xffffffff
01f3d 7c08                           jl         0x7f63dbbf9b47
01f3f 400f95c5                       setne      bpl
01f43 400fb6ed                       movzx      ebp, bpl
01f47 be45ffffff                     mov        esi, 0xffffff45
01f4c 48ff742408                     push       qword ptr [rsp + 8]
01f51 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
01f59 48ff742420                     push       qword ptr [rsp + 0x20]
01f5e 488f442408                     pop        qword ptr [rsp + 8]
01f63 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01f68 4489542404                     mov        dword ptr [rsp + 4], r10d
01f6d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
01f72 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f77 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01f7c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01f81 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01f86 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01f8b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
01f90 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01f95 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01f9a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01f9f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01fa4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01fa9 90                             nop        
01faa 90                             nop        
01fab 90                             nop        
01fac c5f877                         vzeroupper 
01faf e8ac0bafff                     call       0x7f63db6ea760
01fb4 0f1f8400ac200015               nop        dword ptr [rax + rax + 0x150020ac]
01fbc 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
01fc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fca e8316db318                     call       0x7f63f4730900
01fcf f4                             hlt        
01fd0 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
01fd5 493bea                         cmp        rbp, r10
01fd8 bdffffffff                     mov        ebp, 0xffffffff
01fdd 7c08                           jl         0x7f63dbbf9be7
01fdf 400f95c5                       setne      bpl
01fe3 400fb6ed                       movzx      ebp, bpl
01fe7 be45ffffff                     mov        esi, 0xffffff45
01fec 48ff742408                     push       qword ptr [rsp + 8]
01ff1 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
01ff9 48ff742420                     push       qword ptr [rsp + 0x20]
01ffe 488f442408                     pop        qword ptr [rsp + 8]
02003 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02008 4489542404                     mov        dword ptr [rsp + 4], r10d
0200d 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02012 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02017 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0201c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02021 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02026 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0202b 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02030 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02035 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0203a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0203f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02044 4c89442460                     mov        qword ptr [rsp + 0x60], r8
02049 90                             nop        
0204a 90                             nop        
0204b 90                             nop        
0204c c5f877                         vzeroupper 
0204f e80c0bafff                     call       0x7f63db6ea760
02054 0f1f84004c210016               nop        dword ptr [rax + rax + 0x1600214c]
0205c 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02066 4883e4f0                       and        rsp, 0xfffffffffffffff0
0206a e8916cb318                     call       0x7f63f4730900
0206f f4                             hlt        
02070 458bf0                         mov        r14d, r8d
02073 458bc6                         mov        r8d, r14d
02076 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0207b 4503de                         add        r11d, r14d
0207e 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
02083 4f8b5c190c                     mov        r11, qword ptr [r9 + r11 + 0xc]
02088 4f895c010c                     mov        qword ptr [r9 + r8 + 0xc], r11
0208d 458d4608                       lea        r8d, [r14 + 8]
02091 453bc2                         cmp        r8d, r10d
02094 7cda                           jl         0x7f63dbbf9c70
02096 443bc1                         cmp        r8d, ecx
02099 0f8dc9000000                   jge        0x7f63dbbf9d68
0209f 4d63d0                         movsxd     r10, r8d
020a2 4c03d3                         add        r10, rbx
020a5 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
020ad 0f8301120000                   jae        0x7f63dbbfaeb4
020b3 458d5640                       lea        r10d, [r14 + 0x40]
020b7 4d63da                         movsxd     r11, r10d
020ba 4c03db                         add        r11, rbx
020bd 4c3b9c2480000000               cmp        r11, qword ptr [rsp + 0x80]
020c5 0f83fd110000                   jae        0x7f63dbbfaec8
020cb 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
020d3 0f8303120000                   jae        0x7f63dbbfaedc
020d9 443b942488000000               cmp        r10d, dword ptr [rsp + 0x88]
020e1 0f8309120000                   jae        0x7f63dbbfaef0
020e7 90                             nop        
020e8 90                             nop        
020e9 90                             nop        
020ea 90                             nop        
020eb 90                             nop        
020ec 90                             nop        
020ed 90                             nop        
020ee 90                             nop        
020ef 90                             nop        
020f0 458bd0                         mov        r10d, r8d
020f3 4d63ca                         movsxd     r9, r10d
020f6 8b542404                       mov        edx, dword ptr [rsp + 4]
020fa 4103d0                         add        edx, r8d
020fd 418bf8                         mov        edi, r8d
02100 448bda                         mov        r11d, edx
02103 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02108 4f8b541a0c                     mov        r10, qword ptr [r10 + r11 + 0xc]
0210d 8b742470                       mov        esi, dword ptr [rsp + 0x70]
02111 4c89543e0c                     mov        qword ptr [rsi + rdi + 0xc], r10
02116 4c63da                         movsxd     r11, edx
02119 4e8b541e14                     mov        r10, qword ptr [rsi + r11 + 0x14]
0211e 4e89540e14                     mov        qword ptr [rsi + r9 + 0x14], r10
02123 4e8b541e1c                     mov        r10, qword ptr [rsi + r11 + 0x1c]
02128 4e89540e1c                     mov        qword ptr [rsi + r9 + 0x1c], r10
0212d 4e8b541e24                     mov        r10, qword ptr [rsi + r11 + 0x24]
02132 4e89540e24                     mov        qword ptr [rsi + r9 + 0x24], r10
02137 4e8b541e2c                     mov        r10, qword ptr [rsi + r11 + 0x2c]
0213c 4e89540e2c                     mov        qword ptr [rsi + r9 + 0x2c], r10
02141 4e8b541e34                     mov        r10, qword ptr [rsi + r11 + 0x34]
02146 4e89540e34                     mov        qword ptr [rsi + r9 + 0x34], r10
0214b 4e8b541e3c                     mov        r10, qword ptr [rsi + r11 + 0x3c]
02150 4e89540e3c                     mov        qword ptr [rsi + r9 + 0x3c], r10
02155 4e8b541e44                     mov        r10, qword ptr [rsi + r11 + 0x44]
0215a 4e89540e44                     mov        qword ptr [rsi + r9 + 0x44], r10
0215f 4183c040                       add        r8d, 0x40
02163 443bc1                         cmp        r8d, ecx
02166 7c88                           jl         0x7f63dbbf9cf0
02168 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
02170 0f8d02f4ffff                   jge        0x7f63dbbf9178
02176 4d63d0                         movsxd     r10, r8d
02179 4c03d3                         add        r10, rbx
0217c 4c3b942480000000               cmp        r10, qword ptr [rsp + 0x80]
02184 0f837a110000                   jae        0x7f63dbbfaf04
0218a 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
02192 0f8380110000                   jae        0x7f63dbbfaf18
02198 448b542404                     mov        r10d, dword ptr [rsp + 4]
0219d 4503d0                         add        r10d, r8d
021a0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
021a5 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
021aa 458bd8                         mov        r11d, r8d
021ad 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
021b1 4e8954190c                     mov        qword ptr [rcx + r11 + 0xc], r10
021b6 4183c008                       add        r8d, 8
021ba 443b8424a8000000               cmp        r8d, dword ptr [rsp + 0xa8]
021c2 7cd4                           jl         0x7f63dbbf9d98
021c4 e9aff3ffff                     jmp        0x7f63dbbf9178
021c9 bee4ffffff                     mov        esi, 0xffffffe4
021ce 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
021d3 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
021d8 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
021e0 448b1424                       mov        r10d, dword ptr [rsp]
021e4 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
021ec 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021f1 4c891424                       mov        qword ptr [rsp], r10
021f5 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
021fa 4c89542408                     mov        qword ptr [rsp + 8], r10
021ff 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02204 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0220c 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02211 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02216 4489742420                     mov        dword ptr [rsp + 0x20], r14d
0221b 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02220 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02225 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0222a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0222f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
02234 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
02239 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0223e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02243 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02248 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0224d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02252 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02257 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0225c 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02261 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
02266 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0226b 90                             nop        
0226c c5f877                         vzeroupper 
0226f e8ec08afff                     call       0x7f63db6ea760
02274 0f1f84006c230017               nop        dword ptr [rax + rax + 0x1700236c]
0227c 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02286 4883e4f0                       and        rsp, 0xfffffffffffffff0
0228a e8716ab318                     call       0x7f63f4730900
0228f f4                             hlt        
02290 85db                           test       ebx, ebx
02292 0f8494100000                   je         0x7f63dbbfaf2c
02298 448b0424                       mov        r8d, dword ptr [rsp]
0229c 458bda                         mov        r11d, r10d
0229f 4533d2                         xor        r10d, r10d
022a2 e9d9ebffff                     jmp        0x7f63dbbf8a80
022a7 be6effffff                     mov        esi, 0xffffff6e
022ac 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
022b1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
022b6 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
022be 448b1c24                       mov        r11d, dword ptr [rsp]
022c2 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
022ca 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
022cf 4c891424                       mov        qword ptr [rsp], r10
022d3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
022d8 4c89542408                     mov        qword ptr [rsp + 8], r10
022dd 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
022e2 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
022ea 4489742420                     mov        dword ptr [rsp + 0x20], r14d
022ef 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
022f4 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
022f9 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
022fe 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02303 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02308 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0230d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02312 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02317 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0231c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02321 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02326 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0232b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02330 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02335 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0233a 894c2460                       mov        dword ptr [rsp + 0x60], ecx
0233e 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
02343 90                             nop        
02344 c5f877                         vzeroupper 
02347 e81408afff                     call       0x7f63db6ea760
0234c 0f1f840044240018               nop        dword ptr [rax + rax + 0x18002444]
02354 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0235e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02362 e89969b318                     call       0x7f63f4730900
02367 f4                             hlt        
02368 be45ffffff                     mov        esi, 0xffffff45
0236d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02372 448b1424                       mov        r10d, dword ptr [rsp]
02376 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0237e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02383 4c891424                       mov        qword ptr [rsp], r10
02387 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0238c 4c89542408                     mov        qword ptr [rsp + 8], r10
02391 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02396 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0239e 4489742420                     mov        dword ptr [rsp + 0x20], r14d
023a3 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
023a8 4489542424                     mov        dword ptr [rsp + 0x24], r10d
023ad 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
023b2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
023b7 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
023bc 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
023c1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
023c6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
023cb 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
023d0 4c89542440                     mov        qword ptr [rsp + 0x40], r10
023d5 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
023da 4489542434                     mov        dword ptr [rsp + 0x34], r10d
023df 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
023e4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
023e9 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
023ee 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
023f3 90                             nop        
023f4 c5f877                         vzeroupper 
023f7 e86407afff                     call       0x7f63db6ea760
023fc 0f1f8400f4240019               nop        dword ptr [rax + rax + 0x190024f4]
02404 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0240e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02412 e8e968b318                     call       0x7f63f4730900
02417 f4                             hlt        
02418 be3dffffff                     mov        esi, 0xffffff3d
0241d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02422 448b1424                       mov        r10d, dword ptr [rsp]
02426 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
0242e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02433 4c891424                       mov        qword ptr [rsp], r10
02437 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0243c 4c89542408                     mov        qword ptr [rsp + 8], r10
02441 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02446 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
0244e 4489742420                     mov        dword ptr [rsp + 0x20], r14d
02453 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02458 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0245d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02462 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02467 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0246c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02471 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02476 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0247b 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02480 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02485 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0248a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0248f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02494 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02499 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0249e 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
024a3 90                             nop        
024a4 c5f877                         vzeroupper 
024a7 e8b406afff                     call       0x7f63db6ea760
024ac 0f1f8400a425001a               nop        dword ptr [rax + rax + 0x1a0025a4]
024b4 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
024be 4883e4f0                       and        rsp, 0xfffffffffffffff0
024c2 e83968b318                     call       0x7f63f4730900
024c7 f4                             hlt        
024c8 bee4ffffff                     mov        esi, 0xffffffe4
024cd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
024d2 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
024d7 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
024df 448b1c24                       mov        r11d, dword ptr [rsp]
024e3 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
024eb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
024f0 4c891424                       mov        qword ptr [rsp], r10
024f4 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
024f9 4c89542408                     mov        qword ptr [rsp + 8], r10
024fe 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02503 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0250b 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02510 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02515 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0251a 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0251f 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02524 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02529 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0252e 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02533 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02538 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0253d 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02542 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02547 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0254c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02551 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02556 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0255b 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02560 c5f877                         vzeroupper 
02563 e8f805afff                     call       0x7f63db6ea760
02568 0f1f84006026001b               nop        dword ptr [rax + rax + 0x1b002660]
02570 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0257a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0257e e87d67b318                     call       0x7f63f4730900
02583 f4                             hlt        
02584 bee4ffffff                     mov        esi, 0xffffffe4
02589 48ff742408                     push       qword ptr [rsp + 8]
0258e 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
02596 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0259b 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
025a3 48ff742420                     push       qword ptr [rsp + 0x20]
025a8 488f442408                     pop        qword ptr [rsp + 8]
025ad 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
025b2 4489542404                     mov        dword ptr [rsp + 4], r10d
025b7 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
025bc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025c1 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
025c6 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
025cb 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
025d0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
025d5 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
025da 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025df 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
025e4 4c89542440                     mov        qword ptr [rsp + 0x40], r10
025e9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
025ee 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
025f3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
025f8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
025fd 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02602 90                             nop        
02603 90                             nop        
02604 c5f877                         vzeroupper 
02607 e85405afff                     call       0x7f63db6ea760
0260c 0f1f84000427001c               nop        dword ptr [rax + rax + 0x1c002704]
02614 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0261e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02622 e8d966b318                     call       0x7f63f4730900
02627 f4                             hlt        
02628 418d6d01                       lea        ebp, [r13 + 1]
0262c bee4ffffff                     mov        esi, 0xffffffe4
02631 48ff742408                     push       qword ptr [rsp + 8]
02636 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
0263e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02643 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
0264b 48ff742420                     push       qword ptr [rsp + 0x20]
02650 488f442408                     pop        qword ptr [rsp + 8]
02655 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0265a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0265f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02664 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02669 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0266e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02673 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02678 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0267d 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02682 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02687 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0268c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02691 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02696 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0269b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
026a0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
026a5 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
026aa 4489442470                     mov        dword ptr [rsp + 0x70], r8d
026af 90                             nop        
026b0 c5f877                         vzeroupper 
026b3 e8a804afff                     call       0x7f63db6ea760
026b8 0f1f8400b027001d               nop        dword ptr [rax + rax + 0x1d0027b0]
026c0 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
026ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ce e82d66b318                     call       0x7f63f4730900
026d3 f4                             hlt        
026d4 bee4ffffff                     mov        esi, 0xffffffe4
026d9 48ff742408                     push       qword ptr [rsp + 8]
026de 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
026e6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026eb 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
026f3 48ff742420                     push       qword ptr [rsp + 0x20]
026f8 488f442408                     pop        qword ptr [rsp + 8]
026fd 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02702 4489542404                     mov        dword ptr [rsp + 4], r10d
02707 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0270c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02711 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02716 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0271b 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02720 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02725 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0272a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0272f 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02734 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02739 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0273e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02743 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02748 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0274d 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
02752 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
02757 90                             nop        
02758 c5f877                         vzeroupper 
0275b e80004afff                     call       0x7f63db6ea760
02760 0f1f84005828001e               nop        dword ptr [rax + rax + 0x1e002858]
02768 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02772 4883e4f0                       and        rsp, 0xfffffffffffffff0
02776 e88565b318                     call       0x7f63f4730900
0277b f4                             hlt        
0277c bee4ffffff                     mov        esi, 0xffffffe4
02781 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02786 448b1424                       mov        r10d, dword ptr [rsp]
0278a 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02792 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02797 4c891424                       mov        qword ptr [rsp], r10
0279b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
027a0 4c89542408                     mov        qword ptr [rsp + 8], r10
027a5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
027aa 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
027b2 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
027b7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
027bc 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
027c1 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
027c6 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
027cb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
027d0 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
027d5 4c89542428                     mov        qword ptr [rsp + 0x28], r10
027da 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
027df 4c89542430                     mov        qword ptr [rsp + 0x30], r10
027e4 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
027e9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
027ee 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
027f3 4489542444                     mov        dword ptr [rsp + 0x44], r10d
027f8 44896c245c                     mov        dword ptr [rsp + 0x5c], r13d
027fd 90                             nop        
027fe 90                             nop        
027ff 90                             nop        
02800 c5f877                         vzeroupper 
02803 e85803afff                     call       0x7f63db6ea760
02808 0f1f84000029001f               nop        dword ptr [rax + rax + 0x1f002900]
02810 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0281a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0281e e8dd64b318                     call       0x7f63f4730900
02823 f4                             hlt        
02824 beccffffff                     mov        esi, 0xffffffcc
02829 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0282e 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02833 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
0283b 448b1c24                       mov        r11d, dword ptr [rsp]
0283f 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02847 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0284c 4c891424                       mov        qword ptr [rsp], r10
02850 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02855 4c89542408                     mov        qword ptr [rsp + 8], r10
0285a 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0285f 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02867 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0286c 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02871 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02876 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0287b 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02880 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02885 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0288a 4c89542428                     mov        qword ptr [rsp + 0x28], r10
0288f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02894 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02899 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
0289e 4c89542438                     mov        qword ptr [rsp + 0x38], r10
028a3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
028a8 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
028ad 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
028b2 4489542444                     mov        dword ptr [rsp + 0x44], r10d
028b7 44896c2460                     mov        dword ptr [rsp + 0x60], r13d
028bc c5f877                         vzeroupper 
028bf e89c02afff                     call       0x7f63db6ea760
028c4 0f1f8400bc290020               nop        dword ptr [rax + rax + 0x200029bc]
028cc 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
028d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028da e82164b318                     call       0x7f63f4730900
028df f4                             hlt        
028e0 be45ffffff                     mov        esi, 0xffffff45
028e5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028ea 448b1424                       mov        r10d, dword ptr [rsp]
028ee 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
028f6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028fb 4c891424                       mov        qword ptr [rsp], r10
028ff 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02904 4c89542408                     mov        qword ptr [rsp + 8], r10
02909 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0290e 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02916 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0291b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02920 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02925 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0292a 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0292f 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02934 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02939 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0293e 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02943 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02948 44896c2454                     mov        dword ptr [rsp + 0x54], r13d
0294d 90                             nop        
0294e 90                             nop        
0294f 90                             nop        
02950 c5f877                         vzeroupper 
02953 e80802afff                     call       0x7f63db6ea760
02958 0f1f8400502a0021               nop        dword ptr [rax + rax + 0x21002a50]
02960 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0296a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0296e e88d63b318                     call       0x7f63f4730900
02973 f4                             hlt        
02974 be17000000                     mov        esi, 0x17
02979 90                             nop        
0297a 90                             nop        
0297b 90                             nop        
0297c c5f877                         vzeroupper 
0297f e8dc01afff                     call       0x7f63db6ea760
02984 0f1f84007c2a0022               nop        dword ptr [rax + rax + 0x22002a7c]
0298c 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02996 4883e4f0                       and        rsp, 0xfffffffffffffff0
0299a e86163b318                     call       0x7f63f4730900
0299f f4                             hlt        
029a0 be6effffff                     mov        esi, 0xffffff6e
029a5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
029aa 4c89b424f0000000               mov        qword ptr [rsp + 0xf0], r14
029b2 4c895c2408                     mov        qword ptr [rsp + 8], r11
029b7 895c2418                       mov        dword ptr [rsp + 0x18], ebx
029bb 48894424f8                     mov        qword ptr [rsp - 8], rax
029c0 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
029c4 89442420                       mov        dword ptr [rsp + 0x20], eax
029c8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
029cd 48ff742430                     push       qword ptr [rsp + 0x30]
029d2 488f442428                     pop        qword ptr [rsp + 0x28]
029d7 89542424                       mov        dword ptr [rsp + 0x24], edx
029db 4c89442430                     mov        qword ptr [rsp + 0x30], r8
029e0 48ff742448                     push       qword ptr [rsp + 0x48]
029e5 488f442438                     pop        qword ptr [rsp + 0x38]
029ea 894c2440                       mov        dword ptr [rsp + 0x40], ecx
029ee 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
029f3 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
029f8 c5f877                         vzeroupper 
029fb e86001afff                     call       0x7f63db6ea760
02a00 0f1f8400f82a0023               nop        dword ptr [rax + rax + 0x23002af8]
02a08 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02a12 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a16 e8e562b318                     call       0x7f63f4730900
02a1b f4                             hlt        
02a1c bebeffffff                     mov        esi, 0xffffffbe
02a21 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02a26 4c89b424f0000000               mov        qword ptr [rsp + 0xf0], r14
02a2e 448b1424                       mov        r10d, dword ptr [rsp]
02a32 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02a3a 4c891c24                       mov        qword ptr [rsp], r11
02a3e 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a43 4c89542408                     mov        qword ptr [rsp + 8], r10
02a48 4889442410                     mov        qword ptr [rsp + 0x10], rax
02a4d 895c2418                       mov        dword ptr [rsp + 0x18], ebx
02a51 48894424f8                     mov        qword ptr [rsp - 8], rax
02a56 8b44242c                       mov        eax, dword ptr [rsp + 0x2c]
02a5a 89442420                       mov        dword ptr [rsp + 0x20], eax
02a5e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a63 48ff742430                     push       qword ptr [rsp + 0x30]
02a68 488f442428                     pop        qword ptr [rsp + 0x28]
02a6d 89542424                       mov        dword ptr [rsp + 0x24], edx
02a71 4c89442430                     mov        qword ptr [rsp + 0x30], r8
02a76 48ff742448                     push       qword ptr [rsp + 0x48]
02a7b 488f442438                     pop        qword ptr [rsp + 0x38]
02a80 894c2440                       mov        dword ptr [rsp + 0x40], ecx
02a84 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
02a89 44896c2448                     mov        dword ptr [rsp + 0x48], r13d
02a8e 90                             nop        
02a8f 90                             nop        
02a90 c5f877                         vzeroupper 
02a93 e8c800afff                     call       0x7f63db6ea760
02a98 0f1f8400902b0024               nop        dword ptr [rax + rax + 0x24002b90]
02aa0 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02aaa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aae e84d62b318                     call       0x7f63f4730900
02ab3 f4                             hlt        
02ab4 4c8b742468                     mov        r14, qword ptr [rsp + 0x68]
02ab9 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
02abd beccffffff                     mov        esi, 0xffffffcc
02ac2 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02ac7 4c89b424f8000000               mov        qword ptr [rsp + 0xf8], r14
02acf 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
02ad7 891c24                         mov        dword ptr [rsp], ebx
02ada 44895c2404                     mov        dword ptr [rsp + 4], r11d
02adf 448944240c                     mov        dword ptr [rsp + 0xc], r8d
02ae4 c5f877                         vzeroupper 
02ae7 e87400afff                     call       0x7f63db6ea760
02aec 0f1f8400e42b0025               nop        dword ptr [rax + rax + 0x25002be4]
02af4 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02afe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b02 e8f961b318                     call       0x7f63f4730900
02b07 f4                             hlt        
02b08 bee4ffffff                     mov        esi, 0xffffffe4
02b0d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b12 448b1c24                       mov        r11d, dword ptr [rsp]
02b16 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02b1e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02b23 4c891424                       mov        qword ptr [rsp], r10
02b27 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02b2c 4c89542408                     mov        qword ptr [rsp + 8], r10
02b31 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02b36 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
02b3e 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02b43 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b48 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02b4d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02b52 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02b57 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02b5c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02b61 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02b66 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b6b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b70 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02b75 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b7a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02b7f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02b84 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02b89 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02b8e 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02b92 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02b97 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02b9c c5f877                         vzeroupper 
02b9f e8bcffaeff                     call       0x7f63db6ea760
02ba4 0f1f84009c2c0026               nop        dword ptr [rax + rax + 0x26002c9c]
02bac 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02bb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bba e84161b318                     call       0x7f63f4730900
02bbf f4                             hlt        
02bc0 bee4ffffff                     mov        esi, 0xffffffe4
02bc5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02bca 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02bd2 448b1424                       mov        r10d, dword ptr [rsp]
02bd6 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02bde 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02be3 4c891424                       mov        qword ptr [rsp], r10
02be7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02bec 4c89542408                     mov        qword ptr [rsp + 8], r10
02bf1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02bf6 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02bfe 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02c03 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02c08 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02c0d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02c12 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02c17 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02c1c 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02c21 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02c26 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02c2b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02c30 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02c35 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c3a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02c3f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02c44 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02c49 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02c4e 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02c52 4489742460                     mov        dword ptr [rsp + 0x60], r14d
02c57 c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
02c5d 90                             nop        
02c5e 90                             nop        
02c5f 90                             nop        
02c60 c5f877                         vzeroupper 
02c63 e8f8feaeff                     call       0x7f63db6ea760
02c68 0f1f8400602d0027               nop        dword ptr [rax + rax + 0x27002d60]
02c70 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02c7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c7e e87d60b318                     call       0x7f63f4730900
02c83 f4                             hlt        
02c84 448b9424a8000000               mov        r10d, dword ptr [rsp + 0xa8]
02c8c beccffffff                     mov        esi, 0xffffffcc
02c91 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c96 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
02c9b 4c899c24f0000000               mov        qword ptr [rsp + 0xf0], r11
02ca3 448b1c24                       mov        r11d, dword ptr [rsp]
02ca7 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02caf 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02cb4 4c891c24                       mov        qword ptr [rsp], r11
02cb8 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
02cbd 4c895c2408                     mov        qword ptr [rsp + 8], r11
02cc2 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
02cc7 44898424fc000000               mov        dword ptr [rsp + 0xfc], r8d
02ccf 4c8b5c2458                     mov        r11, qword ptr [rsp + 0x58]
02cd4 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
02cd9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
02cde 4489442418                     mov        dword ptr [rsp + 0x18], r8d
02ce3 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02ce8 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
02ced 4c8b5c2430                     mov        r11, qword ptr [rsp + 0x30]
02cf2 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
02cf7 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
02cfc 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
02d01 4c8b5c2448                     mov        r11, qword ptr [rsp + 0x48]
02d06 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
02d0b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02d10 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02d15 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
02d1a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
02d1f 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
02d24 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02d29 90                             nop        
02d2a 90                             nop        
02d2b 90                             nop        
02d2c c5f877                         vzeroupper 
02d2f e82cfeaeff                     call       0x7f63db6ea760
02d34 0f1f84002c2e0028               nop        dword ptr [rax + rax + 0x28002e2c]
02d3c 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02d46 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d4a e8b15fb318                     call       0x7f63f4730900
02d4f f4                             hlt        
02d50 418bee                         mov        ebp, r14d
02d53 83c510                         add        ebp, 0x10
02d56 be6effffff                     mov        esi, 0xffffff6e
02d5b 48ff742408                     push       qword ptr [rsp + 8]
02d60 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
02d68 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02d6d 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02d75 48ff742420                     push       qword ptr [rsp + 0x20]
02d7a 488f442408                     pop        qword ptr [rsp + 8]
02d7f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02d84 44895c2404                     mov        dword ptr [rsp + 4], r11d
02d89 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02d8e 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02d93 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02d98 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02d9d 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02da2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02da7 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02dac 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02db1 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02db6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02dbb 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02dc0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02dc5 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02dca 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02dce 48894424f8                     mov        qword ptr [rsp - 8], rax
02dd3 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02dda 89442468                       mov        dword ptr [rsp + 0x68], eax
02dde 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02de3 90                             nop        
02de4 c5f877                         vzeroupper 
02de7 e874fdaeff                     call       0x7f63db6ea760
02dec 0f1f8400e42e0029               nop        dword ptr [rax + rax + 0x29002ee4]
02df4 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e02 e8f95eb318                     call       0x7f63f4730900
02e07 f4                             hlt        
02e08 418bee                         mov        ebp, r14d
02e0b 83c510                         add        ebp, 0x10
02e0e be66ffffff                     mov        esi, 0xffffff66
02e13 48ff742408                     push       qword ptr [rsp + 8]
02e18 488f8424f0000000               pop        qword ptr [rsp + 0xf0]
02e20 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02e25 4c899424f8000000               mov        qword ptr [rsp + 0xf8], r10
02e2d 48ff742420                     push       qword ptr [rsp + 0x20]
02e32 488f442408                     pop        qword ptr [rsp + 8]
02e37 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02e3c 4489542404                     mov        dword ptr [rsp + 4], r10d
02e41 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02e46 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02e4b 4489742424                     mov        dword ptr [rsp + 0x24], r14d
02e50 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
02e55 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02e5a 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e5f 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02e64 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02e69 4c89542440                     mov        qword ptr [rsp + 0x40], r10
02e6e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02e73 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02e78 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02e7d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02e82 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02e86 48894424f8                     mov        qword ptr [rsp - 8], rax
02e8b 8b84249c000000                 mov        eax, dword ptr [rsp + 0x9c]
02e92 89442468                       mov        dword ptr [rsp + 0x68], eax
02e96 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02e9b 90                             nop        
02e9c c5f877                         vzeroupper 
02e9f e8bcfcaeff                     call       0x7f63db6ea760
02ea4 0f1f84009c2f002a               nop        dword ptr [rax + rax + 0x2a002f9c]
02eac 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02eb6 4883e4f0                       and        rsp, 0xfffffffffffffff0
02eba e8415eb318                     call       0x7f63f4730900
02ebf f4                             hlt        
02ec0 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
02eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ece e82d5eb318                     call       0x7f63f4730900
02ed3 f4                             hlt        
02ed4 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
02ede 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ee2 e8195eb318                     call       0x7f63f4730900
02ee7 f4                             hlt        
02ee8 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
02ef2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ef6 e8055eb318                     call       0x7f63f4730900
02efb f4                             hlt        
02efc 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
02f06 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f0a e8f15db318                     call       0x7f63f4730900
02f0f f4                             hlt        
02f10 bee4ffffff                     mov        esi, 0xffffffe4
02f15 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02f1a 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02f1f 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02f27 448b1424                       mov        r10d, dword ptr [rsp]
02f2b 44899424f8000000               mov        dword ptr [rsp + 0xf8], r10d
02f33 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02f38 4c891424                       mov        qword ptr [rsp], r10
02f3c 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02f41 4c89542408                     mov        qword ptr [rsp + 8], r10
02f46 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02f4b 44899c24fc000000               mov        dword ptr [rsp + 0xfc], r11d
02f53 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
02f58 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02f5d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02f62 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02f67 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
02f6c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02f71 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
02f76 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02f7b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f80 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f85 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
02f8a 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02f8f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02f94 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02f99 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02f9e 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02fa3 44896c2464                     mov        dword ptr [rsp + 0x64], r13d
02fa8 c5f877                         vzeroupper 
02fab e8b0fbaeff                     call       0x7f63db6ea760
02fb0 0f1f8400a830002b               nop        dword ptr [rax + rax + 0x2b0030a8]
02fb8 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
02fc2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02fc6 e8355db318                     call       0x7f63f4730900
02fcb f4                             hlt        
02fcc bee4ffffff                     mov        esi, 0xffffffe4
02fd1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02fd6 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02fdb 4c899424f0000000               mov        qword ptr [rsp + 0xf0], r10
02fe3 448b1c24                       mov        r11d, dword ptr [rsp]
02fe7 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
02fef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02ff4 4c891424                       mov        qword ptr [rsp], r10
02ff8 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02ffd 4c89542408                     mov        qword ptr [rsp + 8], r10
03002 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03007 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
0300f 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03014 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03019 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0301e 4489542418                     mov        dword ptr [rsp + 0x18], r10d
03023 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
03028 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0302d 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
03032 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03037 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0303c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03041 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
03046 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0304b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
03050 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
03055 894c2460                       mov        dword ptr [rsp + 0x60], ecx
03059 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0305e 90                             nop        
0305f 90                             nop        
03060 c5f877                         vzeroupper 
03063 e8f8faaeff                     call       0x7f63db6ea760
03068 0f1f84006031002c               nop        dword ptr [rax + rax + 0x2c003160]
03070 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0307a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0307e e87d5cb318                     call       0x7f63f4730900
03083 f4                             hlt        
03084 448bd9                         mov        r11d, ecx
03087 4183c308                       add        r11d, 8
0308b 458bcb                         mov        r9d, r11d
0308e be6effffff                     mov        esi, 0xffffff6e
03093 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03098 448b1c24                       mov        r11d, dword ptr [rsp]
0309c 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
030a4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
030a9 4c891424                       mov        qword ptr [rsp], r10
030ad 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
030b2 4c89542408                     mov        qword ptr [rsp + 8], r10
030b7 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
030bc 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
030c4 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
030c9 4c89542410                     mov        qword ptr [rsp + 0x10], r10
030ce 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
030d3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
030d8 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
030dd 4c89542428                     mov        qword ptr [rsp + 0x28], r10
030e2 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
030e7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
030ec 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
030f1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
030f6 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
030fe 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
03103 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
03108 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0310d 90                             nop        
0310e 90                             nop        
0310f 90                             nop        
03110 c5f877                         vzeroupper 
03113 e848faaeff                     call       0x7f63db6ea760
03118 0f1f84001032002d               nop        dword ptr [rax + rax + 0x2d003210]
03120 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
0312a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0312e e8cd5bb318                     call       0x7f63f4730900
03133 f4                             hlt        
03134 448bd1                         mov        r10d, ecx
03137 4183c208                       add        r10d, 8
0313b 458bca                         mov        r9d, r10d
0313e be66ffffff                     mov        esi, 0xffffff66
03143 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
03148 448b1c24                       mov        r11d, dword ptr [rsp]
0314c 44899c24f8000000               mov        dword ptr [rsp + 0xf8], r11d
03154 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
03159 4c891424                       mov        qword ptr [rsp], r10
0315d 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
03162 4c89542408                     mov        qword ptr [rsp + 8], r10
03167 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0316c 44899424fc000000               mov        dword ptr [rsp + 0xfc], r10d
03174 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
03179 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0317e 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
03183 4489542420                     mov        dword ptr [rsp + 0x20], r10d
03188 4c8b542430                     mov        r10, qword ptr [rsp + 0x30]
0318d 4c89542428                     mov        qword ptr [rsp + 0x28], r10
03192 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03197 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0319c 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
031a1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
031a6 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
031ae 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
031b3 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
031b8 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
031bd 90                             nop        
031be 90                             nop        
031bf 90                             nop        
031c0 c5f877                         vzeroupper 
031c3 e898f9aeff                     call       0x7f63db6ea760
031c8 0f1f8400c032002e               nop        dword ptr [rax + rax + 0x2e0032c0]
031d0 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
031da 4883e4f0                       and        rsp, 0xfffffffffffffff0
031de e81d5bb318                     call       0x7f63f4730900
031e3 f4                             hlt        
031e4 448bca                         mov        r9d, edx
031e7 e933e3ffff                     jmp        0x7f63dbbf911f
031ec 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
031f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
031fa e8015bb318                     call       0x7f63f4730900
031ff f4                             hlt        
03200 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
0320a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0320e e8ed5ab318                     call       0x7f63f4730900
03213 f4                             hlt        
03214 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
0321e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03222 e8d95ab318                     call       0x7f63f4730900
03227 f4                             hlt        
03228 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
03232 4883e4f0                       and        rsp, 0xfffffffffffffff0
03236 e8c55ab318                     call       0x7f63f4730900
0323b f4                             hlt        
0323c 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
03246 4883e4f0                       and        rsp, 0xfffffffffffffff0
0324a e8b15ab318                     call       0x7f63f4730900
0324f f4                             hlt        
03250 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
0325a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0325e e89d5ab318                     call       0x7f63f4730900
03263 f4                             hlt        
03264 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
0326e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03272 e8895ab318                     call       0x7f63f4730900
03277 f4                             hlt        
03278 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
03282 4883e4f0                       and        rsp, 0xfffffffffffffff0
03286 e8755ab318                     call       0x7f63f4730900
0328b f4                             hlt        
0328c 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
03296 4883e4f0                       and        rsp, 0xfffffffffffffff0
0329a e8615ab318                     call       0x7f63f4730900
0329f f4                             hlt        
032a0 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
032aa 4883e4f0                       and        rsp, 0xfffffffffffffff0
032ae e84d5ab318                     call       0x7f63f4730900
032b3 f4                             hlt        
032b4 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
032be 4883e4f0                       and        rsp, 0xfffffffffffffff0
032c2 e8395ab318                     call       0x7f63f4730900
032c7 f4                             hlt        
032c8 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
032d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
032d6 e8255ab318                     call       0x7f63f4730900
032db f4                             hlt        
032dc 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
032e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
032ea e8115ab318                     call       0x7f63f4730900
032ef f4                             hlt        
032f0 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
032fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
032fe e8fd59b318                     call       0x7f63f4730900
03303 f4                             hlt        
03304 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
0330e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03312 e8e959b318                     call       0x7f63f4730900
03317 f4                             hlt        
03318 48bfe0d741b4637f0000           movabs     rdi, 0x7f63b441d7e0
03322 4883e4f0                       and        rsp, 0xfffffffffffffff0
03326 e8d559b318                     call       0x7f63f4730900
0332b f4                             hlt        
0332c bef6ffffff                     mov        esi, 0xfffffff6
03331 498bee                         mov        rbp, r14
03334 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0333c c5f877                         vzeroupper 
0333f e81cf8aeff                     call       0x7f63db6ea760
03344 0f1f84003c34002f               nop        dword ptr [rax + rax + 0x2f00343c]
0334c 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
03356 4883e4f0                       and        rsp, 0xfffffffffffffff0
0335a e8a159b318                     call       0x7f63f4730900
0335f f4                             hlt        
03360 488bf0                         mov        rsi, rax
03363 eb0d                           jmp        0x7f63dbbfaf72
03365 488bf0                         mov        rsi, rax
03368 eb08                           jmp        0x7f63dbbfaf72
0336a 488bf0                         mov        rsi, rax
0336d eb03                           jmp        0x7f63dbbfaf72
0336f 488bf0                         mov        rsi, rax
03372 c5f877                         vzeroupper 
03375 4881c4e0000000                 add        rsp, 0xe0
0337c 5d                             pop        rbp
0337d e9de7faeff                     jmp        0x7f63db6e2f60
03382 bef6ffffff                     mov        esi, 0xfffffff6
03387 90                             nop        
03388 c5f877                         vzeroupper 
0338b e8d0f7aeff                     call       0x7f63db6ea760
03390 0f1f840088340030               nop        dword ptr [rax + rax + 0x30003488]
03398 48bf60fb7bb4637f0000           movabs     rdi, 0x7f63b47bfb60
033a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
033a6 e85559b318                     call       0x7f63f4730900
033ab f4                             hlt        
033ac 49baf58abfdb637f0000           movabs     r10, 0x7f63dbbf8af5
033b6 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
033bd e99eb3b4ff                     jmp        0x7f63db746360
033c2 e81982b3ff                     call       0x7f63db7331e0
033c7 e972ccffff                     jmp        0x7f63dbbf7c3e
033cc f4                             hlt        
033cd f4                             hlt        
033ce f4                             hlt        
033cf f4                             hlt        
