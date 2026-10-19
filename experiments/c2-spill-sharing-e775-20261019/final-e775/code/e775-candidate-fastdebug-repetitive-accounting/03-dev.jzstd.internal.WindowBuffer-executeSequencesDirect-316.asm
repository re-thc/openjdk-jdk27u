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
0001a 0f854019b6ff                   jne        0x7f0ccb72ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f856c200000                   jne        0x7f0ccbbcf4aa
0003e 4c894c2438                     mov        qword ptr [rsp + 0x38], r9
00043 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00047 4d8bc8                         mov        r9, r8
0004a 8bcf                           mov        ecx, edi
0004c 488bde                         mov        rbx, rsi
0004f 8b4638                         mov        eax, dword ptr [rsi + 0x38]
00052 448b5604                       mov        r10d, dword ptr [rsi + 4]
00056 458bda                         mov        r11d, r10d
00059 442bd8                         sub        r11d, eax
0005c 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
00064 453bc3                         cmp        r8d, r11d
00067 0f8ff9120000                   jg         0x7f0ccbbce766
0006d 4c8b5e08                       mov        r11, qword ptr [rsi + 8]
00071 4c895c2440                     mov        qword ptr [rsp + 0x40], r11
00076 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
0007a 4c639c24c0000000               movsxd     r11, dword ptr [rsp + 0xc0]
00082 4c63c0                         movsxd     r8, eax
00085 4c03442440                     add        r8, qword ptr [rsp + 0x40]
0008a 492bf8                         sub        rdi, r8
0008d 4c3bdf                         cmp        r11, rdi
00090 0f8fd0120000                   jg         0x7f0ccbbce766
00096 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
0009a 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
0009e 4d85ed                         test       r13, r13
000a1 0f8419100000                   je         0x7f0ccbbce4c0
000a7 33ff                           xor        edi, edi
000a9 4c8bc2                         mov        r8, rdx
000ac 8b7204                         mov        esi, dword ptr [rdx + 4]
000af 8b5340                         mov        edx, dword ptr [rbx + 0x40]
000b2 85c9                           test       ecx, ecx
000b4 0f8ea7000000                   jle        0x7f0ccbbcd561
000ba 89442410                       mov        dword ptr [rsp + 0x10], eax
000be 4c2b6c2440                     sub        r13, qword ptr [rsp + 0x40]
000c3 8d46e0                         lea        eax, [rsi - 0x20]
000c6 4489542478                     mov        dword ptr [rsp + 0x78], r10d
000cb 458d5ae0                       lea        r11d, [r10 - 0x20]
000cf 498be9                         mov        rbp, r9
000d2 458b5104                       mov        r10d, dword ptr [r9 + 4]
000d6 4585d2                         test       r10d, r10d
000d9 0f86ed130000                   jbe        0x7f0ccbbce8cc
000df 4d63d2                         movsxd     r10, r10d
000e2 4c63c9                         movsxd     r9, ecx
000e5 49ffc9                         dec        r9
000e8 4d3bca                         cmp        r9, r10
000eb 0f83db130000                   jae        0x7f0ccbbce8cc
000f1 4c8bd2                         mov        r10, rdx
000f4 4c3b251d0fe117                 cmp        r12, qword ptr [rip + 0x17e10f1d]
000fb 0f8414000000                   je         0x7f0ccbbcd515
00101 48bf3803abe10c7f0000           movabs     rdi, 0x7f0ce1ab0338
0010b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0010f e8ccf61d17                     call       0x7f0ce2dacbe0
00114 f4                             hlt        
00115 4533c9                         xor        r9d, r9d
00118 48895c2468                     mov        qword ptr [rsp + 0x68], rbx
0011d 4c89442470                     mov        qword ptr [rsp + 0x70], r8
00122 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00126 4c89b42480000000               mov        qword ptr [rsp + 0x80], r14
0012e 4c89ac2488000000               mov        qword ptr [rsp + 0x88], r13
00136 897c2454                       mov        dword ptr [rsp + 0x54], edi
0013a 89742458                       mov        dword ptr [rsp + 0x58], esi
0013e 8954247c                       mov        dword ptr [rsp + 0x7c], edx
00142 89842490000000                 mov        dword ptr [rsp + 0x90], eax
00149 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00151 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00159 4533d2                         xor        r10d, r10d
0015c e9ab0c0000                     jmp        0x7f0ccbbce20c
00161 85d2                           test       edx, edx
00163 0f8417130000                   je         0x7f0ccbbce880
00169 4c8bca                         mov        r9, rdx
0016c 4533d2                         xor        r10d, r10d
0016f 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00174 85c0                           test       eax, eax
00176 0f8cac120000                   jl         0x7f0ccbbce828
0017c 3b742430                       cmp        esi, dword ptr [rsp + 0x30]
00180 0f82a6120000                   jb         0x7f0ccbbce82c
00186 428d2c18                       lea        ebp, [rax + r11]
0018a 418b7904                       mov        edi, dword ptr [r9 + 4]
0018e 3bfd                           cmp        edi, ebp
00190 0f829a120000                   jb         0x7f0ccbbce830
00196 4585db                         test       r11d, r11d
00199 0f8c95120000                   jl         0x7f0ccbbce834
0019f 4585db                         test       r11d, r11d
001a2 7433                           je         0x7f0ccbbcd5d7
001a4 498d740108                     lea        rsi, [r9 + rax + 8]
001a9 4b8d7c1008                     lea        rdi, [r8 + r10 + 8]
001ae 4963d3                         movsxd     rdx, r11d
001b1 4883fa20                       cmp        rdx, 0x20
001b5 7739                           ja         0x7f0ccbbcd5f0
001b7 4d63d3                         movsxd     r10, r11d
001ba 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
001c1 c442a8f5db                     bzhi       r11, r11, r10
001c6 c4c1fb92fb                     kmovq      k7, r11
001cb 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
001d1 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
001d7 896b38                         mov        dword ptr [rbx + 0x38], ebp
001da c5f877                         vzeroupper 
001dd 4881c4b0000000                 add        rsp, 0xb0
001e4 5d                             pop        rbp
001e5 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
001e9 0f87a51e0000                   ja         0x7f0ccbbcf494
001ef c3                             ret        
001f0 c5f877                         vzeroupper 
001f3 49ba409171cb0c7f0000           movabs     r10, 0x7f0ccb719140
001fd 41ffd2                         call       r10
00200 0f1f840000000000               nop        dword ptr [rax + rax]
00208 ebcd                           jmp        0x7f0ccbbcd5d7
0020a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0020f 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00217 458b4304                       mov        r8d, dword ptr [r11 + 4]
0021b 4183c1fd                       add        r9d, -3
0021f 4183f802                       cmp        r8d, 2
00223 0f86b7110000                   jbe        0x7f0ccbbce7e0
00229 458b5b0c                       mov        r11d, dword ptr [r11 + 0xc]
0022d 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00235 45895810                       mov        dword ptr [r8 + 0x10], r11d
00239 458b4008                       mov        r8d, dword ptr [r8 + 8]
0023d 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00245 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00249 45894b08                       mov        dword ptr [r11 + 8], r9d
0024d 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00252 e9af000000                     jmp        0x7f0ccbbcd706
00257 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0025c 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00264 418b4b04                       mov        ecx, dword ptr [r11 + 4]
00268 443bc9                         cmp        r9d, ecx
0026b 0f83df120000                   jae        0x7f0ccbbce950
00271 438b6c8b08                     mov        ebp, dword ptr [r11 + r9*4 + 8]
00276 4585c9                         test       r9d, r9d
00279 7e62                           jle        0x7f0ccbbcd6dd
0027b 85c9                           test       ecx, ecx
0027d 0f8685130000                   jbe        0x7f0ccbbcea08
00283 4863d9                         movsxd     rbx, ecx
00286 4d63d9                         movsxd     r11, r9d
00289 49ffcb                         dec        r11
0028c 4c3bdb                         cmp        r11, rbx
0028f 0f8373130000                   jae        0x7f0ccbbcea08
00295 83f901                         cmp        ecx, 1
00298 0f866a130000                   jbe        0x7f0ccbbcea08
0029e 458d59ff                       lea        r11d, [r9 - 1]
002a2 4d63db                         movsxd     r11, r11d
002a5 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
002ad 458bc0                         mov        r8d, r8d
002b0 4183c0cc                       add        r8d, -0x34
002b4 41c1e802                       shr        r8d, 2
002b8 438d7c08ff                     lea        edi, [r8 + r9 - 1]
002bd 41b804000000                   mov        r8d, 4
002c3 c462b8f5c7                     bzhi       r8, rdi, r8
002c8 4d2bd8                         sub        r11, r8
002cb 4533c0                         xor        r8d, r8d
002ce 4d85db                         test       r11, r11
002d1 4d0f4cd8                       cmovl      r11, r8
002d5 418bf3                         mov        esi, r11d
002d8 e91a0c0000                     jmp        0x7f0ccbbce2f7
002dd 85c9                           test       ecx, ecx
002df 0f86df120000                   jbe        0x7f0ccbbce9c4
002e5 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
002ed 896908                         mov        dword ptr [rcx + 8], ebp
002f0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002f5 896c2448                       mov        dword ptr [rsp + 0x48], ebp
002f9 48898c24c8000000               mov        qword ptr [rsp + 0xc8], rcx
00301 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00306 4c634c2448                     movsxd     r9, dword ptr [rsp + 0x48]
0030b 4c63442410                     movsxd     r8, dword ptr [rsp + 0x10]
00310 4c03442440                     add        r8, qword ptr [rsp + 0x40]
00315 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0031a 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
0031f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00324 4863542434                     movsxd     rdx, dword ptr [rsp + 0x34]
00329 4c03c2                         add        r8, rdx
0032c 458beb                         mov        r13d, r11d
0032f 442b6c2448                     sub        r13d, dword ptr [rsp + 0x48]
00334 4d3bc8                         cmp        r9, r8
00337 7f17                           jg         0x7f0ccbbcd750
00339 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
0033e 4585db                         test       r11d, r11d
00341 0f84b90e0000                   je         0x7f0ccbbce600
00347 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0034c 33c9                           xor        ecx, ecx
0034e eb0f                           jmp        0x7f0ccbbcd75f
00350 448b5c2454                     mov        r11d, dword ptr [rsp + 0x54]
00355 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0035a b901000000                     mov        ecx, 1
0035f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00364 4585db                         test       r11d, r11d
00367 0f8eef0f0000                   jle        0x7f0ccbbce75c
0036d 85c9                           test       ecx, ecx
0036f 0f85fc0c0000                   jne        0x7f0ccbbce471
00375 458bc2                         mov        r8d, r10d
00378 4403442434                     add        r8d, dword ptr [rsp + 0x34]
0037d 4489442414                     mov        dword ptr [rsp + 0x14], r8d
00382 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00387 44035c2428                     add        r11d, dword ptr [rsp + 0x28]
0038c 443b9c2494000000               cmp        r11d, dword ptr [rsp + 0x94]
00394 0f8f040a0000                   jg         0x7f0ccbbce19e
0039a 443b842490000000               cmp        r8d, dword ptr [rsp + 0x90]
003a2 0f8ff6090000                   jg         0x7f0ccbbce19e
003a8 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
003ac 83c5f1                         add        ebp, -0xf
003af 49c7c600000080                 mov        r14, 0xffffffff80000000
003b6 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
003bb 4183f810                       cmp        r8d, 0x10
003bf 0f8ea1010000                   jle        0x7f0ccbbcd966
003c5 4183f830                       cmp        r8d, 0x30
003c9 0f8e8c000000                   jle        0x7f0ccbbcd85b
003cf 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
003d4 458b4004                       mov        r8d, dword ptr [r8 + 4]
003d8 4585d2                         test       r10d, r10d
003db 0f8c93160000                   jl         0x7f0ccbbcee74
003e1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
003e6 4585db                         test       r11d, r11d
003e9 0f8c85160000                   jl         0x7f0ccbbcee74
003ef 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
003f4 443b4c2414                     cmp        r9d, dword ptr [rsp + 0x14]
003f9 0f8275160000                   jb         0x7f0ccbbcee74
003ff 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00404 0f826a160000                   jb         0x7f0ccbbcee74
0040a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0040f 4585db                         test       r11d, r11d
00412 0f8400020000                   je         0x7f0ccbbcda18
00418 4c8b5c2470                     mov        r11, qword ptr [rsp + 0x70]
0041d 4b8d7c1308                     lea        rdi, [r11 + r10 + 8]
00422 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00427 4d8bd3                         mov        r10, r11
0042a 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0042f 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00434 4883fa20                       cmp        rdx, 0x20
00438 0f86b5010000                   jbe        0x7f0ccbbcd9f3
0043e c5f877                         vzeroupper 
00441 49ba409171cb0c7f0000           movabs     r10, 0x7f0ccb719140
0044b 41ffd2                         call       r10
0044e 0f1f840000000000               nop        dword ptr [rax + rax]
00456 e9bd010000                     jmp        0x7f0ccbbcda18
0045b 85ed                           test       ebp, ebp
0045d 0f8cc9150000                   jl         0x7f0ccbbcee2c
00463 448b4c2458                     mov        r9d, dword ptr [rsp + 0x58]
00468 418d69f1                       lea        ebp, [r9 - 0xf]
0046c 443bd5                         cmp        r10d, ebp
0046f 0f8373140000                   jae        0x7f0ccbbcece8
00475 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0047a 458b4304                       mov        r8d, dword ptr [r11 + 4]
0047e 458bda                         mov        r11d, r10d
00481 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00486 418d68f1                       lea        ebp, [r8 - 0xf]
0048a 4963cb                         movsxd     rcx, r11d
0048d 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00492 c4c17a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + rcx + 8]
00499 85ed                           test       ebp, ebp
0049b 0f8c2f160000                   jl         0x7f0ccbbceed0
004a1 458d50f1                       lea        r10d, [r8 - 0xf]
004a5 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
004aa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
004af 453bda                         cmp        r11d, r10d
004b2 0f8378140000                   jae        0x7f0ccbbced30
004b8 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
004bc 448d5310                       lea        r10d, [rbx + 0x10]
004c0 4489542418                     mov        dword ptr [rsp + 0x18], r10d
004c5 4863fb                         movsxd     rdi, ebx
004c8 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
004cd c4c17a7f443b08                 vmovdqu    xmmword ptr [r11 + rdi + 8], xmm0
004d4 443b542428                     cmp        r10d, dword ptr [rsp + 0x28]
004d9 0f8d66030000                   jge        0x7f0ccbbcdc45
004df 482bcf                         sub        rcx, rdi
004e2 4963d1                         movsxd     rdx, r9d
004e5 4883c2f1                       add        rdx, -0xf
004e9 4d63da                         movsxd     r11, r10d
004ec 4d8d0c0b                       lea        r9, [r11 + rcx]
004f0 4c3bca                         cmp        r9, rdx
004f3 0f836b160000                   jae        0x7f0ccbbcef64
004f9 48637c2428                     movsxd     rdi, dword ptr [rsp + 0x28]
004fe 4c8bcf                         mov        r9, rdi
00501 4d2bcb                         sub        r9, r11
00504 4983c10f                       add        r9, 0xf
00508 4983e1f0                       and        r9, 0xfffffffffffffff0
0050c 458bd9                         mov        r11d, r9d
0050f 458d4c1b10                     lea        r9d, [r11 + rbx + 0x10]
00514 4d63d9                         movsxd     r11, r9d
00517 4d8d4c0bf0                     lea        r9, [r11 + rcx - 0x10]
0051c 4c3bca                         cmp        r9, rdx
0051f 0f833f160000                   jae        0x7f0ccbbcef64
00525 443b54242c                     cmp        r10d, dword ptr [rsp + 0x2c]
0052a 0f8334160000                   jae        0x7f0ccbbcef64
00530 4d63d0                         movsxd     r10, r8d
00533 4983c3f0                       add        r11, -0x10
00537 4983c2f1                       add        r10, -0xf
0053b 4d3bda                         cmp        r11, r10
0053e 0f8320160000                   jae        0x7f0ccbbcef64
00544 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00549 4181faf0ffff7f                 cmp        r10d, 0x7ffffff0
00550 0f8f3e160000                   jg         0x7f0ccbbcef94
00556 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
0055b 442bd3                         sub        r10d, ebx
0055e 83c320                         add        ebx, 0x20
00561 e9cb000000                     jmp        0x7f0ccbbcda31
00566 85ed                           test       ebp, ebp
00568 0f8cc6110000                   jl         0x7f0ccbbceb34
0056e 8b6c2458                       mov        ebp, dword ptr [rsp + 0x58]
00572 83c5f1                         add        ebp, -0xf
00575 443bd5                         cmp        r10d, ebp
00578 0f8329110000                   jae        0x7f0ccbbceaa7
0057e 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00583 458b5804                       mov        r11d, dword ptr [r8 + 4]
00587 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0058c 4c8b542470                     mov        r10, qword ptr [rsp + 0x70]
00591 448b4c2424                     mov        r9d, dword ptr [rsp + 0x24]
00596 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
0059d 418d6bf1                       lea        ebp, [r11 - 0xf]
005a1 85ed                           test       ebp, ebp
005a3 0f8ccf110000                   jl         0x7f0ccbbceb78
005a9 4183c3f1                       add        r11d, -0xf
005ad 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
005b2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
005b7 453bd3                         cmp        r10d, r11d
005ba 0f832c110000                   jae        0x7f0ccbbceaec
005c0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
005c5 4503d9                         add        r11d, r9d
005c8 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
005cd c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
005d4 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
005d9 4503c2                         add        r8d, r10d
005dc 458bd8                         mov        r11d, r8d
005df 442b5c2448                     sub        r11d, dword ptr [rsp + 0x48]
005e4 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
005e9 4489442460                     mov        dword ptr [rsp + 0x60], r8d
005ee e970020000                     jmp        0x7f0ccbbcdc63
005f3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
005f8 4d63d3                         movsxd     r10, r11d
005fb 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00602 c442a8f5db                     bzhi       r11, r11, r10
00607 c4c1fb92fb                     kmovq      k7, r11
0060c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00612 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00618 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
0061d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00622 4489542460                     mov        dword ptr [rsp + 0x60], r10d
00627 e937020000                     jmp        0x7f0ccbbcdc63
0062c 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00631 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
00636 458bda                         mov        r11d, r10d
00639 44035c2418                     add        r11d, dword ptr [rsp + 0x18]
0063e 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00643 c4817a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 8]
0064a 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0064f c4817a7f440b08                 vmovdqu    xmmword ptr [r11 + r9 + 8], xmm0
00656 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0065b 4183c310                       add        r11d, 0x10
0065f 443bdb                         cmp        r11d, ebx
00662 7cc8                           jl         0x7f0ccbbcda2c
00664 4881c710ffffff                 add        rdi, -0xf0
0066b 4881ff00000080                 cmp        rdi, -0x80000000
00672 490f4cfe                       cmovl      rdi, r14
00676 448bcf                         mov        r9d, edi
00679 453bd9                         cmp        r11d, r9d
0067c 0f8d79010000                   jge        0x7f0ccbbcdbfb
00682 4d63c3                         movsxd     r8, r11d
00685 4c03c1                         add        r8, rcx
00688 4c3bc2                         cmp        r8, rdx
0068b 0f8333150000                   jae        0x7f0ccbbcefc4
00691 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
00695 81c300010000                   add        ebx, 0x100
0069b 448bc3                         mov        r8d, ebx
0069e 4863db                         movsxd     rbx, ebx
006a1 4803d9                         add        rbx, rcx
006a4 483bda                         cmp        rbx, rdx
006a7 0f832b150000                   jae        0x7f0ccbbcefd8
006ad 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
006b2 0f8334150000                   jae        0x7f0ccbbcefec
006b8 443b44242c                     cmp        r8d, dword ptr [rsp + 0x2c]
006bd 0f833d150000                   jae        0x7f0ccbbcf000
006c3 90                             nop        
006c4 90                             nop        
006c5 90                             nop        
006c6 90                             nop        
006c7 90                             nop        
006c8 90                             nop        
006c9 90                             nop        
006ca 90                             nop        
006cb 90                             nop        
006cc 90                             nop        
006cd 90                             nop        
006ce 90                             nop        
006cf 90                             nop        
006d0 418bdb                         mov        ebx, r11d
006d3 4863fb                         movsxd     rdi, ebx
006d6 458bc3                         mov        r8d, r11d
006d9 438d2c1a                       lea        ebp, [r10 + r11]
006dd 8bdd                           mov        ebx, ebp
006df 488b742470                     mov        rsi, qword ptr [rsp + 0x70]
006e4 c5fa6f442e08                   vmovdqu    xmm0, xmmword ptr [rsi + rbp + 8]
006ea 8b6c247c                       mov        ebp, dword ptr [rsp + 0x7c]
006ee c4a17a7f440508                 vmovdqu    xmmword ptr [rbp + r8 + 8], xmm0
006f5 4c63c3                         movsxd     r8, ebx
006f8 c4a17a6f440618                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x18]
006ff c5fa7f443d18                   vmovdqu    xmmword ptr [rbp + rdi + 0x18], xmm0
00705 c4a17a6f440628                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x28]
0070c c5fa7f443d28                   vmovdqu    xmmword ptr [rbp + rdi + 0x28], xmm0
00712 c4a17a6f440638                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x38]
00719 c5fa7f443d38                   vmovdqu    xmmword ptr [rbp + rdi + 0x38], xmm0
0071f c4a17a6f440648                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x48]
00726 c5fa7f443d48                   vmovdqu    xmmword ptr [rbp + rdi + 0x48], xmm0
0072c c4a17a6f440658                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x58]
00733 c5fa7f443d58                   vmovdqu    xmmword ptr [rbp + rdi + 0x58], xmm0
00739 c4a17a6f440668                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x68]
00740 c5fa7f443d68                   vmovdqu    xmmword ptr [rbp + rdi + 0x68], xmm0
00746 c4a17a6f440678                 vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x78]
0074d c5fa7f443d78                   vmovdqu    xmmword ptr [rbp + rdi + 0x78], xmm0
00753 c4a17a6f840688000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x88]
0075d c5fa7f843d88000000             vmovdqu    xmmword ptr [rbp + rdi + 0x88], xmm0
00766 c4a17a6f840698000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0x98]
00770 c5fa7f843d98000000             vmovdqu    xmmword ptr [rbp + rdi + 0x98], xmm0
00779 c4a17a6f8406a8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xa8]
00783 c5fa7f843da8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xa8], xmm0
0078c c4a17a6f8406b8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xb8]
00796 c5fa7f843db8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xb8], xmm0
0079f c4a17a6f8406c8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xc8]
007a9 c5fa7f843dc8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xc8], xmm0
007b2 c4a17a6f8406d8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xd8]
007bc c5fa7f843dd8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xd8], xmm0
007c5 c4a17a6f8406e8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xe8]
007cf c5fa7f843de8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xe8], xmm0
007d8 c4a17a6f8406f8000000           vmovdqu    xmm0, xmmword ptr [rsi + r8 + 0xf8]
007e2 c5fa7f843df8000000             vmovdqu    xmmword ptr [rbp + rdi + 0xf8], xmm0
007eb 4181c300010000                 add        r11d, 0x100
007f2 453bd9                         cmp        r11d, r9d
007f5 0f8cd5feffff                   jl         0x7f0ccbbcdad0
007fb 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00800 7d43                           jge        0x7f0ccbbcdc45
00802 4d63c3                         movsxd     r8, r11d
00805 4c03c1                         add        r8, rcx
00808 4c3bc2                         cmp        r8, rdx
0080b 0f834b160000                   jae        0x7f0ccbbcf25c
00811 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
00816 0f8354160000                   jae        0x7f0ccbbcf270
0081c 458bcb                         mov        r9d, r11d
0081f 478d041a                       lea        r8d, [r10 + r11]
00823 488b4c2470                     mov        rcx, qword ptr [rsp + 0x70]
00828 c4a17a6f440108                 vmovdqu    xmm0, xmmword ptr [rcx + r8 + 8]
0082f 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00833 c4a17a7f440908                 vmovdqu    xmmword ptr [rcx + r9 + 8], xmm0
0083a 4183c310                       add        r11d, 0x10
0083e 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00843 7cd7                           jl         0x7f0ccbbcdc1c
00845 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0084a 4403542424                     add        r10d, dword ptr [rsp + 0x24]
0084f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00854 44896c2450                     mov        dword ptr [rsp + 0x50], r13d
00859 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0085e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00863 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00868 458b5304                       mov        r10d, dword ptr [r11 + 4]
0086c 458d5af1                       lea        r11d, [r10 - 0xf]
00870 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00875 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
0087a 4183f810                       cmp        r8d, 0x10
0087e 7f6f                           jg         0x7f0ccbbcdcef
00880 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00885 4183fb10                       cmp        r11d, 0x10
00889 7c64                           jl         0x7f0ccbbcdcef
0088b 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00890 4585c0                         test       r8d, r8d
00893 0f8c7b120000                   jl         0x7f0ccbbcef14
00899 4183c2f1                       add        r10d, -0xf
0089d 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
008a2 453bc2                         cmp        r8d, r10d
008a5 0f83cd100000                   jae        0x7f0ccbbced78
008ab 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008b0 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
008b5 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
008ba c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
008c1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
008c6 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
008cb 0f8307110000                   jae        0x7f0ccbbcedd8
008d1 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
008d6 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
008da c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
008e1 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
008e6 438d0402                       lea        eax, [r10 + r8]
008ea e9f5040000                     jmp        0x7f0ccbbce1e4
008ef 448b442450                     mov        r8d, dword ptr [rsp + 0x50]
008f4 442b442460                     sub        r8d, dword ptr [rsp + 0x60]
008f9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
008fe 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00903 4c895c2428                     mov        qword ptr [rsp + 0x28], r11
00908 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0090d 4183c008                       add        r8d, 8
00911 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00916 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0091b 44035c2420                     add        r11d, dword ptr [rsp + 0x20]
00920 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00925 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0092a 443b442420                     cmp        r8d, dword ptr [rsp + 0x20]
0092f 0f8d6d030000                   jge        0x7f0ccbbce0a2
00935 4183f810                       cmp        r8d, 0x10
00939 0f8d95000000                   jge        0x7f0ccbbcddd4
0093f 4183f808                       cmp        r8d, 8
00943 7d2c                           jge        0x7f0ccbbcdd71
00945 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
0094a 8b542460                       mov        edx, dword ptr [rsp + 0x60]
0094e 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
00952 448b4c2420                     mov        r9d, dword ptr [rsp + 0x20]
00957 90                             nop        
00958 c5f877                         vzeroupper 
0095b e8001fb6ff                     call       0x7f0ccb72fc60
00960 0f1f8400580a0000               nop        dword ptr [rax + rax + 0xa58]
00968 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
0096c e973040000                     jmp        0x7f0ccbbce1e4
00971 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00976 8b542450                       mov        edx, dword ptr [rsp + 0x50]
0097a 90                             nop        
0097b 90                             nop        
0097c c5f877                         vzeroupper 
0097f e8dc1eb6ff                     call       0x7f0ccb72fc60
00984 0f1f84007c0a0001               nop        dword ptr [rax + rax + 0x1000a7c]
0098c 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00991 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00995 488bc8                         mov        rcx, rax
00998 c5f877                         vzeroupper 
0099b e8c01eb6ff                     call       0x7f0ccb72fc60
009a0 0f1f8400980a0002               nop        dword ptr [rax + rax + 0x2000a98]
009a8 448b542424                     mov        r10d, dword ptr [rsp + 0x24]
009ad 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
009b2 0f8d68090000                   jge        0x7f0ccbbce720
009b8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
009bd 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
009c4 0f8fe2140000                   jg         0x7f0ccbbcf2ac
009ca 4489542410                     mov        dword ptr [rsp + 0x10], r10d
009cf e901090000                     jmp        0x7f0ccbbce6d5
009d4 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
009d9 4585c0                         test       r8d, r8d
009dc 0f8c96130000                   jl         0x7f0ccbbcf178
009e2 458d42f1                       lea        r8d, [r10 - 0xf]
009e6 4489442418                     mov        dword ptr [rsp + 0x18], r8d
009eb 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
009f0 453bd8                         cmp        r11d, r8d
009f3 0f831b120000                   jae        0x7f0ccbbcf014
009f9 8b4c2450                       mov        ecx, dword ptr [rsp + 0x50]
009fd 4863d9                         movsxd     rbx, ecx
00a00 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00a05 c4c17a6f441808                 vmovdqu    xmm0, xmmword ptr [r8 + rbx + 8]
00a0c 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00a11 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00a16 0f833c120000                   jae        0x7f0ccbbcf058
00a1c 8b7c2460                       mov        edi, dword ptr [rsp + 0x60]
00a20 8d6f10                         lea        ebp, [rdi + 0x10]
00a23 4c63df                         movsxd     r11, edi
00a26 c4817a7f441808                 vmovdqu    xmmword ptr [r8 + r11 + 8], xmm0
00a2d 3b6c2434                       cmp        ebp, dword ptr [rsp + 0x34]
00a31 0f8d5a020000                   jge        0x7f0ccbbce091
00a37 492bdb                         sub        rbx, r11
00a3a 4963d2                         movsxd     rdx, r10d
00a3d 4883c2f1                       add        rdx, -0xf
00a41 4c63d5                         movsxd     r10, ebp
00a44 4d8d1c1a                       lea        r11, [r10 + rbx]
00a48 4c3bda                         cmp        r11, rdx
00a4b 0f835f120000                   jae        0x7f0ccbbcf0b0
00a51 4c63442434                     movsxd     r8, dword ptr [rsp + 0x34]
00a56 4d8bd8                         mov        r11, r8
00a59 4d2bda                         sub        r11, r10
00a5c 4983c30f                       add        r11, 0xf
00a60 4983e3f0                       and        r11, 0xfffffffffffffff0
00a64 458bd3                         mov        r10d, r11d
00a67 458d5c3a10                     lea        r11d, [r10 + rdi + 0x10]
00a6c 4d63d3                         movsxd     r10, r11d
00a6f 4d8d5c1af0                     lea        r11, [r10 + rbx - 0x10]
00a74 4c3bda                         cmp        r11, rdx
00a77 0f8333120000                   jae        0x7f0ccbbcf0b0
00a7d 3b6c2418                       cmp        ebp, dword ptr [rsp + 0x18]
00a81 0f8329120000                   jae        0x7f0ccbbcf0b0
00a87 4983c2f0                       add        r10, -0x10
00a8b 4c3bd2                         cmp        r10, rdx
00a8e 0f831c120000                   jae        0x7f0ccbbcf0b0
00a94 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00a99 4181faf0ffff7f                 cmp        r10d, 0x7ffffff0
00aa0 0f8f46120000                   jg         0x7f0ccbbcf0ec
00aa6 2bcf                           sub        ecx, edi
00aa8 83c720                         add        edi, 0x20
00aab 448bd5                         mov        r10d, ebp
00aae 448d1c29                       lea        r11d, [rcx + rbp]
00ab2 448b4c247c                     mov        r9d, dword ptr [rsp + 0x7c]
00ab7 c4817a6f441908                 vmovdqu    xmm0, xmmword ptr [r9 + r11 + 8]
00abe c4817a7f441108                 vmovdqu    xmmword ptr [r9 + r10 + 8], xmm0
00ac5 448d5d10                       lea        r11d, [rbp + 0x10]
00ac9 443bdf                         cmp        r11d, edi
00acc 7d05                           jge        0x7f0ccbbcded3
00ace 418beb                         mov        ebp, r11d
00ad1 ebd8                           jmp        0x7f0ccbbcdeab
00ad3 4981c010ffffff                 add        r8, -0xf0
00ada 4981f800000080                 cmp        r8, -0x80000000
00ae1 4d0f4cc6                       cmovl      r8, r14
00ae5 458bc8                         mov        r9d, r8d
00ae8 453bd9                         cmp        r11d, r9d
00aeb 0f8d57010000                   jge        0x7f0ccbbce048
00af1 4d63d3                         movsxd     r10, r11d
00af4 4c03d3                         add        r10, rbx
00af7 4c3bd2                         cmp        r10, rdx
00afa 0f8328120000                   jae        0x7f0ccbbcf128
00b00 81c500010000                   add        ebp, 0x100
00b06 4c63d5                         movsxd     r10, ebp
00b09 4c03d3                         add        r10, rbx
00b0c 4c3bd2                         cmp        r10, rdx
00b0f 0f8327120000                   jae        0x7f0ccbbcf13c
00b15 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00b1a 0f8330120000                   jae        0x7f0ccbbcf150
00b20 3b6c2418                       cmp        ebp, dword ptr [rsp + 0x18]
00b24 0f833a120000                   jae        0x7f0ccbbcf164
00b2a 90                             nop        
00b2b 90                             nop        
00b2c 90                             nop        
00b2d 90                             nop        
00b2e 90                             nop        
00b2f 90                             nop        
00b30 458bc3                         mov        r8d, r11d
00b33 4963c0                         movsxd     rax, r8d
00b36 458bd3                         mov        r10d, r11d
00b39 428d3c19                       lea        edi, [rcx + r11]
00b3d 448bc7                         mov        r8d, edi
00b40 8b74247c                       mov        esi, dword ptr [rsp + 0x7c]
00b44 c5fa6f443e08                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 8]
00b4a c4a17a7f441608                 vmovdqu    xmmword ptr [rsi + r10 + 8], xmm0
00b51 4963f8                         movsxd     rdi, r8d
00b54 c5fa6f443e18                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x18]
00b5a c5fa7f440618                   vmovdqu    xmmword ptr [rsi + rax + 0x18], xmm0
00b60 c5fa6f443e28                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x28]
00b66 c5fa7f440628                   vmovdqu    xmmword ptr [rsi + rax + 0x28], xmm0
00b6c c5fa6f443e38                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x38]
00b72 c5fa7f440638                   vmovdqu    xmmword ptr [rsi + rax + 0x38], xmm0
00b78 c5fa6f443e48                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x48]
00b7e c5fa7f440648                   vmovdqu    xmmword ptr [rsi + rax + 0x48], xmm0
00b84 c5fa6f443e58                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x58]
00b8a c5fa7f440658                   vmovdqu    xmmword ptr [rsi + rax + 0x58], xmm0
00b90 c5fa6f443e68                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x68]
00b96 c5fa7f440668                   vmovdqu    xmmword ptr [rsi + rax + 0x68], xmm0
00b9c c5fa6f443e78                   vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x78]
00ba2 c5fa7f440678                   vmovdqu    xmmword ptr [rsi + rax + 0x78], xmm0
00ba8 c5fa6f843e88000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x88]
00bb1 c5fa7f840688000000             vmovdqu    xmmword ptr [rsi + rax + 0x88], xmm0
00bba c5fa6f843e98000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0x98]
00bc3 c5fa7f840698000000             vmovdqu    xmmword ptr [rsi + rax + 0x98], xmm0
00bcc c5fa6f843ea8000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xa8]
00bd5 c5fa7f8406a8000000             vmovdqu    xmmword ptr [rsi + rax + 0xa8], xmm0
00bde c5fa6f843eb8000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xb8]
00be7 c5fa7f8406b8000000             vmovdqu    xmmword ptr [rsi + rax + 0xb8], xmm0
00bf0 c5fa6f843ec8000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xc8]
00bf9 c5fa7f8406c8000000             vmovdqu    xmmword ptr [rsi + rax + 0xc8], xmm0
00c02 c5fa6f843ed8000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xd8]
00c0b c5fa7f8406d8000000             vmovdqu    xmmword ptr [rsi + rax + 0xd8], xmm0
00c14 c5fa6f843ee8000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xe8]
00c1d c5fa7f8406e8000000             vmovdqu    xmmword ptr [rsi + rax + 0xe8], xmm0
00c26 c5fa6f843ef8000000             vmovdqu    xmm0, xmmword ptr [rsi + rdi + 0xf8]
00c2f c5fa7f8406f8000000             vmovdqu    xmmword ptr [rsi + rax + 0xf8], xmm0
00c38 4181c300010000                 add        r11d, 0x100
00c3f 453bd9                         cmp        r11d, r9d
00c42 0f8ce8feffff                   jl         0x7f0ccbbcdf30
00c48 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
00c4d 7d42                           jge        0x7f0ccbbce091
00c4f 4d63d3                         movsxd     r10, r11d
00c52 4c03d3                         add        r10, rbx
00c55 4c3bd2                         cmp        r10, rdx
00c58 0f8326120000                   jae        0x7f0ccbbcf284
00c5e 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00c63 0f832f120000                   jae        0x7f0ccbbcf298
00c69 90                             nop        
00c6a 90                             nop        
00c6b 90                             nop        
00c6c 458bd3                         mov        r10d, r11d
00c6f 468d0c19                       lea        r9d, [rcx + r11]
00c73 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
00c78 c4817a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 8]
00c7f c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
00c86 4183c310                       add        r11d, 0x10
00c8a 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
00c8f 7cdb                           jl         0x7f0ccbbce06c
00c91 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00c96 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00c9a 418bc2                         mov        eax, r10d
00c9d e942010000                     jmp        0x7f0ccbbce1e4
00ca2 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00ca7 4183fb30                       cmp        r11d, 0x30
00cab 7f63                           jg         0x7f0ccbbce110
00cad 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00cb2 8b542450                       mov        edx, dword ptr [rsp + 0x50]
00cb6 90                             nop        
00cb7 90                             nop        
00cb8 c5f877                         vzeroupper 
00cbb e8a01bb6ff                     call       0x7f0ccb72fc60
00cc0 0f1f8400b80d0003               nop        dword ptr [rax + rax + 0x3000db8]
00cc8 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
00ccd 8b542460                       mov        edx, dword ptr [rsp + 0x60]
00cd1 488bc8                         mov        rcx, rax
00cd4 c5f877                         vzeroupper 
00cd7 e8841bb6ff                     call       0x7f0ccb72fc60
00cdc 0f1f8400d40d0004               nop        dword ptr [rax + rax + 0x4000dd4]
00ce4 448b5c2424                     mov        r11d, dword ptr [rsp + 0x24]
00ce9 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
00cee 0f8dc1050000                   jge        0x7f0ccbbce6b5
00cf4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00cf9 4181faf8ffff7f                 cmp        r10d, 0x7ffffff8
00d00 0f8f1a110000                   jg         0x7f0ccbbcf220
00d06 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00d0b e935050000                     jmp        0x7f0ccbbce645
00d10 448b5c2450                     mov        r11d, dword ptr [rsp + 0x50]
00d15 4585db                         test       r11d, r11d
00d18 0f8c9e100000                   jl         0x7f0ccbbcf1bc
00d1e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00d23 4585c0                         test       r8d, r8d
00d26 0f8c90100000                   jl         0x7f0ccbbcf1bc
00d2c 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
00d31 4403442450                     add        r8d, dword ptr [rsp + 0x50]
00d36 453bd0                         cmp        r10d, r8d
00d39 0f827d100000                   jb         0x7f0ccbbcf1bc
00d3f 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
00d44 0f8272100000                   jb         0x7f0ccbbcf1bc
00d4a 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00d4f 4585db                         test       r11d, r11d
00d52 0f845d050000                   je         0x7f0ccbbce6b5
00d58 458bd3                         mov        r10d, r11d
00d5b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d60 448b4c2450                     mov        r9d, dword ptr [rsp + 0x50]
00d65 4b8d7c0b08                     lea        rdi, [r11 + r9 + 8]
00d6a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00d6f 4b8d740b08                     lea        rsi, [r11 + r9 + 8]
00d74 4963d2                         movsxd     rdx, r10d
00d77 4883fa20                       cmp        rdx, 0x20
00d7b 0f8611050000                   jbe        0x7f0ccbbce692
00d81 c5f877                         vzeroupper 
00d84 49ba409171cb0c7f0000           movabs     r10, 0x7f0ccb719140
00d8e 41ffd2                         call       r10
00d91 0f1f840000000000               nop        dword ptr [rax + rax]
00d99 e917050000                     jmp        0x7f0ccbbce6b5
00d9e 418bea                         mov        ebp, r10d
00da1 488bb42498000000               mov        rsi, qword ptr [rsp + 0x98]
00da9 8b542410                       mov        edx, dword ptr [rsp + 0x10]
00dad 8b4c2478                       mov        ecx, dword ptr [rsp + 0x78]
00db1 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
00db6 8b7c2434                       mov        edi, dword ptr [rsp + 0x34]
00dba 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00dbf 44890c24                       mov        dword ptr [rsp], r9d
00dc3 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
00dc8 44895c2408                     mov        dword ptr [rsp + 8], r11d
00dcd 458bca                         mov        r9d, r10d
00dd0 c5f877                         vzeroupper 
00dd3 e8881ab6ff                     call       0x7f0ccb72fc60
00dd8 0f1f8400d00e0005               nop        dword ptr [rax + rax + 0x5000ed0]
00de0 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
00de4 448b4c241c                     mov        r9d, dword ptr [rsp + 0x1c]
00de9 41ffc1                         inc        r9d
00dec 443b4c2464                     cmp        r9d, dword ptr [rsp + 0x64]
00df1 0f8de6020000                   jge        0x7f0ccbbce4dd
00df7 89442410                       mov        dword ptr [rsp + 0x10], eax
00dfb 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00e03 894c247c                       mov        dword ptr [rsp + 0x7c], ecx
00e07 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00e0c 4e8b44cd08                     mov        r8, qword ptr [rbp + r9*8 + 8]
00e11 44894c241c                     mov        dword ptr [rsp + 0x1c], r9d
00e16 4889ac24c0000000               mov        qword ptr [rsp + 0xc0], rbp
00e1e 458bd8                         mov        r11d, r8d
00e21 4181e3ffff0100                 and        r11d, 0x1ffff
00e28 4d8bc8                         mov        r9, r8
00e2b 49c1f924                       sar        r9, 0x24
00e2f 49c1e812                       shr        r8, 0x12
00e33 458bc9                         mov        r9d, r9d
00e36 458bc0                         mov        r8d, r8d
00e39 4181e0ffff0300                 and        r8d, 0x3ffff
00e40 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00e45 4585c9                         test       r9d, r9d
00e48 7d21                           jge        0x7f0ccbbce26b
00e4a 4c8b442438                     mov        r8, qword ptr [rsp + 0x38]
00e4f 418b4804                       mov        ecx, dword ptr [r8 + 4]
00e53 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
00e58 443bc1                         cmp        r8d, ecx
00e5b 0f832f050000                   jae        0x7f0ccbbce790
00e61 4c8b4c2438                     mov        r9, qword ptr [rsp + 0x38]
00e66 478b4c8108                     mov        r9d, dword ptr [r9 + r8*4 + 8]
00e6b 4585db                         test       r11d, r11d
00e6e 0f84f5010000                   je         0x7f0ccbbce469
00e74 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00e79 452bc2                         sub        r8d, r10d
00e7c 453bd8                         cmp        r11d, r8d
00e7f 0f8fac040000                   jg         0x7f0ccbbce731
00e85 4183f903                       cmp        r9d, 3
00e89 0f8f7bf3ffff                   jg         0x7f0ccbbcd60a
00e8f 4585db                         test       r11d, r11d
00e92 7403                           je         0x7f0ccbbce297
00e94 41ffc9                         dec        r9d
00e97 4585c9                         test       r9d, r9d
00e9a 0f8473020000                   je         0x7f0ccbbce513
00ea0 4183f903                       cmp        r9d, 3
00ea4 0f8486020000                   je         0x7f0ccbbce530
00eaa 4183f902                       cmp        r9d, 2
00eae 0f86a3f3ffff                   jbe        0x7f0ccbbcd657
00eb4 48be7000a5e200000000           movabs     rsi, 0xe2a50070
00ebe 418bea                         mov        ebp, r10d
00ec1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ec6 90                             nop        
00ec7 90                             nop        
00ec8 c5f877                         vzeroupper 
00ecb e89019b6ff                     call       0x7f0ccb72fc60
00ed0 0f1f8400c80f0006               nop        dword ptr [rax + rax + 0x6000fc8]
00ed8 4885c0                         test       rax, rax
00edb 0f84b7060000                   je         0x7f0ccbbce998
00ee1 488bf0                         mov        rsi, rax
00ee4 c5f877                         vzeroupper 
00ee7 4881c4b0000000                 add        rsp, 0xb0
00eee 5d                             pop        rbp
00eef e96c78afff                     jmp        0x7f0ccb6c5b60
00ef4 448bca                         mov        r9d, edx
00ef7 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00eff 478b448b04                     mov        r8d, dword ptr [r11 + r9*4 + 4]
00f04 4789448b08                     mov        dword ptr [r11 + r9*4 + 8], r8d
00f09 418d51ff                       lea        edx, [r9 - 1]
00f0d 3bd6                           cmp        edx, esi
00f0f 7fe3                           jg         0x7f0ccbbce2f4
00f11 83fa3f                         cmp        edx, 0x3f
00f14 0f8e36070000                   jle        0x7f0ccbbcea50
00f1a 4c63da                         movsxd     r11, edx
00f1d 49ffcb                         dec        r11
00f20 4c3bdb                         cmp        r11, rbx
00f23 0f832e070000                   jae        0x7f0ccbbcea57
00f29 4183c1c0                       add        r9d, -0x40
00f2d 4d63d9                         movsxd     r11, r9d
00f30 49ffcb                         dec        r11
00f33 4c3bdb                         cmp        r11, rbx
00f36 0f832f070000                   jae        0x7f0ccbbcea6b
00f3c 3bd1                           cmp        edx, ecx
00f3e 0f833b070000                   jae        0x7f0ccbbcea7f
00f44 443bc9                         cmp        r9d, ecx
00f47 0f8346070000                   jae        0x7f0ccbbcea93
00f4d eb03                           jmp        0x7f0ccbbce352
00f4f 90                             nop        
00f50 8bd7                           mov        edx, edi
00f52 448d4ac1                       lea        r9d, [rdx - 0x3f]
00f56 8d7ad0                         lea        edi, [rdx - 0x30]
00f59 448d42f1                       lea        r8d, [rdx - 0xf]
00f5d 448d5af0                       lea        r11d, [rdx - 0x10]
00f61 488bb424c8000000               mov        rsi, qword ptr [rsp + 0xc8]
00f69 62b17e486f849e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11*4 + 8]
00f74 62b17e487f848608000000         vmovdqu32  zmmword ptr [rsi + r8*4 + 8], zmm0
00f7f 448d42e1                       lea        r8d, [rdx - 0x1f]
00f83 448d5ae0                       lea        r11d, [rdx - 0x20]
00f87 62b17e486f849e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11*4 + 8]
00f92 62b17e487f848608000000         vmovdqu32  zmmword ptr [rsi + r8*4 + 8], zmm0
00f9d 62f17e486f84be08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rdi*4 + 8]
00fa8 448d5ad1                       lea        r11d, [rdx - 0x2f]
00fac 62b17e487f849e08000000         vmovdqu32  zmmword ptr [rsi + r11*4 + 8], zmm0
00fb7 8d7ac0                         lea        edi, [rdx - 0x40]
00fba 62f17e486f84be08000000         vmovdqu32  zmm0, zmmword ptr [rsi + rdi*4 + 8]
00fc5 62b17e487f848e08000000         vmovdqu32  zmmword ptr [rsi + r9*4 + 8], zmm0
00fd0 83ff3f                         cmp        edi, 0x3f
00fd3 0f8f77ffffff                   jg         0x7f0ccbbce350
00fd9 83ff0f                         cmp        edi, 0xf
00fdc 7e44                           jle        0x7f0ccbbce422
00fde 83c2b1                         add        edx, -0x4f
00fe1 4c63da                         movsxd     r11, edx
00fe4 49ffcb                         dec        r11
00fe7 4c3bdb                         cmp        r11, rbx
00fea 0f83ee070000                   jae        0x7f0ccbbcebde
00ff0 3bd1                           cmp        edx, ecx
00ff2 0f830e080000                   jae        0x7f0ccbbcec06
00ff8 448d47f1                       lea        r8d, [rdi - 0xf]
00ffc 83c7f0                         add        edi, -0x10
00fff 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01007 62d17e486f84bb08000000         vmovdqu32  zmm0, zmmword ptr [r11 + rdi*4 + 8]
01012 62917e487f848308000000         vmovdqu32  zmmword ptr [r11 + r8*4 + 8], zmm0
0101d 83ff0f                         cmp        edi, 0xf
01020 7fd6                           jg         0x7f0ccbbce3f8
01022 85ff                           test       edi, edi
01024 0f8eb3f2ffff                   jle        0x7f0ccbbcd6dd
0102a 4c63df                         movsxd     r11, edi
0102d 49ffcb                         dec        r11
01030 4c3bdb                         cmp        r11, rbx
01033 0f83b9070000                   jae        0x7f0ccbbcebf2
01039 3bf9                           cmp        edi, ecx
0103b 0f83d9070000                   jae        0x7f0ccbbcec1a
01041 90                             nop        
01042 90                             nop        
01043 90                             nop        
01044 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0104c 458b5cbb04                     mov        r11d, dword ptr [r11 + rdi*4 + 4]
01051 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
01059 45895cb808                     mov        dword ptr [r8 + rdi*4 + 8], r11d
0105e ffcf                           dec        edi
01060 85ff                           test       edi, edi
01062 7fe0                           jg         0x7f0ccbbce444
01064 e974f2ffff                     jmp        0x7f0ccbbcd6dd
01069 4533db                         xor        r11d, r11d
0106c e914feffff                     jmp        0x7f0ccbbce285
01071 4d2bc1                         sub        r8, r9
01074 4d85c0                         test       r8, r8
01077 0f8ddf020000                   jge        0x7f0ccbbce75c
0107d 4c8b542468                     mov        r10, qword ptr [rsp + 0x68]
01082 4d8b5230                       mov        r10, qword ptr [r10 + 0x30]
01086 4d85d2                         test       r10, r10
01089 0f85cd020000                   jne        0x7f0ccbbce75c
0108f bd08000000                     mov        ebp, 8
01094 be17000000                     mov        esi, 0x17
01099 90                             nop        
0109a 90                             nop        
0109b 90                             nop        
0109c c5f877                         vzeroupper 
0109f e8bcf5afff                     call       0x7f0ccb6cda60
010a4 0f1f84009c110007               nop        dword ptr [rax + rax + 0x700119c]
010ac 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
010b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
010ba e821e71d17                     call       0x7f0ce2dacbe0
010bf f4                             hlt        
010c0 4d03c3                         add        r8, r11
010c3 4d3bc6                         cmp        r8, r14
010c6 7e08                           jle        0x7f0ccbbce4d0
010c8 4533ed                         xor        r13d, r13d
010cb e9d7efffff                     jmp        0x7f0ccbbcd4a7
010d0 4533ed                         xor        r13d, r13d
010d3 bf01000000                     mov        edi, 1
010d8 e9ccefffff                     jmp        0x7f0ccbbcd4a9
010dd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
010e2 442b5c2414                     sub        r11d, dword ptr [rsp + 0x14]
010e7 85c9                           test       ecx, ecx
010e9 0f84cd060000                   je         0x7f0ccbbcebbc
010ef 4c8bc9                         mov        r9, rcx
010f2 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
010f7 4585d2                         test       r10d, r10d
010fa 0f8ccd060000                   jl         0x7f0ccbbcebcd
01100 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
01105 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
0110a 8b742458                       mov        esi, dword ptr [rsp + 0x58]
0110e e961f0ffff                     jmp        0x7f0ccbbcd574
01113 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
0111b 448b4904                       mov        r9d, dword ptr [rcx + 4]
0111f 4585c9                         test       r9d, r9d
01122 0f8606070000                   jbe        0x7f0ccbbcec2e
01128 8b6908                         mov        ebp, dword ptr [rcx + 8]
0112b e9c5f1ffff                     jmp        0x7f0ccbbcd6f5
01130 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01138 448b4104                       mov        r8d, dword ptr [rcx + 4]
0113c 4183f802                       cmp        r8d, 2
01140 0f8642070000                   jbe        0x7f0ccbbcec88
01146 8b6908                         mov        ebp, dword ptr [rcx + 8]
01149 ffcd                           dec        ebp
0114b 85ed                           test       ebp, ebp
0114d 7e2f                           jle        0x7f0ccbbce57e
0114f 458bc3                         mov        r8d, r11d
01152 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0115a 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
0115e 45894b10                       mov        dword ptr [r11 + 0x10], r9d
01162 418b4b08                       mov        ecx, dword ptr [r11 + 8]
01166 41894b0c                       mov        dword ptr [r11 + 0xc], ecx
0116a 41896b08                       mov        dword ptr [r11 + 8], ebp
0116e 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
01176 458bd8                         mov        r11d, r8d
01179 e977f1ffff                     jmp        0x7f0ccbbcd6f5
0117e 48be9800a5e200000000           movabs     rsi, 0xe2a50098
01188 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01190 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
01198 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
011a0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
011a5 44898c24c8000000               mov        dword ptr [rsp + 0xc8], r9d
011ad 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
011b5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
011ba 90                             nop        
011bb 90                             nop        
011bc c5f877                         vzeroupper 
011bf e89c16b6ff                     call       0x7f0ccb72fc60
011c4 0f1f8400bc120008               nop        dword ptr [rax + rax + 0x80012bc]
011cc 4885c0                         test       rax, rax
011cf 0f850cfdffff                   jne        0x7f0ccbbce2e1
011d5 bef6ffffff                     mov        esi, 0xfffffff6
011da 90                             nop        
011db 90                             nop        
011dc c5f877                         vzeroupper 
011df e87cf4afff                     call       0x7f0ccb6cda60
011e4 0f1f8400dc120009               nop        dword ptr [rax + rax + 0x90012dc]
011ec 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
011f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
011fa e8e1e51d17                     call       0x7f0ce2dacbe0
011ff f4                             hlt        
01200 4d63dd                         movsxd     r11, r13d
01203 4c3b9c2488000000               cmp        r11, qword ptr [rsp + 0x88]
0120b 7c22                           jl         0x7f0ccbbce62f
0120d 4c3b8c2480000000               cmp        r9, qword ptr [rsp + 0x80]
01215 7e0b                           jle        0x7f0ccbbce622
01217 33c9                           xor        ecx, ecx
01219 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
0121d e938f1ffff                     jmp        0x7f0ccbbcd75a
01222 4533db                         xor        r11d, r11d
01225 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0122a e91df1ffff                     jmp        0x7f0ccbbcd74c
0122f 4533db                         xor        r11d, r11d
01232 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01237 e91ef1ffff                     jmp        0x7f0ccbbcd75a
0123c 90                             nop        
0123d 90                             nop        
0123e 90                             nop        
0123f 90                             nop        
01240 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01245 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01249 036c240c                       add        ebp, dword ptr [rsp + 0xc]
0124d 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
01252 8bd5                           mov        edx, ebp
01254 c5f877                         vzeroupper 
01257 e80416b6ff                     call       0x7f0ccb72fc60
0125c 0f1f84005413000a               nop        dword ptr [rax + rax + 0xa001354]
01264 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
01269 8b542410                       mov        edx, dword ptr [rsp + 0x10]
0126d 488bc8                         mov        rcx, rax
01270 c5f877                         vzeroupper 
01273 e8e815b6ff                     call       0x7f0ccb72fc60
01278 0f1f84007013000b               nop        dword ptr [rax + rax + 0xb001370]
01280 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01285 4183c308                       add        r11d, 8
01289 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
0128e 7cb0                           jl         0x7f0ccbbce640
01290 eb23                           jmp        0x7f0ccbbce6b5
01292 458bda                         mov        r11d, r10d
01295 4d63d3                         movsxd     r10, r11d
01298 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0129f c442a8f5db                     bzhi       r11, r11, r10
012a4 c4c1fb92fb                     kmovq      k7, r11
012a9 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
012af 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
012b5 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
012ba 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
012be 418bc3                         mov        eax, r11d
012c1 e91efbffff                     jmp        0x7f0ccbbce1e4
012c6 90                             nop        
012c7 90                             nop        
012c8 90                             nop        
012c9 90                             nop        
012ca 90                             nop        
012cb 90                             nop        
012cc 90                             nop        
012cd 90                             nop        
012ce 90                             nop        
012cf 90                             nop        
012d0 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
012d5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
012d9 036c240c                       add        ebp, dword ptr [rsp + 0xc]
012dd 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
012e2 8bd5                           mov        edx, ebp
012e4 c5f877                         vzeroupper 
012e7 e87415b6ff                     call       0x7f0ccb72fc60
012ec 0f1f8400e413000c               nop        dword ptr [rax + rax + 0xc0013e4]
012f4 488b742428                     mov        rsi, qword ptr [rsp + 0x28]
012f9 8b542410                       mov        edx, dword ptr [rsp + 0x10]
012fd 488bc8                         mov        rcx, rax
01300 c5f877                         vzeroupper 
01303 e85815b6ff                     call       0x7f0ccb72fc60
01308 0f1f84000014000d               nop        dword ptr [rax + rax + 0xd001400]
01310 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01315 4183c308                       add        r11d, 8
01319 443b5c2434                     cmp        r11d, dword ptr [rsp + 0x34]
0131e 7cb0                           jl         0x7f0ccbbce6d0
01320 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01325 8b4c247c                       mov        ecx, dword ptr [rsp + 0x7c]
01329 418bc3                         mov        eax, r11d
0132c e9b3faffff                     jmp        0x7f0ccbbce1e4
01331 be17000000                     mov        esi, 0x17
01336 90                             nop        
01337 90                             nop        
01338 c5f877                         vzeroupper 
0133b e820f3afff                     call       0x7f0ccb6cda60
01340 0f1f84003814000e               nop        dword ptr [rax + rax + 0xe001438]
01348 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01352 4883e4f0                       and        rsp, 0xfffffffffffffff0
01356 e885e41d17                     call       0x7f0ce2dacbe0
0135b f4                             hlt        
0135c bd02000000                     mov        ebp, 2
01361 e92efdffff                     jmp        0x7f0ccbbce494
01366 be17000000                     mov        esi, 0x17
0136b 90                             nop        
0136c c5f877                         vzeroupper 
0136f e8ecf2afff                     call       0x7f0ccb6cda60
01374 0f1f84006c14000f               nop        dword ptr [rax + rax + 0xf00146c]
0137c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01386 4883e4f0                       and        rsp, 0xfffffffffffffff0
0138a e851e41d17                     call       0x7f0ce2dacbe0
0138f f4                             hlt        
01390 bee4ffffff                     mov        esi, 0xffffffe4
01395 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0139d 4c898424c0000000               mov        qword ptr [rsp + 0xc0], r8
013a5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
013aa 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
013b2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
013b7 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
013bc c5f877                         vzeroupper 
013bf e89cf2afff                     call       0x7f0ccb6cda60
013c4 0f1f8400bc140010               nop        dword ptr [rax + rax + 0x100014bc]
013cc 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
013d6 4883e4f0                       and        rsp, 0xfffffffffffffff0
013da e801e41d17                     call       0x7f0ce2dacbe0
013df f4                             hlt        
013e0 bee4ffffff                     mov        esi, 0xffffffe4
013e5 4489542414                     mov        dword ptr [rsp + 0x14], r10d
013ea 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
013ef 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
013f4 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
013f9 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
013fe 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01403 90                             nop        
01404 c5f877                         vzeroupper 
01407 e854f2afff                     call       0x7f0ccb6cda60
0140c 0f1f840004150011               nop        dword ptr [rax + rax + 0x11001504]
01414 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0141e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01422 e8b9e31d17                     call       0x7f0ce2dacbe0
01427 f4                             hlt        
01428 8be8                           mov        ebp, eax
0142a eb0a                           jmp        0x7f0ccbbce836
0142c 8be8                           mov        ebp, eax
0142e eb06                           jmp        0x7f0ccbbce836
01430 8be8                           mov        ebp, eax
01432 eb02                           jmp        0x7f0ccbbce836
01434 8be8                           mov        ebp, eax
01436 beccffffff                     mov        esi, 0xffffffcc
0143b 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01443 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
0144b 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01450 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01455 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0145a 90                             nop        
0145b 90                             nop        
0145c c5f877                         vzeroupper 
0145f e8fcf1afff                     call       0x7f0ccb6cda60
01464 0f1f84005c150012               nop        dword ptr [rax + rax + 0x1200155c]
0146c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01476 4883e4f0                       and        rsp, 0xfffffffffffffff0
0147a e861e31d17                     call       0x7f0ce2dacbe0
0147f f4                             hlt        
01480 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01485 8be8                           mov        ebp, eax
01487 4533c9                         xor        r9d, r9d
0148a bef6ffffff                     mov        esi, 0xfffffff6
0148f 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01497 4c898424c8000000               mov        qword ptr [rsp + 0xc8], r8
0149f 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
014a7 90                             nop        
014a8 c5f877                         vzeroupper 
014ab e8b0f1afff                     call       0x7f0ccb6cda60
014b0 0f1f8400a8150013               nop        dword ptr [rax + rax + 0x130015a8]
014b8 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
014c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
014c6 e815e31d17                     call       0x7f0ce2dacbe0
014cb f4                             hlt        
014cc be6effffff                     mov        esi, 0xffffff6e
014d1 48ffb424c8000000               push       qword ptr [rsp + 0xc8]
014d9 488f8424c0000000               pop        qword ptr [rsp + 0xc0]
014e1 899424c8000000                 mov        dword ptr [rsp + 0xc8], edx
014e8 48894424f8                     mov        qword ptr [rsp - 8], rax
014ed 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014f1 898424cc000000                 mov        dword ptr [rsp + 0xcc], eax
014f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fd 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01502 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01507 48ff742440                     push       qword ptr [rsp + 0x40]
0150c 488f442428                     pop        qword ptr [rsp + 0x28]
01511 897c2424                       mov        dword ptr [rsp + 0x24], edi
01515 4c896c2440                     mov        qword ptr [rsp + 0x40], r13
0151a 4c89742448                     mov        qword ptr [rsp + 0x48], r14
0151f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01524 89442450                       mov        dword ptr [rsp + 0x50], eax
01528 894c2454                       mov        dword ptr [rsp + 0x54], ecx
0152c c5f877                         vzeroupper 
0152f e82cf1afff                     call       0x7f0ccb6cda60
01534 0f1f84002c160014               nop        dword ptr [rax + rax + 0x1400162c]
0153c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01546 4883e4f0                       and        rsp, 0xfffffffffffffff0
0154a e891e21d17                     call       0x7f0ce2dacbe0
0154f f4                             hlt        
01550 bee4ffffff                     mov        esi, 0xffffffe4
01555 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0155a 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0155f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01564 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01569 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0156e 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01573 90                             nop        
01574 c5f877                         vzeroupper 
01577 e8e4f0afff                     call       0x7f0ccb6cda60
0157c 0f1f840074160015               nop        dword ptr [rax + rax + 0x15001674]
01584 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0158e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01592 e849e21d17                     call       0x7f0ce2dacbe0
01597 f4                             hlt        
01598 bef6ffffff                     mov        esi, 0xfffffff6
0159d 90                             nop        
0159e 90                             nop        
0159f 90                             nop        
015a0 c5f877                         vzeroupper 
015a3 e8b8f0afff                     call       0x7f0ccb6cda60
015a8 0f1f8400a0160016               nop        dword ptr [rax + rax + 0x160016a0]
015b0 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
015ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
015be e81de21d17                     call       0x7f0ce2dacbe0
015c3 f4                             hlt        
015c4 bee4ffffff                     mov        esi, 0xffffffe4
015c9 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015ce 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
015d3 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
015d8 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
015dd 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
015e2 90                             nop        
015e3 90                             nop        
015e4 c5f877                         vzeroupper 
015e7 e874f0afff                     call       0x7f0ccb6cda60
015ec 0f1f8400e4160017               nop        dword ptr [rax + rax + 0x170016e4]
015f4 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
015fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01602 e8d9e11d17                     call       0x7f0ce2dacbe0
01607 f4                             hlt        
01608 be6effffff                     mov        esi, 0xffffff6e
0160d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01612 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01617 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0161c 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01621 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01626 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0162b 90                             nop        
0162c c5f877                         vzeroupper 
0162f e82cf0afff                     call       0x7f0ccb6cda60
01634 0f1f84002c170018               nop        dword ptr [rax + rax + 0x1800172c]
0163c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01646 4883e4f0                       and        rsp, 0xfffffffffffffff0
0164a e891e11d17                     call       0x7f0ce2dacbe0
0164f f4                             hlt        
01650 8bfa                           mov        edi, edx
01652 e9cbf9ffff                     jmp        0x7f0ccbbce422
01657 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01661 4883e4f0                       and        rsp, 0xfffffffffffffff0
01665 e876e11d17                     call       0x7f0ce2dacbe0
0166a f4                             hlt        
0166b 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01675 4883e4f0                       and        rsp, 0xfffffffffffffff0
01679 e862e11d17                     call       0x7f0ce2dacbe0
0167e f4                             hlt        
0167f 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01689 4883e4f0                       and        rsp, 0xfffffffffffffff0
0168d e84ee11d17                     call       0x7f0ce2dacbe0
01692 f4                             hlt        
01693 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
0169d 4883e4f0                       and        rsp, 0xfffffffffffffff0
016a1 e83ae11d17                     call       0x7f0ce2dacbe0
016a6 f4                             hlt        
016a7 bee4ffffff                     mov        esi, 0xffffffe4
016ac 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
016b1 4489442418                     mov        dword ptr [rsp + 0x18], r8d
016b6 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
016bb 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016c0 4489542420                     mov        dword ptr [rsp + 0x20], r10d
016c5 90                             nop        
016c6 90                             nop        
016c7 90                             nop        
016c8 c5f877                         vzeroupper 
016cb e890efafff                     call       0x7f0ccb6cda60
016d0 0f1f8400c8170019               nop        dword ptr [rax + rax + 0x190017c8]
016d8 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
016e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
016e6 e8f5e01d17                     call       0x7f0ce2dacbe0
016eb f4                             hlt        
016ec c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
016f2 bee4ffffff                     mov        esi, 0xffffffe4
016f7 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
016ff 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01707 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
0170f 90                             nop        
01710 c5f877                         vzeroupper 
01713 e848efafff                     call       0x7f0ccb6cda60
01718 0f1f84001018001a               nop        dword ptr [rax + rax + 0x1a001810]
01720 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0172a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0172e e8ade01d17                     call       0x7f0ce2dacbe0
01733 f4                             hlt        
01734 beccffffff                     mov        esi, 0xffffffcc
01739 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
0173e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01743 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01748 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0174d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01752 90                             nop        
01753 90                             nop        
01754 c5f877                         vzeroupper 
01757 e804efafff                     call       0x7f0ccb6cda60
0175c 0f1f84005418001b               nop        dword ptr [rax + rax + 0x1b001854]
01764 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0176e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01772 e869e01d17                     call       0x7f0ce2dacbe0
01777 f4                             hlt        
01778 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
0177e beccffffff                     mov        esi, 0xffffffcc
01783 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01788 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0178d 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01792 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01797 90                             nop        
01798 c5f877                         vzeroupper 
0179b e8c0eeafff                     call       0x7f0ccb6cda60
017a0 0f1f84009818001c               nop        dword ptr [rax + rax + 0x1c001898]
017a8 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
017b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
017b6 e825e01d17                     call       0x7f0ce2dacbe0
017bb f4                             hlt        
017bc 8be8                           mov        ebp, eax
017be 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
017c3 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
017c8 e9bdfcffff                     jmp        0x7f0ccbbce88a
017cd 8be8                           mov        ebp, eax
017cf 488b5c2468                     mov        rbx, qword ptr [rsp + 0x68]
017d4 4c8b442470                     mov        r8, qword ptr [rsp + 0x70]
017d9 e958fcffff                     jmp        0x7f0ccbbce836
017de 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
017e8 4883e4f0                       and        rsp, 0xfffffffffffffff0
017ec e8efdf1d17                     call       0x7f0ce2dacbe0
017f1 f4                             hlt        
017f2 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
017fc 4883e4f0                       and        rsp, 0xfffffffffffffff0
01800 e8dbdf1d17                     call       0x7f0ce2dacbe0
01805 f4                             hlt        
01806 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01810 4883e4f0                       and        rsp, 0xfffffffffffffff0
01814 e8c7df1d17                     call       0x7f0ce2dacbe0
01819 f4                             hlt        
0181a 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01824 4883e4f0                       and        rsp, 0xfffffffffffffff0
01828 e8b3df1d17                     call       0x7f0ce2dacbe0
0182d f4                             hlt        
0182e bee4ffffff                     mov        esi, 0xffffffe4
01833 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01838 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
01840 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01845 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
0184a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0184f 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01854 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01859 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
0185e 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01863 90                             nop        
01864 c5f877                         vzeroupper 
01867 e8f4edafff                     call       0x7f0ccb6cda60
0186c 0f1f84006419001d               nop        dword ptr [rax + rax + 0x1d001964]
01874 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0187e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01882 e859df1d17                     call       0x7f0ce2dacbe0
01887 f4                             hlt        
01888 bee4ffffff                     mov        esi, 0xffffffe4
0188d 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01892 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
0189a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0189f 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
018a4 4489542410                     mov        dword ptr [rsp + 0x10], r10d
018a9 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
018ae 4489442414                     mov        dword ptr [rsp + 0x14], r8d
018b3 48894c2418                     mov        qword ptr [rsp + 0x18], rcx
018b8 48894c2420                     mov        qword ptr [rsp + 0x20], rcx
018bd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
018c2 90                             nop        
018c3 90                             nop        
018c4 c5f877                         vzeroupper 
018c7 e894edafff                     call       0x7f0ccb6cda60
018cc 0f1f8400c419001e               nop        dword ptr [rax + rax + 0x1e0019c4]
018d4 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
018de 4883e4f0                       and        rsp, 0xfffffffffffffff0
018e2 e8f9de1d17                     call       0x7f0ce2dacbe0
018e7 f4                             hlt        
018e8 bee4ffffff                     mov        esi, 0xffffffe4
018ed 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
018f2 4489442418                     mov        dword ptr [rsp + 0x18], r8d
018f7 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
018fc 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01901 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01906 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0190b 90                             nop        
0190c c5f877                         vzeroupper 
0190f e84cedafff                     call       0x7f0ccb6cda60
01914 0f1f84000c1a001f               nop        dword ptr [rax + rax + 0x1f001a0c]
0191c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192a e8b1de1d17                     call       0x7f0ce2dacbe0
0192f f4                             hlt        
01930 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01936 bee4ffffff                     mov        esi, 0xffffffe4
0193b 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01943 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0194b 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01953 90                             nop        
01954 c5f877                         vzeroupper 
01957 e804edafff                     call       0x7f0ccb6cda60
0195c 0f1f8400541a0020               nop        dword ptr [rax + rax + 0x20001a54]
01964 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0196e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01972 e869de1d17                     call       0x7f0ce2dacbe0
01977 f4                             hlt        
01978 bee4ffffff                     mov        esi, 0xffffffe4
0197d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01985 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
0198d 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01995 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
0199a 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
019a2 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
019a7 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019ac 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
019b1 90                             nop        
019b2 90                             nop        
019b3 90                             nop        
019b4 c5f877                         vzeroupper 
019b7 e8a4ecafff                     call       0x7f0ccb6cda60
019bc 0f1f8400b41a0021               nop        dword ptr [rax + rax + 0x21001ab4]
019c4 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
019ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
019d2 e809de1d17                     call       0x7f0ce2dacbe0
019d7 f4                             hlt        
019d8 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
019de bee4ffffff                     mov        esi, 0xffffffe4
019e3 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
019eb 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
019f3 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
019fb 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01a00 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
01a08 c5f877                         vzeroupper 
01a0b e850ecafff                     call       0x7f0ccb6cda60
01a10 0f1f8400081b0022               nop        dword ptr [rax + rax + 0x22001b08]
01a18 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01a22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a26 e8b5dd1d17                     call       0x7f0ce2dacbe0
01a2b f4                             hlt        
01a2c beccffffff                     mov        esi, 0xffffffcc
01a31 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01a36 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01a3b 448b442420                     mov        r8d, dword ptr [rsp + 0x20]
01a40 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
01a45 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a4a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a4f 90                             nop        
01a50 c5f877                         vzeroupper 
01a53 e808ecafff                     call       0x7f0ccb6cda60
01a58 0f1f8400501b0023               nop        dword ptr [rax + rax + 0x23001b50]
01a60 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01a6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a6e e86ddd1d17                     call       0x7f0ce2dacbe0
01a73 f4                             hlt        
01a74 beccffffff                     mov        esi, 0xffffffcc
01a79 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01a81 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
01a89 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
01a91 448b44241c                     mov        r8d, dword ptr [rsp + 0x1c]
01a96 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01a9b 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01aa0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01aa5 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01aaa 90                             nop        
01aab 90                             nop        
01aac c5f877                         vzeroupper 
01aaf e8acebafff                     call       0x7f0ccb6cda60
01ab4 0f1f8400ac1b0024               nop        dword ptr [rax + rax + 0x24001bac]
01abc 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01ac6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aca e811dd1d17                     call       0x7f0ce2dacbe0
01acf f4                             hlt        
01ad0 c5fa7f442450                   vmovdqu    xmmword ptr [rsp + 0x50], xmm0
01ad6 beccffffff                     mov        esi, 0xffffffcc
01adb 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
01ae0 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01ae5 448b5c2420                     mov        r11d, dword ptr [rsp + 0x20]
01aea 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01aef 90                             nop        
01af0 c5f877                         vzeroupper 
01af3 e868ebafff                     call       0x7f0ccb6cda60
01af8 0f1f8400f01b0025               nop        dword ptr [rax + rax + 0x25001bf0]
01b00 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01b0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b0e e8cddc1d17                     call       0x7f0ce2dacbe0
01b13 f4                             hlt        
01b14 beccffffff                     mov        esi, 0xffffffcc
01b19 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01b21 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01b29 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01b31 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01b36 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
01b3e 90                             nop        
01b3f 90                             nop        
01b40 c5f877                         vzeroupper 
01b43 e818ebafff                     call       0x7f0ccb6cda60
01b48 0f1f8400401c0026               nop        dword ptr [rax + rax + 0x26001c40]
01b50 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01b5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b5e e87ddc1d17                     call       0x7f0ce2dacbe0
01b63 f4                             hlt        
01b64 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
01b68 83c510                         add        ebp, 0x10
01b6b be6effffff                     mov        esi, 0xffffff6e
01b70 c5f877                         vzeroupper 
01b73 e8e8eaafff                     call       0x7f0ccb6cda60
01b78 0f1f8400701c0027               nop        dword ptr [rax + rax + 0x27001c70]
01b80 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01b8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b8e e84ddc1d17                     call       0x7f0ce2dacbe0
01b93 f4                             hlt        
01b94 8b6c2424                       mov        ebp, dword ptr [rsp + 0x24]
01b98 83c510                         add        ebp, 0x10
01b9b be66ffffff                     mov        esi, 0xffffff66
01ba0 c5f877                         vzeroupper 
01ba3 e8b8eaafff                     call       0x7f0ccb6cda60
01ba8 0f1f8400a01c0028               nop        dword ptr [rax + rax + 0x28001ca0]
01bb0 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01bba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bbe e81ddc1d17                     call       0x7f0ce2dacbe0
01bc3 f4                             hlt        
01bc4 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01bce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bd2 e809dc1d17                     call       0x7f0ce2dacbe0
01bd7 f4                             hlt        
01bd8 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01be2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01be6 e8f5db1d17                     call       0x7f0ce2dacbe0
01beb f4                             hlt        
01bec 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01bf6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bfa e8e1db1d17                     call       0x7f0ce2dacbe0
01bff f4                             hlt        
01c00 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c0e e8cddb1d17                     call       0x7f0ce2dacbe0
01c13 f4                             hlt        
01c14 bee4ffffff                     mov        esi, 0xffffffe4
01c19 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01c21 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01c29 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01c31 90                             nop        
01c32 90                             nop        
01c33 90                             nop        
01c34 c5f877                         vzeroupper 
01c37 e824eaafff                     call       0x7f0ccb6cda60
01c3c 0f1f8400341d0029               nop        dword ptr [rax + rax + 0x29001d34]
01c44 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01c4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c52 e889db1d17                     call       0x7f0ce2dacbe0
01c57 f4                             hlt        
01c58 c5fa7f442420                   vmovdqu    xmmword ptr [rsp + 0x20], xmm0
01c5e bee4ffffff                     mov        esi, 0xffffffe4
01c63 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01c6b 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01c73 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01c7b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01c80 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
01c88 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01c8c c5f877                         vzeroupper 
01c8f e8cce9afff                     call       0x7f0ccb6cda60
01c94 0f1f84008c1d002a               nop        dword ptr [rax + rax + 0x2a001d8c]
01c9c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01ca6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01caa e831db1d17                     call       0x7f0ce2dacbe0
01caf f4                             hlt        
01cb0 83c110                         add        ecx, 0x10
01cb3 be6effffff                     mov        esi, 0xffffff6e
01cb8 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01cbd 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01cc2 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01cc6 90                             nop        
01cc7 90                             nop        
01cc8 c5f877                         vzeroupper 
01ccb e890e9afff                     call       0x7f0ccb6cda60
01cd0 0f1f8400c81d002b               nop        dword ptr [rax + rax + 0x2b001dc8]
01cd8 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01ce2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ce6 e8f5da1d17                     call       0x7f0ce2dacbe0
01ceb f4                             hlt        
01cec 83c110                         add        ecx, 0x10
01cef be66ffffff                     mov        esi, 0xffffff66
01cf4 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01cf9 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01cfe 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01d02 90                             nop        
01d03 90                             nop        
01d04 c5f877                         vzeroupper 
01d07 e854e9afff                     call       0x7f0ccb6cda60
01d0c 0f1f8400041e002c               nop        dword ptr [rax + rax + 0x2c001e04]
01d14 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01d1e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d22 e8b9da1d17                     call       0x7f0ce2dacbe0
01d27 f4                             hlt        
01d28 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01d32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d36 e8a5da1d17                     call       0x7f0ce2dacbe0
01d3b f4                             hlt        
01d3c 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01d46 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d4a e891da1d17                     call       0x7f0ce2dacbe0
01d4f f4                             hlt        
01d50 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01d5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d5e e87dda1d17                     call       0x7f0ce2dacbe0
01d63 f4                             hlt        
01d64 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01d6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d72 e869da1d17                     call       0x7f0ce2dacbe0
01d77 f4                             hlt        
01d78 beccffffff                     mov        esi, 0xffffffcc
01d7d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01d85 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01d8d 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01d95 90                             nop        
01d96 90                             nop        
01d97 90                             nop        
01d98 c5f877                         vzeroupper 
01d9b e8c0e8afff                     call       0x7f0ccb6cda60
01da0 0f1f8400981e002d               nop        dword ptr [rax + rax + 0x2d001e98]
01da8 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01db2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db6 e825da1d17                     call       0x7f0ce2dacbe0
01dbb f4                             hlt        
01dbc beccffffff                     mov        esi, 0xffffffcc
01dc1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01dc9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
01dd1 4c899424c0000000               mov        qword ptr [rsp + 0xc0], r10
01dd9 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01dde 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
01de6 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
01deb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01df0 448b542420                     mov        r10d, dword ptr [rsp + 0x20]
01df5 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01dfa 90                             nop        
01dfb 90                             nop        
01dfc c5f877                         vzeroupper 
01dff e85ce8afff                     call       0x7f0ccb6cda60
01e04 0f1f8400fc1e002e               nop        dword ptr [rax + rax + 0x2e001efc]
01e0c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01e16 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e1a e8c1d91d17                     call       0x7f0ce2dacbe0
01e1f f4                             hlt        
01e20 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01e24 83c508                         add        ebp, 8
01e27 be66ffffff                     mov        esi, 0xffffff66
01e2c 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01e31 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e36 90                             nop        
01e37 90                             nop        
01e38 c5f877                         vzeroupper 
01e3b e820e8afff                     call       0x7f0ccb6cda60
01e40 0f1f8400381f002f               nop        dword ptr [rax + rax + 0x2f001f38]
01e48 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01e52 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e56 e885d91d17                     call       0x7f0ce2dacbe0
01e5b f4                             hlt        
01e5c 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01e66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e6a e871d91d17                     call       0x7f0ce2dacbe0
01e6f f4                             hlt        
01e70 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01e7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e7e e85dd91d17                     call       0x7f0ce2dacbe0
01e83 f4                             hlt        
01e84 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e92 e849d91d17                     call       0x7f0ce2dacbe0
01e97 f4                             hlt        
01e98 48bfe04d45a40c7f0000           movabs     rdi, 0x7f0ca4454de0
01ea2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ea6 e835d91d17                     call       0x7f0ce2dacbe0
01eab f4                             hlt        
01eac 8b6c2450                       mov        ebp, dword ptr [rsp + 0x50]
01eb0 83c508                         add        ebp, 8
01eb3 be66ffffff                     mov        esi, 0xffffff66
01eb8 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
01ebd 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01ec2 90                             nop        
01ec3 90                             nop        
01ec4 c5f877                         vzeroupper 
01ec7 e894e7afff                     call       0x7f0ccb6cda60
01ecc 0f1f8400c41f0030               nop        dword ptr [rax + rax + 0x30001fc4]
01ed4 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01ede 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ee2 e8f9d81d17                     call       0x7f0ce2dacbe0
01ee7 f4                             hlt        
01ee8 bef6ffffff                     mov        esi, 0xfffffff6
01eed 90                             nop        
01eee 90                             nop        
01eef 90                             nop        
01ef0 c5f877                         vzeroupper 
01ef3 e868e7afff                     call       0x7f0ccb6cda60
01ef8 0f1f8400f01f0031               nop        dword ptr [rax + rax + 0x31001ff0]
01f00 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01f0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f0e e8cdd81d17                     call       0x7f0ce2dacbe0
01f13 f4                             hlt        
01f14 bef6ffffff                     mov        esi, 0xfffffff6
01f19 8b6c241c                       mov        ebp, dword ptr [rsp + 0x1c]
01f1d 90                             nop        
01f1e 90                             nop        
01f1f 90                             nop        
01f20 c5f877                         vzeroupper 
01f23 e838e7afff                     call       0x7f0ccb6cda60
01f28 0f1f840020200032               nop        dword ptr [rax + rax + 0x32002020]
01f30 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01f3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f3e e89dd81d17                     call       0x7f0ce2dacbe0
01f43 f4                             hlt        
01f44 bef6ffffff                     mov        esi, 0xfffffff6
01f49 90                             nop        
01f4a 90                             nop        
01f4b 90                             nop        
01f4c c5f877                         vzeroupper 
01f4f e80ce7afff                     call       0x7f0ccb6cda60
01f54 0f1f84004c200033               nop        dword ptr [rax + rax + 0x3300204c]
01f5c 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01f66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6a e871d81d17                     call       0x7f0ce2dacbe0
01f6f f4                             hlt        
01f70 bef6ffffff                     mov        esi, 0xfffffff6
01f75 418be9                         mov        ebp, r9d
01f78 c5f877                         vzeroupper 
01f7b e8e0e6afff                     call       0x7f0ccb6cda60
01f80 0f1f840078200034               nop        dword ptr [rax + rax + 0x34002078]
01f88 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01f92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f96 e845d81d17                     call       0x7f0ce2dacbe0
01f9b f4                             hlt        
01f9c eb14                           jmp        0x7f0ccbbcf3b2
01f9e eb12                           jmp        0x7f0ccbbcf3b2
01fa0 eb10                           jmp        0x7f0ccbbcf3b2
01fa2 eb0e                           jmp        0x7f0ccbbcf3b2
01fa4 eb0c                           jmp        0x7f0ccbbcf3b2
01fa6 eb0a                           jmp        0x7f0ccbbcf3b2
01fa8 eb08                           jmp        0x7f0ccbbcf3b2
01faa eb06                           jmp        0x7f0ccbbcf3b2
01fac eb04                           jmp        0x7f0ccbbcf3b2
01fae eb02                           jmp        0x7f0ccbbcf3b2
01fb0 eb00                           jmp        0x7f0ccbbcf3b2
01fb2 488bf0                         mov        rsi, rax
01fb5 e92aefffff                     jmp        0x7f0ccbbce2e4
01fba bef6ffffff                     mov        esi, 0xfffffff6
01fbf 90                             nop        
01fc0 c5f877                         vzeroupper 
01fc3 e898e6afff                     call       0x7f0ccb6cda60
01fc8 0f1f8400c0200035               nop        dword ptr [rax + rax + 0x350020c0]
01fd0 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
01fda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fde e8fdd71d17                     call       0x7f0ce2dacbe0
01fe3 f4                             hlt        
01fe4 bef6ffffff                     mov        esi, 0xfffffff6
01fe9 90                             nop        
01fea 90                             nop        
01feb 90                             nop        
01fec c5f877                         vzeroupper 
01fef e86ce6afff                     call       0x7f0ccb6cda60
01ff4 0f1f8400ec200036               nop        dword ptr [rax + rax + 0x360020ec]
01ffc 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
02006 4883e4f0                       and        rsp, 0xfffffffffffffff0
0200a e8d1d71d17                     call       0x7f0ce2dacbe0
0200f f4                             hlt        
02010 bef6ffffff                     mov        esi, 0xfffffff6
02015 90                             nop        
02016 90                             nop        
02017 90                             nop        
02018 c5f877                         vzeroupper 
0201b e840e6afff                     call       0x7f0ccb6cda60
02020 0f1f840018210037               nop        dword ptr [rax + rax + 0x37002118]
02028 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
02032 4883e4f0                       and        rsp, 0xfffffffffffffff0
02036 e8a5d71d17                     call       0x7f0ce2dacbe0
0203b f4                             hlt        
0203c bef6ffffff                     mov        esi, 0xfffffff6
02041 418bea                         mov        ebp, r10d
02044 c5f877                         vzeroupper 
02047 e814e6afff                     call       0x7f0ccb6cda60
0204c 0f1f840044210038               nop        dword ptr [rax + rax + 0x38002144]
02054 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0205e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02062 e879d71d17                     call       0x7f0ce2dacbe0
02067 f4                             hlt        
02068 bef6ffffff                     mov        esi, 0xfffffff6
0206d 90                             nop        
0206e 90                             nop        
0206f 90                             nop        
02070 c5f877                         vzeroupper 
02073 e8e8e5afff                     call       0x7f0ccb6cda60
02078 0f1f840070210039               nop        dword ptr [rax + rax + 0x39002170]
02080 48bf102d37a40c7f0000           movabs     rdi, 0x7f0ca4372d10
0208a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0208e e84dd71d17                     call       0x7f0ce2dacbe0
02093 f4                             hlt        
02094 49bae5d5bccb0c7f0000           movabs     r10, 0x7f0ccbbcd5e5
0209e 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
020a5 e9b62eb6ff                     jmp        0x7f0ccb732360
020aa e831fdb4ff                     call       0x7f0ccb71f1e0
020af e98adfffff                     jmp        0x7f0ccbbcd43e
020b4 f4                             hlt        
020b5 f4                             hlt        
020b6 f4                             hlt        
020b7 f4                             hlt        
