00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f85da1d0000                   jne        0x7f4eafe69378
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
00050 0f83a7190000                   jae        0x7f4eafe68f7d
00056 440fb6441607                   movzx      r8d, byte ptr [rsi + rdx + 7]
0005c 4585c0                         test       r8d, r8d
0005f 0f84b7190000                   je         0x7f4eafe68f9c
00065 448bda                         mov        r11d, edx
00068 442bd9                         sub        r11d, ecx
0006b 8b0c24                         mov        ecx, dword ptr [rsp]
0006e 83c1f9                         add        ecx, -7
00071 8d42f8                         lea        eax, [rdx - 8]
00074 468d0cdd00000000               lea        r9d, [r11*8]
0007c f3450fbdd0                     lzcnt      r10d, r8d
00081 41be1f000000                   mov        r14d, 0x1f
00087 452bf2                         sub        r14d, r10d
0008a bf08000000                     mov        edi, 8
0008f 412bfe                         sub        edi, r14d
00092 418bd1                         mov        edx, r9d
00095 2bd7                           sub        edx, edi
00097 4183fb08                       cmp        r11d, 8
0009b 0f8ce7170000                   jl         0x7f4eafe68e08
000a1 85c9                           test       ecx, ecx
000a3 0f8c171b0000                   jl         0x7f4eafe69140
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 3bc5                           cmp        eax, ebp
000b1 0f83111a0000                   jae        0x7f4eafe69048
000b7 448bc0                         mov        r8d, eax
000ba 4e8b6c0608                     mov        r13, qword ptr [rsi + r8 + 8]
000bf 4183c3f8                       add        r11d, -8
000c3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
000cb 4183c2f0                       add        r10d, -0x10
000cf 4183fb08                       cmp        r11d, 8
000d3 0f8c5c180000                   jl         0x7f4eafe68eb5
000d9 85c9                           test       ecx, ecx
000db 0f8c271b0000                   jl         0x7f4eafe69188
000e1 8b2c24                         mov        ebp, dword ptr [rsp]
000e4 83c5f9                         add        ebp, -7
000e7 443bd5                         cmp        r10d, ebp
000ea 0f83181a0000                   jae        0x7f4eafe69088
000f0 458bda                         mov        r11d, r10d
000f3 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
000fb 4b8b741808                     mov        rsi, qword ptr [r8 + r11 + 8]
00100 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00105 448b5d18                       mov        r11d, dword ptr [rbp + 0x18]
00109 4585db                         test       r11d, r11d
0010c 0f841e190000                   je         0x7f4eafe68fb0
00112 448b4d1c                       mov        r9d, dword ptr [rbp + 0x1c]
00116 458b4104                       mov        r8d, dword ptr [r9 + 4]
0011a 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
0011d 85db                           test       ebx, ebx
0011f 0f841f190000                   je         0x7f4eafe68fc4
00125 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0012a 4889b42498000000               mov        qword ptr [rsp + 0x98], rsi
00132 4489542414                     mov        dword ptr [rsp + 0x14], r10d
00137 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
0013c 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00143 448974240c                     mov        dword ptr [rsp + 0xc], r14d
00148 897c2424                       mov        dword ptr [rsp + 0x24], edi
0014c 89442410                       mov        dword ptr [rsp + 0x10], eax
00150 894c2404                       mov        dword ptr [rsp + 4], ecx
00154 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
0015c 45034304                       add        r8d, dword ptr [r11 + 4]
00160 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00165 44034304                       add        r8d, dword ptr [rbx + 4]
00169 895c2438                       mov        dword ptr [rsp + 0x38], ebx
0016d 448944241c                     mov        dword ptr [rsp + 0x1c], r8d
00172 4c8bd3                         mov        r10, rbx
00175 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0017a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0017f 4d8bd3                         mov        r10, r11
00182 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00187 4d8bd1                         mov        r10, r9
0018a 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018f 4585c0                         test       r8d, r8d
00192 0f84c5080000                   je         0x7f4eafe67fdd
00198 be40000000                     mov        esi, 0x40
0019d 2bf7                           sub        esi, edi
0019f 443bc6                         cmp        r8d, esi
001a2 0f8f00020000                   jg         0x7f4eafe67928
001a8 412bf0                         sub        esi, r8d
001ab c4c2cbf7ed                     shrx       rbp, r13, rsi
001b0 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001b5 4183f840                       cmp        r8d, 0x40
001b9 0f8d191b0000                   jge        0x7f4eafe69258
001bf 41bb01000000                   mov        r11d, 1
001c5 c442b9f7d3                     shlx       r10, r11, r8
001ca 49ffca                         dec        r10
001cd 4c23d5                         and        r10, rbp
001d0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
001d5 458bd0                         mov        r10d, r8d
001d8 458bca                         mov        r9d, r10d
001db 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001e0 458d4108                       lea        r8d, [r9 + 8]
001e4 4183f840                       cmp        r8d, 0x40
001e8 7c35                           jl         0x7f4eafe6779f
001ea 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001ef 4183c1c8                       add        r9d, -0x38
001f3 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001f8 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00200 8b542408                       mov        edx, dword ptr [rsp + 8]
00204 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
00208 666690                         nop        
0020b e8d040a9ff                     call       0x7f4eaf8fb860
00210 0f1f840008030000               nop        dword ptr [rax + rax + 0x308]
00218 4889442420                     mov        qword ptr [rsp + 0x20], rax
0021d eb31                           jmp        0x7f4eafe677d0
0021f 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
00224 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0022c 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00231 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00236 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0023e 448b8424a0000000               mov        r8d, dword ptr [rsp + 0xa0]
00246 4489442410                     mov        dword ptr [rsp + 0x10], r8d
0024b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00250 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00255 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00259 83fd20                         cmp        ebp, 0x20
0025c 0f8df6190000                   jge        0x7f4eafe691d8
00262 c462d3f7542460                 shrx       r10, qword ptr [rsp + 0x60], rbp
00269 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0026e 41bb01000000                   mov        r11d, 1
00274 c44251f7d3                     shlx       r10d, r11d, ebp
00279 41ffca                         dec        r10d
0027c 4d63d2                         movsxd     r10, r10d
0027f 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00284 458bda                         mov        r11d, r10d
00287 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0028c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00291 418b6a04                       mov        ebp, dword ptr [r10 + 4]
00295 83fd20                         cmp        ebp, 0x20
00298 0f8de2190000                   jge        0x7f4eafe69200
0029e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
002a6 458b5204                       mov        r10d, dword ptr [r10 + 4]
002aa 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002b2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
002b7 458b5314                       mov        r10d, dword ptr [r11 + 0x14]
002bb 458b4204                       mov        r8d, dword ptr [r10 + 4]
002bf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002c4 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
002c8 458b5b04                       mov        r11d, dword ptr [r11 + 4]
002cc 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
002d1 458b5114                       mov        r10d, dword ptr [r9 + 0x14]
002d5 458b5204                       mov        r10d, dword ptr [r10 + 4]
002d9 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
002dd 85c9                           test       ecx, ecx
002df 0f8e10170000                   jle        0x7f4eafe68f75
002e5 41ffc8                         dec        r8d
002e8 4489442460                     mov        dword ptr [rsp + 0x60], r8d
002ed 41ffcb                         dec        r11d
002f0 44895c2464                     mov        dword ptr [rsp + 0x64], r11d
002f5 41ffca                         dec        r10d
002f8 4489542470                     mov        dword ptr [rsp + 0x70], r10d
002fd c462d3f7542468                 shrx       r10, qword ptr [rsp + 0x68], rbp
00304 41bb01000000                   mov        r11d, 1
0030a c44251f7c3                     shlx       r8d, r11d, ebp
0030f 458bda                         mov        r11d, r10d
00312 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
00317 41ffc8                         dec        r8d
0031a 4d63d0                         movsxd     r10, r8d
0031d 4c23542468                     and        r10, qword ptr [rsp + 0x68]
00322 458bd2                         mov        r10d, r10d
00325 4489542468                     mov        dword ptr [rsp + 0x68], r10d
0032a 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00332 458b9af4000000                 mov        r11d, dword ptr [r10 + 0xf4]
00339 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
00341 458b92f0000000                 mov        r10d, dword ptr [r10 + 0xf0]
00348 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
00350 458b5204                       mov        r10d, dword ptr [r10 + 4]
00354 4585d2                         test       r10d, r10d
00357 0f86fb160000                   jbe        0x7f4eafe68fd8
0035d 4d63d2                         movsxd     r10, r10d
00360 4c63d9                         movsxd     r11, ecx
00363 49ffcb                         dec        r11
00366 4d3bda                         cmp        r11, r10
00369 0f83e9160000                   jae        0x7f4eafe68fd8
0036f 448b542404                     mov        r10d, dword ptr [rsp + 4]
00374 4585d2                         test       r10d, r10d
00377 0f8cd3170000                   jl         0x7f4eafe690d0
0037d 448b1c24                       mov        r11d, dword ptr [rsp]
00381 4183c3f9                       add        r11d, -7
00385 44899c24c4000000               mov        dword ptr [rsp + 0xc4], r11d
0038d 4533d2                         xor        r10d, r10d
00390 4533db                         xor        r11d, r11d
00393 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0039b 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
003a3 e985020000                     jmp        0x7f4eafe67bad
003a8 418be8                         mov        ebp, r8d
003ab 2bee                           sub        ebp, esi
003ad 6690                           nop        
003af e82c3fa9ff                     call       0x7f4eaf8fb860
003b4 0f1f8400ac040001               nop        dword ptr [rax + rax + 0x10004ac]
003bc 4823442428                     and        rax, qword ptr [rsp + 0x28]
003c1 41bb40000000                   mov        r11d, 0x40
003c7 442bdd                         sub        r11d, ebp
003ca c462d1f7c0                     shlx       r8, rax, rbp
003cf c462a3f7942498000000           shrx       r10, qword ptr [rsp + 0x98], r11
003d9 4d0bc2                         or         r8, r10
003dc 4c89442460                     mov        qword ptr [rsp + 0x60], r8
003e1 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e6 e9edfdffff                     jmp        0x7f4eafe67758
003eb 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003f3 4f8b540208                     mov        r10, qword ptr [r10 + r8 + 8]
003f8 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003fd 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00405 4c89542420                     mov        qword ptr [rsp + 0x20], r10
0040a 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040e 896c2410                       mov        dword ptr [rsp + 0x10], ebp
00412 0f1f8000000000                 nop        dword ptr [rax]
00419 0f1f8000000000                 nop        dword ptr [rax]
00420 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00427 83fd40                         cmp        ebp, 0x40
0042a 0f8d000a0000                   jge        0x7f4eafe683b0
00430 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0043a 41ba01000000                   mov        r10d, 1
00440 c442d1f7d2                     shlx       r10, r10, rbp
00445 49ffca                         dec        r10
00448 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00450 458bc2                         mov        r8d, r10d
00453 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
0045a 83fd40                         cmp        ebp, 0x40
0045d 0f8dad0a0000                   jge        0x7f4eafe68490
00463 c4c2d3f7f9                     shrx       rdi, r9, rbp
00468 41ba01000000                   mov        r10d, 1
0046e c442d1f7d2                     shlx       r10, r10, rbp
00473 49ffca                         dec        r10
00476 4d23d1                         and        r10, r9
00479 418bca                         mov        ecx, r10d
0047c 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
00483 83fd40                         cmp        ebp, 0x40
00486 0f8d840b0000                   jge        0x7f4eafe68590
0048c c4e2d3f7df                     shrx       rbx, rdi, rbp
00491 41ba01000000                   mov        r10d, 1
00497 c442d1f7d2                     shlx       r10, r10, rbp
0049c 49ffca                         dec        r10
0049f 4c23d7                         and        r10, rdi
004a2 458bd2                         mov        r10d, r10d
004a5 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
004ac 83fd40                         cmp        ebp, 0x40
004af 0f8d5f0c0000                   jge        0x7f4eafe68694
004b5 41bb01000000                   mov        r11d, 1
004bb c442d1f7cb                     shlx       r9, r11, rbp
004c0 49ffc9                         dec        r9
004c3 4c23cb                         and        r9, rbx
004c6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004ce 418bfb                         mov        edi, r11d
004d1 4103fa                         add        edi, r10d
004d4 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004d9 458bd2                         mov        r10d, r10d
004dc 4403d1                         add        r10d, ecx
004df 4863cf                         movsxd     rcx, edi
004e2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
004ea 458bdb                         mov        r11d, r11d
004ed 4d03cb                         add        r9, r11
004f0 4c8b9c24e8000000               mov        r11, qword ptr [rsp + 0xe8]
004f8 4c03d9                         add        r11, rcx
004fb 4c899c24e8000000               mov        qword ptr [rsp + 0xe8], r11
00503 4d85c9                         test       r9, r9
00506 0f8e2c070000                   jle        0x7f4eafe681b8
0050c 4981f9ffffff7f                 cmp        r9, 0x7fffffff
00513 0f8feb0c0000                   jg         0x7f4eafe68784
00519 4181faffff0100                 cmp        r10d, 0x1ffff
00520 0f8fd60d0000                   jg         0x7f4eafe6887c
00526 81ffffff0300                   cmp        edi, 0x3ffff
0052c 0f8f9e0e0000                   jg         0x7f4eafe68950
00532 458bd9                         mov        r11d, r9d
00535 4181fb00000010                 cmp        r11d, 0x10000000
0053c 0f83620f0000                   jae        0x7f4eafe68a24
00542 4d63d2                         movsxd     r10, r10d
00545 4d63db                         movsxd     r11, r11d
00548 48c1e112                       shl        rcx, 0x12
0054c 49c1e324                       shl        r11, 0x24
00550 4c0bd9                         or         r11, rcx
00553 4d0bda                         or         r11, r10
00556 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
0055d 448b9424f0000000               mov        r10d, dword ptr [rsp + 0xf0]
00565 4e895cd108                     mov        qword ptr [rcx + r10*8 + 8], r11
0056a 8b2c24                         mov        ebp, dword ptr [rsp]
0056d 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00571 0f8da5000000                   jge        0x7f4eafe67b9c
00577 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0057f 49c1ea30                       shr        r10, 0x30
00583 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00588 49c1eb30                       shr        r11, 0x30
0058c 458bca                         mov        r9d, r10d
0058f 418bcb                         mov        ecx, r11d
00592 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
0059a c4c22bf7d8                     shrx       ebx, r8d, r10d
0059f 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005a7 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
005af c44223f7d0                     shrx       r10d, r8d, r11d
005b4 4103ca                         add        ecx, r10d
005b7 894c2474                       mov        dword ptr [rsp + 0x74], ecx
005bb 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005c3 4183fb20                       cmp        r11d, 0x20
005c7 0f8dc30f0000                   jge        0x7f4eafe68b10
005cd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005d5 49c1ea30                       shr        r10, 0x30
005d9 458bd2                         mov        r10d, r10d
005dc b901000000                     mov        ecx, 1
005e1 c4e221f7c9                     shlx       ecx, ecx, r11d
005e6 ffc9                           dec        ecx
005e8 23cb                           and        ecx, ebx
005ea 4103c9                         add        ecx, r9d
005ed 894c2448                       mov        dword ptr [rsp + 0x48], ecx
005f1 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
005f9 4183fb20                       cmp        r11d, 0x20
005fd 0f8d25100000                   jge        0x7f4eafe68ba8
00603 41b901000000                   mov        r9d, 1
00609 c44221f7c9                     shlx       r9d, r9d, r11d
0060e 41ffc9                         dec        r9d
00611 4523c8                         and        r9d, r8d
00614 4503ca                         add        r9d, r10d
00617 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
0061c 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00620 0f8dbb030000                   jge        0x7f4eafe67f61
00626 89ac24f0000000                 mov        dword ptr [rsp + 0xf0], ebp
0062d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00632 4423542474                     and        r10d, dword ptr [rsp + 0x74]
00637 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0063c 418b4814                       mov        ecx, dword ptr [r8 + 0x14]
00640 448b5904                       mov        r11d, dword ptr [rcx + 4]
00644 453bd3                         cmp        r10d, r11d
00647 0f8320040000                   jae        0x7f4eafe67fed
0064d 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00652 4423442468                     and        r8d, dword ptr [rsp + 0x68]
00657 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0065c 458b5b14                       mov        r11d, dword ptr [r11 + 0x14]
00660 418b5b04                       mov        ebx, dword ptr [r11 + 4]
00664 4e8b54d108                     mov        r10, qword ptr [rcx + r10*8 + 8]
00669 4c89542478                     mov        qword ptr [rsp + 0x78], r10
0066e 443bc3                         cmp        r8d, ebx
00671 0f837d040000                   jae        0x7f4eafe68074
00677 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0067c 4423542448                     and        r10d, dword ptr [rsp + 0x48]
00681 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00686 458b4914                       mov        r9d, dword ptr [r9 + 0x14]
0068a 418b4904                       mov        ecx, dword ptr [r9 + 4]
0068e 4f8b5cc308                     mov        r11, qword ptr [r11 + r8*8 + 8]
00693 4c899c2480000000               mov        qword ptr [rsp + 0x80], r11
0069b 443bd1                         cmp        r10d, ecx
0069e 0f83ec040000                   jae        0x7f4eafe68110
006a4 4f8b54d108                     mov        r10, qword ptr [r9 + r10*8 + 8]
006a9 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006b1 8bac24f0000000                 mov        ebp, dword ptr [rsp + 0xf0]
006b8 ffc5                           inc        ebp
006ba 892c24                         mov        dword ptr [rsp], ebp
006bd 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006c1 0f8deb020000                   jge        0x7f4eafe67f32
006c7 49c1ea28                       shr        r10, 0x28
006cb 458bd2                         mov        r10d, r10d
006ce 450fb6d2                       movzx      r10d, r10b
006d2 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006da 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006df 49c1ea28                       shr        r10, 0x28
006e3 458bda                         mov        r11d, r10d
006e6 410fb6eb                       movzx      ebp, r11b
006ea 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006f1 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006f9 49c1ea28                       shr        r10, 0x28
006fd 458bda                         mov        r11d, r10d
00700 450fb6db                       movzx      r11d, r11b
00704 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
0070c 4103eb                         add        ebp, r11d
0070f 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00716 41ba01000000                   mov        r10d, 1
0071c 44899424f4000000               mov        dword ptr [rsp + 0xf4], r10d
00724 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0072c 49c1ea20                       shr        r10, 0x20
00730 458bd2                         mov        r10d, r10d
00733 410fb6ea                       movzx      ebp, r10b
00737 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
0073e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00743 49c1ea20                       shr        r10, 0x20
00747 458bda                         mov        r11d, r10d
0074a 410fb6eb                       movzx      ebp, r11b
0074e 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00755 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0075d 49c1ea20                       shr        r10, 0x20
00761 458bd2                         mov        r10d, r10d
00764 410fb6ea                       movzx      ebp, r10b
00768 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0076f 448bcd                         mov        r9d, ebp
00772 44038c24d4000000               add        r9d, dword ptr [rsp + 0xd4]
0077a 44038c24d8000000               add        r9d, dword ptr [rsp + 0xd8]
00782 44038c24d0000000               add        r9d, dword ptr [rsp + 0xd0]
0078a 4585c9                         test       r9d, r9d
0078d 0f8499050000                   je         0x7f4eafe682ac
00793 4183f93f                       cmp        r9d, 0x3f
00797 0f8f6b060000                   jg         0x7f4eafe68388
0079d 41b840000000                   mov        r8d, 0x40
007a3 442b44243c                     sub        r8d, dword ptr [rsp + 0x3c]
007a8 453bc8                         cmp        r9d, r8d
007ab 7e48                           jle        0x7f4eafe67d75
007ad 418bc9                         mov        ecx, r9d
007b0 412bc8                         sub        ecx, r8d
007b3 4183f840                       cmp        r8d, 0x40
007b7 0f8ddf0f0000                   jge        0x7f4eafe68d1c
007bd 41ba01000000                   mov        r10d, 1
007c3 c442b9f7d2                     shlx       r10, r10, r8
007c8 49ffca                         dec        r10
007cb 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007d3 c4c2f1f7ea                     shlx       rbp, r10, rcx
007d8 41bb40000000                   mov        r11d, 0x40
007de 442bd9                         sub        r11d, ecx
007e1 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007e8 490bea                         or         rbp, r10
007eb 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007f3 eb30                           jmp        0x7f4eafe67da5
007f5 452bc1                         sub        r8d, r9d
007f8 c462bbf7842498000000           shrx       r8, qword ptr [rsp + 0x98], r8
00802 4183f940                       cmp        r9d, 0x40
00806 0f8da00e0000                   jge        0x7f4eafe68c2c
0080c 41ba01000000                   mov        r10d, 1
00812 c4c2b1f7ea                     shlx       rbp, r10, r9
00817 48ffcd                         dec        rbp
0081a 4923e8                         and        rbp, r8
0081d 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00825 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0082a 4503d1                         add        r10d, r9d
0082d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00832 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00837 4503d9                         add        r11d, r9d
0083a 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0083f 4183fa40                       cmp        r10d, 0x40
00843 0f8cd7fbffff                   jl         0x7f4eafe679a0
00849 4183c2c0                       add        r10d, -0x40
0084d 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00852 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00856 83c5f8                         add        ebp, -8
00859 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0085d 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00861 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00865 83c1f0                         add        ecx, -0x10
00868 83f908                         cmp        ecx, 8
0086b 0f8cf3000000                   jl         0x7f4eafe67ee4
00871 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00876 4183c0e8                       add        r8d, -0x18
0087a 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00882 0f8263fbffff                   jb         0x7f4eafe6796b
00888 bee4ffffff                     mov        esi, 0xffffffe4
0088d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00895 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0089a 44891c24                       mov        dword ptr [rsp], r11d
0089e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
008a3 44895c2404                     mov        dword ptr [rsp + 4], r11d
008a8 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
008ad 44895c2408                     mov        dword ptr [rsp + 8], r11d
008b2 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008b7 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008bc 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
008c1 448954240c                     mov        dword ptr [rsp + 0xc], r10d
008c6 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
008cb 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
008d0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
008d5 44895c241c                     mov        dword ptr [rsp + 0x1c], r11d
008da 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008df 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008e4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008e9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008ee 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008f3 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008f8 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
008fd 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00902 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00907 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0090c 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00911 4489542440                     mov        dword ptr [rsp + 0x40], r10d
00916 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0091b 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00920 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00925 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0092a 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0092f 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00934 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0093c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00941 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00949 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0094e 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00956 90                             nop        
00957 e884b7b5ff                     call       0x7f4eaf9c3660
0095c 0f1f8400540a0002               nop        dword ptr [rax + rax + 0x2000a54]
00964 85c9                           test       ecx, ecx
00966 7f08                           jg         0x7f4eafe67ef0
00968 4533d2                         xor        r10d, r10d
0096b e988faffff                     jmp        0x7f4eafe67978
00970 8be9                           mov        ebp, ecx
00972 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0097a 8b542408                       mov        edx, dword ptr [rsp + 8]
0097e 90                             nop        
0097f e85c39a9ff                     call       0x7f4eaf8fb860
00984 0f1f84007c0a0003               nop        dword ptr [rax + rax + 0x3000a7c]
0098c 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00991 41c1e303                       shl        r11d, 3
00995 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
0099a 41c1e003                       shl        r8d, 3
0099e 452bd8                         sub        r11d, r8d
009a1 4181c3c0000000                 add        r11d, 0xc0
009a8 c462a1f7d0                     shlx       r10, rax, r11
009ad e946faffff                     jmp        0x7f4eafe67978
009b2 4533d2                         xor        r10d, r10d
009b5 33ed                           xor        ebp, ebp
009b7 4533c0                         xor        r8d, r8d
009ba 4533db                         xor        r11d, r11d
009bd 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009c5 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009cc 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
009d4 44899c24f4000000               mov        dword ptr [rsp + 0xf4], r11d
009dc e943fdffff                     jmp        0x7f4eafe67ca4
009e1 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009e9 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
009f1 4d03c2                         add        r8, r10
009f4 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
009fc 4d3bc2                         cmp        r8, r10
009ff 7f29                           jg         0x7f4eafe67faa
00a01 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a06 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a0e 0f85b0120000                   jne        0x7f4eafe69244
00a14 418bc0                         mov        eax, r8d
00a17 4881c410010000                 add        rsp, 0x110
00a1e 5d                             pop        rbp
00a1f 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a23 0f87b9130000                   ja         0x7f4eafe69362
00a29 c3                             ret        
00a2a 48be40c92ae300000000           movabs     rsi, 0xe32ac940
00a34 666690                         nop        
00a37 e8a438a9ff                     call       0x7f4eaf8fb860
00a3c 0f1f8400340b0004               nop        dword ptr [rax + rax + 0x4000b34]
00a44 4885c0                         test       rax, rax
00a47 0f8463120000                   je         0x7f4eafe69230
00a4d 488bf0                         mov        rsi, rax
00a50 4881c410010000                 add        rsp, 0x110
00a57 5d                             pop        rbp
00a58 e983e2b5ff                     jmp        0x7f4eaf9c6260
00a5d 4533d2                         xor        r10d, r10d
00a60 4533db                         xor        r11d, r11d
00a63 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a68 e96bf7ffff                     jmp        0x7f4eafe67758
00a6d bee4ffffff                     mov        esi, 0xffffffe4
00a72 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a7a 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00a7f 44891c24                       mov        dword ptr [rsp], r11d
00a83 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00a88 4489442404                     mov        dword ptr [rsp + 4], r8d
00a8d 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00a92 44895c2408                     mov        dword ptr [rsp + 8], r11d
00a97 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00a9c 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00aa1 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00aa6 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00aab 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00ab0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00ab5 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00aba 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00abf 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00ac4 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00ac9 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ace 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ad3 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00ad8 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00add 894c2458                       mov        dword ptr [rsp + 0x58], ecx
00ae1 448954245c                     mov        dword ptr [rsp + 0x5c], r10d
00ae6 90                             nop        
00ae7 e8f4b5b5ff                     call       0x7f4eaf9c3660
00aec 0f1f8400e40b0005               nop        dword ptr [rax + rax + 0x5000be4]
00af4 bee4ffffff                     mov        esi, 0xffffffe4
00af9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b01 448b542408                     mov        r10d, dword ptr [rsp + 8]
00b06 44891424                       mov        dword ptr [rsp], r10d
00b0a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00b0f 44894c2404                     mov        dword ptr [rsp + 4], r9d
00b14 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00b19 4489542408                     mov        dword ptr [rsp + 8], r10d
00b1e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00b23 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00b28 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00b2d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00b32 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00b37 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00b3c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00b41 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00b46 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00b4b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00b50 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00b55 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00b5a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00b5f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00b64 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00b69 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00b6e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00b73 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00b78 44895c2460                     mov        dword ptr [rsp + 0x60], r11d
00b7d 4489442464                     mov        dword ptr [rsp + 0x64], r8d
00b82 90                             nop        
00b83 e858b5b5ff                     call       0x7f4eaf9c3660
00b88 0f1f8400800c0006               nop        dword ptr [rax + rax + 0x6000c80]
00b90 bee4ffffff                     mov        esi, 0xffffffe4
00b95 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b9d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ba2 44891c24                       mov        dword ptr [rsp], r11d
00ba6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00bab 4489442404                     mov        dword ptr [rsp + 4], r8d
00bb0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00bb5 44895c2408                     mov        dword ptr [rsp + 8], r11d
00bba 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00bbf 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00bc4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00bc9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00bce 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00bd3 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00bd8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00bdd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00be2 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00be7 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00bec 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00bf1 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00bf6 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00bfb 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c00 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00c05 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00c0a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00c0f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00c14 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00c19 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00c1e 44894c2468                     mov        dword ptr [rsp + 0x68], r9d
00c23 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
00c28 666690                         nop        
00c2b e8b0b4b5ff                     call       0x7f4eaf9c3660
00c30 0f1f8400280d0007               nop        dword ptr [rax + rax + 0x7000d28]
00c38 4533db                         xor        r11d, r11d
00c3b 4d3bcb                         cmp        r9, r11
00c3e bdffffffff                     mov        ebp, 0xffffffff
00c43 7c08                           jl         0x7f4eafe681cd
00c45 400f95c5                       setne      bpl
00c49 400fb6ed                       movzx      ebp, bpl
00c4d be45ffffff                     mov        esi, 0xffffff45
00c52 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00c5a 4c891c24                       mov        qword ptr [rsp], r11
00c5e 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
00c62 894c240c                       mov        dword ptr [rsp + 0xc], ecx
00c66 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00c6e 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00c73 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00c78 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00c7d 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
00c81 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
00c85 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00c8a 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00c8f 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
00c93 894c2434                       mov        dword ptr [rsp + 0x34], ecx
00c97 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00c9c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00ca1 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
00ca5 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
00ca9 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00cae 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00cb3 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
00cba 894c2444                       mov        dword ptr [rsp + 0x44], ecx
00cbe 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00cc3 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00cc8 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
00ccc 894c2454                       mov        dword ptr [rsp + 0x54], ecx
00cd0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00cd5 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00cda 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00cdf 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00ce4 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00cec 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00cf1 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00cf9 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00cfe 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00d06 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
00d0d 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00d15 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00d1d 6690                           nop        
00d1f e8bcb3b5ff                     call       0x7f4eaf9c3660
00d24 0f1f84001c0e0008               nop        dword ptr [rax + rax + 0x8000e1c]
00d2c be45ffffff                     mov        esi, 0xffffff45
00d31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00d39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00d3e 44891c24                       mov        dword ptr [rsp], r11d
00d42 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00d47 4489542404                     mov        dword ptr [rsp + 4], r10d
00d4c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00d51 44895c2408                     mov        dword ptr [rsp + 8], r11d
00d56 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00d5b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d60 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00d65 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00d6a 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00d6f 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00d74 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00d79 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00d7e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d83 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00d88 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00d8d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00d92 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00d97 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00d9c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00da1 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00da6 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00dab 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00db0 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00db5 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00dba 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00dbf 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00dc4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00dc9 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00dce 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00dd3 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00dd8 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00de0 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00de5 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00ded 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00df2 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
00dfa 90                             nop        
00dfb e8e0b2b5ff                     call       0x7f4eaf9c3660
00e00 0f1f8400f80e0009               nop        dword ptr [rax + rax + 0x9000ef8]
00e08 be45ffffff                     mov        esi, 0xffffff45
00e0d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e15 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e1a 44891c24                       mov        dword ptr [rsp], r11d
00e1e 44894c2408                     mov        dword ptr [rsp + 8], r9d
00e23 e8b8b2b5ff                     call       0x7f4eaf9c3660
00e28 0f1f8400200f000a               nop        dword ptr [rax + rax + 0xa000f20]
00e30 be45ffffff                     mov        esi, 0xffffff45
00e35 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e3d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e42 44891c24                       mov        dword ptr [rsp], r11d
00e46 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e4b 4489542404                     mov        dword ptr [rsp + 4], r10d
00e50 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e55 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e5a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e62 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e67 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e6c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e71 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e76 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e7b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e80 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e85 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00e8a 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00e8f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e94 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e99 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e9e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00ea3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00ea8 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ead 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00eb2 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00eb7 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00ebc 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00ec1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ec6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00ecb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ed0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ed5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00eda 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00edf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ee4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ee9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ef1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00ef6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00efe 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00f03 e8d8b1b5ff                     call       0x7f4eaf9c3660
00f08 0f1f84000010000b               nop        dword ptr [rax + rax + 0xb001000]
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
00f6f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f74 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f79 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f7e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f83 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f88 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f8d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00f92 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f97 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
00f9c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00fa1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00fa6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00fab 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00fb0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00fb5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00fba 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00fbf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fc4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fc9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fd1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fd6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fde 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fe3 448b9424d8000000               mov        r10d, dword ptr [rsp + 0xd8]
00feb 4489542478                     mov        dword ptr [rsp + 0x78], r10d
00ff0 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00ff8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01000 666690                         nop        
01003 e8d8b0b5ff                     call       0x7f4eaf9c3660
01008 0f1f84000011000c               nop        dword ptr [rax + rax + 0xc001100]
01010 be45ffffff                     mov        esi, 0xffffff45
01015 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0101d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01022 44891c24                       mov        dword ptr [rsp], r11d
01026 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0102b 4489542404                     mov        dword ptr [rsp + 4], r10d
01030 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01035 44895c2408                     mov        dword ptr [rsp + 8], r11d
0103a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01042 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01047 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0104c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01051 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01056 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0105b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01060 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01065 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0106a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0106f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01074 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01079 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0107e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01083 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01088 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0108d 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01092 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01097 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
0109c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
010a1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
010a6 4489542448                     mov        dword ptr [rsp + 0x48], r10d
010ab 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
010b0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
010b5 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
010ba 4489542450                     mov        dword ptr [rsp + 0x50], r10d
010bf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
010c4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
010c9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010d1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010d6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010de 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010e3 448b9c24d4000000               mov        r11d, dword ptr [rsp + 0xd4]
010eb 44895c2474                     mov        dword ptr [rsp + 0x74], r11d
010f0 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
010f8 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
010ff 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01107 e8d4afb5ff                     call       0x7f4eaf9c3660
0110c 0f1f84000412000d               nop        dword ptr [rax + rax + 0xd001204]
01114 be45ffffff                     mov        esi, 0xffffff45
01119 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01121 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01126 44891c24                       mov        dword ptr [rsp], r11d
0112a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0112f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01134 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01139 44895c2408                     mov        dword ptr [rsp + 8], r11d
0113e 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01143 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01148 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0114d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01152 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01157 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
0115c 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01161 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01166 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0116b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01170 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01175 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0117a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0117f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01184 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01189 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0118e 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
01193 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01198 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0119d 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
011a2 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
011a7 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
011ac 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
011b1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
011b6 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
011bb 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
011c0 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
011c8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
011cd 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
011d5 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
011da 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
011df 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
011e6 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
011ee 48899c2488000000               mov        qword ptr [rsp + 0x88], rbx
011f6 90                             nop        
011f7 e8e4aeb5ff                     call       0x7f4eaf9c3660
011fc 0f1f8400f412000e               nop        dword ptr [rax + rax + 0xe0012f4]
01204 41bbffffff7f                   mov        r11d, 0x7fffffff
0120a 4d3bcb                         cmp        r9, r11
0120d bdffffffff                     mov        ebp, 0xffffffff
01212 7c08                           jl         0x7f4eafe6879c
01214 400f95c5                       setne      bpl
01218 400fb6ed                       movzx      ebp, bpl
0121c be45ffffff                     mov        esi, 0xffffff45
01221 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
01229 4c891c24                       mov        qword ptr [rsp], r11
0122d 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01232 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01237 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0123f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01244 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
01248 894c2414                       mov        dword ptr [rsp + 0x14], ecx
0124c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01251 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01256 8b4c2434                       mov        ecx, dword ptr [rsp + 0x34]
0125a 894c2430                       mov        dword ptr [rsp + 0x30], ecx
0125e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01263 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01268 8b4c2448                       mov        ecx, dword ptr [rsp + 0x48]
0126c 894c2438                       mov        dword ptr [rsp + 0x38], ecx
01270 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01275 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0127a 8b4c2474                       mov        ecx, dword ptr [rsp + 0x74]
0127e 894c2440                       mov        dword ptr [rsp + 0x40], ecx
01282 448b9c24c0000000               mov        r11d, dword ptr [rsp + 0xc0]
0128a 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0128f 8b4c2460                       mov        ecx, dword ptr [rsp + 0x60]
01293 894c2450                       mov        dword ptr [rsp + 0x50], ecx
01297 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0129c 44895c2454                     mov        dword ptr [rsp + 0x54], r11d
012a1 8b4c2470                       mov        ecx, dword ptr [rsp + 0x70]
012a5 894c2458                       mov        dword ptr [rsp + 0x58], ecx
012a9 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
012ae 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012b3 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
012bb 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012c0 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012c8 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
012cd 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
012d5 89bc2488000000                 mov        dword ptr [rsp + 0x88], edi
012dc 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
012e4 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
012ec 666690                         nop        
012ef e8ecadb5ff                     call       0x7f4eaf9c3660
012f4 0f1f8400ec13000f               nop        dword ptr [rax + rax + 0xf0013ec]
012fc be45ffffff                     mov        esi, 0xffffff45
01301 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01309 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0130e 44890c24                       mov        dword ptr [rsp], r9d
01312 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01317 44894c2404                     mov        dword ptr [rsp + 4], r9d
0131c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01321 44895c2408                     mov        dword ptr [rsp + 8], r11d
01326 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0132b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01330 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01335 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0133a 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0133f 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01344 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01349 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0134e 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01353 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01358 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0135d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01362 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01367 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0136c 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01371 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01376 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
0137b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01380 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01385 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0138a 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0138f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01394 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01399 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0139e 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
013a3 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
013a8 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013b0 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013b5 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
013ba 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
013c2 90                             nop        
013c3 e818adb5ff                     call       0x7f4eaf9c3660
013c8 0f1f8400c0140010               nop        dword ptr [rax + rax + 0x100014c0]
013d0 be45ffffff                     mov        esi, 0xffffff45
013d5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
013dd 448b542408                     mov        r10d, dword ptr [rsp + 8]
013e2 44891424                       mov        dword ptr [rsp], r10d
013e6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
013eb 4489542404                     mov        dword ptr [rsp + 4], r10d
013f0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
013f5 44895c2408                     mov        dword ptr [rsp + 8], r11d
013fa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
013ff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01404 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01409 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0140e 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01413 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01418 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0141d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01422 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01427 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0142c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01431 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01436 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0143b 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01440 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01445 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0144a 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0144f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01454 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01459 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0145e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01463 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01468 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0146d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01472 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01477 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0147c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01484 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01489 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0148e 89bc2480000000                 mov        dword ptr [rsp + 0x80], edi
01495 6690                           nop        
01497 e844acb5ff                     call       0x7f4eaf9c3660
0149c 0f1f840094150011               nop        dword ptr [rax + rax + 0x11001594]
014a4 be3dffffff                     mov        esi, 0xffffff3d
014a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014b1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
014b6 44890c24                       mov        dword ptr [rsp], r9d
014ba 8b4c244c                       mov        ecx, dword ptr [rsp + 0x4c]
014be 894c2404                       mov        dword ptr [rsp + 4], ecx
014c2 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
014c6 894c2408                       mov        dword ptr [rsp + 8], ecx
014ca 4c8b4c2420                     mov        r9, qword ptr [rsp + 0x20]
014cf 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
014d4 8b4c243c                       mov        ecx, dword ptr [rsp + 0x3c]
014d8 894c240c                       mov        dword ptr [rsp + 0xc], ecx
014dc 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
014e1 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
014e6 8b4c2430                       mov        ecx, dword ptr [rsp + 0x30]
014ea 894c2424                       mov        dword ptr [rsp + 0x24], ecx
014ee 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
014f3 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
014f8 8b4c2438                       mov        ecx, dword ptr [rsp + 0x38]
014fc 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01500 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01505 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0150a 8b4c2468                       mov        ecx, dword ptr [rsp + 0x68]
0150e 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01512 448b4c2474                     mov        r9d, dword ptr [rsp + 0x74]
01517 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0151c 8b8c24c0000000                 mov        ecx, dword ptr [rsp + 0xc0]
01523 894c243c                       mov        dword ptr [rsp + 0x3c], ecx
01527 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0152c 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01531 8b4c2464                       mov        ecx, dword ptr [rsp + 0x64]
01535 894c244c                       mov        dword ptr [rsp + 0x4c], ecx
01539 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0153e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01543 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
01548 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
0154d 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
01555 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
0155a 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
01562 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
01567 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
0156c 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01574 89bc2490000000                 mov        dword ptr [rsp + 0x90], edi
0157b 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
01583 e858abb5ff                     call       0x7f4eaf9c3660
01588 0f1f840080160012               nop        dword ptr [rax + rax + 0x12001680]
01590 be45ffffff                     mov        esi, 0xffffff45
01595 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0159d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
015a2 44891c24                       mov        dword ptr [rsp], r11d
015a6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
015ab 44895c2404                     mov        dword ptr [rsp + 4], r11d
015b0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
015b5 4489542408                     mov        dword ptr [rsp + 8], r10d
015ba 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
015bf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
015c4 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
015c9 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
015ce 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
015d3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
015d8 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
015dd 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
015e2 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
015e7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
015ec 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
015f1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
015f6 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
015fb 4489542440                     mov        dword ptr [rsp + 0x40], r10d
01600 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01605 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
0160a 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
0160f 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
01614 895c2464                       mov        dword ptr [rsp + 0x64], ebx
01618 666690                         nop        
0161b e8c0aab5ff                     call       0x7f4eaf9c3660
01620 0f1f840018170013               nop        dword ptr [rax + rax + 0x13001718]
01628 be45ffffff                     mov        esi, 0xffffff45
0162d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01635 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0163a 44891c24                       mov        dword ptr [rsp], r11d
0163e 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01643 44895c2404                     mov        dword ptr [rsp + 4], r11d
01648 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
0164d 44895c2408                     mov        dword ptr [rsp + 8], r11d
01652 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01657 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0165c 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01661 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01666 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0166b 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01670 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01675 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0167a 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0167f 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01684 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01689 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0168e 894c2430                       mov        dword ptr [rsp + 0x30], ecx
01692 4489542454                     mov        dword ptr [rsp + 0x54], r10d
01697 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0169c 666690                         nop        
0169f e83caab5ff                     call       0x7f4eaf9c3660
016a4 0f1f84009c170014               nop        dword ptr [rax + rax + 0x1400179c]
016ac be45ffffff                     mov        esi, 0xffffff45
016b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
016b9 448b542408                     mov        r10d, dword ptr [rsp + 8]
016be 44891424                       mov        dword ptr [rsp], r10d
016c2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
016c7 44895c2404                     mov        dword ptr [rsp + 4], r11d
016cc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
016d1 44895c2408                     mov        dword ptr [rsp + 8], r11d
016d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
016de 4c89542410                     mov        qword ptr [rsp + 0x10], r10
016e3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
016e8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
016ed 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
016f2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
016f7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
016fc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01701 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01706 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0170b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01710 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01715 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0171a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0171f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01724 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01729 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0172e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01733 448b542474                     mov        r10d, dword ptr [rsp + 0x74]
01738 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0173d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01742 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01747 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0174c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01751 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01756 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0175b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01760 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01765 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0176d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01772 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0177a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0177f 4c89842490000000               mov        qword ptr [rsp + 0x90], r8
01787 44898c2498000000               mov        dword ptr [rsp + 0x98], r9d
0178f e84ca9b5ff                     call       0x7f4eaf9c3660
01794 0f1f84008c180015               nop        dword ptr [rax + rax + 0x1500188c]
0179c be45ffffff                     mov        esi, 0xffffff45
017a1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
017a9 448b542408                     mov        r10d, dword ptr [rsp + 8]
017ae 44891424                       mov        dword ptr [rsp], r10d
017b2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
017b7 44895c2404                     mov        dword ptr [rsp + 4], r11d
017bc 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
017c1 4489542408                     mov        dword ptr [rsp + 8], r10d
017c6 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
017cb 4c89542418                     mov        qword ptr [rsp + 0x18], r10
017d0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
017d5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
017da 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
017df 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
017e4 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
017e9 4489542424                     mov        dword ptr [rsp + 0x24], r10d
017ee 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
017f3 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
017f8 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
017fd 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01802 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01807 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0180c 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01811 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01816 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
0181b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01820 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01825 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0182a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0182f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01834 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01839 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0183e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01843 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01848 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01850 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01855 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0185d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01862 44898c248c000000               mov        dword ptr [rsp + 0x8c], r9d
0186a 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01871 4489842494000000               mov        dword ptr [rsp + 0x94], r8d
01879 6690                           nop        
0187b e860a8b5ff                     call       0x7f4eaf9c3660
01880 0f1f840078190016               nop        dword ptr [rax + rax + 0x16001978]
01888 4585db                         test       r11d, r11d
0188b 7f08                           jg         0x7f4eafe68e15
0188d 4533ed                         xor        r13d, r13d
01890 e92ae8ffff                     jmp        0x7f4eafe6763f
01895 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01899 4489742428                     mov        dword ptr [rsp + 0x28], r14d
0189e 897c241c                       mov        dword ptr [rsp + 0x1c], edi
018a2 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
018a7 89442414                       mov        dword ptr [rsp + 0x14], eax
018ab 894c2410                       mov        dword ptr [rsp + 0x10], ecx
018af 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018b4 48894424f8                     mov        qword ptr [rsp - 8], rax
018b9 8b0424                         mov        eax, dword ptr [rsp]
018bc 89442404                       mov        dword ptr [rsp + 4], eax
018c0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018c5 48894424f8                     mov        qword ptr [rsp - 8], rax
018ca 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
018d1 890424                         mov        dword ptr [rsp], eax
018d4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
018d9 488bee                         mov        rbp, rsi
018dc 8b542408                       mov        edx, dword ptr [rsp + 8]
018e0 418bcb                         mov        ecx, r11d
018e3 e8f829a9ff                     call       0x7f4eaf8fb860
018e8 0f1f8400e0190017               nop        dword ptr [rax + rax + 0x170019e0]
018f0 41bb40000000                   mov        r11d, 0x40
018f6 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
018fb c462a1f7e8                     shlx       r13, rax, r11
01900 48894424f8                     mov        qword ptr [rsp - 8], rax
01905 8b442404                       mov        eax, dword ptr [rsp + 4]
01909 890424                         mov        dword ptr [rsp], eax
0190c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01911 448b5c240c                     mov        r11d, dword ptr [rsp + 0xc]
01916 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0191a 8b442414                       mov        eax, dword ptr [rsp + 0x14]
0191e 448b4c2418                     mov        r9d, dword ptr [rsp + 0x18]
01923 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01927 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
0192c 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01930 e98ae7ffff                     jmp        0x7f4eafe6763f
01935 4585db                         test       r11d, r11d
01938 7f07                           jg         0x7f4eafe68ec1
0193a 33f6                           xor        esi, esi
0193c e9bfe7ffff                     jmp        0x7f4eafe67680
01941 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01946 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
0194b 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0194f 4489742428                     mov        dword ptr [rsp + 0x28], r14d
01954 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01958 44894c2418                     mov        dword ptr [rsp + 0x18], r9d
0195d 89442414                       mov        dword ptr [rsp + 0x14], eax
01961 894c2410                       mov        dword ptr [rsp + 0x10], ecx
01965 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0196a 48894424f8                     mov        qword ptr [rsp - 8], rax
0196f 8b0424                         mov        eax, dword ptr [rsp]
01972 89442404                       mov        dword ptr [rsp + 4], eax
01976 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0197b 48894424f8                     mov        qword ptr [rsp - 8], rax
01980 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01987 890424                         mov        dword ptr [rsp], eax
0198a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0198f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01997 488bf5                         mov        rsi, rbp
0199a 8b542408                       mov        edx, dword ptr [rsp + 8]
0199e 418bcb                         mov        ecx, r11d
019a1 6690                           nop        
019a3 e83829a9ff                     call       0x7f4eaf8fb860
019a8 0f1f8400a01a0018               nop        dword ptr [rax + rax + 0x18001aa0]
019b0 41bb80000000                   mov        r11d, 0x80
019b6 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
019bb c4e2a1f7f0                     shlx       rsi, rax, r11
019c0 48894424f8                     mov        qword ptr [rsp - 8], rax
019c5 8b442404                       mov        eax, dword ptr [rsp + 4]
019c9 890424                         mov        dword ptr [rsp], eax
019cc 488b4424f8                     mov        rax, qword ptr [rsp - 8]
019d1 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
019d5 8b442414                       mov        eax, dword ptr [rsp + 0x14]
019d9 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
019dd 448b742428                     mov        r14d, dword ptr [rsp + 0x28]
019e2 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
019e6 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
019eb 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
019f0 e90be7ffff                     jmp        0x7f4eafe67680
019f5 4533c0                         xor        r8d, r8d
019f8 e9ecefffff                     jmp        0x7f4eafe67f69
019fd bee4ffffff                     mov        esi, 0xffffffe4
01a02 48ffb42490000000               push       qword ptr [rsp + 0x90]
01a0a 488f0424                       pop        qword ptr [rsp]
01a0e 90                             nop        
01a0f e8cca6b5ff                     call       0x7f4eaf9c3660
01a14 0f1f84000c1b0019               nop        dword ptr [rax + rax + 0x19001b0c]
01a1c be5d000000                     mov        esi, 0x5d
01a21 6690                           nop        
01a23 e8b8a6b5ff                     call       0x7f4eaf9c3660
01a28 0f1f8400201b001a               nop        dword ptr [rax + rax + 0x1a001b20]
01a30 bef6ffffff                     mov        esi, 0xfffffff6
01a35 6690                           nop        
01a37 e8a4a6b5ff                     call       0x7f4eaf9c3660
01a3c 0f1f8400341b001b               nop        dword ptr [rax + rax + 0x1b001b34]
01a44 bef6ffffff                     mov        esi, 0xfffffff6
01a49 6690                           nop        
01a4b e890a6b5ff                     call       0x7f4eaf9c3660
01a50 0f1f8400481b001c               nop        dword ptr [rax + rax + 0x1c001b48]
01a58 be6effffff                     mov        esi, 0xffffff6e
01a5d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a65 448b542408                     mov        r10d, dword ptr [rsp + 8]
01a6a 44891424                       mov        dword ptr [rsp], r10d
01a6e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01a73 4489542408                     mov        dword ptr [rsp + 8], r10d
01a78 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a7d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a82 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a87 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a8c 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a91 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a96 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01a9b 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01aa0 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01aa5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01aaa 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01aaf 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ab4 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ab9 6690                           nop        
01abb e820a6b5ff                     call       0x7f4eaf9c3660
01ac0 0f1f8400b81b001d               nop        dword ptr [rax + rax + 0x1d001bb8]
01ac8 bee4ffffff                     mov        esi, 0xffffffe4
01acd 48ffb42490000000               push       qword ptr [rsp + 0x90]
01ad5 488f0424                       pop        qword ptr [rsp]
01ad9 89442418                       mov        dword ptr [rsp + 0x18], eax
01add 48894424f8                     mov        qword ptr [rsp - 8], rax
01ae2 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01ae9 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01aed 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01af2 897c2428                       mov        dword ptr [rsp + 0x28], edi
01af6 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01afa 90                             nop        
01afb e8e0a5b5ff                     call       0x7f4eaf9c3660
01b00 0f1f8400f81b001e               nop        dword ptr [rax + rax + 0x1e001bf8]
01b08 bee4ffffff                     mov        esi, 0xffffffe4
01b0d 48ffb42490000000               push       qword ptr [rsp + 0x90]
01b15 488f0424                       pop        qword ptr [rsp]
01b19 48894424f8                     mov        qword ptr [rsp - 8], rax
01b1e 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01b25 89442418                       mov        dword ptr [rsp + 0x18], eax
01b29 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b2e 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01b32 89542428                       mov        dword ptr [rsp + 0x28], edx
01b36 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01b3b 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01b40 666690                         nop        
01b43 e898a5b5ff                     call       0x7f4eaf9c3660
01b48 0f1f8400401c001f               nop        dword ptr [rax + rax + 0x1f001c40]
01b50 bebeffffff                     mov        esi, 0xffffffbe
01b55 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b5d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01b62 44891424                       mov        dword ptr [rsp], r10d
01b66 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b6b 4489542408                     mov        dword ptr [rsp + 8], r10d
01b70 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b75 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b7a 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01b7f 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01b84 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01b89 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01b8e 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01b93 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01b98 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01b9d 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01ba2 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01ba7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01bac 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01bb1 6690                           nop        
01bb3 e828a5b5ff                     call       0x7f4eaf9c3660
01bb8 0f1f8400b01c0020               nop        dword ptr [rax + rax + 0x20001cb0]
01bc0 beccffffff                     mov        esi, 0xffffffcc
01bc5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01bcd 448b542408                     mov        r10d, dword ptr [rsp + 8]
01bd2 44891424                       mov        dword ptr [rsp], r10d
01bd6 89442410                       mov        dword ptr [rsp + 0x10], eax
01bda 48894424f8                     mov        qword ptr [rsp - 8], rax
01bdf 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01be6 89442414                       mov        dword ptr [rsp + 0x14], eax
01bea 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bef 897c2418                       mov        dword ptr [rsp + 0x18], edi
01bf3 8954241c                       mov        dword ptr [rsp + 0x1c], edx
01bf7 894c242c                       mov        dword ptr [rsp + 0x2c], ecx
01bfb e8e0a4b5ff                     call       0x7f4eaf9c3660
01c00 0f1f8400f81c0021               nop        dword ptr [rax + rax + 0x21001cf8]
01c08 beccffffff                     mov        esi, 0xffffffcc
01c0d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c15 448b442408                     mov        r8d, dword ptr [rsp + 8]
01c1a 44890424                       mov        dword ptr [rsp], r8d
01c1e 48894424f8                     mov        qword ptr [rsp - 8], rax
01c23 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c2a 89442410                       mov        dword ptr [rsp + 0x10], eax
01c2e 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c33 897c2414                       mov        dword ptr [rsp + 0x14], edi
01c37 89542418                       mov        dword ptr [rsp + 0x18], edx
01c3b 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
01c40 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c45 894c2434                       mov        dword ptr [rsp + 0x34], ecx
01c49 6690                           nop        
01c4b e890a4b5ff                     call       0x7f4eaf9c3660
01c50 0f1f8400481d0022               nop        dword ptr [rax + rax + 0x22001d48]
01c58 be45ffffff                     mov        esi, 0xffffff45
01c5d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01c62 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01c67 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01c6c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c71 6690                           nop        
01c73 e868a4b5ff                     call       0x7f4eaf9c3660
01c78 0f1f8400701d0023               nop        dword ptr [rax + rax + 0x23001d70]
01c80 be45ffffff                     mov        esi, 0xffffff45
01c85 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01c8a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01c8f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01c94 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01c99 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01c9e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01ca3 e838a4b5ff                     call       0x7f4eaf9c3660
01ca8 0f1f8400a01d0024               nop        dword ptr [rax + rax + 0x24001da0]
01cb0 bef6ffffff                     mov        esi, 0xfffffff6
01cb5 6690                           nop        
01cb7 e824a4b5ff                     call       0x7f4eaf9c3660
01cbc 0f1f8400b41d0025               nop        dword ptr [rax + rax + 0x25001db4]
01cc4 be5d000000                     mov        esi, 0x5d
01cc9 6690                           nop        
01ccb e810a4b5ff                     call       0x7f4eaf9c3660
01cd0 0f1f8400c81d0026               nop        dword ptr [rax + rax + 0x26001dc8]
01cd8 be45ffffff                     mov        esi, 0xffffff45
01cdd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01ce5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01cea 44891c24                       mov        dword ptr [rsp], r11d
01cee 90                             nop        
01cef e8eca3b5ff                     call       0x7f4eaf9c3660
01cf4 0f1f8400ec1d0027               nop        dword ptr [rax + rax + 0x27001dec]
01cfc bef6ffffff                     mov        esi, 0xfffffff6
01d01 418bea                         mov        ebp, r10d
01d04 666690                         nop        
01d07 e8d4a3b5ff                     call       0x7f4eaf9c3660
01d0c 0f1f8400041e0028               nop        dword ptr [rax + rax + 0x28001e04]
01d14 bef6ffffff                     mov        esi, 0xfffffff6
01d19 418be8                         mov        ebp, r8d
01d1c 666690                         nop        
01d1f e8bca3b5ff                     call       0x7f4eaf9c3660
01d24 0f1f84001c1e0029               nop        dword ptr [rax + rax + 0x29001e1c]
01d2c bef6ffffff                     mov        esi, 0xfffffff6
01d31 418bea                         mov        ebp, r10d
01d34 666690                         nop        
01d37 e8a4a3b5ff                     call       0x7f4eaf9c3660
01d3c 0f1f8400341e002a               nop        dword ptr [rax + rax + 0x2a001e34]
01d44 bef6ffffff                     mov        esi, 0xfffffff6
01d49 6690                           nop        
01d4b e890a3b5ff                     call       0x7f4eaf9c3660
01d50 0f1f8400481e002b               nop        dword ptr [rax + rax + 0x2b001e48]
01d58 bef6ffffff                     mov        esi, 0xfffffff6
01d5d 6690                           nop        
01d5f e87ca3b5ff                     call       0x7f4eaf9c3660
01d64 0f1f84005c1e002c               nop        dword ptr [rax + rax + 0x2c001e5c]
01d6c bef6ffffff                     mov        esi, 0xfffffff6
01d71 6690                           nop        
01d73 e868a3b5ff                     call       0x7f4eaf9c3660
01d78 0f1f8400701e002d               nop        dword ptr [rax + rax + 0x2d001e70]
01d80 bef6ffffff                     mov        esi, 0xfffffff6
01d85 6690                           nop        
01d87 e854a3b5ff                     call       0x7f4eaf9c3660
01d8c 0f1f8400841e002e               nop        dword ptr [rax + rax + 0x2e001e84]
01d94 bef6ffffff                     mov        esi, 0xfffffff6
01d99 6690                           nop        
01d9b e840a3b5ff                     call       0x7f4eaf9c3660
01da0 0f1f8400981e002f               nop        dword ptr [rax + rax + 0x2f001e98]
01da8 bef6ffffff                     mov        esi, 0xfffffff6
01dad 6690                           nop        
01daf e82ca3b5ff                     call       0x7f4eaf9c3660
01db4 0f1f8400ac1e0030               nop        dword ptr [rax + rax + 0x30001eac]
01dbc bef6ffffff                     mov        esi, 0xfffffff6
01dc1 6690                           nop        
01dc3 e818a3b5ff                     call       0x7f4eaf9c3660
01dc8 0f1f8400c01e0031               nop        dword ptr [rax + rax + 0x31001ec0]
01dd0 eb08                           jmp        0x7f4eafe6935a
01dd2 eb06                           jmp        0x7f4eafe6935a
01dd4 eb04                           jmp        0x7f4eafe6935a
01dd6 eb02                           jmp        0x7f4eafe6935a
01dd8 eb00                           jmp        0x7f4eafe6935a
01dda 488bf0                         mov        rsi, rax
01ddd e96eecffff                     jmp        0x7f4eafe67fd0
01de2 49ba9f7fe6af4e7f0000           movabs     r10, 0x7f4eafe67f9f
01dec 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
01df3 e9684ba9ff                     jmp        0x7f4eaf8fdee0
01df8 e82317a8ff                     call       0x7f4eaf8eaaa0
01dfd e91ce2ffff                     jmp        0x7f4eafe6759e
01e02 f4                             hlt        
01e03 f4                             hlt        
01e04 f4                             hlt        
01e05 f4                             hlt        
01e06 f4                             hlt        
01e07 f4                             hlt        
