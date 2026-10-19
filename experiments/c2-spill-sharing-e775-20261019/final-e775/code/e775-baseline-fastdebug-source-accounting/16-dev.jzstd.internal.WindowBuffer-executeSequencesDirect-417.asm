00000 e83bd38718                     call       0x7fb3cc464340
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
0000f 90                             nop        
00010 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00017 55                             push       rbp
00018 4881ec00010000                 sub        rsp, 0x100
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8548370000                   jne        0x7fb3b3bea776
0002e 4c8b9640010000                 mov        r10, qword ptr [rsi + 0x140]
00035 4c89542448                     mov        qword ptr [rsp + 0x48], r10
0003a 4c8b9638010000                 mov        r10, qword ptr [rsi + 0x138]
00041 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00046 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
0004a 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0004f 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
00056 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0005b 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00062 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00067 488bae08010000                 mov        rbp, qword ptr [rsi + 0x108]
0006e 4c8bae00010000                 mov        r13, qword ptr [rsi + 0x100]
00075 8b9e30010000                   mov        ebx, dword ptr [rsi + 0x130]
0007b 895c2410                       mov        dword ptr [rsp + 0x10], ebx
0007f 8b9e18010000                   mov        ebx, dword ptr [rsi + 0x118]
00085 895c2428                       mov        dword ptr [rsp + 0x28], ebx
00089 8b9ef8000000                   mov        ebx, dword ptr [rsi + 0xf8]
0008f 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00096 8b9ef0000000                   mov        ebx, dword ptr [rsi + 0xf0]
0009c 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
000a0 8b9ee8000000                   mov        ebx, dword ptr [rsi + 0xe8]
000a6 895c2440                       mov        dword ptr [rsp + 0x40], ebx
000aa 488b9ed8000000                 mov        rbx, qword ptr [rsi + 0xd8]
000b1 48899c24a8000000               mov        qword ptr [rsp + 0xa8], rbx
000b9 488b9e90000000                 mov        rbx, qword ptr [rsi + 0x90]
000c0 48899c24b0000000               mov        qword ptr [rsp + 0xb0], rbx
000c8 488b9e80000000                 mov        rbx, qword ptr [rsi + 0x80]
000cf 48899c24b8000000               mov        qword ptr [rsp + 0xb8], rbx
000d7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
000da 899c24a4000000                 mov        dword ptr [rsp + 0xa4], ebx
000e1 8b5e70                         mov        ebx, dword ptr [rsi + 0x70]
000e4 899c24c0000000                 mov        dword ptr [rsp + 0xc0], ebx
000eb 8b9ea0000000                   mov        ebx, dword ptr [rsi + 0xa0]
000f1 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
000f5 488bfe                         mov        rdi, rsi
000f8 c5f877                         vzeroupper 
000fb 49ba706a62ccb37f0000           movabs     r10, 0x7fb3cc626a70
00105 41ffd2                         call       r10
00108 0f1f840000000000               nop        dword ptr [rax + rax]
00110 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
00115 4d85d2                         test       r10, r10
00118 0f840a1f0000                   je         0x7fb3b3be9028
0011e 458b12                         mov        r10d, dword ptr [r10]
00121 41c1ea0d                       shr        r10d, 0xd
00125 4181fa15410000                 cmp        r10d, 0x4115
0012c 0f85c2290000                   jne        0x7fb3b3be9af4
00132 488b5c2448                     mov        rbx, qword ptr [rsp + 0x48]
00137 48895c2408                     mov        qword ptr [rsp + 8], rbx
0013c 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
00141 4d85d2                         test       r10, r10
00144 0f84eb1e0000                   je         0x7fb3b3be9035
0014a 458b1a                         mov        r11d, dword ptr [r10]
0014d 41c1eb0d                       shr        r11d, 0xd
00151 4181fbf9060000                 cmp        r11d, 0x6f9
00158 0f8596290000                   jne        0x7fb3b3be9af4
0015e 498bda                         mov        rbx, r10
00161 48899c24c8000000               mov        qword ptr [rsp + 0xc8], rbx
00169 4c8b542458                     mov        r10, qword ptr [rsp + 0x58]
0016e 4d85d2                         test       r10, r10
00171 0f84ce1e0000                   je         0x7fb3b3be9045
00177 458b12                         mov        r10d, dword ptr [r10]
0017a 41c1ea0d                       shr        r10d, 0xd
0017e 4181fafc060000                 cmp        r10d, 0x6fc
00185 0f8569290000                   jne        0x7fb3b3be9af4
0018b 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00190 48899c24d0000000               mov        qword ptr [rsp + 0xd0], rbx
00198 4c8b542460                     mov        r10, qword ptr [rsp + 0x60]
0019d 4d85d2                         test       r10, r10
001a0 0f84af1e0000                   je         0x7fb3b3be9055
001a6 458b1a                         mov        r11d, dword ptr [r10]
001a9 41c1eb0d                       shr        r11d, 0xd
001ad 4181fbfb060000                 cmp        r11d, 0x6fb
001b4 0f853a290000                   jne        0x7fb3b3be9af4
001ba 498bda                         mov        rbx, r10
001bd 48895c2420                     mov        qword ptr [rsp + 0x20], rbx
001c2 4885ed                         test       rbp, rbp
001c5 0f84971e0000                   je         0x7fb3b3be9062
001cb 448b5500                       mov        r10d, dword ptr [rbp]
001cf 41c1ea0d                       shr        r10d, 0xd
001d3 4181fafb060000                 cmp        r10d, 0x6fb
001da 0f8514290000                   jne        0x7fb3b3be9af4
001e0 488bdd                         mov        rbx, rbp
001e3 48899c24d8000000               mov        qword ptr [rsp + 0xd8], rbx
001eb 4d85ed                         test       r13, r13
001ee 0f847e1e0000                   je         0x7fb3b3be9072
001f4 458b5d00                       mov        r11d, dword ptr [r13]
001f8 41c1eb0d                       shr        r11d, 0xd
001fc 4181fbf9060000                 cmp        r11d, 0x6f9
00203 0f85eb280000                   jne        0x7fb3b3be9af4
00209 4c89ac24e0000000               mov        qword ptr [rsp + 0xe0], r13
00211 e928050000                     jmp        0x7fb3b3be773e
00216 448bdd                         mov        r11d, ebp
00219 4d63d3                         movsxd     r10, r11d
0021c 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00223 c442a8f5db                     bzhi       r11, r11, r10
00228 c4c1fb92fb                     kmovq      k7, r11
0022d 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00233 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00239 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00241 4403d5                         add        r10d, ebp
00244 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0024c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00250 418502                         test       dword ptr [r10], eax
00253 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0025b 443b9c2480000000               cmp        r11d, dword ptr [rsp + 0x80]
00263 0f8dc0080000                   jge        0x7fb3b3be7b29
00269 44896c247c                     mov        dword ptr [rsp + 0x7c], r13d
0026e 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00273 442b9424a0000000               sub        r10d, dword ptr [rsp + 0xa0]
0027b 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
00283 8bac2480000000                 mov        ebp, dword ptr [rsp + 0x80]
0028a 2bac24a0000000                 sub        ebp, dword ptr [rsp + 0xa0]
00291 3bac24a0000000                 cmp        ebp, dword ptr [rsp + 0xa0]
00298 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
002a0 410f4fed                       cmovg      ebp, r13d
002a4 4585d2                         test       r10d, r10d
002a7 0f8cc7240000                   jl         0x7fb3b3be9774
002ad 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002b2 4585d2                         test       r10d, r10d
002b5 0f8cb9240000                   jl         0x7fb3b3be9774
002bb 448bdd                         mov        r11d, ebp
002be 44039c2490000000               add        r11d, dword ptr [rsp + 0x90]
002c6 453bf3                         cmp        r14d, r11d
002c9 0f82a5240000                   jb         0x7fb3b3be9774
002cf 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
002d4 4403ed                         add        r13d, ebp
002d7 453bf5                         cmp        r14d, r13d
002da 0f8294240000                   jb         0x7fb3b3be9774
002e0 85ed                           test       ebp, ebp
002e2 0f8c8c240000                   jl         0x7fb3b3be9774
002e8 85ed                           test       ebp, ebp
002ea 0f8449ffffff                   je         0x7fb3b3be7239
002f0 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
002f8 4b8d741308                     lea        rsi, [r11 + r10 + 8]
002fd 448b9c2490000000               mov        r11d, dword ptr [rsp + 0x90]
00305 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
0030d 4b8d7c1a08                     lea        rdi, [r10 + r11 + 8]
00312 4863d5                         movsxd     rdx, ebp
00315 4883fa20                       cmp        rdx, 0x20
00319 0f86f7feffff                   jbe        0x7fb3b3be7216
0031f c5f877                         vzeroupper 
00322 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
0032c 41ffd2                         call       r10
0032f 0f1f840000000000               nop        dword ptr [rax + rax]
00337 e9fdfeffff                     jmp        0x7fb3b3be7239
0033c 894c2448                       mov        dword ptr [rsp + 0x48], ecx
00340 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00348 4585db                         test       r11d, r11d
0034b 0f8ed3160000                   jle        0x7fb3b3be8a24
00351 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00359 4503de                         add        r11d, r14d
0035c 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00364 0f8fce170000                   jg         0x7fb3b3be8b38
0036a 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0036f 4403db                         add        r11d, ebx
00372 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
0037a 443b9c24c0000000               cmp        r11d, dword ptr [rsp + 0xc0]
00382 0f8f30180000                   jg         0x7fb3b3be8bb8
00388 83fb10                         cmp        ebx, 0x10
0038b 0f8f3f080000                   jg         0x7fb3b3be7bd0
00391 4c8bac24c8000000               mov        r13, qword ptr [rsp + 0xc8]
00399 458b5504                       mov        r10d, dword ptr [r13 + 4]
0039d 458d5af1                       lea        r11d, [r10 - 0xf]
003a1 4585db                         test       r11d, r11d
003a4 0f8c6a130000                   jl         0x7fb3b3be8714
003aa 4183c2f1                       add        r10d, -0xf
003ae 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
003b3 453bda                         cmp        r11d, r10d
003b6 0f833c120000                   jae        0x7fb3b3be85f8
003bc 4c8bac24e0000000               mov        r13, qword ptr [rsp + 0xe0]
003c4 458b5504                       mov        r10d, dword ptr [r13 + 4]
003c8 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
003cd 4c8bb424c8000000               mov        r14, qword ptr [rsp + 0xc8]
003d5 c4817a6f442e08                 vmovdqu    xmm0, xmmword ptr [r14 + r13 + 8]
003dc 458d5af1                       lea        r11d, [r10 - 0xf]
003e0 4585db                         test       r11d, r11d
003e3 0f8cab130000                   jl         0x7fb3b3be8794
003e9 4183c2f1                       add        r10d, -0xf
003ed 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
003f5 453bc2                         cmp        r8d, r10d
003f8 0f837a120000                   jae        0x7fb3b3be8678
003fe 468d342b                       lea        r14d, [rbx + r13]
00402 4489b42494000000               mov        dword ptr [rsp + 0x94], r14d
0040a 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00412 4c8bac24e0000000               mov        r13, qword ptr [rsp + 0xe0]
0041a c4817a7f441d08                 vmovdqu    xmmword ptr [r13 + r11 + 8], xmm0
00421 4103db                         add        ebx, r11d
00424 448beb                         mov        r13d, ebx
00427 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
0042f 4c8b8424e0000000               mov        r8, qword ptr [rsp + 0xe0]
00437 458b7004                       mov        r14d, dword ptr [r8 + 4]
0043b 458d56f1                       lea        r10d, [r14 - 0xf]
0043f 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
00447 4183fb10                       cmp        r11d, 0x10
0044b 7f4b                           jg         0x7fb3b3be7498
0044d 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00455 4183fb10                       cmp        r11d, 0x10
00459 7c3d                           jl         0x7fb3b3be7498
0045b 4585d2                         test       r10d, r10d
0045e 0f8c48150000                   jl         0x7fb3b3be89ac
00464 4183c6f1                       add        r14d, -0xf
00468 453bee                         cmp        r13d, r14d
0046b 0f8337140000                   jae        0x7fb3b3be88a8
00471 c4817a6f442808                 vmovdqu    xmm0, xmmword ptr [r8 + r13 + 8]
00478 413bde                         cmp        ebx, r14d
0047b 0f839f140000                   jae        0x7fb3b3be8920
00481 c4c17a7f441808                 vmovdqu    xmmword ptr [r8 + rbx + 8], xmm0
00488 448bac2480000000               mov        r13d, dword ptr [rsp + 0x80]
00490 4403eb                         add        r13d, ebx
00493 e97f020000                     jmp        0x7fb3b3be7717
00498 458d5ef9                       lea        r11d, [r14 - 7]
0049c 4b8d7c2808                     lea        rdi, [r8 + r13 + 8]
004a1 8b8c2480000000                 mov        ecx, dword ptr [rsp + 0x80]
004a8 03cb                           add        ecx, ebx
004aa 898c2498000000                 mov        dword ptr [rsp + 0x98], ecx
004b1 498d741808                     lea        rsi, [r8 + rbx + 8]
004b6 4863d1                         movsxd     rdx, ecx
004b9 8b8c24a0000000                 mov        ecx, dword ptr [rsp + 0xa0]
004c0 3b8c2480000000                 cmp        ecx, dword ptr [rsp + 0x80]
004c7 0f8cc3040000                   jl         0x7fb3b3be7990
004cd 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
004d5 4183fa30                       cmp        r10d, 0x30
004d9 0f8e86000000                   jle        0x7fb3b3be7565
004df 4585ed                         test       r13d, r13d
004e2 0f8cc21b0000                   jl         0x7fb3b3be90aa
004e8 85db                           test       ebx, ebx
004ea 0f8cba1b0000                   jl         0x7fb3b3be90aa
004f0 478d1c2a                       lea        r11d, [r10 + r13]
004f4 453bf3                         cmp        r14d, r11d
004f7 0f82ad1b0000                   jb         0x7fb3b3be90aa
004fd 443bb42498000000               cmp        r14d, dword ptr [rsp + 0x98]
00505 0f829f1b0000                   jb         0x7fb3b3be90aa
0050b 458bea                         mov        r13d, r10d
0050e 4585ed                         test       r13d, r13d
00511 0f84f6010000                   je         0x7fb3b3be770d
00517 4963d5                         movsxd     rdx, r13d
0051a 4883fa20                       cmp        rdx, 0x20
0051e 7728                           ja         0x7fb3b3be7548
00520 458bdd                         mov        r11d, r13d
00523 4d63d3                         movsxd     r10, r11d
00526 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
0052d c442a8f5db                     bzhi       r11, r11, r10
00532 c4c1fb92fb                     kmovq      k7, r11
00537 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
0053d 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00543 e9c5010000                     jmp        0x7fb3b3be770d
00548 c5f877                         vzeroupper 
0054b 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00555 41ffd2                         call       r10
00558 0f1f840000000000               nop        dword ptr [rax + rax]
00560 e9a8010000                     jmp        0x7fb3b3be770d
00565 4585db                         test       r11d, r11d
00568 0f8cca180000                   jl         0x7fb3b3be8e38
0056e 458d4ef9                       lea        r9d, [r14 - 7]
00572 453be9                         cmp        r13d, r9d
00575 0f83a1170000                   jae        0x7fb3b3be8d1c
0057b 4963cd                         movsxd     rcx, r13d
0057e 4d8b540808                     mov        r10, qword ptr [r8 + rcx + 8]
00583 413bd9                         cmp        ebx, r9d
00586 0f8320180000                   jae        0x7fb3b3be8dac
0058c 448bdb                         mov        r11d, ebx
0058f 418d7b08                       lea        edi, [r11 + 8]
00593 4963f3                         movsxd     rsi, r11d
00596 4d89543008                     mov        qword ptr [r8 + rsi + 8], r10
0059b 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
005a2 0f8d65010000                   jge        0x7fb3b3be770d
005a8 482bce                         sub        rcx, rsi
005ab 4963f6                         movsxd     rsi, r14d
005ae 4883c6f9                       add        rsi, -7
005b2 4863c7                         movsxd     rax, edi
005b5 4c8d1408                       lea        r10, [rax + rcx]
005b9 4c3bd6                         cmp        r10, rsi
005bc 0f8306190000                   jae        0x7fb3b3be8ec8
005c2 4c8bd2                         mov        r10, rdx
005c5 4c2bd0                         sub        r10, rax
005c8 4983c207                       add        r10, 7
005cc 4983e2f8                       and        r10, 0xfffffffffffffff8
005d0 458bd2                         mov        r10d, r10d
005d3 478d541a08                     lea        r10d, [r10 + r11 + 8]
005d8 4d63d2                         movsxd     r10, r10d
005db 498d440af8                     lea        rax, [r10 + rcx - 8]
005e0 483bc6                         cmp        rax, rsi
005e3 0f83df180000                   jae        0x7fb3b3be8ec8
005e9 413bf9                         cmp        edi, r9d
005ec 0f83d6180000                   jae        0x7fb3b3be8ec8
005f2 4983c2f8                       add        r10, -8
005f6 4c3bd6                         cmp        r10, rsi
005f9 0f83c9180000                   jae        0x7fb3b3be8ec8
005ff 448bb42498000000               mov        r14d, dword ptr [rsp + 0x98]
00607 4181fef8ffff7f                 cmp        r14d, 0x7ffffff8
0060e 0f8f40190000                   jg         0x7fb3b3be8f54
00614 452beb                         sub        r13d, r11d
00617 4183c310                       add        r11d, 0x10
0061b 448bd7                         mov        r10d, edi
0061e 428d042f                       lea        eax, [rdi + r13]
00622 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
0062a 4d8b440608                     mov        r8, qword ptr [r14 + rax + 8]
0062f 4f89441608                     mov        qword ptr [r14 + r10 + 8], r8
00634 8d4708                         lea        eax, [rdi + 8]
00637 413bc3                         cmp        eax, r11d
0063a 7d04                           jge        0x7fb3b3be7640
0063c 8bf8                           mov        edi, eax
0063e ebdb                           jmp        0x7fb3b3be761b
00640 4883c2f8                       add        rdx, -8
00644 4881fa00000080                 cmp        rdx, -0x80000000
0064b 49c7c200000080                 mov        r10, 0xffffffff80000000
00652 490f4cd2                       cmovl      rdx, r10
00656 8bd2                           mov        edx, edx
00658 3bc2                           cmp        eax, edx
0065a 7d6a                           jge        0x7fb3b3be76c6
0065c 4c63d0                         movsxd     r10, eax
0065f 4c03d1                         add        r10, rcx
00662 4c3bd6                         cmp        r10, rsi
00665 0f836d190000                   jae        0x7fb3b3be8fd8
0066b 83c710                         add        edi, 0x10
0066e 4c63d7                         movsxd     r10, edi
00671 4c03d1                         add        r10, rcx
00674 4c3bd6                         cmp        r10, rsi
00677 0f836f190000                   jae        0x7fb3b3be8fec
0067d 413bc1                         cmp        eax, r9d
00680 0f837a190000                   jae        0x7fb3b3be9000
00686 413bf9                         cmp        edi, r9d
00689 0f8385190000                   jae        0x7fb3b3be9014
0068f 90                             nop        
00690 448bd0                         mov        r10d, eax
00693 4963fa                         movsxd     rdi, r10d
00696 448bd0                         mov        r10d, eax
00699 468d0428                       lea        r8d, [rax + r13]
0069d 458bd8                         mov        r11d, r8d
006a0 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
006a8 4f8b440608                     mov        r8, qword ptr [r14 + r8 + 8]
006ad 4f89441608                     mov        qword ptr [r14 + r10 + 8], r8
006b2 4d63d3                         movsxd     r10, r11d
006b5 4f8b541610                     mov        r10, qword ptr [r14 + r10 + 0x10]
006ba 4d89543e10                     mov        qword ptr [r14 + rdi + 0x10], r10
006bf 83c010                         add        eax, 0x10
006c2 3bc2                           cmp        eax, edx
006c4 7cca                           jl         0x7fb3b3be7690
006c6 3b842498000000                 cmp        eax, dword ptr [rsp + 0x98]
006cd 7d3e                           jge        0x7fb3b3be770d
006cf 4c63d0                         movsxd     r10, eax
006d2 4c03d1                         add        r10, rcx
006d5 4c3bd6                         cmp        r10, rsi
006d8 0f83a4190000                   jae        0x7fb3b3be9082
006de 413bc1                         cmp        eax, r9d
006e1 0f83af190000                   jae        0x7fb3b3be9096
006e7 90                             nop        
006e8 468d1c28                       lea        r11d, [rax + r13]
006ec 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
006f4 4f8b5c1e08                     mov        r11, qword ptr [r14 + r11 + 8]
006f9 448bd0                         mov        r10d, eax
006fc 4f895c1608                     mov        qword ptr [r14 + r10 + 8], r11
00701 83c008                         add        eax, 8
00704 3b842498000000                 cmp        eax, dword ptr [rsp + 0x98]
0070b 7cdb                           jl         0x7fb3b3be76e8
0070d 039c2480000000                 add        ebx, dword ptr [rsp + 0x80]
00714 448beb                         mov        r13d, ebx
00717 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0071b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00720 41ffc3                         inc        r11d
00723 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00728 418502                         test       dword ptr [r10], eax
0072b 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
00733 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
0073a 895c247c                       mov        dword ptr [rsp + 0x7c], ebx
0073e 4c6344247c                     movsxd     r8, dword ptr [rsp + 0x7c]
00743 4c638c2488000000               movsxd     r9, dword ptr [rsp + 0x88]
0074b 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00750 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
00755 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0075a 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
0075f 0f8dbf060000                   jge        0x7fb3b3be7e24
00765 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
0076d 8b4b04                         mov        ecx, dword ptr [rbx + 4]
00770 443bd9                         cmp        r11d, ecx
00773 0f831f0e0000                   jae        0x7fb3b3be8598
00779 488b9c24d0000000               mov        rbx, qword ptr [rsp + 0xd0]
00781 4a8b4cdb08                     mov        rcx, qword ptr [rbx + r11*8 + 8]
00786 8bd9                           mov        ebx, ecx
00788 81e3ffff0100                   and        ebx, 0x1ffff
0078e 4c8bd9                         mov        r11, rcx
00791 49c1fb24                       sar        r11, 0x24
00795 48c1e912                       shr        rcx, 0x12
00799 458bdb                         mov        r11d, r11d
0079c 418bfb                         mov        edi, r11d
0079f 448be9                         mov        r13d, ecx
007a2 4181e5ffff0300                 and        r13d, 0x3ffff
007a9 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
007b1 4585db                         test       r11d, r11d
007b4 0f8c9e120000                   jl         0x7fb3b3be8a58
007ba 85db                           test       ebx, ebx
007bc 0f85d3000000                   jne        0x7fb3b3be7895
007c2 33db                           xor        ebx, ebx
007c4 4183fb03                       cmp        r11d, 3
007c8 0f8e02010000                   jle        0x7fb3b3be78d0
007ce 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
007d6 458b5d04                       mov        r11d, dword ptr [r13 + 4]
007da 448d57fd                       lea        r10d, [rdi - 3]
007de 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
007e6 4183fb02                       cmp        r11d, 2
007ea 0f8640100000                   jbe        0x7fb3b3be8830
007f0 458b550c                       mov        r10d, dword ptr [r13 + 0xc]
007f4 45895510                       mov        dword ptr [r13 + 0x10], r10d
007f8 458b5d08                       mov        r11d, dword ptr [r13 + 8]
007fc 45895d0c                       mov        dword ptr [r13 + 0xc], r11d
00800 4c8bb424d8000000               mov        r14, qword ptr [rsp + 0xd8]
00808 448bac24a0000000               mov        r13d, dword ptr [rsp + 0xa0]
00810 45896e08                       mov        dword ptr [r14 + 8], r13d
00814 4c639424a0000000               movsxd     r10, dword ptr [rsp + 0xa0]
0081c 4c891424                       mov        qword ptr [rsp], r10
00820 4c63942488000000               movsxd     r10, dword ptr [rsp + 0x88]
00828 4c039424a8000000               add        r10, qword ptr [rsp + 0xa8]
00830 4863d3                         movsxd     rdx, ebx
00833 4c03d2                         add        r10, rdx
00836 4c8b1c24                       mov        r11, qword ptr [rsp]
0083a 4d3bda                         cmp        r11, r10
0083d 0f8f7d120000                   jg         0x7fb3b3be8ac0
00843 448bb42488000000               mov        r14d, dword ptr [rsp + 0x88]
0084b 4403f3                         add        r14d, ebx
0084e 458bee                         mov        r13d, r14d
00851 442bac24a0000000               sub        r13d, dword ptr [rsp + 0xa0]
00859 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
0085d 85c9                           test       ecx, ecx
0085f 0f85d7faffff                   jne        0x7fb3b3be733c
00865 4d63dd                         movsxd     r11, r13d
00868 4c3b9c24b0000000               cmp        r11, qword ptr [rsp + 0xb0]
00870 0f8cbe130000                   jl         0x7fb3b3be8c34
00876 4c8b1c24                       mov        r11, qword ptr [rsp]
0087a 4c3b9c24b8000000               cmp        r11, qword ptr [rsp + 0xb8]
00882 0f8f20140000                   jg         0x7fb3b3be8ca8
00888 4533db                         xor        r11d, r11d
0088b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00890 e9abfaffff                     jmp        0x7fb3b3be7340
00895 413bda                         cmp        ebx, r10d
00898 0f8e26ffffff                   jle        0x7fb3b3be77c4
0089e be45ffffff                     mov        esi, 0xffffff45
008a3 8beb                           mov        ebp, ebx
008a5 44891424                       mov        dword ptr [rsp], r10d
008a9 90                             nop        
008aa 90                             nop        
008ab 90                             nop        
008ac c5f877                         vzeroupper 
008af e8ac61aeff                     call       0x7fb3b36cda60
008b4 0f1f8400ac090002               nop        dword ptr [rax + rax + 0x20009ac]
008bc 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
008c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
008ca e851f36418                     call       0x7fb3cc236c20
008cf f4                             hlt        
008d0 85db                           test       ebx, ebx
008d2 7407                           je         0x7fb3b3be78db
008d4 458d53ff                       lea        r10d, [r11 - 1]
008d8 418bfa                         mov        edi, r10d
008db 85ff                           test       edi, edi
008dd 751e                           jne        0x7fb3b3be78fd
008df 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
008e7 458b5d04                       mov        r11d, dword ptr [r13 + 4]
008eb 4585db                         test       r11d, r11d
008ee 0f868c1a0000                   jbe        0x7fb3b3be9380
008f4 458b6d08                       mov        r13d, dword ptr [r13 + 8]
008f8 e986000000                     jmp        0x7fb3b3be7983
008fd 83ff03                         cmp        edi, 3
00900 0f84561f0000                   je         0x7fb3b3be985c
00906 83ff02                         cmp        edi, 2
00909 0f87c11f0000                   ja         0x7fb3b3be98d0
0090f 4c8bac24d8000000               mov        r13, qword ptr [rsp + 0xd8]
00917 458b5d04                       mov        r11d, dword ptr [r13 + 4]
0091b 413bfb                         cmp        edi, r11d
0091e 0f8359190000                   jae        0x7fb3b3be927d
00924 458b6cbd08                     mov        r13d, dword ptr [r13 + rdi*4 + 8]
00929 85ff                           test       edi, edi
0092b 7e41                           jle        0x7fb3b3be796e
0092d 4585db                         test       r11d, r11d
00930 0f86a21e0000                   jbe        0x7fb3b3be97d8
00936 8d4fff                         lea        ecx, [rdi - 1]
00939 413bcb                         cmp        ecx, r11d
0093c 0f83961e0000                   jae        0x7fb3b3be97d8
00942 4183fb01                       cmp        r11d, 1
00946 0f868c1e0000                   jbe        0x7fb3b3be97d8
0094c 90                             nop        
0094d 90                             nop        
0094e 90                             nop        
0094f 90                             nop        
00950 4c8bb424d8000000               mov        r14, qword ptr [rsp + 0xd8]
00958 458b54be04                     mov        r10d, dword ptr [r14 + rdi*4 + 4]
0095d 458954be08                     mov        dword ptr [r14 + rdi*4 + 8], r10d
00962 448d57ff                       lea        r10d, [rdi - 1]
00966 418bfa                         mov        edi, r10d
00969 4585d2                         test       r10d, r10d
0096c 7fe2                           jg         0x7fb3b3be7950
0096e 4585db                         test       r11d, r11d
00971 0f8695190000                   jbe        0x7fb3b3be930c
00977 4c8bb424d8000000               mov        r14, qword ptr [rsp + 0xd8]
0097f 45896e08                       mov        dword ptr [r14 + 8], r13d
00983 4489ac24a0000000               mov        dword ptr [rsp + 0xa0], r13d
0098b e984feffff                     jmp        0x7fb3b3be7814
00990 83f910                         cmp        ecx, 0x10
00993 0f8d22090000                   jge        0x7fb3b3be82bb
00999 83f908                         cmp        ecx, 8
0099c 0f8d35050000                   jge        0x7fb3b3be7ed7
009a2 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
009aa 4183f910                       cmp        r9d, 0x10
009ae 0f8f82010000                   jg         0x7fb3b3be7b36
009b4 453bee                         cmp        r13d, r14d
009b7 0f83271a0000                   jae        0x7fb3b3be93e4
009bd 430fbe6c2808                   movsx      ebp, byte ptr [r8 + r13 + 8]
009c3 413bde                         cmp        ebx, r14d
009c6 0f83981a0000                   jae        0x7fb3b3be9464
009cc 41886c1808                     mov        byte ptr [r8 + rbx + 8], bpl
009d1 448d5301                       lea        r10d, [rbx + 1]
009d5 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
009dd 458d5503                       lea        r10d, [r13 + 3]
009e1 453bd6                         cmp        r10d, r14d
009e4 0f83de1a0000                   jae        0x7fb3b3be94c8
009ea 4d63cd                         movsxd     r9, r13d
009ed 430fbe6c0809                   movsx      ebp, byte ptr [r8 + r9 + 9]
009f3 448d5303                       lea        r10d, [rbx + 3]
009f7 453bd6                         cmp        r10d, r14d
009fa 0f832c1b0000                   jae        0x7fb3b3be952c
00a00 4c63d3                         movsxd     r10, ebx
00a03 43886c1009                     mov        byte ptr [r8 + r10 + 9], bpl
00a08 430fbe4c080a                   movsx      ecx, byte ptr [r8 + r9 + 0xa]
00a0e 43884c100a                     mov        byte ptr [r8 + r10 + 0xa], cl
00a13 470fbe4c080b                   movsx      r9d, byte ptr [r8 + r9 + 0xb]
00a19 47884c100b                     mov        byte ptr [r8 + r10 + 0xb], r9b
00a1e 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00a26 4183fa08                       cmp        r10d, 8
00a2a 0f83641b0000                   jae        0x7fb3b3be9594
00a30 49ba283b27e300000000           movabs     r10, 0xe3273b28
00a3a 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
00a42 47036c8a08                     add        r13d, dword ptr [r10 + r9*4 + 8]
00a47 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
00a4f 4183f904                       cmp        r9d, 4
00a53 7e65                           jle        0x7fb3b3be7aba
00a55 418d6efd                       lea        ebp, [r14 - 3]
00a59 89ac248c000000                 mov        dword ptr [rsp + 0x8c], ebp
00a60 448d4b04                       lea        r9d, [rbx + 4]
00a64 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00a6c 85ed                           test       ebp, ebp
00a6e 0f8c7c1c0000                   jl         0x7fb3b3be96f0
00a74 458bce                         mov        r9d, r14d
00a77 4183c1fd                       add        r9d, -3
00a7b 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
00a83 453be9                         cmp        r13d, r9d
00a86 0f837c1b0000                   jae        0x7fb3b3be9608
00a8c 458bcd                         mov        r9d, r13d
00a8f 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
00a94 438b6c0808                     mov        ebp, dword ptr [r8 + r9 + 8]
00a99 448b942490000000               mov        r10d, dword ptr [rsp + 0x90]
00aa1 443b94248c000000               cmp        r10d, dword ptr [rsp + 0x8c]
00aa9 0f83dd1b0000                   jae        0x7fb3b3be968c
00aaf 448bcb                         mov        r9d, ebx
00ab2 4d63d1                         movsxd     r10, r9d
00ab5 43896c100c                     mov        dword ptr [r8 + r10 + 0xc], ebp
00aba 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
00ac2 4183fa08                       cmp        r10d, 8
00ac6 7e61                           jle        0x7fb3b3be7b29
00ac8 448d4b08                       lea        r9d, [rbx + 8]
00acc 44898c2484000000               mov        dword ptr [rsp + 0x84], r9d
00ad4 49b9503b27e300000000           movabs     r9, 0xe3273b50
00ade 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00ae6 478b549108                     mov        r10d, dword ptr [r9 + r10*4 + 8]
00aeb 452bea                         sub        r13d, r10d
00aee 418d6d08                       lea        ebp, [r13 + 8]
00af2 4585db                         test       r11d, r11d
00af5 0f8c111f0000                   jl         0x7fb3b3be9a0c
00afb 4183c6f9                       add        r14d, -7
00aff 413bee                         cmp        ebp, r14d
00b02 0f833c1e0000                   jae        0x7fb3b3be9944
00b08 4d63d5                         movsxd     r10, r13d
00b0b 4b8b6c1010                     mov        rbp, qword ptr [r8 + r10 + 0x10]
00b10 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
00b18 453bde                         cmp        r11d, r14d
00b1b 0f838f1e0000                   jae        0x7fb3b3be99b0
00b21 4c63d3                         movsxd     r10, ebx
00b24 4b896c1010                     mov        qword ptr [r8 + r10 + 0x10], rbp
00b29 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
00b31 e9e1fbffff                     jmp        0x7fb3b3be7717
00b36 4585ed                         test       r13d, r13d
00b39 0f8c391f0000                   jl         0x7fb3b3be9a78
00b3f 85db                           test       ebx, ebx
00b41 0f8c311f0000                   jl         0x7fb3b3be9a78
00b47 443bf3                         cmp        r14d, ebx
00b4a 0f82281f0000                   jb         0x7fb3b3be9a78
00b50 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b58 4403d3                         add        r10d, ebx
00b5b 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00b60 453bf2                         cmp        r14d, r10d
00b63 0f820f1f0000                   jb         0x7fb3b3be9a78
00b69 85c9                           test       ecx, ecx
00b6b 0f8c071f0000                   jl         0x7fb3b3be9a78
00b71 85c9                           test       ecx, ecx
00b73 0f84f5f6ffff                   je         0x7fb3b3be726e
00b79 4c8b1424                       mov        r10, qword ptr [rsp]
00b7d 4983fa20                       cmp        r10, 0x20
00b81 772d                           ja         0x7fb3b3be7bb0
00b83 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00b8b 4d63d2                         movsxd     r10, r10d
00b8e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b95 c442a8f5db                     bzhi       r11, r11, r10
00b9a c4c1fb92fb                     kmovq      k7, r11
00b9f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00ba5 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00bab e9bef6ffff                     jmp        0x7fb3b3be726e
00bb0 498bd2                         mov        rdx, r10
00bb3 c5f877                         vzeroupper 
00bb6 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00bc0 41ffd2                         call       r10
00bc3 0f1f840000000000               nop        dword ptr [rax + rax]
00bcb e99ef6ffff                     jmp        0x7fb3b3be726e
00bd0 83fb30                         cmp        ebx, 0x30
00bd3 0f8eb3000000                   jle        0x7fb3b3be7c8c
00bd9 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00be1 418b7a04                       mov        edi, dword ptr [r10 + 4]
00be5 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00bed 418b4a04                       mov        ecx, dword ptr [r10 + 4]
00bf1 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00bf6 4585db                         test       r11d, r11d
00bf9 0f8cf9200000                   jl         0x7fb3b3be9cf8
00bff 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00c07 4585d2                         test       r10d, r10d
00c0a 0f8ce8200000                   jl         0x7fb3b3be9cf8
00c10 3bbc2494000000                 cmp        edi, dword ptr [rsp + 0x94]
00c17 0f82db200000                   jb         0x7fb3b3be9cf8
00c1d 413bce                         cmp        ecx, r14d
00c20 0f82d2200000                   jb         0x7fb3b3be9cf8
00c26 85db                           test       ebx, ebx
00c28 7440                           je         0x7fb3b3be7c6a
00c2a 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00c32 4b8d740a08                     lea        rsi, [r10 + r9 + 8]
00c37 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c3f 4b8d7c0208                     lea        rdi, [r10 + r8 + 8]
00c44 4883fa20                       cmp        rdx, 0x20
00c48 7728                           ja         0x7fb3b3be7c72
00c4a 4c63d3                         movsxd     r10, ebx
00c4d 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00c54 c442a8f5db                     bzhi       r11, r11, r10
00c59 c4c1fb92fb                     kmovq      k7, r11
00c5e 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00c64 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00c6a 418bde                         mov        ebx, r14d
00c6d e9bdf7ffff                     jmp        0x7fb3b3be742f
00c72 c5f877                         vzeroupper 
00c75 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00c7f 41ffd2                         call       r10
00c82 0f1f840000000000               nop        dword ptr [rax + rax]
00c8a ebde                           jmp        0x7fb3b3be7c6a
00c8c 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00c94 418b5204                       mov        edx, dword ptr [r10 + 4]
00c98 8d6af1                         lea        ebp, [rdx - 0xf]
00c9b 85ed                           test       ebp, ebp
00c9d 0f8ce11f0000                   jl         0x7fb3b3be9c84
00ca3 8d6af1                         lea        ebp, [rdx - 0xf]
00ca6 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
00cab 443bd5                         cmp        r10d, ebp
00cae 0f83cc1e0000                   jae        0x7fb3b3be9b80
00cb4 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00cbc 458b4204                       mov        r8d, dword ptr [r10 + 4]
00cc0 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00cc5 418bc3                         mov        eax, r11d
00cc8 418d68f1                       lea        ebp, [r8 - 0xf]
00ccc 4d63cb                         movsxd     r9, r11d
00ccf 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
00cd7 c4817a6f440a08                 vmovdqu    xmm0, xmmword ptr [r10 + r9 + 8]
00cde 85ed                           test       ebp, ebp
00ce0 0f8caa200000                   jl         0x7fb3b3be9d90
00ce6 458d58f1                       lea        r11d, [r8 - 0xf]
00cea 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00cf2 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00cfa 453bd3                         cmp        r10d, r11d
00cfd 0f83f11e0000                   jae        0x7fb3b3be9bf4
00d03 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00d0b 418bcb                         mov        ecx, r11d
00d0e 4963fb                         movsxd     rdi, r11d
00d11 4c8b9424e0000000               mov        r10, qword ptr [rsp + 0xe0]
00d19 c4c17a7f443a08                 vmovdqu    xmmword ptr [r10 + rdi + 8], xmm0
00d20 458d5310                       lea        r10d, [r11 + 0x10]
00d24 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
00d29 453bd6                         cmp        r10d, r14d
00d2c 0f8dbc000000                   jge        0x7fb3b3be7dee
00d32 4c2bcf                         sub        r9, rdi
00d35 4863fa                         movsxd     rdi, edx
00d38 4883c7f1                       add        rdi, -0xf
00d3c 4d63da                         movsxd     r11, r10d
00d3f 4f8d140b                       lea        r10, [r11 + r9]
00d43 4c3bd7                         cmp        r10, rdi
00d46 0f83b8200000                   jae        0x7fb3b3be9e04
00d4c 4d63d6                         movsxd     r10, r14d
00d4f 4d2bd3                         sub        r10, r11
00d52 4983c20f                       add        r10, 0xf
00d56 4983e2f0                       and        r10, 0xfffffffffffffff0
00d5a 458bda                         mov        r11d, r10d
00d5d 458d5c0b10                     lea        r11d, [r11 + rcx + 0x10]
00d62 4d63d3                         movsxd     r10, r11d
00d65 4f8d5c0af0                     lea        r11, [r10 + r9 - 0x10]
00d6a 4c3bdf                         cmp        r11, rdi
00d6d 0f8391200000                   jae        0x7fb3b3be9e04
00d73 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00d78 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
00d80 0f837e200000                   jae        0x7fb3b3be9e04
00d86 4d63d8                         movsxd     r11, r8d
00d89 4983c2f0                       add        r10, -0x10
00d8d 4983c3f1                       add        r11, -0xf
00d91 4d3bd3                         cmp        r10, r11
00d94 0f836a200000                   jae        0x7fb3b3be9e04
00d9a 4181fef0ffff7f                 cmp        r14d, 0x7ffffff0
00da1 0f8fc1200000                   jg         0x7fb3b3be9e68
00da7 448bd0                         mov        r10d, eax
00daa 442bd1                         sub        r10d, ecx
00dad 90                             nop        
00dae 90                             nop        
00daf 90                             nop        
00db0 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00db5 458bca                         mov        r9d, r10d
00db8 44034c247c                     add        r9d, dword ptr [rsp + 0x7c]
00dbd 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00dc5 c4817a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 8]
00dcc 4c8b8c24e0000000               mov        r9, qword ptr [rsp + 0xe0]
00dd4 c4817a7f441908                 vmovdqu    xmmword ptr [r9 + r11 + 8], xmm0
00ddb 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00de0 4183c310                       add        r11d, 0x10
00de4 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
00de9 453bde                         cmp        r11d, r14d
00dec 7cc2                           jl         0x7fb3b3be7db0
00dee 03d8                           add        ebx, eax
00df0 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00df7 418bde                         mov        ebx, r14d
00dfa e930f6ffff                     jmp        0x7fb3b3be742f
00dff 4d63d2                         movsxd     r10, r10d
00e02 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00e09 c442a8f5db                     bzhi       r11, r11, r10
00e0e c4c1fb92fb                     kmovq      k7, r11
00e13 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00e19 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00e1f e994000000                     jmp        0x7fb3b3be7eb8
00e24 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00e2c 448b5904                       mov        r11d, dword ptr [rcx + 4]
00e30 4c8bb424e0000000               mov        r14, qword ptr [rsp + 0xe0]
00e38 418b7e04                       mov        edi, dword ptr [r14 + 4]
00e3c 448b6c247c                     mov        r13d, dword ptr [rsp + 0x7c]
00e41 4585ed                         test       r13d, r13d
00e44 0f8cf61c0000                   jl         0x7fb3b3be9b40
00e4a 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
00e51 85db                           test       ebx, ebx
00e53 0f8cee1c0000                   jl         0x7fb3b3be9b47
00e59 443b5c2410                     cmp        r11d, dword ptr [rsp + 0x10]
00e5e 0f82e31c0000                   jb         0x7fb3b3be9b47
00e64 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00e6b 4103ea                         add        ebp, r10d
00e6e 3bfd                           cmp        edi, ebp
00e70 0f82d11c0000                   jb         0x7fb3b3be9b47
00e76 4585d2                         test       r10d, r10d
00e79 0f8cc81c0000                   jl         0x7fb3b3be9b47
00e7f 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
00e83 3b5c247c                       cmp        ebx, dword ptr [rsp + 0x7c]
00e87 742f                           je         0x7fb3b3be7eb8
00e89 4b8d740e08                     lea        rsi, [r14 + r9 + 8]
00e8e 4a8d7c0108                     lea        rdi, [rcx + r8 + 8]
00e93 4963d2                         movsxd     rdx, r10d
00e96 4883fa20                       cmp        rdx, 0x20
00e9a 0f865fffffff                   jbe        0x7fb3b3be7dff
00ea0 c5f877                         vzeroupper 
00ea3 49ba409171b3b37f0000           movabs     r10, 0x7fb3b3719140
00ead 41ffd2                         call       r10
00eb0 0f1f840000000000               nop        dword ptr [rax + rax]
00eb8 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00ebd 41896a38                       mov        dword ptr [r10 + 0x38], ebp
00ec1 c5f877                         vzeroupper 
00ec4 4881c400010000                 add        rsp, 0x100
00ecb 5d                             pop        rbp
00ecc 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00ed0 0f878a280000                   ja         0x7fb3b3bea760
00ed6 c3                             ret        
00ed7 4585db                         test       r11d, r11d
00eda 0f8cd4200000                   jl         0x7fb3b3be9fb4
00ee0 418d6ef9                       lea        ebp, [r14 - 7]
00ee4 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
00eeb 443bed                         cmp        r13d, ebp
00eee 0f83d81f0000                   jae        0x7fb3b3be9ecc
00ef4 458bd5                         mov        r10d, r13d
00ef7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00efc 4d63ca                         movsxd     r9, r10d
00eff 4f8b540808                     mov        r10, qword ptr [r8 + r9 + 8]
00f04 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00f09 3bdd                           cmp        ebx, ebp
00f0b 0f8333200000                   jae        0x7fb3b3be9f44
00f11 448bdb                         mov        r11d, ebx
00f14 418d6b08                       lea        ebp, [r11 + 8]
00f18 896c2468                       mov        dword ptr [rsp + 0x68], ebp
00f1c 4963cb                         movsxd     rcx, r11d
00f1f 4d89540808                     mov        qword ptr [r8 + rcx + 8], r10
00f24 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
00f2b 0f8d7d030000                   jge        0x7fb3b3be82ae
00f31 4c2bc9                         sub        r9, rcx
00f34 4963ce                         movsxd     rcx, r14d
00f37 4883c1f9                       add        rcx, -7
00f3b 4863fd                         movsxd     rdi, ebp
00f3e 4e8d140f                       lea        r10, [rdi + r9]
00f42 4c3bd1                         cmp        r10, rcx
00f45 0f83e9200000                   jae        0x7fb3b3bea034
00f4b 4c8bd2                         mov        r10, rdx
00f4e 4c2bd7                         sub        r10, rdi
00f51 4983c207                       add        r10, 7
00f55 4983e2f8                       and        r10, 0xfffffffffffffff8
00f59 458bf2                         mov        r14d, r10d
00f5c 478d741e08                     lea        r14d, [r14 + r11 + 8]
00f61 4d63d6                         movsxd     r10, r14d
00f64 4b8d740af8                     lea        rsi, [r10 + r9 - 8]
00f69 483bf1                         cmp        rsi, rcx
00f6c 0f83c2200000                   jae        0x7fb3b3bea034
00f72 3bac2484000000                 cmp        ebp, dword ptr [rsp + 0x84]
00f79 0f83b5200000                   jae        0x7fb3b3bea034
00f7f 4983c2f8                       add        r10, -8
00f83 4c3bd1                         cmp        r10, rcx
00f86 0f83a8200000                   jae        0x7fb3b3bea034
00f8c 448bb42498000000               mov        r14d, dword ptr [rsp + 0x98]
00f94 4181fef8ffff7f                 cmp        r14d, 0x7ffffff8
00f9b 0f8f0f210000                   jg         0x7fb3b3bea0b0
00fa1 448b742474                     mov        r14d, dword ptr [rsp + 0x74]
00fa6 452bf3                         sub        r14d, r11d
00fa9 44893424                       mov        dword ptr [rsp], r14d
00fad 498bf0                         mov        rsi, r8
00fb0 4c8d52c8                       lea        r10, [rdx - 0x38]
00fb4 4981fa00000080                 cmp        r10, -0x80000000
00fbb 48c7c000000080                 mov        rax, 0xffffffff80000000
00fc2 4c0f4cd0                       cmovl      r10, rax
00fc6 458bf2                         mov        r14d, r10d
00fc9 442beb                         sub        r13d, ebx
00fcc 458bd0                         mov        r10d, r8d
00fcf bbf8ffffff                     mov        ebx, 0xfffffff8
00fd4 412bda                         sub        ebx, r10d
00fd7 412bdb                         sub        ebx, r11d
00fda 4183c310                       add        r11d, 0x10
00fde 83c3f0                         add        ebx, -0x10
00fe1 4963c3                         movsxd     rax, r11d
00fe4 41ba06000000                   mov        r10d, 6
00fea c462a8f5d3                     bzhi       r10, rbx, r10
00fef 4903c2                         add        rax, r10
00ff2 483bc2                         cmp        rax, rdx
00ff5 488bda                         mov        rbx, rdx
00ff8 480f4cd8                       cmovl      rbx, rax
00ffc 4c8bd3                         mov        r10, rbx
00fff 4c2bd7                         sub        r10, rdi
01002 498d42ff                       lea        rax, [r10 - 1]
01006 48c1f83f                       sar        rax, 0x3f
0100a 48c1e83d                       shr        rax, 0x3d
0100e 4e8d5410ff                     lea        r10, [rax + r10 - 1]
01013 4983e2f8                       and        r10, 0xfffffffffffffff8
01017 4c03d7                         add        r10, rdi
0101a 493bfa                         cmp        rdi, r10
0101d 490f4cfa                       cmovl      rdi, r10
01021 448bd7                         mov        r10d, edi
01024 478d6c1508                     lea        r13d, [r13 + r10 + 8]
01029 4183c208                       add        r10d, 8
0102d 4963c5                         movsxd     rax, r13d
01030 4803c6                         add        rax, rsi
01033 4963ea                         movsxd     rbp, r10d
01036 4803ee                         add        rbp, rsi
01039 488d7808                       lea        rdi, [rax + 8]
0103d 4883c048                       add        rax, 0x48
01041 488d7548                       lea        rsi, [rbp + 0x48]
01045 4533d2                         xor        r10d, r10d
01048 483bf7                         cmp        rsi, rdi
0104b 410f96c2                       setbe      r10b
0104f 4883c508                       add        rbp, 8
01053 4533ed                         xor        r13d, r13d
01056 483bc5                         cmp        rax, rbp
01059 410f96c5                       setbe      r13b
0105d 450bd5                         or         r10d, r13d
01060 0f84ba100000                   je         0x7fb3b3be9120
01066 8bfb                           mov        edi, ebx
01068 eb06                           jmp        0x7fb3b3be8070
0106a 90                             nop        
0106b 90                             nop        
0106c 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01070 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01075 448b1c24                       mov        r11d, dword ptr [rsp]
01079 44035c2468                     add        r11d, dword ptr [rsp + 0x68]
0107e 4f8b5c1808                     mov        r11, qword ptr [r8 + r11 + 8]
01083 4f895c1008                     mov        qword ptr [r8 + r10 + 8], r11
01088 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
0108c 83c308                         add        ebx, 8
0108f 3bdf                           cmp        ebx, edi
01091 7cd9                           jl         0x7fb3b3be806c
01093 4881c208feffff                 add        rdx, -0x1f8
0109a 4881fa00000080                 cmp        rdx, -0x80000000
010a1 49c7c200000080                 mov        r10, 0xffffffff80000000
010a8 490f4cd2                       cmovl      rdx, r10
010ac 8bd2                           mov        edx, edx
010ae 3bda                           cmp        ebx, edx
010b0 0f8d6e200000                   jge        0x7fb3b3bea124
010b6 4c63d3                         movsxd     r10, ebx
010b9 4d03d1                         add        r10, r9
010bc 4c3bd1                         cmp        r10, rcx
010bf 0f836f200000                   jae        0x7fb3b3bea134
010c5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
010ca 4181c300020000                 add        r11d, 0x200
010d1 4d63d3                         movsxd     r10, r11d
010d4 4d03d1                         add        r10, r9
010d7 4c3bd1                         cmp        r10, rcx
010da 0f8368200000                   jae        0x7fb3b3bea148
010e0 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
010e7 0f836f200000                   jae        0x7fb3b3bea15c
010ed 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
010f5 0f8375200000                   jae        0x7fb3b3bea170
010fb 498bf0                         mov        rsi, r8
010fe eb03                           jmp        0x7fb3b3be8103
01100 418bdb                         mov        ebx, r11d
01103 448bd3                         mov        r10d, ebx
01106 4d63c2                         movsxd     r8, r10d
01109 448bdb                         mov        r11d, ebx
0110c 448b1424                       mov        r10d, dword ptr [rsp]
01110 4403d3                         add        r10d, ebx
01113 8dbb80000000                   lea        edi, [rbx + 0x80]
01119 033c24                         add        edi, dword ptr [rsp]
0111c 418bc2                         mov        eax, r10d
0111f 62f17e486f840608000000         vmovdqu32  zmm0, zmmword ptr [rsi + rax + 8]
0112a 62b17e487f841e08000000         vmovdqu32  zmmword ptr [rsi + r11 + 8], zmm0
01135 4963c2                         movsxd     rax, r10d
01138 62f17e486f840648000000         vmovdqu32  zmm0, zmmword ptr [rsi + rax + 0x48]
01143 62b17e487f840648000000         vmovdqu32  zmmword ptr [rsi + r8 + 0x48], zmm0
0114e 448bd7                         mov        r10d, edi
01151 62b17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 8]
0115c 62b17e487f840688000000         vmovdqu32  zmmword ptr [rsi + r8 + 0x88], zmm0
01167 4c63d7                         movsxd     r10, edi
0116a 62b17e486f841648000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 0x48]
01175 62b17e487f8406c8000000         vmovdqu32  zmmword ptr [rsi + r8 + 0xc8], zmm0
01180 448d9b00010000                 lea        r11d, [rbx + 0x100]
01187 44031c24                       add        r11d, dword ptr [rsp]
0118b 458bd3                         mov        r10d, r11d
0118e 62b17e486f841e08000000         vmovdqu32  zmm0, zmmword ptr [rsi + r11 + 8]
01199 62b17e487f840608010000         vmovdqu32  zmmword ptr [rsi + r8 + 0x108], zmm0
011a4 4d63d2                         movsxd     r10, r10d
011a7 62b17e486f841648000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 0x48]
011b2 62b17e487f840648010000         vmovdqu32  zmmword ptr [rsi + r8 + 0x148], zmm0
011bd 62f17e486f840688010000         vmovdqu32  zmm0, zmmword ptr [rsi + rax + 0x188]
011c8 62b17e487f840688010000         vmovdqu32  zmmword ptr [rsi + r8 + 0x188], zmm0
011d3 62f17e486f8406c8010000         vmovdqu32  zmm0, zmmword ptr [rsi + rax + 0x1c8]
011de 62b17e487f8406c8010000         vmovdqu32  zmmword ptr [rsi + r8 + 0x1c8], zmm0
011e9 448d9b00020000                 lea        r11d, [rbx + 0x200]
011f0 443bda                         cmp        r11d, edx
011f3 0f8c07ffffff                   jl         0x7fb3b3be8100
011f9 453bde                         cmp        r11d, r14d
011fc 7d55                           jge        0x7fb3b3be8253
011fe 81c338020000                   add        ebx, 0x238
01204 4c63d3                         movsxd     r10, ebx
01207 4d03d1                         add        r10, r9
0120a 4c3bd1                         cmp        r10, rcx
0120d 0f83711f0000                   jae        0x7fb3b3bea184
01213 3b9c2484000000                 cmp        ebx, dword ptr [rsp + 0x84]
0121a 0f838c1f0000                   jae        0x7fb3b3bea1ac
01220 458bc3                         mov        r8d, r11d
01223 448b1424                       mov        r10d, dword ptr [rsp]
01227 4503d3                         add        r10d, r11d
0122a 62b17e486f841608000000         vmovdqu32  zmm0, zmmword ptr [rsi + r10 + 8]
01235 62b17e487f840608000000         vmovdqu32  zmmword ptr [rsi + r8 + 8], zmm0
01240 4183c340                       add        r11d, 0x40
01244 453bde                         cmp        r11d, r14d
01247 7cd7                           jl         0x7fb3b3be8220
01249 4889b424e0000000               mov        qword ptr [rsp + 0xe0], rsi
01251 eb08                           jmp        0x7fb3b3be825b
01253 4889b424e0000000               mov        qword ptr [rsp + 0xe0], rsi
0125b 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
01263 7d49                           jge        0x7fb3b3be82ae
01265 4d63d3                         movsxd     r10, r11d
01268 4d03d1                         add        r10, r9
0126b 4c3bd1                         cmp        r10, rcx
0126e 0f83241f0000                   jae        0x7fb3b3bea198
01274 443b9c2484000000               cmp        r11d, dword ptr [rsp + 0x84]
0127c 0f833e1f0000                   jae        0x7fb3b3bea1c0
01282 90                             nop        
01283 90                             nop        
01284 458bd3                         mov        r10d, r11d
01287 448b0424                       mov        r8d, dword ptr [rsp]
0128b 4503c3                         add        r8d, r11d
0128e 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
01296 4e8b440308                     mov        r8, qword ptr [rbx + r8 + 8]
0129b 4e89441308                     mov        qword ptr [rbx + r10 + 8], r8
012a0 4183c308                       add        r11d, 8
012a4 443b9c2498000000               cmp        r11d, dword ptr [rsp + 0x98]
012ac 7cd6                           jl         0x7fb3b3be8284
012ae 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
012b6 e95cf4ffff                     jmp        0x7fb3b3be7717
012bb 4585d2                         test       r10d, r10d
012be 0f8c00200000                   jl         0x7fb3b3bea2c4
012c4 458d56f1                       lea        r10d, [r14 - 0xf]
012c8 4489542478                     mov        dword ptr [rsp + 0x78], r10d
012cd 453bea                         cmp        r13d, r10d
012d0 0f83fe1e0000                   jae        0x7fb3b3bea1d4
012d6 4963cd                         movsxd     rcx, r13d
012d9 c4c17a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + rcx + 8]
012e0 413bda                         cmp        ebx, r10d
012e3 0f835f1f0000                   jae        0x7fb3b3bea248
012e9 8d6b10                         lea        ebp, [rbx + 0x10]
012ec 4c63d3                         movsxd     r10, ebx
012ef c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
012f6 3bac2498000000                 cmp        ebp, dword ptr [rsp + 0x98]
012fd 0f8d88020000                   jge        0x7fb3b3be858b
01303 492bca                         sub        rcx, r10
01306 4d63de                         movsxd     r11, r14d
01309 4983c3f1                       add        r11, -0xf
0130d 4c63cd                         movsxd     r9, ebp
01310 4d8d1409                       lea        r10, [r9 + rcx]
01314 4d3bd3                         cmp        r10, r11
01317 0f831f200000                   jae        0x7fb3b3bea33c
0131d 4c8bd2                         mov        r10, rdx
01320 4d2bd1                         sub        r10, r9
01323 4983c20f                       add        r10, 0xf
01327 4983e2f0                       and        r10, 0xfffffffffffffff0
0132b 458bd2                         mov        r10d, r10d
0132e 458d4c1a10                     lea        r9d, [r10 + rbx + 0x10]
01333 4d63d1                         movsxd     r10, r9d
01336 4d8d4c0af0                     lea        r9, [r10 + rcx - 0x10]
0133b 4d3bcb                         cmp        r9, r11
0133e 0f83f81f0000                   jae        0x7fb3b3bea33c
01344 3b6c2478                       cmp        ebp, dword ptr [rsp + 0x78]
01348 0f83ee1f0000                   jae        0x7fb3b3bea33c
0134e 4983c2f0                       add        r10, -0x10
01352 4d3bd3                         cmp        r10, r11
01355 0f83e11f0000                   jae        0x7fb3b3bea33c
0135b 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01363 4181faf0ffff7f                 cmp        r10d, 0x7ffffff0
0136a 0f8f34200000                   jg         0x7fb3b3bea3a4
01370 442beb                         sub        r13d, ebx
01373 83c320                         add        ebx, 0x20
01376 eb03                           jmp        0x7fb3b3be837b
01378 418bea                         mov        ebp, r10d
0137b 448bd5                         mov        r10d, ebp
0137e 458bcd                         mov        r9d, r13d
01381 4403cd                         add        r9d, ebp
01384 c4817a6f440808                 vmovdqu    xmm0, xmmword ptr [r8 + r9 + 8]
0138b c4817a7f441008                 vmovdqu    xmmword ptr [r8 + r10 + 8], xmm0
01392 448d5510                       lea        r10d, [rbp + 0x10]
01396 443bd3                         cmp        r10d, ebx
01399 7cdd                           jl         0x7fb3b3be8378
0139b 4881c210ffffff                 add        rdx, -0xf0
013a2 4881fa00000080                 cmp        rdx, -0x80000000
013a9 49c7c100000080                 mov        r9, 0xffffffff80000000
013b0 490f4cd1                       cmovl      rdx, r9
013b4 448bca                         mov        r9d, edx
013b7 453bd1                         cmp        r10d, r9d
013ba 0f8d4c200000                   jge        0x7fb3b3bea40c
013c0 4963da                         movsxd     rbx, r10d
013c3 4803d9                         add        rbx, rcx
013c6 493bdb                         cmp        rbx, r11
013c9 0f834a200000                   jae        0x7fb3b3bea419
013cf 81c500010000                   add        ebp, 0x100
013d5 4863dd                         movsxd     rbx, ebp
013d8 4803d9                         add        rbx, rcx
013db 493bdb                         cmp        rbx, r11
013de 0f8349200000                   jae        0x7fb3b3bea42d
013e4 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
013e9 0f8352200000                   jae        0x7fb3b3bea441
013ef 3b6c2478                       cmp        ebp, dword ptr [rsp + 0x78]
013f3 0f835c200000                   jae        0x7fb3b3bea455
013f9 4d8bf0                         mov        r14, r8
013fc 90                             nop        
013fd 90                             nop        
013fe 90                             nop        
013ff 90                             nop        
01400 418bda                         mov        ebx, r10d
01403 4863d3                         movsxd     rdx, ebx
01406 458bc2                         mov        r8d, r10d
01409 438d3c2a                       lea        edi, [r10 + r13]
0140d 8bdf                           mov        ebx, edi
0140f c4c17a6f443e08                 vmovdqu    xmm0, xmmword ptr [r14 + rdi + 8]
01416 c4817a7f440608                 vmovdqu    xmmword ptr [r14 + r8 + 8], xmm0
0141d 4c63c3                         movsxd     r8, ebx
01420 c4817a6f440618                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x18]
01427 c4c17a7f441618                 vmovdqu    xmmword ptr [r14 + rdx + 0x18], xmm0
0142e c4817a6f440628                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x28]
01435 c4c17a7f441628                 vmovdqu    xmmword ptr [r14 + rdx + 0x28], xmm0
0143c c4817a6f440638                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x38]
01443 c4c17a7f441638                 vmovdqu    xmmword ptr [r14 + rdx + 0x38], xmm0
0144a c4817a6f440648                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x48]
01451 c4c17a7f441648                 vmovdqu    xmmword ptr [r14 + rdx + 0x48], xmm0
01458 c4817a6f440658                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x58]
0145f c4c17a7f441658                 vmovdqu    xmmword ptr [r14 + rdx + 0x58], xmm0
01466 c4817a6f440668                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x68]
0146d c4c17a7f441668                 vmovdqu    xmmword ptr [r14 + rdx + 0x68], xmm0
01474 c4817a6f440678                 vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x78]
0147b c4c17a7f441678                 vmovdqu    xmmword ptr [r14 + rdx + 0x78], xmm0
01482 c4817a6f840688000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x88]
0148c c4c17a7f841688000000           vmovdqu    xmmword ptr [r14 + rdx + 0x88], xmm0
01496 c4817a6f840698000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0x98]
014a0 c4c17a7f841698000000           vmovdqu    xmmword ptr [r14 + rdx + 0x98], xmm0
014aa c4817a6f8406a8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xa8]
014b4 c4c17a7f8416a8000000           vmovdqu    xmmword ptr [r14 + rdx + 0xa8], xmm0
014be c4817a6f8406b8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xb8]
014c8 c4c17a7f8416b8000000           vmovdqu    xmmword ptr [r14 + rdx + 0xb8], xmm0
014d2 c4817a6f8406c8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xc8]
014dc c4c17a7f8416c8000000           vmovdqu    xmmword ptr [r14 + rdx + 0xc8], xmm0
014e6 c4817a6f8406d8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xd8]
014f0 c4c17a7f8416d8000000           vmovdqu    xmmword ptr [r14 + rdx + 0xd8], xmm0
014fa c4817a6f8406e8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xe8]
01504 c4c17a7f8416e8000000           vmovdqu    xmmword ptr [r14 + rdx + 0xe8], xmm0
0150e c4817a6f8406f8000000           vmovdqu    xmm0, xmmword ptr [r14 + r8 + 0xf8]
01518 c4c17a7f8416f8000000           vmovdqu    xmmword ptr [r14 + rdx + 0xf8], xmm0
01522 4181c200010000                 add        r10d, 0x100
01529 453bd1                         cmp        r10d, r9d
0152c 0f8ccefeffff                   jl         0x7fb3b3be8400
01532 4c89b424e0000000               mov        qword ptr [rsp + 0xe0], r14
0153a 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01542 7d47                           jge        0x7fb3b3be858b
01544 4d63c2                         movsxd     r8, r10d
01547 4c03c1                         add        r8, rcx
0154a 4d3bc3                         cmp        r8, r11
0154d 0f83161f0000                   jae        0x7fb3b3bea469
01553 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
01558 0f831f1f0000                   jae        0x7fb3b3bea47d
0155e 90                             nop        
0155f 90                             nop        
01560 458bc2                         mov        r8d, r10d
01563 478d1c2a                       lea        r11d, [r10 + r13]
01567 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
0156f c4a17a6f441b08                 vmovdqu    xmm0, xmmword ptr [rbx + r11 + 8]
01576 c4a17a7f440308                 vmovdqu    xmmword ptr [rbx + r8 + 8], xmm0
0157d 4183c210                       add        r10d, 0x10
01581 443b942498000000               cmp        r10d, dword ptr [rsp + 0x98]
01589 7cd5                           jl         0x7fb3b3be8560
0158b 448bac2498000000               mov        r13d, dword ptr [rsp + 0x98]
01593 e97ff1ffff                     jmp        0x7fb3b3be7717
01598 bee4ffffff                     mov        esi, 0xffffffe4
0159d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
015a2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015a7 4489542408                     mov        dword ptr [rsp + 8], r10d
015ac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015b1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015b6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015bb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015c0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
015c5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
015ca 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
015cf 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
015d4 c5f877                         vzeroupper 
015d7 e88454aeff                     call       0x7fb3b36cda60
015dc 0f1f8400d4160003               nop        dword ptr [rax + rax + 0x30016d4]
015e4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
015ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
015f2 e829e66418                     call       0x7fb3cc236c20
015f7 f4                             hlt        
015f8 bee4ffffff                     mov        esi, 0xffffffe4
015fd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01602 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01607 4489442408                     mov        dword ptr [rsp + 8], r8d
0160c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01611 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01616 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0161b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01620 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01625 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0162a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0162f 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01634 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01639 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
0163e 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01642 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01647 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0164c 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
01651 90                             nop        
01652 90                             nop        
01653 90                             nop        
01654 c5f877                         vzeroupper 
01657 e80454aeff                     call       0x7fb3b36cda60
0165c 0f1f840054170004               nop        dword ptr [rax + rax + 0x4001754]
01664 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0166e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01672 e8a9e56418                     call       0x7fb3cc236c20
01677 f4                             hlt        
01678 bee4ffffff                     mov        esi, 0xffffffe4
0167d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01682 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01687 4489442408                     mov        dword ptr [rsp + 8], r8d
0168c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01691 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01696 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0169b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016a0 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
016a5 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
016aa 4489442438                     mov        dword ptr [rsp + 0x38], r8d
016af 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016b4 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016b9 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
016be 4489442460                     mov        dword ptr [rsp + 0x60], r8d
016c3 895c2464                       mov        dword ptr [rsp + 0x64], ebx
016c7 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
016cf 4489442468                     mov        dword ptr [rsp + 0x68], r8d
016d4 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
016dc 4489442478                     mov        dword ptr [rsp + 0x78], r8d
016e1 448954247c                     mov        dword ptr [rsp + 0x7c], r10d
016e6 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
016ef 90                             nop        
016f0 c5f877                         vzeroupper 
016f3 e86853aeff                     call       0x7fb3b36cda60
016f8 0f1f8400f0170005               nop        dword ptr [rax + rax + 0x50017f0]
01700 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0170a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170e e80de56418                     call       0x7fb3cc236c20
01713 f4                             hlt        
01714 beccffffff                     mov        esi, 0xffffffcc
01719 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0171e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01723 4489542408                     mov        dword ptr [rsp + 8], r10d
01728 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0172d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01732 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01737 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0173c 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01741 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01746 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0174b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01750 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01755 4489442460                     mov        dword ptr [rsp + 0x60], r8d
0175a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0175e 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01763 4489442478                     mov        dword ptr [rsp + 0x78], r8d
01768 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0176d 90                             nop        
0176e 90                             nop        
0176f 90                             nop        
01770 c5f877                         vzeroupper 
01773 e8e852aeff                     call       0x7fb3b36cda60
01778 0f1f840070180006               nop        dword ptr [rax + rax + 0x6001870]
01780 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0178a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0178e e88de46418                     call       0x7fb3cc236c20
01793 f4                             hlt        
01794 beccffffff                     mov        esi, 0xffffffcc
01799 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0179e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017a3 4489542408                     mov        dword ptr [rsp + 8], r10d
017a8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017ad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017b2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
017b7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017bc 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
017c1 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
017c6 4489442438                     mov        dword ptr [rsp + 0x38], r8d
017cb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
017d0 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
017d5 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
017da 4489442460                     mov        dword ptr [rsp + 0x60], r8d
017df 895c2464                       mov        dword ptr [rsp + 0x64], ebx
017e3 448b842480000000               mov        r8d, dword ptr [rsp + 0x80]
017eb 4489442468                     mov        dword ptr [rsp + 0x68], r8d
017f0 448b842488000000               mov        r8d, dword ptr [rsp + 0x88]
017f8 4489442478                     mov        dword ptr [rsp + 0x78], r8d
017fd 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01802 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
0180b 90                             nop        
0180c c5f877                         vzeroupper 
0180f e84c52aeff                     call       0x7fb3b36cda60
01814 0f1f84000c190007               nop        dword ptr [rax + rax + 0x700190c]
0181c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01826 4883e4f0                       and        rsp, 0xfffffffffffffff0
0182a e8f1e36418                     call       0x7fb3cc236c20
0182f f4                             hlt        
01830 bee4ffffff                     mov        esi, 0xffffffe4
01835 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0183a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0183f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01844 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01849 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0184e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01853 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01858 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
0185d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01862 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01867 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0186c 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01871 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01876 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0187b 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01880 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01884 c5f877                         vzeroupper 
01887 e8d451aeff                     call       0x7fb3b36cda60
0188c 0f1f840084190008               nop        dword ptr [rax + rax + 0x8001984]
01894 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0189e 4883e4f0                       and        rsp, 0xfffffffffffffff0
018a2 e879e36418                     call       0x7fb3cc236c20
018a7 f4                             hlt        
018a8 bee4ffffff                     mov        esi, 0xffffffe4
018ad 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018b2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018b7 44895c2408                     mov        dword ptr [rsp + 8], r11d
018bc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018c1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018c6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018cb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018d0 895c2430                       mov        dword ptr [rsp + 0x30], ebx
018d4 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
018d9 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
018de 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
018e3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
018e8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
018ed 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
018f2 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
018f7 4489742474                     mov        dword ptr [rsp + 0x74], r14d
018fc c5f877                         vzeroupper 
018ff e85c51aeff                     call       0x7fb3b36cda60
01904 0f1f8400fc190009               nop        dword ptr [rax + rax + 0x90019fc]
0190c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01916 4883e4f0                       and        rsp, 0xfffffffffffffff0
0191a e801e36418                     call       0x7fb3cc236c20
0191f f4                             hlt        
01920 bee4ffffff                     mov        esi, 0xffffffe4
01925 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0192a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0192f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01934 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01939 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0193e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01943 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01948 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
0194d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01952 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01957 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0195c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01961 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01966 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0196e 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01973 895c2470                       mov        dword ptr [rsp + 0x70], ebx
01977 4489742474                     mov        dword ptr [rsp + 0x74], r14d
0197c c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01985 90                             nop        
01986 90                             nop        
01987 90                             nop        
01988 c5f877                         vzeroupper 
0198b e8d050aeff                     call       0x7fb3b36cda60
01990 0f1f8400881a000a               nop        dword ptr [rax + rax + 0xa001a88]
01998 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
019a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019a6 e875e26418                     call       0x7fb3cc236c20
019ab f4                             hlt        
019ac beccffffff                     mov        esi, 0xffffffcc
019b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019b6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019bb 44895c2408                     mov        dword ptr [rsp + 8], r11d
019c0 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
019c5 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
019ca 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
019cf 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
019d4 895c2430                       mov        dword ptr [rsp + 0x30], ebx
019d8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
019dd 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019e2 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
019e7 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
019ec 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
019f1 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
019f6 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
019fb 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01a00 c5f877                         vzeroupper 
01a03 e85850aeff                     call       0x7fb3b36cda60
01a08 0f1f8400001b000b               nop        dword ptr [rax + rax + 0xb001b00]
01a10 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01a1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a1e e8fde16418                     call       0x7fb3cc236c20
01a23 f4                             hlt        
01a24 be45ffffff                     mov        esi, 0xffffff45
01a29 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a2e 4c89542408                     mov        qword ptr [rsp + 8], r10
01a33 90                             nop        
01a34 c5f877                         vzeroupper 
01a37 e82450aeff                     call       0x7fb3b36cda60
01a3c 0f1f8400341b000c               nop        dword ptr [rax + rax + 0xc001b34]
01a44 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01a4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a52 e8c9e16418                     call       0x7fb3cc236c20
01a57 f4                             hlt        
01a58 be45ffffff                     mov        esi, 0xffffff45
01a5d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a62 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a67 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a6c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a71 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a76 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01a7b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a80 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01a85 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a8a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a8f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01a94 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01a98 897c246c                       mov        dword ptr [rsp + 0x6c], edi
01a9c c5f877                         vzeroupper 
01a9f e8bc4faeff                     call       0x7fb3b36cda60
01aa4 0f1f84009c1b000d               nop        dword ptr [rax + rax + 0xd001b9c]
01aac 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01ab6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aba e861e16418                     call       0x7fb3cc236c20
01abf f4                             hlt        
01ac0 4d3bda                         cmp        r11, r10
01ac3 bdffffffff                     mov        ebp, 0xffffffff
01ac8 7c08                           jl         0x7fb3b3be8ad2
01aca 400f95c5                       setne      bpl
01ace 400fb6ed                       movzx      ebp, bpl
01ad2 be45ffffff                     mov        esi, 0xffffff45
01ad7 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01adc 4c891c24                       mov        qword ptr [rsp], r11
01ae0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ae5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01aea 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01aef 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01af4 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01af9 4489442444                     mov        dword ptr [rsp + 0x44], r8d
01afe 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01b03 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
01b08 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01b0c 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01b11 90                             nop        
01b12 90                             nop        
01b13 90                             nop        
01b14 c5f877                         vzeroupper 
01b17 e8444faeff                     call       0x7fb3b36cda60
01b1c 0f1f8400141c000e               nop        dword ptr [rax + rax + 0xe001c14]
01b24 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01b2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b32 e8e9e06418                     call       0x7fb3cc236c20
01b37 f4                             hlt        
01b38 be45ffffff                     mov        esi, 0xffffff45
01b3d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b42 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01b47 4489442408                     mov        dword ptr [rsp + 8], r8d
01b4c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b51 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b56 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01b5b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01b60 448b442440                     mov        r8d, dword ptr [rsp + 0x40]
01b65 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01b6a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01b6f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01b74 448b8424a4000000               mov        r8d, dword ptr [rsp + 0xa4]
01b7c 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01b81 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01b86 4489442460                     mov        dword ptr [rsp + 0x60], r8d
01b8b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01b8f 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
01b94 c5f877                         vzeroupper 
01b97 e8c44eaeff                     call       0x7fb3b36cda60
01b9c 0f1f8400941c000f               nop        dword ptr [rax + rax + 0xf001c94]
01ba4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01bae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bb2 e869e06418                     call       0x7fb3cc236c20
01bb7 f4                             hlt        
01bb8 be45ffffff                     mov        esi, 0xffffff45
01bbd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01bc2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bc7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01bcc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bd1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bd6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bdb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01be0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01be5 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01bea 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bef 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01bf4 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01bfc 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01c01 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01c06 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01c0b 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01c0f 90                             nop        
01c10 c5f877                         vzeroupper 
01c13 e8484eaeff                     call       0x7fb3b36cda60
01c18 0f1f8400101d0010               nop        dword ptr [rax + rax + 0x10001d10]
01c20 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01c2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2e e8eddf6418                     call       0x7fb3cc236c20
01c33 f4                             hlt        
01c34 4c8b8424b0000000               mov        r8, qword ptr [rsp + 0xb0]
01c3c 4d3bd8                         cmp        r11, r8
01c3f bdffffffff                     mov        ebp, 0xffffffff
01c44 7c08                           jl         0x7fb3b3be8c4e
01c46 400f95c5                       setne      bpl
01c4a 400fb6ed                       movzx      ebp, bpl
01c4e be45ffffff                     mov        esi, 0xffffff45
01c53 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01c58 4c891c24                       mov        qword ptr [rsp], r11
01c5c 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01c61 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01c66 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
01c6b 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01c70 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01c75 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01c7a 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01c7e 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01c83 90                             nop        
01c84 c5f877                         vzeroupper 
01c87 e8d44daeff                     call       0x7fb3b36cda60
01c8c 0f1f8400841d0011               nop        dword ptr [rax + rax + 0x11001d84]
01c94 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01c9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ca2 e879df6418                     call       0x7fb3cc236c20
01ca7 f4                             hlt        
01ca8 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
01cb0 4d3bd8                         cmp        r11, r8
01cb3 bdffffffff                     mov        ebp, 0xffffffff
01cb8 7c08                           jl         0x7fb3b3be8cc2
01cba 400f95c5                       setne      bpl
01cbe 400fb6ed                       movzx      ebp, bpl
01cc2 be45ffffff                     mov        esi, 0xffffff45
01cc7 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
01ccc 4c891c24                       mov        qword ptr [rsp], r11
01cd0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cd5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01cda 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
01cdf 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01ce4 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01ce9 4489442464                     mov        dword ptr [rsp + 0x64], r8d
01cee 895c2468                       mov        dword ptr [rsp + 0x68], ebx
01cf2 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01cf7 90                             nop        
01cf8 c5f877                         vzeroupper 
01cfb e8604daeff                     call       0x7fb3b36cda60
01d00 0f1f8400f81d0012               nop        dword ptr [rax + rax + 0x12001df8]
01d08 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01d12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d16 e805df6418                     call       0x7fb3cc236c20
01d1b f4                             hlt        
01d1c bee4ffffff                     mov        esi, 0xffffffe4
01d21 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d26 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d2b 44895c2408                     mov        dword ptr [rsp + 8], r11d
01d30 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d35 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d3a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01d3f 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d44 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01d49 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d4e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01d53 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01d58 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01d5d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01d62 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01d6a 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01d6f 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01d73 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01d77 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01d7f 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01d87 90                             nop        
01d88 c5f877                         vzeroupper 
01d8b e8d04caeff                     call       0x7fb3b36cda60
01d90 0f1f8400881e0013               nop        dword ptr [rax + rax + 0x13001e88]
01d98 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01da2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01da6 e875de6418                     call       0x7fb3cc236c20
01dab f4                             hlt        
01dac bee4ffffff                     mov        esi, 0xffffffe4
01db1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01db6 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01dba 894c2408                       mov        dword ptr [rsp + 8], ecx
01dbe 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01dc3 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01dc8 8b4c2428                       mov        ecx, dword ptr [rsp + 0x28]
01dcc 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01dd0 8b4c2440                       mov        ecx, dword ptr [rsp + 0x40]
01dd4 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01dd8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ddd 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01de2 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
01de6 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01dea 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
01df2 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
01df7 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01dfb 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01e00 4c89542478                     mov        qword ptr [rsp + 0x78], r10
01e05 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01e09 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
01e11 90                             nop        
01e12 90                             nop        
01e13 90                             nop        
01e14 c5f877                         vzeroupper 
01e17 e8444caeff                     call       0x7fb3b36cda60
01e1c 0f1f8400141f0014               nop        dword ptr [rax + rax + 0x14001f14]
01e24 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01e2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e32 e8e9dd6418                     call       0x7fb3cc236c20
01e37 f4                             hlt        
01e38 beccffffff                     mov        esi, 0xffffffcc
01e3d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e42 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e47 4489542408                     mov        dword ptr [rsp + 8], r10d
01e4c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e51 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e56 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e5b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e60 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01e65 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01e6a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01e6f 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01e74 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01e79 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01e7e 448b8c2480000000               mov        r9d, dword ptr [rsp + 0x80]
01e86 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01e8b 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
01e8f 895c2474                       mov        dword ptr [rsp + 0x74], ebx
01e93 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
01e9b 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
01ea3 90                             nop        
01ea4 c5f877                         vzeroupper 
01ea7 e8b44baeff                     call       0x7fb3b36cda60
01eac 0f1f8400a41f0015               nop        dword ptr [rax + rax + 0x15001fa4]
01eb4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01ebe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ec2 e859dd6418                     call       0x7fb3cc236c20
01ec7 f4                             hlt        
01ec8 4183c508                       add        r13d, 8
01ecc be6effffff                     mov        esi, 0xffffff6e
01ed1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01ed6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01edb 4489542408                     mov        dword ptr [rsp + 8], r10d
01ee0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ee5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01eea 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01eef 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ef4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ef9 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
01efe 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01f03 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01f08 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01f0d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01f12 4489542460                     mov        dword ptr [rsp + 0x60], r10d
01f17 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
01f1f 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01f24 897c2474                       mov        dword ptr [rsp + 0x74], edi
01f28 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01f2d 90                             nop        
01f2e 90                             nop        
01f2f 90                             nop        
01f30 c5f877                         vzeroupper 
01f33 e8284baeff                     call       0x7fb3b36cda60
01f38 0f1f840030200016               nop        dword ptr [rax + rax + 0x16002030]
01f40 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01f4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f4e e8cddc6418                     call       0x7fb3cc236c20
01f53 f4                             hlt        
01f54 4183c508                       add        r13d, 8
01f58 be66ffffff                     mov        esi, 0xffffff66
01f5d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01f62 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01f67 44894c2408                     mov        dword ptr [rsp + 8], r9d
01f6c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f71 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f76 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f7b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f80 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01f85 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
01f8a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01f8f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01f94 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01f99 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01f9e 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
01fa3 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
01fa8 897c2474                       mov        dword ptr [rsp + 0x74], edi
01fac 4489742478                     mov        dword ptr [rsp + 0x78], r14d
01fb1 90                             nop        
01fb2 90                             nop        
01fb3 90                             nop        
01fb4 c5f877                         vzeroupper 
01fb7 e8a44aaeff                     call       0x7fb3b36cda60
01fbc 0f1f8400b4200017               nop        dword ptr [rax + rax + 0x170020b4]
01fc4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
01fce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fd2 e849dc6418                     call       0x7fb3cc236c20
01fd7 f4                             hlt        
01fd8 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
01fe2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fe6 e835dc6418                     call       0x7fb3cc236c20
01feb f4                             hlt        
01fec 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
01ff6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ffa e821dc6418                     call       0x7fb3cc236c20
01fff f4                             hlt        
02000 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0200a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0200e e80ddc6418                     call       0x7fb3cc236c20
02013 f4                             hlt        
02014 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0201e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02022 e8f9db6418                     call       0x7fb3cc236c20
02027 f4                             hlt        
02028 4533d2                         xor        r10d, r10d
0202b 4c89542408                     mov        qword ptr [rsp + 8], r10
02030 e907e1ffff                     jmp        0x7fb3b3be713c
02035 4533d2                         xor        r10d, r10d
02038 4c899424c8000000               mov        qword ptr [rsp + 0xc8], r10
02040 e924e1ffff                     jmp        0x7fb3b3be7169
02045 4533d2                         xor        r10d, r10d
02048 4c899424d0000000               mov        qword ptr [rsp + 0xd0], r10
02050 e943e1ffff                     jmp        0x7fb3b3be7198
02055 4533d2                         xor        r10d, r10d
02058 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0205d e960e1ffff                     jmp        0x7fb3b3be71c2
02062 4533d2                         xor        r10d, r10d
02065 4c899424d8000000               mov        qword ptr [rsp + 0xd8], r10
0206d e979e1ffff                     jmp        0x7fb3b3be71eb
02072 4533d2                         xor        r10d, r10d
02075 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
0207d e98fe1ffff                     jmp        0x7fb3b3be7211
02082 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0208c 4883e4f0                       and        rsp, 0xfffffffffffffff0
02090 e88bdb6418                     call       0x7fb3cc236c20
02095 f4                             hlt        
02096 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
020a0 4883e4f0                       and        rsp, 0xfffffffffffffff0
020a4 e877db6418                     call       0x7fb3cc236c20
020a9 f4                             hlt        
020aa beccffffff                     mov        esi, 0xffffffcc
020af 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
020b4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
020b9 4489542408                     mov        dword ptr [rsp + 8], r10d
020be 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
020c3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
020c8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
020cd 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
020d2 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
020d7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
020dc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
020e1 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
020e6 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
020eb 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
020f0 44896c2470                     mov        dword ptr [rsp + 0x70], r13d
020f5 895c2474                       mov        dword ptr [rsp + 0x74], ebx
020f9 90                             nop        
020fa 90                             nop        
020fb 90                             nop        
020fc c5f877                         vzeroupper 
020ff e85c49aeff                     call       0x7fb3b36cda60
02104 0f1f8400fc210018               nop        dword ptr [rax + rax + 0x180021fc]
0210c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02116 4883e4f0                       and        rsp, 0xfffffffffffffff0
0211a e801db6418                     call       0x7fb3cc236c20
0211f f4                             hlt        
02120 488b9c24e0000000               mov        rbx, qword ptr [rsp + 0xe0]
02128 eb06                           jmp        0x7fb3b3be9130
0212a 90                             nop        
0212b 90                             nop        
0212c 897c2468                       mov        dword ptr [rsp + 0x68], edi
02130 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02135 448b0424                       mov        r8d, dword ptr [rsp]
02139 4403442468                     add        r8d, dword ptr [rsp + 0x68]
0213e 4e8b440308                     mov        r8, qword ptr [rbx + r8 + 8]
02143 4e89441308                     mov        qword ptr [rbx + r10 + 8], r8
02148 8b7c2468                       mov        edi, dword ptr [rsp + 0x68]
0214c 83c708                         add        edi, 8
0214f 413bfb                         cmp        edi, r11d
02152 7cd8                           jl         0x7fb3b3be912c
02154 413bfe                         cmp        edi, r14d
02157 0f8d34130000                   jge        0x7fb3b3bea491
0215d 4c63d7                         movsxd     r10, edi
02160 4d03d1                         add        r10, r9
02163 4c3bd1                         cmp        r10, rcx
02166 0f8332130000                   jae        0x7fb3b3bea49e
0216c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
02171 4183c340                       add        r11d, 0x40
02175 458bd3                         mov        r10d, r11d
02178 4d63db                         movsxd     r11, r11d
0217b 4d03d9                         add        r11, r9
0217e 4c3bd9                         cmp        r11, rcx
02181 0f832b130000                   jae        0x7fb3b3bea4b2
02187 3bbc2484000000                 cmp        edi, dword ptr [rsp + 0x84]
0218e 0f8332130000                   jae        0x7fb3b3bea4c6
02194 443b942484000000               cmp        r10d, dword ptr [rsp + 0x84]
0219c 0f8338130000                   jae        0x7fb3b3bea4da
021a2 488bd3                         mov        rdx, rbx
021a5 90                             nop        
021a6 90                             nop        
021a7 90                             nop        
021a8 90                             nop        
021a9 90                             nop        
021aa 90                             nop        
021ab 90                             nop        
021ac 90                             nop        
021ad 90                             nop        
021ae 90                             nop        
021af 90                             nop        
021b0 448bd7                         mov        r10d, edi
021b3 4d63c2                         movsxd     r8, r10d
021b6 448bdf                         mov        r11d, edi
021b9 448b1424                       mov        r10d, dword ptr [rsp]
021bd 4403d7                         add        r10d, edi
021c0 418bda                         mov        ebx, r10d
021c3 4e8b541208                     mov        r10, qword ptr [rdx + r10 + 8]
021c8 4e89541a08                     mov        qword ptr [rdx + r11 + 8], r10
021cd 4c63db                         movsxd     r11, ebx
021d0 4e8b541a10                     mov        r10, qword ptr [rdx + r11 + 0x10]
021d5 4e89540210                     mov        qword ptr [rdx + r8 + 0x10], r10
021da 4e8b541a18                     mov        r10, qword ptr [rdx + r11 + 0x18]
021df 4e89540218                     mov        qword ptr [rdx + r8 + 0x18], r10
021e4 4e8b541a20                     mov        r10, qword ptr [rdx + r11 + 0x20]
021e9 4e89540220                     mov        qword ptr [rdx + r8 + 0x20], r10
021ee 4e8b541a28                     mov        r10, qword ptr [rdx + r11 + 0x28]
021f3 4e89540228                     mov        qword ptr [rdx + r8 + 0x28], r10
021f8 4e8b541a30                     mov        r10, qword ptr [rdx + r11 + 0x30]
021fd 4e89540230                     mov        qword ptr [rdx + r8 + 0x30], r10
02202 4e8b541a38                     mov        r10, qword ptr [rdx + r11 + 0x38]
02207 4e89540238                     mov        qword ptr [rdx + r8 + 0x38], r10
0220c 4e8b541a40                     mov        r10, qword ptr [rdx + r11 + 0x40]
02211 4e89540240                     mov        qword ptr [rdx + r8 + 0x40], r10
02216 83c740                         add        edi, 0x40
02219 413bfe                         cmp        edi, r14d
0221c 7c92                           jl         0x7fb3b3be91b0
0221e 48899424e0000000               mov        qword ptr [rsp + 0xe0], rdx
02226 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
0222d 0f8d7bf0ffff                   jge        0x7fb3b3be82ae
02233 4c63d7                         movsxd     r10, edi
02236 4d03d1                         add        r10, r9
02239 4c3bd1                         cmp        r10, rcx
0223c 0f83ac120000                   jae        0x7fb3b3bea4ee
02242 3bbc2484000000                 cmp        edi, dword ptr [rsp + 0x84]
02249 0f83b3120000                   jae        0x7fb3b3bea502
0224f 90                             nop        
02250 448bd7                         mov        r10d, edi
02253 448b0424                       mov        r8d, dword ptr [rsp]
02257 4403c7                         add        r8d, edi
0225a 4c8b9c24e0000000               mov        r11, qword ptr [rsp + 0xe0]
02262 4f8b440308                     mov        r8, qword ptr [r11 + r8 + 8]
02267 4f89441308                     mov        qword ptr [r11 + r10 + 8], r8
0226c 83c708                         add        edi, 8
0226f 3bbc2498000000                 cmp        edi, dword ptr [rsp + 0x98]
02276 7cd8                           jl         0x7fb3b3be9250
02278 e931f0ffff                     jmp        0x7fb3b3be82ae
0227d bee4ffffff                     mov        esi, 0xffffffe4
02282 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02287 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0228c 44895c2408                     mov        dword ptr [rsp + 8], r11d
02291 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02296 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0229b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
022a0 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
022a5 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
022aa 4489542434                     mov        dword ptr [rsp + 0x34], r10d
022af 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
022b4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
022b9 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
022be 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
022c3 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
022c8 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
022cd 895c2464                       mov        dword ptr [rsp + 0x64], ebx
022d1 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
022d9 4489542468                     mov        dword ptr [rsp + 0x68], r10d
022de 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
022e5 90                             nop        
022e6 90                             nop        
022e7 90                             nop        
022e8 c5f877                         vzeroupper 
022eb e87047aeff                     call       0x7fb3b36cda60
022f0 0f1f8400e8230019               nop        dword ptr [rax + rax + 0x190023e8]
022f8 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02302 4883e4f0                       and        rsp, 0xfffffffffffffff0
02306 e815d96418                     call       0x7fb3cc236c20
0230b f4                             hlt        
0230c bee4ffffff                     mov        esi, 0xffffffe4
02311 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02316 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0231b 44895c2408                     mov        dword ptr [rsp + 8], r11d
02320 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02325 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0232a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0232f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02334 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02339 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0233e 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02343 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02348 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0234d 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02352 895c2464                       mov        dword ptr [rsp + 0x64], ebx
02356 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0235b 90                             nop        
0235c c5f877                         vzeroupper 
0235f e8fc46aeff                     call       0x7fb3b36cda60
02364 0f1f84005c24001a               nop        dword ptr [rax + rax + 0x1a00245c]
0236c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02376 4883e4f0                       and        rsp, 0xfffffffffffffff0
0237a e8a1d86418                     call       0x7fb3cc236c20
0237f f4                             hlt        
02380 bee4ffffff                     mov        esi, 0xffffffe4
02385 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0238a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0238f 4489542408                     mov        dword ptr [rsp + 8], r10d
02394 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02399 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0239e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
023a3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
023a8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
023ad 4489542438                     mov        dword ptr [rsp + 0x38], r10d
023b2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
023b7 4489542460                     mov        dword ptr [rsp + 0x60], r10d
023bc 895c2464                       mov        dword ptr [rsp + 0x64], ebx
023c0 c5f877                         vzeroupper 
023c3 e89846aeff                     call       0x7fb3b36cda60
023c8 0f1f8400c024001b               nop        dword ptr [rax + rax + 0x1b0024c0]
023d0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
023da 4883e4f0                       and        rsp, 0xfffffffffffffff0
023de e83dd86418                     call       0x7fb3cc236c20
023e3 f4                             hlt        
023e4 bee4ffffff                     mov        esi, 0xffffffe4
023e9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
023ee 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
023f3 44895c2408                     mov        dword ptr [rsp + 8], r11d
023f8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
023fd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02402 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02407 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0240c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02411 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02416 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0241b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02420 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02425 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0242a 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
0242f 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
02436 4489ac2484000000               mov        dword ptr [rsp + 0x84], r13d
0243e 90                             nop        
0243f 90                             nop        
02440 c5f877                         vzeroupper 
02443 e81846aeff                     call       0x7fb3b36cda60
02448 0f1f84004025001c               nop        dword ptr [rax + rax + 0x1c002540]
02450 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0245a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0245e e8bdd76418                     call       0x7fb3cc236c20
02463 f4                             hlt        
02464 bee4ffffff                     mov        esi, 0xffffffe4
02469 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0246e 4c891424                       mov        qword ptr [rsp], r10
02472 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02477 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0247c 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02481 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02486 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0248b 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02490 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02495 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
0249a 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
024a1 90                             nop        
024a2 90                             nop        
024a3 90                             nop        
024a4 c5f877                         vzeroupper 
024a7 e8b445aeff                     call       0x7fb3b36cda60
024ac 0f1f8400a425001d               nop        dword ptr [rax + rax + 0x1d0025a4]
024b4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
024be 4883e4f0                       and        rsp, 0xfffffffffffffff0
024c2 e859d76418                     call       0x7fb3cc236c20
024c7 f4                             hlt        
024c8 418d6d01                       lea        ebp, [r13 + 1]
024cc bee4ffffff                     mov        esi, 0xffffffe4
024d1 4c8b542408                     mov        r10, qword ptr [rsp + 8]
024d6 4c891424                       mov        qword ptr [rsp], r10
024da 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
024df 4489542414                     mov        dword ptr [rsp + 0x14], r10d
024e4 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
024e9 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
024ee 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
024f3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
024f8 895c2470                       mov        dword ptr [rsp + 0x70], ebx
024fc 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02501 44894c247c                     mov        dword ptr [rsp + 0x7c], r9d
02506 90                             nop        
02507 90                             nop        
02508 c5f877                         vzeroupper 
0250b e85045aeff                     call       0x7fb3b36cda60
02510 0f1f84000826001e               nop        dword ptr [rax + rax + 0x1e002608]
02518 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02522 4883e4f0                       and        rsp, 0xfffffffffffffff0
02526 e8f5d66418                     call       0x7fb3cc236c20
0252b f4                             hlt        
0252c bee4ffffff                     mov        esi, 0xffffffe4
02531 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02536 4c891424                       mov        qword ptr [rsp], r10
0253a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0253f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02544 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02549 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0254e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02553 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02558 895c2470                       mov        dword ptr [rsp + 0x70], ebx
0255c 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02561 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02569 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0256e 90                             nop        
0256f 90                             nop        
02570 c5f877                         vzeroupper 
02573 e8e844aeff                     call       0x7fb3b36cda60
02578 0f1f84007026001f               nop        dword ptr [rax + rax + 0x1f002670]
02580 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0258a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0258e e88dd66418                     call       0x7fb3cc236c20
02593 f4                             hlt        
02594 bee4ffffff                     mov        esi, 0xffffffe4
02599 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0259e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
025a3 4489542408                     mov        dword ptr [rsp + 8], r10d
025a8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
025ad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
025b2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
025b7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
025bc 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
025c1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
025c6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
025cb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
025d0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
025d5 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
025da 895c2468                       mov        dword ptr [rsp + 0x68], ebx
025de 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
025e3 90                             nop        
025e4 c5f877                         vzeroupper 
025e7 e87444aeff                     call       0x7fb3b36cda60
025ec 0f1f8400e4260020               nop        dword ptr [rax + rax + 0x200026e4]
025f4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
025fe 4883e4f0                       and        rsp, 0xfffffffffffffff0
02602 e819d66418                     call       0x7fb3cc236c20
02607 f4                             hlt        
02608 bee4ffffff                     mov        esi, 0xffffffe4
0260d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02612 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02617 44895c2408                     mov        dword ptr [rsp + 8], r11d
0261c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02621 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02626 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0262b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02630 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02635 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0263a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0263f 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02644 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02649 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0264e 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02652 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
0265a 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0265f 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
02667 90                             nop        
02668 c5f877                         vzeroupper 
0266b e8f043aeff                     call       0x7fb3b36cda60
02670 0f1f840068270021               nop        dword ptr [rax + rax + 0x21002768]
02678 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02682 4883e4f0                       and        rsp, 0xfffffffffffffff0
02686 e895d56418                     call       0x7fb3cc236c20
0268b f4                             hlt        
0268c bee4ffffff                     mov        esi, 0xffffffe4
02691 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02696 4c891424                       mov        qword ptr [rsp], r10
0269a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0269f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
026a4 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
026a9 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
026ae 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
026b3 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
026b8 895c2470                       mov        dword ptr [rsp + 0x70], ebx
026bc 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
026c4 4489542478                     mov        dword ptr [rsp + 0x78], r10d
026c9 90                             nop        
026ca 90                             nop        
026cb 90                             nop        
026cc c5f877                         vzeroupper 
026cf e88c43aeff                     call       0x7fb3b36cda60
026d4 0f1f8400cc270022               nop        dword ptr [rax + rax + 0x220027cc]
026dc 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
026e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
026ea e831d56418                     call       0x7fb3cc236c20
026ef f4                             hlt        
026f0 beccffffff                     mov        esi, 0xffffffcc
026f5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
026fa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
026ff 44895c2408                     mov        dword ptr [rsp + 8], r11d
02704 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02709 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0270e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02713 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02718 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0271d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02722 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02727 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0272c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02731 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02736 895c2468                       mov        dword ptr [rsp + 0x68], ebx
0273a 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02742 4489542470                     mov        dword ptr [rsp + 0x70], r10d
02747 4489ac2488000000               mov        dword ptr [rsp + 0x88], r13d
0274f 90                             nop        
02750 c5f877                         vzeroupper 
02753 e80843aeff                     call       0x7fb3b36cda60
02758 0f1f840050280023               nop        dword ptr [rax + rax + 0x23002850]
02760 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0276a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0276e e8add46418                     call       0x7fb3cc236c20
02773 f4                             hlt        
02774 beccffffff                     mov        esi, 0xffffffcc
02779 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0277e 4c891424                       mov        qword ptr [rsp], r10
02782 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02787 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0278c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02791 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02796 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0279b 4489542464                     mov        dword ptr [rsp + 0x64], r10d
027a0 895c2470                       mov        dword ptr [rsp + 0x70], ebx
027a4 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
027ac 4489542474                     mov        dword ptr [rsp + 0x74], r10d
027b1 90                             nop        
027b2 90                             nop        
027b3 90                             nop        
027b4 c5f877                         vzeroupper 
027b7 e8a442aeff                     call       0x7fb3b36cda60
027bc 0f1f8400b4280024               nop        dword ptr [rax + rax + 0x240028b4]
027c4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
027ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
027d2 e849d46418                     call       0x7fb3cc236c20
027d7 f4                             hlt        
027d8 be6effffff                     mov        esi, 0xffffff6e
027dd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
027e2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
027e7 4489542408                     mov        dword ptr [rsp + 8], r10d
027ec 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
027f1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
027f6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
027fb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02800 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
02805 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0280a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0280f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02814 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
02819 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0281e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02823 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02828 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0282c 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
02831 897c247c                       mov        dword ptr [rsp + 0x7c], edi
02835 90                             nop        
02836 90                             nop        
02837 90                             nop        
02838 c5f877                         vzeroupper 
0283b e82042aeff                     call       0x7fb3b36cda60
02840 0f1f840038290025               nop        dword ptr [rax + rax + 0x25002938]
02848 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02852 4883e4f0                       and        rsp, 0xfffffffffffffff0
02856 e8c5d36418                     call       0x7fb3cc236c20
0285b f4                             hlt        
0285c be45ffffff                     mov        esi, 0xffffff45
02861 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02866 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0286b 44895c2408                     mov        dword ptr [rsp + 8], r11d
02870 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02875 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0287a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0287f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02884 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02889 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0288e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02893 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02898 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0289d 4489542460                     mov        dword ptr [rsp + 0x60], r10d
028a2 895c2464                       mov        dword ptr [rsp + 0x64], ebx
028a6 897c2478                       mov        dword ptr [rsp + 0x78], edi
028aa 90                             nop        
028ab 90                             nop        
028ac c5f877                         vzeroupper 
028af e8ac41aeff                     call       0x7fb3b36cda60
028b4 0f1f8400ac290026               nop        dword ptr [rax + rax + 0x260029ac]
028bc 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
028c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
028ca e851d36418                     call       0x7fb3cc236c20
028cf f4                             hlt        
028d0 be3dffffff                     mov        esi, 0xffffff3d
028d5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
028da 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
028df 44895c2408                     mov        dword ptr [rsp + 8], r11d
028e4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
028e9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
028ee 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
028f3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
028f8 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
028fd 4489542438                     mov        dword ptr [rsp + 0x38], r10d
02902 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
02907 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0290c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02911 4489542460                     mov        dword ptr [rsp + 0x60], r10d
02916 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0291a 897c2478                       mov        dword ptr [rsp + 0x78], edi
0291e 90                             nop        
0291f 90                             nop        
02920 c5f877                         vzeroupper 
02923 e83841aeff                     call       0x7fb3b36cda60
02928 0f1f8400202a0027               nop        dword ptr [rax + rax + 0x27002a20]
02930 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0293a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0293e e8ddd26418                     call       0x7fb3cc236c20
02943 f4                             hlt        
02944 bee4ffffff                     mov        esi, 0xffffffe4
02949 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0294e 4c891424                       mov        qword ptr [rsp], r10
02952 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02957 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0295c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02961 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02966 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0296b 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02970 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02974 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0297c 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02981 4489b42480000000               mov        dword ptr [rsp + 0x80], r14d
02989 90                             nop        
0298a 90                             nop        
0298b 90                             nop        
0298c c5f877                         vzeroupper 
0298f e8cc40aeff                     call       0x7fb3b36cda60
02994 0f1f84008c2a0028               nop        dword ptr [rax + rax + 0x28002a8c]
0299c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
029a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
029aa e871d26418                     call       0x7fb3cc236c20
029af f4                             hlt        
029b0 bee4ffffff                     mov        esi, 0xffffffe4
029b5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
029ba 4c891424                       mov        qword ptr [rsp], r10
029be 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
029c3 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
029c8 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
029cd 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
029d2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
029d7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
029dc 895c2468                       mov        dword ptr [rsp + 0x68], ebx
029e0 4489742478                     mov        dword ptr [rsp + 0x78], r14d
029e5 90                             nop        
029e6 90                             nop        
029e7 90                             nop        
029e8 c5f877                         vzeroupper 
029eb e87040aeff                     call       0x7fb3b36cda60
029f0 0f1f8400e82a0029               nop        dword ptr [rax + rax + 0x29002ae8]
029f8 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02a02 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a06 e815d26418                     call       0x7fb3cc236c20
02a0b f4                             hlt        
02a0c beccffffff                     mov        esi, 0xffffffcc
02a11 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02a16 4c891424                       mov        qword ptr [rsp], r10
02a1a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a1f 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02a24 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02a29 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02a2e 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
02a33 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
02a38 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02a3c 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02a44 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02a49 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
02a51 90                             nop        
02a52 90                             nop        
02a53 90                             nop        
02a54 c5f877                         vzeroupper 
02a57 e80440aeff                     call       0x7fb3b36cda60
02a5c 0f1f8400542b002a               nop        dword ptr [rax + rax + 0x2a002b54]
02a64 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02a6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02a72 e8a9d16418                     call       0x7fb3cc236c20
02a77 f4                             hlt        
02a78 beccffffff                     mov        esi, 0xffffffcc
02a7d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02a82 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02a87 4489542408                     mov        dword ptr [rsp + 8], r10d
02a8c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02a91 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a96 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02a9b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02aa0 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02aa5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02aaa 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
02aaf 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
02ab4 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ab9 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02abe 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
02ac3 44896c2474                     mov        dword ptr [rsp + 0x74], r13d
02ac8 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02acf 90                             nop        
02ad0 c5f877                         vzeroupper 
02ad3 e8883faeff                     call       0x7fb3b36cda60
02ad8 0f1f8400d02b002b               nop        dword ptr [rax + rax + 0x2b002bd0]
02ae0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02aea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02aee e82dd16418                     call       0x7fb3cc236c20
02af3 f4                             hlt        
02af4 be85ffffff                     mov        esi, 0xffffff85
02af9 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02afe 44891c24                       mov        dword ptr [rsp], r11d
02b02 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02b07 4489542404                     mov        dword ptr [rsp + 4], r10d
02b0c 4c896c2408                     mov        qword ptr [rsp + 8], r13
02b11 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02b16 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02b1b 90                             nop        
02b1c c5f877                         vzeroupper 
02b1f e83c3faeff                     call       0x7fb3b36cda60
02b24 0f1f84001c2c002c               nop        dword ptr [rax + rax + 0x2c002c1c]
02b2c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02b36 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b3a e8e1d06418                     call       0x7fb3cc236c20
02b3f f4                             hlt        
02b40 8b9c2488000000                 mov        ebx, dword ptr [rsp + 0x88]
02b47 beccffffff                     mov        esi, 0xffffffcc
02b4c 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02b51 895c2414                       mov        dword ptr [rsp + 0x14], ebx
02b55 4489542420                     mov        dword ptr [rsp + 0x20], r10d
02b5a 90                             nop        
02b5b 90                             nop        
02b5c c5f877                         vzeroupper 
02b5f e8fc3eaeff                     call       0x7fb3b36cda60
02b64 0f1f84005c2c002d               nop        dword ptr [rax + rax + 0x2d002c5c]
02b6c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02b76 4883e4f0                       and        rsp, 0xfffffffffffffff0
02b7a e8a1d06418                     call       0x7fb3cc236c20
02b7f f4                             hlt        
02b80 bee4ffffff                     mov        esi, 0xffffffe4
02b85 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02b8a 4c891424                       mov        qword ptr [rsp], r10
02b8e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02b93 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02b98 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02b9d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02ba2 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ba7 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02bac 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02bb0 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02bb8 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02bbd 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02bc2 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
02bca 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02bcf 90                             nop        
02bd0 c5f877                         vzeroupper 
02bd3 e8883eaeff                     call       0x7fb3b36cda60
02bd8 0f1f8400d02c002e               nop        dword ptr [rax + rax + 0x2e002cd0]
02be0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02bea 4883e4f0                       and        rsp, 0xfffffffffffffff0
02bee e82dd06418                     call       0x7fb3cc236c20
02bf3 f4                             hlt        
02bf4 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02bfd bee4ffffff                     mov        esi, 0xffffffe4
02c02 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02c07 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02c0c 4489542408                     mov        dword ptr [rsp + 8], r10d
02c11 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02c16 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02c1b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02c20 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02c25 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02c2a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02c2f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02c34 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02c39 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02c3e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02c43 895c2460                       mov        dword ptr [rsp + 0x60], ebx
02c47 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02c4f 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02c54 448974246c                     mov        dword ptr [rsp + 0x6c], r14d
02c59 89442474                       mov        dword ptr [rsp + 0x74], eax
02c5d 90                             nop        
02c5e 90                             nop        
02c5f 90                             nop        
02c60 c5f877                         vzeroupper 
02c63 e8f83daeff                     call       0x7fb3b36cda60
02c68 0f1f8400602d002f               nop        dword ptr [rax + rax + 0x2f002d60]
02c70 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02c7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02c7e e89dcf6418                     call       0x7fb3cc236c20
02c83 f4                             hlt        
02c84 beccffffff                     mov        esi, 0xffffffcc
02c89 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02c8e 4c891424                       mov        qword ptr [rsp], r10
02c92 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02c97 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02c9c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02ca1 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02ca6 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02cab 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02cb0 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02cb4 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02cbc 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
02cc1 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02cc6 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02cce 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
02cd3 90                             nop        
02cd4 c5f877                         vzeroupper 
02cd7 e8843daeff                     call       0x7fb3b36cda60
02cdc 0f1f8400d42d0030               nop        dword ptr [rax + rax + 0x30002dd4]
02ce4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02cee 4883e4f0                       and        rsp, 0xfffffffffffffff0
02cf2 e829cf6418                     call       0x7fb3cc236c20
02cf7 f4                             hlt        
02cf8 beccffffff                     mov        esi, 0xffffffcc
02cfd 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02d02 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02d07 4489542408                     mov        dword ptr [rsp + 8], r10d
02d0c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02d11 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02d16 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02d1b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02d20 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02d25 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
02d2a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02d2f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02d34 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02d39 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
02d3e 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
02d46 4489542468                     mov        dword ptr [rsp + 0x68], r10d
02d4b 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
02d50 4489542478                     mov        dword ptr [rsp + 0x78], r10d
02d55 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
02d5d 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
02d62 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
02d69 90                             nop        
02d6a 90                             nop        
02d6b 90                             nop        
02d6c c5f877                         vzeroupper 
02d6f e8ec3caeff                     call       0x7fb3b36cda60
02d74 0f1f84006c2e0031               nop        dword ptr [rax + rax + 0x31002e6c]
02d7c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
02d8a e891ce6418                     call       0x7fb3cc236c20
02d8f f4                             hlt        
02d90 c5fa7f842490000000             vmovdqu    xmmword ptr [rsp + 0x90], xmm0
02d99 beccffffff                     mov        esi, 0xffffffcc
02d9e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02da3 4c891424                       mov        qword ptr [rsp], r10
02da7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02dac 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02db1 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02db6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02dbb 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02dc0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02dc5 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02dc9 448b9c2480000000               mov        r11d, dword ptr [rsp + 0x80]
02dd1 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
02dd6 4489742474                     mov        dword ptr [rsp + 0x74], r14d
02ddb 8944247c                       mov        dword ptr [rsp + 0x7c], eax
02ddf 90                             nop        
02de0 c5f877                         vzeroupper 
02de3 e8783caeff                     call       0x7fb3b36cda60
02de8 0f1f8400e02e0032               nop        dword ptr [rax + rax + 0x32002ee0]
02df0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02dfa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02dfe e81dce6418                     call       0x7fb3cc236c20
02e03 f4                             hlt        
02e04 8be8                           mov        ebp, eax
02e06 83c510                         add        ebp, 0x10
02e09 be6effffff                     mov        esi, 0xffffff6e
02e0e 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02e13 4c891424                       mov        qword ptr [rsp], r10
02e17 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02e1c 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02e21 89442438                       mov        dword ptr [rsp + 0x38], eax
02e25 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02e2a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
02e2f 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02e34 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
02e39 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02e3d 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02e42 90                             nop        
02e43 90                             nop        
02e44 c5f877                         vzeroupper 
02e47 e8143caeff                     call       0x7fb3b36cda60
02e4c 0f1f8400442f0033               nop        dword ptr [rax + rax + 0x33002f44]
02e54 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02e5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e62 e8b9cd6418                     call       0x7fb3cc236c20
02e67 f4                             hlt        
02e68 8be8                           mov        ebp, eax
02e6a 83c510                         add        ebp, 0x10
02e6d be66ffffff                     mov        esi, 0xffffff66
02e72 4c8b542408                     mov        r10, qword ptr [rsp + 8]
02e77 4c891424                       mov        qword ptr [rsp], r10
02e7b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02e80 4489542414                     mov        dword ptr [rsp + 0x14], r10d
02e85 89442438                       mov        dword ptr [rsp + 0x38], eax
02e89 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02e8e 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
02e93 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02e98 4489542464                     mov        dword ptr [rsp + 0x64], r10d
02e9d 895c2468                       mov        dword ptr [rsp + 0x68], ebx
02ea1 4489742478                     mov        dword ptr [rsp + 0x78], r14d
02ea6 90                             nop        
02ea7 90                             nop        
02ea8 c5f877                         vzeroupper 
02eab e8b03baeff                     call       0x7fb3b36cda60
02eb0 0f1f8400a82f0034               nop        dword ptr [rax + rax + 0x34002fa8]
02eb8 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02ec2 4883e4f0                       and        rsp, 0xfffffffffffffff0
02ec6 e855cd6418                     call       0x7fb3cc236c20
02ecb f4                             hlt        
02ecc bee4ffffff                     mov        esi, 0xffffffe4
02ed1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02ed6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02edb 44895c2408                     mov        dword ptr [rsp + 8], r11d
02ee0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02ee5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02eea 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02eef 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02ef4 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02ef9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02efe 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f03 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02f08 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02f0d 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02f12 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02f16 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
02f1e 90                             nop        
02f1f 90                             nop        
02f20 c5f877                         vzeroupper 
02f23 e8383baeff                     call       0x7fb3b36cda60
02f28 0f1f840020300035               nop        dword ptr [rax + rax + 0x35003020]
02f30 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02f3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f3e e8ddcc6418                     call       0x7fb3cc236c20
02f43 f4                             hlt        
02f44 bee4ffffff                     mov        esi, 0xffffffe4
02f49 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02f4e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02f53 4489542408                     mov        dword ptr [rsp + 8], r10d
02f58 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02f5d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02f62 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
02f67 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
02f6c 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
02f71 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
02f76 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
02f7b 4489542440                     mov        dword ptr [rsp + 0x40], r10d
02f80 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
02f85 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
02f8a 895c2470                       mov        dword ptr [rsp + 0x70], ebx
02f8e 90                             nop        
02f8f 90                             nop        
02f90 c5f877                         vzeroupper 
02f93 e8c83aaeff                     call       0x7fb3b36cda60
02f98 0f1f840090300036               nop        dword ptr [rax + rax + 0x36003090]
02fa0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
02faa 4883e4f0                       and        rsp, 0xfffffffffffffff0
02fae e86dcc6418                     call       0x7fb3cc236c20
02fb3 f4                             hlt        
02fb4 beccffffff                     mov        esi, 0xffffffcc
02fb9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02fbe 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
02fc3 4489542408                     mov        dword ptr [rsp + 8], r10d
02fc8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02fcd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02fd2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02fd7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02fdc 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
02fe1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02fe6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
02feb 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
02ff0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
02ff5 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
02ffa 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
02ffe 4489ac2480000000               mov        dword ptr [rsp + 0x80], r13d
03006 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
0300e 90                             nop        
0300f 90                             nop        
03010 c5f877                         vzeroupper 
03013 e8483aaeff                     call       0x7fb3b36cda60
03018 0f1f840010310037               nop        dword ptr [rax + rax + 0x37003110]
03020 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0302a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0302e e8edcb6418                     call       0x7fb3cc236c20
03033 f4                             hlt        
03034 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
03039 458d5a08                       lea        r11d, [r10 + 8]
0303d 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
03042 be6effffff                     mov        esi, 0xffffff6e
03047 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0304c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
03051 4489542408                     mov        dword ptr [rsp + 8], r10d
03056 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0305b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03060 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
03065 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0306a 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0306f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
03074 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03079 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0307e 448b942498000000               mov        r10d, dword ptr [rsp + 0x98]
03086 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0308b 90                             nop        
0308c c5f877                         vzeroupper 
0308f e8cc39aeff                     call       0x7fb3b36cda60
03094 0f1f84008c310038               nop        dword ptr [rax + rax + 0x3800318c]
0309c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
030a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
030aa e871cb6418                     call       0x7fb3cc236c20
030af f4                             hlt        
030b0 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
030b5 458d5a08                       lea        r11d, [r10 + 8]
030b9 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
030be be66ffffff                     mov        esi, 0xffffff66
030c3 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
030c8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
030cd 44895c2408                     mov        dword ptr [rsp + 8], r11d
030d2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
030d7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
030dc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
030e1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
030e6 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
030eb 4489542434                     mov        dword ptr [rsp + 0x34], r10d
030f0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
030f5 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
030fa 4489742464                     mov        dword ptr [rsp + 0x64], r14d
030ff 90                             nop        
03100 c5f877                         vzeroupper 
03103 e85839aeff                     call       0x7fb3b36cda60
03108 0f1f840000320039               nop        dword ptr [rax + rax + 0x39003200]
03110 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0311a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0311e e8fdca6418                     call       0x7fb3cc236c20
03123 f4                             hlt        
03124 448bdb                         mov        r11d, ebx
03127 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
0312f e927e1ffff                     jmp        0x7fb3b3be825b
03134 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0313e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03142 e8d9ca6418                     call       0x7fb3cc236c20
03147 f4                             hlt        
03148 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
03152 4883e4f0                       and        rsp, 0xfffffffffffffff0
03156 e8c5ca6418                     call       0x7fb3cc236c20
0315b f4                             hlt        
0315c 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
03166 4883e4f0                       and        rsp, 0xfffffffffffffff0
0316a e8b1ca6418                     call       0x7fb3cc236c20
0316f f4                             hlt        
03170 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0317a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0317e e89dca6418                     call       0x7fb3cc236c20
03183 f4                             hlt        
03184 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0318e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03192 e889ca6418                     call       0x7fb3cc236c20
03197 f4                             hlt        
03198 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
031a2 4883e4f0                       and        rsp, 0xfffffffffffffff0
031a6 e875ca6418                     call       0x7fb3cc236c20
031ab f4                             hlt        
031ac 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
031b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ba e861ca6418                     call       0x7fb3cc236c20
031bf f4                             hlt        
031c0 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
031ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
031ce e84dca6418                     call       0x7fb3cc236c20
031d3 f4                             hlt        
031d4 bee4ffffff                     mov        esi, 0xffffffe4
031d9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
031de 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
031e3 4489542408                     mov        dword ptr [rsp + 8], r10d
031e8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
031ed 4c89542418                     mov        qword ptr [rsp + 0x18], r10
031f2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
031f7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
031fc 448b542440                     mov        r10d, dword ptr [rsp + 0x40]
03201 4489542434                     mov        dword ptr [rsp + 0x34], r10d
03206 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0320b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
03210 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03215 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
0321a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0321e 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
03223 90                             nop        
03224 c5f877                         vzeroupper 
03227 e83438aeff                     call       0x7fb3b36cda60
0322c 0f1f84002433003a               nop        dword ptr [rax + rax + 0x3a003324]
03234 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0323e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03242 e8d9c96418                     call       0x7fb3cc236c20
03247 f4                             hlt        
03248 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
03251 bee4ffffff                     mov        esi, 0xffffffe4
03256 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0325b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
03260 44895c2408                     mov        dword ptr [rsp + 8], r11d
03265 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0326a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0326f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
03274 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
03279 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0327e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
03283 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
03288 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0328d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
03292 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
03297 44896c2468                     mov        dword ptr [rsp + 0x68], r13d
0329c 895c246c                       mov        dword ptr [rsp + 0x6c], ebx
032a0 c5f877                         vzeroupper 
032a3 e8b837aeff                     call       0x7fb3b36cda60
032a8 0f1f8400a033003b               nop        dword ptr [rax + rax + 0x3b0033a0]
032b0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
032ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
032be e85dc96418                     call       0x7fb3cc236c20
032c3 f4                             hlt        
032c4 beccffffff                     mov        esi, 0xffffffcc
032c9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
032ce 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
032d3 44894c2408                     mov        dword ptr [rsp + 8], r9d
032d8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
032dd 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
032e2 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
032e7 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
032ec 448b4c2440                     mov        r9d, dword ptr [rsp + 0x40]
032f1 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
032f6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
032fb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
03300 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
03305 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
0330a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0330e 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
03313 4489542478                     mov        dword ptr [rsp + 0x78], r10d
03318 c5f877                         vzeroupper 
0331b e84037aeff                     call       0x7fb3b36cda60
03320 0f1f84001834003c               nop        dword ptr [rax + rax + 0x3c003418]
03328 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03332 4883e4f0                       and        rsp, 0xfffffffffffffff0
03336 e8e5c86418                     call       0x7fb3cc236c20
0333b f4                             hlt        
0333c 4183c510                       add        r13d, 0x10
03340 be6effffff                     mov        esi, 0xffffff6e
03345 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0334a 4c891424                       mov        qword ptr [rsp], r10
0334e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
03353 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
03358 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
0335d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
03362 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
03367 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0336c 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
03374 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
03379 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0337e 90                             nop        
0337f 90                             nop        
03380 c5f877                         vzeroupper 
03383 e8d836aeff                     call       0x7fb3b36cda60
03388 0f1f84008034003d               nop        dword ptr [rax + rax + 0x3d003480]
03390 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0339a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0339e e87dc86418                     call       0x7fb3cc236c20
033a3 f4                             hlt        
033a4 4183c510                       add        r13d, 0x10
033a8 be66ffffff                     mov        esi, 0xffffff66
033ad 4c8b542408                     mov        r10, qword ptr [rsp + 8]
033b2 4c891424                       mov        qword ptr [rsp], r10
033b6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
033bb 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
033c0 448b5c2440                     mov        r11d, dword ptr [rsp + 0x40]
033c5 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
033ca 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
033cf 4489542464                     mov        dword ptr [rsp + 0x64], r10d
033d4 448b9c2498000000               mov        r11d, dword ptr [rsp + 0x98]
033dc 44896c246c                     mov        dword ptr [rsp + 0x6c], r13d
033e1 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
033e6 90                             nop        
033e7 90                             nop        
033e8 c5f877                         vzeroupper 
033eb e87036aeff                     call       0x7fb3b36cda60
033f0 0f1f8400e834003e               nop        dword ptr [rax + rax + 0x3e0034e8]
033f8 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03402 4883e4f0                       and        rsp, 0xfffffffffffffff0
03406 e815c86418                     call       0x7fb3cc236c20
0340b f4                             hlt        
0340c 4c898424e0000000               mov        qword ptr [rsp + 0xe0], r8
03414 e921e1ffff                     jmp        0x7fb3b3be853a
03419 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
03423 4883e4f0                       and        rsp, 0xfffffffffffffff0
03427 e8f4c76418                     call       0x7fb3cc236c20
0342c f4                             hlt        
0342d 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
03437 4883e4f0                       and        rsp, 0xfffffffffffffff0
0343b e8e0c76418                     call       0x7fb3cc236c20
03440 f4                             hlt        
03441 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0344b 4883e4f0                       and        rsp, 0xfffffffffffffff0
0344f e8ccc76418                     call       0x7fb3cc236c20
03454 f4                             hlt        
03455 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0345f 4883e4f0                       and        rsp, 0xfffffffffffffff0
03463 e8b8c76418                     call       0x7fb3cc236c20
03468 f4                             hlt        
03469 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
03473 4883e4f0                       and        rsp, 0xfffffffffffffff0
03477 e8a4c76418                     call       0x7fb3cc236c20
0347c f4                             hlt        
0347d 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
03487 4883e4f0                       and        rsp, 0xfffffffffffffff0
0348b e890c76418                     call       0x7fb3cc236c20
03490 f4                             hlt        
03491 48899c24e0000000               mov        qword ptr [rsp + 0xe0], rbx
03499 e988edffff                     jmp        0x7fb3b3be9226
0349e 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
034a8 4883e4f0                       and        rsp, 0xfffffffffffffff0
034ac e86fc76418                     call       0x7fb3cc236c20
034b1 f4                             hlt        
034b2 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
034bc 4883e4f0                       and        rsp, 0xfffffffffffffff0
034c0 e85bc76418                     call       0x7fb3cc236c20
034c5 f4                             hlt        
034c6 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
034d0 4883e4f0                       and        rsp, 0xfffffffffffffff0
034d4 e847c76418                     call       0x7fb3cc236c20
034d9 f4                             hlt        
034da 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
034e4 4883e4f0                       and        rsp, 0xfffffffffffffff0
034e8 e833c76418                     call       0x7fb3cc236c20
034ed f4                             hlt        
034ee 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
034f8 4883e4f0                       and        rsp, 0xfffffffffffffff0
034fc e81fc76418                     call       0x7fb3cc236c20
03501 f4                             hlt        
03502 48bfd0d1918cb37f0000           movabs     rdi, 0x7fb38c91d1d0
0350c 4883e4f0                       and        rsp, 0xfffffffffffffff0
03510 e80bc76418                     call       0x7fb3cc236c20
03515 f4                             hlt        
03516 bef6ffffff                     mov        esi, 0xfffffff6
0351b 90                             nop        
0351c c5f877                         vzeroupper 
0351f e83c35aeff                     call       0x7fb3b36cda60
03524 0f1f84001c36003f               nop        dword ptr [rax + rax + 0x3f00361c]
0352c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03536 4883e4f0                       and        rsp, 0xfffffffffffffff0
0353a e8e1c66418                     call       0x7fb3cc236c20
0353f f4                             hlt        
03540 bef6ffffff                     mov        esi, 0xfffffff6
03545 90                             nop        
03546 90                             nop        
03547 90                             nop        
03548 c5f877                         vzeroupper 
0354b e81035aeff                     call       0x7fb3b36cda60
03550 0f1f840048360040               nop        dword ptr [rax + rax + 0x40003648]
03558 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03562 4883e4f0                       and        rsp, 0xfffffffffffffff0
03566 e8b5c66418                     call       0x7fb3cc236c20
0356b f4                             hlt        
0356c bef6ffffff                     mov        esi, 0xfffffff6
03571 90                             nop        
03572 90                             nop        
03573 90                             nop        
03574 c5f877                         vzeroupper 
03577 e8e434aeff                     call       0x7fb3b36cda60
0357c 0f1f840074360041               nop        dword ptr [rax + rax + 0x41003674]
03584 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0358e 4883e4f0                       and        rsp, 0xfffffffffffffff0
03592 e889c66418                     call       0x7fb3cc236c20
03597 f4                             hlt        
03598 bef6ffffff                     mov        esi, 0xfffffff6
0359d 90                             nop        
0359e 90                             nop        
0359f 90                             nop        
035a0 c5f877                         vzeroupper 
035a3 e8b834aeff                     call       0x7fb3b36cda60
035a8 0f1f8400a0360042               nop        dword ptr [rax + rax + 0x420036a0]
035b0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
035ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
035be e85dc66418                     call       0x7fb3cc236c20
035c3 f4                             hlt        
035c4 bef6ffffff                     mov        esi, 0xfffffff6
035c9 8bef                           mov        ebp, edi
035cb 90                             nop        
035cc c5f877                         vzeroupper 
035cf e88c34aeff                     call       0x7fb3b36cda60
035d4 0f1f8400cc360043               nop        dword ptr [rax + rax + 0x430036cc]
035dc 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
035e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
035ea e831c66418                     call       0x7fb3cc236c20
035ef f4                             hlt        
035f0 bef6ffffff                     mov        esi, 0xfffffff6
035f5 90                             nop        
035f6 90                             nop        
035f7 90                             nop        
035f8 c5f877                         vzeroupper 
035fb e86034aeff                     call       0x7fb3b36cda60
03600 0f1f8400f8360044               nop        dword ptr [rax + rax + 0x440036f8]
03608 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03612 4883e4f0                       and        rsp, 0xfffffffffffffff0
03616 e805c66418                     call       0x7fb3cc236c20
0361b f4                             hlt        
0361c bef6ffffff                     mov        esi, 0xfffffff6
03621 448954240c                     mov        dword ptr [rsp + 0xc], r10d
03626 90                             nop        
03627 90                             nop        
03628 c5f877                         vzeroupper 
0362b e83034aeff                     call       0x7fb3b36cda60
03630 0f1f840028370045               nop        dword ptr [rax + rax + 0x45003728]
03638 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03642 4883e4f0                       and        rsp, 0xfffffffffffffff0
03646 e8d5c56418                     call       0x7fb3cc236c20
0364b f4                             hlt        
0364c bef6ffffff                     mov        esi, 0xfffffff6
03651 4489542408                     mov        dword ptr [rsp + 8], r10d
03656 90                             nop        
03657 90                             nop        
03658 c5f877                         vzeroupper 
0365b e80034aeff                     call       0x7fb3b36cda60
03660 0f1f840058370046               nop        dword ptr [rax + rax + 0x46003758]
03668 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03672 4883e4f0                       and        rsp, 0xfffffffffffffff0
03676 e8a5c56418                     call       0x7fb3cc236c20
0367b f4                             hlt        
0367c bef6ffffff                     mov        esi, 0xfffffff6
03681 90                             nop        
03682 90                             nop        
03683 90                             nop        
03684 c5f877                         vzeroupper 
03687 e8d433aeff                     call       0x7fb3b36cda60
0368c 0f1f840084370047               nop        dword ptr [rax + rax + 0x47003784]
03694 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0369e 4883e4f0                       and        rsp, 0xfffffffffffffff0
036a2 e879c56418                     call       0x7fb3cc236c20
036a7 f4                             hlt        
036a8 bef6ffffff                     mov        esi, 0xfffffff6
036ad 895c240c                       mov        dword ptr [rsp + 0xc], ebx
036b1 90                             nop        
036b2 90                             nop        
036b3 90                             nop        
036b4 c5f877                         vzeroupper 
036b7 e8a433aeff                     call       0x7fb3b36cda60
036bc 0f1f8400b4370048               nop        dword ptr [rax + rax + 0x480037b4]
036c4 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
036ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
036d2 e849c56418                     call       0x7fb3cc236c20
036d7 f4                             hlt        
036d8 bef6ffffff                     mov        esi, 0xfffffff6
036dd 90                             nop        
036de 90                             nop        
036df 90                             nop        
036e0 c5f877                         vzeroupper 
036e3 e87833aeff                     call       0x7fb3b36cda60
036e8 0f1f8400e0370049               nop        dword ptr [rax + rax + 0x490037e0]
036f0 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
036fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
036fe e81dc56418                     call       0x7fb3cc236c20
03703 f4                             hlt        
03704 bef6ffffff                     mov        esi, 0xfffffff6
03709 895c2408                       mov        dword ptr [rsp + 8], ebx
0370d 90                             nop        
0370e 90                             nop        
0370f 90                             nop        
03710 c5f877                         vzeroupper 
03713 e84833aeff                     call       0x7fb3b36cda60
03718 0f1f84001038004a               nop        dword ptr [rax + rax + 0x4a003810]
03720 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
0372a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0372e e8edc46418                     call       0x7fb3cc236c20
03733 f4                             hlt        
03734 bef6ffffff                     mov        esi, 0xfffffff6
03739 90                             nop        
0373a 90                             nop        
0373b 90                             nop        
0373c c5f877                         vzeroupper 
0373f e81c33aeff                     call       0x7fb3b36cda60
03744 0f1f84003c38004b               nop        dword ptr [rax + rax + 0x4b00383c]
0374c 48bf10eb898cb37f0000           movabs     rdi, 0x7fb38c89eb10
03756 4883e4f0                       and        rsp, 0xfffffffffffffff0
0375a e8c1c46418                     call       0x7fb3cc236c20
0375f f4                             hlt        
03760 49bacc7ebeb3b37f0000           movabs     r10, 0x7fb3b3be7ecc
0376a 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
03771 e9ea7bb4ff                     jmp        0x7fb3b3732360
03776 e8654ab3ff                     call       0x7fb3b371f1e0
0377b e9aec8ffff                     jmp        0x7fb3b3be702e
