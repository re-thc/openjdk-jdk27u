00000 90                             nop        
00001 90                             nop        
00002 90                             nop        
00003 90                             nop        
00004 90                             nop        
00005 90                             nop        
00006 90                             nop        
00007 90                             nop        
00008 90                             nop        
00009 90                             nop        
0000a 90                             nop        
0000b 90                             nop        
0000c 90                             nop        
0000d 90                             nop        
0000e 90                             nop        
0000f 448b16                         mov        r10d, dword ptr [rsi]
00012 41c1ea0d                       shr        r10d, 0xd
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0945f07                   jne        0x7f346372ed60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ecd0030000                 sub        rsp, 0x3d0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f345c1358bf
0003a e821995e07                     call       0x7f346371f1e0
0003f 898c2420010000                 mov        dword ptr [rsp + 0x120], ecx
00046 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0004e 4c898c2430010000               mov        qword ptr [rsp + 0x130], r9
00056 89bc2424010000                 mov        dword ptr [rsp + 0x124], edi
0005d 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
00067 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0006a 83c002                         add        eax, 2
0006d 894378                         mov        dword ptr [rbx + 0x78], eax
00070 25fe070000                     and        eax, 0x7fe
00075 85c0                           test       eax, eax
00077 0f84db480000                   je         0x7f345c13a1d8
0007d 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
00087 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0008d 8b9c24e0030000                 mov        ebx, dword ptr [rsp + 0x3e0]
00094 8b4640                         mov        eax, dword ptr [rsi + 0x40]
00097 4c3b257a84b91f                 cmp        r12, qword ptr [rip + 0x1fb9847a]
0009e 0f8414000000                   je         0x7f345c135938
000a4 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
000ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
000b2 e8296cf61e                     call       0x7f347b09c560
000b7 f4                             hlt        
000b8 448b5e38                       mov        r11d, dword ptr [rsi + 0x38]
000bc 448b6e04                       mov        r13d, dword ptr [rsi + 4]
000c0 4c8b7608                       mov        r14, qword ptr [rsi + 8]
000c4 488b4e10                       mov        rcx, qword ptr [rsi + 0x10]
000c8 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000cc 4d63cb                         movsxd     r9, r11d
000cf 4d03ce                         add        r9, r14
000d2 498bfd                         mov        rdi, r13
000d5 412bfb                         sub        edi, r11d
000d8 3bdf                           cmp        ebx, edi
000da 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
000e4 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000ec b800010000                     mov        eax, 0x100
000f1 7f05                           jg         0x7f345c135978
000f3 b810010000                     mov        eax, 0x110
000f8 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00100 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00104 4d8d5b01                       lea        r11, [r11 + 1]
00108 4c891c07                       mov        qword ptr [rdi + rax], r11
0010c 0f8fb7440000                   jg         0x7f345c139e49
00112 4863db                         movsxd     rbx, ebx
00115 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
00119 492bf9                         sub        rdi, r9
0011c 483bfb                         cmp        rdi, rbx
0011f 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
00129 b830010000                     mov        eax, 0x130
0012e 7c05                           jl         0x7f345c1359b5
00130 b820010000                     mov        eax, 0x120
00135 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00139 4d8d5b01                       lea        r11, [r11 + 1]
0013d 4c891c07                       mov        qword ptr [rdi + rax], r11
00141 0f8c82440000                   jl         0x7f345c139e49
00147 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
00151 ff8760010000                   inc        dword ptr [rdi + 0x160]
00157 498bf8                         mov        rdi, r8
0015a 4883ff00                       cmp        rdi, 0
0015e 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
00168 b870010000                     mov        eax, 0x170
0016d 7505                           jne        0x7f345c1359f4
0016f b880010000                     mov        eax, 0x180
00174 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00178 4d8d5b01                       lea        r11, [r11 + 1]
0017c 4c891c07                       mov        qword ptr [rdi + rax], r11
00180 0f8531000000                   jne        0x7f345c135a37
00186 4903d9                         add        rbx, r9
00189 488bf9                         mov        rdi, rcx
0018c 483bfb                         cmp        rdi, rbx
0018f 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
00199 bba0010000                     mov        ebx, 0x1a0
0019e 7d05                           jge        0x7f345c135a25
001a0 bb90010000                     mov        ebx, 0x190
001a5 488b041f                       mov        rax, qword ptr [rdi + rbx]
001a9 488d4001                       lea        rax, [rax + 1]
001ad 4889041f                       mov        qword ptr [rdi + rbx], rax
001b1 0f8d0a000000                   jge        0x7f345c135a41
001b7 bf00000000                     mov        edi, 0
001bc e915000000                     jmp        0x7f345c135a56
001c1 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
001cb ff87b0010000                   inc        dword ptr [rdi + 0x1b0]
001d1 bf01000000                     mov        edi, 1
001d6 4d2bc6                         sub        r8, r14
001d9 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
001e3 488383c801000001               add        qword ptr [rbx + 0x1c8], 1
001eb 48bb50bc6d50347f0000           movabs     rbx, 0x7f34506dbc50
001f5 8b4378                         mov        eax, dword ptr [rbx + 0x78]
001f8 83c002                         add        eax, 2
001fb 894378                         mov        dword ptr [rbx + 0x78], eax
001fe 25feff1f00                     and        eax, 0x1ffffe
00203 85c0                           test       eax, eax
00205 0f846e470000                   je         0x7f345c13a1f9
0020b 48bbffffffffffffff7f           movabs     rbx, 0x7fffffffffffffff
00215 483bd9                         cmp        rbx, rcx
00218 48bb50bc6d50347f0000           movabs     rbx, 0x7f34506dbc50
00222 b8c0000000                     mov        eax, 0xc0
00227 7d05                           jge        0x7f345c135aae
00229 b8b0000000                     mov        eax, 0xb0
0022e 4c8b0c03                       mov        r9, qword ptr [rbx + rax]
00232 4d8d4901                       lea        r9, [r9 + 1]
00236 4c890c03                       mov        qword ptr [rbx + rax], r9
0023a 0f8d0f000000                   jge        0x7f345c135acf
00240 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
0024a e910000000                     jmp        0x7f345c135adf
0024f 48bb50bc6d50347f0000           movabs     rbx, 0x7f34506dbc50
00259 ff83d0000000                   inc        dword ptr [rbx + 0xd0]
0025f 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00267 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0026f 488b9c24e8030000               mov        rbx, qword ptr [rsp + 0x3e8]
00277 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
0027f 498bf5                         mov        rsi, r13
00282 83ee20                         sub        esi, 0x20
00285 448b4a04                       mov        r9d, dword ptr [rdx + 4]
00289 4183e920                       sub        r9d, 0x20
0028d 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
00295 8b9c2424010000                 mov        ebx, dword ptr [rsp + 0x124]
0029c 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
002a3 488b9c2430010000               mov        rbx, qword ptr [rsp + 0x130]
002ab 48899c2458010000               mov        qword ptr [rsp + 0x158], rbx
002b3 488b9c2428010000               mov        rbx, qword ptr [rsp + 0x128]
002bb 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
002c3 8b9c2420010000                 mov        ebx, dword ptr [rsp + 0x120]
002ca 899c2468010000                 mov        dword ptr [rsp + 0x168], ebx
002d1 488b9c2448010000               mov        rbx, qword ptr [rsp + 0x148]
002d9 89b4246c010000                 mov        dword ptr [rsp + 0x16c], esi
002e0 be00000000                     mov        esi, 0
002e5 89b42470010000                 mov        dword ptr [rsp + 0x170], esi
002ec be00000000                     mov        esi, 0
002f1 44898c2474010000               mov        dword ptr [rsp + 0x174], r9d
002f9 48898c2478010000               mov        qword ptr [rsp + 0x178], rcx
00301 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
00309 89bc24a0010000                 mov        dword ptr [rsp + 0x1a0], edi
00310 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
00318 4489ac2488010000               mov        dword ptr [rsp + 0x188], r13d
00320 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
00328 4889842480010000               mov        qword ptr [rsp + 0x180], rax
00330 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
00338 488b842458010000               mov        rax, qword ptr [rsp + 0x158]
00340 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
00348 448b842468010000               mov        r8d, dword ptr [rsp + 0x168]
00350 4889942490010000               mov        qword ptr [rsp + 0x190], rdx
00358 48899c2498010000               mov        qword ptr [rsp + 0x198], rbx
00360 8b942470010000                 mov        edx, dword ptr [rsp + 0x170]
00367 8b9c2444010000                 mov        ebx, dword ptr [rsp + 0x144]
0036e 90                             nop        
0036f 90                             nop        
00370 3bd3                           cmp        edx, ebx
00372 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
00379 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
00383 41bbd8010000                   mov        r11d, 0x1d8
00389 7d06                           jge        0x7f345c135c11
0038b 41bbe8010000                   mov        r11d, 0x1e8
00391 4e8b2c1b                       mov        r13, qword ptr [rbx + r11]
00395 4d8d6d01                       lea        r13, [r13 + 1]
00399 4e892c1b                       mov        qword ptr [rbx + r11], r13
0039d 0f8da03f0000                   jge        0x7f345c139bc3
003a3 3b5704                         cmp        edx, dword ptr [rdi + 4]
003a6 0f8339460000                   jae        0x7f345c13a265
003ac 4863ca                         movsxd     rcx, edx
003af 4c8b5ccf08                     mov        r11, qword ptr [rdi + rcx*8 + 8]
003b4 418bcb                         mov        ecx, r11d
003b7 81e1ffff0100                   and        ecx, 0x1ffff
003bd 898c24b8010000                 mov        dword ptr [rsp + 0x1b8], ecx
003c4 4c8be9                         mov        r13, rcx
003c7 b912000000                     mov        ecx, 0x12
003cc 4889bc2460010000               mov        qword ptr [rsp + 0x160], rdi
003d4 498bfb                         mov        rdi, r11
003d7 48d3ef                         shr        rdi, cl
003da 8bff                           mov        edi, edi
003dc 81e7ffff0300                   and        edi, 0x3ffff
003e2 89bc24a4010000                 mov        dword ptr [rsp + 0x1a4], edi
003e9 b924000000                     mov        ecx, 0x24
003ee 49d3fb                         sar        r11, cl
003f1 458bdb                         mov        r11d, r11d
003f4 4585db                         test       r11d, r11d
003f7 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
00401 bff8010000                     mov        edi, 0x1f8
00406 7d05                           jge        0x7f345c135c8d
00408 bf08020000                     mov        edi, 0x208
0040d 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
00411 488d5b01                       lea        rbx, [rbx + 1]
00415 48891c39                       mov        qword ptr [rcx + rdi], rbx
00419 0f8d13000000                   jge        0x7f345c135cb2
0041f 3b5004                         cmp        edx, dword ptr [rax + 4]
00422 0f8311460000                   jae        0x7f345c13a2b9
00428 4863ca                         movsxd     rcx, edx
0042b 8b4c8808                       mov        ecx, dword ptr [rax + rcx*4 + 8]
0042f 4c8bd9                         mov        r11, rcx
00432 4585ed                         test       r13d, r13d
00435 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
0043f bf18020000                     mov        edi, 0x218
00444 7405                           je         0x7f345c135ccb
00446 bf28020000                     mov        edi, 0x228
0044b 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0044f 488d5b01                       lea        rbx, [rbx + 1]
00453 48891c39                       mov        qword ptr [rcx + rdi], rbx
00457 0f8430000000                   je         0x7f345c135d0d
0045d 498bd8                         mov        rbx, r8
00460 2bde                           sub        ebx, esi
00462 443beb                         cmp        r13d, ebx
00465 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
0046f bf48020000                     mov        edi, 0x248
00474 7f05                           jg         0x7f345c135cfb
00476 bf38020000                     mov        edi, 0x238
0047b 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
0047f 488d5b01                       lea        rbx, [rbx + 1]
00483 48891c39                       mov        qword ptr [rcx + rdi], rbx
00487 0f8f9c400000                   jg         0x7f345c139da9
0048d 4183fb03                       cmp        r11d, 3
00491 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
0049b bf68020000                     mov        edi, 0x268
004a0 7e05                           jle        0x7f345c135d27
004a2 bf78020000                     mov        edi, 0x278
004a7 488b1c39                       mov        rbx, qword ptr [rcx + rdi]
004ab 488d5b01                       lea        rbx, [rbx + 1]
004af 48891c39                       mov        qword ptr [rcx + rdi], rbx
004b3 0f8e9c000000                   jle        0x7f345c135dd5
004b9 4183eb03                       sub        r11d, 3
004bd 4183790401                     cmp        dword ptr [r9 + 4], 1
004c2 0f86c5450000                   jbe        0x7f345c13a30d
004c8 418b490c                       mov        ecx, dword ptr [r9 + 0xc]
004cc 4183790402                     cmp        dword ptr [r9 + 4], 2
004d1 0f86dc450000                   jbe        0x7f345c13a333
004d7 41894910                       mov        dword ptr [r9 + 0x10], ecx
004db 4183790400                     cmp        dword ptr [r9 + 4], 0
004e0 0f86f3450000                   jbe        0x7f345c13a359
004e6 418b4908                       mov        ecx, dword ptr [r9 + 8]
004ea 4183790401                     cmp        dword ptr [r9 + 4], 1
004ef 0f860a460000                   jbe        0x7f345c13a37f
004f5 4189490c                       mov        dword ptr [r9 + 0xc], ecx
004f9 4183790400                     cmp        dword ptr [r9 + 4], 0
004fe 0f8621460000                   jbe        0x7f345c13a3a5
00504 45895908                       mov        dword ptr [r9 + 8], r11d
00508 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
00512 ff8188020000                   inc        dword ptr [rcx + 0x288]
00518 498bcd                         mov        rcx, r13
0051b 89942470010000                 mov        dword ptr [rsp + 0x170], edx
00522 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
0052a 89b424bc010000                 mov        dword ptr [rsp + 0x1bc], esi
00531 8b9c248c010000                 mov        ebx, dword ptr [rsp + 0x18c]
00538 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00540 4889842458010000               mov        qword ptr [rsp + 0x158], rax
00548 4489842468010000               mov        dword ptr [rsp + 0x168], r8d
00550 e968000000                     jmp        0x7f345c135e3d
00555 89942470010000                 mov        dword ptr [rsp + 0x170], edx
0055c 89b424bc010000                 mov        dword ptr [rsp + 0x1bc], esi
00563 4889842458010000               mov        qword ptr [rsp + 0x158], rax
0056b 4489842468010000               mov        dword ptr [rsp + 0x168], r8d
00573 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
0057d 488387a002000001               add        qword ptr [rdi + 0x2a0], 1
00585 498bf1                         mov        rsi, r9
00588 498bd3                         mov        rdx, r11
0058b 498bcd                         mov        rcx, r13
0058e 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00596 90                             nop        
00597 e8449e5f07                     call       0x7f346372fc60
0059c 0f1f840094060000               nop        dword ptr [rax + rax + 0x694]
005a4 4c8bd8                         mov        r11, rax
005a7 8b8c24b8010000                 mov        ecx, dword ptr [rsp + 0x1b8]
005ae 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
005b6 8b9c248c010000                 mov        ebx, dword ptr [rsp + 0x18c]
005bd 4863f3                         movsxd     rsi, ebx
005c0 4903f6                         add        rsi, r14
005c3 4863d1                         movsxd     rdx, ecx
005c6 4803f2                         add        rsi, rdx
005c9 4963fb                         movsxd     rdi, r11d
005cc 488bd6                         mov        rdx, rsi
005cf 483bd7                         cmp        rdx, rdi
005d2 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
005dc 41b8c0020000                   mov        r8d, 0x2c0
005e2 7d06                           jge        0x7f345c135e6a
005e4 41b8b0020000                   mov        r8d, 0x2b0
005ea 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
005ee 4d8d4901                       lea        r9, [r9 + 1]
005f2 4e890c02                       mov        qword ptr [rdx + r8], r9
005f6 0f8d14000000                   jge        0x7f345c135e90
005fc 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
00604 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
0060b e9b2000000                     jmp        0x7f345c135f42
00610 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
00617 85c0                           test       eax, eax
00619 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
00623 41b8d0020000                   mov        r8d, 0x2d0
00629 7506                           jne        0x7f345c135eb1
0062b 41b8e0020000                   mov        r8d, 0x2e0
00631 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00635 4d8d4901                       lea        r9, [r9 + 1]
00639 4e890c02                       mov        qword ptr [rdx + r8], r9
0063d 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
00645 0f856d000000                   jne        0x7f345c135f38
0064b 488bd3                         mov        rdx, rbx
0064e 03d1                           add        edx, ecx
00650 412bd3                         sub        edx, r11d
00653 4863d2                         movsxd     rdx, edx
00656 493bd0                         cmp        rdx, r8
00659 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
00663 41b9f0020000                   mov        r9d, 0x2f0
00669 7c06                           jl         0x7f345c135ef1
0066b 41b900030000                   mov        r9d, 0x300
00671 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
00675 4d8d6d01                       lea        r13, [r13 + 1]
00679 4e892c0a                       mov        qword ptr [rdx + r9], r13
0067d 0f8c3f000000                   jl         0x7f345c135f42
00683 488b942478010000               mov        rdx, qword ptr [rsp + 0x178]
0068b 483bd7                         cmp        rdx, rdi
0068e 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
00698 41b920030000                   mov        r9d, 0x320
0069e 7c06                           jl         0x7f345c135f26
006a0 41b910030000                   mov        r9d, 0x310
006a6 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
006aa 4d8d6d01                       lea        r13, [r13 + 1]
006ae 4e892c0a                       mov        qword ptr [rdx + r9], r13
006b2 0f8c0a000000                   jl         0x7f345c135f42
006b8 ba00000000                     mov        edx, 0
006bd e915000000                     jmp        0x7f345c135f57
006c2 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
006cc ff8230030000                   inc        dword ptr [rdx + 0x330]
006d2 ba01000000                     mov        edx, 1
006d7 4889bc24c0010000               mov        qword ptr [rsp + 0x1c0], rdi
006df 4585db                         test       r11d, r11d
006e2 49b948e76250347f0000           movabs     r9, 0x7f345062e748
006ec 41bd48030000                   mov        r13d, 0x348
006f2 7e06                           jle        0x7f345c135f7a
006f4 41bd58030000                   mov        r13d, 0x358
006fa 4b8b3c29                       mov        rdi, qword ptr [r9 + r13]
006fe 488d7f01                       lea        rdi, [rdi + 1]
00702 4b893c29                       mov        qword ptr [r9 + r13], rdi
00706 0f8e8b3b0000                   jle        0x7f345c139b17
0070c 85d2                           test       edx, edx
0070e 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
00718 41b978030000                   mov        r9d, 0x378
0071e 7506                           jne        0x7f345c135fa6
00720 41b968030000                   mov        r9d, 0x368
00726 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
0072a 488d7f01                       lea        rdi, [rdi + 1]
0072e 4a893c0a                       mov        qword ptr [rdx + r9], rdi
00732 0f855f3b0000                   jne        0x7f345c139b17
00738 4c8beb                         mov        r13, rbx
0073b 4403e9                         add        r13d, ecx
0073e 4489ac2404020000               mov        dword ptr [rsp + 0x204], r13d
00746 498bf5                         mov        rsi, r13
00749 03b424a4010000                 add        esi, dword ptr [rsp + 0x1a4]
00750 3bb4246c010000                 cmp        esi, dword ptr [rsp + 0x16c]
00757 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
00761 ba30040000                     mov        edx, 0x430
00766 7f05                           jg         0x7f345c135fed
00768 ba40040000                     mov        edx, 0x440
0076d 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00771 4d8d4901                       lea        r9, [r9 + 1]
00775 4c890c16                       mov        qword ptr [rsi + rdx], r9
00779 0f8f41000000                   jg         0x7f345c136040
0077f 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
00786 03f1                           add        esi, ecx
00788 89b424fc010000                 mov        dword ptr [rsp + 0x1fc], esi
0078f 3bb42474010000                 cmp        esi, dword ptr [rsp + 0x174]
00796 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
007a0 41b960040000                   mov        r9d, 0x460
007a6 7e06                           jle        0x7f345c13602e
007a8 41b950040000                   mov        r9d, 0x450
007ae 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
007b2 488d7f01                       lea        rdi, [rdi + 1]
007b6 4a893c0a                       mov        qword ptr [rdx + r9], rdi
007ba 0f8e43010000                   jle        0x7f345c136183
007c0 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
007c7 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
007cf 898424a0010000                 mov        dword ptr [rsp + 0x1a0], eax
007d6 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
007de 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
007e8 4883862008000001               add        qword ptr [rsi + 0x820], 1
007f0 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
007f8 488bd3                         mov        rdx, rbx
007fb 488bd9                         mov        rbx, rcx
007fe 8b8c2488010000                 mov        ecx, dword ptr [rsp + 0x188]
00805 4c8b842490010000               mov        r8, qword ptr [rsp + 0x190]
0080d 448b8c24bc010000               mov        r9d, dword ptr [rsp + 0x1bc]
00815 488bc7                         mov        rax, rdi
00818 488bfb                         mov        rdi, rbx
0081b 44891c24                       mov        dword ptr [rsp], r11d
0081f 89442408                       mov        dword ptr [rsp + 8], eax
00823 90                             nop        
00824 90                             nop        
00825 90                             nop        
00826 90                             nop        
00827 e8b49b5f07                     call       0x7f346372fc60
0082c 0f1f840024090001               nop        dword ptr [rax + rax + 0x1000924]
00834 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
0083b 03b424b8010000                 add        esi, dword ptr [rsp + 0x1b8]
00842 8bbc2470010000                 mov        edi, dword ptr [rsp + 0x170]
00849 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
00851 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
00858 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
00860 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
00868 8b9424a0010000                 mov        edx, dword ptr [rsp + 0x1a0]
0086f 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
00877 448bac2488010000               mov        r13d, dword ptr [rsp + 0x188]
0087f 4c8b9c2480010000               mov        r11, qword ptr [rsp + 0x180]
00887 4c899c24c8010000               mov        qword ptr [rsp + 0x1c8], r11
0088f 4c8b9c2450010000               mov        r11, qword ptr [rsp + 0x150]
00897 4c899c24d0010000               mov        qword ptr [rsp + 0x1d0], r11
0089f 448b9c2444010000               mov        r11d, dword ptr [rsp + 0x144]
008a7 44899c24d8010000               mov        dword ptr [rsp + 0x1d8], r11d
008af 4c8b9c2458010000               mov        r11, qword ptr [rsp + 0x158]
008b7 4c899c24e0010000               mov        qword ptr [rsp + 0x1e0], r11
008bf 4c8b9c2460010000               mov        r11, qword ptr [rsp + 0x160]
008c7 4c899c24e8010000               mov        qword ptr [rsp + 0x1e8], r11
008cf 448b9c2468010000               mov        r11d, dword ptr [rsp + 0x168]
008d7 44899c24dc010000               mov        dword ptr [rsp + 0x1dc], r11d
008df 4c8b9c2490010000               mov        r11, qword ptr [rsp + 0x190]
008e7 4c899c24f0010000               mov        qword ptr [rsp + 0x1f0], r11
008ef 4c8b9c2498010000               mov        r11, qword ptr [rsp + 0x198]
008f7 8984248c030000                 mov        dword ptr [rsp + 0x38c], eax
008fe e95a380000                     jmp        0x7f345c1399dd
00903 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
0090b 898424a0010000                 mov        dword ptr [rsp + 0x1a0], eax
00912 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
0091a 8b8424a4010000                 mov        eax, dword ptr [rsp + 0x1a4]
00921 83f910                         cmp        ecx, 0x10
00924 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
0092e 41b870040000                   mov        r8d, 0x470
00934 7f06                           jg         0x7f345c1361bc
00936 41b880040000                   mov        r8d, 0x480
0093c 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
00940 4d8d4901                       lea        r9, [r9 + 1]
00944 4e890c02                       mov        qword ptr [rdx + r8], r9
00948 0f8f830a0000                   jg         0x7f345c136c51
0094e 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
00956 49b848e76250347f0000           movabs     r8, 0x7f345062e748
00960 4983809004000001               add        qword ptr [r8 + 0x490], 1
00968 49b800986d50347f0000           movabs     r8, 0x7f34506d9800
00972 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
00976 4183c102                       add        r9d, 2
0097a 45894878                       mov        dword ptr [r8 + 0x78], r9d
0097e 4181e1feff1f00                 and        r9d, 0x1ffffe
00985 4585c9                         test       r9d, r9d
00988 0f84bd410000                   je         0x7f345c13a3cb
0098e 49b820936ee200000000           movabs     r8, 0xe26e9320
00998 49b900986d50347f0000           movabs     r9, 0x7f34506d9800
009a2 458b00                         mov        r8d, dword ptr [r8]
009a5 41c1e80d                       shr        r8d, 0xd
009a9 49c1e00a                       shl        r8, 0xa
009ad 41ba00000033                   mov        r10d, 0x33000000
009b3 4d03c2                         add        r8, r10
009b6 41ba17000000                   mov        r10d, 0x17
009bc 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
009c0 7436                           je         0x7f345c136278
009c2 4983c202                       add        r10, 2
009c6 4983fa1b                       cmp        r10, 0x1b
009ca 75f0                           jne        0x7f345c13623c
009cc 41ba17000000                   mov        r10d, 0x17
009d2 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
009d7 7412                           je         0x7f345c13626b
009d9 4983c202                       add        r10, 2
009dd 4983fa1b                       cmp        r10, 0x1b
009e1 75ef                           jne        0x7f345c136252
009e3 41ba16000000                   mov        r10d, 0x16
009e9 eb11                           jmp        0x7f345c13627c
009eb 50                             push       rax
009ec 4833c0                         xor        rax, rax
009ef f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
009f5 58                             pop        rax
009f6 ebbe                           jmp        0x7f345c136236
009f8 4983c201                       add        r10, 1
009fc 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00a01 448b4204                       mov        r8d, dword ptr [rdx + 4]
00a05 49b900986d50347f0000           movabs     r9, 0x7f34506d9800
00a0f 498381e000000001               add        qword ptr [r9 + 0xe0], 1
00a17 49b9088e6d50347f0000           movabs     r9, 0x7f34506d8e08
00a21 418b7978                       mov        edi, dword ptr [r9 + 0x78]
00a25 83c702                         add        edi, 2
00a28 41897978                       mov        dword ptr [r9 + 0x78], edi
00a2c 81e7feff1f00                   and        edi, 0x1ffffe
00a32 85ff                           test       edi, edi
00a34 0f844b410000                   je         0x7f345c13a405
00a3a 448bb424bc010000               mov        r14d, dword ptr [rsp + 0x1bc]
00a42 49b9088e6d50347f0000           movabs     r9, 0x7f34506d8e08
00a4c 4983811001000001               add        qword ptr [r9 + 0x110], 1
00a54 4183e80f                       sub        r8d, 0xf
00a58 49b998846d50347f0000           movabs     r9, 0x7f34506d8498
00a62 418b7978                       mov        edi, dword ptr [r9 + 0x78]
00a66 83c702                         add        edi, 2
00a69 41897978                       mov        dword ptr [r9 + 0x78], edi
00a6d 81e7feff1f00                   and        edi, 0x1ffffe
00a73 85ff                           test       edi, edi
00a75 0f842b410000                   je         0x7f345c13a426
00a7b 49b998846d50347f0000           movabs     r9, 0x7f34506d8498
00a85 498381b000000001               add        qword ptr [r9 + 0xb0], 1
00a8d 49b90000000000000000           movabs     r9, 0
00a97 41b900000000                   mov        r9d, 0
00a9d 453bf1                         cmp        r14d, r9d
00aa0 0f8c21410000                   jl         0x7f345c13a447
00aa6 453bf0                         cmp        r14d, r8d
00aa9 0f8d39410000                   jge        0x7f345c13a468
00aaf 4d8bc6                         mov        r8, r14
00ab2 44898424f8010000               mov        dword ptr [rsp + 0x1f8], r8d
00aba 49b920936ee200000000           movabs     r9, 0xe26e9320
00ac4 498bf9                         mov        rdi, r9
00ac7 49b800986d50347f0000           movabs     r8, 0x7f34506d9800
00ad1 8b3f                           mov        edi, dword ptr [rdi]
00ad3 c1ef0d                         shr        edi, 0xd
00ad6 48c1e70a                       shl        rdi, 0xa
00ada 41ba00000033                   mov        r10d, 0x33000000
00ae0 4903fa                         add        rdi, r10
00ae3 41ba25000000                   mov        r10d, 0x25
00ae9 4b3b3cd0                       cmp        rdi, qword ptr [r8 + r10*8]
00aed 7436                           je         0x7f345c1363a5
00aef 4983c202                       add        r10, 2
00af3 4983fa29                       cmp        r10, 0x29
00af7 75f0                           jne        0x7f345c136369
00af9 41ba25000000                   mov        r10d, 0x25
00aff 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
00b04 7412                           je         0x7f345c136398
00b06 4983c202                       add        r10, 2
00b0a 4983fa29                       cmp        r10, 0x29
00b0e 75ef                           jne        0x7f345c13637f
00b10 41ba24000000                   mov        r10d, 0x24
00b16 eb11                           jmp        0x7f345c1363a9
00b18 50                             push       rax
00b19 4833c0                         xor        rax, rax
00b1c f04b0fb13cd0                   lock cmpxchg qword ptr [r8 + r10*8], rdi
00b22 58                             pop        rax
00b23 ebbe                           jmp        0x7f345c136363
00b25 4983c201                       add        r10, 1
00b29 4b8304d001                     add        qword ptr [r8 + r10*8], 1
00b2e 48bea0856d50347f0000           movabs     rsi, 0x7f34506d85a0
00b38 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00b3c 4183c002                       add        r8d, 2
00b40 44894678                       mov        dword ptr [rsi + 0x78], r8d
00b44 4181e0feff1f00                 and        r8d, 0x1ffffe
00b4b 4585c0                         test       r8d, r8d
00b4e 0f84b5400000                   je         0x7f345c13a489
00b54 48bea0856d50347f0000           movabs     rsi, 0x7f34506d85a0
00b5e 488386b000000001               add        qword ptr [rsi + 0xb0], 1
00b66 48bed0866d50347f0000           movabs     rsi, 0x7f34506d86d0
00b70 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00b74 4183c002                       add        r8d, 2
00b78 44894678                       mov        dword ptr [rsi + 0x78], r8d
00b7c 4181e0feff1f00                 and        r8d, 0x1ffffe
00b83 4585c0                         test       r8d, r8d
00b86 0f849e400000                   je         0x7f345c13a4aa
00b8c 48bed0866d50347f0000           movabs     rsi, 0x7f34506d86d0
00b96 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
00b9c 448b8424f8010000               mov        r8d, dword ptr [rsp + 0x1f8]
00ba4 44899c2400020000               mov        dword ptr [rsp + 0x200], r11d
00bac 4489b424bc010000               mov        dword ptr [rsp + 0x1bc], r14d
00bb4 899c248c010000                 mov        dword ptr [rsp + 0x18c], ebx
00bbb 49b918136fe200000000           movabs     r9, 0xe26f1318
00bc5 4d8bf1                         mov        r14, r9
00bc8 48bb00986d50347f0000           movabs     rbx, 0x7f34506d9800
00bd2 4883836001000001               add        qword ptr [rbx + 0x160], 1
00bda 48bbd0996d50347f0000           movabs     rbx, 0x7f34506d99d0
00be4 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00be7 83c002                         add        eax, 2
00bea 894378                         mov        dword ptr [rbx + 0x78], eax
00bed 25feff1f00                     and        eax, 0x1ffffe
00bf2 85c0                           test       eax, eax
00bf4 0f8451400000                   je         0x7f345c13a4cb
00bfa 498bd9                         mov        rbx, r9
00bfd 48b8d0996d50347f0000           movabs     rax, 0x7f34506d99d0
00c07 488380b000000001               add        qword ptr [rax + 0xb0], 1
00c0f 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
00c19 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00c1c 83c002                         add        eax, 2
00c1f 894378                         mov        dword ptr [rbx + 0x78], eax
00c22 25feff1f00                     and        eax, 0x1ffffe
00c27 85c0                           test       eax, eax
00c29 0f843d400000                   je         0x7f345c13a4ec
00c2f 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
00c39 488383c000000001               add        qword ptr [rbx + 0xc0], 1
00c41 49b9888f6d50347f0000           movabs     r9, 0x7f34506d8f88
00c4b 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
00c4f 83c302                         add        ebx, 2
00c52 41895978                       mov        dword ptr [r9 + 0x78], ebx
00c56 81e3feff1f00                   and        ebx, 0x1ffffe
00c5c 85db                           test       ebx, ebx
00c5e 0f8429400000                   je         0x7f345c13a50d
00c64 49b920936ee200000000           movabs     r9, 0xe26e9320
00c6e 498bd9                         mov        rbx, r9
00c71 48b8b89a6d50347f0000           movabs     rax, 0x7f34506d9ab8
00c7b 8b1b                           mov        ebx, dword ptr [rbx]
00c7d c1eb0d                         shr        ebx, 0xd
00c80 48c1e30a                       shl        rbx, 0xa
00c84 41ba00000033                   mov        r10d, 0x33000000
00c8a 4903da                         add        rbx, r10
00c8d 41ba1d000000                   mov        r10d, 0x1d
00c93 4a3b1cd0                       cmp        rbx, qword ptr [rax + r10*8]
00c97 743c                           je         0x7f345c136555
00c99 4983c202                       add        r10, 2
00c9d 4983fa21                       cmp        r10, 0x21
00ca1 75f0                           jne        0x7f345c136513
00ca3 41ba1d000000                   mov        r10d, 0x1d
00ca9 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
00cae 7412                           je         0x7f345c136542
00cb0 4983c202                       add        r10, 2
00cb4 4983fa21                       cmp        r10, 0x21
00cb8 75ef                           jne        0x7f345c136529
00cba 41ba1c000000                   mov        r10d, 0x1c
00cc0 eb17                           jmp        0x7f345c136559
00cc2 51                             push       rcx
00cc3 488bc8                         mov        rcx, rax
00cc6 4833c0                         xor        rax, rax
00cc9 f04a0fb11cd1                   lock cmpxchg qword ptr [rcx + r10*8], rbx
00ccf 488bc1                         mov        rax, rcx
00cd2 59                             pop        rcx
00cd3 ebb8                           jmp        0x7f345c13650d
00cd5 4983c201                       add        r10, 1
00cd9 4a8304d001                     add        qword ptr [rax + r10*8], 1
00cde 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
00ce8 458b09                         mov        r9d, dword ptr [r9]
00ceb 41c1e90d                       shr        r9d, 0xd
00cef 49c1e10a                       shl        r9, 0xa
00cf3 41ba00000033                   mov        r10d, 0x33000000
00cf9 4d03ca                         add        r9, r10
00cfc 41ba23000000                   mov        r10d, 0x23
00d02 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
00d06 7436                           je         0x7f345c1365be
00d08 4983c202                       add        r10, 2
00d0c 4983fa27                       cmp        r10, 0x27
00d10 75f0                           jne        0x7f345c136582
00d12 41ba23000000                   mov        r10d, 0x23
00d18 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00d1d 7412                           je         0x7f345c1365b1
00d1f 4983c202                       add        r10, 2
00d23 4983fa27                       cmp        r10, 0x27
00d27 75ef                           jne        0x7f345c136598
00d29 41ba22000000                   mov        r10d, 0x22
00d2f eb11                           jmp        0x7f345c1365c2
00d31 50                             push       rax
00d32 4833c0                         xor        rax, rax
00d35 f04e0fb10cd3                   lock cmpxchg qword ptr [rbx + r10*8], r9
00d3b 58                             pop        rax
00d3c ebbe                           jmp        0x7f345c13657c
00d3e 4983c201                       add        r10, 1
00d42 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00d47 49b9b89a6d50347f0000           movabs     r9, 0x7f34506d9ab8
00d51 4983814001000001               add        qword ptr [r9 + 0x140], 1
00d59 49b950906d50347f0000           movabs     r9, 0x7f34506d9050
00d63 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
00d67 83c302                         add        ebx, 2
00d6a 41895978                       mov        dword ptr [r9 + 0x78], ebx
00d6e 81e3feff1f00                   and        ebx, 0x1ffffe
00d74 85db                           test       ebx, ebx
00d76 0f84323f0000                   je         0x7f345c13a52e
00d7c 49b9b89a6d50347f0000           movabs     r9, 0x7f34506d9ab8
00d86 4983815001000001               add        qword ptr [r9 + 0x150], 1
00d8e 4963d8                         movsxd     rbx, r8d
00d91 41b808000000                   mov        r8d, 8
00d97 4c8bcb                         mov        r9, rbx
00d9a 4d03c8                         add        r9, r8
00d9d 49b8d8816d50347f0000           movabs     r8, 0x7f34506d81d8
00da7 418b4078                       mov        eax, dword ptr [r8 + 0x78]
00dab 83c002                         add        eax, 2
00dae 41894078                       mov        dword ptr [r8 + 0x78], eax
00db2 25feff1f00                     and        eax, 0x1ffffe
00db7 85c0                           test       eax, eax
00db9 0f84103f0000                   je         0x7f345c13a54f
00dbf 49b8d8816d50347f0000           movabs     r8, 0x7f34506d81d8
00dc9 498380e000000001               add        qword ptr [r8 + 0xe0], 1
00dd1 49b858836d50347f0000           movabs     r8, 0x7f34506d8358
00ddb 418b4078                       mov        eax, dword ptr [r8 + 0x78]
00ddf 83c002                         add        eax, 2
00de2 41894078                       mov        dword ptr [r8 + 0x78], eax
00de6 25feff1f00                     and        eax, 0x1ffffe
00deb 85c0                           test       eax, eax
00ded 0f84fd3e0000                   je         0x7f345c13a570
00df3 49b8b89a6d50347f0000           movabs     r8, 0x7f34506d9ab8
00dfd 4983807001000001               add        qword ptr [r8 + 0x170], 1
00e05 49b8e86b6fe200000000           movabs     r8, 0xe26f6be8
00e0f 48be68936ee200000000           movabs     rsi, 0xe26e9368
00e19 4c8bf2                         mov        r14, rdx
00e1c ba02000000                     mov        edx, 2
00e21 b910000000                     mov        ecx, 0x10
00e26 4d8bc6                         mov        r8, r14
00e29 bf00000000                     mov        edi, 0
00e2e 4c893424                       mov        qword ptr [rsp], r14
00e32 48895c2408                     mov        qword ptr [rsp + 8], rbx
00e37 49ba20936ee200000000           movabs     r10, 0xe26e9320
00e41 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00e46 49bae86b6fe200000000           movabs     r10, 0xe26f6be8
00e50 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00e55 4c89b42490010000               mov        qword ptr [rsp + 0x190], r14
00e5d 90                             nop        
00e5e 90                             nop        
00e5f e87c955f07                     call       0x7f346372fc60
00e64 0f1f84005c0f0002               nop        dword ptr [rax + rax + 0x2000f5c]
00e6c 4885c0                         test       rax, rax
00e6f 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
00e79 750c                           jne        0x7f345c136707
00e7b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00e82 e988000000                     jmp        0x7f345c13678f
00e87 8b38                           mov        edi, dword ptr [rax]
00e89 c1ef0d                         shr        edi, 0xd
00e8c 48c1e70a                       shl        rdi, 0xa
00e90 41ba00000033                   mov        r10d, 0x33000000
00e96 4903fa                         add        rdi, r10
00e99 41ba31000000                   mov        r10d, 0x31
00e9f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00ea3 7436                           je         0x7f345c13675b
00ea5 4983c202                       add        r10, 2
00ea9 4983fa35                       cmp        r10, 0x35
00ead 75f0                           jne        0x7f345c13671f
00eaf 41ba31000000                   mov        r10d, 0x31
00eb5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00eba 7412                           je         0x7f345c13674e
00ebc 4983c202                       add        r10, 2
00ec0 4983fa35                       cmp        r10, 0x35
00ec4 75ef                           jne        0x7f345c136735
00ec6 41ba30000000                   mov        r10d, 0x30
00ecc eb11                           jmp        0x7f345c13675f
00ece 50                             push       rax
00ecf 4833c0                         xor        rax, rax
00ed2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
00ed8 58                             pop        rax
00ed9 ebbe                           jmp        0x7f345c136719
00edb 4983c201                       add        r10, 1
00edf 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ee4 48bf00b0143300000000           movabs     rdi, 0x3314b000
00eee 8b18                           mov        ebx, dword ptr [rax]
00ef0 c1eb0d                         shr        ebx, 0xd
00ef3 48c1e30a                       shl        rbx, 0xa
00ef7 41ba00000033                   mov        r10d, 0x33000000
00efd 4903da                         add        rbx, r10
00f00 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00f04 0f85073e0000                   jne        0x7f345c13a591
00f0a e900000000                     jmp        0x7f345c13678f
00f0f 488bf8                         mov        rdi, rax
00f12 4889bc2408020000               mov        qword ptr [rsp + 0x208], rdi
00f1a 483b07                         cmp        rax, qword ptr [rdi]
00f1d 488bf7                         mov        rsi, rdi
00f20 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
00f2a 8b36                           mov        esi, dword ptr [rsi]
00f2c c1ee0d                         shr        esi, 0xd
00f2f 48c1e60a                       shl        rsi, 0xa
00f33 41ba00000033                   mov        r10d, 0x33000000
00f39 4903f2                         add        rsi, r10
00f3c 41ba95000000                   mov        r10d, 0x95
00f42 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f46 743c                           je         0x7f345c136804
00f48 4983c202                       add        r10, 2
00f4c 4981fa99000000                 cmp        r10, 0x99
00f53 75ed                           jne        0x7f345c1367c2
00f55 41ba95000000                   mov        r10d, 0x95
00f5b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f60 7415                           je         0x7f345c1367f7
00f62 4983c202                       add        r10, 2
00f66 4981fa99000000                 cmp        r10, 0x99
00f6d 75ec                           jne        0x7f345c1367db
00f6f 41ba94000000                   mov        r10d, 0x94
00f75 eb11                           jmp        0x7f345c136808
00f77 50                             push       rax
00f78 4833c0                         xor        rax, rax
00f7b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
00f81 58                             pop        rax
00f82 ebb8                           jmp        0x7f345c1367bc
00f84 4983c201                       add        r10, 1
00f88 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f8d 48be08a56d50347f0000           movabs     rsi, 0x7f34506da508
00f97 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00f9a 83c302                         add        ebx, 2
00f9d 895e78                         mov        dword ptr [rsi + 0x78], ebx
00fa0 81e3feff1f00                   and        ebx, 0x1ffffe
00fa6 85db                           test       ebx, ebx
00fa8 0f84993d0000                   je         0x7f345c13a5c7
00fae 488bf7                         mov        rsi, rdi
00fb1 48bb08a56d50347f0000           movabs     rbx, 0x7f34506da508
00fbb 8b36                           mov        esi, dword ptr [rsi]
00fbd c1ee0d                         shr        esi, 0xd
00fc0 48c1e60a                       shl        rsi, 0xa
00fc4 41ba00000033                   mov        r10d, 0x33000000
00fca 4903f2                         add        rsi, r10
00fcd 41ba17000000                   mov        r10d, 0x17
00fd3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00fd7 7436                           je         0x7f345c13688f
00fd9 4983c202                       add        r10, 2
00fdd 4983fa1b                       cmp        r10, 0x1b
00fe1 75f0                           jne        0x7f345c136853
00fe3 41ba17000000                   mov        r10d, 0x17
00fe9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00fee 7412                           je         0x7f345c136882
00ff0 4983c202                       add        r10, 2
00ff4 4983fa1b                       cmp        r10, 0x1b
00ff8 75ef                           jne        0x7f345c136869
00ffa 41ba16000000                   mov        r10d, 0x16
01000 eb11                           jmp        0x7f345c136893
01002 50                             push       rax
01003 4833c0                         xor        rax, rax
01006 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
0100c 58                             pop        rax
0100d ebbe                           jmp        0x7f345c13684d
0100f 4983c201                       add        r10, 1
01013 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01018 488bf7                         mov        rsi, rdi
0101b 90                             nop        
0101c 90                             nop        
0101d 48b820305630347f0000           movabs     rax, 0x7f3430563020
01027 e8b48e5f07                     call       0x7f346372f760
0102c 0f1f840024110003               nop        dword ptr [rax + rax + 0x3001124]
01034 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
0103c 8b7704                         mov        esi, dword ptr [rdi + 4]
0103f 48bb08a56d50347f0000           movabs     rbx, 0x7f34506da508
01049 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01051 48bb088e6d50347f0000           movabs     rbx, 0x7f34506d8e08
0105b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
0105e 83c202                         add        edx, 2
01061 895378                         mov        dword ptr [rbx + 0x78], edx
01064 81e2feff1f00                   and        edx, 0x1ffffe
0106a 85d2                           test       edx, edx
0106c 0f840f3d0000                   je         0x7f345c13a601
01072 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
0107a 48bb088e6d50347f0000           movabs     rbx, 0x7f34506d8e08
01084 4883831001000001               add        qword ptr [rbx + 0x110], 1
0108c ffc8                           dec        eax
0108e 2bf0                           sub        esi, eax
01090 48bb98846d50347f0000           movabs     rbx, 0x7f34506d8498
0109a 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0109d 83c002                         add        eax, 2
010a0 894378                         mov        dword ptr [rbx + 0x78], eax
010a3 25feff1f00                     and        eax, 0x1ffffe
010a8 85c0                           test       eax, eax
010aa 0f84f23c0000                   je         0x7f345c13a622
010b0 48bb98846d50347f0000           movabs     rbx, 0x7f34506d8498
010ba 488383b000000001               add        qword ptr [rbx + 0xb0], 1
010c2 48bb0000000000000000           movabs     rbx, 0
010cc bb00000000                     mov        ebx, 0
010d1 443bdb                         cmp        r11d, ebx
010d4 0f8ce93c0000                   jl         0x7f345c13a643
010da 443bde                         cmp        r11d, esi
010dd 0f8d013d0000                   jge        0x7f345c13a664
010e3 498bdb                         mov        rbx, r11
010e6 899c2410020000                 mov        dword ptr [rsp + 0x210], ebx
010ed 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
010f5 4889bc2480010000               mov        qword ptr [rsp + 0x180], rdi
010fd 488bbc2408020000               mov        rdi, qword ptr [rsp + 0x208]
01105 488bf7                         mov        rsi, rdi
01108 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01112 8b36                           mov        esi, dword ptr [rsi]
01114 c1ee0d                         shr        esi, 0xd
01117 48c1e60a                       shl        rsi, 0xa
0111b 41ba00000033                   mov        r10d, 0x33000000
01121 4903f2                         add        rsi, r10
01124 41ba1f000000                   mov        r10d, 0x1f
0112a 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0112e 7436                           je         0x7f345c1369e6
01130 4983c202                       add        r10, 2
01134 4983fa23                       cmp        r10, 0x23
01138 75f0                           jne        0x7f345c1369aa
0113a 41ba1f000000                   mov        r10d, 0x1f
01140 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01145 7412                           je         0x7f345c1369d9
01147 4983c202                       add        r10, 2
0114b 4983fa23                       cmp        r10, 0x23
0114f 75ef                           jne        0x7f345c1369c0
01151 41ba1e000000                   mov        r10d, 0x1e
01157 eb11                           jmp        0x7f345c1369ea
01159 50                             push       rax
0115a 4833c0                         xor        rax, rax
0115d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01163 58                             pop        rax
01164 ebbe                           jmp        0x7f345c1369a4
01166 4983c201                       add        r10, 1
0116a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0116f 488bf7                         mov        rsi, rdi
01172 90                             nop        
01173 90                             nop        
01174 90                             nop        
01175 48b848305630347f0000           movabs     rax, 0x7f3430563048
0117f e85c8d5f07                     call       0x7f346372f760
01184 0f1f84007c120004               nop        dword ptr [rax + rax + 0x400127c]
0118c 483b00                         cmp        rax, qword ptr [rax]
0118f 488bf0                         mov        rsi, rax
01192 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
0119c 8b36                           mov        esi, dword ptr [rsi]
0119e c1ee0d                         shr        esi, 0xd
011a1 48c1e60a                       shl        rsi, 0xa
011a5 41ba00000033                   mov        r10d, 0x33000000
011ab 4903f2                         add        rsi, r10
011ae 41ba25000000                   mov        r10d, 0x25
011b4 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
011b8 7436                           je         0x7f345c136a70
011ba 4983c202                       add        r10, 2
011be 4983fa29                       cmp        r10, 0x29
011c2 75f0                           jne        0x7f345c136a34
011c4 41ba25000000                   mov        r10d, 0x25
011ca 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
011cf 7412                           je         0x7f345c136a63
011d1 4983c202                       add        r10, 2
011d5 4983fa29                       cmp        r10, 0x29
011d9 75ef                           jne        0x7f345c136a4a
011db 41ba24000000                   mov        r10d, 0x24
011e1 eb11                           jmp        0x7f345c136a74
011e3 50                             push       rax
011e4 4833c0                         xor        rax, rax
011e7 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
011ed 58                             pop        rax
011ee ebbe                           jmp        0x7f345c136a2e
011f0 4983c201                       add        r10, 1
011f4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
011f9 8b7024                         mov        esi, dword ptr [rax + 0x24]
011fc 4c3b251573b91f                 cmp        r12, qword ptr [rip + 0x1fb97315]
01203 0f8414000000                   je         0x7f345c136a9d
01209 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
01213 4883e4f0                       and        rsp, 0xfffffffffffffff0
01217 e8c45af61e                     call       0x7f347b09c560
0121c f4                             hlt        
0121d 488bd0                         mov        rdx, rax
01220 48b908a56d50347f0000           movabs     rcx, 0x7f34506da508
0122a 8b12                           mov        edx, dword ptr [rdx]
0122c c1ea0d                         shr        edx, 0xd
0122f 48c1e20a                       shl        rdx, 0xa
01233 41ba00000033                   mov        r10d, 0x33000000
01239 4903d2                         add        rdx, r10
0123c 41ba2b000000                   mov        r10d, 0x2b
01242 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01246 7436                           je         0x7f345c136afe
01248 4983c202                       add        r10, 2
0124c 4983fa2f                       cmp        r10, 0x2f
01250 75f0                           jne        0x7f345c136ac2
01252 41ba2b000000                   mov        r10d, 0x2b
01258 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0125d 7412                           je         0x7f345c136af1
0125f 4983c202                       add        r10, 2
01263 4983fa2f                       cmp        r10, 0x2f
01267 75ef                           jne        0x7f345c136ad8
01269 41ba2a000000                   mov        r10d, 0x2a
0126f eb11                           jmp        0x7f345c136b02
01271 50                             push       rax
01272 4833c0                         xor        rax, rax
01275 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
0127b 58                             pop        rax
0127c ebbe                           jmp        0x7f345c136abc
0127e 4983c201                       add        r10, 1
01282 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01287 8b4804                         mov        ecx, dword ptr [rax + 4]
0128a 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01294 4883828001000001               add        qword ptr [rdx + 0x180], 1
0129c 48ba50906d50347f0000           movabs     rdx, 0x7f34506d9050
012a6 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
012aa 4183c002                       add        r8d, 2
012ae 44894278                       mov        dword ptr [rdx + 0x78], r8d
012b2 4181e0feff1f00                 and        r8d, 0x1ffffe
012b9 4585c0                         test       r8d, r8d
012bc 0f845c3b0000                   je         0x7f345c13a69e
012c2 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
012cc 4883829001000001               add        qword ptr [rdx + 0x190], 1
012d4 8b9c2410020000                 mov        ebx, dword ptr [rsp + 0x210]
012db 4863db                         movsxd     rbx, ebx
012de ba08000000                     mov        edx, 8
012e3 4c8bcb                         mov        r9, rbx
012e6 4c03ca                         add        r9, rdx
012e9 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
012f3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
012f7 4183c002                       add        r8d, 2
012fb 44894278                       mov        dword ptr [rdx + 0x78], r8d
012ff 4181e0feff1f00                 and        r8d, 0x1ffffe
01306 4585c0                         test       r8d, r8d
01309 0f84303b0000                   je         0x7f345c13a6bf
0130f 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
01319 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01321 48ba58836d50347f0000           movabs     rdx, 0x7f34506d8358
0132b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
0132f 4183c002                       add        r8d, 2
01333 44894278                       mov        dword ptr [rdx + 0x78], r8d
01337 4181e0feff1f00                 and        r8d, 0x1ffffe
0133e 4585c0                         test       r8d, r8d
01341 0f84193b0000                   je         0x7f345c13a6e0
01347 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01351 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01359 48bad00970e200000000           movabs     rdx, 0xe27009d0
01363 ba02000000                     mov        edx, 2
01368 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
01370 bf00000000                     mov        edi, 0
01375 488b842408020000               mov        rax, qword ptr [rsp + 0x208]
0137d 48890424                       mov        qword ptr [rsp], rax
01381 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
01389 4889442408                     mov        qword ptr [rsp + 8], rax
0138e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01393 49bad00970e200000000           movabs     r10, 0xe27009d0
0139d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
013a2 4889842480010000               mov        qword ptr [rsp + 0x180], rax
013aa 90                             nop        
013ab 90                             nop        
013ac 90                             nop        
013ad 90                             nop        
013ae 90                             nop        
013af e82c905f07                     call       0x7f346372fc60
013b4 0f1f8400ac140005               nop        dword ptr [rax + rax + 0x50014ac]
013bc 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
013c6 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
013cc e9d60b0000                     jmp        0x7f345c137827
013d1 44899c2400020000               mov        dword ptr [rsp + 0x200], r11d
013d9 899c248c010000                 mov        dword ptr [rsp + 0x18c], ebx
013e0 83f930                         cmp        ecx, 0x30
013e3 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
013ed bae8040000                     mov        edx, 0x4e8
013f2 7f05                           jg         0x7f345c136c79
013f4 baf8040000                     mov        edx, 0x4f8
013f9 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
013fd 4d8d4001                       lea        r8, [r8 + 1]
01401 4c890416                       mov        qword ptr [rsi + rdx], r8
01405 0f8f060b0000                   jg         0x7f345c137791
0140b 8bb424bc010000                 mov        esi, dword ptr [rsp + 0x1bc]
01412 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
0141a 90                             nop        
0141b 90                             nop        
0141c 90                             nop        
0141d 90                             nop        
0141e 90                             nop        
0141f 90                             nop        
01420 44899c2414020000               mov        dword ptr [rsp + 0x214], r11d
01428 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
01430 49b848e76250347f0000           movabs     r8, 0x7f345062e748
0143a 4983800805000001               add        qword ptr [r8 + 0x508], 1
01442 49b800986d50347f0000           movabs     r8, 0x7f34506d9800
0144c 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01450 4183c102                       add        r9d, 2
01454 45894878                       mov        dword ptr [r8 + 0x78], r9d
01458 4181e1feff1f00                 and        r9d, 0x1ffffe
0145f 4585c9                         test       r9d, r9d
01462 0f84193a0000                   je         0x7f345c13a701
01468 49b820936ee200000000           movabs     r8, 0xe26e9320
01472 49b900986d50347f0000           movabs     r9, 0x7f34506d9800
0147c 458b00                         mov        r8d, dword ptr [r8]
0147f 41c1e80d                       shr        r8d, 0xd
01483 49c1e00a                       shl        r8, 0xa
01487 41ba00000033                   mov        r10d, 0x33000000
0148d 4d03c2                         add        r8, r10
01490 41ba17000000                   mov        r10d, 0x17
01496 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0149a 7436                           je         0x7f345c136d52
0149c 4983c202                       add        r10, 2
014a0 4983fa1b                       cmp        r10, 0x1b
014a4 75f0                           jne        0x7f345c136d16
014a6 41ba17000000                   mov        r10d, 0x17
014ac 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
014b1 7412                           je         0x7f345c136d45
014b3 4983c202                       add        r10, 2
014b7 4983fa1b                       cmp        r10, 0x1b
014bb 75ef                           jne        0x7f345c136d2c
014bd 41ba16000000                   mov        r10d, 0x16
014c3 eb11                           jmp        0x7f345c136d56
014c5 50                             push       rax
014c6 4833c0                         xor        rax, rax
014c9 f04f0fb104d1                   lock cmpxchg qword ptr [r9 + r10*8], r8
014cf 58                             pop        rax
014d0 ebbe                           jmp        0x7f345c136d10
014d2 4983c201                       add        r10, 1
014d6 4b8304d101                     add        qword ptr [r9 + r10*8], 1
014db 448b4204                       mov        r8d, dword ptr [rdx + 4]
014df 49b900986d50347f0000           movabs     r9, 0x7f34506d9800
014e9 498381e000000001               add        qword ptr [r9 + 0xe0], 1
014f1 49b9088e6d50347f0000           movabs     r9, 0x7f34506d8e08
014fb 418b7978                       mov        edi, dword ptr [r9 + 0x78]
014ff 83c702                         add        edi, 2
01502 41897978                       mov        dword ptr [r9 + 0x78], edi
01506 81e7feff1f00                   and        edi, 0x1ffffe
0150c 85ff                           test       edi, edi
0150e 0f84a7390000                   je         0x7f345c13a73b
01514 49b9088e6d50347f0000           movabs     r9, 0x7f34506d8e08
0151e 4983811001000001               add        qword ptr [r9 + 0x110], 1
01526 4183e80f                       sub        r8d, 0xf
0152a 49b998846d50347f0000           movabs     r9, 0x7f34506d8498
01534 418b7978                       mov        edi, dword ptr [r9 + 0x78]
01538 83c702                         add        edi, 2
0153b 41897978                       mov        dword ptr [r9 + 0x78], edi
0153f 81e7feff1f00                   and        edi, 0x1ffffe
01545 85ff                           test       edi, edi
01547 0f848f390000                   je         0x7f345c13a75c
0154d 49b998846d50347f0000           movabs     r9, 0x7f34506d8498
01557 498381b000000001               add        qword ptr [r9 + 0xb0], 1
0155f 49b90000000000000000           movabs     r9, 0
01569 41b900000000                   mov        r9d, 0
0156f 413bf1                         cmp        esi, r9d
01572 0f8c85390000                   jl         0x7f345c13a77d
01578 413bf0                         cmp        esi, r8d
0157b 0f8d9d390000                   jge        0x7f345c13a79e
01581 4c8bc6                         mov        r8, rsi
01584 49b920936ee200000000           movabs     r9, 0xe26e9320
0158e 498bf9                         mov        rdi, r9
01591 48bb00986d50347f0000           movabs     rbx, 0x7f34506d9800
0159b 8b3f                           mov        edi, dword ptr [rdi]
0159d c1ef0d                         shr        edi, 0xd
015a0 48c1e70a                       shl        rdi, 0xa
015a4 41ba00000033                   mov        r10d, 0x33000000
015aa 4903fa                         add        rdi, r10
015ad 41ba25000000                   mov        r10d, 0x25
015b3 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
015b7 7436                           je         0x7f345c136e6f
015b9 4983c202                       add        r10, 2
015bd 4983fa29                       cmp        r10, 0x29
015c1 75f0                           jne        0x7f345c136e33
015c3 41ba25000000                   mov        r10d, 0x25
015c9 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
015ce 7412                           je         0x7f345c136e62
015d0 4983c202                       add        r10, 2
015d4 4983fa29                       cmp        r10, 0x29
015d8 75ef                           jne        0x7f345c136e49
015da 41ba24000000                   mov        r10d, 0x24
015e0 eb11                           jmp        0x7f345c136e73
015e2 50                             push       rax
015e3 4833c0                         xor        rax, rax
015e6 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
015ec 58                             pop        rax
015ed ebbe                           jmp        0x7f345c136e2d
015ef 4983c201                       add        r10, 1
015f3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
015f8 48bfa0856d50347f0000           movabs     rdi, 0x7f34506d85a0
01602 8b5f78                         mov        ebx, dword ptr [rdi + 0x78]
01605 83c302                         add        ebx, 2
01608 895f78                         mov        dword ptr [rdi + 0x78], ebx
0160b 81e3feff1f00                   and        ebx, 0x1ffffe
01611 85db                           test       ebx, ebx
01613 0f8426390000                   je         0x7f345c13a7bf
01619 48bfa0856d50347f0000           movabs     rdi, 0x7f34506d85a0
01623 488387b000000001               add        qword ptr [rdi + 0xb0], 1
0162b 49b9d0866d50347f0000           movabs     r9, 0x7f34506d86d0
01635 418b7978                       mov        edi, dword ptr [r9 + 0x78]
01639 83c702                         add        edi, 2
0163c 41897978                       mov        dword ptr [r9 + 0x78], edi
01640 81e7feff1f00                   and        edi, 0x1ffffe
01646 85ff                           test       edi, edi
01648 0f8412390000                   je         0x7f345c13a7e0
0164e 49b9d0866d50347f0000           movabs     r9, 0x7f34506d86d0
01658 41ff81c0000000                 inc        dword ptr [r9 + 0xc0]
0165f 89b42418020000                 mov        dword ptr [rsp + 0x218], esi
01666 49b918136fe200000000           movabs     r9, 0xe26f1318
01670 498bf9                         mov        rdi, r9
01673 48bb00986d50347f0000           movabs     rbx, 0x7f34506d9800
0167d 4883836001000001               add        qword ptr [rbx + 0x160], 1
01685 48bfd0996d50347f0000           movabs     rdi, 0x7f34506d99d0
0168f 8b5f78                         mov        ebx, dword ptr [rdi + 0x78]
01692 83c302                         add        ebx, 2
01695 895f78                         mov        dword ptr [rdi + 0x78], ebx
01698 81e3feff1f00                   and        ebx, 0x1ffffe
0169e 85db                           test       ebx, ebx
016a0 0f84db380000                   je         0x7f345c13a801
016a6 498bf9                         mov        rdi, r9
016a9 48bbd0996d50347f0000           movabs     rbx, 0x7f34506d99d0
016b3 488383b000000001               add        qword ptr [rbx + 0xb0], 1
016bb 48bfb89a6d50347f0000           movabs     rdi, 0x7f34506d9ab8
016c5 8b5f78                         mov        ebx, dword ptr [rdi + 0x78]
016c8 83c302                         add        ebx, 2
016cb 895f78                         mov        dword ptr [rdi + 0x78], ebx
016ce 81e3feff1f00                   and        ebx, 0x1ffffe
016d4 85db                           test       ebx, ebx
016d6 0f84c6380000                   je         0x7f345c13a822
016dc 48bfb89a6d50347f0000           movabs     rdi, 0x7f34506d9ab8
016e6 488387c000000001               add        qword ptr [rdi + 0xc0], 1
016ee 49b9888f6d50347f0000           movabs     r9, 0x7f34506d8f88
016f8 418b7978                       mov        edi, dword ptr [r9 + 0x78]
016fc 83c702                         add        edi, 2
016ff 41897978                       mov        dword ptr [r9 + 0x78], edi
01703 81e7feff1f00                   and        edi, 0x1ffffe
01709 85ff                           test       edi, edi
0170b 0f84b2380000                   je         0x7f345c13a843
01711 49b920936ee200000000           movabs     r9, 0xe26e9320
0171b 498bf9                         mov        rdi, r9
0171e 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
01728 8b3f                           mov        edi, dword ptr [rdi]
0172a c1ef0d                         shr        edi, 0xd
0172d 48c1e70a                       shl        rdi, 0xa
01731 41ba00000033                   mov        r10d, 0x33000000
01737 4903fa                         add        rdi, r10
0173a 41ba1d000000                   mov        r10d, 0x1d
01740 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01744 7436                           je         0x7f345c136ffc
01746 4983c202                       add        r10, 2
0174a 4983fa21                       cmp        r10, 0x21
0174e 75f0                           jne        0x7f345c136fc0
01750 41ba1d000000                   mov        r10d, 0x1d
01756 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0175b 7412                           je         0x7f345c136fef
0175d 4983c202                       add        r10, 2
01761 4983fa21                       cmp        r10, 0x21
01765 75ef                           jne        0x7f345c136fd6
01767 41ba1c000000                   mov        r10d, 0x1c
0176d eb11                           jmp        0x7f345c137000
0176f 50                             push       rax
01770 4833c0                         xor        rax, rax
01773 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
01779 58                             pop        rax
0177a ebbe                           jmp        0x7f345c136fba
0177c 4983c201                       add        r10, 1
01780 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01785 48bfb89a6d50347f0000           movabs     rdi, 0x7f34506d9ab8
0178f 458b09                         mov        r9d, dword ptr [r9]
01792 41c1e90d                       shr        r9d, 0xd
01796 49c1e10a                       shl        r9, 0xa
0179a 41ba00000033                   mov        r10d, 0x33000000
017a0 4d03ca                         add        r9, r10
017a3 41ba23000000                   mov        r10d, 0x23
017a9 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
017ad 7436                           je         0x7f345c137065
017af 4983c202                       add        r10, 2
017b3 4983fa27                       cmp        r10, 0x27
017b7 75f0                           jne        0x7f345c137029
017b9 41ba23000000                   mov        r10d, 0x23
017bf 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
017c4 7412                           je         0x7f345c137058
017c6 4983c202                       add        r10, 2
017ca 4983fa27                       cmp        r10, 0x27
017ce 75ef                           jne        0x7f345c13703f
017d0 41ba22000000                   mov        r10d, 0x22
017d6 eb11                           jmp        0x7f345c137069
017d8 50                             push       rax
017d9 4833c0                         xor        rax, rax
017dc f04e0fb10cd7                   lock cmpxchg qword ptr [rdi + r10*8], r9
017e2 58                             pop        rax
017e3 ebbe                           jmp        0x7f345c137023
017e5 4983c201                       add        r10, 1
017e9 4a8304d701                     add        qword ptr [rdi + r10*8], 1
017ee 49b9b89a6d50347f0000           movabs     r9, 0x7f34506d9ab8
017f8 4983814001000001               add        qword ptr [r9 + 0x140], 1
01800 49b950906d50347f0000           movabs     r9, 0x7f34506d9050
0180a 418b7978                       mov        edi, dword ptr [r9 + 0x78]
0180e 83c702                         add        edi, 2
01811 41897978                       mov        dword ptr [r9 + 0x78], edi
01815 81e7feff1f00                   and        edi, 0x1ffffe
0181b 85ff                           test       edi, edi
0181d 0f84c1370000                   je         0x7f345c13a864
01823 49b9b89a6d50347f0000           movabs     r9, 0x7f34506d9ab8
0182d 4983815001000001               add        qword ptr [r9 + 0x150], 1
01835 4963d8                         movsxd     rbx, r8d
01838 41b808000000                   mov        r8d, 8
0183e 4c8bcb                         mov        r9, rbx
01841 4d03c8                         add        r9, r8
01844 49b8d8816d50347f0000           movabs     r8, 0x7f34506d81d8
0184e 418b7878                       mov        edi, dword ptr [r8 + 0x78]
01852 83c702                         add        edi, 2
01855 41897878                       mov        dword ptr [r8 + 0x78], edi
01859 81e7feff1f00                   and        edi, 0x1ffffe
0185f 85ff                           test       edi, edi
01861 0f849e370000                   je         0x7f345c13a885
01867 49b8d8816d50347f0000           movabs     r8, 0x7f34506d81d8
01871 498380e000000001               add        qword ptr [r8 + 0xe0], 1
01879 49b858836d50347f0000           movabs     r8, 0x7f34506d8358
01883 418b7878                       mov        edi, dword ptr [r8 + 0x78]
01887 83c702                         add        edi, 2
0188a 41897878                       mov        dword ptr [r8 + 0x78], edi
0188e 81e7feff1f00                   and        edi, 0x1ffffe
01894 85ff                           test       edi, edi
01896 0f848a370000                   je         0x7f345c13a8a6
0189c 49b8b89a6d50347f0000           movabs     r8, 0x7f34506d9ab8
018a6 4983807001000001               add        qword ptr [r8 + 0x170], 1
018ae 49b8e86b6fe200000000           movabs     r8, 0xe26f6be8
018b8 48be68936ee200000000           movabs     rsi, 0xe26e9368
018c2 488bfa                         mov        rdi, rdx
018c5 ba02000000                     mov        edx, 2
018ca b910000000                     mov        ecx, 0x10
018cf 4c8bc7                         mov        r8, rdi
018d2 488bc7                         mov        rax, rdi
018d5 bf00000000                     mov        edi, 0
018da 48890424                       mov        qword ptr [rsp], rax
018de 48895c2408                     mov        qword ptr [rsp + 8], rbx
018e3 49ba20936ee200000000           movabs     r10, 0xe26e9320
018ed 4c89542410                     mov        qword ptr [rsp + 0x10], r10
018f2 49bae86b6fe200000000           movabs     r10, 0xe26f6be8
018fc 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01901 4889842490010000               mov        qword ptr [rsp + 0x190], rax
01909 90                             nop        
0190a 90                             nop        
0190b 90                             nop        
0190c 90                             nop        
0190d 90                             nop        
0190e 90                             nop        
0190f e8cc8a5f07                     call       0x7f346372fc60
01914 0f1f84000c1a0006               nop        dword ptr [rax + rax + 0x6001a0c]
0191c 4885c0                         test       rax, rax
0191f 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
01929 750c                           jne        0x7f345c1371b7
0192b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
01932 e988000000                     jmp        0x7f345c13723f
01937 8b38                           mov        edi, dword ptr [rax]
01939 c1ef0d                         shr        edi, 0xd
0193c 48c1e70a                       shl        rdi, 0xa
01940 41ba00000033                   mov        r10d, 0x33000000
01946 4903fa                         add        rdi, r10
01949 41ba31000000                   mov        r10d, 0x31
0194f 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
01953 7436                           je         0x7f345c13720b
01955 4983c202                       add        r10, 2
01959 4983fa35                       cmp        r10, 0x35
0195d 75f0                           jne        0x7f345c1371cf
0195f 41ba31000000                   mov        r10d, 0x31
01965 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0196a 7412                           je         0x7f345c1371fe
0196c 4983c202                       add        r10, 2
01970 4983fa35                       cmp        r10, 0x35
01974 75ef                           jne        0x7f345c1371e5
01976 41ba30000000                   mov        r10d, 0x30
0197c eb11                           jmp        0x7f345c13720f
0197e 50                             push       rax
0197f 4833c0                         xor        rax, rax
01982 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
01988 58                             pop        rax
01989 ebbe                           jmp        0x7f345c1371c9
0198b 4983c201                       add        r10, 1
0198f 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01994 48bf00b0143300000000           movabs     rdi, 0x3314b000
0199e 8b18                           mov        ebx, dword ptr [rax]
019a0 c1eb0d                         shr        ebx, 0xd
019a3 48c1e30a                       shl        rbx, 0xa
019a7 41ba00000033                   mov        r10d, 0x33000000
019ad 4903da                         add        rbx, r10
019b0 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
019b4 0f858d360000                   jne        0x7f345c13a8c7
019ba e900000000                     jmp        0x7f345c13723f
019bf 488bf8                         mov        rdi, rax
019c2 4889bc2420020000               mov        qword ptr [rsp + 0x220], rdi
019ca 483b07                         cmp        rax, qword ptr [rdi]
019cd 488bf7                         mov        rsi, rdi
019d0 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
019da 8b36                           mov        esi, dword ptr [rsi]
019dc c1ee0d                         shr        esi, 0xd
019df 48c1e60a                       shl        rsi, 0xa
019e3 41ba00000033                   mov        r10d, 0x33000000
019e9 4903f2                         add        rsi, r10
019ec 41baa4000000                   mov        r10d, 0xa4
019f2 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
019f6 743c                           je         0x7f345c1372b4
019f8 4983c202                       add        r10, 2
019fc 4981faa8000000                 cmp        r10, 0xa8
01a03 75ed                           jne        0x7f345c137272
01a05 41baa4000000                   mov        r10d, 0xa4
01a0b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a10 7415                           je         0x7f345c1372a7
01a12 4983c202                       add        r10, 2
01a16 4981faa8000000                 cmp        r10, 0xa8
01a1d 75ec                           jne        0x7f345c13728b
01a1f 41baa3000000                   mov        r10d, 0xa3
01a25 eb11                           jmp        0x7f345c1372b8
01a27 50                             push       rax
01a28 4833c0                         xor        rax, rax
01a2b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01a31 58                             pop        rax
01a32 ebb8                           jmp        0x7f345c13726c
01a34 4983c201                       add        r10, 1
01a38 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a3d 48be08a56d50347f0000           movabs     rsi, 0x7f34506da508
01a47 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
01a4a 83c302                         add        ebx, 2
01a4d 895e78                         mov        dword ptr [rsi + 0x78], ebx
01a50 81e3feff1f00                   and        ebx, 0x1ffffe
01a56 85db                           test       ebx, ebx
01a58 0f841f360000                   je         0x7f345c13a8fd
01a5e 488bf7                         mov        rsi, rdi
01a61 48bb08a56d50347f0000           movabs     rbx, 0x7f34506da508
01a6b 8b36                           mov        esi, dword ptr [rsi]
01a6d c1ee0d                         shr        esi, 0xd
01a70 48c1e60a                       shl        rsi, 0xa
01a74 41ba00000033                   mov        r10d, 0x33000000
01a7a 4903f2                         add        rsi, r10
01a7d 41ba17000000                   mov        r10d, 0x17
01a83 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01a87 7436                           je         0x7f345c13733f
01a89 4983c202                       add        r10, 2
01a8d 4983fa1b                       cmp        r10, 0x1b
01a91 75f0                           jne        0x7f345c137303
01a93 41ba17000000                   mov        r10d, 0x17
01a99 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a9e 7412                           je         0x7f345c137332
01aa0 4983c202                       add        r10, 2
01aa4 4983fa1b                       cmp        r10, 0x1b
01aa8 75ef                           jne        0x7f345c137319
01aaa 41ba16000000                   mov        r10d, 0x16
01ab0 eb11                           jmp        0x7f345c137343
01ab2 50                             push       rax
01ab3 4833c0                         xor        rax, rax
01ab6 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
01abc 58                             pop        rax
01abd ebbe                           jmp        0x7f345c1372fd
01abf 4983c201                       add        r10, 1
01ac3 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01ac8 488bf7                         mov        rsi, rdi
01acb 90                             nop        
01acc 90                             nop        
01acd 48b870305630347f0000           movabs     rax, 0x7f3430563070
01ad7 e804845f07                     call       0x7f346372f760
01adc 0f1f8400d41b0007               nop        dword ptr [rax + rax + 0x7001bd4]
01ae4 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
01aec 8b7704                         mov        esi, dword ptr [rdi + 4]
01aef 48bb08a56d50347f0000           movabs     rbx, 0x7f34506da508
01af9 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01b01 48bb088e6d50347f0000           movabs     rbx, 0x7f34506d8e08
01b0b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01b0e 83c202                         add        edx, 2
01b11 895378                         mov        dword ptr [rbx + 0x78], edx
01b14 81e2feff1f00                   and        edx, 0x1ffffe
01b1a 85d2                           test       edx, edx
01b1c 0f8495350000                   je         0x7f345c13a937
01b22 448b9c2414020000               mov        r11d, dword ptr [rsp + 0x214]
01b2a 48bb088e6d50347f0000           movabs     rbx, 0x7f34506d8e08
01b34 4883831001000001               add        qword ptr [rbx + 0x110], 1
01b3c ffc8                           dec        eax
01b3e 2bf0                           sub        esi, eax
01b40 48bb98846d50347f0000           movabs     rbx, 0x7f34506d8498
01b4a 8b4378                         mov        eax, dword ptr [rbx + 0x78]
01b4d 83c002                         add        eax, 2
01b50 894378                         mov        dword ptr [rbx + 0x78], eax
01b53 25feff1f00                     and        eax, 0x1ffffe
01b58 85c0                           test       eax, eax
01b5a 0f8478350000                   je         0x7f345c13a958
01b60 48bb98846d50347f0000           movabs     rbx, 0x7f34506d8498
01b6a 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01b72 48bb0000000000000000           movabs     rbx, 0
01b7c bb00000000                     mov        ebx, 0
01b81 443bdb                         cmp        r11d, ebx
01b84 0f8c6f350000                   jl         0x7f345c13a979
01b8a 443bde                         cmp        r11d, esi
01b8d 0f8d87350000                   jge        0x7f345c13a99a
01b93 498bdb                         mov        rbx, r11
01b96 899c241c020000                 mov        dword ptr [rsp + 0x21c], ebx
01b9d 44899c2414020000               mov        dword ptr [rsp + 0x214], r11d
01ba5 4889bc2480010000               mov        qword ptr [rsp + 0x180], rdi
01bad 488bbc2420020000               mov        rdi, qword ptr [rsp + 0x220]
01bb5 488bf7                         mov        rsi, rdi
01bb8 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01bc2 8b36                           mov        esi, dword ptr [rsi]
01bc4 c1ee0d                         shr        esi, 0xd
01bc7 48c1e60a                       shl        rsi, 0xa
01bcb 41ba00000033                   mov        r10d, 0x33000000
01bd1 4903f2                         add        rsi, r10
01bd4 41ba1f000000                   mov        r10d, 0x1f
01bda 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01bde 7436                           je         0x7f345c137496
01be0 4983c202                       add        r10, 2
01be4 4983fa23                       cmp        r10, 0x23
01be8 75f0                           jne        0x7f345c13745a
01bea 41ba1f000000                   mov        r10d, 0x1f
01bf0 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01bf5 7412                           je         0x7f345c137489
01bf7 4983c202                       add        r10, 2
01bfb 4983fa23                       cmp        r10, 0x23
01bff 75ef                           jne        0x7f345c137470
01c01 41ba1e000000                   mov        r10d, 0x1e
01c07 eb11                           jmp        0x7f345c13749a
01c09 50                             push       rax
01c0a 4833c0                         xor        rax, rax
01c0d f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01c13 58                             pop        rax
01c14 ebbe                           jmp        0x7f345c137454
01c16 4983c201                       add        r10, 1
01c1a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c1f 488bf7                         mov        rsi, rdi
01c22 90                             nop        
01c23 90                             nop        
01c24 90                             nop        
01c25 48b898305630347f0000           movabs     rax, 0x7f3430563098
01c2f e8ac825f07                     call       0x7f346372f760
01c34 0f1f84002c1d0008               nop        dword ptr [rax + rax + 0x8001d2c]
01c3c 483b00                         cmp        rax, qword ptr [rax]
01c3f 488bf0                         mov        rsi, rax
01c42 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01c4c 8b36                           mov        esi, dword ptr [rsi]
01c4e c1ee0d                         shr        esi, 0xd
01c51 48c1e60a                       shl        rsi, 0xa
01c55 41ba00000033                   mov        r10d, 0x33000000
01c5b 4903f2                         add        rsi, r10
01c5e 41ba25000000                   mov        r10d, 0x25
01c64 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01c68 7436                           je         0x7f345c137520
01c6a 4983c202                       add        r10, 2
01c6e 4983fa29                       cmp        r10, 0x29
01c72 75f0                           jne        0x7f345c1374e4
01c74 41ba25000000                   mov        r10d, 0x25
01c7a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01c7f 7412                           je         0x7f345c137513
01c81 4983c202                       add        r10, 2
01c85 4983fa29                       cmp        r10, 0x29
01c89 75ef                           jne        0x7f345c1374fa
01c8b 41ba24000000                   mov        r10d, 0x24
01c91 eb11                           jmp        0x7f345c137524
01c93 50                             push       rax
01c94 4833c0                         xor        rax, rax
01c97 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
01c9d 58                             pop        rax
01c9e ebbe                           jmp        0x7f345c1374de
01ca0 4983c201                       add        r10, 1
01ca4 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01ca9 8b7024                         mov        esi, dword ptr [rax + 0x24]
01cac 4c3b256568b91f                 cmp        r12, qword ptr [rip + 0x1fb96865]
01cb3 0f8414000000                   je         0x7f345c13754d
01cb9 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
01cc3 4883e4f0                       and        rsp, 0xfffffffffffffff0
01cc7 e81450f61e                     call       0x7f347b09c560
01ccc f4                             hlt        
01ccd 488bd0                         mov        rdx, rax
01cd0 48b908a56d50347f0000           movabs     rcx, 0x7f34506da508
01cda 8b12                           mov        edx, dword ptr [rdx]
01cdc c1ea0d                         shr        edx, 0xd
01cdf 48c1e20a                       shl        rdx, 0xa
01ce3 41ba00000033                   mov        r10d, 0x33000000
01ce9 4903d2                         add        rdx, r10
01cec 41ba2b000000                   mov        r10d, 0x2b
01cf2 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01cf6 7436                           je         0x7f345c1375ae
01cf8 4983c202                       add        r10, 2
01cfc 4983fa2f                       cmp        r10, 0x2f
01d00 75f0                           jne        0x7f345c137572
01d02 41ba2b000000                   mov        r10d, 0x2b
01d08 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01d0d 7412                           je         0x7f345c1375a1
01d0f 4983c202                       add        r10, 2
01d13 4983fa2f                       cmp        r10, 0x2f
01d17 75ef                           jne        0x7f345c137588
01d19 41ba2a000000                   mov        r10d, 0x2a
01d1f eb11                           jmp        0x7f345c1375b2
01d21 50                             push       rax
01d22 4833c0                         xor        rax, rax
01d25 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
01d2b 58                             pop        rax
01d2c ebbe                           jmp        0x7f345c13756c
01d2e 4983c201                       add        r10, 1
01d32 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01d37 8b4804                         mov        ecx, dword ptr [rax + 4]
01d3a 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01d44 4883828001000001               add        qword ptr [rdx + 0x180], 1
01d4c 48ba50906d50347f0000           movabs     rdx, 0x7f34506d9050
01d56 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01d5a 4183c002                       add        r8d, 2
01d5e 44894278                       mov        dword ptr [rdx + 0x78], r8d
01d62 4181e0feff1f00                 and        r8d, 0x1ffffe
01d69 4585c0                         test       r8d, r8d
01d6c 0f84e2330000                   je         0x7f345c13a9d4
01d72 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01d7c 4883829001000001               add        qword ptr [rdx + 0x190], 1
01d84 8b9c241c020000                 mov        ebx, dword ptr [rsp + 0x21c]
01d8b 4863db                         movsxd     rbx, ebx
01d8e ba08000000                     mov        edx, 8
01d93 4c8bcb                         mov        r9, rbx
01d96 4c03ca                         add        r9, rdx
01d99 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
01da3 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01da7 4183c002                       add        r8d, 2
01dab 44894278                       mov        dword ptr [rdx + 0x78], r8d
01daf 4181e0feff1f00                 and        r8d, 0x1ffffe
01db6 4585c0                         test       r8d, r8d
01db9 0f84b6330000                   je         0x7f345c13a9f5
01dbf 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
01dc9 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01dd1 48ba58836d50347f0000           movabs     rdx, 0x7f34506d8358
01ddb 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01ddf 4183c002                       add        r8d, 2
01de3 44894278                       mov        dword ptr [rdx + 0x78], r8d
01de7 4181e0feff1f00                 and        r8d, 0x1ffffe
01dee 4585c0                         test       r8d, r8d
01df1 0f849f330000                   je         0x7f345c13aa16
01df7 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
01e01 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01e09 48bad00970e200000000           movabs     rdx, 0xe27009d0
01e13 ba02000000                     mov        edx, 2
01e18 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
01e20 bf00000000                     mov        edi, 0
01e25 488b842420020000               mov        rax, qword ptr [rsp + 0x220]
01e2d 48890424                       mov        qword ptr [rsp], rax
01e31 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
01e39 4889442408                     mov        qword ptr [rsp + 8], rax
01e3e 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01e43 49bad00970e200000000           movabs     r10, 0xe27009d0
01e4d 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01e52 4889842480010000               mov        qword ptr [rsp + 0x180], rax
01e5a 90                             nop        
01e5b 90                             nop        
01e5c 90                             nop        
01e5d 90                             nop        
01e5e 90                             nop        
01e5f e87c855f07                     call       0x7f346372fc60
01e64 0f1f84005c1f0009               nop        dword ptr [rax + rax + 0x9001f5c]
01e6c 448b9c2414020000               mov        r11d, dword ptr [rsp + 0x214]
01e74 4183c310                       add        r11d, 0x10
01e78 8bb42418020000                 mov        esi, dword ptr [rsp + 0x218]
01e7f 83c610                         add        esi, 0x10
01e82 443b9c2404020000               cmp        r11d, dword ptr [rsp + 0x204]
01e8a ba02000000                     mov        edx, 2
01e8f 7c05                           jl         0x7f345c137716
01e91 ba00000000                     mov        edx, 0
01e96 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
01ea0 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
01ea4 4403c2                         add        r8d, edx
01ea7 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
01eab 85d2                           test       edx, edx
01ead 7506                           jne        0x7f345c137735
01eaf 41b802000000                   mov        r8d, 2
01eb5 4181e0fe3f0000                 and        r8d, 0x3ffe
01ebc 4585c0                         test       r8d, r8d
01ebf 0f84f2320000                   je         0x7f345c13aa37
01ec5 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01ec9 418502                         test       dword ptr [r10], eax
01ecc 443b9c2404020000               cmp        r11d, dword ptr [rsp + 0x204]
01ed4 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
01ede b948050000                     mov        ecx, 0x548
01ee3 7c05                           jl         0x7f345c13776a
01ee5 b958050000                     mov        ecx, 0x558
01eea 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01eee 4d8d4001                       lea        r8, [r8 + 1]
01ef2 4c89040a                       mov        qword ptr [rdx + rcx], r8
01ef6 0f8c24f5ffff                   jl         0x7f345c136ca0
01efc 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
01f06 ff8668050000                   inc        dword ptr [rsi + 0x568]
01f0c e996000000                     jmp        0x7f345c137827
01f11 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
01f1b 4883828005000001               add        qword ptr [rdx + 0x580], 1
01f23 488bb42490010000               mov        rsi, qword ptr [rsp + 0x190]
01f2b 8b9424bc010000                 mov        edx, dword ptr [rsp + 0x1bc]
01f32 488bd9                         mov        rbx, rcx
01f35 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
01f3d 448b84248c010000               mov        r8d, dword ptr [rsp + 0x18c]
01f45 4c8bcb                         mov        r9, rbx
01f48 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01f4d 4c89442408                     mov        qword ptr [rsp + 8], r8
01f52 48890c24                       mov        qword ptr [rsp], rcx
01f56 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01f5b 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01f60 488bfe                         mov        rdi, rsi
01f63 488bf2                         mov        rsi, rdx
01f66 488bd1                         mov        rdx, rcx
01f69 498bc8                         mov        rcx, r8
01f6c 4d8bc1                         mov        r8, r9
01f6f e88c665e07                     call       0x7f346371de80
01f74 85c0                           test       eax, eax
01f76 0f842b000000                   je         0x7f345c137827
01f7c 488bf8                         mov        rdi, rax
01f7f 83f7ff                         xor        edi, 0xffffffff
01f82 488b0c24                       mov        rcx, qword ptr [rsp]
01f86 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01f8b 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01f90 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
01f95 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01f9a 442bcf                         sub        r9d, edi
01f9d 03d7                           add        edx, edi
01f9f 4403c7                         add        r8d, edi
01fa2 e931320000                     jmp        0x7f345c13aa58
01fa7 8bb424fc010000                 mov        esi, dword ptr [rsp + 0x1fc]
01fae 448bac2404020000               mov        r13d, dword ptr [rsp + 0x204]
01fb6 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
01fbd 498bdd                         mov        rbx, r13
01fc0 2b9c2400020000                 sub        ebx, dword ptr [rsp + 0x200]
01fc7 83ff10                         cmp        edi, 0x10
01fca 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
01fd4 b990050000                     mov        ecx, 0x590
01fd9 7f05                           jg         0x7f345c137860
01fdb b9a0050000                     mov        ecx, 0x5a0
01fe0 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fe4 4d8d4001                       lea        r8, [r8 + 1]
01fe8 4c89040a                       mov        qword ptr [rdx + rcx], r8
01fec 448b9c2400020000               mov        r11d, dword ptr [rsp + 0x200]
01ff4 0f8f2c000000                   jg         0x7f345c1378a6
01ffa 4183fb10                       cmp        r11d, 0x10
01ffe 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
02008 b9c0050000                     mov        ecx, 0x5c0
0200d 7d05                           jge        0x7f345c137894
0200f b9b0050000                     mov        ecx, 0x5b0
02014 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02018 4d8d4001                       lea        r8, [r8 + 1]
0201c 4c89040a                       mov        qword ptr [rdx + rcx], r8
02020 0f8d8b150000                   jge        0x7f345c138e31
02026 443bdf                         cmp        r11d, edi
02029 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
02033 b928060000                     mov        ecx, 0x628
02038 7c05                           jl         0x7f345c1378bf
0203a b938060000                     mov        ecx, 0x638
0203f 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
02043 4d8d4001                       lea        r8, [r8 + 1]
02047 4c89040a                       mov        qword ptr [rdx + rcx], r8
0204b 0f8cd1030000                   jl         0x7f345c137ca2
02051 83ff30                         cmp        edi, 0x30
02054 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
0205e b948060000                     mov        ecx, 0x648
02063 7e05                           jle        0x7f345c1378ea
02065 b958060000                     mov        ecx, 0x658
0206a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0206e 4d8d4001                       lea        r8, [r8 + 1]
02072 4c89040a                       mov        qword ptr [rdx + rcx], r8
02076 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
0207d 0f8ea7000000                   jle        0x7f345c1379aa
02083 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
0208d 4883826806000001               add        qword ptr [rdx + 0x668], 1
02095 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
0209d 488bd3                         mov        rdx, rbx
020a0 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
020a8 4d8bc5                         mov        r8, r13
020ab 4c8bcf                         mov        r9, rdi
020ae 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
020b6 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
020bb 4c89442408                     mov        qword ptr [rsp + 8], r8
020c0 48890c24                       mov        qword ptr [rsp], rcx
020c4 4889542418                     mov        qword ptr [rsp + 0x18], rdx
020c9 4889742420                     mov        qword ptr [rsp + 0x20], rsi
020ce 488bfe                         mov        rdi, rsi
020d1 488bf2                         mov        rsi, rdx
020d4 488bd1                         mov        rdx, rcx
020d7 498bc8                         mov        rcx, r8
020da 4d8bc1                         mov        r8, r9
020dd e81e655e07                     call       0x7f346371de80
020e2 85c0                           test       eax, eax
020e4 0f842b000000                   je         0x7f345c137995
020ea 488bf8                         mov        rdi, rax
020ed 83f7ff                         xor        edi, 0xffffffff
020f0 488b0c24                       mov        rcx, qword ptr [rsp]
020f4 4c8b442408                     mov        r8, qword ptr [rsp + 8]
020f9 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
020fe 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
02103 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
02108 442bcf                         sub        r9d, edi
0210b 03d7                           add        edx, edi
0210d 4403c7                         add        r8d, edi
02110 e9d4300000                     jmp        0x7f345c13aa69
02115 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
0211f ff8278060000                   inc        dword ptr [rdx + 0x678]
02125 e900020000                     jmp        0x7f345c137baa
0212a 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
02132 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
0213a 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
02142 4489ac2438020000               mov        dword ptr [rsp + 0x238], r13d
0214a 8bbc2428020000                 mov        edi, dword ptr [rsp + 0x228]
02151 90                             nop        
02152 90                             nop        
02153 90                             nop        
02154 90                             nop        
02155 90                             nop        
02156 90                             nop        
02157 90                             nop        
02158 89bc2430020000                 mov        dword ptr [rsp + 0x230], edi
0215f 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
02167 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
02171 4883829006000001               add        qword ptr [rdx + 0x690], 1
02179 48ba206a103300000000           movabs     rdx, 0x33106a20
02183 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02186 83c102                         add        ecx, 2
02189 894a78                         mov        dword ptr [rdx + 0x78], ecx
0218c 81e1feff1f00                   and        ecx, 0x1ffffe
02192 85c9                           test       ecx, ecx
02194 0f845f300000                   je         0x7f345c13aa79
0219a 90                             nop        
0219b 90                             nop        
0219c 90                             nop        
0219d 90                             nop        
0219e 90                             nop        
0219f 90                             nop        
021a0 e984300000                     jmp        0x7f345c13aaa9
021a5 90                             nop        
021a6 90                             nop        
021a7 90                             nop        
021a8 90                             nop        
021a9 90                             nop        
021aa 48ba206a103300000000           movabs     rdx, 0x33106a20
021b4 488d92e0000000                 lea        rdx, [rdx + 0xe0]
021bb 4885c0                         test       rax, rax
021be 7510                           jne        0x7f345c137a50
021c0 f6420801                       test       byte ptr [rdx + 8], 1
021c4 0f8506000000                   jne        0x7f345c137a50
021ca f048834a0801                   lock or    qword ptr [rdx + 8], 1
021d0 48be88c66be200000000           movabs     rsi, 0xe26bc688
021da 488bd6                         mov        rdx, rsi
021dd 48b9206a103300000000           movabs     rcx, 0x33106a20
021e7 8b12                           mov        edx, dword ptr [rdx]
021e9 c1ea0d                         shr        edx, 0xd
021ec 48c1e20a                       shl        rdx, 0xa
021f0 41ba00000033                   mov        r10d, 0x33000000
021f6 4903d2                         add        rdx, r10
021f9 41ba17000000                   mov        r10d, 0x17
021ff 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02203 7436                           je         0x7f345c137abb
02205 4983c202                       add        r10, 2
02209 4983fa1b                       cmp        r10, 0x1b
0220d 75f0                           jne        0x7f345c137a7f
0220f 41ba17000000                   mov        r10d, 0x17
02215 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0221a 7412                           je         0x7f345c137aae
0221c 4983c202                       add        r10, 2
02220 4983fa1b                       cmp        r10, 0x1b
02224 75ef                           jne        0x7f345c137a95
02226 41ba16000000                   mov        r10d, 0x16
0222c eb11                           jmp        0x7f345c137abf
0222e 50                             push       rax
0222f 4833c0                         xor        rax, rax
02232 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02238 58                             pop        rax
02239 ebbe                           jmp        0x7f345c137a79
0223b 4983c201                       add        r10, 1
0223f 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02244 488bd0                         mov        rdx, rax
02247 488bcb                         mov        rcx, rbx
0224a 899c2434020000                 mov        dword ptr [rsp + 0x234], ebx
02251 4889842480010000               mov        qword ptr [rsp + 0x180], rax
02259 90                             nop        
0225a 90                             nop        
0225b 90                             nop        
0225c 90                             nop        
0225d 90                             nop        
0225e 90                             nop        
0225f e87c775f07                     call       0x7f346372f260
02264 0f1f84005c23000b               nop        dword ptr [rax + rax + 0xb00235c]
0226c 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
02276 488386a006000001               add        qword ptr [rsi + 0x6a0], 1
0227e 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
02286 8b942430020000                 mov        edx, dword ptr [rsp + 0x230]
0228d 488bc8                         mov        rcx, rax
02290 90                             nop        
02291 90                             nop        
02292 90                             nop        
02293 90                             nop        
02294 90                             nop        
02295 90                             nop        
02296 90                             nop        
02297 e844815f07                     call       0x7f346372fc60
0229c 0f1f84009423000c               nop        dword ptr [rax + rax + 0xc002394]
022a4 8bbc2430020000                 mov        edi, dword ptr [rsp + 0x230]
022ab 83c708                         add        edi, 8
022ae 8b9c2434020000                 mov        ebx, dword ptr [rsp + 0x234]
022b5 83c308                         add        ebx, 8
022b8 3bbc2438020000                 cmp        edi, dword ptr [rsp + 0x238]
022bf be02000000                     mov        esi, 2
022c4 7c05                           jl         0x7f345c137b4b
022c6 be00000000                     mov        esi, 0
022cb 48b848e76250347f0000           movabs     rax, 0x7f345062e748
022d5 8b507c                         mov        edx, dword ptr [rax + 0x7c]
022d8 03d6                           add        edx, esi
022da 89507c                         mov        dword ptr [rax + 0x7c], edx
022dd 85f6                           test       esi, esi
022df 7505                           jne        0x7f345c137b66
022e1 ba02000000                     mov        edx, 2
022e6 81e2fe3f0000                   and        edx, 0x3ffe
022ec 85d2                           test       edx, edx
022ee 0f843f2f0000                   je         0x7f345c13aab3
022f4 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
022f8 418502                         test       dword ptr [r10], eax
022fb 3bbc2438020000                 cmp        edi, dword ptr [rsp + 0x238]
02302 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
0230c b8b0060000                     mov        eax, 0x6b0
02311 7c05                           jl         0x7f345c137b98
02313 b8c0060000                     mov        eax, 0x6c0
02318 488b1406                       mov        rdx, qword ptr [rsi + rax]
0231c 488d5201                       lea        rdx, [rdx + 1]
02320 48891406                       mov        qword ptr [rsi + rax], rdx
02324 0f8c2efeffff                   jl         0x7f345c1379d8
0232a 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
02332 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
0233a 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
02344 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
0234a 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
02351 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
02359 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
02360 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
02368 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
02370 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
02377 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
0237f 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
02387 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
0238e 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
02396 4889bc2440020000               mov        qword ptr [rsp + 0x240], rdi
0239e 488bbc2450010000               mov        rdi, qword ptr [rsp + 0x150]
023a6 4889bc2448020000               mov        qword ptr [rsp + 0x248], rdi
023ae 8bbc2444010000                 mov        edi, dword ptr [rsp + 0x144]
023b5 89bc243c020000                 mov        dword ptr [rsp + 0x23c], edi
023bc 488bbc2458010000               mov        rdi, qword ptr [rsp + 0x158]
023c4 4889bc2450020000               mov        qword ptr [rsp + 0x250], rdi
023cc 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
023d4 4889bc2458020000               mov        qword ptr [rsp + 0x258], rdi
023dc 8bbc2468010000                 mov        edi, dword ptr [rsp + 0x168]
023e3 89bc2460020000                 mov        dword ptr [rsp + 0x260], edi
023ea 488bbc2490010000               mov        rdi, qword ptr [rsp + 0x190]
023f2 4889bc2468020000               mov        qword ptr [rsp + 0x268], rdi
023fa 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
02402 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
0240a 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
02412 4d8beb                         mov        r13, r11
02415 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
0241d e9a81c0000                     jmp        0x7f345c13994a
02422 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
02429 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
02431 4183fb10                       cmp        r11d, 0x10
02435 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
0243f bfe8060000                     mov        edi, 0x6e8
02444 7c05                           jl         0x7f345c137ccb
02446 bff8060000                     mov        edi, 0x6f8
0244b 488b043e                       mov        rax, qword ptr [rsi + rdi]
0244f 488d4001                       lea        rax, [rax + 1]
02453 4889043e                       mov        qword ptr [rsi + rdi], rax
02457 0f8c180d0000                   jl         0x7f345c1389f5
0245d 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
02465 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
0246d 8b842428020000                 mov        eax, dword ptr [rsp + 0x228]
02474 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
0247b 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
02483 448b9c246c010000               mov        r11d, dword ptr [rsp + 0x16c]
0248b 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
02493 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
0249b 8bbc24a0010000                 mov        edi, dword ptr [rsp + 0x1a0]
024a2 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
024aa 8b942488010000                 mov        edx, dword ptr [rsp + 0x188]
024b1 89942464020000                 mov        dword ptr [rsp + 0x264], edx
024b8 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
024bf 89942470020000                 mov        dword ptr [rsp + 0x270], edx
024c6 488b942480010000               mov        rdx, qword ptr [rsp + 0x180]
024ce 4889942478020000               mov        qword ptr [rsp + 0x278], rdx
024d6 488b942450010000               mov        rdx, qword ptr [rsp + 0x150]
024de 4889942480020000               mov        qword ptr [rsp + 0x280], rdx
024e6 8b942444010000                 mov        edx, dword ptr [rsp + 0x144]
024ed 89942474020000                 mov        dword ptr [rsp + 0x274], edx
024f4 488b942458010000               mov        rdx, qword ptr [rsp + 0x158]
024fc 4889942488020000               mov        qword ptr [rsp + 0x288], rdx
02504 488b942460010000               mov        rdx, qword ptr [rsp + 0x160]
0250c 4889942490020000               mov        qword ptr [rsp + 0x290], rdx
02514 8b942468010000                 mov        edx, dword ptr [rsp + 0x168]
0251b 89942498020000                 mov        dword ptr [rsp + 0x298], edx
02522 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
0252a 48899424a0020000               mov        qword ptr [rsp + 0x2a0], rdx
02532 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
0253a 89842428030000                 mov        dword ptr [rsp + 0x328], eax
02541 4489ac2440030000               mov        dword ptr [rsp + 0x340], r13d
02549 89b42420030000                 mov        dword ptr [rsp + 0x320], esi
02550 44898c2444030000               mov        dword ptr [rsp + 0x344], r9d
02558 44899c2450030000               mov        dword ptr [rsp + 0x350], r11d
02560 48898c2458030000               mov        qword ptr [rsp + 0x358], rcx
02568 4c89842448030000               mov        qword ptr [rsp + 0x348], r8
02570 89bc2424030000                 mov        dword ptr [rsp + 0x324], edi
02577 4c89b42438030000               mov        qword ptr [rsp + 0x338], r14
0257f 4889942418030000               mov        qword ptr [rsp + 0x318], rdx
02587 90                             nop        
02588 488b942478020000               mov        rdx, qword ptr [rsp + 0x278]
02590 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
0259a 4883860807000001               add        qword ptr [rsi + 0x708], 1
025a2 48be00986d50347f0000           movabs     rsi, 0x7f34506d9800
025ac 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
025af 83c702                         add        edi, 2
025b2 897e78                         mov        dword ptr [rsi + 0x78], edi
025b5 81e7feff1f00                   and        edi, 0x1ffffe
025bb 85ff                           test       edi, edi
025bd 0f84912c0000                   je         0x7f345c13aad4
025c3 48be20936ee200000000           movabs     rsi, 0xe26e9320
025cd 48bf00986d50347f0000           movabs     rdi, 0x7f34506d9800
025d7 8b36                           mov        esi, dword ptr [rsi]
025d9 c1ee0d                         shr        esi, 0xd
025dc 48c1e60a                       shl        rsi, 0xa
025e0 41ba00000033                   mov        r10d, 0x33000000
025e6 4903f2                         add        rsi, r10
025e9 41ba17000000                   mov        r10d, 0x17
025ef 4a3b34d7                       cmp        rsi, qword ptr [rdi + r10*8]
025f3 7436                           je         0x7f345c137eab
025f5 4983c202                       add        r10, 2
025f9 4983fa1b                       cmp        r10, 0x1b
025fd 75f0                           jne        0x7f345c137e6f
025ff 41ba17000000                   mov        r10d, 0x17
02605 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
0260a 7412                           je         0x7f345c137e9e
0260c 4983c202                       add        r10, 2
02610 4983fa1b                       cmp        r10, 0x1b
02614 75ef                           jne        0x7f345c137e85
02616 41ba16000000                   mov        r10d, 0x16
0261c eb11                           jmp        0x7f345c137eaf
0261e 50                             push       rax
0261f 4833c0                         xor        rax, rax
02622 f04a0fb134d7                   lock cmpxchg qword ptr [rdi + r10*8], rsi
02628 58                             pop        rax
02629 ebbe                           jmp        0x7f345c137e69
0262b 4983c201                       add        r10, 1
0262f 4a8304d701                     add        qword ptr [rdi + r10*8], 1
02634 8b4204                         mov        eax, dword ptr [rdx + 4]
02637 8984242c030000                 mov        dword ptr [rsp + 0x32c], eax
0263e 48be00986d50347f0000           movabs     rsi, 0x7f34506d9800
02648 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02650 48be088e6d50347f0000           movabs     rsi, 0x7f34506d8e08
0265a 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
0265d 83c702                         add        edi, 2
02660 897e78                         mov        dword ptr [rsi + 0x78], edi
02663 81e7feff1f00                   and        edi, 0x1ffffe
02669 85ff                           test       edi, edi
0266b 0f841d2c0000                   je         0x7f345c13ab0e
02671 48be088e6d50347f0000           movabs     rsi, 0x7f34506d8e08
0267b 4883861001000001               add        qword ptr [rsi + 0x110], 1
02683 488bf0                         mov        rsi, rax
02686 83ee0f                         sub        esi, 0xf
02689 48bf98846d50347f0000           movabs     rdi, 0x7f34506d8498
02693 8b4778                         mov        eax, dword ptr [rdi + 0x78]
02696 83c002                         add        eax, 2
02699 894778                         mov        dword ptr [rdi + 0x78], eax
0269c 25feff1f00                     and        eax, 0x1ffffe
026a1 85c0                           test       eax, eax
026a3 0f84062c0000                   je         0x7f345c13ab2f
026a9 48bf98846d50347f0000           movabs     rdi, 0x7f34506d8498
026b3 488387b000000001               add        qword ptr [rdi + 0xb0], 1
026bb 48bf0000000000000000           movabs     rdi, 0
026c5 bf00000000                     mov        edi, 0
026ca 3bdf                           cmp        ebx, edi
026cc 0f8cfe2b0000                   jl         0x7f345c13ab50
026d2 3bde                           cmp        ebx, esi
026d4 0f8d172c0000                   jge        0x7f345c13ab71
026da 488bf3                         mov        rsi, rbx
026dd 89b42430030000                 mov        dword ptr [rsp + 0x330], esi
026e4 899c2434030000                 mov        dword ptr [rsp + 0x334], ebx
026eb 48bf20936ee200000000           movabs     rdi, 0xe26e9320
026f5 488bc7                         mov        rax, rdi
026f8 48be00986d50347f0000           movabs     rsi, 0x7f34506d9800
02702 8b00                           mov        eax, dword ptr [rax]
02704 c1e80d                         shr        eax, 0xd
02707 48c1e00a                       shl        rax, 0xa
0270b 41ba00000033                   mov        r10d, 0x33000000
02711 4903c2                         add        rax, r10
02714 41ba25000000                   mov        r10d, 0x25
0271a 4a3b04d6                       cmp        rax, qword ptr [rsi + r10*8]
0271e 743c                           je         0x7f345c137fdc
02720 4983c202                       add        r10, 2
02724 4983fa29                       cmp        r10, 0x29
02728 75f0                           jne        0x7f345c137f9a
0272a 41ba25000000                   mov        r10d, 0x25
02730 4a833cd600                     cmp        qword ptr [rsi + r10*8], 0
02735 7412                           je         0x7f345c137fc9
02737 4983c202                       add        r10, 2
0273b 4983fa29                       cmp        r10, 0x29
0273f 75ef                           jne        0x7f345c137fb0
02741 41ba24000000                   mov        r10d, 0x24
02747 eb17                           jmp        0x7f345c137fe0
02749 53                             push       rbx
0274a 488bd8                         mov        rbx, rax
0274d 4833c0                         xor        rax, rax
02750 f04a0fb11cd6                   lock cmpxchg qword ptr [rsi + r10*8], rbx
02756 488bc3                         mov        rax, rbx
02759 5b                             pop        rbx
0275a ebb8                           jmp        0x7f345c137f94
0275c 4983c201                       add        r10, 1
02760 4a8304d601                     add        qword ptr [rsi + r10*8], 1
02765 48bea0856d50347f0000           movabs     rsi, 0x7f34506d85a0
0276f 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02772 83c302                         add        ebx, 2
02775 895e78                         mov        dword ptr [rsi + 0x78], ebx
02778 81e3feff1f00                   and        ebx, 0x1ffffe
0277e 85db                           test       ebx, ebx
02780 0f848c2b0000                   je         0x7f345c13ab92
02786 48bea0856d50347f0000           movabs     rsi, 0x7f34506d85a0
02790 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02798 48bed0866d50347f0000           movabs     rsi, 0x7f34506d86d0
027a2 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
027a5 83c702                         add        edi, 2
027a8 897e78                         mov        dword ptr [rsi + 0x78], edi
027ab 81e7feff1f00                   and        edi, 0x1ffffe
027b1 85ff                           test       edi, edi
027b3 0f847a2b0000                   je         0x7f345c13abb3
027b9 48bed0866d50347f0000           movabs     rsi, 0x7f34506d86d0
027c3 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
027c9 8bb42430030000                 mov        esi, dword ptr [rsp + 0x330]
027d0 48bb18136fe200000000           movabs     rbx, 0xe26f1318
027da 488bc3                         mov        rax, rbx
027dd 49bb00986d50347f0000           movabs     r11, 0x7f34506d9800
027e7 4983836001000001               add        qword ptr [r11 + 0x160], 1
027ef 48b8d0996d50347f0000           movabs     rax, 0x7f34506d99d0
027f9 448b5878                       mov        r11d, dword ptr [rax + 0x78]
027fd 4183c302                       add        r11d, 2
02801 44895878                       mov        dword ptr [rax + 0x78], r11d
02805 4181e3feff1f00                 and        r11d, 0x1ffffe
0280c 4585db                         test       r11d, r11d
0280f 0f843f2b0000                   je         0x7f345c13abd4
02815 488bc3                         mov        rax, rbx
02818 49bbd0996d50347f0000           movabs     r11, 0x7f34506d99d0
02822 498383b000000001               add        qword ptr [r11 + 0xb0], 1
0282a 48b8b89a6d50347f0000           movabs     rax, 0x7f34506d9ab8
02834 448b5878                       mov        r11d, dword ptr [rax + 0x78]
02838 4183c302                       add        r11d, 2
0283c 44895878                       mov        dword ptr [rax + 0x78], r11d
02840 4181e3feff1f00                 and        r11d, 0x1ffffe
02847 4585db                         test       r11d, r11d
0284a 0f84252b0000                   je         0x7f345c13abf5
02850 48b8b89a6d50347f0000           movabs     rax, 0x7f34506d9ab8
0285a 488380c000000001               add        qword ptr [rax + 0xc0], 1
02862 48bb888f6d50347f0000           movabs     rbx, 0x7f34506d8f88
0286c 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0286f 83c002                         add        eax, 2
02872 894378                         mov        dword ptr [rbx + 0x78], eax
02875 25feff1f00                     and        eax, 0x1ffffe
0287a 85c0                           test       eax, eax
0287c 0f84142b0000                   je         0x7f345c13ac16
02882 48bb20936ee200000000           movabs     rbx, 0xe26e9320
0288c 488bc3                         mov        rax, rbx
0288f 49bbb89a6d50347f0000           movabs     r11, 0x7f34506d9ab8
02899 8b00                           mov        eax, dword ptr [rax]
0289b c1e80d                         shr        eax, 0xd
0289e 48c1e00a                       shl        rax, 0xa
028a2 41ba00000033                   mov        r10d, 0x33000000
028a8 4903c2                         add        rax, r10
028ab 41ba1d000000                   mov        r10d, 0x1d
028b1 4b3b04d3                       cmp        rax, qword ptr [r11 + r10*8]
028b5 743c                           je         0x7f345c138173
028b7 4983c202                       add        r10, 2
028bb 4983fa21                       cmp        r10, 0x21
028bf 75f0                           jne        0x7f345c138131
028c1 41ba1d000000                   mov        r10d, 0x1d
028c7 4b833cd300                     cmp        qword ptr [r11 + r10*8], 0
028cc 7412                           je         0x7f345c138160
028ce 4983c202                       add        r10, 2
028d2 4983fa21                       cmp        r10, 0x21
028d6 75ef                           jne        0x7f345c138147
028d8 41ba1c000000                   mov        r10d, 0x1c
028de eb17                           jmp        0x7f345c138177
028e0 53                             push       rbx
028e1 488bd8                         mov        rbx, rax
028e4 4833c0                         xor        rax, rax
028e7 f04b0fb11cd3                   lock cmpxchg qword ptr [r11 + r10*8], rbx
028ed 488bc3                         mov        rax, rbx
028f0 5b                             pop        rbx
028f1 ebb8                           jmp        0x7f345c13812b
028f3 4983c201                       add        r10, 1
028f7 4b8304d301                     add        qword ptr [r11 + r10*8], 1
028fc 48b8b89a6d50347f0000           movabs     rax, 0x7f34506d9ab8
02906 8b1b                           mov        ebx, dword ptr [rbx]
02908 c1eb0d                         shr        ebx, 0xd
0290b 48c1e30a                       shl        rbx, 0xa
0290f 41ba00000033                   mov        r10d, 0x33000000
02915 4903da                         add        rbx, r10
02918 41ba23000000                   mov        r10d, 0x23
0291e 4a3b1cd0                       cmp        rbx, qword ptr [rax + r10*8]
02922 743c                           je         0x7f345c1381e0
02924 4983c202                       add        r10, 2
02928 4983fa27                       cmp        r10, 0x27
0292c 75f0                           jne        0x7f345c13819e
0292e 41ba23000000                   mov        r10d, 0x23
02934 4a833cd000                     cmp        qword ptr [rax + r10*8], 0
02939 7412                           je         0x7f345c1381cd
0293b 4983c202                       add        r10, 2
0293f 4983fa27                       cmp        r10, 0x27
02943 75ef                           jne        0x7f345c1381b4
02945 41ba22000000                   mov        r10d, 0x22
0294b eb17                           jmp        0x7f345c1381e4
0294d 51                             push       rcx
0294e 488bc8                         mov        rcx, rax
02951 4833c0                         xor        rax, rax
02954 f04a0fb11cd1                   lock cmpxchg qword ptr [rcx + r10*8], rbx
0295a 488bc1                         mov        rax, rcx
0295d 59                             pop        rcx
0295e ebb8                           jmp        0x7f345c138198
02960 4983c201                       add        r10, 1
02964 4a8304d001                     add        qword ptr [rax + r10*8], 1
02969 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
02973 4883834001000001               add        qword ptr [rbx + 0x140], 1
0297b 48bb50906d50347f0000           movabs     rbx, 0x7f34506d9050
02985 8b4378                         mov        eax, dword ptr [rbx + 0x78]
02988 83c002                         add        eax, 2
0298b 894378                         mov        dword ptr [rbx + 0x78], eax
0298e 25feff1f00                     and        eax, 0x1ffffe
02993 85c0                           test       eax, eax
02995 0f841c2a0000                   je         0x7f345c13ac37
0299b 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
029a5 4883835001000001               add        qword ptr [rbx + 0x150], 1
029ad 4863de                         movsxd     rbx, esi
029b0 be08000000                     mov        esi, 8
029b5 488bc3                         mov        rax, rbx
029b8 4803c6                         add        rax, rsi
029bb 48bed8816d50347f0000           movabs     rsi, 0x7f34506d81d8
029c5 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
029c9 4183c302                       add        r11d, 2
029cd 44895e78                       mov        dword ptr [rsi + 0x78], r11d
029d1 4181e3feff1f00                 and        r11d, 0x1ffffe
029d8 4585db                         test       r11d, r11d
029db 0f84f7290000                   je         0x7f345c13ac58
029e1 48bed8816d50347f0000           movabs     rsi, 0x7f34506d81d8
029eb 488386e000000001               add        qword ptr [rsi + 0xe0], 1
029f3 48be58836d50347f0000           movabs     rsi, 0x7f34506d8358
029fd 448b5e78                       mov        r11d, dword ptr [rsi + 0x78]
02a01 4183c302                       add        r11d, 2
02a05 44895e78                       mov        dword ptr [rsi + 0x78], r11d
02a09 4181e3feff1f00                 and        r11d, 0x1ffffe
02a10 4585db                         test       r11d, r11d
02a13 0f84e0290000                   je         0x7f345c13ac79
02a19 48beb89a6d50347f0000           movabs     rsi, 0x7f34506d9ab8
02a23 4883867001000001               add        qword ptr [rsi + 0x170], 1
02a2b 48bee86b6fe200000000           movabs     rsi, 0xe26f6be8
02a35 48be68936ee200000000           movabs     rsi, 0xe26e9368
02a3f 4c8bda                         mov        r11, rdx
02a42 ba02000000                     mov        edx, 2
02a47 b910000000                     mov        ecx, 0x10
02a4c 4d8bc3                         mov        r8, r11
02a4f 4c8bc8                         mov        r9, rax
02a52 bf00000000                     mov        edi, 0
02a57 4c891c24                       mov        qword ptr [rsp], r11
02a5b 48895c2408                     mov        qword ptr [rsp + 8], rbx
02a60 49ba20936ee200000000           movabs     r10, 0xe26e9320
02a6a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02a6f 49bae86b6fe200000000           movabs     r10, 0xe26f6be8
02a79 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02a7e 4c899c2478020000               mov        qword ptr [rsp + 0x278], r11
02a86 90                             nop        
02a87 e854795f07                     call       0x7f346372fc60
02a8c 0f1f8400842b000e               nop        dword ptr [rax + rax + 0xe002b84]
02a94 4885c0                         test       rax, rax
02a97 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
02aa1 750c                           jne        0x7f345c13832f
02aa3 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02aaa e988000000                     jmp        0x7f345c1383b7
02aaf 8b38                           mov        edi, dword ptr [rax]
02ab1 c1ef0d                         shr        edi, 0xd
02ab4 48c1e70a                       shl        rdi, 0xa
02ab8 41ba00000033                   mov        r10d, 0x33000000
02abe 4903fa                         add        rdi, r10
02ac1 41ba31000000                   mov        r10d, 0x31
02ac7 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02acb 7436                           je         0x7f345c138383
02acd 4983c202                       add        r10, 2
02ad1 4983fa35                       cmp        r10, 0x35
02ad5 75f0                           jne        0x7f345c138347
02ad7 41ba31000000                   mov        r10d, 0x31
02add 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02ae2 7412                           je         0x7f345c138376
02ae4 4983c202                       add        r10, 2
02ae8 4983fa35                       cmp        r10, 0x35
02aec 75ef                           jne        0x7f345c13835d
02aee 41ba30000000                   mov        r10d, 0x30
02af4 eb11                           jmp        0x7f345c138387
02af6 50                             push       rax
02af7 4833c0                         xor        rax, rax
02afa f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
02b00 58                             pop        rax
02b01 ebbe                           jmp        0x7f345c138341
02b03 4983c201                       add        r10, 1
02b07 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02b0c 48bf00b0143300000000           movabs     rdi, 0x3314b000
02b16 8b18                           mov        ebx, dword ptr [rax]
02b18 c1eb0d                         shr        ebx, 0xd
02b1b 48c1e30a                       shl        rbx, 0xa
02b1f 41ba00000033                   mov        r10d, 0x33000000
02b25 4903da                         add        rbx, r10
02b28 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02b2c 0f85e8280000                   jne        0x7f345c13ac9a
02b32 e900000000                     jmp        0x7f345c1383b7
02b37 488bf8                         mov        rdi, rax
02b3a 4889bc2460030000               mov        qword ptr [rsp + 0x360], rdi
02b42 483b07                         cmp        rax, qword ptr [rdi]
02b45 488bf7                         mov        rsi, rdi
02b48 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
02b52 8b36                           mov        esi, dword ptr [rsi]
02b54 c1ee0d                         shr        esi, 0xd
02b57 48c1e60a                       shl        rsi, 0xa
02b5b 41ba00000033                   mov        r10d, 0x33000000
02b61 4903f2                         add        rsi, r10
02b64 41bae4000000                   mov        r10d, 0xe4
02b6a 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02b6e 743c                           je         0x7f345c13842c
02b70 4983c202                       add        r10, 2
02b74 4981fae8000000                 cmp        r10, 0xe8
02b7b 75ed                           jne        0x7f345c1383ea
02b7d 41bae4000000                   mov        r10d, 0xe4
02b83 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02b88 7415                           je         0x7f345c13841f
02b8a 4983c202                       add        r10, 2
02b8e 4981fae8000000                 cmp        r10, 0xe8
02b95 75ec                           jne        0x7f345c138403
02b97 41bae3000000                   mov        r10d, 0xe3
02b9d eb11                           jmp        0x7f345c138430
02b9f 50                             push       rax
02ba0 4833c0                         xor        rax, rax
02ba3 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02ba9 58                             pop        rax
02baa ebb8                           jmp        0x7f345c1383e4
02bac 4983c201                       add        r10, 1
02bb0 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02bb5 48be08a56d50347f0000           movabs     rsi, 0x7f34506da508
02bbf 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02bc2 83c302                         add        ebx, 2
02bc5 895e78                         mov        dword ptr [rsi + 0x78], ebx
02bc8 81e3feff1f00                   and        ebx, 0x1ffffe
02bce 85db                           test       ebx, ebx
02bd0 0f847a280000                   je         0x7f345c13acd0
02bd6 488bf7                         mov        rsi, rdi
02bd9 48bb08a56d50347f0000           movabs     rbx, 0x7f34506da508
02be3 8b36                           mov        esi, dword ptr [rsi]
02be5 c1ee0d                         shr        esi, 0xd
02be8 48c1e60a                       shl        rsi, 0xa
02bec 41ba00000033                   mov        r10d, 0x33000000
02bf2 4903f2                         add        rsi, r10
02bf5 41ba17000000                   mov        r10d, 0x17
02bfb 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02bff 7436                           je         0x7f345c1384b7
02c01 4983c202                       add        r10, 2
02c05 4983fa1b                       cmp        r10, 0x1b
02c09 75f0                           jne        0x7f345c13847b
02c0b 41ba17000000                   mov        r10d, 0x17
02c11 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02c16 7412                           je         0x7f345c1384aa
02c18 4983c202                       add        r10, 2
02c1c 4983fa1b                       cmp        r10, 0x1b
02c20 75ef                           jne        0x7f345c138491
02c22 41ba16000000                   mov        r10d, 0x16
02c28 eb11                           jmp        0x7f345c1384bb
02c2a 50                             push       rax
02c2b 4833c0                         xor        rax, rax
02c2e f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
02c34 58                             pop        rax
02c35 ebbe                           jmp        0x7f345c138475
02c37 4983c201                       add        r10, 1
02c3b 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02c40 488bf7                         mov        rsi, rdi
02c43 90                             nop        
02c44 90                             nop        
02c45 48b8c0305630347f0000           movabs     rax, 0x7f34305630c0
02c4f e88c725f07                     call       0x7f346372f760
02c54 0f1f84004c2d000f               nop        dword ptr [rax + rax + 0xf002d4c]
02c5c 48be08a56d50347f0000           movabs     rsi, 0x7f34506da508
02c66 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02c6e 48be088e6d50347f0000           movabs     rsi, 0x7f34506d8e08
02c78 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02c7b 83c702                         add        edi, 2
02c7e 897e78                         mov        dword ptr [rsi + 0x78], edi
02c81 81e7feff1f00                   and        edi, 0x1ffffe
02c87 85ff                           test       edi, edi
02c89 0f84e2270000                   je         0x7f345c13acf1
02c8f 8bb4242c030000                 mov        esi, dword ptr [rsp + 0x32c]
02c96 8bbc2428030000                 mov        edi, dword ptr [rsp + 0x328]
02c9d 48bb088e6d50347f0000           movabs     rbx, 0x7f34506d8e08
02ca7 4883831001000001               add        qword ptr [rbx + 0x110], 1
02caf ffc8                           dec        eax
02cb1 2bf0                           sub        esi, eax
02cb3 48bb98846d50347f0000           movabs     rbx, 0x7f34506d8498
02cbd 8b4378                         mov        eax, dword ptr [rbx + 0x78]
02cc0 83c002                         add        eax, 2
02cc3 894378                         mov        dword ptr [rbx + 0x78], eax
02cc6 25feff1f00                     and        eax, 0x1ffffe
02ccb 85c0                           test       eax, eax
02ccd 0f84bf270000                   je         0x7f345c13ad12
02cd3 48bb98846d50347f0000           movabs     rbx, 0x7f34506d8498
02cdd 488383b000000001               add        qword ptr [rbx + 0xb0], 1
02ce5 48bb0000000000000000           movabs     rbx, 0
02cef bb00000000                     mov        ebx, 0
02cf4 3bfb                           cmp        edi, ebx
02cf6 0f8cb7270000                   jl         0x7f345c13ad33
02cfc 3bfe                           cmp        edi, esi
02cfe 0f8dd0270000                   jge        0x7f345c13ad54
02d04 488bc7                         mov        rax, rdi
02d07 89842454030000                 mov        dword ptr [rsp + 0x354], eax
02d0e 89bc2428030000                 mov        dword ptr [rsp + 0x328], edi
02d15 488bbc2460030000               mov        rdi, qword ptr [rsp + 0x360]
02d1d 488bf7                         mov        rsi, rdi
02d20 48b908a56d50347f0000           movabs     rcx, 0x7f34506da508
02d2a 8b36                           mov        esi, dword ptr [rsi]
02d2c c1ee0d                         shr        esi, 0xd
02d2f 48c1e60a                       shl        rsi, 0xa
02d33 41ba00000033                   mov        r10d, 0x33000000
02d39 4903f2                         add        rsi, r10
02d3c 41ba1f000000                   mov        r10d, 0x1f
02d42 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02d46 7436                           je         0x7f345c1385fe
02d48 4983c202                       add        r10, 2
02d4c 4983fa23                       cmp        r10, 0x23
02d50 75f0                           jne        0x7f345c1385c2
02d52 41ba1f000000                   mov        r10d, 0x1f
02d58 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02d5d 7412                           je         0x7f345c1385f1
02d5f 4983c202                       add        r10, 2
02d63 4983fa23                       cmp        r10, 0x23
02d67 75ef                           jne        0x7f345c1385d8
02d69 41ba1e000000                   mov        r10d, 0x1e
02d6f eb11                           jmp        0x7f345c138602
02d71 50                             push       rax
02d72 4833c0                         xor        rax, rax
02d75 f04a0fb134d1                   lock cmpxchg qword ptr [rcx + r10*8], rsi
02d7b 58                             pop        rax
02d7c ebbe                           jmp        0x7f345c1385bc
02d7e 4983c201                       add        r10, 1
02d82 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02d87 488bf7                         mov        rsi, rdi
02d8a 90                             nop        
02d8b 90                             nop        
02d8c 90                             nop        
02d8d 48b8e8305630347f0000           movabs     rax, 0x7f34305630e8
02d97 e844715f07                     call       0x7f346372f760
02d9c 0f1f8400942e0010               nop        dword ptr [rax + rax + 0x10002e94]
02da4 483b00                         cmp        rax, qword ptr [rax]
02da7 488bf0                         mov        rsi, rax
02daa 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
02db4 8b36                           mov        esi, dword ptr [rsi]
02db6 c1ee0d                         shr        esi, 0xd
02db9 48c1e60a                       shl        rsi, 0xa
02dbd 41ba00000033                   mov        r10d, 0x33000000
02dc3 4903f2                         add        rsi, r10
02dc6 41ba25000000                   mov        r10d, 0x25
02dcc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02dd0 7436                           je         0x7f345c138688
02dd2 4983c202                       add        r10, 2
02dd6 4983fa29                       cmp        r10, 0x29
02dda 75f0                           jne        0x7f345c13864c
02ddc 41ba25000000                   mov        r10d, 0x25
02de2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02de7 7412                           je         0x7f345c13867b
02de9 4983c202                       add        r10, 2
02ded 4983fa29                       cmp        r10, 0x29
02df1 75ef                           jne        0x7f345c138662
02df3 41ba24000000                   mov        r10d, 0x24
02df9 eb11                           jmp        0x7f345c13868c
02dfb 50                             push       rax
02dfc 4833c0                         xor        rax, rax
02dff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
02e05 58                             pop        rax
02e06 ebbe                           jmp        0x7f345c138646
02e08 4983c201                       add        r10, 1
02e0c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02e11 8b7024                         mov        esi, dword ptr [rax + 0x24]
02e14 4c3b25fd56b91f                 cmp        r12, qword ptr [rip + 0x1fb956fd]
02e1b 0f8414000000                   je         0x7f345c1386b5
02e21 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
02e2b 4883e4f0                       and        rsp, 0xfffffffffffffff0
02e2f e8ac3ef61e                     call       0x7f347b09c560
02e34 f4                             hlt        
02e35 488bd0                         mov        rdx, rax
02e38 48b908a56d50347f0000           movabs     rcx, 0x7f34506da508
02e42 8b12                           mov        edx, dword ptr [rdx]
02e44 c1ea0d                         shr        edx, 0xd
02e47 48c1e20a                       shl        rdx, 0xa
02e4b 41ba00000033                   mov        r10d, 0x33000000
02e51 4903d2                         add        rdx, r10
02e54 41ba2b000000                   mov        r10d, 0x2b
02e5a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02e5e 7436                           je         0x7f345c138716
02e60 4983c202                       add        r10, 2
02e64 4983fa2f                       cmp        r10, 0x2f
02e68 75f0                           jne        0x7f345c1386da
02e6a 41ba2b000000                   mov        r10d, 0x2b
02e70 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02e75 7412                           je         0x7f345c138709
02e77 4983c202                       add        r10, 2
02e7b 4983fa2f                       cmp        r10, 0x2f
02e7f 75ef                           jne        0x7f345c1386f0
02e81 41ba2a000000                   mov        r10d, 0x2a
02e87 eb11                           jmp        0x7f345c13871a
02e89 50                             push       rax
02e8a 4833c0                         xor        rax, rax
02e8d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
02e93 58                             pop        rax
02e94 ebbe                           jmp        0x7f345c1386d4
02e96 4983c201                       add        r10, 1
02e9a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02e9f 8b4804                         mov        ecx, dword ptr [rax + 4]
02ea2 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
02eac 4883828001000001               add        qword ptr [rdx + 0x180], 1
02eb4 48ba50906d50347f0000           movabs     rdx, 0x7f34506d9050
02ebe 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02ec2 4183c002                       add        r8d, 2
02ec6 44894278                       mov        dword ptr [rdx + 0x78], r8d
02eca 4181e0feff1f00                 and        r8d, 0x1ffffe
02ed1 4585c0                         test       r8d, r8d
02ed4 0f8434260000                   je         0x7f345c13ad8e
02eda 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
02ee4 4883829001000001               add        qword ptr [rdx + 0x190], 1
02eec 8b842454030000                 mov        eax, dword ptr [rsp + 0x354]
02ef3 4863c0                         movsxd     rax, eax
02ef6 ba08000000                     mov        edx, 8
02efb 4c8bc8                         mov        r9, rax
02efe 4c03ca                         add        r9, rdx
02f01 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
02f0b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02f0f 4183c002                       add        r8d, 2
02f13 44894278                       mov        dword ptr [rdx + 0x78], r8d
02f17 4181e0feff1f00                 and        r8d, 0x1ffffe
02f1e 4585c0                         test       r8d, r8d
02f21 0f8408260000                   je         0x7f345c13adaf
02f27 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
02f31 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02f39 48ba58836d50347f0000           movabs     rdx, 0x7f34506d8358
02f43 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02f47 4183c002                       add        r8d, 2
02f4b 44894278                       mov        dword ptr [rdx + 0x78], r8d
02f4f 4181e0feff1f00                 and        r8d, 0x1ffffe
02f56 4585c0                         test       r8d, r8d
02f59 0f84f1250000                   je         0x7f345c13add0
02f5f 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
02f69 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
02f71 48bad00970e200000000           movabs     rdx, 0xe27009d0
02f7b ba02000000                     mov        edx, 2
02f80 4c8b842478020000               mov        r8, qword ptr [rsp + 0x278]
02f88 bf00000000                     mov        edi, 0
02f8d 488b9c2460030000               mov        rbx, qword ptr [rsp + 0x360]
02f95 48891c24                       mov        qword ptr [rsp], rbx
02f99 488b9c2478020000               mov        rbx, qword ptr [rsp + 0x278]
02fa1 48895c2408                     mov        qword ptr [rsp + 8], rbx
02fa6 4889442410                     mov        qword ptr [rsp + 0x10], rax
02fab 49bad00970e200000000           movabs     r10, 0xe27009d0
02fb5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02fba 48899c2478020000               mov        qword ptr [rsp + 0x278], rbx
02fc2 90                             nop        
02fc3 90                             nop        
02fc4 90                             nop        
02fc5 90                             nop        
02fc6 90                             nop        
02fc7 e814745f07                     call       0x7f346372fc60
02fcc 0f1f8400c4300011               nop        dword ptr [rax + rax + 0x110030c4]
02fd4 8b842428030000                 mov        eax, dword ptr [rsp + 0x328]
02fdb 83c010                         add        eax, 0x10
02fde 8b9c2434030000                 mov        ebx, dword ptr [rsp + 0x334]
02fe5 83c310                         add        ebx, 0x10
02fe8 3b842440030000                 cmp        eax, dword ptr [rsp + 0x340]
02fef ba02000000                     mov        edx, 2
02ff4 7c05                           jl         0x7f345c13887b
02ff6 ba00000000                     mov        edx, 0
02ffb 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
03005 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03009 4403c2                         add        r8d, edx
0300c 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03010 85d2                           test       edx, edx
03012 7506                           jne        0x7f345c13889a
03014 41b802000000                   mov        r8d, 2
0301a 4181e0fe3f0000                 and        r8d, 0x3ffe
03021 4585c0                         test       r8d, r8d
03024 0f8447250000                   je         0x7f345c13adf1
0302a 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0302e 418502                         test       dword ptr [r10], eax
03031 3b842440030000                 cmp        eax, dword ptr [rsp + 0x340]
03038 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
03042 b958070000                     mov        ecx, 0x758
03047 7d05                           jge        0x7f345c1388ce
03049 b948070000                     mov        ecx, 0x748
0304e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03052 4d8d4001                       lea        r8, [r8 + 1]
03056 4c89040a                       mov        qword ptr [rdx + rcx], r8
0305a 0f8d0c000000                   jge        0x7f345c1388ec
03060 89842428030000                 mov        dword ptr [rsp + 0x328], eax
03067 e91cf5ffff                     jmp        0x7f345c137e08
0306c 8b842440030000                 mov        eax, dword ptr [rsp + 0x340]
03073 8bb42420030000                 mov        esi, dword ptr [rsp + 0x320]
0307a 448b8c2444030000               mov        r9d, dword ptr [rsp + 0x344]
03082 448b9c2450030000               mov        r11d, dword ptr [rsp + 0x350]
0308a 488b8c2458030000               mov        rcx, qword ptr [rsp + 0x358]
03092 4c8b842448030000               mov        r8, qword ptr [rsp + 0x348]
0309a 8bbc2424030000                 mov        edi, dword ptr [rsp + 0x324]
030a1 4c8bb42438030000               mov        r14, qword ptr [rsp + 0x338]
030a9 8b942464020000                 mov        edx, dword ptr [rsp + 0x264]
030b0 49bd48e76250347f0000           movabs     r13, 0x7f345062e748
030ba 41ff8568070000                 inc        dword ptr [r13 + 0x768]
030c1 498bdb                         mov        rbx, r11
030c4 4c8bd8                         mov        r11, rax
030c7 488bc7                         mov        rax, rdi
030ca 498bfb                         mov        rdi, r11
030cd 4c8bda                         mov        r11, rdx
030d0 8b942470020000                 mov        edx, dword ptr [rsp + 0x270]
030d7 4c8bef                         mov        r13, rdi
030da 488bbc2478020000               mov        rdi, qword ptr [rsp + 0x278]
030e2 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
030ea 4c8bac2480020000               mov        r13, qword ptr [rsp + 0x280]
030f2 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
030fa 448bac2474020000               mov        r13d, dword ptr [rsp + 0x274]
03102 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
0310a 4c8bac2488020000               mov        r13, qword ptr [rsp + 0x288]
03112 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
0311a 4c8bac2490020000               mov        r13, qword ptr [rsp + 0x290]
03122 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
0312a 448bac2498020000               mov        r13d, dword ptr [rsp + 0x298]
03132 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
0313a 4c8bac24a0020000               mov        r13, qword ptr [rsp + 0x2a0]
03142 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
0314a 4c8bef                         mov        r13, rdi
0314d 488bbc2418030000               mov        rdi, qword ptr [rsp + 0x318]
03155 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
0315d 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
03165 4d8beb                         mov        r13, r11
03168 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
03170 e9550f0000                     jmp        0x7f345c13994a
03175 4183fb08                       cmp        r11d, 8
03179 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
03183 b980070000                     mov        ecx, 0x780
03188 7c05                           jl         0x7f345c138a0f
0318a b990070000                     mov        ecx, 0x790
0318f 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
03193 4d8d4001                       lea        r8, [r8 + 1]
03197 4c89040a                       mov        qword ptr [rdx + rcx], r8
0319b 0f8ceb020000                   jl         0x7f345c138d0c
031a1 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
031a9 4403ac24a4010000               add        r13d, dword ptr [rsp + 0x1a4]
031b1 4489ac2474030000               mov        dword ptr [rsp + 0x374], r13d
031b9 8bbc2428020000                 mov        edi, dword ptr [rsp + 0x228]
031c0 89bc246c030000                 mov        dword ptr [rsp + 0x36c], edi
031c7 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
031cf 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
031d9 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
031e1 48ba206a103300000000           movabs     rdx, 0x33106a20
031eb 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
031ee 83c102                         add        ecx, 2
031f1 894a78                         mov        dword ptr [rdx + 0x78], ecx
031f4 81e1feff1f00                   and        ecx, 0x1ffffe
031fa 85c9                           test       ecx, ecx
031fc 0f8490230000                   je         0x7f345c13ae12
03202 90                             nop        
03203 90                             nop        
03204 90                             nop        
03205 90                             nop        
03206 90                             nop        
03207 90                             nop        
03208 e9b5230000                     jmp        0x7f345c13ae42
0320d 90                             nop        
0320e 90                             nop        
0320f 90                             nop        
03210 90                             nop        
03211 90                             nop        
03212 48ba206a103300000000           movabs     rdx, 0x33106a20
0321c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
03223 4885c0                         test       rax, rax
03226 7510                           jne        0x7f345c138ab8
03228 f6420801                       test       byte ptr [rdx + 8], 1
0322c 0f8506000000                   jne        0x7f345c138ab8
03232 f048834a0801                   lock or    qword ptr [rdx + 8], 1
03238 48be88c66be200000000           movabs     rsi, 0xe26bc688
03242 488bd6                         mov        rdx, rsi
03245 48b9206a103300000000           movabs     rcx, 0x33106a20
0324f 8b12                           mov        edx, dword ptr [rdx]
03251 c1ea0d                         shr        edx, 0xd
03254 48c1e20a                       shl        rdx, 0xa
03258 41ba00000033                   mov        r10d, 0x33000000
0325e 4903d2                         add        rdx, r10
03261 41ba17000000                   mov        r10d, 0x17
03267 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0326b 7436                           je         0x7f345c138b23
0326d 4983c202                       add        r10, 2
03271 4983fa1b                       cmp        r10, 0x1b
03275 75f0                           jne        0x7f345c138ae7
03277 41ba17000000                   mov        r10d, 0x17
0327d 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03282 7412                           je         0x7f345c138b16
03284 4983c202                       add        r10, 2
03288 4983fa1b                       cmp        r10, 0x1b
0328c 75ef                           jne        0x7f345c138afd
0328e 41ba16000000                   mov        r10d, 0x16
03294 eb11                           jmp        0x7f345c138b27
03296 50                             push       rax
03297 4833c0                         xor        rax, rax
0329a f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
032a0 58                             pop        rax
032a1 ebbe                           jmp        0x7f345c138ae1
032a3 4983c201                       add        r10, 1
032a7 4a8304d101                     add        qword ptr [rcx + r10*8], 1
032ac 488bd0                         mov        rdx, rax
032af 488bcb                         mov        rcx, rbx
032b2 899c2470030000                 mov        dword ptr [rsp + 0x370], ebx
032b9 4889842480010000               mov        qword ptr [rsp + 0x180], rax
032c1 90                             nop        
032c2 90                             nop        
032c3 90                             nop        
032c4 90                             nop        
032c5 90                             nop        
032c6 90                             nop        
032c7 e814675f07                     call       0x7f346372f260
032cc 0f1f8400c4330013               nop        dword ptr [rax + rax + 0x130033c4]
032d4 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
032de 488386b007000001               add        qword ptr [rsi + 0x7b0], 1
032e6 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
032ee 8b94246c030000                 mov        edx, dword ptr [rsp + 0x36c]
032f5 488bc8                         mov        rcx, rax
032f8 90                             nop        
032f9 90                             nop        
032fa 90                             nop        
032fb 90                             nop        
032fc 90                             nop        
032fd 90                             nop        
032fe 90                             nop        
032ff e8dc705f07                     call       0x7f346372fc60
03304 0f1f8400fc330014               nop        dword ptr [rax + rax + 0x140033fc]
0330c 8bbc246c030000                 mov        edi, dword ptr [rsp + 0x36c]
03313 83c708                         add        edi, 8
03316 8b9c2470030000                 mov        ebx, dword ptr [rsp + 0x370]
0331d 83c308                         add        ebx, 8
03320 3bbc2474030000                 cmp        edi, dword ptr [rsp + 0x374]
03327 be02000000                     mov        esi, 2
0332c 7c05                           jl         0x7f345c138bb3
0332e be00000000                     mov        esi, 0
03333 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
0333d 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
03340 03ce                           add        ecx, esi
03342 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
03345 85f6                           test       esi, esi
03347 7505                           jne        0x7f345c138bce
03349 b902000000                     mov        ecx, 2
0334e 81e1fe3f0000                   and        ecx, 0x3ffe
03354 85c9                           test       ecx, ecx
03356 0f8470220000                   je         0x7f345c13ae4c
0335c 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03360 418502                         test       dword ptr [r10], eax
03363 3bbc2474030000                 cmp        edi, dword ptr [rsp + 0x374]
0336a 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
03374 bac0070000                     mov        edx, 0x7c0
03379 7c05                           jl         0x7f345c138c00
0337b bad0070000                     mov        edx, 0x7d0
03380 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
03384 488d4901                       lea        rcx, [rcx + 1]
03388 48890c16                       mov        qword ptr [rsi + rdx], rcx
0338c 0f8c2efeffff                   jl         0x7f345c138a40
03392 448bac2474030000               mov        r13d, dword ptr [rsp + 0x374]
0339a 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
033a4 ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
033aa 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
033b1 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
033b9 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
033c0 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
033c8 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
033d0 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
033d7 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
033df 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
033e7 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
033ee 498bfd                         mov        rdi, r13
033f1 4c8bac2480010000               mov        r13, qword ptr [rsp + 0x180]
033f9 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
03401 4c8bac2450010000               mov        r13, qword ptr [rsp + 0x150]
03409 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
03411 448bac2444010000               mov        r13d, dword ptr [rsp + 0x144]
03419 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
03421 4c8bac2458010000               mov        r13, qword ptr [rsp + 0x158]
03429 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
03431 4c8bac2460010000               mov        r13, qword ptr [rsp + 0x160]
03439 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
03441 448bac2468010000               mov        r13d, dword ptr [rsp + 0x168]
03449 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
03451 4c8bac2490010000               mov        r13, qword ptr [rsp + 0x190]
03459 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
03461 4c8bef                         mov        r13, rdi
03464 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
0346c 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03474 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
0347c 4d8beb                         mov        r13, r11
0347f 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
03487 e93e0c0000                     jmp        0x7f345c13994a
0348c 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
03496 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
0349e 488bb42480010000               mov        rsi, qword ptr [rsp + 0x180]
034a6 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
034ad 488bcb                         mov        rcx, rbx
034b0 4d8bc3                         mov        r8, r11
034b3 448b8c24a4010000               mov        r9d, dword ptr [rsp + 0x1a4]
034bb 90                             nop        
034bc 90                             nop        
034bd 90                             nop        
034be 90                             nop        
034bf e81c6f5f07                     call       0x7f346372fc60
034c4 0f1f8400bc350016               nop        dword ptr [rax + rax + 0x160035bc]
034cc 488bf8                         mov        rdi, rax
034cf 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
034d6 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
034de 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
034e5 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
034ed 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
034f5 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
034fc 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
03504 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
0350c 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
03513 4c8bef                         mov        r13, rdi
03516 488bbc2480010000               mov        rdi, qword ptr [rsp + 0x180]
0351e 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
03526 4c8bac2450010000               mov        r13, qword ptr [rsp + 0x150]
0352e 4c89ac2448020000               mov        qword ptr [rsp + 0x248], r13
03536 448bac2444010000               mov        r13d, dword ptr [rsp + 0x144]
0353e 4489ac243c020000               mov        dword ptr [rsp + 0x23c], r13d
03546 4c8bac2458010000               mov        r13, qword ptr [rsp + 0x158]
0354e 4c89ac2450020000               mov        qword ptr [rsp + 0x250], r13
03556 4c8bac2460010000               mov        r13, qword ptr [rsp + 0x160]
0355e 4c89ac2458020000               mov        qword ptr [rsp + 0x258], r13
03566 448bac2468010000               mov        r13d, dword ptr [rsp + 0x168]
0356e 4489ac2460020000               mov        dword ptr [rsp + 0x260], r13d
03576 4c8bac2490010000               mov        r13, qword ptr [rsp + 0x190]
0357e 4c89ac2468020000               mov        qword ptr [rsp + 0x268], r13
03586 4c8bef                         mov        r13, rdi
03589 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
03591 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
03599 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
035a1 4d8beb                         mov        r13, r11
035a4 4c8b9c2468020000               mov        r11, qword ptr [rsp + 0x268]
035ac e9190b0000                     jmp        0x7f345c13994a
035b1 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
035b8 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
035c0 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
035c8 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
035d2 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
035da 48be00986d50347f0000           movabs     rsi, 0x7f34506d9800
035e4 8b5678                         mov        edx, dword ptr [rsi + 0x78]
035e7 83c202                         add        edx, 2
035ea 895678                         mov        dword ptr [rsi + 0x78], edx
035ed 81e2feff1f00                   and        edx, 0x1ffffe
035f3 85d2                           test       edx, edx
035f5 0f84f21f0000                   je         0x7f345c13ae6d
035fb 48be20936ee200000000           movabs     rsi, 0xe26e9320
03605 48ba00986d50347f0000           movabs     rdx, 0x7f34506d9800
0360f 8b36                           mov        esi, dword ptr [rsi]
03611 c1ee0d                         shr        esi, 0xd
03614 48c1e60a                       shl        rsi, 0xa
03618 41ba00000033                   mov        r10d, 0x33000000
0361e 4903f2                         add        rsi, r10
03621 41ba17000000                   mov        r10d, 0x17
03627 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0362b 7436                           je         0x7f345c138ee3
0362d 4983c202                       add        r10, 2
03631 4983fa1b                       cmp        r10, 0x1b
03635 75f0                           jne        0x7f345c138ea7
03637 41ba17000000                   mov        r10d, 0x17
0363d 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03642 7412                           je         0x7f345c138ed6
03644 4983c202                       add        r10, 2
03648 4983fa1b                       cmp        r10, 0x1b
0364c 75ef                           jne        0x7f345c138ebd
0364e 41ba16000000                   mov        r10d, 0x16
03654 eb11                           jmp        0x7f345c138ee7
03656 50                             push       rax
03657 4833c0                         xor        rax, rax
0365a f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03660 58                             pop        rax
03661 ebbe                           jmp        0x7f345c138ea1
03663 4983c201                       add        r10, 1
03667 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0366c 448b5804                       mov        r11d, dword ptr [rax + 4]
03670 48be00986d50347f0000           movabs     rsi, 0x7f34506d9800
0367a 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03682 48be088e6d50347f0000           movabs     rsi, 0x7f34506d8e08
0368c 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0368f 83c202                         add        edx, 2
03692 895678                         mov        dword ptr [rsi + 0x78], edx
03695 81e2feff1f00                   and        edx, 0x1ffffe
0369b 85d2                           test       edx, edx
0369d 0f84841f0000                   je         0x7f345c13aea7
036a3 48be088e6d50347f0000           movabs     rsi, 0x7f34506d8e08
036ad 4883861001000001               add        qword ptr [rsi + 0x110], 1
036b5 498bf3                         mov        rsi, r11
036b8 83ee0f                         sub        esi, 0xf
036bb 48ba98846d50347f0000           movabs     rdx, 0x7f34506d8498
036c5 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
036c8 83c102                         add        ecx, 2
036cb 894a78                         mov        dword ptr [rdx + 0x78], ecx
036ce 81e1feff1f00                   and        ecx, 0x1ffffe
036d4 85c9                           test       ecx, ecx
036d6 0f846c1f0000                   je         0x7f345c13aec8
036dc 48ba98846d50347f0000           movabs     rdx, 0x7f34506d8498
036e6 488382b000000001               add        qword ptr [rdx + 0xb0], 1
036ee 48ba0000000000000000           movabs     rdx, 0
036f8 ba00000000                     mov        edx, 0
036fd 3bda                           cmp        ebx, edx
036ff 0f8c641f0000                   jl         0x7f345c13aee9
03705 3bde                           cmp        ebx, esi
03707 0f8d7d1f0000                   jge        0x7f345c13af0a
0370d 48be20936ee200000000           movabs     rsi, 0xe26e9320
03717 488bd6                         mov        rdx, rsi
0371a 48b900986d50347f0000           movabs     rcx, 0x7f34506d9800
03724 8b12                           mov        edx, dword ptr [rdx]
03726 c1ea0d                         shr        edx, 0xd
03729 48c1e20a                       shl        rdx, 0xa
0372d 41ba00000033                   mov        r10d, 0x33000000
03733 4903d2                         add        rdx, r10
03736 41ba25000000                   mov        r10d, 0x25
0373c 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03740 7436                           je         0x7f345c138ff8
03742 4983c202                       add        r10, 2
03746 4983fa29                       cmp        r10, 0x29
0374a 75f0                           jne        0x7f345c138fbc
0374c 41ba25000000                   mov        r10d, 0x25
03752 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03757 7412                           je         0x7f345c138feb
03759 4983c202                       add        r10, 2
0375d 4983fa29                       cmp        r10, 0x29
03761 75ef                           jne        0x7f345c138fd2
03763 41ba24000000                   mov        r10d, 0x24
03769 eb11                           jmp        0x7f345c138ffc
0376b 50                             push       rax
0376c 4833c0                         xor        rax, rax
0376f f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03775 58                             pop        rax
03776 ebbe                           jmp        0x7f345c138fb6
03778 4983c201                       add        r10, 1
0377c 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03781 48baa0856d50347f0000           movabs     rdx, 0x7f34506d85a0
0378b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0378e 83c102                         add        ecx, 2
03791 894a78                         mov        dword ptr [rdx + 0x78], ecx
03794 81e1feff1f00                   and        ecx, 0x1ffffe
0379a 85c9                           test       ecx, ecx
0379c 0f84091f0000                   je         0x7f345c13af2b
037a2 48baa0856d50347f0000           movabs     rdx, 0x7f34506d85a0
037ac 488382b000000001               add        qword ptr [rdx + 0xb0], 1
037b4 48bed0866d50347f0000           movabs     rsi, 0x7f34506d86d0
037be 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037c1 83c202                         add        edx, 2
037c4 895678                         mov        dword ptr [rsi + 0x78], edx
037c7 81e2feff1f00                   and        edx, 0x1ffffe
037cd 85d2                           test       edx, edx
037cf 0f84f71e0000                   je         0x7f345c13af4c
037d5 48bed0866d50347f0000           movabs     rsi, 0x7f34506d86d0
037df ff86c0000000                   inc        dword ptr [rsi + 0xc0]
037e5 44899c2478030000               mov        dword ptr [rsp + 0x378], r11d
037ed 48be18136fe200000000           movabs     rsi, 0xe26f1318
037f7 488bd6                         mov        rdx, rsi
037fa 48b900986d50347f0000           movabs     rcx, 0x7f34506d9800
03804 4883816001000001               add        qword ptr [rcx + 0x160], 1
0380c 48bad0996d50347f0000           movabs     rdx, 0x7f34506d99d0
03816 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03819 83c102                         add        ecx, 2
0381c 894a78                         mov        dword ptr [rdx + 0x78], ecx
0381f 81e1feff1f00                   and        ecx, 0x1ffffe
03825 85c9                           test       ecx, ecx
03827 0f84c01e0000                   je         0x7f345c13af6d
0382d 488bd6                         mov        rdx, rsi
03830 48b9d0996d50347f0000           movabs     rcx, 0x7f34506d99d0
0383a 488381b000000001               add        qword ptr [rcx + 0xb0], 1
03842 48bab89a6d50347f0000           movabs     rdx, 0x7f34506d9ab8
0384c 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0384f 83c102                         add        ecx, 2
03852 894a78                         mov        dword ptr [rdx + 0x78], ecx
03855 81e1feff1f00                   and        ecx, 0x1ffffe
0385b 85c9                           test       ecx, ecx
0385d 0f84ab1e0000                   je         0x7f345c13af8e
03863 48bab89a6d50347f0000           movabs     rdx, 0x7f34506d9ab8
0386d 488382c000000001               add        qword ptr [rdx + 0xc0], 1
03875 48be888f6d50347f0000           movabs     rsi, 0x7f34506d8f88
0387f 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03882 83c202                         add        edx, 2
03885 895678                         mov        dword ptr [rsi + 0x78], edx
03888 81e2feff1f00                   and        edx, 0x1ffffe
0388e 85d2                           test       edx, edx
03890 0f84991e0000                   je         0x7f345c13afaf
03896 48be20936ee200000000           movabs     rsi, 0xe26e9320
038a0 488bd6                         mov        rdx, rsi
038a3 48b9b89a6d50347f0000           movabs     rcx, 0x7f34506d9ab8
038ad 8b12                           mov        edx, dword ptr [rdx]
038af c1ea0d                         shr        edx, 0xd
038b2 48c1e20a                       shl        rdx, 0xa
038b6 41ba00000033                   mov        r10d, 0x33000000
038bc 4903d2                         add        rdx, r10
038bf 41ba1d000000                   mov        r10d, 0x1d
038c5 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
038c9 7436                           je         0x7f345c139181
038cb 4983c202                       add        r10, 2
038cf 4983fa21                       cmp        r10, 0x21
038d3 75f0                           jne        0x7f345c139145
038d5 41ba1d000000                   mov        r10d, 0x1d
038db 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
038e0 7412                           je         0x7f345c139174
038e2 4983c202                       add        r10, 2
038e6 4983fa21                       cmp        r10, 0x21
038ea 75ef                           jne        0x7f345c13915b
038ec 41ba1c000000                   mov        r10d, 0x1c
038f2 eb11                           jmp        0x7f345c139185
038f4 50                             push       rax
038f5 4833c0                         xor        rax, rax
038f8 f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
038fe 58                             pop        rax
038ff ebbe                           jmp        0x7f345c13913f
03901 4983c201                       add        r10, 1
03905 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0390a 48bab89a6d50347f0000           movabs     rdx, 0x7f34506d9ab8
03914 8b36                           mov        esi, dword ptr [rsi]
03916 c1ee0d                         shr        esi, 0xd
03919 48c1e60a                       shl        rsi, 0xa
0391d 41ba00000033                   mov        r10d, 0x33000000
03923 4903f2                         add        rsi, r10
03926 41ba23000000                   mov        r10d, 0x23
0392c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03930 7436                           je         0x7f345c1391e8
03932 4983c202                       add        r10, 2
03936 4983fa27                       cmp        r10, 0x27
0393a 75f0                           jne        0x7f345c1391ac
0393c 41ba23000000                   mov        r10d, 0x23
03942 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03947 7412                           je         0x7f345c1391db
03949 4983c202                       add        r10, 2
0394d 4983fa27                       cmp        r10, 0x27
03951 75ef                           jne        0x7f345c1391c2
03953 41ba22000000                   mov        r10d, 0x22
03959 eb11                           jmp        0x7f345c1391ec
0395b 50                             push       rax
0395c 4833c0                         xor        rax, rax
0395f f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03965 58                             pop        rax
03966 ebbe                           jmp        0x7f345c1391a6
03968 4983c201                       add        r10, 1
0396c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03971 48beb89a6d50347f0000           movabs     rsi, 0x7f34506d9ab8
0397b 4883864001000001               add        qword ptr [rsi + 0x140], 1
03983 48be50906d50347f0000           movabs     rsi, 0x7f34506d9050
0398d 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03990 83c202                         add        edx, 2
03993 895678                         mov        dword ptr [rsi + 0x78], edx
03996 81e2feff1f00                   and        edx, 0x1ffffe
0399c 85d2                           test       edx, edx
0399e 0f84ac1d0000                   je         0x7f345c13afd0
039a4 48beb89a6d50347f0000           movabs     rsi, 0x7f34506d9ab8
039ae 4883865001000001               add        qword ptr [rsi + 0x150], 1
039b6 4863db                         movsxd     rbx, ebx
039b9 be08000000                     mov        esi, 8
039be 4c8bcb                         mov        r9, rbx
039c1 4c03ce                         add        r9, rsi
039c4 48bed8816d50347f0000           movabs     rsi, 0x7f34506d81d8
039ce 8b5678                         mov        edx, dword ptr [rsi + 0x78]
039d1 83c202                         add        edx, 2
039d4 895678                         mov        dword ptr [rsi + 0x78], edx
039d7 81e2feff1f00                   and        edx, 0x1ffffe
039dd 85d2                           test       edx, edx
039df 0f848c1d0000                   je         0x7f345c13aff1
039e5 48bed8816d50347f0000           movabs     rsi, 0x7f34506d81d8
039ef 488386e000000001               add        qword ptr [rsi + 0xe0], 1
039f7 48be58836d50347f0000           movabs     rsi, 0x7f34506d8358
03a01 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03a04 83c202                         add        edx, 2
03a07 895678                         mov        dword ptr [rsi + 0x78], edx
03a0a 81e2feff1f00                   and        edx, 0x1ffffe
03a10 85d2                           test       edx, edx
03a12 0f847a1d0000                   je         0x7f345c13b012
03a18 48beb89a6d50347f0000           movabs     rsi, 0x7f34506d9ab8
03a22 4883867001000001               add        qword ptr [rsi + 0x170], 1
03a2a 48bee86b6fe200000000           movabs     rsi, 0xe26f6be8
03a34 48be68936ee200000000           movabs     rsi, 0xe26e9368
03a3e ba02000000                     mov        edx, 2
03a43 b910000000                     mov        ecx, 0x10
03a48 4c8bc0                         mov        r8, rax
03a4b bf00000000                     mov        edi, 0
03a50 48890424                       mov        qword ptr [rsp], rax
03a54 48895c2408                     mov        qword ptr [rsp + 8], rbx
03a59 49ba20936ee200000000           movabs     r10, 0xe26e9320
03a63 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03a68 49bae86b6fe200000000           movabs     r10, 0xe26f6be8
03a72 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03a77 4889842480010000               mov        qword ptr [rsp + 0x180], rax
03a7f e85c695f07                     call       0x7f346372fc60
03a84 0f1f84007c3b0017               nop        dword ptr [rax + rax + 0x17003b7c]
03a8c 4885c0                         test       rax, rax
03a8f 48bbb89a6d50347f0000           movabs     rbx, 0x7f34506d9ab8
03a99 750c                           jne        0x7f345c139327
03a9b 808b7901000001                 or         byte ptr [rbx + 0x179], 1
03aa2 e988000000                     jmp        0x7f345c1393af
03aa7 8b38                           mov        edi, dword ptr [rax]
03aa9 c1ef0d                         shr        edi, 0xd
03aac 48c1e70a                       shl        rdi, 0xa
03ab0 41ba00000033                   mov        r10d, 0x33000000
03ab6 4903fa                         add        rdi, r10
03ab9 41ba31000000                   mov        r10d, 0x31
03abf 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03ac3 7436                           je         0x7f345c13937b
03ac5 4983c202                       add        r10, 2
03ac9 4983fa35                       cmp        r10, 0x35
03acd 75f0                           jne        0x7f345c13933f
03acf 41ba31000000                   mov        r10d, 0x31
03ad5 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03ada 7412                           je         0x7f345c13936e
03adc 4983c202                       add        r10, 2
03ae0 4983fa35                       cmp        r10, 0x35
03ae4 75ef                           jne        0x7f345c139355
03ae6 41ba30000000                   mov        r10d, 0x30
03aec eb11                           jmp        0x7f345c13937f
03aee 50                             push       rax
03aef 4833c0                         xor        rax, rax
03af2 f04a0fb13cd3                   lock cmpxchg qword ptr [rbx + r10*8], rdi
03af8 58                             pop        rax
03af9 ebbe                           jmp        0x7f345c139339
03afb 4983c201                       add        r10, 1
03aff 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03b04 48bf00b0143300000000           movabs     rdi, 0x3314b000
03b0e 8b18                           mov        ebx, dword ptr [rax]
03b10 c1eb0d                         shr        ebx, 0xd
03b13 48c1e30a                       shl        rbx, 0xa
03b17 41ba00000033                   mov        r10d, 0x33000000
03b1d 4903da                         add        rbx, r10
03b20 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03b24 0f85891c0000                   jne        0x7f345c13b033
03b2a e900000000                     jmp        0x7f345c1393af
03b2f 488bf8                         mov        rdi, rax
03b32 4889bc2480030000               mov        qword ptr [rsp + 0x380], rdi
03b3a 483b07                         cmp        rax, qword ptr [rdi]
03b3d 488bf7                         mov        rsi, rdi
03b40 48bb48e76250347f0000           movabs     rbx, 0x7f345062e748
03b4a 8b36                           mov        esi, dword ptr [rsi]
03b4c c1ee0d                         shr        esi, 0xd
03b4f 48c1e60a                       shl        rsi, 0xa
03b53 41ba00000033                   mov        r10d, 0x33000000
03b59 4903f2                         add        rsi, r10
03b5c 41babd000000                   mov        r10d, 0xbd
03b62 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03b66 743c                           je         0x7f345c139424
03b68 4983c202                       add        r10, 2
03b6c 4981fac1000000                 cmp        r10, 0xc1
03b73 75ed                           jne        0x7f345c1393e2
03b75 41babd000000                   mov        r10d, 0xbd
03b7b 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03b80 7415                           je         0x7f345c139417
03b82 4983c202                       add        r10, 2
03b86 4981fac1000000                 cmp        r10, 0xc1
03b8d 75ec                           jne        0x7f345c1393fb
03b8f 41babc000000                   mov        r10d, 0xbc
03b95 eb11                           jmp        0x7f345c139428
03b97 50                             push       rax
03b98 4833c0                         xor        rax, rax
03b9b f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03ba1 58                             pop        rax
03ba2 ebb8                           jmp        0x7f345c1393dc
03ba4 4983c201                       add        r10, 1
03ba8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03bad 48be08a56d50347f0000           movabs     rsi, 0x7f34506da508
03bb7 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03bba 83c302                         add        ebx, 2
03bbd 895e78                         mov        dword ptr [rsi + 0x78], ebx
03bc0 81e3feff1f00                   and        ebx, 0x1ffffe
03bc6 85db                           test       ebx, ebx
03bc8 0f841b1c0000                   je         0x7f345c13b069
03bce 488bf7                         mov        rsi, rdi
03bd1 48bb08a56d50347f0000           movabs     rbx, 0x7f34506da508
03bdb 8b36                           mov        esi, dword ptr [rsi]
03bdd c1ee0d                         shr        esi, 0xd
03be0 48c1e60a                       shl        rsi, 0xa
03be4 41ba00000033                   mov        r10d, 0x33000000
03bea 4903f2                         add        rsi, r10
03bed 41ba17000000                   mov        r10d, 0x17
03bf3 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03bf7 7436                           je         0x7f345c1394af
03bf9 4983c202                       add        r10, 2
03bfd 4983fa1b                       cmp        r10, 0x1b
03c01 75f0                           jne        0x7f345c139473
03c03 41ba17000000                   mov        r10d, 0x17
03c09 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03c0e 7412                           je         0x7f345c1394a2
03c10 4983c202                       add        r10, 2
03c14 4983fa1b                       cmp        r10, 0x1b
03c18 75ef                           jne        0x7f345c139489
03c1a 41ba16000000                   mov        r10d, 0x16
03c20 eb11                           jmp        0x7f345c1394b3
03c22 50                             push       rax
03c23 4833c0                         xor        rax, rax
03c26 f04a0fb134d3                   lock cmpxchg qword ptr [rbx + r10*8], rsi
03c2c 58                             pop        rax
03c2d ebbe                           jmp        0x7f345c13946d
03c2f 4983c201                       add        r10, 1
03c33 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03c38 488bf7                         mov        rsi, rdi
03c3b 90                             nop        
03c3c 90                             nop        
03c3d 48b810315630347f0000           movabs     rax, 0x7f3430563110
03c47 e894625f07                     call       0x7f346372f760
03c4c 0f1f8400443d0018               nop        dword ptr [rax + rax + 0x18003d44]
03c54 48be08a56d50347f0000           movabs     rsi, 0x7f34506da508
03c5e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03c66 48be088e6d50347f0000           movabs     rsi, 0x7f34506d8e08
03c70 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03c73 83c702                         add        edi, 2
03c76 897e78                         mov        dword ptr [rsi + 0x78], edi
03c79 81e7feff1f00                   and        edi, 0x1ffffe
03c7f 85ff                           test       edi, edi
03c81 0f84831b0000                   je         0x7f345c13b08a
03c87 448b9c2478030000               mov        r11d, dword ptr [rsp + 0x378]
03c8f 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03c97 48be088e6d50347f0000           movabs     rsi, 0x7f34506d8e08
03ca1 4883861001000001               add        qword ptr [rsi + 0x110], 1
03ca9 ffc8                           dec        eax
03cab 442bd8                         sub        r11d, eax
03cae 48be98846d50347f0000           movabs     rsi, 0x7f34506d8498
03cb8 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03cbb 83c702                         add        edi, 2
03cbe 897e78                         mov        dword ptr [rsi + 0x78], edi
03cc1 81e7feff1f00                   and        edi, 0x1ffffe
03cc7 85ff                           test       edi, edi
03cc9 0f845c1b0000                   je         0x7f345c13b0ab
03ccf 48be98846d50347f0000           movabs     rsi, 0x7f34506d8498
03cd9 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03ce1 48be0000000000000000           movabs     rsi, 0
03ceb be00000000                     mov        esi, 0
03cf0 443bee                         cmp        r13d, esi
03cf3 0f8c531b0000                   jl         0x7f345c13b0cc
03cf9 453beb                         cmp        r13d, r11d
03cfc 0f8d6b1b0000                   jge        0x7f345c13b0ed
03d02 498bfd                         mov        rdi, r13
03d05 89bc247c030000                 mov        dword ptr [rsp + 0x37c], edi
03d0c 488bbc2480030000               mov        rdi, qword ptr [rsp + 0x380]
03d14 4489ac2428020000               mov        dword ptr [rsp + 0x228], r13d
03d1c 488bf7                         mov        rsi, rdi
03d1f 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
03d29 8b36                           mov        esi, dword ptr [rsi]
03d2b c1ee0d                         shr        esi, 0xd
03d2e 48c1e60a                       shl        rsi, 0xa
03d32 41ba00000033                   mov        r10d, 0x33000000
03d38 4903f2                         add        rsi, r10
03d3b 41ba1f000000                   mov        r10d, 0x1f
03d41 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03d45 7436                           je         0x7f345c1395fd
03d47 4983c202                       add        r10, 2
03d4b 4983fa23                       cmp        r10, 0x23
03d4f 75f0                           jne        0x7f345c1395c1
03d51 41ba1f000000                   mov        r10d, 0x1f
03d57 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03d5c 7412                           je         0x7f345c1395f0
03d5e 4983c202                       add        r10, 2
03d62 4983fa23                       cmp        r10, 0x23
03d66 75ef                           jne        0x7f345c1395d7
03d68 41ba1e000000                   mov        r10d, 0x1e
03d6e eb11                           jmp        0x7f345c139601
03d70 50                             push       rax
03d71 4833c0                         xor        rax, rax
03d74 f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03d7a 58                             pop        rax
03d7b ebbe                           jmp        0x7f345c1395bb
03d7d 4983c201                       add        r10, 1
03d81 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03d86 488bf7                         mov        rsi, rdi
03d89 90                             nop        
03d8a 90                             nop        
03d8b 90                             nop        
03d8c 90                             nop        
03d8d 48b838315630347f0000           movabs     rax, 0x7f3430563138
03d97 e844615f07                     call       0x7f346372f760
03d9c 0f1f8400943e0019               nop        dword ptr [rax + rax + 0x19003e94]
03da4 483b00                         cmp        rax, qword ptr [rax]
03da7 488bf0                         mov        rsi, rax
03daa 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
03db4 8b36                           mov        esi, dword ptr [rsi]
03db6 c1ee0d                         shr        esi, 0xd
03db9 48c1e60a                       shl        rsi, 0xa
03dbd 41ba00000033                   mov        r10d, 0x33000000
03dc3 4903f2                         add        rsi, r10
03dc6 41ba25000000                   mov        r10d, 0x25
03dcc 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03dd0 7436                           je         0x7f345c139688
03dd2 4983c202                       add        r10, 2
03dd6 4983fa29                       cmp        r10, 0x29
03dda 75f0                           jne        0x7f345c13964c
03ddc 41ba25000000                   mov        r10d, 0x25
03de2 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03de7 7412                           je         0x7f345c13967b
03de9 4983c202                       add        r10, 2
03ded 4983fa29                       cmp        r10, 0x29
03df1 75ef                           jne        0x7f345c139662
03df3 41ba24000000                   mov        r10d, 0x24
03df9 eb11                           jmp        0x7f345c13968c
03dfb 50                             push       rax
03dfc 4833c0                         xor        rax, rax
03dff f04a0fb134d2                   lock cmpxchg qword ptr [rdx + r10*8], rsi
03e05 58                             pop        rax
03e06 ebbe                           jmp        0x7f345c139646
03e08 4983c201                       add        r10, 1
03e0c 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03e11 8b7024                         mov        esi, dword ptr [rax + 0x24]
03e14 4c3b25fd46b91f                 cmp        r12, qword ptr [rip + 0x1fb946fd]
03e1b 0f8414000000                   je         0x7f345c1396b5
03e21 48bf2812da79347f0000           movabs     rdi, 0x7f3479da1228
03e2b 4883e4f0                       and        rsp, 0xfffffffffffffff0
03e2f e8ac2ef61e                     call       0x7f347b09c560
03e34 f4                             hlt        
03e35 488bd0                         mov        rdx, rax
03e38 48b908a56d50347f0000           movabs     rcx, 0x7f34506da508
03e42 8b12                           mov        edx, dword ptr [rdx]
03e44 c1ea0d                         shr        edx, 0xd
03e47 48c1e20a                       shl        rdx, 0xa
03e4b 41ba00000033                   mov        r10d, 0x33000000
03e51 4903d2                         add        rdx, r10
03e54 41ba2b000000                   mov        r10d, 0x2b
03e5a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03e5e 7436                           je         0x7f345c139716
03e60 4983c202                       add        r10, 2
03e64 4983fa2f                       cmp        r10, 0x2f
03e68 75f0                           jne        0x7f345c1396da
03e6a 41ba2b000000                   mov        r10d, 0x2b
03e70 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03e75 7412                           je         0x7f345c139709
03e77 4983c202                       add        r10, 2
03e7b 4983fa2f                       cmp        r10, 0x2f
03e7f 75ef                           jne        0x7f345c1396f0
03e81 41ba2a000000                   mov        r10d, 0x2a
03e87 eb11                           jmp        0x7f345c13971a
03e89 50                             push       rax
03e8a 4833c0                         xor        rax, rax
03e8d f04a0fb114d1                   lock cmpxchg qword ptr [rcx + r10*8], rdx
03e93 58                             pop        rax
03e94 ebbe                           jmp        0x7f345c1396d4
03e96 4983c201                       add        r10, 1
03e9a 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03e9f 8b4804                         mov        ecx, dword ptr [rax + 4]
03ea2 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
03eac 4883828001000001               add        qword ptr [rdx + 0x180], 1
03eb4 48ba50906d50347f0000           movabs     rdx, 0x7f34506d9050
03ebe 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03ec2 4183c002                       add        r8d, 2
03ec6 44894278                       mov        dword ptr [rdx + 0x78], r8d
03eca 4181e0feff1f00                 and        r8d, 0x1ffffe
03ed1 4585c0                         test       r8d, r8d
03ed4 0f84cd190000                   je         0x7f345c13b127
03eda 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
03ee4 4883829001000001               add        qword ptr [rdx + 0x190], 1
03eec 8bbc247c030000                 mov        edi, dword ptr [rsp + 0x37c]
03ef3 4863df                         movsxd     rbx, edi
03ef6 ba08000000                     mov        edx, 8
03efb 4c8bcb                         mov        r9, rbx
03efe 4c03ca                         add        r9, rdx
03f01 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
03f0b 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03f0f 4183c002                       add        r8d, 2
03f13 44894278                       mov        dword ptr [rdx + 0x78], r8d
03f17 4181e0feff1f00                 and        r8d, 0x1ffffe
03f1e 4585c0                         test       r8d, r8d
03f21 0f84a1190000                   je         0x7f345c13b148
03f27 48bad8816d50347f0000           movabs     rdx, 0x7f34506d81d8
03f31 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03f39 48ba58836d50347f0000           movabs     rdx, 0x7f34506d8358
03f43 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03f47 4183c002                       add        r8d, 2
03f4b 44894278                       mov        dword ptr [rdx + 0x78], r8d
03f4f 4181e0feff1f00                 and        r8d, 0x1ffffe
03f56 4585c0                         test       r8d, r8d
03f59 0f848a190000                   je         0x7f345c13b169
03f5f 48ba08a56d50347f0000           movabs     rdx, 0x7f34506da508
03f69 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
03f71 48bad00970e200000000           movabs     rdx, 0xe27009d0
03f7b ba02000000                     mov        edx, 2
03f80 4c8b842480010000               mov        r8, qword ptr [rsp + 0x180]
03f88 bf00000000                     mov        edi, 0
03f8d 488b842480030000               mov        rax, qword ptr [rsp + 0x380]
03f95 48890424                       mov        qword ptr [rsp], rax
03f99 488b842480010000               mov        rax, qword ptr [rsp + 0x180]
03fa1 4889442408                     mov        qword ptr [rsp + 8], rax
03fa6 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
03fab 49bad00970e200000000           movabs     r10, 0xe27009d0
03fb5 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03fba 4889842480010000               mov        qword ptr [rsp + 0x180], rax
03fc2 90                             nop        
03fc3 90                             nop        
03fc4 90                             nop        
03fc5 90                             nop        
03fc6 90                             nop        
03fc7 e814645f07                     call       0x7f346372fc60
03fcc 0f1f8400c440001a               nop        dword ptr [rax + rax + 0x1a0040c4]
03fd4 8b94242c020000                 mov        edx, dword ptr [rsp + 0x22c]
03fdb 448bac2428020000               mov        r13d, dword ptr [rsp + 0x228]
03fe3 8bbc24a4010000                 mov        edi, dword ptr [rsp + 0x1a4]
03fea 4403ef                         add        r13d, edi
03fed 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
03ff7 ff8610060000                   inc        dword ptr [rsi + 0x610]
03ffd 8bb42470010000                 mov        esi, dword ptr [rsp + 0x170]
04004 448b8c2474010000               mov        r9d, dword ptr [rsp + 0x174]
0400c 8b9c246c010000                 mov        ebx, dword ptr [rsp + 0x16c]
04013 488b8c2478010000               mov        rcx, qword ptr [rsp + 0x178]
0401b 4c8b8424a8010000               mov        r8, qword ptr [rsp + 0x1a8]
04023 8b8424a0010000                 mov        eax, dword ptr [rsp + 0x1a0]
0402a 4c8bb424b0010000               mov        r14, qword ptr [rsp + 0x1b0]
04032 448b9c2488010000               mov        r11d, dword ptr [rsp + 0x188]
0403a 4489ac2468030000               mov        dword ptr [rsp + 0x368], r13d
04042 4c8bac2480010000               mov        r13, qword ptr [rsp + 0x180]
0404a 44899c2488030000               mov        dword ptr [rsp + 0x388], r11d
04052 4c8b9c2450010000               mov        r11, qword ptr [rsp + 0x150]
0405a 4c899c2448020000               mov        qword ptr [rsp + 0x248], r11
04062 448b9c2444010000               mov        r11d, dword ptr [rsp + 0x144]
0406a 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
04072 4c8b9c2458010000               mov        r11, qword ptr [rsp + 0x158]
0407a 4c899c2450020000               mov        qword ptr [rsp + 0x250], r11
04082 4c8b9c2460010000               mov        r11, qword ptr [rsp + 0x160]
0408a 4c899c2458020000               mov        qword ptr [rsp + 0x258], r11
04092 448b9c2468010000               mov        r11d, dword ptr [rsp + 0x168]
0409a 44899c2460020000               mov        dword ptr [rsp + 0x260], r11d
040a2 4c8b9c2490010000               mov        r11, qword ptr [rsp + 0x190]
040aa 488bbc2498010000               mov        rdi, qword ptr [rsp + 0x198]
040b2 4c89ac2440020000               mov        qword ptr [rsp + 0x240], r13
040ba 4889bc2490030000               mov        qword ptr [rsp + 0x390], rdi
040c2 448bac2488030000               mov        r13d, dword ptr [rsp + 0x388]
040ca 48bf48e76250347f0000           movabs     rdi, 0x7f345062e748
040d4 ff8708080000                   inc        dword ptr [rdi + 0x808]
040da 488bfe                         mov        rdi, rsi
040dd 488bf2                         mov        rsi, rdx
040e0 488bd0                         mov        rdx, rax
040e3 8b842468030000                 mov        eax, dword ptr [rsp + 0x368]
040ea 8984248c030000                 mov        dword ptr [rsp + 0x38c], eax
040f1 488b842440020000               mov        rax, qword ptr [rsp + 0x240]
040f9 48898424c8010000               mov        qword ptr [rsp + 0x1c8], rax
04101 488b842448020000               mov        rax, qword ptr [rsp + 0x248]
04109 48898424d0010000               mov        qword ptr [rsp + 0x1d0], rax
04111 8b84243c020000                 mov        eax, dword ptr [rsp + 0x23c]
04118 898424d8010000                 mov        dword ptr [rsp + 0x1d8], eax
0411f 488b842450020000               mov        rax, qword ptr [rsp + 0x250]
04127 48898424e0010000               mov        qword ptr [rsp + 0x1e0], rax
0412f 488b842458020000               mov        rax, qword ptr [rsp + 0x258]
04137 48898424e8010000               mov        qword ptr [rsp + 0x1e8], rax
0413f 8b842460020000                 mov        eax, dword ptr [rsp + 0x260]
04146 4c899c24f0010000               mov        qword ptr [rsp + 0x1f0], r11
0414e 4c8b9c2490030000               mov        r11, qword ptr [rsp + 0x390]
04156 898424dc010000                 mov        dword ptr [rsp + 0x1dc], eax
0415d 4c899c2498030000               mov        qword ptr [rsp + 0x398], r11
04165 ffc7                           inc        edi
04167 49bb48e76250347f0000           movabs     r11, 0x7f345062e748
04171 418b437c                       mov        eax, dword ptr [r11 + 0x7c]
04175 83c002                         add        eax, 2
04178 4189437c                       mov        dword ptr [r11 + 0x7c], eax
0417c 25fe3f0000                     and        eax, 0x3ffe
04181 85c0                           test       eax, eax
04183 0f8481170000                   je         0x7f345c13b18a
04189 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
0418d 418502                         test       dword ptr [r10], eax
04190 48b848e76250347f0000           movabs     rax, 0x7f345062e748
0419a ff8030080000                   inc        dword ptr [rax + 0x830]
041a0 488bc6                         mov        rax, rsi
041a3 448b9c248c030000               mov        r11d, dword ptr [rsp + 0x38c]
041ab 488bb424c8010000               mov        rsi, qword ptr [rsp + 0x1c8]
041b3 4889b42480010000               mov        qword ptr [rsp + 0x180], rsi
041bb 488bb424d0010000               mov        rsi, qword ptr [rsp + 0x1d0]
041c3 4889b42450010000               mov        qword ptr [rsp + 0x150], rsi
041cb 8bb424d8010000                 mov        esi, dword ptr [rsp + 0x1d8]
041d2 89b42444010000                 mov        dword ptr [rsp + 0x144], esi
041d9 488bb424e0010000               mov        rsi, qword ptr [rsp + 0x1e0]
041e1 4889b42458010000               mov        qword ptr [rsp + 0x158], rsi
041e9 488bb424e8010000               mov        rsi, qword ptr [rsp + 0x1e8]
041f1 4889b42460010000               mov        qword ptr [rsp + 0x160], rsi
041f9 8bb424dc010000                 mov        esi, dword ptr [rsp + 0x1dc]
04200 89b42468010000                 mov        dword ptr [rsp + 0x168], esi
04207 488bb424f0010000               mov        rsi, qword ptr [rsp + 0x1f0]
0420f 4889b42490010000               mov        qword ptr [rsp + 0x190], rsi
04217 488bb42498030000               mov        rsi, qword ptr [rsp + 0x398]
0421f 44898c2474010000               mov        dword ptr [rsp + 0x174], r9d
04227 899c246c010000                 mov        dword ptr [rsp + 0x16c], ebx
0422e 48898c2478010000               mov        qword ptr [rsp + 0x178], rcx
04236 4c898424a8010000               mov        qword ptr [rsp + 0x1a8], r8
0423e 899424a0010000                 mov        dword ptr [rsp + 0x1a0], edx
04245 4c89b424b0010000               mov        qword ptr [rsp + 0x1b0], r14
0424d 4489ac2488010000               mov        dword ptr [rsp + 0x188], r13d
04255 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
0425d 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
04265 8b9c2444010000                 mov        ebx, dword ptr [rsp + 0x144]
0426c 448b842468010000               mov        r8d, dword ptr [rsp + 0x168]
04274 4889b42498010000               mov        qword ptr [rsp + 0x198], rsi
0427c 488bd7                         mov        rdx, rdi
0427f 488bf0                         mov        rsi, rax
04282 488b842458010000               mov        rax, qword ptr [rsp + 0x158]
0428a 488bbc2460010000               mov        rdi, qword ptr [rsp + 0x160]
04292 e9d9c0ffff                     jmp        0x7f345c135bf0
04297 488bd6                         mov        rdx, rsi
0429a 488bb42498010000               mov        rsi, qword ptr [rsp + 0x198]
042a2 4585db                         test       r11d, r11d
042a5 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
042af 41b888030000                   mov        r8d, 0x388
042b5 7e06                           jle        0x7f345c139b3d
042b7 41b898030000                   mov        r8d, 0x398
042bd 4e8b0c01                       mov        r9, qword ptr [rcx + r8]
042c1 4d8d4901                       lea        r9, [r9 + 1]
042c5 4e890c01                       mov        qword ptr [rcx + r8], r9
042c9 0f8e4c010000                   jle        0x7f345c139c9b
042cf 488bbc24c0010000               mov        rdi, qword ptr [rsp + 0x1c0]
042d7 482bd7                         sub        rdx, rdi
042da b900000000                     mov        ecx, 0
042df 483bd1                         cmp        rdx, rcx
042e2 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
042ec b9a8030000                     mov        ecx, 0x3a8
042f1 7d05                           jge        0x7f345c139b78
042f3 b9b8030000                     mov        ecx, 0x3b8
042f8 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
042fc 4d8d4001                       lea        r8, [r8 + 1]
04300 4c89040a                       mov        qword ptr [rdx + rcx], r8
04304 0f8d11010000                   jge        0x7f345c139c9b
0430a 488b5630                       mov        rdx, qword ptr [rsi + 0x30]
0430e be00000000                     mov        esi, 0
04313 483bd6                         cmp        rdx, rsi
04316 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
04320 bac8030000                     mov        edx, 0x3c8
04325 7505                           jne        0x7f345c139bac
04327 bad8030000                     mov        edx, 0x3d8
0432c 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04330 488d4901                       lea        rcx, [rcx + 1]
04334 48890c16                       mov        qword ptr [rsi + rdx], rcx
04338 0f85dd000000                   jne        0x7f345c139c9b
0433e e9e2000000                     jmp        0x7f345c139ca5
04343 488bc6                         mov        rax, rsi
04346 448b9c248c010000               mov        r11d, dword ptr [rsp + 0x18c]
0434e 488b8c2480010000               mov        rcx, qword ptr [rsp + 0x180]
04356 498bd8                         mov        rbx, r8
04359 488b942490010000               mov        rdx, qword ptr [rsp + 0x190]
04361 2bd8                           sub        ebx, eax
04363 48be48e76250347f0000           movabs     rsi, 0x7f345062e748
0436d 4883864808000001               add        qword ptr [rsi + 0x848], 1
04375 488bf2                         mov        rsi, rdx
04378 488bd0                         mov        rdx, rax
0437b 4d8bc3                         mov        r8, r11
0437e 4c8bcb                         mov        r9, rbx
04381 44899c248c010000               mov        dword ptr [rsp + 0x18c], r11d
04389 899c24a0030000                 mov        dword ptr [rsp + 0x3a0], ebx
04390 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
04395 4c89442408                     mov        qword ptr [rsp + 8], r8
0439a 48890c24                       mov        qword ptr [rsp], rcx
0439e 4889542418                     mov        qword ptr [rsp + 0x18], rdx
043a3 4889742420                     mov        qword ptr [rsp + 0x20], rsi
043a8 488bfe                         mov        rdi, rsi
043ab 488bf2                         mov        rsi, rdx
043ae 488bd1                         mov        rdx, rcx
043b1 498bc8                         mov        rcx, r8
043b4 4d8bc1                         mov        r8, r9
043b7 e844425e07                     call       0x7f346371de80
043bc 85c0                           test       eax, eax
043be 0f842b000000                   je         0x7f345c139c6f
043c4 488bf8                         mov        rdi, rax
043c7 83f7ff                         xor        edi, 0xffffffff
043ca 488b0c24                       mov        rcx, qword ptr [rsp]
043ce 4c8b442408                     mov        r8, qword ptr [rsp + 8]
043d3 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
043d8 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
043dd 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
043e2 442bcf                         sub        r9d, edi
043e5 03d7                           add        edx, edi
043e7 4403c7                         add        r8d, edi
043ea e955150000                     jmp        0x7f345c13b1c4
043ef 8b9c24a0030000                 mov        ebx, dword ptr [rsp + 0x3a0]
043f6 039c248c010000                 add        ebx, dword ptr [rsp + 0x18c]
043fd 488b942498010000               mov        rdx, qword ptr [rsp + 0x198]
04405 895a38                         mov        dword ptr [rdx + 0x38], ebx
04408 4881c4d0030000                 add        rsp, 0x3d0
0440f 5d                             pop        rbp
04410 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04414 0f8750150000                   ja         0x7f345c13b1ea
0441a c3                             ret        
0441b bb02000000                     mov        ebx, 2
04420 e915000000                     jmp        0x7f345c139cba
04425 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
0442f ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
04435 bb08000000                     mov        ebx, 8
0443a 899c24a4030000                 mov        dword ptr [rsp + 0x3a4], ebx
04441 90                             nop        
04442 90                             nop        
04443 90                             nop        
04444 90                             nop        
04445 90                             nop        
04446 90                             nop        
04447 90                             nop        
04448 e942150000                     jmp        0x7f345c13b20f
0444d 90                             nop        
0444e 90                             nop        
0444f 90                             nop        
04450 90                             nop        
04451 90                             nop        
04452 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04459 0f8553150000                   jne        0x7f345c13b232
0445f 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
04466 488d7820                       lea        rdi, [rax + 0x20]
0446a 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04471 0f873b150000                   ja         0x7f345c13b232
04477 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
0447e 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04485 488908                         mov        qword ptr [rax], rcx
04488 4833c9                         xor        rcx, rcx
0448b 48894808                       mov        qword ptr [rax + 8], rcx
0448f 48894810                       mov        qword ptr [rax + 0x10], rcx
04493 48894818                       mov        qword ptr [rax + 0x18], rcx
04497 90                             nop        
04498 e931150000                     jmp        0x7f345c13b24e
0449d 90                             nop        
0449e 90                             nop        
0449f 90                             nop        
044a0 90                             nop        
044a1 90                             nop        
044a2 498bf3                         mov        rsi, r11
044a5 48898424a8030000               mov        qword ptr [rsp + 0x3a8], rax
044ad 90                             nop        
044ae 90                             nop        
044af e82c5f5f07                     call       0x7f346372fc60
044b4 0f1f8400ac45001c               nop        dword ptr [rax + rax + 0x1c0045ac]
044bc 48ba48e76250347f0000           movabs     rdx, 0x7f345062e748
044c6 488d9210040000                 lea        rdx, [rdx + 0x410]
044cd 4885c0                         test       rax, rax
044d0 750e                           jne        0x7f345c139d60
044d2 f60201                         test       byte ptr [rdx], 1
044d5 0f8505000000                   jne        0x7f345c139d60
044db f048830a01                     lock or    qword ptr [rdx], 1
044e0 488b9424a8030000               mov        rdx, qword ptr [rsp + 0x3a8]
044e8 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
044f2 4883812004000001               add        qword ptr [rcx + 0x420], 1
044fa 8b9424a4030000                 mov        edx, dword ptr [rsp + 0x3a4]
04501 488bc8                         mov        rcx, rax
04504 488bb424a8030000               mov        rsi, qword ptr [rsp + 0x3a8]
0450c 90                             nop        
0450d 90                             nop        
0450e 90                             nop        
0450f e8cc545f07                     call       0x7f346372f260
04514 0f1f84000c46001d               nop        dword ptr [rax + rax + 0x1d00460c]
0451c 488b8424a8030000               mov        rax, qword ptr [rsp + 0x3a8]
04524 e94a150000                     jmp        0x7f345c13b2f3
04529 90                             nop        
0452a 90                             nop        
0452b 90                             nop        
0452c 90                             nop        
0452d 90                             nop        
0452e 90                             nop        
0452f 90                             nop        
04530 e9b2140000                     jmp        0x7f345c13b267
04535 90                             nop        
04536 90                             nop        
04537 90                             nop        
04538 90                             nop        
04539 90                             nop        
0453a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04541 0f85c3140000                   jne        0x7f345c13b28a
04547 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0454e 488d7820                       lea        rdi, [rax + 0x20]
04552 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04559 0f87ab140000                   ja         0x7f345c13b28a
0455f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04566 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0456d 488908                         mov        qword ptr [rax], rcx
04570 4833c9                         xor        rcx, rcx
04573 48894808                       mov        qword ptr [rax + 8], rcx
04577 48894810                       mov        qword ptr [rax + 0x10], rcx
0457b 48894818                       mov        qword ptr [rax + 0x18], rcx
0457f 488bd0                         mov        rdx, rax
04582 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
0458c 4883815802000001               add        qword ptr [rcx + 0x258], 1
04594 ba02000000                     mov        edx, 2
04599 48b9a86126e200000000           movabs     rcx, 0xe22661a8
045a3 488bf0                         mov        rsi, rax
045a6 48898424b0030000               mov        qword ptr [rsp + 0x3b0], rax
045ae 90                             nop        
045af e82c545f07                     call       0x7f346372f260
045b4 0f1f8400ac46001e               nop        dword ptr [rax + rax + 0x1e0046ac]
045bc 488b8424b0030000               mov        rax, qword ptr [rsp + 0x3b0]
045c4 e9aa140000                     jmp        0x7f345c13b2f3
045c9 90                             nop        
045ca 90                             nop        
045cb 90                             nop        
045cc 90                             nop        
045cd 90                             nop        
045ce 90                             nop        
045cf 90                             nop        
045d0 e951140000                     jmp        0x7f345c13b2a6
045d5 90                             nop        
045d6 90                             nop        
045d7 90                             nop        
045d8 90                             nop        
045d9 90                             nop        
045da 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
045e1 0f8562140000                   jne        0x7f345c13b2c9
045e7 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
045ee 488d7820                       lea        rdi, [rax + 0x20]
045f2 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
045f9 0f874a140000                   ja         0x7f345c13b2c9
045ff 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04606 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0460d 488908                         mov        qword ptr [rax], rcx
04610 4833c9                         xor        rcx, rcx
04613 48894808                       mov        qword ptr [rax + 8], rcx
04617 48894810                       mov        qword ptr [rax + 0x10], rcx
0461b 48894818                       mov        qword ptr [rax + 0x18], rcx
0461f 488bd0                         mov        rdx, rax
04622 48b948e76250347f0000           movabs     rcx, 0x7f345062e748
0462c 4883814001000001               add        qword ptr [rcx + 0x140], 1
04634 ba05000000                     mov        edx, 5
04639 48b9d86126e200000000           movabs     rcx, 0xe22661d8
04643 488bf0                         mov        rsi, rax
04646 48898424b8030000               mov        qword ptr [rsp + 0x3b8], rax
0464e 90                             nop        
0464f e88c535f07                     call       0x7f346372f260
04654 0f1f84004c47001f               nop        dword ptr [rax + rax + 0x1f00474c]
0465c 488b8424b8030000               mov        rax, qword ptr [rsp + 0x3b8]
04664 e90a140000                     jmp        0x7f345c13b2f3
04669 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
04670 55                             push       rbp
04671 4881ecd0030000                 sub        rsp, 0x3d0
04678 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
04680 7405                           je         0x7f345c139f07
04682 e8d9525e07                     call       0x7f346371f1e0
04687 bf40010000                     mov        edi, 0x140
0468c 4863ff                         movsxd     rdi, edi
0468f 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
04693 48899c24a8020000               mov        qword ptr [rsp + 0x2a8], rbx
0469b bf38010000                     mov        edi, 0x138
046a0 4863ff                         movsxd     rdi, edi
046a3 488b043e                       mov        rax, qword ptr [rsi + rdi]
046a7 48898424b0020000               mov        qword ptr [rsp + 0x2b0], rax
046af bf30010000                     mov        edi, 0x130
046b4 4863ff                         movsxd     rdi, edi
046b7 8b143e                         mov        edx, dword ptr [rsi + rdi]
046ba bf28010000                     mov        edi, 0x128
046bf 4863ff                         movsxd     rdi, edi
046c2 488b0c3e                       mov        rcx, qword ptr [rsi + rdi]
046c6 bf20010000                     mov        edi, 0x120
046cb 4863ff                         movsxd     rdi, edi
046ce 4c8b043e                       mov        r8, qword ptr [rsi + rdi]
046d2 bf18010000                     mov        edi, 0x118
046d7 4863ff                         movsxd     rdi, edi
046da 448b0c3e                       mov        r9d, dword ptr [rsi + rdi]
046de bf08010000                     mov        edi, 0x108
046e3 4863ff                         movsxd     rdi, edi
046e6 4c8b1c3e                       mov        r11, qword ptr [rsi + rdi]
046ea bf00010000                     mov        edi, 0x100
046ef 4863ff                         movsxd     rdi, edi
046f2 4c8b2c3e                       mov        r13, qword ptr [rsi + rdi]
046f6 bff0000000                     mov        edi, 0xf0
046fb 4863ff                         movsxd     rdi, edi
046fe 448b343e                       mov        r14d, dword ptr [rsi + rdi]
04702 bfe8000000                     mov        edi, 0xe8
04707 4863ff                         movsxd     rdi, edi
0470a 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
0470d bbd8000000                     mov        ebx, 0xd8
04712 4863db                         movsxd     rbx, ebx
04715 488b041e                       mov        rax, qword ptr [rsi + rbx]
04719 48898424b8020000               mov        qword ptr [rsp + 0x2b8], rax
04721 bba0000000                     mov        ebx, 0xa0
04726 4863db                         movsxd     rbx, ebx
04729 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0472c 899c249c020000                 mov        dword ptr [rsp + 0x29c], ebx
04733 bb90000000                     mov        ebx, 0x90
04738 4863db                         movsxd     rbx, ebx
0473b 488b041e                       mov        rax, qword ptr [rsi + rbx]
0473f 48898424c0020000               mov        qword ptr [rsp + 0x2c0], rax
04747 bb80000000                     mov        ebx, 0x80
0474c 4863db                         movsxd     rbx, ebx
0474f 488b041e                       mov        rax, qword ptr [rsi + rbx]
04753 bb78000000                     mov        ebx, 0x78
04758 4863db                         movsxd     rbx, ebx
0475b 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0475e 899c24c8020000                 mov        dword ptr [rsp + 0x2c8], ebx
04765 bb70000000                     mov        ebx, 0x70
0476a 4863db                         movsxd     rbx, ebx
0476d 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04770 899c24cc020000                 mov        dword ptr [rsp + 0x2cc], ebx
04777 bb68000000                     mov        ebx, 0x68
0477c 4863db                         movsxd     rbx, ebx
0477f 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04782 899c24d0020000                 mov        dword ptr [rsp + 0x2d0], ebx
04789 bb10000000                     mov        ebx, 0x10
0478e 4863db                         movsxd     rbx, ebx
04791 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04794 899c24d4020000                 mov        dword ptr [rsp + 0x2d4], ebx
0479b bb08000000                     mov        ebx, 8
047a0 4863db                         movsxd     rbx, ebx
047a3 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
047a6 899c24d8020000                 mov        dword ptr [rsp + 0x2d8], ebx
047ad bb00000000                     mov        ebx, 0
047b2 4863db                         movsxd     rbx, ebx
047b5 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
047b8 89bc24dc020000                 mov        dword ptr [rsp + 0x2dc], edi
047bf 488bfe                         mov        rdi, rsi
047c2 89942404030000                 mov        dword ptr [rsp + 0x304], edx
047c9 48898c2410030000               mov        qword ptr [rsp + 0x310], rcx
047d1 4c89842408030000               mov        qword ptr [rsp + 0x308], r8
047d9 44898c2400030000               mov        dword ptr [rsp + 0x300], r9d
047e1 4c899c24f8020000               mov        qword ptr [rsp + 0x2f8], r11
047e9 4c89ac24f0020000               mov        qword ptr [rsp + 0x2f0], r13
047f1 4489b424e4020000               mov        dword ptr [rsp + 0x2e4], r14d
047f9 48898424e8020000               mov        qword ptr [rsp + 0x2e8], rax
04801 899c24e0020000                 mov        dword ptr [rsp + 0x2e0], ebx
04808 e82323351f                     call       0x7f347b48c3b0
0480d 0f1f840000000000               nop        dword ptr [rax + rax]
04815 8b9c24e0020000                 mov        ebx, dword ptr [rsp + 0x2e0]
0481c 8bb424d8020000                 mov        esi, dword ptr [rsp + 0x2d8]
04823 488bc6                         mov        rax, rsi
04826 8bb424d4020000                 mov        esi, dword ptr [rsp + 0x2d4]
0482d 4c8bee                         mov        r13, rsi
04830 8bb424d0020000                 mov        esi, dword ptr [rsp + 0x2d0]
04837 8b9424cc020000                 mov        edx, dword ptr [rsp + 0x2cc]
0483e 4c8bca                         mov        r9, rdx
04841 8b9424c8020000                 mov        edx, dword ptr [rsp + 0x2c8]
04848 4c8bda                         mov        r11, rdx
0484b 488b9424e8020000               mov        rdx, qword ptr [rsp + 0x2e8]
04853 488bca                         mov        rcx, rdx
04856 488b9424c0020000               mov        rdx, qword ptr [rsp + 0x2c0]
0485e 4c8bc2                         mov        r8, rdx
04861 8b94249c020000                 mov        edx, dword ptr [rsp + 0x29c]
04868 488bfa                         mov        rdi, rdx
0486b 488b9424b8020000               mov        rdx, qword ptr [rsp + 0x2b8]
04873 4c8bf2                         mov        r14, rdx
04876 8b9424dc020000                 mov        edx, dword ptr [rsp + 0x2dc]
0487d 89942464020000                 mov        dword ptr [rsp + 0x264], edx
04884 8b9424e4020000                 mov        edx, dword ptr [rsp + 0x2e4]
0488b 89942470020000                 mov        dword ptr [rsp + 0x270], edx
04892 488b9424f0020000               mov        rdx, qword ptr [rsp + 0x2f0]
0489a 4889942478020000               mov        qword ptr [rsp + 0x278], rdx
048a2 488b9424f8020000               mov        rdx, qword ptr [rsp + 0x2f8]
048aa 4889942480020000               mov        qword ptr [rsp + 0x280], rdx
048b2 8b942400030000                 mov        edx, dword ptr [rsp + 0x300]
048b9 89942474020000                 mov        dword ptr [rsp + 0x274], edx
048c0 488b942408030000               mov        rdx, qword ptr [rsp + 0x308]
048c8 4889942488020000               mov        qword ptr [rsp + 0x288], rdx
048d0 488b942410030000               mov        rdx, qword ptr [rsp + 0x310]
048d8 4889942490020000               mov        qword ptr [rsp + 0x290], rdx
048e0 8b942404030000                 mov        edx, dword ptr [rsp + 0x304]
048e7 89942498020000                 mov        dword ptr [rsp + 0x298], edx
048ee 488b9424b0020000               mov        rdx, qword ptr [rsp + 0x2b0]
048f6 48899424a0020000               mov        qword ptr [rsp + 0x2a0], rdx
048fe 488b9424a8020000               mov        rdx, qword ptr [rsp + 0x2a8]
04906 89842428030000                 mov        dword ptr [rsp + 0x328], eax
0490d 4489ac2440030000               mov        dword ptr [rsp + 0x340], r13d
04915 89b42420030000                 mov        dword ptr [rsp + 0x320], esi
0491c 44898c2444030000               mov        dword ptr [rsp + 0x344], r9d
04924 44899c2450030000               mov        dword ptr [rsp + 0x350], r11d
0492c 48898c2458030000               mov        qword ptr [rsp + 0x358], rcx
04934 4c89842448030000               mov        qword ptr [rsp + 0x348], r8
0493c 89bc2424030000                 mov        dword ptr [rsp + 0x324], edi
04943 4c89b42438030000               mov        qword ptr [rsp + 0x338], r14
0494b 4889942418030000               mov        qword ptr [rsp + 0x318], rdx
04953 e930dcffff                     jmp        0x7f345c137e08
04958 49ba30046250347f0000           movabs     r10, 0x7f3450620430
04962 4c89542408                     mov        qword ptr [rsp + 8], r10
04967 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0496f e8ec545207                     call       0x7f346365f6e0
04974 e904b7ffff                     jmp        0x7f345c1358fd
04979 49baa8ee1a50347f0000           movabs     r10, 0x7f34501aeea8
04983 4c89542408                     mov        qword ptr [rsp + 8], r10
04988 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04990 e8cb545207                     call       0x7f346365f6e0
04995 e971b8ffff                     jmp        0x7f345c135a8b
0499a e841c85207                     call       0x7f3463666a60
0499f 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
049a9 4883e4f0                       and        rsp, 0xfffffffffffffff0
049ad e82e23f61e                     call       0x7f347b09c560
049b2 f4                             hlt        
049b3 e828c85207                     call       0x7f3463666a60
049b8 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
049c2 4883e4f0                       and        rsp, 0xfffffffffffffff0
049c6 e81523f61e                     call       0x7f347b09c560
049cb f4                             hlt        
049cc e80fc85207                     call       0x7f3463666a60
049d1 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
049db 4883e4f0                       and        rsp, 0xfffffffffffffff0
049df e8fc22f61e                     call       0x7f347b09c560
049e4 f4                             hlt        
049e5 48891424                       mov        qword ptr [rsp], rdx
049e9 48897c2408                     mov        qword ptr [rsp + 8], rdi
049ee e8edd05207                     call       0x7f3463667360
049f3 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
049fd 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a01 e8da22f61e                     call       0x7f347b09c560
04a06 f4                             hlt        
04a07 e8d4c75207                     call       0x7f3463666a60
04a0c 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04a16 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a1a e8c122f61e                     call       0x7f347b09c560
04a1f f4                             hlt        
04a20 e8bbc75207                     call       0x7f3463666a60
04a25 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04a2f 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a33 e8a822f61e                     call       0x7f347b09c560
04a38 f4                             hlt        
04a39 48891424                       mov        qword ptr [rsp], rdx
04a3d 4889442408                     mov        qword ptr [rsp + 8], rax
04a42 e899d05207                     call       0x7f3463667360
04a47 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04a51 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a55 e88622f61e                     call       0x7f347b09c560
04a5a f4                             hlt        
04a5b e880c75207                     call       0x7f3463666a60
04a60 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04a6a 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a6e e86d22f61e                     call       0x7f347b09c560
04a73 f4                             hlt        
04a74 e867c75207                     call       0x7f3463666a60
04a79 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04a83 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a87 e85422f61e                     call       0x7f347b09c560
04a8c f4                             hlt        
04a8d 48c7042401000000               mov        qword ptr [rsp], 1
04a95 4c894c2408                     mov        qword ptr [rsp + 8], r9
04a9a e841d05207                     call       0x7f3463667360
04a9f 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04aa9 4883e4f0                       and        rsp, 0xfffffffffffffff0
04aad e82e22f61e                     call       0x7f347b09c560
04ab2 f4                             hlt        
04ab3 48c7042402000000               mov        qword ptr [rsp], 2
04abb 4c894c2408                     mov        qword ptr [rsp + 8], r9
04ac0 e81bd05207                     call       0x7f3463667360
04ac5 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04acf 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ad3 e80822f61e                     call       0x7f347b09c560
04ad8 f4                             hlt        
04ad9 48c7042400000000               mov        qword ptr [rsp], 0
04ae1 4c894c2408                     mov        qword ptr [rsp + 8], r9
04ae6 e8f5cf5207                     call       0x7f3463667360
04aeb 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04af5 4883e4f0                       and        rsp, 0xfffffffffffffff0
04af9 e8e221f61e                     call       0x7f347b09c560
04afe f4                             hlt        
04aff 48c7042401000000               mov        qword ptr [rsp], 1
04b07 4c894c2408                     mov        qword ptr [rsp + 8], r9
04b0c e8cfcf5207                     call       0x7f3463667360
04b11 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04b1b 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b1f e8bc21f61e                     call       0x7f347b09c560
04b24 f4                             hlt        
04b25 48c7042400000000               mov        qword ptr [rsp], 0
04b2d 4c894c2408                     mov        qword ptr [rsp + 8], r9
04b32 e8a9cf5207                     call       0x7f3463667360
04b37 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04b41 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b45 e89621f61e                     call       0x7f347b09c560
04b4a f4                             hlt        
04b4b 49ba08967450347f0000           movabs     r10, 0x7f3450749608
04b55 4c89542408                     mov        qword ptr [rsp + 8], r10
04b5a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b62 e8f9525207                     call       0x7f346365f6e0
04b67 e922beffff                     jmp        0x7f345c13620e
04b6c e86fc65207                     call       0x7f3463666a60
04b71 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04b7b 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b7f e85c21f61e                     call       0x7f347b09c560
04b84 f4                             hlt        
04b85 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
04b8f 4c89542408                     mov        qword ptr [rsp + 8], r10
04b94 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b9c e8bf525207                     call       0x7f346365f6e0
04ba1 e994beffff                     jmp        0x7f345c1362ba
04ba6 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
04bb0 4c89542408                     mov        qword ptr [rsp + 8], r10
04bb5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04bbd e89e525207                     call       0x7f346365f6e0
04bc2 e9b4beffff                     jmp        0x7f345c1362fb
04bc7 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bcf e88c7d5207                     call       0x7f34636621e0
04bd4 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04bde 4883e4f0                       and        rsp, 0xfffffffffffffff0
04be2 e8f920f61e                     call       0x7f347b09c560
04be7 f4                             hlt        
04be8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bf0 e86b7d5207                     call       0x7f34636621e0
04bf5 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04bff 4883e4f0                       and        rsp, 0xfffffffffffffff0
04c03 e8d820f61e                     call       0x7f347b09c560
04c08 f4                             hlt        
04c09 49ba50577d50347f0000           movabs     r10, 0x7f34507d5750
04c13 4c89542408                     mov        qword ptr [rsp + 8], r10
04c18 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c20 e83b525207                     call       0x7f346365f6e0
04c25 e92abfffff                     jmp        0x7f345c1363d4
04c2a 49ba78c97d50347f0000           movabs     r10, 0x7f34507dc978
04c34 4c89542408                     mov        qword ptr [rsp + 8], r10
04c39 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c41 e81a525207                     call       0x7f346365f6e0
04c46 e941bfffff                     jmp        0x7f345c13640c
04c4b 49ba088d6850347f0000           movabs     r10, 0x7f3450688d08
04c55 4c89542408                     mov        qword ptr [rsp + 8], r10
04c5a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c62 e8f9515207                     call       0x7f346365f6e0
04c67 e98ebfffff                     jmp        0x7f345c13647a
04c6c 49bac8b17450347f0000           movabs     r10, 0x7f345074b1c8
04c76 4c89542408                     mov        qword ptr [rsp + 8], r10
04c7b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c83 e8d8515207                     call       0x7f346365f6e0
04c88 e9a2bfffff                     jmp        0x7f345c1364af
04c8d 49ba584c6850347f0000           movabs     r10, 0x7f3450684c58
04c97 4c89542408                     mov        qword ptr [rsp + 8], r10
04c9c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ca4 e8b7515207                     call       0x7f346365f6e0
04ca9 e9b6bfffff                     jmp        0x7f345c1364e4
04cae 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
04cb8 4c89542408                     mov        qword ptr [rsp + 8], r10
04cbd 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cc5 e896515207                     call       0x7f346365f6e0
04cca e9adc0ffff                     jmp        0x7f345c1365fc
04ccf 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
04cd9 4c89542408                     mov        qword ptr [rsp + 8], r10
04cde 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ce6 e875515207                     call       0x7f346365f6e0
04ceb e9cfc0ffff                     jmp        0x7f345c13663f
04cf0 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
04cfa 4c89542408                     mov        qword ptr [rsp + 8], r10
04cff 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d07 e854515207                     call       0x7f346365f6e0
04d0c e9e2c0ffff                     jmp        0x7f345c136673
04d11 48890424                       mov        qword ptr [rsp], rax
04d15 e846975207                     call       0x7f3463663ce0
04d1a 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04d24 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d28 e8b31ff61e                     call       0x7f347b09c560
04d2d f4                             hlt        
04d2e e8adc45207                     call       0x7f3463666a60
04d33 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04d3d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d41 e89a1ff61e                     call       0x7f347b09c560
04d46 f4                             hlt        
04d47 49ba88a47450347f0000           movabs     r10, 0x7f345074a488
04d51 4c89542408                     mov        qword ptr [rsp + 8], r10
04d56 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d5e e8fd505207                     call       0x7f346365f6e0
04d63 e946c2ffff                     jmp        0x7f345c13682e
04d68 e873c45207                     call       0x7f3463666a60
04d6d 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04d77 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d7b e8601ff61e                     call       0x7f347b09c560
04d80 f4                             hlt        
04d81 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
04d8b 4c89542408                     mov        qword ptr [rsp + 8], r10
04d90 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d98 e8c3505207                     call       0x7f346365f6e0
04d9d e9d0c2ffff                     jmp        0x7f345c1368f2
04da2 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
04dac 4c89542408                     mov        qword ptr [rsp + 8], r10
04db1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04db9 e8a2505207                     call       0x7f346365f6e0
04dbe e9edc2ffff                     jmp        0x7f345c136930
04dc3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dcb e8907b5207                     call       0x7f34636621e0
04dd0 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04dda 4883e4f0                       and        rsp, 0xfffffffffffffff0
04dde e8fd1ef61e                     call       0x7f347b09c560
04de3 f4                             hlt        
04de4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04dec e86f7b5207                     call       0x7f34636621e0
04df1 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04dfb 4883e4f0                       and        rsp, 0xfffffffffffffff0
04dff e8dc1ef61e                     call       0x7f347b09c560
04e04 f4                             hlt        
04e05 e8d6c35207                     call       0x7f3463666a60
04e0a 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04e14 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e18 e8c31ef61e                     call       0x7f347b09c560
04e1d f4                             hlt        
04e1e 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
04e28 4c89542408                     mov        qword ptr [rsp + 8], r10
04e2d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e35 e826505207                     call       0x7f346365f6e0
04e3a e983c4ffff                     jmp        0x7f345c136b42
04e3f 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
04e49 4c89542408                     mov        qword ptr [rsp + 8], r10
04e4e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e56 e805505207                     call       0x7f346365f6e0
04e5b e9afc4ffff                     jmp        0x7f345c136b8f
04e60 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
04e6a 4c89542408                     mov        qword ptr [rsp + 8], r10
04e6f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e77 e8e44f5207                     call       0x7f346365f6e0
04e7c e9c6c4ffff                     jmp        0x7f345c136bc7
04e81 49ba08967450347f0000           movabs     r10, 0x7f3450749608
04e8b 4c89542408                     mov        qword ptr [rsp + 8], r10
04e90 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e98 e8c34f5207                     call       0x7f346365f6e0
04e9d e9c6c5ffff                     jmp        0x7f345c136ce8
04ea2 e839c35207                     call       0x7f3463666a60
04ea7 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04eb1 4883e4f0                       and        rsp, 0xfffffffffffffff0
04eb5 e8261ef61e                     call       0x7f347b09c560
04eba f4                             hlt        
04ebb 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
04ec5 4c89542408                     mov        qword ptr [rsp + 8], r10
04eca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ed2 e8894f5207                     call       0x7f346365f6e0
04ed7 e938c6ffff                     jmp        0x7f345c136d94
04edc 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
04ee6 4c89542408                     mov        qword ptr [rsp + 8], r10
04eeb 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ef3 e8684f5207                     call       0x7f346365f6e0
04ef8 e950c6ffff                     jmp        0x7f345c136dcd
04efd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f05 e8567a5207                     call       0x7f34636621e0
04f0a 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04f14 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f18 e8c31df61e                     call       0x7f347b09c560
04f1d f4                             hlt        
04f1e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04f26 e8357a5207                     call       0x7f34636621e0
04f2b 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
04f35 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f39 e8a21df61e                     call       0x7f347b09c560
04f3e f4                             hlt        
04f3f 49ba50577d50347f0000           movabs     r10, 0x7f34507d5750
04f49 4c89542408                     mov        qword ptr [rsp + 8], r10
04f4e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f56 e8054f5207                     call       0x7f346365f6e0
04f5b e9b9c6ffff                     jmp        0x7f345c136e99
04f60 49ba78c97d50347f0000           movabs     r10, 0x7f34507dc978
04f6a 4c89542408                     mov        qword ptr [rsp + 8], r10
04f6f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f77 e8e44e5207                     call       0x7f346365f6e0
04f7c e9cdc6ffff                     jmp        0x7f345c136ece
04f81 49ba088d6850347f0000           movabs     r10, 0x7f3450688d08
04f8b 4c89542408                     mov        qword ptr [rsp + 8], r10
04f90 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f98 e8c34e5207                     call       0x7f346365f6e0
04f9d e904c7ffff                     jmp        0x7f345c136f26
04fa2 49bac8b17450347f0000           movabs     r10, 0x7f345074b1c8
04fac 4c89542408                     mov        qword ptr [rsp + 8], r10
04fb1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fb9 e8a24e5207                     call       0x7f346365f6e0
04fbe e919c7ffff                     jmp        0x7f345c136f5c
04fc3 49ba584c6850347f0000           movabs     r10, 0x7f3450684c58
04fcd 4c89542408                     mov        qword ptr [rsp + 8], r10
04fd2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fda e8814e5207                     call       0x7f346365f6e0
04fdf e92dc7ffff                     jmp        0x7f345c136f91
04fe4 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
04fee 4c89542408                     mov        qword ptr [rsp + 8], r10
04ff3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ffb e8604e5207                     call       0x7f346365f6e0
05000 e91ec8ffff                     jmp        0x7f345c1370a3
05005 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
0500f 4c89542408                     mov        qword ptr [rsp + 8], r10
05014 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0501c e83f4e5207                     call       0x7f346365f6e0
05021 e941c8ffff                     jmp        0x7f345c1370e7
05026 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
05030 4c89542408                     mov        qword ptr [rsp + 8], r10
05035 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0503d e81e4e5207                     call       0x7f346365f6e0
05042 e955c8ffff                     jmp        0x7f345c13711c
05047 48890424                       mov        qword ptr [rsp], rax
0504b e810945207                     call       0x7f3463663ce0
05050 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
0505a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0505e e87d1cf61e                     call       0x7f347b09c560
05063 f4                             hlt        
05064 e877c15207                     call       0x7f3463666a60
05069 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05073 4883e4f0                       and        rsp, 0xfffffffffffffff0
05077 e8641cf61e                     call       0x7f347b09c560
0507c f4                             hlt        
0507d 49ba88a47450347f0000           movabs     r10, 0x7f345074a488
05087 4c89542408                     mov        qword ptr [rsp + 8], r10
0508c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05094 e8c74d5207                     call       0x7f346365f6e0
05099 e9c0c9ffff                     jmp        0x7f345c1372de
0509e e83dc15207                     call       0x7f3463666a60
050a3 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
050ad 4883e4f0                       and        rsp, 0xfffffffffffffff0
050b1 e82a1cf61e                     call       0x7f347b09c560
050b6 f4                             hlt        
050b7 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
050c1 4c89542408                     mov        qword ptr [rsp + 8], r10
050c6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ce e88d4d5207                     call       0x7f346365f6e0
050d3 e94acaffff                     jmp        0x7f345c1373a2
050d8 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
050e2 4c89542408                     mov        qword ptr [rsp + 8], r10
050e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ef e86c4d5207                     call       0x7f346365f6e0
050f4 e967caffff                     jmp        0x7f345c1373e0
050f9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05101 e85a785207                     call       0x7f34636621e0
05106 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05110 4883e4f0                       and        rsp, 0xfffffffffffffff0
05114 e8c71bf61e                     call       0x7f347b09c560
05119 f4                             hlt        
0511a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05122 e839785207                     call       0x7f34636621e0
05127 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05131 4883e4f0                       and        rsp, 0xfffffffffffffff0
05135 e8a61bf61e                     call       0x7f347b09c560
0513a f4                             hlt        
0513b e8a0c05207                     call       0x7f3463666a60
05140 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
0514a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0514e e88d1bf61e                     call       0x7f347b09c560
05153 f4                             hlt        
05154 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
0515e 4c89542408                     mov        qword ptr [rsp + 8], r10
05163 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0516b e8f04c5207                     call       0x7f346365f6e0
05170 e9fdcbffff                     jmp        0x7f345c1375f2
05175 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
0517f 4c89542408                     mov        qword ptr [rsp + 8], r10
05184 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0518c e8cf4c5207                     call       0x7f346365f6e0
05191 e929ccffff                     jmp        0x7f345c13763f
05196 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
051a0 4c89542408                     mov        qword ptr [rsp + 8], r10
051a5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051ad e8ae4c5207                     call       0x7f346365f6e0
051b2 e940ccffff                     jmp        0x7f345c137677
051b7 49ba30046250347f0000           movabs     r10, 0x7f3450620430
051c1 4c89542408                     mov        qword ptr [rsp + 8], r10
051c6 48c704240a020000               mov        qword ptr [rsp], 0x20a
051ce e88d4c5207                     call       0x7f346365f6e0
051d3 e9edccffff                     jmp        0x7f345c137745
051d8 90                             nop        
051d9 90                             nop        
051da 90                             nop        
051db 90                             nop        
051dc 90                             nop        
051dd 90                             nop        
051de 90                             nop        
051df e8fc515f07                     call       0x7f346372fc60
051e4 e9becdffff                     jmp        0x7f345c137827
051e9 90                             nop        
051ea 90                             nop        
051eb 90                             nop        
051ec 90                             nop        
051ed 90                             nop        
051ee 90                             nop        
051ef e8ec515f07                     call       0x7f346372fc60
051f4 e91ccfffff                     jmp        0x7f345c137995
051f9 49bac02e6250347f0000           movabs     r10, 0x7f3450622ec0
05203 4c89542408                     mov        qword ptr [rsp + 8], r10
05208 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05210 e84b4c5207                     call       0x7f346365f6e0
05215 e980cfffff                     jmp        0x7f345c137a1a
0521a 49b80000000000000000           movabs     r8, 0
05224 b8000f050a                     mov        eax, 0xa050f00
05229 e832675207                     call       0x7f34636611e0
0522e e96dcfffff                     jmp        0x7f345c137a20
05233 49ba30046250347f0000           movabs     r10, 0x7f3450620430
0523d 4c89542408                     mov        qword ptr [rsp + 8], r10
05242 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
0524a e8114c5207                     call       0x7f346365f6e0
0524f e9a0d0ffff                     jmp        0x7f345c137b74
05254 49ba08967450347f0000           movabs     r10, 0x7f3450749608
0525e 4c89542408                     mov        qword ptr [rsp + 8], r10
05263 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0526b e8f04b5207                     call       0x7f346365f6e0
05270 e94ed3ffff                     jmp        0x7f345c137e43
05275 e866bf5207                     call       0x7f3463666a60
0527a 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05284 4883e4f0                       and        rsp, 0xfffffffffffffff0
05288 e8531af61e                     call       0x7f347b09c560
0528d f4                             hlt        
0528e 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
05298 4c89542408                     mov        qword ptr [rsp + 8], r10
0529d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052a5 e8b64b5207                     call       0x7f346365f6e0
052aa e9c2d3ffff                     jmp        0x7f345c137ef1
052af 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
052b9 4c89542408                     mov        qword ptr [rsp + 8], r10
052be 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
052c6 e8954b5207                     call       0x7f346365f6e0
052cb e9d9d3ffff                     jmp        0x7f345c137f29
052d0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052d8 e883765207                     call       0x7f34636621e0
052dd 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
052e7 4883e4f0                       and        rsp, 0xfffffffffffffff0
052eb e8f019f61e                     call       0x7f347b09c560
052f0 f4                             hlt        
052f1 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052f9 e862765207                     call       0x7f34636621e0
052fe 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05308 4883e4f0                       and        rsp, 0xfffffffffffffff0
0530c e8cf19f61e                     call       0x7f347b09c560
05311 f4                             hlt        
05312 49ba50577d50347f0000           movabs     r10, 0x7f34507d5750
0531c 4c89542408                     mov        qword ptr [rsp + 8], r10
05321 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05329 e8324b5207                     call       0x7f346365f6e0
0532e e953d4ffff                     jmp        0x7f345c138006
05333 49ba78c97d50347f0000           movabs     r10, 0x7f34507dc978
0533d 4c89542408                     mov        qword ptr [rsp + 8], r10
05342 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0534a e8114b5207                     call       0x7f346365f6e0
0534f e965d4ffff                     jmp        0x7f345c138039
05354 49ba088d6850347f0000           movabs     r10, 0x7f3450688d08
0535e 4c89542408                     mov        qword ptr [rsp + 8], r10
05363 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0536b e8f04a5207                     call       0x7f346365f6e0
05370 e9a0d4ffff                     jmp        0x7f345c138095
05375 49bac8b17450347f0000           movabs     r10, 0x7f345074b1c8
0537f 4c89542408                     mov        qword ptr [rsp + 8], r10
05384 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0538c e8cf4a5207                     call       0x7f346365f6e0
05391 e9bad4ffff                     jmp        0x7f345c1380d0
05396 49ba584c6850347f0000           movabs     r10, 0x7f3450684c58
053a0 4c89542408                     mov        qword ptr [rsp + 8], r10
053a5 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053ad e8ae4a5207                     call       0x7f346365f6e0
053b2 e9cbd4ffff                     jmp        0x7f345c138102
053b7 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
053c1 4c89542408                     mov        qword ptr [rsp + 8], r10
053c6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053ce e88d4a5207                     call       0x7f346365f6e0
053d3 e9c3d5ffff                     jmp        0x7f345c13821b
053d8 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
053e2 4c89542408                     mov        qword ptr [rsp + 8], r10
053e7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053ef e86c4a5207                     call       0x7f346365f6e0
053f4 e9e8d5ffff                     jmp        0x7f345c138261
053f9 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
05403 4c89542408                     mov        qword ptr [rsp + 8], r10
05408 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05410 e84b4a5207                     call       0x7f346365f6e0
05415 e9ffd5ffff                     jmp        0x7f345c138299
0541a 48890424                       mov        qword ptr [rsp], rax
0541e e83d905207                     call       0x7f3463663ce0
05423 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
0542d 4883e4f0                       and        rsp, 0xfffffffffffffff0
05431 e8aa18f61e                     call       0x7f347b09c560
05436 f4                             hlt        
05437 e8a4bd5207                     call       0x7f3463666a60
0543c 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05446 4883e4f0                       and        rsp, 0xfffffffffffffff0
0544a e89118f61e                     call       0x7f347b09c560
0544f f4                             hlt        
05450 49ba88a47450347f0000           movabs     r10, 0x7f345074a488
0545a 4c89542408                     mov        qword ptr [rsp + 8], r10
0545f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05467 e8f4495207                     call       0x7f346365f6e0
0546c e965d7ffff                     jmp        0x7f345c138456
05471 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
0547b 4c89542408                     mov        qword ptr [rsp + 8], r10
05480 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05488 e8d3495207                     call       0x7f346365f6e0
0548d e9fdd7ffff                     jmp        0x7f345c13850f
05492 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
0549c 4c89542408                     mov        qword ptr [rsp + 8], r10
054a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054a9 e8b2495207                     call       0x7f346365f6e0
054ae e920d8ffff                     jmp        0x7f345c138553
054b3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
054bb e8a0745207                     call       0x7f34636621e0
054c0 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
054ca 4883e4f0                       and        rsp, 0xfffffffffffffff0
054ce e80d18f61e                     call       0x7f347b09c560
054d3 f4                             hlt        
054d4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
054dc e87f745207                     call       0x7f34636621e0
054e1 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
054eb 4883e4f0                       and        rsp, 0xfffffffffffffff0
054ef e8ec17f61e                     call       0x7f347b09c560
054f4 f4                             hlt        
054f5 e8e6bc5207                     call       0x7f3463666a60
054fa 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05504 4883e4f0                       and        rsp, 0xfffffffffffffff0
05508 e8d317f61e                     call       0x7f347b09c560
0550d f4                             hlt        
0550e 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
05518 4c89542408                     mov        qword ptr [rsp + 8], r10
0551d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05525 e836495207                     call       0x7f346365f6e0
0552a e9abd9ffff                     jmp        0x7f345c13875a
0552f 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
05539 4c89542408                     mov        qword ptr [rsp + 8], r10
0553e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05546 e815495207                     call       0x7f346365f6e0
0554b e9d7d9ffff                     jmp        0x7f345c1387a7
05550 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
0555a 4c89542408                     mov        qword ptr [rsp + 8], r10
0555f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05567 e8f4485207                     call       0x7f346365f6e0
0556c e9eed9ffff                     jmp        0x7f345c1387df
05571 49ba30046250347f0000           movabs     r10, 0x7f3450620430
0557b 4c89542408                     mov        qword ptr [rsp + 8], r10
05580 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05588 e8d3485207                     call       0x7f346365f6e0
0558d e998daffff                     jmp        0x7f345c1388aa
05592 49bac02e6250347f0000           movabs     r10, 0x7f3450622ec0
0559c 4c89542408                     mov        qword ptr [rsp + 8], r10
055a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055a9 e8b2485207                     call       0x7f346365f6e0
055ae e94fdcffff                     jmp        0x7f345c138a82
055b3 49b80000000000000000           movabs     r8, 0
055bd b8000f050a                     mov        eax, 0xa050f00
055c2 e899635207                     call       0x7f34636611e0
055c7 e93cdcffff                     jmp        0x7f345c138a88
055cc 49ba30046250347f0000           movabs     r10, 0x7f3450620430
055d6 4c89542408                     mov        qword ptr [rsp + 8], r10
055db 48c7042420030000               mov        qword ptr [rsp], 0x320
055e3 e878485207                     call       0x7f346365f6e0
055e8 e96fddffff                     jmp        0x7f345c138bdc
055ed 49ba08967450347f0000           movabs     r10, 0x7f3450749608
055f7 4c89542408                     mov        qword ptr [rsp + 8], r10
055fc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05604 e857485207                     call       0x7f346365f6e0
05609 e9eddfffff                     jmp        0x7f345c138e7b
0560e e8cdbb5207                     call       0x7f3463666a60
05613 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
0561d 4883e4f0                       and        rsp, 0xfffffffffffffff0
05621 e8ba16f61e                     call       0x7f347b09c560
05626 f4                             hlt        
05627 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
05631 4c89542408                     mov        qword ptr [rsp + 8], r10
05636 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0563e e81d485207                     call       0x7f346365f6e0
05643 e95be0ffff                     jmp        0x7f345c138f23
05648 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
05652 4c89542408                     mov        qword ptr [rsp + 8], r10
05657 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0565f e8fc475207                     call       0x7f346365f6e0
05664 e973e0ffff                     jmp        0x7f345c138f5c
05669 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05671 e8ea725207                     call       0x7f34636621e0
05676 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05680 4883e4f0                       and        rsp, 0xfffffffffffffff0
05684 e85716f61e                     call       0x7f347b09c560
05689 f4                             hlt        
0568a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05692 e8c9725207                     call       0x7f34636621e0
05697 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
056a1 4883e4f0                       and        rsp, 0xfffffffffffffff0
056a5 e83616f61e                     call       0x7f347b09c560
056aa f4                             hlt        
056ab 49ba50577d50347f0000           movabs     r10, 0x7f34507d5750
056b5 4c89542408                     mov        qword ptr [rsp + 8], r10
056ba 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
056c2 e899475207                     call       0x7f346365f6e0
056c7 e9d6e0ffff                     jmp        0x7f345c139022
056cc 49ba78c97d50347f0000           movabs     r10, 0x7f34507dc978
056d6 4c89542408                     mov        qword ptr [rsp + 8], r10
056db 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
056e3 e878475207                     call       0x7f346365f6e0
056e8 e9e8e0ffff                     jmp        0x7f345c139055
056ed 49ba088d6850347f0000           movabs     r10, 0x7f3450688d08
056f7 4c89542408                     mov        qword ptr [rsp + 8], r10
056fc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05704 e857475207                     call       0x7f346365f6e0
05709 e91fe1ffff                     jmp        0x7f345c1390ad
0570e 49bac8b17450347f0000           movabs     r10, 0x7f345074b1c8
05718 4c89542408                     mov        qword ptr [rsp + 8], r10
0571d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05725 e836475207                     call       0x7f346365f6e0
0572a e934e1ffff                     jmp        0x7f345c1390e3
0572f 49ba584c6850347f0000           movabs     r10, 0x7f3450684c58
05739 4c89542408                     mov        qword ptr [rsp + 8], r10
0573e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05746 e815475207                     call       0x7f346365f6e0
0574b e946e1ffff                     jmp        0x7f345c139116
05750 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
0575a 4c89542408                     mov        qword ptr [rsp + 8], r10
0575f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05767 e8f4465207                     call       0x7f346365f6e0
0576c e933e2ffff                     jmp        0x7f345c139224
05771 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
0577b 4c89542408                     mov        qword ptr [rsp + 8], r10
05780 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05788 e8d3465207                     call       0x7f346365f6e0
0578d e953e2ffff                     jmp        0x7f345c139265
05792 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
0579c 4c89542408                     mov        qword ptr [rsp + 8], r10
057a1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
057a9 e8b2465207                     call       0x7f346365f6e0
057ae e965e2ffff                     jmp        0x7f345c139298
057b3 48890424                       mov        qword ptr [rsp], rax
057b7 e8a48c5207                     call       0x7f3463663ce0
057bc 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
057c6 4883e4f0                       and        rsp, 0xfffffffffffffff0
057ca e81115f61e                     call       0x7f347b09c560
057cf f4                             hlt        
057d0 e80bba5207                     call       0x7f3463666a60
057d5 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
057df 4883e4f0                       and        rsp, 0xfffffffffffffff0
057e3 e8f814f61e                     call       0x7f347b09c560
057e8 f4                             hlt        
057e9 49ba88a47450347f0000           movabs     r10, 0x7f345074a488
057f3 4c89542408                     mov        qword ptr [rsp + 8], r10
057f8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05800 e85b465207                     call       0x7f346365f6e0
05805 e9c4e3ffff                     jmp        0x7f345c13944e
0580a 49ba78286d50347f0000           movabs     r10, 0x7f34506d2878
05814 4c89542408                     mov        qword ptr [rsp + 8], r10
05819 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05821 e83a465207                     call       0x7f346365f6e0
05826 e95ce4ffff                     jmp        0x7f345c139507
0582b 49ba90a61850347f0000           movabs     r10, 0x7f345018a690
05835 4c89542408                     mov        qword ptr [rsp + 8], r10
0583a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05842 e819465207                     call       0x7f346365f6e0
05847 e983e4ffff                     jmp        0x7f345c13954f
0584c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05854 e807715207                     call       0x7f34636621e0
05859 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05863 4883e4f0                       and        rsp, 0xfffffffffffffff0
05867 e87414f61e                     call       0x7f347b09c560
0586c f4                             hlt        
0586d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05875 e8e6705207                     call       0x7f34636621e0
0587a 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05884 4883e4f0                       and        rsp, 0xfffffffffffffff0
05888 e85314f61e                     call       0x7f347b09c560
0588d f4                             hlt        
0588e e84db95207                     call       0x7f3463666a60
05893 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
0589d 4883e4f0                       and        rsp, 0xfffffffffffffff0
058a1 e83a14f61e                     call       0x7f347b09c560
058a6 f4                             hlt        
058a7 49ba88cc7450347f0000           movabs     r10, 0x7f345074cc88
058b1 4c89542408                     mov        qword ptr [rsp + 8], r10
058b6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058be e89d455207                     call       0x7f346365f6e0
058c3 e912e6ffff                     jmp        0x7f345c13975a
058c8 49ba10d44c50347f0000           movabs     r10, 0x7f34504cd410
058d2 4c89542408                     mov        qword ptr [rsp + 8], r10
058d7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058df e87c455207                     call       0x7f346365f6e0
058e4 e93ee6ffff                     jmp        0x7f345c1397a7
058e9 49baa0913f50347f0000           movabs     r10, 0x7f34503f91a0
058f3 4c89542408                     mov        qword ptr [rsp + 8], r10
058f8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05900 e85b455207                     call       0x7f346365f6e0
05905 e955e6ffff                     jmp        0x7f345c1397df
0590a 49ba30046250347f0000           movabs     r10, 0x7f3450620430
05914 4c89542408                     mov        qword ptr [rsp + 8], r10
05919 48c704245a030000               mov        qword ptr [rsp], 0x35a
05921 e83a455207                     call       0x7f346365f6e0
05926 e95ee8ffff                     jmp        0x7f345c139a09
0592b e8b0b85207                     call       0x7f3463666a60
05930 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
0593a 4883e4f0                       and        rsp, 0xfffffffffffffff0
0593e e89d13f61e                     call       0x7f347b09c560
05943 f4                             hlt        
05944 90                             nop        
05945 90                             nop        
05946 90                             nop        
05947 e8944a5f07                     call       0x7f346372fc60
0594c e99eeaffff                     jmp        0x7f345c139c6f
05951 e88ab85207                     call       0x7f3463666a60
05956 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05960 4883e4f0                       and        rsp, 0xfffffffffffffff0
05964 e87713f61e                     call       0x7f347b09c560
05969 f4                             hlt        
0596a 49ba909c135c347f0000           movabs     r10, 0x7f345c139c90
05974 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
0597b e960715f07                     jmp        0x7f3463732360
05980 48ba0000000000000000           movabs     rdx, 0
0598a b8000f050a                     mov        eax, 0xa050f00
0598f e8cc585207                     call       0x7f3463660ae0
05994 e9afeaffff                     jmp        0x7f345c139cc8
05999 e842b85207                     call       0x7f3463666a60
0599e 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
059a8 4883e4f0                       and        rsp, 0xfffffffffffffff0
059ac e82f13f61e                     call       0x7f347b09c560
059b1 f4                             hlt        
059b2 488bd2                         mov        rdx, rdx
059b5 e826a85207                     call       0x7f3463665a60
059ba e9d8eaffff                     jmp        0x7f345c139d17
059bf 48ba0000000000000000           movabs     rdx, 0
059c9 b8000f050a                     mov        eax, 0xa050f00
059ce e88d5f5207                     call       0x7f34636611e0
059d3 e9c0eaffff                     jmp        0x7f345c139d18
059d8 48ba0000000000000000           movabs     rdx, 0
059e2 b8000f050a                     mov        eax, 0xa050f00
059e7 e874585207                     call       0x7f3463660ae0
059ec e93febffff                     jmp        0x7f345c139db0
059f1 e8eab75207                     call       0x7f3463666a60
059f6 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05a00 4883e4f0                       and        rsp, 0xfffffffffffffff0
05a04 e8d712f61e                     call       0x7f347b09c560
05a09 f4                             hlt        
05a0a 488bd2                         mov        rdx, rdx
05a0d e8cea75207                     call       0x7f3463665a60
05a12 e968ebffff                     jmp        0x7f345c139dff
05a17 48ba0000000000000000           movabs     rdx, 0
05a21 b8000f050a                     mov        eax, 0xa050f00
05a26 e835585207                     call       0x7f3463660ae0
05a2b e9a0ebffff                     jmp        0x7f345c139e50
05a30 e8abb75207                     call       0x7f3463666a60
05a35 48bfde6fc879347f0000           movabs     rdi, 0x7f3479c86fde
05a3f 4883e4f0                       and        rsp, 0xfffffffffffffff0
05a43 e89812f61e                     call       0x7f347b09c560
05a48 f4                             hlt        
05a49 488bd2                         mov        rdx, rdx
05a4c e88fa75207                     call       0x7f3463665a60
05a51 e9c9ebffff                     jmp        0x7f345c139e9f
05a56 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
05a5d 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
05a68 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
05a73 4881c4d0030000                 add        rsp, 0x3d0
05a7a 5d                             pop        rbp
05a7b e9e0c65207                     jmp        0x7f34636679e0
