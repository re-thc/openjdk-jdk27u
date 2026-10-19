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
0001a 0f85c0a1b3ff                   jne        0x7f63db742d60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0000000                 sub        rsp, 0xd0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f85cb3b0000                   jne        0x7f63dbc0c789
0003e 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00043 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00047 498bd8                         mov        rbx, r8
0004a 448bdf                         mov        r11d, edi
0004d 4c8bf6                         mov        r14, rsi
00050 448b463c                       mov        r8d, dword ptr [rsi + 0x3c]
00054 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00059 448b5638                       mov        r10d, dword ptr [rsi + 0x38]
0005d 458bca                         mov        r9d, r10d
00060 452bc8                         sub        r9d, r8d
00063 448b8424e0000000               mov        r8d, dword ptr [rsp + 0xe0]
0006b 453bc1                         cmp        r8d, r9d
0006e 0f8f60310000                   jg         0x7f63dbc0bd54
00074 4c8b4e08                       mov        r9, qword ptr [rsi + 8]
00078 4c894c2428                     mov        qword ptr [rsp + 0x28], r9
0007d 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00081 48638c24e0000000               movsxd     rcx, dword ptr [rsp + 0xe0]
00089 48637c2464                     movsxd     rdi, dword ptr [rsp + 0x64]
0008e 48037c2428                     add        rdi, qword ptr [rsp + 0x28]
00093 4c2bcf                         sub        r9, rdi
00096 493bc9                         cmp        rcx, r9
00099 0f8f35310000                   jg         0x7f63dbc0bd54
0009f 4c8b4610                       mov        r8, qword ptr [rsi + 0x10]
000a3 4c89442440                     mov        qword ptr [rsp + 0x40], r8
000a8 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000ac 4d85c0                         test       r8, r8
000af 0f8488140000                   je         0x7f63dbc0a0bd
000b5 33ff                           xor        edi, edi
000b7 4c8bea                         mov        r13, rdx
000ba 8b7208                         mov        esi, dword ptr [rdx + 8]
000bd 458b4e44                       mov        r9d, dword ptr [r14 + 0x44]
000c1 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
000c9 418beb                         mov        ebp, r11d
000cc 4585db                         test       r11d, r11d
000cf 0f8e17290000                   jle        0x7f63dbc0b56c
000d5 4c2b442428                     sub        r8, qword ptr [rsp + 0x28]
000da 448d4ee0                       lea        r9d, [rsi - 0x20]
000de 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
000e6 418d4ae0                       lea        ecx, [r10 - 0x20]
000ea 4c8bdb                         mov        r11, rbx
000ed 458b5308                       mov        r10d, dword ptr [r11 + 8]
000f1 4585d2                         test       r10d, r10d
000f4 0f8606310000                   jbe        0x7f63dbc0bd80
000fa 4d63d2                         movsxd     r10, r10d
000fd 4863dd                         movsxd     rbx, ebp
00100 48ffcb                         dec        rbx
00103 493bda                         cmp        rbx, r10
00106 0f83f4300000                   jae        0x7f63dbc0bd80
0010c 488b9424e8000000               mov        rdx, qword ptr [rsp + 0xe8]
00114 8b5a08                         mov        ebx, dword ptr [rdx + 8]
00117 85db                           test       ebx, ebx
00119 0f8645310000                   jbe        0x7f63dbc0bde4
0011f 83fb01                         cmp        ebx, 1
00122 0f863c310000                   jbe        0x7f63dbc0bde4
00128 83fb02                         cmp        ebx, 2
0012b 0f8633310000                   jbe        0x7f63dbc0bde4
00131 448d56f1                       lea        r10d, [rsi - 0xf]
00135 4585d2                         test       r10d, r10d
00138 0f8c26310000                   jl         0x7f63dbc0bde4
0013e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00146 418b4208                       mov        eax, dword ptr [r10 + 8]
0014a 448d50f1                       lea        r10d, [rax - 0xf]
0014e 4585d2                         test       r10d, r10d
00151 0f8c0d310000                   jl         0x7f63dbc0bde4
00157 448d50fd                       lea        r10d, [rax - 3]
0015b 4585d2                         test       r10d, r10d
0015e 0f8c00310000                   jl         0x7f63dbc0bde4
00164 448d50f9                       lea        r10d, [rax - 7]
00168 4585d2                         test       r10d, r10d
0016b 0f8cf3300000                   jl         0x7f63dbc0bde4
00171 8944241c                       mov        dword ptr [rsp + 0x1c], eax
00175 899c24ec000000                 mov        dword ptr [rsp + 0xec], ebx
0017c 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00180 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00185 89b424e8000000                 mov        dword ptr [rsp + 0xe8], esi
0018c 897c2430                       mov        dword ptr [rsp + 0x30], edi
00190 4c89442438                     mov        qword ptr [rsp + 0x38], r8
00195 4889542450                     mov        qword ptr [rsp + 0x50], rdx
0019a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0019f 896c2418                       mov        dword ptr [rsp + 0x18], ebp
001a3 4c896c2468                     mov        qword ptr [rsp + 0x68], r13
001a8 4c89742478                     mov        qword ptr [rsp + 0x78], r14
001ad 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
001b5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001ba 448bd0                         mov        r10d, eax
001bd 448bde                         mov        r11d, esi
001c0 458d4afd                       lea        r9d, [r10 - 3]
001c4 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
001cc 4d63c3                         movsxd     r8, r11d
001cf 4183c3f1                       add        r11d, -0xf
001d3 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
001db 4983c0f1                       add        r8, -0xf
001df 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
001e7 458d5af9                       lea        r11d, [r10 - 7]
001eb 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
001f3 4d63da                         movsxd     r11, r10d
001f6 4183c2f1                       add        r10d, -0xf
001fa 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
00202 4d8d53f1                       lea        r10, [r11 - 0xf]
00206 4c899424a0000000               mov        qword ptr [rsp + 0xa0], r10
0020e 4983c3f9                       add        r11, -7
00212 4c899c24a8000000               mov        qword ptr [rsp + 0xa8], r11
0021a 4533c9                         xor        r9d, r9d
0021d 4533c0                         xor        r8d, r8d
00220 e9fc040000                     jmp        0x7f63dbc092a1
00225 448bdd                         mov        r11d, ebp
00228 4d63d3                         movsxd     r10, r11d
0022b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00232 c442a8f5db                     bzhi       r11, r11, r10
00237 c4c1fb92fb                     kmovq      k7, r11
0023c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00242 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00248 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00250 4403dd                         add        r11d, ebp
00253 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
0025b 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0025f 418502                         test       dword ptr [r10], eax
00262 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00267 0f8d58080000                   jge        0x7f63dbc09645
0026d 4489b424b4000000               mov        dword ptr [rsp + 0xb4], r14d
00275 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
0027d 442b8c24b0000000               sub        r9d, dword ptr [rsp + 0xb0]
00285 8b6c245c                       mov        ebp, dword ptr [rsp + 0x5c]
00289 2bac24b0000000                 sub        ebp, dword ptr [rsp + 0xb0]
00290 3bac24b0000000                 cmp        ebp, dword ptr [rsp + 0xb0]
00297 448bb424b0000000               mov        r14d, dword ptr [rsp + 0xb0]
0029f 410f4fee                       cmovg      ebp, r14d
002a3 4585c9                         test       r9d, r9d
002a6 0f8c04210000                   jl         0x7f63dbc0af30
002ac 448bb424b4000000               mov        r14d, dword ptr [rsp + 0xb4]
002b4 4585f6                         test       r14d, r14d
002b7 0f8cf3200000                   jl         0x7f63dbc0af30
002bd 458d1429                       lea        r10d, [r9 + rbp]
002c1 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
002c6 453bc2                         cmp        r8d, r10d
002c9 0f82e1200000                   jb         0x7f63dbc0af30
002cf 4403f5                         add        r14d, ebp
002d2 453bc6                         cmp        r8d, r14d
002d5 0f82d5200000                   jb         0x7f63dbc0af30
002db 85ed                           test       ebp, ebp
002dd 0f8ccd200000                   jl         0x7f63dbc0af30
002e3 85ed                           test       ebp, ebp
002e5 0f845dffffff                   je         0x7f63dbc08dc8
002eb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
002f3 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
002fb 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
00300 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
00305 4863d5                         movsxd     rdx, ebp
00308 4883fa20                       cmp        rdx, 0x20
0030c 0f8613ffffff                   jbe        0x7f63dbc08da5
00312 c5f877                         vzeroupper 
00315 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
0031f 41ffd2                         call       r10
00322 0f1f840000000000               nop        dword ptr [rax + rax]
0032a e919ffffff                     jmp        0x7f63dbc08dc8
0032f 458beb                         mov        r13d, r11d
00332 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0033a 4585db                         test       r11d, r11d
0033d 0f8ebd150000                   jle        0x7f63dbc0a480
00343 458d1c01                       lea        r11d, [r9 + rax]
00347 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0034c 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00351 4403db                         add        r11d, ebx
00354 443b5c2448                     cmp        r11d, dword ptr [rsp + 0x48]
00359 0f8ffd110000                   jg         0x7f63dbc0a0dc
0035f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00364 443b542458                     cmp        r10d, dword ptr [rsp + 0x58]
00369 0f8f35170000                   jg         0x7f63dbc0a624
0036f 83f810                         cmp        eax, 0x10
00372 0f8f00080000                   jg         0x7f63dbc096f8
00378 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00380 0f835f120000                   jae        0x7f63dbc0a165
00386 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0038b c4817a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 0xc]
00392 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00397 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
0039f 0f83fb120000                   jae        0x7f63dbc0a220
003a5 468d1408                       lea        r10d, [rax + r9]
003a9 4489542460                     mov        dword ptr [rsp + 0x60], r10d
003ae 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
003b3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
003bb c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
003c2 468d1400                       lea        r10d, [rax + r8]
003c6 4489542464                     mov        dword ptr [rsp + 0x64], r10d
003cb 458bf2                         mov        r14d, r10d
003ce 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
003d6 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
003da 83fb10                         cmp        ebx, 0x10
003dd 7f56                           jg         0x7f63dbc08fb5
003df 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003e6 83fb10                         cmp        ebx, 0x10
003e9 7c4a                           jl         0x7f63dbc08fb5
003eb 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
003f3 0f8373130000                   jae        0x7f63dbc0a2ec
003f9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00401 c4817a6f44320c                 vmovdqu    xmm0, xmmword ptr [r10 + r14 + 0xc]
00408 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0040c 3b9c249c000000                 cmp        ebx, dword ptr [rsp + 0x9c]
00413 0f831b140000                   jae        0x7f63dbc0a3b4
00419 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
0041e c4817a7f442a0c                 vmovdqu    xmmword ptr [r10 + r13 + 0xc], xmm0
00425 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
00429 4103dd                         add        ebx, r13d
0042c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00430 e9d1020000                     jmp        0x7f63dbc09286
00435 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0043d 4b8d7c330c                     lea        rdi, [r11 + r14 + 0xc]
00442 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00446 498d741b0c                     lea        rsi, [r11 + rbx + 0xc]
0044b 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
0044f 035c2464                       add        ebx, dword ptr [rsp + 0x64]
00453 4c63cb                         movsxd     r9, ebx
00456 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0045e 443b5c245c                     cmp        r11d, dword ptr [rsp + 0x5c]
00463 0f8cb6040000                   jl         0x7f63dbc0949f
00469 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0046e 4183fa30                       cmp        r10d, 0x30
00472 0f8e8b000000                   jle        0x7f63dbc09083
00478 4585f6                         test       r14d, r14d
0047b 0f8c171c0000                   jl         0x7f63dbc0ac18
00481 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00486 4585db                         test       r11d, r11d
00489 0f8c091c0000                   jl         0x7f63dbc0ac18
0048f 4503d6                         add        r10d, r14d
00492 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
00497 453bc2                         cmp        r8d, r10d
0049a 0f82f81b0000                   jb         0x7f63dbc0ac18
004a0 443bc3                         cmp        r8d, ebx
004a3 0f82ef1b0000                   jb         0x7f63dbc0ac18
004a9 8b5c245c                       mov        ebx, dword ptr [rsp + 0x5c]
004ad 85db                           test       ebx, ebx
004af 0f8445020000                   je         0x7f63dbc0927a
004b5 4863d3                         movsxd     rdx, ebx
004b8 4883fa20                       cmp        rdx, 0x20
004bc 7728                           ja         0x7f63dbc09066
004be 448bd3                         mov        r10d, ebx
004c1 4d63d2                         movsxd     r10, r10d
004c4 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
004cb c442a8f5db                     bzhi       r11, r11, r10
004d0 c4c1fb92fb                     kmovq      k7, r11
004d5 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
004db 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
004e1 e914020000                     jmp        0x7f63dbc0927a
004e6 c5f877                         vzeroupper 
004e9 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
004f3 41ffd2                         call       r10
004f6 0f1f840000000000               nop        dword ptr [rax + rax]
004fe e9f7010000                     jmp        0x7f63dbc0927a
00503 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
0050b 0f834f160000                   jae        0x7f63dbc0a6e0
00511 4963ce                         movsxd     rcx, r14d
00514 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0051c 4d8b440a0c                     mov        r8, qword ptr [r10 + rcx + 0xc]
00521 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00526 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0052e 0f83fc160000                   jae        0x7f63dbc0a7b0
00534 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00539 458d5a08                       lea        r11d, [r10 + 8]
0053d 4963fa                         movsxd     rdi, r10d
00540 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
00547 4c89443a0c                     mov        qword ptr [rdx + rdi + 0xc], r8
0054c 443bdb                         cmp        r11d, ebx
0054f 0f8da5010000                   jge        0x7f63dbc0927a
00555 482bcf                         sub        rcx, rdi
00558 4963fb                         movsxd     rdi, r11d
0055b 4c8d040f                       lea        r8, [rdi + rcx]
0055f 4c3b8424a8000000               cmp        r8, qword ptr [rsp + 0xa8]
00567 0f831b190000                   jae        0x7f63dbc0aa08
0056d 4d8bc1                         mov        r8, r9
00570 4c2bc7                         sub        r8, rdi
00573 4983c007                       add        r8, 7
00577 4983e0f8                       and        r8, 0xfffffffffffffff8
0057b 458bc0                         mov        r8d, r8d
0057e 438d7c1008                     lea        edi, [r8 + r10 + 8]
00583 4c63c7                         movsxd     r8, edi
00586 498d7c08f8                     lea        rdi, [r8 + rcx - 8]
0058b 483bbc24a8000000               cmp        rdi, qword ptr [rsp + 0xa8]
00593 0f83ef180000                   jae        0x7f63dbc0aa08
00599 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
005a1 0f83e1180000                   jae        0x7f63dbc0aa08
005a7 4983c0f8                       add        r8, -8
005ab 4c3b8424a8000000               cmp        r8, qword ptr [rsp + 0xa8]
005b3 0f83cf180000                   jae        0x7f63dbc0aa08
005b9 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
005bf 0f8f8f190000                   jg         0x7f63dbc0aad4
005c5 452bf2                         sub        r14d, r10d
005c8 4183c210                       add        r10d, 0x10
005cc 478d041e                       lea        r8d, [r14 + r11]
005d0 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
005d7 4e8b44070c                     mov        r8, qword ptr [rdi + r8 + 0xc]
005dc 418bfb                         mov        edi, r11d
005df 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
005e6 4c89443a0c                     mov        qword ptr [rdx + rdi + 0xc], r8
005eb 458d4308                       lea        r8d, [r11 + 8]
005ef 453bc2                         cmp        r8d, r10d
005f2 7d05                           jge        0x7f63dbc09179
005f4 458bd8                         mov        r11d, r8d
005f7 ebd3                           jmp        0x7f63dbc0914c
005f9 4983c1f8                       add        r9, -8
005fd 4981f900000080                 cmp        r9, -0x80000000
00604 49c7c200000080                 mov        r10, 0xffffffff80000000
0060b 4d0f4cca                       cmovl      r9, r10
0060f 418bf9                         mov        edi, r9d
00612 443bc7                         cmp        r8d, edi
00615 0f8d8d000000                   jge        0x7f63dbc09228
0061b 4d63d0                         movsxd     r10, r8d
0061e 4c03d1                         add        r10, rcx
00621 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00629 0f83f1190000                   jae        0x7f63dbc0aba0
0062f 4183c310                       add        r11d, 0x10
00633 4d63d3                         movsxd     r10, r11d
00636 4c03d1                         add        r10, rcx
00639 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00641 0f83ed190000                   jae        0x7f63dbc0abb4
00647 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
0064f 0f83f3190000                   jae        0x7f63dbc0abc8
00655 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
0065d 0f83f9190000                   jae        0x7f63dbc0abdc
00663 90                             nop        
00664 90                             nop        
00665 90                             nop        
00666 90                             nop        
00667 90                             nop        
00668 90                             nop        
00669 90                             nop        
0066a 90                             nop        
0066b 90                             nop        
0066c 90                             nop        
0066d 90                             nop        
0066e 90                             nop        
0066f 90                             nop        
00670 478d1406                       lea        r10d, [r14 + r8]
00674 458bc8                         mov        r9d, r8d
00677 4963d1                         movsxd     rdx, r9d
0067a 458bda                         mov        r11d, r10d
0067d 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
00685 4f8b5c190c                     mov        r11, qword ptr [r9 + r11 + 0xc]
0068a 4963f2                         movsxd     rsi, r10d
0068d 458bd0                         mov        r10d, r8d
00690 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
00695 4d8b5c3114                     mov        r11, qword ptr [r9 + rsi + 0x14]
0069a 4d895c1114                     mov        qword ptr [r9 + rdx + 0x14], r11
0069f 4183c010                       add        r8d, 0x10
006a3 443bc7                         cmp        r8d, edi
006a6 7cc8                           jl         0x7f63dbc091f0
006a8 443bc3                         cmp        r8d, ebx
006ab 7d4d                           jge        0x7f63dbc0927a
006ad 4d63d0                         movsxd     r10, r8d
006b0 4c03d1                         add        r10, rcx
006b3 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
006bb 0f83af190000                   jae        0x7f63dbc0abf0
006c1 443b842498000000               cmp        r8d, dword ptr [rsp + 0x98]
006c9 0f83b5190000                   jae        0x7f63dbc0ac04
006cf 90                             nop        
006d0 478d1406                       lea        r10d, [r14 + r8]
006d4 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
006dc 4f8b4c110c                     mov        r9, qword ptr [r9 + r10 + 0xc]
006e1 458bd8                         mov        r11d, r8d
006e4 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
006ec 4f894c1a0c                     mov        qword ptr [r10 + r11 + 0xc], r9
006f1 4183c008                       add        r8d, 8
006f5 443bc3                         cmp        r8d, ebx
006f8 7cd6                           jl         0x7f63dbc09250
006fa 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
006fe 035c245c                       add        ebx, dword ptr [rsp + 0x5c]
00702 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00706 448b8424b8000000               mov        r8d, dword ptr [rsp + 0xb8]
0070e 41ffc0                         inc        r8d
00711 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00716 0f8d99050000                   jge        0x7f63dbc09835
0071c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00721 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
00726 4f8b5cc210                     mov        r11, qword ptr [r10 + r8*8 + 0x10]
0072b 4d8bd3                         mov        r10, r11
0072e 49c1fa24                       sar        r10, 0x24
00732 458bd2                         mov        r10d, r10d
00735 418bca                         mov        ecx, r10d
00738 458bd3                         mov        r10d, r11d
0073b 49c1eb12                       shr        r11, 0x12
0073f 4181e2ffff0100                 and        r10d, 0x1ffff
00746 418bc2                         mov        eax, r10d
00749 418bdb                         mov        ebx, r11d
0074c 81e3ffff0300                   and        ebx, 0x3ffff
00752 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
00756 448bd1                         mov        r10d, ecx
00759 4585d2                         test       r10d, r10d
0075c 0f8cd2110000                   jl         0x7f63dbc0a4b4
00762 448bd8                         mov        r11d, eax
00765 4585db                         test       r11d, r11d
00768 0f85ba000000                   jne        0x7f63dbc093a8
0076e 4533d2                         xor        r10d, r10d
00771 418bc2                         mov        eax, r10d
00774 448bd1                         mov        r10d, ecx
00777 4183fa03                       cmp        r10d, 3
0077b 0f8eef000000                   jle        0x7f63dbc093f0
00781 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00786 458b5210                       mov        r10d, dword ptr [r10 + 0x10]
0078a 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0078f 45895314                       mov        dword ptr [r11 + 0x14], r10d
00793 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
00797 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0079c 45895a10                       mov        dword ptr [r10 + 0x10], r11d
007a0 448d51fd                       lea        r10d, [rcx - 3]
007a4 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
007ac 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
007b1 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
007b8 41895a0c                       mov        dword ptr [r10 + 0xc], ebx
007bc 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
007c4 48639c24b0000000               movsxd     rbx, dword ptr [rsp + 0xb0]
007cc 488beb                         mov        rbp, rbx
007cf 4c63542464                     movsxd     r10, dword ptr [rsp + 0x64]
007d4 4c03542428                     add        r10, qword ptr [rsp + 0x28]
007d9 4863d0                         movsxd     rdx, eax
007dc 4c03d2                         add        r10, rdx
007df 493bda                         cmp        rbx, r10
007e2 0f8f10120000                   jg         0x7f63dbc0a578
007e8 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
007ec 03d8                           add        ebx, eax
007ee 448bf3                         mov        r14d, ebx
007f1 442bb424b0000000               sub        r14d, dword ptr [rsp + 0xb0]
007f9 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
007fe 4585db                         test       r11d, r11d
00801 0f8528fbffff                   jne        0x7f63dbc08eaf
00807 4d63c6                         movsxd     r8, r14d
0080a 4c3b442438                     cmp        r8, qword ptr [rsp + 0x38]
0080f 0f8ce3140000                   jl         0x7f63dbc0a878
00815 483b6c2440                     cmp        rbp, qword ptr [rsp + 0x40]
0081a 0f8fa0150000                   jg         0x7f63dbc0a940
00820 4533ed                         xor        r13d, r13d
00823 e90afbffff                     jmp        0x7f63dbc08eb2
00828 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0082d 452bd1                         sub        r10d, r9d
00830 453bda                         cmp        r11d, r10d
00833 0f8e3bffffff                   jle        0x7f63dbc092f4
00839 be45ffffff                     mov        esi, 0xffffff45
0083e 418beb                         mov        ebp, r11d
00841 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
00849 90                             nop        
0084a 90                             nop        
0084b 90                             nop        
0084c c5f877                         vzeroupper 
0084f e88c13aeff                     call       0x7f63db6ea760
00854 0f1f84004c090001               nop        dword ptr [rax + rax + 0x100094c]
0085c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
00866 4883e4f0                       and        rsp, 0xfffffffffffffff0
0086a e81175b218                     call       0x7f63f4730900
0086f f4                             hlt        
00870 85c0                           test       eax, eax
00872 7407                           je         0x7f63dbc093fb
00874 448d51ff                       lea        r10d, [rcx - 1]
00878 418bca                         mov        ecx, r10d
0087b 85c9                           test       ecx, ecx
0087d 7516                           jne        0x7f63dbc09415
0087f 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00884 418b5a0c                       mov        ebx, dword ptr [r10 + 0xc]
00888 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
00890 e97e000000                     jmp        0x7f63dbc09493
00895 83f903                         cmp        ecx, 3
00898 0f842e220000                   je         0x7f63dbc0b64c
0089e 83f902                         cmp        ecx, 2
008a1 0f87e9220000                   ja         0x7f63dbc0b710
008a7 3b8c24ec000000                 cmp        ecx, dword ptr [rsp + 0xec]
008ae 0f832e1a0000                   jae        0x7f63dbc0ae62
008b4 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
008b9 418b5c8b0c                     mov        ebx, dword ptr [r11 + rcx*4 + 0xc]
008be 85c9                           test       ecx, ecx
008c0 7e40                           jle        0x7f63dbc09482
008c2 448d51ff                       lea        r10d, [rcx - 1]
008c6 443b9424ec000000               cmp        r10d, dword ptr [rsp + 0xec]
008ce 0f8334210000                   jae        0x7f63dbc0b588
008d4 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
008dc 90                             nop        
008dd 90                             nop        
008de 90                             nop        
008df 90                             nop        
008e0 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
008e5 458b5c8b08                     mov        r11d, dword ptr [r11 + rcx*4 + 8]
008ea 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
008ef 45895c880c                     mov        dword ptr [r8 + rcx*4 + 0xc], r11d
008f4 448d51ff                       lea        r10d, [rcx - 1]
008f8 418bca                         mov        ecx, r10d
008fb 4585d2                         test       r10d, r10d
008fe 7fe0                           jg         0x7f63dbc09460
00900 eb08                           jmp        0x7f63dbc0948a
00902 44898424b8000000               mov        dword ptr [rsp + 0xb8], r8d
0090a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0090f 41895a0c                       mov        dword ptr [r10 + 0xc], ebx
00913 899c24b0000000                 mov        dword ptr [rsp + 0xb0], ebx
0091a e9a5feffff                     jmp        0x7f63dbc09344
0091f 4183fb10                       cmp        r11d, 0x10
00923 0f8d23090000                   jge        0x7f63dbc09dcc
00929 4183fb08                       cmp        r11d, 8
0092d 0f8d40040000                   jge        0x7f63dbc098f3
00933 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00938 4183fb10                       cmp        r11d, 0x10
0093c 0f8f8c010000                   jg         0x7f63dbc0964e
00942 443b74241c                     cmp        r14d, dword ptr [rsp + 0x1c]
00947 0f83331b0000                   jae        0x7f63dbc0b000
0094d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00955 430fbe6c320c                   movsx      ebp, byte ptr [r10 + r14 + 0xc]
0095b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00960 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00965 0f83e51b0000                   jae        0x7f63dbc0b0d0
0096b 458bda                         mov        r11d, r10d
0096e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00973 43886c130c                     mov        byte ptr [r11 + r10 + 0xc], bpl
00978 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0097d 41ffc1                         inc        r9d
00980 458d5e03                       lea        r11d, [r14 + 3]
00984 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
00989 0f83711c0000                   jae        0x7f63dbc0b180
0098f 4d63c6                         movsxd     r8, r14d
00992 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0099a 430fbe6c030d                   movsx      ebp, byte ptr [r11 + r8 + 0xd]
009a0 4183c203                       add        r10d, 3
009a4 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
009a9 0f83111d0000                   jae        0x7f63dbc0b240
009af 4c634c2464                     movsxd     r9, dword ptr [rsp + 0x64]
009b4 43886c0b0d                     mov        byte ptr [r11 + r9 + 0xd], bpl
009b9 470fbe54030e                   movsx      r10d, byte ptr [r11 + r8 + 0xe]
009bf 4788540b0e                     mov        byte ptr [r11 + r9 + 0xe], r10b
009c4 470fbe54030f                   movsx      r10d, byte ptr [r11 + r8 + 0xf]
009ca 4788540b0f                     mov        byte ptr [r11 + r9 + 0xf], r10b
009cf 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
009d7 4183fa08                       cmp        r10d, 8
009db 0f839b1d0000                   jae        0x7f63dbc0b2fc
009e1 49baf0ef2fe300000000           movabs     r10, 0xe32feff0
009eb 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
009f3 4703749a0c                     add        r14d, dword ptr [r10 + r11*4 + 0xc]
009f8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
009fd 4183fa04                       cmp        r10d, 4
00a01 7e4a                           jle        0x7f63dbc095cd
00a03 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00a08 4183c004                       add        r8d, 4
00a0c 443bb42488000000               cmp        r14d, dword ptr [rsp + 0x88]
00a14 0f832a1e0000                   jae        0x7f63dbc0b3c4
00a1a 418bce                         mov        ecx, r14d
00a1d 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00a25 418b6c0b0c                     mov        ebp, dword ptr [r11 + rcx + 0xc]
00a2a 443b842488000000               cmp        r8d, dword ptr [rsp + 0x88]
00a32 0f83e41e0000                   jae        0x7f63dbc0b49c
00a38 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a3d 4d63da                         movsxd     r11, r10d
00a40 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a48 43896c1a10                     mov        dword ptr [r10 + r11 + 0x10], ebp
00a4d 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00a52 4183fb08                       cmp        r11d, 8
00a56 7e6d                           jle        0x7f63dbc09645
00a58 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00a5d 4183c208                       add        r10d, 8
00a61 458bca                         mov        r9d, r10d
00a64 49bb20f02fe300000000           movabs     r11, 0xe32ff020
00a6e 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00a76 478b5c930c                     mov        r11d, dword ptr [r11 + r10*4 + 0xc]
00a7b 452bf3                         sub        r14d, r11d
00a7e 418d6e08                       lea        ebp, [r14 + 8]
00a82 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00a89 0f83c5210000                   jae        0x7f63dbc0b7d4
00a8f 4d63de                         movsxd     r11, r14d
00a92 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00a9a 4b8b6c1a14                     mov        rbp, qword ptr [r10 + r11 + 0x14]
00a9f 458bd1                         mov        r10d, r9d
00aa2 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00aaa 0f8368220000                   jae        0x7f63dbc0b898
00ab0 448b6c2464                     mov        r13d, dword ptr [rsp + 0x64]
00ab5 4d63d5                         movsxd     r10, r13d
00ab8 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00ac0 4b896c1314                     mov        qword ptr [r11 + r10 + 0x14], rbp
00ac5 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00ac9 e938fcffff                     jmp        0x7f63dbc09286
00ace 4585f6                         test       r14d, r14d
00ad1 0f8c05230000                   jl         0x7f63dbc0b95c
00ad7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00adc 4585d2                         test       r10d, r10d
00adf 0f8cf7220000                   jl         0x7f63dbc0b95c
00ae5 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00aea 443b5c2464                     cmp        r11d, dword ptr [rsp + 0x64]
00aef 0f82e7220000                   jb         0x7f63dbc0b95c
00af5 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00afd 4403542464                     add        r10d, dword ptr [rsp + 0x64]
00b02 44899424b4000000               mov        dword ptr [rsp + 0xb4], r10d
00b0a 453bda                         cmp        r11d, r10d
00b0d 0f82c9220000                   jb         0x7f63dbc0b95c
00b13 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b1b 4585d2                         test       r10d, r10d
00b1e 0f8cb8220000                   jl         0x7f63dbc0b95c
00b24 4585d2                         test       r10d, r10d
00b27 0f8448f7ffff                   je         0x7f63dbc08df5
00b2d 4883fd20                       cmp        rbp, 0x20
00b31 7725                           ja         0x7f63dbc096d8
00b33 4d63d2                         movsxd     r10, r10d
00b36 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b3d c442a8f5db                     bzhi       r11, r11, r10
00b42 c4c1fb92fb                     kmovq      k7, r11
00b47 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b4d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b53 e91df7ffff                     jmp        0x7f63dbc08df5
00b58 488bd5                         mov        rdx, rbp
00b5b c5f877                         vzeroupper 
00b5e 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00b68 41ffd2                         call       r10
00b6b 0f1f840000000000               nop        dword ptr [rax + rax]
00b73 e9fdf6ffff                     jmp        0x7f63dbc08df5
00b78 83f830                         cmp        eax, 0x30
00b7b 0f8f48060000                   jg         0x7f63dbc09d49
00b81 443b8c248c000000               cmp        r9d, dword ptr [rsp + 0x8c]
00b89 0f831d230000                   jae        0x7f63dbc0ba2c
00b8f 4963c9                         movsxd     rcx, r9d
00b92 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
00b97 c4c17a6f440a0c                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 0xc]
00b9e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00ba3 443b94249c000000               cmp        r10d, dword ptr [rsp + 0x9c]
00bab 0f83bf230000                   jae        0x7f63dbc0baf0
00bb1 418bd2                         mov        edx, r10d
00bb4 4183c210                       add        r10d, 0x10
00bb8 418bfa                         mov        edi, r10d
00bbb 4c63d2                         movsxd     r10, edx
00bbe 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00bc6 c4817a7f44130c                 vmovdqu    xmmword ptr [r11 + r10 + 0xc], xmm0
00bcd 448bdf                         mov        r11d, edi
00bd0 443bdb                         cmp        r11d, ebx
00bd3 0f8da5000000                   jge        0x7f63dbc097fe
00bd9 492bca                         sub        rcx, r10
00bdc 4d63c3                         movsxd     r8, r11d
00bdf 4d8d1408                       lea        r10, [r8 + rcx]
00be3 4c3b942490000000               cmp        r10, qword ptr [rsp + 0x90]
00beb 0f836b240000                   jae        0x7f63dbc0bbdc
00bf1 4c63d3                         movsxd     r10, ebx
00bf4 4d2bd0                         sub        r10, r8
00bf7 4983c20f                       add        r10, 0xf
00bfb 4983e2f0                       and        r10, 0xfffffffffffffff0
00bff 458bd2                         mov        r10d, r10d
00c02 458d541210                     lea        r10d, [r10 + rdx + 0x10]
00c07 4d63d2                         movsxd     r10, r10d
00c0a 4d8d440af0                     lea        r8, [r10 + rcx - 0x10]
00c0f 4c3b842490000000               cmp        r8, qword ptr [rsp + 0x90]
00c17 0f833f240000                   jae        0x7f63dbc0bbdc
00c1d 443b9c249c000000               cmp        r11d, dword ptr [rsp + 0x9c]
00c25 0f8331240000                   jae        0x7f63dbc0bbdc
00c2b 4983c2f0                       add        r10, -0x10
00c2f 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
00c37 0f831f240000                   jae        0x7f63dbc0bbdc
00c3d 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
00c43 0f8fcf240000                   jg         0x7f63dbc0bc98
00c49 458bd1                         mov        r10d, r9d
00c4c 442bd2                         sub        r10d, edx
00c4f 90                             nop        
00c50 458d043a                       lea        r8d, [r10 + rdi]
00c54 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
00c59 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
00c60 448bdf                         mov        r11d, edi
00c63 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00c6b c4817a7f44180c                 vmovdqu    xmmword ptr [r8 + r11 + 0xc], xmm0
00c72 448d5f10                       lea        r11d, [rdi + 0x10]
00c76 418bfb                         mov        edi, r11d
00c79 443bdb                         cmp        r11d, ebx
00c7c 7cd2                           jl         0x7f63dbc097d0
00c7e 468d1408                       lea        r10d, [rax + r9]
00c82 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00c87 895c2464                       mov        dword ptr [rsp + 0x64], ebx
00c8b e946f7ffff                     jmp        0x7f63dbc08f56
00c90 4d63d2                         movsxd     r10, r10d
00c93 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c9a c442a8f5db                     bzhi       r11, r11, r10
00c9f c4c1fb92fb                     kmovq      k7, r11
00ca4 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00caa 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00cb0 e9a4000000                     jmp        0x7f63dbc098d9
00cb5 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
00cba 458bd3                         mov        r10d, r11d
00cbd 442b542460                     sub        r10d, dword ptr [rsp + 0x60]
00cc2 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00cca 4585c0                         test       r8d, r8d
00ccd 0f8405260000                   je         0x7f63dbc0be58
00cd3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cd8 4585db                         test       r11d, r11d
00cdb 0f8c9f260000                   jl         0x7f63dbc0bf00
00ce1 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
00ce6 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
00ceb 8bb424e8000000                 mov        esi, dword ptr [rsp + 0xe8]
00cf2 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00cf6 85c9                           test       ecx, ecx
00cf8 0f8c22260000                   jl         0x7f63dbc0bea0
00cfe 3b74240c                       cmp        esi, dword ptr [rsp + 0xc]
00d02 0f821e260000                   jb         0x7f63dbc0bea6
00d08 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
00d0c 4103ea                         add        ebp, r10d
00d0f 458b4808                       mov        r9d, dword ptr [r8 + 8]
00d13 443bcd                         cmp        r9d, ebp
00d16 0f8210260000                   jb         0x7f63dbc0beac
00d1c 4585d2                         test       r10d, r10d
00d1f 0f8c0d260000                   jl         0x7f63dbc0beb2
00d25 4585d2                         test       r10d, r10d
00d28 742f                           je         0x7f63dbc098d9
00d2a 498d74080c                     lea        rsi, [r8 + rcx + 0xc]
00d2f 4b8d7c1d0c                     lea        rdi, [r13 + r11 + 0xc]
00d34 4963d2                         movsxd     rdx, r10d
00d37 4883fa20                       cmp        rdx, 0x20
00d3b 0f864fffffff                   jbe        0x7f63dbc09810
00d41 c5f877                         vzeroupper 
00d44 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
00d4e 41ffd2                         call       r10
00d51 0f1f840000000000               nop        dword ptr [rax + rax]
00d59 41896e3c                       mov        dword ptr [r14 + 0x3c], ebp
00d5d c5f877                         vzeroupper 
00d60 4881c4d0000000                 add        rsp, 0xd0
00d67 5d                             pop        rbp
00d68 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00d6c 0f87812e0000                   ja         0x7f63dbc0c773
00d72 c3                             ret        
00d73 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00d7b 0f830f260000                   jae        0x7f63dbc0bf10
00d81 458bd6                         mov        r10d, r14d
00d84 418bc2                         mov        eax, r10d
00d87 4d63c2                         movsxd     r8, r10d
00d8a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00d92 4b8b4c020c                     mov        rcx, qword ptr [r10 + r8 + 0xc]
00d97 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00d9c 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00da4 0f83a6260000                   jae        0x7f63dbc0bfd0
00daa 8b542464                       mov        edx, dword ptr [rsp + 0x64]
00dae 448d5208                       lea        r10d, [rdx + 8]
00db2 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00db7 4c63da                         movsxd     r11, edx
00dba 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00dc2 4b894c1a0c                     mov        qword ptr [r10 + r11 + 0xc], rcx
00dc7 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00dcc 443bd3                         cmp        r10d, ebx
00dcf 0f8dc6030000                   jge        0x7f63dbc09d1b
00dd5 4d2bc3                         sub        r8, r11
00dd8 4963ca                         movsxd     rcx, r10d
00ddb 4e8d1c01                       lea        r11, [rcx + r8]
00ddf 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00de7 0f8333270000                   jae        0x7f63dbc0c0a0
00ded 4d8bd9                         mov        r11, r9
00df0 4c2bd9                         sub        r11, rcx
00df3 4983c307                       add        r11, 7
00df7 4983e3f8                       and        r11, 0xfffffffffffffff8
00dfb 458bdb                         mov        r11d, r11d
00dfe 458d5c1308                     lea        r11d, [r11 + rdx + 8]
00e03 4d63db                         movsxd     r11, r11d
00e06 4b8d7c03f8                     lea        rdi, [r11 + r8 - 8]
00e0b 483bbc24a8000000               cmp        rdi, qword ptr [rsp + 0xa8]
00e13 0f8307270000                   jae        0x7f63dbc0c0a0
00e19 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00e21 0f83f9260000                   jae        0x7f63dbc0c0a0
00e27 4983c3f8                       add        r11, -8
00e2b 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00e33 0f83e7260000                   jae        0x7f63dbc0c0a0
00e39 81fbf8ffff7f                   cmp        ebx, 0x7ffffff8
00e3f 0f8f8b270000                   jg         0x7f63dbc0c150
00e45 448bd0                         mov        r10d, eax
00e48 442bd2                         sub        r10d, edx
00e4b 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
00e53 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00e5b 458bd3                         mov        r10d, r11d
00e5e bef4ffffff                     mov        esi, 0xfffffff4
00e63 412bf2                         sub        esi, r10d
00e66 2bf2                           sub        esi, edx
00e68 83c210                         add        edx, 0x10
00e6b 83c6f0                         add        esi, -0x10
00e6e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e73 4d8d59c8                       lea        r11, [r9 - 0x38]
00e77 4981fb00000080                 cmp        r11, -0x80000000
00e7e 48c7c700000080                 mov        rdi, 0xffffffff80000000
00e85 4c0f4cdf                       cmovl      r11, rdi
00e89 418bfb                         mov        edi, r11d
00e8c 442b742464                     sub        r14d, dword ptr [rsp + 0x64]
00e91 4863c2                         movsxd     rax, edx
00e94 41bb06000000                   mov        r11d, 6
00e9a c462a0f5de                     bzhi       r11, rsi, r11
00e9f 4903c3                         add        rax, r11
00ea2 493bc1                         cmp        rax, r9
00ea5 498bf1                         mov        rsi, r9
00ea8 480f4cf0                       cmovl      rsi, rax
00eac 4c8bde                         mov        r11, rsi
00eaf 4c2bd9                         sub        r11, rcx
00eb2 498d43ff                       lea        rax, [r11 - 1]
00eb6 48c1f83f                       sar        rax, 0x3f
00eba 48c1e83d                       shr        rax, 0x3d
00ebe 4e8d5c18ff                     lea        r11, [rax + r11 - 1]
00ec3 4983e3f8                       and        r11, 0xfffffffffffffff8
00ec7 4c03d9                         add        r11, rcx
00eca 493bcb                         cmp        rcx, r11
00ecd 490f4ccb                       cmovl      rcx, r11
00ed1 8bc9                           mov        ecx, ecx
00ed3 458d5c0e08                     lea        r11d, [r14 + rcx + 8]
00ed8 83c108                         add        ecx, 8
00edb 4963c3                         movsxd     rax, r11d
00ede 4903c2                         add        rax, r10
00ee1 4863c9                         movsxd     rcx, ecx
00ee4 4903ca                         add        rcx, r10
00ee7 4c8d580c                       lea        r11, [rax + 0xc]
00eeb 4883c04c                       add        rax, 0x4c
00eef 488d694c                       lea        rbp, [rcx + 0x4c]
00ef3 4533d2                         xor        r10d, r10d
00ef6 493beb                         cmp        rbp, r11
00ef9 410f96c2                       setbe      r10b
00efd 4883c10c                       add        rcx, 0xc
00f01 4533db                         xor        r11d, r11d
00f04 483bc1                         cmp        rax, rcx
00f07 410f96c3                       setbe      r11b
00f0b 450bd3                         or         r10d, r11d
00f0e 0f8451120000                   je         0x7f63dbc0ace5
00f14 8bc6                           mov        eax, esi
00f16 eb04                           jmp        0x7f63dbc09a9c
00f18 8954244c                       mov        dword ptr [rsp + 0x4c], edx
00f1c 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
00f24 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
00f29 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00f30 4a8b4c110c                     mov        rcx, qword ptr [rcx + r10 + 0xc]
00f35 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f3a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00f42 4b894c130c                     mov        qword ptr [r11 + r10 + 0xc], rcx
00f47 8b54244c                       mov        edx, dword ptr [rsp + 0x4c]
00f4b 83c208                         add        edx, 8
00f4e 3bd0                           cmp        edx, eax
00f50 7cc6                           jl         0x7f63dbc09a98
00f52 4981c108feffff                 add        r9, -0x1f8
00f59 4981f900000080                 cmp        r9, -0x80000000
00f60 49c7c200000080                 mov        r10, 0xffffffff80000000
00f67 4d0f4cca                       cmovl      r9, r10
00f6b 458bc9                         mov        r9d, r9d
00f6e 413bd1                         cmp        edx, r9d
00f71 0f8d09270000                   jge        0x7f63dbc0c200
00f77 4c63d2                         movsxd     r10, edx
00f7a 4d03d0                         add        r10, r8
00f7d 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
00f85 0f83fc260000                   jae        0x7f63dbc0c207
00f8b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f90 4181c200020000                 add        r10d, 0x200
00f97 4d63da                         movsxd     r11, r10d
00f9a 4d03d8                         add        r11, r8
00f9d 4c3b9c24a8000000               cmp        r11, qword ptr [rsp + 0xa8]
00fa5 0f83f0260000                   jae        0x7f63dbc0c21b
00fab 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
00fb2 0f83f7260000                   jae        0x7f63dbc0c22f
00fb8 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
00fc0 0f83fd260000                   jae        0x7f63dbc0c243
00fc6 eb0a                           jmp        0x7f63dbc09b52
00fc8 90                             nop        
00fc9 90                             nop        
00fca 90                             nop        
00fcb 90                             nop        
00fcc 90                             nop        
00fcd 90                             nop        
00fce 90                             nop        
00fcf 90                             nop        
00fd0 8bd6                           mov        edx, esi
00fd2 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
00fda 4403d2                         add        r10d, edx
00fdd 8bca                           mov        ecx, edx
00fdf 4863f1                         movsxd     rsi, ecx
00fe2 458bda                         mov        r11d, r10d
00fe5 8b8c2484000000                 mov        ecx, dword ptr [rsp + 0x84]
00fec 62b17e486f84190c000000         vmovdqu32  zmm0, zmmword ptr [rcx + r11 + 0xc]
00ff7 4d63f2                         movsxd     r14, r10d
00ffa 8d4a40                         lea        ecx, [rdx + 0x40]
00ffd 038c24e0000000                 add        ecx, dword ptr [rsp + 0xe0]
01004 8daa80000000                   lea        ebp, [rdx + 0x80]
0100a 03ac24e0000000                 add        ebp, dword ptr [rsp + 0xe0]
01011 8d8200010000                   lea        eax, [rdx + 0x100]
01017 038424e0000000                 add        eax, dword ptr [rsp + 0xe0]
0101e 448bda                         mov        r11d, edx
01021 448bac2484000000               mov        r13d, dword ptr [rsp + 0x84]
01029 62917e487f841d0c000000         vmovdqu32  zmmword ptr [r13 + r11 + 0xc], zmm0
01034 62d17e486f840d0c000000         vmovdqu32  zmm0, zmmword ptr [r13 + rcx + 0xc]
0103f 62d17e487f84354c000000         vmovdqu32  zmmword ptr [r13 + rsi + 0x4c], zmm0
0104a 62d17e486f842d0c000000         vmovdqu32  zmm0, zmmword ptr [r13 + rbp + 0xc]
01055 62d17e487f84358c000000         vmovdqu32  zmmword ptr [r13 + rsi + 0x8c], zmm0
01060 62917e486f8435cc000000         vmovdqu32  zmm0, zmmword ptr [r13 + r14 + 0xcc]
0106b 62d17e487f8435cc000000         vmovdqu32  zmmword ptr [r13 + rsi + 0xcc], zmm0
01076 448bd0                         mov        r10d, eax
01079 62917e486f84150c000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 0xc]
01084 62d17e487f84350c010000         vmovdqu32  zmmword ptr [r13 + rsi + 0x10c], zmm0
0108f 62917e486f84354c010000         vmovdqu32  zmm0, zmmword ptr [r13 + r14 + 0x14c]
0109a 62d17e487f84354c010000         vmovdqu32  zmmword ptr [r13 + rsi + 0x14c], zmm0
010a5 62917e486f84358c010000         vmovdqu32  zmm0, zmmword ptr [r13 + r14 + 0x18c]
010b0 62d17e487f84358c010000         vmovdqu32  zmmword ptr [r13 + rsi + 0x18c], zmm0
010bb 4c63d0                         movsxd     r10, eax
010be 62917e486f8415cc000000         vmovdqu32  zmm0, zmmword ptr [r13 + r10 + 0xcc]
010c9 62d17e487f8435cc010000         vmovdqu32  zmmword ptr [r13 + rsi + 0x1cc], zmm0
010d4 8db200020000                   lea        esi, [rdx + 0x200]
010da 413bf1                         cmp        esi, r9d
010dd 0f8cedfeffff                   jl         0x7f63dbc09b50
010e3 3bf7                           cmp        esi, edi
010e5 7d5f                           jge        0x7f63dbc09cc6
010e7 81c238020000                   add        edx, 0x238
010ed 4c63d2                         movsxd     r10, edx
010f0 4d03d0                         add        r10, r8
010f3 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
010fb 0f83b7290000                   jae        0x7f63dbc0c638
01101 3b942498000000                 cmp        edx, dword ptr [rsp + 0x98]
01108 0f83d2290000                   jae        0x7f63dbc0c660
0110e 90                             nop        
0110f 90                             nop        
01110 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
01118 4403d6                         add        r10d, esi
0111b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
01123 62917e486f84130c000000         vmovdqu32  zmm0, zmmword ptr [r11 + r10 + 0xc]
0112e 448bd6                         mov        r10d, esi
01131 458bcb                         mov        r9d, r11d
01134 62917e487f84110c000000         vmovdqu32  zmmword ptr [r9 + r10 + 0xc], zmm0
0113f 83c640                         add        esi, 0x40
01142 3bf7                           cmp        esi, edi
01144 7cca                           jl         0x7f63dbc09c90
01146 3bf3                           cmp        esi, ebx
01148 7d51                           jge        0x7f63dbc09d1b
0114a 4c63d6                         movsxd     r10, esi
0114d 4d03d0                         add        r10, r8
01150 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
01158 0f836e290000                   jae        0x7f63dbc0c64c
0115e 3bb42498000000                 cmp        esi, dword ptr [rsp + 0x98]
01165 0f8389290000                   jae        0x7f63dbc0c674
0116b 90                             nop        
0116c 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
01174 4403d6                         add        r10d, esi
01177 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0117f 4f8b5c130c                     mov        r11, qword ptr [r11 + r10 + 0xc]
01184 448bd6                         mov        r10d, esi
01187 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
0118f 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
01194 83c608                         add        esi, 8
01197 3bf3                           cmp        esi, ebx
01199 7cd1                           jl         0x7f63dbc09cec
0119b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0119f e962f5ffff                     jmp        0x7f63dbc09286
011a4 448bd0                         mov        r10d, eax
011a7 4d63d2                         movsxd     r10, r10d
011aa 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
011b1 c442a8f5db                     bzhi       r11, r11, r10
011b6 c4c1fb92fb                     kmovq      k7, r11
011bb 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
011c1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
011c7 eb7a                           jmp        0x7f63dbc09dc3
011c9 4585c9                         test       r9d, r9d
011cc 0f8c05250000                   jl         0x7f63dbc0c257
011d2 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
011d7 4585d2                         test       r10d, r10d
011da 0f8cf7240000                   jl         0x7f63dbc0c257
011e0 448b9c24e8000000               mov        r11d, dword ptr [rsp + 0xe8]
011e8 443b5c2460                     cmp        r11d, dword ptr [rsp + 0x60]
011ed 0f82e4240000                   jb         0x7f63dbc0c257
011f3 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
011f8 443bd3                         cmp        r10d, ebx
011fb 0f82d6240000                   jb         0x7f63dbc0c257
01201 85c0                           test       eax, eax
01203 743e                           je         0x7f63dbc09dc3
01205 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0120a 4b8d7c0a0c                     lea        rdi, [r10 + r9 + 0xc]
0120f 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01217 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0121c 4b8d74100c                     lea        rsi, [r8 + r10 + 0xc]
01221 4883fa20                       cmp        rdx, 0x20
01225 0f8679ffffff                   jbe        0x7f63dbc09d24
0122b c5f877                         vzeroupper 
0122e 49ba40d172db637f0000           movabs     r10, 0x7f63db72d140
01238 41ffd2                         call       r10
0123b 0f1f840000000000               nop        dword ptr [rax + rax]
01243 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01247 e98af1ffff                     jmp        0x7f63dbc08f56
0124c 443bb4249c000000               cmp        r14d, dword ptr [rsp + 0x9c]
01254 0f8336250000                   jae        0x7f63dbc0c310
0125a 4d63de                         movsxd     r11, r14d
0125d 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01265 c4817a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 0xc]
0126c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01271 443b84249c000000               cmp        r8d, dword ptr [rsp + 0x9c]
01279 0f83d1250000                   jae        0x7f63dbc0c3d0
0127f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01284 418bca                         mov        ecx, r10d
01287 418d6a10                       lea        ebp, [r10 + 0x10]
0128b 4d63c2                         movsxd     r8, r10d
0128e 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01296 c4817a7f44020c                 vmovdqu    xmmword ptr [r10 + r8 + 0xc], xmm0
0129d 3beb                           cmp        ebp, ebx
0129f 0f8d8f020000                   jge        0x7f63dbc0a0b4
012a5 4d2bd8                         sub        r11, r8
012a8 4c63c5                         movsxd     r8, ebp
012ab 4f8d1418                       lea        r10, [r8 + r11]
012af 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
012b7 0f836b260000                   jae        0x7f63dbc0c4a8
012bd 4d8bd1                         mov        r10, r9
012c0 4d2bd0                         sub        r10, r8
012c3 4983c20f                       add        r10, 0xf
012c7 4983e2f0                       and        r10, 0xfffffffffffffff0
012cb 458bc2                         mov        r8d, r10d
012ce 448bd1                         mov        r10d, ecx
012d1 478d541010                     lea        r10d, [r8 + r10 + 0x10]
012d6 4d63d2                         movsxd     r10, r10d
012d9 4f8d441af0                     lea        r8, [r10 + r11 - 0x10]
012de 4c3b8424a0000000               cmp        r8, qword ptr [rsp + 0xa0]
012e6 0f833c260000                   jae        0x7f63dbc0c4a8
012ec 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
012f3 0f832f260000                   jae        0x7f63dbc0c4a8
012f9 4983c2f0                       add        r10, -0x10
012fd 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01305 0f831d260000                   jae        0x7f63dbc0c4a8
0130b 81fbf0ffff7f                   cmp        ebx, 0x7ffffff0
01311 0f8fb1260000                   jg         0x7f63dbc0c548
01317 442bf1                         sub        r14d, ecx
0131a 448d5120                       lea        r10d, [rcx + 0x20]
0131e eb02                           jmp        0x7f63dbc09ea2
01320 8bef                           mov        ebp, edi
01322 458d042e                       lea        r8d, [r14 + rbp]
01326 8bbc2484000000                 mov        edi, dword ptr [rsp + 0x84]
0132d c4a17a6f44070c                 vmovdqu    xmm0, xmmword ptr [rdi + r8 + 0xc]
01334 8bcd                           mov        ecx, ebp
01336 c5fa7f440f0c                   vmovdqu    xmmword ptr [rdi + rcx + 0xc], xmm0
0133c 8d7d10                         lea        edi, [rbp + 0x10]
0133f 413bfa                         cmp        edi, r10d
01342 7cdc                           jl         0x7f63dbc09ea0
01344 4981c110ffffff                 add        r9, -0xf0
0134b 4981f900000080                 cmp        r9, -0x80000000
01352 49c7c200000080                 mov        r10, 0xffffffff80000000
01359 4d0f4cca                       cmovl      r9, r10
0135d 418bd1                         mov        edx, r9d
01360 3bfa                           cmp        edi, edx
01362 0f8d79010000                   jge        0x7f63dbc0a061
01368 4c63d7                         movsxd     r10, edi
0136b 4d03d3                         add        r10, r11
0136e 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01376 0f83ec260000                   jae        0x7f63dbc0c5e8
0137c 81c500010000                   add        ebp, 0x100
01382 4c63d5                         movsxd     r10, ebp
01385 4d03d3                         add        r10, r11
01388 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
01390 0f83e6260000                   jae        0x7f63dbc0c5fc
01396 3bbc249c000000                 cmp        edi, dword ptr [rsp + 0x9c]
0139d 0f83ed260000                   jae        0x7f63dbc0c610
013a3 3bac249c000000                 cmp        ebp, dword ptr [rsp + 0x9c]
013aa 0f83f4260000                   jae        0x7f63dbc0c624
013b0 458d143e                       lea        r10d, [r14 + rdi]
013b4 448bc7                         mov        r8d, edi
013b7 4963c8                         movsxd     rcx, r8d
013ba 458bc2                         mov        r8d, r10d
013bd 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
013c5 c4817a6f44010c                 vmovdqu    xmm0, xmmword ptr [r9 + r8 + 0xc]
013cc 4d63ca                         movsxd     r9, r10d
013cf 448bd7                         mov        r10d, edi
013d2 8bb42484000000                 mov        esi, dword ptr [rsp + 0x84]
013d9 c4a17a7f44160c                 vmovdqu    xmmword ptr [rsi + r10 + 0xc], xmm0
013e0 c4a17a6f440e1c                 vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x1c]
013e7 c5fa7f440e1c                   vmovdqu    xmmword ptr [rsi + rcx + 0x1c], xmm0
013ed c4a17a6f440e2c                 vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x2c]
013f4 c5fa7f440e2c                   vmovdqu    xmmword ptr [rsi + rcx + 0x2c], xmm0
013fa c4a17a6f440e3c                 vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x3c]
01401 c5fa7f440e3c                   vmovdqu    xmmword ptr [rsi + rcx + 0x3c], xmm0
01407 c4a17a6f440e4c                 vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x4c]
0140e c5fa7f440e4c                   vmovdqu    xmmword ptr [rsi + rcx + 0x4c], xmm0
01414 c4a17a6f440e5c                 vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x5c]
0141b c5fa7f440e5c                   vmovdqu    xmmword ptr [rsi + rcx + 0x5c], xmm0
01421 c4a17a6f440e6c                 vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x6c]
01428 c5fa7f440e6c                   vmovdqu    xmmword ptr [rsi + rcx + 0x6c], xmm0
0142e c4a17a6f440e7c                 vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x7c]
01435 c5fa7f440e7c                   vmovdqu    xmmword ptr [rsi + rcx + 0x7c], xmm0
0143b c4a17a6f840e8c000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x8c]
01445 c5fa7f840e8c000000             vmovdqu    xmmword ptr [rsi + rcx + 0x8c], xmm0
0144e c4a17a6f840e9c000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0x9c]
01458 c5fa7f840e9c000000             vmovdqu    xmmword ptr [rsi + rcx + 0x9c], xmm0
01461 c4a17a6f840eac000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0xac]
0146b c5fa7f840eac000000             vmovdqu    xmmword ptr [rsi + rcx + 0xac], xmm0
01474 c4a17a6f840ebc000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0xbc]
0147e c5fa7f840ebc000000             vmovdqu    xmmword ptr [rsi + rcx + 0xbc], xmm0
01487 c4a17a6f840ecc000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0xcc]
01491 c5fa7f840ecc000000             vmovdqu    xmmword ptr [rsi + rcx + 0xcc], xmm0
0149a c4a17a6f840edc000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0xdc]
014a4 c5fa7f840edc000000             vmovdqu    xmmword ptr [rsi + rcx + 0xdc], xmm0
014ad c4a17a6f840eec000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0xec]
014b7 c5fa7f840eec000000             vmovdqu    xmmword ptr [rsi + rcx + 0xec], xmm0
014c0 c4a17a6f840efc000000           vmovdqu    xmm0, xmmword ptr [rsi + r9 + 0xfc]
014ca c5fa7f840efc000000             vmovdqu    xmmword ptr [rsi + rcx + 0xfc], xmm0
014d3 81c700010000                   add        edi, 0x100
014d9 3bfa                           cmp        edi, edx
014db 0f8ccffeffff                   jl         0x7f63dbc09f30
014e1 3bfb                           cmp        edi, ebx
014e3 7d4f                           jge        0x7f63dbc0a0b4
014e5 4c63d7                         movsxd     r10, edi
014e8 4d03d3                         add        r10, r11
014eb 4c3b9424a0000000               cmp        r10, qword ptr [rsp + 0xa0]
014f3 0f830f260000                   jae        0x7f63dbc0c688
014f9 3bbc249c000000                 cmp        edi, dword ptr [rsp + 0x9c]
01500 0f8316260000                   jae        0x7f63dbc0c69c
01506 90                             nop        
01507 90                             nop        
01508 458d1c3e                       lea        r11d, [r14 + rdi]
0150c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01514 c4817a6f441a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 0xc]
0151b 448bd7                         mov        r10d, edi
0151e 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
01526 c4817a7f44100c                 vmovdqu    xmmword ptr [r8 + r10 + 0xc], xmm0
0152d 83c710                         add        edi, 0x10
01530 3bfb                           cmp        edi, ebx
01532 7cd4                           jl         0x7f63dbc0a088
01534 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01538 e9c9f1ffff                     jmp        0x7f63dbc09286
0153d 4803f9                         add        rdi, rcx
01540 483b7c2440                     cmp        rdi, qword ptr [rsp + 0x40]
01545 7e08                           jle        0x7f63dbc0a0cf
01547 4533c0                         xor        r8d, r8d
0154a e966ebffff                     jmp        0x7f63dbc08c35
0154f 4533c0                         xor        r8d, r8d
01552 bf01000000                     mov        edi, 1
01557 e95bebffff                     jmp        0x7f63dbc08c37
0155c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01564 4c3b256d787119                 cmp        r12, qword ptr [rip + 0x1971786d]
0156b 0f8414000000                   je         0x7f63dbc0a105
01571 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
0157b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0157f e8fc67b218                     call       0x7f63f4730900
01584 f4                             hlt        
01585 418be9                         mov        ebp, r9d
01588 4489ac24e0000000               mov        dword ptr [rsp + 0xe0], r13d
01590 898424e4000000                 mov        dword ptr [rsp + 0xe4], eax
01597 498bf2                         mov        rsi, r10
0159a 8b542464                       mov        edx, dword ptr [rsp + 0x64]
0159e 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
015a5 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
015aa 8bf8                           mov        edi, eax
015ac 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
015b4 44891c24                       mov        dword ptr [rsp], r11d
015b8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
015bd 4489542408                     mov        dword ptr [rsp + 8], r10d
015c2 4889b424b0000000               mov        qword ptr [rsp + 0xb0], rsi
015ca 90                             nop        
015cb 90                             nop        
015cc c5f877                         vzeroupper 
015cf e80c9bb3ff                     call       0x7f63db743c60
015d4 0f1f8400cc160002               nop        dword ptr [rax + rax + 0x20016cc]
015dc 89442464                       mov        dword ptr [rsp + 0x64], eax
015e0 e921f1ffff                     jmp        0x7f63dbc09286
015e5 bee4ffffff                     mov        esi, 0xffffffe4
015ea 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
015ef 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
015f4 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
015fc 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01601 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01609 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0160e 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01616 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0161b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01620 48894424f8                     mov        qword ptr [rsp - 8], rax
01625 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01629 89442418                       mov        dword ptr [rsp + 0x18], eax
0162d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01632 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01637 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0163c 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01641 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01646 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0164b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01650 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01655 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0165a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0165f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01664 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01669 89442448                       mov        dword ptr [rsp + 0x48], eax
0166d 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01672 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01677 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
0167c c5f877                         vzeroupper 
0167f e85c05aeff                     call       0x7f63db6ea760
01684 0f1f84007c170003               nop        dword ptr [rax + rax + 0x300177c]
0168c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01696 4883e4f0                       and        rsp, 0xfffffffffffffff0
0169a e8e166b218                     call       0x7f63f4730900
0169f f4                             hlt        
016a0 bee4ffffff                     mov        esi, 0xffffffe4
016a5 498bea                         mov        rbp, r10
016a8 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
016ad 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
016b5 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
016ba 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
016c2 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
016c7 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
016cf 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
016d4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016d9 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
016e1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016e6 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
016eb 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
016f0 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016f5 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
016fa 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
016ff 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01704 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01709 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0170e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01713 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01718 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0171d 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01722 89442448                       mov        dword ptr [rsp + 0x48], eax
01726 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0172b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01730 48894424f8                     mov        qword ptr [rsp - 8], rax
01735 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01739 89442458                       mov        dword ptr [rsp + 0x58], eax
0173d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01742 c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
01748 c5f877                         vzeroupper 
0174b e89004aeff                     call       0x7f63db6ea760
01750 0f1f840048180004               nop        dword ptr [rax + rax + 0x4001848]
01758 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01762 4883e4f0                       and        rsp, 0xfffffffffffffff0
01766 e81566b218                     call       0x7f63f4730900
0176b f4                             hlt        
0176c bee4ffffff                     mov        esi, 0xffffffe4
01771 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01776 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0177b 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01783 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01788 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01790 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01795 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
0179d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
017a2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
017a7 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
017af 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017b4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017b9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017be 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017c3 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
017c8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
017cd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
017d2 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
017d7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
017dc 4c89542430                     mov        qword ptr [rsp + 0x30], r10
017e1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
017e6 4c89542438                     mov        qword ptr [rsp + 0x38], r10
017eb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017f0 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017f5 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
017fa 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
017ff 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01804 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01809 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0180e 90                             nop        
0180f 90                             nop        
01810 c5f877                         vzeroupper 
01813 e8c803aeff                     call       0x7f63db6ea760
01818 0f1f840010190005               nop        dword ptr [rax + rax + 0x5001910]
01820 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
0182a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0182e e84d65b218                     call       0x7f63f4730900
01833 f4                             hlt        
01834 bee4ffffff                     mov        esi, 0xffffffe4
01839 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0183e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01843 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0184b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01850 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01858 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0185d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01865 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0186a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0186f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01877 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0187c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01881 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01886 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0188b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01890 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01895 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0189a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0189f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
018a4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
018a9 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018ae 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
018b3 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
018b8 4489542440                     mov        dword ptr [rsp + 0x40], r10d
018bd 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
018c2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018c7 895c2450                       mov        dword ptr [rsp + 0x50], ebx
018cb c5fa7f442460                   vmovdqu    xmmword ptr [rsp + 0x60], xmm0
018d1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018d6 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018db 90                             nop        
018dc c5f877                         vzeroupper 
018df e8fc02aeff                     call       0x7f63db6ea760
018e4 0f1f8400dc190006               nop        dword ptr [rax + rax + 0x60019dc]
018ec 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
018f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
018fa e88164b218                     call       0x7f63f4730900
018ff f4                             hlt        
01900 be45ffffff                     mov        esi, 0xffffff45
01905 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0190d 90                             nop        
0190e 90                             nop        
0190f 90                             nop        
01910 c5f877                         vzeroupper 
01913 e8c802aeff                     call       0x7f63db6ea760
01918 0f1f8400101a0007               nop        dword ptr [rax + rax + 0x7001a10]
01920 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
0192a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192e e84d64b218                     call       0x7f63f4730900
01933 f4                             hlt        
01934 be45ffffff                     mov        esi, 0xffffff45
01939 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0193e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01943 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
0194b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01950 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01958 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0195d 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01965 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0196a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0196f 48894424f8                     mov        qword ptr [rsp - 8], rax
01974 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01978 89442418                       mov        dword ptr [rsp + 0x18], eax
0197c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01981 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01986 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0198b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01990 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01995 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0199a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0199f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
019a4 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
019a9 4c89542438                     mov        qword ptr [rsp + 0x38], r10
019ae 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019b3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
019b8 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
019bd 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
019c2 4489442444                     mov        dword ptr [rsp + 0x44], r8d
019c7 89442448                       mov        dword ptr [rsp + 0x48], eax
019cb 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
019cf 894c2450                       mov        dword ptr [rsp + 0x50], ecx
019d3 90                             nop        
019d4 c5f877                         vzeroupper 
019d7 e80402aeff                     call       0x7f63db6ea760
019dc 0f1f8400d41a0008               nop        dword ptr [rax + rax + 0x8001ad4]
019e4 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
019ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
019f2 e88963b218                     call       0x7f63f4730900
019f7 f4                             hlt        
019f8 493bda                         cmp        rbx, r10
019fb bdffffffff                     mov        ebp, 0xffffffff
01a00 7c08                           jl         0x7f63dbc0a58a
01a02 400f95c5                       setne      bpl
01a06 400fb6ed                       movzx      ebp, bpl
01a0a be45ffffff                     mov        esi, 0xffffff45
01a0f 4c8b5c2468                     mov        r11, qword ptr [rsp + 0x68]
01a14 4c899c24e0000000               mov        qword ptr [rsp + 0xe0], r11
01a1c 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01a21 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
01a29 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01a2e 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
01a36 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
01a3b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01a40 48894424f8                     mov        qword ptr [rsp - 8], rax
01a45 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01a49 89442420                       mov        dword ptr [rsp + 0x20], eax
01a4d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a52 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01a57 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01a5c 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01a61 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01a66 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a6b 89442450                       mov        dword ptr [rsp + 0x50], eax
01a6f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01a74 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01a79 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01a7e 90                             nop        
01a7f 90                             nop        
01a80 c5f877                         vzeroupper 
01a83 e85801aeff                     call       0x7f63db6ea760
01a88 0f1f8400801b0009               nop        dword ptr [rax + rax + 0x9001b80]
01a90 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a9e e8dd62b218                     call       0x7f63f4730900
01aa3 f4                             hlt        
01aa4 be45ffffff                     mov        esi, 0xffffff45
01aa9 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01aae 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01ab3 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
01abb 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01ac0 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01ac8 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01acd 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
01ad5 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01ada 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01adf 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae4 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01ae8 89442418                       mov        dword ptr [rsp + 0x18], eax
01aec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af1 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
01af6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01afb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01b00 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01b05 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01b0a 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01b0f 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01b14 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01b19 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b1e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b23 89442448                       mov        dword ptr [rsp + 0x48], eax
01b27 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01b2c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01b31 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01b36 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
01b3b 90                             nop        
01b3c c5f877                         vzeroupper 
01b3f e89c00aeff                     call       0x7f63db6ea760
01b44 0f1f84003c1c000a               nop        dword ptr [rax + rax + 0xa001c3c]
01b4c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01b56 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b5a e82162b218                     call       0x7f63f4730900
01b5f f4                             hlt        
01b60 bee4ffffff                     mov        esi, 0xffffffe4
01b65 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01b6a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01b6f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01b77 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01b7c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01b84 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01b89 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01b91 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01b96 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01b9b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01ba3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ba8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01bad 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01bb2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01bb7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01bbc 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01bc1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01bc6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01bcb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01bd0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01bd5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bda 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01bdf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01be4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01be9 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01bee 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01bf3 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01bf7 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01bfc 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01c01 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
01c06 4489742464                     mov        dword ptr [rsp + 0x64], r14d
01c0b 90                             nop        
01c0c c5f877                         vzeroupper 
01c0f e8ccffadff                     call       0x7f63db6ea760
01c14 0f1f84000c1d000b               nop        dword ptr [rax + rax + 0xb001d0c]
01c1c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01c26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2a e85161b218                     call       0x7f63f4730900
01c2f f4                             hlt        
01c30 bee4ffffff                     mov        esi, 0xffffffe4
01c35 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01c3a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01c3f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
01c47 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
01c4c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
01c54 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
01c59 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
01c61 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
01c66 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01c6b 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01c73 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c78 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01c7d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01c82 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01c87 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01c8c 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01c91 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01c96 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01c9b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ca0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ca5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01caa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01caf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01cb4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01cb9 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01cbe 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01cc3 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01cc7 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01ccc 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01cd1 90                             nop        
01cd2 90                             nop        
01cd3 90                             nop        
01cd4 c5f877                         vzeroupper 
01cd7 e804ffadff                     call       0x7f63db6ea760
01cdc 0f1f8400d41d000c               nop        dword ptr [rax + rax + 0xc001dd4]
01ce4 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01cee 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cf2 e88960b218                     call       0x7f63f4730900
01cf7 f4                             hlt        
01cf8 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
01cfd 4d3bc3                         cmp        r8, r11
01d00 bdffffffff                     mov        ebp, 0xffffffff
01d05 7c08                           jl         0x7f63dbc0a88f
01d07 400f95c5                       setne      bpl
01d0b 400fb6ed                       movzx      ebp, bpl
01d0f be45ffffff                     mov        esi, 0xffffff45
01d14 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01d19 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01d21 8b4c240c                       mov        ecx, dword ptr [rsp + 0xc]
01d25 898c24e8000000                 mov        dword ptr [rsp + 0xe8], ecx
01d2c 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01d31 44898424ec000000               mov        dword ptr [rsp + 0xec], r8d
01d39 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01d3e 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01d43 48894424f8                     mov        qword ptr [rsp - 8], rax
01d48 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01d4c 89442420                       mov        dword ptr [rsp + 0x20], eax
01d50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d55 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01d5a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
01d5f 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01d64 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01d69 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d6e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d73 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01d78 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01d7d 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01d81 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01d86 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01d8b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01d90 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01d95 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01d9a 90                             nop        
01d9b 90                             nop        
01d9c c5f877                         vzeroupper 
01d9f e83cfeadff                     call       0x7f63db6ea760
01da4 0f1f84009c1e000d               nop        dword ptr [rax + rax + 0xd001e9c]
01dac 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01db6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dba e8c15fb218                     call       0x7f63f4730900
01dbf f4                             hlt        
01dc0 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
01dc5 493beb                         cmp        rbp, r11
01dc8 bdffffffff                     mov        ebp, 0xffffffff
01dcd 7c08                           jl         0x7f63dbc0a957
01dcf 400f95c5                       setne      bpl
01dd3 400fb6ed                       movzx      ebp, bpl
01dd7 be45ffffff                     mov        esi, 0xffffff45
01ddc 4c8b442468                     mov        r8, qword ptr [rsp + 0x68]
01de1 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
01de9 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01dee 44898424e8000000               mov        dword ptr [rsp + 0xe8], r8d
01df6 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01dfa 898c24ec000000                 mov        dword ptr [rsp + 0xec], ecx
01e01 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01e06 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01e0b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e10 8b442464                       mov        eax, dword ptr [rsp + 0x64]
01e14 89442420                       mov        dword ptr [rsp + 0x20], eax
01e18 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01e22 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
01e27 4c89442430                     mov        qword ptr [rsp + 0x30], r8
01e2c 4c895c2438                     mov        qword ptr [rsp + 0x38], r11
01e31 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01e36 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01e3b 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
01e40 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01e45 8944244c                       mov        dword ptr [rsp + 0x4c], eax
01e49 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
01e4e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01e53 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01e58 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01e5d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01e62 90                             nop        
01e63 90                             nop        
01e64 c5f877                         vzeroupper 
01e67 e874fdadff                     call       0x7f63db6ea760
01e6c 0f1f8400641f000e               nop        dword ptr [rax + rax + 0xe001f64]
01e74 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01e7e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e82 e8f95eb218                     call       0x7f63f4730900
01e87 f4                             hlt        
01e88 4183c608                       add        r14d, 8
01e8c be6effffff                     mov        esi, 0xffffff6e
01e91 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01e96 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01e9b 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
01ea3 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01ea8 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
01eb0 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01eb5 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01ebd 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01ec2 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01ec7 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01ecc 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01ed1 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01ed6 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01edb 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01ee0 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01ee5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01eea 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01eef 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01ef4 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01ef9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01efe 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01f03 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
01f08 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01f0d 448b44245c                     mov        r8d, dword ptr [rsp + 0x5c]
01f12 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01f17 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01f1c 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01f21 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01f25 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01f2a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01f2f 90                             nop        
01f30 c5f877                         vzeroupper 
01f33 e8a8fcadff                     call       0x7f63db6ea760
01f38 0f1f84003020000f               nop        dword ptr [rax + rax + 0xf002030]
01f40 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
01f4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f4e e82d5eb218                     call       0x7f63f4730900
01f53 f4                             hlt        
01f54 4183c608                       add        r14d, 8
01f58 be66ffffff                     mov        esi, 0xffffff66
01f5d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
01f62 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
01f67 44898c24e0000000               mov        dword ptr [rsp + 0xe0], r9d
01f6f 4c8b442410                     mov        r8, qword ptr [rsp + 0x10]
01f74 4c898424e8000000               mov        qword ptr [rsp + 0xe8], r8
01f7c 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
01f81 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
01f89 4c8b442450                     mov        r8, qword ptr [rsp + 0x50]
01f8e 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01f93 4489542418                     mov        dword ptr [rsp + 0x18], r10d
01f98 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01f9d 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01fa2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
01fa7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
01fac 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01fb1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
01fb6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
01fbb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
01fc0 4c89542438                     mov        qword ptr [rsp + 0x38], r10
01fc5 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01fca 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01fcf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
01fd4 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01fd9 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
01fde 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01fe3 4489742454                     mov        dword ptr [rsp + 0x54], r14d
01fe8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01fed 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
01ff1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
01ff6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ffb 90                             nop        
01ffc c5f877                         vzeroupper 
01fff e8dcfbadff                     call       0x7f63db6ea760
02004 0f1f8400fc200010               nop        dword ptr [rax + rax + 0x100020fc]
0200c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02016 4883e4f0                       and        rsp, 0xfffffffffffffff0
0201a e8615db218                     call       0x7f63f4730900
0201f f4                             hlt        
02020 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
0202a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0202e e84d5db218                     call       0x7f63f4730900
02033 f4                             hlt        
02034 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
0203e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02042 e8395db218                     call       0x7f63f4730900
02047 f4                             hlt        
02048 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
02052 4883e4f0                       and        rsp, 0xfffffffffffffff0
02056 e8255db218                     call       0x7f63f4730900
0205b f4                             hlt        
0205c 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
02066 4883e4f0                       and        rsp, 0xfffffffffffffff0
0206a e8115db218                     call       0x7f63f4730900
0206f f4                             hlt        
02070 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
0207a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0207e e8fd5cb218                     call       0x7f63f4730900
02083 f4                             hlt        
02084 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
0208e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02092 e8e95cb218                     call       0x7f63f4730900
02097 f4                             hlt        
02098 beccffffff                     mov        esi, 0xffffffcc
0209d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
020a2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
020a7 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
020af 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
020b4 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
020bc 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
020c1 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
020c9 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
020ce 4c89542410                     mov        qword ptr [rsp + 0x10], r10
020d3 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
020db 448954240c                     mov        dword ptr [rsp + 0xc], r10d
020e0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
020e5 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
020ea 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
020ef 4c89542420                     mov        qword ptr [rsp + 0x20], r10
020f4 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
020f9 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
020fe 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02103 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02108 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0210d 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02112 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02117 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0211c 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02121 4489742450                     mov        dword ptr [rsp + 0x50], r14d
02126 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0212b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
02130 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02135 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0213a 90                             nop        
0213b 90                             nop        
0213c c5f877                         vzeroupper 
0213f e89cfaadff                     call       0x7f63db6ea760
02144 0f1f84003c220011               nop        dword ptr [rax + rax + 0x1100223c]
0214c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02156 4883e4f0                       and        rsp, 0xfffffffffffffff0
0215a e8215cb218                     call       0x7f63f4730900
0215f f4                             hlt        
02160 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
02165 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
0216d 440354244c                     add        r10d, dword ptr [rsp + 0x4c]
02172 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0217a 4f8b5c130c                     mov        r11, qword ptr [r11 + r10 + 0xc]
0217f 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
02184 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
0218c 4f895c110c                     mov        qword ptr [r9 + r10 + 0xc], r11
02191 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
02196 4183c108                       add        r9d, 8
0219a 443bca                         cmp        r9d, edx
0219d 7cc1                           jl         0x7f63dbc0ace0
0219f 443bcf                         cmp        r9d, edi
021a2 0f8dde000000                   jge        0x7f63dbc0ae06
021a8 4d63d1                         movsxd     r10, r9d
021ab 4d03d0                         add        r10, r8
021ae 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
021b6 0f8374190000                   jae        0x7f63dbc0c6b0
021bc 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
021c1 4183c240                       add        r10d, 0x40
021c5 458bda                         mov        r11d, r10d
021c8 4d63d2                         movsxd     r10, r10d
021cb 4d03d0                         add        r10, r8
021ce 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
021d6 0f8368190000                   jae        0x7f63dbc0c6c4
021dc 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
021e4 0f836e190000                   jae        0x7f63dbc0c6d8
021ea 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
021f2 0f8374190000                   jae        0x7f63dbc0c6ec
021f8 90                             nop        
021f9 90                             nop        
021fa 90                             nop        
021fb 90                             nop        
021fc 90                             nop        
021fd 90                             nop        
021fe 90                             nop        
021ff 90                             nop        
02200 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
02208 4503d1                         add        r10d, r9d
0220b 458bd9                         mov        r11d, r9d
0220e 4963cb                         movsxd     rcx, r11d
02211 458bda                         mov        r11d, r10d
02214 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
0221b 4a8b741a0c                     mov        rsi, qword ptr [rdx + r11 + 0xc]
02220 4963d2                         movsxd     rdx, r10d
02223 458bd1                         mov        r10d, r9d
02226 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0222e 4b8974130c                     mov        qword ptr [r11 + r10 + 0xc], rsi
02233 4d8b541314                     mov        r10, qword ptr [r11 + rdx + 0x14]
02238 4d89540b14                     mov        qword ptr [r11 + rcx + 0x14], r10
0223d 4d8b54131c                     mov        r10, qword ptr [r11 + rdx + 0x1c]
02242 4d89540b1c                     mov        qword ptr [r11 + rcx + 0x1c], r10
02247 4d8b541324                     mov        r10, qword ptr [r11 + rdx + 0x24]
0224c 4d89540b24                     mov        qword ptr [r11 + rcx + 0x24], r10
02251 4d8b54132c                     mov        r10, qword ptr [r11 + rdx + 0x2c]
02256 4d89540b2c                     mov        qword ptr [r11 + rcx + 0x2c], r10
0225b 4d8b541334                     mov        r10, qword ptr [r11 + rdx + 0x34]
02260 4d89540b34                     mov        qword ptr [r11 + rcx + 0x34], r10
02265 4d8b54133c                     mov        r10, qword ptr [r11 + rdx + 0x3c]
0226a 4d89540b3c                     mov        qword ptr [r11 + rcx + 0x3c], r10
0226f 4d8b541344                     mov        r10, qword ptr [r11 + rdx + 0x44]
02274 4d89540b44                     mov        qword ptr [r11 + rcx + 0x44], r10
02279 4183c140                       add        r9d, 0x40
0227d 443bcf                         cmp        r9d, edi
02280 0f8c7affffff                   jl         0x7f63dbc0ad80
02286 443bcb                         cmp        r9d, ebx
02289 0f8d0cefffff                   jge        0x7f63dbc09d1b
0228f 4d63d1                         movsxd     r10, r9d
02292 4d03d0                         add        r10, r8
02295 4c3b9424a8000000               cmp        r10, qword ptr [rsp + 0xa8]
0229d 0f83dd180000                   jae        0x7f63dbc0c700
022a3 443b8c2498000000               cmp        r9d, dword ptr [rsp + 0x98]
022ab 0f83e3180000                   jae        0x7f63dbc0c714
022b1 90                             nop        
022b2 90                             nop        
022b3 90                             nop        
022b4 448b9424e0000000               mov        r10d, dword ptr [rsp + 0xe0]
022bc 4503d1                         add        r10d, r9d
022bf 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
022c7 4f8b5c100c                     mov        r11, qword ptr [r8 + r10 + 0xc]
022cc 458bd1                         mov        r10d, r9d
022cf 4f895c100c                     mov        qword ptr [r8 + r10 + 0xc], r11
022d4 4183c108                       add        r9d, 8
022d8 443bcb                         cmp        r9d, ebx
022db 7cd7                           jl         0x7f63dbc0ae34
022dd e9b9eeffff                     jmp        0x7f63dbc09d1b
022e2 bee4ffffff                     mov        esi, 0xffffffe4
022e7 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
022ec 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
022f1 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
022f9 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
022fe 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02306 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0230b 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02313 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02318 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0231d 48894424f8                     mov        qword ptr [rsp - 8], rax
02322 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02326 89442418                       mov        dword ptr [rsp + 0x18], eax
0232a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0232f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02334 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02339 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0233e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02343 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02348 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0234d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02352 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02357 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0235c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02361 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02366 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
0236b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02370 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02375 89442448                       mov        dword ptr [rsp + 0x48], eax
02379 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
0237d 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02381 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02386 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0238b 90                             nop        
0238c c5f877                         vzeroupper 
0238f e84cf8adff                     call       0x7f63db6ea760
02394 0f1f84008c240012               nop        dword ptr [rax + rax + 0x1200248c]
0239c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
023a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
023aa e8d159b218                     call       0x7f63f4730900
023af f4                             hlt        
023b0 beccffffff                     mov        esi, 0xffffffcc
023b5 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
023ba 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
023c2 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
023c7 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
023cf 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
023d4 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
023dc 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
023e1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
023e6 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
023ee 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023f3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
023f8 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
023fd 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02402 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02407 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0240c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02411 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02416 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0241b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02420 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02425 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0242a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0242f 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02434 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02439 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0243e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02443 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02448 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02450 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02455 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
0245a 90                             nop        
0245b 90                             nop        
0245c c5f877                         vzeroupper 
0245f e87cf7adff                     call       0x7f63db6ea760
02464 0f1f84005c250013               nop        dword ptr [rax + rax + 0x1300255c]
0246c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02476 4883e4f0                       and        rsp, 0xfffffffffffffff0
0247a e80159b218                     call       0x7f63f4730900
0247f f4                             hlt        
02480 bee4ffffff                     mov        esi, 0xffffffe4
02485 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0248a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0248f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02497 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0249c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
024a4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
024a9 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
024b1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
024b6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
024bb 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
024c3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
024c8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
024cd 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
024d2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
024d7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
024dc 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
024e1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
024e6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
024eb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
024f0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
024f5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
024fa 4489542438                     mov        dword ptr [rsp + 0x38], r10d
024ff 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02504 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02509 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
0250e 4489542454                     mov        dword ptr [rsp + 0x54], r10d
02513 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02518 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0251d 4489742464                     mov        dword ptr [rsp + 0x64], r14d
02522 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02527 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0252c c5f877                         vzeroupper 
0252f e8acf6adff                     call       0x7f63db6ea760
02534 0f1f84002c260014               nop        dword ptr [rax + rax + 0x1400262c]
0253c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02546 4883e4f0                       and        rsp, 0xfffffffffffffff0
0254a e83158b218                     call       0x7f63f4730900
0254f f4                             hlt        
02550 bee4ffffff                     mov        esi, 0xffffffe4
02555 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0255a 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02562 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02567 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0256f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02574 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0257c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02581 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02586 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0258e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02593 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02598 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0259d 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
025a2 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
025a7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
025ac 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
025b1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
025b6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
025bb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025c0 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
025c5 4489542444                     mov        dword ptr [rsp + 0x44], r10d
025ca 4489742454                     mov        dword ptr [rsp + 0x54], r14d
025cf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
025d4 4c89542468                     mov        qword ptr [rsp + 0x68], r10
025d9 90                             nop        
025da 90                             nop        
025db 90                             nop        
025dc c5f877                         vzeroupper 
025df e8fcf5adff                     call       0x7f63db6ea760
025e4 0f1f8400dc260015               nop        dword ptr [rax + rax + 0x150026dc]
025ec 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
025f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
025fa e88157b218                     call       0x7f63f4730900
025ff f4                             hlt        
02600 418d6e01                       lea        ebp, [r14 + 1]
02604 bee4ffffff                     mov        esi, 0xffffffe4
02609 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0260e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02616 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0261b 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
02623 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02628 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02630 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02635 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0263a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02642 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02647 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0264c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02651 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02656 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
0265b 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02660 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02665 4c89542438                     mov        qword ptr [rsp + 0x38], r10
0266a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0266f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02674 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02679 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0267e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02683 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02688 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0268d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02692 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02697 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
0269c c5f877                         vzeroupper 
0269f e83cf5adff                     call       0x7f63db6ea760
026a4 0f1f84009c270016               nop        dword ptr [rax + rax + 0x1600279c]
026ac 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
026b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ba e8c156b218                     call       0x7f63f4730900
026bf f4                             hlt        
026c0 bee4ffffff                     mov        esi, 0xffffffe4
026c5 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
026ca 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
026d2 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
026d7 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
026df 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
026e4 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
026ec 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
026f1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
026f6 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
026fe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02703 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02708 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0270d 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02712 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02717 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0271c 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02721 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02726 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0272b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02730 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02735 4489542444                     mov        dword ptr [rsp + 0x44], r10d
0273a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0273f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02744 4489742454                     mov        dword ptr [rsp + 0x54], r14d
02749 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0274e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02753 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
02758 c5f877                         vzeroupper 
0275b e880f4adff                     call       0x7f63db6ea760
02760 0f1f840058280017               nop        dword ptr [rax + rax + 0x17002858]
02768 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02772 4883e4f0                       and        rsp, 0xfffffffffffffff0
02776 e80556b218                     call       0x7f63f4730900
0277b f4                             hlt        
0277c bee4ffffff                     mov        esi, 0xffffffe4
02781 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02786 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0278b 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02793 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02798 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
027a0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
027a5 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
027ad 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
027b2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
027b7 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
027bf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
027c4 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
027c9 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
027ce 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
027d3 4c89542420                     mov        qword ptr [rsp + 0x20], r10
027d8 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
027dd 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
027e2 4c89542428                     mov        qword ptr [rsp + 0x28], r10
027e7 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
027ec 4c89542430                     mov        qword ptr [rsp + 0x30], r10
027f1 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
027f6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
027fb 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02800 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02805 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0280a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0280f 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02814 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02819 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0281e 90                             nop        
0281f 90                             nop        
02820 c5f877                         vzeroupper 
02823 e8b8f3adff                     call       0x7f63db6ea760
02828 0f1f840020290018               nop        dword ptr [rax + rax + 0x18002920]
02830 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
0283a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0283e e83d55b218                     call       0x7f63f4730900
02843 f4                             hlt        
02844 bee4ffffff                     mov        esi, 0xffffffe4
02849 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0284e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02853 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
0285b 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02860 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02868 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0286d 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02875 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0287a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0287f 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02887 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0288c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02891 4489542418                     mov        dword ptr [rsp + 0x18], r10d
02896 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0289b 4c89542420                     mov        qword ptr [rsp + 0x20], r10
028a0 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
028a5 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
028aa 4c89542428                     mov        qword ptr [rsp + 0x28], r10
028af 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
028b4 4c89542430                     mov        qword ptr [rsp + 0x30], r10
028b9 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
028be 4489542438                     mov        dword ptr [rsp + 0x38], r10d
028c3 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
028c8 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
028cd 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
028d2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
028d7 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
028dc 4489542450                     mov        dword ptr [rsp + 0x50], r10d
028e1 4489742460                     mov        dword ptr [rsp + 0x60], r14d
028e6 48ff742478                     push       qword ptr [rsp + 0x78]
028eb 488f442468                     pop        qword ptr [rsp + 0x68]
028f0 4489442478                     mov        dword ptr [rsp + 0x78], r8d
028f5 90                             nop        
028f6 90                             nop        
028f7 90                             nop        
028f8 c5f877                         vzeroupper 
028fb e8e0f2adff                     call       0x7f63db6ea760
02900 0f1f8400f8290019               nop        dword ptr [rax + rax + 0x190029f8]
02908 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02912 4883e4f0                       and        rsp, 0xfffffffffffffff0
02916 e86554b218                     call       0x7f63f4730900
0291b f4                             hlt        
0291c bee4ffffff                     mov        esi, 0xffffffe4
02921 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02926 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0292e 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02933 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0293b 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02940 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
02948 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0294d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02952 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0295a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0295f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02964 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02969 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0296e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02973 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02978 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0297d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02982 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02987 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0298c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02991 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02996 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0299b 4489542450                     mov        dword ptr [rsp + 0x50], r10d
029a0 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
029a5 4489542458                     mov        dword ptr [rsp + 0x58], r10d
029aa 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
029af 4c89542460                     mov        qword ptr [rsp + 0x60], r10
029b4 48ff742470                     push       qword ptr [rsp + 0x70]
029b9 488f442468                     pop        qword ptr [rsp + 0x68]
029be 894c2474                       mov        dword ptr [rsp + 0x74], ecx
029c2 4489442478                     mov        dword ptr [rsp + 0x78], r8d
029c7 90                             nop        
029c8 c5f877                         vzeroupper 
029cb e810f2adff                     call       0x7f63db6ea760
029d0 0f1f8400c82a001a               nop        dword ptr [rax + rax + 0x1a002ac8]
029d8 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
029e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
029e6 e89553b218                     call       0x7f63f4730900
029eb f4                             hlt        
029ec 4585c9                         test       r9d, r9d
029ef 0f84b3110000                   je         0x7f63dbc0c728
029f5 4d8bc1                         mov        r8, r9
029f8 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
029fd 4533db                         xor        r11d, r11d
02a00 458bd1                         mov        r10d, r9d
02a03 e9eae2ffff                     jmp        0x7f63dbc09872
02a08 be6effffff                     mov        esi, 0xffffff6e
02a0d 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02a12 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02a17 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02a1f 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02a24 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02a2c 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02a31 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02a39 48894424f8                     mov        qword ptr [rsp - 8], rax
02a3e 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02a42 89442418                       mov        dword ptr [rsp + 0x18], eax
02a46 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02a4b 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02a50 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02a55 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02a5a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02a5f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02a64 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02a69 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02a6e 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02a73 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02a78 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02a7d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02a82 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02a87 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02a8c 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02a91 89442448                       mov        dword ptr [rsp + 0x48], eax
02a95 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02a9a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02a9f 895c2458                       mov        dword ptr [rsp + 0x58], ebx
02aa3 894c2460                       mov        dword ptr [rsp + 0x60], ecx
02aa7 90                             nop        
02aa8 c5f877                         vzeroupper 
02aab e830f1adff                     call       0x7f63db6ea760
02ab0 0f1f8400a82b001b               nop        dword ptr [rax + rax + 0x1b002ba8]
02ab8 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02ac2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ac6 e8b552b218                     call       0x7f63f4730900
02acb f4                             hlt        
02acc be45ffffff                     mov        esi, 0xffffff45
02ad1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02ad6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02adb 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02ae3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02ae8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02af0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02af5 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02afd 48894424f8                     mov        qword ptr [rsp - 8], rax
02b02 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02b06 89442418                       mov        dword ptr [rsp + 0x18], eax
02b0a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02b0f 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02b14 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02b19 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02b1e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02b23 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02b28 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02b2d 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02b32 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02b37 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02b3c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02b41 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02b46 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02b4b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02b50 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02b55 89442448                       mov        dword ptr [rsp + 0x48], eax
02b59 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
02b5d 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02b61 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02b66 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02b6b 90                             nop        
02b6c c5f877                         vzeroupper 
02b6f e86cf0adff                     call       0x7f63db6ea760
02b74 0f1f84006c2c001c               nop        dword ptr [rax + rax + 0x1c002c6c]
02b7c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02b86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b8a e8f151b218                     call       0x7f63f4730900
02b8f f4                             hlt        
02b90 be3dffffff                     mov        esi, 0xffffff3d
02b95 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02b9a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02b9f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02ba7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02bac 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02bb4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02bb9 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02bc1 48894424f8                     mov        qword ptr [rsp - 8], rax
02bc6 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02bca 89442418                       mov        dword ptr [rsp + 0x18], eax
02bce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02bd3 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
02bd8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02bdd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02be2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02be7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
02bec 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02bf1 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02bf6 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02bfb 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02c00 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02c05 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
02c0a 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02c0f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02c14 4489442444                     mov        dword ptr [rsp + 0x44], r8d
02c19 89442448                       mov        dword ptr [rsp + 0x48], eax
02c1d 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
02c21 894c245c                       mov        dword ptr [rsp + 0x5c], ecx
02c25 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02c2a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02c2f 90                             nop        
02c30 c5f877                         vzeroupper 
02c33 e8a8efadff                     call       0x7f63db6ea760
02c38 0f1f8400302d001d               nop        dword ptr [rax + rax + 0x1d002d30]
02c40 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02c4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c4e e82d51b218                     call       0x7f63f4730900
02c53 f4                             hlt        
02c54 bee4ffffff                     mov        esi, 0xffffffe4
02c59 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02c5e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02c66 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02c6b 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02c73 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02c78 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02c80 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02c85 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02c8a 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02c92 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02c97 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
02c9c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02ca1 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02ca6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02cab 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02cb0 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02cb5 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02cba 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02cbf 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02cc4 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02cc9 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
02cce 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02cd3 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
02cd8 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02cdd 4489542450                     mov        dword ptr [rsp + 0x50], r10d
02ce2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02ce7 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02cec 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
02cf1 90                             nop        
02cf2 90                             nop        
02cf3 90                             nop        
02cf4 c5f877                         vzeroupper 
02cf7 e8e4eeadff                     call       0x7f63db6ea760
02cfc 0f1f8400f42d001e               nop        dword ptr [rax + rax + 0x1e002df4]
02d04 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02d0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d12 e86950b218                     call       0x7f63f4730900
02d17 f4                             hlt        
02d18 bee4ffffff                     mov        esi, 0xffffffe4
02d1d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
02d22 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
02d2a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02d2f 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
02d37 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02d3c 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
02d44 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02d49 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02d4e 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02d56 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02d5b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02d60 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
02d65 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
02d6a 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02d6f 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02d74 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02d79 4c89542438                     mov        qword ptr [rsp + 0x38], r10
02d7e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02d83 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02d88 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02d8d 4489542444                     mov        dword ptr [rsp + 0x44], r10d
02d92 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
02d97 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02d9c 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02da1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
02da6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
02dab 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02db0 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
02db5 90                             nop        
02db6 90                             nop        
02db7 90                             nop        
02db8 c5f877                         vzeroupper 
02dbb e820eeadff                     call       0x7f63db6ea760
02dc0 0f1f8400b82e001f               nop        dword ptr [rax + rax + 0x1f002eb8]
02dc8 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02dd2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dd6 e8a54fb218                     call       0x7f63f4730900
02ddb f4                             hlt        
02ddc beccffffff                     mov        esi, 0xffffffcc
02de1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02de6 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02deb 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02df3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02df8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02e00 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02e05 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02e0d 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02e12 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02e17 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
02e1f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02e24 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
02e29 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02e2e 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02e33 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02e38 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02e3d 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02e42 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02e47 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02e4c 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02e51 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02e56 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02e5b 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
02e60 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02e65 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
02e6a 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
02e6f 4489742458                     mov        dword ptr [rsp + 0x58], r14d
02e74 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
02e79 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02e7e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
02e83 4c89542468                     mov        qword ptr [rsp + 0x68], r10
02e88 c5f877                         vzeroupper 
02e8b e850edadff                     call       0x7f63db6ea760
02e90 0f1f8400882f0020               nop        dword ptr [rax + rax + 0x20002f88]
02e98 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02ea2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ea6 e8d54eb218                     call       0x7f63f4730900
02eab f4                             hlt        
02eac bee4ffffff                     mov        esi, 0xffffffe4
02eb1 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02eb6 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
02ebb 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
02ec3 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02ec8 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02ed0 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
02ed5 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
02edd 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02ee2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02ee7 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02eec 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02ef1 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02ef6 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02efb 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02f00 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02f05 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02f0a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f0f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02f14 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02f19 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02f1e 89442444                       mov        dword ptr [rsp + 0x44], eax
02f22 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02f27 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02f2c 895c2450                       mov        dword ptr [rsp + 0x50], ebx
02f30 48894424f8                     mov        qword ptr [rsp - 8], rax
02f35 8b442464                       mov        eax, dword ptr [rsp + 0x64]
02f39 89442454                       mov        dword ptr [rsp + 0x54], eax
02f3d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02f42 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
02f47 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
02f4c c5f877                         vzeroupper 
02f4f e88cecadff                     call       0x7f63db6ea760
02f54 0f1f84004c300021               nop        dword ptr [rax + rax + 0x2100304c]
02f5c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
02f66 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f6a e8114eb218                     call       0x7f63f4730900
02f6f f4                             hlt        
02f70 bee4ffffff                     mov        esi, 0xffffffe4
02f75 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
02f7a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
02f7f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
02f87 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
02f8c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
02f94 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
02f99 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
02fa1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
02fa6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02fab 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
02fb3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02fb8 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
02fbd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
02fc2 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
02fc7 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
02fcc 4c89542428                     mov        qword ptr [rsp + 0x28], r10
02fd1 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
02fd6 4c89542430                     mov        qword ptr [rsp + 0x30], r10
02fdb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02fe0 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02fe5 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
02fea 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02fef 89442444                       mov        dword ptr [rsp + 0x44], eax
02ff3 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
02ff8 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02ffd 895c2450                       mov        dword ptr [rsp + 0x50], ebx
03001 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
03006 48894424f8                     mov        qword ptr [rsp - 8], rax
0300b 8b442464                       mov        eax, dword ptr [rsp + 0x64]
0300f 89442460                       mov        dword ptr [rsp + 0x60], eax
03013 488b4424f8                     mov        rax, qword ptr [rsp - 8]
03018 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0301d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
03022 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0302a 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0302f c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
03038 c5f877                         vzeroupper 
0303b e8a0ebadff                     call       0x7f63db6ea760
03040 0f1f840038310022               nop        dword ptr [rax + rax + 0x22003138]
03048 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03052 4883e4f0                       and        rsp, 0xfffffffffffffff0
03056 e8254db218                     call       0x7f63f4730900
0305b f4                             hlt        
0305c 418be9                         mov        ebp, r9d
0305f 83c510                         add        ebp, 0x10
03062 be6effffff                     mov        esi, 0xffffff6e
03067 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
0306c 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
03074 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
03079 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
03081 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
03086 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
0308e 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03093 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03098 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0309d 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
030a2 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
030a7 4c89542430                     mov        qword ptr [rsp + 0x30], r10
030ac 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
030b1 4c89542438                     mov        qword ptr [rsp + 0x38], r10
030b6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
030bb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
030c0 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
030c5 4489542444                     mov        dword ptr [rsp + 0x44], r10d
030ca 8944244c                       mov        dword ptr [rsp + 0x4c], eax
030ce 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
030d3 4489542450                     mov        dword ptr [rsp + 0x50], r10d
030d8 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
030dc 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
030e1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
030e6 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
030eb 4c89542468                     mov        qword ptr [rsp + 0x68], r10
030f0 897c2478                       mov        dword ptr [rsp + 0x78], edi
030f4 c5f877                         vzeroupper 
030f7 e8e4eaadff                     call       0x7f63db6ea760
030fc 0f1f8400f4310023               nop        dword ptr [rax + rax + 0x230031f4]
03104 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
0310e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03112 e8694cb218                     call       0x7f63f4730900
03117 f4                             hlt        
03118 418be9                         mov        ebp, r9d
0311b 83c510                         add        ebp, 0x10
0311e be66ffffff                     mov        esi, 0xffffff66
03123 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
03128 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
03130 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03135 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0313d 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03142 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
0314a 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0314f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03154 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
03159 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
0315e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03163 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03168 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0316d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03172 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03177 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0317c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03181 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
03186 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0318a 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0318f 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
03194 895c245c                       mov        dword ptr [rsp + 0x5c], ebx
03198 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0319d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
031a2 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
031a7 4c89542468                     mov        qword ptr [rsp + 0x68], r10
031ac 897c2478                       mov        dword ptr [rsp + 0x78], edi
031b0 c5f877                         vzeroupper 
031b3 e828eaadff                     call       0x7f63db6ea760
031b8 0f1f8400b0320024               nop        dword ptr [rax + rax + 0x240032b0]
031c0 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
031ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ce e8ad4bb218                     call       0x7f63f4730900
031d3 f4                             hlt        
031d4 be17000000                     mov        esi, 0x17
031d9 90                             nop        
031da 90                             nop        
031db 90                             nop        
031dc c5f877                         vzeroupper 
031df e8fce9adff                     call       0x7f63db6ea760
031e4 0f1f8400dc320025               nop        dword ptr [rax + rax + 0x250032dc]
031ec 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
031f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
031fa e8814bb218                     call       0x7f63f4730900
031ff f4                             hlt        
03200 be6effffff                     mov        esi, 0xffffff6e
03205 48899424e0000000               mov        qword ptr [rsp + 0xe0], rdx
0320d 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
03212 48ff742428                     push       qword ptr [rsp + 0x28]
03217 488f442420                     pop        qword ptr [rsp + 0x20]
0321c 897c2428                       mov        dword ptr [rsp + 0x28], edi
03220 4c89442430                     mov        qword ptr [rsp + 0x30], r8
03225 48ff742440                     push       qword ptr [rsp + 0x40]
0322a 488f442438                     pop        qword ptr [rsp + 0x38]
0322f 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
03233 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
03238 4c89742448                     mov        qword ptr [rsp + 0x48], r14
0323d 90                             nop        
0323e 90                             nop        
0323f 90                             nop        
03240 c5f877                         vzeroupper 
03243 e898e9adff                     call       0x7f63db6ea760
03248 0f1f840040330026               nop        dword ptr [rax + rax + 0x26003340]
03250 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
0325a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0325e e81d4bb218                     call       0x7f63f4730900
03263 f4                             hlt        
03264 bebeffffff                     mov        esi, 0xffffffbe
03269 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
03271 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
03276 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
0327e 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
03283 4889542418                     mov        qword ptr [rsp + 0x18], rdx
03288 48ff742428                     push       qword ptr [rsp + 0x28]
0328d 488f442420                     pop        qword ptr [rsp + 0x20]
03292 897c2428                       mov        dword ptr [rsp + 0x28], edi
03296 4c89442430                     mov        qword ptr [rsp + 0x30], r8
0329b 48ff742440                     push       qword ptr [rsp + 0x40]
032a0 488f442438                     pop        qword ptr [rsp + 0x38]
032a5 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
032a9 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
032ae 4c89742448                     mov        qword ptr [rsp + 0x48], r14
032b3 90                             nop        
032b4 c5f877                         vzeroupper 
032b7 e824e9adff                     call       0x7f63db6ea760
032bc 0f1f8400b4330027               nop        dword ptr [rax + rax + 0x270033b4]
032c4 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
032ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
032d2 e8a94ab218                     call       0x7f63f4730900
032d7 f4                             hlt        
032d8 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
032dd 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
032e2 bef6ffffff                     mov        esi, 0xfffffff6
032e7 498bed                         mov        rbp, r13
032ea 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
032f2 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
032fa 90                             nop        
032fb 90                             nop        
032fc c5f877                         vzeroupper 
032ff e8dce8adff                     call       0x7f63db6ea760
03304 0f1f8400fc330028               nop        dword ptr [rax + rax + 0x280033fc]
0330c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03316 4883e4f0                       and        rsp, 0xfffffffffffffff0
0331a e8614ab218                     call       0x7f63f4730900
0331f f4                             hlt        
03320 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03324 eb10                           jmp        0x7f63dbc0beb6
03326 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
0332a eb0a                           jmp        0x7f63dbc0beb6
0332c 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03330 eb04                           jmp        0x7f63dbc0beb6
03332 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03336 beccffffff                     mov        esi, 0xffffffcc
0333b 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
03343 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0334b 4c89742410                     mov        qword ptr [rsp + 0x10], r14
03350 4c89442418                     mov        qword ptr [rsp + 0x18], r8
03355 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0335a 90                             nop        
0335b 90                             nop        
0335c c5f877                         vzeroupper 
0335f e87ce8adff                     call       0x7f63db6ea760
03364 0f1f84005c340029               nop        dword ptr [rax + rax + 0x2900345c]
0336c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03376 4883e4f0                       and        rsp, 0xfffffffffffffff0
0337a e8014ab218                     call       0x7f63f4730900
0337f f4                             hlt        
03380 8b6c2464                       mov        ebp, dword ptr [rsp + 0x64]
03384 4c8b742478                     mov        r14, qword ptr [rsp + 0x78]
03389 4c8b6c2468                     mov        r13, qword ptr [rsp + 0x68]
0338e eba6                           jmp        0x7f63dbc0beb6
03390 bee4ffffff                     mov        esi, 0xffffffe4
03395 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0339a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0339f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
033a7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
033ac 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
033b4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
033b9 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
033c1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
033c6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
033cb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
033d3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
033d8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
033dd 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
033e2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
033e7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
033ec 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
033f1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
033f6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
033fb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03400 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03405 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0340a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0340f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
03414 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
03419 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0341d 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
03422 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
03427 448974245c                     mov        dword ptr [rsp + 0x5c], r14d
0342c c5f877                         vzeroupper 
0342f e8ace7adff                     call       0x7f63db6ea760
03434 0f1f84002c35002a               nop        dword ptr [rax + rax + 0x2a00352c]
0343c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03446 4883e4f0                       and        rsp, 0xfffffffffffffff0
0344a e83149b218                     call       0x7f63f4730900
0344f f4                             hlt        
03450 bee4ffffff                     mov        esi, 0xffffffe4
03455 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0345a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0345f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
03467 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0346c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
03474 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03479 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
03481 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03486 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0348b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
03493 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03498 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0349d 4489542418                     mov        dword ptr [rsp + 0x18], r10d
034a2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
034a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
034ac 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
034b1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
034b6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
034bb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
034c0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
034c5 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
034ca 4489542438                     mov        dword ptr [rsp + 0x38], r10d
034cf 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
034d4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
034d9 895c2444                       mov        dword ptr [rsp + 0x44], ebx
034dd 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
034e2 4489542450                     mov        dword ptr [rsp + 0x50], r10d
034e7 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
034ec 4c89542460                     mov        qword ptr [rsp + 0x60], r10
034f1 8944246c                       mov        dword ptr [rsp + 0x6c], eax
034f5 48894c2470                     mov        qword ptr [rsp + 0x70], rcx
034fa 90                             nop        
034fb 90                             nop        
034fc c5f877                         vzeroupper 
034ff e8dce6adff                     call       0x7f63db6ea760
03504 0f1f8400fc35002b               nop        dword ptr [rax + rax + 0x2b0035fc]
0350c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03516 4883e4f0                       and        rsp, 0xfffffffffffffff0
0351a e86148b218                     call       0x7f63f4730900
0351f f4                             hlt        
03520 448bd0                         mov        r10d, eax
03523 4183c208                       add        r10d, 8
03527 be6effffff                     mov        esi, 0xffffff6e
0352c 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
03531 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
03536 44898424e0000000               mov        dword ptr [rsp + 0xe0], r8d
0353e 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
03543 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
0354b 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
03550 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
03558 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0355d 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
03562 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
03567 4489442418                     mov        dword ptr [rsp + 0x18], r8d
0356c 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
03571 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
03576 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0357b 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
03580 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
03585 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0358a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0358f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
03594 4489442438                     mov        dword ptr [rsp + 0x38], r8d
03599 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
0359e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
035a3 895c2448                       mov        dword ptr [rsp + 0x48], ebx
035a7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
035ac c5f877                         vzeroupper 
035af e82ce6adff                     call       0x7f63db6ea760
035b4 0f1f8400ac36002c               nop        dword ptr [rax + rax + 0x2c0036ac]
035bc 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
035c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
035ca e8b147b218                     call       0x7f63f4730900
035cf f4                             hlt        
035d0 448bd0                         mov        r10d, eax
035d3 4183c208                       add        r10d, 8
035d7 be66ffffff                     mov        esi, 0xffffff66
035dc 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
035e1 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
035e6 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
035ee 4c8b5c2410                     mov        r11, qword ptr [rsp + 0x10]
035f3 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
035fb 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
03600 44898424e4000000               mov        dword ptr [rsp + 0xe4], r8d
03608 4c8b5c2450                     mov        r11, qword ptr [rsp + 0x50]
0360d 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
03612 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
03617 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0361c 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
03621 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
03626 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
0362b 4c8b5c2438                     mov        r11, qword ptr [rsp + 0x38]
03630 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
03635 4c8b5c2440                     mov        r11, qword ptr [rsp + 0x40]
0363a 4c895c2430                     mov        qword ptr [rsp + 0x30], r11
0363f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
03644 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
03649 448b442458                     mov        r8d, dword ptr [rsp + 0x58]
0364e 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
03653 895c2448                       mov        dword ptr [rsp + 0x48], ebx
03657 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0365c c5f877                         vzeroupper 
0365f e87ce5adff                     call       0x7f63db6ea760
03664 0f1f84005c37002d               nop        dword ptr [rax + rax + 0x2d00375c]
0366c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03676 4883e4f0                       and        rsp, 0xfffffffffffffff0
0367a e80147b218                     call       0x7f63f4730900
0367f f4                             hlt        
03680 8bf2                           mov        esi, edx
03682 e9bfdaffff                     jmp        0x7f63dbc09cc6
03687 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03691 4883e4f0                       and        rsp, 0xfffffffffffffff0
03695 e8e646b218                     call       0x7f63f4730900
0369a f4                             hlt        
0369b 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
036a5 4883e4f0                       and        rsp, 0xfffffffffffffff0
036a9 e8d246b218                     call       0x7f63f4730900
036ae f4                             hlt        
036af 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
036b9 4883e4f0                       and        rsp, 0xfffffffffffffff0
036bd e8be46b218                     call       0x7f63f4730900
036c2 f4                             hlt        
036c3 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
036cd 4883e4f0                       and        rsp, 0xfffffffffffffff0
036d1 e8aa46b218                     call       0x7f63f4730900
036d6 f4                             hlt        
036d7 beccffffff                     mov        esi, 0xffffffcc
036dc 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
036e1 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
036e6 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
036ee 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
036f3 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
036fb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
03700 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
03708 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0370d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03712 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0371a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0371f 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
03724 4c89542420                     mov        qword ptr [rsp + 0x20], r10
03729 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
0372e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03733 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03738 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
0373d 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03742 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03747 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0374c 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03751 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
03756 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
0375b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
03760 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
03765 89442468                       mov        dword ptr [rsp + 0x68], eax
03769 90                             nop        
0376a 90                             nop        
0376b 90                             nop        
0376c c5f877                         vzeroupper 
0376f e86ce4adff                     call       0x7f63db6ea760
03774 0f1f84006c38002e               nop        dword ptr [rax + rax + 0x2e00386c]
0377c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03786 4883e4f0                       and        rsp, 0xfffffffffffffff0
0378a e8f145b218                     call       0x7f63f4730900
0378f f4                             hlt        
03790 bee4ffffff                     mov        esi, 0xffffffe4
03795 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0379a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0379f 44899424e0000000               mov        dword ptr [rsp + 0xe0], r10d
037a7 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
037ac 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
037b4 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
037b9 44899c24e4000000               mov        dword ptr [rsp + 0xe4], r11d
037c1 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
037c6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
037cb 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
037d3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
037d8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
037dd 4489542418                     mov        dword ptr [rsp + 0x18], r10d
037e2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
037e7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
037ec 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
037f1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
037f6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
037fb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03800 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03805 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0380a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0380f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03814 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03819 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0381d 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
03822 4489542448                     mov        dword ptr [rsp + 0x48], r10d
03827 4489742454                     mov        dword ptr [rsp + 0x54], r14d
0382c c5f877                         vzeroupper 
0382f e8ace3adff                     call       0x7f63db6ea760
03834 0f1f84002c39002f               nop        dword ptr [rax + rax + 0x2f00392c]
0383c 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03846 4883e4f0                       and        rsp, 0xfffffffffffffff0
0384a e83145b218                     call       0x7f63f4730900
0384f f4                             hlt        
03850 bee4ffffff                     mov        esi, 0xffffffe4
03855 488b6c2468                     mov        rbp, qword ptr [rsp + 0x68]
0385a 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0385f 44899c24e0000000               mov        dword ptr [rsp + 0xe0], r11d
03867 4c8b542410                     mov        r10, qword ptr [rsp + 0x10]
0386c 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
03874 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03879 44899424e4000000               mov        dword ptr [rsp + 0xe4], r10d
03881 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
03886 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0388b 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
03893 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03898 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0389d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
038a2 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
038a7 4c89542420                     mov        qword ptr [rsp + 0x20], r10
038ac 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
038b1 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
038b6 4c89542428                     mov        qword ptr [rsp + 0x28], r10
038bb 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
038c0 4c89542430                     mov        qword ptr [rsp + 0x30], r10
038c5 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
038ca 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
038cf 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
038d4 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
038d9 895c2444                       mov        dword ptr [rsp + 0x44], ebx
038dd 448974244c                     mov        dword ptr [rsp + 0x4c], r14d
038e2 4489442454                     mov        dword ptr [rsp + 0x54], r8d
038e7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
038ec 4c89542460                     mov        qword ptr [rsp + 0x60], r10
038f1 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
038f6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
038fb c5fa7f442470                   vmovdqu    xmmword ptr [rsp + 0x70], xmm0
03901 90                             nop        
03902 90                             nop        
03903 90                             nop        
03904 c5f877                         vzeroupper 
03907 e8d4e2adff                     call       0x7f63db6ea760
0390c 0f1f8400043a0030               nop        dword ptr [rax + rax + 0x30003a04]
03914 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
0391e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03922 e85944b218                     call       0x7f63f4730900
03927 f4                             hlt        
03928 4183c610                       add        r14d, 0x10
0392c be6effffff                     mov        esi, 0xffffff6e
03931 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
03936 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0393e 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
03943 44899c24e8000000               mov        dword ptr [rsp + 0xe8], r11d
0394b 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
03950 44899424ec000000               mov        dword ptr [rsp + 0xec], r10d
03958 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
0395d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03962 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
03967 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0396c 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
03971 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03976 4c89542430                     mov        qword ptr [rsp + 0x30], r10
0397b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03980 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03985 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0398a 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0398f 448b5c2458                     mov        r11d, dword ptr [rsp + 0x58]
03994 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
03999 4489742450                     mov        dword ptr [rsp + 0x50], r14d
0399e 895c2454                       mov        dword ptr [rsp + 0x54], ebx
039a2 90                             nop        
039a3 90                             nop        
039a4 c5f877                         vzeroupper 
039a7 e834e2adff                     call       0x7f63db6ea760
039ac 0f1f8400a43a0031               nop        dword ptr [rax + rax + 0x31003aa4]
039b4 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
039be 4883e4f0                       and        rsp, 0xfffffffffffffff0
039c2 e8b943b218                     call       0x7f63f4730900
039c7 f4                             hlt        
039c8 4183c610                       add        r14d, 0x10
039cc be66ffffff                     mov        esi, 0xffffff66
039d1 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
039d6 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
039de 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
039e3 44899424e8000000               mov        dword ptr [rsp + 0xe8], r10d
039eb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
039f0 44899c24ec000000               mov        dword ptr [rsp + 0xec], r11d
039f8 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
039fd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03a02 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
03a07 4489542420                     mov        dword ptr [rsp + 0x20], r10d
03a0c 44896c2424                     mov        dword ptr [rsp + 0x24], r13d
03a11 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
03a16 4c89542430                     mov        qword ptr [rsp + 0x30], r10
03a1b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
03a20 4c89542438                     mov        qword ptr [rsp + 0x38], r10
03a25 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
03a2a 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
03a2f 448b542458                     mov        r10d, dword ptr [rsp + 0x58]
03a34 4489542444                     mov        dword ptr [rsp + 0x44], r10d
03a39 4489742450                     mov        dword ptr [rsp + 0x50], r14d
03a3e 895c2454                       mov        dword ptr [rsp + 0x54], ebx
03a42 90                             nop        
03a43 90                             nop        
03a44 c5f877                         vzeroupper 
03a47 e894e1adff                     call       0x7f63db6ea760
03a4c 0f1f8400443b0032               nop        dword ptr [rax + rax + 0x32003b44]
03a54 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03a5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a62 e81943b218                     call       0x7f63f4730900
03a67 f4                             hlt        
03a68 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03a72 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a76 e80543b218                     call       0x7f63f4730900
03a7b f4                             hlt        
03a7c 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03a86 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a8a e8f142b218                     call       0x7f63f4730900
03a8f f4                             hlt        
03a90 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03a9e e8dd42b218                     call       0x7f63f4730900
03aa3 f4                             hlt        
03aa4 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03aae 4883e4f0                       and        rsp, 0xfffffffffffffff0
03ab2 e8c942b218                     call       0x7f63f4730900
03ab7 f4                             hlt        
03ab8 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03ac2 4883e4f0                       and        rsp, 0xfffffffffffffff0
03ac6 e8b542b218                     call       0x7f63f4730900
03acb f4                             hlt        
03acc 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03ad6 4883e4f0                       and        rsp, 0xfffffffffffffff0
03ada e8a142b218                     call       0x7f63f4730900
03adf f4                             hlt        
03ae0 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
03aee e88d42b218                     call       0x7f63f4730900
03af3 f4                             hlt        
03af4 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03afe 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b02 e87942b218                     call       0x7f63f4730900
03b07 f4                             hlt        
03b08 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b12 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b16 e86542b218                     call       0x7f63f4730900
03b1b f4                             hlt        
03b1c 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b2a e85142b218                     call       0x7f63f4730900
03b2f f4                             hlt        
03b30 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b3e e83d42b218                     call       0x7f63f4730900
03b43 f4                             hlt        
03b44 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b52 e82942b218                     call       0x7f63f4730900
03b57 f4                             hlt        
03b58 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b62 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b66 e81542b218                     call       0x7f63f4730900
03b6b f4                             hlt        
03b6c 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b76 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b7a e80142b218                     call       0x7f63f4730900
03b7f f4                             hlt        
03b80 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
03b8e e8ed41b218                     call       0x7f63f4730900
03b93 f4                             hlt        
03b94 48bfe0c04eb4637f0000           movabs     rdi, 0x7f63b44ec0e0
03b9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03ba2 e8d941b218                     call       0x7f63f4730900
03ba7 f4                             hlt        
03ba8 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
03bad 4533c0                         xor        r8d, r8d
03bb0 e92df7ffff                     jmp        0x7f63dbc0be62
03bb5 bef6ffffff                     mov        esi, 0xfffffff6
03bba 90                             nop        
03bbb 90                             nop        
03bbc c5f877                         vzeroupper 
03bbf e81ce0adff                     call       0x7f63db6ea760
03bc4 0f1f8400bc3c0033               nop        dword ptr [rax + rax + 0x33003cbc]
03bcc 48bf606d89b4637f0000           movabs     rdi, 0x7f63b4896d60
03bd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
03bda e8a141b218                     call       0x7f63f4730900
03bdf f4                             hlt        
03be0 488bf0                         mov        rsi, rax
03be3 c5f877                         vzeroupper 
03be6 4881c4d0000000                 add        rsp, 0xd0
03bed 5d                             pop        rbp
03bee e9ed67adff                     jmp        0x7f63db6e2f60
03bf3 49bae898c0db637f0000           movabs     r10, 0x7f63dbc098e8
03bfd 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
03c04 e9d79bb3ff                     jmp        0x7f63db746360
03c09 e8526ab2ff                     call       0x7f63db7331e0
03c0e e92bc4ffff                     jmp        0x7f63dbc08bbe
03c13 f4                             hlt        
03c14 f4                             hlt        
03c15 f4                             hlt        
03c16 f4                             hlt        
03c17 f4                             hlt        
