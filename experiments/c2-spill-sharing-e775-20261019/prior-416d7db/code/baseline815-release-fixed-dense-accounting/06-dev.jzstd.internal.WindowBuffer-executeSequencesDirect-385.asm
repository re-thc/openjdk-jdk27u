00000 e83b634219                     call       0x7fd1dd29b740
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ece0000000                 sub        rsp, 0xe0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8538230000                   jne        0x7fd1c3e77766
0002e 488b9e40010000                 mov        rbx, qword ptr [rsi + 0x140]
00035 4c8bb638010000                 mov        r14, qword ptr [rsi + 0x138]
0003c 448b5668                       mov        r10d, dword ptr [rsi + 0x68]
00040 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00045 4c8b9628010000                 mov        r10, qword ptr [rsi + 0x128]
0004c 4c89542438                     mov        qword ptr [rsp + 0x38], r10
00051 4c8b9620010000                 mov        r10, qword ptr [rsi + 0x120]
00058 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0005d 4c8b9608010000                 mov        r10, qword ptr [rsi + 0x108]
00064 4c89542448                     mov        qword ptr [rsp + 0x48], r10
00069 4c8b9600010000                 mov        r10, qword ptr [rsi + 0x100]
00070 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00075 448b9630010000                 mov        r10d, dword ptr [rsi + 0x130]
0007c 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00081 448b9e18010000                 mov        r11d, dword ptr [rsi + 0x118]
00088 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0008d 448b96f8000000                 mov        r10d, dword ptr [rsi + 0xf8]
00094 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00099 448baef0000000                 mov        r13d, dword ptr [rsi + 0xf0]
000a0 448b96e8000000                 mov        r10d, dword ptr [rsi + 0xe8]
000a7 4489542458                     mov        dword ptr [rsp + 0x58], r10d
000ac 4c8b96d8000000                 mov        r10, qword ptr [rsi + 0xd8]
000b3 4c89542460                     mov        qword ptr [rsp + 0x60], r10
000b8 448b9ea0000000                 mov        r11d, dword ptr [rsi + 0xa0]
000bf 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
000c4 4c8b9680000000                 mov        r10, qword ptr [rsi + 0x80]
000cb 4c89542468                     mov        qword ptr [rsp + 0x68], r10
000d0 448b5678                       mov        r10d, dword ptr [rsi + 0x78]
000d4 4489542474                     mov        dword ptr [rsp + 0x74], r10d
000d9 448b5e70                       mov        r11d, dword ptr [rsi + 0x70]
000dd 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
000e2 4c8b9690000000                 mov        r10, qword ptr [rsi + 0x90]
000e9 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
000f1 488bfe                         mov        rdi, rsi
000f4 c5f877                         vzeroupper 
000f7 49ba00a737ddd17f0000           movabs     r10, 0x7fd1dd37a700
00101 41ffd2                         call       r10
00104 0f1f840000000000               nop        dword ptr [rax + rax]
0010c 4885db                         test       rbx, rbx
0010f 0f84c3150000                   je         0x7fd1c3e76ad8
00115 448b5b04                       mov        r11d, dword ptr [rbx + 4]
00119 41c1eb0a                       shr        r11d, 0xa
0011d 4181fb0c080000                 cmp        r11d, 0x80c
00124 0f8586160000                   jne        0x7fd1c3e76bb0
0012a 4c8bd3                         mov        r10, rbx
0012d 4c89542408                     mov        qword ptr [rsp + 8], r10
00132 4d85f6                         test       r14, r14
00135 0f84aa150000                   je         0x7fd1c3e76ae5
0013b 458b5604                       mov        r10d, dword ptr [r14 + 4]
0013f 41c1ea0a                       shr        r10d, 0xa
00143 4181fa05020000                 cmp        r10d, 0x205
0014a 0f8560160000                   jne        0x7fd1c3e76bb0
00150 4d8bd6                         mov        r10, r14
00153 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0015b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00160 4d85d2                         test       r10, r10
00163 0f848c150000                   je         0x7fd1c3e76af5
00169 458b5204                       mov        r10d, dword ptr [r10 + 4]
0016d 41c1ea0a                       shr        r10d, 0xa
00171 4181fa08020000                 cmp        r10d, 0x208
00178 0f8532160000                   jne        0x7fd1c3e76bb0
0017e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00183 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0018b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00190 4d85d2                         test       r10, r10
00193 0f846c150000                   je         0x7fd1c3e76b05
00199 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0019d 41c1eb0a                       shr        r11d, 0xa
001a1 4181fb07020000                 cmp        r11d, 0x207
001a8 0f8502160000                   jne        0x7fd1c3e76bb0
001ae 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001b8 4d85d2                         test       r10, r10
001bb 0f8451150000                   je         0x7fd1c3e76b12
001c1 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c5 41c1ea0a                       shr        r10d, 0xa
001c9 4181fa07020000                 cmp        r10d, 0x207
001d0 0f85da150000                   jne        0x7fd1c3e76bb0
001d6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001db 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
001e3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001e8 4d85d2                         test       r10, r10
001eb 0f8431150000                   je         0x7fd1c3e76b22
001f1 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f5 41c1eb0a                       shr        r11d, 0xa
001f9 4181fb05020000                 cmp        r11d, 0x205
00200 0f85aa150000                   jne        0x7fd1c3e76bb0
00206 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0020e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00216 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0021f 448b54245c                     mov        r10d, dword ptr [rsp + 0x5c]
00224 4585d2                         test       r10d, r10d
00227 0f8405150000                   je         0x7fd1c3e76b32
0022d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00235 458b5208                       mov        r10d, dword ptr [r10 + 8]
00239 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0023e 458d5af1                       lea        r11d, [r10 - 0xf]
00242 4585db                         test       r11d, r11d
00245 0f8ce7140000                   jl         0x7fd1c3e76b32
0024b 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00253 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00257 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0025c 458d53f1                       lea        r10d, [r11 - 0xf]
00260 4585d2                         test       r10d, r10d
00263 0f8cc9140000                   jl         0x7fd1c3e76b32
00269 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00271 458b5208                       mov        r10d, dword ptr [r10 + 8]
00275 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0027a 4585d2                         test       r10d, r10d
0027d 0f86af140000                   jbe        0x7fd1c3e76b32
00283 4183fa01                       cmp        r10d, 1
00287 0f86a5140000                   jbe        0x7fd1c3e76b32
0028d 4183fa02                       cmp        r10d, 2
00291 0f869b140000                   jbe        0x7fd1c3e76b32
00297 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
0029c 4183c2f9                       add        r10d, -7
002a0 4585d2                         test       r10d, r10d
002a3 0f8c89140000                   jl         0x7fd1c3e76b32
002a9 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002ae 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
002b3 458d5af1                       lea        r11d, [r10 - 0xf]
002b7 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
002bf 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002c4 4183c2f1                       add        r10d, -0xf
002c8 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
002d0 e9b5010000                     jmp        0x7fd1c3e7588a
002d5 33c9                           xor        ecx, ecx
002d7 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
002df 458b5a10                       mov        r11d, dword ptr [r10 + 0x10]
002e3 4183f803                       cmp        r8d, 3
002e7 0f8e2f020000                   jle        0x7fd1c3e7591c
002ed 45895a14                       mov        dword ptr [r10 + 0x14], r11d
002f1 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
002f5 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
002fd 45895310                       mov        dword ptr [r11 + 0x10], r10d
00301 4183c0fd                       add        r8d, -3
00305 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
0030d 4589430c                       mov        dword ptr [r11 + 0xc], r8d
00311 4c639c24ac000000               movsxd     r11, dword ptr [rsp + 0xac]
00319 4c63542478                     movsxd     r10, dword ptr [rsp + 0x78]
0031e 4c03542460                     add        r10, qword ptr [rsp + 0x60]
00323 4c63c1                         movsxd     r8, ecx
00326 4d03d0                         add        r10, r8
00329 4d3bda                         cmp        r11, r10
0032c 0f8f3a100000                   jg         0x7fd1c3e7676c
00332 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
0033a 4585db                         test       r11d, r11d
0033d 0f8e790f0000                   jle        0x7fd1c3e766bc
00343 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00348 4403d9                         add        r11d, ecx
0034b 44039c24a8000000               add        r11d, dword ptr [rsp + 0xa8]
00353 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
00358 0f8fde100000                   jg         0x7fd1c3e7683c
0035e 468d1c29                       lea        r11d, [rcx + r13]
00362 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00367 0f8f6f110000                   jg         0x7fd1c3e768dc
0036d 83f910                         cmp        ecx, 0x10
00370 0f8f1a120000                   jg         0x7fd1c3e76990
00376 443bac24a4000000               cmp        r13d, dword ptr [rsp + 0xa4]
0037e 0f83e80b0000                   jae        0x7fd1c3e7636c
00384 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0038c c4817a6f442a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 0xc]
00393 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00398 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
003a0 0f839a0c0000                   jae        0x7fd1c3e76440
003a6 468d1429                       lea        r10d, [rcx + r13]
003aa 4489542438                     mov        dword ptr [rsp + 0x38], r10d
003af 458bd3                         mov        r10d, r11d
003b2 468d1c11                       lea        r11d, [rcx + r10]
003b6 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
003be 4d63ca                         movsxd     r9, r10d
003c1 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
003c9 c4817a7f440b0c                 vmovdqu    xmmword ptr [r11 + r9 + 0xc], xmm0
003d0 8b9c24b0000000                 mov        ebx, dword ptr [rsp + 0xb0]
003d7 2b9c24ac000000                 sub        ebx, dword ptr [rsp + 0xac]
003de 899c24b4000000                 mov        dword ptr [rsp + 0xb4], ebx
003e5 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
003ed 4183fb10                       cmp        r11d, 0x10
003f1 0f8f35120000                   jg         0x7fd1c3e76a2c
003f7 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
003fe 83fb10                         cmp        ebx, 0x10
00401 0f8c79020000                   jl         0x7fd1c3e75a80
00407 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
0040f 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
00417 0f83070d0000                   jae        0x7fd1c3e76524
0041d 458bc3                         mov        r8d, r11d
00420 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00428 c4817a6f44030c                 vmovdqu    xmm0, xmmword ptr [r11 + r8 + 0xc]
0042f 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00437 443b9c24a0000000               cmp        r11d, dword ptr [rsp + 0xa0]
0043f 0f83970d0000                   jae        0x7fd1c3e765dc
00445 458bc2                         mov        r8d, r10d
00448 4d63d0                         movsxd     r10, r8d
0044b 468d1c01                       lea        r11d, [rcx + r8]
0044f 44039c24a8000000               add        r11d, dword ptr [rsp + 0xa8]
00457 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0045c 4c63d9                         movsxd     r11, ecx
0045f 4d03da                         add        r11, r10
00462 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0046a c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
00471 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
00475 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0047a 41ffc0                         inc        r8d
0047d 4489442470                     mov        dword ptr [rsp + 0x70], r8d
00482 418502                         test       dword ptr [r10], eax
00485 448b6c2438                     mov        r13d, dword ptr [rsp + 0x38]
0048a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0048f 452bd5                         sub        r10d, r13d
00492 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00497 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
0049c 0f8dc2080000                   jge        0x7fd1c3e76164
004a2 443b442404                     cmp        r8d, dword ptr [rsp + 4]
004a7 0f83370a0000                   jae        0x7fd1c3e762e4
004ad 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
004b5 4f8b5cc310                     mov        r11, qword ptr [r11 + r8*8 + 0x10]
004ba 4d8bc3                         mov        r8, r11
004bd 49c1f824                       sar        r8, 0x24
004c1 458bc0                         mov        r8d, r8d
004c4 4d8bcb                         mov        r9, r11
004c7 49c1e912                       shr        r9, 0x12
004cb 418bcb                         mov        ecx, r11d
004ce 458bd9                         mov        r11d, r9d
004d1 81e1ffff0100                   and        ecx, 0x1ffff
004d7 4181e3ffff0300                 and        r11d, 0x3ffff
004de 44899c24a8000000               mov        dword ptr [rsp + 0xa8], r11d
004e6 4585c0                         test       r8d, r8d
004e9 0f8ced0d0000                   jl         0x7fd1c3e766dc
004ef 85c9                           test       ecx, ecx
004f1 0f84defdffff                   je         0x7fd1c3e756d5
004f7 413bca                         cmp        ecx, r10d
004fa 0f8ed7fdffff                   jle        0x7fd1c3e756d7
00500 be45ffffff                     mov        esi, 0xffffff45
00505 8be9                           mov        ebp, ecx
00507 44891424                       mov        dword ptr [rsp], r10d
0050b 90                             nop        
0050c c5f877                         vzeroupper 
0050f e84cdeacff                     call       0x7fd1c3943760
00514 0f1f84000c060001               nop        dword ptr [rax + rax + 0x100060c]
0051c 85c9                           test       ecx, ecx
0051e 7403                           je         0x7fd1c3e75923
00520 41ffc8                         dec        r8d
00523 458b4a0c                       mov        r9d, dword ptr [r10 + 0xc]
00527 4585c0                         test       r8d, r8d
0052a 7474                           je         0x7fd1c3e759a0
0052c 4183f803                       cmp        r8d, 3
00530 0f84db080000                   je         0x7fd1c3e76211
00536 4183f802                       cmp        r8d, 2
0053a 7771                           ja         0x7fd1c3e759ad
0053c 443b44241c                     cmp        r8d, dword ptr [rsp + 0x1c]
00541 0f83d1120000                   jae        0x7fd1c3e76c18
00547 478b4c820c                     mov        r9d, dword ptr [r10 + r8*4 + 0xc]
0054c 4585c0                         test       r8d, r8d
0054f 7e43                           jle        0x7fd1c3e75994
00551 458d58ff                       lea        r11d, [r8 - 1]
00555 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
0055a 0f83a4180000                   jae        0x7fd1c3e77204
00560 458bd2                         mov        r10d, r10d
00563 4183c2d0                       add        r10d, -0x30
00567 41c1ea02                       shr        r10d, 2
0056b 478d5402ff                     lea        r10d, [r10 + r8 - 1]
00570 4963d8                         movsxd     rbx, r8d
00573 33ff                           xor        edi, edi
00575 41bb04000000                   mov        r11d, 4
0057b c442a0f5d2                     bzhi       r10, r10, r11
00580 492bda                         sub        rbx, r10
00583 48ffcb                         dec        rbx
00586 4885db                         test       rbx, rbx
00589 480f4cdf                       cmovl      rbx, rdi
0058d 8bfb                           mov        edi, ebx
0058f e9a7060000                     jmp        0x7fd1c3e7603b
00594 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0059c 45894a0c                       mov        dword ptr [r10 + 0xc], r9d
005a0 44898c24ac000000               mov        dword ptr [rsp + 0xac], r9d
005a8 e964fdffff                     jmp        0x7fd1c3e75711
005ad 48be48387ce200000000           movabs     rsi, 0xe27c3848
005b7 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
005bc 48894424f8                     mov        qword ptr [rsp - 8], rax
005c1 8b442410                       mov        eax, dword ptr [rsp + 0x10]
005c5 89442408                       mov        dword ptr [rsp + 8], eax
005c9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
005ce 48ff742420                     push       qword ptr [rsp + 0x20]
005d3 488f442418                     pop        qword ptr [rsp + 0x18]
005d8 48894424f8                     mov        qword ptr [rsp - 8], rax
005dd 8b442428                       mov        eax, dword ptr [rsp + 0x28]
005e1 8944240c                       mov        dword ptr [rsp + 0xc], eax
005e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
005ea 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
005ef 48894424f8                     mov        qword ptr [rsp - 8], rax
005f4 8b442458                       mov        eax, dword ptr [rsp + 0x58]
005f8 89442438                       mov        dword ptr [rsp + 0x38], eax
005fc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00601 48ff742460                     push       qword ptr [rsp + 0x60]
00606 488f442440                     pop        qword ptr [rsp + 0x40]
0060b 48894424f8                     mov        qword ptr [rsp - 8], rax
00610 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
00614 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00618 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0061d 48ff742468                     push       qword ptr [rsp + 0x68]
00622 488f442450                     pop        qword ptr [rsp + 0x50]
00627 894c2464                       mov        dword ptr [rsp + 0x64], ecx
0062b 90                             nop        
0062c c5f877                         vzeroupper 
0062f e82caea9ff                     call       0x7fd1c3910860
00634 0f1f84002c070002               nop        dword ptr [rax + rax + 0x200072c]
0063c 4885c0                         test       rax, rax
0063f 0f84bb120000                   je         0x7fd1c3e76d00
00645 488bf0                         mov        rsi, rax
00648 c5f877                         vzeroupper 
0064b 4881c4e0000000                 add        rsp, 0xe0
00652 5d                             pop        rbp
00653 e90830adff                     jmp        0x7fd1c3948a60
00658 448bd3                         mov        r10d, ebx
0065b 4d63d2                         movsxd     r10, r10d
0065e 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00665 c442a8f5db                     bzhi       r11, r11, r10
0066a c4c1fb92fb                     kmovq      k7, r11
0066f 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00675 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
0067b e98a050000                     jmp        0x7fd1c3e7600a
00680 418bdb                         mov        ebx, r11d
00683 039c24b0000000                 add        ebx, dword ptr [rsp + 0xb0]
0068a 895c2478                       mov        dword ptr [rsp + 0x78], ebx
0068e 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
00696 443b9c24a8000000               cmp        r11d, dword ptr [rsp + 0xa8]
0069e 0f8d08030000                   jge        0x7fd1c3e75dac
006a4 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
006ac 4183c308                       add        r11d, 8
006b0 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
006b8 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
006c0 4183f808                       cmp        r8d, 8
006c4 0f8dc3010000                   jge        0x7fd1c3e75c8d
006ca 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
006d2 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
006d7 0f8303180000                   jae        0x7fd1c3e772e0
006dd 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
006e5 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
006ed 430fbe6c0b0c                   movsx      ebp, byte ptr [r11 + r9 + 0xc]
006f3 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
006fb 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00700 0f83da180000                   jae        0x7fd1c3e773e0
00706 4d63da                         movsxd     r11, r10d
00709 4c63c1                         movsxd     r8, ecx
0070c 4d03c3                         add        r8, r11
0070f 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00717 43886c030c                     mov        byte ptr [r11 + r8 + 0xc], bpl
0071c 458d5903                       lea        r11d, [r9 + 3]
00720 448b8c24b0000000               mov        r9d, dword ptr [rsp + 0xb0]
00728 41ffc1                         inc        r9d
0072b 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00730 0f836a190000                   jae        0x7fd1c3e774a0
00736 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
0073e 4183c303                       add        r11d, 3
00742 48639c24b4000000               movsxd     rbx, dword ptr [rsp + 0xb4]
0074a 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00752 410fbe6c180d                   movsx      ebp, byte ptr [r8 + rbx + 0xd]
00758 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
0075d 0f83151a0000                   jae        0x7fd1c3e77578
00763 4d63d2                         movsxd     r10, r10d
00766 4c63d9                         movsxd     r11, ecx
00769 4d03da                         add        r11, r10
0076c 43886c180d                     mov        byte ptr [r8 + r11 + 0xd], bpl
00771 450fbe54180e                   movsx      r10d, byte ptr [r8 + rbx + 0xe]
00777 478854180e                     mov        byte ptr [r8 + r11 + 0xe], r10b
0077c 450fbe44180f                   movsx      r8d, byte ptr [r8 + rbx + 0xf]
00782 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
0078a 4788441a0f                     mov        byte ptr [r10 + r11 + 0xf], r8b
0078f 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
00797 4183fa08                       cmp        r10d, 8
0079b 0f83971a0000                   jae        0x7fd1c3e77638
007a1 49bab08c79e200000000           movabs     r10, 0xe2798cb0
007ab 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
007b3 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
007bb 47035c820c                     add        r11d, dword ptr [r10 + r8*4 + 0xc]
007c0 44891c24                       mov        dword ptr [rsp], r11d
007c4 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
007cc 4183fb04                       cmp        r11d, 4
007d0 7e42                           jle        0x7fd1c3e75c14
007d2 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
007d9 83c504                         add        ebp, 4
007dc 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
007e4 8b1424                         mov        edx, dword ptr [rsp]
007e7 90                             nop        
007e8 c5f877                         vzeroupper 
007eb e870aca9ff                     call       0x7fd1c3910860
007f0 0f1f8400e8080003               nop        dword ptr [rax + rax + 0x30008e8]
007f8 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
00800 8bd5                           mov        edx, ebp
00802 8bc8                           mov        ecx, eax
00804 c5f877                         vzeroupper 
00807 e854aca9ff                     call       0x7fd1c3910860
0080c 0f1f840004090004               nop        dword ptr [rax + rax + 0x4000904]
00814 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
0081c 4183fb08                       cmp        r11d, 8
00820 0f8e4bfcffff                   jle        0x7fd1c3e75871
00826 49bae08c79e200000000           movabs     r10, 0xe2798ce0
00830 8b1424                         mov        edx, dword ptr [rsp]
00833 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
0083b 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00840 83c208                         add        edx, 8
00843 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
0084b 90                             nop        
0084c c5f877                         vzeroupper 
0084f e80caca9ff                     call       0x7fd1c3910860
00854 0f1f84004c090005               nop        dword ptr [rax + rax + 0x500094c]
0085c 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00863 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
0086b 8b9424c0000000                 mov        edx, dword ptr [rsp + 0xc0]
00872 488bc8                         mov        rcx, rax
00875 666690                         nop        
00878 c5f877                         vzeroupper 
0087b e8e0aba9ff                     call       0x7fd1c3910860
00880 0f1f840078090006               nop        dword ptr [rax + rax + 0x6000978]
00888 e9e4fbffff                     jmp        0x7fd1c3e75871
0088d 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
00895 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
0089c c5f877                         vzeroupper 
0089f e8bcaba9ff                     call       0x7fd1c3910860
008a4 0f1f84009c090007               nop        dword ptr [rax + rax + 0x700099c]
008ac 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
008b3 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
008bb 8bd5                           mov        edx, ebp
008bd 488bc8                         mov        rcx, rax
008c0 c5f877                         vzeroupper 
008c3 e898aba9ff                     call       0x7fd1c3910860
008c8 0f1f8400c0090008               nop        dword ptr [rax + rax + 0x80009c0]
008d0 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
008d8 4183c208                       add        r10d, 8
008dc be95ffffff                     mov        esi, 0xffffff95
008e1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
008e6 48894424f8                     mov        qword ptr [rsp - 8], rax
008eb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
008ef 89442408                       mov        dword ptr [rsp + 8], eax
008f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008f8 48ff742420                     push       qword ptr [rsp + 0x20]
008fd 488f442418                     pop        qword ptr [rsp + 0x18]
00902 48894424f8                     mov        qword ptr [rsp - 8], rax
00907 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0090b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0090f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00914 48894424f8                     mov        qword ptr [rsp - 8], rax
00919 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0091d 89442430                       mov        dword ptr [rsp + 0x30], eax
00921 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00926 48894424f8                     mov        qword ptr [rsp - 8], rax
0092b 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0092f 89442434                       mov        dword ptr [rsp + 0x34], eax
00933 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00938 48ff742460                     push       qword ptr [rsp + 0x60]
0093d 488f442438                     pop        qword ptr [rsp + 0x38]
00942 48894424f8                     mov        qword ptr [rsp - 8], rax
00947 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0094b 89442440                       mov        dword ptr [rsp + 0x40], eax
0094f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00954 48ff742468                     push       qword ptr [rsp + 0x68]
00959 488f442450                     pop        qword ptr [rsp + 0x50]
0095e 48894424f8                     mov        qword ptr [rsp - 8], rax
00963 8b442470                       mov        eax, dword ptr [rsp + 0x70]
00967 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0096b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00970 48894424f8                     mov        qword ptr [rsp - 8], rax
00975 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00979 89442460                       mov        dword ptr [rsp + 0x60], eax
0097d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00982 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00987 48894424f8                     mov        qword ptr [rsp - 8], rax
0098c 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
00993 8944246c                       mov        dword ptr [rsp + 0x6c], eax
00997 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0099c c5f877                         vzeroupper 
0099f e8bcd9acff                     call       0x7fd1c3943760
009a4 0f1f84009c0a0009               nop        dword ptr [rax + rax + 0x9000a9c]
009ac 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
009b3 83fb30                         cmp        ebx, 0x30
009b6 0f8fc0010000                   jg         0x7fd1c3e75f7c
009bc 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
009c1 4183c3f9                       add        r11d, -7
009c5 44899c24ac000000               mov        dword ptr [rsp + 0xac], r11d
009cd 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
009d5 453bc3                         cmp        r8d, r11d
009d8 0f833a0f0000                   jae        0x7fd1c3e76d18
009de 458bd8                         mov        r11d, r8d
009e1 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
009e9 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009f1 448b8c24b4000000               mov        r9d, dword ptr [rsp + 0xb4]
009f9 4f8b440b0c                     mov        r8, qword ptr [r11 + r9 + 0xc]
009fe 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00a06 443b9c24ac000000               cmp        r11d, dword ptr [rsp + 0xac]
00a0e 0f8314100000                   jae        0x7fd1c3e76e28
00a14 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00a19 4d63d2                         movsxd     r10, r10d
00a1c 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00a20 4c63d9                         movsxd     r11, ecx
00a23 4b8d4c130c                     lea        rcx, [r11 + r10 + 0xc]
00a28 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00a2f 48be00b722e200000000           movabs     rsi, 0xe222b700
00a39 488b9424b8000000               mov        rdx, qword ptr [rsp + 0xb8]
00a41 4533c9                         xor        r9d, r9d
00a44 c5f877                         vzeroupper 
00a47 e814a0a9ff                     call       0x7fd1c390fe60
00a4c 0f1f8400440b000a               nop        dword ptr [rax + rax + 0xa000b44]
00a54 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00a59 44035c2430                     add        r11d, dword ptr [rsp + 0x30]
00a5e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00a63 458d5308                       lea        r10d, [r11 + 8]
00a67 44899424b0000000               mov        dword ptr [rsp + 0xb0], r10d
00a6f 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00a74 0f8da5010000                   jge        0x7fd1c3e7601f
00a7a 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00a82 442b542430                     sub        r10d, dword ptr [rsp + 0x30]
00a87 44891424                       mov        dword ptr [rsp], r10d
00a8b 4c6344242c                     movsxd     r8, dword ptr [rsp + 0x2c]
00a90 4983c0f9                       add        r8, -7
00a94 4d63ca                         movsxd     r9, r10d
00a97 4c639424b0000000               movsxd     r10, dword ptr [rsp + 0xb0]
00a9f 4f8d1c0a                       lea        r11, [r10 + r9]
00aa3 4d3bd8                         cmp        r11, r8
00aa6 0f8378110000                   jae        0x7fd1c3e77024
00aac 4c635c2478                     movsxd     r11, dword ptr [rsp + 0x78]
00ab1 4d2bda                         sub        r11, r10
00ab4 4983c307                       add        r11, 7
00ab8 4983e3f8                       and        r11, 0xfffffffffffffff8
00abc 458bdb                         mov        r11d, r11d
00abf 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00ac3 458d540b08                     lea        r10d, [r11 + rcx + 8]
00ac8 4d63d2                         movsxd     r10, r10d
00acb 4f8d5c11f8                     lea        r11, [r9 + r10 - 8]
00ad0 4d3bd8                         cmp        r11, r8
00ad3 0f834b110000                   jae        0x7fd1c3e77024
00ad9 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00ae1 443b9c24ac000000               cmp        r11d, dword ptr [rsp + 0xac]
00ae9 0f8335110000                   jae        0x7fd1c3e77024
00aef 4983c2f8                       add        r10, -8
00af3 4d3bd0                         cmp        r10, r8
00af6 0f8328110000                   jae        0x7fd1c3e77024
00afc 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00b01 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00b08 0f8f06120000                   jg         0x7fd1c3e77114
00b0e 6690                           nop        
00b10 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b18 4963ca                         movsxd     rcx, r10d
00b1b 4883c10c                       add        rcx, 0xc
00b1f 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00b26 032c24                         add        ebp, dword ptr [rsp]
00b29 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00b31 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
00b36 48be00b722e200000000           movabs     rsi, 0xe222b700
00b40 488b9424b8000000               mov        rdx, qword ptr [rsp + 0xb8]
00b48 4533c9                         xor        r9d, r9d
00b4b 90                             nop        
00b4c c5f877                         vzeroupper 
00b4f e80c9fa9ff                     call       0x7fd1c390fe60
00b54 0f1f84004c0c000b               nop        dword ptr [rax + rax + 0xb000c4c]
00b5c 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00b64 4183c308                       add        r11d, 8
00b68 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00b70 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00b75 7c99                           jl         0x7fd1c3e75f10
00b77 e9a3000000                     jmp        0x7fd1c3e7601f
00b7c 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00b84 4585db                         test       r11d, r11d
00b87 0f8ca30f0000                   jl         0x7fd1c3e76f30
00b8d 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b95 4585d2                         test       r10d, r10d
00b98 0f8c920f0000                   jl         0x7fd1c3e76f30
00b9e 448bdb                         mov        r11d, ebx
00ba1 44039c24b4000000               add        r11d, dword ptr [rsp + 0xb4]
00ba9 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
00bad 413bcb                         cmp        ecx, r11d
00bb0 0f827a0f0000                   jb         0x7fd1c3e76f30
00bb6 3b4c2478                       cmp        ecx, dword ptr [rsp + 0x78]
00bba 0f82700f0000                   jb         0x7fd1c3e76f30
00bc0 448bdb                         mov        r11d, ebx
00bc3 4585db                         test       r11d, r11d
00bc6 7442                           je         0x7fd1c3e7600a
00bc8 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00bd0 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
00bd8 4b8d7c1a0c                     lea        rdi, [r10 + r11 + 0xc]
00bdd 4d03c1                         add        r8, r9
00be0 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
00be5 4863d3                         movsxd     rdx, ebx
00be8 4883fa20                       cmp        rdx, 0x20
00bec 0f8666faffff                   jbe        0x7fd1c3e75a58
00bf2 c5f877                         vzeroupper 
00bf5 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00bff 41ffd2                         call       r10
00c02 0f1f840000000000               nop        dword ptr [rax + rax]
00c0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00c0f 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00c16 89442430                       mov        dword ptr [rsp + 0x30], eax
00c1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00c1f 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00c24 44039c24a8000000               add        r11d, dword ptr [rsp + 0xa8]
00c2c 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00c31 e93bf8ffff                     jmp        0x7fd1c3e75871
00c36 6690                           nop        
00c38 458bc3                         mov        r8d, r11d
00c3b 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00c43 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
00c48 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c50 478954830c                     mov        dword ptr [r11 + r8*4 + 0xc], r10d
00c55 458d58ff                       lea        r11d, [r8 - 1]
00c59 443bdf                         cmp        r11d, edi
00c5c 7fda                           jg         0x7fd1c3e76038
00c5e 4183fb3f                       cmp        r11d, 0x3f
00c62 0f8eac000000                   jle        0x7fd1c3e76114
00c68 41ffc8                         dec        r8d
00c6b 458bd0                         mov        r10d, r8d
00c6e eb03                           jmp        0x7fd1c3e76073
00c70 458bd3                         mov        r10d, r11d
00c73 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c7b 62917e486f8493ccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x34]
00c86 62917e487f8493d0ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x30], zmm0
00c91 62917e486f84938cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x74]
00c9c 62917e487f849390ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x70], zmm0
00ca7 62917e486f84934cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0xb4]
00cb2 62917e487f849350ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0xb0], zmm0
00cbd 62917e486f84930cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0xf4]
00cc8 62917e487f849310ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0xf0], zmm0
00cd3 458d5ac0                       lea        r11d, [r10 - 0x40]
00cd7 4183fb3f                       cmp        r11d, 0x3f
00cdb 7f93                           jg         0x7fd1c3e76070
00cdd 4183fb0f                       cmp        r11d, 0xf
00ce1 7e31                           jle        0x7fd1c3e76114
00ce3 458bda                         mov        r11d, r10d
00ce6 4183c3c0                       add        r11d, -0x40
00cea 6690                           nop        
00cec 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00cf4 62917e486f849accffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0x34]
00cff 62917e487f849ad0ffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0x30], zmm0
00d0a 4183c3f0                       add        r11d, -0x10
00d0e 4183fb0f                       cmp        r11d, 0xf
00d12 7fd8                           jg         0x7fd1c3e760ec
00d14 4585db                         test       r11d, r11d
00d17 0f8e77f8ffff                   jle        0x7fd1c3e75994
00d1d 666690                         nop        
00d20 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00d28 478b449a08                     mov        r8d, dword ptr [r10 + r11*4 + 8]
00d2d 4789449a0c                     mov        dword ptr [r10 + r11*4 + 0xc], r8d
00d32 41ffcb                         dec        r11d
00d35 4585db                         test       r11d, r11d
00d38 7fe6                           jg         0x7fd1c3e76120
00d3a e955f8ffff                     jmp        0x7fd1c3e75994
00d3f 4d63d2                         movsxd     r10, r10d
00d42 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d49 c442a8f5db                     bzhi       r11, r11, r10
00d4e c4c1fb92fb                     kmovq      k7, r11
00d53 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d59 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d5f e98e000000                     jmp        0x7fd1c3e761f2
00d64 4585ed                         test       r13d, r13d
00d67 0f8c83150000                   jl         0x7fd1c3e776f0
00d6d 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d72 4585db                         test       r11d, r11d
00d75 0f8c7a150000                   jl         0x7fd1c3e776f5
00d7b 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00d80 443b4c2410                     cmp        r9d, dword ptr [rsp + 0x10]
00d85 0f826a150000                   jb         0x7fd1c3e776f5
00d8b 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
00d8f 4103ea                         add        ebp, r10d
00d92 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d97 443bc5                         cmp        r8d, ebp
00d9a 0f8255150000                   jb         0x7fd1c3e776f5
00da0 4585d2                         test       r10d, r10d
00da3 0f8c4c150000                   jl         0x7fd1c3e776f5
00da9 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00dae 453bcd                         cmp        r9d, r13d
00db1 743f                           je         0x7fd1c3e761f2
00db3 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00dbb 4b8d74180c                     lea        rsi, [r8 + r11 + 0xc]
00dc0 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00dc8 4b8d7c2b0c                     lea        rdi, [r11 + r13 + 0xc]
00dcd 4963d2                         movsxd     rdx, r10d
00dd0 4883fa20                       cmp        rdx, 0x20
00dd4 0f8665ffffff                   jbe        0x7fd1c3e7613f
00dda c5f877                         vzeroupper 
00ddd 49ba209f8fc3d17f0000           movabs     r10, 0x7fd1c38f9f20
00de7 41ffd2                         call       r10
00dea 0f1f840000000000               nop        dword ptr [rax + rax]
00df2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00df7 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00dfb c5f877                         vzeroupper 
00dfe 4881c4e0000000                 add        rsp, 0xe0
00e05 5d                             pop        rbp
00e06 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00e0a 0f8740150000                   ja         0x7fd1c3e77750
00e10 c3                             ret        
00e11 41ffc9                         dec        r9d
00e14 4585c9                         test       r9d, r9d
00e17 7e1d                           jle        0x7fd1c3e76236
00e19 45895a14                       mov        dword ptr [r10 + 0x14], r11d
00e1d 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00e21 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00e29 45895310                       mov        dword ptr [r11 + 0x10], r10d
00e2d 45894b0c                       mov        dword ptr [r11 + 0xc], r9d
00e31 e96af7ffff                     jmp        0x7fd1c3e759a0
00e36 48be08387ce200000000           movabs     rsi, 0xe27c3808
00e40 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00e45 48894424f8                     mov        qword ptr [rsp - 8], rax
00e4a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00e4e 89442408                       mov        dword ptr [rsp + 8], eax
00e52 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e57 48ff742420                     push       qword ptr [rsp + 0x20]
00e5c 488f442418                     pop        qword ptr [rsp + 0x18]
00e61 48894424f8                     mov        qword ptr [rsp - 8], rax
00e66 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e6a 8944240c                       mov        dword ptr [rsp + 0xc], eax
00e6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e73 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
00e78 48894424f8                     mov        qword ptr [rsp - 8], rax
00e7d 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00e81 89442438                       mov        dword ptr [rsp + 0x38], eax
00e85 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e8a 48ff742460                     push       qword ptr [rsp + 0x60]
00e8f 488f442440                     pop        qword ptr [rsp + 0x40]
00e94 48894424f8                     mov        qword ptr [rsp - 8], rax
00e99 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
00e9d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00ea1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ea6 48ff742468                     push       qword ptr [rsp + 0x68]
00eab 488f442450                     pop        qword ptr [rsp + 0x50]
00eb0 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00eb4 c5f877                         vzeroupper 
00eb7 e8a4a5a9ff                     call       0x7fd1c3910860
00ebc 0f1f8400b40f000c               nop        dword ptr [rax + rax + 0xc000fb4]
00ec4 4885c0                         test       rax, rax
00ec7 0f8578f7ffff                   jne        0x7fd1c3e75a45
00ecd bef6ffffff                     mov        esi, 0xfffffff6
00ed2 6690                           nop        
00ed4 c5f877                         vzeroupper 
00ed7 e884d4acff                     call       0x7fd1c3943760
00edc 0f1f8400d40f000d               nop        dword ptr [rax + rax + 0xd000fd4]
00ee4 bee4ffffff                     mov        esi, 0xffffffe4
00ee9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00eee 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00ef7 89442408                       mov        dword ptr [rsp + 8], eax
00efb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f00 48ff742420                     push       qword ptr [rsp + 0x20]
00f05 488f442418                     pop        qword ptr [rsp + 0x18]
00f0a 48894424f8                     mov        qword ptr [rsp - 8], rax
00f0f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f13 8944240c                       mov        dword ptr [rsp + 0xc], eax
00f17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f1c 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
00f21 48894424f8                     mov        qword ptr [rsp - 8], rax
00f26 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00f2a 89442438                       mov        dword ptr [rsp + 0x38], eax
00f2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f33 48ff742460                     push       qword ptr [rsp + 0x60]
00f38 488f442440                     pop        qword ptr [rsp + 0x40]
00f3d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f42 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
00f46 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f4a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f4f 48ff742468                     push       qword ptr [rsp + 0x68]
00f54 488f442450                     pop        qword ptr [rsp + 0x50]
00f59 666690                         nop        
00f5c c5f877                         vzeroupper 
00f5f e8fcd3acff                     call       0x7fd1c3943760
00f64 0f1f84005c10000e               nop        dword ptr [rax + rax + 0xe00105c]
00f6c bee4ffffff                     mov        esi, 0xffffffe4
00f71 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00f76 48894424f8                     mov        qword ptr [rsp - 8], rax
00f7b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00f7f 89442408                       mov        dword ptr [rsp + 8], eax
00f83 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f88 48ff742420                     push       qword ptr [rsp + 0x20]
00f8d 488f442418                     pop        qword ptr [rsp + 0x18]
00f92 48894424f8                     mov        qword ptr [rsp - 8], rax
00f97 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f9b 8944240c                       mov        dword ptr [rsp + 0xc], eax
00f9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fa4 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa9 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00fad 89442430                       mov        dword ptr [rsp + 0x30], eax
00fb1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fb6 48894424f8                     mov        qword ptr [rsp - 8], rax
00fbb 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00fbf 89442438                       mov        dword ptr [rsp + 0x38], eax
00fc3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fc8 48ff742460                     push       qword ptr [rsp + 0x60]
00fcd 488f442440                     pop        qword ptr [rsp + 0x40]
00fd2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fd7 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
00fdb 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00fdf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe4 48ff742468                     push       qword ptr [rsp + 0x68]
00fe9 488f442450                     pop        qword ptr [rsp + 0x50]
00fee 48894424f8                     mov        qword ptr [rsp - 8], rax
00ff3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00ff7 89442458                       mov        dword ptr [rsp + 0x58], eax
00ffb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01000 48894424f8                     mov        qword ptr [rsp - 8], rax
01005 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01009 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0100d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01012 48894424f8                     mov        qword ptr [rsp - 8], rax
01017 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0101b 89442460                       mov        dword ptr [rsp + 0x60], eax
0101f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01024 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01028 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
0102d 666690                         nop        
01030 c5f877                         vzeroupper 
01033 e828d3acff                     call       0x7fd1c3943760
01038 0f1f84003011000f               nop        dword ptr [rax + rax + 0xf001130]
01040 bee4ffffff                     mov        esi, 0xffffffe4
01045 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0104a 48ffb42488000000               push       qword ptr [rsp + 0x88]
01052 488f0424                       pop        qword ptr [rsp]
01056 48894424f8                     mov        qword ptr [rsp - 8], rax
0105b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0105f 89442408                       mov        dword ptr [rsp + 8], eax
01063 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01068 48ff742420                     push       qword ptr [rsp + 0x20]
0106d 488f442418                     pop        qword ptr [rsp + 0x18]
01072 48894424f8                     mov        qword ptr [rsp - 8], rax
01077 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0107b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0107f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01084 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01089 48894424f8                     mov        qword ptr [rsp - 8], rax
0108e 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01092 89442438                       mov        dword ptr [rsp + 0x38], eax
01096 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0109b 48ff742460                     push       qword ptr [rsp + 0x60]
010a0 488f442440                     pop        qword ptr [rsp + 0x40]
010a5 48894424f8                     mov        qword ptr [rsp - 8], rax
010aa 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
010ae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
010b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b7 48ffb42480000000               push       qword ptr [rsp + 0x80]
010bf 488f442448                     pop        qword ptr [rsp + 0x48]
010c4 48ff742468                     push       qword ptr [rsp + 0x68]
010c9 488f442450                     pop        qword ptr [rsp + 0x50]
010ce 48894424f8                     mov        qword ptr [rsp - 8], rax
010d3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
010d7 89442458                       mov        dword ptr [rsp + 0x58], eax
010db 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010e0 48894424f8                     mov        qword ptr [rsp - 8], rax
010e5 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
010e9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
010ed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010f2 48894424f8                     mov        qword ptr [rsp - 8], rax
010f7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
010fb 89442460                       mov        dword ptr [rsp + 0x60], eax
010ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01104 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01108 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01111 666690                         nop        
01114 c5f877                         vzeroupper 
01117 e844d2acff                     call       0x7fd1c3943760
0111c 0f1f840014120010               nop        dword ptr [rax + rax + 0x10001214]
01124 bee4ffffff                     mov        esi, 0xffffffe4
01129 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0112e 48894424f8                     mov        qword ptr [rsp - 8], rax
01133 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01137 89442408                       mov        dword ptr [rsp + 8], eax
0113b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01140 48ff742420                     push       qword ptr [rsp + 0x20]
01145 488f442418                     pop        qword ptr [rsp + 0x18]
0114a 48894424f8                     mov        qword ptr [rsp - 8], rax
0114f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01153 8944240c                       mov        dword ptr [rsp + 0xc], eax
01157 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0115c 48894424f8                     mov        qword ptr [rsp - 8], rax
01161 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01165 89442434                       mov        dword ptr [rsp + 0x34], eax
01169 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0116e 48894424f8                     mov        qword ptr [rsp - 8], rax
01173 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01177 89442438                       mov        dword ptr [rsp + 0x38], eax
0117b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01180 48ff742460                     push       qword ptr [rsp + 0x60]
01185 488f442440                     pop        qword ptr [rsp + 0x40]
0118a 48894424f8                     mov        qword ptr [rsp - 8], rax
0118f 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01193 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01197 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0119c 48ff742468                     push       qword ptr [rsp + 0x68]
011a1 488f442450                     pop        qword ptr [rsp + 0x50]
011a6 48894424f8                     mov        qword ptr [rsp - 8], rax
011ab 8b442474                       mov        eax, dword ptr [rsp + 0x74]
011af 89442458                       mov        dword ptr [rsp + 0x58], eax
011b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011b8 48894424f8                     mov        qword ptr [rsp - 8], rax
011bd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
011c1 89442460                       mov        dword ptr [rsp + 0x60], eax
011c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ca 6690                           nop        
011cc c5f877                         vzeroupper 
011cf e88cd1acff                     call       0x7fd1c3943760
011d4 0f1f8400cc120011               nop        dword ptr [rax + rax + 0x110012cc]
011dc bee4ffffff                     mov        esi, 0xffffffe4
011e1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
011e6 48ffb42488000000               push       qword ptr [rsp + 0x88]
011ee 488f0424                       pop        qword ptr [rsp]
011f2 48894424f8                     mov        qword ptr [rsp - 8], rax
011f7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
011fb 89442408                       mov        dword ptr [rsp + 8], eax
011ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01204 48ff742420                     push       qword ptr [rsp + 0x20]
01209 488f442418                     pop        qword ptr [rsp + 0x18]
0120e 48894424f8                     mov        qword ptr [rsp - 8], rax
01213 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01217 8944240c                       mov        dword ptr [rsp + 0xc], eax
0121b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01220 48894424f8                     mov        qword ptr [rsp - 8], rax
01225 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01229 89442434                       mov        dword ptr [rsp + 0x34], eax
0122d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01232 48894424f8                     mov        qword ptr [rsp - 8], rax
01237 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0123b 89442438                       mov        dword ptr [rsp + 0x38], eax
0123f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01244 48ff742460                     push       qword ptr [rsp + 0x60]
01249 488f442440                     pop        qword ptr [rsp + 0x40]
0124e 48894424f8                     mov        qword ptr [rsp - 8], rax
01253 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01257 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0125b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01260 48ffb42480000000               push       qword ptr [rsp + 0x80]
01268 488f442448                     pop        qword ptr [rsp + 0x48]
0126d 48ff742468                     push       qword ptr [rsp + 0x68]
01272 488f442450                     pop        qword ptr [rsp + 0x50]
01277 48894424f8                     mov        qword ptr [rsp - 8], rax
0127c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01280 89442458                       mov        dword ptr [rsp + 0x58], eax
01284 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01289 48894424f8                     mov        qword ptr [rsp - 8], rax
0128e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01292 89442460                       mov        dword ptr [rsp + 0x60], eax
01296 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0129b 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
012a0 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
012a9 666690                         nop        
012ac c5f877                         vzeroupper 
012af e8acd0acff                     call       0x7fd1c3943760
012b4 0f1f8400ac130012               nop        dword ptr [rax + rax + 0x120013ac]
012bc be45ffffff                     mov        esi, 0xffffff45
012c1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
012c6 4c89542408                     mov        qword ptr [rsp + 8], r10
012cb 90                             nop        
012cc c5f877                         vzeroupper 
012cf e88cd0acff                     call       0x7fd1c3943760
012d4 0f1f8400cc130013               nop        dword ptr [rax + rax + 0x130013cc]
012dc be45ffffff                     mov        esi, 0xffffff45
012e1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
012e6 48894424f8                     mov        qword ptr [rsp - 8], rax
012eb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
012ef 89442408                       mov        dword ptr [rsp + 8], eax
012f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012f8 48ff742420                     push       qword ptr [rsp + 0x20]
012fd 488f442418                     pop        qword ptr [rsp + 0x18]
01302 48894424f8                     mov        qword ptr [rsp - 8], rax
01307 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0130b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0130f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01314 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01319 48894424f8                     mov        qword ptr [rsp - 8], rax
0131e 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01322 89442438                       mov        dword ptr [rsp + 0x38], eax
01326 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0132b 48ff742460                     push       qword ptr [rsp + 0x60]
01330 488f442440                     pop        qword ptr [rsp + 0x40]
01335 48894424f8                     mov        qword ptr [rsp - 8], rax
0133a 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0133e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01342 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01347 48ff742468                     push       qword ptr [rsp + 0x68]
0134c 488f442450                     pop        qword ptr [rsp + 0x50]
01351 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01355 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0135a 6690                           nop        
0135c c5f877                         vzeroupper 
0135f e8fccfacff                     call       0x7fd1c3943760
01364 0f1f84005c140014               nop        dword ptr [rax + rax + 0x1400145c]
0136c 4d3bda                         cmp        r11, r10
0136f bdffffffff                     mov        ebp, 0xffffffff
01374 7c08                           jl         0x7fd1c3e7677e
01376 400f95c5                       setne      bpl
0137a 400fb6ed                       movzx      ebp, bpl
0137e be45ffffff                     mov        esi, 0xffffff45
01383 48ff742408                     push       qword ptr [rsp + 8]
01388 488f0424                       pop        qword ptr [rsp]
0138c 48894424f8                     mov        qword ptr [rsp - 8], rax
01391 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01395 89442414                       mov        dword ptr [rsp + 0x14], eax
01399 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0139e 48894424f8                     mov        qword ptr [rsp - 8], rax
013a3 8b442478                       mov        eax, dword ptr [rsp + 0x78]
013a7 89442438                       mov        dword ptr [rsp + 0x38], eax
013ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b0 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
013b5 48894424f8                     mov        qword ptr [rsp - 8], rax
013ba 8b442458                       mov        eax, dword ptr [rsp + 0x58]
013be 89442440                       mov        dword ptr [rsp + 0x40], eax
013c2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013c7 48ff742460                     push       qword ptr [rsp + 0x60]
013cc 488f442448                     pop        qword ptr [rsp + 0x48]
013d1 48894424f8                     mov        qword ptr [rsp - 8], rax
013d6 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
013da 89442444                       mov        dword ptr [rsp + 0x44], eax
013de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e3 48ff742468                     push       qword ptr [rsp + 0x68]
013e8 488f442458                     pop        qword ptr [rsp + 0x58]
013ed 48894424f8                     mov        qword ptr [rsp - 8], rax
013f2 8b442474                       mov        eax, dword ptr [rsp + 0x74]
013f6 89442460                       mov        dword ptr [rsp + 0x60], eax
013fa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013ff 48894424f8                     mov        qword ptr [rsp - 8], rax
01404 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01408 89442464                       mov        dword ptr [rsp + 0x64], eax
0140c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01411 48894424f8                     mov        qword ptr [rsp - 8], rax
01416 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0141a 89442468                       mov        dword ptr [rsp + 0x68], eax
0141e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01423 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
01427 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0142c c5f877                         vzeroupper 
0142f e82ccfacff                     call       0x7fd1c3943760
01434 0f1f84002c150015               nop        dword ptr [rax + rax + 0x1500152c]
0143c be45ffffff                     mov        esi, 0xffffff45
01441 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01446 48894424f8                     mov        qword ptr [rsp - 8], rax
0144b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0144f 89442408                       mov        dword ptr [rsp + 8], eax
01453 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01458 48ff742420                     push       qword ptr [rsp + 0x20]
0145d 488f442418                     pop        qword ptr [rsp + 0x18]
01462 48894424f8                     mov        qword ptr [rsp - 8], rax
01467 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0146b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0146f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01474 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01479 48894424f8                     mov        qword ptr [rsp - 8], rax
0147e 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01482 89442438                       mov        dword ptr [rsp + 0x38], eax
01486 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0148b 48ff742460                     push       qword ptr [rsp + 0x60]
01490 488f442440                     pop        qword ptr [rsp + 0x40]
01495 48894424f8                     mov        qword ptr [rsp - 8], rax
0149a 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0149e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
014a2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014a7 48ff742468                     push       qword ptr [rsp + 0x68]
014ac 488f442450                     pop        qword ptr [rsp + 0x50]
014b1 48894424f8                     mov        qword ptr [rsp - 8], rax
014b6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
014ba 89442460                       mov        dword ptr [rsp + 0x60], eax
014be 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c3 894c2464                       mov        dword ptr [rsp + 0x64], ecx
014c7 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
014cc c5f877                         vzeroupper 
014cf e88cceacff                     call       0x7fd1c3943760
014d4 0f1f8400cc150016               nop        dword ptr [rax + rax + 0x160015cc]
014dc be45ffffff                     mov        esi, 0xffffff45
014e1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014e6 48894424f8                     mov        qword ptr [rsp - 8], rax
014eb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014ef 89442408                       mov        dword ptr [rsp + 8], eax
014f3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014f8 48ff742420                     push       qword ptr [rsp + 0x20]
014fd 488f442418                     pop        qword ptr [rsp + 0x18]
01502 48894424f8                     mov        qword ptr [rsp - 8], rax
01507 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0150b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0150f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01514 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01519 48894424f8                     mov        qword ptr [rsp - 8], rax
0151e 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01522 89442438                       mov        dword ptr [rsp + 0x38], eax
01526 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0152b 48ff742460                     push       qword ptr [rsp + 0x60]
01530 488f442440                     pop        qword ptr [rsp + 0x40]
01535 48894424f8                     mov        qword ptr [rsp - 8], rax
0153a 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0153e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01542 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01547 48ff742468                     push       qword ptr [rsp + 0x68]
0154c 488f442450                     pop        qword ptr [rsp + 0x50]
01551 48894424f8                     mov        qword ptr [rsp - 8], rax
01556 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0155a 89442458                       mov        dword ptr [rsp + 0x58], eax
0155e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01563 48894424f8                     mov        qword ptr [rsp - 8], rax
01568 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0156c 89442460                       mov        dword ptr [rsp + 0x60], eax
01570 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01575 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01579 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0157e 6690                           nop        
01580 c5f877                         vzeroupper 
01583 e8d8cdacff                     call       0x7fd1c3943760
01588 0f1f840080160017               nop        dword ptr [rax + rax + 0x17001680]
01590 be45ffffff                     mov        esi, 0xffffff45
01595 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0159a 48894424f8                     mov        qword ptr [rsp - 8], rax
0159f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
015a3 89442408                       mov        dword ptr [rsp + 8], eax
015a7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015ac 48ff742420                     push       qword ptr [rsp + 0x20]
015b1 488f442418                     pop        qword ptr [rsp + 0x18]
015b6 48894424f8                     mov        qword ptr [rsp - 8], rax
015bb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
015bf 8944240c                       mov        dword ptr [rsp + 0xc], eax
015c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015c8 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
015cd 48894424f8                     mov        qword ptr [rsp - 8], rax
015d2 8b442458                       mov        eax, dword ptr [rsp + 0x58]
015d6 89442438                       mov        dword ptr [rsp + 0x38], eax
015da 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015df 48ff742460                     push       qword ptr [rsp + 0x60]
015e4 488f442440                     pop        qword ptr [rsp + 0x40]
015e9 48894424f8                     mov        qword ptr [rsp - 8], rax
015ee 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
015f2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015fb 48ff742468                     push       qword ptr [rsp + 0x68]
01600 488f442450                     pop        qword ptr [rsp + 0x50]
01605 48894424f8                     mov        qword ptr [rsp - 8], rax
0160a 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0160e 89442460                       mov        dword ptr [rsp + 0x60], eax
01612 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01617 894c2470                       mov        dword ptr [rsp + 0x70], ecx
0161b 90                             nop        
0161c c5f877                         vzeroupper 
0161f e83ccdacff                     call       0x7fd1c3943760
01624 0f1f84001c170018               nop        dword ptr [rax + rax + 0x1800171c]
0162c be45ffffff                     mov        esi, 0xffffff45
01631 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01636 48894424f8                     mov        qword ptr [rsp - 8], rax
0163b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0163f 89442408                       mov        dword ptr [rsp + 8], eax
01643 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01648 48ff742420                     push       qword ptr [rsp + 0x20]
0164d 488f442418                     pop        qword ptr [rsp + 0x18]
01652 48894424f8                     mov        qword ptr [rsp - 8], rax
01657 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0165b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0165f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01664 48894424f8                     mov        qword ptr [rsp - 8], rax
01669 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0166d 89442434                       mov        dword ptr [rsp + 0x34], eax
01671 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01676 48894424f8                     mov        qword ptr [rsp - 8], rax
0167b 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0167f 89442438                       mov        dword ptr [rsp + 0x38], eax
01683 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01688 48ff742460                     push       qword ptr [rsp + 0x60]
0168d 488f442440                     pop        qword ptr [rsp + 0x40]
01692 48894424f8                     mov        qword ptr [rsp - 8], rax
01697 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0169b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0169f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016a4 48ff742468                     push       qword ptr [rsp + 0x68]
016a9 488f442450                     pop        qword ptr [rsp + 0x50]
016ae 48894424f8                     mov        qword ptr [rsp - 8], rax
016b3 8b442470                       mov        eax, dword ptr [rsp + 0x70]
016b7 89442460                       mov        dword ptr [rsp + 0x60], eax
016bb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
016c0 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
016c5 666690                         nop        
016c8 c5f877                         vzeroupper 
016cb e890ccacff                     call       0x7fd1c3943760
016d0 0f1f8400c8170019               nop        dword ptr [rax + rax + 0x190017c8]
016d8 4533d2                         xor        r10d, r10d
016db 4c89542408                     mov        qword ptr [rsp + 8], r10
016e0 e94deaffff                     jmp        0x7fd1c3e75532
016e5 4533d2                         xor        r10d, r10d
016e8 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
016f0 e966eaffff                     jmp        0x7fd1c3e7555b
016f5 4533d2                         xor        r10d, r10d
016f8 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
01700 e986eaffff                     jmp        0x7fd1c3e7558b
01705 4533d2                         xor        r10d, r10d
01708 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0170d e9a1eaffff                     jmp        0x7fd1c3e755b3
01712 4533d2                         xor        r10d, r10d
01715 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
0171d e9c1eaffff                     jmp        0x7fd1c3e755e3
01722 4533d2                         xor        r10d, r10d
01725 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0172d e9dceaffff                     jmp        0x7fd1c3e7560e
01732 bebeffffff                     mov        esi, 0xffffffbe
01737 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0173c 48894424f8                     mov        qword ptr [rsp - 8], rax
01741 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01745 89442408                       mov        dword ptr [rsp + 8], eax
01749 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174e 48ff742420                     push       qword ptr [rsp + 0x20]
01753 488f442418                     pop        qword ptr [rsp + 0x18]
01758 48894424f8                     mov        qword ptr [rsp - 8], rax
0175d 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01761 8944240c                       mov        dword ptr [rsp + 0xc], eax
01765 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0176a 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0176f 48894424f8                     mov        qword ptr [rsp - 8], rax
01774 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01778 89442438                       mov        dword ptr [rsp + 0x38], eax
0177c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01781 48ff742460                     push       qword ptr [rsp + 0x60]
01786 488f442440                     pop        qword ptr [rsp + 0x40]
0178b 48894424f8                     mov        qword ptr [rsp - 8], rax
01790 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01794 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01798 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0179d 666690                         nop        
017a0 c5f877                         vzeroupper 
017a3 e8b8cbacff                     call       0x7fd1c3943760
017a8 0f1f8400a018001a               nop        dword ptr [rax + rax + 0x1a0018a0]
017b0 be85ffffff                     mov        esi, 0xffffff85
017b5 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
017b9 48894424f8                     mov        qword ptr [rsp - 8], rax
017be 8b442428                       mov        eax, dword ptr [rsp + 0x28]
017c2 890424                         mov        dword ptr [rsp], eax
017c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ca 44896c2408                     mov        dword ptr [rsp + 8], r13d
017cf 48894424f8                     mov        qword ptr [rsp - 8], rax
017d4 8b442458                       mov        eax, dword ptr [rsp + 0x58]
017d8 8944240c                       mov        dword ptr [rsp + 0xc], eax
017dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e1 48ff742460                     push       qword ptr [rsp + 0x60]
017e6 488f442410                     pop        qword ptr [rsp + 0x10]
017eb 48894424f8                     mov        qword ptr [rsp - 8], rax
017f0 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
017f4 89442418                       mov        dword ptr [rsp + 0x18], eax
017f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fd 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
01802 4c89742460                     mov        qword ptr [rsp + 0x60], r14
01807 90                             nop        
01808 c5f877                         vzeroupper 
0180b e850cbacff                     call       0x7fd1c3943760
01810 0f1f84000819001b               nop        dword ptr [rax + rax + 0x1b001908]
01818 bee4ffffff                     mov        esi, 0xffffffe4
0181d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01822 48894424f8                     mov        qword ptr [rsp - 8], rax
01827 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0182b 89442408                       mov        dword ptr [rsp + 8], eax
0182f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01834 48ff742420                     push       qword ptr [rsp + 0x20]
01839 488f442418                     pop        qword ptr [rsp + 0x18]
0183e 48894424f8                     mov        qword ptr [rsp - 8], rax
01843 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01847 8944240c                       mov        dword ptr [rsp + 0xc], eax
0184b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01850 48894424f8                     mov        qword ptr [rsp - 8], rax
01855 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01859 89442430                       mov        dword ptr [rsp + 0x30], eax
0185d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01862 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01867 48894424f8                     mov        qword ptr [rsp - 8], rax
0186c 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01870 89442438                       mov        dword ptr [rsp + 0x38], eax
01874 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01879 48ff742460                     push       qword ptr [rsp + 0x60]
0187e 488f442440                     pop        qword ptr [rsp + 0x40]
01883 48894424f8                     mov        qword ptr [rsp - 8], rax
01888 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0188c 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01890 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01895 48ffb42480000000               push       qword ptr [rsp + 0x80]
0189d 488f442448                     pop        qword ptr [rsp + 0x48]
018a2 48ff742468                     push       qword ptr [rsp + 0x68]
018a7 488f442450                     pop        qword ptr [rsp + 0x50]
018ac 48894424f8                     mov        qword ptr [rsp - 8], rax
018b1 8b442474                       mov        eax, dword ptr [rsp + 0x74]
018b5 89442458                       mov        dword ptr [rsp + 0x58], eax
018b9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018be 48894424f8                     mov        qword ptr [rsp - 8], rax
018c3 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
018c7 8944245c                       mov        dword ptr [rsp + 0x5c], eax
018cb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d0 48894424f8                     mov        qword ptr [rsp - 8], rax
018d5 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018d9 89442460                       mov        dword ptr [rsp + 0x60], eax
018dd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018e2 894c2464                       mov        dword ptr [rsp + 0x64], ecx
018e6 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
018ee 6690                           nop        
018f0 c5f877                         vzeroupper 
018f3 e868caacff                     call       0x7fd1c3943760
018f8 0f1f8400f019001c               nop        dword ptr [rax + rax + 0x1c0019f0]
01900 bef6ffffff                     mov        esi, 0xfffffff6
01905 666690                         nop        
01908 c5f877                         vzeroupper 
0190b e850caacff                     call       0x7fd1c3943760
01910 0f1f8400081a001d               nop        dword ptr [rax + rax + 0x1d001a08]
01918 bee4ffffff                     mov        esi, 0xffffffe4
0191d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01922 48ffb42488000000               push       qword ptr [rsp + 0x88]
0192a 488f0424                       pop        qword ptr [rsp]
0192e 48894424f8                     mov        qword ptr [rsp - 8], rax
01933 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01937 89442408                       mov        dword ptr [rsp + 8], eax
0193b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01940 48ff742420                     push       qword ptr [rsp + 0x20]
01945 488f442418                     pop        qword ptr [rsp + 0x18]
0194a 48894424f8                     mov        qword ptr [rsp - 8], rax
0194f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01953 8944240c                       mov        dword ptr [rsp + 0xc], eax
01957 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0195c 48894424f8                     mov        qword ptr [rsp - 8], rax
01961 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01968 89442430                       mov        dword ptr [rsp + 0x30], eax
0196c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01971 48894424f8                     mov        qword ptr [rsp - 8], rax
01976 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0197a 89442434                       mov        dword ptr [rsp + 0x34], eax
0197e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01983 48894424f8                     mov        qword ptr [rsp - 8], rax
01988 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0198c 89442438                       mov        dword ptr [rsp + 0x38], eax
01990 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01995 48ff742460                     push       qword ptr [rsp + 0x60]
0199a 488f442440                     pop        qword ptr [rsp + 0x40]
0199f 48894424f8                     mov        qword ptr [rsp - 8], rax
019a4 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
019a8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
019ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b1 48ffb42480000000               push       qword ptr [rsp + 0x80]
019b9 488f442448                     pop        qword ptr [rsp + 0x48]
019be 48ff742468                     push       qword ptr [rsp + 0x68]
019c3 488f442450                     pop        qword ptr [rsp + 0x50]
019c8 48894424f8                     mov        qword ptr [rsp - 8], rax
019cd 8b442474                       mov        eax, dword ptr [rsp + 0x74]
019d1 89442458                       mov        dword ptr [rsp + 0x58], eax
019d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019da 48894424f8                     mov        qword ptr [rsp - 8], rax
019df 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
019e3 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ec 48894424f8                     mov        qword ptr [rsp - 8], rax
019f1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019f5 89442460                       mov        dword ptr [rsp + 0x60], eax
019f9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01a03 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01a07 89442468                       mov        dword ptr [rsp + 0x68], eax
01a0b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a10 4489842488000000               mov        dword ptr [rsp + 0x88], r8d
01a18 c5f877                         vzeroupper 
01a1b e840c9acff                     call       0x7fd1c3943760
01a20 0f1f8400181b001e               nop        dword ptr [rax + rax + 0x1e001b18]
01a28 bee4ffffff                     mov        esi, 0xffffffe4
01a2d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01a32 48ffb42488000000               push       qword ptr [rsp + 0x88]
01a3a 488f0424                       pop        qword ptr [rsp]
01a3e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a43 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a47 89442408                       mov        dword ptr [rsp + 8], eax
01a4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a50 48ff742420                     push       qword ptr [rsp + 0x20]
01a55 488f442418                     pop        qword ptr [rsp + 0x18]
01a5a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a5f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a63 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a71 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01a75 89442434                       mov        dword ptr [rsp + 0x34], eax
01a79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01a83 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01a87 89442438                       mov        dword ptr [rsp + 0x38], eax
01a8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a90 48ff742460                     push       qword ptr [rsp + 0x60]
01a95 488f442440                     pop        qword ptr [rsp + 0x40]
01a9a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a9f 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01aa3 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01aa7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aac 48ffb42480000000               push       qword ptr [rsp + 0x80]
01ab4 488f442448                     pop        qword ptr [rsp + 0x48]
01ab9 48ff742468                     push       qword ptr [rsp + 0x68]
01abe 488f442450                     pop        qword ptr [rsp + 0x50]
01ac3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ac8 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01acc 89442458                       mov        dword ptr [rsp + 0x58], eax
01ad0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad5 48894424f8                     mov        qword ptr [rsp - 8], rax
01ada 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01ade 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01ae2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae7 48894424f8                     mov        qword ptr [rsp - 8], rax
01aec 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01af0 89442460                       mov        dword ptr [rsp + 0x60], eax
01af4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af9 48894424f8                     mov        qword ptr [rsp - 8], rax
01afe 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01b02 89442468                       mov        dword ptr [rsp + 0x68], eax
01b06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b0b 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
01b10 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
01b15 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
01b1d 666690                         nop        
01b20 c5f877                         vzeroupper 
01b23 e838c8acff                     call       0x7fd1c3943760
01b28 0f1f8400201c001f               nop        dword ptr [rax + rax + 0x1f001c20]
01b30 beccffffff                     mov        esi, 0xffffffcc
01b35 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b3f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b43 89442408                       mov        dword ptr [rsp + 8], eax
01b47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b4c 48ff742420                     push       qword ptr [rsp + 0x20]
01b51 488f442418                     pop        qword ptr [rsp + 0x18]
01b56 48894424f8                     mov        qword ptr [rsp - 8], rax
01b5b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b5f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b68 48894424f8                     mov        qword ptr [rsp - 8], rax
01b6d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b74 89442430                       mov        dword ptr [rsp + 0x30], eax
01b78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01b82 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01b86 89442434                       mov        dword ptr [rsp + 0x34], eax
01b8a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b8f 48894424f8                     mov        qword ptr [rsp - 8], rax
01b94 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01b98 89442438                       mov        dword ptr [rsp + 0x38], eax
01b9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ba1 48ff742460                     push       qword ptr [rsp + 0x60]
01ba6 488f442440                     pop        qword ptr [rsp + 0x40]
01bab 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb0 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01bb4 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01bb8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bbd 48ffb42480000000               push       qword ptr [rsp + 0x80]
01bc5 488f442448                     pop        qword ptr [rsp + 0x48]
01bca 48ff742468                     push       qword ptr [rsp + 0x68]
01bcf 488f442450                     pop        qword ptr [rsp + 0x50]
01bd4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bd9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01bdd 89442458                       mov        dword ptr [rsp + 0x58], eax
01be1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01be6 48894424f8                     mov        qword ptr [rsp - 8], rax
01beb 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01bef 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01bf3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bfd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c01 89442460                       mov        dword ptr [rsp + 0x60], eax
01c05 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c0a 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01c11 666690                         nop        
01c14 c5f877                         vzeroupper 
01c17 e844c7acff                     call       0x7fd1c3943760
01c1c 0f1f8400141d0020               nop        dword ptr [rax + rax + 0x20001d14]
01c24 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01c2c 458d5308                       lea        r10d, [r11 + 8]
01c30 be6effffff                     mov        esi, 0xffffff6e
01c35 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01c3a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c3f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c43 89442408                       mov        dword ptr [rsp + 8], eax
01c47 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c4c 48ff742420                     push       qword ptr [rsp + 0x20]
01c51 488f442418                     pop        qword ptr [rsp + 0x18]
01c56 48894424f8                     mov        qword ptr [rsp - 8], rax
01c5b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c5f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c68 48894424f8                     mov        qword ptr [rsp - 8], rax
01c6d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01c71 89442434                       mov        dword ptr [rsp + 0x34], eax
01c75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c7a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c7f 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01c83 89442438                       mov        dword ptr [rsp + 0x38], eax
01c87 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c8c 48ff742460                     push       qword ptr [rsp + 0x60]
01c91 488f442440                     pop        qword ptr [rsp + 0x40]
01c96 48894424f8                     mov        qword ptr [rsp - 8], rax
01c9b 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01c9f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01ca3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca8 48ff742468                     push       qword ptr [rsp + 0x68]
01cad 488f442450                     pop        qword ptr [rsp + 0x50]
01cb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01cb7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01cbb 89442458                       mov        dword ptr [rsp + 0x58], eax
01cbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01cc9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01ccd 89442460                       mov        dword ptr [rsp + 0x60], eax
01cd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cd6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cdb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01cdf 89442468                       mov        dword ptr [rsp + 0x68], eax
01ce3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ce8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01ced 48894424f8                     mov        qword ptr [rsp - 8], rax
01cf2 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01cf9 89442474                       mov        dword ptr [rsp + 0x74], eax
01cfd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d02 6690                           nop        
01d04 c5f877                         vzeroupper 
01d07 e854c6acff                     call       0x7fd1c3943760
01d0c 0f1f8400041e0021               nop        dword ptr [rax + rax + 0x21001e04]
01d14 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01d1c 458d5308                       lea        r10d, [r11 + 8]
01d20 be66ffffff                     mov        esi, 0xffffff66
01d25 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01d2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01d33 89442408                       mov        dword ptr [rsp + 8], eax
01d37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3c 48ff742420                     push       qword ptr [rsp + 0x20]
01d41 488f442418                     pop        qword ptr [rsp + 0x18]
01d46 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d4f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d58 48894424f8                     mov        qword ptr [rsp - 8], rax
01d5d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01d61 89442434                       mov        dword ptr [rsp + 0x34], eax
01d65 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d6a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6f 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01d73 89442438                       mov        dword ptr [rsp + 0x38], eax
01d77 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7c 48ff742460                     push       qword ptr [rsp + 0x60]
01d81 488f442440                     pop        qword ptr [rsp + 0x40]
01d86 48894424f8                     mov        qword ptr [rsp - 8], rax
01d8b 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01d8f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d98 48ff742468                     push       qword ptr [rsp + 0x68]
01d9d 488f442450                     pop        qword ptr [rsp + 0x50]
01da2 48894424f8                     mov        qword ptr [rsp - 8], rax
01da7 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01dab 89442458                       mov        dword ptr [rsp + 0x58], eax
01daf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01db4 48894424f8                     mov        qword ptr [rsp - 8], rax
01db9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01dbd 89442460                       mov        dword ptr [rsp + 0x60], eax
01dc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dc6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dcb 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01dcf 89442468                       mov        dword ptr [rsp + 0x68], eax
01dd3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dd8 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01ddd 48894424f8                     mov        qword ptr [rsp - 8], rax
01de2 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01de9 89442474                       mov        dword ptr [rsp + 0x74], eax
01ded 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01df2 6690                           nop        
01df4 c5f877                         vzeroupper 
01df7 e864c5acff                     call       0x7fd1c3943760
01dfc 0f1f8400f41e0022               nop        dword ptr [rax + rax + 0x22001ef4]
01e04 be6effffff                     mov        esi, 0xffffff6e
01e09 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01e0e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e13 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01e17 89442408                       mov        dword ptr [rsp + 8], eax
01e1b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e20 48ff742420                     push       qword ptr [rsp + 0x20]
01e25 488f442418                     pop        qword ptr [rsp + 0x18]
01e2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e2f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01e33 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e37 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e3c 48894424f8                     mov        qword ptr [rsp - 8], rax
01e41 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e45 89442430                       mov        dword ptr [rsp + 0x30], eax
01e49 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4e 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01e53 48894424f8                     mov        qword ptr [rsp - 8], rax
01e58 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01e5c 89442438                       mov        dword ptr [rsp + 0x38], eax
01e60 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e65 48ff742460                     push       qword ptr [rsp + 0x60]
01e6a 488f442440                     pop        qword ptr [rsp + 0x40]
01e6f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e74 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01e78 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e81 48ff742468                     push       qword ptr [rsp + 0x68]
01e86 488f442450                     pop        qword ptr [rsp + 0x50]
01e8b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e90 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e94 89442458                       mov        dword ptr [rsp + 0x58], eax
01e98 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9d 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea2 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01ea6 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01eaa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eaf 48894424f8                     mov        qword ptr [rsp - 8], rax
01eb4 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01eb8 89442460                       mov        dword ptr [rsp + 0x60], eax
01ebc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ec1 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01ec5 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01eca 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01ecf 90                             nop        
01ed0 c5f877                         vzeroupper 
01ed3 e888c4acff                     call       0x7fd1c3943760
01ed8 0f1f8400d01f0023               nop        dword ptr [rax + rax + 0x23001fd0]
01ee0 bee4ffffff                     mov        esi, 0xffffffe4
01ee5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01eea 48ffb42488000000               push       qword ptr [rsp + 0x88]
01ef2 488f0424                       pop        qword ptr [rsp]
01ef6 48894424f8                     mov        qword ptr [rsp - 8], rax
01efb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01eff 89442408                       mov        dword ptr [rsp + 8], eax
01f03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f08 48ff742420                     push       qword ptr [rsp + 0x20]
01f0d 488f442418                     pop        qword ptr [rsp + 0x18]
01f12 48894424f8                     mov        qword ptr [rsp - 8], rax
01f17 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01f1b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01f1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f24 48894424f8                     mov        qword ptr [rsp - 8], rax
01f29 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01f2d 89442430                       mov        dword ptr [rsp + 0x30], eax
01f31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f36 48894424f8                     mov        qword ptr [rsp - 8], rax
01f3b 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01f3f 89442434                       mov        dword ptr [rsp + 0x34], eax
01f43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f48 48ff742460                     push       qword ptr [rsp + 0x60]
01f4d 488f442438                     pop        qword ptr [rsp + 0x38]
01f52 48894424f8                     mov        qword ptr [rsp - 8], rax
01f57 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01f5b 89442440                       mov        dword ptr [rsp + 0x40], eax
01f5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f64 48ffb42480000000               push       qword ptr [rsp + 0x80]
01f6c 488f442448                     pop        qword ptr [rsp + 0x48]
01f71 48ff742468                     push       qword ptr [rsp + 0x68]
01f76 488f442450                     pop        qword ptr [rsp + 0x50]
01f7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f80 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01f84 89442444                       mov        dword ptr [rsp + 0x44], eax
01f88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f8d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f92 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01f96 89442458                       mov        dword ptr [rsp + 0x58], eax
01f9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01fa4 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01fa8 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01fac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fb1 48894424f8                     mov        qword ptr [rsp - 8], rax
01fb6 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01fbd 89442468                       mov        dword ptr [rsp + 0x68], eax
01fc1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fc6 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01fce 6690                           nop        
01fd0 c5f877                         vzeroupper 
01fd3 e888c3acff                     call       0x7fd1c3943760
01fd8 0f1f8400d0200024               nop        dword ptr [rax + rax + 0x240020d0]
01fe0 bee4ffffff                     mov        esi, 0xffffffe4
01fe5 48ff742408                     push       qword ptr [rsp + 8]
01fea 488f0424                       pop        qword ptr [rsp]
01fee 48ffb42488000000               push       qword ptr [rsp + 0x88]
01ff6 488f442408                     pop        qword ptr [rsp + 8]
01ffb 48894424f8                     mov        qword ptr [rsp - 8], rax
02000 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02004 89442414                       mov        dword ptr [rsp + 0x14], eax
02008 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0200d 48894424f8                     mov        qword ptr [rsp - 8], rax
02012 8b442458                       mov        eax, dword ptr [rsp + 0x58]
02016 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0201a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0201f 48ff742460                     push       qword ptr [rsp + 0x60]
02024 488f442440                     pop        qword ptr [rsp + 0x40]
02029 48894424f8                     mov        qword ptr [rsp - 8], rax
0202e 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02032 89442448                       mov        dword ptr [rsp + 0x48], eax
02036 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0203b 48ffb42480000000               push       qword ptr [rsp + 0x80]
02043 488f442450                     pop        qword ptr [rsp + 0x50]
02048 48ff742468                     push       qword ptr [rsp + 0x68]
0204d 488f442458                     pop        qword ptr [rsp + 0x58]
02052 48894424f8                     mov        qword ptr [rsp - 8], rax
02057 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0205b 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0205f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02064 48894424f8                     mov        qword ptr [rsp - 8], rax
02069 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
0206d 89442460                       mov        dword ptr [rsp + 0x60], eax
02071 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02076 48894424f8                     mov        qword ptr [rsp - 8], rax
0207b 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0207f 89442464                       mov        dword ptr [rsp + 0x64], eax
02083 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02088 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
02090 c5f877                         vzeroupper 
02093 e8c8c2acff                     call       0x7fd1c3943760
02098 0f1f840090210025               nop        dword ptr [rax + rax + 0x25002190]
020a0 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
020a7 ffc5                           inc        ebp
020a9 bee4ffffff                     mov        esi, 0xffffffe4
020ae 48ff742408                     push       qword ptr [rsp + 8]
020b3 488f0424                       pop        qword ptr [rsp]
020b7 48ffb42488000000               push       qword ptr [rsp + 0x88]
020bf 488f442408                     pop        qword ptr [rsp + 8]
020c4 48ffb42490000000               push       qword ptr [rsp + 0x90]
020cc 488f442418                     pop        qword ptr [rsp + 0x18]
020d1 48894424f8                     mov        qword ptr [rsp - 8], rax
020d6 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020da 89442414                       mov        dword ptr [rsp + 0x14], eax
020de 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020e3 48894424f8                     mov        qword ptr [rsp - 8], rax
020e8 8b442458                       mov        eax, dword ptr [rsp + 0x58]
020ec 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020f0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020f5 48ff742460                     push       qword ptr [rsp + 0x60]
020fa 488f442440                     pop        qword ptr [rsp + 0x40]
020ff 48894424f8                     mov        qword ptr [rsp - 8], rax
02104 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02108 89442448                       mov        dword ptr [rsp + 0x48], eax
0210c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02111 48ffb42480000000               push       qword ptr [rsp + 0x80]
02119 488f442450                     pop        qword ptr [rsp + 0x50]
0211e 48ff742468                     push       qword ptr [rsp + 0x68]
02123 488f442458                     pop        qword ptr [rsp + 0x58]
02128 48894424f8                     mov        qword ptr [rsp - 8], rax
0212d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02131 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02135 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0213a 48894424f8                     mov        qword ptr [rsp - 8], rax
0213f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02143 89442460                       mov        dword ptr [rsp + 0x60], eax
02147 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0214c 48894424f8                     mov        qword ptr [rsp - 8], rax
02151 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02155 89442464                       mov        dword ptr [rsp + 0x64], eax
02159 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0215e 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
02166 6690                           nop        
02168 c5f877                         vzeroupper 
0216b e8f0c1acff                     call       0x7fd1c3943760
02170 0f1f840068220026               nop        dword ptr [rax + rax + 0x26002268]
02178 bee4ffffff                     mov        esi, 0xffffffe4
0217d 48ff742408                     push       qword ptr [rsp + 8]
02182 488f0424                       pop        qword ptr [rsp]
02186 48ffb42488000000               push       qword ptr [rsp + 0x88]
0218e 488f442408                     pop        qword ptr [rsp + 8]
02193 48894424f8                     mov        qword ptr [rsp - 8], rax
02198 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0219c 89442414                       mov        dword ptr [rsp + 0x14], eax
021a0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021a5 48894424f8                     mov        qword ptr [rsp - 8], rax
021aa 8b442458                       mov        eax, dword ptr [rsp + 0x58]
021ae 8944243c                       mov        dword ptr [rsp + 0x3c], eax
021b2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021b7 48ff742460                     push       qword ptr [rsp + 0x60]
021bc 488f442440                     pop        qword ptr [rsp + 0x40]
021c1 48894424f8                     mov        qword ptr [rsp - 8], rax
021c6 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
021ca 89442448                       mov        dword ptr [rsp + 0x48], eax
021ce 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021d3 48ffb42480000000               push       qword ptr [rsp + 0x80]
021db 488f442450                     pop        qword ptr [rsp + 0x50]
021e0 48ff742468                     push       qword ptr [rsp + 0x68]
021e5 488f442458                     pop        qword ptr [rsp + 0x58]
021ea 48894424f8                     mov        qword ptr [rsp - 8], rax
021ef 8b442474                       mov        eax, dword ptr [rsp + 0x74]
021f3 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021f7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021fc 48894424f8                     mov        qword ptr [rsp - 8], rax
02201 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02205 89442460                       mov        dword ptr [rsp + 0x60], eax
02209 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0220e 48894424f8                     mov        qword ptr [rsp - 8], rax
02213 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02217 89442464                       mov        dword ptr [rsp + 0x64], eax
0221b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02220 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
02228 c5f877                         vzeroupper 
0222b e830c1acff                     call       0x7fd1c3943760
02230 0f1f840028230027               nop        dword ptr [rax + rax + 0x27002328]
02238 bee4ffffff                     mov        esi, 0xffffffe4
0223d 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
02242 48894424f8                     mov        qword ptr [rsp - 8], rax
02247 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0224b 89442408                       mov        dword ptr [rsp + 8], eax
0224f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02254 48ff742420                     push       qword ptr [rsp + 0x20]
02259 488f442418                     pop        qword ptr [rsp + 0x18]
0225e 48894424f8                     mov        qword ptr [rsp - 8], rax
02263 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02267 8944240c                       mov        dword ptr [rsp + 0xc], eax
0226b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02270 48894424f8                     mov        qword ptr [rsp - 8], rax
02275 8b442438                       mov        eax, dword ptr [rsp + 0x38]
02279 89442430                       mov        dword ptr [rsp + 0x30], eax
0227d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02282 48894424f8                     mov        qword ptr [rsp - 8], rax
02287 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0228b 89442434                       mov        dword ptr [rsp + 0x34], eax
0228f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02294 48ff742460                     push       qword ptr [rsp + 0x60]
02299 488f442438                     pop        qword ptr [rsp + 0x38]
0229e 48894424f8                     mov        qword ptr [rsp - 8], rax
022a3 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
022a7 89442440                       mov        dword ptr [rsp + 0x40], eax
022ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022b0 48ff742468                     push       qword ptr [rsp + 0x68]
022b5 488f442450                     pop        qword ptr [rsp + 0x50]
022ba 48894424f8                     mov        qword ptr [rsp - 8], rax
022bf 8b442474                       mov        eax, dword ptr [rsp + 0x74]
022c3 89442444                       mov        dword ptr [rsp + 0x44], eax
022c7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022cc 48894424f8                     mov        qword ptr [rsp - 8], rax
022d1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
022d5 8944245c                       mov        dword ptr [rsp + 0x5c], eax
022d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022de 6690                           nop        
022e0 c5f877                         vzeroupper 
022e3 e878c0acff                     call       0x7fd1c3943760
022e8 0f1f8400e0230028               nop        dword ptr [rax + rax + 0x280023e0]
022f0 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
022f5 beccffffff                     mov        esi, 0xffffffcc
022fa 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
022ff 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
02304 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02309 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0230e 6690                           nop        
02310 c5f877                         vzeroupper 
02313 e848c0acff                     call       0x7fd1c3943760
02318 0f1f840010240029               nop        dword ptr [rax + rax + 0x29002410]
02320 eb10                           jmp        0x7fd1c3e77732
02322 eb0e                           jmp        0x7fd1c3e77732
02324 eb0c                           jmp        0x7fd1c3e77732
02326 eb0a                           jmp        0x7fd1c3e77732
02328 eb08                           jmp        0x7fd1c3e77732
0232a eb06                           jmp        0x7fd1c3e77732
0232c eb04                           jmp        0x7fd1c3e77732
0232e eb02                           jmp        0x7fd1c3e77732
02330 eb00                           jmp        0x7fd1c3e77732
02332 488bf0                         mov        rsi, rax
02335 e90ee3ffff                     jmp        0x7fd1c3e75a48
0233a bef6ffffff                     mov        esi, 0xfffffff6
0233f 90                             nop        
02340 c5f877                         vzeroupper 
02343 e818c0acff                     call       0x7fd1c3943760
02348 0f1f84004024002a               nop        dword ptr [rax + rax + 0x2a002440]
02350 49ba0662e7c3d17f0000           movabs     r10, 0x7fd1c3e76206
0235a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02361 e97ab7a9ff                     jmp        0x7fd1c3912ee0
02366 e83583a8ff                     call       0x7fd1c38ffaa0
0236b e9bedcffff                     jmp        0x7fd1c3e7542e
