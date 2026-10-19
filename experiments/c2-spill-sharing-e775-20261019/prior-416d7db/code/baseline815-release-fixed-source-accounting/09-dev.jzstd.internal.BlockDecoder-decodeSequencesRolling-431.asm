00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f853a210000                   jne        0x7f1e7fe7ffd8
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
00050 0f83c91b0000                   jae        0x7f1e7fe7fa9f
00056 440fb64c160b                   movzx      r9d, byte ptr [rsi + rdx + 0xb]
0005c 4585c9                         test       r9d, r9d
0005f 0f84db1b0000                   je         0x7f1e7fe7fac0
00065 448bc2                         mov        r8d, edx
00068 442bc1                         sub        r8d, ecx
0006b 448b1424                       mov        r10d, dword ptr [rsp]
0006f 4183c2f9                       add        r10d, -7
00073 448d5af8                       lea        r11d, [rdx - 8]
00077 428d0cc500000000               lea        ecx, [r8*8]
0007f f3450fbdc9                     lzcnt      r9d, r9d
00084 41bd1f000000                   mov        r13d, 0x1f
0008a 452be9                         sub        r13d, r9d
0008d bb08000000                     mov        ebx, 8
00092 412bdd                         sub        ebx, r13d
00095 8bd1                           mov        edx, ecx
00097 2bd3                           sub        edx, ebx
00099 4183f808                       cmp        r8d, 8
0009d 0f8c051a0000                   jl         0x7f1e7fe7f928
000a3 4585d2                         test       r10d, r10d
000a6 0f8c881d0000                   jl         0x7f1e7fe7fcb4
000ac 8b2c24                         mov        ebp, dword ptr [rsp]
000af 83c5f9                         add        ebp, -7
000b2 443bdd                         cmp        r11d, ebp
000b5 0f83591c0000                   jae        0x7f1e7fe7fb94
000bb 418bfb                         mov        edi, r11d
000be 488b443e0c                     mov        rax, qword ptr [rsi + rdi + 0xc]
000c3 4183c0f8                       add        r8d, -8
000c7 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
000cf 4183c1f0                       add        r9d, -0x10
000d3 4183f808                       cmp        r8d, 8
000d7 0f8c791a0000                   jl         0x7f1e7fe7f9d6
000dd 4585d2                         test       r10d, r10d
000e0 0f8ca21d0000                   jl         0x7f1e7fe7fd08
000e6 8b2c24                         mov        ebp, dword ptr [rsp]
000e9 83c5f9                         add        ebp, -7
000ec 443bcd                         cmp        r9d, ebp
000ef 0f835f1c0000                   jae        0x7f1e7fe7fbd4
000f5 458bc1                         mov        r8d, r9d
000f8 488b8c2490000000               mov        rcx, qword ptr [rsp + 0x90]
00100 4e8b74010c                     mov        r14, qword ptr [rcx + r8 + 0xc]
00105 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010a 8b4d1c                         mov        ecx, dword ptr [rbp + 0x1c]
0010d 85c9                           test       ecx, ecx
0010f 0f843f1b0000                   je         0x7f1e7fe7fad4
00115 448b4520                       mov        r8d, dword ptr [rbp + 0x20]
00119 418b7808                       mov        edi, dword ptr [r8 + 8]
0011d 8b7524                         mov        esi, dword ptr [rbp + 0x24]
00120 85f6                           test       esi, esi
00122 0f84401b0000                   je         0x7f1e7fe7fae8
00128 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0012d 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
00135 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0013a 4889442428                     mov        qword ptr [rsp + 0x28], rax
0013f 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00146 44896c240c                     mov        dword ptr [rsp + 0xc], r13d
0014b 895c2424                       mov        dword ptr [rsp + 0x24], ebx
0014f 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00154 4489542404                     mov        dword ptr [rsp + 4], r10d
00159 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00161 037908                         add        edi, dword ptr [rcx + 8]
00164 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00168 037e08                         add        edi, dword ptr [rsi + 8]
0016b 89742438                       mov        dword ptr [rsp + 0x38], esi
0016f 897c241c                       mov        dword ptr [rsp + 0x1c], edi
00173 4c8bd6                         mov        r10, rsi
00176 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0017b 4c8bd1                         mov        r10, rcx
0017e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00183 4d8bd0                         mov        r10, r8
00186 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018b 85ff                           test       edi, edi
0018d 0f84ea080000                   je         0x7f1e7fe7e8fd
00193 be40000000                     mov        esi, 0x40
00198 2bf3                           sub        esi, ebx
0019a 3bfe                           cmp        edi, esi
0019c 0f8fe9010000                   jg         0x7f1e7fe7e20b
001a2 2bf7                           sub        esi, edi
001a4 c462cbf7c0                     shrx       r8, rax, rsi
001a9 83ff40                         cmp        edi, 0x40
001ac 0f8d5a1e0000                   jge        0x7f1e7fe7fe8c
001b2 41bb01000000                   mov        r11d, 1
001b8 c4c2c1f7eb                     shlx       rbp, r11, rdi
001bd 48ffcd                         dec        rbp
001c0 4923e8                         and        rbp, r8
001c3 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001c8 448bd7                         mov        r10d, edi
001cb 458bda                         mov        r11d, r10d
001ce 442b5c240c                     sub        r11d, dword ptr [rsp + 0xc]
001d3 458d4308                       lea        r8d, [r11 + 8]
001d7 4183f840                       cmp        r8d, 0x40
001db 7c32                           jl         0x7f1e7fe7e08f
001dd 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001e2 4183c3c8                       add        r11d, -0x38
001e6 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
001eb 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f3 8b542408                       mov        edx, dword ptr [rsp + 8]
001f7 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
001fb e8e027a9ff                     call       0x7f1e7f910860
00200 0f1f8400f8020000               nop        dword ptr [rax + rax + 0x2f8]
00208 4889442420                     mov        qword ptr [rsp + 0x20], rax
0020d eb31                           jmp        0x7f1e7fe7e0c0
0020f 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00214 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0021c 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00221 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00226 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0022e 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00236 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0023b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00240 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00245 458b4308                       mov        r8d, dword ptr [r11 + 8]
00249 4183f820                       cmp        r8d, 0x20
0024d 0f8d911c0000                   jge        0x7f1e7fe7fd64
00253 c462bbf74c2460                 shrx       r9, qword ptr [rsp + 0x60], r8
0025a 41ba01000000                   mov        r10d, 1
00260 c44239f7d2                     shlx       r10d, r10d, r8d
00265 41ffca                         dec        r10d
00268 4d63d2                         movsxd     r10, r10d
0026b 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00270 458bda                         mov        r11d, r10d
00273 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00278 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0027d 458b4308                       mov        r8d, dword ptr [r11 + 8]
00281 4183f820                       cmp        r8d, 0x20
00285 0f8dd11c0000                   jge        0x7f1e7fe7fddc
0028b 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00293 458b5228                       mov        r10d, dword ptr [r10 + 0x28]
00297 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
0029f 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002a4 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
002a8 418b5a08                       mov        ebx, dword ptr [r10 + 8]
002ac 458b5b18                       mov        r11d, dword ptr [r11 + 0x18]
002b0 418b4b08                       mov        ecx, dword ptr [r11 + 8]
002b4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002b9 458b5218                       mov        r10d, dword ptr [r10 + 0x18]
002bd 458b5208                       mov        r10d, dword ptr [r10 + 8]
002c1 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002c6 4585db                         test       r11d, r11d
002c9 0f8e48190000                   jle        0x7f1e7fe7fa97
002cf ffcb                           dec        ebx
002d1 895c2460                       mov        dword ptr [rsp + 0x60], ebx
002d5 ffc9                           dec        ecx
002d7 894c2464                       mov        dword ptr [rsp + 0x64], ecx
002db 41ffca                         dec        r10d
002de 4489542468                     mov        dword ptr [rsp + 0x68], r10d
002e3 c442bbf7d1                     shrx       r10, r9, r8
002e8 b901000000                     mov        ecx, 1
002ed c46239f7c1                     shlx       r8d, ecx, r8d
002f2 458bda                         mov        r11d, r10d
002f5 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
002fa 41ffc8                         dec        r8d
002fd 4d63d0                         movsxd     r10, r8d
00300 4d23d1                         and        r10, r9
00303 458bd2                         mov        r10d, r10d
00306 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0030b 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00313 458b9af8000000                 mov        r11d, dword ptr [r10 + 0xf8]
0031a 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00322 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
00329 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00331 458b5208                       mov        r10d, dword ptr [r10 + 8]
00335 4585d2                         test       r10d, r10d
00338 0f863e190000                   jbe        0x7f1e7fe7fafc
0033e 4d63d2                         movsxd     r10, r10d
00341 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00346 49ffcb                         dec        r11
00349 4d3bda                         cmp        r11, r10
0034c 0f832a190000                   jae        0x7f1e7fe7fafc
00352 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00357 4585db                         test       r11d, r11d
0035a 0f8c3c1a0000                   jl         0x7f1e7fe7fc1c
00360 448b1424                       mov        r10d, dword ptr [rsp]
00364 4183c2f9                       add        r10d, -7
00368 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00370 4533d2                         xor        r10d, r10d
00373 4533db                         xor        r11d, r11d
00376 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0037e 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00386 e994020000                     jmp        0x7f1e7fe7e49f
0038b 8bef                           mov        ebp, edi
0038d 2bee                           sub        ebp, esi
0038f 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
00397 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0039c 666690                         nop        
0039f e83c26a9ff                     call       0x7f1e7f910860
003a4 0f1f84009c040001               nop        dword ptr [rax + rax + 0x100049c]
003ac 4823442428                     and        rax, qword ptr [rsp + 0x28]
003b1 41bb40000000                   mov        r11d, 0x40
003b7 442bdd                         sub        r11d, ebp
003ba c462d1f7c0                     shlx       r8, rax, rbp
003bf c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003c9 4d0bc2                         or         r8, r10
003cc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003d1 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003d6 e9f0fdffff                     jmp        0x7f1e7fe7e04b
003db 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
003e3 4f8b54130c                     mov        r10, qword ptr [r11 + r10 + 0xc]
003e8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003ed 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
003f5 4c89542420                     mov        qword ptr [rsp + 0x20], r10
003fa 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
003fe 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00402 0f1f8000000000                 nop        dword ptr [rax]
00409 0f1f8000000000                 nop        dword ptr [rax]
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8df00a0000                   jge        0x7f1e7fe7ed90
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bda                         mov        r11d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d9d0b0000                   jge        0x7f1e7fe7ee70
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bca                         mov        ecx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8d770c0000                   jge        0x7f1e7fe7ef70
00479 c4e2d3f7df                     shrx       rbx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8d460d0000                   jge        0x7f1e7fe7f068
004a2 41b801000000                   mov        r8d, 1
004a8 c442d1f7c0                     shlx       r8, r8, rbp
004ad 49ffc8                         dec        r8
004b0 4c23c3                         and        r8, rbx
004b3 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004bb 418bd9                         mov        ebx, r9d
004be 4103da                         add        ebx, r10d
004c1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c6 458bd2                         mov        r10d, r10d
004c9 4403d1                         add        r10d, ecx
004cc 4c63cb                         movsxd     r9, ebx
004cf 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
004d7 8bc9                           mov        ecx, ecx
004d9 4c03c1                         add        r8, rcx
004dc 488b8c24e8000000               mov        rcx, qword ptr [rsp + 0xe8]
004e4 4903c9                         add        rcx, r9
004e7 48898c24e8000000               mov        qword ptr [rsp + 0xe8], rcx
004ef 4d85c0                         test       r8, r8
004f2 0f8ee4070000                   jle        0x7f1e7fe7eb5c
004f8 4981f8ffffff7f                 cmp        r8, 0x7fffffff
004ff 0f8f0f0e0000                   jg         0x7f1e7fe7f194
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8ff60e0000                   jg         0x7f1e7fe7f288
00512 81fbffff0300                   cmp        ebx, 0x3ffff
00518 0f8fea0f0000                   jg         0x7f1e7fe7f388
0051e 418bc8                         mov        ecx, r8d
00521 81f900000010                   cmp        ecx, 0x10000000
00527 0f83d7100000                   jae        0x7f1e7fe7f484
0052d 4d63d2                         movsxd     r10, r10d
00530 4863c9                         movsxd     rcx, ecx
00533 49c1e112                       shl        r9, 0x12
00537 48c1e124                       shl        rcx, 0x24
0053b 490bc9                         or         rcx, r9
0053e 490bca                         or         rcx, r10
00541 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
00549 448b9424dc000000               mov        r10d, dword ptr [rsp + 0xdc]
00551 4b894cd010                     mov        qword ptr [r8 + r10*8 + 0x10], rcx
00556 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
0055a 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0055e 0f8daa000000                   jge        0x7f1e7fe7e48e
00564 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0056c 49c1ea30                       shr        r10, 0x30
00570 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00575 49c1e830                       shr        r8, 0x30
00579 458bca                         mov        r9d, r10d
0057c 418bc8                         mov        ecx, r8d
0057f 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00587 c4c23bf7db                     shrx       ebx, r11d, r8d
0058c 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00594 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
0059c c4422bf7d3                     shrx       r10d, r11d, r10d
005a1 4103ca                         add        ecx, r10d
005a4 894c246c                       mov        dword ptr [rsp + 0x6c], ecx
005a8 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005b0 4183fa20                       cmp        r10d, 0x20
005b4 0f8d92110000                   jge        0x7f1e7fe7f5cc
005ba 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005c2 49c1ea30                       shr        r10, 0x30
005c6 458bc2                         mov        r8d, r10d
005c9 b901000000                     mov        ecx, 1
005ce 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005d6 c46229f7d1                     shlx       r10d, ecx, r10d
005db 41ffca                         dec        r10d
005de 4423d3                         and        r10d, ebx
005e1 4503d1                         add        r10d, r9d
005e4 4489542448                     mov        dword ptr [rsp + 0x48], r10d
005e9 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
005f1 4183f920                       cmp        r9d, 0x20
005f5 0f8d01120000                   jge        0x7f1e7fe7f67c
005fb c46231f7d1                     shlx       r10d, ecx, r9d
00600 41ffca                         dec        r10d
00603 4523d3                         and        r10d, r11d
00606 4503d0                         add        r10d, r8d
00609 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8de9030000                   jge        0x7f1e7fe7e881
00618 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0061f 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00624 44234c246c                     and        r9d, dword ptr [rsp + 0x6c]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 458b5b18                       mov        r11d, dword ptr [r11 + 0x18]
00632 458b5308                       mov        r10d, dword ptr [r11 + 8]
00636 453bca                         cmp        r9d, r10d
00639 0f834e040000                   jae        0x7f1e7fe7e90d
0063f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00644 4423542470                     and        r10d, dword ptr [rsp + 0x70]
00649 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0064e 418b5818                       mov        ebx, dword ptr [r8 + 0x18]
00652 8b4b08                         mov        ecx, dword ptr [rbx + 8]
00655 4f8b5ccb10                     mov        r11, qword ptr [r11 + r9*8 + 0x10]
0065a 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
0065f 443bd1                         cmp        r10d, ecx
00662 0f83e0040000                   jae        0x7f1e7fe7e9c8
00668 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0066d 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00672 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00677 458b4b18                       mov        r9d, dword ptr [r11 + 0x18]
0067b 458b5908                       mov        r11d, dword ptr [r9 + 8]
0067f 4e8b54d310                     mov        r10, qword ptr [rbx + r10*8 + 0x10]
00684 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0068c 453bc3                         cmp        r8d, r11d
0068f 0f8377050000                   jae        0x7f1e7fe7ea8c
00695 4f8b54c110                     mov        r10, qword ptr [r9 + r8*8 + 0x10]
0069a 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a2 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006a9 ffc5                           inc        ebp
006ab 896c2404                       mov        dword ptr [rsp + 4], ebp
006af 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b3 0f8d19030000                   jge        0x7f1e7fe7e852
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
006ef 458bd2                         mov        r10d, r10d
006f2 450fb6da                       movzx      r11d, r10b
006f6 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
006fe 4103eb                         add        ebp, r11d
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
00779 0f8451060000                   je         0x7f1e7fe7ec50
0077f 4183f93f                       cmp        r9d, 0x3f
00783 0f8f5f070000                   jg         0x7f1e7fe7ed68
00789 41b840000000                   mov        r8d, 0x40
0078f 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
00794 453bc8                         cmp        r9d, r8d
00797 7e48                           jle        0x7f1e7fe7e661
00799 418bd9                         mov        ebx, r9d
0079c 412bd8                         sub        ebx, r8d
0079f 4183f840                       cmp        r8d, 0x40
007a3 0f8d13120000                   jge        0x7f1e7fe7f83c
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
007df eb30                           jmp        0x7f1e7fe7e691
007e1 452bc1                         sub        r8d, r9d
007e4 c462bbf7842498000000           shrx       r8, qword ptr [rsp + 0x98], r8
007ee 4183f940                       cmp        r9d, 0x40
007f2 0f8db4100000                   jge        0x7f1e7fe7f72c
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
0082f 0f8cdbfbffff                   jl         0x7f1e7fe7e290
00835 458d53c0                       lea        r10d, [r11 - 0x40]
00839 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0083e 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00842 83c5f8                         add        ebp, -8
00845 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00849 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084d 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00851 83c1f0                         add        ecx, -0x10
00854 83f908                         cmp        ecx, 8
00857 0f8c1f010000                   jl         0x7f1e7fe7e7fc
0085d 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00862 4183c2e8                       add        r10d, -0x18
00866 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0086e 0f8267fbffff                   jb         0x7f1e7fe7e25b
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
0096f e86c95b5ff                     call       0x7f1e7f9d7d60
00974 0f1f84006c0a0002               nop        dword ptr [rax + rax + 0x2000a6c]
0097c 85c9                           test       ecx, ecx
0097e 7f08                           jg         0x7f1e7fe7e808
00980 4533d2                         xor        r10d, r10d
00983 e960faffff                     jmp        0x7f1e7fe7e268
00988 890c24                         mov        dword ptr [rsp], ecx
0098b 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00993 8b542408                       mov        edx, dword ptr [rsp + 8]
00997 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
0099e 90                             nop        
0099f e83c20a9ff                     call       0x7f1e7f910860
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 448b542408                     mov        r10d, dword ptr [rsp + 8]
009b1 41c1e203                       shl        r10d, 3
009b5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ba 41c1e003                       shl        r8d, 3
009be 452bd0                         sub        r10d, r8d
009c1 4181c2c0000000                 add        r10d, 0xc0
009c8 c462a9f7d0                     shlx       r10, rax, r10
009cd e916faffff                     jmp        0x7f1e7fe7e268
009d2 4533d2                         xor        r10d, r10d
009d5 33ed                           xor        ebp, ebp
009d7 4533db                         xor        r11d, r11d
009da 4533c9                         xor        r9d, r9d
009dd 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009e5 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009ec 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
009f4 44898c24f0000000               mov        dword ptr [rsp + 0xf0], r9d
009fc e915fdffff                     jmp        0x7f1e7fe7e596
00a01 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a09 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a11 4d03c2                         add        r8, r10
00a14 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a1c 4d3bc2                         cmp        r8, r10
00a1f 7f29                           jg         0x7f1e7fe7e8ca
00a21 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a26 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a2e 0f85c4150000                   jne        0x7f1e7fe7fe78
00a34 418bc0                         mov        eax, r8d
00a37 4881c410010000                 add        rsp, 0x110
00a3e 5d                             pop        rbp
00a3f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a43 0f87f9160000                   ja         0x7f1e7fe7ffc2
00a49 c3                             ret        
00a4a 48be205d32e300000000           movabs     rsi, 0xe3325d20
00a54 666690                         nop        
00a57 e8841fa9ff                     call       0x7f1e7f910860
00a5c 0f1f8400540b0004               nop        dword ptr [rax + rax + 0x4000b54]
00a64 4885c0                         test       rax, rax
00a67 0f8477150000                   je         0x7f1e7fe7fe64
00a6d 488bf0                         mov        rsi, rax
00a70 4881c410010000                 add        rsp, 0x110
00a77 5d                             pop        rbp
00a78 e963c0b5ff                     jmp        0x7f1e7f9da960
00a7d 4533d2                         xor        r10d, r10d
00a80 4533db                         xor        r11d, r11d
00a83 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a88 e93ef7ffff                     jmp        0x7f1e7fe7e04b
00a8d bee4ffffff                     mov        esi, 0xffffffe4
00a92 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a9a 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a9f 44891424                       mov        dword ptr [rsp], r10d
00aa3 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00aa8 4489442404                     mov        dword ptr [rsp + 4], r8d
00aad 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00ab2 4489542408                     mov        dword ptr [rsp + 8], r10d
00ab7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00abc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ac1 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ac6 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00acb 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00ad0 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00ad5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ada 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00adf 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00ae4 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00ae9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00aee 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00af3 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00af8 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00afd 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00b02 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00b07 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00b0c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00b11 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00b16 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00b1b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b20 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b25 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00b2a 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00b2f 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00b34 44894c245c                     mov        dword ptr [rsp + 0x5c], r9d
00b39 6690                           nop        
00b3b e8a093b5ff                     call       0x7f1e7f9d7d60
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
00bf4 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00bf8 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00bfd 6690                           nop        
00bff e8dc92b5ff                     call       0x7f1e7f9d7d60
00c04 0f1f8400fc0c0006               nop        dword ptr [rax + rax + 0x6000cfc]
00c0c bee4ffffff                     mov        esi, 0xffffffe4
00c11 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c19 448b542408                     mov        r10d, dword ptr [rsp + 8]
00c1e 44891424                       mov        dword ptr [rsp], r10d
00c22 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00c27 44895c2404                     mov        dword ptr [rsp + 4], r11d
00c2c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c31 4489542408                     mov        dword ptr [rsp + 8], r10d
00c36 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c3b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c40 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c45 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00c4a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c4f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c54 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00c59 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00c5e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00c63 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00c68 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00c6d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00c72 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00c77 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00c7c 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00c81 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00c86 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00c8b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00c90 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00c95 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00c9a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00c9f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ca4 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00ca9 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00cae 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00cb3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cb8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00cc0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cc5 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00cca 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00ccf e80c92b5ff                     call       0x7f1e7f9d7d60
00cd4 0f1f8400cc0d0007               nop        dword ptr [rax + rax + 0x7000dcc]
00cdc 4533c9                         xor        r9d, r9d
00cdf 4d3bc1                         cmp        r8, r9
00ce2 bdffffffff                     mov        ebp, 0xffffffff
00ce7 7c08                           jl         0x7f1e7fe7eb71
00ce9 400f95c5                       setne      bpl
00ced 400fb6ed                       movzx      ebp, bpl
00cf1 be45ffffff                     mov        esi, 0xffffff45
00cf6 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00cfe 4c890c24                       mov        qword ptr [rsp], r9
00d02 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00d07 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00d0c 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00d14 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00d19 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00d1d 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00d21 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00d26 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00d2b 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00d2f 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00d33 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00d38 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00d3d 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00d41 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00d45 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00d4a 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00d4f 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
00d53 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00d57 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00d5f 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00d64 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00d68 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00d6c 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
00d71 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00d76 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00d7a 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00d7e 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d83 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d88 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d90 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d95 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d9d 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00da2 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00daa 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00db1 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00db9 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00dc1 6690                           nop        
00dc3 e81891b5ff                     call       0x7f1e7f9d7d60
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
00edb e80090b5ff                     call       0x7f1e7f9d7d60
00ee0 0f1f8400d80f0009               nop        dword ptr [rax + rax + 0x9000fd8]
00ee8 be45ffffff                     mov        esi, 0xffffff45
00eed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ef5 448b542408                     mov        r10d, dword ptr [rsp + 8]
00efa 44891424                       mov        dword ptr [rsp], r10d
00efe 44894c2408                     mov        dword ptr [rsp + 8], r9d
00f03 e8d88fb5ff                     call       0x7f1e7f9d7d60
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
00fe3 e8f88eb5ff                     call       0x7f1e7f9d7d60
00fe8 0f1f8400e010000b               nop        dword ptr [rax + rax + 0xb0010e0]
00ff0 be45ffffff                     mov        esi, 0xffffff45
00ff5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ffd 448b442408                     mov        r8d, dword ptr [rsp + 8]
01002 44890424                       mov        dword ptr [rsp], r8d
01006 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0100b 4489542404                     mov        dword ptr [rsp + 4], r10d
01010 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01015 4489442408                     mov        dword ptr [rsp + 8], r8d
0101a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01022 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01027 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0102c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01031 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01036 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0103b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01040 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01045 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0104a 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0104f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01054 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01059 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0105e 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01063 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01068 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0106d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01072 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01077 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0107c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01081 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01086 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0108b 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01090 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01095 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0109a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0109f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010a9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010b1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010b6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010be 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010c3 448b8424d4000000               mov        r8d, dword ptr [rsp + 0xd4]
010cb 4489442478                     mov        dword ptr [rsp + 0x78], r8d
010d0 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
010d8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010e0 666690                         nop        
010e3 e8f88db5ff                     call       0x7f1e7f9d7d60
010e8 0f1f8400e011000c               nop        dword ptr [rax + rax + 0xc0011e0]
010f0 be45ffffff                     mov        esi, 0xffffff45
010f5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010fd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01102 44891424                       mov        dword ptr [rsp], r10d
01106 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0110b 4489442404                     mov        dword ptr [rsp + 4], r8d
01110 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01115 4489542408                     mov        dword ptr [rsp + 8], r10d
0111a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01122 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01127 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0112c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01131 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01136 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0113b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01140 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01145 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0114a 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0114f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01154 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01159 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0115e 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01163 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01168 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0116d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01172 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01177 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0117c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01181 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01186 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0118b 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01190 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01195 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0119a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0119f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
011a4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
011a9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
011b1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
011b6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
011be 4c89542468                     mov        qword ptr [rsp + 0x68], r10
011c3 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011cb 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
011d2 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011da 90                             nop        
011db e8008db5ff                     call       0x7f1e7f9d7d60
011e0 0f1f8400d812000d               nop        dword ptr [rax + rax + 0xd0012d8]
011e8 be45ffffff                     mov        esi, 0xffffff45
011ed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011f5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011fa 44890c24                       mov        dword ptr [rsp], r9d
011fe 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01203 4489442404                     mov        dword ptr [rsp + 4], r8d
01208 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0120d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01212 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
0121a 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0121f 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01224 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01229 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0122e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01233 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01238 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0123d 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01242 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01247 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0124c 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01251 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01256 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0125b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01260 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01265 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0126a 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0126f 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01274 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01279 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0127e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01283 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01288 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0128d 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01292 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01297 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0129c 4c89442458                     mov        qword ptr [rsp + 0x58], r8
012a1 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
012a9 4c89442460                     mov        qword ptr [rsp + 0x60], r8
012ae 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
012b6 4c89442468                     mov        qword ptr [rsp + 0x68], r8
012bb 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012c0 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
012c7 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012cf 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
012d7 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
012df 4489942494000000               mov        dword ptr [rsp + 0x94], r10d
012e7 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
012ef 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
012f7 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
012ff 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
01307 e8d48bb5ff                     call       0x7f1e7f9d7d60
0130c 0f1f84000414000e               nop        dword ptr [rax + rax + 0xe001404]
01314 41b9ffffff7f                   mov        r9d, 0x7fffffff
0131a 4d3bc1                         cmp        r8, r9
0131d bdffffffff                     mov        ebp, 0xffffffff
01322 7c08                           jl         0x7f1e7fe7f1ac
01324 400f95c5                       setne      bpl
01328 400fb6ed                       movzx      ebp, bpl
0132c be45ffffff                     mov        esi, 0xffffff45
01331 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01339 4c890c24                       mov        qword ptr [rsp], r9
0133d 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
01341 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01345 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
0134d 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01352 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01356 894c2414                       mov        dword ptr [rsp + 0x14], ecx
0135a 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0135f 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01364 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
01368 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0136c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01371 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01376 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0137a 894c2438                       mov        dword ptr [rsp + 0x38], ecx
0137e 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01383 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
01388 8b4c246c                       mov        ecx, dword ptr [rsp + 0x6c]
0138c 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01390 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
01398 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
0139d 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
013a1 894c2450                       mov        dword ptr [rsp + 0x50], ecx
013a5 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
013aa 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
013af 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
013b3 894c2458                       mov        dword ptr [rsp + 0x58], ecx
013b7 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
013bc 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
013c1 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
013c9 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
013ce 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
013d6 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
013db 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
013e3 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
013ea 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013f2 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
013fa 90                             nop        
013fb e8e08ab5ff                     call       0x7f1e7f9d7d60
01400 0f1f8400f814000f               nop        dword ptr [rax + rax + 0xf0014f8]
01408 be45ffffff                     mov        esi, 0xffffff45
0140d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01415 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0141a 44890c24                       mov        dword ptr [rsp], r9d
0141e 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01423 44894c2404                     mov        dword ptr [rsp + 4], r9d
01428 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0142d 4489442408                     mov        dword ptr [rsp + 8], r8d
01432 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
0143a 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0143f 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01444 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01449 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0144e 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01453 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01458 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0145d 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01462 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01467 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0146c 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01471 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01476 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0147b 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01480 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01485 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0148a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0148f 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01494 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01499 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0149e 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
014a3 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
014a8 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
014ad 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
014b2 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
014b7 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
014bc 4c89442458                     mov        qword ptr [rsp + 0x58], r8
014c1 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
014c9 4c89442460                     mov        qword ptr [rsp + 0x60], r8
014ce 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
014d6 4c89442468                     mov        qword ptr [rsp + 0x68], r8
014db 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
014e0 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014e8 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
014f0 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
014f8 666690                         nop        
014fb e8e089b5ff                     call       0x7f1e7f9d7d60
01500 0f1f8400f8150010               nop        dword ptr [rax + rax + 0x100015f8]
01508 be45ffffff                     mov        esi, 0xffffff45
0150d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01515 448b542408                     mov        r10d, dword ptr [rsp + 8]
0151a 44891424                       mov        dword ptr [rsp], r10d
0151e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01523 4489542404                     mov        dword ptr [rsp + 4], r10d
01528 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0152d 4489442408                     mov        dword ptr [rsp + 8], r8d
01532 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0153a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0153f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01544 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01549 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0154e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01553 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01558 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0155d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01562 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01567 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0156c 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01571 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01576 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0157b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01580 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01585 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0158a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0158f 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01594 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01599 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0159e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
015a3 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
015a8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
015ad 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
015b2 4489442450                     mov        dword ptr [rsp + 0x50], r8d
015b7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
015bc 4c89542458                     mov        qword ptr [rsp + 0x58], r10
015c1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
015c9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
015ce 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
015d6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
015db 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
015e0 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
015e7 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
015ef 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
015f7 e8e488b5ff                     call       0x7f1e7f9d7d60
015fc 0f1f8400f4160011               nop        dword ptr [rax + rax + 0x110016f4]
01604 be3dffffff                     mov        esi, 0xffffff3d
01609 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01611 448b442408                     mov        r8d, dword ptr [rsp + 8]
01616 44890424                       mov        dword ptr [rsp], r8d
0161a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0161f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01624 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01629 4489442408                     mov        dword ptr [rsp + 8], r8d
0162e 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
01636 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0163b 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01640 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01645 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0164a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0164f 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01654 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01659 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0165e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01663 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01668 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0166d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01672 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01677 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0167c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01681 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01686 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0168b 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01690 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01695 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0169d 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
016a2 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
016a7 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
016ac 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
016b1 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
016b6 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
016bb 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
016c0 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
016c5 4c89442458                     mov        qword ptr [rsp + 0x58], r8
016ca 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
016d2 4c89442460                     mov        qword ptr [rsp + 0x60], r8
016d7 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
016df 4c89442468                     mov        qword ptr [rsp + 0x68], r8
016e4 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
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
0173f e89c87b5ff                     call       0x7f1e7f9d7d60
01744 0f1f84003c180012               nop        dword ptr [rax + rax + 0x1200183c]
0174c be45ffffff                     mov        esi, 0xffffff45
01751 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01759 448b442408                     mov        r8d, dword ptr [rsp + 8]
0175e 44890424                       mov        dword ptr [rsp], r8d
01762 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01767 4489442404                     mov        dword ptr [rsp + 4], r8d
0176c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01771 4489442408                     mov        dword ptr [rsp + 8], r8d
01776 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0177b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01780 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01785 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0178a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0178f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01794 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01799 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0179e 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
017a3 4489442428                     mov        dword ptr [rsp + 0x28], r8d
017a8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017ad 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017b2 894c2430                       mov        dword ptr [rsp + 0x30], ecx
017b6 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
017bb 4489442440                     mov        dword ptr [rsp + 0x40], r8d
017c0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
017c5 4489542444                     mov        dword ptr [rsp + 0x44], r10d
017ca 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
017cf 4489442448                     mov        dword ptr [rsp + 0x48], r8d
017d4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017dc 4c89542450                     mov        qword ptr [rsp + 0x50], r10
017e1 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
017e6 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
017eb 895c2464                       mov        dword ptr [rsp + 0x64], ebx
017ef e8ec86b5ff                     call       0x7f1e7f9d7d60
017f4 0f1f8400ec180013               nop        dword ptr [rax + rax + 0x130018ec]
017fc be45ffffff                     mov        esi, 0xffffff45
01801 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01809 448b542408                     mov        r10d, dword ptr [rsp + 8]
0180e 44891424                       mov        dword ptr [rsp], r10d
01812 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01817 44894c2404                     mov        dword ptr [rsp + 4], r9d
0181c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01821 4489542408                     mov        dword ptr [rsp + 8], r10d
01826 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0182b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01830 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01835 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0183a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0183f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01844 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01849 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0184e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01853 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01858 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0185d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01862 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01867 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0186c 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01871 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01876 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0187b 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01880 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01885 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0188a 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0188f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01894 4489442454                     mov        dword ptr [rsp + 0x54], r8d
01899 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0189e 90                             nop        
0189f e83c86b5ff                     call       0x7f1e7f9d7d60
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
019af e82c85b5ff                     call       0x7f1e7f9d7d60
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
01a9b e84084b5ff                     call       0x7f1e7f9d7d60
01aa0 0f1f8400981b0016               nop        dword ptr [rax + rax + 0x16001b98]
01aa8 4585c0                         test       r8d, r8d
01aab 7f07                           jg         0x7f1e7fe7f934
01aad 33c0                           xor        eax, eax
01aaf e90fe6ffff                     jmp        0x7f1e7fe7df43
01ab4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01ab8 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01abd 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01ac1 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01ac5 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01aca 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01acf 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01ad4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ad9 8b0424                         mov        eax, dword ptr [rsp]
01adc 89442404                       mov        dword ptr [rsp + 4], eax
01ae0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ae5 48894424f8                     mov        qword ptr [rsp - 8], rax
01aea 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01af1 890424                         mov        dword ptr [rsp], eax
01af4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af9 488bee                         mov        rbp, rsi
01afc 8b542408                       mov        edx, dword ptr [rsp + 8]
01b00 418bc8                         mov        ecx, r8d
01b03 e8d80ea9ff                     call       0x7f1e7f910860
01b08 0f1f8400001c0017               nop        dword ptr [rax + rax + 0x17001c00]
01b10 41bb40000000                   mov        r11d, 0x40
01b16 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01b1b c4e2a1f7c0                     shlx       rax, rax, r11
01b20 48894424f8                     mov        qword ptr [rsp - 8], rax
01b25 8b442404                       mov        eax, dword ptr [rsp + 4]
01b29 890424                         mov        dword ptr [rsp], eax
01b2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b31 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01b36 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b3b 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01b40 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01b44 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01b48 448b6c2428                     mov        r13d, dword ptr [rsp + 0x28]
01b4d 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b51 e96de5ffff                     jmp        0x7f1e7fe7df43
01b56 4585c0                         test       r8d, r8d
01b59 7f08                           jg         0x7f1e7fe7f9e3
01b5b 4533f6                         xor        r14d, r14d
01b5e e9a2e5ffff                     jmp        0x7f1e7fe7df85
01b63 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01b68 4889442430                     mov        qword ptr [rsp + 0x30], rax
01b6d 89542428                       mov        dword ptr [rsp + 0x28], edx
01b71 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
01b76 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01b7a 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01b7e 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01b83 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b88 48894424f8                     mov        qword ptr [rsp - 8], rax
01b8d 8b0424                         mov        eax, dword ptr [rsp]
01b90 89442404                       mov        dword ptr [rsp + 4], eax
01b94 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b99 48894424f8                     mov        qword ptr [rsp - 8], rax
01b9e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ba5 890424                         mov        dword ptr [rsp], eax
01ba8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bb5 488bf5                         mov        rsi, rbp
01bb8 8b542408                       mov        edx, dword ptr [rsp + 8]
01bbc 418bc8                         mov        ecx, r8d
01bbf 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01bc3 e8180ea9ff                     call       0x7f1e7f910860
01bc8 0f1f8400c01c0018               nop        dword ptr [rax + rax + 0x18001cc0]
01bd0 41ba80000000                   mov        r10d, 0x80
01bd6 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
01bdb c462a9f7f0                     shlx       r14, rax, r10
01be0 48894424f8                     mov        qword ptr [rsp - 8], rax
01be5 8b442404                       mov        eax, dword ptr [rsp + 4]
01be9 890424                         mov        dword ptr [rsp], eax
01bec 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf1 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01bf6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01bfb 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
01bff 448b6c241c                     mov        r13d, dword ptr [rsp + 0x1c]
01c04 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01c08 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01c0d 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01c12 e9eee4ffff                     jmp        0x7f1e7fe7df85
01c17 4533c0                         xor        r8d, r8d
01c1a e9eaedffff                     jmp        0x7f1e7fe7e889
01c1f bee4ffffff                     mov        esi, 0xffffffe4
01c24 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c2c 488f0424                       pop        qword ptr [rsp]
01c30 666690                         nop        
01c33 e8a882b5ff                     call       0x7f1e7f9d7d60
01c38 0f1f8400301d0019               nop        dword ptr [rax + rax + 0x19001d30]
01c40 be5d000000                     mov        esi, 0x5d
01c45 6690                           nop        
01c47 e89482b5ff                     call       0x7f1e7f9d7d60
01c4c 0f1f8400441d001a               nop        dword ptr [rax + rax + 0x1a001d44]
01c54 bef6ffffff                     mov        esi, 0xfffffff6
01c59 6690                           nop        
01c5b e88082b5ff                     call       0x7f1e7f9d7d60
01c60 0f1f8400581d001b               nop        dword ptr [rax + rax + 0x1b001d58]
01c68 bef6ffffff                     mov        esi, 0xfffffff6
01c6d 6690                           nop        
01c6f e86c82b5ff                     call       0x7f1e7f9d7d60
01c74 0f1f84006c1d001c               nop        dword ptr [rax + rax + 0x1c001d6c]
01c7c be6effffff                     mov        esi, 0xffffff6e
01c81 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c89 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c8e 44891424                       mov        dword ptr [rsp], r10d
01c92 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01c97 4489542408                     mov        dword ptr [rsp + 8], r10d
01c9c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ca1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ca6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01cab 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01cb0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01cb5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01cba 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01cbf 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01cc4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01cc9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01cce 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cd3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cd8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cdd 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01ce2 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ce7 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01cec 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01cf0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01cf5 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01cfa 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01cff 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01d04 666690                         nop        
01d07 e8d481b5ff                     call       0x7f1e7f9d7d60
01d0c 0f1f8400041e001d               nop        dword ptr [rax + rax + 0x1d001e04]
01d14 bee4ffffff                     mov        esi, 0xffffffe4
01d19 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d21 488f0424                       pop        qword ptr [rsp]
01d25 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01d2a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d2f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d36 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d3a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d3f 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d43 89542434                       mov        dword ptr [rsp + 0x34], edx
01d47 e89481b5ff                     call       0x7f1e7f9d7d60
01d4c 0f1f8400441e001e               nop        dword ptr [rax + rax + 0x1e001e44]
01d54 bee4ffffff                     mov        esi, 0xffffffe4
01d59 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d61 488f0424                       pop        qword ptr [rsp]
01d65 48894424f8                     mov        qword ptr [rsp - 8], rax
01d6a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d71 89442418                       mov        dword ptr [rsp + 0x18], eax
01d75 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d7a 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01d7e 89542430                       mov        dword ptr [rsp + 0x30], edx
01d82 4889442438                     mov        qword ptr [rsp + 0x38], rax
01d87 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01d8c 666690                         nop        
01d8f e84c81b5ff                     call       0x7f1e7f9d7d60
01d94 0f1f84008c1e001f               nop        dword ptr [rax + rax + 0x1f001e8c]
01d9c bebeffffff                     mov        esi, 0xffffffbe
01da1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01da9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01dae 44891424                       mov        dword ptr [rsp], r10d
01db2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01db7 4489542408                     mov        dword ptr [rsp + 8], r10d
01dbc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dc1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dc6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01dcb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01dd0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dd5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01dda 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01ddf 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01de4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01de9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01dee 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01df3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01df8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01dfd 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01e02 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01e07 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01e0c 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01e10 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01e15 4489542444                     mov        dword ptr [rsp + 0x44], r10d
01e1a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01e1f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01e24 666690                         nop        
01e27 e8b480b5ff                     call       0x7f1e7f9d7d60
01e2c 0f1f8400241f0020               nop        dword ptr [rax + rax + 0x20001f24]
01e34 beccffffff                     mov        esi, 0xffffffcc
01e39 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e41 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01e46 44890c24                       mov        dword ptr [rsp], r9d
01e4a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e4f 48894424f8                     mov        qword ptr [rsp - 8], rax
01e54 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e5b 89442414                       mov        dword ptr [rsp + 0x14], eax
01e5f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e64 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e69 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01e6e 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01e72 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01e76 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e7b e86080b5ff                     call       0x7f1e7f9d7d60
01e80 0f1f8400781f0021               nop        dword ptr [rax + rax + 0x21001f78]
01e88 beccffffff                     mov        esi, 0xffffffcc
01e8d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e95 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e9a 44891c24                       mov        dword ptr [rsp], r11d
01e9e 48894424f8                     mov        qword ptr [rsp - 8], rax
01ea3 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01eaa 89442410                       mov        dword ptr [rsp + 0x10], eax
01eae 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01eb3 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01eb8 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ebd 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01ec1 89542428                       mov        dword ptr [rsp + 0x28], edx
01ec5 4889442430                     mov        qword ptr [rsp + 0x30], rax
01eca 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01ecf 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ed4 666690                         nop        
01ed7 e80480b5ff                     call       0x7f1e7f9d7d60
01edc 0f1f8400d41f0022               nop        dword ptr [rax + rax + 0x22001fd4]
01ee4 be45ffffff                     mov        esi, 0xffffff45
01ee9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ef1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ef6 44891c24                       mov        dword ptr [rsp], r11d
01efa 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01eff 4489542404                     mov        dword ptr [rsp + 4], r10d
01f04 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f09 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f0e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f13 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f18 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01f1d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f22 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f27 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f2c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01f31 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01f36 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01f3b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01f40 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f45 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01f4a 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01f4f e88c7fb5ff                     call       0x7f1e7f9d7d60
01f54 0f1f84004c200023               nop        dword ptr [rax + rax + 0x2300204c]
01f5c be45ffffff                     mov        esi, 0xffffff45
01f61 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f69 448b542408                     mov        r10d, dword ptr [rsp + 8]
01f6e 44891424                       mov        dword ptr [rsp], r10d
01f72 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01f77 44895c2404                     mov        dword ptr [rsp + 4], r11d
01f7c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f81 4489542408                     mov        dword ptr [rsp + 8], r10d
01f86 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f8b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f90 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01f95 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01f9a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f9f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01fa4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01fa9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01fae 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01fb3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01fb8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01fbd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01fc2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01fc7 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01fcc 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01fd1 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01fd6 90                             nop        
01fd7 e8047fb5ff                     call       0x7f1e7f9d7d60
01fdc 0f1f8400d4200024               nop        dword ptr [rax + rax + 0x240020d4]
01fe4 bef6ffffff                     mov        esi, 0xfffffff6
01fe9 6690                           nop        
01feb e8f07eb5ff                     call       0x7f1e7f9d7d60
01ff0 0f1f8400e8200025               nop        dword ptr [rax + rax + 0x250020e8]
01ff8 be5d000000                     mov        esi, 0x5d
01ffd 6690                           nop        
01fff e8dc7eb5ff                     call       0x7f1e7f9d7d60
02004 0f1f8400fc200026               nop        dword ptr [rax + rax + 0x260020fc]
0200c be45ffffff                     mov        esi, 0xffffff45
02011 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02019 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0201e 44891c24                       mov        dword ptr [rsp], r11d
02022 894c2410                       mov        dword ptr [rsp + 0x10], ecx
02026 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0202b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
02030 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02035 4489542418                     mov        dword ptr [rsp + 0x18], r10d
0203a 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
02042 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
02047 4c89442450                     mov        qword ptr [rsp + 0x50], r8
0204c 666690                         nop        
0204f e88c7eb5ff                     call       0x7f1e7f9d7d60
02054 0f1f84004c210027               nop        dword ptr [rax + rax + 0x2700214c]
0205c bef6ffffff                     mov        esi, 0xfffffff6
02061 418be9                         mov        ebp, r9d
02064 666690                         nop        
02067 e8747eb5ff                     call       0x7f1e7f9d7d60
0206c 0f1f840064210028               nop        dword ptr [rax + rax + 0x28002164]
02074 bef6ffffff                     mov        esi, 0xfffffff6
02079 418bea                         mov        ebp, r10d
0207c 666690                         nop        
0207f e85c7eb5ff                     call       0x7f1e7f9d7d60
02084 0f1f84007c210029               nop        dword ptr [rax + rax + 0x2900217c]
0208c bef6ffffff                     mov        esi, 0xfffffff6
02091 418be8                         mov        ebp, r8d
02094 666690                         nop        
02097 e8447eb5ff                     call       0x7f1e7f9d7d60
0209c 0f1f84009421002a               nop        dword ptr [rax + rax + 0x2a002194]
020a4 bef6ffffff                     mov        esi, 0xfffffff6
020a9 6690                           nop        
020ab e8307eb5ff                     call       0x7f1e7f9d7d60
020b0 0f1f8400a821002b               nop        dword ptr [rax + rax + 0x2b0021a8]
020b8 bef6ffffff                     mov        esi, 0xfffffff6
020bd 6690                           nop        
020bf e81c7eb5ff                     call       0x7f1e7f9d7d60
020c4 0f1f8400bc21002c               nop        dword ptr [rax + rax + 0x2c0021bc]
020cc bef6ffffff                     mov        esi, 0xfffffff6
020d1 6690                           nop        
020d3 e8087eb5ff                     call       0x7f1e7f9d7d60
020d8 0f1f8400d021002d               nop        dword ptr [rax + rax + 0x2d0021d0]
020e0 bef6ffffff                     mov        esi, 0xfffffff6
020e5 6690                           nop        
020e7 e8f47db5ff                     call       0x7f1e7f9d7d60
020ec 0f1f8400e421002e               nop        dword ptr [rax + rax + 0x2e0021e4]
020f4 bef6ffffff                     mov        esi, 0xfffffff6
020f9 6690                           nop        
020fb e8e07db5ff                     call       0x7f1e7f9d7d60
02100 0f1f8400f821002f               nop        dword ptr [rax + rax + 0x2f0021f8]
02108 bef6ffffff                     mov        esi, 0xfffffff6
0210d 6690                           nop        
0210f e8cc7db5ff                     call       0x7f1e7f9d7d60
02114 0f1f84000c220030               nop        dword ptr [rax + rax + 0x3000220c]
0211c bef6ffffff                     mov        esi, 0xfffffff6
02121 6690                           nop        
02123 e8b87db5ff                     call       0x7f1e7f9d7d60
02128 0f1f840020220031               nop        dword ptr [rax + rax + 0x31002220]
02130 eb08                           jmp        0x7f1e7fe7ffba
02132 eb06                           jmp        0x7f1e7fe7ffba
02134 eb04                           jmp        0x7f1e7fe7ffba
02136 eb02                           jmp        0x7f1e7fe7ffba
02138 eb00                           jmp        0x7f1e7fe7ffba
0213a 488bf0                         mov        rsi, rax
0213d e92ee9ffff                     jmp        0x7f1e7fe7e8f0
02142 49babfe8e77f1e7f0000           movabs     r10, 0x7f1e7fe7e8bf
0214c 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02153 e9082fa9ff                     jmp        0x7f1e7f912ee0
02158 e8c3faa7ff                     call       0x7f1e7f8ffaa0
0215d e9bcdeffff                     jmp        0x7f1e7fe7de9e
02162 f4                             hlt        
02163 f4                             hlt        
02164 f4                             hlt        
02165 f4                             hlt        
02166 f4                             hlt        
02167 f4                             hlt        
