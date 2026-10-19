00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85c61c0000                   jne        0x7f6027e684e4
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5604                       mov        r10d, dword ptr [rsi + 4]
00049 44891424                       mov        dword ptr [rsp], r10d
0004d 413bea                         cmp        ebp, r10d
00050 0f8393180000                   jae        0x7f6027e680e9
00056 0fb65c1607                     movzx      ebx, byte ptr [rsi + rdx + 7]
0005b 85db                           test       ebx, ebx
0005d 0f84a5180000                   je         0x7f6027e68108
00063 448bc2                         mov        r8d, edx
00066 442bc1                         sub        r8d, ecx
00069 8b0c24                         mov        ecx, dword ptr [rsp]
0006c 83c1f9                         add        ecx, -7
0006f 8d42f8                         lea        eax, [rdx - 8]
00072 468d1cc500000000               lea        r11d, [r8*8]
0007a f3440fbdcb                     lzcnt      r9d, ebx
0007f 41be1f000000                   mov        r14d, 0x1f
00085 452bf1                         sub        r14d, r9d
00088 bf08000000                     mov        edi, 8
0008d 412bfe                         sub        edi, r14d
00090 418bd3                         mov        edx, r11d
00093 2bd7                           sub        edx, edi
00095 4183f808                       cmp        r8d, 8
00099 0f8cd5160000                   jl         0x7f6027e67f74
0009f 85c9                           test       ecx, ecx
000a1 0f8c051a0000                   jl         0x7f6027e682ac
000a7 8b2c24                         mov        ebp, dword ptr [rsp]
000aa 83c5f9                         add        ebp, -7
000ad 3bc5                           cmp        eax, ebp
000af 0f83ff180000                   jae        0x7f6027e681b4
000b5 448bd0                         mov        r10d, eax
000b8 4e8b6c1608                     mov        r13, qword ptr [rsi + r10 + 8]
000bd 4183c0f8                       add        r8d, -8
000c1 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000c9 4183c2f0                       add        r10d, -0x10
000cd 4183f808                       cmp        r8d, 8
000d1 0f8c4a170000                   jl         0x7f6027e68021
000d7 85c9                           test       ecx, ecx
000d9 0f8c151a0000                   jl         0x7f6027e682f4
000df 8b2c24                         mov        ebp, dword ptr [rsp]
000e2 83c5f9                         add        ebp, -7
000e5 443bd5                         cmp        r10d, ebp
000e8 0f8306190000                   jae        0x7f6027e681f4
000ee 458bc2                         mov        r8d, r10d
000f1 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000f9 4b8b740308                     mov        rsi, qword ptr [r11 + r8 + 8]
000fe 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00103 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00107 4585db                         test       r11d, r11d
0010a 0f840c180000                   je         0x7f6027e6811c
00110 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00114 458b4104                       mov        r8d, dword ptr [r9 + 4]
00118 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
0011b 85db                           test       ebx, ebx
0011d 0f840d180000                   je         0x7f6027e68130
00123 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00128 4889b42498000000               mov        qword ptr [rsp + 0x98], rsi
00130 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00135 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
0013a 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00141 448974240c                     mov        dword ptr [rsp + 0xc], r14d
00146 897c2424                       mov        dword ptr [rsp + 0x24], edi
0014a 89442410                       mov        dword ptr [rsp + 0x10], eax
0014e 894c2404                       mov        dword ptr [rsp + 4], ecx
00152 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
0015a 45034304                       add        r8d, dword ptr [r11 + 4]
0015e 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00163 44034304                       add        r8d, dword ptr [rbx + 4]
00167 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0016b 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00170 4c8bd3                         mov        r10, rbx
00173 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00178 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0017d 4d8bd3                         mov        r10, r11
00180 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00185 4d8bd1                         mov        r10, r9
00188 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018d 4585c0                         test       r8d, r8d
00190 0f84b0080000                   je         0x7f6027e67246
00196 be40000000                     mov        esi, 0x40
0019b 2bf7                           sub        esi, edi
0019d 443bc6                         cmp        r8d, esi
001a0 0f8ffe010000                   jg         0x7f6027e66ba4
001a6 412bf0                         sub        esi, r8d
001a9 c4c2cbf7ed                     shrx       rbp, r13, rsi
001ae 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b3 4183f840                       cmp        r8d, 0x40
001b7 0f8d071a0000                   jge        0x7f6027e683c4
001bd 41bb01000000                   mov        r11d, 1
001c3 c442b9f7d3                     shlx       r10, r11, r8
001c8 49ffca                         dec        r10
001cb 4c23d5                         and        r10, rbp
001ce 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d3 458bd0                         mov        r10d, r8d
001d6 458bca                         mov        r9d, r10d
001d9 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001de 458d5908                       lea        r11d, [r9 + 8]
001e2 4183fb40                       cmp        r11d, 0x40
001e6 7c33                           jl         0x7f6027e66a1b
001e8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001ed 4183c1c8                       add        r9d, -0x38
001f1 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f6 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001fe 8b542408                       mov        edx, dword ptr [rsp + 8]
00202 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00206 90                             nop        
00207 e8544ea9ff                     call       0x7f60278fb860
0020c 0f1f840004030000               nop        dword ptr [rax + rax + 0x304]
00214 4889442420                     mov        qword ptr [rsp + 0x20], rax
00219 eb31                           jmp        0x7f6027e66a4c
0021b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00220 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00228 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
0022d 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00232 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0023a 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00242 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00247 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0024c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00251 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00255 83fd20                         cmp        ebp, 0x20
00258 0f8de6180000                   jge        0x7f6027e68344
0025e c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00265 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026a 41bb01000000                   mov        r11d, 1
00270 c44251f7db                     shlx       r11d, r11d, ebp
00275 41ffcb                         dec        r11d
00278 4d63d3                         movsxd     r10, r11d
0027b 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00280 458bda                         mov        r11d, r10d
00283 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00288 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0028d 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00291 83fd20                         cmp        ebp, 0x20
00294 0f8dd2180000                   jge        0x7f6027e6836c
0029a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a2 458b5204                       mov        r10d, dword ptr [r10 + 4]
002a6 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002ae 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b3 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002b7 458b4304                       mov        r8d, dword ptr [r11 + 4]
002bb 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002c0 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002c4 458b5204                       mov        r10d, dword ptr [r10 + 4]
002c8 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002cd 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
002d1 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002d5 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002d9 85c9                           test       ecx, ecx
002db 0f8e00160000                   jle        0x7f6027e680e1
002e1 41ffc8                         dec        r8d
002e4 4489442460                     mov        dword ptr [rsp + 0x60], r8d
002e9 41ffca                         dec        r10d
002ec 4489542464                     mov        dword ptr [rsp + 0x64], r10d
002f1 41ffcb                         dec        r11d
002f4 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
002f9 c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00300 41bb01000000                   mov        r11d, 1
00306 c44251f7db                     shlx       r11d, r11d, ebp
0030b 458bc2                         mov        r8d, r10d
0030e 4489442474                     mov        dword ptr [rsp + 0x74], r8d
00313 41ffcb                         dec        r11d
00316 4d63d3                         movsxd     r10, r11d
00319 4c23542468                     and        r10, qword ptr [rsp + 0x68]
0031e 458bd2                         mov        r10d, r10d
00321 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00326 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0032e 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00335 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0033d 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00344 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0034c 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00350 4585db                         test       r11d, r11d
00353 0f86eb150000                   jbe        0x7f6027e68144
00359 4d63d3                         movsxd     r10, r11d
0035c 4c63d9                         movsxd     r11, ecx
0035f 49ffcb                         dec        r11
00362 4d3bda                         cmp        r11, r10
00365 0f83d9150000                   jae        0x7f6027e68144
0036b 448b542404                     mov        r10d, dword ptr [rsp + 4]
00370 4585d2                         test       r10d, r10d
00373 0f8cc3160000                   jl         0x7f6027e6823c
00379 448b1c24                       mov        r11d, dword ptr [rsp]
0037d 4183c3f9                       add        r11d, -7
00381 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
00389 4533d2                         xor        r10d, r10d
0038c 4533db                         xor        r11d, r11d
0038f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00397 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0039f e984020000                     jmp        0x7f6027e66e28
003a4 418be8                         mov        ebp, r8d
003a7 2bee                           sub        ebp, esi
003a9 6690                           nop        
003ab e8b04ca9ff                     call       0x7f60278fb860
003b0 0f1f8400a8040001               nop        dword ptr [rax + rax + 0x10004a8]
003b8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003bd 41ba40000000                   mov        r10d, 0x40
003c3 442bd5                         sub        r10d, ebp
003c6 c462d1f7d8                     shlx       r11, rax, rbp
003cb c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d5 4d0bda                         or         r11, r10
003d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003dd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e2 e9effdffff                     jmp        0x7f6027e669d6
003e7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003ef 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
003f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f9 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00401 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00406 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040e 6690                           nop        
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8dec090000                   jge        0x7f6027e6760c
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d990a0000                   jge        0x7f6027e676ec
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bda                         mov        ebx, r10d
0046c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00473 83fd40                         cmp        ebp, 0x40
00476 0f8d700b0000                   jge        0x7f6027e677ec
0047c c4e2d3f7cf                     shrx       rcx, rdi, rbp
00481 41ba01000000                   mov        r10d, 1
00487 c442d1f7d2                     shlx       r10, r10, rbp
0048c 49ffca                         dec        r10
0048f 4c23d7                         and        r10, rdi
00492 458bd2                         mov        r10d, r10d
00495 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
0049c 83fd40                         cmp        ebp, 0x40
0049f 0f8d4b0c0000                   jge        0x7f6027e678f0
004a5 41bb01000000                   mov        r11d, 1
004ab c442d1f7cb                     shlx       r9, r11, rbp
004b0 49ffc9                         dec        r9
004b3 4c23c9                         and        r9, rcx
004b6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004be 418bcb                         mov        ecx, r11d
004c1 4103ca                         add        ecx, r10d
004c4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c9 458bd2                         mov        r10d, r10d
004cc 4403d3                         add        r10d, ebx
004cf 4863d9                         movsxd     rbx, ecx
004d2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
004da 458bdb                         mov        r11d, r11d
004dd 4d03cb                         add        r9, r11
004e0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
004e8 4c03db                         add        r11, rbx
004eb 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
004f3 4d85c9                         test       r9, r9
004f6 0f8e1c070000                   jle        0x7f6027e67418
004fc 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00503 0f8fd70c0000                   jg         0x7f6027e679e0
00509 4181faffff0100                 cmp        r10d, 0x1ffff
00510 0f8fc20d0000                   jg         0x7f6027e67ad8
00516 81f9ffff0300                   cmp        ecx, 0x3ffff
0051c 0f8f8a0e0000                   jg         0x7f6027e67bac
00522 458bd9                         mov        r11d, r9d
00525 4181fb00000010                 cmp        r11d, 0x10000000
0052c 0f834e0f0000                   jae        0x7f6027e67c80
00532 4d63d2                         movsxd     r10, r10d
00535 4d63db                         movsxd     r11, r11d
00538 48c1e312                       shl        rbx, 0x12
0053c 49c1e324                       shl        r11, 0x24
00540 4c0bdb                         or         r11, rbx
00543 4d0bda                         or         r11, r10
00546 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0054e 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00556 4f895cca08                     mov        qword ptr [r10 + r9*8 + 8], r11
0055b 8b2c24                         mov        ebp, dword ptr [rsp]
0055e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00562 0f8daf000000                   jge        0x7f6027e66e17
00568 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00570 49c1ea30                       shr        r10, 0x30
00574 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00579 49c1eb30                       shr        r11, 0x30
0057d 418bca                         mov        ecx, r10d
00580 418bfb                         mov        edi, r11d
00583 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
0058b c44223f7c8                     shrx       r9d, r8d, r11d
00590 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
00598 c44223f7d0                     shrx       r10d, r8d, r11d
0059d 4103fa                         add        edi, r10d
005a0 897c2474                       mov        dword ptr [rsp + 0x74], edi
005a4 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005ac 4183fb20                       cmp        r11d, 0x20
005b0 0f8dba0f0000                   jge        0x7f6027e67d70
005b6 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005be 49c1ea30                       shr        r10, 0x30
005c2 458bd2                         mov        r10d, r10d
005c5 41bb01000000                   mov        r11d, 1
005cb 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005d2 c44241f7db                     shlx       r11d, r11d, edi
005d7 41ffcb                         dec        r11d
005da 4523d9                         and        r11d, r9d
005dd 4403d9                         add        r11d, ecx
005e0 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
005e5 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005ed 4183fb20                       cmp        r11d, 0x20
005f1 0f8d11100000                   jge        0x7f6027e67e08
005f7 41bb01000000                   mov        r11d, 1
005fd 8b8c24cc000000                 mov        ecx, dword ptr [rsp + 0xcc]
00604 c44271f7cb                     shlx       r9d, r11d, ecx
00609 41ffc9                         dec        r9d
0060c 4523c8                         and        r9d, r8d
0060f 4503ca                         add        r9d, r10d
00612 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00617 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0061b 0f8dac030000                   jge        0x7f6027e671cd
00621 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00628 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0062d 4423542474                     and        r10d, dword ptr [rsp + 0x74]
00632 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00637 418b4b14                       mov        ecx, dword ptr [r11 + 0x14]
0063b 448b5904                       mov        r11d, dword ptr [rcx + 4]
0063f 453bd3                         cmp        r10d, r11d
00642 0f830e040000                   jae        0x7f6027e67256
00648 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0064d 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00652 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00657 458b5914                       mov        r11d, dword ptr [r9 + 0x14]
0065b 458b4b04                       mov        r9d, dword ptr [r11 + 4]
0065f 4e8b54d108                     mov        r10, qword ptr [rcx + r10*8 + 8]
00664 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00669 453bc1                         cmp        r8d, r9d
0066c 0f836a040000                   jae        0x7f6027e672dc
00672 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00677 4423542448                     and        r10d, dword ptr [rsp + 0x48]
0067c 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00680 448b4914                       mov        r9d, dword ptr [rcx + 0x14]
00684 418b5904                       mov        ebx, dword ptr [r9 + 4]
00688 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
0068d 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
00695 443bd3                         cmp        r10d, ebx
00698 0f83da040000                   jae        0x7f6027e67378
0069e 4f8b54d108                     mov        r10, qword ptr [r9 + r10*8 + 8]
006a3 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006ab 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006b2 ffc5                           inc        ebp
006b4 892c24                         mov        dword ptr [rsp], ebp
006b7 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006bb 0f8ddd020000                   jge        0x7f6027e6719e
006c1 49c1ea28                       shr        r10, 0x28
006c5 458bd2                         mov        r10d, r10d
006c8 450fb6d2                       movzx      r10d, r10b
006cc 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006d9 49c1ea28                       shr        r10, 0x28
006dd 458bda                         mov        r11d, r10d
006e0 410fb6eb                       movzx      ebp, r11b
006e4 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006eb 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006f3 49c1ea28                       shr        r10, 0x28
006f7 458bd2                         mov        r10d, r10d
006fa 450fb6d2                       movzx      r10d, r10b
006fe 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00706 4103ea                         add        ebp, r10d
00709 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00710 41ba01000000                   mov        r10d, 1
00716 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0071e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00726 49c1ea20                       shr        r10, 0x20
0072a 458bd2                         mov        r10d, r10d
0072d 410fb6ea                       movzx      ebp, r10b
00731 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00738 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0073d 49c1ea20                       shr        r10, 0x20
00741 458bda                         mov        r11d, r10d
00744 410fb6eb                       movzx      ebp, r11b
00748 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0074f 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00757 49c1ea20                       shr        r10, 0x20
0075b 458bd2                         mov        r10d, r10d
0075e 410fb6ea                       movzx      ebp, r10b
00762 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00769 448bc5                         mov        r8d, ebp
0076c 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
00774 44038424d8000000               add        r8d, dword ptr [rsp + 0xd8]
0077c 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
00784 4585c0                         test       r8d, r8d
00787 0f847f050000                   je         0x7f6027e6750c
0078d 4183f83f                       cmp        r8d, 0x3f
00791 0f8f4d060000                   jg         0x7f6027e675e4
00797 bb40000000                     mov        ebx, 0x40
0079c 2b5c243c                       sub        ebx, dword ptr [rsp + 0x3c]
007a0 443bc3                         cmp        r8d, ebx
007a3 7e47                           jle        0x7f6027e66fec
007a5 458bc8                         mov        r9d, r8d
007a8 442bcb                         sub        r9d, ebx
007ab 83fb40                         cmp        ebx, 0x40
007ae 0f8ddc0e0000                   jge        0x7f6027e67e90
007b4 41ba01000000                   mov        r10d, 1
007ba c442e1f7d2                     shlx       r10, r10, rbx
007bf 49ffca                         dec        r10
007c2 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007ca c4c2b1f7ea                     shlx       rbp, r10, r9
007cf 41bb40000000                   mov        r11d, 0x40
007d5 452bd9                         sub        r11d, r9d
007d8 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007df 490bea                         or         rbp, r10
007e2 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007ea eb26                           jmp        0x7f6027e67012
007ec 41ba01000000                   mov        r10d, 1
007f2 c442b9f7d2                     shlx       r10, r10, r8
007f7 412bd8                         sub        ebx, r8d
007fa c4e2e3f7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], rbx
00804 49ffca                         dec        r10
00807 4923ea                         and        rbp, r10
0080a 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00812 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00817 4503d8                         add        r11d, r8d
0081a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0081f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00824 4503d0                         add        r10d, r8d
00827 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0082c 4183fb40                       cmp        r11d, 0x40
00830 0f8cdafbffff                   jl         0x7f6027e66c10
00836 458d53c0                       lea        r10d, [r11 - 0x40]
0083a 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0083f 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00843 83c5f8                         add        ebp, -8
00846 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0084a 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084e 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00852 83c1f0                         add        ecx, -0x10
00855 83f908                         cmp        ecx, 8
00858 0f8cf2000000                   jl         0x7f6027e67150
0085e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00863 4183c0e8                       add        r8d, -0x18
00867 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
0086f 0f8272fbffff                   jb         0x7f6027e66be7
00875 bee4ffffff                     mov        esi, 0xffffffe4
0087a 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00882 448b542408                     mov        r10d, dword ptr [rsp + 8]
00887 44891424                       mov        dword ptr [rsp], r10d
0088b 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00890 4489542404                     mov        dword ptr [rsp + 4], r10d
00895 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0089a 4489542408                     mov        dword ptr [rsp + 8], r10d
0089f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008a4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008a9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008ae 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008b3 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008b8 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008bd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008c2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008c7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008cc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008d1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008d6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008db 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008e0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008e5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008ea 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008ef 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
008f4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008f9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008fe 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00903 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00908 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0090d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00912 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00917 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0091c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00921 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00929 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0092e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00936 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0093b 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00943 e818c5b5ff                     call       0x7f60279c3660
00948 0f1f8400400a0002               nop        dword ptr [rax + rax + 0x2000a40]
00950 85c9                           test       ecx, ecx
00952 7f08                           jg         0x7f6027e6715c
00954 4533d2                         xor        r10d, r10d
00957 e998faffff                     jmp        0x7f6027e66bf4
0095c 8be9                           mov        ebp, ecx
0095e 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00966 8b542408                       mov        edx, dword ptr [rsp + 8]
0096a 90                             nop        
0096b e8f046a9ff                     call       0x7f60278fb860
00970 0f1f8400680a0003               nop        dword ptr [rax + rax + 0x3000a68]
00978 448b542408                     mov        r10d, dword ptr [rsp + 8]
0097d 41c1e203                       shl        r10d, 3
00981 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00986 41c1e303                       shl        r11d, 3
0098a 452bd3                         sub        r10d, r11d
0098d 4181c2c0000000                 add        r10d, 0xc0
00994 c462a9f7d0                     shlx       r10, rax, r10
00999 e956faffff                     jmp        0x7f6027e66bf4
0099e 4533db                         xor        r11d, r11d
009a1 33ed                           xor        ebp, ebp
009a3 4533d2                         xor        r10d, r10d
009a6 4533c9                         xor        r9d, r9d
009a9 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009b1 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009b8 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009c0 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
009c8 e951fdffff                     jmp        0x7f6027e66f1e
009cd 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009d5 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009dd 4d03c2                         add        r8, r10
009e0 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009e8 4d3bc2                         cmp        r8, r10
009eb 7e30                           jle        0x7f6027e6721d
009ed 48bee85429e300000000           movabs     rsi, 0xe32954e8
009f7 e86446a9ff                     call       0x7f60278fb860
009fc 0f1f8400f40a0004               nop        dword ptr [rax + rax + 0x4000af4]
00a04 4885c0                         test       rax, rax
00a07 0f848f110000                   je         0x7f6027e6839c
00a0d 488bf0                         mov        rsi, rax
00a10 4881c410010000                 add        rsp, 0x110
00a17 5d                             pop        rbp
00a18 e94343b6ff                     jmp        0x7f60279cb560
00a1d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a22 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a2a 0f8580110000                   jne        0x7f6027e683b0
00a30 418bc0                         mov        eax, r8d
00a33 4881c410010000                 add        rsp, 0x110
00a3a 5d                             pop        rbp
00a3b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a3f 0f8789120000                   ja         0x7f6027e684ce
00a45 c3                             ret        
00a46 4533d2                         xor        r10d, r10d
00a49 4533db                         xor        r11d, r11d
00a4c 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a51 e980f7ffff                     jmp        0x7f6027e669d6
00a56 bee4ffffff                     mov        esi, 0xffffffe4
00a5b 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a63 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a68 44891c24                       mov        dword ptr [rsp], r11d
00a6c 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00a71 4489442404                     mov        dword ptr [rsp + 4], r8d
00a76 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a7b 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a80 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00a85 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00a8a 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00a8f 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00a94 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a99 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00a9e 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00aa3 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00aa8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00aad 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ab2 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ab7 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00abc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ac1 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ac6 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00aca 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00acf e88cc3b5ff                     call       0x7f60279c3660
00ad4 0f1f8400cc0b0005               nop        dword ptr [rax + rax + 0x5000bcc]
00adc bee4ffffff                     mov        esi, 0xffffffe4
00ae1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ae9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00aee 44891424                       mov        dword ptr [rsp], r10d
00af2 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00af7 44894c2404                     mov        dword ptr [rsp + 4], r9d
00afc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b01 4489542408                     mov        dword ptr [rsp + 8], r10d
00b06 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b0b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b10 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00b15 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00b1a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00b1f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00b24 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b29 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b2e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00b33 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b38 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b3d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b42 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b47 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b4c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b51 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00b56 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b5b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b60 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b65 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b6a 90                             nop        
00b6b e8f0c2b5ff                     call       0x7f60279c3660
00b70 0f1f8400680c0006               nop        dword ptr [rax + rax + 0x6000c68]
00b78 bee4ffffff                     mov        esi, 0xffffffe4
00b7d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b85 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b8a 44891c24                       mov        dword ptr [rsp], r11d
00b8e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b93 4489442404                     mov        dword ptr [rsp + 4], r8d
00b98 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b9d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ba2 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00ba7 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bac 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00bb1 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00bb6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bbb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00bc0 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00bc5 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00bca 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00bcf 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00bd4 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00bd8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bdd 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00be2 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00be7 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00bec 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00bf1 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00bf6 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00bfb 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00c00 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c05 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00c0a 90                             nop        
00c0b e850c2b5ff                     call       0x7f60279c3660
00c10 0f1f8400080d0007               nop        dword ptr [rax + rax + 0x7000d08]
00c18 4533db                         xor        r11d, r11d
00c1b 4d3bcb                         cmp        r9, r11
00c1e bdffffffff                     mov        ebp, 0xffffffff
00c23 7c08                           jl         0x7f6027e6742d
00c25 400f95c5                       setne      bpl
00c29 400fb6ed                       movzx      ebp, bpl
00c2d be45ffffff                     mov        esi, 0xffffff45
00c32 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c3a 4c891c24                       mov        qword ptr [rsp], r11
00c3e 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
00c42 895c240c                       mov        dword ptr [rsp + 0xc], ebx
00c46 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c4e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c53 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c58 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c5d 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00c61 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00c65 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c6a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c6f 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00c73 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00c77 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c7c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00c81 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
00c85 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00c89 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00c8e 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00c93 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00c9a 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00c9e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00ca3 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00ca8 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00cac 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00cb0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00cb5 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00cba 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00cbf 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00cc4 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00ccc 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00cd1 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00cd9 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00cde 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00ce6 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00ced 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00cf5 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00cfd 6690                           nop        
00cff e85cc1b5ff                     call       0x7f60279c3660
00d04 0f1f8400fc0d0008               nop        dword ptr [rax + rax + 0x8000dfc]
00d0c be45ffffff                     mov        esi, 0xffffff45
00d11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d19 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d1e 44891c24                       mov        dword ptr [rsp], r11d
00d22 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d27 4489542404                     mov        dword ptr [rsp + 4], r10d
00d2c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d31 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d36 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d3b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d40 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d45 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d4a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00d4f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00d54 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00d59 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d5e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d63 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d68 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00d6c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00d71 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00d76 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00d7b 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00d80 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00d85 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00d8a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d8f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00d94 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00d99 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00d9e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00da3 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00da8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dad 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00db2 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00dba 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00dbf 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00dc7 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00dcc 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00dd4 666690                         nop        
00dd7 e884c0b5ff                     call       0x7f60279c3660
00ddc 0f1f8400d40e0009               nop        dword ptr [rax + rax + 0x9000ed4]
00de4 be45ffffff                     mov        esi, 0xffffff45
00de9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00df1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00df6 44891c24                       mov        dword ptr [rsp], r11d
00dfa 4489442408                     mov        dword ptr [rsp + 8], r8d
00dff e85cc0b5ff                     call       0x7f60279c3660
00e04 0f1f8400fc0e000a               nop        dword ptr [rax + rax + 0xa000efc]
00e0c be45ffffff                     mov        esi, 0xffffff45
00e11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e19 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e1e 44891c24                       mov        dword ptr [rsp], r11d
00e22 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e27 4489542404                     mov        dword ptr [rsp + 4], r10d
00e2c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e31 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e36 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e3e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e43 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e48 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e4d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e52 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e57 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e5c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e61 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e66 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e6b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e70 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e75 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e7a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00e7f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e84 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e89 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e8e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e93 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e98 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e9d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ea2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00ea7 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00eac 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00eb1 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00eb6 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ebb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ec0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ec5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ecd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ed2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00eda 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00edf e87cbfb5ff                     call       0x7f60279c3660
00ee4 0f1f8400dc0f000b               nop        dword ptr [rax + rax + 0xb000fdc]
00eec be45ffffff                     mov        esi, 0xffffff45
00ef1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ef9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00efe 44891424                       mov        dword ptr [rsp], r10d
00f02 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f07 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f0c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f11 4489542408                     mov        dword ptr [rsp + 8], r10d
00f16 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f1e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f23 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f28 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f2d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f32 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f37 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f3c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f41 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f46 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f4b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f50 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f55 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f5a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f5f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f64 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f69 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f6e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f73 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00f78 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00f7d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f82 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00f87 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f8c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00f91 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f96 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00f9b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fa0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fa5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fad 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fb2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fba 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fbf 448b9c24d8000000               mov        r11d, dword ptr [rsp + 0xd8]
00fc7 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00fcc 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00fd4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00fdc 666690                         nop        
00fdf e87cbeb5ff                     call       0x7f60279c3660
00fe4 0f1f8400dc10000c               nop        dword ptr [rax + rax + 0xc0010dc]
00fec be45ffffff                     mov        esi, 0xffffff45
00ff1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ff9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ffe 44891c24                       mov        dword ptr [rsp], r11d
01002 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01007 4489542404                     mov        dword ptr [rsp + 4], r10d
0100c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01011 44895c2408                     mov        dword ptr [rsp + 8], r11d
01016 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0101e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01023 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01028 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0102d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01032 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01037 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0103c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01041 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01046 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0104b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01050 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01055 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0105a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0105f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01064 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01069 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0106e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01073 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01078 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0107d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01082 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01087 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0108c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01091 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01096 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0109b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010a0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010a5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010ad 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010b2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010ba 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010bf 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
010c7 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
010cc 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
010d4 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
010db 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
010e3 e878bdb5ff                     call       0x7f60279c3660
010e8 0f1f8400e011000d               nop        dword ptr [rax + rax + 0xd0011e0]
010f0 be45ffffff                     mov        esi, 0xffffff45
010f5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010fd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01102 44891c24                       mov        dword ptr [rsp], r11d
01106 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0110b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01110 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01115 44895c2408                     mov        dword ptr [rsp + 8], r11d
0111a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0111f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01124 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01129 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0112e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01133 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01138 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0113d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01142 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01147 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0114c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01151 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01156 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0115b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01160 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01165 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0116a 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0116f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01174 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01179 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0117e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01183 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01188 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0118d 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01192 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01197 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0119c 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
011a4 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
011a9 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
011b1 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
011b6 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
011bb 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
011c2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011ca 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
011d2 90                             nop        
011d3 e888bcb5ff                     call       0x7f60279c3660
011d8 0f1f8400d012000e               nop        dword ptr [rax + rax + 0xe0012d0]
011e0 41bbffffff7f                   mov        r11d, 0x7fffffff
011e6 4d3bcb                         cmp        r9, r11
011e9 bdffffffff                     mov        ebp, 0xffffffff
011ee 7c08                           jl         0x7f6027e679f8
011f0 400f95c5                       setne      bpl
011f4 400fb6ed                       movzx      ebp, bpl
011f8 be45ffffff                     mov        esi, 0xffffff45
011fd 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01205 4c891c24                       mov        qword ptr [rsp], r11
01209 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0120e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01213 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0121b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01220 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
01224 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01228 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0122d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01232 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
01236 895c2430                       mov        dword ptr [rsp + 0x30], ebx
0123a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0123f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01244 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
01248 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0124c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01251 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01256 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
0125a 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0125e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01266 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0126b 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
0126f 895c2450                       mov        dword ptr [rsp + 0x50], ebx
01273 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01278 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0127d 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01281 895c2458                       mov        dword ptr [rsp + 0x58], ebx
01285 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0128a 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0128f 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01297 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0129c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012a4 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012a9 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012b1 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
012b8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012c0 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012c8 666690                         nop        
012cb e890bbb5ff                     call       0x7f60279c3660
012d0 0f1f8400c813000f               nop        dword ptr [rax + rax + 0xf0013c8]
012d8 be45ffffff                     mov        esi, 0xffffff45
012dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012e5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
012ea 44891c24                       mov        dword ptr [rsp], r11d
012ee 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
012f3 44895c2404                     mov        dword ptr [rsp + 4], r11d
012f8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
012fd 44895c2408                     mov        dword ptr [rsp + 8], r11d
01302 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01307 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0130c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01311 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01316 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0131b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01320 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01325 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0132a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0132f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01334 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01339 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0133e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01343 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01348 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0134d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01352 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01357 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0135c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01361 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01366 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0136b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01370 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01375 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0137a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0137f 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01384 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0138c 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
01391 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
01396 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
0139e 90                             nop        
0139f e8bcbab5ff                     call       0x7f60279c3660
013a4 0f1f84009c140010               nop        dword ptr [rax + rax + 0x1000149c]
013ac be45ffffff                     mov        esi, 0xffffff45
013b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013b9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
013be 44891c24                       mov        dword ptr [rsp], r11d
013c2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
013c7 44895c2404                     mov        dword ptr [rsp + 4], r11d
013cc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013d1 44895c2408                     mov        dword ptr [rsp + 8], r11d
013d6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013db 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013e0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
013e5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
013ea 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
013ef 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
013f4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
013f9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
013fe 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01403 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01408 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0140d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01412 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01417 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0141c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01421 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01426 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0142b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01430 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01435 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0143a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0143f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01444 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01449 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0144e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01453 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01458 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01460 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01465 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0146a 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01471 6690                           nop        
01473 e8e8b9b5ff                     call       0x7f60279c3660
01478 0f1f840070150011               nop        dword ptr [rax + rax + 0x11001570]
01480 be3dffffff                     mov        esi, 0xffffff3d
01485 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0148d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01492 44890c24                       mov        dword ptr [rsp], r9d
01496 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0149b 44894c2404                     mov        dword ptr [rsp + 4], r9d
014a0 8b5c2410                       mov        ebx, dword ptr [rsp + 0x10]
014a4 895c2408                       mov        dword ptr [rsp + 8], ebx
014a8 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
014ad 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
014b2 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
014b6 895c240c                       mov        dword ptr [rsp + 0xc], ebx
014ba 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014bf 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014c4 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
014c8 895c2424                       mov        dword ptr [rsp + 0x24], ebx
014cc 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
014d1 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
014d6 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
014da 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
014de 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
014e3 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
014e8 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
014ec 895c2434                       mov        dword ptr [rsp + 0x34], ebx
014f0 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
014f5 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
014fa 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01501 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01505 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0150a 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0150f 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
01513 895c244c                       mov        dword ptr [rsp + 0x4c], ebx
01517 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0151c 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01521 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01526 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
0152b 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01533 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01538 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01540 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01545 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0154a 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01552 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01559 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01561 6690                           nop        
01563 e8f8b8b5ff                     call       0x7f60279c3660
01568 0f1f840060160012               nop        dword ptr [rax + rax + 0x12001660]
01570 be45ffffff                     mov        esi, 0xffffff45
01575 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0157d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01582 44891424                       mov        dword ptr [rsp], r10d
01586 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0158b 4489542404                     mov        dword ptr [rsp + 4], r10d
01590 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01595 44895c2408                     mov        dword ptr [rsp + 8], r11d
0159a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0159f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015a4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015a9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015ae 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
015b3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
015b8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
015bd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
015c2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
015c7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
015cc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015d1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
015d6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
015db 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
015e0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
015e5 4489542444                     mov        dword ptr [rsp + 0x44], r10d
015ea 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
015ef 894c2460                       mov        dword ptr [rsp + 0x60], ecx
015f3 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
015f8 666690                         nop        
015fb e860b8b5ff                     call       0x7f60279c3660
01600 0f1f8400f8160013               nop        dword ptr [rax + rax + 0x130016f8]
01608 be45ffffff                     mov        esi, 0xffffff45
0160d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01615 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0161a 44890c24                       mov        dword ptr [rsp], r9d
0161e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01623 44894c2404                     mov        dword ptr [rsp + 4], r9d
01628 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0162d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01632 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01637 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0163c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01641 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01646 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0164b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01650 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01655 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0165a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0165f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01664 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01669 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0166e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01673 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01678 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0167d 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01682 90                             nop        
01683 e8d8b7b5ff                     call       0x7f60279c3660
01688 0f1f840080170014               nop        dword ptr [rax + rax + 0x14001780]
01690 be45ffffff                     mov        esi, 0xffffff45
01695 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0169d 448b542408                     mov        r10d, dword ptr [rsp + 8]
016a2 44891424                       mov        dword ptr [rsp], r10d
016a6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
016ab 44895c2404                     mov        dword ptr [rsp + 4], r11d
016b0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016b5 4489542408                     mov        dword ptr [rsp + 8], r10d
016ba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016bf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016c4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
016c9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
016ce 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
016d3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
016d8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
016dd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016e2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
016e7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
016ec 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
016f0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
016f5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
016fa 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
016ff 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01704 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01709 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0170e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01713 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01718 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0171d 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01722 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01727 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0172c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01731 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01736 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0173e 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01743 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0174b 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01750 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01758 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01760 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
01767 e8f4b6b5ff                     call       0x7f60279c3660
0176c 0f1f840064180015               nop        dword ptr [rax + rax + 0x15001864]
01774 4585c0                         test       r8d, r8d
01777 7f08                           jg         0x7f6027e67f81
01779 4533ed                         xor        r13d, r13d
0177c e93ce9ffff                     jmp        0x7f6027e668bd
01781 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01785 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0178a 897c241c                       mov        dword ptr [rsp + 0x1c], edi
0178e 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01793 89442414                       mov        dword ptr [rsp + 0x14], eax
01797 894c2410                       mov        dword ptr [rsp + 0x10], ecx
0179b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017a0 48894424f8                     mov        qword ptr [rsp - 8], rax
017a5 8b0424                         mov        eax, dword ptr [rsp]
017a8 89442404                       mov        dword ptr [rsp + 4], eax
017ac 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017b1 48894424f8                     mov        qword ptr [rsp - 8], rax
017b6 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017bd 890424                         mov        dword ptr [rsp], eax
017c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017c5 488bee                         mov        rbp, rsi
017c8 8b542408                       mov        edx, dword ptr [rsp + 8]
017cc 418bc8                         mov        ecx, r8d
017cf e88c38a9ff                     call       0x7f60278fb860
017d4 0f1f8400cc180016               nop        dword ptr [rax + rax + 0x160018cc]
017dc 41bb40000000                   mov        r11d, 0x40
017e2 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
017e7 c462a1f7e8                     shlx       r13, rax, r11
017ec 48894424f8                     mov        qword ptr [rsp - 8], rax
017f1 8b442404                       mov        eax, dword ptr [rsp + 4]
017f5 890424                         mov        dword ptr [rsp], eax
017f8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017fd 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01802 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
01806 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0180a 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0180f 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01813 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
01818 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
0181c e99ce8ffff                     jmp        0x7f6027e668bd
01821 4585c0                         test       r8d, r8d
01824 7f07                           jg         0x7f6027e6802d
01826 33f6                           xor        esi, esi
01828 e9d1e8ffff                     jmp        0x7f6027e668fe
0182d 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01832 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01837 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0183b 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01840 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01844 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01849 89442414                       mov        dword ptr [rsp + 0x14], eax
0184d 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01851 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01856 48894424f8                     mov        qword ptr [rsp - 8], rax
0185b 8b0424                         mov        eax, dword ptr [rsp]
0185e 89442404                       mov        dword ptr [rsp + 4], eax
01862 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01867 48894424f8                     mov        qword ptr [rsp - 8], rax
0186c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01873 890424                         mov        dword ptr [rsp], eax
01876 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187b 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01883 488bf5                         mov        rsi, rbp
01886 8b542408                       mov        edx, dword ptr [rsp + 8]
0188a 418bc8                         mov        ecx, r8d
0188d 6690                           nop        
0188f e8cc37a9ff                     call       0x7f60278fb860
01894 0f1f84008c190017               nop        dword ptr [rax + rax + 0x1700198c]
0189c 41bb80000000                   mov        r11d, 0x80
018a2 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
018a7 c4e2a1f7f0                     shlx       rsi, rax, r11
018ac 48894424f8                     mov        qword ptr [rsp - 8], rax
018b1 8b442404                       mov        eax, dword ptr [rsp + 4]
018b5 890424                         mov        dword ptr [rsp], eax
018b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bd 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
018c1 8b442414                       mov        eax, dword ptr [rsp + 0x14]
018c5 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
018c9 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
018ce 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
018d2 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
018d7 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
018dc e91de8ffff                     jmp        0x7f6027e668fe
018e1 4533c0                         xor        r8d, r8d
018e4 e9ecf0ffff                     jmp        0x7f6027e671d5
018e9 bee4ffffff                     mov        esi, 0xffffffe4
018ee 48ffb42490000000               push       qword ptr [rsp + 0x90]
018f6 488f0424                       pop        qword ptr [rsp]
018fa 90                             nop        
018fb e860b5b5ff                     call       0x7f60279c3660
01900 0f1f8400f8190018               nop        dword ptr [rax + rax + 0x180019f8]
01908 be5d000000                     mov        esi, 0x5d
0190d 6690                           nop        
0190f e84cb5b5ff                     call       0x7f60279c3660
01914 0f1f84000c1a0019               nop        dword ptr [rax + rax + 0x19001a0c]
0191c bef6ffffff                     mov        esi, 0xfffffff6
01921 6690                           nop        
01923 e838b5b5ff                     call       0x7f60279c3660
01928 0f1f8400201a001a               nop        dword ptr [rax + rax + 0x1a001a20]
01930 bef6ffffff                     mov        esi, 0xfffffff6
01935 6690                           nop        
01937 e824b5b5ff                     call       0x7f60279c3660
0193c 0f1f8400341a001b               nop        dword ptr [rax + rax + 0x1b001a34]
01944 be6effffff                     mov        esi, 0xffffff6e
01949 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01951 448b542408                     mov        r10d, dword ptr [rsp + 8]
01956 44891424                       mov        dword ptr [rsp], r10d
0195a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0195f 4489542408                     mov        dword ptr [rsp + 8], r10d
01964 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01969 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0196e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01973 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01978 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0197d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01982 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01987 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0198c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01991 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01996 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0199b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019a0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
019a5 6690                           nop        
019a7 e8b4b4b5ff                     call       0x7f60279c3660
019ac 0f1f8400a41a001c               nop        dword ptr [rax + rax + 0x1c001aa4]
019b4 bee4ffffff                     mov        esi, 0xffffffe4
019b9 48ffb42490000000               push       qword ptr [rsp + 0x90]
019c1 488f0424                       pop        qword ptr [rsp]
019c5 89442418                       mov        dword ptr [rsp + 0x18], eax
019c9 48894424f8                     mov        qword ptr [rsp - 8], rax
019ce 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019d5 8944241c                       mov        dword ptr [rsp + 0x1c], eax
019d9 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019de 897c2428                       mov        dword ptr [rsp + 0x28], edi
019e2 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019e6 90                             nop        
019e7 e874b4b5ff                     call       0x7f60279c3660
019ec 0f1f8400e41a001d               nop        dword ptr [rax + rax + 0x1d001ae4]
019f4 bee4ffffff                     mov        esi, 0xffffffe4
019f9 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a01 488f0424                       pop        qword ptr [rsp]
01a05 48894424f8                     mov        qword ptr [rsp - 8], rax
01a0a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a11 89442418                       mov        dword ptr [rsp + 0x18], eax
01a15 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a1a 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01a1e 89542428                       mov        dword ptr [rsp + 0x28], edx
01a22 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01a27 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a2c 666690                         nop        
01a2f e82cb4b5ff                     call       0x7f60279c3660
01a34 0f1f84002c1b001e               nop        dword ptr [rax + rax + 0x1e001b2c]
01a3c bebeffffff                     mov        esi, 0xffffffbe
01a41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a49 448b542408                     mov        r10d, dword ptr [rsp + 8]
01a4e 44891424                       mov        dword ptr [rsp], r10d
01a52 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a57 4489542408                     mov        dword ptr [rsp + 8], r10d
01a5c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a61 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a66 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a6b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a70 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a75 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a7a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01a7f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a84 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01a89 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a8e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01a93 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a98 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a9d 6690                           nop        
01a9f e8bcb3b5ff                     call       0x7f60279c3660
01aa4 0f1f84009c1b001f               nop        dword ptr [rax + rax + 0x1f001b9c]
01aac beccffffff                     mov        esi, 0xffffffcc
01ab1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ab9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01abe 44891424                       mov        dword ptr [rsp], r10d
01ac2 89442410                       mov        dword ptr [rsp + 0x10], eax
01ac6 48894424f8                     mov        qword ptr [rsp - 8], rax
01acb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ad2 89442414                       mov        dword ptr [rsp + 0x14], eax
01ad6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01adb 897c2418                       mov        dword ptr [rsp + 0x18], edi
01adf 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01ae3 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01ae7 e874b3b5ff                     call       0x7f60279c3660
01aec 0f1f8400e41b0020               nop        dword ptr [rax + rax + 0x20001be4]
01af4 beccffffff                     mov        esi, 0xffffffcc
01af9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b01 448b442408                     mov        r8d, dword ptr [rsp + 8]
01b06 44890424                       mov        dword ptr [rsp], r8d
01b0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01b0f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b16 89442410                       mov        dword ptr [rsp + 0x10], eax
01b1a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b1f 897c2414                       mov        dword ptr [rsp + 0x14], edi
01b23 89542418                       mov        dword ptr [rsp + 0x18], edx
01b27 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01b2c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b31 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01b35 6690                           nop        
01b37 e824b3b5ff                     call       0x7f60279c3660
01b3c 0f1f8400341c0021               nop        dword ptr [rax + rax + 0x21001c34]
01b44 be45ffffff                     mov        esi, 0xffffff45
01b49 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b4e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b53 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01b58 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b5d 6690                           nop        
01b5f e8fcb2b5ff                     call       0x7f60279c3660
01b64 0f1f84005c1c0022               nop        dword ptr [rax + rax + 0x22001c5c]
01b6c be45ffffff                     mov        esi, 0xffffff45
01b71 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b76 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b7b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01b80 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01b85 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01b8a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01b8f e8ccb2b5ff                     call       0x7f60279c3660
01b94 0f1f84008c1c0023               nop        dword ptr [rax + rax + 0x23001c8c]
01b9c bef6ffffff                     mov        esi, 0xfffffff6
01ba1 6690                           nop        
01ba3 e8b8b2b5ff                     call       0x7f60279c3660
01ba8 0f1f8400a01c0024               nop        dword ptr [rax + rax + 0x24001ca0]
01bb0 be5d000000                     mov        esi, 0x5d
01bb5 6690                           nop        
01bb7 e8a4b2b5ff                     call       0x7f60279c3660
01bbc 0f1f8400b41c0025               nop        dword ptr [rax + rax + 0x25001cb4]
01bc4 be45ffffff                     mov        esi, 0xffffff45
01bc9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bd1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01bd6 44891c24                       mov        dword ptr [rsp], r11d
01bda 90                             nop        
01bdb e880b2b5ff                     call       0x7f60279c3660
01be0 0f1f8400d81c0026               nop        dword ptr [rax + rax + 0x26001cd8]
01be8 bef6ffffff                     mov        esi, 0xfffffff6
01bed 418bea                         mov        ebp, r10d
01bf0 666690                         nop        
01bf3 e868b2b5ff                     call       0x7f60279c3660
01bf8 0f1f8400f01c0027               nop        dword ptr [rax + rax + 0x27001cf0]
01c00 bef6ffffff                     mov        esi, 0xfffffff6
01c05 418be8                         mov        ebp, r8d
01c08 666690                         nop        
01c0b e850b2b5ff                     call       0x7f60279c3660
01c10 0f1f8400081d0028               nop        dword ptr [rax + rax + 0x28001d08]
01c18 bef6ffffff                     mov        esi, 0xfffffff6
01c1d 418bea                         mov        ebp, r10d
01c20 666690                         nop        
01c23 e838b2b5ff                     call       0x7f60279c3660
01c28 0f1f8400201d0029               nop        dword ptr [rax + rax + 0x29001d20]
01c30 bef6ffffff                     mov        esi, 0xfffffff6
01c35 6690                           nop        
01c37 e824b2b5ff                     call       0x7f60279c3660
01c3c 0f1f8400341d002a               nop        dword ptr [rax + rax + 0x2a001d34]
01c44 bef6ffffff                     mov        esi, 0xfffffff6
01c49 6690                           nop        
01c4b e810b2b5ff                     call       0x7f60279c3660
01c50 0f1f8400481d002b               nop        dword ptr [rax + rax + 0x2b001d48]
01c58 bef6ffffff                     mov        esi, 0xfffffff6
01c5d 6690                           nop        
01c5f e8fcb1b5ff                     call       0x7f60279c3660
01c64 0f1f84005c1d002c               nop        dword ptr [rax + rax + 0x2c001d5c]
01c6c bef6ffffff                     mov        esi, 0xfffffff6
01c71 6690                           nop        
01c73 e8e8b1b5ff                     call       0x7f60279c3660
01c78 0f1f8400701d002d               nop        dword ptr [rax + rax + 0x2d001d70]
01c80 bef6ffffff                     mov        esi, 0xfffffff6
01c85 6690                           nop        
01c87 e8d4b1b5ff                     call       0x7f60279c3660
01c8c 0f1f8400841d002e               nop        dword ptr [rax + rax + 0x2e001d84]
01c94 bef6ffffff                     mov        esi, 0xfffffff6
01c99 6690                           nop        
01c9b e8c0b1b5ff                     call       0x7f60279c3660
01ca0 0f1f8400981d002f               nop        dword ptr [rax + rax + 0x2f001d98]
01ca8 bef6ffffff                     mov        esi, 0xfffffff6
01cad 6690                           nop        
01caf e8acb1b5ff                     call       0x7f60279c3660
01cb4 0f1f8400ac1d0030               nop        dword ptr [rax + rax + 0x30001dac]
01cbc eb08                           jmp        0x7f6027e684c6
01cbe eb06                           jmp        0x7f6027e684c6
01cc0 eb04                           jmp        0x7f6027e684c6
01cc2 eb02                           jmp        0x7f6027e684c6
01cc4 eb00                           jmp        0x7f6027e684c6
01cc6 488bf0                         mov        rsi, rax
01cc9 e942edffff                     jmp        0x7f6027e67210
01cce 49ba3b72e627607f0000           movabs     r10, 0x7f6027e6723b
01cd8 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01cdf e9fc59a9ff                     jmp        0x7f60278fdee0
01ce4 e8b725a8ff                     call       0x7f60278eaaa0
01ce9 e930e3ffff                     jmp        0x7f6027e6681e
01cee f4                             hlt        
01cef f4                             hlt        
