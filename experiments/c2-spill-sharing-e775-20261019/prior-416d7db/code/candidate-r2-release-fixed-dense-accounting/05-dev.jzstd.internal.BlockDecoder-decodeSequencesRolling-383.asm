00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f851e210000                   jne        0x7fa87be74bbc
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
00050 0f83cd1b0000                   jae        0x7fa87be746a3
00056 0fb65c160b                     movzx      ebx, byte ptr [rsi + rdx + 0xb]
0005b 85db                           test       ebx, ebx
0005d 0f84e11b0000                   je         0x7fa87be746c4
00063 448bca                         mov        r9d, edx
00066 442bc9                         sub        r9d, ecx
00069 448b1424                       mov        r10d, dword ptr [rsp]
0006d 4183c2f9                       add        r10d, -7
00071 448d42f8                       lea        r8d, [rdx - 8]
00075 428d0ccd00000000               lea        ecx, [r9*8]
0007d f30fbddb                       lzcnt      ebx, ebx
00081 41bd1f000000                   mov        r13d, 0x1f
00087 442beb                         sub        r13d, ebx
0008a bb08000000                     mov        ebx, 8
0008f 412bdd                         sub        ebx, r13d
00092 8bd1                           mov        edx, ecx
00094 2bd3                           sub        edx, ebx
00096 4183f908                       cmp        r9d, 8
0009a 0f8c081a0000                   jl         0x7fa87be74528
000a0 4585d2                         test       r10d, r10d
000a3 0f8c771d0000                   jl         0x7fa87be748a0
000a9 8b2c24                         mov        ebp, dword ptr [rsp]
000ac 83c5f9                         add        ebp, -7
000af 443bc5                         cmp        r8d, ebp
000b2 0f83541c0000                   jae        0x7fa87be7478c
000b8 458bd8                         mov        r11d, r8d
000bb 4a8b441e0c                     mov        rax, qword ptr [rsi + r11 + 0xc]
000c0 4183c1f8                       add        r9d, -8
000c4 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
000cc 4183c3f0                       add        r11d, -0x10
000d0 4183f908                       cmp        r9d, 8
000d4 0f8c7c1a0000                   jl         0x7fa87be745d6
000da 4585d2                         test       r10d, r10d
000dd 0f8c911d0000                   jl         0x7fa87be748f4
000e3 8b2c24                         mov        ebp, dword ptr [rsp]
000e6 83c5f9                         add        ebp, -7
000e9 443bdd                         cmp        r11d, ebp
000ec 0f835a1c0000                   jae        0x7fa87be747cc
000f2 418bcb                         mov        ecx, r11d
000f5 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
000fd 4d8b74090c                     mov        r14, qword ptr [r9 + rcx + 0xc]
00102 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
00107 8b4d1c                         mov        ecx, dword ptr [rbp + 0x1c]
0010a 85c9                           test       ecx, ecx
0010c 0f84461b0000                   je         0x7fa87be746d8
00112 448b4d20                       mov        r9d, dword ptr [rbp + 0x20]
00116 418b7908                       mov        edi, dword ptr [r9 + 8]
0011a 8b7524                         mov        esi, dword ptr [rbp + 0x24]
0011d 85f6                           test       esi, esi
0011f 0f84471b0000                   je         0x7fa87be746ec
00125 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0012a 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
00132 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00137 4889442428                     mov        qword ptr [rsp + 0x28], rax
0013c 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00143 44896c240c                     mov        dword ptr [rsp + 0xc], r13d
00148 895c2424                       mov        dword ptr [rsp + 0x24], ebx
0014c 4489442410                     mov        dword ptr [rsp + 0x10], r8d
00151 4489542404                     mov        dword ptr [rsp + 4], r10d
00156 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
0015e 037908                         add        edi, dword ptr [rcx + 8]
00161 894c2430                       mov        dword ptr [rsp + 0x30], ecx
00165 037e08                         add        edi, dword ptr [rsi + 8]
00168 89742438                       mov        dword ptr [rsp + 0x38], esi
0016c 897c241c                       mov        dword ptr [rsp + 0x1c], edi
00170 4c8bd6                         mov        r10, rsi
00173 4c89542440                     mov        qword ptr [rsp + 0x40], r10
00178 4c8bd1                         mov        r10, rcx
0017b 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00180 4d8bd1                         mov        r10, r9
00183 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00188 85ff                           test       edi, edi
0018a 0f84e1080000                   je         0x7fa87be734f1
00190 be40000000                     mov        esi, 0x40
00195 2bf3                           sub        esi, ebx
00197 3bfe                           cmp        edi, esi
00199 0f8ff5010000                   jg         0x7fa87be72e14
0019f 2bf7                           sub        esi, edi
001a1 c462cbf7c0                     shrx       r8, rax, rsi
001a6 83ff40                         cmp        edi, 0x40
001a9 0f8d491e0000                   jge        0x7fa87be74a78
001af 41bb01000000                   mov        r11d, 1
001b5 c4c2c1f7eb                     shlx       rbp, r11, rdi
001ba 48ffcd                         dec        rbp
001bd 4923e8                         and        rbp, r8
001c0 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001c5 448bd7                         mov        r10d, edi
001c8 458bca                         mov        r9d, r10d
001cb 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001d0 458d5908                       lea        r11d, [r9 + 8]
001d4 4183fb40                       cmp        r11d, 0x40
001d8 7c35                           jl         0x7fa87be72c8f
001da 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001df 4183c1c8                       add        r9d, -0x38
001e3 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001e8 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f0 8b542408                       mov        edx, dword ptr [rsp + 8]
001f4 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
001f8 666690                         nop        
001fb e8e0dba9ff                     call       0x7fa87b910860
00200 0f1f8400f8020000               nop        dword ptr [rax + rax + 0x2f8]
00208 4889442420                     mov        qword ptr [rsp + 0x20], rax
0020d eb31                           jmp        0x7fa87be72cc0
0020f 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00214 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0021c 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00221 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
00226 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
0022e 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00236 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0023b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00240 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00245 458b4208                       mov        r8d, dword ptr [r10 + 8]
00249 4183f820                       cmp        r8d, 0x20
0024d 0f8d7d1c0000                   jge        0x7fa87be74950
00253 c462bbf74c2460                 shrx       r9, qword ptr [rsp + 0x60], r8
0025a 41bb01000000                   mov        r11d, 1
00260 c44239f7db                     shlx       r11d, r11d, r8d
00265 41ffcb                         dec        r11d
00268 4d63d3                         movsxd     r10, r11d
0026b 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00270 458bda                         mov        r11d, r10d
00273 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
00278 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0027d 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00281 418bcb                         mov        ecx, r11d
00284 4183fb20                       cmp        r11d, 0x20
00288 0f8dba1c0000                   jge        0x7fa87be749c8
0028e 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00296 458b5228                       mov        r10d, dword ptr [r10 + 0x28]
0029a 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002a2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002a7 458b5a18                       mov        r11d, dword ptr [r10 + 0x18]
002ab 418b5b08                       mov        ebx, dword ptr [r11 + 8]
002af 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002b4 458b5318                       mov        r10d, dword ptr [r11 + 0x18]
002b8 418b7a08                       mov        edi, dword ptr [r10 + 8]
002bc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002c1 458b5a18                       mov        r11d, dword ptr [r10 + 0x18]
002c5 458b5308                       mov        r10d, dword ptr [r11 + 8]
002c9 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002ce 4585db                         test       r11d, r11d
002d1 0f8e44190000                   jle        0x7fa87be7469b
002d7 ffcb                           dec        ebx
002d9 895c2460                       mov        dword ptr [rsp + 0x60], ebx
002dd ffcf                           dec        edi
002df 897c2464                       mov        dword ptr [rsp + 0x64], edi
002e3 41ffca                         dec        r10d
002e6 4489542468                     mov        dword ptr [rsp + 0x68], r10d
002eb c442f3f7d1                     shrx       r10, r9, rcx
002f0 41b801000000                   mov        r8d, 1
002f6 c44271f7d8                     shlx       r11d, r8d, ecx
002fb 458bc2                         mov        r8d, r10d
002fe 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00303 41ffcb                         dec        r11d
00306 4d63d3                         movsxd     r10, r11d
00309 4d23d1                         and        r10, r9
0030c 458bd2                         mov        r10d, r10d
0030f 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00314 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0031c 458b9af8000000                 mov        r11d, dword ptr [r10 + 0xf8]
00323 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0032b 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
00332 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0033a 458b5a08                       mov        r11d, dword ptr [r10 + 8]
0033e 4585db                         test       r11d, r11d
00341 0f8639190000                   jbe        0x7fa87be74700
00347 4d63d3                         movsxd     r10, r11d
0034a 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
0034f 49ffcb                         dec        r11
00352 4d3bda                         cmp        r11, r10
00355 0f8325190000                   jae        0x7fa87be74700
0035b 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00360 4585db                         test       r11d, r11d
00363 0f8c2b1a0000                   jl         0x7fa87be74814
00369 448b1424                       mov        r10d, dword ptr [rsp]
0036d 4183c2f9                       add        r10d, -7
00371 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
00379 4533d2                         xor        r10d, r10d
0037c 4533db                         xor        r11d, r11d
0037f 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
00387 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
0038f e983020000                     jmp        0x7fa87be73097
00394 8bef                           mov        ebp, edi
00396 2bee                           sub        ebp, esi
00398 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
003a0 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
003a5 6690                           nop        
003a7 e834daa9ff                     call       0x7fa87b910860
003ac 0f1f8400a4040001               nop        dword ptr [rax + rax + 0x10004a4]
003b4 4823442428                     and        rax, qword ptr [rsp + 0x28]
003b9 41ba40000000                   mov        r10d, 0x40
003bf 442bd5                         sub        r10d, ebp
003c2 c462d1f7d8                     shlx       r11, rax, rbp
003c7 c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d1 4d0bda                         or         r11, r10
003d4 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003d9 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003de e9e5fdffff                     jmp        0x7fa87be72c48
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
0041a 0f8de40a0000                   jge        0x7fa87be73984
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bc2                         mov        r8d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d910b0000                   jge        0x7fa87be73a64
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bda                         mov        ebx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8d6b0c0000                   jge        0x7fa87be73b64
00479 c4e2d3f7cf                     shrx       rcx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8d3a0d0000                   jge        0x7fa87be73c5c
004a2 41bb01000000                   mov        r11d, 1
004a8 c442d1f7cb                     shlx       r9, r11, rbp
004ad 49ffc9                         dec        r9
004b0 4c23c9                         and        r9, rcx
004b3 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
004bb 418bcb                         mov        ecx, r11d
004be 4103ca                         add        ecx, r10d
004c1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c6 458bd2                         mov        r10d, r10d
004c9 4403d3                         add        r10d, ebx
004cc 4c63d9                         movsxd     r11, ecx
004cf 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
004d7 8bdb                           mov        ebx, ebx
004d9 4c03cb                         add        r9, rbx
004dc 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
004e4 4903db                         add        rbx, r11
004e7 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
004ef 4d85c9                         test       r9, r9
004f2 0f8ed8070000                   jle        0x7fa87be73750
004f8 4981f9ffffff7f                 cmp        r9, 0x7fffffff
004ff 0f8f030e0000                   jg         0x7fa87be73d88
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8fee0e0000                   jg         0x7fa87be73e80
00512 81f9ffff0300                   cmp        ecx, 0x3ffff
00518 0f8fe20f0000                   jg         0x7fa87be73f80
0051e 418bd9                         mov        ebx, r9d
00521 81fb00000010                   cmp        ebx, 0x10000000
00527 0f83cf100000                   jae        0x7fa87be7407c
0052d 4d63d2                         movsxd     r10, r10d
00530 4863cb                         movsxd     rcx, ebx
00533 49c1e312                       shl        r11, 0x12
00537 48c1e124                       shl        rcx, 0x24
0053b 490bcb                         or         rcx, r11
0053e 490bca                         or         rcx, r10
00541 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00549 448b8c24dc000000               mov        r9d, dword ptr [rsp + 0xdc]
00551 4b894cca10                     mov        qword ptr [r10 + r9*8 + 0x10], rcx
00556 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
0055a 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0055e 0f8da2000000                   jge        0x7fa87be73086
00564 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0056c 49c1ea30                       shr        r10, 0x30
00570 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00575 49c1eb30                       shr        r11, 0x30
00579 418bca                         mov        ecx, r10d
0057c 458bd3                         mov        r10d, r11d
0057f 448b9c24cc000000               mov        r11d, dword ptr [rsp + 0xcc]
00587 c44223f7c8                     shrx       r9d, r8d, r11d
0058c 44039c24c8000000               add        r11d, dword ptr [rsp + 0xc8]
00594 c4c223f7d8                     shrx       ebx, r8d, r11d
00599 4403d3                         add        r10d, ebx
0059c 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
005a1 448b9c24c8000000               mov        r11d, dword ptr [rsp + 0xc8]
005a9 4183fb20                       cmp        r11d, 0x20
005ad 0f8d91110000                   jge        0x7fa87be741c4
005b3 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005bb 49c1ea30                       shr        r10, 0x30
005bf 418bda                         mov        ebx, r10d
005c2 41ba01000000                   mov        r10d, 1
005c8 c44221f7da                     shlx       r11d, r10d, r11d
005cd 41ffcb                         dec        r11d
005d0 4523d9                         and        r11d, r9d
005d3 4403d9                         add        r11d, ecx
005d6 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
005db 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005e3 4183fa20                       cmp        r10d, 0x20
005e7 0f8d0f120000                   jge        0x7fa87be7427c
005ed 41bb01000000                   mov        r11d, 1
005f3 c44229f7d3                     shlx       r10d, r11d, r10d
005f8 41ffca                         dec        r10d
005fb 4523d0                         and        r10d, r8d
005fe 4403d3                         add        r10d, ebx
00601 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00606 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0060a 0f8de7030000                   jge        0x7fa87be73477
00610 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
00617 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0061c 44235c246c                     and        r11d, dword ptr [rsp + 0x6c]
00621 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00626 418b5818                       mov        ebx, dword ptr [r8 + 0x18]
0062a 448b4308                       mov        r8d, dword ptr [rbx + 8]
0062e 453bd8                         cmp        r11d, r8d
00631 0f834a040000                   jae        0x7fa87be73501
00637 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
0063c 4423542470                     and        r10d, dword ptr [rsp + 0x70]
00641 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00646 458b4818                       mov        r9d, dword ptr [r8 + 0x18]
0064a 458b4108                       mov        r8d, dword ptr [r9 + 8]
0064e 4e8b5cdb10                     mov        r11, qword ptr [rbx + r11*8 + 0x10]
00653 4c895c2478                     mov        qword ptr [rsp + 0x78], r11
00658 453bd0                         cmp        r10d, r8d
0065b 0f83db040000                   jae        0x7fa87be735bc
00661 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00666 44235c2448                     and        r11d, dword ptr [rsp + 0x48]
0066b 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00670 458b4018                       mov        r8d, dword ptr [r8 + 0x18]
00674 418b5808                       mov        ebx, dword ptr [r8 + 8]
00678 4f8b54d110                     mov        r10, qword ptr [r9 + r10*8 + 0x10]
0067d 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
00685 443bdb                         cmp        r11d, ebx
00688 0f8372050000                   jae        0x7fa87be73680
0068e 4f8b54d810                     mov        r10, qword ptr [r8 + r11*8 + 0x10]
00693 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
0069b 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006a2 ffc5                           inc        ebp
006a4 896c2404                       mov        dword ptr [rsp + 4], ebp
006a8 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006ac 0f8d14030000                   jge        0x7fa87be73446
006b2 49c1ea28                       shr        r10, 0x28
006b6 458bda                         mov        r11d, r10d
006b9 450fb6d3                       movzx      r10d, r11b
006bd 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006c5 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006ca 49c1ea28                       shr        r10, 0x28
006ce 458bd2                         mov        r10d, r10d
006d1 410fb6ea                       movzx      ebp, r10b
006d5 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006dc 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006e4 49c1ea28                       shr        r10, 0x28
006e8 458bda                         mov        r11d, r10d
006eb 450fb6db                       movzx      r11d, r11b
006ef 44899c24cc000000               mov        dword ptr [rsp + 0xcc], r11d
006f7 4103eb                         add        ebp, r11d
006fa 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00701 41bb01000000                   mov        r11d, 1
00707 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
0070f 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00717 49c1ea20                       shr        r10, 0x20
0071b 458bda                         mov        r11d, r10d
0071e 410fb6eb                       movzx      ebp, r11b
00722 896c2474                       mov        dword ptr [rsp + 0x74], ebp
00726 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0072b 49c1ea20                       shr        r10, 0x20
0072f 458bd2                         mov        r10d, r10d
00732 410fb6ea                       movzx      ebp, r10b
00736 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
0073d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00745 49c1ea20                       shr        r10, 0x20
00749 458bda                         mov        r11d, r10d
0074c 410fb6eb                       movzx      ebp, r11b
00750 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
00757 448bc5                         mov        r8d, ebp
0075a 4403442474                     add        r8d, dword ptr [rsp + 0x74]
0075f 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
00767 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
0076f 4585c0                         test       r8d, r8d
00772 0f844c060000                   je         0x7fa87be73844
00778 4183f83f                       cmp        r8d, 0x3f
0077c 0f8f5a070000                   jg         0x7fa87be7395c
00782 b940000000                     mov        ecx, 0x40
00787 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
0078b 443bc1                         cmp        r8d, ecx
0078e 7e47                           jle        0x7fa87be73257
00790 458bc8                         mov        r9d, r8d
00793 442bc9                         sub        r9d, ecx
00796 83f940                         cmp        ecx, 0x40
00799 0f8d1d120000                   jge        0x7fa87be7443c
0079f 41ba01000000                   mov        r10d, 1
007a5 c442f1f7d2                     shlx       r10, r10, rcx
007aa 49ffca                         dec        r10
007ad 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007b5 c4c2b1f7ea                     shlx       rbp, r10, r9
007ba 41bb40000000                   mov        r11d, 0x40
007c0 452bd9                         sub        r11d, r9d
007c3 c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007ca 490bea                         or         rbp, r10
007cd 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007d5 eb30                           jmp        0x7fa87be73287
007d7 412bc8                         sub        ecx, r8d
007da c462f3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rcx
007e4 4183f840                       cmp        r8d, 0x40
007e8 0f8dbe100000                   jge        0x7fa87be7432c
007ee 41ba01000000                   mov        r10d, 1
007f4 c4c2b9f7ea                     shlx       rbp, r10, r8
007f9 48ffcd                         dec        rbp
007fc 4923e9                         and        rbp, r9
007ff 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
00807 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0080c 4503d0                         add        r10d, r8d
0080f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00814 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00819 4503d8                         add        r11d, r8d
0081c 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00821 4183fa40                       cmp        r10d, 0x40
00825 0f8ce5fbffff                   jl         0x7fa87be72e90
0082b 4183c2c0                       add        r10d, -0x40
0082f 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
00834 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00838 83c5f8                         add        ebp, -8
0083b 896c240c                       mov        dword ptr [rsp + 0xc], ebp
0083f 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
00843 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
00847 83c1f0                         add        ecx, -0x10
0084a 83f908                         cmp        ecx, 8
0084d 0f8c1d010000                   jl         0x7fa87be733f0
00853 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00858 4183c0e8                       add        r8d, -0x18
0085c 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
00864 0f8279fbffff                   jb         0x7fa87be72e63
0086a bee4ffffff                     mov        esi, 0xffffffe4
0086f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00877 448b542408                     mov        r10d, dword ptr [rsp + 8]
0087c 44891424                       mov        dword ptr [rsp], r10d
00880 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00885 4489542404                     mov        dword ptr [rsp + 4], r10d
0088a 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
0088f 4489542408                     mov        dword ptr [rsp + 8], r10d
00894 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00899 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0089e 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
008a3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008a8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008ad 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008b2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008b7 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008bc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008c1 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008c6 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008cb 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008d0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008d5 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008da 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008df 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008e4 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
008e9 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008ee 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008f3 4489542440                     mov        dword ptr [rsp + 0x40], r10d
008f8 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
008fd 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00902 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00907 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0090c 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00911 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00916 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0091e 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00923 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0092b 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00930 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00935 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0093a 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00942 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0094a 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00952 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0095a 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00962 90                             nop        
00963 e87849b6ff                     call       0x7fa87b9d7d60
00968 0f1f8400600a0002               nop        dword ptr [rax + rax + 0x2000a60]
00970 85c9                           test       ecx, ecx
00972 7f08                           jg         0x7fa87be733fc
00974 4533d2                         xor        r10d, r10d
00977 e974faffff                     jmp        0x7fa87be72e70
0097c 890c24                         mov        dword ptr [rsp], ecx
0097f 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
00987 8b542408                       mov        edx, dword ptr [rsp + 8]
0098b 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
00992 90                             nop        
00993 e848d4a9ff                     call       0x7fa87b910860
00998 0f1f8400900a0003               nop        dword ptr [rax + rax + 0x3000a90]
009a0 448b542408                     mov        r10d, dword ptr [rsp + 8]
009a5 41c1e203                       shl        r10d, 3
009a9 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
009ae 41c1e003                       shl        r8d, 3
009b2 452bd0                         sub        r10d, r8d
009b5 4181c2c0000000                 add        r10d, 0xc0
009bc c462a9f7d0                     shlx       r10, rax, r10
009c1 e92afaffff                     jmp        0x7fa87be72e70
009c6 4533d2                         xor        r10d, r10d
009c9 4533db                         xor        r11d, r11d
009cc 4533c9                         xor        r9d, r9d
009cf 4533c0                         xor        r8d, r8d
009d2 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009da 44899c24d0000000               mov        dword ptr [rsp + 0xd0], r11d
009e2 44898c24cc000000               mov        dword ptr [rsp + 0xcc], r9d
009ea 44898424f0000000               mov        dword ptr [rsp + 0xf0], r8d
009f2 e918fdffff                     jmp        0x7fa87be7318f
009f7 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
009ff 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a07 4d03c2                         add        r8, r10
00a0a 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a12 4d3bc2                         cmp        r8, r10
00a15 7f29                           jg         0x7fa87be734c0
00a17 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a1c 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a24 0f85ba150000                   jne        0x7fa87be74a64
00a2a 418bc0                         mov        eax, r8d
00a2d 4881c410010000                 add        rsp, 0x110
00a34 5d                             pop        rbp
00a35 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a39 0f87e7160000                   ja         0x7fa87be74ba6
00a3f c3                             ret        
00a40 48bea8367ce200000000           movabs     rsi, 0xe27c36a8
00a4a 90                             nop        
00a4b e890d3a9ff                     call       0x7fa87b910860
00a50 0f1f8400480b0004               nop        dword ptr [rax + rax + 0x4000b48]
00a58 4885c0                         test       rax, rax
00a5b 0f846f150000                   je         0x7fa87be74a50
00a61 488bf0                         mov        rsi, rax
00a64 4881c410010000                 add        rsp, 0x110
00a6b 5d                             pop        rbp
00a6c e96f71b6ff                     jmp        0x7fa87b9da660
00a71 4533d2                         xor        r10d, r10d
00a74 4533db                         xor        r11d, r11d
00a77 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a7c e947f7ffff                     jmp        0x7fa87be72c48
00a81 bee4ffffff                     mov        esi, 0xffffffe4
00a86 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a8e 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a93 44891424                       mov        dword ptr [rsp], r10d
00a97 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00a9c 4489442404                     mov        dword ptr [rsp + 4], r8d
00aa1 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00aa6 4489542408                     mov        dword ptr [rsp + 8], r10d
00aab 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ab0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ab5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00aba 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00abf 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ac4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ac9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
00ace 4489442424                     mov        dword ptr [rsp + 0x24], r8d
00ad3 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ad8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00add 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
00ae2 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
00ae7 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00aec 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00af1 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
00af6 4489442434                     mov        dword ptr [rsp + 0x34], r8d
00afb 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00b00 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b05 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b0a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b0f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
00b14 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
00b19 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00b1e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00b23 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00b27 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
00b2c 666690                         nop        
00b2f e8ac47b6ff                     call       0x7fa87b9d7d60
00b34 0f1f84002c0c0005               nop        dword ptr [rax + rax + 0x5000c2c]
00b3c bee4ffffff                     mov        esi, 0xffffffe4
00b41 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b49 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b4e 44891c24                       mov        dword ptr [rsp], r11d
00b52 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b57 4489442404                     mov        dword ptr [rsp + 4], r8d
00b5c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b61 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b66 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b6b 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b70 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b75 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b7a 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00b7f 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00b84 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b89 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b8e 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00b93 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00b98 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00b9d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00ba2 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00ba7 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00bac 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00bb1 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00bb6 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00bbb 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00bc0 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00bc5 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00bca 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00bcf 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00bd4 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00bd9 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00bde 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00be3 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00be8 44894c2460                     mov        dword ptr [rsp + 0x60], r9d
00bed 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00bf2 90                             nop        
00bf3 e8e846b6ff                     call       0x7fa87b9d7d60
00bf8 0f1f8400f00c0006               nop        dword ptr [rax + rax + 0x6000cf0]
00c00 bee4ffffff                     mov        esi, 0xffffffe4
00c05 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c0d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00c12 44891424                       mov        dword ptr [rsp], r10d
00c16 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c1b 44894c2404                     mov        dword ptr [rsp + 4], r9d
00c20 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c25 4489542408                     mov        dword ptr [rsp + 8], r10d
00c2a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c2f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c34 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00c39 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c3e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c43 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c48 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c4d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c52 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c57 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c5c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c61 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c66 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c6b 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c70 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00c75 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c7a 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
00c7f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00c84 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c89 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c8e 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c93 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c98 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00c9d 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00ca2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ca7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cac 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00cb4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cb9 4489442468                     mov        dword ptr [rsp + 0x68], r8d
00cbe 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
00cc3 e81846b6ff                     call       0x7fa87b9d7d60
00cc8 0f1f8400c00d0007               nop        dword ptr [rax + rax + 0x7000dc0]
00cd0 4533db                         xor        r11d, r11d
00cd3 4d3bcb                         cmp        r9, r11
00cd6 bdffffffff                     mov        ebp, 0xffffffff
00cdb 7c08                           jl         0x7fa87be73765
00cdd 400f95c5                       setne      bpl
00ce1 400fb6ed                       movzx      ebp, bpl
00ce5 be45ffffff                     mov        esi, 0xffffff45
00cea 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
00cf2 4c891c24                       mov        qword ptr [rsp], r11
00cf6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00cfb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00d00 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00d08 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00d0d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00d12 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
00d17 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00d1b 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00d1f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
00d24 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
00d29 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00d2d 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00d31 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
00d36 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
00d3b 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00d3f 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00d43 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
00d48 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
00d4d 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00d54 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00d58 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
00d5d 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
00d62 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00d66 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00d6a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
00d6f 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
00d74 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00d79 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00d7e 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
00d86 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
00d8b 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
00d93 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
00d98 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00da0 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00da7 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00daf 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
00db7 e82445b6ff                     call       0x7fa87b9d7d60
00dbc 0f1f8400b40e0008               nop        dword ptr [rax + rax + 0x8000eb4]
00dc4 be45ffffff                     mov        esi, 0xffffff45
00dc9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00dd1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00dd6 44891c24                       mov        dword ptr [rsp], r11d
00dda 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00ddf 4489542404                     mov        dword ptr [rsp + 4], r10d
00de4 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00de9 44895c2408                     mov        dword ptr [rsp + 8], r11d
00dee 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00df6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00dfb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e00 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e05 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e0a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e0f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e14 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e19 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e1e 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e23 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e28 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e2d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00e32 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00e37 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e3c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e41 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e46 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e4b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00e50 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e55 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e5a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e5f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e64 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e69 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e6e 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e73 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e78 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e7d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e85 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e8a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e92 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e97 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e9f 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00ea7 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00eaf 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00eb7 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00ebf 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00ec7 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ecf e80c44b6ff                     call       0x7fa87b9d7d60
00ed4 0f1f8400cc0f0009               nop        dword ptr [rax + rax + 0x9000fcc]
00edc be45ffffff                     mov        esi, 0xffffff45
00ee1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ee9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00eee 44891424                       mov        dword ptr [rsp], r10d
00ef2 4489442408                     mov        dword ptr [rsp + 8], r8d
00ef7 e8e443b6ff                     call       0x7fa87b9d7d60
00efc 0f1f8400f40f000a               nop        dword ptr [rax + rax + 0xa000ff4]
00f04 be45ffffff                     mov        esi, 0xffffff45
00f09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f11 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f16 44891424                       mov        dword ptr [rsp], r10d
00f1a 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00f1f 44895c2404                     mov        dword ptr [rsp + 4], r11d
00f24 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00f29 4489542408                     mov        dword ptr [rsp + 8], r10d
00f2e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00f36 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00f3b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00f40 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00f45 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00f4a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00f4f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00f54 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00f59 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00f5e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00f63 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00f68 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00f6d 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00f72 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00f77 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00f7c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00f81 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00f86 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00f8b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00f90 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00f95 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00f9a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00f9f 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00fa4 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00fa9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00fae 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00fb3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00fb8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00fbd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00fc5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00fca 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00fd2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00fd7 e80443b6ff                     call       0x7fa87b9d7d60
00fdc 0f1f8400d410000b               nop        dword ptr [rax + rax + 0xb0010d4]
00fe4 be45ffffff                     mov        esi, 0xffffff45
00fe9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ff1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00ff6 44891c24                       mov        dword ptr [rsp], r11d
00ffa 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fff 4489542404                     mov        dword ptr [rsp + 4], r10d
01004 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01009 44895c2408                     mov        dword ptr [rsp + 8], r11d
0100e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01016 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0101b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01020 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01025 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0102a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0102f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01034 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01039 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0103e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01043 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01048 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0104d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01052 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01057 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0105c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01061 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01066 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0106b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01070 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01075 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0107a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0107f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01084 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01089 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0108e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01093 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01098 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0109d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010a5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010aa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010b2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010b7 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
010bf 4489542478                     mov        dword ptr [rsp + 0x78], r10d
010c4 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
010cc 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010d4 666690                         nop        
010d7 e80442b6ff                     call       0x7fa87b9d7d60
010dc 0f1f8400d411000c               nop        dword ptr [rax + rax + 0xc0011d4]
010e4 be45ffffff                     mov        esi, 0xffffff45
010e9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010f1 448b542408                     mov        r10d, dword ptr [rsp + 8]
010f6 44891424                       mov        dword ptr [rsp], r10d
010fa 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
010ff 44895c2404                     mov        dword ptr [rsp + 4], r11d
01104 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01109 4489542408                     mov        dword ptr [rsp + 8], r10d
0110e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01116 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0111b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01120 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01125 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0112a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0112f 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01134 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01139 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0113e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01143 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01148 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
0114d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01152 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01157 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0115c 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01161 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01166 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0116b 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01170 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01175 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0117a 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0117f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01184 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01189 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0118e 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01193 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01198 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0119d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
011a5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
011aa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
011b2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
011b7 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
011bf 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
011c6 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011ce 90                             nop        
011cf e80c41b6ff                     call       0x7fa87b9d7d60
011d4 0f1f8400cc12000d               nop        dword ptr [rax + rax + 0xd0012cc]
011dc be45ffffff                     mov        esi, 0xffffff45
011e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011e9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011ee 44890c24                       mov        dword ptr [rsp], r9d
011f2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
011f7 44895c2404                     mov        dword ptr [rsp + 4], r11d
011fc 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01201 44894c2408                     mov        dword ptr [rsp + 8], r9d
01206 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0120e 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01213 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01218 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0121d 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01222 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01227 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0122c 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01231 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01236 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0123b 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01240 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01245 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0124a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0124f 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01254 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01259 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0125e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01263 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01268 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0126d 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01272 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01277 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0127c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01281 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01286 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0128b 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
01290 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
01295 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
0129d 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
012a2 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
012aa 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
012af 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
012b4 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
012bb 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012c3 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
012cb 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
012d3 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
012db 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
012e3 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
012eb 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
012f3 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
012fb e8e03fb6ff                     call       0x7fa87b9d7d60
01300 0f1f8400f813000e               nop        dword ptr [rax + rax + 0xe0013f8]
01308 41bbffffff7f                   mov        r11d, 0x7fffffff
0130e 4d3bcb                         cmp        r9, r11
01311 bdffffffff                     mov        ebp, 0xffffffff
01316 7c08                           jl         0x7fa87be73da0
01318 400f95c5                       setne      bpl
0131c 400fb6ed                       movzx      ebp, bpl
01320 be45ffffff                     mov        esi, 0xffffff45
01325 4c8b9c2490000000               mov        r11, qword ptr [rsp + 0x90]
0132d 4c891c24                       mov        qword ptr [rsp], r11
01331 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
01335 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01339 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01341 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01346 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0134b 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01350 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
01354 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01358 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0135d 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01362 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
01366 895c2434                       mov        dword ptr [rsp + 0x34], ebx
0136a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
0136f 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01374 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01378 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0137c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01381 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01386 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
0138d 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01391 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01396 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
0139b 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0139f 895c2454                       mov        dword ptr [rsp + 0x54], ebx
013a3 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
013a8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
013ad 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
013b2 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
013b7 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
013bf 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
013c4 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
013cc 4c895c2470                     mov        qword ptr [rsp + 0x70], r11
013d1 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
013d9 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
013e0 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013e8 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
013f0 666690                         nop        
013f3 e8e83eb6ff                     call       0x7fa87b9d7d60
013f8 0f1f8400f014000f               nop        dword ptr [rax + rax + 0xf0014f0]
01400 be45ffffff                     mov        esi, 0xffffff45
01405 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0140d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01412 44891c24                       mov        dword ptr [rsp], r11d
01416 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0141b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01420 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01425 44894c2408                     mov        dword ptr [rsp + 8], r9d
0142a 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
01432 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01437 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
0143c 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01441 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01446 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0144b 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01450 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01455 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0145a 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0145f 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01464 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01469 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0146e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01473 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01478 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
0147d 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01482 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01487 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
0148c 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01491 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01496 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0149b 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
014a0 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
014a5 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
014aa 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
014af 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
014b4 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
014b9 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
014c1 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
014c6 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
014ce 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
014d3 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
014d8 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014e0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
014e8 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
014f0 666690                         nop        
014f3 e8e83db6ff                     call       0x7fa87b9d7d60
014f8 0f1f8400f0150010               nop        dword ptr [rax + rax + 0x100015f0]
01500 be45ffffff                     mov        esi, 0xffffff45
01505 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0150d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01512 44891c24                       mov        dword ptr [rsp], r11d
01516 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
0151b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01520 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01525 4489542408                     mov        dword ptr [rsp + 8], r10d
0152a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01532 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01537 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0153c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01541 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01546 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0154b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01550 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01555 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0155a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0155f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01564 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01569 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0156e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01573 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01578 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0157d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01582 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01587 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0158c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01591 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01596 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0159b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
015a0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
015a5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
015aa 4489542450                     mov        dword ptr [rsp + 0x50], r10d
015af 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
015b4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
015b9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
015c1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
015c6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
015ce 4c89542468                     mov        qword ptr [rsp + 0x68], r10
015d3 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
015d8 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
015df 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
015e7 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
015ef e8ec3cb6ff                     call       0x7fa87b9d7d60
015f4 0f1f8400ec160011               nop        dword ptr [rax + rax + 0x110016ec]
015fc be3dffffff                     mov        esi, 0xffffff3d
01601 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01609 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0160e 44890c24                       mov        dword ptr [rsp], r9d
01612 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01617 44894c2404                     mov        dword ptr [rsp + 4], r9d
0161c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01621 44894c2408                     mov        dword ptr [rsp + 8], r9d
01626 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
0162e 4c895c2410                     mov        qword ptr [rsp + 0x10], r11
01633 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01638 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
0163d 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01642 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01647 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
0164c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01651 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01656 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0165b 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01660 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01665 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0166a 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0166f 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01674 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01679 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0167e 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01683 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01688 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
0168d 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
01695 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0169a 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0169f 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
016a4 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
016a9 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
016ae 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
016b3 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
016b8 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
016bd 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
016c2 4c8b9c2480000000               mov        r11, qword ptr [rsp + 0x80]
016ca 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
016cf 4c8b9c2488000000               mov        r11, qword ptr [rsp + 0x88]
016d7 4c895c2468                     mov        qword ptr [rsp + 0x68], r11
016dc 448944247c                     mov        dword ptr [rsp + 0x7c], r8d
016e1 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
016e9 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
016f0 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
016f7 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
016ff 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
01707 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0170f 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
01717 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
0171f 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
01727 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
0172f 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
01737 e8a43bb6ff                     call       0x7fa87b9d7d60
0173c 0f1f840034180012               nop        dword ptr [rax + rax + 0x12001834]
01744 be45ffffff                     mov        esi, 0xffffff45
01749 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01751 448b542408                     mov        r10d, dword ptr [rsp + 8]
01756 44891424                       mov        dword ptr [rsp], r10d
0175a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0175f 4489542404                     mov        dword ptr [rsp + 4], r10d
01764 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01769 4489542408                     mov        dword ptr [rsp + 8], r10d
0176e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01773 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01778 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
0177d 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01782 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01787 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0178c 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01791 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01796 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0179b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017a0 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
017a5 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
017aa 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
017af 4489542430                     mov        dword ptr [rsp + 0x30], r10d
017b4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017b9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
017be 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
017c3 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
017c8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
017cd 4489542448                     mov        dword ptr [rsp + 0x48], r10d
017d2 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017da 4c89542450                     mov        qword ptr [rsp + 0x50], r10
017df 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
017e4 894c2460                       mov        dword ptr [rsp + 0x60], ecx
017e8 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
017ed 6690                           nop        
017ef e8ec3ab6ff                     call       0x7fa87b9d7d60
017f4 0f1f8400ec180013               nop        dword ptr [rax + rax + 0x130018ec]
017fc be45ffffff                     mov        esi, 0xffffff45
01801 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01809 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
0180e 44891c24                       mov        dword ptr [rsp], r11d
01812 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01817 4489542404                     mov        dword ptr [rsp + 4], r10d
0181c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01821 44895c2408                     mov        dword ptr [rsp + 8], r11d
01826 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0182b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01830 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01835 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
0183a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0183f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01844 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01849 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0184e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01853 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01858 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0185d 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01862 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01867 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0186c 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01871 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01876 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
0187b 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
01880 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01885 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0188a 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
0188f 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01894 895c2454                       mov        dword ptr [rsp + 0x54], ebx
01898 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0189d 6690                           nop        
0189f e83c3ab6ff                     call       0x7fa87b9d7d60
018a4 0f1f84009c190014               nop        dword ptr [rax + rax + 0x1400199c]
018ac be45ffffff                     mov        esi, 0xffffff45
018b1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
018b9 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
018be 44891c24                       mov        dword ptr [rsp], r11d
018c2 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
018c7 44895c2404                     mov        dword ptr [rsp + 4], r11d
018cc 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
018d1 44895c2408                     mov        dword ptr [rsp + 8], r11d
018d6 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
018de 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018e3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
018e8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018ed 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
018f2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
018f7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018fc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01901 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01906 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
0190b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01910 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01915 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0191a 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
0191f 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01924 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01929 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
0192e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01933 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01938 4489542438                     mov        dword ptr [rsp + 0x38], r10d
0193d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01942 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01947 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
0194c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01951 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01956 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0195b 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01960 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01965 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0196d 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01972 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0197a 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0197f 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
01987 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
0198f 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01997 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0199f 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
019a7 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
019af e82c39b6ff                     call       0x7fa87b9d7d60
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
019f0 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
019f5 448954240c                     mov        dword ptr [rsp + 0xc], r10d
019fa 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
019ff 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01a04 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01a09 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01a0e 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01a13 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01a18 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01a1d 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01a22 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01a27 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01a2c 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01a31 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01a36 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01a3b 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01a40 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01a45 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01a4a 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01a4f 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01a54 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01a59 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01a5e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01a63 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01a68 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01a70 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01a75 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01a7d 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01a82 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01a8a 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01a92 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
01a99 6690                           nop        
01a9b e84038b6ff                     call       0x7fa87b9d7d60
01aa0 0f1f8400981b0016               nop        dword ptr [rax + rax + 0x16001b98]
01aa8 4585c9                         test       r9d, r9d
01aab 7f07                           jg         0x7fa87be74534
01aad 33c0                           xor        eax, eax
01aaf e90ce6ffff                     jmp        0x7fa87be72b40
01ab4 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01ab8 44896c2428                     mov        dword ptr [rsp + 0x28], r13d
01abd 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
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
01af9 488bee                         mov        rbp, rsi
01afc 8b542408                       mov        edx, dword ptr [rsp + 8]
01b00 418bc9                         mov        ecx, r9d
01b03 e8d8c2a9ff                     call       0x7fa87b910860
01b08 0f1f8400001c0017               nop        dword ptr [rax + rax + 0x17001c00]
01b10 41bb40000000                   mov        r11d, 0x40
01b16 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01b1b c4e2a1f7c0                     shlx       rax, rax, r11
01b20 48894424f8                     mov        qword ptr [rsp - 8], rax
01b25 8b442404                       mov        eax, dword ptr [rsp + 4]
01b29 890424                         mov        dword ptr [rsp], eax
01b2c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b31 448b4c240c                     mov        r9d, dword ptr [rsp + 0xc]
01b36 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b3b 448b442414                     mov        r8d, dword ptr [rsp + 0x14]
01b40 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01b44 8b5c241c                       mov        ebx, dword ptr [rsp + 0x1c]
01b48 448b6c2428                     mov        r13d, dword ptr [rsp + 0x28]
01b4d 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b51 e96ae5ffff                     jmp        0x7fa87be72b40
01b56 4585c9                         test       r9d, r9d
01b59 7f08                           jg         0x7fa87be745e3
01b5b 4533f6                         xor        r14d, r14d
01b5e e99fe5ffff                     jmp        0x7fa87be72b82
01b63 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01b68 4889442430                     mov        qword ptr [rsp + 0x30], rax
01b6d 89542428                       mov        dword ptr [rsp + 0x28], edx
01b71 44896c241c                     mov        dword ptr [rsp + 0x1c], r13d
01b76 895c2418                       mov        dword ptr [rsp + 0x18], ebx
01b7a 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01b7e 4489442410                     mov        dword ptr [rsp + 0x10], r8d
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
01bbc 418bc9                         mov        ecx, r9d
01bbf 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01bc4 666690                         nop        
01bc7 e814c2a9ff                     call       0x7fa87b910860
01bcc 0f1f8400c41c0018               nop        dword ptr [rax + rax + 0x18001cc4]
01bd4 41ba80000000                   mov        r10d, 0x80
01bda 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
01bdf c462a9f7f0                     shlx       r14, rax, r10
01be4 48894424f8                     mov        qword ptr [rsp - 8], rax
01be9 8b442404                       mov        eax, dword ptr [rsp + 4]
01bed 890424                         mov        dword ptr [rsp], eax
01bf0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf5 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01bfa 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01bff 8b5c2418                       mov        ebx, dword ptr [rsp + 0x18]
01c03 448b6c241c                     mov        r13d, dword ptr [rsp + 0x1c]
01c08 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01c0c 488b442430                     mov        rax, qword ptr [rsp + 0x30]
01c11 448b5c242c                     mov        r11d, dword ptr [rsp + 0x2c]
01c16 e9e7e4ffff                     jmp        0x7fa87be72b82
01c1b 4533c0                         xor        r8d, r8d
01c1e e9dcedffff                     jmp        0x7fa87be7347f
01c23 bee4ffffff                     mov        esi, 0xffffffe4
01c28 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c30 488f0424                       pop        qword ptr [rsp]
01c34 666690                         nop        
01c37 e8a436b6ff                     call       0x7fa87b9d7d60
01c3c 0f1f8400341d0019               nop        dword ptr [rax + rax + 0x19001d34]
01c44 be5d000000                     mov        esi, 0x5d
01c49 6690                           nop        
01c4b e89036b6ff                     call       0x7fa87b9d7d60
01c50 0f1f8400481d001a               nop        dword ptr [rax + rax + 0x1a001d48]
01c58 bef6ffffff                     mov        esi, 0xfffffff6
01c5d 6690                           nop        
01c5f e87c36b6ff                     call       0x7fa87b9d7d60
01c64 0f1f84005c1d001b               nop        dword ptr [rax + rax + 0x1b001d5c]
01c6c bef6ffffff                     mov        esi, 0xfffffff6
01c71 6690                           nop        
01c73 e86836b6ff                     call       0x7fa87b9d7d60
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
01cc8 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01ccd 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01cd2 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01cd7 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01cdc 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ce1 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01ce6 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01ceb 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01cef 897c2444                       mov        dword ptr [rsp + 0x44], edi
01cf3 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01cf8 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01cfd 6690                           nop        
01cff e8dc35b6ff                     call       0x7fa87b9d7d60
01d04 0f1f8400fc1d001d               nop        dword ptr [rax + rax + 0x1d001dfc]
01d0c bee4ffffff                     mov        esi, 0xffffffe4
01d11 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d19 488f0424                       pop        qword ptr [rsp]
01d1d 4489442418                     mov        dword ptr [rsp + 0x18], r8d
01d22 48894424f8                     mov        qword ptr [rsp - 8], rax
01d27 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d2e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d37 895c2430                       mov        dword ptr [rsp + 0x30], ebx
01d3b 89542434                       mov        dword ptr [rsp + 0x34], edx
01d3f e89c35b6ff                     call       0x7fa87b9d7d60
01d44 0f1f84003c1e001e               nop        dword ptr [rax + rax + 0x1e001e3c]
01d4c bee4ffffff                     mov        esi, 0xffffffe4
01d51 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d59 488f0424                       pop        qword ptr [rsp]
01d5d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d62 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d69 89442418                       mov        dword ptr [rsp + 0x18], eax
01d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d72 895c241c                       mov        dword ptr [rsp + 0x1c], ebx
01d76 89542430                       mov        dword ptr [rsp + 0x30], edx
01d7a 4889442438                     mov        qword ptr [rsp + 0x38], rax
01d7f 44895c2440                     mov        dword ptr [rsp + 0x40], r11d
01d84 666690                         nop        
01d87 e85435b6ff                     call       0x7fa87b9d7d60
01d8c 0f1f8400841e001f               nop        dword ptr [rax + rax + 0x1f001e84]
01d94 bebeffffff                     mov        esi, 0xffffffbe
01d99 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01da1 448b542408                     mov        r10d, dword ptr [rsp + 8]
01da6 44891424                       mov        dword ptr [rsp], r10d
01daa 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01daf 4489542408                     mov        dword ptr [rsp + 8], r10d
01db4 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01db9 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dbe 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01dc3 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01dc8 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01dcd 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01dd2 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01dd7 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01ddc 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01de1 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01de6 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01deb 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01df0 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01df5 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01dfa 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01dff 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01e03 897c2444                       mov        dword ptr [rsp + 0x44], edi
01e07 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01e0c 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01e11 6690                           nop        
01e13 e8c834b6ff                     call       0x7fa87b9d7d60
01e18 0f1f8400101f0020               nop        dword ptr [rax + rax + 0x20001f10]
01e20 beccffffff                     mov        esi, 0xffffffcc
01e25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e2d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01e32 44890c24                       mov        dword ptr [rsp], r9d
01e36 4489442410                     mov        dword ptr [rsp + 0x10], r8d
01e3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e47 89442414                       mov        dword ptr [rsp + 0x14], eax
01e4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e50 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e55 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01e5a 895c2428                       mov        dword ptr [rsp + 0x28], ebx
01e5e 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01e62 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e67 e87434b6ff                     call       0x7fa87b9d7d60
01e6c 0f1f8400641f0021               nop        dword ptr [rax + rax + 0x21001f64]
01e74 beccffffff                     mov        esi, 0xffffffcc
01e79 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e81 448b442408                     mov        r8d, dword ptr [rsp + 8]
01e86 44890424                       mov        dword ptr [rsp], r8d
01e8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e96 89442410                       mov        dword ptr [rsp + 0x10], eax
01e9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9f 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01ea4 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01ea9 895c2414                       mov        dword ptr [rsp + 0x14], ebx
01ead 89542428                       mov        dword ptr [rsp + 0x28], edx
01eb1 4889442430                     mov        qword ptr [rsp + 0x30], rax
01eb6 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ebb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ec0 666690                         nop        
01ec3 e81834b6ff                     call       0x7fa87b9d7d60
01ec8 0f1f8400c01f0022               nop        dword ptr [rax + rax + 0x22001fc0]
01ed0 be45ffffff                     mov        esi, 0xffffff45
01ed5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01edd 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01ee2 44891c24                       mov        dword ptr [rsp], r11d
01ee6 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01eeb 4489542404                     mov        dword ptr [rsp + 4], r10d
01ef0 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01ef5 44895c2408                     mov        dword ptr [rsp + 8], r11d
01efa 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01eff 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f04 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01f09 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f0e 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f13 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f18 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01f1d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01f22 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01f27 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01f2c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01f31 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01f36 4489442458                     mov        dword ptr [rsp + 0x58], r8d
01f3b e8a033b6ff                     call       0x7fa87b9d7d60
01f40 0f1f840038200023               nop        dword ptr [rax + rax + 0x23002038]
01f48 be45ffffff                     mov        esi, 0xffffff45
01f4d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01f55 448b542408                     mov        r10d, dword ptr [rsp + 8]
01f5a 44891424                       mov        dword ptr [rsp], r10d
01f5e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
01f63 4489442404                     mov        dword ptr [rsp + 4], r8d
01f68 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01f6d 4489542408                     mov        dword ptr [rsp + 8], r10d
01f72 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01f77 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01f7c 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01f81 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01f86 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01f8b 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01f90 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01f95 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01f9a 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01f9f 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01fa4 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01fa9 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01fae 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01fb3 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01fb8 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
01fbd 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01fc2 90                             nop        
01fc3 e81833b6ff                     call       0x7fa87b9d7d60
01fc8 0f1f8400c0200024               nop        dword ptr [rax + rax + 0x240020c0]
01fd0 bef6ffffff                     mov        esi, 0xfffffff6
01fd5 6690                           nop        
01fd7 e80433b6ff                     call       0x7fa87b9d7d60
01fdc 0f1f8400d4200025               nop        dword ptr [rax + rax + 0x250020d4]
01fe4 be5d000000                     mov        esi, 0x5d
01fe9 6690                           nop        
01feb e8f032b6ff                     call       0x7fa87b9d7d60
01ff0 0f1f8400e8200026               nop        dword ptr [rax + rax + 0x260020e8]
01ff8 be45ffffff                     mov        esi, 0xffffff45
01ffd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02005 448b542408                     mov        r10d, dword ptr [rsp + 8]
0200a 44891424                       mov        dword ptr [rsp], r10d
0200e 894c2410                       mov        dword ptr [rsp + 0x10], ecx
02012 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
02017 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
0201c 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
02021 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02029 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0202e 4c89442450                     mov        qword ptr [rsp + 0x50], r8
02033 e8a832b6ff                     call       0x7fa87b9d7d60
02038 0f1f840030210027               nop        dword ptr [rax + rax + 0x27002130]
02040 bef6ffffff                     mov        esi, 0xfffffff6
02045 418beb                         mov        ebp, r11d
02048 666690                         nop        
0204b e89032b6ff                     call       0x7fa87b9d7d60
02050 0f1f840048210028               nop        dword ptr [rax + rax + 0x28002148]
02058 bef6ffffff                     mov        esi, 0xfffffff6
0205d 418bea                         mov        ebp, r10d
02060 666690                         nop        
02063 e87832b6ff                     call       0x7fa87b9d7d60
02068 0f1f840060210029               nop        dword ptr [rax + rax + 0x29002160]
02070 bef6ffffff                     mov        esi, 0xfffffff6
02075 418beb                         mov        ebp, r11d
02078 666690                         nop        
0207b e86032b6ff                     call       0x7fa87b9d7d60
02080 0f1f84007821002a               nop        dword ptr [rax + rax + 0x2a002178]
02088 bef6ffffff                     mov        esi, 0xfffffff6
0208d 6690                           nop        
0208f e84c32b6ff                     call       0x7fa87b9d7d60
02094 0f1f84008c21002b               nop        dword ptr [rax + rax + 0x2b00218c]
0209c bef6ffffff                     mov        esi, 0xfffffff6
020a1 6690                           nop        
020a3 e83832b6ff                     call       0x7fa87b9d7d60
020a8 0f1f8400a021002c               nop        dword ptr [rax + rax + 0x2c0021a0]
020b0 bef6ffffff                     mov        esi, 0xfffffff6
020b5 6690                           nop        
020b7 e82432b6ff                     call       0x7fa87b9d7d60
020bc 0f1f8400b421002d               nop        dword ptr [rax + rax + 0x2d0021b4]
020c4 bef6ffffff                     mov        esi, 0xfffffff6
020c9 6690                           nop        
020cb e81032b6ff                     call       0x7fa87b9d7d60
020d0 0f1f8400c821002e               nop        dword ptr [rax + rax + 0x2e0021c8]
020d8 bef6ffffff                     mov        esi, 0xfffffff6
020dd 6690                           nop        
020df e8fc31b6ff                     call       0x7fa87b9d7d60
020e4 0f1f8400dc21002f               nop        dword ptr [rax + rax + 0x2f0021dc]
020ec bef6ffffff                     mov        esi, 0xfffffff6
020f1 6690                           nop        
020f3 e8e831b6ff                     call       0x7fa87b9d7d60
020f8 0f1f8400f0210030               nop        dword ptr [rax + rax + 0x300021f0]
02100 bef6ffffff                     mov        esi, 0xfffffff6
02105 6690                           nop        
02107 e8d431b6ff                     call       0x7fa87b9d7d60
0210c 0f1f840004220031               nop        dword ptr [rax + rax + 0x31002204]
02114 eb08                           jmp        0x7fa87be74b9e
02116 eb06                           jmp        0x7fa87be74b9e
02118 eb04                           jmp        0x7fa87be74b9e
0211a eb02                           jmp        0x7fa87be74b9e
0211c eb00                           jmp        0x7fa87be74b9e
0211e 488bf0                         mov        rsi, rax
02121 e93ee9ffff                     jmp        0x7fa87be734e4
02126 49bab534e77ba87f0000           movabs     r10, 0x7fa87be734b5
02130 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02137 e924e3a9ff                     jmp        0x7fa87b912ee0
0213c e8dfaea8ff                     call       0x7fa87b8ffaa0
02141 e9d8deffff                     jmp        0x7fa87be72a9e
02146 f4                             hlt        
02147 f4                             hlt        
