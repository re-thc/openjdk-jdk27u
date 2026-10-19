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
0000f 4c8b16                         mov        r10, qword ptr [rsi]
00012 49c1ea2a                       shr        r10, 0x2a
00016 443b5008                       cmp        r10d, dword ptr [rax + 8]
0001a 0f85c0ab5a07                   jne        0x7f63db742d60
00020 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
00027 55                             push       rbp
00028 4881ece0020000                 sub        rsp, 0x2e0
0002f 90                             nop        
00030 41817f2001000000               cmp        dword ptr [r15 + 0x20], 1
00038 7405                           je         0x7f63d41981bf
0003a e821b05907                     call       0x7f63db7331e0
0003f 898c2420010000                 mov        dword ptr [rsp + 0x120], ecx
00046 4c89842428010000               mov        qword ptr [rsp + 0x128], r8
0004e 4c898c2430010000               mov        qword ptr [rsp + 0x130], r9
00056 89bc2424010000                 mov        dword ptr [rsp + 0x124], edi
0005d 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
00067 8b4378                         mov        eax, dword ptr [rbx + 0x78]
0006a 83c002                         add        eax, 2
0006d 894378                         mov        dword ptr [rbx + 0x78], eax
00070 25fe070000                     and        eax, 0x7fe
00075 85c0                           test       eax, eax
00077 0f84a6480000                   je         0x7f63d419caa3
0007d 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
00087 ff83b0000000                   inc        dword ptr [rbx + 0xb0]
0008d 8b9c24f0020000                 mov        ebx, dword ptr [rsp + 0x2f0]
00094 8b4644                         mov        eax, dword ptr [rsi + 0x44]
00097 4c3b253a971821                 cmp        r12, qword ptr [rip + 0x2118973a]
0009e 0f8414000000                   je         0x7f63d4198238
000a4 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
000ae 4883e4f0                       and        rsp, 0xfffffffffffffff0
000b2 e8c9865920                     call       0x7f63f4730900
000b7 f4                             hlt        
000b8 448b5e3c                       mov        r11d, dword ptr [rsi + 0x3c]
000bc 448b6e38                       mov        r13d, dword ptr [rsi + 0x38]
000c0 4c8b7608                       mov        r14, qword ptr [rsi + 8]
000c4 488b4e10                       mov        rcx, qword ptr [rsi + 0x10]
000c8 4c8b4628                       mov        r8, qword ptr [rsi + 0x28]
000cc 4d63cb                         movsxd     r9, r11d
000cf 4d03ce                         add        r9, r14
000d2 498bfd                         mov        rdi, r13
000d5 412bfb                         sub        edi, r11d
000d8 3bdf                           cmp        ebx, edi
000da 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
000e4 4889842438010000               mov        qword ptr [rsp + 0x138], rax
000ec b800010000                     mov        eax, 0x100
000f1 7f05                           jg         0x7f63d4198278
000f3 b810010000                     mov        eax, 0x110
000f8 44899c2440010000               mov        dword ptr [rsp + 0x140], r11d
00100 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00104 4d8d5b01                       lea        r11, [r11 + 1]
00108 4c891c07                       mov        qword ptr [rdi + rax], r11
0010c 0f8faf440000                   jg         0x7f63d419c741
00112 4863db                         movsxd     rbx, ebx
00115 488b7e20                       mov        rdi, qword ptr [rsi + 0x20]
00119 492bf9                         sub        rdi, r9
0011c 483bfb                         cmp        rdi, rbx
0011f 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
00129 b830010000                     mov        eax, 0x130
0012e 7c05                           jl         0x7f63d41982b5
00130 b820010000                     mov        eax, 0x120
00135 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00139 4d8d5b01                       lea        r11, [r11 + 1]
0013d 4c891c07                       mov        qword ptr [rdi + rax], r11
00141 0f8c7a440000                   jl         0x7f63d419c741
00147 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
00151 ff8760010000                   inc        dword ptr [rdi + 0x160]
00157 498bf8                         mov        rdi, r8
0015a 4883ff00                       cmp        rdi, 0
0015e 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
00168 b870010000                     mov        eax, 0x170
0016d 7505                           jne        0x7f63d41982f4
0016f b880010000                     mov        eax, 0x180
00174 4c8b1c07                       mov        r11, qword ptr [rdi + rax]
00178 4d8d5b01                       lea        r11, [r11 + 1]
0017c 4c891c07                       mov        qword ptr [rdi + rax], r11
00180 0f8531000000                   jne        0x7f63d4198337
00186 4903d9                         add        rbx, r9
00189 488bf9                         mov        rdi, rcx
0018c 483bfb                         cmp        rdi, rbx
0018f 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
00199 bba0010000                     mov        ebx, 0x1a0
0019e 7d05                           jge        0x7f63d4198325
001a0 bb90010000                     mov        ebx, 0x190
001a5 488b041f                       mov        rax, qword ptr [rdi + rbx]
001a9 488d4001                       lea        rax, [rax + 1]
001ad 4889041f                       mov        qword ptr [rdi + rbx], rax
001b1 0f8d0a000000                   jge        0x7f63d4198341
001b7 bf00000000                     mov        edi, 0
001bc e915000000                     jmp        0x7f63d4198356
001c1 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
001cb ff87b0010000                   inc        dword ptr [rdi + 0x1b0]
001d1 bf01000000                     mov        edi, 1
001d6 4d2bc6                         sub        r8, r14
001d9 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
001e3 488383c801000001               add        qword ptr [rbx + 0x1c8], 1
001eb 48bbb84965c8637f0000           movabs     rbx, 0x7f63c86549b8
001f5 8b4378                         mov        eax, dword ptr [rbx + 0x78]
001f8 83c002                         add        eax, 2
001fb 894378                         mov        dword ptr [rbx + 0x78], eax
001fe 25feff1f00                     and        eax, 0x1ffffe
00203 85c0                           test       eax, eax
00205 0f8439470000                   je         0x7f63d419cac4
0020b 48bbffffffffffffff7f           movabs     rbx, 0x7fffffffffffffff
00215 483bd9                         cmp        rbx, rcx
00218 48bbb84965c8637f0000           movabs     rbx, 0x7f63c86549b8
00222 b8c0000000                     mov        eax, 0xc0
00227 7d05                           jge        0x7f63d41983ae
00229 b8b0000000                     mov        eax, 0xb0
0022e 4c8b0c03                       mov        r9, qword ptr [rbx + rax]
00232 4d8d4901                       lea        r9, [r9 + 1]
00236 4c890c03                       mov        qword ptr [rbx + rax], r9
0023a 0f8d0f000000                   jge        0x7f63d41983cf
00240 48b9ffffffffffffff7f           movabs     rcx, 0x7fffffffffffffff
0024a e910000000                     jmp        0x7f63d41983df
0024f 48bbb84965c8637f0000           movabs     rbx, 0x7f63c86549b8
00259 ff83d0000000                   inc        dword ptr [rbx + 0xd0]
0025f 448b9c2440010000               mov        r11d, dword ptr [rsp + 0x140]
00267 488b842438010000               mov        rax, qword ptr [rsp + 0x138]
0026f 488b9c24f8020000               mov        rbx, qword ptr [rsp + 0x2f8]
00277 4889b42448010000               mov        qword ptr [rsp + 0x148], rsi
0027f 498bf5                         mov        rsi, r13
00282 83ee20                         sub        esi, 0x20
00285 448b4a08                       mov        r9d, dword ptr [rdx + 8]
00289 4183e920                       sub        r9d, 0x20
0028d 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
00295 8b9c2424010000                 mov        ebx, dword ptr [rsp + 0x124]
0029c 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
002a3 488b9c2430010000               mov        rbx, qword ptr [rsp + 0x130]
002ab 48899c2458010000               mov        qword ptr [rsp + 0x158], rbx
002b3 488b9c2428010000               mov        rbx, qword ptr [rsp + 0x128]
002bb 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
002c3 8b9c2420010000                 mov        ebx, dword ptr [rsp + 0x120]
002ca 4889942468010000               mov        qword ptr [rsp + 0x168], rdx
002d2 488b942448010000               mov        rdx, qword ptr [rsp + 0x148]
002da 4889942470010000               mov        qword ptr [rsp + 0x170], rdx
002e2 ba00000000                     mov        edx, 0
002e7 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
002ee bb00000000                     mov        ebx, 0
002f3 44898c24f8010000               mov        dword ptr [rsp + 0x1f8], r9d
002fb 89b424ec010000                 mov        dword ptr [rsp + 0x1ec], esi
00302 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
0030a 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
00312 89bc240c020000                 mov        dword ptr [rsp + 0x20c], edi
00319 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
00321 4489ac24fc010000               mov        dword ptr [rsp + 0x1fc], r13d
00329 4c8bc3                         mov        r8, rbx
0032c 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
00334 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0033c 90                             nop        
0033d 90                             nop        
0033e 90                             nop        
0033f 90                             nop        
00340 4c8b8c2450010000               mov        r9, qword ptr [rsp + 0x150]
00348 8b9c2444010000                 mov        ebx, dword ptr [rsp + 0x144]
0034f 488bbc2458010000               mov        rdi, qword ptr [rsp + 0x158]
00357 488bb42460010000               mov        rsi, qword ptr [rsp + 0x160]
0035f 8b842478010000                 mov        eax, dword ptr [rsp + 0x178]
00366 3bd3                           cmp        edx, ebx
00368 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
0036f 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
00379 41bbd8010000                   mov        r11d, 0x1d8
0037f 7d06                           jge        0x7f63d4198507
00381 41bbe8010000                   mov        r11d, 0x1e8
00387 4e8b2c1b                       mov        r13, qword ptr [rbx + r11]
0038b 4d8d6d01                       lea        r13, [r13 + 1]
0038f 4e892c1b                       mov        qword ptr [rbx + r11], r13
00393 0f8d8d3f0000                   jge        0x7f63d419c4a6
00399 3b5608                         cmp        edx, dword ptr [rsi + 8]
0039c 0f830e460000                   jae        0x7f63d419cb30
003a2 4863ca                         movsxd     rcx, edx
003a5 4c8b5cce10                     mov        r11, qword ptr [rsi + rcx*8 + 0x10]
003aa 418bcb                         mov        ecx, r11d
003ad 81e1ffff0100                   and        ecx, 0x1ffff
003b3 898c2414020000                 mov        dword ptr [rsp + 0x214], ecx
003ba 4c8be9                         mov        r13, rcx
003bd b912000000                     mov        ecx, 0x12
003c2 4889b42460010000               mov        qword ptr [rsp + 0x160], rsi
003ca 498bf3                         mov        rsi, r11
003cd 48d3ee                         shr        rsi, cl
003d0 8bf6                           mov        esi, esi
003d2 81e6ffff0300                   and        esi, 0x3ffff
003d8 89b42410020000                 mov        dword ptr [rsp + 0x210], esi
003df b924000000                     mov        ecx, 0x24
003e4 49d3fb                         sar        r11, cl
003e7 458bdb                         mov        r11d, r11d
003ea 4585db                         test       r11d, r11d
003ed 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
003f7 bef8010000                     mov        esi, 0x1f8
003fc 7d05                           jge        0x7f63d4198583
003fe be08020000                     mov        esi, 0x208
00403 488b1c31                       mov        rbx, qword ptr [rcx + rsi]
00407 488d5b01                       lea        rbx, [rbx + 1]
0040b 48891c31                       mov        qword ptr [rcx + rsi], rbx
0040f 0f8d13000000                   jge        0x7f63d41985a8
00415 3b5708                         cmp        edx, dword ptr [rdi + 8]
00418 0f83e6450000                   jae        0x7f63d419cb84
0041e 4863f2                         movsxd     rsi, edx
00421 8b74b70c                       mov        esi, dword ptr [rdi + rsi*4 + 0xc]
00425 4c8bde                         mov        r11, rsi
00428 4585ed                         test       r13d, r13d
0042b 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
00435 b918020000                     mov        ecx, 0x218
0043a 7405                           je         0x7f63d41985c1
0043c b928020000                     mov        ecx, 0x228
00441 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00445 488d5b01                       lea        rbx, [rbx + 1]
00449 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0044d 0f8431000000                   je         0x7f63d4198604
00453 488bd8                         mov        rbx, rax
00456 412bd8                         sub        ebx, r8d
00459 443beb                         cmp        r13d, ebx
0045c 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
00466 b948020000                     mov        ecx, 0x248
0046b 7f05                           jg         0x7f63d41985f2
0046d b938020000                     mov        ecx, 0x238
00472 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
00476 488d5b01                       lea        rbx, [rbx + 1]
0047a 48891c0e                       mov        qword ptr [rsi + rcx], rbx
0047e 0f8f95400000                   jg         0x7f63d419c699
00484 4183fb03                       cmp        r11d, 3
00488 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
00492 b968020000                     mov        ecx, 0x268
00497 7e05                           jle        0x7f63d419861e
00499 b978020000                     mov        ecx, 0x278
0049e 488b1c0e                       mov        rbx, qword ptr [rsi + rcx]
004a2 488d5b01                       lea        rbx, [rbx + 1]
004a6 48891c0e                       mov        qword ptr [rsi + rcx], rbx
004aa 0f8e9c000000                   jle        0x7f63d41986cc
004b0 4183eb03                       sub        r11d, 3
004b4 4183790801                     cmp        dword ptr [r9 + 8], 1
004b9 0f8699450000                   jbe        0x7f63d419cbd8
004bf 418b7110                       mov        esi, dword ptr [r9 + 0x10]
004c3 4183790802                     cmp        dword ptr [r9 + 8], 2
004c8 0f86b0450000                   jbe        0x7f63d419cbfe
004ce 41897114                       mov        dword ptr [r9 + 0x14], esi
004d2 4183790800                     cmp        dword ptr [r9 + 8], 0
004d7 0f86c7450000                   jbe        0x7f63d419cc24
004dd 418b710c                       mov        esi, dword ptr [r9 + 0xc]
004e1 4183790801                     cmp        dword ptr [r9 + 8], 1
004e6 0f86de450000                   jbe        0x7f63d419cc4a
004ec 41897110                       mov        dword ptr [r9 + 0x10], esi
004f0 4183790800                     cmp        dword ptr [r9 + 8], 0
004f5 0f86f5450000                   jbe        0x7f63d419cc70
004fb 4589590c                       mov        dword ptr [r9 + 0xc], r11d
004ff 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
00509 ff8688020000                   inc        dword ptr [rsi + 0x288]
0050f 498bcd                         mov        rcx, r13
00512 89942428020000                 mov        dword ptr [rsp + 0x228], edx
00519 4c8bb42420020000               mov        r14, qword ptr [rsp + 0x220]
00521 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
00529 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
00530 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
00538 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00540 89842478010000                 mov        dword ptr [rsp + 0x178], eax
00547 e969000000                     jmp        0x7f63d4198735
0054c 89942428020000                 mov        dword ptr [rsp + 0x228], edx
00553 44898424e8010000               mov        dword ptr [rsp + 0x1e8], r8d
0055b 4889bc2458010000               mov        qword ptr [rsp + 0x158], rdi
00563 89842478010000                 mov        dword ptr [rsp + 0x178], eax
0056a 48bfd0d263c8637f0000           movabs     rdi, 0x7f63c863d2d0
00574 488387a002000001               add        qword ptr [rdi + 0x2a0], 1
0057c 498bf1                         mov        rsi, r9
0057f 498bd3                         mov        rdx, r11
00582 498bcd                         mov        rcx, r13
00585 4c898c2450010000               mov        qword ptr [rsp + 0x150], r9
0058d 90                             nop        
0058e 90                             nop        
0058f e84cb55a07                     call       0x7f63db743c60
00594 0f1f84008c060000               nop        dword ptr [rax + rax + 0x68c]
0059c 4c8bd8                         mov        r11, rax
0059f 8b8c2414020000                 mov        ecx, dword ptr [rsp + 0x214]
005a6 4c8bb42420020000               mov        r14, qword ptr [rsp + 0x220]
005ae 8b9c2408020000                 mov        ebx, dword ptr [rsp + 0x208]
005b5 4863f3                         movsxd     rsi, ebx
005b8 4903f6                         add        rsi, r14
005bb 4863d1                         movsxd     rdx, ecx
005be 4803f2                         add        rsi, rdx
005c1 4963fb                         movsxd     rdi, r11d
005c4 488bd6                         mov        rdx, rsi
005c7 483bd7                         cmp        rdx, rdi
005ca 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
005d4 41b8c0020000                   mov        r8d, 0x2c0
005da 7d06                           jge        0x7f63d4198762
005dc 41b8b0020000                   mov        r8d, 0x2b0
005e2 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
005e6 4d8d4901                       lea        r9, [r9 + 1]
005ea 4e890c02                       mov        qword ptr [rdx + r8], r9
005ee 0f8d14000000                   jge        0x7f63d4198788
005f4 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
005fc 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
00603 e9b2000000                     jmp        0x7f63d419883a
00608 8b84240c020000                 mov        eax, dword ptr [rsp + 0x20c]
0060f 85c0                           test       eax, eax
00611 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0061b 41b8d0020000                   mov        r8d, 0x2d0
00621 7506                           jne        0x7f63d41987a9
00623 41b8e0020000                   mov        r8d, 0x2e0
00629 4e8b0c02                       mov        r9, qword ptr [rdx + r8]
0062d 4d8d4901                       lea        r9, [r9 + 1]
00631 4e890c02                       mov        qword ptr [rdx + r8], r9
00635 4c8b842418020000               mov        r8, qword ptr [rsp + 0x218]
0063d 0f856d000000                   jne        0x7f63d4198830
00643 488bd3                         mov        rdx, rbx
00646 03d1                           add        edx, ecx
00648 412bd3                         sub        edx, r11d
0064b 4863d2                         movsxd     rdx, edx
0064e 493bd0                         cmp        rdx, r8
00651 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0065b 41b9f0020000                   mov        r9d, 0x2f0
00661 7c06                           jl         0x7f63d41987e9
00663 41b900030000                   mov        r9d, 0x300
00669 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
0066d 4d8d6d01                       lea        r13, [r13 + 1]
00671 4e892c0a                       mov        qword ptr [rdx + r9], r13
00675 0f8c3f000000                   jl         0x7f63d419883a
0067b 488b9424f0010000               mov        rdx, qword ptr [rsp + 0x1f0]
00683 483bd7                         cmp        rdx, rdi
00686 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
00690 41b920030000                   mov        r9d, 0x320
00696 7c06                           jl         0x7f63d419881e
00698 41b910030000                   mov        r9d, 0x310
0069e 4e8b2c0a                       mov        r13, qword ptr [rdx + r9]
006a2 4d8d6d01                       lea        r13, [r13 + 1]
006a6 4e892c0a                       mov        qword ptr [rdx + r9], r13
006aa 0f8c0a000000                   jl         0x7f63d419883a
006b0 ba00000000                     mov        edx, 0
006b5 e915000000                     jmp        0x7f63d419884f
006ba 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
006c4 ff8230030000                   inc        dword ptr [rdx + 0x330]
006ca ba01000000                     mov        edx, 1
006cf 4889bc2430020000               mov        qword ptr [rsp + 0x230], rdi
006d7 4585db                         test       r11d, r11d
006da 49b9d0d263c8637f0000           movabs     r9, 0x7f63c863d2d0
006e4 41bd48030000                   mov        r13d, 0x348
006ea 7e06                           jle        0x7f63d4198872
006ec 41bd58030000                   mov        r13d, 0x358
006f2 4b8b3c29                       mov        rdi, qword ptr [r9 + r13]
006f6 488d7f01                       lea        rdi, [rdi + 1]
006fa 4b893c29                       mov        qword ptr [r9 + r13], rdi
006fe 0f8e7b3b0000                   jle        0x7f63d419c3ff
00704 85d2                           test       edx, edx
00706 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
00710 41b978030000                   mov        r9d, 0x378
00716 7506                           jne        0x7f63d419889e
00718 41b968030000                   mov        r9d, 0x368
0071e 4a8b3c0a                       mov        rdi, qword ptr [rdx + r9]
00722 488d7f01                       lea        rdi, [rdi + 1]
00726 4a893c0a                       mov        qword ptr [rdx + r9], rdi
0072a 0f854f3b0000                   jne        0x7f63d419c3ff
00730 4c8beb                         mov        r13, rbx
00733 4403e9                         add        r13d, ecx
00736 4489ac2440020000               mov        dword ptr [rsp + 0x240], r13d
0073e 498bf5                         mov        rsi, r13
00741 03b42410020000                 add        esi, dword ptr [rsp + 0x210]
00748 3bb424ec010000                 cmp        esi, dword ptr [rsp + 0x1ec]
0074f 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
00759 ba30040000                     mov        edx, 0x430
0075e 7f05                           jg         0x7f63d41988e5
00760 ba40040000                     mov        edx, 0x440
00765 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
00769 4d8d4901                       lea        r9, [r9 + 1]
0076d 4c890c16                       mov        qword ptr [rsi + rdx], r9
00771 0f8f3f000000                   jg         0x7f63d4198936
00777 8bbc24e8010000                 mov        edi, dword ptr [rsp + 0x1e8]
0077e 03f9                           add        edi, ecx
00780 89bc2438020000                 mov        dword ptr [rsp + 0x238], edi
00787 3bbc24f8010000                 cmp        edi, dword ptr [rsp + 0x1f8]
0078e 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
00798 ba60040000                     mov        edx, 0x460
0079d 7e05                           jle        0x7f63d4198924
0079f ba50040000                     mov        edx, 0x450
007a4 4c8b0c16                       mov        r9, qword ptr [rsi + rdx]
007a8 4d8d4901                       lea        r9, [r9 + 1]
007ac 4c890c16                       mov        qword ptr [rsi + rdx], r9
007b0 0f8e89000000                   jle        0x7f63d41989bf
007b6 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
007bd 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
007c5 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
007cc 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
007d4 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
007de 4883822008000001               add        qword ptr [rdx + 0x820], 1
007e6 488bc6                         mov        rax, rsi
007e9 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
007f1 488bd3                         mov        rdx, rbx
007f4 488bd9                         mov        rbx, rcx
007f7 8b8c24fc010000                 mov        ecx, dword ptr [rsp + 0x1fc]
007fe 4c8b842468010000               mov        r8, qword ptr [rsp + 0x168]
00806 448b8c24e8010000               mov        r9d, dword ptr [rsp + 0x1e8]
0080e 488bfb                         mov        rdi, rbx
00811 44891c24                       mov        dword ptr [rsp], r11d
00815 89442408                       mov        dword ptr [rsp + 8], eax
00819 90                             nop        
0081a 90                             nop        
0081b 90                             nop        
0081c 90                             nop        
0081d 90                             nop        
0081e 90                             nop        
0081f e8bcb25a07                     call       0x7f63db743c60
00824 0f1f84001c090001               nop        dword ptr [rax + rax + 0x100091c]
0082c 8b9c24e8010000                 mov        ebx, dword ptr [rsp + 0x1e8]
00833 039c2414020000                 add        ebx, dword ptr [rsp + 0x214]
0083a e9ec390000                     jmp        0x7f63d419c3ab
0083f 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
00847 8984240c020000                 mov        dword ptr [rsp + 0x20c], eax
0084e 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
00856 8b842410020000                 mov        eax, dword ptr [rsp + 0x210]
0085d 83f910                         cmp        ecx, 0x10
00860 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0086a ba70040000                     mov        edx, 0x470
0086f 7f05                           jg         0x7f63d41989f6
00871 ba80040000                     mov        edx, 0x480
00876 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0087a 4d8d4001                       lea        r8, [r8 + 1]
0087e 4c890416                       mov        qword ptr [rsi + rdx], r8
00882 0f8f990a0000                   jg         0x7f63d41994a1
00888 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
00890 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0089a 4883869004000001               add        qword ptr [rsi + 0x490], 1
008a2 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
008ac 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
008b0 4183c002                       add        r8d, 2
008b4 44894678                       mov        dword ptr [rsi + 0x78], r8d
008b8 4181e0feff1f00                 and        r8d, 0x1ffffe
008bf 4585c0                         test       r8d, r8d
008c2 0f844e420000                   je         0x7f63d419cc96
008c8 48be780238e300000000           movabs     rsi, 0xe3380278
008d2 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
008dc 488b36                         mov        rsi, qword ptr [rsi]
008df 48c1ee2a                       shr        rsi, 0x2a
008e3 48c1e609                       shl        rsi, 9
008e7 41ba0000005c                   mov        r10d, 0x5c000000
008ed 4903f2                         add        rsi, r10
008f0 41ba17000000                   mov        r10d, 0x17
008f6 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
008fa 7435                           je         0x7f63d4198ab1
008fc 4983c202                       add        r10, 2
00900 4983fa1b                       cmp        r10, 0x1b
00904 75f0                           jne        0x7f63d4198a76
00906 41ba17000000                   mov        r10d, 0x17
0090c 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
00911 7412                           je         0x7f63d4198aa5
00913 4983c202                       add        r10, 2
00917 4983fa1b                       cmp        r10, 0x1b
0091b 75ef                           jne        0x7f63d4198a8c
0091d 41ba16000000                   mov        r10d, 0x16
00923 eb10                           jmp        0x7f63d4198ab5
00925 50                             push       rax
00926 4833c0                         xor        rax, rax
00929 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
0092e 58                             pop        rax
0092f ebbf                           jmp        0x7f63d4198a70
00931 4983c201                       add        r10, 1
00935 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0093a 8b7208                         mov        esi, dword ptr [rdx + 8]
0093d 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
00947 498380e000000001               add        qword ptr [r8 + 0xe0], 1
0094f 49b838eb64c8637f0000           movabs     r8, 0x7f63c864eb38
00959 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0095d 4183c102                       add        r9d, 2
00961 45894878                       mov        dword ptr [r8 + 0x78], r9d
00965 4181e1feff1f00                 and        r9d, 0x1ffffe
0096c 4585c9                         test       r9d, r9d
0096f 0f84db410000                   je         0x7f63d419ccd0
00975 448bb424e8010000               mov        r14d, dword ptr [rsp + 0x1e8]
0097d 49b838eb64c8637f0000           movabs     r8, 0x7f63c864eb38
00987 4983801001000001               add        qword ptr [r8 + 0x110], 1
0098f 83ee0f                         sub        esi, 0xf
00992 49b8c8e164c8637f0000           movabs     r8, 0x7f63c864e1c8
0099c 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
009a0 4183c102                       add        r9d, 2
009a4 45894878                       mov        dword ptr [r8 + 0x78], r9d
009a8 4181e1feff1f00                 and        r9d, 0x1ffffe
009af 4585c9                         test       r9d, r9d
009b2 0f84b9410000                   je         0x7f63d419ccf1
009b8 49b8c8e164c8637f0000           movabs     r8, 0x7f63c864e1c8
009c2 498380b000000001               add        qword ptr [r8 + 0xb0], 1
009ca 49b80000000000000000           movabs     r8, 0
009d4 41b800000000                   mov        r8d, 0
009da 453bf0                         cmp        r14d, r8d
009dd 0f8caf410000                   jl         0x7f63d419cd12
009e3 443bf6                         cmp        r14d, esi
009e6 0f8dc7410000                   jge        0x7f63d419cd33
009ec 498bf6                         mov        rsi, r14
009ef 89b4242c020000                 mov        dword ptr [rsp + 0x22c], esi
009f6 49b8780238e300000000           movabs     r8, 0xe3380278
00a00 4d8bc8                         mov        r9, r8
00a03 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
00a0d 4d8b09                         mov        r9, qword ptr [r9]
00a10 49c1e92a                       shr        r9, 0x2a
00a14 49c1e109                       shl        r9, 9
00a18 41ba0000005c                   mov        r10d, 0x5c000000
00a1e 4d03ca                         add        r9, r10
00a21 41ba25000000                   mov        r10d, 0x25
00a27 4e3b0cd6                       cmp        r9, qword ptr [rsi + r10*8]
00a2b 7435                           je         0x7f63d4198be2
00a2d 4983c202                       add        r10, 2
00a31 4983fa29                       cmp        r10, 0x29
00a35 75f0                           jne        0x7f63d4198ba7
00a37 41ba25000000                   mov        r10d, 0x25
00a3d 4a833cd600                     cmp        qword ptr [rsi + r10*8], 0
00a42 7412                           je         0x7f63d4198bd6
00a44 4983c202                       add        r10, 2
00a48 4983fa29                       cmp        r10, 0x29
00a4c 75ef                           jne        0x7f63d4198bbd
00a4e 41ba24000000                   mov        r10d, 0x24
00a54 eb10                           jmp        0x7f63d4198be6
00a56 50                             push       rax
00a57 4833c0                         xor        rax, rax
00a5a 4e0fb10cd6                     cmpxchg    qword ptr [rsi + r10*8], r9
00a5f 58                             pop        rax
00a60 ebbf                           jmp        0x7f63d4198ba1
00a62 4983c201                       add        r10, 1
00a66 4a8304d601                     add        qword ptr [rsi + r10*8], 1
00a6b 48bed0e264c8637f0000           movabs     rsi, 0x7f63c864e2d0
00a75 448b4e78                       mov        r9d, dword ptr [rsi + 0x78]
00a79 4183c102                       add        r9d, 2
00a7d 44894e78                       mov        dword ptr [rsi + 0x78], r9d
00a81 4181e1feff1f00                 and        r9d, 0x1ffffe
00a88 4585c9                         test       r9d, r9d
00a8b 0f8443410000                   je         0x7f63d419cd54
00a91 48bed0e264c8637f0000           movabs     rsi, 0x7f63c864e2d0
00a9b 488386b000000001               add        qword ptr [rsi + 0xb0], 1
00aa3 48be00e464c8637f0000           movabs     rsi, 0x7f63c864e400
00aad 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00ab1 4183c002                       add        r8d, 2
00ab5 44894678                       mov        dword ptr [rsi + 0x78], r8d
00ab9 4181e0feff1f00                 and        r8d, 0x1ffffe
00ac0 4585c0                         test       r8d, r8d
00ac3 0f842c410000                   je         0x7f63d419cd75
00ac9 48be00e464c8637f0000           movabs     rsi, 0x7f63c864e400
00ad3 ff86c0000000                   inc        dword ptr [rsi + 0xc0]
00ad9 8bb4242c020000                 mov        esi, dword ptr [rsp + 0x22c]
00ae0 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
00ae8 4489b424e8010000               mov        dword ptr [rsp + 0x1e8], r14d
00af0 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
00af7 49b890d539e300000000           movabs     r8, 0xe339d590
00b01 4d8bc8                         mov        r9, r8
00b04 48bb08f664c8637f0000           movabs     rbx, 0x7f63c864f608
00b0e 4883836001000001               add        qword ptr [rbx + 0x160], 1
00b16 49b9d8f764c8637f0000           movabs     r9, 0x7f63c864f7d8
00b20 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
00b24 83c302                         add        ebx, 2
00b27 41895978                       mov        dword ptr [r9 + 0x78], ebx
00b2b 81e3feff1f00                   and        ebx, 0x1ffffe
00b31 85db                           test       ebx, ebx
00b33 0f84dd400000                   je         0x7f63d419cd96
00b39 4d8bc8                         mov        r9, r8
00b3c 48bbd8f764c8637f0000           movabs     rbx, 0x7f63c864f7d8
00b46 488383b000000001               add        qword ptr [rbx + 0xb0], 1
00b4e 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
00b58 418b5978                       mov        ebx, dword ptr [r9 + 0x78]
00b5c 83c302                         add        ebx, 2
00b5f 41895978                       mov        dword ptr [r9 + 0x78], ebx
00b63 81e3feff1f00                   and        ebx, 0x1ffffe
00b69 85db                           test       ebx, ebx
00b6b 0f84c6400000                   je         0x7f63d419cdb7
00b71 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
00b7b 498381c000000001               add        qword ptr [r9 + 0xc0], 1
00b83 49b8b8ec64c8637f0000           movabs     r8, 0x7f63c864ecb8
00b8d 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
00b91 4183c102                       add        r9d, 2
00b95 45894878                       mov        dword ptr [r8 + 0x78], r9d
00b99 4181e1feff1f00                 and        r9d, 0x1ffffe
00ba0 4585c9                         test       r9d, r9d
00ba3 0f84af400000                   je         0x7f63d419cdd8
00ba9 49b8780238e300000000           movabs     r8, 0xe3380278
00bb3 4d8bc8                         mov        r9, r8
00bb6 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
00bc0 4d8b09                         mov        r9, qword ptr [r9]
00bc3 49c1e92a                       shr        r9, 0x2a
00bc7 49c1e109                       shl        r9, 9
00bcb 41ba0000005c                   mov        r10d, 0x5c000000
00bd1 4d03ca                         add        r9, r10
00bd4 41ba1d000000                   mov        r10d, 0x1d
00bda 4e3b0cd3                       cmp        r9, qword ptr [rbx + r10*8]
00bde 7435                           je         0x7f63d4198d95
00be0 4983c202                       add        r10, 2
00be4 4983fa21                       cmp        r10, 0x21
00be8 75f0                           jne        0x7f63d4198d5a
00bea 41ba1d000000                   mov        r10d, 0x1d
00bf0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00bf5 7412                           je         0x7f63d4198d89
00bf7 4983c202                       add        r10, 2
00bfb 4983fa21                       cmp        r10, 0x21
00bff 75ef                           jne        0x7f63d4198d70
00c01 41ba1c000000                   mov        r10d, 0x1c
00c07 eb10                           jmp        0x7f63d4198d99
00c09 50                             push       rax
00c0a 4833c0                         xor        rax, rax
00c0d 4e0fb10cd3                     cmpxchg    qword ptr [rbx + r10*8], r9
00c12 58                             pop        rax
00c13 ebbf                           jmp        0x7f63d4198d54
00c15 4983c201                       add        r10, 1
00c19 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00c1e 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
00c28 4d8b00                         mov        r8, qword ptr [r8]
00c2b 49c1e82a                       shr        r8, 0x2a
00c2f 49c1e009                       shl        r8, 9
00c33 41ba0000005c                   mov        r10d, 0x5c000000
00c39 4d03c2                         add        r8, r10
00c3c 41ba23000000                   mov        r10d, 0x23
00c42 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
00c46 7435                           je         0x7f63d4198dfd
00c48 4983c202                       add        r10, 2
00c4c 4983fa27                       cmp        r10, 0x27
00c50 75f0                           jne        0x7f63d4198dc2
00c52 41ba23000000                   mov        r10d, 0x23
00c58 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
00c5d 7412                           je         0x7f63d4198df1
00c5f 4983c202                       add        r10, 2
00c63 4983fa27                       cmp        r10, 0x27
00c67 75ef                           jne        0x7f63d4198dd8
00c69 41ba22000000                   mov        r10d, 0x22
00c6f eb10                           jmp        0x7f63d4198e01
00c71 50                             push       rax
00c72 4833c0                         xor        rax, rax
00c75 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
00c7a 58                             pop        rax
00c7b ebbf                           jmp        0x7f63d4198dbc
00c7d 4983c201                       add        r10, 1
00c81 4b8304d101                     add        qword ptr [r9 + r10*8], 1
00c86 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
00c90 4983804001000001               add        qword ptr [r8 + 0x140], 1
00c98 49b880ed64c8637f0000           movabs     r8, 0x7f63c864ed80
00ca2 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
00ca6 4183c102                       add        r9d, 2
00caa 45894878                       mov        dword ptr [r8 + 0x78], r9d
00cae 4181e1feff1f00                 and        r9d, 0x1ffffe
00cb5 4585c9                         test       r9d, r9d
00cb8 0f84bb3f0000                   je         0x7f63d419cdf9
00cbe 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
00cc8 4983805001000001               add        qword ptr [r8 + 0x150], 1
00cd0 4863de                         movsxd     rbx, esi
00cd3 be0c000000                     mov        esi, 0xc
00cd8 4c8bcb                         mov        r9, rbx
00cdb 4c03ce                         add        r9, rsi
00cde 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
00ce8 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00cec 4183c002                       add        r8d, 2
00cf0 44894678                       mov        dword ptr [rsi + 0x78], r8d
00cf4 4181e0feff1f00                 and        r8d, 0x1ffffe
00cfb 4585c0                         test       r8d, r8d
00cfe 0f84963f0000                   je         0x7f63d419ce1a
00d04 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
00d0e 488386e000000001               add        qword ptr [rsi + 0xe0], 1
00d16 48be88e064c8637f0000           movabs     rsi, 0x7f63c864e088
00d20 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
00d24 4183c002                       add        r8d, 2
00d28 44894678                       mov        dword ptr [rsi + 0x78], r8d
00d2c 4181e0feff1f00                 and        r8d, 0x1ffffe
00d33 4585c0                         test       r8d, r8d
00d36 0f847f3f0000                   je         0x7f63d419ce3b
00d3c 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
00d46 4883867001000001               add        qword ptr [rsi + 0x170], 1
00d4e 48be60d03ae300000000           movabs     rsi, 0xe33ad060
00d58 48bec00238e300000000           movabs     rsi, 0xe33802c0
00d62 488bc2                         mov        rax, rdx
00d65 ba02000000                     mov        edx, 2
00d6a b910000000                     mov        ecx, 0x10
00d6f 4c8bc0                         mov        r8, rax
00d72 bf00000000                     mov        edi, 0
00d77 48890424                       mov        qword ptr [rsp], rax
00d7b 48895c2408                     mov        qword ptr [rsp + 8], rbx
00d80 49ba780238e300000000           movabs     r10, 0xe3380278
00d8a 4c89542410                     mov        qword ptr [rsp + 0x10], r10
00d8f 49ba60d03ae300000000           movabs     r10, 0xe33ad060
00d99 4c89542418                     mov        qword ptr [rsp + 0x18], r10
00d9e 4889842468010000               mov        qword ptr [rsp + 0x168], rax
00da6 90                             nop        
00da7 e834ad5a07                     call       0x7f63db743c60
00dac 0f1f8400a40e0002               nop        dword ptr [rax + rax + 0x2000ea4]
00db4 4885c0                         test       rax, rax
00db7 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
00dc1 750c                           jne        0x7f63d4198f4f
00dc3 808b7901000001                 or         byte ptr [rbx + 0x179], 1
00dca e98b000000                     jmp        0x7f63d4198fda
00dcf 488b38                         mov        rdi, qword ptr [rax]
00dd2 48c1ef2a                       shr        rdi, 0x2a
00dd6 48c1e709                       shl        rdi, 9
00dda 41ba0000005c                   mov        r10d, 0x5c000000
00de0 4903fa                         add        rdi, r10
00de3 41ba31000000                   mov        r10d, 0x31
00de9 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
00ded 7435                           je         0x7f63d4198fa4
00def 4983c202                       add        r10, 2
00df3 4983fa35                       cmp        r10, 0x35
00df7 75f0                           jne        0x7f63d4198f69
00df9 41ba31000000                   mov        r10d, 0x31
00dff 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00e04 7412                           je         0x7f63d4198f98
00e06 4983c202                       add        r10, 2
00e0a 4983fa35                       cmp        r10, 0x35
00e0e 75ef                           jne        0x7f63d4198f7f
00e10 41ba30000000                   mov        r10d, 0x30
00e16 eb10                           jmp        0x7f63d4198fa8
00e18 50                             push       rax
00e19 4833c0                         xor        rax, rax
00e1c 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
00e21 58                             pop        rax
00e22 ebbf                           jmp        0x7f63d4198f63
00e24 4983c201                       add        r10, 1
00e28 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00e2d 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
00e37 488b18                         mov        rbx, qword ptr [rax]
00e3a 48c1eb2a                       shr        rbx, 0x2a
00e3e 48c1e309                       shl        rbx, 9
00e42 41ba0000005c                   mov        r10d, 0x5c000000
00e48 4903da                         add        rbx, r10
00e4b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
00e4f 0f85873e0000                   jne        0x7f63d419ce5c
00e55 e900000000                     jmp        0x7f63d4198fda
00e5a 488bf8                         mov        rdi, rax
00e5d 4889bc2448020000               mov        qword ptr [rsp + 0x248], rdi
00e65 483b07                         cmp        rax, qword ptr [rdi]
00e68 488bf7                         mov        rsi, rdi
00e6b 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
00e75 488b36                         mov        rsi, qword ptr [rsi]
00e78 48c1ee2a                       shr        rsi, 0x2a
00e7c 48c1e609                       shl        rsi, 9
00e80 41ba0000005c                   mov        r10d, 0x5c000000
00e86 4903f2                         add        rsi, r10
00e89 41ba95000000                   mov        r10d, 0x95
00e8f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00e93 743b                           je         0x7f63d4199050
00e95 4983c202                       add        r10, 2
00e99 4981fa99000000                 cmp        r10, 0x99
00ea0 75ed                           jne        0x7f63d419900f
00ea2 41ba95000000                   mov        r10d, 0x95
00ea8 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00ead 7415                           je         0x7f63d4199044
00eaf 4983c202                       add        r10, 2
00eb3 4981fa99000000                 cmp        r10, 0x99
00eba 75ec                           jne        0x7f63d4199028
00ebc 41ba94000000                   mov        r10d, 0x94
00ec2 eb10                           jmp        0x7f63d4199054
00ec4 50                             push       rax
00ec5 4833c0                         xor        rax, rax
00ec8 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00ecd 58                             pop        rax
00ece ebb9                           jmp        0x7f63d4199009
00ed0 4983c201                       add        r10, 1
00ed4 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00ed9 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
00ee3 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
00ee6 83c302                         add        ebx, 2
00ee9 895e78                         mov        dword ptr [rsi + 0x78], ebx
00eec 81e3feff1f00                   and        ebx, 0x1ffffe
00ef2 85db                           test       ebx, ebx
00ef4 0f84183e0000                   je         0x7f63d419ce92
00efa 488bf7                         mov        rsi, rdi
00efd 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
00f07 488b36                         mov        rsi, qword ptr [rsi]
00f0a 48c1ee2a                       shr        rsi, 0x2a
00f0e 48c1e609                       shl        rsi, 9
00f12 41ba0000005c                   mov        r10d, 0x5c000000
00f18 4903f2                         add        rsi, r10
00f1b 41ba17000000                   mov        r10d, 0x17
00f21 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
00f25 7435                           je         0x7f63d41990dc
00f27 4983c202                       add        r10, 2
00f2b 4983fa1b                       cmp        r10, 0x1b
00f2f 75f0                           jne        0x7f63d41990a1
00f31 41ba17000000                   mov        r10d, 0x17
00f37 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
00f3c 7412                           je         0x7f63d41990d0
00f3e 4983c202                       add        r10, 2
00f42 4983fa1b                       cmp        r10, 0x1b
00f46 75ef                           jne        0x7f63d41990b7
00f48 41ba16000000                   mov        r10d, 0x16
00f4e eb10                           jmp        0x7f63d41990e0
00f50 50                             push       rax
00f51 4833c0                         xor        rax, rax
00f54 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
00f59 58                             pop        rax
00f5a ebbf                           jmp        0x7f63d419909b
00f5c 4983c201                       add        r10, 1
00f60 4a8304d301                     add        qword ptr [rbx + r10*8], 1
00f65 488bf7                         mov        rsi, rdi
00f68 90                             nop        
00f69 90                             nop        
00f6a 90                             nop        
00f6b 90                             nop        
00f6c 90                             nop        
00f6d 48b8505714a9637f0000           movabs     rax, 0x7f63a9145750
00f77 e864a65a07                     call       0x7f63db743760
00f7c 0f1f840074100003               nop        dword ptr [rax + rax + 0x3001074]
00f84 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
00f8c 8b7708                         mov        esi, dword ptr [rdi + 8]
00f8f 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
00f99 488383e000000001               add        qword ptr [rbx + 0xe0], 1
00fa1 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
00fab 8b5378                         mov        edx, dword ptr [rbx + 0x78]
00fae 83c202                         add        edx, 2
00fb1 895378                         mov        dword ptr [rbx + 0x78], edx
00fb4 81e2feff1f00                   and        edx, 0x1ffffe
00fba 85d2                           test       edx, edx
00fbc 0f848a3d0000                   je         0x7f63d419cecc
00fc2 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
00fca 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
00fd4 4883831001000001               add        qword ptr [rbx + 0x110], 1
00fdc ffc8                           dec        eax
00fde 2bf0                           sub        esi, eax
00fe0 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
00fea 8b4378                         mov        eax, dword ptr [rbx + 0x78]
00fed 83c002                         add        eax, 2
00ff0 894378                         mov        dword ptr [rbx + 0x78], eax
00ff3 25feff1f00                     and        eax, 0x1ffffe
00ff8 85c0                           test       eax, eax
00ffa 0f846d3d0000                   je         0x7f63d419ceed
01000 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
0100a 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01012 48bb0000000000000000           movabs     rbx, 0
0101c bb00000000                     mov        ebx, 0
01021 443bdb                         cmp        r11d, ebx
01024 0f8c643d0000                   jl         0x7f63d419cf0e
0102a 443bde                         cmp        r11d, esi
0102d 0f8d7c3d0000                   jge        0x7f63d419cf2f
01033 498bdb                         mov        rbx, r11
01036 899c2444020000                 mov        dword ptr [rsp + 0x244], ebx
0103d 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
01045 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
0104d 488bbc2448020000               mov        rdi, qword ptr [rsp + 0x248]
01055 488bf7                         mov        rsi, rdi
01058 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01062 488b36                         mov        rsi, qword ptr [rsi]
01065 48c1ee2a                       shr        rsi, 0x2a
01069 48c1e609                       shl        rsi, 9
0106d 41ba0000005c                   mov        r10d, 0x5c000000
01073 4903f2                         add        rsi, r10
01076 41ba1f000000                   mov        r10d, 0x1f
0107c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01080 7435                           je         0x7f63d4199237
01082 4983c202                       add        r10, 2
01086 4983fa23                       cmp        r10, 0x23
0108a 75f0                           jne        0x7f63d41991fc
0108c 41ba1f000000                   mov        r10d, 0x1f
01092 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01097 7412                           je         0x7f63d419922b
01099 4983c202                       add        r10, 2
0109d 4983fa23                       cmp        r10, 0x23
010a1 75ef                           jne        0x7f63d4199212
010a3 41ba1e000000                   mov        r10d, 0x1e
010a9 eb10                           jmp        0x7f63d419923b
010ab 50                             push       rax
010ac 4833c0                         xor        rax, rax
010af 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
010b4 58                             pop        rax
010b5 ebbf                           jmp        0x7f63d41991f6
010b7 4983c201                       add        r10, 1
010bb 4a8304d201                     add        qword ptr [rdx + r10*8], 1
010c0 488bf7                         mov        rsi, rdi
010c3 90                             nop        
010c4 90                             nop        
010c5 48b8785714a9637f0000           movabs     rax, 0x7f63a9145778
010cf e80ca55a07                     call       0x7f63db743760
010d4 0f1f8400cc110004               nop        dword ptr [rax + rax + 0x40011cc]
010dc 483b00                         cmp        rax, qword ptr [rax]
010df 488bf0                         mov        rsi, rax
010e2 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
010ec 488b36                         mov        rsi, qword ptr [rsi]
010ef 48c1ee2a                       shr        rsi, 0x2a
010f3 48c1e609                       shl        rsi, 9
010f7 41ba0000005c                   mov        r10d, 0x5c000000
010fd 4903f2                         add        rsi, r10
01100 41ba25000000                   mov        r10d, 0x25
01106 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
0110a 7435                           je         0x7f63d41992c1
0110c 4983c202                       add        r10, 2
01110 4983fa29                       cmp        r10, 0x29
01114 75f0                           jne        0x7f63d4199286
01116 41ba25000000                   mov        r10d, 0x25
0111c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01121 7412                           je         0x7f63d41992b5
01123 4983c202                       add        r10, 2
01127 4983fa29                       cmp        r10, 0x29
0112b 75ef                           jne        0x7f63d419929c
0112d 41ba24000000                   mov        r10d, 0x24
01133 eb10                           jmp        0x7f63d41992c5
01135 50                             push       rax
01136 4833c0                         xor        rax, rax
01139 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0113e 58                             pop        rax
0113f ebbf                           jmp        0x7f63d4199280
01141 4983c201                       add        r10, 1
01145 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0114a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0114d 4c3b2584861821                 cmp        r12, qword ptr [rip + 0x21188684]
01154 0f8414000000                   je         0x7f63d41992ee
0115a 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
01164 4883e4f0                       and        rsp, 0xfffffffffffffff0
01168 e813765920                     call       0x7f63f4730900
0116d f4                             hlt        
0116e 488bd0                         mov        rdx, rax
01171 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
0117b 488b12                         mov        rdx, qword ptr [rdx]
0117e 48c1ea2a                       shr        rdx, 0x2a
01182 48c1e209                       shl        rdx, 9
01186 41ba0000005c                   mov        r10d, 0x5c000000
0118c 4903d2                         add        rdx, r10
0118f 41ba2b000000                   mov        r10d, 0x2b
01195 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01199 7435                           je         0x7f63d4199350
0119b 4983c202                       add        r10, 2
0119f 4983fa2f                       cmp        r10, 0x2f
011a3 75f0                           jne        0x7f63d4199315
011a5 41ba2b000000                   mov        r10d, 0x2b
011ab 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
011b0 7412                           je         0x7f63d4199344
011b2 4983c202                       add        r10, 2
011b6 4983fa2f                       cmp        r10, 0x2f
011ba 75ef                           jne        0x7f63d419932b
011bc 41ba2a000000                   mov        r10d, 0x2a
011c2 eb10                           jmp        0x7f63d4199354
011c4 50                             push       rax
011c5 4833c0                         xor        rax, rax
011c8 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
011cd 58                             pop        rax
011ce ebbf                           jmp        0x7f63d419930f
011d0 4983c201                       add        r10, 1
011d4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
011d9 8b4808                         mov        ecx, dword ptr [rax + 8]
011dc 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
011e6 4883828001000001               add        qword ptr [rdx + 0x180], 1
011ee 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
011f8 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
011fc 4183c002                       add        r8d, 2
01200 44894278                       mov        dword ptr [rdx + 0x78], r8d
01204 4181e0feff1f00                 and        r8d, 0x1ffffe
0120b 4585c0                         test       r8d, r8d
0120e 0f84d53b0000                   je         0x7f63d419cf69
01214 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
0121e 4883829001000001               add        qword ptr [rdx + 0x190], 1
01226 8b9c2444020000                 mov        ebx, dword ptr [rsp + 0x244]
0122d 4863db                         movsxd     rbx, ebx
01230 ba0c000000                     mov        edx, 0xc
01235 4c8bcb                         mov        r9, rbx
01238 4c03ca                         add        r9, rdx
0123b 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
01245 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01249 4183c002                       add        r8d, 2
0124d 44894278                       mov        dword ptr [rdx + 0x78], r8d
01251 4181e0feff1f00                 and        r8d, 0x1ffffe
01258 4585c0                         test       r8d, r8d
0125b 0f84a93b0000                   je         0x7f63d419cf8a
01261 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
0126b 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01273 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
0127d 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01281 4183c002                       add        r8d, 2
01285 44894278                       mov        dword ptr [rdx + 0x78], r8d
01289 4181e0feff1f00                 and        r8d, 0x1ffffe
01290 4585c0                         test       r8d, r8d
01293 0f84923b0000                   je         0x7f63d419cfab
01299 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
012a3 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
012ab 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
012b5 ba02000000                     mov        edx, 2
012ba 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
012c2 bf00000000                     mov        edi, 0
012c7 488b842448020000               mov        rax, qword ptr [rsp + 0x248]
012cf 48890424                       mov        qword ptr [rsp], rax
012d3 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
012db 4889442408                     mov        qword ptr [rsp + 8], rax
012e0 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
012e5 49ba08b13ce300000000           movabs     r10, 0xe33cb108
012ef 4c89542418                     mov        qword ptr [rsp + 0x18], r10
012f4 4889842400020000               mov        qword ptr [rsp + 0x200], rax
012fc 90                             nop        
012fd 90                             nop        
012fe 90                             nop        
012ff e8dca75a07                     call       0x7f63db743c60
01304 0f1f8400fc130005               nop        dword ptr [rax + rax + 0x50013fc]
0130c 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
01316 ff86d0040000                   inc        dword ptr [rsi + 0x4d0]
0131c e9f00b0000                     jmp        0x7f63d419a091
01321 44899c243c020000               mov        dword ptr [rsp + 0x23c], r11d
01329 899c2408020000                 mov        dword ptr [rsp + 0x208], ebx
01330 83f930                         cmp        ecx, 0x30
01333 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0133d bae8040000                     mov        edx, 0x4e8
01342 7f05                           jg         0x7f63d41994c9
01344 baf8040000                     mov        edx, 0x4f8
01349 4c8b0416                       mov        r8, qword ptr [rsi + rdx]
0134d 4d8d4001                       lea        r8, [r8 + 1]
01351 4c890416                       mov        qword ptr [rsi + rdx], r8
01355 0f8f200b0000                   jg         0x7f63d4199ffb
0135b 8b9c24e8010000                 mov        ebx, dword ptr [rsp + 0x1e8]
01362 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
0136a 90                             nop        
0136b 90                             nop        
0136c 90                             nop        
0136d 90                             nop        
0136e 90                             nop        
0136f 90                             nop        
01370 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
01378 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
01380 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0138a 4883860805000001               add        qword ptr [rsi + 0x508], 1
01392 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
0139c 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
013a0 4183c002                       add        r8d, 2
013a4 44894678                       mov        dword ptr [rsi + 0x78], r8d
013a8 4181e0feff1f00                 and        r8d, 0x1ffffe
013af 4585c0                         test       r8d, r8d
013b2 0f84943a0000                   je         0x7f63d419cfcc
013b8 48be780238e300000000           movabs     rsi, 0xe3380278
013c2 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
013cc 488b36                         mov        rsi, qword ptr [rsi]
013cf 48c1ee2a                       shr        rsi, 0x2a
013d3 48c1e609                       shl        rsi, 9
013d7 41ba0000005c                   mov        r10d, 0x5c000000
013dd 4903f2                         add        rsi, r10
013e0 41ba17000000                   mov        r10d, 0x17
013e6 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
013ea 7435                           je         0x7f63d41995a1
013ec 4983c202                       add        r10, 2
013f0 4983fa1b                       cmp        r10, 0x1b
013f4 75f0                           jne        0x7f63d4199566
013f6 41ba17000000                   mov        r10d, 0x17
013fc 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
01401 7412                           je         0x7f63d4199595
01403 4983c202                       add        r10, 2
01407 4983fa1b                       cmp        r10, 0x1b
0140b 75ef                           jne        0x7f63d419957c
0140d 41ba16000000                   mov        r10d, 0x16
01413 eb10                           jmp        0x7f63d41995a5
01415 50                             push       rax
01416 4833c0                         xor        rax, rax
01419 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
0141e 58                             pop        rax
0141f ebbf                           jmp        0x7f63d4199560
01421 4983c201                       add        r10, 1
01425 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0142a 8b7208                         mov        esi, dword ptr [rdx + 8]
0142d 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
01437 498380e000000001               add        qword ptr [r8 + 0xe0], 1
0143f 49b838eb64c8637f0000           movabs     r8, 0x7f63c864eb38
01449 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0144d 4183c102                       add        r9d, 2
01451 45894878                       mov        dword ptr [r8 + 0x78], r9d
01455 4181e1feff1f00                 and        r9d, 0x1ffffe
0145c 4585c9                         test       r9d, r9d
0145f 0f84213a0000                   je         0x7f63d419d006
01465 49b838eb64c8637f0000           movabs     r8, 0x7f63c864eb38
0146f 4983801001000001               add        qword ptr [r8 + 0x110], 1
01477 83ee0f                         sub        esi, 0xf
0147a 49b8c8e164c8637f0000           movabs     r8, 0x7f63c864e1c8
01484 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01488 4183c102                       add        r9d, 2
0148c 45894878                       mov        dword ptr [r8 + 0x78], r9d
01490 4181e1feff1f00                 and        r9d, 0x1ffffe
01497 4585c9                         test       r9d, r9d
0149a 0f84073a0000                   je         0x7f63d419d027
014a0 49b8c8e164c8637f0000           movabs     r8, 0x7f63c864e1c8
014aa 498380b000000001               add        qword ptr [r8 + 0xb0], 1
014b2 49b80000000000000000           movabs     r8, 0
014bc 41b800000000                   mov        r8d, 0
014c2 413bd8                         cmp        ebx, r8d
014c5 0f8cfd390000                   jl         0x7f63d419d048
014cb 3bde                           cmp        ebx, esi
014cd 0f8d163a0000                   jge        0x7f63d419d069
014d3 488bf3                         mov        rsi, rbx
014d6 49b8780238e300000000           movabs     r8, 0xe3380278
014e0 4d8bc8                         mov        r9, r8
014e3 48bf08f664c8637f0000           movabs     rdi, 0x7f63c864f608
014ed 4d8b09                         mov        r9, qword ptr [r9]
014f0 49c1e92a                       shr        r9, 0x2a
014f4 49c1e109                       shl        r9, 9
014f8 41ba0000005c                   mov        r10d, 0x5c000000
014fe 4d03ca                         add        r9, r10
01501 41ba25000000                   mov        r10d, 0x25
01507 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
0150b 7435                           je         0x7f63d41996c2
0150d 4983c202                       add        r10, 2
01511 4983fa29                       cmp        r10, 0x29
01515 75f0                           jne        0x7f63d4199687
01517 41ba25000000                   mov        r10d, 0x25
0151d 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
01522 7412                           je         0x7f63d41996b6
01524 4983c202                       add        r10, 2
01528 4983fa29                       cmp        r10, 0x29
0152c 75ef                           jne        0x7f63d419969d
0152e 41ba24000000                   mov        r10d, 0x24
01534 eb10                           jmp        0x7f63d41996c6
01536 50                             push       rax
01537 4833c0                         xor        rax, rax
0153a 4e0fb10cd7                     cmpxchg    qword ptr [rdi + r10*8], r9
0153f 58                             pop        rax
01540 ebbf                           jmp        0x7f63d4199681
01542 4983c201                       add        r10, 1
01546 4a8304d701                     add        qword ptr [rdi + r10*8], 1
0154b 49b9d0e264c8637f0000           movabs     r9, 0x7f63c864e2d0
01555 418b7978                       mov        edi, dword ptr [r9 + 0x78]
01559 83c702                         add        edi, 2
0155c 41897978                       mov        dword ptr [r9 + 0x78], edi
01560 81e7feff1f00                   and        edi, 0x1ffffe
01566 85ff                           test       edi, edi
01568 0f849c390000                   je         0x7f63d419d08a
0156e 49b9d0e264c8637f0000           movabs     r9, 0x7f63c864e2d0
01578 498381b000000001               add        qword ptr [r9 + 0xb0], 1
01580 49b800e464c8637f0000           movabs     r8, 0x7f63c864e400
0158a 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0158e 4183c102                       add        r9d, 2
01592 45894878                       mov        dword ptr [r8 + 0x78], r9d
01596 4181e1feff1f00                 and        r9d, 0x1ffffe
0159d 4585c9                         test       r9d, r9d
015a0 0f8485390000                   je         0x7f63d419d0ab
015a6 49b800e464c8637f0000           movabs     r8, 0x7f63c864e400
015b0 41ff80c0000000                 inc        dword ptr [r8 + 0xc0]
015b7 899c2450020000                 mov        dword ptr [rsp + 0x250], ebx
015be 49b890d539e300000000           movabs     r8, 0xe339d590
015c8 4d8bc8                         mov        r9, r8
015cb 48bf08f664c8637f0000           movabs     rdi, 0x7f63c864f608
015d5 4883876001000001               add        qword ptr [rdi + 0x160], 1
015dd 49b9d8f764c8637f0000           movabs     r9, 0x7f63c864f7d8
015e7 418b7978                       mov        edi, dword ptr [r9 + 0x78]
015eb 83c702                         add        edi, 2
015ee 41897978                       mov        dword ptr [r9 + 0x78], edi
015f2 81e7feff1f00                   and        edi, 0x1ffffe
015f8 85ff                           test       edi, edi
015fa 0f844c390000                   je         0x7f63d419d0cc
01600 4d8bc8                         mov        r9, r8
01603 48bfd8f764c8637f0000           movabs     rdi, 0x7f63c864f7d8
0160d 488387b000000001               add        qword ptr [rdi + 0xb0], 1
01615 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
0161f 418b7978                       mov        edi, dword ptr [r9 + 0x78]
01623 83c702                         add        edi, 2
01626 41897978                       mov        dword ptr [r9 + 0x78], edi
0162a 81e7feff1f00                   and        edi, 0x1ffffe
01630 85ff                           test       edi, edi
01632 0f8435390000                   je         0x7f63d419d0ed
01638 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
01642 498381c000000001               add        qword ptr [r9 + 0xc0], 1
0164a 49b8b8ec64c8637f0000           movabs     r8, 0x7f63c864ecb8
01654 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
01658 4183c102                       add        r9d, 2
0165c 45894878                       mov        dword ptr [r8 + 0x78], r9d
01660 4181e1feff1f00                 and        r9d, 0x1ffffe
01667 4585c9                         test       r9d, r9d
0166a 0f841e390000                   je         0x7f63d419d10e
01670 49b8780238e300000000           movabs     r8, 0xe3380278
0167a 4d8bc8                         mov        r9, r8
0167d 48bfc0f864c8637f0000           movabs     rdi, 0x7f63c864f8c0
01687 4d8b09                         mov        r9, qword ptr [r9]
0168a 49c1e92a                       shr        r9, 0x2a
0168e 49c1e109                       shl        r9, 9
01692 41ba0000005c                   mov        r10d, 0x5c000000
01698 4d03ca                         add        r9, r10
0169b 41ba1d000000                   mov        r10d, 0x1d
016a1 4e3b0cd7                       cmp        r9, qword ptr [rdi + r10*8]
016a5 7435                           je         0x7f63d419985c
016a7 4983c202                       add        r10, 2
016ab 4983fa21                       cmp        r10, 0x21
016af 75f0                           jne        0x7f63d4199821
016b1 41ba1d000000                   mov        r10d, 0x1d
016b7 4a833cd700                     cmp        qword ptr [rdi + r10*8], 0
016bc 7412                           je         0x7f63d4199850
016be 4983c202                       add        r10, 2
016c2 4983fa21                       cmp        r10, 0x21
016c6 75ef                           jne        0x7f63d4199837
016c8 41ba1c000000                   mov        r10d, 0x1c
016ce eb10                           jmp        0x7f63d4199860
016d0 50                             push       rax
016d1 4833c0                         xor        rax, rax
016d4 4e0fb10cd7                     cmpxchg    qword ptr [rdi + r10*8], r9
016d9 58                             pop        rax
016da ebbf                           jmp        0x7f63d419981b
016dc 4983c201                       add        r10, 1
016e0 4a8304d701                     add        qword ptr [rdi + r10*8], 1
016e5 49b9c0f864c8637f0000           movabs     r9, 0x7f63c864f8c0
016ef 4d8b00                         mov        r8, qword ptr [r8]
016f2 49c1e82a                       shr        r8, 0x2a
016f6 49c1e009                       shl        r8, 9
016fa 41ba0000005c                   mov        r10d, 0x5c000000
01700 4d03c2                         add        r8, r10
01703 41ba23000000                   mov        r10d, 0x23
01709 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
0170d 7435                           je         0x7f63d41998c4
0170f 4983c202                       add        r10, 2
01713 4983fa27                       cmp        r10, 0x27
01717 75f0                           jne        0x7f63d4199889
01719 41ba23000000                   mov        r10d, 0x23
0171f 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
01724 7412                           je         0x7f63d41998b8
01726 4983c202                       add        r10, 2
0172a 4983fa27                       cmp        r10, 0x27
0172e 75ef                           jne        0x7f63d419989f
01730 41ba22000000                   mov        r10d, 0x22
01736 eb10                           jmp        0x7f63d41998c8
01738 50                             push       rax
01739 4833c0                         xor        rax, rax
0173c 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
01741 58                             pop        rax
01742 ebbf                           jmp        0x7f63d4199883
01744 4983c201                       add        r10, 1
01748 4b8304d101                     add        qword ptr [r9 + r10*8], 1
0174d 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
01757 4983804001000001               add        qword ptr [r8 + 0x140], 1
0175f 49b880ed64c8637f0000           movabs     r8, 0x7f63c864ed80
01769 458b4878                       mov        r9d, dword ptr [r8 + 0x78]
0176d 4183c102                       add        r9d, 2
01771 45894878                       mov        dword ptr [r8 + 0x78], r9d
01775 4181e1feff1f00                 and        r9d, 0x1ffffe
0177c 4585c9                         test       r9d, r9d
0177f 0f842a380000                   je         0x7f63d419d12f
01785 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
0178f 4983805001000001               add        qword ptr [r8 + 0x150], 1
01797 4c63f6                         movsxd     r14, esi
0179a be0c000000                     mov        esi, 0xc
0179f 4d8bce                         mov        r9, r14
017a2 4c03ce                         add        r9, rsi
017a5 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
017af 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
017b3 4183c002                       add        r8d, 2
017b7 44894678                       mov        dword ptr [rsi + 0x78], r8d
017bb 4181e0feff1f00                 and        r8d, 0x1ffffe
017c2 4585c0                         test       r8d, r8d
017c5 0f8405380000                   je         0x7f63d419d150
017cb 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
017d5 488386e000000001               add        qword ptr [rsi + 0xe0], 1
017dd 48be88e064c8637f0000           movabs     rsi, 0x7f63c864e088
017e7 448b4678                       mov        r8d, dword ptr [rsi + 0x78]
017eb 4183c002                       add        r8d, 2
017ef 44894678                       mov        dword ptr [rsi + 0x78], r8d
017f3 4181e0feff1f00                 and        r8d, 0x1ffffe
017fa 4585c0                         test       r8d, r8d
017fd 0f84ee370000                   je         0x7f63d419d171
01803 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
0180d 4883867001000001               add        qword ptr [rsi + 0x170], 1
01815 48be60d03ae300000000           movabs     rsi, 0xe33ad060
0181f 48bec00238e300000000           movabs     rsi, 0xe33802c0
01829 488bfa                         mov        rdi, rdx
0182c ba02000000                     mov        edx, 2
01831 b910000000                     mov        ecx, 0x10
01836 4c8bc7                         mov        r8, rdi
01839 488bdf                         mov        rbx, rdi
0183c bf00000000                     mov        edi, 0
01841 48891c24                       mov        qword ptr [rsp], rbx
01845 4c89742408                     mov        qword ptr [rsp + 8], r14
0184a 49ba780238e300000000           movabs     r10, 0xe3380278
01854 4c89542410                     mov        qword ptr [rsp + 0x10], r10
01859 49ba60d03ae300000000           movabs     r10, 0xe33ad060
01863 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01868 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
01870 90                             nop        
01871 90                             nop        
01872 90                             nop        
01873 90                             nop        
01874 90                             nop        
01875 90                             nop        
01876 90                             nop        
01877 e864a25a07                     call       0x7f63db743c60
0187c 0f1f840074190006               nop        dword ptr [rax + rax + 0x6001974]
01884 4885c0                         test       rax, rax
01887 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
01891 750c                           jne        0x7f63d4199a1f
01893 808b7901000001                 or         byte ptr [rbx + 0x179], 1
0189a e98b000000                     jmp        0x7f63d4199aaa
0189f 488b38                         mov        rdi, qword ptr [rax]
018a2 48c1ef2a                       shr        rdi, 0x2a
018a6 48c1e709                       shl        rdi, 9
018aa 41ba0000005c                   mov        r10d, 0x5c000000
018b0 4903fa                         add        rdi, r10
018b3 41ba31000000                   mov        r10d, 0x31
018b9 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
018bd 7435                           je         0x7f63d4199a74
018bf 4983c202                       add        r10, 2
018c3 4983fa35                       cmp        r10, 0x35
018c7 75f0                           jne        0x7f63d4199a39
018c9 41ba31000000                   mov        r10d, 0x31
018cf 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
018d4 7412                           je         0x7f63d4199a68
018d6 4983c202                       add        r10, 2
018da 4983fa35                       cmp        r10, 0x35
018de 75ef                           jne        0x7f63d4199a4f
018e0 41ba30000000                   mov        r10d, 0x30
018e6 eb10                           jmp        0x7f63d4199a78
018e8 50                             push       rax
018e9 4833c0                         xor        rax, rax
018ec 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
018f1 58                             pop        rax
018f2 ebbf                           jmp        0x7f63d4199a33
018f4 4983c201                       add        r10, 1
018f8 4a8304d301                     add        qword ptr [rbx + r10*8], 1
018fd 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
01907 488b18                         mov        rbx, qword ptr [rax]
0190a 48c1eb2a                       shr        rbx, 0x2a
0190e 48c1e309                       shl        rbx, 9
01912 41ba0000005c                   mov        r10d, 0x5c000000
01918 4903da                         add        rbx, r10
0191b 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
0191f 0f85ed360000                   jne        0x7f63d419d192
01925 e900000000                     jmp        0x7f63d4199aaa
0192a 488bf8                         mov        rdi, rax
0192d 4889bc2458020000               mov        qword ptr [rsp + 0x258], rdi
01935 483b07                         cmp        rax, qword ptr [rdi]
01938 488bf7                         mov        rsi, rdi
0193b 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
01945 488b36                         mov        rsi, qword ptr [rsi]
01948 48c1ee2a                       shr        rsi, 0x2a
0194c 48c1e609                       shl        rsi, 9
01950 41ba0000005c                   mov        r10d, 0x5c000000
01956 4903f2                         add        rsi, r10
01959 41baa4000000                   mov        r10d, 0xa4
0195f 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
01963 743b                           je         0x7f63d4199b20
01965 4983c202                       add        r10, 2
01969 4981faa8000000                 cmp        r10, 0xa8
01970 75ed                           jne        0x7f63d4199adf
01972 41baa4000000                   mov        r10d, 0xa4
01978 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
0197d 7415                           je         0x7f63d4199b14
0197f 4983c202                       add        r10, 2
01983 4981faa8000000                 cmp        r10, 0xa8
0198a 75ec                           jne        0x7f63d4199af8
0198c 41baa3000000                   mov        r10d, 0xa3
01992 eb10                           jmp        0x7f63d4199b24
01994 50                             push       rax
01995 4833c0                         xor        rax, rax
01998 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
0199d 58                             pop        rax
0199e ebb9                           jmp        0x7f63d4199ad9
019a0 4983c201                       add        r10, 1
019a4 4a8304d301                     add        qword ptr [rbx + r10*8], 1
019a9 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
019b3 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
019b6 83c302                         add        ebx, 2
019b9 895e78                         mov        dword ptr [rsi + 0x78], ebx
019bc 81e3feff1f00                   and        ebx, 0x1ffffe
019c2 85db                           test       ebx, ebx
019c4 0f847e360000                   je         0x7f63d419d1c8
019ca 488bf7                         mov        rsi, rdi
019cd 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
019d7 488b36                         mov        rsi, qword ptr [rsi]
019da 48c1ee2a                       shr        rsi, 0x2a
019de 48c1e609                       shl        rsi, 9
019e2 41ba0000005c                   mov        r10d, 0x5c000000
019e8 4903f2                         add        rsi, r10
019eb 41ba17000000                   mov        r10d, 0x17
019f1 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
019f5 7435                           je         0x7f63d4199bac
019f7 4983c202                       add        r10, 2
019fb 4983fa1b                       cmp        r10, 0x1b
019ff 75f0                           jne        0x7f63d4199b71
01a01 41ba17000000                   mov        r10d, 0x17
01a07 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
01a0c 7412                           je         0x7f63d4199ba0
01a0e 4983c202                       add        r10, 2
01a12 4983fa1b                       cmp        r10, 0x1b
01a16 75ef                           jne        0x7f63d4199b87
01a18 41ba16000000                   mov        r10d, 0x16
01a1e eb10                           jmp        0x7f63d4199bb0
01a20 50                             push       rax
01a21 4833c0                         xor        rax, rax
01a24 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
01a29 58                             pop        rax
01a2a ebbf                           jmp        0x7f63d4199b6b
01a2c 4983c201                       add        r10, 1
01a30 4a8304d301                     add        qword ptr [rbx + r10*8], 1
01a35 488bf7                         mov        rsi, rdi
01a38 90                             nop        
01a39 90                             nop        
01a3a 90                             nop        
01a3b 90                             nop        
01a3c 90                             nop        
01a3d 48b8a05714a9637f0000           movabs     rax, 0x7f63a91457a0
01a47 e8949b5a07                     call       0x7f63db743760
01a4c 0f1f8400441b0007               nop        dword ptr [rax + rax + 0x7001b44]
01a54 488bbc2400020000               mov        rdi, qword ptr [rsp + 0x200]
01a5c 8b7708                         mov        esi, dword ptr [rdi + 8]
01a5f 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
01a69 488383e000000001               add        qword ptr [rbx + 0xe0], 1
01a71 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
01a7b 8b5378                         mov        edx, dword ptr [rbx + 0x78]
01a7e 83c202                         add        edx, 2
01a81 895378                         mov        dword ptr [rbx + 0x78], edx
01a84 81e2feff1f00                   and        edx, 0x1ffffe
01a8a 85d2                           test       edx, edx
01a8c 0f84f0350000                   je         0x7f63d419d202
01a92 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01a9a 48bb38eb64c8637f0000           movabs     rbx, 0x7f63c864eb38
01aa4 4883831001000001               add        qword ptr [rbx + 0x110], 1
01aac ffc8                           dec        eax
01aae 2bf0                           sub        esi, eax
01ab0 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
01aba 8b4378                         mov        eax, dword ptr [rbx + 0x78]
01abd 83c002                         add        eax, 2
01ac0 894378                         mov        dword ptr [rbx + 0x78], eax
01ac3 25feff1f00                     and        eax, 0x1ffffe
01ac8 85c0                           test       eax, eax
01aca 0f84d3350000                   je         0x7f63d419d223
01ad0 48bbc8e164c8637f0000           movabs     rbx, 0x7f63c864e1c8
01ada 488383b000000001               add        qword ptr [rbx + 0xb0], 1
01ae2 48bb0000000000000000           movabs     rbx, 0
01aec bb00000000                     mov        ebx, 0
01af1 443bdb                         cmp        r11d, ebx
01af4 0f8cca350000                   jl         0x7f63d419d244
01afa 443bde                         cmp        r11d, esi
01afd 0f8de2350000                   jge        0x7f63d419d265
01b03 498bdb                         mov        rbx, r11
01b06 899c2460020000                 mov        dword ptr [rsp + 0x260], ebx
01b0d 44899c2454020000               mov        dword ptr [rsp + 0x254], r11d
01b15 4889bc2400020000               mov        qword ptr [rsp + 0x200], rdi
01b1d 488bbc2458020000               mov        rdi, qword ptr [rsp + 0x258]
01b25 488bf7                         mov        rsi, rdi
01b28 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01b32 488b36                         mov        rsi, qword ptr [rsi]
01b35 48c1ee2a                       shr        rsi, 0x2a
01b39 48c1e609                       shl        rsi, 9
01b3d 41ba0000005c                   mov        r10d, 0x5c000000
01b43 4903f2                         add        rsi, r10
01b46 41ba1f000000                   mov        r10d, 0x1f
01b4c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01b50 7435                           je         0x7f63d4199d07
01b52 4983c202                       add        r10, 2
01b56 4983fa23                       cmp        r10, 0x23
01b5a 75f0                           jne        0x7f63d4199ccc
01b5c 41ba1f000000                   mov        r10d, 0x1f
01b62 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01b67 7412                           je         0x7f63d4199cfb
01b69 4983c202                       add        r10, 2
01b6d 4983fa23                       cmp        r10, 0x23
01b71 75ef                           jne        0x7f63d4199ce2
01b73 41ba1e000000                   mov        r10d, 0x1e
01b79 eb10                           jmp        0x7f63d4199d0b
01b7b 50                             push       rax
01b7c 4833c0                         xor        rax, rax
01b7f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01b84 58                             pop        rax
01b85 ebbf                           jmp        0x7f63d4199cc6
01b87 4983c201                       add        r10, 1
01b8b 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01b90 488bf7                         mov        rsi, rdi
01b93 90                             nop        
01b94 90                             nop        
01b95 48b8c85714a9637f0000           movabs     rax, 0x7f63a91457c8
01b9f e83c9a5a07                     call       0x7f63db743760
01ba4 0f1f84009c1c0008               nop        dword ptr [rax + rax + 0x8001c9c]
01bac 483b00                         cmp        rax, qword ptr [rax]
01baf 488bf0                         mov        rsi, rax
01bb2 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01bbc 488b36                         mov        rsi, qword ptr [rsi]
01bbf 48c1ee2a                       shr        rsi, 0x2a
01bc3 48c1e609                       shl        rsi, 9
01bc7 41ba0000005c                   mov        r10d, 0x5c000000
01bcd 4903f2                         add        rsi, r10
01bd0 41ba25000000                   mov        r10d, 0x25
01bd6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
01bda 7435                           je         0x7f63d4199d91
01bdc 4983c202                       add        r10, 2
01be0 4983fa29                       cmp        r10, 0x29
01be4 75f0                           jne        0x7f63d4199d56
01be6 41ba25000000                   mov        r10d, 0x25
01bec 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
01bf1 7412                           je         0x7f63d4199d85
01bf3 4983c202                       add        r10, 2
01bf7 4983fa29                       cmp        r10, 0x29
01bfb 75ef                           jne        0x7f63d4199d6c
01bfd 41ba24000000                   mov        r10d, 0x24
01c03 eb10                           jmp        0x7f63d4199d95
01c05 50                             push       rax
01c06 4833c0                         xor        rax, rax
01c09 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
01c0e 58                             pop        rax
01c0f ebbf                           jmp        0x7f63d4199d50
01c11 4983c201                       add        r10, 1
01c15 4a8304d201                     add        qword ptr [rdx + r10*8], 1
01c1a 8b7028                         mov        esi, dword ptr [rax + 0x28]
01c1d 4c3b25b47b1821                 cmp        r12, qword ptr [rip + 0x21187bb4]
01c24 0f8414000000                   je         0x7f63d4199dbe
01c2a 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
01c34 4883e4f0                       and        rsp, 0xfffffffffffffff0
01c38 e8436b5920                     call       0x7f63f4730900
01c3d f4                             hlt        
01c3e 488bd0                         mov        rdx, rax
01c41 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
01c4b 488b12                         mov        rdx, qword ptr [rdx]
01c4e 48c1ea2a                       shr        rdx, 0x2a
01c52 48c1e209                       shl        rdx, 9
01c56 41ba0000005c                   mov        r10d, 0x5c000000
01c5c 4903d2                         add        rdx, r10
01c5f 41ba2b000000                   mov        r10d, 0x2b
01c65 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
01c69 7435                           je         0x7f63d4199e20
01c6b 4983c202                       add        r10, 2
01c6f 4983fa2f                       cmp        r10, 0x2f
01c73 75f0                           jne        0x7f63d4199de5
01c75 41ba2b000000                   mov        r10d, 0x2b
01c7b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
01c80 7412                           je         0x7f63d4199e14
01c82 4983c202                       add        r10, 2
01c86 4983fa2f                       cmp        r10, 0x2f
01c8a 75ef                           jne        0x7f63d4199dfb
01c8c 41ba2a000000                   mov        r10d, 0x2a
01c92 eb10                           jmp        0x7f63d4199e24
01c94 50                             push       rax
01c95 4833c0                         xor        rax, rax
01c98 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
01c9d 58                             pop        rax
01c9e ebbf                           jmp        0x7f63d4199ddf
01ca0 4983c201                       add        r10, 1
01ca4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
01ca9 8b4808                         mov        ecx, dword ptr [rax + 8]
01cac 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01cb6 4883828001000001               add        qword ptr [rdx + 0x180], 1
01cbe 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
01cc8 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01ccc 4183c002                       add        r8d, 2
01cd0 44894278                       mov        dword ptr [rdx + 0x78], r8d
01cd4 4181e0feff1f00                 and        r8d, 0x1ffffe
01cdb 4585c0                         test       r8d, r8d
01cde 0f843b340000                   je         0x7f63d419d29f
01ce4 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01cee 4883829001000001               add        qword ptr [rdx + 0x190], 1
01cf6 8b9c2460020000                 mov        ebx, dword ptr [rsp + 0x260]
01cfd 4863db                         movsxd     rbx, ebx
01d00 ba0c000000                     mov        edx, 0xc
01d05 4c8bcb                         mov        r9, rbx
01d08 4c03ca                         add        r9, rdx
01d0b 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
01d15 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01d19 4183c002                       add        r8d, 2
01d1d 44894278                       mov        dword ptr [rdx + 0x78], r8d
01d21 4181e0feff1f00                 and        r8d, 0x1ffffe
01d28 4585c0                         test       r8d, r8d
01d2b 0f840f340000                   je         0x7f63d419d2c0
01d31 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
01d3b 488382e000000001               add        qword ptr [rdx + 0xe0], 1
01d43 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
01d4d 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
01d51 4183c002                       add        r8d, 2
01d55 44894278                       mov        dword ptr [rdx + 0x78], r8d
01d59 4181e0feff1f00                 and        r8d, 0x1ffffe
01d60 4585c0                         test       r8d, r8d
01d63 0f84f8330000                   je         0x7f63d419d2e1
01d69 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
01d73 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
01d7b 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
01d85 ba02000000                     mov        edx, 2
01d8a 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
01d92 bf00000000                     mov        edi, 0
01d97 488b842458020000               mov        rax, qword ptr [rsp + 0x258]
01d9f 48890424                       mov        qword ptr [rsp], rax
01da3 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
01dab 4889442408                     mov        qword ptr [rsp + 8], rax
01db0 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
01db5 49ba08b13ce300000000           movabs     r10, 0xe33cb108
01dbf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
01dc4 4889842400020000               mov        qword ptr [rsp + 0x200], rax
01dcc 90                             nop        
01dcd 90                             nop        
01dce 90                             nop        
01dcf e80c9d5a07                     call       0x7f63db743c60
01dd4 0f1f8400cc1e0009               nop        dword ptr [rax + rax + 0x9001ecc]
01ddc 448b9c2454020000               mov        r11d, dword ptr [rsp + 0x254]
01de4 4183c310                       add        r11d, 0x10
01de8 8b9c2450020000                 mov        ebx, dword ptr [rsp + 0x250]
01def 83c310                         add        ebx, 0x10
01df2 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01dfa be02000000                     mov        esi, 2
01dff 7c05                           jl         0x7f63d4199f86
01e01 be00000000                     mov        esi, 0
01e06 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01e10 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
01e13 03ce                           add        ecx, esi
01e15 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
01e18 85f6                           test       esi, esi
01e1a 7505                           jne        0x7f63d4199fa1
01e1c b902000000                     mov        ecx, 2
01e21 81e1fe3f0000                   and        ecx, 0x3ffe
01e27 85c9                           test       ecx, ecx
01e29 0f8453330000                   je         0x7f63d419d302
01e2f 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
01e33 418502                         test       dword ptr [r10], eax
01e36 443b9c2440020000               cmp        r11d, dword ptr [rsp + 0x240]
01e3e 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
01e48 ba48050000                     mov        edx, 0x548
01e4d 7c05                           jl         0x7f63d4199fd4
01e4f ba58050000                     mov        edx, 0x558
01e54 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
01e58 488d4901                       lea        rcx, [rcx + 1]
01e5c 48890c16                       mov        qword ptr [rsi + rdx], rcx
01e60 0f8c0af5ffff                   jl         0x7f63d41994f0
01e66 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
01e70 ff8668050000                   inc        dword ptr [rsi + 0x568]
01e76 e996000000                     jmp        0x7f63d419a091
01e7b 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
01e85 4883868005000001               add        qword ptr [rsi + 0x580], 1
01e8d 488bb42468010000               mov        rsi, qword ptr [rsp + 0x168]
01e95 8b9424e8010000                 mov        edx, dword ptr [rsp + 0x1e8]
01e9c 488bd9                         mov        rbx, rcx
01e9f 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
01ea7 448b842408020000               mov        r8d, dword ptr [rsp + 0x208]
01eaf 4c8bcb                         mov        r9, rbx
01eb2 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
01eb7 4c89442408                     mov        qword ptr [rsp + 8], r8
01ebc 48890c24                       mov        qword ptr [rsp], rcx
01ec0 4889542418                     mov        qword ptr [rsp + 0x18], rdx
01ec5 4889742420                     mov        qword ptr [rsp + 0x20], rsi
01eca 488bfe                         mov        rdi, rsi
01ecd 488bf2                         mov        rsi, rdx
01ed0 488bd1                         mov        rdx, rcx
01ed3 498bc8                         mov        rcx, r8
01ed6 4d8bc1                         mov        r8, r9
01ed9 e8227e5907                     call       0x7f63db731e80
01ede 85c0                           test       eax, eax
01ee0 0f842b000000                   je         0x7f63d419a091
01ee6 488bf8                         mov        rdi, rax
01ee9 83f7ff                         xor        edi, 0xffffffff
01eec 488b0c24                       mov        rcx, qword ptr [rsp]
01ef0 4c8b442408                     mov        r8, qword ptr [rsp + 8]
01ef5 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
01efa 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
01eff 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
01f04 442bcf                         sub        r9d, edi
01f07 03d7                           add        edx, edi
01f09 4403c7                         add        r8d, edi
01f0c e992320000                     jmp        0x7f63d419d323
01f11 8bbc2438020000                 mov        edi, dword ptr [rsp + 0x238]
01f18 448bac2440020000               mov        r13d, dword ptr [rsp + 0x240]
01f20 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
01f27 498bdd                         mov        rbx, r13
01f2a 2b9c243c020000                 sub        ebx, dword ptr [rsp + 0x23c]
01f31 83fe10                         cmp        esi, 0x10
01f34 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01f3e b990050000                     mov        ecx, 0x590
01f43 7f05                           jg         0x7f63d419a0ca
01f45 b9a0050000                     mov        ecx, 0x5a0
01f4a 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f4e 4d8d4001                       lea        r8, [r8 + 1]
01f52 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f56 448b9c243c020000               mov        r11d, dword ptr [rsp + 0x23c]
01f5e 0f8f2c000000                   jg         0x7f63d419a110
01f64 4183fb10                       cmp        r11d, 0x10
01f68 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01f72 b9c0050000                     mov        ecx, 0x5c0
01f77 7d05                           jge        0x7f63d419a0fe
01f79 b9b0050000                     mov        ecx, 0x5b0
01f7e 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01f82 4d8d4001                       lea        r8, [r8 + 1]
01f86 4c89040a                       mov        qword ptr [rdx + rcx], r8
01f8a 0f8d2c180000                   jge        0x7f63d419b93c
01f90 443bde                         cmp        r11d, esi
01f93 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01f9d b928060000                     mov        ecx, 0x628
01fa2 7c05                           jl         0x7f63d419a129
01fa4 b938060000                     mov        ecx, 0x638
01fa9 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fad 4d8d4001                       lea        r8, [r8 + 1]
01fb1 4c89040a                       mov        qword ptr [rdx + rcx], r8
01fb5 0f8c94060000                   jl         0x7f63d419a7cf
01fbb 83fe30                         cmp        esi, 0x30
01fbe 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01fc8 b948060000                     mov        ecx, 0x648
01fcd 7e05                           jle        0x7f63d419a154
01fcf b958060000                     mov        ecx, 0x658
01fd4 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
01fd8 4d8d4001                       lea        r8, [r8 + 1]
01fdc 4c89040a                       mov        qword ptr [rdx + rcx], r8
01fe0 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
01fe7 0f8eaa000000                   jle        0x7f63d419a217
01fed 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
01ff7 4883826806000001               add        qword ptr [rdx + 0x668], 1
01fff 488bc6                         mov        rax, rsi
02002 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
0200a 488bd3                         mov        rdx, rbx
0200d 488b8c2400020000               mov        rcx, qword ptr [rsp + 0x200]
02015 4d8bc5                         mov        r8, r13
02018 4c8bc8                         mov        r9, rax
0201b 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
02023 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
02028 4c89442408                     mov        qword ptr [rsp + 8], r8
0202d 48890c24                       mov        qword ptr [rsp], rcx
02031 4889542418                     mov        qword ptr [rsp + 0x18], rdx
02036 4889742420                     mov        qword ptr [rsp + 0x20], rsi
0203b 488bfe                         mov        rdi, rsi
0203e 488bf2                         mov        rsi, rdx
02041 488bd1                         mov        rdx, rcx
02044 498bc8                         mov        rcx, r8
02047 4d8bc1                         mov        r8, r9
0204a e8b17c5907                     call       0x7f63db731e80
0204f 85c0                           test       eax, eax
02051 0f842b000000                   je         0x7f63d419a202
02057 488bf8                         mov        rdi, rax
0205a 83f7ff                         xor        edi, 0xffffffff
0205d 488b0c24                       mov        rcx, qword ptr [rsp]
02061 4c8b442408                     mov        r8, qword ptr [rsp + 8]
02066 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
0206b 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
02070 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
02075 442bcf                         sub        r9d, edi
02078 03d7                           add        edx, edi
0207a 4403c7                         add        r8d, edi
0207d e92f310000                     jmp        0x7f63d419d331
02082 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0208c ff8278060000                   inc        dword ptr [rdx + 0x678]
02092 e993050000                     jmp        0x7f63d419a7aa
02097 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
0209f 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
020a7 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
020af 4489ac2474020000               mov        dword ptr [rsp + 0x274], r13d
020b7 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
020be 90                             nop        
020bf 90                             nop        
020c0 89bc246c020000                 mov        dword ptr [rsp + 0x26c], edi
020c7 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
020cf 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
020d9 4883829006000001               add        qword ptr [rdx + 0x690], 1
020e1 48ba186e105c00000000           movabs     rdx, 0x5c106e18
020eb 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
020ee 83c102                         add        ecx, 2
020f1 894a78                         mov        dword ptr [rdx + 0x78], ecx
020f4 81e1feff1f00                   and        ecx, 0x1ffffe
020fa 85c9                           test       ecx, ecx
020fc 0f84bf300000                   je         0x7f63d419d341
02102 48ba186e105c00000000           movabs     rdx, 0x5c106e18
0210c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
02113 4885c0                         test       rax, rax
02116 7510                           jne        0x7f63d419a2a8
02118 f6420801                       test       byte ptr [rdx + 8], 1
0211c 0f8506000000                   jne        0x7f63d419a2a8
02122 f048834a0801                   lock or    qword ptr [rdx + 8], 1
02128 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
02132 488d9248030000                 lea        rdx, [rdx + 0x348]
02139 4885c0                         test       rax, rax
0213c 7515                           jne        0x7f63d419a2d3
0213e f6421001                       test       byte ptr [rdx + 0x10], 1
02142 0f8539000000                   jne        0x7f63d419a301
02148 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
0214e e92e000000                     jmp        0x7f63d419a301
02153 488b08                         mov        rcx, qword ptr [rax]
02156 48c1e92a                       shr        rcx, 0x2a
0215a 48c1e109                       shl        rcx, 9
0215e 41ba0000005c                   mov        r10d, 0x5c000000
02164 4903ca                         add        rcx, r10
02167 4c8bd1                         mov        r10, rcx
0216a 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
0216e 48f7c1fcffffff                 test       rcx, -4
02175 740a                           je         0x7f63d419a301
02177 f6c102                         test       cl, 2
0217a 7505                           jne        0x7f63d419a301
0217c 48834a1002                     or         qword ptr [rdx + 0x10], 2
02181 48ba186e105c00000000           movabs     rdx, 0x5c106e18
0218b 488382b000000001               add        qword ptr [rdx + 0xb0], 1
02193 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
0219d 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
021a0 83c102                         add        ecx, 2
021a3 894a78                         mov        dword ptr [rdx + 0x78], ecx
021a6 81e1feff1f00                   and        ecx, 0x1ffffe
021ac 85c9                           test       ecx, ecx
021ae 0f842e300000                   je         0x7f63d419d362
021b4 48ba908030e300000000           movabs     rdx, 0xe3308090
021be 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
021c8 488b12                         mov        rdx, qword ptr [rdx]
021cb 48c1ea2a                       shr        rdx, 0x2a
021cf 48c1e209                       shl        rdx, 9
021d3 41ba0000005c                   mov        r10d, 0x5c000000
021d9 4903d2                         add        rdx, r10
021dc 41ba17000000                   mov        r10d, 0x17
021e2 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
021e6 7435                           je         0x7f63d419a39d
021e8 4983c202                       add        r10, 2
021ec 4983fa1b                       cmp        r10, 0x1b
021f0 75f0                           jne        0x7f63d419a362
021f2 41ba17000000                   mov        r10d, 0x17
021f8 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
021fd 7412                           je         0x7f63d419a391
021ff 4983c202                       add        r10, 2
02203 4983fa1b                       cmp        r10, 0x1b
02207 75ef                           jne        0x7f63d419a378
02209 41ba16000000                   mov        r10d, 0x16
0220f eb10                           jmp        0x7f63d419a3a1
02211 50                             push       rax
02212 4833c0                         xor        rax, rax
02215 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0221a 58                             pop        rax
0221b ebbf                           jmp        0x7f63d419a35c
0221d 4983c201                       add        r10, 1
02221 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02226 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
02230 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02233 83c102                         add        ecx, 2
02236 894a78                         mov        dword ptr [rdx + 0x78], ecx
02239 81e1feff1f00                   and        ecx, 0x1ffffe
0223f 85c9                           test       ecx, ecx
02241 0f84bc2f0000                   je         0x7f63d419d383
02247 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
02251 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
02257 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
02261 ff8208010000                   inc        dword ptr [rdx + 0x108]
02267 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
02271 ff8228010000                   inc        dword ptr [rdx + 0x128]
02277 48ba407830e300000000           movabs     rdx, 0xe3307840
02281 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
0228b 488b12                         mov        rdx, qword ptr [rdx]
0228e 48c1ea2a                       shr        rdx, 0x2a
02292 48c1e209                       shl        rdx, 9
02296 41ba0000005c                   mov        r10d, 0x5c000000
0229c 4903d2                         add        rdx, r10
0229f 41ba28000000                   mov        r10d, 0x28
022a5 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
022a9 7435                           je         0x7f63d419a460
022ab 4983c202                       add        r10, 2
022af 4983fa2c                       cmp        r10, 0x2c
022b3 75f0                           jne        0x7f63d419a425
022b5 41ba28000000                   mov        r10d, 0x28
022bb 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
022c0 7412                           je         0x7f63d419a454
022c2 4983c202                       add        r10, 2
022c6 4983fa2c                       cmp        r10, 0x2c
022ca 75ef                           jne        0x7f63d419a43b
022cc 41ba27000000                   mov        r10d, 0x27
022d2 eb10                           jmp        0x7f63d419a464
022d4 50                             push       rax
022d5 4833c0                         xor        rax, rax
022d8 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
022dd 58                             pop        rax
022de ebbf                           jmp        0x7f63d419a41f
022e0 4983c201                       add        r10, 1
022e4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
022e9 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
022f3 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
022f6 83c102                         add        ecx, 2
022f9 894a78                         mov        dword ptr [rdx + 0x78], ecx
022fc 81e1feff1f00                   and        ecx, 0x1ffffe
02302 85c9                           test       ecx, ecx
02304 0f841a2f0000                   je         0x7f63d419d3a4
0230a 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
02314 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
0231a 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
02324 488d9288010000                 lea        rdx, [rdx + 0x188]
0232b 4885c0                         test       rax, rax
0232e 7515                           jne        0x7f63d419a4c5
02330 f6421801                       test       byte ptr [rdx + 0x18], 1
02334 0f8539000000                   jne        0x7f63d419a4f3
0233a f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
02340 e92e000000                     jmp        0x7f63d419a4f3
02345 488b08                         mov        rcx, qword ptr [rax]
02348 48c1e92a                       shr        rcx, 0x2a
0234c 48c1e109                       shl        rcx, 9
02350 41ba0000005c                   mov        r10d, 0x5c000000
02356 4903ca                         add        rcx, r10
02359 4c8bd1                         mov        r10, rcx
0235c 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
02360 48f7c1fcffffff                 test       rcx, -4
02367 740a                           je         0x7f63d419a4f3
02369 f6c102                         test       cl, 2
0236c 7505                           jne        0x7f63d419a4f3
0236e 48834a1802                     or         qword ptr [rdx + 0x18], 2
02373 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
0237d 4883827801000001               add        qword ptr [rdx + 0x178], 1
02385 48ba00cb78c8637f0000           movabs     rdx, 0x7f63c878cb00
0238f 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02392 83c102                         add        ecx, 2
02395 894a78                         mov        dword ptr [rdx + 0x78], ecx
02398 81e1feff1f00                   and        ecx, 0x1ffffe
0239e 85c9                           test       ecx, ecx
023a0 0f849f2e0000                   je         0x7f63d419d3c5
023a6 4885c0                         test       rax, rax
023a9 49b800cb78c8637f0000           movabs     r8, 0x7f63c878cb00
023b3 750d                           jne        0x7f63d419a542
023b5 418088d900000001               or         byte ptr [r8 + 0xd9], 1
023bd e98b000000                     jmp        0x7f63d419a5cd
023c2 488b30                         mov        rsi, qword ptr [rax]
023c5 48c1ee2a                       shr        rsi, 0x2a
023c9 48c1e609                       shl        rsi, 9
023cd 41ba0000005c                   mov        r10d, 0x5c000000
023d3 4903f2                         add        rsi, r10
023d6 41ba1d000000                   mov        r10d, 0x1d
023dc 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
023e0 7435                           je         0x7f63d419a597
023e2 4983c202                       add        r10, 2
023e6 4983fa21                       cmp        r10, 0x21
023ea 75f0                           jne        0x7f63d419a55c
023ec 41ba1d000000                   mov        r10d, 0x1d
023f2 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
023f7 7412                           je         0x7f63d419a58b
023f9 4983c202                       add        r10, 2
023fd 4983fa21                       cmp        r10, 0x21
02401 75ef                           jne        0x7f63d419a572
02403 41ba1c000000                   mov        r10d, 0x1c
02409 eb10                           jmp        0x7f63d419a59b
0240b 50                             push       rax
0240c 4833c0                         xor        rax, rax
0240f 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
02414 58                             pop        rax
02415 ebbf                           jmp        0x7f63d419a556
02417 4983c201                       add        r10, 1
0241b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02420 48be0014045c00000000           movabs     rsi, 0x5c041400
0242a 4c8b00                         mov        r8, qword ptr [rax]
0242d 49c1e82a                       shr        r8, 0x2a
02431 49c1e009                       shl        r8, 9
02435 41ba0000005c                   mov        r10d, 0x5c000000
0243b 4d03c2                         add        r8, r10
0243e 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
02442 0f851e2e0000                   jne        0x7f63d419d3e6
02448 e900000000                     jmp        0x7f63d419a5cd
0244d 488bd0                         mov        rdx, rax
02450 48b900cb78c8637f0000           movabs     rcx, 0x7f63c878cb00
0245a 4883811001000001               add        qword ptr [rcx + 0x110], 1
02462 48b9a0ce145c00000000           movabs     rcx, 0x5c14cea0
0246c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02470 4183c002                       add        r8d, 2
02474 44894178                       mov        dword ptr [rcx + 0x78], r8d
02478 4181e0feff1f00                 and        r8d, 0x1ffffe
0247f 4585c0                         test       r8d, r8d
02482 0f84fb2d0000                   je         0x7f63d419d403
02488 8b4a08                         mov        ecx, dword ptr [rdx + 8]
0248b 49b8a0ce145c00000000           movabs     r8, 0x5c14cea0
02495 498380b000000001               add        qword ptr [r8 + 0xb0], 1
0249d 83e907                         sub        ecx, 7
024a0 49b8981d23e200000000           movabs     r8, 0xe2231d98
024aa 41b800000000                   mov        r8d, 0
024b0 413bd8                         cmp        ebx, r8d
024b3 0f8c042e0000                   jl         0x7f63d419d43d
024b9 3bd9                           cmp        ebx, ecx
024bb 0f8d1d2e0000                   jge        0x7f63d419d45e
024c1 488bcb                         mov        rcx, rbx
024c4 48be00b722e200000000           movabs     rsi, 0xe222b700
024ce 4c8bc6                         mov        r8, rsi
024d1 49b900cb78c8637f0000           movabs     r9, 0x7f63c878cb00
024db 4d8b00                         mov        r8, qword ptr [r8]
024de 49c1e82a                       shr        r8, 0x2a
024e2 49c1e009                       shl        r8, 9
024e6 41ba0000005c                   mov        r10d, 0x5c000000
024ec 4d03c2                         add        r8, r10
024ef 41ba25000000                   mov        r10d, 0x25
024f5 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
024f9 7435                           je         0x7f63d419a6b0
024fb 4983c202                       add        r10, 2
024ff 4983fa29                       cmp        r10, 0x29
02503 75f0                           jne        0x7f63d419a675
02505 41ba25000000                   mov        r10d, 0x25
0250b 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
02510 7412                           je         0x7f63d419a6a4
02512 4983c202                       add        r10, 2
02516 4983fa29                       cmp        r10, 0x29
0251a 75ef                           jne        0x7f63d419a68b
0251c 41ba24000000                   mov        r10d, 0x24
02522 eb10                           jmp        0x7f63d419a6b4
02524 50                             push       rax
02525 4833c0                         xor        rax, rax
02528 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
0252d 58                             pop        rax
0252e ebbf                           jmp        0x7f63d419a66f
02530 4983c201                       add        r10, 1
02534 4b8304d101                     add        qword ptr [r9 + r10*8], 1
02539 4863c9                         movsxd     rcx, ecx
0253c 41ba0c000000                   mov        r10d, 0xc
02542 4903ca                         add        rcx, r10
02545 41b800000000                   mov        r8d, 0
0254b 899c2470020000                 mov        dword ptr [rsp + 0x270], ebx
02552 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0255a 90                             nop        
0255b 90                             nop        
0255c 90                             nop        
0255d 90                             nop        
0255e 90                             nop        
0255f e87c8b5a07                     call       0x7f63db743260
02564 0f1f84005c26000b               nop        dword ptr [rax + rax + 0xb00265c]
0256c 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
02576 488386a006000001               add        qword ptr [rsi + 0x6a0], 1
0257e 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
02586 8b94246c020000                 mov        edx, dword ptr [rsp + 0x26c]
0258d 488bc8                         mov        rcx, rax
02590 90                             nop        
02591 90                             nop        
02592 90                             nop        
02593 90                             nop        
02594 90                             nop        
02595 90                             nop        
02596 90                             nop        
02597 e844955a07                     call       0x7f63db743c60
0259c 0f1f84009426000c               nop        dword ptr [rax + rax + 0xc002694]
025a4 8bbc246c020000                 mov        edi, dword ptr [rsp + 0x26c]
025ab 83c708                         add        edi, 8
025ae 8b9c2470020000                 mov        ebx, dword ptr [rsp + 0x270]
025b5 83c308                         add        ebx, 8
025b8 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
025bf be02000000                     mov        esi, 2
025c4 7c05                           jl         0x7f63d419a74b
025c6 be00000000                     mov        esi, 0
025cb 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
025d5 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
025d8 03ce                           add        ecx, esi
025da 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
025dd 85f6                           test       esi, esi
025df 7505                           jne        0x7f63d419a766
025e1 b902000000                     mov        ecx, 2
025e6 81e1fe3f0000                   and        ecx, 0x3ffe
025ec 85c9                           test       ecx, ecx
025ee 0f840b2d0000                   je         0x7f63d419d47f
025f4 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
025f8 418502                         test       dword ptr [r10], eax
025fb 3bbc2474020000                 cmp        edi, dword ptr [rsp + 0x274]
02602 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0260c bab0060000                     mov        edx, 0x6b0
02611 7c05                           jl         0x7f63d419a798
02613 bac0060000                     mov        edx, 0x6c0
02618 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0261c 488d4901                       lea        rcx, [rcx + 1]
02620 48890c16                       mov        qword ptr [rsi + rdx], rcx
02624 0f8c96faffff                   jl         0x7f63d419a240
0262a 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
02632 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
0263a 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
02644 ff86d0060000                   inc        dword ptr [rsi + 0x6d0]
0264a e9bf1b0000                     jmp        0x7f63d419c38e
0264f 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
02656 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
0265e 4183fb10                       cmp        r11d, 0x10
02662 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0266c bae8060000                     mov        edx, 0x6e8
02671 7c05                           jl         0x7f63d419a7f8
02673 baf8060000                     mov        edx, 0x6f8
02678 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0267c 488d4901                       lea        rcx, [rcx + 1]
02680 48890c16                       mov        qword ptr [rsi + rdx], rcx
02684 0f8c1b0b0000                   jl         0x7f63d419b325
0268a 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
02692 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
0269a 4489ac2484020000               mov        dword ptr [rsp + 0x284], r13d
026a2 8b842464020000                 mov        eax, dword ptr [rsp + 0x264]
026a9 90                             nop        
026aa 90                             nop        
026ab 90                             nop        
026ac 90                             nop        
026ad 90                             nop        
026ae 90                             nop        
026af 90                             nop        
026b0 89842478020000                 mov        dword ptr [rsp + 0x278], eax
026b7 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
026bf 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
026c9 4883860807000001               add        qword ptr [rsi + 0x708], 1
026d1 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
026db 8b5678                         mov        edx, dword ptr [rsi + 0x78]
026de 83c202                         add        edx, 2
026e1 895678                         mov        dword ptr [rsi + 0x78], edx
026e4 81e2feff1f00                   and        edx, 0x1ffffe
026ea 85d2                           test       edx, edx
026ec 0f842e2c0000                   je         0x7f63d419d4a0
026f2 48be780238e300000000           movabs     rsi, 0xe3380278
026fc 48ba08f664c8637f0000           movabs     rdx, 0x7f63c864f608
02706 488b36                         mov        rsi, qword ptr [rsi]
02709 48c1ee2a                       shr        rsi, 0x2a
0270d 48c1e609                       shl        rsi, 9
02711 41ba0000005c                   mov        r10d, 0x5c000000
02717 4903f2                         add        rsi, r10
0271a 41ba17000000                   mov        r10d, 0x17
02720 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02724 7435                           je         0x7f63d419a8db
02726 4983c202                       add        r10, 2
0272a 4983fa1b                       cmp        r10, 0x1b
0272e 75f0                           jne        0x7f63d419a8a0
02730 41ba17000000                   mov        r10d, 0x17
02736 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0273b 7412                           je         0x7f63d419a8cf
0273d 4983c202                       add        r10, 2
02741 4983fa1b                       cmp        r10, 0x1b
02745 75ef                           jne        0x7f63d419a8b6
02747 41ba16000000                   mov        r10d, 0x16
0274d eb10                           jmp        0x7f63d419a8df
0274f 50                             push       rax
02750 4833c0                         xor        rax, rax
02753 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02758 58                             pop        rax
02759 ebbf                           jmp        0x7f63d419a89a
0275b 4983c201                       add        r10, 1
0275f 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02764 448b7008                       mov        r14d, dword ptr [rax + 8]
02768 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
02772 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0277a 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
02784 8b5678                         mov        edx, dword ptr [rsi + 0x78]
02787 83c202                         add        edx, 2
0278a 895678                         mov        dword ptr [rsi + 0x78], edx
0278d 81e2feff1f00                   and        edx, 0x1ffffe
02793 85d2                           test       edx, edx
02795 0f84bf2b0000                   je         0x7f63d419d4da
0279b 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
027a5 4883861001000001               add        qword ptr [rsi + 0x110], 1
027ad 498bf6                         mov        rsi, r14
027b0 83ee0f                         sub        esi, 0xf
027b3 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
027bd 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
027c0 83c102                         add        ecx, 2
027c3 894a78                         mov        dword ptr [rdx + 0x78], ecx
027c6 81e1feff1f00                   and        ecx, 0x1ffffe
027cc 85c9                           test       ecx, ecx
027ce 0f84a72b0000                   je         0x7f63d419d4fb
027d4 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
027de 488382b000000001               add        qword ptr [rdx + 0xb0], 1
027e6 48ba0000000000000000           movabs     rdx, 0
027f0 ba00000000                     mov        edx, 0
027f5 3bda                           cmp        ebx, edx
027f7 0f8c9f2b0000                   jl         0x7f63d419d51c
027fd 3bde                           cmp        ebx, esi
027ff 0f8db82b0000                   jge        0x7f63d419d53d
02805 488bf3                         mov        rsi, rbx
02808 48ba780238e300000000           movabs     rdx, 0xe3380278
02812 488bca                         mov        rcx, rdx
02815 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
0281f 488b09                         mov        rcx, qword ptr [rcx]
02822 48c1e92a                       shr        rcx, 0x2a
02826 48c1e109                       shl        rcx, 9
0282a 41ba0000005c                   mov        r10d, 0x5c000000
02830 4903ca                         add        rcx, r10
02833 41ba25000000                   mov        r10d, 0x25
02839 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
0283d 7435                           je         0x7f63d419a9f4
0283f 4983c202                       add        r10, 2
02843 4983fa29                       cmp        r10, 0x29
02847 75f0                           jne        0x7f63d419a9b9
02849 41ba25000000                   mov        r10d, 0x25
0284f 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
02854 7412                           je         0x7f63d419a9e8
02856 4983c202                       add        r10, 2
0285a 4983fa29                       cmp        r10, 0x29
0285e 75ef                           jne        0x7f63d419a9cf
02860 41ba24000000                   mov        r10d, 0x24
02866 eb10                           jmp        0x7f63d419a9f8
02868 50                             push       rax
02869 4833c0                         xor        rax, rax
0286c 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02871 58                             pop        rax
02872 ebbf                           jmp        0x7f63d419a9b3
02874 4983c201                       add        r10, 1
02878 4b8304d001                     add        qword ptr [r8 + r10*8], 1
0287d 48b9d0e264c8637f0000           movabs     rcx, 0x7f63c864e2d0
02887 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0288b 4183c002                       add        r8d, 2
0288f 44894178                       mov        dword ptr [rcx + 0x78], r8d
02893 4181e0feff1f00                 and        r8d, 0x1ffffe
0289a 4585c0                         test       r8d, r8d
0289d 0f843b2b0000                   je         0x7f63d419d55e
028a3 48b9d0e264c8637f0000           movabs     rcx, 0x7f63c864e2d0
028ad 488381b000000001               add        qword ptr [rcx + 0xb0], 1
028b5 48ba00e464c8637f0000           movabs     rdx, 0x7f63c864e400
028bf 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
028c2 83c102                         add        ecx, 2
028c5 894a78                         mov        dword ptr [rdx + 0x78], ecx
028c8 81e1feff1f00                   and        ecx, 0x1ffffe
028ce 85c9                           test       ecx, ecx
028d0 0f84292b0000                   je         0x7f63d419d57f
028d6 48ba00e464c8637f0000           movabs     rdx, 0x7f63c864e400
028e0 ff82c0000000                   inc        dword ptr [rdx + 0xc0]
028e6 4489b4247c020000               mov        dword ptr [rsp + 0x27c], r14d
028ee 899c2480020000                 mov        dword ptr [rsp + 0x280], ebx
028f5 48ba90d539e300000000           movabs     rdx, 0xe339d590
028ff 488bca                         mov        rcx, rdx
02902 49b808f664c8637f0000           movabs     r8, 0x7f63c864f608
0290c 4983806001000001               add        qword ptr [r8 + 0x160], 1
02914 48b9d8f764c8637f0000           movabs     rcx, 0x7f63c864f7d8
0291e 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
02922 4183c002                       add        r8d, 2
02926 44894178                       mov        dword ptr [rcx + 0x78], r8d
0292a 4181e0feff1f00                 and        r8d, 0x1ffffe
02931 4585c0                         test       r8d, r8d
02934 0f84e62a0000                   je         0x7f63d419d5a0
0293a 488bca                         mov        rcx, rdx
0293d 49b8d8f764c8637f0000           movabs     r8, 0x7f63c864f7d8
02947 498380b000000001               add        qword ptr [r8 + 0xb0], 1
0294f 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
02959 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
0295d 4183c002                       add        r8d, 2
02961 44894178                       mov        dword ptr [rcx + 0x78], r8d
02965 4181e0feff1f00                 and        r8d, 0x1ffffe
0296c 4585c0                         test       r8d, r8d
0296f 0f84cc2a0000                   je         0x7f63d419d5c1
02975 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
0297f 488381c000000001               add        qword ptr [rcx + 0xc0], 1
02987 48bab8ec64c8637f0000           movabs     rdx, 0x7f63c864ecb8
02991 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02994 83c102                         add        ecx, 2
02997 894a78                         mov        dword ptr [rdx + 0x78], ecx
0299a 81e1feff1f00                   and        ecx, 0x1ffffe
029a0 85c9                           test       ecx, ecx
029a2 0f84ba2a0000                   je         0x7f63d419d5e2
029a8 48ba780238e300000000           movabs     rdx, 0xe3380278
029b2 488bca                         mov        rcx, rdx
029b5 49b8c0f864c8637f0000           movabs     r8, 0x7f63c864f8c0
029bf 488b09                         mov        rcx, qword ptr [rcx]
029c2 48c1e92a                       shr        rcx, 0x2a
029c6 48c1e109                       shl        rcx, 9
029ca 41ba0000005c                   mov        r10d, 0x5c000000
029d0 4903ca                         add        rcx, r10
029d3 41ba1d000000                   mov        r10d, 0x1d
029d9 4b3b0cd0                       cmp        rcx, qword ptr [r8 + r10*8]
029dd 7435                           je         0x7f63d419ab94
029df 4983c202                       add        r10, 2
029e3 4983fa21                       cmp        r10, 0x21
029e7 75f0                           jne        0x7f63d419ab59
029e9 41ba1d000000                   mov        r10d, 0x1d
029ef 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
029f4 7412                           je         0x7f63d419ab88
029f6 4983c202                       add        r10, 2
029fa 4983fa21                       cmp        r10, 0x21
029fe 75ef                           jne        0x7f63d419ab6f
02a00 41ba1c000000                   mov        r10d, 0x1c
02a06 eb10                           jmp        0x7f63d419ab98
02a08 50                             push       rax
02a09 4833c0                         xor        rax, rax
02a0c 4b0fb10cd0                     cmpxchg    qword ptr [r8 + r10*8], rcx
02a11 58                             pop        rax
02a12 ebbf                           jmp        0x7f63d419ab53
02a14 4983c201                       add        r10, 1
02a18 4b8304d001                     add        qword ptr [r8 + r10*8], 1
02a1d 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
02a27 488b12                         mov        rdx, qword ptr [rdx]
02a2a 48c1ea2a                       shr        rdx, 0x2a
02a2e 48c1e209                       shl        rdx, 9
02a32 41ba0000005c                   mov        r10d, 0x5c000000
02a38 4903d2                         add        rdx, r10
02a3b 41ba23000000                   mov        r10d, 0x23
02a41 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02a45 7435                           je         0x7f63d419abfc
02a47 4983c202                       add        r10, 2
02a4b 4983fa27                       cmp        r10, 0x27
02a4f 75f0                           jne        0x7f63d419abc1
02a51 41ba23000000                   mov        r10d, 0x23
02a57 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02a5c 7412                           je         0x7f63d419abf0
02a5e 4983c202                       add        r10, 2
02a62 4983fa27                       cmp        r10, 0x27
02a66 75ef                           jne        0x7f63d419abd7
02a68 41ba22000000                   mov        r10d, 0x22
02a6e eb10                           jmp        0x7f63d419ac00
02a70 50                             push       rax
02a71 4833c0                         xor        rax, rax
02a74 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02a79 58                             pop        rax
02a7a ebbf                           jmp        0x7f63d419abbb
02a7c 4983c201                       add        r10, 1
02a80 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02a85 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
02a8f 4883824001000001               add        qword ptr [rdx + 0x140], 1
02a97 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
02aa1 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02aa4 83c102                         add        ecx, 2
02aa7 894a78                         mov        dword ptr [rdx + 0x78], ecx
02aaa 81e1feff1f00                   and        ecx, 0x1ffffe
02ab0 85c9                           test       ecx, ecx
02ab2 0f84cb290000                   je         0x7f63d419d603
02ab8 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
02ac2 4883825001000001               add        qword ptr [rdx + 0x150], 1
02aca 4863f6                         movsxd     rsi, esi
02acd ba0c000000                     mov        edx, 0xc
02ad2 4c8bce                         mov        r9, rsi
02ad5 4c03ca                         add        r9, rdx
02ad8 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
02ae2 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02ae5 83c102                         add        ecx, 2
02ae8 894a78                         mov        dword ptr [rdx + 0x78], ecx
02aeb 81e1feff1f00                   and        ecx, 0x1ffffe
02af1 85c9                           test       ecx, ecx
02af3 0f84ab290000                   je         0x7f63d419d624
02af9 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
02b03 488382e000000001               add        qword ptr [rdx + 0xe0], 1
02b0b 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
02b15 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
02b18 83c102                         add        ecx, 2
02b1b 894a78                         mov        dword ptr [rdx + 0x78], ecx
02b1e 81e1feff1f00                   and        ecx, 0x1ffffe
02b24 85c9                           test       ecx, ecx
02b26 0f8499290000                   je         0x7f63d419d645
02b2c 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
02b36 4883827001000001               add        qword ptr [rdx + 0x170], 1
02b3e 48ba60d03ae300000000           movabs     rdx, 0xe33ad060
02b48 488bfe                         mov        rdi, rsi
02b4b 48bec00238e300000000           movabs     rsi, 0xe33802c0
02b55 ba02000000                     mov        edx, 2
02b5a b910000000                     mov        ecx, 0x10
02b5f 4c8bc0                         mov        r8, rax
02b62 488bdf                         mov        rbx, rdi
02b65 bf00000000                     mov        edi, 0
02b6a 48890424                       mov        qword ptr [rsp], rax
02b6e 48895c2408                     mov        qword ptr [rsp + 8], rbx
02b73 49ba780238e300000000           movabs     r10, 0xe3380278
02b7d 4c89542410                     mov        qword ptr [rsp + 0x10], r10
02b82 49ba60d03ae300000000           movabs     r10, 0xe33ad060
02b8c 4c89542418                     mov        qword ptr [rsp + 0x18], r10
02b91 4889842400020000               mov        qword ptr [rsp + 0x200], rax
02b99 90                             nop        
02b9a 90                             nop        
02b9b 90                             nop        
02b9c 90                             nop        
02b9d 90                             nop        
02b9e 90                             nop        
02b9f e83c8f5a07                     call       0x7f63db743c60
02ba4 0f1f84009c2c000e               nop        dword ptr [rax + rax + 0xe002c9c]
02bac 4885c0                         test       rax, rax
02baf 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
02bb9 750c                           jne        0x7f63d419ad47
02bbb 808b7901000001                 or         byte ptr [rbx + 0x179], 1
02bc2 e98b000000                     jmp        0x7f63d419add2
02bc7 488b38                         mov        rdi, qword ptr [rax]
02bca 48c1ef2a                       shr        rdi, 0x2a
02bce 48c1e709                       shl        rdi, 9
02bd2 41ba0000005c                   mov        r10d, 0x5c000000
02bd8 4903fa                         add        rdi, r10
02bdb 41ba31000000                   mov        r10d, 0x31
02be1 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
02be5 7435                           je         0x7f63d419ad9c
02be7 4983c202                       add        r10, 2
02beb 4983fa35                       cmp        r10, 0x35
02bef 75f0                           jne        0x7f63d419ad61
02bf1 41ba31000000                   mov        r10d, 0x31
02bf7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02bfc 7412                           je         0x7f63d419ad90
02bfe 4983c202                       add        r10, 2
02c02 4983fa35                       cmp        r10, 0x35
02c06 75ef                           jne        0x7f63d419ad77
02c08 41ba30000000                   mov        r10d, 0x30
02c0e eb10                           jmp        0x7f63d419ada0
02c10 50                             push       rax
02c11 4833c0                         xor        rax, rax
02c14 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
02c19 58                             pop        rax
02c1a ebbf                           jmp        0x7f63d419ad5b
02c1c 4983c201                       add        r10, 1
02c20 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02c25 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
02c2f 488b18                         mov        rbx, qword ptr [rax]
02c32 48c1eb2a                       shr        rbx, 0x2a
02c36 48c1e309                       shl        rbx, 9
02c3a 41ba0000005c                   mov        r10d, 0x5c000000
02c40 4903da                         add        rbx, r10
02c43 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
02c47 0f8599280000                   jne        0x7f63d419d666
02c4d e900000000                     jmp        0x7f63d419add2
02c52 488bf8                         mov        rdi, rax
02c55 4889bc2488020000               mov        qword ptr [rsp + 0x288], rdi
02c5d 483b07                         cmp        rax, qword ptr [rdi]
02c60 488bf7                         mov        rsi, rdi
02c63 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
02c6d 488b36                         mov        rsi, qword ptr [rsi]
02c70 48c1ee2a                       shr        rsi, 0x2a
02c74 48c1e609                       shl        rsi, 9
02c78 41ba0000005c                   mov        r10d, 0x5c000000
02c7e 4903f2                         add        rsi, r10
02c81 41bae4000000                   mov        r10d, 0xe4
02c87 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02c8b 743b                           je         0x7f63d419ae48
02c8d 4983c202                       add        r10, 2
02c91 4981fae8000000                 cmp        r10, 0xe8
02c98 75ed                           jne        0x7f63d419ae07
02c9a 41bae4000000                   mov        r10d, 0xe4
02ca0 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02ca5 7415                           je         0x7f63d419ae3c
02ca7 4983c202                       add        r10, 2
02cab 4981fae8000000                 cmp        r10, 0xe8
02cb2 75ec                           jne        0x7f63d419ae20
02cb4 41bae3000000                   mov        r10d, 0xe3
02cba eb10                           jmp        0x7f63d419ae4c
02cbc 50                             push       rax
02cbd 4833c0                         xor        rax, rax
02cc0 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02cc5 58                             pop        rax
02cc6 ebb9                           jmp        0x7f63d419ae01
02cc8 4983c201                       add        r10, 1
02ccc 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02cd1 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
02cdb 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02cde 83c302                         add        ebx, 2
02ce1 895e78                         mov        dword ptr [rsi + 0x78], ebx
02ce4 81e3feff1f00                   and        ebx, 0x1ffffe
02cea 85db                           test       ebx, ebx
02cec 0f842a280000                   je         0x7f63d419d69c
02cf2 488bf7                         mov        rsi, rdi
02cf5 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
02cff 488b36                         mov        rsi, qword ptr [rsi]
02d02 48c1ee2a                       shr        rsi, 0x2a
02d06 48c1e609                       shl        rsi, 9
02d0a 41ba0000005c                   mov        r10d, 0x5c000000
02d10 4903f2                         add        rsi, r10
02d13 41ba17000000                   mov        r10d, 0x17
02d19 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
02d1d 7435                           je         0x7f63d419aed4
02d1f 4983c202                       add        r10, 2
02d23 4983fa1b                       cmp        r10, 0x1b
02d27 75f0                           jne        0x7f63d419ae99
02d29 41ba17000000                   mov        r10d, 0x17
02d2f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
02d34 7412                           je         0x7f63d419aec8
02d36 4983c202                       add        r10, 2
02d3a 4983fa1b                       cmp        r10, 0x1b
02d3e 75ef                           jne        0x7f63d419aeaf
02d40 41ba16000000                   mov        r10d, 0x16
02d46 eb10                           jmp        0x7f63d419aed8
02d48 50                             push       rax
02d49 4833c0                         xor        rax, rax
02d4c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
02d51 58                             pop        rax
02d52 ebbf                           jmp        0x7f63d419ae93
02d54 4983c201                       add        r10, 1
02d58 4a8304d301                     add        qword ptr [rbx + r10*8], 1
02d5d 488bf7                         mov        rsi, rdi
02d60 90                             nop        
02d61 90                             nop        
02d62 90                             nop        
02d63 90                             nop        
02d64 90                             nop        
02d65 48b8f05714a9637f0000           movabs     rax, 0x7f63a91457f0
02d6f e86c885a07                     call       0x7f63db743760
02d74 0f1f84006c2e000f               nop        dword ptr [rax + rax + 0xf002e6c]
02d7c 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
02d86 488386e000000001               add        qword ptr [rsi + 0xe0], 1
02d8e 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
02d98 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
02d9b 83c702                         add        edi, 2
02d9e 897e78                         mov        dword ptr [rsi + 0x78], edi
02da1 81e7feff1f00                   and        edi, 0x1ffffe
02da7 85ff                           test       edi, edi
02da9 0f848e270000                   je         0x7f63d419d6bd
02daf 448bb4247c020000               mov        r14d, dword ptr [rsp + 0x27c]
02db7 8bbc2478020000                 mov        edi, dword ptr [rsp + 0x278]
02dbe 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
02dc8 4883861001000001               add        qword ptr [rsi + 0x110], 1
02dd0 ffc8                           dec        eax
02dd2 442bf0                         sub        r14d, eax
02dd5 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
02ddf 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
02de2 83c302                         add        ebx, 2
02de5 895e78                         mov        dword ptr [rsi + 0x78], ebx
02de8 81e3feff1f00                   and        ebx, 0x1ffffe
02dee 85db                           test       ebx, ebx
02df0 0f8468270000                   je         0x7f63d419d6de
02df6 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
02e00 488386b000000001               add        qword ptr [rsi + 0xb0], 1
02e08 48be0000000000000000           movabs     rsi, 0
02e12 be00000000                     mov        esi, 0
02e17 3bfe                           cmp        edi, esi
02e19 0f8c60270000                   jl         0x7f63d419d6ff
02e1f 413bfe                         cmp        edi, r14d
02e22 0f8d78270000                   jge        0x7f63d419d720
02e28 488bc7                         mov        rax, rdi
02e2b 89842490020000                 mov        dword ptr [rsp + 0x290], eax
02e32 89bc2478020000                 mov        dword ptr [rsp + 0x278], edi
02e39 488bbc2488020000               mov        rdi, qword ptr [rsp + 0x288]
02e41 488bf7                         mov        rsi, rdi
02e44 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
02e4e 488b36                         mov        rsi, qword ptr [rsi]
02e51 48c1ee2a                       shr        rsi, 0x2a
02e55 48c1e609                       shl        rsi, 9
02e59 41ba0000005c                   mov        r10d, 0x5c000000
02e5f 4903f2                         add        rsi, r10
02e62 41ba1f000000                   mov        r10d, 0x1f
02e68 4a3b34d1                       cmp        rsi, qword ptr [rcx + r10*8]
02e6c 7435                           je         0x7f63d419b023
02e6e 4983c202                       add        r10, 2
02e72 4983fa23                       cmp        r10, 0x23
02e76 75f0                           jne        0x7f63d419afe8
02e78 41ba1f000000                   mov        r10d, 0x1f
02e7e 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02e83 7412                           je         0x7f63d419b017
02e85 4983c202                       add        r10, 2
02e89 4983fa23                       cmp        r10, 0x23
02e8d 75ef                           jne        0x7f63d419affe
02e8f 41ba1e000000                   mov        r10d, 0x1e
02e95 eb10                           jmp        0x7f63d419b027
02e97 50                             push       rax
02e98 4833c0                         xor        rax, rax
02e9b 4a0fb134d1                     cmpxchg    qword ptr [rcx + r10*8], rsi
02ea0 58                             pop        rax
02ea1 ebbf                           jmp        0x7f63d419afe2
02ea3 4983c201                       add        r10, 1
02ea7 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02eac 488bf7                         mov        rsi, rdi
02eaf 90                             nop        
02eb0 90                             nop        
02eb1 90                             nop        
02eb2 90                             nop        
02eb3 90                             nop        
02eb4 90                             nop        
02eb5 48b8185814a9637f0000           movabs     rax, 0x7f63a9145818
02ebf e81c875a07                     call       0x7f63db743760
02ec4 0f1f8400bc2f0010               nop        dword ptr [rax + rax + 0x10002fbc]
02ecc 483b00                         cmp        rax, qword ptr [rax]
02ecf 488bf0                         mov        rsi, rax
02ed2 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
02edc 488b36                         mov        rsi, qword ptr [rsi]
02edf 48c1ee2a                       shr        rsi, 0x2a
02ee3 48c1e609                       shl        rsi, 9
02ee7 41ba0000005c                   mov        r10d, 0x5c000000
02eed 4903f2                         add        rsi, r10
02ef0 41ba25000000                   mov        r10d, 0x25
02ef6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
02efa 7435                           je         0x7f63d419b0b1
02efc 4983c202                       add        r10, 2
02f00 4983fa29                       cmp        r10, 0x29
02f04 75f0                           jne        0x7f63d419b076
02f06 41ba25000000                   mov        r10d, 0x25
02f0c 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
02f11 7412                           je         0x7f63d419b0a5
02f13 4983c202                       add        r10, 2
02f17 4983fa29                       cmp        r10, 0x29
02f1b 75ef                           jne        0x7f63d419b08c
02f1d 41ba24000000                   mov        r10d, 0x24
02f23 eb10                           jmp        0x7f63d419b0b5
02f25 50                             push       rax
02f26 4833c0                         xor        rax, rax
02f29 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
02f2e 58                             pop        rax
02f2f ebbf                           jmp        0x7f63d419b070
02f31 4983c201                       add        r10, 1
02f35 4a8304d201                     add        qword ptr [rdx + r10*8], 1
02f3a 8b7028                         mov        esi, dword ptr [rax + 0x28]
02f3d 4c3b2594681821                 cmp        r12, qword ptr [rip + 0x21186894]
02f44 0f8414000000                   je         0x7f63d419b0de
02f4a 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
02f54 4883e4f0                       and        rsp, 0xfffffffffffffff0
02f58 e823585920                     call       0x7f63f4730900
02f5d f4                             hlt        
02f5e 488bd0                         mov        rdx, rax
02f61 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
02f6b 488b12                         mov        rdx, qword ptr [rdx]
02f6e 48c1ea2a                       shr        rdx, 0x2a
02f72 48c1e209                       shl        rdx, 9
02f76 41ba0000005c                   mov        r10d, 0x5c000000
02f7c 4903d2                         add        rdx, r10
02f7f 41ba2b000000                   mov        r10d, 0x2b
02f85 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
02f89 7435                           je         0x7f63d419b140
02f8b 4983c202                       add        r10, 2
02f8f 4983fa2f                       cmp        r10, 0x2f
02f93 75f0                           jne        0x7f63d419b105
02f95 41ba2b000000                   mov        r10d, 0x2b
02f9b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
02fa0 7412                           je         0x7f63d419b134
02fa2 4983c202                       add        r10, 2
02fa6 4983fa2f                       cmp        r10, 0x2f
02faa 75ef                           jne        0x7f63d419b11b
02fac 41ba2a000000                   mov        r10d, 0x2a
02fb2 eb10                           jmp        0x7f63d419b144
02fb4 50                             push       rax
02fb5 4833c0                         xor        rax, rax
02fb8 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
02fbd 58                             pop        rax
02fbe ebbf                           jmp        0x7f63d419b0ff
02fc0 4983c201                       add        r10, 1
02fc4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
02fc9 8b4808                         mov        ecx, dword ptr [rax + 8]
02fcc 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
02fd6 4883828001000001               add        qword ptr [rdx + 0x180], 1
02fde 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
02fe8 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
02fec 4183c002                       add        r8d, 2
02ff0 44894278                       mov        dword ptr [rdx + 0x78], r8d
02ff4 4181e0feff1f00                 and        r8d, 0x1ffffe
02ffb 4585c0                         test       r8d, r8d
02ffe 0f84d6250000                   je         0x7f63d419d75a
03004 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
0300e 4883829001000001               add        qword ptr [rdx + 0x190], 1
03016 8b842490020000                 mov        eax, dword ptr [rsp + 0x290]
0301d 4863c0                         movsxd     rax, eax
03020 ba0c000000                     mov        edx, 0xc
03025 4c8bc8                         mov        r9, rax
03028 4c03ca                         add        r9, rdx
0302b 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
03035 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03039 4183c002                       add        r8d, 2
0303d 44894278                       mov        dword ptr [rdx + 0x78], r8d
03041 4181e0feff1f00                 and        r8d, 0x1ffffe
03048 4585c0                         test       r8d, r8d
0304b 0f84aa250000                   je         0x7f63d419d77b
03051 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
0305b 488382e000000001               add        qword ptr [rdx + 0xe0], 1
03063 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
0306d 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
03071 4183c002                       add        r8d, 2
03075 44894278                       mov        dword ptr [rdx + 0x78], r8d
03079 4181e0feff1f00                 and        r8d, 0x1ffffe
03080 4585c0                         test       r8d, r8d
03083 0f8493250000                   je         0x7f63d419d79c
03089 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
03093 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
0309b 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
030a5 ba02000000                     mov        edx, 2
030aa 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
030b2 bf00000000                     mov        edi, 0
030b7 488b9c2488020000               mov        rbx, qword ptr [rsp + 0x288]
030bf 48891c24                       mov        qword ptr [rsp], rbx
030c3 488b9c2400020000               mov        rbx, qword ptr [rsp + 0x200]
030cb 48895c2408                     mov        qword ptr [rsp + 8], rbx
030d0 4889442410                     mov        qword ptr [rsp + 0x10], rax
030d5 49ba08b13ce300000000           movabs     r10, 0xe33cb108
030df 4c89542418                     mov        qword ptr [rsp + 0x18], r10
030e4 48899c2400020000               mov        qword ptr [rsp + 0x200], rbx
030ec 90                             nop        
030ed 90                             nop        
030ee 90                             nop        
030ef e8ec895a07                     call       0x7f63db743c60
030f4 0f1f8400ec310011               nop        dword ptr [rax + rax + 0x110031ec]
030fc 8b842478020000                 mov        eax, dword ptr [rsp + 0x278]
03103 83c010                         add        eax, 0x10
03106 8b9c2480020000                 mov        ebx, dword ptr [rsp + 0x280]
0310d 83c310                         add        ebx, 0x10
03110 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
03117 ba02000000                     mov        edx, 2
0311c 7c05                           jl         0x7f63d419b2a3
0311e ba00000000                     mov        edx, 0
03123 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
0312d 448b417c                       mov        r8d, dword ptr [rcx + 0x7c]
03131 4403c2                         add        r8d, edx
03134 4489417c                       mov        dword ptr [rcx + 0x7c], r8d
03138 85d2                           test       edx, edx
0313a 7506                           jne        0x7f63d419b2c2
0313c 41b802000000                   mov        r8d, 2
03142 4181e0fe3f0000                 and        r8d, 0x3ffe
03149 4585c0                         test       r8d, r8d
0314c 0f84eb240000                   je         0x7f63d419d7bd
03152 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03156 418502                         test       dword ptr [r10], eax
03159 3b842484020000                 cmp        eax, dword ptr [rsp + 0x284]
03160 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0316a b948070000                     mov        ecx, 0x748
0316f 7c05                           jl         0x7f63d419b2f6
03171 b958070000                     mov        ecx, 0x758
03176 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0317a 4d8d4001                       lea        r8, [r8 + 1]
0317e 4c89040a                       mov        qword ptr [rdx + rcx], r8
03182 0f8c28f5ffff                   jl         0x7f63d419a830
03188 448bac2484020000               mov        r13d, dword ptr [rsp + 0x284]
03190 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0319a ff8268070000                   inc        dword ptr [rdx + 0x768]
031a0 e969100000                     jmp        0x7f63d419c38e
031a5 4183fb08                       cmp        r11d, 8
031a9 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
031b3 b980070000                     mov        ecx, 0x780
031b8 7c05                           jl         0x7f63d419b33f
031ba b990070000                     mov        ecx, 0x790
031bf 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
031c3 4d8d4001                       lea        r8, [r8 + 1]
031c7 4c89040a                       mov        qword ptr [rdx + rcx], r8
031cb 0f8ca6050000                   jl         0x7f63d419b8f7
031d1 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
031d9 4403ac2410020000               add        r13d, dword ptr [rsp + 0x210]
031e1 4489ac249c020000               mov        dword ptr [rsp + 0x29c], r13d
031e9 8bbc2464020000                 mov        edi, dword ptr [rsp + 0x264]
031f0 89bc2494020000                 mov        dword ptr [rsp + 0x294], edi
031f7 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
031ff 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
03209 488382a007000001               add        qword ptr [rdx + 0x7a0], 1
03211 48ba186e105c00000000           movabs     rdx, 0x5c106e18
0321b 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0321e 83c102                         add        ecx, 2
03221 894a78                         mov        dword ptr [rdx + 0x78], ecx
03224 81e1feff1f00                   and        ecx, 0x1ffffe
0322a 85c9                           test       ecx, ecx
0322c 0f842c240000                   je         0x7f63d419d7de
03232 48ba186e105c00000000           movabs     rdx, 0x5c106e18
0323c 488d92e0000000                 lea        rdx, [rdx + 0xe0]
03243 4885c0                         test       rax, rax
03246 7510                           jne        0x7f63d419b3d8
03248 f6420801                       test       byte ptr [rdx + 8], 1
0324c 0f8506000000                   jne        0x7f63d419b3d8
03252 f048834a0801                   lock or    qword ptr [rdx + 8], 1
03258 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
03262 488d9248030000                 lea        rdx, [rdx + 0x348]
03269 4885c0                         test       rax, rax
0326c 7515                           jne        0x7f63d419b403
0326e f6421001                       test       byte ptr [rdx + 0x10], 1
03272 0f8539000000                   jne        0x7f63d419b431
03278 f048834a1001                   lock or    qword ptr [rdx + 0x10], 1
0327e e92e000000                     jmp        0x7f63d419b431
03283 488b08                         mov        rcx, qword ptr [rax]
03286 48c1e92a                       shr        rcx, 0x2a
0328a 48c1e109                       shl        rcx, 9
0328e 41ba0000005c                   mov        r10d, 0x5c000000
03294 4903ca                         add        rcx, r10
03297 4c8bd1                         mov        r10, rcx
0329a 48334a10                       xor        rcx, qword ptr [rdx + 0x10]
0329e 48f7c1fcffffff                 test       rcx, -4
032a5 740a                           je         0x7f63d419b431
032a7 f6c102                         test       cl, 2
032aa 7505                           jne        0x7f63d419b431
032ac 48834a1002                     or         qword ptr [rdx + 0x10], 2
032b1 48ba186e105c00000000           movabs     rdx, 0x5c106e18
032bb 488382b000000001               add        qword ptr [rdx + 0xb0], 1
032c3 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
032cd 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
032d0 83c102                         add        ecx, 2
032d3 894a78                         mov        dword ptr [rdx + 0x78], ecx
032d6 81e1feff1f00                   and        ecx, 0x1ffffe
032dc 85c9                           test       ecx, ecx
032de 0f849b230000                   je         0x7f63d419d7ff
032e4 48ba908030e300000000           movabs     rdx, 0xe3308090
032ee 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
032f8 488b12                         mov        rdx, qword ptr [rdx]
032fb 48c1ea2a                       shr        rdx, 0x2a
032ff 48c1e209                       shl        rdx, 9
03303 41ba0000005c                   mov        r10d, 0x5c000000
03309 4903d2                         add        rdx, r10
0330c 41ba17000000                   mov        r10d, 0x17
03312 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03316 7435                           je         0x7f63d419b4cd
03318 4983c202                       add        r10, 2
0331c 4983fa1b                       cmp        r10, 0x1b
03320 75f0                           jne        0x7f63d419b492
03322 41ba17000000                   mov        r10d, 0x17
03328 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
0332d 7412                           je         0x7f63d419b4c1
0332f 4983c202                       add        r10, 2
03333 4983fa1b                       cmp        r10, 0x1b
03337 75ef                           jne        0x7f63d419b4a8
03339 41ba16000000                   mov        r10d, 0x16
0333f eb10                           jmp        0x7f63d419b4d1
03341 50                             push       rax
03342 4833c0                         xor        rax, rax
03345 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0334a 58                             pop        rax
0334b ebbf                           jmp        0x7f63d419b48c
0334d 4983c201                       add        r10, 1
03351 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03356 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
03360 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03363 83c102                         add        ecx, 2
03366 894a78                         mov        dword ptr [rdx + 0x78], ecx
03369 81e1feff1f00                   and        ecx, 0x1ffffe
0336f 85c9                           test       ecx, ecx
03371 0f8429230000                   je         0x7f63d419d820
03377 48baf0c178c8637f0000           movabs     rdx, 0x7f63c878c1f0
03381 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
03387 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
03391 ff8208010000                   inc        dword ptr [rdx + 0x108]
03397 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
033a1 ff8228010000                   inc        dword ptr [rdx + 0x128]
033a7 48ba407830e300000000           movabs     rdx, 0xe3307840
033b1 48b9a0c778c8637f0000           movabs     rcx, 0x7f63c878c7a0
033bb 488b12                         mov        rdx, qword ptr [rdx]
033be 48c1ea2a                       shr        rdx, 0x2a
033c2 48c1e209                       shl        rdx, 9
033c6 41ba0000005c                   mov        r10d, 0x5c000000
033cc 4903d2                         add        rdx, r10
033cf 41ba28000000                   mov        r10d, 0x28
033d5 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
033d9 7435                           je         0x7f63d419b590
033db 4983c202                       add        r10, 2
033df 4983fa2c                       cmp        r10, 0x2c
033e3 75f0                           jne        0x7f63d419b555
033e5 41ba28000000                   mov        r10d, 0x28
033eb 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
033f0 7412                           je         0x7f63d419b584
033f2 4983c202                       add        r10, 2
033f6 4983fa2c                       cmp        r10, 0x2c
033fa 75ef                           jne        0x7f63d419b56b
033fc 41ba27000000                   mov        r10d, 0x27
03402 eb10                           jmp        0x7f63d419b594
03404 50                             push       rax
03405 4833c0                         xor        rax, rax
03408 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
0340d 58                             pop        rax
0340e ebbf                           jmp        0x7f63d419b54f
03410 4983c201                       add        r10, 1
03414 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03419 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
03423 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03426 83c102                         add        ecx, 2
03429 894a78                         mov        dword ptr [rdx + 0x78], ecx
0342c 81e1feff1f00                   and        ecx, 0x1ffffe
03432 85c9                           test       ecx, ecx
03434 0f8487220000                   je         0x7f63d419d841
0343a 48ba20c578c8637f0000           movabs     rdx, 0x7f63c878c520
03444 ff82b0000000                   inc        dword ptr [rdx + 0xb0]
0344a 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
03454 488d9288010000                 lea        rdx, [rdx + 0x188]
0345b 4885c0                         test       rax, rax
0345e 7515                           jne        0x7f63d419b5f5
03460 f6421801                       test       byte ptr [rdx + 0x18], 1
03464 0f8539000000                   jne        0x7f63d419b623
0346a f048834a1801                   lock or    qword ptr [rdx + 0x18], 1
03470 e92e000000                     jmp        0x7f63d419b623
03475 488b08                         mov        rcx, qword ptr [rax]
03478 48c1e92a                       shr        rcx, 0x2a
0347c 48c1e109                       shl        rcx, 9
03480 41ba0000005c                   mov        r10d, 0x5c000000
03486 4903ca                         add        rcx, r10
03489 4c8bd1                         mov        r10, rcx
0348c 48334a18                       xor        rcx, qword ptr [rdx + 0x18]
03490 48f7c1fcffffff                 test       rcx, -4
03497 740a                           je         0x7f63d419b623
03499 f6c102                         test       cl, 2
0349c 7505                           jne        0x7f63d419b623
0349e 48834a1802                     or         qword ptr [rdx + 0x18], 2
034a3 48baa0c778c8637f0000           movabs     rdx, 0x7f63c878c7a0
034ad 4883827801000001               add        qword ptr [rdx + 0x178], 1
034b5 48ba00cb78c8637f0000           movabs     rdx, 0x7f63c878cb00
034bf 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
034c2 83c102                         add        ecx, 2
034c5 894a78                         mov        dword ptr [rdx + 0x78], ecx
034c8 81e1feff1f00                   and        ecx, 0x1ffffe
034ce 85c9                           test       ecx, ecx
034d0 0f840c220000                   je         0x7f63d419d862
034d6 4885c0                         test       rax, rax
034d9 49b800cb78c8637f0000           movabs     r8, 0x7f63c878cb00
034e3 750d                           jne        0x7f63d419b672
034e5 418088d900000001               or         byte ptr [r8 + 0xd9], 1
034ed e98b000000                     jmp        0x7f63d419b6fd
034f2 488b30                         mov        rsi, qword ptr [rax]
034f5 48c1ee2a                       shr        rsi, 0x2a
034f9 48c1e609                       shl        rsi, 9
034fd 41ba0000005c                   mov        r10d, 0x5c000000
03503 4903f2                         add        rsi, r10
03506 41ba1d000000                   mov        r10d, 0x1d
0350c 4b3b34d0                       cmp        rsi, qword ptr [r8 + r10*8]
03510 7435                           je         0x7f63d419b6c7
03512 4983c202                       add        r10, 2
03516 4983fa21                       cmp        r10, 0x21
0351a 75f0                           jne        0x7f63d419b68c
0351c 41ba1d000000                   mov        r10d, 0x1d
03522 4b833cd000                     cmp        qword ptr [r8 + r10*8], 0
03527 7412                           je         0x7f63d419b6bb
03529 4983c202                       add        r10, 2
0352d 4983fa21                       cmp        r10, 0x21
03531 75ef                           jne        0x7f63d419b6a2
03533 41ba1c000000                   mov        r10d, 0x1c
03539 eb10                           jmp        0x7f63d419b6cb
0353b 50                             push       rax
0353c 4833c0                         xor        rax, rax
0353f 4b0fb134d0                     cmpxchg    qword ptr [r8 + r10*8], rsi
03544 58                             pop        rax
03545 ebbf                           jmp        0x7f63d419b686
03547 4983c201                       add        r10, 1
0354b 4b8304d001                     add        qword ptr [r8 + r10*8], 1
03550 48be0014045c00000000           movabs     rsi, 0x5c041400
0355a 4c8b00                         mov        r8, qword ptr [rax]
0355d 49c1e82a                       shr        r8, 0x2a
03561 49c1e009                       shl        r8, 9
03565 41ba0000005c                   mov        r10d, 0x5c000000
0356b 4d03c2                         add        r8, r10
0356e 493b7038                       cmp        rsi, qword ptr [r8 + 0x38]
03572 0f858b210000                   jne        0x7f63d419d883
03578 e900000000                     jmp        0x7f63d419b6fd
0357d 488bd0                         mov        rdx, rax
03580 48b900cb78c8637f0000           movabs     rcx, 0x7f63c878cb00
0358a 4883811001000001               add        qword ptr [rcx + 0x110], 1
03592 48b9a0ce145c00000000           movabs     rcx, 0x5c14cea0
0359c 448b4178                       mov        r8d, dword ptr [rcx + 0x78]
035a0 4183c002                       add        r8d, 2
035a4 44894178                       mov        dword ptr [rcx + 0x78], r8d
035a8 4181e0feff1f00                 and        r8d, 0x1ffffe
035af 4585c0                         test       r8d, r8d
035b2 0f8468210000                   je         0x7f63d419d8a0
035b8 8b4a08                         mov        ecx, dword ptr [rdx + 8]
035bb 49b8a0ce145c00000000           movabs     r8, 0x5c14cea0
035c5 498380b000000001               add        qword ptr [r8 + 0xb0], 1
035cd 83e907                         sub        ecx, 7
035d0 49b8981d23e200000000           movabs     r8, 0xe2231d98
035da 41b800000000                   mov        r8d, 0
035e0 413bd8                         cmp        ebx, r8d
035e3 0f8c71210000                   jl         0x7f63d419d8da
035e9 3bd9                           cmp        ebx, ecx
035eb 0f8d8a210000                   jge        0x7f63d419d8fb
035f1 488bcb                         mov        rcx, rbx
035f4 48be00b722e200000000           movabs     rsi, 0xe222b700
035fe 4c8bc6                         mov        r8, rsi
03601 49b900cb78c8637f0000           movabs     r9, 0x7f63c878cb00
0360b 4d8b00                         mov        r8, qword ptr [r8]
0360e 49c1e82a                       shr        r8, 0x2a
03612 49c1e009                       shl        r8, 9
03616 41ba0000005c                   mov        r10d, 0x5c000000
0361c 4d03c2                         add        r8, r10
0361f 41ba25000000                   mov        r10d, 0x25
03625 4f3b04d1                       cmp        r8, qword ptr [r9 + r10*8]
03629 7435                           je         0x7f63d419b7e0
0362b 4983c202                       add        r10, 2
0362f 4983fa29                       cmp        r10, 0x29
03633 75f0                           jne        0x7f63d419b7a5
03635 41ba25000000                   mov        r10d, 0x25
0363b 4b833cd100                     cmp        qword ptr [r9 + r10*8], 0
03640 7412                           je         0x7f63d419b7d4
03642 4983c202                       add        r10, 2
03646 4983fa29                       cmp        r10, 0x29
0364a 75ef                           jne        0x7f63d419b7bb
0364c 41ba24000000                   mov        r10d, 0x24
03652 eb10                           jmp        0x7f63d419b7e4
03654 50                             push       rax
03655 4833c0                         xor        rax, rax
03658 4f0fb104d1                     cmpxchg    qword ptr [r9 + r10*8], r8
0365d 58                             pop        rax
0365e ebbf                           jmp        0x7f63d419b79f
03660 4983c201                       add        r10, 1
03664 4b8304d101                     add        qword ptr [r9 + r10*8], 1
03669 4863c9                         movsxd     rcx, ecx
0366c 41ba0c000000                   mov        r10d, 0xc
03672 4903ca                         add        rcx, r10
03675 41b800000000                   mov        r8d, 0
0367b 899c2498020000                 mov        dword ptr [rsp + 0x298], ebx
03682 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0368a 90                             nop        
0368b 90                             nop        
0368c 90                             nop        
0368d 90                             nop        
0368e 90                             nop        
0368f e84c7a5a07                     call       0x7f63db743260
03694 0f1f84008c370013               nop        dword ptr [rax + rax + 0x1300378c]
0369c 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
036a6 488386b007000001               add        qword ptr [rsi + 0x7b0], 1
036ae 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
036b6 8b942494020000                 mov        edx, dword ptr [rsp + 0x294]
036bd 488bc8                         mov        rcx, rax
036c0 90                             nop        
036c1 90                             nop        
036c2 90                             nop        
036c3 90                             nop        
036c4 90                             nop        
036c5 90                             nop        
036c6 90                             nop        
036c7 e814845a07                     call       0x7f63db743c60
036cc 0f1f8400c4370014               nop        dword ptr [rax + rax + 0x140037c4]
036d4 8bbc2494020000                 mov        edi, dword ptr [rsp + 0x294]
036db 83c708                         add        edi, 8
036de 8b9c2498020000                 mov        ebx, dword ptr [rsp + 0x298]
036e5 83c308                         add        ebx, 8
036e8 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
036ef be02000000                     mov        esi, 2
036f4 7c05                           jl         0x7f63d419b87b
036f6 be00000000                     mov        esi, 0
036fb 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
03705 8b4a7c                         mov        ecx, dword ptr [rdx + 0x7c]
03708 03ce                           add        ecx, esi
0370a 894a7c                         mov        dword ptr [rdx + 0x7c], ecx
0370d 85f6                           test       esi, esi
0370f 7505                           jne        0x7f63d419b896
03711 b902000000                     mov        ecx, 2
03716 81e1fe3f0000                   and        ecx, 0x3ffe
0371c 85c9                           test       ecx, ecx
0371e 0f8478200000                   je         0x7f63d419d91c
03724 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
03728 418502                         test       dword ptr [r10], eax
0372b 3bbc249c020000                 cmp        edi, dword ptr [rsp + 0x29c]
03732 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0373c bac0070000                     mov        edx, 0x7c0
03741 7c05                           jl         0x7f63d419b8c8
03743 bad0070000                     mov        edx, 0x7d0
03748 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
0374c 488d4901                       lea        rcx, [rcx + 1]
03750 48890c16                       mov        qword ptr [rsi + rdx], rcx
03754 0f8c96faffff                   jl         0x7f63d419b370
0375a 448bac249c020000               mov        r13d, dword ptr [rsp + 0x29c]
03762 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0376c ff86e0070000                   inc        dword ptr [rsi + 0x7e0]
03772 e9970a0000                     jmp        0x7f63d419c38e
03777 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
03781 488386f807000001               add        qword ptr [rsi + 0x7f8], 1
03789 488bb42400020000               mov        rsi, qword ptr [rsp + 0x200]
03791 8b942464020000                 mov        edx, dword ptr [rsp + 0x264]
03798 488bcb                         mov        rcx, rbx
0379b 4d8bc3                         mov        r8, r11
0379e 448b8c2410020000               mov        r9d, dword ptr [rsp + 0x210]
037a6 90                             nop        
037a7 e834835a07                     call       0x7f63db743c60
037ac 0f1f8400a4380016               nop        dword ptr [rax + rax + 0x160038a4]
037b4 4c8be8                         mov        r13, rax
037b7 e9520a0000                     jmp        0x7f63d419c38e
037bc 89bc2468020000                 mov        dword ptr [rsp + 0x268], edi
037c3 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
037cb 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
037d3 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
037dd 488386d005000001               add        qword ptr [rsi + 0x5d0], 1
037e5 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
037ef 8b5678                         mov        edx, dword ptr [rsi + 0x78]
037f2 83c202                         add        edx, 2
037f5 895678                         mov        dword ptr [rsi + 0x78], edx
037f8 81e2feff1f00                   and        edx, 0x1ffffe
037fe 85d2                           test       edx, edx
03800 0f84b71f0000                   je         0x7f63d419d93d
03806 48be780238e300000000           movabs     rsi, 0xe3380278
03810 48ba08f664c8637f0000           movabs     rdx, 0x7f63c864f608
0381a 488b36                         mov        rsi, qword ptr [rsi]
0381d 48c1ee2a                       shr        rsi, 0x2a
03821 48c1e609                       shl        rsi, 9
03825 41ba0000005c                   mov        r10d, 0x5c000000
0382b 4903f2                         add        rsi, r10
0382e 41ba17000000                   mov        r10d, 0x17
03834 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03838 7435                           je         0x7f63d419b9ef
0383a 4983c202                       add        r10, 2
0383e 4983fa1b                       cmp        r10, 0x1b
03842 75f0                           jne        0x7f63d419b9b4
03844 41ba17000000                   mov        r10d, 0x17
0384a 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
0384f 7412                           je         0x7f63d419b9e3
03851 4983c202                       add        r10, 2
03855 4983fa1b                       cmp        r10, 0x1b
03859 75ef                           jne        0x7f63d419b9ca
0385b 41ba16000000                   mov        r10d, 0x16
03861 eb10                           jmp        0x7f63d419b9f3
03863 50                             push       rax
03864 4833c0                         xor        rax, rax
03867 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0386c 58                             pop        rax
0386d ebbf                           jmp        0x7f63d419b9ae
0386f 4983c201                       add        r10, 1
03873 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03878 448b5808                       mov        r11d, dword ptr [rax + 8]
0387c 48be08f664c8637f0000           movabs     rsi, 0x7f63c864f608
03886 488386e000000001               add        qword ptr [rsi + 0xe0], 1
0388e 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
03898 8b5678                         mov        edx, dword ptr [rsi + 0x78]
0389b 83c202                         add        edx, 2
0389e 895678                         mov        dword ptr [rsi + 0x78], edx
038a1 81e2feff1f00                   and        edx, 0x1ffffe
038a7 85d2                           test       edx, edx
038a9 0f84481f0000                   je         0x7f63d419d977
038af 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
038b9 4883861001000001               add        qword ptr [rsi + 0x110], 1
038c1 498bf3                         mov        rsi, r11
038c4 83ee0f                         sub        esi, 0xf
038c7 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
038d1 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
038d4 83c102                         add        ecx, 2
038d7 894a78                         mov        dword ptr [rdx + 0x78], ecx
038da 81e1feff1f00                   and        ecx, 0x1ffffe
038e0 85c9                           test       ecx, ecx
038e2 0f84301f0000                   je         0x7f63d419d998
038e8 48bac8e164c8637f0000           movabs     rdx, 0x7f63c864e1c8
038f2 488382b000000001               add        qword ptr [rdx + 0xb0], 1
038fa 48ba0000000000000000           movabs     rdx, 0
03904 ba00000000                     mov        edx, 0
03909 3bda                           cmp        ebx, edx
0390b 0f8c281f0000                   jl         0x7f63d419d9b9
03911 3bde                           cmp        ebx, esi
03913 0f8d411f0000                   jge        0x7f63d419d9da
03919 48be780238e300000000           movabs     rsi, 0xe3380278
03923 488bd6                         mov        rdx, rsi
03926 48b908f664c8637f0000           movabs     rcx, 0x7f63c864f608
03930 488b12                         mov        rdx, qword ptr [rdx]
03933 48c1ea2a                       shr        rdx, 0x2a
03937 48c1e209                       shl        rdx, 9
0393b 41ba0000005c                   mov        r10d, 0x5c000000
03941 4903d2                         add        rdx, r10
03944 41ba25000000                   mov        r10d, 0x25
0394a 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
0394e 7435                           je         0x7f63d419bb05
03950 4983c202                       add        r10, 2
03954 4983fa29                       cmp        r10, 0x29
03958 75f0                           jne        0x7f63d419baca
0395a 41ba25000000                   mov        r10d, 0x25
03960 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03965 7412                           je         0x7f63d419baf9
03967 4983c202                       add        r10, 2
0396b 4983fa29                       cmp        r10, 0x29
0396f 75ef                           jne        0x7f63d419bae0
03971 41ba24000000                   mov        r10d, 0x24
03977 eb10                           jmp        0x7f63d419bb09
03979 50                             push       rax
0397a 4833c0                         xor        rax, rax
0397d 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03982 58                             pop        rax
03983 ebbf                           jmp        0x7f63d419bac4
03985 4983c201                       add        r10, 1
03989 4a8304d101                     add        qword ptr [rcx + r10*8], 1
0398e 48bad0e264c8637f0000           movabs     rdx, 0x7f63c864e2d0
03998 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
0399b 83c102                         add        ecx, 2
0399e 894a78                         mov        dword ptr [rdx + 0x78], ecx
039a1 81e1feff1f00                   and        ecx, 0x1ffffe
039a7 85c9                           test       ecx, ecx
039a9 0f84cc1e0000                   je         0x7f63d419d9fb
039af 48bad0e264c8637f0000           movabs     rdx, 0x7f63c864e2d0
039b9 488382b000000001               add        qword ptr [rdx + 0xb0], 1
039c1 48be00e464c8637f0000           movabs     rsi, 0x7f63c864e400
039cb 8b5678                         mov        edx, dword ptr [rsi + 0x78]
039ce 83c202                         add        edx, 2
039d1 895678                         mov        dword ptr [rsi + 0x78], edx
039d4 81e2feff1f00                   and        edx, 0x1ffffe
039da 85d2                           test       edx, edx
039dc 0f84ba1e0000                   je         0x7f63d419da1c
039e2 48be00e464c8637f0000           movabs     rsi, 0x7f63c864e400
039ec ff86c0000000                   inc        dword ptr [rsi + 0xc0]
039f2 44899c24a0020000               mov        dword ptr [rsp + 0x2a0], r11d
039fa 48be90d539e300000000           movabs     rsi, 0xe339d590
03a04 488bd6                         mov        rdx, rsi
03a07 48b908f664c8637f0000           movabs     rcx, 0x7f63c864f608
03a11 4883816001000001               add        qword ptr [rcx + 0x160], 1
03a19 48bad8f764c8637f0000           movabs     rdx, 0x7f63c864f7d8
03a23 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03a26 83c102                         add        ecx, 2
03a29 894a78                         mov        dword ptr [rdx + 0x78], ecx
03a2c 81e1feff1f00                   and        ecx, 0x1ffffe
03a32 85c9                           test       ecx, ecx
03a34 0f84831e0000                   je         0x7f63d419da3d
03a3a 488bd6                         mov        rdx, rsi
03a3d 48b9d8f764c8637f0000           movabs     rcx, 0x7f63c864f7d8
03a47 488381b000000001               add        qword ptr [rcx + 0xb0], 1
03a4f 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
03a59 8b4a78                         mov        ecx, dword ptr [rdx + 0x78]
03a5c 83c102                         add        ecx, 2
03a5f 894a78                         mov        dword ptr [rdx + 0x78], ecx
03a62 81e1feff1f00                   and        ecx, 0x1ffffe
03a68 85c9                           test       ecx, ecx
03a6a 0f846e1e0000                   je         0x7f63d419da5e
03a70 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
03a7a 488382c000000001               add        qword ptr [rdx + 0xc0], 1
03a82 48beb8ec64c8637f0000           movabs     rsi, 0x7f63c864ecb8
03a8c 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03a8f 83c202                         add        edx, 2
03a92 895678                         mov        dword ptr [rsi + 0x78], edx
03a95 81e2feff1f00                   and        edx, 0x1ffffe
03a9b 85d2                           test       edx, edx
03a9d 0f845c1e0000                   je         0x7f63d419da7f
03aa3 48be780238e300000000           movabs     rsi, 0xe3380278
03aad 488bd6                         mov        rdx, rsi
03ab0 48b9c0f864c8637f0000           movabs     rcx, 0x7f63c864f8c0
03aba 488b12                         mov        rdx, qword ptr [rdx]
03abd 48c1ea2a                       shr        rdx, 0x2a
03ac1 48c1e209                       shl        rdx, 9
03ac5 41ba0000005c                   mov        r10d, 0x5c000000
03acb 4903d2                         add        rdx, r10
03ace 41ba1d000000                   mov        r10d, 0x1d
03ad4 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
03ad8 7435                           je         0x7f63d419bc8f
03ada 4983c202                       add        r10, 2
03ade 4983fa21                       cmp        r10, 0x21
03ae2 75f0                           jne        0x7f63d419bc54
03ae4 41ba1d000000                   mov        r10d, 0x1d
03aea 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
03aef 7412                           je         0x7f63d419bc83
03af1 4983c202                       add        r10, 2
03af5 4983fa21                       cmp        r10, 0x21
03af9 75ef                           jne        0x7f63d419bc6a
03afb 41ba1c000000                   mov        r10d, 0x1c
03b01 eb10                           jmp        0x7f63d419bc93
03b03 50                             push       rax
03b04 4833c0                         xor        rax, rax
03b07 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
03b0c 58                             pop        rax
03b0d ebbf                           jmp        0x7f63d419bc4e
03b0f 4983c201                       add        r10, 1
03b13 4a8304d101                     add        qword ptr [rcx + r10*8], 1
03b18 48bac0f864c8637f0000           movabs     rdx, 0x7f63c864f8c0
03b22 488b36                         mov        rsi, qword ptr [rsi]
03b25 48c1ee2a                       shr        rsi, 0x2a
03b29 48c1e609                       shl        rsi, 9
03b2d 41ba0000005c                   mov        r10d, 0x5c000000
03b33 4903f2                         add        rsi, r10
03b36 41ba23000000                   mov        r10d, 0x23
03b3c 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03b40 7435                           je         0x7f63d419bcf7
03b42 4983c202                       add        r10, 2
03b46 4983fa27                       cmp        r10, 0x27
03b4a 75f0                           jne        0x7f63d419bcbc
03b4c 41ba23000000                   mov        r10d, 0x23
03b52 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03b57 7412                           je         0x7f63d419bceb
03b59 4983c202                       add        r10, 2
03b5d 4983fa27                       cmp        r10, 0x27
03b61 75ef                           jne        0x7f63d419bcd2
03b63 41ba22000000                   mov        r10d, 0x22
03b69 eb10                           jmp        0x7f63d419bcfb
03b6b 50                             push       rax
03b6c 4833c0                         xor        rax, rax
03b6f 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03b74 58                             pop        rax
03b75 ebbf                           jmp        0x7f63d419bcb6
03b77 4983c201                       add        r10, 1
03b7b 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03b80 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
03b8a 4883864001000001               add        qword ptr [rsi + 0x140], 1
03b92 48be80ed64c8637f0000           movabs     rsi, 0x7f63c864ed80
03b9c 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03b9f 83c202                         add        edx, 2
03ba2 895678                         mov        dword ptr [rsi + 0x78], edx
03ba5 81e2feff1f00                   and        edx, 0x1ffffe
03bab 85d2                           test       edx, edx
03bad 0f846d1d0000                   je         0x7f63d419daa0
03bb3 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
03bbd 4883865001000001               add        qword ptr [rsi + 0x150], 1
03bc5 4863db                         movsxd     rbx, ebx
03bc8 be0c000000                     mov        esi, 0xc
03bcd 4c8bcb                         mov        r9, rbx
03bd0 4c03ce                         add        r9, rsi
03bd3 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
03bdd 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03be0 83c202                         add        edx, 2
03be3 895678                         mov        dword ptr [rsi + 0x78], edx
03be6 81e2feff1f00                   and        edx, 0x1ffffe
03bec 85d2                           test       edx, edx
03bee 0f844d1d0000                   je         0x7f63d419dac1
03bf4 48be08df64c8637f0000           movabs     rsi, 0x7f63c864df08
03bfe 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03c06 48be88e064c8637f0000           movabs     rsi, 0x7f63c864e088
03c10 8b5678                         mov        edx, dword ptr [rsi + 0x78]
03c13 83c202                         add        edx, 2
03c16 895678                         mov        dword ptr [rsi + 0x78], edx
03c19 81e2feff1f00                   and        edx, 0x1ffffe
03c1f 85d2                           test       edx, edx
03c21 0f843b1d0000                   je         0x7f63d419dae2
03c27 48bec0f864c8637f0000           movabs     rsi, 0x7f63c864f8c0
03c31 4883867001000001               add        qword ptr [rsi + 0x170], 1
03c39 48be60d03ae300000000           movabs     rsi, 0xe33ad060
03c43 48bec00238e300000000           movabs     rsi, 0xe33802c0
03c4d ba02000000                     mov        edx, 2
03c52 b910000000                     mov        ecx, 0x10
03c57 4c8bc0                         mov        r8, rax
03c5a bf00000000                     mov        edi, 0
03c5f 48890424                       mov        qword ptr [rsp], rax
03c63 48895c2408                     mov        qword ptr [rsp + 8], rbx
03c68 49ba780238e300000000           movabs     r10, 0xe3380278
03c72 4c89542410                     mov        qword ptr [rsp + 0x10], r10
03c77 49ba60d03ae300000000           movabs     r10, 0xe33ad060
03c81 4c89542418                     mov        qword ptr [rsp + 0x18], r10
03c86 4889842400020000               mov        qword ptr [rsp + 0x200], rax
03c8e 90                             nop        
03c8f e84c7e5a07                     call       0x7f63db743c60
03c94 0f1f84008c3d0017               nop        dword ptr [rax + rax + 0x17003d8c]
03c9c 4885c0                         test       rax, rax
03c9f 48bbc0f864c8637f0000           movabs     rbx, 0x7f63c864f8c0
03ca9 750c                           jne        0x7f63d419be37
03cab 808b7901000001                 or         byte ptr [rbx + 0x179], 1
03cb2 e98b000000                     jmp        0x7f63d419bec2
03cb7 488b38                         mov        rdi, qword ptr [rax]
03cba 48c1ef2a                       shr        rdi, 0x2a
03cbe 48c1e709                       shl        rdi, 9
03cc2 41ba0000005c                   mov        r10d, 0x5c000000
03cc8 4903fa                         add        rdi, r10
03ccb 41ba31000000                   mov        r10d, 0x31
03cd1 4a3b3cd3                       cmp        rdi, qword ptr [rbx + r10*8]
03cd5 7435                           je         0x7f63d419be8c
03cd7 4983c202                       add        r10, 2
03cdb 4983fa35                       cmp        r10, 0x35
03cdf 75f0                           jne        0x7f63d419be51
03ce1 41ba31000000                   mov        r10d, 0x31
03ce7 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03cec 7412                           je         0x7f63d419be80
03cee 4983c202                       add        r10, 2
03cf2 4983fa35                       cmp        r10, 0x35
03cf6 75ef                           jne        0x7f63d419be67
03cf8 41ba30000000                   mov        r10d, 0x30
03cfe eb10                           jmp        0x7f63d419be90
03d00 50                             push       rax
03d01 4833c0                         xor        rax, rax
03d04 4a0fb13cd3                     cmpxchg    qword ptr [rbx + r10*8], rdi
03d09 58                             pop        rax
03d0a ebbf                           jmp        0x7f63d419be4b
03d0c 4983c201                       add        r10, 1
03d10 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03d15 48bf00ec145c00000000           movabs     rdi, 0x5c14ec00
03d1f 488b18                         mov        rbx, qword ptr [rax]
03d22 48c1eb2a                       shr        rbx, 0x2a
03d26 48c1e309                       shl        rbx, 9
03d2a 41ba0000005c                   mov        r10d, 0x5c000000
03d30 4903da                         add        rbx, r10
03d33 483b7b58                       cmp        rdi, qword ptr [rbx + 0x58]
03d37 0f85461c0000                   jne        0x7f63d419db03
03d3d e900000000                     jmp        0x7f63d419bec2
03d42 488bf8                         mov        rdi, rax
03d45 4889bc24a8020000               mov        qword ptr [rsp + 0x2a8], rdi
03d4d 483b07                         cmp        rax, qword ptr [rdi]
03d50 488bf7                         mov        rsi, rdi
03d53 48bbd0d263c8637f0000           movabs     rbx, 0x7f63c863d2d0
03d5d 488b36                         mov        rsi, qword ptr [rsi]
03d60 48c1ee2a                       shr        rsi, 0x2a
03d64 48c1e609                       shl        rsi, 9
03d68 41ba0000005c                   mov        r10d, 0x5c000000
03d6e 4903f2                         add        rsi, r10
03d71 41babd000000                   mov        r10d, 0xbd
03d77 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03d7b 743b                           je         0x7f63d419bf38
03d7d 4983c202                       add        r10, 2
03d81 4981fac1000000                 cmp        r10, 0xc1
03d88 75ed                           jne        0x7f63d419bef7
03d8a 41babd000000                   mov        r10d, 0xbd
03d90 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03d95 7415                           je         0x7f63d419bf2c
03d97 4983c202                       add        r10, 2
03d9b 4981fac1000000                 cmp        r10, 0xc1
03da2 75ec                           jne        0x7f63d419bf10
03da4 41babc000000                   mov        r10d, 0xbc
03daa eb10                           jmp        0x7f63d419bf3c
03dac 50                             push       rax
03dad 4833c0                         xor        rax, rax
03db0 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03db5 58                             pop        rax
03db6 ebb9                           jmp        0x7f63d419bef1
03db8 4983c201                       add        r10, 1
03dbc 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03dc1 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
03dcb 8b5e78                         mov        ebx, dword ptr [rsi + 0x78]
03dce 83c302                         add        ebx, 2
03dd1 895e78                         mov        dword ptr [rsi + 0x78], ebx
03dd4 81e3feff1f00                   and        ebx, 0x1ffffe
03dda 85db                           test       ebx, ebx
03ddc 0f84d71b0000                   je         0x7f63d419db39
03de2 488bf7                         mov        rsi, rdi
03de5 48bb100365c8637f0000           movabs     rbx, 0x7f63c8650310
03def 488b36                         mov        rsi, qword ptr [rsi]
03df2 48c1ee2a                       shr        rsi, 0x2a
03df6 48c1e609                       shl        rsi, 9
03dfa 41ba0000005c                   mov        r10d, 0x5c000000
03e00 4903f2                         add        rsi, r10
03e03 41ba17000000                   mov        r10d, 0x17
03e09 4a3b34d3                       cmp        rsi, qword ptr [rbx + r10*8]
03e0d 7435                           je         0x7f63d419bfc4
03e0f 4983c202                       add        r10, 2
03e13 4983fa1b                       cmp        r10, 0x1b
03e17 75f0                           jne        0x7f63d419bf89
03e19 41ba17000000                   mov        r10d, 0x17
03e1f 4a833cd300                     cmp        qword ptr [rbx + r10*8], 0
03e24 7412                           je         0x7f63d419bfb8
03e26 4983c202                       add        r10, 2
03e2a 4983fa1b                       cmp        r10, 0x1b
03e2e 75ef                           jne        0x7f63d419bf9f
03e30 41ba16000000                   mov        r10d, 0x16
03e36 eb10                           jmp        0x7f63d419bfc8
03e38 50                             push       rax
03e39 4833c0                         xor        rax, rax
03e3c 4a0fb134d3                     cmpxchg    qword ptr [rbx + r10*8], rsi
03e41 58                             pop        rax
03e42 ebbf                           jmp        0x7f63d419bf83
03e44 4983c201                       add        r10, 1
03e48 4a8304d301                     add        qword ptr [rbx + r10*8], 1
03e4d 488bf7                         mov        rsi, rdi
03e50 90                             nop        
03e51 90                             nop        
03e52 90                             nop        
03e53 90                             nop        
03e54 90                             nop        
03e55 48b8405814a9637f0000           movabs     rax, 0x7f63a9145840
03e5f e87c775a07                     call       0x7f63db743760
03e64 0f1f84005c3f0018               nop        dword ptr [rax + rax + 0x18003f5c]
03e6c 48be100365c8637f0000           movabs     rsi, 0x7f63c8650310
03e76 488386e000000001               add        qword ptr [rsi + 0xe0], 1
03e7e 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
03e88 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03e8b 83c702                         add        edi, 2
03e8e 897e78                         mov        dword ptr [rsi + 0x78], edi
03e91 81e7feff1f00                   and        edi, 0x1ffffe
03e97 85ff                           test       edi, edi
03e99 0f843b1b0000                   je         0x7f63d419db5a
03e9f 448b9c24a0020000               mov        r11d, dword ptr [rsp + 0x2a0]
03ea7 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
03eaf 48be38eb64c8637f0000           movabs     rsi, 0x7f63c864eb38
03eb9 4883861001000001               add        qword ptr [rsi + 0x110], 1
03ec1 ffc8                           dec        eax
03ec3 442bd8                         sub        r11d, eax
03ec6 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
03ed0 8b7e78                         mov        edi, dword ptr [rsi + 0x78]
03ed3 83c702                         add        edi, 2
03ed6 897e78                         mov        dword ptr [rsi + 0x78], edi
03ed9 81e7feff1f00                   and        edi, 0x1ffffe
03edf 85ff                           test       edi, edi
03ee1 0f84141b0000                   je         0x7f63d419db7b
03ee7 48bec8e164c8637f0000           movabs     rsi, 0x7f63c864e1c8
03ef1 488386b000000001               add        qword ptr [rsi + 0xb0], 1
03ef9 48be0000000000000000           movabs     rsi, 0
03f03 be00000000                     mov        esi, 0
03f08 443bee                         cmp        r13d, esi
03f0b 0f8c0b1b0000                   jl         0x7f63d419db9c
03f11 453beb                         cmp        r13d, r11d
03f14 0f8d231b0000                   jge        0x7f63d419dbbd
03f1a 498bfd                         mov        rdi, r13
03f1d 89bc24a4020000                 mov        dword ptr [rsp + 0x2a4], edi
03f24 488bbc24a8020000               mov        rdi, qword ptr [rsp + 0x2a8]
03f2c 4489ac2464020000               mov        dword ptr [rsp + 0x264], r13d
03f34 488bf7                         mov        rsi, rdi
03f37 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
03f41 488b36                         mov        rsi, qword ptr [rsi]
03f44 48c1ee2a                       shr        rsi, 0x2a
03f48 48c1e609                       shl        rsi, 9
03f4c 41ba0000005c                   mov        r10d, 0x5c000000
03f52 4903f2                         add        rsi, r10
03f55 41ba1f000000                   mov        r10d, 0x1f
03f5b 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03f5f 7435                           je         0x7f63d419c116
03f61 4983c202                       add        r10, 2
03f65 4983fa23                       cmp        r10, 0x23
03f69 75f0                           jne        0x7f63d419c0db
03f6b 41ba1f000000                   mov        r10d, 0x1f
03f71 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
03f76 7412                           je         0x7f63d419c10a
03f78 4983c202                       add        r10, 2
03f7c 4983fa23                       cmp        r10, 0x23
03f80 75ef                           jne        0x7f63d419c0f1
03f82 41ba1e000000                   mov        r10d, 0x1e
03f88 eb10                           jmp        0x7f63d419c11a
03f8a 50                             push       rax
03f8b 4833c0                         xor        rax, rax
03f8e 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
03f93 58                             pop        rax
03f94 ebbf                           jmp        0x7f63d419c0d5
03f96 4983c201                       add        r10, 1
03f9a 4a8304d201                     add        qword ptr [rdx + r10*8], 1
03f9f 488bf7                         mov        rsi, rdi
03fa2 90                             nop        
03fa3 90                             nop        
03fa4 90                             nop        
03fa5 48b8685814a9637f0000           movabs     rax, 0x7f63a9145868
03faf e82c765a07                     call       0x7f63db743760
03fb4 0f1f8400ac400019               nop        dword ptr [rax + rax + 0x190040ac]
03fbc 483b00                         cmp        rax, qword ptr [rax]
03fbf 488bf0                         mov        rsi, rax
03fc2 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
03fcc 488b36                         mov        rsi, qword ptr [rsi]
03fcf 48c1ee2a                       shr        rsi, 0x2a
03fd3 48c1e609                       shl        rsi, 9
03fd7 41ba0000005c                   mov        r10d, 0x5c000000
03fdd 4903f2                         add        rsi, r10
03fe0 41ba25000000                   mov        r10d, 0x25
03fe6 4a3b34d2                       cmp        rsi, qword ptr [rdx + r10*8]
03fea 7435                           je         0x7f63d419c1a1
03fec 4983c202                       add        r10, 2
03ff0 4983fa29                       cmp        r10, 0x29
03ff4 75f0                           jne        0x7f63d419c166
03ff6 41ba25000000                   mov        r10d, 0x25
03ffc 4a833cd200                     cmp        qword ptr [rdx + r10*8], 0
04001 7412                           je         0x7f63d419c195
04003 4983c202                       add        r10, 2
04007 4983fa29                       cmp        r10, 0x29
0400b 75ef                           jne        0x7f63d419c17c
0400d 41ba24000000                   mov        r10d, 0x24
04013 eb10                           jmp        0x7f63d419c1a5
04015 50                             push       rax
04016 4833c0                         xor        rax, rax
04019 4a0fb134d2                     cmpxchg    qword ptr [rdx + r10*8], rsi
0401e 58                             pop        rax
0401f ebbf                           jmp        0x7f63d419c160
04021 4983c201                       add        r10, 1
04025 4a8304d201                     add        qword ptr [rdx + r10*8], 1
0402a 8b7028                         mov        esi, dword ptr [rax + 0x28]
0402d 4c3b25a4571821                 cmp        r12, qword ptr [rip + 0x211857a4]
04034 0f8414000000                   je         0x7f63d419c1ce
0403a 48bf70cb44f3637f0000           movabs     rdi, 0x7f63f344cb70
04044 4883e4f0                       and        rsp, 0xfffffffffffffff0
04048 e833475920                     call       0x7f63f4730900
0404d f4                             hlt        
0404e 488bd0                         mov        rdx, rax
04051 48b9100365c8637f0000           movabs     rcx, 0x7f63c8650310
0405b 488b12                         mov        rdx, qword ptr [rdx]
0405e 48c1ea2a                       shr        rdx, 0x2a
04062 48c1e209                       shl        rdx, 9
04066 41ba0000005c                   mov        r10d, 0x5c000000
0406c 4903d2                         add        rdx, r10
0406f 41ba2b000000                   mov        r10d, 0x2b
04075 4a3b14d1                       cmp        rdx, qword ptr [rcx + r10*8]
04079 7435                           je         0x7f63d419c230
0407b 4983c202                       add        r10, 2
0407f 4983fa2f                       cmp        r10, 0x2f
04083 75f0                           jne        0x7f63d419c1f5
04085 41ba2b000000                   mov        r10d, 0x2b
0408b 4a833cd100                     cmp        qword ptr [rcx + r10*8], 0
04090 7412                           je         0x7f63d419c224
04092 4983c202                       add        r10, 2
04096 4983fa2f                       cmp        r10, 0x2f
0409a 75ef                           jne        0x7f63d419c20b
0409c 41ba2a000000                   mov        r10d, 0x2a
040a2 eb10                           jmp        0x7f63d419c234
040a4 50                             push       rax
040a5 4833c0                         xor        rax, rax
040a8 4a0fb114d1                     cmpxchg    qword ptr [rcx + r10*8], rdx
040ad 58                             pop        rax
040ae ebbf                           jmp        0x7f63d419c1ef
040b0 4983c201                       add        r10, 1
040b4 4a8304d101                     add        qword ptr [rcx + r10*8], 1
040b9 8b4808                         mov        ecx, dword ptr [rax + 8]
040bc 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
040c6 4883828001000001               add        qword ptr [rdx + 0x180], 1
040ce 48ba80ed64c8637f0000           movabs     rdx, 0x7f63c864ed80
040d8 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
040dc 4183c002                       add        r8d, 2
040e0 44894278                       mov        dword ptr [rdx + 0x78], r8d
040e4 4181e0feff1f00                 and        r8d, 0x1ffffe
040eb 4585c0                         test       r8d, r8d
040ee 0f8483190000                   je         0x7f63d419dbf7
040f4 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
040fe 4883829001000001               add        qword ptr [rdx + 0x190], 1
04106 8bbc24a4020000                 mov        edi, dword ptr [rsp + 0x2a4]
0410d 4863df                         movsxd     rbx, edi
04110 ba0c000000                     mov        edx, 0xc
04115 4c8bcb                         mov        r9, rbx
04118 4c03ca                         add        r9, rdx
0411b 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
04125 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
04129 4183c002                       add        r8d, 2
0412d 44894278                       mov        dword ptr [rdx + 0x78], r8d
04131 4181e0feff1f00                 and        r8d, 0x1ffffe
04138 4585c0                         test       r8d, r8d
0413b 0f8457190000                   je         0x7f63d419dc18
04141 48ba08df64c8637f0000           movabs     rdx, 0x7f63c864df08
0414b 488382e000000001               add        qword ptr [rdx + 0xe0], 1
04153 48ba88e064c8637f0000           movabs     rdx, 0x7f63c864e088
0415d 448b4278                       mov        r8d, dword ptr [rdx + 0x78]
04161 4183c002                       add        r8d, 2
04165 44894278                       mov        dword ptr [rdx + 0x78], r8d
04169 4181e0feff1f00                 and        r8d, 0x1ffffe
04170 4585c0                         test       r8d, r8d
04173 0f8440190000                   je         0x7f63d419dc39
04179 48ba100365c8637f0000           movabs     rdx, 0x7f63c8650310
04183 488382b001000001               add        qword ptr [rdx + 0x1b0], 1
0418b 48ba08b13ce300000000           movabs     rdx, 0xe33cb108
04195 ba02000000                     mov        edx, 2
0419a 4c8b842400020000               mov        r8, qword ptr [rsp + 0x200]
041a2 bf00000000                     mov        edi, 0
041a7 488b8424a8020000               mov        rax, qword ptr [rsp + 0x2a8]
041af 48890424                       mov        qword ptr [rsp], rax
041b3 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
041bb 4889442408                     mov        qword ptr [rsp + 8], rax
041c0 48895c2410                     mov        qword ptr [rsp + 0x10], rbx
041c5 49ba08b13ce300000000           movabs     r10, 0xe33cb108
041cf 4c89542418                     mov        qword ptr [rsp + 0x18], r10
041d4 4889842400020000               mov        qword ptr [rsp + 0x200], rax
041dc 90                             nop        
041dd 90                             nop        
041de 90                             nop        
041df e8fc785a07                     call       0x7f63db743c60
041e4 0f1f8400dc42001a               nop        dword ptr [rax + rax + 0x1a0042dc]
041ec 448bac2464020000               mov        r13d, dword ptr [rsp + 0x264]
041f4 8bb42410020000                 mov        esi, dword ptr [rsp + 0x210]
041fb 4403ee                         add        r13d, esi
041fe 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
04208 ff8610060000                   inc        dword ptr [rsi + 0x610]
0420e 8bbc2468020000                 mov        edi, dword ptr [rsp + 0x268]
04215 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0421f ff8608080000                   inc        dword ptr [rsi + 0x808]
04225 488bdf                         mov        rbx, rdi
04228 498bc5                         mov        rax, r13
0422b 8b942428020000                 mov        edx, dword ptr [rsp + 0x228]
04232 ffc2                           inc        edx
04234 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
0423e 8b4e7c                         mov        ecx, dword ptr [rsi + 0x7c]
04241 83c102                         add        ecx, 2
04244 894e7c                         mov        dword ptr [rsi + 0x7c], ecx
04247 81e1fe3f0000                   and        ecx, 0x3ffe
0424d 85c9                           test       ecx, ecx
0424f 0f8485180000                   je         0x7f63d419dc5a
04255 4d8b5730                       mov        r10, qword ptr [r15 + 0x30]
04259 418502                         test       dword ptr [r10], eax
0425c 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
04266 ff8630080000                   inc        dword ptr [rsi + 0x830]
0426c 4c8bd8                         mov        r11, rax
0426f 4c8bc3                         mov        r8, rbx
04272 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
0427a e9c1c0ffff                     jmp        0x7f63d41984c0
0427f 4585db                         test       r11d, r11d
04282 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0428c b988030000                     mov        ecx, 0x388
04291 7e05                           jle        0x7f63d419c418
04293 b998030000                     mov        ecx, 0x398
04298 4c8b040a                       mov        r8, qword ptr [rdx + rcx]
0429c 4d8d4001                       lea        r8, [r8 + 1]
042a0 4c89040a                       mov        qword ptr [rdx + rcx], r8
042a4 0f8e5f010000                   jle        0x7f63d419c589
042aa 488bbc2430020000               mov        rdi, qword ptr [rsp + 0x230]
042b2 482bf7                         sub        rsi, rdi
042b5 ba00000000                     mov        edx, 0
042ba 483bf2                         cmp        rsi, rdx
042bd 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
042c7 baa8030000                     mov        edx, 0x3a8
042cc 7d05                           jge        0x7f63d419c453
042ce bab8030000                     mov        edx, 0x3b8
042d3 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
042d7 488d4901                       lea        rcx, [rcx + 1]
042db 48890c16                       mov        qword ptr [rsi + rdx], rcx
042df 0f8d24010000                   jge        0x7f63d419c589
042e5 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
042ed 488b7230                       mov        rsi, qword ptr [rdx + 0x30]
042f1 ba00000000                     mov        edx, 0
042f6 483bf2                         cmp        rsi, rdx
042f9 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
04303 bac8030000                     mov        edx, 0x3c8
04308 7505                           jne        0x7f63d419c48f
0430a bad8030000                     mov        edx, 0x3d8
0430f 488b0c16                       mov        rcx, qword ptr [rsi + rdx]
04313 488d4901                       lea        rcx, [rcx + 1]
04317 48890c16                       mov        qword ptr [rsi + rdx], rcx
0431b 0f85e8000000                   jne        0x7f63d419c589
04321 e9ed000000                     jmp        0x7f63d419c593
04326 498bd8                         mov        rbx, r8
04329 448b9c2408020000               mov        r11d, dword ptr [rsp + 0x208]
04331 488bf0                         mov        rsi, rax
04334 488b942468010000               mov        rdx, qword ptr [rsp + 0x168]
0433c 488b842400020000               mov        rax, qword ptr [rsp + 0x200]
04344 4c8bee                         mov        r13, rsi
04347 442beb                         sub        r13d, ebx
0434a 48bed0d263c8637f0000           movabs     rsi, 0x7f63c863d2d0
04354 4883864808000001               add        qword ptr [rsi + 0x848], 1
0435c 488bf2                         mov        rsi, rdx
0435f 488bd3                         mov        rdx, rbx
04362 488bc8                         mov        rcx, rax
04365 4d8bc3                         mov        r8, r11
04368 4d8bcd                         mov        r9, r13
0436b 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
04373 4489ac24b0020000               mov        dword ptr [rsp + 0x2b0], r13d
0437b 4c894c2410                     mov        qword ptr [rsp + 0x10], r9
04380 4c89442408                     mov        qword ptr [rsp + 8], r8
04385 48890c24                       mov        qword ptr [rsp], rcx
04389 4889542418                     mov        qword ptr [rsp + 0x18], rdx
0438e 4889742420                     mov        qword ptr [rsp + 0x20], rsi
04393 488bfe                         mov        rdi, rsi
04396 488bf2                         mov        rsi, rdx
04399 488bd1                         mov        rdx, rcx
0439c 498bc8                         mov        rcx, r8
0439f 4d8bc1                         mov        r8, r9
043a2 e859595907                     call       0x7f63db731e80
043a7 85c0                           test       eax, eax
043a9 0f842b000000                   je         0x7f63d419c55a
043af 488bf8                         mov        rdi, rax
043b2 83f7ff                         xor        edi, 0xffffffff
043b5 488b0c24                       mov        rcx, qword ptr [rsp]
043b9 4c8b442408                     mov        r8, qword ptr [rsp + 8]
043be 4c8b4c2410                     mov        r9, qword ptr [rsp + 0x10]
043c3 488b542418                     mov        rdx, qword ptr [rsp + 0x18]
043c8 488b742420                     mov        rsi, qword ptr [rsp + 0x20]
043cd 442bcf                         sub        r9d, edi
043d0 03d7                           add        edx, edi
043d2 4403c7                         add        r8d, edi
043d5 e93a170000                     jmp        0x7f63d419dc94
043da 448bac24b0020000               mov        r13d, dword ptr [rsp + 0x2b0]
043e2 4403ac2408020000               add        r13d, dword ptr [rsp + 0x208]
043ea 488b942470010000               mov        rdx, qword ptr [rsp + 0x170]
043f2 44896a3c                       mov        dword ptr [rdx + 0x3c], r13d
043f6 4881c4e0020000                 add        rsp, 0x2e0
043fd 5d                             pop        rbp
043fe 493b6728                       cmp        rsp, qword ptr [r15 + 0x28]
04402 0f8732170000                   ja         0x7f63d419dcba
04408 c3                             ret        
04409 bb02000000                     mov        ebx, 2
0440e e915000000                     jmp        0x7f63d419c5a8
04413 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
0441d ff82e8030000                   inc        dword ptr [rdx + 0x3e8]
04423 bb08000000                     mov        ebx, 8
04428 899c24b4020000                 mov        dword ptr [rsp + 0x2b4], ebx
0442f 90                             nop        
04430 e92a170000                     jmp        0x7f63d419dcdf
04435 90                             nop        
04436 90                             nop        
04437 90                             nop        
04438 90                             nop        
04439 90                             nop        
0443a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04441 0f853b170000                   jne        0x7f63d419dd02
04447 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0444e 488d7828                       lea        rdi, [rax + 0x28]
04452 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04459 0f8723170000                   ja         0x7f63d419dd02
0445f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04466 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0446d 488908                         mov        qword ptr [rax], rcx
04470 4833c9                         xor        rcx, rcx
04473 48894808                       mov        qword ptr [rax + 8], rcx
04477 48894810                       mov        qword ptr [rax + 0x10], rcx
0447b 48894818                       mov        qword ptr [rax + 0x18], rcx
0447f 48894820                       mov        qword ptr [rax + 0x20], rcx
04483 90                             nop        
04484 90                             nop        
04485 90                             nop        
04486 90                             nop        
04487 90                             nop        
04488 e911170000                     jmp        0x7f63d419dd1e
0448d 90                             nop        
0448e 90                             nop        
0448f 90                             nop        
04490 90                             nop        
04491 90                             nop        
04492 498bf3                         mov        rsi, r11
04495 48898424b8020000               mov        qword ptr [rsp + 0x2b8], rax
0449d 90                             nop        
0449e 90                             nop        
0449f e83c765a07                     call       0x7f63db743c60
044a4 0f1f84009c45001c               nop        dword ptr [rax + rax + 0x1c00459c]
044ac 48bad0d263c8637f0000           movabs     rdx, 0x7f63c863d2d0
044b6 488d9210040000                 lea        rdx, [rdx + 0x410]
044bd 4885c0                         test       rax, rax
044c0 750e                           jne        0x7f63d419c650
044c2 f60201                         test       byte ptr [rdx], 1
044c5 0f8505000000                   jne        0x7f63d419c650
044cb f048830a01                     lock or    qword ptr [rdx], 1
044d0 488b9424b8020000               mov        rdx, qword ptr [rsp + 0x2b8]
044d8 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
044e2 4883812004000001               add        qword ptr [rcx + 0x420], 1
044ea 8b9424b4020000                 mov        edx, dword ptr [rsp + 0x2b4]
044f1 488bc8                         mov        rcx, rax
044f4 488bb424b8020000               mov        rsi, qword ptr [rsp + 0x2b8]
044fc 90                             nop        
044fd 90                             nop        
044fe 90                             nop        
044ff e8dc6b5a07                     call       0x7f63db743260
04504 0f1f8400fc45001d               nop        dword ptr [rax + rax + 0x1d0045fc]
0450c 488b8424b8020000               mov        rax, qword ptr [rsp + 0x2b8]
04514 e92a170000                     jmp        0x7f63d419ddc3
04519 90                             nop        
0451a 90                             nop        
0451b 90                             nop        
0451c 90                             nop        
0451d 90                             nop        
0451e 90                             nop        
0451f 90                             nop        
04520 e992160000                     jmp        0x7f63d419dd37
04525 90                             nop        
04526 90                             nop        
04527 90                             nop        
04528 90                             nop        
04529 90                             nop        
0452a 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
04531 0f85a3160000                   jne        0x7f63d419dd5a
04537 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
0453e 488d7828                       lea        rdi, [rax + 0x28]
04542 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
04549 0f878b160000                   ja         0x7f63d419dd5a
0454f 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
04556 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
0455d 488908                         mov        qword ptr [rax], rcx
04560 4833c9                         xor        rcx, rcx
04563 48894808                       mov        qword ptr [rax + 8], rcx
04567 48894810                       mov        qword ptr [rax + 0x10], rcx
0456b 48894818                       mov        qword ptr [rax + 0x18], rcx
0456f 48894820                       mov        qword ptr [rax + 0x20], rcx
04573 488bd0                         mov        rdx, rax
04576 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
04580 4883815802000001               add        qword ptr [rcx + 0x258], 1
04588 ba02000000                     mov        edx, 2
0458d 48b9006426e200000000           movabs     rcx, 0xe2266400
04597 488bf0                         mov        rsi, rax
0459a 48898424c0020000               mov        qword ptr [rsp + 0x2c0], rax
045a2 90                             nop        
045a3 90                             nop        
045a4 90                             nop        
045a5 90                             nop        
045a6 90                             nop        
045a7 e8346b5a07                     call       0x7f63db743260
045ac 0f1f8400a446001e               nop        dword ptr [rax + rax + 0x1e0046a4]
045b4 488b8424c0020000               mov        rax, qword ptr [rsp + 0x2c0]
045bc e982160000                     jmp        0x7f63d419ddc3
045c1 90                             nop        
045c2 90                             nop        
045c3 90                             nop        
045c4 90                             nop        
045c5 90                             nop        
045c6 90                             nop        
045c7 90                             nop        
045c8 e929160000                     jmp        0x7f63d419dd76
045cd 90                             nop        
045ce 90                             nop        
045cf 90                             nop        
045d0 90                             nop        
045d1 90                             nop        
045d2 80ba3001000004                 cmp        byte ptr [rdx + 0x130], 4
045d9 0f853a160000                   jne        0x7f63d419dd99
045df 498b87b8010000                 mov        rax, qword ptr [r15 + 0x1b8]
045e6 488d7828                       lea        rdi, [rax + 0x28]
045ea 493bbfc8010000                 cmp        rdi, qword ptr [r15 + 0x1c8]
045f1 0f8722160000                   ja         0x7f63d419dd99
045f7 4989bfb8010000                 mov        qword ptr [r15 + 0x1b8], rdi
045fe 488b8aa0000000                 mov        rcx, qword ptr [rdx + 0xa0]
04605 488908                         mov        qword ptr [rax], rcx
04608 4833c9                         xor        rcx, rcx
0460b 48894808                       mov        qword ptr [rax + 8], rcx
0460f 48894810                       mov        qword ptr [rax + 0x10], rcx
04613 48894818                       mov        qword ptr [rax + 0x18], rcx
04617 48894820                       mov        qword ptr [rax + 0x20], rcx
0461b 488bd0                         mov        rdx, rax
0461e 48b9d0d263c8637f0000           movabs     rcx, 0x7f63c863d2d0
04628 4883814001000001               add        qword ptr [rcx + 0x140], 1
04630 ba05000000                     mov        edx, 5
04635 48b9406426e200000000           movabs     rcx, 0xe2266440
0463f 488bf0                         mov        rsi, rax
04642 48898424c8020000               mov        qword ptr [rsp + 0x2c8], rax
0464a 90                             nop        
0464b 90                             nop        
0464c 90                             nop        
0464d 90                             nop        
0464e 90                             nop        
0464f e88c6a5a07                     call       0x7f63db743260
04654 0f1f84004c47001f               nop        dword ptr [rax + rax + 0x1f00474c]
0465c 488b8424c8020000               mov        rax, qword ptr [rsp + 0x2c8]
04664 e9da150000                     jmp        0x7f63d419ddc3
04669 8984240080feff                 mov        dword ptr [rsp - 0x18000], eax
04670 55                             push       rbp
04671 4881ece0020000                 sub        rsp, 0x2e0
04678 41817f2000000000               cmp        dword ptr [r15 + 0x20], 0
04680 7405                           je         0x7f63d419c807
04682 e8d9695907                     call       0x7f63db7331e0
04687 bf40010000                     mov        edi, 0x140
0468c 4863ff                         movsxd     rdi, edi
0468f 488b1c3e                       mov        rbx, qword ptr [rsi + rdi]
04693 48899c2480010000               mov        qword ptr [rsp + 0x180], rbx
0469b bf38010000                     mov        edi, 0x138
046a0 4863ff                         movsxd     rdi, edi
046a3 488b043e                       mov        rax, qword ptr [rsi + rdi]
046a7 4889842488010000               mov        qword ptr [rsp + 0x188], rax
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
046f6 bff8000000                     mov        edi, 0xf8
046fb 4863ff                         movsxd     rdi, edi
046fe 448b343e                       mov        r14d, dword ptr [rsi + rdi]
04702 bff0000000                     mov        edi, 0xf0
04707 4863ff                         movsxd     rdi, edi
0470a 8b3c3e                         mov        edi, dword ptr [rsi + rdi]
0470d bbe8000000                     mov        ebx, 0xe8
04712 4863db                         movsxd     rbx, ebx
04715 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04718 899c247c010000                 mov        dword ptr [rsp + 0x17c], ebx
0471f bbd8000000                     mov        ebx, 0xd8
04724 4863db                         movsxd     rbx, ebx
04727 488b041e                       mov        rax, qword ptr [rsi + rbx]
0472b 4889842498010000               mov        qword ptr [rsp + 0x198], rax
04733 bba0000000                     mov        ebx, 0xa0
04738 4863db                         movsxd     rbx, ebx
0473b 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
0473e 899c2490010000                 mov        dword ptr [rsp + 0x190], ebx
04745 bb90000000                     mov        ebx, 0x90
0474a 4863db                         movsxd     rbx, ebx
0474d 488b041e                       mov        rax, qword ptr [rsi + rbx]
04751 48898424a0010000               mov        qword ptr [rsp + 0x1a0], rax
04759 bb80000000                     mov        ebx, 0x80
0475e 4863db                         movsxd     rbx, ebx
04761 488b041e                       mov        rax, qword ptr [rsi + rbx]
04765 bb78000000                     mov        ebx, 0x78
0476a 4863db                         movsxd     rbx, ebx
0476d 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04770 899c2494010000                 mov        dword ptr [rsp + 0x194], ebx
04777 bb70000000                     mov        ebx, 0x70
0477c 4863db                         movsxd     rbx, ebx
0477f 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04782 899c24a8010000                 mov        dword ptr [rsp + 0x1a8], ebx
04789 bb68000000                     mov        ebx, 0x68
0478e 4863db                         movsxd     rbx, ebx
04791 8b1c1e                         mov        ebx, dword ptr [rsi + rbx]
04794 89bc24ac010000                 mov        dword ptr [rsp + 0x1ac], edi
0479b 488bfe                         mov        rdi, rsi
0479e 899424d4010000                 mov        dword ptr [rsp + 0x1d4], edx
047a5 48898c24e0010000               mov        qword ptr [rsp + 0x1e0], rcx
047ad 4c898424d8010000               mov        qword ptr [rsp + 0x1d8], r8
047b5 44898c24d0010000               mov        dword ptr [rsp + 0x1d0], r9d
047bd 4c899c24c8010000               mov        qword ptr [rsp + 0x1c8], r11
047c5 4c89ac24c0010000               mov        qword ptr [rsp + 0x1c0], r13
047cd 4489b424b4010000               mov        dword ptr [rsp + 0x1b4], r14d
047d5 48898424b8010000               mov        qword ptr [rsp + 0x1b8], rax
047dd 899c24b0010000                 mov        dword ptr [rsp + 0x1b0], ebx
047e4 e8c7b99720                     call       0x7f63f4b18330
047e9 0f1f840000000000               nop        dword ptr [rax + rax]
047f1 8b9c24b0010000                 mov        ebx, dword ptr [rsp + 0x1b0]
047f8 488bd3                         mov        rdx, rbx
047fb 8b9c24a8010000                 mov        ebx, dword ptr [rsp + 0x1a8]
04802 4c8bcb                         mov        r9, rbx
04805 8b9c2494010000                 mov        ebx, dword ptr [rsp + 0x194]
0480c 488bf3                         mov        rsi, rbx
0480f 488b8424b8010000               mov        rax, qword ptr [rsp + 0x1b8]
04817 488bc8                         mov        rcx, rax
0481a 488b8424a0010000               mov        rax, qword ptr [rsp + 0x1a0]
04822 4c8bc0                         mov        r8, rax
04825 8b9c2490010000                 mov        ebx, dword ptr [rsp + 0x190]
0482c 488bfb                         mov        rdi, rbx
0482f 488b842498010000               mov        rax, qword ptr [rsp + 0x198]
04837 4c8bf0                         mov        r14, rax
0483a 8b9c247c010000                 mov        ebx, dword ptr [rsp + 0x17c]
04841 4c8beb                         mov        r13, rbx
04844 8b9c24ac010000                 mov        ebx, dword ptr [rsp + 0x1ac]
0484b 8b8424b4010000                 mov        eax, dword ptr [rsp + 0x1b4]
04852 4c8bd8                         mov        r11, rax
04855 488b8424c0010000               mov        rax, qword ptr [rsp + 0x1c0]
0485d 899c24e8010000                 mov        dword ptr [rsp + 0x1e8], ebx
04864 488b9c24c8010000               mov        rbx, qword ptr [rsp + 0x1c8]
0486c 48899c2450010000               mov        qword ptr [rsp + 0x150], rbx
04874 8b9c24d0010000                 mov        ebx, dword ptr [rsp + 0x1d0]
0487b 899c2444010000                 mov        dword ptr [rsp + 0x144], ebx
04882 488b9c24d8010000               mov        rbx, qword ptr [rsp + 0x1d8]
0488a 48899c2458010000               mov        qword ptr [rsp + 0x158], rbx
04892 488b9c24e0010000               mov        rbx, qword ptr [rsp + 0x1e0]
0489a 48899c2460010000               mov        qword ptr [rsp + 0x160], rbx
048a2 8b9c24d4010000                 mov        ebx, dword ptr [rsp + 0x1d4]
048a9 899c2478010000                 mov        dword ptr [rsp + 0x178], ebx
048b0 488b9c2488010000               mov        rbx, qword ptr [rsp + 0x188]
048b8 48899c2468010000               mov        qword ptr [rsp + 0x168], rbx
048c0 488b9c2480010000               mov        rbx, qword ptr [rsp + 0x180]
048c8 48899c2470010000               mov        qword ptr [rsp + 0x170], rbx
048d0 44898c24f8010000               mov        dword ptr [rsp + 0x1f8], r9d
048d8 89b424ec010000                 mov        dword ptr [rsp + 0x1ec], esi
048df 48898c24f0010000               mov        qword ptr [rsp + 0x1f0], rcx
048e7 4c89842418020000               mov        qword ptr [rsp + 0x218], r8
048ef 89bc240c020000                 mov        dword ptr [rsp + 0x20c], edi
048f6 4c89b42420020000               mov        qword ptr [rsp + 0x220], r14
048fe 4489ac24fc010000               mov        dword ptr [rsp + 0x1fc], r13d
04906 448b8424e8010000               mov        r8d, dword ptr [rsp + 0x1e8]
0490e 44899c2408020000               mov        dword ptr [rsp + 0x208], r11d
04916 4889842400020000               mov        qword ptr [rsp + 0x200], rax
0491e e91dbaffff                     jmp        0x7f63d41984c0
04923 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
0492d 4c89542408                     mov        qword ptr [rsp + 8], r10
04932 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0493a e8216d5407                     call       0x7f63db6e37e0
0493f e939b7ffff                     jmp        0x7f63d41981fd
04944 49ba88f11ac8637f0000           movabs     r10, 0x7f63c81af188
0494e 4c89542408                     mov        qword ptr [rsp + 8], r10
04953 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0495b e8006d5407                     call       0x7f63db6e37e0
04960 e9a6b8ffff                     jmp        0x7f63d419838b
04965 e876c35407                     call       0x7f63db6e8e60
0496a 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04974 4883e4f0                       and        rsp, 0xfffffffffffffff0
04978 e8033e5920                     call       0x7f63f4730900
0497d f4                             hlt        
0497e e85dc35407                     call       0x7f63db6e8e60
04983 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0498d 4883e4f0                       and        rsp, 0xfffffffffffffff0
04991 e8ea3d5920                     call       0x7f63f4730900
04996 f4                             hlt        
04997 e844c35407                     call       0x7f63db6e8e60
0499c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
049a6 4883e4f0                       and        rsp, 0xfffffffffffffff0
049aa e8d13d5920                     call       0x7f63f4730900
049af f4                             hlt        
049b0 48891424                       mov        qword ptr [rsp], rdx
049b4 4889742408                     mov        qword ptr [rsp + 8], rsi
049b9 e822cc5407                     call       0x7f63db6e9760
049be 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
049c8 4883e4f0                       and        rsp, 0xfffffffffffffff0
049cc e8af3d5920                     call       0x7f63f4730900
049d1 f4                             hlt        
049d2 e809c35407                     call       0x7f63db6e8e60
049d7 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
049e1 4883e4f0                       and        rsp, 0xfffffffffffffff0
049e5 e8963d5920                     call       0x7f63f4730900
049ea f4                             hlt        
049eb e8f0c25407                     call       0x7f63db6e8e60
049f0 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
049fa 4883e4f0                       and        rsp, 0xfffffffffffffff0
049fe e87d3d5920                     call       0x7f63f4730900
04a03 f4                             hlt        
04a04 48891424                       mov        qword ptr [rsp], rdx
04a08 48897c2408                     mov        qword ptr [rsp + 8], rdi
04a0d e8cecb5407                     call       0x7f63db6e9760
04a12 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04a1c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a20 e85b3d5920                     call       0x7f63f4730900
04a25 f4                             hlt        
04a26 e8b5c25407                     call       0x7f63db6e8e60
04a2b 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04a35 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a39 e8423d5920                     call       0x7f63f4730900
04a3e f4                             hlt        
04a3f e89cc25407                     call       0x7f63db6e8e60
04a44 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04a4e 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a52 e8293d5920                     call       0x7f63f4730900
04a57 f4                             hlt        
04a58 48c7042401000000               mov        qword ptr [rsp], 1
04a60 4c894c2408                     mov        qword ptr [rsp + 8], r9
04a65 e876cb5407                     call       0x7f63db6e9760
04a6a 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04a74 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a78 e8033d5920                     call       0x7f63f4730900
04a7d f4                             hlt        
04a7e 48c7042402000000               mov        qword ptr [rsp], 2
04a86 4c894c2408                     mov        qword ptr [rsp + 8], r9
04a8b e850cb5407                     call       0x7f63db6e9760
04a90 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04a9a 4883e4f0                       and        rsp, 0xfffffffffffffff0
04a9e e8dd3c5920                     call       0x7f63f4730900
04aa3 f4                             hlt        
04aa4 48c7042400000000               mov        qword ptr [rsp], 0
04aac 4c894c2408                     mov        qword ptr [rsp + 8], r9
04ab1 e82acb5407                     call       0x7f63db6e9760
04ab6 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04ac0 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ac4 e8b73c5920                     call       0x7f63f4730900
04ac9 f4                             hlt        
04aca 48c7042401000000               mov        qword ptr [rsp], 1
04ad2 4c894c2408                     mov        qword ptr [rsp + 8], r9
04ad7 e804cb5407                     call       0x7f63db6e9760
04adc 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04ae6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04aea e8913c5920                     call       0x7f63f4730900
04aef f4                             hlt        
04af0 48c7042400000000               mov        qword ptr [rsp], 0
04af8 4c894c2408                     mov        qword ptr [rsp + 8], r9
04afd e8deca5407                     call       0x7f63db6e9760
04b02 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04b0c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b10 e86b3c5920                     call       0x7f63f4730900
04b15 f4                             hlt        
04b16 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
04b20 4c89542408                     mov        qword ptr [rsp + 8], r10
04b25 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b2d e82e6b5407                     call       0x7f63db6e37e0
04b32 e991bdffff                     jmp        0x7f63d4198a48
04b37 e8a4c15407                     call       0x7f63db6e8e60
04b3c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04b46 4883e4f0                       and        rsp, 0xfffffffffffffff0
04b4a e8313c5920                     call       0x7f63f4730900
04b4f f4                             hlt        
04b50 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
04b5a 4c89542408                     mov        qword ptr [rsp + 8], r10
04b5f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b67 e8f46a5407                     call       0x7f63db6e37e0
04b6c e904beffff                     jmp        0x7f63d4198af5
04b71 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04b7b 4c89542408                     mov        qword ptr [rsp + 8], r10
04b80 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04b88 e8d36a5407                     call       0x7f63db6e37e0
04b8d e926beffff                     jmp        0x7f63d4198b38
04b92 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04b9a e841585407                     call       0x7f63db6e2560
04b9f 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04ba9 4883e4f0                       and        rsp, 0xfffffffffffffff0
04bad e8ce3b5920                     call       0x7f63f4730900
04bb2 f4                             hlt        
04bb3 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04bbb e820585407                     call       0x7f63db6e2560
04bc0 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04bca 4883e4f0                       and        rsp, 0xfffffffffffffff0
04bce e8ad3b5920                     call       0x7f63f4730900
04bd3 f4                             hlt        
04bd4 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
04bde 4c89542408                     mov        qword ptr [rsp + 8], r10
04be3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04beb e8706a5407                     call       0x7f63db6e37e0
04bf0 e99cbeffff                     jmp        0x7f63d4198c11
04bf5 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
04bff 4c89542408                     mov        qword ptr [rsp + 8], r10
04c04 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c0c e84f6a5407                     call       0x7f63db6e37e0
04c11 e9b3beffff                     jmp        0x7f63d4198c49
04c16 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
04c20 4c89542408                     mov        qword ptr [rsp + 8], r10
04c25 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c2d e82e6a5407                     call       0x7f63db6e37e0
04c32 e902bfffff                     jmp        0x7f63d4198cb9
04c37 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
04c41 4c89542408                     mov        qword ptr [rsp + 8], r10
04c46 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c4e e80d6a5407                     call       0x7f63db6e37e0
04c53 e919bfffff                     jmp        0x7f63d4198cf1
04c58 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
04c62 4c89542408                     mov        qword ptr [rsp + 8], r10
04c67 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c6f e8ec695407                     call       0x7f63db6e37e0
04c74 e930bfffff                     jmp        0x7f63d4198d29
04c79 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
04c83 4c89542408                     mov        qword ptr [rsp + 8], r10
04c88 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04c90 e8cb695407                     call       0x7f63db6e37e0
04c95 e924c0ffff                     jmp        0x7f63d4198e3e
04c9a 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
04ca4 4c89542408                     mov        qword ptr [rsp + 8], r10
04ca9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cb1 e8aa695407                     call       0x7f63db6e37e0
04cb6 e949c0ffff                     jmp        0x7f63d4198e84
04cbb 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
04cc5 4c89542408                     mov        qword ptr [rsp + 8], r10
04cca 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04cd2 e889695407                     call       0x7f63db6e37e0
04cd7 e960c0ffff                     jmp        0x7f63d4198ebc
04cdc 48890424                       mov        qword ptr [rsp], rax
04ce0 e87b7b5407                     call       0x7f63db6e49e0
04ce5 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04cef 4883e4f0                       and        rsp, 0xfffffffffffffff0
04cf3 e8883a5920                     call       0x7f63f4730900
04cf8 f4                             hlt        
04cf9 e8e2bf5407                     call       0x7f63db6e8e60
04cfe 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04d08 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d0c e86f3a5920                     call       0x7f63f4730900
04d11 f4                             hlt        
04d12 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
04d1c 4c89542408                     mov        qword ptr [rsp + 8], r10
04d21 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d29 e832695407                     call       0x7f63db6e37e0
04d2e e9c7c1ffff                     jmp        0x7f63d419907a
04d33 e8a8bf5407                     call       0x7f63db6e8e60
04d38 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04d42 4883e4f0                       and        rsp, 0xfffffffffffffff0
04d46 e8353a5920                     call       0x7f63f4730900
04d4b f4                             hlt        
04d4c 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
04d56 4c89542408                     mov        qword ptr [rsp + 8], r10
04d5b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d63 e8f8685407                     call       0x7f63db6e37e0
04d68 e955c2ffff                     jmp        0x7f63d4199142
04d6d 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04d77 4c89542408                     mov        qword ptr [rsp + 8], r10
04d7c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04d84 e8d7685407                     call       0x7f63db6e37e0
04d89 e972c2ffff                     jmp        0x7f63d4199180
04d8e 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04d96 e845565407                     call       0x7f63db6e2560
04d9b 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04da5 4883e4f0                       and        rsp, 0xfffffffffffffff0
04da9 e8d2395920                     call       0x7f63f4730900
04dae f4                             hlt        
04daf 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04db7 e824565407                     call       0x7f63db6e2560
04dbc 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04dc6 4883e4f0                       and        rsp, 0xfffffffffffffff0
04dca e8b1395920                     call       0x7f63f4730900
04dcf f4                             hlt        
04dd0 e80bbf5407                     call       0x7f63db6e8e60
04dd5 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04ddf 4883e4f0                       and        rsp, 0xfffffffffffffff0
04de3 e898395920                     call       0x7f63f4730900
04de8 f4                             hlt        
04de9 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
04df3 4c89542408                     mov        qword ptr [rsp + 8], r10
04df8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e00 e85b685407                     call       0x7f63db6e37e0
04e05 e90ac4ffff                     jmp        0x7f63d4199394
04e0a 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
04e14 4c89542408                     mov        qword ptr [rsp + 8], r10
04e19 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e21 e83a685407                     call       0x7f63db6e37e0
04e26 e936c4ffff                     jmp        0x7f63d41993e1
04e2b 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
04e35 4c89542408                     mov        qword ptr [rsp + 8], r10
04e3a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e42 e819685407                     call       0x7f63db6e37e0
04e47 e94dc4ffff                     jmp        0x7f63d4199419
04e4c 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
04e56 4c89542408                     mov        qword ptr [rsp + 8], r10
04e5b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e63 e8f8675407                     call       0x7f63db6e37e0
04e68 e94bc5ffff                     jmp        0x7f63d4199538
04e6d e86ebe5407                     call       0x7f63db6e8e60
04e72 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04e7c 4883e4f0                       and        rsp, 0xfffffffffffffff0
04e80 e8fb385920                     call       0x7f63f4730900
04e85 f4                             hlt        
04e86 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
04e90 4c89542408                     mov        qword ptr [rsp + 8], r10
04e95 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04e9d e8be675407                     call       0x7f63db6e37e0
04ea2 e9bec5ffff                     jmp        0x7f63d41995e5
04ea7 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
04eb1 4c89542408                     mov        qword ptr [rsp + 8], r10
04eb6 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04ebe e89d675407                     call       0x7f63db6e37e0
04ec3 e9d8c5ffff                     jmp        0x7f63d4199620
04ec8 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ed0 e80b555407                     call       0x7f63db6e2560
04ed5 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04edf 4883e4f0                       and        rsp, 0xfffffffffffffff0
04ee3 e898385920                     call       0x7f63f4730900
04ee8 f4                             hlt        
04ee9 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
04ef1 e8ea545407                     call       0x7f63db6e2560
04ef6 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
04f00 4883e4f0                       and        rsp, 0xfffffffffffffff0
04f04 e877385920                     call       0x7f63f4730900
04f09 f4                             hlt        
04f0a 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
04f14 4c89542408                     mov        qword ptr [rsp + 8], r10
04f19 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f21 e83a675407                     call       0x7f63db6e37e0
04f26 e943c6ffff                     jmp        0x7f63d41996ee
04f2b 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
04f35 4c89542408                     mov        qword ptr [rsp + 8], r10
04f3a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f42 e819675407                     call       0x7f63db6e37e0
04f47 e95ac6ffff                     jmp        0x7f63d4199726
04f4c 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
04f56 4c89542408                     mov        qword ptr [rsp + 8], r10
04f5b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f63 e8f8665407                     call       0x7f63db6e37e0
04f68 e993c6ffff                     jmp        0x7f63d4199780
04f6d 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
04f77 4c89542408                     mov        qword ptr [rsp + 8], r10
04f7c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04f84 e8d7665407                     call       0x7f63db6e37e0
04f89 e9aac6ffff                     jmp        0x7f63d41997b8
04f8e 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
04f98 4c89542408                     mov        qword ptr [rsp + 8], r10
04f9d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fa5 e8b6665407                     call       0x7f63db6e37e0
04faa e9c1c6ffff                     jmp        0x7f63d41997f0
04faf 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
04fb9 4c89542408                     mov        qword ptr [rsp + 8], r10
04fbe 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fc6 e895665407                     call       0x7f63db6e37e0
04fcb e9b5c7ffff                     jmp        0x7f63d4199905
04fd0 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
04fda 4c89542408                     mov        qword ptr [rsp + 8], r10
04fdf 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
04fe7 e874665407                     call       0x7f63db6e37e0
04fec e9dac7ffff                     jmp        0x7f63d419994b
04ff1 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
04ffb 4c89542408                     mov        qword ptr [rsp + 8], r10
05000 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05008 e853665407                     call       0x7f63db6e37e0
0500d e9f1c7ffff                     jmp        0x7f63d4199983
05012 48890424                       mov        qword ptr [rsp], rax
05016 e845785407                     call       0x7f63db6e49e0
0501b 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05025 4883e4f0                       and        rsp, 0xfffffffffffffff0
05029 e852375920                     call       0x7f63f4730900
0502e f4                             hlt        
0502f e8acbc5407                     call       0x7f63db6e8e60
05034 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
0503e 4883e4f0                       and        rsp, 0xfffffffffffffff0
05042 e839375920                     call       0x7f63f4730900
05047 f4                             hlt        
05048 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
05052 4c89542408                     mov        qword ptr [rsp + 8], r10
05057 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0505f e8fc655407                     call       0x7f63db6e37e0
05064 e961c9ffff                     jmp        0x7f63d4199b4a
05069 e872bc5407                     call       0x7f63db6e8e60
0506e 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05078 4883e4f0                       and        rsp, 0xfffffffffffffff0
0507c e8ff365920                     call       0x7f63f4730900
05081 f4                             hlt        
05082 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
0508c 4c89542408                     mov        qword ptr [rsp + 8], r10
05091 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05099 e8c2655407                     call       0x7f63db6e37e0
0509e e9efc9ffff                     jmp        0x7f63d4199c12
050a3 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
050ad 4c89542408                     mov        qword ptr [rsp + 8], r10
050b2 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
050ba e8a1655407                     call       0x7f63db6e37e0
050bf e90ccaffff                     jmp        0x7f63d4199c50
050c4 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
050cc e80f535407                     call       0x7f63db6e2560
050d1 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
050db 4883e4f0                       and        rsp, 0xfffffffffffffff0
050df e89c365920                     call       0x7f63f4730900
050e4 f4                             hlt        
050e5 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
050ed e8ee525407                     call       0x7f63db6e2560
050f2 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
050fc 4883e4f0                       and        rsp, 0xfffffffffffffff0
05100 e87b365920                     call       0x7f63f4730900
05105 f4                             hlt        
05106 e8d5bb5407                     call       0x7f63db6e8e60
0510b 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05115 4883e4f0                       and        rsp, 0xfffffffffffffff0
05119 e862365920                     call       0x7f63f4730900
0511e f4                             hlt        
0511f 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
05129 4c89542408                     mov        qword ptr [rsp + 8], r10
0512e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05136 e825655407                     call       0x7f63db6e37e0
0513b e9a4cbffff                     jmp        0x7f63d4199e64
05140 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
0514a 4c89542408                     mov        qword ptr [rsp + 8], r10
0514f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05157 e804655407                     call       0x7f63db6e37e0
0515c e9d0cbffff                     jmp        0x7f63d4199eb1
05161 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
0516b 4c89542408                     mov        qword ptr [rsp + 8], r10
05170 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05178 e8e3645407                     call       0x7f63db6e37e0
0517d e9e7cbffff                     jmp        0x7f63d4199ee9
05182 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
0518c 4c89542408                     mov        qword ptr [rsp + 8], r10
05191 48c704240a020000               mov        qword ptr [rsp], 0x20a
05199 e8c2645407                     call       0x7f63db6e37e0
0519e e98cccffff                     jmp        0x7f63d4199faf
051a3 90                             nop        
051a4 90                             nop        
051a5 90                             nop        
051a6 90                             nop        
051a7 e834695a07                     call       0x7f63db743c60
051ac e960cdffff                     jmp        0x7f63d419a091
051b1 90                             nop        
051b2 90                             nop        
051b3 90                             nop        
051b4 90                             nop        
051b5 90                             nop        
051b6 90                             nop        
051b7 e824695a07                     call       0x7f63db743c60
051bc e9c1ceffff                     jmp        0x7f63d419a202
051c1 49ba684462c8637f0000           movabs     r10, 0x7f63c8624468
051cb 4c89542408                     mov        qword ptr [rsp + 8], r10
051d0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051d8 e883645407                     call       0x7f63db6e37e0
051dd e920cfffff                     jmp        0x7f63d419a282
051e2 49ba184777c8637f0000           movabs     r10, 0x7f63c8774718
051ec 4c89542408                     mov        qword ptr [rsp + 8], r10
051f1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
051f9 e862645407                     call       0x7f63db6e37e0
051fe e9b1cfffff                     jmp        0x7f63d419a334
05203 49ba809e09c8637f0000           movabs     r10, 0x7f63c8099e80
0520d 4c89542408                     mov        qword ptr [rsp + 8], r10
05212 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0521a e841645407                     call       0x7f63db6e37e0
0521f e923d0ffff                     jmp        0x7f63d419a3c7
05224 49baf02278c8637f0000           movabs     r10, 0x7f63c87822f0
0522e 4c89542408                     mov        qword ptr [rsp + 8], r10
05233 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0523b e820645407                     call       0x7f63db6e37e0
05240 e9c5d0ffff                     jmp        0x7f63d419a48a
05245 49ba606b78c8637f0000           movabs     r10, 0x7f63c8786b60
0524f 4c89542408                     mov        qword ptr [rsp + 8], r10
05254 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0525c e8ff635407                     call       0x7f63db6e37e0
05261 e940d1ffff                     jmp        0x7f63d419a526
05266 48890424                       mov        qword ptr [rsp], rax
0526a e8f1755407                     call       0x7f63db6e49e0
0526f 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05279 4883e4f0                       and        rsp, 0xfffffffffffffff0
0527d e8fe345920                     call       0x7f63f4730900
05282 f4                             hlt        
05283 49ba306a78c8637f0000           movabs     r10, 0x7f63c8786a30
0528d 4c89542408                     mov        qword ptr [rsp + 8], r10
05292 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0529a e8c1635407                     call       0x7f63db6e37e0
0529f e9e4d1ffff                     jmp        0x7f63d419a608
052a4 e837ba5407                     call       0x7f63db6e8e60
052a9 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
052b3 4883e4f0                       and        rsp, 0xfffffffffffffff0
052b7 e8c4345920                     call       0x7f63f4730900
052bc f4                             hlt        
052bd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052c5 e816515407                     call       0x7f63db6e2560
052ca 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
052d4 4883e4f0                       and        rsp, 0xfffffffffffffff0
052d8 e8a3345920                     call       0x7f63f4730900
052dd f4                             hlt        
052de 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
052e6 e8f5505407                     call       0x7f63db6e2560
052eb 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
052f5 4883e4f0                       and        rsp, 0xfffffffffffffff0
052f9 e882345920                     call       0x7f63f4730900
052fe f4                             hlt        
052ff 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
05309 4c89542408                     mov        qword ptr [rsp + 8], r10
0530e 48c70424aa020000               mov        qword ptr [rsp], 0x2aa
05316 e845635407                     call       0x7f63db6e37e0
0531b e9d4d2ffff                     jmp        0x7f63d419a774
05320 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
0532a 4c89542408                     mov        qword ptr [rsp + 8], r10
0532f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05337 e824635407                     call       0x7f63db6e37e0
0533c e9b1d3ffff                     jmp        0x7f63d419a872
05341 e89ab95407                     call       0x7f63db6e8e60
05346 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05350 4883e4f0                       and        rsp, 0xfffffffffffffff0
05354 e827345920                     call       0x7f63f4730900
05359 f4                             hlt        
0535a 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
05364 4c89542408                     mov        qword ptr [rsp + 8], r10
05369 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05371 e8ea625407                     call       0x7f63db6e37e0
05376 e920d4ffff                     jmp        0x7f63d419a91b
0537b 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
05385 4c89542408                     mov        qword ptr [rsp + 8], r10
0538a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05392 e8c9625407                     call       0x7f63db6e37e0
05397 e938d4ffff                     jmp        0x7f63d419a954
0539c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
053a4 e837505407                     call       0x7f63db6e2560
053a9 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
053b3 4883e4f0                       and        rsp, 0xfffffffffffffff0
053b7 e8c4335920                     call       0x7f63f4730900
053bc f4                             hlt        
053bd 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
053c5 e816505407                     call       0x7f63db6e2560
053ca 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
053d4 4883e4f0                       and        rsp, 0xfffffffffffffff0
053d8 e8a3335920                     call       0x7f63f4730900
053dd f4                             hlt        
053de 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
053e8 4c89542408                     mov        qword ptr [rsp + 8], r10
053ed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
053f5 e866625407                     call       0x7f63db6e37e0
053fa e9a4d4ffff                     jmp        0x7f63d419aa23
053ff 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
05409 4c89542408                     mov        qword ptr [rsp + 8], r10
0540e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05416 e845625407                     call       0x7f63db6e37e0
0541b e9b6d4ffff                     jmp        0x7f63d419aa56
05420 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
0542a 4c89542408                     mov        qword ptr [rsp + 8], r10
0542f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05437 e824625407                     call       0x7f63db6e37e0
0543c e9f9d4ffff                     jmp        0x7f63d419aaba
05441 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
0544b 4c89542408                     mov        qword ptr [rsp + 8], r10
05450 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05458 e803625407                     call       0x7f63db6e37e0
0545d e913d5ffff                     jmp        0x7f63d419aaf5
05462 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
0546c 4c89542408                     mov        qword ptr [rsp + 8], r10
05471 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05479 e8e2615407                     call       0x7f63db6e37e0
0547e e925d5ffff                     jmp        0x7f63d419ab28
05483 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
0548d 4c89542408                     mov        qword ptr [rsp + 8], r10
05492 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0549a e8c1615407                     call       0x7f63db6e37e0
0549f e914d6ffff                     jmp        0x7f63d419ac38
054a4 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
054ae 4c89542408                     mov        qword ptr [rsp + 8], r10
054b3 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054bb e8a0615407                     call       0x7f63db6e37e0
054c0 e934d6ffff                     jmp        0x7f63d419ac79
054c5 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
054cf 4c89542408                     mov        qword ptr [rsp + 8], r10
054d4 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
054dc e87f615407                     call       0x7f63db6e37e0
054e1 e946d6ffff                     jmp        0x7f63d419acac
054e6 48890424                       mov        qword ptr [rsp], rax
054ea e871735407                     call       0x7f63db6e49e0
054ef 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
054f9 4883e4f0                       and        rsp, 0xfffffffffffffff0
054fd e87e325920                     call       0x7f63f4730900
05502 f4                             hlt        
05503 e8d8b75407                     call       0x7f63db6e8e60
05508 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05512 4883e4f0                       and        rsp, 0xfffffffffffffff0
05516 e865325920                     call       0x7f63f4730900
0551b f4                             hlt        
0551c 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
05526 4c89542408                     mov        qword ptr [rsp + 8], r10
0552b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05533 e828615407                     call       0x7f63db6e37e0
05538 e9b5d7ffff                     jmp        0x7f63d419ae72
0553d 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
05547 4c89542408                     mov        qword ptr [rsp + 8], r10
0554c 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05554 e807615407                     call       0x7f63db6e37e0
05559 e951d8ffff                     jmp        0x7f63d419af2f
0555e 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
05568 4c89542408                     mov        qword ptr [rsp + 8], r10
0556d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05575 e8e6605407                     call       0x7f63db6e37e0
0557a e977d8ffff                     jmp        0x7f63d419af76
0557f 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05587 e8544e5407                     call       0x7f63db6e2560
0558c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05596 4883e4f0                       and        rsp, 0xfffffffffffffff0
0559a e8e1315920                     call       0x7f63f4730900
0559f f4                             hlt        
055a0 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
055a8 e8334e5407                     call       0x7f63db6e2560
055ad 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
055b7 4883e4f0                       and        rsp, 0xfffffffffffffff0
055bb e8c0315920                     call       0x7f63f4730900
055c0 f4                             hlt        
055c1 e81ab75407                     call       0x7f63db6e8e60
055c6 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
055d0 4883e4f0                       and        rsp, 0xfffffffffffffff0
055d4 e8a7315920                     call       0x7f63f4730900
055d9 f4                             hlt        
055da 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
055e4 4c89542408                     mov        qword ptr [rsp + 8], r10
055e9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
055f1 e86a605407                     call       0x7f63db6e37e0
055f6 e909daffff                     jmp        0x7f63d419b184
055fb 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
05605 4c89542408                     mov        qword ptr [rsp + 8], r10
0560a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05612 e849605407                     call       0x7f63db6e37e0
05617 e935daffff                     jmp        0x7f63d419b1d1
0561c 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
05626 4c89542408                     mov        qword ptr [rsp + 8], r10
0562b 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05633 e828605407                     call       0x7f63db6e37e0
05638 e94cdaffff                     jmp        0x7f63d419b209
0563d 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
05647 4c89542408                     mov        qword ptr [rsp + 8], r10
0564c 48c70424e8020000               mov        qword ptr [rsp], 0x2e8
05654 e807605407                     call       0x7f63db6e37e0
05659 e9f4daffff                     jmp        0x7f63d419b2d2
0565e 49ba684462c8637f0000           movabs     r10, 0x7f63c8624468
05668 4c89542408                     mov        qword ptr [rsp + 8], r10
0566d 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05675 e8e65f5407                     call       0x7f63db6e37e0
0567a e9b3dbffff                     jmp        0x7f63d419b3b2
0567f 49ba184777c8637f0000           movabs     r10, 0x7f63c8774718
05689 4c89542408                     mov        qword ptr [rsp + 8], r10
0568e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05696 e8c55f5407                     call       0x7f63db6e37e0
0569b e944dcffff                     jmp        0x7f63d419b464
056a0 49ba809e09c8637f0000           movabs     r10, 0x7f63c8099e80
056aa 4c89542408                     mov        qword ptr [rsp + 8], r10
056af 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
056b7 e8a45f5407                     call       0x7f63db6e37e0
056bc e9b6dcffff                     jmp        0x7f63d419b4f7
056c1 49baf02278c8637f0000           movabs     r10, 0x7f63c87822f0
056cb 4c89542408                     mov        qword ptr [rsp + 8], r10
056d0 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
056d8 e8835f5407                     call       0x7f63db6e37e0
056dd e958ddffff                     jmp        0x7f63d419b5ba
056e2 49ba606b78c8637f0000           movabs     r10, 0x7f63c8786b60
056ec 4c89542408                     mov        qword ptr [rsp + 8], r10
056f1 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
056f9 e8625f5407                     call       0x7f63db6e37e0
056fe e9d3ddffff                     jmp        0x7f63d419b656
05703 48890424                       mov        qword ptr [rsp], rax
05707 e854715407                     call       0x7f63db6e49e0
0570c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05716 4883e4f0                       and        rsp, 0xfffffffffffffff0
0571a e861305920                     call       0x7f63f4730900
0571f f4                             hlt        
05720 49ba306a78c8637f0000           movabs     r10, 0x7f63c8786a30
0572a 4c89542408                     mov        qword ptr [rsp + 8], r10
0572f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05737 e8245f5407                     call       0x7f63db6e37e0
0573c e977deffff                     jmp        0x7f63d419b738
05741 e89ab55407                     call       0x7f63db6e8e60
05746 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05750 4883e4f0                       and        rsp, 0xfffffffffffffff0
05754 e827305920                     call       0x7f63f4730900
05759 f4                             hlt        
0575a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05762 e8794c5407                     call       0x7f63db6e2560
05767 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05771 4883e4f0                       and        rsp, 0xfffffffffffffff0
05775 e806305920                     call       0x7f63f4730900
0577a f4                             hlt        
0577b 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05783 e8584c5407                     call       0x7f63db6e2560
05788 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05792 4883e4f0                       and        rsp, 0xfffffffffffffff0
05796 e8e52f5920                     call       0x7f63f4730900
0579b f4                             hlt        
0579c 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
057a6 4c89542408                     mov        qword ptr [rsp + 8], r10
057ab 48c7042420030000               mov        qword ptr [rsp], 0x320
057b3 e8a85e5407                     call       0x7f63db6e37e0
057b8 e967dfffff                     jmp        0x7f63d419b8a4
057bd 49ba30007ac8637f0000           movabs     r10, 0x7f63c87a0030
057c7 4c89542408                     mov        qword ptr [rsp + 8], r10
057cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
057d4 e8875e5407                     call       0x7f63db6e37e0
057d9 e928e0ffff                     jmp        0x7f63d419b986
057de e8fdb45407                     call       0x7f63db6e8e60
057e3 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
057ed 4883e4f0                       and        rsp, 0xfffffffffffffff0
057f1 e88a2f5920                     call       0x7f63f4730900
057f6 f4                             hlt        
057f7 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
05801 4c89542408                     mov        qword ptr [rsp + 8], r10
05806 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0580e e84d5e5407                     call       0x7f63db6e37e0
05813 e997e0ffff                     jmp        0x7f63d419ba2f
05818 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
05822 4c89542408                     mov        qword ptr [rsp + 8], r10
05827 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
0582f e82c5e5407                     call       0x7f63db6e37e0
05834 e9afe0ffff                     jmp        0x7f63d419ba68
05839 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05841 e89a4b5407                     call       0x7f63db6e2560
05846 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05850 4883e4f0                       and        rsp, 0xfffffffffffffff0
05854 e8272f5920                     call       0x7f63f4730900
05859 f4                             hlt        
0585a 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05862 e8794b5407                     call       0x7f63db6e2560
05867 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05871 4883e4f0                       and        rsp, 0xfffffffffffffff0
05875 e8062f5920                     call       0x7f63f4730900
0587a f4                             hlt        
0587b 49ba800b68c8637f0000           movabs     r10, 0x7f63c8680b80
05885 4c89542408                     mov        qword ptr [rsp + 8], r10
0588a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05892 e8c95d5407                     call       0x7f63db6e37e0
05897 e913e1ffff                     jmp        0x7f63d419bb2f
0589c 49bab07d68c8637f0000           movabs     r10, 0x7f63c8687db0
058a6 4c89542408                     mov        qword ptr [rsp + 8], r10
058ab 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058b3 e8a85d5407                     call       0x7f63db6e37e0
058b8 e925e1ffff                     jmp        0x7f63d419bb62
058bd 49bae05b6bc8637f0000           movabs     r10, 0x7f63c86b5be0
058c7 4c89542408                     mov        qword ptr [rsp + 8], r10
058cc 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058d4 e8875d5407                     call       0x7f63db6e37e0
058d9 e95ce1ffff                     jmp        0x7f63d419bbba
058de 49baf01b7ac8637f0000           movabs     r10, 0x7f63c87a1bf0
058e8 4c89542408                     mov        qword ptr [rsp + 8], r10
058ed 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
058f5 e8665d5407                     call       0x7f63db6e37e0
058fa e971e1ffff                     jmp        0x7f63d419bbf0
058ff 49baa0186bc8637f0000           movabs     r10, 0x7f63c86b18a0
05909 4c89542408                     mov        qword ptr [rsp + 8], r10
0590e 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05916 e8455d5407                     call       0x7f63db6e37e0
0591b e983e1ffff                     jmp        0x7f63d419bc23
05920 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
0592a 4c89542408                     mov        qword ptr [rsp + 8], r10
0592f 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05937 e8245d5407                     call       0x7f63db6e37e0
0593c e972e2ffff                     jmp        0x7f63d419bd33
05941 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
0594b 4c89542408                     mov        qword ptr [rsp + 8], r10
05950 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05958 e8035d5407                     call       0x7f63db6e37e0
0595d e992e2ffff                     jmp        0x7f63d419bd74
05962 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
0596c 4c89542408                     mov        qword ptr [rsp + 8], r10
05971 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05979 e8e25c5407                     call       0x7f63db6e37e0
0597e e9a4e2ffff                     jmp        0x7f63d419bda7
05983 48890424                       mov        qword ptr [rsp], rax
05987 e8d46e5407                     call       0x7f63db6e49e0
0598c 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05996 4883e4f0                       and        rsp, 0xfffffffffffffff0
0599a e8e12d5920                     call       0x7f63f4730900
0599f f4                             hlt        
059a0 e83bb35407                     call       0x7f63db6e8e60
059a5 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
059af 4883e4f0                       and        rsp, 0xfffffffffffffff0
059b3 e8c82d5920                     call       0x7f63f4730900
059b8 f4                             hlt        
059b9 49bab00e7ac8637f0000           movabs     r10, 0x7f63c87a0eb0
059c3 4c89542408                     mov        qword ptr [rsp + 8], r10
059c8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
059d0 e88b5c5407                     call       0x7f63db6e37e0
059d5 e908e4ffff                     jmp        0x7f63d419bf62
059da 49bab8fc6fc8637f0000           movabs     r10, 0x7f63c86ffcb8
059e4 4c89542408                     mov        qword ptr [rsp + 8], r10
059e9 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
059f1 e86a5c5407                     call       0x7f63db6e37e0
059f6 e9a4e4ffff                     jmp        0x7f63d419c01f
059fb 49bae0aa18c8637f0000           movabs     r10, 0x7f63c818aae0
05a05 4c89542408                     mov        qword ptr [rsp + 8], r10
05a0a 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05a12 e8495c5407                     call       0x7f63db6e37e0
05a17 e9cbe4ffff                     jmp        0x7f63d419c067
05a1c 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05a24 e8b7495407                     call       0x7f63db6e2560
05a29 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05a33 4883e4f0                       and        rsp, 0xfffffffffffffff0
05a37 e8442d5920                     call       0x7f63f4730900
05a3c f4                             hlt        
05a3d 48c70424e4ffffff               mov        qword ptr [rsp], 0xffffffffffffffe4
05a45 e896495407                     call       0x7f63db6e2560
05a4a 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05a54 4883e4f0                       and        rsp, 0xfffffffffffffff0
05a58 e8232d5920                     call       0x7f63f4730900
05a5d f4                             hlt        
05a5e e87db25407                     call       0x7f63db6e8e60
05a63 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05a6d 4883e4f0                       and        rsp, 0xfffffffffffffff0
05a71 e80a2d5920                     call       0x7f63f4730900
05a76 f4                             hlt        
05a77 49bab0367ac8637f0000           movabs     r10, 0x7f63c87a36b0
05a81 4c89542408                     mov        qword ptr [rsp + 8], r10
05a86 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05a8e e8cd5b5407                     call       0x7f63db6e37e0
05a93 e95ce6ffff                     jmp        0x7f63d419c274
05a98 49ba10cd45c8637f0000           movabs     r10, 0x7f63c845cd10
05aa2 4c89542408                     mov        qword ptr [rsp + 8], r10
05aa7 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05aaf e8ac5b5407                     call       0x7f63db6e37e0
05ab4 e988e6ffff                     jmp        0x7f63d419c2c1
05ab9 49ba384640c8637f0000           movabs     r10, 0x7f63c8404638
05ac3 4c89542408                     mov        qword ptr [rsp + 8], r10
05ac8 48c70424ffffffff               mov        qword ptr [rsp], 0xffffffffffffffff
05ad0 e88b5b5407                     call       0x7f63db6e37e0
05ad5 e99fe6ffff                     jmp        0x7f63d419c2f9
05ada 49ba001b62c8637f0000           movabs     r10, 0x7f63c8621b00
05ae4 4c89542408                     mov        qword ptr [rsp + 8], r10
05ae9 48c704245a030000               mov        qword ptr [rsp], 0x35a
05af1 e86a5b5407                     call       0x7f63db6e37e0
05af6 e95ae7ffff                     jmp        0x7f63d419c3d5
05afb e8e0b15407                     call       0x7f63db6e8e60
05b00 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05b0a 4883e4f0                       and        rsp, 0xfffffffffffffff0
05b0e e86d2c5920                     call       0x7f63f4730900
05b13 f4                             hlt        
05b14 90                             nop        
05b15 90                             nop        
05b16 90                             nop        
05b17 e8c45f5a07                     call       0x7f63db743c60
05b1c e9b9e8ffff                     jmp        0x7f63d419c55a
05b21 e8bab15407                     call       0x7f63db6e8e60
05b26 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05b30 4883e4f0                       and        rsp, 0xfffffffffffffff0
05b34 e8472c5920                     call       0x7f63f4730900
05b39 f4                             hlt        
05b3a 49ba7ec519d4637f0000           movabs     r10, 0x7f63d419c57e
05b44 4d899778050000                 mov        qword ptr [r15 + 0x578], r10
05b4b e990865a07                     jmp        0x7f63db746360
05b50 48ba0000000000000000           movabs     rdx, 0
05b5a b8000f050a                     mov        eax, 0xa050f00
05b5f e87c3a5407                     call       0x7f63db6e1760
05b64 e9c7e8ffff                     jmp        0x7f63d419c5b0
05b69 e872b15407                     call       0x7f63db6e8e60
05b6e 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05b78 4883e4f0                       and        rsp, 0xfffffffffffffff0
05b7c e8ff2b5920                     call       0x7f63f4730900
05b81 f4                             hlt        
05b82 488bd2                         mov        rdx, rdx
05b85 e856a15407                     call       0x7f63db6e7e60
05b8a e9f4e8ffff                     jmp        0x7f63d419c603
05b8f 48ba0000000000000000           movabs     rdx, 0
05b99 b8000f050a                     mov        eax, 0xa050f00
05b9e e8bd5e5407                     call       0x7f63db6e3be0
05ba3 e9e0e8ffff                     jmp        0x7f63d419c608
05ba8 48ba0000000000000000           movabs     rdx, 0
05bb2 b8000f050a                     mov        eax, 0xa050f00
05bb7 e8243a5407                     call       0x7f63db6e1760
05bbc e95fe9ffff                     jmp        0x7f63d419c6a0
05bc1 e81ab15407                     call       0x7f63db6e8e60
05bc6 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05bd0 4883e4f0                       and        rsp, 0xfffffffffffffff0
05bd4 e8a72b5920                     call       0x7f63f4730900
05bd9 f4                             hlt        
05bda 488bd2                         mov        rdx, rdx
05bdd e8fea05407                     call       0x7f63db6e7e60
05be2 e98ce9ffff                     jmp        0x7f63d419c6f3
05be7 48ba0000000000000000           movabs     rdx, 0
05bf1 b8000f050a                     mov        eax, 0xa050f00
05bf6 e8e5395407                     call       0x7f63db6e1760
05bfb e9c8e9ffff                     jmp        0x7f63d419c748
05c00 e8dbb05407                     call       0x7f63db6e8e60
05c05 48bfa43c33f3637f0000           movabs     rdi, 0x7f63f3333ca4
05c0f 4883e4f0                       and        rsp, 0xfffffffffffffff0
05c13 e8682b5920                     call       0x7f63f4730900
05c18 f4                             hlt        
05c19 488bd2                         mov        rdx, rdx
05c1c e8bfa05407                     call       0x7f63db6e7e60
05c21 e9f5e9ffff                     jmp        0x7f63d419c79b
05c26 498b8708060000                 mov        rax, qword ptr [r15 + 0x608]
05c2d 49c7870806000000000000         mov        qword ptr [r15 + 0x608], 0
05c38 49c7871006000000000000         mov        qword ptr [r15 + 0x610], 0
05c43 4881c4e0020000                 add        rsp, 0x2e0
05c4a 5d                             pop        rbp
05c4b e910c05407                     jmp        0x7f63db6e9de0
