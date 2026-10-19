00000 89842400c0feff                 mov        dword ptr [rsp - 0x14000], eax
00007 55                             push       rbp
00008 4881ec10010000                 sub        rsp, 0x110
0000f 90                             nop        
00010 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00018 0f851e210000                   jne        0x7f4c1be7febc
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
00050 0f83d01b0000                   jae        0x7f4c1be7f9a6
00056 0fb65c160b                     movzx      ebx, byte ptr [rsi + rdx + 0xb]
0005b 85db                           test       ebx, ebx
0005d 0f84e11b0000                   je         0x7f4c1be7f9c4
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
00097 0f8c0b1a0000                   jl         0x7f4c1be7f828
0009d 4585d2                         test       r10d, r10d
000a0 0f8c7a1d0000                   jl         0x7f4c1be7fba0
000a6 8b2c24                         mov        ebp, dword ptr [rsp]
000a9 83c5f9                         add        ebp, -7
000ac 443bdd                         cmp        r11d, ebp
000af 0f83571c0000                   jae        0x7f4c1be7fa8c
000b5 458bcb                         mov        r9d, r11d
000b8 488b9c2490000000               mov        rbx, qword ptr [rsp + 0x90]
000c0 4e8b6c0b0c                     mov        r13, qword ptr [rbx + r9 + 0xc]
000c5 4183c0f8                       add        r8d, -8
000c9 448b8c24a0000000               mov        r9d, dword ptr [rsp + 0xa0]
000d1 4183c1f0                       add        r9d, -0x10
000d5 4183f808                       cmp        r8d, 8
000d9 0f8c7e1a0000                   jl         0x7f4c1be7f8dd
000df 4585d2                         test       r10d, r10d
000e2 0f8c8c1d0000                   jl         0x7f4c1be7fbf4
000e8 8b2c24                         mov        ebp, dword ptr [rsp]
000eb 83c5f9                         add        ebp, -7
000ee 443bcd                         cmp        r9d, ebp
000f1 0f83551c0000                   jae        0x7f4c1be7facc
000f7 418bc9                         mov        ecx, r9d
000fa 4c8b842490000000               mov        r8, qword ptr [rsp + 0x90]
00102 4d8b74080c                     mov        r14, qword ptr [r8 + rcx + 0xc]
00107 488b6c2420                     mov        rbp, qword ptr [rsp + 0x20]
0010c 448b451c                       mov        r8d, dword ptr [rbp + 0x1c]
00110 4585c0                         test       r8d, r8d
00113 0f843f1b0000                   je         0x7f4c1be7f9d8
00119 8b5d20                         mov        ebx, dword ptr [rbp + 0x20]
0011c 8b4b08                         mov        ecx, dword ptr [rbx + 8]
0011f 8b4524                         mov        eax, dword ptr [rbp + 0x24]
00122 85c0                           test       eax, eax
00124 0f84421b0000                   je         0x7f4c1be7f9ec
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
0018f 0f84e0080000                   je         0x7f4c1be7e7f5
00195 be40000000                     mov        esi, 0x40
0019a 2bf7                           sub        esi, edi
0019c 3bce                           cmp        ecx, esi
0019e 0f8ff4010000                   jg         0x7f4c1be7e118
001a4 2bf1                           sub        esi, ecx
001a6 c442cbf7c5                     shrx       r8, r13, rsi
001ab 83f940                         cmp        ecx, 0x40
001ae 0f8d441e0000                   jge        0x7f4c1be7fd78
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
001dd 7c34                           jl         0x7f4c1be7df93
001df 4489542428                     mov        dword ptr [rsp + 0x28], r10d
001e4 4183c1c8                       add        r9d, -0x38
001e8 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
001ed 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
001f5 8b542408                       mov        edx, dword ptr [rsp + 8]
001f9 8b4c2414                       mov        ecx, dword ptr [rsp + 0x14]
001fd 6690                           nop        
001ff e8dc28a9ff                     call       0x7f4c1b910860
00204 0f1f8400fc020000               nop        dword ptr [rax + rax + 0x2fc]
0020c 4889442420                     mov        qword ptr [rsp + 0x20], rax
00211 eb31                           jmp        0x7f4c1be7dfc4
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
00251 0f8d791c0000                   jge        0x7f4c1be7fc50
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
0028c 0f8db61c0000                   jge        0x7f4c1be7fcc8
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
002d5 0f8e43190000                   jle        0x7f4c1be7f99e
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
00345 0f8635190000                   jbe        0x7f4c1be7fa00
0034b 4d63d3                         movsxd     r10, r11d
0034e 4c635c244c                     movsxd     r11, dword ptr [rsp + 0x4c]
00353 49ffcb                         dec        r11
00356 4d3bda                         cmp        r11, r10
00359 0f8321190000                   jae        0x7f4c1be7fa00
0035f 448b5c2404                     mov        r11d, dword ptr [rsp + 4]
00364 4585db                         test       r11d, r11d
00367 0f8c271a0000                   jl         0x7f4c1be7fb14
0036d 448b1424                       mov        r10d, dword ptr [rsp]
00371 4183c2f9                       add        r10d, -7
00375 44899424c4000000               mov        dword ptr [rsp + 0xc4], r10d
0037d 4533d2                         xor        r10d, r10d
00380 4533db                         xor        r11d, r11d
00383 4c899424e8000000               mov        qword ptr [rsp + 0xe8], r10
0038b 44899c24dc000000               mov        dword ptr [rsp + 0xdc], r11d
00393 e987020000                     jmp        0x7f4c1be7e39f
00398 8be9                           mov        ebp, ecx
0039a 2bee                           sub        ebp, esi
0039c 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
003a4 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
003a9 6690                           nop        
003ab e83027a9ff                     call       0x7f4c1b910860
003b0 0f1f8400a8040001               nop        dword ptr [rax + rax + 0x10004a8]
003b8 4823442428                     and        rax, qword ptr [rsp + 0x28]
003bd 41ba40000000                   mov        r10d, 0x40
003c3 442bd5                         sub        r10d, ebp
003c6 c462d1f7d8                     shlx       r11, rax, rbp
003cb c462abf7942498000000           shrx       r10, qword ptr [rsp + 0x98], r10
003d5 4d0bda                         or         r11, r10
003d8 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
003dd 448b54241c                     mov        r10d, dword ptr [rsp + 0x1c]
003e2 e9e6fdffff                     jmp        0x7f4c1be7df4d
003e7 4c8b942490000000               mov        r10, qword ptr [rsp + 0x90]
003ef 4f8b54020c                     mov        r10, qword ptr [r10 + r8 + 0xc]
003f4 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
003f9 4c899c2498000000               mov        qword ptr [rsp + 0x98], r11
00401 4c89542420                     mov        qword ptr [rsp + 0x20], r10
00406 8b6c240c                       mov        ebp, dword ptr [rsp + 0xc]
0040a 896c2410                       mov        dword ptr [rsp + 0x10], ebp
0040e 6690                           nop        
00410 8bac24d0000000                 mov        ebp, dword ptr [rsp + 0xd0]
00417 83fd40                         cmp        ebp, 0x40
0041a 0f8de40a0000                   jge        0x7f4c1be7ec84
00420 c462d3f78c24e0000000           shrx       r9, qword ptr [rsp + 0xe0], rbp
0042a 41ba01000000                   mov        r10d, 1
00430 c442d1f7d2                     shlx       r10, r10, rbp
00435 49ffca                         dec        r10
00438 4c239424e0000000               and        r10, qword ptr [rsp + 0xe0]
00440 458bda                         mov        r11d, r10d
00443 8bac24d4000000                 mov        ebp, dword ptr [rsp + 0xd4]
0044a 83fd40                         cmp        ebp, 0x40
0044d 0f8d910b0000                   jge        0x7f4c1be7ed64
00453 c4c2d3f7f9                     shrx       rdi, r9, rbp
00458 41ba01000000                   mov        r10d, 1
0045e c442d1f7d2                     shlx       r10, r10, rbp
00463 49ffca                         dec        r10
00466 4d23d1                         and        r10, r9
00469 418bda                         mov        ebx, r10d
0046c 8b6c2474                       mov        ebp, dword ptr [rsp + 0x74]
00470 83fd40                         cmp        ebp, 0x40
00473 0f8d6b0c0000                   jge        0x7f4c1be7ee64
00479 c4e2d3f7cf                     shrx       rcx, rdi, rbp
0047e 41ba01000000                   mov        r10d, 1
00484 c442d1f7d2                     shlx       r10, r10, rbp
00489 49ffca                         dec        r10
0048c 4c23d7                         and        r10, rdi
0048f 458bd2                         mov        r10d, r10d
00492 8bac24d8000000                 mov        ebp, dword ptr [rsp + 0xd8]
00499 83fd40                         cmp        ebp, 0x40
0049c 0f8d3a0d0000                   jge        0x7f4c1be7ef5c
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
004f2 0f8edc070000                   jle        0x7f4c1be7ea54
004f8 4981f8ffffff7f                 cmp        r8, 0x7fffffff
004ff 0f8f030e0000                   jg         0x7f4c1be7f088
00505 4181faffff0100                 cmp        r10d, 0x1ffff
0050c 0f8fee0e0000                   jg         0x7f4c1be7f180
00512 81f9ffff0300                   cmp        ecx, 0x3ffff
00518 0f8fe20f0000                   jg         0x7f4c1be7f280
0051e 418bd8                         mov        ebx, r8d
00521 81fb00000010                   cmp        ebx, 0x10000000
00527 0f83cf100000                   jae        0x7f4c1be7f37c
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
0055e 0f8daa000000                   jge        0x7f4c1be7e38e
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
005ad 0f8d91110000                   jge        0x7f4c1be7f4c4
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
005e7 0f8d0f120000                   jge        0x7f4c1be7f57c
005ed 41ba01000000                   mov        r10d, 1
005f3 448b8424cc000000               mov        r8d, dword ptr [rsp + 0xcc]
005fb c44239f7d2                     shlx       r10d, r10d, r8d
00600 41ffca                         dec        r10d
00603 4523d3                         and        r10d, r11d
00606 4403d3                         add        r10d, ebx
00609 4489542470                     mov        dword ptr [rsp + 0x70], r10d
0060e 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
00612 0f8de1030000                   jge        0x7f4c1be7e779
00618 89ac24dc000000                 mov        dword ptr [rsp + 0xdc], ebp
0061f 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00624 442344246c                     and        r8d, dword ptr [rsp + 0x6c]
00629 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
0062e 418b5b18                       mov        ebx, dword ptr [r11 + 0x18]
00632 448b5b08                       mov        r11d, dword ptr [rbx + 8]
00636 453bc3                         cmp        r8d, r11d
00639 0f8346040000                   jae        0x7f4c1be7e805
0063f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00644 4423542470                     and        r10d, dword ptr [rsp + 0x70]
00649 448b5c2434                     mov        r11d, dword ptr [rsp + 0x34]
0064e 418b4b18                       mov        ecx, dword ptr [r11 + 0x18]
00652 448b5908                       mov        r11d, dword ptr [rcx + 8]
00656 4e8b44c310                     mov        r8, qword ptr [rbx + r8*8 + 0x10]
0065b 4c89442478                     mov        qword ptr [rsp + 0x78], r8
00660 453bd3                         cmp        r10d, r11d
00663 0f83d7040000                   jae        0x7f4c1be7e8c0
00669 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0066e 4423442448                     and        r8d, dword ptr [rsp + 0x48]
00673 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
00678 458b5918                       mov        r11d, dword ptr [r9 + 0x18]
0067c 418b5b08                       mov        ebx, dword ptr [r11 + 8]
00680 4e8b54d110                     mov        r10, qword ptr [rcx + r10*8 + 0x10]
00685 4c89942480000000               mov        qword ptr [rsp + 0x80], r10
0068d 443bc3                         cmp        r8d, ebx
00690 0f836e050000                   jae        0x7f4c1be7e984
00696 4f8b54c310                     mov        r10, qword ptr [r11 + r8*8 + 0x10]
0069b 4c89942488000000               mov        qword ptr [rsp + 0x88], r10
006a3 8bac24dc000000                 mov        ebp, dword ptr [rsp + 0xdc]
006aa ffc5                           inc        ebp
006ac 896c2404                       mov        dword ptr [rsp + 4], ebp
006b0 3b6c244c                       cmp        ebp, dword ptr [rsp + 0x4c]
006b4 0f8d10030000                   jge        0x7f4c1be7e74a
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
0077a 0f8448060000                   je         0x7f4c1be7eb48
00780 4183f83f                       cmp        r8d, 0x3f
00784 0f8f52070000                   jg         0x7f4c1be7ec5c
0078a b940000000                     mov        ecx, 0x40
0078f 2b4c243c                       sub        ecx, dword ptr [rsp + 0x3c]
00793 443bc1                         cmp        r8d, ecx
00796 7e47                           jle        0x7f4c1be7e55f
00798 458bc8                         mov        r9d, r8d
0079b 442bc9                         sub        r9d, ecx
0079e 83f940                         cmp        ecx, 0x40
007a1 0f8d15120000                   jge        0x7f4c1be7f73c
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
007dd eb30                           jmp        0x7f4c1be7e58f
007df 412bc8                         sub        ecx, r8d
007e2 c462f3f78c2498000000           shrx       r9, qword ptr [rsp + 0x98], rcx
007ec 4183f840                       cmp        r8d, 0x40
007f0 0f8db6100000                   jge        0x7f4c1be7f62c
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
0082d 0f8cddfbffff                   jl         0x7f4c1be7e190
00833 458d5ac0                       lea        r11d, [r10 - 0x40]
00837 44895c243c                     mov        dword ptr [rsp + 0x3c], r11d
0083c 8b6c2410                       mov        ebp, dword ptr [rsp + 0x10]
00840 83c5f8                         add        ebp, -8
00843 896c240c                       mov        dword ptr [rsp + 0xc], ebp
00847 8b4c2410                       mov        ecx, dword ptr [rsp + 0x10]
0084b 2b4c2408                       sub        ecx, dword ptr [rsp + 8]
0084f 83c1f0                         add        ecx, -0x10
00852 83f908                         cmp        ecx, 8
00855 0f8c19010000                   jl         0x7f4c1be7e6f4
0085b 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
00860 4183c0e8                       add        r8d, -0x18
00864 443b8424c4000000               cmp        r8d, dword ptr [rsp + 0xc4]
0086c 0f8275fbffff                   jb         0x7f4c1be7e167
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
00965 6690                           nop        
00967 e87496b5ff                     call       0x7f4c1b9d7d60
0096c 0f1f8400640a0002               nop        dword ptr [rax + rax + 0x2000a64]
00974 85c9                           test       ecx, ecx
00976 7f08                           jg         0x7f4c1be7e700
00978 4533d2                         xor        r10d, r10d
0097b e974faffff                     jmp        0x7f4c1be7e174
00980 890c24                         mov        dword ptr [rsp], ecx
00983 488bb42490000000               mov        rsi, qword ptr [rsp + 0x90]
0098b 8b542408                       mov        edx, dword ptr [rsp + 8]
0098f 8bac24a4000000                 mov        ebp, dword ptr [rsp + 0xa4]
00996 90                             nop        
00997 e84421a9ff                     call       0x7f4c1b910860
0099c 0f1f8400940a0003               nop        dword ptr [rax + rax + 0x3000a94]
009a4 448b542408                     mov        r10d, dword ptr [rsp + 8]
009a9 41c1e203                       shl        r10d, 3
009ad 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
009b2 41c1e303                       shl        r11d, 3
009b6 452bd3                         sub        r10d, r11d
009b9 4181c2c0000000                 add        r10d, 0xc0
009c0 c462a9f7d0                     shlx       r10, rax, r10
009c5 e92afaffff                     jmp        0x7f4c1be7e174
009ca 4533d2                         xor        r10d, r10d
009cd 33ed                           xor        ebp, ebp
009cf 4533c0                         xor        r8d, r8d
009d2 4533db                         xor        r11d, r11d
009d5 44899424c8000000               mov        dword ptr [rsp + 0xc8], r10d
009dd 89ac24d0000000                 mov        dword ptr [rsp + 0xd0], ebp
009e4 44898424cc000000               mov        dword ptr [rsp + 0xcc], r8d
009ec 44899c24f0000000               mov        dword ptr [rsp + 0xf0], r11d
009f4 e91efdffff                     jmp        0x7f4c1be7e497
009f9 4c8b8424e8000000               mov        r8, qword ptr [rsp + 0xe8]
00a01 4c639424b8000000               movsxd     r10, dword ptr [rsp + 0xb8]
00a09 4d03c2                         add        r8, r10
00a0c 4c63942420010000               movsxd     r10, dword ptr [rsp + 0x120]
00a14 4d3bc2                         cmp        r8, r10
00a17 7f29                           jg         0x7f4c1be7e7c2
00a19 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00a1e 443b9c24a4000000               cmp        r11d, dword ptr [rsp + 0xa4]
00a26 0f85b8150000                   jne        0x7f4c1be7fd64
00a2c 418bc0                         mov        eax, r8d
00a2f 4881c410010000                 add        rsp, 0x110
00a36 5d                             pop        rbp
00a37 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
00a3b 0f87e5160000                   ja         0x7f4c1be7fea6
00a41 c3                             ret        
00a42 48be385d32e300000000           movabs     rsi, 0xe3325d38
00a4c 666690                         nop        
00a4f e88c20a9ff                     call       0x7f4c1b910860
00a54 0f1f84004c0b0004               nop        dword ptr [rax + rax + 0x4000b4c]
00a5c 4885c0                         test       rax, rax
00a5f 0f846b150000                   je         0x7f4c1be7fd50
00a65 488bf0                         mov        rsi, rax
00a68 4881c410010000                 add        rsp, 0x110
00a6f 5d                             pop        rbp
00a70 e9ebbdb5ff                     jmp        0x7f4c1b9da5e0
00a75 4533d2                         xor        r10d, r10d
00a78 4533db                         xor        r11d, r11d
00a7b 4c895c2460                     mov        qword ptr [rsp + 0x60], r11
00a80 e948f7ffff                     jmp        0x7f4c1be7df4d
00a85 bee4ffffff                     mov        esi, 0xffffffe4
00a8a 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00a92 448b542408                     mov        r10d, dword ptr [rsp + 8]
00a97 44891424                       mov        dword ptr [rsp], r10d
00a9b 448b5c244c                     mov        r11d, dword ptr [rsp + 0x4c]
00aa0 44895c2404                     mov        dword ptr [rsp + 4], r11d
00aa5 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00aaa 4489542408                     mov        dword ptr [rsp + 8], r10d
00aaf 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00ab4 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00ab9 448b5c243c                     mov        r11d, dword ptr [rsp + 0x3c]
00abe 44895c240c                     mov        dword ptr [rsp + 0xc], r11d
00ac3 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
00ac8 4489542420                     mov        dword ptr [rsp + 0x20], r10d
00acd 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00ad2 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00ad7 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00adc 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00ae1 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ae6 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00aeb 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00af0 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00af5 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00afa 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00aff 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00b04 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00b09 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00b0e 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00b13 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00b18 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00b1d 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00b22 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00b27 895c2458                       mov        dword ptr [rsp + 0x58], ebx
00b2b 448944245c                     mov        dword ptr [rsp + 0x5c], r8d
00b30 666690                         nop        
00b33 e8a894b5ff                     call       0x7f4c1b9d7d60
00b38 0f1f8400300c0005               nop        dword ptr [rax + rax + 0x5000c30]
00b40 bee4ffffff                     mov        esi, 0xffffffe4
00b45 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00b4d 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00b52 44891c24                       mov        dword ptr [rsp], r11d
00b56 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
00b5b 4489442404                     mov        dword ptr [rsp + 4], r8d
00b60 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00b65 44895c2408                     mov        dword ptr [rsp + 8], r11d
00b6a 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
00b6f 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
00b74 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
00b79 448944240c                     mov        dword ptr [rsp + 0xc], r8d
00b7e 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
00b83 4489442420                     mov        dword ptr [rsp + 0x20], r8d
00b88 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00b8d 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00b92 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
00b97 4489442428                     mov        dword ptr [rsp + 0x28], r8d
00b9c 448b5c2438                     mov        r11d, dword ptr [rsp + 0x38]
00ba1 44895c242c                     mov        dword ptr [rsp + 0x2c], r11d
00ba6 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
00bab 4489442430                     mov        dword ptr [rsp + 0x30], r8d
00bb0 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00bb5 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00bba 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
00bbf 4489442438                     mov        dword ptr [rsp + 0x38], r8d
00bc4 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
00bc9 4489442448                     mov        dword ptr [rsp + 0x48], r8d
00bce 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00bd3 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00bd8 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
00bdd 4489442450                     mov        dword ptr [rsp + 0x50], r8d
00be2 4c8b5c2478                     mov        r11, qword ptr [rsp + 0x78]
00be7 4c895c2458                     mov        qword ptr [rsp + 0x58], r11
00bec 894c2460                       mov        dword ptr [rsp + 0x60], ecx
00bf0 4489542464                     mov        dword ptr [rsp + 0x64], r10d
00bf5 6690                           nop        
00bf7 e8e493b5ff                     call       0x7f4c1b9d7d60
00bfc 0f1f8400f40c0006               nop        dword ptr [rax + rax + 0x6000cf4]
00c04 bee4ffffff                     mov        esi, 0xffffffe4
00c09 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00c11 448b542408                     mov        r10d, dword ptr [rsp + 8]
00c16 44891424                       mov        dword ptr [rsp], r10d
00c1a 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00c1f 44894c2404                     mov        dword ptr [rsp + 4], r9d
00c24 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
00c29 4489542408                     mov        dword ptr [rsp + 8], r10d
00c2e 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00c33 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00c38 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00c3d 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00c42 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
00c47 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
00c4c 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
00c51 4489542424                     mov        dword ptr [rsp + 0x24], r10d
00c56 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00c5b 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
00c60 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
00c65 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
00c6a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00c6f 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00c74 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
00c79 4489542434                     mov        dword ptr [rsp + 0x34], r10d
00c7e 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
00c83 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00c88 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00c8d 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
00c92 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
00c97 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
00c9c 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00ca1 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00ca6 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00cab 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00cb0 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00cb8 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00cbd 44895c2468                     mov        dword ptr [rsp + 0x68], r11d
00cc2 448944246c                     mov        dword ptr [rsp + 0x6c], r8d
00cc7 e81493b5ff                     call       0x7f4c1b9d7d60
00ccc 0f1f8400c40d0007               nop        dword ptr [rax + rax + 0x7000dc4]
00cd4 4533c9                         xor        r9d, r9d
00cd7 4d3bc1                         cmp        r8, r9
00cda bdffffffff                     mov        ebp, 0xffffffff
00cdf 7c08                           jl         0x7f4c1be7ea69
00ce1 400f95c5                       setne      bpl
00ce5 400fb6ed                       movzx      ebp, bpl
00ce9 be45ffffff                     mov        esi, 0xffffff45
00cee 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
00cf6 4c890c24                       mov        qword ptr [rsp], r9
00cfa 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
00cff 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
00d04 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
00d0c 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
00d11 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
00d16 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
00d1b 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
00d1f 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
00d23 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
00d28 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
00d2d 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
00d31 895c2434                       mov        dword ptr [rsp + 0x34], ebx
00d35 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
00d3a 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
00d3f 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
00d43 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
00d47 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
00d4c 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
00d51 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
00d58 895c2444                       mov        dword ptr [rsp + 0x44], ebx
00d5c 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
00d61 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
00d66 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
00d6a 895c2454                       mov        dword ptr [rsp + 0x54], ebx
00d6e 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
00d73 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
00d78 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
00d7d 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
00d82 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
00d8a 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
00d8f 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
00d97 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
00d9c 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
00da4 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
00dab 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
00db3 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
00dbb e82092b5ff                     call       0x7f4c1b9d7d60
00dc0 0f1f8400b80e0008               nop        dword ptr [rax + rax + 0x8000eb8]
00dc8 be45ffffff                     mov        esi, 0xffffff45
00dcd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00dd5 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
00dda 44891c24                       mov        dword ptr [rsp], r11d
00dde 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00de3 4489542404                     mov        dword ptr [rsp + 4], r10d
00de8 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
00ded 44895c2408                     mov        dword ptr [rsp + 8], r11d
00df2 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
00dfa 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00dff 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
00e04 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e09 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
00e0e 448954240c                     mov        dword ptr [rsp + 0xc], r10d
00e13 448b5c2428                     mov        r11d, dword ptr [rsp + 0x28]
00e18 44895c2420                     mov        dword ptr [rsp + 0x20], r11d
00e1d 448b5c2430                     mov        r11d, dword ptr [rsp + 0x30]
00e22 44895c2424                     mov        dword ptr [rsp + 0x24], r11d
00e27 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
00e2c 4489542428                     mov        dword ptr [rsp + 0x28], r10d
00e31 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
00e36 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
00e3b 4489542430                     mov        dword ptr [rsp + 0x30], r10d
00e40 448b5c2470                     mov        r11d, dword ptr [rsp + 0x70]
00e45 44895c2434                     mov        dword ptr [rsp + 0x34], r11d
00e4a 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
00e4f 4489542438                     mov        dword ptr [rsp + 0x38], r10d
00e54 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
00e59 4489542448                     mov        dword ptr [rsp + 0x48], r10d
00e5e 448b5c2464                     mov        r11d, dword ptr [rsp + 0x64]
00e63 44895c244c                     mov        dword ptr [rsp + 0x4c], r11d
00e68 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
00e6d 4489542450                     mov        dword ptr [rsp + 0x50], r10d
00e72 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
00e77 4c89542458                     mov        qword ptr [rsp + 0x58], r10
00e7c 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
00e84 4c89542460                     mov        qword ptr [rsp + 0x60], r10
00e89 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
00e91 4c89542468                     mov        qword ptr [rsp + 0x68], r10
00e96 4489842490000000               mov        dword ptr [rsp + 0x90], r8d
00e9e 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
00ea6 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
00eae 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
00eb6 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
00ebe 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
00ec6 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
00ece 90                             nop        
00ecf e80c91b5ff                     call       0x7f4c1b9d7d60
00ed4 0f1f8400cc0f0009               nop        dword ptr [rax + rax + 0x9000fcc]
00edc be45ffffff                     mov        esi, 0xffffff45
00ee1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ee9 448b542408                     mov        r10d, dword ptr [rsp + 8]
00eee 44891424                       mov        dword ptr [rsp], r10d
00ef2 4489442408                     mov        dword ptr [rsp + 8], r8d
00ef7 e8e490b5ff                     call       0x7f4c1b9d7d60
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
00fd7 e80490b5ff                     call       0x7f4c1b9d7d60
00fdc 0f1f8400d410000b               nop        dword ptr [rax + rax + 0xb0010d4]
00fe4 be45ffffff                     mov        esi, 0xffffff45
00fe9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
00ff1 448b442408                     mov        r8d, dword ptr [rsp + 8]
00ff6 44890424                       mov        dword ptr [rsp], r8d
00ffa 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
00fff 4489542404                     mov        dword ptr [rsp + 4], r10d
01004 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01009 4489442408                     mov        dword ptr [rsp + 8], r8d
0100e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01016 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0101b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01020 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01025 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0102a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0102f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01034 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01039 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0103e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01043 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01048 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0104d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01052 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01057 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0105c 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01061 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01066 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0106b 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01070 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01075 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0107a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0107f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01084 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01089 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0108e 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01093 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01098 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0109d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
010a5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
010aa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
010b2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
010b7 448b9424d4000000               mov        r10d, dword ptr [rsp + 0xd4]
010bf 4489542478                     mov        dword ptr [rsp + 0x78], r10d
010c4 44899c2490000000               mov        dword ptr [rsp + 0x90], r11d
010cc 4c898c2498000000               mov        qword ptr [rsp + 0x98], r9
010d4 666690                         nop        
010d7 e8048fb5ff                     call       0x7f4c1b9d7d60
010dc 0f1f8400d411000c               nop        dword ptr [rax + rax + 0xc0011d4]
010e4 be45ffffff                     mov        esi, 0xffffff45
010e9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
010f1 448b542408                     mov        r10d, dword ptr [rsp + 8]
010f6 44891424                       mov        dword ptr [rsp], r10d
010fa 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
010ff 4489442404                     mov        dword ptr [rsp + 4], r8d
01104 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01109 4489542408                     mov        dword ptr [rsp + 8], r10d
0110e 4c8b942498000000               mov        r10, qword ptr [rsp + 0x98]
01116 4c89542410                     mov        qword ptr [rsp + 0x10], r10
0111b 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
01120 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01125 448b54243c                     mov        r10d, dword ptr [rsp + 0x3c]
0112a 448954240c                     mov        dword ptr [rsp + 0xc], r10d
0112f 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01134 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01139 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
0113e 4489542424                     mov        dword ptr [rsp + 0x24], r10d
01143 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01148 4489442428                     mov        dword ptr [rsp + 0x28], r8d
0114d 448b542438                     mov        r10d, dword ptr [rsp + 0x38]
01152 448954242c                     mov        dword ptr [rsp + 0x2c], r10d
01157 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
0115c 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01161 448b542470                     mov        r10d, dword ptr [rsp + 0x70]
01166 4489542434                     mov        dword ptr [rsp + 0x34], r10d
0116b 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01170 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01175 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0117a 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0117f 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01184 448954244c                     mov        dword ptr [rsp + 0x4c], r10d
01189 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0118e 4489442450                     mov        dword ptr [rsp + 0x50], r8d
01193 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
01198 4c89542458                     mov        qword ptr [rsp + 0x58], r10
0119d 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
011a5 4c89542460                     mov        qword ptr [rsp + 0x60], r10
011aa 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
011b2 4c89542468                     mov        qword ptr [rsp + 0x68], r10
011b7 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
011bf 899c2490000000                 mov        dword ptr [rsp + 0x90], ebx
011c6 4889bc2498000000               mov        qword ptr [rsp + 0x98], rdi
011ce 90                             nop        
011cf e80c8eb5ff                     call       0x7f4c1b9d7d60
011d4 0f1f8400cc12000d               nop        dword ptr [rax + rax + 0xd0012cc]
011dc be45ffffff                     mov        esi, 0xffffff45
011e1 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
011e9 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
011ee 44890c24                       mov        dword ptr [rsp], r9d
011f2 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
011f7 4489442404                     mov        dword ptr [rsp + 4], r8d
011fc 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01201 44894c2408                     mov        dword ptr [rsp + 8], r9d
01206 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
0120e 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01213 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01218 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0121d 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01222 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01227 448b4c2428                     mov        r9d, dword ptr [rsp + 0x28]
0122c 44894c2420                     mov        dword ptr [rsp + 0x20], r9d
01231 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01236 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0123b 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
01240 44894c2428                     mov        dword ptr [rsp + 0x28], r9d
01245 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0124a 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
0124f 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
01254 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01259 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
0125e 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01263 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01268 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
0126d 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01272 44894c2448                     mov        dword ptr [rsp + 0x48], r9d
01277 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
0127c 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01281 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
01286 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0128b 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
01290 4c89442458                     mov        qword ptr [rsp + 0x58], r8
01295 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
0129d 4c89442460                     mov        qword ptr [rsp + 0x60], r8
012a2 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
012aa 4c89442468                     mov        qword ptr [rsp + 0x68], r8
012af 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
012b4 899c2480000000                 mov        dword ptr [rsp + 0x80], ebx
012bb 4489942484000000               mov        dword ptr [rsp + 0x84], r10d
012c3 48898c2488000000               mov        qword ptr [rsp + 0x88], rcx
012cb 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
012d3 44899c2494000000               mov        dword ptr [rsp + 0x94], r11d
012db 4c8b9424b0000000               mov        r10, qword ptr [rsp + 0xb0]
012e3 4c89942498000000               mov        qword ptr [rsp + 0x98], r10
012eb 448b9424a4000000               mov        r10d, dword ptr [rsp + 0xa4]
012f3 44899424a0000000               mov        dword ptr [rsp + 0xa0], r10d
012fb e8e08cb5ff                     call       0x7f4c1b9d7d60
01300 0f1f8400f813000e               nop        dword ptr [rax + rax + 0xe0013f8]
01308 41b9ffffff7f                   mov        r9d, 0x7fffffff
0130e 4d3bc1                         cmp        r8, r9
01311 bdffffffff                     mov        ebp, 0xffffffff
01316 7c08                           jl         0x7f4c1be7f0a0
01318 400f95c5                       setne      bpl
0131c 400fb6ed                       movzx      ebp, bpl
01320 be45ffffff                     mov        esi, 0xffffff45
01325 4c8b8c2490000000               mov        r9, qword ptr [rsp + 0x90]
0132d 4c890c24                       mov        qword ptr [rsp], r9
01331 8b5c244c                       mov        ebx, dword ptr [rsp + 0x4c]
01335 895c240c                       mov        dword ptr [rsp + 0xc], ebx
01339 4c8b8c2498000000               mov        r9, qword ptr [rsp + 0x98]
01341 4c894c2418                     mov        qword ptr [rsp + 0x18], r9
01346 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
0134b 44894c2414                     mov        dword ptr [rsp + 0x14], r9d
01350 8b5c2430                       mov        ebx, dword ptr [rsp + 0x30]
01354 895c242c                       mov        dword ptr [rsp + 0x2c], ebx
01358 448b4c2434                     mov        r9d, dword ptr [rsp + 0x34]
0135d 44894c2430                     mov        dword ptr [rsp + 0x30], r9d
01362 8b5c2438                       mov        ebx, dword ptr [rsp + 0x38]
01366 895c2434                       mov        dword ptr [rsp + 0x34], ebx
0136a 448b4c2448                     mov        r9d, dword ptr [rsp + 0x48]
0136f 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01374 8b5c2470                       mov        ebx, dword ptr [rsp + 0x70]
01378 895c243c                       mov        dword ptr [rsp + 0x3c], ebx
0137c 448b4c246c                     mov        r9d, dword ptr [rsp + 0x6c]
01381 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01386 8b9c24c0000000                 mov        ebx, dword ptr [rsp + 0xc0]
0138d 895c2444                       mov        dword ptr [rsp + 0x44], ebx
01391 448b4c2460                     mov        r9d, dword ptr [rsp + 0x60]
01396 44894c2450                     mov        dword ptr [rsp + 0x50], r9d
0139b 8b5c2464                       mov        ebx, dword ptr [rsp + 0x64]
0139f 895c2454                       mov        dword ptr [rsp + 0x54], ebx
013a3 448b4c2468                     mov        r9d, dword ptr [rsp + 0x68]
013a8 44894c2458                     mov        dword ptr [rsp + 0x58], r9d
013ad 4c8b4c2478                     mov        r9, qword ptr [rsp + 0x78]
013b2 4c894c2460                     mov        qword ptr [rsp + 0x60], r9
013b7 4c8b8c2480000000               mov        r9, qword ptr [rsp + 0x80]
013bf 4c894c2468                     mov        qword ptr [rsp + 0x68], r9
013c4 4c8b8c2488000000               mov        r9, qword ptr [rsp + 0x88]
013cc 4c894c2470                     mov        qword ptr [rsp + 0x70], r9
013d1 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
013d9 898c2488000000                 mov        dword ptr [rsp + 0x88], ecx
013e0 448994248c000000               mov        dword ptr [rsp + 0x8c], r10d
013e8 4c89842498000000               mov        qword ptr [rsp + 0x98], r8
013f0 666690                         nop        
013f3 e8e88bb5ff                     call       0x7f4c1b9d7d60
013f8 0f1f8400f014000f               nop        dword ptr [rax + rax + 0xf0014f0]
01400 be45ffffff                     mov        esi, 0xffffff45
01405 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0140d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01412 44890424                       mov        dword ptr [rsp], r8d
01416 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0141b 4489442404                     mov        dword ptr [rsp + 4], r8d
01420 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01425 44894c2408                     mov        dword ptr [rsp + 8], r9d
0142a 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
01432 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01437 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
0143c 4c89442418                     mov        qword ptr [rsp + 0x18], r8
01441 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01446 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
0144b 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
01450 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01455 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
0145a 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0145f 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01464 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01469 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0146e 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01473 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01478 4489442430                     mov        dword ptr [rsp + 0x30], r8d
0147d 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
01482 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01487 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
0148c 4489442438                     mov        dword ptr [rsp + 0x38], r8d
01491 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
01496 4489442448                     mov        dword ptr [rsp + 0x48], r8d
0149b 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
014a0 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
014a5 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
014aa 4489442450                     mov        dword ptr [rsp + 0x50], r8d
014af 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
014b4 4c89442458                     mov        qword ptr [rsp + 0x58], r8
014b9 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
014c1 4c89442460                     mov        qword ptr [rsp + 0x60], r8
014c6 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
014ce 4c89442468                     mov        qword ptr [rsp + 0x68], r8
014d3 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
014d8 4489942480000000               mov        dword ptr [rsp + 0x80], r10d
014e0 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
014e8 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
014f0 666690                         nop        
014f3 e8e88ab5ff                     call       0x7f4c1b9d7d60
014f8 0f1f8400f0150010               nop        dword ptr [rax + rax + 0x100015f0]
01500 be45ffffff                     mov        esi, 0xffffff45
01505 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
0150d 448b442408                     mov        r8d, dword ptr [rsp + 8]
01512 44890424                       mov        dword ptr [rsp], r8d
01516 448b44244c                     mov        r8d, dword ptr [rsp + 0x4c]
0151b 4489442404                     mov        dword ptr [rsp + 4], r8d
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
01555 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
0155a 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0155f 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01564 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01569 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0156e 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01573 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01578 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0157d 448b442470                     mov        r8d, dword ptr [rsp + 0x70]
01582 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01587 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
0158c 4489542438                     mov        dword ptr [rsp + 0x38], r10d
01591 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
01596 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0159b 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
015a0 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
015a5 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
015aa 4489542450                     mov        dword ptr [rsp + 0x50], r10d
015af 4c8b542478                     mov        r10, qword ptr [rsp + 0x78]
015b4 4c89542458                     mov        qword ptr [rsp + 0x58], r10
015b9 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
015c1 4c89542460                     mov        qword ptr [rsp + 0x60], r10
015c6 4c8b942488000000               mov        r10, qword ptr [rsp + 0x88]
015ce 4c89542468                     mov        qword ptr [rsp + 0x68], r10
015d3 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
015d8 898c2480000000                 mov        dword ptr [rsp + 0x80], ecx
015df 448b9c24a0000000               mov        r11d, dword ptr [rsp + 0xa0]
015e7 44899c2484000000               mov        dword ptr [rsp + 0x84], r11d
015ef e8ec89b5ff                     call       0x7f4c1b9d7d60
015f4 0f1f8400ec160011               nop        dword ptr [rax + rax + 0x110016ec]
015fc be3dffffff                     mov        esi, 0xffffff3d
01601 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01609 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
0160e 44890c24                       mov        dword ptr [rsp], r9d
01612 448b4c244c                     mov        r9d, dword ptr [rsp + 0x4c]
01617 44894c2404                     mov        dword ptr [rsp + 4], r9d
0161c 448b4c2410                     mov        r9d, dword ptr [rsp + 0x10]
01621 44894c2408                     mov        dword ptr [rsp + 8], r9d
01626 4c8b842498000000               mov        r8, qword ptr [rsp + 0x98]
0162e 4c89442410                     mov        qword ptr [rsp + 0x10], r8
01633 4c8b442420                     mov        r8, qword ptr [rsp + 0x20]
01638 4c89442418                     mov        qword ptr [rsp + 0x18], r8
0163d 448b4c243c                     mov        r9d, dword ptr [rsp + 0x3c]
01642 44894c240c                     mov        dword ptr [rsp + 0xc], r9d
01647 448b442428                     mov        r8d, dword ptr [rsp + 0x28]
0164c 4489442420                     mov        dword ptr [rsp + 0x20], r8d
01651 448b4c2430                     mov        r9d, dword ptr [rsp + 0x30]
01656 44894c2424                     mov        dword ptr [rsp + 0x24], r9d
0165b 448b442434                     mov        r8d, dword ptr [rsp + 0x34]
01660 4489442428                     mov        dword ptr [rsp + 0x28], r8d
01665 448b4c2438                     mov        r9d, dword ptr [rsp + 0x38]
0166a 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
0166f 448b442448                     mov        r8d, dword ptr [rsp + 0x48]
01674 4489442430                     mov        dword ptr [rsp + 0x30], r8d
01679 448b4c2470                     mov        r9d, dword ptr [rsp + 0x70]
0167e 44894c2434                     mov        dword ptr [rsp + 0x34], r9d
01683 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01688 4489442438                     mov        dword ptr [rsp + 0x38], r8d
0168d 448b8c24c0000000               mov        r9d, dword ptr [rsp + 0xc0]
01695 44894c243c                     mov        dword ptr [rsp + 0x3c], r9d
0169a 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0169f 4489442448                     mov        dword ptr [rsp + 0x48], r8d
016a4 448b4c2464                     mov        r9d, dword ptr [rsp + 0x64]
016a9 44894c244c                     mov        dword ptr [rsp + 0x4c], r9d
016ae 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
016b3 4489442450                     mov        dword ptr [rsp + 0x50], r8d
016b8 4c8b442478                     mov        r8, qword ptr [rsp + 0x78]
016bd 4c89442458                     mov        qword ptr [rsp + 0x58], r8
016c2 4c8b842480000000               mov        r8, qword ptr [rsp + 0x80]
016ca 4c89442460                     mov        qword ptr [rsp + 0x60], r8
016cf 4c8b842488000000               mov        r8, qword ptr [rsp + 0x88]
016d7 4c89442468                     mov        qword ptr [rsp + 0x68], r8
016dc 44895c247c                     mov        dword ptr [rsp + 0x7c], r11d
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
01737 e8a488b5ff                     call       0x7f4c1b9d7d60
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
01778 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
0177d 448944240c                     mov        dword ptr [rsp + 0xc], r8d
01782 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
01787 4489542420                     mov        dword ptr [rsp + 0x20], r10d
0178c 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01791 4489442424                     mov        dword ptr [rsp + 0x24], r8d
01796 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
0179b 4489542428                     mov        dword ptr [rsp + 0x28], r10d
017a0 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
017a5 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
017aa 448b54246c                     mov        r10d, dword ptr [rsp + 0x6c]
017af 4489542430                     mov        dword ptr [rsp + 0x30], r10d
017b4 448b542460                     mov        r10d, dword ptr [rsp + 0x60]
017b9 4489542440                     mov        dword ptr [rsp + 0x40], r10d
017be 448b442464                     mov        r8d, dword ptr [rsp + 0x64]
017c3 4489442444                     mov        dword ptr [rsp + 0x44], r8d
017c8 448b542468                     mov        r10d, dword ptr [rsp + 0x68]
017cd 4489542448                     mov        dword ptr [rsp + 0x48], r10d
017d2 4c8b942480000000               mov        r10, qword ptr [rsp + 0x80]
017da 4c89542450                     mov        qword ptr [rsp + 0x50], r10
017df 44895c245c                     mov        dword ptr [rsp + 0x5c], r11d
017e4 894c2460                       mov        dword ptr [rsp + 0x60], ecx
017e8 44894c2464                     mov        dword ptr [rsp + 0x64], r9d
017ed 6690                           nop        
017ef e8ec87b5ff                     call       0x7f4c1b9d7d60
017f4 0f1f8400ec180013               nop        dword ptr [rax + rax + 0x130018ec]
017fc be45ffffff                     mov        esi, 0xffffff45
01801 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01809 448b442408                     mov        r8d, dword ptr [rsp + 8]
0180e 44890424                       mov        dword ptr [rsp], r8d
01812 448b54244c                     mov        r10d, dword ptr [rsp + 0x4c]
01817 4489542404                     mov        dword ptr [rsp + 4], r10d
0181c 448b442410                     mov        r8d, dword ptr [rsp + 0x10]
01821 4489442408                     mov        dword ptr [rsp + 8], r8d
01826 4c8b542420                     mov        r10, qword ptr [rsp + 0x20]
0182b 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01830 448b44243c                     mov        r8d, dword ptr [rsp + 0x3c]
01835 448944240c                     mov        dword ptr [rsp + 0xc], r8d
0183a 448b542428                     mov        r10d, dword ptr [rsp + 0x28]
0183f 4489542420                     mov        dword ptr [rsp + 0x20], r10d
01844 448b442430                     mov        r8d, dword ptr [rsp + 0x30]
01849 4489442424                     mov        dword ptr [rsp + 0x24], r8d
0184e 448b542434                     mov        r10d, dword ptr [rsp + 0x34]
01853 4489542428                     mov        dword ptr [rsp + 0x28], r10d
01858 448b442438                     mov        r8d, dword ptr [rsp + 0x38]
0185d 448944242c                     mov        dword ptr [rsp + 0x2c], r8d
01862 448b542448                     mov        r10d, dword ptr [rsp + 0x48]
01867 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0186c 448b44246c                     mov        r8d, dword ptr [rsp + 0x6c]
01871 4489442434                     mov        dword ptr [rsp + 0x34], r8d
01876 448b442460                     mov        r8d, dword ptr [rsp + 0x60]
0187b 448944243c                     mov        dword ptr [rsp + 0x3c], r8d
01880 448b542464                     mov        r10d, dword ptr [rsp + 0x64]
01885 4489542448                     mov        dword ptr [rsp + 0x48], r10d
0188a 448b442468                     mov        r8d, dword ptr [rsp + 0x68]
0188f 448944244c                     mov        dword ptr [rsp + 0x4c], r8d
01894 895c2454                       mov        dword ptr [rsp + 0x54], ebx
01898 44895c2458                     mov        dword ptr [rsp + 0x58], r11d
0189d 6690                           nop        
0189f e83c87b5ff                     call       0x7f4c1b9d7d60
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
019af e82c86b5ff                     call       0x7f4c1b9d7d60
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
01a9b e84085b5ff                     call       0x7f4c1b9d7d60
01aa0 0f1f8400981b0016               nop        dword ptr [rax + rax + 0x16001b98]
01aa8 4585c0                         test       r8d, r8d
01aab 7f08                           jg         0x7f4c1be7f835
01aad 4533ed                         xor        r13d, r13d
01ab0 e910e6ffff                     jmp        0x7f4c1be7de45
01ab5 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01ab9 89742428                       mov        dword ptr [rsp + 0x28], esi
01abd 897c241c                       mov        dword ptr [rsp + 0x1c], edi
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
01af9 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01b01 488bf5                         mov        rsi, rbp
01b04 8b542408                       mov        edx, dword ptr [rsp + 8]
01b08 418bc8                         mov        ecx, r8d
01b0b e8d00fa9ff                     call       0x7f4c1b910860
01b10 0f1f8400081c0017               nop        dword ptr [rax + rax + 0x17001c08]
01b18 41bb40000000                   mov        r11d, 0x40
01b1e 442b5c2418                     sub        r11d, dword ptr [rsp + 0x18]
01b23 c462a1f7e8                     shlx       r13, rax, r11
01b28 48894424f8                     mov        qword ptr [rsp - 8], rax
01b2d 8b442404                       mov        eax, dword ptr [rsp + 4]
01b31 890424                         mov        dword ptr [rsp], eax
01b34 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01b39 448b44240c                     mov        r8d, dword ptr [rsp + 0xc]
01b3e 448b542410                     mov        r10d, dword ptr [rsp + 0x10]
01b43 448b5c2414                     mov        r11d, dword ptr [rsp + 0x14]
01b48 8b4c2418                       mov        ecx, dword ptr [rsp + 0x18]
01b4c 8b7c241c                       mov        edi, dword ptr [rsp + 0x1c]
01b50 8b742428                       mov        esi, dword ptr [rsp + 0x28]
01b54 8b54242c                       mov        edx, dword ptr [rsp + 0x2c]
01b58 e968e5ffff                     jmp        0x7f4c1be7de45
01b5d 4585c0                         test       r8d, r8d
01b60 7f08                           jg         0x7f4c1be7f8ea
01b62 4533f6                         xor        r14d, r14d
01b65 e99de5ffff                     jmp        0x7f4c1be7de87
01b6a 44894c242c                     mov        dword ptr [rsp + 0x2c], r9d
01b6f 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01b74 89542428                       mov        dword ptr [rsp + 0x28], edx
01b78 8974241c                       mov        dword ptr [rsp + 0x1c], esi
01b7c 897c2418                       mov        dword ptr [rsp + 0x18], edi
01b80 894c2414                       mov        dword ptr [rsp + 0x14], ecx
01b84 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
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
01bc2 418bc8                         mov        ecx, r8d
01bc5 894c2448                       mov        dword ptr [rsp + 0x48], ecx
01bc9 6690                           nop        
01bcb e8100fa9ff                     call       0x7f4c1b910860
01bd0 0f1f8400c81c0018               nop        dword ptr [rax + rax + 0x18001cc8]
01bd8 41ba80000000                   mov        r10d, 0x80
01bde 442b542414                     sub        r10d, dword ptr [rsp + 0x14]
01be3 c462a9f7f0                     shlx       r14, rax, r10
01be8 48894424f8                     mov        qword ptr [rsp - 8], rax
01bed 8b442404                       mov        eax, dword ptr [rsp + 4]
01bf1 890424                         mov        dword ptr [rsp], eax
01bf4 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01bf9 448b54240c                     mov        r10d, dword ptr [rsp + 0xc]
01bfe 448b5c2410                     mov        r11d, dword ptr [rsp + 0x10]
01c03 8b7c2418                       mov        edi, dword ptr [rsp + 0x18]
01c07 8b74241c                       mov        esi, dword ptr [rsp + 0x1c]
01c0b 8b542428                       mov        edx, dword ptr [rsp + 0x28]
01c0f 4c8b6c2430                     mov        r13, qword ptr [rsp + 0x30]
01c14 448b4c242c                     mov        r9d, dword ptr [rsp + 0x2c]
01c19 e9e9e4ffff                     jmp        0x7f4c1be7de87
01c1e 4533c0                         xor        r8d, r8d
01c21 e9dbedffff                     jmp        0x7f4c1be7e781
01c26 bee4ffffff                     mov        esi, 0xffffffe4
01c2b 48ffb42490000000               push       qword ptr [rsp + 0x90]
01c33 488f0424                       pop        qword ptr [rsp]
01c37 e8a483b5ff                     call       0x7f4c1b9d7d60
01c3c 0f1f8400341d0019               nop        dword ptr [rax + rax + 0x19001d34]
01c44 be5d000000                     mov        esi, 0x5d
01c49 6690                           nop        
01c4b e89083b5ff                     call       0x7f4c1b9d7d60
01c50 0f1f8400481d001a               nop        dword ptr [rax + rax + 0x1a001d48]
01c58 bef6ffffff                     mov        esi, 0xfffffff6
01c5d 6690                           nop        
01c5f e87c83b5ff                     call       0x7f4c1b9d7d60
01c64 0f1f84005c1d001b               nop        dword ptr [rax + rax + 0x1b001d5c]
01c6c bef6ffffff                     mov        esi, 0xfffffff6
01c71 6690                           nop        
01c73 e86883b5ff                     call       0x7f4c1b9d7d60
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
01cff e8dc82b5ff                     call       0x7f4c1b9d7d60
01d04 0f1f8400fc1d001d               nop        dword ptr [rax + rax + 0x1d001dfc]
01d0c bee4ffffff                     mov        esi, 0xffffffe4
01d11 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d19 488f0424                       pop        qword ptr [rsp]
01d1d 44895c2418                     mov        dword ptr [rsp + 0x18], r11d
01d22 48894424f8                     mov        qword ptr [rsp - 8], rax
01d27 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d2e 8944241c                       mov        dword ptr [rsp + 0x1c], eax
01d32 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d37 897c2430                       mov        dword ptr [rsp + 0x30], edi
01d3b 89542434                       mov        dword ptr [rsp + 0x34], edx
01d3f e89c82b5ff                     call       0x7f4c1b9d7d60
01d44 0f1f84003c1e001e               nop        dword ptr [rax + rax + 0x1e001e3c]
01d4c bee4ffffff                     mov        esi, 0xffffffe4
01d51 48ffb42490000000               push       qword ptr [rsp + 0x90]
01d59 488f0424                       pop        qword ptr [rsp]
01d5d 48894424f8                     mov        qword ptr [rsp - 8], rax
01d62 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01d69 89442418                       mov        dword ptr [rsp + 0x18], eax
01d6d 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01d72 897c241c                       mov        dword ptr [rsp + 0x1c], edi
01d76 89542430                       mov        dword ptr [rsp + 0x30], edx
01d7a 4c896c2438                     mov        qword ptr [rsp + 0x38], r13
01d7f 44894c2440                     mov        dword ptr [rsp + 0x40], r9d
01d84 666690                         nop        
01d87 e85482b5ff                     call       0x7f4c1b9d7d60
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
01e13 e8c881b5ff                     call       0x7f4c1b9d7d60
01e18 0f1f8400101f0020               nop        dword ptr [rax + rax + 0x20001f10]
01e20 beccffffff                     mov        esi, 0xffffffcc
01e25 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e2d 448b4c2408                     mov        r9d, dword ptr [rsp + 8]
01e32 44890c24                       mov        dword ptr [rsp], r9d
01e36 44895c2410                     mov        dword ptr [rsp + 0x10], r11d
01e3b 48894424f8                     mov        qword ptr [rsp - 8], rax
01e40 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e47 89442414                       mov        dword ptr [rsp + 0x14], eax
01e4b 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e50 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01e55 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01e5a 897c2428                       mov        dword ptr [rsp + 0x28], edi
01e5e 8954242c                       mov        dword ptr [rsp + 0x2c], edx
01e62 4489542434                     mov        dword ptr [rsp + 0x34], r10d
01e67 e87481b5ff                     call       0x7f4c1b9d7d60
01e6c 0f1f8400641f0021               nop        dword ptr [rax + rax + 0x21001f64]
01e74 beccffffff                     mov        esi, 0xffffffcc
01e79 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
01e81 448b5c2408                     mov        r11d, dword ptr [rsp + 8]
01e86 44891c24                       mov        dword ptr [rsp], r11d
01e8a 48894424f8                     mov        qword ptr [rsp - 8], rax
01e8f 8b8424a0000000                 mov        eax, dword ptr [rsp + 0xa0]
01e96 89442410                       mov        dword ptr [rsp + 0x10], eax
01e9a 488b4424f8                     mov        rax, qword ptr [rsp - 8]
01e9f 4c8b5c2420                     mov        r11, qword ptr [rsp + 0x20]
01ea4 4c895c2418                     mov        qword ptr [rsp + 0x18], r11
01ea9 897c2414                       mov        dword ptr [rsp + 0x14], edi
01ead 89542428                       mov        dword ptr [rsp + 0x28], edx
01eb1 4c896c2430                     mov        qword ptr [rsp + 0x30], r13
01eb6 44894c2438                     mov        dword ptr [rsp + 0x38], r9d
01ebb 448954243c                     mov        dword ptr [rsp + 0x3c], r10d
01ec0 666690                         nop        
01ec3 e81881b5ff                     call       0x7f4c1b9d7d60
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
01f3b e8a080b5ff                     call       0x7f4c1b9d7d60
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
01fc3 e81880b5ff                     call       0x7f4c1b9d7d60
01fc8 0f1f8400c0200024               nop        dword ptr [rax + rax + 0x240020c0]
01fd0 bef6ffffff                     mov        esi, 0xfffffff6
01fd5 6690                           nop        
01fd7 e80480b5ff                     call       0x7f4c1b9d7d60
01fdc 0f1f8400d4200025               nop        dword ptr [rax + rax + 0x250020d4]
01fe4 be5d000000                     mov        esi, 0x5d
01fe9 6690                           nop        
01feb e8f07fb5ff                     call       0x7f4c1b9d7d60
01ff0 0f1f8400e8200026               nop        dword ptr [rax + rax + 0x260020e8]
01ff8 be45ffffff                     mov        esi, 0xffffff45
01ffd 488bac2490000000               mov        rbp, qword ptr [rsp + 0x90]
02005 448b542408                     mov        r10d, dword ptr [rsp + 8]
0200a 44891424                       mov        dword ptr [rsp], r10d
0200e 448b542430                     mov        r10d, dword ptr [rsp + 0x30]
02013 4489542410                     mov        dword ptr [rsp + 0x10], r10d
02018 895c2414                       mov        dword ptr [rsp + 0x14], ebx
0201c 89442418                       mov        dword ptr [rsp + 0x18], eax
02020 448b9424a0000000               mov        r10d, dword ptr [rsp + 0xa0]
02028 4489542430                     mov        dword ptr [rsp + 0x30], r10d
0202d 4c89442450                     mov        qword ptr [rsp + 0x50], r8
02032 90                             nop        
02033 e8a87fb5ff                     call       0x7f4c1b9d7d60
02038 0f1f840030210027               nop        dword ptr [rax + rax + 0x27002130]
02040 bef6ffffff                     mov        esi, 0xfffffff6
02045 418be8                         mov        ebp, r8d
02048 666690                         nop        
0204b e8907fb5ff                     call       0x7f4c1b9d7d60
02050 0f1f840048210028               nop        dword ptr [rax + rax + 0x28002148]
02058 bef6ffffff                     mov        esi, 0xfffffff6
0205d 418bea                         mov        ebp, r10d
02060 666690                         nop        
02063 e8787fb5ff                     call       0x7f4c1b9d7d60
02068 0f1f840060210029               nop        dword ptr [rax + rax + 0x29002160]
02070 bef6ffffff                     mov        esi, 0xfffffff6
02075 418be8                         mov        ebp, r8d
02078 666690                         nop        
0207b e8607fb5ff                     call       0x7f4c1b9d7d60
02080 0f1f84007821002a               nop        dword ptr [rax + rax + 0x2a002178]
02088 bef6ffffff                     mov        esi, 0xfffffff6
0208d 6690                           nop        
0208f e84c7fb5ff                     call       0x7f4c1b9d7d60
02094 0f1f84008c21002b               nop        dword ptr [rax + rax + 0x2b00218c]
0209c bef6ffffff                     mov        esi, 0xfffffff6
020a1 6690                           nop        
020a3 e8387fb5ff                     call       0x7f4c1b9d7d60
020a8 0f1f8400a021002c               nop        dword ptr [rax + rax + 0x2c0021a0]
020b0 bef6ffffff                     mov        esi, 0xfffffff6
020b5 6690                           nop        
020b7 e8247fb5ff                     call       0x7f4c1b9d7d60
020bc 0f1f8400b421002d               nop        dword ptr [rax + rax + 0x2d0021b4]
020c4 bef6ffffff                     mov        esi, 0xfffffff6
020c9 6690                           nop        
020cb e8107fb5ff                     call       0x7f4c1b9d7d60
020d0 0f1f8400c821002e               nop        dword ptr [rax + rax + 0x2e0021c8]
020d8 bef6ffffff                     mov        esi, 0xfffffff6
020dd 6690                           nop        
020df e8fc7eb5ff                     call       0x7f4c1b9d7d60
020e4 0f1f8400dc21002f               nop        dword ptr [rax + rax + 0x2f0021dc]
020ec bef6ffffff                     mov        esi, 0xfffffff6
020f1 6690                           nop        
020f3 e8e87eb5ff                     call       0x7f4c1b9d7d60
020f8 0f1f8400f0210030               nop        dword ptr [rax + rax + 0x300021f0]
02100 bef6ffffff                     mov        esi, 0xfffffff6
02105 6690                           nop        
02107 e8d47eb5ff                     call       0x7f4c1b9d7d60
0210c 0f1f840004220031               nop        dword ptr [rax + rax + 0x31002204]
02114 eb08                           jmp        0x7f4c1be7fe9e
02116 eb06                           jmp        0x7f4c1be7fe9e
02118 eb04                           jmp        0x7f4c1be7fe9e
0211a eb02                           jmp        0x7f4c1be7fe9e
0211c eb00                           jmp        0x7f4c1be7fe9e
0211e 488bf0                         mov        rsi, rax
02121 e942e9ffff                     jmp        0x7f4c1be7e7e8
02126 49bab7e7e71b4c7f0000           movabs     r10, 0x7f4c1be7e7b7
02130 4d899710050000                 mov        qword ptr [r15 + 0x510], r10
02137 e92430a9ff                     jmp        0x7f4c1b912ee0
0213c e8dffba7ff                     call       0x7f4c1b8ffaa0
02141 e9d8deffff                     jmp        0x7f4c1be7dd9e
02146 f4                             hlt        
02147 f4                             hlt        
