00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85761c0000                   jne        0x7f982fe70214
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
00050 0f83ff170000                   jae        0x7f982fe6fdd5
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f8411180000                   je         0x7f982fe6fdf4
00063 448bc2                         mov        r8d, edx
00066 442b442408                     sub        r8d, dword ptr [rsp + 8]
0006b 8b3c24                         mov        edi, dword ptr [rsp]
0006e 83c7f9                         add        edi, -7
00071 448d6af8                       lea        r13d, [rdx - 8]
00075 468d1cc500000000               lea        r11d, [r8*8]
0007d f3440fbdc9                     lzcnt      r9d, ecx
00082 be1f000000                     mov        esi, 0x1f
00087 412bf1                         sub        esi, r9d
0008a b908000000                     mov        ecx, 8
0008f 2bce                           sub        ecx, esi
00091 418bd3                         mov        edx, r11d
00094 2bd1                           sub        edx, ecx
00096 4183f808                       cmp        r8d, 8
0009a 0f8c38160000                   jl         0x7f982fe6fc58
000a0 85ff                           test       edi, edi
000a2 0f8c78190000                   jl         0x7f982fe6ffa0
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f836d180000                   jae        0x7f982fe6fea4
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8cac160000                   jl         0x7f982fe6fd0d
000e1 85ff                           test       edi, edi
000e3 0f8c83190000                   jl         0x7f982fe6ffec
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f836c180000                   jae        0x7f982fe6fee4
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00111 4585db                         test       r11d, r11d
00114 0f846e170000                   je         0x7f982fe6fe08
0011a 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
0011e 458b4104                       mov        r8d, dword ptr [r9 + 4]
00122 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00125 85db                           test       ebx, ebx
00127 0f846f170000                   je         0x7f982fe6fe1c
0012d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00132 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
0013a 4489542414                     mov        dword ptr [rsp + 0x14], r10d
0013f 4889442428                     mov        qword ptr [rsp + 0x28], rax
00144 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
0014b 8974240c                       mov        dword ptr [rsp + 0xc], esi
0014f 894c2424                       mov        dword ptr [rsp + 0x24], ecx
00153 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
00158 897c2404                       mov        dword ptr [rsp + 4], edi
0015c 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00164 45034304                       add        r8d, dword ptr [r11 + 4]
00168 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0016d 44034304                       add        r8d, dword ptr [rbx + 4]
00171 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00175 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
0017a 4c8bd3                         mov        r10, rbx
0017d 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00182 4d8bd3                         mov        r10, r11
00185 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0018a 4d8bd1                         mov        r10, r9
0018d 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00192 4585c0                         test       r8d, r8d
00195 0f84dc080000                   je         0x7f982fe6eff7
0019b be40000000                     mov        esi, 0x40
001a0 2bf1                           sub        esi, ecx
001a2 443bc6                         cmp        r8d, esi
001a5 0f8f1a020000                   jg         0x7f982fe6e945
001ab 412bf0                         sub        esi, r8d
001ae c4e2cbf7e8                     shrx       rbp, rax, rsi
001b3 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b8 4183f840                       cmp        r8d, 0x40
001bc 0f8db2190000                   jge        0x7f982fe700f4
001c2 41ba01000000                   mov        r10d, 1
001c8 c4c2b9f7ea                     shlx       rbp, r10, r8
001cd 48ffcd                         dec        rbp
001d0 48236c2460                     and        rbp, qword ptr [rsp + 0x60]
001d5 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001da 458bd0                         mov        r10d, r8d
001dd 458bca                         mov        r9d, r10d
001e0 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e5 458d4108                       lea        r8d, [r9 + 8]
001e9 4183f840                       cmp        r8d, 0x40
001ed 7c34                           jl         0x7f982fe6e7a3
001ef 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f4 4183c1c8                       add        r9d, -0x38
001f8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fd 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00205 8b542408                       mov        edx, dword ptr [rsp + 8]
00209 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020d 6690                           nop        
0020f e8ccd0a8ff                     call       0x7f982f8fb860
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7f982fe6e7d4
00223 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00228 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00230 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00235 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0023a 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00242 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0024a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0024f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00254 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00259 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0025d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00262 4183fb20                       cmp        r11d, 0x20
00266 0f8d50180000                   jge        0x7f982fe7003c
0026c c462a3f7542460                 shrx       r10, qword ptr [rsp + 0x60], r11
00273 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00278 41bb01000000                   mov        r11d, 1
0027e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00283 c44229f7d3                     shlx       r10d, r11d, r10d
00288 41ffca                         dec        r10d
0028b 4d63d2                         movsxd     r10, r10d
0028e 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00293 458bd2                         mov        r10d, r10d
00296 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0029b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002a0 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002a4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
002a9 4183fb20                       cmp        r11d, 0x20
002ad 0f8d4d180000                   jge        0x7f982fe70080
002b3 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002bb 458b5204                       mov        r10d, dword ptr [r10 + 4]
002bf 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002c7 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002cc 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002d0 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002d9 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002dd 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002e1 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002e6 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
002ea 458b4104                       mov        r8d, dword ptr [r9 + 4]
002ee 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
002f3 4585c9                         test       r9d, r9d
002f6 0f8e51150000                   jle        0x7f982fe6fdcd
002fc 41ffca                         dec        r10d
002ff 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00304 41ffcb                         dec        r11d
00307 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0030c 41ffc8                         dec        r8d
0030f 4489442474                     mov        dword ptr [rsp + 0x74], r8d
00314 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00319 c462a3f75c2468                 shrx       r11, qword ptr [rsp + 0x68], r11
00320 41ba01000000                   mov        r10d, 1
00326 8b6c2460                       mov        ebp, dword ptr [rsp + 0x60]
0032a c44251f7c2                     shlx       r8d, r10d, ebp
0032f 458bdb                         mov        r11d, r11d
00332 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00337 41ffc8                         dec        r8d
0033a 4d63d0                         movsxd     r10, r8d
0033d 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00342 458bd2                         mov        r10d, r10d
00345 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0034a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00352 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00359 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00361 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00368 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00370 458b5a04                       mov        r11d, dword ptr [r10 + 4]
00374 4585db                         test       r11d, r11d
00377 0f8633150000                   jbe        0x7f982fe6fe30
0037d 4d63d3                         movsxd     r10, r11d
00380 4d63d9                         movsxd     r11, r9d
00383 49ffcb                         dec        r11
00386 4d3bda                         cmp        r11, r10
00389 0f8321150000                   jae        0x7f982fe6fe30
0038f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00394 4585db                         test       r11d, r11d
00397 0f8c0f160000                   jl         0x7f982fe6ff2c
0039d 8b2c24                         mov        ebp, dword ptr [rsp]
003a0 83c5f9                         add        ebp, -7
003a3 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003aa 4533db                         xor        r11d, r11d
003ad 4533d2                         xor        r10d, r10d
003b0 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b8 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003c0 e982020000                     jmp        0x7f982fe6ebc7
003c5 418be8                         mov        ebp, r8d
003c8 2bee                           sub        ebp, esi
003ca 90                             nop        
003cb e810cfa8ff                     call       0x7f982f8fb860
003d0 0f1f8400c8040001               nop        dword ptr [rax + rax + 0x10004c8]
003d8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003dd 41bb40000000                   mov        r11d, 0x40
003e3 442bdd                         sub        r11d, ebp
003e6 c462d1f7c0                     shlx       r8, rax, rbp
003eb c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003f5 4d0bc2                         or         r8, r10
003f8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003fd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00402 e9d6fdffff                     jmp        0x7f982fe6e75d
00407 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
0040f 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00414 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00419 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00421 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00426 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0042a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0042e 6690                           nop        
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8dfc080000                   jge        0x7f982fe6f2bc
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bda                         mov        r11d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8da9090000                   jge        0x7f982fe6f39c
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bca                         mov        ecx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d800a0000                   jge        0x7f982fe6f49c
0049c c4e2d3f7df                     shrx       rbx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d5b0b0000                   jge        0x7f982fe6f5a0
004c5 41b801000000                   mov        r8d, 1
004cb c442d1f7c0                     shlx       r8, r8, rbp
004d0 49ffc8                         dec        r8
004d3 4c23c3                         and        r8, rbx
004d6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004de 418bd9                         mov        ebx, r9d
004e1 4103da                         add        ebx, r10d
004e4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004e9 458bd2                         mov        r10d, r10d
004ec 4403d1                         add        r10d, ecx
004ef 4c63cb                         movsxd     r9, ebx
004f2 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
004fa 8bc9                           mov        ecx, ecx
004fc 4c03c1                         add        r8, rcx
004ff 488b8c24e8000000               mov        rcx, qword ptr [rsp + 0xe8]
00507 4903c9                         add        rcx, r9
0050a 48898c24e8000000               mov        qword ptr [rsp + 0xe8], rcx
00512 4d85c0                         test       r8, r8
00515 0f8e31070000                   jle        0x7f982fe6f1cc
0051b 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00522 0f8fe80b0000                   jg         0x7f982fe6f690
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fd30c0000                   jg         0x7f982fe6f788
00535 81fbffff0300                   cmp        ebx, 0x3ffff
0053b 0f8f9b0d0000                   jg         0x7f982fe6f85c
00541 418bc8                         mov        ecx, r8d
00544 81f900000010                   cmp        ecx, 0x10000000
0054a 0f83600e0000                   jae        0x7f982fe6f930
00550 4d63d2                         movsxd     r10, r10d
00553 4c63c1                         movsxd     r8, ecx
00556 49c1e112                       shl        r9, 0x12
0055a 49c1e024                       shl        r8, 0x24
0055e 4d0bc1                         or         r8, r9
00561 4d0bc2                         or         r8, r10
00564 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0056c 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00574 4f8944ca08                     mov        qword ptr [r10 + r9*8 + 8], r8
00579 8b2c24                         mov        ebp, dword ptr [rsp]
0057c 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00580 0f8db0000000                   jge        0x7f982fe6ebb6
00586 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0058e 49c1e830                       shr        r8, 0x30
00592 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00597 49c1ea30                       shr        r10, 0x30
0059b 458bc8                         mov        r9d, r8d
0059e 418bca                         mov        ecx, r10d
005a1 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005a9 c4c22bf7db                     shrx       ebx, r11d, r10d
005ae 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005b6 c4422bf7d3                     shrx       r10d, r11d, r10d
005bb 4103ca                         add        ecx, r10d
005be 894c2460                       mov        dword ptr [rsp + 0x60], ecx
005c2 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005ca 4183fa20                       cmp        r10d, 0x20
005ce 0f8d000f0000                   jge        0x7f982fe6fa54
005d4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005dc 49c1ea30                       shr        r10, 0x30
005e0 458bc2                         mov        r8d, r10d
005e3 41ba01000000                   mov        r10d, 1
005e9 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
005f0 c44241f7d2                     shlx       r10d, r10d, edi
005f5 41ffca                         dec        r10d
005f8 4423d3                         and        r10d, ebx
005fb 4503d1                         add        r10d, r9d
005fe 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00603 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
0060b 4183f920                       cmp        r9d, 0x20
0060f 0f8d4f0f0000                   jge        0x7f982fe6fae4
00615 41b901000000                   mov        r9d, 1
0061b 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00623 c44229f7d1                     shlx       r10d, r9d, r10d
00628 41ffca                         dec        r10d
0062b 4523d3                         and        r10d, r11d
0062e 4503d0                         add        r10d, r8d
00631 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00636 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0063a 0f8d7a030000                   jge        0x7f982fe6ef3a
00640 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00647 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0064c 44235c2460                     and        r11d, dword ptr [rsp + 0x60]
00651 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00656 458b5014                       mov        r10d, dword ptr [r8 + 0x14]
0065a 458b4204                       mov        r8d, dword ptr [r10 + 4]
0065e 453bd8                         cmp        r11d, r8d
00661 0f8320040000                   jae        0x7f982fe6f007
00667 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0066c 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00671 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00675 8b5914                         mov        ebx, dword ptr [rcx + 0x14]
00678 448b4b04                       mov        r9d, dword ptr [rbx + 4]
0067c 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00681 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00686 453bc1                         cmp        r8d, r9d
00689 0f8381040000                   jae        0x7f982fe6f090
0068f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00694 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
00699 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0069e 458b4a14                       mov        r9d, dword ptr [r10 + 0x14]
006a2 418b4904                       mov        ecx, dword ptr [r9 + 4]
006a6 4e8b54c308                     mov        r10, qword ptr [rbx + r8*8 + 8]
006ab 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006b3 443bd9                         cmp        r11d, ecx
006b6 0f83e8040000                   jae        0x7f982fe6f124
006bc 4f8b54d908                     mov        r10, qword ptr [r9 + r11*8 + 8]
006c1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006c9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d0 ffc5                           inc        ebp
006d2 892c24                         mov        dword ptr [rsp], ebp
006d5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006d9 0f8d57030000                   jge        0x7f982fe6efb6
006df 49c1ea28                       shr        r10, 0x28
006e3 458bd2                         mov        r10d, r10d
006e6 450fb6da                       movzx      r11d, r10b
006ea 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006f2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006f7 49c1ea28                       shr        r10, 0x28
006fb 458bda                         mov        r11d, r10d
006fe 410fb6eb                       movzx      ebp, r11b
00702 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00709 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00711 49c1ea28                       shr        r10, 0x28
00715 458bda                         mov        r11d, r10d
00718 450fb6db                       movzx      r11d, r11b
0071c 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00724 4103eb                         add        ebp, r11d
00727 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0072e 41bb01000000                   mov        r11d, 1
00734 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0073c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00744 49c1ea20                       shr        r10, 0x20
00748 458bd2                         mov        r10d, r10d
0074b 410fb6ea                       movzx      ebp, r10b
0074f 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00756 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0075b 49c1ea20                       shr        r10, 0x20
0075f 458bda                         mov        r11d, r10d
00762 410fb6eb                       movzx      ebp, r11b
00766 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0076d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00775 49c1ea20                       shr        r10, 0x20
00779 458bd2                         mov        r10d, r10d
0077c 410fb6ea                       movzx      ebp, r10b
00780 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00787 8bcd                           mov        ecx, ebp
00789 038c24d4000000                 add        ecx, dword ptr [rsp + 0xd4]
00790 038c24d8000000                 add        ecx, dword ptr [rsp + 0xd8]
00797 038c24d0000000                 add        ecx, dword ptr [rsp + 0xd0]
0079e 85c9                           test       ecx, ecx
007a0 0f84c1020000                   je         0x7f982fe6efe7
007a6 83f93f                         cmp        ecx, 0x3f
007a9 0f8ffd0c0000                   jg         0x7f982fe6fa2c
007af 41b940000000                   mov        r9d, 0x40
007b5 442b4c243c                     sub        r9d, dword ptr [rsp + 0x3c]
007ba 413bc9                         cmp        ecx, r9d
007bd 7e48                           jle        0x7f982fe6ed87
007bf 448bc1                         mov        r8d, ecx
007c2 452bc1                         sub        r8d, r9d
007c5 4183f940                       cmp        r9d, 0x40
007c9 0f8d1d0e0000                   jge        0x7f982fe6fb6c
007cf 41ba01000000                   mov        r10d, 1
007d5 c442b1f7d2                     shlx       r10, r10, r9
007da 49ffca                         dec        r10
007dd 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007e5 c4c2b9f7ea                     shlx       rbp, r10, r8
007ea 41bb40000000                   mov        r11d, 0x40
007f0 452bd8                         sub        r11d, r8d
007f3 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007fa 490bea                         or         rbp, r10
007fd 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00805 eb26                           jmp        0x7f982fe6edad
00807 41ba01000000                   mov        r10d, 1
0080d c442f1f7d2                     shlx       r10, r10, rcx
00812 442bc9                         sub        r9d, ecx
00815 c4e2b3f7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], r9
0081f 49ffca                         dec        r10
00822 4923ea                         and        rbp, r10
00825 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0082d 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00832 4403d1                         add        r10d, ecx
00835 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0083a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0083f 4403d9                         add        r11d, ecx
00842 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00847 4183fb40                       cmp        r11d, 0x40
0084b 0f8cdffbffff                   jl         0x7f982fe6e9b0
00851 458d53c0                       lea        r10d, [r11 - 0x40]
00855 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0085a 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0085e 83c5f8                         add        ebp, -8
00861 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00865 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00869 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0086d 83c1f0                         add        ecx, -0x10
00870 83f908                         cmp        ecx, 8
00873 0f8cf3000000                   jl         0x7f982fe6eeec
00879 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0087e 4183c2e8                       add        r10d, -0x18
00882 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0088a 0f8277fbffff                   jb         0x7f982fe6e987
00890 bee4ffffff                     mov        esi, 0xffffffe4
00895 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0089d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
008a2 44891c24                       mov        dword ptr [rsp], r11d
008a6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008ab 44895c2404                     mov        dword ptr [rsp + 4], r11d
008b0 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
008b5 4489442408                     mov        dword ptr [rsp + 8], r8d
008ba 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
008bf 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
008c4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008c9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008ce 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
008d3 4489442418                     mov        dword ptr [rsp + 0x18], r8d
008d8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
008dd 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
008e2 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
008e7 4489442420                     mov        dword ptr [rsp + 0x20], r8d
008ec 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
008f1 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
008f6 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
008fb 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00900 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00905 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0090a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0090f 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00914 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00919 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0091e 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00923 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00928 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0092d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00932 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00937 4c895c2450                     mov        qword ptr [rsp + 0x50], r11
0093c 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00944 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00949 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00951 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00956 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0095e 90                             nop        
0095f e8fcd1b4ff                     call       0x7f982f9bc0e0
00964 0f1f84005c0a0002               nop        dword ptr [rax + rax + 0x2000a5c]
0096c 85c9                           test       ecx, ecx
0096e 7f08                           jg         0x7f982fe6eef8
00970 4533d2                         xor        r10d, r10d
00973 e99cfaffff                     jmp        0x7f982fe6e994
00978 8be9                           mov        ebp, ecx
0097a 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00982 8b542408                       mov        edx, dword ptr [rsp + 8]
00986 90                             nop        
00987 e854c9a8ff                     call       0x7f982f8fb860
0098c 0f1f8400840a0003               nop        dword ptr [rax + rax + 0x3000a84]
00994 448b542408                     mov        r10d, dword ptr [rsp + 8]
00999 41c1e203                       shl        r10d, 3
0099d 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009a2 41c1e003                       shl        r8d, 3
009a6 452bd0                         sub        r10d, r8d
009a9 4181c2c0000000                 add        r10d, 0xc0
009b0 c462a9f7d0                     shlx       r10, rax, r10
009b5 e95afaffff                     jmp        0x7f982fe6e994
009ba 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009c2 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009ca 4d03c2                         add        r8, r10
009cd 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009d5 4d3bc2                         cmp        r8, r10
009d8 7e33                           jle        0x7f982fe6ef8d
009da 48be085529e300000000           movabs     rsi, 0xe3295508
009e4 666690                         nop        
009e7 e8f4c8a8ff                     call       0x7f982f8fb860
009ec 0f1f8400e40a0004               nop        dword ptr [rax + rax + 0x4000ae4]
009f4 4885c0                         test       rax, rax
009f7 0f844f110000                   je         0x7f982fe700cc
009fd 488bf0                         mov        rsi, rax
00a00 4881c410010000                 add        rsp, 0x110
00a07 5d                             pop        rbp
00a08 e95378b5ff                     jmp        0x7f982f9c67e0
00a0d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a12 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a1a 0f8540110000                   jne        0x7f982fe700e0
00a20 418bc0                         mov        eax, r8d
00a23 4881c410010000                 add        rsp, 0x110
00a2a 5d                             pop        rbp
00a2b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a2f 0f8749120000                   ja         0x7f982fe701fe
00a35 c3                             ret        
00a36 4533db                         xor        r11d, r11d
00a39 4533d2                         xor        r10d, r10d
00a3c 4533c9                         xor        r9d, r9d
00a3f 4533c0                         xor        r8d, r8d
00a42 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00a4a 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00a52 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
00a5a 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00a62 e9d5fcffff                     jmp        0x7f982fe6ecbc
00a67 4533d2                         xor        r10d, r10d
00a6a 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a72 e9b9f9ffff                     jmp        0x7f982fe6e9b0
00a77 4533d2                         xor        r10d, r10d
00a7a 4533db                         xor        r11d, r11d
00a7d 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a82 e956f7ffff                     jmp        0x7f982fe6e75d
00a87 bee4ffffff                     mov        esi, 0xffffffe4
00a8c 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a94 448b442408                     mov        r8d, dword ptr [rsp + 8]
00a99 44890424                       mov        dword ptr [rsp], r8d
00a9d 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00aa2 44894c2404                     mov        dword ptr [rsp + 4], r9d
00aa7 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00aac 4489442408                     mov        dword ptr [rsp + 8], r8d
00ab1 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00ab6 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00abb 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00ac0 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00ac5 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00aca 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00acf 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ad4 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ad9 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ade 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ae3 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ae8 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00aed 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00af2 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00af7 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00afc 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b01 6690                           nop        
00b03 e858d0b4ff                     call       0x7f982f9bc0e0
00b08 0f1f8400000c0005               nop        dword ptr [rax + rax + 0x5000c00]
00b10 bee4ffffff                     mov        esi, 0xffffffe4
00b15 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b1d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b22 44891424                       mov        dword ptr [rsp], r10d
00b26 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b2b 44895c2404                     mov        dword ptr [rsp + 4], r11d
00b30 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b35 4489542408                     mov        dword ptr [rsp + 8], r10d
00b3a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b3f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b44 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b49 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00b4e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b53 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b58 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b5d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b62 894c2428                       mov        dword ptr [rsp + 0x28], ecx
00b66 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b6b 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b70 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b75 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b7a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b7f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b84 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b89 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b8e 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00b92 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b97 e8c4cfb4ff                     call       0x7f982f9bc0e0
00b9c 0f1f8400940c0006               nop        dword ptr [rax + rax + 0x6000c94]
00ba4 bee4ffffff                     mov        esi, 0xffffffe4
00ba9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bb1 448b542408                     mov        r10d, dword ptr [rsp + 8]
00bb6 44891424                       mov        dword ptr [rsp], r10d
00bba 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00bbf 4489442404                     mov        dword ptr [rsp + 4], r8d
00bc4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00bc9 4489542408                     mov        dword ptr [rsp + 8], r10d
00bce 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bd3 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bd8 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00bdd 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00be2 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00be7 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00bec 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00bf1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00bf6 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00bfb 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00c00 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c05 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c0a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00c0f 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00c14 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c19 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c1e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c23 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00c28 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c2d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00c32 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c37 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c3c 666690                         nop        
00c3f e81ccfb4ff                     call       0x7f982f9bc0e0
00c44 0f1f84003c0d0007               nop        dword ptr [rax + rax + 0x7000d3c]
00c4c 4533c9                         xor        r9d, r9d
00c4f 4d3bc1                         cmp        r8, r9
00c52 bdffffffff                     mov        ebp, 0xffffffff
00c57 7c08                           jl         0x7f982fe6f1e1
00c59 400f95c5                       setne      bpl
00c5d 400fb6ed                       movzx      ebp, bpl
00c61 be45ffffff                     mov        esi, 0xffffff45
00c66 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c6e 4c890c24                       mov        qword ptr [rsp], r9
00c72 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00c76 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00c7a 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c82 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c87 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00c8b 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00c8f 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c94 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c99 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00c9d 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00ca1 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00ca6 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cab 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00caf 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00cb3 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cb8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00cbd 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00cc1 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00cc5 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00ccd 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00cd2 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00cd6 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00cda 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00cdf 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00ce4 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00ce8 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00cec 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00cf1 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00cf6 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00cfe 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d03 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d0b 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d10 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d18 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d1f 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d27 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d2f e82cceb4ff                     call       0x7f982f9bc0e0
00d34 0f1f84002c0e0008               nop        dword ptr [rax + rax + 0x8000e2c]
00d3c be45ffffff                     mov        esi, 0xffffff45
00d41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d49 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d4e 44891c24                       mov        dword ptr [rsp], r11d
00d52 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d57 4489542404                     mov        dword ptr [rsp + 4], r10d
00d5c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d61 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d66 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00d6e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d73 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d78 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d7d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d82 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d87 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d8c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d91 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d96 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d9b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00da0 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00da5 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00daa 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00daf 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00db4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00db9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00dbe 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00dc3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00dc8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00dcd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00dd2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00dd7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ddc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00de1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00de6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00deb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00df0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00df5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00dfd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e02 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e0a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e0f e84ccdb4ff                     call       0x7f982f9bc0e0
00e14 0f1f84000c0f0009               nop        dword ptr [rax + rax + 0x9000f0c]
00e1c be45ffffff                     mov        esi, 0xffffff45
00e21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e29 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e2e 44891424                       mov        dword ptr [rsp], r10d
00e32 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00e37 4489442404                     mov        dword ptr [rsp + 4], r8d
00e3c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e41 4489542408                     mov        dword ptr [rsp + 8], r10d
00e46 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e4e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e53 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e58 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e5d 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00e62 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00e67 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00e6c 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00e71 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00e76 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00e7b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e80 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e85 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00e8a 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00e8f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e94 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e99 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00e9e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00ea3 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ea8 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ead 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00eb2 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00eb7 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00ebc 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00ec1 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00ec6 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ecb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ed0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ed5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00edd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ee2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00eea 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00eef 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00ef7 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00efc 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f04 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00f0c 666690                         nop        
00f0f e84cccb4ff                     call       0x7f982f9bc0e0
00f14 0f1f84000c10000a               nop        dword ptr [rax + rax + 0xa00100c]
00f1c be45ffffff                     mov        esi, 0xffffff45
00f21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f29 448b442408                     mov        r8d, dword ptr [rsp + 8]
00f2e 44890424                       mov        dword ptr [rsp], r8d
00f32 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f37 4489542404                     mov        dword ptr [rsp + 4], r10d
00f3c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00f41 4489442408                     mov        dword ptr [rsp + 8], r8d
00f46 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f4e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f53 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f58 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f5d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f62 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f67 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00f6c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00f71 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f76 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f7b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00f80 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00f85 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f8a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f8f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00f94 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00f99 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f9e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00fa3 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00fa8 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00fad 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00fb2 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00fb7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00fbc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00fc1 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
00fc6 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00fcb 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fd0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fd5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fdd 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fe2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fea 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fef 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
00ff7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
00ffc 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01004 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0100b 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01013 e848cbb4ff                     call       0x7f982f9bc0e0
01018 0f1f84001011000b               nop        dword ptr [rax + rax + 0xb001110]
01020 be45ffffff                     mov        esi, 0xffffff45
01025 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0102d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01032 44890424                       mov        dword ptr [rsp], r8d
01036 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0103b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01040 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01045 4489442408                     mov        dword ptr [rsp + 8], r8d
0104a 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0104f 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01054 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01059 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0105e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01063 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01068 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0106d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01072 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01077 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0107c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01081 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01086 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0108b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01090 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01095 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0109a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0109f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
010a4 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
010a9 4489442448                     mov        dword ptr [rsp + 0x48], r8d
010ae 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
010b3 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
010b8 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
010bd 4489442450                     mov        dword ptr [rsp + 0x50], r8d
010c2 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
010c7 4c89442458                     mov        qword ptr [rsp + 0x58], r8
010cc 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
010d4 4c89442460                     mov        qword ptr [rsp + 0x60], r8
010d9 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
010e1 4c89442468                     mov        qword ptr [rsp + 0x68], r8
010e6 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
010eb 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
010f2 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
010fa 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
01102 90                             nop        
01103 e858cab4ff                     call       0x7f982f9bc0e0
01108 0f1f84000012000c               nop        dword ptr [rax + rax + 0xc001200]
01110 41b9ffffff7f                   mov        r9d, 0x7fffffff
01116 4d3bc1                         cmp        r8, r9
01119 bdffffffff                     mov        ebp, 0xffffffff
0111e 7c08                           jl         0x7f982fe6f6a8
01120 400f95c5                       setne      bpl
01124 400fb6ed                       movzx      ebp, bpl
01128 be45ffffff                     mov        esi, 0xffffff45
0112d 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01135 4c890c24                       mov        qword ptr [rsp], r9
01139 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
0113d 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01141 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01149 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0114e 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01153 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01158 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
0115c 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01160 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01165 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0116a 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
0116e 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01172 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01177 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0117c 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01180 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01184 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01189 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0118e 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01195 894c2444                       mov        dword ptr [rsp + 0x44], ecx
01199 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0119e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
011a3 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
011a7 894c2454                       mov        dword ptr [rsp + 0x54], ecx
011ab 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
011b0 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
011b5 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
011ba 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
011bf 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
011c7 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
011cc 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
011d4 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
011d9 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011e1 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
011e8 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
011f0 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
011f8 666690                         nop        
011fb e860c9b4ff                     call       0x7f982f9bc0e0
01200 0f1f8400f812000d               nop        dword ptr [rax + rax + 0xd0012f8]
01208 be45ffffff                     mov        esi, 0xffffff45
0120d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01215 448b442408                     mov        r8d, dword ptr [rsp + 8]
0121a 44890424                       mov        dword ptr [rsp], r8d
0121e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01223 4489442404                     mov        dword ptr [rsp + 4], r8d
01228 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0122d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01232 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01237 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0123c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01241 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01246 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0124b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01250 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01255 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0125a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0125f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01264 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01269 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0126e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01273 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01278 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0127d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01282 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01287 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0128c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01291 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01296 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0129b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
012a0 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
012a5 4489442450                     mov        dword ptr [rsp + 0x50], r8d
012aa 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
012af 4c89442458                     mov        qword ptr [rsp + 0x58], r8
012b4 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
012bc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
012c1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012c6 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
012ce 90                             nop        
012cf e88cc8b4ff                     call       0x7f982f9bc0e0
012d4 0f1f8400cc13000e               nop        dword ptr [rax + rax + 0xe0013cc]
012dc be45ffffff                     mov        esi, 0xffffff45
012e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012e9 448b442408                     mov        r8d, dword ptr [rsp + 8]
012ee 44890424                       mov        dword ptr [rsp], r8d
012f2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
012f7 4489442404                     mov        dword ptr [rsp + 4], r8d
012fc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01301 4489542408                     mov        dword ptr [rsp + 8], r10d
01306 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0130b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01310 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01315 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0131a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0131f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01324 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01329 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0132e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01333 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01338 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0133d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01342 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01347 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0134c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01351 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01356 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0135b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01360 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01365 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0136a 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0136f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01374 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01379 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0137e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01383 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01388 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01390 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01395 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0139a 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
013a1 6690                           nop        
013a3 e8b8c7b4ff                     call       0x7f982f9bc0e0
013a8 0f1f8400a014000f               nop        dword ptr [rax + rax + 0xf0014a0]
013b0 be3dffffff                     mov        esi, 0xffffff3d
013b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013bd 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
013c2 44890c24                       mov        dword ptr [rsp], r9d
013c6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
013cb 44894c2404                     mov        dword ptr [rsp + 4], r9d
013d0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
013d5 4489442408                     mov        dword ptr [rsp + 8], r8d
013da 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
013df 4c89442418                     mov        qword ptr [rsp + 0x18], r8
013e4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
013e9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
013ee 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
013f3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
013f8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
013fd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01402 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01407 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0140c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01411 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01416 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0141b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01420 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01425 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0142a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0142f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01434 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0143c 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01441 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01446 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0144b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01450 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01455 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0145a 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0145f 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01464 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01469 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01471 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01476 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0147e 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01483 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01488 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01490 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01497 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0149e 90                             nop        
0149f e8bcc6b4ff                     call       0x7f982f9bc0e0
014a4 0f1f84009c150010               nop        dword ptr [rax + rax + 0x1000159c]
014ac be45ffffff                     mov        esi, 0xffffff45
014b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014b9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
014be 44891c24                       mov        dword ptr [rsp], r11d
014c2 894c2408                       mov        dword ptr [rsp + 8], ecx
014c6 90                             nop        
014c7 e894c6b4ff                     call       0x7f982f9bc0e0
014cc 0f1f8400c4150011               nop        dword ptr [rax + rax + 0x110015c4]
014d4 be45ffffff                     mov        esi, 0xffffff45
014d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014e1 448b542408                     mov        r10d, dword ptr [rsp + 8]
014e6 44891424                       mov        dword ptr [rsp], r10d
014ea 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014ef 4489542404                     mov        dword ptr [rsp + 4], r10d
014f4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014f9 4489542408                     mov        dword ptr [rsp + 8], r10d
014fe 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01503 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01508 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0150d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01512 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01517 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0151c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01521 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01526 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0152b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01530 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01535 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0153a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0153e 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01543 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01548 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
0154d 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01552 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01556 90                             nop        
01557 e804c6b4ff                     call       0x7f982f9bc0e0
0155c 0f1f840054160012               nop        dword ptr [rax + rax + 0x12001654]
01564 be45ffffff                     mov        esi, 0xffffff45
01569 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01571 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01576 44890c24                       mov        dword ptr [rsp], r9d
0157a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0157f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01584 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01589 44894c2408                     mov        dword ptr [rsp + 8], r9d
0158e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01593 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01598 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0159d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
015a2 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
015a7 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
015ac 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
015b1 4489542424                     mov        dword ptr [rsp + 0x24], r10d
015b6 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
015bb 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
015c0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
015c5 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
015ca 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
015cf 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
015d4 4489442454                     mov        dword ptr [rsp + 0x54], r8d
015d9 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
015de 90                             nop        
015df e87cc5b4ff                     call       0x7f982f9bc0e0
015e4 0f1f8400dc160013               nop        dword ptr [rax + rax + 0x130016dc]
015ec be45ffffff                     mov        esi, 0xffffff45
015f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015f9 448b542408                     mov        r10d, dword ptr [rsp + 8]
015fe 44891424                       mov        dword ptr [rsp], r10d
01602 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01607 4489542404                     mov        dword ptr [rsp + 4], r10d
0160c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01611 4489542408                     mov        dword ptr [rsp + 8], r10d
01616 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0161b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01620 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01625 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0162a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0162f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01634 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01639 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0163e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01643 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01648 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0164d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01652 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01657 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0165c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01661 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01666 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0166b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01670 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01675 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0167a 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0167f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01684 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01689 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0168e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01693 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01698 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
016a0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
016a5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
016ad 4c89542468                     mov        qword ptr [rsp + 0x68], r10
016b2 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
016b9 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
016c1 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
016c9 6690                           nop        
016cb e890c4b4ff                     call       0x7f982f9bc0e0
016d0 0f1f8400c8170014               nop        dword ptr [rax + rax + 0x140017c8]
016d8 4585c0                         test       r8d, r8d
016db 7f07                           jg         0x7f982fe6fc64
016dd 33c0                           xor        eax, eax
016df e9e3e9ffff                     jmp        0x7f982fe6e647
016e4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
016e8 89742428                       mov        dword ptr [rsp + 0x28], esi
016ec 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
016f0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
016f5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
016fa 897c2410                       mov        dword ptr [rsp + 0x10], edi
016fe 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01703 48894424f8                     mov        qword ptr [rsp - 8], rax
01708 8b0424                         mov        eax, dword ptr [rsp]
0170b 89442404                       mov        dword ptr [rsp + 4], eax
0170f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01714 48894424f8                     mov        qword ptr [rsp - 8], rax
01719 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01720 890424                         mov        dword ptr [rsp], eax
01723 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01728 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01730 488bf5                         mov        rsi, rbp
01733 8b542408                       mov        edx, dword ptr [rsp + 8]
01737 418bc8                         mov        ecx, r8d
0173a 90                             nop        
0173b e8a0bba8ff                     call       0x7f982f8fb860
01740 0f1f840038180015               nop        dword ptr [rax + rax + 0x15001838]
01748 41ba40000000                   mov        r10d, 0x40
0174e 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01753 c4e2a9f7c0                     shlx       rax, rax, r10
01758 48894424f8                     mov        qword ptr [rsp - 8], rax
0175d 8b442404                       mov        eax, dword ptr [rsp + 4]
01761 890424                         mov        dword ptr [rsp], eax
01764 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01769 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0176e 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01772 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01777 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
0177c 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
01780 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01784 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01788 e93ae9ffff                     jmp        0x7f982fe6e647
0178d 4585c0                         test       r8d, r8d
01790 7f08                           jg         0x7f982fe6fd1a
01792 4533f6                         xor        r14d, r14d
01795 e96ee9ffff                     jmp        0x7f982fe6e688
0179a 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0179f 4889442430                     mov        qword ptr [rsp + 0x30], rax
017a4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
017a8 89742428                       mov        dword ptr [rsp + 0x28], esi
017ac 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
017b0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
017b5 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
017ba 897c2410                       mov        dword ptr [rsp + 0x10], edi
017be 448944240c                     mov        dword ptr [rsp + 0xc], r8d
017c3 48894424f8                     mov        qword ptr [rsp - 8], rax
017c8 8b0424                         mov        eax, dword ptr [rsp]
017cb 89442404                       mov        dword ptr [rsp + 4], eax
017cf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017d4 48894424f8                     mov        qword ptr [rsp - 8], rax
017d9 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
017e0 890424                         mov        dword ptr [rsp], eax
017e3 488b4424f8                     mov        rax, qword ptr [rsp - 8]
017e8 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017f0 488bf5                         mov        rsi, rbp
017f3 8b542408                       mov        edx, dword ptr [rsp + 8]
017f7 418bc8                         mov        ecx, r8d
017fa 90                             nop        
017fb e8e0baa8ff                     call       0x7f982f8fb860
01800 0f1f8400f8180016               nop        dword ptr [rax + rax + 0x160018f8]
01808 41ba80000000                   mov        r10d, 0x80
0180e 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01813 c462a9f7f0                     shlx       r14, rax, r10
01818 48894424f8                     mov        qword ptr [rsp - 8], rax
0181d 8b442404                       mov        eax, dword ptr [rsp + 4]
01821 890424                         mov        dword ptr [rsp], eax
01824 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01829 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
0182d 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01832 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
01836 8b742428                       mov        esi, dword ptr [rsp + 0x28]
0183a 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
0183e 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01843 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01848 e9bbe8ffff                     jmp        0x7f982fe6e688
0184d 4533c0                         xor        r8d, r8d
01850 e96df1ffff                     jmp        0x7f982fe6ef42
01855 bee4ffffff                     mov        esi, 0xffffffe4
0185a 48ffb42490000000               push       qword ptr [rsp + 0x90]
01862 488f0424                       pop        qword ptr [rsp]
01866 90                             nop        
01867 e8f4c2b4ff                     call       0x7f982f9bc0e0
0186c 0f1f840064190017               nop        dword ptr [rax + rax + 0x17001964]
01874 be5d000000                     mov        esi, 0x5d
01879 6690                           nop        
0187b e8e0c2b4ff                     call       0x7f982f9bc0e0
01880 0f1f840078190018               nop        dword ptr [rax + rax + 0x18001978]
01888 bef6ffffff                     mov        esi, 0xfffffff6
0188d 6690                           nop        
0188f e8ccc2b4ff                     call       0x7f982f9bc0e0
01894 0f1f84008c190019               nop        dword ptr [rax + rax + 0x1900198c]
0189c bef6ffffff                     mov        esi, 0xfffffff6
018a1 6690                           nop        
018a3 e8b8c2b4ff                     call       0x7f982f9bc0e0
018a8 0f1f8400a019001a               nop        dword ptr [rax + rax + 0x1a0019a0]
018b0 be6effffff                     mov        esi, 0xffffff6e
018b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018bd 448b542408                     mov        r10d, dword ptr [rsp + 8]
018c2 44891424                       mov        dword ptr [rsp], r10d
018c6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
018cb 4489542408                     mov        dword ptr [rsp + 8], r10d
018d0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018d5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018da 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
018df 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018e4 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018e9 4489542420                     mov        dword ptr [rsp + 0x20], r10d
018ee 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
018f3 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
018f8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
018fd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01902 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01907 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0190c 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01911 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01916 90                             nop        
01917 e844c2b4ff                     call       0x7f982f9bc0e0
0191c 0f1f8400141a001b               nop        dword ptr [rax + rax + 0x1b001a14]
01924 bee4ffffff                     mov        esi, 0xffffffe4
01929 48ffb42490000000               push       qword ptr [rsp + 0x90]
01931 488f0424                       pop        qword ptr [rsp]
01935 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
0193a 48894424f8                     mov        qword ptr [rsp - 8], rax
0193f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01946 8944241c                       mov        dword ptr [rsp + 0x1c], eax
0194a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0194f 894c2428                       mov        dword ptr [rsp + 0x28], ecx
01953 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01957 e804c2b4ff                     call       0x7f982f9bc0e0
0195c 0f1f8400541a001c               nop        dword ptr [rax + rax + 0x1c001a54]
01964 bee4ffffff                     mov        esi, 0xffffffe4
01969 48ffb42490000000               push       qword ptr [rsp + 0x90]
01971 488f0424                       pop        qword ptr [rsp]
01975 48894424f8                     mov        qword ptr [rsp - 8], rax
0197a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01981 89442418                       mov        dword ptr [rsp + 0x18], eax
01985 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198a 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
0198e 89542428                       mov        dword ptr [rsp + 0x28], edx
01992 4889442430                     mov        qword ptr [rsp + 0x30], rax
01997 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0199c 666690                         nop        
0199f e8bcc1b4ff                     call       0x7f982f9bc0e0
019a4 0f1f84009c1a001d               nop        dword ptr [rax + rax + 0x1d001a9c]
019ac bebeffffff                     mov        esi, 0xffffffbe
019b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019b9 448b542408                     mov        r10d, dword ptr [rsp + 8]
019be 44891424                       mov        dword ptr [rsp], r10d
019c2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
019c7 4489542408                     mov        dword ptr [rsp + 8], r10d
019cc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
019d1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
019d6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
019db 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
019e0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
019e5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
019ea 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
019ef 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
019f4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
019f9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
019fe 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a03 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01a08 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a0d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01a12 90                             nop        
01a13 e848c1b4ff                     call       0x7f982f9bc0e0
01a18 0f1f8400101b001e               nop        dword ptr [rax + rax + 0x1e001b10]
01a20 beccffffff                     mov        esi, 0xffffffcc
01a25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a2d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a32 44891c24                       mov        dword ptr [rsp], r11d
01a36 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01a3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a47 89442414                       mov        dword ptr [rsp + 0x14], eax
01a4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a50 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01a54 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01a58 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01a5c 666690                         nop        
01a5f e8fcc0b4ff                     call       0x7f982f9bc0e0
01a64 0f1f84005c1b001f               nop        dword ptr [rax + rax + 0x1f001b5c]
01a6c beccffffff                     mov        esi, 0xffffffcc
01a71 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a79 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a7e 44891c24                       mov        dword ptr [rsp], r11d
01a82 48894424f8                     mov        qword ptr [rsp - 8], rax
01a87 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a8e 89442410                       mov        dword ptr [rsp + 0x10], eax
01a92 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a97 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01a9b 89542418                       mov        dword ptr [rsp + 0x18], edx
01a9f 4889442428                     mov        qword ptr [rsp + 0x28], rax
01aa4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01aa9 897c2434                       mov        dword ptr [rsp + 0x34], edi
01aad 6690                           nop        
01aaf e8acc0b4ff                     call       0x7f982f9bc0e0
01ab4 0f1f8400ac1b0020               nop        dword ptr [rax + rax + 0x20001bac]
01abc be45ffffff                     mov        esi, 0xffffff45
01ac1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ac9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ace 44891c24                       mov        dword ptr [rsp], r11d
01ad2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ad7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01adc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ae1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ae6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01aeb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01af0 666690                         nop        
01af3 e868c0b4ff                     call       0x7f982f9bc0e0
01af8 0f1f8400f01b0021               nop        dword ptr [rax + rax + 0x21001bf0]
01b00 be45ffffff                     mov        esi, 0xffffff45
01b05 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b0d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b12 44891424                       mov        dword ptr [rsp], r10d
01b16 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b1b 4489542408                     mov        dword ptr [rsp + 8], r10d
01b20 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b25 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b2a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b2f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b34 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b39 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b3e 90                             nop        
01b3f e81cc0b4ff                     call       0x7f982f9bc0e0
01b44 0f1f84003c1c0022               nop        dword ptr [rax + rax + 0x22001c3c]
01b4c bef6ffffff                     mov        esi, 0xfffffff6
01b51 6690                           nop        
01b53 e808c0b4ff                     call       0x7f982f9bc0e0
01b58 0f1f8400501c0023               nop        dword ptr [rax + rax + 0x23001c50]
01b60 be5d000000                     mov        esi, 0x5d
01b65 6690                           nop        
01b67 e8f4bfb4ff                     call       0x7f982f9bc0e0
01b6c 0f1f8400641c0024               nop        dword ptr [rax + rax + 0x24001c64]
01b74 be45ffffff                     mov        esi, 0xffffff45
01b79 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b81 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b86 44891c24                       mov        dword ptr [rsp], r11d
01b8a 90                             nop        
01b8b e8d0bfb4ff                     call       0x7f982f9bc0e0
01b90 0f1f8400881c0025               nop        dword ptr [rax + rax + 0x25001c88]
01b98 bef6ffffff                     mov        esi, 0xfffffff6
01b9d 418beb                         mov        ebp, r11d
01ba0 666690                         nop        
01ba3 e8b8bfb4ff                     call       0x7f982f9bc0e0
01ba8 0f1f8400a01c0026               nop        dword ptr [rax + rax + 0x26001ca0]
01bb0 bef6ffffff                     mov        esi, 0xfffffff6
01bb5 418be8                         mov        ebp, r8d
01bb8 666690                         nop        
01bbb e8a0bfb4ff                     call       0x7f982f9bc0e0
01bc0 0f1f8400b81c0027               nop        dword ptr [rax + rax + 0x27001cb8]
01bc8 bef6ffffff                     mov        esi, 0xfffffff6
01bcd 418beb                         mov        ebp, r11d
01bd0 666690                         nop        
01bd3 e888bfb4ff                     call       0x7f982f9bc0e0
01bd8 0f1f8400d01c0028               nop        dword ptr [rax + rax + 0x28001cd0]
01be0 bef6ffffff                     mov        esi, 0xfffffff6
01be5 6690                           nop        
01be7 e874bfb4ff                     call       0x7f982f9bc0e0
01bec 0f1f8400e41c0029               nop        dword ptr [rax + rax + 0x29001ce4]
01bf4 bef6ffffff                     mov        esi, 0xfffffff6
01bf9 6690                           nop        
01bfb e860bfb4ff                     call       0x7f982f9bc0e0
01c00 0f1f8400f81c002a               nop        dword ptr [rax + rax + 0x2a001cf8]
01c08 bef6ffffff                     mov        esi, 0xfffffff6
01c0d 6690                           nop        
01c0f e84cbfb4ff                     call       0x7f982f9bc0e0
01c14 0f1f84000c1d002b               nop        dword ptr [rax + rax + 0x2b001d0c]
01c1c bef6ffffff                     mov        esi, 0xfffffff6
01c21 6690                           nop        
01c23 e838bfb4ff                     call       0x7f982f9bc0e0
01c28 0f1f8400201d002c               nop        dword ptr [rax + rax + 0x2c001d20]
01c30 bef6ffffff                     mov        esi, 0xfffffff6
01c35 6690                           nop        
01c37 e824bfb4ff                     call       0x7f982f9bc0e0
01c3c 0f1f8400341d002d               nop        dword ptr [rax + rax + 0x2d001d34]
01c44 bef6ffffff                     mov        esi, 0xfffffff6
01c49 6690                           nop        
01c4b e810bfb4ff                     call       0x7f982f9bc0e0
01c50 0f1f8400481d002e               nop        dword ptr [rax + rax + 0x2e001d48]
01c58 bef6ffffff                     mov        esi, 0xfffffff6
01c5d 6690                           nop        
01c5f e8fcbeb4ff                     call       0x7f982f9bc0e0
01c64 0f1f84005c1d002f               nop        dword ptr [rax + rax + 0x2f001d5c]
01c6c eb08                           jmp        0x7f982fe701f6
01c6e eb06                           jmp        0x7f982fe701f6
01c70 eb04                           jmp        0x7f982fe701f6
01c72 eb02                           jmp        0x7f982fe701f6
01c74 eb00                           jmp        0x7f982fe701f6
01c76 488bf0                         mov        rsi, rax
01c79 e982edffff                     jmp        0x7f982fe6ef80
01c7e 49baabefe62f987f0000           movabs     r10, 0x7f982fe6efab
01c88 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01c8f e9ccdca8ff                     jmp        0x7f982f8fdee0
01c94 e887a8a7ff                     call       0x7f982f8eaaa0
01c99 e980e3ffff                     jmp        0x7f982fe6e59e
01c9e f4                             hlt        
01c9f f4                             hlt        
