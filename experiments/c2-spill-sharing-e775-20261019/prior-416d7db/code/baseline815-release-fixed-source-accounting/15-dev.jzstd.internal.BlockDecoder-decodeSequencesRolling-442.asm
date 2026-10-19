00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8526200000                   jne        0x7f1e7fe87cc4
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5e08                       mov        r11d, dword ptr [rsi + 8]
00049 44891c24                       mov        dword ptr [rsp], r11d
0004d 413beb                         cmp        ebp, r11d
00050 0f83c41a0000                   jae        0x7f1e7fe8779a
00056 440fb65c160b                   movzx      r11d, byte ptr [rsi + rdx + 0xb]
0005c 4585db                         test       r11d, r11d
0005f 0f84d31a0000                   je         0x7f1e7fe877b8
00065 448bca                         mov        r9d, edx
00068 442bc9                         sub        r9d, ecx
0006b 448b1424                       mov        r10d, dword ptr [rsp]
0006f 4183c2f9                       add        r10d, -7
00073 448d42f8                       lea        r8d, [rdx - 8]
00077 428d0ccd00000000               lea        ecx, [r9*8]
0007f f3450fbddb                     lzcnt      r11d, r11d
00084 be1f000000                     mov        esi, 0x1f
00089 412bf3                         sub        esi, r11d
0008c bf08000000                     mov        edi, 8
00091 2bfe                           sub        edi, esi
00093 8bd1                           mov        edx, ecx
00095 2bd7                           sub        edx, edi
00097 4183f908                       cmp        r9d, 8
0009b 0f8cfb180000                   jl         0x7f1e7fe8761c
000a1 4585d2                         test       r10d, r10d
000a4 0f8c821c0000                   jl         0x7f1e7fe879ac
000aa 8b2c24                         mov        ebp, dword ptr [rsp]
000ad 83c5f9                         add        ebp, -7
000b0 443bc5                         cmp        r8d, ebp
000b3 0f83531b0000                   jae        0x7f1e7fe8788c
000b9 418bd8                         mov        ebx, r8d
000bc 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000c4 4d8b6c1b0c                     mov        r13, qword ptr [r11 + rbx + 0xc]
000c9 4183c1f8                       add        r9d, -8
000cd 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
000d5 4183c3f0                       add        r11d, -0x10
000d9 4183f908                       cmp        r9d, 8
000dd 0f8c6e190000                   jl         0x7f1e7fe876d1
000e3 4585d2                         test       r10d, r10d
000e6 0f8c941c0000                   jl         0x7f1e7fe87a00
000ec 8b2c24                         mov        ebp, dword ptr [rsp]
000ef 83c5f9                         add        ebp, -7
000f2 443bdd                         cmp        r11d, ebp
000f5 0f83511b0000                   jae        0x7f1e7fe878cc
000fb 458bcb                         mov        r9d, r11d
000fe 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00106 4e8b74090c                     mov        r14, qword ptr [rcx + r9 + 0xc]
0010b 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00110 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00114 4585c9                         test       r9d, r9d
00117 0f842f1a0000                   je         0x7f1e7fe877cc
0011d 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00120 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00123 8b4524                         mov        eax, dword ptr [rbp + 0x24]
00126 85c0                           test       eax, eax
00128 0f84321a0000                   je         0x7f1e7fe877e0
0012e 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00132 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
0013a 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
0013f 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
00144 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
0014b 8974240c                       mov        dword ptr [rsp + 0xc], esi
0014f 897c2424                       mov        dword ptr [rsp + 0x24], edi
00153 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00158 4489542404                     mov        dword ptr [rsp + 4], r10d
0015d 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00165 41034908                       add        ecx, dword ptr [r9 + 8]
00169 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0016e 034808                         add        ecx, dword ptr [rax + 8]
00171 89442438                       mov        dword ptr [rsp + 0x38], eax
00175 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
00179 4c8bd0                         mov        r10, rax
0017c 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00181 4d8bd1                         mov        r10, r9
00184 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00189 4c8bd3                         mov        r10, rbx
0018c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00191 85c9                           test       ecx, ecx
00193 0f84f3080000                   je         0x7f1e7fe8670c
00199 be40000000                     mov        esi, 0x40
0019e 2bf7                           sub        esi, edi
001a0 3bce                           cmp        ecx, esi
001a2 0f8feb010000                   jg         0x7f1e7fe86013
001a8 2bf1                           sub        esi, ecx
001aa c442cbf7c5                     shrx       r8, r13, rsi
001af 83f940                         cmp        ecx, 0x40
001b2 0f8d4c1d0000                   jge        0x7f1e7fe87b84
001b8 41ba01000000                   mov        r10d, 1
001be c4c2f1f7ea                     shlx       rbp, r10, rcx
001c3 48ffcd                         dec        rbp
001c6 4923e8                         and        rbp, r8
001c9 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001ce 448bd9                         mov        r11d, ecx
001d1 458bd3                         mov        r10d, r11d
001d4 442b54240c                     sub        r10d, dword ptr [rsp + 0xc]
001d9 458d4208                       lea        r8d, [r10 + 8]
001dd 4183f840                       cmp        r8d, 0x40
001e1 7c34                           jl         0x7f1e7fe85e97
001e3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
001e8 4183c2c8                       add        r10d, -0x38
001ec 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
001f1 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f9 8b542408                       mov        edx, dword ptr [rsp + 8]
001fd 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00201 6690                           nop        
00203 e8d8a9a8ff                     call       0x7f1e7f910860
00208 0f1f840000030000               nop        dword ptr [rax + rax + 0x300]
00210 4889442420                     mov        qword ptr [rsp + 0x20], rax
00215 eb31                           jmp        0x7f1e7fe85ec8
00217 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0021c 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00224 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00229 4c8b542428                     mov        r10, qword ptr [rsp + 0x28]
0022e 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00236 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0023e 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00243 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00248 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0024d 458b5b08                       mov        r11d, dword ptr [r11 + 8]
00251 4183fb20                       cmp        r11d, 0x20
00255 0f8d811b0000                   jge        0x7f1e7fe87a5c
0025b c462a3f7442460                 shrx       r8, qword ptr [rsp + 0x60], r11
00262 41ba01000000                   mov        r10d, 1
00268 c44221f7d2                     shlx       r10d, r10d, r11d
0026d 41ffca                         dec        r10d
00270 4d63d2                         movsxd     r10, r10d
00273 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00278 458bda                         mov        r11d, r10d
0027b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00280 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00285 458b4b08                       mov        r9d, dword ptr [r11 + 8]
00289 4183f920                       cmp        r9d, 0x20
0028d 0f8dc11b0000                   jge        0x7f1e7fe87ad4
00293 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0029b 458b5228                       mov        r10d, dword ptr [r10 + 0x28]
0029f 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002a7 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002ac 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
002b0 418b5a08                       mov        ebx, dword ptr [r10 + 8]
002b4 458b5b18                       mov        r11d, dword ptr [r11 + 0x18]
002b8 418b4b08                       mov        ecx, dword ptr [r11 + 8]
002bc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002c1 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
002c5 458b5208                       mov        r10d, dword ptr [r10 + 8]
002c9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002ce 4585db                         test       r11d, r11d
002d1 0f8e3b180000                   jle        0x7f1e7fe87792
002d7 ffcb                           dec        ebx
002d9 895c2460                       mov        dword ptr [rsp + 0x60], ebx
002dd ffc9                           dec        ecx
002df 894c2464                       mov        dword ptr [rsp + 0x64], ecx
002e3 41ffca                         dec        r10d
002e6 4489542468                     mov        dword ptr [rsp + 0x68], r10d
002eb c442b3f7d0                     shrx       r10, r8, r9
002f0 b901000000                     mov        ecx, 1
002f5 c46231f7c9                     shlx       r9d, ecx, r9d
002fa 458bda                         mov        r11d, r10d
002fd 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00302 41ffc9                         dec        r9d
00305 4d63d1                         movsxd     r10, r9d
00308 4d23d0                         and        r10, r8
0030b 458bd2                         mov        r10d, r10d
0030e 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00313 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0031b 458b9af8000000                 mov        r11d, dword ptr [r10 + 0xf8]
00322 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0032a 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
00331 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00339 458b5208                       mov        r10d, dword ptr [r10 + 8]
0033d 4585d2                         test       r10d, r10d
00340 0f862e180000                   jbe        0x7f1e7fe877f4
00346 4d63d2                         movsxd     r10, r10d
00349 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0034e 49ffcb                         dec        r11
00351 4d3bda                         cmp        r11, r10
00354 0f831a180000                   jae        0x7f1e7fe877f4
0035a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0035f 4585db                         test       r11d, r11d
00362 0f8c2c190000                   jl         0x7f1e7fe87914
00368 448b1424                       mov        r10d, dword ptr [rsp]
0036c 4183c2f9                       add        r10d, -7
00370 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00378 4533d2                         xor        r10d, r10d
0037b 4533db                         xor        r11d, r11d
0037e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00386 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0038e e98f020000                     jmp        0x7f1e7fe862a2
00393 8be9                           mov        ebp, ecx
00395 2bee                           sub        ebp, esi
00397 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0039f 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
003a4 666690                         nop        
003a7 e834a8a8ff                     call       0x7f1e7f910860
003ac 0f1f8400a4040001               nop        dword ptr [rax + rax + 0x10004a4]
003b4 4823442428                     and        rax, qword ptr [rsp + 0x28]
003b9 41bb40000000                   mov        r11d, 0x40
003bf 442bdd                         sub        r11d, ebp
003c2 c462d1f7c0                     shlx       r8, rax, rbp
003c7 c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003d1 4d0bc2                         or         r8, r10
003d4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003d9 448b5c241c                     mov        r11d, dword ptr [rsp + 0x1c]
003de e9eefdffff                     jmp        0x7f1e7fe85e51
003e3 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003eb 4f8b54020c                     mov        r10, qword ptr [r10 + r8 + 0xc]
003f0 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f5 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
003fd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00402 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00406 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040a 660f1f440000                   nop        word ptr [rax + rax]
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8dbc090000                   jge        0x7f1e7fe86a5c
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d690a0000                   jge        0x7f1e7fe86b3c
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bca                         mov        ecx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8d430b0000                   jge        0x7f1e7fe86c3c
00479 c4e2d3f7df                     shrx       rbx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8d120c0000                   jge        0x7f1e7fe86d34
004a2 41bb01000000                   mov        r11d, 1
004a8 c442d1f7cb                     shlx       r9, r11, rbp
004ad 49ffc9                         dec        r9
004b0 4c23cb                         and        r9, rbx
004b3 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004bb 418bdb                         mov        ebx, r11d
004be 4103da                         add        ebx, r10d
004c1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c6 458bd2                         mov        r10d, r10d
004c9 4403d1                         add        r10d, ecx
004cc 4c63db                         movsxd     r11, ebx
004cf 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
004d7 8bc9                           mov        ecx, ecx
004d9 4c03c9                         add        r9, rcx
004dc 488b8c24e8000000               mov        rcx, qword ptr [rsp + 0xe8]
004e4 4903cb                         add        rcx, r11
004e7 48898c24e8000000               mov        qword ptr [rsp + 0xe8], rcx
004ef 4d85c9                         test       r9, r9
004f2 0f8ef0070000                   jle        0x7f1e7fe86968
004f8 4981f9ffffff7f                 cmp        r9, 0x7fffffff
004ff 0f8fdb0c0000                   jg         0x7f1e7fe86e60
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8fc60d0000                   jg         0x7f1e7fe86f58
00512 81fbffff0300                   cmp        ebx, 0x3ffff
00518 0f8fba0e0000                   jg         0x7f1e7fe87058
0051e 418bc9                         mov        ecx, r9d
00521 81f900000010                   cmp        ecx, 0x10000000
00527 0f83a70f0000                   jae        0x7f1e7fe87154
0052d 4d63d2                         movsxd     r10, r10d
00530 4c63c9                         movsxd     r9, ecx
00533 49c1e312                       shl        r11, 0x12
00537 49c1e124                       shl        r9, 0x24
0053b 4d0bcb                         or         r9, r11
0053e 4d0bca                         or         r9, r10
00541 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00549 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00551 4f894cd310                     mov        qword ptr [r11 + r10*8 + 0x10], r9
00556 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
0055a 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0055e 0f8dad000000                   jge        0x7f1e7fe86291
00564 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0056c 49c1ea30                       shr        r10, 0x30
00570 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00575 49c1eb30                       shr        r11, 0x30
00579 458bca                         mov        r9d, r10d
0057c 418bcb                         mov        ecx, r11d
0057f 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00587 c4c22bf7d8                     shrx       ebx, r8d, r10d
0058c 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
00594 c4422bf7d0                     shrx       r10d, r8d, r10d
00599 4103ca                         add        ecx, r10d
0059c 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
005a0 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005a8 4183fa20                       cmp        r10d, 0x20
005ac 0f8d92100000                   jge        0x7f1e7fe872c4
005b2 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005ba 49c1ea30                       shr        r10, 0x30
005be 458bd2                         mov        r10d, r10d
005c1 b901000000                     mov        ecx, 1
005c6 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005ce c4e221f7c9                     shlx       ecx, ecx, r11d
005d3 ffc9                           dec        ecx
005d5 23cb                           and        ecx, ebx
005d7 4103c9                         add        ecx, r9d
005da 894c2448                       mov        dword ptr [rsp + 0x48], ecx
005de 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
005e6 4183f920                       cmp        r9d, 0x20
005ea 0f8d04110000                   jge        0x7f1e7fe87374
005f0 41b901000000                   mov        r9d, 1
005f6 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005fe c44221f7d9                     shlx       r11d, r9d, r11d
00603 41ffcb                         dec        r11d
00606 4523d8                         and        r11d, r8d
00609 4503da                         add        r11d, r10d
0060c 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
00611 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00615 0f8db7030000                   jge        0x7f1e7fe86652
0061b 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00622 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00627 442344246c                     and        r8d, dword ptr [rsp + 0x6c]
0062c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00631 418b5b18                       mov        ebx, dword ptr [r11 + 0x18]
00635 448b5308                       mov        r10d, dword ptr [rbx + 8]
00639 453bc2                         cmp        r8d, r10d
0063c 0f835a040000                   jae        0x7f1e7fe8671c
00642 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00647 4423542470                     and        r10d, dword ptr [rsp + 0x70]
0064c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00651 418b4b18                       mov        ecx, dword ptr [r11 + 0x18]
00655 448b4908                       mov        r9d, dword ptr [rcx + 8]
00659 4e8b5cc310                     mov        r11, qword ptr [rbx + r8*8 + 0x10]
0065e 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00663 453bd1                         cmp        r10d, r9d
00666 0f83e8040000                   jae        0x7f1e7fe867d4
0066c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00671 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
00676 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0067b 458b4118                       mov        r8d, dword ptr [r9 + 0x18]
0067f 458b4808                       mov        r9d, dword ptr [r8 + 8]
00683 4e8b54d110                     mov        r10, qword ptr [rcx + r10*8 + 0x10]
00688 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00690 453bd9                         cmp        r11d, r9d
00693 0f837f050000                   jae        0x7f1e7fe86898
00699 4f8b54d810                     mov        r10, qword ptr [r8 + r11*8 + 0x10]
0069e 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a6 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006ad ffc5                           inc        ebp
006af 896c2404                       mov        dword ptr [rsp + 4], ebp
006b3 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b7 0f8d90030000                   jge        0x7f1e7fe866cd
006bd 49c1ea28                       shr        r10, 0x28
006c1 458bd2                         mov        r10d, r10d
006c4 450fb6da                       movzx      r11d, r10b
006c8 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006d0 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006d5 49c1ea28                       shr        r10, 0x28
006d9 458bda                         mov        r11d, r10d
006dc 410fb6eb                       movzx      ebp, r11b
006e0 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006e7 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006ef 49c1ea28                       shr        r10, 0x28
006f3 458bda                         mov        r11d, r10d
006f6 450fb6d3                       movzx      r10d, r11b
006fa 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00702 4103ea                         add        ebp, r10d
00705 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0070c 41ba01000000                   mov        r10d, 1
00712 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
0071a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00722 49c1ea20                       shr        r10, 0x20
00726 458bd2                         mov        r10d, r10d
00729 410fb6ea                       movzx      ebp, r10b
0072d 896c2474                       mov        dword ptr [rsp + 0x74], ebp
00731 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00736 49c1ea20                       shr        r10, 0x20
0073a 458bda                         mov        r11d, r10d
0073d 410fb6eb                       movzx      ebp, r11b
00741 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00748 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00750 49c1ea20                       shr        r10, 0x20
00754 458bd2                         mov        r10d, r10d
00757 410fb6ea                       movzx      ebp, r10b
0075b 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00762 448bcd                         mov        r9d, ebp
00765 44034c2474                     add        r9d, dword ptr [rsp + 0x74]
0076a 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
00772 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
0077a 4585c9                         test       r9d, r9d
0077d 0f84f9020000                   je         0x7f1e7fe866fc
00783 4183f93f                       cmp        r9d, 0x3f
00787 0f8f8f0e0000                   jg         0x7f1e7fe8729c
0078d b940000000                     mov        ecx, 0x40
00792 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
00796 443bc9                         cmp        r9d, ecx
00799 7e47                           jle        0x7f1e7fe86462
0079b 458bc1                         mov        r8d, r9d
0079e 442bc1                         sub        r8d, ecx
007a1 83f940                         cmp        ecx, 0x40
007a4 0f8d06110000                   jge        0x7f1e7fe87530
007aa 41ba01000000                   mov        r10d, 1
007b0 c442f1f7d2                     shlx       r10, r10, rcx
007b5 49ffca                         dec        r10
007b8 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007c0 c4c2b9f7ea                     shlx       rbp, r10, r8
007c5 41ba40000000                   mov        r10d, 0x40
007cb 452bd0                         sub        r10d, r8d
007ce c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007d5 490bea                         or         rbp, r10
007d8 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007e0 eb30                           jmp        0x7f1e7fe86492
007e2 412bc9                         sub        ecx, r9d
007e5 c462f3f7842498000000           shrx       r8, qword ptr [rsp + 0x98], rcx
007ef 4183f940                       cmp        r9d, 0x40
007f3 0f8da70f0000                   jge        0x7f1e7fe87420
007f9 41ba01000000                   mov        r10d, 1
007ff c4c2b1f7ea                     shlx       rbp, r10, r9
00804 48ffcd                         dec        rbp
00807 4923e8                         and        rbp, r8
0080a 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00812 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00817 4503d9                         add        r11d, r9d
0081a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0081f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00824 4503d1                         add        r10d, r9d
00827 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0082c 4183fa40                       cmp        r10d, 0x40
00830 0f8cdafbffff                   jl         0x7f1e7fe86090
00836 458d5ac0                       lea        r11d, [r10 - 0x40]
0083a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0083f 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00843 83c5f8                         add        ebp, -8
00846 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0084a 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084e 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00852 83c1f0                         add        ecx, -0x10
00855 83f908                         cmp        ecx, 8
00858 0f8c1e010000                   jl         0x7f1e7fe865fc
0085e 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00863 4183c0e8                       add        r8d, -0x18
00867 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
0086f 0f826efbffff                   jb         0x7f1e7fe86063
00875 bee4ffffff                     mov        esi, 0xffffffe4
0087a 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00882 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00887 44891c24                       mov        dword ptr [rsp], r11d
0088b 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00890 44895c2404                     mov        dword ptr [rsp + 4], r11d
00895 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0089a 4489542408                     mov        dword ptr [rsp + 8], r10d
0089f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008a4 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008a9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008ae 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008b3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008b8 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008bd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008c2 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008c7 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008cc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008d1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008d6 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008db 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008e0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008e5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008ea 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008ef 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
008f4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008f9 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008fe 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00903 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00908 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0090d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00912 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00917 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0091c 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00921 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00929 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0092e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00936 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0093b 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00940 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00945 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
0094d 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00955 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0095d 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00965 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
0096d 6690                           nop        
0096f e86c17b5ff                     call       0x7f1e7f9d7d60
00974 0f1f84006c0a0002               nop        dword ptr [rax + rax + 0x2000a6c]
0097c 85c9                           test       ecx, ecx
0097e 7f08                           jg         0x7f1e7fe86608
00980 4533d2                         xor        r10d, r10d
00983 e968faffff                     jmp        0x7f1e7fe86070
00988 890c24                         mov        dword ptr [rsp], ecx
0098b 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00993 8b542408                       mov        edx, dword ptr [rsp + 8]
00997 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
0099e 90                             nop        
0099f e83ca2a8ff                     call       0x7f1e7f910860
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 448b542408                     mov        r10d, dword ptr [rsp + 8]
009b1 41c1e203                       shl        r10d, 3
009b5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009ba 41c1e303                       shl        r11d, 3
009be 452bd3                         sub        r10d, r11d
009c1 4181c2c0000000                 add        r10d, 0xc0
009c8 c462a9f7d0                     shlx       r10, rax, r10
009cd e91efaffff                     jmp        0x7f1e7fe86070
009d2 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009da 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009e2 4d03c2                         add        r8, r10
009e5 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009ed 4d3bc2                         cmp        r8, r10
009f0 7f29                           jg         0x7f1e7fe8669b
009f2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
009f7 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
009ff 0f85eb140000                   jne        0x7f1e7fe87b70
00a05 418bc0                         mov        eax, r8d
00a08 4881c410010000                 add        rsp, 0x110
00a0f 5d                             pop        rbp
00a10 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a14 0f8714160000                   ja         0x7f1e7fe87cae
00a1a c3                             ret        
00a1b 48be205d32e300000000           movabs     rsi, 0xe3325d20
00a25 6690                           nop        
00a27 e8b4a1a8ff                     call       0x7f1e7f910860
00a2c 0f1f8400240b0004               nop        dword ptr [rax + rax + 0x4000b24]
00a34 4885c0                         test       rax, rax
00a37 0f849f140000                   je         0x7f1e7fe87b5c
00a3d 488bf0                         mov        rsi, rax
00a40 4881c410010000                 add        rsp, 0x110
00a47 5d                             pop        rbp
00a48 e99342b5ff                     jmp        0x7f1e7f9da960
00a4d 4533d2                         xor        r10d, r10d
00a50 4533c0                         xor        r8d, r8d
00a53 4533db                         xor        r11d, r11d
00a56 33c9                           xor        ecx, ecx
00a58 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00a60 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
00a68 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00a70 898c24f0000000                 mov        dword ptr [rsp + 0xf0], ecx
00a77 e99efcffff                     jmp        0x7f1e7fe8639a
00a7c 4533d2                         xor        r10d, r10d
00a7f 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a87 e984f9ffff                     jmp        0x7f1e7fe86090
00a8c 4533db                         xor        r11d, r11d
00a8f 4533d2                         xor        r10d, r10d
00a92 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00a97 e935f7ffff                     jmp        0x7f1e7fe85e51
00a9c bee4ffffff                     mov        esi, 0xffffffe4
00aa1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00aa9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00aae 44891c24                       mov        dword ptr [rsp], r11d
00ab2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ab7 4489542404                     mov        dword ptr [rsp + 4], r10d
00abc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ac1 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ac6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00acb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ad0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ad5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ada 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00adf 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ae4 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00ae9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00aee 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00af3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00af8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00afd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b02 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b07 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b0c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00b11 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00b16 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00b1b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b20 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b25 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b2a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00b2f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00b34 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00b39 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00b3e 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00b42 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b47 e89415b5ff                     call       0x7f1e7f9d7d60
00b4c 0f1f8400440c0005               nop        dword ptr [rax + rax + 0x5000c44]
00b54 bee4ffffff                     mov        esi, 0xffffffe4
00b59 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b61 448b442408                     mov        r8d, dword ptr [rsp + 8]
00b66 44890424                       mov        dword ptr [rsp], r8d
00b6a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b6f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00b74 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00b79 4489442408                     mov        dword ptr [rsp + 8], r8d
00b7e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b83 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b88 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b8d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00b92 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00b97 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00b9c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00ba1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00ba6 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00bab 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00bb0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00bb5 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00bba 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00bbf 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00bc4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00bc9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00bce 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00bd3 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00bd8 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00bdd 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00be2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00be7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00bec 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00bf1 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00bf6 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00bfb 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00c00 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00c04 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00c09 6690                           nop        
00c0b e8d014b5ff                     call       0x7f1e7f9d7d60
00c10 0f1f8400080d0006               nop        dword ptr [rax + rax + 0x6000d08]
00c18 bee4ffffff                     mov        esi, 0xffffffe4
00c1d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c25 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00c2a 44890c24                       mov        dword ptr [rsp], r9d
00c2e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00c33 4489542404                     mov        dword ptr [rsp + 4], r10d
00c38 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00c3d 44894c2408                     mov        dword ptr [rsp + 8], r9d
00c42 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c47 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c4c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c51 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00c56 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c5b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c60 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c65 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c6a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c6f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c74 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c79 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c7e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c83 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c88 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00c8d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c92 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
00c97 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00c9c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00ca1 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00ca6 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00cab 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00cb0 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cb5 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00cba 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00cbf 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cc4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ccc 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cd1 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00cd6 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00cdb e80014b5ff                     call       0x7f1e7f9d7d60
00ce0 0f1f8400d80d0007               nop        dword ptr [rax + rax + 0x7000dd8]
00ce8 4533db                         xor        r11d, r11d
00ceb 4d3bcb                         cmp        r9, r11
00cee bdffffffff                     mov        ebp, 0xffffffff
00cf3 7c08                           jl         0x7f1e7fe8697d
00cf5 400f95c5                       setne      bpl
00cf9 400fb6ed                       movzx      ebp, bpl
00cfd be45ffffff                     mov        esi, 0xffffff45
00d02 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00d0a 4c891c24                       mov        qword ptr [rsp], r11
00d0e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d13 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d18 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00d20 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00d25 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00d29 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00d2d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d32 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00d37 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00d3b 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00d3f 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d44 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00d49 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00d4d 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00d51 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00d56 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00d5b 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
00d5f 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00d63 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00d6b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00d70 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00d74 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00d78 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00d7d 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
00d82 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00d86 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00d8a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d8f 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d94 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d9c 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00da1 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00da9 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00dae 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00db6 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00dbd 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00dc5 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00dcd 6690                           nop        
00dcf e80c13b5ff                     call       0x7f1e7f9d7d60
00dd4 0f1f8400cc0e0008               nop        dword ptr [rax + rax + 0x8000ecc]
00ddc be45ffffff                     mov        esi, 0xffffff45
00de1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00de9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00dee 44891424                       mov        dword ptr [rsp], r10d
00df2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00df7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00dfc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e01 4489542408                     mov        dword ptr [rsp + 8], r10d
00e06 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e0e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e13 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e18 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e1d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e22 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e27 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e2c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e31 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e36 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e3b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e40 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e45 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e4a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e4f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e54 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e59 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e5e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e63 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00e68 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00e6d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00e72 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00e77 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e7c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e81 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e86 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e8b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e90 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e95 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e9d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ea2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00eaa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00eaf e82c12b5ff                     call       0x7f1e7f9d7d60
00eb4 0f1f8400ac0f0009               nop        dword ptr [rax + rax + 0x9000fac]
00ebc be45ffffff                     mov        esi, 0xffffff45
00ec1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ec9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ece 44891c24                       mov        dword ptr [rsp], r11d
00ed2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ed7 4489542404                     mov        dword ptr [rsp + 4], r10d
00edc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ee1 44895c2408                     mov        dword ptr [rsp + 8], r11d
00ee6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00eee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ef3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ef8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00efd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f02 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f07 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f0c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f11 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f16 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f1b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f20 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f25 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f2a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f2f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f34 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f39 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f3e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f43 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00f48 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f4d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f52 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f57 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00f5c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00f61 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f66 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f6b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f70 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f75 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f7d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f82 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f8a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f8f 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
00f97 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
00f9c 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00fa4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00fac 666690                         nop        
00faf e82c11b5ff                     call       0x7f1e7f9d7d60
00fb4 0f1f8400ac10000a               nop        dword ptr [rax + rax + 0xa0010ac]
00fbc be45ffffff                     mov        esi, 0xffffff45
00fc1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fc9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00fce 44891424                       mov        dword ptr [rsp], r10d
00fd2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fd7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00fdc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fe1 4489542408                     mov        dword ptr [rsp + 8], r10d
00fe6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fee 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ff3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ff8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ffd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01002 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01007 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0100c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01011 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01016 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0101b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01020 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01025 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0102a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0102f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01034 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01039 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0103e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01043 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01048 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0104d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01052 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01057 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0105c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01061 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01066 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0106b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01070 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01075 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0107d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01082 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0108a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0108f 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
01097 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0109e 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
010a6 90                             nop        
010a7 e83410b5ff                     call       0x7f1e7f9d7d60
010ac 0f1f8400a411000b               nop        dword ptr [rax + rax + 0xb0011a4]
010b4 be45ffffff                     mov        esi, 0xffffff45
010b9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010c1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
010c6 44890c24                       mov        dword ptr [rsp], r9d
010ca 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010cf 44895c2404                     mov        dword ptr [rsp + 4], r11d
010d4 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
010d9 44894c2408                     mov        dword ptr [rsp + 8], r9d
010de 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
010e6 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
010eb 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
010f0 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
010f5 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
010fa 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
010ff 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01104 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01109 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0110e 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01113 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01118 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0111d 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01122 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01127 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0112c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01131 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01136 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0113b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01140 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01145 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0114a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0114f 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01154 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01159 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0115e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01163 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01168 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0116d 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01175 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0117a 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
01182 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
01187 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0118c 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01193 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0119b 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
011a3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
011ab 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
011b3 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
011bb 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
011c3 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
011cb 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
011d3 e8080fb5ff                     call       0x7f1e7f9d7d60
011d8 0f1f8400d012000c               nop        dword ptr [rax + rax + 0xc0012d0]
011e0 41bbffffff7f                   mov        r11d, 0x7fffffff
011e6 4d3bcb                         cmp        r9, r11
011e9 bdffffffff                     mov        ebp, 0xffffffff
011ee 7c08                           jl         0x7f1e7fe86e78
011f0 400f95c5                       setne      bpl
011f4 400fb6ed                       movzx      ebp, bpl
011f8 be45ffffff                     mov        esi, 0xffffff45
011fd 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01205 4c891c24                       mov        qword ptr [rsp], r11
01209 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0120e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01213 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0121b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01220 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01224 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01228 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0122d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01232 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01236 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0123a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0123f 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01244 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
01248 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0124c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01251 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01256 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
0125a 894c2440                       mov        dword ptr [rsp + 0x40], ecx
0125e 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01266 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0126b 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
0126f 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01273 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01278 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
0127d 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01281 894c2458                       mov        dword ptr [rsp + 0x58], ecx
01285 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0128a 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0128f 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01297 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
0129c 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012a4 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012a9 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012b1 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
012b8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012c0 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012c8 666690                         nop        
012cb e8100eb5ff                     call       0x7f1e7f9d7d60
012d0 0f1f8400c813000d               nop        dword ptr [rax + rax + 0xd0013c8]
012d8 be45ffffff                     mov        esi, 0xffffff45
012dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012e5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
012ea 44890c24                       mov        dword ptr [rsp], r9d
012ee 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
012f3 44894c2404                     mov        dword ptr [rsp + 4], r9d
012f8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
012fd 44894c2408                     mov        dword ptr [rsp + 8], r9d
01302 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0130a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0130f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01314 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01319 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0131e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01323 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01328 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0132d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01332 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01337 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0133c 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01341 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01346 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0134b 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01350 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01355 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0135a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0135f 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01364 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01369 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0136e 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01373 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01378 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0137d 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01382 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01387 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0138c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01391 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
01399 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0139e 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
013a6 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
013ab 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013b0 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013b8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
013c0 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
013c8 666690                         nop        
013cb e8100db5ff                     call       0x7f1e7f9d7d60
013d0 0f1f8400c814000e               nop        dword ptr [rax + rax + 0xe0014c8]
013d8 be45ffffff                     mov        esi, 0xffffff45
013dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013e5 448b542408                     mov        r10d, dword ptr [rsp + 8]
013ea 44891424                       mov        dword ptr [rsp], r10d
013ee 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013f3 4489542404                     mov        dword ptr [rsp + 4], r10d
013f8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013fd 4489542408                     mov        dword ptr [rsp + 8], r10d
01402 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0140a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0140f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01414 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01419 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0141e 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01423 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01428 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0142d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01432 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01437 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0143c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01441 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01446 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0144b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01450 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01455 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0145a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0145f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01464 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01469 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0146e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01473 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01478 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0147d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01482 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01487 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0148c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01491 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01499 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0149e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
014a6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
014ab 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014b0 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
014b7 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
014bf 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
014c7 e8140cb5ff                     call       0x7f1e7f9d7d60
014cc 0f1f8400c415000f               nop        dword ptr [rax + rax + 0xf0015c4]
014d4 be3dffffff                     mov        esi, 0xffffff3d
014d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014e1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
014e6 44890c24                       mov        dword ptr [rsp], r9d
014ea 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
014ef 44894c2404                     mov        dword ptr [rsp + 4], r9d
014f4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
014f9 44895c2408                     mov        dword ptr [rsp + 8], r11d
014fe 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01506 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0150b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01510 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01515 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0151a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0151f 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01524 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01529 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0152e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01533 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01538 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0153d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01542 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01547 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0154c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01551 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01556 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0155b 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01560 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01565 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0156d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01572 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01577 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0157c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01581 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01586 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0158b 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01590 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01595 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0159a 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
015a2 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
015a7 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
015af 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
015b4 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
015b9 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
015c1 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
015c8 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
015cf 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
015d7 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
015df 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
015e7 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
015ef 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
015f7 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
015ff 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
01607 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0160f e8cc0ab5ff                     call       0x7f1e7f9d7d60
01614 0f1f84000c170010               nop        dword ptr [rax + rax + 0x1000170c]
0161c be45ffffff                     mov        esi, 0xffffff45
01621 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01629 448b542408                     mov        r10d, dword ptr [rsp + 8]
0162e 44891424                       mov        dword ptr [rsp], r10d
01632 44894c2408                     mov        dword ptr [rsp + 8], r9d
01637 e8a40ab5ff                     call       0x7f1e7f9d7d60
0163c 0f1f840034170011               nop        dword ptr [rax + rax + 0x11001734]
01644 be45ffffff                     mov        esi, 0xffffff45
01649 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01651 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01656 44891c24                       mov        dword ptr [rsp], r11d
0165a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0165f 44895c2404                     mov        dword ptr [rsp + 4], r11d
01664 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01669 4489542408                     mov        dword ptr [rsp + 8], r10d
0166e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01673 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01678 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0167d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01682 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01687 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0168c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01691 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01696 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0169b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
016a0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
016a5 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016aa 894c2430                       mov        dword ptr [rsp + 0x30], ecx
016ae 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
016b3 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
016b8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
016bd 4489542444                     mov        dword ptr [rsp + 0x44], r10d
016c2 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
016c7 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
016cc 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
016d4 4c89542450                     mov        qword ptr [rsp + 0x50], r10
016d9 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
016de 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
016e3 895c2464                       mov        dword ptr [rsp + 0x64], ebx
016e7 e8f409b5ff                     call       0x7f1e7f9d7d60
016ec 0f1f8400e4170012               nop        dword ptr [rax + rax + 0x120017e4]
016f4 be45ffffff                     mov        esi, 0xffffff45
016f9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01701 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01706 44890c24                       mov        dword ptr [rsp], r9d
0170a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0170f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01714 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01719 44894c2408                     mov        dword ptr [rsp + 8], r9d
0171e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01723 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01728 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0172d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01732 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01737 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0173c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01741 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01746 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0174b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01750 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01755 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0175a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0175e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01763 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01768 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0176d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01772 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01777 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0177c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01781 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01786 4489542454                     mov        dword ptr [rsp + 0x54], r10d
0178b 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01790 666690                         nop        
01793 e84809b5ff                     call       0x7f1e7f9d7d60
01798 0f1f840090180013               nop        dword ptr [rax + rax + 0x13001890]
017a0 be45ffffff                     mov        esi, 0xffffff45
017a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017ad 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
017b2 44891c24                       mov        dword ptr [rsp], r11d
017b6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
017bb 4489542404                     mov        dword ptr [rsp + 4], r10d
017c0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017c5 4489542408                     mov        dword ptr [rsp + 8], r10d
017ca 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
017d2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
017d7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017dc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017e1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
017e6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017eb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017f0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017f5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
017fa 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017ff 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01804 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01809 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0180e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01813 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01818 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0181d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01822 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01827 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0182c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01831 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01836 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0183b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01840 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01845 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0184a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0184f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01854 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01859 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01861 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01866 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0186e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01873 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
0187b 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
01883 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0188b 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
01893 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
0189b 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
018a3 e83808b5ff                     call       0x7f1e7f9d7d60
018a8 0f1f8400a0190014               nop        dword ptr [rax + rax + 0x140019a0]
018b0 be45ffffff                     mov        esi, 0xffffff45
018b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018bd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
018c2 44891c24                       mov        dword ptr [rsp], r11d
018c6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
018cb 4489542404                     mov        dword ptr [rsp + 4], r10d
018d0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018d5 4489542408                     mov        dword ptr [rsp + 8], r10d
018da 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018e4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018e9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018ee 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018f3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
018f8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
018fd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01902 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01907 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0190c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01911 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01916 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0191b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01920 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01925 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0192a 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0192f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01934 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01939 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0193e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01943 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01948 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0194d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01952 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01957 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0195c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01964 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01969 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01971 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01976 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
0197e 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01986 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0198d 6690                           nop        
0198f e84c07b5ff                     call       0x7f1e7f9d7d60
01994 0f1f84008c1a0015               nop        dword ptr [rax + rax + 0x15001a8c]
0199c 4585c9                         test       r9d, r9d
0199f 7f08                           jg         0x7f1e7fe87629
019a1 4533ed                         xor        r13d, r13d
019a4 e920e7ffff                     jmp        0x7f1e7fe85d49
019a9 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019ad 89742428                       mov        dword ptr [rsp + 0x28], esi
019b1 897c241c                       mov        dword ptr [rsp + 0x1c], edi
019b5 894c2418                       mov        dword ptr [rsp + 0x18], ecx
019b9 4489442414                     mov        dword ptr [rsp + 0x14], r8d
019be 4489542410                     mov        dword ptr [rsp + 0x10], r10d
019c3 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
019c8 48894424f8                     mov        qword ptr [rsp - 8], rax
019cd 8b0424                         mov        eax, dword ptr [rsp]
019d0 89442404                       mov        dword ptr [rsp + 4], eax
019d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d9 48894424f8                     mov        qword ptr [rsp - 8], rax
019de 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019e5 890424                         mov        dword ptr [rsp], eax
019e8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019ed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019f5 488bf5                         mov        rsi, rbp
019f8 8b542408                       mov        edx, dword ptr [rsp + 8]
019fc 418bc9                         mov        ecx, r9d
019ff e8dc91a8ff                     call       0x7f1e7f910860
01a04 0f1f8400fc1a0016               nop        dword ptr [rax + rax + 0x16001afc]
01a0c 41ba40000000                   mov        r10d, 0x40
01a12 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01a17 c462a9f7e8                     shlx       r13, rax, r10
01a1c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a21 8b442404                       mov        eax, dword ptr [rsp + 4]
01a25 890424                         mov        dword ptr [rsp], eax
01a28 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a2d 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
01a32 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a37 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01a3c 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01a40 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01a44 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01a48 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a4c e978e6ffff                     jmp        0x7f1e7fe85d49
01a51 4585c9                         test       r9d, r9d
01a54 7f08                           jg         0x7f1e7fe876de
01a56 4533f6                         xor        r14d, r14d
01a59 e9ade6ffff                     jmp        0x7f1e7fe85d8b
01a5e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a63 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01a68 89542428                       mov        dword ptr [rsp + 0x28], edx
01a6c 8974241c                       mov        dword ptr [rsp + 0x1c], esi
01a70 897c2418                       mov        dword ptr [rsp + 0x18], edi
01a74 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01a78 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01a7d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01a82 48894424f8                     mov        qword ptr [rsp - 8], rax
01a87 8b0424                         mov        eax, dword ptr [rsp]
01a8a 89442404                       mov        dword ptr [rsp + 4], eax
01a8e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a93 48894424f8                     mov        qword ptr [rsp - 8], rax
01a98 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a9f 890424                         mov        dword ptr [rsp], eax
01aa2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aa7 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01aaf 488bf5                         mov        rsi, rbp
01ab2 8b542408                       mov        edx, dword ptr [rsp + 8]
01ab6 418bc9                         mov        ecx, r9d
01ab9 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01abe 90                             nop        
01abf e81c91a8ff                     call       0x7f1e7f910860
01ac4 0f1f8400bc1b0017               nop        dword ptr [rax + rax + 0x17001bbc]
01acc 41bb80000000                   mov        r11d, 0x80
01ad2 442b5c2414                     sub        r11d, dword ptr [rsp + 0x14]
01ad7 c462a1f7f0                     shlx       r14, rax, r11
01adc 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae1 8b442404                       mov        eax, dword ptr [rsp + 4]
01ae5 890424                         mov        dword ptr [rsp], eax
01ae8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01aed 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01af2 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01af7 8b7c2418                       mov        edi, dword ptr [rsp + 0x18]
01afb 8b74241c                       mov        esi, dword ptr [rsp + 0x1c]
01aff 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01b03 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01b08 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01b0d e9f9e5ffff                     jmp        0x7f1e7fe85d8b
01b12 4533c0                         xor        r8d, r8d
01b15 e9c0eeffff                     jmp        0x7f1e7fe8665a
01b1a bee4ffffff                     mov        esi, 0xffffffe4
01b1f 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b27 488f0424                       pop        qword ptr [rsp]
01b2b e8b005b5ff                     call       0x7f1e7f9d7d60
01b30 0f1f8400281c0018               nop        dword ptr [rax + rax + 0x18001c28]
01b38 be5d000000                     mov        esi, 0x5d
01b3d 6690                           nop        
01b3f e89c05b5ff                     call       0x7f1e7f9d7d60
01b44 0f1f84003c1c0019               nop        dword ptr [rax + rax + 0x19001c3c]
01b4c bef6ffffff                     mov        esi, 0xfffffff6
01b51 6690                           nop        
01b53 e88805b5ff                     call       0x7f1e7f9d7d60
01b58 0f1f8400501c001a               nop        dword ptr [rax + rax + 0x1a001c50]
01b60 bef6ffffff                     mov        esi, 0xfffffff6
01b65 6690                           nop        
01b67 e87405b5ff                     call       0x7f1e7f9d7d60
01b6c 0f1f8400641c001b               nop        dword ptr [rax + rax + 0x1b001c64]
01b74 be6effffff                     mov        esi, 0xffffff6e
01b79 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b81 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b86 44891c24                       mov        dword ptr [rsp], r11d
01b8a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b8f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b94 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b99 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b9e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01ba3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ba8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bad 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bb2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01bb7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01bbc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01bc1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01bc6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01bcb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01bd0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bd5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bda 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01bdf 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01be4 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01be8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01bed 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01bf2 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01bf7 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01bfc 666690                         nop        
01bff e8dc04b5ff                     call       0x7f1e7f9d7d60
01c04 0f1f8400fc1c001c               nop        dword ptr [rax + rax + 0x1c001cfc]
01c0c bee4ffffff                     mov        esi, 0xffffffe4
01c11 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c19 488f0424                       pop        qword ptr [rsp]
01c1d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01c22 48894424f8                     mov        qword ptr [rsp - 8], rax
01c27 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c2e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01c32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c37 897c2430                       mov        dword ptr [rsp + 0x30], edi
01c3b 89542434                       mov        dword ptr [rsp + 0x34], edx
01c3f e89c04b5ff                     call       0x7f1e7f9d7d60
01c44 0f1f84003c1d001d               nop        dword ptr [rax + rax + 0x1d001d3c]
01c4c bee4ffffff                     mov        esi, 0xffffffe4
01c51 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c59 488f0424                       pop        qword ptr [rsp]
01c5d 48894424f8                     mov        qword ptr [rsp - 8], rax
01c62 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c69 89442418                       mov        dword ptr [rsp + 0x18], eax
01c6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c72 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01c76 89542430                       mov        dword ptr [rsp + 0x30], edx
01c7a 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01c7f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01c84 666690                         nop        
01c87 e85404b5ff                     call       0x7f1e7f9d7d60
01c8c 0f1f8400841d001e               nop        dword ptr [rax + rax + 0x1e001d84]
01c94 bebeffffff                     mov        esi, 0xffffffbe
01c99 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ca1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ca6 44891c24                       mov        dword ptr [rsp], r11d
01caa 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01caf 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cb4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cb9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cbe 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01cc3 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01cc8 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ccd 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01cd2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01cd7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01cdc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ce1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ce6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ceb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01cf0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01cf5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cfa 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01cff 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d04 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01d08 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01d0d 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
01d12 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01d17 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01d1c 666690                         nop        
01d1f e8bc03b5ff                     call       0x7f1e7f9d7d60
01d24 0f1f84001c1e001f               nop        dword ptr [rax + rax + 0x1f001e1c]
01d2c beccffffff                     mov        esi, 0xffffffcc
01d31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d3e 44891c24                       mov        dword ptr [rsp], r11d
01d42 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01d47 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d53 89442414                       mov        dword ptr [rsp + 0x14], eax
01d57 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01d61 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01d66 897c2428                       mov        dword ptr [rsp + 0x28], edi
01d6a 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01d6e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01d73 e86803b5ff                     call       0x7f1e7f9d7d60
01d78 0f1f8400701e0020               nop        dword ptr [rax + rax + 0x20001e70]
01d80 beccffffff                     mov        esi, 0xffffffcc
01d85 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d8d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01d92 44890c24                       mov        dword ptr [rsp], r9d
01d96 48894424f8                     mov        qword ptr [rsp - 8], rax
01d9b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01da2 89442410                       mov        dword ptr [rsp + 0x10], eax
01da6 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01dab 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01db0 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01db5 897c2414                       mov        dword ptr [rsp + 0x14], edi
01db9 89542428                       mov        dword ptr [rsp + 0x28], edx
01dbd 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01dc2 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01dc7 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01dcc 666690                         nop        
01dcf e80c03b5ff                     call       0x7f1e7f9d7d60
01dd4 0f1f8400cc1e0021               nop        dword ptr [rax + rax + 0x21001ecc]
01ddc be45ffffff                     mov        esi, 0xffffff45
01de1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01de9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01dee 44891424                       mov        dword ptr [rsp], r10d
01df2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01df7 4489442404                     mov        dword ptr [rsp + 4], r8d
01dfc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e01 4489542408                     mov        dword ptr [rsp + 8], r10d
01e06 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e0b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e10 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01e15 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01e1a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01e1f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01e24 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01e29 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01e2e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01e33 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01e38 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01e3d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01e42 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
01e47 e89402b5ff                     call       0x7f1e7f9d7d60
01e4c 0f1f8400441f0022               nop        dword ptr [rax + rax + 0x22001f44]
01e54 be45ffffff                     mov        esi, 0xffffff45
01e59 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e61 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e66 44891c24                       mov        dword ptr [rsp], r11d
01e6a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01e6f 4489542404                     mov        dword ptr [rsp + 4], r10d
01e74 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e79 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e7e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e83 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e88 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e8d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e92 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e97 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e9c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ea1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ea6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01eab 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01eb0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01eb5 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01eba 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ebf 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ec4 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01ec9 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01ece 90                             nop        
01ecf e80c02b5ff                     call       0x7f1e7f9d7d60
01ed4 0f1f8400cc1f0023               nop        dword ptr [rax + rax + 0x23001fcc]
01edc bef6ffffff                     mov        esi, 0xfffffff6
01ee1 6690                           nop        
01ee3 e8f801b5ff                     call       0x7f1e7f9d7d60
01ee8 0f1f8400e01f0024               nop        dword ptr [rax + rax + 0x24001fe0]
01ef0 be5d000000                     mov        esi, 0x5d
01ef5 6690                           nop        
01ef7 e8e401b5ff                     call       0x7f1e7f9d7d60
01efc 0f1f8400f41f0025               nop        dword ptr [rax + rax + 0x25001ff4]
01f04 be45ffffff                     mov        esi, 0xffffff45
01f09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f11 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f16 44891c24                       mov        dword ptr [rsp], r11d
01f1a 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
01f1f 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01f23 89442418                       mov        dword ptr [rsp + 0x18], eax
01f27 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01f2f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01f34 4c89442450                     mov        qword ptr [rsp + 0x50], r8
01f39 6690                           nop        
01f3b e8a001b5ff                     call       0x7f1e7f9d7d60
01f40 0f1f840038200026               nop        dword ptr [rax + rax + 0x26002038]
01f48 bef6ffffff                     mov        esi, 0xfffffff6
01f4d 418be8                         mov        ebp, r8d
01f50 666690                         nop        
01f53 e88801b5ff                     call       0x7f1e7f9d7d60
01f58 0f1f840050200027               nop        dword ptr [rax + rax + 0x27002050]
01f60 bef6ffffff                     mov        esi, 0xfffffff6
01f65 418bea                         mov        ebp, r10d
01f68 666690                         nop        
01f6b e87001b5ff                     call       0x7f1e7f9d7d60
01f70 0f1f840068200028               nop        dword ptr [rax + rax + 0x28002068]
01f78 bef6ffffff                     mov        esi, 0xfffffff6
01f7d 418beb                         mov        ebp, r11d
01f80 666690                         nop        
01f83 e85801b5ff                     call       0x7f1e7f9d7d60
01f88 0f1f840080200029               nop        dword ptr [rax + rax + 0x29002080]
01f90 bef6ffffff                     mov        esi, 0xfffffff6
01f95 6690                           nop        
01f97 e84401b5ff                     call       0x7f1e7f9d7d60
01f9c 0f1f84009420002a               nop        dword ptr [rax + rax + 0x2a002094]
01fa4 bef6ffffff                     mov        esi, 0xfffffff6
01fa9 6690                           nop        
01fab e83001b5ff                     call       0x7f1e7f9d7d60
01fb0 0f1f8400a820002b               nop        dword ptr [rax + rax + 0x2b0020a8]
01fb8 bef6ffffff                     mov        esi, 0xfffffff6
01fbd 6690                           nop        
01fbf e81c01b5ff                     call       0x7f1e7f9d7d60
01fc4 0f1f8400bc20002c               nop        dword ptr [rax + rax + 0x2c0020bc]
01fcc bef6ffffff                     mov        esi, 0xfffffff6
01fd1 6690                           nop        
01fd3 e80801b5ff                     call       0x7f1e7f9d7d60
01fd8 0f1f8400d020002d               nop        dword ptr [rax + rax + 0x2d0020d0]
01fe0 bef6ffffff                     mov        esi, 0xfffffff6
01fe5 6690                           nop        
01fe7 e8f400b5ff                     call       0x7f1e7f9d7d60
01fec 0f1f8400e420002e               nop        dword ptr [rax + rax + 0x2e0020e4]
01ff4 bef6ffffff                     mov        esi, 0xfffffff6
01ff9 6690                           nop        
01ffb e8e000b5ff                     call       0x7f1e7f9d7d60
02000 0f1f8400f820002f               nop        dword ptr [rax + rax + 0x2f0020f8]
02008 bef6ffffff                     mov        esi, 0xfffffff6
0200d 6690                           nop        
0200f e8cc00b5ff                     call       0x7f1e7f9d7d60
02014 0f1f84000c210030               nop        dword ptr [rax + rax + 0x3000210c]
0201c eb08                           jmp        0x7f1e7fe87ca6
0201e eb06                           jmp        0x7f1e7fe87ca6
02020 eb04                           jmp        0x7f1e7fe87ca6
02022 eb02                           jmp        0x7f1e7fe87ca6
02024 eb00                           jmp        0x7f1e7fe87ca6
02026 488bf0                         mov        rsi, rax
02029 e912eaffff                     jmp        0x7f1e7fe866c0
0202e 49ba9066e87f1e7f0000           movabs     r10, 0x7f1e7fe86690
02038 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0203f e91cb2a8ff                     jmp        0x7f1e7f912ee0
02044 e8d77da7ff                     call       0x7f1e7f8ffaa0
02049 e9d0dfffff                     jmp        0x7f1e7fe85c9e
0204e f4                             hlt        
0204f f4                             hlt        
