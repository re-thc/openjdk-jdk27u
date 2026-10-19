00000 0f1f840000000000               nop        dword ptr [rax + rax]
00008 0f1f8000000000                 nop        dword ptr [rax]
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f8540b1a9ff                   jne        0x7f46ff8fa960
00020 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00027 55                             push       rbp
00028 4881ecb0000000                 sub        rsp, 0xb0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 0f8558180000                   jne        0x7f46ffe61096
0003e 4c894c2450                     mov        qword ptr [rsp + 0x50], r9
00043 890c24                         mov        dword ptr [rsp], ecx
00046 4d8bd0                         mov        r10, r8
00049 448bc7                         mov        r8d, edi
0004c 488bde                         mov        rbx, rsi
0004f 448b4e38                       mov        r9d, dword ptr [rsi + 0x38]
00053 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
00058 448b5e04                       mov        r11d, dword ptr [rsi + 4]
0005c 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00061 418bcb                         mov        ecx, r11d
00064 412bc9                         sub        ecx, r9d
00067 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0006f 443bd9                         cmp        r11d, ecx
00072 0f8f26110000                   jg         0x7f46ffe6099e
00078 488b6e08                       mov        rbp, qword ptr [rsi + 8]
0007c 4c8b4e20                       mov        r9, qword ptr [rsi + 0x20]
00080 48638c24c0000000               movsxd     rcx, dword ptr [rsp + 0xc0]
00088 4c635c2418                     movsxd     r11, dword ptr [rsp + 0x18]
0008d 4c03dd                         add        r11, rbp
00090 4d2bcb                         sub        r9, r11
00093 493bc9                         cmp        rcx, r9
00096 0f8f02110000                   jg         0x7f46ffe6099e
0009c 4c8b7610                       mov        r14, qword ptr [rsi + 0x10]
000a0 4c8b6e28                       mov        r13, qword ptr [rsi + 0x28]
000a4 4d85ed                         test       r13, r13
000a7 0f842b0c0000                   je         0x7f46ffe604d8
000ad 33ff                           xor        edi, edi
000af 4c8bda                         mov        r11, rdx
000b2 8b4204                         mov        eax, dword ptr [rdx + 4]
000b5 448b4e40                       mov        r9d, dword ptr [rsi + 0x40]
000b9 4585c0                         test       r8d, r8d
000bc 0f8ece100000                   jle        0x7f46ffe60990
000c2 4c2bed                         sub        r13, rbp
000c5 8d48e0                         lea        ecx, [rax - 0x20]
000c8 8b542460                       mov        edx, dword ptr [rsp + 0x60]
000cc 83c2e0                         add        edx, -0x20
000cf 418b7204                       mov        esi, dword ptr [r10 + 4]
000d3 85f6                           test       esi, esi
000d5 0f86e6100000                   jbe        0x7f46ffe609c1
000db 89542428                       mov        dword ptr [rsp + 0x28], edx
000df 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
000e3 89442404                       mov        dword ptr [rsp + 4], eax
000e7 4c896c2470                     mov        qword ptr [rsp + 0x70], r13
000ec 4c89742468                     mov        qword ptr [rsp + 0x68], r14
000f1 48896c2420                     mov        qword ptr [rsp + 0x20], rbp
000f6 4c89542408                     mov        qword ptr [rsp + 8], r10
000fb 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00100 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
00108 48895c2458                     mov        qword ptr [rsp + 0x58], rbx
0010d 4c63d6                         movsxd     r10, esi
00110 4d63d8                         movsxd     r11, r8d
00113 49ffcb                         dec        r11
00116 4d3bda                         cmp        r11, r10
00119 0f8395100000                   jae        0x7f46ffe609b4
0011f 85ff                           test       edi, edi
00121 0f84f5100000                   je         0x7f46ffe60a1c
00127 448d58f1                       lea        r11d, [rax - 0xf]
0012b 4585db                         test       r11d, r11d
0012e 0f8cf7100000                   jl         0x7f46ffe60a2b
00134 458b5104                       mov        r10d, dword ptr [r9 + 4]
00138 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0013d 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00142 897c2464                       mov        dword ptr [rsp + 0x64], edi
00146 4183c2f1                       add        r10d, -0xf
0014a 4585d2                         test       r10d, r10d
0014d 0f8ce7100000                   jl         0x7f46ffe60a3a
00153 4c8b9424c8000000               mov        r10, qword ptr [rsp + 0xc8]
0015b 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0015f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00164 4585db                         test       r11d, r11d
00167 0f86df100000                   jbe        0x7f46ffe60a4c
0016d 4183fb01                       cmp        r11d, 1
00171 0f86d5100000                   jbe        0x7f46ffe60a4c
00177 4183fb02                       cmp        r11d, 2
0017b 0f86cb100000                   jbe        0x7f46ffe60a4c
00181 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
00186 4183c3f9                       add        r11d, -7
0018a 4585db                         test       r11d, r11d
0018d 0f8cb9100000                   jl         0x7f46ffe60a4c
00193 448bc0                         mov        r8d, eax
00196 4d8bd1                         mov        r10, r9
00199 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0019e 4183c0f1                       add        r8d, -0xf
001a2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
001a7 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
001ac 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
001b1 458d5af1                       lea        r11d, [r10 - 0xf]
001b5 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
001ba 4533d2                         xor        r10d, r10d
001bd 33db                           xor        ebx, ebx
001bf e9ba010000                     jmp        0x7f46ffe5fb7e
001c4 4533db                         xor        r11d, r11d
001c7 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
001cc 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001d4 458b4b0c                       mov        r9d, dword ptr [r11 + 0xc]
001d8 448bd8                         mov        r11d, eax
001db 4183fb03                       cmp        r11d, 3
001df 0f8e1b020000                   jle        0x7f46ffe5fc00
001e5 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
001ed 45894b10                       mov        dword ptr [r11 + 0x10], r9d
001f1 458b5b08                       mov        r11d, dword ptr [r11 + 8]
001f5 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
001fd 4589580c                       mov        dword ptr [r8 + 0xc], r11d
00201 448d58fd                       lea        r11d, [rax - 3]
00205 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0020a 45895808                       mov        dword ptr [r8 + 8], r11d
0020e 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00215 4c635c247c                     movsxd     r11, dword ptr [rsp + 0x7c]
0021a 48634c2418                     movsxd     rcx, dword ptr [rsp + 0x18]
0021f 48034c2420                     add        rcx, qword ptr [rsp + 0x20]
00224 4c634c2430                     movsxd     r9, dword ptr [rsp + 0x30]
00229 4903c9                         add        rcx, r9
0022c 4c3bd9                         cmp        r11, rcx
0022f 0f8fff0c0000                   jg         0x7f46ffe60734
00235 448b44247c                     mov        r8d, dword ptr [rsp + 0x7c]
0023a 4585c0                         test       r8d, r8d
0023d 0f8e490c0000                   jle        0x7f46ffe6068c
00243 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
00248 4403442430                     add        r8d, dword ptr [rsp + 0x30]
0024d 4403442434                     add        r8d, dword ptr [rsp + 0x34]
00252 443b442428                     cmp        r8d, dword ptr [rsp + 0x28]
00257 0f8f3b0d0000                   jg         0x7f46ffe60798
0025d 458bda                         mov        r11d, r10d
00260 44035c2430                     add        r11d, dword ptr [rsp + 0x30]
00265 443b5c242c                     cmp        r11d, dword ptr [rsp + 0x2c]
0026a 0f8fb00d0000                   jg         0x7f46ffe60820
00270 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00275 4183f810                       cmp        r8d, 0x10
00279 0f8f290e0000                   jg         0x7f46ffe608a8
0027f 443b542448                     cmp        r10d, dword ptr [rsp + 0x48]
00284 0f836b0a0000                   jae        0x7f46ffe604f5
0028a 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00292 c4817a6f441308                 vmovdqu    xmm0, xmmword ptr [r11 + r10 + 8]
00299 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0029e 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
002a3 0f83a30a0000                   jae        0x7f46ffe6054c
002a9 4503c2                         add        r8d, r10d
002ac 4489842480000000               mov        dword ptr [rsp + 0x80], r8d
002b4 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
002b9 418bda                         mov        ebx, r10d
002bc 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002c1 4503da                         add        r11d, r10d
002c4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
002c9 4d63c2                         movsxd     r8, r10d
002cc 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
002d1 c4817a7f440208                 vmovdqu    xmmword ptr [r10 + r8 + 8], xmm0
002d8 458bd3                         mov        r10d, r11d
002db 442b54247c                     sub        r10d, dword ptr [rsp + 0x7c]
002e0 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
002e8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002ed 4183fb10                       cmp        r11d, 0x10
002f1 0f8f310e0000                   jg         0x7f46ffe60928
002f7 448b54247c                     mov        r10d, dword ptr [rsp + 0x7c]
002fc 4183fa10                       cmp        r10d, 0x10
00300 0f8cfa010000                   jl         0x7f46ffe5fd00
00306 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0030e 443b542478                     cmp        r10d, dword ptr [rsp + 0x78]
00313 0f83930a0000                   jae        0x7f46ffe605ac
00319 458bda                         mov        r11d, r10d
0031c 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
00321 c4817a6f441a08                 vmovdqu    xmm0, xmmword ptr [r10 + r11 + 8]
00328 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0032d 443b5c2478                     cmp        r11d, dword ptr [rsp + 0x78]
00332 0f83dc0a0000                   jae        0x7f46ffe60614
00338 448bd3                         mov        r10d, ebx
0033b 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00340 4d63c2                         movsxd     r8, r10d
00343 478d0c13                       lea        r9d, [r11 + r10]
00347 44034c2434                     add        r9d, dword ptr [rsp + 0x34]
0034c 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
00351 4d63d3                         movsxd     r10, r11d
00354 4d03d0                         add        r10, r8
00357 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0035c c4817a7f441308                 vmovdqu    xmmword ptr [r11 + r10 + 8], xmm0
00363 8b9c2494000000                 mov        ebx, dword ptr [rsp + 0x94]
0036a ffc3                           inc        ebx
0036c 3b5c2410                       cmp        ebx, dword ptr [rsp + 0x10]
00370 0f8dbe070000                   jge        0x7f46ffe60334
00376 448b942480000000               mov        r10d, dword ptr [rsp + 0x80]
0037e 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00383 4d8b44db08                     mov        r8, qword ptr [r11 + rbx*8 + 8]
00388 4d8bd8                         mov        r11, r8
0038b 49c1fb24                       sar        r11, 0x24
0038f 458bdb                         mov        r11d, r11d
00392 418bc3                         mov        eax, r11d
00395 4d8bd8                         mov        r11, r8
00398 49c1eb12                       shr        r11, 0x12
0039c 458bc0                         mov        r8d, r8d
0039f 458bdb                         mov        r11d, r11d
003a2 4181e0ffff0100                 and        r8d, 0x1ffff
003a9 4489442430                     mov        dword ptr [rsp + 0x30], r8d
003ae 4181e3ffff0300                 and        r11d, 0x3ffff
003b5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
003ba 448bd8                         mov        r11d, eax
003bd 4585db                         test       r11d, r11d
003c0 0f8ce60a0000                   jl         0x7f46ffe606ac
003c6 4585c0                         test       r8d, r8d
003c9 0f84f5fdffff                   je         0x7f46ffe5f9c4
003cf 448b1c24                       mov        r11d, dword ptr [rsp]
003d3 452bda                         sub        r11d, r10d
003d6 453bc3                         cmp        r8d, r11d
003d9 0f8eedfdffff                   jle        0x7f46ffe5f9cc
003df be45ffffff                     mov        esi, 0xffffff45
003e4 418be8                         mov        ebp, r8d
003e7 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
003ef 90                             nop        
003f0 c5f877                         vzeroupper 
003f3 e8683ab6ff                     call       0x7f46ff9c3660
003f8 0f1f8400f0040000               nop        dword ptr [rax + rax + 0x4f0]
00400 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00405 4585db                         test       r11d, r11d
00408 7407                           je         0x7f46ffe5fc11
0040a 448d58ff                       lea        r11d, [rax - 1]
0040e 418bc3                         mov        eax, r11d
00411 4c8b9c24c8000000               mov        r11, qword ptr [rsp + 0xc8]
00419 458b5b08                       mov        r11d, dword ptr [r11 + 8]
0041d 85c0                           test       eax, eax
0041f 0f842f080000                   je         0x7f46ffe60454
00425 83f803                         cmp        eax, 3
00428 0f8432080000                   je         0x7f46ffe60460
0042e 83f802                         cmp        eax, 2
00431 0f878a000000                   ja         0x7f46ffe5fcc1
00437 3b44243c                       cmp        eax, dword ptr [rsp + 0x3c]
0043b 0f83570e0000                   jae        0x7f46ffe60a98
00441 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00449 458b5c8008                     mov        r11d, dword ptr [r8 + rax*4 + 8]
0044e 85c0                           test       eax, eax
00450 7e52                           jle        0x7f46ffe5fca4
00452 448d40ff                       lea        r8d, [rax - 1]
00456 443b44243c                     cmp        r8d, dword ptr [rsp + 0x3c]
0045b 0f832b110000                   jae        0x7f46ffe60d8c
00461 4863f8                         movsxd     rdi, eax
00464 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
0046c 458bc8                         mov        r9d, r8d
0046f 4183c1cc                       add        r9d, -0x34
00473 41c1e902                       shr        r9d, 2
00477 458d4401ff                     lea        r8d, [r9 + rax - 1]
0047c b904000000                     mov        ecx, 4
00481 c442f0f5c0                     bzhi       r8, r8, rcx
00486 492bf8                         sub        rdi, r8
00489 48ffcf                         dec        rdi
0048c 4533c0                         xor        r8d, r8d
0048f 4885ff                         test       rdi, rdi
00492 490f4cf8                       cmovl      rdi, r8
00496 8bff                           mov        edi, edi
00498 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
0049f e957050000                     jmp        0x7f46ffe601fb
004a4 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
004ab 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
004b3 45895808                       mov        dword ptr [r8 + 8], r11d
004b7 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
004bc e954fdffff                     jmp        0x7f46ffe5fa15
004c1 895c2404                       mov        dword ptr [rsp + 4], ebx
004c5 48be90af72e200000000           movabs     rsi, 0xe272af90
004cf 418bea                         mov        ebp, r10d
004d2 6690                           nop        
004d4 c5f877                         vzeroupper 
004d7 e884bba9ff                     call       0x7f46ff8fb860
004dc 0f1f8400d4050001               nop        dword ptr [rax + rax + 0x10005d4]
004e4 4885c0                         test       rax, rax
004e7 0f843f0e0000                   je         0x7f46ffe60b2c
004ed 488bf0                         mov        rsi, rax
004f0 c5f877                         vzeroupper 
004f3 4881c4b0000000                 add        rsp, 0xb0
004fa 5d                             pop        rbp
004fb e960b8b6ff                     jmp        0x7f46ff9cb560
00500 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00505 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
0050a 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
0050f 443b542434                     cmp        r10d, dword ptr [rsp + 0x34]
00514 0f8d82020000                   jge        0x7f46ffe5ff9c
0051a 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0051f 4183c208                       add        r10d, 8
00523 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0052b 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
00530 4183fb08                       cmp        r11d, 8
00534 0f8d87010000                   jge        0x7f46ffe5fec1
0053a 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00542 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00547 0f83df100000                   jae        0x7f46ffe60e2c
0054d 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00552 430fbe6c1008                   movsx      ebp, byte ptr [r8 + r10 + 8]
00558 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0055d 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00562 0f8338110000                   jae        0x7f46ffe60ea0
00568 4c63d3                         movsxd     r10, ebx
0056b 4c635c2430                     movsxd     r11, dword ptr [rsp + 0x30]
00570 4d03da                         add        r11, r10
00573 43886c1808                     mov        byte ptr [r8 + r11 + 8], bpl
00578 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00580 4183c203                       add        r10d, 3
00584 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00589 41ffc3                         inc        r11d
0058c 44899c248c000000               mov        dword ptr [rsp + 0x8c], r11d
00594 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
00599 0f8335110000                   jae        0x7f46ffe60ed4
0059f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
005a4 4183c203                       add        r10d, 3
005a8 4c639c2484000000               movsxd     r11, dword ptr [rsp + 0x84]
005b0 458bc8                         mov        r9d, r8d
005b3 430fbe6c1909                   movsx      ebp, byte ptr [r9 + r11 + 9]
005b9 443b54241c                     cmp        r10d, dword ptr [rsp + 0x1c]
005be 0f8358110000                   jae        0x7f46ffe60f1c
005c4 4c63d3                         movsxd     r10, ebx
005c7 4c63442430                     movsxd     r8, dword ptr [rsp + 0x30]
005cc 4d03c2                         add        r8, r10
005cf 43886c0109                     mov        byte ptr [r9 + r8 + 9], bpl
005d4 470fbe54190a                   movsx      r10d, byte ptr [r9 + r11 + 0xa]
005da 478854010a                     mov        byte ptr [r9 + r8 + 0xa], r10b
005df 470fbe5c190b                   movsx      r11d, byte ptr [r9 + r11 + 0xb]
005e5 47885c010b                     mov        byte ptr [r9 + r8 + 0xb], r11b
005ea 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
005ef 4183fb08                       cmp        r11d, 8
005f3 0f8363110000                   jae        0x7f46ffe60f5c
005f9 49bad0e870e200000000           movabs     r10, 0xe270e8d0
00603 448b8c2484000000               mov        r9d, dword ptr [rsp + 0x84]
0060b 47034c9a08                     add        r9d, dword ptr [r10 + r11*4 + 8]
00610 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00615 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0061a 4183fa04                       cmp        r10d, 4
0061e 7e3c                           jle        0x7f46ffe5fe5c
00620 8b6c2438                       mov        ebp, dword ptr [rsp + 0x38]
00624 83c504                         add        ebp, 4
00627 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
0062c 418bd1                         mov        edx, r9d
0062f 90                             nop        
00630 c5f877                         vzeroupper 
00633 e828baa9ff                     call       0x7f46ff8fb860
00638 0f1f840030070002               nop        dword ptr [rax + rax + 0x2000730]
00640 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00645 8bd5                           mov        edx, ebp
00647 8bc8                           mov        ecx, eax
00649 666690                         nop        
0064c c5f877                         vzeroupper 
0064f e80cbaa9ff                     call       0x7f46ff8fb860
00654 0f1f84004c070003               nop        dword ptr [rax + rax + 0x300074c]
0065c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00661 4183fa08                       cmp        r10d, 8
00665 0f8ef8fcffff                   jle        0x7f46ffe5fb63
0066b 49baf8e870e200000000           movabs     r10, 0xe270e8f8
00675 8b542430                       mov        edx, dword ptr [rsp + 0x30]
00679 448b5c247c                     mov        r11d, dword ptr [rsp + 0x7c]
0067e 432b549a08                     sub        edx, dword ptr [r10 + r11*4 + 8]
00683 83c208                         add        edx, 8
00686 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
0068b 90                             nop        
0068c c5f877                         vzeroupper 
0068f e8ccb9a9ff                     call       0x7f46ff8fb860
00694 0f1f84008c070004               nop        dword ptr [rax + rax + 0x400078c]
0069c 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006a1 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
006a8 488bc8                         mov        rcx, rax
006ab 90                             nop        
006ac c5f877                         vzeroupper 
006af e8acb9a9ff                     call       0x7f46ff8fb860
006b4 0f1f8400ac070005               nop        dword ptr [rax + rax + 0x50007ac]
006bc e9a2fcffff                     jmp        0x7f46ffe5fb63
006c1 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006c6 8b942484000000                 mov        edx, dword ptr [rsp + 0x84]
006cd 666690                         nop        
006d0 c5f877                         vzeroupper 
006d3 e888b9a9ff                     call       0x7f46ff8fb860
006d8 0f1f8400d0070006               nop        dword ptr [rax + rax + 0x60007d0]
006e0 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
006e5 8b542438                       mov        edx, dword ptr [rsp + 0x38]
006e9 488bc8                         mov        rcx, rax
006ec c5f877                         vzeroupper 
006ef e86cb9a9ff                     call       0x7f46ff8fb860
006f4 0f1f8400ec070007               nop        dword ptr [rax + rax + 0x70007ec]
006fc 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00704 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00709 0f8d54fcffff                   jge        0x7f46ffe5fb63
0070f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00714 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
0071b 0f8ed7040000                   jle        0x7f46ffe603f8
00721 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00729 4183c008                       add        r8d, 8
0072d be66ffffff                     mov        esi, 0xffffff66
00732 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0073a 448b1c24                       mov        r11d, dword ptr [rsp]
0073e 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00746 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0074b 4c891424                       mov        qword ptr [rsp], r10
0074f 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00754 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0075c 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
00761 44895c2408                     mov        dword ptr [rsp + 8], r11d
00766 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0076b 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00770 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00775 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
0077a 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0077f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00784 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00789 666690                         nop        
0078c c5f877                         vzeroupper 
0078f e8cc36b6ff                     call       0x7f46ff9c3660
00794 0f1f84008c080008               nop        dword ptr [rax + rax + 0x800088c]
0079c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
007a1 4183fb30                       cmp        r11d, 0x30
007a5 0f8fd1010000                   jg         0x7f46ffe6017c
007ab 8b6c244c                       mov        ebp, dword ptr [rsp + 0x4c]
007af 83c5f9                         add        ebp, -7
007b2 896c247c                       mov        dword ptr [rsp + 0x7c], ebp
007b6 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
007be 443bd5                         cmp        r10d, ebp
007c1 0f837d0b0000                   jae        0x7f46ffe60b44
007c7 418bea                         mov        ebp, r10d
007ca 89ac2484000000                 mov        dword ptr [rsp + 0x84], ebp
007d1 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
007d6 498b6c2b08                     mov        rbp, qword ptr [r11 + rbp + 8]
007db 4889ac2488000000               mov        qword ptr [rsp + 0x88], rbp
007e3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
007e8 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
007ed 0f83d10b0000                   jae        0x7f46ffe60bc4
007f3 448bd3                         mov        r10d, ebx
007f6 4489942490000000               mov        dword ptr [rsp + 0x90], r10d
007fe 4d63d2                         movsxd     r10, r10d
00801 8b6c2430                       mov        ebp, dword ptr [rsp + 0x30]
00805 4c63dd                         movsxd     r11, ebp
00808 4b8d4c1308                     lea        rcx, [r11 + r10 + 8]
0080d 48be28c122e200000000           movabs     rsi, 0xe222c128
00817 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
0081c 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
00824 4533c9                         xor        r9d, r9d
00827 90                             nop        
00828 c5f877                         vzeroupper 
0082b e830aea9ff                     call       0x7f46ff8fae60
00830 0f1f840028090009               nop        dword ptr [rax + rax + 0x9000928]
00838 03ac2490000000                 add        ebp, dword ptr [rsp + 0x90]
0083f 896c2438                       mov        dword ptr [rsp + 0x38], ebp
00843 448d5508                       lea        r10d, [rbp + 8]
00847 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0084f 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00854 0f8d0e010000                   jge        0x7f46ffe60168
0085a 448b842484000000               mov        r8d, dword ptr [rsp + 0x84]
00862 442bc5                         sub        r8d, ebp
00865 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0086a 4c6344244c                     movsxd     r8, dword ptr [rsp + 0x4c]
0086f 4983c0f9                       add        r8, -7
00873 48634c2430                     movsxd     rcx, dword ptr [rsp + 0x30]
00878 4d63ca                         movsxd     r9, r10d
0087b 4d8d1c09                       lea        r11, [r9 + rcx]
0087f 4d3bd8                         cmp        r11, r8
00882 0f830c0c0000                   jae        0x7f46ffe60c94
00888 4c635c2418                     movsxd     r11, dword ptr [rsp + 0x18]
0088d 4d2bd9                         sub        r11, r9
00890 4983c307                       add        r11, 7
00894 4983e3f8                       and        r11, 0xfffffffffffffff8
00898 458bdb                         mov        r11d, r11d
0089b 458d5c2b08                     lea        r11d, [r11 + rbp + 8]
008a0 4d63db                         movsxd     r11, r11d
008a3 4e8d4c19f8                     lea        r9, [rcx + r11 - 8]
008a8 4d3bc8                         cmp        r9, r8
008ab 0f83e30b0000                   jae        0x7f46ffe60c94
008b1 443b54247c                     cmp        r10d, dword ptr [rsp + 0x7c]
008b6 0f83d80b0000                   jae        0x7f46ffe60c94
008bc 4983c3f8                       add        r11, -8
008c0 4d3bd8                         cmp        r11, r8
008c3 0f83cb0b0000                   jae        0x7f46ffe60c94
008c9 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
008ce 4181fbf8ffff7f                 cmp        r11d, 0x7ffffff8
008d5 0f8f350c0000                   jg         0x7f46ffe60d10
008db 0f1f440000                     nop        dword ptr [rax + rax]
008e0 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
008e8 4963ca                         movsxd     rcx, r10d
008eb 4883c108                       add        rcx, 8
008ef 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
008f6 036c2430                       add        ebp, dword ptr [rsp + 0x30]
008fa 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
008ff 4d8b442b08                     mov        r8, qword ptr [r11 + rbp + 8]
00904 48be28c122e200000000           movabs     rsi, 0xe222c128
0090e 488b542440                     mov        rdx, qword ptr [rsp + 0x40]
00913 4533c9                         xor        r9d, r9d
00916 6690                           nop        
00918 c5f877                         vzeroupper 
0091b e840ada9ff                     call       0x7f46ff8fae60
00920 0f1f8400180a000a               nop        dword ptr [rax + rax + 0xa000a18]
00928 448b942488000000               mov        r10d, dword ptr [rsp + 0x88]
00930 4183c208                       add        r10d, 8
00934 4489942488000000               mov        dword ptr [rsp + 0x88], r10d
0093c 443b542418                     cmp        r10d, dword ptr [rsp + 0x18]
00941 7c9d                           jl         0x7f46ffe600e0
00943 eb23                           jmp        0x7f46ffe60168
00945 458bd3                         mov        r10d, r11d
00948 4d63d2                         movsxd     r10, r10d
0094b 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00952 c442a8f5db                     bzhi       r11, r11, r10
00957 c4c1fb92fb                     kmovq      k7, r11
0095c 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00962 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00968 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0096d 44035c2434                     add        r11d, dword ptr [rsp + 0x34]
00972 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
00977 e9e7f9ffff                     jmp        0x7f46ffe5fb63
0097c 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
00984 4585d2                         test       r10d, r10d
00987 0f8c9f0a0000                   jl         0x7f46ffe60c2c
0098d 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00991 85c9                           test       ecx, ecx
00993 0f8c930a0000                   jl         0x7f46ffe60c2c
00999 4503da                         add        r11d, r10d
0099c 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
009a0 413bcb                         cmp        ecx, r11d
009a3 0f82830a0000                   jb         0x7f46ffe60c2c
009a9 3b4c2418                       cmp        ecx, dword ptr [rsp + 0x18]
009ad 0f82790a0000                   jb         0x7f46ffe60c2c
009b3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
009b8 4585db                         test       r11d, r11d
009bb 74ab                           je         0x7f46ffe60168
009bd 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
009c1 4a8d7c1108                     lea        rdi, [rcx + r10 + 8]
009c6 4d03c8                         add        r9, r8
009c9 4a8d740908                     lea        rsi, [rcx + r9 + 8]
009ce 4963d3                         movsxd     rdx, r11d
009d1 4883fa20                       cmp        rdx, 0x20
009d5 0f866affffff                   jbe        0x7f46ffe60145
009db c5f877                         vzeroupper 
009de 49ba204f8eff467f0000           movabs     r10, 0x7f46ff8e4f20
009e8 41ffd2                         call       r10
009eb 0f1f840000000000               nop        dword ptr [rax + rax]
009f3 e970ffffff                     jmp        0x7f46ffe60168
009f8 418bc1                         mov        eax, r9d
009fb 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00a03 458b448104                     mov        r8d, dword ptr [r9 + rax*4 + 4]
00a08 488b8c24c8000000               mov        rcx, qword ptr [rsp + 0xc8]
00a10 4489448108                     mov        dword ptr [rcx + rax*4 + 8], r8d
00a15 448d48ff                       lea        r9d, [rax - 1]
00a19 443bcf                         cmp        r9d, edi
00a1c 7fda                           jg         0x7f46ffe601f8
00a1e 4183f93f                       cmp        r9d, 0x3f
00a22 0f8efc0b0000                   jle        0x7f46ffe60e24
00a28 448bc0                         mov        r8d, eax
00a2b 41ffc8                         dec        r8d
00a2e 418bd8                         mov        ebx, r8d
00a31 eb10                           jmp        0x7f46ffe60243
00a33 0f1f8000000000                 nop        dword ptr [rax]
00a3a 660f1f440000                   nop        word ptr [rax + rax]
00a40 418bd8                         mov        ebx, r8d
00a43 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00a4b 62d17e486f8499c8ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + rbx*4 - 0x38]
00a56 62d17e487f8499ccffffff         vmovdqu32  zmmword ptr [r9 + rbx*4 - 0x34], zmm0
00a61 62d17e486f849988ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + rbx*4 - 0x78]
00a6c 62d17e487f84998cffffff         vmovdqu32  zmmword ptr [r9 + rbx*4 - 0x74], zmm0
00a77 62d17e486f849948ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + rbx*4 - 0xb8]
00a82 62d17e487f84994cffffff         vmovdqu32  zmmword ptr [r9 + rbx*4 - 0xb4], zmm0
00a8d 62d17e486f849908ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + rbx*4 - 0xf8]
00a98 62d17e487f84990cffffff         vmovdqu32  zmmword ptr [r9 + rbx*4 - 0xf4], zmm0
00aa3 448d43c0                       lea        r8d, [rbx - 0x40]
00aa7 4183f83f                       cmp        r8d, 0x3f
00aab 7f93                           jg         0x7f46ffe60240
00aad 4183f80f                       cmp        r8d, 0xf
00ab1 7e31                           jle        0x7f46ffe602e4
00ab3 448bc3                         mov        r8d, ebx
00ab6 4183c0c0                       add        r8d, -0x40
00aba 6690                           nop        
00abc 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00ac4 62917e486f8481c8ffffff         vmovdqu32  zmm0, zmmword ptr [r9 + r8*4 - 0x38]
00acf 62917e487f8481ccffffff         vmovdqu32  zmmword ptr [r9 + r8*4 - 0x34], zmm0
00ada 4183c0f0                       add        r8d, -0x10
00ade 4183f80f                       cmp        r8d, 0xf
00ae2 7fd8                           jg         0x7f46ffe602bc
00ae4 4585c0                         test       r8d, r8d
00ae7 0f8ebef9ffff                   jle        0x7f46ffe5fcab
00aed 666690                         nop        
00af0 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00af8 438b4c8104                     mov        ecx, dword ptr [r9 + r8*4 + 4]
00afd 43894c8108                     mov        dword ptr [r9 + r8*4 + 8], ecx
00b02 41ffc8                         dec        r8d
00b05 4585c0                         test       r8d, r8d
00b08 7fe6                           jg         0x7f46ffe602f0
00b0a e99cf9ffff                     jmp        0x7f46ffe5fcab
00b0f 4d63d0                         movsxd     r10, r8d
00b12 49c7c3ffffffff                 mov        r11, 0xffffffffffffffff
00b19 c442a8f5db                     bzhi       r11, r11, r10
00b1e c4c1fb92fb                     kmovq      k7, r11
00b23 62f17faf6f07                   vmovdqu8   ymm0 {k7} {z}, ymmword ptr [rdi]
00b29 62f17f2f7f06                   vmovdqu8   ymmword ptr [rsi] {k7}, ymm0
00b2f e99e000000                     jmp        0x7f46ffe603d2
00b34 448b1c24                       mov        r11d, dword ptr [rsp]
00b38 458bc3                         mov        r8d, r11d
00b3b 442b842480000000               sub        r8d, dword ptr [rsp + 0x80]
00b43 488b5c2458                     mov        rbx, qword ptr [rsp + 0x58]
00b48 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
00b50 8b442404                       mov        eax, dword ptr [rsp + 4]
00b54 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00b59 8bbc2480000000                 mov        edi, dword ptr [rsp + 0x80]
00b60 418b5104                       mov        edx, dword ptr [r9 + 4]
00b64 85ff                           test       edi, edi
00b66 0f8c640c0000                   jl         0x7f46ffe60fd0
00b6c 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
00b71 4585d2                         test       r10d, r10d
00b74 0f8c5b0c0000                   jl         0x7f46ffe60fd5
00b7a 3b0424                         cmp        eax, dword ptr [rsp]
00b7d 0f82520c0000                   jb         0x7f46ffe60fd5
00b83 8b6c2418                       mov        ebp, dword ptr [rsp + 0x18]
00b87 4103e8                         add        ebp, r8d
00b8a 3bd5                           cmp        edx, ebp
00b8c 0f82430c0000                   jb         0x7f46ffe60fd5
00b92 4585c0                         test       r8d, r8d
00b95 0f8c3a0c0000                   jl         0x7f46ffe60fd5
00b9b 4585c0                         test       r8d, r8d
00b9e 7432                           je         0x7f46ffe603d2
00ba0 498d7c3b08                     lea        rdi, [r11 + rdi + 8]
00ba5 4d8bd9                         mov        r11, r9
00ba8 4b8d741108                     lea        rsi, [r9 + r10 + 8]
00bad 4963d0                         movsxd     rdx, r8d
00bb0 4883fa20                       cmp        rdx, 0x20
00bb4 0f8655ffffff                   jbe        0x7f46ffe6030f
00bba c5f877                         vzeroupper 
00bbd 49ba204f8eff467f0000           movabs     r10, 0x7f46ff8e4f20
00bc7 41ffd2                         call       r10
00bca 0f1f840000000000               nop        dword ptr [rax + rax]
00bd2 896b38                         mov        dword ptr [rbx + 0x38], ebp
00bd5 c5f877                         vzeroupper 
00bd8 4881c4b0000000                 add        rsp, 0xb0
00bdf 5d                             pop        rbp
00be0 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00be4 0f87960c0000                   ja         0x7f46ffe61080
00bea c3                             ret        
00beb 0f1f440000                     nop        dword ptr [rax + rax]
00bf0 44899c2488000000               mov        dword ptr [rsp + 0x88], r11d
00bf8 8bac2488000000                 mov        ebp, dword ptr [rsp + 0x88]
00bff 2b6c247c                       sub        ebp, dword ptr [rsp + 0x7c]
00c03 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00c08 8bd5                           mov        edx, ebp
00c0a 6690                           nop        
00c0c c5f877                         vzeroupper 
00c0f e84cb4a9ff                     call       0x7f46ff8fb860
00c14 0f1f84000c0d000b               nop        dword ptr [rax + rax + 0xb000d0c]
00c1c 488b742440                     mov        rsi, qword ptr [rsp + 0x40]
00c21 8b942488000000                 mov        edx, dword ptr [rsp + 0x88]
00c28 488bc8                         mov        rcx, rax
00c2b 90                             nop        
00c2c c5f877                         vzeroupper 
00c2f e82cb4a9ff                     call       0x7f46ff8fb860
00c34 0f1f84002c0d000c               nop        dword ptr [rax + rax + 0xc000d2c]
00c3c 448b9c2488000000               mov        r11d, dword ptr [rsp + 0x88]
00c44 4183c308                       add        r11d, 8
00c48 443b5c2418                     cmp        r11d, dword ptr [rsp + 0x18]
00c4d 7ca1                           jl         0x7f46ffe603f0
00c4f e90ff7ffff                     jmp        0x7f46ffe5fb63
00c54 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00c5b e957f8ffff                     jmp        0x7f46ffe5fcb7
00c60 41ffcb                         dec        r11d
00c63 4585db                         test       r11d, r11d
00c66 7e2c                           jle        0x7f46ffe60494
00c68 4c8b8424c8000000               mov        r8, qword ptr [rsp + 0xc8]
00c70 45894810                       mov        dword ptr [r8 + 0x10], r9d
00c74 458b4008                       mov        r8d, dword ptr [r8 + 8]
00c78 4c8b8c24c8000000               mov        r9, qword ptr [rsp + 0xc8]
00c80 4589410c                       mov        dword ptr [r9 + 0xc], r8d
00c84 45895908                       mov        dword ptr [r9 + 8], r11d
00c88 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
00c8f e923f8ffff                     jmp        0x7f46ffe5fcb7
00c94 895c2404                       mov        dword ptr [rsp + 4], ebx
00c98 48be60af72e200000000           movabs     rsi, 0xe272af60
00ca2 418bea                         mov        ebp, r10d
00ca5 666690                         nop        
00ca8 c5f877                         vzeroupper 
00cab e8b0b3a9ff                     call       0x7f46ff8fb860
00cb0 0f1f8400a80d000d               nop        dword ptr [rax + rax + 0xd000da8]
00cb8 4885c0                         test       rax, rax
00cbb 0f852cf8ffff                   jne        0x7f46ffe5fced
00cc1 bef6ffffff                     mov        esi, 0xfffffff6
00cc6 6690                           nop        
00cc8 c5f877                         vzeroupper 
00ccb e89031b6ff                     call       0x7f46ff9c3660
00cd0 0f1f8400c80d000e               nop        dword ptr [rax + rax + 0xe000dc8]
00cd8 4c03d9                         add        r11, rcx
00cdb 4d3bde                         cmp        r11, r14
00cde 7e08                           jle        0x7f46ffe604e8
00ce0 4533ed                         xor        r13d, r13d
00ce3 e9c5f3ffff                     jmp        0x7f46ffe5f8ad
00ce8 4533ed                         xor        r13d, r13d
00ceb bf01000000                     mov        edi, 1
00cf0 e9baf3ffff                     jmp        0x7f46ffe5f8af
00cf5 bee4ffffff                     mov        esi, 0xffffffe4
00cfa 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00d02 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d07 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d0c 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00d11 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00d16 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00d1b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00d20 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d25 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
00d2a 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
00d2f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00d34 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00d39 666690                         nop        
00d3c c5f877                         vzeroupper 
00d3f e81c31b6ff                     call       0x7f46ff9c3660
00d44 0f1f84003c0e000f               nop        dword ptr [rax + rax + 0xf000e3c]
00d4c bee4ffffff                     mov        esi, 0xffffffe4
00d51 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00d59 448b1c24                       mov        r11d, dword ptr [rsp]
00d5d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00d65 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00d6a 4c891c24                       mov        qword ptr [rsp], r11
00d6e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00d73 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
00d7b 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00d80 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d85 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00d8a 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00d8f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d94 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00d9a 6690                           nop        
00d9c c5f877                         vzeroupper 
00d9f e8bc30b6ff                     call       0x7f46ff9c3660
00da4 0f1f84009c0e0010               nop        dword ptr [rax + rax + 0x10000e9c]
00dac bee4ffffff                     mov        esi, 0xffffffe4
00db1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00db9 448b1c24                       mov        r11d, dword ptr [rsp]
00dbd 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00dc5 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00dca 4c891424                       mov        qword ptr [rsp], r10
00dce 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00dd3 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00ddb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00de0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00de5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00dea 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00def 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00df4 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00df9 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00dfe 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e03 90                             nop        
00e04 c5f877                         vzeroupper 
00e07 e85430b6ff                     call       0x7f46ff9c3660
00e0c 0f1f8400040f0011               nop        dword ptr [rax + rax + 0x11000f04]
00e14 bee4ffffff                     mov        esi, 0xffffffe4
00e19 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00e21 448b1c24                       mov        r11d, dword ptr [rsp]
00e25 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
00e2d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
00e32 4c891424                       mov        qword ptr [rsp], r10
00e36 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e3b 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00e43 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e48 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e4d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e52 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e57 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e5c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e61 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00e66 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e6b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e70 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e75 c5fa7f442440                   vmovdqu    xmmword ptr [rsp + 0x40], xmm0
00e7b 90                             nop        
00e7c c5f877                         vzeroupper 
00e7f e8dc2fb6ff                     call       0x7f46ff9c3660
00e84 0f1f84007c0f0012               nop        dword ptr [rax + rax + 0x12000f7c]
00e8c be45ffffff                     mov        esi, 0xffffff45
00e91 48898c24c0000000               mov        qword ptr [rsp + 0xc0], rcx
00e99 666690                         nop        
00e9c c5f877                         vzeroupper 
00e9f e8bc2fb6ff                     call       0x7f46ff9c3660
00ea4 0f1f84009c0f0013               nop        dword ptr [rax + rax + 0x13000f9c]
00eac be45ffffff                     mov        esi, 0xffffff45
00eb1 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00eb9 448b0424                       mov        r8d, dword ptr [rsp]
00ebd 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
00ec5 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00eca 4c891c24                       mov        qword ptr [rsp], r11
00ece 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ed3 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00edb 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00ee0 4489442408                     mov        dword ptr [rsp + 8], r8d
00ee5 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00eea 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00eef 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00ef4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ef9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00efe 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f03 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00f08 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00f0d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f12 895c2424                       mov        dword ptr [rsp + 0x24], ebx
00f16 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f1b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f20 89442430                       mov        dword ptr [rsp + 0x30], eax
00f24 c5f877                         vzeroupper 
00f27 e8342fb6ff                     call       0x7f46ff9c3660
00f2c 0f1f840024100014               nop        dword ptr [rax + rax + 0x14001024]
00f34 4c3bd9                         cmp        r11, rcx
00f37 bdffffffff                     mov        ebp, 0xffffffff
00f3c 7c08                           jl         0x7f46ffe60746
00f3e 400f95c5                       setne      bpl
00f42 400fb6ed                       movzx      ebp, bpl
00f46 be45ffffff                     mov        esi, 0xffffff45
00f4b 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00f50 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f55 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
00f5a 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00f5f 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00f64 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00f69 4489542418                     mov        dword ptr [rsp + 0x18], r10d
00f6e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f73 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
00f78 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
00f7d 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f82 48894c2440                     mov        qword ptr [rsp + 0x40], rcx
00f87 90                             nop        
00f88 c5f877                         vzeroupper 
00f8b e8d02eb6ff                     call       0x7f46ff9c3660
00f90 0f1f840088100015               nop        dword ptr [rax + rax + 0x15001088]
00f98 be45ffffff                     mov        esi, 0xffffff45
00f9d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
00fa5 448b0c24                       mov        r9d, dword ptr [rsp]
00fa9 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
00fb1 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
00fb6 4c891c24                       mov        qword ptr [rsp], r11
00fba 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00fbf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00fc7 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
00fcc 44894c2408                     mov        dword ptr [rsp + 8], r9d
00fd1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
00fd6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00fdb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
00fe0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fe5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fea 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
00fef 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ff4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ff9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00ffe 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01003 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01008 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0100d 666690                         nop        
01010 c5f877                         vzeroupper 
01013 e8482eb6ff                     call       0x7f46ff9c3660
01018 0f1f840010110016               nop        dword ptr [rax + rax + 0x16001110]
01020 be45ffffff                     mov        esi, 0xffffff45
01025 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0102d 448b0c24                       mov        r9d, dword ptr [rsp]
01031 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
01039 4c8b442408                     mov        r8, qword ptr [rsp + 8]
0103e 4c890424                       mov        qword ptr [rsp], r8
01042 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01047 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
0104f 448b4c2414                     mov        r9d, dword ptr [rsp + 0x14]
01054 44894c2408                     mov        dword ptr [rsp + 8], r9d
01059 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
0105e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01063 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01068 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0106d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01072 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01077 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0107c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01081 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01086 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0108b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01090 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01095 666690                         nop        
01098 c5f877                         vzeroupper 
0109b e8c02db6ff                     call       0x7f46ff9c3660
010a0 0f1f840098110017               nop        dword ptr [rax + rax + 0x17001198]
010a8 be45ffffff                     mov        esi, 0xffffff45
010ad 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
010b5 448b0424                       mov        r8d, dword ptr [rsp]
010b9 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
010c1 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
010c6 4c891c24                       mov        qword ptr [rsp], r11
010ca 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
010cf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
010d7 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
010dc 4489442408                     mov        dword ptr [rsp + 8], r8d
010e1 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
010e6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
010eb 4489542410                     mov        dword ptr [rsp + 0x10], r10d
010f0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010f5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010fa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
010ff 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01104 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
01109 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0110e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01113 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01118 c5f877                         vzeroupper 
0111b e8402db6ff                     call       0x7f46ff9c3660
01120 0f1f840018120018               nop        dword ptr [rax + rax + 0x18001218]
01128 be45ffffff                     mov        esi, 0xffffff45
0112d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01135 448b1c24                       mov        r11d, dword ptr [rsp]
01139 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01141 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01146 4c891424                       mov        qword ptr [rsp], r10
0114a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0114f 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01157 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
0115c 44895c2408                     mov        dword ptr [rsp + 8], r11d
01161 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01166 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0116b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01170 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01175 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
0117a 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0117f 90                             nop        
01180 c5f877                         vzeroupper 
01183 e8d82cb6ff                     call       0x7f46ff9c3660
01188 0f1f840080120019               nop        dword ptr [rax + rax + 0x19001280]
01190 448b1424                       mov        r10d, dword ptr [rsp]
01194 33ff                           xor        edi, edi
01196 458bc2                         mov        r8d, r10d
01199 e9c2f9ffff                     jmp        0x7f46ffe60360
0119e be17000000                     mov        esi, 0x17
011a3 90                             nop        
011a4 c5f877                         vzeroupper 
011a7 e8b42cb6ff                     call       0x7f46ff9c3660
011ac 0f1f8400a412001a               nop        dword ptr [rax + rax + 0x1a0012a4]
011b4 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
011bc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
011c1 be6effffff                     mov        esi, 0xffffff6e
011c6 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
011ce 4c89542408                     mov        qword ptr [rsp + 8], r10
011d3 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
011d8 48894424f8                     mov        qword ptr [rsp - 8], rax
011dd 8b442418                       mov        eax, dword ptr [rsp + 0x18]
011e1 89442414                       mov        dword ptr [rsp + 0x14], eax
011e5 488b4424f8                     mov        rax, qword ptr [rsp - 8]
011ea 89542418                       mov        dword ptr [rsp + 0x18], edx
011ee 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
011f2 4489442420                     mov        dword ptr [rsp + 0x20], r8d
011f7 48895c2428                     mov        qword ptr [rsp + 0x28], rbx
011fc 897c2430                       mov        dword ptr [rsp + 0x30], edi
01200 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01205 4c89742440                     mov        qword ptr [rsp + 0x40], r14
0120a 6690                           nop        
0120c c5f877                         vzeroupper 
0120f e84c2cb6ff                     call       0x7f46ff9c3660
01214 0f1f84000c13001b               nop        dword ptr [rax + rax + 0x1b00130c]
0121c 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01224 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01229 eb96                           jmp        0x7f46ffe609c1
0122b 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01233 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01238 eb87                           jmp        0x7f46ffe609c1
0123a 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01242 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01247 e975ffffff                     jmp        0x7f46ffe609c1
0124c bebeffffff                     mov        esi, 0xffffffbe
01251 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01259 448b1424                       mov        r10d, dword ptr [rsp]
0125d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01265 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0126a 4c891424                       mov        qword ptr [rsp], r10
0126e 44894c2408                     mov        dword ptr [rsp + 8], r9d
01273 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
01278 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0127d 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01282 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01287 90                             nop        
01288 c5f877                         vzeroupper 
0128b e8d02bb6ff                     call       0x7f46ff9c3660
01290 0f1f84008813001c               nop        dword ptr [rax + rax + 0x1c001388]
01298 bee4ffffff                     mov        esi, 0xffffffe4
0129d 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
012a5 448b0424                       mov        r8d, dword ptr [rsp]
012a9 44898424c0000000               mov        dword ptr [rsp + 0xc0], r8d
012b1 4c8b5c2408                     mov        r11, qword ptr [rsp + 8]
012b6 4c891c24                       mov        qword ptr [rsp], r11
012ba 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012bf 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
012c7 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
012cc 44895c2408                     mov        dword ptr [rsp + 8], r11d
012d1 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
012d6 448944240c                     mov        dword ptr [rsp + 0xc], r8d
012db 4489542410                     mov        dword ptr [rsp + 0x10], r10d
012e0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
012e5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012ea 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
012ef 4489542414                     mov        dword ptr [rsp + 0x14], r10d
012f4 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
012f9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
012fe 895c2424                       mov        dword ptr [rsp + 0x24], ebx
01302 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01307 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0130c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01311 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01316 8944243c                       mov        dword ptr [rsp + 0x3c], eax
0131a 6690                           nop        
0131c c5f877                         vzeroupper 
0131f e83c2bb6ff                     call       0x7f46ff9c3660
01324 0f1f84001c14001d               nop        dword ptr [rax + rax + 0x1d00141c]
0132c bef6ffffff                     mov        esi, 0xfffffff6
01331 666690                         nop        
01334 c5f877                         vzeroupper 
01337 e8242bb6ff                     call       0x7f46ff9c3660
0133c 0f1f84003414001e               nop        dword ptr [rax + rax + 0x1e001434]
01344 bee4ffffff                     mov        esi, 0xffffffe4
01349 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01351 448b1c24                       mov        r11d, dword ptr [rsp]
01355 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
0135d 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01362 4c891424                       mov        qword ptr [rsp], r10
01366 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0136b 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
01373 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01378 44895c2408                     mov        dword ptr [rsp + 8], r11d
0137d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01382 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01387 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0138c 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
01391 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01396 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0139b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
013a0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
013a5 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
013ad 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
013b2 6690                           nop        
013b4 c5f877                         vzeroupper 
013b7 e8a42ab6ff                     call       0x7f46ff9c3660
013bc 0f1f8400b414001f               nop        dword ptr [rax + rax + 0x1f0014b4]
013c4 bee4ffffff                     mov        esi, 0xffffffe4
013c9 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
013d1 448b1c24                       mov        r11d, dword ptr [rsp]
013d5 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
013dd 4c8b542408                     mov        r10, qword ptr [rsp + 8]
013e2 4c891424                       mov        qword ptr [rsp], r10
013e6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013eb 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
013f3 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
013f8 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
013fd 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01402 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01407 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0140c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01411 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01416 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0141b 90                             nop        
0141c c5f877                         vzeroupper 
0141f e83c2ab6ff                     call       0x7f46ff9c3660
01424 0f1f84001c150020               nop        dword ptr [rax + rax + 0x2000151c]
0142c beccffffff                     mov        esi, 0xffffffcc
01431 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01439 448b1c24                       mov        r11d, dword ptr [rsp]
0143d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01445 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0144a 4c891424                       mov        qword ptr [rsp], r10
0144e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01453 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0145b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01460 44895c2408                     mov        dword ptr [rsp + 8], r11d
01465 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0146a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0146f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01474 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01479 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0147e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01483 90                             nop        
01484 c5f877                         vzeroupper 
01487 e8d429b6ff                     call       0x7f46ff9c3660
0148c 0f1f840084150021               nop        dword ptr [rax + rax + 0x21001584]
01494 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
0149c 458d5a08                       lea        r11d, [r10 + 8]
014a0 458bc3                         mov        r8d, r11d
014a3 be6effffff                     mov        esi, 0xffffff6e
014a8 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
014b0 448b1424                       mov        r10d, dword ptr [rsp]
014b4 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
014bc 4c8b542408                     mov        r10, qword ptr [rsp + 8]
014c1 4c891424                       mov        qword ptr [rsp], r10
014c5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014ca 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
014d2 448b542414                     mov        r10d, dword ptr [rsp + 0x14]
014d7 4489542408                     mov        dword ptr [rsp + 8], r10d
014dc 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
014e1 4489542414                     mov        dword ptr [rsp + 0x14], r10d
014e6 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
014eb 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
014f0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
014f5 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
014fa 4489442430                     mov        dword ptr [rsp + 0x30], r8d
014ff 90                             nop        
01500 c5f877                         vzeroupper 
01503 e85829b6ff                     call       0x7f46ff9c3660
01508 0f1f840000160022               nop        dword ptr [rax + rax + 0x22001600]
01510 448b942484000000               mov        r10d, dword ptr [rsp + 0x84]
01518 458d5a08                       lea        r11d, [r10 + 8]
0151c 458bc3                         mov        r8d, r11d
0151f be66ffffff                     mov        esi, 0xffffff66
01524 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
0152c 448b1c24                       mov        r11d, dword ptr [rsp]
01530 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01538 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0153d 4c891424                       mov        qword ptr [rsp], r10
01541 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01546 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0154e 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01553 44895c2408                     mov        dword ptr [rsp + 8], r11d
01558 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0155d 4489542414                     mov        dword ptr [rsp + 0x14], r10d
01562 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01567 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
0156c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01571 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01576 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0157b 90                             nop        
0157c c5f877                         vzeroupper 
0157f e8dc28b6ff                     call       0x7f46ff9c3660
01584 0f1f84007c160023               nop        dword ptr [rax + rax + 0x2300167c]
0158c be6effffff                     mov        esi, 0xffffff6e
01591 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01599 448b0c24                       mov        r9d, dword ptr [rsp]
0159d 44898c24c0000000               mov        dword ptr [rsp + 0xc0], r9d
015a5 4c8b442408                     mov        r8, qword ptr [rsp + 8]
015aa 4c890424                       mov        qword ptr [rsp], r8
015ae 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
015b3 44898424c4000000               mov        dword ptr [rsp + 0xc4], r8d
015bb 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
015c0 4489442408                     mov        dword ptr [rsp + 8], r8d
015c5 448b442418                     mov        r8d, dword ptr [rsp + 0x18]
015ca 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015cf 4489542410                     mov        dword ptr [rsp + 0x10], r10d
015d4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015d9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015de 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015e3 4489542414                     mov        dword ptr [rsp + 0x14], r10d
015e8 448b44242c                     mov        r8d, dword ptr [rsp + 0x2c]
015ed 4489442420                     mov        dword ptr [rsp + 0x20], r8d
015f2 895c2424                       mov        dword ptr [rsp + 0x24], ebx
015f6 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
015fb 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01600 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01605 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0160a 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0160f 89442440                       mov        dword ptr [rsp + 0x40], eax
01613 90                             nop        
01614 c5f877                         vzeroupper 
01617 e84428b6ff                     call       0x7f46ff9c3660
0161c 0f1f840014170024               nop        dword ptr [rax + rax + 0x24001714]
01624 458bc1                         mov        r8d, r9d
01627 e9b8f4ffff                     jmp        0x7f46ffe602e4
0162c bee4ffffff                     mov        esi, 0xffffffe4
01631 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01639 448b1c24                       mov        r11d, dword ptr [rsp]
0163d 44899c24c0000000               mov        dword ptr [rsp + 0xc0], r11d
01645 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0164a 4c891424                       mov        qword ptr [rsp], r10
0164e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01653 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0165b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01660 44895c2408                     mov        dword ptr [rsp + 8], r11d
01665 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0166a 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0166f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01674 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01679 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0167e 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01683 448b9c2484000000               mov        r11d, dword ptr [rsp + 0x84]
0168b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01690 c5f877                         vzeroupper 
01693 e8c827b6ff                     call       0x7f46ff9c3660
01698 0f1f840090170025               nop        dword ptr [rax + rax + 0x25001790]
016a0 bee4ffffff                     mov        esi, 0xffffffe4
016a5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016aa 4489542404                     mov        dword ptr [rsp + 4], r10d
016af 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016b4 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016b9 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
016be 4489542428                     mov        dword ptr [rsp + 0x28], r10d
016c3 90                             nop        
016c4 c5f877                         vzeroupper 
016c7 e89427b6ff                     call       0x7f46ff9c3660
016cc 0f1f8400c4170026               nop        dword ptr [rax + rax + 0x260017c4]
016d4 8bac2484000000                 mov        ebp, dword ptr [rsp + 0x84]
016db ffc5                           inc        ebp
016dd bee4ffffff                     mov        esi, 0xffffffe4
016e2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016e7 44895c2404                     mov        dword ptr [rsp + 4], r11d
016ec 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016f1 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
016f6 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
016fb 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01700 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01705 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0170a 6690                           nop        
0170c c5f877                         vzeroupper 
0170f e84c27b6ff                     call       0x7f46ff9c3660
01714 0f1f84000c180027               nop        dword ptr [rax + rax + 0x2700180c]
0171c bee4ffffff                     mov        esi, 0xffffffe4
01721 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01726 4489542404                     mov        dword ptr [rsp + 4], r10d
0172b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01730 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
01735 448b54242c                     mov        r10d, dword ptr [rsp + 0x2c]
0173a 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0173f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01744 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01749 666690                         nop        
0174c c5f877                         vzeroupper 
0174f e80c27b6ff                     call       0x7f46ff9c3660
01754 0f1f84004c180028               nop        dword ptr [rax + rax + 0x2800184c]
0175c bee4ffffff                     mov        esi, 0xffffffe4
01761 488bac24c0000000               mov        rbp, qword ptr [rsp + 0xc0]
01769 448b1424                       mov        r10d, dword ptr [rsp]
0176d 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
01775 4c8b542408                     mov        r10, qword ptr [rsp + 8]
0177a 4c891424                       mov        qword ptr [rsp], r10
0177e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01783 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0178b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01790 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01795 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0179a 4489542410                     mov        dword ptr [rsp + 0x10], r10d
0179f 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
017a4 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017a9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017ae 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017b3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
017b8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
017bd 666690                         nop        
017c0 c5f877                         vzeroupper 
017c3 e89826b6ff                     call       0x7f46ff9c3660
017c8 0f1f8400c0180029               nop        dword ptr [rax + rax + 0x290018c0]
017d0 448b542418                     mov        r10d, dword ptr [rsp + 0x18]
017d5 beccffffff                     mov        esi, 0xffffffcc
017da 4c899c24c0000000               mov        qword ptr [rsp + 0xc0], r11
017e2 89bc24c8000000                 mov        dword ptr [rsp + 0xc8], edi
017e9 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
017f1 44891424                       mov        dword ptr [rsp], r10d
017f5 48895c2408                     mov        qword ptr [rsp + 8], rbx
017fa 4489442410                     mov        dword ptr [rsp + 0x10], r8d
017ff 90                             nop        
01800 c5f877                         vzeroupper 
01803 e85826b6ff                     call       0x7f46ff9c3660
01808 0f1f84000019002a               nop        dword ptr [rax + rax + 0x2a001900]
01810 bef6ffffff                     mov        esi, 0xfffffff6
01815 666690                         nop        
01818 c5f877                         vzeroupper 
0181b e84026b6ff                     call       0x7f46ff9c3660
01820 0f1f84001819002b               nop        dword ptr [rax + rax + 0x2b001918]
01828 4c8b9c24c0000000               mov        r11, qword ptr [rsp + 0xc0]
01830 4c8b542408                     mov        r10, qword ptr [rsp + 8]
01835 e987f9ffff                     jmp        0x7f46ffe609c1
0183a eb14                           jmp        0x7f46ffe61050
0183c eb12                           jmp        0x7f46ffe61050
0183e eb10                           jmp        0x7f46ffe61050
01840 eb0e                           jmp        0x7f46ffe61050
01842 eb0c                           jmp        0x7f46ffe61050
01844 eb0a                           jmp        0x7f46ffe61050
01846 eb08                           jmp        0x7f46ffe61050
01848 eb06                           jmp        0x7f46ffe61050
0184a eb04                           jmp        0x7f46ffe61050
0184c eb02                           jmp        0x7f46ffe61050
0184e eb00                           jmp        0x7f46ffe61050
01850 488bf0                         mov        rsi, rax
01853 e998ecffff                     jmp        0x7f46ffe5fcf0
01858 bef6ffffff                     mov        esi, 0xfffffff6
0185d 498beb                         mov        rbp, r11
01860 89bc24c0000000                 mov        dword ptr [rsp + 0xc0], edi
01867 44898424c8000000               mov        dword ptr [rsp + 0xc8], r8d
0186f 90                             nop        
01870 c5f877                         vzeroupper 
01873 e8e825b6ff                     call       0x7f46ff9c3660
01878 0f1f84007019002c               nop        dword ptr [rax + rax + 0x2c001970]
01880 49bae003e6ff467f0000           movabs     r10, 0x7f46ffe603e0
0188a 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01891 e94acea9ff                     jmp        0x7f46ff8fdee0
01896 e8059aa8ff                     call       0x7f46ff8eaaa0
0189b e99ee7ffff                     jmp        0x7f46ffe5f83e
