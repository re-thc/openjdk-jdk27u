00000 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f858e240000                   jne        0x7f63dbbf4a2c
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
00050 0f834c1d0000                   jae        0x7f63dbbf4322
00056 0fb65c160b                     movzx      ebx, byte ptr [rsi + rdx + 0xb]
0005b 85db                           test       ebx, ebx
0005d 0f84711d0000                   je         0x7f63dbbf4354
00063 448bc2                         mov        r8d, edx
00066 442bc1                         sub        r8d, ecx
00069 448b1424                       mov        r10d, dword ptr [rsp]
0006d 4183c2f9                       add        r10d, -7
00071 448d5af8                       lea        r11d, [rdx - 8]
00075 428d0cc500000000               lea        ecx, [r8*8]
0007d f30fbddb                       lzcnt      ebx, ebx
00081 be1f000000                     mov        esi, 0x1f
00086 2bf3                           sub        esi, ebx
00088 bf08000000                     mov        edi, 8
0008d 2bfe                           sub        edi, esi
0008f 8bd1                           mov        edx, ecx
00091 2bd7                           sub        edx, edi
00093 4183f808                       cmp        r8d, 8
00097 0f8c871b0000                   jl         0x7f63dbbf41a4
0009d 4585d2                         test       r10d, r10d
000a0 0f8c961f0000                   jl         0x7f63dbbf45bc
000a6 8b2c24                         mov        ebp, dword ptr [rsp]
000a9 83c5f9                         add        ebp, -7
000ac 443bdd                         cmp        r11d, ebp
000af 0f83371e0000                   jae        0x7f63dbbf446c
000b5 458bcb                         mov        r9d, r11d
000b8 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
000c0 4e8b6c0b0c                     mov        r13, qword ptr [rbx + r9 + 0xc]
000c5 4183c0f8                       add        r8d, -8
000c9 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
000d1 4183c1f0                       add        r9d, -0x10
000d5 4183f808                       cmp        r8d, 8
000d9 0f8cfa1b0000                   jl         0x7f63dbbf4259
000df 4585d2                         test       r10d, r10d
000e2 0f8cbc1f0000                   jl         0x7f63dbbf4624
000e8 8b2c24                         mov        ebp, dword ptr [rsp]
000eb 83c5f9                         add        ebp, -7
000ee 443bcd                         cmp        r9d, ebp
000f1 0f83491e0000                   jae        0x7f63dbbf44c0
000f7 418bc9                         mov        ecx, r9d
000fa 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
00102 4d8b74080c                     mov        r14, qword ptr [r8 + rcx + 0xc]
00107 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010c 448b451c                       mov        r8d, dword ptr [rbp + 0x1c]
00110 4585c0                         test       r8d, r8d
00113 0f84e31c0000                   je         0x7f63dbbf437c
00119 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
0011c 8b4b08                         mov        ecx, dword ptr [rbx + 8]
0011f 8b4524                         mov        eax, dword ptr [rbp + 0x24]
00122 85c0                           test       eax, eax
00124 0f84fa1c0000                   je         0x7f63dbbf43a4
0012a 895c2434                       mov        dword ptr [rsp + 0x34], ebx
0012e 4c89b42498000000               mov        qword ptr [rsp + 0x98], r14
00136 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0013b 4c896c2428                     mov        qword ptr [rsp + 0x28], r13
00140 899424a4000000                 mov        dword ptr [rsp + 0xa4], edx
00147 8974240c                       mov        dword ptr [rsp + 0xc], esi
0014b 897c2424                       mov        dword ptr [rsp + 0x24], edi
0014f 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
00154 4489542404                     mov        dword ptr [rsp + 4], r10d
00159 4889ac24b0000000               mov        qword ptr [rsp + 0xb0], rbp
00161 41034808                       add        ecx, dword ptr [r8 + 8]
00165 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0016a 034808                         add        ecx, dword ptr [rax + 8]
0016d 89442438                       mov        dword ptr [rsp + 0x38], eax
00171 894c241c                       mov        dword ptr [rsp + 0x1c], ecx
00175 4c8bd0                         mov        r10, rax
00178 4c89542440                     mov        qword ptr [rsp + 0x40], r10
0017d 4d8bd0                         mov        r10, r8
00180 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00185 4c8bd3                         mov        r10, rbx
00188 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0018d 85c9                           test       ecx, ecx
0018f 0f84f4080000                   je         0x7f63dbbf3009
00195 be40000000                     mov        esi, 0x40
0019a 2bf7                           sub        esi, edi
0019c 3bce                           cmp        ecx, esi
0019e 0f8ff4010000                   jg         0x7f63dbbf2918
001a4 2bf1                           sub        esi, ecx
001a6 c442cbf7c5                     shrx       r8, r13, rsi
001ab 83f940                         cmp        ecx, 0x40
001ae 0f8dd8200000                   jge        0x7f63dbbf480c
001b4 41bb01000000                   mov        r11d, 1
001ba c4c2f1f7eb                     shlx       rbp, r11, rcx
001bf 48ffcd                         dec        rbp
001c2 4923e8                         and        rbp, r8
001c5 48896c2460                     mov        qword ptr [rsp + 0x60], rbp
001ca 448bd1                         mov        r10d, ecx
001cd 458bca                         mov        r9d, r10d
001d0 442b4c240c                     sub        r9d, dword ptr [rsp + 0xc]
001d5 458d5908                       lea        r11d, [r9 + 8]
001d9 4183fb40                       cmp        r11d, 0x40
001dd 7c34                           jl         0x7f63dbbf2793
001df 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001e4 4183c1c8                       add        r9d, -0x38
001e8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001ed 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f5 8b542408                       mov        edx, dword ptr [rsp + 8]
001f9 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
001fd 90                             nop        
001fe 90                             nop        
001ff e8dc14b5ff                     call       0x7f63db743c60
00204 0f1f8400fc020000               nop        dword ptr [rax + rax + 0x2fc]
0020c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00211 eb31                           jmp        0x7f63dbbf27c4
00213 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
00218 4c8b9c2498000000               mov        r11, qword ptr [rsp + 0x98]
00220 4c895c2420                     mov        qword ptr [rsp + 0x20], r11
00225 4c8b5c2428                     mov        r11, qword ptr [rsp + 0x28]
0022a 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00232 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0023a 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
0023f 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00244 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00249 458b4208                       mov        r8d, dword ptr [r10 + 8]
0024d 4183f820                       cmp        r8d, 0x20
00251 0f8dbd1e0000                   jge        0x7f63dbbf4694
00257 c462bbf74c2460                 shrx       r9, qword ptr [rsp + 0x60], r8
0025e 41bb01000000                   mov        r11d, 1
00264 c44239f7db                     shlx       r11d, r11d, r8d
00269 41ffcb                         dec        r11d
0026c 4d63d3                         movsxd     r10, r11d
0026f 4c23542460                     and        r10, qword ptr [rsp + 0x60]
00274 458bda                         mov        r11d, r10d
00277 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
0027c 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00281 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00285 418bcb                         mov        ecx, r11d
00288 4183fb20                       cmp        r11d, 0x20
0028c 0f8d0e1f0000                   jge        0x7f63dbbf4720
00292 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
0029a 458b5228                       mov        r10d, dword ptr [r10 + 0x28]
0029e 44899424b8000000               mov        dword ptr [rsp + 0xb8], r10d
002a6 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
002ab 458b5a18                       mov        r11d, dword ptr [r10 + 0x18]
002af 418b5b08                       mov        ebx, dword ptr [r11 + 8]
002b3 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
002b8 458b5318                       mov        r10d, dword ptr [r11 + 0x18]
002bc 418b7a08                       mov        edi, dword ptr [r10 + 8]
002c0 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
002c5 458b5a18                       mov        r11d, dword ptr [r10 + 0x18]
002c9 458b5308                       mov        r10d, dword ptr [r11 + 8]
002cd 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
002d2 4585db                         test       r11d, r11d
002d5 0f8ebf1a0000                   jle        0x7f63dbbf431a
002db ffcb                           dec        ebx
002dd 895c2460                       mov        dword ptr [rsp + 0x60], ebx
002e1 ffcf                           dec        edi
002e3 897c2464                       mov        dword ptr [rsp + 0x64], edi
002e7 41ffca                         dec        r10d
002ea 4489542468                     mov        dword ptr [rsp + 0x68], r10d
002ef c442f3f7d1                     shrx       r10, r9, rcx
002f4 41b801000000                   mov        r8d, 1
002fa c44271f7d8                     shlx       r11d, r8d, ecx
002ff 458bc2                         mov        r8d, r10d
00302 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00307 41ffcb                         dec        r11d
0030a 4d63d3                         movsxd     r10, r11d
0030d 4d23d1                         and        r10, r9
00310 458bd2                         mov        r10d, r10d
00313 4489542470                     mov        dword ptr [rsp + 0x70], r10d
00318 4c8b9424a8000000               mov        r10, qword ptr [rsp + 0xa8]
00320 458b9af8000000                 mov        r11d, dword ptr [r10 + 0xf8]
00327 44899c24bc000000               mov        dword ptr [rsp + 0xbc], r11d
0032f 458b92f4000000                 mov        r10d, dword ptr [r10 + 0xf4]
00336 44899424c0000000               mov        dword ptr [rsp + 0xc0], r10d
0033e 458b5a08                       mov        r11d, dword ptr [r10 + 8]
00342 4585db                         test       r11d, r11d
00345 0f86011b0000                   jbe        0x7f63dbbf43cc
0034b 4d63d3                         movsxd     r10, r11d
0034e 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00353 49ffcb                         dec        r11
00356 4d3bda                         cmp        r11, r10
00359 0f83ed1a0000                   jae        0x7f63dbbf43cc
0035f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00364 4585db                         test       r11d, r11d
00367 0f8c2f1c0000                   jl         0x7f63dbbf451c
0036d 448b1424                       mov        r10d, dword ptr [rsp]
00371 4183c2f9                       add        r10d, -7
00375 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0037d 4533d2                         xor        r10d, r10d
00380 4533db                         xor        r11d, r11d
00383 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0038b 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00393 e987020000                     jmp        0x7f63dbbf2b9f
00398 8be9                           mov        ebp, ecx
0039a 2bee                           sub        ebp, esi
0039c 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
003a4 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
003a9 90                             nop        
003aa 90                             nop        
003ab e83013b5ff                     call       0x7f63db743c60
003b0 0f1f8400a8040001               nop        dword ptr [rax + rax + 0x10004a8]
003b8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003bd 41ba40000000                   mov        r10d, 0x40
003c3 442bd5                         sub        r10d, ebp
003c6 c462d1f7d8                     shlx       r11, rax, rbp
003cb c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d5 4d0bda                         or         r11, r10
003d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003dd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e2 e9e6fdffff                     jmp        0x7f63dbbf274d
003e7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003ef 4f8b54020c                     mov        r10, qword ptr [r10 + r8 + 0xc]
003f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f9 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00401 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00406 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040e 90                             nop        
0040f 90                             nop        
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8d700b0000                   jge        0x7f63dbbf3510
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bda                         mov        r11d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d310c0000                   jge        0x7f63dbbf3604
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bda                         mov        ebx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8d1f0d0000                   jge        0x7f63dbbf3718
00479 c4e2d3f7cf                     shrx       rcx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8d020e0000                   jge        0x7f63dbbf3824
004a2 41b801000000                   mov        r8d, 1
004a8 c442d1f7c0                     shlx       r8, r8, rbp
004ad 49ffc8                         dec        r8
004b0 4c23c1                         and        r8, rcx
004b3 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
004bb 418bc9                         mov        ecx, r9d
004be 4103ca                         add        ecx, r10d
004c1 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
004c6 458bd2                         mov        r10d, r10d
004c9 4403d3                         add        r10d, ebx
004cc 4c63c9                         movsxd     r9, ecx
004cf 488b9c2480000000               mov        rbx, qword ptr [rsp + 0x80]
004d7 8bdb                           mov        ebx, ebx
004d9 4c03c3                         add        r8, rbx
004dc 488b9c24e8000000               mov        rbx, qword ptr [rsp + 0xe8]
004e4 4903d9                         add        rbx, r9
004e7 48899c24e8000000               mov        qword ptr [rsp + 0xe8], rbx
004ef 4d85c0                         test       r8, r8
004f2 0f8e2c080000                   jle        0x7f63dbbf32a4
004f8 4981f8ffffff7f                 cmp        r8, 0x7fffffff
004ff 0f8fdf0e0000                   jg         0x7f63dbbf3964
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8fde0f0000                   jg         0x7f63dbbf3a70
00512 81f9ffff0300                   cmp        ecx, 0x3ffff
00518 0f8fe6100000                   jg         0x7f63dbbf3b84
0051e 418bd8                         mov        ebx, r8d
00521 81fb00000010                   cmp        ebx, 0x10000000
00527 0f83e7110000                   jae        0x7f63dbbf3c94
0052d 4d63d2                         movsxd     r10, r10d
00530 4c63c3                         movsxd     r8, ebx
00533 49c1e112                       shl        r9, 0x12
00537 49c1e024                       shl        r8, 0x24
0053b 4d0bc1                         or         r8, r9
0053e 4d0bc2                         or         r8, r10
00541 448b9424c0000000               mov        r10d, dword ptr [rsp + 0xc0]
00549 448b8c24dc000000               mov        r9d, dword ptr [rsp + 0xdc]
00551 4f8944ca10                     mov        qword ptr [r10 + r9*8 + 0x10], r8
00556 8b6c2404                       mov        ebp, dword ptr [rsp + 4]
0055a 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
0055e 0f8daa000000                   jge        0x7f63dbbf2b8e
00564 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0056c 49c1ea30                       shr        r10, 0x30
00570 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
00575 49c1e830                       shr        r8, 0x30
00579 418bca                         mov        ecx, r10d
0057c 458bd0                         mov        r10d, r8d
0057f 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
00587 c4423bf7cb                     shrx       r9d, r11d, r8d
0058c 44038424c8000000               add        r8d, dword ptr [rsp + 0xc8]
00594 c4c23bf7db                     shrx       ebx, r11d, r8d
00599 4403d3                         add        r10d, ebx
0059c 448954246c                     mov        dword ptr [rsp + 0x6c], r10d
005a1 448b8424c8000000               mov        r8d, dword ptr [rsp + 0xc8]
005a9 4183f820                       cmp        r8d, 0x20
005ad 0f8dbd120000                   jge        0x7f63dbbf3df0
005b3 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
005bb 49c1ea30                       shr        r10, 0x30
005bf 418bda                         mov        ebx, r10d
005c2 41ba01000000                   mov        r10d, 1
005c8 c44239f7c2                     shlx       r8d, r10d, r8d
005cd 41ffc8                         dec        r8d
005d0 4523c1                         and        r8d, r9d
005d3 4403c1                         add        r8d, ecx
005d6 4489442448                     mov        dword ptr [rsp + 0x48], r8d
005db 448b9424cc000000               mov        r10d, dword ptr [rsp + 0xcc]
005e3 4183fa20                       cmp        r10d, 0x20
005e7 0f8d4f130000                   jge        0x7f63dbbf3ebc
005ed 41ba01000000                   mov        r10d, 1
005f3 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
005fb c44239f7d2                     shlx       r10d, r10d, r8d
00600 41ffca                         dec        r10d
00603 4523d3                         and        r10d, r11d
00606 4403d3                         add        r10d, ebx
00609 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8df5030000                   jge        0x7f63dbbf2f8d
00618 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0061f 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00624 442344246c                     and        r8d, dword ptr [rsp + 0x6c]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 418b5b18                       mov        ebx, dword ptr [r11 + 0x18]
00632 448b5b08                       mov        r11d, dword ptr [rbx + 8]
00636 453bc3                         cmp        r8d, r11d
00639 0f835a040000                   jae        0x7f63dbbf3019
0063f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00644 4423542470                     and        r10d, dword ptr [rsp + 0x70]
00649 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0064e 418b4b18                       mov        ecx, dword ptr [r11 + 0x18]
00652 448b5908                       mov        r11d, dword ptr [rcx + 8]
00656 4e8b44c310                     mov        r8, qword ptr [rbx + r8*8 + 0x10]
0065b 4c89442478                     mov        qword ptr [rsp + 0x78], r8
00660 453bd3                         cmp        r10d, r11d
00663 0f83ff040000                   jae        0x7f63dbbf30e8
00669 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0066e 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00673 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00678 458b5918                       mov        r11d, dword ptr [r9 + 0x18]
0067c 418b5b08                       mov        ebx, dword ptr [r11 + 8]
00680 4e8b54d110                     mov        r10, qword ptr [rcx + r10*8 + 0x10]
00685 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0068d 443bc3                         cmp        r8d, ebx
00690 0f83aa050000                   jae        0x7f63dbbf31c0
00696 4f8b54c310                     mov        r10, qword ptr [r11 + r8*8 + 0x10]
0069b 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a3 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006aa ffc5                           inc        ebp
006ac 896c2404                       mov        dword ptr [rsp + 4], ebp
006b0 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b4 0f8d24030000                   jge        0x7f63dbbf2f5e
006ba 49c1ea28                       shr        r10, 0x28
006be 458bda                         mov        r11d, r10d
006c1 450fb6d3                       movzx      r10d, r11b
006c5 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
006cd 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
006d2 49c1ea28                       shr        r10, 0x28
006d6 458bd2                         mov        r10d, r10d
006d9 410fb6ea                       movzx      ebp, r10b
006dd 03ac24c8000000                 add        ebp, dword ptr [rsp + 0xc8]
006e4 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
006ec 49c1ea28                       shr        r10, 0x28
006f0 458bd2                         mov        r10d, r10d
006f3 450fb6d2                       movzx      r10d, r10b
006f7 44899424cc000000               mov        dword ptr [rsp + 0xcc], r10d
006ff 4103ea                         add        ebp, r10d
00702 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
00709 41bb01000000                   mov        r11d, 1
0070f 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00717 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0071f 49c1ea20                       shr        r10, 0x20
00723 458bda                         mov        r11d, r10d
00726 410fb6eb                       movzx      ebp, r11b
0072a 896c2474                       mov        dword ptr [rsp + 0x74], ebp
0072e 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00733 49c1ea20                       shr        r10, 0x20
00737 458bd2                         mov        r10d, r10d
0073a 410fb6ea                       movzx      ebp, r10b
0073e 89ac24d4000000                 mov        dword ptr [rsp + 0xd4], ebp
00745 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
0074d 49c1ea20                       shr        r10, 0x20
00751 458bda                         mov        r11d, r10d
00754 410fb6eb                       movzx      ebp, r11b
00758 89ac24d8000000                 mov        dword ptr [rsp + 0xd8], ebp
0075f 448bc5                         mov        r8d, ebp
00762 4403442474                     add        r8d, dword ptr [rsp + 0x74]
00767 44038424d4000000               add        r8d, dword ptr [rsp + 0xd4]
0076f 44038424d0000000               add        r8d, dword ptr [rsp + 0xd0]
00777 4585c0                         test       r8d, r8d
0077a 0f84ac060000                   je         0x7f63dbbf33ac
00780 4183f83f                       cmp        r8d, 0x3f
00784 0f8fca070000                   jg         0x7f63dbbf34d4
0078a b940000000                     mov        ecx, 0x40
0078f 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
00793 443bc1                         cmp        r8d, ecx
00796 7e47                           jle        0x7f63dbbf2d5f
00798 458bc8                         mov        r9d, r8d
0079b 442bc9                         sub        r9d, ecx
0079e 83f940                         cmp        ecx, 0x40
007a1 0f8d7d130000                   jge        0x7f63dbbf40a4
007a7 41ba01000000                   mov        r10d, 1
007ad c442f1f7d2                     shlx       r10, r10, rcx
007b2 49ffca                         dec        r10
007b5 4c23942498000000               and        r10, qword ptr [rsp + 0x98]
007bd c4c2b1f7ea                     shlx       rbp, r10, r9
007c2 41bb40000000                   mov        r11d, 0x40
007c8 452bd9                         sub        r11d, r9d
007cb c462a3f7542420                 shrx       r10, qword ptr [rsp + 0x20], r11
007d2 490bea                         or         rbp, r10
007d5 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
007dd eb30                           jmp        0x7f63dbbf2d8f
007df 412bc8                         sub        ecx, r8d
007e2 c462f3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rcx
007ec 4183f840                       cmp        r8d, 0x40
007f0 0f8d0a120000                   jge        0x7f63dbbf3f80
007f6 41ba01000000                   mov        r10d, 1
007fc c4c2b9f7ea                     shlx       rbp, r10, r8
00801 48ffcd                         dec        rbp
00804 4923e9                         and        rbp, r9
00807 4889ac24e0000000               mov        qword ptr [rsp + 0xe0], rbp
0080f 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00814 4503d0                         add        r10d, r8d
00817 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
0081c 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00821 4503d8                         add        r11d, r8d
00824 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
00829 4183fa40                       cmp        r10d, 0x40
0082d 0f8cddfbffff                   jl         0x7f63dbbf2990
00833 458d5ac0                       lea        r11d, [r10 - 0x40]
00837 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0083c 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00840 83c5f8                         add        ebp, -8
00843 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00847 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084b 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0084f 83c1f0                         add        ecx, -0x10
00852 83f908                         cmp        ecx, 8
00855 0f8c2d010000                   jl         0x7f63dbbf2f08
0085b 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00860 4183c0e8                       add        r8d, -0x18
00864 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
0086c 0f8275fbffff                   jb         0x7f63dbbf2967
00872 bee4ffffff                     mov        esi, 0xffffffe4
00877 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0087f 448b542408                     mov        r10d, dword ptr [rsp + 8]
00884 44891424                       mov        dword ptr [rsp], r10d
00888 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0088d 4489542404                     mov        dword ptr [rsp + 4], r10d
00892 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
00897 4489542408                     mov        dword ptr [rsp + 8], r10d
0089c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
008a1 4c89542410                     mov        qword ptr [rsp + 0x10], r10
008a6 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
008ab 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
008b0 4489542418                     mov        dword ptr [rsp + 0x18], r10d
008b5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
008ba 448954241c                     mov        dword ptr [rsp + 0x1c], r10d
008bf 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
008c4 4489542420                     mov        dword ptr [rsp + 0x20], r10d
008c9 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
008ce 4489542424                     mov        dword ptr [rsp + 0x24], r10d
008d3 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
008d8 4489542428                     mov        dword ptr [rsp + 0x28], r10d
008dd 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
008e2 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
008e7 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
008ec 4489542430                     mov        dword ptr [rsp + 0x30], r10d
008f1 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
008f6 4489542440                     mov        dword ptr [rsp + 0x40], r10d
008fb 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00900 44895c2444                     mov        dword ptr [rsp + 0x44], r11d
00905 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0090a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0090f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00914 4c89542450                     mov        qword ptr [rsp + 0x50], r10
00919 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00921 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00926 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0092e 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00933 448b5c2474                     mov        r11d, dword ptr [rsp + 0x74]
00938 44895c246c                     mov        dword ptr [rsp + 0x6c], r11d
0093d 4489842484000000               mov        dword ptr [rsp + 0x84], r8d
00945 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0094d 44899c249c000000               mov        dword ptr [rsp + 0x9c], r11d
00955 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
0095d 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00965 90                             nop        
00966 90                             nop        
00967 e87478afff                     call       0x7f63db6ea760
0096c 0f1f8400640a0002               nop        dword ptr [rax + rax + 0x2000a64]
00974 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0097e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00982 e8f9d9b318                     call       0x7f63f4730900
00987 f4                             hlt        
00988 85c9                           test       ecx, ecx
0098a 7f08                           jg         0x7f63dbbf2f14
0098c 4533d2                         xor        r10d, r10d
0098f e960faffff                     jmp        0x7f63dbbf2974
00994 890c24                         mov        dword ptr [rsp], ecx
00997 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0099f 8b542408                       mov        edx, dword ptr [rsp + 8]
009a3 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
009aa 90                             nop        
009ab e8300db5ff                     call       0x7f63db743c60
009b0 0f1f8400a80a0003               nop        dword ptr [rax + rax + 0x3000aa8]
009b8 448b542408                     mov        r10d, dword ptr [rsp + 8]
009bd 41c1e203                       shl        r10d, 3
009c1 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009c6 41c1e303                       shl        r11d, 3
009ca 452bd3                         sub        r10d, r11d
009cd 4181c2c0000000                 add        r10d, 0xc0
009d4 c462a9f7d0                     shlx       r10, rax, r10
009d9 e916faffff                     jmp        0x7f63dbbf2974
009de 4533d2                         xor        r10d, r10d
009e1 33ed                           xor        ebp, ebp
009e3 4533c0                         xor        r8d, r8d
009e6 4533db                         xor        r11d, r11d
009e9 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009f1 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009f8 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
00a00 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
00a08 e90afdffff                     jmp        0x7f63dbbf2c97
00a0d 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a15 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a1d 4d03c2                         add        r8, r10
00a20 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a28 4d3bc2                         cmp        r8, r10
00a2b 7f29                           jg         0x7f63dbbf2fd6
00a2d 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a32 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a3a 0f8524180000                   jne        0x7f63dbbf47e4
00a40 418bc0                         mov        eax, r8d
00a43 4881c410010000                 add        rsp, 0x110
00a4a 5d                             pop        rbp
00a4b 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a4f 0f87411a0000                   ja         0x7f63dbbf4a16
00a55 c3                             ret        
00a56 48be486d32e300000000           movabs     rsi, 0xe3326d48
00a60 90                             nop        
00a61 90                             nop        
00a62 90                             nop        
00a63 e8780cb5ff                     call       0x7f63db743c60
00a68 0f1f8400600b0004               nop        dword ptr [rax + rax + 0x4000b60]
00a70 4885c0                         test       rax, rax
00a73 0f84c3170000                   je         0x7f63dbbf47bc
00a79 488bf0                         mov        rsi, rax
00a7c 4881c410010000                 add        rsp, 0x110
00a83 5d                             pop        rbp
00a84 e957ffaeff                     jmp        0x7f63db6e2f60
00a89 4533d2                         xor        r10d, r10d
00a8c 4533db                         xor        r11d, r11d
00a8f 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a94 e934f7ffff                     jmp        0x7f63dbbf274d
00a99 bee4ffffff                     mov        esi, 0xffffffe4
00a9e 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00aa6 448b542408                     mov        r10d, dword ptr [rsp + 8]
00aab 44891424                       mov        dword ptr [rsp], r10d
00aaf 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00ab4 44895c2404                     mov        dword ptr [rsp + 4], r11d
00ab9 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00abe 4489542408                     mov        dword ptr [rsp + 8], r10d
00ac3 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ac8 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00acd 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00ad2 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ad7 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00adc 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00ae1 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00ae6 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00aeb 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00af0 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00af5 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00afa 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00aff 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00b04 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00b09 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00b0e 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00b13 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00b18 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b1d 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b22 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b27 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00b2c 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00b31 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00b36 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00b3b 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00b3f 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b44 90                             nop        
00b45 90                             nop        
00b46 90                             nop        
00b47 e89476afff                     call       0x7f63db6ea760
00b4c 0f1f8400440c0005               nop        dword ptr [rax + rax + 0x5000c44]
00b54 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
00b5e 4883e4f0                       and        rsp, 0xfffffffffffffff0
00b62 e819d8b318                     call       0x7f63f4730900
00b67 f4                             hlt        
00b68 bee4ffffff                     mov        esi, 0xffffffe4
00b6d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b75 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b7a 44891c24                       mov        dword ptr [rsp], r11d
00b7e 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b83 4489442404                     mov        dword ptr [rsp + 4], r8d
00b88 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b8d 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b92 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b97 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b9c 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00ba1 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00ba6 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00bab 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00bb0 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00bb5 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00bba 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00bbf 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00bc4 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00bc9 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00bce 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00bd3 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00bd8 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00bdd 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00be2 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00be7 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00bec 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00bf1 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00bf6 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00bfb 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00c00 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00c05 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00c0a 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00c0f 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00c14 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00c18 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00c1d 90                             nop        
00c1e 90                             nop        
00c1f e8bc75afff                     call       0x7f63db6ea760
00c24 0f1f84001c0d0006               nop        dword ptr [rax + rax + 0x6000d1c]
00c2c 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
00c36 4883e4f0                       and        rsp, 0xfffffffffffffff0
00c3a e841d7b318                     call       0x7f63f4730900
00c3f f4                             hlt        
00c40 bee4ffffff                     mov        esi, 0xffffffe4
00c45 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c4d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00c52 44891424                       mov        dword ptr [rsp], r10d
00c56 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c5b 44894c2404                     mov        dword ptr [rsp + 4], r9d
00c60 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c65 4489542408                     mov        dword ptr [rsp + 8], r10d
00c6a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c6f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c74 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00c79 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c7e 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c83 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c88 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c8d 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c92 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c97 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c9c 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00ca1 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00ca6 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00cab 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00cb0 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00cb5 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00cba 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
00cbf 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00cc4 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00cc9 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00cce 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00cd3 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00cd8 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00cdd 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00ce2 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00ce7 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cec 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00cf4 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cf9 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00cfe 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00d03 e8d874afff                     call       0x7f63db6ea760
00d08 0f1f8400000e0007               nop        dword ptr [rax + rax + 0x7000e00]
00d10 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
00d1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00d1e e85dd6b318                     call       0x7f63f4730900
00d23 f4                             hlt        
00d24 4533c9                         xor        r9d, r9d
00d27 4d3bc1                         cmp        r8, r9
00d2a bdffffffff                     mov        ebp, 0xffffffff
00d2f 7c08                           jl         0x7f63dbbf32b9
00d31 400f95c5                       setne      bpl
00d35 400fb6ed                       movzx      ebp, bpl
00d39 be45ffffff                     mov        esi, 0xffffff45
00d3e 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00d46 4c890c24                       mov        qword ptr [rsp], r9
00d4a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00d4f 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00d54 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00d5c 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00d61 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00d66 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00d6b 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00d6f 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00d73 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00d78 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00d7d 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00d81 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00d85 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00d8a 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00d8f 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00d93 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00d97 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
00d9c 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00da1 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00da8 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00dac 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00db1 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00db6 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00dba 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00dbe 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00dc3 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00dc8 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00dcd 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00dd2 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00dda 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00ddf 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00de7 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00dec 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00df4 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00dfb 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00e03 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00e0b e8d073afff                     call       0x7f63db6ea760
00e10 0f1f8400080f0008               nop        dword ptr [rax + rax + 0x8000f08]
00e18 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
00e22 4883e4f0                       and        rsp, 0xfffffffffffffff0
00e26 e855d5b318                     call       0x7f63f4730900
00e2b f4                             hlt        
00e2c be45ffffff                     mov        esi, 0xffffff45
00e31 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00e39 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00e3e 44891c24                       mov        dword ptr [rsp], r11d
00e42 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00e47 4489542404                     mov        dword ptr [rsp + 4], r10d
00e4c 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00e51 44895c2408                     mov        dword ptr [rsp + 8], r11d
00e56 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00e5e 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e63 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e68 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e6d 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e72 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e77 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e7c 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e81 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e86 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e8b 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e90 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e95 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00e9a 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e9f 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00ea4 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00ea9 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00eae 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00eb3 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00eb8 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00ebd 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00ec2 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00ec7 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00ecc 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00ed1 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00ed6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00edb 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00ee0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00ee8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00eed 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00ef5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00efa 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00f02 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00f0a 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00f12 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00f1a 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00f22 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00f2a 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00f32 90                             nop        
00f33 e8a872afff                     call       0x7f63db6ea760
00f38 0f1f840030100009               nop        dword ptr [rax + rax + 0x9001030]
00f40 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
00f4a 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f4e e82dd4b318                     call       0x7f63f4730900
00f53 f4                             hlt        
00f54 be45ffffff                     mov        esi, 0xffffff45
00f59 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f61 448b542408                     mov        r10d, dword ptr [rsp + 8]
00f66 44891424                       mov        dword ptr [rsp], r10d
00f6a 4489442408                     mov        dword ptr [rsp + 8], r8d
00f6f e86c72afff                     call       0x7f63db6ea760
00f74 0f1f84006c10000a               nop        dword ptr [rax + rax + 0xa00106c]
00f7c 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
00f86 4883e4f0                       and        rsp, 0xfffffffffffffff0
00f8a e8f1d3b318                     call       0x7f63f4730900
00f8f f4                             hlt        
00f90 be45ffffff                     mov        esi, 0xffffff45
00f95 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00f9d 448b542408                     mov        r10d, dword ptr [rsp + 8]
00fa2 44891424                       mov        dword ptr [rsp], r10d
00fa6 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00fab 44895c2404                     mov        dword ptr [rsp + 4], r11d
00fb0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00fb5 4489542408                     mov        dword ptr [rsp + 8], r10d
00fba 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00fc2 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00fc7 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00fcc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00fd1 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00fd6 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00fdb 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00fe0 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00fe5 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00fea 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00fef 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00ff4 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ff9 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ffe 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01003 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01008 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0100d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01012 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01017 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0101c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01021 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01026 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0102b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01030 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01035 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
0103a 4489542450                     mov        dword ptr [rsp + 0x50], r10d
0103f 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01044 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01049 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01051 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01056 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
0105e 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01063 e87871afff                     call       0x7f63db6ea760
01068 0f1f84006011000b               nop        dword ptr [rax + rax + 0xb001160]
01070 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0107a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0107e e8fdd2b318                     call       0x7f63f4730900
01083 f4                             hlt        
01084 be45ffffff                     mov        esi, 0xffffff45
01089 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01091 448b442408                     mov        r8d, dword ptr [rsp + 8]
01096 44890424                       mov        dword ptr [rsp], r8d
0109a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0109f 4489542404                     mov        dword ptr [rsp + 4], r10d
010a4 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
010a9 4489442408                     mov        dword ptr [rsp + 8], r8d
010ae 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
010b6 4c89542410                     mov        qword ptr [rsp + 0x10], r10
010bb 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
010c0 4c89542418                     mov        qword ptr [rsp + 0x18], r10
010c5 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
010ca 448954240c                     mov        dword ptr [rsp + 0xc], r10d
010cf 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
010d4 4489442420                     mov        dword ptr [rsp + 0x20], r8d
010d9 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
010de 4489542424                     mov        dword ptr [rsp + 0x24], r10d
010e3 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
010e8 4489442428                     mov        dword ptr [rsp + 0x28], r8d
010ed 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
010f2 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
010f7 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
010fc 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01101 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01106 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0110b 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01110 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01115 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0111a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0111f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01124 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01129 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0112e 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01133 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01138 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0113d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01145 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0114a 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01152 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01157 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
0115f 4489542478                     mov        dword ptr [rsp + 0x78], r10d
01164 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
0116c 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
01174 90                             nop        
01175 90                             nop        
01176 90                             nop        
01177 e86470afff                     call       0x7f63db6ea760
0117c 0f1f84007412000c               nop        dword ptr [rax + rax + 0xc001274]
01184 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0118e 4883e4f0                       and        rsp, 0xfffffffffffffff0
01192 e8e9d1b318                     call       0x7f63f4730900
01197 f4                             hlt        
01198 be45ffffff                     mov        esi, 0xffffff45
0119d 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011a5 448b542408                     mov        r10d, dword ptr [rsp + 8]
011aa 44891424                       mov        dword ptr [rsp], r10d
011ae 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
011b3 4489442404                     mov        dword ptr [rsp + 4], r8d
011b8 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
011bd 4489542408                     mov        dword ptr [rsp + 8], r10d
011c2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
011ca 4c89542410                     mov        qword ptr [rsp + 0x10], r10
011cf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
011d4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
011d9 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
011de 448954240c                     mov        dword ptr [rsp + 0xc], r10d
011e3 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
011e8 4489442420                     mov        dword ptr [rsp + 0x20], r8d
011ed 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
011f2 4489542424                     mov        dword ptr [rsp + 0x24], r10d
011f7 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
011fc 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01201 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01206 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0120b 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01210 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01215 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
0121a 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0121f 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01224 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01229 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0122e 4489442448                     mov        dword ptr [rsp + 0x48], r8d
01233 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01238 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
0123d 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
01242 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01247 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
0124c 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01251 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01259 4c89542460                     mov        qword ptr [rsp + 0x60], r10
0125e 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01266 4c89542468                     mov        qword ptr [rsp + 0x68], r10
0126b 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
01273 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
0127a 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
01282 90                             nop        
01283 e8586fafff                     call       0x7f63db6ea760
01288 0f1f84008013000d               nop        dword ptr [rax + rax + 0xd001380]
01290 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0129a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0129e e8ddd0b318                     call       0x7f63f4730900
012a3 f4                             hlt        
012a4 be45ffffff                     mov        esi, 0xffffff45
012a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
012b1 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
012b6 44890c24                       mov        dword ptr [rsp], r9d
012ba 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
012bf 4489442404                     mov        dword ptr [rsp + 4], r8d
012c4 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
012c9 44894c2408                     mov        dword ptr [rsp + 8], r9d
012ce 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
012d6 4c89442410                     mov        qword ptr [rsp + 0x10], r8
012db 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
012e0 4c89442418                     mov        qword ptr [rsp + 0x18], r8
012e5 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
012ea 448944240c                     mov        dword ptr [rsp + 0xc], r8d
012ef 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
012f4 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
012f9 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
012fe 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01303 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01308 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
0130d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01312 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01317 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0131c 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01321 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01326 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0132b 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01330 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01335 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
0133a 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
0133f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
01344 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01349 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
0134e 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01353 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01358 4c89442458                     mov        qword ptr [rsp + 0x58], r8
0135d 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
01365 4c89442460                     mov        qword ptr [rsp + 0x60], r8
0136a 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
01372 4c89442468                     mov        qword ptr [rsp + 0x68], r8
01377 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
0137c 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
01383 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
0138b 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
01393 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
0139b 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
013a3 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
013ab 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
013b3 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
013bb 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
013c3 e8186eafff                     call       0x7f63db6ea760
013c8 0f1f8400c014000e               nop        dword ptr [rax + rax + 0xe0014c0]
013d0 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
013da 4883e4f0                       and        rsp, 0xfffffffffffffff0
013de e89dcfb318                     call       0x7f63f4730900
013e3 f4                             hlt        
013e4 41b9ffffff7f                   mov        r9d, 0x7fffffff
013ea 4d3bc1                         cmp        r8, r9
013ed bdffffffff                     mov        ebp, 0xffffffff
013f2 7c08                           jl         0x7f63dbbf397c
013f4 400f95c5                       setne      bpl
013f8 400fb6ed                       movzx      ebp, bpl
013fc be45ffffff                     mov        esi, 0xffffff45
01401 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
01409 4c890c24                       mov        qword ptr [rsp], r9
0140d 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
01411 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01415 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
0141d 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01422 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01427 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
0142c 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
01430 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01434 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01439 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
0143e 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
01442 895c2434                       mov        dword ptr [rsp + 0x34], ebx
01446 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0144b 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01450 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01454 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
01458 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
0145d 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01462 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
01469 895c2444                       mov        dword ptr [rsp + 0x44], ebx
0146d 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01472 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
01477 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0147b 895c2454                       mov        dword ptr [rsp + 0x54], ebx
0147f 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01484 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
01489 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
0148e 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
01493 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
0149b 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
014a0 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
014a8 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
014ad 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
014b5 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
014bc 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
014c4 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
014cc 90                             nop        
014cd 90                             nop        
014ce 90                             nop        
014cf e80c6dafff                     call       0x7f63db6ea760
014d4 0f1f8400cc15000f               nop        dword ptr [rax + rax + 0xf0015cc]
014dc 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
014e6 4883e4f0                       and        rsp, 0xfffffffffffffff0
014ea e891ceb318                     call       0x7f63f4730900
014ef f4                             hlt        
014f0 be45ffffff                     mov        esi, 0xffffff45
014f5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
014fd 448b442408                     mov        r8d, dword ptr [rsp + 8]
01502 44890424                       mov        dword ptr [rsp], r8d
01506 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0150b 4489442404                     mov        dword ptr [rsp + 4], r8d
01510 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01515 44894c2408                     mov        dword ptr [rsp + 8], r9d
0151a 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
01522 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01527 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0152c 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01531 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01536 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0153b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01540 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01545 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0154a 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0154f 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01554 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01559 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0155e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01563 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01568 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0156d 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01572 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01577 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0157c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01581 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01586 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0158b 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
01590 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
01595 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0159a 4489442450                     mov        dword ptr [rsp + 0x50], r8d
0159f 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
015a4 4c89442458                     mov        qword ptr [rsp + 0x58], r8
015a9 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
015b1 4c89442460                     mov        qword ptr [rsp + 0x60], r8
015b6 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
015be 4c89442468                     mov        qword ptr [rsp + 0x68], r8
015c3 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
015c8 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
015d0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
015d8 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
015e0 90                             nop        
015e1 90                             nop        
015e2 90                             nop        
015e3 e8f86bafff                     call       0x7f63db6ea760
015e8 0f1f8400e0160010               nop        dword ptr [rax + rax + 0x100016e0]
015f0 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
015fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
015fe e87dcdb318                     call       0x7f63f4730900
01603 f4                             hlt        
01604 be45ffffff                     mov        esi, 0xffffff45
01609 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01611 448b442408                     mov        r8d, dword ptr [rsp + 8]
01616 44890424                       mov        dword ptr [rsp], r8d
0161a 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0161f 4489442404                     mov        dword ptr [rsp + 4], r8d
01624 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01629 4489542408                     mov        dword ptr [rsp + 8], r10d
0162e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01636 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0163b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01640 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01645 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0164a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0164f 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01654 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01659 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0165e 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01663 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01668 4489542428                     mov        dword ptr [rsp + 0x28], r10d
0166d 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
01672 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01677 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
0167c 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01681 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01686 4489442434                     mov        dword ptr [rsp + 0x34], r8d
0168b 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01690 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01695 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
0169a 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0169f 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
016a4 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
016a9 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
016ae 4489542450                     mov        dword ptr [rsp + 0x50], r10d
016b3 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
016b8 4c89542458                     mov        qword ptr [rsp + 0x58], r10
016bd 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
016c5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
016ca 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
016d2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
016d7 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
016dc 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
016e3 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
016eb 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
016f3 e8e86aafff                     call       0x7f63db6ea760
016f8 0f1f8400f0170011               nop        dword ptr [rax + rax + 0x110017f0]
01700 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0170a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0170e e86dccb318                     call       0x7f63f4730900
01713 f4                             hlt        
01714 be3dffffff                     mov        esi, 0xffffff3d
01719 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01721 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01726 44890c24                       mov        dword ptr [rsp], r9d
0172a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
0172f 44894c2404                     mov        dword ptr [rsp + 4], r9d
01734 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01739 44894c2408                     mov        dword ptr [rsp + 8], r9d
0173e 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
01746 4c89442410                     mov        qword ptr [rsp + 0x10], r8
0174b 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01750 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01755 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0175a 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0175f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01764 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01769 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0176e 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
01773 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01778 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0177d 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
01782 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01787 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0178c 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01791 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01796 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
0179b 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
017a0 4489442438                     mov        dword ptr [rsp + 0x38], r8d
017a5 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
017ad 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
017b2 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
017b7 4489442448                     mov        dword ptr [rsp + 0x48], r8d
017bc 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
017c1 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
017c6 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
017cb 4489442450                     mov        dword ptr [rsp + 0x50], r8d
017d0 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
017d5 4c89442458                     mov        qword ptr [rsp + 0x58], r8
017da 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
017e2 4c89442460                     mov        qword ptr [rsp + 0x60], r8
017e7 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
017ef 4c89442468                     mov        qword ptr [rsp + 0x68], r8
017f4 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
017f9 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
01801 898c2490000000                 mov        dword ptr [rsp + 0x90], ecx
01808 899c2494000000                 mov        dword ptr [rsp + 0x94], ebx
0180f 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
01817 44899c2498000000               mov        dword ptr [rsp + 0x98], r11d
0181f 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
01827 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
0182f 448b9c24bc000000               mov        r11d, dword ptr [rsp + 0xbc]
01837 448b9424b8000000               mov        r10d, dword ptr [rsp + 0xb8]
0183f 44899424a4000000               mov        dword ptr [rsp + 0xa4], r10d
01847 44899c24b8000000               mov        dword ptr [rsp + 0xb8], r11d
0184f e88c69afff                     call       0x7f63db6ea760
01854 0f1f84004c190012               nop        dword ptr [rax + rax + 0x1200194c]
0185c 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01866 4883e4f0                       and        rsp, 0xfffffffffffffff0
0186a e811cbb318                     call       0x7f63f4730900
0186f f4                             hlt        
01870 be45ffffff                     mov        esi, 0xffffff45
01875 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0187d 448b542408                     mov        r10d, dword ptr [rsp + 8]
01882 44891424                       mov        dword ptr [rsp], r10d
01886 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0188b 4489542404                     mov        dword ptr [rsp + 4], r10d
01890 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01895 4489542408                     mov        dword ptr [rsp + 8], r10d
0189a 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0189f 4c89542418                     mov        qword ptr [rsp + 0x18], r10
018a4 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
018a9 448944240c                     mov        dword ptr [rsp + 0xc], r8d
018ae 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
018b3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
018b8 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
018bd 4489442424                     mov        dword ptr [rsp + 0x24], r8d
018c2 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
018c7 4489542428                     mov        dword ptr [rsp + 0x28], r10d
018cc 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
018d1 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
018d6 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
018db 4489542430                     mov        dword ptr [rsp + 0x30], r10d
018e0 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
018e5 4489542440                     mov        dword ptr [rsp + 0x40], r10d
018ea 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
018ef 4489442444                     mov        dword ptr [rsp + 0x44], r8d
018f4 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
018f9 4489542448                     mov        dword ptr [rsp + 0x48], r10d
018fe 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01906 4c89542450                     mov        qword ptr [rsp + 0x50], r10
0190b 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
01910 894c2460                       mov        dword ptr [rsp + 0x60], ecx
01914 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
01919 90                             nop        
0191a 90                             nop        
0191b e8c068afff                     call       0x7f63db6ea760
01920 0f1f8400181a0013               nop        dword ptr [rax + rax + 0x13001a18]
01928 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01932 4883e4f0                       and        rsp, 0xfffffffffffffff0
01936 e845cab318                     call       0x7f63f4730900
0193b f4                             hlt        
0193c be45ffffff                     mov        esi, 0xffffff45
01941 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01949 448b442408                     mov        r8d, dword ptr [rsp + 8]
0194e 44890424                       mov        dword ptr [rsp], r8d
01952 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01957 4489542404                     mov        dword ptr [rsp + 4], r10d
0195c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01961 4489442408                     mov        dword ptr [rsp + 8], r8d
01966 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0196b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01970 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01975 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0197a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0197f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01984 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01989 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0198e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01993 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01998 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0199d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
019a2 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
019a7 4489542430                     mov        dword ptr [rsp + 0x30], r10d
019ac 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
019b1 4489442434                     mov        dword ptr [rsp + 0x34], r8d
019b6 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
019bb 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
019c0 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
019c5 4489542448                     mov        dword ptr [rsp + 0x48], r10d
019ca 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
019cf 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
019d4 895c2454                       mov        dword ptr [rsp + 0x54], ebx
019d8 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
019dd 90                             nop        
019de 90                             nop        
019df e8fc67afff                     call       0x7f63db6ea760
019e4 0f1f8400dc1a0014               nop        dword ptr [rax + rax + 0x14001adc]
019ec 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
019f6 4883e4f0                       and        rsp, 0xfffffffffffffff0
019fa e881c9b318                     call       0x7f63f4730900
019ff f4                             hlt        
01a00 be45ffffff                     mov        esi, 0xffffff45
01a05 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01a0d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01a12 44891c24                       mov        dword ptr [rsp], r11d
01a16 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
01a1b 44895c2404                     mov        dword ptr [rsp + 4], r11d
01a20 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01a25 44895c2408                     mov        dword ptr [rsp + 8], r11d
01a2a 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01a32 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01a37 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01a3c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01a41 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01a46 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01a4b 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01a50 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01a55 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01a5a 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01a5f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01a64 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01a69 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01a6e 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01a73 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01a78 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01a7d 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
01a82 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
01a87 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
01a8c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01a91 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01a96 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01a9b 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
01aa0 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
01aa5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01aaa 4489542450                     mov        dword ptr [rsp + 0x50], r10d
01aaf 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01ab4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01ab9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01ac1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01ac6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01ace 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01ad3 4c898c2490000000               mov        qword ptr [rsp + 0x90], r9
01adb 4489842498000000               mov        dword ptr [rsp + 0x98], r8d
01ae3 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
01aeb 448994249c000000               mov        dword ptr [rsp + 0x9c], r10d
01af3 448b9c24a4000000               mov        r11d, dword ptr [rsp + 0xa4]
01afb 44899c24a0000000               mov        dword ptr [rsp + 0xa0], r11d
01b03 e8d866afff                     call       0x7f63db6ea760
01b08 0f1f8400001c0015               nop        dword ptr [rax + rax + 0x15001c00]
01b10 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01b1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01b1e e85dc8b318                     call       0x7f63f4730900
01b23 f4                             hlt        
01b24 be45ffffff                     mov        esi, 0xffffff45
01b29 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b31 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01b36 44891c24                       mov        dword ptr [rsp], r11d
01b3a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01b3f 4489542404                     mov        dword ptr [rsp + 4], r10d
01b44 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01b49 44895c2408                     mov        dword ptr [rsp + 8], r11d
01b4e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01b53 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01b58 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
01b5d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01b62 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
01b67 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
01b6c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
01b71 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01b76 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
01b7b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
01b80 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01b85 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01b8a 448b5c2448                     mov        r11d, dword ptr [rsp + 0x48]
01b8f 44895c2430                     mov        dword ptr [rsp + 0x30], r11d
01b94 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01b99 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01b9e 448b5c246c                     mov        r11d, dword ptr [rsp + 0x6c]
01ba3 44895c2438                     mov        dword ptr [rsp + 0x38], r11d
01ba8 448b5c2460                     mov        r11d, dword ptr [rsp + 0x60]
01bad 44895c2448                     mov        dword ptr [rsp + 0x48], r11d
01bb2 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01bb7 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01bbc 448b5c2468                     mov        r11d, dword ptr [rsp + 0x68]
01bc1 44895c2450                     mov        dword ptr [rsp + 0x50], r11d
01bc6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01bcb 4c89542458                     mov        qword ptr [rsp + 0x58], r10
01bd0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
01bd8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
01bdd 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
01be5 4c89542468                     mov        qword ptr [rsp + 0x68], r10
01bea 448984248c000000               mov        dword ptr [rsp + 0x8c], r8d
01bf2 44898c2490000000               mov        dword ptr [rsp + 0x90], r9d
01bfa 898c2494000000                 mov        dword ptr [rsp + 0x94], ecx
01c01 90                             nop        
01c02 90                             nop        
01c03 e8d865afff                     call       0x7f63db6ea760
01c08 0f1f8400001d0016               nop        dword ptr [rax + rax + 0x16001d00]
01c10 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01c1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c1e e85dc7b318                     call       0x7f63f4730900
01c23 f4                             hlt        
01c24 4585c0                         test       r8d, r8d
01c27 7f08                           jg         0x7f63dbbf41b1
01c29 4533ed                         xor        r13d, r13d
01c2c e994e4ffff                     jmp        0x7f63dbbf2645
01c31 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01c35 89742428                       mov        dword ptr [rsp + 0x28], esi
01c39 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01c3d 894c2418                       mov        dword ptr [rsp + 0x18], ecx
01c41 44895c2414                     mov        dword ptr [rsp + 0x14], r11d
01c46 4489542410                     mov        dword ptr [rsp + 0x10], r10d
01c4b 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01c50 48894424f8                     mov        qword ptr [rsp - 8], rax
01c55 8b0424                         mov        eax, dword ptr [rsp]
01c58 89442404                       mov        dword ptr [rsp + 4], eax
01c5c 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c61 48894424f8                     mov        qword ptr [rsp - 8], rax
01c66 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01c6d 890424                         mov        dword ptr [rsp], eax
01c70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01c75 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01c7d 488bf5                         mov        rsi, rbp
01c80 8b542408                       mov        edx, dword ptr [rsp + 8]
01c84 418bc8                         mov        ecx, r8d
01c87 e854fab4ff                     call       0x7f63db743c60
01c8c 0f1f8400841d0017               nop        dword ptr [rax + rax + 0x17001d84]
01c94 41bb40000000                   mov        r11d, 0x40
01c9a 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01c9f c462a1f7e8                     shlx       r13, rax, r11
01ca4 48894424f8                     mov        qword ptr [rsp - 8], rax
01ca9 8b442404                       mov        eax, dword ptr [rsp + 4]
01cad 890424                         mov        dword ptr [rsp], eax
01cb0 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01cb5 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01cba 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01cbf 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01cc4 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01cc8 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01ccc 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01cd0 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01cd4 e9ece3ffff                     jmp        0x7f63dbbf2645
01cd9 4585c0                         test       r8d, r8d
01cdc 7f08                           jg         0x7f63dbbf4266
01cde 4533f6                         xor        r14d, r14d
01ce1 e921e4ffff                     jmp        0x7f63dbbf2687
01ce6 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01ceb 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01cf0 89542428                       mov        dword ptr [rsp + 0x28], edx
01cf4 8974241c                       mov        dword ptr [rsp + 0x1c], esi
01cf8 897c2418                       mov        dword ptr [rsp + 0x18], edi
01cfc 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01d00 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01d05 448954240c                     mov        dword ptr [rsp + 0xc], r10d
01d0a 48894424f8                     mov        qword ptr [rsp - 8], rax
01d0f 8b0424                         mov        eax, dword ptr [rsp]
01d12 89442404                       mov        dword ptr [rsp + 4], eax
01d16 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d1b 48894424f8                     mov        qword ptr [rsp - 8], rax
01d20 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d27 890424                         mov        dword ptr [rsp], eax
01d2a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d2f 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01d37 488bf5                         mov        rsi, rbp
01d3a 8b542408                       mov        edx, dword ptr [rsp + 8]
01d3e 418bc8                         mov        ecx, r8d
01d41 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01d45 90                             nop        
01d46 90                             nop        
01d47 e894f9b4ff                     call       0x7f63db743c60
01d4c 0f1f8400441e0018               nop        dword ptr [rax + rax + 0x18001e44]
01d54 41ba80000000                   mov        r10d, 0x80
01d5a 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
01d5f c462a9f7f0                     shlx       r14, rax, r10
01d64 48894424f8                     mov        qword ptr [rsp - 8], rax
01d69 8b442404                       mov        eax, dword ptr [rsp + 4]
01d6d 890424                         mov        dword ptr [rsp], eax
01d70 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d75 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01d7a 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01d7f 8b7c2418                       mov        edi, dword ptr [rsp + 0x18]
01d83 8b74241c                       mov        esi, dword ptr [rsp + 0x1c]
01d87 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01d8b 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01d90 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01d95 e96de3ffff                     jmp        0x7f63dbbf2687
01d9a 4533c0                         xor        r8d, r8d
01d9d e973ecffff                     jmp        0x7f63dbbf2f95
01da2 bee4ffffff                     mov        esi, 0xffffffe4
01da7 48ffb42490000000               push       qword ptr [rsp + 0x90]
01daf 488f0424                       pop        qword ptr [rsp]
01db3 e82864afff                     call       0x7f63db6ea760
01db8 0f1f8400b01e0019               nop        dword ptr [rax + rax + 0x19001eb0]
01dc0 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01dca 4883e4f0                       and        rsp, 0xfffffffffffffff0
01dce e8adc5b318                     call       0x7f63f4730900
01dd3 f4                             hlt        
01dd4 be5d000000                     mov        esi, 0x5d
01dd9 90                             nop        
01dda 90                             nop        
01ddb e80064afff                     call       0x7f63db6ea760
01de0 0f1f8400d81e001a               nop        dword ptr [rax + rax + 0x1a001ed8]
01de8 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01df2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01df6 e885c5b318                     call       0x7f63f4730900
01dfb f4                             hlt        
01dfc bef6ffffff                     mov        esi, 0xfffffff6
01e01 90                             nop        
01e02 90                             nop        
01e03 e8d863afff                     call       0x7f63db6ea760
01e08 0f1f8400001f001b               nop        dword ptr [rax + rax + 0x1b001f00]
01e10 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01e1a 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e1e e85dc5b318                     call       0x7f63f4730900
01e23 f4                             hlt        
01e24 bef6ffffff                     mov        esi, 0xfffffff6
01e29 90                             nop        
01e2a 90                             nop        
01e2b e8b063afff                     call       0x7f63db6ea760
01e30 0f1f8400281f001c               nop        dword ptr [rax + rax + 0x1c001f28]
01e38 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01e42 4883e4f0                       and        rsp, 0xfffffffffffffff0
01e46 e835c5b318                     call       0x7f63f4730900
01e4b f4                             hlt        
01e4c be6effffff                     mov        esi, 0xffffff6e
01e51 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e59 448b542408                     mov        r10d, dword ptr [rsp + 8]
01e5e 44891424                       mov        dword ptr [rsp], r10d
01e62 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01e67 4489542408                     mov        dword ptr [rsp + 8], r10d
01e6c 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01e71 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e76 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01e7b 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01e80 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01e85 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01e8a 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01e8f 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01e94 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01e99 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01e9e 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ea3 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ea8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ead 4489542430                     mov        dword ptr [rsp + 0x30], r10d
01eb2 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01eb7 895c2440                       mov        dword ptr [rsp + 0x40], ebx
01ebb 897c2444                       mov        dword ptr [rsp + 0x44], edi
01ebf 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
01ec4 4489542448                     mov        dword ptr [rsp + 0x48], r10d
01ec9 90                             nop        
01eca 90                             nop        
01ecb e81063afff                     call       0x7f63db6ea760
01ed0 0f1f8400c81f001d               nop        dword ptr [rax + rax + 0x1d001fc8]
01ed8 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01ee2 4883e4f0                       and        rsp, 0xfffffffffffffff0
01ee6 e895c4b318                     call       0x7f63f4730900
01eeb f4                             hlt        
01eec bee4ffffff                     mov        esi, 0xffffffe4
01ef1 48ffb42490000000               push       qword ptr [rsp + 0x90]
01ef9 488f0424                       pop        qword ptr [rsp]
01efd 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01f02 48894424f8                     mov        qword ptr [rsp - 8], rax
01f07 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01f0e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01f12 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f17 897c2430                       mov        dword ptr [rsp + 0x30], edi
01f1b 89542434                       mov        dword ptr [rsp + 0x34], edx
01f1f e8bc62afff                     call       0x7f63db6ea760
01f24 0f1f84001c20001e               nop        dword ptr [rax + rax + 0x1e00201c]
01f2c 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01f36 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f3a e841c4b318                     call       0x7f63f4730900
01f3f f4                             hlt        
01f40 bee4ffffff                     mov        esi, 0xffffffe4
01f45 48ffb42490000000               push       qword ptr [rsp + 0x90]
01f4d 488f0424                       pop        qword ptr [rsp]
01f51 48894424f8                     mov        qword ptr [rsp - 8], rax
01f56 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01f5d 89442418                       mov        dword ptr [rsp + 0x18], eax
01f61 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01f66 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01f6a 89542430                       mov        dword ptr [rsp + 0x30], edx
01f6e 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01f73 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01f78 90                             nop        
01f79 90                             nop        
01f7a 90                             nop        
01f7b e86062afff                     call       0x7f63db6ea760
01f80 0f1f84007820001f               nop        dword ptr [rax + rax + 0x1f002078]
01f88 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
01f92 4883e4f0                       and        rsp, 0xfffffffffffffff0
01f96 e8e5c3b318                     call       0x7f63f4730900
01f9b f4                             hlt        
01f9c bebeffffff                     mov        esi, 0xffffffbe
01fa1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01fa9 448b542408                     mov        r10d, dword ptr [rsp + 8]
01fae 44891424                       mov        dword ptr [rsp], r10d
01fb2 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01fb7 4489542408                     mov        dword ptr [rsp + 8], r10d
01fbc 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01fc1 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01fc6 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
01fcb 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
01fd0 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01fd5 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01fda 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
01fdf 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
01fe4 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01fe9 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01fee 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
01ff3 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
01ff8 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01ffd 4489542430                     mov        dword ptr [rsp + 0x30], r10d
02002 4489442438                     mov        dword ptr [rsp + 0x38], r8d
02007 895c2440                       mov        dword ptr [rsp + 0x40], ebx
0200b 897c2444                       mov        dword ptr [rsp + 0x44], edi
0200f 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
02014 4489542448                     mov        dword ptr [rsp + 0x48], r10d
02019 90                             nop        
0201a 90                             nop        
0201b e8c061afff                     call       0x7f63db6ea760
02020 0f1f840018210020               nop        dword ptr [rax + rax + 0x20002118]
02028 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02032 4883e4f0                       and        rsp, 0xfffffffffffffff0
02036 e845c3b318                     call       0x7f63f4730900
0203b f4                             hlt        
0203c beccffffff                     mov        esi, 0xffffffcc
02041 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02049 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0204e 44890c24                       mov        dword ptr [rsp], r9d
02052 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
02057 48894424f8                     mov        qword ptr [rsp - 8], rax
0205c 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
02063 89442414                       mov        dword ptr [rsp + 0x14], eax
02067 488b4424f8                     mov        rax, qword ptr [rsp - 8]
0206c 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
02071 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
02076 897c2428                       mov        dword ptr [rsp + 0x28], edi
0207a 8954242c                       mov        dword ptr [rsp + 0x2c], edx
0207e 4489542434                     mov        dword ptr [rsp + 0x34], r10d
02083 e85861afff                     call       0x7f63db6ea760
02088 0f1f840080210021               nop        dword ptr [rax + rax + 0x21002180]
02090 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0209a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0209e e8ddc2b318                     call       0x7f63f4730900
020a3 f4                             hlt        
020a4 beccffffff                     mov        esi, 0xffffffcc
020a9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
020b1 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
020b6 44891c24                       mov        dword ptr [rsp], r11d
020ba 48894424f8                     mov        qword ptr [rsp - 8], rax
020bf 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
020c6 89442410                       mov        dword ptr [rsp + 0x10], eax
020ca 488b4424f8                     mov        rax, qword ptr [rsp - 8]
020cf 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
020d4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
020d9 897c2414                       mov        dword ptr [rsp + 0x14], edi
020dd 89542428                       mov        dword ptr [rsp + 0x28], edx
020e1 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
020e6 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
020eb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
020f0 90                             nop        
020f1 90                             nop        
020f2 90                             nop        
020f3 e8e860afff                     call       0x7f63db6ea760
020f8 0f1f8400f0210022               nop        dword ptr [rax + rax + 0x220021f0]
02100 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0210a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0210e e86dc2b318                     call       0x7f63f4730900
02113 f4                             hlt        
02114 be45ffffff                     mov        esi, 0xffffff45
02119 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02121 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
02126 44891c24                       mov        dword ptr [rsp], r11d
0212a 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
0212f 4489542404                     mov        dword ptr [rsp + 4], r10d
02134 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
02139 44895c2408                     mov        dword ptr [rsp + 8], r11d
0213e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
02143 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02148 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0214d 448954240c                     mov        dword ptr [rsp + 0xc], r10d
02152 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
02157 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0215c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02161 4489542424                     mov        dword ptr [rsp + 0x24], r10d
02166 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0216b 44895c2428                     mov        dword ptr [rsp + 0x28], r11d
02170 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02175 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
0217a 4489442458                     mov        dword ptr [rsp + 0x58], r8d
0217f e85c60afff                     call       0x7f63db6ea760
02184 0f1f84007c220023               nop        dword ptr [rax + rax + 0x2300227c]
0218c 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02196 4883e4f0                       and        rsp, 0xfffffffffffffff0
0219a e8e1c1b318                     call       0x7f63f4730900
0219f f4                             hlt        
021a0 be45ffffff                     mov        esi, 0xffffff45
021a5 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
021ad 448b542408                     mov        r10d, dword ptr [rsp + 8]
021b2 44891424                       mov        dword ptr [rsp], r10d
021b6 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
021bb 4489442404                     mov        dword ptr [rsp + 4], r8d
021c0 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
021c5 4489542408                     mov        dword ptr [rsp + 8], r10d
021ca 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
021cf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
021d4 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
021d9 448954240c                     mov        dword ptr [rsp + 0xc], r10d
021de 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
021e3 4489542420                     mov        dword ptr [rsp + 0x20], r10d
021e8 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
021ed 4489542424                     mov        dword ptr [rsp + 0x24], r10d
021f2 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
021f7 4489442428                     mov        dword ptr [rsp + 0x28], r8d
021fc 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
02201 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
02206 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0220b 4489442430                     mov        dword ptr [rsp + 0x30], r8d
02210 4c894c2458                     mov        qword ptr [rsp + 0x58], r9
02215 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
0221a 90                             nop        
0221b e8c05fafff                     call       0x7f63db6ea760
02220 0f1f840018230024               nop        dword ptr [rax + rax + 0x24002318]
02228 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02232 4883e4f0                       and        rsp, 0xfffffffffffffff0
02236 e845c1b318                     call       0x7f63f4730900
0223b f4                             hlt        
0223c bef6ffffff                     mov        esi, 0xfffffff6
02241 90                             nop        
02242 90                             nop        
02243 e8985fafff                     call       0x7f63db6ea760
02248 0f1f840040230025               nop        dword ptr [rax + rax + 0x25002340]
02250 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0225a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0225e e81dc1b318                     call       0x7f63f4730900
02263 f4                             hlt        
02264 be5d000000                     mov        esi, 0x5d
02269 90                             nop        
0226a 90                             nop        
0226b e8705fafff                     call       0x7f63db6ea760
02270 0f1f840068230026               nop        dword ptr [rax + rax + 0x26002368]
02278 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02282 4883e4f0                       and        rsp, 0xfffffffffffffff0
02286 e8f5c0b318                     call       0x7f63f4730900
0228b f4                             hlt        
0228c be45ffffff                     mov        esi, 0xffffff45
02291 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02299 448b542408                     mov        r10d, dword ptr [rsp + 8]
0229e 44891424                       mov        dword ptr [rsp], r10d
022a2 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
022a7 4489542410                     mov        dword ptr [rsp + 0x10], r10d
022ac 895c2414                       mov        dword ptr [rsp + 0x14], ebx
022b0 89442418                       mov        dword ptr [rsp + 0x18], eax
022b4 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
022bc 4489542430                     mov        dword ptr [rsp + 0x30], r10d
022c1 4c89442450                     mov        qword ptr [rsp + 0x50], r8
022c6 90                             nop        
022c7 e8145fafff                     call       0x7f63db6ea760
022cc 0f1f8400c4230027               nop        dword ptr [rax + rax + 0x270023c4]
022d4 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
022de 4883e4f0                       and        rsp, 0xfffffffffffffff0
022e2 e899c0b318                     call       0x7f63f4730900
022e7 f4                             hlt        
022e8 bef6ffffff                     mov        esi, 0xfffffff6
022ed 418be8                         mov        ebp, r8d
022f0 90                             nop        
022f1 90                             nop        
022f2 90                             nop        
022f3 e8e85eafff                     call       0x7f63db6ea760
022f8 0f1f8400f0230028               nop        dword ptr [rax + rax + 0x280023f0]
02300 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0230a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0230e e86dc0b318                     call       0x7f63f4730900
02313 f4                             hlt        
02314 bef6ffffff                     mov        esi, 0xfffffff6
02319 418bea                         mov        ebp, r10d
0231c 90                             nop        
0231d 90                             nop        
0231e 90                             nop        
0231f e8bc5eafff                     call       0x7f63db6ea760
02324 0f1f84001c240029               nop        dword ptr [rax + rax + 0x2900241c]
0232c 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02336 4883e4f0                       and        rsp, 0xfffffffffffffff0
0233a e841c0b318                     call       0x7f63f4730900
0233f f4                             hlt        
02340 bef6ffffff                     mov        esi, 0xfffffff6
02345 418be8                         mov        ebp, r8d
02348 90                             nop        
02349 90                             nop        
0234a 90                             nop        
0234b e8905eafff                     call       0x7f63db6ea760
02350 0f1f84004824002a               nop        dword ptr [rax + rax + 0x2a002448]
02358 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02362 4883e4f0                       and        rsp, 0xfffffffffffffff0
02366 e815c0b318                     call       0x7f63f4730900
0236b f4                             hlt        
0236c bef6ffffff                     mov        esi, 0xfffffff6
02371 90                             nop        
02372 90                             nop        
02373 e8685eafff                     call       0x7f63db6ea760
02378 0f1f84007024002b               nop        dword ptr [rax + rax + 0x2b002470]
02380 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0238a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0238e e8edbfb318                     call       0x7f63f4730900
02393 f4                             hlt        
02394 bef6ffffff                     mov        esi, 0xfffffff6
02399 90                             nop        
0239a 90                             nop        
0239b e8405eafff                     call       0x7f63db6ea760
023a0 0f1f84009824002c               nop        dword ptr [rax + rax + 0x2c002498]
023a8 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
023b2 4883e4f0                       and        rsp, 0xfffffffffffffff0
023b6 e8c5bfb318                     call       0x7f63f4730900
023bb f4                             hlt        
023bc bef6ffffff                     mov        esi, 0xfffffff6
023c1 90                             nop        
023c2 90                             nop        
023c3 e8185eafff                     call       0x7f63db6ea760
023c8 0f1f8400c024002d               nop        dword ptr [rax + rax + 0x2d0024c0]
023d0 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
023da 4883e4f0                       and        rsp, 0xfffffffffffffff0
023de e89dbfb318                     call       0x7f63f4730900
023e3 f4                             hlt        
023e4 bef6ffffff                     mov        esi, 0xfffffff6
023e9 90                             nop        
023ea 90                             nop        
023eb e8f05dafff                     call       0x7f63db6ea760
023f0 0f1f8400e824002e               nop        dword ptr [rax + rax + 0x2e0024e8]
023f8 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02402 4883e4f0                       and        rsp, 0xfffffffffffffff0
02406 e875bfb318                     call       0x7f63f4730900
0240b f4                             hlt        
0240c bef6ffffff                     mov        esi, 0xfffffff6
02411 90                             nop        
02412 90                             nop        
02413 e8c85dafff                     call       0x7f63db6ea760
02418 0f1f84001025002f               nop        dword ptr [rax + rax + 0x2f002510]
02420 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0242a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0242e e84dbfb318                     call       0x7f63f4730900
02433 f4                             hlt        
02434 bef6ffffff                     mov        esi, 0xfffffff6
02439 90                             nop        
0243a 90                             nop        
0243b e8a05dafff                     call       0x7f63db6ea760
02440 0f1f840038250030               nop        dword ptr [rax + rax + 0x30002538]
02448 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
02452 4883e4f0                       and        rsp, 0xfffffffffffffff0
02456 e825bfb318                     call       0x7f63f4730900
0245b f4                             hlt        
0245c bef6ffffff                     mov        esi, 0xfffffff6
02461 90                             nop        
02462 90                             nop        
02463 e8785dafff                     call       0x7f63db6ea760
02468 0f1f840060250031               nop        dword ptr [rax + rax + 0x31002560]
02470 48bf409542b4637f0000           movabs     rdi, 0x7f63b4429540
0247a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0247e e8fdbeb318                     call       0x7f63f4730900
02483 f4                             hlt        
02484 eb08                           jmp        0x7f63dbbf4a0e
02486 eb06                           jmp        0x7f63dbbf4a0e
02488 eb04                           jmp        0x7f63dbbf4a0e
0248a eb02                           jmp        0x7f63dbbf4a0e
0248c eb00                           jmp        0x7f63dbbf4a0e
0248e 488bf0                         mov        rsi, rax
02491 e9e6e5ffff                     jmp        0x7f63dbbf2ffc
02496 49bacb2fbfdb637f0000           movabs     r10, 0x7f63dbbf2fcb
024a0 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
024a7 e93419b5ff                     jmp        0x7f63db746360
024ac e8afe7b3ff                     call       0x7f63db7331e0
024b1 e968dbffff                     jmp        0x7f63dbbf259e
024b6 f4                             hlt        
024b7 f4                             hlt        
