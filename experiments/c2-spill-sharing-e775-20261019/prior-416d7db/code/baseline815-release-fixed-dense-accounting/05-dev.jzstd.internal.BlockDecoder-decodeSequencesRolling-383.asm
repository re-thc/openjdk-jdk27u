00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8532210000                   jne        0x7fd1c3e74c50
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5608                       mov        r10d, dword ptr [rsi + 8]
00049 44891424                       mov        dword ptr [rsp], r10d
0004d 413bea                         cmp        ebp, r10d
00050 0f83d01b0000                   jae        0x7fd1c3e74726
00056 440fb65c160b                   movzx      r11d, byte ptr [rsi + rdx + 0xb]
0005c 4585db                         test       r11d, r11d
0005f 0f84df1b0000                   je         0x7fd1c3e74744
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
0009b 0f8c071a0000                   jl         0x7fd1c3e745a8
000a1 4585d2                         test       r10d, r10d
000a4 0f8c8e1d0000                   jl         0x7fd1c3e74938
000aa 8b2c24                         mov        ebp, dword ptr [rsp]
000ad 83c5f9                         add        ebp, -7
000b0 443bc5                         cmp        r8d, ebp
000b3 0f835f1c0000                   jae        0x7fd1c3e74818
000b9 418bd8                         mov        ebx, r8d
000bc 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
000c4 4d8b6c1b0c                     mov        r13, qword ptr [r11 + rbx + 0xc]
000c9 4183c1f8                       add        r9d, -8
000cd 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
000d5 4183c3f0                       add        r11d, -0x10
000d9 4183f908                       cmp        r9d, 8
000dd 0f8c7a1a0000                   jl         0x7fd1c3e7465d
000e3 4585d2                         test       r10d, r10d
000e6 0f8ca01d0000                   jl         0x7fd1c3e7498c
000ec 8b2c24                         mov        ebp, dword ptr [rsp]
000ef 83c5f9                         add        ebp, -7
000f2 443bdd                         cmp        r11d, ebp
000f5 0f835d1c0000                   jae        0x7fd1c3e74858
000fb 458bcb                         mov        r9d, r11d
000fe 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00106 4e8b74090c                     mov        r14, qword ptr [rcx + r9 + 0xc]
0010b 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00110 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00114 4585c9                         test       r9d, r9d
00117 0f843b1b0000                   je         0x7fd1c3e74758
0011d 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00120 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00123 8b4524                         mov        eax, dword ptr [rbp + 0x24]
00126 85c0                           test       eax, eax
00128 0f843e1b0000                   je         0x7fd1c3e7476c
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
00193 0f84e4080000                   je         0x7fd1c3e7357d
00199 be40000000                     mov        esi, 0x40
0019e 2bf7                           sub        esi, edi
001a0 3bce                           cmp        ecx, esi
001a2 0f8feb010000                   jg         0x7fd1c3e72e93
001a8 2bf1                           sub        esi, ecx
001aa c442cbf7c5                     shrx       r8, r13, rsi
001af 83f940                         cmp        ecx, 0x40
001b2 0f8d581e0000                   jge        0x7fd1c3e74b10
001b8 41ba01000000                   mov        r10d, 1
001be c4c2f1f7ea                     shlx       rbp, r10, rcx
001c3 48ffcd                         dec        rbp
001c6 4923e8                         and        rbp, r8
001c9 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001ce 448bd1                         mov        r10d, ecx
001d1 458bda                         mov        r11d, r10d
001d4 442b5c240c                     sub        r11d, dword ptr [rsp + 0xc]
001d9 458d4308                       lea        r8d, [r11 + 8]
001dd 4183f840                       cmp        r8d, 0x40
001e1 7c34                           jl         0x7fd1c3e72d17
001e3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001e8 4183c3c8                       add        r11d, -0x38
001ec 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
001f1 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f9 8b542408                       mov        edx, dword ptr [rsp + 8]
001fd 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00201 6690                           nop        
00203 e858dba9ff                     call       0x7fd1c3910860
00208 0f1f840000030000               nop        dword ptr [rax + rax + 0x300]
00210 4889442420                     mov        qword ptr [rsp + 0x20], rax
00215 eb31                           jmp        0x7fd1c3e72d48
00217 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0021c 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00224 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00229 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0022e 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00236 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0023e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00243 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00248 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0024d 458b4308                       mov        r8d, dword ptr [r11 + 8]
00251 4183f820                       cmp        r8d, 0x20
00255 0f8d8d1c0000                   jge        0x7fd1c3e749e8
0025b c462bbf74c2460                 shrx       r9, qword ptr [rsp + 0x60], r8
00262 41ba01000000                   mov        r10d, 1
00268 c44239f7d2                     shlx       r10d, r10d, r8d
0026d 41ffca                         dec        r10d
00270 4d63d2                         movsxd     r10, r10d
00273 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00278 458bda                         mov        r11d, r10d
0027b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00280 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00285 458b4308                       mov        r8d, dword ptr [r11 + 8]
00289 4183f820                       cmp        r8d, 0x20
0028d 0f8dcd1c0000                   jge        0x7fd1c3e74a60
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
002d1 0f8e47190000                   jle        0x7fd1c3e7471e
002d7 ffcb                           dec        ebx
002d9 895c2460                       mov        dword ptr [rsp + 0x60], ebx
002dd ffc9                           dec        ecx
002df 894c2464                       mov        dword ptr [rsp + 0x64], ecx
002e3 41ffca                         dec        r10d
002e6 4489542468                     mov        dword ptr [rsp + 0x68], r10d
002eb c442bbf7d1                     shrx       r10, r9, r8
002f0 b901000000                     mov        ecx, 1
002f5 c46239f7c1                     shlx       r8d, ecx, r8d
002fa 458bda                         mov        r11d, r10d
002fd 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00302 41ffc8                         dec        r8d
00305 4d63d0                         movsxd     r10, r8d
00308 4d23d1                         and        r10, r9
0030b 458bd2                         mov        r10d, r10d
0030e 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00313 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0031b 458b9af8000000                 mov        r11d, dword ptr [r10 + 0xf8]
00322 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0032a 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
00331 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00339 458b5208                       mov        r10d, dword ptr [r10 + 8]
0033d 4585d2                         test       r10d, r10d
00340 0f863a190000                   jbe        0x7fd1c3e74780
00346 4d63d2                         movsxd     r10, r10d
00349 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0034e 49ffcb                         dec        r11
00351 4d3bda                         cmp        r11, r10
00354 0f8326190000                   jae        0x7fd1c3e74780
0035a 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
0035f 4585db                         test       r11d, r11d
00362 0f8c381a0000                   jl         0x7fd1c3e748a0
00368 448b1424                       mov        r10d, dword ptr [rsp]
0036c 4183c2f9                       add        r10d, -7
00370 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00378 4533d2                         xor        r10d, r10d
0037b 4533db                         xor        r11d, r11d
0037e 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00386 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0038e e98c020000                     jmp        0x7fd1c3e7311f
00393 8be9                           mov        ebp, ecx
00395 2bee                           sub        ebp, esi
00397 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
0039f 4489542418                     mov        dword ptr [rsp + 0x18], r10d
003a4 666690                         nop        
003a7 e8b4d9a9ff                     call       0x7fd1c3910860
003ac 0f1f8400a4040001               nop        dword ptr [rax + rax + 0x10004a4]
003b4 4823442428                     and        rax, qword ptr [rsp + 0x28]
003b9 41bb40000000                   mov        r11d, 0x40
003bf 442bdd                         sub        r11d, ebp
003c2 c462d1f7c0                     shlx       r8, rax, rbp
003c7 c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003d1 4d0bc2                         or         r8, r10
003d4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003d9 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003de e9eefdffff                     jmp        0x7fd1c3e72cd1
003e3 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003eb 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
003f0 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f5 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
003fd 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00402 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
00406 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040a 660f1f440000                   nop        word ptr [rax + rax]
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8df00a0000                   jge        0x7fd1c3e73a10
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d9d0b0000                   jge        0x7fd1c3e73af0
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bca                         mov        ecx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8d770c0000                   jge        0x7fd1c3e73bf0
00479 c4e2d3f7df                     shrx       rbx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8d460d0000                   jge        0x7fd1c3e73ce8
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
004f2 0f8ee4070000                   jle        0x7fd1c3e737dc
004f8 4981f9ffffff7f                 cmp        r9, 0x7fffffff
004ff 0f8f0f0e0000                   jg         0x7fd1c3e73e14
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8ff60e0000                   jg         0x7fd1c3e73f08
00512 81fbffff0300                   cmp        ebx, 0x3ffff
00518 0f8fea0f0000                   jg         0x7fd1c3e74008
0051e 418bc9                         mov        ecx, r9d
00521 81f900000010                   cmp        ecx, 0x10000000
00527 0f83d7100000                   jae        0x7fd1c3e74104
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
0055e 0f8daa000000                   jge        0x7fd1c3e7310e
00564 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0056c 49c1ea30                       shr        r10, 0x30
00570 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00575 49c1eb30                       shr        r11, 0x30
00579 458bca                         mov        r9d, r10d
0057c 418bcb                         mov        ecx, r11d
0057f 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00587 c4c223f7d8                     shrx       ebx, r8d, r11d
0058c 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00594 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
0059c c4422bf7d0                     shrx       r10d, r8d, r10d
005a1 4103ca                         add        ecx, r10d
005a4 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
005a8 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005b0 4183fa20                       cmp        r10d, 0x20
005b4 0f8d92110000                   jge        0x7fd1c3e7424c
005ba 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005c2 49c1ea30                       shr        r10, 0x30
005c6 458bd2                         mov        r10d, r10d
005c9 b901000000                     mov        ecx, 1
005ce 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005d6 c46221f7d9                     shlx       r11d, ecx, r11d
005db 41ffcb                         dec        r11d
005de 4423db                         and        r11d, ebx
005e1 4503d9                         add        r11d, r9d
005e4 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
005e9 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
005f1 4183f920                       cmp        r9d, 0x20
005f5 0f8d01120000                   jge        0x7fd1c3e742fc
005fb c46231f7d9                     shlx       r11d, ecx, r9d
00600 41ffcb                         dec        r11d
00603 4523d8                         and        r11d, r8d
00606 4503da                         add        r11d, r10d
00609 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8de9030000                   jge        0x7fd1c3e73501
00618 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0061f 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00624 44234c246c                     and        r9d, dword ptr [rsp + 0x6c]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 458b4318                       mov        r8d, dword ptr [r11 + 0x18]
00632 458b5008                       mov        r10d, dword ptr [r8 + 8]
00636 453bca                         cmp        r9d, r10d
00639 0f834e040000                   jae        0x7fd1c3e7358d
0063f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00644 4423542470                     and        r10d, dword ptr [rsp + 0x70]
00649 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0064e 418b4b18                       mov        ecx, dword ptr [r11 + 0x18]
00652 8b5908                         mov        ebx, dword ptr [rcx + 8]
00655 4f8b5cc810                     mov        r11, qword ptr [r8 + r9*8 + 0x10]
0065a 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
0065f 443bd3                         cmp        r10d, ebx
00662 0f83e0040000                   jae        0x7fd1c3e73648
00668 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0066d 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
00672 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00677 458b4918                       mov        r9d, dword ptr [r9 + 0x18]
0067b 458b4108                       mov        r8d, dword ptr [r9 + 8]
0067f 4e8b54d110                     mov        r10, qword ptr [rcx + r10*8 + 0x10]
00684 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0068c 453bd8                         cmp        r11d, r8d
0068f 0f8377050000                   jae        0x7fd1c3e7370c
00695 4f8b54d910                     mov        r10, qword ptr [r9 + r11*8 + 0x10]
0069a 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a2 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006a9 ffc5                           inc        ebp
006ab 896c2404                       mov        dword ptr [rsp + 4], ebp
006af 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b3 0f8d19030000                   jge        0x7fd1c3e734d2
006b9 49c1ea28                       shr        r10, 0x28
006bd 458bd2                         mov        r10d, r10d
006c0 450fb6da                       movzx      r11d, r10b
006c4 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006cc 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006d1 49c1ea28                       shr        r10, 0x28
006d5 458bda                         mov        r11d, r10d
006d8 410fb6eb                       movzx      ebp, r11b
006dc 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006e3 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006eb 49c1ea28                       shr        r10, 0x28
006ef 458bda                         mov        r11d, r10d
006f2 450fb6d3                       movzx      r10d, r11b
006f6 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
006fe 4103ea                         add        ebp, r10d
00701 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00708 41ba01000000                   mov        r10d, 1
0070e 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
00716 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0071e 49c1ea20                       shr        r10, 0x20
00722 458bd2                         mov        r10d, r10d
00725 410fb6ea                       movzx      ebp, r10b
00729 896c2474                       mov        dword ptr [rsp + 0x74], ebp
0072d 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00732 49c1ea20                       shr        r10, 0x20
00736 458bda                         mov        r11d, r10d
00739 410fb6eb                       movzx      ebp, r11b
0073d 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00744 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0074c 49c1ea20                       shr        r10, 0x20
00750 458bd2                         mov        r10d, r10d
00753 410fb6ea                       movzx      ebp, r10b
00757 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0075e 448bcd                         mov        r9d, ebp
00761 44034c2474                     add        r9d, dword ptr [rsp + 0x74]
00766 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
0076e 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
00776 4585c9                         test       r9d, r9d
00779 0f8451060000                   je         0x7fd1c3e738d0
0077f 4183f93f                       cmp        r9d, 0x3f
00783 0f8f5f070000                   jg         0x7fd1c3e739e8
00789 41b840000000                   mov        r8d, 0x40
0078f 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
00794 453bc8                         cmp        r9d, r8d
00797 7e48                           jle        0x7fd1c3e732e1
00799 418bd9                         mov        ebx, r9d
0079c 412bd8                         sub        ebx, r8d
0079f 4183f840                       cmp        r8d, 0x40
007a3 0f8d13120000                   jge        0x7fd1c3e744bc
007a9 41ba01000000                   mov        r10d, 1
007af c442b9f7d2                     shlx       r10, r10, r8
007b4 49ffca                         dec        r10
007b7 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007bf c4c2e1f7ea                     shlx       rbp, r10, rbx
007c4 41ba40000000                   mov        r10d, 0x40
007ca 442bd3                         sub        r10d, ebx
007cd c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
007d4 490bea                         or         rbp, r10
007d7 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007df eb30                           jmp        0x7fd1c3e73311
007e1 452bc1                         sub        r8d, r9d
007e4 c462bbf7842498000000           shrx       r8, qword ptr [rsp + 0x98], r8
007ee 4183f940                       cmp        r9d, 0x40
007f2 0f8db4100000                   jge        0x7fd1c3e743ac
007f8 41ba01000000                   mov        r10d, 1
007fe c4c2b1f7ea                     shlx       rbp, r10, r9
00803 48ffcd                         dec        rbp
00806 4923e8                         and        rbp, r8
00809 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00811 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00816 4503d9                         add        r11d, r9d
00819 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0081e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00823 4503d1                         add        r10d, r9d
00826 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0082b 4183fb40                       cmp        r11d, 0x40
0082f 0f8cdbfbffff                   jl         0x7fd1c3e72f10
00835 4183c3c0                       add        r11d, -0x40
00839 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0083e 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00842 83c5f8                         add        ebp, -8
00845 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00849 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084d 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00851 83c1f0                         add        ecx, -0x10
00854 83f908                         cmp        ecx, 8
00857 0f8c1f010000                   jl         0x7fd1c3e7347c
0085d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00862 4183c2e8                       add        r10d, -0x18
00866 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0086e 0f826ffbffff                   jb         0x7fd1c3e72ee3
00874 bee4ffffff                     mov        esi, 0xffffffe4
00879 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00881 448b442408                     mov        r8d, dword ptr [rsp + 8]
00886 44890424                       mov        dword ptr [rsp], r8d
0088a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0088f 4489442404                     mov        dword ptr [rsp + 4], r8d
00894 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
00899 4489442408                     mov        dword ptr [rsp + 8], r8d
0089e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008a3 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008a8 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008ad 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008b2 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
008b7 4489442418                     mov        dword ptr [rsp + 0x18], r8d
008bc 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
008c1 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
008c6 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008cb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008d0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008d5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008da 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008df 4489442428                     mov        dword ptr [rsp + 0x28], r8d
008e4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008e9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008ee 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
008f3 4489442430                     mov        dword ptr [rsp + 0x30], r8d
008f8 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
008fd 4489442440                     mov        dword ptr [rsp + 0x40], r8d
00902 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00907 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0090c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00911 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00916 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0091b 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
00920 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00928 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
0092d 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00935 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
0093a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0093f 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00944 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0094c 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00954 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0095c 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00964 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
0096c 666690                         nop        
0096f e8ec02adff                     call       0x7fd1c3943760
00974 0f1f84006c0a0002               nop        dword ptr [rax + rax + 0x2000a6c]
0097c 85c9                           test       ecx, ecx
0097e 7f08                           jg         0x7fd1c3e73488
00980 4533d2                         xor        r10d, r10d
00983 e968faffff                     jmp        0x7fd1c3e72ef0
00988 890c24                         mov        dword ptr [rsp], ecx
0098b 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00993 8b542408                       mov        edx, dword ptr [rsp + 8]
00997 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
0099e 90                             nop        
0099f e8bcd3a9ff                     call       0x7fd1c3910860
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 448b542408                     mov        r10d, dword ptr [rsp + 8]
009b1 41c1e203                       shl        r10d, 3
009b5 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009ba 41c1e303                       shl        r11d, 3
009be 452bd3                         sub        r10d, r11d
009c1 4181c2c0000000                 add        r10d, 0xc0
009c8 c462a9f7d0                     shlx       r10, rax, r10
009cd e91efaffff                     jmp        0x7fd1c3e72ef0
009d2 4533d2                         xor        r10d, r10d
009d5 4533c0                         xor        r8d, r8d
009d8 4533db                         xor        r11d, r11d
009db 33c9                           xor        ecx, ecx
009dd 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009e5 44898424d0000000               mov        dword ptr [rsp + 0xd0], r8d
009ed 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
009f5 898c24f0000000                 mov        dword ptr [rsp + 0xf0], ecx
009fc e915fdffff                     jmp        0x7fd1c3e73216
00a01 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a09 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a11 4d03c2                         add        r8, r10
00a14 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a1c 4d3bc2                         cmp        r8, r10
00a1f 7f29                           jg         0x7fd1c3e7354a
00a21 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a26 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a2e 0f85c8150000                   jne        0x7fd1c3e74afc
00a34 418bc0                         mov        eax, r8d
00a37 4881c410010000                 add        rsp, 0x110
00a3e 5d                             pop        rbp
00a3f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a43 0f87f1160000                   ja         0x7fd1c3e74c3a
00a49 c3                             ret        
00a4a 48be88367ce200000000           movabs     rsi, 0xe27c3688
00a54 666690                         nop        
00a57 e804d3a9ff                     call       0x7fd1c3910860
00a5c 0f1f8400540b0004               nop        dword ptr [rax + rax + 0x4000b54]
00a64 4885c0                         test       rax, rax
00a67 0f847b150000                   je         0x7fd1c3e74ae8
00a6d 488bf0                         mov        rsi, rax
00a70 4881c410010000                 add        rsp, 0x110
00a77 5d                             pop        rbp
00a78 e9e354adff                     jmp        0x7fd1c3948a60
00a7d 4533d2                         xor        r10d, r10d
00a80 4533db                         xor        r11d, r11d
00a83 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a88 e944f7ffff                     jmp        0x7fd1c3e72cd1
00a8d bee4ffffff                     mov        esi, 0xffffffe4
00a92 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a9a 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a9f 44891424                       mov        dword ptr [rsp], r10d
00aa3 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00aa8 44895c2404                     mov        dword ptr [rsp + 4], r11d
00aad 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00ab2 4489542408                     mov        dword ptr [rsp + 8], r10d
00ab7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00abc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ac1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ac6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00acb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ad0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ad5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ada 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00adf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ae4 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ae9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00aee 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00af3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00af8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00afd 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00b02 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00b07 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00b0c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00b11 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00b16 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00b1b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b20 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b25 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00b2a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00b2f 4489442458                     mov        dword ptr [rsp + 0x58], r8d
00b34 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00b39 6690                           nop        
00b3b e82001adff                     call       0x7fd1c3943760
00b40 0f1f8400380c0005               nop        dword ptr [rax + rax + 0x5000c38]
00b48 bee4ffffff                     mov        esi, 0xffffffe4
00b4d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b55 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b5a 44891c24                       mov        dword ptr [rsp], r11d
00b5e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b63 4489442404                     mov        dword ptr [rsp + 4], r8d
00b68 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b6d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b72 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b77 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b7c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b81 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b86 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00b8b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00b90 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00b95 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00b9a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00b9f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ba4 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ba9 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00bae 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bb3 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00bb8 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00bbd 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00bc2 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00bc7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00bcc 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00bd1 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00bd6 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00bdb 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00be0 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00be5 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00bea 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00bef 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00bf4 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00bf8 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00bfd 6690                           nop        
00bff e85c00adff                     call       0x7fd1c3943760
00c04 0f1f8400fc0c0006               nop        dword ptr [rax + rax + 0x6000cfc]
00c0c bee4ffffff                     mov        esi, 0xffffffe4
00c11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c19 448b542408                     mov        r10d, dword ptr [rsp + 8]
00c1e 44891424                       mov        dword ptr [rsp], r10d
00c22 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00c27 4489442404                     mov        dword ptr [rsp + 4], r8d
00c2c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c31 4489542408                     mov        dword ptr [rsp + 8], r10d
00c36 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c3b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c40 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00c45 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00c4a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c4f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c54 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00c59 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00c5e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00c63 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00c68 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00c6d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00c72 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00c77 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00c7c 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00c81 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c86 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00c8b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00c90 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00c95 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00c9a 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c9f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00ca4 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00ca9 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00cae 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00cb3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cb8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00cc0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cc5 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00cca 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00ccf e88cffacff                     call       0x7fd1c3943760
00cd4 0f1f8400cc0d0007               nop        dword ptr [rax + rax + 0x7000dcc]
00cdc 4533db                         xor        r11d, r11d
00cdf 4d3bcb                         cmp        r9, r11
00ce2 bdffffffff                     mov        ebp, 0xffffffff
00ce7 7c08                           jl         0x7fd1c3e737f1
00ce9 400f95c5                       setne      bpl
00ced 400fb6ed                       movzx      ebp, bpl
00cf1 be45ffffff                     mov        esi, 0xffffff45
00cf6 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00cfe 4c891c24                       mov        qword ptr [rsp], r11
00d02 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d07 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d0c 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00d14 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00d19 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00d1d 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00d21 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d26 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00d2b 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00d2f 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00d33 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00d38 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00d3d 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00d41 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00d45 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00d4a 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00d4f 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
00d53 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00d57 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
00d5f 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00d64 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00d68 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00d6c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00d71 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
00d76 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00d7a 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00d7e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d83 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d88 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d90 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d95 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d9d 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00da2 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00daa 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00db1 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00db9 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00dc1 6690                           nop        
00dc3 e898feacff                     call       0x7fd1c3943760
00dc8 0f1f8400c00e0008               nop        dword ptr [rax + rax + 0x8000ec0]
00dd0 be45ffffff                     mov        esi, 0xffffff45
00dd5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ddd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00de2 44891c24                       mov        dword ptr [rsp], r11d
00de6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00deb 4489542404                     mov        dword ptr [rsp + 4], r10d
00df0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00df5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00dfa 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e02 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e07 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e0c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e11 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00e16 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00e1b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e20 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e25 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00e2a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e2f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e34 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e39 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e3e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e43 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e48 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e4d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e52 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e57 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00e5c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00e61 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00e66 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00e6b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e70 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e75 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e7a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e7f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e84 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e89 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e91 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e96 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e9e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00ea3 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00eab 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00eb3 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
00ebb 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00ec3 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00ecb 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
00ed3 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
00edb e880fdacff                     call       0x7fd1c3943760
00ee0 0f1f8400d80f0009               nop        dword ptr [rax + rax + 0x9000fd8]
00ee8 be45ffffff                     mov        esi, 0xffffff45
00eed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ef5 448b542408                     mov        r10d, dword ptr [rsp + 8]
00efa 44891424                       mov        dword ptr [rsp], r10d
00efe 44894c2408                     mov        dword ptr [rsp + 8], r9d
00f03 e858fdacff                     call       0x7fd1c3943760
00f08 0f1f84000010000a               nop        dword ptr [rax + rax + 0xa001000]
00f10 be45ffffff                     mov        esi, 0xffffff45
00f15 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f1d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f22 44891424                       mov        dword ptr [rsp], r10d
00f26 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f2b 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f30 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f35 4489542408                     mov        dword ptr [rsp + 8], r10d
00f3a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f42 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f47 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f4c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f51 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00f56 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f5b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f60 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f65 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f6a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f6f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f74 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f79 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f7e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f83 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f88 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f8d 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f92 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f97 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00f9c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00fa1 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00fa6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00fab 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fb0 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fb5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00fba 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00fbf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fc4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fc9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fd1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fd6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fde 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fe3 e878fcacff                     call       0x7fd1c3943760
00fe8 0f1f8400e010000b               nop        dword ptr [rax + rax + 0xb0010e0]
00ff0 be45ffffff                     mov        esi, 0xffffff45
00ff5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ffd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01002 44891c24                       mov        dword ptr [rsp], r11d
01006 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0100b 4489542404                     mov        dword ptr [rsp + 4], r10d
01010 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01015 44895c2408                     mov        dword ptr [rsp + 8], r11d
0101a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01022 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01027 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0102c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01031 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01036 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0103b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01040 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01045 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0104a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0104f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01054 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01059 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0105e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01063 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01068 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0106d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01072 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01077 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0107c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01081 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01086 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0108b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01090 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01095 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0109a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0109f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010a9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010b1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010b6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010be 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010c3 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
010cb 44895c2478                     mov        dword ptr [rsp + 0x78], r11d
010d0 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
010d8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010e0 666690                         nop        
010e3 e878fbacff                     call       0x7fd1c3943760
010e8 0f1f8400e011000c               nop        dword ptr [rax + rax + 0xc0011e0]
010f0 be45ffffff                     mov        esi, 0xffffff45
010f5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010fd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01102 44891424                       mov        dword ptr [rsp], r10d
01106 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0110b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01110 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01115 4489542408                     mov        dword ptr [rsp + 8], r10d
0111a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01122 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01127 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0112c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01131 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01136 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0113b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01140 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01145 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0114a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0114f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01154 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01159 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0115e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01163 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01168 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0116d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01172 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01177 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0117c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01181 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01186 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0118b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01190 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01195 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0119a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0119f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
011a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
011a9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
011b1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
011b6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
011be 4c89542468                     mov        qword ptr [rsp + 0x68], r10
011c3 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
011cb 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
011d2 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011da 90                             nop        
011db e880faacff                     call       0x7fd1c3943760
011e0 0f1f8400d812000d               nop        dword ptr [rax + rax + 0xd0012d8]
011e8 be45ffffff                     mov        esi, 0xffffff45
011ed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011f5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011fa 44890c24                       mov        dword ptr [rsp], r9d
011fe 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01203 44895c2404                     mov        dword ptr [rsp + 4], r11d
01208 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0120d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01212 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0121a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0121f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01224 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01229 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0122e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01233 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01238 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0123d 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01242 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01247 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0124c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01251 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01256 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0125b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01260 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01265 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0126a 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0126f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01274 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01279 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0127e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01283 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01288 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0128d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01292 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01297 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
0129c 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
012a1 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012a9 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012ae 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012b6 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012bb 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012c0 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
012c7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012cf 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
012d7 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
012df 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
012e7 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
012ef 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
012f7 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
012ff 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
01307 e854f9acff                     call       0x7fd1c3943760
0130c 0f1f84000414000e               nop        dword ptr [rax + rax + 0xe001404]
01314 41bbffffff7f                   mov        r11d, 0x7fffffff
0131a 4d3bcb                         cmp        r9, r11
0131d bdffffffff                     mov        ebp, 0xffffffff
01322 7c08                           jl         0x7fd1c3e73e2c
01324 400f95c5                       setne      bpl
01328 400fb6ed                       movzx      ebp, bpl
0132c be45ffffff                     mov        esi, 0xffffff45
01331 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01339 4c891c24                       mov        qword ptr [rsp], r11
0133d 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
01341 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01345 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0134d 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01352 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01356 894c2414                       mov        dword ptr [rsp + 0x14], ecx
0135a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0135f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01364 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01368 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0136c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01371 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01376 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0137a 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0137e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01383 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01388 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
0138c 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01390 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
01398 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0139d 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
013a1 894c2450                       mov        dword ptr [rsp + 0x50], ecx
013a5 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
013aa 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
013af 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
013b3 894c2458                       mov        dword ptr [rsp + 0x58], ecx
013b7 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
013bc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013c1 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013c9 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
013ce 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
013d6 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
013db 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
013e3 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
013ea 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013f2 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
013fa 90                             nop        
013fb e860f8acff                     call       0x7fd1c3943760
01400 0f1f8400f814000f               nop        dword ptr [rax + rax + 0xf0014f8]
01408 be45ffffff                     mov        esi, 0xffffff45
0140d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01415 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0141a 44890c24                       mov        dword ptr [rsp], r9d
0141e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01423 44894c2404                     mov        dword ptr [rsp + 4], r9d
01428 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0142d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01432 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0143a 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0143f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01444 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01449 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0144e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01453 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01458 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0145d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01462 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01467 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0146c 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01471 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01476 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0147b 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01480 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01485 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0148a 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0148f 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01494 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01499 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0149e 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
014a3 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
014a8 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
014ad 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
014b2 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
014b7 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
014bc 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
014c1 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
014c9 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
014ce 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
014d6 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
014db 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014e0 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014e8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
014f0 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
014f8 666690                         nop        
014fb e860f7acff                     call       0x7fd1c3943760
01500 0f1f8400f8150010               nop        dword ptr [rax + rax + 0x100015f8]
01508 be45ffffff                     mov        esi, 0xffffff45
0150d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01515 448b542408                     mov        r10d, dword ptr [rsp + 8]
0151a 44891424                       mov        dword ptr [rsp], r10d
0151e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01523 4489542404                     mov        dword ptr [rsp + 4], r10d
01528 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0152d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01532 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0153a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0153f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01544 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01549 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0154e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01553 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01558 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0155d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01562 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01567 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0156c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01571 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01576 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0157b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01580 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01585 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0158a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0158f 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01594 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01599 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0159e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
015a3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
015a8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
015ad 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
015b2 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
015b7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
015bc 4c89542458                     mov        qword ptr [rsp + 0x58], r10
015c1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
015c9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
015ce 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
015d6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
015db 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
015e0 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
015e7 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
015ef 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
015f7 e864f6acff                     call       0x7fd1c3943760
015fc 0f1f8400f4160011               nop        dword ptr [rax + rax + 0x110016f4]
01604 be3dffffff                     mov        esi, 0xffffff3d
01609 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01611 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01616 44891c24                       mov        dword ptr [rsp], r11d
0161a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0161f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01624 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01629 44895c2408                     mov        dword ptr [rsp + 8], r11d
0162e 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01636 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
0163b 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01640 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01645 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0164a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0164f 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01654 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01659 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0165e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01663 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01668 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0166d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01672 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01677 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0167c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01681 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01686 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
0168b 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01690 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01695 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0169d 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
016a2 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
016a7 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
016ac 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
016b1 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
016b6 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
016bb 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
016c0 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
016c5 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
016ca 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
016d2 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
016d7 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
016df 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
016e4 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
016e9 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
016f1 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
016f8 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
016ff 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01707 4489942498000000               mov        dword ptr [rsp + 0x98], r10d
0170f 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01717 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0171f 448b9424bc000000               mov        r10d, dword ptr [rsp + 0xbc]
01727 448b9c24b8000000               mov        r11d, dword ptr [rsp + 0xb8]
0172f 44899c24a4000000               mov        dword ptr [rsp + 0xa4], r11d
01737 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0173f e81cf5acff                     call       0x7fd1c3943760
01744 0f1f84003c180012               nop        dword ptr [rax + rax + 0x1200183c]
0174c be45ffffff                     mov        esi, 0xffffff45
01751 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01759 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0175e 44891c24                       mov        dword ptr [rsp], r11d
01762 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01767 44895c2404                     mov        dword ptr [rsp + 4], r11d
0176c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01771 44895c2408                     mov        dword ptr [rsp + 8], r11d
01776 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0177b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01780 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01785 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0178a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0178f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01794 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01799 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0179e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
017a3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017a8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017ad 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017b2 894c2430                       mov        dword ptr [rsp + 0x30], ecx
017b6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
017bb 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
017c0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
017c5 4489542444                     mov        dword ptr [rsp + 0x44], r10d
017ca 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
017cf 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
017d4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017dc 4c89542450                     mov        qword ptr [rsp + 0x50], r10
017e1 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
017e6 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
017eb 895c2464                       mov        dword ptr [rsp + 0x64], ebx
017ef e86cf4acff                     call       0x7fd1c3943760
017f4 0f1f8400ec180013               nop        dword ptr [rax + rax + 0x130018ec]
017fc be45ffffff                     mov        esi, 0xffffff45
01801 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01809 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0180e 44891c24                       mov        dword ptr [rsp], r11d
01812 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01817 44894c2404                     mov        dword ptr [rsp + 4], r9d
0181c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01821 44895c2408                     mov        dword ptr [rsp + 8], r11d
01826 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0182b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01830 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01835 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0183a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0183f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01844 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01849 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0184e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01853 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01858 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0185d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01862 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01867 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0186c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01871 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01876 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0187b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01880 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01885 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0188a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0188f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01894 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01899 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0189e 90                             nop        
0189f e8bcf3acff                     call       0x7fd1c3943760
018a4 0f1f84009c190014               nop        dword ptr [rax + rax + 0x1400199c]
018ac be45ffffff                     mov        esi, 0xffffff45
018b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018b9 448b542408                     mov        r10d, dword ptr [rsp + 8]
018be 44891424                       mov        dword ptr [rsp], r10d
018c2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
018c7 4489542404                     mov        dword ptr [rsp + 4], r10d
018cc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018d1 44895c2408                     mov        dword ptr [rsp + 8], r11d
018d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
018de 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018e3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018e8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018ed 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
018f2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
018f7 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
018fc 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01901 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01906 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0190b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01910 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01915 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0191a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0191f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01924 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01929 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0192e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01933 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01938 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0193d 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01942 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01947 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0194c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01951 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01956 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0195b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01960 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01965 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0196d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01972 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0197a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0197f 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
01987 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
0198f 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01997 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
0199f 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
019a7 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
019af e8acf2acff                     call       0x7fd1c3943760
019b4 0f1f8400ac1a0015               nop        dword ptr [rax + rax + 0x15001aac]
019bc be45ffffff                     mov        esi, 0xffffff45
019c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019c9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
019ce 44891c24                       mov        dword ptr [rsp], r11d
019d2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
019d7 4489542404                     mov        dword ptr [rsp + 4], r10d
019dc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
019e1 44895c2408                     mov        dword ptr [rsp + 8], r11d
019e6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019eb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019f0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
019f5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019fa 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019ff 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a04 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01a09 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a0e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01a13 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a18 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a1d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a22 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a27 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a2c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a31 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01a36 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01a3b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a40 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01a45 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01a4a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01a4f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01a54 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01a59 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01a5e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a63 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01a68 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01a70 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01a75 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01a7d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01a82 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01a8a 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01a91 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
01a99 6690                           nop        
01a9b e8c0f1acff                     call       0x7fd1c3943760
01aa0 0f1f8400981b0016               nop        dword ptr [rax + rax + 0x16001b98]
01aa8 4585c9                         test       r9d, r9d
01aab 7f08                           jg         0x7fd1c3e745b5
01aad 4533ed                         xor        r13d, r13d
01ab0 e914e6ffff                     jmp        0x7fd1c3e72bc9
01ab5 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01ab9 89742428                       mov        dword ptr [rsp + 0x28], esi
01abd 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01ac1 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01ac5 4489442414                     mov        dword ptr [rsp + 0x14], r8d
01aca 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01acf 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01ad4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad9 8b0424                         mov        eax, dword ptr [rsp]
01adc 89442404                       mov        dword ptr [rsp + 4], eax
01ae0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae5 48894424f8                     mov        qword ptr [rsp - 8], rax
01aea 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01af1 890424                         mov        dword ptr [rsp], eax
01af4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b01 488bf5                         mov        rsi, rbp
01b04 8b542408                       mov        edx, dword ptr [rsp + 8]
01b08 418bc9                         mov        ecx, r9d
01b0b e850c2a9ff                     call       0x7fd1c3910860
01b10 0f1f8400081c0017               nop        dword ptr [rax + rax + 0x17001c08]
01b18 41bb40000000                   mov        r11d, 0x40
01b1e 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01b23 c462a1f7e8                     shlx       r13, rax, r11
01b28 48894424f8                     mov        qword ptr [rsp - 8], rax
01b2d 8b442404                       mov        eax, dword ptr [rsp + 4]
01b31 890424                         mov        dword ptr [rsp], eax
01b34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b39 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
01b3e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b43 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01b48 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01b4c 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01b50 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01b54 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b58 e96ce5ffff                     jmp        0x7fd1c3e72bc9
01b5d 4585c9                         test       r9d, r9d
01b60 7f08                           jg         0x7fd1c3e7466a
01b62 4533f6                         xor        r14d, r14d
01b65 e9a1e5ffff                     jmp        0x7fd1c3e72c0b
01b6a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b6f 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01b74 89542428                       mov        dword ptr [rsp + 0x28], edx
01b78 8974241c                       mov        dword ptr [rsp + 0x1c], esi
01b7c 897c2418                       mov        dword ptr [rsp + 0x18], edi
01b80 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01b84 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01b89 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01b93 8b0424                         mov        eax, dword ptr [rsp]
01b96 89442404                       mov        dword ptr [rsp + 4], eax
01b9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b9f 48894424f8                     mov        qword ptr [rsp - 8], rax
01ba4 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01bab 890424                         mov        dword ptr [rsp], eax
01bae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bb3 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bbb 488bf5                         mov        rsi, rbp
01bbe 8b542408                       mov        edx, dword ptr [rsp + 8]
01bc2 418bc9                         mov        ecx, r9d
01bc5 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01bca 90                             nop        
01bcb e890c1a9ff                     call       0x7fd1c3910860
01bd0 0f1f8400c81c0018               nop        dword ptr [rax + rax + 0x18001cc8]
01bd8 41ba80000000                   mov        r10d, 0x80
01bde 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
01be3 c462a9f7f0                     shlx       r14, rax, r10
01be8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bed 8b442404                       mov        eax, dword ptr [rsp + 4]
01bf1 890424                         mov        dword ptr [rsp], eax
01bf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01bfe 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01c03 8b7c2418                       mov        edi, dword ptr [rsp + 0x18]
01c07 8b74241c                       mov        esi, dword ptr [rsp + 0x1c]
01c0b 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01c0f 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01c14 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c19 e9ede4ffff                     jmp        0x7fd1c3e72c0b
01c1e 4533c0                         xor        r8d, r8d
01c21 e9e3edffff                     jmp        0x7fd1c3e73509
01c26 bee4ffffff                     mov        esi, 0xffffffe4
01c2b 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c33 488f0424                       pop        qword ptr [rsp]
01c37 e824f0acff                     call       0x7fd1c3943760
01c3c 0f1f8400341d0019               nop        dword ptr [rax + rax + 0x19001d34]
01c44 be5d000000                     mov        esi, 0x5d
01c49 6690                           nop        
01c4b e810f0acff                     call       0x7fd1c3943760
01c50 0f1f8400481d001a               nop        dword ptr [rax + rax + 0x1a001d48]
01c58 bef6ffffff                     mov        esi, 0xfffffff6
01c5d 6690                           nop        
01c5f e8fcefacff                     call       0x7fd1c3943760
01c64 0f1f84005c1d001b               nop        dword ptr [rax + rax + 0x1b001d5c]
01c6c bef6ffffff                     mov        esi, 0xfffffff6
01c71 6690                           nop        
01c73 e8e8efacff                     call       0x7fd1c3943760
01c78 0f1f8400701d001c               nop        dword ptr [rax + rax + 0x1c001d70]
01c80 be6effffff                     mov        esi, 0xffffff6e
01c85 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c8d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c92 44891424                       mov        dword ptr [rsp], r10d
01c96 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c9b 4489542408                     mov        dword ptr [rsp + 8], r10d
01ca0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ca5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01caa 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01caf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cb4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01cb9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01cbe 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01cc3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01cc8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ccd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01cd2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cd7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cdc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ce1 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ce6 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ceb 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cf0 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01cf4 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01cf9 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01cfe 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01d03 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01d08 666690                         nop        
01d0b e850efacff                     call       0x7fd1c3943760
01d10 0f1f8400081e001d               nop        dword ptr [rax + rax + 0x1d001e08]
01d18 bee4ffffff                     mov        esi, 0xffffffe4
01d1d 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d25 488f0424                       pop        qword ptr [rsp]
01d29 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01d2e 48894424f8                     mov        qword ptr [rsp - 8], rax
01d33 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d3a 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d3e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d43 897c2430                       mov        dword ptr [rsp + 0x30], edi
01d47 89542434                       mov        dword ptr [rsp + 0x34], edx
01d4b e810efacff                     call       0x7fd1c3943760
01d50 0f1f8400481e001e               nop        dword ptr [rax + rax + 0x1e001e48]
01d58 bee4ffffff                     mov        esi, 0xffffffe4
01d5d 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d65 488f0424                       pop        qword ptr [rsp]
01d69 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d75 89442418                       mov        dword ptr [rsp + 0x18], eax
01d79 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7e 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01d82 89542430                       mov        dword ptr [rsp + 0x30], edx
01d86 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01d8b 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d90 666690                         nop        
01d93 e8c8eeacff                     call       0x7fd1c3943760
01d98 0f1f8400901e001f               nop        dword ptr [rax + rax + 0x1f001e90]
01da0 bebeffffff                     mov        esi, 0xffffffbe
01da5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01dad 448b542408                     mov        r10d, dword ptr [rsp + 8]
01db2 44891424                       mov        dword ptr [rsp], r10d
01db6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dbb 4489542408                     mov        dword ptr [rsp + 8], r10d
01dc0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dc5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dca 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01dcf 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01dd4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dd9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01dde 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01de3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01de8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ded 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01df2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01df7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01dfc 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01e01 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01e06 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01e0b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e10 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01e14 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01e19 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01e1e 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01e23 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e28 666690                         nop        
01e2b e830eeacff                     call       0x7fd1c3943760
01e30 0f1f8400281f0020               nop        dword ptr [rax + rax + 0x20001f28]
01e38 beccffffff                     mov        esi, 0xffffffcc
01e3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e45 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01e4a 44890c24                       mov        dword ptr [rsp], r9d
01e4e 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01e53 48894424f8                     mov        qword ptr [rsp - 8], rax
01e58 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e5f 89442414                       mov        dword ptr [rsp + 0x14], eax
01e63 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e68 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e6d 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01e72 897c2428                       mov        dword ptr [rsp + 0x28], edi
01e76 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01e7a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e7f e8dcedacff                     call       0x7fd1c3943760
01e84 0f1f84007c1f0021               nop        dword ptr [rax + rax + 0x21001f7c]
01e8c beccffffff                     mov        esi, 0xffffffcc
01e91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e99 448b442408                     mov        r8d, dword ptr [rsp + 8]
01e9e 44890424                       mov        dword ptr [rsp], r8d
01ea2 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01eae 89442410                       mov        dword ptr [rsp + 0x10], eax
01eb2 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb7 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01ebc 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01ec1 897c2414                       mov        dword ptr [rsp + 0x14], edi
01ec5 89542428                       mov        dword ptr [rsp + 0x28], edx
01ec9 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01ece 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ed3 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ed8 666690                         nop        
01edb e880edacff                     call       0x7fd1c3943760
01ee0 0f1f8400d81f0022               nop        dword ptr [rax + rax + 0x22001fd8]
01ee8 be45ffffff                     mov        esi, 0xffffff45
01eed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ef5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01efa 44891c24                       mov        dword ptr [rsp], r11d
01efe 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01f03 4489542404                     mov        dword ptr [rsp + 4], r10d
01f08 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f0d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f12 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f17 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f1c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01f21 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f26 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f2b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f30 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01f35 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01f3a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01f3f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01f44 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f49 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01f4e 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01f53 e808edacff                     call       0x7fd1c3943760
01f58 0f1f840050200023               nop        dword ptr [rax + rax + 0x23002050]
01f60 be45ffffff                     mov        esi, 0xffffff45
01f65 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f6d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01f72 44891424                       mov        dword ptr [rsp], r10d
01f76 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01f7b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01f80 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f85 4489542408                     mov        dword ptr [rsp + 8], r10d
01f8a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f8f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f94 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01f99 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f9e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01fa3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01fa8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01fad 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fb2 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01fb7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01fbc 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fc1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01fc6 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01fcb 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01fd0 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01fd5 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01fda 90                             nop        
01fdb e880ecacff                     call       0x7fd1c3943760
01fe0 0f1f8400d8200024               nop        dword ptr [rax + rax + 0x240020d8]
01fe8 bef6ffffff                     mov        esi, 0xfffffff6
01fed 6690                           nop        
01fef e86cecacff                     call       0x7fd1c3943760
01ff4 0f1f8400ec200025               nop        dword ptr [rax + rax + 0x250020ec]
01ffc be5d000000                     mov        esi, 0x5d
02001 6690                           nop        
02003 e858ecacff                     call       0x7fd1c3943760
02008 0f1f840000210026               nop        dword ptr [rax + rax + 0x26002100]
02010 be45ffffff                     mov        esi, 0xffffff45
02015 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0201d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02022 44891c24                       mov        dword ptr [rsp], r11d
02026 44894c2410                     mov        dword ptr [rsp + 0x10], r9d
0202b 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0202f 89442418                       mov        dword ptr [rsp + 0x18], eax
02033 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0203b 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02040 4c89442450                     mov        qword ptr [rsp + 0x50], r8
02045 6690                           nop        
02047 e814ecacff                     call       0x7fd1c3943760
0204c 0f1f840044210027               nop        dword ptr [rax + rax + 0x27002144]
02054 bef6ffffff                     mov        esi, 0xfffffff6
02059 418be9                         mov        ebp, r9d
0205c 666690                         nop        
0205f e8fcebacff                     call       0x7fd1c3943760
02064 0f1f84005c210028               nop        dword ptr [rax + rax + 0x2800215c]
0206c bef6ffffff                     mov        esi, 0xfffffff6
02071 418bea                         mov        ebp, r10d
02074 666690                         nop        
02077 e8e4ebacff                     call       0x7fd1c3943760
0207c 0f1f840074210029               nop        dword ptr [rax + rax + 0x29002174]
02084 bef6ffffff                     mov        esi, 0xfffffff6
02089 418beb                         mov        ebp, r11d
0208c 666690                         nop        
0208f e8ccebacff                     call       0x7fd1c3943760
02094 0f1f84008c21002a               nop        dword ptr [rax + rax + 0x2a00218c]
0209c bef6ffffff                     mov        esi, 0xfffffff6
020a1 6690                           nop        
020a3 e8b8ebacff                     call       0x7fd1c3943760
020a8 0f1f8400a021002b               nop        dword ptr [rax + rax + 0x2b0021a0]
020b0 bef6ffffff                     mov        esi, 0xfffffff6
020b5 6690                           nop        
020b7 e8a4ebacff                     call       0x7fd1c3943760
020bc 0f1f8400b421002c               nop        dword ptr [rax + rax + 0x2c0021b4]
020c4 bef6ffffff                     mov        esi, 0xfffffff6
020c9 6690                           nop        
020cb e890ebacff                     call       0x7fd1c3943760
020d0 0f1f8400c821002d               nop        dword ptr [rax + rax + 0x2d0021c8]
020d8 bef6ffffff                     mov        esi, 0xfffffff6
020dd 6690                           nop        
020df e87cebacff                     call       0x7fd1c3943760
020e4 0f1f8400dc21002e               nop        dword ptr [rax + rax + 0x2e0021dc]
020ec bef6ffffff                     mov        esi, 0xfffffff6
020f1 6690                           nop        
020f3 e868ebacff                     call       0x7fd1c3943760
020f8 0f1f8400f021002f               nop        dword ptr [rax + rax + 0x2f0021f0]
02100 bef6ffffff                     mov        esi, 0xfffffff6
02105 6690                           nop        
02107 e854ebacff                     call       0x7fd1c3943760
0210c 0f1f840004220030               nop        dword ptr [rax + rax + 0x30002204]
02114 bef6ffffff                     mov        esi, 0xfffffff6
02119 6690                           nop        
0211b e840ebacff                     call       0x7fd1c3943760
02120 0f1f840018220031               nop        dword ptr [rax + rax + 0x31002218]
02128 eb08                           jmp        0x7fd1c3e74c32
0212a eb06                           jmp        0x7fd1c3e74c32
0212c eb04                           jmp        0x7fd1c3e74c32
0212e eb02                           jmp        0x7fd1c3e74c32
02130 eb00                           jmp        0x7fd1c3e74c32
02132 488bf0                         mov        rsi, rax
02135 e936e9ffff                     jmp        0x7fd1c3e73570
0213a 49ba3f35e7c3d17f0000           movabs     r10, 0x7fd1c3e7353f
02144 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
0214b e990e2a9ff                     jmp        0x7fd1c3912ee0
02150 e84baea8ff                     call       0x7fd1c38ffaa0
02155 e9c4deffff                     jmp        0x7fd1c3e72b1e
0215a f4                             hlt        
0215b f4                             hlt        
0215c f4                             hlt        
0215d f4                             hlt        
0215e f4                             hlt        
0215f f4                             hlt        
