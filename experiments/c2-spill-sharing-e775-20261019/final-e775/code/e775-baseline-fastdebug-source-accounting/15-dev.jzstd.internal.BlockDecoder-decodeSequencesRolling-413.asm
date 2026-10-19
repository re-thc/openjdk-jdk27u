00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85be1f0000                   jne        0x7fb3b3be6b5c
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
00050 0f8353190000                   jae        0x7fb3b3be6529
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f8479190000                   je         0x7fb3b3be655c
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
0009a 0f8c8c170000                   jl         0x7fb3b3be63ac
000a0 85ff                           test       edi, edi
000a2 0f8c6c1b0000                   jl         0x7fb3b3be6794
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83251a0000                   jae        0x7fb3b3be665c
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8c00180000                   jl         0x7fb3b3be6461
000e1 85ff                           test       edi, edi
000e3 0f8c8b1b0000                   jl         0x7fb3b3be67f4
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f83381a0000                   jae        0x7fb3b3be66b0
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00111 4585db                         test       r11d, r11d
00114 0f84ea180000                   je         0x7fb3b3be6584
0011a 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
0011e 458b4104                       mov        r8d, dword ptr [r9 + 4]
00122 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00125 85db                           test       ebx, ebx
00127 0f84ff180000                   je         0x7fb3b3be65ac
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
00195 0f84f0080000                   je         0x7fb3b3be560b
0019b be40000000                     mov        esi, 0x40
001a0 2bf1                           sub        esi, ecx
001a2 443bc6                         cmp        r8d, esi
001a5 0f8f1a020000                   jg         0x7fb3b3be4f45
001ab 412bf0                         sub        esi, r8d
001ae c4e2cbf7e8                     shrx       rbp, rax, rsi
001b3 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b8 4183f840                       cmp        r8d, 0x40
001bc 0f8d1e1c0000                   jge        0x7fb3b3be6960
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
001ed 7c34                           jl         0x7fb3b3be4da3
001ef 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f4 4183c1c8                       add        r9d, -0x38
001f8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fd 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00205 8b542408                       mov        edx, dword ptr [rsp + 8]
00209 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020d 90                             nop        
0020e 90                             nop        
0020f e8ccaeb4ff                     call       0x7fb3b372fc60
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7fb3b3be4dd4
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
00266 0f8d6c1a0000                   jge        0x7fb3b3be6858
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
002ad 0f8d7d1a0000                   jge        0x7fb3b3be68b0
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
002f6 0f8ea5160000                   jle        0x7fb3b3be6521
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
00377 0f86d7160000                   jbe        0x7fb3b3be65d4
0037d 4d63d3                         movsxd     r10, r11d
00380 4d63d9                         movsxd     r11, r9d
00383 49ffcb                         dec        r11
00386 4d3bda                         cmp        r11, r10
00389 0f83c5160000                   jae        0x7fb3b3be65d4
0038f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00394 4585db                         test       r11d, r11d
00397 0f8cef170000                   jl         0x7fb3b3be670c
0039d 8b2c24                         mov        ebp, dword ptr [rsp]
003a0 83c5f9                         add        ebp, -7
003a3 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003aa 4533db                         xor        r11d, r11d
003ad 4533d2                         xor        r10d, r10d
003b0 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b8 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003c0 e982020000                     jmp        0x7fb3b3be51c7
003c5 418be8                         mov        ebp, r8d
003c8 2bee                           sub        ebp, esi
003ca 90                             nop        
003cb e810adb4ff                     call       0x7fb3b372fc60
003d0 0f1f8400c8040001               nop        dword ptr [rax + rax + 0x10004c8]
003d8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003dd 41bb40000000                   mov        r11d, 0x40
003e3 442bdd                         sub        r11d, ebp
003e6 c462d1f7c0                     shlx       r8, rax, rbp
003eb c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003f5 4d0bc2                         or         r8, r10
003f8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003fd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00402 e9d6fdffff                     jmp        0x7fb3b3be4d5d
00407 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
0040f 4f8b541308                     mov        r10, qword ptr [r11 + r10 + 8]
00414 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00419 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00421 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00426 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0042a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0042e 90                             nop        
0042f 90                             nop        
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8d60090000                   jge        0x7fb3b3be5920
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bda                         mov        r11d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8d210a0000                   jge        0x7fb3b3be5a14
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bca                         mov        ecx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d0c0b0000                   jge        0x7fb3b3be5b28
0049c c4e2d3f7df                     shrx       rbx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8dfb0b0000                   jge        0x7fb3b3be5c40
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
00515 0f8e81070000                   jle        0x7fb3b3be581c
0051b 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00522 0f8f9c0c0000                   jg         0x7fb3b3be5d44
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8f9b0d0000                   jg         0x7fb3b3be5e50
00535 81fbffff0300                   cmp        ebx, 0x3ffff
0053b 0f8f770e0000                   jg         0x7fb3b3be5f38
00541 418bc8                         mov        ecx, r8d
00544 81f900000010                   cmp        ecx, 0x10000000
0054a 0f83500f0000                   jae        0x7fb3b3be6020
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
00580 0f8db0000000                   jge        0x7fb3b3be51b6
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
005ce 0f8d18100000                   jge        0x7fb3b3be616c
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
0060f 0f8d7b100000                   jge        0x7fb3b3be6210
00615 41b901000000                   mov        r9d, 1
0061b 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00623 c44229f7d1                     shlx       r10d, r9d, r10d
00628 41ffca                         dec        r10d
0062b 4523d3                         and        r10d, r11d
0062e 4503d0                         add        r10d, r8d
00631 4489542468                     mov        dword ptr [rsp + 0x68], r10d
00636 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0063a 0f8d8e030000                   jge        0x7fb3b3be554e
00640 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00647 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0064c 44235c2460                     and        r11d, dword ptr [rsp + 0x60]
00651 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00656 458b5014                       mov        r10d, dword ptr [r8 + 0x14]
0065a 458b4204                       mov        r8d, dword ptr [r10 + 4]
0065e 453bd8                         cmp        r11d, r8d
00661 0f8334040000                   jae        0x7fb3b3be561b
00667 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0066c 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00671 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00675 8b5914                         mov        ebx, dword ptr [rcx + 0x14]
00678 448b4b04                       mov        r9d, dword ptr [rbx + 4]
0067c 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00681 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00686 453bc1                         cmp        r8d, r9d
00689 0f83a9040000                   jae        0x7fb3b3be56b8
0068f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00694 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
00699 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0069e 458b4a14                       mov        r9d, dword ptr [r10 + 0x14]
006a2 418b4904                       mov        ecx, dword ptr [r9 + 4]
006a6 4e8b54c308                     mov        r10, qword ptr [rbx + r8*8 + 8]
006ab 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006b3 443bd9                         cmp        r11d, ecx
006b6 0f8324050000                   jae        0x7fb3b3be5760
006bc 4f8b54d908                     mov        r10, qword ptr [r9 + r11*8 + 8]
006c1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006c9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006d0 ffc5                           inc        ebp
006d2 892c24                         mov        dword ptr [rsp], ebp
006d5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006d9 0f8d6b030000                   jge        0x7fb3b3be55ca
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
007a0 0f84d5020000                   je         0x7fb3b3be55fb
007a6 83f93f                         cmp        ecx, 0x3f
007a9 0f8f010e0000                   jg         0x7fb3b3be6130
007af 41b940000000                   mov        r9d, 0x40
007b5 442b4c243c                     sub        r9d, dword ptr [rsp + 0x3c]
007ba 413bc9                         cmp        ecx, r9d
007bd 7e48                           jle        0x7fb3b3be5387
007bf 448bc1                         mov        r8d, ecx
007c2 452bc1                         sub        r8d, r9d
007c5 4183f940                       cmp        r9d, 0x40
007c9 0f8d5d0f0000                   jge        0x7fb3b3be62ac
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
00805 eb26                           jmp        0x7fb3b3be53ad
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
0084b 0f8cdffbffff                   jl         0x7fb3b3be4fb0
00851 458d53c0                       lea        r10d, [r11 - 0x40]
00855 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0085a 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0085e 83c5f8                         add        ebp, -8
00861 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00865 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00869 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0086d 83c1f0                         add        ecx, -0x10
00870 83f908                         cmp        ecx, 8
00873 0f8c07010000                   jl         0x7fb3b3be5500
00879 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0087e 4183c2e8                       add        r10d, -0x18
00882 443b9424c4000000               cmp        r10d, dword ptr [rsp + 0xc4]
0088a 0f8277fbffff                   jb         0x7fb3b3be4f87
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
0095f e87c85aeff                     call       0x7fb3b36cda60
00964 0f1f84005c0a0002               nop        dword ptr [rax + rax + 0x2000a5c]
0096c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
00976 4883e4f0                       and        rsp, 0xfffffffffffffff0
0097a e821176518                     call       0x7fb3cc236c20
0097f f4                             hlt        
00980 85c9                           test       ecx, ecx
00982 7f08                           jg         0x7fb3b3be550c
00984 4533d2                         xor        r10d, r10d
00987 e988faffff                     jmp        0x7fb3b3be4f94
0098c 8be9                           mov        ebp, ecx
0098e 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00996 8b542408                       mov        edx, dword ptr [rsp + 8]
0099a 90                             nop        
0099b e840a7b4ff                     call       0x7fb3b372fc60
009a0 0f1f8400980a0003               nop        dword ptr [rax + rax + 0x3000a98]
009a8 448b542408                     mov        r10d, dword ptr [rsp + 8]
009ad 41c1e203                       shl        r10d, 3
009b1 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009b6 41c1e003                       shl        r8d, 3
009ba 452bd0                         sub        r10d, r8d
009bd 4181c2c0000000                 add        r10d, 0xc0
009c4 c462a9f7d0                     shlx       r10, rax, r10
009c9 e946faffff                     jmp        0x7fb3b3be4f94
009ce 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009d6 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009de 4d03c2                         add        r8, r10
009e1 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009e9 4d3bc2                         cmp        r8, r10
009ec 7e33                           jle        0x7fb3b3be55a1
009ee 48be085829e300000000           movabs     rsi, 0xe3295808
009f8 90                             nop        
009f9 90                             nop        
009fa 90                             nop        
009fb e8e0a6b4ff                     call       0x7fb3b372fc60
00a00 0f1f8400f80a0004               nop        dword ptr [rax + rax + 0x4000af8]
00a08 4885c0                         test       rax, rax
00a0b 0f847f130000                   je         0x7fb3b3be6910
00a11 488bf0                         mov        rsi, rax
00a14 4881c410010000                 add        rsp, 0x110
00a1b 5d                             pop        rbp
00a1c e9bf05aeff                     jmp        0x7fb3b36c5b60
00a21 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a26 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a2e 0f8584130000                   jne        0x7fb3b3be6938
00a34 418bc0                         mov        eax, r8d
00a37 4881c410010000                 add        rsp, 0x110
00a3e 5d                             pop        rbp
00a3f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a43 0f877d150000                   ja         0x7fb3b3be6b46
00a49 c3                             ret        
00a4a 4533db                         xor        r11d, r11d
00a4d 4533d2                         xor        r10d, r10d
00a50 4533c9                         xor        r9d, r9d
00a53 4533c0                         xor        r8d, r8d
00a56 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
00a5e 44899424d0000000               mov        dword ptr [rsp + 0xd0], r10d
00a66 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
00a6e 44898424f4000000               mov        dword ptr [rsp + 0xf4], r8d
00a76 e9c1fcffff                     jmp        0x7fb3b3be52bc
00a7b 4533d2                         xor        r10d, r10d
00a7e 4c899424e0000000               mov        qword ptr [rsp + 0xe0], r10
00a86 e9a5f9ffff                     jmp        0x7fb3b3be4fb0
00a8b 4533d2                         xor        r10d, r10d
00a8e 4533db                         xor        r11d, r11d
00a91 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a96 e942f7ffff                     jmp        0x7fb3b3be4d5d
00a9b bee4ffffff                     mov        esi, 0xffffffe4
00aa0 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00aa8 448b442408                     mov        r8d, dword ptr [rsp + 8]
00aad 44890424                       mov        dword ptr [rsp], r8d
00ab1 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00ab6 44894c2404                     mov        dword ptr [rsp + 4], r9d
00abb 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00ac0 4489442408                     mov        dword ptr [rsp + 8], r8d
00ac5 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00aca 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00acf 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00ad4 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00ad9 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ade 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ae3 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ae8 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00aed 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00af2 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00af7 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00afc 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b01 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b06 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b0b 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00b10 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b15 90                             nop        
00b16 90                             nop        
00b17 e8c483aeff                     call       0x7fb3b36cda60
00b1c 0f1f8400140c0005               nop        dword ptr [rax + rax + 0x5000c14]
00b24 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
00b2e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b32 e869156518                     call       0x7fb3cc236c20
00b37 f4                             hlt        
00b38 bee4ffffff                     mov        esi, 0xffffffe4
00b3d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b45 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b4a 44891424                       mov        dword ptr [rsp], r10d
00b4e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00b53 44895c2404                     mov        dword ptr [rsp + 4], r11d
00b58 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b5d 4489542408                     mov        dword ptr [rsp + 8], r10d
00b62 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b67 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b6c 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00b71 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00b76 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b7b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b80 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b85 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b8a 894c2428                       mov        dword ptr [rsp + 0x28], ecx
00b8e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b93 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b98 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b9d 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ba2 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ba7 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00bac 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00bb1 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00bb6 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00bba 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00bbf e81c83aeff                     call       0x7fb3b36cda60
00bc4 0f1f8400bc0c0006               nop        dword ptr [rax + rax + 0x6000cbc]
00bcc 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
00bd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bda e8c1146518                     call       0x7fb3cc236c20
00bdf f4                             hlt        
00be0 bee4ffffff                     mov        esi, 0xffffffe4
00be5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bed 448b542408                     mov        r10d, dword ptr [rsp + 8]
00bf2 44891424                       mov        dword ptr [rsp], r10d
00bf6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00bfb 4489442404                     mov        dword ptr [rsp + 4], r8d
00c00 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c05 4489542408                     mov        dword ptr [rsp + 8], r10d
00c0a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c0f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c14 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00c19 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00c1e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c23 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c28 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c2d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c32 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00c37 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00c3c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c41 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c46 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00c4b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00c50 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c55 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c5a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c5f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00c64 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c69 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00c6e 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c73 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c78 90                             nop        
00c79 90                             nop        
00c7a 90                             nop        
00c7b e86082aeff                     call       0x7fb3b36cda60
00c80 0f1f8400780d0007               nop        dword ptr [rax + rax + 0x7000d78]
00c88 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
00c92 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c96 e805146518                     call       0x7fb3cc236c20
00c9b f4                             hlt        
00c9c 4533c9                         xor        r9d, r9d
00c9f 4d3bc1                         cmp        r8, r9
00ca2 bdffffffff                     mov        ebp, 0xffffffff
00ca7 7c08                           jl         0x7fb3b3be5831
00ca9 400f95c5                       setne      bpl
00cad 400fb6ed                       movzx      ebp, bpl
00cb1 be45ffffff                     mov        esi, 0xffffff45
00cb6 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00cbe 4c890c24                       mov        qword ptr [rsp], r9
00cc2 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00cc6 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00cca 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00cd2 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00cd7 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00cdb 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00cdf 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00ce4 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00ce9 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00ced 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00cf1 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00cf6 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cfb 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00cff 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00d03 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00d08 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00d0d 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00d11 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00d15 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00d1d 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00d22 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00d26 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00d2a 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00d2f 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00d34 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00d38 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00d3c 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d41 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d46 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d4e 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d53 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d5b 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d60 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d68 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d6f 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d77 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d7f e85c81aeff                     call       0x7fb3b36cda60
00d84 0f1f84007c0e0008               nop        dword ptr [rax + rax + 0x8000e7c]
00d8c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
00d96 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d9a e801136518                     call       0x7fb3cc236c20
00d9f f4                             hlt        
00da0 be45ffffff                     mov        esi, 0xffffff45
00da5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00dad 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00db2 44891c24                       mov        dword ptr [rsp], r11d
00db6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00dbb 4489542404                     mov        dword ptr [rsp + 4], r10d
00dc0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00dc5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00dca 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00dd2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00dd7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ddc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00de1 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00de6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00deb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00df0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00df5 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00dfa 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00dff 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00e04 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00e09 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00e0e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00e13 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00e18 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00e1d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e22 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00e27 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00e2c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00e31 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e36 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00e3b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00e40 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00e45 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00e4a 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00e4f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e54 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e59 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e61 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e66 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e6e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e73 e86880aeff                     call       0x7fb3b36cda60
00e78 0f1f8400700f0009               nop        dword ptr [rax + rax + 0x9000f70]
00e80 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
00e8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e8e e80d126518                     call       0x7fb3cc236c20
00e93 f4                             hlt        
00e94 be45ffffff                     mov        esi, 0xffffff45
00e99 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ea1 448b542408                     mov        r10d, dword ptr [rsp + 8]
00ea6 44891424                       mov        dword ptr [rsp], r10d
00eaa 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00eaf 4489442404                     mov        dword ptr [rsp + 4], r8d
00eb4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00eb9 4489542408                     mov        dword ptr [rsp + 8], r10d
00ebe 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ec6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00ecb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ed0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ed5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00eda 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00edf 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ee4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ee9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00eee 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ef3 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ef8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00efd 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00f02 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00f07 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f0c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f11 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00f16 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00f1b 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f20 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f25 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00f2a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f2f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00f34 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00f39 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f3e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00f43 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f48 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f4d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f55 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f5a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f62 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f67 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00f6f 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00f74 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
00f7c 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00f84 90                             nop        
00f85 90                             nop        
00f86 90                             nop        
00f87 e8547faeff                     call       0x7fb3b36cda60
00f8c 0f1f84008410000a               nop        dword ptr [rax + rax + 0xa001084]
00f94 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
00f9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fa2 e8f9106518                     call       0x7fb3cc236c20
00fa7 f4                             hlt        
00fa8 be45ffffff                     mov        esi, 0xffffff45
00fad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fb5 448b442408                     mov        r8d, dword ptr [rsp + 8]
00fba 44890424                       mov        dword ptr [rsp], r8d
00fbe 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fc3 4489542404                     mov        dword ptr [rsp + 4], r10d
00fc8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00fcd 4489442408                     mov        dword ptr [rsp + 8], r8d
00fd2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fda 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fdf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fe4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fe9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fee 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ff3 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00ff8 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00ffd 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01002 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01007 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0100c 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01011 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01016 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0101b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01020 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01025 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0102a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0102f 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01034 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01039 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0103e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01043 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01048 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0104d 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01052 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01057 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0105c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01061 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01069 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0106e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01076 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0107b 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
01083 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01088 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01090 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01097 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
0109f e83c7eaeff                     call       0x7fb3b36cda60
010a4 0f1f84009c11000b               nop        dword ptr [rax + rax + 0xb00119c]
010ac 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
010b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
010ba e8e10f6518                     call       0x7fb3cc236c20
010bf f4                             hlt        
010c0 be45ffffff                     mov        esi, 0xffffff45
010c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010cd 448b442408                     mov        r8d, dword ptr [rsp + 8]
010d2 44890424                       mov        dword ptr [rsp], r8d
010d6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
010db 44894c2404                     mov        dword ptr [rsp + 4], r9d
010e0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
010e5 4489442408                     mov        dword ptr [rsp + 8], r8d
010ea 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
010ef 4c89442418                     mov        qword ptr [rsp + 0x18], r8
010f4 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
010f9 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
010fe 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01103 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01108 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0110d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01112 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01117 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0111c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01121 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01126 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0112b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01130 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01135 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0113a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0113f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01144 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01149 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0114e 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01153 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01158 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0115d 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01162 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01167 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0116c 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01174 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01179 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01181 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01186 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0118b 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01192 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0119a 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
011a2 90                             nop        
011a3 e8387daeff                     call       0x7fb3b36cda60
011a8 0f1f8400a012000c               nop        dword ptr [rax + rax + 0xc0012a0]
011b0 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
011ba 4883e4f0                       and        rsp, 0xfffffffffffffff0
011be e8dd0e6518                     call       0x7fb3cc236c20
011c3 f4                             hlt        
011c4 41b9ffffff7f                   mov        r9d, 0x7fffffff
011ca 4d3bc1                         cmp        r8, r9
011cd bdffffffff                     mov        ebp, 0xffffffff
011d2 7c08                           jl         0x7fb3b3be5d5c
011d4 400f95c5                       setne      bpl
011d8 400fb6ed                       movzx      ebp, bpl
011dc be45ffffff                     mov        esi, 0xffffff45
011e1 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
011e9 4c890c24                       mov        qword ptr [rsp], r9
011ed 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
011f1 894c240c                       mov        dword ptr [rsp + 0xc], ecx
011f5 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
011fd 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01202 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01207 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0120c 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01210 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01214 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01219 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0121e 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01222 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01226 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0122b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01230 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01234 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01238 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0123d 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01242 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01249 894c2444                       mov        dword ptr [rsp + 0x44], ecx
0124d 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01252 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01257 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0125b 894c2454                       mov        dword ptr [rsp + 0x54], ecx
0125f 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01264 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01269 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
0126e 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01273 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
0127b 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01280 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01288 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
0128d 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01295 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
0129c 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012a4 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
012ac 90                             nop        
012ad 90                             nop        
012ae 90                             nop        
012af e82c7caeff                     call       0x7fb3b36cda60
012b4 0f1f8400ac13000d               nop        dword ptr [rax + rax + 0xd0013ac]
012bc 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
012c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
012ca e8d10d6518                     call       0x7fb3cc236c20
012cf f4                             hlt        
012d0 be45ffffff                     mov        esi, 0xffffff45
012d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012dd 448b442408                     mov        r8d, dword ptr [rsp + 8]
012e2 44890424                       mov        dword ptr [rsp], r8d
012e6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
012eb 4489442404                     mov        dword ptr [rsp + 4], r8d
012f0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
012f5 44894c2408                     mov        dword ptr [rsp + 8], r9d
012fa 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
012ff 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01304 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01309 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0130e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01313 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01318 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0131d 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01322 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01327 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0132c 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01331 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01336 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0133b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01340 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01345 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0134a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0134f 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01354 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01359 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0135e 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01363 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01368 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0136d 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01372 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01377 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0137c 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01384 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01389 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0138e 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
01396 90                             nop        
01397 e8447baeff                     call       0x7fb3b36cda60
0139c 0f1f84009414000e               nop        dword ptr [rax + rax + 0xe001494]
013a4 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
013ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
013b2 e8e90c6518                     call       0x7fb3cc236c20
013b7 f4                             hlt        
013b8 be45ffffff                     mov        esi, 0xffffff45
013bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013c5 448b442408                     mov        r8d, dword ptr [rsp + 8]
013ca 44890424                       mov        dword ptr [rsp], r8d
013ce 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
013d3 4489442404                     mov        dword ptr [rsp + 4], r8d
013d8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
013dd 4489542408                     mov        dword ptr [rsp + 8], r10d
013e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013ec 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
013f1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
013f6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
013fb 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01400 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01405 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0140a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0140f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01414 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01419 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0141e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01423 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01428 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0142d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01432 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01437 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0143c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01441 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01446 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0144b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01450 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01455 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0145a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0145f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01464 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0146c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01471 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01476 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
0147d 90                             nop        
0147e 90                             nop        
0147f e85c7aaeff                     call       0x7fb3b36cda60
01484 0f1f84007c15000f               nop        dword ptr [rax + rax + 0xf00157c]
0148c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01496 4883e4f0                       and        rsp, 0xfffffffffffffff0
0149a e8010c6518                     call       0x7fb3cc236c20
0149f f4                             hlt        
014a0 be3dffffff                     mov        esi, 0xffffff3d
014a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014ad 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
014b2 44890c24                       mov        dword ptr [rsp], r9d
014b6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
014bb 44894c2404                     mov        dword ptr [rsp + 4], r9d
014c0 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
014c5 4489442408                     mov        dword ptr [rsp + 8], r8d
014ca 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
014cf 4c89442418                     mov        qword ptr [rsp + 0x18], r8
014d4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014d9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014de 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014e3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014e8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
014ed 4489442424                     mov        dword ptr [rsp + 0x24], r8d
014f2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
014f7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
014fc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01501 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01506 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0150b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01510 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01515 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0151a 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0151f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01524 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
0152c 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01531 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01536 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0153b 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01540 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01545 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0154a 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0154f 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01554 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01559 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01561 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01566 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0156e 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01573 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01578 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01580 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
01587 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
0158e 90                             nop        
0158f e84c79aeff                     call       0x7fb3b36cda60
01594 0f1f84008c160010               nop        dword ptr [rax + rax + 0x1000168c]
0159c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
015a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
015aa e8f10a6518                     call       0x7fb3cc236c20
015af f4                             hlt        
015b0 be45ffffff                     mov        esi, 0xffffff45
015b5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015bd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015c2 44891c24                       mov        dword ptr [rsp], r11d
015c6 894c2408                       mov        dword ptr [rsp + 8], ecx
015ca 90                             nop        
015cb e81079aeff                     call       0x7fb3b36cda60
015d0 0f1f8400c8160011               nop        dword ptr [rax + rax + 0x110016c8]
015d8 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
015e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
015e6 e8b50a6518                     call       0x7fb3cc236c20
015eb f4                             hlt        
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
0162a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0162f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01634 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01639 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0163e 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01643 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01648 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0164d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01652 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01656 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0165b 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01660 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01665 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0166a 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0166e 90                             nop        
0166f e86c78aeff                     call       0x7fb3b36cda60
01674 0f1f84006c170012               nop        dword ptr [rax + rax + 0x1200176c]
0167c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01686 4883e4f0                       and        rsp, 0xfffffffffffffff0
0168a e8110a6518                     call       0x7fb3cc236c20
0168f f4                             hlt        
01690 be45ffffff                     mov        esi, 0xffffff45
01695 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0169d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
016a2 44890c24                       mov        dword ptr [rsp], r9d
016a6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
016ab 44894c2404                     mov        dword ptr [rsp + 4], r9d
016b0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
016b5 44894c2408                     mov        dword ptr [rsp + 8], r9d
016ba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016bf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016c4 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
016c9 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
016ce 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
016d3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
016d8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
016dd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016e2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
016e7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
016ec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
016f1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016f6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
016fb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01700 4489442454                     mov        dword ptr [rsp + 0x54], r8d
01705 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0170a 90                             nop        
0170b e8d077aeff                     call       0x7fb3b36cda60
01710 0f1f840008180013               nop        dword ptr [rax + rax + 0x13001808]
01718 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01722 4883e4f0                       and        rsp, 0xfffffffffffffff0
01726 e875096518                     call       0x7fb3cc236c20
0172b f4                             hlt        
0172c be45ffffff                     mov        esi, 0xffffff45
01731 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01739 448b542408                     mov        r10d, dword ptr [rsp + 8]
0173e 44891424                       mov        dword ptr [rsp], r10d
01742 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01747 4489542404                     mov        dword ptr [rsp + 4], r10d
0174c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01751 4489542408                     mov        dword ptr [rsp + 8], r10d
01756 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0175b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01760 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01765 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0176a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0176f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01774 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01779 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0177e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01783 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01788 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0178d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01792 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01797 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0179c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
017a1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
017a6 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
017ab 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
017b0 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017b5 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
017ba 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
017bf 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
017c4 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
017c9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
017ce 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
017d3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
017d8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017e0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
017e5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
017ed 4c89542468                     mov        qword ptr [rsp + 0x68], r10
017f2 898c248c000000                 mov        dword ptr [rsp + 0x8c], ecx
017f9 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01801 44898c2494000000               mov        dword ptr [rsp + 0x94], r9d
01809 90                             nop        
0180a 90                             nop        
0180b e8d076aeff                     call       0x7fb3b36cda60
01810 0f1f840008190014               nop        dword ptr [rax + rax + 0x14001908]
01818 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01822 4883e4f0                       and        rsp, 0xfffffffffffffff0
01826 e875086518                     call       0x7fb3cc236c20
0182b f4                             hlt        
0182c 4585c0                         test       r8d, r8d
0182f 7f07                           jg         0x7fb3b3be63b8
01831 33c0                           xor        eax, eax
01833 e98fe8ffff                     jmp        0x7fb3b3be4c47
01838 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0183c 89742428                       mov        dword ptr [rsp + 0x28], esi
01840 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01844 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01849 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0184e 897c2410                       mov        dword ptr [rsp + 0x10], edi
01852 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01857 48894424f8                     mov        qword ptr [rsp - 8], rax
0185c 8b0424                         mov        eax, dword ptr [rsp]
0185f 89442404                       mov        dword ptr [rsp + 4], eax
01863 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01868 48894424f8                     mov        qword ptr [rsp - 8], rax
0186d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01874 890424                         mov        dword ptr [rsp], eax
01877 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0187c 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01884 488bf5                         mov        rsi, rbp
01887 8b542408                       mov        edx, dword ptr [rsp + 8]
0188b 418bc8                         mov        ecx, r8d
0188e 90                             nop        
0188f e84c98b4ff                     call       0x7fb3b372fc60
01894 0f1f84008c190015               nop        dword ptr [rax + rax + 0x1500198c]
0189c 41ba40000000                   mov        r10d, 0x40
018a2 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
018a7 c4e2a9f7c0                     shlx       rax, rax, r10
018ac 48894424f8                     mov        qword ptr [rsp - 8], rax
018b1 8b442404                       mov        eax, dword ptr [rsp + 4]
018b5 890424                         mov        dword ptr [rsp], eax
018b8 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018bd 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
018c2 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
018c6 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
018cb 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
018d0 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
018d4 8b742428                       mov        esi, dword ptr [rsp + 0x28]
018d8 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
018dc e9e6e7ffff                     jmp        0x7fb3b3be4c47
018e1 4585c0                         test       r8d, r8d
018e4 7f08                           jg         0x7fb3b3be646e
018e6 4533f6                         xor        r14d, r14d
018e9 e91ae8ffff                     jmp        0x7fb3b3be4c88
018ee 4489542438                     mov        dword ptr [rsp + 0x38], r10d
018f3 4889442430                     mov        qword ptr [rsp + 0x30], rax
018f8 8954242c                       mov        dword ptr [rsp + 0x2c], edx
018fc 89742428                       mov        dword ptr [rsp + 0x28], esi
01900 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01904 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01909 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
0190e 897c2410                       mov        dword ptr [rsp + 0x10], edi
01912 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01917 48894424f8                     mov        qword ptr [rsp - 8], rax
0191c 8b0424                         mov        eax, dword ptr [rsp]
0191f 89442404                       mov        dword ptr [rsp + 4], eax
01923 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01928 48894424f8                     mov        qword ptr [rsp - 8], rax
0192d 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01934 890424                         mov        dword ptr [rsp], eax
01937 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0193c 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01944 488bf5                         mov        rsi, rbp
01947 8b542408                       mov        edx, dword ptr [rsp + 8]
0194b 418bc8                         mov        ecx, r8d
0194e 90                             nop        
0194f e88c97b4ff                     call       0x7fb3b372fc60
01954 0f1f84004c1a0016               nop        dword ptr [rax + rax + 0x16001a4c]
0195c 41ba80000000                   mov        r10d, 0x80
01962 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01967 c462a9f7f0                     shlx       r14, rax, r10
0196c 48894424f8                     mov        qword ptr [rsp - 8], rax
01971 8b442404                       mov        eax, dword ptr [rsp + 4]
01975 890424                         mov        dword ptr [rsp], eax
01978 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197d 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01981 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01986 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
0198a 8b742428                       mov        esi, dword ptr [rsp + 0x28]
0198e 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01992 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01997 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0199c e967e7ffff                     jmp        0x7fb3b3be4c88
019a1 4533c0                         xor        r8d, r8d
019a4 e92df0ffff                     jmp        0x7fb3b3be5556
019a9 bee4ffffff                     mov        esi, 0xffffffe4
019ae 48ffb42490000000               push       qword ptr [rsp + 0x90]
019b6 488f0424                       pop        qword ptr [rsp]
019ba 90                             nop        
019bb e82075aeff                     call       0x7fb3b36cda60
019c0 0f1f8400b81a0017               nop        dword ptr [rax + rax + 0x17001ab8]
019c8 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
019d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
019d6 e8c5066518                     call       0x7fb3cc236c20
019db f4                             hlt        
019dc be5d000000                     mov        esi, 0x5d
019e1 90                             nop        
019e2 90                             nop        
019e3 e8f874aeff                     call       0x7fb3b36cda60
019e8 0f1f8400e01a0018               nop        dword ptr [rax + rax + 0x18001ae0]
019f0 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
019fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
019fe e89d066518                     call       0x7fb3cc236c20
01a03 f4                             hlt        
01a04 bef6ffffff                     mov        esi, 0xfffffff6
01a09 90                             nop        
01a0a 90                             nop        
01a0b e8d074aeff                     call       0x7fb3b36cda60
01a10 0f1f8400081b0019               nop        dword ptr [rax + rax + 0x19001b08]
01a18 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01a22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a26 e875066518                     call       0x7fb3cc236c20
01a2b f4                             hlt        
01a2c bef6ffffff                     mov        esi, 0xfffffff6
01a31 90                             nop        
01a32 90                             nop        
01a33 e8a874aeff                     call       0x7fb3b36cda60
01a38 0f1f8400301b001a               nop        dword ptr [rax + rax + 0x1a001b30]
01a40 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01a4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a4e e84d066518                     call       0x7fb3cc236c20
01a53 f4                             hlt        
01a54 be6effffff                     mov        esi, 0xffffff6e
01a59 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a61 448b542408                     mov        r10d, dword ptr [rsp + 8]
01a66 44891424                       mov        dword ptr [rsp], r10d
01a6a 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a6f 4489542408                     mov        dword ptr [rsp + 8], r10d
01a74 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a79 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a7e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a83 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a88 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a8d 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a92 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01a97 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a9c 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01aa1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01aa6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01aab 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ab0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01ab5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01aba 90                             nop        
01abb e82074aeff                     call       0x7fb3b36cda60
01ac0 0f1f8400b81b001b               nop        dword ptr [rax + rax + 0x1b001bb8]
01ac8 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01ad2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ad6 e8c5056518                     call       0x7fb3cc236c20
01adb f4                             hlt        
01adc bee4ffffff                     mov        esi, 0xffffffe4
01ae1 48ffb42490000000               push       qword ptr [rsp + 0x90]
01ae9 488f0424                       pop        qword ptr [rsp]
01aed 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01af2 48894424f8                     mov        qword ptr [rsp - 8], rax
01af7 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01afe 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01b02 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b07 894c2428                       mov        dword ptr [rsp + 0x28], ecx
01b0b 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01b0f e8cc73aeff                     call       0x7fb3b36cda60
01b14 0f1f84000c1c001c               nop        dword ptr [rax + rax + 0x1c001c0c]
01b1c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01b26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b2a e871056518                     call       0x7fb3cc236c20
01b2f f4                             hlt        
01b30 bee4ffffff                     mov        esi, 0xffffffe4
01b35 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b3d 488f0424                       pop        qword ptr [rsp]
01b41 48894424f8                     mov        qword ptr [rsp - 8], rax
01b46 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b4d 89442418                       mov        dword ptr [rsp + 0x18], eax
01b51 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b56 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01b5a 89542428                       mov        dword ptr [rsp + 0x28], edx
01b5e 4889442430                     mov        qword ptr [rsp + 0x30], rax
01b63 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b68 90                             nop        
01b69 90                             nop        
01b6a 90                             nop        
01b6b e87073aeff                     call       0x7fb3b36cda60
01b70 0f1f8400681c001d               nop        dword ptr [rax + rax + 0x1d001c68]
01b78 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01b82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b86 e815056518                     call       0x7fb3cc236c20
01b8b f4                             hlt        
01b8c bebeffffff                     mov        esi, 0xffffffbe
01b91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b99 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b9e 44891424                       mov        dword ptr [rsp], r10d
01ba2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ba7 4489542408                     mov        dword ptr [rsp + 8], r10d
01bac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bb1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bb6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01bbb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01bc0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01bc5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01bca 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01bcf 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01bd4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01bd9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01bde 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01be3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01be8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01bed 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bf2 90                             nop        
01bf3 e8e872aeff                     call       0x7fb3b36cda60
01bf8 0f1f8400f01c001e               nop        dword ptr [rax + rax + 0x1e001cf0]
01c00 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01c0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c0e e88d046518                     call       0x7fb3cc236c20
01c13 f4                             hlt        
01c14 beccffffff                     mov        esi, 0xffffffcc
01c19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c21 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c26 44891c24                       mov        dword ptr [rsp], r11d
01c2a 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01c2f 48894424f8                     mov        qword ptr [rsp - 8], rax
01c34 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c3b 89442414                       mov        dword ptr [rsp + 0x14], eax
01c3f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c44 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01c48 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01c4c 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01c50 90                             nop        
01c51 90                             nop        
01c52 90                             nop        
01c53 e88872aeff                     call       0x7fb3b36cda60
01c58 0f1f8400501d001f               nop        dword ptr [rax + rax + 0x1f001d50]
01c60 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01c6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c6e e82d046518                     call       0x7fb3cc236c20
01c73 f4                             hlt        
01c74 beccffffff                     mov        esi, 0xffffffcc
01c79 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c81 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c86 44891c24                       mov        dword ptr [rsp], r11d
01c8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01c8f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c96 89442410                       mov        dword ptr [rsp + 0x10], eax
01c9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c9f 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01ca3 89542418                       mov        dword ptr [rsp + 0x18], edx
01ca7 4889442428                     mov        qword ptr [rsp + 0x28], rax
01cac 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01cb1 897c2434                       mov        dword ptr [rsp + 0x34], edi
01cb5 90                             nop        
01cb6 90                             nop        
01cb7 e82472aeff                     call       0x7fb3b36cda60
01cbc 0f1f8400b41d0020               nop        dword ptr [rax + rax + 0x20001db4]
01cc4 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01cce 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cd2 e8c9036518                     call       0x7fb3cc236c20
01cd7 f4                             hlt        
01cd8 be45ffffff                     mov        esi, 0xffffff45
01cdd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ce5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01cea 44891c24                       mov        dword ptr [rsp], r11d
01cee 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cf3 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cf8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cfd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d02 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d07 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d0c 90                             nop        
01d0d 90                             nop        
01d0e 90                             nop        
01d0f e8cc71aeff                     call       0x7fb3b36cda60
01d14 0f1f84000c1e0021               nop        dword ptr [rax + rax + 0x21001e0c]
01d1c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01d26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d2a e871036518                     call       0x7fb3cc236c20
01d2f f4                             hlt        
01d30 be45ffffff                     mov        esi, 0xffffff45
01d35 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d3d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01d42 44891424                       mov        dword ptr [rsp], r10d
01d46 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01d4b 4489542408                     mov        dword ptr [rsp + 8], r10d
01d50 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d55 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d5a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d5f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d64 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01d69 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01d6e 90                             nop        
01d6f e86c71aeff                     call       0x7fb3b36cda60
01d74 0f1f84006c1e0022               nop        dword ptr [rax + rax + 0x22001e6c]
01d7c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8a e811036518                     call       0x7fb3cc236c20
01d8f f4                             hlt        
01d90 bef6ffffff                     mov        esi, 0xfffffff6
01d95 90                             nop        
01d96 90                             nop        
01d97 e84471aeff                     call       0x7fb3b36cda60
01d9c 0f1f8400941e0023               nop        dword ptr [rax + rax + 0x23001e94]
01da4 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01dae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01db2 e8e9026518                     call       0x7fb3cc236c20
01db7 f4                             hlt        
01db8 be5d000000                     mov        esi, 0x5d
01dbd 90                             nop        
01dbe 90                             nop        
01dbf e81c71aeff                     call       0x7fb3b36cda60
01dc4 0f1f8400bc1e0024               nop        dword ptr [rax + rax + 0x24001ebc]
01dcc 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01dd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dda e8c1026518                     call       0x7fb3cc236c20
01ddf f4                             hlt        
01de0 be45ffffff                     mov        esi, 0xffffff45
01de5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ded 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01df2 44891c24                       mov        dword ptr [rsp], r11d
01df6 90                             nop        
01df7 e8e470aeff                     call       0x7fb3b36cda60
01dfc 0f1f8400f41e0025               nop        dword ptr [rax + rax + 0x25001ef4]
01e04 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01e0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e12 e889026518                     call       0x7fb3cc236c20
01e17 f4                             hlt        
01e18 bef6ffffff                     mov        esi, 0xfffffff6
01e1d 418beb                         mov        ebp, r11d
01e20 90                             nop        
01e21 90                             nop        
01e22 90                             nop        
01e23 e8b870aeff                     call       0x7fb3b36cda60
01e28 0f1f8400201f0026               nop        dword ptr [rax + rax + 0x26001f20]
01e30 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01e3a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e3e e85d026518                     call       0x7fb3cc236c20
01e43 f4                             hlt        
01e44 bef6ffffff                     mov        esi, 0xfffffff6
01e49 418be8                         mov        ebp, r8d
01e4c 90                             nop        
01e4d 90                             nop        
01e4e 90                             nop        
01e4f e88c70aeff                     call       0x7fb3b36cda60
01e54 0f1f84004c1f0027               nop        dword ptr [rax + rax + 0x27001f4c]
01e5c 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01e66 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e6a e831026518                     call       0x7fb3cc236c20
01e6f f4                             hlt        
01e70 bef6ffffff                     mov        esi, 0xfffffff6
01e75 418beb                         mov        ebp, r11d
01e78 90                             nop        
01e79 90                             nop        
01e7a 90                             nop        
01e7b e86070aeff                     call       0x7fb3b36cda60
01e80 0f1f8400781f0028               nop        dword ptr [rax + rax + 0x28001f78]
01e88 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01e92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e96 e805026518                     call       0x7fb3cc236c20
01e9b f4                             hlt        
01e9c bef6ffffff                     mov        esi, 0xfffffff6
01ea1 90                             nop        
01ea2 90                             nop        
01ea3 e83870aeff                     call       0x7fb3b36cda60
01ea8 0f1f8400a01f0029               nop        dword ptr [rax + rax + 0x29001fa0]
01eb0 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01eba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ebe e8dd016518                     call       0x7fb3cc236c20
01ec3 f4                             hlt        
01ec4 bef6ffffff                     mov        esi, 0xfffffff6
01ec9 90                             nop        
01eca 90                             nop        
01ecb e81070aeff                     call       0x7fb3b36cda60
01ed0 0f1f8400c81f002a               nop        dword ptr [rax + rax + 0x2a001fc8]
01ed8 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01ee2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ee6 e8b5016518                     call       0x7fb3cc236c20
01eeb f4                             hlt        
01eec bef6ffffff                     mov        esi, 0xfffffff6
01ef1 90                             nop        
01ef2 90                             nop        
01ef3 e8e86faeff                     call       0x7fb3b36cda60
01ef8 0f1f8400f01f002b               nop        dword ptr [rax + rax + 0x2b001ff0]
01f00 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01f0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f0e e88d016518                     call       0x7fb3cc236c20
01f13 f4                             hlt        
01f14 bef6ffffff                     mov        esi, 0xfffffff6
01f19 90                             nop        
01f1a 90                             nop        
01f1b e8c06faeff                     call       0x7fb3b36cda60
01f20 0f1f84001820002c               nop        dword ptr [rax + rax + 0x2c002018]
01f28 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01f32 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f36 e865016518                     call       0x7fb3cc236c20
01f3b f4                             hlt        
01f3c bef6ffffff                     mov        esi, 0xfffffff6
01f41 90                             nop        
01f42 90                             nop        
01f43 e8986faeff                     call       0x7fb3b36cda60
01f48 0f1f84004020002d               nop        dword ptr [rax + rax + 0x2d002040]
01f50 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01f5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f5e e83d016518                     call       0x7fb3cc236c20
01f63 f4                             hlt        
01f64 bef6ffffff                     mov        esi, 0xfffffff6
01f69 90                             nop        
01f6a 90                             nop        
01f6b e8706faeff                     call       0x7fb3b36cda60
01f70 0f1f84006820002e               nop        dword ptr [rax + rax + 0x2e002068]
01f78 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01f82 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f86 e815016518                     call       0x7fb3cc236c20
01f8b f4                             hlt        
01f8c bef6ffffff                     mov        esi, 0xfffffff6
01f91 90                             nop        
01f92 90                             nop        
01f93 e8486faeff                     call       0x7fb3b36cda60
01f98 0f1f84009020002f               nop        dword ptr [rax + rax + 0x2f002090]
01fa0 48bf50ec6f8cb37f0000           movabs     rdi, 0x7fb38c6fec50
01faa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fae e8ed006518                     call       0x7fb3cc236c20
01fb3 f4                             hlt        
01fb4 eb08                           jmp        0x7fb3b3be6b3e
01fb6 eb06                           jmp        0x7fb3b3be6b3e
01fb8 eb04                           jmp        0x7fb3b3be6b3e
01fba eb02                           jmp        0x7fb3b3be6b3e
01fbc eb00                           jmp        0x7fb3b3be6b3e
01fbe 488bf0                         mov        rsi, rax
01fc1 e94eeaffff                     jmp        0x7fb3b3be5594
01fc6 49babf55beb3b37f0000           movabs     r10, 0x7fb3b3be55bf
01fd0 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
01fd7 e904b8b4ff                     jmp        0x7fb3b3732360
01fdc e87f86b3ff                     call       0x7fb3b371f1e0
01fe1 e938e0ffff                     jmp        0x7fb3b3be4b9e
01fe6 f4                             hlt        
01fe7 f4                             hlt        
