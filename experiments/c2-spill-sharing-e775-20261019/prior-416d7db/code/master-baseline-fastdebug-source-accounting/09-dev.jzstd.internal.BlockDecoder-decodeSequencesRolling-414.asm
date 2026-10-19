00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85c2210000                   jne        0x7f6a97bdede0
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
00050 0f83571b0000                   jae        0x7f6a97bde7ad
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f847b1b0000                   je         0x7f6a97bde7e0
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
0009a 0f8c90190000                   jl         0x7f6a97bde630
000a0 85ff                           test       edi, edi
000a2 0f8c701d0000                   jl         0x7f6a97bdea18
000a8 8b2c24                         mov        ebp, dword ptr [rsp]
000ab 83c5f9                         add        ebp, -7
000ae 443bed                         cmp        r13d, ebp
000b1 0f83291c0000                   jae        0x7f6a97bde8e0
000b7 458bc5                         mov        r8d, r13d
000ba 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
000c2 4b8b440208                     mov        rax, qword ptr [r10 + r8 + 8]
000c7 4183c3f8                       add        r11d, -8
000cb 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000d3 4183c2f0                       add        r10d, -0x10
000d7 4183fb08                       cmp        r11d, 8
000db 0f8c041a0000                   jl         0x7f6a97bde6e5
000e1 85ff                           test       edi, edi
000e3 0f8c8f1d0000                   jl         0x7f6a97bdea78
000e9 8b2c24                         mov        ebp, dword ptr [rsp]
000ec 83c5f9                         add        ebp, -7
000ef 443bd5                         cmp        r10d, ebp
000f2 0f833c1c0000                   jae        0x7f6a97bde934
000f8 458bda                         mov        r11d, r10d
000fb 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
00103 4f8b741808                     mov        r14, qword ptr [r8 + r11 + 8]
00108 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010d 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00111 4585db                         test       r11d, r11d
00114 0f84ee1a0000                   je         0x7f6a97bde808
0011a 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
0011e 458b4104                       mov        r8d, dword ptr [r9 + 4]
00122 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
00125 85db                           test       ebx, ebx
00127 0f84031b0000                   je         0x7f6a97bde830
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
00195 0f84f6080000                   je         0x7f6a97bdd691
0019b be40000000                     mov        esi, 0x40
001a0 2bf1                           sub        esi, ecx
001a2 443bc6                         cmp        r8d, esi
001a5 0f8f1c020000                   jg         0x7f6a97bdcfc7
001ab 412bf0                         sub        esi, r8d
001ae c4e2cbf7e8                     shrx       rbp, rax, rsi
001b3 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b8 4183f840                       cmp        r8d, 0x40
001bc 0f8d221e0000                   jge        0x7f6a97bdebe4
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
001ed 7c34                           jl         0x7f6a97bdce23
001ef 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001f4 4183c1c8                       add        r9d, -0x38
001f8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001fd 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00205 8b542408                       mov        edx, dword ptr [rsp + 8]
00209 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
0020d 90                             nop        
0020e 90                             nop        
0020f e84c2eb5ff                     call       0x7f6a9772fc60
00214 0f1f84000c030000               nop        dword ptr [rax + rax + 0x30c]
0021c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00221 eb31                           jmp        0x7f6a97bdce54
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
00266 0f8d701c0000                   jge        0x7f6a97bdeadc
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
002ad 0f8d811c0000                   jge        0x7f6a97bdeb34
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
002f6 0f8ea9180000                   jle        0x7f6a97bde7a5
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
00377 0f86db180000                   jbe        0x7f6a97bde858
0037d 4d63d2                         movsxd     r10, r10d
00380 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00385 49ffcb                         dec        r11
00388 4d3bda                         cmp        r11, r10
0038b 0f83c7180000                   jae        0x7f6a97bde858
00391 448b542404                     mov        r10d, dword ptr [rsp + 4]
00396 4585d2                         test       r10d, r10d
00399 0f8cf1190000                   jl         0x7f6a97bde990
0039f 8b2c24                         mov        ebp, dword ptr [rsp]
003a2 83c5f9                         add        ebp, -7
003a5 89ac24c4000000                 mov        dword ptr [rsp + 0xc4], ebp
003ac 4533d2                         xor        r10d, r10d
003af 4533db                         xor        r11d, r11d
003b2 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
003ba 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
003c2 e990020000                     jmp        0x7f6a97bdd257
003c7 418be8                         mov        ebp, r8d
003ca 2bee                           sub        ebp, esi
003cc 90                             nop        
003cd 90                             nop        
003ce 90                             nop        
003cf e88c2cb5ff                     call       0x7f6a9772fc60
003d4 0f1f8400cc040001               nop        dword ptr [rax + rax + 0x10004cc]
003dc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003e1 41ba40000000                   mov        r10d, 0x40
003e7 442bd5                         sub        r10d, ebp
003ea c462d1f7d8                     shlx       r11, rax, rbp
003ef c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003f9 4d0bda                         or         r11, r10
003fc 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00401 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
00406 e9d2fdffff                     jmp        0x7f6a97bdcddd
0040b 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
00413 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
00418 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0041d 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00425 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0042a 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0042e 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00432 90                             nop        
00433 90                             nop        
00434 90                             nop        
00435 90                             nop        
00436 90                             nop        
00437 90                             nop        
00438 90                             nop        
00439 90                             nop        
0043a 90                             nop        
0043b 90                             nop        
0043c 90                             nop        
0043d 90                             nop        
0043e 90                             nop        
0043f 90                             nop        
00440 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00447 83fd40                         cmp        ebp, 0x40
0044a 0f8d840a0000                   jge        0x7f6a97bddad4
00450 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0045a 41ba01000000                   mov        r10d, 1
00460 c442d1f7d2                     shlx       r10, r10, rbp
00465 49ffca                         dec        r10
00468 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00470 458bda                         mov        r11d, r10d
00473 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0047a 83fd40                         cmp        ebp, 0x40
0047d 0f8d450b0000                   jge        0x7f6a97bddbc8
00483 c4c2d3f7f9                     shrx       rdi, r9, rbp
00488 41ba01000000                   mov        r10d, 1
0048e c442d1f7d2                     shlx       r10, r10, rbp
00493 49ffca                         dec        r10
00496 4d23d1                         and        r10, r9
00499 418bca                         mov        ecx, r10d
0049c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
004a3 83fd40                         cmp        ebp, 0x40
004a6 0f8d300c0000                   jge        0x7f6a97bddcdc
004ac c4e2d3f7df                     shrx       rbx, rdi, rbp
004b1 41ba01000000                   mov        r10d, 1
004b7 c442d1f7d2                     shlx       r10, r10, rbp
004bc 49ffca                         dec        r10
004bf 4c23d7                         and        r10, rdi
004c2 458bd2                         mov        r10d, r10d
004c5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004cc 83fd40                         cmp        ebp, 0x40
004cf 0f8d1f0d0000                   jge        0x7f6a97bdddf4
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
00525 0f8e75070000                   jle        0x7f6a97bdd8a0
0052b 4981f8ffffff7f                 cmp        r8, 0x7fffffff
00532 0f8fc00d0000                   jg         0x7f6a97bddef8
00538 4181faffff0100                 cmp        r10d, 0x1ffff
0053f 0f8fbf0e0000                   jg         0x7f6a97bde004
00545 81fbffff0300                   cmp        ebx, 0x3ffff
0054b 0f8f9b0f0000                   jg         0x7f6a97bde0ec
00551 418bc8                         mov        ecx, r8d
00554 81f900000010                   cmp        ecx, 0x10000000
0055a 0f8374100000                   jae        0x7f6a97bde1d4
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
00590 0f8db0000000                   jge        0x7f6a97bdd246
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
005e6 0f8df8100000                   jge        0x7f6a97bde2e4
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
00627 0f8d63110000                   jge        0x7f6a97bde390
0062d 41b901000000                   mov        r9d, 1
00633 c44229f7c9                     shlx       r9d, r9d, r10d
00638 41ffc9                         dec        r9d
0063b 4523cb                         and        r9d, r11d
0063e 4503c8                         add        r9d, r8d
00641 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00646 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0064a 0f8dc5030000                   jge        0x7f6a97bdd615
00650 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
00657 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0065c 44235c2460                     and        r11d, dword ptr [rsp + 0x60]
00661 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00666 458b5214                       mov        r10d, dword ptr [r10 + 0x14]
0066a 458b4a04                       mov        r9d, dword ptr [r10 + 4]
0066e 453bd9                         cmp        r11d, r9d
00671 0f832a040000                   jae        0x7f6a97bdd6a1
00677 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0067c 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00681 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00685 8b5914                         mov        ebx, dword ptr [rcx + 0x14]
00688 448b4b04                       mov        r9d, dword ptr [rbx + 4]
0068c 4f8b54da08                     mov        r10, qword ptr [r10 + r11*8 + 8]
00691 4c89542478                     mov        qword ptr [rsp + 0x78], r10
00696 453bc1                         cmp        r8d, r9d
00699 0f839d040000                   jae        0x7f6a97bdd73c
0069f 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
006a4 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
006a9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
006ae 458b4a14                       mov        r9d, dword ptr [r10 + 0x14]
006b2 418b4904                       mov        ecx, dword ptr [r9 + 4]
006b6 4e8b54c308                     mov        r10, qword ptr [rbx + r8*8 + 8]
006bb 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
006c3 443bd9                         cmp        r11d, ecx
006c6 0f8318050000                   jae        0x7f6a97bdd7e4
006cc 4f8b54d908                     mov        r10, qword ptr [r9 + r11*8 + 8]
006d1 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006d9 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006e0 ffc5                           inc        ebp
006e2 892c24                         mov        dword ptr [rsp], ebp
006e5 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006e9 0f8df7020000                   jge        0x7f6a97bdd5e6
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
007b5 0f84ed050000                   je         0x7f6a97bdd9a8
007bb 4183f93f                       cmp        r9d, 0x3f
007bf 0f8fd3060000                   jg         0x7f6a97bdda98
007c5 b940000000                     mov        ecx, 0x40
007ca 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
007ce 443bc9                         cmp        r9d, ecx
007d1 7e47                           jle        0x7f6a97bdd41a
007d3 458bc1                         mov        r8d, r9d
007d6 442bc1                         sub        r8d, ecx
007d9 83f940                         cmp        ecx, 0x40
007dc 0f8d4e110000                   jge        0x7f6a97bde530
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
00818 eb30                           jmp        0x7f6a97bdd44a
0081a 412bc9                         sub        ecx, r9d
0081d c462f3f7842498000000           shrx       r8, qword ptr [rsp + 0x98], rcx
00827 4183f940                       cmp        r9d, 0x40
0082b 0f8dfb0f0000                   jge        0x7f6a97bde42c
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
00868 0f8cd2fbffff                   jl         0x7f6a97bdd040
0086e 4183c3c0                       add        r11d, -0x40
00872 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00877 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
0087b 83c5f8                         add        ebp, -8
0087e 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00882 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00886 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0088a 83c1f0                         add        ecx, -0x10
0088d 83f908                         cmp        ecx, 8
00890 0f8c02010000                   jl         0x7f6a97bdd598
00896 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0089b 4183c0e8                       add        r8d, -0x18
0089f 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
008a7 0f825efbffff                   jb         0x7f6a97bdd00b
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
00977 e8e404afff                     call       0x7f6a976cda60
0097c 0f1f8400740a0002               nop        dword ptr [rax + rax + 0x2000a74]
00984 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
0098e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00992 e8c90f1418                     call       0x7f6aafd1e560
00997 f4                             hlt        
00998 85c9                           test       ecx, ecx
0099a 7f08                           jg         0x7f6a97bdd5a4
0099c 4533d2                         xor        r10d, r10d
0099f e974faffff                     jmp        0x7f6a97bdd018
009a4 8be9                           mov        ebp, ecx
009a6 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
009ae 8b542408                       mov        edx, dword ptr [rsp + 8]
009b2 90                             nop        
009b3 e8a826b5ff                     call       0x7f6a9772fc60
009b8 0f1f8400b00a0003               nop        dword ptr [rax + rax + 0x3000ab0]
009c0 448b542408                     mov        r10d, dword ptr [rsp + 8]
009c5 41c1e203                       shl        r10d, 3
009c9 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ce 41c1e003                       shl        r8d, 3
009d2 452bd0                         sub        r10d, r8d
009d5 4181c2c0000000                 add        r10d, 0xc0
009dc c462a9f7d0                     shlx       r10, rax, r10
009e1 e932faffff                     jmp        0x7f6a97bdd018
009e6 4533db                         xor        r11d, r11d
009e9 33ed                           xor        ebp, ebp
009eb 4533d2                         xor        r10d, r10d
009ee 4533c9                         xor        r9d, r9d
009f1 44899c24c8000000               mov        dword ptr [rsp + 0xc8], r11d
009f9 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00a00 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
00a08 44898c24f4000000               mov        dword ptr [rsp + 0xf4], r9d
00a10 e937fdffff                     jmp        0x7f6a97bdd34c
00a15 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a1d 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a25 4d03c2                         add        r8, r10
00a28 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a30 4d3bc2                         cmp        r8, r10
00a33 7f29                           jg         0x7f6a97bdd65e
00a35 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a3a 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a42 0f8574150000                   jne        0x7f6a97bdebbc
00a48 418bc0                         mov        eax, r8d
00a4b 4881c410010000                 add        rsp, 0x110
00a52 5d                             pop        rbp
00a53 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a57 0f876d170000                   ja         0x7f6a97bdedca
00a5d c3                             ret        
00a5e 48bee8462ae300000000           movabs     rsi, 0xe32a46e8
00a68 90                             nop        
00a69 90                             nop        
00a6a 90                             nop        
00a6b e8f025b5ff                     call       0x7f6a9772fc60
00a70 0f1f8400680b0004               nop        dword ptr [rax + rax + 0x4000b68]
00a78 4885c0                         test       rax, rax
00a7b 0f8413150000                   je         0x7f6a97bdeb94
00a81 488bf0                         mov        rsi, rax
00a84 4881c410010000                 add        rsp, 0x110
00a8b 5d                             pop        rbp
00a8c e94f8daeff                     jmp        0x7f6a976c63e0
00a91 4533d2                         xor        r10d, r10d
00a94 4533db                         xor        r11d, r11d
00a97 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a9c e93cf7ffff                     jmp        0x7f6a97bdcddd
00aa1 bee4ffffff                     mov        esi, 0xffffffe4
00aa6 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00aae 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
00ab3 44890c24                       mov        dword ptr [rsp], r9d
00ab7 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00abc 4489442404                     mov        dword ptr [rsp + 4], r8d
00ac1 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
00ac6 44894c2408                     mov        dword ptr [rsp + 8], r9d
00acb 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
00ad0 4c89442418                     mov        qword ptr [rsp + 0x18], r8
00ad5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ada 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00adf 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00ae4 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00ae9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00aee 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00af3 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00af8 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00afd 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00b02 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00b07 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b0c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b11 4489542458                     mov        dword ptr [rsp + 0x58], r10d
00b16 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b1b e84003afff                     call       0x7f6a976cda60
00b20 0f1f8400180c0005               nop        dword ptr [rax + rax + 0x5000c18]
00b28 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
00b32 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b36 e8250e1418                     call       0x7f6aafd1e560
00b3b f4                             hlt        
00b3c bee4ffffff                     mov        esi, 0xffffffe4
00b41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b49 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b4e 44891c24                       mov        dword ptr [rsp], r11d
00b52 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00b57 4489542404                     mov        dword ptr [rsp + 4], r10d
00b5c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b61 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b66 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b6b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b70 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00b75 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00b7a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00b7f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00b84 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b89 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b8e 894c2428                       mov        dword ptr [rsp + 0x28], ecx
00b92 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b97 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00b9c 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ba1 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ba6 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00bab 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00bb0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00bb5 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00bba 895c2460                       mov        dword ptr [rsp + 0x60], ebx
00bbe 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00bc3 e89802afff                     call       0x7f6a976cda60
00bc8 0f1f8400c00c0006               nop        dword ptr [rax + rax + 0x6000cc0]
00bd0 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
00bda 4883e4f0                       and        rsp, 0xfffffffffffffff0
00bde e87d0d1418                     call       0x7f6aafd1e560
00be3 f4                             hlt        
00be4 bee4ffffff                     mov        esi, 0xffffffe4
00be9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00bf1 448b442408                     mov        r8d, dword ptr [rsp + 8]
00bf6 44890424                       mov        dword ptr [rsp], r8d
00bfa 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00bff 4489542404                     mov        dword ptr [rsp + 4], r10d
00c04 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00c09 4489442408                     mov        dword ptr [rsp + 8], r8d
00c0e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c13 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c18 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00c1d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00c22 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00c27 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00c2c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c31 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c36 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00c3b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00c40 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c45 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c4a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00c4f 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00c54 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00c59 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c5e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00c63 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00c68 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c6d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00c72 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c77 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00c7c 90                             nop        
00c7d 90                             nop        
00c7e 90                             nop        
00c7f e8dc01afff                     call       0x7f6a976cda60
00c84 0f1f84007c0d0007               nop        dword ptr [rax + rax + 0x7000d7c]
00c8c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
00c96 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c9a e8c10c1418                     call       0x7f6aafd1e560
00c9f f4                             hlt        
00ca0 4533c9                         xor        r9d, r9d
00ca3 4d3bc1                         cmp        r8, r9
00ca6 bdffffffff                     mov        ebp, 0xffffffff
00cab 7c08                           jl         0x7f6a97bdd8b5
00cad 400f95c5                       setne      bpl
00cb1 400fb6ed                       movzx      ebp, bpl
00cb5 be45ffffff                     mov        esi, 0xffffff45
00cba 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00cc2 4c890c24                       mov        qword ptr [rsp], r9
00cc6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00ccb 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00cd0 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00cd8 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00cdd 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
00ce1 894c2414                       mov        dword ptr [rsp + 0x14], ecx
00ce5 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
00cea 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00cef 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
00cf3 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00cf7 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00cfc 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
00d01 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
00d05 894c2438                       mov        dword ptr [rsp + 0x38], ecx
00d09 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00d0e 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
00d13 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
00d17 894c2440                       mov        dword ptr [rsp + 0x40], ecx
00d1b 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
00d23 44894c2444                     mov        dword ptr [rsp + 0x44], r9d
00d28 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00d2c 894c2450                       mov        dword ptr [rsp + 0x50], ecx
00d30 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
00d35 44894c2454                     mov        dword ptr [rsp + 0x54], r9d
00d3a 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
00d3e 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00d42 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d47 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d4c 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d54 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d59 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d61 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d66 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00d6e 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
00d75 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d7d 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00d85 90                             nop        
00d86 90                             nop        
00d87 e8d400afff                     call       0x7f6a976cda60
00d8c 0f1f8400840e0008               nop        dword ptr [rax + rax + 0x8000e84]
00d94 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
00d9e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00da2 e8b90b1418                     call       0x7f6aafd1e560
00da7 f4                             hlt        
00da8 be45ffffff                     mov        esi, 0xffffff45
00dad 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00db5 448b542408                     mov        r10d, dword ptr [rsp + 8]
00dba 44891424                       mov        dword ptr [rsp], r10d
00dbe 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00dc3 44895c2404                     mov        dword ptr [rsp + 4], r11d
00dc8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00dcd 4489542408                     mov        dword ptr [rsp + 8], r10d
00dd2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00dd7 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ddc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00de1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00de6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00deb 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00df0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00df5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00dfa 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00dff 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e04 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e09 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00e0e 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e13 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e18 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00e1d 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e22 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e27 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e2c 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00e31 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e36 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e3b 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e40 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00e45 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e4a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e4f 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e54 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e5c 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e61 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e69 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e6e 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00e76 90                             nop        
00e77 e8e4ffaeff                     call       0x7f6a976cda60
00e7c 0f1f8400740f0009               nop        dword ptr [rax + rax + 0x9000f74]
00e84 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
00e8e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e92 e8c90a1418                     call       0x7f6aafd1e560
00e97 f4                             hlt        
00e98 be45ffffff                     mov        esi, 0xffffff45
00e9d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ea5 448b542408                     mov        r10d, dword ptr [rsp + 8]
00eaa 44891424                       mov        dword ptr [rsp], r10d
00eae 44894c2408                     mov        dword ptr [rsp + 8], r9d
00eb3 e8a8ffaeff                     call       0x7f6a976cda60
00eb8 0f1f8400b00f000a               nop        dword ptr [rax + rax + 0xa000fb0]
00ec0 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
00eca 4883e4f0                       and        rsp, 0xfffffffffffffff0
00ece e88d0a1418                     call       0x7f6aafd1e560
00ed3 f4                             hlt        
00ed4 be45ffffff                     mov        esi, 0xffffff45
00ed9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ee1 448b542408                     mov        r10d, dword ptr [rsp + 8]
00ee6 44891424                       mov        dword ptr [rsp], r10d
00eea 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00eef 44895c2404                     mov        dword ptr [rsp + 4], r11d
00ef4 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00ef9 4489542408                     mov        dword ptr [rsp + 8], r10d
00efe 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f06 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f0b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f10 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f15 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f1a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f1f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f24 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f29 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f2e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f33 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00f38 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00f3d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00f42 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00f47 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00f4c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00f51 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00f56 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00f5b 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00f60 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00f65 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00f6a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00f6f 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00f74 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00f79 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00f7e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00f83 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00f88 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00f8d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00f95 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00f9a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fa2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fa7 e8b4feaeff                     call       0x7f6a976cda60
00fac 0f1f8400a410000b               nop        dword ptr [rax + rax + 0xb0010a4]
00fb4 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
00fbe 4883e4f0                       and        rsp, 0xfffffffffffffff0
00fc2 e899091418                     call       0x7f6aafd1e560
00fc7 f4                             hlt        
00fc8 be45ffffff                     mov        esi, 0xffffff45
00fcd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00fd5 448b442408                     mov        r8d, dword ptr [rsp + 8]
00fda 44890424                       mov        dword ptr [rsp], r8d
00fde 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fe3 4489542404                     mov        dword ptr [rsp + 4], r10d
00fe8 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00fed 4489442408                     mov        dword ptr [rsp + 8], r8d
00ff2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00ffa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01004 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01009 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0100e 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01013 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01018 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0101d 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01022 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01027 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0102c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01031 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01036 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0103b 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01040 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01045 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0104a 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0104f 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01054 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01059 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0105e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01063 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01068 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
0106d 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01072 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01077 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0107c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01081 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01089 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0108e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01096 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0109b 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
010a3 4489542478                     mov        dword ptr [rsp + 0x78], r10d
010a8 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
010b0 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010b8 90                             nop        
010b9 90                             nop        
010ba 90                             nop        
010bb e8a0fdaeff                     call       0x7f6a976cda60
010c0 0f1f8400b811000c               nop        dword ptr [rax + rax + 0xc0011b8]
010c8 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
010d2 4883e4f0                       and        rsp, 0xfffffffffffffff0
010d6 e885081418                     call       0x7f6aafd1e560
010db f4                             hlt        
010dc be45ffffff                     mov        esi, 0xffffff45
010e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010e9 448b542408                     mov        r10d, dword ptr [rsp + 8]
010ee 44891424                       mov        dword ptr [rsp], r10d
010f2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
010f7 4489442404                     mov        dword ptr [rsp + 4], r8d
010fc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01101 4489542408                     mov        dword ptr [rsp + 8], r10d
01106 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0110e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01113 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01118 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0111d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01122 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01127 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0112c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01131 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01136 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0113b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01140 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01145 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0114a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0114f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01154 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01159 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0115e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01163 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01168 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0116d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01172 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01177 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0117c 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01181 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01186 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0118b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01190 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01195 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0119d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
011a2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
011aa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
011af 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
011b7 4489542474                     mov        dword ptr [rsp + 0x74], r10d
011bc 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011c4 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
011cb 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011d3 e888fcaeff                     call       0x7f6a976cda60
011d8 0f1f8400d012000d               nop        dword ptr [rax + rax + 0xd0012d0]
011e0 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
011ea 4883e4f0                       and        rsp, 0xfffffffffffffff0
011ee e86d071418                     call       0x7f6aafd1e560
011f3 f4                             hlt        
011f4 be45ffffff                     mov        esi, 0xffffff45
011f9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01201 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01206 44890c24                       mov        dword ptr [rsp], r9d
0120a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0120f 4489442404                     mov        dword ptr [rsp + 4], r8d
01214 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01219 44894c2408                     mov        dword ptr [rsp + 8], r9d
0121e 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01223 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01228 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0122d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01232 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01237 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0123c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01241 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01246 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0124b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01250 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01255 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0125a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0125f 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01264 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01269 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0126e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01273 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01278 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0127d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01282 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01287 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0128c 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
01291 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01296 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
0129b 4c89442458                     mov        qword ptr [rsp + 0x58], r8
012a0 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
012a8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
012ad 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
012b5 4c89442468                     mov        qword ptr [rsp + 0x68], r8
012ba 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012bf 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
012c6 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012ce 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
012d6 90                             nop        
012d7 e884fbaeff                     call       0x7f6a976cda60
012dc 0f1f8400d413000e               nop        dword ptr [rax + rax + 0xe0013d4]
012e4 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
012ee 4883e4f0                       and        rsp, 0xfffffffffffffff0
012f2 e869061418                     call       0x7f6aafd1e560
012f7 f4                             hlt        
012f8 41b9ffffff7f                   mov        r9d, 0x7fffffff
012fe 4d3bc1                         cmp        r8, r9
01301 bdffffffff                     mov        ebp, 0xffffffff
01306 7c08                           jl         0x7f6a97bddf10
01308 400f95c5                       setne      bpl
0130c 400fb6ed                       movzx      ebp, bpl
01310 be45ffffff                     mov        esi, 0xffffff45
01315 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
0131d 4c890c24                       mov        qword ptr [rsp], r9
01321 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
01325 894c240c                       mov        dword ptr [rsp + 0xc], ecx
01329 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01331 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01336 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0133b 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01340 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
01344 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01348 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0134d 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01352 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
01356 894c2434                       mov        dword ptr [rsp + 0x34], ecx
0135a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0135f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01364 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
01368 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
0136c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01371 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01376 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0137d 894c2444                       mov        dword ptr [rsp + 0x44], ecx
01381 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01386 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0138b 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
0138f 894c2454                       mov        dword ptr [rsp + 0x54], ecx
01393 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01398 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
0139d 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
013a2 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
013a7 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
013af 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
013b4 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
013bc 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
013c1 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
013c9 899c2488000000                 mov        dword ptr [rsp + 0x88], ebx
013d0 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013d8 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
013e0 90                             nop        
013e1 90                             nop        
013e2 90                             nop        
013e3 e878faaeff                     call       0x7f6a976cda60
013e8 0f1f8400e014000f               nop        dword ptr [rax + rax + 0xf0014e0]
013f0 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
013fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
013fe e85d051418                     call       0x7f6aafd1e560
01403 f4                             hlt        
01404 be45ffffff                     mov        esi, 0xffffff45
01409 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01411 448b442408                     mov        r8d, dword ptr [rsp + 8]
01416 44890424                       mov        dword ptr [rsp], r8d
0141a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0141f 4489442404                     mov        dword ptr [rsp + 4], r8d
01424 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01429 44894c2408                     mov        dword ptr [rsp + 8], r9d
0142e 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01433 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01438 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0143d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01442 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01447 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0144c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01451 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01456 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0145b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01460 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01465 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0146a 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0146f 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01474 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01479 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0147e 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01483 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01488 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0148d 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01492 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01497 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
0149c 448b442474                     mov        r8d, dword ptr [rsp + 0x74]
014a1 4489442450                     mov        dword ptr [rsp + 0x50], r8d
014a6 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
014ab 4c89442458                     mov        qword ptr [rsp + 0x58], r8
014b0 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
014b8 4c89442460                     mov        qword ptr [rsp + 0x60], r8
014bd 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
014c2 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014ca 90                             nop        
014cb e890f9aeff                     call       0x7f6a976cda60
014d0 0f1f8400c8150010               nop        dword ptr [rax + rax + 0x100015c8]
014d8 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
014e2 4883e4f0                       and        rsp, 0xfffffffffffffff0
014e6 e875041418                     call       0x7f6aafd1e560
014eb f4                             hlt        
014ec be45ffffff                     mov        esi, 0xffffff45
014f1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014f9 448b442408                     mov        r8d, dword ptr [rsp + 8]
014fe 44890424                       mov        dword ptr [rsp], r8d
01502 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01507 4489442404                     mov        dword ptr [rsp + 4], r8d
0150c 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01511 4489542408                     mov        dword ptr [rsp + 8], r10d
01516 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0151b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01520 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01525 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0152a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0152f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01534 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01539 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0153e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01543 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01548 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0154d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01552 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01557 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0155c 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01561 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01566 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0156b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01570 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01575 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0157a 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0157f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01584 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01589 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0158e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01593 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01598 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
015a0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
015a5 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
015aa 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
015b1 90                             nop        
015b2 90                             nop        
015b3 e8a8f8aeff                     call       0x7f6a976cda60
015b8 0f1f8400b0160011               nop        dword ptr [rax + rax + 0x110016b0]
015c0 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
015ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
015ce e88d031418                     call       0x7f6aafd1e560
015d3 f4                             hlt        
015d4 be3dffffff                     mov        esi, 0xffffff3d
015d9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
015e1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
015e6 44890c24                       mov        dword ptr [rsp], r9d
015ea 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
015ef 44894c2404                     mov        dword ptr [rsp + 4], r9d
015f4 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
015f9 4489442408                     mov        dword ptr [rsp + 8], r8d
015fe 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01603 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01608 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0160d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01612 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
01617 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
0161c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01621 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01626 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0162b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01630 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01635 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0163a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0163f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01644 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01649 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0164e 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01653 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01658 448b8424c0000000               mov        r8d, dword ptr [rsp + 0xc0]
01660 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01665 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
0166a 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0166f 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01674 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01679 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0167e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01683 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01688 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0168d 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01695 4c89442460                     mov        qword ptr [rsp + 0x60], r8
0169a 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
016a2 4c89442468                     mov        qword ptr [rsp + 0x68], r8
016a7 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
016ac 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
016b4 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
016bb 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
016c2 90                             nop        
016c3 e898f7aeff                     call       0x7f6a976cda60
016c8 0f1f8400c0170012               nop        dword ptr [rax + rax + 0x120017c0]
016d0 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
016da 4883e4f0                       and        rsp, 0xfffffffffffffff0
016de e87d021418                     call       0x7f6aafd1e560
016e3 f4                             hlt        
016e4 be45ffffff                     mov        esi, 0xffffff45
016e9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016f1 448b542408                     mov        r10d, dword ptr [rsp + 8]
016f6 44891424                       mov        dword ptr [rsp], r10d
016fa 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
016ff 4489542404                     mov        dword ptr [rsp + 4], r10d
01704 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01709 4489542408                     mov        dword ptr [rsp + 8], r10d
0170e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01713 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01718 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0171d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01722 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01727 4489442420                     mov        dword ptr [rsp + 0x20], r8d
0172c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01731 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01736 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
0173b 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01740 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01745 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0174a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0174f 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01754 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01759 4489442440                     mov        dword ptr [rsp + 0x40], r8d
0175e 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01763 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01768 895c2464                       mov        dword ptr [rsp + 0x64], ebx
0176c 90                             nop        
0176d 90                             nop        
0176e 90                             nop        
0176f e8ecf6aeff                     call       0x7f6a976cda60
01774 0f1f84006c180013               nop        dword ptr [rax + rax + 0x1300186c]
0177c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01786 4883e4f0                       and        rsp, 0xfffffffffffffff0
0178a e8d1011418                     call       0x7f6aafd1e560
0178f f4                             hlt        
01790 be45ffffff                     mov        esi, 0xffffff45
01795 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0179d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
017a2 44890c24                       mov        dword ptr [rsp], r9d
017a6 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
017ab 44894c2404                     mov        dword ptr [rsp + 4], r9d
017b0 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
017b5 44894c2408                     mov        dword ptr [rsp + 8], r9d
017ba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017bf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017c4 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
017c9 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
017ce 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
017d3 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
017d8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
017dd 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017e2 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
017e7 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
017ec 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017f1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
017f6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
017fb 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01800 4489442454                     mov        dword ptr [rsp + 0x54], r8d
01805 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0180a 90                             nop        
0180b e850f6aeff                     call       0x7f6a976cda60
01810 0f1f840008190014               nop        dword ptr [rax + rax + 0x14001908]
01818 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01822 4883e4f0                       and        rsp, 0xfffffffffffffff0
01826 e835011418                     call       0x7f6aafd1e560
0182b f4                             hlt        
0182c be45ffffff                     mov        esi, 0xffffff45
01831 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01839 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0183e 44891c24                       mov        dword ptr [rsp], r11d
01842 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01847 44895c2404                     mov        dword ptr [rsp + 4], r11d
0184c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01851 44895c2408                     mov        dword ptr [rsp + 8], r11d
01856 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
0185e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01863 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01868 4c89542418                     mov        qword ptr [rsp + 0x18], r10
0186d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01872 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01877 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0187c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01881 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01886 4489542424                     mov        dword ptr [rsp + 0x24], r10d
0188b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01890 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01895 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
0189a 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0189f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
018a4 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
018a9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
018ae 4489542434                     mov        dword ptr [rsp + 0x34], r10d
018b3 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
018b8 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
018bd 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
018c2 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
018c7 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
018cc 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
018d1 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
018d6 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
018db 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
018e0 4c89542458                     mov        qword ptr [rsp + 0x58], r10
018e5 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
018ed 4c89542460                     mov        qword ptr [rsp + 0x60], r10
018f2 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
018fa 4c89542468                     mov        qword ptr [rsp + 0x68], r10
018ff 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
01907 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
0190f e84cf5aeff                     call       0x7f6a976cda60
01914 0f1f84000c1a0015               nop        dword ptr [rax + rax + 0x15001a0c]
0191c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01926 4883e4f0                       and        rsp, 0xfffffffffffffff0
0192a e831001418                     call       0x7f6aafd1e560
0192f f4                             hlt        
01930 be45ffffff                     mov        esi, 0xffffff45
01935 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0193d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01942 44891c24                       mov        dword ptr [rsp], r11d
01946 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0194b 4489542404                     mov        dword ptr [rsp + 4], r10d
01950 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01955 44895c2408                     mov        dword ptr [rsp + 8], r11d
0195a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0195f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01964 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01969 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0196e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01973 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01978 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0197d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01982 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01987 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0198c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01991 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01996 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0199b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
019a0 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
019a5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
019aa 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
019af 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
019b4 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
019b9 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
019be 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
019c3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
019c8 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
019cd 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
019d2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
019d7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
019dc 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
019e4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
019e9 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
019f1 4c89542468                     mov        qword ptr [rsp + 0x68], r10
019f6 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
019fe 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
01a06 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
01a0d 90                             nop        
01a0e 90                             nop        
01a0f e84cf4aeff                     call       0x7f6a976cda60
01a14 0f1f84000c1b0016               nop        dword ptr [rax + rax + 0x16001b0c]
01a1c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01a26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01a2a e831ff1318                     call       0x7f6aafd1e560
01a2f f4                             hlt        
01a30 4585db                         test       r11d, r11d
01a33 7f07                           jg         0x7f6a97bde63c
01a35 33c0                           xor        eax, eax
01a37 e98be6ffff                     jmp        0x7f6a97bdccc7
01a3c 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01a40 89742428                       mov        dword ptr [rsp + 0x28], esi
01a44 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01a48 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01a4d 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01a52 897c2410                       mov        dword ptr [rsp + 0x10], edi
01a56 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a5b 48894424f8                     mov        qword ptr [rsp - 8], rax
01a60 8b0424                         mov        eax, dword ptr [rsp]
01a63 89442404                       mov        dword ptr [rsp + 4], eax
01a67 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a6c 48894424f8                     mov        qword ptr [rsp - 8], rax
01a71 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01a78 890424                         mov        dword ptr [rsp], eax
01a7b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01a80 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a88 488bf5                         mov        rsi, rbp
01a8b 8b542408                       mov        edx, dword ptr [rsp + 8]
01a8f 418bcb                         mov        ecx, r11d
01a92 90                             nop        
01a93 e8c815b5ff                     call       0x7f6a9772fc60
01a98 0f1f8400901b0017               nop        dword ptr [rax + rax + 0x17001b90]
01aa0 41ba40000000                   mov        r10d, 0x40
01aa6 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01aab c4e2a9f7c0                     shlx       rax, rax, r10
01ab0 48894424f8                     mov        qword ptr [rsp - 8], rax
01ab5 8b442404                       mov        eax, dword ptr [rsp + 4]
01ab9 890424                         mov        dword ptr [rsp], eax
01abc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ac1 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01ac6 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01aca 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01acf 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01ad4 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
01ad8 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01adc 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01ae0 e9e2e5ffff                     jmp        0x7f6a97bdccc7
01ae5 4585db                         test       r11d, r11d
01ae8 7f08                           jg         0x7f6a97bde6f2
01aea 4533f6                         xor        r14d, r14d
01aed e916e6ffff                     jmp        0x7f6a97bdcd08
01af2 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01af7 4889442430                     mov        qword ptr [rsp + 0x30], rax
01afc 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01b00 89742428                       mov        dword ptr [rsp + 0x28], esi
01b04 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01b08 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
01b0d 44896c2414                     mov        dword ptr [rsp + 0x14], r13d
01b12 897c2410                       mov        dword ptr [rsp + 0x10], edi
01b16 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01b20 8b0424                         mov        eax, dword ptr [rsp]
01b23 89442404                       mov        dword ptr [rsp + 4], eax
01b27 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2c 48894424f8                     mov        qword ptr [rsp - 8], rax
01b31 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b38 890424                         mov        dword ptr [rsp], eax
01b3b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b40 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b48 488bf5                         mov        rsi, rbp
01b4b 8b542408                       mov        edx, dword ptr [rsp + 8]
01b4f 418bcb                         mov        ecx, r11d
01b52 90                             nop        
01b53 e80815b5ff                     call       0x7f6a9772fc60
01b58 0f1f8400501c0018               nop        dword ptr [rax + rax + 0x18001c50]
01b60 41ba80000000                   mov        r10d, 0x80
01b66 442b542418                     sub        r10d, dword ptr [rsp + 0x18]
01b6b c462a9f7f0                     shlx       r14, rax, r10
01b70 48894424f8                     mov        qword ptr [rsp - 8], rax
01b75 8b442404                       mov        eax, dword ptr [rsp + 4]
01b79 890424                         mov        dword ptr [rsp], eax
01b7c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b81 8b7c2410                       mov        edi, dword ptr [rsp + 0x10]
01b85 448b6c2414                     mov        r13d, dword ptr [rsp + 0x14]
01b8a 8b4c241c                       mov        ecx, dword ptr [rsp + 0x1c]
01b8e 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01b92 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b96 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01b9b 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01ba0 e963e5ffff                     jmp        0x7f6a97bdcd08
01ba5 4533c0                         xor        r8d, r8d
01ba8 e970eeffff                     jmp        0x7f6a97bdd61d
01bad bee4ffffff                     mov        esi, 0xffffffe4
01bb2 48ffb42490000000               push       qword ptr [rsp + 0x90]
01bba 488f0424                       pop        qword ptr [rsp]
01bbe 90                             nop        
01bbf e89cf2aeff                     call       0x7f6a976cda60
01bc4 0f1f8400bc1c0019               nop        dword ptr [rax + rax + 0x19001cbc]
01bcc 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01bd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01bda e881fd1318                     call       0x7f6aafd1e560
01bdf f4                             hlt        
01be0 be5d000000                     mov        esi, 0x5d
01be5 90                             nop        
01be6 90                             nop        
01be7 e874f2aeff                     call       0x7f6a976cda60
01bec 0f1f8400e41c001a               nop        dword ptr [rax + rax + 0x1a001ce4]
01bf4 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01bfe 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c02 e859fd1318                     call       0x7f6aafd1e560
01c07 f4                             hlt        
01c08 bef6ffffff                     mov        esi, 0xfffffff6
01c0d 90                             nop        
01c0e 90                             nop        
01c0f e84cf2aeff                     call       0x7f6a976cda60
01c14 0f1f84000c1d001b               nop        dword ptr [rax + rax + 0x1b001d0c]
01c1c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01c26 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c2a e831fd1318                     call       0x7f6aafd1e560
01c2f f4                             hlt        
01c30 bef6ffffff                     mov        esi, 0xfffffff6
01c35 90                             nop        
01c36 90                             nop        
01c37 e824f2aeff                     call       0x7f6a976cda60
01c3c 0f1f8400341d001c               nop        dword ptr [rax + rax + 0x1c001d34]
01c44 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01c4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c52 e809fd1318                     call       0x7f6aafd1e560
01c57 f4                             hlt        
01c58 be6effffff                     mov        esi, 0xffffff6e
01c5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c65 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01c6a 44891c24                       mov        dword ptr [rsp], r11d
01c6e 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c73 44895c2408                     mov        dword ptr [rsp + 8], r11d
01c78 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01c7d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01c82 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01c87 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01c8c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01c91 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01c96 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01c9b 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01ca0 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ca5 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01caa 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01caf 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01cb4 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01cb9 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01cbe 90                             nop        
01cbf e89cf1aeff                     call       0x7f6a976cda60
01cc4 0f1f8400bc1d001d               nop        dword ptr [rax + rax + 0x1d001dbc]
01ccc 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01cd6 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cda e881fc1318                     call       0x7f6aafd1e560
01cdf f4                             hlt        
01ce0 bee4ffffff                     mov        esi, 0xffffffe4
01ce5 48ffb42490000000               push       qword ptr [rsp + 0x90]
01ced 488f0424                       pop        qword ptr [rsp]
01cf1 44896c2418                     mov        dword ptr [rsp + 0x18], r13d
01cf6 48894424f8                     mov        qword ptr [rsp - 8], rax
01cfb 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d02 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d06 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d0b 894c2428                       mov        dword ptr [rsp + 0x28], ecx
01d0f 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01d13 e848f1aeff                     call       0x7f6a976cda60
01d18 0f1f8400101e001e               nop        dword ptr [rax + rax + 0x1e001e10]
01d20 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01d2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d2e e82dfc1318                     call       0x7f6aafd1e560
01d33 f4                             hlt        
01d34 bee4ffffff                     mov        esi, 0xffffffe4
01d39 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d41 488f0424                       pop        qword ptr [rsp]
01d45 48894424f8                     mov        qword ptr [rsp - 8], rax
01d4a 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d51 89442418                       mov        dword ptr [rsp + 0x18], eax
01d55 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d5a 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
01d5e 89542428                       mov        dword ptr [rsp + 0x28], edx
01d62 4889442430                     mov        qword ptr [rsp + 0x30], rax
01d67 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01d6c 90                             nop        
01d6d 90                             nop        
01d6e 90                             nop        
01d6f e8ecf0aeff                     call       0x7f6a976cda60
01d74 0f1f84006c1e001f               nop        dword ptr [rax + rax + 0x1f001e6c]
01d7c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01d86 4883e4f0                       and        rsp, 0xfffffffffffffff0
01d8a e8d1fb1318                     call       0x7f6aafd1e560
01d8f f4                             hlt        
01d90 bebeffffff                     mov        esi, 0xffffffbe
01d95 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d9d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01da2 44891c24                       mov        dword ptr [rsp], r11d
01da6 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01dab 44895c2408                     mov        dword ptr [rsp + 8], r11d
01db0 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01db5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dba 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01dbf 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01dc4 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01dc9 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01dce 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01dd3 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01dd8 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01ddd 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01de2 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01de7 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01dec 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01df1 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01df6 90                             nop        
01df7 e864f0aeff                     call       0x7f6a976cda60
01dfc 0f1f8400f41e0020               nop        dword ptr [rax + rax + 0x20001ef4]
01e04 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01e0e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e12 e849fb1318                     call       0x7f6aafd1e560
01e17 f4                             hlt        
01e18 beccffffff                     mov        esi, 0xffffffcc
01e1d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e25 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e2a 44891424                       mov        dword ptr [rsp], r10d
01e2e 44896c2410                     mov        dword ptr [rsp + 0x10], r13d
01e33 48894424f8                     mov        qword ptr [rsp - 8], rax
01e38 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e3f 89442414                       mov        dword ptr [rsp + 0x14], eax
01e43 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e48 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01e4c 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01e50 897c242c                       mov        dword ptr [rsp + 0x2c], edi
01e54 90                             nop        
01e55 90                             nop        
01e56 90                             nop        
01e57 e804f0aeff                     call       0x7f6a976cda60
01e5c 0f1f8400541f0021               nop        dword ptr [rax + rax + 0x21001f54]
01e64 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01e6e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e72 e8e9fa1318                     call       0x7f6aafd1e560
01e77 f4                             hlt        
01e78 beccffffff                     mov        esi, 0xffffffcc
01e7d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e85 448b442408                     mov        r8d, dword ptr [rsp + 8]
01e8a 44890424                       mov        dword ptr [rsp], r8d
01e8e 48894424f8                     mov        qword ptr [rsp - 8], rax
01e93 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e9a 89442410                       mov        dword ptr [rsp + 0x10], eax
01e9e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01ea3 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01ea7 89542418                       mov        dword ptr [rsp + 0x18], edx
01eab 4889442428                     mov        qword ptr [rsp + 0x28], rax
01eb0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01eb5 897c2434                       mov        dword ptr [rsp + 0x34], edi
01eb9 90                             nop        
01eba 90                             nop        
01ebb e8a0efaeff                     call       0x7f6a976cda60
01ec0 0f1f8400b81f0022               nop        dword ptr [rax + rax + 0x22001fb8]
01ec8 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01ed2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ed6 e885fa1318                     call       0x7f6aafd1e560
01edb f4                             hlt        
01edc be45ffffff                     mov        esi, 0xffffff45
01ee1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ee9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01eee 44891424                       mov        dword ptr [rsp], r10d
01ef2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01ef7 4489542408                     mov        dword ptr [rsp + 8], r10d
01efc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f01 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f06 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f0b 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01f10 90                             nop        
01f11 90                             nop        
01f12 90                             nop        
01f13 e848efaeff                     call       0x7f6a976cda60
01f18 0f1f840010200023               nop        dword ptr [rax + rax + 0x23002010]
01f20 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01f2a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f2e e82dfa1318                     call       0x7f6aafd1e560
01f33 f4                             hlt        
01f34 be45ffffff                     mov        esi, 0xffffff45
01f39 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f41 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01f46 44891c24                       mov        dword ptr [rsp], r11d
01f4a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01f4f 44895c2408                     mov        dword ptr [rsp + 8], r11d
01f54 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f59 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f5e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01f63 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01f68 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01f6d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01f72 90                             nop        
01f73 e8e8eeaeff                     call       0x7f6a976cda60
01f78 0f1f840070200024               nop        dword ptr [rax + rax + 0x24002070]
01f80 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01f8a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f8e e8cdf91318                     call       0x7f6aafd1e560
01f93 f4                             hlt        
01f94 bef6ffffff                     mov        esi, 0xfffffff6
01f99 90                             nop        
01f9a 90                             nop        
01f9b e8c0eeaeff                     call       0x7f6a976cda60
01fa0 0f1f840098200025               nop        dword ptr [rax + rax + 0x25002098]
01fa8 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01fb2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fb6 e8a5f91318                     call       0x7f6aafd1e560
01fbb f4                             hlt        
01fbc be5d000000                     mov        esi, 0x5d
01fc1 90                             nop        
01fc2 90                             nop        
01fc3 e898eeaeff                     call       0x7f6a976cda60
01fc8 0f1f8400c0200026               nop        dword ptr [rax + rax + 0x260020c0]
01fd0 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
01fda 4883e4f0                       and        rsp, 0xfffffffffffffff0
01fde e87df91318                     call       0x7f6aafd1e560
01fe3 f4                             hlt        
01fe4 be45ffffff                     mov        esi, 0xffffff45
01fe9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ff1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ff6 44891c24                       mov        dword ptr [rsp], r11d
01ffa 90                             nop        
01ffb e860eeaeff                     call       0x7f6a976cda60
02000 0f1f8400f8200027               nop        dword ptr [rax + rax + 0x270020f8]
02008 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
02012 4883e4f0                       and        rsp, 0xfffffffffffffff0
02016 e845f91318                     call       0x7f6aafd1e560
0201b f4                             hlt        
0201c bef6ffffff                     mov        esi, 0xfffffff6
02021 418beb                         mov        ebp, r11d
02024 90                             nop        
02025 90                             nop        
02026 90                             nop        
02027 e834eeaeff                     call       0x7f6a976cda60
0202c 0f1f840024210028               nop        dword ptr [rax + rax + 0x28002124]
02034 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
0203e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02042 e819f91318                     call       0x7f6aafd1e560
02047 f4                             hlt        
02048 bef6ffffff                     mov        esi, 0xfffffff6
0204d 418be8                         mov        ebp, r8d
02050 90                             nop        
02051 90                             nop        
02052 90                             nop        
02053 e808eeaeff                     call       0x7f6a976cda60
02058 0f1f840050210029               nop        dword ptr [rax + rax + 0x29002150]
02060 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
0206a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0206e e8edf81318                     call       0x7f6aafd1e560
02073 f4                             hlt        
02074 bef6ffffff                     mov        esi, 0xfffffff6
02079 418beb                         mov        ebp, r11d
0207c 90                             nop        
0207d 90                             nop        
0207e 90                             nop        
0207f e8dcedaeff                     call       0x7f6a976cda60
02084 0f1f84007c21002a               nop        dword ptr [rax + rax + 0x2a00217c]
0208c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
02096 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209a e8c1f81318                     call       0x7f6aafd1e560
0209f f4                             hlt        
020a0 bef6ffffff                     mov        esi, 0xfffffff6
020a5 90                             nop        
020a6 90                             nop        
020a7 e8b4edaeff                     call       0x7f6a976cda60
020ac 0f1f8400a421002b               nop        dword ptr [rax + rax + 0x2b0021a4]
020b4 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
020be 4883e4f0                       and        rsp, 0xfffffffffffffff0
020c2 e899f81318                     call       0x7f6aafd1e560
020c7 f4                             hlt        
020c8 bef6ffffff                     mov        esi, 0xfffffff6
020cd 90                             nop        
020ce 90                             nop        
020cf e88cedaeff                     call       0x7f6a976cda60
020d4 0f1f8400cc21002c               nop        dword ptr [rax + rax + 0x2c0021cc]
020dc 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
020e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
020ea e871f81318                     call       0x7f6aafd1e560
020ef f4                             hlt        
020f0 bef6ffffff                     mov        esi, 0xfffffff6
020f5 90                             nop        
020f6 90                             nop        
020f7 e864edaeff                     call       0x7f6a976cda60
020fc 0f1f8400f421002d               nop        dword ptr [rax + rax + 0x2d0021f4]
02104 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
0210e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02112 e849f81318                     call       0x7f6aafd1e560
02117 f4                             hlt        
02118 bef6ffffff                     mov        esi, 0xfffffff6
0211d 90                             nop        
0211e 90                             nop        
0211f e83cedaeff                     call       0x7f6a976cda60
02124 0f1f84001c22002e               nop        dword ptr [rax + rax + 0x2e00221c]
0212c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
02136 4883e4f0                       and        rsp, 0xfffffffffffffff0
0213a e821f81318                     call       0x7f6aafd1e560
0213f f4                             hlt        
02140 bef6ffffff                     mov        esi, 0xfffffff6
02145 90                             nop        
02146 90                             nop        
02147 e814edaeff                     call       0x7f6a976cda60
0214c 0f1f84004422002f               nop        dword ptr [rax + rax + 0x2f002244]
02154 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
0215e 4883e4f0                       and        rsp, 0xfffffffffffffff0
02162 e8f9f71318                     call       0x7f6aafd1e560
02167 f4                             hlt        
02168 bef6ffffff                     mov        esi, 0xfffffff6
0216d 90                             nop        
0216e 90                             nop        
0216f e8ececaeff                     call       0x7f6a976cda60
02174 0f1f84006c220030               nop        dword ptr [rax + rax + 0x3000226c]
0217c 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
02186 4883e4f0                       and        rsp, 0xfffffffffffffff0
0218a e8d1f71318                     call       0x7f6aafd1e560
0218f f4                             hlt        
02190 bef6ffffff                     mov        esi, 0xfffffff6
02195 90                             nop        
02196 90                             nop        
02197 e8c4ecaeff                     call       0x7f6a976cda60
0219c 0f1f840094220031               nop        dword ptr [rax + rax + 0x31002294]
021a4 48bfc00352706a7f0000           movabs     rdi, 0x7f6a705203c0
021ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
021b2 e8a9f71318                     call       0x7f6aafd1e560
021b7 f4                             hlt        
021b8 eb08                           jmp        0x7f6a97bdedc2
021ba eb06                           jmp        0x7f6a97bdedc2
021bc eb04                           jmp        0x7f6a97bdedc2
021be eb02                           jmp        0x7f6a97bdedc2
021c0 eb00                           jmp        0x7f6a97bdedc2
021c2 488bf0                         mov        rsi, rax
021c5 e9bae8ffff                     jmp        0x7f6a97bdd684
021ca 49ba53d6bd976a7f0000           movabs     r10, 0x7f6a97bdd653
021d4 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
021db e98035b5ff                     jmp        0x7f6a97732360
021e0 e8fb03b4ff                     call       0x7f6a9771f1e0
021e5 e934deffff                     jmp        0x7f6a97bdcc1e
021ea f4                             hlt        
021eb f4                             hlt        
021ec f4                             hlt        
021ed f4                             hlt        
021ee f4                             hlt        
021ef f4                             hlt        
