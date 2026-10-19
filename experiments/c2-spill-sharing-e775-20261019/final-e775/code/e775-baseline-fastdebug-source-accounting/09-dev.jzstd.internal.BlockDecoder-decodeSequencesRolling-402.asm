00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f8596200000                   jne        0x7fb3b3bddeb4
0001e 897c244c                       mov        dword ptr [rsp + 0x4c], edi
00022 4c898c24a8000000               mov        qword ptr [rsp + 0xa8], r9
0002a 4c89442420                     mov        qword ptr [rsp + 0x20], r8
0002f 894c2408                       mov        dword ptr [rsp + 8], ecx
00033 899424a0000000                 mov        dword ptr [rsp + 0xa0], edx
0003a 8d6aff                         lea        ebp, [rdx - 1]
0003d 4889b42490000000               mov        qword ptr [rsp + 0x90], rsi
00045 448b5e04                       mov        r11d, dword ptr [rsi + 4]
00049 44891c24                       mov        dword ptr [rsp], r11d
0004d 413beb                         cmp        ebp, r11d
00050 0f832b1a0000                   jae        0x7fb3b3bdd881
00056 0fb64c1607                     movzx      ecx, byte ptr [rsi + rdx + 7]
0005b 85c9                           test       ecx, ecx
0005d 0f84511a0000                   je         0x7fb3b3bdd8b4
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
0009a 0f8c64180000                   jl         0x7fb3b3bdd704
000a0 85ff                           test       edi, edi
000a2 0f8c441c0000                   jl         0x7fb3b3bddaec
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83fd1a0000                   jae        0x7fb3b3bdd9b4
000b7 458bd5                         mov        r10d, r13d
000ba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000c2 4b8b441108                     mov        rax, qword ptr [r9 + r10 + 8]
000c7 4183c0f8                       add        r8d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183f808                       cmp        r8d, 8
000db 0f8cd8180000                   jl         0x7fb3b3bdd7b9
000e1 85ff                           test       edi, edi
000e3 0f8c631c0000                   jl         0x7fb3b3bddb4c
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f83101b0000                   jae        0x7fb3b3bdda08
000f8 458bc2                         mov        r8d, r10d
000fb 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00103 4f8b740308                     mov        r14, qword ptr [r11 + r8 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00111 4585db                         test       r11d, r11d
00114 0f84c2190000                   je         0x7fb3b3bdd8dc
0011a 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
0011e 458b4104                       mov        r8d, dword ptr [r9 + 4]
00122 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00125 85db                           test       ebx, ebx
00127 0f84d7190000                   je         0x7fb3b3bdd904
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
00195 0f84d3080000                   je         0x7fb3b3bdc86e
0019b be40000000                     mov        esi, 0x40
001a0 2bf1                           sub        esi, ecx
001a2 443bc6                         cmp        r8d, esi
001a5 0f8f1a020000                   jg         0x7fb3b3bdc1c5
001ab 412bf0                         sub        esi, r8d
001ae c4e2cbf7e8                     shrx       rbp, rax, rsi
001b3 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b8 4183f840                       cmp        r8d, 0x40
001bc 0f8df61c0000                   jge        0x7fb3b3bddcb8
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
001ed 7c34                           jl         0x7fb3b3bdc023
001ef 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f4 4183c1c8                       add        r9d, -0x38
001f8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fd 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00205 8b542408                       mov        edx, dword ptr [rsp + 8]
00209 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020d 90                             nop        
0020e 90                             nop        
0020f e84c3cb5ff                     call       0x7fb3b372fc60
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7fb3b3bdc054
00223 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00228 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00230 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00235 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0023a 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00242 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
0024a 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00254 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00259 458b5a04                       mov        r11d, dword ptr [r10 + 4]
0025d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00262 4183fb20                       cmp        r11d, 0x20
00266 0f8d441b0000                   jge        0x7fb3b3bddbb0
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
002ad 0f8d551b0000                   jge        0x7fb3b3bddc08
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
002f6 0f8e7d170000                   jle        0x7fb3b3bdd879
002fc 41ffca                         dec        r10d
002ff 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00304 41ffcb                         dec        r11d
00307 44895c2470                     mov        dword ptr [rsp + 0x70], r11d
0030c 41ffc8                         dec        r8d
0030f 4489442474                     mov        dword ptr [rsp + 0x74], r8d
00314 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00319 c462a3f7542468                 shrx       r10, qword ptr [rsp + 0x68], r11
00320 41bb01000000                   mov        r11d, 1
00326 8b6c2460                       mov        ebp, dword ptr [rsp + 0x60]
0032a c44251f7db                     shlx       r11d, r11d, ebp
0032f 458bc2                         mov        r8d, r10d
00332 4489442460                     mov        dword ptr [rsp + 0x60], r8d
00337 41ffcb                         dec        r11d
0033a 4d63d3                         movsxd     r10, r11d
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
00377 0f86af170000                   jbe        0x7fb3b3bdd92c
0037d 4d63d3                         movsxd     r10, r11d
00380 4d63d9                         movsxd     r11, r9d
00383 49ffcb                         dec        r11
00386 4d3bda                         cmp        r11, r10
00389 0f839d170000                   jae        0x7fb3b3bdd92c
0038f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00394 4585db                         test       r11d, r11d
00397 0f8cc7180000                   jl         0x7fb3b3bdda64
0039d 8b2c24                         mov        ebp, dword ptr [rsp]
003a0 83c5f9                         add        ebp, -7
003a3 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003aa 4533db                         xor        r11d, r11d
003ad 4533d2                         xor        r10d, r10d
003b0 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
003b8 44899424f0000000               mov        dword ptr [rsp + 0xf0], r10d
003c0 e977020000                     jmp        0x7fb3b3bdc43c
003c5 418be8                         mov        ebp, r8d
003c8 2bee                           sub        ebp, esi
003ca 90                             nop        
003cb e8903ab5ff                     call       0x7fb3b372fc60
003d0 0f1f8400c8040001               nop        dword ptr [rax + rax + 0x10004c8]
003d8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003dd 41bb40000000                   mov        r11d, 0x40
003e3 442bdd                         sub        r11d, ebp
003e6 c462d1f7c0                     shlx       r8, rax, rbp
003eb c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003f5 4d0bc2                         or         r8, r10
003f8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003fd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00402 e9d6fdffff                     jmp        0x7fb3b3bdbfdd
00407 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
0040f 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00414 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00419 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00421 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00426 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0042a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0042e 90                             nop        
0042f 90                             nop        
00430 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00437 83fd40                         cmp        ebp, 0x40
0043a 0f8d780a0000                   jge        0x7fb3b3bdccb8
00440 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0044a 41ba01000000                   mov        r10d, 1
00450 c442d1f7d2                     shlx       r10, r10, rbp
00455 49ffca                         dec        r10
00458 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00460 458bda                         mov        r11d, r10d
00463 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0046a 83fd40                         cmp        ebp, 0x40
0046d 0f8d390b0000                   jge        0x7fb3b3bdcdac
00473 c4c2d3f7f9                     shrx       rdi, r9, rbp
00478 41ba01000000                   mov        r10d, 1
0047e c442d1f7d2                     shlx       r10, r10, rbp
00483 49ffca                         dec        r10
00486 4d23d1                         and        r10, r9
00489 418bda                         mov        ebx, r10d
0048c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00493 83fd40                         cmp        ebp, 0x40
00496 0f8d240c0000                   jge        0x7fb3b3bdcec0
0049c c4e2d3f7cf                     shrx       rcx, rdi, rbp
004a1 41ba01000000                   mov        r10d, 1
004a7 c442d1f7d2                     shlx       r10, r10, rbp
004ac 49ffca                         dec        r10
004af 4c23d7                         and        r10, rdi
004b2 458bd2                         mov        r10d, r10d
004b5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004bc 83fd40                         cmp        ebp, 0x40
004bf 0f8d130d0000                   jge        0x7fb3b3bdcfd8
004c5 41b801000000                   mov        r8d, 1
004cb c442d1f7c0                     shlx       r8, r8, rbp
004d0 49ffc8                         dec        r8
004d3 4c23c1                         and        r8, rcx
004d6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004de 418bc9                         mov        ecx, r9d
004e1 4103ca                         add        ecx, r10d
004e4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004e9 458bd2                         mov        r10d, r10d
004ec 4403d3                         add        r10d, ebx
004ef 4c63c9                         movsxd     r9, ecx
004f2 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
004fa 8bdb                           mov        ebx, ebx
004fc 4c03c3                         add        r8, rbx
004ff 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
00507 4903d9                         add        rbx, r9
0050a 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
00512 4d85c0                         test       r8, r8
00515 0f8e69070000                   jle        0x7fb3b3bdca84
0051b 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00522 0f8fb40d0000                   jg         0x7fb3b3bdd0dc
00528 4181faffff0100                 cmp        r10d, 0x1ffff
0052f 0f8fb30e0000                   jg         0x7fb3b3bdd1e8
00535 81f9ffff0300                   cmp        ecx, 0x3ffff
0053b 0f8f8f0f0000                   jg         0x7fb3b3bdd2d0
00541 418bf8                         mov        edi, r8d
00544 81ff00000010                   cmp        edi, 0x10000000
0054a 0f8368100000                   jae        0x7fb3b3bdd3b8
00550 4d63d2                         movsxd     r10, r10d
00553 4c63c7                         movsxd     r8, edi
00556 49c1e112                       shl        r9, 0x12
0055a 49c1e024                       shl        r8, 0x24
0055e 4d0bc1                         or         r8, r9
00561 4d0bc2                         or         r8, r10
00564 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0056c 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00574 4f8944ca08                     mov        qword ptr [r10 + r9*8 + 8], r8
00579 8b2c24                         mov        ebp, dword ptr [rsp]
0057c 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00580 0f8da5000000                   jge        0x7fb3b3bdc42b
00586 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0058e 49c1e830                       shr        r8, 0x30
00592 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00597 49c1ea30                       shr        r10, 0x30
0059b 418bc8                         mov        ecx, r8d
0059e 418bda                         mov        ebx, r10d
005a1 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005a9 c4422bf7cb                     shrx       r9d, r11d, r10d
005ae 44039424c8000000               add        r10d, dword ptr [rsp + 0xc8]
005b6 c4422bf7d3                     shrx       r10d, r11d, r10d
005bb 4103da                         add        ebx, r10d
005be 895c2460                       mov        dword ptr [rsp + 0x60], ebx
005c2 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005ca 4183fa20                       cmp        r10d, 0x20
005ce 0f8df4100000                   jge        0x7fb3b3bdd4c8
005d4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005dc 49c1ea30                       shr        r10, 0x30
005e0 458bc2                         mov        r8d, r10d
005e3 bb01000000                     mov        ebx, 1
005e8 448b9424c8000000               mov        r10d, dword ptr [rsp + 0xc8]
005f0 c4e229f7db                     shlx       ebx, ebx, r10d
005f5 ffcb                           dec        ebx
005f7 4123d9                         and        ebx, r9d
005fa 03d9                           add        ebx, ecx
005fc 895c2448                       mov        dword ptr [rsp + 0x48], ebx
00600 448b8c24cc000000               mov        r9d, dword ptr [rsp + 0xcc]
00608 4183f920                       cmp        r9d, 0x20
0060c 0f8d5a110000                   jge        0x7fb3b3bdd56c
00612 41ba01000000                   mov        r10d, 1
00618 c44231f7d2                     shlx       r10d, r10d, r9d
0061d 41ffca                         dec        r10d
00620 4523d3                         and        r10d, r11d
00623 4503d0                         add        r10d, r8d
00626 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0062b 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0062f 0f8dc0030000                   jge        0x7fb3b3bdc7f5
00635 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
0063c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00641 44235c2460                     and        r11d, dword ptr [rsp + 0x60]
00646 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0064b 458b5014                       mov        r10d, dword ptr [r8 + 0x14]
0064f 458b4204                       mov        r8d, dword ptr [r10 + 4]
00653 453bd8                         cmp        r11d, r8d
00656 0f8322040000                   jae        0x7fb3b3bdc87e
0065c 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00661 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00666 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0066b 418b5914                       mov        ebx, dword ptr [r9 + 0x14]
0066f 8b4b04                         mov        ecx, dword ptr [rbx + 4]
00672 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00677 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0067c 443bc1                         cmp        r8d, ecx
0067f 0f8397040000                   jae        0x7fb3b3bdc91c
00685 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0068a 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
0068f 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00694 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
00698 458b5104                       mov        r10d, dword ptr [r9 + 4]
0069c 4e8b44c308                     mov        r8, qword ptr [rbx + r8*8 + 8]
006a1 4c89842480000000               mov        qword ptr [rsp + 0x80], r8
006a9 453bda                         cmp        r11d, r10d
006ac 0f8316050000                   jae        0x7fb3b3bdc9c8
006b2 4f8b54d908                     mov        r10, qword ptr [r9 + r11*8 + 8]
006b7 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006bf 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006c6 ffc5                           inc        ebp
006c8 892c24                         mov        dword ptr [rsp], ebp
006cb 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006cf 0f8df1020000                   jge        0x7fb3b3bdc7c6
006d5 49c1ea28                       shr        r10, 0x28
006d9 458bd2                         mov        r10d, r10d
006dc 450fb6da                       movzx      r11d, r10b
006e0 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
006e8 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006ed 49c1ea28                       shr        r10, 0x28
006f1 458bda                         mov        r11d, r10d
006f4 410fb6eb                       movzx      ebp, r11b
006f8 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006ff 4d8bd0                         mov        r10, r8
00702 49c1ea28                       shr        r10, 0x28
00706 458bda                         mov        r11d, r10d
00709 450fb6db                       movzx      r11d, r11b
0070d 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
00715 4103eb                         add        ebp, r11d
00718 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0071f 41bb01000000                   mov        r11d, 1
00725 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
0072d 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00735 49c1ea20                       shr        r10, 0x20
00739 458bd2                         mov        r10d, r10d
0073c 410fb6ea                       movzx      ebp, r10b
00740 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00747 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0074c 49c1ea20                       shr        r10, 0x20
00750 458bda                         mov        r11d, r10d
00753 410fb6eb                       movzx      ebp, r11b
00757 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0075e 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00766 49c1ea20                       shr        r10, 0x20
0076a 458bd2                         mov        r10d, r10d
0076d 410fb6ea                       movzx      ebp, r10b
00771 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00778 448bcd                         mov        r9d, ebp
0077b 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
00783 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
0078b 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
00793 4585c9                         test       r9d, r9d
00796 0f84f0050000                   je         0x7fb3b3bdcb8c
0079c 4183f93f                       cmp        r9d, 0x3f
007a0 0f8fd6060000                   jg         0x7fb3b3bdcc7c
007a6 41b840000000                   mov        r8d, 0x40
007ac 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
007b1 453bc8                         cmp        r9d, r8d
007b4 7e48                           jle        0x7fb3b3bdc5fe
007b6 418bd9                         mov        ebx, r9d
007b9 412bd8                         sub        ebx, r8d
007bc 4183f840                       cmp        r8d, 0x40
007c0 0f8d3e100000                   jge        0x7fb3b3bdd604
007c6 41ba01000000                   mov        r10d, 1
007cc c442b9f7d2                     shlx       r10, r10, r8
007d1 49ffca                         dec        r10
007d4 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007dc c4c2e1f7ea                     shlx       rbp, r10, rbx
007e1 41bb40000000                   mov        r11d, 0x40
007e7 442bdb                         sub        r11d, ebx
007ea c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007f1 490bea                         or         rbp, r10
007f4 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007fc eb26                           jmp        0x7fb3b3bdc624
007fe 41ba01000000                   mov        r10d, 1
00804 c442b1f7d2                     shlx       r10, r10, r9
00809 452bc1                         sub        r8d, r9d
0080c c4e2bbf7ac2498000000           shrx       rbp, qword ptr [rsp + 0x98], r8
00816 49ffca                         dec        r10
00819 4923ea                         and        rbp, r10
0081c 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00824 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00829 4503d1                         add        r10d, r9d
0082c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00831 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00836 4503d9                         add        r11d, r9d
00839 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0083e 4183fa40                       cmp        r10d, 0x40
00842 0f8ce8fbffff                   jl         0x7fb3b3bdc230
00848 4183c2c0                       add        r10d, -0x40
0084c 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00851 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00855 83c5f8                         add        ebp, -8
00858 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085c 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00860 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00864 83c1f0                         add        ecx, -0x10
00867 83f908                         cmp        ecx, 8
0086a 0f8c08010000                   jl         0x7fb3b3bdc778
00870 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00875 4183c0e8                       add        r8d, -0x18
00879 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00881 0f8280fbffff                   jb         0x7fb3b3bdc207
00887 bee4ffffff                     mov        esi, 0xffffffe4
0088c 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00894 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00899 44891c24                       mov        dword ptr [rsp], r11d
0089d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008a2 44895c2404                     mov        dword ptr [rsp + 4], r11d
008a7 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008ac 44895c2408                     mov        dword ptr [rsp + 8], r11d
008b1 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008b6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008bb 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008c0 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008c5 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008ca 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008cf 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008d4 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008d9 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
008de 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
008e3 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008e8 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008ed 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008f2 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008f7 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008fc 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00901 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00906 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0090b 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00910 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00915 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0091a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0091f 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00924 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00929 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0092e 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00933 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0093b 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00940 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00948 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0094d 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00955 90                             nop        
00956 90                             nop        
00957 e80413afff                     call       0x7fb3b36cda60
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
0096e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00972 e8a9a46518                     call       0x7fb3cc236c20
00977 f4                             hlt        
00978 85c9                           test       ecx, ecx
0097a 7f08                           jg         0x7fb3b3bdc784
0097c 4533d2                         xor        r10d, r10d
0097f e990faffff                     jmp        0x7fb3b3bdc214
00984 8be9                           mov        ebp, ecx
00986 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0098e 8b542408                       mov        edx, dword ptr [rsp + 8]
00992 90                             nop        
00993 e8c834b5ff                     call       0x7fb3b372fc60
00998 0f1f8400900a0003               nop        dword ptr [rax + rax + 0x3000a90]
009a0 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
009a5 41c1e303                       shl        r11d, 3
009a9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
009ae 41c1e203                       shl        r10d, 3
009b2 452bda                         sub        r11d, r10d
009b5 4181c3c0000000                 add        r11d, 0xc0
009bc c462a1f7d0                     shlx       r10, rax, r11
009c1 e94efaffff                     jmp        0x7fb3b3bdc214
009c6 4533d2                         xor        r10d, r10d
009c9 33ed                           xor        ebp, ebp
009cb 4533c0                         xor        r8d, r8d
009ce 4533db                         xor        r11d, r11d
009d1 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009d9 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009e0 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
009e8 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
009f0 e938fdffff                     jmp        0x7fb3b3bdc52d
009f5 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009fd 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a05 4d03c2                         add        r8, r10
00a08 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a10 4d3bc2                         cmp        r8, r10
00a13 7e30                           jle        0x7fb3b3bdc845
00a15 48be085829e300000000           movabs     rsi, 0xe3295808
00a1f e83c34b5ff                     call       0x7fb3b372fc60
00a24 0f1f84001c0b0004               nop        dword ptr [rax + rax + 0x4000b1c]
00a2c 4885c0                         test       rax, rax
00a2f 0f8433140000                   je         0x7fb3b3bddc68
00a35 488bf0                         mov        rsi, rax
00a38 4881c410010000                 add        rsp, 0x110
00a3f 5d                             pop        rbp
00a40 e91b93aeff                     jmp        0x7fb3b36c5b60
00a45 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a4a 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a52 0f8538140000                   jne        0x7fb3b3bddc90
00a58 418bc0                         mov        eax, r8d
00a5b 4881c410010000                 add        rsp, 0x110
00a62 5d                             pop        rbp
00a63 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a67 0f8731160000                   ja         0x7fb3b3bdde9e
00a6d c3                             ret        
00a6e 4533d2                         xor        r10d, r10d
00a71 4533db                         xor        r11d, r11d
00a74 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a79 e95ff7ffff                     jmp        0x7fb3b3bdbfdd
00a7e bee4ffffff                     mov        esi, 0xffffffe4
00a83 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a8b 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00a90 44890c24                       mov        dword ptr [rsp], r9d
00a94 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00a99 4489442404                     mov        dword ptr [rsp + 4], r8d
00a9e 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00aa3 44894c2408                     mov        dword ptr [rsp + 8], r9d
00aa8 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00aad 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00ab2 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ab7 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00abc 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ac1 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ac6 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00acb 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ad0 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ad5 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ada 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00adf 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ae4 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00ae9 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00aee 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00af3 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00af8 90                             nop        
00af9 90                             nop        
00afa 90                             nop        
00afb e86011afff                     call       0x7fb3b36cda60
00b00 0f1f8400f80b0005               nop        dword ptr [rax + rax + 0x5000bf8]
00b08 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
00b12 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b16 e805a36518                     call       0x7fb3cc236c20
00b1b f4                             hlt        
00b1c bee4ffffff                     mov        esi, 0xffffffe4
00b21 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b29 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b2e 44891c24                       mov        dword ptr [rsp], r11d
00b32 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b37 4489542404                     mov        dword ptr [rsp + 4], r10d
00b3c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b41 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b46 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b4b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b50 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b55 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b5a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b5f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b64 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b69 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b6e 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b73 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b78 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b7d 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b82 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b87 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b8c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b91 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b96 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b9b 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00b9f 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00ba4 90                             nop        
00ba5 90                             nop        
00ba6 90                             nop        
00ba7 e8b410afff                     call       0x7fb3b36cda60
00bac 0f1f8400a40c0006               nop        dword ptr [rax + rax + 0x6000ca4]
00bb4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
00bbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bc2 e859a26518                     call       0x7fb3cc236c20
00bc7 f4                             hlt        
00bc8 bee4ffffff                     mov        esi, 0xffffffe4
00bcd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bd5 448b442408                     mov        r8d, dword ptr [rsp + 8]
00bda 44890424                       mov        dword ptr [rsp], r8d
00bde 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00be3 4489542404                     mov        dword ptr [rsp + 4], r10d
00be8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00bed 4489442408                     mov        dword ptr [rsp + 8], r8d
00bf2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bf7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bfc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c01 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00c06 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c0b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c10 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c15 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c1a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00c1f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00c24 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c29 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c2e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00c33 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00c38 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c3d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c42 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c47 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00c4c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c51 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00c56 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c5b 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c60 90                             nop        
00c61 90                             nop        
00c62 90                             nop        
00c63 e8f80fafff                     call       0x7fb3b36cda60
00c68 0f1f8400600d0007               nop        dword ptr [rax + rax + 0x7000d60]
00c70 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
00c7a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c7e e89da16518                     call       0x7fb3cc236c20
00c83 f4                             hlt        
00c84 4533c9                         xor        r9d, r9d
00c87 4d3bc1                         cmp        r8, r9
00c8a bdffffffff                     mov        ebp, 0xffffffff
00c8f 7c08                           jl         0x7fb3b3bdca99
00c91 400f95c5                       setne      bpl
00c95 400fb6ed                       movzx      ebp, bpl
00c99 be45ffffff                     mov        esi, 0xffffff45
00c9e 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00ca6 4c890c24                       mov        qword ptr [rsp], r9
00caa 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00caf 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00cb4 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00cbc 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00cc1 8b5c243c                       mov        ebx, dword ptr [rsp + 0x3c]
00cc5 895c2414                       mov        dword ptr [rsp + 0x14], ebx
00cc9 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00cce 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00cd3 8b5c2434                       mov        ebx, dword ptr [rsp + 0x34]
00cd7 895c2430                       mov        dword ptr [rsp + 0x30], ebx
00cdb 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00ce0 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00ce5 8b5c2448                       mov        ebx, dword ptr [rsp + 0x48]
00ce9 895c2438                       mov        dword ptr [rsp + 0x38], ebx
00ced 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cf2 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00cf7 8b5c2460                       mov        ebx, dword ptr [rsp + 0x60]
00cfb 895c2440                       mov        dword ptr [rsp + 0x40], ebx
00cff 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00d07 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00d0c 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00d10 895c2450                       mov        dword ptr [rsp + 0x50], ebx
00d14 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00d19 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00d1e 8b5c2474                       mov        ebx, dword ptr [rsp + 0x74]
00d22 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00d26 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d2b 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d30 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d38 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d3d 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d45 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d4a 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d52 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00d59 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d61 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d69 90                             nop        
00d6a 90                             nop        
00d6b e8f00eafff                     call       0x7fb3b36cda60
00d70 0f1f8400680e0008               nop        dword ptr [rax + rax + 0x8000e68]
00d78 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
00d82 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d86 e895a06518                     call       0x7fb3cc236c20
00d8b f4                             hlt        
00d8c be45ffffff                     mov        esi, 0xffffff45
00d91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d99 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d9e 44891424                       mov        dword ptr [rsp], r10d
00da2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00da7 44895c2404                     mov        dword ptr [rsp + 4], r11d
00dac 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00db1 4489542408                     mov        dword ptr [rsp + 8], r10d
00db6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dbb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00dc0 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00dc5 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00dca 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00dcf 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00dd4 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00dd9 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00dde 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00de3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00de8 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ded 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00df2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00df7 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00dfc 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e01 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e06 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e0b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e10 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e15 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e1a 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e1f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e24 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e29 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e2e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e33 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e38 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e40 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e45 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e4d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e52 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00e5a 90                             nop        
00e5b e8000eafff                     call       0x7fb3b36cda60
00e60 0f1f8400580f0009               nop        dword ptr [rax + rax + 0x9000f58]
00e68 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
00e72 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e76 e8a59f6518                     call       0x7fb3cc236c20
00e7b f4                             hlt        
00e7c be45ffffff                     mov        esi, 0xffffff45
00e81 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e89 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e8e 44891424                       mov        dword ptr [rsp], r10d
00e92 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e97 e8c40dafff                     call       0x7fb3b36cda60
00e9c 0f1f8400940f000a               nop        dword ptr [rax + rax + 0xa000f94]
00ea4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
00eae 4883e4f0                       and        rsp, 0xfffffffffffffff0
00eb2 e8699f6518                     call       0x7fb3cc236c20
00eb7 f4                             hlt        
00eb8 be45ffffff                     mov        esi, 0xffffff45
00ebd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ec5 448b542408                     mov        r10d, dword ptr [rsp + 8]
00eca 44891424                       mov        dword ptr [rsp], r10d
00ece 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ed3 44895c2404                     mov        dword ptr [rsp + 4], r11d
00ed8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00edd 4489542408                     mov        dword ptr [rsp + 8], r10d
00ee2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00eea 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00eef 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ef4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ef9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00efe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00f03 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f08 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f0d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00f12 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00f17 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f1c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f21 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f26 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f2b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f30 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f35 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f3a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f3f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f44 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00f49 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00f4e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00f53 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f58 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00f5d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00f62 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00f67 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f6c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f71 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f79 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f7e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f86 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f8b e8d00cafff                     call       0x7fb3b36cda60
00f90 0f1f84008810000b               nop        dword ptr [rax + rax + 0xb001088]
00f98 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
00fa2 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fa6 e8759e6518                     call       0x7fb3cc236c20
00fab f4                             hlt        
00fac be45ffffff                     mov        esi, 0xffffff45
00fb1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fb9 448b442408                     mov        r8d, dword ptr [rsp + 8]
00fbe 44890424                       mov        dword ptr [rsp], r8d
00fc2 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fc7 4489542404                     mov        dword ptr [rsp + 4], r10d
00fcc 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00fd1 4489442408                     mov        dword ptr [rsp + 8], r8d
00fd6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fde 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fe3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fe8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fed 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00ff2 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00ff7 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00ffc 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01001 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01006 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0100b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01010 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01015 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0101a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0101f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01024 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01029 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0102e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01033 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01038 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0103d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01042 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01047 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0104c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01051 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01056 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0105b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01060 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01065 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0106d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01072 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0107a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0107f 448b8424d8000000               mov        r8d, dword ptr [rsp + 0xd8]
01087 4489442478                     mov        dword ptr [rsp + 0x78], r8d
0108c 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
01094 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
0109c 90                             nop        
0109d 90                             nop        
0109e 90                             nop        
0109f e8bc0bafff                     call       0x7fb3b36cda60
010a4 0f1f84009c11000c               nop        dword ptr [rax + rax + 0xc00119c]
010ac 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
010b6 4883e4f0                       and        rsp, 0xfffffffffffffff0
010ba e8619d6518                     call       0x7fb3cc236c20
010bf f4                             hlt        
010c0 be45ffffff                     mov        esi, 0xffffff45
010c5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010cd 448b542408                     mov        r10d, dword ptr [rsp + 8]
010d2 44891424                       mov        dword ptr [rsp], r10d
010d6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
010db 4489442404                     mov        dword ptr [rsp + 4], r8d
010e0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
010e5 4489542408                     mov        dword ptr [rsp + 8], r10d
010ea 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
010f2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010f7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010fc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01101 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01106 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0110b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01110 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01115 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0111a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0111f 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01124 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01129 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0112e 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01133 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01138 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0113d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01142 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01147 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0114c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01151 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01156 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0115b 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01160 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01165 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
0116a 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0116f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01174 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01179 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01181 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01186 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0118e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01193 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
0119b 4489542474                     mov        dword ptr [rsp + 0x74], r10d
011a0 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011a8 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
011af 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011b7 e8a40aafff                     call       0x7fb3b36cda60
011bc 0f1f8400b412000d               nop        dword ptr [rax + rax + 0xd0012b4]
011c4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
011ce 4883e4f0                       and        rsp, 0xfffffffffffffff0
011d2 e8499c6518                     call       0x7fb3cc236c20
011d7 f4                             hlt        
011d8 be45ffffff                     mov        esi, 0xffffff45
011dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011e5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011ea 44890c24                       mov        dword ptr [rsp], r9d
011ee 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
011f3 4489442404                     mov        dword ptr [rsp + 4], r8d
011f8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
011fd 44894c2408                     mov        dword ptr [rsp + 8], r9d
01202 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01207 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0120c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01211 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01216 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0121b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01220 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01225 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0122a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0122f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01234 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01239 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0123e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01243 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01248 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0124d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01252 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01257 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0125c 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01261 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01266 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0126b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01270 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01275 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0127a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0127f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01284 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0128c 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01291 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01299 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0129e 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012a3 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
012aa 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012b2 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
012ba 90                             nop        
012bb e8a009afff                     call       0x7fb3b36cda60
012c0 0f1f8400b813000e               nop        dword ptr [rax + rax + 0xe0013b8]
012c8 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
012d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
012d6 e8459b6518                     call       0x7fb3cc236c20
012db f4                             hlt        
012dc 41b9ffffff7f                   mov        r9d, 0x7fffffff
012e2 4d3bc1                         cmp        r8, r9
012e5 bdffffffff                     mov        ebp, 0xffffffff
012ea 7c08                           jl         0x7fb3b3bdd0f4
012ec 400f95c5                       setne      bpl
012f0 400fb6ed                       movzx      ebp, bpl
012f4 be45ffffff                     mov        esi, 0xffffff45
012f9 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01301 4c890c24                       mov        qword ptr [rsp], r9
01305 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
01309 895c240c                       mov        dword ptr [rsp + 0xc], ebx
0130d 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01315 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0131a 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0131f 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01324 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
01328 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
0132c 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01331 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01336 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
0133a 895c2434                       mov        dword ptr [rsp + 0x34], ebx
0133e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01343 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01348 8b5c2468                       mov        ebx, dword ptr [rsp + 0x68]
0134c 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01350 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01355 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0135a 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01361 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01365 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0136a 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0136f 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01373 895c2454                       mov        dword ptr [rsp + 0x54], ebx
01377 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0137c 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01381 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01386 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
0138b 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01393 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01398 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
013a0 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
013a5 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
013ad 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
013b4 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013bc 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
013c4 90                             nop        
013c5 90                             nop        
013c6 90                             nop        
013c7 e89408afff                     call       0x7fb3b36cda60
013cc 0f1f8400c414000f               nop        dword ptr [rax + rax + 0xf0014c4]
013d4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
013de 4883e4f0                       and        rsp, 0xfffffffffffffff0
013e2 e8399a6518                     call       0x7fb3cc236c20
013e7 f4                             hlt        
013e8 be45ffffff                     mov        esi, 0xffffff45
013ed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013f5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
013fa 44890c24                       mov        dword ptr [rsp], r9d
013fe 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01403 44894c2404                     mov        dword ptr [rsp + 4], r9d
01408 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
0140d 44894c2408                     mov        dword ptr [rsp + 8], r9d
01412 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01417 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0141c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01421 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01426 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0142b 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01430 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01435 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0143a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0143f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01444 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01449 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0144e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01453 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01458 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0145d 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01462 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01467 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0146c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01471 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01476 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0147b 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01480 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01485 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0148a 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0148f 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01494 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0149c 4c89442460                     mov        qword ptr [rsp + 0x60], r8
014a1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
014a6 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014ae 90                             nop        
014af e8ac07afff                     call       0x7fb3b36cda60
014b4 0f1f8400ac150010               nop        dword ptr [rax + rax + 0x100015ac]
014bc 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
014c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014ca e851996518                     call       0x7fb3cc236c20
014cf f4                             hlt        
014d0 be45ffffff                     mov        esi, 0xffffff45
014d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014dd 448b542408                     mov        r10d, dword ptr [rsp + 8]
014e2 44891424                       mov        dword ptr [rsp], r10d
014e6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
014eb 4489542404                     mov        dword ptr [rsp + 4], r10d
014f0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
014f5 4489542408                     mov        dword ptr [rsp + 8], r10d
014fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
014ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01504 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01509 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0150e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01513 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01518 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0151d 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01522 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01527 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0152c 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01531 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01536 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0153b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01540 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01545 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0154a 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0154f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01554 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01559 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0155e 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01563 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01568 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0156d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01572 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01577 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0157c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01584 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01589 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0158e 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
01595 90                             nop        
01596 90                             nop        
01597 e8c406afff                     call       0x7fb3b36cda60
0159c 0f1f840094160011               nop        dword ptr [rax + rax + 0x11001694]
015a4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
015ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
015b2 e869986518                     call       0x7fb3cc236c20
015b7 f4                             hlt        
015b8 be3dffffff                     mov        esi, 0xffffff3d
015bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015c5 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
015ca 44890c24                       mov        dword ptr [rsp], r9d
015ce 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
015d3 4489442404                     mov        dword ptr [rsp + 4], r8d
015d8 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
015dd 44894c2408                     mov        dword ptr [rsp + 8], r9d
015e2 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
015e7 4c89442418                     mov        qword ptr [rsp + 0x18], r8
015ec 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
015f1 448944240c                     mov        dword ptr [rsp + 0xc], r8d
015f6 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
015fb 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01600 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01605 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0160a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0160f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01614 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01619 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0161e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01623 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01628 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0162d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01632 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01637 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0163c 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01644 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01649 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0164e 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01653 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01658 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0165d 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01662 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01667 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0166c 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01671 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01679 4c89442460                     mov        qword ptr [rsp + 0x60], r8
0167e 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01686 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0168b 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01690 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01698 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
0169f 89bc2494000000                 mov        dword ptr [rsp + 0x94], edi
016a6 90                             nop        
016a7 e8b405afff                     call       0x7fb3b36cda60
016ac 0f1f8400a4170012               nop        dword ptr [rax + rax + 0x120017a4]
016b4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
016be 4883e4f0                       and        rsp, 0xfffffffffffffff0
016c2 e859976518                     call       0x7fb3cc236c20
016c7 f4                             hlt        
016c8 be45ffffff                     mov        esi, 0xffffff45
016cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016d5 448b442408                     mov        r8d, dword ptr [rsp + 8]
016da 44890424                       mov        dword ptr [rsp], r8d
016de 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
016e3 4489442404                     mov        dword ptr [rsp + 4], r8d
016e8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
016ed 4489542408                     mov        dword ptr [rsp + 8], r10d
016f2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016f7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016fc 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01701 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01706 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0170b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01710 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01715 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0171a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0171f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01724 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01729 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0172e 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01732 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01737 4489542440                     mov        dword ptr [rsp + 0x40], r10d
0173c 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01741 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01745 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
0174a 90                             nop        
0174b e81005afff                     call       0x7fb3b36cda60
01750 0f1f840048180013               nop        dword ptr [rax + rax + 0x13001848]
01758 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01762 4883e4f0                       and        rsp, 0xfffffffffffffff0
01766 e8b5966518                     call       0x7fb3cc236c20
0176b f4                             hlt        
0176c be45ffffff                     mov        esi, 0xffffff45
01771 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01779 448b542408                     mov        r10d, dword ptr [rsp + 8]
0177e 44891424                       mov        dword ptr [rsp], r10d
01782 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01787 4489542404                     mov        dword ptr [rsp + 4], r10d
0178c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01791 44894c2408                     mov        dword ptr [rsp + 8], r9d
01796 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0179b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017a0 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
017a5 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
017aa 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
017af 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
017b4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
017b9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017be 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
017c3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
017c8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017cd 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017d2 895c2430                       mov        dword ptr [rsp + 0x30], ebx
017d6 4489442454                     mov        dword ptr [rsp + 0x54], r8d
017db 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
017e0 90                             nop        
017e1 90                             nop        
017e2 90                             nop        
017e3 e87804afff                     call       0x7fb3b36cda60
017e8 0f1f8400e0180014               nop        dword ptr [rax + rax + 0x140018e0]
017f0 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
017fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
017fe e81d966518                     call       0x7fb3cc236c20
01803 f4                             hlt        
01804 be45ffffff                     mov        esi, 0xffffff45
01809 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01811 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01816 44891c24                       mov        dword ptr [rsp], r11d
0181a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0181f 4489542404                     mov        dword ptr [rsp + 4], r10d
01824 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01829 44895c2408                     mov        dword ptr [rsp + 8], r11d
0182e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01833 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01838 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0183d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01842 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01847 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0184c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01851 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01856 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0185b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01860 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01865 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0186a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0186f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01874 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01879 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0187e 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01883 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01888 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0188d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01892 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01897 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0189c 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
018a1 4489542450                     mov        dword ptr [rsp + 0x50], r10d
018a6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018ab 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018b0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018b8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018bd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018c5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018ca 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
018d2 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
018d9 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
018e1 90                             nop        
018e2 90                             nop        
018e3 e87803afff                     call       0x7fb3b36cda60
018e8 0f1f8400e0190015               nop        dword ptr [rax + rax + 0x150019e0]
018f0 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
018fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
018fe e81d956518                     call       0x7fb3cc236c20
01903 f4                             hlt        
01904 4585c0                         test       r8d, r8d
01907 7f07                           jg         0x7fb3b3bdd710
01909 33c0                           xor        eax, eax
0190b e9b7e7ffff                     jmp        0x7fb3b3bdbec7
01910 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01914 89742428                       mov        dword ptr [rsp + 0x28], esi
01918 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
0191c 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01921 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01926 897c2410                       mov        dword ptr [rsp + 0x10], edi
0192a 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0192f 48894424f8                     mov        qword ptr [rsp - 8], rax
01934 8b0424                         mov        eax, dword ptr [rsp]
01937 89442404                       mov        dword ptr [rsp + 4], eax
0193b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01940 48894424f8                     mov        qword ptr [rsp - 8], rax
01945 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
0194c 890424                         mov        dword ptr [rsp], eax
0194f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01954 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0195c 488bf5                         mov        rsi, rbp
0195f 8b542408                       mov        edx, dword ptr [rsp + 8]
01963 418bc8                         mov        ecx, r8d
01966 90                             nop        
01967 e8f424b5ff                     call       0x7fb3b372fc60
0196c 0f1f8400641a0016               nop        dword ptr [rax + rax + 0x16001a64]
01974 41ba40000000                   mov        r10d, 0x40
0197a 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
0197f c4e2a9f7c0                     shlx       rax, rax, r10
01984 48894424f8                     mov        qword ptr [rsp - 8], rax
01989 8b442404                       mov        eax, dword ptr [rsp + 4]
0198d 890424                         mov        dword ptr [rsp], eax
01990 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01995 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
0199a 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
0199e 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
019a3 448b5c2418                     mov        r11d, dword ptr [rsp + 0x18]
019a8 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
019ac 8b742428                       mov        esi, dword ptr [rsp + 0x28]
019b0 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019b4 e90ee7ffff                     jmp        0x7fb3b3bdbec7
019b9 4585c0                         test       r8d, r8d
019bc 7f08                           jg         0x7fb3b3bdd7c6
019be 4533f6                         xor        r14d, r14d
019c1 e942e7ffff                     jmp        0x7fb3b3bdbf08
019c6 4489542438                     mov        dword ptr [rsp + 0x38], r10d
019cb 4889442430                     mov        qword ptr [rsp + 0x30], rax
019d0 8954242c                       mov        dword ptr [rsp + 0x2c], edx
019d4 89742428                       mov        dword ptr [rsp + 0x28], esi
019d8 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
019dc 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
019e1 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
019e6 897c2410                       mov        dword ptr [rsp + 0x10], edi
019ea 448944240c                     mov        dword ptr [rsp + 0xc], r8d
019ef 48894424f8                     mov        qword ptr [rsp - 8], rax
019f4 8b0424                         mov        eax, dword ptr [rsp]
019f7 89442404                       mov        dword ptr [rsp + 4], eax
019fb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a00 48894424f8                     mov        qword ptr [rsp - 8], rax
01a05 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a0c 890424                         mov        dword ptr [rsp], eax
01a0f 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a14 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a1c 488bf5                         mov        rsi, rbp
01a1f 8b542408                       mov        edx, dword ptr [rsp + 8]
01a23 418bc8                         mov        ecx, r8d
01a26 90                             nop        
01a27 e83424b5ff                     call       0x7fb3b372fc60
01a2c 0f1f8400241b0017               nop        dword ptr [rax + rax + 0x17001b24]
01a34 41ba80000000                   mov        r10d, 0x80
01a3a 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01a3f c462a9f7f0                     shlx       r14, rax, r10
01a44 48894424f8                     mov        qword ptr [rsp - 8], rax
01a49 8b442404                       mov        eax, dword ptr [rsp + 4]
01a4d 890424                         mov        dword ptr [rsp], eax
01a50 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a55 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01a59 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01a5e 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
01a62 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01a66 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a6a 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01a6f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a74 e98fe6ffff                     jmp        0x7fb3b3bdbf08
01a79 4533c0                         xor        r8d, r8d
01a7c e97cefffff                     jmp        0x7fb3b3bdc7fd
01a81 bee4ffffff                     mov        esi, 0xffffffe4
01a86 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a8e 488f0424                       pop        qword ptr [rsp]
01a92 90                             nop        
01a93 e8c801afff                     call       0x7fb3b36cda60
01a98 0f1f8400901b0018               nop        dword ptr [rax + rax + 0x18001b90]
01aa0 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01aaa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01aae e86d936518                     call       0x7fb3cc236c20
01ab3 f4                             hlt        
01ab4 be5d000000                     mov        esi, 0x5d
01ab9 90                             nop        
01aba 90                             nop        
01abb e8a001afff                     call       0x7fb3b36cda60
01ac0 0f1f8400b81b0019               nop        dword ptr [rax + rax + 0x19001bb8]
01ac8 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01ad2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ad6 e845936518                     call       0x7fb3cc236c20
01adb f4                             hlt        
01adc bef6ffffff                     mov        esi, 0xfffffff6
01ae1 90                             nop        
01ae2 90                             nop        
01ae3 e87801afff                     call       0x7fb3b36cda60
01ae8 0f1f8400e01b001a               nop        dword ptr [rax + rax + 0x1a001be0]
01af0 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01afa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01afe e81d936518                     call       0x7fb3cc236c20
01b03 f4                             hlt        
01b04 bef6ffffff                     mov        esi, 0xfffffff6
01b09 90                             nop        
01b0a 90                             nop        
01b0b e85001afff                     call       0x7fb3b36cda60
01b10 0f1f8400081c001b               nop        dword ptr [rax + rax + 0x1b001c08]
01b18 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01b22 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b26 e8f5926518                     call       0x7fb3cc236c20
01b2b f4                             hlt        
01b2c be6effffff                     mov        esi, 0xffffff6e
01b31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b3e 44891c24                       mov        dword ptr [rsp], r11d
01b42 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b47 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b4c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b51 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b56 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b5b 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b60 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b65 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b6a 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b6f 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b74 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01b79 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01b7e 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b83 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b88 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b8d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b92 90                             nop        
01b93 e8c800afff                     call       0x7fb3b36cda60
01b98 0f1f8400901c001c               nop        dword ptr [rax + rax + 0x1c001c90]
01ba0 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01baa 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bae e86d926518                     call       0x7fb3cc236c20
01bb3 f4                             hlt        
01bb4 bee4ffffff                     mov        esi, 0xffffffe4
01bb9 48ffb42490000000               push       qword ptr [rsp + 0x90]
01bc1 488f0424                       pop        qword ptr [rsp]
01bc5 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01bca 48894424f8                     mov        qword ptr [rsp - 8], rax
01bcf 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01bd6 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01bda 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bdf 894c2428                       mov        dword ptr [rsp + 0x28], ecx
01be3 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01be7 e87400afff                     call       0x7fb3b36cda60
01bec 0f1f8400e41c001d               nop        dword ptr [rax + rax + 0x1d001ce4]
01bf4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01bfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c02 e819926518                     call       0x7fb3cc236c20
01c07 f4                             hlt        
01c08 bee4ffffff                     mov        esi, 0xffffffe4
01c0d 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c15 488f0424                       pop        qword ptr [rsp]
01c19 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c25 89442418                       mov        dword ptr [rsp + 0x18], eax
01c29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2e 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01c32 89542428                       mov        dword ptr [rsp + 0x28], edx
01c36 4889442430                     mov        qword ptr [rsp + 0x30], rax
01c3b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01c40 90                             nop        
01c41 90                             nop        
01c42 90                             nop        
01c43 e81800afff                     call       0x7fb3b36cda60
01c48 0f1f8400401d001e               nop        dword ptr [rax + rax + 0x1e001d40]
01c50 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01c5a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c5e e8bd916518                     call       0x7fb3cc236c20
01c63 f4                             hlt        
01c64 bebeffffff                     mov        esi, 0xffffffbe
01c69 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c71 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c76 44891c24                       mov        dword ptr [rsp], r11d
01c7a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c7f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c84 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c89 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c8e 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c93 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c98 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c9d 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ca2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01ca7 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01cac 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01cb1 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01cb6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01cbb 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cc0 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cc5 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01cca 90                             nop        
01ccb e890ffaeff                     call       0x7fb3b36cda60
01cd0 0f1f8400c81d001f               nop        dword ptr [rax + rax + 0x1f001dc8]
01cd8 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01ce2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ce6 e835916518                     call       0x7fb3cc236c20
01ceb f4                             hlt        
01cec beccffffff                     mov        esi, 0xffffffcc
01cf1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01cf9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01cfe 44891424                       mov        dword ptr [rsp], r10d
01d02 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01d07 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d13 89442414                       mov        dword ptr [rsp + 0x14], eax
01d17 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1c 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01d20 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01d24 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01d28 90                             nop        
01d29 90                             nop        
01d2a 90                             nop        
01d2b e830ffaeff                     call       0x7fb3b36cda60
01d30 0f1f8400281e0020               nop        dword ptr [rax + rax + 0x20001e28]
01d38 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01d42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d46 e8d5906518                     call       0x7fb3cc236c20
01d4b f4                             hlt        
01d4c beccffffff                     mov        esi, 0xffffffcc
01d51 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d59 448b442408                     mov        r8d, dword ptr [rsp + 8]
01d5e 44890424                       mov        dword ptr [rsp], r8d
01d62 48894424f8                     mov        qword ptr [rsp - 8], rax
01d67 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d6e 89442410                       mov        dword ptr [rsp + 0x10], eax
01d72 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d77 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01d7b 89542418                       mov        dword ptr [rsp + 0x18], edx
01d7f 4889442428                     mov        qword ptr [rsp + 0x28], rax
01d84 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01d89 897c2434                       mov        dword ptr [rsp + 0x34], edi
01d8d 90                             nop        
01d8e 90                             nop        
01d8f e8ccfeaeff                     call       0x7fb3b36cda60
01d94 0f1f84008c1e0021               nop        dword ptr [rax + rax + 0x21001e8c]
01d9c 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01da6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01daa e871906518                     call       0x7fb3cc236c20
01daf f4                             hlt        
01db0 be45ffffff                     mov        esi, 0xffffff45
01db5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01dbd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01dc2 44891424                       mov        dword ptr [rsp], r10d
01dc6 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01dcb 4489542408                     mov        dword ptr [rsp + 8], r10d
01dd0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01dd5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dda 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01ddf 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01de4 90                             nop        
01de5 90                             nop        
01de6 90                             nop        
01de7 e874feaeff                     call       0x7fb3b36cda60
01dec 0f1f8400e41e0022               nop        dword ptr [rax + rax + 0x22001ee4]
01df4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01dfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e02 e819906518                     call       0x7fb3cc236c20
01e07 f4                             hlt        
01e08 be45ffffff                     mov        esi, 0xffffff45
01e0d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e15 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e1a 44891c24                       mov        dword ptr [rsp], r11d
01e1e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01e23 44895c2408                     mov        dword ptr [rsp + 8], r11d
01e28 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e2d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e32 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e37 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e3c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01e41 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01e46 90                             nop        
01e47 e814feaeff                     call       0x7fb3b36cda60
01e4c 0f1f8400441f0023               nop        dword ptr [rax + rax + 0x23001f44]
01e54 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01e5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e62 e8b98f6518                     call       0x7fb3cc236c20
01e67 f4                             hlt        
01e68 bef6ffffff                     mov        esi, 0xfffffff6
01e6d 90                             nop        
01e6e 90                             nop        
01e6f e8ecfdaeff                     call       0x7fb3b36cda60
01e74 0f1f84006c1f0024               nop        dword ptr [rax + rax + 0x24001f6c]
01e7c 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01e86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e8a e8918f6518                     call       0x7fb3cc236c20
01e8f f4                             hlt        
01e90 be5d000000                     mov        esi, 0x5d
01e95 90                             nop        
01e96 90                             nop        
01e97 e8c4fdaeff                     call       0x7fb3b36cda60
01e9c 0f1f8400941f0025               nop        dword ptr [rax + rax + 0x25001f94]
01ea4 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01eae 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eb2 e8698f6518                     call       0x7fb3cc236c20
01eb7 f4                             hlt        
01eb8 be45ffffff                     mov        esi, 0xffffff45
01ebd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ec5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01eca 44891c24                       mov        dword ptr [rsp], r11d
01ece 90                             nop        
01ecf e88cfdaeff                     call       0x7fb3b36cda60
01ed4 0f1f8400cc1f0026               nop        dword ptr [rax + rax + 0x26001fcc]
01edc 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01ee6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01eea e8318f6518                     call       0x7fb3cc236c20
01eef f4                             hlt        
01ef0 bef6ffffff                     mov        esi, 0xfffffff6
01ef5 418beb                         mov        ebp, r11d
01ef8 90                             nop        
01ef9 90                             nop        
01efa 90                             nop        
01efb e860fdaeff                     call       0x7fb3b36cda60
01f00 0f1f8400f81f0027               nop        dword ptr [rax + rax + 0x27001ff8]
01f08 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01f12 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f16 e8058f6518                     call       0x7fb3cc236c20
01f1b f4                             hlt        
01f1c bef6ffffff                     mov        esi, 0xfffffff6
01f21 418be8                         mov        ebp, r8d
01f24 90                             nop        
01f25 90                             nop        
01f26 90                             nop        
01f27 e834fdaeff                     call       0x7fb3b36cda60
01f2c 0f1f840024200028               nop        dword ptr [rax + rax + 0x28002024]
01f34 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01f3e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f42 e8d98e6518                     call       0x7fb3cc236c20
01f47 f4                             hlt        
01f48 bef6ffffff                     mov        esi, 0xfffffff6
01f4d 418beb                         mov        ebp, r11d
01f50 90                             nop        
01f51 90                             nop        
01f52 90                             nop        
01f53 e808fdaeff                     call       0x7fb3b36cda60
01f58 0f1f840050200029               nop        dword ptr [rax + rax + 0x29002050]
01f60 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01f6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f6e e8ad8e6518                     call       0x7fb3cc236c20
01f73 f4                             hlt        
01f74 bef6ffffff                     mov        esi, 0xfffffff6
01f79 90                             nop        
01f7a 90                             nop        
01f7b e8e0fcaeff                     call       0x7fb3b36cda60
01f80 0f1f84007820002a               nop        dword ptr [rax + rax + 0x2a002078]
01f88 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01f92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f96 e8858e6518                     call       0x7fb3cc236c20
01f9b f4                             hlt        
01f9c bef6ffffff                     mov        esi, 0xfffffff6
01fa1 90                             nop        
01fa2 90                             nop        
01fa3 e8b8fcaeff                     call       0x7fb3b36cda60
01fa8 0f1f8400a020002b               nop        dword ptr [rax + rax + 0x2b0020a0]
01fb0 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01fba 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fbe e85d8e6518                     call       0x7fb3cc236c20
01fc3 f4                             hlt        
01fc4 bef6ffffff                     mov        esi, 0xfffffff6
01fc9 90                             nop        
01fca 90                             nop        
01fcb e890fcaeff                     call       0x7fb3b36cda60
01fd0 0f1f8400c820002c               nop        dword ptr [rax + rax + 0x2c0020c8]
01fd8 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
01fe2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fe6 e8358e6518                     call       0x7fb3cc236c20
01feb f4                             hlt        
01fec bef6ffffff                     mov        esi, 0xfffffff6
01ff1 90                             nop        
01ff2 90                             nop        
01ff3 e868fcaeff                     call       0x7fb3b36cda60
01ff8 0f1f8400f020002d               nop        dword ptr [rax + rax + 0x2d0020f0]
02000 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
0200a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0200e e80d8e6518                     call       0x7fb3cc236c20
02013 f4                             hlt        
02014 bef6ffffff                     mov        esi, 0xfffffff6
02019 90                             nop        
0201a 90                             nop        
0201b e840fcaeff                     call       0x7fb3b36cda60
02020 0f1f84001821002e               nop        dword ptr [rax + rax + 0x2e002118]
02028 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
02032 4883e4f0                       and        rsp, 0xfffffffffffffff0
02036 e8e58d6518                     call       0x7fb3cc236c20
0203b f4                             hlt        
0203c bef6ffffff                     mov        esi, 0xfffffff6
02041 90                             nop        
02042 90                             nop        
02043 e818fcaeff                     call       0x7fb3b36cda60
02048 0f1f84004021002f               nop        dword ptr [rax + rax + 0x2f002140]
02050 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
0205a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0205e e8bd8d6518                     call       0x7fb3cc236c20
02063 f4                             hlt        
02064 bef6ffffff                     mov        esi, 0xfffffff6
02069 90                             nop        
0206a 90                             nop        
0206b e8f0fbaeff                     call       0x7fb3b36cda60
02070 0f1f840068210030               nop        dword ptr [rax + rax + 0x30002168]
02078 48bfc0ef048cb37f0000           movabs     rdi, 0x7fb38c04efc0
02082 4883e4f0                       and        rsp, 0xfffffffffffffff0
02086 e8958d6518                     call       0x7fb3cc236c20
0208b f4                             hlt        
0208c eb08                           jmp        0x7fb3b3bdde96
0208e eb06                           jmp        0x7fb3b3bdde96
02090 eb04                           jmp        0x7fb3b3bdde96
02092 eb02                           jmp        0x7fb3b3bdde96
02094 eb00                           jmp        0x7fb3b3bdde96
02096 488bf0                         mov        rsi, rax
02099 e99ae9ffff                     jmp        0x7fb3b3bdc838
0209e 49ba63c8bdb3b37f0000           movabs     r10, 0x7fb3b3bdc863
020a8 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
020af e9ac44b5ff                     jmp        0x7fb3b3732360
020b4 e82713b4ff                     call       0x7fb3b371f1e0
020b9 e960dfffff                     jmp        0x7fb3b3bdbe1e
020be f4                             hlt        
020bf f4                             hlt        
