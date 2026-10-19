00000 e8fbd4d217                     call       0x7fa893ba2880
00005 6666660f1f840000000000         nop        word ptr [rax + rax]
00010 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00017 55                             push       rbp
00018 4881ece0000000                 sub        rsp, 0xe0
0001f 90                             nop        
00020 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00028 0f8504230000                   jne        0x7fa87be776b2
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
000f7 49ba4018c893a87f0000           movabs     r10, 0x7fa893c81840
00101 41ffd2                         call       r10
00104 0f1f840000000000               nop        dword ptr [rax + rax]
0010c 4885db                         test       rbx, rbx
0010f 0f848f150000                   je         0x7fa87be76a24
00115 448b5b04                       mov        r11d, dword ptr [rbx + 4]
00119 41c1eb0a                       shr        r11d, 0xa
0011d 4181fb0c080000                 cmp        r11d, 0x80c
00124 0f8552160000                   jne        0x7fa87be76afc
0012a 4c8bd3                         mov        r10, rbx
0012d 4c89542408                     mov        qword ptr [rsp + 8], r10
00132 4d85f6                         test       r14, r14
00135 0f8476150000                   je         0x7fa87be76a31
0013b 458b5604                       mov        r10d, dword ptr [r14 + 4]
0013f 41c1ea0a                       shr        r10d, 0xa
00143 4181fa05020000                 cmp        r10d, 0x205
0014a 0f852c160000                   jne        0x7fa87be76afc
00150 4d8bd6                         mov        r10, r14
00153 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0015b 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00160 4d85d2                         test       r10, r10
00163 0f8458150000                   je         0x7fa87be76a41
00169 458b5204                       mov        r10d, dword ptr [r10 + 4]
0016d 41c1ea0a                       shr        r10d, 0xa
00171 4181fa08020000                 cmp        r10d, 0x208
00178 0f85fe150000                   jne        0x7fa87be76afc
0017e 4c8b542438                     mov        r10, qword ptr [rsp + 0x38]
00183 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
0018b 4c8b542440                     mov        r10, qword ptr [rsp + 0x40]
00190 4d85d2                         test       r10, r10
00193 0f8438150000                   je         0x7fa87be76a51
00199 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0019d 41c1eb0a                       shr        r11d, 0xa
001a1 4181fb07020000                 cmp        r11d, 0x207
001a8 0f85ce150000                   jne        0x7fa87be76afc
001ae 4c89542420                     mov        qword ptr [rsp + 0x20], r10
001b3 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001b8 4d85d2                         test       r10, r10
001bb 0f841d150000                   je         0x7fa87be76a5e
001c1 458b5204                       mov        r10d, dword ptr [r10 + 4]
001c5 41c1ea0a                       shr        r10d, 0xa
001c9 4181fa07020000                 cmp        r10d, 0x207
001d0 0f85a6150000                   jne        0x7fa87be76afc
001d6 4c8b542448                     mov        r10, qword ptr [rsp + 0x48]
001db 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
001e3 4c8b542450                     mov        r10, qword ptr [rsp + 0x50]
001e8 4d85d2                         test       r10, r10
001eb 0f84fd140000                   je         0x7fa87be76a6e
001f1 458b5a04                       mov        r11d, dword ptr [r10 + 4]
001f5 41c1eb0a                       shr        r11d, 0xa
001f9 4181fb05020000                 cmp        r11d, 0x205
00200 0f8576150000                   jne        0x7fa87be76afc
00206 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
0020e 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00216 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0021a 44895c2404                     mov        dword ptr [rsp + 4], r11d
0021f 448b5c245c                     mov        r11d, dword ptr [rsp + 0x5c]
00224 4585db                         test       r11d, r11d
00227 0f84d1140000                   je         0x7fa87be76a7e
0022d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00235 458b5208                       mov        r10d, dword ptr [r10 + 8]
00239 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0023e 458d5af1                       lea        r11d, [r10 - 0xf]
00242 4585db                         test       r11d, r11d
00245 0f8cb3140000                   jl         0x7fa87be76a7e
0024b 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00253 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00257 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0025c 458d53f1                       lea        r10d, [r11 - 0xf]
00260 4585d2                         test       r10d, r10d
00263 0f8c95140000                   jl         0x7fa87be76a7e
00269 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00271 458b5208                       mov        r10d, dword ptr [r10 + 8]
00275 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0027a 4585d2                         test       r10d, r10d
0027d 0f867b140000                   jbe        0x7fa87be76a7e
00283 4183fa01                       cmp        r10d, 1
00287 0f8671140000                   jbe        0x7fa87be76a7e
0028d 4183fa02                       cmp        r10d, 2
00291 0f8667140000                   jbe        0x7fa87be76a7e
00297 458d53f9                       lea        r10d, [r11 - 7]
0029b 4585d2                         test       r10d, r10d
0029e 0f8c5a140000                   jl         0x7fa87be76a7e
002a4 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
002a9 458d53f1                       lea        r10d, [r11 - 0xf]
002ad 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
002b5 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
002ba 4183c3f1                       add        r11d, -0xf
002be 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
002c6 e9b8010000                     jmp        0x7fa87be75803
002cb 33c9                           xor        ecx, ecx
002cd 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
002d5 418b5a10                       mov        ebx, dword ptr [r10 + 0x10]
002d9 4183f803                       cmp        r8d, 3
002dd 0f8e39020000                   jle        0x7fa87be7589c
002e3 41895a14                       mov        dword ptr [r10 + 0x14], ebx
002e7 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
002eb 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
002f3 45895310                       mov        dword ptr [r11 + 0x10], r10d
002f7 4183c0fd                       add        r8d, -3
002fb 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
00303 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0030b 4589420c                       mov        dword ptr [r10 + 0xc], r8d
0030f 4c639c24ac000000               movsxd     r11, dword ptr [rsp + 0xac]
00317 4c63542478                     movsxd     r10, dword ptr [rsp + 0x78]
0031c 4c03542460                     add        r10, qword ptr [rsp + 0x60]
00321 4c63c1                         movsxd     r8, ecx
00324 4d03d0                         add        r10, r8
00327 4d3bda                         cmp        r11, r10
0032a 0f8f0c100000                   jg         0x7fa87be766bc
00330 448b8c24ac000000               mov        r9d, dword ptr [rsp + 0xac]
00338 4585c9                         test       r9d, r9d
0033b 0f8e4b0f0000                   jle        0x7fa87be7660c
00341 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00346 4403d9                         add        r11d, ecx
00349 44039c24a8000000               add        r11d, dword ptr [rsp + 0xa8]
00351 443b5c2474                     cmp        r11d, dword ptr [rsp + 0x74]
00356 0f8fb0100000                   jg         0x7fa87be7678c
0035c 468d1c29                       lea        r11d, [rcx + r13]
00360 443b5c247c                     cmp        r11d, dword ptr [rsp + 0x7c]
00365 0f8f41110000                   jg         0x7fa87be7682c
0036b 83f910                         cmp        ecx, 0x10
0036e 0f8fec110000                   jg         0x7fa87be768e0
00374 443bac24a4000000               cmp        r13d, dword ptr [rsp + 0xa4]
0037c 0f83ba0b0000                   jae        0x7fa87be762bc
00382 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0038a c4817a6f442a0c                 vmovdqu    xmm0, xmmword ptr [r10 + r13 + 0xc]
00391 448b542478                     mov        r10d, dword ptr [rsp + 0x78]
00396 443b9424a0000000               cmp        r10d, dword ptr [rsp + 0xa0]
0039e 0f836c0c0000                   jae        0x7fa87be76390
003a4 468d1c29                       lea        r11d, [rcx + r13]
003a8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
003ad 468d0c11                       lea        r9d, [rcx + r10]
003b1 44898c24b0000000               mov        dword ptr [rsp + 0xb0], r9d
003b9 4d63ca                         movsxd     r9, r10d
003bc 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
003c4 c4817a7f440b0c                 vmovdqu    xmmword ptr [r11 + r9 + 0xc], xmm0
003cb 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
003d3 442b9c24ac000000               sub        r11d, dword ptr [rsp + 0xac]
003db 44899c24b4000000               mov        dword ptr [rsp + 0xb4], r11d
003e3 8b9c24a8000000                 mov        ebx, dword ptr [rsp + 0xa8]
003ea 83fb10                         cmp        ebx, 0x10
003ed 0f8f09120000                   jg         0x7fa87be7697c
003f3 448b9c24ac000000               mov        r11d, dword ptr [rsp + 0xac]
003fb 4183fb10                       cmp        r11d, 0x10
003ff 0f8c78020000                   jl         0x7fa87be759fd
00405 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
0040d 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
00415 0f83d90c0000                   jae        0x7fa87be76474
0041b 458bd8                         mov        r11d, r8d
0041e 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00426 c4817a6f44180c                 vmovdqu    xmm0, xmmword ptr [r8 + r11 + 0xc]
0042d 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00435 443b8424a0000000               cmp        r8d, dword ptr [rsp + 0xa0]
0043d 0f83690d0000                   jae        0x7fa87be7652c
00443 458bda                         mov        r11d, r10d
00446 4d63d3                         movsxd     r10, r11d
00449 468d0c19                       lea        r9d, [rcx + r11]
0044d 4403cb                         add        r9d, ebx
00450 44894c2478                     mov        dword ptr [rsp + 0x78], r9d
00455 4c63d9                         movsxd     r11, ecx
00458 4d03da                         add        r11, r10
0045b 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00463 c4817a7f441a0c                 vmovdqu    xmmword ptr [r10 + r11 + 0xc], xmm0
0046a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0046e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00473 41ffc0                         inc        r8d
00476 4489442470                     mov        dword ptr [rsp + 0x70], r8d
0047b 418502                         test       dword ptr [r10], eax
0047e 448b6c2438                     mov        r13d, dword ptr [rsp + 0x38]
00483 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00488 452bd5                         sub        r10d, r13d
0048b 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00490 443b5c2428                     cmp        r11d, dword ptr [rsp + 0x28]
00495 0f8d99080000                   jge        0x7fa87be760b4
0049b 443b5c2404                     cmp        r11d, dword ptr [rsp + 4]
004a0 0f830e0a0000                   jae        0x7fa87be76234
004a6 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
004ae 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
004b3 4f8b5cc310                     mov        r11, qword ptr [r11 + r8*8 + 0x10]
004b8 4d8bc3                         mov        r8, r11
004bb 49c1f824                       sar        r8, 0x24
004bf 458bc0                         mov        r8d, r8d
004c2 4d8bcb                         mov        r9, r11
004c5 49c1e912                       shr        r9, 0x12
004c9 418bcb                         mov        ecx, r11d
004cc 458bc9                         mov        r9d, r9d
004cf 81e1ffff0100                   and        ecx, 0x1ffff
004d5 4181e1ffff0300                 and        r9d, 0x3ffff
004dc 44898c24a8000000               mov        dword ptr [rsp + 0xa8], r9d
004e4 4585c0                         test       r8d, r8d
004e7 0f8cbf0d0000                   jl         0x7fa87be7662c
004ed 85c9                           test       ecx, ecx
004ef 0f84d6fdffff                   je         0x7fa87be7564b
004f5 413bca                         cmp        ecx, r10d
004f8 0f8ecffdffff                   jle        0x7fa87be7564d
004fe be45ffffff                     mov        esi, 0xffffff45
00503 8be9                           mov        ebp, ecx
00505 44891424                       mov        dword ptr [rsp], r10d
00509 666690                         nop        
0050c c5f877                         vzeroupper 
0050f e8cc24b6ff                     call       0x7fa87b9d7d60
00514 0f1f84000c060001               nop        dword ptr [rax + rax + 0x100060c]
0051c 85c9                           test       ecx, ecx
0051e 7403                           je         0x7fa87be758a3
00520 41ffc8                         dec        r8d
00523 458b4a0c                       mov        r9d, dword ptr [r10 + 0xc]
00527 4585c0                         test       r8d, r8d
0052a 7474                           je         0x7fa87be75920
0052c 4183f803                       cmp        r8d, 3
00530 0f84ab080000                   je         0x7fa87be76161
00536 4183f802                       cmp        r8d, 2
0053a 7771                           ja         0x7fa87be7592d
0053c 443b44241c                     cmp        r8d, dword ptr [rsp + 0x1c]
00541 0f839d120000                   jae        0x7fa87be76b64
00547 478b4c820c                     mov        r9d, dword ptr [r10 + r8*4 + 0xc]
0054c 4585c0                         test       r8d, r8d
0054f 7e43                           jle        0x7fa87be75914
00551 458d58ff                       lea        r11d, [r8 - 1]
00555 443b5c241c                     cmp        r11d, dword ptr [rsp + 0x1c]
0055a 0f8370180000                   jae        0x7fa87be77150
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
0058d 8bdb                           mov        ebx, ebx
0058f e973060000                     jmp        0x7fa87be75f87
00594 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0059c 45894a0c                       mov        dword ptr [r10 + 0xc], r9d
005a0 44898c24ac000000               mov        dword ptr [rsp + 0xac], r9d
005a8 e962fdffff                     jmp        0x7fa87be7568f
005ad 48be68387ce200000000           movabs     rsi, 0xe27c3868
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
0062f e8acaea9ff                     call       0x7fa87b910860
00634 0f1f84002c070002               nop        dword ptr [rax + rax + 0x200072c]
0063c 4885c0                         test       rax, rax
0063f 0f8487120000                   je         0x7fa87be76c4c
00645 488bf0                         mov        rsi, rax
00648 c5f877                         vzeroupper 
0064b 4881c4e0000000                 add        rsp, 0xe0
00652 5d                             pop        rbp
00653 e9884cb6ff                     jmp        0x7fa87b9da660
00658 4d63d3                         movsxd     r10, r11d
0065b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00662 c442a8f5db                     bzhi       r11, r11, r10
00667 c4c1fb92fb                     kmovq      k7, r11
0066c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00672 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00678 e959050000                     jmp        0x7fa87be75f56
0067d 448bdb                         mov        r11d, ebx
00680 44039c24b0000000               add        r11d, dword ptr [rsp + 0xb0]
00688 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
0068d 8b9c24ac000000                 mov        ebx, dword ptr [rsp + 0xac]
00694 3b9c24a8000000                 cmp        ebx, dword ptr [rsp + 0xa8]
0069b 0f8dff020000                   jge        0x7fa87be75d20
006a1 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
006a9 4183c008                       add        r8d, 8
006ad 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
006b5 83fb08                         cmp        ebx, 8
006b8 0f8dc3010000                   jge        0x7fa87be75c01
006be 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
006c6 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
006cb 0f83db170000                   jae        0x7fa87be7722c
006d1 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
006d9 430fbe6c030c                   movsx      ebp, byte ptr [r11 + r8 + 0xc]
006df 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
006e7 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
006ec 0f83ba180000                   jae        0x7fa87be7732c
006f2 4d63da                         movsxd     r11, r10d
006f5 4c63c1                         movsxd     r8, ecx
006f8 4d03c3                         add        r8, r11
006fb 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
00703 43886c030c                     mov        byte ptr [r11 + r8 + 0xc], bpl
00708 448b8424b4000000               mov        r8d, dword ptr [rsp + 0xb4]
00710 4183c003                       add        r8d, 3
00714 448b8c24b0000000               mov        r9d, dword ptr [rsp + 0xb0]
0071c 41ffc1                         inc        r9d
0071f 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00724 0f8342190000                   jae        0x7fa87be773ec
0072a 448b8424b0000000               mov        r8d, dword ptr [rsp + 0xb0]
00732 4183c003                       add        r8d, 3
00736 48639c24b4000000               movsxd     rbx, dword ptr [rsp + 0xb4]
0073e 410fbe6c1b0d                   movsx      ebp, byte ptr [r11 + rbx + 0xd]
00744 443b442418                     cmp        r8d, dword ptr [rsp + 0x18]
00749 0f83f5190000                   jae        0x7fa87be774c4
0074f 4d63d2                         movsxd     r10, r10d
00752 4c63d9                         movsxd     r11, ecx
00755 4d03da                         add        r11, r10
00758 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00760 43886c1a0d                     mov        byte ptr [r10 + r11 + 0xd], bpl
00765 450fbe441a0e                   movsx      r8d, byte ptr [r10 + rbx + 0xe]
0076b 4788441a0e                     mov        byte ptr [r10 + r11 + 0xe], r8b
00770 450fbe541a0f                   movsx      r10d, byte ptr [r10 + rbx + 0xf]
00776 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
0077e 478854180f                     mov        byte ptr [r8 + r11 + 0xf], r10b
00783 448b9424ac000000               mov        r10d, dword ptr [rsp + 0xac]
0078b 4183fa08                       cmp        r10d, 8
0078f 0f836f1a0000                   jae        0x7fa87be77584
00795 49bad08c79e200000000           movabs     r10, 0xe2798cd0
0079f 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
007a7 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
007af 47035c820c                     add        r11d, dword ptr [r10 + r8*4 + 0xc]
007b4 44891c24                       mov        dword ptr [rsp], r11d
007b8 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
007c0 4183fb04                       cmp        r11d, 4
007c4 7e42                           jle        0x7fa87be75b88
007c6 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
007cd 83c504                         add        ebp, 4
007d0 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
007d8 8b1424                         mov        edx, dword ptr [rsp]
007db 90                             nop        
007dc c5f877                         vzeroupper 
007df e8fcaca9ff                     call       0x7fa87b910860
007e4 0f1f8400dc080003               nop        dword ptr [rax + rax + 0x30008dc]
007ec 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
007f4 8bd5                           mov        edx, ebp
007f6 8bc8                           mov        ecx, eax
007f8 c5f877                         vzeroupper 
007fb e8e0aca9ff                     call       0x7fa87b910860
00800 0f1f8400f8080004               nop        dword ptr [rax + rax + 0x40008f8]
00808 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
00810 4183fb08                       cmp        r11d, 8
00814 0f8e50fcffff                   jle        0x7fa87be757ea
0081a 49ba008d79e200000000           movabs     r10, 0xe2798d00
00824 8b1424                         mov        edx, dword ptr [rsp]
00827 448b8424ac000000               mov        r8d, dword ptr [rsp + 0xac]
0082f 432b54820c                     sub        edx, dword ptr [r10 + r8*4 + 0xc]
00834 83c208                         add        edx, 8
00837 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
0083f 90                             nop        
00840 c5f877                         vzeroupper 
00843 e898aca9ff                     call       0x7fa87b910860
00848 0f1f840040090005               nop        dword ptr [rax + rax + 0x5000940]
00850 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00857 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
0085f 8b9424c0000000                 mov        edx, dword ptr [rsp + 0xc0]
00866 488bc8                         mov        rcx, rax
00869 666690                         nop        
0086c c5f877                         vzeroupper 
0086f e86caca9ff                     call       0x7fa87b910860
00874 0f1f84006c090006               nop        dword ptr [rax + rax + 0x600096c]
0087c e9e9fbffff                     jmp        0x7fa87be757ea
00881 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
00889 8b9424b4000000                 mov        edx, dword ptr [rsp + 0xb4]
00890 c5f877                         vzeroupper 
00893 e848aca9ff                     call       0x7fa87b910860
00898 0f1f840090090007               nop        dword ptr [rax + rax + 0x7000990]
008a0 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
008a7 488bb424b8000000               mov        rsi, qword ptr [rsp + 0xb8]
008af 8bd5                           mov        edx, ebp
008b1 488bc8                         mov        rcx, rax
008b4 c5f877                         vzeroupper 
008b7 e824aca9ff                     call       0x7fa87b910860
008bc 0f1f8400b4090008               nop        dword ptr [rax + rax + 0x80009b4]
008c4 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
008cc 4183c208                       add        r10d, 8
008d0 be95ffffff                     mov        esi, 0xffffff95
008d5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
008da 48894424f8                     mov        qword ptr [rsp - 8], rax
008df 8b442410                       mov        eax, dword ptr [rsp + 0x10]
008e3 89442408                       mov        dword ptr [rsp + 8], eax
008e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
008ec 48ff742420                     push       qword ptr [rsp + 0x20]
008f1 488f442418                     pop        qword ptr [rsp + 0x18]
008f6 48894424f8                     mov        qword ptr [rsp - 8], rax
008fb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
008ff 8944240c                       mov        dword ptr [rsp + 0xc], eax
00903 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00908 48894424f8                     mov        qword ptr [rsp - 8], rax
0090d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
00911 89442430                       mov        dword ptr [rsp + 0x30], eax
00915 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0091a 48894424f8                     mov        qword ptr [rsp - 8], rax
0091f 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00923 89442434                       mov        dword ptr [rsp + 0x34], eax
00927 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0092c 48ff742460                     push       qword ptr [rsp + 0x60]
00931 488f442438                     pop        qword ptr [rsp + 0x38]
00936 48894424f8                     mov        qword ptr [rsp - 8], rax
0093b 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0093f 89442440                       mov        dword ptr [rsp + 0x40], eax
00943 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00948 48ff742468                     push       qword ptr [rsp + 0x68]
0094d 488f442450                     pop        qword ptr [rsp + 0x50]
00952 48894424f8                     mov        qword ptr [rsp - 8], rax
00957 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0095b 8944245c                       mov        dword ptr [rsp + 0x5c], eax
0095f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00964 48894424f8                     mov        qword ptr [rsp - 8], rax
00969 8b442478                       mov        eax, dword ptr [rsp + 0x78]
0096d 89442460                       mov        dword ptr [rsp + 0x60], eax
00971 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00976 4489542464                     mov        dword ptr [rsp + 0x64], r10d
0097b 48894424f8                     mov        qword ptr [rsp - 8], rax
00980 8b8424c0000000                 mov        eax, dword ptr [rsp + 0xc0]
00987 8944246c                       mov        dword ptr [rsp + 0x6c], eax
0098b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00990 c5f877                         vzeroupper 
00993 e84820b6ff                     call       0x7fa87b9d7d60
00998 0f1f8400900a0009               nop        dword ptr [rax + rax + 0x9000a90]
009a0 448b9c24a8000000               mov        r11d, dword ptr [rsp + 0xa8]
009a8 4183fb30                       cmp        r11d, 0x30
009ac 0f8faa010000                   jg         0x7fa87be75edc
009b2 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
009b7 4183c0f9                       add        r8d, -7
009bb 44898424ac000000               mov        dword ptr [rsp + 0xac], r8d
009c3 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
009cb 453bd8                         cmp        r11d, r8d
009ce 0f83100f0000                   jae        0x7fa87be76c64
009d4 458bc3                         mov        r8d, r11d
009d7 44898424b4000000               mov        dword ptr [rsp + 0xb4], r8d
009df 4c8b9c24b8000000               mov        r11, qword ptr [rsp + 0xb8]
009e7 4f8b44030c                     mov        r8, qword ptr [r11 + r8 + 0xc]
009ec 448b8c24b0000000               mov        r9d, dword ptr [rsp + 0xb0]
009f4 443b8c24ac000000               cmp        r9d, dword ptr [rsp + 0xac]
009fc 0f83f20f0000                   jae        0x7fa87be76d74
00a02 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00a07 4d63d2                         movsxd     r10, r10d
00a0a 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00a0e 4c63d9                         movsxd     r11, ecx
00a11 4b8d4c130c                     lea        rcx, [r11 + r10 + 0xc]
00a16 44890c24                       mov        dword ptr [rsp], r9d
00a1a 48be00b722e200000000           movabs     rsi, 0xe222b700
00a24 488b9424b8000000               mov        rdx, qword ptr [rsp + 0xb8]
00a2c 4533c9                         xor        r9d, r9d
00a2f 90                             nop        
00a30 c5f877                         vzeroupper 
00a33 e8a8a0a9ff                     call       0x7fa87b90fe60
00a38 0f1f8400300b000a               nop        dword ptr [rax + rax + 0xa000b30]
00a40 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00a45 4403542430                     add        r10d, dword ptr [rsp + 0x30]
00a4a 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00a4f 458d5a08                       lea        r11d, [r10 + 8]
00a53 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00a5b 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00a60 0f8d85010000                   jge        0x7fa87be75f6b
00a66 448b9424b4000000               mov        r10d, dword ptr [rsp + 0xb4]
00a6e 442b542430                     sub        r10d, dword ptr [rsp + 0x30]
00a73 44891424                       mov        dword ptr [rsp], r10d
00a77 4c6344242c                     movsxd     r8, dword ptr [rsp + 0x2c]
00a7c 4983c0f9                       add        r8, -7
00a80 4963ca                         movsxd     rcx, r10d
00a83 4d63d3                         movsxd     r10, r11d
00a86 4d8d0c0a                       lea        r9, [r10 + rcx]
00a8a 4d3bc8                         cmp        r9, r8
00a8d 0f835d110000                   jae        0x7fa87be76f70
00a93 4c634c2478                     movsxd     r9, dword ptr [rsp + 0x78]
00a98 4d2bca                         sub        r9, r10
00a9b 4983c107                       add        r9, 7
00a9f 4983e1f8                       and        r9, 0xfffffffffffffff8
00aa3 458bd1                         mov        r10d, r9d
00aa6 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00aab 478d4c0a08                     lea        r9d, [r10 + r9 + 8]
00ab0 4d63d1                         movsxd     r10, r9d
00ab3 4e8d4c11f8                     lea        r9, [rcx + r10 - 8]
00ab8 4d3bc8                         cmp        r9, r8
00abb 0f832f110000                   jae        0x7fa87be76f70
00ac1 443b9c24ac000000               cmp        r11d, dword ptr [rsp + 0xac]
00ac9 0f8321110000                   jae        0x7fa87be76f70
00acf 4983c2f8                       add        r10, -8
00ad3 4d3bd0                         cmp        r10, r8
00ad6 0f8314110000                   jae        0x7fa87be76f70
00adc 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00ae1 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
00ae8 0f8ff2110000                   jg         0x7fa87be77060
00aee 6690                           nop        
00af0 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00af8 4963cb                         movsxd     rcx, r11d
00afb 4883c10c                       add        rcx, 0xc
00aff 8bac24b0000000                 mov        ebp, dword ptr [rsp + 0xb0]
00b06 032c24                         add        ebp, dword ptr [rsp]
00b09 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00b11 4d8b442a0c                     mov        r8, qword ptr [r10 + rbp + 0xc]
00b16 48be00b722e200000000           movabs     rsi, 0xe222b700
00b20 488b9424b8000000               mov        rdx, qword ptr [rsp + 0xb8]
00b28 4533c9                         xor        r9d, r9d
00b2b 90                             nop        
00b2c c5f877                         vzeroupper 
00b2f e8ac9fa9ff                     call       0x7fa87b90fe60
00b34 0f1f84002c0c000b               nop        dword ptr [rax + rax + 0xb000c2c]
00b3c 448b9c24b0000000               mov        r11d, dword ptr [rsp + 0xb0]
00b44 4183c308                       add        r11d, 8
00b48 44899c24b0000000               mov        dword ptr [rsp + 0xb0], r11d
00b50 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00b55 7c99                           jl         0x7fa87be75e70
00b57 e98f000000                     jmp        0x7fa87be75f6b
00b5c 8b8c24b4000000                 mov        ecx, dword ptr [rsp + 0xb4]
00b63 85c9                           test       ecx, ecx
00b65 0f8c910f0000                   jl         0x7fa87be76e7c
00b6b 448b9424b0000000               mov        r10d, dword ptr [rsp + 0xb0]
00b73 4585d2                         test       r10d, r10d
00b76 0f8c800f0000                   jl         0x7fa87be76e7c
00b7c 458d140b                       lea        r10d, [r11 + rcx]
00b80 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
00b84 413bda                         cmp        ebx, r10d
00b87 0f826f0f0000                   jb         0x7fa87be76e7c
00b8d 3b5c2478                       cmp        ebx, dword ptr [rsp + 0x78]
00b91 0f82650f0000                   jb         0x7fa87be76e7c
00b97 4585db                         test       r11d, r11d
00b9a 743a                           je         0x7fa87be75f56
00b9c 4c8b9424b8000000               mov        r10, qword ptr [rsp + 0xb8]
00ba4 498d7c0a0c                     lea        rdi, [r10 + rcx + 0xc]
00ba9 4d03c1                         add        r8, r9
00bac 4b8d74020c                     lea        rsi, [r10 + r8 + 0xc]
00bb1 4963d3                         movsxd     rdx, r11d
00bb4 4883fa20                       cmp        rdx, 0x20
00bb8 0f869afaffff                   jbe        0x7fa87be759d8
00bbe c5f877                         vzeroupper 
00bc1 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00bcb 41ffd2                         call       r10
00bce 0f1f840000000000               nop        dword ptr [rax + rax]
00bd6 48894424f8                     mov        qword ptr [rsp - 8], rax
00bdb 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
00be2 89442430                       mov        dword ptr [rsp + 0x30], eax
00be6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00beb 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00bf0 44039424a8000000               add        r10d, dword ptr [rsp + 0xa8]
00bf8 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00bfd e968f8ffff                     jmp        0x7fa87be757ea
00c02 6690                           nop        
00c04 458bc3                         mov        r8d, r11d
00c07 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00c0f 478b548208                     mov        r10d, dword ptr [r10 + r8*4 + 8]
00c14 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c1c 478954830c                     mov        dword ptr [r11 + r8*4 + 0xc], r10d
00c21 458d58ff                       lea        r11d, [r8 - 1]
00c25 443bdb                         cmp        r11d, ebx
00c28 7fda                           jg         0x7fa87be75f84
00c2a 4183fb3f                       cmp        r11d, 0x3f
00c2e 0f8eb0000000                   jle        0x7fa87be76064
00c34 41ffc8                         dec        r8d
00c37 458bd0                         mov        r10d, r8d
00c3a eb07                           jmp        0x7fa87be75fc3
00c3c 0f1f4000                       nop        dword ptr [rax]
00c40 458bd3                         mov        r10d, r11d
00c43 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c4b 62917e486f8493ccffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x34]
00c56 62917e487f8493d0ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x30], zmm0
00c61 62917e486f84938cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0x74]
00c6c 62917e487f849390ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0x70], zmm0
00c77 62917e486f84934cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0xb4]
00c82 62917e487f849350ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0xb0], zmm0
00c8d 62917e486f84930cffffff         vmovdqu32  zmm0, zmmword ptr [r11 + r10*4 - 0xf4]
00c98 62917e487f849310ffffff         vmovdqu32  zmmword ptr [r11 + r10*4 - 0xf0], zmm0
00ca3 458d5ac0                       lea        r11d, [r10 - 0x40]
00ca7 4183fb3f                       cmp        r11d, 0x3f
00cab 7f93                           jg         0x7fa87be75fc0
00cad 4183fb0f                       cmp        r11d, 0xf
00cb1 7e31                           jle        0x7fa87be76064
00cb3 458bda                         mov        r11d, r10d
00cb6 4183c3c0                       add        r11d, -0x40
00cba 6690                           nop        
00cbc 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00cc4 62917e486f849accffffff         vmovdqu32  zmm0, zmmword ptr [r10 + r11*4 - 0x34]
00ccf 62917e487f849ad0ffffff         vmovdqu32  zmmword ptr [r10 + r11*4 - 0x30], zmm0
00cda 4183c3f0                       add        r11d, -0x10
00cde 4183fb0f                       cmp        r11d, 0xf
00ce2 7fd8                           jg         0x7fa87be7603c
00ce4 4585db                         test       r11d, r11d
00ce7 0f8ea7f8ffff                   jle        0x7fa87be75914
00ced 666690                         nop        
00cf0 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00cf8 478b449a08                     mov        r8d, dword ptr [r10 + r11*4 + 8]
00cfd 4789449a0c                     mov        dword ptr [r10 + r11*4 + 0xc], r8d
00d02 41ffcb                         dec        r11d
00d05 4585db                         test       r11d, r11d
00d08 7fe6                           jg         0x7fa87be76070
00d0a e985f8ffff                     jmp        0x7fa87be75914
00d0f 4d63d2                         movsxd     r10, r10d
00d12 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00d19 c442a8f5db                     bzhi       r11, r11, r10
00d1e c4c1fb92fb                     kmovq      k7, r11
00d23 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00d29 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00d2f e98e000000                     jmp        0x7fa87be76142
00d34 4585ed                         test       r13d, r13d
00d37 0f8c7f150000                   jl         0x7fa87be7763c
00d3d 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
00d42 4585db                         test       r11d, r11d
00d45 0f8c76150000                   jl         0x7fa87be77641
00d4b 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00d50 443b4c2410                     cmp        r9d, dword ptr [rsp + 0x10]
00d55 0f8266150000                   jb         0x7fa87be77641
00d5b 8b6c2478                       mov        ebp, dword ptr [rsp + 0x78]
00d5f 4103ea                         add        ebp, r10d
00d62 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00d67 443bc5                         cmp        r8d, ebp
00d6a 0f8251150000                   jb         0x7fa87be77641
00d70 4585d2                         test       r10d, r10d
00d73 0f8c48150000                   jl         0x7fa87be77641
00d79 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00d7e 453bcd                         cmp        r9d, r13d
00d81 743f                           je         0x7fa87be76142
00d83 4c8b8424b8000000               mov        r8, qword ptr [rsp + 0xb8]
00d8b 4b8d74180c                     lea        rsi, [r8 + r11 + 0xc]
00d90 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d98 4b8d7c2b0c                     lea        rdi, [r11 + r13 + 0xc]
00d9d 4963d2                         movsxd     rdx, r10d
00da0 4883fa20                       cmp        rdx, 0x20
00da4 0f8665ffffff                   jbe        0x7fa87be7608f
00daa c5f877                         vzeroupper 
00dad 49ba209f8f7ba87f0000           movabs     r10, 0x7fa87b8f9f20
00db7 41ffd2                         call       r10
00dba 0f1f840000000000               nop        dword ptr [rax + rax]
00dc2 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00dc7 41896a3c                       mov        dword ptr [r10 + 0x3c], ebp
00dcb c5f877                         vzeroupper 
00dce 4881c4e0000000                 add        rsp, 0xe0
00dd5 5d                             pop        rbp
00dd6 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00dda 0f873c150000                   ja         0x7fa87be7769c
00de0 c3                             ret        
00de1 41ffc9                         dec        r9d
00de4 4585c9                         test       r9d, r9d
00de7 7e1d                           jle        0x7fa87be76186
00de9 41895a14                       mov        dword ptr [r10 + 0x14], ebx
00ded 458b520c                       mov        r10d, dword ptr [r10 + 0xc]
00df1 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00df9 45895310                       mov        dword ptr [r11 + 0x10], r10d
00dfd 45894b0c                       mov        dword ptr [r11 + 0xc], r9d
00e01 e99af7ffff                     jmp        0x7fa87be75920
00e06 48be28387ce200000000           movabs     rsi, 0xe27c3828
00e10 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00e15 48894424f8                     mov        qword ptr [rsp - 8], rax
00e1a 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00e1e 89442408                       mov        dword ptr [rsp + 8], eax
00e22 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e27 48ff742420                     push       qword ptr [rsp + 0x20]
00e2c 488f442418                     pop        qword ptr [rsp + 0x18]
00e31 48894424f8                     mov        qword ptr [rsp - 8], rax
00e36 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00e3a 8944240c                       mov        dword ptr [rsp + 0xc], eax
00e3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e43 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
00e48 48894424f8                     mov        qword ptr [rsp - 8], rax
00e4d 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00e51 89442438                       mov        dword ptr [rsp + 0x38], eax
00e55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e5a 48ff742460                     push       qword ptr [rsp + 0x60]
00e5f 488f442440                     pop        qword ptr [rsp + 0x40]
00e64 48894424f8                     mov        qword ptr [rsp - 8], rax
00e69 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
00e6d 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00e71 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00e76 48ff742468                     push       qword ptr [rsp + 0x68]
00e7b 488f442450                     pop        qword ptr [rsp + 0x50]
00e80 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00e84 c5f877                         vzeroupper 
00e87 e854a6a9ff                     call       0x7fa87b910860
00e8c 0f1f8400840f000c               nop        dword ptr [rax + rax + 0xc000f84]
00e94 4885c0                         test       rax, rax
00e97 0f85a8f7ffff                   jne        0x7fa87be759c5
00e9d bef6ffffff                     mov        esi, 0xfffffff6
00ea2 6690                           nop        
00ea4 c5f877                         vzeroupper 
00ea7 e8341bb6ff                     call       0x7fa87b9d7d60
00eac 0f1f8400a40f000d               nop        dword ptr [rax + rax + 0xd000fa4]
00eb4 bee4ffffff                     mov        esi, 0xffffffe4
00eb9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00ebe 48894424f8                     mov        qword ptr [rsp - 8], rax
00ec3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00ec7 89442408                       mov        dword ptr [rsp + 8], eax
00ecb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ed0 48ff742420                     push       qword ptr [rsp + 0x20]
00ed5 488f442418                     pop        qword ptr [rsp + 0x18]
00eda 48894424f8                     mov        qword ptr [rsp - 8], rax
00edf 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00ee3 8944240c                       mov        dword ptr [rsp + 0xc], eax
00ee7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00eec 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
00ef1 48894424f8                     mov        qword ptr [rsp - 8], rax
00ef6 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00efa 89442438                       mov        dword ptr [rsp + 0x38], eax
00efe 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f03 48ff742460                     push       qword ptr [rsp + 0x60]
00f08 488f442440                     pop        qword ptr [rsp + 0x40]
00f0d 48894424f8                     mov        qword ptr [rsp - 8], rax
00f12 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
00f16 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00f1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f1f 48ff742468                     push       qword ptr [rsp + 0x68]
00f24 488f442450                     pop        qword ptr [rsp + 0x50]
00f29 666690                         nop        
00f2c c5f877                         vzeroupper 
00f2f e8ac1ab6ff                     call       0x7fa87b9d7d60
00f34 0f1f84002c10000e               nop        dword ptr [rax + rax + 0xe00102c]
00f3c bee4ffffff                     mov        esi, 0xffffffe4
00f41 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
00f46 48894424f8                     mov        qword ptr [rsp - 8], rax
00f4b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
00f4f 89442408                       mov        dword ptr [rsp + 8], eax
00f53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f58 48ff742420                     push       qword ptr [rsp + 0x20]
00f5d 488f442418                     pop        qword ptr [rsp + 0x18]
00f62 48894424f8                     mov        qword ptr [rsp - 8], rax
00f67 8b442428                       mov        eax, dword ptr [rsp + 0x28]
00f6b 8944240c                       mov        dword ptr [rsp + 0xc], eax
00f6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f74 48894424f8                     mov        qword ptr [rsp - 8], rax
00f79 8b442478                       mov        eax, dword ptr [rsp + 0x78]
00f7d 89442430                       mov        dword ptr [rsp + 0x30], eax
00f81 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f86 48894424f8                     mov        qword ptr [rsp - 8], rax
00f8b 8b442458                       mov        eax, dword ptr [rsp + 0x58]
00f8f 89442438                       mov        dword ptr [rsp + 0x38], eax
00f93 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00f98 48ff742460                     push       qword ptr [rsp + 0x60]
00f9d 488f442440                     pop        qword ptr [rsp + 0x40]
00fa2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fa7 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
00fab 8944243c                       mov        dword ptr [rsp + 0x3c], eax
00faf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fb4 48ff742468                     push       qword ptr [rsp + 0x68]
00fb9 488f442450                     pop        qword ptr [rsp + 0x50]
00fbe 48894424f8                     mov        qword ptr [rsp - 8], rax
00fc3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
00fc7 89442458                       mov        dword ptr [rsp + 0x58], eax
00fcb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fd0 48894424f8                     mov        qword ptr [rsp - 8], rax
00fd5 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
00fd9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
00fdd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00fe2 48894424f8                     mov        qword ptr [rsp - 8], rax
00fe7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
00feb 89442460                       mov        dword ptr [rsp + 0x60], eax
00fef 488b4424f8                     mov        rax, qword ptr [rsp - 8]
00ff4 894c2464                       mov        dword ptr [rsp + 0x64], ecx
00ff8 44896c2478                     mov        dword ptr [rsp + 0x78], r13d
00ffd 666690                         nop        
01000 c5f877                         vzeroupper 
01003 e8d819b6ff                     call       0x7fa87b9d7d60
01008 0f1f84000011000f               nop        dword ptr [rax + rax + 0xf001100]
01010 bee4ffffff                     mov        esi, 0xffffffe4
01015 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0101a 48ffb42488000000               push       qword ptr [rsp + 0x88]
01022 488f0424                       pop        qword ptr [rsp]
01026 48894424f8                     mov        qword ptr [rsp - 8], rax
0102b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0102f 89442408                       mov        dword ptr [rsp + 8], eax
01033 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01038 48ff742420                     push       qword ptr [rsp + 0x20]
0103d 488f442418                     pop        qword ptr [rsp + 0x18]
01042 48894424f8                     mov        qword ptr [rsp - 8], rax
01047 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0104b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0104f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01054 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01059 48894424f8                     mov        qword ptr [rsp - 8], rax
0105e 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01062 89442438                       mov        dword ptr [rsp + 0x38], eax
01066 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0106b 48ff742460                     push       qword ptr [rsp + 0x60]
01070 488f442440                     pop        qword ptr [rsp + 0x40]
01075 48894424f8                     mov        qword ptr [rsp - 8], rax
0107a 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0107e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01082 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01087 48ffb42480000000               push       qword ptr [rsp + 0x80]
0108f 488f442448                     pop        qword ptr [rsp + 0x48]
01094 48ff742468                     push       qword ptr [rsp + 0x68]
01099 488f442450                     pop        qword ptr [rsp + 0x50]
0109e 48894424f8                     mov        qword ptr [rsp - 8], rax
010a3 8b442474                       mov        eax, dword ptr [rsp + 0x74]
010a7 89442458                       mov        dword ptr [rsp + 0x58], eax
010ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010b0 48894424f8                     mov        qword ptr [rsp - 8], rax
010b5 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
010b9 8944245c                       mov        dword ptr [rsp + 0x5c], eax
010bd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010c2 48894424f8                     mov        qword ptr [rsp - 8], rax
010c7 8b442470                       mov        eax, dword ptr [rsp + 0x70]
010cb 89442460                       mov        dword ptr [rsp + 0x60], eax
010cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
010d4 894c2464                       mov        dword ptr [rsp + 0x64], ecx
010d8 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
010e1 666690                         nop        
010e4 c5f877                         vzeroupper 
010e7 e8f418b6ff                     call       0x7fa87b9d7d60
010ec 0f1f8400e4110010               nop        dword ptr [rax + rax + 0x100011e4]
010f4 bee4ffffff                     mov        esi, 0xffffffe4
010f9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
010fe 48894424f8                     mov        qword ptr [rsp - 8], rax
01103 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01107 89442408                       mov        dword ptr [rsp + 8], eax
0110b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01110 48ff742420                     push       qword ptr [rsp + 0x20]
01115 488f442418                     pop        qword ptr [rsp + 0x18]
0111a 48894424f8                     mov        qword ptr [rsp - 8], rax
0111f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01123 8944240c                       mov        dword ptr [rsp + 0xc], eax
01127 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0112c 48894424f8                     mov        qword ptr [rsp - 8], rax
01131 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01135 89442434                       mov        dword ptr [rsp + 0x34], eax
01139 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0113e 48894424f8                     mov        qword ptr [rsp - 8], rax
01143 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01147 89442438                       mov        dword ptr [rsp + 0x38], eax
0114b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01150 48ff742460                     push       qword ptr [rsp + 0x60]
01155 488f442440                     pop        qword ptr [rsp + 0x40]
0115a 48894424f8                     mov        qword ptr [rsp - 8], rax
0115f 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01163 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01167 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0116c 48ff742468                     push       qword ptr [rsp + 0x68]
01171 488f442450                     pop        qword ptr [rsp + 0x50]
01176 48894424f8                     mov        qword ptr [rsp - 8], rax
0117b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0117f 89442458                       mov        dword ptr [rsp + 0x58], eax
01183 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01188 48894424f8                     mov        qword ptr [rsp - 8], rax
0118d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01191 89442460                       mov        dword ptr [rsp + 0x60], eax
01195 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0119a 6690                           nop        
0119c c5f877                         vzeroupper 
0119f e83c18b6ff                     call       0x7fa87b9d7d60
011a4 0f1f84009c120011               nop        dword ptr [rax + rax + 0x1100129c]
011ac bee4ffffff                     mov        esi, 0xffffffe4
011b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
011b6 48ffb42488000000               push       qword ptr [rsp + 0x88]
011be 488f0424                       pop        qword ptr [rsp]
011c2 48894424f8                     mov        qword ptr [rsp - 8], rax
011c7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
011cb 89442408                       mov        dword ptr [rsp + 8], eax
011cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011d4 48ff742420                     push       qword ptr [rsp + 0x20]
011d9 488f442418                     pop        qword ptr [rsp + 0x18]
011de 48894424f8                     mov        qword ptr [rsp - 8], rax
011e3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
011e7 8944240c                       mov        dword ptr [rsp + 0xc], eax
011eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011f0 48894424f8                     mov        qword ptr [rsp - 8], rax
011f5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
011f9 89442434                       mov        dword ptr [rsp + 0x34], eax
011fd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01202 48894424f8                     mov        qword ptr [rsp - 8], rax
01207 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0120b 89442438                       mov        dword ptr [rsp + 0x38], eax
0120f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01214 48ff742460                     push       qword ptr [rsp + 0x60]
01219 488f442440                     pop        qword ptr [rsp + 0x40]
0121e 48894424f8                     mov        qword ptr [rsp - 8], rax
01223 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01227 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0122b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01230 48ffb42480000000               push       qword ptr [rsp + 0x80]
01238 488f442448                     pop        qword ptr [rsp + 0x48]
0123d 48ff742468                     push       qword ptr [rsp + 0x68]
01242 488f442450                     pop        qword ptr [rsp + 0x50]
01247 48894424f8                     mov        qword ptr [rsp - 8], rax
0124c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01250 89442458                       mov        dword ptr [rsp + 0x58], eax
01254 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01259 48894424f8                     mov        qword ptr [rsp - 8], rax
0125e 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01262 89442460                       mov        dword ptr [rsp + 0x60], eax
01266 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0126b 4489442470                     mov        dword ptr [rsp + 0x70], r8d
01270 c5fa7f842480000000             vmovdqu    xmmword ptr [rsp + 0x80], xmm0
01279 666690                         nop        
0127c c5f877                         vzeroupper 
0127f e85c17b6ff                     call       0x7fa87b9d7d60
01284 0f1f84007c130012               nop        dword ptr [rax + rax + 0x1200137c]
0128c be45ffffff                     mov        esi, 0xffffff45
01291 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01296 4c89542408                     mov        qword ptr [rsp + 8], r10
0129b 90                             nop        
0129c c5f877                         vzeroupper 
0129f e83c17b6ff                     call       0x7fa87b9d7d60
012a4 0f1f84009c130013               nop        dword ptr [rax + rax + 0x1300139c]
012ac be45ffffff                     mov        esi, 0xffffff45
012b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
012b6 48894424f8                     mov        qword ptr [rsp - 8], rax
012bb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
012bf 89442408                       mov        dword ptr [rsp + 8], eax
012c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012c8 48ff742420                     push       qword ptr [rsp + 0x20]
012cd 488f442418                     pop        qword ptr [rsp + 0x18]
012d2 48894424f8                     mov        qword ptr [rsp - 8], rax
012d7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
012db 8944240c                       mov        dword ptr [rsp + 0xc], eax
012df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012e4 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
012e9 48894424f8                     mov        qword ptr [rsp - 8], rax
012ee 8b442458                       mov        eax, dword ptr [rsp + 0x58]
012f2 89442438                       mov        dword ptr [rsp + 0x38], eax
012f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
012fb 48ff742460                     push       qword ptr [rsp + 0x60]
01300 488f442440                     pop        qword ptr [rsp + 0x40]
01305 48894424f8                     mov        qword ptr [rsp - 8], rax
0130a 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0130e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01312 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01317 48ff742468                     push       qword ptr [rsp + 0x68]
0131c 488f442450                     pop        qword ptr [rsp + 0x50]
01321 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01325 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
0132a 6690                           nop        
0132c c5f877                         vzeroupper 
0132f e8ac16b6ff                     call       0x7fa87b9d7d60
01334 0f1f84002c140014               nop        dword ptr [rax + rax + 0x1400142c]
0133c 4d3bda                         cmp        r11, r10
0133f bdffffffff                     mov        ebp, 0xffffffff
01344 7c08                           jl         0x7fa87be766ce
01346 400f95c5                       setne      bpl
0134a 400fb6ed                       movzx      ebp, bpl
0134e be45ffffff                     mov        esi, 0xffffff45
01353 48ff742408                     push       qword ptr [rsp + 8]
01358 488f0424                       pop        qword ptr [rsp]
0135c 48894424f8                     mov        qword ptr [rsp - 8], rax
01361 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01365 89442414                       mov        dword ptr [rsp + 0x14], eax
01369 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0136e 48894424f8                     mov        qword ptr [rsp - 8], rax
01373 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01377 89442438                       mov        dword ptr [rsp + 0x38], eax
0137b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01380 44896c243c                     mov        dword ptr [rsp + 0x3c], r13d
01385 48894424f8                     mov        qword ptr [rsp - 8], rax
0138a 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0138e 89442440                       mov        dword ptr [rsp + 0x40], eax
01392 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01397 48ff742460                     push       qword ptr [rsp + 0x60]
0139c 488f442448                     pop        qword ptr [rsp + 0x48]
013a1 48894424f8                     mov        qword ptr [rsp - 8], rax
013a6 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
013aa 89442444                       mov        dword ptr [rsp + 0x44], eax
013ae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013b3 48ff742468                     push       qword ptr [rsp + 0x68]
013b8 488f442458                     pop        qword ptr [rsp + 0x58]
013bd 48894424f8                     mov        qword ptr [rsp - 8], rax
013c2 8b442474                       mov        eax, dword ptr [rsp + 0x74]
013c6 89442460                       mov        dword ptr [rsp + 0x60], eax
013ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013cf 48894424f8                     mov        qword ptr [rsp - 8], rax
013d4 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
013d8 89442464                       mov        dword ptr [rsp + 0x64], eax
013dc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013e1 48894424f8                     mov        qword ptr [rsp - 8], rax
013e6 8b442470                       mov        eax, dword ptr [rsp + 0x70]
013ea 89442468                       mov        dword ptr [rsp + 0x68], eax
013ee 488b4424f8                     mov        rax, qword ptr [rsp - 8]
013f3 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
013f7 4c89542478                     mov        qword ptr [rsp + 0x78], r10
013fc c5f877                         vzeroupper 
013ff e8dc15b6ff                     call       0x7fa87b9d7d60
01404 0f1f8400fc140015               nop        dword ptr [rax + rax + 0x150014fc]
0140c be45ffffff                     mov        esi, 0xffffff45
01411 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01416 48894424f8                     mov        qword ptr [rsp - 8], rax
0141b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0141f 89442408                       mov        dword ptr [rsp + 8], eax
01423 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01428 48ff742420                     push       qword ptr [rsp + 0x20]
0142d 488f442418                     pop        qword ptr [rsp + 0x18]
01432 48894424f8                     mov        qword ptr [rsp - 8], rax
01437 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0143b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0143f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01444 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01449 48894424f8                     mov        qword ptr [rsp - 8], rax
0144e 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01452 89442438                       mov        dword ptr [rsp + 0x38], eax
01456 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0145b 48ff742460                     push       qword ptr [rsp + 0x60]
01460 488f442440                     pop        qword ptr [rsp + 0x40]
01465 48894424f8                     mov        qword ptr [rsp - 8], rax
0146a 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0146e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01472 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01477 48ff742468                     push       qword ptr [rsp + 0x68]
0147c 488f442450                     pop        qword ptr [rsp + 0x50]
01481 48894424f8                     mov        qword ptr [rsp - 8], rax
01486 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0148a 89442460                       mov        dword ptr [rsp + 0x60], eax
0148e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01493 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01497 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0149c c5f877                         vzeroupper 
0149f e83c15b6ff                     call       0x7fa87b9d7d60
014a4 0f1f84009c150016               nop        dword ptr [rax + rax + 0x1600159c]
014ac be45ffffff                     mov        esi, 0xffffff45
014b1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
014b6 48894424f8                     mov        qword ptr [rsp - 8], rax
014bb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
014bf 89442408                       mov        dword ptr [rsp + 8], eax
014c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014c8 48ff742420                     push       qword ptr [rsp + 0x20]
014cd 488f442418                     pop        qword ptr [rsp + 0x18]
014d2 48894424f8                     mov        qword ptr [rsp - 8], rax
014d7 8b442428                       mov        eax, dword ptr [rsp + 0x28]
014db 8944240c                       mov        dword ptr [rsp + 0xc], eax
014df 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014e4 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
014e9 48894424f8                     mov        qword ptr [rsp - 8], rax
014ee 8b442458                       mov        eax, dword ptr [rsp + 0x58]
014f2 89442438                       mov        dword ptr [rsp + 0x38], eax
014f6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
014fb 48ff742460                     push       qword ptr [rsp + 0x60]
01500 488f442440                     pop        qword ptr [rsp + 0x40]
01505 48894424f8                     mov        qword ptr [rsp - 8], rax
0150a 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0150e 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01512 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01517 48ff742468                     push       qword ptr [rsp + 0x68]
0151c 488f442450                     pop        qword ptr [rsp + 0x50]
01521 48894424f8                     mov        qword ptr [rsp - 8], rax
01526 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0152a 89442458                       mov        dword ptr [rsp + 0x58], eax
0152e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01533 48894424f8                     mov        qword ptr [rsp - 8], rax
01538 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0153c 89442460                       mov        dword ptr [rsp + 0x60], eax
01540 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01545 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01549 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0154e 6690                           nop        
01550 c5f877                         vzeroupper 
01553 e88814b6ff                     call       0x7fa87b9d7d60
01558 0f1f840050160017               nop        dword ptr [rax + rax + 0x17001650]
01560 be45ffffff                     mov        esi, 0xffffff45
01565 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0156a 48894424f8                     mov        qword ptr [rsp - 8], rax
0156f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01573 89442408                       mov        dword ptr [rsp + 8], eax
01577 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0157c 48ff742420                     push       qword ptr [rsp + 0x20]
01581 488f442418                     pop        qword ptr [rsp + 0x18]
01586 48894424f8                     mov        qword ptr [rsp - 8], rax
0158b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0158f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01593 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01598 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0159d 48894424f8                     mov        qword ptr [rsp - 8], rax
015a2 8b442458                       mov        eax, dword ptr [rsp + 0x58]
015a6 89442438                       mov        dword ptr [rsp + 0x38], eax
015aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015af 48ff742460                     push       qword ptr [rsp + 0x60]
015b4 488f442440                     pop        qword ptr [rsp + 0x40]
015b9 48894424f8                     mov        qword ptr [rsp - 8], rax
015be 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
015c2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
015c6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015cb 48ff742468                     push       qword ptr [rsp + 0x68]
015d0 488f442450                     pop        qword ptr [rsp + 0x50]
015d5 48894424f8                     mov        qword ptr [rsp - 8], rax
015da 8b442470                       mov        eax, dword ptr [rsp + 0x70]
015de 89442460                       mov        dword ptr [rsp + 0x60], eax
015e2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
015e7 894c2470                       mov        dword ptr [rsp + 0x70], ecx
015eb 90                             nop        
015ec c5f877                         vzeroupper 
015ef e8ec13b6ff                     call       0x7fa87b9d7d60
015f4 0f1f8400ec160018               nop        dword ptr [rax + rax + 0x180016ec]
015fc be45ffffff                     mov        esi, 0xffffff45
01601 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01606 48894424f8                     mov        qword ptr [rsp - 8], rax
0160b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
0160f 89442408                       mov        dword ptr [rsp + 8], eax
01613 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01618 48ff742420                     push       qword ptr [rsp + 0x20]
0161d 488f442418                     pop        qword ptr [rsp + 0x18]
01622 48894424f8                     mov        qword ptr [rsp - 8], rax
01627 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0162b 8944240c                       mov        dword ptr [rsp + 0xc], eax
0162f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01634 48894424f8                     mov        qword ptr [rsp - 8], rax
01639 8b442438                       mov        eax, dword ptr [rsp + 0x38]
0163d 89442434                       mov        dword ptr [rsp + 0x34], eax
01641 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01646 48894424f8                     mov        qword ptr [rsp - 8], rax
0164b 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0164f 89442438                       mov        dword ptr [rsp + 0x38], eax
01653 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01658 48ff742460                     push       qword ptr [rsp + 0x60]
0165d 488f442440                     pop        qword ptr [rsp + 0x40]
01662 48894424f8                     mov        qword ptr [rsp - 8], rax
01667 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
0166b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0166f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01674 48ff742468                     push       qword ptr [rsp + 0x68]
01679 488f442450                     pop        qword ptr [rsp + 0x50]
0167e 48894424f8                     mov        qword ptr [rsp - 8], rax
01683 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01687 89442460                       mov        dword ptr [rsp + 0x60], eax
0168b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01690 895c2470                       mov        dword ptr [rsp + 0x70], ebx
01694 c5f877                         vzeroupper 
01697 e84413b6ff                     call       0x7fa87b9d7d60
0169c 0f1f840094170019               nop        dword ptr [rax + rax + 0x19001794]
016a4 4533d2                         xor        r10d, r10d
016a7 4c89542408                     mov        qword ptr [rsp + 8], r10
016ac e981eaffff                     jmp        0x7fa87be754b2
016b1 4533d2                         xor        r10d, r10d
016b4 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
016bc e99aeaffff                     jmp        0x7fa87be754db
016c1 4533d2                         xor        r10d, r10d
016c4 4c89942490000000               mov        qword ptr [rsp + 0x90], r10
016cc e9baeaffff                     jmp        0x7fa87be7550b
016d1 4533d2                         xor        r10d, r10d
016d4 4c89542420                     mov        qword ptr [rsp + 0x20], r10
016d9 e9d5eaffff                     jmp        0x7fa87be75533
016de 4533d2                         xor        r10d, r10d
016e1 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
016e9 e9f5eaffff                     jmp        0x7fa87be75563
016ee 4533d2                         xor        r10d, r10d
016f1 4c899424b8000000               mov        qword ptr [rsp + 0xb8], r10
016f9 e910ebffff                     jmp        0x7fa87be7558e
016fe bebeffffff                     mov        esi, 0xffffffbe
01703 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01708 48894424f8                     mov        qword ptr [rsp - 8], rax
0170d 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01711 89442408                       mov        dword ptr [rsp + 8], eax
01715 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0171a 48ff742420                     push       qword ptr [rsp + 0x20]
0171f 488f442418                     pop        qword ptr [rsp + 0x18]
01724 48894424f8                     mov        qword ptr [rsp - 8], rax
01729 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0172d 8944240c                       mov        dword ptr [rsp + 0xc], eax
01731 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01736 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
0173b 48894424f8                     mov        qword ptr [rsp - 8], rax
01740 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01744 89442438                       mov        dword ptr [rsp + 0x38], eax
01748 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0174d 48ff742460                     push       qword ptr [rsp + 0x60]
01752 488f442440                     pop        qword ptr [rsp + 0x40]
01757 48894424f8                     mov        qword ptr [rsp - 8], rax
0175c 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01760 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01769 666690                         nop        
0176c c5f877                         vzeroupper 
0176f e86c12b6ff                     call       0x7fa87b9d7d60
01774 0f1f84006c18001a               nop        dword ptr [rax + rax + 0x1a00186c]
0177c be85ffffff                     mov        esi, 0xffffff85
01781 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
01785 48894424f8                     mov        qword ptr [rsp - 8], rax
0178a 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0178e 890424                         mov        dword ptr [rsp], eax
01791 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01796 44896c2408                     mov        dword ptr [rsp + 8], r13d
0179b 48894424f8                     mov        qword ptr [rsp - 8], rax
017a0 8b442458                       mov        eax, dword ptr [rsp + 0x58]
017a4 8944240c                       mov        dword ptr [rsp + 0xc], eax
017a8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017ad 48ff742460                     push       qword ptr [rsp + 0x60]
017b2 488f442410                     pop        qword ptr [rsp + 0x10]
017b7 48894424f8                     mov        qword ptr [rsp - 8], rax
017bc 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
017c0 89442418                       mov        dword ptr [rsp + 0x18], eax
017c4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c9 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
017ce 4c89742460                     mov        qword ptr [rsp + 0x60], r14
017d3 90                             nop        
017d4 c5f877                         vzeroupper 
017d7 e80412b6ff                     call       0x7fa87b9d7d60
017dc 0f1f8400d418001b               nop        dword ptr [rax + rax + 0x1b0018d4]
017e4 bee4ffffff                     mov        esi, 0xffffffe4
017e9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
017ee 48894424f8                     mov        qword ptr [rsp - 8], rax
017f3 8b442410                       mov        eax, dword ptr [rsp + 0x10]
017f7 89442408                       mov        dword ptr [rsp + 8], eax
017fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01800 48ff742420                     push       qword ptr [rsp + 0x20]
01805 488f442418                     pop        qword ptr [rsp + 0x18]
0180a 48894424f8                     mov        qword ptr [rsp - 8], rax
0180f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01813 8944240c                       mov        dword ptr [rsp + 0xc], eax
01817 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0181c 48894424f8                     mov        qword ptr [rsp - 8], rax
01821 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01825 89442430                       mov        dword ptr [rsp + 0x30], eax
01829 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0182e 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01833 48894424f8                     mov        qword ptr [rsp - 8], rax
01838 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0183c 89442438                       mov        dword ptr [rsp + 0x38], eax
01840 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01845 48ff742460                     push       qword ptr [rsp + 0x60]
0184a 488f442440                     pop        qword ptr [rsp + 0x40]
0184f 48894424f8                     mov        qword ptr [rsp - 8], rax
01854 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01858 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0185c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01861 48ffb42480000000               push       qword ptr [rsp + 0x80]
01869 488f442448                     pop        qword ptr [rsp + 0x48]
0186e 48ff742468                     push       qword ptr [rsp + 0x68]
01873 488f442450                     pop        qword ptr [rsp + 0x50]
01878 48894424f8                     mov        qword ptr [rsp - 8], rax
0187d 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01881 89442458                       mov        dword ptr [rsp + 0x58], eax
01885 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0188a 48894424f8                     mov        qword ptr [rsp - 8], rax
0188f 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01893 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01897 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0189c 48894424f8                     mov        qword ptr [rsp - 8], rax
018a1 8b442470                       mov        eax, dword ptr [rsp + 0x70]
018a5 89442460                       mov        dword ptr [rsp + 0x60], eax
018a9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018ae 894c2464                       mov        dword ptr [rsp + 0x64], ecx
018b2 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
018ba 6690                           nop        
018bc c5f877                         vzeroupper 
018bf e81c11b6ff                     call       0x7fa87b9d7d60
018c4 0f1f8400bc19001c               nop        dword ptr [rax + rax + 0x1c0019bc]
018cc bef6ffffff                     mov        esi, 0xfffffff6
018d1 666690                         nop        
018d4 c5f877                         vzeroupper 
018d7 e80411b6ff                     call       0x7fa87b9d7d60
018dc 0f1f8400d419001d               nop        dword ptr [rax + rax + 0x1d0019d4]
018e4 bee4ffffff                     mov        esi, 0xffffffe4
018e9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
018ee 48ffb42488000000               push       qword ptr [rsp + 0x88]
018f6 488f0424                       pop        qword ptr [rsp]
018fa 48894424f8                     mov        qword ptr [rsp - 8], rax
018ff 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01903 89442408                       mov        dword ptr [rsp + 8], eax
01907 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0190c 48ff742420                     push       qword ptr [rsp + 0x20]
01911 488f442418                     pop        qword ptr [rsp + 0x18]
01916 48894424f8                     mov        qword ptr [rsp - 8], rax
0191b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
0191f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01923 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01928 48894424f8                     mov        qword ptr [rsp - 8], rax
0192d 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01934 89442430                       mov        dword ptr [rsp + 0x30], eax
01938 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193d 48894424f8                     mov        qword ptr [rsp - 8], rax
01942 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01946 89442434                       mov        dword ptr [rsp + 0x34], eax
0194a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194f 48894424f8                     mov        qword ptr [rsp - 8], rax
01954 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01958 89442438                       mov        dword ptr [rsp + 0x38], eax
0195c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01961 48ff742460                     push       qword ptr [rsp + 0x60]
01966 488f442440                     pop        qword ptr [rsp + 0x40]
0196b 48894424f8                     mov        qword ptr [rsp - 8], rax
01970 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01974 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01978 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197d 48ffb42480000000               push       qword ptr [rsp + 0x80]
01985 488f442448                     pop        qword ptr [rsp + 0x48]
0198a 48ff742468                     push       qword ptr [rsp + 0x68]
0198f 488f442450                     pop        qword ptr [rsp + 0x50]
01994 48894424f8                     mov        qword ptr [rsp - 8], rax
01999 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0199d 89442458                       mov        dword ptr [rsp + 0x58], eax
019a1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019a6 48894424f8                     mov        qword ptr [rsp - 8], rax
019ab 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
019af 8944245c                       mov        dword ptr [rsp + 0x5c], eax
019b3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b8 48894424f8                     mov        qword ptr [rsp - 8], rax
019bd 8b442470                       mov        eax, dword ptr [rsp + 0x70]
019c1 89442460                       mov        dword ptr [rsp + 0x60], eax
019c5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ca 48894424f8                     mov        qword ptr [rsp - 8], rax
019cf 8b442478                       mov        eax, dword ptr [rsp + 0x78]
019d3 89442468                       mov        dword ptr [rsp + 0x68], eax
019d7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019dc 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
019e4 c5f877                         vzeroupper 
019e7 e8f40fb6ff                     call       0x7fa87b9d7d60
019ec 0f1f8400e41a001e               nop        dword ptr [rax + rax + 0x1e001ae4]
019f4 bee4ffffff                     mov        esi, 0xffffffe4
019f9 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
019fe 48ffb42488000000               push       qword ptr [rsp + 0x88]
01a06 488f0424                       pop        qword ptr [rsp]
01a0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0f 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01a13 89442408                       mov        dword ptr [rsp + 8], eax
01a17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1c 48ff742420                     push       qword ptr [rsp + 0x20]
01a21 488f442418                     pop        qword ptr [rsp + 0x18]
01a26 48894424f8                     mov        qword ptr [rsp - 8], rax
01a2b 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01a2f 8944240c                       mov        dword ptr [rsp + 0xc], eax
01a33 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a38 48894424f8                     mov        qword ptr [rsp - 8], rax
01a3d 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01a41 89442434                       mov        dword ptr [rsp + 0x34], eax
01a45 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a4a 48894424f8                     mov        qword ptr [rsp - 8], rax
01a4f 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01a53 89442438                       mov        dword ptr [rsp + 0x38], eax
01a57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a5c 48ff742460                     push       qword ptr [rsp + 0x60]
01a61 488f442440                     pop        qword ptr [rsp + 0x40]
01a66 48894424f8                     mov        qword ptr [rsp - 8], rax
01a6b 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01a6f 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01a73 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a78 48ffb42480000000               push       qword ptr [rsp + 0x80]
01a80 488f442448                     pop        qword ptr [rsp + 0x48]
01a85 48ff742468                     push       qword ptr [rsp + 0x68]
01a8a 488f442450                     pop        qword ptr [rsp + 0x50]
01a8f 48894424f8                     mov        qword ptr [rsp - 8], rax
01a94 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01a98 89442458                       mov        dword ptr [rsp + 0x58], eax
01a9c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa1 48894424f8                     mov        qword ptr [rsp - 8], rax
01aa6 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01aaa 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01aae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ab3 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab8 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01abc 89442460                       mov        dword ptr [rsp + 0x60], eax
01ac0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac5 48894424f8                     mov        qword ptr [rsp - 8], rax
01aca 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01ace 89442468                       mov        dword ptr [rsp + 0x68], eax
01ad2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ad7 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01adc 44894c2474                     mov        dword ptr [rsp + 0x74], r9d
01ae1 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
01ae9 666690                         nop        
01aec c5f877                         vzeroupper 
01aef e8ec0eb6ff                     call       0x7fa87b9d7d60
01af4 0f1f8400ec1b001f               nop        dword ptr [rax + rax + 0x1f001bec]
01afc beccffffff                     mov        esi, 0xffffffcc
01b01 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01b06 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01b0f 89442408                       mov        dword ptr [rsp + 8], eax
01b13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b18 48ff742420                     push       qword ptr [rsp + 0x20]
01b1d 488f442418                     pop        qword ptr [rsp + 0x18]
01b22 48894424f8                     mov        qword ptr [rsp - 8], rax
01b27 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01b2b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01b2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b34 48894424f8                     mov        qword ptr [rsp - 8], rax
01b39 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01b40 89442430                       mov        dword ptr [rsp + 0x30], eax
01b44 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b49 48894424f8                     mov        qword ptr [rsp - 8], rax
01b4e 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01b52 89442434                       mov        dword ptr [rsp + 0x34], eax
01b56 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b60 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01b64 89442438                       mov        dword ptr [rsp + 0x38], eax
01b68 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b6d 48ff742460                     push       qword ptr [rsp + 0x60]
01b72 488f442440                     pop        qword ptr [rsp + 0x40]
01b77 48894424f8                     mov        qword ptr [rsp - 8], rax
01b7c 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01b80 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01b84 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b89 48ffb42480000000               push       qword ptr [rsp + 0x80]
01b91 488f442448                     pop        qword ptr [rsp + 0x48]
01b96 48ff742468                     push       qword ptr [rsp + 0x68]
01b9b 488f442450                     pop        qword ptr [rsp + 0x50]
01ba0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba5 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01ba9 89442458                       mov        dword ptr [rsp + 0x58], eax
01bad 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb2 48894424f8                     mov        qword ptr [rsp - 8], rax
01bb7 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01bbb 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01bbf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bc4 48894424f8                     mov        qword ptr [rsp - 8], rax
01bc9 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01bcd 89442460                       mov        dword ptr [rsp + 0x60], eax
01bd1 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bd6 44899c2480000000               mov        dword ptr [rsp + 0x80], r11d
01bde 6690                           nop        
01be0 c5f877                         vzeroupper 
01be3 e8f80db6ff                     call       0x7fa87b9d7d60
01be8 0f1f8400e01c0020               nop        dword ptr [rax + rax + 0x20001ce0]
01bf0 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01bf8 458d5308                       lea        r10d, [r11 + 8]
01bfc be6effffff                     mov        esi, 0xffffff6e
01c01 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01c06 48894424f8                     mov        qword ptr [rsp - 8], rax
01c0b 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01c0f 89442408                       mov        dword ptr [rsp + 8], eax
01c13 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c18 48ff742420                     push       qword ptr [rsp + 0x20]
01c1d 488f442418                     pop        qword ptr [rsp + 0x18]
01c22 48894424f8                     mov        qword ptr [rsp - 8], rax
01c27 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01c2b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01c2f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c34 48894424f8                     mov        qword ptr [rsp - 8], rax
01c39 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01c3d 89442434                       mov        dword ptr [rsp + 0x34], eax
01c41 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c46 48894424f8                     mov        qword ptr [rsp - 8], rax
01c4b 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01c4f 89442438                       mov        dword ptr [rsp + 0x38], eax
01c53 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c58 48ff742460                     push       qword ptr [rsp + 0x60]
01c5d 488f442440                     pop        qword ptr [rsp + 0x40]
01c62 48894424f8                     mov        qword ptr [rsp - 8], rax
01c67 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01c6b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01c6f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c74 48ff742468                     push       qword ptr [rsp + 0x68]
01c79 488f442450                     pop        qword ptr [rsp + 0x50]
01c7e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c83 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01c87 89442458                       mov        dword ptr [rsp + 0x58], eax
01c8b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c90 48894424f8                     mov        qword ptr [rsp - 8], rax
01c95 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01c99 89442460                       mov        dword ptr [rsp + 0x60], eax
01c9d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ca2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca7 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01cab 89442468                       mov        dword ptr [rsp + 0x68], eax
01caf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb4 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01cb9 48894424f8                     mov        qword ptr [rsp - 8], rax
01cbe 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01cc5 89442474                       mov        dword ptr [rsp + 0x74], eax
01cc9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cce 6690                           nop        
01cd0 c5f877                         vzeroupper 
01cd3 e8080db6ff                     call       0x7fa87b9d7d60
01cd8 0f1f8400d01d0021               nop        dword ptr [rax + rax + 0x21001dd0]
01ce0 448b9c24b4000000               mov        r11d, dword ptr [rsp + 0xb4]
01ce8 458d5308                       lea        r10d, [r11 + 8]
01cec be66ffffff                     mov        esi, 0xffffff66
01cf1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfb 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01cff 89442408                       mov        dword ptr [rsp + 8], eax
01d03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d08 48ff742420                     push       qword ptr [rsp + 0x20]
01d0d 488f442418                     pop        qword ptr [rsp + 0x18]
01d12 48894424f8                     mov        qword ptr [rsp - 8], rax
01d17 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01d1b 8944240c                       mov        dword ptr [rsp + 0xc], eax
01d1f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d24 48894424f8                     mov        qword ptr [rsp - 8], rax
01d29 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01d2d 89442434                       mov        dword ptr [rsp + 0x34], eax
01d31 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d36 48894424f8                     mov        qword ptr [rsp - 8], rax
01d3b 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01d3f 89442438                       mov        dword ptr [rsp + 0x38], eax
01d43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d48 48ff742460                     push       qword ptr [rsp + 0x60]
01d4d 488f442440                     pop        qword ptr [rsp + 0x40]
01d52 48894424f8                     mov        qword ptr [rsp - 8], rax
01d57 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01d5b 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01d5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d64 48ff742468                     push       qword ptr [rsp + 0x68]
01d69 488f442450                     pop        qword ptr [rsp + 0x50]
01d6e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d73 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01d77 89442458                       mov        dword ptr [rsp + 0x58], eax
01d7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d80 48894424f8                     mov        qword ptr [rsp - 8], rax
01d85 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01d89 89442460                       mov        dword ptr [rsp + 0x60], eax
01d8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d92 48894424f8                     mov        qword ptr [rsp - 8], rax
01d97 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01d9b 89442468                       mov        dword ptr [rsp + 0x68], eax
01d9f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01da4 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
01da9 48894424f8                     mov        qword ptr [rsp - 8], rax
01dae 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01db5 89442474                       mov        dword ptr [rsp + 0x74], eax
01db9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dbe 6690                           nop        
01dc0 c5f877                         vzeroupper 
01dc3 e8180cb6ff                     call       0x7fa87b9d7d60
01dc8 0f1f8400c01e0022               nop        dword ptr [rax + rax + 0x22001ec0]
01dd0 be6effffff                     mov        esi, 0xffffff6e
01dd5 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01dda 48894424f8                     mov        qword ptr [rsp - 8], rax
01ddf 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01de3 89442408                       mov        dword ptr [rsp + 8], eax
01de7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dec 48ff742420                     push       qword ptr [rsp + 0x20]
01df1 488f442418                     pop        qword ptr [rsp + 0x18]
01df6 48894424f8                     mov        qword ptr [rsp - 8], rax
01dfb 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01dff 8944240c                       mov        dword ptr [rsp + 0xc], eax
01e03 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e08 48894424f8                     mov        qword ptr [rsp - 8], rax
01e0d 8b442478                       mov        eax, dword ptr [rsp + 0x78]
01e11 89442430                       mov        dword ptr [rsp + 0x30], eax
01e15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e1a 44896c2434                     mov        dword ptr [rsp + 0x34], r13d
01e1f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e24 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01e28 89442438                       mov        dword ptr [rsp + 0x38], eax
01e2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e31 48ff742460                     push       qword ptr [rsp + 0x60]
01e36 488f442440                     pop        qword ptr [rsp + 0x40]
01e3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e40 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01e44 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01e48 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e4d 48ff742468                     push       qword ptr [rsp + 0x68]
01e52 488f442450                     pop        qword ptr [rsp + 0x50]
01e57 48894424f8                     mov        qword ptr [rsp - 8], rax
01e5c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01e60 89442458                       mov        dword ptr [rsp + 0x58], eax
01e64 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e69 48894424f8                     mov        qword ptr [rsp - 8], rax
01e6e 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01e72 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01e76 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e7b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e80 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01e84 89442460                       mov        dword ptr [rsp + 0x60], eax
01e88 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e8d 894c2464                       mov        dword ptr [rsp + 0x64], ecx
01e91 44894c246c                     mov        dword ptr [rsp + 0x6c], r9d
01e96 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01e9b 90                             nop        
01e9c c5f877                         vzeroupper 
01e9f e83c0bb6ff                     call       0x7fa87b9d7d60
01ea4 0f1f84009c1f0023               nop        dword ptr [rax + rax + 0x23001f9c]
01eac bee4ffffff                     mov        esi, 0xffffffe4
01eb1 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
01eb6 48ffb42488000000               push       qword ptr [rsp + 0x88]
01ebe 488f0424                       pop        qword ptr [rsp]
01ec2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ec7 8b442410                       mov        eax, dword ptr [rsp + 0x10]
01ecb 89442408                       mov        dword ptr [rsp + 8], eax
01ecf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ed4 48ff742420                     push       qword ptr [rsp + 0x20]
01ed9 488f442418                     pop        qword ptr [rsp + 0x18]
01ede 48894424f8                     mov        qword ptr [rsp - 8], rax
01ee3 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01ee7 8944240c                       mov        dword ptr [rsp + 0xc], eax
01eeb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ef0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ef5 8b442438                       mov        eax, dword ptr [rsp + 0x38]
01ef9 89442430                       mov        dword ptr [rsp + 0x30], eax
01efd 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f02 48894424f8                     mov        qword ptr [rsp - 8], rax
01f07 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01f0b 89442434                       mov        dword ptr [rsp + 0x34], eax
01f0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f14 48ff742460                     push       qword ptr [rsp + 0x60]
01f19 488f442438                     pop        qword ptr [rsp + 0x38]
01f1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01f23 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01f27 89442440                       mov        dword ptr [rsp + 0x40], eax
01f2b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f30 48ffb42480000000               push       qword ptr [rsp + 0x80]
01f38 488f442448                     pop        qword ptr [rsp + 0x48]
01f3d 48ff742468                     push       qword ptr [rsp + 0x68]
01f42 488f442450                     pop        qword ptr [rsp + 0x50]
01f47 48894424f8                     mov        qword ptr [rsp - 8], rax
01f4c 8b442474                       mov        eax, dword ptr [rsp + 0x74]
01f50 89442444                       mov        dword ptr [rsp + 0x44], eax
01f54 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f59 48894424f8                     mov        qword ptr [rsp - 8], rax
01f5e 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
01f62 89442458                       mov        dword ptr [rsp + 0x58], eax
01f66 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f6b 48894424f8                     mov        qword ptr [rsp - 8], rax
01f70 8b442470                       mov        eax, dword ptr [rsp + 0x70]
01f74 8944245c                       mov        dword ptr [rsp + 0x5c], eax
01f78 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f7d 48894424f8                     mov        qword ptr [rsp - 8], rax
01f82 8b8424b0000000                 mov        eax, dword ptr [rsp + 0xb0]
01f89 89442468                       mov        dword ptr [rsp + 0x68], eax
01f8d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f92 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01f9a 6690                           nop        
01f9c c5f877                         vzeroupper 
01f9f e83c0ab6ff                     call       0x7fa87b9d7d60
01fa4 0f1f84009c200024               nop        dword ptr [rax + rax + 0x2400209c]
01fac bee4ffffff                     mov        esi, 0xffffffe4
01fb1 48ff742408                     push       qword ptr [rsp + 8]
01fb6 488f0424                       pop        qword ptr [rsp]
01fba 48ffb42488000000               push       qword ptr [rsp + 0x88]
01fc2 488f442408                     pop        qword ptr [rsp + 8]
01fc7 48894424f8                     mov        qword ptr [rsp - 8], rax
01fcc 8b442428                       mov        eax, dword ptr [rsp + 0x28]
01fd0 89442414                       mov        dword ptr [rsp + 0x14], eax
01fd4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01fd9 48894424f8                     mov        qword ptr [rsp - 8], rax
01fde 8b442458                       mov        eax, dword ptr [rsp + 0x58]
01fe2 8944243c                       mov        dword ptr [rsp + 0x3c], eax
01fe6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01feb 48ff742460                     push       qword ptr [rsp + 0x60]
01ff0 488f442440                     pop        qword ptr [rsp + 0x40]
01ff5 48894424f8                     mov        qword ptr [rsp - 8], rax
01ffa 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
01ffe 89442448                       mov        dword ptr [rsp + 0x48], eax
02002 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02007 48ffb42480000000               push       qword ptr [rsp + 0x80]
0200f 488f442450                     pop        qword ptr [rsp + 0x50]
02014 48ff742468                     push       qword ptr [rsp + 0x68]
02019 488f442458                     pop        qword ptr [rsp + 0x58]
0201e 48894424f8                     mov        qword ptr [rsp - 8], rax
02023 8b442474                       mov        eax, dword ptr [rsp + 0x74]
02027 8944244c                       mov        dword ptr [rsp + 0x4c], eax
0202b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02030 48894424f8                     mov        qword ptr [rsp - 8], rax
02035 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
02039 89442460                       mov        dword ptr [rsp + 0x60], eax
0203d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02042 48894424f8                     mov        qword ptr [rsp - 8], rax
02047 8b442470                       mov        eax, dword ptr [rsp + 0x70]
0204b 89442464                       mov        dword ptr [rsp + 0x64], eax
0204f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02054 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
0205c c5f877                         vzeroupper 
0205f e87c09b6ff                     call       0x7fa87b9d7d60
02064 0f1f84005c210025               nop        dword ptr [rax + rax + 0x2500215c]
0206c 8bac24b4000000                 mov        ebp, dword ptr [rsp + 0xb4]
02073 ffc5                           inc        ebp
02075 bee4ffffff                     mov        esi, 0xffffffe4
0207a 48ff742408                     push       qword ptr [rsp + 8]
0207f 488f0424                       pop        qword ptr [rsp]
02083 48ffb42488000000               push       qword ptr [rsp + 0x88]
0208b 488f442408                     pop        qword ptr [rsp + 8]
02090 48ffb42490000000               push       qword ptr [rsp + 0x90]
02098 488f442418                     pop        qword ptr [rsp + 0x18]
0209d 48894424f8                     mov        qword ptr [rsp - 8], rax
020a2 8b442428                       mov        eax, dword ptr [rsp + 0x28]
020a6 89442414                       mov        dword ptr [rsp + 0x14], eax
020aa 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020af 48894424f8                     mov        qword ptr [rsp - 8], rax
020b4 8b442458                       mov        eax, dword ptr [rsp + 0x58]
020b8 8944243c                       mov        dword ptr [rsp + 0x3c], eax
020bc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020c1 48ff742460                     push       qword ptr [rsp + 0x60]
020c6 488f442440                     pop        qword ptr [rsp + 0x40]
020cb 48894424f8                     mov        qword ptr [rsp - 8], rax
020d0 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
020d4 89442448                       mov        dword ptr [rsp + 0x48], eax
020d8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020dd 48ffb42480000000               push       qword ptr [rsp + 0x80]
020e5 488f442450                     pop        qword ptr [rsp + 0x50]
020ea 48ff742468                     push       qword ptr [rsp + 0x68]
020ef 488f442458                     pop        qword ptr [rsp + 0x58]
020f4 48894424f8                     mov        qword ptr [rsp - 8], rax
020f9 8b442474                       mov        eax, dword ptr [rsp + 0x74]
020fd 8944244c                       mov        dword ptr [rsp + 0x4c], eax
02101 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02106 48894424f8                     mov        qword ptr [rsp - 8], rax
0210b 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
0210f 89442460                       mov        dword ptr [rsp + 0x60], eax
02113 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02118 48894424f8                     mov        qword ptr [rsp - 8], rax
0211d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
02121 89442464                       mov        dword ptr [rsp + 0x64], eax
02125 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0212a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
02132 6690                           nop        
02134 c5f877                         vzeroupper 
02137 e8a408b6ff                     call       0x7fa87b9d7d60
0213c 0f1f840034220026               nop        dword ptr [rax + rax + 0x26002234]
02144 bee4ffffff                     mov        esi, 0xffffffe4
02149 48ff742408                     push       qword ptr [rsp + 8]
0214e 488f0424                       pop        qword ptr [rsp]
02152 48ffb42488000000               push       qword ptr [rsp + 0x88]
0215a 488f442408                     pop        qword ptr [rsp + 8]
0215f 48894424f8                     mov        qword ptr [rsp - 8], rax
02164 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02168 89442414                       mov        dword ptr [rsp + 0x14], eax
0216c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02171 48894424f8                     mov        qword ptr [rsp - 8], rax
02176 8b442458                       mov        eax, dword ptr [rsp + 0x58]
0217a 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0217e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02183 48ff742460                     push       qword ptr [rsp + 0x60]
02188 488f442440                     pop        qword ptr [rsp + 0x40]
0218d 48894424f8                     mov        qword ptr [rsp - 8], rax
02192 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02196 89442448                       mov        dword ptr [rsp + 0x48], eax
0219a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0219f 48ffb42480000000               push       qword ptr [rsp + 0x80]
021a7 488f442450                     pop        qword ptr [rsp + 0x50]
021ac 48ff742468                     push       qword ptr [rsp + 0x68]
021b1 488f442458                     pop        qword ptr [rsp + 0x58]
021b6 48894424f8                     mov        qword ptr [rsp - 8], rax
021bb 8b442474                       mov        eax, dword ptr [rsp + 0x74]
021bf 8944244c                       mov        dword ptr [rsp + 0x4c], eax
021c3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021c8 48894424f8                     mov        qword ptr [rsp - 8], rax
021cd 8b44247c                       mov        eax, dword ptr [rsp + 0x7c]
021d1 89442460                       mov        dword ptr [rsp + 0x60], eax
021d5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021da 48894424f8                     mov        qword ptr [rsp - 8], rax
021df 8b442470                       mov        eax, dword ptr [rsp + 0x70]
021e3 89442464                       mov        dword ptr [rsp + 0x64], eax
021e7 488b4424f8                     mov        rax, qword ptr [rsp - 8]
021ec 44898c2488000000               mov        dword ptr [rsp + 0x88], r9d
021f4 c5f877                         vzeroupper 
021f7 e8e407b6ff                     call       0x7fa87b9d7d60
021fc 0f1f8400f4220027               nop        dword ptr [rax + rax + 0x270022f4]
02204 bee4ffffff                     mov        esi, 0xffffffe4
02209 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
0220e 48894424f8                     mov        qword ptr [rsp - 8], rax
02213 8b442410                       mov        eax, dword ptr [rsp + 0x10]
02217 89442408                       mov        dword ptr [rsp + 8], eax
0221b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02220 48ff742420                     push       qword ptr [rsp + 0x20]
02225 488f442418                     pop        qword ptr [rsp + 0x18]
0222a 48894424f8                     mov        qword ptr [rsp - 8], rax
0222f 8b442428                       mov        eax, dword ptr [rsp + 0x28]
02233 8944240c                       mov        dword ptr [rsp + 0xc], eax
02237 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0223c 48894424f8                     mov        qword ptr [rsp - 8], rax
02241 8b442438                       mov        eax, dword ptr [rsp + 0x38]
02245 89442430                       mov        dword ptr [rsp + 0x30], eax
02249 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0224e 48894424f8                     mov        qword ptr [rsp - 8], rax
02253 8b442458                       mov        eax, dword ptr [rsp + 0x58]
02257 89442434                       mov        dword ptr [rsp + 0x34], eax
0225b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02260 48ff742460                     push       qword ptr [rsp + 0x60]
02265 488f442438                     pop        qword ptr [rsp + 0x38]
0226a 48894424f8                     mov        qword ptr [rsp - 8], rax
0226f 8b44245c                       mov        eax, dword ptr [rsp + 0x5c]
02273 89442440                       mov        dword ptr [rsp + 0x40], eax
02277 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0227c 48ff742468                     push       qword ptr [rsp + 0x68]
02281 488f442450                     pop        qword ptr [rsp + 0x50]
02286 48894424f8                     mov        qword ptr [rsp - 8], rax
0228b 8b442474                       mov        eax, dword ptr [rsp + 0x74]
0228f 89442444                       mov        dword ptr [rsp + 0x44], eax
02293 488b4424f8                     mov        rax, qword ptr [rsp - 8]
02298 48894424f8                     mov        qword ptr [rsp - 8], rax
0229d 8b442470                       mov        eax, dword ptr [rsp + 0x70]
022a1 8944245c                       mov        dword ptr [rsp + 0x5c], eax
022a5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
022aa 6690                           nop        
022ac c5f877                         vzeroupper 
022af e82c07b6ff                     call       0x7fa87b9d7d60
022b4 0f1f8400ac230028               nop        dword ptr [rax + rax + 0x280023ac]
022bc 448b5c2478                     mov        r11d, dword ptr [rsp + 0x78]
022c1 beccffffff                     mov        esi, 0xffffffcc
022c6 488b6c2408                     mov        rbp, qword ptr [rsp + 8]
022cb 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
022d0 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
022d5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
022da 6690                           nop        
022dc c5f877                         vzeroupper 
022df e8fc06b6ff                     call       0x7fa87b9d7d60
022e4 0f1f8400dc230029               nop        dword ptr [rax + rax + 0x290023dc]
022ec eb10                           jmp        0x7fa87be7767e
022ee eb0e                           jmp        0x7fa87be7767e
022f0 eb0c                           jmp        0x7fa87be7767e
022f2 eb0a                           jmp        0x7fa87be7767e
022f4 eb08                           jmp        0x7fa87be7767e
022f6 eb06                           jmp        0x7fa87be7767e
022f8 eb04                           jmp        0x7fa87be7767e
022fa eb02                           jmp        0x7fa87be7767e
022fc eb00                           jmp        0x7fa87be7767e
022fe 488bf0                         mov        rsi, rax
02301 e942e3ffff                     jmp        0x7fa87be759c8
02306 bef6ffffff                     mov        esi, 0xfffffff6
0230b 90                             nop        
0230c c5f877                         vzeroupper 
0230f e8cc06b6ff                     call       0x7fa87b9d7d60
02314 0f1f84000c24002a               nop        dword ptr [rax + rax + 0x2a00240c]
0231c 49ba5661e77ba87f0000           movabs     r10, 0x7fa87be76156
02326 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0232d e92eb8a9ff                     jmp        0x7fa87b912ee0
02332 e8e983a8ff                     call       0x7fa87b8ffaa0
02337 e9f2dcffff                     jmp        0x7fa87be753ae
0233c f4                             hlt        
0233d f4                             hlt        
0233e f4                             hlt        
0233f f4                             hlt        
