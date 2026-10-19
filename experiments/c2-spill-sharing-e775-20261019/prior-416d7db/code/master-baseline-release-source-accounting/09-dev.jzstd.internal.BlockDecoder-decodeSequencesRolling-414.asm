00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85521e0000                   jne        0x7ffaebe69470
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
00050 0f83db190000                   jae        0x7ffaebe69031
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f84eb190000                   je         0x7ffaebe69050
00065 448bda                         mov        r11d, edx
00068 442bd9                         sub        r11d, ecx
0006b 8b3c24                         mov        edi, dword ptr [rsp]
0006e 83c7f9                         add        edi, -7
00071 448d6af8                       lea        r13d, [rdx - 8]
00075 468d0cdd00000000               lea        r9d, [r11*8]
0007d f3450fbdd0                     lzcnt      r10d, r8d
00082 be1f000000                     mov        esi, 0x1f
00087 412bf2                         sub        esi, r10d
0008a b908000000                     mov        ecx, 8
0008f 2bce                           sub        ecx, esi
00091 418bd1                         mov        edx, r9d
00094 2bd1                           sub        edx, ecx
00096 4183fb08                       cmp        r11d, 8
0009a 0f8c14180000                   jl         0x7ffaebe68eb4
000a0 85ff                           test       edi, edi
000a2 0f8c541b0000                   jl         0x7ffaebe691fc
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83491a0000                   jae        0x7ffaebe69100
000b7 458bc5                         mov        r8d, r13d
000ba 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
000c2 4b8b440208                     mov        rax, qword ptr [r10 + r8 + 8]
000c7 4183c3f8                       add        r11d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183fb08                       cmp        r11d, 8
000db 0f8c88180000                   jl         0x7ffaebe68f69
000e1 85ff                           test       edi, edi
000e3 0f8c5f1b0000                   jl         0x7ffaebe69248
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f83481a0000                   jae        0x7ffaebe69140
000f8 458bda                         mov        r11d, r10d
000fb 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
00103 4f8b741808                     mov        r14, qword ptr [r8 + r11 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00111 4585db                         test       r11d, r11d
00114 0f844a190000                   je         0x7ffaebe69064
0011a 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
0011e 458b4104                       mov        r8d, dword ptr [r9 + 4]
00122 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00125 85db                           test       ebx, ebx
00127 0f844b190000                   je         0x7ffaebe69078
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
00195 0f84e2080000                   je         0x7ffaebe6807d
0019b be40000000                     mov        esi, 0x40
001a0 2bf1                           sub        esi, ecx
001a2 443bc6                         cmp        r8d, esi
001a5 0f8f1c020000                   jg         0x7ffaebe679c7
001ab 412bf0                         sub        esi, r8d
001ae c4e2cbf7e8                     shrx       rbp, rax, rsi
001b3 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b8 4183f840                       cmp        r8d, 0x40
001bc 0f8d8e1b0000                   jge        0x7ffaebe69350
001c2 41ba01000000                   mov        r10d, 1
001c8 c4c2b9f7ea                     shlx       rbp, r10, r8
001cd 48ffcd                         dec        rbp
001d0 48236c2460                     and        rbp, qword ptr [rsp + 0x60]
001d5 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001da 458bd0                         mov        r10d, r8d
001dd 458bca                         mov        r9d, r10d
001e0 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e5 458d5908                       lea        r11d, [r9 + 8]
001e9 4183fb40                       cmp        r11d, 0x40
001ed 7c34                           jl         0x7ffaebe67823
001ef 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f4 4183c1c8                       add        r9d, -0x38
001f8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fd 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00205 8b542408                       mov        edx, dword ptr [rsp + 8]
00209 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020d 6690                           nop        
0020f e84c40a9ff                     call       0x7ffaeb8fb860
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7ffaebe67854
00223 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
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
00266 0f8d2c1a0000                   jge        0x7ffaebe69298
0026c c462a3f7542460                 shrx       r10, qword ptr [rsp + 0x60], r11
00273 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00278 41bb01000000                   mov        r11d, 1
0027e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00283 c44229f7db                     shlx       r11d, r11d, r10d
00288 41ffcb                         dec        r11d
0028b 4d63d3                         movsxd     r10, r11d
0028e 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00293 458bd2                         mov        r10d, r10d
00296 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0029b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002a0 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002a4 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
002a9 4183fb20                       cmp        r11d, 0x20
002ad 0f8d291a0000                   jge        0x7ffaebe692dc
002b3 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002bb 458b5204                       mov        r10d, dword ptr [r10 + 4]
002bf 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002c7 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002cc 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002d0 458b4304                       mov        r8d, dword ptr [r11 + 4]
002d4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
002d9 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
002dd 458b4a04                       mov        r9d, dword ptr [r10 + 4]
002e1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
002e6 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002ea 458b5204                       mov        r10d, dword ptr [r10 + 4]
002ee 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002f3 4585db                         test       r11d, r11d
002f6 0f8e2d170000                   jle        0x7ffaebe69029
002fc 41ffc8                         dec        r8d
002ff 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00304 41ffc9                         dec        r9d
00307 44894c2470                     mov        dword ptr [rsp + 0x70], r9d
0030c 41ffca                         dec        r10d
0030f 4489542474                     mov        dword ptr [rsp + 0x74], r10d
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
00370 458b5204                       mov        r10d, dword ptr [r10 + 4]
00374 4585d2                         test       r10d, r10d
00377 0f860f170000                   jbe        0x7ffaebe6908c
0037d 4d63d2                         movsxd     r10, r10d
00380 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00385 49ffcb                         dec        r11
00388 4d3bda                         cmp        r11, r10
0038b 0f83fb160000                   jae        0x7ffaebe6908c
00391 448b542404                     mov        r10d, dword ptr [rsp + 4]
00396 4585d2                         test       r10d, r10d
00399 0f8ce9170000                   jl         0x7ffaebe69188
0039f 8b2c24                         mov        ebp, dword ptr [rsp]
003a2 83c5f9                         add        ebp, -7
003a5 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003ac 4533d2                         xor        r10d, r10d
003af 4533db                         xor        r11d, r11d
003b2 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
003ba 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
003c2 e990020000                     jmp        0x7ffaebe67c57
003c7 418be8                         mov        ebp, r8d
003ca 2bee                           sub        ebp, esi
003cc 666690                         nop        
003cf e88c3ea9ff                     call       0x7ffaeb8fb860
003d4 0f1f8400cc040001               nop        dword ptr [rax + rax + 0x10004cc]
003dc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003e1 41ba40000000                   mov        r10d, 0x40
003e7 442bd5                         sub        r10d, ebp
003ea c462d1f7d8                     shlx       r11, rax, rbp
003ef c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003f9 4d0bda                         or         r11, r10
003fc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00401 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00406 e9d2fdffff                     jmp        0x7ffaebe677dd
0040b 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00413 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00418 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0041d 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00425 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0042a 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0042e 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00432 0f1f8000000000                 nop        dword ptr [rax]
00439 0f1f8000000000                 nop        dword ptr [rax]
00440 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00447 83fd40                         cmp        ebp, 0x40
0044a 0f8df8090000                   jge        0x7ffaebe68448
00450 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0045a 41ba01000000                   mov        r10d, 1
00460 c442d1f7d2                     shlx       r10, r10, rbp
00465 49ffca                         dec        r10
00468 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00470 458bda                         mov        r11d, r10d
00473 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0047a 83fd40                         cmp        ebp, 0x40
0047d 0f8da50a0000                   jge        0x7ffaebe68528
00483 c4c2d3f7f9                     shrx       rdi, r9, rbp
00488 41ba01000000                   mov        r10d, 1
0048e c442d1f7d2                     shlx       r10, r10, rbp
00493 49ffca                         dec        r10
00496 4d23d1                         and        r10, r9
00499 418bca                         mov        ecx, r10d
0049c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
004a3 83fd40                         cmp        ebp, 0x40
004a6 0f8d7c0b0000                   jge        0x7ffaebe68628
004ac c4e2d3f7df                     shrx       rbx, rdi, rbp
004b1 41ba01000000                   mov        r10d, 1
004b7 c442d1f7d2                     shlx       r10, r10, rbp
004bc 49ffca                         dec        r10
004bf 4c23d7                         and        r10, rdi
004c2 458bd2                         mov        r10d, r10d
004c5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004cc 83fd40                         cmp        ebp, 0x40
004cf 0f8d570c0000                   jge        0x7ffaebe6872c
004d5 41b801000000                   mov        r8d, 1
004db c442d1f7c0                     shlx       r8, r8, rbp
004e0 49ffc8                         dec        r8
004e3 4c23c3                         and        r8, rbx
004e6 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004ee 418bd9                         mov        ebx, r9d
004f1 4103da                         add        ebx, r10d
004f4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004f9 458bd2                         mov        r10d, r10d
004fc 4403d1                         add        r10d, ecx
004ff 4c63cb                         movsxd     r9, ebx
00502 488b8c2480000000               mov        rcx, qword ptr [rsp + 0x80]
0050a 8bc9                           mov        ecx, ecx
0050c 4c03c1                         add        r8, rcx
0050f 488b8c24e8000000               mov        rcx, qword ptr [rsp + 0xe8]
00517 4903c9                         add        rcx, r9
0051a 48898c24e8000000               mov        qword ptr [rsp + 0xe8], rcx
00522 4d85c0                         test       r8, r8
00525 0f8e25070000                   jle        0x7ffaebe68250
0052b 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00532 0f8fe40c0000                   jg         0x7ffaebe6881c
00538 4181faffff0100                 cmp        r10d, 0x1ffff
0053f 0f8fcf0d0000                   jg         0x7ffaebe68914
00545 81fbffff0300                   cmp        ebx, 0x3ffff
0054b 0f8f970e0000                   jg         0x7ffaebe689e8
00551 418bc8                         mov        ecx, r8d
00554 81f900000010                   cmp        ecx, 0x10000000
0055a 0f835c0f0000                   jae        0x7ffaebe68abc
00560 4d63d2                         movsxd     r10, r10d
00563 4c63c1                         movsxd     r8, ecx
00566 49c1e112                       shl        r9, 0x12
0056a 49c1e024                       shl        r8, 0x24
0056e 4d0bc1                         or         r8, r9
00571 4d0bc2                         or         r8, r10
00574 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
0057c 448b8c24f0000000               mov        r9d, dword ptr [rsp + 0xf0]
00584 4f8944ca08                     mov        qword ptr [r10 + r9*8 + 8], r8
00589 8b2c24                         mov        ebp, dword ptr [rsp]
0058c 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00590 0f8db0000000                   jge        0x7ffaebe67c46
00596 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0059e 49c1e830                       shr        r8, 0x30
005a2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
005a7 49c1ea30                       shr        r10, 0x30
005ab 458bc8                         mov        r9d, r8d
005ae 458bd2                         mov        r10d, r10d
005b1 8b8c24cc000000                 mov        ecx, dword ptr [rsp + 0xcc]
005b8 c4c273f7db                     shrx       ebx, r11d, ecx
005bd 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
005c5 44038424c8000000               add        r8d, dword ptr [rsp + 0xc8]
005cd c4c23bf7cb                     shrx       ecx, r11d, r8d
005d2 4403d1                         add        r10d, ecx
005d5 4489542460                     mov        dword ptr [rsp + 0x60], r10d
005da 448b8424c8000000               mov        r8d, dword ptr [rsp + 0xc8]
005e2 4183f820                       cmp        r8d, 0x20
005e6 0f8dcc0f0000                   jge        0x7ffaebe68bb8
005ec 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005f4 49c1ea30                       shr        r10, 0x30
005f8 458bc2                         mov        r8d, r10d
005fb 41ba01000000                   mov        r10d, 1
00601 8bbc24c8000000                 mov        edi, dword ptr [rsp + 0xc8]
00608 c44241f7d2                     shlx       r10d, r10d, edi
0060d 41ffca                         dec        r10d
00610 4423d3                         and        r10d, ebx
00613 4503d1                         add        r10d, r9d
00616 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0061b 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
00623 4183fa20                       cmp        r10d, 0x20
00627 0f8d23100000                   jge        0x7ffaebe68c50
0062d 41b901000000                   mov        r9d, 1
00633 c44229f7c9                     shlx       r9d, r9d, r10d
00638 41ffc9                         dec        r9d
0063b 4523cb                         and        r9d, r11d
0063e 4503c8                         add        r9d, r8d
00641 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00646 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0064a 0f8db1030000                   jge        0x7ffaebe68001
00650 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00657 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0065c 44235c2460                     and        r11d, dword ptr [rsp + 0x60]
00661 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00666 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0066a 458b4a04                       mov        r9d, dword ptr [r10 + 4]
0066e 453bd9                         cmp        r11d, r9d
00671 0f8316040000                   jae        0x7ffaebe6808d
00677 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0067c 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00681 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00685 8b5914                         mov        ebx, dword ptr [rcx + 0x14]
00688 448b4b04                       mov        r9d, dword ptr [rbx + 4]
0068c 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00691 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00696 453bc1                         cmp        r8d, r9d
00699 0f8375040000                   jae        0x7ffaebe68114
0069f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
006a4 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
006a9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006ae 458b4a14                       mov        r9d, dword ptr [r10 + 0x14]
006b2 418b4904                       mov        ecx, dword ptr [r9 + 4]
006b6 4e8b54c308                     mov        r10, qword ptr [rbx + r8*8 + 8]
006bb 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006c3 443bd9                         cmp        r11d, ecx
006c6 0f83dc040000                   jae        0x7ffaebe681a8
006cc 4f8b54d908                     mov        r10, qword ptr [r9 + r11*8 + 8]
006d1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006d9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006e0 ffc5                           inc        ebp
006e2 892c24                         mov        dword ptr [rsp], ebp
006e5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006e9 0f8de3020000                   jge        0x7ffaebe67fd2
006ef 49c1ea28                       shr        r10, 0x28
006f3 458bda                         mov        r11d, r10d
006f6 450fb6d3                       movzx      r10d, r11b
006fa 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
00702 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00707 49c1ea28                       shr        r10, 0x28
0070b 458bd2                         mov        r10d, r10d
0070e 410fb6ea                       movzx      ebp, r10b
00712 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
00719 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00721 49c1ea28                       shr        r10, 0x28
00725 458bd2                         mov        r10d, r10d
00728 450fb6d2                       movzx      r10d, r10b
0072c 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00734 4103ea                         add        ebp, r10d
00737 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
0073e 41ba01000000                   mov        r10d, 1
00744 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
0074c 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00754 49c1ea20                       shr        r10, 0x20
00758 458bda                         mov        r11d, r10d
0075b 410fb6eb                       movzx      ebp, r11b
0075f 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00766 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0076b 49c1ea20                       shr        r10, 0x20
0076f 458bd2                         mov        r10d, r10d
00772 410fb6ea                       movzx      ebp, r10b
00776 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0077d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00785 49c1ea20                       shr        r10, 0x20
00789 458bda                         mov        r11d, r10d
0078c 410fb6eb                       movzx      ebp, r11b
00790 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00797 448bcd                         mov        r9d, ebp
0079a 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
007a2 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
007aa 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
007b2 4585c9                         test       r9d, r9d
007b5 0f8489050000                   je         0x7ffaebe68344
007bb 4183f93f                       cmp        r9d, 0x3f
007bf 0f8f5b060000                   jg         0x7ffaebe68420
007c5 b940000000                     mov        ecx, 0x40
007ca 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
007ce 443bc9                         cmp        r9d, ecx
007d1 7e47                           jle        0x7ffaebe67e1a
007d3 458bc1                         mov        r8d, r9d
007d6 442bc1                         sub        r8d, ecx
007d9 83f940                         cmp        ecx, 0x40
007dc 0f8de60f0000                   jge        0x7ffaebe68dc8
007e2 41ba01000000                   mov        r10d, 1
007e8 c442f1f7d2                     shlx       r10, r10, rcx
007ed 49ffca                         dec        r10
007f0 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007f8 c4c2b9f7ea                     shlx       rbp, r10, r8
007fd 41ba40000000                   mov        r10d, 0x40
00803 452bd0                         sub        r10d, r8d
00806 c462abf7542420                 shrx       r10, qword ptr [rsp + 0x20], r10
0080d 490bea                         or         rbp, r10
00810 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00818 eb30                           jmp        0x7ffaebe67e4a
0081a 412bc9                         sub        ecx, r9d
0081d c462f3f7842498000000           shrx       r8, qword ptr [rsp + 0x98], rcx
00827 4183f940                       cmp        r9d, 0x40
0082b 0f8da70e0000                   jge        0x7ffaebe68cd8
00831 41ba01000000                   mov        r10d, 1
00837 c4c2b1f7ea                     shlx       rbp, r10, r9
0083c 48ffcd                         dec        rbp
0083f 4923e8                         and        rbp, r8
00842 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0084a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0084f 4503d9                         add        r11d, r9d
00852 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00857 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0085c 4503d1                         add        r10d, r9d
0085f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00864 4183fb40                       cmp        r11d, 0x40
00868 0f8cd2fbffff                   jl         0x7ffaebe67a40
0086e 4183c3c0                       add        r11d, -0x40
00872 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00877 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0087b 83c5f8                         add        ebp, -8
0087e 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00882 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00886 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0088a 83c1f0                         add        ecx, -0x10
0088d 83f908                         cmp        ecx, 8
00890 0f8cee000000                   jl         0x7ffaebe67f84
00896 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0089b 4183c0e8                       add        r8d, -0x18
0089f 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
008a7 0f825efbffff                   jb         0x7ffaebe67a0b
008ad bee4ffffff                     mov        esi, 0xffffffe4
008b2 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
008ba 448b542408                     mov        r10d, dword ptr [rsp + 8]
008bf 44891424                       mov        dword ptr [rsp], r10d
008c3 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
008c8 4489542404                     mov        dword ptr [rsp + 4], r10d
008cd 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
008d2 4489542408                     mov        dword ptr [rsp + 8], r10d
008d7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008dc 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008e1 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008e6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008eb 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008f0 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008f5 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008fa 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008ff 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00904 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00909 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0090e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00913 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00918 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0091d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00922 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00927 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0092c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00931 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00936 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0093b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00940 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00945 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0094a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0094f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00954 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0095c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00961 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00969 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0096e 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00976 90                             nop        
00977 e8e4b6b5ff                     call       0x7ffaeb9c3660
0097c 0f1f8400740a0002               nop        dword ptr [rax + rax + 0x2000a74]
00984 85c9                           test       ecx, ecx
00986 7f08                           jg         0x7ffaebe67f90
00988 4533d2                         xor        r10d, r10d
0098b e988faffff                     jmp        0x7ffaebe67a18
00990 8be9                           mov        ebp, ecx
00992 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0099a 8b542408                       mov        edx, dword ptr [rsp + 8]
0099e 90                             nop        
0099f e8bc38a9ff                     call       0x7ffaeb8fb860
009a4 0f1f84009c0a0003               nop        dword ptr [rax + rax + 0x3000a9c]
009ac 448b542408                     mov        r10d, dword ptr [rsp + 8]
009b1 41c1e203                       shl        r10d, 3
009b5 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ba 41c1e003                       shl        r8d, 3
009be 452bd0                         sub        r10d, r8d
009c1 4181c2c0000000                 add        r10d, 0xc0
009c8 c462a9f7d0                     shlx       r10, rax, r10
009cd e946faffff                     jmp        0x7ffaebe67a18
009d2 4533db                         xor        r11d, r11d
009d5 33ed                           xor        ebp, ebp
009d7 4533d2                         xor        r10d, r10d
009da 4533c9                         xor        r9d, r9d
009dd 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009e5 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009ec 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
009f4 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
009fc e94bfdffff                     jmp        0x7ffaebe67d4c
00a01 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a09 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a11 4d03c2                         add        r8, r10
00a14 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a1c 4d3bc2                         cmp        r8, r10
00a1f 7f29                           jg         0x7ffaebe6804a
00a21 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a26 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a2e 0f8508130000                   jne        0x7ffaebe6933c
00a34 418bc0                         mov        eax, r8d
00a37 4881c410010000                 add        rsp, 0x110
00a3e 5d                             pop        rbp
00a3f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a43 0f8711140000                   ja         0x7ffaebe6945a
00a49 c3                             ret        
00a4a 48be40c92ae300000000           movabs     rsi, 0xe32ac940
00a54 666690                         nop        
00a57 e80438a9ff                     call       0x7ffaeb8fb860
00a5c 0f1f8400540b0004               nop        dword ptr [rax + rax + 0x4000b54]
00a64 4885c0                         test       rax, rax
00a67 0f84bb120000                   je         0x7ffaebe69328
00a6d 488bf0                         mov        rsi, rax
00a70 4881c410010000                 add        rsp, 0x110
00a77 5d                             pop        rbp
00a78 e96317b6ff                     jmp        0x7ffaeb9c97e0
00a7d 4533d2                         xor        r10d, r10d
00a80 4533db                         xor        r11d, r11d
00a83 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a88 e950f7ffff                     jmp        0x7ffaebe677dd
00a8d bee4ffffff                     mov        esi, 0xffffffe4
00a92 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a9a 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00a9f 44890c24                       mov        dword ptr [rsp], r9d
00aa3 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00aa8 4489442404                     mov        dword ptr [rsp + 4], r8d
00aad 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00ab2 44894c2408                     mov        dword ptr [rsp + 8], r9d
00ab7 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00abc 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00ac1 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ac6 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00acb 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ad0 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ad5 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ada 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00adf 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00ae4 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00ae9 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00aee 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00af3 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00af8 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00afd 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00b02 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b07 e854b5b5ff                     call       0x7ffaeb9c3660
00b0c 0f1f8400040c0005               nop        dword ptr [rax + rax + 0x5000c04]
00b14 bee4ffffff                     mov        esi, 0xffffffe4
00b19 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b21 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b26 44891c24                       mov        dword ptr [rsp], r11d
00b2a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b2f 4489542404                     mov        dword ptr [rsp + 4], r10d
00b34 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b39 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b3e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b43 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b48 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b4d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b52 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b57 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b5c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b61 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b66 894c2428                       mov        dword ptr [rsp + 0x28], ecx
00b6a 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b6f 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b74 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b79 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b7e 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b83 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b88 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b8d 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b92 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00b96 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b9b e8c0b4b5ff                     call       0x7ffaeb9c3660
00ba0 0f1f8400980c0006               nop        dword ptr [rax + rax + 0x6000c98]
00ba8 bee4ffffff                     mov        esi, 0xffffffe4
00bad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bb5 448b442408                     mov        r8d, dword ptr [rsp + 8]
00bba 44890424                       mov        dword ptr [rsp], r8d
00bbe 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00bc3 4489542404                     mov        dword ptr [rsp + 4], r10d
00bc8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00bcd 4489442408                     mov        dword ptr [rsp + 8], r8d
00bd2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00bd7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00bdc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00be1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00be6 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00beb 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00bf0 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00bf5 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00bfa 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00bff 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00c04 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c09 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c0e 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00c13 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00c18 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c1d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c22 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c27 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00c2c 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c31 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00c36 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c3b 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c40 666690                         nop        
00c43 e818b4b5ff                     call       0x7ffaeb9c3660
00c48 0f1f8400400d0007               nop        dword ptr [rax + rax + 0x7000d40]
00c50 4533c9                         xor        r9d, r9d
00c53 4d3bc1                         cmp        r8, r9
00c56 bdffffffff                     mov        ebp, 0xffffffff
00c5b 7c08                           jl         0x7ffaebe68265
00c5d 400f95c5                       setne      bpl
00c61 400fb6ed                       movzx      ebp, bpl
00c65 be45ffffff                     mov        esi, 0xffffff45
00c6a 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00c72 4c890c24                       mov        qword ptr [rsp], r9
00c76 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c7b 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c80 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00c88 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00c8d 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00c91 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00c95 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00c9a 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00c9f 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00ca3 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00ca7 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00cac 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00cb1 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00cb5 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00cb9 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cbe 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00cc3 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00cc7 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00ccb 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00cd3 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00cd8 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00cdc 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00ce0 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00ce5 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00cea 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00cee 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00cf2 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00cf7 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00cfc 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d04 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d09 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d11 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d16 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d1e 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d25 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d2d 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d35 6690                           nop        
00d37 e824b3b5ff                     call       0x7ffaeb9c3660
00d3c 0f1f8400340e0008               nop        dword ptr [rax + rax + 0x8000e34]
00d44 be45ffffff                     mov        esi, 0xffffff45
00d49 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d51 448b542408                     mov        r10d, dword ptr [rsp + 8]
00d56 44891424                       mov        dword ptr [rsp], r10d
00d5a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00d5f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00d64 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00d69 4489542408                     mov        dword ptr [rsp + 8], r10d
00d6e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d73 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d78 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00d7d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d82 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d87 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d8c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00d91 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00d96 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00d9b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00da0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00da5 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00daa 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00daf 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00db4 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00db9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00dbe 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00dc3 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00dc8 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00dcd 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00dd2 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00dd7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ddc 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00de1 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00de6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00deb 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00df0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00df8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00dfd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e05 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e0a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00e12 90                             nop        
00e13 e848b2b5ff                     call       0x7ffaeb9c3660
00e18 0f1f8400100f0009               nop        dword ptr [rax + rax + 0x9000f10]
00e20 be45ffffff                     mov        esi, 0xffffff45
00e25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e2d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e32 44891424                       mov        dword ptr [rsp], r10d
00e36 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e3b e820b2b5ff                     call       0x7ffaeb9c3660
00e40 0f1f8400380f000a               nop        dword ptr [rax + rax + 0xa000f38]
00e48 be45ffffff                     mov        esi, 0xffffff45
00e4d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e55 448b542408                     mov        r10d, dword ptr [rsp + 8]
00e5a 44891424                       mov        dword ptr [rsp], r10d
00e5e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00e63 44895c2404                     mov        dword ptr [rsp + 4], r11d
00e68 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00e6d 4489542408                     mov        dword ptr [rsp + 8], r10d
00e72 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e7a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e7f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e84 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e89 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e8e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e93 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e98 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e9d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00ea2 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00ea7 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00eac 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00eb1 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00eb6 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00ebb 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ec0 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00ec5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00eca 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00ecf 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00ed4 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ed9 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ede 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00ee3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00ee8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00eed 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00ef2 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00ef7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00efc 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f01 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f09 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f0e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00f16 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f1b e840b1b5ff                     call       0x7ffaeb9c3660
00f20 0f1f84001810000b               nop        dword ptr [rax + rax + 0xb001018]
00f28 be45ffffff                     mov        esi, 0xffffff45
00f2d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f35 448b442408                     mov        r8d, dword ptr [rsp + 8]
00f3a 44890424                       mov        dword ptr [rsp], r8d
00f3e 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00f43 4489542404                     mov        dword ptr [rsp + 4], r10d
00f48 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00f4d 4489442408                     mov        dword ptr [rsp + 8], r8d
00f52 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f5a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f5f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f64 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f69 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00f6e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00f73 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00f78 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00f7d 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00f82 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00f87 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f8c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f91 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00f96 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00f9b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00fa0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00fa5 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00faa 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00faf 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00fb4 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00fb9 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00fbe 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00fc3 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00fc8 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00fcd 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00fd2 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00fd7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fdc 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fe1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fe9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fee 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00ff6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00ffb 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
01003 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01008 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
01010 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01018 666690                         nop        
0101b e840b0b5ff                     call       0x7ffaeb9c3660
01020 0f1f84001811000c               nop        dword ptr [rax + rax + 0xc001118]
01028 be45ffffff                     mov        esi, 0xffffff45
0102d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01035 448b542408                     mov        r10d, dword ptr [rsp + 8]
0103a 44891424                       mov        dword ptr [rsp], r10d
0103e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01043 4489442404                     mov        dword ptr [rsp + 4], r8d
01048 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0104d 4489542408                     mov        dword ptr [rsp + 8], r10d
01052 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0105a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0105f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01064 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01069 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0106e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01073 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01078 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0107d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01082 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01087 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0108c 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01091 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01096 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0109b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
010a0 4489442430                     mov        dword ptr [rsp + 0x30], r8d
010a5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
010aa 4489542434                     mov        dword ptr [rsp + 0x34], r10d
010af 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
010b4 4489442438                     mov        dword ptr [rsp + 0x38], r8d
010b9 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
010be 4489442448                     mov        dword ptr [rsp + 0x48], r8d
010c3 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
010c8 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
010cd 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
010d2 4489442450                     mov        dword ptr [rsp + 0x50], r8d
010d7 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010dc 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010e1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010e9 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010ee 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010f6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010fb 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
01103 4489542474                     mov        dword ptr [rsp + 0x74], r10d
01108 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01110 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01117 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
0111f e83cafb5ff                     call       0x7ffaeb9c3660
01124 0f1f84001c12000d               nop        dword ptr [rax + rax + 0xd00121c]
0112c be45ffffff                     mov        esi, 0xffffff45
01131 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01139 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0113e 44890c24                       mov        dword ptr [rsp], r9d
01142 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01147 4489442404                     mov        dword ptr [rsp + 4], r8d
0114c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01151 44894c2408                     mov        dword ptr [rsp + 8], r9d
01156 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0115b 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01160 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01165 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0116a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0116f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01174 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01179 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0117e 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01183 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01188 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0118d 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01192 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01197 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0119c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
011a1 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
011a6 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
011ab 4489442438                     mov        dword ptr [rsp + 0x38], r8d
011b0 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
011b5 4489442448                     mov        dword ptr [rsp + 0x48], r8d
011ba 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
011bf 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
011c4 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
011c9 4489442450                     mov        dword ptr [rsp + 0x50], r8d
011ce 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
011d3 4c89442458                     mov        qword ptr [rsp + 0x58], r8
011d8 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
011e0 4c89442460                     mov        qword ptr [rsp + 0x60], r8
011e5 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
011ed 4c89442468                     mov        qword ptr [rsp + 0x68], r8
011f2 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
011f7 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
011fe 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
01206 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
0120e 90                             nop        
0120f e84caeb5ff                     call       0x7ffaeb9c3660
01214 0f1f84000c13000e               nop        dword ptr [rax + rax + 0xe00130c]
0121c 41b9ffffff7f                   mov        r9d, 0x7fffffff
01222 4d3bc1                         cmp        r8, r9
01225 bdffffffff                     mov        ebp, 0xffffffff
0122a 7c08                           jl         0x7ffaebe68834
0122c 400f95c5                       setne      bpl
01230 400fb6ed                       movzx      ebp, bpl
01234 be45ffffff                     mov        esi, 0xffffff45
01239 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01241 4c890c24                       mov        qword ptr [rsp], r9
01245 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
01249 894c240c                       mov        dword ptr [rsp + 0xc], ecx
0124d 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01255 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
0125a 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0125f 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01264 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01268 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
0126c 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01271 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01276 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
0127a 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0127e 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01283 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01288 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
0128c 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01290 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01295 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
0129a 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
012a1 894c2444                       mov        dword ptr [rsp + 0x44], ecx
012a5 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
012aa 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
012af 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
012b3 894c2454                       mov        dword ptr [rsp + 0x54], ecx
012b7 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
012bc 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
012c1 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
012c6 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
012cb 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
012d3 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
012d8 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
012e0 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
012e5 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
012ed 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
012f4 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012fc 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
01304 666690                         nop        
01307 e854adb5ff                     call       0x7ffaeb9c3660
0130c 0f1f84000414000f               nop        dword ptr [rax + rax + 0xf001404]
01314 be45ffffff                     mov        esi, 0xffffff45
01319 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01321 448b442408                     mov        r8d, dword ptr [rsp + 8]
01326 44890424                       mov        dword ptr [rsp], r8d
0132a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0132f 4489442404                     mov        dword ptr [rsp + 4], r8d
01334 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01339 44894c2408                     mov        dword ptr [rsp + 8], r9d
0133e 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01343 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01348 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0134d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01352 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01357 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0135c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01361 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01366 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0136b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01370 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01375 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0137a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0137f 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01384 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01389 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0138e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01393 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01398 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0139d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
013a2 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
013a7 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
013ac 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
013b1 4489442450                     mov        dword ptr [rsp + 0x50], r8d
013b6 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
013bb 4c89442458                     mov        qword ptr [rsp + 0x58], r8
013c0 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
013c8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
013cd 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
013d2 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013da 90                             nop        
013db e880acb5ff                     call       0x7ffaeb9c3660
013e0 0f1f8400d8140010               nop        dword ptr [rax + rax + 0x100014d8]
013e8 be45ffffff                     mov        esi, 0xffffff45
013ed 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013f5 448b442408                     mov        r8d, dword ptr [rsp + 8]
013fa 44890424                       mov        dword ptr [rsp], r8d
013fe 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01403 4489442404                     mov        dword ptr [rsp + 4], r8d
01408 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
0140d 4489542408                     mov        dword ptr [rsp + 8], r10d
01412 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01417 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0141c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01421 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01426 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0142b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01430 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01435 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0143a 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0143f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01444 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01449 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0144e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01453 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01458 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0145d 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01462 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01467 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0146c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01471 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01476 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0147b 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01480 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01485 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0148a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0148f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01494 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0149c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
014a1 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
014a6 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
014ad 6690                           nop        
014af e8acabb5ff                     call       0x7ffaeb9c3660
014b4 0f1f8400ac150011               nop        dword ptr [rax + rax + 0x110015ac]
014bc be3dffffff                     mov        esi, 0xffffff3d
014c1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014c9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
014ce 44890c24                       mov        dword ptr [rsp], r9d
014d2 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
014d7 44894c2404                     mov        dword ptr [rsp + 4], r9d
014dc 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
014e1 4489442408                     mov        dword ptr [rsp + 8], r8d
014e6 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
014eb 4c89442418                     mov        qword ptr [rsp + 0x18], r8
014f0 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
014f5 448944240c                     mov        dword ptr [rsp + 0xc], r8d
014fa 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014ff 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01504 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01509 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0150e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01513 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01518 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0151d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01522 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01527 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0152c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01531 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01536 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0153b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01540 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01548 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
0154d 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01552 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01557 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0155c 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01561 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01566 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0156b 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01570 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01575 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0157d 4c89442460                     mov        qword ptr [rsp + 0x60], r8
01582 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
0158a 4c89442468                     mov        qword ptr [rsp + 0x68], r8
0158f 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
01594 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
0159c 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
015a3 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
015aa 90                             nop        
015ab e8b0aab5ff                     call       0x7ffaeb9c3660
015b0 0f1f8400a8160012               nop        dword ptr [rax + rax + 0x120016a8]
015b8 be45ffffff                     mov        esi, 0xffffff45
015bd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015c5 448b542408                     mov        r10d, dword ptr [rsp + 8]
015ca 44891424                       mov        dword ptr [rsp], r10d
015ce 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
015d3 4489542404                     mov        dword ptr [rsp + 4], r10d
015d8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015dd 4489542408                     mov        dword ptr [rsp + 8], r10d
015e2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015e7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015ec 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
015f1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
015f6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
015fb 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01600 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01605 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0160a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0160f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01614 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01619 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0161e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01623 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01628 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0162d 4489442440                     mov        dword ptr [rsp + 0x40], r8d
01632 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01637 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
0163c 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01640 666690                         nop        
01643 e818aab5ff                     call       0x7ffaeb9c3660
01648 0f1f840040170013               nop        dword ptr [rax + rax + 0x13001740]
01650 be45ffffff                     mov        esi, 0xffffff45
01655 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0165d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01662 44890c24                       mov        dword ptr [rsp], r9d
01666 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0166b 44894c2404                     mov        dword ptr [rsp + 4], r9d
01670 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01675 44894c2408                     mov        dword ptr [rsp + 8], r9d
0167a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0167f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01684 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01689 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0168e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01693 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01698 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0169d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
016a2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
016a7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
016ac 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
016b1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
016b6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
016bb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
016c0 4489442454                     mov        dword ptr [rsp + 0x54], r8d
016c5 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
016ca 90                             nop        
016cb e890a9b5ff                     call       0x7ffaeb9c3660
016d0 0f1f8400c8170014               nop        dword ptr [rax + rax + 0x140017c8]
016d8 be45ffffff                     mov        esi, 0xffffff45
016dd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016e5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
016ea 44891c24                       mov        dword ptr [rsp], r11d
016ee 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
016f3 44895c2404                     mov        dword ptr [rsp + 4], r11d
016f8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016fd 44895c2408                     mov        dword ptr [rsp + 8], r11d
01702 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0170a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0170f 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01714 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01719 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0171e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01723 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01728 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0172d 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01732 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01737 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0173c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01741 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01746 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0174b 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01750 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01755 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0175a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0175f 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01764 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01769 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0176e 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01773 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01778 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0177d 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01782 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01787 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0178c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01791 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01799 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0179e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
017a6 4c89542468                     mov        qword ptr [rsp + 0x68], r10
017ab 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
017b3 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
017bb e8a0a8b5ff                     call       0x7ffaeb9c3660
017c0 0f1f8400b8180015               nop        dword ptr [rax + rax + 0x150018b8]
017c8 be45ffffff                     mov        esi, 0xffffff45
017cd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017d5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
017da 44891c24                       mov        dword ptr [rsp], r11d
017de 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
017e3 4489542404                     mov        dword ptr [rsp + 4], r10d
017e8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
017ed 44895c2408                     mov        dword ptr [rsp + 8], r11d
017f2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017f7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017fc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01801 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01806 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0180b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01810 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01815 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0181a 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0181f 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01824 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01829 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0182e 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01833 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01838 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0183d 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01842 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01847 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0184c 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01851 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01856 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0185b 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01860 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01865 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0186a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0186f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01874 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0187c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01881 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01889 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0188e 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
01896 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
0189e 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
018a5 6690                           nop        
018a7 e8b4a7b5ff                     call       0x7ffaeb9c3660
018ac 0f1f8400a4190016               nop        dword ptr [rax + rax + 0x160019a4]
018b4 4585db                         test       r11d, r11d
018b7 7f07                           jg         0x7ffaebe68ec0
018b9 33c0                           xor        eax, eax
018bb e907e8ffff                     jmp        0x7ffaebe676c7
018c0 8954242c                       mov        dword ptr [rsp + 0x2c], edx
018c4 89742428                       mov        dword ptr [rsp + 0x28], esi
018c8 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
018cc 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
018d1 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
018d6 897c2410                       mov        dword ptr [rsp + 0x10], edi
018da 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018df 48894424f8                     mov        qword ptr [rsp - 8], rax
018e4 8b0424                         mov        eax, dword ptr [rsp]
018e7 89442404                       mov        dword ptr [rsp + 4], eax
018eb 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018f0 48894424f8                     mov        qword ptr [rsp - 8], rax
018f5 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018fc 890424                         mov        dword ptr [rsp], eax
018ff 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01904 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0190c 488bf5                         mov        rsi, rbp
0190f 8b542408                       mov        edx, dword ptr [rsp + 8]
01913 418bcb                         mov        ecx, r11d
01916 90                             nop        
01917 e84429a9ff                     call       0x7ffaeb8fb860
0191c 0f1f8400141a0017               nop        dword ptr [rax + rax + 0x17001a14]
01924 41ba40000000                   mov        r10d, 0x40
0192a 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
0192f c4e2a9f7c0                     shlx       rax, rax, r10
01934 48894424f8                     mov        qword ptr [rsp - 8], rax
01939 8b442404                       mov        eax, dword ptr [rsp + 4]
0193d 890424                         mov        dword ptr [rsp], eax
01940 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01945 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
0194a 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
0194e 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01953 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01958 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
0195c 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01960 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01964 e95ee7ffff                     jmp        0x7ffaebe676c7
01969 4585db                         test       r11d, r11d
0196c 7f08                           jg         0x7ffaebe68f76
0196e 4533f6                         xor        r14d, r14d
01971 e992e7ffff                     jmp        0x7ffaebe67708
01976 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0197b 4889442430                     mov        qword ptr [rsp + 0x30], rax
01980 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01984 89742428                       mov        dword ptr [rsp + 0x28], esi
01988 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
0198c 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01991 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01996 897c2410                       mov        dword ptr [rsp + 0x10], edi
0199a 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0199f 48894424f8                     mov        qword ptr [rsp - 8], rax
019a4 8b0424                         mov        eax, dword ptr [rsp]
019a7 89442404                       mov        dword ptr [rsp + 4], eax
019ab 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019b0 48894424f8                     mov        qword ptr [rsp - 8], rax
019b5 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
019bc 890424                         mov        dword ptr [rsp], eax
019bf 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019c4 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
019cc 488bf5                         mov        rsi, rbp
019cf 8b542408                       mov        edx, dword ptr [rsp + 8]
019d3 418bcb                         mov        ecx, r11d
019d6 90                             nop        
019d7 e88428a9ff                     call       0x7ffaeb8fb860
019dc 0f1f8400d41a0018               nop        dword ptr [rax + rax + 0x18001ad4]
019e4 41ba80000000                   mov        r10d, 0x80
019ea 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
019ef c462a9f7f0                     shlx       r14, rax, r10
019f4 48894424f8                     mov        qword ptr [rsp - 8], rax
019f9 8b442404                       mov        eax, dword ptr [rsp + 4]
019fd 890424                         mov        dword ptr [rsp], eax
01a00 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a05 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01a09 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01a0e 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
01a12 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01a16 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01a1a 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01a1f 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a24 e9dfe6ffff                     jmp        0x7ffaebe67708
01a29 4533c0                         xor        r8d, r8d
01a2c e9d8efffff                     jmp        0x7ffaebe68009
01a31 bee4ffffff                     mov        esi, 0xffffffe4
01a36 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a3e 488f0424                       pop        qword ptr [rsp]
01a42 90                             nop        
01a43 e818a6b5ff                     call       0x7ffaeb9c3660
01a48 0f1f8400401b0019               nop        dword ptr [rax + rax + 0x19001b40]
01a50 be5d000000                     mov        esi, 0x5d
01a55 6690                           nop        
01a57 e804a6b5ff                     call       0x7ffaeb9c3660
01a5c 0f1f8400541b001a               nop        dword ptr [rax + rax + 0x1a001b54]
01a64 bef6ffffff                     mov        esi, 0xfffffff6
01a69 6690                           nop        
01a6b e8f0a5b5ff                     call       0x7ffaeb9c3660
01a70 0f1f8400681b001b               nop        dword ptr [rax + rax + 0x1b001b68]
01a78 bef6ffffff                     mov        esi, 0xfffffff6
01a7d 6690                           nop        
01a7f e8dca5b5ff                     call       0x7ffaeb9c3660
01a84 0f1f84007c1b001c               nop        dword ptr [rax + rax + 0x1c001b7c]
01a8c be6effffff                     mov        esi, 0xffffff6e
01a91 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a99 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a9e 44891c24                       mov        dword ptr [rsp], r11d
01aa2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01aa7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01aac 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01ab1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01ab6 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01abb 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01ac0 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01ac5 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01aca 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01acf 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ad4 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ad9 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01ade 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ae3 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01ae8 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01aed 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01af2 90                             nop        
01af3 e868a5b5ff                     call       0x7ffaeb9c3660
01af8 0f1f8400f01b001d               nop        dword ptr [rax + rax + 0x1d001bf0]
01b00 bee4ffffff                     mov        esi, 0xffffffe4
01b05 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b0d 488f0424                       pop        qword ptr [rsp]
01b11 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01b16 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1b 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b22 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01b26 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2b 894c2428                       mov        dword ptr [rsp + 0x28], ecx
01b2f 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01b33 e828a5b5ff                     call       0x7ffaeb9c3660
01b38 0f1f8400301c001e               nop        dword ptr [rax + rax + 0x1e001c30]
01b40 bee4ffffff                     mov        esi, 0xffffffe4
01b45 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b4d 488f0424                       pop        qword ptr [rsp]
01b51 48894424f8                     mov        qword ptr [rsp - 8], rax
01b56 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b5d 89442418                       mov        dword ptr [rsp + 0x18], eax
01b61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b66 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01b6a 89542428                       mov        dword ptr [rsp + 0x28], edx
01b6e 4889442430                     mov        qword ptr [rsp + 0x30], rax
01b73 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b78 666690                         nop        
01b7b e8e0a4b5ff                     call       0x7ffaeb9c3660
01b80 0f1f8400781c001f               nop        dword ptr [rax + rax + 0x1f001c78]
01b88 bebeffffff                     mov        esi, 0xffffffbe
01b8d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b95 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b9a 44891c24                       mov        dword ptr [rsp], r11d
01b9e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ba3 44895c2408                     mov        dword ptr [rsp + 8], r11d
01ba8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01bad 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01bb2 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01bb7 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01bbc 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01bc1 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01bc6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01bcb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01bd0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01bd5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01bda 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01bdf 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01be4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01be9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01bee 90                             nop        
01bef e86ca4b5ff                     call       0x7ffaeb9c3660
01bf4 0f1f8400ec1c0020               nop        dword ptr [rax + rax + 0x20001cec]
01bfc beccffffff                     mov        esi, 0xffffffcc
01c01 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c09 448b542408                     mov        r10d, dword ptr [rsp + 8]
01c0e 44891424                       mov        dword ptr [rsp], r10d
01c12 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01c17 48894424f8                     mov        qword ptr [rsp - 8], rax
01c1c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c23 89442414                       mov        dword ptr [rsp + 0x14], eax
01c27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c2c 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01c30 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01c34 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01c38 666690                         nop        
01c3b e820a4b5ff                     call       0x7ffaeb9c3660
01c40 0f1f8400381d0021               nop        dword ptr [rax + rax + 0x21001d38]
01c48 beccffffff                     mov        esi, 0xffffffcc
01c4d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c55 448b442408                     mov        r8d, dword ptr [rsp + 8]
01c5a 44890424                       mov        dword ptr [rsp], r8d
01c5e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c63 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c6a 89442410                       mov        dword ptr [rsp + 0x10], eax
01c6e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c73 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01c77 89542418                       mov        dword ptr [rsp + 0x18], edx
01c7b 4889442428                     mov        qword ptr [rsp + 0x28], rax
01c80 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c85 897c2434                       mov        dword ptr [rsp + 0x34], edi
01c89 6690                           nop        
01c8b e8d0a3b5ff                     call       0x7ffaeb9c3660
01c90 0f1f8400881d0022               nop        dword ptr [rax + rax + 0x22001d88]
01c98 be45ffffff                     mov        esi, 0xffffff45
01c9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ca5 448b542408                     mov        r10d, dword ptr [rsp + 8]
01caa 44891424                       mov        dword ptr [rsp], r10d
01cae 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01cb3 4489542408                     mov        dword ptr [rsp + 8], r10d
01cb8 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01cbd 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01cc2 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01cc7 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01ccc 666690                         nop        
01ccf e88ca3b5ff                     call       0x7ffaeb9c3660
01cd4 0f1f8400cc1d0023               nop        dword ptr [rax + rax + 0x23001dcc]
01cdc be45ffffff                     mov        esi, 0xffffff45
01ce1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ce9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01cee 44891c24                       mov        dword ptr [rsp], r11d
01cf2 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01cf7 44895c2408                     mov        dword ptr [rsp + 8], r11d
01cfc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01d01 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01d06 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01d0b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01d10 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01d15 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01d1a 90                             nop        
01d1b e840a3b5ff                     call       0x7ffaeb9c3660
01d20 0f1f8400181e0024               nop        dword ptr [rax + rax + 0x24001e18]
01d28 bef6ffffff                     mov        esi, 0xfffffff6
01d2d 6690                           nop        
01d2f e82ca3b5ff                     call       0x7ffaeb9c3660
01d34 0f1f84002c1e0025               nop        dword ptr [rax + rax + 0x25001e2c]
01d3c be5d000000                     mov        esi, 0x5d
01d41 6690                           nop        
01d43 e818a3b5ff                     call       0x7ffaeb9c3660
01d48 0f1f8400401e0026               nop        dword ptr [rax + rax + 0x26001e40]
01d50 be45ffffff                     mov        esi, 0xffffff45
01d55 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d5d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01d62 44891c24                       mov        dword ptr [rsp], r11d
01d66 90                             nop        
01d67 e8f4a2b5ff                     call       0x7ffaeb9c3660
01d6c 0f1f8400641e0027               nop        dword ptr [rax + rax + 0x27001e64]
01d74 bef6ffffff                     mov        esi, 0xfffffff6
01d79 418beb                         mov        ebp, r11d
01d7c 666690                         nop        
01d7f e8dca2b5ff                     call       0x7ffaeb9c3660
01d84 0f1f84007c1e0028               nop        dword ptr [rax + rax + 0x28001e7c]
01d8c bef6ffffff                     mov        esi, 0xfffffff6
01d91 418be8                         mov        ebp, r8d
01d94 666690                         nop        
01d97 e8c4a2b5ff                     call       0x7ffaeb9c3660
01d9c 0f1f8400941e0029               nop        dword ptr [rax + rax + 0x29001e94]
01da4 bef6ffffff                     mov        esi, 0xfffffff6
01da9 418beb                         mov        ebp, r11d
01dac 666690                         nop        
01daf e8aca2b5ff                     call       0x7ffaeb9c3660
01db4 0f1f8400ac1e002a               nop        dword ptr [rax + rax + 0x2a001eac]
01dbc bef6ffffff                     mov        esi, 0xfffffff6
01dc1 6690                           nop        
01dc3 e898a2b5ff                     call       0x7ffaeb9c3660
01dc8 0f1f8400c01e002b               nop        dword ptr [rax + rax + 0x2b001ec0]
01dd0 bef6ffffff                     mov        esi, 0xfffffff6
01dd5 6690                           nop        
01dd7 e884a2b5ff                     call       0x7ffaeb9c3660
01ddc 0f1f8400d41e002c               nop        dword ptr [rax + rax + 0x2c001ed4]
01de4 bef6ffffff                     mov        esi, 0xfffffff6
01de9 6690                           nop        
01deb e870a2b5ff                     call       0x7ffaeb9c3660
01df0 0f1f8400e81e002d               nop        dword ptr [rax + rax + 0x2d001ee8]
01df8 bef6ffffff                     mov        esi, 0xfffffff6
01dfd 6690                           nop        
01dff e85ca2b5ff                     call       0x7ffaeb9c3660
01e04 0f1f8400fc1e002e               nop        dword ptr [rax + rax + 0x2e001efc]
01e0c bef6ffffff                     mov        esi, 0xfffffff6
01e11 6690                           nop        
01e13 e848a2b5ff                     call       0x7ffaeb9c3660
01e18 0f1f8400101f002f               nop        dword ptr [rax + rax + 0x2f001f10]
01e20 bef6ffffff                     mov        esi, 0xfffffff6
01e25 6690                           nop        
01e27 e834a2b5ff                     call       0x7ffaeb9c3660
01e2c 0f1f8400241f0030               nop        dword ptr [rax + rax + 0x30001f24]
01e34 bef6ffffff                     mov        esi, 0xfffffff6
01e39 6690                           nop        
01e3b e820a2b5ff                     call       0x7ffaeb9c3660
01e40 0f1f8400381f0031               nop        dword ptr [rax + rax + 0x31001f38]
01e48 eb08                           jmp        0x7ffaebe69452
01e4a eb06                           jmp        0x7ffaebe69452
01e4c eb04                           jmp        0x7ffaebe69452
01e4e eb02                           jmp        0x7ffaebe69452
01e50 eb00                           jmp        0x7ffaebe69452
01e52 488bf0                         mov        rsi, rax
01e55 e916ecffff                     jmp        0x7ffaebe68070
01e5a 49ba3f80e6ebfa7f0000           movabs     r10, 0x7ffaebe6803f
01e64 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01e6b e9704aa9ff                     jmp        0x7ffaeb8fdee0
01e70 e82b16a8ff                     call       0x7ffaeb8eaaa0
01e75 e9a4e1ffff                     jmp        0x7ffaebe6761e
01e7a f4                             hlt        
01e7b f4                             hlt        
01e7c f4                             hlt        
01e7d f4                             hlt        
01e7e f4                             hlt        
01e7f f4                             hlt        
